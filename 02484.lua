function LuaS_Z21_TranWorker_ReSetSetp()
	if table.getn(LuaS_Z21_TranWorker.ID)>0 then
		LuaS_Z21_TranWorker.Setp[LuaS_Z21_TranWorker.ID[1]]=1000;
	end
end
function LuaS_Z21_TranWorker_SetSpeak()--�㺮�f���O��
	local T_ID = TargetID() --�u�H
	local O_ID = OwnerID() --���a
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID);
	local QuestID = {424425,424563,424637}		--���Ƚs��
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
		SetSpeakDetail( O_ID, "[SC_424425_A]" ) --�A�ǳƦn�F�ܡH (�i�H�t�����p�U �����i��)
		AddSpeakOption( O_ID, T_ID, "[SC_424425_B]", "LuaS_Z21_TranWorker_Start",0) --�ڷǳƦn�F�C (���a�T�w�n�}�l�t��)
	elseif IsAcceptQuest == true and CheckFlag(O_ID,545536)==false then --�ˬd���a�O�_������ �åB�{�b�O�_���b�t��
		SetSpeakDetail( O_ID, "[SC_424425_1]" ) --�f���٦b�ǳƤ��A�еy���@�U
	else
		LoadQuestOption( O_ID )
	end
end
function LuaS_Z21_TranWorker_Start()--�}�l�t
	local T_ID = TargetID() --�u�H
	local O_ID = OwnerID() --���a
	CloseSpeak( OwnerID() )--������ܵ���
	SetModeEx( T_ID, EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( T_ID, EM_SetModeType_Show ,false);
	local NewWorker = CreateObjByObj(106115 ,T_ID);
	WriteRoleValue( NewWorker, EM_RoleValue_PID, T_ID )
	BeginPlot( NewWorker, "LuaS_Z21_TranWorker_Start1", 0 )--����t��
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
		if Count >= FlagCount then--����I
			break;
		end
		if (Count == 4 and Attacktype==2) or ( Count == 8 and Attacktype ==1)then
			IsAttack = true;
		end
		if IsAttack == true then--�i�J�����ϰ�
			Car = ReadRoleValue( O_ID, EM_RoleValue_Register2 )
			--�˦�
			DebugMsg( 0, RoomID ,"Now Attacking..."..Count);
			NPCSay( O_ID, "[SC_424425_8]")--�u�H(�˦�)�G�ڡI�S�ӤF�I�ָ˦��I
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_DEAD )
			--�f���Q����
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
			--�˹�����̬O�_����
			local Dead = table.getn(Monster);
			While Dead > 0 do
				Dead = table.getn(Monster);
				if ReadRoleValue(Car,EM_RoleValue_IsDead)==1 then
					--�u�H�k�]
					NPCSay( O_ID, "[SC_424425_10]")--�u�H(���_)�G�ϩR��!�n�i��!
					PlayMotion( O_ID,ruFUSION_ACTORSTATE_NORMAL )
					WriteRoleValue( O_ID, EM_RoleValue_IsWalk, 0 );
					if DW_MoveToFlag( O_ID , 781013 , Count , 0 , 0  )==true then
						--�@�e����
						LuaS_Z21_TranWorker.Setp[O_ID] = 1000;
						for i,v in ipairs(LuaS_Z21_TranWorker.ID) do
							if v==O_ID then
								table.remove(LuaS_Z21_TranWorker.ID,i);
								break;
							end
						end
						table.remove(LuaS_Z21_TranWorker.Setp,O_ID);
						SetModeEx( O_ID, EM_SetModeType_Show ,false);
						SetModeEx( OO, EM_SetModeType_Mark , true )		-- �аO
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
			--���}�������A
			NPCSay( O_ID, "[SC_424425_9]")--�u�H(���_)�G�w���F?���ڭ��~��
			PlayMotion( O_ID,ruFUSION_ACTORSTATE_SLEEP_END )
			DebugMsg( 0, RoomID ,"End Attacking..."..Count);
			IsAttack = false;
			Attacktype = Attacktype -1;
		else
			DebugMsg( 0, RoomID ,"Now Go to Flag..."..Count);
			--�~��
			if DW_MoveToFlag( O_ID , 781013 , Count , 0 , 0  )==true then
				Count = Count +1;
				LuaS_Z21_TranWorker.Setp[O_ID] = Count;
			end
		end
		Sleep(10);
	end
	--����I�t��
	DebugMsg( 0, RoomID ,"Now Showing...");
	Sleep(20)
	local finNPC = 0;--�w��S��
	local NPC = SearchRangeNPC(O_ID , 250 )
	for i=0 , table.getn(NPC) do
		if ReadRoleValue(NPC[i] , EM_RoleValue_OrgID) == 119234 then
			finNPC = NPC[i];
		end
	end

	--���X��
	local player = SearchRangePlayer(O_ID , 250)
	local QuestID = {424425,424563,424637}		--���Ƚs��
	for i=0, table.getn(player)-1 do
		DebugMsg( 0, RoomID ,"player..."..player[i]);
		for k,v in ipairs(QuestID) do
			if CheckAcceptQuest( player[i], v ) == true and CheckFlag(player[i],545536)==false then
				SetFlag( player[i], 545536, 1 )
				DebugMsg( 0, RoomID ," right player..."..player[i]);
			end
		end
	end
	--�}�l�t��
	local RR = math.random(2);
	if RR == 1 then
		NPCSay( O_ID, "[SC_424425_2]")--�u�H(����)�G�ڱa���v���ߩM���f���o�I
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_WAVE )
		Sleep(20)
		NPCSay( finNPC, "[SC_424425_3]")--�w��S��(����)�G���W�աI�o�O���w�n�������A�٦��ڭ̦ۤv�����װ��A���W�A�]�o�@��F�I
		PlayMotion( finNPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(30)
		NPCSay( O_ID, "[SC_424425_4]")--�u�H(���x)�G�u�r�I�z�u�O�ӫȮ�F�A���ڴN���U�աI
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )
		Sleep(20)
	else
		NPCSay( O_ID, "[SC_424425_5]")--�u�H(�ӧQ)�G�ګ��I�ש󬡵۰e��F�I
		PlayMotion( O_ID,ruFUSION_ACTORSTATE_EMOTE_VICTORY )
		Sleep(20)
		NPCSay( finNPC, "[SC_424425_6]")--�w��S��(����)�G�̪�o�̯u�O���ӥ��R�ڡI���W�F�A�n���n���I�ڭ̰����װ��H
		PlayMotion( finNPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		Sleep(30)
		NPCSay( O_ID, "[SC_424425_7]")--�u�H(����)�G�A�˴����ڤF�A��Q�o��@�~�A�{�l���j�աI
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
	SetModeEx( OO, EM_SetModeType_Mark , true )		-- �аO
	SetModeEx( OO, EM_SetModeType_Show ,true);
	SetModeEx( O_ID, EM_SetModeType_Show ,false);
end

function LuaS_Z21_GoodCar_Move(Horse)--�f������
	local Obj = OwnerID();
	local Dis,X,Y,Z
	while	true	do
		Dis = GetDistance(Obj,Horse);
		X=ReadRoleValue(Horse,EM_RoleValue_X);
		Y=ReadRoleValue(Horse,EM_RoleValue_Y);
		Z=ReadRoleValue(Horse,EM_RoleValue_Z);
		if	Dis>20	then
			SetModeEx( Obj , EM_SetModeType_Move , true )		-- ����
			MoveDirect( Obj, X , Y , Z );
		else
			SetModeEx( Obj , EM_SetModeType_Move , false )		-- ����
			StopMove(Obj,true);
		end
		sleep(2);
	end
end
function LuaS_Z21_TranWorker_Move()--�հ�����
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
	local Dir = ReadRoleValue( NewWorker, EM_RoleValue_Dir )-180--�|��
	if Dir > 360 then Dir = Dir -360
	elseif Dir < 0 then Dir = Dir +360 end
	local radian = (math.pi/180)*Dir;
	local X = X  +30*math.cos(radian);
	local Z = Z - 30*math.sin(radian);

	local Horse = CreateObj( 106047, X, Y, Z, 0, 1 )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( NewWorker, EM_RoleValue_Register3, Horse )
	SetModeEx( Horse, EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Horse, EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( Horse, EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Horse, EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( Horse, EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Horse, EM_SetModeType_HideName , true )	-- �W��
	SetModeEx( Horse, EM_SetModeType_Move , true )		-- ����
	SetModeEx( Horse, EM_SetModeType_NotShowHPMP, true )	-- HP
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( Horse,EM_RoleValue_PassengerAttackable,1 )--���ȥi�H�Q��
	MoveToFlagEnabled( Horse, false )
	AddToPartition( Horse, 0 )
	AddBuff(Horse,508176,2,-1);
	local Car = LuaFunc_CreateObjByObj( 106116, Horse )
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 1 )
	WriteRoleValue( NewWorker, EM_RoleValue_Register2, Car )
	SetModeEx( Car, EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Car, EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Car, EM_SetModeType_ShowRoleHead , true )	-- �Y����
	SetModeEx( Car, EM_SetModeType_Fight , true )		-- �i�������
	SetModeEx( Car, EM_SetModeType_Mark , true )		-- �аO
	SetModeEx( Car, EM_SetModeType_HideName , true )		-- �W��
	SetModeEx( Car, EM_SetModeType_Move , true )		-- ����
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
		if GetModeEX( NewWorker, EM_SetModeType_Show ) == false then --�R��
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
			Dir = ReadRoleValue( NewWorker, EM_RoleValue_Dir )-90--�|��
			
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
				Dir = ReadRoleValue( Horse, EM_RoleValue_Dir )--�|��
				
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

-----------------------------���ʦܩM�ؼЪ����w�Z���ᰱ�U��------------------------
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
	if FullDis< Dis then--�A�w�g�ܤӪ�F= =....
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