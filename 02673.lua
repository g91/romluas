------------------------------------------------------------------------
function William_NPCEmotion_Z23()--改造戰士巡邏隨機動作
	local  RandID=rand(2)+1
	if RandID==1 then local  EmotID=rand(4)+1
		if EmotID==1 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE0,ruFUSION_ACTORSTATE_EMOTE_IDLE0) end
		if EmotID==2 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE1,ruFUSION_ACTORSTATE_EMOTE_IDLE1) end
		if EmotID==3 then PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_IDLE2,ruFUSION_ACTORSTATE_EMOTE_IDLE2) end
		if EmotID==4 then PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED) end
	end
end
------------------------------------------------------------------------
function William_NPCAnger_Z23()--聯盟戰士群體嘲諷
	CastSpell( OwnerID(), OwnerID(), 499256)
end
------------------------------------------------------------------------
Function Z23_Smoke_01()--戰場硝煙
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
Function Z23_Smoke_02()--戰場硝煙
	AddBuff ( OwnerID(), 622119 , 1, -1 )
End
------------------------------------------------------------------------
Function Z23_NPC120736_01()--與波莉塔．梅斯對話
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241607 )>0 then
			if CheckFlag( OwnerID(), 546298 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241607, 1 )
				GiveBodyItem( OwnerID(), 546298, 1 )--完成醫療補給
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	end
End
------------------------------------------------------------------------
Function Z23_NPC120281_01()--與艾爾文．柏格對話
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241608 )>0 then
			if CheckFlag( OwnerID(), 546710 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241608, 1 )
				GiveBodyItem( OwnerID(), 546710, 1 )--完成研究補給
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
				GiveBodyItem( OwnerID(), 546297, 1 )--將不明能量交給艾爾文．柏格
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	else LoadQuestOption( OwnerID() )
	end
End
------------------------------------------------------------------------
Function Z23_NPC120722_01()--與羅恩．特蘭索對話
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID(), 425402 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425590 )==TRUE or
	CheckAcceptQuest( OwnerID(), 425609 )==TRUE then
		if CountBodyItem( OwnerID(), 241609 )>0 then
			if CheckFlag( OwnerID(), 546711 )==False then
				CallPlot( TargetID(), "Z23_Quest425402_00",TargetID())
				DelBodyItem( OwnerID(), 241609, 1 )
				GiveBodyItem( OwnerID(), 546711, 1 )--完成野戰補給
			else LoadQuestOption( OwnerID() )
			end
		else LoadQuestOption( OwnerID() )
		end
	end	
End
------------------------------------------------------------------------
Function Z23_Quest425402_00()--切換NPC對白狀態
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, False )
	Sleep(10)
	Npcsay( OwnerID(),"[SC_116838_35]")
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, True )	
End
------------------------------------------------------------------------
Function Z23_NPC106615_00()--聯盟戰士隨機負面狀態
	while 1 do
		if CheckBuff( OwnerID(), 622877)==False then
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )==1 then
				local Num=Rand(3)+1
				if Num==1 then
					AddBuff ( OwnerID(), 622872, 0, 10 )--出血
				End
				if Num==2 then
					AddBuff ( OwnerID(), 622873, 0, 10 )--虛弱
				End
				if Num==3 then
					AddBuff ( OwnerID(), 622874, 0, 60 )--中毒
				End
			else AddBuff ( OwnerID(), 622873, 0, -1 )--虛弱
			End
		End
	Sleep(30)
	End
End
------------------------------------------------------------------------
Function Z23_Item241282_00()--綜合醫療箱使用判斷
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
				else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--使用目標錯誤！
				end
			else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--使用目標錯誤！
			return False
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421249_3]", 0 )--使用的對象必須在非戰鬥狀態！
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424086_8]", 0 )--你的距離太遠，請再靠近一點！
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241282_01(Player,Warrior)--綜合醫療箱使用結果
	UseItemDestroy()
	DW_QietKillOne( Player, 106808 )
		if Checkbuff(Warrior, 622872 )==True then
			CancelBuff(Warrior, 622872 )
		elseif Checkbuff(Warrior, 622873 )==True then
			CancelBuff(Warrior, 622873 )
		elseif Checkbuff(Warrior, 622874 )==True then
			CancelBuff(Warrior, 622874 )
		end
	AddBuff (Warrior, 622877, 0, 30 )--暫時抗性
	npcsay(Warrior,"[SC_RESCUE_STRING_NPC02]")
End
------------------------------------------------------------------------
Function Z23_Item241281_00()--特殊藥劑使用檢查
	if GetDistance( OwnerID(), TargetID() ) <26 then
		if ReadRoleValue( TargetID(), EM_RoleValue_IsAttackMode )==0 then
			if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106615 or
		 	ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106616 or
 			ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==106676 then
				if Checkbuff(TargetID(), 622874 )==True then
					CallPlot( OwnerID(), "Z23_Item241281_01", OwnerID(),TargetID())
				else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--使用目標錯誤！
				return False
				end
			else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--使用目標錯誤！
			return False
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_421249_3]", 0 )--使用的對象必須在非戰鬥狀態！
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424086_8]", 0 )--你的距離太遠，請再靠近一點！
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241281_01(Player,Warrior)--特殊藥劑使用結果
	if Checkbuff(Warrior, 622874)==True then
		UseItemDestroy()
		CancelBuff(Warrior, 622874)
		DW_QietKillOne( Player, 106619 )
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_424142_1]", 0 )--使用目標錯誤！
	return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241278_Checking()----使用特殊炸藥前檢查
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
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_113120_MALA2_61]", 0 )--目標不在作用範圍內。
		return False
	end
End
------------------------------------------------------------------------
Function Z23_Item241278_00()--特殊炸藥使用結果
	local X=ReadRoleValue(OwnerID(),EM_RoleValue_X)
	local Y=ReadRoleValue(OwnerID(),EM_RoleValue_Y)
	local Z=ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	local Bomb=CreateObj(120767, X, Y-5, Z, 0, 1)--產生特殊炸藥
	SetModeEx( Bomb, EM_SetModeType_Gravity, false )--重力
	AddToPartition( Bomb, 0 )
	CallPlot(Bomb, "Z23_Item241278_Exploding",OwnerID(),Bomb)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
	UseItemDestroy()
	DW_QietKillOne( OwnerID(), 106807 )
End
------------------------------------------------------------------------
function Z23_Item241278_Exploding(Player,Bomb)--特殊炸藥爆炸劇情
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
function Z23_NPC120766_00()--不明能量初始
	AddBuff ( OwnerID(), 622893, 0, -1 )
End
------------------------------------------------------------------------
Function Z23_NPC120825RECHECK_00()--2012/12/26新增byWilliam
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