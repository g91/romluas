function LuaS_110150_0()

	SetSpeakDetail( OwnerID(),GetString("ST_110150_0") ); 
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110150_1") , "LuaS_110150_1",0 )
	if CheckAcceptQuest(OwnerID(),420030) == true then
		LoadQuestOption( OwnerID() );  --載入任務模板
	else
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110150_EXIT") , "LuaS_110150_EXIT", 0 ); --結束對話
	end

end

-----------------------------------------------------------------------------------------------------------
function LuaS_110150_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110150_1") ); 
	if CheckAcceptQuest(OwnerID(),420030) == true then
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110150_2") , "LuaS_110150_0",0 )
	else
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110150_2") , "LuaS_110150_0",0 )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110150_2",0 );
	end
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110150_EXIT") , "LuaS_110150_EXIT", 0 ); --結束對話

end
------------------------------------------------------------------------------------------------------------
function LuaS_110150_2()

	LoadQuestOption( OwnerID() );  --載入任務模板
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110150_1") , "LuaS_110150_1",0 )

end
------------------------------------------------------------------------------------------------------------
function LuaS_110150_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end


-----------------------------------------------------------------------------------------------------------
function LuaS_110153_0()

	LoadQuestOption( OwnerID() );
	if CheckCompleteQuest( OwnerID(),420247)  == true then 
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110153_1") , "LuaS_110153_1", 0 )
		AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110153_EXIT") , "LuaS_110153_EXIT", 0 ); --結束對話
	end
end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110153_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110153_1") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110153_EXIT") , "LuaS_110153_EXIT", 0 ); --結束對話

end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110153_EXIT()
	CloseSpeak( OwnerID() );  --關閉對話視窗

end


-----------------------------------------------------------------------------------------------------------
function LuaS_110232_0()

	LoadQuestOption( OwnerID() );

	if CheckCompleteQuest( OwnerID(), 420248) == true then
		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110232_1"), "LuaS_110232_1", 0 );
		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110232_EXIT"), "LuaS_110232_EXIT", 0 );  --結束對話
	end
end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110232_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110232_1") );
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110232_EXIT"), "LuaS_110232_EXIT", 0 );  --結束對話

end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110232_EXIT()
	CloseSpeak( OwnerID() );  --關閉對話視窗

end