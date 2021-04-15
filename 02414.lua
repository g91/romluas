--function LuaFA_424361()
--	local Player = OwnerID()
--	local NPC = TargetID()
--	local NPC2 = Lua_DW_CreateObj( "obj", ReadRoleValue(NPC, EM_RoleValue_OrgID)+140, NPC, 1, 1 )
--
--	SetDefIdleMotion(NPC2, ruFUSION_MIME_DEATH_LOOP)
--	SetModeEx(NPC2, EM_SetModeType_Gravity, false)
--	EnableNpcai( NPC2 , false )
--	WriteRoleValue(NPC2, EM_RoleValue_IsWalk, 0)
--	DW_CancelTypeBuff( 68,  Player )
--	AddBuff(Player, 620136, 0, -1)
--	AddBuff(NPC2, 508176, 10, -1)
--	AddBuff(NPC2, 508176, 10, -1)
--	CallPlot(NPC2, "LuaFA_424361_Loop", Player)
--	return 1
--end

--function LuaFA_424361_Loop(Player)
--	local NPC = OwnerID()
--	local PosTemp
--	repeat
--		if not CheckDistance (Player,NPC,15) then
--			PosTemp = {kg_GetPosRX(Player,nil,17,0,180)}
--			table.remove(PosTemp,4)
--			MoveDirect(NPC, Unpack(PosTemp))
--			PosTemp = {kg_GetPosRX(Player,nil,13,0,180)}
--			table.remove(PosTemp,4)
--			MoveDirect(NPC, Unpack(PosTemp))
--			AdjustFacedir(NPC, Player,0)
--		end
--		sleep(1)
--	until DW_CheckDis(Player,780976,0,100) or not CheckID(Player) or not CheckAcceptQuest(Player,424361)
--	if CheckAcceptQuest(Player,424361) and DW_CheckDis(Player,780976,0,100) then
--		SetFlag(Player, 544996, 1)
--		Sleep(20)
--	end
--	CancelBuff(Player,620136)
--	DelObj(NPC)
--end

--------運屍任務
function LuaS_424361_OnClick()
	local od = OwnerID()
	local Bags = { [1]=240005 , [2]=240033 }			-- 1 = 空垃圾袋 2 = 有屍體的垃圾袋
	local DoneFlag = 544996

	if 	CountBodyItem( od ,Bags[1] ) == 0	and
		CountBodyItem( od ,Bags[2] ) == 0	then
		ScriptMessage( od , od , 1 , "[SC_424361_0]" , 0 )	--你沒有布袋
		ScriptMessage( od , od , 0 , "[SC_424361_0]" , 0 )
		return -1

	elseif CheckFlag ( od, DoneFlag ) == TRUE	then
		DelBodyItem ( od , Bags[1] , 1 )
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od, Bags[2] , 1 )
		ScriptMessage( od , od , 1 , "[SC_424249_1]" , 0 )	--你的麻布袋已經滿了，放不了更多東西
		ScriptMessage( od , od , 0 , "[SC_424249_1]" , 0 )
		return -1
	else
		return 1
	end
end

function LuaS_424361_AfterClick()	-- Touch劇情
	local td = TargetID()
	local od = OwnerID()
	local MomTable = {	[1] = 118695 ,		---- 屍體堆table
				[2] = 118696 ,
				[3] = 118698 ,
				[4] = 118699 	}
	local Bags = { [1]=240005 , [2]=240033 }
	local WhichOne = ReadRoleValue( td , EM_RoleValue_OrgID )
	local DoneFlag = 544996
-------------------------把空袋子置換成有裝垃圾的袋子------------------------------
	if	CountBodyItem ( od , Bags[1] ) > 0 then
		DelBodyItem ( od , Bags[1] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3] [$SETVAR1=["..WhichOne.."]".."]", 0 )	-- 你把 OO 裝進麻布袋裡
		ScriptMessage( od, od, 0,"[SC_424249_3] [$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od , DoneFlag , 1)
		return 1
	elseif	CountBodyItem ( od , Bags[2] ) > 0 then
		DelBodyItem ( od , Bags[2] , 1 )
		GiveBodyItem ( od , Bags[2] , 1 )
		ScriptMessage( od, od, 1,"[SC_424249_3] [$SETVAR1=["..WhichOne.."]".."]", 0 )	-- 你把 OO 裝進麻布袋裡
		ScriptMessage( od, od, 0,"[SC_424249_3] [$SETVAR1=["..WhichOne.."]".."]", 0 )
		SetFlag( od ,  DoneFlag , 1)
		return 1
	end
end

--------------徹底搜查-----------
function LuaS_424372_AfterClick()	-- Touch劇情
	local Player = OwnerID()
	local Target = TargetID()
	local MomTable = {	[118860] = 545235 ,		---- 垃圾堆table
				[118861] = 545236 ,
				[118862] = 545237 ,
				[118863] = 545238 	}
	local WhichOne = ReadRoleValue( Target , EM_RoleValue_OrgID )

	ScriptMessage( Player, Player, 1,"[SC_424372_"..WhichOne.."]", 0 )	-- 點擊物件得到對應信息
	ScriptMessage( Player, Player, 0,"[SC_424372_"..WhichOne.."]", 0 )
	SetFlag( Player ,  MomTable[WhichOne] , 1)
	BeginPlot( Player , "LuaS_424372_CheckFlags" , 0)

	return 1
end
----------------------------都檢完後發動--------------------------------

function LuaS_424372_CheckFlags()
	local Player = OwnerID()
	local FlagTable = { 545235 , 545236 , 545237 , 545238 }
	local DoneFlag = 545239

	if	CheckFlag( Player , FlagTable[1] )	and
		CheckFlag( Player , FlagTable[2] )	and
		CheckFlag( Player , FlagTable[3] )	and
		CheckFlag( Player , FlagTable[4] )	and
		CheckFlag( Player , DoneFlag) == TRUE	then
		ScriptMessage( Player , Player , 1 , "[SC_424372_DONE]" , 0 )--周圍似乎沒什麼特別的地方，跟阿克討論看看吧
		ScriptMessage( Player , Player , 0 , "[SC_424372_DONE]" , 0 )
		SetFlag( Player , DoneFlag , 1 )

	elseif	CheckFlag( Player , FlagTable[1] )	and
		CheckFlag( Player , FlagTable[2] )	and
		CheckFlag( Player , FlagTable[3] )	and
		CheckFlag( Player , FlagTable[4] )	then
		ScriptMessage( Player , Player , 1 , "[SC_424372_DONE]" , 0 )
		ScriptMessage( Player , Player , 0 , "[SC_424372_DONE]" , 0 )
		SetFlag( Player , DoneFlag , 1 )
	end
end

--- 阿克ㄟ咖

function LuaFA_424372_Start ()
	local Player = OwnerID()
	local Ark = TargetID()
	LoadQuestOption( Player )

	if not CheckAcceptQuest( Player, 424372 ) then
		--LuaFA_424372_Cancel()
		SetFlag(Player, 545239, 0)
	end

	if CheckFlag(Player, 545239) then
		AddSpeakOption( Player, Ark, "[SC_424372_START]", "LuaFA_424372_CheckLock", 0 )	-- 我也好像沒找到什麼有用的東西......
	end
end

function LuaFA_424372_CheckLock ()
	local Player = OwnerID()
	CloseSpeak(Player);
	local Ark = TargetID()
	local Ark2
	DisableQuest(Ark,true);
	Global_DW_TempPlayerPool = 	Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424372] = 	Global_DW_TempPlayerPool[424372] or {};
	if	Global_DW_TempPlayerPool[424372].state == "Kick off"	then
		CallPlot(Player,"DW_ChooseOneFromTwo",Player,"[SC_QUESTEXECUTESURE_0]","LuaDW_424372_InitialPlayer","LuaS_424964_WaitNext");
	else
		LuaDW_424372_InitialPlayer()
		Global_DW_TempPlayerPool[424372].state = "Kick off";
		Global_DW_TempPlayerPool[424372].ActorTable = {};
		Global_DW_TempPlayerPool[424372].ActorTable.NewArk = Lua_DW_CreateObj( "obj", 118605, Ark, 1, 1 )
		Ark2 = Global_DW_TempPlayerPool[424372].ActorTable.NewArk
		PlayMotionEX( Ark2, ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
		ks_ActSetMode( Ark2 )
		CallPlot(Ark2, "LuaFA_424372_01", Player)
		CallPlot(Ark2, "LuaDW_424372_HelpCheck", Player, 424372, 545240, Ark, EM_RoleValue_Register1, 620025, Ark2, nil, nil, "LuaFA_424372_Cancel" )
	end
	DisableQuest(Ark,false);
end

function LuaDW_424372_HelpCheck( Player, QuestID, FinishFlag, ResetNPC, ResetNPCColumn, Buff, CheckPoint, FlagNum, Range, CancelFunc )
	local Controller = OwnerID();
	local CheckDis = true
	Range = nil or 150
	while	true	do
		sleep(20);
		for index,Pl_Guid in pairs(Global_DW_TempPlayerPool[424372]) do
			if	type(index)=="number"	then
				if	CheckID(Pl_Guid)==false	then
					CancelFunc(Pl_Guid, 1, QuestID,  ResetNPC, ResetNPCColumn);
				end
				if CheckPoint ~= nil then
					if FlagNum == nil then
						CheckDis = CheckDistance(CheckPoint, Pl_Guid, Range)
					else
						CheckDis = DW_CheckDis(Pl_Guid, MoveFlag, FlagNum, Range)
					end
				end
				if 	CheckDis==false or
					CheckBuff(Pl_Guid, Buff)==false or
					CheckAcceptQuest(Pl_Guid, QuestID)==false 	then
					CancelFunc(Pl_Guid, 2, QuestID,  ResetNPC, ResetNPCColumn);
				end
			end
			if	DW_QuestBreakCondition(Controller,0,424372,true)==0	then
				return
			end
		end
	end
end

function LuaDW_424372_InitialPlayer()
	local Player = OwnerID();
	Global_DW_TempPlayerPool = 	Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424372] = 	Global_DW_TempPlayerPool[424372] or {};
	table.insert(Global_DW_TempPlayerPool[424372],Player);
	AddBuff(Player, 620025, 0, -1);
	SetFlag(Player, 545240, 1);
end

function LuaFA_424372_Cancel ( Player, Mode, ResetNPC, ResetNPCColumn )
	local DelFlag = { 545235 , 545236 , 545237 , 545238 , 545796 }
	local DelObjs = {118605, 118713}
	local DelBuff = 620025
	local DelItem = nil

	Player = Player or TargetID()
	Mode = Mode or 2

	local IsSecend = false
	if	Global_DW_TempPlayerPool[424372]==nil	then
		FA_CheckPlayerDel( Player, Mode, ResetNPC, ResetNPCColumn, DelFlag, DelObjs, DelBuff, DelItem);
	else
		for index,Pl_Guid in pairs(Global_DW_TempPlayerPool[424372]) do
			if	type(index)=="number"	then
				FA_CheckPlayerDel( Pl_Guid, Mode, ResetNPC, ResetNPCColumn, DelFlag, DelObjs, DelBuff, DelItem);
				if	IsSecend==false	then
					IsSecend=true
					DelObjs = nil;
				end
			end
		end
		Global_DW_TempPlayerPool[424372] = nil;
	end
end

function LuaFA_424372_01(Player)
	Global_DW_TempPlayerPool = 	Global_DW_TempPlayerPool or {};
	Global_DW_TempPlayerPool[424372] = 	Global_DW_TempPlayerPool[424372] or {};
	Global_DW_TempPlayerPool[424372].ActorTable = Global_DW_TempPlayerPool[424372].ActorTable or {};
	local ActorTable = Global_DW_TempPlayerPool[424372].ActorTable;
	local Var = {};
	Var.Ark = OwnerID();								--Moving to position
	Var.Dwaft = FA_SearchNPC( Var.Ark, nil, 118694)					--Lay on ground
	Var.ArkEnd = FA_SearchNPC( Var.Ark, nil, 118606)				--Leg break out, sit down
	ActorTable.Dwaft = Lua_DW_CreateObj( "obj", 118713, Var.Dwaft, 1, 1 ) 	--New object

	PlayMotionEX( ActorTable.Dwaft, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	ks_ActSetMode( ActorTable.Dwaft )
	Say(Var.Ark, "[SC_424372_01]")	-- 嗯......看來還是只能往堡裡面走了嗎...？
	LuaFunc_WaitMoveTo(Var.Ark, kg_GetPosRX(Var.Dwaft))
	Say(Var.Ark, "[SC_424372_02]")	-- 啊，抱歉......
	LuaFunc_WaitMoveTo(Var.Ark, kg_GetPos(Var.ArkEnd))
	Sleep(5)
	PlayMotionEX( Var.Ark, ruFUSION_ACTORSTATE_CRAFTING_BEGIN,ruFUSION_ACTORSTATE_CRAFTING_LOOP)
	Sleep(10)
	PlayMotion(ActorTable.Dwaft, ruFUSION_ACTORSTATE_SLEEP_END)
	Sleep(10)
	LuaFunc_WaitMoveTo(ActorTable.Dwaft, kg_GetPosRX(Var.Ark, nil, 10, 0, 180))
	Sleep(5)
	AdjustFaceDir(ActorTable.Dwaft, Var.Ark, 0)
	Sleep(10)
	PlayMotionEX(ActorTable.Dwaft, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_LOOP )
	Sleep(3)
	Say(Var.Ark, "[SC_424372_03]")	-- 哇啊！！！！！
	Sleep(5)
	Say(Var.Ark, "[SC_424372_04]")	-- 什麼鬼啊？！死人去死啦！！
	AdjustFaceDir( Var.Ark, ActorTable.Dwaft, 0)
	Sleep(5)
	PlayMotion( Var.Ark, ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(8)
	PlayMotionEX(ActorTable.Dwaft, ruFUSION_ACTORSTATE_KNOCKDOWN_BEGIN, ruFUSION_ACTORSTATE_KNOCKDOWN_LOOP )
	Sleep(10)
	PlayMotionEX( ActorTable.Dwaft, ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	Sleep(15)
	DelObj(ActorTable.Dwaft)
	SetDefIdleMotion(Var.Ark,ruFUSION_MIME_SIT_LOOP)
	Say(Var.Ark, "[SC_424372_05]")	-- 可恨的死人！！我的腳！！！
	Sleep(10)
	Global_DW_TempPlayerPool[424372].state = nil
	if	DW_QuestBreakCondition(Var.Ark,620025,424372,true)>0	then
		for index,Pl_Guid in pairs(Global_DW_TempPlayerPool[424372]) do
			if	type(index)=="number"	then
				CancelBuff(Pl_Guid,620025);
			end
		end
	end
	Global_DW_TempPlayerPool[424372] = nil;
	DelObj(OwnerID());
end

--

function LuaI_209598()
	AddBuff( OwnerID() , 620191 , 1 , -1)
end

function LuaI_209598_delete()
	CallPlot( OwnerID(), "LuaI_209598_delete_01", 209598 )
end
function LuaI_209598_delete_01(Cloth)
	local Player = OwnerID()
	local Cloth = 209598

	if	CheckCompleteQuest( Player, 424376 ) == false and CountBodyItem( Player, Cloth ) < 1 then
		ScriptMessage( Player, Player, 1,"[SC_209598_0]", 0 )	-- 你把衣服從背包拿出來想要丟掉...
		ScriptMessage( Player, Player, 0,"[SC_209598_0]", 0 )

		GiveBodyItem( Player , Cloth , 1 )

		ScriptMessage( Player, Player, 1,"[SC_209598_1]", 0 )	-- 但是這東西現在丟掉就很困擾了，還不可以丟掉。
		ScriptMessage( Player, Player, 0,"[SC_209598_1]", 0 )
	end

end

function LuaFA_424371_Accept()
	local Player = TargetID()
	local Cloth = 209598
	if CountBodyItem( Player, Cloth ) < 1 then GiveBodyItem( Player , Cloth , 1 ) end
end


function LuaS_424366_end()
	Setflag( TargetID() , 544579 , 1)
end

function LuaS_424367_end()
	Setflag( TargetID() , 544580 , 1)
end

function LuaS_424368_end()
	Setflag( TargetID() , 544581 , 1)
end

function LuaS_424371_begin()
	GiveBodyItem( TargetID() , 209598 , 1 )
end

---

function LuaFA_Z20_ReturnToBar ()
	ChangeZone( TargetID(), 20, 0, -14309 - Rand(26), 114, 35712 + Rand(29), 215 + Rand(10) )
end

--

function LuaFA_424380 ()
	local Pos = { -15610 + Rand(35), 425, 38360 + Rand(50) }
	Pos[2] = GetHeight( unpack(Pos) )
	table.insert( Pos, 165 + Rand(20) )
	ChangeZone( TargetID(), 20, 0, unpack(Pos) )
end

--

function Lua_FA_424385_Accapt ()
	local Player = TargetID()
	ScriptMessage(Player, Player, 0, "[SC_424385_01]", C_Red)	-- [118497]在旁，努力地不讓人發現他正在啜泣。
	ScriptMessage(Player, Player, 1, "[SC_424385_01]", C_Red)	-- [118497]在旁，努力地不讓人發現他正在啜泣。
end

function Lua_FA_424385_Complete ()
	local Player = TargetID()
	ScriptMessage(Player, Player, 0, "[SC_424385_02]", C_Red)	-- [118289]向你揮揮手，表示不用擔心。回去找[118603]吧。
	ScriptMessage(Player, Player, 1, "[SC_424385_02]", C_Red)	-- [118289]向你揮揮手，表示不用擔心。回去找[118603]吧。
	SetFlag( Player, 544584, 1)
end

function LuaFA_240096_01()
	FA_Border( OwnerID(), "[SC_240096_01]", nil, 545435 )
end

function LuaFA_424379_Accept()
	local Player = TargetID()
--	if CheckCompleteQuest( Player, 424055 ) then SetFlag( Player, 545234, 1 ) end
--	if not ( CheckCompleteQuest( Player, 424055 ) or CheckAcceptQuest( Player, 424055 ) ) then
		ScriptMessage( Player, Player, 0, "[545234]", 0 ) -- 出去溜溜吧
		ScriptMessage( Player, Player, 1, "[545234]", 0 )
--	end
--	AddBuff( Player, 620014, 0, -1 )
end

function LuaFA_424379_Flag ()
	local Player = TargetID()
	if CheckAcceptQuest( Player, 424379 ) then
		SetFlag( Player, 545234, 1 )
		CancelBuff( Player, 620136 )
		CancelBuff( Player, 620137 )
		WriteRoleValue( Player, EM_RoleValue_Register5, 0 )
	end
end

function LuaFA_497660()
	local Player = OwnerID()
	if not CheckAcceptQuest( Player, 424379 ) then
		CancelBuff( Player, 620136 )
		CancelBuff( Player, 620137 )
		WriteRoleValue( Player, EM_RoleValue_Register5, 0 )
	end

	if not CheckBuff( Player, 620136 ) then
		if ReadRoleValue( Player, EM_RoleValue_Register5 ) ~= 1 then
			SetFlag( Player, 545234, 1 )
			CancelBuff( Player, 620137 )
		end
	end
end

function LuaFA_424379_Outside()
	SetPlot( OwnerID(), "collision", "LuaFA_424379_Outside_02", 0 )
end

function LuaFA_424379_Outside_02()
	debugmsg(0,0,"touch")
	local Player = OwnerID()
	if CheckAcceptQuest( Player, 424379 ) then
		if ReadRoleValue( Player, EM_RoleValue_Register5 )  == 1
		and not CheckBuff( Player, 620137 ) then
			AddBuff( Player, 620136, 0, 180 )
			AddBuff( Player, 620137, 0, -1 )
		end
		WriteRoleValue( Player, EM_RoleValue_Register5, 0 )
	end
end

function LuaFA_424379_Inside()
	SetPlot( OwnerID(), "collision", "LuaFA_424379_Inside_02", 0 )
end

function LuaFA_424379_Inside_02()
	debugmsg(0,0,"touchin")
	local Player = OwnerID()
	if CheckAcceptQuest( Player, 424379 ) then
		WriteRoleValue( Player, EM_RoleValue_Register5, 1 )
	end
end