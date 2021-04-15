function Lua_na_StarPet_EX1() 
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_STARPET_EX_SPEAK]" )
	AddSpeakOption( Owner, Owner, "[SC_STARPET_EX_OPT1]","Lua_na_StarPet_EX2(1)", 0 )
	AddSpeakOption( Owner, Owner, "[SC_STARPET_EX_OPT2]","Lua_na_StarPet_EX2(2)", 0 )
	AddSpeakOption( Owner, Owner, "[SC_STARPET_EX_OPT3]","Lua_na_StarPet_EX2(3)", 0 )
	AddSpeakOption( Owner, Owner, "[SC_STARPET_EX_OPT4]","Lua_na_StarPet_EX2(4)", 0 )
end


function Lua_na_StarPet_EX2(Type) --元素兌換幻獸結晶
	local Owner = OwnerID()
	local Element = {241479 , 241480 , 241481 , 241482} --元素: 暴風/深海/烈火/山岩
	local Crystal = { [1] = { 241452, 241456, 241460} ,
			  [2] = { 241453, 241457, 241461} ,
			  [3] = { 241454, 241458, 241462} ,
			  [4] = { 241451, 241455, 241459}	} --1.風象 2.水象 3.火象 4.土系

	if CountBodyItem( Owner , Element[Type] ) >= 100 then
		SetSpeakDetail( Owner , "[SC_STARPET_EX_SPEAK2]" )

		if Type == 1 then
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][1].."]","Lua_na_StarPet_EX3(1)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][2].."]","Lua_na_StarPet_EX3(2)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][3].."]","Lua_na_StarPet_EX3(3)", 0 )
		elseif Type == 2 then
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][1].."]","Lua_na_StarPet_EX3(4)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][2].."]","Lua_na_StarPet_EX3(5)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][3].."]","Lua_na_StarPet_EX3(6)", 0 )
		elseif Type == 3 then
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][1].."]","Lua_na_StarPet_EX3(7)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][2].."]","Lua_na_StarPet_EX3(8)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][3].."]","Lua_na_StarPet_EX3(9)", 0 )	
		else
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][1].."]","Lua_na_StarPet_EX3(10)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][2].."]","Lua_na_StarPet_EX3(11)", 0 )
			AddSpeakOption( Owner, Owner, "["..Crystal[Type][3].."]","Lua_na_StarPet_EX3(12)", 0 )		
		end		

	else
		SetSpeakDetail( Owner , "[SC_STARPET_EX_SPEAK3]" )
		AddSpeakOption( Owner, Owner, "[SO_BACK]","Lua_na_StarPet_EX1", 0 )
		return	
	end
end
	
	
function Lua_na_StarPet_EX3(num)
	local Owner = OwnerID()
	local Element = {241479 , 241480 , 241481 , 241482} --元素: 暴風/深海/烈火/山岩
	local Crystal = { 241452, 241456, 241460,
			  241453, 241457, 241461 ,
			  241454, 241458, 241462 ,
			  241451, 241455, 241459	} --1.風象 2.水象 3.火象 4.土系	
--	CloseSpeak( Owner)
	SetSpeakDetail( Owner , "[SC_STARPET_EX_SPEAK4]" )
	if num >9 then
		DelBodyItem( Owner , Element[4], 100 )
	elseif num >6 then
		DelBodyItem( Owner , Element[3], 100 )
	elseif num >3 then
		DelBodyItem( Owner , Element[2], 100 )
	else
		DelBodyItem( Owner , Element[1], 100 )
	end
	GiveBodyItem( Owner, Crystal[num] , 1 )
--	DebugMsg( Owner, 0 , "Num "..num)
	DesignLog( Owner , Crystal[num] , " Player exchange StarPet Crystal" )
end


--2014/06/12 新增行銷許願活動，物品可以刪除星座寵的護符選項，玩家可以重新選擇
function Lua_na_starpet_DCheck() --檢查玩家是否持有星座寵 or 是否已使用過寵物
	local Owner = OwnerID()
	local L2 = CheckFlag( Owner, 546482)
	local L3 = CheckFlag( Owner, 546483)
	local L2Pet = {	241510, 241513, 241515, 241518, 241521,
			241348, 241445, 241448, 241498 , 241501,
			241504, 241507, 241525	}
	local L3Pet = {	241511, 241523, 241516, 241519, 241522,	
			241349, 241446, 241449, 241499, 241502, 
			241505, 241508, 242071	}

	if L2 == true and L3 == true then
		ScriptMessage( Owner, Owner, 1 , "[SC_STARPET_BUFF_CANCEL1]" , 0 ) --今日已經獲得過星座幻獸的祝福，不需要使用此券。
		return false
	elseif L2 == true then
		for i = 1 , #L3Pet , 1 do
			if CountBodyItem( Owner , L3Pet[i] ) >= 1 then
				ScriptMessage( Owner, Owner, 3 , "[SC_STARPET_BUFF_CANCEL2]" , 0 ) 	 --已清除與傳說星座幻獸寵物締結的契約。
				return true
			end
		end
		ScriptMessage( Owner, Owner, 1 , "[SC_STARPET_BUFF_CANCEL4]" , 0 ) --目前身上沒有締結契約的星座幻獸。
		return false	
	elseif L3 == true then
		for i = 1 , #L2Pet , 1 do
			if CountBodyItem( Owner , L2Pet[i] ) >= 1 then
				ScriptMessage( Owner, Owner, 3 , "[SC_STARPET_BUFF_CANCEL3]" , 0 )  --已清除與成年星座幻獸寵物締結的契約。
				return true
			end	
		end
		ScriptMessage( Owner, Owner, 1 , "[SC_STARPET_BUFF_CANCEL4]" , 0 ) --目前身上沒有締結契約的星座幻獸。
		return false
	else
		ScriptMessage( Owner, Owner, 3 , "[SC_STARPET_BUFF_CANCEL]" , 0 )	
		return TRUE
	end			
end




function Lua_na_starpet_buff_cancel()
	local Owner = OwnerID()
	local lv2key = { 
		[1] =  { 546301 ,546302 ,546303, 546304, 546305, 546306  },
		[2] = { 546307, 546308 ,546309, 546310, 546311, 546312  },
		[3] = { 546313 ,546314 ,546315, 546316, 546317, 546318  },
	 	[4] = { 546319, 546320, 546321, 546322, 546323, 546324  },
		[5] = { 546325, 546326, 546327, 546328, 546329, 546330  },
		[6] = { 546331, 546332, 546333, 546334, 546335, 546336  },
		[7] = { 546337, 546338, 546339, 546340, 546341, 546342  },
		[8] = { 546343, 546344, 546345, 546346, 546347, 546348 },
		[9] = { 546349, 546350, 546351, 546352, 546353, 546354 },
		[10] = { 546355, 546356, 546357, 546358, 546359, 546360 },
		[11] = { 546361, 546362, 546363, 546364, 546365, 546366 },
		[12] = { 546367, 546368, 546369, 546370, 546371, 546372 },
		[13] = { 547543, 547544, 547545, 547546, 547547, 547548 }
			}  
	local lv3key = { 
		[1] = { 546373, 546374, 546375, 546376, 546377, 546378, 546379, 546380, 546381 },
		[2] = { 546382, 546383, 546384, 546385, 546386, 546387, 546388, 546389, 546390 },
		[3] = { 546391, 546392, 546393, 546394, 546395, 546396, 546397, 546398, 546399 },
		[4] = { 546400, 546401, 546402, 546403, 546404, 546405, 546406, 546407, 546408 },
		[5] = { 546409, 546410, 546411, 546412, 546413, 546414, 546415, 546416, 546417 },
		[6] = { 546418, 546419, 546420, 546421, 546422, 546423, 546424, 546425, 546426 },
		[7] = { 546427, 546428, 546429, 546430, 546431, 546432, 546433, 546434, 546435 },
		[8] = { 546436, 546437, 546438, 546439, 546440, 546441, 546442, 546443, 546444 },
		[9] = { 546445, 546446, 546447, 546448, 546449, 546450, 546451, 546452, 546453 },
		[10] = { 546454, 546455, 546456, 546457, 546458, 546459, 546460, 546461, 546462 },
		[11] = { 546463, 546464, 546465, 546466, 546467, 546468, 546469, 546470, 546471 },
		[12] = { 546472, 546473, 546474, 546475, 546476, 546477, 546478, 546479, 546480 },
		[13] = { 547549, 547550, 547551, 547552, 547553, 547554, 547555, 547556, 547557, 547532 }
			}  
	for i = 1 , #lv2key do
		for  j = 1 , #lv2key[i] do
			setflag( Owner ,  lv2key[i][j] , 0 )
		end
	end
	for i = 1 , #lv3key do
		for  j = 1 , #lv3key[i] do
			setflag( Owner ,  lv3key[i][j] , 0 )
		end
	end
end