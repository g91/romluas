function LuaS_420611_check()
	local HP = ReadRoleValue(TargetID(),EM_RoleValue_HP)
	local MaxHP = ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)
	local Timemy = HP/MaxHP
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 100399 then
		if Timemy<0.3 then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_3"), 0 );--�A���L�X�U�I
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_2"), 0 ); --�o�O���ӧ�s�骺�A�A�O���O�d���F�H
		return false
	end
end

function LuaS_420611_use()
	BeginPlot( TargetID(), "LuaS_420611", 0 )
	GiveBodyItem( OwnerID(), 201438, 1 )--���@��
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420611_0"), 0 ); --�Q���ӥb�����s��Q��i�F�c�l�A�@��ä��٤@��j�|�I
end


function LuaS_420611()
	DelFromPartition( OwnerID() )
	Sleep(100)
	AddToPartition( OwnerID() , 0 )
	LuaFunc_ResetObj( OwnerID())
end