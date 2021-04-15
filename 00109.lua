
g_NPC_110346_SpeakHistory 	= {};
g_NPC_110346_Turnback		= false;

function Lua_Patrol_110346_P0()	-- 第一個點草堆
	
	MoveToFlagEnabled ( OwnerID(), false );

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_BEGIN );

	Sleep( 50 );

	Say( OwnerID(), "真累人, 要弄到甚麼時候" );
	
	sleep( 50 );

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_END );	

	sleep( 50 );

	MoveToFlagEnabled ( OwnerID(), true );

end

function Lua_Patrol_110346_P1()	-- 第二個點屋簷
	
	MoveToFlagEnabled ( OwnerID(), false );

		Say( OwnerID(), "睡一下好了" );	

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN );

		Sleep( 50 );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END );

		Sleep( 50 );

		if( g_NPC_110346_Turnback == true ) then

			MoveToPathPoint( OwnerID(), 0 );	-- 移動回草堆
			g_NPC_110346_Turnback = false;
		end

		sleep( 30 );

	MoveToFlagEnabled ( OwnerID(), true );



end

function Lua_Patrol_110346_P2()	-- 第三個點馬旁
	
	MoveToFlagEnabled ( OwnerID(), false );

		Say( OwnerID(), "咳..." );
		
		Sleep( 20 );

		Say( OwnerID(), "又要開始工作了..." );

		Sleep( 20 );

		Say( OwnerID(), "你這匹賤馬, 不要動!!" );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN );

		Sleep( 50 );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END );	

		Sleep( 50 );

		MoveToPathPoint( OwnerID(), 1 );	-- 移動到

		g_NPC_110346_Turnback = true;		-- 設定變數, 回頭了

		

	MoveToFlagEnabled ( OwnerID(), true );

end
	