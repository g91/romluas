-----------------------------------------------------------------------------------------------------------
--莉娜
-----------------------------------------------------------------------------------------------------------

--function LuaS_110068_0()

	--if CheckAcceptQuest( OwnerID(), 420077) == true then
	--LoadQuestOption( OwnerID() );  --載入任務模板
	--end

	--SetSpeakDetail( OwnerID(), GetString("ST_110068_0")   );
	--AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_1") , "LuaS_110068_1",0 );	--增加一個選項，教學內文1

--end

-----------------------------------------------------------------------------------------------------------
function LuaS_110068_1()

	SetSpeakDetail( OwnerID(),GetString("ST_110068_1") );  --	教學內文1
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_2") , "LuaS_110068_0",0 );	--返回
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_3") , "LuaS_110068_3",0 );	--我了解如何移動了

end
------------------------------------------------------------------------------------------------------------
function LuaS_110068_3()
	if CheckcompleteQuest( OwnerID(), 420077) ==true then
	BeginPlot( OwnerID(), "LuaS_110068_EXIT", 10 ); 	--如已完成過任務，可直接結束對話。
	else	
	LoadQuestOption( OwnerID() );  --載入任務模板
	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110068_1") , "LuaS_110068_0",0 );	--回上一頁
	end
end
------------------------------------------------------------------------------------------------------------
function LuaS_110068_EXIT()
	CloseSpeak( OwnerID() );	--關閉對話視窗
end

-----------------------------------------------------------------------------------------------------------
--莎嘉
-----------------------------------------------------------------------------------------------------------
function LuaS_110073_0()

	LoadQuestOption( OwnerID() );  --載入任務模板

	if CheckCompleteQuest( OwnerID(), 420085) == true then
		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110073_1"), "LuaSO_110073_1", 0 );  --教學內容3
--		AddSpeakOption(OwnerID(), TargetID(), GetString("SO_110073_EXIT"), "LuaS_110073_EXIT", 0 );  --結束對話
	end
end

---------------------------------------------------------------------------------------------------------------------
function LuaSO_110073_1()

	SetSpeakDetail( OwnerID(), GetString("ST_110073_1") );  --教學內文3
--	AddSpeakOption( OwnerID(), TargetID(), GetString("SO_110073_EXIT"), "LuaS_110073_EXIT", 0 );  --結束對話

end

---------------------------------------------------------------------------------------------------------------------
function LuaS_110073_EXIT()
	CloseSpeak( OwnerID() );  --關閉對話視窗

end