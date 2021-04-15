function BopoI_Help()
	local wolf = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100105 , 300 , 1)
--			say( ReadRoleValue( OwnerID() ,EM_RoleValue_AttackTargetID )  , " Damn " )
	for i = 1 ,  table.getn(wolf) , 1 do
		if CheckID( wolf[i] ) == true and CheckID(ReadRoleValue( wolf[i] ,EM_RoleValue_AttackTargetID ) ) == false then
			say( wolf[i] , GetString("WOLF_KILL") )
			SetAttack( Wolf[i] , ReadRoleValue( OwnerID() ,EM_RoleValue_AttackTargetID ) )
		end
	end
end

function LuaI_100122()
	SetPlot( OwnerID() , "dead" , "LuaI_100122_Dead" , 0 )
end

function LuaI_100122_Dead()
	
	local Obj = Role:New(OwnerID())  
	local Box = CreateObj ( 100654 , Obj:X() , Obj:Y()  , Obj:Z()  , Obj:Dir()  , 1)
	SetFightMode ( Box ,0, 0, 0,1 )
	BeginPlot( Box , "Zone1_Treasure_Init" , 0 )
	return true
end