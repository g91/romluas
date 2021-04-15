
--======================================================================================================
--挖掘遺跡工作者
--======================================================================================================
function LuaZ14WS_424151_accept()
	writerolevalue( TargetID() , EM_RoleValue_PID , 0 )
end
	

function LuaZ14WS_118046_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424151)==true			then
		if	CountBodyItem(OwnerID(),209425)>0				then
				if		CountBodyItem(OwnerID(),209455)<5		then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_424151_0]","LuaZ14WS_118046_1",0)
						--你好，辛苦的考古工作者。
				else
						ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424151_1]", 0 )	
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424151_1]", 0 )
						--你已完成此任務。
				end
		else
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424151_2]", 0 )	
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424151_2]", 0 )
				--你身上的任務物品數量不足。
		end
	end
end 


function LuaZ14WS_118046_1()
--在最後一句對話，即開啟劇情演出前，呼叫檢查掛演出的npc是否忙碌的function
	SetSpeakDetail(OwnerID(),"[SC_423279_8]")
	--你是誰？
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424151_3]","LuaZ14WS_118046_CheckBusy",0)
	--我是冒險者，接受這裡主事者的委託，將獎金發放給你們。
end


function LuaZ14WS_118046_CheckBusy()	
--檢查掛演出的npc是否忙碌的function，以pid為判斷值，呼叫劇情演出function
--判斷掛劇情演出的npc是否忙碌中，如果不忙則演出劇情，忙則送他一句話，請他等待，掛在連接演出script的當段函式
--Say(OwnerID(),"0..01")
--Say(TargetID(),"T..T1")
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaZ14WS_118046_2" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--目標正在忙碌中。
	end
end


function LuaZ14WS_118046_2()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	NPCSay(OwnerID(),"[SC_424151_4]")	
	--喔，謝謝你。
	GiveBodyItem(TargetID(),209455,1)
	DelBodyItem(TargetID(),209425,1)
	Sleep(50)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	LuaFunc_ResetObj( OwnerID())
	DisableQuest( OwnerID() , false )
	
end

 
--======================================================================================================
--424152飲水需求
--======================================================================================================
 
function LuaZ14WS_424152()
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",30 )
end


--(2)執行BeginCastBar判斷

function LuaZ14WS_424152_1() --玩家
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if	CheckAcceptQuest(OwnerID(),424152)==true		then
		if	CountBodyItem(OwnerID(),209456) <5		then
			if	CountBodyItem(OwnerID(),209426) >0		then
				if 	BeginCastBarEvent( O_ID, T_ID,"[SC_424152_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ14WS_424152_2" ) ~= 1 then
				--更換[209426]......
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
					return
					
				end
			else
				ScriptMessage( O_ID, O_ID, 2,"[SC_424151_2]", 0 )
				ScriptMessage( O_ID, O_ID, 0,"[SC_424151_2]", 0 )
			end
		end
	else
		ScriptMessage( O_ID, O_ID,1,"[SC_Z16_REQUIRE]",0)--沒有符合的委託任務
		ScriptMessage( O_ID, O_ID,0,"[SC_Z16_REQUIRE]",0)--沒有符合的委託任務

	end	
end


--(3)執行BeginCastBar後之結果


function LuaZ14WS_424152_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			GiveBodyItem( OwnerID() , 209456 , 1 )
			DelBodyItem(OwnerID(),209426,1)
			Beginplot(T_ID,"LuaZ14WS_424152_3",0)

		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end
 
function LuaZ14WS_424152_3()
	DisableQuest(OwnerID(), true )
	--LuaFunc_ResetObj( OwnerID())
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",0 )
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_4",30 )
	SLEEP(100)
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",30 )
	DisableQuest(OwnerID(), false )

end

function LuaZ14WS_424152_4()
	ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424152_1]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424152_1]", 0 );
	--能源充足，不需更換能晶。
	SetPlot( TargetID(),"touch","LuaZ14WS_424152_4",0 )
end


--======================================================================================================
--424176精靈的防衛手段
--======================================================================================================
 
function LuaZ14WS_424176()
	SetPlot( OwnerID(),"touch","LuaZ14WS_424176_1",50 )
end

--(2)執行BeginCastBar判斷

function LuaZ14WS_424176_1() --玩家
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if	CheckAcceptQuest(OwnerID(),424176)==true		then
		if	CountBodyItem(OwnerID(),209459) <5				then
			if	CountBodyItem(OwnerID(),209449) >0			then
				if BeginCastBarEvent( O_ID, T_ID,"[SC_424176_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ14WS_424176_2" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
					return	
				end
			else
				ScriptMessage( O_ID, O_ID, 1,"[SC_424151_2]", 0 )
				ScriptMessage( O_ID, O_ID, 0,"[SC_424151_2]", 0 )
			end
		end
	else
	ScriptMessage( O_ID, O_ID,1,"[SC_Z16_REQUIRE]",0)--沒有符合的委託任務
	ScriptMessage( O_ID, O_ID,0,"[SC_Z16_REQUIRE]",0)--沒有符合的委託任務
	end	
end

--(3)執行BeginCastBar後之結果


function LuaZ14WS_424176_2(ObjID, CheckStatus)   -- <---() 內 參數一定要有
	local O_ID = OwnerID() 		-- 玩家
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			GiveBodyItem( OwnerID() , 209459 , 1 )
			DelBodyItem(OwnerID(),209449,1)
			Beginplot(T_ID,"LuaZ14WS_424176_3",0)
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

function LuaZ14WS_424176_3()
	DisableQuest(OwnerID(), true )
	LuaFunc_ResetObj( OwnerID())
	DisableQuest(OwnerID(), false )

end
 
 
--======================================================================================================
--118064
--======================================================================================================

function LuaZ14WS_118064_BORN()
	while 1 do
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_DAZED_BEGIN,ruFUSION_ACTORSTATE_DAZED_LOOP)	
	NPCsay(OwnerID(),"[SC_118064_0]")
	--[118063]那個傻瓜，就這樣離開我們了。
	sleep(60)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DAZED_END)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	NPCsay(OWnerID(),"[SC_118064_1]")
	--如果他沒來這裡擔任收蛛絲的工作，也許還活著......
	NPCsay(OWnerID(),"[SC_118064_2]")
	sleep(50)
	--哎，該工作了。
	sleep(60)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
	NPCsay(OWnerID(),"[SC_118064_3]")
	--收購蛛絲、收購蛛絲啊！
	sleep(600)
	end
end

function LuaZ14WS_118064_speak()
	LoadQuestOption(OwnerID())
		AddSpeakOption(OwnerID(),TargetID(),"[SC_118064_4]","LuaZ14WS_118064_speak_1",0)
		--(問問他，[118063]不見後，你要交給[118063]怎麼辦？)
end

function LuaZ14WS_118064_speak_1()
		SetSpeakDetail(OwnerID(),"[SC_118064_5]")
		--[118063]再也不會回來了，請懷著哀禱的心情，放棄他交給你的任務吧。
		--以後收購蛛絲由我負責，你可以接取我的委託，將[209441]交付給我。
end		























 
