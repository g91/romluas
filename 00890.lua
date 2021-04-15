

function HOLSTER()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_HOLSTER_2H , ruFUSION_ACTORSTATE_HOLSTER_2H)
	Sleep( 30 )
end

function Show_Re()

	local RelationPosTotal = 20
	local Player = OwnerID()

	for i = 0 , RelationPosTotal - 1 do
		Say( Player , "P"..(i+1).." LV = "..GetRelation_Lv( Player , i ) )
		Say( Player , "Re = "..GetRelation_Relation( Player , i ) )
	end


end