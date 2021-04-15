function Q425845_Test()
	local ply = OwnerID()
	local tar = TargetID()
	
	local QuestID = 425845
	local FinishFlagID= 547363
	
	local questStartFlag = ReadRoleValue( tar, EM_RoleValue_Register1 ) 
	
	if CheckAcceptQuest( ply, QuestID ) == true and CheckFlag( ply, FinishFlagID ) == false then
		questStartFlag = ReadRoleValue( tar, EM_RoleValue_Register1 ) 
		
		if questStartFlag > 0 then
			SetSpeakDetail( ply, "[Z953_Q5_QUESTLOCK]" )		
		elseif questStartFlag == 0 then			
			SetSpeakDetail( ply, "[Z953_Q5_QUESTOPEN]" )
			AddSpeakOption( ply, tar, "[Z953_Q5_QUESTSTART]", "Q425845_initQuest", 0)		
		end
	else
		LoadQuestOption( ply );	
	end
end


function Q425845_initQuest()
	local ply = OwnerID()
	local tar = TargetID()
	
	local QuestID = 425845
	local FinishFlagID= 547363	
	
	CloseSpeak( ply )	
	WriteRoleValue( tar, EM_RoleValue_Register1, 999 )	-- lock quest NPC	
	
	callPlot( tar, "Q425845_startQuest", ply, tar )
end


function Q425845_startQuest(ply, tar)
	
	local QuestID = 425845
	local FinishFlagID = 547363
	local CheckBuffID = 623931
	local CheckRange = 300
		
	local ActorArray = {}				
	local FlagID = 781255			

	local gameCount = 0

	SetFlag(ply, FinishFlagID, 0)	--測試用
	ActorArray[1] = CreateObjByFlag( 121733, FlagID, 4, 1 )		-- 魔王
	ActorArray[2] = CreateObjByFlag( 121734, FlagID, 5, 1 )		-- 勇者

	CallPlot( tar, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )	--範圍看戲用的檢查函式

	sleep(5)
	AddToPartition( ActorArray[1], 0 )	
	AddToPartition( ActorArray[2], 0 )
	ks_ActSetMode( ActorArray[1] )	
	ks_ActSetMode( ActorArray[2] )
	
	sleep(5)
	--表演開始
	Say( ActorArray[1], "[Z953_Q5_1]") 						--哈哈接受我的詛咒吧
	SetDefIdleMotion( ActorArray[1], ruFUSION_MIME_BUFF_SP01)			--表情 施法
	CastSpell( ActorArray[1], ActorArray[2], 850554)
	sleep(35)
	Say( ActorArray[2], "[Z953_Q5_2]") 						--不~可恨的詛咒，玩家快幫我解除
	SetDefIdleMotion( ActorArray[2], ruFUSION_MIME_IDLE_COMBAT_1H)		--表情 痛苦
	sleep(10)
	
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_ROFL)
	sleep(30)	
	Say( ActorArray[2], "[Z953_Q5_3]") 						--嗚啊啊啊啊啊!!
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
	sleep(10)	
	NPCDead(ActorArray[2], ActorArray[1] )
	sleep(5)
	
	Say( ActorArray[1], "[Z953_Q5_4]") 						--哈哈哈!!!凡人難逃一死!!
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	
	sleep(20)
				
	for i=1, #ActorArray do
		DelObj(ActorArray[i])
	end
		
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) 	--結束表演
end