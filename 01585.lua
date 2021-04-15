------���۪��·G
function LuaS_422826()
	SetSpeakDetail(OwnerID(),"[SC_422826_29]")	--����ơH�O������t�M�h���C�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_30]","LuaS_422826_0",0)		-- �·G�A�ڡK�K
end

function LuaS_422826_0()
	CloseSpeak(OwnerID())
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(TargetID() ,true )
		BeginPlot( TargetID() , "LuaS_422826_1" , 0 )
	end
end

function LuaS_422826_1()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	Hide(OwnerID())
	local man = LuaFunc_CreateObjByOBj( 113661, OwnerID() )
	WriteRoleValue( man , EM_RoleValue_PID , TargetID() )
	BeginPlot( man , "LuaS_422826_2" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(man) == false or ReadRoleValue( man , EM_RoleValue_OrgID ) ~= 113661 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422826_2()
	local PP = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local NPC1 = CreateObjByFlag( 113810 , 780467 , 1 , 0 )  --�{�ȮR
	AddToPartition( NPC1 , 0 )
	MoveToFlagEnabled( NPC1 , false )
	LuaFunc_MoveToFlag(NPC1 , 780467 , 2 ,  0 )

	SetDefIdleMotion( NPC1, ruFUSION_MIME_EMOTE_SPEAK)
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_SPEAK)
	Say(NPC1 , "[SC_422826_0]")	--�Ʃx�·G�H
	sleep(30)
	Say(OwnerID() , "[SC_422826_1]")	--�p�K�K�O�֡H�ڦ��G�b�����g�ݹL�p�H
	sleep(30)
	Say(NPC1 , "[SC_422826_2]")	--�A���O�o�F�ڡH�d�~�e�A�A�����󪺬ݵۧڡA�N���b[113686]�����ǡC
	sleep(30)
	Say(OwnerID() , "[SC_422826_3]")	--�O�p�H���W��D�Hè�ߦk�Q���]�ڡH
	sleep(30)
	Say(NPC1 , "[SC_422826_4]")	--��I�x�T���U���X�����`�O�o�򤣤�ť�A���W�]�ڬO�ڡA���A���D�H���ӴN�ݩ��
	sleep(30)
	Say(OwnerID() , "[SC_422826_5]")	--��f�A����p���G�D�H�C
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_NONE)
	SetDefIdleMotion( NPC1, ruFUSION_MIME_NONE)
	sleep(30)
	Say(NPC1 , "[SC_422826_6]")	--���G�H�A���F�A[113686]�L���@�ݦb�ڨ���C	

	PlayMotion(  NPC1 ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say(NPC1 , "[SC_422826_7]")	--[113686]�A�ӧa�I�Ө����A�d�~�e�����U�C

	local NPC2 = CreateObjByFlag( 113629 , 780467 , 3 , 0 )  --�w�w�Ĵ�
	AddToPartition( NPC2 , 0 )
	MoveToFlagEnabled( NPC2 , false )
	LuaFunc_MoveToFlag(NPC2 , 780467 , 4 ,  0 )
	sleep(10)
	Say(OwnerID() , "[SC_422826_8]")	--�t�M�h���C�K�K�D�H�H
	sleep(30)
	Say(NPC1 , "[SC_422826_9]")	--�A�ٰO�o�L�ܡH����A���۪����U�H
	sleep(30)
	Say(OwnerID() , "[SC_422826_10]")	--�D�H�A�o�O�ڶܡH�ڲש󵥨�o�@��F�I......
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)

	sleep(30)
	Say(NPC2 , "[SC_422826_11]")	--[113691]�H�A���o�N�O�ڪ����U�H
	sleep(30)
	Say(NPC1 , "[SC_422826_12]")	--�d�~�e�A���۪����U�A��A�����A�大����A���F���o�A�X���C�A�ٴ��g�Ө�o�̨��C�A�A�ѤF�H
	sleep(30)
	Say(NPC1 , "[SC_422826_13]")	--�G�M�ٻݭn��h���^�иH���A�����U�A�~��C
	sleep(20)
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_14]", 0 )	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_14]", 0 )	--[113628]�����vŸ�ݤF�_�ӡA�o�X�Y�F���s�n
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_ANGRY)

	sleep(20)
	Say(OwnerID() , "[SC_422826_15]")	--���i��K�K���i��K�K�D�H�L���i��O�A�大���C
	sleep(30)
	Say(NPC2 , "[SC_422826_16]")	--�ڤ��O�o�F�A���L�ڧ󤣰O�o�����i�L�o�򤣭��Ϊ��o���C......
	sleep(20)
	PlayMotion(NPC2 , ruFUSION_ACTORSTATE_EMOTE_POINT)
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_17]", 0 )	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_17]", 0 )	-- [113628]�����vŸ�X�B�@�P���n�̵ۨó��ۻy�ۡC
	PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL)
	sleep(20)
	Say(OwnerID() , "[SC_422826_18]")	--�Q�����������A�ڪ��T���h�ùL���ڪ����H�A�P�D�H���ϥΪ��M�C����k�A�ӹ��K�K�ӹ��C
	sleep(30)
	Say(OwnerID() , "[SC_422826_19]")	--���ڱq�ӴN�S���۫H�L�ڤߩ���������áC�A���O�ڪ��D�H�A���藍��O�ڪ��D�H�C
	sleep(30)
	Say(NPC2 , "[SC_422826_20]")	--�Y�ϨS���O�СA�����@�I���٪��D�A���Ӧs�b���̦n�٬O���n�s�b�o�@�ɤW�C
	sleep(30)
	Say(NPC2 , "[SC_422826_21]")	--�ڷ|���A��o�Ѳ�C
	sleep(10)
	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_ATTACK_1H)
--	sleep(10)
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)


	local Player = SearchRangePlayer(OwnerID() , 350)
	For i=0,table.getn(Player)-1 do
		If	CheckAcceptQuest( Player[i], 422826 )	or
			CheckAcceptQuest( Player[i], 422827 )	then
			SetFlag(Player[i] , 543438 , 1)
		end
	end

	sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422826_0_3]", 0 )	
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422826_0_3]", 0 )	--[113691]�Q�Ϊk�N���o[113628]���O�иH���I
	CastSpell( NPC1 , OwnerID() , 494410 )	--
	sleep(20)
	Hide(OwnerID())
	AddBuff( NPC1 ,  502383 , 0 , 1 )
	sleep(10)
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422826_0_1]", 0 )	
	ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422826_0_1]", 0 )	--�{�ȮR��o�·G���O�иH���I
	sleep(20)
	Say(NPC1 , "[SC_422826_22]")	--���A���F�o�ӰO�иH���A�A�|�^�а_��h�����ơA�ڪ��w�w�Ĵ��C
	sleep(30)
	Say(NPC2 , "[SC_422826_23]")	--�^�жܡH����
	sleep(10)
	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_CROUCH_BEGIN)	--(�w�w�Ĵ��}�l�Y��)���a
--	PlayMotion(NPC2  , ruFUSION_ACTORSTATE_CROUCH_END)	--(�w�w�Ĵ��}�l�Y��)���a
	ScriptMessage( OwnerID(), PP, 0, "[SC_422826_0_2]", 0 )	--�w�w�Ĵ��]���ժܪ��u�@���ۦӶ}�l�Y���I	
	ScriptMessage( OwnerID(), PP, 1, "[SC_422826_0_2]", 0 )
	sleep(30)
	Say(NPC1 , "[SC_422826_24]")	--[113686]�H
	Delobj( NPC2 )
	sleep(30)
	Say(NPC1 , "[SC_422826_25]")	--�Ӧ��A�S�O[113633]�a��......
	sleep(30)
	for i =5, 16, 1 do
		local j = CreateObjByFlag( 102794 , 780467 , i , 0 )  
		CallPlot( j , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( j , 0 )
		if CheckID( PP ) == true and ReadRoleValue( PP , EM_RoleValue_IsDead) == 0 then
			SetAttack( j , PP )
		end
	end
	sleep(30)
	Say(NPC1 , "[SC_422826_27]")	--�^�h�i�D[113633]�A�d�~�Ӫ�����]�ӲM��M��F�I.....
	sleep(30)
	Delobj( NPC1 )

	sleep(20)
	Delobj( OwnerID() )
end

--------�A�大���w�w�Ĵ�

function LuaS_422828_0()
	SetSpeakDetail(OwnerID(),"[SC_422828_1]")	--�U���ۦ������@�M�W�ߡB��V�A�ӧڥ��}�F�o�ӳW��...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422828_2]","LuaS_422828_1",0)		--�大§�g �H
end

function LuaS_422828_1()
	SetSpeakDetail(OwnerID(),"[SC_422828_3]")	--�S���A�]���T�ҲŤ媺�v�T�A���o��C���F���@�˪��ܤ�...
	SetFlag(OwnerID() , 543448 , 1)
end

-----���o�u�ꤧ��
function LuaM_422829_Check()
	if CheckAcceptQuest( OwnerID() , 422829 ) == false or CountBodyItem(OwnerID() , 206171) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102771 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 ) --�ؼп��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829]" , 0 ) --[102771]�w�g���F�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID()  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829_1]" , 0 ) --�A��������[102771]�`�N��A�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) >  ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/2  then
		SetAttack( TargetID() , OwnerID() )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422829_2]" , 0 ) --[102771]�x�j��ܡI
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422829_2]" , 0 ) 
		return false
	end
	return true
end

function LuaM_422829_Effect()
	BeginPlot( TargetID() , "LuaM_422829_Reset" , 0 )

	local Party = LuaFunc_PartyData(OwnerID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 422829 ) == true and
 			CountBodyItem( Party[i], 206171 )<1	and
			GetDistance(Party[i] , OwnerID() ) < 200 and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0 then
				GiveBodyItem( Party[i] , 206171 , 1 )
		end
	end
end

function LuaM_422829_Reset()
	LuaFunc_ResetObj( OwnerID() ) 
end

------�b�Ƥ���

function LuaS_422830()
	SetSpeakDetail(OwnerID(),"[SC_ 422830_1]")	--[206172]�H�A���D�o�O�Ӥ���˪��F��ܡH......
	GiveBodyItem( OwnerID() , 206172 , 1 )
end

-----���]����

function LuaS_113769()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 422833 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422833) == false and CheckFlag( OwnerID() , 543457) == false then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422833_0]","LuaS_422833_0",0)	--�ڷǳƦn�F�I���ڭ̤@�_����[113672]�a�I
	end
end

function LuaS_422833_0()
	CloseSpeak( OwnerID() )
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(TargetID() ,true )
		BeginPlot( TargetID() , "LuaS_422833_1" , 0 )
	end
end

function LuaS_422833_1()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	Say(OwnerID() , "[SC_422833_01]")	--�X�ӧa�I[113672]......�ӬO�ѨM���誺�ɨ�F�I
	sleep(20)
	local AA = CreateObjByFlag( 113810 , 780482 , 1 , 0 )  --�{�ȮR
	AddToPartition( AA , 0 )
	MoveToFlagEnabled( AA , false )
	LuaFunc_MoveToFlag(AA , 780482 , 2 ,  0 )
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_LAUGH )
	Say(AA , "[SC_422833_02]")		--[113678]�O�H�������㨺���x�p���K�w�S���_�ӤF�a�H
	sleep(30)
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say(AA , "[SC_422833_03]")		--�L�ҿסA�N���ڪ�[102775]�_���ӳ��A�̪����a�I
	AdjustFaceDir( AA,OwnerID(), 0 ) 
	sleep(30)

	local BB = CreateObjByFlag( 102836 , 780482 , 3 , 0 )  --���w�w�w�Ĵ�
	SetFightMode( BB, 0 , 1 , 0 , 0 )
	AddToPartition( BB , 0 )
	WriteRoleValue( AA , EM_RoleValue_PID , BB )
	WriteRoleValue( BB , EM_RoleValue_PID , AA )

	BeginPlot( AA , "LuaS_422833_AA_CHECK" , 0 )		--�b�{�ȮR���W�ˬd�w�w�Ĵ��b���b
	CallPlot( BB , "LuaFunc_Obj_Suicide" , 300 )		--���}�԰��A�w�w�Ĵ��N����
	SetPlot(BB,"dead","LuaS_422833_BB_dead",0 )		--�w�w�Ĵ��۵M����A���ܽ{�ȮR��PID

	sleep(20)
	Yell(AA , "[SC_422833_04]" , 3)		--���L�̪��D�A���F�`�A[102775]��
	PlayMotion( AA ,  ruFUSION_ACTORSTATE_EMOTE_THREATEN )
	sleep(30)
	FaceObj( BB ,OwnerID() )
	PlayMotion( BB , ruFUSION_ACTORSTATE_ATTACK_2H_SP )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
	sleep(10)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	SetFightMode(BB, 1 , 1 , 1 , 1 )
	sleep(10)
	Hide( OwnerID() )
	SetAttack(BB,TargetID())
	Yell(AA , "[SC_422833_05]" , 3)		--�|�B���q���A��A�u�O�Ӭ��R�F�I

	for i = 0 , 100 , 1 do		--�P�_�{�ȮR���b���W�A���絵�_��ܥX��
		if CheckID(AA)    == false  then
			break
		end
		sleep( 30 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end

function LuaS_422833_AA_CHECK()
	local MonBB = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonBB) == false  then
			break
		else
			AdjustFaceDir( OwnerID() , MonBB , 0 )
			if i > 5 then
				if DW_Rand(2) > 1 then
					PlayMotion( OwnerID()  ,  ruFUSION_ACTORSTATE_EMOTE_ANGRY )
				end
			end
		end
		sleep( 30 )
	end
	sleep(20)	
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
		BeginPlot( OwnerID() , "LuaS_422833_2" , 0 )
	else
		Delobj( OwnerID() )
	end
end

function LuaS_422833_BB_dead()
	local MonAA = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	WriteRoleValue( MonAA , EM_RoleValue_Register , 1 )
	Delobj( OwnerID() )
	return false
end

function LuaS_422833_2()
	MoveToFlagEnabled( OwnerID() , false )
	PlayMotion( OwnerID()  ,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(10)
	Say(OwnerID() , "[SC_422833_06]")		--�@�A�̰����n�ơI�A�̧�ڪ�[102775]���F�H
	sleep(20)
	Say(OwnerID() , "[SC_422833_07]")		--�گu���ͮ�F�I�ڭn�˦۹�I�A�̡I
	CastSpell(OwnerID(),OwnerID(),491276)
	sleep(20)
	Hide(OwnerID())
	local C1 = LuaFunc_CreateObjByOBj( 102837, OwnerID() )		--�u��
	AddBuff( C1 ,504992 ,100 ,-1 )
	local C2 = LuaFunc_CreateObjByOBj( 102838, OwnerID() )		--����
	AddBuff( C2 ,504992 ,100 ,-1 )
	local C3 = LuaFunc_CreateObjByOBj( 102838, OwnerID() )		--����
	AddBuff( C3 ,504992 ,100 ,-1 )
	WriteRoleValue( C2 , EM_RoleValue_PID , C1 )
	WriteRoleValue( C3 , EM_RoleValue_PID , C1 )
	SetPlot(C1,"dead","LuaS_422833_C1_dead",0 )		
	SetPlot(C2,"dead","LuaS_422833_C2_dead",0 )		
	SetPlot(C3,"dead","LuaS_422833_C2_dead",0 )		
	BeginPlot( C2 , "LuaS_422833_C2_CHECK" , 0 )
	BeginPlot( C3 , "LuaS_422833_C2_CHECK" , 0 )
	SetAttack(C1,TargetID())
	SetAttack(C2,TargetID())
	SetAttack(C3,TargetID())
	CallPlot( C1 , "LuaFunc_Obj_Suicide" , 300 )	
	CallPlot( C2 , "LuaFunc_Obj_Suicide" , 300 )	
	CallPlot( C3 , "LuaFunc_Obj_Suicide" , 300 )	

	for i = 0 , 100 , 1 do
		if CheckID(C1) == false  then
			break
		end
		sleep( 60 )
	end

--�԰����}�l�t��
	Show( OwnerID() , 0 )
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_SIT_BEGIN , ruFUSION_ACTORSTATE_SIT_LOOP)
	local DD = CreateObjByFlag( 113683 , 780482 , 4 , 0 )  --�ժ�
	AddToPartition( DD , 0 )
	MoveToFlagEnabled( DD , false )
	LuaFunc_MoveToFlag(DD , 780482 , 5 ,  0 )
	AdjustFaceDir( DD, OwnerID(), 0 ) 
	sleep(5) 
	SetDefIdleMotion( DD, ruFUSION_MIME_EMOTE_SPEAK)
	Say(DD , "[SC_422833]")		--[102804]�A���a......�d�~�ӡA�A�w�g�y�U�Ӧh���o�c......
	sleep(30)
	Say(OwnerID() , "[SC_422833_1]")		--�A�o�O�H�@�����k�H�A�p�ڥ����F�ѧڪ��߹ҡC
	sleep(30)
	Say(DD , "[SC_422833_2]")		--�ЧA�۫H�ک��էA���h�B�A[102775]�w���h�d�~�F�A�A�M�ڤ@�˴d��......		
	sleep(30)
	Say(OwnerID() , "[SC_422833_3]")		--�p���򳣤����A����]�S���N��m���ڪ��Ҧ��I
	sleep(20)
	Say(OwnerID() , "[SC_422833_4]")		--�ڴN�O�n�p�h�W�A�D�n�p�h�W�~�������ڤߤ�����N�C	
	sleep(30)
	Say(DD , "[SC_422833_5]")		--���O�o�˪��A[102804]�A�R�U�ߨӡA�p���h�W�Ӧ۩�p��L�����ۡA������X���F�p���ߴ��C
	SetDefIdleMotion( DD, ruFUSION_MIME_NONE)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SIT_END )
	sleep(30)
	Say(OwnerID() , "[SC_422833_6]")	--é���H����......�Qé�����O�@�ɤW���Ҧ��H�I�L�̤����۫H�p���f�����������A�٩^�p�����C
	AdjustFaceDir( OwnerID(), DD , 0 ) 
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	sleep(30)
	Say(OwnerID() , "[SC_422833_7]")	--�i�����O�A�L�̤f�������A���O�����z���áA��ۤv��b�t��a�쪺�x�p���A�ӳo�˪��H���q�ڤ⤤�m��[102775]�I
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(30)
	Say(OwnerID() , "[SC_422833_8]")	--�o�@�ɤW�A�u���p�̨S��满�ڡI
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	SetDefIdleMotion( DD, ruFUSION_MIME_EMOTE_SPEAK)
	Say(DD , "[SC_422833_9]")		--��......�ä��t��A�]�����{���ۤv�O���t......��ť�p���ߧa�I[102804]�A�����b���_......
	sleep(30)
	Say(DD , "[SC_422833_10]")	--�M�ӧگ������U�p�H
	sleep(30)
	Say(DD , "[SC_422833_11]")	--�p�G�L�h���^�СA���p�P��h�W�A�]�\��ѥ��̯����p��o�Ѳ�......
	sleep(30)
	Say(OwnerID() , "[SC_422833_12]")	--�p�Q��ڰ�����H
	sleep(30)
	Say(DD , "[SC_422833_13]")	--���n�`�ȡA�ѫo�F[102775]�A�p�N��o���͡C
	SetDefIdleMotion( DD, ruFUSION_MIME_NONE)
	sleep(30)
	Say(OwnerID() , "[SC_422833_14]")	--�p�̤���ۧ@�D�i�M�w�H�֦��L���^�����ڼ���{�b�A�p�m���L�A�Ӳ{�b�n��ڪ��O�ФU��H
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(30)
	Say(OwnerID() , "[SC_422833_15]")	--�u�}�I�M�U�p���ۥH���O����ū�I�p�ڥ��Ϥ��F����H�A�S��[102775]���ͬ��ڤ��ݭn�C
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	Say(OwnerID() , "[SC_422833_16]")	--���I���A�ڤ��n�ۤv�@�ӤH����......�P��Q�p�ܥh�O�СA�ڹ��@���了�`�I
	PlayMotion(  OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_CRY)
	sleep(30)
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
--	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DEATH_LOOP)
	sleep(40)
	PlayMotionEX(DD , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(DD , "[SC_422833_17]")	--[102804]......
	sleep(30)
	Delobj( DD )
	Delobj( OwnerID() )
end

function LuaS_422833_C1_dead()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422833 )	then
			SetFlag( Player   , 543457, 1 )
		end	
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422833_C2_dead()
	Say(OwnerID() , "[SC_422833_08]")	--�������I�o���L�O�ڪ��@�Ӥ����}�F�I
	local FF = ReadRoleValue ( OwnerID(), EM_RoleValue_MaxHP )
	WriteRoleValue ( OwnerID() , EM_RoleValue_HP, FF )
	return false
end

function LuaS_422833_C2_CHECK()
	local MonCC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonCC) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end




---�u�ꤧ�ۨϥ��ˬd
function LuaM_206173_Check()
	if CheckAcceptQuest( OwnerID() , 422833 ) == false or CheckFlag(OwnerID() , 543457) ==true or CheckCompleteQuest( OwnerID() , 422833 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102837	and
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102838 	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 ) --�ؼп��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) 
		return false
	end
	return true
end

function LuaM_206173_Effect()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102837	then
		if  CheckBuff( TargetID() , 504992) == true	then	
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173]" , 0 ) --[206173]�}�l�@�ΡI
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173]" , 0 ) 
			CancelBuff( TargetID() , 504992 )
			Say(TargetID() , "[SC_206173_1]")	--�o���i��H�A���M��}���ڪ��y�b......
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173_2]" , 0 ) --�A�w�g�ѯ}[113672]�����ˡI
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173_2]" , 0 ) 
		end
	end

	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102838	then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206173_3]" , 0 ) --�o���O[113672]������I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206173_3]" , 0 ) 
	end
end









