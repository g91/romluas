
function LuaS_702398_00()--銀野協會補給員
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_1]")
end

function LuaS_702398_01()--打鐵導師
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_2]")
end

function LuaS_702398_02() --鍊金商人
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_3]")
	LuaP_dr_STRETCH()
end

function LuaS_702398_03()--營地裡的冒險者
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_4]")
end

function LuaS_702398_04()--凡薩琳．葛拉芙
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_5]")
end

function LuaS_702398_05()--瑟理斯
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_6]")
end

function LuaS_702398_06()--坐騎管理員
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_7]")
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_WAVE)
end


function LuaS_702398_07()--樵夫導師(港口)
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_8]")
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_WAVE)
end


function LuaS_702398_08()--貪吃的船員
	local Obj = OwnerID()
	Npcsay(Obj,"[SC_702398_9]")
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_STRETCH)
end