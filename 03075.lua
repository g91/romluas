function Lua_2013Moon_123028() --艾克的對話劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	if CheckFlag( Owner , 547537 ) == false and CheckFlag( Owner , 547535 ) == false then  --玩家當日未完成任務，也沒有接受任務
		SetSpeakDetail( Owner , "[SC_123028_01]") --麵粉…橄欖油…水…，然後各項材料的比例……
		AddSpeakOption( Owner, Owner , "[SC_121445_02]" , "Lua_123028_GiveFlag" , 0 ) --發生什麼事？	
	elseif CheckFlag( Owner , 547537 ) == true then
		SetSpeakDetail( Owner , "[SC_123028_02]") --有了[243016]，這是應該會成功吧！不過…我應該在哪個步驟加入這些材料呀……？	
	else
		LoadQuestOption( Owner )		
	end

end


function Lua_123028_GiveFlag() -- 給予任務旗標
	local Owner = OwnerID()
	local Target = TargetID()
	SetFlag( Owner , 547535 , 1 )
	LoadQuestOption( Owner )	
end


function Lua_123028_NextFlag() --接受任務之後給予下一個任務的可接旗標
	local Target = TargetID()
	SetFlag( Target , 547536 , 1 ) --卡多可接任務旗標
end


function Lua_123029_speak() --蕾亞的對話劇情
	local Owner = OwnerID()
	if CountBodyItem( Owner , 243015 ) == 0 and CheckAcceptQuest( Owner , 426570 ) == true then --玩家身上有任務，但是沒有麥芽糖 
		SetSpeakDetail( Owner , "[SC_123029_SPEAK]" )
		GiveBodyItem( Owner , 243015 , 1 ) 	
	else
		LoadQuestOption(Owner)
	end
end


function Lua_426570_complete()
	local Target = TargetID()
	Setflag( Target , 547536 , 0 ) -- 刪除顯示任務的旗標
end


function Lua_426604_complete()
	local Target = TargetID()
	Setflag( Target , 547535 , 0 ) -- 刪除顯示任務的旗標
	Setflag( Target , 547537 , 1 ) --每日旗標
end


function Lua_na_123030_action()
	local Owner = OwnerID()  --卡多
	PlayMotionEX(Owner , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,  ruFUSION_ACTORSTATE_CRAFTING_LOOP )
	sleep(40)
	PlayMotion(Owner , ruFUSION_ACTORSTATE_CRAFTING_END )
end	 


function Lua_na_123028_action()
	local Owner = OwnerID()  --艾克
	while true do 
		PlayMotionEX(Owner , ruFUSION_ACTORSTATE_CRAFTING_BEGIN,  ruFUSION_ACTORSTATE_CRAFTING_LOOP )
		sleep(40)
		PlayMotion(Owner , ruFUSION_ACTORSTATE_CRAFTING_END )
		sleep(100)
	end
end	 


function Lua_na_123030_Speak()
	local Owner = OwnerID()  --卡多
	local NPC = SearchRangeNPC( Owner , 50 ) 
	local Reia
	local ReiaSpeak = { "SC_123029_SPEAK1" , "SC_123029_SPEAK2" , "SC_123029_SPEAK3" , "SC_123029_SPEAK4"	}

	local CardoSpeak = {	"SC_123030_SPEAK1" , "SC_123030_SPEAK2" ,"SC_123030_SPEAK3" , "SC_123030_SPEAK4"	}
	for i = 0 , #NPC do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == 123029 then
			Reia = NPC[i]
			break
		end
	end
	local R = DW_RAND(10)
	if R <5 then
		PlayMotion(Owner , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		NPCSay( Owner , "[" ..CardoSpeak[R].."]" )
		sleep(30)
		PlayMotion( Reia, ruFUSION_ACTORSTATE_EMOTE_SPEAK )	
		NPCSay( Reia , "[" ..ReiaSpeak[R].."]" )
		sleep(10)
	else
		Lua_na_123030_action()
	end
end	 





--[123029]姊姊，我可以吃一些糖果嗎?
--當然不行！[123030]，你已經吃太多糖了！
--這個味道好香唷！[123029]姊姊，妳在做新的糖果嗎？
--是呀！不過[123030]，這是要分給大家吃的，所以我不會允許你在吃糖的！
--[123029]姊姊，你還需要什麼呢？
--幫我多採些那邊紫色和黃色的花吧！
--這是[123029]姊姊要的花，我有幫上姊姊的忙嗎？
--當然有啊！[123030]是很優秀的小幫手喔！