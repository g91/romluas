----------------------------- 王的初始劇情 -------------------------------------------
function LuaI_103212_0()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	----------- 建立最後的門 --------------------------------------
	local Door = {}
	Door[1] = CreateObjByFlag( 102439 , 780412 , 12 , 1 )
	Door[2] = CreateObjByFlag( 102439 , 780412 , 13 , 1 )
	Door[3] = CreateObjByFlag( 102439 , 780412 , 14 , 1 )
	for i = 1 , 3 , 1 do
		SetModeEX( Door[i] , EM_SetModeType_Obstruct , true )
		SetModeEX( Door[i] , EM_SetModeType_Gravity , false )
		SetModeEX( Door[i] , EM_SetModeType_Fight , false )
		SetModeEX( Door[i] , EM_SetModeType_Searchenemy, false )
		SetModeEX( Door[i] , EM_SetModeType_Strikback, false )
		Lua_ObjDontTouch( Door[i] )
		AddToPartition( Door[i] , RoomID )
		WriteRoleValue( Door[i] , EM_RoleValue_PID , OwnerID() )
	end
	for i = 1 , 2 , 1 do
		BeginPlot( Door[i] , "LuaI_103212_CheckBoss" , 0 )
	end

	BeginPlot( Door[3] , "LuaI_103212_BlockCheck" , 0 )
	-------- 執行流程控制迴圈 ------------------------------------
	BeginPlot( OwnerID() , "LuaAI_103212_Battle" , 0 )
end
--------------------------------- 王的死亡劇情 ------------------------------------------
function LuaI_103212_Dead()
	---死亡紀錄
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog( OwnerID() , 103212 , " Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )
	---清除第二階段的 Buff 
	local StepTwoBuff = { 504139 , 504140 , 504141 , 504142 , 504143 , 504144 }
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID )
	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if CheckID(ID) == true then
			for pry , obj in pairs(StepTwoBuff) do
				if CheckBuff( ID , Obj ) == true then
					CancelBuff_NoEvent( ID, Obj )
				end
			end
		end

	end
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_7]" , 0 ) --[102430]：世界......必將接受......審判......
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102430_7]" , 0 )
	return true
end
--------------------------------- 王的戰鬥流程控制 AI --------------------------------------
function LuaAI_103212_Battle()

	local Step = 1
	local Count = 0
	local State = "OutBattle"
	local GuardianRanger = {103214,103215,103216,103217,103218,103219} --小怪的 ID
	local Rangers = {} -- 6 隻小怪
	local Slayer = {} --阻擋者以及消滅者
	local Aura = {} --門與光環
	local TriBall = {} --三顆球
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local BerserkBuff = 504269
	local BallAroundBuff = 504154
	local StepTwoCasting = 493809
	local StepTwoBuff = { 504139 , 504140 , 504141 , 504142 , 504143 , 504144 }
	local Min = 0
	local FlagPosA = {}
	local FlagPosB = {}
	local GuardianRangerA = {}
	local GuardianRangerB = {}
	local TempBall = {}

	while 1 do
		------------------------------ 把階段紀錄在自己的 PID 中，以供其他物件識別 ---------------------
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ~= Step then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , Step )
		end
		------------------------------ 戰鬥流程控制迴圈 -------------------------------------------------
		if HateListCount( OwnerID() ) > 0 then
			----------------------------- 戰鬥開始時的處理 -------------------------------------------------
			if State == "OutBattle" then
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_1]" , 0 ) --[102430]：愚蠢的入侵者！你們將為你們的罪行付出代價！
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102430_1]" , 0 )
				Slayer = LuaAI_103212_Slayer_0( RoomID )
				State = "InBattle"
			end
			-------------------------------第一階段--------------------------------------------------------
			if Step == 1 then 
				------------------------------------階段開始時決定亂數產生小怪的位置-------------------
				if Count == 0 then 
					Rangers = {} 
					for pry ,obj in pairs(GuardianRanger) do
						GuardianRangerA[pry] = obj
					end
					GuardianRangerB = {}
					FlagPosA = {}
					FlagPosB = {}
					for i = 1 , 6 , 1 do
						local Num = DW_Rand( table.getn(GuardianRangerA) )
						for j = 1 , 6 , 1 do
							if GuardianRangerA[Num] == 0 then
								Num = Num + 1
							else
								break
							end
							if Num > table.getn(GuardianRangerA) then
								Num = 1
							end
						end
						GuardianRangerB[i] = GuardianRangerA[Num]
						FlagPosA[i] = Num
						GuardianRangerA[Num] = 0
					end
					for i = 1 , 5 , 2 do
						FlagPosB[i] = FlagPosA[i+1]
						FlagPosB[i+1] = FlagPosA[i]
					end
				end
				--------------------------------- 產生第一波小怪，小怪的 id 會紀錄在 Rangers 這個 table 裡面 1 ~ 3 -----------
				if Count == 5 then
					ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_2]" , 0 ) --[102430]召喚了他的守衛！
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102430_2]" , 0 )
					for i = 1 , 3 , 1 do
						Rangers[i] = CreateObjByFlag( GuardianRangerB[i] , 780412 , FlagPosB[i] , 1 )
						AddToPartition( Rangers[i] , RoomID )
						CastSpell( Rangers[i] , Rangers[i] , 493776 )
						WriteRoleValue( Rangers[i] , EM_RoleValue_PID , OwnerID() )
						BeginPlot( Rangers[i] , "LuaAI_103212_Mobs_Check" , 0 )
						SetPlot( Rangers[i] , "dead" , "LuaAI_103212_StepOne_Dead" , 0 )
						SetAttack( Rangers[i] , ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) )
					end
				end
				--------------------------------- 產生第二波小怪，小怪的 id 會紀錄在 Rangers 這個 table 裡面 4 ~ 6 -----------
				if Count == 25 then
					ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_2]" , 0 ) --[102430]召喚了他的守衛！
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102430_2]" , 0 )
					for i = 4 , 6 , 1 do
						Rangers[i] = CreateObjByFlag( GuardianRangerB[i] , 780412 , FlagPosB[i] , 1 )
						AddToPartition( Rangers[i] , RoomID )
						CastSpell( Rangers[i] , Rangers[i] , 493776 )
						WriteRoleValue( Rangers[i] , EM_RoleValue_PID , OwnerID() )
						BeginPlot( Rangers[i] , "LuaAI_103212_Mobs_Check" , 0 )
						SetPlot( Rangers[i] , "dead" , "LuaAI_103212_StepOne_Dead" , 0 )
						SetAttack( Rangers[i] , ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID ) )
					end
				end

			end
			-------------------------------第二階段--------------------------------------------------------
			if Step == 2 then
				---------------------------------- 先產生第三階段要用的 3 顆球在空中 ----------------------------
				local Pos ={}
				local X = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_X )
				local Y = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_Y )
				local Z = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_Z )
				local ID = {103213,103228,103229}
				CancelBuff_NoEvent( OwnerID() , BallAroundBuff )
				for i = 1 , 3 , 1 do
					Pos["X"] = X+150*math.cos(i*2*math.pi/3) 
					Pos["Z"] = Z+150*math.sin(i*2*math.pi/3) 
					Pos["Y"] = Y + 100 
					TriBall[i] = CreateObj ( ID[i] , Pos["X"] , Pos["Y"]  ,Pos["Z"] , 0 , 1)
					WriteRoleValue( TriBall[i] , EM_RoleValue_PID , OwnerID() )
					WriteRoleValue( TriBall[i] , EM_RoleValue_Register , i )
					WriteRoleValue( TriBall[i] , EM_RoleValue_Register+1 , 0 )
					SetModeEX( TriBall[i] , EM_SetModeType_Gravity , false )
					MoveToFlagEnabled( TriBall[i] , false )
					AddToPartition( TriBall[i] , RoomID )
					SetFightMode ( TriBall[i] , 0 , 1 , 0 , 0 )
					BeginPlot( TriBall[i] , "LuaAI_103212_BallAround" , 0 )
					SetPlot( TriBall[i] , "dead" , "LuaAI_103212_BallDead" , 0 )
				end
				---------------------------------- 隨機對所有玩家上 buff -------------------------------------
				local PPL = SetSearchAllPlayer(RoomID )
				local TempPPL = {}
				local Num = 1
				for i = 1 , PPL , 1 do
					local ID = GetSearchResult()
					if CheckID(ID) == true and ReadRoleValue( ID ,EM_RoleValue_IsDead ) == 0 and ReadRoleValue( ID , EM_RoleValue_VOC ) > 0 then
						TempPPL[Num] = ID
						Num = Num + 1
					end
				end
				Num = DW_Rand(6)
				local Delta = (-1)^DW_Rand(6)
				for pry , obj in pairs(TempPPL) do
					AddBuff( obj , StepTwoBuff[Num] , 0 , -1 )
					ScriptMessage( obj , obj , 1 , "[SC_102430_3]" , 0 ) --你感覺到似乎有一團火在你體內翻滾著！
					ScriptMessage( obj, obj , 0 , "[SC_102430_3]" , 0 )
					Num = Num + Delta
					if Num > 6 then
						Num = 1
					elseif Num < 1 then
						Num = 6
					end
				end
				-------------------------------- 施法 -----------------------------------------------------------
				EnableNpcAI( OwnerID() , false )
				sleep( 10 )
				ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_4]" , 0 ) --[102430]：感受吾等的憤怒吧！
				ScriptMessage( OwnerID(), -1 , 0 , "[SC_102430_4]" , 0 )
				CastSpell( OwnerID() , OwnerID() , StepTwoCasting )
				sleep( 110 )
				EnableNpcAI( OwnerID() , true );
				------------------------------- 第二階段結束時的處理 ---------------------------------------------
				Step = 3
			end
			-------------------------------第三階段--------------------------------------------------------
			if Step == 3 then
				-------------------------------- 亂數排列掉落的順序 --------------------------------------
				if Count == 0 then
					TempBall = {0,0,0}
					local Temp = TriBall
					for i = 1 , 3 , 1 do
						local Num = DW_Rand( table.getn(Temp) )
						for j = 1 , 3 , 1 do
							if Temp[Num] == 0 then
								Num = Num + 1
							else
								break
							end
							if Num > table.getn( Temp ) then
								Num = 1
							end
						end
						TempBall[i] = Temp[Num]
						Temp[Num] = 0
					end
				end
				-------------------------------- 改變球的檢查值以讓球落下 --------------------------------
				if Count == 0 or Count == 20 or Count == 40 then
					local Num = math.floor(Count/20)+1
					WriteRoleValue( TempBall[Num] , EM_RoleValue_Register+1 , 777 )
					if Num > 1 then
						if Lua_CheckObj_Exist( TempBall[Num-1] , 103213 , 0 , RoomID ) == true then
							DelObj( TempBall[Num-1] )
						end
						if Lua_CheckObj_Exist( TempBall[Num-1] , 103228  , 0 , RoomID ) == true then
							DelObj( TempBall[Num-1] )
						end
						if Lua_CheckObj_Exist( TempBall[Num-1] , 103229 , 0 , RoomID ) == true then
							DelObj( TempBall[Num-1] )
						end
					end
				end
			end
			------------------------------------------------- 迴圈計數器處理 ---------------------------------------------------------------------------
			Count = Count + 1
			------------------------------------------------- 每分鐘結束時的處理 -----------------------------------------------------------------------
			if Count >= 60 then
				Count = 0
				--------------------------------- 第一階段結束時的處理 --------------------------------------------------------
				if Step == 1 then
					Step = 2
				end
				-------------------------------- 第三階段結束時的處理 ----------------------------------------
				if Step == 3 then
					for pry , obj in pairs(TempBall) do
						if Lua_CheckObj_Exist( obj , 103213 , 0 , RoomID ) == true then
							DelObj( obj )
						end
						if Lua_CheckObj_Exist( obj , 103228 , 0 , RoomID ) == true then
							DelObj( obj )
						end
						if Lua_CheckObj_Exist( obj , 103229 , 0 , RoomID ) == true then
							DelObj( obj )
						end
					end
					for pry , obj in pairs(Rangers) do
						if CheckID(obj) == true and ReadRoleValue( Obj , EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( obj , EM_RoleValue_IsPlayer ) == 0 then
							DelObj( obj )
						end
					end
					local PPL = SetSearchAllPlayer(RoomID )
					for i = 1 , PPL , 1 do
						local ID = GetSearchResult()
						if CheckID(ID) == true then
							for pry , obj in pairs(StepTwoBuff) do
								if CheckBuff( ID , Obj ) == true then
									CancelBuff_NoEvent( ID, Obj )
								end
							end
						end
					end
					AddBuff( OwnerID() , BallAroundBuff , 0 , -1 )
					TriBall = {}
					Step = 1
				end
				-------------------------------------------- 分鐘計時器處理，10 分鐘到上狂暴 Buff --------------------------------------------------
				if Min >= 10 then
					ScriptMessage( OwnerID() , -1 , 1 , "[SC_102430_0]" , 0 ) --大廳深處突然傳出冰冷的聲音：審判已通過，允許解除中等武裝限制。
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102430_0]" , 0 )
					AddBuff( OwnerID() , BerserkBuff , 0 , -1 )
				else
					Min = Min + 1
				end
				---------------------------------------------------------------------------------------------------------------------------------------
			end
		else
			----------------------------- 戰鬥結束時的處理 -------------------------------------------------
			if State == "InBattle" then
				Step = 1 --重置階段
				CancelBuff_NoEvent( OwnerID() , BerserkBuff ) --消除掉狂暴 Buff
				Min = 0
				Count = 0
				State = "OutBattle" --戰鬥判斷重置
				local PlayerGroup = SetSearchAllPlayer(RoomID )
				local BallAreaBuff = {504173 , 504175 , 504177 }
				for i = 1 , PlayerGroup , 1 do
					local ID = GetSearchResult()
					if CheckID(ID) == true then
						for pry , obj in pairs(StepTwoBuff) do
							if CheckBuff( ID , Obj ) == true then
								CancelBuff_NoEvent( ID, Obj )
							end
						end
						for pry , obj in pairs(BallAreaBuff) do
							if CheckBuff( ID , Obj ) == true then
								CancelBuff_NoEvent( ID, Obj )
							end
						end
					end
				end
				ScriptMessage( OwnerID()  , -1  , 1 , "[SC_102430_8]" , 0 ) --[102430]：罪惡！終將面對失敗！
				ScriptMessage(  OwnerID()  , -1   , 0 , "[SC_102430_8]" , 0 )
			end
			-----------------------------把三顆球環繞的特效加回去--------------------------------------------
			if CheckBuff( OwnerID() , BallAroundBuff ) == false then
				AddBuff( OwnerID() , BallAroundBuff , 0 , -1 ) 
			end
			--------------------------------------------------------------------------------------------------
		end
		sleep( 10 )
	end
end
-------------------------------- 小兵死後如果死在正確位置產生光圈的函式 -----------------------------------------------
function LuaAI_103212_StepOne_Dead()
	local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_Rolevalue_RoomID )
	local Range = 100
	if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == true and ReadRoleValue( Boss , EM_RoleValue_PID ) == 1 then
		local FlagCombo = {[103214] = 1,[103215] = 2,[103216] = 3 ,[103217] = 4 ,[103218] = 5 ,[103219] = 6} 
		local DoorsID = {102454 , 102455 , 102456 , 102457 , 102458 , 102459}
		local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
		local Flag = FlagCombo[OrgID]
		local X = GetMoveFlagValue( 780412 , FlagCombo[OrgID] , EM_RoleValue_X )
		local Z = GetMoveFlagValue( 780412 , FlagCombo[OrgID] , EM_RoleValue_Z )
		local Me = Role:new( OwnerID() )
		if ( (X-Me:X())^2+(Z-Me:Z())^2 ) <= Range^2 then
			local Auro = CreateObjByFlag( DoorsID[FlagCombo[OrgID]], 780412 , FlagCombo[OrgID] , 1 )
			Lua_ObjDontTouch( Auro )
			AddToPartition( Auro , RoomID )
			WriteRoleValue( Auro , EM_RoleValue_PID , Boss )
			AddBuff( Auro , 504146 , 0 , -1 )
			SetPlot( Auro , "range" , "LuaM_504146_1" , 20 )
			BeginPlot( Auro , "LuaAI_103212_Auro_Check" , 0 )
		end
	end
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

-------------------------- 控制光圈消失的 AI ---------------------------------------------------
function LuaAI_103212_Auro_Check()
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID()  , EM_RoleValue_RoomID )

	while 1 do
		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false then
			break
		end
		if HateListCount( Boss ) < 1 then
			break
		end
		if ReadRoleValue( Boss , EM_RoleValue_PID ) == 3 then
			sleep( 30 )
			break
		end
		sleep( 10 )
	end
	DelObj( OwnerID() )
end

-------------------------- 控制最後的門開關 ------------------------------------------------------
function LuaI_103212_CheckBoss() --最後的門檢查王是否已經死了
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	while 1 do
		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false then
			break
		end
		sleep( 60 )
	end
	PlayMotionEX( OwnerID() ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( OwnerID() , EM_SetModeType_Obstruct , false )
--	Hide( OwnerID() )
--	Show( OwnerID() , RoomID )
end
------------------------------ 控制阻擋開關的 AI --------------------------------------------------
function LuaI_103212_BlockCheck()
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID )
	local State = "Show"

	while 1 do

		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false then
			break
		end

		if HateListCount( Boss ) > 0 and State == "Hide" then
			State = "Show"
			PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_END  )
			SetModeEX( OwnerID() , EM_SetModeType_Obstruct , true )
--			Hide( OwnerID() )
--			Show( OwnerID() , RoomID )
		elseif HateListCount( Boss ) < 1 and State == "Show" then
			State = "Hide"
			PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
			SetModeEX( OwnerID() , EM_SetModeType_Obstruct , false )
--			Hide( OwnerID() )
--			Show( OwnerID() , RoomID )
		end
		sleep( 10 )
	end
	PlayMotionEX( OwnerID() ,  ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP  )
	SetModeEX( OwnerID() , EM_SetModeType_Obstruct , false )
--	Hide( OwnerID() )
--	Show( OwnerID() , RoomID )
end
---------------------------------- 阻擋機械人的 AI ----------------------------------------------------
function LuaAI_103212_Slayer_0( RoomID )
	local Slayer = {}

	for i = 1 , 4 , 1 do 
		Slayer[i] = CreateObjByFlag( 102440 , 780412 , 7 + i , 1 )
		Lua_ObjDontTouch( Slayer[i] )
		AddToPartition( Slayer[i] , RoomID )
		MoveToFlagEnabled( Slayer[i] , false )
		WriteRoleValue( Slayer[i] , EM_RoleValue_Register , 7 + i ) --紀錄自己產生的旗標
		WriteRoleValue( Slayer[i] , EM_RoleValue_PID , OwnerID() ) --紀錄王的ID
		BeginPlot( Slayer[i] , "LuaAI_103212_Slayer_1" , 0 )
	end

	return Slayer
end
--------------------------- 檢查王是否存在或離開戰鬥的 AI -------------------------------------------
function LuaAI_103212_Mobs_Check()
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID()  , EM_RoleValue_RoomID )
	local Slayer = ReadRoleValue(OwnerID() , EM_RoleValue_Register )
	while 1 do
		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false then
			break
		end
		if HateListCount( Boss ) < 1 then
			break
		end
		sleep( 10 )
	end

	DelObj( OwnerID() )
end
------------------------------ 控制消滅者的 AI ---------------------------------------------------------
function LuaAI_103212_Slayer_1()
	local Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local AnotherFlag
	local NowFlag = Flag
	local SlayerBuff = 504149
	local Boss = ReadRoleValue(OwnerID() , EM_RoleValue_PID )
	local RoomID = ReadRoleValue( OwnerID()  , EM_RoleValue_RoomID )

	if Flag == 8 then AnotherFlag = 10 end
	if Flag == 10 then AnotherFlag = 8 end
	if Flag == 9 then AnotherFlag = 11 end
	if Flag == 11 then AnotherFlag = 9 end

	AddBuff( OwnerID() , SlayerBuff , 0 , -1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )
	MoveToFlagEnabled( OwnerID() , false )
	Sleep( 10 )

	while 1 do

		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false then
			break
		end

		if HateListCount( Boss ) < 1 then
			break
		end

		if NowFlag == Flag then
			NowFlag = AnotherFlag
		elseif NowFlag == AnotherFlag then
			NowFlag = Flag
		end

		DW_MoveToFlag( OwnerID() , 780412 , NowFlag , 0 )
		sleep(1)
	end

	Delobj( OwnerID() )
end

--------------------------------------- 第三階段球的控制 AI -----------------------------------------------
function LuaAI_103212_BallAround()
	
	local FlagNum = ReadRoleValue( OwnerID() ,EM_RoleValue_Register )
	local OrgRa = FlagNum*2*math.pi/6
	local Ra = OrgRa
	local Dis = 150
	local Boss= ReadRoleValue( OwnerID() ,EM_RoleValue_PID )
	local Pos = {}
	local Me= Role:new( OwnerID() )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local TriBallBuff = {504151 , 504152 , 504153 }
	local AllAreaBuff = {504173 , 504175 , 504177 }
	local FirstCast = {493815 , 493816 , 493817}
	local X = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( 780412 , 7 , EM_RoleValue_Z )

	WriteRoleValue( OwnerID() , EM_Rolevalue_IsWalk , 0 )
	-------------------- 控制圓周運動的迴圈 ------------------------------------
	while 1 do
		if Lua_CheckObj_Exist( Boss , 103212 , 1 , RoomID ) == false or HateListCount( Boss ) < 1 then
			Delobj( OwnerID() )
			return
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) > 0 then
			break
		end
		Ra = Ra + (30/360)* (2*math.pi)


		if Ra >= 2*math.Pi then 
			Ra = Ra - 2*math.Pi
		elseif Ra < 0 then
			Ra = 2*math.pi + Ra
		end

		Pos["X"] = X + dis*math.cos(Ra)
		Pos["Z"] = Z + dis*math.sin(Ra)
		Pos["Y"] = Y + 100

		local SleepTime = MoveDirect( OwnerID(), Pos["X"]  , Pos["Y"], Pos["Z"] ) 

		if SleepTime <= 0 then
			SleepTime = 1
		end

		sleep(SleepTime)
	end
	--------------------- 落下處理 ---------------------------------------------
	ScriptMessage(  OwnerID() , -1 , 1 , "[SC_102430_5]" , 0 ) --[102430]：吹響號角！宣判他們的罪狀！
	ScriptMessage(  OwnerID() , -1  , 0 , "[SC_102430_5]" , 0 )
	AddBuff( OwnerID() , TriBallBuff[FlagNum] , 0 , -1 )
	AddBuff( OwnerID() , 502707 , 0 , -1 )
	AddBuff( OwnerID() , 501081 , 0 , -1 )
	SetFightMode ( OwnerID() , 0 , 0 , 0 , 1 )
	Hide( OwnerID() )
	SetModeEX( OwnerID() , EM_SetModeType_Gravity , true )
	MoveToFlagEnabled( OwnerID() , true )
	Show( OwnerID() , RoomID )
	SetPos( OwnerID(), Me:X(), GetHeight( Me:X() , Me:Y() , Me:Z() ) , Me:Z() , 0 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SPAWN_BEGIN )
	sleep(15)
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SPAWN_END )
	CastSpell( OwnerID() , OwnerID() , FirstCast[FlagNum] )
	------------------- 幫全場上 Buff ------------------------------------------
	local PPL = SetSearchAllPlayer(RoomID )

	for i = 1 , PPL , 1 do
		local ID = GetSearchResult()
		if CheckID(ID) == true and ReadRoleValue( ID , EM_RoleValue_VOC ) > 0 and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
			AddBuff( ID , AllAreaBuff[FlagNum] , 0 , 600 )
		end
	end
	------------------- 執行檢查 boss 狀態的回圈 -------------------------------
	BeginPlot( OwnerID() , "LuaAI_103212_Mobs_Check" , 0 )
end
-------------------------- 球死亡後同時消全場與自己有關的 Buff ----------------
function LuaAI_103212_BallDead()
	local FlagNum = ReadRoleValue( OwnerID() ,EM_RoleValue_Register )
	local AllAreaBuff = {504173 , 504175 , 504177 }
	local AreaEffectBuff = {504174 , 504176 , 504178 }
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PPL = SetSearchAllPlayer(RoomID )
	local Boss= ReadRoleValue( OwnerID() ,EM_RoleValue_PID )
	local HP= -1*ReadRoleValue( Boss ,EM_RoleValue_MaxHP )*3/100
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 ) == 0 then
		for i = 1 , PPL , 1 do
			local ID = GetSearchResult()
			if CheckID(ID) == true and ReadRoleValue( ID , EM_RoleValue_VOC ) > 0 then
				if CheckBuff(ID , AllAreaBuff[FlagNum] ) == true then
					Lua_SubtractBuff( ID , AllAreaBuff[FlagNum] , 0 , -1 , -1 )
				end
				if CheckBuff(ID , AreaEffectBuff[FlagNum]  ) == true then
					CancelBuff_NoEvent( ID , AreaEffectBuff[FlagNum] )
				end
			end
		end
		if ReadRoleValue( Boss , EM_RoleValue_HP ) + HP > 0 then
			AddRoleValue( Boss , EM_RoleValue_HP , HP )
		end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register+9 , 100 )
	end
	Lua_CancelAllBuff( OwnerID() ) 
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end