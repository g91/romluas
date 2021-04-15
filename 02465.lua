function LuaS_Z21_SaceMonderDead_SetSpeak()--賽西蒙德之死
	local T_ID = TargetID() --賽西蒙德(A1)
	local O_ID = OwnerID() --玩家
	local QuestID = 424065				--任務編號
	
	if CheckAcceptQuest( O_ID, QuestID ) == true and ReadRoleValue( T_ID, EM_RoleValue_Register1 ) > 0 then --檢查玩家是否有任務 並且現在是否正在演戲
		SetSpeakDetail( O_ID, "[SC_424065_A]" ) --請稍等我一下。   (正在演戲情況下 給予告知)
	elseif CheckAcceptQuest( O_ID, QuestID ) == true and CheckFlag(O_ID,545512)==false then
		SetSpeakDetail( O_ID, "[SC_424065_B]" ) --你準備好了嗎？ (可以演戲情況下 給予告知)
		AddSpeakOption( O_ID, T_ID, "[SC_424065_C]", "LuaS_Z21_SaceMonderDead",0) --我準備好了。 (玩家確定要開始演戲)
	else
		LoadQuestOption( O_ID )
	end
end

function LuaS_Z21_SaceMonderDead()--開始演
	local T_ID = TargetID() --賽西蒙德(A1)
	local O_ID = OwnerID() --玩家
	CloseSpeak( OwnerID() )--關閉對話視窗
	ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_424065_D]", "0xffffff80" )
	WriteRoleValue( T_ID, EM_RoleValue_Register1, 1 )--上鎖 表示正在演戲
	BeginPlot( T_ID, "LuaS_Z21_SaceMonderDead_Start", 0 )--執行演戲
end

function LuaS_Z21_SaceMonderDead_Start()--開始演
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local O_ID = OwnerID()				--掛在NPC身上的演戲劇情
	local QuestID = 424065				--任務編號
	local FinishFlagID = 545512			--完成任務獲得的旗標
	local CheckBuffID = 620674			--檢查是否正在演戲的BUFF
	local CheckRange = 250			--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local player = {};				--符合條件玩家
	local FlagID = 781004				--旗標ID
	-- 事先把所有會用到的演原產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 119167, FlagID, 1, 1 ) --賽西蒙德(A2)
	ActorArray[2] = CreateObjByFlag( 119165, FlagID, 2, 1 ) --洛迦恩斯(B2)
	local allplayer = SearchRangePlayer ( O_ID , CheckRange )	
	for i=0, table.getn(allplayer)-1 do--符合條件 給予演戲用Buff
		
		--	Say(allplayer[i],"123456789")
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			table.insert( player, allplayer[i] )
		--	SetPosByFlag( allplayer[i] , FlagID , 0 );
		--	Say(allplayer[i],"987654321")
		end
	end

	CallPlot( OwnerID(), "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式
	sleep(10)
	
	--演戲中
	AddToPartition( ActorArray[1], 0 );
	NPCSay( ActorArray[1], "[SC_Z21_424595_1]")--賽西蒙德(A2)說：幽寧谷.......之前來到這裡時，完全沒注意到這是屬於真龍的力量。
	Sleep(25)
	AddToPartition( ActorArray[2], 0 )
	NPCSay( ActorArray[1], "[SC_Z21_424595_2]")--賽西蒙德(A2)：原來這股力量來自於真龍，難怪…
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_3]")--洛迦恩斯(B2)：我已經警告過你了！
	PlayMotion( ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_4]")--賽西蒙德(A2)：先別急！在殺死我之前，我猜你會對元素領主的訊息有興趣。
	PlayMotion(ActorArray[1] ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_5]")--洛迦恩斯(B2)：你的目的是什麼？
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_6]")--賽西蒙德(A2)：我這等層級的法師，怎能死在這些凡人手上？我只求光榮的死在偉大的龍息之下。
	PlayMotion(ActorArray[1] ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	Sleep(25)
	ChangeObjID(ActorArray[2],119166);
	ScriptMessage( ActorArray[1], 0, 1 , "[SC_Z21_424595_7]", "0xffffff80" )--中央訊息：（洛迦恩斯變成龍形）
	ScriptMessage( ActorArray[1], 0, 0 , "[SC_Z21_424595_7]", "0xffffff80" )--中央訊息：（洛迦恩斯變成龍形）
	Sleep(25)
	NPCSay( ActorArray[2], "[SC_Z21_424595_8]")--洛迦恩斯(B1)：行！說出你知道的一切！
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_9]")--賽西蒙德(A2)：我想你們應該還沒忘記曼索瑞恩吧！他現在正在往元素王座的路上，希望你們來得及阻止他釋放元素領主。
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Sleep(25)
	NPCSay( ActorArray[1], "[SC_Z21_424595_10]")--賽西蒙德(A2)：現在…...讓我見識一下偉大的龍息吧！
	PlayMotion( ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_VICTORY )
	Sleep(25)
	--玩家上保護盾5秒
	for i,v in ipairs(player) do
		if	CheckID(v) == true and  
			CheckAcceptQuest( v, QuestID ) == true and 
			CheckBuff( v, CheckBuffID ) == true and 
			GetDistance( v, ActorArray[1] ) < 200 and 
			CheckFlag( v, FinishFlagID ) ~= true then 
			ScriptMessage( v, v, 1 , "[SC_Z21_424595_12]", "0xffffff80" )--中央訊息：洛迦恩斯在你身上施放了保護盾
			ScriptMessage( v, v, 0 , "[SC_Z21_424595_12]", "0xffffff80" )--中央訊息：洛迦恩斯在你身上施放了保護盾
			AddBuff(v,620721,0,5);
		end		
	end
	--B2 對 A2吐出龍息
	CastSpelllv(ActorArray[2],ActorArray[1],498215,0);
	PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	Sleep(15)
	DelObj(ActorArray[1]);
	--(畫面重複震動至龍息特效消失)
	ScriptMessage( ActorArray[2], 0, 1 , "[SC_Z21_424595_11]", "0xffffff80" )--中央訊息：洛迦恩斯的龍息讓大地都為之顫動，令在場所有人都不寒而慄，但是賽西蒙德的笑聲讓空氣中彌漫一股詭異的氣息...
	ScriptMessage( ActorArray[2], 0, 0 , "[SC_Z21_424595_11]", "0xffffff80" )--中央訊息：洛迦恩斯的龍息讓大地都為之顫動，令在場所有人都不寒而慄，但是賽西蒙德的笑聲讓空氣中彌漫一股詭異的氣息...
	Sleep(25)
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) --戲演完了 給予旗標\物品
end