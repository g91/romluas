--Modifier : K.J. Aris
--Version : 131128
--NPC 105893



function Lua_Zone21_BeastLord_SkillLvInfo()
	local SkillLv = {	0,		--��z���խ��x
			0,		--�~���F��
			0,		--��z���դ���
			0,		--��z���դ���
			0}		--��z���դ���
	return SkillLv;
end
function Lua_Zone21_BeastLord_SkillInfo()
	local SkillList = {	498105,	--��z���խ��x
			498106,	--�~���F��
			498107,	--��z���դ���
			498110,	--��z���դ���
			498108}	--��z���դ���
	return SkillList;
end
function Lua_Zone21_BeastLord_Event_BeginAttack()--�i�J�԰��ƥ�
	Lua_DW_WBGUIDRecord(1)
	Lua_DW_WBLvCheck_Table(DW_HateRemain(0));
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,1) --�}�l�԰�
	MoveToFlagEnabled(OwnerID(),false);
	AddBuff(OwnerID(),506700,0,-1);
	BeginPlot(OwnerID(),"Lua_Zone21_BeastLord_Fight_Ai",0);	
end
function Lua_Zone21_BeastLord_Event_EndAttack()--���}�԰��ƥ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	--DebugMsg( 0, RoomID ,"Now leave Fight...");
	local BOSS = Lua_BeastLord_Globel.GUID;
	if ReadRoleValue(BOSS,EM_RoleValue_IsDead)==0 then
		local npc=ReadRoleValue(BOSS,EM_RoleValue_Register9);
		WriteRoleValue(npc,EM_RoleValue_Register9,0);
		DisableQuest(npc,false)
	end
	Lua_Zone21_BeastLord_ResetAll();
end
function Lua_Zone21_BeastLord_ResetAll()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	WriteRoleValue(BOSS,EM_RoleValue_Register1,0); --���}�԰�
	BeginPlot(BOSS,"Lua_Zone21_BeastLord_ResetObj",0);
end
function Lua_Zone21_BeastLord_Create()--���󲣥ͼ@��
	Lua_DW_WBGUIDRecord(1)
	local Boss = OwnerID();
	local RoomID= ReadRoleValue(Boss,EM_RoleValue_RoomID);
	SetModeEx( Boss  , EM_SetModeType_Move, false );--����
	--�ŧi�Ҧ������ܼ�
	if Lua_BeastLord_Globel==nil then
		Lua_BeastLord_Globel={};
		Lua_BeastLord_Globel={GUID=Boss,Step="Nomal",Blood={},Percent=95,Angry=0,SkillQueue={},Revive=1,ReviveXX=0};
	else
		Lua_Zone21_BeastLord_ResetObj();
		--���m�Ҧ������ܼ�
		Lua_BeastLord_Globel={GUID=Boss,Step="Nomal",Blood={},Percent=95,Angry=0,SkillQueue={},Revive=1,ReviveXX=0};
	end
end
function Lua_Zone21_BeastLord_ResetObj()--���m����@��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	local Globel =Lua_BeastLord_Globel
	if Lua_BeastLord_Globel.Blood~=nil then
		for i,v in ipairs(Lua_BeastLord_Globel.Blood)do DelObj(v) end;--�R����
	end
	if BOSS~=nil then
		if Globel.Step ~= "Dead" then
			--DebugMsg( 0, RoomID ,"isDead = false");
			DelObj(BOSS);--�R����
		else
			--DebugMsg( 0, RoomID ,"isDead = true");
		end
	end
end
function Lua_Zone21_BeastLord_Dead()
	local Globel =Lua_BeastLord_Globel
	Globel.Step = "Dead";
	Globel.Revive = 0;
	Lua_SetClockPlot(288000,"Lua_Zone21_BeastLord_Revive")
--������O���@�ɤ��A�����ͪ��ɶ��A�٦����ͪ���H
	DeBugMSG(0,0,"Next will be "..Lua_Z21_WorldBoss_ResetTime(OwnerID()))
	return true;
end
function Lua_SetClockPlot(Time,Sctipt)
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(OwnerID());
	local XX = CreateObj(121381,x,y,z,dir,1);
	local Globel =Lua_BeastLord_Globel;
	Globel.ReviveXX = XX;
	SetModeEx(  XX, EM_SetModeType_Show, false );--���
	SetModeEx( XX  , EM_SetModeType_Strikback, false );--����
	SetModeEx( XX  , EM_SetModeType_SearchenemyIgnore, false );--�Q�j�M
	SetModeEx( XX  , EM_SetModeType_Obstruct, false );--����
	SetModeEx( XX  , EM_SetModeType_Mark, false );--�аO
	SetModeEx( XX  , EM_SetModeType_Move, false );--����
	SetModeEx( XX  , EM_SetModeType_Searchenemy, false );--����
	SetModeEx( XX  , EM_SetModeType_ShowRoleHead, false );--�Y����
	SetModeEx( XX  , EM_SetModeType_Fight , false );--�i�������
	SetModeEx( XX  , EM_SetModeType_NotShowHPMP, true )
	AddToPartition(XX,RoomID);
	BeginPlot(XX,Sctipt,Time);
end
function Lua_Zone21_BeastLord_Revive()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel;
	Globel.Revive = 1;
	DebugMsg( 0, RoomID ,"BOSS can Revive");
	DelObj(OwnerID());
end
function Lua_Zone21_BeastLord_GoRevive()
	local Globel =Lua_BeastLord_Globel;
	Globel.Revive = 1;
	DelObj(Globel.ReviveXX);
	Globel.ReviveXX = 0;
end
function Lua_Zone21_BeastLord_Fight_Ai()--�԰�AI
	local BOSS = OwnerID();
	local RoomID= ReadRoleValue(BOSS,EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local FightState = 1;
	local BloodCount = 0
	local AttackTarget;
	local NowCastSpell = 0;
	local HPP = 0;
	local AngryTime = 1;
	local Clock = 1;
	local MaxHP = ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	--local HatePlayer = KS_GetHateList( Boss, 4 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)
	local HatePlayer = KS_GetHateList( Boss, 1 );--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a; 4�L�oGM)	--K.J. Aris 101128
	SetPlot(BOSS,"dead","Lua_Zone21_BeastLord_Dead",0)
	LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );
	while FightState == 1 do
		FightState = ReadRoleValue(BOSS,EM_RoleValue_Register1);		--�O�_�԰���
		BloodCount = table.getn(Globel.Blood);
		AttackTarget = ReadRoleValue( BOSS , EM_RoleValue_AttackTargetID );
		NowCastSpell = ReadRoleValue( BOSS , EM_RoleValue_SpellMagicID );
		HPP =ReadRoleValue(BOSS,EM_RoleValue_HP)/ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
		--HatePlayer = KS_GetHateList( Boss, 3 );
		HatePlayer = KS_GetHateList( Boss, 1 );--K.J. Aris 101128
	--	DebugMsg( 0, RoomID ,"FightState = "..FightState.." BloodCount = "..BloodCount.." it's "..Globel.Step.." Percent ="..Globel.Percent.." Angry = "..Globel.Angry);

		if NowCastSpell == 0  then--�p�G�S���I�k�A�~��AI
			if BloodCount < 4 and Globel.Step == "Invincible" then
				CancelBuff(BOSS,620552);
				--�����L��
				Globel.Step = "Nomal";
			elseif BloodCount >= 4 and Globel.Step == "Nomal" then
				AddBuff(BOSS,620552,0,-1);
				KS_ScriptMessage("[SC_BEASTLORD_5]")
				Globel.Step ="Invincible";
				--���W�L��
			end
			--��z���դ���[�J�ޯ�Ƶ{
			if AngryTime%27 == 0 then
				table.insert(Globel.SkillQueue,{BOSS,SkillList[5],SkillLv[5],"[SC_BEASTLORD_4]"})
			end
			if table.getn(Globel.SkillQueue)>0 then
			--�p�GSkillQueue�����ޯ�N��SkillQueue�����ޯ�
		--		DebugMsg( 0, RoomID ,"SkillQueue = "..table.getn(Globel.SkillQueue));
				for i,v in ipairs(Globel.SkillQueue) do
					if CheckID(v[1]) == true and ReadRoleValue(v[1],EM_RoleValue_IsDead) == 0  then
			--			DebugMsg( 0, RoomID ," v[1] = ".. v[1].." v[2] = ".. v[2].." v[3] = ".. v[3]);
						CastSpellLv( BOSS , v[1]  , v[2], v[3]);
						KS_ScriptMessage(v[4]);
					end
					table.remove(Globel.SkillQueue,i);
					break;
				end
			else
			--�p�GSkillQueue���S�ޯ�N��@��ޯ�
				if GetDistance(BOSS,AttackTarget)>70 then--���p�̰����릳�L�b�����d��
					--DebugMsg( 0, RoomID ,"NomalSkill");
					local RAT = HatePlayer[Rand(table.getn(HatePlayer))+1]
					if ( RAT ~= nil ) then
						CastSpellLv( BOSS , RAT , SkillList[1], SkillLv[1]);--�I�񭸴x
					end
					
				end
			end
		end
		if Globel.Angry==1 then--�w�}�Ҭ��
			AngryTime = AngryTime +1
		end
		Clock = Clock +1
		Sleep(10)
		Lua_DW_WBLvCheck_Table(HatePlayer);
	end

end
function Lua_Zone21_BeastLord_Blood()
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local BOSS = Globel.GUID;
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local OHPP =ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
	--DebugMsg( 0, RoomID ,"OHPP = "..OHPP);
	--Globel.Percent = math.floor(OHPP*100/5)*5;
	Globel.Percent = Globel.Percent -5;
--	DebugMsg( 0, RoomID ,"Globel.Percent  = "..Globel.Percent );
	local MaxHP = ReadRoleValue(BOSS,EM_RoleValue_MaxHP);
	LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );--���]�U���ؼ�
	--local HatePlayer = KS_GetHateList( Boss, 3 )
	local HatePlayer = KS_GetHateList( Boss, 1 );--K.J. Aris 101128
	if Globel.Angry==0 then--���}�Ҭ��
		Globel.Angry = 1;
	end
	KS_ScriptMessage("[SC_BEASTLORD_1]");
	--DebugMsg( 0, RoomID ,"HatePlayerCount = "..table.getn(HatePlayer));
	if table.getn(HatePlayer) > 1 then
		local RAT = HatePlayer[Rand(table.getn(HatePlayer)-1)+2]
		--DebugMsg( 0, RoomID ,"RAT = "..RAT);
		sysCastSpellLv( BOSS , RAT , SkillList[2], SkillLv[2]);--�I���F��
	else
		--DebugMsg( 0, RoomID ," HatePlayer[1] = ".. HatePlayer[1]);
		sysCastSpellLv( BOSS , HatePlayer[1] , SkillList[2], SkillLv[2]);--�I���F��
	end
end
function Lua_Zone21_BeastLord_BornBlood()--�ͤp�Ǽ@��
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	--�ͤp��
	local XX = Rand(20)+31;
	local BloodOrgID;
	if ReadRoleValue(BOSS,EM_RoleValue_OrgID)==105893 then
		BloodOrgID=105910;
	else
		BloodOrgID=107191;
	end
	local Blood = kg_GetPosRX( TargetID() , BloodOrgID , XX , 0 , math.random(360) , math.random(360) );
	AddToPartition(Blood,RoomID);
	table.insert(Lua_BeastLord_Globel.Blood,Blood);
	SetAttack(Blood,TargetID());
	AddBuff(Blood,508481,0,-1);--AE�L��
	SetPlot(Blood,"dead","Lua_Zone21_BeastLord_BloodDead",0)
	local BloodCount = table.getn(Lua_BeastLord_Globel.Blood);

	--���ͤ@�ӯS��p�ɾ��ɶ���N�ޯ�[�J�����S��Ƶ{
	local Timer = CreateObjByObj(121381,BOSS);
	SetModeEx(  Timer, EM_SetModeType_Show, false );--���
	CallPlot(Timer,"Lua_Zone21_BeastLord_SkillTimer",Blood)
end
function Lua_Zone21_BeastLord_SkillTimer(Blood)
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local BOSS = Lua_BeastLord_Globel.GUID;
	local SkillList = Lua_Zone21_BeastLord_SkillInfo();
	local SkillLv = Lua_Zone21_BeastLord_SkillLvInfo();
	local Clock =1;
	--DebugMsg( 0, RoomID ,"Blood = ".. Blood);
	while 1 do
		--DebugMsg( 0, RoomID ,"Clock = ".. Clock);
		if ReadRoleValue(BOSS,EM_RoleValue_Register1)==0 or CheckID(BOSS)==false then
			break;
		end
		if Clock%11==0 then
			table.insert(Lua_BeastLord_Globel.SkillQueue,{BOSS,SkillList[3],SkillLv[3],"[SC_BEASTLORD_2]"});
		elseif Clock%21==0 then
			table.insert(Lua_BeastLord_Globel.SkillQueue,{Blood,SkillList[4],SkillLv[4],"[SC_BEASTLORD_3]"});
			break;
		end
		Clock = Clock +1;
		Sleep(10);
	end
	DelObj(OwnerID());
end
function Lua_Zone21_BeastLord_EatBlood()
--	Say(OwnerID(),"OwnerID");
--	Say(TargetID(),"TargetID");
	local RoomID= ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local Globel =Lua_BeastLord_Globel
	local BOSS = Globel.GUID;
	local HPP =ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP);
	if HPP > 0 then
		local OHPP =ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
		local MaxHP = ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP);
		HPP = math.floor(HPP*100)
		local ADDHP = math.ceil(HPP/20)
		SetPosByObjDis(OwnerID(),TargetID(),0);
		DebugMsg( 0, RoomID ,"#HPP = "..HPP.." ADDHP = "..ADDHP);
		AddRoleValue(OwnerID(),EM_RoleValue_HP,ADDHP/100*ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP));--��֤���
		Globel.Percent = math.ceil(OHPP*100/5)*5;
		DebugMsg( 0, RoomID ,"#Globel.Percent  = "..Globel.Percent );
		LockHP( BOSS , MaxHP/100*Globel.Percent , "Lua_Zone21_BeastLord_Blood" );--���]�U���ؼ�
		KillID(OwnerID(),TargetID());
	end
end
function Lua_Zone21_BeastLord_BloodDead()
	local Blood = Lua_BeastLord_Globel.Blood;
	local OID = OwnerID();
	for i,v in ipairs(Blood) do 
		if v== OID then
			table.remove(Blood,i);
			break;
		end
	end
	return true;
end
function Lua_Zone21_BeastLord_Draw(Lv)
	if Lua_Zone21_Sinter_isGM()==false then
		return false;
	end
	local Caster,Target = OwnerID(),TargetID();
	SysCastSpellLv(Target,Caster,499638,Lv)
end
function Lua_Zone21_BeastLord_DrawH(Lv)
	if Lua_Zone21_Sinter_isGM()==false then
		return false;
	end
	local Caster,Target = OwnerID(),TargetID();
	SysCastSpellLv(Target,Caster,499639,Lv)
end
function Lua_Z21_WorldBoss_ResetTime(Boss)--Z21���@�ɤ������ܤƳW�h�A�|�۰ʰO���ɶ��A�Ұʭ˼ƨæ^�ǵ��G
	--EM_RoleValue_Register9�A�O��npc��GUID
	--EM_RoleValue_Register8�A�O�������O�_��HardCore�Ҧ�
	local npc=ReadRoleValue(Boss,EM_RoleValue_Register9);
	local HardCore=(ReadRoleValue(Boss,EM_RoleValue_Register8)==0);
	local Next="Which One?"
	local StandardRevive=28800
	local HardCoreRevive=259200
	
	if HardCore==true then
		Next="Old Mode";
	else
		if DW_Rand(100)>=55 then--���v45%���X���q��
			Next="Old Mode";
		else
			WriteRoleValue(npc,EM_RoleValue_Register9,1);
			WriteRoleValue(npc,EM_RoleValue_Register8,0);
			CallPlot(npc,"Lua_Z21_WorldBoss_Reseting",Lua_RandReviveTime(HardCoreRevive)); 
			Next="Hard Core";
			return "Hard Core";
		end
	end
	if Next=="Old Mode" then
		WriteRoleValue(npc,EM_RoleValue_Register9,1);
		WriteRoleValue(npc,EM_RoleValue_Register8,1);
		CallPlot(npc,"Lua_Z21_WorldBoss_Reseting",Lua_RandReviveTime(StandardRevive)*10); 
		return "Old Mode"
	end
end
function Lua_Z21_WorldBoss_Reseting(ResetTime)--�Hsleep���ݤ�������
	Sleep(ResetTime);
	WriteRoleValue(OwnerID(),EM_RoleValue_Register9,0);
	DisableQuest(OwnerID(),false);
	return;
end
function Lua_RandReviveTime(ResetTime,Range)--�����Ҫ��������H���ɶ�,�^�Ǭ��(���G��)
	local RandRant
	if Range==nil then
		RandRant=30;
	else
		RandRant=Range;
	end
	if ResetTime==nil or type(ResetTime)~="number" then
		return false;
	end
	local NumberRange=math.floor(ResetTime*RandRant/100);
	return ResetTime-NumberRange+DW_Rand(NumberRange*2);
end