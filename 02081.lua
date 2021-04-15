--2010暖冬節新增 特殊變身藥水
function lua_mika_xmas_transpotion()
	local random = rand(100)
	if random >= 0 and random <= 40 then
		CastSpell( OwnerID(), OwnerID(), 496081 )
	elseif random >= 41 and random <= 75 then
		CastSpell( OwnerID(), OwnerID(), 496082 )
	else
		CastSpell( OwnerID(), OwnerID(), 496083 )
	end
end