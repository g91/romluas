--------------�G�m��--------------
function Lua_Z29_jiyi_STARKspeak()	--NPC��ܼ@��
	SetPlot( OwnerID() , "touch" , "Lua_Z29_jiyi_STARKspeak2" , 30 )
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_Z29_jiyi_STARKspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")
	local Speak = {[1] = "[SC_Z29_NPCSPEAKING_01]" ,
			[2] = "[SC_Z29_NPCSPEAKING_02]" ,
			[3] = "[SC_Z29_NPCSPEAKING_03]" ,
			[4] = "[SC_Z29_NPCSPEAKING_04]" ,
			[5] = "[SC_Z29_NPCSPEAKING_05]" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end

function Lua_Z29_jiyi_108232_01()	--�±_����ʧ@1
	PlayMotion( OwnerID()  , 37 )
	sleep(30)
	PlayMotion( OwnerID()  , 38 )
end

function Lua_Z29_jiyi_108232_02()	--�±_����ʧ@2
	PlayMotion( OwnerID()  , 33 )
	sleep(10)
	PlayMotion( OwnerID()  , 38 )
end

function Lua_Z29_jiyi_123263()	--�k����m
	local Mobile = OwnerID()
	AddBuff( Mobile , 625204, 0, -1 )
	SetPlot( Mobile , "range" , "Lua_Z29_jiyi_Mobile1" , 30 )  	
end

function Lua_Z29_jiyi_Mobile1()
	local Player = OwnerID()
	local Mobile = TargetID()	--�k����m
	local PID = ReadRoleValue( Mobile , EM_RoleValue_PID )
	if PID == 1 then
		SetPosByFlag( Player , 781378 , 1 )	--�W
	elseif PID == 2 then
		SetPosByFlag( Player , 781378 , 0 )	--�U
	end 	
end

function Lua_Z29_122562_Motion()	--122562��a�j�p�ʧ@
	local NPC=OwnerID()
	local Num=DW_Rand( 3 )*10
	PlayMotion( NPC , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	Sleep( Num+30 )
	PlayMotion( NPC , ruFUSION_ACTORSTATE_CRAFTING_END )
end

function Lua_Z29_jiyi_Walamotion()	--�p�ձڰʧ@
	local npc = OwnerID()
	local Motion = {[1] = ruFUSION_ACTORSTATE_BUFF_SP01 ,
			[2] = ruFUSION_MIME_CAST_SP01 ,
			[3] = ruFUSION_ACTORSTATE_CAST_SP01 }
	local RandNum = DW_Rand( table.getn ( Motion ) )
	PlayMotion( npc , Motion[RandNum] )
end
---------------------------------------��u�G426821�������� �e�U+�����G426846+426856���ķn�@�n-------------------------------
function Lua_Z29_123215_Touch()		--��s���㪺�IĲ�@��
	local Machine = OwnerID()
	SetPlot( Machine , "touch", "Lua_Z29_123215_Touch2", 30 )
end

function Lua_Z29_123215_Touch2()
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
	DW_CancelTypeBuff( 68 , Player )						--�����M�����A
	if DW_CheckQuestAccept( "or" , Player , 426821 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true 		and	--�p�G����ŦX�G�����������ĥ���
	CountBodyItem( Player , 242942 ) > 0				and	--���H�;��b���~
	CountBodyItem( Player , 209973 ) < 5				then	--���H�;�
		if Num01 == 0 then	----�P�_�Ѽƭ�
			WriteRoleValue( Machine , EM_RoleValue_Register1 , 999 )		--Register1�g��999�A�N�p��functuon��_��												
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_01]" , 0 )	--"�ЧQ�β��ʷn��[123215]"					
			CallPlot( Machine , "Lua_Z29_123215_Count" , Machine , Player )	--�C��P�_Register1��
			if BeginCastBarEvent( Player , Machine , "[SC_Z29Q426821_02]" , 80 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "Lua_Z29_123215_Touch3" ) ~= 1 then
									--"�n�̬�s����"											--�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )	--����L�H�b�ϥγo�Ӿ���K
				ScriptMessage( Player , Player , 0 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )			
			end
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426821 ) == true 	or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true 		or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true 		and 
	CountBodyItem( Player , 242942 ) == 0 then
		ScriptMessage( Player, Player, 1 , "[SC_Z27Q426448_01]" , "0xffbf0b2b" )	--"�A�S���i�H�ϥΪ����~�K"
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )	--"�ϥα��󤣲ŦX�C"
		ScriptMessage( Player , Player , 0 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )
	end
end

function Lua_Z29_123215_Touch3( Player , CheckStatus )
	local Player = OwnerID()
	local Machine = TargetID()
	EndCastBar( Player , CheckStatus )
	WriteRoleValue( Machine , EM_RoleValue_Register1 , 0 )
	Sleep(10)
	local Num02 = ReadRoleValue( Machine , EM_RoleValue_Register2 )
	if ( CheckStatus ~= 0 ) then
		if Num02 <= 30 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_04]" , 0 )	--�n�̤������áA���H�;��s�@���ѡK
			DelBodyItem( Player , 242942 , 1 )
		elseif Num02 <= 50 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_05]" , 0 )	--���H�;��s�@����
			DelBodyItem( Player , 242942 , 1 )
			GiveBodyItem( Player , 209973 , 1 )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_06]" , 0 )	--�n�̤ӥΤO�A���H�;��s�@���ѡK
			DelBodyItem( Player , 242942 , 1 )
		end
	else
		EndCastBar( Player , CheckStatus )
	end
	WriteRoleValue( Machine , EM_RoleValue_Register2 , 0 )
end

function Lua_Z29_123215_Count( Machine , Player )
	for i= 1 , 80 , 1 do
		local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
		if Num01 == 0 then
			return
		end
		Sleep(1)
		local y=i%10					----�C10�]1��^�@���P�_�A�@8��						
			if y==0 then
				WriteRoleValue( Machine , EM_RoleValue_Register2 , i )
			end
	end
	return
end

function Lua_jiyi_Z29_426821_Retake()		--���s���b���~
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426821 )==true or 
	DW_CheckQuestAccept( "or" , Player , 426846 ) == true or 
	DW_CheckQuestAccept( "or" , Player , 426856 ) == true then	
		if CountBodyItem( Player , 242942 ) == 0 and CountBodyItem( Player , 209973 )<5 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426821_07]" , "Lua_jiyi_Z29_426821_Retake2(1)" , 0 )
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426822 )==true or 
	DW_CheckQuestAccept( "or" , Player , 426847 ) == true or 
	DW_CheckQuestAccept( "or" , Player , 426857 ) == true then	
		if CountBodyItem( Player , 242943 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426822_03]" , "Lua_jiyi_Z29_426821_Retake2(2)" , 0 )	--�A���ڤ@��[242943]�a�I
		end
	end
end

function Lua_jiyi_Z29_426821_Retake2(Item)
	local Player = OwnerID()
	CloseSpeak( Player )
	if Item == 1 then
		local Num = 5 - CountBodyItem( Player , 242942 )
		for i = 1 , Num do
			GiveBodyItem( Player , 242942 , 1 )
		end
	elseif Item == 2 then
		GiveBodyItem( Player , 242943 , 5 )
	end			
end
-------------------------------��u�G426822����묹 �e�U+PE�G426847+426857�@�ϱH�ͥͪ�---------------------------------
function Lua_Z29_242943check()	--���H�;��ˬdLUA
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Animal = { [1]=108245 , [2]=108247 }	--��Ʀ��ñH�ͥj���B��Ʀ��ñH�ͥ���
	if DW_CheckQuestAccept("or", Player , 426822 ) == true or 
	DW_CheckQuestAccept("or", Player , 426847 ) == true or 
	DW_CheckQuestAccept("or", Player , 426857 ) == true then
		if TOrgID == Animal[1] or TOrgID == Animal[2] then
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"						
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--�t�Χi��"�ϥα��󤣲ŦX�C"
		return false
	end
end			

function Lua_Z29_242943use()	--���H�;��ϥ�LUA
	local Player = OwnerID()
	local Tar = TargetID()
	local MaxHP = ReadRoleValue( Tar , EM_RoleValue_MaxHP )		--�`��q
	local NowHP = ReadRoleValue( Tar , EM_RoleValue_HP )			--��e��q
	local HPPercent = ( NowHP / MaxHP )*100					--��q�ʤ���
	if HPPercent <= 50  and HPPercent > 0 then	--��q�֩�50%��
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426822_01]" , 0 )	--"�Q�H�ͪ��ͪ�������_�N�ѡA���A�D�ʧ����A�K"
		Callplot( Player , "Lua_Z29_242943use2" , Player , Tar )
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426822_02]" , 0 )	--"�Q�H�ͪ��ͪ����G�D�`�J�{�A�Х��d�z�e�������K"					
	end
end

function Lua_Z29_242943use2( Player , Tar )
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Animal = { [1]=108245 , [2]=108247 }	--��Ʀ��ñH�ͥj���B��Ʀ��ñH�ͥ���
	local x , y , z , dir = DW_Location( Tar )
	sleep(10)
	hide(Tar)
	DW_QietKillOne( 0 , 107944 )	--�R�R������107944�ǡA�e�̱�����̡A0�N�����a	
	if TOrgID == Animal[1] then
		local NewNPC = CreateObj( 108139 , x , y , z , dir , 1 )
		AddToPartition( NewNPC , 0 )
		Beginplot( NewNPC , "Lua_Z29_242943use3" , 0 )	
	elseif TOrgID == Animal[2] then
		local NewNPC = CreateObj( 108140 , x , y , z , dir , 1 )
		AddToPartition( NewNPC , 0 )
		Beginplot( NewNPC , "Lua_Z29_242943use3" , 0 )	
	end
	Sleep(10) 
	LuaFunc_ResetObj( Tar )
end

function Lua_Z29_242943use3()
	local NPC = OwnerID()
	local Player = TargetID()
	local dis = Rand( 100 )    --�����a�h���ʶZ��
	if dis < 50 then
		dis = 50
	end
	SetDir( NPC , 180 )  
	AdjustFaceDir( NPC , Player , 180 )	--���V�I��
	WriteRoleValue( NPC , EM_RoleValue_IsWalk , 2 )
	sleep(5)
	Lua_MoveLine( NPC , dis )	--�ѦҪ���A�V�e���ʨ�Dis�Z������m(Dis��t�Ƭ��V�Ჾ��)
	sleep(50 )
	Delobj( NPC )
end
--------------------------------------------426823���o�H��-----------------------------------
function Lua_Z29_426823accept()	--���U���ȫᵹ426824�������n���e�m�X��
	local Player = TargetID()
 	local NPC = OwnerID()
	Setflag( Player , 548547 , 1 )
end	
----------------------------------------------��u�G426824�������n �e�U+PE�G426848+426858�p��ۣ�A---------------------------------
function Lua_Z29_123218start()	--�p��ۣ��l�@��
	local Mushroom = OwnerID()
	while true do
		if Checkbuff( Mushroom , 625116 ) == false then
			Addbuff( Mushroom , 625116 , 0 , -1 )
		end
	Sleep(100)
	end
end

function Lua_Z29_209975_check()	--�ڴu��ϥ��ˬd
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Mushroom = 123218
	if DW_CheckQuestAccept("or", Player , 426824 ) == true or 
	DW_CheckQuestAccept("or", Player , 426848 ) == true or 
	DW_CheckQuestAccept("or", Player , 426858 ) == true then
		if TOrgID == Mushroom then
			if Checkbuff( Tar , 625116 ) == true then
				return true
			elseif Checkbuff( Tar , 625116 ) == false then
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426824_01]" , 0 )	--"�o���p��ۣ�S�������ή`�I"
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false						
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--�t�Χi��"�ϥα��󤣲ŦX�C"
		return false
	end
end

function Lua_Z29_209975_use()	--�ڴu��ϥ�
	local Player = OwnerID()
	local Mushroom = TargetID()
	Cancelbuff( Mushroom , 625116 )
	local num =Rand( 100 )	--���v��
	if Countbodyitem( Player , 209974 ) < 5 then	
		if num>= 30 then		--1/3��o���~�G���\�C
			Givebodyitem( Player , 209974 , 1 )
		elseif num>= 15 then	--1/3�����C
			ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_02]" , 0 )	--�p��ۣ�٨S���j�A���n�ݮ`���]�K
		else				--1/3�L���C
			ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_03]" , 0 )	--�p��ۣ�����Y���ή`�A�w�g�L�k���ΡK
		end
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426824_04]" , 0 )	--�A�w�g��������ۣ
	end			
end

function Lua_Z29_426824complete()	--���ȵ�������426823�������ȱ���
	local Player = TargetID()
 	local NPC = OwnerID()
	GiveBodyItem(Player , 243268 , 1 )
	Setflag( Player , 547382 , 1 )
end

function Lua_Z29_123217speak()	--123217�j�Ԧ��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept("or", Player , 426824 ) == true or 
	DW_CheckQuestAccept("or", Player , 426848 ) == true or 
	DW_CheckQuestAccept("or", Player , 426858 ) == true then
		if Countbodyitem( Player , 209975 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426824_05]" , "Lua_Z29_123217speak2(1)" , 0 )	--�٦��ڴu��ܡH
		end
	elseif CheckFlag( Player , 547382 ) == true and CountBodyItem( Player , 243268 ) == 0 then
		AddSpeakOption( Player , Player , "[SC_Z29Q426824_07]","Lua_Z29_123217speak2(2)" , 0 )	--�A�٦��ک�ۣ�ܡH
	end
end

function Lua_Z29_123217speak2(num)
	local Player = OwnerID()
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z29Q426824_06]" )	--���h�A�o�̫ܦh�C
		GiveBodyItem( Player , 209975 , 1 )
	elseif num == 2 then
		SetSpeakDetail( player , "[SC_Z29Q426824_08]" )	--�o�O�ѤU���ک�ۣ�A�O�A�Ӹ�ڰQۣ�F�C
		GiveBodyItem( Player , 243268 , 1 )
	end		
end				
---------------------------------��u�G426825�칫���� �e�U+PE�G426849+426859��������-----------------------------------
function Lua_Z29_242940use(Option)	--��Ţ�@��
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Animal = 108267	--�B�A����

	if ( Option == "CHECK" ) then	--���~�ˬd�@��
		local BuffType = 0
		if DW_CheckQuestAccept("or", Player , 426825 ) == true or 
		DW_CheckQuestAccept("or", Player , 426849 ) == true or 
		DW_CheckQuestAccept("or", Player , 426859 ) == true then
			return true
		elseif BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�
			ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false	
		end
	elseif ( Option == "USE" ) then	--���~�ϥμ@��
		BeginPlot( Player , "Lua_Z29_242940use2" , 0 )  
	end
end

function Lua_Z29_242940use2()	--���ͳ���
	local Player = OwnerID()
	local Trap = DW_CreateObjEX("obj", 122377 , Player )
	SetModeEx( Trap , EM_SetModeType_Show , true )		--���
	SetModeEx( Trap , EM_SetModeType_Strikback , false )	--����
	SetModeEx( Trap , EM_SetModeType_SearchenemyIgnore , false )	--�Q�j�M
	SetModeEx( Trap , EM_SetModeType_Mark , true )	--�аO
	SetModeEx( Trap , EM_SetModeType_Move , false )	--����
	SetModeEx( Trap , EM_SetModeType_Searchenemy , false )	--����
	SetModeEx( Trap , EM_SetModeType_HideName , true )	--�W��
	SetModeEx( Trap , EM_SetModeType_ShowRoleHead , false )	--�Y����
	SetModeEx( Trap , EM_SetModeType_Fight , false )		--�i�������
	SetModeEx( Trap , EM_SetModeType_Strikback , false )	--����
	SetModeEx( Trap , EM_SetModeType_Obstruct , false )	--����
	SetModeEx( Trap , EM_SetModeType_Gravity , true )	--���O
	AddToPartition( Trap , 0 )
	Callplot( Trap , "Lua_Z29_122377use" , Player )
end

function Lua_Z29_122377use(Player)	--��Ţ���ͼ@��
	local Trap = OwnerID()	--��Ţ
	local Mouse = Lua_Hao_NPC_Closest_Search( Trap , 108267 , 50 ) -- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
	local X = ReadRoleValue( Trap , EM_RoleValue_X )
	local Y = ReadRoleValue( Trap , EM_RoleValue_Y )
	local Z = ReadRoleValue( Trap , EM_RoleValue_Z )
	local sec = Move( Mouse , X , Y , Z )
	Sleep(10) 
	if Mouse == 0 then
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426825_01]" , 0 )	--�ϥνd�򤺵L�B�A���� 
	else
		Beginplot( Mouse , "Lua_Z29_122377use2" , 0 )
		sleep(10)
		Givebodyitem( Player , 242941 , 1 )
	end
	Delobj(Trap)
end	

function Lua_Z29_122377use2()
	LuaFunc_ResetObj( OwnerID() )
end

function Lua_jiyi_Z29_123220_Retake()		--���s����Ţ
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426825 ) == true or
	DW_CheckQuestAccept("or", Player , 426849 ) == true or 
	DW_CheckQuestAccept("or", Player , 426859 ) == true then	
		if CountBodyItem( Player , 242940 ) == 0 and CountBodyItem( Player , 242941 ) <5 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426825_02]" , "Lua_jiyi_Z29_123220_Retake2" , 0 )	--�ڷQ�A��A���@�ǳz����Ţ
		end
	end
end

function Lua_jiyi_Z29_123220_Retake2()
	local Player = OwnerID()
	CloseSpeak( Player )
	local Num = 5 - CountBodyItem( Player , 242941 )
	for i = 1 , Num do
		GiveBodyItem( Player , 242940 , 1 )
	end		
end
---------------------------426816�k���J���ͦs���D------------------------
function Lua_Z29_121804speak()
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426816 ) == true and Countbodyitem( Player , 241974 ) >= 5 then	
		AddSpeakOption( Player , NPC , "[SC_Z29Q426816_01]" , "Lua_Z29_121804speak2(1)" , 0 )	--�o�̦��@��³��...
	elseif DW_CheckQuestAccept( "or" , Player , 426827 ) == true then	--426827��ָ��q
		if Checkflag( Player , 547526 ) == false then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426827_01]" , "Lua_Z29_121804speak2(2)" , 0 )	--ť���p���i�H���C�k�����ͨ|���n�F��H
		else
			LoadQuestOption( Player )	
		end				
	end
end

function Lua_Z29_121804speak2(Item)
	local Player = OwnerID()
	if Item == 1 then
		SetSpeakDetail( player , "[SC_Z29Q426816_02]" )	--�o�Ǥ��O�ڭ̳Q�k���J���s�m����³���H�O���O�Jù�J�D�F���q�Һ���a�m�^�Ӫ��H
								--��차�J�D�R�۰����M�O���o�w��k���J���s�ΦX�@�A�@�_�Ө�o�Ӷ�ǻp�a�Ȭ֦a�A���L�ڭ̤j�a�������F�k���J���s����W�n�A
								--�~�|�Q�L��Ѷ�F�@�M�A�Ҧ��귽���Q�k���J���s�m���A�Q���b�o�ӳ��~��¶���a��ϤU��a�A�ɭP�{�b�e�����~�A�ᦳ�T�����~�ҡA
								--�u������ǧڭ̷m�^�o��³���A�v��J���γW�i�O�u����ﵥ��h�v�A���వ�����ͷN�O�H
		Setflag( Player , 547525 , 1 )
	elseif Item == 2 then
		SetSpeakDetail( player , "[SC_Z29Q426827_02]" )	--�A�O��O�J���j�ơA�ڬݹL�A������ק�����a���`���׸����^���I
									--�A�n�M�ݥi�H���C���פk�����ͨ|����k�H
									--�Ӧn�F�A�p�G�O�A�A�@�w�i�H���\���C���פk�������ͨ|��O�C
		Setflag( Player , 547526 , 1 )			
	end				
end
-----------------------------426826�v��J���@��------------------------
function Lua_Z29_241973check()	--241973��Ŧ���į��ϥΫe�ˬd
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Food = 121803	--³���]
	if DW_CheckQuestAccept("or", Player , 426826 ) == true then
		if TOrgID == Food then
			if Checkbuff( Tar , 623881 ) == true then
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426826_01]" , 0 )	--"�o³�����G���U�L�ġA�O�A���Ķi�h�F�K"
				return false
			elseif Checkbuff( Tar , 623881 ) == false then
				return true
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false									
		end
	else	
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , 0 )	--�t�Χi��"�ϥα��󤣲ŦX�C"
		return false
	end
end

function Lua_Z29_623882use()
	local Player = OwnerID()
	local Food = TargetID()
	Addbuff( Food , 623881 , 0 , 10 )	--�U�L��BUFF
	DW_QietKillOne( 0 , 108330 )	--�R�R������108330�ǡA�e�̱�����̡A0�N�����a		
	ScriptMessage( Player , Player , 1 , "[SC_Z29Q426826_02]" , 0 )	--�A�b������̤U��...
end

function Lua_Z29_122376speak()	--�A���@���į�
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426826 ) == true then	
		if CountBodyItem( Player , 241973 ) == 0 then
			AddSpeakOption( Player , NPC , "[SC_Z29Q426826_03]" , "Lua_Z29_122376speak2" , 0 )	--�į����G���Ӱ��K
		end
	end
end

function Lua_Z29_122376speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	GiveBodyItem( Player , 241973 , 1 )
end
--------------------------------426828���B����----------------------------------------
-------���ȵ����h��:�X��2�ͦ�����X��3
function Lua_Z29_426828_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623906
	local Flag = 781378
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		 WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player , CliBuff , 0 , 15 )
 	 	CallPlot( NPC , "Lua_Z29_426828_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function      
 	end 
end

function Lua_Z29_426828_Complete2( NPC , Player , Flag , CliBuff )
	local New_NPC = Lua_DW_CreateObj("flag" , 123265 , Flag , 2 , 1 , 0 )     --���ͺt�� 
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
 	Sleep(10)
	Say(New_NPC , "[SC_Z29Q426828_01]" )
 	DW_MoveToFlag( New_NPC , Flag , 3 , 0 , 1 )
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end
--------------------------------426829���y�m��----------------------------------------
function Lua_Z29_243100_use(Option)	--�S�s���M�ϥμ@��
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Animal = 108264	--�����㰩

	if ( Option == "CHECK" ) then	--���~�ˬd�@��
		local BuffType = 0
		if DW_CheckQuestAccept("or", Player , 426829 ) == true and TOrgID == Animal then
			if Checkbuff( Player , 625192 ) == false then
				return true
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426829_01]" , 0 )	--�Х��ϥ�[499045]�i���y���K
				return false
			end				
		elseif BuffType == 68 then				       	    --/*���M�����A�L�k�ϥ�
			ScriptMessage( Player , Player , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --�M������ϥ�
			return false	
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�D���ĥؼ�
			return false
		end
	end
end

function Lua_Z29_243100_use2()
	local Player = OwnerID()
	local Tar = TargetID()		
	Addbuff( Player , 625192 , 0 , 10 )	--�����a�����ޯ�
	Addbuff( Tar , 625193 , 0 , 20 )	--���㰩��z���A
end	
	
function Lua_Z29_499045_check()	--�����ޯ��ˬd
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Animal = 108264	--�����㰩
	if CheckAcceptQuest( player , 426829 ) == true and TOrgID == Animal then
		if Checkbuff( Tar , 625193 ) == true then	--�ˬd�����㰩�O�_���u��z���A�v		
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426829_02]" , 0 )	--�ؼШ��W�S����z���A�A�����㰩�ò�k���F�K
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�D���ĥؼ�
		return false	
	end
end

function Lua_Z29_625194_use()
	local Player = OwnerID()
	local Tar = TargetID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	Hide(Tar)	
	Cancelbuff( Player , 625192 )
	DW_QietKillOne( 0 , 106570 )	--�R�R������106570�ǡA�e�̱�����̡A0�N�����a
	Callplot( Player , "Lua_Z29_625194_use2" , Tar )	
end

function Lua_Z29_625194_use2(Tar)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	sleep(100)
	show( Tar , RoomID )
end

function Lua_Z29_123266speak()	--�p���F�D���S��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426829 ) == true and Countbodyitem( player , 243100 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z29Q426829_03]","Lua_Z29_123266speak2" , 0 )	--���M�����ΤF�K
	end
end

function Lua_Z29_123266speak2()
	local player = OwnerID()
	SetSpeakDetail( player , "[SC_Z29Q426829_04]" )	--�ڳo���٦��@�ǡA�A���h�Χa�I
	local Num = 5 - CountBodyItem( player , 243100 )
	for i = 1 , Num do
		Givebodyitem( player , 243100 , 1 )
	end
end
------------------------------426830�U�Ϥ޸�-----------------------------------
function Lua_Z29_123294_touch()	--123294�U�Ͼ���l�@��
	local Fire = OwnerID()

	SetPlot( Fire , "touch", "Lua_Z29_123294_touch2", 30 )	
end

function Lua_Z29_123294_touch2()
	local Player = OwnerID()
	local Fire = TargetID()
	if CheckAcceptQuest( Player , 426830 ) == true then
		if Countbodyitem( Player , 243101 ) >0 then
			SetPlot( Fire , "touch" , "" , 30 )	--����L�H�L�k�A�I���U�Ͼ�
			CallPlot( Fire , "Lua_Z29_123294_NpcProduce" , Fire , Player )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426830_01]" , 0 )	--�A�S���i�H�I�U[123294]�����~�C
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z29Q426830_02]" , 0 )	--�@�Ӵ��q�����l�A�W�����G���U�N�L������K
	end
end			

function Lua_Z29_123294_NpcProduce( Fire , Player )	--�k�������ͼ@��
	local Fire = OwnerID()
	PlayMotion( Player , ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	Addbuff( Fire , 625198 , 0 , 10 )
	local Bee = Lua_DW_CreateObj("flag" , 108261 , 781378 , 4 , 1 , 0 )     --�b4���X�в��ͤk����
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	AddToPartition( Bee , Room )
	WriteRoleValue( Fire , EM_RoleValue_Register9 , Bee )	--�N�k�����O�b�I�U����
	Delbodyitem( Player , 243101 , 1 )
	Beginplot( Fire , "Lua_Z29_123294_Check" , 0 )
end		

function Lua_Z29_123294_Check()
	local Fire = OwnerID()
	local newbee = ReadRoleValue( Fire , EM_RoleValue_Register9 )
	while true do
		if CheckID( newbee ) == false then --�ˬd�k�����O�_�s�b
	--		say( Fire , "i'm reset" )
			SetPlot( Fire , "touch", "Lua_Z29_123294_touch2", 30 )
			break
		end
	sleep(10)
	end
end
-------------------------------426916���P�q��------------------------------
function Lua_Z29_426916_Accept()	--�����ȫ�Ĳ�o�@��
	local player = TargetID()
	SetFlag( player , 547524 , 1 )	
end
-------------------------------426917�լd��s�k------------------------------
function Lua_Z29_426917_Complete()	--���ȵ���Ĳ�o�@��
	local player = TargetID()
	SetFlag( player , 548166 , 1 )	--���P�_426917�������ȺX��
	GiveBodyItem( player , 208973 , 1 )
end

function Lua_Z29_122647_Speak()	--�áD�K����ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckFlag( player , 548166 ) == true and Countbodyitem( player , 208973 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z29Q426917_01]","Lua_Z29_122647_Speak2" , 0 )	--�ڧ�[208973]�d��F�K
	end
end

function Lua_Z29_122647_Speak2()
	local player = OwnerID()
	SetSpeakDetail( player , "[SC_Z29Q426829_04]" )	--�ڳo���٦��@�ǡA�A���h�Χa�I
	Givebodyitem( player , 208973 , 1 )
end
-------------------------------426918 �@�I�Ϫ�--------------------------------
function Lua_Z29_620451_use()	--�����ޯ����@��
	local player = OwnerID() --���a
	local Mink = TargetID()
	local NewX , NewY , NewZ , NewDir = DW_Location( player )
	local Food = CreateObj( 122646 , NewX , NewY , NewZ , NewDir , 1 )
	ks_ActSetMode( Food )
	PlayMotionex ( player , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END ) 
	Beginplot( Food , "Lua_Z29_122646_begin" , 0 )	
end	

function Lua_Z29_122646_begin()	--���������ͼ@��
	local Food = OwnerID()
	local Player = TargetID()
	local X = ReadRoleValue( Food , EM_RoleValue_X )
	local Y = ReadRoleValue( Food , EM_RoleValue_Y )
	local Z = ReadRoleValue( Food , EM_RoleValue_Z )
	while true do
		local Mink = Lua_Hao_NPC_Closest_Search( Food , 122570  , 50 )	-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
		if Mink == 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z29Q426918_01]" , 0 )	--�ϥνd�򤺵L�e�I
			sleep( 100 )
			Delobj( Food )	
		else
			local sec = Move( Mink , X , Y , Z )
			ScriptMessage( Player , player , 0 , "[SC_Z29Q426918_02]" , C_SYSTEM )--���ܰT���G�e�I���޻�
			sleep(50)
			Delobj( Food )
		end
	sleep(10)
	end	
end

function Lua_Z29_122570_Begin()	--�p�e�I���ͼ@��(������)
	local Mink = OwnerID()
	local Player = ReadRoleValue( Mink , EM_RoleValue_Register1 )
	local Dis
	local Buff = 508195	--�����ʧޯ�

	while true do  --�C����
		if CheckBuff( Player , Buff ) == false then	--�ˬd���a�O�_��"�����ʧޯ�"BUFF>>���a�b���ʤ��@�w�|����BUFF
			break
		end	

		if CheckID( Player ) == false then	--�ˬd���a�O�_���u
			break
		else --���a�b�u�W
			Dis = GetDistance( Mink , Player )	--�ˬd��U���a�M���ê��󤧶����Z��
	   		if Dis < 100 then
	   			--�i�椤
	   		elseif Dis >= 90 and Dis < 150 then 
	   			ScriptMessage( Mink , Player , 2 , "[SC_Z29Q426918_03]" , C_SYSTEM ) --�t�����ĵ�i�T���G�Y�N�W�L���ʽd��
	   		elseif Dis >=150 then
	   			ScriptMessage( Mink , Player , 2 , "[SC_Z29Q426918_04]" , C_SYSTEM )--�t�����ĵ�i�T���G���}���ʽd��	
	   			Sleep(10)
	   			CancelBuff( Player , Buff )	--�R�����ʥΧޯ�	
	   			break --���X�j��
	   		end

			local Mink_Older = SearchRangeNPC( Mink , 50 )
			local OrgID = 122564	--�Jļ���e�I
			for i = 0 , table.getn(Mink_Older) do
				if ReadRoleValue( Mink_Older[i] , EM_RoleValue_OrgID ) == OrgID then
					SetFollow( Mink , Mink_Older[i] )	--���p�e�I���H�Jļ���e�I
					Setflag( Player , 547523 , 1 )	--���������ȺX��
					Sleep(100)										
					break
				end
			end	 
		end
	Sleep(10) --����while�j�饲����1��b�~��
	end
	CancelBuff( Player , Buff )	--�R�����a���ʧޯ�
	if CheckFlag( Player , 547523 ) == true then --�ˬd���a�p�G�w�g�o��"�p�e�I�^��P����"���X��
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426918_05]" , C_SYSTEM )	--�p�e�I���Q�^��P����C
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z29Q426918_06]" , C_SYSTEM )	--�ЦV[122563]���s�������ȡK
	end		
	Delobj( Mink )	
end

function Lua_Z29_122563_speak()	--�����D�Z����ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426918 ) == true then
		if Checkflag( player , 547523 ) == false and Checkbuff( player , 508195 ) == false then
			AddSpeakOption( player , player , "[SC_Z29Q426918_07]","Lua_Z29_122563_speak2" , 0 )	--�����@�e[122563]�^�P����a�I
		else
			LoadQuestOption( player )			
		end
	end
end

function Lua_Z29_122563_speak2()
	local player = OwnerID()
	local NPC = TargetID()
	Closespeak(player)
	local NewX , NewY , NewZ , NewDir = DW_Location( Player )
	local Mink = CreateObj( 122570 , NewX + 10 , NewY , NewZ , NewDir , 1 )
	ks_ActSetMode( Mink )	
	WriteRoleValue( Mink , EM_RoleValue_Register1 , Player ) --�N���a�O�b�e�I��R1
	Beginplot( Mink , "Lua_Z29_122570_Begin" , 0 )
	Addbuff( Player , 508195 , 0 , 30 )	--�����ʧޯ�30��
end
--------------------------------426912 �֬O���ҡH------------------------------------
function Lua_Z29_123456_speak()	--���˪��v��J���s��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426912 ) == true and CheckFlag( player , 548167 ) == false then
		AddSpeakOption( player , player , "[SC_Z29Q426912_01]","Lua_Z29_123456_speak2" , 0 )	--[123455]�s�ڨӸ�A�n�K
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z29_123456_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z29Q426912_02]" )	--�N�A�p�n�I�A�Q�`�ڨ����n���ܡH
	SetFlag( Player , 548167 , 1 )
end
--------------------------------426913 �ڪA����------------------------------------
function Lua_Z29_123455_speak()	--�O�ǡD�S�j��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426913 ) == true and CheckFlag( player , 548168 ) == false then
		AddSpeakOption( player , player , "[SC_Z29Q426913_01]","Lua_Z29_123455_speak2" , 0 )	--[123456]�n�ڸ�A���K
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z29_123455_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z29Q426913_02]" )	--(�A�N[123456]�h�X�k���J���s�Ϊ��Ʊ���F���O�ǡE�S�j�K)
	SetFlag( Player , 548168 , 1 )
end							