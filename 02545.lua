function cl_ReadTarget_HP()   ----->無畏打擊檢查目標血量低於30%給予BUFF
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local HPPercent = ( bosshp / MaxHP )*100
	if HPPercent <= 30 then
		Addbuff (  OwnerID , 621179 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
		return true
	else
		return true
	end
end
function cl_ReadOwnerHP()    ----->最終防線讀取自身HP給予BUFF
	local OwnerID = OwnerID()
	if ReadRoleValue( OwnerID , EM_RoleValue_LV ) >= 30 then
		local MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
		local OwnerIDhp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
		local HPPercent = ( OwnerIDhp / MaxHP )*100
		if CheckBuff( OwnerID , 621218 ) ==  true and HPPercent <= 30 then
			if CheckBuff( OwnerID , 621230 ) ~=  true then
				local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+11 )
				sysCastSpelllv ( OwnerID , OwnerID , 498565 , powerLV )  ----自己對自己施放一個法術(表演用)
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
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	for i = 1 , 5 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----自己對自己施放一個法術(表演用)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498567 , powerLV )
		sleep ( 10 )
	end
end
function cl_ChackBuff_498535()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621252 ) ==  true then
		Addbuff (  OwnerID , 621253 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
		return true
	elseif CheckBuff( OwnerID , 622185 ) ==  true then
		Addbuff (  OwnerID , 621253 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
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
function cl_ArtisanSkill_498586()   ---優勝壓制劇情
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local Owner_HPPercent = ( Owner_Hp / Owner_MaxHP )*100
	local Target_MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local Target_Hp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local Target_HPPercent = ( Target_Hp / Target_MaxHP )*100
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+23 )
	if Owner_HPPercent > Target_HPPercent then
		Addbuff (  OwnerID , 621255 , powerLV , 12 ) ---便ADD狂暴BUFF給BOSS
	else
	end
end
function cl_ArtisanSkill_498593_check()   --不息脈動法術集合判斷	--FN修改2012/5/22
	local OwnerID = OwnerID()
	local TargetID = TargetID()

	if Lua_PercentHP(OwnerID) >= 30 then
		return true
	elseif Lua_PercentHP(OwnerID) < 30 then
		return false
	end
end

function cl_ArtisanSkill_498593()--不息脈動基本法術	--FN修改2012/5/22
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_HPPercent = Lua_PercentHP(OwnerID) * 0.4
	local skillLV = math.floor(Owner_HPPercent)
	sysCastSpelllv ( OwnerID , OwnerID , 498594 , skillLV )  ----自己對自己施放一個法術(表演用)
end

function cl_ArtisanSkill_498599()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	KS_ResetColdown( OwnerID , 498595 , 0 )
end
function cl_AddBuff_621308()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 621308 , 2 , 30 ) ---便ADD狂暴BUFF給BOSS
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
		BUFFX=BuffInfo( OwnerID, BUFF , EM_BuffInfoType_Power )---讀取技能等級
		CancelBuff(	OwnerID, 621308 )
		BUFFXX = BUFFX - 1
		if BUFFXX >= 0 then
			Addbuff ( OwnerID  , 621308 , BUFFXX , -1 )
		end
		sysCastSpelllv ( OwnerID , TargetID , 498602 , powerLV )  ----自己對自己施放一個法術(表演用)
		sysCastSpelllv ( OwnerID , OwnerID , 498601 , powerLV_2 )  ----自己對自己施放一個法術(表演用)
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
			Addbuff (  OwnerID , 621338 , powerLV , 1 ) ---便ADD狂暴BUFF給BOSS
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
	sysCastSpelllv ( OwnerID , OwnerID , 498912 , powerLV )  ----自己對自己施放一個法術(表演用)
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
		Addbuff (  OwnerID , 621350 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
		return true
	else
		return false
	end
end
function cl_ArtisanSkill_498682() ----關鍵救援
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID, 621353 )
	local BUFFID = BuffInfo( OwnerID , BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	KS_ResetColdown( BUFFID , 498564 , 12 )
end
function cl_ArtisanSkill_498683()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( OwnerID , 621355 ) ==  true then
		Addbuff (  TargetID , 621412 , 0 , 3 ) ---便ADD狂暴BUFF給BOSS
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
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+12 )
	for i = 1 , 5 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----自己對自己施放一個法術(表演用)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498686 , powerLV )
		sleep ( 10 )
	end
end
function cl_ChackBuff_498684()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+39 )
	if CheckBuff( OwnerID , 621415 ) ==  true then
		Addbuff (  TargetID , 621414 , powerLV , 6 ) ---便ADD狂暴BUFF給BOSS
		return true
	else
		return true
	end
end
function cl_ArtisanSkill_498687()
	local OwnerID = OwnerID()
	local BuffID = Lua_BuffPosSearch( OwnerID , 621418 )
	local TargetID = BuffInfo( OwnerID, BuffID , EM_BuffInfoType_OwnerID )---讀取技能等級
	--say ( TargetID , "TargetID" )
	--say ( OwnerID , "OwnerID" )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( TargetID , EM_RoleValue_MagicPowerLv_SP+40 )
	SysCastSpellLv_Pos( TargetID , Obj_X , Obj_Y , Obj_Z , 498689 , powerLV )
	CancelBuff(	OwnerID, 621418 )
end
function cl_ArtisanSkill_498690()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+41 )
	if CheckBuff( TargetID , 621348 ) ==  true then
		sysCastSpelllv ( OwnerID , TargetID , 498691 , powerLV )  ----自己對自己施放一個法術(表演用)
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
	sysCastSpelllv ( OwnerID , OwnerID , 498708 , powerLV )  ----自己對自己施放一個法術(表演用)
end
function cl_ArtisanSkill_498723()
	local OwnerID = OwnerID()
	local Buff_Table = { 621466 , 621467 , 621468 }
	local Buff_num= table.getn( Buff_Table ) ----再重新取出一次數量~這個數量已經排除掉其中一補
	local Rand_Buff = DW_Rand(Buff_num)  ---取隨機TABLE的位置
	local targ_num = GetPartyID( OwnerID , -1 )
	local Rand = DW_Rand(targ_num)  ---取隨機TABLE的位置
	local TargetID = GetPartyID( OwnerID , Rand )
	Addbuff ( TargetID , Buff_Table[Rand_Buff] , 0 , 1 )  ----自己對自己施放一個法術(表演用)
end
function cl_ArtisanSkill_498528()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if CheckBuff( TargetID , 621166 ) ==  true then		
		Addbuff ( OwnerID , 621250 , 0 , 1 )  ----自己對自己施放一個法術(表演用)
		---CastSpelllv ( OwnerID , OwnerID , 850205 , powerLV )  ----自己對自己施放一個法術(表演用)
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
function Cl_ArtisanSkill_621252() ---連鎖區動負加重置符能脈衝CD時間(2013.12.25.BICO.修正鍛造與戰守轉移無法並存的問題)
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
function Cl_ArtisanSkill_621252ForJob3() ---連鎖區動負加重置符能脈衝CD時間
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	KS_ResetColdown( OwnerID , 498529 , 0 )
	KS_ResetColdown( OwnerID , 498726 , 0 )
end
function cl_test_bossmsg()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	Addbuff (  OwnerID , 621166 , 0 , -1 ) ---便ADD狂暴BUFF給BOSS
end
function cl_ArtisanSkill_498596()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 621304 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
	return true
end
function cl_ReadAttackTarget_498766()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local AttackTarget = ReadRoleValue( TargetID , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
	local powerLV = ReadRoleValue( OwnerID , EM_RoleValue_MagicPowerLv_SP+73 )
	if AttackTarget ~= nil then
		sysCastSpelllv ( OwnerID , AttackTarget , 498768 , powerLV )  ----自己對自己施放一個法術(表演用)
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
	local Owner_Hp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local HPPercent = ( Owner_Hp / Owner_MaxHP )*100
	if HPPercent <= 40 then
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---便ADD狂暴BUFF給BOSS
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---便ADD狂暴BUFF給BOSS
	elseif HPPercent > 40 then
		Addbuff (  TargetID , 621522 , 0 , 10 ) ---便ADD狂暴BUFF給BOSS
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
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)   ---------讀取舊的BOSS本身的座標位置
	local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+80 )
	for i = 1 , 12 , 1 do
		sysCastSpelllv ( OwnerID , OwnerID , 498573 , 0 )  ----自己對自己施放一個法術(表演用)
		SysCastSpellLv_Pos( Master , Obj_X , Obj_Y , Obj_Z , 498800 , powerLV )
		sleep ( 10 )
	end
end
function cl_job10_skill498801()
	local OwnerID = OwnerID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
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
	Addbuff (  OwnerID , 621575 , powerLV , 6 ) ---便ADD狂暴BUFF給BOSS
end
function cl_chackHP_498817()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local Cancel_HP = Owner_MaxHP - Owner_Hp
	local HPPercent = Cancel_HP * 0.25
	sysCastSpelllv ( OwnerID , OwnerID , 498819 , HPPercent )  ----自己對自己施放一個法術(表演用)
	if CheckBuff( OwnerID , 621595 ) ==  true then
		CancelBuff(	OwnerID, 621595 )
	end
end
function cl_job1_9_skill498822()   ----->無畏打擊檢查目標血量低於30%給予BUFF
	local OwnerID = OwnerID()
	local Owner_MaxHP = ReadRoleValue( OwnerID , EM_RoleValue_MaxHP )
	local Owner_Hp = ReadRoleValue( OwnerID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local Cancel_HP = Owner_MaxHP - Owner_Hp
	local HPPercent = ( Cancel_HP / Owner_MaxHP )*100
	local Owner_HPPercent = HPPercent / 2
	local skill = math.floor(Owner_HPPercent)
	local HPPercent2 = ( Owner_Hp / Owner_MaxHP)*100 --Dy新增剩餘血量百分比
	if HPPercent2 < 5 then --Dy新增血量判定
		ScriptMessage( OwnerID , OwnerID , 1 , "[SC_MAGICSTRING_18]" , 1 )
		return false
	else
		Addbuff (  OwnerID , 621617 , skill , 1 ) ---便ADD狂暴BUFF給BOSS
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
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	local Buff_num = DW_Rand(10)
	for i = 1 , 2 , 1 do
		if Buff_num == i then
			if CheckBuff( Buff_Owner , 621629 ) ~=  true then
				Addbuff (  Buff_Owner , 621629 , 0 , -1 ) ---便ADD狂暴BUFF給BOSS
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
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	Addbuff (  Buff_Owner , 501554 , 0 , 4 ) ---便ADD狂暴BUFF給BOSS
end
function cl_job4_10_skill498867_play()
	local OwnerID = OwnerID()
	local BUFF = Lua_BuffPosSearch( OwnerID , 621296 )
	local Buff_Owner = BuffInfo( OwnerID, BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	Addbuff (  Buff_Owner , 501554 , 0 , 4 ) ---便ADD狂暴BUFF給BOSS
end
function cl_job10_1_skill498585()
	local OwnerID = OwnerID()
	KS_ResetColdown( OwnerID , 498526 , 0 )
	KS_ResetColdown( OwnerID , 498522 , 0 )
end
function cl_Job_10_3_498747_HPcheck() --阿元修改過%數 30->45
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local MaxHP = ReadRoleValue( TargetID , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( TargetID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local HPPercent = ( bosshp / MaxHP )*100
	if HPPercent <= 45 then
		Addbuff (  OwnerID , 622188 , 0 , 2 ) ---便ADD狂暴BUFF給BOSS
		return true
	else
		return true
	end
end
function Cl_Job10_3_Skill498730()
	local OwnerID = OwnerID()
	Addbuff (  OwnerID , 622189 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
	Addbuff (  OwnerID , 622190 , 0 , 1 ) ---便ADD狂暴BUFF給BOSS
end
function cl_CancelBuff850053()
	local OwnerID = OwnerID()
	if CheckBuff( OwnerID , 621454 ) ==  true then
		CancelBuff(	OwnerID, 621454 )
		return true
	end
end
function Cl_Job10_skill498523CancelBuff() --鍛造重複施放時清掉(廢棄, 2013/12/25.BICO修正鍛造無法與戰守轉移並存效果)
	local OwnerID = OwnerID()
--	if CheckBuff( OwnerID , 621167 ) ==  true then
--		CancelBuff(	OwnerID, 621167 )
--		return false
--	elseif  CheckBuff( OwnerID , 621167 ) ~=  true then
--		return true
--	end
end
function Cl_Job10_CancelBuff621168() --鍛造重複施放時清掉(廢棄, 2013/12/25.BICO修正鍛造無法與戰守轉移並存效果)
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