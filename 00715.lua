

function LuaS_421234_0()--左帳
	SetPlot (OwnerID() , "Range" , "LuaS_421234_1" , 70)
end

function LuaS_421234_1()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541292 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_1") , 0 )	--這裡應該就是左帳
	end
end

function LuaS_421234_2()--右帳
	SetPlot (OwnerID() , "Range" , "LuaS_421234_3" , 70)
end

function LuaS_421234_3()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541293 ) ==false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_2") , 0 )	--這裡應該就是右帳
	end
end

function LuaS_421234_4()--中帳
	SetPlot (OwnerID() , "Range" , "LuaS_421234_5" , 70)
end

function LuaS_421234_5()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541294 ) ==false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_3") , 0 )	--這裡應該就是中帳
	end
end
function LuaS_421234_6_0()
	local NPC = SearchRangeNPC ( OwnerID(), 80 )
	for i=0,table.getn(NPC) do
		local ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		if ID == 111231 then
			if CheckFlag( OwnerID(), 541292 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return false
			else
				return true
			end
		end
		if ID == 111232 then
			if CheckFlag( OwnerID(), 541293 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return false
			else
				return true
			end
		end
		if ID == 111233 then
			if CheckFlag( OwnerID(), 541294 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return false
			else
				return true
			end
		end
			
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_6") , 0 )	--你要找到適合的地方才行
	return false
end

function LuaS_421234_6()
	local NPC = SearchRangeNPC ( OwnerID(), 80 )
	for i=0,table.getn(NPC) do
		local ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		if ID == 111231 then
			if CheckFlag( OwnerID(), 541292 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--毒煙裝置開始產生無色無味的氣體！
				SetFlag( OwnerID(), 541292 , 1 )
				return
			end
		end
		if ID == 111232 then
			if CheckFlag( OwnerID(), 541293 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--毒煙裝置開始產生無色無味的氣體！
				SetFlag( OwnerID(), 541293 , 1 )
				return
			end
		end
		if ID == 111233 then
			if CheckFlag( OwnerID(), 541294 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--你已經在這裡放過毒煙了！
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--毒煙裝置開始產生無色無味的氣體！
				SetFlag( OwnerID(), 541294 , 1 )
				return
			end
		end
			
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_6") , 0 )	--你要找到適合的地方才行
end