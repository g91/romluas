------------------------------------------------------------------------���൲���ϥΰʧ@
function Z23_Item241322_00()
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
End
------------------------------------------------------------------------���൲���ϥε��G
function Z23_Item241322_01()
	if CheckFlag( OwnerID(), 546289 )==False then
		UseItemDestroy()
		local Num=Rand(5)
		if Num<=2 then
			local QuestID=Rand(7)+1
			if QuestID==1 then 
				Z23_HeroSoul_00(425416)--�Ʊ檺�O��
				return True
			end
			if QuestID==2 then
				Z23_HeroSoul_00(425417)--�i�𪺰O��
				return True
			end
			if QuestID==3 then
				Z23_HeroSoul_00(425418)--���q���O��
				return True
			end
			if QuestID==4 then
				Z23_HeroSoul_00(425419)--���z���O��
				return True
			end
			if QuestID==5 then
				Z23_HeroSoul_00(425420)--�O�R���O��
				return True
			end
			if QuestID==6 then
				Z23_HeroSoul_00(425508)--�e�e���O��
				return True
			end
			if QuestID==7 then
				Z23_HeroSoul_00(425509)--���۪��O��
				return True
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_241322_03]",C_SYSTEM )--�A�ϥΤF[241322]�A�o����Ƥ]�S�o�͡I
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_241322_02]", 0 )--�A�w���o�������ȡA�ȮɵL�k�ϥΡI
	return False
	end
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
end
------------------------------------------------------------------------
function Z23_HerosSoul_00()--�^���F���l�@��
	AddBuff ( OwnerID(),621848,1,-1)
	AddBuff ( OwnerID(),622264,1,-1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
	SetPlot( OwnerID(),"touch","Z23_CastingSoul_00",30 )
End
------------------------------------------------------------------------
function Z23_CastingSoul_00()--�^���F��Ĳ�I�@��
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
		CallPlot(TargetID(), "Z23_CastingDefence_00",TargetID())
		CastSpell( OwnerID(),TargetID(),850317)
	else Return
	end
end
------------------------------------------------------------------------
function Z23_CastingDefence_00()--����ư���k�N
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 1 )
	Sleep(20)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
end
------------------------------------------------------------------------
function Z23_Skills850317_00()--�k�N850317�ϥ��ˬd�ε��G
	local Num=0
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==120271 and--�d�����S�D�d�ĩi
	CheckAcceptQuest( OwnerID(), 425416)==True then--�Ʊ檺�O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850327)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121019 and--�����d���D�w����
	CheckAcceptQuest( OwnerID(), 425417)==True then--�i�𪺰O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850328)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121020 and--���J�D�\��
	CheckAcceptQuest( OwnerID(), 425418)==True then--���q���O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850329)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121021 and--�i�⸦��D������
	CheckAcceptQuest( OwnerID(), 425419)==True then--���z���O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850330)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121022 and--���k���աD��J��
	CheckAcceptQuest( OwnerID(), 425420)==True then--�O�R���O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850331)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121023 and--���ҫn�D�ں��w
	CheckAcceptQuest( OwnerID(), 425508)==True then--�e�e���O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850332)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121024 and--Ĭ�J�J�D��ù
	CheckAcceptQuest( OwnerID(), 425509)==True then--���۪��O��
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850333)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--��������j�N�^�����O��
			Num=Num+1
		end
	end
	if Num==0 then
	local Strings=Rand(4)+1
		if Strings==1 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_850317_01]",C_SYSTEM)
		end
		if Strings==2 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_850317_02]",C_SYSTEM)
		end
		if Strings==3 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_850317_03]",C_SYSTEM)
		end
		if Strings==4 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_850317_04]",C_SYSTEM)
		end
	end
end
------------------------------------------------------------------------
function Z23_HEROSOULSPEAKS_00()
	Sleep(10)
	NpcSay(OwnerID(),"[SC_Z23HEROSOULSPEAKS_01]")
	local Num=Rand(5)+1
	Sleep(25)
	if Num==2 then NpcSay(OwnerID(),"[SC_Z23HEROSOULSPEAKS_02]") end
	if Num==3 then NpcSay(OwnerID(),"[SC_Z23HEROSOULSPEAKS_03]") end
	if Num==4 then NpcSay(OwnerID(),"[SC_Z23HEROSOULSPEAKS_04]") end
	if Num==5 then NpcSay(OwnerID(),"[SC_Z23HEROSOULSPEAKS_05]") end
end
------------------------------------------------------------------------
function Z23_HeroSoul_00(QuestID) --�ק��DW_Border()
	local Obj = OwnerID()
	local QuestLv = GameObjInfo_Int( QuestID ,"iCheck_LowerLV") 
	if	ReadRoleValue(Obj,EM_RoleValue_Lv)<QuestLv	then
		ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_01]"..QuestLv, 0 )
		return false
	end
	if	CheckCompleteQuest(Obj,QuestID)==true	then
		local QuestType = GameObjInfo_Int( QuestID ,"iQuestGroup") 
		if	QuestType == 0 	then
			ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_02]", 0 )
			return false
		end
	end
	if	CheckAcceptQuest(Obj,QuestID)==true	then
		ScriptMessage( Obj, Obj, 1, "[SYS_QUEST_03]", 0 )
		return false
	end
	--local str = "["..GetUseItemGUID(Obj).."]"--���X����W��
	ClearBorder( Obj)--��l�ƥ۸O����
	AddBorderPage( Obj, GetQuestDetail(QuestID,1))--�۸O���e
	ShowBorder( Obj, QuestID,"[SC_Z23HEROSOULSPEAKS_06]","ScriptBorder_Texture_Paper" )--�۸O���D
end
------------------------------------------------------------------------
function TempControlNpcSetting_00()
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )--�����
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy , false )--������
	SetModeEx( OwnerID(), EM_SetModeType_Save , false )--���x�s
	SetModeEx( OwnerID(), EM_SetModeType_Revive , false )--������
	SetModeEx( OwnerID(), EM_SetModeType_Obstruct , false )--������
	SetModeEx( OwnerID(), EM_SetModeType_Strikback , false ) --������
	SetModeEx( OwnerID(), EM_SetModeType_Fight , false )--���i���
	SetModeEx( OwnerID(), EM_SetModeType_Gravity , true )--�����O	
	SetModeEx( OwnerID(), EM_SetModeType_Move , false )--������
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead , false )--�L�Y����
	SetModeEx( OwnerID(), EM_SetModeType_HideName , true)--�L�W�����
	SetModeEx( OwnerID(), EM_SetModeType_SearchenemyIgnore , true )--���|�Q�j�M
	SetModeEx( OwnerID(), EM_SetModeType_Mark , false )--���аO
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--����ܦ��
end
------------------------------------------------------------------------