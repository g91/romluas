function LuaS_TEST_SUEZ_0()
--	local AA = GetString("SO_110409_1") 
--	local BB = SO_110409_1
--	SetSpeakDetail(OwnerID() , "[SC_111454_4_25]")
--	AddSpeakOption( OwnerID(), TargetID(), AA.."MSG" , "LuaS_TEST_SUEZ_1",0 )
--	AddSpeakOption( OwnerID(), TargetID(), AA.."THING" , "LuaS_TEST_SUEZ_3",0 )
--	AddSpeakOption( OwnerID(), TargetID(), AA.."DIALOG" , "LuaS_TEST_SUEZ_4",0 )
	local Check = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
	local State = ReadRoleValue( TargetID() , EM_RoleValue_Register )
	local Limit = ReadRoleValue( TargetID() , EM_RoleValue_Register+1 )
	if State == 1 then
		SetSpeakDetail( OwnerID(), "Now , State 1 , Monster:"..Check.."/"..Limit )
	elseif State == 2 then
		SetSpeakDetail( OwnerID(), "Now , State 2 , Elite:"..Check.."/"..Limit )
	elseif State == 3 then
		SetSpeakDetail( OwnerID(), "Now , State 3 , Boss:"..Check.."/"..Limit )
	else
		SetSpeakDetail( OwnerID(), "Rest Time" )
	end
	
end

function LuaS_TEST_SUEZ_1()
	CloseSpeak( OwnerID() );
	BeginPlot( OwnerID() , "LuaS_TEST_SUEZ_2" , 0 )
end

function LuaI_Suez_Test()
	SetPlot( OwnerID() ,"touch" , "LuaS_TEST_SUEZ_2" , 50 )
end

function LuaS_TEST_SUEZ_2()
	local AA = GetString("SO_110409_1") 
	local BB = SO_110409_1
	local Str = "[SC_101433_1][$SETVAR1="..GetName(OwnerID() ).."]" 
	Say( OwnerID() , str )
	Tell( OwnerID() , OwnerID() , AA )
	RunningMsg( OwnerID() , 0 , AA)
	ScriptMessage( OwnerID(),  OwnerID() , 1 , AA , 0 ); 
	ScriptMessage( OwnerID(),  OwnerID() , 0 , AA , 0 ); 
end
function LuaS_TEST_SUEZ_3()
	CloseSpeak( OwnerID() );
	GiveBodyItem( OwnerID() , 200936 , 1 )

end
function LuaS_TEST_SUEZ_4()
	CloseSpeak( OwnerID() );
	BeginPlot( OwnerID() , "LuaS_TEST_SUEZ_5" , 0 )
end
function LuaS_TEST_SUEZ_5()
	local AA = GetString("SO_110409_1") 
	local BB = SO_110409_1
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , AA);
	DialogSelectStr( OwnerID() , GetString("SO_YES") );
	DialogSelectStr( OwnerID() , GetString("SO_NO") );
	DialogSetContent( OwnerID() , ASuezA );
	DialogSetTitle( OwnerID() , AA );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	
		--資料送出有問題
		return 0
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	if SelectID == 0  then
		DialogClose( OwnerID() )
		BeginPlot( OwnerID() , "LuaS_TEST_SUEZ_6" , 0 )

	elseif SelectID == 1  then
		DialogClose( OwnerID() )
	else 
		DialogClose( OwnerID() )
	end
end
function LuaS_TEST_SUEZ_6()
	local AA = GetString("SO_110409_1") 
	local BB = SO_110409_1
	if BeginCastBar( OwnerID() , AA , 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 ) ~= 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0,GetString("SAY_NPC_BUSY"), 0 );
		return
	end
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar(OwnerID());
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- 成功
				result = true
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- 失敗
				result = false
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
end

function LuaFunc_SUEZ_TEST()
	AddBuff( OwnerID() , 503443 , 1 , 500 )
end

function LuaFunc_SUEZ_TEST1()
	SetPlot(OwnerID() , "touch" , "LuaFunc_SUEZ_TEST2" , 50 )
end

function LuaFunc_SUEZ_TEST2()
	SetPlot(TargetID() , "touch" , "" , 0 )
	SetFollow( TargetID() , OwnerID() )
	local Girl = LuaFunc_CreateObjByObj( 110009 , TargetID() )
	AttachObj( Girl , TargetID()  ,0 , "p_hit_point02" , "p_hit_point01" )
	SetPlot( Girl , "touch" , "LuaFunc_SUEZ_TEST3" , 50 )
	WriteRoleValue( Girl , EM_RoleValue_PID , TargetID() )
	Say( TargetID() , "Let's Go " )
end
function LuaFunc_SUEZ_TEST3()
	local Girl = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	Say( TargetID() , "Bye" )
	DetachObj( TargetID() )
	SetPlot(Girl  , "touch" , "LuaFunc_SUEZ_TEST2" , 50 )
	SetPlot(TargetID()   , "touch" , "" , 0 )
	BeginPlot( TargetID() , "LuaFunc_SUEZ_TEST4" , 0 )
end

function LuaFunc_SUEZ_TEST4()
	sleep( 50 )
	Delobj( OwnerID() )
end

function Lua_Test_Suez(Mob)
	local Tester = Lua_CreateObjByDir( OwnerID() , Mob , 10)
	local Speed = GameObjInfo_int( Mob , "MoveSpeed" )
	AddToPartition( Tester , 0 ) 
	MoveToflagEnabled( Tester , false )
	WriteRoleValue( Tester , EM_RoleValue_IsWalk , 1 )
	yell(  Tester   ,  " Speed Rate :"..Speed.." Type: Walk" , 3 )
	BeginPlot( Tester , "Lua_Test_Suez3" , 0 )
end

function Lua_Test_Suez2(Mob)
	local Tester = Lua_CreateObjByDir( OwnerID() , Mob , 10) 
	local Speed = GameObjInfo_int( Mob , "MoveSpeed" )
	AddToPartition( Tester , 0 ) 
	MoveToflagEnabled( Tester , false )
	WriteRoleValue( Tester , EM_RoleValue_IsWalk , 0 )
	yell(  Tester   ,  " Speed Rate :"..Speed.." Type: Run" , 3 )
	BeginPlot( Tester , "Lua_Test_Suez3" , 0 )
end

function Lua_Test_Suez3()
	local Me = Role:new(  OwnerID()  )
	local Dis
	sleep( 30 )
	local Time = MoveDirect( OwnerID() , Me:X()+150, Me:Y(), Me:Z())
	sleep(10)
	local X , Y , Z = Me:X() , Me:Y() , Me:Z()
	sleep(10)
	Dis = (( X-Me:X() )^2 + ( Y-Me:Y() )^2 +( Z-Me:Z() )^2 )^0.5
	yell(  OwnerID()  ,  " 1 Distance :"..Dis, 3 )
	sleep(10)
	Dis = (( X-Me:X() )^2 + ( Y-Me:Y() )^2 +( Z-Me:Z() )^2 )^0.5
	yell(  OwnerID()  ,  " 2 Distance :"..Dis, 3 )
	sleep(10)
	Dis = (( X-Me:X() )^2 + ( Y-Me:Y() )^2 +( Z-Me:Z() )^2 )^0.5
	yell(  OwnerID()  ,  " 3 Distance :"..Dis, 3 )
	sleep(10)
	Dis = (( X-Me:X() )^2 + ( Y-Me:Y() )^2 +( Z-Me:Z() )^2 )^0.5
	yell(  OwnerID()  ,  " 4 Distance :"..Dis, 3 )
	sleep(10)
	Dis = (( X-Me:X() )^2 + ( Y-Me:Y() )^2 +( Z-Me:Z() )^2 )^0.5
	yell(  OwnerID()  ,  " 5 Distance :"..Dis, 3 )
	yell(  OwnerID()  ,  " Time :"..Time , 3 )
	sleep( 20 )
	delobj( OwnerID() )
end

function Lua_Test_Suez4()
--	WriteRoleValue( OwnerID() , EM_RoleValue_LV , 200)
	local Obj = Role:new( OwnerID() )
	local Count = 0
	while 1 do
		if Count < 100 then
			local Monster = CreateObj( 102498 , Obj:X() + Rand(300)-150, Obj:Y() , Obj:Z()+Rand(300)-150 , Obj:Dir() , 1 )
			SetModeEX( Monster , EM_SetModeType_Revive, true)
			SetModeEX( Monster , EM_SetModeType_Searchenemy , false)
			SetModeEX( Monster , EM_SetModeType_Strikback , false)
			AddToPartition( Monster , 0 )
			WriteRoleValue( Monster , EM_RoleValue_Register , OwnerID() )
			BeginPlot( Monster , "Lua_Test_Suez5" , 0)
			Count = Count + 1
		end
		SysCastSpellLv(OwnerID(),OwnerID(),490512,499)  
		sleep( 10 )
	end

end
function Lua_Test_Suez5()
--	local Owner = createobjbyobj( 110001,OwnerID() )
	local Owner = OwnerID() 
	sleep( 10 )
--	G_FA_423800_Hun["B"][3] = 0
--	LuaFA_423800_CheckPC(2)
--	if G_FA_423800_Hun["B"][3] == 0 then
		-- DebugMsg(0,0,"Nobody")
		FA_MoveToPathStop(Owner)
		FA_LookAround(Owner,0,5,1,5)	-- 左顧右盼
		Say(Owner,"[SC_423800_A05]")	-- 轉個身人都跑光了是哪招
--	end
	-- DebugMsg(0,0,"Out_CheckLoop")
end