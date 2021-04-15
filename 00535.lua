function NewRuneList( min , max )

	local Rune = {}
	local tmp = {}
	local i = 0
	local j = 0

	Rune[1] = { 520021 } -- 力氣 I
	Rune[2] = { 520041 } -- 耐性 I
	Rune[3] = { 520061 } -- 聰慧 I
	Rune[4] = { 520081 } -- 精力 I
	Rune[5] = { 520101 } -- 靈活 I
	Rune[6] = { 520121 } -- 體力 I
	Rune[7] = { 520141 } -- 魔力 I
	Rune[8] = { 520161 } -- 傷害 I
	Rune[9] = { 520181 } -- 魔攻 I
	Rune[10] = { 520201 } -- 防衛 I
	Rune[11] = { 520221 } -- 魔防 I

	Rune[12] = { 520022 } -- 力氣 II
	Rune[13] = { 520042 } -- 耐性 II
	Rune[14] = { 520062 } -- 聰慧 II
	Rune[15] = { 520082 } -- 精力 II
	Rune[16] = { 520102 } -- 靈活 II
	Rune[17] = { 520122 } -- 體力 II
	Rune[18] = { 520142 } -- 魔力 II
	Rune[19] = { 520162 } -- 傷害 II
	Rune[20] = { 520182 } -- 魔攻 II
	Rune[21] = { 520202 } -- 防衛 II
	Rune[22] = { 520222 } -- 魔防 II

	Rune[23] = { 520023 } -- 力氣 III
	Rune[24] = { 520043 } -- 耐性 III
	Rune[25] = { 520063 } -- 聰慧 III
	Rune[26] = { 520083 } -- 精力 III
	Rune[27] = { 520103 } -- 靈活 III
	Rune[28] = { 520123 } -- 體力 III
	Rune[29] = { 520143 } -- 魔力 III
	Rune[30] = { 520163 } -- 傷害 III
	Rune[31] = { 520183 } -- 魔攻 III
	Rune[32] = { 520203 } -- 防衛 III
	Rune[33] = { 520223 } -- 魔防 III

	Rune[34] = { 520024 } -- 力氣 IV
	Rune[35] = { 520044 } -- 耐性 IV
	Rune[36] = { 520064 } -- 聰慧 IV
	Rune[37] = { 520084 } -- 精力 IV
	Rune[38] = { 520104 } -- 靈活 IV
	Rune[39] = { 520124 } -- 體力 IV
	Rune[40] = { 520144 } -- 魔力 IV
	Rune[41] = { 520164 } -- 傷害 IV
	Rune[42] = { 520184 } -- 魔攻 IV
	Rune[43] = { 520204 } -- 防衛 IV
	Rune[44] = { 520224 } -- 魔防 IV

	Rune[45] = { 520025 } -- 力氣 V
	Rune[46] = { 520045 } -- 耐性 V
	Rune[47] = { 520065 } -- 聰慧 V
	Rune[48] = { 520085 } -- 精力 V
	Rune[49] = { 520105 } -- 靈活 V
	Rune[50] = { 520125 } -- 體力 V
	Rune[51] = { 520145 } -- 魔力 V
	Rune[52] = { 520165 } -- 傷害 V
	Rune[53] = { 520185 } -- 魔攻 V
	Rune[54] = { 520205 } -- 防衛 V
	Rune[55] = { 520225 } -- 魔防 V

	Rune[56] = { 520026 } -- 力氣 VI
	Rune[57] = { 520046 } -- 耐性 VI
	Rune[58] = { 520066 } -- 聰慧 VI
	Rune[59] = { 520086 } -- 精力 VI
	Rune[60] = { 520106 } -- 靈活 VI
	Rune[61] = { 520126 } -- 體力 VI
	Rune[62] = { 520146 } -- 魔力 VI
	Rune[63] = { 520166 } -- 傷害 VI
	Rune[64] = { 520186 } -- 魔攻 VI
	Rune[65] = { 520206 } -- 防衛 VI
	Rune[66] = { 520226 } -- 魔防 VI

	Rune[67] = { 520027 } -- 力氣 VII
	Rune[68] = { 520047 } -- 耐性 VII
	Rune[69] = { 520067 } -- 聰慧 VII
	Rune[70] = { 520087 } -- 精力 VII
	Rune[71] = { 520107 } -- 靈活 VII
	Rune[72] = { 520127 } -- 體力 VII
	Rune[73] = { 520147 } -- 魔力 VII
	Rune[74] = { 520167 } -- 傷害 VII
	Rune[75] = { 520187 } -- 魔攻 VII
	Rune[76] = { 520207 } -- 防衛 VII
	Rune[77] = { 520227 } -- 魔防 VII

	Rune[78] = { 520028 } -- 力氣 VIII
	Rune[79] = { 520048 } -- 耐性 VIII
	Rune[80] = { 520068 } -- 聰慧 VIII
	Rune[81] = { 520088 } -- 精力 VIII
	Rune[82] = { 520108 } -- 靈活 VIII
	Rune[83] = { 520128 } -- 體力 VIII
	Rune[84] = { 520148 } -- 魔力 VIII
	Rune[85] = { 520168 } -- 傷害 VIII
	Rune[86] = { 520188 } -- 魔攻 VIII
	Rune[87] = { 520208 } -- 防衛 VIII
	Rune[88] = { 520228 } -- 魔防 VIII

	Rune[89] = { 520029 } -- 力氣 IX
	Rune[90] = { 520049 } -- 耐性 IX
	Rune[91] = { 520069 } -- 聰慧 IX
	Rune[92] = { 520089 } -- 精力 IX
	Rune[93] = { 520109 } -- 靈活 IX
	Rune[94] = { 520129 } -- 體力 IX
	Rune[95] = { 520149 } -- 魔力 IX
	Rune[96] = { 520169 } -- 傷害 IX
	Rune[97] = { 520189 } -- 魔攻 IX
	Rune[98] = { 520209 } -- 防衛 IX
	Rune[99] = { 520229 } -- 魔防 IX

	Rune[100] = { 520030 } -- 力氣 X
	Rune[101] = { 520050 } -- 耐性 X
	Rune[102] = { 520070 } -- 聰慧 X
	Rune[103] = { 520090 } -- 精力 X
	Rune[104] = { 520110 } -- 靈活 X
	Rune[105] = { 520130 } -- 體力 X
	Rune[106] = { 520150 } -- 魔力 X
	Rune[107] = { 520170 } -- 傷害 X
	Rune[108] = { 520190 } -- 魔攻 X
	Rune[109] = { 520210 } -- 防衛 X
	Rune[110] = { 520230 } -- 魔防 X

	for i = min, max do
		j = j + 1
		tmp[j] = Rune[i]
		--ScriptMessage( OwnerID(), OwnerID(), 0, "|cffffffff"..Rune[i][1].."|r" , 0 )
	end

	Rune = tmp

	return Rune

end


function Rune_LucklyBag( level )

	local Rune = {}
	local DelBagNum = 0

	    if ( level == 10 ) then
		Rune = NewRuneList( 1 , 11 )		-- I 符文
		DelBagNum = 201521
	elseif  ( level == 20 ) then
		Rune = NewRuneList( 12 , 22 )	-- II 符文
		DelBagNum = 201522
	elseif  ( level == 30 ) then
		Rune = NewRuneList( 23 , 33 )	-- III 符文
		DelBagNum = 201523
	elseif  ( level == 40 ) then
		Rune = NewRuneList( 34 , 44 )	-- IV 符文
		DelBagNum = 201524
	elseif  ( level == 50 ) then
		Rune = NewRuneList( 45 , 55 )	-- V 符文
		DelBagNum = 201525
	elseif  ( level == 60 ) then
		Rune = NewRuneList( 56 , 66 )	-- VI 符文
		DelBagNum = 201526
	elseif  ( level == 70 ) then
		Rune = NewRuneList( 67 , 77 )	-- VII 符文
		DelBagNum = 201527
	elseif  ( level == 80 ) then
		Rune = NewRuneList( 78 , 88 )	-- VIII 符文
		DelBagNum = 201528
	elseif  ( level == 90 ) then
		Rune = NewRuneList( 89 , 99 )	-- IX 符文
		DelBagNum = 201529
	elseif  ( level == 100 ) then
		Rune = NewRuneList( 100 , 110 )	-- X 符文
		DelBagNum = 201530
	end


	--ScriptMessage( OwnerID(), OwnerID(), 0, "|cffffffff你打開符文福袋！|r" , 0 )

		--for i = 1, table.getn(Rune) do
		--	ScriptMessage( OwnerID(), OwnerID(), 0, "|cffffffff"..Rune[i][1].."|r" , 0 )
		--end

	-- 亂數取一
	local RuneRND = Rand( table.getn(Rune) ) + 1
	--Say( OwnerID() , "RuneRND = " .. RuneRND )
	
	-- 跑稀有度
	--local LV = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	--Say( OwnerID() , "LV = " .. LV )

	--    if ( LV > 0 and LV <= 30 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 1	-- ( 機率 30/100 )
	--elseif ( LV > 30 and LV <= 60 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 2	-- ( 機率 30/100 )
	--elseif ( LV > 60 and LV <= 80 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 3	-- ( 機率 20/100 )
	--elseif ( LV > 80 and LV <= 100 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 4	-- ( 機率 20/100 )
	--end

	RuneNum = Rune[ RuneRND ][1]

	--Say( OwnerID() , "RuneNum = "..RuneNum )

	GiveBodyItem ( OwnerID() , RuneNum , 1 )
	--CheckDelItem( OwnerID() , DelBagNum , 1 )
	UseItemDestroy()


	return true
end

function CheckDelItem( Palyer , Obj , Num )
	if ( CountBodyItem( Palyer , Obj ) >= Num ) then
		DelBodyItem ( Palyer , Obj , Num )
	end
end


