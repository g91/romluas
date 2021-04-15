--台灣扭蛋物品劇情
----2011-0210 台灣咆嘯戰熊轉蛋活動
--2011-0106 台灣龍魂戰駒轉蛋活動
--2010-1119 台灣暴風鷹馬獸扭蛋活動
--2010_1022 台灣銀河天馬蛋活動
--2010-0923 台灣鷹眼扭蛋活動

--serverscript 2080
---------------------------------------------

--------------- 鷹眼蛋活動系列
Function LuaI_208317() --鷹眼葛列佛幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208317]][$SETVAR3=[206941]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 206941,1 } --
		        , 5 ,""	, {202929 ,2 } --
		       , 8 ,""	, {201139 ,5 } --
		       , 13 ,""	, {201086 ,1 } --
		       , 21 ,""	, {201141 ,5 } --
	                     , 38 ,"" 	, {202903 ,40 } --
 		       , 56 ,"" 	, {202904 ,20 } --
		       , 78 ,"" 	, {201609 ,2} --
		       , 100 ,"" 	, {201617 ,2}} --

	local itemset2 = {  50 ,""	, { 208321,1 }}--散發光芒的蛋殼碎片					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208318() --每日任務重置券幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208318]][$SETVAR3=[202434]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 } --
		        , 6 ,""	, {202434 ,1 } --
		       , 10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 38 ,"" 	, {201445 ,50 } --
 		       , 56 ,"" 	, {202435 ,10 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --

	local itemset2 = {  10 ,""	, { 208321,1 }}--散發光芒的蛋殼碎片					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end

Function LuaI_208319() --無瑕幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208319]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 207147, 1 } --無瑕熔解石(5)包
		        , 6 ,""	, { 202881,1 } --無瑕熔解石
		       , 10 ,""	, { 206963,1 } --進階聖光武器石
		       , 14 ,""	, { 206964,2 } --進階聖光裝備石
		       , 20 ,""	, { 206965,2 } --進階聖光首飾石
	                     , 38 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 56 ,"" 	, { 202435,10 } --家的羈絆
 		       , 78 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  10 ,""	, { 208321,1 }}--散發光芒的蛋殼碎片					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


Function LuaI_208320() --大師黃金幸運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208320]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	
	local itemset = { 3 ,Prize1Str	, { 203576, 5 } --大師黃金修理鎚
		        , 6 ,""	, { 203576,1 } --大師黃金修理鎚
		       , 10 ,""	, { 206963,1 } --進階聖光武器石
		       , 14 ,""	, { 206964,2 } --進階聖光裝備石
		       , 20 ,""	, { 206965,2 } --進階聖光首飾石
	                     , 38 ,"" 	, { 201445,50 } --世界頻道喊話儀
 		       , 56 ,"" 	, { 202435,10 } --家的羈絆
 		       , 78 ,"" 	, { 203784,10 } --公會城堡傳送石
		       , 100 ,"" 	, { 202904,5 }} --傳送門符文

	local itemset2 = {  10 ,""	, { 208321,1 }}--散發光芒的蛋殼碎片					
							
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	
	return true;
end


--------------- 銀河天馬蛋系列
Function LuaI_208296() --永久銀河天馬好運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208296]][$SETVAR3=[206710]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 206710,1 } --
		        , 6 ,""	, {202929 ,2 } --
		       ,  10 ,""	, {201139 ,5 } --
		       , 14 ,""	, {201086 ,1 } --
		       , 20 ,""	, {201141 ,5 } --
	                     , 34 ,"" 	, {202903 ,40 } --
 		       , 56 ,"" 	, {202904 ,20 } --
		       , 78 ,"" 	, {201609 ,2} --
		       , 100 ,"" 	, {201617 ,2}} --
	local itemset2 = {  50 ,""	, { 208300 ,1 }}--銀河中的神秘粉末									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208297() --神賜好運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208297]][$SETVAR3=[203525]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 203525,5 } --
		        , 6 ,""	, {203525 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--銀河中的神秘粉末									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208298() --無瑕好運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208298]][$SETVAR3=[207147]]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 207147,1 } --
		        , 6 ,""	, {202881 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--銀河中的神秘粉末									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

Function LuaI_208299() --大師黃金好運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208299]][$SETVAR3=[203576]x5]"

	if Check_Bag_Space( OwnerID() , 2 ) == false then
		return false
	end
	local itemset = { 3 ,Prize1Str	, { 203576,5 } --
		        , 6 ,""	, {203576 ,1 } --
		       ,  10 ,""	, {206963 ,1 } --
		       , 14 ,""	, {206964 ,2 } --
		       , 20 ,""	, {206965 ,2 } --
	                     , 34 ,"" 	, {201619 ,5 } --
 		       , 56 ,"" 	, {201445 ,50 } --
		       , 78 ,"" 	, {203784 ,10} --
		       , 100 ,"" 	, {202904 ,5}} --
	local itemset2 = {  9 ,""	, { 208300 ,1 }}--銀河中的神秘粉末									
	BaseTressureProc7(   itemset , 1 );
	BaseTressureProc7(   itemset2 , 1 );
	return true;
end

-----------2010-1119 台灣暴風鷹馬獸扭蛋活動
Function LuaI_208523()  --永久暴風鷹馬獸轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208523]][$SETVAR3=[206936]]"  --206936 永久暴風鷹馬獸坐騎

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 206936 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   5 ,""	, { 202846 , 1 }	}  --七階魔石

	local itemset3 = {   50 ,"" , { 208334 , 1 }	}  --飄落的鷹馬獸羽毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208524()  --每日任務重置券轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208524]][$SETVAR3=[202434]x5]"  --202434 每日任務重置券x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 202434 , 5 }
			, 6 ,""		, { 202434 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石

	local itemset3 = {   9 ,"" , { 208334 , 1 }	}  --飄落的鷹馬獸羽毛

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_208525() --無瑕轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208525]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = { 9 ,""    , { 208334 ,1 }}--飄落的鷹馬獸羽毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208526()  --大師黃金轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208526]][$SETVAR3=[203576]x5]"  --203576 大師黃金修理鎚

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208334 , 1 }	}  --飄落的鷹馬獸羽毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end


-----------2011-0106 台灣龍魂戰駒扭蛋活動
Function LuaI_208673()  --永久龍魂戰駒轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208673]][$SETVAR3=[206707]]"  --206936 永久龍魂戰駒坐騎

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 206707 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   5 ,""	, { 202846 , 1 }	}  --七階魔石

	local itemset3 = {   50 ,"" , { 208672 , 1 }	}  --堅硬的龍魂戰駒指甲

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208674()  --神賜轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208674]][$SETVAR3=[203525]x5]"  --202434 每日任務重置券x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208672 , 1 }	}  --堅硬的龍魂戰駒指甲

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_208675() --無瑕轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[208675]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = { 9 ,""    , { 208672 ,1 }}--堅硬的龍魂戰駒指甲

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_208676()  --大師黃金轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[208676]][$SETVAR3=[203576]x5]"  --203576 大師黃金修理鎚

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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

	local itemset3 = {   9 ,"" , { 208672 , 1 }	}  --堅硬的龍魂戰駒指甲

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end


-----------2011-0211 台灣咆嘯戰熊扭蛋活動
Function LuaI_209168()  --永久咆嘯戰熊轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209168]][$SETVAR3=[207503]]"  --206936 永久咆嘯戰熊坐騎

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 207503 , 1 }
			, 5 ,""		, { 202929 , 2 }
			, 8 ,""		, { 201139 , 5 }
			, 13 ,""		, { 201086 , 1 } 
			, 21 ,"" 		, { 201141 , 5 }
			, 38 ,"" 		, { 202903 , 40 } 
			, 56 ,""		, { 202904 , 20 } 
			, 78 ,""		, { 201609 , 2 } 
			, 100 ,""	, { 201617 , 2 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石

	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --粗糙的咆嘯戰熊絨毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_209169()  --每日任務重置券轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209169]][$SETVAR3=[202434]x5]"  --202434 每日任務重置券x5

	if Check_Bag_Space( OwnerID() , 3 ) == false then
		return false
	end
	
	local itemset1 = {  3 ,Prize1Str 	, { 202434 , 5 }
			, 6 ,""		, { 202434 , 1 }
			, 10 ,""		, { 206963 , 1 }
			, 14 ,""		, { 206964 , 2 } 
			, 20 ,"" 		, { 206965 , 2 }
			, 34 ,"" 		, { 201619 , 5 } 
			, 56 ,""		, { 202435 , 10 } 
			, 78 ,""		, { 203784 , 10 } 
			, 100 ,""	, { 202904 , 5 } 	}
							
	local itemset2 = {   1 ,""	, { 202846 , 1 }	}  --七階魔石
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --粗糙的咆嘯戰熊絨毛

	BaseTressureProc( itemset1 , 1 )
	BaseTressureProc( itemset2 , 1 )
	BaseTressureProc( itemset3 , 1 )
	
	return true
end

function LuaI_209170() --無瑕轉運蛋
	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[209170]][$SETVAR3=[207147]]"
	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --粗糙的咆嘯戰熊絨毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end

Function LuaI_209171()  --大師黃金轉運蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[209171]][$SETVAR3=[203576]x5]"  --203576 大師黃金修理鎚

	if Check_Bag_Space( OwnerID() , 3 ) == false then
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
	local itemset3 = {   50 ,"" , { 209167 , 1 }	}  --粗糙的咆嘯戰熊絨毛

	BaseTressureProc7( itemset1 , 1 )
	BaseTressureProc7( itemset2 , 1 )
	BaseTressureProc7( itemset3 , 1 )
	
	return true
end
