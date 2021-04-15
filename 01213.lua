

function LuaS_101609_0()
	HoleOpen = false
	SetPlot( OwnerID() , "touch" , "LuaS_101609_1" , 50 )
end

function LuaS_101609_1()
	if	CanIOpenDoor == true	then
		SetPlot( TargetID() , "touch" , "" , 0 )
		BeginPlot( TargetID() , "LuaS_101609_2" , 0 )
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_101609_1]" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 2 , "[SC_101609_0]" , 0 )
	end
end

function LuaS_101609_2()

	local TrueDoor
	local Challenge_Time = 300

--¶}ªù
	local Door = SearchRangeNPC ( OwnerID() , 100 )
	for i = 0 , table.getn(Door) do

		if	ReadRoleValue(Door[i] , EM_RoleValue_OrgID ) == 112224	then
			Hide(Door[i])
			HoleOpen = true
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , Door[i] )
			break
		end

	end
--«Ø¤ý
	local Boss = CreateObjByFlag( 101609 , 780014 , 0 , 1 )
	AddToPartition( Boss , 0 )

	WriteRoleValue( Boss , EM_RoleValue_PID , OwnerID() )
	SetPlot( Boss , "dead" , "LuaS_101609_3" , 0 )	
	BeginPlot( Boss , "LuaS_101609_7" , 0 )
	
end


function LuaS_101609_3()
	BeginPlot( ReadRoleValue(OwnerID() , EM_RoleValue_PID) , "LuaS_101609_8" , 0 )
	return true
end


function LuaS_101609_4()
	CanIOpenDoor = true
end


function LuaS_101609_5()
	CanIOpenDoor = false
end

function LuaS_101609_6()
	sleep(10)
	SetPlot( OwnerID() , "touch" , "LuaS_101609_1" , 50 )
	HoleOpen = false
	Show( ReadRoleValue(OwnerID() , EM_RoleValue_PID ) , 0 )
end

function LuaS_101609_7()
	sleep(400)
	while true do
		sleep(80)
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID) == 0	and
			ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0	then

			BeginPlot( ReadRoleValue(OwnerID() , EM_RoleValue_PID) , "LuaS_101609_6" , 0 )
			DelObj( OwnerID() )

		end
	end
end


function LuaS_101609_8()
	sleep(18000)
	SetPlot( OwnerID() , "touch" , "LuaS_101609_1" , 50 )
	Show( ReadRoleValue(OwnerID() , EM_RoleValue_PID ) , 0 )
end

function LuaS_101609_9()
	local Sir
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i = 0 , table.getn(NPC) do
		if	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 111137	then
			Sir = i
			break
		end
	end
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Say( OwnerID() , "[SC_101609_2]" )
	sleep(20)
	Say( NPC[Sir] , "[SC_101609_3]" )
	sleep(10)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	sleep(10)
	Say( OwnerID() , "[SC_101609_4]")
end


function LuaS_101609_10()
	local Sir
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i = 0 , table.getn(NPC) do
		if	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 111137	then
			Sir = i
			break
		end
	end
	if	HoleOpen == true	then
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		Say ( OwnerID() , "[SC_101609_7]")
		sleep(10)
		Say ( NPC[Sir] , "[SC_101609_8]" )
		sleep(10)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		sleep(10)
		Say(OwnerID() , "[SC_101609_4]" )	
	else
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		Say ( OwnerID() , "[SC_101609_5]" )
		sleep(20)
		Say( NPC[Sir] , "[SC_101609_6]" )
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SALUTE )
		sleep(10)
		Say( OwnerID() , "[SC_101609_4]" )
	end
end






function LuaS_101614_0()
	
	local FiveItem = {202013 , 202014 ,202015 , 202016 , 202017 }

	for i = 1 , table.getn(FiveItem) do
		if	CountBodyItem( OwnerID() , FiveItem[i] ) < 1		then

			ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_101614_1]" , 0 )
			return false
		end
	end
	for i = 1 , table.getn(FiveItem) do
		DelBodyItem( OwnerID() , FiveItem[i] , 1 )
	end

	GiveBodyItem(OwnerID() , 202018 , 1 )
	return true
end


function LuaS_101614_1()
	local NPC = 	SearchRangeNPC ( OwnerID() , 200 )

	if	OnlyYou ~= 0	and
		OnlyYou ~= nil	then
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_101614_2]" , 0 )
		return false
	end

	for i = 0 , table.getn(NPC) do
		if	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 112281	then

			OnlyYou = 1
			
			local Boss = LuaFunc_CreateObjByObj ( 101614 , NPC[i] )
			AddToPartition( Boss , 0 )
			SetAttack( Boss , OwnerID() )
			Yell( Boss , "[SC_101614_4]" , 3 )
			SetPlot(Boss , "dead" , "LuaS_101614_3" , 0 )
			BeginPlot( Boss , "LuaS_101614_2" , 0 )

			return true

		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_101614_3]" , 0 )
	return false
end


function LuaS_101614_2()

	sleep(200)
	while true do
		sleep(40)
		if	ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID) == 0	and
			ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0	then
			OnlyYou = 0
			DelObj(OwnerID())
		end
	end
end

function LuaS_101614_3()
	OnlyYou = 0
	return true
end



function LuaS_101614_5()
	local NPC = SearchRangeNPC ( OwnerID() , 200 )

	if	OnlyYou ~= 0	and
		OnlyYou ~= nil	then
		ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_101614_2]" , 0 )
		return false
	end

	for i = 0 , table.getn(NPC) do
		if	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 112281	then
			return true
		end
	end
	ScriptMessage( OwnerID(), OwnerID(), 1 , "[SC_101614_3]" , 0 )
	return false

end