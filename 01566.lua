---�ܴ�������ܼ@��
function LuaS_113625()

	if	CheckBuff( OwnerID() , 502462)== true	then
		if	(CountBodyItem( OwnerID(), 206150 )>0 )	then
				SetSpeakDetail(OwnerID(),"[SC_422789_9]")	--�ڡI�o�O�ڵ᪺����y......
				DelBodyItem(OwnerID() , 206150 , 1)
				CancelBuff(OwnerID(), 502462)
		else
			SetSpeakDetail(OwnerID(),"[SC_422789_8]")	--�ܴ����ͮ𤤡A��L�Y�h���Q�P�A���......
		end
	else
		LoadQuestOption( OwnerID() )
		if	CheckAcceptQuest( OwnerID() ,422789 ) == true	and 
			CheckFlag( OwnerID() , 543384) == false	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422789]","LuaS_422789_0",0)	--�i�H��ڻ����A�b�˪L�̵o�ͪ��ƶܡH
		end
		if	CheckAcceptQuest( OwnerID() , 422789 ) == true	and 
			(CountBodyItem( OwnerID(), 206139 )>0 )	and 
			CheckFlag( OwnerID() , 543383) == false	then	--�R������������
				SetFlag(OwnerID() , 543383 , 1 )
				DelBodyItem(OwnerID() , 206139 , 1)
		end
		if	CheckAcceptQuest( OwnerID() ,422790 ) == true	and 
			CheckFlag(OwnerID(),543385) == false		then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422790]","LuaS_422790",0)	--�ڷǳƦn�n�������ǡu���t���ȡv�F�I
		end
	end
end

---�����ܴ���
function LuaS_422789_0()
	SetSpeakDetail(OwnerID(),"[SC_422789_1]")	--�ڤw�g���L�ܦh���A�ڬO�]���ݨ��ڵ᩹�˪L�̶]......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_2]","LuaS_422789_1",0)		--�i�O�ڵᤣ�O�����ܦh�~�F�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_4]","LuaS_422789_2",0)		--��Ӧp���A�ڵᨺ��i�R�A�����F�A�@�w�|�ܤ߯k�a�H
end

function LuaS_422789_1()
	SetSpeakDetail(OwnerID(),"[SC_422789_3]")	--�A�򥬧Q���O�P�@�٪��a�I����l�̪��H�@��......
	AddBuff( OwnerID() , 502462 , 1 , 180 ) --�ܴ����ͮ�BUFF
end

function LuaS_422789_2()
	SetSpeakDetail(OwnerID(),"[SC_422789_5]")	--�O�ڡI�۱q�ڵᨫ����A�o�X�~�ӧڳ�ı�o�ۤv���ͬ�......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422789_6]","LuaS_422789_3",0)		--�A���l��ڵ�ܡH
end

function LuaS_422789_3()
	SetSpeakDetail(OwnerID(),"[SC_422789_7]")	--�]�ܴ����n�n�Y�C�^���ӧڤw�g�l��ڵ�F�I�e�N�b�C�y�˪L��......
	SetFlag(OwnerID() , 543384 , 1 )
end


------�ڵ᪺����y
function LuaS_113623()
	LoadQuestOption( OwnerID() )
	if	CheckBuff( OwnerID() , 502462)== true	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_113623]","LuaS_113623_1",0)		--�ߨ��ڵ᪺����y�C
	end
end

function LuaS_113623_1()
	if	(CountBodyItem( OwnerID(), 206150 )<1 )	then
			GiveBodyItem( OwnerID() , 206150 , 1 )
			CloseSpeak( OwnerID() )
	else
		CloseSpeak( OwnerID() )
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_113623_1]", 0 )	--�A�w�g�֦��@��[206150]�I
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_113623_1]", 0 )
	end

end

------�������C
function LuaS_422790()
	CloseSpeak(OwnerID())
	DisableQuest(TargetID() ,true )
	BeginPlot( TargetID() , "LuaS_422790_1" , 0 )
end

function LuaS_422790_1()
	local NPC = LuaFunc_CreateObjByOBj( 102746, OwnerID() )
	Hide(OwnerID())
	WriteRoleValue( NPC , EM_RoleValue_PID , TargetID() )
	BeginPlot( NPC , "LuaS_422790_CHECK" , 0 )
	BeginPlot( NPC , "LuaS_422790_2" , 0 )
	for i = 0 , 100 , 1 do
		if CheckID(NPC) == false or ReadRoleValue( NPC , EM_RoleValue_OrgID ) ~= 102746 then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() , 0 )
	DisableQuest(OwnerID() ,false )
end

function LuaS_422790_CHECK()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Local NPC = OwnerID() 
	local Result = "Success"	
	SetPlot( OwnerID() , "Dead" , "LuaS_422790_Dead" , 0 )

	while true do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_Register) > 0	then
			Result = "Fail"
			break
		end
	end
	
	if Result == "Fail" then
		SetStopAttack( OwnerID() ) --�������
		Lua_CancelAllBuff( OwnerID())  --�M�����W��BUFF
		SetRoleCamp( OwnerID() , "Visitor" ) --���ܰ}��
		
		Tell(Player,OwnerID(),"[SC_422790_1]") --�ӦM�I�F�I���٬O�����_�Ӧn�F......
	end
	Move( OwnerID() , -12973 , 942 , 31919 )
	sleep( 5 )
	Delobj( OwnerID() )
end

function LuaS_422790_Dead()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	return false
end

function LuaS_422790_2()
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )

	local Monster = {}
	local amount = 3
	local Group = {}

--	ScriptMessage(Player, 0, 1, "[SC_422790_2]", 0 )	--�X�ӧa�I�o���ڦ�����A�i���ȧA�̡I
	Yell( OwnerID() , "[SC_422790_2]" , 2 )
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(10)
	For i=1, amount  do
		Monster[i] = CreateObjByFlag( 102747 , 780450 , i , 0 )  
		CallPlot( Monster[i] , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( Monster[i] , 0 )
		SetPlot(Monster[i],"dead","LuaS_422790_3",0 )	--�Ǧ�����Ĳ�o���`�@��
		SetAttack(OwnerID(),Monster[i])
		SetAttack(Monster[i],OwnerID())
		BeginPlot(Monster[i], "LuaS_422790_4" , 0 )
	End

	Say(Monster[1] , "[SC_422790_4]")	--��C�ٵ��ڭ�......
	while ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1 do
		sleep(10)
	end
	sleep(10)
	Group = SearchRangePlayer(OwnerID() , 350)	--�j�M���񪱮a
	For i=0,table.getn(Group)-1 do
		If	CheckAcceptQuest( Group[i], 422790 )==true	and
			CheckFlag( Group[i] , 543386 )==true		then
			SetFlag(Group[i] , 543385 , 1)
		end
	end
	sleep(10)
	PlayMotion(OwnerID()  , ruFUSION_ACTORSTATE_ATTACK_1H)
	Say(OwnerID() , "[SC_422790_3]")	--�ȤF�a�I�H�᳣�O�A�ӤF�I
	Sleep(20)
	Delobj( OwnerID() )
end

function LuaS_422790_3()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422790 )	then
			SetFlag( Player   , 543386, 1 )
		end	
	end	
	return true
end

function LuaS_422790_4()
	for i = 0 , 100 , 1 do
		if CheckID(TargetID()) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

------�ڵ᪺�_��543387
function LuaS_422791_CHECK()
	if	CheckFlag( OwnerID() , 543387 )==true		then
			BeginPlot( TargetID() , "LuaS_422791_HIDE" , 0 )
			return false
	else
		return true
	end
end

function LuaS_422791_HIDE() 
	Hide( OwnerID() )
	local obj = LuaFunc_CreateObjByObj ( 113661 , OwnerID() )	--�·G
	FaceObj ( obj, TargetID() )
	SetFightMode ( obj,0, 0, 0,0 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Tell(TargetID() ,obj ,"[SC_422791]")		--�A�b�䤰��H
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Tell(TargetID() ,obj ,"[SC_422791_1]")		--���_���H......�����D�H���t�C�٤����ܡH
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Tell(TargetID() ,obj ,"[SC_422791_2]")		--���O�D�H�D�`���n���_�C�ڡI�ڭ̦b���a���D�H�u�@�_�C�A���ݥD�H�^��......
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_BEG)
	Tell(TargetID() ,obj ,"[SC_422791_3]")		--�p�G�A���D�t�C���h�B�A�ЧA�@�w�n��t�C���^���ٵ��ڭ�......
	SetFlag(TargetID() , 543391 , 1 )
	sleep(40)
	Delobj( obj )
	Show( OwnerID() , 0 )
end

function LuaS_422791()
	if	CheckFlag( OwnerID() , 543388 )==true		and
		CheckFlag( OwnerID() , 543389 )==true		and
		CheckFlag( OwnerID() , 543390 )==true		then
			SetFlag( OwnerID()   , 543387, 1 )
			GiveBodyItem( OwnerID(), 206153, 1 )		--���x�ưO����
	elseif	CheckFlag( OwnerID() , 543389 )==true		and
		CheckFlag( OwnerID() , 543390 )==true		then
			GiveBodyItem( OwnerID(), 206151, 1 )		--�����b
			SetFlag( OwnerID()   , 543388, 1 )
	elseif	CheckFlag( OwnerID() , 543390 )==true		then
			GiveBodyItem( OwnerID(), 206152, 1 )		--���x��
			SetFlag( OwnerID()   , 543389, 1 )
	else		
			GiveBodyItem( OwnerID(), 206154, 1 )		--�����l
			SetFlag( OwnerID()   , 543390, 1 )
	end
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422791_0]", 0 )	
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422791_0]", 0 )
	return true
end

------���̪i���Q
function LuaS_422794()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422794 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422794) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422794]","LuaS_422794_1",0)	--����Ʊ��Q�n�·бz�A�O����ܴ����P���Q����S�̡K�K
	end
	if	CheckAcceptQuest( OwnerID() ,422795 ) == true	and 
		CheckCompleteQuest( OwnerID() , 422795) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422795]","LuaS_422795",0)	--�o�ӧ��l�̴��g�o�ͤ���ơH
	end
	
	if CheckAcceptQuest( OwnerID() ,422819 ) == true and CheckFlag(OwnerID(),543413) == false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422819_0]","LuaS_422819_1",0) --�z��軡��ǰe�ۡH
	end
end

function LuaS_422794_1()
	SetSpeakDetail(OwnerID(),"[SC_422794_1]")	--����[113625]�P[113624]���靈§�����S�̰�......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422794_2]","LuaS_422794_2",0)		--�ܴ������A�L���̧̥��Q�������L�A�ٷm���L���C�I
end

function LuaS_422794_2()
	SetSpeakDetail(OwnerID(),"[SC_422794_3]")	--�oť�_�ӯu�O���i��ĳ�A�b�ڪ��O�и�......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422794_4]","LuaS_422794_3",0)		--�O�ڡI���Q���]���L�O�h��I�@�ӱj�s�A�ڥ��S���ݨ��ܴ����K�K
end

function LuaS_422794_3()
	SetSpeakDetail(OwnerID(),"[SC_422794_5]")	--�A��[113624]�O�ݨ��@�W�j�s�A�Ӥ��O����[113625]......
	SetFlag( OwnerID()   , 543403, 1 )
end

----------�o�ӧ��l�̪��Ǩ�
function LuaS_422795()
	SetSpeakDetail(OwnerID(),"[SC_422795_1]")	--�ڰO�o�b���٫ܤp���ɭԡA�]���g�����]�i�˪L�̪��A......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422795_2]","LuaS_422795_1",0)		--�]ť�_�ӻP[113625]�J�쪺���p���G�@��......�^
end

function LuaS_422795_1()
	SetSpeakDetail(OwnerID(),"[SC_422795_3]")	--�o�˪��Ʊ��n�����u�b�ڨ��W�o�͹L......
	SetFlag( OwnerID()   , 543404, 1 )
end

------�·G����ܼ@��
function LuaS_422798()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422798 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422798) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422798]","LuaS_422798_1",0)	--�·G�A�A���F�H
	end

	if	CheckAcceptQuest( OwnerID() ,422826 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422826) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_28]","LuaS_422826",0)	--�·G�A�ڦ��ƷQ�n��i�A�C
	end

	if	CheckAcceptQuest( OwnerID() ,422827 ) == true		and 
		CheckCompleteQuest( OwnerID() , 422827) == false 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422826_28]","LuaS_422826",0)	--�·G�A�ڦ��ƷQ�n��i�A�C
	end
end

function LuaS_422798_1()
	SetSpeakDetail(OwnerID(),"[SC_422798_1]")	--�ڥu�O�Q��ۤv�p���S�ΡA���T�d�q���ӡC......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422798_2]","LuaS_422798_2",0)		--������A���ۤv�d�t�F�D�H�������H
end

function LuaS_422798_2()
	SetSpeakDetail(OwnerID(),"[SC_422798_3]")	--�ڴ��g�o�}�n�@���l�ĩ��D�H[113629]......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422798_4]","LuaS_422798_3",0)		--�o���O�A�����A�·G�K�K
end

function LuaS_422798_3()
	SetSpeakDetail(OwnerID(),"[SC_422798_5]")	--�N�b�D�H�묹��A�ڨ��¯d�b�o��......
	SetFlag( OwnerID()   , 543405, 1 )
end

------�V���̭P�q(���զP���I�����~)

function LuaS_422799()
	if	ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 113703	then
			return true
	else
		if	CountBodyItem( OwnerID(), 206155 )<10  	then
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422799]", 0 )	--�ݭn10��[<S>206155]�I
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422799]", 0 )
				return false
		else
				if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
						BeginPlot( TargetID(), "LuaS_422799_1" , 0 )
						local FF =CountBodyItem( OwnerID(), 206155 )
						DelBodyItem ( OwnerID(),206155 , FF )
						return true
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--�ؼЦ��L��
					ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
					return false
				end
		end
	end
end

function LuaS_422799_1()	--�X�l780463
	writerolevalue( OwnerID(), EM_RoleValue_PID , 1 )
	local obj = CreateObjByFlag( 113683 , 780463 , 2 , 0 )  --�ժ�
	AddToPartition( obj , 0 )
	local flower = CreateObjByFlag( 113725 , 780463 , 1 , 0 )  --���
	AddToPartition( flower , 0 )
	AdjustFaceDir( obj , flower , 0 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(obj , "[SC_422799_1]")	--[206155]......�o�F��ڤ����͡A�O[113628]�ЧA�Ӫ��a�H
	sleep(40)
	PlayMotion(obj  , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Say(obj , "[SC_422799_2]")	--�g�L�o��[���ɶ��F......[113628]�٬O����u�b���̤������h......
	sleep(40)
	Say(obj , "[SC_422799_3]")	--......�����|���ܡA�n�n�U�U[113628]�a�I
	sleep( 40 )
	PlayMotion(obj  , ruFUSION_ACTORSTATE_CROUCH_END)
	Say(obj , "[SC_422799_4]")	--�L�ҵ��ݪ��H�A�w�g���ݭn�L�A�~�򵥫ݤU�h......
	sleep(40)
	AdjustFaceDir( obj , flower , 180 )
	sleep( 10 )
	Delobj( obj )
	Delobj( flower )
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

-----���Q������ܼ@��
function LuaS_113624()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422802 ) == true		and
		CheckCompleteQuest( OwnerID() , 422802) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422802]","LuaS_422802",0) --�бN[113709]�ɵ���......
	end
end

-----�ʪ��|���D

function LuaS_422802()	

	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_422802_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[SC_422802_1]")	--[113709]�]�X�h���A�F�A�еy���@�U�A�ݷ|�����ӴN�|�^�ӡC
	end

end

function LuaS_422802_1()	
	local dog = CreateObjByFlag( 113709 , 780464 , 1 , 0 )  --�ڵ�G�@
	WriteRoleValue(dog , EM_RoleValue_IsWalk , 1 )
	AddToPartition( dog , 0 )

	MoveToFlagEnabled( dog , false )
	LuaFunc_MoveToFlag(dog , 780464 , 2 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_2]" , C_SYSTEM )	--[113709]�b�a�W��F��......
	PlayMotion(dog , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(10)
	PlayMotion(dog , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	sleep(40)
	LuaFunc_MoveToFlag(dog , 780464 , 3 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_3]" , C_SYSTEM )	--[113709]���G�o�{�F����F��I
	WriteRoleValue(dog , EM_RoleValue_IsWalk, 0 )
--	Hide( dog )
--	Show( dog ,0)
	sleep(30)	
	LuaFunc_MoveToFlag(dog , 780464 , 4 ,  0 )
	ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_422802_4]" , C_SYSTEM )	--[113709]��۲��e���_�ǥ۪��j�n�p�s�I
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(50)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	Delobj( dog )
end

-----�ƴ�������ܼ@��
function LuaS_113630()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,422803 ) == true		and
		CheckCompleteQuest( OwnerID() , 422803) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422803]","LuaS_422803",0) --�ڬO���H[113624]�����Ө�o�̡A�ä����D�۪����S���B�C
	end
end

function LuaS_422803()
	SetSpeakDetail(OwnerID(),"[SC_422803_1]")	--����ӬO[113624]�����i�R��[113709]�a�A�Ӫ��r�I......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422803_2]","LuaS_422803_1",0)	--�A���D���Ӥk�l�h���̤F�ܡH
end

function LuaS_422803_1()
	SetSpeakDetail(OwnerID(),"[SC_422803_3]")	--�ڤ��M�����Ӥk�l�h���̤F�A�ƹ�W�ڤ]���Q��o���I�Ʊ�......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422803_4]","LuaS_422803_2",0)	--�ݨӧڭ̳��b��M���W�k�l���ܸ�......
end

function LuaS_422803_2()	
	SetSpeakDetail(OwnerID(),"[SC_422803_5]")--�A�]�b�䨺�W�k�l�r�I......
	SetFlag( OwnerID()   , 543431, 1 )
end

-----�̫�@������
function LuaS_422804()

	if ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0 then
		if CheckFlag( OwnerID() , 543432) == false then
			return true
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804_14]", 0 )	--�ؼЦ��L��
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804_14]", 0 )
			return false
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422804]", 0 )	--�ؼЦ��L��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422804]", 0 )
		return false
	end
end

function LuaS_422804_1()
	writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
	if CountBodyItem( OwnerID() , 206158 ) > 0 then
		DelBodyItem( OwnerID() , 206158 , 1 )
	end
	BeginPlot( TargetID() , "LuaS_422804_2" , 0 )
	return true
end

function LuaS_422804_2()	--503977�ĨĬ���
	if CheckID( TargetID() ) == true then
		local PPL = Role:new(TargetID() )
		local Ball = createObj( 112399 , PPL:X() , PPL:Y() ,PPL:Z() , PPL:Dir() , 1 )
		Lua_ObjDontTouch( Ball ) 
		AddToPartition( Ball , 0 )
		AddBuff( Ball , 503604 , 0 , 30 )
		AddBuff( TargetID() ,505110,100 , 30 )
		ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422804_0]", 0 )	--�A�ܤU�@�f[206158]�A��M�����ʼu���o�I
		ScriptMessage( OwnerID(), TargetID(), 1, "[SC_422804_0]", 0 )
	end
	sleep(20)
	local NPC = CreateObjByFlag( 113712 , 780465 , 1 , 0 )  --�ƴ������
	AddToPartition( NPC , 0 )
	
	MoveToFlagEnabled( NPC , false )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(NPC , "[SC_422804_1]")		--��������u�O�O�H���R���å�I
	sleep(30)
	Say(NPC , "[SC_422804_2]")		--�{�b�O���O�ʼu���o�F�A�߸�ı�o�ܷW�i�O�H
	LuaFunc_MoveToFlag(NPC , 780465 , 2 ,  0 )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Say(NPC , "[SC_422804_3]")		--���̫�ݭn�����ơA�O�@����Ŧ......
	sleep(40)
	LuaFunc_MoveToFlag(NPC , 780465 , 3 ,  0 )
	AdjustFaceDir( NPC , TargetID(), 0 )
	PlayMotion(NPC , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Say(NPC , "[SC_422804_4]")		--��ߡA�ܧִN�|�����A���|�Pı��k�h......
	sleep(30)

	local dog = CreateObjByFlag( 113709 , 780465 , 1 , 0 )  --�ڵ�G�@
	WriteRoleValue( dog , EM_RoleValue_IsWalk , 0 )
	AddToPartition( dog , 0 )
	MoveToFlagEnabled( dog , false )
	WriteRoleValue(dog , EM_RoleValue_IsWalk, 0 )
--	Hide( dog )
--	Show( dog ,0)

	LuaFunc_MoveToFlag(dog , 780465 , 4 ,  0 )
	Yell(dog , "[SC_422804_5]" , 3)		--�L�I�L�I
	LuaFunc_MoveToFlag(dog , 780465 , 5 ,  0 )

	sleep(30)
	local Man = CreateObjByFlag( 113732 , 780465 , 1 , 0 )  --���Q��
	WriteRoleValue(Man , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Man , 0 )
	MoveToFlagEnabled( Man , false )

	local Girl = CreateObjByFlag( 113712 , 780465 , 6 , 0 )  --�ƴ������
	WriteRoleValue(Girl , EM_RoleValue_IsWalk , 0 )
	AddToPartition( Girl , 0 )
	MoveToFlagEnabled( Girl , false )
	PlayMotion(Man , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(Man , "[SC_422804_6]" , 3)	--�p�O�֡H�����򰲧�[113630]�H
	AdjustFaceDir( Man, NPC , 0 )
	sleep(30)
	Yell(dog , "[SC_422804_7]" , 3)		--�L�I�L�L�I
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	PlayMotion(dog , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(10)
	local NPC1 = CreateObjByFlag( 113811 , 780465 , 3 , 0 )  --�~���k�l
	AddToPartition( NPC1 , 0 )
	MoveToFlagEnabled( NPC1 , false )
	Delobj( NPC )
	AdjustFaceDir( NPC1 ,Dog ,0 )
	sleep(30)
	PlayMotion(Man , ruFUSION_ACTORSTATE_HURT_NORMAL)
	Yell(Man , "[SC_422804_8]" , 3)	--�p......���N�O���ӿ��U�Q�m�T���k�h�ܡH
	if CheckID( TargetID() ) == true then
		FaceObj( Girl , TargetID() )
	end
	PlayMotion(NPC1 , ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep(30)
	PlayMotion(NPC1 , ruFUSION_ACTORSTATE_ATTACK_1H)
	Yell(NPC1 , "[SC_422804_9]", 3 )	--�o���Q�������A�֨��}�I�i�c�A�A�̳��M�ӯ}�a�ڪ��n�ơI�o���N��L�A�A�U���ڤ��|���}�z�𪺡C
	sleep(30)
	Delobj( NPC1 )
	sleep(30)
	PlayMotion( Girl  , ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	Yell(Girl , "[SC_422804_10]" , 3)	--�A�S�Ƨa�H�ֳܤU�o���Ĥ��A�N�i�H�Ѱ��A���骺�·��C
	if CheckID( TargetID() ) == true then
		CancelBuff( TargetID() , 503977 )	
		CancelBuff( TargetID() , 503604 )	
		SetFlag( TargetID()   , 543432, 1 )
	end
	sleep(30)
	PlayMotion( Man , ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(Man , "[SC_422804_11]",3)	--���Ӥk�l����[113630]�Q������H���o�n���Q��A���Q�H
	LuaFunc_MoveToFlag(dog , 780465 , 7,  0 )
--	sleep(20)
	AdjustFaceDir( Man , dog , 0 )
	PlayMotion( Man , ruFUSION_ACTORSTATE_EMOTE_WAVE)
	Yell(Man , "[SC_422804_12]" , 3)	--�ڵ��^�ӡI�O�l�L�h�A�ӦM�I�F�C
	sleep(30)
	Delobj( dog )
	AdjustFaceDir( Man , TargetID() , 0 )
	Yell(Man , "[SC_422804_13]" , 3)	--�ڥ��h��ڵ�a�^�ӡA�ߤ@�I�A�A�ӧ�ڧa�I
	SetFollow(  Girl , Man )
	LuaFunc_MoveToFlag(Man , 780465 , 7,  0 )
	Delobj( Man )	
	Delobj( Girl )	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
end

------�i�̪��f�\--543455�i���{�ȮR�u�G543456�i���ժܽu
function LuaS_422805()
	LoadQuestOption( OwnerID() )
	if	CheckCompleteQuest( OwnerID() , 422805) == true	and
		CheckCompleteQuest( OwnerID() , 422816) == false	and
		CheckCompleteQuest( OwnerID() , 422806) == false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422628_0]","LuaS_422805_1",0)	--�o�ͤ���ơH
	end
	if	CheckFlag( OwnerID(), 543456 ) == true	and
		CheckAcceptQuest( OwnerID() , 422816) == false	and
		CheckAcceptQuest( OwnerID() , 422806) == false	then
			SetFlag( OwnerID()   , 543456, 0 )
			SetFlag( OwnerID()   , 543455, 1 )
	end
end

function LuaS_113762()	--�Ȩ�������ܼ@��
	LoadQuestOption( OwnerID() )
	if	CheckFlag( OwnerID(), 543455 ) == true	and
		CheckAcceptQuest( OwnerID() , 422816) == false	and
		CheckAcceptQuest( OwnerID() , 422806) == false	then
			SetFlag( OwnerID()   , 543455, 0 )
			SetFlag( OwnerID()   , 543456, 1 )
	end
end

function LuaS_422805_1()
	CloseSpeak( OwnerID() )
	Hide( TargetID() )
	BeginPlot( TargetID() , "LuaS_422805_2" , 0 )
end

function LuaS_422805_2()
	local NPC = CreateObjByFlag( 102821 , 780475 , 1 , 0 ) 	--�Ȩ���
	AddToPartition( NPC , 0 )
	Say(NPC , "[SC_422805_1]")	--�֨����U�ڡI[113713]�Q�]�k�g�b�F�I�O�۫H�L���ܡI
	local OLD = LuaFunc_CreateObjByOBj( 102822, OwnerID() )	--�i���Q
	Say(OLD , "[SC_422805]")	--[113762]�ܦ��]���F�I���������ѥL�I
	AddBuff( OLD ,504991 ,100 ,-1 )
	WriteRoleValue( NPC , EM_RoleValue_PID , OLD )
	WriteRoleValue( OLD , EM_RoleValue_PID , NPC )
--	CallPlot( OLD , "LuaFunc_Obj_Suicide" , 300 )
--	CallPlot( NPC , "LuaFunc_Obj_Suicide" , 300 )
	BeginPlot( NPC , "LuaS_422805_NPC_CHECK" , 0 )
	BeginPlot( OLD , "LuaS_422805_OLD_CHECK" , 0 )


	SetPlot(NPC,"dead","LuaS_422805_NPC_dead",0 )
	SetPlot(OLD,"dead","LuaS_422805_OLD_dead",0 )


	SetAttack(NPC,OLD)
	SetAttack(OLD,NPC)

	for i = 0 , 100 , 1 do
		if CheckID(OLD) == false  then
			break
		end
		sleep( 60 )
	end
	Show( OwnerID() ,0)
end

function LuaS_422805_NPC_CHECK()
	local MonOLD = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckBuff( MonOLD , 504991)  == false  then
			break
		end
		sleep( 30 )
	end
	SetStopAttack( OwnerID() ) --�������
	Hide( OwnerID() )
	Lua_CancelAllBuff( OwnerID())  --�M�����W��BUFF
	SetRoleCamp( OwnerID() , "Visitor" ) --���ܰ}��

	for i = 0 , 100 , 1 do
		if CheckID(MonOLD)   == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

function LuaS_422805_OLD_CHECK()
	local MonNPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i = 0 , 100 , 1 do
		if CheckID(MonNPC) == false  then
			break
		end
		sleep( 30 )
	end
	Delobj( OwnerID() )
end

function LuaS_422805_NPC_dead()
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckCompleteQuest( Player , 422805) == true	and
			CheckAcceptQuest ( Player   , 422816 ) == false	and
			CheckAcceptQuest ( Player   , 422806 ) == false	and
			CheckCompleteQuest( Player , 422816) == false	and
			CheckCompleteQuest( Player , 422806) == false	then
			SetFlag( Player   , 543456, 0 )
			SetFlag( Player   , 543455, 1 )
		end	
	end
	Delobj( OwnerID() )
	return false
end

function LuaS_422805_OLD_dead()
	local Player 
	local Abel
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if ReadRoleValue( Player , EM_Rolevalue_OrgID ) == 102821 then
			Abel = Player
		end
		if	CheckCompleteQuest( Player , 422805) == true	and
			CheckAcceptQuest ( Player   , 422816 ) == false	and
			CheckAcceptQuest ( Player   , 422806 ) == false	and
			CheckCompleteQuest( Player , 422816) == false	and
			CheckCompleteQuest( Player , 422806) == false	then
			SetFlag( Player   , 543455, 0 )
			SetFlag( Player   , 543456, 1 )
		end	
	end
	SetStopAttack( OwnerID() ) --�������
--	Hide( OwnerID() )
	Lua_CancelAllBuff( OwnerID())  --�M�����W��BUFF
	SetFightMode( OwnerID() , 0 , 0 , 0 ,0 ) --���ܰ}��
	SetRoleCamp( OwnerID() , "Visitor" ) --���ܰ}��
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_DEAD)
	SetFightMode( Abel , 0 , 0 , 0 ,0 ) --���ܰ}��
	CallPlot( OwnerID() , "LuaS_422805_OLD_SHOW" , Abel)
	return false
end

function LuaS_422805_OLD_SHOW(Obj)
	AddBuff( OwnerID() , 502707, 0 , -1 )
	sleep(20)
	local Abel = Role:new( Obj )
--	local Man = CreateObjByFlag( 113762 , 780475 , 2 , 0 ) 	--�Ȩ���
	local Man = CreateObj( 113762 , Abel:X() ,Abel:Y() , Abel:Z() ,Abel:Dir() , 1 )
	AddToPartition( Man , 0 )
	sleep(300)
	Delobj( Man )
	Delobj( OwnerID() )
end

function LuaS_422816_422806()
	SetFlag( TargetID()   , 543455, 0 )
	SetFlag( TargetID()   , 543456, 0 )
end


