function LuaS_Lock_101502()
	local Me = Role:new( OwnerID() )
	local Loca = CreateObj ( 101502 , Me:X() , Me:Y() , Me:Z() , Me:Dir()+90 , 1)
	AddToPartition( Loca , 0 )
	CastSpell( Loca , Loca , 492369 )
end

function LuaS_IceTarget()
	Say( OwnerID() , OwnerID())
	Say( TargetID() , TargetID())
	AddBuff( TargetID() , 502826 , 1 , 600 )		-- 10 ╓юда
end