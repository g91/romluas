--422981����u��

function LuaS_422981_0()			--��n��������ܼ@���A���J
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422981)==true )	and	( CheckCompleteQuest( OwnerID(),422981)==false)	and	
		CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543708 ) ==false		and
		CheckFlag( OwnerID() , 543709 ) ==false	and	(CountBodyItem( TargetID(),206819) <1)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_86]","LuaS_422981_107",0)		--�ڭ̭n�}�l�F��
	end
	
	if	CheckFlag( OwnerID() , 543701 ) ==false and	(CheckAcceptQuest(OwnerID(),422981)==true )	and	(CountBodyItem( OwnerID(),206820) >0)		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_85]","LuaS_114512_100",0)		--���������A���@�i�ȩ]�˵����ҭn�浹�A�C
	end


	if	CheckAcceptQuest(OwnerID(),422981)==true 	and	CountBodyItem( OwnerID(), 206816)<1	and	
		CheckFlag( OwnerID() , 543708 ) ==false	and	CountBodyItem( OwnerID(), 206820)<1	and
		CheckFlag( OwnerID() , 543701 ) ==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_83]","LuaS_114512_109",0)		--�ڧ˥�[114542]�m�쪺���T[206816]�F...
	end


	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708) ==false	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_87]","LuaS_422981_108",0)	--�ڬd��u���A���˥��j�Ԫ��O�s��C
		end

		if	CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543707) ==false	and
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_88]","LuaS_422981_109",0)	--�ڬd��u���A�s���O���s�s��ΩҦ��C
		end

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==false	and	(CountBodyItem( OwnerID(),206819) >0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_89]","LuaS_422981_110",0)	--�ڬd��u���A����O�s��A�٦��o�i�_�Ǫ���...
		end

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_90]","LuaS_422981_111",0)	--�{�b�w�g���D����O���s�s��ΡA�٥i�H�����Ӥ�V�լd�H
		end	

		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543707) ==false	and	
			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( OwnerID(),206819) >0)	then
			SetFlag( OwnerID() , 543707 , 1 )						--�o��2�X��
			SetFlag( OwnerID() , 543700 , 1 )						--�o��d�X�u��
		end		
	end

end

function LuaS_422981_108()
	SetSpeakDetail(OwnerID(),"[SC_422981_73]")					--�s��H�~���ϹC�����s�餰��ɭԶ}�l���͡u�����h�P�v��o�ǹC�����·СK
										--�d�X���X�a�I�B�T�{�s��u�ꨭ���A�o���I�]�ܭ��n�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_79]","LuaS_114512_102",0)	--�n�A�ڦA�h���C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_80]","LuaS_114512_103",0)	--���a�^���G�ڤ���o�����٥i�঳�u���K
end

function LuaS_422981_109()
	SetSpeakDetail(OwnerID(),"[SC_422981_74]")					--�ܦn�A�J�M�w�g���D�s���֦��̪�����...���s�s��Ϊ��դO����p���۱i�a���i�������A�]�ӾA�ɴ����L�̳o�̪��Ѥj�O�֤F��
										--�A�A���ݦ��S����L�u����d���X�L�̦b���������I��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_81]","LuaS_114512_102",0)	--�ڰ��W�h�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_82]","LuaS_114512_104",0)	--���a�^���G���������I�K�����ӱq��B�ۤ�H
end

function LuaS_422981_110()
	SetSpeakDetail(OwnerID(),"[SC_422981_75]")					--�ڬݬݡK�ȤW�yø���u�u���v�u���K�O�F�ԥ������S���A�ܩ�o����o�۷�u���N�v�����O�ϰ�A�]�\�N�O�L�̻������X�a�I�C
										--�ڦA��s�@�|��A�A���h��M�s���֦��̪������a��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_81]","LuaS_114512_102",0)	--�ڰ��W�h�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_92]","LuaS_114512_108",0)	--�ڤ���o�n���d�X[206816]���֦��̨����C
end

function LuaS_422981_111()
	SetSpeakDetail(OwnerID(),"[SC_422981_76]")					--���K�ݦs�������̨��L���s�s��ΥǸo���ΡK
										--�L���L�a�W���ӳQ��d���U�l�A�A�ˬd�L�U�l�̭������~�F�H�]�\�����L�̶��X�a�I���u���N���æb�䤤�C	
end

function LuaS_422981_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_3]")					--�@�H�o���������M�h�̳��M�]�����ͨ��ˡu�{�u�v���H�ڡK
										--�n�a�A�§Q�D�������|��A�@�_��ʡA��ɭԦA����o�̷|�X�C
end

function LuaS_422981_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_4]")					--�A�u���Q�n�ڧi�D�A��򰵡H					
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_5]","LuaS_422981_4",0)		--�c�K�O���A�·ЧA�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_6]","LuaS_422981_0",0)		--��^
end

function LuaS_422981_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_7]")					--�����^�h���j�ԡD�N���ˤU���{���ݬݦ��S���������H�N�~���u���o��
end

----------------------------------

function LuaS_114589_99()	--�C������l�@��
	LuaP_Crouch()
	--LuaP_Crafting()
	--LuaP_Sitting()
end


function LuaS_114589_0()		--�X�l	780453 1-5
	--LoadQuestOption( OwnerID() )	--OwnerID�O���a�BTargetID�O�C��
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) and	CheckFlag( OwnerID() , 543706 ) ==false	then
		SetSpeakDetail(OwnerID(),"[SC_422981_8]")				--(���e���C���M��½�ʦa�W���U�l�A���M��ı�A���a��K�K)
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_9]","LuaS_114589_9",0) --�аݡK
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_9]","LuaS_114589_1",0) --�аݡK
		end	
	end
end

function LuaS_114589_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_10]")					--(���e���C���٦b½�ʳU�l�A�γ\�ݷ|�A���Z�L����n...)
end

function LuaS_114589_9()
	BeginPlot(TargetID(), "LuaS_114589_2" , 0 )
end

function LuaS_114589_2()--�b�C�����W�]
	CloseSpeak( TargetID())							--OwnerID�C���ATargetID���a
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 2 )	
	AddBuff( TargetID()  , 506215, 1 , -1 )						--�����aBUFF �]�i���t�����B�ݤ����쥻���^
	local DADA = Lua_DW_CreateObj("flag" ,114391,780453,1,1)			--���͹C��
	DisableQuest( DADA , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(DADA , false )
	WriteRoleValue( DADA ,EM_RoleValue_IsWalk , 1 )
	BeginPlot(DADA , "LuaS_114589_8" , 0 )
	sleep(10)
	Yell( DADA , "[SC_422981_11]" , 3 )						--�ڡ�����
	sleep(10)
	AdjustFaceDir( DADA ,TargetID(), 0 )
	Yell( DADA , "[SC_422981_12]" , 3 )						--�A�A�A�B�M�h�I
	sleep(20)
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)		--���ߦa�V�A���U��D<�ʧ@>
	Yell( DADA , "[SC_422981_13]" , 3 )						--���I���O�B���O�ڡB���O�ڡA�O��ڡI
	sleep(20)
	Yell( DADA , "[SC_422981_14]" , 3 )						--�O��ڡK�O��ڡK
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			--���ߦa�V�A���U��D<�ʧ@>
	local WLI = Lua_DW_CreateObj("flag" ,114598,780453,3,1)			--���ͫ§Q
	WriteRoleValue ( WLI  , EM_RoleValue_PID, DADA )
	MoveToFlagEnabled(WLI , false )
	WriteRoleValue( WLI ,EM_RoleValue_IsWalk , 1 )
	
	AdjustFaceDir( WLI ,DADA , 0 )
	Yell( WLI , "[SC_422981_15]" , 3 )						--�L�b�Ȥ���H
	PlayMotion( WLI , ruFUSION_ACTORSTATE_EMOTE_POINT)			--<���۹C��>
	sleep(20)

	Yell( DADA , "[SC_422981_14]" , 3 )						--�O��ڡK�O��ڡK
	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)			--���ߦa�V�A���U��D<�ʧ@>
	sleep(20)

	AdjustFaceDir( WLI ,TargetID(), 0 )
	Yell( WLI , "[SC_422981_16]" , 3 )						--�O�L��F���j�ԡD�N���H
	sleep(20)
	PlayMotion( DADA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( DADA , "[SC_422981_17]" , 3 )						--���I���B���B���A�u�����O�ڡA�O�L�̡I
	sleep(20)	
	
	PlayMotion( DADA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( DADA , "[SC_422981_18]" , 3 )						--�K�O����Ӧ��M�ͪ��H�K
	sleep(20)
	
	AdjustFaceDir( WLI ,DADA , 0 )
	Yell( WLI , "[SC_422981_19]" , 3 )						--���򦳤M�ͪ��H�H
	sleep(10)
	AdjustFaceDir( WLI ,DADA , 0 )
	sleep(10)
	PlayMotion( WLI , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( WLI , "[SC_422981_20]" , 3 )						--���ܻ��M���@�I�I�A�Q�n�ڬ�A�ܡH
	LuaFunc_MoveToFlag( WLI,780453,4,0)					--�§Q���V�e�@�B

	PlayMotion( DADA,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)	
	Yell( DADA , "[SC_422981_21]" , 3 )						--�ڻ��I�ڻ��I�O���ڡI
	sleep(20)
	
	AdjustFaceDir( WLI ,TargetID(), 0 )
	PlayMotion( WLI ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WLI , "[SC_422981_22]" , 3 )						--�u�·СI�A�Q�ݥL����N�ݧa��
	sleep(20)

	Yell( WLI , "[SC_422981_23]" , 3 )						--�ڥu�ߺD�ΤM�l�ݸܡ�
	sleep(10)
	BeginPlot( DADA, "LuaS_114589_3" , 0 )					--���a�i�I���C��
	local Time = 0
		for i = 1, 40 , 1 do							--�ɶ���N�R����lNPC�A�^�_�쪬
		Time = Time + 1

			if	Time>30		then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				DelObj (DADA)
				DelObj (WLI)
				if	CheckBuff( TargetID() , 506215) == true then
					CancelBuff( TargetID() , 506215)  
				end
				break
					
			end
			if	  CheckID( TargetID() ) == false	then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				DelObj (DADA)
				DelObj (WLI)
				if	CheckBuff( TargetID() , 506215) == true then
					CancelBuff( TargetID() , 506215)  
				end
				break
			end
			if	CheckFlag( TargetID() , 543706 ) == true 	then
				WriteRoleValue( WLI , EM_RoleValue_Register+7 , TargetID() )
				BeginPlot( WLI, "LuaS_114589_7" , 0 )		
				break		
			end
		sleep(10)
		end
end


function LuaS_114589_3()		--DADA�C����ܼ@��
										--TargetID���a�BOwnerID�C��
	DisableQuest( OwnerID() , false )						--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
	--	if	CheckBuff( TargetID() , 506215) == true	then			
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_24]","LuaS_114589_4",0)	--�A��軡�u���M�ͪ��H�v�H
	--	end
	end
end

function LuaS_114589_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_25]")					--��B��B��I�妺�A�P��K�����M�h���H�O�K��ӥ������K���M�ͪ��s��A�ڨ��L�L�̡K
										--�K�L�̡B�L�̤W���쨫�ڪ��B�͡A��ӡK��ӧڪB�ͥX�{�b�ȩ]���̡K�L���F�I�N���H�̻����@�ˡK�n�X�ӤH���F�A�@�w�O���s�s��K�@�w�O�L�̡I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_26]","LuaS_114589_5",0)	--�A���A���L�H�L�̨S�o�{�A�ܡH
end

function LuaS_114589_5()
	SetSpeakDetail(OwnerID(),"[SC_422981_27]")					--�S�B�S�A�ڸ��_�ӤF�A�����M�h���ӭn�ݧګ��骺�ơA�ڰk�F�B�k�F�K�藍�_�A�ڤ��Ӧۤv
										--�M�h�ˤU...���ʤF�K�i�O�B�i�O�K����������s�鳺�M�|�ȤިӤӦh�H�`�N�A�ٻ����򦺱����N�S�ΤF�K���֥h���X�K
										--��ӥL�̫ܧ֨����K�ٱ��F�@�ӳU�l�A�ڡB�ڥu�O�n�����Ӥw�K��L���򳣨S���A�u���I�ڥu�������I�H�]���O�ڱ����I
										--�a�W���U�l�]���A�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_28]","LuaS_114589_6",0)	--�a�W���U�l�H
end

function LuaS_114589_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_29]")					--��I�N�b����A�L�̿�|���U�l�I
	SetFlag( OwnerID() , 543706 , 1 )						--�o����H���O�s��X��
end	

function LuaS_114589_7()
	local play	=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	
	local DADA11 =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	DisableQuest( DADA11 , true )						--�������
	AdjustFaceDir( OwnerID(),play, 0 )
	Yell( OwnerID() , "[SC_422981_30]" , 3 )					--�ݧ��F�H		--OwnerID�O�§Q
	sleep(20)
	AdjustFaceDir( OwnerID(),DADA11 , 0 )
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_2H)			--�§Q�X�䤣�N�޼C��V�C��
	sleep(20)
	PlayMotion( DADA11 ,ruFUSION_ACTORSTATE_EMOTE_ROFL)			--�C��emote_rofl���u�ʧ@�A��{�X���|�Z�\
	sleep(20)
	Yell( DADA11 , "[SC_422981_31]" , 3 )					--�~...�~���ڤF�I�M�h�j�H�H
	sleep(20)	
	Yell(  OwnerID() , "[SC_422981_32]" , 3 )					--�G�M�u�O�@�몺�C���C									
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell(  OwnerID() , "[SC_422981_33]" , 3 )					--�O���O���ˤ��|�Z�A�m�L�o��h���l���ڤ@�իK���I
	sleep(20)
	Yell(  OwnerID() , "[SC_422981_34]" , 3 )					--�S�ƤF��A�i�H���F�C
	sleep(20)
	PlayMotion( DADA11 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( DADA11 , "[SC_422981_35]" , 3 )					--�O�B�O�I
	LuaFunc_MoveToFlag( OwnerID(),780453,5,0)
	LuaFunc_MoveToFlag( DADA11 ,780453,4,0)			
	WriteRoleValue(TargetID(),EM_RoleValue_Register+5 , 0 )
	if	CheckBuff( play , 506215) == true then
		CancelBuff( play , 506215)  
	end
	DelObj (OwnerID())
	DelObj (DADA11 )
end

function LuaS_114589_8()
	LuaFunc_MoveToFlag( OwnerID(),780453,2,0)					--�]��@��
end

function LuaS_206819_0()--�ϥΪ��~	
	if	CheckAcceptQuest( OwnerID() , 422981 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422981_36]" , 0 ) 		--�ϯȤW�X�{�޲������O�A�I���æ��F�ԥ��������a�ΡA�]�\�i�H���������D�N�ҰҬݬݡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422981_36]" , 0 ) 
		return true
	end
end

----���o��3�X�СA�P�_�G

function LuaS_114592_0()--�I���ȩ]
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		if	CheckFlag( OwnerID() , 543701 ) ==false and	(CountBodyItem( OwnerID(),206820) <1)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_38]","LuaS_114592_1",0)	--���j�ԡD�N���������˻P�A�����H
		end
		if	CheckFlag( OwnerID() , 543708 ) ==false and	(CountBodyItem( OwnerID(),206816) >0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_42]","LuaS_114592_3",0)	--�A���D�o���s���O�֪��ܡH
		end
		if	CheckFlag( OwnerID() , 543701 ) == true and	(CheckAcceptQuest(OwnerID(),422981)==true )	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_94]","LuaS_114592_6",0)	--�ڧ���ҥ浹���������F�C
		end

		if	CheckFlag( OwnerID() , 543701 ) ==false and	(CheckAcceptQuest(OwnerID(),422981)==true )	and	(CountBodyItem( OwnerID(),206820) >0)		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_95]","LuaS_114592_7",0)	--�ڦ^�ӤF�C
		end
	end
end

function LuaS_114592_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_39]")					--�H�H�K�n������n������p�G�i�H���óo�ӻ��ܳo�򪽱������N�~�A�h�n�ڡ�
										--�i���A�q���o��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_40]","LuaS_114592_2",0)	--���j�ԡD�N���Qŧ���ɡA�A�b���̡H
end


function LuaS_114592_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_41]")					--��M�O��˷R���N�ҰҤj�H�b�@�_�o�㪽��y�s�n�T�_�e�A�L�i�O�C�@�賣�ˤ��o���}��
end

function LuaS_114592_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_43]")					--����s���ڡ�A�u���Ʊ�p���^���ܡH
										--�p�G�A�P�N����d�b�p���o�̡A�p���i�H�i�D�A���סA�p��O�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_44]","LuaS_114592_4",0)	--�K�n�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_45]","LuaS_114592_5",0)	--(�٬O�A�Q�@�U���S���O����k�o���n�F�K)
end


function LuaS_114592_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_46]")					--�u���סv�A�ܧִN��o��F�C
										--����K����o�i�ȥ浹�˷R���N�ҰҤj�H�a��
	DelBodyItem( OwnerID(), 206816, 1 )
	if	(CountBodyItem( OwnerID(),206820) <1)	then 	
		GiveBodyItem ( OwnerID(),206820 , 1 )
	end
end


function LuaS_114592_5()
	CloseSpeak(OwnerID())
end

function LuaS_114592_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_47]")			--�A�^�Ӱա㵪�׬O�Ӧۡu�]���v����Ū��
								--�u�s���ݩ�̪�X�S�b�F�ԥ��������s�����Ҧ��A�P�ȯZ�ժ����s�s��ζդO�۲šC�v
								--�N�O�o���o��p���ܴ��ݧA�A�����{���ɨ����
	if	(CountBodyItem( OwnerID(),206816) <1)	then 	
		GiveBodyItem ( OwnerID(),206816 , 1 )
	end
	SetFlag( OwnerID() , 543708 , 1 )				--�o��s���O���s���X��
end

function LuaS_114592_7()
	SetSpeakDetail(OwnerID(),"[SC_422981_48]")			--�H�H�K�u�O�߫����A�٨S��ȥ浹�L���
end

--function LuaS_111111_0()--�I�����D��-----�֤JĬ����LUA
--	if	( CheckCompleteQuest( OwnerID(),422981)==true) and	(CheckAcceptQuest(OwnerID(),422981)==true )	and( CheckCompleteQuest( OwnerID(),422981)==false)	and
--		(CountBodyItem( OwnerID(),206816) >0)		then
--		SetSpeakDetail(OwnerID(),"[SC_422981_49]")			--�@�H�S�����F�C�o���s���K�A�n������Ų�Ѩӷ��H
--									--��K�A�o�å�u���Q�ߡA�Ӫ̭��Ӥ��O���ۨH�l�l���U���D�A�ݦb�A���o�X�D�M�`�H����{�����W�A�o���ڧK�O���A�a��
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_114546_100",0)	--���¡C
--	end
--end

function LuaS_114546_100()
	SetSpeakDetail(OwnerID(),"[SC_422981_49]")			--�@�H�S�����F�C�o���s���K�A�n������Ų�Ѩӷ��H
								--��K�A�o�å�u���Q�ߡA�Ӫ̭��Ӥ��O���ۨH�l�l���U���D�A�ݦb�A���o�X�D�M�`�H����{�����W�A�o���ڧK�O���A�a��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_50]","LuaS_114546_102",0)	--���¡C

end

function LuaS_114546_102()	
	SetSpeakDetail(OwnerID(),"[SC_422981_51]")					--�s���V���h�����ߦ���K�o�O�s��K�ӥB�O�K
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_52]","LuaS_114546_101",0)	--�ӥB�O�K�H
end

function LuaS_114546_101()	
	SetSpeakDetail(OwnerID(),"[SC_422981_53]")				--�ӥB�O���b�ȯZ�իݤW�@�}�l���K���s�s��ΡC
									--�n�F�A�o�ܧ����A�A�]�Ө��F�C
	SetFlag( OwnerID() , 543708 , 1 )					--�o��s���O���s���X��
end

------------------------------------------
--�ȩ]�n���a���ȵ������A�P�_�����u���ȺX�Сv�A�����G

function LuaS_114512_100()
	SetSpeakDetail(OwnerID(),"[SC_422981_54]")					--����������u�S�a�v�n�A���o�i�Ȩӵ��ڡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_55]","LuaS_114512_106",0)	--��K�O���C
end

function LuaS_114512_106()
	DelBodyItem( OwnerID(), 206820, 1 )
	SetSpeakDetail(OwnerID(),"[SC_422981_56]")					--(���t�}�үȱ����������o���S�X�X�G�ٱo�W�O�u�ᦱ�v�������K)
	SetFlag( OwnerID() , 543701 , 1 )						--�o�쵹�ȺX��
end
----------------------------------------------

function LuaS_114596_0()	--�I���Ĥ��ӤH
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_57]","LuaS_114596_1",0)	--�@�s��C�����`�ƥ�A��X���e�ܤF�A�o�̳c�⪺�Ĥ��A�o�@�I�A��򻡡H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_60]","LuaS_114596_2",0)	--�A�b�o�̳c���Ĥ��ܤ[�F�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_64]","LuaS_114596_6",0)	--����A�A�o�̰��F�����Ĥ��A���S���_�S���s�A�f�H�Ҧp�K
	end
end

function LuaS_114596_1()
	SetSpeakDetail(OwnerID(),"[SC_422981_58]")				--���e�ܤF�ڳo�̪��Ĥ��H
									--�N��O�o�ˡA�]����w���O�ڪ��Ĥ��`���L�̰ڡI
									--�ڦb�o�̳c��n�X�~�F�A�u�����O�ڡI
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--�A�H��...
end

function LuaS_114596_2()
	SetSpeakDetail(OwnerID(),"[SC_422981_61]")			--�O���A�o�O�ڿ�H���ͪ��u�@�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_62]","LuaS_114596_3",0)	--���A���D�K���򦺤`���C������W���˴��X�Ĥ������ܡH
end

function LuaS_114596_3()
	SetSpeakDetail(OwnerID(),"[SC_422981_63]")					--����H�Ĥ��H�K���D�z�h�ìO�ڶܡH
										--���i��I���ǨƱ��u�����O�ڰ����I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--�A�H��...
end


function LuaS_114596_6()
	SetSpeakDetail(OwnerID(),"[SC_422981_65]")					--�Ҧp�K�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_66]","LuaS_114596_2",0)	--�Ҧp�K�ܤF�|�P�����r�ġC
end

function LuaS_114596_4()
	SetSpeakDetail(OwnerID(),"[SC_422981_67]")				--���i��I�ڤ~�S���樺���Ĥ��I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114596_5",0)	--�A�H��...
end

function LuaS_114596_5()		
	closespeak(OwnerID())			--TargetID�O�Ĥ��ӤH�BOwnerID�O���a
	if (CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
			DisableQuest( TargetID(), true )
			BeginPlot(TargetID()  , "LuaS_114596_7" , 0 )
		else
			return
		end	
	end

end

function LuaS_114596_7()	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )				--OwnerID�O�쥻���Ĥ��ӤH�BTargetID�O���a
	local WLI = Lua_DW_CreateObj("flag" ,114598,780453,7,1)			--���ͫ§Q
	MoveToFlagEnabled(WLI , false )
	WriteRoleValue( WLI ,EM_RoleValue_IsWalk , 1 )
	sleep(10)
	LuaFunc_MoveToFlag( WLI,780453,6,0)

	AdjustFaceDir( WLI,OwnerID(), 0 )
	PlayMotion( WLI, ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( WLI , "[SC_422981_68]" , 3 )						--��ı�o���O�L�C
	sleep(20)
	AdjustFaceDir( OwnerID(),WLI, 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422981_69]" , 3 )					--�ڡI�M�h�j�ݡA�z�ӱo���n��
	sleep(20)
	PlayMotion( WLI,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( WLI , "[SC_422981_70]" , 3 )						--�C���Ĥ��ڳ������R�ӳܹL�F�A��{�b����Ƴ��S�o�͡A��ı�o�����n�C��
	sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( OwnerID() , "[SC_422981_71]" , 3 )					--��r�I��r�I�L�i�H�@�ҡI�ڪ��Ĥ����|�`���H�I
	sleep(20)
	Yell( WLI , "[SC_422981_72]" , 3 )						--�n�ա�ҥH�ڭ̧֥h�O�B�լd�a��
	sleep(20)
	LuaFunc_MoveToFlag( WLI,780453,7,0)	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID(), false )
	DelObj(WLI)		
end

------------------
--�`�@�n3���u���A�ޥX�u�d�X�u�ۡv�X��
--1.���H���O�s��543706
--2.�a�I543707
--3.�O���s543708

--�������p�G
--function LuaS_114512_101()	--�֤J�����쥻��LUA<�i��O�p������>
--	if	(CheckAcceptQuest(OwnerID(),422981)==true )and( CheckCompleteQuest( OwnerID(),422981)==false) 	then
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543708 ) ==false	and	
--			CheckFlag( OwnerID() , 543709 ) ==false	and	(CountBodyItem( TargetID(),206819) <1)	then
		
--			SetSpeakDetail(OwnerID(),"[SC_422981_73]")				--�s��H�~���ϹC�����s�餰��ɭԶ}�l���͡u�����h�P�v��o�ǹC�����·СK
												--�d�X���X�a�I�B�T�{�s��u�ꨭ���A�o���I�]�ܭ��n�C
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_102",0)	--�n�A�ڦA�h���C
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_103",0)	--���a�^���G�ڤ���o�����٥i�঳�u���K
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==false	and	CheckFlag( OwnerID() , 543706 ) ==false	and
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) <1)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_74]")				--�ܦn�A�ݱ��ΧA�w�g���D�s���֦��̪������F�C
												--���s�s��Ϊ��դO����p���۱i�a���i�������A�]�ӾA�ɴ����L�̳o�̪��Ѥj�O�֤F��
												--�A�A���ݦ��S����L�u����d���X�L�̦b���������I��
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_102",0)	--�ڰ��W�h�C
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_59]","LuaS_114512_104",0)	--���a�^���G���������I�K�����ӱq��B�ۤ�H
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==false	and	(CountBodyItem( TargetID(),206819) >0)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_75]")				--�ڬݬݡK�ȤW�yø���u�u���v�u���K�O�F�ԥ������S���A�ܩ�o����o�۷�u���N�v�����O�ϰ�A�]�\�N�O�L�̻������X�a�I�C
												--�ڦA��s�@�|��A�A���h��M�s���֦��̪������a��
--		end
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) <1)	then
--			SetSpeakDetail(OwnerID(),"[SC_422981_76]")	--���K�ݦs�������̨��L���s�s��ΥǸo���ΡK
									--�L���L�a�W���ӳQ��d���U�l�A�A�ˬd�L�U�l�̭������~�F�H�]�\�����L�̶��X�a�I���u���N���æb�䤤�C
--		end	
--		if	CheckFlag( OwnerID() , 543706 ) ==true	and	CheckFlag( OwnerID() , 543706 ) ==false	and	
--			CheckFlag( OwnerID() , 543708 ) ==true	and	(CountBodyItem( TargetID(),206819) >0)	then
--			SetFlag( OwnerID() , 543707 , 1 )					--�o��2�X��
--			SetFlag( OwnerID() , 543700 , 1 )					--�o��d�X�u��
--		end
--	end
--end			

function LuaS_114512_102()
	CloseSpeak(OwnerID())
end

function LuaS_114512_103()
	SetSpeakDetail(OwnerID(),"[SC_422981_77]")					--����C�����L�a�W���ӳQ��d���U�l�A�A�ˬd�L�U�l�̭������~�F�H�]�\�����L�̶��X�a�I���u���N���æb�䤤�C
										--���~�A�s�����֦��̤]�O�i�H�լd����V�C
end

function LuaS_114512_104()
	SetSpeakDetail(OwnerID(),"[SC_422981_78]")					--�T�{�L���j�ԡD�N���ˤU���϶��F�H
										--���j�ԡD�N�����W���M�ˬO�g���L�@���E�P���������G�A�]�\�|�������̡A�ȱo�h���d�ݬݡC
end

function LuaS_422981_107()
	SetSpeakDetail(OwnerID(),"[SC_422981_0]")					--�o�_�ƥ󦳳\�h�٨S��_�Ӫ������I�A�ڤ]�ݭn�ɶ���ҡA�A�Q�u�a�ۤv�v��u���}���٬O�K�n���ڲz�X�@�I�Y���A�i�D�A�H			
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_1]","LuaS_422981_2",0)		--�ڷQ�a�ۤv�լݬݡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422981_2]","LuaS_422981_3",0)		--���K�A��i�D�ڧA�{�b������Q�k�ܡH
end

function LuaS_114512_108()
	SetSpeakDetail(OwnerID(),"[SC_422981_93]")					--...����������γ\���޹D�i�H�d�X�A�u���L...��F�A�h�a�B�h�a�C
end

function LuaS_114512_109()
	SetSpeakDetail(OwnerID(),"[SC_422981_84]")					--��A�ھߨ�F�C���٦b�����A����ɭԷ|��M�u�o���v���Q��ӧ�ڡ�
	GiveBodyItem( OwnerID(), 206816, 1 )
end


