-- ���бN���禡(  Z25_3_Center   )���b�������W   Z25_3_Center

--  �T���ж��e�y��/GM ? Zone 151 0 -2919 3126.9 491.6
--  flag�s����781046
-- PID 4~9 �������}�ԫe, �i�樵�޼@���ɷ|�����I
-- PID 1      ��Zone�}�ҫ�, ���@�}�l�Q�гy�X�Ӫ��I, �H�����Ѥ������_�c�X�{���I
-- PID 2      ��Zone�}�ҫ�, �T���q�������I
-- PID 30    ���԰��}�l��, ����a�k���ж������ת�

function Z25_3_setDoorState( obj ) -- ���M��, ���,����
	SetModeEx( obj , EM_SetModeType_Mark, false)										
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, false) 								
	SetModeEx( obj , EM_SetModeType_Obstruct, true) 									
	SetModeEx( obj , EM_SetModeType_Strikback, false) 									
	SetModeEx( obj , EM_SetModeType_Move, false) 									
	SetModeEx( obj , EM_SetModeType_Fight, false) 										
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore, false)							
	SetModeEx( obj , EM_SetModeType_Searchenemy, false)
	SetModeEx( obj , EM_SetModeType_NotShowHPMP, true) 
end	

function Z25_3_setHideState( obj ) -- �z���y�M��(���i���)
	SetModeEx( obj  , EM_SetModeType_Mark, false )
	SetModeEx( obj , EM_SetModeType_Obstruct, false) 
	SetModeEx( obj  , EM_SetModeType_HideName, true )
	SetModeEx( obj  , EM_SetModeType_ShowRoleHead, false )
	SetModeEx( obj  , EM_SetModeType_Move, false )
	SetModeEx( obj , EM_SetModeType_Fight, false) 
	SetModeEx( obj  , EM_SetModeType_Searchenemy, false )
	SetModeEx( obj  , EM_SetModeType_Strikback, false )	
end	

function Z25_3_setTreasureState( obj ) -- �_�c�M��, ���, �i�I, ����
	SetModeEx( obj , EM_SetModeType_Mark, true)			
	SetModeEx( obj , EM_SetModeType_ShowRoleHead, true) 		
	SetModeEx( obj , EM_SetModeType_Obstruct, true) 			
	SetModeEx( obj , EM_SetModeType_Strikback, false) 
	SetModeEx( obj , EM_SetModeType_Move, false) 	
	SetModeEx( obj , EM_SetModeType_Fight, false) 
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore, false) 	
	SetModeEx( obj , EM_SetModeType_Searchenemy, false)				
	SetModeEx( obj , EM_SetModeType_NotShowHPMP, true) 
	SetModeEx( obj , EM_SetModeType_HideName, false) 
end

function Z25_3_Center()  												
	local center = OwnerID();	-- center
	local ZoneID = ReadRoleValue ( center, EM_RoleValue_ZoneID )
	local RoomID  = ReadRoleValue ( center, EM_RoleValue_RoomID )

	local BossOrgID, TreasureOrgID;		
	local flagID=781046	-- flag PID (30, �O�i�Ӫ���)(2, �O�q������)				
	local doorID=105078	-- ���ת�ID				

	if ZoneID == 151 then
		BossOrgID=106444	
		TreasureOrgID = 106201
	elseif ZoneID == 152 then
		BossOrgID=107591	
		TreasureOrgID = 107590
	elseif ZoneID == 153 then
		BossOrgID=107606		
		TreasureOrgID = 107607
	elseif ZoneID == 953 then
		BossOrgID=107606	
		TreasureOrgID = 106201
	end			

	-- �q���� ��l�� -- 	
	local nextDoor = CreateObjByFlag( doorID, flagID, 2, 1 ); 	--�n���ͪ�����ID, �ھڭ��@�ӺX�l���ͪ���, �X�lPID, ���ͪ�����q
	Z25_3_setDoorState( nextDoor );
	
	-- Boss ��l�� -- 
	local Boss = CreateObjByFlag( BossOrgID, flagID, 1, 1 );		--�n���ͪ�����ID, �ھڭ��@�ӺX�l���ͪ���, �X�lPID, ���ͪ�����q
	MoveToFlagEnabled( Boss, false );
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false); 	-- �kQ���w������
	
	local isChallengeSuccess;	-- �P�_���O�_�Q����	
	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;	-- �P�_�O�_�D�Ԧ��\	
	WriteRoleValue( Boss, Boss_Regs_ChallengeSuccess, 0 );	-- 1���D�Ԧ��\, 0�h�_

	-- ��i�h --
	AddToPartition( nextDoor, RoomID );
	AddToPartition( Boss, RoomID );
	
	-- ��l��Boss���޼@�� --	
	local isBossAlive; 		-- �P�_���O�_�s��
	local isResetDrama;		-- �P�_���O�_���m���޼@��
	local startPID, endPID = 4, 9;	-- ���޺X�l��4~9
	local nowPID = startPID;		
	local flag_X, flag_Y, flag_Z;
	local now_X, now_Y, now_Z;	

	local Boss_Regs_DramaFlag = EM_RoleValue_Register9;	-- ���޼@�����X�мȦs���s��
	WriteRoleValue( Boss, Boss_Regs_DramaFlag, 0 );		-- 1���i�歫�m���޼@��, 0�h�_(�Y�w�b���ޤ�)
	
	flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
	flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
	flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );	
	
	flag_Y = GetHeight( flag_X, flag_Y, flag_Z );				
	MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				
	-- �������}�l�P�_�O�_�n���m����, �ε��_�c --	
	while true do
		isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );	
		isBossAlive = CheckID( Boss );
		if ( isChallengeSuccess == 1 ) or ( isBossAlive == 0 ) then 		-- �u�n�D�Ԧ��\ �� ���Q�R��, �N�}��&���_�c
			DebugMsg( 0,0,"Show Treasure");		
			-- �}�� --
			DelObj( nextDoor );			

			-- �o�_�c --
			local Treasure = CreateObjByFlag( TreasureOrgID, flagID, 1, 1 );	--�n���ͪ�����ID, �ھڭ��@�ӺX�l���ͪ���, �X�lPID, ���ͪ�����q
			Z25_3_setTreasureState( Treasure );
			AddToPartition( Treasure, RoomID );
			
			break;
		else	-- ���D�Ԧ��\
			if ( HateListCount(Boss) == 0 ) then	-- �B�����b�԰��� 
				isResetDrama = ReadRoleValue( Boss, Boss_Regs_DramaFlag );
				if ( isResetDrama == 1 ) then	-- �����ޤ�
					WriteRoleValue( Boss, Boss_Regs_DramaFlag, 0 );	-- 1���i�歫�m���޼@��, 0�h�_(�Y�w�b���ޤ�)
					nowPID = startPID;
					flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
					flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
					flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );	
	
					flag_Y = GetHeight( flag_X, flag_Y, flag_Z );				
					MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				end	
					
				now_X = ReadRoleValue( Boss, EM_RoleValue_X );
				now_Z = ReadRoleValue( Boss, EM_RoleValue_Z );
	
				if ( math.abs(now_X-flag_X) < 1 ) and ( math.abs(now_Z-flag_Z) < 1) then	-- �p�G����w�I�~�i��U�@�Ӳ���(�p�G�y�Ц��~�i��|��bug)
					nowPID = nowPID + 1;
					if ( nowPID > endPID ) then
						nowPID = startPID;
					end
					flag_X = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_X );
					flag_Y = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Y );
					flag_Z = GetMoveFlagValue( flagID, nowPID, EM_RoleValue_Z );
	
					flag_Y = GetHeight( flag_X, flag_Y, flag_Z );
					MoveDirect( Boss, flag_X, flag_Y, flag_Z );
				end		
			end
			Sleep(10);
		end
	end
	DebugMsg(0,0,"center end");		
end 

function Z25_3_Boss_CombatMain()
	DebugMsg(0,0,"Combat start");

	local Boss = OwnerID();
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );	
	BeginPlot( Boss, "Cl_Resist_HackersFightBegin", 0 );	--  �Ұʨ��b��
	StopMove( Boss, false );
	
	-- ����, �i�J�ж����� --
	local flagID=781046	-- flag PID (30, �O�i�Ӫ���)(2, �O�q������)
	local doorID=105078	-- ���ת�ID	
	local frontDoor = CreateObjByFlag( doorID, flagID, 30, 1 );
	Z25_3_setDoorState( frontDoor );	
	AddToPartition( frontDoor, RoomID );
	CallPlot( frontDoor, "Z25_3_TokenRule", Boss);
		
	-- �԰���l�� --
	AddBuff(Boss,502707,0,-1);--����۰ʦ^��			
	local Boss_HP_Rate20 = Math.floor( (ReadRoleValue( Boss, EM_RoleValue_MaxHP )) * 0.2 ) + 1;	-- �[1, �b���W���a�ݨ쪺%�Ƥ~�|�O20%
	LockHP( Boss, Boss_HP_Rate20, "Z25_3_ChallengeSuccess" );	-- 20%��q�@��[�D�Ԧ��\]
		
	BeginPlot(Boss,"Z25_3_Boss_AI",0);
end
	
function Z25_3_Boss_AI()
	local Boss = OwnerID();
	local ZoneID = ReadRoleValue( Boss, EM_RoleValue_ZoneID );	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );	
		
	local StartTime = GetSysTime( 0 );
	local NowTime = StartTime;

	local Group_1_PrecastTime = StartTime;
	local Group_2_PrecastTime = StartTime;
	local Group_3_PrecastTime = StartTime;
	local Group_4_PrecastTime = StartTime;	
			
	WriteRoleValue( Boss, EM_RoleValue_Register1, Group_1_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register2, Group_2_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register3, Group_3_PrecastTime );
	WriteRoleValue( Boss, EM_RoleValue_Register4, Group_4_PrecastTime );	

	-- �N�o�ɶ� --				
	local Group_1_ColdDown = 19;	-- �P�R�B�M
	local Group_2_ColdDown = 15;	-- ��������
	local Group_3_ColdDown = 9;	-- �X������
	local Group_4_ColdDown = 4;	-- �ԷN�����B���N����

	-- ���ۮɶ� --
	local Skill_1_SpellTime = 0;	-- �P�R�B�M
	local Skill_2_SpellTime = 3;	-- ��������
	local Skill_3_SpellTime = 2;	-- �X������
	local Skill_4_SpellTime = 2;	-- �ԷN�����B���N����

	-- �ޯ��C�� --			
	local _LOCK, _UNLOCK = 1, 0;		-- ���I��ޯ�e,���A�[�J�ޯ�ܥi�I�񤧦�C
	local Group_1_Lock = _UNLOCK ;
	local Group_2_Lock = _UNLOCK ;
	local Group_3_Lock = _UNLOCK ;	
	local Group_4_Lock = _UNLOCK ;	

	-- �ޯ൥�� --
	local Skill_1_LV, Skill_2_LV;
	if ( ZoneID == 151 ) then
		Skill_1_LV = 11;
		Skill_2_LV = 49;
	elseif ( ZoneID == 152 ) then
		Skill_1_LV = 14;
		Skill_2_LV = 69;
	elseif ( ZoneID == 153 ) then
		Skill_1_LV = 9;
		Skill_2_LV = 9;
	elseif ( ZoneID == 953 ) then
		Skill_1_LV = 11;
		Skill_2_LV = 49;
	end
							
	local CastList = {};
	local isCasting = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );

	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;	
	local isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );	-- �P�_�O�_�D�Ԧ��\, �Y�D�ԥ��ѫh�ǳƭ��m���޼@��
	
  	-- �W�߾���, ����F���Y�j����� --
  	-- �g�� --
  	local inFury = false;		-- �P�w�O�_�g�ɤ�
	local Boss_Fury_Time = 480;	-- 8�����g��
	
	local BossNowHP;
	local BossMaxHP = ReadRoleValue( Boss, EM_RoleValue_MaxHP );
	-- �P�R�B�M(�C10%�I��) --
	local toCast_HPRate = 90;	-- �i�I�񪺪��e(�q90%�}�l)
	local endCheck_HPRate = 22;	-- ����I�񪺪��e(20%����, �B���o��)
	local HP_Rate_Step = 10; 	-- �C���o�ʪ����Z���e(10%��q)
	local CastGateHP = Math.ceil( BossMaxHP * (toCast_HPRate+1)/100 );	-- ���j, (�[1, �b���W���a�ݨ쪺%�Ƥ~�|�O90%)

	-- Boss AI �}�l --	
	ScriptMessage( Boss, -1, 2, "[SC_106444_01]", 0 ); -- �i�J�԰�, �����n [ �u�n�O�ڬݤ����F��A�ֳ��O�Q�ܨ��I]
		
	while ( isChallengeSuccess == 0 ) and ( HateListCount(Boss) ~= 0 ) do
  		Sleep(10);
  		isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );
  		NowTime = GetSysTime(0);
  		
  		-- �W�߾���, ����F���Y�j����� --
  		-- �g�� --
  		if ( inFury == false ) and ( NowTime - StartTime) > Boss_Fury_Time then
  			DebugMsg(0,0,"Boss fury");  	
			ScriptMessage( Boss, -1, 2, "[SC_106444_04]", 0 )			
			AddBuff( Boss, 623851, 0 ,-1 );	-- �g��
			inFury = true;
  		end
  		-- �P�R�B�M --  			
  		if ( toCast_HPRate > endCheck_HPRate ) then	-- �p�G���쵲�����e, �~�}�l�P�_
  			BossNowHP = ReadRoleValue( Boss, EM_RoleValue_HP );  
    			if ( BossNowHP <= CastGateHP ) then	-- �p�GBoss�{����q�p��, �U�@���I��[�P�R�B�M]�����q��q
  				DebugMsg(0,0,"Boss HPRate: "..toCast_HPRate );
  				ScriptMessage( Boss, -1, 2, "[SC_106444_05]", 0 ); -- �I��ޯ�,�P�R�B�M[ �p�ߤ��n������I]
  				CallPlot( Boss, "Z25_3_Boss_Extra_CastSkill_1", Boss, NowTime, Skill_1_SpellTime, Skill_1_LV );	-- [�W�٤��P]��[�\��ۦP], �u�O���F���n��plot���d

    				toCast_HPRate = toCast_HPRate - HP_Rate_Step;	-- ���U�@�Ӫ��e
  				CastGateHP = Math.ceil( BossMaxHP * (toCast_HPRate+1)/100 );	
  			end   	
  		end	
  										
		Group_1_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register1 );
		Group_2_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register2 );
		Group_3_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register3 );	
		Group_4_PrecastTime = ReadRoleValue( Boss, EM_RoleValue_Register4 );	
					
	     	 if ( NowTime - Group_1_PrecastTime ) > ( Group_1_ColdDown ) and ( Group_1_Lock == _UNLOCK ) then	-- �p�G�N�o�ɶ�OK�A�B�o�ۤw���b�I��C��
	     		Group_1_Lock = _LOCK;
	     		table.insert( CastList, "skiil_1" );	-- �P�R�B�M		
	     	end	 
	     	 if ( NowTime - Group_2_PrecastTime ) > ( Group_2_ColdDown ) and ( Group_2_Lock == _UNLOCK ) then
	     		Group_2_Lock = _LOCK;
	     		table.insert( CastList, "skiil_2" );	-- ��������
	     	end
		 if ( NowTime - Group_3_PrecastTime ) > ( Group_3_ColdDown ) and ( Group_3_Lock == _UNLOCK ) then
			Group_3_Lock = _LOCK;
			table.insert( CastList, "skiil_3" );	-- �X������	
	 	end	 
	   	 if ( NowTime - Group_4_PrecastTime ) > ( Group_4_ColdDown ) and ( Group_4_Lock == _UNLOCK ) then
	   		Group_4_Lock = _LOCK;
	   		table.insert( CastList, "skiil_4" );	-- �ԷN�����B���N����		
	   	end
  	 		 		 		 	
  	 	isCasting = ReadRoleValue( Boss, EM_RoleValue_SpellMagicID );
  	 	if ( #CastList ~= 0 ) and ( isCasting == 0 ) then	-- �p�G�I��C�����i�I�񪺪k�N�A�B�{�b�L�I�����k�N�A�~�h�I��@�ӷs���k�N  
  	 		table.sort(CastList);	-- �j�۩��e��
  	 			 	
  	 		if ( CastList[1] == "skiil_1" ) then	-- �ޯ�[�P�R�B�M]
  	 			Group_1_Lock = _UNLOCK;  
  	 			ScriptMessage( Boss, -1, 2, "[SC_106444_05]", 0 ); -- [ �p�ߤ��n������I]											
  				CallPlot( Boss, "Z25_3_Boss_CastSkill_1", Boss, NowTime, Skill_1_SpellTime, Skill_1_LV );
  			elseif ( CastList[1] == "skiil_2" ) then	-- �ޯ�[��������]
  				Group_2_Lock = _UNLOCK;
  				ScriptMessage( Boss, -1, 2, "[SC_106444_06]", 0 ); -- [ �N���ڬݬݧA�̥i�H���h�[�I]	
  				CallPlot( Boss, "Z25_3_Boss_CastSkill_2", Boss, NowTime, Skill_2_SpellTime, Skill_2_LV );
  			elseif ( CastList[1] == "skiil_3" ) then	-- �ޯ�[�X������]
    				Group_3_Lock = _UNLOCK;
    				CallPlot( Boss, "Z25_3_Boss_CastSkill_3", Boss, NowTime, Skill_3_SpellTime );		
 			elseif ( CastList[1] == "skiil_4" ) then	-- �ޯ�[�ԷN����][���N����]
 	 			Group_4_Lock = _UNLOCK;				
 				CallPlot( Boss, "Z25_3_Boss_CastSkill_4", Boss, NowTime, Skill_4_SpellTime );
  			end
  			table.remove( CastList, 1 );
  		 end
	end


	-- �D�ԥ��ѧY���mBoss --		
	isChallengeSuccess = ReadRoleValue( Boss, Boss_Regs_ChallengeSuccess );
	if ( isChallengeSuccess == 0 ) then	-- �D�ԥ��ѭ��mBoss
		DebugMsg(0,0,"Challenge Fail");
		DebugMsg(0,0,"reset Boss");
		
 		ScriptMessage( Boss, -1, 2, "[SC_106444_02]", 0 ); -- �D�ԥ���, �����m�� [ �o���I�O�q�ڥ��N���O�ڪ����C]
 		Sleep(10);
		
		local Boss_Regs_DramaFlag = EM_RoleValue_Register9;	-- ���޼@�����X�мȦs���s��
		WriteRoleValue( Boss, Boss_Regs_DramaFlag, 1 );		-- 1���i�歫�m���޼@��, 0�h�_(�Y�w�b���ޤ�)
		WriteRoleValue( Boss , EM_RoleValue_IsWalk, 1 );		-- �����l�����A
		SetModeEx( Boss , EM_SetModeType_Searchenemy, false);  	-- �kQ���w������
		MoveToFlagEnabled( Boss, false );			
	end
	
	DebugMsg(0,0,"Boss AI end");	
end

function Z25_3_Boss_Extra_CastSkill_1( Boss, castTime, spellTime, Skill_1_LV )-- �P�R�B�M(�̦�q�I��) [�W�٤��P]��[�\��ۦP], �u�O���F���n��plot���d	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 106200;
	
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );
	local x1, y1, z1;	-- ��1�����ΥؼХ�
	local x2, y2, z2;	-- ��2�����ΥؼХ�
	
	if ( #allPly > 1 ) then	-- �p�G����Ӫ��a�H�W, �~��X�t�@�ӥؼ�
		-- �гy���Τ�, �I��ޯ�� --
		-- ��1�ӥؼ�--
		local tar_1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar_1_randIdx ];
		table.remove( allPly, tar_1_randIdx );
				
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
				
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );

		-- ��2�ӥؼ�--				
		local tar2_randIdx = Rand(#allPly)+1;
		local tar2 = allPly[ tar2_randIdx ];
		
		x2 = ReadRoleValue( tar2, EM_RoleValue_X );
		y2 = ReadRoleValue( tar2, EM_RoleValue_Y );
		z2 = ReadRoleValue( tar2, EM_RoleValue_Z );	
		y2 = GetHeight( x2, y2, z2 );
				
		local invisibleObj2 = CreateObj( InvisibleObjID, x2, y2, z2, 0, 1 );
		Z25_3_setHideState( invisibleObj2 );

		-- ��J&�W���I�S�� --				
		AddToPartition( invisibleObj1, RoomID );		
		AddToPartition( invisibleObj2, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		CallPlot( invisibleObj2, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- ���I�S��buff
		AddBuff( invisibleObj2, 623994, 0, -1 );	
		
		-- �I��ޯ� -- 	
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- �g�J�ޯ�1, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_

		Sleep(30);
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- �����Υؼ�1����m, �I��P�R�B�M	
		CastSpellPos( invisibleObj2, x2, y2, z2, 850089, Skill_1_LV );		-- �����Υؼ�2����m, �I��P�R�B�M	
		CancelBuff( invisibleObj1, 623994 );	-- �Ѱ����I�S��buff
		CancelBuff( invisibleObj2, 623994 );	-- �Ѱ����I�S��buff
		
		Sleep(20);		
		DelObj( invisibleObj1 );	
		DelObj( invisibleObj2 );
	else
		-- �гy���Τ�, �I��ޯ�� --
		-- ��1�ӥؼ�--
		local tar1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar1_randIdx ];
		
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
		
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );
		
		-- ��J&�W���I�S�� --		
		AddToPartition( invisibleObj1, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- ���I�S��buff
		
		-- �I��ޯ� -- 		
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- �g�J�ޯ�1, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_

		Sleep(30);	
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- �����Υؼ�1����m, �I��P�R�B�M

		CancelBuff( invisibleObj1, 623994 );	-- �Ѱ����I�S��buff
		Sleep(20);		
		DelObj( invisibleObj1 );	
	end
end
function Z25_3_Boss_CastSkill_1( Boss, castTime, spellTime, Skill_1_LV  )	-- �P�R�B�M	
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 106200;
	
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );
	local x1, y1, z1;	-- ��1�����ΥؼХ�
	local x2, y2, z2;	-- ��2�����ΥؼХ�
	
	if ( #allPly > 1 ) then	-- �p�G����Ӫ��a�H�W, �~��X�t�@�ӥؼ�
		-- �гy���Τ�, �I��ޯ�� --
		-- ��1�ӥؼ�--
		local tar_1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar_1_randIdx ];
		table.remove( allPly, tar_1_randIdx );
				
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
				
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );

		-- ��2�ӥؼ�--				
		local tar2_randIdx = Rand(#allPly)+1;
		local tar2 = allPly[ tar2_randIdx ];
		
		x2 = ReadRoleValue( tar2, EM_RoleValue_X );
		y2 = ReadRoleValue( tar2, EM_RoleValue_Y );
		z2 = ReadRoleValue( tar2, EM_RoleValue_Z );	
		y2 = GetHeight( x2, y2, z2 );
				
		local invisibleObj2 = CreateObj( InvisibleObjID, x2, y2, z2, 0, 1 );
		Z25_3_setHideState( invisibleObj2 );

		-- ��J&�W���I�S�� --				
		AddToPartition( invisibleObj1, RoomID );		
		AddToPartition( invisibleObj2, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		CallPlot( invisibleObj2, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- ���I�S��buff
		AddBuff( invisibleObj2, 623994, 0, -1 );	
		
		-- �I��ޯ� -- 	
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- �g�J�ޯ�1, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_

		Sleep(30);
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- �����Υؼ�1����m, �I��P�R�B�M	
		CastSpellPos( invisibleObj2, x2, y2, z2, 850089, Skill_1_LV );		-- �����Υؼ�2����m, �I��P�R�B�M	
		CancelBuff( invisibleObj1, 623994 );	-- �Ѱ����I�S��buff
		CancelBuff( invisibleObj2, 623994 );	-- �Ѱ����I�S��buff
		
		Sleep(20);		
		DelObj( invisibleObj1 );	
		DelObj( invisibleObj2 );
	else
		-- �гy���Τ�, �I��ޯ�� --
		-- ��1�ӥؼ�--
		local tar1_randIdx = Rand(#allPly)+1;
		local tar1 = allPly[ tar1_randIdx ];
		
		x1 = ReadRoleValue( tar1, EM_RoleValue_X );
		y1 = ReadRoleValue( tar1, EM_RoleValue_Y );
		z1 = ReadRoleValue( tar1, EM_RoleValue_Z );		
		y1 = GetHeight( x1, y1, z1 );
		
		local invisibleObj1 = CreateObj( InvisibleObjID, x1, y1, z1, 0, 1 );
		Z25_3_setHideState( invisibleObj1 );
		
		-- ��J&�W���I�S�� --		
		AddToPartition( invisibleObj1, RoomID );
		CallPlot( invisibleObj1, "Z25_3_TokenRule", Boss );
		AddBuff( invisibleObj1, 623994, 0, -1 );	-- ���I�S��buff
		
		-- �I��ޯ� -- 		
		WriteRoleValue( Boss, EM_RoleValue_Register1, (castTime+spellTime) );		-- �g�J�ޯ�1, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_

		Sleep(30);	
		CastSpellPos( invisibleObj1, x1, y1, z1, 850089, Skill_1_LV );		-- �����Υؼ�1����m, �I��P�R�B�M

		CancelBuff( invisibleObj1, 623994 );	-- �Ѱ����I�S��buff
		Sleep(20);		
		DelObj( invisibleObj1 );	
	end
end
function Z25_3_Boss_CastSkill_2( Boss, castTime, spellTime, Skill_2_LV  )	-- ��������
  	WriteRoleValue( Boss, EM_RoleValue_Register2, (castTime+spellTime) );	-- �g�J�ޯ�2, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_
  	CastSpellLV( Boss, Boss, 850088, Skill_2_LV );
end

function Z25_3_Boss_CastSkill_3( Boss, castTime, spellTime  )		-- �X������
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local InvisibleObjID = 107673;
	
  	local x0 = ReadRoleValue( Boss, EM_RoleValue_X );
    	local y0 = ReadRoleValue( Boss, EM_RoleValue_Y );
      	local z0 = ReadRoleValue( Boss, EM_RoleValue_Z );
      	y0 = GetHeight( x0, y0, z0 );
      	
  	
      	local InvisibleObj = CreateObj( InvisibleObjID, x0, y0, z0, 0, 1 );
      	Z25_3_setHideState( InvisibleObj );      	
      	AddToPartition( InvisibleObj, RoomID );
  
  	WriteRoleValue( InvisibleObj, EM_RoleValue_LiveTime, 5 );
  	CallPlot( InvisibleObj, "Z25_3_TokenRule", Boss );  	
  	
  	WriteRoleValue( Boss, EM_RoleValue_Register3, (castTime+spellTime) );	-- �g�J�ޯ�3, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_    
  	
  	local dir = ReadRoleValue( Boss, EM_RoleValue_Dir );	
  	CastSpellLV( Boss, InvisibleObj, 850740, 0 );  	-- �X�������¯S��(�I�񵲧��|Ĳ�o�ˮ`�k�N)  
      	local x = ReadRoleValue( Boss, EM_RoleValue_X );
      	local z = ReadRoleValue( Boss, EM_RoleValue_Z );	
      	
      	local rad = math.rad( dir );
      	local dis = 100;	-- �k�N�Z��
      	x = x0 + ( math.cos(rad) * dis );	
            	z = z0 - ( math.sin(rad) * dis );
            	
	SetPos( InvisibleObj, x, y0, z, 0 );
end
		
function Z25_3_Boss_CastSkill_4( Boss, castTime, spellTime )		-- �ԷN�����B���N����
	local allPly = Z25_3_Func_SearchRangePly( Boss, 1000 );

	-- ��X�n�I���H���ؼ� --
	local tar1_randIdx = Rand(#allPly) + 1;
	local tar1 = allPly[ tar1_randIdx ];
	local tar2 = nil;
	if ( #allPly > 1 ) then	-- �p�G����Ӫ��a�H�W, �~��X�t�@�ӥؼ�
		table.remove( allPly, tar1_randIdx );
		local tar2_randIdx = Rand(#allPly)+1;
		tar2 = allPly[ tar2_randIdx ];						
	end

	-- �гy�@�����Τ� --
	local RoomID = ReadRoleValue( Boss, EM_RoleValue_RoomID );
	local ZoneID = ReadRoleValue( Boss, EM_RoleValue_ZoneID );
	local FakeBossID;
	if ( ZoneID == 151 ) then	-- �ޯ�j�װѷӤ����ƭ�(�ҥH�n��ZONE)
		FakeBossID = 106200;
	elseif ( ZoneID == 152 ) then
		FakeBossID = 107676;
	elseif ( ZoneID == 153 ) then
		FakeBossID = 107678;
	elseif ( ZoneID == 953 ) then
		FakeBossID = 106200;
	end

	local x, y, z;		
	x = ReadRoleValue( Boss, EM_RoleValue_X );
	y = ReadRoleValue( Boss, EM_RoleValue_Y );
	z = ReadRoleValue( Boss, EM_RoleValue_Z );
	y = GetHeight( x, y, z );	
	
	local FakeBoss = CreateObj( FakeBossID, x, y, z, 0, 1 );
	Z25_3_setHideState( FakeBoss );
	AddToPartition( FakeBoss, RoomID );
	
	WriteRoleValue( FakeBoss, EM_RoleValue_LiveTime, 5 );	-- 5���۱�		
	CallPlot( FakeBoss, "Z25_3_TokenRule", Boss );		-- �Y���w���s�b, �]�۱�
	
	-- �I��ޯ� --		
	WriteRoleValue( Boss, EM_RoleValue_Register4, (castTime+spellTime) );	-- �g�J�ޯ�4, (�I��k�N���ɶ�+���ۮɶ�), �ΨӰ��U�@���I�k�ɶ����P�_
	if ( tar2 ~= nil ) then	-- ��ӥؼХH�W, �藍�P�ؼЬI��
		CastSpellLv( Boss, tar1, 850086, 0 );	
		CastSpellLv( FakeBoss, tar2, 850090, 0 );			
	else			-- �u�Ѥ@�ӥؼ�, ��P�@�ؼЬI��
		CastSpellLv( Boss, tar1, 850086, 0 );	
		CastSpellLv( FakeBoss, tar1, 850090, 0 );	
	end
end

function Z25_3_ChallengeSuccess()
	local Boss = OwnerID();
	LockHP( Boss, -1000, "" ); 	
		
	DebugMsg(0,0,"ChallengeSuccess");
	
	local Boss_Regs_ChallengeSuccess = EM_RoleValue_Register8;
	WriteRoleValue( Boss, Boss_Regs_ChallengeSuccess, 1 );--�Хܪ��a�D�Ԧ��\
	
	
	SetModeEx( Boss , EM_SetModeType_Strikback, false );		-- ������
	SetModeEx( Boss , EM_SetModeType_Searchenemy, false ); 	-- ������		
	SetModeEx( Boss , EM_SetModeType_Fight, false );		-- ���i���
	
	MagicInterrupt( Boss);
	SetStopAttack( Boss );
	AddBuff( Boss, 624097, 0 , -1 );	--���		
	
	CallPlot( Boss, "Z25_3_Drama_BossEscape", Boss );	
	DebugMsg(0,0,"end ChallengeSuccess");
end
function Z25_3_Drama_BossEscape( Boss )
	DebugMsg(0,0,"Drama_BossEscape");		
	sleep(20)
	--say(Boss,"123")
	ScriptMessage( Boss, -1, 2, "[SC_106444_03]", 0 ); -- �D�Ԧ��\ ���k�]�� [ �V�b�I�U���ڤ��|���A�̳o��n�L���I ]			
	Sleep(10);
		
	-- �k�]�ʧ@ --
	local flagID=781046	-- flag PID (30, �O�i�Ӫ���)(2, �O�q������)
	local PID = 2;
	local x = GetMoveFlagValue( flagID, PID, EM_RoleValue_X );
	local y = GetMoveFlagValue( flagID, PID, EM_RoleValue_Y );
	local z = GetMoveFlagValue( flagID, PID, EM_RoleValue_Z );	
	Sleep( MoveDirect( Boss, x, y, z ) );
	
	-- �N�����èñ��� --
	-- ���樾�b�Ⱦ��� --
	SetModeEx( Boss, EM_SetModeType_Show, false );
	Sleep(5);
	WriteRoleValue(Boss,EM_RoleValue_LiveTime,10);
	KillID(Boss,Boss);
	DebugMsg(0,0,"end Drama_BossEscape");
end

function Z25_3_Func_SearchRangePly( GItemID, range )	-- ��Ѧ�m[1]�}�l��J���, �B�̫ᤣ�|��J"-1"�o�ӭ�
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( GItemID,Range )
	local PlayerCount = 1
	
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsPlayer() then
			Ret[PlayerCount] = ID	
			PlayerCount = PlayerCount + 1;	
		end
	end	
	return Ret;
end
function Z25_3_TokenRule( Boss )--�l�ͪ��W�h�G���}�԰�����
	local Token=OwnerID();
	while true do
		if CheckID(Boss)==false or ReadRoleValue(Boss,EM_RoleValue_IsDead)==1 or HateListCount(Boss)==0 then
			DelObj(Token);
			return;
		end
		sleep(10);
	end
end