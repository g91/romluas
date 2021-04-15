function Lua_na_norika_check()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) 
--	say( OwnerID(), "O" )
--	Say( TargetID(), "T" )
	local X= CheckFlag(OwnerID(), 545147) --檢查完成旗標
	local Y= CheckFlag(OwnerID(), 544870) --檢查每日旗標
	if X == true then --本日已經完成任務
		SetSpeakDetail( OwnerID(), "[SC_117252_NA01]") --「研究」真的很有趣呢！將來我一定要成為一名很厲害的藥劑師，幫助更多的人！
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "Lua_na_skillcraft_story" , 0)  --巧藝節的由來
	elseif Y == true then
		LoadQuestOption( OwnerID() )	
	else --本日尚未完成任務
		SetSpeakDetail( OwnerID(), "[SC_117252_NA02]") 
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_117252_NA03]" , "Lua_na_norika_givekey" , 0)  --願意協助諾璃卡
		AddSpeakOption ( OwnerID(), TargetID(), "[SC_SKILLCRAFT_01]" , "Lua_na_skillcraft_story" , 0)  --巧藝節的由來
	end
end


function Lua_na_skillcraft_story() --巧藝節的由來內文
	SetSpeakDetail ( OwnerID(), "[SC_SKILLCRAFT_02]" )
	AddSpeakOption ( OwnerID(), TargetID(), "[SO_110068_2]" , "Lua_na_norika_check" , 0)  --回到上一頁
end


function Lua_na_norika_givekey()
--	LoadQuestOption (OwnerID() )
	SetFlag( OwnerID(), 544870 , 1) --給予可接任務的旗標
	CloseSpeak( OwnerID())
end


function Lua_na_norika_dailyflag() --完成任務給予每日旗標
	SetFlag( TargetID(), 544870, 0 ) --刪除可接任務旗標
	SetFlag(TargetID(), 545147,1 ) --給予完成任務的旗標
end


function Lua_na_209461_check()  --諾璃卡的試作品 判斷BUFF (物品)
	local A = CheckBuff( OwnerID(), 509971)
	local B = CheckBuff( OwnerID(), 509972)
	local C = CheckBuff( OwnerID(), 509974)
	local D = CheckBuff( OwnerID(), 509975)
	local E = CheckBuff( OwnerID(), 509976)

	if A == true or B == true or C== true or D == true or E == true then  --如果身上已經有任何一種狀態
		return false
	else  --可以使用
		return TRUE
	end
end




function Lua_na_artistry_event_magic() -- 物品使用後，隨機獲得法術效果(物品效果)
	local X = rand(5)
	if X == 0 then
		AddBuff ( OwnerID(), 509971, 0, -1 )  --小不點
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA01]", 0 ) --你覺得突然變輕盈了...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA01]", 0 ) --你覺得突然變輕盈了...
	elseif X == 1 then --大人物
		AddBuff ( OwnerID(), 509972, 0, -1 )	
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA02]", 0 ) --你突然覺得手中湧出源源不絕的力量...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA02]", 0 ) --你突然覺得手中湧出源源不絕的力量...
	elseif X == 2 then --點滴的祝福
		AddBuff ( OwnerID(), 509974, 0, -1 )	
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA03]", 0 ) --體力，一點一滴的恢復...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA03]", 0 ) --體力，一點一滴的恢復...
	elseif X == 3 then --小可愛
		AddBuff ( OwnerID(), 509975, 0, -1 )
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA04]", 0 ) --可愛的外表，怎麼有人捨得傷害你...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA04]", 0 ) --可愛的外型，怎麼有人捨得傷害你...
	else  --腹絞痛
		AddBuff ( OwnerID(), 509976, 0, -1 )
		ScriptMessage( OwnerID(), TargetID(), 0 , "[SC_ARTISTRY_ITEM_NA05]", 0 ) --突然...肚子一陣絞痛...
 		ScriptMessage( OwnerID(), TargetID(), 1 , "[SC_ARTISTRY_ITEM_NA05]", 0 ) --突然...肚子一陣絞痛...
	end
end		
