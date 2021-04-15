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

	SetFlag(ply, FinishFlagID, 0)	--���ե�
	ActorArray[1] = CreateObjByFlag( 121733, FlagID, 4, 1 )		-- �]��
	ActorArray[2] = CreateObjByFlag( 121734, FlagID, 5, 1 )		-- �i��

	CallPlot( tar, "ks_QuestAddBuffEx", QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray  )	--�d������Ϊ��ˬd�禡

	sleep(5)
	AddToPartition( ActorArray[1], 0 )	
	AddToPartition( ActorArray[2], 0 )
	ks_ActSetMode( ActorArray[1] )	
	ks_ActSetMode( ActorArray[2] )
	
	sleep(5)
	--��t�}�l
	Say( ActorArray[1], "[Z953_Q5_1]") 						--���������ڪ��A�G�a
	SetDefIdleMotion( ActorArray[1], ruFUSION_MIME_BUFF_SP01)			--�� �I�k
	CastSpell( ActorArray[1], ActorArray[2], 850554)
	sleep(35)
	Say( ActorArray[2], "[Z953_Q5_2]") 						--��~�i�몺�A�G�A���a�����ڸѰ�
	SetDefIdleMotion( ActorArray[2], ruFUSION_MIME_IDLE_COMBAT_1H)		--�� �h�W
	sleep(10)
	
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_EMOTE_ROFL)
	sleep(30)	
	Say( ActorArray[2], "[Z953_Q5_3]") 						--��ڰڰڰڰ�!!
	PlayMotion(ActorArray[2], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
	sleep(10)	
	NPCDead(ActorArray[2], ActorArray[1] )
	sleep(5)
	
	Say( ActorArray[1], "[Z953_Q5_4]") 						--������!!!�Z�H���k�@��!!
	PlayMotion(ActorArray[1], ruFUSION_ACTORSTATE_EMOTE_LAUGH)	
	sleep(20)
				
	for i=1, #ActorArray do
		DelObj(ActorArray[i])
	end
		
	ks_QuestEndEx( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray ) 	--������t
end