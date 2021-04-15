function LuaS_424391_accpeted()
	SetFlag ( TargetID() , 545180 , 1)
end

function LuaS_424392_completed()
	SetFlag ( TargetID() , 545179 , 1)
	GiveBodyItem ( TargetID() , 240019 , 1)
end

function LuaS_424394_accpeted()
	SetFlag ( TargetID() , 545181 , 1)
end

function LuaS_424393_completed()
	SetFlag ( TargetID() , 545431 , 1)
end

function LuaS_424394_help()
	local od = OwnerID()
	local td = TargetID()
	local Table = {	[118764] = {0, 118707 , 545429} ,			--{定點旗標、新人物、FLAGID、移動點旗標}
			[118765] = {3, 118708 , 545430} ,
			[118766] = {1, 118709, 545182, 2} ,
			[118767] = {4, 118711, 545183, 5} 	}
	local WichPerson = ReadRoleValue( td , EM_RoleValue_OrgID )
	local New
	local PartyMem

	if	ReadRoleValue( td , EM_RoleValue_Register1 ) == 1	then
		ScriptMessage ( od , od , 0 , "[SC_424394_3]" , 0 )	--似乎有別人嘗試救他出來，稍等一下
		ScriptMessage ( od , od , 1 , "[SC_424394_3]" , 0 )
		return
	else
		WriteRoleValue( td, EM_RoleValue_Register1, 1 )

		if	Table[WichPerson][4] ~= nil			and
			CheckAcceptQuest ( od , 424394 ) == TRUE	and
			CheckFlag ( od , 545181 ) == TRUE		then

			--DelObj (td)

			for i = 1, 6 do
			PartyMem = GetPartyID( od, i )
				if	CheckID( PartyMem )	then
					SetFlag (  PartyMem, Table[WichPerson][3] , 1 )	
				else	SetFlag (  od, Table[WichPerson][3] , 1 )	
				end
			end

			ScriptMessage( od , od , 1 , "[SC_424394_1][$SETVAR1=["..WichPerson.."]]" , 0 )		--你救出了"WichPerson"
			ScriptMessage( od , od , 0 , "[SC_424394_1][$SETVAR1=["..WichPerson.."]]" , 0 )

			New = Lua_DW_CreateObj( "flag" , Table[WichPerson][2] , 780960 , Table[WichPerson][1] , 1 , 1 )
			CallPlot(New, "LuaS_424394_esc", td, Table[WichPerson][4])

		elseif 	Table[WichPerson][4] == nil			and
			CheckAcceptQuest ( od , 424391 ) == TRUE	and
			CheckFlag (od , 545180 ) == TRUE		then


			for i = 1, 6 do
			PartyMem = GetPartyID( od, i )
				if	CheckID( PartyMem )	then
					SetFlag (  PartyMem, Table[WichPerson][3] , 1 )
				else	SetFlag (  od, Table[WichPerson][3] , 1 )	
				end
			end

			New = LuaFunc_SearchNPCbyOrgID( od , Table[WichPerson][2] , 400 )
			--DelObj (td)

			ScriptMessage( od , od , 1 , "[SC_424394_1][$SETVAR1=["..WichPerson.."]]" , 0 )		--你救出了"WichPerson"
			ScriptMessage( od , od , 0 , "[SC_424394_1][$SETVAR1=["..WichPerson.."]]" , 0 )
			say ( td , "[SC_424394_2]")
			WriteRoleValue( td, EM_RoleValue_Register1, 0 )
		end
		
		WriteRoleValue( td, EM_RoleValue_Register1, 0 )
	end
end

function LuaS_424394_esc( Oldone , FlagID )
	local	od = OwnerID()


	npcsay ( od , "[SC_424394_2]")							--種出來的人喊出得救了
	sleep(10)
	WriteRoleValue( od , EM_RoleValue_IsWalk , 0  )
	DW_MoveToFlag( od , 780960 , FlagID , 0 , 1 )
	WriteRoleValue( Oldone, EM_RoleValue_Register1, 0 )
	DelObj(od)
end