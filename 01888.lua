
function LuaS_423271_115544()
	LoadQuestOption( OwnerID() )	
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==false)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_1]","LuaS_423271_1",0)	
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_2]","LuaS_423271_2",0)		
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_3]","LuaS_423271_3",0)	
		end
	end
	
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==true)		then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_9]","LuaS_423271_4",0)	
		end
	end
end

function LuaS_423271_1()
	SetSpeakDetail(OwnerID(),"[SC_423271_4]")				
	SetFlag( OwnerID() , 543764 , 1 )						--給旗標
end

function LuaS_423271_2()
	SetSpeakDetail(OwnerID(),"[SC_423271_5]")				
	SetFlag( OwnerID() , 543764 , 1 )						--給旗標
end

function LuaS_423271_3()
	SetSpeakDetail(OwnerID(),"[SC_423271_6]")				
	SetFlag( OwnerID() , 543764 , 1 )						--給旗標
end

function LuaS_423271_4()
	SetSpeakDetail(OwnerID(),"[SC_423271_7]")		
end

function LuaS_423271_115541()
	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),423271)==true )and( CheckCompleteQuest( OwnerID(),423271)==false) then
		if	(CheckFlag( OwnerID(),543764)==true)	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423271_10]","LuaS_423271_115541_1",0)	
		end
	end
end

function LuaS_423271_115541_1()
	SetSpeakDetail(OwnerID(),"[SC_423271_8]")
	SetFlag( OwnerID() , 544031, 1 )						--給看不見旗標

end
-------------------------------------------------------------------

--function LuaS_423274_1()	
--	LoadQuestOption( OwnerID() )
--	if 	(CheckAcceptQuest(OwnerID(),423274)==true )and( CheckCompleteQuest( OwnerID(),423274)==false) then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_1]","LuaS_423274_2",0)	
--	end
--end

function LuaS_423274_2()
	SetSpeakDetail(OwnerID(),"[SC_423274_2]")					
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_3]","LuaS_423274_3",0)	
end

function LuaS_423274_3()
	SetSpeakDetail(OwnerID(),"[SC_423274_4]")				--
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_5]","LuaS_423274_4",0)	--
end

function LuaS_423274_4()
	SetSpeakDetail(OwnerID(),"[SC_423274_6]")				--
	SetFlag( OwnerID() , 543910 , 1 )					--給旗標
end

------------------------------------------------------------------

function LuaS_423272_115543()
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),423272)==true )and( CheckCompleteQuest( OwnerID(),423272)==false) 	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423272_0]","LuaS_423272_2",0) 		
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423272_0]","LuaS_423272_1",0) 
		end	
	end
	if 	(CheckAcceptQuest(OwnerID(),423274)==true )and( CheckCompleteQuest( OwnerID(),423274)==false) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423274_1]","LuaS_423274_2",0)	
	end

	if	(CheckAcceptQuest(OwnerID(),423275)==true )and( CheckCompleteQuest( OwnerID(),423275)==false) and	CheckFlag(OwnerID() , 544040) == false 	then
		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_2",0) 		
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_1",0) 
		end	
	end
end


function LuaS_423272_1()
	SetSpeakDetail(OwnerID(),"[SC_423272_1]")
end


function LuaS_423272_2()
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register , 2 )
	BeginPlot(TargetID(), "LuaS_423272_3" , 0 )
end

function LuaS_423272_3()
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423272) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543765, 1 )							
			AddBuff(Party[i] , 506804, 100 , -1 )  						
		end
	end
	local OBALI = LuaFunc_CreateObjByOBj(115545, OwnerID() )			--出現演戲的奧貝利
	DisableQuest(OBALI,true )
	WriteRoleValue(OBALI, EM_RoleValue_Register+1, OwnerID() )
	WriteRoleValue(OBALI, EM_RoleValue_Register+3, TargetID() )

	BeginPlot(OBALI, "LuaS_423272_Range_CHECK" , 0 )			
	BeginPlot(OBALI, "LuaS_423272_4" , 0 )
end

function LuaS_423272_4()
--OwnerID是115545
	local playerTarget = ReadRoleValue(OwnerID(),EM_RoleValue_Register+3)	
	local Party = {}
	local Party = LuaFunc_PartyData(playerTarget )

	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 400 )		--（搜尋場上的墨斐拉）
	local MO = LuaFunc_CreateObjByOBj(115559, QQMO)				--出現演戲的墨斐拉
	DisableQuest(MO,true )
	WriteRoleValue (MO, EM_RoleValue_Register+1, OwnerID() )

	BeginPlot(MO, "LuaS_423272_MO_CHECK" , 0 )				
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled(MO, false )

	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423272) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			Tell(Party[i],QQOBALI,"[SC_423272_2]")
			sleep(20)
			Tell(Party[i],QQOBALI,"[SC_423272_3]")	
			sleep(20)
		end
	end

	AdjustFaceDir(MO, QQOBALI, 0 )
	sleep(10)
	Yell(MO, "[SC_423272_4]" , 3 ) 				--奧狄斯…你的意思是？
	AdjustFaceDir(QQOBALI, MO, 0 )
	sleep(20)
	Yell(OwnerID(), "[SC_423272_5]" , 3 ) 				--…真正的羅嚴.傑爾大人已經死了。
	sleep(20)
	Yell(MO, "[SC_423272_6]" , 3 ) 				--奧狄斯，你在開玩笑？
	sleep(30)
	Yell(OwnerID(), "[SC_423272_7]" , 3 ) 				--少爺…請您冷靜
	sleep(20)
	Yell(MO, "[SC_423272_8]" , 3 ) 				--…我明白…喜愛血腥
	sleep(20)
	Yell(MO, "[SC_423272_9]" , 3 ) 				--如果他取得爵士之位
	sleep(30)
	Yell(OwnerID(), "[SC_423272_10]" , 3 ) 			--少爺…我了解您的個性
	sleep(30)
	Yell(OwnerID(), "[SC_423272_11]" , 3 )	 		--請您答應屬下
	sleep(30)
	BeginPlot( OwnerID() , "LuaS_423272_Finish" , 0 )
	sleep(10)
	Delobj( MO )
	writerolevalue(QQOBALI , EM_RoleValue_Register, 0 )
	Delobj( OwnerID() )
end


function LuaS_423272_Range_CHECK()
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423272) == true	and
				CheckFlag( Group[i] , 543765) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QQOBALI, EM_RoleValue_Register, 0 )
	Delobj( OwnerID() )
end

function LuaS_423272_Player_CHECK()	--BUFF
	if	(CheckAcceptQuest(OwnerID(),423272)==false )	then
		if 	CheckBuff( OwnerID(), 506804) == true	then
			CancelBuff( OwnerID() , 506804)  
		end
		return false
	end

	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115545	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423272_Player_CHECK_FINAL()	--BUFF
	CancelBuff( OwnerID() , 506804)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543765, 0 )
end

function LuaS_423272_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423272) == true	and
			CheckFlag( Gp[i] , 543765) == true		then
			SetFlag(Gp[i] , 543994, 1 )
			CancelBuff( Gp[i] , 506804)
		end
	end
end

function LuaS_423272_MO_CHECK()	
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	for i = 0 , 100 , 1 do
		if	CheckID(QQOBALI) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

------------------------------------------------------------------

--function LuaS_423275_115543()
--	LoadQuestOption( OwnerID() )
--	if	(CheckAcceptQuest(OwnerID(),423275)==true )and( CheckCompleteQuest( OwnerID(),423275)==false) 	then
--		if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0)	 then
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_2",0) 		
--		else
--			AddSpeakOption(OwnerID(),TargetID(),"[SC_423275_0]","LuaS_423275_1",0) 
--		end	
--	end
--end


function LuaS_423275_1()
	SetSpeakDetail(OwnerID(),"[SC_423275_1]")
end


function LuaS_423275_2()
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register+8 , 2 )
	BeginPlot(TargetID(), "LuaS_423275_3" , 0 )
end

function LuaS_423275_3()
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423275) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 543995, 1 )							
			AddBuff(Party[i] , 506847, 100 , -1 )  						
		end
	end
	local OBALI = LuaFunc_CreateObjByOBj(115566, OwnerID() )			--出現演戲的奧貝利
	DisableQuest(OBALI,true )
	WriteRoleValue(OBALI, EM_RoleValue_Register+1, OwnerID() )
	WriteRoleValue(OBALI, EM_RoleValue_Register+2, TargetID() )
	BeginPlot(OBALI, "LuaS_423275_Range_CHECK" , 0 )			
	BeginPlot(OBALI, "LuaS_423275_4" , 0 )
end

function LuaS_423275_4()
--OwnerID是OBALI 115566
	local playerTarget= ReadRoleValue(OwnerID(),EM_RoleValue_Register+2)	
	local Party = {}
	local Party = LuaFunc_PartyData(playerTarget)

	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 400 )		--（搜尋場上的墨斐拉）
	local MO = LuaFunc_CreateObjByOBj(115567, QQMO)				--出現演戲的墨斐拉
	DisableQuest(MO,true )
	WriteRoleValue (MO, EM_RoleValue_Register+1, OwnerID() )

	BeginPlot(MO, "LuaS_423275_MO_CHECK" , 0 )				
	MoveToFlagEnabled( OwnerID() , false )
	MoveToFlagEnabled(MO, false )

	sleep(10)
	AdjustFaceDir(QQOBALI, MO, 0 )
	Yell(OwnerID(), "[SC_423275_2]" , 3 ) 					--少爺…
	sleep(20)
	AdjustFaceDir(MO, QQOBALI, 0 )
	Yell(MO, "[SC_423275_3]" , 3 ) 					--剛才，你對[$playername]說的話
	sleep(20)
	Yell(OwnerID(), "[SC_423275_4]" , 3 ) 					--不…少爺，屬下很高興
	sleep(20)
	Yell(MO, "[SC_423275_5]" , 3 ) 					--下令處死我的人不是他
	sleep(30)
	Yell(OwnerID(), "[SC_423275_6]" , 3 ) 					--您還記得之前
	sleep(40)
	Yell(OwnerID(), "[SC_423275_7]" , 3 ) 					--當時的大人年輕氣盛
	sleep(40)
	Yell(MO, "[SC_423275_8]" , 3 ) 					--奧狄斯…
	sleep(20)
	Yell(OwnerID(), "[SC_423275_9]" , 3 ) 					--您不是養子，
	sleep(20)
	Yell(MO, "[SC_423275_10]" , 3 ) 					--他從來不說…
	sleep(20)
	Yell(OwnerID(), "[SC_423275_11]" , 3 )	 			--大人感到懊悔，
	sleep(30)
	Yell(MO, "[SC_423275_12]" , 3 ) 					--…他始終是我的父親。
	sleep(20)
	Yell(OwnerID(), "[SC_423275_13]" , 3 ) 				--您…不怨恨嗎？
	sleep(20)
	PlayMotion( MO,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Yell(MO, "[SC_423275_14]" , 3 ) 					--相處的那幾年我能感受
	sleep(30)
	Yell(OwnerID(), "[SC_423275_15]" , 3 )	 			--…謝謝，大人一定會很高興，
	sleep(30)
	Yell(OwnerID(), "[SC_423275_16]" , 3 )	 			--為了大人，請您好好照顧自己
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(30)
	Yell(MO, "[SC_423275_17]" , 3 ) 					--奧狄斯，別激動，你的身體…
	sleep(20)
	Yell(OwnerID(), "[SC_423275_18]" , 3 )	 			--不要緊…沒事了
	sleep(40)
	Yell(OwnerID(), "[SC_423275_19]" , 3 )	 			--傑爾一族的英雄血脈
	sleep(30)
	Yell(OwnerID(), "[SC_423275_20]" , 3 )	 			--再見了…墨斐拉	
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DEAD)
--sleep(20)
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423275) == true		and
			GetDistance(Party[i] , OwnerID() ) < 250			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			ScriptMessage(Party[i]  , Party[i]  , 2 , "[SC_423275_21]" , 0 )	--奧狄斯．貝利緩緩垂下無力的身
			ScriptMessage( Party[i]  , Party[i] , 0 , "[SC_423275_21]" , 0 )
			sleep(20)
		end
	end
	BeginPlot( OwnerID() , "LuaS_423275_Finish" , 0 )
	sleep(20)
	Delobj( MO )
	writerolevalue(QQOBALI, EM_RoleValue_Register+8, 0 )
	Delobj( OwnerID() )
end


function LuaS_423275_Range_CHECK()
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 250)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423275) == true	and
				CheckFlag( Group[i] , 543995) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(QQOBALI, EM_RoleValue_Register+8, 0 )
	Delobj( OwnerID() )
end

function LuaS_423275_Player_CHECK()
	if	(CheckAcceptQuest(OwnerID(),423275)==false )	then
		if 	CheckBuff( OwnerID(), 506847) == true	then
			CancelBuff( OwnerID() , 506847)  
		end
		return false
	end
	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 250)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115566	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423275_Player_CHECK_FINAL()
	CancelBuff( OwnerID() , 506847)
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 543995, 0 )
end

function LuaS_423275_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 250)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423275) == true	and
			CheckFlag( Gp[i] , 543995) == true		then
			SetFlag(Gp[i] , 544040, 1 )
			CancelBuff( Gp[i] , 506847)
		end
	end
end

function LuaS_423275_MO_CHECK()	
	local QQOBALI = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)
	for i = 0 , 100 , 1 do
		if	CheckID(QQOBALI) == false	then
			break
		end
		sleep( 20 )
	end
	Delobj( OwnerID() )
end

------------------------------------------------------------------

function LuaS_115569_99()	--奧狄斯．貝利的初始劇情
	LuaP_DW_Dead()
	--LuaP_Crouch()
	--LuaP_Crafting()
	--LuaP_Sitting()
end



function LuaS_423276_0()	
	LoadQuestOption( OwnerID() )	--OwnerID是玩家、TargetID是115542
	if (CheckAcceptQuest(OwnerID(),423276)==true )and( CheckCompleteQuest( OwnerID(),423276)==false) and	CheckFlag( OwnerID() , 544041) ==false	then
		if (ReadRoleValue( TargetID() , EM_RoleValue_Register+5 ) == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423276_0]","LuaS_423276_2",0) --我來焚化他的軀體吧。
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423276_0]","LuaS_423276_1",0) --我來焚化他的軀體吧。
		end	
	end
end

function LuaS_423276_1()
	SetSpeakDetail(OwnerID(),"[SC_423276_1]")	--讓我再多看他幾眼…他為我的家族受了許多磨難…
end

function LuaS_423276_2()
--	say(TargetID(),"333")	--墨斐拉
--	say(OwnerID(),"365")	--玩家
	closespeak(OwnerID())
	WriteRoleValue(TargetID() , EM_RoleValue_Register+5 , 2 )
	BeginPlot(TargetID(), "LuaS_423276_4" , 0 )
end

function LuaS_423276_4()
--OwnerID是墨斐拉115542
	BeginPlot(OwnerID(), "LuaS_423276_Range_CHECK" , 0 )	
	local OBALI= LuaFunc_SearchNPCbyOrgID( OwnerID() , 115569, 300)		--（搜尋場上的屍體）
	local Party = {}
	local Party = LuaFunc_PartyData(TargetID())
	for i = 1 , Party[0] , 1 do
		if 	CheckAcceptQuest( Party[i] , 423276) == true		and
			GetDistance(Party[i] , OwnerID() ) < 300			and 
			ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then
			SetFlag(Party[i] , 544042, 1 )		
			GiveBodyItem(Party[i], 207349, 1 )			--火把					
			AddBuff(Party[i] , 506910, 100 , -1 )  			--演戲檢查用
			AddBuff(Party[i] , 506886, 100 , 30 )  			--顯示告知玩家用(30秒內要放火)	
		end
	end

	local Time = 0
	for k = 1, 35 , 1 do							--時間到就回復原狀
		Time = Time + 1
			if	Time>30		then
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 0 )
				local Party = LuaFunc_PartyData(TargetID())
				for i = 1 , Party[0] , 1 do
					if 	CheckBuff( Party[i], 506910 ) == true then	
						CancelBuff( Party[i] , 506886)  
						CancelBuff( Party[i] , 506910)
						DelBodyItem(Party[i], 207349, 1 )
						SetFlag(Party[i] , 544042, 0 )
						ScriptMessage(Party[i]  , Party[i] , 2 , "[SC_423276_5]" , 0 )--時間超過，任務失敗！
						ScriptMessage(Party[i]  , Party[i] , 0 , "[SC_423276_5]" , 0 )--時間超過，任務失敗！
					end
				end	
				break							
			end
			if 	(ReadRoleValue( OBALI , EM_RoleValue_Register+1 ) == 2) 	then
				for i = 1 , Party[0] , 1 do
					if 	CheckBuff( Party[i], 506910 ) == true	then	
						SetFlag(Party[i] , 544043, 1 )	
					end
				end		
				BeginPlot(OBALI , "LuaS_423276_5" , 0 )	
				break		
			end
		sleep(10)
	end	
end

function LuaS_423276_5()
--OBALI 是OwnerID	
	sleep(5)
	local QQMO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115542, 300 )		--（搜尋場上的墨斐拉）
	local MO = LuaFunc_CreateObjByOBj(115568, QQMO)				--出現演戲的墨斐拉
	MoveToFlagEnabled(MO , false )
	DisableQuest(MO,true )
--	WriteRoleValue(MO , EM_RoleValue_Register+1, QQMO )
	--BeginPlot(MO , "LuaS_423276_Range_CHECK" , 0 )	
	PlayMotionEX(MO,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)	
	Yell(MO, "[SC_423276_2]" , 3 ) 				--奧貝利…你為我的家族貢獻出一生…
	sleep(30)
	Yell(MO, "[SC_423276_3]" , 3 ) 				--受盡折磨的犧牲不會白費…
	sleep(20)
	Yell(MO, "[SC_423276_4]" , 3 ) 				--我會記住你的告誡，之後…讓敵人付出代價！
	sleep(50)
	BeginPlot( OwnerID(), "LuaS_423276_Finish" , 0 )
	PlayMotion( MO , ruFUSION_ACTORSTATE_CROUCH_END)
	sleep(40)
	Delobj( MO )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1, 0 )
	writerolevalue(QQMO , EM_RoleValue_Register+5, 0 )
End

function LuaS_423276_Range_CHECK()
--OwnerID是墨斐拉115542
--	local QQMO = ReadRoleValue(OwnerID(),EM_RoleValue_Register+1)	
	local Group = {}
	local Num
	for i = 0 , 100 , 1 do
		Group = SearchRangePlayer(OwnerID() , 300)
		Num = 0
		for i=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[i], 423276) == true	and
				CheckFlag( Group[i] , 544042) == true		then
				Num = Num + 1
			end
		end
		if	Num == 0		then
			break
		end
		sleep(20)
	end
	writerolevalue(OwnerID(), EM_RoleValue_Register+5, 0 )
end

function LuaS_423276_Player_CHECK()	--BUFF
--OwnerID是PLAYER
	if	(CheckAcceptQuest(OwnerID(),423276)==false )	then
		if 	CheckBuff( OwnerID(), 506910 ) == true	then
			CancelBuff( OwnerID() , 506910 )  
		end
		if 	CheckBuff( OwnerID(), 506886) == true	then
			CancelBuff( OwnerID() , 506886)  
		end
		SetFlag(OwnerID(), 544043,0 )	
		SetFlag(OwnerID(), 544042,0 )
		return false
	end

	local ET = {}
	ET = SearchRangeNPC(OwnerID() , 300)
	for i=0,table.getn(ET)-1 do
		if	ReadRoleValue(ET[i] , EM_RoleValue_OrgID) == 115569	then
			return false
		end
		if	i == table.getn(ET)	then
			return true
		end
	end
end

function LuaS_423276_Player_CHECK_FINAL()	--BUFF
	CancelBuff( OwnerID() , 506910)
	CancelBuff( OwnerID()  , 506886) 
	DelBodyItem(OwnerID(), 207349, 1 )
	ScriptMessage(OwnerID() , OwnerID() , 2 , "[SC_423177_10]" , 0 )	--距離太遠，任務失敗！
	ScriptMessage( OwnerID() , OwnerID(), 0 , "[SC_423177_10]" , 0 )
	SetFlag(OwnerID() , 544042, 0 )
	SetFlag(OwnerID(), 544043, 0 )
end

function LuaS_423276_Finish()
	local Gp = {}
	Gp = SearchRangePlayer(OwnerID() , 300)
	for i=0,table.getn(Gp)-1 do
		if	CheckAcceptQuest( Gp[i], 423276) == true	and
			CheckFlag( Gp[i] , 544042) == true		then
			SetFlag(Gp[i] , 544041, 1 )
			SetFlag(Gp[i] , 544042, 1 )
			SetFlag(Gp[i] , 544043, 0 )
			CancelBuff( Gp[i] , 506910)
		end
	end
end

--點擊物品前：
function Lua_423276_FIRE_before()
	if	(CheckAcceptQuest(OwnerID(),423276)==true )and( CheckCompleteQuest( OwnerID(),423276)==false) and	CheckFlag( OwnerID() , 544041) ==false	then
		if 	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)	then
			if	 CountBodyItem(OwnerID(),207349) > 0 	then
				if	CheckBuff( OwnerID(), 506886) == true	then
					return true
				else
					return false
				end
			end
			if	 CountBodyItem(OwnerID(),207349) <1	then
				ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423276_6]",0) --你身上沒有焚化之火！
				ScriptMessage(OwnerID(),OwnerID(), 0, "[SC_423276_6]",0) --你身上沒有焚化之火！
				return false
			end
		else
		ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0) --目標正在忙碌中
		return false
		end
	end
end

--點擊物品後：
function Lua_423276_FIRE()
	local Party = {}
	local Party = LuaFunc_PartyData(OwnerID())
	for i = 1 , Party[0] , 1 do
			if 	CheckAcceptQuest( Party[i] , 423276) == true	and	CheckBuff( Party[i],506886) == true	and
				ReadRoleValue(Party[i] ,EM_RoleValue_IsDead) == 0	then	
				DelBodyItem(Party[i], 207349, 1 )			--火把	
				CancelBuff( Party[i] , 506886)	
				BeginPlot( TargetID() , "Lua_423276_LOOP" , 0 )
			else
				DelBodyItem(Party[i] ,207349, 1 )			--火把	
				CancelBuff(Party[i] , 506910)
				ScriptMessage (Party[i] ,Party[i] , 2 , "[SC_423276_5]" , 0 )--時間超過，任務失敗！
				ScriptMessage(Party[i] ,Party[i] ,  0 , "[SC_423276_5]" , 0 )--時間超過，任務失敗！
			end
	end
--	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 2 )
	return true
end

function Lua_423276_LOOP()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 )
	BeginPlot( OwnerID() , "Lua_423276_FIRE_LOOP" , 0 )
	return true
end

function Lua_423276_FIRE_LOOP()	
	local Fire = LuaFunc_CreateObjByObj (115570, OwnerID())		
	Lua_ObjDontTouch( Fire ) 
	sleep(20)
	AddBuff( Fire , 503605 , 1 , -1 )
	sleep(50)
	AddBuff( Fire , 502724 , 1 , -1 )
	sleep(50)
	DelObj(Fire)

end
