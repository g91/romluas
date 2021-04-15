function AddyMonster_initialize()
	-------------------------------------------------------------
	--	Monster
	-------------------------------------------------------------
	AddyMonster = AddyFighter:new()
	AddyMonster.class = "Monster"

	DebugLog(2, "[ROM Class] AddyMonster initialized")
end