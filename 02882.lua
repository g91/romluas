function Lua_na_starpet_NO13() --�p��I���ĤQ�T���P�y�s
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner, "[SC_STARPET_NO13]") -- �p��I����13���P�y�d
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK1]", "Lua_na_starpet_NO13_LV(1)", 0)	
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK2]", "Lua_na_starpet_NO13_LV(2)", 0)
	AddSpeakOption( Owner, Owner , "[SC_STARPET_NO13_CHECK3]", "Lua_na_starpet_NO13_LV(3)", 0)
	AddSpeakOption( Owner , Owner, "[SO_BACK]" , "Lua_mika_starpet_npc01", 0 ) --�^��W�@��
end


function Lua_na_starpet_NO13_LV(LV)
	local Owner = OwnerID()

-- �T�Ӷ��q��36���P�y�s
	local StarPet = { 	[1] = {	241509, 241512, 241514, 241517, 241520, 241347,  
					241444, 241447, 241497, 241500, 241503, 241506	},
				[2] = {	241510, 241513, 241515, 241518, 241521, 241348,
					241445, 241448, 241498, 241501, 241504, 241507	},
				[3] ={	241511, 241523, 241516, 241519, 241522, 241349,
					241446, 241449, 241499, 241502, 241505, 241508	}	}
	local TempGroup = {	}	
	local PetKey = { 548002 , 548003 , 548004 } --����P�_��FLAG

	if CheckFlag( Owner , PetKey[LV] ) == true then
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES1]" ) --�ھڧڪ������A�A�w�g�����L�o���P�y�s�l��ۤF�I�ҥH�ܩ�p�A�L�k���A�A���I���C
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
	local StarPet = { 241524 , 241525 , 242071 } --�P�y�s
	local StarPetKey = { 548002, 548003, 548004 } --���KEY 
	local DesignLogCheck = {106950, 106951, 106949 }

	if #TempGroup == 12 then --���a���W�@�ӳ��S��
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES2]") --�ڬݬݳ�K�K�A���W�S�������q���P�y�s�l��ۡC�O���O�ѰO�a�X�ӤF�O�H
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_starpet_NO13", 0 )	 --�^��W�@��

	elseif #TempGroup ~= 0 then
		DeBugMsg( 0, 0 , "TG = "..#TempGroup) --�T�{�ʤ֪��d���s����
		PetMsg = "[SC_STARPET_NO13_MISS]"	-- �u�ڡK�ܥi���A�A�n���S���ŦX�I�����зǡI...
		for i = 1 , #TempGroup , 1 do					
			if i == #TempGroup then --�̫�@�Ӫ��~�A
				PetMsg = PetMsg.."["..TempGroup[i].."]</CS>".."[SC_STARPET_NO13_MISS01][$SETVAR1="..#TempGroup.."]"
			else
				PetMsg = PetMsg.."["..TempGroup[i].."]</CS>".."[SC_SEPARATEMARK]<CS>"--�[�W�y��
			end
		end
		SetSpeakDetail( Owner , PetMsg )
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_starpet_NO13", 0 ) --�^��W�@��
	else --�������y�d��
		SetSpeakDetail( Owner , "[SC_STARPET_NO13_MES3]")
		local PlayerLv = ReadRoleValue( Owner , EM_RoleValue_Lv )	 
		GiveBodyItem( Owner , StarPet[LV], 1 )	
		SetFlag( Owner , StarPetKey[LV], 1 )
		DeBugMsg( 0,0 , "CHECK ="..StarPetKey[LV])
		DesignLog( Owner , DesignLogCheck[LV], "PlayerLv ="..PlayerLv) 
	end
end


---���եΫ��O 
function Lua_na_starpet_give(LV) --������@���q��12���P�y�d
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


function Lua_na_starpet_Del(LV) --�R����@���q��12���P�y�d
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