
-- 德國四周年 4週年慶的賀禮
Function LuaI_242186() 
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242186]][$SETVAR3=[242188]]" 

	local itemset  = {	1 , Prize1Str 	, { 242188 , 1 }		-- 永久紀念坐騎禮盒*1      242188
				, 201 ,""	, { 242189 , 1 }		-- 30天紀念坐騎禮盒*1     242189
				, 500 ,""	, { 202434 , 3 }		-- 每日任務重置券*3	202434 
				, 1050 ,""	, { 202434 , 1 } 	       	-- 每日任務重置券*1	202434 
				, 1600 ,""	, { 201141 , 1 }		-- 菲尼克斯的救贖*1	201141 
				, 2600 ,""	, { 207771 , 3 }		-- 信仰武器石*3 		207771
				, 3600 ,""	, { 207772 , 3 }		-- 信仰裝備石*3 		207772
				, 4600 ,""	, { 207773 , 3 }		-- 信仰首飾石*3		207773
				, 6400 ,""	, { 202435 , 5 }		-- 家的羈絆*5		202435 
				, 8200 ,""	, { 202902 , 5 }		-- 空間紀錄墨水*5	202902
				, 10000 ,""	, { 202903 , 5 }	}	-- 傳送者符文*5		202903 

	return BaseTressureProc4(   itemset , 1  )

end

Function LuaI_242186_Cast()
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242186]][$SETVAR3=[242188]]" 
	RunningMsgEx( OwnerID() , 2 , 2 , Prize1Str )
end

-- 德國四周年 跳跳花寶寶寵物禮盒
function LuaI_242187()
	local itemset  = {  77 ,"" 	, { 242198 , 1 },	
			  97 ,""	, { 242199 , 1 },
			  100 ,"" , { 242200 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end

-- 德國四周年 永久紀念坐騎禮盒
function LuaI_242188()
	local itemset  = {  5 ,"" 	, { 241774 , 1 },	
			  10 ,""	, { 241779 , 1 },
			  15 ,""	, { 241802 , 1 },
			  32 ,""	, { 241622 , 1 },
			  49 ,""	, { 241634 , 1 },
			  66 ,""	, { 241788 , 1 },
			  83 ,""	, { 241793 , 1 },
			  100 ,"" , { 241799 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end

--德國四周年  30天紀念坐騎禮盒
function LuaI_242189()
	local itemset  = {  5 ,"" 	, { 241773 , 1 },	
			  10 ,""	, { 241778 , 1 },
			  15 ,""	, { 241801 , 1 },
			  32 ,""	, { 241621 , 1 },
			  49 ,""	, { 241633 , 1 },
			  66 ,""	, { 241787 , 1 },
			  83 ,""	, { 241792 , 1 },
			  100 ,"" , { 241798 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end

-----------------  獎勵兌換的禮盒 ----------------- 

--德國四周年 護符禮盒共用函式
function MagicTools_TreasureBox(Option, GiveID, count)
	local PlayerID = OwnerID()
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , count  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , GiveID ) >= count  )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		for i = 1, count do	
			GiveBodyItem(PlayerID, GiveID, count)
		end
	end
end

--德國四周年 精煉裝備強化禮盒
function LuaI_242162()
	local itemset  = {   8 ,""	, { 242207 , 1 },
			  16 ,""	, { 242208 , 1 },
			  21,""	, { 242209 , 1 },
			  26,""	, { 242210 , 1 },
			  34 ,""	, { 201087 , 1 },
			  40 ,""	, { 201237 , 1 },
			  46 ,""	, { 203053 , 1 },
			  50 ,""	, { 207495 , 1 },
			  56 ,""	, { 207771 , 3 },
			  68 ,""	, { 207772 , 3 },
			  80 ,""	, { 207773 , 3 },
			  90 ,""	, { 208932 , 1 },
			  97 ,""	, { 202928 , 1 },
			  100 ,"" , { 202928 , 3 }	}

	return BaseTressureProc(   itemset , 1  )
end

--德國四周年 隨身冒險道具禮盒
function LuaI_242163()
	local itemset  = { 10 ,""	, { 202434 , 3 },
			  20 ,""	, { 201139 , 3 },
			  30,""	, { 201141 , 3 },
			  38,""	, { 208792 , 1 },
			  46 ,""	, { 208788 , 1 },
			  54 ,""	, { 208785 , 1 },
			  64 ,""	, { 207049 , 1 },
			  72 ,""	, { 242085 , 3 },
			  80 ,""	, { 242086 , 3 },
			  88 ,""	, { 242087 , 3 },
			  94 ,""	, { 231885 , 1 },
			  100 ,"" , { 231886 , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end

--德國四周年 忠誠夥伴寵物禮盒
function LuaI_242190()
	local itemset  = {	1080 , "" 	, { 203241 , 1 }	
				, 2160 ,""	, { 203242 , 1 }	
				, 3240 ,""	, { 203273 , 1 }	
				, 4320 ,""	, { 205855 , 1 } 	 
				, 5400 ,""	, { 206177 , 1 }
				, 5860 ,""	, { 207101 , 1 }	
				, 6320 ,""	, { 207104 , 1 }	
				, 6780 ,""	, { 207736 , 1 }	
				, 7240 ,""	, { 242009 , 1 }	
				, 7700 ,""	, { 241842 , 1 }	
				, 8160 ,""	, { 241837 , 1 }	
				, 8620 ,""	, { 241759 , 1 }	
				, 9080 ,""	, { 241236 , 1 }
				, 9540 ,""	, { 209546 , 1 }
				, 10000 ,""	, { 241220 , 1 }	}

	return BaseTressureProc4(   itemset , 1  )
end




