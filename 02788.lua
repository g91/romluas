----------------------------------------------------------------------------
--↓小女孩的出生劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlBorn()
	SetDefIdleMotion (OwnerID() , ruFUSION_MIME_IDLE_DEAD) --改以死亡動作替代idle
end
----------------------------------------------------------------------------
-- ↓倒地小女孩的對話劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local Quest = 425786 --任務：點火堆的小女孩
	local KeyItem = 547198 --拯救小女孩
	local TalkString = { "[SC_425786_01]" }
	
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player , Quest ) == true and CheckScriptFlag( Player , KeyItem ) == false then
		AddSpeakOption( Player , NPC , TalkString[1] , "YoYo_WarmWinter_GirlTalkSelect" , 0 )
	end
	
end
----------------------------------------------------------------------------
-- ↓倒地小女孩的對話劇情：選項
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalkSelect()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local KeyItem = 547198 --拯救小女孩
	local TalkString = { "[SC_425786_02]" , "[SC_425786_03]" , "[SC_425786_04]" , "[SC_425786_05]" }
	local Desire = DW_Rand(3) --隨機願望三選一
	--DebugMsg( 0 , 0 , "Rand = "..Desire )
	
	local DesireObjID = { 121623 , 121624 , 121625 , 121626 } --溫暖的磚爐、豐盛的大餐、暖冬的禮物、已逝世的奶奶
	local DesireItemID = { 242044 , 242045 , 242046 , 242047 } --溫暖的願望、飽足的願望、快樂的願望、親情的願望
	local FireID = 121647 --小芯的火堆
	
	CloseSpeak(Player) --關閉對話介面
	
	if CheckScriptFlag( Player , 547199 ) == true then --判斷最終願望的旗標是否有開啟
		Desire = 4
	end

	--NPC的坐標
	local NpcX = ReadRoleValue( NPC , EM_RoleValue_X )
	local NpcY= ReadRoleValue( NPC , EM_RoleValue_Y )
	local NpcZ = ReadRoleValue( NPC , EM_RoleValue_Z )
	local RanNum = math.random(360) --隨機角度

	--物件的距離與坐標
	local NpcDistance = 30 --物件與NPC間的距離
	local ObjX = NpcX - NpcDistance * math.cos( math.pi / 180 * RanNum )
	local ObjZ = NpcZ + NpcDistance * math.sin( math.pi / 180 * RanNum )
	local ObjY = GetHeight( ObjX , NpcY , ObjZ )
	local FireDistance = 10 --火堆與NPC間的距離
	local FireX = NpcX - FireDistance * math.cos( math.pi / 180 * RanNum )
	local FireZ = NpcZ + FireDistance * math.sin( math.pi / 180 * RanNum )
	local FireY = GetHeight( FireX , NpcY , FireZ )

	local DesireObj = CreateObj( DesireObjID[Desire] , ObjX , ObjY , ObjZ , 0 , 1 ) --願望物件
	SetModeEx( DesireObj , EM_SetModeType_Mark , false ) --不可點選
	SetModeEx( DesireObj , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( DesireObj , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
	SetModeEx( DesireObj , EM_SetModeType_Strikback , false ) --不會反擊
	SetModeEx( DesireObj , EM_SetModeType_Move , false ) --不會移動
	SetModeEx( DesireObj , EM_SetModeType_Fight , false ) --不可攻擊
	SetModeEx( DesireObj , EM_SetModeType_Searchenemy , false ) --不會索敵
	SetModeEx( DesireObj , EM_SetModeType_Obstruct , false ) --無阻擋效果
	AdjustFaceDir( DesireObj , NPC , 0 )
	AddToPartition( DesireObj , RoomID )
	
	local FireObj = CreateObj( FireID , FireX , FireY , FireZ , 0 , 1 ) --火堆
	SetModeEx( FireObj , EM_SetModeType_Mark , false ) --不可點選
	SetModeEx( FireObj , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( FireObj , EM_SetModeType_NotShowHPMP , false ) --不顯示血條
	SetModeEx( FireObj , EM_SetModeType_Strikback , false ) --不會反擊
	SetModeEx( FireObj , EM_SetModeType_Move , false ) --不會移動
	SetModeEx( FireObj , EM_SetModeType_Fight , false ) --不可攻擊
	SetModeEx( FireObj , EM_SetModeType_Searchenemy , false ) --不會索敵
	SetModeEx( FireObj , EM_SetModeType_Obstruct , false ) --無阻擋效果
	AdjustFaceDir( FireObj , NPC , 0 )
	AddToPartition( FireObj , RoomID )
	
	SetFlag( Player , KeyItem , 1 ) --開完成任務旗標
	GiveBodyItem( Player , DesireItemID[Desire] , 1 ) --給道具
	
	local ConditionItem = 242070 --檢查玩家放棄任務的條件道具
	GiveBodyItem( Player , ConditionItem , 1 ) --給予條件道具

	AdjustFaceDir( Global_YoYo_Z358_GirlGetUp , DesireObj , 0 ) --讓站立的小女孩面向願望物件
	Callplot( Global_YoYo_Z358_GirlGetUp , "YoYo_WarmWinter_GirlGetUpPerform" , TalkString[Desire] , Desire , DesireObj )
	CallPlot( NPC , "YoYo_WarmWinter_GirlTalkEnd" , DesireObj , FireObj )
end
----------------------------------------------------------------------------
-- ↓倒地小女孩的對話劇情：關閉物件
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlTalkEnd( DesireObj , FireObj )
	Sleep(100) --物件存在的時間
	local NPC =  OwnerID()
	local DesireObjID = { 121623 , 121624 , 121625 , 121626 , 121647 } --溫暖的磚爐、豐盛的大餐、暖冬的禮物、已逝世的奶奶、小芯的火堆
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
--↓起身小女孩的出生劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpBorn()
	Global_YoYo_Z358_GirlGetUp = OwnerID()
end
----------------------------------------------------------------------------
-- ↓倒地小女孩的對話劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local KeyItem2 = 547199 --小女孩真正的願望
	local TalkString = { "[SC_425786_06]" }
	
	if CheckScriptFlag( Player , KeyItem2 ) == true then
		SetSpeakDetail( Player , TalkString[1] )
	else
		LoadQuestOption(Player)
	end
end
----------------------------------------------------------------------------
--↓起身小女孩的表演劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_GirlGetUpPerform( GirlTalk , Desire , DesireObj )
	local NPC = OwnerID()
	local EffectID = 850487 --小女孩復活特效
	local GrandmomTalk = { "[SC_425786_07]" , "[SC_425786_08]" }
	SysCastSpellLv( NPC , NPC , EffectID , 1 ) --放復活特效
	PlayMotion( NPC , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --表演動作
	Sleep(10)
	NPCSay( NPC , GirlTalk ) --小女孩願望實現說話
	Sleep(20)
	if Desire == 4 then --若是願望4，則撥放奶奶對話劇情
		NPCSay( DesireObj , GrandmomTalk[1] ) --奶奶說話
		Sleep(20)
		NPCSay( NPC , GrandmomTalk[2] ) --小女孩說話
	end
end
----------------------------------------------------------------------------
--↓任務：點火堆的小女孩，完成任務時的劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_Complete425786()
	local Player = TargetID() --完成任務的玩家
	local QuestFlag1 = 547197 --可以接任務1的旗標
	local QuestFlag2 = 547278 --可以接任務2的旗標
	local DesireItem1 = 242044 --願望物品1
	local DesireItem2 = 242045 --願望物品2
	local DesireItem3 = 242046 --願望物品3
	local FullKeyItem = 547328 --全勤獎旗標
	
	SetScriptFlag( Player , QuestFlag1 , 0 ) --假如蒐集滿3種願望物件，則給予任務2的旗標
	if CountBodyItem( Player , DesireItem1 ) > 0 and CountBodyItem( Player , DesireItem2 ) > 0 and CountBodyItem( Player , DesireItem3 ) > 0 then
		SetScriptFlag( Player , QuestFlag2 , 1 )
	end
	SetScriptFlag( Player , FullKeyItem , 1 )
	
	 DesignLog( Player , 121597 , "Complete" ) --完成任務1的Log紀錄
	
end
----------------------------------------------------------------------------
--↓物品：刪除拯救小女孩的紀錄物品時的劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_DelItem242070()
	local Player = OwnerID() --完成任務的玩家
	local QuestID = 425786
	local DesireItem1 = 242044
	local DesireItem2 = 242045
	local DesireItem3 = 242046
	
	if CheckAcceptQuest( Player , QuestID ) == false then --檢查身上是否有此任務
		DelBodyItem( Player , DesireItem1 , 1 )
		DelBodyItem( Player , DesireItem2 , 1 )
		DelBodyItem( Player , DesireItem3 , 1 )
	end
end
----------------------------------------------------------------------------
--↓任務：小女孩的願望，完成任務時的劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_Complete425790()
	local Player = TargetID() --完成任務的玩家
	local QuestFlag2 = 547278 --可以接任務2的旗標
	SetScriptFlag( Player , QuestFlag2 , 0 )
	
	DesignLog( Player , 1215971 , "Complete" ) --完成任務2的Log紀錄
	
end
----------------------------------------------------------------------------
-- ↓聖尼‧古拉的對話劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausTalk()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local Quest = 425790 --任務：小女孩的願望
	local KeyItem2 = 547199 --蒐集小女孩的願望
	local KeyItem3 = 547200 --了解小女孩真正的願望
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
-- ↓聖尼‧古拉的對話劇情：選項1
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausSelect1()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local KeyItem2 = 547199 --蒐集小女孩的願望
	local TalkString = { "[SC_425790_03]" , "[SC_425790_05]" }
	local DesireItemID = { 242044 , 242045 , 242046 , 242047 } --溫暖的願望、飽足的願望、快樂的願望、親情的願望
	
	if CountBodyItem( Player , DesireItemID[1] ) >= 1 
	and CountBodyItem( Player , DesireItemID[2] ) >= 1 
	and CountBodyItem( Player , DesireItemID[3] ) >= 1 then
		SetSpeakDetail( Player , TalkString[2] ) --說明條件已滿足
		SetFlag( Player , KeyItem2 , 1 )
		DelBodyItem( Player , DesireItemID[1] , 1 )
		DelBodyItem( Player , DesireItemID[2] , 1 )
		DelBodyItem( Player , DesireItemID[3] , 1 )
	else
		SetSpeakDetail( Player , TalkString[1] ) --說明條件未滿足
	end
end
----------------------------------------------------------------------------
-- ↓聖尼‧古拉的對話劇情：選項2
----------------------------------------------------------------------------
function YoYo_WarmWinter_SantaClausSelect2()
	local Player =  OwnerID()
	local NPC =  TargetID()
	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local DesireItemID = 242047 --親情的願望
	local KeyItem3 = 547200 --了解小女孩真正的願望
	local TalkString = { "[SC_425790_04]" , "[SC_425790_06]" }
	
	if CountBodyItem( Player , DesireItemID ) >= 1 then
		SetSpeakDetail( Player , TalkString[2] ) --說明條件未滿足
		SetFlag( Player , KeyItem3 , 1 )
		DelBodyItem( Player , DesireItemID , 1 )
	else
		SetSpeakDetail( Player , TalkString[1] ) --說明條件未滿足
	end
end
----------------------------------------------------------------------------
-- ↓願望火堆的出生劇情
----------------------------------------------------------------------------
function YoYo_WarmWinter_FireBorn()
	local FireObj = OwnerID()
	local WarmBuff = 507088
	AddBuff( FireObj , WarmBuff , 1 , -1 )
end
----------------------------------------------------------------------------
-- ↓測試用指令：重置YoYo的暖冬節所有旗標與任務狀態
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