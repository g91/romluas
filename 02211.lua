--========================================================================================--

function LuaPE_KS_GetAreaPlayer( MapID, RoomID )--抓取區域玩家(舊)
	local TestID = 1	-- 測試區
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- 回傳找到個數
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- 取得搜尋到的玩家
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , MapID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- 搜尋到這個分區的玩家就加進去
		end
	end
	return AreaPlayer
end


function LuaPE_KS_StopAttack( Player ) --停止攻擊
	local times = 0
	while CheckID( Player ) do
		times = times+1
		SetStopAttack( Player )
		SetModeEx( Player , EM_SetModeType_Strikback , false )		-- 反擊
		SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- 索敵
		SetModeEx( Player , EM_SetModeType_Fight , false )		-- 可砍殺攻擊
		SetModeEx( Player , EM_SetModeType_Mark, false )		-- 標記	
		WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
		if times == 3 then DelObj( Player ) end
		sleep(4)
	end
end

function LuaPE_KS_CheckLv( GUID, LV, MapID )
	if ReadRoleValue( GUID , EM_RoleValue_LV ) < LV then
		if MapID == nil or DW_CheckMap( GUID, MapID ) == true or DW_CheckMap( GUID, 1 ) == true then
			ScriptMessage( GUID, GUID , 1, "[SAY_110990_5][$SETVAR1="..getName(GUID).."]", 0 )
			ScriptMessage( GUID, GUID , 0, "[SAY_110990_5][$SETVAR1="..getName(GUID).."]", 0 )
		end
		return false
	else
		return true
	end
end


function LuaPE_KS_GetBonus( PEIndex, mapID, Bonus )--(仇恨)分數計算				
	local HateList = {} 
	local Hate = {}
	if HateListCount( OwnerID() ) > 1 then
		for i = 1 , HateListCount( OwnerID() ) , 1 do
			HateList[i] = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_HatePoint )
			Hate[i] = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID )
			
		end
		for i =1, table.getn(HateList) do
			for j=i+1, table.getn(HateList) do
				if HateList[i] < HateList[j] then
					temp = HateList[i]
					HateList[i] = HateList[j]
					HateList[j] = temp
					temp = Hate[i]
					Hate[i] = Hate[j]
					Hate[j] = temp
				end
			end
		end
	elseif HateListCount( OwnerID() ) ==1 then
		Hate[1] = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
	end
	Bonus  = LuaPE_KS_SetBonus( PEIndex, mapID, Bonus, Hate[1] )
	return Bonus
end

function LuaPE_KS_SetBonus( PEIndex, mapID, Bonus, Obj )--(指定)分數計算
	local rate
	local Num
	local getPlayer = {}
	local PartyPlayer
	local PartyPlayerNum
	Bonus = math.floor(Bonus)
	if ReadRoleValue( obj, EM_RoleValue_IsPlayer ) == 0 then return end

	PartyPlayerNum = GetPartyID( Obj, -1 )
	--debugmsg( 0, 0, "PartyPlayerNum = " ..PartyPlayerNum )
	if PartyPlayerNum == 0 and ( DW_CheckMap( Obj, mapID ) == true or DW_CheckMap( Obj, 1 ) == true )  then 
		PE_GivePlayerScore( PEIndex , Obj, Bonus ) -- 玩家一人獎勵積分100%
		--debugmsg( 0, 0, Obj.." getBonus = " ..Bonus )
		return Bonus
	else
		for i = 0, PartyPlayerNum do
			PartyPlayer = GetPartyID( Obj, i )
			if CheckID( PartyPlayer ) == true and PartyPlayer ~= nil and ( DW_CheckMap( PartyPlayer, mapID ) == true or  DW_CheckMap( PartyPlayer, 1 ) == true ) then
				table.insert( getPlayer, PartyPlayer )
			end
		end
		Num = table.getn(getPlayer)
		--debugmsg( 0, 0, "getBonusNum = " ..Num )
		rate =  ( 3.5*Num+6.5 ) / 10
		--debugmsg( 0, 0, "rate = " ..rate )
		for i = 1, Num do		
			PE_GivePlayerScore( PEIndex , getPlayer[i] , Bonus*rate/Num )	-- 多人獎勵積分
			--debugmsg( 0, 0, getPlayer[i] .."  getBonus =  " ..Bonus*rate/Num )
		end
		return Bonus*rate/Num 
	end	
end

function LuaPE_KS_CleanBuff( Player )--任務模板:清除玩家(player)目前的PE用BUFF
	Player = Player or TargetID()--玩家
	
	local NpcPEID = ReadRoleValue( OwnerID(), EM_RoleValue_PID )--還任務的NPC
	local playerPEID = ReadRoleValue( player, EM_LuaValueFlag_PENum )--PE編號，五位數字 前三位是區域代碼 後兩位是該區的編號
	debugmsg(0,0,"PlayerPEID = "..playerPEID.."; NpcPEID = "..NpcPEID)
	if playerPEID == NpcPEID then
		local Binary = ReadRoleValue( player, EM_LuaValueFlag_PEBuffTrace )	--以二進位記錄目前已取得的BUFF  最多32個
		local BuffSite = ReadRoleValue( player, EM_LuaValueFlag_PEBuffKeep )--目前擁有的BUFF編號
		--debugmsg(0,0,"Binary = "..Binary.."; BuffSite = "..BuffSite.."; pow = "..math.pow( 2, BuffSite-1 ))
		WriteRoleValue( player, EM_LuaValueFlag_PEBuffTrace, Binary + math.pow( 2, BuffSite-1 ) )--寫入已完成的BUFF階段
		WriteRoleValue( player, EM_LuaValueFlag_PEBuffKeep, 0 )

		DebugMsg(0,0,"NpcPEID = "..NpcPEID.."; BuffSite = "..BuffSite )
		if BuffSite ~= 0 and NpcPEID ~= 0 then
			CancelBuff( player, ZonePE_BuffType[NpcPEID][BuffSite] )
		end
		
		local Count = ReadRoleValue( player, EM_LuaValueFlag_PECount )
		DebugMsg( 0,0,"CleanQuestBuff "..NpcPEID.."; FinCount = "..Count+1)
		WriteRoleValue( player, EM_LuaValueFlag_PECount, Count +1 )--任務完成次數
		return true
	end
	return false
end

function LuaPE_KS_GetBuff( Player )--任務模板:取得玩家(Player)能取得的PE用BUFF
	Player = Player or TargetID()--玩家	
	local Binary = 0
	local NpcPEID = ReadRoleValue( OwnerID(), EM_RoleValue_PID )--PE編號，五位數字 前三位是區域代碼 後兩位是該區的編號
	if NpcPEID == 0 then
		DebugMsg(0,0,"Error!! PID = 0")
		return false
	end
	local PlayerPEID = ReadRoleValue( Player, EM_LuaValueFlag_PENum ) --PE編號，五位數字 前三位是區域代碼 後兩位是該區的編號
	local PEBuffkeep = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep )--目前擁有的PE BUFF位置
	if PlayerPEID == NpcPEID then
		if PEBuffkeep ~= 0 then --目前擁有的BUFF編號
			if CheckBuff( Player, ZonePE_BuffType[NpcPEID][PEBuffkeep] ) ~= true then
				AddBuff( Player, ZonePE_BuffType[NpcPEID][PEBuffkeep], 0, -1 )
			end
			return false
		end	
		Binary = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffTrace )	--以二進位記錄目前已取得的BUFF  最多32個
	else
		DebugMsg(0,0,"PlayerPEID = "..PlayerPEID.."; PEBuffkeep = "..PEBuffkeep )
		if PlayerPEID ~= 0 and PEBuffkeep ~= 0 then
			CancelBuff( Player, ZonePE_BuffType[PlayerPEID][PEBuffkeep] )
		end
		CancelBuff( Player, EM_LuaValueFlag_PEBuffKeep2 )
		WriteRoleValue( Player, EM_LuaValueFlag_PECount, 0 )--任務完成次數
		DebugMsg( 0,0,"CleanQuestBuff ; FinCount = "..ReadRoleValue( player, EM_LuaValueFlag_PECount ))		
	end
	WriteRoleValue( Player, EM_LuaValueFlag_PENum, NpcPEID )--寫入PEID
	local BuffNum = table.getn(ZonePE_BuffType[NpcPEID])	--此PE存在的BUFF數量
	local BuffStatus = {} --紀錄BUFF狀態
	local nilSite = {} -- 可給予狀態位置
	
	for i=BuffNum, 1, -1 do
		local pow = math.pow( 2, i-1 )
		if Binary >= pow then
			Binary = Binary - pow
			BuffStatus[i] = 1
		else
			BuffStatus[i] = 0
		end
	end
	
	for i=1, table.getn(BuffStatus) do
		if BuffStatus[i] == 0 then
			table.insert( nilSite, i )
		end
	end
		
	local nilSiteNum = table.getn(nilSite)
	if nilSiteNum == 0 then 
		nilSiteNum = BuffNum
		WriteRoleValue( player, EM_LuaValueFlag_PEBuffTrace, 0 )--以二進位記錄目前已取得的BUFF  最多32個
		for i=1, nilSiteNum do
			nilSite[i] = i
		end
	end

	for i = 1, 8 do
		WriteRoleValue( Player, EM_RoleValue_Coldown_Job + 380+i , 0 )
	end

	math.randomseed(math.random(10000, 99999))
	local Rnd = math.random(nilSiteNum)
	--debugmsg(0,0,"nilSite[Rnd] = "..nilSite[Rnd])
	AddBuff( Player, ZonePE_BuffType[NpcPEID][nilSite[Rnd]], 0, -1 )--獲得對應BUFF
	WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep, nilSite[Rnd] )--寫入BUFF位置
	return true
end

--========================================================================================--

function KS_PEgetKey( Obj )--取得關鍵表現
	Obj = Obj or 105197
	ks_QuestKill( OwnerID(), Obj, 10 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
end

function KS_Clear_PEStatus()--清除PE狀態
	local player = OwnerID()
	WriteRoleValue( player, EM_LuaValueFlag_PEBuffTrace, 0 )--以二進位記錄目前已取得的BUFF  最多32個
	WriteRoleValue( player, EM_LuaValueFlag_PEBuffKeep, 0 )--目前擁有的BUFF編號
end


function Ks_Clear_PEBuff( PEID )--清除PE Buff
	local PEBuff = ZonePE_BuffType
	local OID = OwnerID()
	if PEID == nil then
		for PEID in pairs(PEBuff ) do
			for i=1, table.getn(PEBuff [PEID]) do
				CancelBuff( OID, PEBuff[PEID][i] )
			end
		end
	else
		if PEBuff [PEID] == nil then
			DebugMsg(0,0,"Clear PEBuff ... Error PEID !!")
			return
		end
		for i=1, table.getn(PEBuff [PEID]) do
			CancelBuff( OID, PEBuff[PEID][i] )
		end
	end
end