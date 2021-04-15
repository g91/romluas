function Lua_Zone22_105976_SkillInfo( level  ,  mode )
	level = level or 0;
	mode = mode or 1;
	local SkillInfo = {};
	local BuffLv = 0;
	local BossID = 0;
	local MonsterIDs = {};
	
--			{ ID , Lv }
	if level==0 then--普通
		SkillInfo[1] = { ID=497383 , Lv=10 };--魔法球
		SkillInfo[2] = { ID=497384 , Lv=10 };--爪壓
		SkillInfo[3] = { ID=497385 , Lv=8 };--橫掃AE
		SkillInfo[4] = { ID=497386 , Lv=10 };--自爆
		SkillInfo[5] = { ID=497387 , Lv=0 };--魔法吐息
		SkillInfo[6] = { ID=497389 , Lv=10 };--降落全場AE
		SkillInfo[7] = { ID=498057 , Lv=0 };--冰心刺擊
		BossID = 105976;		--普通版Boss OrgID
		BuffLv = 14;			--法能意志Buff層數
		MonsterIDs[1] = 105978;		--魔法符能體
		MonsterIDs[2] = 105979;		--火
		MonsterIDs[3] = 105980;		--水
	elseif level==1 then--簡單
		SkillInfo[1] = { ID=497383 , Lv=0 };--魔法球
		SkillInfo[2] = { ID=497384 , Lv=0 };--爪壓
		SkillInfo[3] = { ID=497385 , Lv=4 };--橫掃AE
		SkillInfo[4] = { ID=497386 , Lv=0 };--自爆
		SkillInfo[5] = { ID=497387 , Lv=0 };--魔法吐息
		SkillInfo[6] = { ID=497389 , Lv=0 };--降落全場AE
		SkillInfo[7] = { ID=498057 , Lv=0 };--冰心刺擊
		BossID = 106735;		--簡易版Boss OrgID
		BuffLv = 9;			--法能意志Buff層數
		MonsterIDs[1] = 106736;		--魔法符能體
		MonsterIDs[2] = 106737;		--火
		MonsterIDs[3] = 106738;		--水
	end
	
	local Ouput = { SkillInfo , BuffLv , BossID , MonsterIDs };
	return Ouput[mode];
	
--	直立式起飛中：crafting_start
--	空中維持吐火球動作：crafting_idle
--	降落：crafting_end
end

function Lua_Zone22_105976_FunctionsInit( override )
	if Lua_Zone22_105976_DeadEvent==nil or override==1 then
		Lua_Zone22_105976_DeadEvent = function()
			local Boss = OwnerID();
			ScriptMessage( Boss , -1 , 2 , "[SC_105976_BOSSDEAD]" , C_SYSTEM );
			CallPlot( Lua_Zone22_EternalTowerWS_Boss5[ReadRoleValue(Boss,EM_RoleValue_RoomID)].Ctrl ,"Lua_Zone22_105976_DelObj",2 );
			return true
		end
	end
	if Lua_Zone22_105976_BossCreate==nil or override==1 then
		Lua_Zone22_105976_BossCreate = function()
			local Ctrl = OwnerID();
			local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
			local level = ReadRoleValue( Ctrl , EM_RoleValue_PID );
			local BossID = Lua_Zone22_105976_SkillInfo(level , 3);
			local Boss = kg_GetPosRX( {780986,0},BossID );
			Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss=Boss;
			MoveToFlagEnabled( Boss,false );
			SetModeEx( Boss , EM_SetModeType_Revive, false );	--可重生
			WriteRoleValue( Boss , EM_RoleValue_PID , level );	--存放難度
			AddToPartition( Boss , RoomID );
			SetPlot( Boss, "dead" , "Lua_Zone22_105976_DeadEvent" ,30 );
			AddBuff(Boss , 508887 , 0 , -1 );--不回血
		end
	end
	if Lua_Zone22_105976_DelObj==nil or override==1 then
		Lua_Zone22_105976_DelObj= function( Reset )--1:重置 2:Boss死亡
			local Oid = OwnerID();
			local RoomID = ReadRoleValue(Oid ,EM_RoleValue_RoomID);
			DelObj(Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor);
			if Reset~=2 then
				DelObj(Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss);
			end
			
			local NpcCount = SetSearchAllNPC(RoomID);
			local NpcGid , NpcOrgid = 0,0;
			local BossIDs = {};
			BossIDs[1] = Lua_Zone22_105976_SkillInfo(0,3);
			BossIDs[2] = Lua_Zone22_105976_SkillInfo(1,3);
			for i = 1 , NpcCount do
				NpcGid = GetSearchResult();
				NpcOrgid = ReadRoleValue( NpcGid ,EM_RoleValue_OrgID );
				if NpcOrgid==105718 or NpcOrgid==106734  then--分身
					DelObj( NpcGid );
				end
				--刪除Boss
				if Reset~=2 then
					if NpcOrgid==BossIDs[1] or NpcOrgid==BossIDs[2] then
						DelObj( NpcGid );
					end
				end
				--刪除其他物件
				if NpcOrgid>105976 and NpcOrgid<=105980 then
					DelObj( NpcGid );
				end
				if NpcOrgid>106735 and NpcOrgid<=106738 then
					DelObj( NpcGid );
				end
			end
			if Reset == 1 then
				Sleep(50);
				Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor=0;
				Lua_Zone22_EternalTowerWS_Boss5[RoomID].Boss=nil;
				Lua_Zone22_105976_BossCreate();
			else
				Sleep(20);
				Lua_Zone22_EternalTowerWS_Boss5[RoomID]=nil;
			end
		end
	end
	if Lua_Zone22_105976_BossCrazy==nil or override==1 then	--狂暴function
		Lua_Zone22_105976_BossCrazy = function()
			local Boss= OwnerID();
			local timer = 0;
			local level = ReadRoleValue( Boss , EM_RoleValue_PID );
			local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
			while 1 do
				if KS_InCombat(Boss)~=true then
					--Say(Boss , "z144_boss5 leave battle!!!!!!");
					DebugMsg(0,RoomID,"z144_boss5 leave battle!!!!!!");
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_RESET]" , C_SYSTEM );
					CallPlot( Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl , "Lua_Zone22_105976_DelObj" , 1 );
					return
				end
				if kg_GetDis( Boss , 780986 , 0 )>350  and ReadRoleValue(Boss, EM_RoleValue_Register2)==0 then--在地上模式超出距離
					--Say(Boss,"z144_boss5 out of range");
					DebugMsg(0,RoomID,"z144_boss5 out of range");
					CallPlot( Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl , "Lua_Zone22_105976_DelObj" , 1 );
					return
				end
				if timer==360 and level==0  then
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_BOSSCRAZY]" , C_SYSTEM )--Boss狂暴
					AddBuff(Boss,620561 ,0,-1);
				end
				sleep(20)
				timer=timer+2;
			end
		end
	end
	if Lua_Zone22_105976_LockHpEvent==nil or override==1 then
		Lua_Zone22_105976_LockHpEvent = function()
			local Boss = OwnerID();
			if ReadRoleValue(Boss , EM_RoleValue_Register2)==0 then
				WriteRoleValue(Boss ,EM_RoleValue_Register2,1);
			end
		end
	end
	if Lua_Zone22_105976_MonsterAI==nil or override==1 then
		Lua_Zone22_105976_MonsterAI = function( MonsterSwitch )
			local Monster = OwnerID();
			if MonsterSwitch ==1 then	--魔法符能體
				local TargetFlagID = 0; local FlagID = 780986;
				local x,y,z;
				TargetFlagID = kg_Rand( 4,GetMoveFlagCount(780986)-1);
				if TargetFlagID==ReadRoleValue(Monster, EM_RoleValue_Register1 ) then
					TargetFlagID = TargetFlagID+1;
				end
				if TargetFlagID>( GetMoveFlagCount(FlagID)-1 ) then TargetFlagID=3 end
				x,y,z,_=kg_GetPosRX( {FlagID,TargetFlagID} , nil , Rand( 50 ) , 0 ,Rand(360) );
				MoveDirect( Monster , x,y,z );
				Sleep(30);
				local SkillInfo = Lua_Zone22_105976_SkillInfo( ReadRoleValue(Monster , EM_RoleValue_PID) , 1 );--PID有存放難度
				local Skill = SkillInfo[4];--自爆
				CastSpellLv( Monster , Monster , Skill.ID , Skill.Lv  ); Sleep(5); DelObj(Monster);
			elseif MonsterSwitch==2 then	--火
				local TargetFlagID = 0; local FlagID = 780986;
				local x,y,z;
				local CurrentFlag = ReadRoleValue(Monster, EM_RoleValue_Register1 );
				while 1 do
					TargetFlagID = kg_Rand( 4,GetMoveFlagCount(780986)-1);
					if TargetFlagID==CurrentFlag then
						TargetFlagID = TargetFlagID+1;
					end
					if TargetFlagID>( GetMoveFlagCount(FlagID)-1 ) then TargetFlagID=3 end
					x,y,z,_=kg_GetPosRX( {FlagID,TargetFlagID} , nil , Rand( 50 ) , 0 ,Rand(360) );
					LuaFunc_WaitMoveTo( Monster, x,y,z );
					CurrentFlag = TargetFlagID;
					Sleep(10);
				end
			elseif MonsterSwitch==3 then	--水
				local Skillinfo = Lua_Zone22_105976_SkillInfo( ReadRoleValue(Monster , EM_RoleValue_PID) , 1 );
				local Skill = SkillInfo[7]; Skillinfo = nil;
				local atkTarget=0;
				local TmpHateList  , PlayersInHate= {} , {};
				local SkillTimer = 0;
				local Boss = Lua_Zone22_EternalTowerWS_Boss5[ ReadRoleValue(Monster,EM_RoleValue_RoomID) ].Boss;
				Sleep(20);
				AddBuff( Monster , 620670 , 0,-1 );--寒冰典藏靈氣
				while 1 do
					SkillTimer = SkillTimer+1;
					PlayersInHate = KS_GetHateList( Boss , 4 );
					atkTarget = ReadRoleValue( Monster , EM_RoleValue_AttackTargetID );
					if CheckBuff( atkTarget , 620660 )==true then
						TmpHateList={};
						for i in pairs(  PlayersInHate) do
							if CheckBuff( PlayersInHate[i] , 620660 )~=true then
								table.insert( TmpHateList , PlayersInHate[i] );
							end
						end
						if #TmpHateList>0 then
							atkTarget = PlayersInHate[math.random(#TmpHateList)];
							SetAttack( Monster , atkTarget );
						end
					end
					if SkillTimer==4 then
						if #PlayersInHate>0  then
							atkTarget = PlayersInHate[math.random(#PlayersInHate)];
							CastSpellLv( Monster , atkTarget , Skill.ID , Skill.Lv );
						end
						SkillTimer=0;
					end
					Sleep(10);
				end
			end
		end
	end
	if Lua_Zone22_105976_TouchFeather==nil or override==1 then
		Lua_Zone22_105976_TouchFeather = function()
			local Oid= OwnerID();--玩家
			local Tid=TargetID();--羽毛
			if ReadRoleValue( Oid ,EM_RoleValue_IsPlayer )==1  then
				if ReadRoleValue( Tid , EM_RoleValue_Register1 )==0  and  CheckBuff( Oid , 620660 )~=true then --被寒冰典藏的人無法剪取羽毛
					WriteRoleValue( Tid ,EM_RoleValue_Register1 ,1);
					SetPlot( Tid , "touch","" , 30 );--關閉觸碰劇情
					SysCastSpellLv( Tid , Oid , 497388 , 0 );--落羽能量
					BeginPlot( Tid , "Lua_Zone22_105976_TouchFeather" ,0 );
					SetModeEx( Tid , EM_SetModeType_Mark, false);
					SetModeEx( Tid , EM_SetModeType_Show, false);
				end
			else
				Sleep(20);
				DelObj( Oid );
			end
		end
	end
end

function Lua_Zone22_105976_BossInit()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl , EM_RoleValue_RoomID);
	--全域變數
	if type(Lua_Zone22_EternalTowerWS_Boss5)~="table" then
		Lua_Zone22_EternalTowerWS_Boss5 = {};
	end
	if type(Lua_Zone22_EternalTowerWS_Boss5[RoomID])~="table" then
		Lua_Zone22_EternalTowerWS_Boss5[RoomID] = {};
	end
	--function宣告
	Lua_Zone22_105976_FunctionsInit();
	--初始化
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].Ctrl = Ctrl;
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor=0;
	Lua_Zone22_105976_BossCreate();
end

function Lua_Zone22_105976_BossAI()--Boss進入戰鬥後啟動
	local Boss = OwnerID();
	if ReadRoleValue(Boss,EM_RoleValue_Register1)==0 then--將模板的進入戰鬥pcall轉換
		WriteRoleValue( Boss , EM_RoleValue_Register1,1 );
		BeginPlot( Boss, "Lua_Zone22_105976_BossAI" , 0 );
		return
	end
	local RoomID = ReadRoleValue(Boss,EM_RoleValue_RoomID);
	local EnterDoor = CreateObjByFlag( 103126, 780986 , 1 , 1 )--入口阻擋門
	Lua_Zone22_EternalTowerWS_Boss5[RoomID].EnterDoor = EnterDoor;
	kg_DoorInit( EnterDoor );
	AddToPartition( EnterDoor , RoomID );
	
	BeginPlot( Boss , "Lua_Zone22_105976_BossCrazy" , 0 );
	local CurrentLockHP=0.9; local BossMaxHP = ReadRoleValue(Boss,EM_RoleValue_MaxHP);
	LockHP( Boss , BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
	local level = ReadRoleValue( Boss , EM_RoleValue_PID );
	local SkillInfo = Lua_Zone22_105976_SkillInfo( level , 1 );
	local BuffLv = Lua_Zone22_105976_SkillInfo( level , 2 );
	local MonsterIDs = Lua_Zone22_105976_SkillInfo( level , 4 );
	local CurrentSkill ,atkTarget , PlayersInHate = 0,0,{};
	local Timer,ChangeFormTimer = 1,1;
	local FlyUp=0;
	local RandNum=0;
	local FireMonsterArray={};
	local TempBoss,TempVar , TempArray= 0,0,{};
	local SampleFlagID = {};
	for i = 4 , GetMoveFlagCount( 780986 )-1 do
		table.insert( SampleFlagID , i );
	end
	if level ==0 then
		TempBoss = kg_GetPosRX( Boss , 105718 );--負責在空中飛的分身(正常)
	elseif level ==1 then
		TempBoss = kg_GetPosRX( Boss , 106734  );--負責在空中飛的分身(簡易)
	end
	
	MoveToFlagEnabled( TempBoss , false );
	--SetModeEx( TempBoss , EM_SetModeType_Strikback, false); ---反擊(否)
	SetModeEx( TempBoss , EM_SetModeType_Fight, false); ---可砍殺(否)
	--SetModeEx( TempBoss , EM_SetModeType_Searchenemy, false);--不索敵
	SetModeEx( TempBoss , EM_SetModeType_Move, false); ---移動	(否)
	SetModeEx( TempBoss , EM_SetModeType_Gravity, false);--重力
	SetDefIdleMotion( TempBoss , ruFUSION_MIME_CRAFTING_LOOP );
	AddBuff(TempBoss ,507899,0,-1);--不可攻擊BUFF
	ScriptMessage( Boss , -1 , 2 , "[SC_105976_FIGHT]" , C_SYSTEM )--進入戰鬥台詞
	math.randomseed(math.random(1, 99999));
	Sleep(10);
	while 1 do
		if KS_InCombat(Boss)==true then
			
			if ChangeFormTimer>=23 then	--飛天計時器
				ChangeFormTimer=1;
				if ReadRoleValue( Boss, EM_RoleValue_Register2 )==0 then
					WriteRoleValue( Boss , EM_RoleValue_Register2  , 1);
				end
			end
			if ReadRoleValue( Boss, EM_RoleValue_Register2 )==0 then--地上模式
				ChangeFormTimer = ChangeFormTimer+1; --DebugMsg(0,0,"ChangeFormTimer="..ChangeFormTimer);
				if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0 then
					if  timer%7==0 then
						RandNum = math.random( 100 );
						if RandNum>50 then
							CurrentSkill=1;--魔法球
							TempArray = {};
							PlayersInHate = KS_GetHateList( Boss , 4 );
							for i,v in ipairs(PlayersInHate) do
								TempVar = GetDistance( Boss , v );
								if TempVar>=150 and TempVar<=1000 then
									table.insert( TempArray , v );
								end
							end
							if #TempArray>0 then
								atkTarget = TempArray[math.random(#TempArray)];
							else
								atkTarget = PlayersInHate[math.random(#PlayersInHate)]; DebugMsg(0,0,"NoFarPlayer");
							end
							CastSpellLv( Boss , atkTarget , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						else
							CurrentSkill=2;--爪壓
							--atkTarget = ReadRoleValue(Boss, EM_RoleValue_AttackTargetID);
							CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						end
					elseif timer%13==0 then
						CurrentSkill = 3;--橫掃AE
						CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
					elseif timer%15==0 then
						--叫小隻的
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_CREATEMAGIC]" , C_SYSTEM );
						TempArray={};
						TempArray  = KS_RegroupArray( SampleFlagID , 2 );
						for i = 1,2 do
							TempVar = kg_GetPosRX( { 780986,TempArray[i] } ,MonsterIDs[1] );
							MoveToFlagEnabled( TempVar, false );
							WriteRoleValue(TempVar , EM_RoleValue_PID , level);
							WriteRoleValue( TempVar , EM_RoleValue_Register1 , TempArray[i] );--出生點旗標
							SetModeEx( TempVar , EM_SetModeType_Revive, false );
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)---索敵(否)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---反擊(否)
							AddToPartition( TempVar,RoomID );
							CallPlot( TempVar ,"Lua_Zone22_105976_MonsterAI",1 );
						end
					end
					timer = timer+1; --DebugMsg(0,0,"timer="..timer);
				end
			elseif ReadRoleValue( Boss, EM_RoleValue_Register2 )==1  and ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0  then--上空模式
				if FlyUp==0 then--飛行鎖
					--LockHP( Boss , BossMaxHP*CurrentLockHP , "" );
					CurrentLockHP = CurrentLockHP-0.1;
					if CurrentLockHP>0 then
						LockHP( Boss, BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
					end
					CurrentSkill=5;--魔法吐息
					FlyUp=1; timer=1;
					ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLY]" , C_SYSTEM );
					SetModeEx( Boss , EM_SetModeType_Mark, false);
					SetModeEx( Boss , EM_SetModeType_Move, false); ---移動	(否)
					--SetModeEx( Boss , EM_SetModeType_Strikback, false); ---反擊(否)
					SetModeEx( Boss , EM_SetModeType_Fight, false); ---可砍殺(否)
					--SetModeEx( Boss , EM_SetModeType_Searchenemy, false);--不索敵
					SetModeEx( Boss , EM_SetModeType_Gravity, false);--重力
					PlayMotion( Boss, ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
					SetDefIdleMotion( Boss , ruFUSION_MIME_CRAFTING_LOOP );
					Sleep(20);--等到飛上天
					WriteRoleValue( TempBoss , EM_RoleValue_X , ReadRoleValue(Boss,EM_RoleValue_X) );
					WriteRoleValue( TempBoss , EM_RoleValue_Y , ReadRoleValue(Boss,EM_RoleValue_Y) );
					WriteRoleValue( TempBoss , EM_RoleValue_Z , ReadRoleValue(Boss,EM_RoleValue_Z) );
					WriteRoleValue( TempBoss , EM_RoleValue_Dir , ReadRoleValue(Boss,EM_RoleValue_Dir) );
					WriteRoleValue( TempBoss , EM_RoleValue_HP , ReadRoleValue(Boss ,EM_RoleValue_HP) );
					--Hide(Boss);
					SetModeEx( Boss , EM_SetModeType_Show ,false);
					--Show(Boss ,RoomID);
					AddToPartition( TempBoss , RoomID );
					CancelBuff( TempBoss , 620652 );--避免上次飛天的buff殘留
					PlayersInHate = KS_GetHateList( Boss ,4 );
					if #PlayersInHate>0 then
						for i in pairs( PlayersInHate ) do
							SysCastSpellLv( PlayersInHate[i],TempBoss,497448,0 )--強制仇恨1
						end
					end
					Sleep(10);
					SetPos( Boss , kg_GetPosRX( {780986,3},nil,120,5,180 ) );--將本尊傳送到神祕角落
					AddBuff(TempBoss , 508887 , 0 , -1 );--不回血
					AddBuff( TempBoss ,620652 , BuffLv ,-1 );--20層法能意志
					WriteRoleValue( TempBoss , EM_RoleValue_Register3,1 );
					--產生火跟水
					if #PlayersInHate>0 then
						FireMonsterArray ={};
						local FireCount = 3;--小火的數量
						if level==1 then
							FireCount = 1;
						end
						for i =1,FireCount do
							RandNum = math.random(4,GetMoveFlagCount(780986)-1);
							TempVar = kg_GetPosRX( {780986,RandNum} , MonsterIDs[2] , Rand(30) , 0 , Rand(360) );
							table.insert( FireMonsterArray , TempVar );
							MoveToFlagEnabled( TempVar, false );
							WriteRoleValue(TempVar , EM_RoleValue_PID , level);
							WriteRoleValue( TempVar , EM_RoleValue_Register1 , RandNum );--出生點旗標
							SetModeEx( TempVar , EM_SetModeType_Revive, false );
							SetModeEx( TempVar , EM_SetModeType_Mark, false)	----可點選(否)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---反擊(否)
							SetModeEx( TempVar , EM_SetModeType_Fight, false) ---可砍殺(否)
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)	---索敵(否)
							AddToPartition( TempVar , RoomID );
							if level == 0 then
								AddBuff( TempVar , 620673 , 0,-1 );--自燃現象靈氣
							elseif level==1 then
								AddBuff( TempVar , 622283 , 0,-1 );--自燃現象靈氣
							end
							CallPlot( TempVar , "Lua_Zone22_105976_MonsterAI" , 2 );
						end
						RandNum = math.random(4,GetMoveFlagCount(780986)-1);
						TempVar = kg_GetPosRX( {780986,RandNum} , MonsterIDs[3] , Rand(100) , 0 , Rand(360) );
						MoveToFlagEnabled( TempVar, false );
						WriteRoleValue(TempVar , EM_RoleValue_PID , level);
						SetModeEx( TempVar , EM_SetModeType_Revive, false );
						AddToPartition( TempVar , RoomID );
						CallPlot( TempVar , "Lua_Zone22_105976_MonsterAI" , 3 );
					end
					
				end
				if timer>=30 or CheckBuff( TempBoss , 620652 )~=true then	--進入下降模式
					FlyUp=0; timer=1; ChangeFormTimer=1;
					WriteRoleValue( TempBoss , EM_RoleValue_Register3,0 );--不能再用羽毛攻擊
					if CheckBuff( TempBoss , 620652 )==true then
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLOOR]" , C_SYSTEM );
						AddBuff( Boss , 620652 , KS_CheckBuffLV(TempBoss,620652) -1 , -1 );
					else
						ScriptMessage( Boss , -1 , 2 , "[SC_105976_FLOORNOBUFF]" , C_SYSTEM );
					end
					SetPos( Boss , kg_GetPos(TempBoss) ); SetDir( Boss , ReadRoleValue(TempBoss,EM_RoleValue_Dir) );
					DelFromPartition( TempBoss );
					SetModeEx( Boss , EM_SetModeType_Gravity, true);--重力
					SetModeEx( Boss , EM_SetModeType_Show ,true);
					SetModeEx( Boss , EM_SetModeType_Mark, true);
					Sleep(10);
					PlayMotion( Boss, ruFUSION_ACTORSTATE_CRAFTING_END );
					SetDefIdleMotion( Boss , ruFUSION_MIME_IDLE_STAND );
					Sleep(20);
					for i in pairs( FireMonsterArray ) do
						DelObj( FireMonsterArray[i] );
					end
					FireMonsterArray = {};
					CurrentSkill=6;	--降落全場AE
					CastSpellLv( Boss , Boss , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
--					if math.abs(ReadRoleValue( Boss ,EM_RoleValue_HP )-BossMaxHP*CurrentLockHP)<=BossMaxHP*0.01 then
--						CurrentLockHP = CurrentLockHP-0.1;
--					end
--					if CurrentLockHP>0 then
--						LockHP( Boss, BossMaxHP*CurrentLockHP , "Lua_Zone22_105976_LockHpEvent" );
--					end
					SetModeEx( Boss , EM_SetModeType_Move, true); ---移動	(否)
					--SetModeEx( Boss , EM_SetModeType_Strikback, true); ---反擊(否)
					SetModeEx( Boss , EM_SetModeType_Fight, true); ---可砍殺(否)
					--SetModeEx( Boss , EM_SetModeType_Searchenemy, true);--不索敵
					Sleep(20);
					CancelBuff( Boss , 620652 );--消除法能意志
					WriteRoleValue( Boss , EM_RoleValue_Register2,0 );--進入地面型態
				elseif timer%2==0 then--空中導彈模式
					PlayersInHate = KS_GetHateList( Boss , 4 );
					if #PlayersInHate>0 then
						atkTarget=PlayersInHate[ math.random(#PlayersInHate) ];
						SetDir(TempBoss, CalDir( ReadRoleValue(atkTarget,EM_RoleValue_X)-ReadRoleValue(TempBoss,EM_RoleValue_X),ReadRoleValue(atkTarget,EM_RoleValue_Z)-ReadRoleValue(TempBoss,EM_RoleValue_Z) ) );
						SysCastSpellLv( TempBoss , atkTarget , SkillInfo[CurrentSkill].ID , SkillInfo[CurrentSkill].Lv );
						--產生羽毛
						TempArray={};
						if #SampleFlagID>6 then
							TempArray=KS_RegroupArray( SampleFlagID , 6 );
						else
							TempArray = KS_RegroupArray( SampleFlagID  );
						end
						for i =1,#TempArray do
							TempVar = kg_GetPosRX( {780986 , TempArray[i] } , 105977,Rand(60),0,Rand(360) );
							WriteRoleValue( TempVar , EM_RoleValue_LiveTime ,8);
							MoveToFlagEnabled( TempVar, false );
							SetModeEx( TempVar , EM_SetModeType_Move, false) ---移動	(否)
							SetModeEx( TempVar , EM_SetModeType_Mark, true)	----可點選(否)
							SetModeEx( TempVar , EM_SetModeType_ShowRoleHead, false) 	---頭像框(否)
							SetModeEx( TempVar , EM_SetModeType_Strikback, false) ---反擊(否)
							SetModeEx( TempVar , EM_SetModeType_Fight, false) ---可砍殺(否)
							SetModeEx( TempVar , EM_SetModeType_Searchenemy, false)	---索敵(否)
							AddToPartition( TempVar , RoomID );
							SetCursorType( TempVar , eCursor_Interact ); --游標變成 齒輪
							SetPlot( TempVar , "touch","Lua_Zone22_105976_TouchFeather" , 30 );
						end
					end
				end
				timer = timer+1; --DebugMsg(0,0,"Flying Timer="..timer );
			end
		else
			--脫離戰鬥
			break
		end
		Sleep(10);
	end
end

function Lua_Zone22_105976_FeatherSkill()
	local Oid =OwnerID();--玩家
	local Boss = TargetID();
	local BuffLv=0;
	if CheckBuff( Boss ,620652)==true then
		--CancelBuff( Oid , 620661 );--殘餘能量
		BuffLv = KS_CheckBuffLV( Boss , 620652 );--取得BOSS身上的Buff等級
		--DebugMsg(0,0,"Boss BuffLv="..BuffLv);
		BuffLv = BuffLv-2;
		CancelBuff( Boss, 620652 );
		if BuffLv>=0 then
			AddBuff( Boss , 620652 , BuffLv , -1 );
		end
	end
end

function Lua_Zone22_105976_CheckBoss()
	local Oid = OwnerID();
	local Boss = TargetID();
	local OrgID = ReadRoleValue( Boss , EM_RoleValue_OrgID );
	if (OrgID==105718 or OrgID==106734 ) and CheckBuff( Boss ,620652)==true and ReadRoleValue(Boss,EM_RoleValue_Register3)==1 then
		CancelBuff( Oid , 620661 );--殘餘能量
		return true
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
	return false
end