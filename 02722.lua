------------------------------------------------------------------------
Function Z24_NPC121111_01()--�w�w���D������ܼ@��
	if CheckAcceptQuest( OwnerID(),425400 )==true then
		SetSpeakDetail( OwnerID(), "[SC_QUEST425400_01]" )
		AddSpeakOption( OwnerID(), TargetID(), "[SC_QUEST425400_04]", "Z24_NPC121111_02", 0 )
	else LoadQuestOption( OwnerID() )
	end
	if CheckAcceptQuest( OwnerID(), 425659 )==true or
	CheckAcceptQuest( OwnerID(), 425669 )==true then
		if CountBodyItem( OwnerID(), 241357 )>=1 then
			SetSpeakDetail( OwnerID(), "[SC_QUEST425400_01]" )
			AddSpeakOption( OwnerID(), TargetID(), "[SC_QUEST425400_04]", "Z24_NPC121111_03", 0 )
		else LoadQuestOption( OwnerID() )
		end
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z24_NPC121111_02()--�v���ǰe�]�k�@�����O
	if CountBodyItem( OwnerID(), 241327 )>=1 or
	CheckFlag( OwnerID(), 546512 )==true then
		if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
			WriteRoleValue( TargetID(), EM_RoleValue_Register1, 1 )
			SetModeEx( TargetID(), EM_SetModeType_ShowRoleHead, false )
			DisableQuest( TargetID(), true )
			CallPlot( TargetID(), "Z24_Quest425400_00", OwnerID() )
			DelBodyItem( OwnerID(), 241327, 1 )
			GiveBodyItem( OwnerID(), 546512, 1 )
			CloseSpeak( OwnerID() )
		else ScriptMessage( OwnerID(), OwnerID(), 2, "[SAY_NPC_BUSY]", C_SYSTEM )--�ؼХ��b���L��
		end
	else SetSpeakDetail( OwnerID(), "[SC_QUEST425400_00]" )
	end
End
------------------------------------------------------------------------
function Z24_NPC121111_03()
	local num=0
	if CountBodyItem( OwnerID(), 241327 )>=1 then
		num=num+1
	else 	SetSpeakDetail( OwnerID(), "[SC_QUEST425400_00]" )
	end
	if CountBodyItem( OwnerID(), 241357 )>=1 then
		num=num+1
	else ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_424151_2]", C_SYSTEM )
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
		num=num+1
	else ScriptMessage( OwnerID(), OwnerID(), 2, "[SAY_NPC_BUSY]", C_SYSTEM )
	end
	if num>=3 then
		CallPlot( TargetID(), "Z24_NPC121111_04", OwnerID() )
	end
end
------------------------------------------------------------------------
function Z24_NPC121111_04(PlayerID)
	local Anders=ownerid()
	local npc={}
	local machine=0
	local fxball=0
	DW_QietKillOne( PlayerID, 106618 )
	DelBodyItem( PlayerID, 241327, 1 )
	DelBodyItem( PlayerID, 241357, 1 )
	WriteRoleValue( Anders, EM_RoleValue_Register1, 1 )
	SetModeEx( Anders, EM_SetModeType_ShowRoleHead, false )
	DisableQuest( Anders, true )
	CloseSpeak( PlayerID )
	npc=SearchRangeNpc( Anders, 100 )
	for i=0,table.getn(npc) do
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID)==121127 then
			fxball=npc[i]
		end
		if ReadRoleValue( npc[i], EM_RoleValue_OrgID)==121126 then
			machine=npc[i]
		end
	end
	AdjustFaceDir( Anders, machine, 0 )
	PlayMotion( Anders, 131 )
	CastSpell( fxball, fxball, 850335 )
	sleep(20) PlayMotion( OwnerID(), 133 )
	sleep(10) AdjustFaceDir( Anders, machine, -120 )
	DisableQuest( Anders, false )
	SetModeEx( Anders, EM_SetModeType_ShowRoleHead, true )
	WriteRoleValue( Anders, EM_RoleValue_Register1, 0 )
end
------------------------------------------------------------------------
Function Z24_Quest425400_00(Player)--�}�Ҽv���ǰe�]�k
	local ACT01=0--�v���ǰe�S�Ĳy
	local ACT02=0--�����Ǭ����u
	local ACT03=0--�v���ǰe����
	MoveToFlagEnabled( OwnerID(), false )
	local Scholar=SearchRangeNPC ( OwnerID() ,100 ) 
	for i=0,table.getn(Scholar) do
		if ReadRoleValue( Scholar[i], EM_RoleValue_OrgID)==121127 then
			ACT01=Scholar[i]
		end
		if ReadRoleValue( Scholar[i], EM_RoleValue_OrgID)==121126 then
			ACT03=Scholar[i]
		end
	end
	Sleep(15)
	AdjustFaceDir( OwnerID(), ACT03, 0 )
	ScriptMessage( OwnerID(), Player, 2, "[SC_QUEST425400_02]", C_SYSTEM )--��̤�����s����[121116]���b�}�Ҽv���ǰe�I
	Sleep(05)
	PlayMotion( OwnerID(), 131 )
	Sleep(55)
	local x=ReadRoleValue(ACT01,EM_RoleValue_X)
	local y=ReadRoleValue(ACT01,EM_RoleValue_Y)
	local z=ReadRoleValue(ACT01,EM_RoleValue_Z)
	local location={x,y-20,z}
	ACT02=Lua_DW_CreateObj( "xyz", 121112, location, 0, 1, 1 )
	SetModeEx( ACT02, EM_SetModeType_Searchenemy , false )-- ����
	SetModeEx( ACT02, EM_SetModeType_Fight , false )-- �i�������
	SetModeEx( ACT02, EM_SetModeType_Strikback , false )-- ����
	SetModeEx( ACT02, EM_SetModeType_ShowRoleHead, true )-- �Y����
	SetModeEx( ACT02, EM_SetModeType_Mark, true )-- �аO
	SetModeEx( ACT02, EM_SetModeType_HideName , false )-- �W��
	SetModeEx( ACT02, EM_SetModeType_Move , false )-- ����
	SetModeEx( ACT02, EM_SetModeType_NotShowHPMP, false )-- HP
	SetModeEx( ACT02, EM_SetModeType_Gravity, false )--���O
	SetModeEx( ACT02, EM_SetModeType_Save, false )--�x�s
	AddBuff ( ACT02, 623135, 0, 30)
	SetDefIdleMotion( ACT02, ruFUSION_MIME_EMOTE_SPEAK)
	AdjustFaceDir( ACT02, Player, 0 )
	AddToPartition( ACT02, 0 )
	CallPlot( ACT02, "Z24_NPC121112_00", ACT02 )
	Sleep(155)
	ScriptMessage( OwnerID(), Player, 2, "[SC_QUEST425400_03]", C_SYSTEM )--�t��G�ꪺ��q�Y�N�ӺɡA�v���ǰe�����I
	Sleep(55)
	DelObj ( ACT02 )
	Sleep(30)
	PlayMotion( OwnerID(), 133 )
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--��_�}���Y����
	DisableQuest( OwnerID(), false )
	Sleep(15)
	AdjustFaceDir( OwnerID(), ACT03, -120 )
	MoveToFlagEnabled( OwnerID(), true )
End
------------------------------------------------------------------------
Function Z24_Quest425400_01()
	local Will=OwnerID()
	local Player=TargetID()
	local Switch=ReadRoleValue( Will, EM_RoleValue_Register1 )
	if Switch==1 then return
	else	WriteRoleValue( Will, EM_RoleValue_Register1, 1 )
		AddBuff( Player, 623382, 0, 15 )
		local x, y, z, dir=DW_Location( Will )
		local TempWill=CreateObj( 121353, x, y, z, dir, 1 )
		SetModeEx( TempWill, EM_SetModeType_Mark, false )
		SetModeEx( TempWill, EM_SetModeType_ShowRoleHead, false )
		SetModeEx( TempWill, EM_SetModeType_HideName , true )
		SetModeEx( TempWill, EM_SetModeType_NotShowHPMP, true )
		SetModeEx( TempWill, EM_SetModeType_Save, false )
		MoveToFlagEnabled( TempWill, false )
		WriteRoleValue( TempWill, EM_RoleValue_IsWalk, 1 )
		AddToPartition( TempWill, 0 )
		Sleep(15) NpcSay( TempWill, "[SC_QUEST425400_05]" )
		Sleep(20) LuaFunc_MoveToFlag( TempWill, 781211, 0, 0 )
		AdjustFaceDir( TempWill, Player, 0 )
		Sleep(05) NpcSay( TempWill, "[SC_QUEST425400_06]" )
		Sleep(30) FaceFlag( TempWill, 781211, 1 ) AdjustDir( TempWill, 0 )
		SetDefIdleMotion( TempWill, ruFUSION_MIME_WALK_FORWARD )
		Sleep(10) DelObj( TempWill )
		WriteRoleValue( Will, EM_RoleValue_Register1, 0 )
	end
End
------------------------------------------------------------------------
Function Z24_Quest425400_02()
	local Tannis=OwnerID()
	local Player=TargetID()
	local Fxball=0
	local Switch=0
	local NPC=SearchRangeNPC ( Tannis, 50 )
	for i=0,table.getn(NPC) do
		if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)==121127 then
			Fxball=NPC[i]
		end
	end
	Switch=ReadRoleValue( Fxball, EM_RoleValue_Register1 )
	if Switch==1 then
		return
	else	WriteRoleValue( Fxball, EM_RoleValue_Register1, 1 )
		Callplot( Fxball, "Z24_Quest425400_03", Fxball, Player )
	end
	AddBuff( Player, 623388, 0, 10 )
end
Function Z24_Quest425400_03(Fxball, Player)
	local Ria=0
	Ria=CreateObjByFlag( 121115, 781186, 0 , 1 )
	WriteRoleValue( Ria, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled( Ria, false )
	SetDefIdleMotion( Ria, ruFUSION_MIME_RUN_FORWARD )
	AddToPartition( Ria, 0 )
	Sleep(15) SetDefIdleMotion( Ria, ruFUSION_MIME_IDLE_COMBAT_1H )
	Sleep(10) NpcSay( Ria, "[SC_QUEST425400_07]" )
	Sleep(10) LuaFunc_MoveToFlag( Ria, 781186, 1, 0 )
	AdjustFaceDir( Ria, Player, 0 )
	Sleep(10) NpcSay( Ria, "[SC_QUEST425400_08]" )
	Sleep(35) Delobj( Ria )
	WriteRoleValue( Fxball, EM_RoleValue_Register1, 0 )
End
------------------------------------------------------------------------
Function Z24_NPC121112_00()
	local Tannis=OwnerID()
	local PlayerID={}
	Sleep(20)
	while 1 do
		Sleep(10)
		PlayerID=SearchRangePlayer( Tannis, 100 )
		for sn=0, table.getn(PlayerID), 1 do
			if  CheckAcceptQuest( PlayerID[sn], 425400 )==true then
				if CountBodyItem( PlayerID[sn], 546514 )==0 then
					SetScriptFlag( PlayerID[sn], 546514, 1 )
				end
			end
		end
	end
End
------------------------------------------------------------------------
Function Z24_Quest425401_01()
	local Ria=OwnerID()
	local Player=TargetID()
	local TempRia=0
	local Switch=ReadRoleValue( Ria, EM_RoleValue_Register1 )
	if Switch==1 then return
	else	WriteRoleValue( Ria, EM_RoleValue_Register1, 1 )
		AddBuff( Player, 623392, 0, 15 )	
		TempRia=CreateObjByFlag( 121117, 781186, 1, 1 )
		WriteRoleValue( TempRia, EM_RoleValue_IsWalk, 0 )
		MoveToFlagEnabled( TempRia, false )
		SetDefIdleMotion( TempRia, ruFUSION_MIME_IDLE_COMBAT_1H )
		Sleep(05) FaceFlag ( TempRia, 781186, 0 )
		AddToPartition( TempRia, 0 )
		Sleep(10) NpcSay( TempRia, "[SC_QUEST425401_00]" )
		LuaFunc_MoveToFlag( TempRia, 781186, 0, 0 )
		Sleep(10) NpcSay( TempRia, "[SC_QUEST425401_01]" )
		Sleep(20) SetDefIdleMotion( TempRia, ruFUSION_MIME_RUN_FORWARD )
		Sleep(05) Delobj( TempRia )
		WriteRoleValue( Ria, EM_RoleValue_Register1, 0 )
	End
End
------------------------------------------------------------------------
Function Z24_NPC121114_00()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_CROUCH_LOOP )
End
------------------------------------------------------------------------
Function Z24_NPC121114_01()
	local Player=OwnerID()
	local Ria=TargetID()
	LoadQuestOption( Player )
	if CheckAcceptQuest( Player, 425401 )==true then
		DW_QietKillOne( Player, 107114 )
	else LoadQuestOption( Player )
	end
	if CheckAcceptQuest( Player, 425623 )==true and
	CheckScriptFlag( Player, 546513 )==false then
		AddSpeakOption( Player, Ria, GetString("SC_QUEST425623_11"), "Z24_NPC121114_02", 0 )
	end
End
------------------------------------------------------------------------�Ұʫ��s"SC_QUEST425623_11"�����
Function Z24_NPC121114_02()
	local PlayerID=OwnerID()
	CloseSpeak( PlayerID )
	CallPlot( TargetID(), "Z24_Quest425623_00", PlayerID )
End
------------------------------------------------------------------------
Function Z24_Quest425623_00(PlayerID)
	local MainRia=OwnerID()
	local NPC={}
	local MainSoldier=0
	local TempSoldier=0
	local Status=ReadRoleValue( MainRia, EM_RoleValue_Register1 )--Ū�X�@���}�������A
	if Status==1 then
		ScriptMessage( MainRia, PlayerID, 1, "[SC_TARGETBUSY_DW]", 0 )--�ؼа���@�����I
		return
	else	WriteRoleValue( MainRia, EM_RoleValue_Register1, 1 )--�Ұʼ@���}��
		NPC=SearchRangeNPC ( MainRia, 100 ) 
		for i=0,table.getn(NPC) do
			if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)==106850 then
				MainSoldier=NPC[i]
			end
		end
		SetModeEx( MainSoldier, EM_SetModeType_ShowRoleHead, False )--�����ۨ��Y�ۮ�
		local x, y, z, dir=DW_Location(MainSoldier)
		TempSoldier=CreateObj( 106850, x, y, z, dir, 1 )--�ЫسЫؾ԰��η��
		MoveToFlagEnabled( TempSoldier, false )--�����԰��η�Ȩ��޼@��
		WriteRoleValue( TempSoldier, EM_RoleValue_IsWalk, 0 ) --�]�w�԰��η�Ȳ��ʰʧ@���]�B
		SetFlag( TempSoldier, 544801, 1 )--�������_��
		AddToPartition( TempSoldier, 0 )--�N�԰��η�ȥ[�J����
		LockHP( TempSoldier, ReadRoleValue( TempSoldier, EM_RoleValue_MaxHP)*0.20, "" )--��w�԰��η�Ȧ�q
		SetModeEx( MainSoldier, EM_SetModeType_Show, false )--���å��ȥη��
		SetModeEx( TempSoldier, EM_SetModeType_Searchenemy, false )
		SetModeEx( TempSoldier, EM_SetModeType_Fight, false )
		SetModeEx( TempSoldier, EM_SetModeType_Strikback, false )
		SetModeEx( MainSoldier, EM_SetModeType_Mark, false )--�������ȥη�ȼаO
		SetModeEx( MainSoldier, EM_SetModeType_SearchenemyIgnore, true )--�������ȥη�ȥ@�ɷj�M
		CallPlot( MainSoldier, "Z24_Quest425623_01", MainSoldier, TempSoldier, MainRia )--�G�m�԰�����
		PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_COMBAT_1H )--���ԫ�
		CallPlot( TempSoldier, "Z24_Quest425623_02", MainSoldier, TempSoldier, MainRia )--�԰��η�ȼ@��01
	end
end
------------------------------------------------------------------------�G�m�԰�����
Function Z24_Quest425623_01(MainSoldier, TempSoldier, MainRia )
	local NPC={}--�ŧi�@��NPC�}�C
	NPC[1]=CreateObjByFlag( 113606, 781192, 8, 1 )--�Ыثº��D���_��
	NPC[2]=CreateObjByFlag( 107132, 781192, 4, 1 )--�Ыس��w�Ԥh
	NPC[3]=CreateObjByFlag( 107133, 781192, 5, 1 )--�Ыس��w�Ԥh
	NPC[4]=CreateObjByFlag( 107132, 781192, 6, 1 )--�Ыس��w�Ԥh
	NPC[5]=CreateObjByFlag( 107133, 781192, 7, 1 )--�Ыس��w�Ԥh
	for i=1, 5 do--�]�w������
		SetModeEx( NPC[i], EM_SetModeType_Mark, true )--��ܼаO
		SetModeEx( NPC[i], EM_SetModeType_Save, false )--���x�s
		SetModeEx( NPC[i], EM_SetModeType_Revive, false )--������
		SetModeEx( NPC[i], EM_SetModeType_Obstruct, false )--�L����
		SetModeEx( NPC[i], EM_SetModeType_Strikback, false )--������
		SetModeEx( NPC[i], EM_SetModeType_Fight, false )--���i���
		SetModeEx( NPC[i], EM_SetModeType_Gravity, true )--�����O
		SetModeEx( NPC[i], EM_SetModeType_Move, false )--���i����
		SetModeEx( NPC[i], EM_SetModeType_ShowRoleHead, true )--����Y��
		SetModeEx( NPC[i], EM_SetModeType_HideName, false )--��ܦW��
		SetModeEx( NPC[i], EM_SetModeType_NotShowHPMP, false )--��ܦ��
		SetFlag( NPC[i], 544801, 1 )--�������_��
		MoveToFlagEnabled( NPC[i], false )--�������޼@��
		WriteRoleValue( NPC[i], EM_RoleValue_IsWalk, 0 )--�]�w�]�B�ʧ@
		AddToPartition( NPC[i], 0 )--�N�º��D���_��&���w�Ԥh�[�J����
		WriteRoleValue( NPC[i], EM_RoleValue_Register1, NPC[1] )--�b�ĤH���W�g�J�º��D���_����GUID
		WriteRoleValue( NPC[i], EM_RoleValue_Register2, 0 )--�b�º��D���_��&�ĤH���W�g�J�ۨ��԰���t���A
		if ReadRoleValue( NPC[i], EM_RoleValue_OrgID)~=113606 then
			CallPlot( NPC[i], "Z24_Quest425623_MonsterMotion00", OwnerID() )--�O�Ĥ�NPC����D�]�ʧ@
		end
	end
	SetModeEx( NPC[1], EM_SetModeType_Searchenemy , false )--�º��D���_�����i����
	LockHP( NPC[1], ReadRoleValue( NPC[1], EM_RoleValue_MaxHP)*0.20, "" )--��w�º��D���_����q
	WriteRoleValue( NPC[1], EM_RoleValue_Register1, 4 )--�b�º��D���_�����W�g�J��e�ĤH�ƶq
	SetRoleEquip( NPC[1], EM_EQWearPos_MainHand, 212781, 1 )--�º��D���_���˳ƥD�Z��
	SetRoleEquip( NPC[1], EM_EQWearPos_SecondHand, 212779, 1 )--�º��D���_���˳ưƪZ��
	PlayMotionEX( NPC[1], ruFUSION_ACTORSTATE_DYING, ruFUSION_ACTORSTATE_DEAD )
	CallPlot( NPC[1], "Z24_NPC107214_00", MainSoldier, TempSoldier, MainRia )--�O�º��D���_�������ļƶq�P�_�ε����������ȱ���
End
------------------------------------------------------------------------�԰��η�ȼ@��01
Function Z24_Quest425623_02(MainSoldier, TempSoldier, MainRia )
	SetModeEx( TempSoldier, EM_SetModeType_Searchenemy , false )
	SetModeEx( TempSoldier, EM_SetModeType_Fight, false )
	SetModeEx( TempSoldier, EM_SetModeType_Strikback, false )
	sleep(15)	NpcSay( MainRia, "[SC_QUEST425623_00]" )--��զr��
	sleep(10)	LuaFunc_MoveToFlag( TempSoldier, 781192, 1, 0 )--�Ͼ԰��η�Ȳ��ʫ��w�X�l1
	sleep(05)	CastSpell( TempSoldier, TempSoldier, 850421 )
	sleep(40)	NpcSay( TempSoldier, "[SC_QUEST425623_01]" )--��զr��
	sleep(20)	NpcSay( TempSoldier, "[SC_QUEST425623_02]"  )--��զr��
	sleep(20)	LuaFunc_MoveToFlag( TempSoldier, 781192, 2, 0 )--�Ͼ԰��η�Ȳ��ʫ��w�X�l2
	sleep(10)	NpcSay( TempSoldier, "[SC_QUEST425623_03]" )--��զr��
	sleep(20)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	SetModeEx( TempSoldier, EM_SetModeType_Searchenemy, true )
	SetModeEx( TempSoldier, EM_SetModeType_Fight, true )
	SetModeEx( TempSoldier, EM_SetModeType_Strikback, true )
	sleep(20)	CallPlot( TempSoldier, "Z24_Quest425623_BeginCombat00", TempSoldier )--�Ұʥ���425623�԰��@��
	local time=0
	sleep(10)
	while 1 do
		if ReadRoleValue( TempSoldier, EM_RoleValue_AttackTargetID ) ~= 0 then
			PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
			CastSpell( TempSoldier, TempSoldier, 850421 )
		end
		time=rand(5)
		sleep(310+time*10)
	end
End
------------------------------------------------------------------------�º��D���_�������ļƶq�P�_�ε����������ȱ���
Function Z24_NPC107214_00(MainSoldier, TempSoldier, MainRia )
	local Will=OwnerID()
	local PlayerID={}
	local BuffPos=0
	local BuffLv=0
	local Num=0
	local Motion=0
	while 1 do--�C��Ū�X�s��º��D���_�����W���ĤH�ƶq
		Num=ReadRoleValue( Will, EM_RoleValue_Register1 )
		if num==0 then
			PlayerID=SearchRangePlayer( Will, 500 )
			if PlayerID~=0 then 
				for sn=0, table.getn(PlayerID), 1 do
					BuffPos=Lua_BuffPosSearch( PlayerID[sn], 623343 ) 
					BuffLv=BuffInfo( PlayerID[sn], BuffPos, EM_BuffInfoType_Power )
					if BuffLv>=2 and CheckAcceptQuest( PlayerID[sn], 425623 ) then
						SetScriptFlag( PlayerID[sn], 546513, 1 )--�����������ȱ���
						CancelBuff_NoEvent( PlayerID[sn], 623343 ) 
					end
				end
				SetStopAttack(TempSoldier)
				local x, y, z, dir=DW_Location(TempSoldier)
				PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_ANGRY )
				Sleep(20)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_HOLSTER )
				Sleep(05)	SetRoleEquip( TempSoldier, EM_EQWearPos_MainHand, 212076 , 1 )
					SetRoleEquip( TempSoldier, EM_EQWearPos_SecondHand, 212076 , 1 )
				Sleep(10) DelObj(TempSoldier)
				TempSoldier=CreateObj( 121467, x, y, z, dir, 1 )--�Ыؾ԰��η��
				MoveToFlagEnabled( TempSoldier, false )--�����԰��η�Ȩ��޼@��
				WriteRoleValue( TempSoldier, EM_RoleValue_IsWalk, 0 ) --�]�w�԰��η�Ȳ��ʰʧ@���]�B
				AddToPartition( TempSoldier, 0 )--�N�԰��η�ȥ[�J����
				CallPlot( TempSoldier, "Z24_Quest425623_03", MainSoldier, Will, PlayerID, MainRia )--��������ĤH����@��
				return
			end
		end
		sleep(10)
	end
end
------------------------------------------------------------------------�����ĤH����@��
Function Z24_Quest425623_03( MainSoldier, Will, PlayerID, MainRia )
	local TempSoldier=OwnerID()
	local NPC=0
	local Player=0
	Sleep(10)	LuaFunc_MoveToFlag( TempSoldier, 781192, 9, 0 )
	FaceFlag ( TempSoldier, 781192 , 8 ) AdjustDir( TempSoldier, 0 )
	Sleep(05)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_BEGIN )
		PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_LOOP )
	Sleep(20)	NpcSay( TempSoldier, "[SC_QUEST425623_04]" )
	Sleep(20)	DelObj(Will)
	NPC=SearchRangeNPC( TempSoldier, 200 ) 
	for j=0, table.getn(NPC) do
		if ReadRoleValue( NPC[j], EM_RoleValue_OrgID)==121468 then
			Will=NPC[j]
			SetModeEx( Will, EM_SetModeType_Mark, false )
		end
	end
	Sleep(5)
	for k=0, table.getn(PlayerID) do
		if PlayerID[k]~=nil then
			if CheckAcceptQuest( PlayerID[k], 425623 )==true and
			CheckScriptFlag( PlayerID[k], 546513 )==true then
				SetScriptFlag( PlayerID[k], 547186, 1 )--�����i��Client�º����n���~
				SetScriptFlag( PlayerID[k], 547188, 0 )
			end
		end
	end
	Sleep(20)	NpcSay( Will, "[SC_QUEST425623_05]" )
	Sleep(20)	AdjustFaceDir( Will, TempSoldier, 0 )
	Sleep(10)	PlayMotion( Will, ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(10)	NpcSay( Will, "[SC_QUEST425623_06]" )
	Sleep(30)	NpcSay( Will, "[SC_QUEST425623_07]" )
	PlayerID=SearchRangePlayer( OwnerID(), 150 )
		if PlayerID~=0 then
			for i=0, table.getn(PlayerID) do
				if CheckAcceptQuest( PlayerID[i], 425623 ) and
				CheckScriptFlag( PlayerID[i], 546513 ) then
					Player=PlayerID[i]
				end
			end
		end
	Sleep(40)	NpcSay( Will, "[SC_QUEST425623_08]" )
	Sleep(10)	NpcSay( Will, "[SC_QUEST425623_09]" )
	Sleep(10)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_CROUCH_END )
	Sleep(10)	PlayMotion( TempSoldier, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Sleep(10)	NpcSay( TempSoldier, "[SC_QUEST425623_10]" )--��զr��
	CallPlot( Will, "Z24_ResetNPC121114_00", MainSoldier, TempSoldier, Will, MainRia )--���m425623���ȥη��
	Sleep(10)	FaceFlag( Will, 781192 , 5 ) AdjustDir( Will, 0 )
	SetModeEx( Will, EM_SetModeType_Mark, true )
	Sleep(10) LuaFunc_MoveToFlag( TempSoldier, 781192, 1, 0 )
End
------------------------------------------------------------------------
Function Z24_Quest425623_04()
	SetScriptFlag( TargetID(), 547187, 1 )
End
------------------------------------------------------------------------���m425623���ȥη��
Function Z24_ResetNPC121114_00(MainSoldier, TempSoldier, Will, MainRia )
	Sleep(20)	SetDefIdleMotion( TempSoldier, ruFUSION_MIME_RUN_FORWARD )
	Sleep(05)	SetModeEx( MainSoldier, EM_SetModeType_Mark, true )--�}�ҥ��ȥη�ȼаO
	SetModeEx( MainSoldier, EM_SetModeType_ShowRoleHead, true )--�}�Ҧۨ��Y�ۮ�
	WriteRoleValue( MainRia, EM_RoleValue_Register1, 0 )--�Ұʼ@���}��
	SetModeEx( MainSoldier, EM_SetModeType_Show, true )--��ܥ��ȥη��
	SetModeEx( MainSoldier, EM_SetModeType_SearchenemyIgnore, false )--�}�ҥ��ȥη�ȷj�M
	DelObj(TempSoldier)
end
------------------------------------------------------------------------����425623�ĤH���`�@��
Function Z24_Quest425623_MonsterDead00()
	local Will=ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )--Ū�X�s��ۨ����º��D���_��GUID
	local num=ReadRoleValue( Will, EM_RoleValue_Register1 )--Ū�X�s��º��D���_�����W���ĤH�ƶq
	num=num-1--�p��{���ĤH�ƶq
	WriteRoleValue( Will, EM_RoleValue_Register1, num )--�N�{���ĤH�ƶq�g�^�º��D���_�����W
	local ListHate={}
	local HateID=0
	ListHate=HateListCount(OwnerID())--���o����C������ƶq
	if ListHate==0 then return
	else 	for sn=0, ListHate, 1 do
			HateID=HateListInfo(OwnerID(), sn, EM_HateListInfoType_GItemID)
			AddBuff( HateID, 623343, 0, -1 )--�����Ҧ��s�b��ĤH��������aBUFF�@���аO
		end
	end
End
------------------------------------------------------------------------����425623�ĤH�D�]�ʧ@
Function Z24_Quest425623_MonsterMotion00()
	if ReadRoleValue( OwnerID(), EM_RoleValue_OrgID)==107214 then return
	else	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_1H )
		local num=0
		local motion=0
		local time=0
		local mode=0
		while 1 do
			mode=ReadRoleValue( OwnerID(), EM_RoleValue_Register2 )
			if mode==1 then
				PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_1H ) return
			else	motion=Rand(5)
				time=Rand(2)+1
				if motion==0 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_COMBAT_2H ) end
				if motion==1 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H ) end
				if motion==2 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP01 ) end
				if motion==3 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02 ) end
				if motion==4 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 ) end
				sleep(15+time*10)
				num=num+1
			end
		end
	end
End
------------------------------------------------------------------------����425623�Ұʾ԰�
Function Z24_Quest425623_BeginCombat00()
	local NPC={}
	NPC=SearchRangeNPC ( OwnerID(), 200 )
	for sn=0, table.getn(NPC) do
		if ReadRoleValue( NPC[sn], EM_RoleValue_OrgID)==107132 or
		ReadRoleValue( NPC[sn], EM_RoleValue_OrgID)==107133 then
			ReadRoleValue( NPC[sn], EM_RoleValue_Register2 )
			WriteRoleValue( NPC[sn], EM_RoleValue_Register2, 1 )
			SetModeEx( NPC[sn], EM_SetModeType_Move, true )--�}�Ҳ���
			SetModeEx( NPC[sn], EM_SetModeType_Strikback, true )--�}�Ҥ���
			SetModeEx( NPC[sn], EM_SetModeType_Fight, true )--�}�Ҭ��
			SetAttack( NPC[sn], OwnerID() )
			CastSpell( OwnerID(), NPC[sn], 850506 )
		end
	end
end
------------------------------------------------------------------------
Function Z24_NPC121190_01()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425624 )==true then
		DW_QietKillOne( OwnerID(), 107128 )
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z24_Q425624Client_00()
	local Player=TargetID()
	SetScriptFlag( Player, 547186, 0 )
	SetScriptFlag( Player, 547187, 0 )
End
------------------------------------------------------------------------
Function Z24_Buff623342_Check00()
	if CheckAcceptQuest( TargetID(), 425623 )==true or
	ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106850 then
		return true
	else	return false
	end
End
Function Z24_Buff623342_Check01()
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106850 then
		return true
	else	return false
	end
End
------------------------------------------------------------------------