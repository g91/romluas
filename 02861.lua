function bico_Z25_monster_Lodika_Ai()	--107669 ù�a�d �������ˬd
	local own = OwnerID()
	if CheckBuff( own , 624140 ) == true then
		return false
	else
		return true 
	end
end