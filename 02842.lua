----------------------------------------------------------------------------
--炙雷武器	5.0.9修正版本
----------------------------------------------------------------------------
function YOYO_JOB1_4_LV60_FireAndWinWP()
	local OwnID = OwnerID()
	local Fire_powerLV = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 38 )
	local Win_powerLV = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 37 )
	Addbuff ( OwnID , 500160 , Fire_powerLV , -1 )	
	Addbuff ( OwnID , 620350 , Fire_powerLV , -1 )	--熔岩武器爆擊效果
	Addbuff ( OwnID , 500161 , Win_powerLV , -1 )
	Addbuff ( OwnID , 620349 , Win_powerLV , -1 )	--電氣衝擊命中效果
end
----------------------------------------------------------------------------
--炙雷武器取消	5.0.9修正版本
----------------------------------------------------------------------------
function YOYO_JOB1_4_LV60_CancelBuff()
	local OwnID = OwnerID()
	CancelBuff_NoEvent( OwnID , 500160 )
	CancelBuff_NoEvent( OwnID , 500161 )
	CancelBuff_NoEvent( OwnID , 500162 )
	CancelBuff_NoEvent( OwnID , 620350 )	--刪除熔岩武器的爆擊效果效果
	CancelBuff_NoEvent( OwnID , 620349 )	--刪除電氣衝擊的物理命中效果
end
----------------------------------------------------------------------------
--炙雷武器、熔岩武器、電氣衝擊的隱藏Buff消除修正
----------------------------------------------------------------------------
function lua_bico_JOB1_4_FireThunderFix()	--防止506225與620350同時存在
	if CheckBuff( OwnerID() , 620350 ) == true then	--如果我身上已經有炙雷武器的爆擊效果，那熔岩武器的爆擊效果不會同時存在
		return false
	else
		return true
	end	
end
function lua_bico_JOB1_4_WindThunderFix()	--防止506226與620349同時存在
	if CheckBuff( OwnerID() , 620349 ) == true then	--如果我身上已經有炙雷武器的命中效果，那電氣衝擊的命中效果不會同時存在
		return false
	else
		return true
	end	
end
----------------------------------------------------------------------------
--制裁 法術集合判斷 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------目標身上沒有光印，無法使用此技能!
		return false
	end	
end
----------------------------------------------------------------------------
--聖化制裁 制裁法術集合判斷 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_1_LV70_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	local StrengthenBuff = 500284 --騎戰 強化制裁Buff
	local DivinePunishBuff = 502052 --騎戰 聖化制裁Buff
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 64 ) --施放者目前的聖化制裁技能等級
	
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		Addbuff ( OwnID , StrengthenBuff , PowerLv , -1 )
		Addbuff ( TarID , DivinePunishBuff , PowerLv , 10 )
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------目標身上沒有光印，無法使用此技能!
		return false
	end	
end
----------------------------------------------------------------------------
--聖化制裁 強化制裁傷害的基本法術結果 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_1_LV70_Punish_2()
	CancelBuff( OwnerID() , 500284 )  --解除 強化制裁 的Buff
end
----------------------------------------------------------------------------
--血之制裁 制裁法術集合判斷 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_2_LV70_Punish()
	local OwnID = OwnerID()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
	 	if CheckBuff( OwnID , 500871 ) == true then --如果身上有 騎遊 血箭Buff
			Addbuff ( OwnID , 623168 , 0 , -1 )   --騎遊 血之制裁 增傷Buff
		end
		return true
	else
		ScriptMessage( OwnID , OwnID , 1 , "[SC_MAGICSTRING_17]" , 1 )		------目標身上沒有光印，無法使用此技能!
		return false
	end	
end
----------------------------------------------------------------------------
--威嚇 附加傷害 6.0.0修正版本
--輸入：聖印層數
----------------------------------------------------------------------------
function YOYO_JOB6_Intimidate( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 7 ) --施放者目前的威嚇技能等級
	local AddDamage = { 490156 , 490157 , 490161 , 490162 }
	SysCastSpellLv( OwnID , TarID , AddDamage[Layer] , PowerLv ) --依照輸入層數給予傷害
end
----------------------------------------------------------------------------
--震撼 判斷若有聖印則無基本效果 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_Shock_1()
	local TarID = TargetID()
	if CheckBuff( TarID , 500140) == true or
	 CheckBuff( TarID , 500146) == true or
	 CheckBuff( TarID , 500168) == true or
	 CheckBuff( TarID , 500169) == true then
		return false
	 end
end
----------------------------------------------------------------------------
--震撼 額外傷害效果 6.0.0修正版本
--輸入：聖印層數
----------------------------------------------------------------------------
function YOYO_JOB6_Shock_2( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 12 ) --施放者目前的震撼技能等級
	local AddDamage = { 490163 , 490165 , 490166 , 490167 }
	SysCastSpellLv( OwnID , TarID , AddDamage[Layer] , PowerLv ) --給予震撼暈眩效果
end
----------------------------------------------------------------------------
--真理盾擊 判斷聖印狀態回傳給自身護盾 6.0.0修正版本
--輸入：聖印層數
----------------------------------------------------------------------------
function YOYO_JOB6_TruthShield( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 11 ) --施放者目前的真理盾擊技能等級
	local ShieldBuff = { 500196 , 500197 , 500198 , 500199 } --真理盾擊 護盾Buff
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --聖印Buff
	AddBuff( OwnID , ShieldBuff[Layer] , PowerLv , 10 ) --給予自身護盾效果
	for i = 1 , #DivineBuff do
		CancelBuff( TarID , DivineBuff[ i ] ) --清除聖印Buff
	end
end
----------------------------------------------------------------------------
--真理聖言 真理盾擊判斷聖印狀態回傳給自身護盾，但有機率不消耗聖印 6.0.0修正版本
--輸入：聖印層數
----------------------------------------------------------------------------
function YOYO_JOB6_5TruthWord( Layer )
	local OwnID = OwnerID()
	local TarID = TargetID()
	local RandNum = DW_RAND(100) --取亂數
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 11 ) --施放者目前的真理盾擊技能等級
	local ShieldBuff = { 500196 , 500197 , 500198 , 500199 } --真理盾擊 護盾Buff
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --聖印Buff
	AddBuff( OwnID , ShieldBuff[Layer] , PowerLv , 10 ) --給予自身護盾效果
	
	if RandNum > 50 then --50%機率不清除聖印
		for i = 1 , #DivineBuff do
			CancelBuff( TarID , DivineBuff[ i ] ) --清除聖印Buff
		end
	end
end
----------------------------------------------------------------------------
--勇氣之盾 成功格擋時減少聖印技能冷卻時間1秒 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_CourageShield()
	local OwnID = OwnerID()
	Lua_CDtime_set( OwnID , 490149 , -1 ) --減少聖印技能冷卻時間1秒
end
----------------------------------------------------------------------------
--生存本能 降低格擋專家的冷卻時間1秒 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_SurvivalInstinct()
	local OwnID = OwnerID()
	Lua_CDtime_set( OwnID , 492935 , -1 ) --減少格擋專家冷卻時間1秒
end
----------------------------------------------------------------------------
--復仇本能 擊潰可額外給予聖印的劇情 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_3_RevengeInstinct()
	local TarID = TargetID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --聖印Buff
	local RandNum = DW_RAND(100) --取亂數
	if CheckBuff( TarID , DivineBuff[4] ) == true then
		return
	elseif CheckBuff( TarID , DivineBuff[3] ) == true then
		AddBuff( TarID , DivineBuff[4] , 0 , 10 ) --給予聖印4效果
	elseif CheckBuff( TarID , DivineBuff[2] ) == true then
		if RandNum > 50 then --50%機率多給一層
			AddBuff( TarID , DivineBuff[4] , 0 , 10 ) --給予聖印4效果
		else
			AddBuff( TarID , DivineBuff[3] , 0 , 10 ) --給予聖印3效果
		end
	elseif CheckBuff( TarID , DivineBuff[1] ) == true then
		if RandNum > 50 then --50%機率多給一層
			AddBuff( TarID , DivineBuff[3] , 0 , 10 ) --給予聖印3效果
		else
			AddBuff( TarID , DivineBuff[2] , 0 , 10 ) --給予聖印2效果
		end
	else
		if RandNum > 50 then --50%機率多給一層
			AddBuff( TarID , DivineBuff[2] , 0 , 10 ) --給予聖印2效果
		else
			AddBuff( TarID , DivineBuff[1] , 0 , 10 ) --給予聖印1效果
		end
	end
end
----------------------------------------------------------------------------
--懺罪裁定 給予聖印4與重置制裁冷卻時間 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_4_RepentRule()
	local OwnID = OwnerID()
	local TarID = TargetID()
	AddBuff( TarID , 500169 , 0 , 10 ) --給予聖印4效果
	Lua_CDtime_set( OwnID , 490151 , 0 ) --重置制裁冷卻時間
end
----------------------------------------------------------------------------
--殲罪者 威嚇 與 震撼 額外給予移動加速Buff 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_4_Evil()
	local OwnID = OwnerID()
	AddBuff( OwnID , 502101 , 0 , 3 ) --給予殲罪者效果
end
----------------------------------------------------------------------------
--征戰祈福 給予聖印的劇情 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_4_ExpeditionBlessing()
	local OwnID = OwnerID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --聖印Buff
	if CheckBuff( OwnID , DivineBuff[4] ) == true then
		return
	elseif CheckBuff( OwnID , DivineBuff[3] ) == true then
		AddBuff( OwnID , DivineBuff[4] , 0 , 10 ) --給予聖印4效果
	elseif CheckBuff( OwnID , DivineBuff[2] ) == true then
		AddBuff( OwnID , DivineBuff[3] , 0 , 10 ) --給予聖印3效果
	elseif CheckBuff( OwnID , DivineBuff[1] ) == true then
		AddBuff( OwnID , DivineBuff[2] , 0 , 10 ) --給予聖印2效果
	else
		AddBuff( OwnID , DivineBuff[1] , 0 , 10 ) --給予聖印1效果
	end
end
----------------------------------------------------------------------------
--神聖掃蕩 判斷聖印回傳治療效果的劇情 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_5_DivineRaid()
	local OwnID = OwnerID()
	local TarID = TargetID()
	local DivineBuff = { 500140 , 500146 , 500168 , 500169 } --聖印Buff
	local DivineHeal = { 490366 , 490367 , 490368 , 490369 } --神聖治療
	local PowerLv = ReadRoleValue( OwnID , EM_RoleValue_MagicPowerLv_SP + 51 ) --施放者目前的神聖掃蕩技能等級
	for i = 1 , #DivineBuff do
		if CheckBuff( TarID , DivineBuff[ i ] ) == true then
			SysCastSpellLv( OwnID , OwnID , DivineHeal[ i ] , PowerLv ) --對自身施展神聖治療
			CancelBuff( TarID , DivineBuff[ i ] ) --清除聖印Buff
			return
		end
	end
end
----------------------------------------------------------------------------
--雄心壯志 觸發範圍法術的劇情 6.0.0修正版本
----------------------------------------------------------------------------
function YOYO_JOB6_5_Ambition()
	local OwnID = OwnerID()
	SysCastSpellLv( OwnID , OwnID , 490038 , 0 ) --對自身施展神聖治療
end