--���ԧ��B���
-------------------422992 ���X�ð�

function LuaS_422992_1()				
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_1]","LuaS_422992_2",0)	--�F�ԥ������譱�Q�F�ѡA�o���|�檺��D��|ĳ�A�A�]�������]�S���N���ΥX�u�H
end

function LuaS_422992_2()
	SetSpeakDetail(OwnerID(),"[SC_422992_2]")				--��ΨS���X�u��D��|ĳ�H�I....�ګܩ�p�A�o�ͳo�بƱ����Z��j�a�A�����z���W�e�ӡC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_3]","LuaS_422992_3",0)	--�̧̡̭H
end

function LuaS_422992_3()
	SetSpeakDetail(OwnerID(),"[SC_422992_4]")				--��A�Һ��D���J���ҡB�ǿաD���J���ҬO�ڪ��̧̡A��O���D�`�u�q�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_5]","LuaS_422992_4",0)	--���O�A�v�z��ΡK��������A�|�d�b���ԧ��H
end

function LuaS_422992_4()
	SetSpeakDetail(OwnerID(),"[SC_422992_6]")				--���}��ΡA���������p�~���¤@�I�A����j�ڭ̬ݨ��Һ��M�ǿժ��v�z��O�A�L�̷|���O������C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422992_7]","LuaS_422992_5",0)	--�������Ϊ���~�H�i�J�H
end

function LuaS_422992_5()
	SetSpeakDetail(OwnerID(),"[SC_422992_8]")				--�Һ��M�ǿչ塚�����ǻ~�|�A���ɭԦ��]�|�޵o�@�ǯɪ��A�Ȯɧ��Ϋʫ��A�i�H�קK�i�Ψ�~���C
	SetFlag( OwnerID() , 543698 , 1 )					--���X��
end
 
----------���ԧ����|422994

function LuaS_422994_0()		--�Ǥ�114702�X�ͼ@��	�إX114703�B114704	780458	1-2
	local SD = CreateObjByFlag( 114703 , 780458 , 1 , 1 )	 	
	AddToPartition(  SD , 0 )
	DisableQuest( SD , true )						--�������
	MoveToFlagEnabled(SD , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,SD )		--�N�v��114703	�g�i�ǤҡD��Ǹ�

	local VE = CreateObjByFlag( 114704 , 780458 , 2 , 1 )	 	
	AddToPartition(  VE , 0 )
	DisableQuest( VE , true )						--�������
	MoveToFlagEnabled(VE , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,VE )		--�N���J114704	�g�i�ǤҡD��Ǹ�
end
function LuaS_422994_1()	--�����ȫ����
	local SD=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	local VE=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
	Yell( OwnerID() , "[SC_422994_0]" , 3 )				--�Ǵ���D�U���I
	sleep(20)
	--PlayMotion( SD , ruFUSION_ACTORSTATE_EMOTE_HANDSTAND)
	PlayMotion( SD ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	--sleep(20)
	Yell( SD , "[SC_422994_1]" , 3 )					--�֥h�гǴ���D�ӳܰs��	
	sleep(10)	
	PlayMotion( VE ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( VE , "[SC_422994_2]" , 3 )					--��r�I�ХL���O���F��
end

--�I���j����
function LuaS_422994_2()
		LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422994)==true )and( CheckCompleteQuest( OwnerID(),422994)==false)	then
		if	(CheckFlag( OwnerID(), 543718)==false)		then
			SetFlag( OwnerID() , 543718, 1 )
		end			
	end
end

--�j��114705	
function LuaS_114705_99()
	while true do
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
		AddBuff( OwnerID() ,503012 ,1 ,-1 ) --�S�� 
		sleep(30)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_GUITAR)
		AddBuff( OwnerID() ,503012 ,1 ,-1 ) --�S�� 
	end
end

--------------------------422999�U���I

function LuaS_422999_0()		
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),422999)==true )and( CheckCompleteQuest( OwnerID(),422999)==false) then
		if	(CheckFlag( OwnerID(), 543713)==false)	and	(CheckFlag( OwnerID(), 543714)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_0]","LuaS_422999_1",0)			--�Һ��D���J������h�A�Ф�U�d���I
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_19]","LuaS_422999_9",0) 		--[114557]��h�A��ť����ΰ�@�V�W�U�@�ߡA��������l�o�b�o�����������̤ϥجۦV�A�аݬO���F��ơH
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_32]","LuaS_422999_16",0) 		--[114557]��h�A�Х��N�R�U�ӡC�o�@���γ\�u�O�~�|�C�n���n���߰ݳo��k�h����X�{�b�A���ж��̡Aťť�ݦo���z�ѡH
		end
	end
	if 	(CheckAcceptQuest(OwnerID(),423000)==true )and( CheckCompleteQuest( OwnerID(),423000)==false) then
		if	(CheckFlag( OwnerID(), 543699)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_1]","LuaS_423000_2",0)	--�ڨä��Q�ް_�ڭ̤������Ĭ�A�]�S���ˮ`��Ϊ��N��C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_2]","LuaS_423000_3",0)	--�Һ��D���J������h�A�Ъ`�N�A���A�סI	
		end
	end
end

function LuaS_422999_1()
	SetSpeakDetail(OwnerID(),"[SC_422999_1]")						--�A�O���@��q�F�ԥ������Ӫ��ϸ`�a�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_2]","LuaS_422999_2",0)			--�O���A��ΨS���X�u�o������D��|ĳ�C
end

function LuaS_422999_2()
	SetSpeakDetail(OwnerID(),"[SC_422999_3]")						--��D��|ĳ�K�o�T��O�ڭ̪������A�]�����ê����Y...�ڥN���έP�p�A�L�קA�ݭn����A�ڵy��|�P�A�Խ͡C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_4]","LuaS_422999_3",0)			--�ЧA��U�d���I
end

function LuaS_422999_3()
	SetSpeakDetail(OwnerID(),"[SC_422999_5]")						--�ϸ`�j�H�A�ڤ��T�w�A�O�_�M���ۤv�b������A�ǤF�o�N�ӱ����D�@
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_6]","LuaS_422999_4",0)			--���u�O�@�ӪF��A���|��H�R���n�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_7]","LuaS_422999_4",0)			--�S����Ⱦl�a�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_8]","LuaS_422999_99",0)			--�ک��դF�A�o��Ƨڤ��|�A����C
end

function LuaS_422999_4()
	SetSpeakDetail(OwnerID(),"[SC_422999_9]")						--�ڱ��쪺�T���G�M�S���A�u�Ӧ۹F�ԥ��������ϸ`�v�����ǿդΥL����j�ڪ����ݡA�p���A�A���X�M�L�@�˪����סC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_10]","LuaS_422999_5",0)			--�A�~�|�F�A�ڥu�O�{���@���H�R���Ӧ]�����e�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_17]","LuaS_422999_8",0)			--�����F�ԥ��������ϸ`�A���O��p�������Q���R�Υ��k�߳����A[114557]��h�C
end

function LuaS_422999_5()
	SetSpeakDetail(OwnerID(),"[SC_422999_11]")						--������H�p�G�o����L�o�A������A���L�H�ǤF�ۦP���ơA���k�̸ӥH����߳��v�o�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_12]","LuaS_422999_7",0)			--�N�]�������F�ԥ��������ϸ`�A���Ǹܧڤ��o�������A�A�Һ��D���J������h�C
end


--���G
function LuaS_422999_99()
	closespeak(OwnerID())
	SetFlag( OwnerID()   , 543713, 1 )		--�o���U�����ѺX��--TargetID�O�Һ��BOwnerID���a
	SetFlag( OwnerID()   , 543710, 1 )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0	then		--�]�w�����W��NPC�N���A��
		BeginPlot(TargetID()  , "LuaS_422999_100" , 0 )
		else
		return
	end
end

------

function LuaS_422999_7()
	SetSpeakDetail(OwnerID(),"[SC_422999_13]")						--�л��C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_14]","LuaS_422999_10",0)		--�ڻ{���H���H���ڪ��~�ӻ��A�o�W�k�l�o���P���A�O��Ϊ��D�@�ӭ��A���Y�N�o�O�_�N�Ϧ��ӬݡA���ӬO�|�����Ԫ����p�A���O�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_15]","LuaS_422999_10",0)		--��Ϊ��j�j�Ӧ۹ε��A���F�קK���h���y�̶X���}�a�B�ˮ`�A�����h�A�i�H���N�R�U�ӽͤ@�ͶܡH
end

function LuaS_422999_8()
	SetSpeakDetail(OwnerID(),"[SC_422999_18]")						--����A�A�N�����Ӵ����Ϊ��p�ơC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_12]","LuaS_422999_7",0)			--�N�]�������F�ԥ��������ϸ`�A���Ǹܧڤ��o�������A�A�Һ��D���J������h�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_8]","LuaS_422999_99",0)		--�ک��դF�A�o��Ƨڤ��|�A����C
end

function LuaS_422999_9()
	SetSpeakDetail(OwnerID(),"[SC_422999_20]")						--�@�W�k�l�X�ڤ��b�ɾ����ڪ��ж��A�N�Ϥ����A�]���H�e����D��d���Q����~���ͥ��T�Q�u�ç��A�ӳo�ǡA�O��Ϊ��p�ơA�ϸ`�j�H�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_21]","LuaS_422999_11",0)		--���A��~�O�P�ǿաD���J������h���o�ͪ����a�H
end

function LuaS_422999_10()
											--TargetID�O�Һ��BOwnerID�O���a
	SetSpeakDetail(OwnerID(),"[SC_422999_15]")						--�K�K�γ\�K�A�����S���A�ݧڧ�o�W�k�l���Ҧ��Ǧ泣��M����A�A�B�M�]����C
	SetFlag( OwnerID()   , 543714, 1 )							--�o���U�����\�X��
	SetFlag( OwnerID()   , 543710, 1 )		
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then			--�]�w�����W��NPC�N���A��
		BeginPlot(TargetID()  , "LuaS_422999_101" , 0 )
		else
		return
	end
end
-------------------------------------------------------

function LuaS_422999_11()
	SetSpeakDetail(OwnerID(),"[SC_422999_22]")						--��Υ��ȵu�Ȥ����ɴ��A�ڷ|�ɧָѨM�A�L�צp��A��ι�F�ԥ������������Y�O���|�ܪ��C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_23]","LuaS_422999_12",0)		--�P����h���ӿաA���L�A��_�ЧAť�ڤ@���H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_24]","LuaS_422999_13",0)		--�J�M�w�g�o���ΩӿաA�ڤ��|�A�惡�Ʀh�[�z�A�C
end

function LuaS_422999_12()
	SetSpeakDetail(OwnerID(),"[SC_422999_13]")						--�л��C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_15]","LuaS_422999_14",0)		--��Ϊ��j�j�Ӧ۹ε��A���F�קK���h���y�̶X���}�a�B�ˮ`�A�����h�A�i�H���N�R�U�ӽͤ@�ͶܡH
end

function LuaS_422999_13()
	SetSpeakDetail(OwnerID(),"[SC_422999_22]")	--���§A���t�X�A�ϸ`�j�H�C		--TargetID�O�Һ��BOwnerID�O���a
	SetFlag( OwnerID()   , 543713, 1 )		--�o���U�����ѺX��
	SetFlag( OwnerID()   , 543710, 1 )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then	--�]�w�����W��NPC�N���A��
		BeginPlot(TargetID()  , "LuaS_422999_100" , 0 )
		else
		return
	end
end

function LuaS_422999_14()
	SetSpeakDetail(OwnerID(),"[SC_422999_26]")						--�ڤ@�V�O�̪k�N�R�v�ơA
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_17]","LuaS_422999_15",0)		--�����F�ԥ��������ϸ`�A���O��p�������Q���R�Υ��k�߳����A[114557]��h�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_27]","LuaS_422999_15",0)		--[114557]��h�A�����F�ԥ��������ϸ`�A�ڪ��߳��O���ߪ��A�Ϊ�...���D�A���۫H�u�j�N�x�v�����H
end

function LuaS_422999_15()
	SetSpeakDetail(OwnerID(),"[SC_422999_28]")						--�K�K
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_29]","LuaS_422999_22",0)		--�A���A�ڨå�����@��Ĳ�ǫߪk�̱����o���o�����M�A�ӬOı�o���Ƥj�����ߡA���p�A�һ����A�ӦW�k�l���N�Ϥ����A�A��ı�o�A���Ʀ����n�ԲӰl�s�U�h�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_30]","LuaS_422999_22",0)		--�p�G�A�O�u���Q�ѨM��Τ��������D�A��M�Ʊ��u�۪����n�ʧA�@�w�ܲM���A�B�M�u�O�ȮɳQ����A�Ӥ��O�����C
end

function LuaS_422999_16()
	SetSpeakDetail(OwnerID(),"[SC_422999_33]")						--���F��^����A�j�զo���O�G�N���H��~�A		
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_21]","LuaS_422999_11",0)		--���A��~�O�P�ǿաD���J������h���o�ͪ����a�H
end

function LuaS_422999_22()
											--TargetID�O�Һ��BOwnerID�O���a
	SetSpeakDetail(OwnerID(),"[SC_422999_35]")						--�K�K�γ\�K�A�����S���A�ݧڧ�o�W�k�l���Ҧ��Ǧ泣��M����A�A�B�M�]����C
	SetFlag( OwnerID()   , 543714, 1 )							--�o���U�����\�X��
	SetFlag( OwnerID()   , 543710, 1 )	
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 then			--�]�w�����W��NPC�N���A��
		BeginPlot(TargetID()  , "LuaS_422999_101" , 0 )
		else
		return
	end
end

-----------------------------�L�{���I���ǿաG
function LuaS_422999_23()
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),422999)==true )and( CheckCompleteQuest( OwnerID(),422999)==false) then
		if	(CheckFlag( OwnerID(), 543713)==false)	and	(CheckFlag( OwnerID(), 543714)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422999_46]","LuaS_422999_23_1",0) --��h...
		end
	end
end

function LuaS_422999_23_1()
		SetSpeakDetail(OwnerID(),"[SC_422999_36]")	--�𦺧ڤF�I
							--�p��������H���A���M���F�@�ӨS�ͩR����~�Q��ܤ@���H�R�I
							--������o�O�ڪ��k�H���@�A�پ����i�L���ж��N�Ϧ��H�L���N��O�n���ګ��Ϧo�h���ܡH
							--�i�c���Һ��I
							--�o���ٯ໡�ۤv�N�O��Ϊ��Ϊv�̡H
							--�ڵL�k��ߧ��Υ浹�o�ؤH�I
end


---------------------------------------

function LuaS_422999_100()			---------�U������
	if CheckID( TargetID() ) == true then				--�Ѧ�505457--��BUFF�ݱo���t��--�쥻��CLIENT
		AddBuff( TargetID() , 506217, 0 , 60 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) 
	--local JJ2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 ) 
	local WW1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 
	local WW2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local WOMAN=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 

	local WWBE1 = CreateObjByFlag( 114394, 780454 , 3 , 1 )	
	AddToPartition(  WWBE1 , 0 )
	DisableQuest( WWBE1 , true )					--�������
	MoveToFlagEnabled(WWBE1 , false )					--��������
	WriteRoleValue( WWBE1 ,EM_RoleValue_IsWalk , 1 )

	local WWBE2 = CreateObjByFlag( 114394, 780454 , 4 , 1 )	
	AddToPartition(  WWBE2 , 0 )
	DisableQuest( WWBE2 , true )					--�������
	MoveToFlagEnabled(WWBE2 , false )					--��������
	WriteRoleValue( WWBE2 ,EM_RoleValue_IsWalk , 1 )

	local WOMAN2= CreateObjByFlag( 114393, 780454 , 5 , 1 )	
	AddToPartition(  WOMAN2, 0 )
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	DisableQuest( WOMAN2, true )					--�������
	MoveToFlagEnabled(WOMAN2, false )					--��������
	WriteRoleValue( WOMAN2,EM_RoleValue_IsWalk , 1 )

	local JJ3= CreateObjByFlag( 114758, 780454 , 2 , 1 )	
	WriteRoleValue ( JJ3 , EM_RoleValue_Register+1,LAO2 )
	AddToPartition(  JJ3, 0 )
	DisableQuest( JJ3, true )						--�������
	MoveToFlagEnabled(JJ3, false )					--��������
	WriteRoleValue( JJ3,EM_RoleValue_IsWalk , 1 )

	PlayMotion( LAO2,ruFUSION_ACTORSTATE_EMOTE_KISS)
	sleep(20)
	Yell( LAO2 , "[SC_422999_36]" , 3 )					--�����ΦA���F�C
	sleep(10)
	AdjustFaceDir( LAO2 ,WOMAN2, 0 )
	PlayMotion( LAO2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAO2 , "[SC_422999_37]" , 3 )					--��o�a�U�h�I�e�W�B�D�x�I
	sleep(20)
	AdjustFaceDir( WWBE1 ,LAO2 , 0 )
	AdjustFaceDir( WWBE2 ,LAO2 , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( WWBE1 , "[SC_422999_39]" , 3 )					--�O�I
	Yell( WWBE2 , "[SC_422999_39]" , 3 )					--�O�I
	sleep(10)
	AdjustFaceDir( WWBE1 ,WOMAN2  , 0 )
	AdjustFaceDir( WWBE2 ,WOMAN2  , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_SHIELD_BASH)			--2�ӽçL���X���R�ʧ@
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_SHIELD_BASH)	
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_END)	--�k�H���_	
	sleep(10)					
	BeginPlot(WWBE1 ,  "LuaS_114595_0" , 0 )					--�M�k�H�@�_�������}
	BeginPlot(WWBE2 , "LuaS_114595_1" , 0 )
	BeginPlot(WOMAN2  , "LuaS_114595_2" , 0 )
	BeginPlot(JJ3, "LuaS_114595_3" , 0 )
	sleep(60)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	CheckBuff( TargetID() , 506217) == true then
		CancelBuff( TargetID() , 506217)  
	end
end

function LuaS_114595_0()
	LuaFunc_MoveToFlag( OwnerID(),780454,6,0)
	DelObj( OwnerID())
end

function LuaS_114595_1()
	LuaFunc_MoveToFlag( OwnerID(),780454,7,0)
	DelObj( OwnerID())
end

function LuaS_114595_2()
	LuaFunc_MoveToFlag( OwnerID(),780454,8,0)
	DelObj( OwnerID())
end

function LuaS_114595_3()
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	AdjustFaceDir( OwnerID(),LAO2 , 0 )
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_PARRY_BOW)
	sleep(10)
	LuaFunc_MoveToFlag( OwnerID(),780454,8,0)
	DelObj( OwnerID())
end

function LuaS_114595_99()	--���۴@����l�@��
	LuaP_Crouch()
	--LuaP_Sitting()
end

-------------------------------------422999�U�����\

function LuaS_422999_101()				--���\
								--TargetID�O���a�BOwnerID�O�Һ�
	if CheckID( TargetID() ) == true then				--�Ѧ�505457--��BUFF�ݱo���t��--�쥻��CLIENT
		AddBuff( TargetID() , 506217, 0 , 60 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	local LAO2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) 
	--local JJ2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 ) 
	local WW1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 ) 
	local WW2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 ) 
	local WOMAN=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 

	local WWBE1 = CreateObjByFlag( 114394, 780454 , 3 , 1 )	
	AddToPartition(  WWBE1 , 0 )
	DisableQuest( WWBE1 , true )					--�������
	MoveToFlagEnabled(WWBE1 , false )					--��������
	WriteRoleValue( WWBE1 ,EM_RoleValue_IsWalk , 1 )

	local WWBE2 = CreateObjByFlag( 114394, 780454 , 4 , 1 )	
	AddToPartition(  WWBE2 , 0 )
	DisableQuest( WWBE2 , true )					--�������
	MoveToFlagEnabled(WWBE2 , false )					--��������
	WriteRoleValue( WWBE2 ,EM_RoleValue_IsWalk , 1 )


	local WOMAN2= CreateObjByFlag( 114393, 780454 , 5 , 1 )	
	AddToPartition(  WOMAN2, 0 )
	DisableQuest( WOMAN2, true )					--�������
	MoveToFlagEnabled(WOMAN2, false )					--��������
	WriteRoleValue( WOMAN2,EM_RoleValue_IsWalk , 1 )

	local JJ3= CreateObjByFlag( 114758, 780454 , 2 , 1 )	
	WriteRoleValue ( JJ3 , EM_RoleValue_Register+1,LAO2 )
	AddToPartition(  JJ3, 0 )
	DisableQuest( JJ3, true )						--�������
	MoveToFlagEnabled(JJ3, false )					--��������
	WriteRoleValue( JJ3,EM_RoleValue_IsWalk , 1 )

	PlayMotion( LAO2,ruFUSION_ACTORSTATE_EMOTE_KISS)
	sleep(20)
	Yell( LAO2 , "[SC_422999_36]" , 3 )					--�����ΦA���F�C
	sleep(10)
	AdjustFaceDir( LAO2 ,WOMAN2, 0 )
	PlayMotion( LAO2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell( LAO2 , "[SC_422999_38]" , 3 )					--����o�a�U�h�A���i�j�c
	sleep(20)
	AdjustFaceDir( WWBE1 ,LAO2 , 0 )
	AdjustFaceDir( WWBE2 ,LAO2 , 0 )
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( WWBE1 , "[SC_422999_39]" , 3 )					--�O�I
	Yell( WWBE2 , "[SC_422999_39]" , 3 )					--�O�I
	sleep(10)
	AdjustFaceDir( WWBE1 ,WOMAN2, 0 )
	AdjustFaceDir( WWBE2 ,WOMAN2, 0 )
	
	PlayMotion( WWBE1 ,ruFUSION_ACTORSTATE_SHIELD_BASH)			--2�ӽçL���X���R�ʧ@
	PlayMotion( WWBE2 ,ruFUSION_ACTORSTATE_SHIELD_BASH)	
	PlayMotion( WOMAN2, ruFUSION_ACTORSTATE_CROUCH_END)	--�k�H���_	
	sleep(10)					
	BeginPlot(WWBE1 ,  "LuaS_114595_0" , 0 )					--�M�k�H�@�_�������}
	BeginPlot(WWBE2 , "LuaS_114595_1" , 0 )
	BeginPlot(WOMAN2  , "LuaS_114595_2" , 0 )
	BeginPlot(JJ3, "LuaS_114595_3" , 0 )
	sleep(60)

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	CheckBuff( TargetID() , 506217) == true then
		CancelBuff( TargetID() , 506217)  
	end
end


---------------------------------�X�ͼ@��	�X�l780454 1-5

function LuaS_114557_0()	--�X�ͼ@��--�Q�ب�C���W�ɡA���إX�t���Һ�114600�B�ǿ�114564--��CLIENT�צ�
	local LAO2 = CreateObjByFlag( 114600 , 780454 , 1 , 1 )	 	
	AddToPartition(  LAO2 , 0 )
	DisableQuest( LAO2 , true )					--�������
	MoveToFlagEnabled(LAO2 , false )				--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+9,LAO2 )	--�N�Һ�2���g�i114557�Һ���
	
	local JJ2 = CreateObjByFlag( 114392, 780454 , 2 , 1 )	 	
	AddToPartition(  JJ2 , 0 )
	DisableQuest( JJ2 , true )					--�������
	MoveToFlagEnabled(JJ2 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+8,JJ2 )	--�N�ǿ�2���g�i114557�Һ���
	
	local WW1 = CreateObjByFlag( 114593, 780454 , 3 , 1 )	 	--�çL1��
	AddToPartition(  WW1 , 0 )
	DisableQuest( WW1 , true )					--�������
	MoveToFlagEnabled(WW1 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+7,WW1 )	--�N�çL1���g�i114557�Һ���
	
	local WW2 = CreateObjByFlag( 114593 , 780454 , 4 , 1 )	 	--�çL2��
	AddToPartition(  WW2 , 0 )
	DisableQuest( WW2 , true )					--�������
	MoveToFlagEnabled(WW2 , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+6,WW2 )	--�N�çL2���g�i114557�Һ���
	
	local WOMAN = CreateObjByFlag( 114595 , 780454 , 5 , 1 )	--�k�H���۴@
	AddToPartition(  WOMAN , 0 )
	DisableQuest( WOMAN , true )					--�������
	MoveToFlagEnabled(WOMAN , false )					--��������
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5,WOMAN )	--�N�k�H���۴@�g�i114557�Һ���
end
----------------423000�Һ����n��

--function LuaS_423000_1()			
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_1]","LuaS_423000_2",0)	--�ڨä��Q�ް_�ڭ̤������Ĭ�A�]�S���ˮ`��Ϊ��N��C
--	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_2]","LuaS_423000_3",0)	--�Һ��D���J������h�A�Ъ`�N�A���A�סI	
--end

function LuaS_423000_2()
	SetSpeakDetail(OwnerID(),"[SC_423000_3]")				--�A���Ȥ���o�A�q�A�����άF�ƨ��@��_�A���δN�O�@�حt��C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_4]","LuaS_423000_4",0)	--�Һ��D���J���һ�D�K
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_5]","LuaS_423000_4",0)  --�ڦ��۫H�i�H���U�A�̲����{�b���ɶê��p�C
end

function LuaS_423000_3()
	SetSpeakDetail(OwnerID(),"[SC_423000_6]")				--ı�o�ڤӹL�j�աB��§�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423000_7]","LuaS_423000_4",0)	--�ڨS���c�N�K
end

function LuaS_423000_4()
	SetSpeakDetail(OwnerID(),"[SC_423000_8]")				--���D�A�S���ݨ��{�b���������p�ܡH
	SetFlag( OwnerID() , 543699 , 1 )					--���X��
end

--------423000�������Ⱥt��	�X�l�G780452	1-4

function LuaS_423000_Complete()
	if CheckID( TargetID() ) == true then					--�Ѧ�505457--��BUFF�ݱo���t��--�쥻��CLIENT
		AddBuff( TargetID() , 506240, 0 , 60 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then		--�]�w�����W��NPC�N���A��
		return
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 2 )
	local LAUR = Lua_DW_CreateObj("flag",114584,780452,1 )		--�Һ��A�Һ��쥻����m
	MoveToFlagEnabled(LAUR , false )
	WriteRoleValue( LAUR ,EM_RoleValue_IsWalk , 1 )
	local SPIN = Lua_DW_CreateObj("flag",114585,780452,2 )			--�v����A�ئb�Һ������B
	MoveToFlagEnabled(SPIN , false )
	WriteRoleValue( SPIN ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	Yell( SPIN , "[SC_423000_9]" , 3 )					--��D�j�H�I
	LuaFunc_MoveToFlag( SPIN,780452,3,0)					--���V�Һ�

	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  
	Yell( SPIN , "[SC_423000_10]" , 3 )					--�ܩ�p���Z�A�̽͸ܡA�ڦ��@���檺�ƭn�V�z�[�i�C
	sleep(20)
	AdjustFaceDir( LAUR ,SPIN , 0 )
	PlayMotion( LAUR ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Yell( LAUR , "[SC_423000_11]" , 3 )					--�A�S�����Z��ڭ̡A���a�I
	sleep(20)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( SPIN , "[SC_423000_12]" , 3 )					--�O�o�˪��K�ǿդj�H�γ\�|������z�P�L�]�����W�o�Ǥް_�������@�ƨ���h���Ȥ��m���̧i�W�@���K
	sleep(30)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( SPIN , "[SC_423000_13]" , 3 )					--�ھ�ߥL�p�G�ᦱ�ƹ�K�����ȷ|�y�����m��z���~�ѡK�z���D���K�o�]���O�L�Ĥ@���o�򰵤F�K
	sleep(30)
	PlayMotion( LAUR ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( LAUR , "[SC_423000_14]" , 3 )					--�O�ڡK�L�`�O�p�����ӥ��ʫĤl�@��a�������A�ڥh���Z���̤@��A�o�̥��浹�A�B�z�C
	sleep(20)
	PlayMotion( SPIN ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)  
	Yell( SPIN , "[SC_423000_15]" , 3 )					--�O�I
	sleep(10)
	LuaFunc_MoveToFlag( LAUR,780452,4,0)				--�Һ����}
	Delobj( LAUR )
	Delobj( SPIN )		
	CancelBuff( TargetID()  , 506240) 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

---423001 �v���橾�i���ȧ�����t��	780455	1-2
function LuaS_423001_com()

	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) > 0 then	--�]�w�����W��NPC�N���A��
		return
	end
	if CheckID( TargetID() ) == true then				--�Ѧ�505457--��BUFF�ݱo���t��--�쥻��CLIENT
		AddBuff( TargetID() , 506241 , 0 , 15 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 )
	local JJ3 = Lua_DW_CreateObj("flag",114601,780455,1 )		
	MoveToFlagEnabled(JJ3 , false )
	WriteRoleValue( JJ3 ,EM_RoleValue_IsWalk , 1 )
	sleep(20)
	PlayMotion( JJ3 ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		--�ͮ�
	sleep(20)
	Yell( JJ3 , "[SC_423001_1]" , 3 )				--�𦺧ڤF�I
	LuaFunc_MoveToFlag( JJ3,780455,2,0)				--���^��m�W
	sleep(20)
	PlayMotion( JJ3 ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		--�ͮ�
	sleep(10)
	Yell( JJ3 , "[SC_423001_2]" , 3 )				--�Ӧ����W�_�W��I
	sleep(20)
	Delobj( JJ3 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	if	CheckBuff( TargetID() , 506241) == true then
		CancelBuff( TargetID() , 506241)  
	end				
end


