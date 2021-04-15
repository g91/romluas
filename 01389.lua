function LuaS_422351_0()
	DisableQuest( TargetID() , true ) --鎖起來
	sleep(20)
	ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_422351]", 0 ); 
	CastSpell(TargetID(),TargetID(),491276)
	sleep(20)
	SetFlag(OwnerID(),542696,1)
	SetFlag(OwnerID(),542697,1)
	DisableQuest( TargetID() , false ) 
end
-------------------------------------------------------
function LuaS_422345()  --成為鷹犬的那一日
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422345)==true )and( CheckCompleteQuest( OwnerID() , 422345) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422345_1]","LuaS_422345_1",0) --沒有.......
		
	end
end

function LuaS_422345_1()  
	SetSpeakDetail(OwnerID(),"[SC_422345_2]")
	SetFlag(OwnerID() ,542698, 1 )
	CloseSpeak( OwnerID())
end

-----------------------------------

function LuaS_422356()  --噩夢
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422356)==true )and( CheckCompleteQuest( OwnerID() , 422356) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422346_1]","LuaS_422356_1",0) --沒有.......
		
	end
end

function LuaS_422356_1()  
	SetSpeakDetail(OwnerID(),"[SC_422346_2]")
	SetFlag(OwnerID() ,542700, 1 )
	CloseSpeak( OwnerID())
end
