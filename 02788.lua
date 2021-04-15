----------------------------------------------------------------------------
--���p�k�Ī��X�ͼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlBorn()
	SetDefIdleMotion (OwnerID() , ruFUSION_MIME_IDLE_DEAD) --��H���`�ʧ@���Nidle
end
----------------------------------------------------------------------------
-- ���˦a�p�k�Ī���ܼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local Quest = 425786 --���ȡG�I���諸�p�k��
	local KeyItem = 547198 --�@�Ϥp�k��
	local TalkString = { "[SC_425786_01]" }
	
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player , Quest ) == true and CheckScriptFlag( Player , KeyItem ) == false then
		AddSpeakOption( Player , NPC , TalkString[1] , "YoYo_WarmWinter_GirlTalkSelect" , 0 )
	end
	
end
----------------------------------------------------------------------------
-- ���˦a�p�k�Ī���ܼ@���G�ﶵ
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalkSelect()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local KeyItem = 547198 --�@�Ϥp�k��
	local TalkString = { "[SC_425786_02]" , "[SC_425786_03]" , "[SC_425786_04]" , "[SC_425786_05]" }
	local Desire = DW_Rand(3) --�H���@��T��@
	--DebugMsg( 0 , 0 , "Rand = "..Desire )
	
	local DesireObjID = { 121623 , 121624 , 121625 , 121626 } --�ŷx���j�l�B�ײ����j�\�B�x�V��§���B�w�u�@������
	local DesireItemID = { 242044 , 242045 , 242046 , 242047 } --�ŷx���@��B�������@��B�ּ֪��@��B�˱����@��
	local FireID = 121647 --�p�䪺����
	
	CloseSpeak(Player) --������ܤ���
	
	if CheckScriptFlag( Player , 547199 ) == true then --�P�_�̲��@�檺�X�ЬO�_���}��
		Desire = 4
	end

	--NPC������
	local NpcX = ReadRoleValue( NPC , EM_RoleValue_X )
	local NpcY= ReadRoleValue( NPC , EM_RoleValue_Y )
	local NpcZ = ReadRoleValue( NPC , EM_RoleValue_Z )
	local RanNum = math.random(360) --�H������

	--���󪺶Z���P����
	local NpcDistance = 30 --����PNPC�����Z��
	local ObjX = NpcX - NpcDistance * math.cos( math.pi / 180 * RanNum )
	local ObjZ = NpcZ + NpcDistance * math.sin( math.pi / 180 * RanNum )
	local ObjY = GetHeight( ObjX , NpcY , ObjZ )
	local FireDistance = 10 --����PNPC�����Z��
	local FireX = NpcX - FireDistance * math.cos( math.pi / 180 * RanNum )
	local FireZ = NpcZ + FireDistance * math.sin( math.pi / 180 * RanNum )
	local FireY = GetHeight( FireX , NpcY , FireZ )

	local DesireObj = CreateObj( DesireObjID[Desire] , ObjX , ObjY , ObjZ , 0 , 1 ) --�@�檫��
	SetModeEx( DesireObj , EM_SetModeType_Mark , false ) --���i�I��
	SetModeEx( DesireObj , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( DesireObj , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
	SetModeEx( DesireObj , EM_SetModeType_Strikback , false ) --���|����
	SetModeEx( DesireObj , EM_SetModeType_Move , false ) --���|����
	SetModeEx( DesireObj , EM_SetModeType_Fight , false ) --���i����
	SetModeEx( DesireObj , EM_SetModeType_Searchenemy , false ) --���|����
	SetModeEx( DesireObj , EM_SetModeType_Obstruct , false ) --�L���׮ĪG
	AdjustFaceDir( DesireObj , NPC , 0 )
	AddToPartition( DesireObj , RoomID )
	
	local FireObj = CreateObj( FireID , FireX , FireY , FireZ , 0 , 1 ) --����
	SetModeEx( FireObj , EM_SetModeType_Mark , false ) --���i�I��
	SetModeEx( FireObj , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( FireObj , EM_SetModeType_NotShowHPMP , false ) --����ܦ��
	SetModeEx( FireObj , EM_SetModeType_Strikback , false ) --���|����
	SetModeEx( FireObj , EM_SetModeType_Move , false ) --���|����
	SetModeEx( FireObj , EM_SetModeType_Fight , false ) --���i����
	SetModeEx( FireObj , EM_SetModeType_Searchenemy , false ) --���|����
	SetModeEx( FireObj , EM_SetModeType_Obstruct , false ) --�L���׮ĪG
	AdjustFaceDir( FireObj , NPC , 0 )
	AddToPartition( FireObj , RoomID )
	
	SetFlag( Player , KeyItem , 1 ) --�}�������ȺX��
	GiveBodyItem( Player , DesireItemID[Desire] , 1 ) --���D��
	
	local ConditionItem = 242070 --�ˬd���a�����Ȫ�����D��
	GiveBodyItem( Player , ConditionItem , 1 ) --��������D��

	AdjustFaceDir( Global_YoYo_Z358_GirlGetUp , DesireObj , 0 ) --�����ߪ��p�k�ĭ��V�@�檫��
	Callplot( Global_YoYo_Z358_GirlGetUp , "YoYo_WarmWinter_GirlGetUpPerform" , TalkString[Desire] , Desire , DesireObj )
	CallPlot( NPC , "YoYo_WarmWinter_GirlTalkEnd" , DesireObj , FireObj )
end
----------------------------------------------------------------------------
-- ���˦a�p�k�Ī���ܼ@���G��������
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalkEnd( DesireObj , FireObj )
	Sleep(100) --����s�b���ɶ�
	local NPC =  OwnerID()
	local DesireObjID = { 121623 , 121624 , 121625 , 121626 , 121647 } --�ŷx���j�l�B�ײ����j�\�B�x�V��§���B�w�u�@�������B�p�䪺����
	local ObjList = SearchRangeNPC( NPC , 50 )
	for i = 0 , #ObjList do
		for j = 1 , #DesireObjID do
			if ReadRoleValue( ObjList[i] , EM_RoleValue_OrgID ) == DesireObjID[j] then
				DelObj( ObjList[i] )
				--DebugMsg( 0 , 0 , "DelObj = " .. ObjList[i] )
			end
		end
	end
	--DelObj( FireObj )
end
----------------------------------------------------------------------------
--���_���p�k�Ī��X�ͼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpBorn()
	Global_YoYo_Z358_GirlGetUp = OwnerID()
end
----------------------------------------------------------------------------
-- ���˦a�p�k�Ī���ܼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local KeyItem2 = 547199 --�p�k�įu�����@��
	local TalkString = { "[SC_425786_06]" }
	
	if CheckScriptFlag( Player , KeyItem2 ) == true then
		SetSpeakDetail( Player , TalkString[1] )
	else
		LoadQuestOption(Player)
	end
end
----------------------------------------------------------------------------
--���_���p�k�Ī���t�@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpPerform( GirlTalk , Desire , DesireObj )
	local NPC = OwnerID()
	local EffectID = 850487 --�p�k�Ĵ_���S��
	local GrandmomTalk = { "[SC_425786_07]" , "[SC_425786_08]" }
	SysCastSpellLv( NPC , NPC , EffectID , 1 ) --��_���S��
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --��t�ʧ@
	Sleep(10)
	NPCSay( NPC , GirlTalk ) --�p�k���@���{����
	Sleep(20)
	if Desire == 4 then --�Y�O�@��4�A�h���񥤥���ܼ@��
		NPCSay( DesireObj , GrandmomTalk[1] ) --��������
		Sleep(20)
		NPCSay( NPC , GrandmomTalk[2] ) --�p�k�Ļ���
	end
end
----------------------------------------------------------------------------
--�����ȡG�I���諸�p�k�ġA�������Ȯɪ��@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_Complete425786()
	local Player = TargetID() --�������Ȫ����a
	local QuestFlag1 = 547197 --�i�H������1���X��
	local QuestFlag2 = 547278 --�i�H������2���X��
	local DesireItem1 = 242044 --�@�檫�~1
	local DesireItem2 = 242045 --�@�檫�~2
	local DesireItem3 = 242046 --�@�檫�~3
	local FullKeyItem = 547328 --���Լ��X��
	
	SetScriptFlag( Player , QuestFlag1 , 0 ) --���p�`����3���@�檫��A�h��������2���X��
	if CountBodyItem( Player , DesireItem1 ) > 0 and CountBodyItem( Player , DesireItem2 ) > 0 and CountBodyItem( Player , DesireItem3 ) > 0 then
		SetScriptFlag( Player , QuestFlag2 , 1 )
	end
	SetScriptFlag( Player , FullKeyItem , 1 )
	
	 DesignLog( Player , 121597 , "Complete" ) --��������1��Log����
	
end
----------------------------------------------------------------------------
--�����~�G�R���@�Ϥp�k�Ī��������~�ɪ��@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_DelItem242070()
	local Player = OwnerID() --�������Ȫ����a
	local QuestID = 425786
	local DesireItem1 = 242044
	local DesireItem2 = 242045
	local DesireItem3 = 242046
	
	if CheckAcceptQuest( Player , QuestID ) == false then --�ˬd���W�O�_��������
		DelBodyItem( Player , DesireItem1 , 1 )
		DelBodyItem( Player , DesireItem2 , 1 )
		DelBodyItem( Player , DesireItem3 , 1 )
	end
end
----------------------------------------------------------------------------
--�����ȡG�p�k�Ī��@��A�������Ȯɪ��@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_Complete425790()
	local Player = TargetID() --�������Ȫ����a
	local QuestFlag2 = 547278 --�i�H������2���X��
	SetScriptFlag( Player , QuestFlag2 , 0 )
	
	DesignLog( Player , 1215971 , "Complete" ) --��������2��Log����
	
end
----------------------------------------------------------------------------
-- ���t���E�j�Ԫ���ܼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local Quest = 425790 --���ȡG�p�k�Ī��@��
	local KeyItem2 = 547199 --�`���p�k�Ī��@��
	local KeyItem3 = 547200 --�F�Ѥp�k�įu�����@��
	local TalkString = { "[SC_425790_01]" , "[SC_425790_02]" }
	
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player , Quest ) == true
	and CheckScriptFlag( Player , KeyItem2 ) == true
	and CheckScriptFlag( Player , KeyItem3 ) == false then
		AddSpeakOption( Player , NPC , TalkString[2] , "YoYo_WarmWinter_SantaClausSelect2" , 0 )
	elseif CheckAcceptQuest( Player , Quest ) == true 
	and CheckScriptFlag( Player , KeyItem3 ) == false then
		AddSpeakOption( Player , NPC , TalkString[1] , "YoYo_WarmWinter_SantaClausSelect1" , 0 )
	end
end
----------------------------------------------------------------------------
-- ���t���E�j�Ԫ���ܼ@���G�ﶵ1
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausSelect1()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local KeyItem2 = 547199 --�`���p�k�Ī��@��
	local TalkString = { "[SC_425790_03]" , "[SC_425790_05]" }
	local DesireItemID = { 242044 , 242045 , 242046 , 242047 } --�ŷx���@��B�������@��B�ּ֪��@��B�˱����@��
	
	if CountBodyItem( Player , DesireItemID[1] ) >= 1 
	and CountBodyItem( Player , DesireItemID[2] ) >= 1 
	and CountBodyItem( Player , DesireItemID[3] ) >= 1 then
		SetSpeakDetail( Player , TalkString[2] ) --��������w����
		SetFlag( Player , KeyItem2 , 1 )
		DelBodyItem( Player , DesireItemID[1] , 1 )
		DelBodyItem( Player , DesireItemID[2] , 1 )
		DelBodyItem( Player , DesireItemID[3] , 1 )
	else
		SetSpeakDetail( Player , TalkString[1] ) --�������󥼺���
	end
end
----------------------------------------------------------------------------
-- ���t���E�j�Ԫ���ܼ@���G�ﶵ2
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausSelect2()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local DesireItemID = 242047 --�˱����@��
	local KeyItem3 = 547200 --�F�Ѥp�k�įu�����@��
	local TalkString = { "[SC_425790_04]" , "[SC_425790_06]" }
	
	if CountBodyItem( Player , DesireItemID ) >= 1 then
		SetSpeakDetail( Player , TalkString[2] ) --�������󥼺���
		SetFlag( Player , KeyItem3 , 1 )
		DelBodyItem( Player , DesireItemID , 1 )
	else
		SetSpeakDetail( Player , TalkString[1] ) --�������󥼺���
	end
end
----------------------------------------------------------------------------
-- ���@����諸�X�ͼ@��
----------------------------------------------------------------------------
function YoYo_WarmWinter_FireBorn()
	local FireObj = OwnerID()
	local WarmBuff = 507088
	AddBuff( FireObj , WarmBuff , 1 , -1 )
end
----------------------------------------------------------------------------
-- �����եΫ��O�G���mYoYo���x�V�`�Ҧ��X�лP���Ȫ��A
----------------------------------------------------------------------------
function YoYo_WarmWinter_ClearAll()
	local Player = OwnerID()
	local QuestList = { 425786 , 425790 }
	local FlagList = { 547197 , 547278 , 547198 , 547199 , 547200 }
	local ItemList = { 242044 , 242045 , 242046 , 242047 }
	
	for Count = 1 , #QuestList do
		SetQuestState( Player , QuestList[Count] , 0 )
	end
	for Count = 1 , #FlagList do
		SetScriptFlag( Player , FlagList[Count] , 0 )
	end
	for Count = 1 , #ItemList do
		DelBodyItem( Player , ItemList[Count] , 1 )
	end	
end