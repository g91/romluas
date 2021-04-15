--暖冬天使
function Lua_na_2013_xmas_tw()  --123234 暖冬小天使給予任務
	local Owner = OwnerID()
	if CheckFlag( Owner , 548801 ) == true then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_14]" ) --交換禮物活動一天只能交換一次喔！
	else
		if CountBodyItem( Owner , 241000) >=1 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_12]" ) --快打開你的禮物吧！到底會得到什麼呢？
			GiveBodyItem( Owner , 241987,1 )
			DelBodyItem( Owner, 241000, 1)
			SetFlag( Owner , 548801 , 1 )
			DesignLog( Owner , 123234 , "Exchange perfect gift" ) 
		elseif CountBodyItem( Owner , 241001) >=1 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_12]" ) --快打開你的禮物吧！到底會得到什麼呢？
			GiveBodyItem( Owner , 241986,1 )
			DelBodyItem( Owner, 241001, 1)	
			SetFlag( Owner , 548801 , 1 )
			DesignLog( Owner , 123234 , "Exchange soso gift" ) 
		else
			SetSpeakDetail( Owner, "[SC_XMAS_TW_01]" ) --暖冬節，充滿禮物的節日！	
		end			
	end
end

  

--吉芙特．禮兒
function Lua_na_2013_xmas_Gift()  --123235 向吉芙特．禮兒買禮物
	local Owner = OwnerID()
--	local Target = TargetID()
	if  CheckFlag( Owner , 548800 ) == false and  CheckFlag( Owner , 548801) == false then
		if CountBodyItem( Owner , 240997) == 0 and CountBodyItem( Owner , 240998) == 0 and  CountBodyItem( Owner , 240999) == 0 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_05]" ) --你需要購買參加交換禮物的物品嗎？
			AddSpeakOption( Owner , Owner ,"[SC_XMAS_TW_08]", "Lua_na_2013_xmas_Buy" , 0 ) --Buy	
		else
			SetSpeakDetail( Owner, "[SC_XMAS_TW_13]" ) --你身上已經有禮物了喔！			
		end

	else
		SetSpeakDetail( Owner, "[SC_XMAS_TW_02]" ) --暖冬節，當然就是要玩交換禮物囉!			
	end
end

function Lua_na_2013_xmas_Buy()
	local Owner = OwnerID()
	local R = DW_Rand(3)
	if CheckFlag( Owner , 548801) == false then
		if  CountBodyItem( Owner , 203038 ) >=100 then
			SetSpeakDetail( Owner, "[SC_XMAS_TW_06]" ) --那就這個禮物吧！	
			if R == 1 then
				GiveBodyItem( Owner ,240997 , 1 )  --包裝破損的禮物
			elseif R==2 then
				GiveBodyItem( Owner , 240998 , 1 )  --缺乏裝飾的禮物
			else
				GiveBodyItem( Owner , 240999 , 1 ) --外盒素淨的禮物
			end
			DelBodyItem( Owner , 203038, 100 )  
			SetFlag( Owner , 548800 , 1 )
			DesignLog( Owner , 123235 , "buy xmas gift" ) 
		else
			SetSpeakDetail( Owner , "[SC_111813_YU_36]"  )
		end
	else
		SetSpeakDetail( Owner , "[SC_XMAS_TW_02]" )
	end
end


--暖冬妖精
function Lua_na_2013_xmas_fairy()
	local Owner = OwnerID()
	if CountBodyItem( Owner , 240997) >= 1 or CountBodyItem( Owner , 240998) >= 1 or CountBodyItem( Owner , 240999) >= 1 then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_07]" )  --交給我來幫你重新包裝吧！
		AddSpeakOption( Owner , Owner ,"[SC_XMAS_TW_09]", "Lua_na_2013_xmas_wrap" , 0 ) --請讓這個禮物看起來變精緻吧！	
	else
		SetSpeakDetail( Owner, "[SC_XMAS_TW_10]" )  --別打擾我們，你沒看到我們都快忙不過來了嗎！
	end	
end


function Lua_na_2013_xmas_wrap()
	local Owner = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	local GiftType = {	[1] = 240997,
				[2] = 240998,	
				[3] = 240999	}
	if CountBodyItem( Owner , 241000) ~= 0 or  CountBodyItem( Owner , 241001) ~= 0 then
		SetSpeakDetail( Owner, "[SC_XMAS_TW_03]" ) -- 你身上已經有可以參加交換禮物的物品了
	else
		for i = 1 , 3 do
			if PID == i and CountBodyItem( Owner , GiftType[i]) == 1 then
				SetSpeakDetail( Owner, "[SC_XMAS_TW_11]" ) -- 快帶著這個禮物去找[123234]吧！
				DelBodyItem( Owner, GiftType[i] , 1 )
				GiveBodyItem( Owner , 241000 , 1 )
			end
		end

		for j = 1 , 3 do
			if CountBodyItem ( Owner , GiftType[j] ) >= 1 then
				DelBodyItem( Owner , GiftType[j], 1 )
				GiveBodyItem( Owner , 241001 , 1 )
			end
		end
		SetSpeakDetail( Owner, "[SC_XMAS_TW_11]" ) -- 快帶著這個禮物去找[123234]吧！
	end	
end


----------------------------------------------------------------------------------------------------------------------------------------
--獎勵
----------------------------------------------------------------------------------------------------------------------------------------

Function LuaI_241986() --神秘禮物
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241986]][$SETVAR3=[202434]]"

	local itemset = { 5 ,Prize1Str	, { 202434,1 } --每日任務重置券
		        , 20 ,""	, { 241479,3 } --暴風元素
		       , 35 ,""	, { 241480,3 } --深海元素
		       , 50 ,""	, { 241481,3 } --烈火元素
		       , 65 ,""	, { 241482,3 } --山岩元素
	                     , 80 ,"" 	, { 201139,2 } --大天使的嘆息
 		       , 100 ,"" 	, { 240736,3 }} --聲名大噪徽章
									
	BaseTressureProc7(   itemset , 1 )	
	return true;
end



Function LuaI_241987() --神秘禮物
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241987]][$SETVAR3=[202434]]"

	local itemset = { 5 ,Prize1Str	, { 202434,1 } --每日任務重置券
		        , 20 ,""	, { 241479,5 } --暴風元素
		       , 35 ,""	, { 241480,5 } --深海元素
		       , 50 ,""	, { 241481,5 } --烈火元素
		       , 65 ,""	, { 241482,5 } --山岩元素
	                     , 80 ,"" 	, { 201139,3 } --大天使的嘆息
 		       , 100 ,"" 	, { 240736,3 }} --聲名大噪徽章
			
						
	BaseTressureProc7(   itemset , 1 );
	
	return true;
end



Function LuaI_241976() --小天使的禮物
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[202846]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207492]]"
	local Prize3Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207786]]"
	local Prize4Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207788]]"
	local Prize5Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[241976]][$SETVAR3=[207787]]"


	local itemset = { 5 ,Prize1Str	, { 202846,1 } --七階魔石
		 	       , 13 ,Prize2Str	, { 207492,1 } --完美裝飾品精鍊石
			       , 19 ,Prize3Str	, { 207786,1 } --完美信仰武器石
			       , 26 ,Prize4Str	, { 207788,1 } --完美信仰首飾石
			       , 35 ,Prize5Str	, { 207787,1 } --完美信仰裝備石
		     	       , 60 ,"" 	, { 203576,1 } --大師黃金修理鎚		
		     	       , 85 ,"" 	, { 206426,2 } --古代秘寶遺跡調查憑證
 			       , 100 ,"" 	, { 242629,1 }} --每日任務技能藥劑
		
	BaseTressureProc7(   itemset , 1 );
	
	return true;
end