Function LuaI_207143() --飛輪驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207143]][$SETVAR3=[206946]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206946,1 } --永久符能輪盤坐騎
		        , 6 ,""	, { 203058,2 } --專家級武器打孔卷
		       , 9 ,""	, { 201139,5 } --大天使的嘆息
		       , 14 ,""	, { 201141,5 } --菲尼克斯的救贖
		       , 20 ,""	, { 201086,1 } --高等技能重置石
	                     , 28 ,"" 	, { 201607,5 } --融合核心
 		       , 44 ,"" 	, { 202903,40 } --傳送者符文
		       , 60 ,"" 	, { 202904,20 } --傳送門符文
		       , 80 ,"" 	, { 201609,2 } --高效幸運藥劑
		       , 100 ,"" 	, { 201617,2 }} --專家技能藥劑

	local itemset2 = {  50 ,""	, { 205684,1 }}--閃耀光芒的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207144() --每日任務重置券驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207144]][$SETVAR3=[202434]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 } --每日任務重置券
		        , 8 ,""	, { 202434,1 } --每日任務重置券
		       , 16 ,""	, { 201458,3 } --聖光武器石
		       , 26 ,""	, { 203043,5 } --聖光首飾石
		       , 36 ,""	, { 201459,5 } --聖光裝備石
	                     , 56 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 78 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  10 ,""	, { 205684,1 }}--閃耀光芒的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207145() --無瑕驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207145]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147, 1 } --無瑕熔解石(5)包
		        , 8 ,""	, { 202881,1 } --無瑕熔解石
		       , 16 ,""	, { 201458,3 } --聖光武器石
		       , 26 ,""	, { 203043,5 } --聖光首飾石
		       , 36 ,""	, { 201459,5 } --聖光裝備石
	                     , 58 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 78 ,"" 	, { 202435,10 } --家的羈絆
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  10 ,""	, { 205684,1 }}--閃耀光芒的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end



Function LuaI_207146() --大師黃金修理鎚回饋蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207146]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576, 5 } --大師黃金修理鎚
		        , 8 ,""	, { 203576,1 } --大師黃金修理鎚
		       , 16 ,""	, { 201458,3 } --聖光武器石
		       , 26 ,""	, { 203043,5 } --聖光首飾石
		       , 36 ,""	, { 201459,5 } --聖光裝備石
	                     , 58 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 78 ,"" 	, { 202435,10 } --家的羈絆
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  10 ,""	, { 205684,1 }}--閃耀光芒的蛋殼碎片					
							

	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


function LuaS_bluewing_na_01()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離

	SetSpeakDetail( OwnerID(), "[SC_BLUEWING_01]" ) --你在購買的轉蛋中，是否有得到想要的東西呢？...
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BLUEWING_02]", "LuaS_bluewing_na_02",0 )--我想兌換蔚藍羽翼

end


function LuaS_bluewing_na_02()
	
	local X =CountBodyItem( OwnerID(), 205684) --檢查玩家身上的蛋殼碎片數量
	
	if X>=5 then
		DelBodyItem( OwnerID(), 205684, 5)
		GiveBodyItem( OwnerID(), 226295,1)
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_03]" , C_SYSTEM )  --恭喜你得到了<CS>蔚藍羽翼</CS>。
		CloseSpeak ( OwnerID())

	elseif X == 0 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_04]" , C_SYSTEM ) --你身上並沒有任何閃耀光芒的蛋殼碎片。 
		CloseSpeak ( OwnerID())
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_BLUEWING_05]" , C_SYSTEM )  --你身上沒有足以兌換獎勵的閃耀光芒的蛋殼碎片。
		CloseSpeak ( OwnerID()) 
	end
end

