function LuaI_B3Door_Zone2A_0() --�]�w������l�@���A�P�ɭ��m�����ܼ�
	SetModeEX( OwnerID() , EM_SetModeType_Mark , false )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Ver_Zone100_B3_Door[RoomID] = {} 
	Ver_Zone100_B3_Door[RoomID]["Door"] = OwnerID() --�ǻ��ۤv��ID
	Ver_Zone100_B3_Door[RoomID]["State"] = 0 --�N�ˬd�Ϊ��ܼ��k�s

end

function LuaI_100_B2Keeper() --�]�w���w�k�v�����`�@���A��b��l�@����
	SetPlot( OwnerID() ,"dead" , "LuaI_B2Keeper_Dead" , 40 )
end

function LuaI_B2Keeper_Dead() --���w�k�v�b���`�ɷ|�ˬd��L���w�k�v���F�X�ӡA���F�|��(�[�ۤv)�NĲ�o�۳�����J

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = Ver_Zone100_B3_Door[RoomID]["Door"]
	local Check = Ver_Zone100_B3_Door[RoomID]["State"]
	Check = Check + 1
	Ver_Zone100_B3_Door[RoomID]["State"] = Check
	if Check >= 4 and Check < 100 then --�[�W�P�_�A���}�L����������o�q�@��
		Check = 100
		Ver_Zone100_B3_Door[RoomID]["State"] = Check
		local Player = LuaFunc_PartyData(TargetID())
		for i = 1 , Player[0] , 1 do
			if CheckAcceptQuest( Player[i] , 420109) == true and CheckFlag( Player[i] , 540205) == false then
				SetFlag( Player[i] , 540205 , 1 )
			end 
		end
		BeginPlot( Door , "LuaI_B3Door_Zone2A_1" , 0 )
	end
	
	return true	
end

function LuaI_B3Door_Zone2A_1() --���ͷ����J���@��

	local Tollker = CreateObjByFlag( 100073,780022,8,1) --���ͷ����J�ó]�w���`�@��
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	AddToPartition( Tollker , Zone )
	SetPlot( Tollker , "dead" , "LuaI_B2BOSS_Dead" , 40 ) -- �]�w���`�@��
	ScriptMessage( OwnerID(), -1 ,1, GetString("SAY_100073_1"), 0 ); --/*�ͧ������J�j�ۡG�}�a�w�d���Ȥj�H�k�}���J�I�̡I�N�������J�ӱаV�A�̧a�I
	CastSpell( Tollker , Tollker , 490101 )


end

function LuaI_B2BOSS_Dead() --�����J�����ɭԶ}�Ҫ�
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),100073,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)		--�������`

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Door = Ver_Zone100_B3_Door[RoomID]["Door"]
	BeginPlot( Door , "LuaI_B3Door_Zone2A_2" , 0 ) -- �]���}�Ұʧ@�ݭnSleep�A�����b���`�@���A�G�ΩI�s��
	return true	
end

function LuaI_B3Door_Zone2A_2() --��������}�Ҫ��ʧ@
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
	sleep( 40 )
end