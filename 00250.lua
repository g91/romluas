--凡克洛巡邏劇情

function LuaP_110064()
	local Ven = {}
	Ven[ 0 ] = Getstring("SAY_110064_1") 
	Ven[ 1 ] = Getstring("SAY_110064_2") 
	Ven[ 2 ] = Getstring("SAY_110064_3") 
	Ven[ 3 ] = Getstring("SAY_110064_4") 	

	for i=4 , 5 , 1 do
		Ven[ i ] = -1
	end

	local VenSay = Ven[ Rand(5) ];
	if VenSay ~= -1 then
		Say( OwnerID() , VenSay )
	end
End
-------------------------------------------------------------------------------------
--雷依

function LuaP_110074()
	--SetPlot( OwnerID() , "Touch","LuaFunc_Obj_BUSY",40)
	MoveToFlagEnabled( OwnerID(), false );
	local Mina = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110059 , 100 )
	local X = ReadRoleValue( OwnerID(), EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID(), EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID(), EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID(), EM_RoleValue_Dir )
	sleep( 30 )
	FaceObj(OwnerID(),Mina)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( OwnerID() ,GetString("SAY_110074_0") )
	sleep( 30 )
	PlayMotion( Mina,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )	
	sleep(30)
	PlayMotion( Mina,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Say( Mina,GetString( "SAY_110059_0"))
	--sleep(10)
	--WaitToMove( OwnerID() , X , Y , Z  )
	sleep( 30 )
	MoveToFlagEnabled( OwnerID(), true );
	--SetPlot( OwnerID() , "Touch","",40)

end
-------------------------------------------------------------------------------------------
-----------------------------警備隊(CAMP)------------------------------------------------------------
Function LuaI_GuardSpeak_A() --將此函式插入初始劇情即可
	SetPlot( OwnerID() , "Touch" , "LuaFunc_GuardSpeak_A", 40)
end

Function LuaFunc_GuardSpeak_A()

--	SetPlot( TargetID() , "Touch" , "LuaFunc_Obj_Nothing", 40)
	local Switch
	Switch = Rand( 11 )
	if Switch == 0 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_1")) 	
	elseif Switch == 1 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_2")) 
	elseif Switch == 2 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_3")) 
	elseif Switch == 3 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_4")) 
	elseif Switch == 4 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_5")) 
	elseif Switch == 5 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_6")) 
	else
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_COM")) 
	end
	sleep( 30 )
--	BeginPlot( TargetID() , "LuaI_GuardSpeak_A", 30)
end
-----------------------------警備隊(MOONSPRING)------------------------------------------------------------
Function LuaI_GuardSpeak_B() --將此函式插入初始劇情即可
	SetPlot( OwnerID() , "Touch" , "LuaFunc_GuardSpeak_B", 40)
end

Function LuaFunc_GuardSpeak_B()
--	SetPlot( TargetID() , "Touch" , "LuaFunc_Obj_Nothing", 40)
	local Switch
	Switch = Rand( 7 )
	if Switch == 0 then
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_COM")) 
	elseif Switch == 1 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_8")) 
	elseif Switch == 2 then
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_9")) 
	else
		Say( TargetID() , GetString("SAY_Z1GUARDSPEAK_7")) 	
	end
	sleep( 30 )
-- 	BeginPlot( TargetID() , "LuaI_GuardSpeak_B", 30)
end
-----------------------------警備隊(MOVE)------------------------------------------------------------
Function LuaI_GuardSpeak_C() --將此函式插入初始劇情即可
	SetPlot( OwnerID() , "Touch" , "LuaFunc_GuardSpeak_C", 40)
end

Function LuaFunc_GuardSpeak_C()

--	SetPlot( TargetID() , "Touch" , "LuaFunc_Obj_Nothing", 40)
	local Switch
	Switch = Rand( 7 )
	if Switch == 0 then
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_A")) 	
	elseif Switch == 1 then
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_B")) 
	elseif Switch == 2 then
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_C")) 
	else
		Say( TargetID() , GetString("SAY_VANGUARDSPEAK_COM")) 
	end
	sleep( 30 )
--	BeginPlot( TargetID() , "LuaI_GuardSpeak_C", 30)
end

-----------------------------------------------------------------------------------------------------------
--米拉亞
Function LuaP_110053_P1()

	MoveToFlagEnabled( OwnerID(), false );
--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_BUSY", 40); --NPC表演時鎖定
	
	local chicken =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 100190, 200);	
	sleep ( 30);
	
	--PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_WAVE );	--米拉亞揮手
	Say ( OwnerID(), "咕咕雞，吃飯飯囉！" );
	sleep(30);

	local number = 0
	while 1 do
		if chicken[number] == -1 then
			break
		end
		WriteRoleValue( chicken[number] , EM_RoleValue_IsWalk , 0 )
		FaceObj( chicken[number], OwnerID() );  	--雞面向米拉亞
		--say( chicken[number], "我來了" );
		number = number + 1
		sleep( rand(2)+1)
		WriteRoleValue( chicken[number] , EM_RoleValue_IsWalk , 1 )
	end

 	sleep ( 100);
	MoveToFlagEnabled( OwnerID(), true );
--	setplot( OwnerID(), "touch" , "", 40);	--解除鎖定
	sleep( 300)
	--PlayMotion( M, ruFUSION_ACTORSTATE_EMOTE_LAUGH );  米拉亞表演高興動作，目前無此動作
	--end

End
-------------------------------------------------------------------------------------------------------------------------------------
--戴爾巡邏劇情

function LuaP_110052()
	
	local Miraya = LuaFunc_SearchNPCbyOrgID( OwnerID() ,110053 ,300 )
	local Dale = Rand( 6 )
	if Dale == 1 then
		Say( OwnerID(), Getstring( "SAY_110052_1" ));
		sleep(20);
		Say( Miraya, GetString( "SAY_110053_1" ))

	elseif Dale == 2 then
		Say( OwnerID(), Getstring( "SAY_110052_2" ));
		sleep(20);
		Say( Miraya, GetString( "SAY_110053_2" ))

	elseif Dale == 3 then
		Say( OwnerID(), Getstring( "SAY_110052_3" ));
		sleep(20);
		Say( Miraya, GetString( "SAY_110053_3" ))

	end

End
------------------------------------------------------------------------------------------------------------------------------------