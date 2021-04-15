function Lua_FN_RescueII_NPCtalk() --���bNPC�W���}����׳���ܨƥ�
	--Owner�O���a Target�ONPC
	AdjustFaceDir( TargetID(), OwnerID(), 0 ) 
	if ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 2 then --Register1�ΨӰO�񪱮a�C���i�檬�p�A0���٨S�i��A1���i�椤�A2���w�g�i��L
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_FINISH]"  ) --NPC�C��������x��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_Rescue_LEAVE", 0 ) --�ﶵ:���}�շ�
	elseif ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) == 1 then
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_PLAYING]"  ) --NPC�C��������x��
	else
		SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_START]"  ) --NPC�}�l�C���e�x��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RULE]"  , "Lua_FN_RESCUEII_RULE", 0 ) --�ﶵ:�W�h����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUEII_STRING_01]"  , "Lua_FN_RESCUEII_Start", 0 ) --�ﶵ:�i��϶˸շ�
		AddSpeakOption( OwnerID(), TargetID(), "[SC_EXIT_EXAM]"  , "Lua_FN_RESCUE_LEAVE", 0 ) --�ﶵ:���}�շ�
	end
end

function Lua_FN_RESCUEII_RULE() --�C���о�
	SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_RULE]"  ) --NPC�x��
end

function Lua_FN_RESCUEII_Start()
	SetSpeakDetail( OwnerID(), "[SC_RESCUEII_STRING_02]"  )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_EASY]"  , "Lua_FN_RESCUEII_EASYMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_NORMAL]"  , "Lua_FN_RESCUEII_NORMALMODE", 0 )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RESCUE_STRING_HARD]"  , "Lua_FN_RESCUEII_HARDMODE", 0 )
end

function Lua_FN_RESCUEII_EASYMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 1)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_NORMALMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 2)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_HARDMODE()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register1, 4)
	BeginPlot( TargetID(), "Lua_FN_RESCUEII_Main", 0 ) --Target�ONPC
	CloseSpeak( OwnerID() ) 
end

function Lua_FN_RESCUEII_Main()
--	Owner��NPC�ATarget�����a
	local hardlevel = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 ) --1>²��B2>���q�B3>�x��
	local Player = TargetID()
	local MainNPC = OwnerID()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local Timer = 1 --�p�ɾ�
	local TempNPC --�u�O�����H��O����
	local TempNPCGroup = {} --�O���i����NPC��
	local SkillA = 0 --����ˮ` 495738
	local SkillB1 = 0 --�s��ˮ` 495737
	local SkillB2 = 0 --�s��ˮ` 495739
	local SkillTimer = 0 --�Ψ����ݭn�I�i���k�N�����Ĭ�
	local SkillC1 = 0 --���v�� 506918
	local SkillC2 = 0 --�jDOT 506920
	local SkillD = 0 --����500974
	local TempLocation = SearchRangeNPC ( OwnerID() , 300 ) --�u�O���Ӥ@�}�l�w���
	--�]�w�C��X��--
	WriteRoleValue ( Player , EM_RoleValue_Register1, 1)
	SetFlag (TargetID()  , 542247, 1 ) -- �϶˸շ�2
	--�гy�f�w--
	for i=0,table.getn(TempLocation) do
		if ReadRoleValue( TempLocation[i], EM_RoleValue_OrgID  ) == 114963 then
			TempNPC = Lua_FN_RESCUEII_Creat(TempLocation[i])
			AddBuff(TempNPC,506919,1,-1)
			table.insert (TempNPCGroup,TempNPC)
		end
	end
	--�������a�B�~�ޯ�--
	AddBuff(Player,506921,1,-1)
	AddBuff(Player,506922,1,190)
	--�Щx�򪱮a�L��--
	AddBuff(Player,506928,1,-1)
	AddBuff(MainNPC,506928,1,-1)
	--�p�ɾ�--
	ClockOpen( Player , EM_ClockCheckValue_13  , 180 , 180 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--�ɶ��H���
	-----�C���D��j��-----
	while true do
		SkillA = Timer%7
		SkillB1 = Timer%13
		SkillB2 = Timer%19
		SkillC1 = Timer%14
		SkillC2 = Timer%16
		SkillD = Timer%30
		-----�k�N�I���-----
		---²������---
		TempNPC = Lua_FN_RESCUEII_RanPick(TempNPCGroup)
		if SkillTimer == 0 then
			if SkillB2 == 0 then
				CastSpell( MainNPC , MainNPC , 495739 )
				SkillTimer = 2
			elseif SkillB1 == 0 then
				CastSpell( MainNPC ,  TempNPC , 495737 )
				SkillTimer = 2
			elseif SkillA == 0 then
				CastSpell( MainNPC , TempNPC , 495738 )
				SkillTimer = 2
			end
		end
		---�@������---
		if hardlevel > 1 then
			if SkillC1 == 0 then
				AddBuff(TempNPC,506918,1,12)
			end
			if SkillC2 == 0 then
				AddBuff(TempNPC,506920,1,7)
			end
		end
		---�x������---
		if hardlevel > 2 then
			if SkillD == 0 then
				ScriptMessage( Player, Player, 1, "[SC_RESCUEII_STRING_03]", "0xffffffff" )
				AddBuff(Player,500974,1,2)
			end
		end
		--
		Sleep(10)
		Timer = Timer + 1
		--
		if SkillTimer > 0 then
			SkillTimer = SkillTimer -1
		end
		-----�����-----
		for x=1,table.getn(TempNPCGroup) do --�ˬd���S���������f�H
			if ReadRoleValue ( TempNPCGroup[x] , EM_RoleValue_IsDead ) == 1 then
				WriteRoleValue ( Player , EM_RoleValue_Register2, 1) --�g��1��ܹC������
			end
		end
		if ReadRoleValue ( Player , EM_RoleValue_Register2 ) == 1 then
			ScriptMessage( Player, Player, 1, "[SC_RESCUEII_STRING_FAIL]", "0xffffffff" )
			Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,1,hardlevel)
			break;
		end
		--�ɶ��I--
		if Timer == 60 then --1����
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_06]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_04]")
		elseif Timer == 120 then --2����
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_07]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_05]")
			CastSpell( MainNPC , MainNPC , 495739 )
		elseif Timer == 180 then --3�����ɶ���
			ScriptMessage( Player, Player, 1, "[SC_RESCUE_STRING_08]", "0xffffffff" )
			Say(MainNPC,"[SC_RESCUEII_STRING_06]")
			Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,2,hardlevel)
			break;
		end
		--
	end
	-----�C���D��j��End-----
end
----------------------------------GameOver----------------------------------
function Lua_FN_RESCUEII_END(Timer,Player,MainNPC,RoomID,TempNPCGroup,Endtype,hardlevel )
	for i=1,table.getn(TempNPCGroup) do
			DelObj(TempNPCGroup[i]) --�R���ѤU���f�H
	end
	--
	ClockClose(Player)--��������
	---���---
	local Score = hardlevel*Timer
	if Endtype == 1 then --1���C�����ѡB2���D�Ԧ��\
		Say(MainNPC, "[SC_RESCUEII_STRING_END1]")
		Score = Score/2
	elseif Endtype == 2 then
		Say(MainNPC, "[SC_RESCUEII_STRING_END2]")
		if hardlevel ~= 1 then
			Score = Score+60
		end
	end
	AdjustFaceDir( MainNPC, Player, 0 ) 
	Say(MainNPC, "[SC_RESCUE_STRING_NPC08][$SETVAR1="..Score.."]")
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING14]", "0xffFEFF91" )
--	ScriptMessage( Player, Player, 0, "[SC_DDR_STRING15]"..Score, "0xffFEFF91" )
--	AddRoleValue(Player,EM_RoleValue_Honor,Score) -- �W�[�a�A��
	FN_GuildGame_Honor( Player, Score )
	--
	sleep(100)
	CancelBuff(Player,506921)
	CancelBuff(Player,506922)
	AddBuff( Player ,503693 ,1 , 1 )
	sleep(10)
	ChangeZone( Player, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 ) --�Ǧ^�h
	sleep(10)
	--
	WriteRoleValue ( Player , EM_RoleValue_Register2, 0) --���m���ѧP�w
end
----------------------------------�гy�f�w----------------------------------
function Lua_FN_RESCUEII_Creat(TempLocation)
	local Unit
	local RandUnit = 0
	RandUnit = Rand(4)
	if RandUnit == 0 then --�H���|�سy��
		Unit = CreateObjByObj(101551, TempLocation ) 
	elseif RandUnit == 1 then 
		Unit = CreateObjByObj(101552, TempLocation )
	elseif RandUnit == 2 then 
		Unit = CreateObjByObj(102639, TempLocation )
	elseif RandUnit == 3 then 
		Unit = CreateObjByObj(103070, TempLocation )
	end
	--SetDefIdleMotion(Unit,ruFUSION_MIME_DEATH_LOOP) --������U�ʧ@
	SetPlot(Unit,"dead","Lua_FN_RESCUE_dead",0) --�����`�@��
	AddBuff(Unit,502707,0,-1)
	return Unit
end
----------------------------------�H���f�w----------------------------------
function Lua_FN_RESCUEII_RanPick(TempNPCGroup)
	local X = table.getn(TempNPCGroup)
	local RanX = Rand(X)
	local TempNPC = TempNPCGroup[RanX+1]
	return TempNPC
end
----------------------------------���檺���`�@��----------------------------------
function Lua_FN_RESCUEII_dead()
	local y = Rand(2)
	if y == 0 then
		Yell (OwnerID(),"[SC_RESCUE_STRING_NPC04]", 5)
	else
		Yell (OwnerID(),"[SC_RESCUE_STRING_NPC05]", 5)
	end
end