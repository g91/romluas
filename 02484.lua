function LuaS_Z21_TranWorker_ReSetSetp()
	if table.getn(LuaS_Z21_TranWorker.ID)>0 then
		LuaS_Z21_TranWorker.Setp[LuaS_Z21_TranWorker.ID[1]]=1000;
	end
end
function LuaS_Z21_TranWorker_SetSpeak()--押漁貨的保鏢
	local T_ID = TargetID() --工人
	local O_ID = OwnerID() --玩家
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID);
	local QuestID = {424425,424563,424637}		--任務編號
	local Setp = 1000;
	if LuaS_Z21_TranWorker ==nil then
		LuaS_Z21_TranWorker = {ID={},Setp={}};
	end
	if table.getn(LuaS_Z21_TranWorker.ID)>0 then
		Setp = LuaS_Z21_TranWorker.Setp[LuaS_Z21_TranWorker.ID[1]]
		DebugMsg( 0, RoomID ,"Setp..."..Setp);
	end
	local IsAcceptQuest = false;
	for i,v in ipairs(QuestID) do
		if CheckAcceptQuest( O_ID, v ) == true then
			IsAcceptQuest = true;
			break;
		end
	end
	if IsAcceptQuest == true and CheckFlag(O_ID,545536)==false and (Setp > 5 ) then
		SetSpeakDetail( O_ID, "[SC_424425_A]" ) --你準備好了嗎？ (可以演戲情況下 給予告知)
		AddSpeakOption( O_ID, T_ID, "[SC_424425_B]", "LuaS_Z21_TranWorker_Start",0) --我準備好了。 (玩家確定要開始演戲)
	elseif IsAcceptQuest == true and CheckFlag(O_ID,545536)==false then --檢查玩家是否有任務 並且現在是否正在演戲
		SetSpeakDetail( O_ID, "[SC_424425_1]" ) --貨物還在準備中，請稍等一下
	else
		LoadQuestOption( O_ID )
	end
end
function LuaS_Z21_TranWorker_Start()--開始演
	local T_ID = TargetID() --工人
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )--關閉對話視窗
	SetModeEx( T_ID, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( T_ID, EM_SetModeType_Show ,false);
	local NewWorker = CreateObjByObj(106115 ,T_ID);
	WriteRoleValue( NewWorker, EM_RoleValue_PID, T_ID )
	BeginPlot( NewWorker, "LuaS_Z21_TranWorker_Start1", 0 )--執行演戲
end
function LuaS_Z21_TranWorker_Start1()
	local O_ID = OwnerID()
	CallPlot( O_ID, "LuaS_Z21_TranWorker_Move" )
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID);
	local OO = ReadRoleValue( O_ID, EM_RoleValue_PID )
	local Car = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
	MoveToFlagEnabled( O_ID, false );
	local Count = 0;
	local IsAttack =false;
	local Attacktype =2;
	local FlagCount = GetMoveFlagCount ( 781013 );
	DebugMsg( 0, RoomID ,"FlagCount..."..FlagCount.." Car = "..Car);
	table.insert( LuaS_Z21_TranWorker.ID,1,O_ID);
	table.insert( LuaS_Z21_TranWorker.Setp,O_ID,Count);
	AddBuff(O_ID,508176,1,-1);
	while 1 do
		DebugMsg( 0, RoomID ,"Now Setp..."..LuaS_Z21_TranWorker.Setp[O_ID]);
		if Count >= FlagCount then--到終點
			break;
		end
		if (Count == 4 and Attacktype==2) or ( Count == 8 and Attacktype ==1)then
			IsAttack = true;
		end
		if IsAttack == true then--進入攻擊區域
			Car = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
			--裝死
			DebugMsg( 0, RoomID ,"Now Attacking..."..Count);
			NPCSay( O_ID, "[SC_424425_8]")--工人(裝死)：啊！又來了！快裝死！
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_DEAD )
			--貨車被攻擊
			local Monster
			if Count == 4 then
				Monster = Lua_Davis_BornByMultilateral( 105994 , 2 , 100 ,Car)
			else
				Monster = Lua_Davis_BornByMultilateral2( 106073 ,106074, 2 , 100 ,0 ,Car)
			end
			for i,v in ipairs(Monster) do
				SetAttack(v,Car);
				MoveToFlagEnabled(v,false);
			end
			--檢察攻擊者是否消失
			local Dead = table.getn(Monster);
			While Dead > 0 do
				Dead = table.getn(Monster);
				if ReadRoleValue(Car,EM_RoleValue_IsDead)==1 then
					--工人逃跑
					NPCSay( O_ID, "[SC_424425_10]")--工人(爬起)：救命阿!好可怕!
					PlayMotion( O_ID,ruFUSION_ACTORSTATE_NORMAL )
					WriteRoleValue( O_ID, EM_RoleValue_IsWalk, 0 );
					if DW_MoveToFlag( O_ID , 781013 , Count , 0 , 0  )==true then
						--護送結束
						LuaS_Z21_TranWorker.Setp[O_ID] = 1000;
						for i,v in ipairs(LuaS_Z21_TranWorker.ID) do
							if v==O_ID then
								table.remove(LuaS_Z21_TranWorker.ID,i);
								break;
							end
						end
						table.remove(LuaS_Z21_TranWorker.Setp,O_ID);
						SetModeEx( O_ID, EM_SetModeType_Show ,false);
						SetModeEx( OO, EM_SetModeType_Mark , true )		-- 標記
						SetModeEx( OO, EM_SetModeType_Show ,true);
						for i,v in ipairs(Monster) do
							WriteRoleValue( v, EM_RoleValue_LiveTime, 1 )
						end
						return
					end
				end
				for i,v in ipairs(Monster) do
					if (ReadRoleValue(v,EM_RoleValue_IsDead)==1 or CheckID(v)==false) then
						Dead = Dead -1;
					end
				end
				DebugMsg( 0, RoomID ,"Now Dead..."..Dead);
				Sleep(10);
			end
			Sleep(50)
			--離開攻擊狀態
			NPCSay( O_ID, "[SC_424425_9]")--工人(爬起)：安全了?那我們繼續走
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_SLEEP_END )
			DebugMsg( 0, RoomID ,"End Attacking..."..Count);
			IsAttack = false;
			Attacktype = Attacktype -1;
		else
			DebugMsg( 0, RoomID ,"Now Go to Flag..."..Count);
			--繼續走
			if DW_MoveToFlag( O_ID , 781013 , Count , 0 , 0  )==true then
				Count = Count +1;
				LuaS_Z21_TranWorker.Setp[O_ID] = Count;
			end
		end
		Sleep(10);
	end
	--到終點演戲
	DebugMsg( 0, RoomID ,"Now Showing...");
	Sleep(20)
	local finNPC = 0;--安菲特里
	local NPC = SearchRangeNPC(O_ID , 250 )
	for i=0 , table.getn(NPC) do
		if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID) == 119234 then
			finNPC = NPC[i];
		end
	end

	--給旗標
	local player = SearchRangePlayer(O_ID , 250)
	local QuestID = {424425,424563,424637}		--任務編號
	for i=0, table.getn(player)-1 do
		DebugMsg( 0, RoomID ,"player..."..player[i]);
		for k,v in ipairs(QuestID) do
			if CheckAcceptQuest( player[i], v ) == true and CheckFlag(player[i],545536)==false then
				SetFlag( player[i], 545536, 1 )
				DebugMsg( 0, RoomID ," right player..."..player[i]);
			end
		end
	end
	--開始演戲
	local RR = math.random(2);
	if RR == 1 then
		NPCSay( O_ID, "[SC_424425_2]")--工人(揮手)：我帶海洋之心和漁貨來囉！
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(20)
		NPCSay( finNPC, "[SC_424425_3]")--安菲特里(說話)：辛苦啦！這是約定好的價錢，還有我們自己做的肉乾，辛苦你跑這一趟了！
		PlayMotion( finNPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(30)
		NPCSay( O_ID, "[SC_424425_4]")--工人(鼓掌)：哎呀！您真是太客氣了，那我就收下啦！
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		Sleep(20)
	else
		NPCSay( O_ID, "[SC_424425_5]")--工人(勝利)：啊哈！終於活著送到了！
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		Sleep(20)
		NPCSay( finNPC, "[SC_424425_6]")--安菲特里(說話)：最近這裡真是不太平靜啊！辛苦了，要不要來點我們做的肉乾？
		PlayMotion( finNPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(30)
		NPCSay( O_ID, "[SC_424425_7]")--工人(說話)：你倒提醒我了，剛被這麼一嚇，肚子都餓啦！
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(30)
	end

	DebugMsg( 0, RoomID ,"Ending...");
	for i,v in ipairs(LuaS_Z21_TranWorker.ID) do
		if v==O_ID then
			table.remove(LuaS_Z21_TranWorker,i);
			break;
		end
	end
	table.remove(LuaS_Z21_TranWorker.Setp,O_ID);
	SetModeEx( OO, EM_SetModeType_Mark , true )		-- 標記
	SetModeEx( OO, EM_SetModeType_Show ,true);
	SetModeEx( O_ID, EM_SetModeType_Show ,false);
end

function LuaS_Z21_GoodCar_Move(Horse)--貨車移動
	local Obj = OwnerID();
	local Dis,X,Y,Z
	while	true	do
		Dis = GetDistance(Obj,Horse);
		X=ReadRoleValue(Horse,EM_RoleValue_X);
		Y=ReadRoleValue(Horse,EM_RoleValue_Y);
		Z=ReadRoleValue(Horse,EM_RoleValue_Z);
		if	Dis>20	then
			SetModeEx( Obj , EM_SetModeType_Move , true )		-- 移動
			MoveDirect( Obj, X , Y , Z );
		else
			SetModeEx( Obj , EM_SetModeType_Move , false )		-- 移動
			StopMove(Obj,true);
		end
		sleep(2);
	end
end
function LuaS_Z21_TranWorker_Move()--白馬移動
	local NewWorker = OwnerID();
	local OO = ReadRoleValue( NewWorker, EM_RoleValue_PID )
	local OrgID = ReadRoleValue( NewWorker, EM_RoleValue_OrgID )
	local BaseX = ReadRoleValue( NewWorker, EM_RoleValue_X )
	local BaseY = ReadRoleValue( NewWorker, EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( NewWorker, EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( NewWorker, EM_RoleValue_Dir )
	
	local X = ReadRoleValue( NewWorker, EM_RoleValue_X )
	local Y = ReadRoleValue( NewWorker, EM_RoleValue_Y )
	local Z = ReadRoleValue( NewWorker, EM_RoleValue_Z )
	local Dir = ReadRoleValue( NewWorker, EM_RoleValue_Dir )-180--徑度
	if Dir > 360 then Dir = Dir -360
	elseif Dir < 0 then Dir = Dir +360 end
	local radian = (math.pi/180)*Dir;
	local X = X  +30*math.cos(radian);
	local Z = Z - 30*math.sin(radian);

	local Horse = CreateObj( 106047, X, Y, Z, 0, 1 )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( NewWorker, EM_RoleValue_Register3, Horse )
	SetModeEx( Horse, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Horse, EM_SetModeType_Fight , false )		-- 可砍殺攻擊
	SetModeEx( Horse, EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Horse, EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	SetModeEx( Horse, EM_SetModeType_Mark , false )		-- 標記
	SetModeEx( Horse, EM_SetModeType_HideName , true )	-- 名稱
	SetModeEx( Horse, EM_SetModeType_Move , true )		-- 移動
	SetModeEx( Horse, EM_SetModeType_NotShowHPMP, true )	-- HP
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( Horse,EM_RoleValue_PassengerAttackable,1 )--乘客可以被打
	MoveToFlagEnabled( Horse, false )
	AddToPartition( Horse, 0 )
	AddBuff(Horse,508176,2,-1);
	local Car = LuaFunc_CreateObjByObj( 106116, Horse )
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( NewWorker, EM_RoleValue_Register2, Car )
	SetModeEx( Car, EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Car, EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Car, EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( Car, EM_SetModeType_Fight , true )		-- 可砍殺攻擊
	SetModeEx( Car, EM_SetModeType_Mark , true )		-- 標記
	SetModeEx( Car, EM_SetModeType_HideName , true )		-- 名稱
	SetModeEx( Car, EM_SetModeType_Move , true )		-- 移動
	SetModeEx( Car, EM_SetModeType_NotShowHPMP, false )	-- HP
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 1 );
	MoveToFlagEnabled( Car, false );
	AddBuff(Car,506984,0,-1);
	CallPlot(Car,"LuaS_Z21_GoodCar_Move",Horse);
	--AttachObj( Car , Horse , 1 ,"p_hit_point02","p_hit_point01" )
	
--	local vDis = GetDistance(NewWorker, NewWorker )+15
--	local hDis = GetDistance(NewWorker, Horse )+20
	
	while true do
		Sleep(10)
		if ReadRoleValue( NewWorker, EM_RoleValue_IsWalk ) ~= ReadRoleValue( Horse, EM_RoleValue_IsWalk ) then
			WriteRoleValue( Horse, EM_RoleValue_IsWalk, ReadRoleValue( NewWorker, EM_RoleValue_IsWalk ) )
			WriteRoleValue( Car, EM_RoleValue_IsWalk, ReadRoleValue( NewWorker, EM_RoleValue_IsWalk ) )
		end
		if GetModeEX( NewWorker, EM_SetModeType_Show ) == false then --刪除
			DelObj(Horse)
			DelObj(Car)
			DelObj(NewWorker)
			return
		end
		
		if GetModeEX( NewWorker, EM_SetModeType_Move ) == true and GetDistance( Horse, NewWorker ) > 30 then
		--	if GetDistance(NewWorker, NewWorker ) > vDis then
		--		WriteRoleValue( NewWorker, EM_RoleValue_IsWalk, 0 )
		--	else
		--		WriteRoleValue( NewWorker, EM_RoleValue_IsWalk, 1 )
		--	end
			
--			if GetDistance(NewWorker, Horse ) > hDis then
--				WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
--			else
--				WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
--			end
			
			X = ReadRoleValue( NewWorker, EM_RoleValue_X )
			Y = ReadRoleValue( NewWorker, EM_RoleValue_Y )
			Z = ReadRoleValue( NewWorker, EM_RoleValue_Z )
			Dir = ReadRoleValue( NewWorker, EM_RoleValue_Dir )-90--徑度
			
		--	if Dir > 360 then Dir = Dir -360
		--	elseif Dir < 0 then Dir = Dir +360 end
						
		--	radian = (math.pi/180)*Dir;
		--	local Vx = X  +20*math.cos(radian);
		--	local Vz = Z - 20*math.sin(radian);			
		--	MoveDirect( NewWorker, Vx, Y, Vz )
			
			Dir = Dir -90
			if Dir > 360 then Dir = Dir -360
			elseif Dir < 0 then Dir = Dir +360 end
			
			radian = (math.pi/180)*Dir;
			local Hx = X  +20*math.cos(radian);
			local Hz = Z - 20*math.sin(radian);
			MoveDirect( Horse, Hx, Y, Hz )

		else
		--	StopMove( NewWorker, true )
			StopMove( Horse, true )
			if GetDistance( Horse, Car ) > 20 then
				X = ReadRoleValue( Horse, EM_RoleValue_X )
				Y = ReadRoleValue( Horse, EM_RoleValue_Y )
				Z = ReadRoleValue( Horse, EM_RoleValue_Z )
				Dir = ReadRoleValue( Horse, EM_RoleValue_Dir )--徑度
				
				local cDir = Dir - -180
				if cDir > 360 then cDir = cDir -360
				elseif cDir < 0 then cDir = cDir +360 end
			
				radian = (math.pi/180)*cDir;
				X = X  +25*math.cos(radian);
				Z = Z - 25*math.sin(radian);
				SetPos( Car, X, Y, Z, Dir )
			end
		end
	end
end
function LuaS_Z21_CoLowEatCheck()
--	Say(OwnerID(),"O")
--	Say(TargetID(),"T")
	local OrgID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	if  OrgID == 106077 and CheckBuff(TargetID(),620919)==false then
		--DebugMsg( 0, 0 ,"true...");
		return true
	end
--	DebugMsg( 0, 0 ,"false..."..OrgID);
	return false
end
function LuaS_Z21_CoLowEat()
	--Killid(TargetID(),OwnerID());
	BeginPlot(TargetID(),"LuaS_Z21_CoLowAI",0)
	MagicInterrupt(OwnerID());
end
function LuaS_Z21_CoLowAI()
--	Say(OwnerID(),"O")
--	Say(TargetID(),"T")
	local O_ID = OwnerID();
	local T_ID = TargetID();
	local player = ReadRoleValue(T_ID,EM_RoleValue_OwnerGUID)
--	Say(player,"player")
	if Lua_Davis_MovetoObj(O_ID,T_ID,10)==true then
		AdjustFaceDir( O_ID, T_ID, 0 ) 
		Sleep(5)
		PlayMotion( O_ID, 81);
		Sleep(50)
		PlayMotion( O_ID, 120);
		Killid(O_ID,T_ID);
		AddBuff(O_ID,620919,0,30);
		ks_QuestKill( player, 106117, 1 )
	end
end

-----------------------------移動至和目標的指定距離後停下來------------------------
function Lua_Davis_MovetoObj(Obj,Target,Dis,face)
------------------------------------------------------------------------------------
	local Org = Role:new( Obj  )
	local Tar = Role:new( Target  )
	local Pos = {}
	local Dir = Org:Dir()
	local Cal
	local FullDis = ((Tar:X()-Org:X())^2+(Tar:Z()-Org:Z())^2)^0.5
--	DebugMsg( 0, RoomID ,"FullDis..."..FullDis);
	if face == nil or Type( face) ~= "number" then
		face = 0
	end
	if FullDis< Dis then--你已經很太近了= =....
		return true
	end
	Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = Tar:X()-(Tar:X()-Org:X())*Dis/FullDis
	Pos["Z"] = Tar:Z()-(Tar:Z()-Org:Z())*Dis/FullDis
	Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] );
	if Dis >= 0 then
		Dir = Dir +180-face
	else
		Dir = Dir + face
	end
	if Dir > 360 then
		Dir = Dir - 360
	end
	if Dir < 0 then
		Dir = Dir + 360
	end
--	local NewRole = CreateObj ( 100292 , Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir , 1)
--	AddToPartition(NewRole,0)
--	WriteRoleValue( NewRole, EM_RoleValue_LiveTime, 1 )
	return DW_WaitMoveTo( Obj , Pos["X"] , Pos["Y"]  , Pos["Z"] )
end