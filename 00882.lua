function LuaS_TheThiefKing_BossBattle( D )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local State = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 ) 
	local Door = D
	local BossID = {[0] = 100925 , [1] = 100918 , [2] = 100919 , [3] = 100920 , [4] = 100921 , [5] = 100922 }
	local BossAI = {[0] = "AI_TreatureGuard" , 
			[1] = "LuaS_TheThiefKing_Dead" ,
			[2] = "LuaS_TheThiefKing_Dead" , 
			[3] = "LuaS_TheThiefKing_Dead" , 
			[4] = "LuaS_TheThiefKing_Dead" , 
			[5] = "LuaS_TheThiefKing_Dead"}
	local FlagID = 780095
	local Char
	local AI
	local Player 
	if State < 7 then
		local RandNum 
		RandNum = Rand(100)
		RandNum = ( RandNum - math.floor( RandNum/10 )*10 ) 
		RandNum = ( RandNum  - math.floor( RandNum /5 )*5 ) +1

		Char = BossID[RandNum]
		AI = BossAI[RandNum]
		Player = ReadRoleValue(  OwnerID(), EM_RoleValue_Register + 8 )
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_11"), 1 ); --薩斯柯特的幻影喊到：恭喜你們！寶藏即將出現，打倒它吧！你們的獎勵就在它的身上！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		end

	else
		Char = BossID[0]
		AI = BossAI[0]
		Player = ReadRoleValue(  OwnerID() , EM_RoleValue_Register + 8 )
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_12"), 1 ); --薩斯柯特的幻影喊到：最後的機會！最後的寶藏！來吧！讓我們享受最後的戰鬥！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
		end

	end
	for i = 1 , 5 , 1 do
		PlayMotionEX( Door[i] , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		sleep(15)
	end
	local Boss = CreateObjByFlag( Char , FlagID , 0 , 1 );
	AddToPartition( Boss, RoomID )
	BeginPlot( Boss, AI , 0)
	SetPlot( Boss , "Dead" , "LuaS_TheThiefKing_BossDead" , 40 )
	WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID() )
	local Check
	while 1 do
		Check = "Clear"
		if CheckID( Boss ) then
			Check = "ATTACK"
		end

		if Check == "Clear" then
			break
		end
		sleep(5)
	end
	BeginPlot( OwnerID() , "LuaS_TheThiefKing_Reset" , 0 )
end

function LuaS_TheThiefKing_BossDead()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local ThiefKing = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local State = ReadRoleValue( ThiefKing, EM_RoleValue_Register + 9 )
	State = State + 2 
	WriteRoleValue( ThiefKing, EM_RoleValue_Register + 9 , State ) 
	return true
end

function LuaS_TheThiefKing_Reset()
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local FlagID = 780095
	local State = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 )
	local Door = {}
	local Player
	for i = 1 , 7 , 1 do
		Door[i] = ReadRoleValue( OwnerID() , EM_RoleValue_Register + i )
	end

	for i = 1 , 5 , 1 do
		PlayMotion( Door[i] , ruFUSION_ACTORSTATE_ACTIVATE_END )
		sleep(15)
	end

	if ( State ) < 9 then
		DisableQuest( OwnerID() , false)
		Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 8 )
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_13"), 1 ); --薩斯柯特的幻影喊到：喘息一下吧！我們的遊戲還沒結束呢！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		end
	else
		DisableQuest( OwnerID() , false)
		Player = ReadRoleValue(  OwnerID() , EM_RoleValue_Register + 8 )
		local Party = LuaFunc_PartyData(Player)
		for i = 1 , Party[0] , 1 do
			ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_14"), 1 ); --薩斯柯特的幻影喊到：遊戲結束了，走吧！帶走你們的贓物，回到你們的地方吧！
			PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )
		end
		AddToPartition( Door[7], RoomID )
		SetPlot( Door[7] , "range" , "LuaS_ZONE251_OUT" , 50 )
	end
end

function LuaS_TheThiefKing_Fail(D)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )
	local State = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 ) 
	local EXMonsterID = 100924
	local MonsterID = 100923
	local FlagID = 780095
	local Monster = {}
	local EXMonsterCount = 0
	local Door = D
	local Player

	Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 8 )
	local Party = LuaFunc_PartyData(Player)
	for i = 1 , Party[0] , 1 do
		ScriptMessage( Party[i], Party[i], 0,GetString("SC_111368_15"), 1 ); --薩斯柯特的幻影喊到：喔！遊戲的規則是答錯者必須接受懲罰。
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	end

	for i = 1 , 3 , 1 do
		for j = 1 , 6 , 1 do
			local Count = ((i-1)*6 + j)
			if EXMonsterCount < State then
				if j == 1 or j == 3 or j == 5 then 
					Monster[Count] = CreateObjByFlag( EXMonsterID , FlagID , j+5, 1 );
					EXMonsterCount = EXMonsterCount + 1
				else
					Monster[Count] = CreateObjByFlag( MonsterID , FlagID , j+5 , 1 );
				end
			else
				Monster[Count] = CreateObjByFlag( MonsterID , FlagID , j+5 , 1 );
			end
			AddToPartition( Monster[Count], RoomID )
			SetPlot(Monster[Count],"dead", "LuaFunc_DeadPlay" , 40 )
			BeginPlot(Monster[Count], "LuaS_TheThiefKing_Dead" , 0 )
		end
	end
	local Check
	while 1 do
		Check = "Clear"
		for i = 1 , 18 , 1 do
			if CheckID(Monster[i] ) then
				Check = "ATTACK"
			end
		end
		if Check == "Clear" then
			break
		end
		sleep(5)
	end
	BeginPlot( OwnerID() , "LuaS_TheThiefKing_Reset" , 0 )
end

function LuaS_TheThiefKing_Dead()
	local Obj = Role:new( TargetID() )
	local Player = ReadRoleValue( TargetID() , EM_RoleValue_Register + 8 )
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID )

	if ReadRoleValue( Player , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( Player , EM_RoleValue_IsPlayer ) == 1 then
		SetAttack( OwnerID() , Player )
	else
		Move( OwnerID() , Obj:X() , Obj:Y() , Obj:Z() )
	end

	LuaFunc_Obj_Suicide(150)
end