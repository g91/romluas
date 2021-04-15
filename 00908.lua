
function LuaN_Ai_Nisoan()		--雙刀尼索恩(Nisoan)
	SetPlot( OwnerID() , "dead" , "Lua_101020_deadlog_1" , 0 )
	local BacktoFirstPlace = 0
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local MagicID = 490593	--影之牢
	local ALLMagicID = 491987	--群體影之牢
	local CheckTime = 10	-- 一秒檢查一次
	local Coldown = 200
	local Coldown2 = 400
	local N = 20
	local M = 40
	local SecondMagicID = 491989	--狂暴
	local isDead = 0
	local NewDead = 0
	local Door = {}
	local DoorStatus = "Open"
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local firstX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local firstY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local firstZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local firstDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	while true do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			--Say(OwnerID(),"AttackTarget = "..AttackTarget)
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if DoorStatus == "Open" then
					Door[1]=CreateObj( 112052, 3607, 96, 3777, 271, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
					Door[2]=CreateObj( 112052, 3376, 96, 4036, 357, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , Door[2] )
				for i=1, table.getn(Door) do
					SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--阻擋
					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--標記
					SetModeEx( Door[i]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Door[i]   , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Door[i]   , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( Door[i]   , EM_SetModeType_HideName, false )--名稱
					SetModeEx( Door[i]   , EM_SetModeType_Gravity, false )--重力
					AddToPartition( Door[i] , RoomID )
				end
				DoorStatus = "Close"
			end
			local NewX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
			local NewY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
			local NewZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
			local NewDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
			local distance = math.sqrt(((firstX-NewX)^2+(firstZ-NewZ)^2))
			if distance >= 250 then	--距離過遠離開戰鬥，回到原位
				SetFightMode(  OwnerID() , 0, 0, 0, 0 )
				ClearHateList( OwnerID() , -1 )
				SetStopAttack( OwnerID() )
				SetPos(OwnerID(),firstX,firstY,firstZ,NewDir)	--回到原位
				Hide(OwnerID())
				ScriptMessage(OwnerID() , -1 ,2, "[SC_SUCKIN]" , C_SYSTEM ) --你們的技倆早就被我看穿了
				Sleep(20)
				Show(OwnerID(),RoomID)
				BacktoFirstPlace = 1
			end
			local X = Rand(100)
			if X >= 30 then
				CastSpell(OwnerID(),AttackTarget,490521)
				Sleep(50)
			end
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			local Party = LuaFunc_PartyData(AttackTarget)			--取得隊友資訊
			--Say(OwnerID(),"0")
			local NewTarget = LuaFunc_GetAnotherPartyNPlayer(AttackTarget , 3 )	--從隊友中取出一個
			--Say(OwnerID(),"1")
--			Say(OwnerID()," NewTarget = "..NewTarget)
			if N >= (Coldown / CheckTime) then
--			Say(OwnerID(),table.getn(NewTarget))
			for i = 1 , table.getn(NewTarget) , 1 do
			--Say(OwnerID(),"2")
			Say(OwnerID(),"[SC_NISOAN_1][$SETVAR1="..GetName( NewTarget[i] ).."]")	--站住！
			CastSpell( OwnerID(), NewTarget[i], MagicID )		--對該隊友使用影之牢
			Sleep(20)
			end
			N = 0
			end
			for i = 1 , Party[0], 1 do
				if ReadRoleValue ( Party[i] , EM_RoleValue_IsDead ) == 1 then
					NewDead = NewDead + 1
				end
			end
			if isDead ~= NewDead then
				Say(OwnerID(),"[SC_NISOAN_2]")	--讓死亡來的更迅速吧！
				CastSpell( OwnerID(), OwnerID(), SecondMagicID )	--放狂暴
				isDead = NewDead
			end
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
--				Say( OwnerID() , "NowHP = 25%")
				CastSpell( OwnerID(), OwnerID(), SecondMagicID )	--放狂暴
				sleep(10)
				HP25 = "true"
			end
			if ( HP25 == "true" ) and M >= (Coldown2 / CheckTime) then
				Say(OwnerID(),"[SC_NISOAN_3]")		--通通給我停下來！
				sleep(10)
				CastSpell( OwnerID(), OwnerID(), ALLMagicID )		--使用全體影之牢
				M = 0
			end
			NewDead = 0
			N = N + 1
			M = M + 1
		else
			if BacktoFirstPlace >= 1 then
				SetFightMode(  OwnerID() , 1, 1, 1, 1 )	
			end
			HP25 = "false"		-- 非戰鬥，歸零記號
			if DoorStatus == "Close" then
				for i=1, table.getn(Door) do
					Delobj(Door[i])
				end
				DoorStatus = "Open"
			end
		end

	Sleep( CheckTime )
	end
end

function LuaN_Ai_Daglass()		--智將戴格勒斯
	SetPlot( OwnerID() , "dead" , "Lua_101021_deadlog_1" , 0 )
	local BacktoFirstPlace = 0
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10	-- 一秒檢查一次
	local ObjFlag = 780190	--定點生怪的旗子ID
	local CountFlag = GetMoveFlagCount(ObjFlag)
	local MagicFlag = 780189	--定點施法的旗子ID
	local MonsterID = 101221	--產生的怪物
	local SecondMagicID2 =491988	--火球術
	local SecondMagicID4 =491905	--瞬間移動
	local Step = "one"
	local Step2 = "one"
	local N = 0
	local M = 0
	local X = 0
	local MonsterGroup = {}		--召換怪物的陣列
	local CreateTime = 450
	local MagicColdown = 300
	local ExtentMagic = 491903	--範圍法術ID
	local Door = {}
	local DoorStatus = "Open"
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local firstX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
	local firstY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
	local firstZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
	local firstDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
	while true do
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if DoorStatus == "Open" then
					Door[1]=CreateObj( 112052, 1932, 96, 4219, 271, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
					Door[2]=CreateObj( 112052, 2236, 96, 4528, 181, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , Door[2] )
				for i=1, table.getn(Door) do
					SetModeEx( Door[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( Door[i]   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( Door[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
					SetModeEx( Door[i]   , EM_SetModeType_Obstruct, true )--阻擋
					SetModeEx( Door[i]   , EM_SetModeType_Mark, false )--標記
					SetModeEx( Door[i]   , EM_SetModeType_Move, false )--移動
					SetModeEx( Door[i]   , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( Door[i]   , EM_SetModeType_ShowRoleHead, false )--頭像框
					SetModeEx( Door[i]   , EM_SetModeType_HideName, false )--名稱
					SetModeEx( Door[i]   , EM_SetModeType_Gravity, false )--重力
					AddToPartition( Door[i] , RoomID )
				end
				DoorStatus = "Close"
			end
			local NewX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
			local NewY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
			local NewZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
			local NewDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
			local distance = math.sqrt(((firstX-NewX)^2+(firstZ-NewZ)^2))
			if distance >= 230 then	--距離過遠離開戰鬥，回到原位
				SetFightMode(  OwnerID() , 0, 0, 0, 0 )
				ClearHateList( OwnerID() , -1 )
				SetStopAttack( OwnerID() )
				SetPos(OwnerID(),firstX,firstY,firstZ,NewDir)	--回到原位
				Hide(OwnerID())
				ScriptMessage(OwnerID() , -1 ,2, "[SC_SUCKIN]" , C_SYSTEM ) --你們的技倆早就被我看穿了
				Sleep(20)
				Show(OwnerID(),RoomID)
				BacktoFirstPlace = 1
			end
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			if (X >= 5) then
				CastSpell( OwnerID(), OwnerID() , SecondMagicID2 )
				X = 0
			end
			-- 血 3/4 
			if ( HPPercent <= 0.75 ) and ( HP75 == "false" ) then
--				Say( OwnerID() , "NowHP = 75%")
				N = 45
				HP75 = "Called"
			elseif ( HP75 == "Called" ) then
				if N >= (CreateTime / CheckTime) then
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)	--從隊友中取出一個
					MonsterGroup[1] = CreateObjByFlag( MonsterID, ObjFlag , rand(CountFlag) , 1 )	--在旗子上生怪
					AddToPartition( MonsterGroup[1] , RoomID )
					SetAttack( MonsterGroup[1] , NewTarget )
					MonsterGroup[2] = CreateObjByFlag( MonsterID, ObjFlag , rand(CountFlag) , 1 )	--在旗子上生怪
					AddToPartition( MonsterGroup[2] , RoomID )
					SetAttack( MonsterGroup[2] , NewTarget )
					MonsterGroup[3] = CreateObjByFlag( MonsterID, ObjFlag , rand(CountFlag) , 1 )	--在旗子上生怪
					AddToPartition( MonsterGroup[3] , RoomID )
					SetAttack( MonsterGroup[3] , NewTarget )
					N = 0
				end
			end
			-- 血 2/4 
			if ( HPPercent <= 0.50 ) and ( HP50 == "false" ) then
--				Say( OwnerID() , "NowHP = 50%")
				HP50 = "Called" 
				M = 30
			elseif ( HP50 == "Called" ) then
				if M >= (MagicColdown / CheckTime) then
					local OldX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
					local OldY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
					local OldZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
					local OldDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)	--從隊友中取出一個
					if Step == "one" then
						SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
						Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
						sleep(15)
						Step = "two"
--					Say( OwnerID() , "Step = "..Step)
					end
					if Step == "two" then			
						SetPosByFlag(OwnerID(),MagicFlag,0)		--傳送到台上施法
						Step = "three"
						sleep(20)
--					Say( OwnerID() , "Step = "..Step)
					end
					if Step == "three" then
						Say( OwnerID() ,GetString("SC_DAGLASS_1"))	--死吧！無知的人類！
						Castspell(OwnerID() , OwnerID() , ExtentMagic )	--施放範圍法術
						sleep(50)
						Step = "four"
--					Say( OwnerID() , "Step = "..Step)
					end
					if Step == "four" then
						Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
						sleep(15)
						Step = "five"
--					Say( OwnerID() , "Step = "..Step)
					end
					if Step == "five" then
						SetPos(OwnerID(),OldX,OldY,OldZ,OldDir)	--回到原位
						SetFightMode (  OwnerID()  , 1, 1, 1, 1 )	
						Step = "one"
--					Say( OwnerID() , "Step = "..Step)
					end
						SetAttack( OwnerID() , NewTarget )
					M = 0
				end
			end
			-- 血 1/4 
			if ( HPPercent <= 0.25 ) and ( HP25 == "false" ) then
--				Say( OwnerID() , "NowHP = 25%")
					local OldX = ReadRoleValue(  OwnerID() , EM_RoleValue_X )
					local OldY = ReadRoleValue(  OwnerID() , EM_RoleValue_Y )
					local OldZ = ReadRoleValue(  OwnerID() , EM_RoleValue_Z )
					local OldDir = ReadRoleValue(  OwnerID() , EM_RoleValue_Dir )
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)	--從隊友中取出一個
					if Step2 == "one" then
						SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
						Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
						sleep(15)
						Step2 = "two"
--					Say( OwnerID() , "Step2 = "..Step2)
					end
					if Step2 == "two" then			
						SetPosByFlag(OwnerID(),MagicFlag,0)		--傳送到台上施法
						Step2 = "three"
						sleep(20)
--					Say( OwnerID() , "Step2 = "..Step2)
					end

					if Step2 == "three" then
						Say( OwnerID() ,GetString("SC_DAGLASS_1"))	--死吧！無知的人類！
						Castspell(OwnerID() , OwnerID() , ExtentMagic )	--施放範圍法術
						sleep(50)
						Step2 = "four"
--					Say( OwnerID() , "Step2 = "..Step2)
					end
					if Step2 == "four" then
						Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
						sleep(15)
						Step2 = "five"
--					Say( OwnerID() , "Step2 = "..Step2)
					end
					if Step2 == "five" then
						SetPos(OwnerID(),OldX,OldY,OldZ,OldDir)	--回到原位
						SetFightMode (  OwnerID()  , 1, 1, 1, 1 )	
						Step2 = "one"
--					Say( OwnerID() , "Step2 = "..Step2)
					end
						SetAttack( OwnerID() , NewTarget )
					M = 0
				HP25 = "true"
			end
			M = M + 1
			N = N + 1
			X = X + 1
--			Say( OwnerID() , "M="..M.." N="..N.."X="..X)
		else
			if BacktoFirstPlace >= 1 then
				SetFightMode(  OwnerID() , 1, 1, 1, 1 )	
			end
			for i = 1 , table.getn(MonsterGroup) do		--刪除招喚怪
				if CheckID(MonsterGroup[i]) == true then
					DelObj(MonsterGroup[i])
				end
			end
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"	
			if DoorStatus == "Close" then
				for i=1, table.getn(Door) do
					Delobj(Door[i])
				end
				DoorStatus = "Open"
			end
		end

	Sleep( CheckTime )
	end
end