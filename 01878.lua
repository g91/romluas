function bk_129_100123_count()------------------16�ƥ��������
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = OwnerID()--------�������	
	local x=0 
	local count=0
	local final=0
	local b3=0
	local b4=0
	b3=CreateObj( 103934 ,1965, 680 , 2150, 0 , 1)------------------------------���F�x103934
	SetFightMode( b3 , 0 , 0 , 0 , 0 )
 	SetModeEx( b3 , EM_SetModeType_Gravity, false) 
	SetModeEx( b3 , EM_SetModeType_AlignToSurface, false) 
	SetModeEx( b3 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( b3 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
	AddToPartition(b3 , RoomID )
	WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
	SetPlot( b3 , "dead" , "Cang_129_oh_dead" , 10 )
	WriteRoleValue(start ,EM_RoleValue_Register8,b3)---------------------���F�x
	b4=CreateObj( 103935 ,1980, 680 ,2165, 40 , 1)------------------------------��h103941
	SetFightMode( b4 , 0 , 0 , 0 , 0 )
 	SetModeEx( b4 , EM_SetModeType_Gravity, false) 
	SetModeEx( b4 , EM_SetModeType_AlignToSurface, false) 
	SetModeEx( b4 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( b4 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
	AddToPartition(b4 , RoomID )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	AddBuff( b4 , 506853 , 1 , -1 )
	SetPlot( b4 , "dead" , "Cang_129_baron_dead" , 10 )
	WriteRoleValue(start ,EM_RoleValue_Register9,b4)---------------------������h
	while 1 do 
		sleep(10)
		---say(start,"x="..x)
		x=ReadRoleValue(start,EM_RoleValue_Register1)--------------------------------�����ثe���ȨӬ������쥴�������
		if x==0 then 
			count = CreateObjByFlag(115548,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( count , EM_SetModeType_Mark, true)
			----SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----���O
			SetModeEx( count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( count , EM_SetModeType_Move, true) ---����	
			SetModeEx( count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)
			WriteRoleValue(count ,EM_RoleValue_Register2,b4)---------------------count ������h
			WriteRoleValue(start, EM_RoleValue_Register1,1)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==1 then --------���s�԰���
			
		elseif x==2 then --------���s���`
			count = CreateObjByFlag(115549,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( count , EM_SetModeType_Mark, true)
			----SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			------------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----���O
			SetModeEx( count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( count , EM_SetModeType_Move, true) ---����	
			SetModeEx( count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			WriteRoleValue(start, EM_RoleValue_Register1,3 )
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==3 then --------�j���h�԰���
		
		elseif x==4 then --------�j���h���`
			-----say(ownerid(),"11111111111")
			count = CreateObjByFlag(115550,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( count , EM_SetModeType_Mark, true)
			---------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			----------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----���O
			SetModeEx( count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( count , EM_SetModeType_Move, true) ---����	
			SetModeEx( count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			DelObj(b3)
			b3=CreateObj( 103934 ,1965, 680 , 2150, 0 , 1)------------------------------���F�x103934
			SetFightMode( b3 , 0 , 0 , 0 , 0 )
			SetModeEx( b3 , EM_SetModeType_Gravity, false) 
			SetModeEx( b3 , EM_SetModeType_AlignToSurface, false) 
			SetModeEx( b3 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( b3 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
			AddToPartition(b3 , RoomID )
			WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
			SetPlot( b3 , "dead" , "Cang_129_oh_dead" , 10 )
			WriteRoleValue(start ,EM_RoleValue_Register8,b3)---------------------���F�x
			WriteRoleValue(start, EM_RoleValue_Register1,5)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==5 then --------���F�x�԰���
			---say(ownerid(),"4654564645645645645645645645643")
		elseif x==6 then --------���F�x���`	
			count = CreateObjByFlag(115551,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( count , EM_SetModeType_Mark, true)
			---------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			----------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----���O
			SetModeEx( count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( count , EM_SetModeType_Move, true) ---����	
			SetModeEx( count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)
			Delobj(b4)
			b4=CreateObj( 103935 ,1980, 680 ,2165, 40 , 1)------------------------------��h103941
			SetFightMode( b4 , 0 , 0 , 0 , 0 )
			SetModeEx( b4 , EM_SetModeType_Gravity, false) 
			SetModeEx( b4 , EM_SetModeType_AlignToSurface, false) 
			SetModeEx( b4 , EM_SetModeType_Strikback, false) ---����
			SetModeEx( b4 , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
			AddToPartition(b4 , RoomID )
			WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
			AddBuff( b4 , 506853 , 1 , -1 )
			SetPlot( b4 , "dead" , "Cang_129_baron_dead" , 10 )
			WriteRoleValue(start ,EM_RoleValue_Register9,b4)---------------------������h
			WriteRoleValue(start, EM_RoleValue_Register1,7)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==7 then --------��h�԰���
		
		elseif x==8 then --------��h���`
			final = ReadRoleValue(start,EM_RoleValue_Register7)--------------Ū�����l���
			count = CreateObjByFlag(115552,780670,4,1)
			SetModeEx( count , EM_SetModeType_Gravity, true) ---���O
			SetModeEx( count , EM_SetModeType_Mark, true)
			----------------SetModeEx( count , EM_SetModeType_HideName, true)
			SetModeEx( count , EM_SetModeType_ShowRoleHead, true)
			---------------SetModeEx( count , EM_SetModeType_NotShowHPMP, true)
			SetModeEx( count , EM_SetModeType_Obstruct, false)   -----���O
			SetModeEx( count , EM_SetModeType_Strikback, false) ---����
			SetModeEx( count , EM_SetModeType_Move, true) ---����	
			SetModeEx( count , EM_SetModeType_Fight, false) ---�i���
			SetModeEx( count , EM_SetModeType_SearchenemyIgnore, false) 
			SetModeEx( count , EM_SetModeType_Searchenemy, false)
			SetModeEx( count , EM_SetModeType_Show, true)
			AddToPartition( count , RoomID )
			DisableQuest(count,true)
			WriteRoleValue(count ,EM_RoleValue_PID,start)	
			sleep(10)
			Delobj(final)
			WriteRoleValue(start, EM_RoleValue_Register1,9)
			MoveToFlagEnabled ( count,  false )
			LuaFunc_MoveToFlag( count, 780670 , 3 , 10)
			SetPosByFlag( count, 780670 , 5 )
			LuaFunc_MoveToFlag( count, 780670 , 6 , 10)
			DisableQuest(count,false)
		elseif x==9 then --------���l�԰���
		
		elseif x==10 then -------���l���`
			
		end			
	end	
end
function bk_129_103932_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103932_c2", 0 ); --�A�ǳƦn�F��?
end
function bk_129_103933_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103933_c2", 0 ); --�A�ǳƦn�F��?
end
function bk_129_103934_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103934_c2", 0 ); --�A�ǳƦn�F��?
end
function bk_129_103935_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_103935_c2", 0 ); --�A�ǳƦn�F��?
end
function bk_129_finl_c1()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_103932_10]" , "bk_129_finl_c2", 0 ); --�A�ǳƦn�F��?
end
function bk_129_103932_c2()
	BeginPlot( TargetID( ) ,"bk_129_103932_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103933_c2()
	BeginPlot( TargetID( ) ,"bk_129_103933_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103934_c2()
	BeginPlot( TargetID( ) ,"bk_129_103934_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103935_c2()
	BeginPlot( TargetID( ) ,"bk_129_103935_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_finl_c2()
	BeginPlot( TargetID( ) ,"bk_129_finl_op",0)---------------------------------��۴��Ҧ���b�ͥX�Ӫ�����npc���W
	DisableQuest(TargetID( ),true)
	CloseSpeak( OwnerID() )
end
function bk_129_103932_op()-------------���s���������۴�����
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------Ū����������
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_09]" , 1 )
	Say(OwnerID(),"[SC_103932_09]")
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b4= ReadRoleValue(start,EM_RoleValue_Register9)--------------Ū����h
	SetModeEx( b4 , EM_SetModeType_Move, true)
	SetModeEx( b4 , EM_SetModeType_Gravity, true) ---���O
	CastSpell( b4 , b4 , 495699 )
	SetPos( b4, 2095, 514.3 , 2043 , 45 )---�N���Ǩ�@�Ӧa��h
	MoveToFlagEnabled ( b4,  false )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103932_05]" , 1 )---���A�A�̴N�O���Ѫ��D�Ԫ̧a�A��ߡA�o���v�޳��@�������ɳ��O�������A�u�O���O�ҧA�̪��ʩR�}�F
	say(OwnerID(),"[SC_103932_05]")---���A�A�̴N�O���Ѫ��D�Ԫ̧a�A��ߡA�o���v�޳��@�������ɳ��O�������A�u�O���O�ҧA�̪��ʩR�}�F
	sleep(30)
	LuaFunc_MoveToFlag( b4, 780667 , 2 , 10)--------------------------------��h�樫�ܳo�Ӧ�m�o�ʬL���s���ޯ�
	CastSpell( b4 , b4 , 495698 )
	say(OwnerID(),"[SC_103932_06]")----���������A�A�o���S�ѤS�i�����ΡA�ǳƤW���԰��F
	local dcseat=CreateObjByFlag(103971,780665,1,1)
	SetModeEx( dcseat , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( dcseat , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( dcseat , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( dcseat , EM_SetModeType_Searchenemy, false)
	SetModeEx( dcseat , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( dcseat , EM_SetModeType_Mark, false)
	SetModeEx( dcseat , EM_SetModeType_Move, false)
	SetModeEx( dcseat , EM_SetModeType_Fight, false) ---�i���
	AddToPartition(dcseat , RoomID )
	AddBuff( dcseat , 506820 , 1 , -1 )
	WriteRoleValue(dcseat, EM_RoleValue_Livetime,5)
	sleep(30)
	SetPos( b4, 1980 , 680 , 2165 , 40 )---�N���Ǩ�@�Ӧa��h
	SetModeEx( b4 , EM_SetModeType_Move, false)
	SetModeEx( b4 , EM_SetModeType_Gravity, false) ---���O
	local dc=CreateObjByFlag(103932,780665,1,1)
	AddToPartition( dc , RoomID )
	BeginPlot( dc ,"bk_129_103932",0)---------------------------------���@���Ҧ�
	SetPlot( dc , "dead" , "bk_129_103932_dead" , 10 )
	WriteRoleValue( dc, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,1)
	sleep(20)
	Delobj(OwnerID())
end
function bk_129_103933_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------Ū����������
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	ScriptMessage( OwnerID() , -1 , 2 , "[SC_103933_05]" , 1 )
	Say(OwnerID(),"[SC_103933_05]")
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local big=CreateObjByFlag(103933,780666,1,1)-----------------------�j���h���X��
	SetModeEx( big , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( big , EM_SetModeType_Mark, false)
	-----SetModeEx( big , EM_SetModeType_HideName, true)
	SetModeEx( big , EM_SetModeType_ShowRoleHead, true)
	----SetModeEx( big , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( big , EM_SetModeType_Obstruct, false)   -----���O
	SetModeEx( big , EM_SetModeType_Strikback, false) ---����
	SetModeEx( big , EM_SetModeType_Move, true) ---����	
	SetModeEx( big , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( big , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( big , EM_SetModeType_Searchenemy, false)
	SetModeEx( big , EM_SetModeType_Show, true)
	AddToPartition( big , RoomID )
	SetPlot( big , "dead" , "bk_129_103933_dead" , 10 )
	MoveToFlagEnabled ( big,  false )
	LuaFunc_MoveToFlag(big, 780666 , 2 , 10)--------------------------------�Фj���h����o�Ӧ�m  (�o��function �L�O�j��)
	SetPosByFlag( big, 780666 , 3 )
	LuaFunc_MoveToFlag(big, 780666 , 4 , 10)--------------------------------�Фj���h����o�Ӧ�m  (�o��function �L�O�j��)
	SetModeEx( big , EM_SetModeType_Mark, true)
	SetModeEx( big , EM_SetModeType_Strikback, true) ---����
	SetModeEx( big , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( big , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( big , EM_SetModeType_Searchenemy, true)
	BeginPlot( big ,"bk_129_103933",0)---------------------------------���@���Ҧ�
	WriteRoleValue( big, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,3)
	sleep(20)
	Delobj(OwnerID())
end
function bk_129_103934_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------Ū����������
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b3 = ReadRoleValue(start,EM_RoleValue_Register8)--------------Ū�����F�x
	SetModeEx( b3 , EM_SetModeType_Move, true)
	SetModeEx( b3 , EM_SetModeType_Gravity, true) ---���O
	sleep(10)
	SetModeEx( b3 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( b3 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, false)
	CastSpell( b3 , b3 , 495699 )
	SetPos( b3, 2095, 514.3 , 2043 , 45 )---�N���Ǩ�@�Ӧa��h
	MoveToFlagEnabled ( b3,  false )
	WriteRoleValue( b3 ,EM_RoleValue_IsWalk , 1 )
	sleep(30)
	LuaFunc_MoveToFlag( b3, 780667 , 2 , 10)--------------------------------��h�樫�԰���m
	SetModeEx( b3 , EM_SetModeType_Strikback, true) ---����
	SetModeEx( b3 , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( b3 , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( b3 , EM_SetModeType_Searchenemy, true)
	BeginPlot( b3 ,"Cang_129_oh",20)---------------------------------���@���Ҧ�
	WriteRoleValue( b3, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,5)
	sleep(10)
	Delobj(OwnerID())
end
function bk_129_103935_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------Ū����������
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local b4 = ReadRoleValue(start,EM_RoleValue_Register9)--------------Ū�����F�x
	SetModeEx( b4 , EM_SetModeType_Move, true)
	SetModeEx( b4 , EM_SetModeType_Gravity, true) ---���O
	sleep(10)
	SetModeEx( b4 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( b4 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, false)
	CancelBuff( b4 ,  506853 )
	CastSpell( b4 , b4 , 495699 )
	SetPos( b4, 2095, 514.3 , 2043 , 45 )---�N���Ǩ�@�Ӧa��h
	MoveToFlagEnabled ( b4,  false )
	WriteRoleValue( b4 ,EM_RoleValue_IsWalk , 1 )
	sleep(30)
	LuaFunc_MoveToFlag( b4, 780667 , 2 , 10)--------------------------------��h�樫�԰���m
	SetModeEx( b4 , EM_SetModeType_Strikback, true) ---����
	SetModeEx( b4 , EM_SetModeType_Fight, true) ---�i���
	SetModeEx( b4 , EM_SetModeType_SearchenemyIgnore, true) 
	SetModeEx( b4 , EM_SetModeType_Searchenemy, true)
	BeginPlot( b4 ,"Cang_129_baron",20)---------------------------------���@���Ҧ�
	WriteRoleValue( b4, EM_RoleValue_Register1,start)
	WriteRoleValue(start, EM_RoleValue_Register1,7)
	sleep(10)
	Delobj(OwnerID())
end
function bk_129_finl_op()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)--------------Ū����������
	MoveToFlagEnabled ( OwnerID(),  false )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 2 , 10)
	SetPosByFlag( OwnerID(), 780670 , 3 )
	LuaFunc_MoveToFlag( OwnerID(), 780670 , 4 , 10)
	local final=CreateObjByFlag(103933,780666,1,1)-----------------------�j���h���X��
	SetModeEx( final , EM_SetModeType_Gravity, false) ---���O
	SetModeEx( final , EM_SetModeType_Mark, false)
	SetModeEx( final , EM_SetModeType_HideName, false)
	SetModeEx( final , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( final , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( final , EM_SetModeType_Obstruct, false)   -----���O
	SetModeEx( final , EM_SetModeType_Strikback, false) ---����
	SetModeEx( final , EM_SetModeType_Move, false) ---����	
	SetModeEx( final , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( final , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( final , EM_SetModeType_Searchenemy, false)
	SetModeEx( final , EM_SetModeType_Show, false)
	AddToPartition( final , RoomID )
	BeginPlot( final ,"Cang_129_2bo_all",20)---------------------------------���@���Ҧ�
	WriteRoleValue(start, EM_RoleValue_Register1,9)
	WriteRoleValue(start, EM_RoleValue_Register7,final)
	WriteRoleValue(final, EM_RoleValue_Register1,start)
	sleep(10)
	Delobj(OwnerID())
end

