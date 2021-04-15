function FN_VALENTINE_2011_GetBackers()	--玩家身上迴圈
	local Player = OwnerID()
	local Timer = 0

	local KeyTable = {541861, 541862, 541863, 541864}
	for i=1,4 do SetFlag(Player, KeyTable[i], 0) end

	AddBuff(Player, 621880, 0, 900)

	while TRUE do
		if CheckBuff(Player, 509111) == FALSE and CheckBuff(Player, 509114) == FALSE then
			local NPCTable =  ValentineGuardTable
			for i=1,table.getn(NPCTable) do
				if CheckDistance( NPCTable[i], Player, 130 ) == TRUE and CheckBuff(NPCTable[i], 509112) == FALSE and CheckRelation( NPCTable[i], Player, EM_CheckRelationType_CheckLine ) == TRUE then
					--	搜尋到守衛沒有聲東擊西狀態並且兩者之間沒有阻擋
					if ReadRoleValue(NPCTable[i], EM_RoleValue_Register10) == 0 then
						--	該守衛沒有被隱藏
						local Guard = Lua_DW_CreateObj( "obj" , 103011 , NPCTable[i] , 1 , 1 )
						SetAttack( Guard , Player )
						SetModeEx( Guard  , EM_SetModeType_Mark, false )--標記
						SetModeEx( Guard  , EM_SetModeType_ShowRoleHead, false )--頭像框
						SetModeEx( Guard  , EM_SetModeType_Fight , false )--可砍殺攻擊
						WriteRoleValue(Guard, EM_RoleValue_Register10, Player)
						BeginPlot(Guard,"FN_VALENTINE_2011_GetBackers_Guard",0)
						--
						Hide(NPCTable[i])
						WriteRoleValue(NPCTable[i], EM_RoleValue_Register10, 1)
						BeginPlot(NPCTable[i],"FN_VALENTINE_2011_GetBackers_showNPC",0)
					end
				--elseif ReadRoleValue( NPCTable[i], EM_RoleValue_OrgID ) == 103011 then	--搜尋到的是被收買的守衛
				--	SetAttack( NPCTable[i] , Player )
				--	BeginPlot(NPCTable[i],"FN_VALENTINE_2011_GetBackers_Guard",0)
				end
			end
		end
		--
		Sleep(30)
--		local MountCheck = Lua_Mounts_Copilot( Player )
--		if MountCheck == true then	--
--			Say(Player, "MountCheck = ".."True")
--		else
--			Say(Player, "MountCheck = ".."False")
--		end
		if Timer >= 900 or CheckBuff(Player, 621880) == false  or Lua_Mounts_Copilot( Player ) == false then	--檢查玩家失敗
			if CheckFlag(Player, 541865) == false then	--判斷玩家失敗條件的時候不是因為他已經完成任務誤判
				local FlowerTable = {240645, 240646, 240647, 240730}
				CancelBuff(Player, 621880)

				ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN03_1]", 0 )
				ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN03_2]", 0 )
				for i=1,4 do
					if CountBodyItem(Player, FlowerTable[i]) >= 1 then DelBodyItem(Player, FlowerTable[i], 1) end
				end
			end
			return
		else
			Timer = Timer + 3
		end
	end
end

function FN_VALENTINE_2011_GetBackers_showNPC()	--觸發後隱藏守衛
	local NPC = OwnerID()
	Sleep(60)
	--
	Show( NPC, 0 )
	WriteRoleValue(NPC, EM_RoleValue_Register10, 0)
end

function FN_VALENTINE_2011_GetBackers_Guard()	--被買通的守衛執行劇情
	local Guard = OwnerID()
	local Player = ReadRoleValue(Guard, EM_RoleValue_Register10)
	local SearchTime = 0
	--
	Say(Guard, "[SC_VALENTINE_2011_FN01]")
	ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN02]", 0 )
	--
	while TRUE do
		if CheckDistance( Guard, Player, 160 ) == FALSE or SearchTime >= 15 or CheckBuff(Player, 509114) == TRUE then
			-- 玩家逃脫
			ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN04]", C_SYSTEM )
			DelObj(Guard)
			return
		elseif  CheckDistance( Guard, Player, 35 ) == TRUE or CheckBuff(Player, 621880) == FALSE then
			-- 抓到玩家
			CancelBuff(Player, 621880)
			DelObj(Guard)
			return
		end
		--
		Sleep(20)
		SearchTime = SearchTime + 2
	end
end

function FN_VALENTINE_2011_GetBackers_Box()	--奪還目標物件產生劇情
	SetPlot( OwnerID() , "touch" , "FN_VALENTINE_2011_TouchBox" , 25 )
end

function FN_VALENTINE_2011_TouchBox()	--奪還目標執行劇情
	local Player = OwnerID()
	if CheckBuff(Player, 621880) == TRUE then
		BeginCastBarEvent( Player, TargetID() , "[SC_VALENTINE_2011_FN05]", 80, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_NORMAL , 0 , "FN_VALENTINE_2011_GetBackers_BoxEvent")
	else
		ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN07]", C_SYSTEM )
	end
end

function FN_VALENTINE_2011_GetBackers_BoxEvent(ObjID, Result)	--施法條事件

	if Result > 0 and CheckBuff(ObjID, 621880) == TRUE then
		local Box = TargetID()
		local Player = ObjID
		local KeyTable = {541861, 541862, 541863, 541864}
		local FlowerTable = {240645, 240646, 240647, 240730}
		local keyNum = ReadRoleValue(Box, EM_RoleValue_PID)

		if CheckFlag(Player, KeyTable[keyNum]) == FALSE then
			SetFlag(Player, KeyTable[keyNum], 1)
			GiveBodyItem(Player, FlowerTable[keyNum], 1)
		else
			ScriptMessage( Player, Player, 1, "[SC_VALENTINE_2011_FN06]", C_SYSTEM )
		end
	end
	EndCastBar( ObjID, Result )
end

function FN_VALENTINE_2011_GetBackers_NPC117022()	--團長對話事件
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN11]" )

	if CountBodyItem(Player, 240750) >= 1 then
		--擁有誓約玫瑰花束
		DelBodyItem(Player, 240750, 1)
		GiveBodyItem(Player, 209161, 6)
		SetFlag(Player, 541865, 1)
		CancelBuff(Player, 621880)
	elseif CheckBuff(Player, 621880) == TRUE then
		-- 正在進行中
		SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN12]" )
	elseif CheckFlag(Player, 541865) == FALSE then
		-- 還沒玩過
		SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN08]" )
		AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN08_OPTION]", "FN_VALENTINE_2011_NPC117022_Option1", 0 )
	end
end

function FN_VALENTINE_2011_NPC117022_Option1()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN09]" )
	AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN09_OPTION]", "FN_VALENTINE_2011_NPC117022_Option2", 0 )
end

function FN_VALENTINE_2011_NPC117022_Option2()
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player, "[SC_VALENTINE_2011_FN10]" )
	AddSpeakOption( Player, NPC, "[SC_VALENTINE_2011_FN10_OPTION]", "FN_VALENTINE_2011_plot", 0 )
end

function FN_VALENTINE_2011_plot()	--執行最上面的主要事件
	local Player = OwnerID()
	local MountCheck = Lua_Mounts_Copilot( Player )

	if MountCheck == false then
		ScriptMessage( Player, Player, 1, "[SC_GE2_2011EV1_16]", 0 )
	else
		BeginPlot( Player, "FN_VALENTINE_2011_GetBackers", 0 )
	end
	CloseSpeak(Player)
end

function Lua_ItemUse_240730(option,Item)	--使用誓約之花換誓約祝福花束
	local Player = OwnerID()
	local FlowerTable = {240645, 240646, 240647, 240730}

	if option == "CHECK" then
		for i=1,4 do
			if CountBodyItem(Player, FlowerTable[i]) == 0 then
				return FALSE
			end
		end
		return TRUE
	elseif option == "USE" then
		GiveBodyItem(Player, 240750, 1)
		UseItemDestroy()
		for i=1,4 do
			if FlowerTable[i] ~= Item then DelBodyItem(Player, FlowerTable[i], 1) end
		end
		--
		local Pos = Lua_BuffPosSearch( Player , 621880 )                      ---------------------抓出身上的法術代號
		local BuffTime = BuffInfo( Player , Pos , EM_BuffInfoType_Time )  -------------------------抓出此法術是誰放的

		if BuffTime >= 300 then
			GiveBodyItem( Player, 530792, 1 )
		end
		if BuffTime >= 180 then
			GiveBodyItem( Player, 530791, 1 )			
		end
	end
end

function FN_VALENTINE_2011_GuardTable()	--全域變數紀錄守衛
	if ValentineGuardTable == nil then
		ValentineGuardTable = {}
	end
	table.insert(ValentineGuardTable, OwnerID())
end

function Lua_Spell499055_check()
	local GuardTable = {103012, 100938, 100946, 100947}
	local Guard = TargetID()

	for i=1,4 do
		if ReadRoleValue( Guard, EM_RoleValue_OrgID ) == GuardTable[i] then
			return TRUE
		end
	end
	return FALSE
end

