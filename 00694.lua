function LuaFunc_AntAcid()
	local spell = {[1] = 491107,[2] = 491108,[3] = 491109,[4] = 491110,[5] = 491111,[6] = 491112,[7] = 491113,[8] = 491114}
	local Count = rand(8)+1
	CastSpell( OwnerID() , OwnerID() , spell[Count] )
end