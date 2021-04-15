function Lua_Z23_Queen_Resources()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID);
	local level = ReadRoleValue(Ctrl,EM_RoleValue_PID);
	--�ŧi�Ҧ������ܼ�(�Ű�)
	if Lua_Z23_Queen_Globel==nil then--���p�S�������ܼ�
		Lua_Z23_Queen_Globel={};
		Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
	else
		if Lua_Z23_Queen_Globel[RoomID] == nil then--���p��ROOM�ܼ�
			Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
		else--��ROOM�w�g���ܼ�
			Lua_Z23_Queen_ResetAll();
			Lua_Z23_Queen_Globel[RoomID]={Boss=0,Step="Reset",Door=0};
		end
	end
	local Globel = Lua_Z23_Queen_Globel[RoomID];--�Y�u�ܼƦW�٤�K�U��ŧi�ܼ�
	--�ŧi�k�N��T
	Globel["Magic"]={};
	if level == 0 then--�x��
		Globel["Magic"][1] = {498454,29};	--�e�记��
		Globel["Magic"][2] = {498455,3};	--����ɦ�
		Globel["Magic"][3] = {498456,99};	--�l���ˮ`
		Globel["Magic"][4] = {498457,6};	--���u�ˮ`
		Globel["Magic"][5] = {498458,0};	--�޾ɰʧ@
		Globel["Magic"][6] = {498469,9};	--�ľW
		Globel["Magic"][7] = {498470,5};	--�p�d��
		Globel["Magic"][8] = {498471,0};	--���z�T��
		Globel["Magic"][9] = {498472,200};	--���y�N
		Globel["Magic"][10] = {498473,250};	--�e�记��
		Globel["Magic"][11] = {498474,0};	--�I�q�N

	elseif level == 1 then--���q
		Globel["Magic"][1] = {498454,15};	--�e�记��
		Globel["Magic"][2] = {498455,0};	--����ɦ�
		Globel["Magic"][3] = {498456,50};	--�l���ˮ`
		Globel["Magic"][4] = {498457,0};	--���u�ˮ`
		Globel["Magic"][5] = {498458,0};	--�޾ɰʧ@
		Globel["Magic"][6] = {498469,0};	--�ľW
		Globel["Magic"][7] = {498470,0};	--�p�d��
		Globel["Magic"][8] = {498471,0};	--���z�T��
		Globel["Magic"][9] = {498472,100};	--���y�N
		Globel["Magic"][10] = {498473,150};	--�e�记��
		Globel["Magic"][11] = {498474,0};	--�I�q�N
	elseif level == 2 then--²��
		Globel["Magic"][1] = {498454,5};	--�e�记��
		Globel["Magic"][2] = {498455,0};	--����ɦ�
		Globel["Magic"][3] = {498456,30};	--�l���ˮ`
		Globel["Magic"][4] = {498457,0};	--���u�ˮ`
		Globel["Magic"][5] = {498458,0};	--�޾ɰʧ@
		Globel["Magic"][6] = {498469,0};	--�ľW
		Globel["Magic"][7] = {498470,0};	--�p�d��
		Globel["Magic"][8] = {498471,0};	--���z�T��
		Globel["Magic"][9] = {498472,10};	--���y�N
		Globel["Magic"][10] = {498473,15};	--�e�记��
		Globel["Magic"][11] = {498474,0};	--�I�q�N
	else
		DebugMsg( 0, RoomID ,"PID is Error...Please Check the PID");
		return false;--�^�ǿ��~�����B�@
	end
	return Globel;--�^�ǥ����ܼƵ����
end
function Lua_Z23_Queen_Npc_Table(Value) --Lua_Z23_Queen_Npc_Table("A_Big_Ant")
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local NpcTable = {}
	NpcTable[146] = {}
	NpcTable[146]["BossID"] = 106300 --�s�ƦZ���Y�^
	NpcTable[146]["M_Young_Ant"] = 106302 --���k����
	NpcTable[146]["A_Young_Ant"] = 106301 --�K������
	NpcTable[146]["M_Egg_Ant"] = 106304 --���k�Ƹ�
	NpcTable[146]["A_Egg_Ant"] = 106303 --�K���Ƹ�
	NpcTable[146]["M_Big_Ant"] = 106305 --���k�u��
	NpcTable[146]["A_Big_Ant"] = 106306 --�K���u��
	
	NpcTable[147] = {}
	NpcTable[147]["BossID"] = 106656 --�s�ƦZ���Y�^
	NpcTable[147]["M_Young_Ant"] = 106658 --���k����
	NpcTable[147]["A_Young_Ant"] = 106657 --�K������
	NpcTable[147]["M_Egg_Ant"] = 107231 --���k�Ƹ�
	NpcTable[147]["A_Egg_Ant"] = 107230 --�K���Ƹ�
	NpcTable[147]["M_Big_Ant"] = 107232 --���k�u��
	NpcTable[147]["A_Big_Ant"] = 107233 --�K���u��
	
	NpcTable[148] = {}
	NpcTable[148]["BossID"] = 107234 --�s�ƦZ���Y�^
	NpcTable[148]["M_Young_Ant"] = 107236 --���k����
	NpcTable[148]["A_Young_Ant"] = 107235 --�K������
	NpcTable[148]["M_Egg_Ant"] = 107238 --���k�Ƹ�
	NpcTable[148]["A_Egg_Ant"] = 107237 --�K���Ƹ�
	NpcTable[148]["M_Big_Ant"] = 107239 --���k�u��
	NpcTable[148]["A_Big_Ant"] = 107240 --�K���u��
	return NpcTable[ZoneID][Value]
end
function Lua_Z23_Queen_Ctrl()
	local Globel = Lua_Z23_Queen_Resources();--�]�w�ϰ�귽
	if Globel == false then
		return;--�����ܼƿ��~�����B�@
	end
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID);
	local Distane = 800;--�̻��Z��
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
		if Globel.Step == "Dead" then--���w�{
			break;
		else
			NewMsg = " Fight = "..Fight.." Step = "..Globel.Step
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
			if Globel.Step == "Reset" then--���m
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
		ExitDoor = CreateObjByFlag( 106012, 781029 , 2 , 1 )--�X�f���ת�
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
		DelObj(Globel.Door);--�R����
	end
	if Globel.Boss ~= 0 then
		DelObj(Globel.Boss);
	end
end
function Lua_Z23_Queen_ResetObj()--���m����@��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Z23_Queen_Globel[RoomID];
	if Globel.Boss ~= 0 then
		if Globel.Step ~= "Dead" then
			CallPlot( Lua_Z23_Queen_Globel[RoomID].Door, "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss )--�}��
			Globel.Step = "Reset";
			SetModeEx(  Globel.Boss, EM_SetModeType_Show, false );--���
			Lua_CancelAllBuff( Globel.Boss ); --�M���Ҧ�buff
			-- �]�w����
			DelFromPartition( Globel.Boss);
			-- ���]NPC���
			Sleep( 50 );
			-- ���s�[�J���ΰ�
			SetModeEx(  Globel.Boss, EM_SetModeType_Show, true );--���
			AddToPartition( Globel.Boss, RoomID );
			SetPosByFlag( Globel.Boss , 781029 , 0 )
			BeginPlot( Globel.Boss, "Lua_Z23_Queen_Move",0);
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Z23_Queen_Event_BeginAttack()--�i�J�԰��ƥ�
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local ZoneID = ReadRoleValue ( Boss , EM_RoleValue_ZoneID )
	Cl_Resist_HackersFightBegin()
	local CrazedTime = {}
	CrazedTime[146] = 480
	CrazedTime[147] = 360
	CrazedTime[148] = 0
	WriteRoleValue(Boss,EM_RoleValue_Register1,1) --�}�l�԰�
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
function Lua_Z23_Queen_Event_EndAttack()--���}�԰��ƥ�
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local TempPlayer = SetSearchAllPlayer(RoomID) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	local BuffID = {621007}
	WriteRoleValue(Boss,EM_RoleValue_Register1,0); --���}�԰�
	CallPlot( Lua_Z23_Queen_Globel[RoomID].Door, "Lua_CloseDoor", false,Lua_Z23_Queen_Globel[RoomID].Boss )
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	SetModeEx(  Boss, EM_SetModeType_Show, true );--���
--	SetFightMode (  Boss  , 0, 0, 0, 0 );
--	AddBuff(Boss,507899,0,-1);--���i����BUFF
	CancelBuff(Boss,506700)--�MBUFF
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--�MBUFF
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
	WriteRoleValue (Boss,EM_RoleValue_Register2,0);--���s�p��
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
		FightState = ReadRoleValue(Boss,EM_RoleValue_Register1);		--�O�_�԰���
		MonsterCount = Globel.Mob	--�p�Ǽƶq
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
			if Clock[1] % 7 == 0 then	--RAND�T��
				local Ra = math.random(3);
				if Ra <3 then
					CastSpellLv( Boss , Boss , Globel["Magic"][Ra][1] , Globel["Magic"][Ra][2]);--��z���y�񪽽u����
				else
					local PP = Lua_GetFormHate(HatePlayer,3);--���X�n�Q�쪺���a
					local Name ="";
					for i,v in ipairs(PP) do
						Name = Name.." "..GetName(v)
					end
					KS_ScriptMessage("[SC_Z23_QUEEN_CALL][$SETVAR1="..Name.."]");
					for i,v in ipairs(PP) do
						SetPosByObjDis(v,Boss,10);
					end
					CastSpellLv( Boss , Boss , Globel["Magic"][5][1] , Globel["Magic"][5][2]);--�S�ĬI�k(2��)
					local SpellTime = GameObjInfo_Int( Globel["Magic"][3][1] , "SpellTime")
					--DebugMsg( 0, RoomID ,SpellTime);
					Sleep(SpellTime*10)
					for i,v in ipairs(PP) do
						if kg_GetDis(Boss,v)<=75 then
							sysCastSpellLv( Boss , v , Globel["Magic"][3][1] , Globel["Magic"][3][2]);--�۴��ˮ`
						end
					end
				end
			elseif Clock[1] % 17 == 0 then	--���u�ˮ`
				KS_ScriptMessage("[SC_Z23_QUEEN_LINEDMG]");
				local PP = Lua_GetFormHate(HatePlayer,6);--���X�n�Q�᪽�u�����a
				local XX = {}--�z���yTABLE
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
					sysCastSpellLv( Boss , v , Globel["Magic"][4][1] , Globel["Magic"][4][2]);--��z���y�񪽽u����
					WriteRoleValue(v,EM_RoleValue_LiveTime,3);--�R���ۤv
				end
			elseif Clock[1] % 19 == 0 and Globel.Mob<20 then	--��ƿ���AB
				KS_ScriptMessage("[SC_Z23_QUEEN_BORN]");
				if Globel.Step == "Nomal" then
					--��Ƥp����AB�U5��
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("A_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--����A
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("M_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--����B
				elseif Globel.Step == "Anger" then
					--��Ƥp����AB�U8��
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("A_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--����A
					Lua_Z23_Queen_BornByFlag( Lua_Z23_Queen_Npc_Table("M_Young_Ant"), FlagID, 3, "Lua_Z23_Queen_AntAi")--����B
				end
			end
			if Globel.Step == "Nomal" then	--�C����1%
				if Clock[2] >= 15 then--�����a��
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
			elseif Globel.Step == "Anger" then--�C����3%
				if Clock[2] >= 18 then--�����a��
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
	KS_ScriptMessage( "[SC_Z23_QUEEN_ALLDEAD]" )--����
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
	MID[Lua_Z23_Queen_Npc_Table("A_Young_Ant")] = {Lua_Z23_Queen_Npc_Table("A_Egg_Ant"),Lua_Z23_Queen_Npc_Table("A_Big_Ant"),BuffID={621013,621016}}; ---�K��
	MID[Lua_Z23_Queen_Npc_Table("M_Young_Ant")] = {Lua_Z23_Queen_Npc_Table("M_Egg_Ant"),Lua_Z23_Queen_Npc_Table("M_Big_Ant"),BuffID={621014,621015}}; ---���k
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID);
	SetAttack(OID,AttackTarget);
	AddBuff(OID,MID[OrgID].BuffID[1],0,-1)
	while hatelistcount(Globel.Boss)~=0 do
		HatePlayer = KS_GetHateList( Globel.Boss, 3 );
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if Type == 0 then
			if Clock>=8 then--�ܸ�
				StopMove(OID,true)  
				SetStopAttack(OID);--�������
				ChangeObjID(OID,MID[OrgID][1]);
				CancelBuff( OID,MID[OrgID].BuffID[1]);
				SetFightMode (  OID  , 0, 0, 0, 1 );
				Clock = 0;
				Type = 1;
			end
		elseif Type == 1 then
			if Clock>=4 and ReadRoleValue(OID,EM_RoleValue_IsDead)==0 then--�ܤu��
				ChangeObjID(OID,MID[OrgID][2]);
				AddBuff(OID,MID[OrgID].BuffID[2],0,-1)
				SetFightMode (  OID  , 1, 1, 1, 1 );
				SetPlot(OID,"dead","Lua_Z23_Queen_AntAi_Dead",0)--�����u�Ʀ��`�@��(�����q)
				Clock = 0;
				Type = 2;
			end
		elseif Type == 2 then
			if hatelistcount(OID)~=0 then
				if Clock % 7 == 0  then
					local AA = rand(3);
					if OrgID ==Lua_Z23_Queen_Npc_Table("A_Young_Ant") then ----------------------------------------------------���z�j�Ƥu��
						if AA == 1 then
							local PP = Lua_GetFormHate(HatePlayer,1);--���X�n�Q�쪺���a
							--�ľW
							CastSpellLv( OID , PP[1]  , Globel["Magic"][6][1], Globel["Magic"][6][2]);
						elseif AA == 0 then
							--�p�d��
							CastSpellLv( OID , OID  , Globel["Magic"][7][1], Globel["Magic"][7][2]);
						else
							local PP = Lua_GetFormHate(HatePlayer,1);--���X�n�Q�쪺���a
							--���z�T��
							CastSpellLv( OID , PP[1]  , Globel["Magic"][8][1], Globel["Magic"][8][2]);
						end
					else  -------------------------------------------------------------------�k�t�u��
						if AA == 1 then
							local PP = Lua_GetFormHate(HatePlayer,3);--���X�n�Q�쪺���a
							--���y�N
							for i,v in ipairs(PP) do
								sysCastSpellLv( OID , v  , Globel["Magic"][9][1], Globel["Magic"][9][2]);
							end
						elseif AA == 0 then
							--�e�记��
							CastSpellLv( OID , OID  , Globel["Magic"][10][1], Globel["Magic"][10][2]);
						else
							local PP = Lua_GetFormHate(HatePlayer,1);--���X�n�Q�쪺���a
							--�I�q�N
							CastSpellLv( OID , PP[1]  , Globel["Magic"][11][1], Globel["Magic"][11][2]);
						end
					end
				end
			end
		end
		Clock = Clock +1;
		Sleep(10);
	end
	WriteRoleValue(OID,EM_RoleValue_LiveTime,1);--�R���ۤv
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
	WriteRoleValue(OID,EM_RoleValue_LiveTime,10);--�R���ۤv
	CastSpellLv( OID , OID  , 498477, 0);
end
function Lua_Z23_Queen_CancelBuff()
	local OID = OwnerID();
	local TID = TargetID();
	CancelBuff( TID,621007);--�M�����
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
			--�è�
			LuaFunc_MoveToFlagandWait( Boss, 781139 , Rand(GetMoveFlagCount(781139)),0);
		else
			break;
		end
		Sleep(20)
	end
end