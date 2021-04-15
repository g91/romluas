function Lua_EnterZone_BaseScript()	--系統呼叫
	local Language = string.upper(GetServerDataLanguage()) 	--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	DebugMsg( 0, RoomID ,"Lua_EnterZone_GiveSomething_"..Language)
	Debuglog(2 , OwnerID().."Doing --Lua_EnterZone_GiveSomething_"..Language.."--")
	Beginplot(OwnerID(),"Lua_EnterZone_GiveSomething_"..Language,0)
end
function Lua_EnterZone_GiveSomething()
	local Items = {	{ 12, 201607, 1},
			{ 13, 201139, 1},
			{ 14, 202506, 1},
			{ 15, 203045, 1},
			{ 16, 203046, 1},
			{ 17, 201969, 1},	--堆疊量只有1
			{ 18, 202928, 2} }
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	--Tell(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
	if month == 11 then
		for i = 1,table.getn(Items) do
			if Items[i][1] == day then
				if (hour >=19 and hour <23 and min >=0) then
					if CheckFlag( OwnerID()  , 543462) ~= true then
						SetFlag( OwnerID()  , 543462 , 1 )
							GiveBodyItem(OwnerID(),Items[i][2],Items[i][3])
						if Items[i][1] == 17 then
							GiveBodyItem(OwnerID(),Items[i][2],Items[i][3])	--堆疊量只有1給兩次＠＠
						end
					end
				end
			end
		end
	end
end
function Lua_EnterZone_GiveSomething_VN()

	local Items = {	{ 10, 206232, 1},
			{ 11, 206232, 1},
			{ 12, 206232, 1},
			{ 13, 206232, 1} }
	local month = GetSystime(3)+1
	local day = GetSystime(4)
	local hour = GetSystime(1)
	local min = GetSystime(2)
	--Tell(OwnerID(),OwnerID(),month.."/"..day.." "..hour..":"..min)
	if month == 12 then
		for i = 1,table.getn(Items) do
			if Items[i][1] == day then
				local Lv = ReadRoleValue( OwnerID(), EM_RoleValue_LV )
				if CheckFlag( OwnerID()  , 543462) ~= true and Lv >= 15 then
					SetFlag( OwnerID()  , 543462 , 1 )
						GiveBodyItem(OwnerID(),Items[i][2],Items[i][3])
				end
			end
		end
	end
end
function Lua_EnterZone_GiveSomething_KR()

--	2010舊
--	local Item1 = 207262	-- 傳送便利捲軸
--	local Item2 = 207263	-- 網咖專用修理鎚
--
--	if CountBodyItem( OwnerID() , Item1 ) == 0 then
--		GiveBodyItem( OwnerID() , Item1 , 1 )
--	end
--
--	if CountBodyItem( OwnerID() , Item2 ) == 0 then
--		GiveBodyItem( OwnerID() , Item2 , 1 )
--	end
--
--	AddBuff(OwnerID(),504673,0,-1)
--	AddBuff(OwnerID(),504674,0,-1)

--	2011.01.03 韓國OBT網咖專案
	local Item = { 207263 , 208959 , 208960 , 208961 }	-- 網咖專用修理鎚、[1]網咖專用融合之石、網咖專用白色駿馬坐騎、[1]網咖專用每日任務重置券   [1] = 每15小時送一次
	local Buff = { 506950 , 506952 , 506951 }		-- 網咖優惠 經驗加成、[1]網咖優惠 記時用 Buff、網咖優惠 強化加成	[1] = 每15小時送一次
	local Buff2 = 506953				-- 網咖優惠 提示訊息用Buff

	-- New Buff 506953 網咖優惠 提示用Buff 、 506954 網咖優惠 執行訊息用Buff

	if CheckBuff( OwnerID() , Buff[2] ) == false then
		if Check_Bag_Space( OwnerID() , 4 ) == true then
			for i = 1 , table.getn(Item) , 1 do
				GiveBodyItem( OwnerID() , Item[i] , 1 )
			end
			for i = 1 , table.getn(Buff) , 1 do
				AddBuff( OwnerID() , Buff[i] , 0 , -1 )
			end
		else
			for i = 1 , table.getn(Buff) , 2 do
				AddBuff( OwnerID() , Buff[i] , 0 , -1 )
			end
			AddBuff( OwnerID() , Buff2 , 0 , -1 )
		end
	else
		if Check_Bag_Space( OwnerID() , 2 ) == true then
			for i = 1 , table.getn(Item) , 2 do
				GiveBodyItem( OwnerID() , Item[i] , 1 )
			end
			for i = 1 , table.getn(Buff) , 2 do
				AddBuff( OwnerID() , Buff[i] , 0 , -1 )
			end
		else
			for i = 1 , table.getn(Buff) , 2 do
				AddBuff( OwnerID() , Buff[i] , 0 , -1 )
			end
			AddBuff( OwnerID() , Buff2 , 0 , -1 )
		end
	end
end

function Lua_KR_NewOBT_OpenCombinEQ( Type )
	-- Type 0 有限制類型  1 不限制類型
	local Buff = 506950		-- 網咖優惠 經驗加成
	if CheckBuff( OwnerID() , Buff ) == true then
		OpenCombinEQ( OwnerID() , OwnerID() , Type )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_KR_NEWSEASON_5]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KR_NEWSEASON_5]" , C_SYSTEM )
		return false
	end
end

function Lua_KR_NewOBT_DailyQuest_CLS()

	local Buff = 506950		-- 網咖優惠 經驗加成
	if CheckBuff( OwnerID() , Buff ) == true then
		ResetObjDailyQuest( OwnerID() )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_KR_NEWSEASON_5]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KR_NEWSEASON_5]" , C_SYSTEM )
		return false
	end
end

function Lua_KR_NewOBT_ON_MSG()

	local Buff = 506952	-- [1]網咖優惠 記時用 Buff	[1] = 每15小時送一次
	local Step = 2
	local Step1 = 4

	if CheckBuff( OwnerID() , Buff ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_KR_NEWSEASON_4][$SETVAR1="..Step.."]" , C_SYSTEM )	
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KR_NEWSEASON_4][$SETVAR1="..Step.."]" , C_SYSTEM )	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_KR_NEWSEASON_4][$SETVAR1="..Step1.."]" , C_SYSTEM )
	--	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_KR_NEWSEASON_4][$SETVAR1="..Step1.."]" , C_SYSTEM )
	end
	-- 您的背包空間必須在[$VAR1]格以上，請在整理過後重新登入遊戲，即可取得網咖專用物品。
end

function Lua_EnterZone_GiveSomething_KR2()
end
function Lua_EnterZone_GiveSomething_ENEU()
end
function Lua_EnterZone_GiveSomething_TW()
end
function Lua_EnterZone_GiveSomething_PH()
end
function Lua_EnterZone_TH()

	local Language = string.upper(GetServerDataLanguage()) 	--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	DebugMsg( 0 , RoomID ,"Lua_EnterZone"..Language)
	Debuglog( 2 , OwnerID().."Doing --Lua_EnterZone"..Language.."--")
	Beginplot( OwnerID() , "Lua_EnterZone_TH_1" , 0 )

end
function Lua_EnterZone_TH_1()

	AddBuff( OwnerID() , 506325 , 0 , -1 ) -- 增加戰鬥所得技能點數20%，同時提高HP回復率每2秒多恢復40點。
end

function Lua_EnterZone_TH2()

	local Language = string.upper(GetServerDataLanguage()) 	--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	DebugMsg( 0 , RoomID ,"Lua_EnterZone"..Language)
	Debuglog( 2 , OwnerID().."Doing --Lua_EnterZone"..Language.."--")
	Beginplot( OwnerID() , "Lua_EnterZone_TH2_1" , 0 )

end
function Lua_EnterZone_TH2_1()

	AddBuff( OwnerID() , 506472 , 0 , -1 ) -- 增加戰鬥所得技能點數15%，同時提高HP回復率每2秒多恢復20點。
end

function Lua_EnterZone_TH3()

	local Language = string.upper(GetServerDataLanguage()) 	--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	DebugMsg( 0 , RoomID ,"Lua_EnterZone"..Language)
	Debuglog( 2 , OwnerID().."Doing --Lua_EnterZone"..Language.."--")
	Beginplot( OwnerID() , "Lua_EnterZone_TH3_1" , 0 )

end
function Lua_EnterZone_TH3_1()

	AddBuff( OwnerID() , 506473 , 0 , -1 ) -- 增加戰鬥所得技能點數10%。
end
function Lua_EnterZone_ENEU()

	local Language = string.upper(GetServerDataLanguage()) 	--抓取目前server的語系
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	DebugMsg( 0 , RoomID ,"Lua_EnterZone"..Language)
	Debuglog( 2 , OwnerID().."Doing --Lua_EnterZone"..Language.."--")
	Beginplot( OwnerID() , "Lua_EnterZone_ENEU_1" , 0 )
end
function Lua_EnterZone_ENEU_1()

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	if CheckFlag( OwnerID() , 543798 ) == true then
		DebugMsg( 0 , RoomID ,"You have received a 206192" )
		return false
	else
		SetFlag( OwnerID() , 543798 , 1 )
		GiveBodyItem( OwnerID() , 206192 , 1 )
	end
end
