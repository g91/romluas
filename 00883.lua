----计糤------------------

--EM_LuaValueFlag_UseItem15  	= Value; Value = Value + 1; --ㄏノ珇癘Ω--ρ盿穝╰参 传秖Ω计
--EM_LuaValueFlag_UseItem16  	= Value; Value = Value + 1; --ㄏノ珇癘Ω--ρ盿穝╰参 传庇倍Ω计
--EM_LuaValueFlag_UseItem17  	= Value; Value = Value + 1; --ㄏノ珇癘Ω--ρ盿穝╰参 传瑻Ω计
--EM_LuaValueFlag_UseItem18  	= Value; Value = Value + 1; --ㄏノ珇癘Ω--ρ盿穝╰参 传醇紌Ω计
--EM_LuaValueFlag_UseItem19  	= Value; Value = Value + 1; --ㄏノ珇癘Ω--ρ盿穝╰参 传弘Ω计

--秖
function LuaS_111367_ADDSTR()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --传Ω计
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --笷眏て程礚猭传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
--		Say(OwnerID(), time )  --传Ω计 -------VAR1
--		Say(OwnerID(), time+1 )  --セΩ传Ω计
--		Say(OwnerID(), 50-time )  --﹟传Ω计 ----VAR2
--		Say(OwnerID(), STR ) --ヘ玡矗ど筁翴计-秖
--		Say(OwnerID(), uppoint[time+1] ) --セΩ穦糤翴计---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --惠璶毙旧翴计------------VAR4
--		Say(OwnerID(), STR+uppoint[time+1] ) --筁
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE01][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--ヘ玡传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR1]</CR>
		--﹟传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR2]</CR>
		--セΩ传<CR>[$VAR3]</CR>翴<CB>[SC_OLDBRINGNEW_KEY01]</CB>惠璶<CR>[$VAR4]</CR>翴毙旧翴计絋﹚璶传盾
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTR2", 0 ) --絋﹚
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

function LuaS_111367_ADDSTR2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local STR = ReadRoleValue( OwnerID() , EM_RoleValue_STR )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 ) --传Ω计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --Ι惠璶毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_STR , uppoint[time+1] ) --セΩ穦糤翴计
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem15 , 1 ) --Ω计+1 (秖)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD01][$SETVAR1="..uppoint[time+1].."]"   )  --秖糤1翴
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end


--庇倍
function LuaS_111367_ADDAGI()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --传Ω计
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --笷眏て程礚猭传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
--		Say(OwnerID(), time )  --传Ω计 -------VAR1
--		Say(OwnerID(), time+1 )  --セΩ传Ω计
--		Say(OwnerID(), 50-time )  --﹟传Ω计 ----VAR2
--		Say(OwnerID(), AGI ) --ヘ玡矗ど筁翴计-秖
--		Say(OwnerID(), uppoint[time+1] ) --セΩ穦糤翴计---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --惠璶毙旧翴计------------VAR4
--		Say(OwnerID(), AGI+uppoint[time+1] ) --筁
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE02][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--ヘ玡传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR1]</CR>
		--﹟传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR2]</CR>
		--セΩ传<CR>[$VAR3]</CR>翴<CB>[SC_OLDBRINGNEW_KEY01]</CB>惠璶<CR>[$VAR4]</CR>翴毙旧翴计絋﹚璶传盾
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDAGI2", 0 ) --絋﹚
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

function LuaS_111367_ADDAGI2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local AGI = ReadRoleValue( OwnerID() , EM_RoleValue_AGI )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 ) --传Ω计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --Ι惠璶毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_AGI , uppoint[time+1] ) --セΩ穦糤翴计
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem16 , 1 ) --Ω计+1 (秖)
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD02][$SETVAR1="..uppoint[time+1].."]"   )  --XX糤1翴
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

--瑻
function LuaS_111367_ADDSTA()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --传Ω计
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --笷眏て程礚猭传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
--		Say(OwnerID(), time )  --传Ω计 -------VAR1
--		Say(OwnerID(), time+1 )  --セΩ传Ω计
--		Say(OwnerID(), 50-time )  --﹟传Ω计 ----VAR2
--		Say(OwnerID(), STA ) --ヘ玡矗ど筁翴计-
--		Say(OwnerID(), uppoint[time+1] ) --セΩ穦糤翴计---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --惠璶毙旧翴计------------VAR4
--		Say(OwnerID(), STA+uppoint[time+1] ) --筁
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE03][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--ヘ玡传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR1]</CR>
		--﹟传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR2]</CR>
		--セΩ传<CR>[$VAR3]</CR>翴<CB>[SC_OLDBRINGNEW_KEY01]</CB>惠璶<CR>[$VAR4]</CR>翴毙旧翴计絋﹚璶传盾
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDSTA2", 0 ) --絋﹚
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

function LuaS_111367_ADDSTA2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local STA = ReadRoleValue( OwnerID() , EM_RoleValue_STA )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 ) --传Ω计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --Ι惠璶毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_STA , uppoint[time+1] ) --セΩ穦糤翴计
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem17 , 1 ) --Ω计+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD03][$SETVAR1="..uppoint[time+1].."]"   )  --XX糤1翴
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end


--醇紌
function LuaS_111367_ADDINT()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --传Ω计
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --笷眏て程礚猭传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
--		Say(OwnerID(), time )  --传Ω计 -------VAR1
--		Say(OwnerID(), time+1 )  --セΩ传Ω计
--		Say(OwnerID(), 50-time )  --﹟传Ω计 ----VAR2
--		Say(OwnerID(), INT ) --ヘ玡矗ど筁翴计-INT
--		Say(OwnerID(), uppoint[time+1] ) --セΩ穦糤翴计---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --惠璶毙旧翴计------------VAR4
--		Say(OwnerID(), INT+uppoint[time+1] ) --筁
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE04][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--ヘ玡传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR1]</CR>
		--﹟传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR2]</CR>
		--セΩ传<CR>[$VAR3]</CR>翴<CB>[SC_OLDBRINGNEW_KEY01]</CB>惠璶<CR>[$VAR4]</CR>翴毙旧翴计絋﹚璶传盾
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDINT2", 0 ) --絋﹚
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

function LuaS_111367_ADDINT2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local INT = ReadRoleValue( OwnerID() , EM_RoleValue_INT )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 ) --传Ω计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --Ι惠璶毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_INT , uppoint[time+1] ) --セΩ穦糤翴计
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem18 , 1 ) --Ω计+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD04][$SETVAR1="..uppoint[time+1].."]"   )  --XX糤1翴
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

--弘
function LuaS_111367_ADDMND()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --传Ω计
	if time == 50 then
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_06]"   )  --笷眏て程礚猭传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
--		Say(OwnerID(), time )  --传Ω计 -------VAR1
--		Say(OwnerID(), time+1 )  --セΩ传Ω计
--		Say(OwnerID(), 50-time )  --﹟传Ω计 ----VAR2
--		Say(OwnerID(), MND ) --ヘ玡矗ど筁翴计-MND
--		Say(OwnerID(), uppoint[time+1] ) --セΩ穦糤翴计---------VAR3
--		Say(OwnerID(), needstr[time+1] ) --惠璶毙旧翴计------------VAR4
--		Say(OwnerID(), MND+uppoint[time+1] ) --筁
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE05][$SETVAR1="..time.."][$SETVAR2="..50-time.."][$SETVAR3="..uppoint[time+1].."][$SETVAR4="..needstr[time+1].."]"   )  
		--ヘ玡传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR1]</CR>
		--﹟传[SC_OLDBRINGNEW_KEY01]Ω计<CR>[$VAR2]</CR>
		--セΩ传<CR>[$VAR3]</CR>翴<CB>[SC_OLDBRINGNEW_KEY01]</CB>惠璶<CR>[$VAR4]</CR>翴毙旧翴计絋﹚璶传盾
		AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDMND2", 0 ) --絋﹚
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end

function LuaS_111367_ADDMND2()
	local needstr = {3, 3, 4, 5, 5, 6, 7, 8 ,9 ,11 ,12 ,14 ,16 , 18 ,21 ,24 ,28 ,32 ,37 ,43 , 49 ,56 ,65 ,75 ,86 ,99 ,114 ,131 ,150 ,173 ,199 ,228 ,263 ,302 ,347 ,400 ,459 ,528 ,608 ,699 ,804 , 924 , 1063 , 1222 , 1405 , 1616 , 1859 , 2138 , 2458 ,2827 } --惠―翴计
	local uppoint = {1,1,1,1,1,1,1,1,1,1,2,2,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,7,7,8,9,11,13,16,20}  --糤翴计
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	local time =  ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 ) --传Ω计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr[time+1]   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr[time+1]  ) )  --Ι惠璶毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_MND , uppoint[time+1] ) --セΩ穦糤翴计
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem19 , 1 ) --Ω计+1 
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD05][$SETVAR1="..uppoint[time+1].."]"   )  --XX糤1翴
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end


function LuaS_111367_ADDTP()
--	CloseSpeak( OwnerID() )
	local needstr = 10 --惠―翴计
	local uppoint = 4500  --糤翴计
	local MND = ReadRoleValue( OwnerID() , EM_RoleValue_MND )
	SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_CHAGE06][$SETVAR1="..needstr.."][$SETVAR2="..uppoint.."]"  )  
	--瞷传[$VAR2]翴[SC_OLDBRINGNEW_KEY06]惠璶[$VAR1]翴毙旧翴计絋﹚璶传盾
	AddSpeakOption(OwnerID(), TargetID(), "[SC_LOSTTREASURE_08]" , "LuaS_111367_ADDTP2", 0 ) --絋﹚
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
end

function LuaS_111367_ADDTP2()
	local needstr = 10 --惠―翴计
	local uppoint = 4500  --糤翴计

	if ReadRoleValue( OwnerID() , EM_RoleValue_MedalCount ) >= needstr   then  --Τì镑毙旧翴计
		 AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , -(needstr ) )  --Ι毙旧翴计
		AddRoleValue( OwnerID() , EM_RoleValue_TPEXP , uppoint ) --
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_ADD06][$SETVAR1="..uppoint.."]"   )  --м翴计糤
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	else
		SetSpeakDetail( OwnerID(), "[SC_OLDBRINGNEW_04]"   )  --╆簆⊿Τì镑篴臕縩だ传
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaS_111367_ADDPoint", 0 ) --糷
	end
end