
function Lua_Zone22_WB_Phoenix_Init()
	SetModeEx( OwnerID() , EM_SetModeType_Revive , false );
	--MoveToFlagEnabled( OwnerID(),false );

	local function no_player_in_hatelist(guid)
		for index = 0, HateListCount(guid) - 1 do
			if ReadRoleValue(HateListInfo(guid, index, EM_HateListInfoType_GItemID), EM_RoleValue_IsPlayer) == 1 then
				return false
			end
		end
		return true
	end

	local override;
	if Lua_Zone22_Phoenix_FireRing==nil or override~=nil then --法術Script
		function Lua_Zone22_Phoenix_FireRing(FireRing)
			while 1 do
				SysCastSpellLv( FireRing , FireRing , 498250 ,0 );--燒玩家
				SysCastSpellLv( FireRing , FireRing , 498251 ,0 );--燒雛鳥
				Sleep(10);
			end
		end
	end
	
	if Lua_Zone22_WB_Phoenix_Skill==nil or override~=nil then --法術Script
		function Lua_Zone22_WB_Phoenix_Skill( SwitchType )
			SwitchType = SwitchType or 0;
			local Boss , Player = OwnerID() , TargetID();
			if SwitchType==1 then	--火苗檢查Boss
				Boss , Player = Player , Boss;
				if ReadRoleValue( Boss , EM_RoleValue_OrgID )==103585 then
					--DebugMsg(0,0,"Zone22_Phoenix  Buff--" );
					CancelBuff( Player , 620766 );--火苗萌發
					if CheckBuff( Boss , 620761 )==true then	--灼熱核融
						local BuffLv = KS_CheckBuffLV( Boss , 620761 )-2;
						CancelBuff( Boss , 620761 );
						AddBuff( Boss , 620761 , BuffLv , -1 );
					end
				end
			elseif SwitchType==2 then	--燄翼焚風實際單體傷害
				SysCastSpellLv( Boss , Player , 498237 , 0 );
				AddBuff( Boss , 620761 , 0 ,-1 );
				--DebugMsg(0,0,"Zone22_Phoenix  Buff++");
			elseif SwitchType==3 then--產生火圈
				--DebugMsg(0,0,"FireRing!!");
				local FireRing = kg_GetPos( Player , 106102 );
				kg_CtrlInit(FireRing);
				MoveToFlagEnabled( FireRing,false );
				WriteRoleValue( FireRing , EM_RoleValue_LiveTime , 30 );
				WriteRoleValue( FireRing , EM_RoleValue_Register10 , Boss );--將Boss記在火圈的reg10裡面
				AddToPartition( FireRing , ReadRoleValue(Boss , EM_RoleValue_RoomID) );
				SysCastSpellLv( FireRing , FireRing  , 498247 , 0 );
				CallPlot( FireRing , "Lua_Zone22_Phoenix_FireRing" , FireRing );--不能再呼叫Lua_Zone22_WB_Phoenix_Skil的原因是因為有閃焰爆炸劇情再呼叫
			elseif SwitchType==4 then	--火圈施放閃焰AE傷害
				local FireRing  , Player = OwnerID(),TargetID();
				local Boss = ReadRoleValue( FireRing , EM_RoleValue_Register10 );
				SysCastSpellLv( Boss , Player  , 498249 , 0 );--單體傷害
				AddBuff( Boss , 620761 , 0 ,-1 );
			elseif SwitchType==5 then	--火焰之種爆發
				--DebugMsg(0,0,"FireExplode!!");
				local Player = OwnerID();
				local FireSeedDummy = Lua_z22_WB_Phoenix_FireSeedDummy;
				if CheckID(FireSeedDummy)==true then
					SetPos( FireSeedDummy , kg_GetPos(Player) );
					SysCastSpellLv( FireSeedDummy , FireSeedDummy, 498241 , 0 );
				end
			elseif SwitchType==6 then	--碳化並進入戰鬥(由FireSeedDummy執行)
				local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 );
				local Player = TargetID();
				if GetModeEx( Player , EM_SetModeType_Fight )==true then
					--Say(Player , "hp down!!!");
					SysCastSpellLv( Player , Boss,497448,0 );--強制仇恨1
					AddBuff( Player , 620766 , 0 ,-1);--火苗萌發
					AddBuff( Player , 620767 , 0 ,-1);--碳化buff
				end
			end
		end
	end

	if Lua_Zone22_WB_Bird_AI==nil or override~=nil then
		function Lua_Zone22_WB_Bird_AI( Boss )
			--DebugMsg( 0,0,"Lua_Zone22_WB_Bird_AI Start!!" );
			local FireNestling = OwnerID();
			for i =1,10 do
				if CheckID(Boss )~=true or ReadRoleValue(Boss ,EM_RoleValue_IsDead)==1 or
				KS_InCombat(Boss)==false then
					--DebugMsg(0,0,"Z22_Phoenix DelBird..");
					DelObj( FireNestling );
					return
				end
				Sleep(10);
			end
			--DebugMsg(0,0,"Find Boss Mode!");
			SetStopAttack( FireNestling );
			SetModeEx( FireNestling , EM_SetModeType_Searchenemy, false);
			SetModeEx( FireNestling , EM_SetModeType_Strikback , false );
			SetModeEx( FireNestling , EM_SetModeType_Fight , true );
			local x,y,z;
			while 1 do
				if CheckID(Boss )~=true or ReadRoleValue(Boss ,EM_RoleValue_IsDead)==1 or 
				KS_InCombat(Boss)==false then
					--DebugMsg(0,0,"Z22_Phoenix DelBird..");
					break
				end
				if GetDistance( Boss , FireNestling )<=35 then
					--DebugMsg(0,0,"Z22_Bird TouchPhoenix!!");
					SysCastSpellLv( FireNestling, Boss , 498239,0 );--回血
					AddBuff( Boss, 620761 , 4 , -1 )--跌5層
					local Target = kg_GetPosRX( FireNestling , 106110 , 200 , 0 , 180 );
					MoveToFlagEnabled( Target,false );
					WriteRoleValue(Target , EM_RoleValue_LiveTime , 5 );
					SetModeEx( Target , EM_SetModeType_Revive , false );
					SetModeEx( Target , EM_SetModeType_Fight , true );
					SetModeEx( Target , EM_SetModeType_Searchenemy, false);
					SetModeEx( Target , EM_SetModeType_Strikback , false );
					AddToPartition( Target , ReadRoleValue(FireNestling ,EM_RoleValue_RoomID) );
					SysCastSpellLv( Boss , Target , 498248 ,0 );
					break
				else
					x,y,z,_=kg_GetPos( Boss );
					MoveDirect( FireNestling , x,y,z );
				end
				Sleep(10);
			end
			sleep(5); DelObj(FireNestling);
		end
	end
	
	if Lua_z22_WB_Phoenix_CheckBoss==nil or override~=nil then
		function Lua_z22_WB_Phoenix_CheckBoss(Boss)
			while 1 do
				if CheckID( Boss )==false or ReadRoleValue(Boss , EM_RoleValue_IsDead)==1 then
					break
				end
				Sleep(20);
			end
			DelObj( OwnerID() );
		end
	end
	
	if Lua_z22_WB_Phoenix_CheckDis==nil or override~=nil then
		function Lua_z22_WB_Phoenix_CheckDis(Boss)
			while 1 do
				if KS_InCombat( Boss )~=true then
					return
				end
				if KS_GetFlagDistance( Boss , 781057 , 0 )>=800 then
					--DebugMsg(0,0,"Zone22_Phoenix out of range!!");
					local NewBoss = kg_GetPosRX( {781057,0} , 103585 );
					AddToPartition( NewBoss , ReadRoleValue( Boss , EM_RoleValue_RoomID ) );
					Sleep(10); DelObj( Boss );
				end
				Sleep(20);
			end
		end
	end
	
	if Lua_Zone22_WB_Phoenix_AI==nil or override~=nil then
		function Lua_Zone22_WB_Phoenix_AI()
			local Boss = OwnerID();
			local Level = ReadRoleValue(Boss ,EM_RoleValue_PID);  DebugMsg(0,0,"Zone22_Phoenix EnterBattle!! CurrentLevel="..Level);
			Lua_z22_WB_Phoenix_Level = Level;
			local RoomID = ReadRoleValue( Boss , EM_RoleValue_RoomID );
			CallPlot( Boss , "Lua_z22_WB_Phoenix_CheckDis" , Boss );--檢查Boss是否太遠
			if Level==1 then
				AddBuff( Boss , 621637  ,0,-1 );--普通
			elseif Level==2 then
				AddBuff( Boss , 621638    ,0,-1 );--困難
			end
			local FireSeedDummy = kg_GetPosRX( Boss , 106110  );
			Lua_z22_WB_Phoenix_FireSeedDummy = FireSeedDummy;
			WriteRoleValue( FireSeedDummy , EM_RoleValue_Register1 , Boss );
			kg_CtrlInit( FireSeedDummy );
			AddToPartition( FireSeedDummy , RoomID );
			CallPlot( FireSeedDummy , "Lua_z22_WB_Phoenix_CheckBoss" , Boss );
			local HateList ={};
			local AtkTarget=0;
			local Timer = 1;
			Sleep(10);
			math.randomseed(math.random(1, 99999));
			repeat
				--DebugMsg(0,0," Zone22_Phoenix Timer="..Timer);
				if ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)==0 then
					if KS_CheckBuffLV( Boss , 620761 )>=80 then
						--DebugMsg(0,0,"Zone22_Phoenix SuperStar!!");
						CastSpell( Boss, Boss , 498235 );--超新星
					elseif Timer%5==0 then
						--DebugMsg(0,0,"Zone22_Phoenix Fire!!");
						HateList = KS_GetHateList( Boss , 4 );
						if Level==0 then
							AtkTarget =HateList[math.random(#HateList)];
							CastSpell( Boss , AtkTarget , 498238 );--熔炎飛濺
						else
							HateList = KS_RegroupArray( HateList , 2 );
							for i =1 , #HateList do
								if i==1 then
									CastSpell( Boss , HateList[i] , 498238 );--熔炎飛濺
								else
									SysCastSpellLv( Boss , HateList[i] , 498238  , 0);--快速放第2發
								end
							end
						end
					elseif Timer%9==0 then
						--DebugMsg(0,0,"Zone22_Phoenix FireWind!!")
						HateList = KS_RegroupArray( KS_GetHateList( Boss , 4 ) , 2 );
						for i =1 , #HateList do
							if i==1 then
								CastSpell( Boss , HateList[i] , 498248 );--燄翼焚風
								kg_WaitSpell(Boss);
							else
								SysCastSpellLv( Boss , HateList[i] , 498248 , 0 );--快速放第2發
							end
						end
					elseif Timer%12==0 and Level>0 then--
						--DebugMsg(0,0,"Zone22_Phoenix FireSlash!!")
						HateList = KS_GetHateList( Boss , 4 );
						if #HateList>0 then
							AtkTarget =HateList[math.random(#HateList)]; --Say( AtkTarget , "Be Ware!!!" );
							CastSpell( Boss , AtkTarget , 498243 );--閃燄,免分難度,因為雛鳥要到困難才會出現
						end
					elseif Timer%14==0 then
						--DebugMsg(0,0,"Zone22_Phoenix FireSeed!!")
						HateList = KS_GetHateList( Boss , 4 );
						if #HateList>0 then
							AtkTarget =HateList[math.random(#HateList)];
							CastSpell( Boss , AtkTarget , 498240 );--火焰之種
						end
						if Level<2 then Timer = 0; end
					elseif Timer%31==0 and Level==2 then--出來吧小鳥
						--DebugMsg(0,0,"Zone22_Phoenix FireNestling!!");
						HateList = KS_GetHateList(Boss , 1);
						for i in pairs( HateList  ) do
							ScriptMessage( Boss , HateList[i] , 2 , "[SC_ZONE22_WORLDBOSS_STRING]" , C_SYSTEM )--小火鳥出現台詞
						end
						if #HateList>4 then
							table.remove( HateList , 1 );
							HateList = KS_RegroupArray( HateList , 3 );--從仇恨表隨機找三隻
						elseif #HateList==4 then
							table.remove( HateList , 1 );
						end
						
						local FireNestling = 0;
						if #HateList>0 then
							for i = 1,#HateList do
								if ReadRoleValue(HateList[i], EM_RoleValue_IsPlayer) then
									FireNestling = kg_GetPosRX( HateList[i] , 103586 , Rand(30) , 0 , Rand(360) );
									MoveToFlagEnabled( FireNestling,false );
									SetModeEx( FireNestling , EM_SetModeType_Revive , false );
									SetModeEx( FireNestling , EM_SetModeType_Fight , false );
									AddToPartition( FireNestling , RoomID );
									SetAttack( FireNestling , HateList[i] );
									CallPlot( FireNestling , "Lua_Zone22_WB_Bird_AI" , Boss );
								end
							end 
						end
						Timer = 0;
					end
					Timer  = Timer+1;
				end
				Sleep(10);
			until KS_InCombat(Boss)==false or no_player_in_hatelist(Boss)
			WriteRoleValue( Boss ,EM_RoleValue_PID ,0 );
			DelObj( FireSeedDummy );
			Lua_z22_WB_Phoenix_FireSeedDummy=nil;
			Lua_z22_WB_Phoenix_Level=nil;
			--DebugMsg(0,0,"Zone22_Phoenix LeaveBattle!!");
		end
	end
	
	if Lua_Zone22_WB_Phoenix_Event==nil or override~=nil then
		function Lua_Zone22_WB_Phoenix_Event( SwitchType )
			SwitchType = SwitchType or 1;
			if SwitchType==1 then--進入戰鬥
				BeginPlot( OwnerID() , "Lua_Zone22_WB_Phoenix_AI" ,0 );
			elseif SwitchType==2 then--蛋檢查Boss是否以死透
				--DebugMsg(0,0,"Egg Check BossDead..")
				local Egg = OwnerID();
				local Boss = ReadRoleValue( Egg , EM_RoleValue_Register10 );
				local SleepTime = GameObjInfo_Int( 103585 , "ReviveTime" );--鳳凰資料庫中的重生時間
				--DebugMsg(0,0,"Zone22_Phoenix ResetTime="..SleepTime );
				while 1 do
					if CheckID( Boss )==false then--已完全消失
						break
					end
					Sleep(10)
				end
				--DebugMsg( 0,0,"Check Complete.." );
				DelObj( Boss );
				
				--產生隱形物件並施放特效
				local EffectObj = kg_GetPosRX( Egg, 106520  );
				kg_CtrlInit( EffectObj );
				AddToPartition( EffectObj , ReadRoleValue(Egg , EM_RoleValue_RoomID) );
				SysCastSpellLv( EffectObj , EffectObj , 498856,0 );
				Sleep( 30 );
				DelObj( EffectObj );
				
				SetModeEx( Egg , EM_SetModeType_Show  , true);
				Sleep(SleepTime*10);--鳳凰重生時間
				local Boss = kg_GetPosRX( Egg , 103585 , 0,5 );
				AddToPartition( Boss , ReadRoleValue(Egg,EM_RoleValue_RoomID) );
				Sleep(5); DelObj(Egg);
			end
		end
	end
	
	if Lua_Zone22_WB_Phoenix_Dead==nil or override~=nil then
		function Lua_Zone22_WB_Phoenix_Dead()
			--DebugMsg(0,0,"Z22_Phoenix Dead!!");
			local Boss =OwnerID();
			local Players = KS_GetHateList( Boss , 1 );
			local Level = ReadRoleValue(Boss ,EM_RoleValue_PID);
			local GiveQuestItem = function( PlayerArray , Quest , Item )
				local ItemCount,NeedSpaceStatus;
				for index,Player in pairs(PlayerArray) do
					if CheckAcceptQuest( Player, Quest )==true and CountBodyitem( Player , Item )==0 then
						if Check_Bag_Space( Player , 1  )==true then
							GiveBodyItem( Player , Item , 1 );
						else
							ScriptMessage( Player, Player, 1,"[SYS_BAG_ENOUGH_CAPACITY]", 0 );--背包欄位已滿!!
						end
					end
				end
			end
			
			if Level==1 then
				GiveQuestItem( Players , 424851 , 240888  );
			elseif Level==2 then
				GiveQuestItem( Players , 425013 , 240889  );
			end
			
			LuaS_103580_6();
			--生蛋
			local Egg = kg_GetPosRX( { 781057 ,0 } , 120119 ,0,5 );
			WriteRoleValue( Egg , EM_RoleValue_Register10 , Boss );
			SetModeEx( Egg , EM_SetModeType_Searchenemy, false)	---索敵(否)
			SetModeEx( Egg , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( Egg , EM_SetModeType_Fight, false) ---可砍殺(否)
			SetModeEx( Egg , EM_SetModeType_Revive, false )	--可重生
			SetModeEx( Egg , EM_SetModeType_Mark, true)	----可點選(否)
			SetModeEx( Egg , EM_SetModeType_Show  , false)
			AddToPartition( Egg,ReadRoleValue( Egg , EM_RoleValue_RoomID ));
			CallPlot( Egg , "Lua_Zone22_WB_Phoenix_Event" , 2 );
			return true
		end
	end
	SetPlot( OwnerID() , "dead" , "Lua_Zone22_WB_Phoenix_Dead" , 0 );
end

function Lua_Zone22_WB_Phoenix_SkillCheck( SwitchType )
	local Oid ,Tid = OwnerID(),TargetID();
	if SwitchType==1 then--檢查小火鳥
		if ReadRoleValue(Tid , EM_RoleValue_OrgID)==103586 then
			return true
		end
		return false
	elseif SwitchType==2 then--使用物品的檢查
		if ReadRoleValue(Tid , EM_RoleValue_OrgID)==103585 then
			if KS_InCombat(Tid)==false  then
				return true
			else
				ScriptMessage( Oid, Oid, 1 , "[SC_421249_3]" , 0 )--使用的對象必須在非戰鬥狀態
				return false
			end
		else		
			ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--目標錯誤
			return false
		end
		
	elseif SwitchType==3 then--困難模式順發燄翼焚風目標檢查
		if ReadRoleValue(Tid , EM_RoleValue_OrgID)==106110 then
			return false
		end
		return true
	end
end

function Lua_z22_WB_Phoenix_ChangeLevel( SwitchType )
	SwitchType = SwitchType or 0;
	local Boss = TargetID(); --DebugMsg(0,0,"Zone22_Phoenix ChangeLevel to .."..SwitchType);
	WriteRoleValue( Boss , EM_RoleValue_PID , SwitchType );
	SysCastSpellLv( OwnerID(),Boss,497448,0 )--強制仇恨1
end

function z22_WB_Phoenix_AwardCheck( CheckValue )
	--DebugMsg(0,0,"Phoenix_AwardCheck Level="..Lua_z22_WB_Phoenix_Level);
	if Lua_z22_WB_Phoenix_Level==CheckValue then
		return true
	end
	return false
end

function z22_WB_Phoenix_CheckLV( CheckValue )
	local Level = ReadRoleValue( OwnerID() , EM_RoleValue_PID );
	if Level >= CheckValue then
		return true
	end
	return false
end