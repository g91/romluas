function cl_ReadTarget_HP()   ----->�L�ȥ����ˬd�ؼЦ�q�C��30%����BUFF
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local HPPercent = ( bosshp / MaxHP )*100
	if HPPercent <= 30 then
		Addbuff (  OwnerID , 621179 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
		return true
	else
		return true
	end
end
function cl_ReadOwnerHP()    ----->�̲ר��uŪ���ۨ�HP����BUFF
	local OwnerID = OwnerID()
	if ReadRoleValue( OwnerID , EM_RoleValue_LV ) >= 30 then
		local MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
		local OwnerIDhp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
		local HPPercent = ( OwnerIDhp / MaxHP )*100
		if CheckBuff( OwnerID , 621218 ) ==  true and HPPercent <= 30 then
			if CheckBuff( OwnerID , 621230 ) ~=  true then
				local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+11 )
				sysCastSpelllv ( OwnerID , OwnerID , 498565 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
			end
		elseif CheckBuff( OwnerID , 621218 ) ~=  true or HPPercent > 30 then
			if CheckBuff( OwnerID , 621230 ) ==  true then
				CancelBuff( OwnerID , 621230 )
			end
		end
	end
end
function Cl_CancelBuff621230()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Buff_Table = {}
	Buff_Table[1] = 621230
	Buff_Table[2] = 621234
	Buff_Table[3] = 621237
	local BuffTable = table.getn(Buff_Table)
	for i = 1 , BuffTable , 1 do
		if CheckBuff( OwnerID , Buff_Table[i] ) ==  true then
			CancelBuff( OwnerID , Buff_Table[i] )
		end
	end
end
function cl_RangeSkill_498566()
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	for i = 1 , 5 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498567 , powerLV )
		sleep ( 10 )
	end
end
function cl_ChackBuff_498535()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621252 ) ==  true then
		Addbuff (  OwnerID , 621253 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
		return true
	elseif CheckBuff( OwnerID , 622185 ) ==  true then
		Addbuff (  OwnerID , 621253 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
		return true
	elseif CheckBuff( OwnerID , 621252 ) ~=  true and CheckBuff( OwnerID , 622185 ) ~=  true then
		return true
	end
end
function Cl_ArtisanSkillChackBuff()  --622185--621252
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621252 ) ==  true then
		CancelBuff( OwnerID , 621252 )
	elseif CheckBuff( OwnerID , 622185 ) ==  true then
		CancelBuff( OwnerID , 622185 )
	end
end
function cl_ArtisanSkill_498586()   ---�u������@��
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local Owner_HPPercent = ( Owner_Hp / Owner_MaxHP )*100
	local Target_MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local Target_Hp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local Target_HPPercent = ( Target_Hp / Target_MaxHP )*100
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+23 )
	if Owner_HPPercent > Target_HPPercent then
		Addbuff (  OwnerID , 621255 , powerLV , 12 ) ---�KADD�g��BUFF��BOSS
	else
	end
end
function cl_ArtisanSkill_498593_check()   --�����߰ʪk�N���X�P�_	--FN�ק�2012/5/22
	local OwnerID = OwnerID()
	local TargetID = TargetID()

	if Lua_PercentHP(OwnerID) >= 30 then
		return true
	elseif Lua_PercentHP(OwnerID) < 30 then
		return false
	end
end

function cl_ArtisanSkill_498593()--�����߰ʰ򥻪k�N	--FN�ק�2012/5/22
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_HPPercent = Lua_PercentHP(OwnerID) * 0.4
	local skillLV = math.floor(Owner_HPPercent)
	sysCastSpelllv ( OwnerID , OwnerID , 498594 , skillLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
end

function cl_ArtisanSkill_498599()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	KS_ResetColdown( OwnerID , 498595 , 0 )
end
function cl_AddBuff_621308()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 621308 , 2 , 30 ) ---�KADD�g��BUFF��BOSS
end
function cl_ArtisanSkill_498600()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+53 )
	local powerLV_2 = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+54 )
	if CheckBuff( OwnerID , 621308 ) ==  true then
		local BUFF = Lua_BuffPosSearch( OwnerID, 621308 )
		local BUFFX = 1
		BUFF = Lua_BuffPosSearch( OwnerID , 621308 )
		BUFFX=BuffInfo( OwnerID, BUFF , EM_BuffInfoType_Power )---Ū���ޯ൥��
		CancelBuff(	OwnerID, 621308 )
		BUFFXX = BUFFX - 1
		if BUFFXX >= 0 then
			Addbuff ( OwnerID  , 621308 , BUFFXX , -1 )
		end
		sysCastSpelllv ( OwnerID , TargetID , 498602 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		sysCastSpelllv ( OwnerID , OwnerID , 498601 , powerLV_2 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		return true
	else
		return true
	end
end
function cl_ChackBuff_498651()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+55 )
	if CheckBuff( OwnerID , 621336 ) ==  true then
		if ReadRoleValue( OwnerID , EM_RoleValue_SP ) >= 10 and
			ReadRoleValue( OwnerID , EM_RoleValue_SP_Sub ) >= 20 then
			Addbuff (  OwnerID , 621338 , powerLV , 1 ) ---�KADD�g��BUFF��BOSS
			CancelBuff(	OwnerID, 621336 )
		end
		return true
	else
		return true
	end
end
function cl_ArtisanSkill_498652()
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+56 )  
	sysCastSpelllv ( OwnerID , OwnerID , 498912 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
end
function cl_ChackBuff_621341()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621342 ) ~=  true and
		CheckBuff( OwnerID , 621341 ) ~= true then
		return true
	else
		return false
	end
end
function cl_ArtisanSkill_498659()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621352 ) ~=  true then
		Addbuff (  OwnerID , 621350 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
		return true
	else
		return false
	end
end
function cl_ArtisanSkill_498682() ----����ϴ�
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID, 621353 )
	local BUFFID = BuffInfo( OwnerID , BUFF , EM_BuffInfoType_OwnerID )---Ū���ޯ൥��
	KS_ResetColdown( BUFFID , 498564 , 12 )
end
function cl_ArtisanSkill_498683()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621355 ) ==  true then
		Addbuff (  TargetID , 621412 , 0 , 3 ) ---�KADD�g��BUFF��BOSS
		return true
	else
		return true
	end
end
function cl_RangeSkill_498684()
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	for i = 1 , 5 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498686 , powerLV )
		sleep ( 10 )
	end
end
function cl_ChackBuff_498684()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+39 )
	if CheckBuff( OwnerID , 621415 ) ==  true then
		Addbuff (  TargetID , 621414 , powerLV , 6 ) ---�KADD�g��BUFF��BOSS
		return true
	else
		return true
	end
end
function cl_ArtisanSkill_498687()
	local OwnerID = OwnerID()
	local BuffID = Lua_BuffPosSearch( OwnerID , 621418 )
	local TargetID = BuffInfo( OwnerID, BuffID , EM_BuffInfoType_OwnerID )---Ū���ޯ൥��
	--say ( TargetID , "TargetID" )
	--say ( OwnerID , "OwnerID" )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	local powerLV = ReadRoleValue( TargetID , EM_RoleValue_MagicPowerLv_SP+40 )
	SysCastSpellLv_Pos( TargetID , Obj_X , Obj_Y , Obj_Z , 498689 , powerLV )
	CancelBuff(	OwnerID, 621418 )
end
function cl_ArtisanSkill_498690()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+41 )
	if CheckBuff( TargetID , 621348 ) ==  true then
		sysCastSpelllv ( OwnerID , TargetID , 498691 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		return true
	else
		return true
	end
end
function cl_ArtisanSkill_498715()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	KS_ResetColdown( OwnerID , 498713 , 10 )
end
function cl_chackJob_W()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 1 or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 10 then
		if TargetID ~= OwnerID then
			return true
		else
			return false
		end
	else
		return false
	end
end
function cl_chackJob_S()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 2  or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 9 then		
		return true
	else
		return false
	end
end
function cl_chackJob_R()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 3 then		
		return true
	else
		return false
	end
end
function cl_chackJob_MP()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 4 or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 5 or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 6 or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 7 or
		ReadRoleValue( TargetID , EM_RoleValue_VOC ) == 8 then		
		return true
	else
		return false
	end
end
function cl_CancelOwnerID()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if TargetID ~= OwnerID then
		return true
	else
		return false
	end
end
function cl_CancelTargetID()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if TargetID == OwnerID then
		return true
	else
		return false
	end
end
function cl_ArtisanSkill_498721()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+47 )
	sysCastSpelllv ( OwnerID , OwnerID , 498708 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
end
function cl_ArtisanSkill_498723()
	local OwnerID = OwnerID()
	local Buff_Table = { 621466 , 621467 , 621468 }
	local Buff_num= table.getn( Buff_Table ) ----�A���s���X�@���ƶq~�o�Ӽƶq�w�g�ư����䤤�@��
	local Rand_Buff = DW_Rand(Buff_num)  ---���H��TABLE����m
	local targ_num = GetPartyID( OwnerID , -1 )
	local Rand = DW_Rand(targ_num)  ---���H��TABLE����m
	local TargetID = GetPartyID( OwnerID , Rand )
	Addbuff ( TargetID , Buff_Table[Rand_Buff] , 0 , 1 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
end
function cl_ArtisanSkill_498528()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 621166 ) ==  true then		
		Addbuff ( OwnerID , 621250 , 0 , 1 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		---CastSpelllv ( OwnerID , OwnerID , 850205 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		return true
	else
		return true
	end
end
function cl_ArtisanSkill_true()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621218 ) ==  true then
		return true
	else
		return false
	end
end
function cl_ArtisanSkill_false()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621218 ) ~=  true then
		return true
	else
		return false
	end
end
function Cl_ArtisanSkill_621252() ---�s��ϰʭt�[���m�ů�߽�CD�ɶ�(2013.12.25.BICO.�ץ���y�P�Ԧu�ಾ�L�k�æs�����D)
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local SubJob = ReadRoleValue( OwnerID, EM_RoleValue_VOC_SUB )
	if SubJob == 3 then
		KS_ResetColdown( OwnerID , 498529 , 0 )
		KS_ResetColdown( OwnerID , 498726 , 0 )
	else
		KS_ResetColdown( OwnerID , 498529 , 0 )
	end
end
function Cl_ArtisanSkill_621252ForJob3() ---�s��ϰʭt�[���m�ů�߽�CD�ɶ�
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	KS_ResetColdown( OwnerID , 498529 , 0 )
	KS_ResetColdown( OwnerID , 498726 , 0 )
end
function cl_test_bossmsg()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	Addbuff (  OwnerID , 621166 , 0 , -1 ) ---�KADD�g��BUFF��BOSS
end
function cl_ArtisanSkill_498596()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 621304 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
	return true
end
function cl_ReadAttackTarget_498766()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local AttackTarget = ReadRoleValue( TargetID , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+73 )
	if AttackTarget ~= nil then
		sysCastSpelllv ( OwnerID , AttackTarget , 498768 , powerLV )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		Add_SoulP_1()
		return true
	else
		Add_SoulP_1()
		return true
	end
end
function cl_ArtisanSkill_498770()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local HPPercent = ( Owner_Hp / Owner_MaxHP )*100
	if HPPercent <= 40 then
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---�KADD�g��BUFF��BOSS
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---�KADD�g��BUFF��BOSS
	elseif HPPercent > 40 then
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---�KADD�g��BUFF��BOSS
	end
end
function cl_job10_givekeyitem()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckFlag( OwnerID, 546064 ) ~= true then
		GiveBodyItem( OwnerID, 546064 , 1 ) 
	end
end
function cl_job10_delkeyitem()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckFlag( OwnerID, 546064 ) == true then
		DelBodyItem( OwnerID, 546064 , 1 )
	end
end
function cl_job10_CancelBuff()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckFlag( OwnerID, 546064 ) == true then
		DelBodyItem( OwnerID, 546064 , 1 )
		CancelBuff(	OwnerID, 621556 )
		return true
	end
end
function cl_RangeSkill_498799()
	local OwnerID = OwnerID()
	local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------Ū���ª�BOSS�������y�Ц�m
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+80 )
	for i = 1 , 12 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498800 , powerLV )
		sleep ( 10 )
	end
end
function cl_job10_skill498801()
	local OwnerID = OwnerID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local HPPercent = ( Owner_Hp / Owner_MaxHP )*100
	if HPPercent >= 75 then
		CancelBuff(	OwnerID, 621561 )
	end
end
function cl_job3_9_skill498804()
	local OwnerID = OwnerID()
	KS_ResetColdown( OwnerID , 490355 , 0 )
	KS_ResetColdown( OwnerID , 490333 , 0 )
end
function cl_job1_10_skill498760()
	local OwnerID = OwnerID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+86 )
	Addbuff (  OwnerID , 621575 , powerLV , 6 ) ---�KADD�g��BUFF��BOSS
end
function cl_chackHP_498817()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local Cancel_HP = Owner_MaxHP - Owner_Hp
	local HPPercent = Cancel_HP * 0.25
	sysCastSpelllv ( OwnerID , OwnerID , 498819 , HPPercent )  ----�ۤv��ۤv�I��@�Ӫk�N(��t��)
	if CheckBuff( OwnerID , 621595 ) ==  true then
		CancelBuff(	OwnerID, 621595 )
	end
end
function cl_job1_9_skill498822()   ----->�L�ȥ����ˬd�ؼЦ�q�C��30%����BUFF
	local OwnerID = OwnerID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local Cancel_HP = Owner_MaxHP - Owner_Hp
	local HPPercent = ( Cancel_HP / Owner_MaxHP )*100
	local Owner_HPPercent = HPPercent / 2
	local skill = math.floor(Owner_HPPercent)
	local HPPercent2 = ( Owner_Hp / Owner_MaxHP)*100 --Dy�s�W�Ѿl��q�ʤ���
	if HPPercent2 < 5 then --Dy�s�W��q�P�w
		ScriptMessage( OwnerID , OwnerID , 1 , "[SC_MAGICSTRING_18]" , 1 )
		return false
	else
		Addbuff (  OwnerID , 621617 , skill , 1 ) ---�KADD�g��BUFF��BOSS
		return true
	end
end
function cl_job4_10_skill498825()
	local OwnerID = OwnerID()
	KS_ResetColdown( OwnerID , 490212 , 0 )
	KS_ResetColdown( OwnerID , 490242 , 0 )
end
function cl_job4_10_skill498864()
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID , 621628 )
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---Ū���ޯ൥��
	local Buff_num = DW_Rand(10)
	for i = 1 , 2 , 1 do
		if Buff_num == i then
			if CheckBuff( Buff_Owner , 621629 ) ~=  true then
				Addbuff (  Buff_Owner , 621629 , 0 , -1 ) ---�KADD�g��BUFF��BOSS
			end
		end
	end
end
function cl_job4_10_givekey498869()
	local OwnerID = OwnerID()
	if CheckFlag( OwnerID, 546065 ) ~= true then
		GiveBodyItem( OwnerID, 546065 , 1 )
	end
end
function cl_job4_10_delkey498869()
	local OwnerID = OwnerID()
	if CheckFlag( OwnerID, 546065 ) == true then
		DelBodyItem( OwnerID, 546065 , 1 )
	end
end
function cl_Chack_Owner_Target()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if TargetID == OwnerID then
		return false
	else
		return true
	end
end
function cl_CancelBuff621431()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621431 ) ==  true then
		CancelBuff(	OwnerID, 621431 )
		return true
	else
		return true
	end
end
function cl_ChackBuff621431()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621431 ) ==  true then
		return false
	else
		return true
	end
end
function cl_CancelBuff621626()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621629 ) ==  true then
		CancelBuff(	OwnerID, 621629 )
		return true
	end
end
function cl_job4_10_skill498867_mob()
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID , 621295 )
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---Ū���ޯ൥��
	Addbuff (  Buff_Owner , 501554 , 0 , 4 ) ---�KADD�g��BUFF��BOSS
end
function cl_job4_10_skill498867_play()
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID , 621296 )
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---Ū���ޯ൥��
	Addbuff (  Buff_Owner , 501554 , 0 , 4 ) ---�KADD�g��BUFF��BOSS
end
function cl_job10_1_skill498585()
	local OwnerID = OwnerID()
	KS_ResetColdown( OwnerID , 498526 , 0 )
	KS_ResetColdown( OwnerID , 498522 , 0 )
end
function cl_Job_10_3_498747_HPcheck() --�����ק�L%�� 30->45
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---�����ª�BOSS����e��q
	local HPPercent = ( bosshp / MaxHP )*100
	if HPPercent <= 45 then
		Addbuff (  OwnerID , 622188 , 0 , 2 ) ---�KADD�g��BUFF��BOSS
		return true
	else
		return true
	end
end
function Cl_Job10_3_Skill498730()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 622189 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
	Addbuff (  OwnerID , 622190 , 0 , 1 ) ---�KADD�g��BUFF��BOSS
end
function cl_CancelBuff850053()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621454 ) ==  true then
		CancelBuff(	OwnerID, 621454 )
		return true
	end
end
function Cl_Job10_skill498523CancelBuff() --��y���ƬI��ɲM��(�o��, 2013/12/25.BICO�ץ���y�L�k�P�Ԧu�ಾ�æs�ĪG)
	local OwnerID = OwnerID()
--	if CheckBuff( OwnerID , 621167 ) ==  true then
--		CancelBuff(	OwnerID, 621167 )
--		return false
--	elseif  CheckBuff( OwnerID , 621167 ) ~=  true then
--		return true
--	end
end
function Cl_Job10_CancelBuff621168() --��y���ƬI��ɲM��(�o��, 2013/12/25.BICO�ץ���y�L�k�P�Ԧu�ಾ�æs�ĪG)
	local OwnerID = OwnerID()
--	if CheckBuff( OwnerID , 621168 ) ==  true then
--		CancelBuff(	OwnerID, 621168 )
--	end
	if CheckBuff( OwnerID, 624318 ) == true then
			CancelBuff( OwnerID, 624318 )
	end
end
function Cl_Job10_3_Skill498726()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 622364 ) ==  true then
		CancelBuff(	TargetID, 622364 )
		return true
	else
		return true
	end
end
function Cl_Job_Skill_test()
	local OwnerID = OwnerID()
	if CheckBuff( TargetID , 622364 ) ==  true then
		CancelBuff(	TargetID, 622364 )
		return false
	elseif CheckBuff( TargetID , 622364 ) ~=  true then
		return true
	end
end
function Cl_Skill_CheakBuff621227()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 621227 ) ==  true then
		return false
	else
		return true
	end
end