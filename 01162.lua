function Lua_race_trap()	--問號印記效果
	local name = GetName( OwnerID() )
	local RandomNumber = Rand(10)
	local CheckBuffID = {	503066,
				503067,	
				503068,	
				503069,	
				503071,	
				503072,	
				503073,	
				503074,	
				503075,	}
	--	Say(OwnerID(),"The Magic is "..RandomNumber)
	if RandomNumber == 0 then
		AddBuff(OwnerID(),CheckBuffID[1],0,-1)	--減速陷阱
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_00][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 1 then
		AddBuff(OwnerID(),CheckBuffID[2],0,-1)	--加速陷阱
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_01][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 2 then
		AddBuff(OwnerID(),CheckBuffID[3],0,-1)	--定身陷阱
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_02][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 3 then
		AddBuff(OwnerID(),CheckBuffID[4],0,-1)	--特技：冰天雪地	
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_03][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 4 then
		AddBuff(OwnerID(),502500,0,3)		--恐懼
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_10][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 5 then
		AddBuff(OwnerID(),CheckBuffID[5],0,-1)	--特技：蛛網殘身
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_05][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 6 then
		AddBuff(OwnerID(),CheckBuffID[6],0,-1)	--巨木橫生
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_06][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 7 then
		AddBuff(OwnerID(),CheckBuffID[7],0,-1)	--天旋地轉
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_07][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 8 then
		AddBuff(OwnerID(),CheckBuffID[8],0,-1)	--範圍減速陷阱
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_08][$SETVAR1 = "..name.."]" , 0 )
	elseif  RandomNumber == 9 then
		AddBuff(OwnerID(),CheckBuffID[9],0,-1)	--範圍加速陷阱
		ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_09][$SETVAR1 = "..name.."]" , 0 )
	--elseif  RandomNumber == 10 then
		--AddBuff(OwnerID(),CheckBuffID[5],0,-1)	--特技：快馬加鞭
		--ScriptMessage( OwnerID(), -1, 2, "[SC_RACE_TRAP_04][$SETVAR1 = "..name.."]" , 0 )
	end
end

function Lua_race_DelOwner()
	Sleep(200)
	DelObj(OwnerID())
end

-------特技：冰天雪地
function Lua_race_other_slow()
	local Obj
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true and ID ~= OwnerID() then
				AddBuff(ID,502711,0,5)		--減速5秒
			end
		end	
	end
end
----------特技：蛛網殘身 最近3ㄍ人
function Lua_race_other_bind()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local CC = 1
	local CountWinnerF = {}
	local HitTaget = {}
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true and ID ~= OwnerID() then
				--Say(ID,"dis="..GetDistance( OwnerID(), ID ).." ID="..ID.." i="..i)
				CountWinnerF[CC] = ID
				CC= CC + 1
			end
		end	
	end
	local CountHit = CountWinnerF
	for j=1, 3 do
		local Min
		for i=1, table.getn(CountHit) do
			if Min == nil then
				HitTaget[j] = CountHit[i]
				Min = i
			--	Say(OwnerID(),"i = "..i.." 1HitTaget( "..j.." ) = "..HitTaget[j].." GetDistance="..GetDistance( OwnerID(), HitTaget[j] ))
			end
			if GetDistance( OwnerID(), CountHit[i] ) > 0 and GetDistance( OwnerID(), CountHit[i] ) < GetDistance( OwnerID(), CountHit[Min] ) then
				HitTaget[j] = CountHit[i]
				Min = i
			--	Say(OwnerID(),"i = "..i.." 3HitTaget( "..j.." ) = "..HitTaget[j].." GetDistance="..GetDistance( OwnerID(), HitTaget[j] ))
			end
		end
		if HitTaget[j] ~= OwnerID() and HitTaget[j] ~= nil then
			AddBuff(HitTaget[j] ,502710,0,3)		--定身3秒
		end
		table.remove(CountHit,Min)
	end

end
-----------巨木橫生
function Lua_race_barrier()
	local Obj
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true and ID ~= OwnerID() then
				local OldX = ReadRoleValue(  ID , EM_RoleValue_X )
				local OldY = ReadRoleValue(  ID , EM_RoleValue_Y )
				local OldZ = ReadRoleValue(  ID , EM_RoleValue_Z )
				local OldDir = ReadRoleValue(  ID , EM_RoleValue_Dir )
				local RoomID = ReadRoleValue(	ID , EM_RoleValue_RoomID)
				local Cal = (math.pi/180)*(OldDir) 
				--Say(OwnerID(),"OldDir="..OldDir.." cal="..Cal.." cos="..math.cos(Cal).." sin="..math.sin(Cal))
				local dis = 100
				local hindrance = CreateObj( 112153, OldX+ dis*math.cos(Cal),OldY+5 ,OldZ -dis*math.sin(Cal),OldDir , 1 )
				SetModeEx( hindrance, EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx( hindrance, EM_SetModeType_Strikback, false )--反擊
				SetModeEx( hindrance, EM_SetModeType_Mark, false )--標記
				SetModeEx( hindrance, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
				SetModeEx( hindrance, EM_SetModeType_Obstruct, true )--阻擋
				SetModeEx( hindrance, EM_SetModeType_Gravity, true )--重力
				SetModeEx( hindrance, EM_SetModeType_Move, false )--移動
				SetModeEx( hindrance, EM_SetModeType_ShowRoleHead, false )--頭像框
				SetModeEx( hindrance, EM_SetModeType_Searchenemy, false )--索敵
				AddToPartition( hindrance ,  RoomID  )
				Hide(hindrance)
				Show(hindrance,RoomID)
				BeginPlot(hindrance,"Lua_race_DelOwner", 0 )
			end
		end	
	end
end
-----------天旋地轉 最近一ㄍ人
function Lua_race_whirl()
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local CC = 1
	local CountWinnerF = {}
	local HitTaget
	local Min
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true and ID ~= OwnerID() then
				--Say(ID,"dis="..GetDistance( OwnerID(), ID ).." ID="..ID.." i="..i)
				CountWinnerF[CC] = ID
				CC= CC + 1
			end
		end	
	end
	for i=1, table.getn(CountWinnerF) do
		if Min == nil then
			HitTaget = CountWinnerF[i]
			Min = GetDistance( OwnerID(), HitTaget )
			--Say(OwnerID(),"1CountWinnerF[i]="..HitTaget.."GetDistance="..GetDistance( OwnerID(), HitTaget ))
		end
		if GetDistance( OwnerID(), CountWinnerF[i] ) then
			if GetDistance( OwnerID(), CountWinnerF[i] ) > 0 and GetDistance( OwnerID(), CountWinnerF[i] ) < Min then
				HitTaget = CountWinnerF[i]
				Min = GetDistance( OwnerID(), HitTaget )
				--Say(OwnerID(),"3CountWinnerF[i]="..HitTaget.."GetDistance="..GetDistance( OwnerID(), HitTaget ))
			end
		end
	end
	if HitTaget ~= OwnerID() and HitTaget ~= nil then
		AddBuff(HitTaget,502500,0,3)		--定身3秒
	end
end
--------清除持有特技
function Lua_race_buffclear()	
	local Count = BuffCount ( OwnerID())
	local BuffID = 0
	local CheckBuffID = {	503066,
				503067,	
				503068,	
				503069,	
				503071,	
				503072,	
				503073,	
				503074,	
				503075,	}
	for i = 1 , Count do
		local BuffID = BuffInfo ( OwnerID() , Count-i , EM_BuffInfoType_BuffID )
		for j = 0 , table.getn(CheckBuffID) do
			if BuffID == CheckBuffID[j] then
				CancelBuff( OwnerID() , BuffID )
			end
		end
	end
end

function Lua_RaceRideing()
		while 1 do
		local Obj
		local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
		local Count = SetSearchAllPlayer(RoomID)
		if count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				if Obj:IsPlayer() == True then
					if CheckBuff( ID, 502689) then
					else
						AddBuff(ID  , 503070, 0 , -1)
						AddBuff(ID  , 502689, 0 , -1)
					end
				end
			end	
		end
	Sleep(50)
	end
end