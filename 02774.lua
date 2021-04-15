------------------------------------------------------------
--功能：依條件（依距離、依仇恨）排序資料
--輸入：玩家編號表、條件資料表、排序條件（0 = 遞增、1 = 遞減）
--輸出：排序過的玩家編號表、排序過的條件資料表
------------------------------------------------------------
function LUA_YOYO_Sequence(PlayerTable , ConditionTable , Lift)
	local GroupTable = {}
	local SortPlayerTable = {}
	local SortConditionTable = {}
	local TableComp

	for SN = 1 , table.getn(PlayerTable) do
		GroupTable[SN]={PlayerTable[SN] ,ConditionTable[SN]};
	end

	if Lift == 0 then
		TableComp = function (A,B) return A[2] < B[2] end --條件設為遞增排序
	else
		TableComp = function (A,B) return A[2] > B[2] end --條件設為遞減排序
	end
	table.sort( GroupTable , TableComp) --照條件排序Table的資料

	for SN = 1 , table.getn(PlayerTable) do
		SortPlayerTable[SN] = GroupTable[SN][1];
		SortConditionTable[SN] = GroupTable[SN][2];
		--print(SortPlayerTable[SN].."  "..SortConditionTable[SN])
	end

	return SortPlayerTable , SortConditionTable
end

------------------------------------------------------------
--功能：將場上的所有玩家編號列進Table
--輸入：場景的編號RoomID
--輸出：搜尋出的所有玩家編號清單
------------------------------------------------------------
function LUA_YOYO_GetAllPlayer( RoomID )
	local PlayerCount = SetSearchAllPlayer( RoomID ) --場上玩家清單
	local PlayerList = {}
	for Count = 1 , PlayerCount do
		PlayerList[Count] = GetSearchResult()
	end
	return PlayerList
end

------------------------------------------------------------
--功能：將場上的所有符合某編號的NPC
--輸入：場景的編號RoomID、NPC編號
--輸出：搜尋出的所有符合該NPC編號的清單
------------------------------------------------------------
function LUA_YOYO_GetSpecificNPC( RoomID , NPCID )
	local NPCCount = SetSearchAllNPC( RoomID ) --場上所有NPC清單
	local SearchNPC
	local AllNPCList = {}
	local NPCList = {}
	for Count = 1 , NPCCount do
		AllNPCList[Count] = GetSearchResult()
		SearchNPC = ReadRoleValue( AllNPCList[Count] , EM_RoleValue_OrgID  )
		if SearchNPC == NPCID then
			table.insert( NPCList , AllNPCList[Count] )
			--DebugMsg( 0 , RoomID , "Search NPC OrgID is " .. SearchNPC )
		end
	end
	return NPCList
end
------------------------------------------------------------
--功能：從仇恨列表取得隨機玩家，並且要排除GM
--輸入：Boss編號、要取得的玩家數量、是否需要排除坦克
--輸出：取出的玩家清單
------------------------------------------------------------
function LUA_YOYO_RandPlayerNotGM( BossID , HowMuch , AntiTank ) --HowMuch填入多少就是取多少個玩家，AntiTank填TRUE就是要排坦
	local Hate = KS_GetHateList( BossID , 4 ) --Type = 4 : 排除GM
	local TargetPlayer = {} --玩家陣列
	local RPX = 0 --亂數

	if AntiTank == "TRUE" then --判斷是否需要排除坦克
		table.remove( Hate , 1 )	
	end

	local HateCount = table.getn( Hate )

	RPX = DW_Rand(HateCount)
	if HowMuch < HateCount then
		for Count = 1 , HowMuch do
			RPX = RPX + ( HateCount - 1 )
			if RPX <= HateCount then
				TargetPlayer[Count] = Hate[RPX]
			else
				RPX = RPX - HateCount
				TargetPlayer[Count] = Hate[RPX]
			end
		end
		return TargetPlayer
	else
		return Hate
	end
end
------------------------------------------------------------
--功能：取得範圍內的玩家清單，並且要排除自己與GM
--輸入：圓心物件編號、搜尋範圍的半徑距離
--輸出：取出的玩家清單
------------------------------------------------------------
function LUA_YOYO_RangePlayerNotGM( CenterID , Range )
	local RangePlayerTable = SearchRangePlayer( CenterID , Range ) --抓取自己距離30的所有玩家
	local FilterPlayerTable = {}
	
	for I = 0 , #RangePlayerTable do
		if ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_VOC ) ~= 0 
		and RangePlayerTable[ I ] ~= CenterID then
			table.insert( FilterPlayerTable , RangePlayerTable[ I ] )	--如果清單中的玩家不是自己也非GM，則改寫到FilterPlayerTable
		end
	end
	return FilterPlayerTable
end


--K.J. Aris 131204
--功能：取得範圍內的玩家清單，並且要排除自己與GM
--輸入：圓心物件編號、搜尋範圍的半徑距離、死亡排除(Boolean)
--輸出：取出的玩家清單
------------------------------------------------------------
function LUA_YOYO_RangePlayerNotGM_EX( CenterID , Range , DeathPreclude )
	local RangePlayerTable = SearchRangePlayer( CenterID , Range ) --抓取自己距離30的所有玩家
	local FilterPlayerTable = {}
	local _deathPreclude =  DeathPreclude or false;
	
	for I = 0 , #RangePlayerTable do
		if ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_VOC ) ~= 0 
		and RangePlayerTable[ I ] ~= CenterID  and ReadRoleValue( RangePlayerTable[ I ] , EM_SetModeType_Fight ) then


			if ( _deathPreclude ) then
				if ( ReadRoleValue( RangePlayerTable[ I ] , EM_RoleValue_IsDead ) ~= 1 ) then
					table.insert( FilterPlayerTable , RangePlayerTable[ I ] );
					--DebugMsg( 0 , 0 , "---Player alive : "..RangePlayerTable[ I ] );
				else
					--DebugMsg( 0 , 0 , "---Player is dead : "..RangePlayerTable[ I ] );
				end
			else
				table.insert( FilterPlayerTable , RangePlayerTable[ I ] );	--如果清單中的玩家不是自己也非GM，則改寫到FilterPlayerTable
			end

			
		end


	end
	return FilterPlayerTable
end