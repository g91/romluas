function Bahu_Check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 420591 ) == false or CheckCompleteQuest( OwnerID() , 420591 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_1"), 0 ); --/*���Ȥ��ŦX�C
		return false
	elseif CountBodyItem( OwnerID() , 201249) >= 5 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_0"), 0 ); --/*�A�w�g��F�������ͩީ��C
		return false
	end
	if CheckID( TargetID() ) == false or TargetID() == OwnerID() then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_2"), 0 ); --/*�A�S���ؼСC
		return false
	else
		if Target ~= 100367 then 
			if Target ~= 100354 then 
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_3"), 0 ); --/*�ؼп��~�C
				return false	
			elseif ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_4"), 0 ); --/*�A�����������ͩީ������A�A�~�໤���e�C
					return false
			else	
				return true
			end
		elseif ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID() then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_4"), 0 ); --/*�A�����������ͩީ������A�A�~�໤���e�C
			return false
		else	
			return true
		end
	end
end

function Bahu_Effect()
	if  Rand(20) > 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_5"), 0 ); --/*���r�I�t�@�I�N���F�I
	else
		BeginPlot(TargetID() , "Bahu_Reset" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_BAHU_6"), 0 ); --/*�A���\�a���F�@�����ͩީ��I
		GiveBodyItem(OwnerID() ,201249 , 1 )
	end
end

function Bahu_Reset()
	LuaFunc_ResetObj( OwnerID() )	
end

function LuaQ_420458_Complete()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
end




