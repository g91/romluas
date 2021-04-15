function LuaS_z22_114965_Talk()
	local Player = OwnerID();
	local NPC = TargetID();
	if CheckFlag( Player, 545798 )~=true and  (CheckAcceptQuest(Player,424824)==true or
	CheckAcceptQuest(Player,424825)==true  or 
	CheckAcceptQuest(Player,424826)==true ) then
		if ReadRoleValue(NPC,EM_RoleValue_Register10)==0 then
			SetSpeakDetail(Player , "[SC_423575_1]");
			AddSpeakOption( Player, NPC, "[SC_422974_0]", "LuaS_z22_114965_Triger",0 );--我準備好了
		else
			SetSpeakDetail( Player, "[SC_Z22_Q424824_MSG01]" );--目前沒有需要護送的患者，你等等再來吧。
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
	--產生劇情中控器,劇情就不會掛在原本的NPC身上
	local NpcB=OwnerID();
	if ReadRoleValue( NpcB , EM_RoleValue_OrgID )~=119649 then
		local NpcB = kg_GetPosRX( {FlagID,0} , 119649 );
		kg_ActorInit(NpcB);
		SetModeEx( NpcB , EM_SetModeType_Revive, false )	--重生
		DisableQuest( NpcB ,true );
		WriteRoleValue( NpcB , EM_RoleValue_Register1 , NpcA );
		--WriteRoleValue( NpcB , EM_RoleValue_Register2 , 0 );--不正常結束開關
		AddToPartition( NpcB , RoomID );
		CallPlot(NpcB,"Lua_z22_q424824_Show",NpcA,Player );
		return
	end
	
	--全域死亡劇情
	if Lua_z22_q424824_DeadEvent==nil then
		Lua_z22_q424824_DeadEvent = function()
			local Oid = OwnerID();
			if ReadRoleValue(Oid , EM_RoleValue_OrgID)==106437  then
				if ReadRoleValue( Oid , EM_RoleValue_Register4 )==0 then
					WriteRoleValue( Oid , EM_RoleValue_Register4 , 1 );
					SetModeEx( Oid , EM_SetModeType_Fight, false);
					AddBuff( Oid , 501620 , 0 ,-1 );--上馬
					AttachObj( ReadRoleValue(Oid , EM_RoleValue_Register1) , Oid, 2,  "" , "" );--死掉後，後座的會下馬，讓他馬上上馬
				end
				return false
			end
		end
	end
	
	--創建演員
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
		SetModeEx( Actors[i] , EM_SetModeType_Revive, false )	--重生
		WriteRoleValue( Actors[i] ,EM_RoleValue_IsWalk ,1);
		AddToPartition( Actors[i] , RoomID );
	end
	SetPlot( Actors[1] , "dead" , "Lua_z22_q424824_DeadEvent" , 30 );
	AddBuff( Actors[1] , 501620 , -20 ,-1 );--上馬
	AttachObj( Actors[2] , Actors[1], 2,  "" , "" );
	
	--建立function
	local Lua_q424824_CheckCombat = function( HorseDriver , MonsterTeam )--檢查戰鬥中
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
		return 0--戰鬥中
	end
	local Lua_q424824_CheckPlayerError = function( Player , NpcB )--檢查玩家狀態
		if CheckID(Player)~=true or ReadRoleValue(Player , EM_RoleValue_IsDead)==1 or
		CheckFlag( Player, 545798 ) == true or --檢查有無重要物品
		 ( CheckAcceptQuest( Player , 424824 ) ~= true and CheckAcceptQuest( Player , 424825 ) ~= true and CheckAcceptQuest( Player , 424826 )~= true )==true or
		CheckDistance( Player, NpcB, 200 ) ~= true then --檢查是否超過檢查範圍
			return true
		end
		return false
	end
	
	local Lua_q424824_QuestEnd = function( GoodEnd , Player , NpcA , NpcB , Actors , MonsterTeam )
		if GoodEnd then
			NPCSay( NpcB , "[SC_Z22_Q424824_07]");--到這裡應該就安全了，謝謝你，冒險者。
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
	
	--建立資料
	local MonsterID = { 106512, 106513, 106514 }; --三波怪物的OrgID  -- 2011. 10. 21 活動組-米佳新增 正確怪物ID
	MonsterID = KS_RegroupArray(MonsterID);--一開始就決定隨機出現順序
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
			
	--開始劇情表演
	--say : 說話>走路到定點>進入下一步
	--combat : 進入戰鬥迴圈>走路到定點>進入下一步
	for Step =1,#AI_info do
		if AI_info[Step].mode=="say" then	--說話
			NPCSay( NpcB , AI_info[Step].string );
			Sleep(SpeakSleepTime);
		else--戰鬥模式
			SetModeEx( NpcB , EM_SetModeType_Fight, true);
			NPCSay( NpcB , "[SC_Z22_Q424824_04]" );--好像有什麼東西靠近我們了！
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
			AddBuff( NpcB , 506895 , 0, 600 );  -- 恐懼buff
			PlayMotion( NpcB , ruFUSION_ACTORSTATE_EMOTE_CRY );
			NPCSay( NpcB , "[SC_Z22_Q424824_12]" );--走開！不要靠近我！
			local Situation=0;
			local CombatTimer = 0;
			while 1 do
				if  Lua_q424824_CheckPlayerError(Player , NpcB)==true then
					NPCSay( NpcB , "[SC_Z22_Q424824_08]" );-- 咦、人怎麼不見了？這種地方實在太危險，我要先閃了！
					Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
					return
				end
				Situation = Lua_q424824_CheckCombat( Actors[1] , MonsterTeam );
				if Situation==1 then--護衛失敗
					NPCSay( NpcB , "[SC_Z22_Q424824_09]" );--也許我們需要一個更稱職的保鑣…。
					Sleep(10);
					Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
					return
				elseif Situation==2 then--怪物皆死亡
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
			NPCSay( NpcB , "[SC_Z22_Q424824_10]" );--沒事了嗎？那我們繼續前進吧。
		end
		
		--移動階段
		while 1 do
			if Lua_q424824_CheckPlayerError(Player , NpcB)==true then
				NPCSay( NpcB , "[SC_Z22_Q424824_08]" );-- 咦、人怎麼不見了？這種地方實在太危險，我要先閃了！
				Lua_q424824_QuestEnd( false ,  Player , NpcA , NpcB , Actors , MonsterTeam );
				return
			end
			if kg_GetDis( NpcB ,FlagID, Step )<=25 then
				break
			end
			KS_Move( NpcB , 0 , FlagID , Step );
			Sleep( MoveSleepTime );
			x,y,z,_ = kg_GetPosRX( NpcB , nil , 20,0,180 );--NpcB後方20碼
			KS_Move( Actors[1] , 0 , x,y,z );
		end
		DebugMsg( 0,0,"q424824 step"..Step.." End!!" );
	end
	Lua_q424824_QuestEnd( true ,  Player , NpcA , NpcB , Actors , MonsterTeam );
end