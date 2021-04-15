--z24主線=======================================
--=======================================
--425546 支援者
---------------------------------------------------------------------------
--任務二中，先與阿里說話後與導師說話完成任務。
--(與阿里對話)
function lua_talk_to_ALI_1()
	lua_TalkandTurnUniversal()
	local Player = OwnerID()
	if CheckAcceptQuest( Player,425546 ) and 
	CheckFlag( Player,546883 )==false then
		AddSpeakOption( Player, Player, "[SC_Z24Q425546ALI_01]", "lua_talk_to_ALI_2", 0 )
	end
	if CheckAcceptQuest( Player, 425547) == true	 and	--425547重新拿取東西
	CountBodyItem(Player, 241309)==0		and
	CheckFlag(Player, 546885)==false		then
		AddSpeakOption(Player, Teacher,"[SC_Z24Q425547_RETAKE]","LuaPG_425547_Retake",0)
	end
end
function lua_talk_to_ALI_2()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q425546ALI_02]" )
	AddSpeakOption( OwnerID(), TargetID(), "[SC_Z24Q425546ALI_03]", "lua_talk_to_ALI_Chickin", 0 )
end
function lua_talk_to_ALI_Chickin()
	SetFlag( OwnerID(),546882,1 )
	CloseSpeak(OwnerID())
end
--(與導師A對話)
function lua_talk_to_TCH_1()
--	lua_TalkandTurnUniversal()
	if CheckAcceptQuest( OwnerID(),425546 )==true 	and 
	CheckFlag( OwnerID(),546882)==true 		and
	CheckFlag( OwnerID(),546883)==false		then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_Z24Q425546TCH_01]", "lua_talk_to_TCH_2", 0 )
	end
end
function lua_talk_to_TCH_2()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q425546TCH_02]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q425546TCH_03]", "lua_talk_to_TCH_Chickin", 0 )
end
function lua_talk_to_TCH_Chickin()
	SetFlag( OwnerID(),546883,1 )
	CloseSpeak(OwnerID())
end

--=======================================
--425551
---------------------------------------------------------------------------
--任務七，與聖樹對話的對話劇情。
function lua_Forest_425551_TalkToTree_01()
	LoadQuestOption( OwnerID() );
	if CheckAcceptQuest( OwnerID(),425551 ) and CheckFlag( OwnerID(),546888 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q5551_01]", "lua_Forest_425551_TalkToTree_02", 0 )
	end
end
function lua_Forest_425551_TalkToTree_02()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q5551_02]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q5551_03]", "lua_Forest_425551_TalkToTree_03", 0 )	
end
function lua_Forest_425551_TalkToTree_03()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q5551_04]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q5551_05]", "lua_Forest_425551_TalkToTree_04", 0 )	
end
function lua_Forest_425551_TalkToTree_04()
	SetSpeakDetail( OwnerID(),"[SC_Z24Q5551_06]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z24Q5551_07]", "lua_Forest_425551_TalkToTree_05", 0 )	
end
function lua_Forest_425551_TalkToTree_05()
	local Player = OwnerID()
	local OriginalTree = TargetID()
	local Num = ReadRoleValue(OriginalTree, EM_RoleValue_Register1)
	CloseSpeak( Player)
	SetFlag(Player, 546888, 1)
	if Num == 0	then
		AddBuff(Player, 621127, 1,10)
		CallPlot(TargetID(),"lua_Forest_425551_TalkToTree_06",Player,OriginalTree)
	else
		AddBuff(Player, 621127, 1,10)
	end
end
function lua_Forest_425551_TalkToTree_06(Player,OriginalTree)
	local SaintTree=LuaFunc_CreateObjByObj( 121552,OriginalTree)
	Sleep(5)
	ScriptMessage( Player, Player ,1 , "[SC_Z24Q5551_08]", "0xffffff80" )
	Sleep(10)
	DelObj(SaintTree)
	ScriptMessage( Player,Player,1,"[SC_Z24Q5551_09]",0)
end
---------結束後的表演
--BUFF: 621664
--走位旗子: 781177 NO.16~18
function LuaPG_425551_Complete()
	local Player = TargetID()
	local Teacher = OwnerID()
	local Flag = 781177
	local BUFF = 621664
	local Num = ReadRoleValue(Teacher,EM_RoleValue_Register1)
	if	Num == 0	then					----如果暫存值為0
		local New_Teacher = Lua_DW_CreateObj("flag",121555,781177,23)
		ks_ActSetMode( New_Teacher )
		AddBuff( Player,BUFF,0,15)
		CallPlot(Teacher , "LuaPG_425551_Complete_02" , New_Teacher ,Player, Teacher,Flag, BUFF)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425551_Complete_02(New_Teacher ,Player, Teacher,Flag, BUFF)
	WriteRoleValue(Teacher,EM_RoleValue_Register1,999) 		----開始演出的標記
	local Gill = Lua_DW_CreateObj("flag",121554,781177,17)
	ks_ActSetMode( Gill )
	Sleep(5)
	NPCSAY(Gill,"[SC_Z24Q425551_01]")
	Sleep(25)
	NPCSAY(Gill,"[SC_Z24Q425551_02]")
	Sleep(10)
	FA_FaceFlagEX( New_Teacher, Flag, 18, 0, 0 )
	DW_MoveDirectToFlag( Gill, Flag, 18, 0, 1)				--走到前方
	NPCSAY(New_Teacher,"[SC_Z24Q425551_03]")
	Sleep(25)
	DelObj(New_Teacher)
	DelObj(Gill)
	CancelBuff(Player, BUFF)	
	WriteRoleValue(Teacher,EM_RoleValue_Register1,0)
end



--=======================================
--425547 儀式的準備
---------------------------------------------------------------------------
--演員：121136 伊崔妮，121137 人王，121138 水龍，121139 冰龍
--給玩家看戲的BUFF：623273
--走位：781177	NO.1~6
function LuaPG_425547_Show()
	local Player = OwnerID()
	local King = TargetID()

	local Num = ReadRoleValue(King, EM_RoleValue_Register1)
	if CheckAcceptQuest( Player, 425547) == true		and
	CheckFlag(Player,546885)==false			 then
		if  CheckFlag(Player,546884)==false		then
			if Num > 0					then			----檢查玩家是否有任務 並且現在是否正在演戲		
				SetSpeakDetail(Player, "[SC_Z24Q425547_TALK_03]")		----(正在演戲情況下 給予告知)
			elseif Num == 0				then			----如果暫存值為0
				SetSpeakDetail(Player, "[SC_Z24Q425547_TALK_01]")
				AddSpeakOption(Player, King,"[SC_Z24Q425547_TALK_02]","LuaPG_425547_Show_02",0)
			end
		elseif CheckFlag(Player,546884)==true			then
			SetSpeakDetail(Player, "[SC_Z24Q425547_TALK_04]")
		end										----接演戲function	
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425547_Show_02()
	local Player = OwnerID()
	local King = TargetID()
	local PlayerList01 = SearchRangePlayer(King, 200)
	local PlayerList02 = {}
	for i = 0,#PlayerList01 do
		if CheckAcceptQuest(PlayerList01[i], 425547)==true and			--過濾有任務的玩家
		CheckFlag(PlayerList01[i],546884)==false		then
			table.insert(PlayerList02, PlayerList01[i])
		end
	end
	CloseSpeak( Player )								----關閉對話視窗
	
	WriteRoleValue( King, EM_RoleValue_Register1, 999 )				----上鎖 表示正在演戲	
	CallPlot( King, "LuaPG_425547_Show_03", Player,King,PlayerList02)			
end

function LuaPG_425547_Show_03(Player,King,PlayerList02)	--掛在NPC身上的演戲劇情			
	local QuestID = 425547				--任務編號
	local FinishFlagID = 546884			--完成任務獲得的旗標
	local CheckBuffID = 623273			--檢查是否正在演戲的BUFF
	local CheckRange = 250				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	
	local FlagID = 781177				--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	ActorArray[1] = CreateObjByFlag( 121136, FlagID, 1, 1 ) 	 --伊崔妮
	ActorArray[2] = CreateObjByFlag( 121137, FlagID, 2, 1 ) 	--人王
	ActorArray[3] = CreateObjByFlag( 121138, FlagID, 3, 1 ) 	--水龍
	ActorArray[4] = CreateObjByFlag( 121139, FlagID, 4, 1 )	--冰龍

	CallPlot( King, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式
	for k=1,#PlayerList02 do						
		Lua_StopBGM(PlayerList02[k])					--停止背景音樂
		local Music = PlayMusicToPlayer(PlayerList02[k],"music/zone/016/Arde_Camp/medieval_10_DG2_red_creek.mp3", false)--播放音樂
		WriteRoleValue(PlayerList02[k], EM_RoleValue_Register5, Music)	--把音樂寫入玩家身上
	end
	for i=1, 4 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end
	sleep(10)

	--演戲中
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY(ActorArray[2], "[SC_Z24Q425547_SHOW_01]")		--人王：[$playername]，我讓伊崔妮一起去
	Sleep(30)
	SAY(ActorArray[1], "[SC_Z24Q425547_SHOW_02]")		--伊：咦，可是……
	Sleep(15)
	FA_FaceFlagEX( ActorArray[2], FlagID, 1, 0, 0 )
	SAY(ActorArray[2], "[SC_Z24Q425547_SHOW_03]")		--人王：等下我也會過去。放心吧
	Sleep(35)
	PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	SAY(ActorArray[2], "[SC_Z24Q425547_SHOW_04]")		--人王：現在解決聖樹的問題要緊！
	Sleep(25)
	PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY(ActorArray[1], "[SC_Z24Q425547_SHOW_05]")		--伊：……我明白了，那請多加小心。
	Sleep(25)
	FA_FaceFlagEX( ActorArray[2], FlagID, 4, 0, 0 )
	PlayMotion(ActorArray[4],ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	SAY(ActorArray[4], "[SC_Z24Q425547_SHOW_06]")		--卡：那我也不過去了，
	Sleep(25)
	FA_FaceFlagEX( ActorArray[3], FlagID, 4, 0, 0 )
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_THREATEN)
	SAY(ActorArray[3], "[SC_Z24Q425547_SHOW_07]")		--水：你不來？
	Sleep(25)
	SAY(ActorArray[4], "[SC_Z24Q425547_SHOW_08]")		--卡：沒錯，那又如何？
	Sleep(20)
	PlayMotion(ActorArray[4],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	SAY(ActorArray[4], "[SC_Z24Q425547_SHOW_09]")		--卡：邦喀雷姆斯派了我們兩個，為的就是讓我們輪流出力。
	Sleep(35)
	PlayMotion(ActorArray[4],ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	SAY(ActorArray[4], "[SC_Z24Q425547_SHOW_10]")		--卡：像這種能讓你精進夢行之眠的機會不多啊！
	Sleep(35)
	PlayMotion(ActorArray[3],ruFUSION_ACTORSTATE_EMOTE_ANGRY	)
	SAY(ActorArray[3], "[SC_Z24Q425547_SHOW_11]")		--水（搖搖頭）：我不和你爭辯，
	Sleep(25)

	WriteRoleValue(ActorArray[3] , EM_RoleValue_IsWalk , 1)  
	DW_MoveDirectToFlag(ActorArray[3] , FlagID, 5, 0, 1) 	--水龍和伊崔妮離開
	WriteRoleValue(ActorArray[1] , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( ActorArray[1] , FlagID, 6, 0, 1) 
	DelObj(ActorArray[3])	
	DelObj(ActorArray[1])
	Sleep(5)
	--戲演完了
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end


--把東西拿給導師
function LuaPG_425547_Give_01()
	lua_talk_to_TCH_1()
	local Player = OwnerID()
	local Teacher = TargetID()

	if CheckAcceptQuest( Player, 425547) == true	 and
	CountBodyItem(Player, 241309)>=1		and
	CheckFlag(Player, 546885)==false		then
		if CheckFlag(Player, 546884)==true		then
			AddSpeakOption(Player, Teacher,"[SC_Z24Q425547_GIVE]","LuaPG_425547_Give_02",0)
		else
			SetSpeakDetail(Player, "[SC_Z24Q425547_TALK_05]")
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425547_Give_02()
	local Player = OwnerID()
	local Teacher = TargetID()

	CloseSpeak(Player)
	DelBodyItem(Player, 241309, 1)
	SetFlag(Player, 546885, 1)
end

function LuaPG_425547_Retake()
	local Player = OwnerID()
	local Ali = TargetID()

	CloseSpeak(Player)
	GiveBodyItem(Player, 241309, 1)				
end




--=======================================
--425549 意外的來者
---------------------------------------------------------------------------
--接下後的表演
--演員：121145 吉兒．艾克辛、121146 伊崔妮．吉昂特、121147 莎玻茵達
--走位旗子：781177	no.7～no.8
--BUFF：623274
function LuaPG_425549_Accept()
	local Player = OwnerID()
	local Iny = TargetID()
	local Num = ReadRoleValue(Iny,EM_RoleValue_Register1)

	if CheckAcceptQuest(Player,425549)==true	and
	CheckFlag(Player, 547140)==false		and
	CheckFlag(Player, 546887)==false		then
		if Num == 0	then						----如果暫存值為0
			SetSpeakDetail(Player, "[SC_Z24Q425549_04]")
			AddSpeakOption(Player, Iny,"[SC_Z24Q425549_06]","LuaPG_425549_Accept_02",0)
		elseif Num > 0	then
			SetSpeakDetail(Player, "[SC_Z24Q425549_05]")
		end
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425549_Accept_02()
	local Player = OwnerID()
	local Iny = TargetID()
	local PlayerList01 = SearchRangePlayer(Iny, 250)
	local PlayerList02 = {}
	for i = 0,#PlayerList01 do
		if CheckAcceptQuest(PlayerList01[i], 425549)==true and			--過濾有任務的玩家
		CheckFlag(PlayerList01[i],547140)==false		then
			table.insert(PlayerList02, PlayerList01[i])
		end
	end
	CloseSpeak(Player)
	WriteRoleValue(Iny,EM_RoleValue_Register1,999)
	CallPlot( Iny, "LuaPG_425549_Accept_Show", Player,Iny,PlayerList02)
end

function LuaPG_425549_Accept_Show(Player,Iny,PlayerList02)--掛在NPC身上的演戲劇情	
	local QuestID = 425549				--任務編號
	local FinishFlagID = 547140			--完成任務獲得的旗標
	local CheckBuffID = 623274			--檢查是否正在演戲的BUFF
	local CheckRange = 250				--演戲的檢查範圍
	local ActorArray = {}				--(新版修改)演員陣列表
	local FlagID = 781177				--旗標ID
	-- 事先把所有會用到的演員產生出來 可以不AddToPartition(只需要GUID)
	local Box = LuaFunc_SearchNPCbyOrgID( Iny, 121065, 300, 0)
	local RoomID = ReadRoleValue(Box, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Box, EM_RoleValue_X )
	local Y = ReadRoleValue( Box, EM_RoleValue_Y )
	local Z = ReadRoleValue( Box, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Box, EM_RoleValue_Dir )
	ActorArray[1] = DW_CreateObjEX("obj", 121146, Iny)	--New_Iny
	ActorArray[2] = CreateObjByFlag( 121147, FlagID, 7, 1 )	--Teacher
	ActorArray[3] = CreateObjByFlag( 121650, FlagID, 8, 1 )	--Monster
	ActorArray[4] = CreateObj( 121145, X, Y, Z , Dir, 1 )		--Gill
	MoveToFlagEnabled( ActorArray[4], false )
	CallPlot( Iny, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )--範圍看戲用的檢查函式

	for k=1,#PlayerList02 do						
		Lua_StopBGM(PlayerList02[k])					--停止背景音樂
		local Music = PlayMusicToPlayer(PlayerList02[k],"music/zone/017/Cretrue/orchestral_02_TSI_forged_march.mp3", false)	--播放音樂
		WriteRoleValue(PlayerList02[k], EM_RoleValue_Register5, Music)	--把音樂寫入玩家身上
	end
	for i=1, 3 do
		AddToPartition( ActorArray[i], 0 )
		ks_ActSetMode( ActorArray[i] )
	end

	SetModeEx( ActorArray[3] , EM_SetModeType_Fight, false)			-- 可砍殺攻擊
	SetModeEx( ActorArray[3], EM_SetModeType_Searchenemy,false)		--索敵取消

	local Box = LuaFunc_SearchNPCbyOrgID( Iny, 121065, 300, 0)
	local RoomID = ReadRoleValue(Box, EM_RoleValue_RoomID)
	local X = ReadRoleValue( Box, EM_RoleValue_X )
	local Y = ReadRoleValue( Box, EM_RoleValue_Y )
	local Z = ReadRoleValue( Box, EM_RoleValue_Z )
	local Dir = ReadRoleValue( Box, EM_RoleValue_Dir )

	Sleep(10)
	SetModeEx( ActorArray[2] , EM_SetModeType_Fight, true)
	SetAttack(ActorArray[3], ActorArray[2])					--怪物攻擊
	Sleep(5)
--	Say(New_Iny,"2")
	FA_FaceFlagEX( ActorArray[1], FlagID, 7, 0, 0 )
	Yell(ActorArray[1],"[SC_Z24Q425549_02]",3)				--吃驚
	Yell(ActorArray[2] ,"[SC_Z24Q425549_02]",3)
	--導師使出防禦法術
	Sleep(25)
	SetModeEx( ActorArray[2] , EM_SetModeType_Strikback , true )		-- 反擊
	SetDefIdleMotion( ActorArray[4], ruFUSION_MIME_RUN_FORWARD)
--	SetDefIdleMotion( ActorArray[4], ruFUSION_MIME_JUMP_LOOP)	
	AddToPartition( ActorArray[4], 0)						--吉兒出現
	ks_ActSetMode( ActorArray[4] )
	SetModeEx( ActorArray[4], EM_SetModeType_Gravity , false )		--重力取消
	SetModeEx( ActorArray[4], EM_SetModeType_Searchenemy,false)		--索敵取消
	SetModeEx( ActorArray[3] , EM_SetModeType_Fight, true)

	Yell(ActorArray[4],"[SC_Z24Q425549_03]",3)
	Sleep(15)
--	WriteRoleValue( ActorArray[4], EM_RoleValue_IsWalk , 0)

	SetModeEx( ActorArray[3] , EM_SetModeType_Strikback , true )		-- 反擊
	SetModeEx( ActorArray[4] , EM_SetModeType_Strikback , true )		-- 反擊
	SetModeEx( ActorArray[4], EM_SetModeType_Searchenemy,true)
	SetModeEx( ActorArray[2] , EM_SetModeType_Fight, false)
	SetModeEx( ActorArray[2] , EM_SetModeType_Fight, true)			-- 可砍殺攻擊
	Sleep(5)
	SetAttack(ActorArray[4], ActorArray[3])
	SetAttack(ActorArray[3], ActorArray[4])
	SetModeEx( ActorArray[2] , EM_SetModeType_Strikback , false )		-- 反擊
	AddBuff(ActorArray[2], 502921, 0, -1)
--	Say(ActorArray[4],"00")
	while true do								--吉兒英勇擊退怪物
		if  ReadRoleValue( ActorArray[3], EM_RoleValue_IsDead ) == 1	then
--			Say(ActorArray[3],"22")
			SetModeEx( ActorArray[4], EM_SetModeType_Move, false )
			break
		end
		Sleep(10)
	end
	SetModeEx( ActorArray[4], EM_SetModeType_Searchenemy,false)			--索敵
	Sleep(30)
	for j=1, 4 do	
		DelObj(ActorArray[j])							--回復原狀
	end
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) -- 給予旗標\物品
end

function LuaPG_425549_Talk()
	local Player = OwnerID()
	LoadQuestOption(Player)
	 if CheckAcceptQuest( Player, 425549) == true	and
	CheckFlag(Player, 547140)==true		and
	CheckFlag(Player, 546887)==false		then
		SetFlag(Player, 546887, 1)
		CloseSpeak(Player)
	end
end




--=======================================
--425553 藥草知識，派上用場
---------------------------------------------------------------------------
--演員：士兵A 119840、士兵B 119839、摩瑞克119779
--走位旗子：781177	no.9~10
--給玩家看戲的BUFF：623282
function LuaPG_425553_Complete()
	local Player = TargetID()
	local Berg = OwnerID()
	local Flag = 781177
	local Num = ReadRoleValue(Berg,EM_RoleValue_Register1)
	if	Num == 0	then					----如果暫存值為0
		local Alice = Lua_DW_CreateObj("flag",121151, Flag, 9)
		ks_ActSetMode( Alice )
		AddBuff( Player,623282,0,20)
		CallPlot(Berg, "LuaPG_425553_Complete_01" , Berg, Player,Alice,Flag)	
									----接演戲function
	end
end

function LuaPG_425553_Complete_01(Berg, Player,Alice,Flag)
	WriteRoleValue(Berg,EM_RoleValue_Register1,999) 		----開始演出的標記	
	WriteRoleValue(Alice, EM_RoleValue_IsWalk , 0 ) 
	Sleep(10)
	Say(Alice,"[SC_Z24Q425553_01]")
	DW_MoveDirectToFlag( Alice, Flag, 10, 0, 1) 	
	Sleep(20)
	DelObj(Alice)
	CancelBuff(Player, 623282)
	WriteRoleValue(Berg, EM_RoleValue_Register1, 0) 		----寫回暫存值
end


--=======================================
--425550 四方儀式之火
---------------------------------------------------------------------------
--BUFF: 623516
--走位旗子: 781177 NO.20~21
function LuaPG_425550_Accept()
	local Player = TargetID()
	local Teacher = OwnerID()
	local Flag = 781177
	local BUFF = 623516

	local Num = ReadRoleValue(Teacher,EM_RoleValue_Register1)
	if	Num == 0	then					----如果暫存值為0
		local New_Teacher = DW_CreateObjEX("obj", 121458, Teacher)
		local Gill = LuaFunc_SearchNPCbyOrgID( Teacher, 121148, 200, 0 )
		local Iny = LuaFunc_SearchNPCbyOrgID( Teacher, 121150, 200, 0 )
		local x,y,z,dir=DW_Location(Gill)
		local New_Gill = CreateObj(121459,x,y,z,dir,1)
		local x1,y1,z1,dir1=DW_Location(Iny)
		local New_Iny = CreateObj(121460,x1,y1,z1,dir1,1)
		local New = {New_Teacher,New_Gill,New_Iny}
			for index,value in pairs(New) do
				AddToPartition(value,0)
				ks_ActSetMode( value )	
			end
		AddBuff( Player,BUFF,0,15)
		CallPlot(Teacher , "LuaPG_425550_Accept_02" , Teacher,Player,New_Teacher , New_Gill, New_Iny, Flag, BUFF)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425550_Accept_02(Teacher,Player,New_Teacher , New_Gill, New_Iny, Flag, BUFF)
	WriteRoleValue(Teacher,EM_RoleValue_Register1,999) 		----開始演出的標記
	Sleep(10)
	NPCSAY(New_Teacher,"[SC_425550_01]")
	Sleep(25)
	WriteRoleValue(New_Teacher , EM_RoleValue_IsWalk , 1)  
	DW_MoveDirectToFlag(New_Teacher , Flag, 20, 0, 1)
	WriteRoleValue(New_Iny , EM_RoleValue_IsWalk , 1)
	DW_MoveToFlag( New_Iny , Flag, 21, 0, 1) 
	DelObj(New_Teacher)	
	DelObj(New_Iny)
	NPCSAY(New_Gill,"[SC_425424_4]")
	Sleep(20)
	WriteRoleValue(New_Gill , EM_RoleValue_IsWalk , 1) 
	DW_MoveToFlag( New_Gill , Flag, 20, 0, 1) 
	DelObj(New_Gill)
	CancelBuff(Player, BUFF)	
	WriteRoleValue(Teacher,EM_RoleValue_Register1,0)
end

---------結束後的表演
--BUFF: 623334
--走位旗子: 781177 NO.22~24
function LuaPG_425550_Complete()
	local Player = TargetID()
	local Teacher = OwnerID()
	local Flag = 781177
	local BUFF = 623334
	local Num = ReadRoleValue(Teacher,EM_RoleValue_Register1)
	if	Num == 0	then					----如果暫存值為0
		local New_Teacher = DW_CreateObjEX("obj", 121458, Teacher)
		AddToPartition(New_Teacher,0)
		ks_ActSetMode( New_Teacher )
		AddBuff( Player,BUFF,0,25)
		CallPlot(Teacher , "LuaPG_425550_Complete_02" , New_Teacher ,Player, Teacher,Flag, BUFF)	
									----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425550_Complete_02(New_Teacher ,Player, Teacher,Flag, BUFF)
	WriteRoleValue(Teacher,EM_RoleValue_Register1,999) 		----開始演出的標記
	DW_MoveToFlag( New_Teacher, Flag, 22, 0, 1)			--走到前方
	local FirePlace = LuaFunc_SearchNPCbyOrgID( Teacher, 121556, 200, 0 )	
	local OBJ = LuaFunc_CreateObjByObj( 119825, FirePlace )
		SetModeEx( OBJ  , EM_SetModeType_Mark, false )		--標記
		SetModeEx( OBJ  , EM_SetModeType_ShowRoleHead, false )	--頭像框
		SetModeEx( OBJ  , EM_SetModeType_HideName, true )		--名稱
		CastSpell(New_Teacher, OBJ, 850454)			--施展法術，火盆點燃				
		AddBuff(OBJ,621795,0,9)
		Sleep(25)
	DW_MoveToFlag( New_Teacher, Flag, 23, 0, 1)			--走回來
	local HolyTree =  CreateObjByFlag( 121551, Flag, 24, 1 )		--聖樹出現
		AddToPartition(HolyTree,0)
		ks_ActSetMode( HolyTree )
		Sleep(5)
		ScriptMessage( Player, Player, 1,"[SC_Z24Q425550_04]", "0xffffff80" )
		Sleep(25)
	DelObj(New_Teacher)
	DelObj(HolyTree)
	CancelBuff(Player, BUFF)	
	WriteRoleValue(Teacher,EM_RoleValue_Register1,0)
end

--偷懶用
function LuaPG_425550_Kill()
	local Player = OwnerID()
	local TorchList = {}
	DW_QietKillOne( 0,101877 )	--快速殺死"燃起各方儀式之火"	
end

--=======================================
--425552 對舊戰友的呼喚
---------------------------------------------------------------------------
function LuaPG_425552_WillYouListen()
	local Player = OwnerID()
	local Gill = TargetID()
	if CheckAcceptQuest( Player,425552)== true	and
	CheckFlag(Player, 546889)==false		then
		SetSpeakDetail(Player, "[SC_Z24Q425552_01]")
		AddSpeakOption( Player, Gill, "[SC_Z24Q425552_02]", "LuaPG_425552_WillYouListen_02()", 0 )
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425552_WillYouListen_02()
	local Player = OwnerID()
	local Gill = TargetID()
	local BuffCheck=Lua_BuffPosSearch( Player ,623517)					--找玩家身上判斷BUFF的位子
	local BuffLv = BuffInfo( Player , BuffCheck , EM_BuffInfoType_Power )			--確認BUFF層數
--	Say(Player, BuffLv)
	if BuffLv<5		then
		SetSpeakDetail(Player, "[SC_Z24Q425552_03]")
		AddBuff(Player,623517,0,-1)
	elseif BuffLv>=5	then
		CloseSpeak(Player)
		SetFlag(Player, 546889, 1)							--給旗標
		CallPlot(Gill , "LuaPG_425552_CompleteShow" , Gill ,Player)				--呼叫演戲function
	end	
end

--接下任務後的表演
---------------------------------------------------------------------------
--演員：導師121554
--走位旗子：781177
--給玩家看戲的BUFF：623723
function LuaPG_425552_Accept()
	local Player = TargetID()
	local Teacher = OwnerID()
	local Flag = 781177
	local Buff = 623723
	local Num = ReadRoleValue(Teacher,EM_RoleValue_Register1)

	if	Num == 0	then						----如果暫存值為0
		local New_Teacher = DW_CreateObjEX("obj", 121458, Teacher)
		ks_ActSetMode( New_Teacher )
		CancelBuff(Player,623517)
		AddBuff( Player,Buff,1,15)
		CallPlot(Teacher , "LuaPG_425552_Accept_02" , New_Teacher , Teacher, Player, Flag,Buff)
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425552_Accept_02(New_Teacher , Teacher, Player, Flag,Buff)
	WriteRoleValue(Teacher,EM_RoleValue_Register1,999) 			----開始演出的標記
	Sleep(5)
	DW_MoveDirectToFlag( New_Teacher, 781177, 18, 0, 1)			--走到前方
	Sleep(25)
	DelObj(New_Teacher)
	CancelBuff(Player, BUFF)
	WriteRoleValue(Teacher, EM_RoleValue_Register1, 0) 			----寫回暫存值
end

--得到flag後的表演
---------------------------------------------------------------------------
--演員：吉兒121554
--走位旗子：781177 NO.19
--給玩家看戲的BUFF：623723
function LuaPG_425552_CompleteShow(Gill ,Player)
	local Flag = 781177
	local Buff = 623723
	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)

	if	Num == 0	then						----如果暫存值為0
		local New_Gill = DW_CreateObjEX("obj", 121554, Gill)		----生成演戲吉兒
		ks_ActSetMode( New_Gill )
		AddBuff( Player,Buff,1,20)
		CallPlot(Gill , "LuaPG_425552_CompleteShow_02" , New_Gill , Gill, Player, Flag,Buff)
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_425552_CompleteShow_02(New_Gill , Gill, Player, Flag,Buff)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 			----開始演出的標記
	Sleep(15)
	NPCSAY(New_Gill,"[SC_Z24Q425552_04]")	
	WriteRoleValue(New_Gill , EM_RoleValue_IsWalk , 0) 
	DW_MoveDirectToFlag( New_Gill , Flag, 19, 0, 1)				----吉兒走到781177的19
	Sleep(20)
	DelObj(New_Gill)
	CancelBuff(Player, Buff)
	WriteRoleValue(Gill, EM_RoleValue_Register1, 0) 				----寫回吉兒暫存值
end

----如果取消任務，BUFF就消失
function LuaPG_425552_Cancel_Buff()
	local Player = OwnerID()
	local BUFF01 = 623723
	local BUFF02 = 623517
	if CheckAcceptQuest(Player,425552)==false	and
	CheckBuff(Player,BUFF01)==true			then
			CancelBuff(Player,BUFF01)
	end
	if CheckAcceptQuest(Player,425552)==false	and
	CheckBuff(Player,BUFF02)==true		then
			CancelBuff(Player,BUFF02)
	end
end