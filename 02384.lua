function LuaS_118336_1()
	local Player = OwnerID();
	local NPC = TargetID();
	--reg10 尚未綁定
	--reg9 1:已在場上,2:已就定位
	LoadQuestOption(Player);
	--[[
	if CheckAcceptQuest(Player,424250)==true and kg_Reg(NPC,9)==2 then--劇情未開始
		SetSpeakDetail( Player , "[SC_424250_TALK_WITH]" )--快幫忙把這些喀洛恩人趕走啦......不然我要怎麼回去......
		AddSpeakOption( Player, NPC, "[SC_424250_CHOICE]" , "LuaS_118336_2",0 )--答應把喀洛恩人趕走
	else
		LoadQuestOption(Player);
	end
	]]--
end
--[[
function LuaS_118336_2()--宣告劇情開始
	local Player = OwnerID();
	local NPC = TargetID();
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==2 then--避免玩家保留任務視窗 , 在場上沒有劇情的時候按下去
		WriteRoleValue(NPC,EM_RoleValue_Register9,3)--劇情鎖定
	end
	CloseSpeak(Player)
end
]]--
function LuaQ_118336_Accept()--玩家接任務時執行,可以使用sleep , 但因為玩家接任務就會執行, so 避免sleep
	local NPC = OwnerID();
	local Player = TargetID();
	if kg_Reg(NPC,9)==0 then--三人行尚未出生
		WriteRoleValue( NPC,EM_RoleValue_Register9,2 )--劇情開始
		CallPlot( NPC, "Lua_118336_Show" , NPC,Player )
	end
end

function Lua_118336_Show( NPC,Player )
	local Actor = Lua_118336_GroupBorn();
	local Bucket = ReadRoleValue( NPC, EM_RoleValue_Register1 );
	for i=1,5 do
		SetDefIdleMotion( Actor[i].Gid, ruFUSION_MIME_IDLE_COMBAT_1H );
	end
	--NPC提示玩家
	AdjustFaceDir( NPC,Bucket,0 );
	Yell( NPC,"[SC_424250_TALK07]" , 2 );	--天啊！他們又來了！
	Sleep(10)
	PlayMotion( NPC ,109 );--指向
	Sleep(30);
	Yell( Actor[3].Gid , "[SC_424250_TALK08]" , 2 );	--可惡的半殘人！今日要你們付出代價！
	Sleep(15)
	--雙方移動
	local x,y,z;
	for i =1,5 do
		if i<4 then
			x,y,z,_ = kg_GetPosRX( Actor[i].Gid , nil , 25 , 0 );--抓每隻犀牛人前面的位置
		else
			x,y,z,_ = kg_GetPosRX( Actor[i].Gid , nil , 15 , 0 );--抓每隻犀牛人前面的位置
		end
		MoveDirect( Actor[i].Gid , x,y,z );
	end
	local PlayerArray = SearchRangePlayer( NPC , 300 );
	for i=0,#PlayerArray do
		if CheckAcceptQuest(PlayerArray[i],424250)==true then
			ScriptMessage( NPC , PlayerArray[i] , 0 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffffffff" )
			ScriptMessage( NPC , PlayerArray[i] , 2 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffff0000" )
		end
	end
	Sleep(10);--等候移動到定位
	
	local Step = 0
	local FailTimer = 0
	while 1 do
		if kg_Reg(NPC,9)~=3 then--待玩家觸發劇情事件
			Step = math.random( 1,3 );
			PlayMotion( Actor[Step].Gid  , ruFUSION_ACTORSTATE_ATTACK_1H )
			Step = math.random( 4,5 );
			PlayMotion( Actor[Step].Gid  , ruFUSION_ACTORSTATE_ATTACK_1H )
		else
			break
		end
		if FailTimer>=30 then
			PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_QUIT]", "0xffffffff" )
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_QUIT]", "0xffff0000" )
				end
			end
			WriteRoleValue(NPC,EM_RoleValue_Register9,4)
			CallPlot(NPC,"Lua_118336_ShowEnd",NPC)
			return
		elseif FailTimer==20 then
			PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 0 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffffffff" )
					ScriptMessage( Actor[4].Gid , PlayerArray[i] , 2 , "[SC_424250_OVERTIME_TO_ACCEPT]", "0xffff0000" )
				end
			end
		end
		Sleep(10)
		FailTimer = FailTimer +1;
	end
	--Sleep(50)
	Say( Actor[1].Gid,"[SC_424250_TALK01]" )
	Sleep(25)
	Say( Actor[4].Gid,"[SC_424250_TALK02]" )
	Sleep(25)
	Say( Actor[5].Gid,"[SC_424250_TALK03]" )
	Sleep(15)
	DebugMsg( 0,0,"balabalabala.." )
	--設定ABC可砍殺
	for i =1,5 do
		Hide( Actor[i].Gid )
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Strikback, true) ---反擊(否)
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Fight, true) ---可砍殺(否)
		SetModeEx( Actor[i].Gid  , EM_SetModeType_Searchenemy, true)	---索敵(否)
		Show( Actor[i].Gid ,0 )
	end
	kg_Reg(NPC,9,4)
	for i=1,3 do
		for j = 4,5 do
			SysCastSpellLv( Actor[i].Gid,Actor[j].Gid,496946,0 )
			SysCastSpellLv( Actor[j].Gid,Actor[i].Gid,496946,0 )
		end
	end
	DebugMsg(0,0,"RealFight!!")
	--每秒檢查戰鬥
	local PlayerCheck = 0;
	local PlayersInHate = {};
	while 1 do
		Sleep(10)
		if ReadRoleValue(NPC,EM_RoleValue_Register9)==5 or ReadRoleValue(NPC,EM_RoleValue_Register9)==0 then
			break
		end
		for i=1,3 do
			PlayersInHate = KS_GetHateList( Actor[i].Gid , 3 )
			if table.getn(PlayersInHate)==0 then
				PlayerCheck = PlayerCheck+1
			else
				PlayerCheck=0
			end
		end
		DebugMsg(0,0,"PlayerCheck="..PlayerCheck)
		if PlayerCheck>=105 then
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i in pairs(PlayerArray) do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_QUIT]", "0xffffffff" )
					ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_QUIT]", "0xffff0000" )
				end
			end
			WriteRoleValue(NPC,EM_RoleValue_Register9,4)
			CallPlot(NPC,"Lua_118336_ShowEnd",NPC)
			break
		elseif PlayerCheck==90 then
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i in pairs(PlayerArray) do
				if CheckAcceptQuest(PlayerArray[i],424250)==true then
					ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_HAVE_TO_FIGHT]", "0xffffffff" )
					ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_HAVE_TO_FIGHT]", "0xffff0000" )
				end
			end
		end
	end
end

function Lua_118336_ShowEnd( NPC , mode )--mode有填:防衛者30%血量觸發
	DebugMsg(0,0,"ShowEnd Start")
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==4 then
		WriteRoleValue( NPC,EM_RoleValue_Register9 , 5)
		local PlayersInHate = {}
		local tempPlayerInHate = {}
		if mode==1 then
			--防衛者死亡
			DebugMsg(0,0,"Def Event")
			local Bucket = kg_Reg( NPC,1 )
			local PlayerArray = SearchRangePlayer( Bucket , 300 )
			for i=0,#PlayerArray do
			if CheckAcceptQuest(PlayerArray[i],424250)==true then
				ScriptMessage( Bucket , PlayerArray[i] , 0 , "[SC_424250_DWARF_BEEN_KILLED]", "0xffffffff" )
				ScriptMessage( Bucket , PlayerArray[i] , 2 , "[SC_424250_DWARF_BEEN_KILLED]", "0xffff0000" )
			end
			Sleep(10)
		end
		elseif mode == 2 then
			--侵略者30%血量事件
			DebugMsg(0,0,"Atker Event")
			--local Find = 0
			for i=1,3 do
				tempPlayerInHate = KS_GetHateList( Zone20_kg_118336_Actors[i].Gid , 3 )
				for j in pairs(tempPlayerInHate) do
					table.insert(PlayersInHate,tempPlayerInHate[j])
				end
			end
			--清仇恨
			for i=1,5 do
				ClearHateList( Zone20_kg_118336_Actors[i].Gid , -1 )
				kg_ActorInit( Zone20_kg_118336_Actors[i].Gid )
				SetStopAttack( Zone20_kg_118336_Actors[i].Gid  )
				WriteRoleValue(Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_IsWalk,0)
				Hide( Zone20_kg_118336_Actors[i].Gid )
				Show( Zone20_kg_118336_Actors[i].Gid , 0 )
				if i<4 then
					LockHP( Zone20_kg_118336_Actors[i].Gid  ,0,"" )
				end
			end
			DebugMsg(0,0,"ClearHateList..done..")
			--演退場戲
			Say( Zone20_kg_118336_Actors[2].Gid,"[SC_424250_TALK04]" );--半殘人的幫手很強！撤退！撤退！
			Sleep(20)
			local RefPos = kg_GetPosTable( 780953 ,0 );--抓一次旗標位置就好
			local x,y,z
			local Angle = -15
			for i=1,3 do
				x,y,z,_ = kg_GetPosRX(RefPos,nil,200,0,Angle);
				Move( Zone20_kg_118336_Actors[i].Gid,x,y,z );
				Angle = Angle+15;
			end
			Sleep(10);
			AdjustFaceDir( Zone20_kg_118336_Actors[4].Gid , Zone20_kg_118336_Actors[2].Gid ,0 )
			AdjustFaceDir( Zone20_kg_118336_Actors[5].Gid , Zone20_kg_118336_Actors[2].Gid ,0 )
			Say( Zone20_kg_118336_Actors[4].Gid , "[SC_424250_TALK05]" );--臭牛頭！別想跑！
			Sleep(15);
			Say( Zone20_kg_118336_Actors[5].Gid , "[SC_424250_TALK06]" );--可惡！
			Sleep(50);
			--給予玩家獎勵
			for i in pairs(PlayersInHate) do
				if CheckFlag( PlayersInHate[i], 545078 )~=true then
					SetFlag( PlayersInHate[i], 545078 ,1 )
				end
			end
		else
			--其他不正常
			DebugMsg(0,0,"Other Event")
		end
		for i=1,5 do
			if CheckID( Zone20_kg_118336_Actors[i].Gid )==true then
				DelObj(Zone20_kg_118336_Actors[i].Gid)
			end
			Zone20_kg_118336_Actors[i].Gid=0
		end
		SetDir( NPC , ReadRoleValue(NPC,EM_RoleValue_Register2) );
		kg_Reg(NPC,9,0)
		--Say(NPC,"Show End")
		Lua_118336_GroupBorn(1)
	end
end

function Lua_118336_Born()--使節F出生劇情,產生兩隻守備兵罰站
	local NPC = OwnerID()
	WriteRoleValue( NPC , EM_RoleValue_Register2 , ReadRoleValue( NPC, EM_RoleValue_Dir ) );--存取初始方向
	Zone20_kg_118336_Actors = {	NPC=NPC;
					{Orgid = 105752,Gid=0},	--喀洛恩戰士A
					{Orgid = 105754,Gid=0},	--喀洛恩戰士C--祭司擺中間
					{Orgid = 105753,Gid=0},	--喀洛恩戰士B
					{Orgid = 105504,Gid=0},	--D
					{Orgid = 105750,Gid=0}	--E
					};
	local Bucket = kg_Reg(NPC,1);
	if CheckID(Bucket)==true and ReadRoleValue(Bucket,EM_RoleValue_OrgID)==117201 then
		DelObj(Bucket);
	end
	Bucket = kg_GetPosRX( {780953,0}, 117201 );
	kg_Reg(NPC,1,Bucket)
	kg_InvisibleObjInit( Bucket )
	AddToPartition( Bucket,0 )
	SetPlot( Bucket,"range","Lua_118336_EnterBattleEvent",70 );
	Lua_118336_GroupBorn(1)
end

function Lua_118336_EnterBattleEvent()
	local Player = OwnerID();
	local NPC = Zone20_kg_118336_Actors.NPC;
	if ReadRoleValue(NPC,EM_RoleValue_Register9)==2 and CheckAcceptQuest(Player,424250)==true then--
		--Say( Player, "BattleEvent Start!!" );
		WriteRoleValue(NPC,EM_RoleValue_Register9,3)--劇情鎖定
	end
end

function Lua_118336_GroupBorn( mode )--產生表演群組,mode:只產生矮人
	local RefPos = kg_GetPosTable( 780953 ,0 );--抓一次旗標位置就好
	if mode ~=nil then
		Zone20_kg_118336_Actors[4].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[4].Orgid  , 25, 0 , 90 , -3 );
		kg_ActorInit( Zone20_kg_118336_Actors[4].Gid )
		WriteRoleValue( Zone20_kg_118336_Actors[4].Gid , EM_RoleValue_IsWalk,0 );
		AddToPartition( Zone20_kg_118336_Actors[4].Gid , 0 )
		AddBuff(Zone20_kg_118336_Actors[4].Gid,508887,0,-1)
		Zone20_kg_118336_Actors[5].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[5].Orgid  , 25, 0 , -90 , -3 );
		kg_ActorInit( Zone20_kg_118336_Actors[5].Gid )
		WriteRoleValue( Zone20_kg_118336_Actors[5].Gid , EM_RoleValue_IsWalk,0 );
		AddToPartition( Zone20_kg_118336_Actors[5].Gid , 0 )
		AddBuff(Zone20_kg_118336_Actors[5].Gid,508887,0,-1)
		--設定死亡劇情 , 死亡時重置所有表演
		SetPlot( Zone20_kg_118336_Actors[4].Gid , "dead" , "Lua_118336_DefGroupDead" , 0  )
		SetPlot( Zone20_kg_118336_Actors[5].Gid , "dead" , "Lua_118336_DefGroupDead" , 0  )
		return
	end
	local x,y,z;
	local Angle = -10;
	local Dis=150;
	local Dir = RefPos[4]+180;
	if Dir>360 then Dir = Dir-360; end
	for i=1,3 do
		if i==2 then
			Zone20_kg_118336_Actors[i].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[i].Orgid , Dis+25 , 0 , Angle , Dir  );--祭司在後面
		else
			Zone20_kg_118336_Actors[i].Gid = kg_GetPosRX( RefPos , Zone20_kg_118336_Actors[i].Orgid , Dis , 0 , Angle , Dir  );
		end
		kg_ActorInit( Zone20_kg_118336_Actors[i].Gid );
		WriteRoleValue( Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_IsWalk , 0 );--跑步
		AddToPartition( Zone20_kg_118336_Actors[i].Gid , 0 );
		AddBuff(Zone20_kg_118336_Actors[i].Gid,508887,0,-1);--不回血
		x,y,z,_ = kg_GetPosRX( Zone20_kg_118336_Actors[i].Gid , nil , 90 , 0 );--抓每隻犀牛人前面的位置
		MoveDirect( Zone20_kg_118336_Actors[i].Gid , x,y,z );
		LockHP( Zone20_kg_118336_Actors[i].Gid , ReadRoleValue(Zone20_kg_118336_Actors[i].Gid,EM_RoleValue_MaxHP)*0.3 , "Lua_118336_ActorHpEvent" );--30%血量則觸發事件
		Angle = Angle+10;
	end
	return Zone20_kg_118336_Actors
end

function Lua_118336_DefGroupDead()
	DebugMsg(0,0,"Def Dead!!")
	local Actor = OwnerID()
	if ReadRoleValue(Zone20_kg_118336_Actors.NPC,EM_RoleValue_Register9)==4  and kg_Reg(Actor,10)==0 then
		kg_Reg(Actor,10,1)
		CallPlot( Zone20_kg_118336_Actors.NPC , "Lua_118336_ShowEnd" ,  Zone20_kg_118336_Actors.NPC,1 )
	end
end

function Lua_118336_ActorHpEvent()--30%HP事件
	DebugMsg(0,0,"Atker Lose")
	local Actor = OwnerID();
	--local Atker = TargetID();
	if kg_Reg(Actor,10)==0 then
		kg_Reg(Actor,10,1)
		if ReadRoleValue(Zone20_kg_118336_Actors.NPC,EM_RoleValue_Register9)==4  then
			CallPlot( Zone20_kg_118336_Actors.NPC , "Lua_118336_ShowEnd" ,  Zone20_kg_118336_Actors.NPC , 2 )
		end
		
	end
end