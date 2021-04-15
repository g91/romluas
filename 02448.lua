function Lua_Zone22_Alert_SkillLvInfo(Lv)
	--if Lv==0 then--���q��
	DebugMsg( 0, 0 ,"Lv="..Lv);
	if (Lv==144)  then--���q��
		local SkillLv = {	0,		--�L���@��
				0,		--�s�ͤ��N
				25,		--�������
				25,		--DOT
				25,		--����AE
				0,		--�l��
				7,		--����AE
				0,		--�гy���}
				0,		--�������}
				27,		--�e�记��(�p��)
				10,		--�ļ�(�p��)
				10,		--���u��AE�ˮ`(�p��)
				0}		--�Y���z��
		local SkillList = {496845,	--�L���@��
				498168,	--�s�ͤ��N
				498169,	--�������
				498170,	--DOT
				498171,	--����AE
				498172,	--�l��
				498182,	--����AE
				498183,	--�гy���}
				498184,	--�������}
				498185,	--�e�记��(�p��)
				498186,	--�ļ�(�p��)
				498187,	--���u��AE�ˮ`(�p��)
				498191}	--�Y���z��
		local MonID = {105964,	--��
				105965,	--�ݯʪ��]�k�~
				105966,	--�ݯʪ��]�k�~
				105967}	--�]�k�~���F��
		return SkillLv,SkillList,MonID;
	--elseif Lv == 1 then--²�檩
	elseif Lv == 145 or (Lv==957)then--²�檩
		local SkillLv = {	0,		--�L���@��
				0,		--�s�ͤ��N
				10,		--�������
				10,		--DOT
				10,		--����AE
				0,		--�l��
				4,		--����AE
				0,		--�гy���}
				0,		--�������}
				17,		--�e�记��(�p��)
				10,		--�ļ�(�p��)
				5,		--���u��AE�ˮ`(�p��)
				0}		--�Y���z��
		local SkillList = {496845,	--�L���@��
				498168,	--�s�ͤ��N
				498169,	--�������
				498170,	--DOT
				498171,	--����AE
				498172,	--�l��
				498182,	--����AE
				498183,	--�гy���}
				498184,	--�������}
				498185,	--�e�记��(�p��)
				498186,	--�ļ�(�p��)
				498187,	--���u��AE�ˮ`(�p��)
				498191}	--�Y���z��
		local MonID = {106740,	--��
				106742,	--�ݯʪ��]�k�~
				106741,	--�ݯʪ��]�k�~
				106743}	--�]�k�~���F��
		return SkillLv,SkillList,MonID;
	end
end
function Lua_Zone22_Alert_Main()--������
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local PID = ReadRoleValue(OID,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(OID,EM_RoleValue_ZoneID));
	--�ŧi�Ҧ������ܼ�
	if Lua_Alert_Globel==nil then
		Lua_Alert_Globel={};
	end
	if Lua_Alert_Globel[RoomID] == nil then
		Lua_Alert_Globel[RoomID]={GUID=0,Step="Reset",Mob=0,Door={},QQ=0,Pos={},Buff=-1,Boll=0,HatePlayer={},shadow=0};
		Lua_Zone22_Alert_Door();
	else
		Lua_Alert_Globel[RoomID].Step ="BEGIN";
		Lua_Zone22_Alert_ResetAll();
		--���m�Ҧ������ܼ�
		Lua_Alert_Globel[RoomID]={GUID=0,Step="Reset",Mob=0,Door={},QQ=0,Pos={},Buff=-1,Boll=0,HatePlayer={},shadow=0};
		local trash = {103126,105939,105940,MonID[1],MonID[2],MonID[3],MonID[4],105968,105969};
		Lua_DavisDelObj( trash );
		Lua_Zone22_Alert_Door();
	end
	local Globel =Lua_Alert_Globel[RoomID];
	Globel.Ctrl = OID;
	local Distane = 500;
	local Boss = CreateObjByFlag ( MonID[1] , 780993, 0 ,1 );
	SetPlot(Boss,"dead","Lua_Zone22_Alert_Dead",0)
	AddToPartition(Boss,RoomID);
	Globel.GUID = Boss;

	--BeginPlot(OID,"Lua_Zone22_Alert_Door",0);
	local Fight;
	local Dis = 0;
	local FlagCount = GetMoveFlagCount ( 780994 );--�����m���X��
	local Msg = "";
	local NewMsg = "";
	while 1 do
		Boss = Globel.GUID;
		Fight = ReadRoleValue(Boss,EM_RoleValue_Register1);
		if Globel.Step == "Dead" then--���w�{
			if Globel.Mob~=nil then
				DelObj(Globel.Mob);--�R��
			end
			if Globel.QQ~=nil then
				DelObj(Globel.QQ);--�R��
			end
			break;
		else
			NewMsg = " Fight = "..Fight.." Step = "..Globel.Step
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
			if Globel.Step ~= "Reset" and Globel.Step ~= "Dead" then--���m
				Dis = kg_GetDis(Boss,780993,0);
				if Dis >=Distane then
					Globel.Step = "TooFar";
					DebugMsg( 0, RoomID ,"TOO FAR");
					SetStopAttack( Boss );
					CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
					Crazy = false;
					--Lua_Zone22_Alert_ResetAll();
				end
			end
		end
		Sleep(10);
	end


end
function Lua_Zone22_Alert_Door()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ExitDoor = {}
	local Globel = Lua_Alert_Globel[RoomID];
	for i=1,2 do
		if Globel.Door[i] == nil then
			ExitDoor[i] = CreateObjByFlag( 106012, 780993 , i , 1 )--�X�f���ת�
			DebugMsg( 0, RoomID ,"nil Door lllll..."..i.." ID = "..ExitDoor[i]);
			Globel.Door = {ExitDoor[1],ExitDoor[2]}
			kg_DoorInit( ExitDoor[i] );
			AddToPartition( ExitDoor[i] , RoomID );
		end
	end
	CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", true,Globel.GUID )
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	return ExitDoor;
end
function Lua_Zone22_Alert_ResetObj()--���m����@��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Alert_Globel[RoomID].GUID;
	local Globel =Lua_Alert_Globel[RoomID]
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID));
	if Globel.Boll~=nil then
		DelObj(Globel.Boll);--�R����
	end
	if Globel.Mob~=nil then
		DelObj(Globel.Mob);--�R����
	end
	if Globel.QQ~=nil then
		DelObj(Globel.QQ);--�R����
	end
	local trash = {105939,105940,MonID[2],MonID[3],MonID[4]};
	Lua_DavisDelObj( trash );
	if Globel.shadow~=nil then
		DelFromPartition( Globel.shadow);
	end
	Globel.Buff = -1;
	if BOSS~=nil and Globel.Step ~= "BEGIN"then
		if Globel.Step ~= "Dead" then
			Globel.Step = "Reset";
			--DebugMsg( 0, RoomID ,"isDead = false");
			Lua_CancelAllBuff( BOSS ); --�M���Ҧ�buff
			DelObj(BOSS);--�R��BOSS
			-- ���]NPC���	
			Sleep( 50 );
			-- ���s�[�J���ΰ�
			local NewBoss = CreateObjByFlag ( MonID[1] , 780993, 0 ,1 );
			SetPlot(NewBoss,"dead","Lua_Zone22_Alert_Dead",0)
			AddToPartition(NewBoss,RoomID);
			Globel.GUID = NewBoss;
			Globel.Step = "Nomal";
		--else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Zone22_Alert_Event_BeginAttack()--�i�J�԰��ƥ�
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID]
	WriteRoleValue(BOSS,EM_RoleValue_Register1,1) --�}�l�԰�
	MoveToFlagEnabled(BOSS,false);
	KS_ScriptMessage("[SC_ALERT_START]");
	AddBuff(BOSS,506700,0,-1);
	BeginPlot(BOSS,"Lua_Zone22_Alert_Fight_Ai",0);
	if ReadRoleValue ( BOSS , EM_RoleValue_ZoneID ) == 144 then
		BeginPlot(BOSS,"Lua_Zone22_Alert_RUSH",3600);
	end
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", true,Globel.GUID )
end
function Lua_Zone22_Alert_Event_EndAttack()--���}�԰��ƥ�
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID ,"Now leave Fight...");
	local TempPlayer = SetSearchAllPlayer(RoomID) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	local BuffID = {620649,620650,620651}
	local Globel =Lua_Alert_Globel[RoomID]
	MagicInterrupt( BOSS );
	WriteRoleValue(BOSS,EM_RoleValue_Register1,0); --���}�԰�
	CancelBuff(BOSS,506700)--�MBUFF
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	if Globel.Step == "TooFar" then
		KS_ScriptMessage("[SC_ALERT_BOSS_TOOFAR]");
	elseif Globel.Step ~= "Dead" then	
		KS_ScriptMessage( "[SC_ALERT_ALLDEAD]" )--����
	end
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--�MBUFF
		end
	end
	BeginPlot(Globel.Ctrl,"Lua_Zone22_Alert_ResetObj",0);
end
function Lua_Zone22_Alert_ResetAll()
	Lua_Zone22_Alert_ResetObj();
end
function Lua_Zone22_Alert_Dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID]
	Globel.Step = "Dead";
	KS_ScriptMessage("[SC_ALERT_DEAD]");
	CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	return true;
end
function Lua_Zone22_Alert_Fight_Ai()
	local BOSS = OwnerID();
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	WriteRoleValue (BOSS,EM_RoleValue_Register2,0);--���s�p��
	local FightState = 1;
	local Clock = {1,1,1};
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local HPC = 0.8;
	local Globel = Lua_Alert_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local CrazyTime = 360;
	local Crazy = false;
	local SS;
	Globel.HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	local QWE = Rand(2);
	if QWE == 1 then
		Globel.Step = "Destroy";
		AddBuff(BOSS,621089,0,-1);
	else
		Globel.Step = "Create";
		AddBuff(BOSS,621088,0,-1);
	end
	local shadow = Lua_CreateObjByDir( BOSS , MonID[4] , -85 , 0);
	SetModeEx(  shadow, EM_SetModeType_Show, false );--���
	SetModeEx( shadow  , EM_SetModeType_Strikback, false );--����
	SetModeEx( shadow  , EM_SetModeType_Searchenemy, false );--����
	SetModeEx( shadow  , EM_SetModeType_Mark, false );--�аO
	MoveToFlagEnabled(shadow, false);
	AddToPartition(shadow,RoomID);
	Globel.shadow=shadow;
	local Msg = "";
	local NewMsg = "";
	local AA =false;
	while FightState == 1 do
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--�O�_�԰���
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
		HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
		Globel.HatePlayer = KS_GetHateList( Boss, 3 );
		if #Globel.HatePlayer == 0 then
			Globel.HatePlayer[1] = AttackTarget;
		end
		NewMsg = "##FightState = "..FightState.." it's "..Globel.Step.." mode. HPP = "..HPP.." HPC = "..HPC;
		if Msg ~= NewMsg then
			Msg = NewMsg;
			DebugMsg( 0, RoomID ,Msg);
		end
		if AA == false then
		 	AA = Lua_Zone22_Alert_SpecialAA(Globel,BOSS,RoomID,Clock,HPP,HPC);
		end
--		if Clock[3]>=CrazyTime and Crazy == false then
--			KS_ScriptMessage("[SC_ALERT_RUSH]");
--			AddBuff(BOSS,620561,0,-1);
--			Crazy = true;
--		end
		--�����Ҧ���
		if NowCastSpell == 0 then
			if Clock[1]%15==0 then
				KS_ScriptMessage("[SC_ALERT_MODECH]");
				if Globel.Step == "Destroy" then
					Globel.Step = "Create";
					AddBuff(BOSS,621088,0,-1);
				else
					Globel.Step = "Destroy";
					AddBuff(BOSS,621089,0,-1);
				end
			end
			if  Clock[1]%3==0 then
				if Globel.Step == "Create" then--��k�}
					sysCastSpellLv( BOSS , BOSS  , SkillList[8], SkillLv[8]);
				else
					local RR = Rand(table.getn(Globel.HatePlayer))+1
					sysCastSpellLv( BOSS , Globel.HatePlayer[RR]  , SkillList[9], SkillLv[9]);
				end
			end
			--�S��ޯ��
			SS,HPC = Lua_Zone22_Alert_Special(Globel,BOSS,RoomID,Clock,HPP,HPC);
			--���q�ޯ��
			if SS == false then
				if NowCastSpell == 0 then
					local XR = Rand(2);
					if Clock[3]%7==0 then--���q�ޯ�
						if XR == 0 then
							CastSpellLv( BOSS , AttackTarget  , SkillList[3], SkillLv[3]);
						else
							CastSpellLv( BOSS , AttackTarget  , SkillList[4], SkillLv[4]);
						end
					elseif Clock[3]%9==0 then--����
						if Globel.Step == "Destroy" then
							SetPosByObjDis(Globel.shadow,BOSS,-85);
						else
							SetPosByObjDis(Globel.shadow,BOSS,85);
						end
						CastSpellLv( BOSS , Globel.shadow  , SkillList[5], SkillLv[5]);
					end
				end
			end

			for i ,v in ipairs(Clock) do
				Clock[i] = Clock[i] + 1;
				--DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
			end;
		else
		--	DebugMsg( 0, RoomID ,"Now Casting...");
		end
		Sleep(10);
	end;
	Lua_Zone22_Alert_ResetObj();
end
function WaitCastSpellLv(OID,TID,SpellID,SpellLv)
	local NowCastSpell
	CastSpellLv(OID,TID,SpellID,SpellLv);
	while 1 do
		NowCastSpell = ReadRoleValue( OID , EM_RoleValue_SpellMagicID );
		if NowCastSpell ~=SpellID then
			break;
		end
		Sleep(1)
	end
	return true;
end
function Lua_Zone22_Alert_Special(Globel,BOSS,RoomID,Clock,HPP,HPC)
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local FlagCount = GetMoveFlagCount ( 780994 );--�����m���X��
--	DebugMsg( 0, RoomID ,"Now 40..."..Clock[2]%40);
--	DebugMsg( 0, RoomID ,"Now 45..."..Clock[2]%45);
	if Clock[2]%40 ==0 or HPP<=HPC then
	--	DebugMsg( 0, RoomID ,"Now Special1...");
		--�l����q�y
		--�i�J�S���A
		SetFightMode (  BOSS  , 0, 0, 0, 0 );
		AddBuff(BOSS,507899,0,-1);--���i����BUFF
		KS_ScriptMessage("[SC_ALERT_EAT]");
		if WaitCastSpellLv( BOSS , BOSS  , SkillList[6], SkillLv[6])==true then
		DebugMsg( 0, RoomID ,"Now Special1...true");
			Clock[2] = 40;
			HPC=HPP-0.2;
			return true,HPC;
		end
	end
	if Clock[2]%46 ==0 or HPP<=HPC then
	--	DebugMsg( 0, RoomID ,"Now Special2...");
		KS_ScriptMessage("[SC_ALERT_ADD]");
		--���ͯ�q�y
		local QQ = CreateObjByFlag (MonID[4],780994,Rand(FlagCount),1);
		SetModeEx( QQ  , EM_SetModeType_Strikback, false );--����
		SetModeEx( QQ  , EM_SetModeType_Searchenemy, false );--����
		AddToPartition(QQ,RoomID)
		AddBuff(QQ,621095,0,-1)
		Globel.QQ = QQ;
		SetPlot(QQ,"dead","Lua_Zone22_Alert_QQ_dead",0)
		--�O��{�b��m
		local X,Y,Z,Dir = Lua_GetPostion();
		Globel.Pos = {X,Y,Z,Dir};
		--������ؼгB
		SetPosByObjDis(BOSS,QQ,-30, 0);
		--�o�ʷs�ͤ��N
		if WaitCastSpellLv( BOSS , BOSS  , SkillList[2], SkillLv[2])==true then
			DebugMsg( 0, RoomID ,"Wait Finish");
			HPC=HPP-0.2;
			Clock[2]=1;
			return true,HPC;
		end
	end
	return false,HPC,Clock;
end
function Lua_Zone22_Alert_SpecialAA(Globel,BOSS,RoomID,Clock,HPP,HPC)
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local FlagCount = GetMoveFlagCount ( 780994 );--�����m���X��
	--�i�J�S���A
	SetFightMode (  BOSS  , 0, 0, 0, 0 );
	AddBuff(BOSS,507899,0,-1);--���i����BUFF
	KS_ScriptMessage("[SC_ALERT_ADD]");
	--���ͯ�q�y
	local QQ = CreateObjByFlag (MonID[4],780994,Rand(FlagCount),1);
	SetModeEx( QQ  , EM_SetModeType_Strikback, false );--����
	SetModeEx( QQ  , EM_SetModeType_Searchenemy, false );--����
	AddToPartition(QQ,RoomID)
	AddBuff(QQ,621095,0,-1)
	Globel.QQ = QQ;
	SetPlot(QQ,"dead","Lua_Zone22_Alert_QQ_dead",0)
	--�O��{�b��m
	local X,Y,Z,Dir = Lua_GetPostion();
	Globel.Pos = {X,Y,Z,Dir};
	--������ؼгB
	SetPosByObjDis(BOSS,QQ,-30, 0);
	--�o�ʷs�ͤ��N
	if WaitCastSpellLv( BOSS , BOSS  , SkillList[2], SkillLv[2])==true then
	--	DebugMsg( 0, RoomID ,"Wait Finish");
		HPC=HPP-0.2;
		Clock[2]=1;
		return true;
	end
end
function Lua_Zone22_Alert_QQ_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID];
	Globel.QQ=0;
	DelObj(OID);
end
function Lua_Zone22_Alert_CreateMM()
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local Mob = 0;
	if Globel.QQ ==0 then--�ͥX������
		Mob = CreateObjByObj(MonID[2],BOSS);
		if Globel.Buff>=0 then
			AddBuff(Mob,620646,Globel.Buff,-1);
		end
		sysCastSpellLv( BOSS , BOSS  , SkillList[1], SkillLv[1]);
		DebugMsg( 0, RoomID ,"sysCastSpellLv="..SkillList[1]);
		KS_ScriptMessage("[SC_ALERT_ADD_1]");
	else--�ͥX����
		Mob = CreateObjByObj(MonID[3],BOSS);
		if Globel.Buff>=0 then
			AddBuff(Mob,620647,Globel.Buff,-1);
		end
		KS_ScriptMessage("[SC_ALERT_ADD_2]");
		DelObj(Globel.QQ)
	end
	BeginPlot(Mob,"Lua_Zone22_Alert_MM_Ai",0);
	DebugMsg( 0, RoomID ,"Create Mob "..Mob);
	Globel.Mob = Mob;
	local RR = Rand(table.getn(Globel.HatePlayer))+1
	SetAttack(Mob,Globel.HatePlayer[RR]);
	BeginPlot(BOSS,"Lua_Zone22_Alert_BossReMovePos",20);
end
function Lua_Zone22_Alert_BossReMovePos()
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID];
	--�NBOSS���^�å��}�����}��
	SetPos(BOSS,Globel.Pos[1],Globel.Pos[2],Globel.Pos[3],Globel.Pos[4])
	SetFightMode (  BOSS  , 1, 1, 1, 1 );
	CancelBuff (BOSS,507899);--���i����BUFF
end
function Lua_Zone22_Alert_MM_Ai()
	local OID = OwnerID();
	SetPlot(OID,"dead","Lua_Zone22_Alert_MM_dead",0)
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local BOSS = Lua_Alert_Globel[RoomID].GUID;
	local Globel = Lua_Alert_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local X,Y,Z,Dir = Lua_GetPostion();
	local AttackTarget = 0;
	local Clock = 1;
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	MoveToFlagEnabled(OID,false);
	while 1 do
	--	DebugMsg( 0, RoomID ,"Now ..."..Clock);
	--	if Clock > 38 then
	--		break;
	--	end
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if AttackTarget ~=0 then--�԰���
			local RR = Rand(table.getn(Globel.HatePlayer))+1
			--DebugMsg( 0, RoomID ,"RR ..."..RR);
			--�I��ޯ�
			if OrgID==MonID[2] then
				if Clock%7 ==0 then
					CastSpellLv( OID , OID  , SkillList[10], SkillLv[10]);
				elseif Clock%9 ==0 then
					CastSpellLv( OID , Globel.HatePlayer[RR]  , SkillList[11], SkillLv[11]);
				end
			else
				if Clock%7 ==0 then
					CastSpellLv( OID , OID  , SkillList[10], SkillLv[10]);
				elseif Clock%9 ==0 then
					CastSpellLv( OID , Globel.HatePlayer[RR]  , SkillList[12], SkillLv[12]);
				end
			end
		else
			if Clock%5 ==0 then
				lua_DavisRandMove(OID,X,Y,Z,50);  --50 �C�����ʶZ��
			end
		end
		Clock = Clock +1;
		Sleep(10);
	end

end

function Lua_Zone22_Alert_MM_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	local Globel =Lua_Alert_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(Globel.Ctrl,EM_RoleValue_ZoneID));
	local Boll
	--�ͯ�q�y
	if OrgID==MonID[2] then
		Boll = CreateObjByObj(105968,OID);
	else
		Boll = CreateObjByObj(105969,OID);
	end
	SetModeEx( Boll  , EM_SetModeType_Mark, false );--�аO
	SetModeEx( Boll  , EM_SetModeType_HideName, true );--�W�l
	SetModeEx( Boll  , EM_SetModeType_ShowRoleHead, false );--�W�l
	SetModeEx( Boll  , EM_SetModeType_NotShowHPMP, true );--���
	Hide(Boll);
	Show(Boll,RoomID);
	Globel.Boll = Boll;
	Globel.Mob = 0;
	CancelBuff_NoEvent(Globel.GUID,620586);
	BeginPlot( Globel.Boll,"Lua_Zone22_Alert_GoBoss",0)
	return true;
end
function Lua_Zone22_Alert_Eat()--�y�ۤv�h����l��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Alert_Globel[RoomID];
	local BOSS = Lua_Alert_Globel[RoomID].GUID;
	if Globel.Mob ~= 0 then
		KS_ScriptMessage("[SC_ALERT_BUFF]");
		Globel.Buff=Globel.Buff+1;
		Killid(BOSS,Globel.Mob);
	end
end
function Lua_Zone22_Alert_GoBoss()
	local OID = OwnerID();
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local BOSS = Lua_Alert_Globel[RoomID].GUID;
	local Globel = Lua_Alert_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Alert_SkillLvInfo(ReadRoleValue(OID,EM_RoleValue_ZoneID));
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	--��������
--	local Time = ks_MoveToObj( OID, BOSS, 0 );
--	Sleep(Time);
--	DebugMsg( 0, RoomID ,"OrgID ..."..OrgID.." Mode =>"..Globel.Step);
	--�Q�l��
	sysCastSpellLv( OID , BOSS  , 498191, 0);
	--��F�۱�
	if (OrgID == 105969 and Globel.Step == "Create") or  (OrgID == 105968 and Globel.Step == "Destroy")then
		--�z��
		KS_ScriptMessage("[SC_ALERT_EAT_BOMB]");
		sysCastSpellLv( BOSS , BOSS  , SkillList[7], SkillLv[7]);
	else
		KS_ScriptMessage("[SC_ALERT_EAT_RIGHT]");
	end
	DelObj(OID)
end
function Lua_Zone22_Alert_BOMB()
	local XX = math.random(3);
	local BuffID = {620649,620650,620651}
	AddBuff(TargetID(),BuffID[XX],0,-1);
end
function Lua_Zone22_Alert_Magic()
	local OID = OwnerID();
	local TID = TargetID();
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local BOSS = Lua_Alert_Globel[RoomID].GUID;
	local IsPlayer = ReadRoleValue(TID,EM_RoleValue_IsPlayer)
--	DebugMsg( 0, RoomID ,"Check "..IsPlayer);
	if IsPlayer == 1 then
--		DebugMsg( 0, RoomID ,"Player .");
		AddBuff(TID,620666,0,-1);
	elseif TID == BOSS then
--		DebugMsg( 0, RoomID ,"Boss");
		AddBuff(TID,620666,4,-1);
	end
end
function CL_Z22_Skill_498490()
	BeginPlot(OwnerID(),"CL_Z22_Skill_498490_spell",0)
	return true;
end
function CL_Z22_Skill_498490_spell()
	local OID = OwnerID();
	local MagicID = 498489;
	for i=1,5 do
		sysCastSpellLv( OID , OID  ,  MagicID+i, 0);
		Sleep(10);
	end
end
function Lua_Zone22_Alert_RUSH()
	KS_ScriptMessage("[SC_ALERT_RUSH]");
	AddBuff(OwnerID(),620561,0,-1);
end