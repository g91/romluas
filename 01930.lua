--423363
function LuaS_423363_0()--(�I���i�h�A�t��)
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423363)==true )and( CheckCompleteQuest( OwnerID(),423363)==false) and	CheckFlag( OwnerID() , 544266) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423363_0]","LuaS_423363_1",0)	--�n�A�ڥi�H�M�A������i�h�ݡC
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423363_0]","LuaS_423363_2",0)	--�n�A�ڥi�H�M�A������i�h�ݡC
		end
	end
	if	(CheckAcceptQuest(OwnerID(),423365)==true )and( CheckCompleteQuest( OwnerID(),423365)==false) and	CheckFlag( OwnerID() , 544280) ==true	then
		if	CountBodyItem( OwnerID(), 207722)<1	then			
			GiveBodyItem( OwnerID(), 207722, 1 )			
		end
	end
	if	(CheckAcceptQuest(OwnerID(),423366)==true )and( CheckCompleteQuest( OwnerID(),423366)==false)	then
		if	CountBodyItem( OwnerID(), 207728)>0	then	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423366_4]","LuaS_423366_000",0)	--���U�Ӹӫ�򰵡H		
		end
	end
end

function LuaS_423366_000()
	SetSpeakDetail(OwnerID(),"[SC_423366_3]")	--�i�h�G�n�å뮳��[207728]�F�I�ڭ̥i�H�^�h��n���F�F�I 
end

function LuaS_423363_2()
	SetSpeakDetail(OwnerID(),"[SC_423363_1]")	--�i�h�G�n�å�n�����س����A�n�å�Ӥj�A�e���Q�o�{�� 
end

function LuaS_423363_1()
	CloseSpeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue ( TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(),"LuaS_423363_3",2)
	end		
end

function LuaS_423363_3()
	AddBuff( TargetID()  , 507163 , 1 , 180 )
--	local BODO = Lua_DW_CreateObj("flag" ,115884,780692,2,1)					--115884�i�h�B�X�l�s��780692�B2
	local BODO = LuaFunc_CreateObjByOBj(115884, OwnerID() )
	DisableQuest( BODO , true )									--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(BODO , false )
	WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODO ,EM_RoleValue_Register+2,TargetID())					--�⪱�a�g�i�t���i�h
	WriteRoleValue( BODO ,EM_RoleValue_Register+3,OwnerID())					--���i�h�g�i�t���i�h
	BeginPlot(BODO , "LuaS_423363_11" , 0 )
	BeginPlot(BODO , "LuaS_423363_4" , 0 )
end	

function LuaS_423363_4()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QBODO  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	

	local ANT = Lua_DW_CreateObj("flag" ,115886,780692,3,1)					--115884�i�w�S�B�X�l�s��780692�B3
	DisableQuest( ANT , true )									--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(ANT , false )
	WriteRoleValue( ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ANT,EM_RoleValue_Register+3,OwnerID())					--��t���i�h�g�i�t���i�w�S
	BeginPlot( ANT, "LuaS_423363_CHECK" , 0 )							--���w�S�j���ˬd--���a���b�N�R���w�S

	local ELY = Lua_DW_CreateObj("flag" ,115885,780692,4,1)					--115884��Q�B�X�l�s��780692�B4
	DisableQuest( ELY , true )									--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(ELY , false )
	WriteRoleValue( ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ELY,EM_RoleValue_Register+3,OwnerID())					--��t���i�h�g�i�t����Q
	BeginPlot( ELY, "LuaS_423363_CHECK" , 0 )							--����Q�j���ˬd--���a���b�N�R����Q
	
	sleep(10)
	AdjustFaceDir(OwnerID(), player , 0 )
	Yell( OwnerID(), "[SC_423363_2]" , 3 )								--�i�h�G�Ӧn�F�I�{�b�س����n�Q��k��A�ð_�ӡ�	
	sleep(20)
	Yell( OwnerID(), "[SC_423363_3]" , 3 )								--�i�h�G��...���F�B���F�A�n�å���P�B�O�ȡ�
	sleep(20)
	Setposbyflag(ANT , 780693, 1 ) 								--�ǰe�w�S
	AdjustFaceDir(ANT , ELY, 0 )
	sleep(10)
	BeginPlot( ANT, "LuaS_423363_ANT_MOVE" , 0 )						--�w�S���򲾰�
 	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� IDNum
	--��1 �h�w�]�� TargetID()
	DW_CancelTypeBuff(68, player  )
	Setposbyflag(player  , 780692, 5 ) 								--�ǰe���a
	AddBuff( player  , 507322, 1 , 180 )				
	Setposbyflag(OwnerID(), 780692, 2 ) 								
	AddBuff( player   , 503977 , 1 , 180 )								--�����aBUFF (�ĨĬ���)
	sleep(10)
	Setposbyflag(player  , 780692, 5 ) 								--�ǰe���a
	if	checkbuff(player  ,507322)==false	then
		AddBuff( player  , 507322, 1 , 180 )
	end	
	Tell(player ,OwnerID(),"[SC_423363_4]")							--�����ܡG�u�Ϊ���k�A��a�H
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423363_5]")							--�����ܡG�ڳ��o�˸��M���������A�b�o�̤@�˦n�Ρ�
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423363_6]")							--�����ܡG�ڡI�A�ݥL�̡I
	sleep(80)

	Yell( ANT , "[SC_423363_7]" , 3 )	--�w�S�G��Q����...
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_8]" , 3 )	--��Q�G�u��...�O�A�A�w�S�Jù...
	sleep(30)

	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423363_9]" , 3 )	--�w�S�G�ڡA�ӺɤO�q�B���J���v�A�ӫ�A�׵d���C
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_10]" , 3 )	--��Q�G�A�S��...�u�h�H�Ӻɦ۵M���O�����F�q�ӨS���s���U�Ӫ�...
	sleep(30)

	
	Yell( ANT , "[SC_423363_11]" , 3 )	--�w�S�G���`�u�O�^�k�۵M�A���F���F�����ӡA�ڤ��ᮬ���X�묹�ۤv���M�w�C
	sleep(30)
	
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( ELY , "[SC_423363_12]" , 3 )	--��Q�G��A�����A�o�~�O�A�A���ǧC���ۼv�l�׾Ǥ��Ӫ��L�p�C
	sleep(30)

	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( ANT , "[SC_423363_13]" , 3 )	--�w�S�G...�L�p�H���A���F�t�����л��A�L�R�۵M�B�����U���A�½ñڤH�ͦs���@�ɡA�o�ǳ��O�ڪ��p��...
	sleep(30)

	Yell( ANT , "[SC_423363_14]" , 3 )	--�w�S�G�ڤ]...�����Q�ˮ`�p�C
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--<��Q�n�Y>
	Yell( ELY , "[SC_423363_15]" , 3 )	--��Q�G�O�ڪ���O�����A�~�L�k�P�A���b�P�@�u�W�A�ڥu�ण�_�M�D��h���O�q�Ӧu�@��A�½ê��@�ɡC
	sleep(40)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_16]" , 3 )	--��Q�G��...��ڤW�o���A�a�Q�T�ҲŤ�v�T�A�Ʀܳs�ֱڤH�I�_...�p�����A���a��A�L�̷|�M�^�L�R�۵M���ѩʡC
	sleep(50)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_17]" , 3 )	--��Q�G�ڤ��ߩȦ��`�A���ھ֦����۵M���O�w���T�ҲŤ�v�T�Ӳ`�A���ȵL�k�^�k�۵M�h��A�L�k�A�P�A�@�P�u�@���ӡC
	sleep(40)
	
	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423363_18]" , 3 )	--�w�S�G�ڤ��|���ڤH�A�]�T�ҲŤ��묹�A�����ಾ�p���W���t����q�C
	sleep(30)

	Yell( ANT , "[SC_423363_19]" , 3 )	--�w�S�G�۫H�ڡC	
	sleep(10)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	CastSpell( ANT , ELY , 495977)						--�X�{�S��
	sleep(60)
	CastSpell( ANT , ANT , 493548)
	sleep(20)
	CastSpell( ANT , ANT , 494221)
	CastSpell( ELY , ELY , 493548)	
	sleep(20)
	DelObj(ANT)
	DelObj(ELY)

	local ANT2 = Lua_DW_CreateObj("flag" ,115912,780692,6,1)					--115884�i�w�S2�B�X�l�s��780692�B6
	DisableQuest( ANT2 , true )									--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(ANT2 , false )
	WriteRoleValue( ANT2 ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ANT2,EM_RoleValue_Register+3,OwnerID())					--��t���i�h�g�i�t���i�w�S2
	BeginPlot( ANT2, "LuaS_423363_CHECK" , 0 )							--���w�S2�j���ˬd--���a���b�N�R���i�w�S2
	
	local ELY2 = Lua_DW_CreateObj("flag" ,115913,780692,7,1)					--115884��Q2�B�X�l�s��780692�B7
	DisableQuest( ELY2 , true )									--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(ELY2 , false )
	WriteRoleValue( ELY2 ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ELY2,EM_RoleValue_Register+3,OwnerID())					--��t���i�h�g�i�t����Q2
	BeginPlot(ELY2, "LuaS_423363_CHECK" , 0 )							--����Q2�j���ˬd--���a���b�N�R����Q2
	
	sleep(10)
	Yell( ELY2 , "[SC_423363_21]" , 3 )	--��Q�G�o�@���A�������A�C
	sleep(30)
	Yell( ANT2 , "[SC_423363_22]" , 3 )	--�w�S�G��A�u�n�O�ӫj�j�ۤv�C
	sleep(10)
	LuaFunc_MoveToFlag( ANT2 ,780693,4,0)
	SetFlag(player , 544266, 1)								--���������X��
	sleep(20)
	DelObj(ELY2)
	DelObj(ANT2)
	DelObj(OwnerID())
	CancelBuff(player  , 507322)
	CancelBuff(player  , 507163)
	CancelBuff(player  , 503977)
	Setposbyflag(player  , 780692, 8 ) 							--�ǰe�^��a

	WriteRoleValue( QBODO   , EM_RoleValue_Register+1 , 0 )
end	

function LuaS_423363_ANT_MOVE()
	LuaFunc_MoveToFlag( OwnerID(),780693,2,0)
end


function LuaS_423363_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	local QBODO =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	for i = 1, 180 , 1 do										--��ưt�X�@���վ�
		if	CheckID( player ) == false	or	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1	or	CheckAcceptQuest(player ,423363)==false	then
			CancelBuff(player , 503977)
			CancelBuff(player , 507163)
			CancelBuff(player  , 507322)
			Setposbyflag(player  , 780692, 8 ) 						--�ǰe�^��a
			DelObj(OwnerID())
			WriteRoleValue(QBODO , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423363_CHECK()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--�t���i�h
	for i = 0 , 180 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end


--423365--(�I���G����몺�K�֡A����)
--�����ȫ�i�ݨ�Ĥ@�ʦb���e���K��--�쥻�N�ئb�a�WCLIENT����
function LuaS_423365_Acc()
	SetFlag(TargetID(), 544280, 0)	
end


--�I�����~�e�ˬd
function LuaS_423365_99()
	if	(CheckAcceptQuest(OwnerID(),423365)==true )	and	( CheckCompleteQuest( OwnerID(),423365)==false) 	and	
		CheckFlag( OwnerID() , 544280) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--�ؼХ��b���L��
		return false
		end
	end

	if	(CheckAcceptQuest(OwnerID(),423365)==true )	and	( CheckCompleteQuest( OwnerID(),423365)==false)	and	
		CheckFlag( OwnerID() , 544280 ) ==true	then
		return true
	end
end

function LuaS_423365_100()
	if 	CheckAcceptQuest( OwnerID() , 423365) == true	and	(CheckFlag( OwnerID(), 544280)==false)		and
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then	
		AddBuff( OwnerID() , 507164 , 1 , 60 )				--CLIENT�P�_��		
		WriteRoleValue(TargetID() , EM_RoleValue_Register+1 , 2 )

		local BODO = Lua_DW_CreateObj("flag" ,115806,780693,5,1)				--115806�i�h
		DisableQuest( BODO , true )								--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
		MoveToFlagEnabled(BODO , false )
		WriteRoleValue( BODO,EM_RoleValue_Register+2,OwnerID())				--�⪱�a�g�i�Ѻt���i�h
		WriteRoleValue( BODO,EM_RoleValue_Register+3,TargetID())				--��K�ּg�i�t���i�h
		BeginPlot( BODO, "Lua_423365_11" , 0 )						--���t���i�h�j���ˬd--���a���b�N�R���t���i�h
		BeginPlot( BODO , "Lua_423365_LOOP" , 0 )
		return true
	end

	if 	CheckAcceptQuest( OwnerID() , 423365) == true	and	(CheckFlag( OwnerID(), 544280)==true)	and
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then	
		local NPC = SearchRangeNPC ( OwnerID() , 50 )
		for i=0,table.getn(NPC)-1 do

		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115916	then		--��
			if	CountBodyItem( OwnerID(), 207723 )<1	then	
--				CastSpell( OwnerID() ,OwnerID()  , 495976)
				AddBuff( OwnerID(), 507280, 1 , 7 )
				GiveBodyItem( OwnerID(), 207723 , 1 )	
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115917	then		--��
			if	CountBodyItem( OwnerID(), 207724 )<1	then	
				AddBuff( OwnerID(), 505067, 1 , 7 )
				GiveBodyItem( OwnerID(), 207724 , 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115918	 then		--��
			if	CountBodyItem( OwnerID(), 207725 )<1	then	
				CastSpell( OwnerID(), OwnerID()  , 495978)		
				GiveBodyItem( OwnerID(), 207725 , 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115919	 then		--��
			if	CountBodyItem( OwnerID(), 207726 )<1	then		
				CastSpell( OwnerID(), OwnerID()  , 493919)	
				GiveBodyItem( OwnerID(), 207726 , 1 )
				return true
			end
		end
	end
	ScriptMessage( OwnerID()   ,  OwnerID()   , 2 , "[SC_423365_7]" , 0 ) 		--�A�w�g�֦�
	ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423365_7]" , 0 )
	return	false
	end
end

function Lua_423365_LOOP()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local tree  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		

	local TREEKING = Lua_DW_CreateObj("flag" ,115914,780693,6,1)				--115914�t��(���㹳�A�u�K�W)�B�X�l�s�� 780693 �B6
	SetModeEX( TREEKING , EM_SetModeType_Mark , false )
	DisableQuest( TREEKING , true )							--�}��NPC�Y�W�����ȴ��ܥH�ι�ܼ@��(true����)
	MoveToFlagEnabled(TREEKING , false )
	WriteRoleValue( TREEKING,EM_RoleValue_Register+3,OwnerID())				--��t���i�h�g�i�t���t��
	BeginPlot( TREEKING, "LuaS_423365_22" , 0 )						--���t��j���ˬd--�t���i�h���b�N�R���t��

	Tell(player ,TREEKING,"[SC_423365_0]")						--�t�𮨮��ܡG�е��ڨ�U�����|�A����...�O�ڳy���o�ӧ����C
	sleep(30)
	Yell( OwnerID(), "[SC_423365_1]" , 3 )							--�i�h�G�n�å�]��ť���ܡH
	sleep(30)
	Yell( OwnerID(),  "[SC_423365_2]" , 3 )						--�i�h�G�n��b��ڭ̻��ܡ�
	sleep(30)
	Tell(player ,TREEKING,"[SC_423365_3]" )						--�����ܡG��Q�����b���F�������U�U���A�`�����D�O�q�A�]�����ڦ^���Ӫ����d��...
	sleep(20)
	AddBuff( player  , 507279, 1 , 7 )		
	Yell( OwnerID(),  "[SC_423365_4]" , 3 )						--�i�h�G�G����몺�K�֦��@�ѤO�q�B�X�ӤF��
	sleep(30)
	if	CountBodyItem( player , 207722)<1	then			
		GiveBodyItem( player , 207722, 1 )			
	end
	Tell(player ,TREEKING,"[SC_423365_5]")						--�����ܡG�ڷ|�N�K�֩�b�˪L���۵M���O���רK���B�C
	sleep(30)
	Yell( OwnerID(),  "[SC_423365_6]" , 3 )						--�i�h�G�n�å�A�n�����ڭ̩�n�F�A�ڭ̻��֥h���Ť�O�q�C
	SetFlag(player , 544280, 1)								--���������X�СA�i�ݨ���L���K��
	DelObj(OwnerID())
	CancelBuff(player  , 507164)								
	WriteRoleValue( tree  , EM_RoleValue_Register+1 , 0 )
end

function Lua_423365_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	local tree	 =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	for i = 1, 60 , 1 do								--��ưt�X�@���վ�
		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or	CheckAcceptQuest(player ,423365)==false	then
			CancelBuff(player , 507164)
			SetFlag(player , 544280, 0)	
			DelObj(OwnerID())
			WriteRoleValue(tree, EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423365_22()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--�t���i�h
	for i = 0 , 60 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end


--423366(�ϥΪ��~�B���X)207722�B207723�B207724�B207725�B207726�B207727�B207728
--�������Ȱ���P�_
function LuaS_423366_Afterquest()
	local k=CountBodyItem(TargetID(),207725) 
	DelBodyItem( TargetID(), 207725, k )

	local g=CountBodyItem(TargetID(),207726) 
	DelBodyItem( TargetID(), 207726, g )
end


function LuaS_423366_acc() 
	if	CountBodyItem(TargetID(),207722) < 1		then
		GiveBodyItem(TargetID(),207722,1) 
	end
	if	CountBodyItem(TargetID(),207723) < 1		then
		GiveBodyItem(TargetID(),207723,1) 
	end
	if	CountBodyItem(TargetID(),207724) < 1		then
		GiveBodyItem(TargetID(),207724,1) 
	end
	if	CountBodyItem(TargetID(),207725) < 1		then
		GiveBodyItem(TargetID(),207725,1) 
	end
	if	CountBodyItem(TargetID(),207726) < 1		then
		GiveBodyItem(TargetID(),207726,1) 
	end
end


function LuaS_423366_1()-- ��b207722
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207723) > 0	and	CountBodyItem(OwnerID(),207724) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207723,1) --del
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --�X��
			UseItemDestroy() -- �R���ϥΤ���
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--�Ť�O�q������
		return false
		end
	else	
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--�����֦�207727
	return false
	end
end

function LuaS_423366_2() --��b207723
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207724) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --�X��
			UseItemDestroy() -- �R���ϥΤ���
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--�Ť�O�q������
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--�����֦�207727
	return false
	end
end

function LuaS_423366_3() --��b207724
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --�X��
			UseItemDestroy() -- �R���ϥΤ���
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--�Ť�O�q������
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--�����֦�207727
	return false	
	end
end

function LuaS_423366_4() --��b207725
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207724) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --�X��
			UseItemDestroy() -- �R���ϥΤ���
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--�Ť�O�q������
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--�����֦�207727
	return false	
	end
end

function LuaS_423366_5() --��b207726
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207724) > 0	and	CountBodyItem(OwnerID(),207725) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --�X��
			UseItemDestroy() -- �R���ϥΤ���
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--�Ť�O�q������
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--�����֦�207727
	return false
	end
end