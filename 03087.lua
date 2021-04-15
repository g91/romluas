-------------------------------��u�G426638�֥s�ڬO��O�J���j��------------------------------------
function Lua_Z28_426638_ChickobjBegin()
	local player = OwnerID()
	local stone = TargetID()
	if DW_CheckQuestAccept("or", player , 425714 ) == true then	--425714�m�����s��(�e�U����)
			return true
	elseif DW_CheckQuestAccept("or", player , 426767 ) == true then	--426767�m�����s��(��������)
			return true		
	elseif DW_CheckQuestAccept("or", player , 426638 ) == true then	
		if Checkflag( Player , 548367 ) == true then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z28Q426638_01]", 0 ) 	--�A�L�k���ѳo�O�ƻ��q��
			return false
		end
	else		
		ScriptMessage( Player,Player, 1, "[SC_Z28Q426638_02]", 0 ) 	--�𩬶𩬮l�~�����q��
		return false
	end
end

function Lua_Z28_123102_speak()	--�ھ|�|��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426638 ) == true and CheckFlag( player , 548367 ) == false then
		AddSpeakOption( player , player , "[SC_Z28Q426638_03]","Lua_Z28_123102_speak2" , 0 )	--�ڭn�����o��ù�m�ۡH
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123102_speak2()
--	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z28Q426638_04]" )	--�y�L�y�z��ù�m�۪���O�覡
	SetFlag( OwnerID() , 548367 , 1 )	
end	
---------------------------------------426639�I�ߥN��ڪ��R-------------------------------------------------
function Lua_Z28_123140_speak()	--���߸���ܼ@��
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(1)" , 0 )	--�o�O�R�i��ǳƪ��I��
	end
end

function Lua_Z28_123142_speak()	--���ĻŹ�ܼ@��
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then 
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(4)" , 0 )	--"�o�O�R�i��ǳƪ��I��"
	end
end
	
function Lua_Z28_123099_speak()	--���[��ܼ@��
	local player = OwnerID()
	local npc=TargetID()
	LoadQuestOption( player )
	if
	( CheckCompleteQuest( player, 426679 )==true and
	CheckCompleteQuest( player, 426628 )==false and
	CheckFlag( player, 548432 )==false ) then
		AddSpeakOption( player, npc, "[SC_NPC123099SPEAK_01]", "Lua_Z28_123099_speak02", 0 )	--�r��w��
	elseif CheckAcceptQuest( player , 426632 ) == true and Countbodyitem( player , 242706 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426632_01]" ,"Lua_Z28_426639_speak(3)" , 0 )	--�ڦn���S������´���		
	else
		LoadQuestOption( player )
	end
end

function Lua_Z28_123099_speak02()
	local player=OwnerID()
	local npc=TargetID()
	SetFlag( player, 548432, 1 )
	SetSpeakDetail( player, "[SC_NPC123099SPEAK_02]" )
	AddSpeakOption( player, npc, "[SC_NPC123099SPEAK_03]", "Lua_Z28_123099_speak03", 0 )
end

function Lua_Z28_123099_speak03()
	local player=OwnerID()
	LoadQuestOption( player )
end

function Lua_Z28_426639_speak(sweet)
--	CloseSpeak( OwnerID() )
	Delbodyitem( OwnerID() , 243067 , 1 )
	if sweet == 1 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_02]" )	--���§A�A�ѤF��R�i�໡�A�̪�n���۷ǳƲ��媺�F��
		SetFlag( OwnerID() , 548424 , 1 )
	elseif sweet == 2 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_03]" )	--�n�n�Y�A���§A
		SetFlag( OwnerID() , 548425 , 1 )
	elseif sweet == 4 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426639_06]" )	--�̪񦣵۷ǳƲ���A�S�Ųz�R�i��A�ЧA���ڸ�R�i�໡���¡C
		SetFlag( OwnerID() , 548423 , 1 )
	elseif sweet == 3 then
		SetSpeakDetail( OwnerID() , "[SC_Z28Q426632_02]" )	--�A�Ѧb�o�̤F�A���h�a
		Givebodyitem( OwnerID() , 242706 , 1 )		
	end		
end

function Lua_Z28_123108_speak()	--�Ծ|�Ծ|��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_01]","Lua_Z28_426639_speak(2)" , 0 )	--�o�O�R�i��n���A���I��
	else
		LoadQuestOption( player )
	end
end
----------------------------------426640�Q�^���D�H------------------------------
function Lua_Z28_108201_Attackstart()
	local npc = OwnerID()
	local player = TargetID()
	local string = {[1]="[SC_Z28Q426640_01]",		--�}�a�۵M�|�S���F�ͮ�
			[2] = "[SC_Z28Q426640_02]",		--�A�]�O�}�a�۵M���a�H�ܡH
			[3] = "[SC_Z28Q426640_03]"}		--���i�H��̯}�a�۵M���Ū��H
	local randnum = DW_Rand( table.getn ( string ) )
	
	if CheckAcceptQuest( player , 426640 ) == true then
		NPCSay ( npc , string[RandNum] )
	end	
end	
--function Lua_Z28_108201_Attackstart()		
--	sleep( 30 )
--	Local Speak={}
--	Local Motion
--	Speak[1] = "hey , you"
--	Speak[2] = "ho,no"
--	Speak[3] = "be happy"
--	for i = 4 , 10 , 1 do
--		Speak[i] = "hi,hi"
--		sleep(1)
--	end
--
--	While 1  do 
--		Local j = rand(10) + 1
--		Motion = Speak[j]
--		NPCSay ( OwnerID() , Motion )
--		sleep(50+Rand(20))
--	end
--end
----------------------------------426641�f�z���v--------------------------
function Lua_Z28_123106speak()	--�g�i�E�ڵӹ�ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426641 ) == true and Countbodyitem( player , 243068 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426641_01]","Lua_Z28_123106speak2" , 0 )	--�����Ϊ��ȱi�n������
	end
end

function Lua_Z28_123106speak2()
	local player = OwnerID()
	LoadQuestOption( player )
	local Paper = { 548570 , 548571 , 548572 }	--�X�ʹ��߸��B�X�͸������B�X�ͪ��Ļ� �T����Ѫ��X��
	for i = 1 , table.getn(Paper) do 
		if Checkflag( player , Paper[i] ) == false then
			SetSpeakDetail( player , "[SC_Z28Q426641_02]" )	--�b���A�@�ǰO���Ϊ��ȱi
			Givebodyitem( player , 243068 , 1 )
		end
	end
end		

function Lua_Z28_243068_check()	--�ťկȱi�ˬdLUA
	local Player = OwnerID()
	local npc = targetID()
	local Elder = { [1]=123140 , [2]=123141 , [3]=123142 }	--���߸�, ������, ���ĻŤT�����
	local Flag = { [1]=548570 , [2]=548571 , [3]=548572 }	--�X�ʹ��߸��B�X�͸������B�X�ͪ��Ļ� �T����Ѫ��X��

	if CheckAcceptQuest( player , 426641 ) == true then
		if Checkflag( player , Flag[1] ) == false and ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[1] then 
			return true			
		elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[2] and Checkflag( Player , Flag[2] ) == false then
			return true
		elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[3] and Checkflag( Player , Flag[3] ) == false then
			return true
		else
		ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )	--�D���~�ϥΥؼ�			
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z28Q426641_03]" , 0 )	--�A�{�b�L�k�ϥγo�Ӫ��~
		return false
	end
end

function Lua_Z28_243068_use()	--�ťկȱi�ϥ�LUA
	local Player = OwnerID()
	local npc = TargetID()
	local Elder = { [1]=123141 , [2]=123140 , [3]=123142 }	--������, ���߸�, ���ĻŤT����� 
	local Motion = {[1] = ruFUSION_ACTORSTATE_BUFF_SP01 ,
			[2] = ruFUSION_MIME_CAST_SP01 ,
			[3] = ruFUSION_ACTORSTATE_CAST_SP01 }
	local RandNum = DW_Rand( table.getn ( Motion ) )
	PlayMotion( npc , Motion[RandNum] )
	givebodyitem( player , 243069 , 1 )
	AdjustFaceDir( npc , Player , 0 )
	NPCSay( npc , "[SC_Z28Q426641_04]" )	--�y�z�L�۱ھ��v�ǻ�
	Sleep(30)
	if ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[1] then	--������
		NPCSay( npc , "[SC_Z28Q426641_05]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_06]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_07]" )
		Sleep(10)
		setflag( player , 548571 , 1 )
	elseif ReadRoleValue( npc , EM_RoleValue_OrgID ) == Elder[2] then	--���߸�
		NPCSay( npc , "[SC_Z28Q426641_08]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_09]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_10]" )
		Sleep(10)
		setflag( player , 548570 , 1 )
	else									--���Ļ�
		NPCSay( npc , "[SC_Z28Q426641_11]" )
		Sleep(30)
		NPCSay( npc , "[SC_Z28Q426641_12]" )
		Sleep(25)
		NPCSay( npc , "[SC_Z28Q426641_13]" )
		Sleep(10)
		setflag( player , 548572 , 1 )
	end
	beginplot( player , "Lua_Z28_243068_use2" , 0 )
	Addbuff( npc , 623834 , 0 , 10 )
end

function Lua_Z28_243068_use2()
	Delbodyitem( OwnerID() , 243068 , 1 )
end
-------------------------426642�ϸѾ��v----------------------
function Lua_Z28_123105_speak()	--�R�i���ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426642 ) == true and Countbodyitem( player , 243070 )>0 then
		AddSpeakOption( player , player , "[SC_Z28Q426642_01]","Lua_Z28_123105_speak2(1)" , 0 )	--�A���D�o�i�ϬO�ƻ�N���?
	end
	if CheckAcceptQuest( player , 426639 ) == true and Countbodyitem( player , 243067 ) == 0 then
		AddSpeakOption( player , player , "[SC_Z28Q426639_04]","Lua_Z28_123105_speak2(2)" , 0 )	--�I�ߦn�������ΤF
	end		
end

function Lua_Z28_123105_speak2(num)
	local player = OwnerID()
--	closespeak( player )
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z28Q426642_02]" )	--�H�K�T�ӷ|�b����쪺����y�z
		SetFlag( player , 548440 , 1 )
	elseif num == 2 then
		local Cake = { [1]=548423 , [2]=548424 , [3]=548425 }
		for i = 1 , table.getn(Cake) do 
			if Checkflag( player , Cake[i] ) == false then
				SetSpeakDetail( player , "[SC_Z28Q426639_05]" )	--�ڳo���٦�...
				givebodyitem( player , 243067 , 1 )
			end
		end
	end
end	
-----------------------------426644�շҨS����²��------------------------
function Lua_jiyi_Z28_426644_Accept()	--�����ȫ�Ĳ�o�@��
	SetFlag( TargetID() , 548548 , 1 )	
end
--------------------------426645�ηR��@-----------------------------
function Lua_Z28_123110objend()	--��@����Ĳ�I��
	Addbuff( OwnerID() , 623290 , 0 , 10 )
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426645_01]" , 0 )	--�A��o�@�I����q�Ť�
	return true
end

function Lua_Z28_497432check()	--����q�Ť�P�_
	local player = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Fruit = { [1]=123109 , [2]=122888 }	--�������ʡB��������
	if Countbodyitem( player , 242075 ) < 5 then
		if TOrgID == Fruit[1] then	 
			return true
		elseif TOrgID == Fruit[2] then
			ScriptMessage( player , player , 1 , "[SC_Z28Q426645_02]" , 0 )	--�u��良�����ʨϥ�
			return false
		else 
			ScriptMessage( player , player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false
		end
	end		
end	

function Lua_Z28_623209use()	--����q�Ť�ޯ�ϥ�
	local Player = OwnerID()
	local Fruit = TargetID()	--�������n��
	ChangeObjID( Fruit , 122888 )	--���ܦ��������n��
	Givebodyitem( player , 242075 , 1 )				
end	

function Lua_Z28_122888()	--�������n�ʦۤv�ܦ^�����n��
	SetModeEx( OwnerID()  , EM_SetModeType_ShowRoleHead, false )	--�����Y����
	sleep(100)
	ChangeObjID( OwnerID() , 123109 )	--���ܦ��������n��
	SetModeEx( OwnerID()  , EM_SetModeType_ShowRoleHead, true )	--����Y����
end	
	
function Lua_jiyi_Z28_426645Complete()
	local player = TargetID()
	Cancelbuff( player , 623290 )
	SetFlag( player , 548439 , 1 )
end
----------------------------426646���n�Q�A��n��-----------------------
function Lua_Z28_123156speak()	--�h���h��ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426646 )==true and CountBodyItem( Player , 242939 )==0 then	
		AddSpeakOption( Player , NPC , "[SC_Z28Q426646_01]" , "Lua_Z28_123156speak2" , 0 )	--�ڨS���ݯN���פF
	elseif DW_CheckQuestAccept( "or" , Player , 426765 )==true or DW_CheckQuestAccept( "or" , Player , 426770 )==true and CountBodyItem( Player , 242939 )==0 then	--�e�U426765+����426770 ���~��M�V�h�V�n
		AddSpeakOption( Player , NPC , "[SC_Z28Q426646_01]" , "Lua_Z28_123156speak2" , 0 )	--�ڨS���ݯN���פF
	end
end

function Lua_Z28_123156speak2()
	LoadQuestOption( OwnerID() )
	local Num = 5 - CountBodyItem( OwnerID() , 241746 )
	if Num == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Z28Q426646_06]", 0 )	--�A�w�g�ƨ��N��
	else		
		for i = 1 , Num do
			Givebodyitem( OwnerID() , 242939 , 1 )
		end
	end
end	

function Lua_jiyi_Z28_121116touch()
	if CountBodyItem( OwnerID() , 242939 ) > 0 and CountBodyItem( OwnerID() , 241746 ) < 5 then	--242939 �ݯN�ͦ�241746�N�n����
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Z28Q426646_02]", 0 )	--�A���W�w�g�S�����~�F
		return false
	end
end

function Lua_jiyi_Z28_121116touch2()
	--���v��
	local num =Rand( 100 )
	--Say( OwnerID(),num)
	----1/3��o���~�G���\�C
	if num>= 30 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_03]" , 0 )	--�A���\�N�X����Ϊ���
		GiveBodyItem( OwnerID() , 241746 , 1 )
	----1/3�����C
	elseif num>= 15 then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_04]" , 0 )	--�N�L���F�����m�����F��...
	----1/3�L���C
	else
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426646_05]" , 0 )	--�S�N�����׽֭n�Y��?
	end
	DelBodyItem( OwnerID() , 242939 , 1 )
	return 1
end

function Lua_jiyi_Z28_426646Complete()
	local player = TargetID()
	SetFlag( player , 548546 , 1 )
end
-----------------------------426647�O�ְ��������H----------------------------
function Lua_Z28_426647accept()
	local Player = TargetID()
 	local NPC = OwnerID()
	Addbuff( Player , 622930 , 0 , 50 )
end

function Lua_Z28_426647complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	Cancelbuff( Player , 622930 )
end

function Lua_Z28_426647objbegin()
	local Player = OwnerID()
	if DW_CheckQuestAccept("or", Player , 426647 ) == true then	
		if Checkbuff( Player , 622930 ) == true then
			return true
		else
			return false
		end
	else		
		return false
	end
end
	
function Lua_Z28_426647objend()
	local player = OwnerID()
	DW_QietKillOne( 0 , 107935 )	--�R�R������107935�ǡA�e�̱�����̡A0�N�����a
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_Z28Q426647_01]" , 0 )	--���F�@�ǹ����᪺�}�L�A�S������i�ê��a��
	return true	
end			
-----------------------------426649�_�ǰ���-----------------------------
function Lua_jiyi_Z28_209987check()	--������G�ϥ��ˬd
	local Player = OwnerID()
	if CheckAcceptQuest( Player , 426649 ) == true then
		if Countbodyitem( Player , 209988 ) > 0 then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z28Q426649_01]", 0 ) 	--�A�S���������~
			return false
		end
	end
end

function Lua_jiyi_Z28_623291use()
	local player = OwnerID()
	DelBodyItem( player , 209988 , 1 )
--	DelBodyItem( player , 209987 , 1 )	 	
	GiveBodyItem( player , 243071 , 1 )
end
---------------------------------426650�C�ӫi�h���䳣�|���@���h�i----------------------------
function Lua_Z28_123159speak()	--���_�ܶ���ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( Player )
	if DW_CheckQuestAccept( "or" , Player , 426650 )==true and CountBodyItem( Player , 241745 )==0 and CountBodyItem( Player , 243072 ) == 0 then	
		AddSpeakOption( Player , NPC , "[SC_Z28Q426650_01]" , "Lua_Z28_123159speak2" , 0 )	--�ڧ��÷�˥�F...
	end
end

function Lua_Z28_123159speak2()
	local Player = OwnerID()
	SetSpeakDetail( player , "[SC_Z28Q426650_02]" )	--�٦n�ڦ����t�@���A���A�a
	givebodyitem( player , 241745 , 1 )
end		
	
function Lua_Z28_241745check()	--��÷�ϥ��ˬdLua
	local Player = OwnerID()
	local Tar = TargetID()
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local Rope = 107345
	if CheckAcceptQuest( player , 426650 ) == true then
		if Countbodyitem( player , 243072 ) > 0 then
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_06]" , 0 )	--�A�w�g�������h
			return false
		elseif TOrgID == Rope then 
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_05]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false
		end
	end
end		

function Lua_Z28_241745use()	--��÷�ϥ�Lua
	local player = OwnerID()
	local tar = TargetID()
	ScriptMessage( Player , Player , 1 , "[SC_Z28Q426650_03]" , 0 )	--�h�i���W�ò��÷�A���椧�U�A�A�{��N�h�i���w...
	GiveBodyItem( player , 243072 , 1 )
	Callplot( player , "Lua_Z28_241745use2" , player , tar )
end

function Lua_Z28_241745use2( player , tar )
	local RoomID = ReadRoleValue( player , EM_RoleValue_RoomID)
	hide( tar )
	sleep(100)
	show( tar , RoomID )
--	AddToPartition( tar , RoomID )
end			
--���ȵ�����t
function Lua_jiyi_Z28_426650Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781360
 	local CliBuff = 623289	--��t�κt�����BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z28_426650Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function
    	else
		LoadQuestOption(Player)  
 	end 
end

function Lua_jiyi_Z28_426650Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122874 , Flag , 2 , 1 , 1 )     --���ͺt�� 
	ks_ActSetMode( Actor )
	Sleep(10) 
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	ScriptMessage( Player,Player, 1, "[SC_Z28Q426650_04]", 0 )	--�ݨ�h�i���ӭn�����ĩ_�ܶ��A�ĩ_�ܶ��~�o����h�F�@�j�B�A�h�i�X�ذk��...
	DW_MoveToFlag( Actor , Flag , 3 , 0 , 1 ) 
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end