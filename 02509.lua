function Lua_Z23_106298_SkillInfo( mode , level )--init: ��l�� reset : �j��]�wskillinfo
	if mode=="init" or mode=="reset" then
		if Z23_Maggot_Global.SkillID==nil or mode=="reset" then
			Z23_Maggot_Global.SkillID={		--�k�NID
				498443,	--���ζݫr
				498444,	--����½�u
				498445,	--�Q�o�ĲGAE
				498446,	--Boss�p�a
				498449,	--�r��AE
				498451  --�@�r�Q�o
			};
		end
		if Z23_Maggot_Global.SkillLV==nil or mode=="reset" then
			if level ==1 then
				Z23_Maggot_Global.SkillLV={	--���q
					1,	--���ζݫr
					1,	--����½�u
					1,	--�Q�o�ĲGAE
					5,	--Boss�p�a
					2,	--�r��AE
					2	--�@�r�Q�o
				};
			elseif level==2 then
				Z23_Maggot_Global.SkillLV={	--²��
					0,	--���ζݫr
					0,	--����½�u
					0,	--�Q�o�ĲGAE
					0,	--Boss�p�a
					0,--�r��AE
					0--�@�r�Q�o
				};
			else
				Z23_Maggot_Global.SkillLV={	--�x��
					2,	--���ζݫr
					2,	--����½�u
					2,	--�Q�o�ĲGAE
					8,	--Boss�p�a
					2,	--�r��AE
					4--�@�r�Q�o
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
				ScriptMessage( Obj , -1 , 2 , "[SC_106298_DEAD]" , C_SYSTEM );--Boss���`
				CallPlot( ReadRoleValue( Obj , EM_RoleValue_Register1 ) , "Lua_Z23_106298_MaggotReset" , 2 );
			elseif OrgID == Bux then--�p��
				local Water = kg_GetPos( Obj , 106311 );
				MoveToFlagEnabled( Water,false );
				SetModeEx( Water , EM_SetModeType_Move, false) ---����	(�_)
				SetModeEx( Water , EM_SetModeType_Revive, false );	--�i����
				SetModeEx( Water , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( Water , EM_SetModeType_Fight, false) ---�i���(�_)
				SetModeEx( Water , EM_SetModeType_Searchenemy, false)	---����(�_)
				SetModeEx( Water , EM_SetModeType_HideName, false)	---�W��(�_)
				SetModeEx( Water , EM_SetModeType_NotShowHPMP, true)  ---���HP(�_)				
				WriteRoleValue(Water ,EM_RoleValue_LiveTime , 60);
				AddToPartition( Water , ReadRoleValue(Obj ,EM_RoleValue_RoomID) );
				CastSpellLv( Water , Water , Z23_Maggot_Global.SkillID[5] , Z23_Maggot_Global.SkillLV[5]);--�d�U�r��
				return true
			elseif OrgID == Eggg then--�θ�
				
			end
		end
	end
	
	if Lua_Z23_106298_MaggotReset==nil or override==true then
		Lua_Z23_106298_MaggotReset = function( mode )--1:���m , 2:Boss���` , ��L: �����R
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
				--CallPlot( Z23_Maggot_Global[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , false );--�J�f�}��
				Delobj(Z23_Maggot_Global[RoomID].EnterDoor)
				CallPlot( Ctrl , "Lua_Z23_106298_CreateObj" , "Boss" , 6 );--6��᭫��Boss
				sleep(60)
				Lua_Z23_106298_CreateObj("Eggs");
			elseif mode==2 then
				--�R���X�f�J�f
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
						SetModeEx( tempEgg , EM_SetModeType_Move, false) ---����	(�_)
						SetModeEx( tempEgg , EM_SetModeType_Revive, false );	--�i����
						SetModeEx( tempEgg , EM_SetModeType_Strikback, false) ---����(�_)
						SetModeEx( tempEgg , EM_SetModeType_Fight, false) ---�i���(�_)
						SetModeEx( tempEgg , EM_SetModeType_Searchenemy, false)	---����(�_)
						AddToPartition( tempEgg , RoomID );
						SetPlot( tempEgg , "dead" ,"Lua_Z23_106298_MaggotDead",0 );
						AddBuff( tempEgg , 621053 , 0 ,-1 );--�Ϯgbuff����
					end
				end
				Z23_Maggot_Global[RoomID].Eggs = Eggs;
				DebugMsg(0,0,"Z23_Maggot_Eggs Count =  "..#Eggs );
				return Eggs;
			elseif mode=="Boss" then
				WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 0  );--��Boss�u�঳�@���b������w
				if type(waitTime)=="number" then  Sleep(waitTime*10); end
				Z23_Maggot_Global[RoomID].Boss={}
				local Boss = kg_GetPosRX( {781031,0}, Bosss );
				Z23_Maggot_Global[RoomID].Boss[1] = Boss;
				Boss = kg_GetPosRX( {781031,8}, Bosss );
				Z23_Maggot_Global[RoomID].Boss[2] = Boss;
				Boss = Z23_Maggot_Global[RoomID].Boss;
				WriteRoleValue( Boss[2] , EM_RoleValue_Register5 , 1 );--15��ۦ��}��
				SetModeEx( Boss[2] , EM_SetModeType_Show, false );
				SetModeEx( Boss[2] , EM_SetModeType_Strikback, false); ---����(�_)
				SetModeEx( Boss[2] , EM_SetModeType_Fight, false); ---�i���(�_)
				SetModeEx( Boss[2] , EM_SetModeType_Mark, false);	----�i�I��(�_)
				SetModeEx( Boss[2] , EM_SetModeType_Searchenemy, false);
				for i=1,2 do
					WriteRoleValue( Boss[i] , EM_RoleValue_Register1 , Ctrl );
					MoveToFlagEnabled( Boss[i],false );
					SetModeEx( Boss[i] , EM_SetModeType_Revive, false );	--�i����
					AddToPartition( Boss[i], RoomID );
					SetPlot( Boss[i] , "dead" , "Lua_Z23_106298_MaggotDead" , 30 );
				end
				SetPlot( Boss[2] , "range" , "Lua_Z23_106298_RangePlot" , 100 );
				AddBuff( Boss[2] , 621072 , 0,-1 );--10����O
			elseif mode=="Doors" then
				if Z23_Maggot_Global[RoomID].ExitDoor == nil or CheckID( Z23_Maggot_Global[RoomID].ExitDoor )~=true then
					local ExitDoor = CreateObjByFlag( 106223, 781031 , 1 , 1 )--�X�f���ת�
					Z23_Maggot_Global[RoomID].ExitDoor = ExitDoor;
					kg_DoorInit( ExitDoor );
					AddToPartition( ExitDoor , RoomID );
					CallPlot( ExitDoor , "Lua_Zone21_CloseDoor" , true );--����
				end
				if Z23_Maggot_Global[RoomID].EnterDoor == nil or CheckID( Z23_Maggot_Global[RoomID].EnterDoor )~=true then
					--local EnterDoor = CreateObjByFlag( 106223, 781031 , 2 , 1 )--�J�f���ת�
					--Z23_Maggot_Global[RoomID].EnterDoor = EnterDoor;
					--kg_DoorInit( EnterDoor );
					--AddToPartition( EnterDoor , RoomID );
					--CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--�}��
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
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_CRAZY]" , C_SYSTEM )--Boss�g��
					AddBuff(Boss,620561 ,0,-1);
				end
				sleep(20)
				timer=timer+2;
			end
		end
	end
	
	if Lua_Z23_106298_BugAI==nil or override==true then
		Lua_Z23_106298_BugAI = function( Boss , Player )	--�p��AI
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
						CancelBuff( Bug , 507181 )--�����D�]
						SysCastSpellLv( Player, Bug, 495767, 0 )--����̰��ŬD�]
					end
					Sleep(10);
				end
			elseif BugOrgID == 106309 then
				CastSpell( Bug , Bug , 498448 );--�I�i�P�a�p�d��@��
				local x,y,z,_ = kg_GetPosRX( Bug , nil , 350  );--�p�a�β��ʶZ���b���վ�
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
			--local RandDir  = RandRange( 3,6 ); DebugMsg( 0,0,"WaveDir="..RandDir ); --�|����H���D�@
			local RandDir = x
			--local RandPos = RandRange( 1,5 ); DebugMsg( 0,0,"WavePos="..RandPos ); --5�q�D�H���D�@
			local RandPos = {}
			RandPos = Az_RND_Ary(1,5,2); --DebugMsg( 0,0,"WavePos="..RandPos ); --5�q�D�H���D�@
			local tempBug;
			local Dis , Angle = 100,90;
			local dMultiple={2,1,0,1,2};
			local aMultiple = {1,1,0,-1,-1};
			for i =1,5 do
				if i~=RandPos[1] and i~=RandPos[2] then
					tempBug = kg_GetPosRX( {781031 , RandDir} , 106309,  Dis*dMultiple[i] , 0 , Angle*aMultiple[i]  ,-3 );
					MoveToFlagEnabled( tempBug,false );
					SetModeEx( tempBug , EM_SetModeType_Revive, false );	--�i����
					SetModeEx( tempBug , EM_SetModeType_Strikback, false) ---����(�_)
					SetModeEx( tempBug , EM_SetModeType_Fight, false) ---�i���(�_)
					SetModeEx( tempBug , EM_SetModeType_Searchenemy, false)	---����(�_)
					AddToPartition( tempBug , ReadRoleValue(OwnerID(), EM_RoleValue_RoomID) );--owner ��boss
					AddBuff( tempBug , 621049 , 0,-1 );--�P�a�S��
					BeginPlot( tempBug , "Lua_Z23_106298_BugAI" , 0 );
				end
			end
		end
	end
	
	if Lua_Z23_106298_BugSkill==nil or override==true then
		Lua_Z23_106298_BugSkill= function(mode)
			local Oid , Tid = OwnerID(), TargetID();
			if mode==1 then	--�P�a�Ϋr�쪱�a
				local Bug = kg_GetPos( Oid , Bux );
				local RoomID = ReadRoleValue(Oid , EM_RoleValue_RoomID);
				local Boss = Z23_Maggot_Global[RoomID].Boss;
				MoveToFlagEnabled( Bug,false );
				SetModeEx( Bug , EM_SetModeType_Revive, false );	--�i����
				AddToPartition( Bug , RoomID );
				SetPlot( Bug , "dead" , "Lua_Z23_106298_MaggotDead" , 30 );
				SysCastSpellLv( Tid, Bug, 495767, 0 )--����̰��ŬD�]
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
	Lua_Z23_106298_SkillInfo("reset",ReadRoleValue(Ctrl,EM_RoleValue_PID) );--�̳yID��l������,���ᱵ���ݭn�̳y���ץh�վ�
	
	Lua_Z23_106298_CreateObj("Doors");
	Lua_Z23_106298_CreateObj("Boss");
	Lua_Z23_106298_CreateObj("Eggs");
end

function Lua_Z23_106298_MaggotAI()
	local Boss = OwnerID();
	if ReadRoleValue(Boss,EM_RoleValue_Register10)==0 then--�N�ҪO��pcall�ഫ,�קK�԰��@������Ĳ�o
		WriteRoleValue( Boss , EM_RoleValue_Register10,1 );
		BeginPlot( Boss, "Lua_Z23_106298_MaggotAI" , 0 );
		return
	end
	local Check_pet = 0
	local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
	if ReadRoleValue(AttackTarget,EM_RoleValue_IsPlayer) ~= 1 and Check_pet == 0 then ---�p�G�O�D���a�i�J�԰�
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
	local BossSwitch = 1;--1:���Ӫ�BOSS , 2: 10���ɤ���Boss
	if ReadRoleValue( Boss ,EM_RoleValue_Register5 )==0 then
		if ReadRoleValue( Ctrl ,EM_RoleValue_Register5 )==0 then
			WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 1 );--�W��A���p�ⰦBoss�P�ɾ԰� �A�|���@���d�U
			DelObj( Z23_Maggot_Global[RoomID].Boss[2] );
		end
		--CallPlot( Z23_Maggot_Global[RoomID].EnterDoor , "Lua_Zone21_CloseDoor" , true );--�J�f�}��
			local EnterDoor = CreateObjByFlag( 106223, 781031 , 2 , 1 )--�J�f���ת�
			Z23_Maggot_Global[RoomID].EnterDoor = EnterDoor;
			kg_DoorInit( EnterDoor );
			AddToPartition( EnterDoor , RoomID );
			CallPlot( EnterDoor , "Lua_Zone21_CloseDoor" , false );--�}��
		BeginPlot( Boss, "Lua_Z23_106298_MaggotCrazy" , 0 );
	else
		BossSwitch=2;
		if ReadRoleValue( Ctrl ,EM_RoleValue_Register5 )==0 then
			WriteRoleValue( Ctrl , EM_RoleValue_Register5 , 1 );--�W��A���p�ⰦBoss�P�ɾ԰� �A�|���@���d�U
			DelObj( Z23_Maggot_Global[RoomID].Boss[1] );
		end
		
	end
	ScriptMessage( Boss , -1 , 2 , "[SC_106298_FIGHT]" , C_SYSTEM );--�i�J�԰��x��
	Sleep(10)
	while 1 do
		if KS_InCombat(Boss)==true then
			if ReadRoleValue( Boss, EM_RoleValue_SpellMagicID )==0 then
				if timer%7==0 then
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_BITE]" , C_SYSTEM );--���ζݫr
					CurrentSkill = 1;--���ζݫr
					atkTarget= ReadRoleValue( Boss ,EM_RoleValue_AttackTargetID );
					CastSpellLv( Boss , atkTarget , SkillID[CurrentSkill] , SkillLV[CurrentSkill]  );
				elseif timer%18==0  and BossSwitch==1 then
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_CALLBABY]" , C_SYSTEM );--Boss15��۳�I��
					
					Lua_Z23_106298_CreateObj("Eggs");--�ɥREggs
					Eggs = Z23_Maggot_Global[RoomID].Eggs
					for i in pairs( Eggs ) do
						SetModeEx( Eggs[i] , EM_SetModeType_Fight , true );
					end
					Sleep(30)
					Lua_Z23_106298_BugWave(box);--�I���Ϊi
					if box ~=6 then
						box = box+1
					else
						box = 3
					end
					Sleep(30);
					
					--Eggs = Z23_Maggot_Global[RoomID].Eggs;
					CurrentSkill = 2;--����½�u
					CastSpellLv( Boss , Boss , SkillID[CurrentSkill] , SkillLV[CurrentSkill]  );
					for i in pairs( Eggs ) do
						if ReadRoleValue( Eggs[i], EM_RoleValue_Register1 )==0 then
							WriteRoleValue( Eggs[i] , EM_RoleValue_Register1 , 1 );--�j�w������Ĳ�o
							CallPlot( Eggs[i] , "Lua_Z23_106298_BugAI" , Boss  );--�}�lAE���즺�`
						end
						SetModeEx( Eggs[i] , EM_SetModeType_Fight , true );
					end
					kg_WaitSpell(Boss);
					--����½�u����I���p�a
					PlayersInHate = {};
					TempTable = KS_GetHateList( Boss , 4 );
					for i in pairs(TempTable) do
						if CheckBuff( TempTable[i] , 621052 )==true then--��X���θ����H
							table.insert( PlayersInHate , TempTable[i] );
						end
					end
					if #PlayersInHate<1 then	--�S���H���θ��h�H�K�D�@�Ӫ��a
						PlayersInHate = TempTable;
					end
					if #PlayersInHate>0 then
						atkTarget = PlayersInHate[ math.random( #PlayersInHate ) ];
					else
						atkTarget = ReadRoleValue(Boss , EM_RoleValue_AttackTargetID);
					end
					
					DebugMsg(0,0,"atkTarget="..atkTarget); --Say( atkTarget ,"ya ma dea~~~" );
					ScriptMessage( Boss , -1 , 2 , "[SC_106298_DASH]" , C_SYSTEM );--Boss�n�����a
					CurrentSkill = 4;
					SetFightMode (  Boss  , 0, 0, 0, 0 );
					PlayMotion( Boss , ruFUSION_ACTORSTATE_SLEEP_BEGIN );
					Sleep(25);
					SetPos( Boss , kg_GetPos( atkTarget ) );
					CastSpellLv( Boss , atkTarget , SkillID[CurrentSkill] , SkillLV[CurrentSkill] );--�I���p�a
					SetFightMode (  Boss  , 1, 1, 0, 1 );
				end
				timer = timer+1; --DebugMsg(0,0,"Z23_Maggot timer="..timer);
			end
		else
			ScriptMessage( Boss , -1 , 2 , "[SC_106298_RESET]" , C_SYSTEM );--Boss���m
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
			WriteRoleValue( Tid , EM_RoleValue_Register2 , 1 );--Ĳ�o�@���W��,Ĳ�o��N���|�AĲ�o
			CallPlot( Tid , "Lua_Z23_106298_RangePlot" , Oid  );
		end
	else
		SetPlot( Oid , "range" , "" , 30 );
		if Player~=nil then
			SetModeEx( Oid , EM_SetModeType_Show, true );
			SetModeEx( Oid , EM_SetModeType_Strikback, true); ---����(�_)
			SetModeEx( Oid , EM_SetModeType_Fight, true); ---�i���(�_)
			SetModeEx( Oid , EM_SetModeType_Mark, true);	----�i�I��(�_)
			SetModeEx( Oid , EM_SetModeType_Searchenemy, true);
		end
	end
end