function LuaS_z22_114965_Talk()
	local Player = OwnerID();
	local NPC = TargetID();
	if CheckFlag( Player, 545798 )~=true and  (CheckAcceptQuest(Player,424824)==true or
	CheckAcceptQuest(Player,424825)==true  or 
	CheckAcceptQuest(Player,424826)==true ) then
		if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
			SetSpeakDetail(Player , "[SC_423575_1]");
			AddSpeakOption( Player, NPC, "[SC_422974_0]", "LuaS_z22_114965_Triger",0 );--�ڷǳƦn�F
		else
			SetSpeakDetail( Player, "[SC_Z22_Q424824_MSG01]" );--�ثe�S���ݭn�@�e���w�̡A�A�����A�ӧa�C
		end
		return
	end
	LoadQuestOption(Player);
end

function LuaS_z22_114965_Triger()
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
		WriteRoleValue(NPC,EM_RoleValue_Register10,1);
		CallPlot(NPC,"Lua_z22_q424824_Show",NPC,Player );
	end
	CloseSpeak(Player);
end

function Lua_z22_q424824_Show( NpcA ,Player )
	local FlagID = 781042;
	local RoomID = ReadRoleValue(NpcA, EM_RoleValue_RoomID);
	--���ͼ@��������,�@���N���|���b�쥻��NPC���W
	local NpcB=OwnerID();
	if ReadRoleValue( NpcB , EM_RoleValue_OrgID )~=119649 then
		local NpcB = kg_GetPosRX( {FlagID,0} , 119649 );
		kg_ActorInit(NpcB);
		SetModeEx( NpcB , EM_SetModeType_Revive, false )	--����
		DisableQuest( NpcB ,true );
		WriteRoleValue( NpcB , EM_RoleValue_Register1 , NpcA );
		--WriteRoleValue( NpcB , EM_RoleValue_Register2 , 0 );--�����`�����}��
		AddToPartition( NpcB , RoomID );
		CallPlot(NpcB,"Lua_z22_q424824_Show",NpcA,Player );
		return
	end
	
	--���즺�`�@��
	if Lua_z22_q424824_DeadEvent==nil then
		Lua_z22_q424824_DeadEvent = function()
			local Oid = OwnerID();
			if ReadRoleValue(Oid , EM_RoleValue_OrgID)==106437  then
				if ReadRoleValue( Oid , EM_RoleValue_Register4 )==0 then
					WriteRoleValue( Oid , EM_RoleValue_Register4 , 1 );
					SetModeEx( Oid , EM_SetModeType_Fight, false);
					AddBuff( Oid , 501620 , 0 ,-1 );--�W��
					AttachObj( ReadRoleValue(Oid , EM_RoleValue_Register1) , Oid, 2,  "" , "" );--������A��y���|�U���A���L���W�W��
				end
				return false
			end
		end
	end
	
	--�Ыغt��
	local Actors={};
	Actors[1]=kg_GetPosRX( NpcB , 106437, 30 , 0,180 , -3 );
	MoveToFlagEnabled( Actors[1], false );
	SetModeEx( Actors[1] , EM_SetModeType_Strikback, false);
	SetModeEx( Actors[1] , EM_SetModeType_Searchenemy, false);
	Actors[2]=kg_GetPosRX( NpcB , 119659, 50 , 0,180  , -3);
	kg_ActorInit( Actors[2] );
	DisableQuest( Actors[2] ,true );
	WriteRoleValue( Actors[1] , EM_RoleValue_Register1 , Actors[2] );
	for i =1,2 do
		SetModeEx( Actors[i] , EM_SetModeType_Revive, false )	--����
		WriteRoleValue( Actors[i] ,EM_RoleValue_IsWalk ,1);
		AddToPartition( Actors[i] , RoomID );
	end
	SetPlot( Actors[1] , "dead" , "Lua_z22_q424824_DeadEvent" , 30 );
	AddBuff( Actors[1] , 501620 , -20 ,-1 );--�W��
	AttachObj( Actors[2] , Actors[1], 2,  "" , "" );
	
	--�إ�function
	local Lua_q424824_CheckCombat = function( HorseDriver , MonsterTeam )--�ˬd�԰���
		if ReadRoleValue( HorseDriver , EM_RoleValue_Register4 )==1 then
			return 1
		end
		local MonDeadCount = 0;
		for i , monGid in ipairs(MonsterTeam) do
			if CheckID( monGid )~=true or ReadRoleValue( monGid ,EM_RoleValue_IsDead )==1  then
				MonDeadCount = MonDeadCount+1;
			end
		end
		if MonDeadCount== #MonsterTeam then
			return 2
		end
		return 0--�԰���
	end
	local Lua_q424824_CheckPlayerError = function( Player , NpcB )--�ˬd���a���A
		if CheckID(Player)~=true or ReadRoleValue(Player , EM_RoleValue_IsDead)==1 or
		CheckFlag( Player, 545798 ) == true or --�ˬd���L���n���~
		 ( CheckAcceptQuest( Player , 424824 ) ~= true and CheckAcceptQuest( Player , 424825 ) ~= true and CheckAcceptQuest( Player , 424826 )~= true )==true or
		CheckDistance( Player, NpcB, 200 ) ~= true then --�ˬd�O�_�W�L�ˬd�d��
			return true
		end
		return false
	end
	
	local Lua_q424824_QuestEnd = function( GoodEnd , Player , NpcA , NpcB , Actors , MonsterTeam )
		if GoodEnd then
			NPCSay( NpcB , "[SC_Z22_Q424824_07]");--��o�����ӴN�w���F�A���§A�A�_�I�̡C
			SetFlag( Player ,  545798 , 1 );
		end
		WriteRoleValue( NpcA , EM_RoleValue_Register10 , 0 );
		Sleep(10);
		for i in pairs( MonsterTeam ) do
			if CheckID( MonsterTeam[i] )==true and ReadRoleValue( MonsterTeam[i],EM_RoleValue_IsDead )==0 then
				DelObj(MonsterTeam[i]);
			end
		end
		for i=1,2 do
			DelObj( Actors[i] );
		end
		Sleep(1);
		DelObj( NpcB );
	end
	local RandomSpeak = function()
		local Speak;
		if RandRange(0,100)>50 then
			Speak = "[SC_Z22_Q424824_02]";
		else
			Speak = "[SC_Z22_Q424824_03]";
		end
		return Speak;
	end
	
	--�إ߸��
	local MonsterID = { 106512, 106513, 106514 }; --�T�i�Ǫ���OrgID  -- 2011. 10. 21 ���ʲ�-�̨ηs�W ���T�Ǫ�ID
	MonsterID = KS_RegroupArray(MonsterID);--�@�}�l�N�M�w�H���X�{����
	local MonsterTeam = {};
	local SpeakSleepTime , MoveSleepTime , CombatSleepTime = 50 , 15 , 10 ;
	local x,y,z;
	
	local AI_info={	{ mode="say" , string="[SC_Z22_Q424824_01]"  },
			{ mode="say" , string=RandomSpeak() },
			{ mode="combat" , monid=MonsterID[1]  },
			{ mode="say" , string="[SC_Z22_Q424824_05]" },
			{ mode="combat" , monid=MonsterID[2] },
			{ mode="say" , string="[SC_Z22_Q424824_06]"  },
			{ mode="combat" , monid=MonsterID[3] }
			};
			
	--�}�l�@����t
	--say : ����>������w�I>�i�J�U�@�B
	--combat : �i�J�԰��j��>������w�I>�i�J�U�@�B
	for Step =1,#AI_info do
		if AI_info[Step].mode=="say" then	--����
			NPCSay( NpcB , AI_info[Step].string );
			Sleep(SpeakSleepTime);
		else--�԰��Ҧ�
			SetModeEx( NpcB , EM_SetModeType_Fight, true);
			NPCSay( NpcB , "[SC_Z22_Q424824_04]" );--�n��������F��a��ڭ̤F�I
			local M_id;
			for i =1,3 do
				M_id = kg_GetPosRX( NpcB , AI_info[Step].monid , RandRange(10,100),-5 ,RandRange(0,360) );
				MonsterTeam[i]=M_id;
				MoveToFlagEnabled( M_id , false );
				SetModeEx( M_id , EM_SetModeType_Revive, false );
				AddToPartition( M_id , RoomID );
				DebugMsg( 0,0,"monid="..M_id );
				SetAttack( M_id , Actors[1] );
			end
			Sleep(20);
			AddBuff( NpcB , 506895 , 0, 600 );  -- ����buff
			PlayMotion( NpcB , ruFUSION_ACTORSTATE_EMOTE_CRY );
			NPCSay( NpcB , "[SC_Z22_Q424824_12]" );--���}�I���n�a��ڡI
			local Situation=0;
			local CombatTimer = 0;
			while 1 do
				if  Lua_q424824_CheckPlayerError(Player , NpcB)==true then
					NPCSay( NpcB , "[SC_Z22_Q424824_08]" );-- �x�B�H��򤣨��F�H�o�ئa���b�ӦM�I�A�ڭn���{�F�I
					Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
					return
				end
				Situation = Lua_q424824_CheckCombat( Actors[1] , MonsterTeam );
				if Situation==1 then--�@�å���
					NPCSay( NpcB , "[SC_Z22_Q424824_09]" );--�]�\�ڭ̻ݭn�@�ӧ��¾���O�ߡK�C
					Sleep(10);
					Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
					return
				elseif Situation==2 then--�Ǫ��Ҧ��`
					break
				end
				Sleep( CombatSleepTime );
				CombatTimer = CombatTimer+1;
				if CombatTimer%5==0 then NPCSay( Actors[1] , "[SC_Z22_Q424824_11]" ); end
				if CombatTimer%10==0 then
					PlayMotion( NpcB , ruFUSION_ACTORSTATE_EMOTE_CRY );
					NPCSay( NpcB , "[SC_Z22_Q424824_12]" );
				end
			end
			SetModeEx( NpcB , EM_SetModeType_Fight, false);
			CancelBuff( NpcB , 506895 );
			NPCSay( NpcB , "[SC_Z22_Q424824_10]" );--�S�ƤF�ܡH���ڭ��~��e�i�a�C
		end
		
		--���ʶ��q
		while 1 do
			if Lua_q424824_CheckPlayerError(Player , NpcB)==true then
				NPCSay( NpcB , "[SC_Z22_Q424824_08]" );-- �x�B�H��򤣨��F�H�o�ئa���b�ӦM�I�A�ڭn���{�F�I
				Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
				return
			end
			if kg_GetDis( NpcB ,FlagID, Step )<=25 then
				break
			end
			KS_Move( NpcB , 0 , FlagID , Step );
			Sleep( MoveSleepTime );
			x,y,z,_ = kg_GetPosRX( NpcB , nil , 20,0,180 );--NpcB���20�X
			KS_Move( Actors[1] , 0 , x,y,z );
		end
		DebugMsg( 0,0,"q424824 step"..Step.." End!!" );
	end
	Lua_q424824_QuestEnd( true ,  Player , NpcA , NpcB , Actors , MonsterTeam );
end