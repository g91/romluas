function LuaI_ReflectionEnter()
	SetPlot( OwnerID() , "Collision" , "Enter_Reflection" , 0 );
end

function Enter_Reflection()
	if ChangeZone( OwnerID() , 103 , -1, 1334, 320, 2911, 163) == true then
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
	end
end

function LuaI_ReflectionOut()
	SetPlot( OwnerID() , "Collision" , "Out_Reflection" , 0 );
end

function Out_Reflection()

	--ScriptMessage( OwnerID(), OwnerID(), 0, "你穿過魔法障壁，進入了鏡之墓城！" , 0 );
	ChangeZone( OwnerID() , 4 , 0, -3838, 371, -830, 163);

end
