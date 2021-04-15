function Cl_Zone26_suggwittet_Ray()
	local Ray = OwnerID()
	local RoomID = ReadRoleValue( Ray , EM_RoleValue_RoomID )
	Lua_Cl_Zone26_suggwitte_Ray_1 = Lua_Cl_Zone26_suggwitte_Ray_1 or {}
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID] = Lua_Cl_Zone26_suggwitte_Ray_1[RoomID] or {}
	local Beetle = CreateObjByFlag( 107071 , 781112 , 1 , 1 )  ------------�ͥX�]�N�U
	SetModeEx( Beetle , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Beetle , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( Beetle , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( Beetle , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( Beetle , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( Beetle , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��  
	AddToPartition( Beetle , RoomID )
	local Mushroom = CreateObjByFlag( 107071 , 781112 , 1 , 1 )  ------------�ͥX�]�N�U
	SetModeEx( Mushroom , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Mushroom , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( Mushroom , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( Mushroom , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( Mushroom , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( Mushroom , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��  
	AddToPartition( Mushroom , RoomID )
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Beetle"] = Beetle ---����GUID
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Mushroom"] = Mushroom ---Ĩۣ�HGUID
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Ray"] = Ray ---���xGUID
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] = 0  ---�зǮɶ�
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"] = 0 ---�R���ɶ�
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] = BeetleDis  ---�Z�����Ȧs
	Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Player"] = 0  ---�Z�����Ȧs
	local BeetleDis = GetDistance( Ray , Beetle )
	AttachObj( Mushroom , Beetle , 1 , "p_down" , "p_down"  )
	CallPlot( Beetle , "Cl_Zone26_suggwittet_Move" , RoomID )
	CallPlot( Ray , "Cl_Zone26_suggwitte_Dir" , RoomID )
	CallPlot( Ray , "Cl_Zone26_suggwittet_Time" , RoomID )
	while 1 do
		sleep ( 5 )
		cl_chack_CastSpell()
		CastSpelllv ( Ray , Mushroom , 499447 , 0 )
	end
end
function Cl_Zone26_suggwittet_Time(RoomID)
	local OwnerID = OwnerID()
	while 1 do
		sleep ( 2 )
		if Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"] == Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] then ---�зǮɶ�
			local Owner_X, Owner_Y , Owner_Z = kg_GetPosRX( OwnerID  , nil , Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] )
			DetachObj( Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Mushroom"] )
			SetPos( Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Mushroom"] , Owner_X , Owner_Y , Owner_Z , 0 )
			CallPlot( Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Player"] , "Cl_Zone26_Player_Reflex" , Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] )
			DebugMsg( 0 , 0 , "Time="..Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] )
		end
		Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] = Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] + 1  ---�зǮɶ�
	end
end
function Cl_Zone26_Player_Reflex(Playdis)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local Owner_X, Owner_Y , Owner_Z = kg_GetPosRX( OwnerID  , nil , Playdis )
	local Reflex_Hit = CreateObj( 107071 , Owner_X, Owner_Y , Owner_Z , 0 , 1 )
	SetModeEx( Reflex_Hit , EM_SetModeType_Strikback, false) ---����(�_)
	SetModeEx( Reflex_Hit , EM_SetModeType_Searchenemy, false)--����(�_)
	SetModeEx( Reflex_Hit , EM_SetModeType_Mark, false)			---�i�I��(�O)
	SetModeEx( Reflex_Hit , EM_SetModeType_ShowRoleHead, false) 		---�Y����(�O)
	SetModeEx( Reflex_Hit , EM_SetModeType_Fight, false) ---�i���(�O)
	SetModeEx( Reflex_Hit , EM_SetModeType_NotShowHPMP , false ) ----����ܼg��  
	AddToPartition( Reflex_Hit , RoomID )
	sysCastSpelllv ( OwnerID , Reflex_Hit , 499450 , 0 )
end
function Cl_Zone26_suggwittet_ChBuff()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local Mushroom = Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Mushroom"]
	local PlayDis = GetDistance( OwnerID , TargetID )
	if ReadRoleValue( TargetID , EM_RoleValue_IsPlayer ) == 1 then
		if CheckBuff ( TargetID , 622860 ) == true then
			if Cl_Zone26_suggwittet_CheckDir( TargetID , OwnerID ) == true then
				if Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"] == Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] then ---�зǮɶ�
					say ( TargetID , "PlayDis"..PlayDis )
					if PlayDis <= Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] then
						say ( TargetID , "22222"..PlayDis )
						Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] = PlayDis
					end
					say ( TargetID , "33333"..PlayDis )
				else
					say ( TargetID , "Time~=HitTime===HitTime>"..Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"].."_"..Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] )
					Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"] = Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"]
					Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Player"] = TargetID
					Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] = PlayDis
				end
				return false
			end
		else
			if PlayDis > Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] then
				return false
			else
				return true
			end
		end
	else
		if TargetID == Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Beetle"] then
			if Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["HitTime"] ~= Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Time"] then
				Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Dis"] = GetDistance( OwnerID , TargetID )
				AttachObj( Mushroom , Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Beetle"] , 1 , "p_down" , "p_down"  )
				return false
			end
			return false
		end
		return false
	end
end
function Cl_Zone26_suggwittet_CheckDir( TargetID , OwnerID )
	local Dir = KS_FrontOrBack( TargetID , OwnerID )
	if Dir >= 0 then
		return true
	elseif Dir < 0 then
		return false
	end
end
function Cl_Zone26_suggwittet_Move(RoomID)
	local OwnerID = OwnerID()
	local Flag_1_X = GetMoveFlagValue( 781112 , 1 , EM_RoleValue_X ) 
	local Flag_1_Y = GetMoveFlagValue( 781112 , 1 , EM_RoleValue_Y )  
	local Flag_1_Z = GetMoveFlagValue( 781112 , 1 , EM_RoleValue_Z )  
	local Flag_2_X = GetMoveFlagValue( 781112 , 2 , EM_RoleValue_X )  
	local Flag_2_Y = GetMoveFlagValue( 781112 , 2 , EM_RoleValue_Y )  
	local Flag_2_Z = GetMoveFlagValue( 781112 , 2 , EM_RoleValue_Z )  
	while 1 do
		sleep ( 10 )
		LuaFunc_WaitMoveTo ( OwnerID, Flag_1_X , Flag_1_Y , Flag_1_Z )
		sleep ( 10 ) 
		LuaFunc_WaitMoveTo ( OwnerID, Flag_2_X , Flag_2_Y , Flag_2_Z )
	end
end
function Cl_Zone26_suggwitte_Dir(RoomID)
	local OwnerID =OwnerID()
	local Beetle = Lua_Cl_Zone26_suggwitte_Ray_1[RoomID]["Beetle"]---����GUID
	while 1 do
		sleep ( 2 )
		AdjustFaceDir( OwnerID, Beetle , 0 )
		sysCastSpelllv ( OwnerID , Beetle , 499448 , 0 )
	end
end

function Cl_Test_Buff()
	local OwnerID = OwnerID()
	local Hate_X,Hate_Y,Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	Addbuff (  OwnerID , 622957 , 0 , -1 )
	sleep ( 5 )
	SetPosByFlag( OwnerID , 781112 , 10 )
	sleep ( 30 )
	SetPos( OwnerID , Hate_X , Hate_Y , Hate_Z , 0 )
	sleep ( 5 )
	CancelBuff_NoEvent( OwnerID , 622957 ) ---�M��BUFF
end