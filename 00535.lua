function NewRuneList( min , max )

	local Rune = {}
	local tmp = {}
	local i = 0
	local j = 0

	Rune[1] = { 520021 } -- �O�� I
	Rune[2] = { 520041 } -- �@�� I
	Rune[3] = { 520061 } -- �o�z I
	Rune[4] = { 520081 } -- ��O I
	Rune[5] = { 520101 } -- �F�� I
	Rune[6] = { 520121 } -- ��O I
	Rune[7] = { 520141 } -- �]�O I
	Rune[8] = { 520161 } -- �ˮ` I
	Rune[9] = { 520181 } -- �]�� I
	Rune[10] = { 520201 } -- ���� I
	Rune[11] = { 520221 } -- �]�� I

	Rune[12] = { 520022 } -- �O�� II
	Rune[13] = { 520042 } -- �@�� II
	Rune[14] = { 520062 } -- �o�z II
	Rune[15] = { 520082 } -- ��O II
	Rune[16] = { 520102 } -- �F�� II
	Rune[17] = { 520122 } -- ��O II
	Rune[18] = { 520142 } -- �]�O II
	Rune[19] = { 520162 } -- �ˮ` II
	Rune[20] = { 520182 } -- �]�� II
	Rune[21] = { 520202 } -- ���� II
	Rune[22] = { 520222 } -- �]�� II

	Rune[23] = { 520023 } -- �O�� III
	Rune[24] = { 520043 } -- �@�� III
	Rune[25] = { 520063 } -- �o�z III
	Rune[26] = { 520083 } -- ��O III
	Rune[27] = { 520103 } -- �F�� III
	Rune[28] = { 520123 } -- ��O III
	Rune[29] = { 520143 } -- �]�O III
	Rune[30] = { 520163 } -- �ˮ` III
	Rune[31] = { 520183 } -- �]�� III
	Rune[32] = { 520203 } -- ���� III
	Rune[33] = { 520223 } -- �]�� III

	Rune[34] = { 520024 } -- �O�� IV
	Rune[35] = { 520044 } -- �@�� IV
	Rune[36] = { 520064 } -- �o�z IV
	Rune[37] = { 520084 } -- ��O IV
	Rune[38] = { 520104 } -- �F�� IV
	Rune[39] = { 520124 } -- ��O IV
	Rune[40] = { 520144 } -- �]�O IV
	Rune[41] = { 520164 } -- �ˮ` IV
	Rune[42] = { 520184 } -- �]�� IV
	Rune[43] = { 520204 } -- ���� IV
	Rune[44] = { 520224 } -- �]�� IV

	Rune[45] = { 520025 } -- �O�� V
	Rune[46] = { 520045 } -- �@�� V
	Rune[47] = { 520065 } -- �o�z V
	Rune[48] = { 520085 } -- ��O V
	Rune[49] = { 520105 } -- �F�� V
	Rune[50] = { 520125 } -- ��O V
	Rune[51] = { 520145 } -- �]�O V
	Rune[52] = { 520165 } -- �ˮ` V
	Rune[53] = { 520185 } -- �]�� V
	Rune[54] = { 520205 } -- ���� V
	Rune[55] = { 520225 } -- �]�� V

	Rune[56] = { 520026 } -- �O�� VI
	Rune[57] = { 520046 } -- �@�� VI
	Rune[58] = { 520066 } -- �o�z VI
	Rune[59] = { 520086 } -- ��O VI
	Rune[60] = { 520106 } -- �F�� VI
	Rune[61] = { 520126 } -- ��O VI
	Rune[62] = { 520146 } -- �]�O VI
	Rune[63] = { 520166 } -- �ˮ` VI
	Rune[64] = { 520186 } -- �]�� VI
	Rune[65] = { 520206 } -- ���� VI
	Rune[66] = { 520226 } -- �]�� VI

	Rune[67] = { 520027 } -- �O�� VII
	Rune[68] = { 520047 } -- �@�� VII
	Rune[69] = { 520067 } -- �o�z VII
	Rune[70] = { 520087 } -- ��O VII
	Rune[71] = { 520107 } -- �F�� VII
	Rune[72] = { 520127 } -- ��O VII
	Rune[73] = { 520147 } -- �]�O VII
	Rune[74] = { 520167 } -- �ˮ` VII
	Rune[75] = { 520187 } -- �]�� VII
	Rune[76] = { 520207 } -- ���� VII
	Rune[77] = { 520227 } -- �]�� VII

	Rune[78] = { 520028 } -- �O�� VIII
	Rune[79] = { 520048 } -- �@�� VIII
	Rune[80] = { 520068 } -- �o�z VIII
	Rune[81] = { 520088 } -- ��O VIII
	Rune[82] = { 520108 } -- �F�� VIII
	Rune[83] = { 520128 } -- ��O VIII
	Rune[84] = { 520148 } -- �]�O VIII
	Rune[85] = { 520168 } -- �ˮ` VIII
	Rune[86] = { 520188 } -- �]�� VIII
	Rune[87] = { 520208 } -- ���� VIII
	Rune[88] = { 520228 } -- �]�� VIII

	Rune[89] = { 520029 } -- �O�� IX
	Rune[90] = { 520049 } -- �@�� IX
	Rune[91] = { 520069 } -- �o�z IX
	Rune[92] = { 520089 } -- ��O IX
	Rune[93] = { 520109 } -- �F�� IX
	Rune[94] = { 520129 } -- ��O IX
	Rune[95] = { 520149 } -- �]�O IX
	Rune[96] = { 520169 } -- �ˮ` IX
	Rune[97] = { 520189 } -- �]�� IX
	Rune[98] = { 520209 } -- ���� IX
	Rune[99] = { 520229 } -- �]�� IX

	Rune[100] = { 520030 } -- �O�� X
	Rune[101] = { 520050 } -- �@�� X
	Rune[102] = { 520070 } -- �o�z X
	Rune[103] = { 520090 } -- ��O X
	Rune[104] = { 520110 } -- �F�� X
	Rune[105] = { 520130 } -- ��O X
	Rune[106] = { 520150 } -- �]�O X
	Rune[107] = { 520170 } -- �ˮ` X
	Rune[108] = { 520190 } -- �]�� X
	Rune[109] = { 520210 } -- ���� X
	Rune[110] = { 520230 } -- �]�� X

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
		Rune = NewRuneList( 1 , 11 )		-- I �Ť�
		DelBagNum = 201521
	elseif  ( level == 20 ) then
		Rune = NewRuneList( 12 , 22 )	-- II �Ť�
		DelBagNum = 201522
	elseif  ( level == 30 ) then
		Rune = NewRuneList( 23 , 33 )	-- III �Ť�
		DelBagNum = 201523
	elseif  ( level == 40 ) then
		Rune = NewRuneList( 34 , 44 )	-- IV �Ť�
		DelBagNum = 201524
	elseif  ( level == 50 ) then
		Rune = NewRuneList( 45 , 55 )	-- V �Ť�
		DelBagNum = 201525
	elseif  ( level == 60 ) then
		Rune = NewRuneList( 56 , 66 )	-- VI �Ť�
		DelBagNum = 201526
	elseif  ( level == 70 ) then
		Rune = NewRuneList( 67 , 77 )	-- VII �Ť�
		DelBagNum = 201527
	elseif  ( level == 80 ) then
		Rune = NewRuneList( 78 , 88 )	-- VIII �Ť�
		DelBagNum = 201528
	elseif  ( level == 90 ) then
		Rune = NewRuneList( 89 , 99 )	-- IX �Ť�
		DelBagNum = 201529
	elseif  ( level == 100 ) then
		Rune = NewRuneList( 100 , 110 )	-- X �Ť�
		DelBagNum = 201530
	end


	--ScriptMessage( OwnerID(), OwnerID(), 0, "|cffffffff�A���}�Ť�ֳU�I|r" , 0 )

		--for i = 1, table.getn(Rune) do
		--	ScriptMessage( OwnerID(), OwnerID(), 0, "|cffffffff"..Rune[i][1].."|r" , 0 )
		--end

	-- �üƨ��@
	local RuneRND = Rand( table.getn(Rune) ) + 1
	--Say( OwnerID() , "RuneRND = " .. RuneRND )
	
	-- �]�}����
	--local LV = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	--Say( OwnerID() , "LV = " .. LV )

	--    if ( LV > 0 and LV <= 30 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 1	-- ( ���v 30/100 )
	--elseif ( LV > 30 and LV <= 60 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 2	-- ( ���v 30/100 )
	--elseif ( LV > 60 and LV <= 80 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 3	-- ( ���v 20/100 )
	--elseif ( LV > 80 and LV <= 100 ) then
	--	RuneNum = Rune[ RuneRND ][1] + 4	-- ( ���v 20/100 )
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


