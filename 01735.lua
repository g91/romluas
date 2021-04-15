Function LuaI_206543() --天馬驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206543]][$SETVAR3=[206283]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206543]][$SETVAR3=[202929]]"
 
	local itemset = { 4 , Prize1Str	, { 206283,1 }
		        , 7 , Prize2Str	, { 202929,1 }
		       , 13 ,""	, { 222926,1 }
	                       , 20 ,""	, { 222925,1 }
		       , 40 ,""	, { 202903,40 } 
		       , 60 ,"" 	, { 202435,40 }
		       , 80 ,"" 	, { 201609,2 } 
		       , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206544() --黑天馬驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206544]][$SETVAR3=[206289]]"
	local Prize2Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206544]][$SETVAR3=[202929]]"

	local itemset = { 4 ,Prize1Str	, { 206289,1 }
                         	        , 7 ,Prize2Str	, { 202929,1 }
		      , 13 ,""	, { 222926,1 }
		      , 20 ,""	, { 222925,1 }
		      , 40 ,""	, { 202903,40 } 
		      , 60 ,"" 	, { 202435,40 }
		      , 80 ,"" 	, { 201609,2 } 
		     , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206545() --每日任務重置券回饋蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206545]][$SETVAR3=[202434]x5]"
	
	local itemset = { 3 ,Prize1Str	, { 202434,5 }
		        , 8 ,""	, { 202434,1 }
		      , 16 ,""	, { 201450,5 }
		      , 26 ,""	, { 203042,10 }
		      , 36 ,""	, { 201457,10 } 
		      , 56 ,"" 	, { 201141,1 }
		      , 78 ,"" 	, { 202435,10 } 
		    , 100,""	, { 202904,5 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206546() --無瑕回饋蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206546]][$SETVAR3=[202881]x5]"

	local itemset = { 3 ,Prize1Str	, { 202881,1 , 202881,1 , 202881,1 , 202881,1 , 202881,1}
		        , 8 ,""	, { 202881,1 }
		      , 16 ,""	, { 201450,5 }
		      , 26 ,""	, { 203042,10 }
		      , 36 ,""	, { 201457,10 } 
		      , 56 ,"" 	, { 201141,1 }
		      , 78 ,"" 	, { 202435,10 } 
		     , 100,""	, { 202904,5 } }

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_206547() --雪貂驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206547]][$SETVAR3=[206275]]"
	
	local itemset = { 4 ,Prize1Str	, { 206275,1 }
                                       , 7 ,""	, { 203576,1 }
		     , 10 ,""	, { 201139,5 }
		     , 15 ,""	, { 201141,5 }
		     , 21 ,""	, { 201086,1 }
		     , 28 ,""	, { 201607,5 } 
		     , 44 ,""	, { 202903,40 } 
		     , 60 ,"" 	, { 202435,40 }
		     , 80 ,"" 	, { 201609,2 } 
		    , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206910() --闇影雪貂驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206910]][$SETVAR3=[206284]]"
	
	local itemset = { 4 ,Prize1Str	, { 206284,1 }
		        , 7 ,""	, { 203576,1 }
		      , 10 ,""	, { 201139,5 }
		      , 15 ,""	, { 201141,5 }
		      , 21 ,""	, { 201086,1 }
		      , 28 ,""	, { 201607,5 } 
		      , 44 ,""	, { 202903,40 } 
		      , 60 ,"" 	, { 202435,40 }
		      , 80 ,"" 	, { 201609,2 } 
		     , 100,""	, { 201617,2 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206998() --狂奔猛瑪驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206998]][$SETVAR3=[206196]]"


	local itemset = { 4 ,Prize1Str	, { 206196,1 } --永久狂奔猛瑪坐騎
			, 7 ,""		, { 202506,5 } --黃金修理鎚
			, 10 ,""	, { 201139,5 } --大天使的嘆息
			, 12 ,""	, { 206546,10 } --無瑕回饋蛋
			, 19 ,""	, { 201607,5 } --融合核心
			, 30 ,"" 	, { 201141,10 } --菲尼克斯的救贖
			, 45 ,"" 	, { 202904,20 } --傳送門符文
			, 60 ,"" 	, { 202322,3 } --高效幸運藥劑
			, 80 ,"" 	, { 201609,2 } --高效經驗藥劑
			, 100,""	, { 201617,2 } } --專家技能藥劑

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_206999() --睿智刺角犀牛驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[206999]][$SETVAR3=[204965]]"


	local itemset = { 4 ,Prize1Str	, { 204965,1 } --永久睿智刺角犀牛坐騎
			, 7 ,""		, { 202506,5 } --黃金修理鎚
			, 10 ,""	, { 201139,5 } --大天使的嘆息
			, 12 ,""	, { 206546,10 } --無瑕回饋蛋
			, 19 ,""	, { 201607,5 } --融合核心
			, 30 ,"" 	, { 201141,10 } --菲尼克斯的救贖
			, 45 ,"" 	, { 202904,20 } --傳送門符文
			, 60 ,"" 	, { 202322,3 } --高效幸運藥劑
			, 80 ,"" 	, { 201609,2 } --高效經驗藥劑
			, 100,""	, { 201617,2 } } --專家技能藥劑

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207000() --黑色刺角犀牛驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207000]][$SETVAR3=[204277]]"


	local itemset = { 4 ,Prize1Str	, { 204277,1 } --永久黑色刺角犀牛坐騎
			, 7 ,""		, { 202506,5 } --黃金修理鎚
			, 10 ,""	, { 201139,5 } --大天使的嘆息
			, 12 ,""	, { 206546,10 } --無瑕回饋蛋
			, 19 ,""	, { 201607,5 } --融合核心
			, 30 ,"" 	, { 201141,10 } --菲尼克斯的救贖
			, 45 ,"" 	, { 202904,20 } --傳送門符文
			, 60 ,"" 	, { 202322,3 } --高效幸運藥劑
			, 80 ,"" 	, { 201609,2 } --高效經驗藥劑
			, 100,""	, { 201617,2 } } --專家技能藥劑

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207001() --每日任務重置券驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207001]][$SETVAR3=[202434]x5]"


	local itemset = { 3 ,Prize1Str	, { 202434,5 } --每日任務重置券
			, 8 ,""		, { 202434,1 } --每日任務重置券
			, 16 ,""	, { 201458,3 } --聖光武器石
			, 26 ,""	, { 203043,5 } --聖光首飾石
			, 36 ,""	, { 201459,5 } --聖光裝備石
			, 58 ,"" 	, { 201445,50 } --世界頻道喊話儀
			, 78 ,"" 	, { 202435,10 } --家的羈絆
			, 100,""	, { 202904,5 } } --傳送門符文

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_207002() --無瑕驚喜蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207002]][$SETVAR3=[202881]x5]"


	local itemset = { 3 ,Prize1Str	, { 202881,1 , 202881,1 , 202881,1 , 202881,1 , 202881,1}
			, 8 ,""		, { 202881,1 } --無瑕熔解石
			, 16 ,""	, { 201458,3 } --聖光武器石
			, 26 ,""	, { 203043,5 } --聖光首飾石
			, 36 ,""	, { 201459,5 } --聖光裝備石
			, 58 ,"" 	, { 201445,50 } --世界頻道喊話儀
			, 78 ,"" 	, { 202435,10 } --家的羈絆
			, 100,""	, { 202904,5 } } --傳送門符文

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207003() --大師黃金修理鎚回饋蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[207003]][$SETVAR3=[203576]x5]"


	local itemset = { 3 ,Prize1Str	, { 203576,5 } --大師黃金修理鎚
		        , 8 ,""	, { 203576,1 } --大師黃金修理鎚
		       , 16 ,""	, { 201458,3 } --聖光武器石
		       , 26 ,""	, { 203043,5 } --聖光首飾石
		       , 36 ,""	, { 201459,5 } --聖光裝備石
	                       , 58 ,"" 	, { 201445,50 } --世界頻道喊話儀
		       , 78 ,"" 	, { 202435,10 } --家的羈絆
		     , 100,""	, { 202904,5 } } --傳送門符文

	return BaseTressureProc(   itemset , 1  )
end



Function LuaI_207112() --魔血夢魘魔幻扭蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207112]][$SETVAR3=[206564]]"


	local itemset = { 4 ,Prize1Str	, { 206564,1 } --永久魔血夢魘坐騎
		       , 6 ,""	, { 202506,10 } --黃金修理鎚
		       , 8 ,""	, { 201139,5 } --大天使的嘆息
		       , 11 ,""	, { 203784,40 } --公會城堡傳送石
	                     , 14 ,"" 	, { 203062,1 } --大師級防具打孔卷
 		       , 29 ,"" 	, { 201141,10 } --菲尼克斯的救贖
		       , 45 ,"" 	, { 202904,20 } --傳送門符文
		       , 60 ,"" 	, { 202322,3 } --高效幸運藥劑
		       , 78 ,"" 	, { 201609,2 } --高效經驗藥劑
		     , 100,""	, { 201617,2} } --專家技能藥劑

	return BaseTressureProc(   itemset , 1  )
end



Function LuaI_207113() --深淵夢魘魔幻扭蛋

	local RoleName = GetName( OwnerID() ) 
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName.."][$SETVAR2=[207113]][$SETVAR3=[206567]]"


	local itemset = { 4 ,Prize1Str	, { 206567,1 } --永久深淵夢魘坐騎
		       , 6 ,""	, { 202506,10 } --黃金修理鎚
		       , 8 ,""	, { 201139,5 } --大天使的嘆息
		       , 11 ,""	, { 203784,40 } --公會城堡傳送石
	                     , 14 ,"" 	, { 203062,1 } --大師級防具打孔卷
 		       , 29 ,"" 	, { 201141,10 } --菲尼克斯的救贖
		       , 45 ,"" 	, { 202904,20 } --傳送門符文
		       , 60 ,"" 	, { 202322,3 } --高效幸運藥劑
		       , 80 ,"" 	, { 201609,2 } --高效經驗藥劑
		     , 100,""	, { 201617,2} } --專家技能藥劑

	return BaseTressureProc(   itemset , 1  )
end


