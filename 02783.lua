----------------------------------------------------------------------------------------------------
Function WM_HomeWork_00()
	local PID=OwnerID()
	local INX={ 	116703, 116704, 116705, 116706, 116707,
			 116708, 116709, 116710, 116711, 116712
			}
	local RNX={}
	local BOX={}
	local NPC={}
	local AMT=1
	local NUM=1
	local DIS=50
	local X, Y, Z
	while 1 do
		if AMT>=11 then break
		else	NUM=Rand(table.getn(INX))+1
			table.insert( RNX, AMT, INX[NUM] )
			table.remove( INX, NUM )
			AMT=AMT+1
		end
	end
	for i=1, 10, 1 do
		BOX[i]=Lua_CreateObjByDir( PID, 110987, DIS, 0 )
		NPC[i]=Lua_CreateObjByDir( PID, RNX[i], DIS, 0 )
		AddToPartition( BOX[i], 0 )
		AddToPartition( NPC[i], 0 )
		SetModeEx( BOX[i], EM_SetModeType_Obstruct, true )
		MoveToFlagEnabled( NPC[i], false )
		X=ReadRoleValue( NPC[i], EM_RoleValue_X )
		Y=ReadRoleValue( NPC[i], EM_RoleValue_Y )
		Z=ReadRoleValue( NPC[i], EM_RoleValue_Z )
		Move( NPC[i], X, Y+15, Z )
		PlayMotionEX( NPC[i], ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN, ruFUSION_ACTORSTATE_SIT_CHAIR_LOOP )
		SetModeEx( NPC[i], EM_SetModeType_Gravity, true )
		DIS=DIS+50
	end
end
----------------------------------------------------------------------------------------------------
Function Z24_William107493_00()
	local Controller=OwnerID()
	local PlayerID={}
	PlayerID=SearchRangePlayer ( Controller, 600 )
	for i= 1, table.getn(PlayerID) do
		Say( PlayerID[i], "[SC_Z24WMWARNING_00]" )
		ScriptMessage( Controller, PlayerID[i], 2, "[Z24_WORLDMONSTERWARNING_00]", 0 )
	end
	Sleep(20)
	Sleep(40)
	PlayerID=SearchRangePlayer ( Controller, 600 )
	for j= 1, table.getn(PlayerID) do
		Say( PlayerID[j], "[SC_Z24WMWARNING_01]" )
		ScriptMessage( Controller, PlayerID[j], 2, "[Z24_WORLDMONSTERWARNING_01]", 0 )
	end
	Sleep(60)
	PlayerID=SearchRangePlayer ( Controller, 600 )
	for k= 1, table.getn(PlayerID) do
		ScriptMessage( Controller, PlayerID[k], 2, "[Z24_WORLDMONSTERWARNING_02]", 0 )
		Say( PlayerID[k], "[SC_Z24WMWARNING_02]" )
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_CREATENPC121977_00()
	local NPC=OwnerID()
	local BOX={}
	local DIS=142
	for i=1, 5, 1 do
		BOX[i]=Lua_CreateObjByDir( NPC, 121977, DIS, 0 )
		AddToPartition( BOX[i], 0 )
		DIS=DIS+142
	end
End
----------------------------------------------------------------------------------------------------
Function Z25_CREATENPC121977_99()
	CastSpell( OwnerID(), OwnerID(), 850236 ) 
End
----------------------------------------------------------------------------------------------------
