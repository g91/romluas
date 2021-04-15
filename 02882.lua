function Lua_na_starpet_NO13() --如何兌換第十三號星座龍
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner, "[SC_STARPET_NO13]") -- 如何兌換第13隻星座寵
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK1]", "Lua_na_starpet_NO13_LV(1)", 0)	
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK2]", "Lua_na_starpet_NO13_LV(2)", 0)
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK3]", "Lua_na_starpet_NO13_LV(3)", 0)
	AddSpeakOption( Owner , Owner, "[SO_BACK]" , "Lua_mika_starpet_npc01", 0 ) --回到上一頁
end


function Lua_na_starpet_NO13_LV(LV)
	local Owner = OwnerID()

-- 三個階段的36隻星座龍
	local StarPet = { 	[1] = {	241509, 241512, 241514, 241517, 241520, 241347,  
					241444, 241447, 241497, 241500, 241503, 241506	},
				[2] = {	241510, 241513, 241515, 241518, 241521, 241348,
					241445, 241448, 241498, 241501, 241504, 241507	},
				[3] ={	241511, 241523, 241516, 241519, 241522, 241349,
					241446, 241449, 241499, 241502, 241505, 241508	}	}
	local TempGroup = {	}	
	local PetKey = { 548002 , 548003 , 548004 } --領取判斷用FLAG

	if CheckFlag( Owner , PetKey[LV] ) == true then
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES1]" ) --根據我的紀錄，你已經換取過這顆星座龍召喚石了！所以很抱歉，無法讓你再次兌換。
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_starpet_NO13", 0 )	
		return
	else
		for i = 1 , #StarPet[LV] do 
			if CountItem( Owner , StarPet[LV][i] ) < 1 then
				table.insert( TempGroup, StarPet[LV][i])
			end
		end
	end
	Lua_na_starpet_Msg(LV,TempGroup)
end
		

function Lua_na_starpet_Msg( LV, TempGroup)
	local Owner = OwnerID()
	local StarPet = { 241524 , 241525 , 242071 } --星座龍
	local StarPetKey = { 548002, 548003, 548004 } --領取KEY 
	local DesignLogCheck = {106950, 106951, 106949 }

	if #TempGroup == 12 then --玩家身上一個都沒有
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES2]") --我看看喔……你身上沒有此階段的星座龍召喚石。是不是忘記帶出來了呢？
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_starpet_NO13", 0 )	 --回到上一頁

	elseif #TempGroup ~= 0 then
		DeBugMsg( 0, 0 , "TG = "..#TempGroup) --確認缺少的寵物龍隻數
		PetMsg = "[SC_STARPET_NO13_MISS]"	-- 哎啊…很可惜，你好像沒有符合兌換的標準！...
		for i = 1 , #TempGroup , 1 do					
			if i == #TempGroup then --最後一個物品，
				PetMsg = PetMsg.."["..TempGroup[i].."]</CS>".."[SC_STARPET_NO13_MISS01][$SETVAR1="..#TempGroup.."]"
			else
				PetMsg = PetMsg.."["..TempGroup[i].."]</CS>".."[SC_SEPARATEMARK]<CS>"--加上頓號
			end
		end
		SetSpeakDetail( Owner , PetMsg )
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_starpet_NO13", 0 ) --回到上一頁
	else --給予獎勵寵物
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES3]")
		local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_Lv )	 
		GiveBodyItem( Owner , StarPet[LV], 1 )	
		SetFlag( Owner , StarPetKey[LV], 1 )
		DeBugMsg( 0,0 , "CHECK ="..StarPetKey[LV])
		DesignLog( Owner , DesignLogCheck[LV], "PlayerLv ="..PlayerLv) 
	end
end


---測試用指令 
function Lua_na_starpet_give(LV) --給予單一階段的12隻星座寵
	local Owner = OwnerID() 
	local StarPet = { 	[1] = {	241509, 241512, 241514, 241517, 241520, 241347,  
					241444, 241447, 241497, 241500, 241503, 241506	},
				[2] = {	241510, 241513, 241515, 241518, 241521, 241348,
					241445, 241448, 241498, 241501, 241504, 241507	},
				[3] ={	241511, 241523, 241516, 241519, 241522, 241349,
					241446, 241449, 241499, 241502, 241505, 241508	}	}
	for i = 1 , #StarPet[LV] do
		GiveBodyItem( Owner , StarPet[LV][i] , 1 )
	end
	DeBugMsg( Owner ,0, "StarPet LV"..LV.." Give OK!" )
end


function Lua_na_starpet_Del(LV) --刪除單一階段的12隻星座寵
	local Owner = OwnerID() 
	local StarPet = { 	[1] = {	241509, 241512, 241514, 241517, 241520, 241347,  
					241444, 241447, 241497, 241500, 241503, 241506	},
				[2] = {	241510, 241513, 241515, 241518, 241521, 241348,
					241445, 241448, 241498, 241501, 241504, 241507	},
				[3] ={	241511, 241523, 241516, 241519, 241522, 241349,
					241446, 241449, 241499, 241502, 241505, 241508	}	}
	for i = 1 , #StarPet[LV] do
		DelBodyItem( Owner , StarPet[LV][i] , 1 )
	end
	DeBugMsg( Owner ,0, "StarPet LV"..LV.." Del OK!" )
end