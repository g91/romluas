function Lua_na_AC2S4_852115()	--元氣聚集 飛行特效
	local Owner = OwnerID()
	local Target = TargetID()
	SysCastSpellLv(Target,Owner,852131,0) 
end

function Lua_na_AC2S4_852118()
	local Owner = OwnerID()
	local x,y,z,dir = DW_Location(Owner)
	local Player = SearchRangePlayer( Owner , 150)
	for i = 0 , #Player do
		SetPos( Player[i] , x,y,z,dir)
	end
	SysCastSpellLv( Owner , Owner , 852127, 0 )
end

function Lua_na_AC2S4_852119()
	local Owner = OwnerID()
	local Target = TargetID()
	local x,y,z,dir = DW_Location(Target)
	SetPos( Owner, x, y, z )	
end


function Lua_na_AC2_boss_safe() --掛在小怪身上，如果目標是王，則無法施放法術
	local Owner = OwnerID()
	local Zone = ReadRoleValue( Owner , EM_RoleValue_ZoneID)
	local Boss = {	[196] = {108947 , 108948 , 108949 , 108950 },
			[197] = {108962 , 108963 , 108964 , 108965 },
			[198] = {108974 , 108975 , 108976 , 108977 }, 
			[199] = {108988 , 108989 , 108990 , 108991 , 108992 }	}
	if Zone ~= 196 and Zone ~= 197 and Zone ~= 198 and Zone ~= 199 then
		return true
	else	
		for j = 1 , #Boss[Zone] do
			if ReadRoleValue( TargetID() , EM_RoleValue_OrgID) == Boss[Zone][j] then
			--	Say( Owner , "FALSE")
				return FALSE
			end
		end
	end
	return TRUE
end