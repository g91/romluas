function LuaS_111622_Quest()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421531)==true )and(CheckFlag( OwnerID() , 542180 )==false)then	--尋寶遊戲任務

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421531_1]","LuaS_421531_1",0)
	end

	if (CheckAcceptQuest(OwnerID(),421532)==true )and(CountBodyItem( OwnerID(), 203354 )<1)then	--尋寶遊戲關卡一任務
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_3]","LuaS_421532_1",0)  --月泉裂井
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_1",0)  --枯木洞
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_5]","LuaS_421532_2",0)	--裡谷礦坑
	end

	if (CheckAcceptQuest(OwnerID(),421533)==true )and(CountBodyItem( OwnerID(), 203356 )<1)then	--尋寶遊戲關卡二任務
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_1",0)  --枯木洞
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_3]","LuaS_421532_2",0)  --月泉裂井
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--開墾聚落
	end

	if (CheckAcceptQuest(OwnerID(),421536)==true )and(CountBodyItem( OwnerID(), 203368 )<1)then	--尋寶任務關卡三任務
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_2",0)  --枯木洞
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_7]","LuaS_421532_1",0)  --卑劣洞窟
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--開墾聚落
	end

	if (CheckAcceptQuest(OwnerID(),421538)==true )and(CountBodyItem( OwnerID(), 203370 )<1)then	--尋寶任務關卡四任務
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--開墾聚落
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_8]","LuaS_421532_1",0)	--羅格鎮
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_7]","LuaS_421532_2",0)  --卑劣洞窟
	end

	if (CheckAcceptQuest(OwnerID(),421540)==true )and(CheckFlag( OwnerID() , 542185)==false)then	--諾芙的遺憾任務
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421540_3]","LuaS_421540_1",0)
	end

	if (CheckCompleteQuest( OwnerID() , 421539) == false )and( CheckCompleteQuest( OwnerID() , 421538) == true) and( CountBodyItem( OwnerID(), 203371 )<1) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_9]","LuaS_add_421532",0)  
	end

end

------------------------------------
function LuaS_421531_1()           --尋寶遊戲任務

	SetSpeakDetail(OwnerID(),"[SC_421531_2]")	
	SetFlag(OwnerID() , 542180 , 1 )
end

function LuaS_421532_1()     

	SetSpeakDetail(OwnerID(),"[SC_421532_1]")	--不對喔～再猜猜。
end

function LuaS_421532_2()     

	SetSpeakDetail(OwnerID(),"[SC_421532_2]")	--答對了！趕快去吧～
end

------------------------------------
function LuaS_421540_1()           --諾芙的遺憾

	SetSpeakDetail(OwnerID(),"[SC_421540_4]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421540_1]","LuaS_421540_2",0)	
end

function LuaS_421540_2()           --諾芙的遺憾

	SetSpeakDetail(OwnerID(),"[SC_421540_2]")	
	SetFlag(OwnerID() , 542185 , 1 )
end

function LuaS_add_421532()

	GiveBodyItem( OwnerID(), 203371, 1 )
	CloseSpeak( OwnerID() )
end

