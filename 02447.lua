function Lua_Zone22_Requiem_SkillLvInfo(Lv)
	if Lv==0 then--���q��
		local SkillLv = {	8,		--����ޯ�
				2500,		--�d��ޯ�
				11,		--�j��
				149,		--�����ˮ`
				9,		--���z�p�Ǥj��
				9,		--�]�k�p�Ǥj��
				30,		--�p��A1
				399,		--�p��A2
				399,		--�p��B1
				399,		--�p��B2
				0}		--�p�Ǹ���a��W�jBUFF
		local SkillList = {498154,	--����ޯ�
				498155,	--�d��ޯ�
				498156,	--�j��
				498157,	--�����ˮ`
				498158,	--���z�p�Ǥj��
				498159,	--�]�k�p�Ǥj��
				498160,	--�p��A1--���z����
				498162,	--�p��A2--�]�k����
				498161,	--�p��B1--���z�d��
				498163,	--�p��B2--�]�k�d��
				620623}	--�p�Ǹ���a��W�jBUFF
		local MonID = {105935,	--��
				105936,	--�s�z�ܦ����F��
				105937,	--�۷\�ۺɪ����F
				105938}	--�F��X��
		return SkillLv,SkillList,MonID;
	elseif Lv == 1 then--²�檩
		local SkillLv = {	6,		--����ޯ�
				500,		--�d��ޯ�
				5,		--�j��
				49,		--�����ˮ`
				3,		--���z�p�Ǥj��
				3,		--�]�k�p�Ǥj��
				20,		--�p��A1
				199,		--�p��A2
				99,		--�p��B1
				99,		--�p��B2
				0}		--�p�Ǹ���a��W�jBUFF
		local SkillList = {498154,	--����ޯ�
				498155,	--�d��ޯ�
				498156,	--�j��
				498365,	--�����ˮ`
				498158,	--���z�p�Ǥj��
				498159,	--�]�k�p�Ǥj��
				498366,	--�p��A1--���z����
				498162,	--�p��A2--�]�k����
				498161,	--�p��B1--���z�d��
				498163,	--�p��B2--�]�k�d��
				620623}	--�p�Ǹ���a��W�jBUFF
		local MonID = {106206,	--��
				106207,	--�s�z�ܦ����F��
				106208,	--�۷\�ۺɪ����F
				106209}	--�F��X��
		return SkillLv,SkillList,MonID;
	end
end
function Lua_Zone22_Requiem_Main()--������(���q��PID=>0,²�檩PID=>1)
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local PID = ReadRoleValue(OID,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	--�ŧi�Ҧ������ܼ�
	if Lua_Requiem_Globel==nil then
		Lua_Requiem_Globel={};
	end
	if Lua_Requiem_Globel[RoomID]~= nil then
		Lua_Zone22_Requiem_ResetAll();
		--���m�Ҧ������ܼ�
		Lua_Requiem_Globel[RoomID]={GUID=0,Step="Reset",Mob={},Door={},QQ={}};
		local trash = {103126,MonID[1],MonID[2],MonID[3],MonID[4]};                 --2013/3/14�ץ����a�^��Boss�����ɭק�R��
		Lua_DavisDelObj( trash );
		Lua_Zone22_Requiem_Door();
	else
		Lua_Requiem_Globel[RoomID]={GUID=0,Step="Reset",Mob={},Door={},QQ={}};
		Lua_Zone22_Requiem_Door();
	end
	local Globel =Lua_Requiem_Globel[RoomID];
	Globel.Ctrl = OID;
	local Distane = 270;
	local Boss = CreateObjByFlag ( MonID[1] , 780991, 0 ,1 );
	SetPlot(Boss,"dead","Lua_Zone22_Requiem_Dead",0)
	SetFightMode (  Boss  , 0, 0, 0, 0 );
	AddBuff(Boss,507899,0,-1);--���i����BUFF
	AddToPartition(Boss,RoomID);
	Globel.GUID = Boss;
	--BeginPlot(OID,"Lua_Zone22_Requiem_Door",0);
	local Fight;
	local Dis = 0;
	local FlagCount = GetMoveFlagCount ( 780992 );--�����m���X��
	local Msg = "";
	local NewMsg = "";
	while 1 do
		Boss = Globel.GUID;
		Fight = ReadRoleValue(Boss,EM_RoleValue_Register1);
		if Globel.Step == "Dead" then--���w�{
			if Globel.Mob~=nil then
				for i,v in pairs(Globel.Mob)do DelObj(v) end;--�R����
			end
			if Globel.QQ~=nil then
				for i,v in pairs(Globel.QQ)do DelObj(v) end;--�R����
			end
			break;
		else
			NewMsg = "QQ .."..table.getn(Globel.QQ).." Fight = "..Fight.." Step = "..Globel.Step
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
			if Fight ==0 then
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_LOOP )
			end
			if Globel.Step == "Reset" then--���m
				DelObj(Boss);--�R��BOSS
				-- ���]NPC���	
				Sleep( 50 );
				-- ���s�[�J���ΰ�
				local PP = Lua_Table_GetRdIndex(FlagCount,5);
					Globel.QQ = Lua_Requiem_BornByFlagGroup(MonID[4],780992,PP,RoomID);
				for i,v in pairs(Globel.QQ) do
					SetPlot(v,"dead","Lua_Zone22_Requiem_QQ_dead",0)
					BeginPlot(v,"Lua_Zone22_Requiem_QQ_Move",0);
				end
				Boss = CreateObjByFlag ( MonID[1] , 780991, 0 ,1 );
				SetPlot(Boss,"dead","Lua_Zone22_Requiem_Dead",0)
				AddToPartition(Boss,RoomID);
				Globel.GUID = Boss;
				SetFightMode (  Boss  , 0, 0, 0, 0 );
				AddBuff(Boss,507899,0,-1);--���i����BUFF
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_BEGIN )
				Globel.Step = "Nomal";
			end
			Dis = kg_GetDis(Boss,780991,0);
			if table.getn(Globel.QQ)==0 and Fight == 0 then--����Q����
				PlayMotion ( Boss,ruFUSION_ACTORSTATE_SLEEP_END)
				SetFightMode (  Boss  , 1, 1, 1, 1 );
				CancelBuff (Boss,507899);--���i����BUFF
			end
			if Dis >=Distane then
				DebugMsg( 0, RoomID ,"TOO FAR");
				KS_ScriptMessage("[SC_REQUIEM_BOSS_TOOFAR]");
				Lua_Zone22_Requiem_ResetAll();
				CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
			--	DelObj(Boss);--�R��BOSS
			--	Boss = CreateObjByFlag ( 105935 , 780991, 0 ,1 );
			--	AddToPartition(Boss,RoomID);
			--	Globel.GUID = Boss;
			--	DelFromPartition( Globel.Door[2]);
			end
		end
		Sleep(10);
	end


end
function Lua_Zone22_Requiem_QQ_Move()
	local OID = OwnerID();
	local X = ReadRoleValue ( OID, EM_RoleValue_X);
	local Y = ReadRoleValue ( OID, EM_RoleValue_Y);
	local Z = ReadRoleValue ( OID, EM_RoleValue_Z);   ---------�o���O���XAttackplayer���������ӤH���y��
	local AttackTarget = 0;
	MoveToFlagEnabled(OID,false);
	while 1 do
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if AttackTarget ~=0 then
		else
			lua_DavisRandMove(OID,X,Y,Z,50);  --50 �C�����ʶZ��
		end
		Sleep(50+Rand(100));
	end
end
function Lua_Zone22_Requiem_QQ_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID];
	for i,v in pairs(Globel.QQ) do
		if OID==v then
			table.remove(Globel.QQ,i);
			break;
		end
	end
	DelObj(OID);
end
function Lua_Zone22_Requiem_Door()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local ExitDoor = {}
	local Globel = Lua_Requiem_Globel[RoomID];
	for i=1,2 do
		if Globel.Door[i] == nil then
			ExitDoor[i] = CreateObjByFlag( 106223, 780991 , i , 1 )--�X�f���ת�
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
function Lua_Zone22_Requiem_ResetObj()--���m����@��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local Globel =Lua_Requiem_Globel[RoomID]
	if Globel.Mob~=nil then
		for i,v in pairs(Globel.Mob)do DelObj(v) end;--�R����
	end
	if Globel.QQ~=nil then
		for i,v in pairs(Globel.QQ)do DelObj(v) end;--�R����
	end
	if BOSS~=nil then
		if Globel.Step ~= "Dead" then
			Globel.Step = "Reset";
			--DebugMsg( 0, RoomID ,"isDead = false");
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Zone22_Requiem_Event_BeginAttack()--�i�J�԰��ƥ�
	local BOSS = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID]
	WriteRoleValue(BOSS,EM_RoleValue_Register1,1) --�}�l�԰�
	MoveToFlagEnabled(BOSS,false);
	AddBuff(BOSS,506700,0,-1);
	BeginPlot(BOSS,"Lua_Zone22_Requiem_Fight_Ai",0);
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", true,Globel.GUID )
end
function Lua_Zone22_Requiem_Event_EndAttack()--���}�԰��ƥ�
	local Boss = OwnerID();
	local RoomID = ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID ,"Now leave Fight...");
	local TempPlayer = SetSearchAllPlayer(RoomID) --���{�b�ӰϤ����Ҧ����a
	local ThesePlayer = {}
	local BuffID = {620621,620618,620624,621588,621589}
	local Globel =Lua_Requiem_Globel[RoomID]
	MagicInterrupt( Boss );
	WriteRoleValue(Boss,EM_RoleValue_Register1,0); --���}�԰�
	--DelFromPartition( Globel.Door[2])
	CancelBuff(Boss,506700)--�MBUFF
--	DebugMsg( 0, RoomID ,"Now leave Fight...");
	if Globel.Step ~= "Dead" then
		KS_ScriptMessage( "[SC_REQUIEM_ALLDEAD]" )--����
	end
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		for j,v in ipairs(BuffID) do
			CancelBuff(ThesePlayer[i],BuffID[j])--�MBUFF
		end
	end
	CallPlot( Globel.Door[2], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	BeginPlot(Globel.Ctrl,"Lua_Zone22_Requiem_ResetObj",0);
end
function Lua_Zone22_Requiem_ResetAll()
	Lua_Zone22_Requiem_ResetObj();
end
function Lua_Zone22_Requiem_Dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID]
	KS_ScriptMessage( "[SC_REQUIEM_DEAD]" )--����
	Globel.Step = "Dead";
	CallPlot( Globel.Door[1], "Lua_Zone22_Boss1_CloseDoor", false,Globel.GUID )
	DelFromPartition( Globel.Door[1])
	return true;
end
function Lua_Zone22_Requiem_Fight_Ai()
	local BOSS = OwnerID();
	KS_ScriptMessage("[SC_REQUIEM_START]");--�}�l�԰�
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	WriteRoleValue (BOSS,EM_RoleValue_Register2,0);--���s�p��
	local FightState = 1;
	local Clock = {0,0,1};
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	local CrazyTime = 360;
	local Crazy = false;
	local HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	local FlagCount = GetMoveFlagCount ( 780992 );--�����m���X��
	Globel.Step="Nomal";
	local Msg = "";
	local NewMsg = "";
	while FightState == 1 do
		HatePlayer = KS_GetHateList( Boss, 3 );
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--�O�_�԰���
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
		NewMsg = "##FightState = "..FightState.." it's "..Globel.Step.." mode.";
		if Globel.Step ~= "Reset" then
			if Msg ~= NewMsg then
				Msg = NewMsg;
				DebugMsg( 0, RoomID ,Msg);
			end
				if Clock[1]>=10 and Globel.Step=="Nomal" then--�Ĥ@���ͤp��
					BeginPlot(BOSS,"Lua_Zone22_Requiem_Born",0);
					Clock[1]=1;
					Globel.Step="ACT2"
				elseif Clock[1]>=29 and Globel.Step=="ACT2" then--�Y�p��
					KS_ScriptMessage("[SC_REQUIEM_EAT]");
					for i,v in pairs(Globel.Mob) do
						DebugMsg( 0, RoomID ,"Now Eat..."..v);
						sysCastSpellLv( BOSS , v  , 498164, 0);
					end
					BeginPlot(BOSS,"Lua_Zone22_Requiem_Born",20);
					Clock[1]=0;
				end

				if Clock[2]>=20 then--�j��
					local XXXX = 1;
					KS_ScriptMessage("[SC_REQUIEM_SPP]");
					MagicInterrupt( BOSS );
					local RR = Rand(table.getn(HatePlayer))+1
					if Globel.Mob[10]~=nil then
						if checkID(Globel.Mob[10])==true then 
							MagicInterrupt( Globel.Mob[10] );
							XXXX=XXXX+2
						end
					end
					if Globel.Mob[20]~=nil then
						if checkID(Globel.Mob[20])==true then 
							MagicInterrupt( Globel.Mob[20] );
							XXXX=XXXX+3
						end
					end
					--DebugMsg( 0, RoomID ,"X= "..XXXX.." Globel.Mob1 = "..Globel.Mob[1].." Globel.Mob2 = "..Globel.Mob[2]);
					Sleep(10)
					CastSpellLv( BOSS , BOSS  , SkillList[3], SkillLv[3]);--BOSS
					if XXXX%3==0 then
						if Globel.Mob[10]~=nil then
							if checkID(Globel.Mob[10])==true then 
								CastSpellLv( Globel.Mob[10] , HatePlayer[RR]  , SkillList[5], SkillLv[5]);--���z 
							end
						end
					end
					if XXXX%6==0 or  XXXX%4==0 then
						if Globel.Mob[20]~=nil then
							if checkID(Globel.Mob[20])==true then
								CastSpellLv( Globel.Mob[20] , Globel.Mob[20]  , SkillList[6], SkillLv[6]);--�]�k
							end
						end
					end
					BeginPlot(BOSS,"Lua_Zone22_Requiem_AAE",30);
					Clock[2]=0;
				end
			NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
			if NowCastSpell == 0  then
				local XR = Rand(2)+1;
				if Clock[3]%7==0 then--���q�ޯ�
					if XR == 1 then
						CastSpellLv( BOSS , AttackTarget  , SkillList[1], SkillLv[1]);
					else
						local HatePlayerFa= {};--�W�L�@�ʤ����W��
						local HateDis = KS_GetHateList( Boss, 2 );--��������a�Z��
						for i,v in pairs(HateDis) do
							if v>=150 then
								table.insert( HatePlayerFa,HatePlayer[i]);
							end
						end
						if table.getn(HatePlayerFa) >0 then
							local RR = Rand(table.getn(HatePlayerFa))+1
							CastSpellLv( BOSS , HatePlayerFa[RR]  , SkillList[2], SkillLv[2]);
						else
							local RR = Rand(table.getn(HatePlayer))+1
							CastSpellLv( BOSS , HatePlayer[RR]  , SkillList[2], SkillLv[2]);
						end
					end
				end
			else
				--DebugMsg( 0, RoomID ,"Now Casting...");
			end
			if Clock[3]>=CrazyTime and Crazy == false and PID == 0 then
				KS_ScriptMessage("[SC_REQUIEM_RUSH]");
				AddBuff(BOSS,620561,0,-1);
				Crazy = true;
			end
			for i ,v in ipairs(Clock) do
				Clock[i] = Clock[i] + 1;
			--	DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
			end;
		else
			break;
		end
		Sleep(10);
	end;
--	BeginPlot(BOSS,"Lua_Zone22_Requiem_ResetObj",0)
end
function Lua_Zone22_Requiem_MM_dead()
	local OID = OwnerID();
	local RoomID = ReadRoleValue(OID,EM_RoleValue_RoomID);
	local Globel =Lua_Requiem_Globel[RoomID];
	for i,v in pairs(Globel.Mob) do
		--Say(OID,"OID= "..OID.." v ="..v);
		if OID==v then
			--Say(OID,"#OID= "..OID.." v ="..v);
			--table.remove(Globel.Mob,i);
			Globel.Mob[i]=nil;
			break;
		end
	end
	DelObj(OID);
	--return true;
end
function Lua_Zone22_Requiem_Eat()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local TID = TargetID();
	local Globel =Lua_Requiem_Globel[RoomID]
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	local TOID = ReadRoleValue(TargetID(),EM_RoleValue_OrgID)
	local HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	--Say(OwnerID(),"BOSS= "..BOSS.." TID ="..TID);
	--Say(TID,"I Will Be Eat MyID = "..TOID);
	if TID ~= BOSS then
		if TOID == MonID[2] then
			if HPP>0.5 then
				AddBuff(BOSS,620625,0,-1);
			else	
				AddBuff(BOSS,620627,0,-1);
			end
		elseif TOID == MonID[3]  then
			if HPP>0.5 then
				AddBuff(BOSS,620626,0,-1);
			else
				AddBuff(BOSS,620628,0,-1);
			end
		end
		KillID(BOSS,TID);
	else
		--Say(BOSS,"Something Wrong....!!");
	end
end
function Lua_Zone22_Requiem_MM_Ai()--�p��Ai
	local OID = OwnerID();
	SetPlot(OID,"dead","Lua_Zone22_Requiem_MM_dead",0)
	local RoomID= ReadRoleValue(OID,EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local X = ReadRoleValue ( OID, EM_RoleValue_X);
	local Y = ReadRoleValue ( OID, EM_RoleValue_Y);
	local Z = ReadRoleValue ( OID, EM_RoleValue_Z);   ---------�o���O���XAttackplayer���������ӤH���y��
	local OrgID = ReadRoleValue(OID,EM_RoleValue_OrgID);
	local AttackTarget = 0;
	local Clock = 1;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	MoveToFlagEnabled(OID,false);
	local HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	while 1 do
		AttackTarget = ReadRoleValue( OID , EM_RoleValue_AttackTargetID );
		if AttackTarget ~=0 then--�԰���
			 local Dis = kg_GetDis( OID , BOSS);
			if Dis < 100 and Clock%3==0 and Clock > 3 then
				AddBuff(OID,SkillList[11],SkillLv[11],-1);
				AddBuff(BOSS,SkillList[11],SkillLv[11],-1);
			end
			if Clock%7 ==0 then
				CastSpellLv( OID , AttackTarget  , SkillList[OrgID-MonID[1]+6], SkillLv[OrgID-MonID[1]+6]);
			elseif Clock%13 ==0 then
				CastSpellLv( OID , OID  , SkillList[OrgID-MonID[1]+8], SkillLv[OrgID-MonID[1]+8]);
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
function Lua_Zone22_Requiem_Born()
	local FlagCount = GetMoveFlagCount ( 780992 );--�����m���X��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	KS_ScriptMessage("[SC_REQUIEM_ADD]");
	local PP = Lua_Table_GetRdIndex(FlagCount,2);
	for i=1,2 do
		local BuffID = 620614+i*3
		Globel.Mob[i*10] = CreateObjByFlag ( MonID[1]+i , 780992, PP[i]-1 ,1 );--�]��remove���W�h�ҥHINDEX*10
		AddToPartition(Globel.Mob[i*10],RoomID);
		AddBuff(Globel.Mob[i*10],BuffID,0,-1)
		BeginPlot(Globel.Mob[i*10],"Lua_Zone22_Requiem_MM_Ai",0);
	end
end
function Lua_Zone22_Requiem_AAE()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_Requiem_Globel[RoomID].GUID;
	local Globel = Lua_Requiem_Globel[RoomID];
	local PID = ReadRoleValue(Globel.Ctrl,EM_RoleValue_PID);
	local SkillLv,SkillList,MonID = Lua_Zone22_Requiem_SkillLvInfo(PID);
	KS_ScriptMessage("[SC_REQUIEM_BOMB]");
	sysCastSpellLv( BOSS , BOSS  , SkillList[4], SkillLv[4]);
end
function Lua_Requiem_BornByFlagGroup(ObjID,FlagID,FlagGroup,RoomID)
	local ObjGroup = {}
	local ss = Lua_Table_GetRdIndex(5,3);
	for i,v in pairs(FlagGroup) do
	--	DebugMsg( 0, RoomID ,"i = "..i.."v = "..v);
		ObjGroup[i] = CreateObjByFlag( ObjID , FlagID , v-1 , 1 )
		SetModeEx(  ObjGroup[i]  , EM_SetModeType_NotShowHPMP, true )
		AddToPartition(ObjGroup[i],RoomID)
	end
	return ObjGroup
end