function cl_139_Trap_P1()
	local AI = OwnerID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	local Trap_flag_A = {"cl_139_TrapA_1","cl_139_TrapA_2","cl_139_TrapA_3","cl_139_TrapA_4","cl_139_TrapA_5","cl_139_TrapA_6"}
	local rand_function = 0
	local TrapA = CreateObjByFlag( 105653 , 780937 , 0 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapA , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapA , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapA , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapA , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapA , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapA , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapA , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapA , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapA , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapA , EM_RoleValue_PID , AI ) ---
	local TrapB = CreateObjByFlag( 105653 , 780937 , 1 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapB , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapB , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapB , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapB , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapB , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapB , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapB , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapB , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapB , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapB , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA , EM_RoleValue_Register1 , TrapB ) ---
	--WriteRoleValue ( TrapB , EM_RoleValue_Register1 , TrapA ) ---
	BeginPlot( TrapB,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	BeginPlot( TrapA,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_1 = CreateObjByFlag( 105653 , 780937 , 2 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapA_1 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapA_1 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapA_1 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapA_1 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapA_1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapA_1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapA_1 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapA_1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapA_1 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapA_1 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_1 = CreateObjByFlag( 105653 , 780937 , 3 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapB_1 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapB_1 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapB_1 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapB_1 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapB_1 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapB_1 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapB_1 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapB_1 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapB_1 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapB_1 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_1 , EM_RoleValue_Register1 , TrapB_1 ) ---
	--WriteRoleValue ( TrapB_1 , EM_RoleValue_Register1 , TrapA_1 ) ---
	BeginPlot( TrapB_1,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	BeginPlot( TrapA_1,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_2 = CreateObjByFlag( 105653 , 780937 , 4 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapA_2 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapA_2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapA_2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapA_2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapA_2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapA_2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapA_2 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapA_2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapA_2 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapA_2 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_2 = CreateObjByFlag( 105653 , 780937 , 5 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapB_2 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapB_2 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapB_2 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapB_2 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapB_2 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapB_2 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapB_2 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapB_2 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapB_2 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapB_2 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_2 , EM_RoleValue_Register1 , TrapB_2 ) ---
	--WriteRoleValue ( TrapB_2 , EM_RoleValue_Register1 , TrapA_2 ) ---
	BeginPlot( TrapB_2,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	BeginPlot( TrapA_2,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_3 = CreateObjByFlag( 105653 , 780937 , 6 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapA_3 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapA_3 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapA_3 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapA_3 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapA_3 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapA_3 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapA_3 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapA_3 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapA_3 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapA_3 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_3 = CreateObjByFlag( 105653 , 780937 , 7 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapB_3 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapB_3 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapB_3 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapB_3 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapB_3 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapB_3 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapB_3 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapB_3 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapB_3 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapB_3 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_3 , EM_RoleValue_Register1 , TrapB_3 ) ---
	--WriteRoleValue ( TrapB_3 , EM_RoleValue_Register1 , TrapA_3 ) ---
	BeginPlot( TrapB_3,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	BeginPlot( TrapA_3,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
	local TrapA_4 = CreateObjByFlag( 105653 , 780937 , 8 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapA_4 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapA_4 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapA_4 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapA_4 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapA_4 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapA_4 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapA_4 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapA_4 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapA_4 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapA_4 , EM_RoleValue_PID , AI ) ---
	sleep ( 1 )
	local TrapB_4 = CreateObjByFlag( 105653 , 780937 , 9 , 1 ) ------------�֬Oboss�n�b���̲���
	SetModeEx ( TrapB_4 , EM_SetModeType_Obstruct, false) 		---����(�O) -----�o�̭n��gBOSS���W�����A~�@�}�l����t�ҥH�������a����
	SetModeEx( TrapB_4 , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( TrapB_4 , EM_SetModeType_Move, false) ---����	(�_)
	SetModeEx( TrapB_4 , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( TrapB_4 , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( TrapB_4 , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( TrapB_4 , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( TrapB_4 , EM_SetModeType_NotShowHPMP , false) ----����ܼg��
	AddToPartition ( TrapB_4 , RoomID ) ----����[�J����,�Ҧ椽��
	WriteRoleValue ( TrapB_4 , EM_RoleValue_PID , AI ) ---
	WriteRoleValue ( TrapA_4 , EM_RoleValue_Register1 , TrapB_4 ) ---
	--WriteRoleValue ( TrapB_3 , EM_RoleValue_Register1 , TrapA_3 ) ---
	BeginPlot( TrapB_4,"cl_139_TrapB", 0 )
	rand_function = DW_Rand(6)  ----->��100�Ӷüƥh�H���@�ӭȥX��
	BeginPlot( TrapA_4,Trap_flag_A[rand_function], 0 )
	sleep ( 1 )
end
function cl_139_TrapA_1()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 8 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_2()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 2 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 9 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_3()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 5 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 6 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_4()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 5 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 11 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_5()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 2 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 5 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 6 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapA_6()
	local TrapA = OwnerID()
	local TrapB = ReadRoleValue ( TrapA , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapA ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 1 then
			if skill_ON == 0 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 1
			end
		end	
		if skill  >= 3 then
			if skill_ON == 1 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 2
			end
		end
		if skill >= 4 then
			if skill_ON == 2 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 3
			end
		end
		if skill >= 13 then
			if skill_ON == 3 then
				CastSpelllv ( TrapA , TrapB , 497728 , 0 )----�e�记��
				CastSpelllv ( TrapB , TrapA , 497729 , 0 )----�e�记��
				sleep ( 80 )
				skill_ON = 0
				skill = 0
			end
		end
	end
end
function cl_139_TrapB()  ---�T�w���ե�
	local TrapB = OwnerID()
	local TrapA = ReadRoleValue ( TrapB , EM_RoleValue_Register1 )
	local skill = 0
	local skill_ON = 0
	SetDefIdleMotion( TrapB ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
end
function cl_ch_497738()
	if ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) == 105758 then
		local number = ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
		WriteRoleValue ( TargetID() , EM_RoleValue_Register1, number+1  )
		return true
	elseif ReadRoleValue(TargetID() , EM_RoleValue_OrgID ) ~= 105758 then
		return false
	end
end
function cl_139_105758()
	local Device = OwnerID()
	---local CombatBegin = 0
	SetDefIdleMotion( Device ,ruFUSION_ACTORSTATE_CAST_SP01	)----------------------�����ʧ@
	local skill = 0
	while 1 do
		sleep ( 10 )
		skill = skill + 1
		if skill >= 3 then
			CastSpelllv ( Device , Device , 497738 , 0 )----�e�记��
			sleep ( 10 )
			skill = 0
		end
		local number = ReadRoleValue ( Device , EM_RoleValue_Register1 )
		if number >= 6 then
			killid ( Device , Device )
			sleep ( 30 )
			delobj ( Device )
		end
	end
end
function cl_139_118582_1() ---�إ�NPC�ɭԭn����Ĳ�I�@��
	local white_time = 0
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 6 )
	SetPlot( OwnerID(), "touch","cl_139_118582_touch", 30 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
	while 1 do
		sleep ( 10 )
		local white = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
		if white == 0 then
			white_time = white_time +1
			if white_time >= 30 then
				WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, 6 )
				white_time = 0
			end
		end
	end
end
function cl_139_118582_touch() ---Ĳ�I�@���n�ˬd����Ų~�����e���浹�����~�A�S�����e����r�괣��
	local white = ReadRoleValue ( TargetID() , EM_RoleValue_Register1 )
	if white > 0 then
		if CountBodyItem( OwnerID(), 240241 ) ~= 0 then	
			if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_139_118582_1]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_139_118582OK") ~=1	then
				ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			end
		elseif CountBodyItem( OwnerID(), 240241 ) == 0 then	
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_139_118582_2]", 0 );		--�ؼЦ��L��
		end
	elseif white == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_139_118582_3]", 0 );		--�ؼЦ��L��
	end
end
function cl_139_118582OK(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
		if	Result > 0 then --���\���A
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_139_give207614" , 0)
		else
			EndCastBar(Executer,Result)--�M���I�k��
		end
	else
		EndCastBar(Executer,Result)--�M���I�k��
		ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
	end
end
function cl_139_give207614()
	white = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register1, white-1  )
	DelBodyItem ( TargetID(), 240241, 1 )
	GiveBodyItem ( TargetID(), 207614, 1 )
end
function cl_139_118583()
	addbuff ( OwnerID() , 620015 , 0 , -1 )
	SetPlot( OwnerID(), "touch","cl_139_118583_touch", 30 ) ------PlotType Ĳ�o���� (����"touch"Ĳ�I�B"range"�d��B"dead"���`�B"collision"�I���|��)
end
function cl_139_118583_touch()
	if	BeginCastBarEvent( OwnerID() , TargetID() , "[SC_139_118583_1]" , 10 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END,0 , "cl_139_118583ok") ~=1	then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
	end
end
function cl_139_118583ok(Executer,Result) ---�ˬd�ؼЦ��S�����~�����e��������
	if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���
		if	Result > 0 then --���\���A
			EndCastBar(Executer,Result)--�M���I�k��
			BeginPlot( TargetID() , "cl_139_give204241" , 0)
		else
			EndCastBar(Executer,Result)--�M���I�k��
		end
	else
		EndCastBar(Executer,Result)--�M���I�k��
		ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
	end
end
function cl_139_give204241()
	GiveBodyItem ( TargetID(), 240241, 1 )
end
function cl_139_BUFF_dead()
	local SK = Lua_BuffPosSearch( OwnerID(), 620395 )  ---Ū��BOSS�ۤv���W���X�hbuff
	local SKX=BuffInfo( OwnerID(), SK , EM_BuffInfoType_Power )---Ū���ޯ൥��
	if SKX < 10 then
		addbuff ( OwnerID() , 620395 , 0 , 900 )
	end
end
function cl_139_chbuff_620396()
	local SK = Lua_BuffPosSearch( TargetID(), 620395 )  ---Ū��BOSS�ۤv���W���X�hbuff
	local SKX = 0
	SKX=BuffInfo( TargetID(), SK , EM_BuffInfoType_Power )---Ū���ޯ൥��
	if SKX <= 8 then
		return true
	elseif SKX >= 9 then
		return false
	end
end