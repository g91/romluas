--422818 �������~	�һݽs���G �����H�ʦL206146	��ù�̭�113667	�X�� 543411

function LuaS_206146_0()--�ϥΪ��~�e�ˬd	
	if	CheckAcceptQuest( OwnerID() , 422818 ) == true then
		if	CheckFlag( OwnerID() , 543411 ) == true	then
			if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 113667	then
--				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
--				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_END)
--				sleep(10)
				PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
				PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_BUFF_END)
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_0]" , 0 ) 	--���ɪ��y��Ţ�n[113667]�A��o���T���i�D���̪��i���Q���̧a�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_0]" , 0 ) 
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--�ؼФ����T
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
				return false
			end
		end

		local PORO =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113667 , 70 )
		if Type(PORO) == "number" and CheckID(PORO) == false then
			PlayMotion(  TargetID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)
			PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_BUFF_END)
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_1]" , 0 ) 	--�A������a��[113667]�@�I�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_1]" , 0 ) 
			return false 
		end
		
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 113667	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--�ؼФ����T
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end

		if	 (CountBodyItem( OwnerID(),206146) >0) and CheckFlag( OwnerID() , 543411 ) ==false	then
			return true
		end
	end


	if	CheckAcceptQuest( OwnerID() , 422820 ) == true  then
--�P�_�ؼЬO�_�b�԰���
		if	HateListCount( TargetID())~=0	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_USECHECK_BATTLE_0]", 0 )
			return false
		end


		if	CountBodyItem( OwnerID() , 206148)>0	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_4]" , 0 ) 	--�A�w�g���o[206148]�A�����ﲽ�q�����A���^�h���o�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_4]" , 0 ) 
			return false
		end
		
		local INMI =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 102755 , 70 )
		if 	Type(INMI) == "number" and CheckID(INMI) == false	 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 ) 	--�A������a��[102755]�@�I�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
			return false 
		end
	
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102755	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--�ؼФ����T
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end		


		if	(CountBodyItem( OwnerID(),206146) >0) and   (CountBodyItem( OwnerID(),206148) <1) then
			return true
		end
	end
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
	return false 
end

--���\�ϥ�
function LuaS_206146_2()
	if CheckID( TargetID() ) == true and  CheckAcceptQuest( OwnerID() , 422818 ) == true  then
		PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
		PlayMotion(  TargetID(),ruFUSION_ACTORSTATE_CAST_END)
		CastSpell( TargetID(), TargetID(), 494493)
		sleep(20)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206146_2]" , 0 ) 		--�@�ӵ���Ţ�n�b��ù�̭ר��W�A�����H�ʦL��e�@�L�����C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206146_2]" , 0 ) 
		SetFlag( OwnerID() , 543411 , 1 )						--���X��
	end
	
	if CheckID( TargetID() ) == true   and CheckAcceptQuest( OwnerID() , 422820 ) == true  then
--���\�ϥΫ�Ϩ䦨���L�Ī��A
		SetFightMode ( TargetID(),0,1,0,0 )

		SetFlag( OwnerID() , 543412 , 1 )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_1]" , 0 ) 			--�@�D�������{�b�L�̧J�����W�A�����H�ʦL�b�e�P�򲣥ͥX�@��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_1]" , 0 ) 
		BeginPlot( TargetID() , "LuaS_206146_3" , 0 )
		BeginPlot( OwnerID(), "LuaS_206146_4" , 0 )
	end
end

function LuaS_206146_3()
		CastSpell( OwnerID(), OwnerID(), 494393)
		local BL = Lua_DW_CreateObj("obj" ,113910,OwnerID(),0,1)				--�I�k �B�X��֪��Pı
		WriteRoleValue( BL , EM_RoleValue_LiveTime , 2 )
		Lua_ObjDontTouch( BL) 
		AddToPartition( BL , 0 )
		sleep(30)
--�^�_���A
		SetFightMode( OwnerID(),1,1,0,1 )
end

function LuaS_206146_4()
		sleep(30)
		if	(CountBodyItem( OwnerID(),206148) <1)	then 
			GiveBodyItem( OwnerID(), 206148 , 1 )					--�����~
		end
end

--�}�̪����βy�G
function LuaS_113674_0()
	SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
end

function LuaI_113674_1()
	if 	CheckAcceptQuest( OwnerID() , 422818 ) == true	then
		ScriptMessage( OwnerID()  , OwnerID() , 1 , "[SC_113674_0]" , 0 ) 		--�y�ʥ|�P�����~�P�j��}��^�t���Ƥj�A�o�ݰ_�ӬO�ӳ̪�~�Q�[�Ѧb��ù�̭ר��W
		ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_113674_0]" , 0 ) 
		CastSpell( TargetID(), TargetID(), 494393)			--��ù�̭׵���
		--SetPlot( TargetID() , "range" , "" , 200 )
		--BeginPlot( TargetID(), "LuaI_113674_2", 0 )
	end
end

function LuaI_113674_2()
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_113674_0]" , 0 ) 		--�y�ʥ|�P�����~�P�j��}��^�t���Ƥj�A�o�ݰ_�ӬO�ӳ̪�~�Q�[�Ѧb��ù�̭ר��W
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_113674_0]" , 0 ) 
	while true do
		sleep(10)
		CastSpell( OwnerID(), OwnerID(), 494291 )	--�}����^
		if 	CheckID( TargetID()) == false		then			--TargetID�O���a
			SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
			break
		end

		if 	CheckFlag(TargetID(),543413) == true	then
			BeginPlot( OwnerID(), "LuaI_113674_3", 0 )
	--		SetPlot( OwnerID() , "range" , "LuaI_113674_1" , 200 )
	--		break
		end
	end
end

function LuaI_113674_3()
	sleep(50)
	BeginPlot( OwnerID(), "LuaI_113674_1", 0 )
end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422819 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�����諸�U��
--422819 �����諸�U��	�һݽs���G���׬}������113669 �X�l�G780471	 �X�СG543415�������� 543415�i����ù�̭� 543428�߰ݦ����諸�h�ֻ� 543427�w�w�Ĵ�

function LuaS_422819_1()
	SetSpeakDetail(OwnerID(),"[SC_422819_1]")				--��A�����ﲽ�q�Ч�������A�e�L�h�A���O...�ڬݬ�...�u�I�o�p�F��n���ΡB�o��...��...								
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_2]","LuaS_422819_2",0) --...�аݱz��s�n�F�ܡH
		else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_2]","LuaS_422819_3",0)	--...�аݱz��s�n�F�ܡH
	end
end


function LuaS_422819_2()
	CloseSpeak( OwnerID())
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0)	 then
		say(TargetID(),"[SC_422819_3]")					--�O�ʡ�o�����n�ǰe�A�F��o�O�ڲĤ@���γo�ضǰe�ۡI
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
		BeginPlot( TargetID(), "LuaS_422819_4", 0 )	
	end
end
	
function LuaS_422819_3()
	SetSpeakDetail(OwnerID(),"[SC_422819_4]")				--�٨S�B�٨S�A�کȧ�A�e�i�j���Y���a�L�̡�
  									--�A�n���ڤ@�I�ɶ��������ﲽ�q����m�A�N���̱j���a��N����o...����N��...
end


function LuaS_113909_0()	--�S�Ĳy
	AddBuff( OwnerID()  , 500899, 0 , -1 )		--�}����^		--TargetID�S�Ĳy
--	if 	CheckAcceptQuest( OwnerID() , 422819 ) == true	then
--	SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 200 )
--	end
end


function LuaI_113909_1()
		SetPlot( TargetID() , "range" , "" , 0 )
		BeginPlot( TargetID(), "LuaI_113909_2", 0 )
end


function LuaI_113909_2()
	while true do
		sleep(10)
		AddBuff( OwnerID()  , 500899, 1 , -1 )		--�}����^		--OwnerID�S�Ĳy
		if 	CheckID( TargetID()) == false		then			--TargetID�O���a
			SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 100 )
			CancelBuff( OwnerID()  , 500899)  
			break
		end
		if 	CheckFlag(TargetID(),543413) == true	then	
			SetPlot( OwnerID() , "range" , "LuaI_113909_1" , 200 )
			CancelBuff( OwnerID()  , 500899)  
			break
		end
	end
end


function LuaS_422819_4()	
	WriteRoleValue ( OwnerID()  , EM_RoleValue_PID, TargetID())			--owner�O���̪i���Q
	if CheckID( TargetID() ) == true then				
		SetPosByFlag( TargetID()  , 780471 , 1 )						--�Ǩ�}��
	end
	local TI = Lua_DW_CreateObj("flag" ,113672,780471,2,1)				--���ͽ{�ȮR
	SetDefIdleMotion( TI, ruFUSION_MIME_CROUCH_BEGIN)
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	MoveToFlagEnabled(TI , false )	
	DisableQuest(TI , true )
	if CheckID( TargetID() ) == true then
		AddBuff( TargetID()  , 504766, 1 , -1 )						--�����aBUFF 
		AddBuff( TargetID()  , 503977 , 1 , 60 )						--���a�Q�w�b�a�W
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422819_5]" , 0 ) 			--�i���Q���̧�A�ǰe��...�@�ө_�Ǭ}�ޤ��H
		ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422819_5]" , 0 ) 
	end
	--BeginPlot( OwnerID() , "LuaS_422819_6" , 0 )					--��J�ˬd
	local ANDD =  Lua_DW_CreateObj( "flag"  ,113673,780471,7,1)			
	for i = 1 , 20 , 1 do
		if CheckID(TargetID() ) == false then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
			Delobj(ANDD)
			Delobj(TI)
			return
		end
		if GetDistance(TargetID() ,ANDD ) < 100 then
 			break
		end
		sleep( 10 )
	end
	PlayMotion(  ANDD ,ruFUSION_ACTORSTATE_DEAD)	
	say(TI,"[SC_422819_6]")							--�w�w�Ĵ��A�ש��A�O�ڪ��F��
	sleep(20)
	say(TI,"[SC_422819_7]")							--�o�ƨ��߬O�����A�βŤ�ɥ�����I
	sleep(20)
	say(TI,"[SC_422819_8]")							--�O�ѰO�ϤF�A���H�O�ڡA�{�ȮR��
	sleep(20)
	say(TI,"[SC_422819_9]")							--�A�����̱q���H�᳣�u�঳�ڡ�
	sleep(20)
	DelObj(TI)	
	DelObj(ANDD )
	sleep(30)
	local AN = Lua_DW_CreateObj("flag" ,113673,780471,3,1)				--���ͦw�w�Ĵ�		
	MoveToFlagEnabled(AN , false )	
	DisableQuest(AN , true )
	WriteRoleValue( TargetID() ,EM_RoleValue_IsWalk , 1 )				--�Ψ���
	local TIA = Lua_DW_CreateObj("flag" ,113672,780471,4,1)				--���ͽ{�ȮR
	AdjustFaceDir( AN, TIA, 180 ) 						--�w�w�Ĵ����V����<�I��{�ȮR><���a�ݨ찼�y>
	MoveToFlagEnabled(TIA , false )	
	DisableQuest(TIA , true )
	AdjustFaceDir( TIA , AN , 0 ) 							--�{�ȮR�b�L�k��<�]�O����
	SetDefIdleMotion( TIA, ruFUSION_MIME_EMOTE_SPEAK)
	say(TIA,"[SC_422819_10]")							--�o�u�O��ڦ��@�B�m��A���F��I
	sleep(20)
	say(TIA,"[SC_422819_11]")							--������A�������N�u���o�I�o�쩳���A���L����H
	sleep(20)
	say(AN,"[SC_422819_12]")							--......
	sleep(20)
	say(TIA,"[SC_422819_13]")							--�A�w�g�O���]�ڤF�I�ڭ̤@�_��d�ĩi�_���L�A�H���x���|�����A�K
	sleep(20)
	PlayMotion(  AN ,ruFUSION_ACTORSTATE_ATTACK_2H)			--�w�w�Ĵ��|�C���V�}��
	sleep(20)
	CastSpell( AN, AN, 494290 )							--���ͯS�ĵ��a����
	--AddBuff( AN  , 502724, 1 , 20 )
	SetDefIdleMotion( TIA, ruFUSION_MIME_NONE)
	sleep(20)
	BeginPlot( AN , "LuaS_422819_5" , 0 )
	sleep(15)
	AdjustFaceDir( TIA , AN , 0 )
	--LuaFunc_MoveToFlag( TIA ,780471,8,0)	
	PlayMotion(  TIA ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	say(TIA,"[SC_422819_14]")						--�w�w�Ĵ�...
	PlayMotion(  TIA ,ruFUSION_ACTORSTATE_SIT_BEGIN)			--<�{�ȮR�����b�a>
	sleep(30)
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543413  , 1 )
		SetPosByFlag( TargetID()  , 780471 , 6 )					--���a�Q�ǥX�}�ޥ~ ����<��������543415�X��>
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	if	CheckID( TargetID() ) == true and CheckBuff( TargetID() , 504766 ) == true	then
		CancelBuff( TargetID() , 504766 )  
	end

	if	CheckID( TargetID() ) == true and CheckBuff( TargetID() , 503977 ) == true	then
		CancelBuff( TargetID()  , 503977 )  
	end
	DelObj(TIA)
end

function LuaS_422819_5()
	LuaFunc_MoveToFlag( OwnerID(),780471,5,0)	--�w���V���a��V�A��V�B����>
	DelObj(OwnerID())
end


--�ˬd�G
function LuaS_422819_6()			--��ưt�X�@���վ�
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_PID)	
	for i = 1, 45 , 1 do
		if  CheckID( player ) == false	then
			WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
			break
		end
		sleep(10)
	end
end

--�I�����׬}��������G
function LuaS_113669_0()

	LoadQuestOption( OwnerID() )

	if CheckAcceptQuest( OwnerID() ,422819 ) == true and CheckFlag(OwnerID(),543413) == true	then
		if	CheckFlag(OwnerID(),543428) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_0]","LuaS_113669_1",0) --�p�ݰ_�Ӧ��G�ܯh�֡H
		end
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_1]","LuaS_113669_2",0) --���...�ڦn���i�J�@�Ӥ۹�...
	end
	
	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == false and ReadRoleValue(TargetID() ,EM_RoleValue_Register ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_1]","LuaS_422823_2",0)		--��ߥ浹�ڡA�p�M�߿ĦX�a�I
	end

	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_11]","LuaS_422823_6",0)	--������...
	end

	if CheckAcceptQuest( OwnerID() ,422824 ) == true and CheckFlag(OwnerID(),543417) == false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422824_0]","LuaS_422824_1",0)	--���@�N�h�˴��������������p�C
	end
end

function LuaS_113669_1()
	SetSpeakDetail(OwnerID(),"[SC_113669_2]")	--��K���n��A�ΤF�Ӧh�b�Ƥ��O�٦��l�ܨ��W�k�l�A�ӶO�Ӧh�믫�~�y�L�𮧤@�U�C�o�����v�Ӽҽk�K�N���O�Q�Y�تF���¶�K
	SetFlag( OwnerID() , 543428  , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_3]","LuaS_113669_2",0)	--�߰ݭ�褣���D�O�۹��٬O�u�ꪺ���H�C
end

function LuaS_113669_2()
	SetSpeakDetail(OwnerID(),"[SC_113669_4]")				--(�����ﲤ��h�Ϊ����A«�X�@�٥��~�C)�۹ҡH�A�ݨ�����H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_5]","LuaS_113669_3",0)	--����ӤH...�q���ť�_�ӦW�r�O�{�ȮR���M�w�w�Ĵ��C
end

function LuaS_113669_3()
	SetSpeakDetail(OwnerID(),"[SC_113669_6]")	--�O�ܡH�o�̪��𮧤��²b�A�A�ݨ쪺�γ\�O�ƹ�]�i��O��c���ۼv�A���Ω�b�ߤW�C
	if	CheckFlag(OwnerID(),543428) == false	then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_7]","LuaS_113669_4",0)  --�߰ݦo������ݰ_�Ӧ��G�ܯh�֡C
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_8]","LuaS_113669_5",0)	--�i�D�o��ù�̭׳Q���ɥ]�򪺨ơC
end

function LuaS_113669_4()
	SetSpeakDetail(OwnerID(),"[SC_113669_2]")	--��K���n��A�ΤF�Ӧh�b�Ƥ��O�٦��l�ܨ��W�k�l�A�ӶO�Ӧh�믫�~�y�L�𮧤@�U�A�o�����v�Ӽҽk�K�N���O�Q�Y�تF���¶�K
	SetFlag( OwnerID() , 543428  , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_113669_8]","LuaS_113669_5",0)	--�i�D�o��ù�̭׳Q���ɥ]�򪺨ơC
end

function LuaS_113669_5()
	SetSpeakDetail(OwnerID(),"[SC_113669_9]")	--���ɡB���~�A�ک��դF�A�O���W�k�l���ڭ̤@�B�U��C
	SetFlag( OwnerID() , 543415  , 1 )
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422820
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�Ͼ��l��
--422820�Ͼ��l��	�һݽs���G�L�̧J��113668 �X�СG543412�ϥΥ����H�ʦL  543414���x�b�Ʋ~�G�� �L�̧J�����206148

function LuaS_206149_0()	
--�P�_�ؼЬO�_�_�b�԰���
	if	HateListCount( TargetID())~=0	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_USECHECK_BATTLE_0]", 0 )
		return false
	end


	if	CheckAcceptQuest( OwnerID() , 422820 ) == true	then
		if CheckFlag( OwnerID() , 543414 ) == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_2]" , 0 ) --�b�Ʋ~�����G�馨�\���x��L�̧J�����W�F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_2]" , 0 ) 
			return false
		end
		if 	 ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102755	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_1]" , 0 ) 	--�ؼФ����T
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_1]" , 0 ) 
			return false 
		end

		local INMI =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,102755, 70 )	
		if Type(INMI) == "number" and CheckID(INMI) == false	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_0]" , 0 ) --�A������a��[102755]�@�I�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_0]" , 0 ) 
			return false 
		end
	
	
		if	(CountBodyItem( OwnerID(),206149) >0) and CheckFlag( OwnerID() , 543414 ) ==false	then
			UseItemDestroy( OwnerID() , 206149 )
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
			return false 
		end
	end

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422808_7]" , 0 ) 	
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422808_7]" , 0 ) 
			return false 
end

--���\�ϥβb�Ʋ~
function LuaS_206149_1()
	if CheckID( TargetID() ) == true then
		CastSpell( TargetID(), TargetID(), 494394)--�L�̧J�����W�X�{�I�k�S��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422820_3]" , 0 ) 		--�A�N�b�Ʋ~�����G����[113668]���W�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422820_3]" , 0 ) 
		SetFlag( OwnerID() , 543414 , 1 )					--���X��
	end
end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422821 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�޻�
--422821 �޻�	�һݽs���G �����w113666	�ժ�113633

function LuaS_113666()

	LoadQuestOption( OwnerID() )

	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == false and CheckFlag(OwnerID(),543423) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_0]","LuaS_113666_1",0)		 --�A�O�����w�H
	end
	
	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_4]","LuaS_113666_3",0) 	--�ڲ{�b�n������H
	end

	if CheckAcceptQuest( OwnerID() ,422822 ) == true and  CheckFlag(OwnerID(),543402) == false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422822_0]","LuaS_422822_1",0) --���ӦA���@�U�o�N�|�X�ӤF�C
	end

end

function LuaS_113666_1()
	SetSpeakDetail(OwnerID(),"[SC_422821_1]") 						--�ڡI�A�O����R�������ﲽ�q�@�_�l�����ӥi�Ȥk�H���K[$playername]�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_2]","LuaS_113666_2",0)			 --���áK�o��ڻ��L�A�o�O�b�̭��i�ˡK
end

function LuaS_113666_2()
	SetSpeakDetail(OwnerID(),"[SC_422821_3]")
	SetFlag( OwnerID() , 543422 , 1 )
end

function LuaS_113666_3()
	SetSpeakDetail(OwnerID(),"[SC_422821_5]")						--�i�h�^�����ӧ⨺�ӥs�u�ժܡv���i�Ȥk�H�޻��X�ӡA�o���L�A�A�p���\�����v��ڰ��C							
end

--���b�ժܨ��W
--function LuaS_113633()	--��b�ժ�113633��SCRIPT��
--	LoadQuestOption( OwnerID() )
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false  and CheckFlag(OwnerID(),543433) == false	then
--		if	CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_6]","LuaS_422821_1",0) 	--�p���e�����b�ơB�v�����ǨƱ��u�����O�F�ڪ��H
--		SetFlag( OwnerID() , 543433 , 1 )
--		end
--	end
	
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543434) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543435) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_7]","LuaS_422821_2",0) 	--�ڴ��g�۫H�L�p�K�S�Q��p�O�o�ؤH�K
--		SetFlag( OwnerID() , 543434 , 1 )
--		end
--	end

--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543435) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543436) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_8]","LuaS_422821_3",0)	 	--�ڬݨ�^�����ӥ~���@�ǡK�p�����L�D���æìV���J�o�~�C
--		SetFlag( OwnerID() , 543435 , 1 )
--		end
--	end
	
--	if CheckAcceptQuest( OwnerID() ,422821 ) == true and CheckFlag(OwnerID(),543422) == true and CheckFlag(OwnerID(),543423) == false and CheckFlag(OwnerID(),543436) == false	then
--		if	CheckFlag(OwnerID(),543433) == false and CheckFlag(OwnerID(),543434) == false and CheckFlag(OwnerID(),543435) == false 	 	then	
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_9]","LuaS_422821_4",0)		 --�p�b�ڲ��e�b�ƹL�J�o�~�A���e�̤j�����O�k���ή����K�{�b�^�����ӥ~�S���@��ͪ��K
--		SetFlag( OwnerID() , 543436 , 1 )
--		end
--	end
--end

function LuaS_422821_1()		
	SetSpeakDetail(OwnerID(),"[SC_422821_10]")						--���F�H��w�@�I[$playername]�A�O�o�ͤF��������A���o�ǽ�áH
	SetFlag( OwnerID() , 543433 , 1 )	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_11]","LuaS_422821_5",0)		--�K���A�S����C(�ժܯ��ϡA���٬O�@�N�۫H�p�C)�{�b�^�����ӥ~�Y���\�h�ܲ����J�o�~�A�e�̻ݭn�p���v���C
end

function LuaS_422821_2()
	SetSpeakDetail(OwnerID(),"[SC_422821_12]")						--�o�ͤF����ơH[$playername]�H
	SetFlag( OwnerID() , 543434 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_13]","LuaS_422821_6",0)		--���N��^�����ӥ~����ìV���ͪ��^�_���`�a�C
end

function LuaS_422821_3()
	SetSpeakDetail(OwnerID(),"[SC_422821_14]")						--�e�̫��F�ܡH���D���c����q�S�A�׫Iŧ�e�̡H
	SetFlag( OwnerID() , 543435 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_15]","LuaS_422821_7",0)		--���M���A�n�Щp�˦ۨ��@��C(�ҩ����ڬݡA�p�S���s´�����F�ڡK)
end

function LuaS_422821_4()
	SetSpeakDetail(OwnerID(),"[SC_422821_16]")						--�ͪ��H[$playername]���O�L���i�A�����A�i�D�ڬO����˪��ͪ��H
	SetFlag( OwnerID() , 543436 , 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422821_17]","LuaS_422821_8",0)		--�o�Ͳ��ܡK�P�p���e�a�ڬݪ��ͪ��@��...(�γ\�����ﻡ���S���A�ժܥu�O�b�t���A���O�u�߭n�b�ơC)
end


function LuaS_422821_5()
	SetSpeakDetail(OwnerID(),"[SC_422821_18]")						--[$playername]�A�A�֦��}���B�ũM���S��C���h�U��������A�N��ɧA���J�A���������̡C
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_6()
	SetSpeakDetail(OwnerID(),"[SC_422821_19]")						--[$playername]�A�ڷ|�ɧکү઺���e�̫�_��Ӫ��˻��A�ЧO��ߡB�~�{�C
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_7()
	SetSpeakDetail(OwnerID(),"[SC_422821_20]")						--�ڷQ�]�\�O�b�ƥۡA����í�w�K�K���E�ۧڪ��믫�P�O�q���b�ƥۡA�o�ͤF���ܡH�o�O�_�]��ܵۡA�ڪ��O�q����d�z�H
	SetFlag( OwnerID() , 543423 , 1 )
end

function LuaS_422821_8()
	SetSpeakDetail(OwnerID(),"[SC_422821_21]")						--�ک��դF�A�]�\�O�b�ƪ��L�{�A�o�ͤF�@�ǲ��ܡA�����ɧֳB�z�~�i�H�C[$playername]�A�����~�ߡA�ڷ|�ɧکү�A���e�̪����F��_���R�C
	SetFlag( OwnerID() , 543423 , 1 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422822 
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------���ܪ�����
--422822 ���ܪ����� �һݽs���G�X�l780456 1-3	780457	1-6	�ժ�113679	�X��543402�[��		780457	--�k���צ̦h���t1�������k(���w���H�A�ӭצA�Ҽ{����)

function LuaS_422822_1()
	CloseSpeak( OwnerID())
	if CheckAcceptQuest( OwnerID() ,422822 ) == true and  CheckFlag(OwnerID(),543402) == false and ReadRoleValue( TargetID() , EM_RoleValue_Register )==0	then
		WriteRoleValue(TargetID() ,EM_RoleValue_Register , 1 )
		BeginPlot( TargetID(), "LuaS_422822_2" , 0 )
	end

end

function LuaS_422822_2()
	DisableQuest( OwnerID(),  true)							--�����	TargetID�O�����w
	sleep(10)
	Yell( OwnerID() , "[SC_422822_1]" , 3 )						--��K�٨S�ӡK
	sleep(20)
	Yell( OwnerID() , "[SC_422822_2]" , 3 )						--�A�u������o���M���ܡH
	sleep(20)
	Yell( OwnerID() , "[SC_422822_3]" , 3 )						--�ڡI�ӤF�I�ӤF��
	sleep(10)
	Yell( OwnerID() , "[SC_422822_4]" , 3 )						--���I�I�O�ö]��ӧڨ�����n�I<�⪱�a�ǰe�쨭��>
	sleep(20)
	local Player = SearchRangePlayer(OwnerID() , 200)
	if	Player[0]==-1	then
		WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
		DisableQuest( OwnerID(),  false)
		return
	end
	for i=0,table.getn(Player) do
		if	CheckID(Player[i]) == true and CheckAcceptQuest( Player[i], 422822 ) == true	then
			SetPosByFlag( Player[i]  , 780456 , 1 )				--�ǰe���a	
			AddBuff(  Player[i], 504766 , 1 , -1 )				--�����aBUFF <������g�����w�m�{�A�p�߸��n�A�A�o�{�L���G��i������A>
			AddBuff(  Player[i] ,503977 , 1 , 60 )				--�����aBUFF �ĨĬ���
		end
	end

	local MOM = {}
		for i=1,3,1 do
		MOM[i] = CreateObjByFlag( 113676 , 780457 , i , 0 ) --3���J�o�~
		AddToPartition( MOM[i] , 0 )
		SetFightMode( MOM[i] , 0 , 1 , 1 , 0)
	end

	sleep(20)
	local NO = Lua_DW_CreateObj("flag" ,113741,780456,2,1)
	DisableQuest( NO ,  true)
	MoveToFlagEnabled( NO, false )
	local AA  = Lua_DW_CreateObj("flag" ,113734,780456,3,1)
	DisableQuest( AA  ,  true)
	MoveToFlagEnabled( AA  , false )
	BeginPlot(AA  ,"LuaS_422822_3",0)
	LuaFunc_MoveToFlag( NO,780456,4,0)
	sleep(10)	
	AdjustFaceDir( NO,TargetID()  , 0 )					--�ժܥ��k��	
	sleep(10)	
	AdjustFaceDir( NO,AA  , 0 )
	tell(TargetID()  ,OwnerID(),"[SC_422822_5]")				--�ݡI�o�b�i���K���O�Q�T�{���S���O�H�b��
	sleep(20)	
	AdjustFaceDir( NO,MOM[2], 0 )
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_EMOTE_POINT)		--�ժܫ��I���ʧ@
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_LOOP)	
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_BEGIN)	
	sleep(30)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_END)			--�ժܬI�k�o�X�b�Ƥ���
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_CAST_END)
	CastSpell( MOM[3] ,NO  , 494494)					
	CastSpell( MOM[2] ,NO  , 494494)
	CastSpell( MOM[1] ,NO  , 494494)

	sleep(10)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_BUFF_SP01)

	LuaFunc_MoveToFlag( MOM[1] ,780457 ,4,0)	
	CastSpell( MOM[2] ,MOM[2]  , 491153)
	LuaFunc_MoveToFlag( MOM[1] ,780457 ,6,0)
	--LuaFunc_MoveToFlag( NO,780457 ,5,0)
	--CastSpell( MOM[3] ,MOM[3]  , 491153)
	LuaFunc_MoveToFlag( MOM[3]  ,780457 ,5,0)
	sleep(20)
	tell(TargetID() ,OwnerID(),"[SC_422822_6]")				--�ݨ�S�H�b�A�o�ʤ�F�I
	sleep(20)	
	--AddBuff(MOM[1] , 500654 , 10 , -1 ) 			
	--AddBuff(MOM[2] , 500654 , 10 , -1 ) 					
	--AddBuff(MOM[3] , 502501 , 10 , -1 ) 	

	tell(TargetID() ,OwnerID(),"[SC_422822_7]")				--�K�A�ݨ�F�ܡH����~��M�}�l�ɨ���
	DelObj( MOM[1])
	DelObj( MOM[2])
	DelObj( MOM[3])
	sleep(20)	



	local WOW = {}
		for i=1,3,1 do
		WOW[i] = CreateObjByFlag( 113675 , 780457 , i , 0 ) --3�����`
		AddToPartition( WOW[i] , 0 )
		SetFightMode( WOW[i] , 0 , 1 , 1 , 0)
	end


	SetDefIdleMotion(  WOW[1],ruFUSION_MIME_CAST_BEGIN)
	SetDefIdleMotion(  WOW[2],ruFUSION_MIME_CAST_BEGIN)
	SetDefIdleMotion(  WOW[3],ruFUSION_MIME_CAST_BEGIN)
	sleep(10)
	SetDefIdleMotion(  WOW[1], ruFUSION_MIME_CAST_END)
	SetDefIdleMotion(  WOW[2], ruFUSION_MIME_CAST_END)
	SetDefIdleMotion(  WOW[3], ruFUSION_MIME_CAST_END)
	sleep(10)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_BEGIN)
	sleep(30)
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CAST_END)			--�ժܬI�k�o�X�b�Ƥ���
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_BUFF_SP01)
	CastSpell( WOW[1], NO ,  494495)
	CastSpell( WOW[2], NO ,  494495)
	CastSpell( WOW[3], NO ,  494495)				--�I�k
	AddBuff( WOW[1] , 503974 , 1 , 60 )
	AddBuff( WOW[2] , 503974 , 1 , 60 )
	AddBuff( WOW[3] , 503974 , 1 , 60 )
	--CastSpell( WOW[2], WOW[2],  492667)
	LuaFunc_MoveToFlag( WOW[1] ,780457 ,4,0)
	LuaFunc_MoveToFlag( WOW[3] ,780457 ,5,0)
	sleep(20)
	SetDefIdleMotion( WOW[1], ruFUSION_MIME_DEATH_LOOP)		--�����`������
	SetDefIdleMotion( WOW[2], ruFUSION_MIME_DEATH_LOOP)
	SetDefIdleMotion( WOW[3], ruFUSION_MIME_DEATH_LOOP)
	sleep(10)	
	LuaFunc_MoveToFlag( NO,780456,6,0)	
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)		--�ժ��ۤU���
	sleep(20)
	tell(TargetID() ,OwnerID(),"[SC_422822_8]")				--���`�����F�K�o���M���F���`�K
	PlayMotion(  NO ,ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(20)
	DelObj( WOW[1])
	DelObj( WOW[2])
	DelObj( WOW[3])
	LuaFunc_MoveToFlag( NO,780456,2,0)	
	DelObj (NO)	
	sleep(10)	
	PlayMotion(  OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)						
	tell(TargetID() ,OwnerID(),"[SC_422822_9]")				--�i�c�I�٭Y�L��ƨ��^�h�I���䨺�����o���H�쩳�O�֡H�S�O�Q�F���ܡH
	Player = SearchRangePlayer(OwnerID() , 200)
	if	Player[0]==-1	then
		WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
		DisableQuest( OwnerID(),  false)
		return
	end
	for i=0,table.getn(Player)-1 do
			--	say(Player ,"77777")
			--	say(Player[i],"88888")			
		if	CheckID(Player[i]) == true and CheckAcceptQuest( Player[i], 422822 ) == true	then  		
			SetFlag(Player[i], 543402 , 1)
			AdjustFaceDir( OwnerID()  ,Player[i], 0 )
			tell(Player[i],OwnerID(),"[SC_422822_10]")	--�֥h������ﲽ�q���A�i�Ȥk�H�S�ʤ�F�I
			DisableQuest( OwnerID(),  false)
		end
		if	CheckID(Player[i]) == true and CheckBuff( Player[i] , 504766 ) == true then
			CancelBuff( Player[i] , 504766 )  
		end

		if	CheckID(Player[i]) == true and CheckBuff( Player[i] , 503977 ) == true then
			CancelBuff( Player[i] , 503977 )  
		end
	end
	WriteRoleValue(OwnerID() ,EM_RoleValue_Register , 0 )
end

function LuaS_422822_3()
	LuaFunc_MoveToFlag( OwnerID(),780456,5,0)
	sleep(50)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)			--�t�X�@�����ʧ@
	sleep(180)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	LuaFunc_MoveToFlag( OwnerID(),780456,3,0)	
	DelObj (OwnerID())
end


-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422823 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�O�@������
--422823 �O�@������	�һݽs���G�X�l780458 1-	�X��543416�O�@������  543437���h	ŧ����NPC 102795

function LuaS_422823_2()
	CloseSpeak( OwnerID() )						--OwnerID �ګ�TargetID������				
	--say(OwnerID(),"447788" )		
	if CheckAcceptQuest( OwnerID() ,422823 ) == true and CheckFlag(OwnerID(),543416) == false and CheckFlag(OwnerID(),543437) == false and ReadRoleValue(TargetID() ,EM_RoleValue_Register ) == 0 then
		BeginPlot(TargetID(),"LuaS_422823_9",0)
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
	end
end

function LuaS_422823_9()		
	DisableQuest( OwnerID(),  true)					--TargetID�O���a 
	say(OwnerID(),"[SC_422823_3]")					--�S���D�� OwnerID�{�ȮR
	Hide(OwnerID())									--�̫�n���o�{�X��
	local IV = Lua_DW_CreateObj("flag" ,102847,780458,1 ) 			--SNPC������
	DisableQuest( IV , true)
	WriteRoleValue ( IV  , EM_RoleValue_PID, OwnerID())
	MoveToFlagEnabled(IV, false )
	LuaFunc_MoveToFlag( IV ,780458,2,0)					--�����飼�V�����w�������	
	PlayMotion( IV , ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	sleep(50)	
	PlayMotion( IV , ruFUSION_ACTORSTATE_CRAFTING_END)
	local FOE = Lua_DW_CreateObj("flag" ,102795,780458,3 ) 			--ŧ����NPC�X�{<���~�ϥΤ��t�k�N--�Щ]�ܳ]>--������n��FOE�z
	SetAttack(FOE ,IV)
	--BeginPlot(OwnerID(),"LuaS_422823_10",0)
	WriteRoleValue ( FOE  , EM_RoleValue_PID, IV)
	WriteRoleValue ( FOE , EM_RoleValue_Register, 0 )
	BeginPlot(IV, "LuaS_Discowood_CheckPeace" , 0 )
	SetPlot(FOE,"dead","LuaS_422823_4",0 )
	BeginPlot(FOE,"LuaS_422823_5",0)
	local Speak = 0

	while true do
		if Speak == 0 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_4]")						--�ĤH�ӤF�I
		end
		if Speak == 2 and CheckID(IV) == true and CheckID(FOE) == true then
			say(FOE,"[SC_422823_5]")						--ŧ���̡G�O�A�F�F�L�d���H�I�{�ȮR�I
		end
		if Speak == 4 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_6]")						--������G�A�b�J������H�ڪ��W�r�O������C
		end
		if Speak == 6 and CheckID(IV) == true and CheckID(FOE) == true then
			say(FOE,"[SC_422823_7]")						--ŧ���̡G���ǥͪ��O�p�G�N�w�ƪ��a�H��e���ܦ��u�n�ϥβb�ƤO�q�N�|���`�A�ժܤj�H�]���o�˶ˤߦ۳d��
		end
		if Speak == 8 and CheckID(IV) == true and CheckID(FOE) == true then
			say(IV,"[SC_422823_8]")						--�o�ݻű��ͤ��u�@�H�˲��ݨ��A�A�~�O�Q�o���t��é�F�F�C
		end
		sleep(10)
		if Speak < 10 then
			Speak = Speak + 1
		end
		if CheckID(IV)==false then					--�p�GSNPC���b
			if CheckID( FOE ) == true and ReadRoleValue( FOE , EM_RoleValue_OrgID ) == 102795 then
				DelObj (FOE)					--�R��ŧ����
			end
			Show(OwnerID(), 0)				--�q�X�쥻������
			break
		end
	end
	WriteRoleValue( OwnerID(), EM_RoleValue_Register , 0 )
	DisableQuest( OwnerID() , false )
end
		
function LuaS_422823_4()	--�Ǫ����`�@��
	local IV =ReadRoleValue( OwnerID() , EM_RoleValue_PID )		--TargetID �OIV
	local TI =ReadRoleValue( IV , EM_RoleValue_PID )
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
			if	CheckAcceptQuest( Player ,422823 )==true	then	
			--	say(Player,"45" )
				setFlag( Player, 543437 , 1 )
			end
	DelObj (IV)
	Show(TI , 0)
	end
	return true
end
	
function LuaS_422823_5()	--�ˬd---ŧ���̦�q�C��@�b��SAY�G
	while 1 do
		if	ReadRoleValue(OwnerID(),EM_RoleValue_HP)/ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)< 0.5 then 
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register )  == 0 then	
			say(OwnerID(),"[SC_422823_9]")				--�_�I�̡I�o��A���L��ܶܡH�A�u�����D�o�p�e�n�����ơH
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register, 1 )	
			end
			sleep(30)
			if	ReadRoleValue( OwnerID() , EM_RoleValue_Register )  == 1 then
			say(OwnerID(),"[SC_422823_10]")				--�{�M�u�����ĤH�a�I
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register, 2 )
			end
		end	
	sleep(10)
	end				
end		
		
function LuaS_422823_6()
	SetSpeakDetail(OwnerID(),"[SC_422823_12]")					--�ժܬ��Ӫ�ŧ���̤S�Q�������V�c�u�ۡA�G�N���ǬD���������ܤ��Ƨڭ̡A�A���|�u���۫H�L�������ǧa�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_13]","LuaS_422823_7",0)	--�ڬ۫H�p�A�o�̤����ӥγo�ب�����q�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422823_14]","LuaS_422823_8",0)	--������K�p�K�O���O�u�����ƿf�ۧڡH
end

function LuaS_422823_7()
	--PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	SetSpeakDetail(OwnerID(),"[SC_422823_15]")				--�O�ڡ㤣�|���o�o�N�Ӥ[�A�u�t�̫�X�B�N�৹���A��ɭԪ֩w�G�o�S�X�u���୮���աK
	SetFlag( OwnerID() , 543416 , 1 )					--���X��
end
	
function LuaS_422823_8()
	SetSpeakDetail(OwnerID(),"[SC_422823_16]")				--�ҥH�K���ާڭ̬۳B�o��[�@�q�ɶ��A�A�٬O��ܬ۫H�ժܡH�K��̫�A�ڳ��M�٬O�C�����鵹�o�K
	SetFlag( OwnerID() , 543416 , 1 )					--���X��
end


---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------422825 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------�u��
--422825 �u��	<�Ҽ{�[�ʧ@>�һݽs���G	�X�l780460	�X�СG543418	543428�ժܲ{��

function LuaS_422825()	--�������e��������
	DisableQuest( OwnerID() , true)
	SetPlot( OwnerID() , "touch" ,"LuaFunc_Obj_BUSY" , 40 )
	SetFlag( TargetID() , 543418 , 0 )
	SetPosByFlag( TargetID()  , 780460 , 1 )									--�ǰe���a��u�Y�Ӧa��v
	local TI  = Lua_DW_CreateObj("flag" ,113671,780460,2,1)
	WriteRoleValue( TI  , EM_RoleValue_PID , TargetID() )
	DisableQuest( TI,  true)
	AddBuff( TargetID()  , 505009 , 1 , 60)										--�����aBUFF 
	AddBuff( TargetID()  , 503977 , 1 , 60 )										--���a�Q�w�b�a�W

	 BeginPlot( TI   , "LuaS_422825_2" , 0 )	--��J�ˬd
									
	AddBuff( TI  , 505074, 1 , 60 )									--�����鶴�W���t���Ţ�n
	SetDefIdleMotion( TI, ruFUSION_MIME_EMOTE_SPEAK)
	for i = 1 , 20 , 1 do
		if CheckID( TargetID() ) == false then
			Delobj(TI)
			SetPlot( OwnerID() , "touch" ,"" , 0 )
			DisableQuest( OwnerID() , false)
			return
		end
		if GetDistance( TargetID() , TI ) < 150 then
			break
		end
		sleep(10)
	end
	sleep(50)
	say(TI  ,"[SC_422825_0]")		--ĭ�t���c�i�ʪ���G�K�¤���������q�K��Ŧ�K���J�����K
	sleep(30)
	say(TI  ,"[SC_422825_1]")		--�A��L�̧J����֦s�i�ڷQ�n���O�СK�{�b�A�u�ѤU�A���F��H���K
	sleep(30)
	say(TI  ,"[SC_422825_2]")		--�ܤ[�B�ܤ[�������o�اY�N����Ӫ������ԷX�A�N���O�ڷ��n�����w�w�Ĵ����Pı��
	sleep(20)
	SetDefIdleMotion( TI, ruFUSION_MIME_NONE)
	sleep(10)
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	say(TI  ,"[SC_422825_3]")		--�N�֤F�A�֩�L�������A�@�I�u����A���F��A�M���������԰����ܱo��[�A����
	sleep(20)
	say(TI  ,"[SC_422825_4]")		--�A���u�q���㰣�o�e���Q�ڴ��F�������A�A�}�d���Ʊ��A����짴�A�i���K�ڤߤ��������u���L�A�w�w�Ĵ��C
	sleep(30)
	say(TI  ,"[SC_422825_5]")		--�X�d�~�e�ڱϤ��F�L�A�ܤ֧ڥi�H���X�@�ӹ��L�@�˪����w�A�|ť�ڪ��ܡA���A����ժܨ��Ӥk�H�g�b�A�N���A�����L���@������
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)

	--BeginPlot( TI , "LuaS_422825_3", 0 )	
	say(TI,"[SC_422825_6]")		--�u�{�ȮR�v��ڪ��W�A�A�i�H�o�˳�ڡA�]����ک���A���F��H���Ķi�L���餺��A�A�]�|�@���O�o�o�ӦW�r
	sleep(30)
	
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CAST_BEGIN)					--���ʧ@

	--CastSpell( TI , TI , 494410 )

	CastSpell( TI , TargetID(), 492184)								--�I�k
--	SetDefIdleMotion( TargetID(), ruFUSION_MIME_CROUCH_BEGIN)							--���a
	say(TI,"[SC_422825_7]")		--�P�ʪ�Ÿ�ݧa��˷R��[$playername]�A�A���F��q����}�l�k�ݩ�ڡ�
	sleep(20)
	local NO  = Lua_DW_CreateObj("flag" ,113741,780460,4,1)
	--PlayMotion(  TI ,ruFUSION_ACTORSTATE_CAST_END)		
	DisableQuest( NO,  true)
	AdjustFaceDir( NO  ,TI , 0 ) 	
	local NPC = Lua_DW_CreateObj("flag" ,113734,780460,5,1 )		----���H�X�{
	DisableQuest( NPC,  true)
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422825_3" , 0 )
	AddBuff( TI , 502383 , 0 , 1 )
	sleep(10)
	PlayMotion( NO , ruFUSION_ACTORSTATE_CAST_INSTANT)	--�ժܬI�k�}�a�{�ȮR�k�N	
	sleep(10)
	AddBuff(TI ,502730 , 0, 1)
	sleep(20)
	SetDefIdleMotion( NO, ruFUSION_MIME_EMOTE_SPEAK)
	say(NO  ,"[SC_422825_8]")			--�g�~���F��...�{�ȮR...�O�A�~����U�h�F...
	sleep(20)
	say(TI,"[SC_422825_9]")			--��I�ժܡA���Y���_�Ӫ��å�A���_�p�������ߪ�������
	sleep(20)
	say(NO  ,"[SC_422825_10]")			--�w�w�Ĵ��w�g���b�F�A�N�ⰵ�X���w�S��p��O�H
	sleep(20)
	SetDefIdleMotion( NO, ruFUSION_MIME_NONE)
	say(TI,"[SC_422825_11]")			--�S���I�L���b�F�A�Ө����O�p�`���I
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	AdjustFaceDir(  TI,NO , 0 ) 
	sleep(20)
	say(TI,"[SC_422825_12]")  			--�N���묹�ڪ��F��B�N��p���������A�ڤ] �|��L���X�ӡA�p�����@�a�I
	PlayMotion(  TI ,ruFUSION_ACTORSTATE_ATTACK_1H)

	--CastSpell( TI, TI, 490169)			--�{�ȮR��ۤv�I�k
	DelObj( TI )
	if	CheckBuff( TargetID() , 505009) == true then
		CancelBuff( TargetID() , 505009 )  
	end

	if	CheckBuff( TargetID() , 503977 ) == true then
		CancelBuff( TargetID() , 503977 )  
	end
	AdjustFaceDir( NPC,NO , 0 ) 	
	sleep(20)
	say(NPC,"[SC_422825_14]")			--�ڥ��^���̬ݬݱ��p�C
	PlayMotion(  NPC ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(20)
	BeginPlot( NPC , "LuaS_422825_1" , 0 )
	AdjustFaceDir( NO  ,TargetID(), 0 ) 	
	sleep( 10 )
	DelObj( NO )
	if CheckID( TargetID() ) == true then
		SetFlag( TargetID() , 543418 , 1 )
	end
	SetPlot( OwnerID() , "touch" ,"" , 0 )
	DisableQuest( OwnerID() , false)
end

function LuaS_422825_1()
	LuaFunc_MoveToFlag( OwnerID(),780460,7,0)
	DelObj( OwnerID() )
end

function LuaS_422825_2()			--��ưt�X�@���վ�
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_PID )	
	for i = 1, 60, 1 do
		if  CheckID( player ) == false	then
			break
		end
		sleep(10)
	end
	
end

function LuaS_422825_3()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag( OwnerID(),780460,6,0)			--tar�O������	
	if CheckID( Player ) == true then
		AdjustFaceDir( OwnerID(),Player , 0 ) 
		sleep(10)
	end	
	PlayMotion(   OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)	--���ʧ@���ߪ��a
	say( OwnerID(),"[SC_422825_13]")				--�A�٦n�ܡH
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------������
function LuaS_422824_1()
	say(TargetID(),"[SC_422824_1]")		--TargetID�O�{�ȮR say�ڰe�A�L�h�a��
	SetPosByFlag( OwnerID(), 780459 , 1)		--�ǰe
--	SetFlag( OwnerID() , 543429 , 1 )		--<�����a�@�ӺX�СA����ݤ���쥻���{�ȮR<���\�˴���]�ݤ���쥻��>>�A�s���{�ȮR�b���������y>
end


function LuaS_102796_1()
	CloseSpeak( OwnerID())				--�����B���i�s
	ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_422824_7]" , 0 ) 
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_7]" , 0 ) 
end

function LuaS_102796_2()
	CloseSpeak( OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register +2 ) == 0 then
		WriteRoleValue ( TargetID()  , EM_RoleValue_Register+2, 1 )			--TargetID�O��������
		if	(CheckAcceptQuest(OwnerID(),422814)==true )	then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422814_1]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422814_1]" , 0 ) 
		end
		if	(CheckAcceptQuest(OwnerID(),422824)==true )	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422824_3]" , 0 ) --�A���ܩ|�������A�����������O�u�ȯ����Ҽˬ�M���Ǥ���l...�ᦱ�h�W...�L���G�}�l�����ܤ�...
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_3]" , 0 ) 
		end
		BeginPlot( TargetID() , "LuaS_102796_3" , 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1, "[SC_422824_7]" , 0 ) 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422824_7]" , 0 ) 
	end
end



function LuaS_102796_3()
	Hide(OwnerID())	
	local BlackMist = ReadRoleValue( OwnerID() , EM_RoleValue_PID )							--OwnerID�O������
	Hide( BlackMist )
	local WATER = Lua_DW_CreateObj("flag" ,102796,780459,2 ) 			--�إX�դ�����
	AddBuff( WATER , 500900 , 0 , 600 )
	SetPlot( WATER , "dead" , "LuaS_KK_Dead" , 0 )					--���`�@��--�������������|��
	--DisableQuest( WATER,  true)							--�����
	--MoveToFlagEnabled( WATER  , false )						--������

	
	local NOF = Lua_DW_CreateObj("flag" ,113812,780459,3 ) 				--�إX�ժ�
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+7 , NOF)			--�N�ժܼg�iWATER��������
	WriteRoleValue ( NOF ,  EM_RoleValue_Register+7 , WATER )
	local MM = Lua_DW_CreateObj("flag" ,113935,780459,3 )
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+6 , MM)
	DisableQuest( NOF,  true)							--�����
	MoveToFlagEnabled( NOF  , false )						--������

	local TI = Lua_DW_CreateObj("flag" ,114093,780459,4 ) 				--�إX�{�ȮR
--	WriteRoleValue ( WATER  ,  EM_RoleValue_Register+8 , TI)			--�N�{�ȮR�g�iWATER��������
	WriteRoleValue ( TI,  EM_RoleValue_Register+8 , WATER  )		
	DisableQuest( TI,  true)							--�����
	MoveToFlagEnabled( TI  , false )						--������

	BeginPlot( NOF , "LuaS_102796_4" , 0 )					--�ժ�
	BeginPlot( TI  , "LuaS_102796_5" , 0 )						--�{�ȮR
	
	BeginPlot( MM , "LuaS_102796_7" , 0 )

--	--���}�԰�����--�W�L���ɮɶ�<�ȭq4����>
	for j =0,240,1 do
		local  TT=ReadRoleValue(WATER ,EM_RoleValue_MaxHP)
		local  EE= ReadRoleValue(WATER ,EM_RoleValue_HP)
		sleep(10)
		local TempID
		if CheckID( WATER ) == false then 	--�����ˬd�¤�����NPC�b���b
			break
		end
		if	EE/TT<0.5	then

			for i=0 , HateListCount( WATER )-1 do 
				TempID = HateListInfo(WATER ,i , EM_HateListInfoType_GItemID )
				
				if	CheckAcceptQuest( TempID , 422814)==true	then
					SetFlag( TempID, 543451, 1 )
				end
				if	CheckAcceptQuest( TempID , 422824)==true 	then
					SetFlag( TempID, 543417, 1 )
					SetFlag( TempID, 543454, 1 )
				end
			end

			SetStopAttack( WATER )
			Lua_CancelAllBuff( WATER ) 
			SetRoleCamp( WATER  , "Visitor" ) 			--���ܰ}��
			SetFightMode ( WATER ,0,0, 0,0 )
			break
		end
		if HateListCount( WATER ) == 0 and j > 30 then 	--���}�԰�����--����C�����a���b--�i�঺�������}�B�_�u
			break
		end
		
	end
	if CheckID(WATER) == true then
		DelObj( WATER )						--�R���¤�����NPC
	end
	if CheckID(NOF) == true then
		DelObj( NOF )
	end
	if CheckID(TI) == true then	
		DelObj( TI )
	end
	if CheckID(MM) == true then	
		DelObj( MM)
	end
	Show( BlackMist , 0 )
	Show(OwnerID() , 0)							--�q�X�դ�����
	WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+2, 0 )

end
function LuaS_102796_4()
	local MM=ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )  
	local TT = Lua_DW_CreateObj("flag" ,113935,780459,3,1 )
	SAY(OwnerID(),"[SC_422814_2]")---[102796]�A�O�ڡA�Ať�o���ܡH
	sleep(30)
	SAY(OwnerID(),"[SC_422814_3]")--�M���L�ӡA�O���ƨg���ѧA�t�䪺���F�C
	sleep(30)
	SAY(OwnerID(),"[SC_422814_4]")--����A[113736]�����F�Q����Ҿޱ��A�{�b���Lť���U�ڪ����y�C�����ɧ����L�M���L�ӡI
	CastSpell(OwnerID(),MM,  494407 )
	SAY(MM,"[SC_422814_2]")---[102796]�A�O�ڡA�Ať�o���ܡH
end
function LuaS_102796_5()
	local WATER=ReadRoleValue( OwnerID() , EM_RoleValue_Register+8 )  
	--TI��WATER�I�k<�޾ɫ��k�N���Pı�B�u���S��>
	WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 0 )
	sleep(30)
	while 1 do
			CastSpell(OwnerID(),WATER,  492184)	
			--	CastSpell(WATER,OwnerID(),  494407 )
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 0 then	
			say(OwnerID(),"[SC_422824_4]")				--������...�G�M�Q�v�T�F�K�צ�L����աI�ڨӨ�U�A�C 
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 1 )	
			end
			sleep(50)
			if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 1 then
			say(OwnerID(),"[SC_422824_5]")				--���O�u�ȯ��A�A�]�S�Q�L�|�ܦ��o�˧a�H
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 2 )
			end
			sleep(50)
			if 	ReadRoleValue( OwnerID() , EM_RoleValue_Register+6 )  == 2 then	
			say(OwnerID(),"[SC_422824_6]")				--�A�@�q�ɶ���A���h�W�N�|�����A�X�{�b�ɱ�����A�������
			WriteRoleValue ( OwnerID()  , EM_RoleValue_Register+6, 3 )	
			end	
	sleep(10)
	end				
end
function LuaI_112506_0()
	local BlackMist = LuaFunc_CreateObjByObj( 113677 , OwnerID() )
	Lua_ObjDontTouch( BlackMist )
	BeginPlot( BlackMist , "LuaS_113677" , 0 )
	WriteRoleValue( OwneRID() ,EM_RoleValue_PID , BlackMist )
end
function LuaS_113677()	--�������S�Ķ���
	while true do
		AddBuff( OwnerID() , 500900 , 0 , 600 )
		sleep(600)
	end
end

function LuaS_102796_7()
 	CastSpell( OwnerID(), OwnerID(),  494408 )
end