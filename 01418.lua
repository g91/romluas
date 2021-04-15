--傳送到海波拉各區域起點對話劇情
function Lua_PP_GOTO_205()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_Zone5to205_1" , 0 )
end

function Lua_PP_GOTO_206()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_Zone5to206_1" , 0 )
end

function Lua_PP_GOTO_207()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() , "LuaS_Zone5to207_1" , 0 )
end
--哈洛夫交易站傳點
function Lua_5_go_205and206and207()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_TILEDGN_HYBORA_LABYRINTH_01]" , "Lua_PP_GOTO_205", 0 ); --/復活者甬道
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_TILEDGN_HYBORA_LABYRINTH_02]" , "Lua_PP_GOTO_206", 0 ); --/守衛軍曲廊
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_TILEDGN_HYBORA_LABYRINTH_03]" , "Lua_PP_GOTO_207", 0 ); --/皇族避難所
end
--205傳點
function Lua_205_PP0_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_205_PP0_1", 0 ); --/我想傳送到其他地方
end

function Lua_205_PP0_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_2]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_HAROLFE TRADING POST]" , "Lua_PP_GOTO_TOWN", 0 ); --/哈洛夫交易站
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP1]" , "Lua_205_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP2]" , "Lua_205_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP3]" , "Lua_205_GOTO_PP3", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]", "Lua_PP_GOTO_206", 0 ); --/守衛軍曲廊
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP0]",  "Lua_PP_GOTO_207", 0 ); --/皇族避難所
end

function Lua_205_PP1_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_205_PP1_1", 0 ); --/我想傳送到其他地方
end

function Lua_205_PP1_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]"  )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP0]" , "Lua_PP_GOTO_205", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP2]" , "Lua_205_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP3]" , "Lua_205_GOTO_PP3", 0 ); --/後段休息點
end

function Lua_205_PP2_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_205_PP2_1", 0 ); --/我想傳送到其他地方
end

function Lua_205_PP2_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP0]" , "Lua_PP_GOTO_205", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP1]" , "Lua_205_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP3]" , "Lua_205_GOTO_PP3", 0 ); --/後段休息點
end

function Lua_205_PP3_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_205_PP3_1", 0 ); --/我想傳送到其他地方
end

function Lua_205_PP3_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP0]" , "Lua_PP_GOTO_205", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP1]" , "Lua_205_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP2]" , "Lua_205_GOTO_PP2", 0 ); --/中段休息點
end

--206傳點
function Lua_206_PP0_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_206_PP0_1", 0 ); --/我想傳送到其他地方
end

function Lua_206_PP0_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_2]")
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_HAROLFE TRADING POST]" , "Lua_PP_GOTO_TOWN", 0 ); --/哈洛夫交易站
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP1]" , "Lua_206_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP2]" , "Lua_206_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP3]" , "Lua_206_GOTO_PP3", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP4]" , "Lua_206_GOTO_PP4", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP0]",  "Lua_PP_GOTO_205", 0 ); --/復活者甬道
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP0]",  "Lua_PP_GOTO_207", 0 ); --/皇族避難所
end

function Lua_206_PP1_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_206_PP1_1", 0 ); --/我想傳送到其他地方
end

function Lua_206_PP1_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]" , "Lua_PP_GOTO_206", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP2]" , "Lua_206_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP3]" , "Lua_206_GOTO_PP3", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP4]" , "Lua_206_GOTO_PP4", 0 ); --/後段休息點
end

function Lua_206_PP2_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_206_PP2_1", 0 ); --/我想傳送到其他地方
end

function Lua_206_PP2_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]" , "Lua_PP_GOTO_206", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP1]" , "Lua_206_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP3]" , "Lua_206_GOTO_PP3", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP4]" , "Lua_206_GOTO_PP4", 0 ); --/後段休息點
end

function Lua_206_PP3_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_206_PP3_1", 0 ); --/我想傳送到其他地方
end

function Lua_206_PP3_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]" , "Lua_PP_GOTO_206", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP1]" , "Lua_206_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP2]" , "Lua_206_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP4]" , "Lua_206_GOTO_PP4", 0 ); --/後段休息點
end

function Lua_206_PP4_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_206_PP4_1", 0 ); --/我想傳送到其他地方
end

function Lua_206_PP4_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]" , "Lua_PP_GOTO_206", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP1]" , "Lua_206_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP2]" , "Lua_206_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP3]" , "Lua_206_GOTO_PP3", 0 ); --/後段休息點
end

--207傳點
function Lua_207_PP0_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_207_PP0_1", 0 ); --/我想傳送到其他地方
end

function Lua_207_PP0_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_2]")
	AddSpeakOption( OwnerID(), TargetID( ), "[ZONE_HAROLFE TRADING POST]" , "Lua_PP_GOTO_TOWN", 0 ); --/哈洛夫交易站
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP1]" , "Lua_207_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP2]" , "Lua_207_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP3]" , "Lua_207_GOTO_PP3", 0 ); --/後段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_205_GOTO_PP0]",  "Lua_PP_GOTO_205", 0 ); --/復活者甬道
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_206_GOTO_PP0]", "Lua_PP_GOTO_206", 0 ); --/守衛軍曲廊
end

function Lua_207_PP1_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_207_PP1_1", 0 ); --/我想傳送到其他地方
end

function Lua_207_PP1_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP0]" , "Lua_PP_GOTO_207", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP2]" , "Lua_207_GOTO_PP2", 0 ); --/中段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP3]" , "Lua_207_GOTO_PP3", 0 ); --/後段休息點
end

function Lua_207_PP2_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_207_PP2_1", 0 ); --/我想傳送到其他地方
end

function Lua_207_PP2_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP0]" , "Lua_PP_GOTO_207", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP1]" , "Lua_207_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP3]" , "Lua_207_GOTO_PP3", 0 ); --/後段休息點
end

function Lua_207_PP3_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/我想看看你賣的東西
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_HYBORA_PP_COM_1]" , "Lua_207_PP3_1", 0 ); --/我想傳送到其他地方
end

function Lua_207_PP3_1()
	SetSpeakDetail ( OwnerID(), "[SC_HYBORA_PP_COM_3]")
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP0]" , "Lua_PP_GOTO_207", 0 ); --/入口大廳
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP1]" , "Lua_207_GOTO_PP1", 0 ); --/前段休息點
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_207_GOTO_PP2]" , "Lua_207_GOTO_PP2", 0 ); --/中段休息點
end