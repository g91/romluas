--讓某個物件檢查一定範圍內是否有接任務的玩家
--ObjID 物件的代號
--QuestID 任務編號
--Range 偵測範圍
----------------------持續檢查------------------------------
function Lua_Check_Drama_Extra( ObjID , QuestID , Range ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	AddBuff( ObjID , 506345 , 0 , -1 )
	CallPlot( ObjID , "Lua_Check_Drama_Extra_Sub" ,  QuestID , Range )
end
--------------------瞬間一次檢查----------------------------------
function Lua_Check_Drama_Extra_OneTime( ObjID , QuestID , Range ) 
	if Range == nil or Type( Range ) ~= "number" then
		Range = 250
	end
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Players = SetSearchAllPlayer(RoomID )
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	for i = 1 , Players , 1 do 
		local ID = GetSearchResult()
		if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true then
			if GetDistance( ID , ObjID ) > Range then
				ScriptMessage( ID , ID , 0 , Str , 0 ) --你已經離開任務：「[$VAR1] 」的檢查範圍
				ScriptMessage( ID , ID , 1 , Str , 0 ) --你已經離開任務：「[$VAR1] 」的檢查範圍
			else
				Count = Count + 1
			end
		end
	end
	if Count == 0 then
		return false
	else
		return true
	end
end


function Lua_Check_Drama_Extra_Sub(QuestID , Range)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Players = 0
	local Count = 0
	local Name = "[QuestID]"
	local Str = "[SC_QUEST_OVER_RANGE][$SETVAR1="..Name.."]"
	while 1 do
		Players = SetSearchAllPlayer(RoomID )
		Count = 0
		for i = 1 , Players , 1 do 
			local ID = GetSearchResult()
			if CheckID(ID) == true and CheckAcceptQuest(ID , QuestID ) == true then
				if GetDistance( ID , OwnerID() ) > Range then
					ScriptMessage( ID , ID , 0 , Str , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
					ScriptMessage( ID , ID , 1 , Str , 0 ) --你已經離開任務：[$VAR1] 的檢查範圍
				else
					Count = Count + 1
				end
			end
		end
		if Count == 0 then
			CancelBuff( OwnerID() , 506345 )
			break
		end
		sleep( 30 + Rand(20) )
	end
end
------------------------------------舊版：祥人說這樣施法會比較耗資源，效果也比較差，請不要使用，但之前的 script 有用，所以也請不要刪-----------------
function Lua_Check_Drama_Statu( Obj) --回傳有沒有玩家正在進行任務，false 代表沒有玩家正在進行任務，true 代表有，obj 是檢查的中心物件
	local Buff = 506345
	if CheckBuff( Obj , Buff ) == true then
		return true
	else
	--	Yell( obj , "NO Buff" , 3 )
		return false
	end
end

function Lua_Drama_Radar( Obj , QuestID , Range) --持續以 obj 為檢查點，檢查 range 範圍內是否有玩家正在執行 questid 的任務(RANGE可不填）
	if Range == nil then
		Range = 250
	end
	AddBuff( Obj , 506345 , 0 , 10 )
	WriteRoleValue( Obj , EM_RoleValue_LuaValueFlag+999, QuestID )
	CallPlot( Obj , "Lua_Drama_Radar_Do" , Range )
end

function Lua_Drama_Radar_Do(Range) --副函式
	local Spell
	if Range <= 250 then
		Spell = 495356
	end
	AddBuff( OwnerID() , 506348 , 0 , -1 )
--	while 1 do
--		sleep( 30 + DW_Rand(50) )
--		if CheckBuff( OwnerID() , 506345 ) == false then
--			CancelBuff_NoEvent( OwnerID() , 506348 )
--			Yell( OwnerID() ,"break" , 3 )
--			break
--		end
--	end
end

function LuaM_506346_CHECK() ---副函式
	local QuestID = ReadRoleValue(OwnerID() , EM_RoleValue_LuaValueFlag+999 )
	if CheckAcceptQuest( TargetID() , QuestID ) == true then
--		Say( TargetID() , " I have Quest "..QuestID )
		return true
	end
--	Say( TargetID() , " I don't had Quest "..QuestID )
	return false
end

function LuaM_506346_USE() ---副函式
--	Say( TargetID() , " Check Me " )
	AddBuff( OwnerID() , 506345 , 0 , 10 )
end