
--107340--�z���y

--�� �@�å��� ��--
function sasa_106904_ShowAttack()
	while true do
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_POLEARM , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP , ruFUSION_ACTORSTATE_NORMAL )
		Sleep( 10 )
		Sleep( rand( 100 ) )
	end
end

--�� �@��Ĳ�I�r�� ��--
function sasa_107340_range()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_107340_rangeAI" , 50 )
end

function sasa_107340_rangeAI()		--�I�����󲣥ͦr��
	local AI = TargetID()
	local Num = ReadRoleValue( AI , EM_RoleValue_PID )
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		if Num == 1 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER01]" , 2 )
			--�A�@�y�Ǵe�G�u���ƯB�b�Ť����ͪ��O�H�v
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 2 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER02]" , 2 )
			--����`�B�A��^���G���F���ܡK�K
			sleep(10)
			DelObj ( AI )
		elseif Num == 3 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER03]" , 2 )
			--�@����h�A�A�ݵۤh�L�P�Q�ޱ��̤����A�������d�b�L�h��a�@���K
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 4 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER04]" , 2 )
			--�ò汱��h�L�̡A�L�k�ѱϦP��A�]�u�ण�_�a�԰��I
			sleep ( 10 )
			DelObj ( AI )
		elseif Num == 5 then
			ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER05]" , 2 )
			--���M���A�A�o�{�ӱ�W���j���ۤ��M�`���^��K
			sleep ( 10 )
			DelObj ( AI )
		end
	end
end

--==============================================================================
--�� ���_�X�� ��--

--�����y��m/GM ? zone 149 0 1680 3190 652.8
--X-6,Z-6
--107344--���
--Flag--16
function sasa_149_holethemonster()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --�ت���ɶ�J����
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
		local counter = 0
		local mobcount = 0
		local mob = {}
		local DemonID = 106907	--�ǳ�
		--local R = math.random(3)
		local Touchflag = (PID-1)*8
		local BallA = CreateObjByFlag( 107340 , 780858 , Touchflag+1 , 1 )	--���ܲy
		SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
		SetModeEx( BallA , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
		SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
		SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--����
		SetModeEx( BallA , EM_SetModeType_Mark , false )			--�аO
		SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--���
		SetModeEx( BallA , EM_SetModeType_Move , false )			--����
		SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( BallA , EM_SetModeType_Strikback , false )		--����
		SetModeEx( BallA , EM_SetModeType_Show , true )				--�q�X
		AddToPartition( BallA , Room )
		
		local Crack = CreateObjByFlag( 107343 , 780858 , Touchflag+2 , 1 )	--���_
		SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
		SetModeEx( Crack , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
		SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
		SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--����
		SetModeEx( Crack , EM_SetModeType_Mark , false )			--�аO
		SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--���
		SetModeEx( Crack , EM_SetModeType_Move , false )			--����
		SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( Crack , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Crack , EM_SetModeType_Show , true )				--�q�X
		AddToPartition( Crack , Room )
		
		local Touch01 = CreateObjByFlag( 114340 , 780858 , Touchflag+3 , 1 )
		SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch01 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch01 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch01 , Room )
		local Touch02 = CreateObjByFlag( 114340 , 780858 , Touchflag+4 , 1 )
		SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch02 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch02 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch02 , Room )
		local Touch03 = CreateObjByFlag( 114340 , 780858 , Touchflag+5 , 1 )
		SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch03 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch03 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch03 , Room )
		local Touch04 = CreateObjByFlag( 114340 , 780858 , Touchflag+6 , 1 )
		SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch04 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch04 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch04 , Room )
		local Touch05 = CreateObjByFlag( 114340 , 780858 , Touchflag+7 , 1 )
		SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch05 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch05 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch05 , Room )
		local Touch06 = CreateObjByFlag( 114340 , 780858 , Touchflag+8 , 1 )
		SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch06 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch06 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch06 , Room )
		local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
		local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
		
		Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--�����2�O�r��P��
		Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--�����3�O���_
		Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--�r��P����1�O���
		Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--�r��P����3�O���_
		
		SetPlot( BallA , "range" , "sasa_107340_holeAI" , 50 )
		
		local lucky = DW_rand(6)										--����X�諸���s
		Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
		Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
		table.remove( Set , lucky )										--�襤�����s�qtable����
		
		for i = 1 , 5 do
			Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--��L���s�]�w�|�z��
			Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
			--table.remove( ScriptSet , num )
			sleep(1)
		end

		while 1 do
			sleep(10)
			if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
				counter = counter + 1
				if counter >= 7 then
					if mobcount < 12 then
						mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--�ͩǳ�
						counter = 0
						mobcount = mobcount + 1
					end
				end
			else
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end

function sasa_149_holethemonster_2()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local counter = 0
	local mobcount = 0
	local mob = {}
	local DemonID = 106902	--�ǳ�
	--local R = math.random(3)
	--local Touchflag = (PID-1)*8
	local BallA = CreateObjByFlag( 107340 , 780858 , 9 , 1 )	--���ܲy
	SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
	SetModeEx( BallA , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
	SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
	SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( BallA , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( BallA , EM_SetModeType_Move , false )			--����
	SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallA , EM_SetModeType_Strikback , false )		--����
	SetModeEx( BallA , EM_SetModeType_Show , true )				--�q�X
	
	AddToPartition( BallA , Room )
	
	local Crack = CreateObjByFlag( 107343 , 780858 , 10 , 1 )	--���_
	SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
	SetModeEx( Crack , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
	SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
	SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( Crack , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( Crack , EM_SetModeType_Move , false )			--����
	SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Crack , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Crack , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( Crack , Room )
	
	local Touch01 = CreateObjByFlag( 114340 , 780858 , 11 , 1 )
	SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch01 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch01 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch01 , Room )
	local Touch02 = CreateObjByFlag( 114340 , 780858 , 12 , 1 )
	SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch02 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch02 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch02 , Room )
	local Touch03 = CreateObjByFlag( 114340 , 780858 , 13 , 1 )
	SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch03 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch03 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch03 , Room )
	local Touch04 = CreateObjByFlag( 114340 , 780858 , 14 , 1 )
	SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch04 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch04 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch04 , Room )
	local Touch05 = CreateObjByFlag( 114340 , 780858 , 15 , 1 )
	SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch05 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch05 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch05 , Room )
	local Touch06 = CreateObjByFlag( 114340 , 780858 , 16 , 1 )
	SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch06 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch06 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch06 , Room )
	local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
	local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
	
	Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--�����2�O�r��P��
	Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--�����3�O���_
	Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--�r��P����1�O���
	Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--�r��P����3�O���_
	
	SetPlot( BallA , "range" , "sasa_107340_holeAI" , 50 )
	
	local lucky = DW_rand(6)										--����X�諸���s
	Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
	Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
	table.remove( Set , lucky )										--�襤�����s�qtable����
	
	for i = 1 , 5 do
		Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--��L���s�]�w�|�z��
		Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
		--table.remove( ScriptSet , num )
		sleep(1)
	end

	while 1 do
		sleep(10)
		if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
			counter = counter + 1
			if counter >= 10 then
				if mobcount < 12 then
					mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--�ͩǳ�
					counter = 0
					mobcount = mobcount + 1
				end
			end
		else
			mobcount = 0
			counter = 0
			mob = {}
		end
	end
end

function sasa_107340_holeAI()
	local Ball = TargetID()
	local RoomID = ReadRoleValue ( Ball , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue ( Ball , EM_RoleValue_register3 )
	local Mons = star_CreateObj( Crack , 106901 , 0 , 0 , 0 , RoomID , 0)
	--AddToPartition( Mons , RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER06]" , 2 )
		--�e���M�X�{�_�S�����H�A�O���_�I�����_�K
		sleep ( 20 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER07]" , 2 )
		--�Ǫ����q���_��X�A�Ө�Ǫ�������G�O����I
		Writerolevalue( Crack , EM_RoleValue_register10 , 1 )
		sleep ( 10 )
		--DelObj ( Ball )
		Hide ( Ball )
	end
end

function sasa_107340_TouchAI01()		--�I�������_
	BeginPlot( TargetID() , "sasa_107340_TouchAI01_1" , 0 )
end

function sasa_107340_TouchAI01_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	sleep(1)
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue( OwnerID() , EM_RoleValue_register3 )
	local Light = 499456	--�q��
	local PPL = SetSearchAllPlayer(Room)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER08]" , 2 )
	CastSpellLv( OwnerID() , Crack , Light , 0 )
	sleep(20)
	DelObj ( Crack )
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
			if CountBodyItem ( ID , 530932 ) == 0 then
				GiveBodyItem( ID , 530932 , 1 )
			end
		end
	end
end

function sasa_107340_TouchAI02()		--�I���Q��
	BeginPlot( TargetID() , "sasa_107340_TouchAI02_1" , 0)
	WriteRoleValue ( TargetID() , EM_RoleValue_Register4 , OwnerID() )	--�z�����s��4�O���a
end

function sasa_107340_TouchAI02_1()
	Setplot( OwnerID() , "touch" , "" , 0 )
	local toucher = ReadRoleValue ( OwnerID() , EM_RoleValue_Register4 )
	local LightBomb = 499455	--�{������
	CastSpellLv( toucher , toucher , LightBomb , 8 )
end



--�� ���_�X�� ��--

--�����y��m/GM ? zone 149 0 1680 3190 652.8
--X-6,Z-6
--107344--���
--Flag--16
function sasa_149_holethemonster_E()
	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )   --�ت���ɶ�J����
	if PID > 0 then
		local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
		local counter = 0
		local mobcount = 0
		local mob = {}
		local DemonID = 107406	--�ǳ�
		--local R = math.random(3)
		local Touchflag = (PID-1)*8
		local BallA = CreateObjByFlag( 107340 , 780858 , Touchflag+1 , 1 )	--���ܲy
		SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
		SetModeEx( BallA , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
		SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
		SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--����
		SetModeEx( BallA , EM_SetModeType_Mark , false )			--�аO
		SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--���
		SetModeEx( BallA , EM_SetModeType_Move , false )			--����
		SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( BallA , EM_SetModeType_Strikback , false )		--����
		SetModeEx( BallA , EM_SetModeType_Show , true )				--�q�X
		AddToPartition( BallA , Room )
		
		local Crack = CreateObjByFlag( 107343 , 780858 , Touchflag+2 , 1 )	--���_
		SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
		SetModeEx( Crack , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
		SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
		SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--����
		SetModeEx( Crack , EM_SetModeType_Mark , false )			--�аO
		SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--���
		SetModeEx( Crack , EM_SetModeType_Move , false )			--����
		SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
		SetModeEx( Crack , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Crack , EM_SetModeType_Show , true )				--�q�X
		AddToPartition( Crack , Room )
		
		local Touch01 = CreateObjByFlag( 114340 , 780858 , Touchflag+3 , 1 )
		SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch01 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch01 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch01 , Room )
		local Touch02 = CreateObjByFlag( 114340 , 780858 , Touchflag+4 , 1 )
		SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch02 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch02 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch02 , Room )
		local Touch03 = CreateObjByFlag( 114340 , 780858 , Touchflag+5 , 1 )
		SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch03 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch03 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch03 , Room )
		local Touch04 = CreateObjByFlag( 114340 , 780858 , Touchflag+6 , 1 )
		SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch04 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch04 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch04 , Room )
		local Touch05 = CreateObjByFlag( 114340 , 780858 , Touchflag+7 , 1 )
		SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch05 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch05 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch05 , Room )
		local Touch06 = CreateObjByFlag( 114340 , 780858 , Touchflag+8 , 1 )
		SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
		SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
		SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
		SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --����
		SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--�аO
		SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--���
		SetModeEx( Touch06 , EM_SetModeType_Move , false )			--����
		SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
		SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--����
		SetModeEx( Touch06 , EM_SetModeType_Show , true )			--�q�X
		SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--��show���
		AddToPartition( Touch06 , Room )
		local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
		local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
		
		Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--�����2�O�r��P��
		Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--�����3�O���_
		Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--�r��P����1�O���
		Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--�r��P����3�O���_
		
		SetPlot( BallA , "range" , "sasa_107340_holeAI_E" , 50 )
		
		local lucky = DW_rand(6)										--����X�諸���s
		Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
		Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
		table.remove( Set , lucky )										--�襤�����s�qtable����
		
		for i = 1 , 5 do
			Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--��L���s�]�w�|�z��
			Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
			--table.remove( ScriptSet , num )
			sleep(1)
		end

		while 1 do
			sleep(10)
			if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
				counter = counter + 1
				if counter >= 7 then
					if mobcount < 12 then
						mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--�ͩǳ�
						counter = 0
						mobcount = mobcount + 1
					end
				end
			else
				mobcount = 0
				counter = 0
				mob = {}
			end
		end
	end
end

function sasa_149_holethemonster_2_E()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )		----Ū�b���@�h
	local counter = 0
	local mobcount = 0
	local mob = {}
	local DemonID = 107401	--�ǳ�
	--local R = math.random(3)
	--local Touchflag = (PID-1)*8
	local BallA = CreateObjByFlag( 107340 , 780858 , 9 , 1 )	--���ܲy
	SetModeEx( BallA , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
	SetModeEx( BallA , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
	SetModeEx( BallA , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
	SetModeEx( BallA , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( BallA , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( BallA , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( BallA , EM_SetModeType_Move , false )			--����
	SetModeEx( BallA , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( BallA , EM_SetModeType_Strikback , false )		--����
	SetModeEx( BallA , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( BallA , Room )
	
	local Crack = CreateObjByFlag( 107343 , 780858 , 10 , 1 )	--���_
	SetModeEx( Crack , EM_SetModeType_SearchenemyIgnore , true )--���󤣷|�Q�j�M
	SetModeEx( Crack , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
	SetModeEx( Crack , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
	SetModeEx( Crack , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( Crack , EM_SetModeType_Mark , false )			--�аO
	SetModeEx( Crack , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( Crack , EM_SetModeType_Move , false )			--����
	SetModeEx( Crack , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Crack , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Crack , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( Crack , Room )
	
	local Touch01 = CreateObjByFlag( 114340 , 780858 , 11 , 1 )
	SetModeEx( Touch01 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch01 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch01 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch01 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch01 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch01 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch01 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch01 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch01 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch01 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch01 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch01 , Room )
	local Touch02 = CreateObjByFlag( 114340 , 780858 , 12 , 1 )
	SetModeEx( Touch02 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch02 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch02 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch02 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch02 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch02 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch02 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch02 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch02 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch02 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch02 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch02 , Room )
	local Touch03 = CreateObjByFlag( 114340 , 780858 , 13 , 1 )
	SetModeEx( Touch03 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch03 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch03 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch03 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch03 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch03 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch03 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch03 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch03 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch03 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch03 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch03 , Room )
	local Touch04 = CreateObjByFlag( 114340 , 780858 , 14 , 1 )
	SetModeEx( Touch04 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch04 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch04 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch04 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch04 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch04 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch04 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch04 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch04 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch04 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch04 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch04 , Room )
	local Touch05 = CreateObjByFlag( 114340 , 780858 , 15 , 1 )
	SetModeEx( Touch05 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch05 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch05 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch05 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch05 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch05 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch05 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch05 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch05 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch05 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch05 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch05 , Room )
	local Touch06 = CreateObjByFlag( 114340 , 780858 , 16 , 1 )
	SetModeEx( Touch06 , EM_SetModeType_SearchenemyIgnore , true )---���󤣷|�Q�j�M
	SetModeEx( Touch06 , EM_SetModeType_HideName , true )  		---�����Y�W�O�_��ܦW��
	SetModeEx( Touch06 , EM_SetModeType_HideMinimap , true )	---����O�_�b�p�a�ϤW���
	SetModeEx( Touch06 , EM_SetModeType_Searchenemy , false )   --����
	SetModeEx( Touch06 , EM_SetModeType_Mark , true )			--�аO
	SetModeEx( Touch06 , EM_SetModeType_Fight , false ) 		--���
	SetModeEx( Touch06 , EM_SetModeType_Move , false )			--����
	SetModeEx( Touch06 , EM_SetModeType_ShowRoleHead , false )
	SetModeEx( Touch06 , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Touch06 , EM_SetModeType_Show , true )			--�q�X
	SetModeEx( Touch06 , EM_SetModeType_NotShowHPMP , false )		--��show���
	AddToPartition( Touch06 , Room )
	local Set = { Touch01 , Touch02 , Touch03 , Touch04 , Touch05 , Touch06 }
	local ScriptSet = { "sasa_107340_TouchAI01" , "sasa_107340_TouchAI02" }
	
	Writerolevalue( OwnerID() , EM_RoleValue_register2 , BallA )	--�����2�O�r��P��
	Writerolevalue( OwnerID() , EM_RoleValue_register3 , Crack )	--�����3�O���_
	Writerolevalue( BallA , EM_RoleValue_register1 , OwnerID() )	--�r��P����1�O���
	Writerolevalue( BallA , EM_RoleValue_register3 , Crack )		--�r��P����3�O���_
	
	SetPlot( BallA , "range" , "sasa_107340_holeAI_E" , 50 )
	
	local lucky = DW_rand(6)										--����X�諸���s
	Setplot( Set[lucky] , "touch" , ScriptSet[1] , 30 )
	Writerolevalue( Set[lucky] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
	table.remove( Set , lucky )										--�襤�����s�qtable����
	
	for i = 1 , 5 do
		Setplot( Set[i] , "touch" , ScriptSet[2] , 30 )				--��L���s�]�w�|�z��
		Writerolevalue( Set[i] , EM_RoleValue_register3 , Crack )	--���_id�g�i���s��
		--table.remove( ScriptSet , num )
		sleep(1)
	end

	while 1 do
		sleep(10)
		if ReadRoleValue ( Crack , EM_RoleValue_register10 ) == 1 then
			counter = counter + 1
			if counter >= 10 then
				if mobcount < 12 then
					mob[table.getn(mob)+1] = star_CreateObj( Crack , DemonID , 0 , 0 , 0 , Room , 0 )	--�ͩǳ�
					counter = 0
					mobcount = mobcount + 1
				end
			end
		else
			mobcount = 0
			counter = 0
			mob = {}
		end
	end
end

function sasa_107340_holeAI_E()
	local Ball = TargetID()
	local RoomID = ReadRoleValue ( Ball , EM_RoleValue_RoomID )
	local Crack = ReadRoleValue ( Ball , EM_RoleValue_register3 )
	local Mons = star_CreateObj( Crack , 107400 , 0 , 0 , 0 , RoomID , 0)
	AddToPartition( Mons , RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER06]" , 2 )
		--�e���M�X�{�_�S�����H�A�O���_�I�����_�K
		sleep ( 20 )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_ZONE149_MONSTER07]" , 2 )
		--�Ǫ����q���_��X�A�Ө�Ǫ�������G�O����I
		Writerolevalue( Crack , EM_RoleValue_register10 , 1 )
		sleep ( 10 )
		--DelObj ( Ball )
		Hide ( Ball )
	end
end