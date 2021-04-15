--任務 426693  打聲招呼
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

--任務426694 有意思的藥
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
--趕走法蘭克
function LuaEvent_OnDead_426695()
	DW_QietKillOne( TargetID(),108391)
	return true
end
--任務426697，洛德與他的城寨
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
--任務426698 提醒紅衣
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
--矮獵手的復仇
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
--卡卡洛奇
--function szLuaScript_123186()
--	LoadQuestOption(OwnerID())
--	if szLuaScript_QuestTalk(426707,548664) then
--		SetFlag(OwnerID(),548664,1)
--	end
--end
--菲格先生
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
--唐納德
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

--為一個願望，與威爾對話
function szLuaScript_123181()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426701) and CheckFlag(OwnerID(),548664)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423177_0]","readyToQuest_426701",0)	--我準備好了
	end
end
--任務：為一個願望
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
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--表演正在進行中，請稍候…
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426701_2",obj )
		end
end
--關對話，種obj播表演
function readyToQuest_426701_2(O_ID)
	local QuestID = 426701			--任務編號
	local FinishFlagID = 548664			--完成任務獲得的旗標
	local CheckBuffID = 621881			--檢查是否正在演戲的BUFF
	local CheckRange = 150			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 123190, 780867, 1, 1 )	--表演用威爾
		ActorArray[2] =CreateObjByFlag( 123182, 780867, 2, 1 )	--表演用紅衣女子
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			moveToFlagEnabled( ActorArray[1], false )
			moveToFlagEnabled( ActorArray[2], false )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)

	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--表演開始
	--範圍看戲用的檢查函式
			Sleep(10)
			Say(ActorArray[1],"[SC_426701_1]" )	--很多人都說最終祕寶並不存在…
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_2]" )	--祕寶是存在的。正因如此，我才更要證明這一點。
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			Sleep(30)
			Say(ActorArray[1],"[SC_426701_3]" )	--為什麼妳會如此執著於祕寶……
			Sleep(30)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[1],"[SC_426701_4]" )	--妳有什麼願望想要完成嗎？
			Sleep(10)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
			Sleep(30)
			Say(ActorArray[2],"[SC_426701_5]" )	--我有告訴你的必要嗎？
			Sleep(30)
			Say(ActorArray[1],"[SC_426701_6]" )	--不……我無意探詢妳的私事。
			Sleep(20)	
			Say(ActorArray[2],"[SC_426701_7]" )	--跟你說笑的，別這麼認真。
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_8]" )	--若要說是有什麼心願，倒也沒什麼了不起。
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_9]" )	--母親很小的時候就離我而去。
			Sleep(20)
			Sleep(20)
			Say(ActorArray[2],"[SC_426701_10]" )	--她曾對我說過一些事…我必須透過這個願望來確認，如此而已。
			Sleep(30)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end

--追上紅衣，與威爾對話
function szLuaScript_123187()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),426707) and CheckFlag(OwnerID(),548787)==false then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423177_0]","readyToQuest_426707",0)	--我準備好了
	end
end
--任務：追上紅衣
function readyToQuest_426707()
	CloseSpeak( OwnerID() )
	local testObj = 116858	--測試蛋
	local tmpObj = SearchRangeNPC( TargetID(),50 )
	local tmpNum = 0
		for i=0,#tmpObj,1 do
			if ReadRoleValue( tmpObj[i],EM_RoleValue_OrgID )==testObj then
				tmpNum = tmpNum + 1
			end
		end
		if tmpNum>=1 then
			ScriptMessage( OwnerID(),OwnerID(),3,"[SC_424528_3]",0)	--表演正在進行中，請稍候…
		else
			local x,y,z,dir = DW_Location( TargetID() )
			local obj = CreateObj( testObj,x,y,z,dir,1 )
				SetModeEx( obj, EM_SetModeType_Show, false )
				SetModeEx( obj, EM_SetModeType_Mark, false )
				AddToPartition( obj, 0 )
				CallPlot( obj,"readyToQuest_426707_2",obj )
		end
end
--關對話，種obj播表演
function readyToQuest_426707_2(O_ID)
	local QuestID = 426707			--任務編號
	local FinishFlagID = 548787			--完成任務獲得的旗標
	local CheckBuffID = 621881			--檢查是否正在演戲的BUFF
	local CheckRange = 150			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObjByFlag( 123192, 780867, 3, 1 )	--表演用卡卡洛奇
		ActorArray[2] =CreateObjByFlag( 123191, 780867, 4, 1 )	--表演用紅衣女子
		ActorArray[3] =CreateObjByFlag( 123190, 780867, 5, 1 )	--表演用
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

	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--表演開始
	--範圍看戲用的檢查函式
			Sleep(10)
			Say(ActorArray[2],"[SC_426707_01]" )	--告訴我為什麼…卡卡洛奇……
			Sleep(20)
			Say(ActorArray[2],"[SC_426707_02]" )	--我視你如同父親
			--PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_03]" )	--這些就是陪妳找到[243011]的人嗎？……
			Sleep(30)
			--PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_CRAFTING_END)
			Say(ActorArray[1],"[SC_426707_04]" )	--勸勸你們，別
			Sleep(40)
			PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_ANGRY)
			Sleep(20)
			Say(ActorArray[2],"[SC_426707_05]" )	--這與他們無關！回答我的問題！！
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_06]" )	--我當然會告訴妳，但是妳要把我的話聽進去…
			Sleep(30)	
			Say(ActorArray[1],"[SC_426707_07]" )	--我要妳別再找尋基德寶藏了
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_08]" )	--就算真的有能實現願望的力量，妳也一定得付出相對應的東西。
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_09]" )	--我測試過了…那些部件放在身上
			Sleep(40)
			Say(ActorArray[1],"[SC_426707_10]" )	--這是不對的，為了知曉過去，想要復活什麼…
			Sleep(30)
			Say(ActorArray[2],"[SC_426707_11]" )	--住口，我叫你住口！什麼影響…那是不可能的…
			Sleep(30)
			Say(ActorArray[1],"[SC_426707_12]" )	--聽我的話，別再追這個祕寶了。
			Sleep(30)
			Say(ActorArray[2],"[SC_426707_13]" )	--沒有人能阻止我，就算是你也不行…
			Sleep(30)
			Say(ActorArray[3],"[SC_426707_14]" )	--現在情況不穩定。不論如何，我們先離開吧。
			Sleep(30)
			
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end

