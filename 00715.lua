

function LuaS_421234_0()--���b
	SetPlot (OwnerID() , "Range" , "LuaS_421234_1" , 70)
end

function LuaS_421234_1()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541292 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_1") , 0 )	--�o�����ӴN�O���b
	end
end

function LuaS_421234_2()--�k�b
	SetPlot (OwnerID() , "Range" , "LuaS_421234_3" , 70)
end

function LuaS_421234_3()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541293 ) ==false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_2") , 0 )	--�o�����ӴN�O�k�b
	end
end

function LuaS_421234_4()--���b
	SetPlot (OwnerID() , "Range" , "LuaS_421234_5" , 70)
end

function LuaS_421234_5()
	if CheckAcceptQuest( OwnerID(), 421234 ) and CheckFlag( OwnerID(), 541294 ) ==false then
		ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_3") , 0 )	--�o�����ӴN�O���b
	end
end
function LuaS_421234_6_0()
	local NPC = SearchRangeNPC ( OwnerID(), 80 )
	for i=0,table.getn(NPC) do
		local ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		if ID == 111231 then
			if CheckFlag( OwnerID(), 541292 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return false
			else
				return true
			end
		end
		if ID == 111232 then
			if CheckFlag( OwnerID(), 541293 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return false
			else
				return true
			end
		end
		if ID == 111233 then
			if CheckFlag( OwnerID(), 541294 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return false
			else
				return true
			end
		end
			
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_6") , 0 )	--�A�n���A�X���a��~��
	return false
end

function LuaS_421234_6()
	local NPC = SearchRangeNPC ( OwnerID(), 80 )
	for i=0,table.getn(NPC) do
		local ID = ReadRoleValue( NPC[i] , EM_RoleValue_OrgID)
		if ID == 111231 then
			if CheckFlag( OwnerID(), 541292 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--�r�ϸ˸m�}�l���͵L��L��������I
				SetFlag( OwnerID(), 541292 , 1 )
				return
			end
		end
		if ID == 111232 then
			if CheckFlag( OwnerID(), 541293 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--�r�ϸ˸m�}�l���͵L��L��������I
				SetFlag( OwnerID(), 541293 , 1 )
				return
			end
		end
		if ID == 111233 then
			if CheckFlag( OwnerID(), 541294 ) then
				ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_4") , 0 )	--�A�w�g�b�o�̩�L�r�ϤF�I
				return
			else
				DelBodyItem(OwnerID() , 202398 , 1)
				ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421234_5") , 0 )	--�r�ϸ˸m�}�l���͵L��L��������I
				SetFlag( OwnerID(), 541294 , 1 )
				return
			end
		end
			
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421234_6") , 0 )	--�A�n���A�X���a��~��
end