------------------------------------------------------------------------凝能結晶使用動作
function Z23_Item241322_00()
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
End
------------------------------------------------------------------------凝能結晶使用結果
function Z23_Item241322_01()
	if CheckFlag( OwnerID(), 546289 )==False then
		UseItemDestroy()
		local Num=Rand(5)
		if Num<=2 then
			local QuestID=Rand(7)+1
			if QuestID==1 then 
				Z23_HeroSoul_00(425416)--希望的記憶
				return True
			end
			if QuestID==2 then
				Z23_HeroSoul_00(425417)--勇氣的記憶
				return True
			end
			if QuestID==3 then
				Z23_HeroSoul_00(425418)--正義的記憶
				return True
			end
			if QuestID==4 then
				Z23_HeroSoul_00(425419)--智慧的記憶
				return True
			end
			if QuestID==5 then
				Z23_HeroSoul_00(425420)--慈愛的記憶
				return True
			end
			if QuestID==6 then
				Z23_HeroSoul_00(425508)--寬容的記憶
				return True
			end
			if QuestID==7 then
				Z23_HeroSoul_00(425509)--忠誠的記憶
				return True
			end
		else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_241322_03]",C_SYSTEM )--你使用了[241322]，卻什麼事也沒發生！
		return False
		end
	else ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_241322_02]", 0 )--你已取得相關任務，暫時無法使用！
	return False
	end
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
end
------------------------------------------------------------------------
function Z23_HerosSoul_00()--英雄靈魂初始劇情
	AddBuff ( OwnerID(),621848,1,-1)
	AddBuff ( OwnerID(),622264,1,-1)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
	SetPlot( OwnerID(),"touch","Z23_CastingSoul_00",30 )
End
------------------------------------------------------------------------
function Z23_CastingSoul_00()--英雄靈魂觸碰劇情
	if ReadRoleValue( TargetID(), EM_RoleValue_Register1)==0 then
		CallPlot(TargetID(), "Z23_CastingDefence_00",TargetID())
		CastSpell( OwnerID(),TargetID(),850317)
	else Return
	end
end
------------------------------------------------------------------------
function Z23_CastingDefence_00()--防止重複執行法術
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 1 )
	Sleep(20)
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1 , 0 )
end
------------------------------------------------------------------------
function Z23_Skills850317_00()--法術850317使用檢查及結果
	local Num=0
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==120271 and--卡貝斯特．卡薩姆
	CheckAcceptQuest( OwnerID(), 425416)==True then--希望的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850327)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121019 and--李貝留斯．安卓斯
	CheckAcceptQuest( OwnerID(), 425417)==True then--勇氣的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850328)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121020 and--平克．蓋伊
	CheckAcceptQuest( OwnerID(), 425418)==True then--正義的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850329)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121021 and--菈芬蒂兒．阿貝格
	CheckAcceptQuest( OwnerID(), 425419)==True then--智慧的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850330)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121022 and--蕾法蒂婭．塔克爾
	CheckAcceptQuest( OwnerID(), 425420)==True then--慈愛的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850331)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121023 and--阿夫南．巴爾德
	CheckAcceptQuest( OwnerID(), 425508)==True then--寬容的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850332)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
			Num=Num+1
		end
	end
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID)==121024 and--蘇克埃．依羅
	CheckAcceptQuest( OwnerID(), 425509)==True then--忠誠的記憶
		if CheckFlag(OwnerID(),546724 )==False then
			CastSpell( TargetID(),OwnerID(),850333)
			CallPlot(TargetID(), "Z23_HEROSOULSPEAKS_00",TargetID())
			GiveBodyItem( OwnerID(), 546724, 1 )--給予喚醒古代英雄的記憶
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
function Z23_HeroSoul_00(QuestID) --修改自DW_Border()
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
	--local str = "["..GetUseItemGUID(Obj).."]"--取出物件名稱
	ClearBorder( Obj)--初始化石碑介面
	AddBorderPage( Obj, GetQuestDetail(QuestID,1))--石碑內容
	ShowBorder( Obj, QuestID,"[SC_Z23HEROSOULSPEAKS_06]","ScriptBorder_Texture_Paper" )--石碑標題
end
------------------------------------------------------------------------
function TempControlNpcSetting_00()
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )--不顯示
	SetModeEx( OwnerID(), EM_SetModeType_Searchenemy , false )--不索敵
	SetModeEx( OwnerID(), EM_SetModeType_Save , false )--不儲存
	SetModeEx( OwnerID(), EM_SetModeType_Revive , false )--不重生
	SetModeEx( OwnerID(), EM_SetModeType_Obstruct , false )--不阻擋
	SetModeEx( OwnerID(), EM_SetModeType_Strikback , false ) --不反擊
	SetModeEx( OwnerID(), EM_SetModeType_Fight , false )--不可砍殺
	SetModeEx( OwnerID(), EM_SetModeType_Gravity , true )--有重力	
	SetModeEx( OwnerID(), EM_SetModeType_Move , false )--不移動
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead , false )--無頭像框
	SetModeEx( OwnerID(), EM_SetModeType_HideName , true)--無名稱顯示
	SetModeEx( OwnerID(), EM_SetModeType_SearchenemyIgnore , true )--不會被搜尋
	SetModeEx( OwnerID(), EM_SetModeType_Mark , false )--不標記
	SetModeEx( OwnerID(), EM_SetModeType_NotShowHPMP, true )--不顯示血條
end
------------------------------------------------------------------------