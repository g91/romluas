function LuaI_Demo_Initial()
	SetPlot( OwnerID() , "touch" , "LuaI_Demo_Touch" , 40 )
end

function LuaI_Demo_Touch()
	SetPlot( TargetID() , "touch" , "" , 0 )
	BeginPlot( TargetID() , "LuaI_Demo_NPC_Create" , 0 )
end

function LuaI_Demo_NPC_Create()
	Hide( OwnerID() )
	local NPC = {}
	NPC[0] = CreateObjByFlag( 100317 , 780007 , 0 , 1 )
	NPC[1] = CreateObjByFlag( 100316 , 780007 , 1 , 1 )
	NPC[2] = CreateObjByFlag( 100316 , 780007 , 2 , 1 )
	NPC[3] = CreateObjByFlag( 100318 , 780007 , 3 , 1 )
	NPC[4] = CreateObjByFlag( 100319 , 780007 , 4 , 1 )
	NPC[5] = CreateObjByFlag( 100320 , 780007 , 5 , 1 )
	NPC[6] = CreateObjByFlag( 100321 , 780007 , 6 , 1 )
	NPC[7] = CreateObjByFlag( 100322 , 780007 , 7 , 1 )
	for i = 0 , 3 , 1 do
		AddToPartition( NPC[i] , 0 )
		SetRoleCamp( NPC[i] , "SNPC" )
	end
	sleep( 10 )
	Say( NPC[0] , "喔？就算逃到這個地方，你以為你能做什麼？" )
	for i = 0 , 3 , 1 do
		MoveToFlagEnabled( NPC[i] , false )
		WriteRoleValue( NPC[i] , EM_RoleValue_IsWalk , 1 )		
		WriteRoleValue( NPC[i] , EM_RoleValue_PID , i+8 )
		BeginPlot( NPC[i] , "LuaI_Demo_Battle" , 0 )
	end
	sleep(70)
	AddToPartition( NPC[4] , 0 )
	SetRoleCamp( NPC[4] , "SNPC" )	
	Say( NPC[4] , "辛苦你了，接下來就讓我們來對付他們吧！")
	sleep(10)
	Say( NPC[0] , "是誰！" )
	MoveToFlagEnabled( NPC[4] , false )
	WriteRoleValue( NPC[4] , EM_RoleValue_IsWalk , 1 )
	LuaFunc_MoveToFlag( NPC[4], 780007 , 12 ,0 )
--	sleep(20)
	Say( NPC[0] , "原來是你。" )
	sleep(10)
	PlayMotion( NPC[0] , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Say( NPC[0] , "正好！讓我們把之前的恩怨一次解決吧！" )
	for i = 5 , 7 , 1 do
		AddToPartition( NPC[i] , 0 )
		SetRoleCamp( NPC[i] , "SNPC" )
		MoveToFlagEnabled( NPC[i] , false )
		WriteRoleValue( NPC[i] , EM_RoleValue_IsWalk , 1 )		
		WriteRoleValue( NPC[i] , EM_RoleValue_PID , i+8 )
		BeginPlot( NPC[i] , "LuaI_Demo_Battle" , 0 )
	end
	sleep(50)
	PlayMotion( NPC[4] , ruFUSION_ACTORSTATE_EMOTE_ANGRY )
	Say( NPC[4] , "那就讓戰鼓響起吧！")	
	sleep(30)

	for i = 0 , 7 , 1 do
		MoveToFlagEnabled( NPC[i] , false )
		WriteRoleValue( NPC[i] , EM_RoleValue_IsWalk , 0 )
	end
	for i = 0 , 3 , 1 do
		SetRoleCamp( NPC[i] , "Monster" )
	end
	SetAttack( NPC[4] , NPC[0] )
	SetAttack( NPC[0] , NPC[4] )
	SetAttack( NPC[7] , NPC[3] )
	SetAttack( NPC[6] , NPC[3] )
	SetAttack( NPC[3] , NPC[4] )
	SetAttack( NPC[5] , NPC[1] )
	SetAttack( NPC[1] , NPC[5] )
	SetAttack( NPC[2] , NPC[5] )
	local check
	while 1 do
		check = 4
		for  i = 0 , 3 , 1 do
			if CheckID( NPC[i] ) == false then
				Check = Check - 1
			end
		end
		if Check < 1 then
			break
		end
		sleep( 30 )
	end
	for i = 4 , 7 , 1 do
		if CheckID( NPC[i] ) == true then
			Delobj( NPC[i] )
		end
	end
	SetPlot( OwnerID() , "touch" , "LuaI_Demo_Touch" , 40 )	
	Show(OwnerID(),0 )
end

function LuaI_Demo_Battle()
	local flag = ReadRoleValue( OwnerID() , EM_RoleValue_PID)
	LuaFunc_MoveToFlag( OwnerID(), 780007 , flag,0 )
end