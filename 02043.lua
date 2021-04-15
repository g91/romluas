function bk_130_116466()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room            
	local afdoor = CreateObjByFlag(104579,780687,4,1)
	SetModeEx( afdoor , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( afdoor , EM_SetModeType_Mark, false)
	SetModeEx( afdoor , EM_SetModeType_HideName, false)
	SetModeEx( afdoor , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( afdoor , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( afdoor , EM_SetModeType_Obstruct, true)   -----���O
	SetModeEx( afdoor , EM_SetModeType_Strikback, false) ---����
	SetModeEx( afdoor , EM_SetModeType_Move, false) ---����	
	SetModeEx( afdoor , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( afdoor , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( afdoor , EM_SetModeType_Searchenemy, false)
	SetModeEx( afdoor , EM_SetModeType_Show, true)
	AddToPartition( afdoor , RoomID )
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,afdoor)---- �b������W��J����id
	local hard =0 
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,hard)---- �g�J�@�����׿����
end
function bk_hard_easy_op() --��ܡA�Ĥ@�h
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_00]" , "bk_hard_easy_op_1", 0 ) --�i�J�U�@���A�����C
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_01]" , "bk_hard_easy_00", 0 ) --�����i�J���q�Űƥ�
end
function bk_hard_easy_op_1() --��ܡA�ĤG�h
	SetSpeakDetail( OwnerID(), "[SC_116466_02]"   ) --��ܤ��e--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_03]" , "bk_hard_easy_op_2", 0 ) --
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_04]" , "bk_hard_easy_00", 0 ) --�����i�J���q�Űƥ�
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_hard_easy_op", 0 ) --�^��W�@��
end
function bk_hard_easy_op_2() --��ܡA�ĤT�h
	SetSpeakDetail( OwnerID(), "[SC_116466_05]"   ) --��ܤ��e--
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_06]" , "bk_hard_easy_01", 0 ); --1�����סC
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_07]" , "bk_hard_easy_02", 0 ); --2�����סC
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_08]" , "bk_hard_easy_03", 0 ); --3�����סC
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_09]" , "bk_hard_easy_04", 0 ); --4�����סC
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116466_10]" , "bk_hard_easy_05", 0 ); --5�����סC
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]" , "bk_hard_easy_op_1", 0 ) --�^��W�@��
end
function bk_hard_easy_00()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,6)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_00_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	end
end
function bk_hard_easy_01()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,1)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_01_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	end
end
function bk_hard_easy_02()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,2)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_02_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	end
end
function bk_hard_easy_03()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,3)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_03_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W.
	end
end
function bk_hard_easy_04()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end

		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,4)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_04_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	end
end
function bk_hard_easy_05()
	local afdoor = ReadRoleValue(TargetID( ),EM_RoleValue_PID)----Ū�����
	local hard = ReadRoleValue(TargetID( ),EM_RoleValue_Register2)----Ū����
	if hard == 0 then 
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register2,1)------------�g�i�����ꪺ����
		DisableQuest(TargetID( ),true)
		CloseSpeak( OwnerID() )
		local PPL = SearchRangePlayer ( TargetID( ) , 100 )	
		local x=table.getn(PPL)-----���X�Ӫ��O�ƶq
		for i=0 ,x , 1 do 
			CloseSpeak( PPL[i] )
		end
		
		WriteRoleValue(TargetID( ) ,EM_RoleValue_Register1,5)------------�g�i���׿�ܪ�����
		Delobj(afdoor)
		AddBuff( TargetID( ) , 507738 , 0, -1 )-----------�ܦ����S���y
		SetModeEx( TargetID( ) , EM_SetModeType_Mark, false)
		SetModeEx( TargetID( ) , EM_SetModeType_Obstruct, false)
		BeginPlot( TargetID( ) ,"bk_hard_easy_05_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	end
end
function bk_hard_easy_00_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
		    CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
		end
	end
end


function bk_hard_easy_01_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	local x=0
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
		    CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_02_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	local x=1
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��			
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_03_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	local x=2
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_04_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	local x=3
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end
function bk_hard_easy_05_op()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )   -------------Ū�X�{�b��room                                               
	local npcm=SetSearchAllNPC(RoomID)----------------------���X�ƶq  -------------��M�o��room �Ҧ�npc�����b�@��table �̭��M��npcm �N��o�Ӹ�Ƹ̭����h�֭�npc 
	local x=4
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
	local npcde = GetSearchResult()			-------------�v�@���C��npc�s��	
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104461			-----���˥d
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103946   ----------�L���h��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103947   ---------�����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103948   -------------�Q�����F
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 103949  -------------����
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104173  -------------���ª�c
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104465  -----------�`���F��
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
		if ReadRoleValue(npcde , EM_RoleValue_OrgID) == 104096  -----------���w
			and ReadRoleValue( npcde , EM_RoleValue_IsDead ) == 0 then 
			CancelBuff(npcde , 507717 )-------�M��
			CancelBuff(npcde , 507718 )-------�M��
			AddBuff( npcde , 507717 , x , -1 )
			AddBuff( npcde , 507718 , x , -1 )
		end
	end
end