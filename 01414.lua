function Hao_Zone352_Chest_1()   -- ACT1 ~ ACT2 ���_�c Script&������

	local Player = OwnerID()	-- ���a
	local Chest = TargetID()	-- �_�c
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --���o�Ҧbroom

	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckFlag( Player , 542743 ) == false then	-- �p�G�Ӫ��a�S���W�A�S���}���_�c�������A�hĵ�i�æ^�����@���C
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		DesignLog( Player , 113137 , "Cheater" )	-- �����L�_�c
		return
	end
	
	if ReadRoleValue( Chest , EM_RoleValue_PID) == 1 then 				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )		-- ���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( Chest , EM_RoleValue_PID, 1 )
	
	if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_Zone352_Chest_2" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--�ؼХ��b���L��
		return
	end	
end

function Hao_Zone352_Chest_2( Player , CheckStatus )	-- ���ʰƥ� - �����L�q�|�@���_�c�@��  Player = ����̡BCheckStatus = ���浲�G(�j��0�O���\�A�p��0�O����)

	local Chest = TargetID()	-- �_�c
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )	-- Ū�����a����
	local Level = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- Ū�����d�h�šA�H�M�w�_�c����
--	local OrgID = ReadRoleValue( Chest , EM_RoleValue_OrgID )	-- Ū����Ʈw�]�w������ID
	
	local Treasure = {}	-- �_�c���e��
	Treasure[1] = 724526	-- Lv20~29 �_�c���e
	Treasure[2] = 724527	-- Lv30~39 �_�c���e
	Treasure[3] = 724528	-- Lv40~49 �_�c���e
	Treasure[4] = 724529	-- Lv50~59 �_�c���e
	Treasure[5] = 724529	-- Lv60+ �_�c���e
	
	if CheckStatus ~= 0 then	-- �p�G���I�k����
		if CheckStatus > 0 then	-- �I�k���\
			if EmptyPacketCount(Player) >= 1 and QueuePacketCount(Player) == 0 then --�ˬd�I�]���
				PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --�_�c���򼽩�145�B146
				GiveBodyItem( Player , Treasure[Level] , 1 )
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
				SetPlot( Chest , "touch" , "Hao_Zone352_Chest_1" , 50 )
			end
			EndCastBar( Player , CheckStatus )
		else	-- �I�k����
			WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
			SetPlot( Chest , "touch" , "Hao_Zone352_Chest_1" , 50 )
			EndCastBar( Player , CheckStatus )
		end
	end
end