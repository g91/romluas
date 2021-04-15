--台灣七夕情人節活動
--艾克
function Lua_121445_Speak() --艾克的對話劇情
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckFlag( Owner, 547533 ) == true or CheckFlag( Owner, 547534 ) == true then
		LoadQuestOption( Owner )
	else
		SetSpeakDetail( Owner , "[SC_121445_01]") --不會吧！！！今天幾號了？慘了慘了！這下蕾亞 絕對不會放過我的……
		AddSpeakOption( Owner, Owner , "[SC_121445_02]" , "Lua_121445_Speak1" , 0 ) --發生什麼事？
	end
end


function Lua_121445_Speak1() --艾克的對話劇情
	local Owner = OwnerID()
	CloseSpeak( Owner)
	SetFlag( Owner, 547534, 1 ) --擁有給予任務的資格
end



function Lua_121447_Quest()
	SetPlot( OwnerID() , "touch" , "Lua_121447_Speak" , 0 )
end


function Lua_121447_Speak() --卡多的對話劇情
	local Owner = OwnerID()
	if CheckQuest( Owner, 426539 , 0 ) == true then
		SetSpeakDetail( Owner , "[SC_121447_02]" )
		AddSpeakOption( Owner , Owner , "[SC_121447_04]" , "Lua_121447_Speak1" , 0 )
	else
		SetSpeakDetail( Owner , "[SC_121447_01]" )	--身為男人，就不可以讓喜歡的女孩傷心難過！等我長大以後，我一定會用心呵護我喜歡的人。
	end
end


function Lua_121447_Speak1()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_121447_03]" )
	AddSpeakOption( Owner , Owner , "[SC_121447_05]" , "Lua_121447_Quest1" , 0 )
end


function Lua_121447_Quest1() --用10個必爾汀代幣兌換任務道具
	local Owner = OwnerID() --玩家
	local Target = TargetID() --卡多
	local status = ReadRoleValue(  Target, EM_RoleValue_Register2)
--	if Status == 0 then
	--	SetPlot( Target , "touch" , " " , 0 )
	--	WriteRoleValue( Owner , EM_RoleValue_Register2 , 1 )	
		if CountBodyItem( Owner , 242375 ) == 0 then
			if CountBodyItem( Owner , 203038 ) >= 10 then --身上有10個必爾汀代幣
				SetSpeakDetail( Owner , "[SC_121447_06]")
				GiveBodyItem( Owner, 242375 , 1 ) --給予許願紙籤 
				DelBodyItem( Owner, 203038, 10 ) --刪除10個必爾汀代幣
				ScriptMessage( Owner, Owner, 3, "[SC_121447_07]" , 0 )
				BeginPlot( Target , "Lua_na_121447_move", 0 )
			else
				CloseSpeak( Owner)
				ScriptMessage( Owner, Owner, 1, "[SC_BUY_TOKEN]", 0 )
			end
		else
	--		WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
			CloseSpeak( Owner)
			ScriptMessage( Owner, Owner , 1 , "[SC_Z23Q425436_2]" , 0 )   --你已經擁有相同的東西了。
		end
--	else
--		ScriptMessage( Owner, Owner, 2 , "Cardo is busy" , 0 )	
--	end
end



function Lua_426539_complete()
	local Owner = OwnerID()
	local Target = TargetID()
	SetFlag( Target , 547534 , 0 ) -- 給予任務426539的判斷旗標，關閉
	SetFlag( Target , 547533 , 1 ) -- 每日旗標
end


function Lua_na_121449() --隱藏物件初始劇情
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local obj
	while true do
		local Count = 0
		local AllNPC = SetSearchAllNPC( Room)
		for i = 0 , AllNPC, 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 121447 then
				Count = Count +1 
				break
			end
		end
		if Count == 0 then
			Lua_na_121447_Born(Room)
		end
--		DebugMsg( 0, 0, Count) --卡多的數量
		Sleep(300)
	end
end

function Lua_na_121447_Born(Room)  --卡多出生劇情
	local Owner = OwnerID()
	local Cardo = 121447
	local R = DW_Rand(10)
	local x,y,z,dir=DW_Location(781339,R);--根據旗子位置
	local Obj=CreateObj(121447,x,y,z,dir,1);
	WriteRoleValue( Obj , EM_RoleValue_Register1, 0)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Obj )
	WriteRoleValue( Obj , EM_RoleValue_Register1 , Owner )
	WriteRoleValue( Obj , EM_RoleValue_PID , R )
	AddToPartition(Obj,Room)
end


function Lua_na_121447_move() --卡多消失，換位置
	local Owner = OwnerID() --卡多
	local Pid = ReadRoleValue( Owner , EM_RoleValue_PID) --得知是在哪個位置產生的卡多，避免再次RAND到同樣的位置
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	while true do
		local R = DW_Rand(10)
		if Pid ~= R then
			local x,y,z,dir=DW_Location(781339,R);--根據旗子位置
			local Obj=CreateObj(121447,x,y,z,dir,1);
			WriteRoleValue( Obj , EM_RoleValue_PID , R )
			AddToPartition(Obj,Room)
			DelObj( Owner)
			break
		end
	end
end
			



--測試指令
function Lua_2013_tw_valentine_test() --檢查卡多的數量
	local Owner = OwnerID()
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local obj
	local Count = 0
	local AllNPC = SetSearchAllNPC( Room)
	for i = 0 , AllNPC, 1 do
		local ID = GetSearchResult()
		Obj=Role:New(ID)
		if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 121447 then
			Count = Count +1 
		end
	end
	DebugMsg( Owner, 0, "we have "..Count.." Cardo") --卡多的數量

end


function Lua_2013_tw_valentine_reset() --重置旗標
	local Owner = OwnerID()
	SetFlag( Owner , 547533 , 0 )  --每日旗標
	SetFlag( Owner , 547534 , 0 ) --可接任務判斷用
	SetFlag( Owner , 542579 , 0 ) --夏日祝福每日旗標
end