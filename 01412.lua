
function Lua_eliteskill_Check()
	local Flag = {542705,542707,542706,542708,542694,542704, 543614,543615}
	for i=1,8 do
		if	voc_lv(i,OwnerID()) >= 50	then
			SetFlag(OwnerID(),Flag[i],1)
		else
			SetFlag(OwnerID(),Flag[i],0)
		end
	end
	LoadQuestOption( OwnerID() );
end