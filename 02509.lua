function Lua_Z23_106298_SkillInfo( mode , level )--init: 初始化 reset : 強制設定skillinfo
	if mode=="init" or mode=="reset" then
		if Z23_Maggot_Global.SkillID==nil or mode=="reset" then
			Z23_Maggot_Global.SkillID={		--法術ID
				498443,	--巨蟲嗜咬
				498444,	--巨蟲翻滾
				498445,	--噴發汁液AE
				498446,	--Boss鑽地
				498449,	--毒水AE
				498451  --劇毒噴發
			};
		end
		if Z23_Maggot_Global.SkillLV==nil or mode=="reset" then
			if level ==1 then
				Z23_Maggot_Global.SkillLV={	--普通
					1,	--巨蟲嗜咬
					1,	--巨蟲翻滾
					1,	--噴發汁液AE
					5,	--Boss鑽地
					2,	--毒水AE
					2	--劇毒噴發
				};
			elseif level==2 then
				Z23_Maggot_Global.SkillLV={	--簡單
					0,	--巨蟲嗜咬
					0,	--巨蟲翻滾
					0,	--噴發汁液AE
					0,	--Boss鑽地
					0,--毒水AE
					0--劇毒噴發
				};
			else
				Z23_Maggot_Global.SkillLV={	--困難
					2,	--巨蟲嗜咬
					2,	--巨蟲翻滾
					2,	--噴發汁液AE
					8,	--Boss鑽地
					2,	--毒水AE
					4--劇毒噴發
				};
			end
		end
	end
end

function Lua_Z23_106298_FunctionInit( override )
	local zone = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	local Bosss = {106307,107196,107199}
	local ZoneID = {146,147,148}
	local Eggg = {106310,107198,107201}
	local Bux = {106308,107197,107200}
	if zone == zoneID[1] then
		Bosss = Bosss[1]
		Eggg = Eggg[1]
		Bux = Bux[1]
	elseif zone == zoneID[2] then
		Bosss = Bosss[2]
		Eggg = Eggg[2]
		Bux = Bux[2]
	elseif zone == zoneID[3] then
		Bosss = Bosss[3]
		Eggg = Eggg[3]
		Bux = Bux[3]
	
	end	
	if Lua_Z23_106298_MaggotDead==nil or override==true then
		Lua_Z23_106298_MaggotDead = function()
			local Obj=OwnerID();
			local OrgID =ReadRoleValue(Obj, EM_RoleValue_OrgID);
			if OrgID==Bosss then--Boss
				ScriptMessage( Obj , -1 , 2 , "[SC_106298_DEAD]" , C_SYSTEM );--Boss死亡
				CallPlot( ReadRoleValue( Obj , EM_RoleValue_Register1 ) , "Lua_Z23_106298_MaggotReset" , 2 );
			elseif OrgID == Bux then--小蟲
				local Water = kg_GetPos( Obj , 106311 );
				MoveToFlagEnabled( Water,false );
				SetModeEx( Water , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( Water , EM_SetModeType_Revive, false );	--可重生
				SetModeEx( Water , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( Water , EM_SetModeType_Fight, false) ---可砍殺(否)
				SetModeEx( Water , EM_SetModeType_Searchenemy, false)	---索敵(否)
				SetModeEx( Water , EM_SetModeType_HideName, false)	---名稱(否)
				SetModeEx( Water , EM_SetModeType_NotShowHPMP, true)  ---顯示HP(否)				
				WriteRoleValue(Water ,EM_RoleValue_LiveTime , 60);
				AddToPartition( Water , ReadRoleValue(Obj ,EM_RoleValue_RoomID) );
				CastSpellLv( Water , Water , Z23_Maggot_Global.SkillID[5] , Z23_Maggot_Global.SkillLV[5]);--留下毒水
				return true
			elseif OrgID == Eggg then--蟲蛹
				
			end
		end
	end
	
	if Lua_Z23_106298_MaggotReset==nil or override==true then
		Lua_Z23_106298_MaggotReset = function( mode )--1:重置 , 2:Boss死亡 , 其他: 全都刪
			local Ctrl = OwnerID();
			local RoomID =ReadRoleValue( Ctrl , EM_RoleValue_RoomID );
			local Boss= Z23_Maggot_Global[RoomID].Boss;
			local Eggs = Z23_Maggot_Global[RoomID].Eggs;
			if Eggs~=nil then
				for i in pairs( Eggs ) do
					DelObj(Eggs[i]);
				end
			end
			Z23_Maggot_Global[RoomID].Eggs=nil;
			local NpcCount = SetSearchAllNPC(RoomID);
			local NpcGid , NpcOrgid = 0,0;
			for i = 1 , NpcCount do
				NpcGid = GetSearchResult();
				NpcOrgid = ReadRoleValue( NpcGid ,EM_RoleValue_OrgID );
				if NpcOrgid==Bux or NpcOrgid==106309 or NpcOrgid==106311 then
					DelObj(NpcGid );
				end
			end
			
			if mode==1 then
				DelObj(Boss[1]);  DelObj(Boss[2]);
				--CallPlot( Z23_Maggot_Global[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , false );--入口開門
				Delobj(Z23_Maggot_Global[RoomID].EnterDoor)
				CallPlot( Ctrl , "Lua_Z23_106298_CreateObj" , "Boss" , 6 );--6秒後重生Boss
				sleep(60)
				Lua_Z23_106298_CreateObj("Eggs");
			elseif mode==2 then
				--刪除出口入口
				if Z23_Maggot_Global[RoomID].EnterDoor~=nil then DelObj( Z23_Maggot_Global[RoomID].EnterDoor ); end
				if Z23_Maggot_Global[RoomID].ExitDoor~=nil then DelObj( Z23_Maggot_Global[RoomID].ExitDoor ); end
				Z23_Maggot_Global[RoomID].EnterDoor=nil ; Z23_Maggot_Global[RoomID].ExitDoor=nil;
				Z23_Maggot_Global[RoomID].Boss=nil;
			else
				if Z23_Maggot_Global[RoomID].EnterDoor~=nil then DelObj( Z23_Maggot_Global[RoomID].EnterDoor ); end
				if Z23_Maggot_Global[RoomID].ExitDoor~=nil then DelObj( Z23_Maggot_Global[RoomID].ExitDoor ); end
				Z23_Maggot_Global[RoomID].EnterDoor=nil ; Z23_Maggot_Global[RoomID].ExitDoor=nil;
				DelObj(Boss[1]);  DelObj(Boss[2]);
				Z23_Maggot_Global[RoomID].Boss=nil;
			end
		end
	end
	
	if Lua_Z23_106298_CreateObj==nil or override==true then
		Lua_Z23_106298_CreateObj = function( mode , waitTime )
			local Ctrl = OwnerID();
			local RoomID = ReadRoleValue( Ctrl , EM_RoleValue_RoomID );
			if mode == "Eggs" then
				if Z23_Maggot_Global[RoomID].Eggs==nil then
					Z23_Maggot_Global[RoomID].Eggs ={};
				end
				local Eggs = Z23_Maggot_Global[RoomID].Eggs;
				local tempEgg;
				local  egga = 0
				if zone == zoneID[1] then
					egga = 3
				else
					egga = 5
				end
				for i=egga,7 do
					if Eggs[i]==nil or CheckID( Eggs[i] )~=true or ReadRoleValue(Eggs[i] , EM_RoleValue_IsDead)==1 then
						tempEgg = kg_GetPosRX( {781031,i} , Eggg );
						Z23_Maggot_Global[RoomID].Eggs[i]=tempEgg;
						MoveToFlagEnabled( tempEgg,false );
						SetModeEx( tempEgg , EM_SetModeType_Move, false) ---移動	(否)
						SetModeEx( tempEgg , EM_SetModeType_Revive, false );	--可重生
						SetModeEx( tempEgg , EM_SetModeType_Strikback, false) ---反擊(否)
						SetModeEx( tempEgg , EM_SetModeType_Fight, false) ---可砍殺(否)
						SetModeEx( tempEgg , EM_SetModeType_Searchenemy, false)	---索敵(否)
						AddToPartition( tempEgg , RoomID );
						SetPlot( tempEgg , "dead" ,"Lua_Z23_106298_MaggotDead",0 );
						AddBuff( tempEgg , 621053 , 0 ,-1 );--反射buff的盾
					end
				end
				Z23_Maggot_Global[RoomID].Eggs = Eggs;
				DebugMsg(0,0,"Z23_Maggot_Eggs Count =  "..#Eggs );
				return Eggs;
			elseif mode=="Boss" then
				WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 0  );--雙Boss只能有一隻在場的鎖定
				if type(waitTime)=="number" then  Sleep(waitTime*10); end
				Z23_Maggot_Global[RoomID].Boss={}
				local Boss = kg_GetPosRX( {781031,0}, Bosss );
				Z23_Maggot_Global[RoomID].Boss[1] = Boss;
				Boss = kg_GetPosRX( {781031,8}, Bosss );
				Z23_Maggot_Global[RoomID].Boss[2] = Boss;
				Boss = Z23_Maggot_Global[RoomID].Boss;
				WriteRoleValue( Boss[2] , EM_RoleValue_Register5 , 1 );--15秒招式開關
				SetModeEx( Boss[2] , EM_SetModeType_Show, false );
				SetModeEx( Boss[2] , EM_SetModeType_Strikback, false); ---反擊(否)
				SetModeEx( Boss[2] , EM_SetModeType_Fight, false); ---可砍殺(否)
				SetModeEx( Boss[2] , EM_SetModeType_Mark, false);	----可點選(否)
				SetModeEx( Boss[2] , EM_SetModeType_Searchenemy, false);
				for i=1,2 do
					WriteRoleValue( Boss[i] , EM_RoleValue_Register1 , Ctrl );
					MoveToFlagEnabled( Boss[i],false );
					SetModeEx( Boss[i] , EM_SetModeType_Revive, false );	--可重生
					AddToPartition( Boss[i], RoomID );
					SetPlot( Boss[i] , "dead" , "Lua_Z23_106298_MaggotDead" , 30 );
				end
				SetPlot( Boss[2] , "range" , "Lua_Z23_106298_RangePlot" , 100 );
				AddBuff( Boss[2] , 621072 , 0,-1 );--10倍能力
			elseif mode=="Doors" then
				if Z23_Maggot_Global[RoomID].ExitDoor == nil or CheckID( Z23_Maggot_Global[RoomID].ExitDoor )~=true then
					local ExitDoor = CreateObjByFlag( 106223, 781031 , 1 , 1 )--出口阻擋門
					Z23_Maggot_Global[RoomID].ExitDoor = ExitDoor;
					kg_DoorInit( ExitDoor );
					AddToPartition( ExitDoor , RoomID );
					CallPlot( ExitDoor , "Lua_Zone21_CloseDoor" , true );--關門
				end
				if Z23_Maggot_Global[RoomID].EnterDoor == nil or CheckID( Z23_Maggot_Global[RoomID].EnterDoor )~=true then
					--local EnterDoor = CreateObjByFlag( 106223, 781031 , 2 , 1 )--入口阻擋門
					--Z23_Maggot_Global[RoomID].EnterDoor = EnterDoor;
					--kg_DoorInit( EnterDoor );
					--AddToPartition( EnterDoor , RoomID );
					--CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--開門
					--Delobj(EnterDoor)
				end
--			elseif mode=="Ctrl2" then
--				local Ctrl2 = kg_GetPosRX( {781031,7}, ReadRoleValue( Ctrl , EM_RoleValue_OrgID ) );
--				Z23_Maggot_Global[RoomID].Ctrl2 = Ctrl2;
--				kg_InvisibleObjInit(Ctrl2);
--				AddToPartition( Ctrl2 ,RoomID );
--				SetPlot( Ctrl2 , "range" , "Lua_Z23_106298_RangePlot" , 100 );
			end
		end
	end
	
	if Lua_Z23_106298_MaggotCrazy==nil or override==true then
		Lua_Z23_106298_MaggotCrazy = function()
			local Boss= OwnerID();
			local timer = 0;
			while 1 do
				if kg_GetDis( Boss , 781031 , 0 )>600 and ReadRoleValue(Boss, EM_RoleValue_Register2)==0 then
					DebugMsg(0,0,"boss out of range");
					CallPlot( ReadRoleValue(Boss , EM_RoleValue_Register1) ,"Lua_Z23_106298_MaggotReset",1);
					return
				end
				if timer==480  then
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_CRAZY]" , C_SYSTEM )--Boss狂暴
					AddBuff(Boss,620561 ,0,-1);
				end
				sleep(20)
				timer=timer+2;
			end
		end
	end
	
	if Lua_Z23_106298_BugAI==nil or override==true then
		Lua_Z23_106298_BugAI = function( Boss , Player )	--小蟲AI
			local Bug = OwnerID();
			local BugOrgID = ReadRoleValue( Bug ,EM_RoleValue_OrgID );
			
			if BugOrgID ==Bux then
				if type(Boss)~="number" then DelObj(Bug);  DebugMsg(0,0,"Z23_Boss2_Maggot Error"); return;  end
				while 1 do
					if KS_InCombat(Boss)~=true then
						--Say(Bug , "Boss leave Combat ...");
						DelObj(  Bug  );
						return
					else
						if GetDistance( Bug , Boss )<=50 then
							--Say(Bug , "Boss dessert time");
							AddBuff( Boss , 621050 , 0 , -1);
							DelObj(Bug);
							return
						end
					end
					if CheckID(Player)~=true or ReadRoleValue(Player,EM_RoleValue_IsDead)==1 then
						--Say(Bug , "Change Target!!");
						local PlayersInHate = KS_GetHateList(Boss,4);
						Player=PlayersInHate[ math.random(#PlayersInHate) ];
						CancelBuff( Bug , 507181 )--取消挑釁
						SysCastSpellLv( Player, Bug, 495767, 0 )--單體最高級挑釁
					end
					Sleep(10);
				end
			elseif BugOrgID == 106309 then
				CastSpell( Bug , Bug , 498448 );--施展遁地小範圍劇情
				local x,y,z,_ = kg_GetPosRX( Bug , nil , 350  );--鑽地蟲移動距離在此調整
				LuaFunc_WaitMoveTo(Bug , x,y,z);
				DelObj( Bug );
			elseif BugOrgID == Eggg then
				local Bugtime = 0
				while 1 do
					
					if KS_InCombat(Boss)==true then
					Bugtime = Bugtime +1
						
						if Bugtime >= 15 then
							SysCastSpellLv( Bug , Bug , Z23_Maggot_Global.SkillID[6] , Z23_Maggot_Global.SkillLV[6] );
							Bugtime = 0
							sleep(10)
							DelObj( Bug )
						else
							SysCastSpellLv( Bug , Bug , Z23_Maggot_Global.SkillID[3] , Z23_Maggot_Global.SkillLV[3] );
						end
					else
						break
					end
					Sleep(10);
				end
			end
		end
	end
	
	if Lua_Z23_106298_BugWave==nil or override==true then
		Lua_Z23_106298_BugWave= function(x)
			--local RandDir  = RandRange( 3,6 ); DebugMsg( 0,0,"WaveDir="..RandDir ); --四方位隨機挑一
			local RandDir = x
			--local RandPos = RandRange( 1,5 ); DebugMsg( 0,0,"WavePos="..RandPos ); --5通道隨機挑一
			local RandPos = {}
			RandPos = Az_RND_Ary(1,5,2); --DebugMsg( 0,0,"WavePos="..RandPos ); --5通道隨機挑一
			local tempBug;
			local Dis , Angle = 100,90;
			local dMultiple={2,1,0,1,2};
			local aMultiple = {1,1,0,-1,-1};
			for i =1,5 do
				if i~=RandPos[1] and i~=RandPos[2] then
					tempBug = kg_GetPosRX( {781031 , RandDir} , 106309,  Dis*dMultiple[i] , 0 , Angle*aMultiple[i]  ,-3 );
					MoveToFlagEnabled( tempBug,false );
					SetModeEx( tempBug , EM_SetModeType_Revive, false );	--可重生
					SetModeEx( tempBug , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( tempBug , EM_SetModeType_Fight, false) ---可砍殺(否)
					SetModeEx( tempBug , EM_SetModeType_Searchenemy, false)	---索敵(否)
					AddToPartition( tempBug , ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) );--owner 為boss
					AddBuff( tempBug , 621049 , 0,-1 );--遁地特效
					BeginPlot( tempBug , "Lua_Z23_106298_BugAI" , 0 );
				end
			end
		end
	end
	
	if Lua_Z23_106298_BugSkill==nil or override==true then
		Lua_Z23_106298_BugSkill= function(mode)
			local Oid , Tid = OwnerID(), TargetID();
			if mode==1 then	--遁地蟲咬到玩家
				local Bug = kg_GetPos( Oid , Bux );
				local RoomID = ReadRoleValue(Oid , EM_RoleValue_RoomID);
				local Boss = Z23_Maggot_Global[RoomID].Boss;
				MoveToFlagEnabled( Bug,false );
				SetModeEx( Bug , EM_SetModeType_Revive, false );	--可重生
				AddToPartition( Bug , RoomID );
				SetPlot( Bug , "dead" , "Lua_Z23_106298_MaggotDead" , 30 );
				SysCastSpellLv( Tid, Bug, 495767, 0 )--單體最高級挑釁
				CallPlot( Bug , "Lua_Z23_106298_BugAI" , Boss[1] , Tid );
				DelObj( Oid );
			end
		end
	end
end

function Lua_Z23_106298_MaggotInit()
	local Ctrl = OwnerID();
	local RoomID = ReadRoleValue(Ctrl ,EM_RoleValue_RoomID);
	if type(Z23_Maggot_Global)~="table" then
		Z23_Maggot_Global = {};
	end
	if type(Z23_Maggot_Global[RoomID])~="table" then
		Z23_Maggot_Global[RoomID] = {};
	end
	Z23_Maggot_Global[RoomID].Ctrl = Ctrl;
	Lua_Z23_106298_FunctionInit(true);
	Lua_Z23_106298_SkillInfo("reset",ReadRoleValue(Ctrl,EM_RoleValue_PID) );--依造ID初始化難度,之後接不需要依造難度去調整
	
	Lua_Z23_106298_CreateObj("Doors");
	Lua_Z23_106298_CreateObj("Boss");
	Lua_Z23_106298_CreateObj("Eggs");
end

function Lua_Z23_106298_MaggotAI()
	local Boss = OwnerID();
	if ReadRoleValue(Boss,EM_RoleValue_Register10)==0 then--將模板的pcall轉換,避免戰鬥劇情重複觸發
		WriteRoleValue( Boss , EM_RoleValue_Register10,1 );
		BeginPlot( Boss, "Lua_Z23_106298_MaggotAI" , 0 );
		return
	end
	local Check_pet = 0
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---如果是非玩家進入戰鬥
	local Pet_owner = ReadRoleValue( AttackTarget ,EM_RoleValue_OwnerGUID )
		SetPosByFlag( Pet_owner , 781031, 3 )
		Check_pet = 1
	end	
	--Cl_Resist_HackersFightBegin()
	local Ctrl = ReadRoleValue( Boss , EM_RoleValue_Register1);
	local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
	local CurrentSkill ,atkTarget , PlayersInHate  = 0,0,{};
	local TempTable = {};
	local Timer = 1;
	local SkillID , SkillLV =Z23_Maggot_Global.SkillID , Z23_Maggot_Global.SkillLV;
	local Eggs ={};
	local box = 3
	math.randomseed(math.random(1, 99999));
	local BossSwitch = 1;--1:本來的BOSS , 2: 10倍界王拳Boss
	if ReadRoleValue( Boss ,EM_RoleValue_Register5 )==0 then
		if ReadRoleValue( Ctrl ,EM_RoleValue_Register5 )==0 then
			WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 1 );--上鎖，假如兩隻Boss同時戰鬥 ，會有一隻留下
			DelObj( Z23_Maggot_Global[RoomID].Boss[2] );
		end
		--CallPlot( Z23_Maggot_Global[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , true );--入口開門
			local EnterDoor = CreateObjByFlag( 106223, 781031 , 2 , 1 )--入口阻擋門
			Z23_Maggot_Global[RoomID].EnterDoor = EnterDoor;
			kg_DoorInit( EnterDoor );
			AddToPartition( EnterDoor , RoomID );
			CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--開門
		BeginPlot( Boss, "Lua_Z23_106298_MaggotCrazy" , 0 );
	else
		BossSwitch=2;
		if ReadRoleValue( Ctrl ,EM_RoleValue_Register5 )==0 then
			WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 1 );--上鎖，假如兩隻Boss同時戰鬥 ，會有一隻留下
			DelObj( Z23_Maggot_Global[RoomID].Boss[1] );
		end
		
	end
	ScriptMessage( Boss , -1 , 2 , "[SC_106298_FIGHT]" , C_SYSTEM );--進入戰鬥台詞
	Sleep(10)
	while 1 do
		if KS_InCombat(Boss)==true then
			if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0 then
				if timer%7==0 then
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_BITE]" , C_SYSTEM );--巨蟲嗜咬
					CurrentSkill = 1;--巨蟲嗜咬
					atkTarget= ReadRoleValue( Boss ,EM_RoleValue_AttackTargetID );
					CastSpellLv( Boss , atkTarget , SkillID[CurrentSkill] , SkillLV[CurrentSkill]  );
				elseif timer%18==0  and BossSwitch==1 then
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_CALLBABY]" , C_SYSTEM );--Boss15秒招喚蛆蟲
					
					Lua_Z23_106298_CreateObj("Eggs");--補充Eggs
					Eggs = Z23_Maggot_Global[RoomID].Eggs
					for i in pairs( Eggs ) do
						SetModeEx( Eggs[i] , EM_SetModeType_Fight , true );
					end
					Sleep(30)
					Lua_Z23_106298_BugWave(box);--施放蟲波
					if box ~=6 then
						box = box+1
					else
						box = 3
					end
					Sleep(30);
					
					--Eggs = Z23_Maggot_Global[RoomID].Eggs;
					CurrentSkill = 2;--巨蟲翻滾
					CastSpellLv( Boss , Boss , SkillID[CurrentSkill] , SkillLV[CurrentSkill]  );
					for i in pairs( Eggs ) do
						if ReadRoleValue( Eggs[i], EM_RoleValue_Register1 )==0 then
							WriteRoleValue( Eggs[i] , EM_RoleValue_Register1 , 1 );--綁定防重複觸發
							CallPlot( Eggs[i] , "Lua_Z23_106298_BugAI" , Boss  );--開始AE直到死亡
						end
						SetModeEx( Eggs[i] , EM_SetModeType_Fight , true );
					end
					kg_WaitSpell(Boss);
					--巨蟲翻滾完後施放鑽地
					PlayersInHate = {};
					TempTable = KS_GetHateList( Boss , 4 );
					for i in pairs(TempTable) do
						if CheckBuff( TempTable[i] , 621052 )==true then--抓出打蟲蛹的人
							table.insert( PlayersInHate , TempTable[i] );
						end
					end
					if #PlayersInHate<1 then	--沒有人打蟲蛹則隨便挑一個玩家
						PlayersInHate = TempTable;
					end
					if #PlayersInHate>0 then
						atkTarget = PlayersInHate[ math.random( #PlayersInHate ) ];
					else
						atkTarget = ReadRoleValue(Boss , EM_RoleValue_AttackTargetID);
					end
					
					DebugMsg(0,0,"atkTarget="..atkTarget); --Say( atkTarget ,"ya ma dea~~~" );
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_DASH]" , C_SYSTEM );--Boss要撞玩家
					CurrentSkill = 4;
					SetFightMode (  Boss  , 0, 0, 0, 0 );
					PlayMotion( Boss , ruFUSION_ACTORSTATE_SLEEP_BEGIN );
					Sleep(25);
					SetPos( Boss , kg_GetPos( atkTarget ) );
					CastSpellLv( Boss , atkTarget , SkillID[CurrentSkill] , SkillLV[CurrentSkill] );--施放鑽地
					SetFightMode (  Boss  , 1, 1, 0, 1 );
				end
				timer = timer+1; --DebugMsg(0,0,"Z23_Maggot timer="..timer);
			end
		else
			ScriptMessage( Boss , -1 , 2 , "[SC_106298_RESET]" , C_SYSTEM );--Boss重置
			CallPlot( Ctrl , "Lua_Z23_106298_MaggotReset" , 1 );
			return
		end
		Sleep(10);
	end
end

function Lua_Z23_106298_RangePlot( Player )
	local Oid = OwnerID();
	local Tid = TargetID();
	if ReadRoleValue( Oid , EM_RoleValue_IsPlayer )==1 then
		if ReadRoleValue( Tid , EM_RoleValue_Register2)==0 then
			WriteRoleValue( Tid , EM_RoleValue_Register2 , 1 );--觸發劇情上鎖,觸發後就不會再觸發
			CallPlot( Tid , "Lua_Z23_106298_RangePlot" , Oid  );
		end
	else
		SetPlot( Oid , "range" , "" , 30 );
		if Player~=nil then
			SetModeEx( Oid , EM_SetModeType_Show, true );
			SetModeEx( Oid , EM_SetModeType_Strikback, true); ---反擊(否)
			SetModeEx( Oid , EM_SetModeType_Fight, true); ---可砍殺(否)
			SetModeEx( Oid , EM_SetModeType_Mark, true);	----可點選(否)
			SetModeEx( Oid , EM_SetModeType_Searchenemy, true);
		end
	end
end