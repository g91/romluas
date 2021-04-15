function Lua_Z23_Queen_Resources()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID);
	local level = ReadRoleValue(Ctrl,EM_RoleValue_PID);
	--宣告所有全域變數(勿動)
	if Lua_Z23_Queen_Globel==nil then--假如沒有全域變數
		Lua_Z23_Queen_Globel={};
		Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
	else
		if Lua_Z23_Queen_Globel[RoomID] == nil then--假如此ROOM變數
			Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
		else--此ROOM已經有變數
			Lua_Z23_Queen_ResetAll();
			Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
		end
	end
	local Globel = Lua_Z23_Queen_Globel[RoomID];--縮短變數名稱方便下方宣告變數
	--宣告法術資訊
	Globel["Magic"]={};
	if level == 0 then--困難
		Globel["Magic"][1] = {498454,29};	--前方扇形
		Globel["Magic"][2] = {498455,3};	--單體補血
		Globel["Magic"][3] = {498456,99};	--召喚後傷害
		Globel["Magic"][4] = {498457,6};	--直線傷害
		Globel["Magic"][5] = {498458,0};	--引導動作
		Globel["Magic"][6] = {498469,9};	--衝鋒
		Globel["Magic"][7] = {498470,5};	--小範圍
		Globel["Magic"][8] = {498471,0};	--物理禁制
		Globel["Magic"][9] = {498472,200};	--火球術
		Globel["Magic"][10] = {498473,250};	--前方扇形
		Globel["Magic"][11] = {498474,0};	--沉默術

	elseif level == 1 then--普通
		Globel["Magic"][1] = {498454,15};	--前方扇形
		Globel["Magic"][2] = {498455,0};	--單體補血
		Globel["Magic"][3] = {498456,50};	--召喚後傷害
		Globel["Magic"][4] = {498457,0};	--直線傷害
		Globel["Magic"][5] = {498458,0};	--引導動作
		Globel["Magic"][6] = {498469,0};	--衝鋒
		Globel["Magic"][7] = {498470,0};	--小範圍
		Globel["Magic"][8] = {498471,0};	--物理禁制
		Globel["Magic"][9] = {498472,100};	--火球術
		Globel["Magic"][10] = {498473,150};	--前方扇形
		Globel["Magic"][11] = {498474,0};	--沉默術
	elseif level == 2 then--簡單
		Globel["Magic"][1] = {498454,5};	--前方扇形
		Globel["Magic"][2] = {498455,0};	--單體補血
		Globel["Magic"][3] = {498456,30};	--召喚後傷害
		Globel["Magic"][4] = {498457,0};	--直線傷害
		Globel["Magic"][5] = {498458,0};	--引導動作
		Globel["Magic"][6] = {498469,0};	--衝鋒
		Globel["Magic"][7] = {498470,0};	--小範圍
		Globel["Magic"][8] = {498471,0};	--物理禁制
		Globel["Magic"][9] = {498472,10};	--火球術
		Globel["Magic"][10] = {498473,15};	--前方扇形
		Globel["Magic"][11] = {498474,0};	--沉默術
	else
		DebugMsg( 0, RoomID ,"PID is Error...Please Check the PID");
		return false;--回傳錯誤停止控制器運作
	end
	return Globel;--回傳全域變數給控制器
end
function Lua_Z23_Queen_Npc_Table(Value) --Lua_Z23_Queen_Npc_Table("A_Big_Ant")
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local NpcTable = {}
	NpcTable[146] = {}
	NpcTable[146]["BossID"] = 106300 --新蟻后貝琳琴
	NpcTable[146]["M_Young_Ant"] = 106302 --噬法幼蟻
	NpcTable[146]["A_Young_Ant"] = 106301 --鐵壁幼蟻
	NpcTable[146]["M_Egg_Ant"] = 106304 --噬法蟻蛹
	NpcTable[146]["A_Egg_Ant"] = 106303 --鐵壁蟻蛹
	NpcTable[146]["M_Big_Ant"] = 106305 --噬法工蟻
	NpcTable[146]["A_Big_Ant"] = 106306 --鐵壁工蟻
	
	NpcTable[147] = {}
	NpcTable[147]["BossID"] = 106656 --新蟻后貝琳琴
	NpcTable[147]["M_Young_Ant"] = 106658 --噬法幼蟻
	NpcTable[147]["A_Young_Ant"] = 106657 --鐵壁幼蟻
	NpcTable[147]["M_Egg_Ant"] = 107231 --噬法蟻蛹
	NpcTable[147]["A_Egg_Ant"] = 107230 --鐵壁蟻蛹
	NpcTable[147]["M_Big_Ant"] = 107232 --噬法工蟻
	NpcTable[147]["A_Big_Ant"] = 107233 --鐵壁工蟻
	
	NpcTable[148] = {}
	NpcTable[148]["BossID"] = 107234 --新蟻后貝琳琴
	NpcTable[148]["M_Young_Ant"] = 107236 --噬法幼蟻
	NpcTable[148]["A_Young_Ant"] = 107235 --鐵壁幼蟻
	NpcTable[148]["M_Egg_Ant"] = 107238 --噬法蟻蛹
	NpcTable[148]["A_Egg_Ant"] = 107237 --鐵壁蟻蛹
	NpcTable[148]["M_Big_Ant"] = 107239 --噬法工蟻
	NpcTable[148]["A_Big_Ant"] = 107240 --鐵壁工蟻
	return NpcTable[ZoneID][Value]
end
function Lua_Z23_Queen_Ctrl()
	local Globel = Lua_Z23_Queen_Resources();--設定區域資源
	if Globel == false then
		return;--全域變數錯誤停止控制器運作
	end
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID);
	local Distane = 800;--最遠距離
	local Boss = CreateObjByFlag ( Lua_Z23_Queen_Npc_Table("BossID") , 781029, 0 ,1 );
	SetPlot(Boss,"dead","Lua_Z23_Queen_Event_Dead",0)
	AddToPartition(Boss,RoomID);
	Globel.Boss = Boss;
	WriteRoleValue(Boss,EM_RoleValue_PID,ReadRoleValue(Ctrl,EM_RoleValue_PID));
	BeginPlot( Globel.Boss, "Lua_Z23_Queen_Move",0);
	Lua_Z23_Queen_Door();
	local Fight;
	local Dis = 0;
	local Msg = "";
	local NewMsg = "";
	while 1 do
		Fight = ReadRoleValue(Boss,EM_RoleValue_Register1);
		if Globel.Step == "Dead" then--王趴ㄌ
			break;
		else
			NewMsg = " Fight = "..Fight.." Step = "..Globel.Step
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
			if Globel.Step == "Reset" then--重置
				Sleep(20);
				Globel.Step = "Nomal";
			end
			Dis = kg_GetDis(Boss,781029,0);
			if Dis >=Distane then
				DebugMsg( 0, RoomID ,"Dis"..Dis);
				KS_ScriptMessage("[SC_Z23_QUEEN_TOOFAR]");
				Lua_Z23_Queen_ResetObj();
			end
		end
		Sleep(10);
	end
end
function Lua_Z23_Queen_Door()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ExitDoor = 0;
	if Lua_Z23_Queen_Globel[RoomID].Door == 0 then
		ExitDoor = CreateObjByFlag( 106012, 781029 , 2 , 1 )--出口阻擋門
		Lua_Z23_Queen_Globel[RoomID].Door = ExitDoor;
		kg_DoorInit( ExitDoor );
		AddToPartition( ExitDoor , RoomID );
	end
	CallPlot( ExitDoor, "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss )
end
function Lua_Z23_Queen_ResetAll()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Z23_Queen_Globel[RoomID];
	if Globel.Door~=0 then
		DelObj(Globel.Door);--刪掉門
	end
	if Globel.Boss ~= 0 then
		DelObj(Globel.Boss);
	end
end
function Lua_Z23_Queen_ResetObj()--重置物件劇情
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Z23_Queen_Globel[RoomID];
	if Globel.Boss ~= 0 then
		if Globel.Step ~= "Dead" then
			CallPlot( Lua_Z23_Queen_Globel[RoomID].Door, "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss )--開門
			Globel.Step = "Reset";
			SetModeEx(  Globel.Boss, EM_SetModeType_Show, false );--顯示
			Lua_CancelAllBuff( Globel.Boss ); --清除所有buff
			-- 設定消失
			DelFromPartition( Globel.Boss);
			-- 重設NPC資料
			Sleep( 50 );
			-- 重新加入分割區
			SetModeEx(  Globel.Boss, EM_SetModeType_Show, true );--顯示
			AddToPartition( Globel.Boss, RoomID );
			SetPosByFlag( Globel.Boss , 781029 , 0 )
			BeginPlot( Globel.Boss, "Lua_Z23_Queen_Move",0);
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Z23_Queen_Event_BeginAttack()--進入戰鬥事件
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	Cl_Resist_HackersFightBegin()
	local CrazedTime = {}
	CrazedTime[146] = 480
	CrazedTime[147] = 360
	CrazedTime[148] = 0
	WriteRoleValue(Boss,EM_RoleValue_Register1,1) --開始戰鬥
	KS_ScriptMessage("[SC_Z23_QUEEN_START]");
	MoveToFlagEnabled(Boss,false);
	AddBuff(Boss,506700,0,-1);
	BeginPlot(Boss,"Lua_Z23_Queen_Ai",0);
	CallPlot( Boss , "Cl_Z23_Queen_CrazedTime", CrazedTime[ZoneID] )
	CallPlot( Lua_Z23_Queen_Globel[RoomID].Door, "Lua_CloseDoor", true,Lua_Z23_Queen_Globel[RoomID].Boss )
end
function Cl_Z23_Queen_CrazedTime( Time )
	if Time ~= 0 then
		while true do
			sleep ( 10 )
			Time = Time - 1
			DebugMsg( 0 , 0 , "Time="..Time )
			if Time <= 0 then
				ScriptMessage( OwnerID() , -1 , 2 , "[SC_Z23_BOSS5_CRAZED]" , 1 )
				Addbuff ( OwnerID() , 621004 , 0 , -1 )
				return
			end
		end
	end
end
function Lua_Z23_Queen_Event_EndAttack()--離開戰鬥事件
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local TempPlayer = SetSearchAllPlayer(RoomID) --取現在該區內的所有玩家
	local ThesePlayer = {}
	local BuffID = {621007}
	WriteRoleValue(Boss,EM_RoleValue_Register1,0); --離開戰鬥
	CallPlot( Lua_Z23_Queen_Globel[RoomID].Door, "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss )
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	SetModeEx(  Boss, EM_SetModeType_Show, true );--顯示
--	SetFightMode (  Boss  , 0, 0, 0, 0 );
--	AddBuff(Boss,507899,0,-1);--不可攻擊BUFF
	CancelBuff(Boss,506700)--清BUFF
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--清BUFF
		end
	end
end
function Lua_Z23_Queen_Event_Dead()
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local Globel = Lua_Z23_Queen_Globel[RoomID];
	Globel.Step = "Dead";
	--CallPlot( Lua_Z23_Queen_Globel[RoomID].Door[1], "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss)
	WriteRoleValue(Boss,EM_RoleValue_Register2,1);
	KS_ScriptMessage("[SC_Z23_QUEEN_BOSSDEAD]");
	local level = ReadRoleValue(Boss,EM_RoleValue_PID);
	if level == 0 then
		KS_ScriptMessage("[SC_Z23_QUEEN_NEXT]");
		Lua_Zone23_Boss6_Begin();
	end
	local ChestID = {Lua_Z23_Queen_Npc_Table("A_Young_Ant"),Lua_Z23_Queen_Npc_Table("M_Young_Ant"),Lua_Z23_Queen_Npc_Table("A_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Big_Ant"),Lua_Z23_Queen_Npc_Table("A_Big_Ant"),106298}
	Lua_DavisDelObj( ChestID );
	return true
end
function Lua_Z23_Queen_Ai()
	local Boss = OwnerID();
	local RoomID= ReadRoleValue(Boss,EM_RoleValue_RoomID);
	WriteRoleValue (Boss,EM_RoleValue_Register2,0);--重新計算
	local FightState = 1;
	local Clock = {1,1,1};
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local Globel = Lua_Z23_Queen_Globel[RoomID];
	local CrazyTime = 480;
	local Crazy = false;
	local FlagCount = GetMoveFlagCount ( 781030 );
	local FlagID = 781030;
	local Msg = "";
	local NewMsg = "";
	local MonsterCount = 0;
	Globel.Mob=0;
	local BuffPlv = 0 
	local Npc_X , Npc_Y , Npc_Z = 0
	while FightState == 1 do
		DebugMsg( 0, RoomID ,"Clock_2="..Clock[2].."___Globel.Step="..Globel.Step);
		HatePlayer = KS_GetHateList( Boss, 3 );
		FightState = ReadRoleValue(Boss,EM_RoleValue_Register1);		--是否戰鬥中
		MonsterCount = Globel.Mob	--小怪數量
		AttackTarget = ReadRoleValue( Boss , EM_RoleValue_AttackTargetID );
		NowCastSpell = ReadRoleValue( Boss , EM_RoleValue_SpellMagicID );
		HPP =ReadRoleValue(Boss,EM_RoleValue_HP)/ReadRoleValue(Boss,EM_RoleValue_MaxHP);
		NewMsg = "FightState = "..FightState.." MonsterCount = "..MonsterCount.." it's "..Globel.Step.." mode.";
		if Msg ~= NewMsg then
			Msg = NewMsg;
			DebugMsg( 0, RoomID ,Msg);
		end
		if HPP<0.4 and Globel.Step == "Nomal" then
			KS_ScriptMessage("[SC_Z23_QUEEN_SECOND]");
			Globel.Step = "Anger";
		end
		if NowCastSpell == 0  then
			if Clock[1] % 7 == 0 then	--RAND三招
				local Ra = math.random(3);
				if Ra <3 then
					CastSpellLv( Boss , Boss , Globel["Magic"][Ra][1] , Globel["Magic"][Ra][2]);--對透明球放直線攻擊
				else
					local PP = Lua_GetFormHate(HatePlayer,3);--取出要被抓的玩家
					local Name ="";
					for i,v in ipairs(PP) do
						Name = Name.." "..GetName(v)
					end
					KS_ScriptMessage("[SC_Z23_QUEEN_CALL][$SETVAR1="..Name.."]");
					for i,v in ipairs(PP) do
						SetPosByObjDis(v,Boss,10);
					end
					CastSpellLv( Boss , Boss , Globel["Magic"][5][1] , Globel["Magic"][5][2]);--特效施法(2秒)
					local SpellTime = GameObjInfo_Int( Globel["Magic"][3][1] , "SpellTime")
					--DebugMsg( 0, RoomID ,SpellTime);
					Sleep(SpellTime*10)
					for i,v in ipairs(PP) do
						if kg_GetDis(Boss,v)<=75 then
							sysCastSpellLv( Boss , v , Globel["Magic"][3][1] , Globel["Magic"][3][2]);--招換傷害
						end
					end
				end
			elseif Clock[1] % 17 == 0 then	--直線傷害
				KS_ScriptMessage("[SC_Z23_QUEEN_LINEDMG]");
				local PP = Lua_GetFormHate(HatePlayer,6);--取出要被丟直線的玩家
				local XX = {}--透明球TABLE
				for i,v in ipairs(PP) do
					Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(v)
					XX[i] = Cl_CreateObj_ForHideBall( 107204 , Npc_X , Npc_Y , Npc_Z , RoomID )
				end
				CastSpellLv( Boss , Boss , 850009 , 0 )
				local SpellTime = GameObjInfo_Int( 850009 , "SpellTime")
				--DebugMsg( 0, RoomID ,SpellTime);
				Sleep(SpellTime*10)
				for i,v in ipairs(XX) do
					DebugMsg( 0, RoomID ,"Line Attack=>"..i);
					sysCastSpellLv( Boss , v , Globel["Magic"][4][1] , Globel["Magic"][4][2]);--對透明球放直線攻擊
					WriteRoleValue(v,EM_RoleValue_LiveTime,3);--刪掉自己
				end
			elseif Clock[1] % 19 == 0 and Globel.Mob<20 then	--孵化螞蟻AB
				KS_ScriptMessage("[SC_Z23_QUEEN_BORN]");
				if Globel.Step == "Nomal" then
					--孵化小螞蟻AB各5之
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("A_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--螞蟻A
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("M_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--螞蟻B
				elseif Globel.Step == "Anger" then
					--孵化小螞蟻AB各8之
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("A_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--螞蟻A
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("M_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--螞蟻B
				end
			end
			if Globel.Step == "Nomal" then	--每次扣1%
				if Clock[2] >= 15 then--扣玩家血
					for i,v in ipairs(HatePlayer) do
						if CheckBuff ( v , 621007 ) ~= true then
							AddBuff(v,621007,0,-1)
						else
							BuffPlv = Cl_Read_BuffLv( v , 621007 , 0 )
							CancelBuff_NoEvent (v , 621007 )
							AddBuff(v,621007,BuffPlv+1,-1)
						end
					end
					Clock[2] = 0
				end
			elseif Globel.Step == "Anger" then--每次扣3%
				if Clock[2] >= 18 then--扣玩家血
					for i,v in ipairs(HatePlayer) do
						if CheckBuff ( v , 621007 ) ~= true then
							AddBuff(v,621007,2,-1)
						else
							BuffPlv = Cl_Read_BuffLv( v , 621007 , 0 )
							CancelBuff_NoEvent (v , 621007 )
							AddBuff(v,621007,BuffPlv+3,-1)
						end
					end
					Clock[2] = 0
				end
			end
		else
--			DebugMsg( 0, RoomID ,"Now Casting...");
		end
		if Clock[3]>=CrazyTime and Crazy == false then
			KS_ScriptMessage("[SC_Z23_QUEEN_CRAZY]");
			AddBuff(Boss,620276,0,-1);
			Crazy = true;
		end
		Sleep(10);
		for i = 1,table.getn(Clock) do
			Clock[i] = Clock[i] + 1;
		end;
	end;
	KS_ScriptMessage( "[SC_Z23_QUEEN_ALLDEAD]" )--滅團
	local ChestID = {Lua_Z23_Queen_Npc_Table("A_Young_Ant"),Lua_Z23_Queen_Npc_Table("M_Young_Ant"),Lua_Z23_Queen_Npc_Table("A_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Big_Ant"),Lua_Z23_Queen_Npc_Table("A_Big_Ant"),106298}
	Lua_DavisDelObj( ChestID );
	CallPlot(Boss,"Lua_Z23_Queen_ResetObj",0)
end
function Lua_Z23_Queen_BornByFlag(ObjID, FlagID, Num, AiPlot)
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ObjGroup = {}
	local FlagCount = GetMoveFlagCount ( FlagID );
	local ss = Lua_Table_GetRdIndex(FlagCount,Num);
	for i,v in ipairs(ss) do
	--	DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
		ObjGroup[i] = CreateObjByFlag( ObjID , FlagID , v-1 , 1 )
		WriteRoleValue ( ObjGroup[i] , EM_RoleValue_Register1 , v )
		AddToPartition(ObjGroup[i],RoomID)
		CallPlot(ObjGroup[i],AiPlot,0);
	end
	return ObjGroup
end
function Lua_Z23_Queen_AntAi()
	local OID = OwnerID();
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Z23_Queen_Globel[RoomID];
	Globel.Mob = Globel.Mob +1;
	local Type = 0;
	local Clock = 0;
	local AttackTarget =ReadRoleValue( Globel.Boss , EM_RoleValue_AttackTargetID );
	local HatePlayer;
	local MID = {};
	MID[Lua_Z23_Queen_Npc_Table("A_Young_Ant")] = {Lua_Z23_Queen_Npc_Table("A_Egg_Ant"),Lua_Z23_Queen_Npc_Table("A_Big_Ant"),BuffID={621013,621016}}; ---鐵甲
	MID[Lua_Z23_Queen_Npc_Table("M_Young_Ant")] = {Lua_Z23_Queen_Npc_Table("M_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Big_Ant"),BuffID={621014,621015}}; ---噬法
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID);
	SetAttack(OID,AttackTarget);
	AddBuff(OID,MID[OrgID].BuffID[1],0,-1)
	while hatelistcount(Globel.Boss)~=0 do
		HatePlayer = KS_GetHateList( Globel.Boss, 3 );
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if Type == 0 then
			if Clock>=8 then--變蛹
				StopMove(OID,true)  
				SetStopAttack(OID);--停止攻擊
				ChangeObjID(OID,MID[OrgID][1]);
				CancelBuff( OID,MID[OrgID].BuffID[1]);
				SetFightMode (  OID  , 0, 0, 0, 1 );
				Clock = 0;
				Type = 1;
			end
		elseif Type == 1 then
			if Clock>=4 and ReadRoleValue(OID,EM_RoleValue_IsDead)==0 then--變工蟻
				ChangeObjID(OID,MID[OrgID][2]);
				AddBuff(OID,MID[OrgID].BuffID[2],0,-1)
				SetFightMode (  OID  , 1, 1, 1, 1 );
				SetPlot(OID,"dead","Lua_Z23_Queen_AntAi_Dead",0)--殺死工蟻死亡劇情(釋放能量)
				Clock = 0;
				Type = 2;
			end
		elseif Type == 2 then
			if hatelistcount(OID)~=0 then
				if Clock % 7 == 0  then
					local AA = rand(3);
					if OrgID ==Lua_Z23_Queen_Npc_Table("A_Young_Ant") then ----------------------------------------------------物理強化工蟻
						if AA == 1 then
							local PP = Lua_GetFormHate(HatePlayer,1);--取出要被抓的玩家
							--衝鋒
							CastSpellLv( OID , PP[1]  , Globel["Magic"][6][1], Globel["Magic"][6][2]);
						elseif AA == 0 then
							--小範圍
							CastSpellLv( OID , OID  , Globel["Magic"][7][1], Globel["Magic"][7][2]);
						else
							local PP = Lua_GetFormHate(HatePlayer,1);--取出要被抓的玩家
							--物理禁制
							CastSpellLv( OID , PP[1]  , Globel["Magic"][8][1], Globel["Magic"][8][2]);
						end
					else  -------------------------------------------------------------------法系工蟻
						if AA == 1 then
							local PP = Lua_GetFormHate(HatePlayer,3);--取出要被抓的玩家
							--火球術
							for i,v in ipairs(PP) do
								sysCastSpellLv( OID , v  , Globel["Magic"][9][1], Globel["Magic"][9][2]);
							end
						elseif AA == 0 then
							--前方扇形
							CastSpellLv( OID , OID  , Globel["Magic"][10][1], Globel["Magic"][10][2]);
						else
							local PP = Lua_GetFormHate(HatePlayer,1);--取出要被抓的玩家
							--沉默術
							CastSpellLv( OID , PP[1]  , Globel["Magic"][11][1], Globel["Magic"][11][2]);
						end
					end
				end
			end
		end
		Clock = Clock +1;
		Sleep(10);
	end
	WriteRoleValue(OID,EM_RoleValue_LiveTime,1);--刪掉自己
end
function Lua_Z23_Queen_AntAi_Dead()
	local OID = OwnerID();
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Z23_Queen_Globel[RoomID];
	Globel.Mob = Globel.Mob -1;
	local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ(OID)
	local Buff = Cl_CreateObj_ForHideBall( 106298 , Npc_X , Npc_Y , Npc_Z , RoomID )
	CallPlot(Buff,"Lua_Z23_Queen_Buff_Ai",0);
	return true;
end
function Lua_Z23_Queen_Buff_Ai()
	local OID = OwnerID();
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID,".....AI =>"..OID);
	SetFightMode (  OID  , 0, 0, 0, 0 );
	WriteRoleValue(OID,EM_RoleValue_LiveTime,10);--刪掉自己
	CastSpellLv( OID , OID  , 498477, 0);
end
function Lua_Z23_Queen_CancelBuff()
	local OID = OwnerID();
	local TID = TargetID();
	CancelBuff( TID,621007);--清除減血
	AddBuff(TID,621020,0,5);
	if math.random(2)==1 then
		AddBuff(TID,621066,0,5);
	else
		AddBuff(TID,621067,20,5);
	end
end
function Lua_Z23_Queen_Move()
	local Boss = OwnerID();
	while 1 do
		if hatelistcount(Boss) == 0 then
			--亂走
			LuaFunc_MoveToFlagandWait( Boss, 781139 , Rand(GetMoveFlagCount(781139)),0);
		else
			break;
		end
		Sleep(20)
	end
end