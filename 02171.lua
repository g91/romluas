-----支線SCRIPT-------
function LuaS_423694()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423694) == true  and  CheckFlag(OwnerID(),544604)==false then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423694_0]","LuaS_423694_1",0)--意外？
	end
end

function LuaS_423694_1()
   	SetSpeakDetail(OwnerID(),"[SC_423694_1]")---
	AddSpeakOption(OwnerID(),TargetID()," [SC_423694_2]","LuaS_423694_3",0)-----
 end
function LuaS_423694_3()
   	SetSpeakDetail(OwnerID(),"[SC_423694_3]")---544588
	AddSpeakOption(OwnerID(),TargetID()," [SC_423694_4]","LuaS_423694_4",0)
 end
 function LuaS_423694_4()
   	SetSpeakDetail(OwnerID(),"[SC_423694_5]")---544588  544638
	SetFlag(OwnerID() ,544604, 1 )
 end
-------------------------------------------------------------------------------------------
--------------當身上有208515和208514 才能看見那個東西117024，也才能點擊！ 點擊後可以獲得旗標 
function LuaS_423696_USECHECK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if  OrgID == 117024    then	
		if	CountBodyItem( OwnerID(), 208515 )<5 or CountBodyItem( OwnerID(), 208516 )<3 then------
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_1]", 0 )--缺乏[208515]和[208516]！
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_1]", 0 )--
			return -1
		elseif	CountBodyItem( OwnerID(), 208515 )>=5 and CountBodyItem( OwnerID(), 208516 )<3 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_2]", 0 )--缺乏[<S>208516]！
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_2]", 0 )--
			return -1
		elseif	CountBodyItem( OwnerID(), 208515 )<5 and CountBodyItem( OwnerID(), 208516 )>=3 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_3]", 0 )--缺乏[<S>208515]！
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_3]", 0 )--
			return -1	
		else	
		return 1
		end
	end
	if  OrgID == 117028   then
		return 1	
	end
end
function LuaS_423696_USEOK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if  OrgID == 117024    then	
		if	(CheckAcceptQuest(OwnerID(),423696)==true )and   CountBodyItem( OwnerID(), 208515 )>=5 and CountBodyItem( OwnerID(), 208516 )>=3 then 
			DelBodyItem( OwnerID() , 208515 , 5)
			DelBodyItem( OwnerID() , 208516 , 3)
			SetFlag(OwnerID() ,544638, 1 )
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423696_4]", 0 )--王城內傳來特別的聲響！
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423696_4]", 0 )
-----施放法術。		
			return 1
		else
			return -1
		end
	end
	if  OrgID == 117028   then
		GiveBodyItem( OwnerID(), 208517, 1 )
			return 1
	else
			return -1
	end
end

-----

function LuaS_423696()
		SetPlot( OwnerID(),"range","LuaS_423696_1",400)
end
function LuaS_423696_1()
	if	CheckAcceptQuest(OwnerID(),423696)==true  and CheckFlag( OwnerID(),544638)==true  and  ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423696_2" , 0 )
	end
end
function LuaS_423696_2()----104332
	local KK = Lua_DW_CreateObj("flag" ,117027,780809,1,0 )---種出一個掌控全部的NPC的魔王。
	MoveToFlagEnabled( KK, false )
	SetModeEx(KK,EM_SetModeType_Gravity,false)
	WriteRoleValue(KK,EM_RoleValue_Y,550)
	SetModeEx(KK,EM_SetModeType_Gravity,false)	
	SetPlot( OwnerID(),"range","",250)
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition( KK, 0 )
	BeginPlot( KK , "LuaS_423696_3" , 0 )
	Callplot( OwnerID(), "LuaS_423696_1_sub",KK)
end
function LuaS_423696_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				WriteRoleValue(OwnerID() , EM_RoleValue_Register , 0 )
				SetPlot( OwnerID(),"range","LuaS_423696_1",250)
			break
		end
	end
end
function LuaS_423696_3()
	Yell(OwnerID(),"[SC_423696_5]",4)---親愛的，這些日子辛苦你了！emote_applause
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_6]",4)---[116585]，你一定長得很大了吧？
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(45)
	yell(OwnerID(),"[SC_423696_7]",4)---可惜我不能親眼看見你的成長！
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_8]",4)---但[116999]一定把你照顧得很好，對嗎？
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_9]",4)---親愛的，我跟你說過愛一定要說出口對吧？
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_10]",4)---[116585]，可不能像父王一樣這麼吝於開口喔！
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_11]",4)---[116585]，我知道你的成長過程一定非常的艱辛！
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_12]",4)----但你要明白一件事，我們愛你！
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_13]",4)---我們並不是故意想遺棄你，而是逼於現實不得不讓你逃離此地。
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_14]",4)----你要和父王好好的相處，知不知道？
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_15]",4)-----也要好好的照顧賓沙莉，懂嗎？
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_16]",4)------時間不多了，我的法力也只能維持到這了。
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_17]",4)-----親愛的，你要知道不論你做了什麼，我都支持你的選擇！
PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_APPROVAL   )
	sleep(45)
	yell(OwnerID(),"[SC_423696_18]",4)-----呵～想念我的時候，就打開這個裝置吧！
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(45)
	yell(OwnerID(),"[SC_423696_19]",4)----在這裝置的旁邊，放著我留給你、艾可的護符，趕快來拿吧！
	sleep(45)
	yell(OwnerID(),"[SC_423696_20]",4)---親愛的，記得好好照顧艾可，連同我的份一起努力。
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_CRY  )
	sleep(10)
	delobj(OwnerID())
end
 
function LuaS_423696_4()
	SetFlag(OwnerID() ,544638, 1 )
end