--422972�������ȫ�	�X�l�G780481	1-3

function LuaS_422972_Complete()
	if (CheckCompleteQuest(TargetID(),422971)==true )and( CheckCompleteQuest( TargetID(),422972)==true ) 	then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then		--�]�w�����W��NPC�N���A��
			return
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )
		local BEDI = Lua_DW_CreateObj("flag",114501 ,780481,1 )
		MoveToFlagEnabled(BEDI , false )
		WriteRoleValue( BEDI ,EM_RoleValue_IsWalk , 1 )
		sleep(20)
		LuaFunc_MoveToFlag( BEDI,780481,2,0)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_BEGIN)	--����{�ڶ\�B�h�֪��ʧ@
		sleep(10)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)	--����{�ڶ\�B�h�֪��ʧ@
		LuaFunc_MoveToFlag( BEDI,780481,3,0)	
		PlayMotion(  BEDI, ruFUSION_ACTORSTATE_HURT_CRITICAL )
		sleep( 10 )
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_BEGIN)	--����{�ڶ\�B�h�֪��ʧ@
		sleep(20)
		PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)
				--PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_CRY)
				--PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_DRINK)
		
				--PlayMotion( BEDI, ruFUSION_ACTORSTATE_DAZED_END)
		
				--PlayMotion( BEDI , ruFUSION_ACTORSTATE_DAZED_END)
				--sleep(10)
		SetDefIdleMotion(BEDI ,ruFUSION_MIME_IDLE_SIT)	--��������b�a
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_CROUCH_BEGIN)
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_READING_BEGIN)
				--SetDefIdleMotion(BEDI ,ruFUSION_MIME_DEATH_DOWN)
		sleep( 10 )
		AdjustFaceDir( OwnerID(),BEDI  , 0 )
		Yell( OwnerID() , "[SC_422972_99]" , 3 )				--�ڡH���@�W�k�ʸ��˦b�a�W�I
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)	--���I�ʧ@
		SetFlag( TargetID() , 543693, 1 )
		Delobj( BEDI )
		sleep( 20 )
		AdjustFaceDir( OwnerID(),TargetID(), 0 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)		--�ʧ@
		Yell( OwnerID() , "[SC_422972_98]" , 3 )				--�A�h���ߤ@�U�H�a��o�]�O�����M�h�K
		sleep( 20 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--�ʧ@
		Yell( OwnerID() , "[SC_422972_97]" , 3 )				--���B���B���A�O�����@�ӷR�P���q���Ϫ����ӭn�����Ʊ��I
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
		sleep(20)
		AdjustFaceDir( OwnerID(),BEDI  , 0 )
		sleep( 20 )	
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	end
end

function LuaS_114527_99()	--��������l�@��
	--LuaP_Crouch()
	--LuaP_Crafting
	LuaP_Sitting()
end

--��b114510�ͪ���ܼ@��
function LuaS_114510_99()
	LoadQuestOption( OwnerID() )
	if (CheckCompleteQuest(TargetID(),422971)==true )and( CheckCompleteQuest( TargetID(),422972)==true ) 	then
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then		--�]�w�����W��NPC�N���A��
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SAY_NPC_BUSY]" , 0 )
		--	return
		end
	end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then	--�]�w�����W��NPC�N���A��
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SAY_NPC_BUSY]" , 0 )
		--return
	end
	
end

--422973
function LuaS_422973()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422973)==true )and( CheckCompleteQuest( OwnerID(),422973)==false)	and
		(Checkflag(OwnerID(),543692)==false) 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422973_0]","LuaS_422973_1",0) --�p�٦n�ܡH�ٯ��o�_�ӶܡH
	end	
end

function LuaS_422973_1()
	SetSpeakDetail(OwnerID(),"[SC_422973_1]")				--�K�O�ާڡK�w�g���ݭn�F�K�o�����ҡK�A�O�M�h�Ϊ��H�a�H			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422973_2]","LuaS_422973_2",0)--�O��ߡA�{�b���ڭ̦b�C
end

function LuaS_422973_2()
	SetSpeakDetail(OwnerID(),"[SC_422973_3]")				--�K���A�̦b�H
	SetFlag( OwnerID() , 543692, 1 )					--���X��
end

--422973�������ȫ�	�X�l�G780481 9�B10
function LuaS_422973_Complete()
	if CheckID( TargetID() ) == true then				--�Ѧ�505457--��BUFF�ݱo���t��--�쥻��CLIENT
		AddBuff( TargetID() , 506214, 0 , 20 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then	--�]�w�����W��NPC�N���A��
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local KKINS = Lua_DW_CreateObj("flag",114526 ,780481,9 )
	MoveToFlagEnabled(KKINS , false )
	WriteRoleValue( KKINS ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	LuaFunc_MoveToFlag( KKINS,780481,10,0)
	PlayMotion( KKINS, ruFUSION_ACTORSTATE_CROUCH_BEGIN)--�ۤU�ʧ@
	sleep(20)
	SetFlag( TargetID() , 543694, 1 )
	PlayMotion( KKINS, ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(20)
	LuaFunc_MoveToFlag( KKINS,780481,11,0)
	Delobj( KKINS )
	CancelBuff( TargetID()  , 506214) 	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
end

--���ͪ��X�ͼ@���G
function LuaS_114529()
	local BEDI = CreateObjByFlag( 114528 , 780510 , 1 , 1 )	 	
	AddToPartition(  BEDI , 0 )
	DisableQuest( BEDI , true )					--�������
	MoveToFlagEnabled(BEDI , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,BEDI )	--�N�����g�i���͸�
end

--422975 �󭫭n���ơI �������ȫ����	�X�l�G780510	1-3

function LuaS_422975()		--��ɭԸ�422974�X��
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422975)==true )and( CheckCompleteQuest( OwnerID(),422975)==false)	and	(Checkflag(OwnerID(),543695)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422975_99]","LuaS_422975_2",0) --�Ѯv�H���O�n�h�P�p�H
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422975_99]","LuaS_422975_1",0) --�Ѯv�H���O�n�h�P�p�H
		end	
	end
	if CheckAcceptQuest( OwnerID() , 422974 ) == true then
		AddSpeakOption(  OwnerID(), TargetID(),"[SC_422974_0]" ,  "LuaS_114510_1",  0 );  --�ڷǳƦn�F�C
	end
end

function LuaS_422975_1()
	SetSpeakDetail(OwnerID(),"[SC_422975_98]")					--��I���n������{�b�L�h�|���Z�H�a���l�λE��
										--�ڭ̫��i�H���X�}�a�u�R�v����ʡI
end

function LuaS_422975_2()
	CloseSpeak( OwnerID() )
	BeginPlot(TargetID()  , "LuaS_422975_4" , 0 )
end

function LuaS_422975_4()			--�i���J�ˬd
	AddBuff( TargetID()  , 506213, 1 , 60 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 )			--OwnerID�O�͡BTargetID�O���a
	local BEDI = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )
	MoveToFlagEnabled(BEDI , false )
	local WW = Lua_DW_CreateObj("flag",114502 ,780510,2 )
	MoveToFlagEnabled(WW , false )
	local KK = Lua_DW_CreateObj("flag",114503,780510,3 )
	MoveToFlagEnabled(KK , false )
	WriteRoleValue( KK ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	Yell( KK , "[SC_422975_97]" , 3 )				--��A�ڭ̹L�h�a��
	AdjustFaceDir( KK,BEDI, 0 )
	sleep(10)
	--LuaFunc_MoveToFlag( KK,780510,4,0)
	BeginPlot(KK   , "LuaS_422975_3" , 0 )
	sleep(60)
	AdjustFaceDir( KK ,BEDI  , 0 )
	Yell( KK , "[SC_422975_0]" , 3 )					--�����D�R�ۤk�h�K
	sleep(20)	
	AdjustFaceDir( BEDI ,KK , 0 )	
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() �O���a
		DelObj(KK )	--�R���t����
		DelObj(WW )	--�R���t���§Q
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end						
	Yell( BEDI , "[SC_422975_1]" , 3 )					--�K���§A�̱Ϧ^�ڪ���l�C
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)	--�����V�������`
	sleep(20)
	Yell( KK , "[SC_422975_2]" , 3 )					--�O�ڥ�¾�F�A�S���b�A�̳̻ݭn���⪺�ɭԥX�{�A�ڥ����V�p�D�p�C
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  	--���ͦV�������`(���Xemote_cute02��emote_salute02�ʧ@)
	sleep(20)
	Yell( BEDI , "[SAY_110329_0]" , 3 )					--......
	sleep(20)
	SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_3]" , 3 )					--����M�h�Φ������g�X���Զ��묹�A�S���O�@��Ҧ��H���A�o�O�ڭ̪��L���C
	sleep(30)
	SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_4]" , 3 )					--�ڥ��b�n���M��A�X�H�~���i�B�V�m�A��ڭ̨ӻ��A�Ҧ��H�������ӳQ�O�@�A���O�u���F�ԥ������̪��C
	SetDefIdleMotion(KK ,ruFUSION_MIME_NONE)
	sleep(30)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() �O���a
		DelObj(KK )	--�R���t����
		DelObj(WW )	--�R���t���§Q
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end	
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( BEDI , "[SC_422975_5]" , 3 )					--�ڡK�ڥi�H�H���A�̶ܡH
	sleep(20)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( KK , "[SC_422975_6]" , 3 )					--�p�G�p�@�N�A�o�N�O�ڭ̪��a���C
	sleep(20)
	--SetDefIdleMotion(KK ,ruFUSION_MIME_EMOTE_SPEAK)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( KK , "[SC_422975_7]" , 3 )					--���ӡ�b�H���P�j�N�x���a��U�A����M�h�η|�ɺɥ��O���ĺ����j���^�_�M�����@�A
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then	--TargetID() �O���a
		DelObj(KK )	--�R���t����
		DelObj(WW )	--�R���t���§Q
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	sleep(50)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_BUFF_SP01)
	Yell( KK , "[SC_422975_8]" , 3 )					--�ڭ̥H�ݤO�ήɶ��ҩ��ڭ̪��ӿաI
	SetDefIdleMotion(KK ,ruFUSION_MIME_IDLE_STAND)
	sleep(20)
	PlayMotion( BEDI ,ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	sleep(10)
	ScriptMessage( TargetID()   ,  TargetID()   , 1 , "[SC_422975_14]" , 0 )		 --�����ש���P���^�����A���S�@�f��K
	ScriptMessage( TargetID()   ,  TargetID()   , 0 , "[SC_422975_14]" , 0 ) 
	sleep(20)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() �O���a
		DelObj(KK )	--�R���t����
		DelObj(WW )	--�R���t���§Q
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	SetDefIdleMotion(BEDI ,ruFUSION_MIME_EMOTE_SPEAK)
	Yell( BEDI , "[SC_422975_9]" , 3 )					--�M�h�v�d�ˤf�ﹳ�ڳo�˪��k�l���X�ӿաA���٦�����n�h�ê��O�H
	sleep(20)
	Yell( BEDI , "[SC_422975_10]" , 3 )					--���D�I�Υͬ��A���ڭ̤]�u�O�Q�n�@�Ӧw�ߪ��ͬ��A�ڡK�@�N�۫H�A�z�������ӡK
	sleep(30)
	Yell( BEDI , "[SC_422975_11]" , 3 )					--��_�бz�����ڤ@�ӵL�z�ШD�A���ڰߤ@����l�A�§Q�D�����������z���V�m
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422975)==false) 	then--TargetID() �O���a
		DelObj(KK )	--�R���t����
		DelObj(WW )	--�R���t���§Q
		CancelBuff( TargetID()  , 506213) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
		return
	end
	sleep(30)
	SetDefIdleMotion(BEDI ,ruFUSION_MIME_NONE)
	PlayMotion( WW ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WW , "[SC_422975_12]" , 3 )					--���ˡK�ڡB�ڡK
	sleep(20)
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_APPROVAL)   	--(���Xemote_approval�ʧ@)
	Yell( KK , "[SC_422975_13]" , 3 )					--��M�S���D�I�H�ڪ��aģ���W�A�ڷ|�{�u�V�m�L�����@�W�X�⪺�M�h�I
	sleep(20)
	Yell( KK , "[SC_422975_15]" , 3 )					--���a
	LuaFunc_MoveToFlag( KK ,780510,3,0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	SetFlag( TargetID(), 543695, 1 )
	if	CheckBuff( TargetID() , 506213 ) == true then
		CancelBuff( TargetID() , 506213 )  
	end
	Delobj( WW )
	Delobj( KK )
end

function LuaS_422975_3()
	LuaFunc_MoveToFlag( OwnerID(),780510,4,0)
end

--422890 �u²��v����	�I�����˪����j��114530		
function LuaS_114530()
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422980)==true )and( CheckCompleteQuest( OwnerID(),422980)==false) then	
		
		if 	(CheckFlag( OwnerID(), 543696)==false) 	then
			SetFlag( OwnerID() , 543696, 1 )
		end
		if	(CountBodyItem( OwnerID(),206816) <1) 	 then
			GiveBodyItem( OwnerID(), 206816, 1 )
			ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_422980_0]" , 0 ) 	--�@���s���q���j�Ԥ⤤�Ƹ�...
			ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_422980_0]" , 0 )
		end
	end
end

function LuaS_114530_1()	--�˦a���j��
	LuaP_DW_Dead()
	--while true do
	--	sleep(30)
	--	CastSpell( OwnerID(), OwnerID(), 492667 )
	--end
end

function LuaS_114827()
	if	CheckAcceptQuest( OwnerID() , 422980) == true  	then
		ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_422980_2]" , 0 ) 		--�A���b�d��...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422980_2]" , 0 ) 
		return true
	else
	return true
	end
end

function LuaS_114827_1()
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422980_1]" , 0 ) 		--���ݰ_�ӹ��O��Q���a�A�o���񦳥�������H...
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422980_1]" , 0 ) 
	return true
end


---�ʱ»���	�X�l�G780451	1-5
function LuaS_422984()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422984)==true )and( CheckCompleteQuest( OwnerID(),422984)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422984_0]","LuaS_422984_1",0) --�ڽT�w�A�ڤ��ᮬ��W�o���D���C
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422984_0]","LuaS_422984_2",0) --�ڽT�w�A�ڤ��ᮬ��W�o���D���C
		end	
	end
	if (CheckAcceptQuest(OwnerID(),422983)==true )and( CheckCompleteQuest( OwnerID(),422983)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422983_0]","LuaS_422983",0) ----�ƹΪ��A���󦹦�����ʡA���O......
	end
end

function LuaS_422984_2()
	SetSpeakDetail(OwnerID(),"[SC_422984_1]")				--�ܦn�I
									 --�ݩ�A���ʱ»����n�A���@�U�A�ڷ|�޻�A�L�h�C
end

function LuaS_422984_1()
	CloseSpeak( OwnerID())
	BeginPlot(TargetID()  , "LuaS_422984_3" , 0 )
end


function LuaS_422984_3()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2 )	--TargetID�O���a�BOwnerID�O����
	AddBuff( TargetID()  , 506216, 1 , 120)				--�����aBUFF �]�i���t�����B�ݤ����쥻���^
	local Lan = Lua_DW_CreateObj("flag" ,114531,780451,1,1)		--��������
	MoveToFlagEnabled(Lan , false )
	WriteRoleValue( Lan ,EM_RoleValue_IsWalk , 1 )
	local EE = Lua_DW_CreateObj("flag" ,114566,780451,2,1)		--�����K����
	MoveToFlagEnabled(EE , false )
	WriteRoleValue( EE ,EM_RoleValue_IsWalk , 1 )
	PlayMotion( EE  ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( EE  , "[SC_422984_2]" , 3 )				--�ܦn�I�ڬ۫H�A�i�H�A��ڨӧa�C
	sleep(20)
	LuaFunc_MoveToFlag( EE,780451,6,0)				--(��Z�g���V���W�A�V�d�Ժ��B����)
	LuaFunc_MoveToFlag( EE,780451,3,0)	
	PlayMotion( EE, ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--��Z�g���U
	sleep(10)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() �O���a
		DelObj(EE )	--�R���t����Z�g
		DelObj(Lan )	--�R���t������
		CancelBuff( TargetID()  , 506216) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	Yell( EE  , "[SC_422984_3]" , 3 )				--�����M�h�̤w�g�ǳƦn�����춥�M�h���ʱ»����C
	sleep(20)
	PlayMotion( EE, ruFUSION_ACTORSTATE_CROUCH_END)		--��Z�g���_
	sleep(10)
	LuaFunc_MoveToFlag( EE,780451,6,0)	
	LuaFunc_MoveToFlag( EE,780451,4,0)				--����@�ǭԵ�
	SetDefIdleMotion(EE  ,ruFUSION_MIME_IDLE_STAND)
	SetPosByFlag( TargetID()  , 780460 , 1 )				--�ǰe���a
	AdjustFaceDir( EE,TargetID(), 0 )
	AdjustFaceDir( TargetID(),Lan , 0 )
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() �O���a
		DelObj(EE )	--�R���t����Z�g
		DelObj(Lan )	--�R���t������
		CancelBuff( TargetID()  , 506216) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	AddBuff( TargetID()  , 503977 , 1 , 120 )				--���a�Q�w�b�a�W
	AdjustFaceDir( Lan,TargetID() , 0 )				--���V���a
	LuaFunc_MoveToFlag( Lan,780451,5,0)			--�����w�w�B�U
	sleep(20)
	PlayMotion( Lan ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( Lan , "[SC_422984_4]" , 3 )				--�A�������P�i��A���A�a�ӻP�d���������a��A�����@�W�M�h�K
	sleep(30)
	SetDefIdleMotion(Lan,ruFUSION_MIME_PARRY_2H)
	Yell( Lan , "[SC_422984_5]" , 3 )				--�m�W�A�����ۡA�ĩ��ߤ@���H���X�d�ĩi����
	sleep(30)
	Yell( Lan , "[SC_422984_6]" , 3 )				--���@�A���a�A�A�Z�����ߤ��ȾԡB���h�o
	sleep(20)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() �O���a
		DelObj(EE )	--�R���t����Z�g
		DelObj(Lan )	--�R���t������
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	Yell( Lan , "[SC_422984_7]" , 3 )				--�b���K
	sleep(5)
	SetDefIdleMotion(Lan ,ruFUSION_MIME_IDLE_STAND)
	sleep(10)
	PlayMotion( Lan ,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	Yell( Lan , "[SC_422984_8]" , 3 )				--�H�H���d�Ժ��D�d�ĩi���W�A�S�¤��A?�M�h
	sleep(40)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() �O���a
		DelObj(EE )	--�R���t����Z�g
		DelObj(Lan )	--�R���t������
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	PlayMotion( Lan , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( Lan , "[SC_422984_9]" , 3 )				--�q�{�b�}�l�A�O�I��A��������M�h�Τ@���l���L�Y�C
	sleep(30)
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),422984)==false) 	then	--TargetID() �O���a
		DelObj(EE )	--�R���t����Z�g
		DelObj(Lan )	--�R���t������
		CancelBuff( TargetID()  , 506216) 
		CancelBuff( TargetID()  , 503977 ) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	SetFlag( TargetID() , 543697 , 1 )				--���X��
	sleep(20)
	PlayMotion( EE,ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)--�����[§���H���x	
	LuaFunc_MoveToFlag( Lan ,780451,1,0)	
	Delobj(EE)
	Delobj(Lan)
	if	CheckBuff( TargetID() , 506216) == true then
		CancelBuff( TargetID() , 506216)  
	end

	if	CheckBuff( TargetID() , 503977 ) == true then
		CancelBuff( TargetID() , 503977 )  
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
end

----------------422982����I--�I��NPC��A�إX5��NPC�A�P�_NPC�����X��	780453	1-4

function LuaS_207012_0()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_207012_0]" )
	ShowBorder( OwnerID(), 0, "[207012]", "ScriptBorder_Texture_Paper" )	
end

function LuaS_422982_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422982)==true )and( CheckCompleteQuest( OwnerID(),422982)==false)	and
		CheckFlag( OwnerID() , 543709 ) ==false	then
		BeginPlot(TargetID()  , "LuaS_422982_1" , 0 )
	end
end

		
function LuaS_422982_1()
	DisableQuest( OwnerID() , true )					--����������
      	Hide( OwnerID() ) 							   --���å���NPC                  
	local BRO = Lua_DW_CreateObj("obj" , 103309, OwnerID() )  		  --�s�X�Ǫ�NPC
	AddToPartition(  BRO, 0 )
	WriteRoleValue ( OwnerID(), EM_RoleValue_PID, BRO)
	BeginPlot(OwnerID(), "LuaS_422982_3" , 0 )      
	SetAttack(BRO , TargetID() )
	BeginPlot(BRO  , "LuaS_Discowood_CheckPeace" , 0 )
	SetPlot(BRO,"dead","LuaS_422982_2",0 )
	PlayMotion( BRO,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	say(BRO,"[SC_422982_0]")						--�֨������I����M�h�Ϊ��å���o�̨ӤF�I
	local NPCMA = {}
		for i=1,4,1 do
		NPCMA[i] = CreateObjByFlag( 103303, 780480 , i , 0 )		--4�����s�s��
		AddToPartition( NPCMA[i] , 0 )
		SetAttack(NPCMA[i] , TargetID() )
	end
	BeginPlot(NPCMA[1]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[2]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[3]  , "LuaS_Discowood_CheckPeace" , 0 )
	BeginPlot(NPCMA[4]  , "LuaS_Discowood_CheckPeace" , 0 )

	sleep(30)
	while true do
		sleep(10)
		if	 CheckID( TargetID() ) == false or ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1	or	CheckFlag( TargetID() , 543709 ) ==true	
			or	(  HateListCount( BRO )== 0 ) 	then
			DelObj( BRO)
			DelObj( NPCMA[1])
			DelObj( NPCMA[2])			
			DelObj( NPCMA[3])
			DelObj( NPCMA[4])
			Show(OwnerID() , 0)
			DisableQuest( OwnerID() , false )		--���}������
			break	
		end
	end
	return true		
end


function LuaS_422982_2() --�Ǫ����`�@��
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422982 )	then
			SetFlag( Player   , 543709, 1 )
	
		end
	end
	return true
End

function LuaS_422982_3()
	local NPC =ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	while true do
		sleep(10)
		if	CheckID(NPC)==false then
			Show(OwnerID(),0)
			DisableQuest( OwnerID() , false )		--���}������
			break
		end
	end
	return true
end 


