------------------------------------------------------------------------
function William_NPCEmotion_Z23()--��y�Ԥh�����H���ʧ@
	local  RandID=rand(2)+1
	if RandID==1 then local  EmotID=rand(4)+1
		if EmotID==1 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0,ruFUSION_ACTORSTATE_EMOTE_IDLE0) end
		if EmotID==2 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1,ruFUSION_ACTORSTATE_EMOTE_IDLE1) end
		if EmotID==3 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2,ruFUSION_ACTORSTATE_EMOTE_IDLE2) end
		if EmotID==4 then PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED) end
	end
end
------------------------------------------------------------------------
function William_NPCAnger_Z23()--�p���Ԥh�s��J��
	CastSpell( OwnerID(), OwnerID(), 499256)
end
------------------------------------------------------------------------
Function Z23_Smoke_01()--�Գ��v��
	AddBuff ( OwnerID(), 622119 , 1, -1 )
	while 1 do
		local X=Rand(3)+1
		local Y=Rand(5)+10
		local Z=Rand(50)+100
		if X==1 or X==2 then
		AddBuff ( OwnerID(), 621639 , 1, Y )
		end
	Sleep(Z)
	end
End
------------------------------------------------------------------------
Function Z23_Smoke_02()--�Գ��v��
	AddBuff ( OwnerID(), 622119 , 1, -1 )
End
------------------------------------------------------------------------
Function Z23_NPC120736_01()--�P�i����D�������
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241607 )>0 then
			if CheckFlag( OwnerID(), 546298 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241607, 1 )
				GiveBodyItem( OwnerID(), 546298, 1 )--���������ɵ�
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	end
End
------------------------------------------------------------------------
Function Z23_NPC120281_01()--�P�㺸��D�f����
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241608 )>0 then
			if CheckFlag( OwnerID(), 546710 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241608, 1 )
				GiveBodyItem( OwnerID(), 546710, 1 )--������s�ɵ�
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	end
	if CheckAcceptQuest( OwnerID(), 425410 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425598 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425617 )==TRUE then
		if CountBodyItem( OwnerID(), 241324 )>0 then
			if CheckFlag( OwnerID(), 546297 )==False then
				--DelBodyItem( OwnerID(), 241324, 1 )
				GiveBodyItem( OwnerID(), 546297, 1 )--�N������q�浹�㺸��D�f��
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z23_NPC120722_01()--�Pù���D�S�������
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241609 )>0 then
			if CheckFlag( OwnerID(), 546711 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241609, 1 )
				GiveBodyItem( OwnerID(), 546711, 1 )--�������Ըɵ�
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	end	
End
------------------------------------------------------------------------
Function Z23_Quest425402_00()--����NPC��ժ��A
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, False )
	Sleep(10)
	Npcsay( OwnerID(),"[SC_116838_35]")
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, True )	
End
------------------------------------------------------------------------
Function Z23_NPC106615_00()--�p���Ԥh�H���t�����A
	while 1 do
		if CheckBuff( OwnerID(), 622877)==False then
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )==1 then
				local Num=Rand(3)+1
				if Num==1 then
					AddBuff ( OwnerID(), 622872, 0, 10 )--�X��
				End
				if Num==2 then
					AddBuff ( OwnerID(), 622873, 0, 10 )--��z
				End
				if Num==3 then
					AddBuff ( OwnerID(), 622874, 0, 60 )--���r
				End
			else AddBuff ( OwnerID(), 622873, 0, -1 )--��z
			End
		End
	Sleep(30)
	End
End
------------------------------------------------------------------------
Function Z23_Item241282_00()--��X�����c�ϥΧP�_
	if GetDistance( OwnerID(), TargetID() ) <26 then
		if ReadRoleValue( TargetID(), EM_RoleValue_IsAttackMode )==0 then
			if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106615 or
	 		ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106616 or
 			ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106676 then
				if Checkbuff(TargetID(), 622872 )==True or
				Checkbuff(TargetID(), 622873 )==True or
				Checkbuff(TargetID(), 622874 )==True then
				CallPlot( OwnerID(), "Z23_Item241282_01", OwnerID(),TargetID())
				return True
				else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--�ϥΥؼп��~�I
				end
			else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--�ϥΥؼп��~�I
			return False
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421249_3]", 0 )--�ϥΪ���H�����b�D�԰����A�I
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424086_8]", 0 )--�A���Z���ӻ��A�ЦA�a��@�I�I
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241282_01(Player,Warrior)--��X�����c�ϥε��G
	UseItemDestroy()
	DW_QietKillOne( Player, 106808 )
		if Checkbuff(Warrior, 622872 )==True then
			CancelBuff(Warrior, 622872 )
		elseif Checkbuff(Warrior, 622873 )==True then
			CancelBuff(Warrior, 622873 )
		elseif Checkbuff(Warrior, 622874 )==True then
			CancelBuff(Warrior, 622874 )
		end
	AddBuff (Warrior, 622877, 0, 30 )--�Ȯɧܩ�
	npcsay(Warrior,"[SC_RESCUE_STRING_NPC02]")
End
------------------------------------------------------------------------
Function Z23_Item241281_00()--�S���ľ��ϥ��ˬd
	if GetDistance( OwnerID(), TargetID() ) <26 then
		if ReadRoleValue( TargetID(), EM_RoleValue_IsAttackMode )==0 then
			if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106615 or
		 	ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106616 or
 			ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106676 then
				if Checkbuff(TargetID(), 622874 )==True then
					CallPlot( OwnerID(), "Z23_Item241281_01", OwnerID(),TargetID())
				else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--�ϥΥؼп��~�I
				return False
				end
			else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--�ϥΥؼп��~�I
			return False
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421249_3]", 0 )--�ϥΪ���H�����b�D�԰����A�I
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424086_8]", 0 )--�A���Z���ӻ��A�ЦA�a��@�I�I
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241281_01(Player,Warrior)--�S���ľ��ϥε��G
	if Checkbuff(Warrior, 622874)==True then
		UseItemDestroy()
		CancelBuff(Warrior, 622874)
		DW_QietKillOne( Player, 106619 )
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--�ϥΥؼп��~�I
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241278_Checking()----�ϥίS���īe�ˬd
	local Num=0
	local Energy=SearchRangeNPC(OwnerID(), 50)
	for i=0,table.getn(Energy) do
		if ReadRoleValue( Energy[i] , EM_RoleValue_OrgID)==120766 then
			Num=Num+1
		end
	end
	if Num>=1 then
		PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
		return True
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_113120_MALA2_61]", 0 )--�ؼФ��b�@�νd�򤺡C
		return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241278_00()--�S���Ĩϥε��G
	local X=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local Z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local Bomb=CreateObj(120767, X, Y-5, Z, 0, 1)--���ͯS����
	SetModeEx( Bomb, EM_SetModeType_Gravity, false )--���O
	AddToPartition( Bomb, 0 )
	CallPlot(Bomb, "Z23_Item241278_Exploding",OwnerID(),Bomb)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
	UseItemDestroy()
	DW_QietKillOne( OwnerID(), 106807 )
End
------------------------------------------------------------------------
function Z23_Item241278_Exploding(Player,Bomb)--�S�����z���@��
	local Target=SearchRangeNPC(OwnerID(), 50)
	local Energy=0
	for i=0,table.getn(Target) do
		if ReadRoleValue( Target[i] , EM_RoleValue_OrgID)==120766 then
			Energy=Target[i]
		end
	end
	CastSpell(Bomb, Bomb, 850313)
	CastSpell(Energy, Energy, 850314)
	Sleep(60)
	DelObj(Bomb)
	CallPlot(Energy, "LuaFunc_ResetObj",Energy)
End
------------------------------------------------------------------------
function Z23_NPC120766_00()--������q��l
	AddBuff ( OwnerID(), 622893, 0, -1 )
End
------------------------------------------------------------------------
Function Z23_NPC120825RECHECK_00()--2012/12/26�s�WbyWilliam
	local RID=ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local AMT=SetSearchAllNPC( RID )
	local OID=0
	if AMT~=0 then
		for i=0, AMT do
			OID=GetSearchResult()
			if ReadRoleValue( OID, EM_RoleValue_OrgID )==120825 then
				Delobj( OID )
			end
		end
	end
end
----------------------------------------------------------------------------------------------------