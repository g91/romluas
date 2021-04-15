function please_tell_me_your_position()
	local target = this()
	DeBugMsg(0, 0, target.x.." , "..target.y.." , "..target.z)
end

function please_play_this_motion(guid)
	SetDefIdleMotion(this().guid, ruFUSION_MIME_IDLE_STAND)
end