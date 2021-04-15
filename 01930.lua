--423363
function LuaS_423363_0()--(點擊波多，演戲)
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423363)==true )and( CheckCompleteQuest( OwnerID(),423363)==false) and	CheckFlag( OwnerID() , 544266) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423363_0]","LuaS_423363_1",0)	--好，我可以和你偷偷跟進去看。
			else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423363_0]","LuaS_423363_2",0)	--好，我可以和你偷偷跟進去看。
		end
	end
	if	(CheckAcceptQuest(OwnerID(),423365)==true )and( CheckCompleteQuest( OwnerID(),423365)==false) and	CheckFlag( OwnerID() , 544280) ==true	then
		if	CountBodyItem( OwnerID(), 207722)<1	then			
			GiveBodyItem( OwnerID(), 207722, 1 )			
		end
	end
	if	(CheckAcceptQuest(OwnerID(),423366)==true )and( CheckCompleteQuest( OwnerID(),423366)==false)	then
		if	CountBodyItem( OwnerID(), 207728)>0	then	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423366_4]","LuaS_423366_000",0)	--接下來該怎麼做？		
		end
	end
end

function LuaS_423366_000()
	SetSpeakDetail(OwnerID(),"[SC_423366_3]")	--波多：好傢伙拿到[207728]了！我們可以回去找好精靈了！ 
end

function LuaS_423363_2()
	SetSpeakDetail(OwnerID(),"[SC_423363_1]")	--波多：好傢伙要等等喀喀噠，好傢伙太大，容易被發現～ 
end

function LuaS_423363_1()
	CloseSpeak(OwnerID())
	if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
		WriteRoleValue ( TargetID() , EM_RoleValue_Register+1,1 )
		BeginPlot(TargetID(),"LuaS_423363_3",2)
	end		
end

function LuaS_423363_3()
	AddBuff( TargetID()  , 507163 , 1 , 180 )
--	local BODO = Lua_DW_CreateObj("flag" ,115884,780692,2,1)					--115884波多、旗子編號780692、2
	local BODO = LuaFunc_CreateObjByOBj(115884, OwnerID() )
	DisableQuest( BODO , true )									--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(BODO , false )
	WriteRoleValue( BODO ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( BODO ,EM_RoleValue_Register+2,TargetID())					--把玩家寫進演戲波多
	WriteRoleValue( BODO ,EM_RoleValue_Register+3,OwnerID())					--把原波多寫進演戲波多
	BeginPlot(BODO , "LuaS_423363_11" , 0 )
	BeginPlot(BODO , "LuaS_423363_4" , 0 )
end	

function LuaS_423363_4()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local QBODO  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	

	local ANT = Lua_DW_CreateObj("flag" ,115886,780692,3,1)					--115884進安特、旗子編號780692、3
	DisableQuest( ANT , true )									--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(ANT , false )
	WriteRoleValue( ANT ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ANT,EM_RoleValue_Register+3,OwnerID())					--把演戲波多寫進演戲進安特
	BeginPlot( ANT, "LuaS_423363_CHECK" , 0 )							--掛安特迴圈檢查--玩家不在就刪除安特

	local ELY = Lua_DW_CreateObj("flag" ,115885,780692,4,1)					--115884伊利、旗子編號780692、4
	DisableQuest( ELY , true )									--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(ELY , false )
	WriteRoleValue( ELY ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ELY,EM_RoleValue_Register+3,OwnerID())					--把演戲波多寫進演戲伊利
	BeginPlot( ELY, "LuaS_423363_CHECK" , 0 )							--掛伊利迴圈檢查--玩家不在就刪除伊利
	
	sleep(10)
	AdjustFaceDir(OwnerID(), player , 0 )
	Yell( OwnerID(), "[SC_423363_2]" , 3 )								--波多：太好了！現在喀喀噠要想辦法把你藏起來～	
	sleep(20)
	Yell( OwnerID(), "[SC_423363_3]" , 3 )								--波多：嗯...有了、有了，好傢伙放輕鬆、別怕～
	sleep(20)
	Setposbyflag(ANT , 780693, 1 ) 								--傳送安特
	AdjustFaceDir(ANT , ELY, 0 )
	sleep(10)
	BeginPlot( ANT, "LuaS_423363_ANT_MOVE" , 0 )						--安特持續移動
 	--BuffTypeNum 輸入想解除的buff 類型
	--68 騎乘
	--58 變身
	--ObjID 輸入想解除的目標  若不填 預設為 IDNum
	--填1 則預設為 TargetID()
	DW_CancelTypeBuff(68, player  )
	Setposbyflag(player  , 780692, 5 ) 								--傳送玩家
	AddBuff( player  , 507322, 1 , 180 )				
	Setposbyflag(OwnerID(), 780692, 2 ) 								
	AddBuff( player   , 503977 , 1 , 180 )								--給玩家BUFF (乖乖看戲)
	sleep(10)
	Setposbyflag(player  , 780692, 5 ) 								--傳送玩家
	if	checkbuff(player  ,507322)==false	then
		AddBuff( player  , 507322, 1 , 180 )
	end	
	Tell(player ,OwnerID(),"[SC_423363_4]")							--悄悄話：真棒的方法，對吧？
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423363_5]")							--悄悄話：我都這樣躲嘩里雅酋長，在這裡一樣好用～
	sleep(20)
	Tell(player ,OwnerID(),"[SC_423363_6]")							--悄悄話：啊！你看他們！
	sleep(80)

	Yell( ANT , "[SC_423363_7]" , 3 )	--安特：伊利雅爾...
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_8]" , 3 )	--伊利：真的...是你，安特克羅...
	sleep(30)

	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423363_9]" , 3 )	--安特：我，耗盡力量、陷入長眠，而後再度甦醒。
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_10]" , 3 )	--伊利：你沒有...逝去？耗盡自然之力的精靈從來沒有存活下來的...
	sleep(30)

	
	Yell( ANT , "[SC_423363_11]" , 3 )	--安特：死亡只是回歸自然，為了精靈的未來，我不後悔做出犧牲自己的決定。
	sleep(30)
	
	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Yell( ELY , "[SC_423363_12]" , 3 )	--伊利：嗯，我懂，這才是你，那些低等幻影始終學不來的無私。
	sleep(30)

	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell( ANT , "[SC_423363_13]" , 3 )	--安特：...無私？不，精靈聖王的教誨，尊崇自然、順應萬物，捍衛族人生存的世界，這些都是我的私心...
	sleep(30)

	Yell( ANT , "[SC_423363_14]" , 3 )	--安特：我也...未曾想傷害妳。
	sleep(30)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)	--<伊利搖頭>
	Yell( ELY , "[SC_423363_15]" , 3 )	--伊利：是我的能力不夠，才無法與你站在同一線上，我只能不斷尋求更多的力量來守護住你捍衛的世界。
	sleep(40)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_16]" , 3 )	--伊利：但...實際上卻失態地被禁忌符文影響，甚至連累族人沉淪...如今有你的帶領，他們會尋回尊崇自然的天性。
	sleep(50)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ELY , "[SC_423363_17]" , 3 )	--伊利：我不懼怕死亡，但我擁有的自然之力已受禁忌符文影響太深，恐怕無法回歸自然懷抱，無法再與你一同守護未來。
	sleep(40)
	
	PlayMotion( ANT ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell( ANT , "[SC_423363_18]" , 3 )	--安特：我不會讓族人再因禁忌符文犧牲，讓我轉移妳身上的負面能量。
	sleep(30)

	Yell( ANT , "[SC_423363_19]" , 3 )	--安特：相信我。	
	sleep(10)

	PlayMotion( ELY ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	CastSpell( ANT , ELY , 495977)						--出現特效
	sleep(60)
	CastSpell( ANT , ANT , 493548)
	sleep(20)
	CastSpell( ANT , ANT , 494221)
	CastSpell( ELY , ELY , 493548)	
	sleep(20)
	DelObj(ANT)
	DelObj(ELY)

	local ANT2 = Lua_DW_CreateObj("flag" ,115912,780692,6,1)					--115884進安特2、旗子編號780692、6
	DisableQuest( ANT2 , true )									--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(ANT2 , false )
	WriteRoleValue( ANT2 ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ANT2,EM_RoleValue_Register+3,OwnerID())					--把演戲波多寫進演戲進安特2
	BeginPlot( ANT2, "LuaS_423363_CHECK" , 0 )							--掛安特2迴圈檢查--玩家不在就刪除進安特2
	
	local ELY2 = Lua_DW_CreateObj("flag" ,115913,780692,7,1)					--115884伊利2、旗子編號780692、7
	DisableQuest( ELY2 , true )									--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(ELY2 , false )
	WriteRoleValue( ELY2 ,EM_RoleValue_IsWalk , 1 )
	WriteRoleValue( ELY2,EM_RoleValue_Register+3,OwnerID())					--把演戲波多寫進演戲伊利2
	BeginPlot(ELY2, "LuaS_423363_CHECK" , 0 )							--掛伊利2迴圈檢查--玩家不在就刪除伊利2
	
	sleep(10)
	Yell( ELY2 , "[SC_423363_21]" , 3 )	--伊利：這一次，讓我幫你。
	sleep(30)
	Yell( ANT2 , "[SC_423363_22]" , 3 )	--安特：嗯，只要別太勉強自己。
	sleep(10)
	LuaFunc_MoveToFlag( ANT2 ,780693,4,0)
	SetFlag(player , 544266, 1)								--給予完成旗標
	sleep(20)
	DelObj(ELY2)
	DelObj(ANT2)
	DelObj(OwnerID())
	CancelBuff(player  , 507322)
	CancelBuff(player  , 507163)
	CancelBuff(player  , 503977)
	Setposbyflag(player  , 780692, 8 ) 							--傳送回原地

	WriteRoleValue( QBODO   , EM_RoleValue_Register+1 , 0 )
end	

function LuaS_423363_ANT_MOVE()
	LuaFunc_MoveToFlag( OwnerID(),780693,2,0)
end


function LuaS_423363_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	local QBODO =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	for i = 1, 180 , 1 do										--秒數配合劇情調整
		if	CheckID( player ) == false	or	ReadRoleValue( player , EM_RoleValue_IsDead ) == 1	or	CheckAcceptQuest(player ,423363)==false	then
			CancelBuff(player , 503977)
			CancelBuff(player , 507163)
			CancelBuff(player  , 507322)
			Setposbyflag(player  , 780692, 8 ) 						--傳送回原地
			DelObj(OwnerID())
			WriteRoleValue(QBODO , EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423363_CHECK()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲波多
	for i = 0 , 180 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end


--423365--(點擊腐朽樹精的枝枒，收集)
--接任務後可看到第一棵在眼前的枝枒--原本就種在地上CLIENT控制
function LuaS_423365_Acc()
	SetFlag(TargetID(), 544280, 0)	
end


--點擊物品前檢查
function LuaS_423365_99()
	if	(CheckAcceptQuest(OwnerID(),423365)==true )	and	( CheckCompleteQuest( OwnerID(),423365)==false) 	and	
		CheckFlag( OwnerID() , 544280) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			--目標正在忙碌中
		return false
		end
	end

	if	(CheckAcceptQuest(OwnerID(),423365)==true )	and	( CheckCompleteQuest( OwnerID(),423365)==false)	and	
		CheckFlag( OwnerID() , 544280 ) ==true	then
		return true
	end
end

function LuaS_423365_100()
	if 	CheckAcceptQuest( OwnerID() , 423365) == true	and	(CheckFlag( OwnerID(), 544280)==false)		and
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then	
		AddBuff( OwnerID() , 507164 , 1 , 60 )				--CLIENT判斷用		
		WriteRoleValue(TargetID() , EM_RoleValue_Register+1 , 2 )

		local BODO = Lua_DW_CreateObj("flag" ,115806,780693,5,1)				--115806波多
		DisableQuest( BODO , true )								--開關NPC頭上的任務提示以及對話劇情(true關閉)
		MoveToFlagEnabled(BODO , false )
		WriteRoleValue( BODO,EM_RoleValue_Register+2,OwnerID())				--把玩家寫進由演戲波多
		WriteRoleValue( BODO,EM_RoleValue_Register+3,TargetID())				--把枝枒寫進演戲波多
		BeginPlot( BODO, "Lua_423365_11" , 0 )						--掛演戲波多迴圈檢查--玩家不在就刪除演戲波多
		BeginPlot( BODO , "Lua_423365_LOOP" , 0 )
		return true
	end

	if 	CheckAcceptQuest( OwnerID() , 423365) == true	and	(CheckFlag( OwnerID(), 544280)==true)	and
		ReadRoleValue(OwnerID() ,EM_RoleValue_IsDead) == 0	then	
		local NPC = SearchRangeNPC ( OwnerID() , 50 )
		for i=0,table.getn(NPC)-1 do

		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115916	then		--闇
			if	CountBodyItem( OwnerID(), 207723 )<1	then	
--				CastSpell( OwnerID() ,OwnerID()  , 495976)
				AddBuff( OwnerID(), 507280, 1 , 7 )
				GiveBodyItem( OwnerID(), 207723 , 1 )	
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115917	then		--水
			if	CountBodyItem( OwnerID(), 207724 )<1	then	
				AddBuff( OwnerID(), 505067, 1 , 7 )
				GiveBodyItem( OwnerID(), 207724 , 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115918	 then		--風
			if	CountBodyItem( OwnerID(), 207725 )<1	then	
				CastSpell( OwnerID(), OwnerID()  , 495978)		
				GiveBodyItem( OwnerID(), 207725 , 1 )
				return true
			end
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) ==115919	 then		--火
			if	CountBodyItem( OwnerID(), 207726 )<1	then		
				CastSpell( OwnerID(), OwnerID()  , 493919)	
				GiveBodyItem( OwnerID(), 207726 , 1 )
				return true
			end
		end
	end
	ScriptMessage( OwnerID()   ,  OwnerID()   , 2 , "[SC_423365_7]" , 0 ) 		--你已經擁有
	ScriptMessage( OwnerID()   ,  OwnerID()   , 0 , "[SC_423365_7]" , 0 )
	return	false
	end
end

function Lua_423365_LOOP()
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local tree  = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		

	local TREEKING = Lua_DW_CreateObj("flag" ,115914,780693,6,1)				--115914聖樹(不顯像，只密頻)、旗子編號 780693 、6
	SetModeEX( TREEKING , EM_SetModeType_Mark , false )
	DisableQuest( TREEKING , true )							--開關NPC頭上的任務提示以及對話劇情(true關閉)
	MoveToFlagEnabled(TREEKING , false )
	WriteRoleValue( TREEKING,EM_RoleValue_Register+3,OwnerID())				--把演戲波多寫進演戲聖樹
	BeginPlot( TREEKING, "LuaS_423365_22" , 0 )						--掛聖樹迴圈檢查--演戲波多不在就刪除聖樹

	Tell(player ,TREEKING,"[SC_423365_0]")						--聖樹悄悄話：請給我協助的機會，畢竟...是我造成這個局面。
	sleep(30)
	Yell( OwnerID(), "[SC_423365_1]" , 3 )							--波多：好傢伙也有聽見嗎？
	sleep(30)
	Yell( OwnerID(),  "[SC_423365_2]" , 3 )						--波多：好樹在跟我們說話～
	sleep(30)
	Tell(player ,TREEKING,"[SC_423365_3]" )						--悄悄話：伊利雅爾在精靈王的幫助下不再深切懇求力量，也請讓我回應植物的悲嘆...
	sleep(20)
	AddBuff( player  , 507279, 1 , 7 )		
	Yell( OwnerID(),  "[SC_423365_4]" , 3 )						--波多：腐朽樹精的枝枒有一股力量浮出來了～
	sleep(30)
	if	CountBodyItem( player , 207722)<1	then			
		GiveBodyItem( player , 207722, 1 )			
	end
	Tell(player ,TREEKING,"[SC_423365_5]")						--悄悄話：我會將枝枒放在森林中自然之力最豐沛之處。
	sleep(30)
	Yell( OwnerID(),  "[SC_423365_6]" , 3 )						--波多：好傢伙，好樹都幫我們放好了，我們趕快去拿符文力量。
	SetFlag(player , 544280, 1)								--給予完成旗標，可看見其他的枝枒
	DelObj(OwnerID())
	CancelBuff(player  , 507164)								
	WriteRoleValue( tree  , EM_RoleValue_Register+1 , 0 )
end

function Lua_423365_11()
	local player =ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )		 
	local tree	 =ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	
	for i = 1, 60 , 1 do								--秒數配合劇情調整
		if	CheckID( player ) == false or ReadRoleValue( player , EM_RoleValue_IsDead ) == 1 or	CheckAcceptQuest(player ,423365)==false	then
			CancelBuff(player , 507164)
			SetFlag(player , 544280, 0)	
			DelObj(OwnerID())
			WriteRoleValue(tree, EM_RoleValue_Register+1 , 0 )
			break
		end
		sleep(10)
	end
end

function LuaS_423365_22()	
	local BODO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)		--演戲波多
	for i = 0 , 60 , 1 do
		if	CheckID(BODO) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end


--423366(使用物品、結合)207722、207723、207724、207725、207726、207727、207728
--完成任務執行判斷
function LuaS_423366_Afterquest()
	local k=CountBodyItem(TargetID(),207725) 
	DelBodyItem( TargetID(), 207725, k )

	local g=CountBodyItem(TargetID(),207726) 
	DelBodyItem( TargetID(), 207726, g )
end


function LuaS_423366_acc() 
	if	CountBodyItem(TargetID(),207722) < 1		then
		GiveBodyItem(TargetID(),207722,1) 
	end
	if	CountBodyItem(TargetID(),207723) < 1		then
		GiveBodyItem(TargetID(),207723,1) 
	end
	if	CountBodyItem(TargetID(),207724) < 1		then
		GiveBodyItem(TargetID(),207724,1) 
	end
	if	CountBodyItem(TargetID(),207725) < 1		then
		GiveBodyItem(TargetID(),207725,1) 
	end
	if	CountBodyItem(TargetID(),207726) < 1		then
		GiveBodyItem(TargetID(),207726,1) 
	end
end


function LuaS_423366_1()-- 填在207722
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207723) > 0	and	CountBodyItem(OwnerID(),207724) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207723,1) --del
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --合成
			UseItemDestroy() -- 刪掉使用中的
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--符文力量不齊全
		return false
		end
	else	
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--必須擁有207727
	return false
	end
end

function LuaS_423366_2() --填在207723
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207724) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --合成
			UseItemDestroy() -- 刪掉使用中的
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--符文力量不齊全
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--必須擁有207727
	return false
	end
end

function LuaS_423366_3() --填在207724
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207725) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --合成
			UseItemDestroy() -- 刪掉使用中的
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--符文力量不齊全
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--必須擁有207727
	return false	
	end
end

function LuaS_423366_4() --填在207725
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207724) > 0	and	CountBodyItem(OwnerID(),207726) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207726,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --合成
			UseItemDestroy() -- 刪掉使用中的
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--符文力量不齊全
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--必須擁有207727
	return false	
	end
end

function LuaS_423366_5() --填在207726
	if	CountBodyItem(OwnerID(),207727) > 0	then
		if	CountBodyItem(OwnerID(),207722) > 0	and	CountBodyItem(OwnerID(),207723) > 0 and
			CountBodyItem(OwnerID(),207724) > 0	and	CountBodyItem(OwnerID(),207725) > 0	then
			DelBodyItem(OwnerID(),207722,1) --del
			DelBodyItem(OwnerID(),207723,1)
			DelBodyItem(OwnerID(),207724,1)
			DelBodyItem(OwnerID(),207725,1)
			DelBodyItem(OwnerID(),207727,1)
			GiveBodyItem(OwnerID(),207728,1) --合成
			UseItemDestroy() -- 刪掉使用中的
			return true
		else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_1]",0)	--符文力量不齊全
		return false
		end
	else
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_423366_2]",0)		--必須擁有207727
	return false
	end
end