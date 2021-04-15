--����.�R�L�y 103913
--����.�R�L�y 115489
--�j�]�q 115504
--�Ⱦ���.�C�� 103914
--�U���Ǫ� 103907
--�R�j�F������p�e 423191
--���~�G�����Ȫ��A�� 207173
--���~�G�]�q 207299
--�ܨ�buff�G�����Ȱ��� 506712
--���ʺX�l�G780611
--�����X�СG544023
--544024 �P�Ⱦ�����Ĳ
--544025 �P���౵Ĳ

function LuaS_115489_0()
	if CheckFlag( OwnerID() , 544025 ) == true and CheckAcceptQuest( OwnerID() , 423191 ) == true and CheckBuff( OwnerID() , 506712 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_10]" ) --�A����[ZONE_KAIYA_VILLAGE]����`���ڡA�@�|��A�ڴN�|�쨺�C
	else
		LoadQuestOption( OwnerID() )	
		if CheckBuff( OwnerID() , 506712 ) == true then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423191_A_0]" , "LuaS_115489_1", 0 )	--(�N�]�q��ܦo����W�C)
		end
	end
end

function LuaS_115489_1()
	if CheckAcceptQuest( OwnerID() , 423191 ) == false then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_1]" ) --�ڤ��O��A���L�A�S�Ƥ��n�o��j�n�j�\���i�J�����A�K�o���H�h�áI
	elseif CountBodyItem( OwnerID() , 207299 ) == 0 and CheckFlag( OwnerID() , 544025 ) == false then
		SetSpeakDetail( OwnerID() , "[SC_423191_A_2]" ) --��A�ڪ��D�F�I�ڤw�g��A���L�A���n�o��j�n�j�\���i�J�����A�K�o���H�h�áI���N�Oť�����H�ܡH
	else
		DelBodyItem( OwnerID() , 207299 , 1 )
		SetFlag( OwnerID() , 544025 , 1 )
		SetSpeakDetail( OwnerID() , "[SC_423191_A_3]" ) --��A�ڪ��D�F�I�ڤw�g��A���L�A���n�o��j�n�j�\���i�J�����A�K�o���H�h�áI���N�Oť�����H�ܡH�}�F�A�A����[ZONE_KAIYA_VILLAGE]����`���ڡA�@�|��A�ڴN�|�쨺�C
	end
end

function LuaI_207173_Check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_1]" , 0 ) --�԰����L�k���ˡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( OwnerID() , 506712 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_2]" , 0 ) --�A�w�g���W[207173]�F
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_2]" , 0 )
		return false
	end
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_3]" , 0 ) --�A�L�k�b�M���ɴ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaI_207173_USE()
	AddBuff( OwnerID() , 506712 , 0 , -1 )
end

function LuaI_423191_Check()
	SetPlot( OwnerID() , "range" , "LuaI_423191_Check_2" , 50 )
end

function LuaI_423191_Check_2()
	if CheckAcceptQuest( OwnerID() , 423191 ) == true and CheckFlag( OwnerID() , 544023 ) == false and CheckFlag( OwnerID() , 544025 ) == true then

		if ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
			if ReadRoleValue(TargetID() , EM_RoleValue_Register + 1 ) ~= OwnerID() then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_4]" , 0 ) --[115489]���G�٨S����F�A�p�G�b�o�̵��i��|�ް_�����n���`�N�A�L�@�|��A�L�ӷ|����n�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_4]" , 0 )
			end
			return
		end
		if CheckBuff( OwnerID() , 506712 ) == false  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_5]" , 0 ) --�γ\�A�Ӭ�W[115462]���A���A�ˡA�A�P[115489]�����C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_5]" , 0 )
			return
		end
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
		WriteRoleValue( TargetID() , EM_RoleValue_Register + 1 , OwnerID() )	
		BeginPlot( TargetID() , "LuaI_423191_Play" , 0 )
	end
end

function LuaI_423191_Play()
	
	local Flag = 780611
	local Bear = CreateObjByFlag( 103913 , Flag , 1 , 1 )
	local Alien = CreateObjByFlag( 103914 , Flag , 2 , 1 )
	local Bag = CreateObjByFlag( 115504 , Flag , 3 , 1 )
	local Monster = CreateObjByFlag( 103907 , Flag , 3 , 1 )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Temp = 0
	
	WriteRoleValue( Bear , EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( Alien , EM_RoleValue_IsWalk , 1 )
	SetRoleCamp( Bear , "Visitor" )
	SetRoleCamp( Alien , "Visitor" )
			
	for i = 1 , 1800 do --�p�� 30 ����
		local State = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
		if CheckID(TargetID() ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 and CheckBuff( TargetID() , 506712 ) == false then
			if CheckID( Bear ) == true and ReadRoleValue( Bear, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 and State < 4 then
				Yell( Bear , "[SC_423191_C_1]" , 2 ) --���|�O�A�H
				WriteRoleValue( Bear , EM_RoleValue_Register  , 1 )
				SetRoleCamp( Bear , "Monster" )
				SetAttack( Bear , TargetID() )
				CallPlot( Bear , "LuaFunc_423191_Suicide" , 100 )
			end
			if CheckID( Alien ) == true and ReadRoleValue( Alien, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
				Yell( Alien , "[SC_423191_C_2]" , 2 ) --�o�O���^�ơH�A�O�֡H�A���۫��F?
				WriteRoleValue( Alien , EM_RoleValue_Register  , 1 )
				SetRoleCamp( Alien , "Monster" )
				SetAttack( Alien , TargetID() )
				CallPlot( Alien , "LuaFunc_423191_Suicide" , 100 )
			end
		end
		if State == 1 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			AddToPartition( Bear , RoomID )
			AddToPartition( Alien , RoomID )
			MoveToFlagEnabled( Bear , false )
			MoveToFlagEnabled( Alien , false )
			Yell( Bear , "[SC_423191_B_1]" , 2 ) --��ڭ̨��C
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 2 )			
		end
		if State == 2 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			local Result = 0
			if LuaI_423191_Move_And_Hide( Bear , 4 , 0 ) == true then
				Result = Result + 1
			end
			if LuaI_423191_Move_And_Hide( Alien , 5 , 0 ) == true then
				Result = Result + 1
			end
			if Result > 1 then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 3 )	
			end
		end
		if State == 3 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 and ReadRoleValue( Bear , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				AdjustFaceDir( Bear , Alien, 0 ) --�Ϧۤv���V�ؼ�
				AdjustFaceDir( Alien, Bear , 0 ) --�Ϧۤv���V�ؼ�
			end
			if Temp == 1 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				Yell( Bear , "[SC_423191_B_2]" , 2 ) --�ڻ��L�h�֦��F�H��´�O��´�A����O����A�ڦ��ڪ��@�k�A�ڤw�g�b�Q��k�����A�̧�L�̳��ި�[ZONE_ALIMAR_TOMB]�F�A�A���ٷQ��ˡH
			end
			if Temp == 5 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_POINT )
				Yell( Bear , "[SC_423191_B_3]" , 2 ) --���p�H�A�̪��@�k�A�O���i�������~1001���B����~762�����I�٤��p���ڤ@�ˤ@�B�B����L�̡A�ܤ֥ثe1001���w�g�H�઺�ܤU�ڬ��L�����ľ��C
			end
			if Temp == 9 then
				PlayMotion( Bear , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
				Yell( Bear , "[SC_423191_B_4]" , 2 ) --���D���ܡA�N���I�^�h�V�L�̦^���a�I�A�L���[�A�L�̴N�|�Q�ڤި��[ZONE_ALIMAR_TOMB]�A�O�A�S�·ФF�A���նܡH
			end
			if Temp == 12 then
				AdjustFaceDir( Bear , Alien, 180 ) --�Ϧۤv���V�ؼ�
				if CheckID( TargetID() ) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --�Ϧۤv���V�ؼ�
				end
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 4 )	
				Temp = -1
			end
			Temp = Temp + 1
		end
		if State == 4 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				LuaI_423191_Move_And_Hide( Bear , 7,5 )
				PlayMotion( Alien, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
			end
			if Temp == 3 then
				if CheckID( TargetID() ) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --�Ϧۤv���V�ؼ�
				end
			end
			if Temp == 4 then
				PlayMotion( Alien , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
				Yell( Alien , "[SC_423191_B_5]" , 2 ) --�k�H�ڡ�N�O�o�ˡA�R�õo�ʮ�I�ޡ�A���ѫ�򳣤����ܩO�H�n�a�I���K�⨺����򦨥\������~�a�^���Ӧa��a�I
			end
			if Temp == 6 then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 5 )	
				Temp = -1
			end
			Temp = Temp + 1
		end
		if State == 5 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			AddToPartition( Bag , RoomID )
			SetPlot( Bag , "touch" , "LuaI_423191_Bag_Touch" , 30 )
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 6 )	
		end
		if State == 6 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if LuaI_423191_Move_And_Hide( Alien , 6 , 0 ) == true then
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 7 )	
			end
		end
		if State == 7 and ReadRoleValue( Alien , EM_RoleValue_Register ) == 0 then
			if Temp == 0 then
				AdjustFaceDir( Alien, Bag , 0 ) --�Ϧۤv���V�ؼ�
			end
			if Temp == 1 then
				PlayMotionEX( Alien , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
			end
			if Temp == 2 then
				Yell( Alien , "[SC_423191_B_6]" , 2 ) --��I�o�O�N�O���ǷM���������U���A����o�˻����۫H�k�H�����ľ��O�H
			end
			if Temp == 3 then
				PlayMotion( Alien , ruFUSION_ACTORSTATE_CROUCH_END)
			end
			if Temp == 5 then
				if CheckID( TargetID()) == true then
					AdjustFaceDir( Alien, TargetID() , 0 ) --�Ϧۤv���V�ؼ�
				end
				Yell( Alien , "[SC_423191_B_7]" , 2 ) --�N�e�a�^�h�a�I�p�ߤ@�I�A���n���e�k�F�X�ӡI
			end
			if Temp == 6 then
				PlayMotion( Alien, ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
				if CheckID( TargetID() ) == true and CheckAcceptQuest( TargetID() , 423191 ) == true then
					SetFlag( TargetID() , 544024 , 1 )
				end
				WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 8 )	
			end
			Temp = Temp + 1
		end
		if CheckID( Bag ) == false and State ~= 9 then
			AddToPartition( Monster , RoomID )
			SetPlot( Monster , "dead" , "LuaI_423191_MonsterDead" , 0 )
			WriteRoleValue( OwnerID() , EM_Rolevalue_Register , 9 )
			if CheckID( TargetID() ) == true then
				SetAttack( Monster , TargetID() )
				CancelBuff_NoEvent( TargetID() , 506712 )
			end
			SetRoleCamp( Alien , "Monster" )
			SetPlot( Alien , "dead" , "LuaI_423191_AlienDead" , 0 )
			CallPlot( Alien , "LuaFunc_423191_Suicide" , 100 )
			CallPlot( Monster , "LuaFunc_423191_Suicide" , 100 )
			Yell( Alien , "[SC_423191_C_2]" , 2 ) --�o�O���^�ơH�A�O�֡H�A���۫��F?
			WriteRoleValue( Alien , EM_Rolevalue_Register , 1 ) --��ܨȾ���.�C���i�J�԰����A
			if CheckID( TargetID() ) == true then
				SetAttack( Alien , TargetID() )
			end			 
		end
		sleep( 10 )
		--�@�����_�P�w
		if	( CheckID( Alien ) == false or ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Alien , EM_RoleValue_Register ) > 1 ) and
			( CheckID( Bear ) == false or ReadRoleValue( Bear , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Bear , EM_RoleValue_Register ) > 1 ) and
			State < 4 
		then	
			break
		end
		if	( CheckID( Alien ) == false or ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 1 or ReadRoleValue( Alien , EM_RoleValue_Register ) > 1 ) and
			State >= 4 
		then
			if CheckID( Monster ) == true and ReadRoleValue( Monster , EM_RoleValue_Register ) == 0 then
				BeginPlot( Monster , "LuaI_423191_MonsterDead" , 0 )
			end
			break
		end

		if CheckID( TargetID() ) == false then
			break
		end
		if CheckAcceptQuest( TargetID() , 423191 ) == false then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_6]" , 0 ) --�����ȡA�@�����_�C
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_6]" , 0 )
			break
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			break
		end
		if CheckID(Alien) == true and ReadRoleValue( Alien , EM_RoleValue_IsDead ) == 0 and GetDistance( TargetID() , Alien ) > 350 then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_7]" , 0 ) --�W�X�Z���A�@�����_�C
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_7]" , 0 )
			break
		end
		if i == 1800 then
			ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423191_A_8]" , 0 ) --�W�X�ɶ��A�@�����_�C
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423191_A_8]" , 0 )
			break
		end
	end
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() ,  544024 , 0 ) 
	end
	for i = 1 , 4 , 1 do
		local Obj
		if i == 1 then Obj = Bear end
		if i == 2 then Obj = Alien end
		if i == 3 then Obj = Bag end
		if i == 4 then Obj = Monster end
		if CheckID( Obj ) == true and ReadRoleValue( Obj , EM_RoleValue_IsDead ) == 0 then DelObj( Obj ) end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )		
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +1 , 0 )	
end

function LuaI_423191_Move_And_Hide( Obj , FlagNum , Time)
	local X = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780611 ,FlagNum , EM_RoleValue_Z )
	local ObjID = Role:new( Obj )
	local Dis = ( ObjID:X() - X ) ^ 2 + ( ObjID:Y() - Y ) ^ 2 + ( ObjID:Z() - Z ) ^ 2

	if Time > 0 then
		WriteRoleValue( Obj , EM_RoleValue_LiveTime , Time )
	end
	if Dis > 250 then
		Move( Obj , X , Y , Z )
		return false
	else
		StopMove(Obj,true)
		return true
	end
end

function LuaI_423191_MonsterDead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 ) --��ܩǪ��Q���Ѫ��@��Ĳ�o
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	SetRoleCamp( OwnerID() , "Visitor" )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	AddBuff( OwnerID() , 503605 , 1 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_LiveTime , 3 )
	return false
end
function LuaI_423191_AlienDead()
	local count = HateListCount( OwnerID() );
	for i = 1 , Count  , 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( ID , 423191 ) == true then
			SetFlag( ID , 544023  , 1 ) 
		end
	end
	return true
end
function LuaI_423191_Bag_Touch()
	If CheckFlag( OwnerID() , 544024 ) == true and CheckAcceptQuest( OwnerID() , 423191 ) == true then
		Delobj( TargetID() )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_A_9]" , 0 ) --�o�ӳU�l�̸˪��F��ݨӤQ���޲��A�b�˲M�����e�̦n���n�����IĲ�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_A_9]" , 0 )
	end
end

function LuaFunc_423191_Suicide(Time)
	--Time ����s�b���̧C�ɶ�
	Sleep(Time)

	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- �����ˬd�@��	
		else
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)  == 0 then
				if ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) == 103907 then
					BeginPlot( OwnerID() , "LuaI_423191_MonsterDead" , 0 )
				else
					WriteRoleValue( OwnerID() , EM_RoleValue_register , 2 )
					Lua_CancelAllBuff( OwnerID() ) 
					SetRoleCamp( OwnerID() , "Visitor" )
					LuaI_423191_Move_And_Hide( OwnerID() , 7,5 )
				end
			end
			break		
		end
		sleep(1)
	end
end