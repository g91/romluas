function Lua_Ai_ArFex()
	SetPlot( OwnerID() , "dead" , "Lua_100794_deadlog_1" , 0 )
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10		-- 一秒檢查一次
	local ObjFlag = 780192		--定點生怪的旗子ID
	local MagicFlag = 780191		--定點施法的旗子ID
	local MonsterID = 101293		--產生的小怪
	local N = 0			--影之牢計時器
	local M = 0			--狂暴計時器
	local O = 0			--AE計時器
--	local R = 0
	local XX = 0
	local Coldown = 150		--影之牢coldown
	local MagicID = 491987		--影之牢
	local MonsterGroup = {}		--召換怪物的陣列
	local SecondMagicID2 = 491989	--狂暴
	local SecondMagicID3 = 492232	--爆裂旋風
	local SecondMagicID4 =491905	--瞬間移動
	local SecondMagicLV = 1
	local Coldown2 = 200		--狂暴coldown
	local ExtentMagic = 491903		--AE法術ID
	local MagicColdown = 300		--AE法術coldown
	local Door = {}
	local DoorStatus = "Open"
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			if DoorStatus == "Open" then
					Door[1]=CreateObj( 112052, 4281, 96, 5706, 357, 1 )
					WriteRoleValue( OwnerID() , EM_RoleValue_Register , Door[1] )
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
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			-- 血 3/4 
			if ( HPPercent <= 0.75 )  then
				if ( HP75 == "false" ) then
--					Say( OwnerID() , "NowHP = 75%")
					local Obj = Role:new( OwnerID())
					local BaseX = Obj :X()
	 				local BaseY = Obj :Y()
	 				local BaseZ = Obj :Z()
					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),GetString("SC_FRFEX_4"))	--出來吧！
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					sleep(10)
--					SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--傳送到台上施法
--					sleep(10)
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 4, ObjFlag, 0, 1, BaseRoom )	--產生小兵
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--從隊友中取出一個
					Say(OwnerID(),"[SC_FRFEX_0][$SETVAR1="..GetName( NewTarget ).."]")	--給我攻擊
					SetMonsterAttack( MonsterGroup, NewTarget )					--叫小兵打目標
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--回到原位
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP75 = "Called"								--召換過的記號
--					Say( OwnerID() , "HP75 = Called")
				elseif ( HP75 == "Called" ) then
					HP75 = "Finsh"								--小兵死亡記號
--					Say( OwnerID() , "HP75 = Finsh")
					N = 15
				elseif ( HP75 == "Finsh" ) then
--					Say( OwnerID() , N)
					if N >= (Coldown / CheckTime) then
						Say(OwnerID(),"[SC_FRFEX_1]")	--尼索恩！給我你的力量！
						sleep(20)
						CastSpell( OwnerID(), OwnerID(), MagicID )				--對該隊友使用影之牢
						Say(OwnerID(),"[SC_NISOAN_3]")		--通通給我停下來！
						N = 0
					end
				end 
			end
			-- 血 2/4 
			if ( HPPercent <= 0.50 ) then				
				if ( HP50 == "false" ) then
--					Say( OwnerID() , "NowHP = 50%")
					local Obj = Role:new( OwnerID())
--					local BaseX = Obj :X()
--	 				local BaseY = Obj :Y()
--	 				local BaseZ = Obj :Z()
--					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),"[SC_FRFEX_4]")	--出來吧！
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					SetFightMode (  OwnerID()  , 0, 0, 0, 0 )
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--傳送到台上施法
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 8, ObjFlag, 0, 2, BaseRoom )	--產生小兵
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--從隊友中取出一個
					SetMonsterAttack( MonsterGroup, NewTarget )					--叫小兵打目標
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--回到原位
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP50 = "Called"								--召換過的記號
--					Say( OwnerID() , "HP50 = Called")
				elseif ( HP50 == "Called" ) then
					HP50 = "Finsh"								--小兵死亡記號
--					Say( OwnerID() , "HP50 = Finsh")
					M = 20
				elseif ( HP50 == "Finsh" ) then
--					if R >= 20 then
--						local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--從隊友中取出一個
--						CastSpell(OwnerID() , NewTarget , 492225)	--衝撞
--						R = 0
--					end
					if XX >= 10 then
						CastSpellLV( OwnerID(), OwnerID(), SecondMagicID3 , SecondMagicLV )	--爆裂旋風
						sleep(20)
						XX = 0
					end
					if M >= (Coldown2 / CheckTime) then
--						Say( OwnerID() , M)
						Say(OwnerID(),"[SC_FRFEX_2]")	--阿法隆！巴爾德！給我你的力量！
						CastSpell( OwnerID(), OwnerID(), SecondMagicID2 )			--狂暴
						Say(OwnerID(),"[SC_NISOAN_2]")	--讓死亡來的更迅速吧！
						M = 0								--重新計時
					end
				end 
			end
			-- 血 1/4 
			if ( HPPercent <= 0.25 ) then
				if ( HP25 == "false" ) then
--					Say( OwnerID() , "NowHP = 25%")
					local Obj = Role:new( OwnerID())
---					local BaseX = Obj :X()
--	 				local BaseY = Obj :Y()
--	 				local BaseZ = Obj :Z()
--					local BaseDir = Obj:Dir()
					local BaseRoom = Obj:RoomID()
					Say(OwnerID(),"[SC_FRFEX_4]")	--出來吧！
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					SetPosByFlag(OwnerID(),MagicFlag,0)						--傳送到台上施法
					MonsterGroup = CreateMonsterByFlagBatch( MonsterID, 12, ObjFlag, 0, 3, BaseRoom )	--產生小兵
					local NewTarget = LuaFunc_GetAnotherPartyPlayer(AttackTarget)		--從隊友中取出一個
					SetMonsterAttack( MonsterGroup, NewTarget )					--叫小兵打目標
--					Castspell(OwnerID() , OwnerID() , SecondMagicID4 )				--瞬間移動
--					SetPos(OwnerID(),BaseX,BaseY,BaseZ,BaseDir)					--回到原位
--					SetFightMode (  OwnerID()  , 1, 1, 1, 1 )		
--					SetAttack( OwnerID() , AttackTarget )
					HP25 = "Called"								--召換過的記號
--					Say( OwnerID() , "HP25 = Called")
				elseif ( HP25 == "Called" ) then
					HP25 = "Finsh"								--小兵死亡記號
--					Say( OwnerID() , "HP25 = Finsh")
					O = 60
				elseif ( HP25 == "Finsh" ) then
--					Say( OwnerID() , O)
					if O >= (MagicColdown / CheckTime) then
						Say(OwnerID(),"[SC_FRFEX_3]")	--戴格勒斯！給我你的力量！
						sleep(20)
						Castspell(OwnerID() , OwnerID() , ExtentMagic )			--施放AE法術
						O= 0
					end
				end 
			end
		N = N + 1
		M = M + 1
		O = O + 1
--		R = R + 1
		XX = XX +1
		else
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"	
			for i = 1 , table.getn(MonsterGroup) do		--刪除招喚怪
				if CheckID(MonsterGroup[i]) == true then
					DelObj(MonsterGroup[i])
				end
			end
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