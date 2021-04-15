function LuaS_422932_0()-----掛在物品207153使用下的<檢查lua>之下。
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102815	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422932_1]", 0 ); -----這個[205871]似乎只能對[113447]使用。
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 70  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----距離太過遙遠，無法使用[205871]。
		return false
	end
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --目標已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	if	DW_CheckRide() == true	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422932_3]" , 0 ) --騎乘時不可使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422932_3]" , 0 )	
		return false	
	end

	return true

end

function LuaS_422932_1()	--掛在<使用效果類型:server端劇情>下的使用效果下
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422932_2]", 0 ); -------你抓到活蹦亂套的[102815]了！
	DelBodyItem(OwnerID(),207153,1)
	GiveBodyItem(OwnerID(),207154,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end


--完成任務後
function LuaS_422932_2()	--掛在任務422932的完成任務
	if	 CountBodyItem( TargetID(), 207154)>0	 then 
		 DelBodyItem( TargetID(), 207154, 1 )
	end
	
end

function LuaS_422933_0()
	--say(OwnerID(),"I'm Owner")       --不知道誰是OWNER
	say(OwnerID(),"[SC_422933]")
	AdjustFaceDir(OwnerID(),TargetID(),0)
	Playmotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
end

function LuaS_115022()
	while 1 do
		sleep(100)
		say(OwnerID(),"[SC_115022_9]")   	  --不知道威利最近過的怎麼樣
		sleep(300)
		say(OwnerID(),"[SC_115022_10]")	  --真另人擔心阿

		sleep(1000)
	end
end

function LuaS_115022_0()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_0]","LuaS_115022_1",0)    --鬧事?
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_2]","LuaS_115022_2",0)	   --告訴她[115029]最近的狀況
	if CheckAcceptQuest(OwnerID(),422945) == true and CheckCompleteQuest(OwnerID(),422945) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_115022_4]","LuaS_115022_3",0)		--關於這封信...
	end
end
function LuaS_422945_accept()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	say(OwnerID(),"[SC_115022_11]")
end
function LuaS_115022_1()
	SetSpeakDetail(OwnerID(),"[SC_115022_1]")
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_115022_0", 0 ) --/*回上一頁	
end

function LuaS_115022_2()
	SetSpeakDetail(OwnerID(),"[SC_115022_3]")
	AddSpeakOption( OwnerID(), TargetID( ),GetString( "SO_110055_0") , "LuaS_115022_0", 0 ) --/*回上一頁		
end

function LuaS_115022_3()
	SetSpeakDetail(OwnerID(),"[SC_115022_5]")	
end
function LuaS_115022_complete()
	CloseSpeak(OwnerID())
	AddBuff( TargetID(),  506741 , 1 , 300)                                         ---剛過任務的玩家才看到
	local bedi = Lua_DW_CreateObj("obj",115045,OwnerID())   --BEDI假人
	Lua_ObjDontTouch( bedi ) 	---不能碰BEDI假人
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	MoveToFlagEnabled(bedi,false)
	AdjustFaceDir( bedi ,TargetID(), 0 )
	sleep(5)
	PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)
	say(bedi,"[SC_115022_6]")		--耽誤您太多時間了
	sleep(20)
	--PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_CUTE2)
	say(bedi,"[SC_115022_7]")		--真的很感謝騎士大人的幫忙
	sleep(20)	
	local NPC12 = Lua_DW_CreateObj("flag" ,115079,780594,0)
	sleep(20)
	say(NPC12,"[SC_115022_12]")		--貝蒂～可以來幫個忙嗎？
	AdjustFaceDir( bedi ,NPC12,0 )
	delobj(NPC12)
	sleep(20)
	AdjustFaceDir( bedi ,TargetID(), 0 )	
	sleep(20)	
	say(bedi,"[SC_115022_8]")                     --啊..不好意思...
	sleep(20)	
	say(bedi,"[SC_115022_13]")                   --好像有事情要忙就先不送了...
	sleep(20)	
	PlayMotion( bedi ,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(30)	
	DW_MoveToFlag(bedi,780594 , 1,0 ,1)	
	DW_MoveToFlag(bedi,780594 , 2,0 ,1)	
	DW_MoveToFlag(bedi,780594 , 3,0 ,1)	
	sleep(20)	
	delobj(bedi)
	CancelBuff( TargetID()  , 506741  ) 	--
end

function LuaS_115029_0()
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),422936) == true and CheckCompleteQuest(OwnerID(),422936) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_115029_0]","LuaS_115029_1",0)		 --不親自去見[115022]女士嗎?
	end
end
function LuaS_422936_accept()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DAZED_BEGIN)
	AdjustFaceDir( OwnerID() ,TargetID(), 0 )
	say(OwnerID(),"[SC_115029]")
end
function LuaS_115029_1()
	SetSpeakDetail(OwnerID(),"[SC_115029_1]")		--有很多事情不是用嘴巴講就可以理解的。而且騎士訓練也還在進行中，怎麼可以隨意脫隊呢。
end

function LuaS_422945_complete()
	
	say(OwnerID(),"[SC_115029_2]")
end


function LuaS_test_complete()
	say(OwnerID(),"i'm owner")
	say(TargetID(),"i'm Target")	
end

Function movestop()
	MoveToFlagEnabled(OwnerID(),flase)
	SetPlot(OwnerID(),"touch","touchmove",110)
end

Function nearmove()
	MoveToFlagEnabled(OwnerID(),flase)	
end

Function touchmove()
	MoveToFlagEnabled(TargetID(),true)	
	CallPlot(TargetID(),DW_MoveToFlag,TargetID(),780594 , 0,0 ,1)
end

Function target_is_talk()
	--CallPlot(TargetID(),DW_MoveToFlag,TargetID(),780594 , 0,0 ,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_IS_TALK]"  , 0 ) --。	
end

Function say_dbid()
	say(OwnerID(),OwnerID())
end