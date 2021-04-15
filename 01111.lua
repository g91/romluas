function LuaS_111325_0()
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID() , 203456 ) > 0 and CountBodyItem( OwnerID() , 203457 ) == 0 and CheckAcceptQuest( OwnerID() ,421603 ) == true then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_111325_0]","LuaS_111325_1",0) 
	end	
end

function LuaS_111325_1()
	CloseSpeak( OwnerID() )
	DisableQuest( TargetID() , true )
	BeginPlot( TargetID() , "LuaI_111826_2" , 0 )
end

function LuaI_111826_2()
	local Player = TargetID()
	local Flag = 780222

	local X = GetMoveFlagValue( Flag , 0 , EM_RoleValue_X )
	local Y = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Y )
	local Z = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Z )
	local Dir = GetMoveFlagValue( Flag , 0 , EM_RoleValue_Dir )
	local Obj = CreateObj(111787,X,Y,Z,Dir, 1)
	AddToPartition( Obj , 0 )
	SetPlot( Obj , "touch" , "LuaFunc_Obj_Nothing" , 50)
	SetModeEx( Obj , EM_SetModeType_Mark, false) 
	SetModeEx( Obj , EM_SetModeType_HideName, false) 
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead, false) 
	Sleep( 50 )
	local ZoA = CreateObjByFlag( 101385 , Flag , 1 , 1)
	local ZoB = CreateObjByFlag( 101385 , Flag , 2 , 1)
	AddToPartition( ZoA , 0 )
	AddToPartition( ZoB , 0 )
	
	Say( ZoA , "[SC_111325_1]" )
	Say( ZoB , "[SC_111325_2]" )

	SetAttack( ZoA , Player )
	SetAttack( ZoB , Player )
	BeginPlot( ZoA , "LuaI_111826_Sui" , 0 )
	BeginPlot( ZoB , "LuaI_111826_Sui" , 0 )

	while 1 do
		if CheckID( ZoA ) == false and CheckID( ZoB ) == false then
			break
		end
		if ReadRoleValue( ZoA , EM_RoleValue_OrgID ) ~= 101385 and ReadRoleValue( ZoB , EM_RoleValue_OrgID ) ~= 101385 then
			break
		end
		sleep( 60 )
	end

	DelObj( Obj )
	DisableQuest( OwnerID() , false )

end

function LuaI_111826_Sui()
	LuaFunc_Obj_Suicide(150)
end