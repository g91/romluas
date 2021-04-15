--18相關的信件、書本、石碑介面內容--

--只有閱讀功能，無接任務選項
---423566一抹星光----


function LuaS_423566_book_0()	--208128求救信函
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423566_1]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_423566_2]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

-----423567返回達拉尼斯-----
function LuaS_423567_book_0()	--石碑介面內容
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423567_BOOK]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_423567_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

-----423514求助-----史奎普給玩家的指示信件
function LuaS_423514_book_0()	--掛在208130之下
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423514_BOOK]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_423567_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_208131_book_0()	--208131沙卡巴兒子的日記
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_4]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_5]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208131_BOOK_6]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208131_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_208156_book_0()	--208156古伊的工作日誌
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208156_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208156_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208156_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208156_BOOK_4]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208156_BOOK_5]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208156_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_208157_book_0()	--208157  薩爾的工作日誌
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208157_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208157_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208157_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208157_BOOK_4]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208157_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_208158_book_0()	--208158索尼的工作日誌
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208158_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208158_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208158_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208158_BOOK_4]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208158_BOOK_5]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208158_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end

function LuaS_208079_book_0()	--208079埋在沙堆裡的書籍
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208079_BOOK_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208079_BOOK_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208079_BOOK_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_208079_BOOK_4]" )	--下一頁，字串為書頁內文
	ShowBorder( OwnerID(), 0, "[SC_208079_BOOK_0]" , "ScriptBorder_Texture_Paper" )	--QuestID 所要給予的任務ID(填0則不給任務)，字串為此書頁標題
end
---
function Lua_116428() --使玩家不需要任務也可以撿取物品
	SetPlot( OwnerID(),"touch","Lua_116428_do",30 )--觸碰劇情
end

function Lua_116428_do()
	BeginPlot( TargetID(), "Lua_116428_Get", 0 )--執行檢取劇情
end

function Lua_116428_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	local item = 208079 --獲得物品
	local num = 1 --獲得數量
	local time = 10 --物件重生時間  一般種怪 需要填重生時間  script產怪填0
	CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- 目標(target玩家) 獲得物品(item) 數量(num) 時間(time)					
end

---
function LuaS_116380() --取得萊慕政權的瑩火要說的話
	LoadQuestOption( OwnerID() )
	if	CheckCompleteQuest( OwnerID() ,423569 ) == true	then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116380_0]" , "LuaS_116380_0", 0 )	
	end
end
function LuaS_116380_0()
	SetSpeakDetail(OwnerID(),"[SC_116380_1]")	
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116380_2]" , "LuaS_116380_1", 0 )	
end

function LuaS_116380_1()
	SetSpeakDetail(OwnerID(),"[SC_116380_3]")
end