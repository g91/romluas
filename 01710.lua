--抓取區域玩家
function LuaPE_ZONE15_GetAreaPlayer( AreaID )
	local TestID = 1	-- 測試區
	local AreaPlayer = {}
	local ZonePlayer = {}
	local RoomID = 0

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- 回傳找到個數
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- 取得搜尋到的玩家
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , AreaID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- 搜尋到這個分區的玩家就加進去
		end
	end

	return AreaPlayer;
end

--停止戰鬥
function LuaPE_ZONE15_StopAttack( Player )
	Hide( Player )
	SetModeEx( Player , EM_SetModeType_Strikback , false )		-- 反擊
	SetModeEx( Player , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( Player , EM_SetModeType_Fight , false )			-- 可砍殺攻擊		
	ClearHateList( Player, -1 )  
	SetStopAttack( Player )
	WriteRoleValue( Player , EM_RoleValue_IsAttackMode , 0 )
	Show( Player , 0 )
end

function LuaPE_ZONE15_InCombat( Obj )--是否戰鬥中	
	if ReadRoleValue( Obj, EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Obj ) == 0 then
		return false
	else
		return true
	end
end

function LuaPE_ZONE15_ObjGoFlag( Player , FlagObjID , FlagGoID , Range )--物件移動
	local X = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local Y = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
	
	while true do					
		if LuaPE_ZONE15_InCombat( Player ) == true then
			sleep(50)
		else
			local Rnd = Rand( Range )
			local op = {}
			op[1]=1+Rnd
			op[2]=1-Rnd	
		
			local mX = X + op[rand(2)+1]
			local mZ = Z + op[rand(2)+1]
			MoveDirect( Player, mX , Y , mZ )
		end
		Sleep( 15 )
	end

	return true
end

--控制物件設定
function LuaPE_ZONE15_ControllerSet( ControllerID , FlagID , ControllerBronFlag , RoomID )
	
	local Controller = CreateObjByFlag( ControllerID , FlagID , ControllerBronFlag , 1 )
	SetModeEx( Controller , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( Controller , EM_SetModeType_Obstruct , true )			-- 阻擋
	SetModeEx( Controller , EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( Controller , EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( Controller , EM_SetModeType_Move , false )				-- 移動
	SetModeEx( Controller , EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( Controller , EM_SetModeType_HideName , false )			-- 名稱
	SetModeEx( Controller , EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( Controller , EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	SetModeEx( Controller , EM_SetModeType_Show , true )				-- 顯示
	AddToPartition( Controller , RoomID )
	return Controller;
end


function LuaPE_ZONE15_FormationPosition( X , Y , Z , Width , Height , Angle , Angle2 )--六角陣型設定區
	if Height == nil then Height = Width end
	if Angle2 == nil then Angle2 = 15 end

	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X+Height*math.cos(Angle*math.pi/180)	-- 前
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Height*math.sin(Angle*math.pi/180)

	Position["X"][2] = X-Width*math.sin(Angle*math.pi/180+Angle2)	-- 右前
	Position["Y"][2] = Y
	Position["Z"][2] = Z-Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][3] = X+Width*math.sin(Angle*math.pi/180-Angle2)	-- 左前
	Position["Y"][3] = Y
	Position["Z"][3] = Z+Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][4] = X-Width*math.sin(Angle*math.pi/180-Angle2)	-- 右後
	Position["Y"][4] = Y
	Position["Z"][4] = Z-Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][5] = X+Width*math.sin(Angle*math.pi/180+Angle2)	-- 左後
	Position["Y"][5] = Y
	Position["Z"][5] = Z+Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][6] = X-Height*math.cos(Angle*math.pi/180)	-- 後
	Position["Y"][6] = Y
	Position["Z"][6] = Z+Height*math.sin(Angle*math.pi/180)

	return Position;
end

function LuaPE_ZONE15_CheckLv( GUID, LV, MapID )
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

function LuaPE_ZONE15_GetBonus( PEIndex, mapID, Bonus, Dis, Obj2 )--(仇恨)分數計算				
	local HateList = {} 
	local Hate = {}
	local OID = OwnerID()
	if HateListCount( OID ) > 1 then
		for i = 1 , HateListCount( OID ) , 1 do
			local GUID = HateListInfo( OID,i-1 , EM_HateListInfoType_GItemID )
			if ReadRoleValue( GUID, EM_RoleValue_IsPlayer ) == 1 then
				table.insert( HateList, HateListInfo( OID,i-1 , EM_HateListInfoType_HatePoint ) )
				table.insert( Hate, GUID )
			end
			
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
	elseif HateListCount( OID ) ==1 then
		Hate[1] = HateListInfo( OID, 0 , EM_HateListInfoType_GItemID )
	end
	if table.getn( Hate ) > 0 then
		LuaPE_ZONE15_SetBonus( PEIndex, mapID, Bonus, Hate[1], Dis, Obj2 )
	end
end

function LuaPE_ZONE15_SetBonus( PEIndex, mapID, Bonus, Obj, Dis, Obj2  )--(指定)分數計算
	local rate
	local Num
	local getPlayer = {}
	local PartyPlayer
	local PartyPlayerNum
	Bonus = math.floor(Bonus)
	if ReadRoleValue( obj, EM_RoleValue_IsPlayer ) == 0 then return end

	PartyPlayerNum = GetPartyID( Obj, -1 )
	if Obj2 ~= nil and GetDistance( OwnerID(), Obj2 ) < Dis then
		if PartyPlayerNum == 0 then
			PE_GivePlayerScore( PEIndex , Obj, Bonus ) -- 玩家一人獎勵積分100%
		else
			for i = 0, PartyPlayerNum do
				PartyPlayer = GetPartyID( Obj, i )
				if CheckID( PartyPlayer ) == true and PartyPlayer ~= nil and GetDistance( OwnerID(), Obj2 ) < Dis then
					table.insert( getPlayer, PartyPlayer )
				end
			end
			Num = table.getn(getPlayer)
			rate =  ( 3.5*Num+6.5 ) / 10
			for i = 1, Num do		
				PE_GivePlayerScore( PEIndex , getPlayer[i] , Bonus*rate/Num )	-- 多人獎勵積分
			end				
		end
		return
	end
	
	if PartyPlayerNum == 0 and ( DW_CheckMap( Obj, mapID ) == true or DW_CheckMap( Obj, 1 ) == true )then 
		PE_GivePlayerScore( PEIndex , Obj, Bonus ) -- 玩家一人獎勵積分100%
	else
		for i = 0, PartyPlayerNum do
			PartyPlayer = GetPartyID( Obj, i )
			if CheckID( PartyPlayer ) == true and PartyPlayer ~= nil and ( DW_CheckMap( PartyPlayer, mapID ) == true or  DW_CheckMap( PartyPlayer, 1 ) == true ) then
				table.insert( getPlayer, PartyPlayer )
			end
		end
		Num = table.getn(getPlayer)
		rate =  ( 3.5*Num+6.5 ) / 10
		for i = 1, Num do		
			PE_GivePlayerScore( PEIndex , getPlayer[i] , Bonus*rate/Num )	-- 多人獎勵積分
		end		
	end	
end