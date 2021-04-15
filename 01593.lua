function Lua_cang_119_SKillA()
	Sleep(10)
	if CheckBuff(OwnerID() , 504971) == true then	--檢查火buff
		SysCastSpellLV( OwnerID() , OwnerID() , 494450 ,1)	--		
	end
end	


function Lua_cang_119_Demon()
	
	BeginPlot(OwnerID(), "Lua_cang_119_Demon_Touch_1" , 10)

	local Time = 0
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local FireM = 0
	local FireRND =  Rand( 100 )+1	-- 產生亂數
	if FireRND <= 100 and FireRND > 75 then
		FireM = 102719
	elseif FireRND <= 75 and FireRND > 50 then
		FireM = 102720
	elseif FireRND <= 50 and FireRND > 25 then
		FireM = 102719
	elseif FireRND <= 25 and FireRND > 0 then
		FireM = 102720
	end
	
	local Demon = LuaFunc_CreateObjByObj ( FireM , OwnerID() )
	AddToPartition( Demon , RoomID )	--加進舞台
	WriteRoleValue( Demon , EM_RoleValue_Livetime,50 )
	
	while true do
		Sleep(10)
		Time = Time + 1
		if Time == 60 then
			if FireRND <= 100 and FireRND > 75 then
				FireM = 102719
			elseif FireRND <= 75 and FireRND > 50 then
				FireM = 102720
			elseif FireRND <= 50 and FireRND > 25 then
				FireM = 102719
			elseif FireRND <= 25 and FireRND > 0 then
				FireM = 102720
			end
			local Demon1 = LuaFunc_CreateObjByObj ( FireM , OwnerID() )
			AddToPartition( Demon1 , RoomID )
			WriteRoleValue( Demon1 , EM_RoleValue_Livetime,50 )
			Time = 0
		end	
	end	
end		


function Lua_cang_119_Demon_Touch_1()	--發動 觸發
	SetPlot( OwnerID() , "range" , "Lua_cang_119_Demon_Touch_2" , 150)
end

function Lua_cang_119_Demon_Touch_2()
	SetPlot( TargetID(),"range", "" ,0 )
	DelObj(TargetID())
end	
	

	

				