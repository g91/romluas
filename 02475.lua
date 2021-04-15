
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
	if Lua_Zone22_Phoenix_FireRing==nil or override~=nil then --�k�NScript
		function Lua_Zone22_Phoenix_FireRing(FireRing)
			while 1 do
				SysCastSpellLv( FireRing , FireRing , 498250 ,0 );--�N���a
				SysCastSpellLv( FireRing , FireRing , 498251 ,0 );--�N����
				Sleep(10);
			end
		end
	end
	
	if Lua_Zone22_WB_Phoenix_Skill==nil or override~=nil then --�k�NScript
		function Lua_Zone22_WB_Phoenix_Skill( SwitchType )
			SwitchType = SwitchType or 0;
			local Boss , Player = OwnerID() , TargetID();
			if SwitchType==1 then	--���]�ˬdBoss
				Boss , Player = Player , Boss;
				if ReadRoleValue( Boss , EM_RoleValue_OrgID )==103585 then
					--DebugMsg(0,0,"Zone22_Phoenix  Buff--" );
					CancelBuff( Player , 620766 );--���]�޵o
					if CheckBuff( Boss , 620761 )==true then	--�`���ֿ�
						local BuffLv = KS_CheckBuffLV( Boss , 620761 )-2;
						CancelBuff( Boss , 620761 );
						AddBuff( Boss , 620761 , BuffLv , -1 );
					end
				end
			elseif SwitchType==2 then	--�V�l�I����ڳ���ˮ`
				SysCastSpellLv( Boss , Player , 498237 , 0 );
				AddBuff( Boss , 620761 , 0 ,-1 );
				--DebugMsg(0,0,"Zone22_Phoenix  Buff++");
			elseif SwitchType==3 then--���ͤ���
				--DebugMsg(0,0,"FireRing!!");
				local FireRing = kg_GetPos( Player , 106102 );
				kg_CtrlInit(FireRing);
				MoveToFlagEnabled( FireRing,false );
				WriteRoleValue( FireRing , EM_RoleValue_LiveTime , 30 );
				WriteRoleValue( FireRing , EM_RoleValue_Register10 , Boss );--�NBoss�O�b���骺reg10�̭�
				AddToPartition( FireRing , ReadRoleValue(Boss , EM_RoleValue_RoomID) );
				SysCastSpellLv( FireRing , FireRing  , 498247 , 0 );
				CallPlot( FireRing , "Lua_Zone22_Phoenix_FireRing" , FireRing );--����A�I�sLua_Zone22_WB_Phoenix_Skil����]�O�]�����{�K�z���@���A�I�s
			elseif SwitchType==4 then	--����I��{�KAE�ˮ`
				local FireRing  , Player = OwnerID(),TargetID();
				local Boss = ReadRoleValue( FireRing , EM_RoleValue_Register10 );
				SysCastSpellLv( Boss , Player  , 498249 , 0 );--����ˮ`
				AddBuff( Boss , 620761 , 0 ,-1 );
			elseif SwitchType==5 then	--���K�����z�o
				--DebugMsg(0,0,"FireExplode!!");
				local Player = OwnerID();
				local FireSeedDummy = Lua_z22_WB_Phoenix_FireSeedDummy;
				if CheckID(FireSeedDummy)==true then
					SetPos( FireSeedDummy , kg_GetPos(Player) );
					SysCastSpellLv( FireSeedDummy , FireSeedDummy, 498241 , 0 );
				end
			elseif SwitchType==6 then	--�Ҥƨöi�J�԰�(��FireSeedDummy����)
				local Boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 );
				local Player = TargetID();
				if GetModeEx( Player , EM_SetModeType_Fight )==true then
					--Say(Player , "hp down!!!");
					SysCastSpellLv( Player , Boss,497448,0 );--�j���1
					AddBuff( Player , 620766 , 0 ,-1);--���]�޵o
					AddBuff( Player , 620767 , 0 ,-1);--�Ҥ�buff
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
					SysCastSpellLv( FireNestling, Boss , 498239,0 );--�^��
					AddBuff( Boss, 620761 , 4 , -1 )--�^5�h
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
			CallPlot( Boss , "Lua_z22_WB_Phoenix_CheckDis" , Boss );--�ˬdBoss�O�_�ӻ�
			if Level==1 then
				AddBuff( Boss , 621637  ,0,-1 );--���q
			elseif Level==2 then
				AddBuff( Boss , 621638    ,0,-1 );--�x��
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
						CastSpell( Boss, Boss , 498235 );--�W�s�P
					elseif Timer%5==0 then
						--DebugMsg(0,0,"Zone22_Phoenix Fire!!");
						HateList = KS_GetHateList( Boss , 4 );
						if Level==0 then
							AtkTarget =HateList[math.random(#HateList)];
							CastSpell( Boss , AtkTarget , 498238 );--�������q
						else
							HateList = KS_RegroupArray( HateList , 2 );
							for i =1 , #HateList do
								if i==1 then
									CastSpell( Boss , HateList[i] , 498238 );--�������q
								else
									SysCastSpellLv( Boss , HateList[i] , 498238  , 0);--�ֳt���2�o
								end
							end
						end
					elseif Timer%9==0 then
						--DebugMsg(0,0,"Zone22_Phoenix FireWind!!")
						HateList = KS_RegroupArray( KS_GetHateList( Boss , 4 ) , 2 );
						for i =1 , #HateList do
							if i==1 then
								CastSpell( Boss , HateList[i] , 498248 );--�V�l�I��
								kg_WaitSpell(Boss);
							else
								SysCastSpellLv( Boss , HateList[i] , 498248 , 0 );--�ֳt���2�o
							end
						end
					elseif Timer%12==0 and Level>0 then--
						--DebugMsg(0,0,"Zone22_Phoenix FireSlash!!")
						HateList = KS_GetHateList( Boss , 4 );
						if #HateList>0 then
							AtkTarget =HateList[math.random(#HateList)]; --Say( AtkTarget , "Be Ware!!!" );
							CastSpell( Boss , AtkTarget , 498243 );--�{�V,�K������,�]�������n��x���~�|�X�{
						end
					elseif Timer%14==0 then
						--DebugMsg(0,0,"Zone22_Phoenix FireSeed!!")
						HateList = KS_GetHateList( Boss , 4 );
						if #HateList>0 then
							AtkTarget =HateList[math.random(#HateList)];
							CastSpell( Boss , AtkTarget , 498240 );--���K����
						end
						if Level<2 then Timer = 0; end
					elseif Timer%31==0 and Level==2 then--�X�ӧa�p��
						--DebugMsg(0,0,"Zone22_Phoenix FireNestling!!");
						HateList = KS_GetHateList(Boss , 1);
						for i in pairs( HateList  ) do
							ScriptMessage( Boss , HateList[i] , 2 , "[SC_ZONE22_WORLDBOSS_STRING]" , C_SYSTEM )--�p�����X�{�x��
						end
						if #HateList>4 then
							table.remove( HateList , 1 );
							HateList = KS_RegroupArray( HateList , 3 );--�q������H����T��
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
			if SwitchType==1 then--�i�J�԰�
				BeginPlot( OwnerID() , "Lua_Zone22_WB_Phoenix_AI" ,0 );
			elseif SwitchType==2 then--�J�ˬdBoss�O�_�H���z
				--DebugMsg(0,0,"Egg Check BossDead..")
				local Egg = OwnerID();
				local Boss = ReadRoleValue( Egg , EM_RoleValue_Register10 );
				local SleepTime = GameObjInfo_Int( 103585 , "ReviveTime" );--��ĸ�Ʈw�������ͮɶ�
				--DebugMsg(0,0,"Zone22_Phoenix ResetTime="..SleepTime );
				while 1 do
					if CheckID( Boss )==false then--�w��������
						break
					end
					Sleep(10)
				end
				--DebugMsg( 0,0,"Check Complete.." );
				DelObj( Boss );
				
				--�������Ϊ���ìI��S��
				local EffectObj = kg_GetPosRX( Egg, 106520  );
				kg_CtrlInit( EffectObj );
				AddToPartition( EffectObj , ReadRoleValue(Egg , EM_RoleValue_RoomID) );
				SysCastSpellLv( EffectObj , EffectObj , 498856,0 );
				Sleep( 30 );
				DelObj( EffectObj );
				
				SetModeEx( Egg , EM_SetModeType_Show  , true);
				Sleep(SleepTime*10);--��ĭ��ͮɶ�
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
							ScriptMessage( Player, Player, 1,"[SYS_BAG_ENOUGH_CAPACITY]", 0 );--�I�]���w��!!
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
			--�ͳJ
			local Egg = kg_GetPosRX( { 781057 ,0 } , 120119 ,0,5 );
			WriteRoleValue( Egg , EM_RoleValue_Register10 , Boss );
			SetModeEx( Egg , EM_SetModeType_Searchenemy, false)	---����(�_)
			SetModeEx( Egg , EM_SetModeType_Strikback, false) ---����(�_)
			SetModeEx( Egg , EM_SetModeType_Fight, false) ---�i���(�_)
			SetModeEx( Egg , EM_SetModeType_Revive, false )	--�i����
			SetModeEx( Egg , EM_SetModeType_Mark, true)	----�i�I��(�_)
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
	if SwitchType==1 then--�ˬd�p����
		if ReadRoleValue(Tid , EM_RoleValue_OrgID)==103586 then
			return true
		end
		return false
	elseif SwitchType==2 then--�ϥΪ��~���ˬd
		if ReadRoleValue(Tid , EM_RoleValue_OrgID)==103585 then
			if KS_InCombat(Tid)==false  then
				return true
			else
				ScriptMessage( Oid, Oid, 1 , "[SC_421249_3]" , 0 )--�ϥΪ���H�����b�D�԰����A
				return false
			end
		else		
			ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
			return false
		end
		
	elseif SwitchType==3 then--�x���Ҧ����o�V�l�I���ؼ��ˬd
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
	SysCastSpellLv( OwnerID(),Boss,497448,0 )--�j���1
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