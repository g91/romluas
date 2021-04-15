function LuaS_110196_0()

	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest(OwnerID(),420043) == true and CountBodyItem(OwnerID(),200037) == 0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110196_1" ), "LuaS_110196_1", 0 ) --/*我準備好了，再來一次！
	end

end
----------------------------------------------------------------------------------------------------------------------------
function LuaS_110196_1()

	CloseSpeak( OwnerID() );	--關閉對話視窗
	BeginPlot( TargetID() , "LuaQ_420043_Accept" , 0 )
end
----------------------------------------------------------------------
function LuaQ_420043_Accept() --躺下的動作
	
	DisableQuest(OwnerID(), true)
--	SetPlot( OwnerID(),"touch","LuaFunc_Obj_BUSY",40 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SIT_END )
	sleep(30)	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SLEEP_BEGIN )	
	local NightMare
	sleep(30)
--	CastSpell( OwnerID(),OwnerID(),490100) 
	sleep(5)
	NightMare = LuaFunc_CreateObjByObj ( 100076 , OwnerID() )
	BeginPlot(NightMare,"LuaQ_420043_Sui",0)
	SetAttack( Nightmare , TargetID() )
	sleep(5)
	sleep(10)
	while 1 do
		if CheckID(Nightmare) == false then
			CancelBuff( OwnerID() ,500899 );
			sleep(5)
			PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_SLEEP_END )
			sleep(30)	
			PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_SIT_BEGIN,ruFUSION_ACTORSTATE_SIT_LOOP)
			sleep(30)
			DisableQuest(OwnerID(), false)
			break
		else 
			Say(OwnerID(),GetString("SAY_110196_0")) --/*Zzz....
		end
		sleep( 30 )
	end
end	
----------------------------------------------------------------------
function LuaQ_420043_Sui() 
	LuaFunc_Obj_Suicide(300)
end	
