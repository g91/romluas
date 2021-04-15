function LuaS_meek_test1()
	say(OwnerID(),"i have no weapon")
	sleep(20)
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand, 210003, 1 );
	say(OwnerID(),"i get weapon")
	sleep(20)
	SetRoleEquip( OwnerID(), EM_EQWearPos_MainHand,210014,1 );
	say(OwnerID(),"i lose my weapon")
end

function LuaS_meek_test2()
	say(OwnerID(),OwnerID())
	say(TargetID(),TargetID())
end


function LuaS_MK_PEtest1()
	local FlagNum = 19
	local Mark = {}
	for i = 1 , 20 do
		 Mark[i] =    Lua_DW_CreateObj("flag" ,116391,780757,i)		
		 WriteRoleValue( Mark[i] , EM_RoleValue_Register+2, 0 )
		 WriteRoleValue( Mark[i] , EM_RoleValue_Register+1, i )		 
		 SetPlot(Mark[i],"touch","LuaPE_ZONE18_PE01_TouchMark",50)
	end
end



function LuaS_MK_PEtest2()

end

function LuaS_MK_PEtest3()
	local Mark = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116391 , 10000 , 1)
	local Stone = LuaFunc_SearchNPCbyOrgID( OwnerID() ,116392 , 10000 , 1)
	for i = 0,20 do
		if 	CheckID(Mark[i]) == true then
			Delobj(Mark[i])
		end
		if 	CheckID(Stone[i]) == true then
			Delobj(Stone[i])
		end
	end
end

function LuaS_MK_testBoss()
	AddBuff ( OwnerID(), 509278, 0, -1 )
end