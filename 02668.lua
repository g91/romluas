function AI_Z25_Boss_6_TouchSet()	--���b���Ȫ��~����l�@�����U-�ѭ��ľ�
	local Obj = OwnerID()

	WriteRoleValue(Obj, EM_RoleValue_Register1, 6)

	SetPlot( Obj,"touch","AI_Z25_Boss_6_TouchEvent",30 )--Ĳ�I�@��
end

function AI_Z25_Boss_6_TouchEvent()
	local Player = OwnerID()
	local Obj = TargetID()
	local Count = ReadRoleValue(Obj, EM_RoleValue_Register1)

	if Count <= 0 then	--�p�G�ľ��w�g�Q�����N�������F
		return
	else
		BeginCastBarEvent( Player, Obj , "[SC_VALENTINE_2011_FN05]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSI2ON_ACTORSTATE_NORMAL , 1 , "AI_Z25_Boss_6_CastBarEvent")
	end
end

function AI_Z25_Boss_6_CastBarEvent(Player, Result)  --�I�k���ƥ�
	local Obj = TargetID()
	local Count = ReadRoleValue(Obj, EM_RoleValue_Register1)
	local CastBarDebuff = 622445
	local UseBuff = 622446

	if Result > 0 then
		AddBuff(Player, CastBarDebuff, 0, -1)
		AddBuff(Player, UseBuff, 0, 15)
		WriteRoleValue(Obj, EM_RoleValue_Register1, Count-1)
	end
	EndCastBar( Player, Result )
end

function AI_Z25_Boss_6_CancelFreezeBuff()	--�ľ��ϥΧޯ�
	local Player =  TargetID()
	local FreezeBuff = 622450

	CancelBuff(Player, FreezeBuff)
end
----------------------------------------------------------------------------
--�W���O����x���ľ��������@��
--�U���OBoss AI
----------------------------------------------------------------------------
function AI_Z25_Boss_6_End()
	--����Boss���}�԰�
	local Boss = OwnerID()
	WriteRoleValue(Boss, EM_RoleValue_Register1, 0 ) 
end

function AI_Z25_Boss_6_Begin()
	--����Boss�i�J�԰�
	CallPlot( OwnerID(), "AI_Z25_Boss_6_Main", 0 )
end

function AI_Z25_Boss_6_Main()
	--�@�ǳ]�w
	local Boss = OwnerID()
	local RoomID =ReadRoleValue(Boss, EM_RoleValue_RoomID)
	local PetTable = {}
	local Bosstype = 0	--�Y�O�쥻���F�~ �h�]��0
	WriteRoleValue(Boss, EM_RoleValue_Register1, 1 )	--Register1�g��1���}��
	WriteRoleValue(Boss, EM_RoleValue_Register2, 0 )	--����Boss��SkillA1�}��
	
	Say(Boss, "----------Begin----------")
	--Buff
	local EnvironmentBuff = 622448
	local P2Buff = 622457
	--�ۦ��ɶ�
	local SkillAtime = 7	-- ���ˤ��� / ���Z����
	local SkillBtime = 12	-- �`�H�B�j
	local SkillCtime = 17	-- �B�e�_��
	local SkillDtime = 5	-- �H�y�B��
	local SkillRageTime = 10
	
	if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 106541 then
		Say(Boss, "----------I'm Summon Boss, so not all skill i will use!----------")
		Bosstype = 1 --�Y�O���w�F�~ �h�]��1
		--�]�w�����թҥl��X�Ӫ����w�F�~��ۮɶ�
		SkillAtime = 7
		SkillCtime = 17
		SkillDtime = 5
	end
	--�ۦ�
	local SkillA1 = 499325
	local SkillA2 = 499327
	local SkillB = 499328
	local SkillC = 499329
	--�䥦�ܼ�
	local IntoP2HP = 40	--�i�J�ĤG���q����q
	local BossTime = 0

	--�}�����ҮĪG (���ˬd���w�F�~���I��)
	if Bosstype == 0 then
		AddBuff(Boss, EnvironmentBuff, 0, -1)
	end

	while true do
		Sleep(10)
		BossTime = BossTime + 1
		Say(Boss, "-Time "..BossTime.." -")
		--Boss�O�_�b�԰������欰�P�w
		if ReadRoleValue(Boss, EM_RoleValue_Register1) == 0 then
			local Hate = KS_GetHateList( Boss, 1 )
			for h = 1 , table.getn(Hate) do
				CancelBuff(Hate[h], 622450)
			end
			--
			for p = 1 , table.getn(PetTable) do
				DelObj(PetTable[p])
			end
			--
			Say(Boss, "----------Stop----------")
			return
		end
		--A ���ˤ��� / ���Z����
		if BossTime%SkillAtime == 0 then
			Say(Boss, "----------SkillA----------")
			if DW_Rand(2) == 1 then	--�H��2��1
				Say(Boss, "----------SkillA 1----------")
				local NowTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID)
				WriteRoleValue(Boss, EM_RoleValue_Register2, 0 )
				CastSpell( Boss, NowTarget, SkillA1 )
			else
				Say(Boss, "----------SkillA 2----------")
				CastSpell( Boss, Boss, SkillA2 )
			end
		end 
		--B �`�H�B�j (���ˬd���w�F�~���I��)
		if BossTime%SkillBtime == 0 and Bosstype == 0 then
			Say(Boss, "----------SkillB----------")
			local PlayerTable =  Lua_RandomPlayerFromHateList(Boss,3,true)
			for i = 1,table.getn(PlayerTable) do
				SysCastSpellLv(Boss, PlayerTable[i], SkillB, 0 )
			end
		end
		--C �B�e�_��
		if BossTime%SkillCtime == 0 then
			Say(Boss, "----------SkillC----------")
			CastSpell( Boss, Boss, SkillC )
		end
		--D �H�y�B��
		if BossTime%SkillDtime == 0 then
			Say(Boss, "----------Skill D----------")
			local PlayerTable =  Lua_RandomPlayerFromHateList(Boss, 1, true)
			local IcePet = AI_Z25_Boss_6_IcePet(RoomID, PlayerTable[1], Boss)
			table.insert(PetTable, IcePet)
		end
		-- ���� (���ˬd���w�F�~���I��)
		if BossTime%SkillRageTime == 0 and Lua_PercentHP(Boss) <= IntoP2HP and Bosstype == 0 then
			Say(Boss, "----------Skill P2 Buff----------")
			AddBuff(Boss, P2Buff, 0, -1)
		end
	end
end

function AI_Z25_Boss_6_Environment()	--���Ҫ�����|�[�ĪG
	local player = TargetID()
	local ColdBuff = 622449
	local FreezeBuff = 622450

	local Count = FN_CountBuffLevel(player,ColdBuff)
	if Count == 4 then
		CancelBuff(player, ColdBuff)
		AddBuff(player, FreezeBuff, 0, -1)
	end
end

function AI_Z25_Boss_6_SkillC()	--�B�e�_���������d��ˮ`
	local Boss = OwnerID()
	local player = TargetID()
	local skillCplus = 499330
	
	Say(Boss, "Cast Skill C")
	Say(player, "Hit by Skill C")

	local PosX = ReadRoleValue(player, EM_RoleValue_X)
	local PosY = ReadRoleValue(player, EM_RoleValue_Y)
	local PosZ = ReadRoleValue(player, EM_RoleValue_Z)

	SysCastSpellLv_Pos( Boss, PosX, PosY, PosZ, skillCplus, 0 )
end

function AI_Z25_Boss_6_SkillA1()	--���ˤ������B�~�ؼгB�z
	local Boss = OwnerID()
	local player = TargetID()
	local SkillA1plus = 499326
	local PlayerTable = SearchRangePlayer( player, 30 )
	local plusTarget = player
	Say(player, "SkillA1 cast")
	Say(player, "PlayerTable "..table.getn(PlayerTable))
	for i=0,table.getn(PlayerTable) do
		Say(PlayerTable[i], "check me! No."..i)
		if PlayerTable[i] == player then
			Say(PlayerTable[i], "i got remove")
			table.remove(PlayerTable, i)
		end
	end
	Say(player, "PlayerTable "..table.getn(PlayerTable))
	if ReadRoleValue(Boss, EM_RoleValue_Register2) == 0 then
		if table.getn(PlayerTable) >= 1 then
			plusTarget = PlayerTable[Rand(table.getn(PlayerTable))]
			Say(plusTarget, "me! me! me!")
		end
		SysCastSpellLv(Boss, plusTarget, SkillA1plus, 0 )
		WriteRoleValue(Boss, EM_RoleValue_Register2, 1 )
	end
end

function  AI_Z25_Boss_6_IcePet( RoomID, Player, Boss )--�l��H�y�B��
	local PetBuff = 622459

	local PosX = ReadRoleValue(player, EM_RoleValue_X)
	local PosY = ReadRoleValue(player, EM_RoleValue_Y)
	local PosZ = ReadRoleValue(player, EM_RoleValue_Z)

	local IcePet = LuaFunc_CreateObjByObj( 106639, Boss )
	SetModeEx( IcePet, EM_SetModeType_Fight, false );	--�L�k���
	SetModeEx( IcePet, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( IcePet, EM_SetModeType_Strikback , false );	-- ����
	SetModeEx( IcePet, EM_SetModeType_Mark , false );	-- �аO
	SetModeEx( IcePet, EM_SetModeType_NotShowHPMP, true );--�S�����
	AddToPartition( IcePet, RoomID );
	AddBuff( IcePet, PetBuff, 0, -1 );--�~�[
	MoveDirect( IcePet, PosX, PosY, PosZ )
	--
	if ReadRoleValue( Boss , EM_RoleValue_OrgID ) == 106541 then
		--�Y�O���w�F�~ �h�]�H�y�B����z��AE�ĪG����ɶ���6��
		WriteRoleValue(IcePet, EM_RoleValue_Register1, 6)
	else
		--�_�h�N�O�ä[�� �n�a�ľ��Ѱ�
		WriteRoleValue(IcePet, EM_RoleValue_Register1, -1)
	end
	--
	CallPlot( IcePet, "AI_Z25_Boss_6_IcePet_die", 0 )
	--
	return IcePet
end

function AI_Z25_Boss_6_IcePet_die()
	Sleep(180)
	local pet = OwnerID()
	local icebuff = 622450
	local PlayerTable = SearchRangePlayer( pet, 60 )
	local BuffTime = ReadRoleValue(pet, EM_RoleValue_Register1)
	Say(pet, "- Pet Die! -")
	for i = 0 , table.getn(PlayerTable) do
		Say(PlayerTable[i], "- Freeze me! -")
		AddBuff(PlayerTable[i], icebuff, 0, BuffTime)
	end

	DelObj(pet)
end