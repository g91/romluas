--------------423007��X����	�����Ȥȩ]�O114513�F�������Ȥȩ]114602

function LuaS_114602_0()	
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) <1)	and	(CountBodyItem( OwnerID(),206822) <1)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_16]" , 0 ) 	--�ʤ֦�Ψͤk�A�B���I���~
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_16]" , 0 )
		Yell( TargetID() , "[SC_423007_19]" , 3 )					--�M�h�ϸ`��ڭ��ٯʦ�Ψͤk�A�M���I���~��
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) >0)	and	(CountBodyItem( OwnerID(),206822) <1)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_17]" , 0 ) 	--�ʤ֧��I���~
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_17]" , 0 )		
		Yell( TargetID() , "[SC_423007_20]" , 3 )					--�M�h�ϸ`��ڭ��ٯʧ��I���~��
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) <1)	and	(CountBodyItem( OwnerID(),206822) >0)	and CheckFlag( OwnerID() , 543748) == true 	then
		ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_18]" , 0 ) 	--�ʤ֦�Ψͤk�A
		ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_18]" , 0 )	
		Yell( TargetID() , "[SC_423007_21]" , 3 )					--�M�h�ϸ`��ڭ��ٯʦ�Ψͤk�A��
	end
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		(CountBodyItem( OwnerID(),206823) >0)	and	(CountBodyItem( OwnerID(),206822) >0)	and CheckFlag( OwnerID() , 543748) == true 	then
		SetFlag( OwnerID() , 543715, 1 )
	end
end

function LuaS_423007_2()
	SetSpeakDetail(OwnerID(),"[SC_423007_1]")					--���ҤH�r��ҤH�b���̩O�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_2]","LuaS_423007_3",0	)	--ť���ҤH�X�~�e�o�F�ǯf��A�N��ۤv���b����W���ж����A���F���l���~�A�u���ͤk�M�M����ͤ~��ݦb�o���и̡C
end

function LuaS_423007_3()
	SetSpeakDetail(OwnerID(),"[SC_423007_3]")					--�H�H�K�ǯf�ܡH
										--�X�~�e�V�W�ǯf�A�q��������L�H�K�p���V�ӶV�Q�˲��������Q���ҤH�F��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_4]","LuaS_423007_5",0)		--�n�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_5]","LuaS_423007_5",0)		--�ڨS�N���C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423007_6]","LuaS_423007_4",0)		--������O�ͤk�H
end


function LuaS_423007_4()
		closespeak(OwnerID())						--TargetID�O�ȩ]
		PlayMotion( TargetID,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Yell( TargetID() , "[SC_423007_7]" , 3 )				--��M�O�]����ҤH���M��������ӨS����h�H�o��				
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then		--�]�w�����W��NPC�N���AĲ�o
		BeginPlot(TargetID()  , "LuaS_423007_6" , 0 )
		else
		SetFlag( OwnerID() , 543748, 1 )
		return
	end
end


function LuaS_423007_5()
		closespeak(OwnerID())						--TargetID�O�ȩ]
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+9 ) == 0 then		--�]�w�����W��NPC�N���AĲ�o
		BeginPlot(TargetID()  , "LuaS_423007_6" , 0 )
		else
		SetFlag( OwnerID() , 543748, 1 )
		return
	end
end
	
function LuaS_423007_6()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 2 )	--TargetID�O���a
	local CARL=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	DisableQuest( CARL , true )					--�������
	MoveToFlagEnabled(CARL , false )				--��������
	Yell( CARL , "[SC_423007_8]" , 3 )					--�]���G�A�̦ۤv�i�h�N�n�C
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( OwnerID() , "[SC_423007_9]" , 3 )				--�ȩ]�G�H�H�K�o����O�H�A�ˤf�����Ǵ��n�����B�z�o��ơ�ӥB�ڤ]�ݭn�A���O�@�r��
	sleep(20)	
	
	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423007_10]" , 3 )					--�]���G�K�ڥi�H�ΧO���覡�C
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423007_11]" , 3 )				--�ȩ]�G�u�㻡�n�P�i�h��ӥB�ڭn�O�b���m�и̵o�ͦM�I�K
	sleep(20)

	Yell( CARL , "[SC_423007_12]" , 3 )					--�K�K
	sleep(20)
	
	Yell( OwnerID() , "[SC_423007_13]" , 3 )				--��H
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( CARL , "[SC_423007_14]" , 3 )					--�]���G�K�n�A�P�i�h�C
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	Yell( OwnerID() , "[SC_423007_15]" , 3 )				--�N�o�򻡩w�F�I�M�h�ϸ`�A�˧�ݭn�����~�浹�A�iù��ڭ̨�ҤH���~�Ҫ��񵥧A�C
	PlayMotion( CARL , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(10)
	PlayMotion( CARL , ruFUSION_ACTORSTATE_CROUCH_END)
	SetFlag( TargetID() , 543748, 1 )
	sleep(10)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
end


function LuaS_423007_7()		--�ȩ]114513�X�ͼ@��	�إX114603	780456
	local CARL = CreateObjByFlag( 114603 , 780456 , 1 , 1 )	 	
	AddToPartition(  CARL , 0 )
	DisableQuest( CARL , true )					--�������
	MoveToFlagEnabled(CARL , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,CARL )	--�N�d���g�i114613�ȩ]��
end

--�I�����~�e�ˬd
function LuaS_423007_99()
	if	(CheckAcceptQuest(OwnerID(),423007)==true )and( CheckCompleteQuest( OwnerID(),423007)==false)	and
		CheckFlag( OwnerID() , 543748 ) ==true	then
		return true
	end
	return	false
end

function LuaS_423007_100()
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC)-1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==114387 then
			if	CountBodyItem( OwnerID(), 206823)<1	then			
				GiveBodyItem( OwnerID(), 206823, 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==114388 then
			if	CountBodyItem( OwnerID(), 206822 )<1	then			
				GiveBodyItem( OwnerID(), 206822 , 1 )
				return true
			end
		end
	end
	ScriptMessage( OwnerID()   ,  OwnerID()   , 1 , "[SC_423007_22]" , 0 ) 		--�A�w�g�֦�
	ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423007_22]" , 0 )
	return	false
end

--------------422008 �ͤk���	--�����ȫ����

function LuaS_423008_1()-- ��b207013
	if	CountBodyItem(OwnerID(),207014) > 0	then
		DelBodyItem(OwnerID(),207014,1) --del
		GiveBodyItem(OwnerID(),207015,1) --�X��
		UseItemDestroy() -- �R���ϥΤ���
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423008_13]",0)
end

function LuaS_423008_2() --��b207014
	if	CountBodyItem(OwnerID(),207013) > 0	then
		DelBodyItem(OwnerID(),207013,1) --del
		GiveBodyItem(OwnerID(),207015,1) --�X��
		UseItemDestroy() -- �R���ϥΤ���
		return
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423008_14]",0)		
end

function LuaS_423008_0()
	DisableQuest( OwnerID() , true )
	local CARL =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	AdjustFaceDir( OwnerID(),CARL , 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_1]" , 3 )					--�ڨ����A�Ƨ��㤣�ξ�ߡA�ګܦ��u�g��v�C
	sleep(10)
	AdjustFaceDir( CARL,OwnerID(), 0 )
	sleep(10)
	PlayMotion( CARL ,ruFUSION_ACTORSTATE_DODGE)
	Yell( CARL , "[SC_423008_2]" , 3 )						--�O���A�e�j�骺���C
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_3]" , 3 )					--��ߡ�o�O�s���A�e���A�ڦA���h�e�j���
	sleep(20)

	Yell( CARL , "[SC_423008_4]" , 3 )						--�K�K
	sleep(20)
	
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_5]" , 3 )					--�@�w�|��A�ܦ��j���H��
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423008_6]" , 3 )						--���ݭn�C
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	Yell( OwnerID() , "[SC_423008_7]" , 3 )					--���|���o�C�I
	sleep(20)

	Yell( CARL , "[SC_423008_8]" , 3 )						--�ּo�ܡC
	sleep(15)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_CRY)
	Yell( OwnerID() , "[SC_423008_9]" , 3 )					--�u�u��u�O���ѭ�����	
	sleep(20)

	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_423008_10]" , 3 )					--�S���Y�A���٬O�|���A�e�o�ܺ}�G�A�����N�~�@�ˡ�	
	sleep(20)	

	Yell( CARL , "[SC_423008_4]" , 3 )						--�K�K
	sleep(20)
	ScriptMessage( TargetID()   ,  TargetID()   , 0 , "[SC_423008_11]" , 0 ) 		--�u�]���v���A���ܡA�u�O�w�w�|�_�⻴�V�F�U�ȩ]���B�Y�C
	ScriptMessage( TargetID()   ,  TargetID()   , 2 , "[SC_423008_11]" , 0 )
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( OwnerID() , "[SC_423008_12]" , 3 )					--����n�F�I�i�����W��A�A�A�N�O�Ӫ��v���H�F��
	sleep(30)
	SetFlag( TargetID() , 543757, 1 )						--�ݤ����]���B�ȩ]
	DisableQuest( OwnerID() , false )
end

function LuaS_423008_7()		--�ȩ]114602�X�ͼ@��	�إX114604	780457
	local CARL = CreateObjByFlag( 114564, 780457 , 1 , 1 )	 	
	AddToPartition(  CARL , 0 )
	DisableQuest( CARL , true )					--�������
	MoveToFlagEnabled(CARL , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,CARL )	--�N�d���g�i114602�ȩ]��
end

----------423010 ����
function LuaS_423010_0()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423010)==true )and( CheckCompleteQuest( OwnerID(),423010)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423010_0]","LuaS_423010_4",0) --�Ǵ��H�A�n�F�ܡH
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423010_0]","LuaS_423010_1",0) --�Ǵ��H�A�n�F�ܡH
		end	
	end

end

function LuaS_423010_1()	--780459  1-8
	SetSpeakDetail(OwnerID(),"[SC_423010_1]")--�еy���ڤ@�|��
end

function LuaS_423010_4()
	closespeak(OwnerID())
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 )
	BeginPlot(TargetID(), "LuaS_423010_2" , 0 )
end

function LuaS_423010_2()
	Yell( OwnerID() , "[SC_423010_2]" , 3 )			--�[���F�A�ϸ`�j�H�A���H�ڤ@�P�e�����c�C
	sleep(20)
	SetPosByFlag( TargetID(), 780459 , 1 )				--�ǰe���a
	
	if	CheckBuff( TargetID() , 506265) == false then
		AddBuff( TargetID(), 506265, 0 , 200 )
	end	

	local LAU = Lua_DW_CreateObj("flag",114584,780459,2 )	--�إX�Һ��B�ǿաB�]���B�ȩ]
	MoveToFlagEnabled(LAU , false )
	WriteRoleValue( LAU ,EM_RoleValue_IsWalk , 1 )
	local JNO = Lua_DW_CreateObj("flag",114601,780459,3 )	--�ǿ�
	MoveToFlagEnabled(JNO , false )
	WriteRoleValue( JNO ,EM_RoleValue_IsWalk , 1 )
	local JS = Lua_DW_CreateObj("flag",114781,780459,4 )	--�Ǵ�
	MoveToFlagEnabled(JS , false )
	WriteRoleValue( JS ,EM_RoleValue_IsWalk , 1 )
	local CARL = Lua_DW_CreateObj("flag",114604,780459,5 ) --�]��
	MoveToFlagEnabled(CARL , false )
	WriteRoleValue( CARL ,EM_RoleValue_IsWalk , 1 )
	local NIGHT = Lua_DW_CreateObj("flag",114707,780459,6)
	MoveToFlagEnabled(NIGHT , false )
	WriteRoleValue( NIGHT ,EM_RoleValue_IsWalk , 1 )
	
	sleep(50)
	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAU , "[SC_423010_3]" , 3 )		--�Һ��G���M�|���o�بơK
	sleep(20)
	
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO , "[SC_423010_4]" , 3 )		--�ǿաG���Z�I���Z���|�ܦ��o�ˡI�쩳�O�q����ɭԶ}�l���K
	sleep(30)
	
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do					
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false	then  	
			AddBuff( Player[i], 506265, 0 , 180 )
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( NIGHT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( NIGHT , "[SC_423010_5]" , 3 )		--�ȩ]�G�t���h�O�|�~�e���
	sleep(20)
	
	AdjustFaceDir( LAU ,NIGHT , 0 )
	PlayMotion( LAU , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAU , "[SC_423010_6]" , 3 )		--�Һ��G�A�O�K
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_7]" , 3 )		--�Ǵ��G�L�̬O�ڪ��B�͡C
	sleep(10)
	AdjustFaceDir( LAU ,JS , 0 )
	sleep(10)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 160 )
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( JNO ,JS , 0 )
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO  , "[SC_423010_8]" , 3 )		--�ǿաG�j���I�ڤ��౵���K���Z�O����n���H�ڡI������o�|�J��o�بơK�s���O�֥i�H�o�˾ޱ�����H�S�̤��򪱧˧O�H�H
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_9]" , 3 )		--�Ǵ��G���K�o�ӡA�ڤ]���M���A�X�~�ӡK�ڭ̳��S���ݥX����l�A�ĤH����O���Ӥ���o�˦Ӥw�C
	sleep(30)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 150 )
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( LAU , "[SC_423010_10]" , 3 )		--�Һ��G�ڤ@���{�����Z�ͤF�f�~�|�X�{���`���欰�|��K�O�ڲ����F�K���O�ڪ����K���O�����E���Q���������묹�K
	sleep(30)

	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( JNO , "[SC_423010_11]" , 3 )		--�ǿաG�O�ڤ��n�A�p�G�ڦh�O�@�Ǥ߫����ߥ��Z�A�N�ા�D�o���ܤƤF�K�p�G�ڤ��n�@�����ۤϹ�A���@���K�ڪG�M�ӷP���ΨơA���A�X�v�z��ΡC
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_12]" , 3 )		--�Ǵ��G�Һ��I�ǿաI�{�b���O���Y��𪺮ɭԡI�ڪ��B�ͧi�D�ڡA�o�خɭԧ�n���@�_�ӭ���A�ŬX�����Z�@�w���Ʊ�ڭ��~����H�A�A�̭n�~�򥴰_�믫�v�z��ΰڡ�
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 130)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAU , "[SC_423010_13]" , 3 )		--�Һ��G�j���A�ڧ�Ʊ����d�{�F�K����ٯ�ͪv�z�K
	sleep(30)

	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JNO , "[SC_423010_14]" , 3 )		--�ǿաG�j���A�ڤ��A�X�K
	sleep(20)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 120)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( JS ,LAU , 0 )
	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_15]" , 3 )		--�Ǵ��G�Һ��A�A�@�V�ժ��x�ơA�����ߪk��סA�Q�إߤ@�����H��ı�o�����A�ͬ����̾ڪ���ΡA�o�ǤH���|�ݭn���C
	sleep(40)

	AdjustFaceDir( JS ,JNO , 0 )
	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_16]" , 3 )		--�Ǵ��G�ǿաA�A���@����ֳ����H�����ߡA�o����K�H�����ݦb���̡A�A����A�X����v�z�̡C
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 110)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_17]" , 3 )		--�Ǵ��G�A�̨�Ӿ֦��ڨS������O�A��Φb�A�̦@�P�a��U�A�@�w�|�L�o��n�I
	sleep(20)

	PlayMotion( LAU ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( LAU , "[SC_423010_18]" , 3 )		--�Һ��G�n�A�ڵ����A�C
	sleep(10)
	PlayMotion( JNO ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( JNO , "[SC_423010_19]" , 3 )		--�ǿաG��I

	AdjustFaceDir( JS ,CARL , 0 )
	LuaFunc_MoveToFlag( JS,780459,7,0)		--�Ǵ����V�]���B�ȩ]

		Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 100)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	Yell( JS , "[SC_423010_20]" , 3 )		--�Ǵ��G�n�̡ͭA���¡I�ڭn�������A�̹��Ϊ������C
	sleep(20)

	PlayMotion( NIGHT ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( NIGHT , "[SC_423010_21]" , 3 )		--�ȩ]�G�H�H�K�ڤw�g�o��̦n����§�F��
	sleep(20)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 90)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( JS , "[SC_423010_22]" , 3 )		--�Ǵ��G���K�d���H
	sleep(20)

	Yell( CARL , "[SC_423010_23]" , 3 )		--�]���G�i�H�ݤ@����αq�p�Ż�D�}�l�ǩӤd�~���u�L���ޡv�H
	sleep(30)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_24]" , 3 )		--�Ǵ��G�d����ڪ��D�A��Z���ܤF�ѡA�]���w��s�A���§A�b���ש~���ԧ��ɡA�@���]�S�}�f�V�ڭn�D�ݡu�L���ޡv�C
	sleep(30)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 80)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_25]" , 3 )		--�]���G�Ǵ��A���K�A���Q���ڬݡH
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Yell( JS , "[SC_423010_26]" , 3 )		--�Ǵ��G��������|�H��ڨӧa��
	sleep(20)	
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 60)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	BeginPlot(CARL  , "LuaS_423010_3" , 0 )
	LuaFunc_MoveToFlag( JS,780459,8,0)				--
	LuaFunc_MoveToFlag( JS,780459,9,0)	
	LuaFunc_MoveToFlag( JS,780459,10,0)	

	BeginPlot(JNO , "LuaS_423010_5" , 0 )
	BeginPlot(LAU , "LuaS_423010_6" , 0 )
	LuaFunc_MoveToFlag( JS,780459,11,0)	
	sleep(10)	
	local TTRR= Lua_DW_CreateObj("flag" ,114073,780459,13 ) 			--�إX�I�k�����βy
	Lua_ObjDontTouch( TTRR )
	sleep(10)	

	AdjustFaceDir( JS,TTRR , 0 )
	AdjustFaceDir( CARL ,TTRR , 0 )
	PlayMotion( CARL , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( CARL , "[SC_423010_27]" , 3 )		--�o�O�ǻ������u�L���ޡv�H
	sleep(20)

	Yell( JS , "[SC_423010_28]" , 3 )		--��A��y�F�~���A��ڬު��j�p���@�b�����C
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( CARL , "[SC_423010_29]" , 3 )		--�@�b����...��T�B�p��o���j����n�|�ϱo���q�����p��޻����B�F���A�]�S����l�S��]�p�C
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 50)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		DelObj(TTRR )	--�R���t�����βy
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_41]" , 3 )		--�ޭ��J���]�D�֨��������C
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( CARL , "[SC_423010_30]" , 3 )		--�L�׬O������ԩΥ~�[�A�o���u�O�@���ܴM�`���޵P�C
	sleep(20)

	AdjustFaceDir( JNO , CARL , 0 )
	Yell( JNO , "[SC_423010_31]" , 3 )		--�ǿաG����H�I
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 40)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		DelObj(TTRR )	--�R���t�����βy
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	AdjustFaceDir( LAU , CARL , 0 )
	PlayMotion( LAU , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAU , "[SC_423010_32]" , 3 )		--�Һ��G�o�O��Ϊ��H�x�A�A���L�u�O���Z�L�_���޵P�H
	sleep(20)

	PlayMotion( JS ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( JS , "[SC_423010_33]" , 3 )		--�Ǵ��G���N�R�U�ӡA�d����o�譱�ܦ���s�C
	sleep(20)

	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 40)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_34]" , 3 )		--�]���G�N�ޥ����ӻ��A�T�ꤣ���H�Q�٬��u�L���v�A���O�A�p�G�S���۷��O��P����A�@��H���e�����P�ϥΥ��C
	sleep(40)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( CARL , "[SC_423010_35]" , 3 )		--�޵P�]�p�����A�o���ɧ�B�ɦu���ԳN�]���F���A�p�G��N����A�H�o���޵P���H���B�p��A�ϥΪ̪���m���O���V�o�B���������ä覡�C
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 30)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end

	Yell( CARL , "[SC_423010_36]" , 3 )		--�o�O��²��]�O�̧x�����u�@�C
	sleep(20)

	Yell( JNO , "[SC_423010_37]" , 3 )		--�ǿաG����N��H
	sleep(20)

	PlayMotion( CARL ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( CARL , "[SC_423010_38]" , 3 )		--����ѱN�B�ݧL�A���h�֤H�ण�o�N�m��H����j�ġB���L�A���h�֤H�ण�ȩİh�סH
	sleep(40)
	Player = SearchRangePlayer(LAU , 300)			--��BUFF
		for i=0,table.getn(Player)-1 do			
		if	CheckAcceptQuest( Player[i], 423010 ) == true	and	CheckBuff(  Player[i], 506265) == false		then  	
			AddBuff( Player[i], 506265, 0 , 20)
		end
	end
	--���J�ˬd
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423010)==false) 	then	--TargetID() �O���a
		DelObj(JS )	--�R���t���Ǵ�
		DelObj(LAU )	--�R���t���Һ�
		DelObj(JNO )	--�R���t���ǿ�
		DelObj(CARL )	--�R���t���]��
		DelObj(NIGHT )	--�R���t���ȩ]	
		CancelBuff( TargetID()  , 506265) 
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		return
	end	

	Yell( JS , "[SC_423010_39]" , 3 )		--...�O�ڡA�A�����S���C���O�@�ذ��۪��u�@�N���K����Z����j�����N���A��쨺�������]�ڤJ�I���ԧСA���j�������N�O�γo�˪��믫�@�äH���C
	sleep(30)
	
	Yell( JS , "[SC_423010_40]" , 3 )		--�å@�ĩ��B�����H�����ӿաA�����p�Ų��J���Ҫ���N�A�ڭ̪��إ����M���p���u�L�A����u�ݨ���Φө�������ĺ����j�������ӡH
						
	local Player = SearchRangePlayer(LAU , 300)			--���X��
		for i=0,table.getn(Player)-1 do
				--say(Player[i],"88888")	
			CancelBuff( Player[i], 506265) 		
		if	CheckAcceptQuest( Player[i], 423010 ) == true	then  	
			SetFlag(Player[i], 543720 , 1)
		end
	end
	DelObj( LAU)
	DelObj( JNO)
	DelObj( JS)
	DelObj( CARL)
	DelObj( NIGHT)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_423010_3()
	sleep(10)
	LuaFunc_MoveToFlag( OwnerID(),780459,8,0)		
	LuaFunc_MoveToFlag( OwnerID(),780459,9,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,10,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,12,0)	
end

function LuaS_423010_5()
	LuaFunc_MoveToFlag( OwnerID(),780459,9,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,10,0)	
end

function LuaS_423010_6()
	LuaFunc_MoveToFlag( OwnerID(),780459,14,0)	
	LuaFunc_MoveToFlag( OwnerID(),780459,15,0)	
end

----------�F�ԥ�������423012

--function LuaS_423012_0()	--��i��������ܼ@��
--	if	(CheckAcceptQuest(OwnerID(),423012)==true )and( CheckCompleteQuest( OwnerID(),423012)==false)	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_0]","LuaS_423012_1",0)	--�����ӭn���D����H
--	end
--end

function LuaS_423012_1()
	SetSpeakDetail(OwnerID(),"[SC_423012_1]")				--�o�̡A�O�H���Ҧb���F�ԥ������A�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423012_2]","LuaS_423012_2",0)	--�u��Ρv�O���j��D��䤤�@�ӡH
end

function LuaS_423012_2()
	SetSpeakDetail(OwnerID(),"[SC_423012_3]")			--��A��άO�䤤�@�ӡA�]�O�@���H�ӳ̩��۪��C					
	SetFlag( OwnerID() , 543719, 1 )
end