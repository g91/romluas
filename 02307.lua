function cl_21_105464AI() ---������
	local AI = OwnerID() ----AI=���
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----���Ū���a��
	local Xin_Te = CreateObjByFlag( 105452 , 780975 , 0 , 1 ) ------------boss���ͦ�m
	SetModeEx( Xin_Te , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Xin_Te , EM_SetModeType_Move, false) ---����	(�_)
	AddToPartition ( Xin_Te , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( Xin_Te , EM_RoleValue_PID , AI )--BOSS PID��������W��
	BeginPlot( Xin_Te,"cl_21_Xin_Te_Performance", 0 )---����԰��@��
	WriteRoleValue ( AI , EM_RoleValue_Register2 , 0 )--BOSS PID��������W��
	local door = CreateObjByFlag( 105386 , 780912 , 0 , 1 ) ------------���ͫ��
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---����(�O)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( door , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( door , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( door , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( door,RoomID ) ----����[�J����,�Ҧ椽��
	while 1 do---�j���ˬd�԰����A
		sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 �԰��}�l stage=2 BOSS���` stage=3 BOSS���}�԰����m
		if stage == 1 then
		elseif stage == 2 then---BOSS���`���A
		elseif stage == 3 then---BOSS���}�԰����A
			delobj ( Xin_Te )
			sleep ( 50 )
			Xin_Te = CreateObjByFlag( 105452 , 780912 , 1 , 1 ) ------------�֬Oboss�n�b���̲���
			AddToPartition ( Xin_Te , RoomID ) ----����[�J����,�Ҧ椽��
			WriteRoleValue ( Xin_Te , EM_RoleValue_PID , AI )
			BeginPlot( Xin_Te,"cl_21_Xin_Te_Performance", 0 )
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 )
		end
	end
end
function cl_21_Xin_Te_Performance()  ---BOSS���}����t
	local Xin_Te = OwnerID() ----�ڥs��AI
	local RoomID = ReadRoleValue( Xin_Te , EM_RoleValue_RoomID ) ----���Ū���a��
	local AI = ReadRoleValue ( Xin_Te , EM_RoleValue_PID )
	local CombatBegin = 0
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( Xin_Te , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
		if HateListCount( Xin_Te ) ~= 0 then ---�p�G������������H�N�~��԰�
			if CombatBegin == 0 then   -----�p�G������������H~�N�N�o�ӭȧ���
				local Performance = ReadRoleValue ( AI , EM_RoleValue_Register2 ) ---Ū���O�_�w�g�]�L��t
				if Performance == 0 then
					local PPL = SetSearchAllPlayer(RoomID )
					for i = 1 , PPL , 1 do ---�⪱�a��J�ж��� 
						local ID = GetSearchResult()
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and 
							ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and 
							ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then
						end
					end
					for i = 1 , 6 , 1 do
						say ( Xin_Te , "i="..i)
						SetPosByFlag( Xin_Te , 780975 , Flag )
						Flag = Flag + 1
						sleep ( 10 )
						if i == 6 then
							SetModeEx( Xin_Te , EM_SetModeType_Strikback, true) ---����(�_)
							SetModeEx( Xin_Te , EM_SetModeType_Move, true) ---����	(�_)
						end
					end	
					WriteRoleValue ( AI , EM_RoleValue_Register2 , 1 )
				end
				CombatBegin = 1
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 )	
			end
			if CombatBegin == 1 then
				
			end
		elseif HateListCount ( Xin_Te ) == 0 then ---�p�G����������S���H�N�n�Ǧ^��������
			if CombatBegin == 1 then  ----�p�G��������S���H�F~�N�N�o�ӭȧ���
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 )
			end
		end
	end
end
function cl_21_Performance()
	local Xin_Te = OwnerID() ----�ڥs��AI
	say ( Xin_Te , "1111")
	local RoomID = ReadRoleValue( Xin_Te , EM_RoleValue_RoomID ) ----���Ū���a��
	local AI = ReadRoleValue ( Xin_Te , EM_RoleValue_PID )
	local Flag = 1
end
function cl_attackbuff()
	local Xin_Te = OwnerID()
	local AttackTarget = ReadRoleValue( Xin_Te , EM_RoleValue_AttackTargetID )-----AttackTarget=��e�����ؼ�
	local buff_table = {509336,509337,509338}
	local buff_No = 0
	buff_No = DW_Rand (100)
	if ( buff_No >= 1 and buff_No <= 10) or
		( buff_No >= 41 and buff_No <= 50 ) or
		( buff_No >= 81 and buff_No <= 90 ) or
		( buff_No >= 91 and buff_No <= 100 ) then
		return
	elseif ( buff_No >= 11 and buff_No <= 20 ) or
		( buff_No>= 51 and buff_No <= 60 ) then
		addbuff ( AttackTarget , 509336 , 0 , 120 )
	elseif ( buff_No >=21 and buff_No <= 30 ) or 
		( buff_No >= 61 and buff_No <= 70 ) then
		addbuff ( AttackTarget , 509337 , 0 , 120 )
	elseif ( buff_No >= 31 and buff_No <= 40 ) or 
		( buff_No >= 71 and buff_No <= 80 ) then
		addbuff ( AttackTarget , 509338 , 0 , 120 )
	end
end