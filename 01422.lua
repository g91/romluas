function Lua_DW_RuneBag(Kind,Lv,Range) 
--Kind 是符文屬性種類，只能填入正整數，最大到11，隨機順序由上到下
--Lv 為符文隨機得到的最低等級
--Range 為符文隨機的範圍，ex：Lv 3  Range 2   就是 3到4
	local MDEF = 520221
	local DEF = 520201
	local MATK = 520181
	local ATK = 520161
	local MP = 520141
	local HP = 520121
	local AGI = 520101
	local MND = 520081
	local INT = 520061
	local STA = 520041
	local STR = 520021

	local Rune = {
			{MDEF,MDEF+1,MDEF+2,MDEF+3,MDEF+4},
			{DEF,DEF+1,DEF+2,DEF+3,DEF+4},
			{MATK,MATK+1,MATK+2,MATK+3,MATK+4},
			{ATK,ATK+1,ATK+2,ATK+3,ATK+4},
			{MP,MP+1,MP+2,MP+3,MP+4},
			{HP,HP+1,HP+2,HP+3,HP+4},
			{AGI,AGI+1,AGI+2,AGI+3,AGI+4},
			{MND,MND+1,MND+2,MND+3,MND+4},
			{INT,INT+1,INT+2,INT+3,INT+4},
			{STA,STA+1,STA+2,STA+3,STA+4},
			{STR,STR+1,STR+2,STR+3,STR+4}
			}
	
	local Rate3 = {60,95,5}
	local Rate2 = {80,100}
	local DWRD = DW_Rand(100)
--	Say(OwnerID(),"RuneLv's Rate: "..DWRD )
	if	Lv== 1	then
		if	DWRD  > Rate3[1]	then
			if	DWRD  > Rate3[2]	then
				return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][3],1)
			else
				return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][2],1)
			end
		else
			return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][1],1)
		end
	else
		if	DWRD  > Rate2[1]	then
			return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][5],1)
		else
			return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][4],1)
		end
	end

	return	Lua_SafeGive(OwnerID(),Rune[DW_Rand(Kind)][DW_Rand(Range)+Lv-1],1)
end
