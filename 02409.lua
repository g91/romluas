function FA_Z20_Mailer()
	FA_Worker_01_P1( 113537, 10, 0, 110, nil, ruFUSION_ACTORSTATE_BUFF_BEGIN )
end

function FA_Zone20_Repellent ()
	SetPlot( OwnerID(),"range", "FA_Repellent", 30 )
end

function FA_Repellent()
	local Player = OwnerID()
	local HateList = KS_GetHateList( Player, 1 )
	for i = 1, table.getn(HateList)	do
		Lua_CancelAllBuff( HateList[i] )
		SetStopAttack( HateList[i] )
		ClearHateList( HateList[i], Player )
		ClearHateList( Player, HateList[i] )
		EnableNpcAI( HateList[i], false )
		LuaFunc_WaitMoveTo(HateList[i], kg_GetPosRX(HateList[i], nil, 150 , 0, 180, -2))
		EnableNpcAI( HateList[i], true )
	end
	ScriptMessage(Player,Player,1,"Repel!!",C_Red)
end

function LuaFA_Z20_AttackBowMan()
	local Bird = OwnerID()
	local BowMan = FA_SearchNPC(Bird, 600, 105857)
	if Type(BowMan) == "table" then BowMan = BowMan[1] end
	if BowMan ~= nil then SetAttack(Bird, BowMan ) end
end

function LuaFA_Z20_ArcDress()
	AddBuff(OwnerID(), 620191, 0, -1)
end

function LuaFA_Z20_Trash()
	local Trash = OwnerID()
	AddBuff(OwnerID(), 620240, 0, -1)
end

----YOU CANNOT PASS!!!
---- 守衛擋門
function LuaFA_Z20_Doris_CantPass()
	local Console = OwnerID()
	local Man1 = FA_SearchNPC(Console, nil, 118345)
	local Man2 = FA_SearchNPC(Console, nil, 118377)
	local Console2 = FA_SearchNPC(Console, nil, nil, 666666)
	WriteRoleValue(Console, EM_RoleValue_Register1, Man1)
	WriteRoleValue(Console, EM_RoleValue_Register2, Man2)
	WriteRoleValue(Console, EM_RoleValue_Register8, Console2 )
	WriteRoleValue(Console, EM_RoleValue_Register9, kg_GetDis(Console2, FA_GotMiddle(Man1, nil, nil, Man2) ))

	SetPlot(Console,"range","LuaFA_Z20_Doris_CantPass_Range",ReadRoleValue(Console, EM_RoleValue_PID))
end

function LuaFA_Z20_Doris_CantPass_Range()
	local Player = OwnerID()
	local Console = TargetID()
	local Man = { ReadRoleValue(Console, EM_RoleValue_Register1), ReadRoleValue(Console, EM_RoleValue_Register2) }
	local Console2 = ReadRoleValue(Console, EM_RoleValue_Register8)
	local HowLong = ReadRoleValue(Console, EM_RoleValue_Register9)

	if	not CheckBuff(Player, 620244) then return end

	if	not CheckCompleteQuest(Player, 424286)	then
		ScriptMessage(Player, Player, 1, "[SC_Z20_CANNOTPASS_0]" , 0)	-- 你被趕了出來	
		ScriptMessage(Player, Player, 0, "[118377]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 另外一個說你不能進去	
		ScriptMessage(Player, Player, 0, "[118345]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 阿瑪多爾說你不能進去

		FA_Say_NoOverlap( Man[1], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		FA_Say_NoOverlap( Man[2], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )

		DW_CancelTypeBuff( 68,  Player )
		CallPlot(Player, "LuaFA_CannotPass_PushOut", Console2, HowLong, 497663 )


	end
end


function LuaFA_Z20_Sardo_CantPass()
	local Console = OwnerID()
	local Man = FA_SearchNPC(Console, 200, 105841)
	local Console2 = FA_SearchNPC(Console, nil, nil, 666666)
	WriteRoleValue(Console, EM_RoleValue_Register1, Man[1])
	WriteRoleValue(Console, EM_RoleValue_Register2, Man[2])
	WriteRoleValue(Console, EM_RoleValue_Register8, Console2 )
	WriteRoleValue(Console, EM_RoleValue_Register9, kg_GetDis(Console2, FA_GotMiddle(Man[1], nil, nil, Man[2]) ))

	SetPlot(Console,"range","LuaFA_Z20_Sardo_CantPass_Range",ReadRoleValue(Console, EM_RoleValue_PID))
end

function LuaFA_Z20_Sardo_CantPass_Range()
	local Player = OwnerID()
	local Console = TargetID()
	local Man = { ReadRoleValue(Console, EM_RoleValue_Register1), ReadRoleValue(Console, EM_RoleValue_Register2) }
	local Console2 = ReadRoleValue(Console, EM_RoleValue_Register8)
	local HowLong = ReadRoleValue(Console, EM_RoleValue_Register9)

	if	not CheckBuff(Player, 620244) then return end

	if	not CheckBuff(Player, 620191)	then
		ScriptMessage(Player, Player, 1, "[SC_Z20_CANNOTPASS_0]" , 0)	-- 你被趕了出來	
		ScriptMessage(Player, Player, 0, "[105841]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 守衛說你不能進去

		FA_Say_NoOverlap( Man[1], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		FA_Say_NoOverlap( Man[2], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )

		DW_CancelTypeBuff( 68,  Player )
		CallPlot(Player, "LuaFA_CannotPass_PushOut", Console2, HowLong, 497663 )


	end
end

function LuaFA_CannotPass_Front()
	local PlayerList
	local Console = OwnerID()
	local Range = ReadRoleValue(Console, EM_RoleValue_PID)

	while 1 do
		PlayerList = SearchRangePlayer(Console, Range)
		for i = 0, table.getn(PlayerList) do
			AddBuff(PlayerList[i], 620244, 0, 2)
		end
		Sleep(5)
	end
end

function LuaFA_CannotPass_PushOut( Console2, HowLong, MagicID )
	local Player = OwnerID()

	repeat
		SysCastSpellLV(Console2,Player,497663,1)
		Sleep(5)
		DebugMsg(0,0,GetDistance(Player, Console2))
		DebugMsg(0,0,HowLong)
	until GetDistance(Player, Console2) > HowLong + 10
	AddBuff(Player, 620265, 0, -1)
	Sleep(15)
	CancelBuff(Player, 620265)
end

function LuaFA_Z20_Soldier()
	SetPlot(OwnerID(), "collision", "LuaFA_Z20_Soldier_Range", 0 )
end
function LuaFA_Z20_Soldier_Range ()
	local SayTable = {	"[SC_Z20_SOLDIER_01]",	"[SC_Z20_SOLDIER_02]",
				"[SC_Z20_SOLDIER_03]",	"[SC_Z20_SOLDIER_04]"	}
	FA_Say_NoOverlap(TargetID(), SayTable[RandRange(1,4)], 10, 1 )
end


function LuaFA_Z20_Doris_NoPass()
	local Controller = OwnerID()
	while 1 do
		SysCastSpellLv(Controller, Controller, 497662, 1 )
		Sleep(3)
	end
end

function LuaFA_Z20_Doris_NoPass_2()
	local Player = TargetID()

	if CheckBuff( Player, 620265 ) or CheckCompleteQuest(Player, 424286) then return end

	local Controller = OwnerID()

	AddBuff( Player, 620265, 0, -1 )
	ScriptMessage(Player, Player, 1, "[SC_Z20_CANNOTPASS_0]" , 0)	-- 你被趕了出來	
	ScriptMessage(Player, Player, 0, "[118377]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 另外一個說你不能進去	
	ScriptMessage(Player, Player, 0, "[118345]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 阿瑪多爾說你不能進去

	CallPlot(Player, "LuaFA_Z20_Doris_NoPass_3", Controller)
end

function LuaFA_Z20_Doris_NoPass_3(Controller)
	local Player = OwnerID()
	local Pos = {-13855 + Rand(60), 110, 35815 + Rand(50) }
	local Man

	Sleep(10)
	AddBuff( Player, 506098, 0, -1 )		--FadeIn FadeOut
	Pos[2] = GetHeight(Unpack(Pos))
	Pos[4] = 125 + Rand(10)
	ChangeZone( Player, 20, 0, Unpack(Pos))

	Man = { FA_SearchNPC(Player, 200, 118345), FA_SearchNPC(Player, 200, 118377) }

	if Type(Man[1]) == "table" then Man[1] = Man[1][1] end
	if Type(Man[2]) == "table" then Man[2] = Man[2][1] end

	Sleep(10)
	CancelBuff( Player, 506098 )		--FadeIn FadeOut
	Sleep(10)
	for i = 1, 2 do
		if Man[i] ~= nil then
			FA_Say_NoOverlap( Man[i], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
		end
	end
	Sleep(10)
	CancelBuff( Player, 620265 )
end


function LuaFA_Z20_Sardo_NoPass()
	local Controller = OwnerID()
	while 1 do
		SysCastSpellLv(Controller, Controller, 497661, 1 )
		Sleep(3)
	end
end

function LuaFA_Z20_Sardo_NoPass_2()
	local Player = TargetID()

	if CheckBuff( Player, 620265 ) or CheckBuff(Player, 620191) then return end

	AddBuff( Player, 620265, 0, -1 )
	ScriptMessage(Player, Player, 1, "[SC_Z20_CANNOTPASS_0]" , 0)	-- 你被趕了出來	
	ScriptMessage(Player, Player, 0, "[105841]: [SC_Z20_CANNOTPASS_1]" , 0)	-- 守衛說你不能進去

	CallPlot(Player, "LuaFA_Z20_Sardo_NoPass_3", OwnerID())
end

function LuaFA_Z20_Sardo_NoPass_3(Controller)
	local Player = OwnerID()
	local PID = ReadRoleValue(Controller, EM_RoleValue_PID)
	local Pos
	local Man

	if PID == 1 then
		Pos = {-16157 + Rand(47), 100, 34365 + Rand(55) }
		Pos[2] = GetHeight(Unpack(Pos))
		Pos[4] = 150 + Rand(10)
	elseif PID == 2 then
		Pos = {-16690 + Rand(42), 100, 34120 + Rand(57) }
		Pos[2] = GetHeight(Unpack(Pos))
		Pos[4] = 330 + Rand(10)
	end

	Sleep(10)
	AddBuff( Player, 506098, 0, -1 )		--FadeIn FadeOut
	ChangeZone( Player, 20, 0, Unpack(Pos))

	Man = FA_SearchNPC(Player, 400, 105841, PID, true)

	Sleep(10)
	CancelBuff( Player, 506098 )		--FadeIn FadeOut
	Sleep(10)
	if type(Man) == "table" then
		for i = 1, 2 do
			if Man[i] ~= nil then
				FA_Say_NoOverlap( Man[i], "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
			end
		end
	elseif type(Man) == "number" then
		FA_Say_NoOverlap( Man, "[SC_Z20_CANNOTPASS_1]", 10, 1, ruFUSION_ACTORSTATE_ATTACK_UNARMED )
	end
	Sleep(15)
	CancelBuff( Player, 620265 )
end