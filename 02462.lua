
function LuaS_424524_0()--與119108對話
	local Player = OwnerID();
	local Npc = TargetID();
	LoadQuestOption(Player);
	if CheckAcceptQuest(Player,424524)==true and ReadRoleValue(Npc,EM_RoleValue_Register10)==0  then
		if ReadRoleValue( Npc , EM_RoleValue_OrgID )==119108 and CheckFlag( Player, 545501  )~=true then
			AddSpeakOption( Player, Npc, "[SC_424524_1]", "LuaS_424524_1",0 );--我會在這裡守候。
		elseif ReadRoleValue( Npc , EM_RoleValue_OrgID )==119109 and ReadRoleValue(Npc,EM_RoleValue_Register9)==1 and CheckFlag( Player, 545501 )==true then--待玩家點選傳送
			AddSpeakOption( Player, Npc, "[SC_424524_7]", "LuaS_424524_1",0 );--我們離開吧！
		end
	end
end

function LuaS_424524_1()
	local Player = OwnerID();
	local Npc = TargetID();
	if ReadRoleValue(Npc,EM_RoleValue_Register10)==0 then
		WriteRoleValue(Npc,EM_RoleValue_Register10,1);
		if ReadRoleValue( Npc , EM_RoleValue_OrgID )==119108 then
			LuaS_424524_Monsters={};
			CallPlot(Npc,"LuaS_424524_Show",Npc,Player );
		elseif ReadRoleValue( Npc , EM_RoleValue_OrgID )==119109 then
			CallPlot(Npc,"LuaS_424524_QuestEnd",Npc,Player );
		end
	end
	CloseSpeak(Player);
end

function Lua_424524_CheckPlayer( Npc , PlayerTeam )
	local PlayerCount , MaxCount = 0,#PlayerTeam;
	local x,y,z=GetMoveFlagValue( 780871 , 2 , EM_RoleValue_X ) , GetMoveFlagValue( 780871 , 2 , EM_RoleValue_Y ),GetMoveFlagValue( 780871 , 2 , EM_RoleValue_Z );
	while 1 do
		--DebugMsg(0,0,"Checking...");
		PlayerCount=0;
		for i =1,MaxCount do
			if (CheckID(PlayerTeam[i])==true and  CheckAcceptQuest( PlayerTeam[i], 424524 ) ~= true) or 
			kg_GetDis( PlayerTeam[i] , x,y,z )>300 or
			ReadRoleValue( PlayerTeam[i] , EM_RoleValue_IsDead )==1 or
			--CheckFlag( PlayerTeam[i], 545501  ) == true or--完成任務
			CheckID(PlayerTeam[i]) ~= true then
				PlayerCount = PlayerCount+1; --DebugMsg( 0, 0 , "PlayerCount="..PlayerCount );
			end
		end
		if PlayerCount>=MaxCount  or ReadRoleValue( Npc , EM_RoleValue_Register9 )==3 then--玩家皆以傳送走
			break
		end
		Sleep(20);
	end
	Sleep(10);
	local Npc1 = ReadRoleValue( Npc , EM_RoleValue_Register1 ); local RoomID = ReadRoleValue(Npc ,EM_RoleValue_RoomID);
	if ReadRoleValue( Npc , EM_RoleValue_Register9 )~=3 then--劇情沒跑完，全部刪一刪
		DebugMsg(0,0,"424524 QuestCheck End");
		for i = 1 ,#PlayerTeam do
			if CheckFlag( PlayerTeam[i], 545501  ) ~= true then
				ScriptMessage( PlayerTeam[i] , PlayerTeam[i] , 2 ,  "[SC_423009_18]" , "0xffff0000" );--由於你無法進行戰鬥導致任務失敗！請重新挑戰！
			end
		end
		if #LuaS_424524_Monsters>0 then
			for i =1 , #LuaS_424524_Monsters do
				DelObj( LuaS_424524_Monsters[i] );
			end
		end
		LuaS_424524_Monsters=nil;
		WriteRoleValue( Npc1 ,EM_RoleValue_Register10,0 );
		Show( Npc1 , RoomID );
		DelObj( Npc );
		return
	end
	DebugMsg(0,0,"424524 Quest Success");
	LuaFunc_MoveToFlag( Npc , 780871 , 1  , 10 );
	Hide( Npc );
	Sleep(50);
	WriteRoleValue( Npc1 ,EM_RoleValue_Register10,0 );
	Show( Npc1 , RoomID );
	DelObj( Npc );
end

function LuaS_424524_Show( Npc , Player )
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID );
	if ReadRoleValue(Npc ,EM_RoleValue_OrgID)==119108 then
		Hide( Npc );
		local Npc2 = kg_GetPosRX( Npc , 119109 );
		MoveToFlagEnabled(Npc2 , false);
		WriteRoleValue( Npc2 , EM_RoleValue_IsWalk,0 );
		SetModeEx( Npc2 , EM_SetModeType_Mark, false );
		WriteRoleValue( Npc2 , EM_RoleValue_Register1,Npc );
		AddToPartition( Npc2 , RoomID );
		CallPlot( Npc2 , "LuaS_424524_Show" , Npc2 , Player );
		return
	end
	
	local LuaS_424524_GameHint = function( PlayerTeam , Message )
		for i in pairs(PlayerTeam) do
			ScriptMessage( PlayerTeam[i] , PlayerTeam[i] , 2 ,  Message , "0xffff0000" );
		end
	end
	
	local LuaS_424524_CallEnemy = function( Npc , PlayerTeam ,  EnemyNum , Clear )
		Clear = Clear or 1;
		if Clear==1 then LuaS_424524_Monsters={}; end
		local TempObj = 0;
		local RoomID = ReadRoleValue(Npc , EM_RoleValue_RoomID);
		for i = 1,EnemyNum do
			TempObj= kg_GetPosRX( { 780871 , 1 }, 105951 , Rand(30) , 0 , Rand(360) );
			table.insert( LuaS_424524_Monsters , TempObj );
			MoveToFlagEnabled(TempObj , false );
			SetModeEx( TempObj , EM_SetModeType_Revive , false );
			WriteRoleValue( TempObj , EM_RoleValue_LiveTime , 1200 );--存活20分鐘
			WriteRoleValue( TempObj , EM_RoleValue_IsWalk , 0 );
			AddToPartition( TempObj ,RoomID );
			for p in pairs(PlayerTeam) do
				SysCastSpellLv( PlayerTeam[p] , TempObj, 496946, 0 )--製造假仇恨
			end
		end
	end
	
	local x,y,z;
	local TempCount = 0;
	local FlagID = 780871;
	local PlayerTeam={};
	TempCount = GetPartyID( Player , -1);
	if TempCount>1 then
		for i =1 , TempCount do
			PlayerTeam[i]=GetPartyID( Player , i);
		end
	else
		PlayerTeam[1]=Player;
	end
	Sleep(10);--等npc出現
	CallPlot( Npc , "Lua_424524_CheckPlayer" , Npc ,PlayerTeam );
	AdjustFaceDir( Npc ,Player , 0 );
	NPCSay( Npc , "[SC_424524_2]" );----麻煩你守候在這裡，等我回來！
	Sleep(10);
	LuaFunc_MoveToFlag( Npc , FlagID , 3  , 10 );
	Hide( Npc );
	Sleep(20);
	LuaS_424524_GameHint( PlayerTeam ,  "[SC_424524_3]" );--出現了一些不死的部隊！
	for Step = 1,2 do
		--DebugMsg( 0,0,"Step_"..Step.." Start!!" );
		if Step==2 then
			LuaS_424524_GameHint( PlayerTeam ,  "[SC_424524_4]" );--第二波攻擊開始了！
		end
		LuaS_424524_CallEnemy( Npc , PlayerTeam,2 );
		repeat
			TempCount = 0;
			for i=1,#LuaS_424524_Monsters do
				if CheckID( LuaS_424524_Monsters[i] )~=true or 
				ReadRoleValue( LuaS_424524_Monsters[i]  , EM_RoleValue_IsDead )==1 then
					TempCount = TempCount+1;
				end
			end
			Sleep(10);
		until TempCount==#LuaS_424524_Monsters
		--DebugMsg( 0,0,"Step_"..Step.." End!!" );
		if Step ==1 then
			Sleep(30);--第一波結束等3秒
		end
	end
	Sleep(20)
	CallPlot( Npc , "LuaS_424524_Show2" , Npc , Player , RoomID );--叫NPC走回來
	Sleep(20);
	LuaS_424524_CallEnemy( Npc , PlayerTeam , 2);
	Sleep(20);
	LuaS_424524_CallEnemy( Npc , PlayerTeam , 2 , 0);
	repeat
		TempCount = 0;
		if LuaS_424524_Monsters~=nil and ReadRoleValue(Npc ,EM_RoleValue_Register9)<=1 then
			for i=1,#LuaS_424524_Monsters do
				if CheckID( LuaS_424524_Monsters[i] )~=true or 
				ReadRoleValue( LuaS_424524_Monsters[i]  , EM_RoleValue_IsDead )==1 then
					TempCount = TempCount+1;
				end
			end
		else
			break
		end
		Sleep(10); --DebugMsg( 0,0,"424524_Monsters DeadCount = "..TempCount);
	until TempCount==#LuaS_424524_Monsters
	--玩家玩到第四波怪物完全結束
	if ReadRoleValue(Npc ,EM_RoleValue_Register9)<2 then
		CallPlot( Npc , "LuaS_424524_QuestEnd" , Npc , Player );
	end
	--DebugMsg( 0,0,"QuestEnd");
end

function LuaS_424524_Show2( Npc , Player  , RoomID )
	--DebugMsg( 0,0, "LuaS_424524_Show2 Start");
	Sleep(20);
	Show( Npc , RoomID );
	LuaFunc_MoveToFlag( Npc , 780871 , 2  , 10 );
	PlayMotion( Npc , ruFUSION_ACTORSTATE_CROUCH_BEGIN );--跪下
	SetModeEx( Npc , EM_SetModeType_Mark, true );
	Sleep(1); NPCSay( Npc , "[SC_424524_5]" );--沒想到四處都有埋伏，快點過來，我們要從剛才設下的路徑逃出去！
	local PlayerTeam={};
	local TempCount = GetPartyID( Player , -1);
	if TempCount>1 then
		for i =1 , TempCount do
			PlayerTeam[i]=GetPartyID( Player , i );
		end
	else
		PlayerTeam[1]=Player;
	end
	for i in pairs(PlayerTeam) do
		if GetDistance( Npc , PlayerTeam[i] )<=300 and
			CheckAcceptQuest( PlayerTeam[i],424524 ) == true then
			SetFlag( PlayerTeam[i] , 545501 , 1 );
			ScriptMessage( PlayerTeam[i] , PlayerTeam[i] , 2 ,  "[SC_424524_6]" , "0xffff0000" );--點擊[119109]進行對話。
		end
	end
	WriteRoleValue( Npc ,EM_RoleValue_Register9 , 1 );
end

function LuaS_424524_QuestEnd( Npc , Player )
	if ReadRoleValue(Npc ,EM_RoleValue_Register9)==1 then
		WriteRoleValue( Npc ,EM_RoleValue_Register9 , 2 );--鎖定劇情
	else
		return
	end
	local PlayerTeam={};
	local TempCount = GetPartyID( Player , -1);
	if TempCount>1 then
		for i =1 , TempCount do
			PlayerTeam[i]=GetPartyID( Player , i );
		end
	else
		PlayerTeam[1]=Player;
	end
	CastSpell( Npc , Npc , 498195 );--施放傳送術
	kg_WaitSpell( Npc );
	for i =1,#PlayerTeam do
		SetPosByFlag( PlayerTeam[i],780871 , 4 );
	end
	WriteRoleValue( Npc ,EM_RoleValue_Register9 , 3 );--傳送完畢
	if LuaS_424524_Monsters~=nil and #LuaS_424524_Monsters>0 then
		for i =1 , #LuaS_424524_Monsters do
			DelObj( LuaS_424524_Monsters[i] );
		end
	end
	LuaS_424524_Monsters=nil;
end

function Lua_424524_PortalInit()
	function Lua_424524_EnterPortal()
		local Player = OwnerID();
		if CheckAcceptQuest(OwnerID(),424524)==true and CheckFlag( Player, 545501  )~= true then
			SetPosByFlag( OwnerID(),780871 , 1 );
		end
	end
	local Portal = OwnerID();
	MoveToFlagEnabled( Portal , false );
	SetModeEx( Portal , EM_SetModeType_Mark,false );
	SetModeEx( Portal , EM_SetModeType_Gravity,false );
	SetModeEx( Portal , EM_SetModeType_ShowRoleHead, false);
	SetModeEx( Portal , EM_SetModeType_Fight, false);
	SetPlot( Portal , "Collision" , "Lua_424524_EnterPortal" , 50 );
end

----------------424630-----------
function LuaS_424630_1()	--跟工人對話
	local Player = OwnerID();
	local Npc = TargetID();
	LoadQuestOption(Player);
	if (CheckAcceptQuest(Player,424630)==true or CheckAcceptQuest(Player,424631)==true or  CheckAcceptQuest(Player,424644)==true )  and
	ReadRoleValue( Player , EM_RoleValue_Register10 )==0 and
	ReadRoleValue( Npc , EM_RoleValue_Register10 )==0 and CountBodyitem( Player , 240636 )<5 then
		AddSpeakOption( Player, Npc, "[SC_424630_1]", "LuaS_424630_2",0 );
	end
end

function LuaS_424630_2()
	local Player = OwnerID();
	local Npc = TargetID();
	if ReadRoleValue( Npc , EM_RoleValue_Register10 )==0 then
		WriteRoleValue( Npc , EM_RoleValue_Register10 , 1 );
		WriteRoleValue( Player , EM_RoleValue_Register10 , 1 );--玩家帶NPC中
		CallPlot( Npc , "Lua_424630_ShowInit" , Npc , Player );
	end
	CloseSpeak(Player);
end

function Lua_424630_ShowInit( Npc , Player )--NPC檢查玩家
	SetModeEx( Npc , EM_SetModeType_Show  , false);
	SetModeEx( Npc , EM_SetModeType_Mark  , false);
	SetModeEx( Npc , EM_SetModeType_ShowRoleHead  , false);
	local Worker = kg_GetPos( Npc  , 106119 );
	MoveToFlagEnabled( Worker , false );
	SetModeEx( Worker , EM_SetModeType_Revive  , false);
	SetModeEx( Npc , EM_SetModeType_Searchenemy  , false);
	WriteRoleValue( Worker , EM_RoleValue_Register10,Player );
	AddToPartition( Worker , ReadRoleValue(Npc ,EM_RoleValue_RoomID) );
	CallPlot( Worker , "Lua_424630_WorkWork" , Npc , Player );
	local PlayerPosCheckTimer =0;
	local x,y,z,_=kg_GetPos(Player);
	while 1 do
		if kg_GetDis( Player , x,y,z )>1 then
			PlayerPosCheckTimer = 0
			x,y,z,_=kg_GetPos(Player);
		elseif ReadRoleValue( Worker , EM_RoleValue_Register2 )==0 then
			PlayerPosCheckTimer=PlayerPosCheckTimer+2;
			--DebugMsg(0,0,"Player Dont Move , PlayerPosCheckTimer="..PlayerPosCheckTimer);
			x,y,z,_=kg_GetPos(Player);
		end
		if (CheckAcceptQuest(Player,424630)~=true and CheckAcceptQuest(Player,424631)~=true and CheckAcceptQuest(Player,424644)~=true ) or
		PlayerPosCheckTimer>=40 or
		GetDistance( Player , Worker )>500 or
		CheckID( Player )~=true or ReadRoleValue( Player , EM_RoleValue_IsDead )==1 or
		CheckID( Worker )~=true or ReadRoleValue( Worker , EM_RoleValue_IsDead )==1 or
		ReadRoleValue(Worker,EM_RoleValue_Register1)==1 then--玩家已拿到足夠數量的物品
			--Say(Player , "Quest 424630 Quit");
			break
		end
		Sleep(20)
	end
	DelObj(Worker);
	if CheckID( Player )==true then WriteRoleValue( Player , EM_RoleValue_Register10 , 0 ); end--解除工人綁定
	SetModeEx( Npc , EM_SetModeType_Show  , true);
	SetModeEx( Npc , EM_SetModeType_Mark  , true);
	SetModeEx( Npc , EM_SetModeType_ShowRoleHead  , true);
	WriteRoleValue( Npc , EM_RoleValue_Register10 , 0 );
end

function Lua_424630_WorkWork(  Npc , Player )--工人搜尋目標物
	local Worker = OwnerID();
	--reg1 : 玩家已完成任務
	--reg2 : 當前AI模式
	--reg3 : 目前鎖定的巢晶
	--reg10 : 綁定的玩家
	local Nest , OldNest= 0,0;
	local NestList = {};
	local inCombat=false;
	local WorkerWorkTimer=0;
	local x,y,z;
	local WarningLock = false;
	SetFollow(Worker , Player);
	while 1 do
		if KS_InCombat( Worker )==false then
			if inCombat==true then
				inCombat = false;
				SetFollow( Worker , Player );
			end
			if CountBodyitem( Player , 240636 )>=5 then--已採滿3個
				break
			elseif ReadRoleValue( Worker , EM_RoleValue_Register2)==2 then--採集中
				--Say( Worker , "Collecting..." );
				if ReadRoleValue(Worker,EM_RoleValue_SpellMagicID)==0 then
					--採集完成or 中斷
					WriteRoleValue( Worker , EM_RoleValue_Register2 , 0 );
					SetFollow( Worker , Player );
					--Say( Worker , "Mode2 Complete" );
				end
			elseif ReadRoleValue( Worker , EM_RoleValue_Register2)==1 then--偵測到採集物
				StopMove( Worker , true );
				AdjustFaceDir( Worker, Nest,0 );
				Sleep(10);
				x,y,z,_ = kg_GetPos(Nest);
				MoveDirect( Worker , x,y,z );
				while 1 do
					if KS_InCombat( Worker )==false then
						--Say( Worker ,"Distance= "..GetDistance( Nest , Worker ) );
						if GetDistance( Nest , Worker )<=30 then
							StopMove( Worker , true );
							CastSpell( Worker , Worker , 498330 );
							WriteRoleValue( Worker , EM_RoleValue_Register2 , 2 );
							BeginPlot(Worker , "LuaQ_424630_WorkerCallEnemy" ,0);
							break
						end
					else
						--Say( Worker , "Battle Mode Start..");
						WriteRoleValue( Nest , EM_RoleValue_Register10 , 0 )--解除當前採集的鎖定
						WriteRoleValue( Worker , EM_RoleValue_Register2 , 0 );
						break
					end
					Sleep(10)
				end
			elseif ReadRoleValue( Worker , EM_RoleValue_Register2)==0 then
				Nest = 0;
				NestList =  SearchRangeNPC( Worker , 50 );
				for i = 1 , #NestList do
					if ReadRoleValue( NestList[i] , EM_RoleValue_OrgID )==106120 then
						--Say(Worker , "find Target");
						Nest = NestList[i];
						if ReadRoleValue( NestList[i] , EM_RoleValue_Register10 )==0 and CheckBuff(NestList[i] , 620925)==true then
							WriteRoleValue( NestList[i] , EM_RoleValue_Register10 , 1 );
							CallPlot( NestList[i] , "Lua_424630_NestCheckWorker" , NestList[i] , Worker );
							WriteRoleValue( Worker , EM_RoleValue_Register3 , NestList[i] );
							SetFollow( Worker , 0 );
							--Say( NestList[i] , "i will die ><...");
							WriteRoleValue( Worker , EM_RoleValue_Register2 , 1 );--進入走向採集物模式
							--Say(Worker , "Find and Lock Nest");
							WorkerWorkTimer=0;
							break
						end
					end
				end
				if ReadRoleValue(Worker , EM_RoleValue_Register2)==0 then--沒進入採集狀態
					--DebugMsg(0,0,"Nest="..Nest.." , OldNest="..OldNest);
					if Nest~=OldNest then
						WarningLock=false;
					end
					if Nest>0 then
						if CheckBuff( Nest , 620925 )==true  then
							if WarningLock ==false then
								WarningLock=true; OldNest = Nest;
								NPCSay(Worker , "[SC_424630_WARNING02]");--這個有人先來了，我們要找別的！
							end
						else
							if WarningLock ==false then
								WarningLock=true; OldNest = Nest;
								NPCSay(Worker , "[SC_424630_WARNING01]");--這個有人採集過了！我們要找下一個。
							end
						end
					end
					WorkerWorkTimer = WorkerWorkTimer+2; --DebugMsg(0,0,"WorkerWorkTimer= "..WorkerWorkTimer);
					if WorkerWorkTimer>=90 then
						--Say( Worker , "Quest Fail" ); 
						Sleep(1); DelObj(Worker);
					end
				end
			end
		else
			if inCombat ==false then
				inCombat=true;
				--Say( Worker , "Battle Mode");
				if ReadRoleValue( Worker ,EM_RoleValue_Register2 )>0 then
					WriteRoleValue( Nest , EM_RoleValue_Register10 , 0 );--採集中遇到戰鬥則解鎖巢晶
					Nest=0;
				end
				WriteRoleValue( Worker , EM_RoleValue_Register2 , 0 );
			end
		end
		Sleep(20)
	end
	AdjustFaceDir( Worker , Player ,0 );
	NPCSay( Worker , "[SC_424630_QUESTCOMPLETE]" );--好！這次的收獲不錯！袋子已經裝滿啦！我先回去，你自己要小心點啊！
	Sleep(10);
	SetModeEx( Worker , EM_SetModeType_Fight , false );
	WriteRoleValue(Worker , EM_RoleValue_LiveTime , 6);
	x,y,z,_ = kg_GetPos( Npc );
	Move( Worker , x,y,z );
	WriteRoleValue( Worker , EM_RoleValue_Register1 , 1 );
end

function Lua_424630_NestCheckWorker( Nest , Worker )--被鎖定的巢晶檢查工人的採集
	--DebugMsg(0,0,"Lua_424630_NestCheckWorker Start");
	while 1 do
		if ReadRoleValue( Nest , EM_RoleValue_Register10 )==0 or
		CheckID( Worker )==false or ReadRoleValue(Worker,EM_RoleValue_IsDead)==1 or
		KS_InCombat( Worker )==true  then
			WriteRoleValue( Nest , EM_RoleValue_Register10 , 0 );
			--Say( Nest , "Unlock" );
			return
		end
		Sleep(5);
	end
end

function Lua_106120_Init()
	local ThisNest = OwnerID();
	MoveToFlagEnabled( ThisNest, false )
	SetModeEx( ThisNest , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( ThisNest , EM_SetModeType_Searchenemy, false)	---索敵(否)
	SetModeEx( ThisNest , EM_SetModeType_Fight, false);
	WriteRoleValue( ThisNest , EM_RoleValue_Register10 , 0 );--解除鎖定
	AddBuff( ThisNest , 620925 , 0 ,-1 );
end

---------工人採集技能-------------
function LuaQ_424630_WorkerCallEnemy()
	local Worker = OwnerID();
	local randVar = Rand(100);
	Sleep(10);
	if randVar>50 then
		randVar = Rand(100);
		local Monster;
		if randVar>50 then
			Monster = kg_GetPosRX( Worker , 106074 , Rand(50) , 0 , Rand(360) );
		else
			Monster = kg_GetPosRX( Worker , 106075 , Rand(50) , 0 , Rand(360) );
		end
		MoveToFlagEnabled(Monster , false);
		SetModeEx( Monster  ,EM_SetModeType_Revive , false );
		AddToPartition(Monster , ReadRoleValue(Worker , EM_RoleValue_RoomID));
		SysCastSpellLv( Worker,Monster,497448,0 );--強制仇恨1
		CallPlot( Monster , "LuaQ_424630_EnemyAI" , Monster );
	end
end

function LuaQ_424630_EnemyAI( Monster )
	local inCombatTimer = 0;
	while 1 do
		if KS_InCombat( Monster )==true then
			inCombatTimer=0;
		else
			if ReadRoleValue( Monster , EM_RoleValue_IsDead )==1 then
				break
			end
			inCombatTimer = inCombatTimer+1;
			--DebugMsg( 0,0, "LuaQ_424630_EnemyAI , inCombatTimer="..inCombatTimer );
			if inCombatTimer>=6 then
				DelObj( Monster );
				break
			end
		end
		Sleep(10);
	end
end

function LuaQ_424630_Skill()
	local Worker = OwnerID();
	local Player = ReadRoleValue(Worker ,EM_RoleValue_Register10);
	local Nest = ReadRoleValue( Worker , EM_RoleValue_Register3 );
	local ItemCount = CountBodyitem( Player , 240636 ); --Say(Player , "ItemCount="..ItemCount);
	if ItemCount==0 then
		local NeedSpaceStatus  = Check_Bag_Space( Player , 1  );
		if ( NeedSpaceStatus  == false ) then
			ScriptMessage( Player, Player, 1,"[SYS_BAG_ENOUGH_CAPACITY]", 0 );--背包欄位已滿!!
		else
			CancelBuff( Nest , 620925 );
			KillID( Player , Nest );
			GiveBodyItem( Player, 240636, 1 );
		end
	elseif ItemCount<5 then
		CancelBuff( Nest , 620925 );
		KillID( Player , Nest );
		GiveBodyItem( Player, 240636, 1 );
	end
end
--掛在腳色登入劇情，清除玩家旗標用。
function lua_WrongQuestReset()
	--z21任務：大門就在前方
	--沒完成，沒接，但有旗標的話，就刪掉旗標
	local Obj = OwnerID();
	if CheckCompleteQuest(Obj,424524) == false and 
	CheckAcceptQuest( Obj,424524 ) == false and
		CheckFlag( Obj,545501 )== true then
		SetFlag( obj,545501,0 )
	end
end