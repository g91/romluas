function un_skill_850870()--�`�W���� �P�_
local own = OwnerID()
	if checkbuff(own,624361) == true then  --�P�_�O�_���D�n�ĪG��Buff
		return true
	else
		return false
	end
end
function un_850873_open() --�ۧڧᦱ�}���P�_
	if Checkbuff(OwnerID(),624390) == false then
		return true
	else
		CancelBuff( OwnerID(), 624390)
		return false
	end	
end

function un_850873_CDTime() --�ۧڧᦱBuff��������CD
	Lua_CDtime_set(OwnerID(),850873,10)
end