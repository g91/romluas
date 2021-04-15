function LuaS_110592()

	LoadQuestOption( OwnerID() )

	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_5"), "LuaS_110592_5", 0 ) 
	AddSpeakOption( OwnerID(), TargetID( ),GetString("SO_110561_1"), "LuaS_110592_1", 0 ) 

	if CheckFlag( OwnerID()  , 540001 ) == false then
		SetFlag( OwnerID()  , 540001 , 1 )
	end

	if CheckFlag( OwnerID()  , 540826 ) == true then
	else
		if ( CountBodyItem( OwnerID() , 201211 ) >= 10 ) then
			SetFlag( OwnerID()  , 540826, 1 )
		end
	end
end

function AlreadyTenCrystal()		-- ���������Q�ӲŤ崹��
	if CheckFlag( TargetID() , 540826 ) == true then	-- ���n���~�G������Q�ӲŤ崹��
	else
		SetFlag( TargetID() , 540826 , 1 )
	end

	if ( CheckCompleteQuest( TargetID() , 420701 ) == false or CheckCompleteQuest( TargetID() , 420702 ) == false or CheckCompleteQuest( TargetID() , 420703 ) == false or CheckCompleteQuest( TargetID() , 420704 ) == false or CheckCompleteQuest( TargetID() , 420705 ) == false or CheckCompleteQuest( TargetID() , 420706 ) == false or CheckCompleteQuest( TargetID() , 420707 ) == false or CheckCompleteQuest( TargetID() , 420708 ) == false ) then
		local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )	-- �p�G������A�@�}�l�N�ӸѪ���
	
		    if ( job == 0 ) then
			-- return "�޲z��"
		elseif  ( job == 1 ) then
			SetFlag( TargetID() , 540811 , 1 )	-- �s��¾�~��Ԥh
		elseif  ( job == 2 ) then
			SetFlag( TargetID() , 540812 , 1 )	-- �s��¾�~��C�L
		elseif  ( job == 3 ) then
			SetFlag( TargetID() , 540813 , 1 )	-- �s��¾�~��s��
		elseif  ( job == 4 ) then
			SetFlag( TargetID() , 540814 , 1 )	-- �s��¾�~��k�v
		elseif  ( job == 5 ) then
			SetFlag( TargetID() , 540815 , 1 )	-- �s��¾�~�ﲽ�q
		elseif  ( job == 6 ) then
			SetFlag( TargetID() , 540816 , 1 )	-- �s��¾�~���M�h
		elseif  ( job == 7 ) then
			SetFlag( TargetID() , 540817 , 1 )	-- �s��¾�~�逸�F��
		elseif  ( job == 8 ) then
			SetFlag( TargetID() , 540818 , 1 )	-- �s��¾�~��w�|��
		end
		return true
	end

end

function TransferJobHall()
	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	    if ( job == 1 ) then
		ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- �Ԥh
	elseif ( job == 2 ) then
		ChangeZone( TargetID() , 2 , 0 , 5565 , 62, -4305 , 60 )	-- �C�L
	elseif ( job == 3 ) then
		ChangeZone( TargetID() , 2 , 0 , 5488 , 62, -4314 , 105 )	-- �v���
	elseif ( job == 4 ) then
		ChangeZone( TargetID() , 2 , 0 , 5595 , 62, -4235 , 330 )	-- �k�v
	elseif ( job == 5 ) then
		ChangeZone( TargetID() , 2 , 0 , 5473 , 62, -4182 , 235 )	-- ���q
	elseif ( job == 6 ) then
		ChangeZone( TargetID() , 2 , 0 , 5544 , 62, -4173 , 290 )	-- �M�h
	--elseif ( job == 7 ) then
	--	ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- ���F��
	--elseif ( job == 8 ) then
	--	ChangeZone( TargetID() , 2 , 0 , 5442 , 62, -4254 , 165 )	-- �w�|��
	else
		Say ( OwnerID , "�D�X�k¾�~" )
	end
	return true
end

function AllJobMasterTalk()

	if ( CheckFlag( OwnerID() , 540831 ) == true and CheckFlag( OwnerID() , 540832 ) == true and CheckFlag( OwnerID() , 540833 ) == true and CheckFlag( OwnerID() , 540834 ) == true and CheckFlag( OwnerID() , 540835 ) == true and CheckFlag( OwnerID() , 540836 ) == true ) then
		return true
	else
		return false
	end
end

function TalkGiveSelfJob()
	if CheckFlag( TargetID() , 540826 ) == true then	-- ���n���~�G�}�l�P��L���ɭ�����
	else
		SetFlag( TargetID() , 540826 , 1 )
	end

	local job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	    if ( job == 1 ) then
		SetFlag( TargetID() , 540831 , 1 )	-- ���n���~�G�Ĥ@����Ԥh����
	elseif ( job == 2 ) then
		SetFlag( TargetID() , 540832 , 1 )	-- ���n���~�G�Ĥ@����C�L����
	elseif ( job == 3 ) then
		SetFlag( TargetID() , 540833 , 1 )	-- ���n���~�G�Ĥ@����v��̻���
	elseif ( job == 4 ) then
		SetFlag( TargetID() , 540834 , 1 )	-- ���n���~�G�Ĥ@����k�v����
	elseif ( job == 5 ) then
		SetFlag( TargetID() , 540835 , 1 )	-- ���n���~�G�Ĥ@���򲽥q����
	elseif ( job == 6 ) then
		SetFlag( TargetID() , 540836 , 1 )	-- ���n���~�G�Ĥ@�����M�h����
	--elseif ( job == 7 ) then
	--	SetFlag( TargetID() , 540837 , 1 )	-- ���n���~�G�Ĥ@�����F�ϻ���
	--elseif ( job == 8 ) then
	--	SetFlag( TargetID() , 540838 , 1 )	-- ���n���~�G�Ĥ@����w�|�컡��
	else
		Say ( OwnerID , "�D�X�k¾�~" )
	end
	return true
end

function StartJobMasterTalk()		-- �}�l�P��L���ɭ�����
	if CheckFlag( TargetID() , 540826 ) == true then	-- ���n���~�G�}�l�P��L���ɭ�����
	else
		SetFlag( TargetID() , 540826 , 1 )
	end
end