function LuaCM_Check( Option, Player, OrgID )
-- Option = ������ئW��
-- Player = �ؼ�
-- OrgID = ��Ʈw�s���B�ƥ�

-- LuaCM_Check( ������ئW��, ����ؼ�, ��Ʈw�s��/�ƥ� )
-- �^�ǭȬ����L�� ����ؼС]�����A�^�O�_�����]���T�^

	if Option == nil then
		ScriptMessage( Player, Player, 1, "Option is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "Option is nil", 0 )
		return false
	end
	if Player == nil then
		ScriptMessage( Player, Player, 1, "Player is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "Player is nil", 0 )
		return false
	end
	if OrgID == nil then
		ScriptMessage( Player, Player, 1, "OrgID is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "OrgID is nil", 0 )
		return false
	end

	if Option == "ID" then
		if CheckID(Player) == true then
			return true
		end
	elseif Option == "CompleteQuest" then
		if CheckcompleteQuest( Player, OrgID ) == true then
			return true
		end
	elseif Option == "AcceptQuest" then
		if CheckAcceptQuest( Player, OrgID ) == true then
			return true
		end
	elseif Option == "PartyQuest" then
		if CheckAcceptQuest( Player, OrgID ) == true then
			return true
		end
	elseif Option == "Flag" then
		if CheckFlag( Player, OrgID ) == true then
			return true
		end
	elseif Option == "Buff" then
		if CheckBuff( Player, OrgID ) == true then
			return true
		end
	elseif Option == "Card" then
		if CheckCardFlag( Player, OrgID ) == true then
			return true
		end
	elseif Option == "BodyItem" then
		if CountBodyItem( Player, OrgID ) == 1 then
			return true
		else
			return CountBodyItem( Player, OrgID )
		end
	elseif Option == "Item" then
		if CountItem( Player, OrgID ) == 1 then
			return true
		else
			return CountItem( Player, OrgID )
		end
	elseif Option == "BagSpace" then
		local NeedSpace = OrgID
		if Check_Bag_Space( Player, NeedSpace ) == 1 then
			return true
		else
			return Check_Bag_Space( Player, NeedSpace )
		end
	elseif Option == "Hour" then
		local Hour = OrgID
		if GetSystime(1) == Hour then
			return true
		end
	elseif Option == "Minute" then
		local Minute = OrgID
		if GetSystime(2) == Minute then
			return true
		end
	else
		ScriptMessage( Player, Player, 1, "No This Option", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "No This Option", 0 )
	end

	return false

end

function LuaCM_Number_Count( Option, Player, OrgID )
-- Option = ������ئW��
-- Player = �ؼ�
-- OrgID = ��Ʈw�s��

-- LuaCM_Number_Count( ������ئW��, ����ؼ�, ��Ʈw�s�� )
-- �^�ǭȬ��ƭ� ����ؼЪ��ƶq

	if Option == nil then
		ScriptMessage( Player, Player, 1, "Option is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "Option is nil", 0 )
		return false
	end
	if Player == nil then
		ScriptMessage( Player, Player, 1, "Player is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "Player is nil", 0 )
		return false
	end
	if OrgID == nil then
		ScriptMessage( Player, Player, 1, "OrgID is nil", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "OrgID is nil", 0 )
		return false
	end

	if Option == "BodyItem" then
		return CountBodyItem( Player, OrgID )
	elseif Option == "Item" then
		return CountItem( Player, OrgID )
	elseif Option == "BagSpace" then
		local NeedSpace = OrgID
		return Check_Bag_Space( Player, NeedSpace )
	else
		ScriptMessage( Player, Player, 1, "No This Option", C_DEFAULT )
		ScriptMessage( Player, Player, 0, "No This Option", 0 )
	end
end