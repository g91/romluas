function LuaQ_420092_Onclick()
	if CountBodyItem(OwnerID(),200078) == 0 then
		return 1
	else
		return -1
	end
end
--------------------------------------------------------------------------------------------------------
function LuaQ_420092_AfterClick()	
	BeginPlot( TargetID() , "LuaQ_420092_2",0)
	return 1
end
--------------------------------------------------------------------------------------------------------
function LuaQ_420092_2() --召喚研究員亡魂
	
	local GhostMan
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Hide(OwnerID())

	GhostMan = LuaFunc_CreateObjByObj ( 100068 , OwnerID() ) 
	DelFromPartition( GhostMan)
	AddToPartition( GhostMan , Zone )
	Say( GhostMan, GetString("SAY_420092_0") ) --/*不能讓這些公諸於世！
	BeginPlot( GhostMan, "LuaQ_420092_3",0)
	SetAttack( GhostMan , TargetID() );--設定NPC攻擊的目標為玩家
	sleep(300)
	
	while 1 do
		if CheckID( GhostMan ) == False then
			Show(OwnerID(),Zone)
			break
		end
		sleep(1)
	end

end
--------------------------------------------------------------------------------------------------------
function LuaQ_420092_3()
	LuaFunc_Obj_Suicide(300)
end
--------------------------------------------------------------------------------------------------------