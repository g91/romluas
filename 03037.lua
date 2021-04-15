---------------------------------------------------------------------Z27�G�m�ι�ܼ@��
function Lua_jiyi_Z27_STARKspeak()	--�v��J���s
	SetPlot(OwnerID(),"touch","Lua_jiyi_Z27_STARKspeak2",30)
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_jiyi_Z27_STARKspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")

	local Speak = {[1] = "[SC_Z28_STARK_SPEAK_01]" ,
			[2] = "[SC_Z28_STARK_SPEAK_02]" ,
			[3] = "[SC_Z28_STARK_SPEAK_03]" ,
			[4] = "[SC_Z28_STARK_SPEAK_04]" ,
			[5] = "[SC_Z28_STARK_SPEAK_05]" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end

function Lua_jiyi_Z27_FRANKspeak()	--�k���J���s
	SetPlot(OwnerID(),"touch","Lua_jiyi_Z27_FRANKspeak2",30)
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_jiyi_Z27_FRANKspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")

	local Speak = {[1] = "unmatched" ,
			[2] = "phenomenon" ,
			[3] = "temporary" ,
			[4] = "scale" ,
			[5] = "awareness" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end

function Lua_jiyi_Z27_ERICspeak()	--��O�J���s
	SetPlot(OwnerID(),"touch","Lua_jiyi_Z27_ERICspeak2",30)
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_jiyi_Z27_ERICspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")

	local Speak = {[1] = "gender" ,
			[2] = "doom" ,
			[3] = "physicist" ,
			[4] = "equation" ,
			[5] = "incredible" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end

function Lua_jiyi_Z27_OTHERspeak()	--���P���s
	SetPlot(OwnerID(),"touch","Lua_jiyi_Z27_OTHERspeak2",30)
	SetCursorType( OwnerID() , eCursor_Speak)
end
	 
function Lua_jiyi_Z27_OTHERspeak2()
--	local num = Rand(5)+1	
	AdjustFaceDir( TargetID(),OwnerID(),0)
--	NpcSay(TargetID(),"[SC_Z26M_TALK3_"..num.."]")

	local Speak = {[1] = "tons of" ,
			[2] = "bring up" ,
			[3] = "without doubt" ,
			[4] = "shed light on" ,
			[5] = "perparatory" }
	local RandNum = DW_Rand( table.getn ( Speak ) )
	NPCSay ( TargetID() , Speak[RandNum] )
end
			
Function Lua_jiyi_Z27_Speak()
	sleep( 30 )
	Local Speak={}
	Local Motion
	Speak[1] = ruFUSION_ACTORSTATE_EMOTE_ANGRY
	Speak[2] = ruFUSION_ACTORSTATE_EMOTE_LAUGH
	Speak[3] = ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE
	for i = 4 , 10 , 1 do
		Speak[i] = ruFUSION_ACTORSTATE_EMOTE_SPEAK
		sleep(1)
	end

	While 1  do 
		Local j = rand(10) + 1
		Motion = Speak[j]
		PlayMotion( OwnerID(),Motion )
		Sleep(30)
		PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT,ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(50+Rand(20))
	end
end
----------------------------------------------------z27�D�u�@��
-----------------------����H��------------------
function Lua_jiyi_Z27_426437_Accept()	--�����ȫ�Ĳ�o�@��
	local player = TargetID()
	SetFlag( player , 548362 , 1 )	
end
-------------------------426438���s���W�x------------------------------
function Lua_jiyi_Z27_426438_Complete()	--���ȵ���Ĳ�o�@��
	local player = TargetID()
	GiveBodyItem( player , 242954 , 1 )
	GiveBodyItem( player , 242955 , 1 )
	SetFlag( player , 548361 , 1 )
end		
------------------------426439���X�Y�B426441�ĤT�դO------------------------
function Lua_jiyi_Z27_122813speak()	--�u�֮���v�J�i��ܼ@��
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 426439 ) == true and CheckFlag( OwnerID() , 548358 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z27Q426439_01]","Lua_jiyi_Z27_426439speak(1)" , 0 )
	elseif CheckAcceptQuest( OwnerID() , 426441 ) == true then
		if CountBodyItem( OwnerID() , 242958 ) < 1 then
			AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z27Q426441_01]","Lua_jiyi_Z27_426441speak(1)" , 0 )
		end			
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z27_122814speak()	--�u�]�k�v�i�g��ܼ@��
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 426439 ) == true and CheckFlag( OwnerID() , 548359 ) == false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z27Q426439_02]","Lua_jiyi_Z27_426439speak(2)" , 0 )
	elseif CheckAcceptQuest( OwnerID() , 426441 ) == true then
		if CountBodyItem( OwnerID() , 242957 ) < 1 then
			AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z27Q426441_02]","Lua_jiyi_Z27_426441speak(2)" , 0 )
		end		
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z27_426439speak(num)
	local player = OwnerID()
	CloseSpeak( player )
	if num == 1 then
		SetSpeakDetail( player , "[SC_Z27Q426439_03]" )
		DelBodyItem( player , 242954 , 1 ) 
		SetFlag( player , 548358 , 1 )		
	elseif num == 2 then
		SetSpeakDetail( player , "[SC_Z27Q426439_04]" )
		DelBodyItem( player , 242955 , 1 ) 
		SetFlag( player , 548359 , 1 )			
	else
		LoadQuestOption( player )
	end
end
-------------------------------426440���-----------------------------
function Lua_jiyi_Z27_122816speak()	--�º��D���_����ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426440 ) == true and CheckFlag( player , 548360 ) == false then
		AddSpeakOption( player , player , "[SC_Z27Q426440_01]","Lua_jiyi_Z27_426440speak" , 0 )
	elseif CheckAcceptQuest( player , 426441 ) == true then
		if CountBodyItem( player , 242960 ) < 1 then
			AddSpeakOption( player , player ,"[SC_Z27Q426441_04]","Lua_jiyi_Z27_426441speak(4)" , 0 )
		end		
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z27_426440speak()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426440_02]" )
	SetFlag( OwnerID() , 548360 , 1 )
end
---------------------------426441�ĤT�դO------------------------------
function Lua_jiyi_Z27_122856speak()	--�u�D��v���J��ܼ@��
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 426441 ) == true then
		if CountBodyItem( OwnerID() , 242959 ) < 1 then
			AddSpeakOption( OwnerID(),OwnerID(),"[SC_Z27Q426441_03]","Lua_jiyi_Z27_426441speak(3)" , 0 )
		end		
	else
		LoadQuestOption( OwnerID() )
	end
end

function Lua_jiyi_Z27_426441speak(seal)
	local player = OwnerID()
	CloseSpeak( player )
	if seal == 1 then	--�u�֮���v�J�i
		SetSpeakDetail( player , "[SC_Z27Q426441_05]" )
		GiveBodyItem( player , 242958 , 1 )		
	elseif seal == 2 then	--�u�]�k�v�i�g
		SetSpeakDetail( player , "[SC_Z27Q426441_06]" )
		GiveBodyItem( player , 242957 , 1 )
	elseif seal == 3 then	--�u�D��v���J
		SetSpeakDetail( player , "[SC_Z27Q426441_07]" )
		GiveBodyItem( player , 242959 , 1 )
	elseif seal == 4 then	--�º��D���_��
		SetSpeakDetail( player , "[SC_Z27Q426441_08]" )
		GiveBodyItem( player , 242960 , 1 )			
	else
		LoadQuestOption( player )
	end
end
------------------------426443�q�{������---------------------------
function Lua_Z27_122818_speak()	--�_�X��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426443 ) == true and CheckFlag( player , 548364 ) == false then
		AddSpeakOption( player , player , "[SC_Z27Q426443_01]","Lua_Z27_122818_speak2" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_Z27_122818_speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426443_02]" )
	SetFlag( OwnerID() , 548364 , 1 )
end
-------------------------426444�k�X�T�����Q�L----------------------------
-------���ȵ����h��
function Lua_jiyi_Z27_426444_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623906
	local Flag = 781340
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot(NPC, "Lua_jiyi_Z27_426444_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function      
 	end 
end

function Lua_jiyi_Z27_426444_Complete2(NPC , Player , Flag , CliBuff)
	local New_NPC = Lua_DW_CreateObj("flag" , 122820 , Flag , 4 , 1 , 0 )     --���ͺt�� 
--	local New_NPC =  DW_CreateObjEX("obj", 122820 , NPC) ----�ͦ��t��
-- 	local WalkFlag = 781340
--	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
 	Sleep(10)
	NPCSAY(New_NPC, "[SC_Z27Q426444_01]")
	sleep(25)
	NPCSAY(New_NPC, "[SC_Z27Q426444_02]")	  
--	Hide(NPC)
 	DW_MoveToFlag( New_NPC , Flag , 0 , 0 , 1 )
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
--	show( NPC , RoomID )
end

function Lua_jiyi_Z27_426444_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426444) == false then
 		 CancelBuff(Player, 623906)
 	end
end
-------------------------426445���_���F��----------------------------
-------�������ȫ�h��
function Lua_jiyi_Z27_426445_Accept()
	local Player = TargetID()
 	local NPC = OwnerID()
 	local CliBuff = 623907
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
 		 WriteRoleValue(NPC, EM_RoleValue_Register1,999)          
 	 	AddBuff( Player, CliBuff , 0 , 15 )
 	 	CallPlot(NPC, "Lua_jiyi_Z27_426445_Accept2" , NPC, Player, CliBuff)    ----���t��function      
 	end 
end

function Lua_jiyi_Z27_426445_Accept2(NPC, Player, CliBuff)
	local New_NPC =  DW_CreateObjEX("obj", 122871 , NPC) ----�ͦ��t��
 	local WalkFlag = 781340
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
 	ks_ActSetMode( New_NPC )
	WriteRoleValue(New_NPC , EM_RoleValue_IsWalk , 0)
	NPCSAY(New_NPC, "[SC_Z27Q426445_01]")  
--	Hide(NPC)
 	Sleep(10)
 	DW_MoveToFlag( New_NPC , WalkFlag , 1 , 0 , 1)
 	Sleep(10)
 	DelObj(New_NPC)
 	CancelBuff(Player, CliBuff)
 	WriteRoleValue(NPC, EM_RoleValue_Register1,0)
--	show( NPC , RoomID )
end

function Lua_jiyi_Z27_426445_Delete()
 	local Player = OwnerID()

 	if DW_CheckQuestAccept("or",Player, 426445) == false then
 		 CancelBuff(Player, 623906)
 	end
end
-------------���ȵ����A426445�_�X�]�i��
function Lua_jiyi_Z27_426445_Complete()
	local Player = TargetID()
 	local NPC = OwnerID()
	local Flag = 781340
 	local CliBuff = 623908	--��t�κt�����BUFF
 	local Num = ReadRoleValue(NPC,EM_RoleValue_Register1)

 	if Num == 0 then          ----�p�G�Ȧs�Ȭ�0
		AddBuff( Player , CliBuff , 0 , 10 )
 --		 WriteRoleValue(NPC, EM_RoleValue_Register1,999) 
 	 	CallPlot( NPC , "Lua_jiyi_Z27_426445_Complete2" , NPC , Player , Flag , CliBuff )    ----���t��function
    	else
		LoadQuestOption(Player)  
 	end 
end

function Lua_jiyi_Z27_426445_Complete2( NPC , Player , Flag , CliBuff) 
	WriteRoleValue(NPC, EM_RoleValue_Register1,999)   
	local Actor = Lua_DW_CreateObj("flag" , 122872 , Flag , 2 , 1 , 0 )     --���ͺt�� 
	ks_ActSetMode( Actor )
 	WriteRoleValue( Actor , EM_RoleValue_IsWalk , 0 ) 
	Sleep(10) 
	Yell( Actor , "[SC_Z27Q426445_02]" ,  1 )      
	DW_MoveToFlag( Actor , Flag , 3 , 0 , 1 ) 
	Sleep(10)	
	DelObj(Actor) 
	CancelBuff( Player , CliBuff )      
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 0 ) 
end
------------------------426446�~��e�i---------------------------
function Lua_Z27_122890_speak()
	LoadQuestOption( OwnerID() )
	if DW_CheckQuestAccept("or",OwnerID(),426446)==true and
		CountBodyItem(OwnerID() , 242963 ) > 0 and
		CheckFlag( OwnerID() , 548365 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_Z27Q426446_01]","Lua_Z27_122890_speak2" , 0 )
	else
		LoadQuestOption( OwnerID() )		
	end
end

function Lua_Z27_122890_speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426446_02]" )
	SetFlag( OwnerID() , 548365 , 1 )
end

function Lua_Z27_122891speak()	--�_�X���s���H�@��
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak( Player )
	if DW_CheckQuestAccept("or",Player,426446)==true and CountBodyItem(Player, 242963)==0 then
		SetSpeakDetail( Player , "[SC_Z27Q426446_03]" )		
		AddSpeakOption(Player,NPC, "[SC_Z27Q426446_04]", "Lua_Z27_122891speak2", 0 )
	else
		LoadQuestOption( Player )			
	end	
end

function Lua_Z27_122891speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426446_05]" )	
	GiveBodyItem( OwnerID() , 242963 , 1 )	
end
-----------------------------------------------------------------------------------------------�H�U�A��u����
--------------------------426448 �^�Ъ����D-------------------------
function Lua_Z27_242975_check()	--�������ˬdLUA
	local Player = OwnerID()
	local item = { 242974 , 242975 , 242977 }	--���סB�����ۡB������2

	if CheckAcceptQuest( player , 426448 ) == true and 
		CountBodyItem( player , item[1] ) > 0 and
		CountBodyItem(player , item[2] ) > 0 then
		return true
	elseif CheckAcceptQuest( player , 426448 ) == true and CountBodyItem( player , item[3] ) >0 then
		return true	
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z27Q426448_01]" , 0 )
		return false
	end
end

function Lua_Z27_242975_use()	--�����ۨϥ�LUA
	local Player = OwnerID()
	local fire = DW_CreateObjEX("obj", 120223 , Player )
	SetModeEx( fire , EM_SetModeType_Show , true ) --���
	SetModeEx( fire  , EM_SetModeType_Strikback, false )--����
	SetModeEx( fire  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( fire  , EM_SetModeType_Mark, true )--�аO
	SetModeEx( fire  , EM_SetModeType_Move, false )--����
	SetModeEx( fire  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( fire  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( fire  , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( fire  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( fire  , EM_SetModeType_Strikback, false )--����
	SetModeEx( fire  , EM_SetModeType_Obstruct, false )--����
	SetModeEx( fire , EM_SetModeType_Gravity , true )--���O
	AddToPartition( fire , 0 )
end

function Lua_Z27_242975_use2(player)
	DelBodyItem( player , 242975 , 1 )
	DelBodyItem( player , 242977 , 1 )
	Sleep(90)
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_Z27Q426448_02]" , C_SYSTEM )		
--	UseItemDestroy()   	
	DelObj(OwnerID())
end

function Lua_Z27_120223_Touch()		--���諸�IĲ�@��
	local Fire = OwnerID()
--	SetCursorType( Fire , 23)							----�����I�����ϥ�
	SetPlot( Fire, "touch", "Lua_Z27_120223_Touch_02", 30 )
end

function Lua_Z27_120223_Touch_02()
	local Player = OwnerID()
	local Fire = TargetID()
	local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)
	DW_CancelTypeBuff(68,Player)						----�����M�����A
	if DW_CheckQuestAccept("or",Player,426448)==true	and		--�p�G����ŦX
	CountBodyItem(Player, 242974)>0					and
	CountBodyItem(Player, 242974)<6					then
		if	Num01==0					then
								----�P�_�Ѽ�
			WriteRoleValue(Fire , EM_RoleValue_Register1 , 999)
								----�N�p��functuon��_��									
			ScriptMessage( Player , Player, 1,"[SC_Z26Q426168_06]", 0 )
								----�Q�β��ʱ������
			CallPlot(Fire,"Lua_Z27_120223_Count",Fire,Player)

			if 	BeginCastBarEvent( Player, Fire ,"[SC_Z27Q426448_03]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "Lua_Z27_120223_Touch_03" ) ~= 1 then
										----�P�_�I�������~���S���Q��w�A~=1��ܪ��~�Q�H��w
				ScriptMessage( Player, Player, 1,"[SC_Z26Q426168_04]", "0xffbf0b2b" )
				ScriptMessage( Player, Player, 0,"[SC_Z26Q426168_04]", "0xffbf0b2b" )			
			end
		end
	elseif DW_CheckQuestAccept("or",Player,426448)==true and CountBodyItem(Player, 242974) == 0 then
		ScriptMessage( Player, Player, 1,"[SC_Z27Q426448_01]", "0xffbf0b2b" )
	else
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
		ScriptMessage( Player, Player, 0,"[SC_Z24Q425567_01]", "0xffbf0b2b" )
	end
end

function Lua_Z27_120223_Touch_03(Player, CheckStatus)
	local Player = OwnerID()
	local Fire = TargetID()
	EndCastBar( Player, CheckStatus)
	WriteRoleValue(Fire , EM_RoleValue_Register1 , 0)
	Sleep(10)
	local Num02=ReadRoleValue(Fire,EM_RoleValue_Register2)
	if( CheckStatus ~= 0 ) then
		if Num02 <= 30 then
			ScriptMessage( Player, Player, 1,"[SC_Z27Q426448_04]", 0 )
			DelBodyItem(Player, 242974,1)
		elseif Num02 <=50 then
			ScriptMessage( Player, Player, 1,"[SC_Z27Q426448_05]", 0 )
			DelBodyItem(Player, 242974,1)
			GiveBodyItem(Player,242976,1)
		else
			ScriptMessage( Player, Player, 1,"[SC_Z27Q426448_08]", 0 )
			DelBodyItem(Player, 242974,1)
		end
	else
		EndCastBar( Player, CheckStatus)
	end
	WriteRoleValue(Fire,EM_RoleValue_Register2,0)
end

function Lua_Z27_120223_Count(Fire, Player)
	for i=1,80,1 do
		local Num01=ReadRoleValue(Fire,EM_RoleValue_Register1)
		if Num01==0 then
			return
		end
		Sleep(1)
		local y=i%10					----�C10�]1��^�@���P�_�A�@8��						
			if y==0 then
				WriteRoleValue(Fire,EM_RoleValue_Register2,i)
			end
		--Say(NPC,y..","..i)
	end
	return
end

function Lua_jiyi_Z27426448_Retake()		--���s����
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426448)==true then	
		if CountBodyItem(Player, 242974)==0 and CountBodyItem(Player, 242976)<5 then
			AddSpeakOption(Player,NPC, "[SC_Z27Q426448_06]", "Lua_jiyi_Z27426448_Retake2(1)", 0 )
	--	elseif CountBodyItem(Player, 242975)==0 and CountBodyItem(Player, 242976)<5 then
	--		AddSpeakOption(Player,NPC, "[SC_Z27Q426448_07]", "Lua_jiyi_Z27426448_Retake2(2)", 0 )
		end
	end
end

function Lua_jiyi_Z27426448_Retake2(item)
	local Player = OwnerID()
	CloseSpeak(Player)
	local Num = 5-CountBodyItem(Player, 242976)
	for i = 1, Num do
		if item == 1 then
			GiveBodyItem(Player, 242974 , 1 )
		elseif item == 2 then
			GiveBodyItem(Player, 242977 , 1 )
		end
	end		
end
--------------------------------426450 ������ù�L-------------------------------------
function Lua_jiyi_Z27_122884speak()	--�F������ܼ@��
	local Player = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(Player)
	if DW_CheckQuestAccept("or",Player,426450)==true then
		if CountBodyItem(Player, 242979)==0 then
			SetSpeakDetail( Player , "[SC_Z27Q426450_03]" )			
			AddSpeakOption(Player,NPC, "[SC_Z27Q426450_04]", "Lua_jiyi_Z27_122884speak2", 0 )		
		end
	end	
end

function Lua_jiyi_Z27_122884speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426450_05]" )	
	GiveBodyItem( OwnerID() , 242979 , 1 )	
end

function Lua_jiyi_Z27_122885speak()	--�}�ª��c�l��ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player , 426450 ) == true and CheckFlag( player , 548363 ) == false then
		AddSpeakOption( player , player , "[SC_Z27Q426450_01]","Lua_jiyi_Z27_426450speak" , 0 )
	else
		LoadQuestOption( player )
	end
end

function Lua_jiyi_Z27_426450speak()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426450_02]" )
	SetFlag( OwnerID() , 548363 , 1 )
end

function Lua_Z27_242979_check()	--ù�L�ˬdLUA
	local Player = OwnerID()
	local Num01 = ReadRoleValue( Player , EM_RoleValue_Register1 )
	if DW_CheckMap( Player , 701 )==true then	--�s�z�l�W
--		DW_CheckMap( Player , 721 )==true then	--�n����
		if Num01 == 0 then
			if CheckAcceptQuest( Player , 426450 ) == true then
			--	Say(player , "Num01="..Num01)	
				return true
			end
		else
		--	Say(player , "Num01="..Num01)
			return false
		end
	else
		ScriptMessage( Player,Player, 1, "[SC_DAN_111700_37]", 0 ) 	--�A�L�k�b���ϰ�ϥθӪ��~
		return false
	end
end

function Lua_Z27_242979_use()
	local Player = OwnerID()	
	local Compass = DW_CreateObjEX("obj", 120349 , Player )
	SetModeEx( Compass , EM_SetModeType_Show , true ) --���
	SetModeEx( Compass  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Compass  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Compass  , EM_SetModeType_Mark, true )--�аO
	SetModeEx( Compass  , EM_SetModeType_Move, true )--����
	SetModeEx( Compass  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Compass  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( Compass  , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Compass  , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( Compass  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Compass  , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Compass , EM_SetModeType_Gravity , false )--���O
	AddToPartition( Compass , 0 )
	WriteRoleValue( Player , EM_RoleValue_Register1 , 99 )
	local Num01 = ReadRoleValue( Player , EM_RoleValue_Register1 )
--	Say(Player , "Num99="..Num01)
--	WriteRoleValue( Compass , EM_RoleValue_IsWalk , 1 )
	CallPlot( player , "Lua_Z27_242979_use2" , player , Compass )
end

function Lua_Z27_242979_use2( Player , Compass )
--	local Num01 = ReadRoleValue( Player , EM_RoleValue_Register1 )		
	local flag = 781340
	local FlagX = GetMoveFlagValue( flag , 5 , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( flag , 5 , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( flag , 5 , EM_RoleValue_Z )	
	WriteRoleValue( Compass , EM_RoleValue_IsWalk , 1 )
	MoveDirect( Compass , FlagX , FlagY , FlagZ )
	sleep(30)
	DelObj( Compass )
	WriteRoleValue( Player , EM_RoleValue_Register1 , 0 )
	local Num01 = ReadRoleValue( Player , EM_RoleValue_Register1 )
--	Say(Player , "Num00="..Num01)	
end

function Lua_Z27_426450_Complete()
	local player = TargetID()
	WriteRoleValue( Player , EM_RoleValue_Register1 , 0 )
end	
-----------------------------426451�H������-----------------------------
function Lua_Z27_122886_Retake()	--���s����
	local Player = OwnerID()
	local NPC = TargetID()
	CloseSpeak(Player)
	if DW_CheckQuestAccept("or",Player,426451)==true and 
		CountBodyItem(Player, 242982)== 0 and 
		CountBodyItem(Player, 242981)== 0 and 
		CountBodyItem(Player, 242983)== 0  then
		CloseSpeak(Player)
		SetSpeakDetail( Player , "[SC_Z27Q426451_10]" )
		AddSpeakOption( Player , NPC , "[SC_Z27Q426451_11]" , "Lua_Z27_122886_Retake2" , 0 )
	else
		LoadQuestOption(Player)
	end
end

function Lua_Z27_122886_Retake2()
	local Player = OwnerID()
	CloseSpeak(Player)
	GiveBodyItem(Player, 242982, 1)
end

function Lua_Z27_122887_speak()	--�ڥ��F��ܼ@��
	local player = OwnerID()
	CloseSpeak( player )	
	if CheckAcceptQuest( player , 426451 ) == true then
		if CountBodyItem( player , 242983 ) > 0 then
			LoadQuestOption( player )
			AddSpeakOption( player , player , "[SC_Z27Q426451_01]","Lua_Z27_122887_speak2" , 0 )
		else
			SetSpeakDetail( player , "[SC_Z27Q426451_05]" )			
		end
	else
		LoadQuestOption( player )
	end
end

function Lua_Z27_122887_speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426451_02]" )
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_Z27Q426451_03]","Lua_Z27_122887_speak3" , 0 )
end	

function Lua_Z27_122887_speak3()
	CloseSpeak( OwnerID() )
	DelBodyItem( OwnerID() , 242983 , 1 )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426451_04]" )	
	GiveBodyItem( OwnerID() , 242981 , 1 )
end

function Lua_Z27_122812_speak()	--�M�ڡD�`����ܼ@��
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckFlag( player , 548361 ) == true then
		if CountBodyItem( player , 242955 ) == 0 then
			AddSpeakOption( Player , Player , "[SC_Z27Q426438_01]" , "Lua_Z27_548361_speak(1)" , 0 )	--���ӡK�ڤ��p�ߧ�ݦ������˥�F�K
		elseif CountBodyItem( player , 242954 ) == 0 then
			AddSpeakOption( Player , Player , "[SC_Z27Q426438_02]" , "Lua_Z27_548361_speak(2)" , 0 )	--�ڧ�����s�ܱ��F�A�i�H�A���ڤ@�ǶܡH
		end				
	elseif CheckAcceptQuest( player , 426451 ) == true then
		if CountBodyItem( player , 242982 ) > 0 then
			AddSpeakOption( player , player , "[SC_Z27Q426451_06]","Lua_Z27_122812_speak2" , 0 )
		else
			LoadQuestOption( player )			
		end
	else
		LoadQuestOption( player )
	end
end

function Lua_Z27_548361_speak(Retake)	--���L426438���s���W�x��p�G����Ȫ��~�R���N����o�q��ܼ@��
	local player = OwnerID()
	CloseSpeak( player )
	if Retake == 1 then
		SetSpeakDetail( player , "[SC_Z27Q426438_03]" )	--�ݦ������O�ڮa���Ǯa���_�C�I
		GiveBodyItem( player , 242955 , 1 )
	elseif Retake == 2 then
		SetSpeakDetail( player , "[SC_Z27Q426438_04]" )	--�o�O�̫�@�����A�����s�A�֧⥦���n�I
		GiveBodyItem( player , 242954 , 1 )
	end
end

function Lua_Z27_122812_speak2()
	CloseSpeak( OwnerID() )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426451_07]" )
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_Z27Q426451_08]","Lua_Z27_122812_speak3" , 0 )
end

function Lua_Z27_122812_speak3()
	CloseSpeak( OwnerID() )
	DelBodyItem( OwnerID() , 242982 , 1 )
	SetSpeakDetail( OwnerID() , "[SC_Z27Q426451_09]" )	
	GiveBodyItem( OwnerID() , 242983 , 1 )
end