--台灣扭蛋物品劇情
----2011-0310 維京藍寶轉蛋


--serverscript 2219

-----------2011-0310 台灣維京藍寶扭蛋活動
function LuaI_209172()  --永久維京藍寶獸轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209172]][$SETVAR3=[207527]]"  --207527 永久維京藍寶坐騎

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 207527 , 1 } --永久維京藍寶坐騎
			, 5 ,""		, { 202929 , 2 } --魔幻寶盒能量50點
			, 8 ,""		, { 201139 , 5 } --大天使的嘆息
			, 13 ,""		, { 201086 , 1 }  --高等技能重置石
			, 21 ,"" 		, { 201141 , 5 }  --菲尼克斯的救贖
			, 38 ,"" 		, { 202903 , 40 }  --傳送者符文
			, 56 ,""		, { 202904 , 20 }  --傳送門符文
			, 78 ,""		, { 201609 , 2 } -- 高效經驗藥劑
			, 100 ,""	, { 201617 , 2 } 	} --專家技能藥劑
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	
	return true
end



function LuaI_209173()  --神賜轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209173]][$SETVAR3=[203525]x5]"  --202434 每日任務重置券x5

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 203525 , 5 }
			, 6 ,""		, { 203525 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 201445 , 50 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	
	return true
end



function LuaI_209174() --無瑕轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[209174]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset1 = { 3, Prize1Str  , {207147, 1 } --小型無瑕禮包
			, 6 , ""	        , {202881, 1 } --無瑕熔解石
			,10,""             , {206963, 1 } --進階聖光武器石
			,14,""             , {206964, 2 } --進階聖光裝備石
			,20,""             , {206965, 2 } --進階聖光首飾石
			,34,""             , {201619, 5 } --幸運藥劑
			,56,""             , {202435, 10 } --家的牽絆
			,78,""             , {203784, 10 } --公會城堡傳送石
			,100,""           , {202904, 5 } } --傳送門符文

	local itemset2 = {  1 ,""	, { 202846 ,1 }}--七階魔石

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )

	return true
end



function LuaI_209175()  --大師黃金轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209175]][$SETVAR3=[203576]x5]"  --203576 大師黃金修理鎚

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 203576 , 5 }
			, 6 ,""		, { 203576 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""		, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	
	return true
end