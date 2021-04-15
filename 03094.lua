--���� 426693  ���n�۩I
function szLuaScript_123184()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426693,548660) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426693_01"), "szLuaScript_123184_1", 0 );
	end
end
function szLuaScript_123184_1()
	SetSpeakDetail( OwnerID(),"[SC_426693_02]")
	SetFlag(OwnerID(),548660,1)
end
--
function szLuaScript_QuestTalk(quest,flag)
	if CheckAcceptQuest( OwnerID(), quest) and CheckFlag(OwnerID(),flag)==false then
		return true
	end
	return false
end

--����426694 ���N�䪺��
function szScript_OnClickObjBegin_426694()
	if CountBodyItem( OwnerID(),243074)>0 then
		return true
	end
	return false
end
function szScript_OnClickObjEnd_426694()
	DelBodyItem(OwnerID(),243074,1)
	DW_QietKillOne( OwnerID(), 108203 )
	return 1
end
--�����k���J
function LuaEvent_OnDead_426695()
	DW_QietKillOne( TargetID(),108391)
	return true
end
--����426697�A���w�P�L������
function szLuaScript_123177()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426697,548661) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426697_1"), "szLuaScript_123177_1(1)", 0 );
	end
end
function szLuaScript_123177_1(numx)
	numx = numx + 1
	SetSpeakDetail( OwnerID(),"[SC_426697_"..numx.."]" )
	if numx==6 then
		SetFlag(OwnerID(),548661,1 )	
	else
		numx = numx + 1
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_426697_"..numx.."]", "szLuaScript_123177_1("..numx..")", 0 );
	end
end
--����426698 ��������
function szLuaScript_123179()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426698,548662) then
		SetFlag(OwnerID(),548662,1)
	end
	if szLuaScript_QuestTalk(426700,548663) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426700_1"), "lua_426700_1", 0 );
	end
end
function lua_426700_1()
	SetSpeakDetail( OwnerID(),"[SC_426700_2]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426700_3"), "lua_426700_2", 0 );
end
function lua_426700_2()
	SetSpeakDetail( OwnerID(),"[SC_426700_4]")
	if szLuaScript_QuestTalk(426700,548663) then
		SetFlag(OwnerID(),548663,1)
	end
end
--�G�y�⪺�_��
function szLuaScript_123185()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426702,548569 ) then
		SetFlag( OwnerID(),548569,1 )
	end
	if szLuaScript_QuestTalk(426704,548665) then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426704_1"), "szLuaScript_426704_1", 0 );
	end
end
function szLuaScript_426704_1()
	SetSpeakDetail( OwnerID(),"[SC_426704_2]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_426704_3"), "szLuaScript_426704_2", 0 );
end
function szLuaScript_426704_2()
	SetSpeakDetail( OwnerID(),"[SC_426704_4]")
	SetFlag(OwnerID(),548665,1)
end
--�d�d���_
--function szLuaScript_123186()
--	LoadQuestOption(OwnerID())
--	if szLuaScript_QuestTalk(426707,548664) then
--		SetFlag(OwnerID(),548664,1)
--	end
--end
--������
function szLuaScript_123189()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426711,548568 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426711_1]","luaQuest_426711_1",0)
	end
end
function luaQuest_426711_1()
	SetSpeakDetail( OwnerID(),"[SC_426711_2]")
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426711_3]","luaQuest_426711_2",0)
end
function luaQuest_426711_2()
	SetSpeakDetail( OwnerID(),"[SC_426711_4]")
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426711_5]","luaQuest_426711_3",0)
end
function luaQuest_426711_3()
	SetSpeakDetail( OwnerID(),"[SC_426711_6]")
	if szLuaScript_QuestTalk(426711,548568 ) then
		SetFlag(OwnerID(),548568,1)
	end
end
--��Ǽw
function szLuaScript_123173()
	LoadQuestOption(OwnerID())
	if szLuaScript_QuestTalk(426712,548666 ) then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426712_1]","luaQuest_426712_1",0)
	end
end
function luaQuest_426712_1()
	SetSpeakDetail( OwnerID(),"[SC_426712_2]")
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426712_3]","luaQuest_426712_2",0)
end
function luaQuest_426712_2()
	SetSpeakDetail( OwnerID(),"[SC_426712_4]")
	if szLuaScript_QuestTalk(426712,548666 ) then
		SetFlag(OwnerID(),548666,1)
	end
end

--���@���@��A�P�º����
function szLuaScript_123181()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426701) and CheckFlag(OwnerID(),548664)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423177_0]","readyToQuest_426701",0)	--�ڷǳƦn�F
	end
end
--���ȡG���@���@��
function readyToQuest_426701()
	CloseSpeak( OwnerID() )
	local testObj = 116858
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==testObj then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--��t���b�i�椤�A�еy�ԡK
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426701_2",obj )
		end
end
--����ܡA��obj����t
function readyToQuest_426701_2(O_ID)
	local QuestID = 426701			--���Ƚs��
	local FinishFlagID = 548664			--����������o���X��
	local CheckBuffID = 621881			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 150			--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 123190, 780867, 1, 1 )	--��t�Ϋº�
		ActorArray[2] =CreateObjByFlag( 123182, 780867, 2, 1 )	--��t�ά���k�l
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			moveToFlagEnabled( ActorArray[1], false )
			moveToFlagEnabled( ActorArray[2], false )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)

	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--��t�}�l
	--�d������Ϊ��ˬd�禡
			Sleep(10)
			Say(ActorArray[1],"[SC_426701_1]" )	--�ܦh�H�����̲ׯ��_�ä��s�b�K
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_2]" )	--���_�O�s�b���C���]�p���A�ڤ~��n�ҩ��o�@�I�C
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			Sleep(30)
			Say(ActorArray[1],"[SC_426701_3]" )	--������p�|�p�����۩��_�K�K
			Sleep(30)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[1],"[SC_426701_4]" )	--�p�������@��Q�n�����ܡH
			Sleep(10)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
			Sleep(30)
			Say(ActorArray[2],"[SC_426701_5]" )	--�ڦ��i�D�A�����n�ܡH
			Sleep(30)
			Say(ActorArray[1],"[SC_426701_6]" )	--���K�K�ڵL�N���ߩp���p�ơC
			Sleep(20)	
			Say(ActorArray[2],"[SC_426701_7]" )	--��A�������A�O�o��{�u�C
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_8]" )	--�Y�n���O��������@�A�ˤ]�S����F���_�C
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_9]" )	--���˫ܤp���ɭԴN���ڦӥh�C
			Sleep(20)
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_10]" )	--�o����ڻ��L�@�ǨơK�ڥ����z�L�o���@��ӽT�{�A�p���Ӥw�C
			Sleep(30)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end

--�l�W����A�P�º����
function szLuaScript_123187()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426707) and CheckFlag(OwnerID(),548787)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423177_0]","readyToQuest_426707",0)	--�ڷǳƦn�F
	end
end
--���ȡG�l�W����
function readyToQuest_426707()
	CloseSpeak( OwnerID() )
	local testObj = 116858	--���ճJ
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==testObj then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--��t���b�i�椤�A�еy�ԡK
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426707_2",obj )
		end
end
--����ܡA��obj����t
function readyToQuest_426707_2(O_ID)
	local QuestID = 426707			--���Ƚs��
	local FinishFlagID = 548787			--����������o���X��
	local CheckBuffID = 621881			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 150			--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 123192, 780867, 3, 1 )	--��t�Υd�d���_
		ActorArray[2] =CreateObjByFlag( 123191, 780867, 4, 1 )	--��t�ά���k�l
		ActorArray[3] =CreateObjByFlag( 123190, 780867, 5, 1 )	--��t��
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			SetModeEx(  ActorArray[3]  , EM_SetModeType_ShowRoleHead, true )
			moveToFlagEnabled( ActorArray[1], false )
			moveToFlagEnabled( ActorArray[2], false )
			moveToFlagEnabled( ActorArray[3], false )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)
			AddToPartition(ActorArray[3],RoomID)
			LuaFunc_MoveToFlag( ActorArray[3], 780867, 6, 0 )

	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--��t�}�l
	--�d������Ϊ��ˬd�禡
			Sleep(10)
			Say(ActorArray[2],"[SC_426707_01]" )	--�i�D�ڬ�����K�d�d���_�K�K
			Sleep(20)
			Say(ActorArray[2],"[SC_426707_02]" )	--�ڵ��A�p�P����
			--PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_03]" )	--�o�ǴN�O���p���[243011]���H�ܡH�K�K
			Sleep(30)
			--PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[1],"[SC_426707_04]" )	--�U�U�A�̡A�O
			Sleep(40)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
			Sleep(20)
			Say(ActorArray[2],"[SC_426707_05]" )	--�o�P�L�̵L���I�^���ڪ����D�I�I
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_06]" )	--�ڷ�M�|�i�D�p�A���O�p�n��ڪ���ť�i�h�K
			Sleep(30)	
			Say(ActorArray[1],"[SC_426707_07]" )	--�ڭn�p�O�A��M��w�_�äF
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_08]" )	--�N��u�������{�@�檺�O�q�A�p�]�@�w�o�I�X�۹������F��C
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_09]" )	--�ڴ��չL�F�K���ǳ����b���W
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_10]" )	--�o�O���諸�A���F����L�h�A�Q�n�_������K
			Sleep(30)
			Say(ActorArray[2],"[SC_426707_11]" )	--��f�A�ڥs�A��f�I����v�T�K���O���i�઺�K
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_12]" )	--ť�ڪ��ܡA�O�A�l�o�ӯ��_�F�C
			Sleep(30)
			Say(ActorArray[2],"[SC_426707_13]" )	--�S���H�����ڡA�N��O�A�]����K
			Sleep(30)
			Say(ActorArray[3],"[SC_426707_14]" )	--�{�b���p��í�w�C���צp��A�ڭ̥����}�a�C
			Sleep(30)
			
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end

