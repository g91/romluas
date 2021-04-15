
-----------------------------一直蹲著----------------------------

Function lua_nehelia_Crouch()
	local NPC=OwnerID()
	local Speak={ "[SC_424960_01]" , "[SC_424960_02]" , "[SC_424960_03]" }
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	while TRUE do
	local i = RandRange(1,3)
	NPCSay ( NPC, Speak[i] )
	Sleep(200)
	end
	sleep(30)
end


-----------------------------------------------------------------
----------------------------NPC對話----------------------------
-----------------------------------------------------------------

Function lua_nehelia_Z23_01()
	local NPC=TargetID()
	local Player=OwnerID()
--	local CheckA=CheckFlag(Player,546205)			--導引
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--是否接任務
	local Report=CountBodyItem( Player, 241122 )		--檢查241122物品數量

	SetSpeakDetail ( Player,"[SC_424960_01]".."[SC_424960_02]")	--廢話一大堆

	if CheckQ==false				and
	CheckCompleteQuest(Player, 425015)==true	then
		AddSpeakOption( Player , NPC , "[SC_424960_ADD]" , "lua_nehelia_Z23_02", 0 )
	elseif CheckQ==true and Report==0 then
		SetSpeakDetail ( Player,"[SC_424960_05]")	--[$playername]，咳咳…不要拖拖拉拉的
	end

end


Function lua_nehelia_Z23_02()
	local NPC=TargetID()
	local Player=OwnerID()
	LoadQuestOption ( Player )
end


Function lua_nehelia_Z23_03()--蟻巢裡的人
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--檢查否有接424960任務
	local CheckTalk=CheckFlag( Player , 546277 )		--向派可．莫里森對話
	local Report=CountBodyItem( Player, 241122 )		--檢查241122物品數量

--	SetSpeakDetail ( Player,"[SC_424960_06]")		--唔嗯...這反應真是太棒了！果然是這個樣子的嗎？
	LoadQuestOption(Player)
	if CheckAcceptQuest( Player, 424960 ) == true	then
		if CheckQ==true and CheckTalk==false then
			AddSpeakOption( Player , NPC , "[SC_424960_ADD1]" , "lua_nehelia_Z23_04", 0 )
		elseif CheckQ==true and CheckTalk==true and Report==0 and CheckFlag( Player , 546278 )==false	then
			SetSpeakDetail ( Player,"[SC_424960_09]")	--拜託請你不要隨意將這麼重要的東西丟棄好嗎，研究報告可是我們研究的心血結晶。
			GiveBodyItem( Player , 241122, 1 )	--給予蓋提蟻定期研究報告
			SetFlag ( Player, 546280 , 1 )
		end	
	end

end


Function lua_nehelia_Z23_04()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_07]")	--哦？你是誰，新來的收送員嗎？
	AddSpeakOption( Player , NPC , "[SC_424960_ADD2]" , "lua_nehelia_Z23_05", 0 )
end


Function lua_nehelia_Z23_05()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_08]")	--蓋提蟻真是一種神奇的生物，[$playername]也這樣覺得吧？能進來觀察他們的生態真是太棒了！
	SetFlag ( Player , 546277 , 1 )		--開啟與派可談話過期標
	GiveBodyItem( Player , 241122, 1 )	--給予蓋提蟻定期研究報告
	SetFlag ( Player, 546280 , 1 )
end


Function lua_nehelia_Z23_06()
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--檢查否有接424960任務
	local CheckTalk1=CheckFlag( Player , 546277 )		--向派可．莫里森對話
	local CheckTalk2=CheckFlag( Player , 546278 )		--將研究書交給修斯．韋柏
	local Report1=CountBodyItem( Player, 241122 )		--檢查241122物品數量
	local Report2=CountBodyItem( Player, 241251 )		--檢查241251物品數量

--	SetSpeakDetail ( Player,"[SC_424960_10]")	--見過了龍，又在這裡看到蓋提蟻族，讓我深深覺得自己的存在非常的渺小且普通。
	if CheckAcceptQuest( Player, 424960 ) == true	then
		if CheckTalk1==true and Report1==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")				--哦！[$playername]，你回來了。
			AddSpeakOption( Player , NPC , "[SC_424960_ADD3]" , "lua_nehelia_Z23_07", 0 )	--交出報告書
		elseif CheckTalk2==true and Report2==0 and CheckFlag( Player , 546279 )==false	then
			SetSpeakDetail ( Player,"[SC_424960_13]")	--真是讓我失望了，你怎麼會如此粗心將報告書弄丟呢？
			GiveBodyItem( Player, 241251, 1 )	--給予修斯的報告書
			SetFlag( Player, 546281, 1 )
		elseif CheckTalk1==true and Report1==0 and Report2==0 then
			SetSpeakDetail ( Player,"[SC_424960_11]".."[SC_424960_14]")	--你也著迷於蓋提蟻的特殊生態了嗎？牠們的確是很特別沒錯…
		elseif CheckTalk1==true and Report1==0 and Report2==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")
		elseif CheckTalk1==true and Report1==1 then
			SetSpeakDetail ( Player,"[SC_424960_11]")
		end
	else
		LoadQuestOption(Player)
	end

	AddSpeakOption(Player, NPC,"[SC_424960_HELP_02]","LuaPG_AskForMedicine",0)
end


Function lua_nehelia_Z23_07()
	local NPC=TargetID()
	local Player=OwnerID()
	SetSpeakDetail ( Player,"[SC_424960_12]")	--(他接過報告書並大略地省視了一下)
	DelBodyItem( Player, 241122 , 1 )		--刪除蓋提蟻定期研究報告書
	GiveBodyItem( Player, 241251, 1 )	--給予修斯的報告書
	SetFlag(Player , 546280 , 1 )
	SetFlag(Player , 546278 , 1 )		--開啟研究書交出去旗標
	SetFlag(Player , 546281 , 1 )
end


Function lua_nehelia_Z23_08()
	local NPC=TargetID()
	local Player=OwnerID()
	local CheckQ = CheckAcceptQuest( Player , 424960 )	--檢查否有接424960任務
	local CheckTalk=CheckFlag( Player , 546278 )		--檢查是否有與修斯對話旗標
	local Report=CountBodyItem( Player, 241251 )		--檢查241251物品數量

--	SetSpeakDetail ( Player,"[SC_424960_15]")	--喂，士兵！這裡的兇猛野獸相當多，注意一點！
--	LoadQuestOption(Player)
	if CheckQ==true and CheckTalk==true and Report==1 and CheckFlag( Player , 546279 )==false	then
		SetSpeakDetail ( Player,"[SC_424960_16]")		--先前派遣了一名士兵去執行報告的收送任務，結果到現在人都還沒回來
		AddSpeakOption( Player , NPC , "[SC_424960_ADD4]" , "lua_nehelia_Z23_09", 0 )	--交出報告書
	else 
		LoadQuestOption(Player)
	end

end


Function lua_nehelia_Z23_09()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546279 , 1 )
	DelBodyItem(Player, 241251, 1)
	CloseSpeak(Player)
end

Function lua_nehelia_Z23_10()
	local NPC=TargetID()
	local Player=OwnerID()

	SetFlag ( Player , 546205 , 0 )
	SetFlag ( Player , 546277 , 0 )
	SetFlag ( Player , 546278 , 0 )
	SetFlag ( Player , 546279 , 0 )
	SetFlag ( Player , 546280 , 0 )
	SetFlag ( Player , 546281 , 0 )

	DelBodyItem( Player , 241122 , 1 )
	DelBodyItem( Player , 241251 , 1 )

end


Function lua_nehelia_Z23_11()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546280 , 0 )
end

Function lua_nehelia_Z23_12()
	local NPC=TargetID()
	local Player=OwnerID()
	SetFlag ( Player , 546281 , 0 )
end