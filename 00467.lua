function LuaI_201250_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420458 ) == false or CheckCompleteQuest( OwnerID() , 420458 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_0"), 0 ); --/*���Ȥ��ŦX�C
		return false
	elseif CountBodyItem( OwnerID() , 201249 ) >= 5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_1"), 0 ); --/*�������ͩީ��bŢ�l���̰ʵۡC
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_2"), 0 ); --/*�A�S���ؼСC
		return false
	else
		if Target ~= 100367 then 
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_3"), 0 ); --/*�ؼп��~�C
			return false	
		elseif ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_4"), 0 ); --/*�A�����������ͩީ������A�A�~�໤���e�C
			return false
		else
			return true
		end
	end
end

function LuaC_201250_Effect()
	if  Rand(20) > 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_5"), 0 ); --/*���r�I�t�@�I�N���F�I
	else
		BeginPlot(TargetID() , "LuaI_201250_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_201250_6"), 0 ); --/*�A���\�a���F�@�����ͩީ��I
		GiveBodyItem(OwnerID() ,201249 , 1 )
	end	
end
function LuaI_201250_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end