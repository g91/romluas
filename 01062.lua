function CreateMonsterByBaseXYZ(MonsterID,HowMuch,ScriptName)	--依據仇恨列表的量產生怪最大不超過HowMuch
	local HateC = HateListCount( OwnerID() )
	local Attack = {}
	local MonsterGroup = {}
	for i=1, HateC do
		Attack[i] = HateListInfo(OwnerID() , i-1 , EM_HateListInfoType_GItemID)
	end
	if HateC > HowMuch then
		HateC = HowMuch
	elseif HowMuch > HateC then
		HowMuch = HateC
	end
	for i=1 , HowMuch do
		MonsterGroup[i] = CreateObjbyObj( MonsterID,Attack[i] , 1 )
		SetAttack(MonsterGroup[i], Attack[i])
		SetPlot(MonsterGroup[i], "dead", ScriptName , 0)
	end
	return MonsterGroup , HowMuch
end
function Lua_AiSaSurvive()				--怪物死亡全域變數
	AiSaSurvive = AiSaSurvive + 1
	return true
end

function Lua_GetRangePlayer(Range,AttackTarget)	--取出範圍內隨機玩家
	local NewTarget = 0
	local OtherTarget = {}
	local count = 1
	local Player = SearchRangePlayer ( OwnerID(), Range )--將附近玩家取成陣列
--	Say( OwnerID() , "table.getn = "..table.getn(Player))
	if table.getn(Player) <= 1 then
		NewTarget = AttackTarget
		return NewTarget
	else
		for i= 0 , table.getn(Player) do
--			Say( OwnerID() , "Player[i] "..Player[i])
--			Say( OwnerID() , "AttackTarget "..AttackTarget)
			If CheckID( Player[i] ) == true and Player[i] ~= AttackTarget then
				OtherTarget[count] = Player[i]
				count = count + 1
			end
		end
	NewTarget = OtherTarget[Rand(count-1)+1]
	return NewTarget
	end
end

function Lua_AiSa_deadlog()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV )
	local PlayerSUBLV = ReadRoleValue( TargetID() , EM_RoleValue_LV_SUB )
	DesignLog(OwnerID(),101342,"Killer Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)
	return true
end

function Lua_Ai_AiSa()
	SetPlot( OwnerID() , "dead" , "Lua_AiSa_deadlog" , 0 );
	Discowood_OnlyOne_Check()
	AiSaSurvive = 0			--宣告死亡全域變數
	local HP75 = "false"
	local HP50 = "false"
	local HP25 = "false"
	local MaxHP = ReadRoleValue(  OwnerID() , EM_RoleValue_MaxHP )
	local CheckTime = 10		-- 一秒檢查一次
	local MonsterID = 100276		--產生的小怪
	local N = 0			--群體冰凍計時器
	local M = 0			--冰封領域計時器
	local O = 0			--群體冰錐計時器
	local P = 0			--激流衝擊計時器
	local Q = 0			--瞬移計時器
	local NColdown = 30		--群體冰凍coldown
	local MColdown = 60		--冰封領域coldown
	local OColdown = 30		--群體冰錐coldown
	local PColdown = 8			--激流衝擊coldown
	local QColdown = 60		--瞬移coldown
	local MagicIDP = 492178		--激流衝擊
	local MagicIDN = 492152		--群體冰凍
	local MagicIDM = 492153		--冰封領域
	local MagicIDO = 491027		--群體冰錐
	local MonsterGroup = {}		--召換怪物的陣列
	local HowMuch = 10		--最大招喚數量
	local AllDead = 0			--宣告死亡總數
	local Owner = OwnerID()
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if (  AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) == true ) then  -- 檢查是否離開戰鬥
			local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )
			local HPPercent = NowHP / MaxHP
			--平時技能
			if P >= PColdown then
				local RouletteTarget = PartyRoulette( AttackTarget )
				CastSpellLV( OwnerID(), RouletteTarget, MagicIDP , 50 )	--使用激流沖級
				P = 0
			elseif M >= MColdown then
--				Say( OwnerID() , "M = "..M )
				CastSpell( OwnerID(), OwnerID(), MagicIDM )				--使用冰封領域
				M = 0
			elseif N >= NColdown then
--				Say( OwnerID() , "N = "..N )
				CastSpell( OwnerID(), OwnerID(), MagicIDN )				--使用群體冰凍
				N = 0
			end

			-- 血 3/4 新增技能群體冰錐
			if ( HPPercent <= 0.75 )  then
				if ( HP75 == "false" ) then
--					Say( OwnerID() , "NowHP = 75%")
					HP75 = "Finsh"								
--					Say( OwnerID() , "HP75 = Finsh")
					O = 60
				elseif ( HP75 == "Finsh" ) then
--					Say( OwnerID() , "O = "..O )
					if O >= OColdown then
					local RouletteTarget = PartyRoulette( AttackTarget )
						CastSpell( OwnerID(), RouletteTarget, MagicIDO )				--使用群體冰錐
						O = 0
					end
				end 
			end
			-- 血 2/4 
			if ( HPPercent <= 0.50 ) then				
				if ( HP50 == "false" ) then
--					Say( OwnerID() , "NowHP = 50%")
					Say(OwnerID(),GetString("SC_FRFEX_4"))	--出來吧！
					MonsterGroup , HowMuch = CreateMonsterByBaseXYZ(MonsterID,HowMuch,"Lua_AiSaSurvive")	--產生小兵並取得數量
					HP50 = "Called"								--召換過的記號
--					Say( OwnerID() , "HP50 = Called")
				elseif ( HP50 == "Called" ) then
--					Say( OwnerID() , "AiSaSurvive = "..AiSaSurvive)
					if HowMuch == 1 then
						if AiSaSurvive >= HowMuch then
							if CheckID(MonsterGroup[1]) == true then
								DelObj(MonsterGroup[1])
							end
							HP50 = "false"
							AiSaSurvive = 0
						end
					elseif HowMuch == 2 then
						if AiSaSurvive >= 1 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							AiSaSurvive = 0
						end
					elseif HowMuch >= 3 then
						if AiSaSurvive >= HowMuch - 2 then
							for i = 1 , table.getn(MonsterGroup) do
								if CheckID(MonsterGroup[i]) == true then
									DelObj(MonsterGroup[i])
								end
							end
							HP50 = "false"
							AiSaSurvive = 0
						end
					end
				end 
			end
			-- 血 1/4 
			if ( HPPercent <= 0.25 ) then
				if ( HP25 == "false" ) then
--					Say( OwnerID() , "NowHP = 25%")
					HP25 = "Finsh"
--					Say( OwnerID() , "HP25 = Finsh")
					Q = 60
				elseif ( HP25 == "Finsh" ) then
--					Say( OwnerID() , "Q = "..Q)
					if Q >= QColdown then
--						Say( OwnerID() , "SearchTrainTarget..ing")
						local TrainTarget = Lua_GetRangePlayer( 300, AttackTarget)
--						Say( OwnerID() , "SearchTrainTarget..OK")
--						Say( TrainTarget , "TrainTarget is Me")
						local Dest = Role:new(TrainTarget)
						local NewX = Dest :X()
						local NewY = Dest :Y()
						local NewZ = Dest :Z()
						local NewDir = Dest :Dir()
						local Obj = Role:new( OwnerID())
						local BaseX = Obj :X()
	 					local BaseY = Obj :Y()
	 					local BaseZ = Obj :Z()
						local BaseDir = Obj:Dir()
						SetPos(OwnerID(), NewX, NewY, NewZ, NewDir)
						SetPos(TrainTarget, BaseX, BaseY, BaseZ, BaseDir)
						ClearHateList( OwnerID() , -1 )
						local NewTarget = Lua_GetRangePlayer(200,AttackTarget)
						SetAttack(OwnerID(), NewTarget)
						Q= 0
					end
				end 
			end
		else
			for i = 1 , table.getn(MonsterGroup) do		--刪除招喚怪
				if CheckID(MonsterGroup[i]) == true then
					DelObj(MonsterGroup[i])
				end
			end
			HP75 = "false"		-- 非戰鬥，歸零記號
			HP50 = "false"	
			HP25 = "false"	
		end
	N = N + 1
	M = M + 1
	O = O + 1
	P = P + 1
	Q = Q + 1
	Sleep( CheckTime )
	end
end