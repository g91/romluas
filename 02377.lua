function LuaS_424286_Accept()
	local player = TargetID()
	if	CheckCompleteQuest( player , 424234 ) == TRUE	then
		SetFlag ( player , 545060 , 1 )
	end
end

function LuaS_424241_Accept()
	local player = TargetID()
	if	CheckCompleteQuest( player , 424242 ) == TRUE	then
		SetFlag ( player , 545057 , 1 )
		SetFlag ( player , 545058 , 1 )
	end
end

------------���u���H�N�R
function LuaS_424286_0()
	local player = OwnerID()
	if	CheckFlag ( player , 545077 ) == FALSE	and
		CheckAcceptQuest( player , 424286 ) == true then
		SetSpeakDetail( player,"[SC_424286_0]")
		AddSpeakOption( player, TargetID(), "[SC_424286_1]" , "LuaS_424286_1", 0 )
	end
	LoadQuestOption( player )
end
	
function LuaS_424286_1()
	local player = OwnerID()
	local td = TargetID()

	if	ReadRoleValue( TD, EM_RoleValue_Register1 ) == 1 then
		ScriptMessage ( player , player , 0 , "[SC_422804]" , 0 )
		ScriptMessage ( player , player , 1 , "[SC_422804]" , 0 )
		return -1
	else
		WriteRoleValue( td, EM_RoleValue_Register1, 1 )
		SetSpeakDetail( player,"[SC_424286_2]")			---���M�A�ݰ_�Ӥ����x�H�A�֪��D�A��ڤW�O���O�x�H�H
		SetFlag( player , 545059 , 1 )
		CallPlot( td , "LuaS_424234_0" , player )
	end
end


function LuaS_424234_0( player )
	local	KP1
	local	KP2
	local	PE1
	local	PE2
	local	mar								--�t���Gkp2�Bpe2�Bmar

	if	CheckFlag ( player , 545059 ) == TRUE	then		--�T�{flag��}�l��t

		KP1 = LuaFunc_SearchNPCbyOrgID( player , 118377 , 200 )	--�w�q�u���H�@������m
		KP2 = Lua_DW_CreateObj( "obj" , 118338 , KP1 , 1 , 1 )		--�b�u���H�@�����a��إX�u���H�G��
		pe1 = LuaFunc_SearchNPCbyOrgID( player , 118345 , 200 )	--�w�q�عp���@������m
		pe2 = Lua_DW_CreateObj( "obj" , 118346 , pe1 , 1 , 1 )		--�b�عp���@�����a��إX�عp���G��
		Ach = Lua_DW_CreateObj( "flag" , 105857 , 780949 , 0 , 1 , 1 )	--�b�X��1�W�إX1�Ӱ���
		
		DelFromPartition( KP1 )
		DelFromPartition( PE1 )						--�u���H�@���B�عp���@������
		MoveToFlagEnabled( KP2 , false )
		MoveToFlagEnabled( pe2 , false )				--�u���H�G���B�عp���G�����ö]
		AdjustFaceDir( KP2 , Ach , 0 )
		AdjustFaceDir( Pe2 , Ach , 0 )					--�u���H�G���B�عp���G�����V����
		SetModeEx( Ach , EM_SetModeType_Fight , FALSE )

		Say( Ach , "[SC_424234_1]")					--�����h���I���ǫŤ`�̧ڭ̧��ɤ���F�A�n�Ķi���̤F�I
		DW_MoveToFlag( Ach , 780949 , 1 , 0 , 1 )			--���Ũ��V�X��2�A�B���ö]		
		SetDefIdleMotion( KP2, ruFUSION_ACTORSTATE_ATTACK_UNARMED)
		Say( KP2 , "[SC_424234_2]")					--ԣ�H���ڨƱ������h�A�{�b�S�_�X�s�����D�ӤF�I�H
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_MIME_EMOTE_BEG)
		Say( Ach , "[SC_424234_3]")					--���šG�ڰڡA��p���A�K�·ФF...... (�U��)
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_ACTORSTATE_ATTACK_UNARMED)	--���ťͮ�
		say( Ach , "[SC_424234_4]")
		Sleep(20)
		say( Ach , "[SC_424234_5]")
		Sleep(20)
		SetDefIdleMotion( Ach, ruFUSION_MIME_NONE)			--���Űʧ@����
		DW_MoveToFlag( Ach , 780949 , 0 , 0 , 1 )			--���Ũ��^�X��2�A�B���ö]
		
		DelObj( Ach )
		DelObj( Pe2 )
		DelObj( KP2 )							--�R���t��
		AddToPartition( KP1 , 0 )
		AddToPartition( Pe1 , 0 )					--����NPC�X�{
		WriteRoleValue( KP1 , EM_RoleValue_Register1 , 0 )
		AdjustFaceDir( KP1 , player , 0 )
		AdjustFaceDir( Pe1 , player , 0 )				--����NPC��V���a
		SetFlag( player , 545077 , 1)				--�t�������B��okeyitem 545077
	end
end

function LuaS_424234_completed()
	if	CheckCompleteQuest( TargetID() ,424234) == TRUE	then
		SetFlag( TargetID() , 545060 , 1 )
	end
end

------------�����_�D�c��
function LuaS_424236_00()
	local od = OwnerID()
	local td = TargetID()
	if	CheckAcceptQuest ( od , 424236 ) == TRUE	and
		CheckFlag (od , 545054 ) == FALSE		then
		SetFlag( od , 545124 , 1 )
		AddSpeakOption ( od , td , "[SC_424236_00]" , "LuaS_424236_01" , 0 )
	end
	LoadQuestOption( od )
end

function LuaS_424236_01()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_01]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_02]" , "LuaS_424236_03" , 0 )
		SetFlag ( od , 545052 , 1 )
	end
end

function LuaS_424236_03()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_03]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_04]" , "LuaS_424236_05" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_01" , 0 )
	end
end

function LuaS_424236_05()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_05]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_06]" , "LuaS_424236_07" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_03" , 0 )
		SetFlag ( od , 545053 , 1 )
	end
end

function LuaS_424236_07()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_07]" )
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		AddSpeakOption ( od , td , "[SC_424236_08]" , "LuaS_424236_09" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_05" , 0 )
	end
end

function LuaS_424236_09()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_09]" )
	SetFlag	( od , 544905 , 1)
	if	Checkflag ( od , 545054 ) == TRUE	then
		LuaS_424236_exit()
	else
		SetFlag (od ,544905 , 1 )
		AddSpeakOption ( od , td , "[SC_424236_10]" , "LuaS_424236_11" , 0 )
		AddSpeakOption ( od , td , "[SC_424236_BACK]" , "LuaS_424236_07" , 0 )
	end
end

function LuaS_424236_11()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_11] [SC_424236_ANYTHINGELSE]" )
	SetFlag ( od , 545054 , 1 )
	LuaS_424236_exit()
end

function LuaS_424236_questions()
	local od = OwnerID()
	local td = TargetID()
	SetSpeakDetail( od , "[SC_424236_QNA]" )
	AddSpeakOption ( od , td , "[SC_424236_WANNA] [SC_424236_00]" , "LuaS_424236_01" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_02]" , "LuaS_424236_03" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_04]" , "LuaS_424236_05" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_06]" , "LuaS_424236_07" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_08]" , "LuaS_424236_09" , 0 )
end

function LuaS_424236_quit()
	CloseSpeak( OwnerID() )
end

function LuaS_424236_exit()
	local od = OwnerID()
	local td = TargetID()
	AddSpeakOption ( od , td , "[SC_424236_QUESTIONS]" , "LuaS_424236_questions" , 0 )
	AddSpeakOption ( od , td , "[SC_424236_QUIT]" , "LuaS_424236_quit" , 0 )
end

--------------�ߩU��-----------
function LuaS_424249_OnClick()	-- �ˬd�O�_�i�ߩU��
	local od = OwnerID()
	local Bags = { [1]=240005 , [2]=240006 }			-- 1 = �ũU���U 2 = ���U�����U���U
	local DoneFlag = 545156

	if 	CountBodyItem( od ,Bags[1] ) == 0	and
		CountBodyItem( od ,Bags[2] ) == 0	then
		ScriptMessage( od , od , 1 , "[SC_424249_0]" , 0 )	--�A�S���U���U�˩U���A�^�h�M�����Q�աE����������U���U
		ScriptMessage( od , od , 0 , "[SC_424249_0]" , 0 )
		return -1

	elseif CheckFlag ( od, DoneFlag ) == TRUE	then
		DelBodyItem ( od , Bags[1] , 1 )
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od, Bags[2] , 1 )
		ScriptMessage( od , od , 1 , "[SC_424249_1]" , 0 )	--�A���U���U�w�g���F�A�񤣤F��h�U��
		ScriptMessage( od , od , 0 , "[SC_424249_1]" , 0 )
		return -1
	else
		return 1
	end
end

function LuaS_424249_ClearFlag()	-- �Nflag�M��
	local od = TargetID()
	local MomTable = { 545150 , 545151 , 545152 , 545153 , 545154 }
	for i = 1 , table.getn( MomTable ) do
		SetFlag( od , MomTable[i] , 0 )
	end
	SetFlag( od , 545156 , 0 )
end

function LuaS_424249_AfterClick()	-- Touch�@��
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118520] = 545150 ,		---- �U����table
				[118549] = 545151 ,
				[118550] = 545152 ,
				[118551] = 545153 ,
				[118552] = 545154	}
	local Bags = { [1]=240005 , [2]=240006 }
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
-------------------------��ųU�l�m�������˩U�����U�l------------------------------
	if	CountBodyItem ( od , Bags[1] ) > 0 then
		DelBodyItem ( od , Bags[1] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )	-- �A�� OO �˶i�U���U��
		ScriptMessage( od, od, 0,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od ,  MomTable[WhichOne] , 1)
		BeginPlot( od , "LuaS_424249_CheckFlags" , 0)
		return 1
	elseif	CountBodyItem ( od , Bags[2] ) > 0 then
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )	-- �A�� OO �˶i�U���U��
		ScriptMessage( od, od, 0,"[SC_424249_3][$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od ,  MomTable[WhichOne] , 1)
		BeginPlot( od , "LuaS_424249_CheckFlags" , 0)
		return 1
	end
end
----------------------------�P�_�Ҧ��U�����˧���o��--------------------------------
function LuaS_424249_CheckFlags()
	local od = OwnerID()
	local DoneFlag = 545156

	if	CheckFlag( od , 545150 )== true	and
		CheckFlag( od , 545151 )== true and
		CheckFlag( od , 545152 )== true and
		CheckFlag( od , 545153 )== true and
		CheckFlag( od , 545154 )== true	then
		if	CheckFlag( od , DoneFlag) == TRUE	then
			ScriptMessage( od , od , 1 , "[SC_424249_2]" , 0 )		--�A��P�D���U���M�z���F�A�V�����Q�աE��������^��
			ScriptMessage( od , od , 0 , "[SC_424249_2]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		else	ScriptMessage( od , od , 1 , "[SC_424249_2]" , 0 )
			ScriptMessage( od , od , 0 , "[SC_424249_2]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		end
	end
end

---------------�ڸ�����E���N�p����
function luaS_424241_0()
	local player = OwnerID()
	local creatrue = TargetID()

	if	CheckAcceptQuest( player , 424240 ) == TRUE	and
		CheckFlag( player , 545055 ) == FALSE	and
		CheckFlag( player , 545058 ) == FALSE	then
		SetSpeakDetail( player,"[SC_424241_2]")
		AddSpeakOption( player , creatrue , "[SC_424241_3]" , "luaS_424241_3" , 0)
	end
	LoadQuestOption( player )
end


function luaS_424241_3()
	local creatrue2 = TargetID()
	local od = OwnerID()

	SetSpeakDetail( od , "[SC_424241_4]" )
	SetFlag( od , 545055 , 1 )
	AddSpeakOption( od , creatrue2 , "[SC_424241_5]" , "luaS_424241_4" , 0)
end

function luaS_424241_4()
	local creatrue2 = TargetID()
	local od = OwnerID()

	SetSpeakDetail( od , "[SC_424241_6]" )
	SetFlag ( od , 545055 , 1)
	AddSpeakOption( od ,creatrue2 , "[SC_424241_7]" , "LuaS_424236_quit" , 0)
end

--�J�w����ù�E���N�p����
function luaS_424242_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( od , 424241) == TRUE	and
		CheckFlag ( od , 545057 ) == FALSE	and
		CountBodyItem ( od , 209595 ) == 1 	then
		AddSpeakOption( od , td , "[SC_424242_2]" , "LuaS_424242_1" , 0 )
	end
	LoadQuestOption( od )
end

function LuaS_424242_1()
	local od = OwnerID()
	local td = TargetID()

	SetSpeakDetail ( od , "[SC_424242_0]")
	AddSpeakOption( od , td , "[SC_424242_1]" , "luaS_424242_flag" , 0 )
end

function luaS_424242_flag()
	local od = OwnerID()

	SetFlag( od , 545057 , 1 )
	SetFlag( od , 545093 , 1 )
	DelBodyItem ( od , 209595 , 1 )
	CloseSpeak( od )
end

function luaS_424242_compeleted()
	SetFlag ( TargetID() , 545058 , 1)
end

--�u�z����O�Q�t���R��´
---���s
function LuaI_424243_01()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA01]" )
end

function LuaI_424243_02()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA02]" )
end

function LuaI_424243_03()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA03]" )
end

function LuaI_424243_04()
	CallPlot ( OwnerID() , "LuaI_424243_data" , "[SC_424243_DATA04]" )
end

function LuaI_424243_data( dataID )
	local od = OwnerID()

	ClearBorder( od )
	AddBorderPage( od, dataID )
	ShowBorder( od, 0, "[SC_424243_TLTTLE]", "ScriptBorder_Texture_Paper" )
end
---���s����

function LuaS_424242_AfterClick()	-- Touch�@��
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118285] = 240001 ,		---- ����table
				[118527] = 240002 ,
				[118528] = 240003 ,
				[118529] = 240004 ,	}
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
----------------------------�P�_Click���Ӫ���õ����۹��������---------------------
	if	CountBodyItem( od ,  MomTable[WhichOne] ) > 0	then
		ScriptMessage( od, od, 1,"[SC_424243_02]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_02]" , 0 )
		beginPlot( od , "LuaS_424242_DoneCheck" , 10 )
		--�o�Ӥ���̧䤣���L�٦���kŪ�������F	

	elseif	CountBodyItem( od ,  MomTable[WhichOne] ) < 1	then
		ScriptMessage( od, od, 1,"[SC_424243_00][$SETVAR1=["..WhichOne.."]][$SETVAR2=["..MomTable[WhichOne].."]]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_00][$SETVAR1=["..WhichOne.."]][$SETVAR2=["..MomTable[WhichOne].."]]" , 0 )
		GiveBodyItem( od ,  MomTable[WhichOne] , 1)
		beginPlot( od , "LuaS_424242_DoneCheck" , 10 )
		return 1
		--�A�b�o�� "����" �̧�� OO
	end
end

function LuaS_424242_DoneCheck()
	local DoneFlag = 545144
	local od = OwnerID()
----------------------------�P�_�Ҧ�����˧���o��--------------------------------
	if	CountBodyItem( od , 240001 )> 0	and
		CountBodyItem( od , 240002 )> 0	and
		CountBodyItem( od , 240003 )> 0	and
		CountBodyItem( od , 240004 )> 0	then

		if	CheckFlag( od , DoneFlag) == TRUE	then

			ScriptMessage( od , od , 1 , "[SC_424243_03]" , 0 )		--�q���f�ǨӼ���J���n��
			ScriptMessage( od , od , 0 , "[SC_424243_03]" , 0 )
			SetFlag( od , DoneFlag , 1 )

		else	ScriptMessage( od , od , 1 , "[SC_424243_03]" , 0 )
			ScriptMessage( od , od , 0 , "[SC_424243_03]" , 0 )
			SetFlag( od , DoneFlag , 1 )
		end
	end
end


function LuaS_424243_end()
	local Morick = OwnerID()
	local Player = TargetID()

	setFlag( Player , 545056 , 1)
	BeginPlot( Morick , "LuaS_424244_born", 0 )
end

function LuaS_424244_born()
	local Morick = OwnerID()
	local Morick2

	say ( Morick , "[SC_424244_01]" )			--���ݳo�Ǥ��ڥ��@�L�Y���A�٬O�i�h���ݦ��S���O���u���n�F
	Morick2 = Lua_DW_CreateObj ( "obj" , 118489 , Morick , 1, 1 )

	Sleep (20)
	say ( Morick2 , "[SC_424244_02]" )			--�A���h����L���ơA�p�G�ڳo�䦳����i�i�|�A�M�A�p���C
	DW_MoveToFlag( Morick2 , 780949 , 2 , 0 , 1 )


	DelObj(Morick2)

	WriteRoleValue( Morick, EM_RoleValue_Register1, 0 )
end

Function LuaS_Thiefting()
	local Morick = OwnerID()
	local DialogTable = {	[1] = "[SC_424244_03]" ,	--�٬O�u��o�������������Τl......
				[2] = "[SC_424244_04]" ,	--���o���S����Q�t�H
				[3] = "[SC_424244_05]" ,	--�i�c�A�u�d�U�@��U���A�S�b�I���Ϊ��u���C
				[4] = "[SC_424244_06]"	}	--�쩳�Q�t�O������H������o��h���̳����Q�t���r��......
	local DialogID = Rand(4)+1

	PlayMotionEX( Morick , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	say( Morick , DialogTable[DialogID] )
	sleep(30)
end

-----�϶˧L118585
function LuaS_424350_flag()
	local player = TargetID()
	if	CheckCompleteQuest( player , 425351 ) == TRUE	then
		SetFlag(player , 545201 , 1)
	end
	if	CheckCompleteQuest( player , 424357 ) == TRUE	then
		SetFlag(player , 545202, 1)
	end
	SetFlag(player , 545167 , 1)
end


function LuaS_118585()
	local player = OwnerID()
	local feifei = TargetID()

	if	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424354 ) == TRUE	and
		CountBodyItem( player , 240009 ) <5		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240009]" , "LuaS_118585_0" , 0 )

	elseif	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424355 ) == TRUE	and
		CountBodyItem( player , 240008 ) <1		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240008]" , "LuaS_118585_1" , 0  )

	elseif	CheckCompleteQuest( player , 424352 ) == FALSE	and
		CheckCompleteQuest( player , 424356 ) == TRUE	and
		CountBodyItem( player , 240018 ) <1		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240018]" , "LuaS_118585_2" , 0 )

	elseif	CheckCompleteQuest( player , 424408 ) == FALSE	and
		CheckCompleteQuest( player , 424410 ) == TRUE	and
		CountBodyItem( player , 240009 ) <5		then
		AddSpeakOption( player , feifei , "[SC_118585_0][240009]" , "LuaS_118585_0" , 0 )
	end
	LoadQuestOption( player )
end

function LuaS_118585_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" ) -- �u���A�S��k�A�o�����n�A�˥�F��I
	GiveBodyItem( player , 240009 , 5 )
end

function LuaS_118585_1()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240008 , 1 )
end

function LuaS_118585_2()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240018 , 1 )
end
-----------------------------------------------------------
function LuaS_118581()
	local player = OwnerID()
	local Nei = TargetID()

	if	CheckCompleteQuest( player , 424351 ) == FALSE	and
		CheckCompleteQuest( player , 424352 ) == TRUE	and
		CountBodyItem( player , 240010 ) <2		then
		AddSpeakOption( player , Nei , "[SC_118585_0][240010]" , "LuaS_118581_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118581_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118585_1]" )
	GiveBodyItem( player , 240010 , 2 )
end
-----------------------------------------------------------
function LuaS_118596()
	local player = OwnerID()
	local bopuraisa = TargetID()

	if	CheckCompleteQuest( player , 424357 ) == FALSE	and
		CheckCompleteQuest( player , 424358 ) == TRUE	and
		CountBodyItem( player , 240017 ) <2		then
		AddSpeakOption( player , bopuraisa , "[SC_118585_0][240017]" , "LuaS_118596_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118597()
	local player = OwnerID()
	local forio = TargetID()

	if	CheckCompleteQuest( player , 424358 ) == FALSE	and
		CheckCompleteQuest( player , 424359 ) == TRUE	and
		CountBodyItem( player , 240016 ) <1		then
		AddSpeakOption( player , forio , "[SC_118585_0][240016]" , "LuaS_118597_0" , 0 )
	end
	LoadQuestOption(player)
end

function LuaS_118596_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118596]" ) --  �o�����n�A�˥�F�I
	GiveBodyItem( player , 240017 , 2 )
end

function LuaS_118597_0()
	local player = OwnerID()

	SetSpeakDetail( player , "[SC_118596]" )
	GiveBodyItem( player , 240016 , 1 )
end
-----------------------------------------------------------

function LuaS_424351_touch( wichone , itemID )
	local od = OwnerID()
	local hurted = TargetID()
	local cured

	DW_QietKillOne ( 0 , wichone )
	DelBodyItem ( od , itemID , 1 )
	cured = Lua_DW_CreateObj( "obj" , ReadRoleValue ( hurted , EM_RoleValue_OrgID ) +2 , hurted , 1 , 1 )
	CallPlot( cured , "LuaS_424351_cured", od )
	return 1
end

function LuaS_424351_check( itemID )
	local od = OwnerID()

	if	CountBodyItem ( od , itemID ) == 0	then
		ScriptMessage ( od , od , 0 , "[SC_424351_0]" , 0 )
		ScriptMessage ( od , od , 1 , "[SC_424351_0]" , 0 )
		return -1
	end
	return 1
end

function LuaS_424351_cured( od )
	local cured = OwnerID()
	MoveToFlagEnabled ( cured , false)
	sleep(15)
	AdjustFaceDir ( cured , od , 0)
	Say ( cured , "[SC_423020_0]" )
	Sleep(85)
	DelObj(cured)
end

function LuaS_424365_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424366 ) == TRUE	then
		SetFlag ( player , 544579 , 1 )
	end

	if	CheckCompleteQuest( player , 424367 ) == TRUE	then
		SetFlag ( player , 544580 , 1 )
	end
	     
	if	CheckCompleteQuest( player , 424368 ) == TRUE	then
		SetFlag ( player , 544581 , 1 )
	end
end

function LuaS_424408_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424409 ) == TRUE	then
		SetFlag ( player , 545223 , 1 )
	end

	if	CheckCompleteQuest( player , 424410 ) == TRUE	then
		SetFlag ( player , 545224 , 1 )
	end
	     
	if	CheckCompleteQuest( player , 424411 ) == TRUE	then
		SetFlag ( player , 545225 , 1 )
	end
end

function LuaS_424350_accept()
	local player = TargetID()

	if	CheckCompleteQuest( player , 424351 ) == TRUE	then
		SetFlag ( player , 545201 , 1 )
	end

	if	CheckCompleteQuest( player , 424357 ) == TRUE	then
		SetFlag ( player , 545202 , 1 )
	end
end

function LuaS_424351_accept()
	SetFlag ( TargetID() , 545169 , 1 )
end

function LuaS_424351_end()
	SetFlag ( TargetID() , 545201 , 1 )
end

function LuaS_424357_accept()
	SetFlag ( TargetID() , 545170 , 1 )
end


function LuaS_424357_end()
	SetFlag ( TargetID() , 545202 , 1 )
end


function LuaS_424397_AfterClick()	-- Touch�@��
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[118285] = 240001 ,		---- ����table
				[118528] = 240003 ,
				[118529] = 240004 ,	}
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
----------------------------�P�_Click���Ӫ���õ����۹��������---------------------
	if	CountBodyItem( od ,  MomTable[WhichOne] ) > 0	then
		ScriptMessage( od, od, 1,"[SC_424243_02]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_02]" , 0 )
		--�o�Ӥ���̧䤣���L�٦���kŪ�������F	

	elseif	CountBodyItem( od ,  MomTable[WhichOne] ) < 1	then
		ScriptMessage( od, od, 1,"[SC_424243_00] ["..WhichOne.."] [SC_424243_01] ["..MomTable[WhichOne].."]" , 0 )
		ScriptMessage( od, od, 0,"[SC_424243_00] ["..WhichOne.."] [SC_424243_01] ["..MomTable[WhichOne].."]" , 0 )
		GiveBodyItem( od ,  MomTable[WhichOne] , 1)
		return 1
		--�A�b�o�� "����" �̧�� OO
	end
end

--------------��ӤH����
------------------�}��e
function LuaS_424247_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( od , 424247 ) == true			and		----�p�G�������ȥB
		CheckFlag( od , 544780 ) == false			and		----�S���o��ͧP����flag�B�B
		ReadRoleValue( od , EM_RoleValue_IsAttackMode )==0	then		----�ӤHNPC�å����X�����ʧ@�A�h

		if	ReadRoleValue( TD, EM_RoleValue_Register1 ) == 1 then
			ScriptMessage ( od , od , 0 , "[SC_422804]" , 0 )
			ScriptMessage ( od , od , 1 , "[SC_422804]" , 0 )
			return -1
		else
			AddSpeakOption( od , td , "[SC_424247_0]" , "LuaS_424247_1" , 0 )	----�W�[��ܿﶵ�G(�ʤ��L�I)
		end
	end

	LoadQuestOption ( od )
end

----------------�ǳƶ}��


function LuaS_424247_1()
	local od = OwnerID()
	local td = TargetID()
	local NewOne

	CloseSpeak( od )	
	AddBuff( od , 620376 , 1 , -1)						---���������Hclinet��buff
	WriteRoleValue( td, EM_RoleValue_Register1, 1 )

	NewOne = Lua_DW_CreateObj( "obj", 118471 , td , 1 , 1)			----�b��a�إX�s���ӤH�F�]
	SetModeEx( NewOne , EM_SetModeType_Strikback , false)				----�������B������
	SetModeEx( NewOne , EM_SetModeType_Move , false) 
	SetPlot( NewOne , "dead","LuaS_424247_undead" , 0 )				----�F�]�����N
	AddBuff( NewOne , 507210 , 0 , -1 )

	CallPlot( NewOne , "LuaS_424247_end" , td  , od)
	Say( NewOne , "[SC_424247_1]" )							----�ӤH�F�]�G�A�Q������I�H
end


-----------�H�U�����b�Ҥl�U
-----�P�_�Ҥl�ण���H
function LuaI_424247_0()
	local od = OwnerID()
	local td = TargetID()

	if	CheckAcceptQuest( td , 424247 ) == FALSE	and
		CheckFlag( td , 544780 ) == TRUE		then
		ScriptMessage( od , od , 0 , "[SC_424247_5]" , 0 )	----�A���ݭn���Ҥl���H
		ScriptMessage( od , od , 1 , "[SC_424247_5]" , 0 )	----�A���ݭn���Ҥl���H
		return false
	end

	if	ReadRoleValue( td , EM_RoleValue_OrgID ) ~= 118471	then
		ScriptMessage( od , od , 0 , "[SC_424247_6]" , 0 )	----�A�����H�K�å��H
		ScriptMessage( od , od , 1 , "[SC_424247_6]" , 0 )	----�A�����H�K�å��H
		return false
	end

	if	GetDistance( od , td ) > 50	then
		ScriptMessage( od , od , 0 , "[SC_424247_7]" , 0 )	----�A���Ҥl�������A������
		ScriptMessage( od , od , 1 , "[SC_424247_7]" , 0 )	----�A���Ҥl�������A������
		return false
	end

	if	ReadRoleValue( td , EM_RoleValue_Register ) > 0	then
		ScriptMessage( od , od , 0 , "[SC_424247_7]" , 0 )	----�A���Ҥl�������A������
		ScriptMessage( od , od , 1 , "[SC_424247_7]" , 0 )	----�A���Ҥl�������A������
		return false
	end

	return true
end


-----------�ˬd�}�󦸼� (check again)
function LuaI_424247_1()
	local BuffPos
	local BuffCount
	local td = TargetID()

	AddBuff( td , 509106 , 0 , 10 )								--�Wbuff�B���Įɶ���10��
	BuffPos = Lua_BuffPosSearch( td , 509106 )						--�OBuffPos���ˬd��H���W�O�_��Buff

	if	BuffPos~=-1	then								--�p�G�S���o��Buff�h
		BuffCount = BuffInfo( td , BuffPos , EM_BuffInfoType_Power )			--�}�l�ˬd����H���W���|�F�h�֦�Buff
----------�}��ĥ|��
		if	BuffCount > 5		then
			SetFlag( OwnerID() , 544780 , 1 )					--������Hflag
			PlayMotion( td , ruFUSION_ACTORSTATE_EMOTE_SURRENDER )			
			PlayMotion( td , ruFUSION_ACTORSTATE_EMOTE_BEG )
			Say( td, "[SC_424247_8]" )						----�ӤH�F�]�G�ڭ����N�O�F�A�O�A���F�I�I
			return
		end
----------�}��ĤT��
		if	BuffCount > 3		then
			Say( td , "[SC_424247_4]" )						--�ӤH�F�]�G�n�h�A���j�a���b����ݵۡB���Ӫ���L�I�H
			return
		end
----------�}��ĤG��
		if	BuffCount > 1		then
			Say( td , "[SC_424247_3]" )						--�ӤH�F�]�G����I�O���ڪ��y�A�ھa�y�Y�����ڡI
			return
		end
----------�}��Ĥ@��
		if	BuffCount >= 0		then
			Say( td , "[SC_424247_2]" )						--�ӤH�F�]�G�A�~�M�u�����ڡI�H
			return
		end
------�}�󵲧��A���u
	end
end
---------------�H�W�����b�Ҥl�U


-----�F�]��n�n�B�F�]�h��
function LuaS_424247_end( OldOne , player)

	sleep(100)
	DelObj( OwnerID() )
	CancelBuff( player , 620376)						---�������������Hclinet��buff
	WriteRoleValue( OldOne , EM_RoleValue_Register1, 0 )
end

----�F�]�����N(��F�]���`�ɱҰʦ�plot)
function LuaS_424247_undead()
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
	return false
end

----------���ȵ����B�����ͧPflag
function LuaS_424247_completed()
	local Player = TargetID()
	SetFlag( Player , 545071 , 1 )
end

function LuaS_424246_accpet()
	local Player = TargetID()
	if	CheckCompleteQuest( Player , 424247) == TRUE	then
		SetFlag( Player , 545071 , 1 )
	end

end

-----------------------------
---------------��ӤH���ȵ���

---------------------�Q�ڤ��o
Function LuaS_424248_118289()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545045 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_04" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545045 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_04" , 0 )
	End
	LoadQuestOption(od)
End

Function LuaS_424248_118291()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545061 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_05" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545061 ) == FALSE		and
		CountBodyItem ( od , 209596 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_05" , 0 )
	End
	LoadQuestOption(od)
End

Function LuaS_424248_118293()
	Local od = OwnerID()
	local td = TargetID()

	If	CheckAcceptQuest ( od , 424349 ) == TRUE	and
		CheckFlag( od , 545062 ) == FALSE		and
		CountBodyItem ( od , 209597 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_06" , 0 )

	elseif	CheckAcceptQuest ( od , 424248 ) == TRUE	And
		CheckFlag( od , 545062 ) == FALSE		and
		CountBodyItem ( od , 209597 ) > 0		Then
		AddSpeakOption ( od , td , "[SC_424248_3]" , "LuaS_424248_06" , 0 )

	End
	LoadQuestOption(od)
End

function LuaS_424248_04()
	Local od = OwnerID()

	DelBodyItem ( od , 209596 , 1 )
	SetSpeakDetail ( od , "[SC_424248_0]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545045 , 1 )
end

function LuaS_424248_05()
	Local od = OwnerID()

	delBodyItem ( od , 209596 , 1 )
	SetSpeakDetail ( od , "[SC_424248_1]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545061 , 1 )
end

function LuaS_424248_06()
	Local od = OwnerID()
	DelBodyItem ( od , 209597 , 1 )
	SetSpeakDetail ( od , "[SC_424248_2]" )
	BeginPlot( od , "LuaS_424248_Flag" , 0 )
	SetFlag ( od , 545062 , 1 )
end


Function LuaS_424248_Flag()
	Local od = OwnerID()

	if	CheckFlag( od , 545045 ) == TRUE		and
		CheckFlag( od , 545061 ) == TRUE		and
		CheckFlag( od , 545062 ) == TRUE		then
		SetFlag( od , 545094 , 1)
	end
end

function LuaS_424248_end()
	local td = TargetID()
	SetFlag ( td , 545045 , 0 )
	SetFlag ( td , 545061 , 0 )
	SetFlag ( td , 545062 , 0 )
end


-------------�e�Q�W��
function LuaI_240221()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_424248_SALT]")
	ShowBorder( OwnerID(), 0, "[SC_424248_TLTTLE]", "ScriptBorder_Texture_Paper" )
end

function LuaS_424358_flag()
	SetFlag( TargetID() , 545168 , 1)
end

------�h�����Ʋz
function LuaS_424408_flag()
	SetFlag ( TargetID() , 545226 , 1)
end

function LuaS_424408_00()
	SetFlag ( TargetID() , 545223 , 1 )
end

function LuaS_424408_01()
	SetFlag ( TargetID() , 545224 , 1 )
end

function LuaS_424408_02()
	SetFlag ( TargetID() , 545225 , 1 )
end

function LuaS_424408_end()
	SetFlag ( TargetID() , 545229 , 1 )
end