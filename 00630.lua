
function LuaS_420743_delete( ItemID , ItemNum  )
	if ( DelBodyItem ( OwnerID() , ItemID , ItemNum ) ) then				
		CastSpell( TargetID(), OwnerID(), 493155)
		return true
	else
		return false
	end
end


function LuaS_420744_start()
	DisableQuest( OwnerID() , true )--�궤������
	local captain = OwnerID()--�O�U����id
	local player = TargetID()--�O�U���aid
	local npc = CreateObj(110914 , -13997 , -159 , 8388 , 0 , 1)--�гy���`�ۨϪ�
	AddToPartition( npc ,    0 ) 
	MoveToFlagEnabled( npc  , false )--�������޼@��
	local s = 0--�����`�ۨ��춤������
	local f = 0
	local fc = GetMoveFlagCount( 780077)-1--���`�ۺX��
	while 1 do
		local fx = GetMoveFlagValue( 780077, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780077, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780077, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( npc , EM_RoleValue_X)
		local gy = ReadRoleValue( npc , EM_RoleValue_Y)
		local gz = ReadRoleValue( npc , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else	
			Move ( npc , fx , fy , fz  )
			WriteRoleValue( npc  ,EM_RoleValue_IsWalk , 0  )
		end
		Sleep(7)
	end
	AdjustFaceDir( captain , npc , 0 )
	Say( captain , GetString("SAY_420774_0" ))--�A�n�A���`�۪��Ϫ̡A�ܰ�������A
	Sleep(20)
	Say( npc ,GetString("SAY_420774_1"))--�ڤ]�O�A�^�i�������C
	Sleep(20)
	Say( captain ,GetString("SAY_420774_2"))--���N��...��H
	
	local archer = CreateObj( 110916 , -14353 , -172 ,  8555 , 0 , 1 )--�إX����
	AddToPartition( archer ,    0 ) 
	MoveToFlagEnabled( archer , false )--�������޼@��
	local s = 0--�����Զ]�V����
	local f = 0
	local fc = GetMoveFlagCount( 780078)-1
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( archer , EM_RoleValue_X)
		local gy = ReadRoleValue( archer , EM_RoleValue_Y)
		local gz = ReadRoleValue( archer , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else
			WriteRoleValue( archer  ,EM_RoleValue_IsWalk , 0  )--�ζ]��	
			Move ( archer ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	AdjustFaceDir( captain , archer , 0 )
	Say ( archer , GetString("SAY_420774_3"))	--�����I�����̩��o�̨ӤF�I
	Sleep(13)
	Say(  captain  , GetString("SAY_420774_4"))--����I�V�F�A�Ϫ̳·ЧA�����۸˦��A�ӧA�N�����b�c�l�̡C
	AdjustFaceDir( captain , npc  , 0 )

	PlayMotionEX( npc, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)--�����`�ۨϪ̽��U
	CastSpell( captain, player , 491202 )--���ܪ��a���c�l
	Sleep(10)
	local fong = CreateObj ( 110920 , -14353 , -172 ,  8555 , 0  ,  1)	--�إX����������
	AddToPartition( fong ,    0 ) 
	MoveToFlagEnabled( fong , false )--�������޼@��
	local s = 0--�������̶]�V���a
	local f = 0
	local fc = GetMoveFlagCount( 780078)-2
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( fong , EM_RoleValue_X)
		local gy = ReadRoleValue( fong , EM_RoleValue_Y)
		local gz = ReadRoleValue( fong , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then
			if fc == f then
				break
			else
				f = f + 1
			end
		else
			WriteRoleValue( fong  ,EM_RoleValue_IsWalk , 0  )--�ζ]��	
			Move ( fong ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	AdjustFaceDir( captain , fong , 0 )
	Say( fong , GetString("SAY_420774_5"))--���`�۪��V�b�b���̡H
	Sleep(13)
	Say( captain ,GetString("SAY_420774_6"))--�i���I�A�ӱߤF�@�B�A�o�Ӷ��`�۪��O�ڱ����I�Ʊ�A���n�V�����ó��m�ڥ\�ҰڡC
	Sleep(20)
	Say( fong ,GetString("SAY_420774_7"))--�A...�H�_�ǡI��診�ӤH�������A�̨p�ۻP���`...
	Sleep(13)
	Say( captain ,GetString("SAY_420774_8"))--�A�J������I�A�ðd�ڪ��a�A�O�n�M�ڨM���ܡH�I
	Sleep(20)
	Say( fong , GetString("SAY_420774_10"))--�i�c�I���ӭJ�ó��i���H�N���n�Q�ڧ��...
	local s = 0--�������̶]�^�h
	local fc = GetMoveFlagCount( 780078)-1
	while 1 do
		local fx = GetMoveFlagValue( 780078, f , EM_RoleValue_X)
		local fy = GetMoveFlagValue( 780078, f , EM_RoleValue_Y)
		local fz = GetMoveFlagValue( 780078, f , EM_RoleValue_Z)

		local gx = ReadRoleValue( fong , EM_RoleValue_X)
		local gy = ReadRoleValue( fong , EM_RoleValue_Y)
		local gz = ReadRoleValue( fong , EM_RoleValue_Z)

		if s > 60000 then
			break
		else
			s=s+1
		end

		if fx/10 == gx/10 and fz/10 == gz/10 then			
			if f == 0 then
				break
			else
				f = f - 1
			end
		else
			WriteRoleValue( fong  ,EM_RoleValue_IsWalk , 0  )--�ζ]��	
			Move ( fong ,  fx , fy , fz  )
		end
		Sleep(2)
	end
	DelObj(fong )
	AdjustFaceDir( captain , npc  , 0 )
	Say( captain ,GetString("SAY_420774_11"))--�S�ƤF�A�Ϫ̥��Ͱ_�ӧa
	Sleep(20)
	PlayMotion( npc , ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(20)
	Say( captain  ,GetString("SAY_420774_12"))--����N���ڤ�U�����Ի�A�h�d�F�اa
	Sleep(20)
	Say( archer  ,GetString("SAY_420774_13"))--��R�C�Ϫ̤j�H���H�ڨӡC
	Sleep (15)
	Say ( npc , GetString("SAY_420774_14"))--�ڭ̫�|�����A�^�i�������C
	Sleep(10)
	DelObj(archer)
	DelObj(npc)
	AdjustFaceDir( captain , player  , 0 )
	Sleep(20)

	Say ( captain , GetString("SAY_420774_15"))--�A�]�i�H�X�ӤF�A�w�g���θ��F�I
	CancelBuff( player , 501599 )--�⪱�a�ܦ^��
	SetFlag( player , 540859 , 1 )--�����a���n���~
	DisableQuest( captain  , false )
end

