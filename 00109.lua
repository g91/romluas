
g_NPC_110346_SpeakHistory 	= {};
g_NPC_110346_Turnback		= false;

function Lua_Patrol_110346_P0()	-- �Ĥ@���I���
	
	MoveToFlagEnabled ( OwnerID(), false );

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_BEGIN );

	Sleep( 50 );

	Say( OwnerID(), "�u�֤H, �n�˨�ƻ�ɭ�" );
	
	sleep( 50 );

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_END );	

	sleep( 50 );

	MoveToFlagEnabled ( OwnerID(), true );

end

function Lua_Patrol_110346_P1()	-- �ĤG���I��ò
	
	MoveToFlagEnabled ( OwnerID(), false );

		Say( OwnerID(), "�Τ@�U�n�F" );	

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_BEGIN );

		Sleep( 50 );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_SLEEP_END );

		Sleep( 50 );

		if( g_NPC_110346_Turnback == true ) then

			MoveToPathPoint( OwnerID(), 0 );	-- ���ʦ^���
			g_NPC_110346_Turnback = false;
		end

		sleep( 30 );

	MoveToFlagEnabled ( OwnerID(), true );



end

function Lua_Patrol_110346_P2()	-- �ĤT���I����
	
	MoveToFlagEnabled ( OwnerID(), false );

		Say( OwnerID(), "�y..." );
		
		Sleep( 20 );

		Say( OwnerID(), "�S�n�}�l�u�@�F..." );

		Sleep( 20 );

		Say( OwnerID(), "�A�o�ǽⰨ, ���n��!!" );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN );

		Sleep( 50 );

		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END );	

		Sleep( 50 );

		MoveToPathPoint( OwnerID(), 1 );	-- ���ʨ�

		g_NPC_110346_Turnback = true;		-- �]�w�ܼ�, �^�Y�F

		

	MoveToFlagEnabled ( OwnerID(), true );

end
	