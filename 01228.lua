
---接任務後的訊息通知

function LuaS_421900() 
	
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421900]" , C_SYSTEM ) --冰雪矮人王國遺跡大門已被開啟！
end

-----從矮人記事簿接的任務

function LuaS_421902() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 421902, 1 ));
	ShowBorder( OwnerID(), 421902, str , "ScriptBorder_Texture_Paper" )				
end

----毛腳的食譜

function LuaS_421913() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 421913, 1 ));
	ShowBorder( OwnerID(), 421913, str , "ScriptBorder_Texture_Paper" )				
end

----詢問冰雪矮人的動向

function LuaS_421904() 

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421904)==true )and(CheckFlag( OwnerID() , 542398 )==false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421904]","LuaS_421904_1",0) --請問冰雪矮人最近有什麼異狀嗎？
	end		
end

function LuaS_421904_1() 

	SetSpeakDetail(OwnerID(),"[SC_421904_1]")	
	SetFlag(OwnerID() , 542398 , 1 )
end

function LuaS_421904_2() --NPC裝飾動作 

	AddBuff( OwnerID() ,502280,1 ,-1)
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_UNARMED, ruFUSION_ACTORSTATE_COMBAT_UNARMED)
end

----失職的代價

function LuaS_421908()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421908)==true )and( CheckCompleteQuest( OwnerID() , 421908) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421908]","LuaS_421908_1",0) --請告訴我你不願意離開這裡的理由。
	end

end

function LuaS_421908_1()  

	SetSpeakDetail(OwnerID(),"[SC_421908_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_2]","LuaS_421908_2",0) --你會為了塔妮雅再折回去，可見你真的很愛她。
end

function LuaS_421908_2()  

	SetSpeakDetail(OwnerID(),"[SC_421908_3]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_4]","LuaS_421908_3",0) --這真是太令人震驚了！
end

function LuaS_421908_3()  

	SetSpeakDetail(OwnerID(),"[SC_421908_5]")
	PlayMotion(TargetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421908_6]","LuaS_421908_4",0) --事情發生時，你應該馬上趕回來通知大家的。
end

function LuaS_421908_4()  

	SetSpeakDetail(OwnerID(),"[SC_421908_7]")
	SetFlag(OwnerID() , 542401 , 1 )
end

----永難抹滅的遺憾

function LuaS_421907()  
	DelBodyItem( OwnerID(), 203874 , 1 ) 
	BeginPlot( OwnerID() , "LuaS_421907_1" , 0 )
	BeginPlot( OwnerID() , "LuaS_421907_2" , 0 )
	return true
end

function LuaS_421907_1()  

	local NPC = CreateObjByFlag( 112337 , 780289 , 1 , 1 )  --鄧肯‧魯本
	AddToPartition( NPC , 0 )

	MoveToFlagEnabled( NPC , false )
	Say( NPC , "[SC_421907]" )             --  啊！你先到了呀！我去準備了些東西，所以來遲了......希望你能見諒。
	LuaFunc_MoveToFlag( NPC , 780289 , 3 ,  0 )
	sleep(30)
	PlayMotionEX( NPC, ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say( NPC , "[SC_421907_1]" )         --  塔妮雅，我來看妳了.....
	sleep(30)
	Say( NPC , "[SC_421907_2]" )         --  以前妳老是嚷著要我改掉粗心大意的壞毛病，但是我一直不以為意...
	sleep(40)
	Say( NPC , "[SC_421907_3]" )         --  如果那天我記得先摘完花再出發，有注意到路上可能會發生的危險......我真該死！
	sleep(80)
	LuaFunc_MoveToFlag( NPC , 780289 , 4 , 0 )
	Say( NPC , "[SC_421907_4]" )         --  抱歉讓你看笑話了，冒險者......
	sleep(30)
	Say( NPC , "[SC_421907_5]" )         --  我想一個人靜一靜......如果你還有事情要找我，我依舊會待在我的家園那....
	LuaFunc_MoveToFlag( NPC , 780289 , 5 , 0 )
	BeginPlot( NPC , "LuaS_421907_4" , 0 )
end

function LuaS_421907_2()  

	local FLOWER = CreateObjByFlag( 112338 , 780289 , 2 , 1 )  -- 祭祀花束
	AddToPartition( FLOWER , 0 )
	BeginPlot( FLOWER , "LuaS_421907_3" , 0 )
end

function LuaS_421907_3()  

	Sleep(200)
	Delobj( OwnerID() )
end

function LuaS_421907_4()  

	Sleep(30)
	Delobj( OwnerID() )
end


