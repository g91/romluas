-----------------------------426862 ���q------------------------------
function Lua_Z30_422656_Complete()	--���ȵ�����t�@��
	local Player = TargetID()
 	local NPC_Will = OwnerID()

	Setflag( Player , 548818 , 1 )
end

function Lua_Z30_121774_speak()	--�����Ԥh��ܼ@��
	local player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426862 ) == true and CheckFlag( player , 548811 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426862_02]","Lua_Z30_121774_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end
--500429 ���e�@��
function Lua_Z30_121774_speak2()
	local Player = OwnerID()
	local NPC = TargetID()
--	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )	--�O�b�����Ԥh���W��121771�º�
--	local PID = ReadRoleValue( Reg1 , EM_RoleValue_PID )	--�����t�}�l=0�}�l��t�A=1��t��
--	WriteRoleValue( Reg1 , EM_RoleValue_PID , 0 )	--�N�º���PID�ȼg��0
--	Yell( TargetID() ,"i'm target" , 3 )  
--	DebugMsg( 0 , 0 , "NPC="..NPC  )
	CloseSpeak( Player )
	Addbuff(Player , 500429 , 0 , 3 )
	sleep(10)
	SetFlag( Player , 548811 , 1 )
	Addbuff(Player , 620445 , 0 , -1 )	--Q426862�L����t
	SetPosByFlag( Player , 781382 , 0 )
	Cancelbuff( Player , 500429 )
--	Callplot( Reg1 , "Lua_jiyi_Cancelobj" , 121774 )
--	DelObj(NPC)	
--	ChangeZone( Player , 952 , 0 , 839.7 , -257.2 , 377.3 , 0 )
	sleep(10)
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426862_03]" , 0 )	--�A���G�Q�����ھԤh���w�a������u�@�K
end

function Lua_Z30_620445_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426862) == false then
 		 CancelBuff(Player, 620445)	--Q426862�L����t
 	end
end

function Lua_Z30_426862_Complete()
	local Player = TargetID()
 	local NPC_Will = OwnerID()
	Setflag( Player , 548818 , 0 )	--����Cklinent����X��
end
-------------------------426863 �T��i�J-----------------------
-------�������ȫ�h��
function Lua_jiyi_Z30_426863_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 504195
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)
 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot(NPC, "Lua_jiyi_Z30_426863_Accept2" , NPC, Player, CliBuff)    ----���t��function      
 	end 
end

function Lua_jiyi_Z30_426863_Accept2(NPC, Player, CliBuff)
	local SeachNpc = SearchRangeNPC( NPC , 100 )
	local OrgID = { 122574 , 122576 }	--�º��B�����ھԤh
	local WalkFlag = 781382
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	for i = 0 , table.getn(SeachNpc) do		
		if ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID[1] then
			Beginplot( SeachNpc[i] , "Lua_Z30_123295Walk" , 0 )
		elseif ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID[2] then
			Beginplot( SeachNpc[i] , "Lua_Z30_123296Walk" , 0 )
		end
	end
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
end

function Lua_Z30_123295Walk()
	local Will = OwnerID()
	local WalkFlag = 781382
	local New_NPC =  DW_CreateObjEX("obj", 123295 , Will )	--�ͦ��t���º�
	ks_ActSetMode( New_NPC )
--	NPCSAY(New_NPC, "i'm Will")
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( New_NPC , WalkFlag , 2 , 0 , 1)
	Sleep(10)
	DelObj(New_NPC)
end

function Lua_Z30_123296Walk()
	local Pali = OwnerID()
	local WalkFlag = 781382
	local New_Pali =  DW_CreateObjEX("obj", 123296 , Pali )	--�ͦ��t�������ھԤh
	ks_ActSetMode( New_Pali )
--	NPCSAY(New_Pali, "i'm Pali")
	WriteRoleValue(New_Pali , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( New_Pali , WalkFlag , 1 , 0 , 1)
	Sleep(10)
 	DelObj(New_Pali)
end		

function Lua_Z30_122577_speak()	--�º���ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426863 ) == true and CheckFlag( player , 548812 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426863_01]","Lua_Z30_122577_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end	

function Lua_Z30_122577_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426863_02]" )
	SetFlag( Player , 548812 , 1 )
end
--------------------------426864�ձ��H-------------------------------
function Lua_Z30_122575_touch()	--122575���K�۪�l�@��
	local Fire = OwnerID()
	SetPlot( Fire , "touch", "Lua_Z30_122575_touch2", 30 )	
end

function Lua_Z30_122575_touch2()	--122575���K�۰���@��
	local Player = OwnerID()
	local Fire = TargetID()
	if CheckAcceptQuest( Player , 426864 ) == true then
		if Countbodyitem( Player , 240767 ) >0 then
			SetPlot( Fire , "touch" , "" , 30 )	--����L�H�L�k�A�I�����K��
			CallPlot( Fire , "Lua_Z30_122575_touch3" , Fire , Player )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426864_01]" , 0 )	--�A�S���i�ϥΪ����~
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426864_02]" , 0 )	--�@�����q�����Y�A�W�����\�h�i�l������K
	end
end

function Lua_Z30_122575_touch3( Fire , Player )
	--���v��
	local num =Rand( 100 )
	----1/3��o���~�G���\�C
	if num>= 30 then
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_03]" , 0 )	--�A�Ӥߦa�N[240767]�i��[240768]�K
		GiveBodyItem( Player , 240768 , 1 )	--���@���į�
	----1/3�����C
	elseif num>= 15 then
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_04]" , 0 )	--�O�D�Ӥj�A[240767]���H�F�K
	----1/3�L���C
	else
		ScriptMessage( Player , Player , 2 , "[SC_Z30_Q426864_05]" , 0 )	--�O�D�Ӥp�A�S��k�ϥΡK
	end
	SetPlot( Fire , "touch", "Lua_Z30_122575_touch2", 30 )	
	DelBodyItem( Player , 240767 , 1 )
	return 1
end

function Lua_Z30_122571speak()	--���˪������Ԥh��ܼ@��
	local player = OwnerID()
	local BuffLv =  FN_CountBuffLevel( player , 503621 )	--�ˬd���a���WBUFF
	local Speak = {[1] = "[SC_Z30_Q426864_15]" ,
			[2] = "[SC_Z30_Q426864_16]" ,
			[3] = "[SC_Z30_Q426864_17]" ,
			[4] = "[SC_Z30_Q426864_18]" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	SetSpeakDetail( Player , Speak[RandNum] )
	if CheckAcceptQuest( player , 426864 ) == true and BuffLv >= 4 then
--		say( player , "BuffLv="..BuffLv )
		AddSpeakOption( player , player , "[SC_Z30_Q426864_06]","Lua_Z30_122571speak2(2)" , 0 )
	elseif CheckAcceptQuest( player , 426864 ) == true and BuffLv < 4 then
--		say( player , "BuffLv="..BuffLv )
		AddSpeakOption( player , player , "[SC_Z30_Q426864_06]","Lua_Z30_122571speak2(1)" , 0 )
	else
		SetSpeakDetail( Player , Speak[RandNum] )		
	end
end

function Lua_Z30_122571speak2(Num)	--���˪������Ԥh��ܼ@��
	local player = OwnerID()

	if Num == 1 then
		if Checkflag( player , 548813 ) == false and Checkbuff( TargetID() , 505190 ) == false then
			if Countbodyitem( player , 240768 ) > 0 then
				local Speak = {[1] = "[SC_Z30_Q426864_07]" ,
						[2] = "[SC_Z30_Q426864_08]" ,
						[3] = "[SC_Z30_Q426864_09]" }
				local RandNum = DW_Rand( table.getn ( Speak ) )
				SetSpeakDetail( player , Speak[RandNum] )
				DelBodyItem( player , 240768 , 1 )
				Addbuff( TargetID() , 505190 , 0 , 10 )				
				Addbuff( player , 503621 , 0 , -1 )
			else
				SetSpeakDetail( player , "[SC_Z30_Q426864_10]" )
			end				
		else
			SetSpeakDetail( player , "[SC_Z30_Q426864_11]" )
		end			
	elseif Num == 2 then
		Cancelbuff( player , 503621 )
		SetSpeakDetail( player , "[SC_Z30_Q426864_12]" )
		Setflag( player , 548813 , 1 )
	end
end

function Lua_Z30_121773_speak()	--���������ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckFlag( player , 548813 ) == true and CheckFlag( player , 548814 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426864_13]","Lua_Z30_121773_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_121773_speak2()
	local Player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426864_14]" )
	SetFlag( Player , 548814 , 1 )
end
--------------------------426865 �Ԫp-------------------------------
function Lua_Z30_121772_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426865 ) == true and CheckFlag( player , 548815 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426865_01]","Lua_Z30_121772_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_121772_speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426865_02]" )
	SetFlag( Player , 548815 , 1 )
end			
---------------------------426866 ���u-----------------------------------
function Lua_Z30_240769_check()	--���ťۨϥ��ˬd
	local Player = OwnerID()
	local Tar = TargetID()	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID)
	local TOrgID = ReadRoleValue( Tar , EM_RoleValue_OrgID )	--Ū���ؼЪ��~ID
	local Point = 122578	--�U���B
	if CheckAcceptQuest( player , 426866 ) == true then
		if TOrgID == Point then
			if Checkbuff( Tar , 503622 ) == false then
				return true
			else
				ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426866_01]" , 0 )	--��[122578]�w�g�U�N�a�D�`�����K
				return false
			end				
		else
			ScriptMessage( Player , Player , 1 , "[SC_2012BEER_POKI_SYSTEM_09]" , 0 )	--�t�Χi��"�D���ĥؼ�"
			return false
		end
	else
		return false
	end
end

function Lua_Z30_240769_use()	--���ťۨϥμ@��
	local Player = OwnerID()
	local Point = TargetID()
	Addbuff( Point , 503622 , 0 , 10 )	--���K�S��BUFF
	DW_QietKillOne( 0 , 107423 )	--�R�R������107423�ǡA�e�̱�����̡A0�N�����a		
	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426866_02]" , 0 )	--�A���Q�a�I�U[122578]�����K�K
end
-----------------------------------426867 ���h-------------------------------
-------�٥��ȫ��t
function Lua_jiyi_Z30_426867_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781382
 	local CliBuff = 623908	--��t�κt�����BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z30_426867_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function
 	end 
end

function Lua_jiyi_Z30_426867_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122579 , Flag , 3 , 1 , 0 )     --�b3���X�в��ͺt�� 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	NPCSAY( Actor , "[SC_Z30_Q426867_01]" )
	sleep(20)
	NPCSAY( Actor , "[SC_Z30_Q426867_02]" )
	DW_MoveToFlag( Actor , Flag , 4 , 0 , 1 ) 
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end
--DW_MoveToFlag( ObjID , FlagObjID , FlagID, Range , Enable  )
--ObjID ���沾�ʪ���H
--FlagObjID �X�l����Ʈw�s��
--FlagID �X�l�s��
--Range �üƨM�w���ʨ�w�I���d��
--Enable  0�A������movotoflag   1�A����movetoflag
--------------------------------------426868 ���ۼv�T-----------------------------------
function Lua_Z30_122572_speak()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426868 ) == true and CheckFlag( player , 548816 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426868_01]","Lua_Z30_122572_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_122572_speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426868_02]" )
	SetFlag( Player , 548816 , 1 )
end

function Lua_Z30_426868_ChickobjBegin()
	local player = OwnerID()
	local stone = TargetID()

	if DW_CheckQuestAccept("or", player , 426868 ) == true then	
		if Checkflag( Player , 548816 ) == true then
			return true
		else
			ScriptMessage( Player,Player, 1, "[SC_Z30_Q426868_03]", 0 ) 	--���G�O�Y�ت��~���H���A�ݰ_�Ӧ��Q���N�L������
			return false
		end
	else		
		ScriptMessage( Player,Player, 1, "[SC_Z30_Q426868_03]", 0 ) 	--���G�O�Y�ت��~���H���A�ݰ_�Ӧ��Q���N�L������
		return false
	end
end
------------------------------------------426869 �Z�Ʃԥ۹�-------------------------------------------
function Lua_Z30_123365_Touch()	--123365�@��B�I���@��
	local Machine = OwnerID()
	SetPlot( Machine , "touch", "Lua_Z30_123365_Touch2", 30 )
end

function Lua_Z30_123365_Touch2()
	local Player = OwnerID()
	local Machine = TargetID()
	local Num01 = ReadRoleValue( Machine , EM_RoleValue_Register1 )
	DW_CancelTypeBuff( 68 , Player )						--�����M�����A
	if DW_CheckQuestAccept( "or" , Player , 426869 ) == true and CountBodyItem( Player , 241086 ) > 0 then
		if Num01 == 0 then	----�P�_�Ѽƭ�
			WriteRoleValue( Machine , EM_RoleValue_Register1 , 999 )		--Register1�g��999�A�N�p��functuon��_��												
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_01]" , 0 )	--"�ЧQ�β��ʱ���ѵ���q���h��"					
			CallPlot( Machine , "Lua_Z30_123365_Count" , Machine , Player )	--�C��P�_Register1��
			if BeginCastBarEvent( Player , Machine , "[SC_Z30_Q426869_02]" , 80 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "Lua_Z30_123365_Touch3" ) ~= 1 then
									--"�n�̬�s����"											--�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player , Player , 1 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )	--����L�H�b�ϥγo�Ӿ���K
				ScriptMessage( Player , Player , 0 , "[SC_Z29Q426821_03]" , "0xffbf0b2b" )			
			end
		end
	elseif DW_CheckQuestAccept( "or" , Player , 426869 ) == true and CountBodyItem( Player , 241086 ) == 0 then
		ScriptMessage( Player, Player, 1 , "[SC_Z27Q426448_01]" , "0xffbf0b2b" )	--"�A�S���i�H�ϥΪ����~�K"
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )	--"�ϥα��󤣲ŦX�C"
		ScriptMessage( Player , Player , 0 , "[SC_Z24Q425567_01]" , "0xffbf0b2b" )
	end
end

function Lua_Z30_123365_Touch3( Player , CheckStatus )
	local Player = OwnerID()
	local Machine = TargetID()
	EndCastBar( Player , CheckStatus )
	WriteRoleValue( Machine , EM_RoleValue_Register1 , 0 )
	Sleep(10)
	local Num02 = ReadRoleValue( Machine , EM_RoleValue_Register2 )
	if ( CheckStatus ~= 0 ) then
		if Num02 <= 30 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_03]" , 0 )	--�Ť�O�q�����A�Z�Ʃԥ۹��S�������ܤ�
		elseif Num02 <= 50 then
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_04]" , 0 )	--�Ť�O�q�R���ѵ�
			Delbodyitem( Player , 241086 , 1 )
			SetFlag( Player , 548817 , 1 )
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426869_05]" , 0 )	--�@���ѵ��L�h���Ť�O�q�A�Ϧ����Z�Ʃԥ۹��h�F�X�D�����K
		end
	else
		EndCastBar( Player , CheckStatus )
	end
	WriteRoleValue( Machine , EM_RoleValue_Register2 , 0 )
end

function Lua_Z30_123365_Count( Machine , Player )
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
--�٥��ȫ��t
function Lua_jiyi_Z30_426869_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781382
 	local CliBuff = 623906	--��t�κt�����BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z30_426869_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function
 	end 
end

function Lua_jiyi_Z30_426869_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122569 , Flag , 6 , 1 , 0 )     --�b6���X�в��ͺt�� 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	NPCSAY( Actor , "[SC_Z30_Q426869_06]" )	--���s�A�A�̦b���U�Z�ƩԶܡH
	DW_MoveToFlag( Actor , Flag , 7 , 0 , 1 )	--����7���X��
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end
--------------------------------------426870 �{���@�}----------------------------------------
--function Lua_Z30_426870_Accept()	--���U���ȥͦ������x��
--	local Player = TargetID()
-- 	local NPC_Pali = OwnerID()
--	CallPlot( player , "Lua_jiyi_Round_0415" , NPC_Pali , 108503 , 5 , 50 , 0 )
--	-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|�B�إߪ���O�_����
--	ScriptMessage( Player , Player , 1 , "[SC_Z30_Q426870_01]" , 0 ) 	--�P���M�X�{�@�s[108503]�]��A�̡K
--end
-------------------------------------426871 �̲צ���-----------------------------------------
--���U���ȫ�º��]�X�h
function Lua_jiyi_Z30_426871_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623836
 	local Num = ReadRoleValue( NPC , EM_RoleValue_Register1 )

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 999 )          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot( NPC , "Lua_Z30_426871_Accept2" , NPC , Player , CliBuff )    ----���t��function      
 	end 
end

function Lua_Z30_426871_Accept2( NPC , Player , CliBuff )
	local SeachNpc = SearchRangeNPC( NPC , 100 )
	local OrgID = 122565	--�º�
	local WalkFlag = 781382
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	for i = 0 , table.getn(SeachNpc) do		
		if ReadRoleValue( SeachNpc[i] , EM_RoleValue_OrgID ) == OrgID then
			Beginplot( SeachNpc[i] , "Lua_Z30_426871_Accept3" , 0 )
		end
	end
 	CancelBuff( Player , CliBuff )
 	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 )
end

function Lua_Z30_426871_Accept3()
	local Will = OwnerID()
	local WalkFlag = 781382
	local New_NPC =  DW_CreateObjEX("obj", 122567 , Will )	--�ͦ��t���º�
	ks_ActSetMode( New_NPC )
	NPCSAY(New_NPC, "[SC_Z30_Q426871_01]")	--[$playername]�A�ڭֶ̧i�ӫǡI
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	DW_MoveToFlag( New_NPC , WalkFlag , 5 , 0 , 1)
	Sleep(10)
	DelObj(New_NPC)	
end

function Lua_Z30_122568_Speak()	--122568�º���ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426871 ) == true and CheckFlag( player , 548819 ) == false then
		AddSpeakOption( player , player , "[SC_Z30_Q426871_02]","Lua_Z30_122568_Speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z30_122568_Speak2()
	local player = OwnerID()
	CloseSpeak( Player )
	SetSpeakDetail( Player , "[SC_Z30_Q426871_03]" )	--(�º����������a�ۦb�a�W�K)�i�c�A�O�ɦ�X�w���O�q�ܱj�F�ܡH�ӫṊ̀��R�����`������A�u�O�H���ΪA�K
	SetFlag( Player , 548819 , 1 )
end			