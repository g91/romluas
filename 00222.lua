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
function LuaQ_420092_2() --�l���s���`��
	
	local GhostMan
	local Zone = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Hide(OwnerID())

	GhostMan = LuaFunc_CreateObjByObj ( 100068 , OwnerID() ) 
	DelFromPartition( GhostMan)
	AddToPartition( GhostMan , Zone )
	Say( GhostMan, GetString("SAY_420092_0") ) --/*�������o�Ǥ��ѩ�@�I
	BeginPlot( GhostMan, "LuaQ_420092_3",0)
	SetAttack( GhostMan , TargetID() );--�]�wNPC�������ؼЬ����a
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