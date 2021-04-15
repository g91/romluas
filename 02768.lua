function LUA_YOYO_ChessGladiatorSkill_Chase() --���k�Ѿ�-�Ѱ��h-�X�Ӱl���A�P�_�ؼЬO�_���A�O�_���w�t���A�A�Y�O�h�����l�[�ˮ`�ĪG
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623573)
	local BuffCensor02 = Checkbuff(Tar , 623603)
	local BuffCensor03 = Checkbuff(Tar , 623618)	
	local BuffCensor04 = Checkbuff(Tar , 623619)	
	local BuffCensor05 = Checkbuff(Tar , 623651)	
	if 
	BuffCensor01 == TRUE or 
	BuffCensor02 == TRUE or 
	BuffCensor03 == TRUE or 
	BuffCensor04 == TRUE or 
	BuffCensor05 == TRUE then
		return TRUE
	else	return FALSE
	end
end

function LUA_YOYO_ChessGladiatorSkill_Spiral() --���k�Ѿ�-�Ѱ��h-�����p�A�P�_�ؼЬO�_���A�O�_���}�Ҫ��A�A�Y�O�h�����l�[�y��ĪG
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623556)
	local BuffCensor02 = Checkbuff(Tar , 623610)
	if 
	BuffCensor01 == TRUE or 
	BuffCensor02 == TRUE then
		return TRUE
	else	return FALSE
	end
	if ReadRoleValue( Target , EM_RoleValue_IsNPC ) == 1 then --�p�G��NPC�h���ĪG����
		return false
	end
end

function LUA_YOYO_ChessGladiatorSkill_Shock() --���k�Ѿ�-�Ѱ��h-�_���i�A�P�_�ؼЬO�_���A�O�_���·����A�A�Y�O�h�����l�[�˦a�ĪG
	local Tar = TargetID()
	local TarBuffCount = BuffCount(tar)
	local BuffCensor01 = Checkbuff(Tar , 623612)
	if 
	BuffCensor01 == TRUE then
		return TRUE
	else	return FALSE
	end
end

function LUA_YOYO_ChessGladiatorSkill_Collide() --���k�Ѿ�-�Ѱ��h-�Z��ļ��A�����ܥؼЩҦb��m
	local Owner = OwnerID()
	local Target = TargetID()
	local SkillID = 850496
	local OwnerX , OwnerY , OwnerZ , OwnerDir = DW_Location(Owner) --���X�ۤv���y�лP���V
	local TargetX , TargetY , TargetZ , TargetDir = DW_Location(Target) --���X�ؼЪ��y�лP���V
	SetPos( OwnerID() , TargetX , TargetY , TargetZ , OwnerDir )
	SysCastSpellLv( Owner , Owner , SkillID , 1 )
end

function LUA_YOYO_ChessGladiatorSkill_Teleports() --���k�Ѿ�-�Ѱ��h-�����A�����ܥؼЫe��
	local Owner = OwnerID()
	local Target = TargetID()
	local TargetX , TargetY , TargetZ , Dir = DW_Location(Target) --���X�ؼЪ��y�лP���V
	local Dx , Dz
	Dir = Dir + 180
	
	if Dir>360 then
		Dir = Dir - 360
	end	
	
	Dir = (360 - Dir) / 57.2958
	
	for Angle = 15 , 0 , -5 do
		Dx = math.cos(Dir) * Angle
		Dz = math.sin(Dir) * Angle
		
		if CheckLine(Target , TargetX + Dx , TargetY , TargetZ + Dz) == true then
			break
		end
		
	end
	SetPos( OwnerID() , TargetX + Dx , TargetY , TargetZ + Dz , Dir )
end

function LUA_YOYO_HealLimit() --�v������a
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then
		return false;
	else
		return true
	end
end

function LUA_YOYO_TeleportsLimit() --��������
	local Owner = OwnerID()
	local Target = TargetID()
	local RoomID = ReadRoleValue(Owner , EM_RoleValue_RoomID)
	local Sktalk = {"[DUELIST_SKILL_01]"}
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then
		return false;
	end
	if Owner == Target then
		ScriptMessage( Owner , Owner , 2 , Sktalk[1] , 2 )
		return false
	else
		return true
	end
end

function LUA_YOYO_ChessGladiatorSkill_TrapObj()	--��K����Ū���ƭ�
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local ATK = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_ATK) ---��D�H�����O
	local DMG = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_Dmg) ---��D�H���z�ˮ`
	local HIT = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_HitLv) ---��D�H���z�R������
	local CRI = ReadRoleValue( Master , EM_RoleValue_Fin_Phy_CritRate) ---��D�H�z������
	local LV = ReadRoleValue(Master,EM_RoleValue_LV) ---Ū�D�H������
		SetModeEx(OwnerID(),EM_SetModeType_Mark,false)
		SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
		SetModeEx(OwnerID(), EM_SetModeType_Move, false)
		SetModeEx(OwnerID(),EM_SetModeType_Fight, false) 
		SetModeEx(OwnerID(),EM_SetModeType_Strikback, false) 
		SetModeEx(OwnerID(),EM_SetModeType_HideName,false)              ---�����Y�W�O�_��ܦW��
		SetModeEx(OwnerID(),EM_SetModeType_HideMinimap,false)           ---����O�_�b�p�a�ϤW���
		SetModeEx(OwnerID(),EM_SetModeType_NotShowHPMP,false)           ---����ܦ��
	WriteRoleValue( OwnerID(), EM_RoleValue_LV, LV)
	--say (OwnerID() , "MASTERALV = "..LV)
	AddBuff (OwnerID() , 507186 , (ATK*0.5) , -1)
	--say (OwnerID() , "MASTERATK = "..ATK)
	AddBuff (OwnerID() , 507190 , (DMG*0.1) , -1)
	--say (OwnerID() , "MASTERDMG = "..DMG)
	AddBuff (OwnerID() , 507192 , (HIT*0.8) , -1)
	--say (OwnerID() , "MASTERHIT = "..HIT)
	AddBuff (OwnerID() , 507194 , (CRI*0.5) , -1)
	--say (OwnerID() , "MASTERCRI = "..CRI)
end

function LUA_YOYO_ChessGladiatorSkill_PrecisionTrap() --��K����
	local own = OwnerID() --��������
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID ) -- ���D�H
	local monster = LuaFunc_CreateObjByObj ( 107330 , own ) --�b�����B���ͤ@�T����ʪ����ó���
	SetModeEx(monster,EM_SetModeType_Mark, false) --���i�I��
	SetModeEx(monster,EM_SetModeType_HideName, false) --����ܦW��
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false) --����O���
	SetModeEx(monster,EM_SetModeType_Strikback, false) --���|����
	SetModeEx(monster,EM_SetModeType_Move, false) --���|����
	SetModeEx(monster,EM_SetModeType_Fight, false) --���i���
	SetModeEx(monster,EM_SetModeType_Searchenemy, false) --���|����
	SetModeEx(monster,EM_SetModeType_Obstruct, false) --�S�����׮ĪG
	AddToPartition(monster,RoomID) --�N�������
	WriteRoleValue(monster,EM_RoleValue_register1,Master) --�g�J�{���ݩ�1
	WriteRoleValue(monster,EM_RoleValue_Livetime,60) --�g�J�s�b�ɶ�
	Beginplot(monster,"LUA_YOYO_ChessGladiatorSkill_PrecisionTrapEffect",0) --��K�����ĪG
end
function LUA_YOYO_ChessGladiatorSkill_PrecisionTrapEffect() --��K�����ĪG
	local own = OwnerID()
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	while 1 do
		sleep(10)
		SysCastSpellLv(master,own,850436,0) --�I�i1�Ū������ˮ`
	end
end

function LUA_YOYO_ChessGladiatorSkill_AbsoluteField() --������
	local own = OwnerID() --��������
	local RoomID = ReadRoleValue(own , EM_RoleValue_RoomID)
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID ) -- ���D�H
	local monster = LuaFunc_CreateObjByObj ( 107366 , own ) --�b�����B���ͤ@�T����ʪ����ó���
	SetModeEx(monster , EM_SetModeType_Mark, false) --���i�I��
	SetModeEx(monster , EM_SetModeType_HideName, false) --����ܦW��
	SetModeEx(monster , EM_SetModeType_NotShowHPMP, false) --����O���
	SetModeEx(monster , EM_SetModeType_Strikback, false) --���|����
	SetModeEx(monster , EM_SetModeType_Move, false) --���|����
	SetModeEx(monster , EM_SetModeType_Fight, false) --���i���
	SetModeEx(monster , EM_SetModeType_Searchenemy, false) --���|����
	SetModeEx(monster , EM_SetModeType_Obstruct, false) --�S�����׮ĪG
	AddToPartition(monster , RoomID) --�N�������
	WriteRoleValue(monster , EM_RoleValue_register1,Master) --�g�J�{���ݩ�1
	WriteRoleValue(monster , EM_RoleValue_Livetime,60) --�g�J�s�b�ɶ�
	Beginplot(monster , "LUA_YOYO_ChessGladiatorSkill_AbsoluteFieldEffect",0) --������ĪG
end
function LUA_YOYO_ChessGladiatorSkill_AbsoluteFieldEffect() --������ĪG
	local own = OwnerID()
	local master = ReadRoleValue(own , EM_RoleValue_register1)
	while 1 do
		sleep(10)
		SysCastSpellLv(master , own , 850439 , 0) --�I�i1�Ū����ˮ`
	end
end

function LUA_YOYO_499696_Itself() --���ѷ��a�ۨ��w�t
	local Owner = OwnerID()
	local BuffID = 623666 --���ѷ��a���w�t�ĪG
	AddBuff( Owner , BuffID , 1 , 10)
	return true
end

function un_499696() --���ѷ��a�ˮ`����
	local own = OwnerID()
	local Master = ReadRoleValue ( own , EM_RoleValue_OwnerGUID )
	SetModeEx(own,EM_SetModeType_Mark, false)
	SetModeEx(own,EM_SetModeType_HideName, true)
	SetModeEx(own,EM_SetModeType_NotShowHPMP, true)
	SetModeEx(own,EM_SetModeType_Strikback, false)
	SetModeEx(own,EM_SetModeType_Move, false)
	SetModeEx(own,EM_SetModeType_Fight, false)
	SetModeEx(own,EM_SetModeType_Searchenemy, false)
	SetModeEx(own,EM_SetModeType_Obstruct, false)
	addbuff(own,623661,0,-1)
	sleep(20)
	SysCastSpellLv(master,own,499739,1)
end

function un_623671() --������buff�~�[
	addbuff(OwnerID(),623671,0,-1)
	local own = OwnerID()
	local master = ReadRoleValue(own , EM_RoleValue_OwnerGUID)
	while 1 do
		sleep(10)
		SysCastSpellLv(master , own , 850439 , 0) --�I�i1�Ū����ˮ`
	end
end

function LUA_YOYO_KillPlayer() --���Ǵ_�U�G�A�צ��`�ĪG
	local Own = OwnerID()
	KillID(Own , Own)
	return true
end

function LUA_YOYO_RemoveCooldown(BuffID) --�v¡�����I�k�}���P�M���N�o
	local Owner = OwnerID()
	local SkillID = 499700 --�v¡����
	Lua_Hao_ResetColdown( Owner , SkillID , 0 ) --�ק�ޯ�N�o�ɶ�
	
	if CheckBuff( OwnerID() , BuffID ) == true then --Buff�}���P�_
		CancelBuff( OwnerID() , BuffID )
		return false
	else
		return true
	end	
end

function LUA_YOYO_HaloCooldown() --�v¡�������N�o�ɶ�
	local Owner = OwnerID()
	local SkillID = 499700 --�v¡����
	local CooldownTime = 10 --�N�o�ɶ�10��
	local Type = GameObjInfo_Int( SkillID ,"ColdownType")  -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o����
	WriteRoleValue( Owner , EM_RoleValue_Coldown_Job + Type , CooldownTime )
end

function LUA_YOYO_Huiguangfanzhao(BuffID) --�j����Ӧ��`�˼ƪ��A���|�[
	if CheckBuff( OwnerID() , BuffID ) == true then --Buff�}���P�_
		return false
	else
		return true
	end	
end

function LUA_YOYO_BurstSeed() --�z���ؤl���|����ۤv
	local Owner = OwnerID()
	local Target = TargetID()
	if Owner == Target then
		return false
	end
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 0 then --�p�G��NPC�h���ĪG����
		return false
	end
end

function YOYO_MonsterCantDot() --���k�ѾԪ��Ǫ��K�̩Ҧ�����ˮ`�ĪG
	local Owner = OwnerID()
	local BuffID = 623850 --���k�̽�
	AddBuff( Owner , BuffID , 1 , -1 )
end
	
function YOYO_DotCantMonster() --���k�ѾԪ�DOT�ĪG��Ǫ��L��
	local Owner = OwnerID()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsNPC ) == 1 then --�p�G��NPC�h���ĪG����
		return false
	end
end