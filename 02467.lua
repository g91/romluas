------------------------------------------------------------------------
--�]�w����119178���ʬ��B��ʧ@�]��l�@���^
function William_119178_npc1()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --�аO
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --�x�s
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --���O	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --�����Y�W���W�٬O�_���
end
------------------------------------------------------------------------
--�]�w����119179���ʬ��B��ʧ@�]��l�@���^
function William_119179_npc2()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --�аO
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --�x�s
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --���O	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --�����Y�W���W�٬O�_���
end
------------------------------------------------------------------------
--�]�w����119355���ʬ��B��ʧ@�]��l�@���^
function William_119355_npc3()
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 0 )
	SetModeEx( OwnerID()  ,EM_SetModeType_Show , true ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --�аO
	SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --�x�s
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --���
	SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --���O	
	SetModeEx( OwnerID()  ,EM_SetModeType_Move , true ) --����
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	SetModeEx( OwnerID()  ,EM_SetModeType_HideName , false ) --�����Y�W���W�٬O�_���
end
------------------------------------------------------------------------
--���U���s��
function William_show424578_01()
	CloseSpeak( OwnerID() )
	DelObj ( TargetID() )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local controller1=CreateObjByFlag( 118119, 781009 , 0 , 1 ) --���ͪ�t���118119��781009-0                              
	local controller2= CreateObjByFlag( 119437, 781009 , 1 , 1 ) --���ͧP�_���119437��781009-1
	SetModeEx( controller1  ,EM_SetModeType_Show , false ) --���
	SetModeEx( controller1  ,EM_SetModeType_Searchenemy , false ) --����
	SetModeEx( controller1  ,EM_SetModeType_Mark , false ) --�аO
	SetModeEx( controller1  ,EM_SetModeType_Save , false ) --�x�s
	SetModeEx( controller1  ,EM_SetModeType_Strikback , false ) --����
	SetModeEx( controller1  ,EM_SetModeType_Fight , false ) --���
	SetModeEx( controller1  ,EM_SetModeType_Gravity , true ) --���O	
	SetModeEx( controller1  ,EM_SetModeType_Move , false ) --����
	SetModeEx( controller1  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	SetModeEx( controller1  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	SetModeEx( controller1  ,EM_SetModeType_HideName , true ) --�����Y�W���W�٬O�_��� 
	SetModeEx( controller2  ,EM_SetModeType_Show , false ) --���
	SetModeEx( controller2  ,EM_SetModeType_Searchenemy , false ) --����
	SetModeEx( controller2  ,EM_SetModeType_Mark , false ) --�аO
	SetModeEx( controller2  ,EM_SetModeType_Save , false ) --�x�s
	SetModeEx( controller2  ,EM_SetModeType_Strikback , false ) --����
	SetModeEx( controller2  ,EM_SetModeType_Fight , false ) --���
	SetModeEx( controller2  ,EM_SetModeType_Gravity , true ) --���O	
	SetModeEx( controller2  ,EM_SetModeType_Move , false ) --����
	SetModeEx( controller2  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	SetModeEx( controller2  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	SetModeEx( controller2  ,EM_SetModeType_HideName , true ) --�����Y�W���W�٬O�_��� 
	sleep(10)
	AddToPartition( controller1,RoomID )
	AddToPartition( controller2,RoomID )
end
------------------------------------------------------------------------
--��t������ͫ�
function William_show424578_02()
	--SetModeEx( OwnerID()  ,EM_SetModeType_Show , false ) --���
	--SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --�аO
	--SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --�x�s
	--SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --���
	--SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --���O	
	--SetModeEx( OwnerID()  ,EM_SetModeType_Move , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	--SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	--SetModeEx( OwnerID()  ,EM_SetModeType_HideName , true ) --�����Y�W���W�٬O�_���
	local npc1=Lua_DW_CreateObj( "flag" , 119178, 781006 , 0 , 1 , 1 ) --����119178��781006-0
	sleep(10)
	Say( npc1, "[SC_119178_01]" ) --SC_119178_01�G�ӧa��I�ڭ̰��W�N�|���D���פF�I
	sleep(15)
	LuaFunc_MoveToFlag( npc1, 781006 , 1 , 1 ) --��119178����781006-1
	sleep(25)
	FaceFlag ( npc1, 781007 , 1 ) --��119178�ୱ�V��781007-1
	AdjustDir( npc1,0) --�ୱ�V
	sleep(10)
	Say( npc1, "[SC_119178_02]" ) --SC_119178_02�G�̥S��...��H�a�X�ӡI
	sleep(15)
	local npc3=Lua_DW_CreateObj( "flag" , 119355, 781008 , 0 , 1 , 1 ) --����119355��781008-0
	sleep(10)
	Say( npc3, "[SC_119355_01]" )--SC_119355_01�G���i��O�I
	sleep(05)
	local npc2=Lua_DW_CreateObj( "flag" , 119179, 781007 , 0 , 1 , 1 ) --����119179��781007-0
	sleep(10)
	Say( npc2, "[SC_119179_01]" )--SC_119179_01�G�����Դ��I��ӬO�A�d����...
	sleep(05)
	LuaFunc_MoveToFlag( npc3, 781008 , 1 , 1 ) --��119355����781008-1
	LuaFunc_MoveToFlag( npc2, 781007 , 1 , 1 ) --��119179����781007-1
	sleep(25)
	FaceFlag ( npc3, 781006 , 1 ) --��119355�ୱ�V��781006-1
	AdjustDir( npc3,0) --�ୱ�V
	sleep(05)
	FaceFlag ( npc2, 781006 , 1 ) --��119179�ୱ�V��781006-1
	AdjustDir( npc2,0) --�ୱ�V
	Say( npc1, "[SC_119178_03]" ) --SC_119178_03�G�w�J���I�䥦�h�l���o�ܧڷQ�ڭ̤]�����h���F�A�A�{�b���G�ؿ��...
	sleep(35)
	Say( npc1, "[SC_119178_04]" ) --SC_119178_04�G�Ĥ@�A�N�A�e�i�����å浹����x�A�A�����s��B�k�ǡB�M�q�N�A�U���|�O�p��A���ӫܲM��...
	sleep(35)
	Say( npc1, "[SC_119178_05]" ) --SC_119178_05�G�ĤG�A�P�ڭ̦X�@�t�X�@�����ñϥX�º����x�A���צ��\�Υ��ѡA�A���M�i�H�~�򰵬��@�W�s��...
	sleep(35)
	Say( npc1, "[SC_119178_06]" ) --SC_119178_06�G�Ӱk�ǩM�q�N�o�Ǹo�W�A�N�|�u�O���{�b������x�Ө�...
	sleep(35)
	Say( npc1, "[SC_119178_07]" ) --SC_119178_07�G�w�J����A�S���h�֮ɶ��i�H�Ҽ{...
	sleep(30)
	Say( npc2, "[SC_119179_02]" )--SC_119179_02�G����A�D�H���覡�ٯu�O�S�����...
	sleep(35)
	Say( npc2, "[SC_119179_03]" )--SC_119179_03�G���L��J�M�ڬO�s��A�A�o�ؤU�y��q��ڦӨ���M�]�O�������_...
	sleep(35)
	Say( npc2, "[SC_119179_04]" )--SC_119179_04�G�ڥi�H��A�X�@�A���O�ڷ|���ڦۤv���z��...
	sleep(35)
	Say( npc2, "[SC_119179_05]" )--SC_119179_05�G���צ��\�Υ��ѡA���N�|�P�A�̤ϧܭx�@�L���Y...
	sleep(30)
	Say( npc1, "[SC_119178_08]" ) --SC_119178_08�G�����I���ΨS����ճ��n�A�ڧƱ��ɫ�j�a���O��u���w���H�I
	sleep(35)
	Say( npc1, "[SC_119178_09]" ) --SC_119178_09�G�n�㨺���L���ѻP��ʪ������A�N�̷ӭ�Ӫ����t�U�h�i��ǳ�...
	sleep(30)
	Say( npc1, "[SC_119178_10]" ) --SC_119178_10�G��������ڭ̥ߨ�X�o�I
	sleep(25)
	LuaFunc_MoveToFlag( npc1, 781006 , 0 , 1 ) --��119178���^781006-0
	sleep(20)
	FaceFlag ( npc1, 781006 , 1 ) --��119178�ୱ�V��781006-1
	AdjustDir( npc1,0) --�ୱ�V
	DelObj ( npc1 )--�R��119178
	sleep(05)
	Lua_DW_CreateObj( "flag" , 119060, 781006 , 0 , 1 , 1 ) --����119060��781006-0
	sleep(05)
	DelObj ( npc2 )--�R��119179
	DelObj ( npc3 )--�R��119355
	DelObj ( OwnerID() )--�R��118119�]�ۤv�^
end
------------------------------------------------------------------------
--�P�_������ͫ�
function William_show424578_03()
	--SetModeEx( OwnerID()  ,EM_SetModeType_Show , false ) --���
	--SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false ) --�аO
	--SetModeEx( OwnerID()  ,EM_SetModeType_Save , false ) --�x�s
	--SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_Fight , false ) --���
	--SetModeEx( OwnerID()  ,EM_SetModeType_Gravity , true ) --���O	
	--SetModeEx( OwnerID()  ,EM_SetModeType_Move , false ) --����
	--SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false ) --�Y����
	--SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true ) --�����󤣷|�Q�j�M��
	--SetModeEx( OwnerID()  ,EM_SetModeType_HideName , true ) --�����Y�W���W�٬O�_���
	local x={}
	local y=0
		for i=0,36,1 do
			x=SearchRangePlayer ( OwnerID() , 150 )
			local num=table.getn(x)
				for j=0,num,1 do
					if	CheckAcceptQuest( x[j], 424578)==TRUE	then
						AddBuff(x[j] ,620755 ,0 ,-1)
					end
				end
			Sleep(15)	
		end
	sleep(10)
	CallPlot( OwnerID(), "William_show424578_04", OwnerID() )
	sleep(10)
	DelObj ( OwnerID() ) 
end
------------------------------------------------------------------------
function William_show424578_04()
	local x={}
        	x=SearchRangePlayer( OwnerID() , 150 ) 
	local num=table.getn(x)		
		for i=0,num,1 do
			if CheckAcceptQuest( x[i], 424578)==TRUE then
			   	local buffA=Lua_BuffPosSearch( x[i] ,620755)
				if BuffInfo( x[i] , buffA , EM_BuffInfoType_Power )>=30 then
				   SetFlag( x[i], 545497, 1 )
				   CancelBuff( x[i], 620755 )
				   DelBodyItem( x[i], 545579, 1 ) 
				end
			end
		end
end
------------------------------------------------------------------------