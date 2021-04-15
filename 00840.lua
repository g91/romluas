Function LuaI_207978() --飛天掃帚幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207978]][$SETVAR3=[206278]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206278,1 } --永久輕舞飛揚999坐騎
		        , 5 ,""	, { 202929,2 } --魔幻寶盒能量50點
		       , 8 ,""	, { 201139,5 } --大天使的嘆息
		       , 15 ,""	, { 201141,5 } --菲尼克斯的救贖
		       , 25 ,""	, { 202903,40 } --傳送者符文
	                     , 50 ,"" 	, { 202904,20 } --傳送門符文
 		       , 75 ,"" 	, { 201609,2 } --高效經驗藥劑
		       , 100 ,"" 	, { 201617,2 }} --專家技能藥劑

	local itemset2 = {  50 ,""	, { 207979,1 }}--神祕色澤的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_207980() --神賜幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207980]][$SETVAR3=[203525]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203525,5 } --神賜贖罪券x5
		        , 5 ,""	, { 203525,1 } --神賜贖罪券x1
		       , 8 ,""	, { 201458,3 } --聖光武器石
		       , 15 ,""	, { 203043,5 } --聖光首飾石
		       , 25 ,""	, { 201459,5 } --聖光裝備石
	                     , 50 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 75 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  9 ,""	, { 207979,1 }}--神祕色澤的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208177() --無瑕幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208177]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147,1 } --無瑕x5
		        , 5 ,""	, { 202881,1 } --無瑕x1
		       , 8 ,""	, { 201458,3 } --聖光武器石
		       , 15 ,""	, { 203043,5 } --聖光首飾石
		       , 25 ,""	, { 201459,5 } --聖光裝備石
	                     , 50 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 75 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  9 ,""	, { 207979,1 }}--神祕色澤的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208178() --大師黃金幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208178]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576,5 } --神賜贖罪券x5
		        , 5 ,""	, { 203576,1 } --神賜贖罪券x1
		       , 8 ,""	, { 201458,3 } --聖光武器石
		       , 15 ,""	, { 203043,5 } --聖光首飾石
		       , 25 ,""	, { 201459,5 } --聖光裝備石
	                     , 50 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 75 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  9 ,""	, { 207979,1 }}--神祕色澤的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

function Lua_FN_GAMANIA_20100819_1()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	--BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離
	SetSpeakDetail( OwnerID(), "[FN_GAMANIA_20100819_0]" ) --你在購買的轉蛋中，是否有得到想要的東西呢？...
	AddSpeakOption( OwnerID(), TargetID(), "[FN_GAMANIA_20100819_1]", "Lua_FN_GAMANIA_20100819_2",0 )--我想兌換蔚藍羽翼

end


function Lua_FN_GAMANIA_20100819_2()
	
	local X =CountBodyItem( OwnerID(), 207979) --檢查玩家身上的蛋殼碎片數量
	
	if X>=5 then
		DelBodyItem( OwnerID(), 207979, 5)
		GiveBodyItem( OwnerID(), 202844,1)
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[FN_GAMANIA_20100819_2]" , C_SYSTEM )  --恭喜你得到了<CS>[202844]</CS>
		CloseSpeak ( OwnerID())

	elseif X < 5 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[FN_GAMANIA_20100819_3]" , C_SYSTEM ) --您身上並沒有足夠的[207979]喔 
		CloseSpeak ( OwnerID())
	end
end
