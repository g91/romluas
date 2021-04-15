function un_skill_850870()--深淵足音 判斷
local own = OwnerID()
	if checkbuff(own,624361) == true then  --判斷是否有主要效果的Buff
		return true
	else
		return false
	end
end
function un_850873_open() --自我扭曲開關判斷
	if Checkbuff(OwnerID(),624390) == false then
		return true
	else
		CancelBuff( OwnerID(), 624390)
		return false
	end	
end

function un_850873_CDTime() --自我扭曲Buff結束給予CD
	Lua_CDtime_set(OwnerID(),850873,10)
end