ZonePE_BuffType = {}	--新型PE Buff類型
ZonePE_BuffType[1301] = {	[1] = 508564,
			[2] = 508565,
			[3] = 508566,
			[4] = 508567,
			[5] = 508568,
			[6] = 508569,
			[7] = 508570,
			[8] = 508571,
			[9] = 508572,
			}

ZonePE_BuffType[1302] = {	[1] = 508629,
			[2] = 508630,
			[3] = 508631,
			[4] = 508632,
			[5] = 508633,
			[6] = 508634,
			[7] = 508635,
			[8] = 508660,
			}

ZonePE_BuffType[1303] = {	[1] = 508712,
			[2] = 508713,
			[3] = 508714,
			[4] = 508715,
			[5] = 508716,
			[6] = 508717,
			[7] = 508718,
			[8] = 508719,
			}

ZonePE_BuffType[1401] = {	[1] = 508981,
			[2] = 508982,
			[3] = 508983,
			[4] = 508984,
			[5] = 508985,
			[6] = 508986,
			[7] = 508987,
			[8] = 508988,
			}

ZonePE_BuffType[1402] = {	[1] = 509117,
			[2] = 509118,
			[3] = 509119,
			[4] = 509120,
			[5] = 509121,
			[6] = 509122,
			[7] = 509123,
			}

ZonePE_BuffType[1403] = {	[1] = 509178,
			[2] = 509179,
			[3] = 509180,
			[4] = 509181,
			[5] = 509182,
			[6] = 509183,
			[7] = 509184,
			[8] = 509185,
			[9] = 509186,
			}

ZonePE_BuffType[1404] = {	[1] = 508811,
			[2] = 508812,
			[3] = 508813,
			[4] = 508814,
			[5] = 508815,
			[6] = 508816,
			[7] = 508817,
			[8] = 508818,
			[9] = 508819,
			[10] = 508820,
			}

ZonePE_BuffType[2001] = {	[1] = 509751,
			[2] = 509752,
			[3] = 509753,
			[4] = 509754,
			[5] = 509755,
			[6] = 509756,
			[7] = 509757,
			}

--===============================================================================--

--===============================================================================--

function Lua_Zone13_Init()
	Lua_Zone13_PE01_GlobalSet()--全域變數設定
	Lua_Zone13_PE01_PESet()--PE設置

	Lua_Zone13_PE02_GlobalSet()--全域變數設定
	Lua_Zone13_PE02_PESet()--PE設置

	Lua_Zone13_PE03_GlobalSet()--全域變數設定
	Lua_Zone13_PE03_PESet()--PE設置

	LuaFunc_InitZone_13( 0 )--生活技能採集點
end

function Lua_Zone14_Init()
	Lua_Zone14_PE01_GlobalSet()
	Lua_Zone14_PE01_PESet()

	Lua_Zone14_PE02_GlobalSet()
	Lua_ZONE14_PE02_PESet()
	Lua_Zone14_PE02_CreateTeamCtrl()--創造冒險隊中控

	Lua_Zone14_PE03_GlobalSet()
	Lua_Zone14_PE03_PESet()

	Lua_ZONE14_PE04_GlobalSet()
	Lua_ZONE14_PE04_PESet()
	Lua_Zone14_PE04_CreateTeamCtrl()--創造冒險隊中控

	Lua_ZONE14_PE05_GlobalSet()
	Lua_ZONE14_PE05_PESet()

	LuaFunc_InitZone_14( 0 )--生活技能採集點
end

function Lua_Zone20_Init()
	Lua_ZONE20_PE01_Init()--初始設定(SERVER)
	LuaFunc_InitZone_20( 0 ) --初始設定(SERVER)採集點
end