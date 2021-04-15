----各數值增加------------------

--EM_LuaValueFlag_UseItem15  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換力量次數
--EM_LuaValueFlag_UseItem16  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換敏捷次數
--EM_LuaValueFlag_UseItem17  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換耐力次數
--EM_LuaValueFlag_UseItem18  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換智慧次數
--EM_LuaValueFlag_UseItem19  	= Value; Value = Value + 1; --使用物品記次--老帶新系統 兌換精神次數

--力量
function LuaS_111367_ADDSTR()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --兌換次數
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --到達強化的最大限度，無法再兌換！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
--		Say(OwnerID(), time )  --已兌換次數 -------VAR1
--		Say(OwnerID(), time+1 )  --本次兌換次數
--		Say(OwnerID(), 50-time )  --尚可兌換次數 ----VAR2
--		Say(OwnerID(), STR ) --目前提升過點數-力量
--		Say(OwnerID(), uppoint[time+1] ) --本次會增加的能力點數---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --需要消耗的教導點數------------VAR4
--		Say(OwnerID(), STR+uppoint[time+1] ) --加過的能力值
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE01][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--目前已兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR1]</CR>
		--尚可兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR2]</CR>
		--本次兌換<CR>[$VAR3]</CR>點<CB>[SC_OLDBRINGNEW_KEY01]</CB>需要<CR>[$VAR4]</CR>點教導點數，確定要兌換嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTR2", 0 ) --確定
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

function LuaS_111367_ADDSTR2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --兌換次數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --扣需要消耗的教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_STR , uppoint[time+1] ) --本次會增加的能力點數
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 , 1 ) --次數+1 (力量)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD01][$SETVAR1="..uppoint[time+1].."]"   )  --你的力量增加了1點
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end


--敏捷
function LuaS_111367_ADDAGI()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --兌換次數
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --到達強化的最大限度，無法再兌換！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
--		Say(OwnerID(), time )  --已兌換次數 -------VAR1
--		Say(OwnerID(), time+1 )  --本次兌換次數
--		Say(OwnerID(), 50-time )  --尚可兌換次數 ----VAR2
--		Say(OwnerID(), AGI ) --目前提升過點數-力量
--		Say(OwnerID(), uppoint[time+1] ) --本次會增加的能力點數---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --需要消耗的教導點數------------VAR4
--		Say(OwnerID(), AGI+uppoint[time+1] ) --加過的能力值
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE02][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--目前已兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR1]</CR>
		--尚可兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR2]</CR>
		--本次兌換<CR>[$VAR3]</CR>點<CB>[SC_OLDBRINGNEW_KEY01]</CB>需要<CR>[$VAR4]</CR>點教導點數，確定要兌換嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDAGI2", 0 ) --確定
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

function LuaS_111367_ADDAGI2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --兌換次數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --扣需要消耗的教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_AGI , uppoint[time+1] ) --本次會增加的能力點數
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 , 1 ) --次數+1 (力量)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD02][$SETVAR1="..uppoint[time+1].."]"   )  --你的XX增加了1點
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

--耐力
function LuaS_111367_ADDSTA()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --兌換次數
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --到達強化的最大限度，無法再兌換！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
--		Say(OwnerID(), time )  --已兌換次數 -------VAR1
--		Say(OwnerID(), time+1 )  --本次兌換次數
--		Say(OwnerID(), 50-time )  --尚可兌換次數 ----VAR2
--		Say(OwnerID(), STA ) --目前提升過點數-
--		Say(OwnerID(), uppoint[time+1] ) --本次會增加的能力點數---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --需要消耗的教導點數------------VAR4
--		Say(OwnerID(), STA+uppoint[time+1] ) --加過的能力值
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE03][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--目前已兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR1]</CR>
		--尚可兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR2]</CR>
		--本次兌換<CR>[$VAR3]</CR>點<CB>[SC_OLDBRINGNEW_KEY01]</CB>需要<CR>[$VAR4]</CR>點教導點數，確定要兌換嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTA2", 0 ) --確定
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

function LuaS_111367_ADDSTA2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --兌換次數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --扣需要消耗的教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_STA , uppoint[time+1] ) --本次會增加的能力點數
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 , 1 ) --次數+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD03][$SETVAR1="..uppoint[time+1].."]"   )  --你的XX增加了1點
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end


--智慧
function LuaS_111367_ADDINT()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --兌換次數
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --到達強化的最大限度，無法再兌換！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
--		Say(OwnerID(), time )  --已兌換次數 -------VAR1
--		Say(OwnerID(), time+1 )  --本次兌換次數
--		Say(OwnerID(), 50-time )  --尚可兌換次數 ----VAR2
--		Say(OwnerID(), INT ) --目前提升過點數-INT
--		Say(OwnerID(), uppoint[time+1] ) --本次會增加的能力點數---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --需要消耗的教導點數------------VAR4
--		Say(OwnerID(), INT+uppoint[time+1] ) --加過的能力值
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE04][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--目前已兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR1]</CR>
		--尚可兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR2]</CR>
		--本次兌換<CR>[$VAR3]</CR>點<CB>[SC_OLDBRINGNEW_KEY01]</CB>需要<CR>[$VAR4]</CR>點教導點數，確定要兌換嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDINT2", 0 ) --確定
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

function LuaS_111367_ADDINT2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --兌換次數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --扣需要消耗的教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_INT , uppoint[time+1] ) --本次會增加的能力點數
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 , 1 ) --次數+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD04][$SETVAR1="..uppoint[time+1].."]"   )  --你的XX增加了1點
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

--精神
function LuaS_111367_ADDMND()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --兌換次數
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --到達強化的最大限度，無法再兌換！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
--		Say(OwnerID(), time )  --已兌換次數 -------VAR1
--		Say(OwnerID(), time+1 )  --本次兌換次數
--		Say(OwnerID(), 50-time )  --尚可兌換次數 ----VAR2
--		Say(OwnerID(), MND ) --目前提升過點數-MND
--		Say(OwnerID(), uppoint[time+1] ) --本次會增加的能力點數---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --需要消耗的教導點數------------VAR4
--		Say(OwnerID(), MND+uppoint[time+1] ) --加過的能力值
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE05][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--目前已兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR1]</CR>
		--尚可兌換[SC_OLDBRINGNEW_KEY01]次數：<CR>[$VAR2]</CR>
		--本次兌換<CR>[$VAR3]</CR>點<CB>[SC_OLDBRINGNEW_KEY01]</CB>需要<CR>[$VAR4]</CR>點教導點數，確定要兌換嗎？
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDMND2", 0 ) --確定
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end

function LuaS_111367_ADDMND2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --需求點數
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --增加點數
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --兌換次數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --扣需要消耗的教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_MND , uppoint[time+1] ) --本次會增加的能力點數
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 , 1 ) --次數+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD05][$SETVAR1="..uppoint[time+1].."]"   )  --你的XX增加了1點
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end


function LuaS_111367_ADDTP()
--	CloseSpeak( OwnerID() )
	local needstr = 10 --需求點數
	local uppoint = 4500  --增加點數
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE06][$SETVAR1="..needstr.."][$SETVAR2="..uppoint.."]"  )  
	--你現在兌換[$VAR2]點[SC_OLDBRINGNEW_KEY06]需要[$VAR1]點教導點數，確定要兌換嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDTP2", 0 ) --確定
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
end

function LuaS_111367_ADDTP2()
	local needstr = 10 --需求點數
	local uppoint = 4500  --增加點數

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr   then  --有足夠的教導點數
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr ) )  --扣教導點數
		AddRoleValue( OwnerID() , EM_RoleValue_TPEXP , uppoint ) --加
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD06][$SETVAR1="..uppoint.."]"   )  --你的技能點數增加
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --抱歉，你沒有足夠的榮譽積分可以兌換！！
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --回到上一層
	end
end