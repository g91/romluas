--�I�����~�e�ˬd
function lua_Q425793_OnClickObjBegin()
	if CountBodyItem( OwnerID(),242053 )>=1 then
		return true
	end
	ScriptMessage( OwnerID(),OwnerID(),3,"[SC_Q425793_1]",0)
	--�A���W�S������i�H�Ψӧl���x�N�����~�C
	return false
end
--�I�����~��
function lua_Q425793_OnClickObjEnd()
	if DelBodyItem( OwnerID(), 242053, 1 ) then
		GiveBodyItem( OwnerID(),242054,1 )
		AddRoleValue( TargetID(),EM_RoleValue_Register1,1)
		DebugMsg(0,0,"WarmWinter,AG,testR1="..ReadRoleValue( TargetID(),EM_RoleValue_Register1))
		if ReadRoleValue( TargetID(),EM_RoleValue_Register1)>=15 then
			CallPlot( TargetID(),"lua_Q425793_Every15LV",0)
			WriteRoleValue( TargetID(),EM_RoleValue_Register1,0)
		end
		return 1
	end
	return false
end
--�C��15�h
function lua_Q425793_Every15LV()
--	local Count = SetSearchAllPlayer(0)
--	local Count = SetSearchRangeInfo( GItemID,Range )
--	for i = 1 , Count , 1 do
--		local ID = GetSearchResult()
--		ScriptMessage(OwnerID(),-1,1,"[SC_Q425793_2]",0)
--	end	
	DebugMsg(0,0,"WarmWinter,AG,test,WhenLV15.")
end

function FN_Xmas2012_SnowPoint_Q425793()
	local player = TargetID()
	SetFlag( player,547287,0 )	--�ǲK�[���ȵ����R�������ȺX��
	SetFlag( player, 547337, 1 )	--FN�K�[�����Լ��P�_�X��
end