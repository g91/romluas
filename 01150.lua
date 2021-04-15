function LuaI_107_HarlonDoor()
	PlayMotionEX(OwnerID() ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Harlon = CreateObjByFlag( 100237 , 780237 , 0 , 1 )
	AddToPartition( Harlon , RoomID )
	SetFightMode( Harlon , 0 , 0 , 0 , 0 )
	SetDir( Harlon , 270 )
	SetPlot( Harlon , "Range" , "Lua_107_HarlonPlay_1" , 70 )
	SetPlot( Harlon , "Dead" , "Lua_107_HarlonDead" , 70 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	while 1 do
		if HateListCount( Harlon ) > 0 or CheckID(ReadRoleValue(Harlon ,EM_RoleValue_PID) ) == true then
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 0 then
				PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL)
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 7 )
			end
			sleep(60)
		else
			MoveToFlagEnabled( Harlon , true )

			if CheckBuff( Harlon , 502629 ) then
				CancelBuff( Harlon , 502629 )
			end

			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) > 0 then
				PlayMotionEX(OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			end
			sleep( 10 )
		end
	end
end

function Lua_107_HarlonPlay_1()
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 0 
	and ReadRoleValue( OwnerID() , EM_RoleValue_IsPlayer ) == 1 
	and CheckRelation( TargetID() , OwnerID() , EM_CheckRelationType_Attackable  ) == true then
		SetPlot( TargetID() , "Range" , "" , 0 )
		BeginPlot( TargetID() , "Lua_107_HarlonPlay_2" , 0 )
	end
end

function Lua_107_HarlonPlay_2()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , TargetID() )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	sleep(5)
	Yell( OwnerID() , "[SC_100237_0]" , 3 ) --很好！很好！這不是我們的客人嗎？
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 15 )
	Yell( OwnerID() , "[SC_100237_1]" , 3) --歡迎光臨我的...新家。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )
	Yell( OwnerID() , "[SC_100237_2]" , 3 ) --之前那些僕從們才剛被我雇用，所以招待不周，實在很抱歉。
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep( 15 )
	Yell( OwnerID() , "[SC_100237_3]" , 3 ) --這次，就讓我這個做主人的親自來款待各位吧！
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep( 15 )
	SetFightMode( OwnerID(), 1 , 1 , 1 , 1 )
	Hide( OwnerID() )
	Show( OwnerID() , RoomID )
	SetAttack( OwnerID() , TargetID() )
	BeginPlot( OwnerID() , "Lua_107_HarlonAI" , 0 )
end

function Lua_107_HarlonAI()
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	local HP
	local Count = 0
	local State = "First"
	local Pos = {}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local LittleKing = {}
	local Harlon = {}
	local Target = 0
	local xyz = {}
	xyz[0] =  GetMoveFlagValue(  780237 , 0 , EM_RoleValue_X )
	xyz[1] =  GetMoveFlagValue(  780237 , 0 , EM_RoleValue_Y )
	xyz[2] =  GetMoveFlagValue(  780237 , 0 , EM_RoleValue_Z )
	while 1 do
		if HateListCount( OwnerID() ) > 0 and ReadRoleValue( OwnerID() , EM_RoleValue_Z ) > 6250 then
			AddBuff( OwnerID(), 502707, 0, -1 )--非戰鬥不回血
			Target = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			HP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
			if HP < MaxHP*3/4 then
				Count = 0
				if State == "First" then --低於 75% 會停止行動並無敵，叫兩隻王出來對抗玩家
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100237_4]" , 1 ) --赫龍說：「抱歉，我必須去準備等會的重頭戲，請恕我失陪一下。」
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_100237_4]" , "0xffffff80" ) --赫龍說：「抱歉，我必須去準備等會的重頭戲，請恕我失陪一下。」
					State = "Second"
					SetFightMode( OwnerID(), 0 , 0 , 0 , 0 )--不可戰鬥
					CastSpell( OwnerID() , OwnerID() , 492359)
					sleep( 20 )
					SetPosByFlag( OwnerID() ,  780238 , 0 )
					SetDir( OwnerID() , 90 )					
					AddBuff( OwnerID() , 502629 , 1 , 120 )--免疫傷害
					PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SALUTE )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100237_5]" , 1 ) --赫龍說：「我不在的時候，這兩位會負責款待各位，請隨意，不用拘束。」
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_100237_5]" , "0xffffff80" ) --赫龍說：「我不在的時候，這兩位會負責款待各位，請隨意，不用拘束。」
					Sleep(10)
					SetDir( OwnerID() , 270 )
					CastSpell( OwnerID() , OwnerID() , 492388 )					
					LittleKing[1] = CreateObjByFlag( 101680, 780238 , 1 , 1 );
					LittleKing[2] = CreateObjByFlag( 101681, 780238 , 2 , 1 );
					for i = 1 , 2 , 1 do
						AddToPartition( LittleKing[i] , RoomID )
						WriteRoleValue(  LittleKing[i] , EM_RoleValue_PID , OwnerID() )
						CastSpell( LittleKing[i] , LittleKing[i] , 492359 )
						BeginPlot( LittleKing[i] , "Lua_107_HarlonSummon" , 0 )
						SetPlot( LittleKing[i] , "dead" , "Lua_107_HarlonLittleKing" , 0 )
						SetAttack( LittleKing[i] ,HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID ) ) --攻擊最高仇恨者
					end
					WriteRoleValue(  LittleKing[1] , EM_RoleValue_Register , LittleKing[2]  )
					WriteRoleValue(  LittleKing[2] , EM_RoleValue_Register , LittleKing[1]  )
				end
				if CheckBuff( OwnerID() , 502629 ) == true and CheckID(LittleKing[1]) == false and CheckID(LittleKing[2]) == false  then
					CancelBuff( OwnerID() , 502629 )
				end
				if CheckBuff( OwnerID() , 502629 ) == false and State == "Second" then
					State = "Third"
					SetFightMode( OwnerID(), 1 , 1 , 1 , 1 )
					Hide( OwnerID() )
					Show( OwnerID() , RoomID)
--					EnableNpcAI( OwnerID() , true )
					AddBuff( OwnerID() , 502383 , 1 , 1 )
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100237_6]" , 1 ) --赫龍說：「讓各位久等了。」
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_100237_6]" , "0xffffff80" ) --赫龍說：「讓各位久等了。」
				end
				if State == "Third" or State == "Last02" then
					local Num = DW_Rand(100)
					local SpellCheck = "false"
					if Num < 16 and SpellCheck == "false" then
						for i = 0 , HateListCount( OwnerID() )  , 1 do
							local TempTarget = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )  
							local NowTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) 
							if TempTarget == NowTarget or GetDistance( NowTarget ,TempTarget ) <= 500 then
								if GetDistance( OwnerID(), Target ) < GetDistance( OwnerID(), TempTarget )  then
									Target = TempTarget
								end
							end
						end
						if CastSpellLV( OwnerID() , Target , 492391 , 29 ) == true then
							SpellCheck = "true"
						end
					elseif Num > 84 and SpellCheck == "false" then
						EnableNpcAI( OwnerID() , false )
						local Ghost = CreateObjByObj( 112047 , Target )
						DelFromPartition(Ghost)
						AddToPartition( Ghost , RoomID )
						SetModeEx( Ghost , EM_SetModeType_Mark, false) 
						SetModeEx( Ghost , EM_SetModeType_HideName, false) 
						SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
						SetModeEx( Ghost , EM_SetModeType_Strikback , false )
						WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 10 )
						if CastSpellLV( OwnerID() , Ghost , 492390 ,240 ) == true then
							SpellCheck = "true"
						end
						EnableNpcAI( OwnerID() , true );
					elseif Num < 57 and Num > 43 and SpellCheck == "false" then
						if CastSpellLV( OwnerID() , HateListInfo(OwnerID() ,1, EM_HateListInfoType_GItemID ) , 492389 , 440 ) == true then
							SpellCheck = "true"
						end
					else
						if math.floor(Num/2) == Num/2 and SpellCheck == "false" then
							CastSpellLV( OwnerID() , Target , 490629 , 440 )
							SpellCheck = "true"
						elseif SpellCheck == "false" then
							CastSpellLV( OwnerID() , Target , 490630 , 250)
							SpellCheck = "true"
						end
					end
				end
				if State == "Third" and HP <= MaxHP*0.2 then --低於 20% 會放一次天極炎雨龍閃
					DebugMsg(0,0,"Phase 4")
					State = "Last01"
					EnableNpcAI( OwnerID() , false );
					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100237_7]" , 1 ) --赫龍說：「今天的客人不同以往，看來不把最珍藏的東西拿出來款待是不行的。」
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_100237_7]" , "0xffffff80" ) --赫龍說：「今天的客人不同以往，看來不把最珍藏的東西拿出來款待是不行的。」
					sleep(50)
					CastSpell( OwnerID() , OwnerID() , 492387 )
					sleep(30)
					EnableNpcAI( OwnerID() , true );
					for i = 0 , HateListCount( OwnerID() ) -1 , 1 do
						local TP = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID ) 
						local TPID = Role:new( TP )
						Harlon[i] = CreateObj ( 100237 , TPID:X() , TPID:Y() , TPID:Z() , TPID:Dir() , 1 )
						AddToPartition( Harlon[i] , RoomID )
						WriteRoleValue( Harlon[i] , EM_RoleValue_LiveTime , 20 )
						SetModeEx( Harlon[i] , EM_SetModeType_Mark, false) 
						SetFightMode( Harlon[i] , 1 , 0 , 0 , 0 )
						CastSpellLV( Harlon[i] , Harlon[i] , 492392 ,200)
					end
					for i = 1 , 20 , 1 do
						local RandNum = Rand(HateListCount( OwnerID() ))
						local BeLocked =  HateListInfo(OwnerID() , RandNum , EM_HateListInfoType_GItemID )
						AddBuff( BeLocked , 502659 , 5 , 2 )
						local Dummy = LuaFunc_CreateObjByObj ( 100237 , BeLocked )
						DelFromPartition( Dummy )
						AddToPartition( Dummy , RoomID )
						WriteRoleValue( Dummy , EM_RoleValue_LiveTime , 10 )
						SetModeEx( Dummy , EM_SetModeType_Mark, false) 
						SetFightMode( Dummy , 0 , 0 , 0 , 0 )
						PlayMotion( Dummy ,ruFUSION_ACTORSTATE_BUFF_INSTANT )
						BeginPlot( Dummy , "Lua_107_SubHarlonCasting" , 0 )
						sleep( 10 )
					end
					State = "Last02"
				end
			else
--				EnableNpcAI( OwnerID() , false ); --75%以上會直接跟玩家打，並傳送目標以外的 4 名玩家到固定點，每 40 秒一次
				if Count == 50 then

					ScriptMessage( OwnerID() , -1 , 2 , "[SC_100237_8]" , 1 ) --赫龍說：「客人們，請移步到專門為您準備的位置，享受我僕役的熱情招待吧！」
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_100237_8]" , "0xffffff80" ) --赫龍說：「客人們，請移步到專門為您準備的位置，享受我僕役的熱情招待吧！」
					for i = 1 , 4 , 1 do
						local Obj = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )

						if Obj == Target then
							Obj = HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID )
						end

						if CheckID(Obj) == true and ReadRoleValue(Obj,EM_RoleValue_IsDead) ==0 then
							Pos[i] = Obj
							CastSpell( OwnerID() , Pos[i] , 492359 )
							SetPosByFlag( Pos[i] , 780237 , i )
						else
							Pos[i] = -1
						end
					end
					for i = 5 , 10 , 1 do
						local Flg
						Pos[i] = CreateObjByFlag( 101580, 780237 , i , 1 );
						AddToPartition( Pos[i] , RoomID )
						CastSpell( Pos[i] , Pos[i] , 492359 )
						BeginPlot( Pos[i] , "Lua_107_HarlonSummon" , 0 )
						SetPlot( Pos[i] , "dead" , "LuaFunc_DeadPlay" , 0 )
						if i < 8 then
							Flg = 1
						else
							Flg = 3
						end
						local Attack = Pos[Rand(2)+Flg]
						if Attack ~= -1 and ReadRoleValue( Attack , EM_RoleValue_IsDead ) == 0 and CheckID(Attack) == true then
							SetAttack( Pos[i] , Attack )
						else
							SetAttack( Pos[i] , HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID ) )
						end
					end
					Count = 0
					SetAttack( OwnerID() , Target )
				end
				local Num = Rand(100)

				if math.floor(Num/2) == Num/2 then
					CastSpellLV( OwnerID() , Target , 490629 , 240 )
				else
					CastSpellLV( OwnerID() , Target , 490630 , 140 )
				end
				Count = Count + 1
			end
			sleep(10)
		else
			DebugMsg(0,0,"break")
			State = "First"
			break
		end
	end
	MoveToFlagEnabled( OwnerID() , true )
--	EnableNpcAI( OwnerID() ,false );
	if CheckBuff( OwnerID() , 502629 ) == true then
		CancelBuff( OwnerID() , 502629 )
		AddBuff( OwnerID() , 502383 , 1 , 1 )
	end
	Move( OwnerID() , xyz[0] , xyz[1] , xyz[2] )

	local BuffTable = {};
	for i = 1 , BuffCount(OwnerID() ) do
		table.insert( BuffTable, BuffInfo( OwnerID() , i-1, EM_BuffInfoType_BuffID) );
	end

	for i=1, table.getn(BuffTable) do
		CancelBuff( OwnerID()  , BuffTable[i] )
		DebugMsg( 0,0,"BuffID = "..BuffTable[i] )
	end

	WriteRoleValue( OwnerID(), EM_RoleValue_HP, MaxHP )
	SetStopAttack(OwnerID() )
	sleep( 30 )
	SetPosByFlag( OwnerID() ,  780237 , 0 )
	SetDir( OwnerID()  , 270 )
	SetFightMode( OwnerID()  , 0 , 0 , 0 , 0 )
	SetPlot( OwnerID() , "Range" , "Lua_107_HarlonPlay_1" , 70 )
	Hide( OwnerID() )
	Show( OwnerID() , RoomID )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function Lua_107_HarlonSummon()
	sleep( 150 )
	MoveToFlagEnabled( OwnerID() , false )
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(30)	-- 六秒檢查一次	
		else
			if ReadRoleValue( Boss, EM_RoleValue_AttackTargetID ) ~= 0 then
				SetAttack( OwnerID() , ReadRoleValue( Boss, EM_RoleValue_AttackTargetID ) )
			else
				DelObj( OwnerID() )
			end
			break		
		end
	sleep(1)
	end
end

function Lua_107_HarlonDead()
	Yell( OwnerID() , "[SC_100237_9]" , 5 ) --沒想到...我赫龍的命運的盡頭就在這裡...
	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Party = LuaFunc_PartyData(TargetID()) 
	for i = 1 , Party[0] , 1 do
		if CheckAcceptQuest( Party[i] , 421670 ) == true then
			local Ghost = CreateObjByFlag( 112047 , 780238 , 0 , 1 )
			AddToPartition( Ghost , RoomID )
			BeginPlot( Ghost , "LuaI_112081" , 0)
		 	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
			SetModeEx( Ghost , EM_SetModeType_HideName, false) 
			SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
			SetModeEx( Ghost , EM_SetModeType_Strikback , false )
			break
		end
	end
	local ExitDoor =  CreateObjByFlag( 111432 , 780239 , 3 , 1 )
	SetModeEx( ExitDoor , EM_SetModeType_Mark, false) 
	SetModeEx( ExitDoor , EM_SetModeType_HideName, false) 
	SetModeEx( ExitDoor, EM_SetModeType_ShowRoleHead, false) 
	AddToPartition( ExitDoor , RoomID )
	BeginPlot( ExitDoor , "LuaI_107_OutDoor" , 0 )
	return true
end

function Lua_107_SubHarlon()
	for i = 1 , 10 , 1 do
		if ReadRoleValue( TaregtID() , EM_Rolevalue_IsDead ) == true or CheckID( TargetID() ) == false then
			break
		end
		sleep(10)
	end
	DelObj( OwnerID() )
end

function LuaI_107_OutDoor() --填一開始入口的劇情
	SetPlot( OwnerID() , "range" , "LuaS_107toZone6_1" , 10 )
end

function LuaI_112081()
	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	CastSpell( OwnerID() , OwnerID() , 490102 )
	sleep( 30 )
	local Ghost = CreateObjByFlag( 112081 , 780238 , 0 , 1 )
	AddToPartition( Ghost , RoomID )
	WriteRoleValue( Ghost , EM_RoleValue_PID , OwnerID() )
end

function LuaQ_421670_Complete()
	local Party = LuaFunc_PartyData(TargetID()) 
	local State = "OK"
	local Effect = ReadRoleValue( OwneeID() , EM_RoleValue_PID )
	for i = 1 , Party[0] , 1 do
		if CheckAcceptQuest( Party[i] , 421670 ) == true and CheckCompleteQuest( Party[i] , 421670 ) == false then
			State = "NO"
		end
	end

	if State == "OK" then
		DisableQuest( OwnerID() , false )
		Hide( OwnerID() )
		sleep( 50 )
		Delobj( Effect)
		sleep( 1 )
		Delobj( OwnerID() )
	end
end

function LuaSpell_DragonSlash( Type )
	EnableNpcAI( OwnerID() , false );
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Tar = Role:new( TargetID() )
	local Me = Role:new( OwnerID() )
	local X = Tar:X() - Me:X()
	local Z = Tar:Z() - Me:Z()
	local Pos = {}
	local Dis = GetDistance( OwnerID() , TargetID() )
	local Rate
	if Dis < 1 then
		Rate = 0
	else
		Rate = ( Dis + 35 )/Dis
	end
		
	Pos["X"] = Me:X() + (X*Rate)
	Pos["Z"] = Me:Z() + (Z*Rate)
	Pos["Y"] = GetHeight( Pos["X"] , Me:Y() , Pos["Z"] );

	if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == true then
		Pos["X"] = Tar:X()
		Pos["Y"] = Tar:Y()
		Pos["Z"] = Tar:Z()
	end
	SetPos( OwnerID(), Pos["X"], Pos["Y"], Pos["Z"] , Me:Dir() )
	AddToPartition( OwnerID() , RoomID )
	AddBuff( OwnerID() , 502660 , 1 , 1 )
	EnableNpcAI( OwnerID() , true )
	if Type == nil or Type == 0 or Type == false or Type == -1 then
		SetAttack( OwnerID() ,  HateListInfo(OwnerID() , 0 , EM_HateListInfoType_GItemID ) )
	else
		SetAttack( OwnerID() , TargetID()  )
	end
end

function LuaSpell_FireRain()
	EnableNpcAI( OwnerID() , false );
	local MagicStr = "SpellMagic"
	local MagicLVStr = "SpellMagicLv"
	local LV
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 1 , 8 , 1 do
		local Magic = MagicStr..i
		local MagicLV = MagicLVStr..i
		if GameObjInfo_Int(OrgID,Magic ) == 492370 then
			LV = GameObjInfo_Int(OrgID,MagicLV )
			break
		end
	end

	local RoomID = ReadroleValue( OwnerID() , EM_RoleValue_RoomID )
	local Ghost = CreateObjByObj( 112047 , TargetID() )
	DelFromPartition( Ghost , RoomID )
	AddToPartition( Ghost , RoomID )
	SetModeEx( Ghost , EM_SetModeType_Mark, false) 
	SetModeEx( Ghost , EM_SetModeType_HideName, false) 
	SetModeEx( Ghost, EM_SetModeType_ShowRoleHead, false) 
	SetModeEx( Ghost , EM_SetModeType_Strikback , false )
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 30 )
	CastSpellLV( OwnerID() , Ghost , 492390 ,LV )
	EnableNpcAI( OwnerID() , true );
end

function Lua_107_HarlonLittleKing()
	local Herlon = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local LittleKing = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	if CheckID( LittleKing ) == false or ReadRoleValue( LittleKing , EM_RoleValue_IsDead) ==1 or ReadRoleValue( LittleKing , EM_RoleValue_IsPlayer) ==1 or ReadRoleValue( LittleKing , EM_RoleValue_RoomID) ~= Room then
		if CheckBuff( Herlon , 502629 ) == true and ReadRoleValue( Herlon , EM_RoleValue_RoomID) == Room and ReadRoleValue( Herlon , EM_RoleValue_IsPlayer) ~=1 then
			CancelBuff( Herlon , 502629 )
			--yell(  Herlon  , " Disable Buff 1 " , 7 )
		end
	end
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function Lua_107_SubHarlonCasting()
	sleep( 30 )
	CastSpellLV( OwnerID() , OwnerID() , 492392 , 120 )
end