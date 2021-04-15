--=============================================--
--PE���e

function Lua_ZONE20_PE01_DelMst()--�R���Ҧ��Ǫ�
	DebugMsg(0,0,"ZONE20_PE01_DelMst")
	DebugLog(0,"ZONE20_PE01_DelMst")
	local MstID = ZONE20_PE01_Var["MstID"];
	local Mst = ZONE20_PE01_Mst;
	local MstNum = table.getn(Mst);
	local OrgID;
	
	for i=1, MstNum do
		if Mst[i] ~= nil and CheckID( Mst[i] )== true then
			OrgID = ReadRoleValue( Mst[i], EM_RoleValue_OrgID );
			for j=1, table.getn(MstID) do
				if OrgID == MstID[j] then
					DelObj( Mst[i])
				end
			end
		end
	end
	ZONE20_PE01_Mst = {};
	
	DebugLog(0,"ZONE20_PE01_DelMst End")
	DebugMsg(0,0,"ZONE20_PE01_DelMst End")
end

function Lua_ZONE20_PE01_ResetArcher()--���m�}��
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		ArcherGroup[Ctrl]["Food"] = 500;
		ArcherGroup[Ctrl]["Ammunition"] = 500;
		
		if ArcherGroup[Ctrl]["Member"][1] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][1] ) ~= true then
			Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 );--�гy�}��
		elseif ArcherGroup[Ctrl]["Member"][1] ~= nil then
			CancelBuff( ArcherGroup[Ctrl]["Member"][1], 509792 )--�M���h��
		end
		if ArcherGroup[Ctrl]["Member"][2] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][2] ) == true then
			DelObj( ArcherGroup[Ctrl]["Member"][2] )
		end
		if ArcherGroup[Ctrl]["Member"][3] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][3] ) == true then
			if CheckBuff( ArcherGroup[Ctrl]["Member"][3], 509781 ) == true then--���m�}��
				CancelBuff( ArcherGroup[Ctrl]["Member"][3], 509781 )
			end
		end
	end
end

--=============================================--
--�Ǫ�����

function Lua_ZONE20_PE01_CreateCtrl()--���ͤ���
	local MstFlag = ZONE20_PE01_Var["MstFlag"]
	local Ctrl = KS_CreateObjMode( 115506, MstFlag, 1, 0, 1, 1 );
	ks_SetController( Ctrl )--�]�w���α����
	ZONE20_PE01_Var["Ctrl"] = Ctrl;
	return Ctrl;
end	
	
function Lua_ZONE20_PE01_CreateMst( Phase )--���ͤ���
	DebugMsg(0,0,"ZONE20_PE01 CreateMst     Phase = "..Phase )
	local MstNum = ZONE20_PE01_MstNum;
	local MstFlag = ZONE20_PE01_Var["MstFlag"]
	local PHTime = Zone20_PE01_Var["PHTime"];
	local MstID = ZONE20_PE01_Var["MstID"];
	local ChangeTime = math.floor( PHTime[Phase] /2 );
	local UnitNum = { 8,1,2,4 };
	local Site = {};
	Site[2] = {1,2};
	Site[4] = {4,3};
	Site[6] = {1,2};
	Site[7] = {4,3};
	
	local count = 0;
	local Type = 1;
	local ObjType = Site[Phase][Type];
	local p = Phase;
	local Rnd = { -5,0,5 }
	while true do
		local NowTime = math.floor(PE_GetVar( "Zone20_PE01_PH"..Phase.."_Time" )/1000);
		if NowTime <= 30 then
			return;
		end
		local TotalUnit = 0;		
		for i=1, table.getn(MstID) do
			TotalUnit = TotalUnit + math.floor( MstNum[i] / UnitNum[i] );
		end

		if TotalUnit < 7 then
			if count == 0 then
				if NowTime < ChangeTime then
					if Type == 2 then
						Type = 1;
					else
						Type = 2;
					end
				end
				if p == 6 then
					p = 7;
				elseif p == 7 then
					p =6;
				end
				
				ObjType = Site[p][Type];
			end
			if NowTime < ChangeTime then
				local Array = { UnitNum[Site[p][1]], UnitNum[Site[p][2]] };
				local LCM = KS_lcm( Array );--���o�̤p������, �̤j���]��
				if count+1 >= LCM/ UnitNum[Site[p][3-Type]] then
					count = 0;
				else
					count = count +1;
				end
			else
				if count+1 >= UnitNum[ObjType] then
					count = 0;
				else
					count = count +1;
				end
			end
			
			local obj = KS_CreateObjMode( MstID[ObjType], MstFlag, 1, 15, 1 );
			SetModeEx( obj, EM_SetModeType_Searchenemy , false );		-- ����
			SetModeEx( obj , EM_SetModeType_Strikback , false );		-- ����
			MoveToFlagEnabled( obj, false );
			WriteRoleValue( obj, EM_RoleValue_IsWalk, 0 )
			--WriteRoleValue( obj, EM_RoleValue_PID, 1 )
			AddToPartition( obj, 0 );			
			SetPlot( obj, "Dead", "Lua_ZONE20_PE01_MstDead", 0 )
			CallPlot( obj, "Lua_ZONE20_PE01_MstMove", 0 )
			if ObjType == 3 then
				AddBuff( obj, 509832, 0,-1 )--�]�k�@��
			end
			AddBuff( obj, 502707, 0,-1 )--����^��
			AddBuff( obj, 509835, 0,-1)--�V�~�k«
			table.insert( ZONE20_PE01_Mst, obj );
			MstNum[ObjType] = MstNum[ObjType] +1;
			
			if TotalUnit >= 4 then
				sleep(20+Rnd[rand(3)+1])
			end
		end
		sleep(30+Rnd[rand(3)+1])
	end
	
end

--=============================================--
--�Ǫ�����

function Lua_ZONE20_PE01_MstMove()--�Ǫ�����
	local OID = OwnerID();
	local Barricades = ZONE20_PE01_Barricades;
	local MstFlag = ZONE20_PE01_Var["MstFlag"];
	local Goal = GetMoveFlagCount( MstFlag ) - 1;
	local MoveSite = 1;
	local CheckRange = 45;
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	local FlagX = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_X );
	local FlagY = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Y );
	local FlagZ = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Z );	
	local Rnd = { 	[1] = 1+rand( 6 )*5,
				[2] = 1-rand( 6 )*5 }
	
	while true do
		if CheckBuff( OID, 500660 ) == true then
			CancelBuff( OID, 500660 );
		end
		
		local AttackTargetID = ReadRoleValue( OID, EM_RoleValue_AttackTargetID );
		if AttackTargetID ~= 0 and ReadRoleValue( AttackTargetID, EM_RoleValue_OrgID ) == 105742 and KS_FrontOrBack( AttackTargetID, OID ) < 1 then
			SetStopAttack(OID );
			AttackTargetID = 0;
		end
		
		if AttackTargetID == 0 then
			local Fight = false;			
			for i=1, table.getn( Barricades ) do
				if Barricades[i] ~= nil and GetDistance( OID, Barricades[i] ) <= 50 and GetModeEx( Barricades[i], EM_SetModeType_Fight ) == true then
					if KS_FrontOrBack( Barricades[i], OID ) > 10 and OrgID ~= ZONE20_PE01_Var["MstID"][3] then--���o����/�I��
						SetAttack( OID, Barricades[i] );
						Fight = true;
						break;
					end
				end
			end
		
			if Fight == false then--�Q�ݦu��
				local X = ReadRoleValue( OID , EM_RoleValue_X );
	 			local Z = ReadRoleValue( OID , EM_RoleValue_Z );
				local DisX = ( X - FlagX )^2;
				local DisZ = ( Z - FlagZ )^2;
				local Dis = math.floor( (DisX+DisZ)^0.5);
				
				if Dis <= CheckRange then	-- ����w�I�]�w�U�@�I��m
					if MoveSite == Goal then
						CancelBuff( OID, 509835 )--�V�~�k«
						if OrgID ~= ZONE20_PE01_Var["MstID"][3] then
							ks_AttackMode( OID );--�]�w�i����NPC
							SysCastSpellLv( ZONE20_PE01_Var["General"], OID, 495767, 0 )--�j��D�]
							return;
						else
							NPCSay( OID, "[SC_PE_ZONE20_01_EXIT_0"..(rand(3)+1).."]");
							Sleep(10);
							ZONE20_PE01_MstNum[3] = ZONE20_PE01_MstNum[3] - 1;
							DelObj(OID);
						end
					else
						MoveSite = MoveSite + 1;
						FlagX = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_X );
						FlagY = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Y );
						FlagZ = GetMoveFlagValue( MstFlag , MoveSite , EM_RoleValue_Z );
					end
				end
				MoveDirect( OID , FlagX+Rnd[rand(2)+1]  , FlagY , FlagZ+Rnd[rand(2)+1] );-- ��������
			end		
		end
		sleep(10)
	end
end

--=============================================--
--�ˬd

function Lua_ZONE20_PE01_CheckMonster( Show )--�ˬd�Ǫ�
	local OID = OwnerID();
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			return true;
		end
	end
	Show = Show or false;
	if Show == true then
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--�ؼп��~
	end
	return false;
end

function Lua_ZONE20_PE01_CheckMonster75per()
	local OID = OwnerID();
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			if ReadRoleValue( TID, EM_RoleValue_HP ) <= ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.75 then
				return true;
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 );--��q�L��
			return false;
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--�ؼп��~
	return false;
end

function Lua_ZONE20_PE01_CheckMap()--�ˬd�ϰ�
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true or DW_CheckMap( OID, 1 ) == true then
		return true;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false;
end

--=============================================--
--�����^��

function Lua_ZONE20_PE01_FailureExperimental()--���ѹ���
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	ks_QuestKill( OID, 105738, 1 )--���ȥ����ñ��H�k(
end

function Lua_ZONE20_PE01_DocumentKill()--���L�������
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	ks_QuestKill( OID, 105738, 4 )--���ȥ����ñ��H�k	
end

function Lua_ZONE20_PE01_Sleep()--�Ǫ��ε�
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509758, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	ks_QuestKill( OID, 105738, 1 )--���ȥ����ñ��H�k
end

--=============================================--
--��e³����

function Lua_ZONE20_PE01_Pocket()--�p�]³��
	local OID = OwnerID()
	KS_ClearBuffLV( OID, 509760, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	ks_QuestKill( OID, 105738, 1 )--���ȥ����ñ��H�k
end

function Lua_ZONE20_PE01_Feeding()--�[��³��
	KS_ClearBuffLV( OwnerID(), 509760, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
end

function Lua_ZONE20_PE01_Discard()--���³��
	local Food = OwnerID()
	local master = TargetID()
	KS_ClearBuffLV( master, 509760, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	WriteRoleValue( Food, EM_RoleValue_PID, master )
	AddBuff( Food, 507899, 0, -1 )--���i����
	Hide(Food)
	SetModeEx( Food , EM_SetModeType_Strikback , true )		-- ����
	SetModeEx( Food , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( Food , EM_SetModeType_DisableRotate, true )	--�T����V
	Show(Food, 0 )
	AddBuff( Food, 507899, 0, -1 )--���i����
	
	SetPlot( Food, "Dead", "Lua_ZONE20_PE01_FoodDead", 0 )
	for i=1, 20 do
		SysCastSpellLv( Food, Food, 497708, 0 )
		Sleep(10)
	end
	Lua_ZONE20_PE01_FoodDead()
end

function Lua_ZONE20_PE01_FoodDead()--³�����F
	local Food = OwnerID();	
	local master = ReadRoleValue( Food, EM_RoleValue_PID );
	local MstID = ZONE20_PE01_Var["MstID"];
	
	if HateListCount( Food ) > 0 then
		local HateNum = 0
		for i = 1 , HateListCount( Food ) do						
			Hater = HateListInfo( Food ,i-1 , EM_HateListInfoType_GItemID )	
			local OrgID = ReadRoleValue( Hater, EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					HateNum = HateNum+1;
					break
				end
			end
		end
		if HateNum > 0 then
			ks_QuestKill( master, 105738, HateNum );--���ȥ����ñ��H�k
		end
	end
	DelObj( Food )
	return false
end

function Lua_ZONE20_PE01_DiscardFind()--���³�ɧ��
	local Mst = TargetID()
	if ReadRoleValue( Mst, EM_RoleValue_AttackTargetID ) == 0 then
		SetAttack( Mst, OwnerID() )
	end
end

--=============================================--
--�ɥR�u�Ī�

function Lua_ZONE20_PE01_ReduceArrow()--��ֽb��
	KS_ClearBuffLV( OwnerID(), 509759, 1, false )--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
end

--=============================================--
--���������

function Lua_ZONE20_PE01_DocumentTouch() --Ĳ�I�@��
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_DocumentTouch1" , 30 )
end

function Lua_ZONE20_PE01_DocumentTouch1()
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- NPC
	
	if ( ( CheckBuff( OID, 509751 ) == true and KS_CheckBuffLV( OID, 509758 ) < 2 ) or ( CheckBuff( OID, 509751 ) ~= true and CheckBuff( OID, 509758 ) ~= true ) ) and 
		CheckBuff( OID, 509759 ) ~= true and CheckBuff( OID, 509760 ) ~= true and CheckBuff( OID, 509761 ) ~= true then
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_DocumentTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
	end
end



function Lua_ZONE20_PE01_DocumentTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			AddBuff( OID, 509758, 0, -1 );--��a���
			CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--����
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--�@��U���b

function Lua_ZONE20_PE01_ArrowTouch() --Ĳ�I�@��
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_ArrowTouch1" , 30 )
end

function Lua_ZONE20_PE01_ArrowTouch1()
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- NPC
	local BuffNum = KS_CheckBuffLV( OID, 509759 );
	if CheckBuff( OID, 509770 ) == true then--��í�w���Ť��
		BuffNum = BuffNum+1;
	end
	if CheckBuff( OID, 509774 ) == true then--�}�]�Ť��
		BuffNum = BuffNum+1;
	end
	if 	(	( CheckBuff( OID, 509753 ) == true and BuffNum < 3 ) --��PE���A
			or ( CheckBuff( OID, 509753 ) ~= true and BuffNum < 1 )	) --���q���A�B�S���b�U
			and CheckBuff( OID, 509758 ) ~= true --�S����L�귽
			and CheckBuff( OID, 509760 ) ~= true 
			and CheckBuff( OID, 509761 ) ~= true then
		local Time = 30;
		if CheckBuff( OID, 509776 ) == true then--��H����
			Time = 10;
		end
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", Time, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_ArrowTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
	end
end

function Lua_ZONE20_PE01_ArrowTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			AddBuff( OID, 509759, 0, -1 );--��a�b�U
			--CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--����
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--�@�U³��

function Lua_ZONE20_PE01_FoodTouch() --Ĳ�I�@��
	SetPlot( OwnerID() , "touch" , "Lua_ZONE20_PE01_FoodTouch1" , 30 )
end

function Lua_ZONE20_PE01_FoodTouch1()
	local OID = OwnerID() 	-- ���a
	local TID = TargetID()  	-- NPC
	
	if ( 	( CheckBuff( OID, 509752 ) == true and 
		( CheckBuff( OID, 509766 ) ~= true and KS_CheckBuffLV( OID, 509760 ) < 2 ) or --�[��
		CheckBuff( OID, 509766 ) == true and KS_CheckBuffLV( OID, 509760 ) < 1 ) 
		or ( CheckBuff( OID, 509752 ) ~= true and CheckBuff( OID, 509760 ) ~= true ) ) and 
		
		CheckBuff( OID, 509758 ) ~= true and CheckBuff( OID, 509759 ) ~= true and CheckBuff( OID, 509761 ) ~= true then
		if BeginCastBarEvent( OID, TID,"[SC_RUNRUNPUMPKIN_05]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_ZONE20_PE01_FoodTouch2" ) ~= 1 then 
			ScriptMessage( OID, OID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
			return
		end
	else
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
		ScriptMessage( OID, OID, 0,"[SC_PE_ZONE20_01_FULL]", 0 )--�A�L�k��a��h�F�I
	end
end

function Lua_ZONE20_PE01_FoodTouch2( OID, CheckStatus )
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then-- ���\
			AddBuff( OID, 509760, 0, -1 );--��a³��
			--CallPlot( TargetID(), "ks_resetObj", TargetID(), 25 )--����
		end
		EndCastBar( OID, CheckStatus );
	end
end

--=============================================--
--�ǳƦn���}��

function Lua_ZONE20_PE01_RegArcher()--���U�}������
	ZONE20_PE01_Var["GetArcher"] = OwnerID();	
	--Hide( OwnerID() );
end

function Lua_ZONE20_PE01_ArcherSpeak()--�}����
	local TID = TargetID() --�ɵ��I
	local OID = OwnerID() --���a
	
	local BuffNum = KS_CheckBuffLV( OID, 509761 );
	if ZONE20_PE01_Var["ArcherNum"] < 8 and
		( CheckBuff( OID, 509754 ) == true and BuffNum < 2 ) or 
		( CheckBuff( OID, 509754 ) ~= true and BuffNum < 1 ) then--���o���w���󨭤WBUFF���� 
		
		SetSpeakDetail( OID, "[SC_PE_ZONE20_01_ARCHER]");
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_GETARCHER]", "Lua_ZONE20_PE01_GetArcher", 0 )--����}��
	else	
		SetSpeakDetail( OID, "[SC_PE_ZONE20_01_NOARCHER]");
	end
end

function Lua_ZONE20_PE01_GetArcher()--����}��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	CloseSpeak( OID );

	Hide( TID)
	WriteRoleValue( TID, EM_RoleValue_PID, 0 );--�ֳt�x�ۧP�_
	SetModeEx( TID, EM_SetModeType_Move, false )
	BeginPlot( TID, "Lua_ZONE20_PE01_ArcherWaiting", 0 );	
	
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	local Archer = CreateObj( 118456, X, Y, Z, 0, 1 );
	
	ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] + 1;
	WriteRoleValue( Archer, EM_RoleValue_PID, OID );
	SetModeEx( Archer , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( Archer , EM_SetModeType_HideName , false )	-- �W��
	AddToPartition( Archer, 0 );
	
	AddBuff( OID, 509761, 0, -1 )--�a��}��
	BeginPlot( Archer, "Lua_ZONE20_PE01_ArcherRun", 0 );
end

function Lua_ZONE20_PE01_ArcherWaiting()--���ݭ���
	local OID = OwnerID()
	for i=1, 60 do
		if ReadRoleValue( OID, EM_RoleValue_PID ) > 0 then--�ֳt�x�ۧP�_
			WriteRoleValue( OID, EM_RoleValue_PID, 0 );--�ֳt�x�ۧP�_
			Show( OID, 0 );
			DebugMsg(0,0,"ZONE20_PE01 Archer Show")
			SetModeEx( OID, EM_SetModeType_Move, true )
			return;
		end
		Sleep(10)
	end
	Show( OID, 0 );
	WriteRoleValue( OID, EM_RoleValue_PID, 0 );--�ֳt�x�ۧP�_
	DebugMsg(0,0,"ZONE20_PE01 Archer Show")
	SetModeEx( OID, EM_SetModeType_Move, true )
end

function Lua_ZONE20_PE01_ArcherRun()--�}�Ⲿ��
	local  OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_PID );
	while true do
		if CheckID( master ) == true and CheckBuff( master, 509761 ) == true and --�a��}��
			ReadRoleValue( master, EM_RoleValue_IsDead )  ~= 1 and DW_CheckMap( master, ZONE20_PE01_Var["MapID"] ) == true then
			SetFollow( OID, master );
		else
			CancelBuff( master, 509761 )
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			DelObj( OID );
		end
		Sleep(10)
	end
end

function Lua_ZONE20_PE01_CheckArcher()--�ˬd����
	local OID = OwnerID();
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true then
		local GetArcher = ZONE20_PE01_Var["GetArcher"];
		if GetModeEx( GetArcher, EM_SetModeType_Move ) == false and ZONE20_PE01_Var["ArcherNum"] < 8 then
			return true;
		end
		ScriptMessage( OID, OID, 1,"[SC_PE_ZONE20_01_RECRUIT]", 0 )--�ثe�٤��ݭn���x�ۡC
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false;
end

function Lua_ZONE20_PE01_ReArcher()--d1�ߧY�ɥR����
	local OID = OwnerID();
	local GetArcher = ZONE20_PE01_Var["GetArcher"];
	WriteRoleValue( GetArcher, EM_RoleValue_PID, 1 );
	ks_QuestKill( OID, 105738, 4 );--���ȥ����ñ��H�k
end

function Lua_ZONE20_PE01_ArcherExit()--�������}
	local OID = OwnerID();
	AddBuff( OID, 506098, 0, 1 )--�e���@��
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	local X = ReadRoleValue( Ctrl, EM_RoleValue_X );
	local Y = ReadRoleValue( Ctrl, EM_RoleValue_Y );
	local Z = ReadRoleValue( Ctrl, EM_RoleValue_Z );
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 );
	ZONE20_PE01_ArcherGroup[Ctrl]["Member"][3] = nil;
	CancelBuff( OID, 509791 ) --�S���Y	
	Y = GetHeight( X, Y, Z )
	SetPos( OID, X, Y, Z, 0 );
end

--=============================================--
--�˳ƺ�}������

function Lua_ZONE20_PE01_SetDeader()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_IDLE_DEAD );
end

--=============================================--
--�[�j����

function Lua_ZONE20_PE01_PriorityAttack()--�u������
	local TID = TargetID();
	AddBuff( TID, 509779, 0, -1 );--�u���ؼ�
	WriteRoleValue( TID, EM_RoleValue_Register2, OwnerID() );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
				if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) ~= 1 and
					GetDistance( ArcherGroup[Ctrl]["Member"][i], TID ) < 250 and
					ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_AttackTargetID ) ~= TID then
					ClearHateList( ArcherGroup[Ctrl]["Member"][i], -1 );
					SetAttack( ArcherGroup[Ctrl]["Member"][i], TID );
				end
			end
		end
	end	
end

function Lua_ZONE20_PE01_ComicArrow()--�s���b
	local TID = TargetID();
	AddBuff( TID, 620019, 0, -1 );--���ڤ���
	WriteRoleValue( TID, EM_RoleValue_Register3, OwnerID() );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
				if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) ~= 1 and
					GetDistance( ArcherGroup[Ctrl]["Member"][i], TID ) < 250 and
					ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_AttackTargetID ) ~= TID then
					ClearHateList( ArcherGroup[Ctrl]["Member"][i], -1 );
					SetAttack( ArcherGroup[Ctrl]["Member"][i], TID );
				end
			end
		end
	end	
end

function Lua_ZONE20_PE01_PayCommandCheck()--ú��R�O�ˬd
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true or DW_CheckMap( OID, 1 ) == true then
		if CheckBuff( TargetID(), 509758 ) == true then--��a���
			if CheckBuff( OID, 620022 ) ~= true then--�S�����x���K
				return true;
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_SECRET]" , 0 )--�A�w�g�֦����x���K
			return false;
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_COMMAND]" , 0 )--�ؼШS���ŦX�����A
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false;
end

function Lua_ZONE20_PE01_GetSecret()--���o���K
	local OID = OwnerID();
	local TID = TargetID();
	local Num = 1;
	AddBuff( OID, 509780, 0, -1 )--���x���K
	
	if OID == TID then
		AddBuff( OID, 509817, 3, -1 );--���K������
		ks_QuestKill( OID, 105738, 2 );--���ȥ����ñ��H�k
	else
		ks_QuestKill( OID, 105738, 1 );--���ȥ����ñ��H�k
		if CheckAcceptQuest( TID, 424292 ) == true then
			ks_QuestKill( TID, 105738, 1 );--���ȥ����ñ��H�k
			AddBuff( TID, 509817, 3, -1 );--���K������
		else
			AddBuff( TID, 509814, 3, -1 );--�N�x���g��
		end
	end	
	
	CancelBuff( OID, 509758 )--�������
end

function Lua_ZONE20_PE01_ClearArcherCheck()--�M���}���ˬd
	local OID = OwnerID()
	if DW_CheckMap( OID, ZONE20_PE01_Var["MapID"] ) == true then
		local ArcherGroup = ZONE20_PE01_ArcherGroup;
		for Ctrl in pairs( ArcherGroup ) do
			if GetDistance( OID, Ctrl ) < 100 then
				for i=1, 3 do
					if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
						return true;
					end
				end
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_NOSUPPLY]" , 0 )--����S�����m�b��
		return false;
	end
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false;
end

function Lua_ZONE20_PE01_ClearArcher()--�M���}��
	local OID = OwnerID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		if GetDistance( OID, Ctrl ) < 100 then
			for i=1, 3 do
				if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then				
					if ReadRoleValue( ArcherGroup[Ctrl]["Member"][i], EM_RoleValue_IsPlayer ) == 1 then
						CancelBuff( ArcherGroup[Ctrl]["Member"][i], 509781 );
					else
						DelObj( ArcherGroup[Ctrl]["Member"][i] );
						ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
					end
				end
			end
			ks_QuestKill( OID, 105738, 5 );--���ȥ����ñ��H�k
			return;
		end
	end
end

function Lua_ZONE20_PE01_FindWeakness()--�}�x�z�I
	local OID = OwnerID();
	KS_ClearBuffLV( OID, 509758, 1, false );--�M������(Obj)���WBuffID �h��(Lv) Ĳ�o�ĪG(Event) 
	CancelBuff( OID, 509780 );
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509782, 0, -1);--�}�x�z�I
			end
		end
	end
	ks_QuestKill( OID, 105738, 4 );--���ȥ����ñ��H�k
end
--=============================================--
--���O�䴩

function Lua_ZONE20_PE01_SetBomb()--�񬵼u
	local OID = OwnerID()
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Bomb = CreateObj( 105740, X, Y, Z, 0, 1 )
	SetModeEx( Bomb , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( Bomb, EM_SetModeType_Move , false )		-- ����
	SetModeEx( Bomb , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( Bomb , EM_SetModeType_Fight, false )			-- �i�������
	AddToPartition( Bomb, 0 )
	WriteRoleValue( Bomb, EM_RoleValue_PID, OID )
	BeginPlot( Bomb, "Lua_ZONE20_PE01_BombAttack", 0 )
end

function Lua_ZONE20_PE01_BombAttack()--���u�l��
	local Bomb = OwnerID()
	local MstID = ZONE20_PE01_Var["MstID"];
	
	for i=1, 20 do
		Sleep(10)
		local NPC = SearchRangeNPC( Bomb, 80 );
		for i=0, table.getn(NPC)-1 do
			local OrgID = ReadRoleValue( NPC[i], EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					CastSpell( Bomb, Bomb, 497709 )--���z
					Sleep(5)
					DelObj( Bomb)
					return
				end
			end
		end
	end
	DelObj( Bomb)
end

function Lua_ZONE20_PE01_SetMagic()--�]�w�]�O���Ӫ�
	local OID = OwnerID()
	Hide(OID)
	SetModeEx( OID , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetModeEx( OID, EM_SetModeType_Move , false )		-- ����	
	SetModeEx( OID , EM_SetModeType_HideName , true )		-- �W��
	Show( OID, 0 )
	AddBuff( OID, 508946, 0, -1 )--�L��+�˦�
	CastSpell( OID, OID, 497711 )--�I���]�O����
end

--=============================================--
--���w�Ԥh�Q��

function Lua_ZONE20_PE01_CheckPuppet()--���w�ˬd
	local OID = OwnerID();
	if ReadRoleValue( TargetID(), EM_RoleValue_OrgID ) == ZONE20_PE01_Var["DeaderID"] then
		local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
		if Puppet == 0 or ( Puppet ~= 0 and CheckID( Puppet ) ~= true ) then
			return true;
		else
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_PUPPET]" , 0 );--���w�w�s�b
			return false;
		end
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--�ؼп��~
	return false;
end

function Lua_ZONE20_PE01_CreatePuppet()--�гy���w
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	CallPlot( TID, "ks_resetObj", TID, 25 )
		
	local Puppet = CreateObj( 105741, X, Y, Z, 0, 1 );
	WriteRoleValue( OID, EM_RoleValue_Register3, Puppet )--�O��
	
	WriteRoleValue( Puppet, EM_RoleValue_PID, OID );
	SetModeEx( Puppet, EM_SetModeType_Fight , true )		-- �i�������
	SetModeEx( Puppet , EM_SetModeType_Strikback , true )		-- ����
	SetModeEx( Puppet, EM_SetModeType_Searchenemy , false )	-- ����
	AddToPartition( Puppet, 0 );
		
	AddBuff( Puppet, 509789, 0, -1 );--�ˬd�D�H
	CancelBuff( OID, 509758 );
end

function Lua_ZONE20_PE01_PuppetCheckMaster()--���w�ˬd�D�H
	local OID = OwnerID();
	local Master = ReadRoleValue ( OID , EM_RoleValue_PID );
	if	CheckBuff( OID, 509789 ) ~= true or CheckID( Master ) ~= true or 
		( DW_CheckMap( Master, ZONE20_PE01_Var["MapID"] ) ~= true and 
		DW_CheckMap( Master, 1 ) ~= true ) or
		ReadRoleValue( Master, EM_RoleValue_IsDead ) == 1 or 
		ReadRoleValue( OID, EM_RoleValue_IsDead ) == 1 then
		
		local X = ReadRoleValue( OID, EM_RoleValue_X );
		local Y = ReadRoleValue( OID, EM_RoleValue_Y );
		local Z = ReadRoleValue( OID, EM_RoleValue_Z );
		local Facker = CreateObj( ZONE20_PE01_Var["DeaderID"], X, Y, Z, 0, 1 );
		ks_ActorMode( Facker, true );
		AddToPartition( Facker, 0 );
		WriteRoleValue( Facker, EM_RoleValue_LiveTime, 10 );
		SetDefIdleMotion( Facker, ruFUSION_ACTORSTATE_DEAD );
		DelObj( OID );
	elseif ReadRoleValue( OID, EM_RoleValue_AttackTargetID ) == 0 then
		local X = ReadRoleValue( master, EM_RoleValue_X );
		local Y = ReadRoleValue( master, EM_RoleValue_Y );
		local Z = ReadRoleValue( master, EM_RoleValue_Z );
		ks_Move( OID, 30, X, Y, Z ) --��H(RoleID)���ʨ���w��m
	end
end

function Lua_ZONE20_PE01_DelPuppet()--�M�����w
	local OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_PID );
	WriteRoleValue( master, EM_RoleValue_Register3, 0 )--�O��
	DelObj( OID);
end

function Lua_ZONE20_PE01_CheckMyPuppet( Mode )--���w�ˬd
	local OID = OwnerID();
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	if Puppet ~= 0 and CheckID(Puppet) == true and ReadRoleValue( Puppet, EM_RoleValue_OrgID ) == 105741 then
		Mode = Mode or 0;
		if Mode == 1 then
			local MstID = ZONE20_PE01_Var["MstID"];
			local OrgID = ReadRoleValue( TargetID(), EM_RoleValue_OrgID );
			for i=1, table.getn(MstID) do
				if OrgID == MstID[i] then
					return true;
				end
			end
			ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--�ؼп��~
			return false;
		end
		return true;
	end
	
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_NOPUPPET]" , 0 );--�ثe�S���i�ϥΪ����w
	return false;
end

function Lua_ZONE20_PE01_PuppetCharge()--���w�ľW
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�	
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	SetStopAttack( Puppet )--�������
	ClearHateList( Puppet, -1 )--�M������	
	if GetDistance( Puppet, TID ) > 50 then
		KS_Move( Puppet, 35, TID );
	end
	SysCastSpellLv( TID, Puppet, 496946, 100 )--��������
	SetAttack( Puppet, TID );
end

function Lua_ZONE20_PE01_BuffPuppet()--���P���w�j��
	local OID = OwnerID();
	CancelBuff( OID, 509758 );
	
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	AddBuff( Puppet, 509788, 0, -1 );--���w�Ԥh�j��	
	
	CancelBuff_NoEvent( Puppet, 509789 );--���w�Ԥh�ˬd
	AddBuff( Puppet, 509789, 0, -1 );--���m�s�b�ɶ�
end

function Lua_ZONE20_PE01_CheckBuffPuppet( Type )--�ˬd���w�j�ƪ��A
	if Type == 1 and CheckBuff( OwnerID(), 509788 ) ~= true then
		return true;
	elseif Type == 2 and CheckBuff( OwnerID(), 509788 ) == true then
		return true;
	end
	return false;
end

function Lua_ZONE20_PE01_PuppetBomb()--���w���u
	local OID = OwnerID()
	local Puppet = ReadRoleValue( OID, EM_RoleValue_Register3 );
	WriteRoleValue( OID, EM_RoleValue_Register3, 0 );
	SetModeEx( Puppet , EM_SetModeType_Strikback , false )		-- ����	
	SetModeEx( Puppet , EM_SetModeType_Move, false )
	SetStopAttack( Puppet );
	BeginPlot( Puppet, "Lua_ZONE20_PE01_PuppetBombGo", 0 )--���z�a
end

function Lua_ZONE20_PE01_PuppetBombGo()
	local Puppet = OwnerID();
	Sleep(10)
	CastSpell( Puppet, Puppet, 497743 )--���z
	SetModeEx( Puppet, EM_SetModeType_Fight , false )		-- �i�������
end

--=============================================--
--���޲z��

function Lua_ZONE20_PE01_ManagerSpeak()--�޲z�����
	local TID = TargetID() --�ɵ��I
	local OID = OwnerID() --���a
	SetSpeakDetail( OID, "[SC_PE_ZONE20_01_MANAGER]");
	if CheckBuff( OID, 509758 ) == true then--��a���
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_DOC]", "Lua_ZONE20_PE01_PayDocument",0) --ú����C
	end
end


function Lua_ZONE20_PE01_PayDocument()--ú����
	local OID = OwnerID();
	CloseSpeak( OID );
	if CheckAcceptQuest( OID, 424292 ) == true then
		AddBuff( OID, 509817, 0, -1 );--���K������
		if CheckBuff( OID, 509751 ) == true then--����Ū�M�a
			ks_QuestKill( OID, 105738, 2 );--���ȥ����ñ��H�k
		else
			ks_QuestKill( OID, 105738, 1 );--���ȥ����ñ��H�k
		end
	else
		AddBuff( OID, 509814, 4, -1 );--�N�x���g��
	end
	CancelBuff( OID, 509758 );
end

--=============================================--
--�ɵ��I

function Lua_ZONE20_PE01_SupplySpeak()--�ɵ��I���
	local TID = TargetID() --�ɵ��I
	local OID = OwnerID() --���a
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local Food = ArcherGroup[TID]["Food"];
	local Ammunition = ArcherGroup[TID]["Ammunition"];
	SetSpeakDetail( OID, "[SC_PE_ZONE20_01_SUPPLY][$SETVAR1 = "..Ammunition.."][$SETVAR2 = "..Food.."]" ) --�ثe�u�Ķq:X ³���q:Y
	
	if CheckBuff( OID, 509759 ) == true or CheckBuff( OID, 509770 ) == true  or CheckBuff( OID, 509774 ) == true then --��a�b�U/��í�w���Ť��/�}�]�Ť��
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_ARROW]", "Lua_ZONE20_PE01_PayArrow",0) --ú��b�U�C
	end
	if CheckBuff( OID, 509760 ) == true or CheckBuff( OID, 509766 ) == true then--��a³��/�[��³��
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_PAY_FOOD]", "Lua_ZONE20_PE01_PayFood",0) --ú��³���C
	end
	
	if CheckBuff( OID, 509761 ) == true or  CheckBuff( OID, 509777 ) == true then--�a��}��
		AddSpeakOption( OID, TID, "[SC_PE_ZONE20_01_SUPPLY_ARCHER]", "Lua_ZONE20_PE01_SupplyArcher",0) --�ɥR�}��C
	end
end

function Lua_ZONE20_PE01_PayArrow()--ú��b�U
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	local BuffNum = KS_CheckBuffLV( OID, 509759 )--���o���w���󨭤WBUFF����
	if CheckAcceptQuest( OID, 424292 ) == true then
		AddBuff( OID, 509815, FlagSite-1, -1 );--�t�g�����Z		
				
		if CheckBuff( OID, 509770 ) == true then--��í�w���Ť��
			BuffNum = BuffNum+1;
		end
		if CheckBuff( OID, 509774 ) == true then--�}�]�Ť��
			BuffNum = BuffNum+1;
		end
		
		ks_QuestKill( OID, 105738, BuffNum );--���ȥ����ñ��H�k
		ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] + BuffNum*40;
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--�N�x���g��
		ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] +40;
	end

	for i=1, 3 do
		if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
			if BuffNum == 3 then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509768, 0, -1 );--�ݥνb��
			end
			if CheckBuff( OID, 509770 ) == true then--��í�w���Ť��
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509775, 0, -1 );--�z���b��
			end
			if CheckBuff( OID, 509774 ) == true then--�}�]�Ť��
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509773, 0, -1 );--���]�b��
			end
		end
	end
	
	CancelBuff( OID, 509759 );
	CancelBuff( OID, 509770 );
	CancelBuff( OID, 509774 );
end

function Lua_ZONE20_PE01_PayFood()--ú��³��
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	if CheckAcceptQuest( OID, 424292 ) == true then		
		AddBuff( OID, 509816, FlagSite-1, -1 );--��O���ӷ�
		local BuffNum = KS_CheckBuffLV( OID, 509760 )--���o���w���󨭤WBUFF����
		if CheckBuff( OID, 509766 ) == true then--�[��³��
			BuffNum = BuffNum+1;
		end
		ks_QuestKill( OID, 105738, BuffNum );--���ȥ����ñ��H�k
		ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] + BuffNum*40;
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--�N�x���g��
		ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] + 40;
	end
	
	if CheckBuff( OID, 509766 ) == true then--�[��³��
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				AddBuff( ArcherGroup[Ctrl]["Member"][i], 509767, 0, -1 )--���Ī��A
			end
		end
		CancelBuff( OID, 509766 );
	end
	
	CancelBuff( OID, 509760 );
end

function Lua_ZONE20_PE01_SupplyArcher()--�ɥR�}��
	local OID = OwnerID();
	local Ctrl = TargetID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	CloseSpeak( OID );
	
	if CheckAcceptQuest( OID, 424292 ) == true then--�ɥR�}��	
		local ArcherGroup = ZONE20_PE01_ArcherGroup;
		AddBuff( OID, 509818, FlagSite-1, -1 );--�@�e��
		
		local BuffNum = KS_CheckBuffLV( OID, 509761 )--���o���w���󨭤WBUFF����
		if BuffNum > 0 then
			CallPlot( Ctrl, "Lua_ZONE20_PE01_CreateArcher", Ctrl, BuffNum )--�гy�}��
			ks_QuestKill( OID, 105738, BuffNum );--���ȥ����ñ��H�k
		end
		if CheckBuff( OID, 509777 ) == true and ArcherGroup[Ctrl]["Member"][3] == nil 
			or ( ArcherGroup[Ctrl]["Member"][3] ~= nil and CheckID(ArcherGroup[Ctrl]["Member"][3]) ~= true ) then--���@��
			
			CancelBuff( OID, 509777 )--�Ѱ����@��
			DetachObj( OID )--�Ѱ��f��
			AddBuff( OID, 509379, 0, -1)--�Ѱ����M
			local ArcherFlag = ZONE20_PE01_Var["ArcherFlag"];
			ArcherGroup[Ctrl]["Member"][3] = OID;
			local BaseX = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_X );
			local BaseY = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Y );
			local BaseZ = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Z );
			local X = BaseX - 15*math.cos(math.pi*2);
			local Z = BaseZ + 15*math.sin(math.pi*2);
			local Dir = CalDir( (X - BaseX), (Z - BaseZ) );
			AddBuff( OID, 506098, 0, 2 )--�e���@��
			WriteRoleValue( OID, EM_RoleValue_Register2, Ctrl );
			AddBuff( OID, 509781, 0, -1 )--���m�}��
			Y = GetHeight( X, BaseY, Z )
			SetPos( OID, X, BaseY+5, Z, Dir );
		end
	else
		AddBuff( OID, 509814, FlagSite-1, -1 );--�N�x���g��
		Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 )--�гy�}��
	end
	CancelBuff( OID, 509761 )--�a��}��
end

function Lua_ZONE20_PE01_CreateSupply()--�]�w�ɵ��I
	local SupplyFlag = ZONE20_PE01_Var["SupplyFlag"];
	local SupplyID = ZONE20_PE01_Var["SupplyID"];	
	for i=1, 4 do
		local X = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_X )
		local Y = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Y )
		local Z = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Z )
		local Dir = GetMoveFlagValue( SupplyFlag, i, EM_RoleValue_Dir )
		obj = CreateObj( SupplyID, X, Y, Z, Dir, 1 );
		SetModeEx( obj , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
		SetModeEx( obj , EM_SetModeType_ShowRoleHead , false )	-- �Y����		
		AddToPartition( obj, 0 );
		CallPlot( obj, "Lua_ZONE20_PE01_CtrlArcher", i );
	end
end

function Lua_ZONE20_PE01_CtrlArcher( Site )--�}�ⱱ��
	local Ctrl = OwnerID();
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	WriteRoleValue( Ctrl, EM_RoleValue_PID, Site )
	ArcherGroup[Ctrl] = {};
	ArcherGroup[Ctrl]["Member"] = {};
	ArcherGroup[Ctrl]["Food"] = 500;
	ArcherGroup[Ctrl]["Ammunition"] = 500;
	Lua_ZONE20_PE01_CreateArcher( Ctrl, 1 );--�гy�}��
	
	while true do
		for i=1, 3 do
			local Member = ArcherGroup[Ctrl]["Member"][i];
			if Member ~= nil and CheckID( Member ) == true and 
				(ReadRoleValue( Member, EM_RoleValue_IsPlayer ) == 1 or 
				ReadRoleValue( Member, EM_RoleValue_OrgID ) == ZONE20_PE01_Var["ArcherID"] ) then
				
				if ArcherGroup[Ctrl]["Food"] > 0 then
					ArcherGroup[Ctrl]["Food"] = ArcherGroup[Ctrl]["Food"] - 10;
					CancelBuff( Member, 509791 )
				elseif CheckBuff( Member, 509791 ) ~= true then
					AddBuff( Member, 509791, 0, -1 )--�S���Y
				end
			end
		end
		sleep(100)
	end
end

function Lua_ZONE20_PE01_CreateArcher( Ctrl, Num )--�гy�}��
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local ArcherID = ZONE20_PE01_Var["ArcherID"];
	local ArcherFlag = ZONE20_PE01_Var["ArcherFlag"];
	local FlagSite = ReadRoleValue( Ctrl, EM_RoleValue_PID );
	local BaseX = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_X );
	local BaseY = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Y );
	local BaseZ = GetMoveFlagValue( ArcherFlag, FlagSite, EM_RoleValue_Z );
	local CreateNum = 0;
	local Member;
	
	for i=1, 2 do
		Member = ArcherGroup[Ctrl]["Member"][i];
		if Member == nil or ( Member ~= nil and CheckID(Member) ~= true ) then
			local X = BaseX - 15*math.cos(math.pi*2*(i/3));
			local Z = BaseZ + 15*math.sin(math.pi*2*(i/3));
			local Dir = CalDir( (X - BaseX), (Z - BaseZ) );
			obj = CreateObj( ArcherID, X, BaseY, Z, Dir, 1 );
			WriteRoleValue( obj, EM_RoleValue_Register2, Ctrl );
			SetModeEx( obj, EM_SetModeType_Move , false );		-- ����
			AddToPartition( obj, 0 );
			AddBuff( obj, 508946, 0,-1);--�L��+�˦�
			ArcherGroup[Ctrl]["Member"][i] = obj;
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] + 1;
			CreateNum = CreateNum+1;
		elseif ArcherGroup[Ctrl]["Member"][2] ~= nil and CheckID(ArcherGroup[Ctrl]["Member"][2]) == true then
			CheckBuff( Member, 509792 )--�h��
			CheckBuff( Member, 509782 )--�}�x�z�I
			CheckBuff( Member, 509767 )--���Ī��A
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			CreateNum = CreateNum+1;
		end
		if CreateNum >= Num then
			return;
		end
	end
end

function Lua_ZONE20_PE01_GetArcherNum()--���o���W�}��ƶq
	local ArcherGroup = ZONE20_PE01_ArcherGroup
	local Num = 0;	
	for Ctrl in pairs( ArcherGroup ) do
		for i=1, 3 do
			if ArcherGroup[Ctrl]["Member"][i] ~= nil and CheckID( ArcherGroup[Ctrl]["Member"][i] ) == true then
				Num = Num +1;
			end
		end
	end
	ZONE20_PE01_Var["ArcherNum"] = Num;
	DebugMsg( 0,0, "ArcherNum = "..ZONE20_PE01_Var["ArcherNum"] )

end

function Lua_ZONE20_PE01_ArcherAttackBegin()--�}�����
	local OID = OwnerID()
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	if Ctrl == 0 then return end
	
	if ArcherGroup[Ctrl]["Ammunition"] <= 0 then--�u�Ĥ���
		if ReadRoleValue( OID, EM_RoleValue_IsPlayer ) == 1 then
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE20_01_CANT_FIRE]" , 0 )--�u�Ĥ���
		end
		return false;
	end
	
	local TID = TargetID();
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			return true;
		end
	end
	if CheckBuff( OID, 509781 ) == true then--���m�}��
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 );--�ؼп��~
	end
	return false
end

function Lua_ZONE20_PE01_ArcherAttackEnd()--�}���������
	local OID = OwnerID()
	local ArcherGroup = ZONE20_PE01_ArcherGroup;
	
	local Ctrl = ReadRoleValue( OID, EM_RoleValue_Register2 );
	if Ctrl == 0 then return end
	
	ArcherGroup[Ctrl]["Ammunition"] = ArcherGroup[Ctrl]["Ammunition"] - 2;

	if CheckBuff( OID, 509781 ) ~= true then--���m�}��
		if CheckBuff( OID, 509767 ) == true then--���Ī��A
			AddBuff( OID, 509792, 1, -1 )--�h��
		else
			AddBuff( OID, 509792, 0, -1 )--�h��
		end
		if KS_CheckBuffLV( OID, 509792 ) >= 20 then--���o���w���󨭤WBUFF����	
			ZONE20_PE01_Var["ArcherNum"] = ZONE20_PE01_Var["ArcherNum"] - 1;
			DelObj( OID )			
		end
	end
end

function Lua_ZONE20_PE01_ArcherAttackCheck( Type )--�}��ؼ��ˬd
	local OID = OwnerID();
	local TID = TargetID();

	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	if CheckBuff( OID, 509773 ) == true and OrgID == MstID[3] then--���]�b��
		if CheckBuff( TID, 509832 ) == true then
			CancelBuff( TID, 509832 );
			KillID( OID, TID )
		end
		return;
	end
	
	if OrgID == MstID[Type] then
		local Lv = 1;
		if CheckBuff( OID, 509837 ) ~= true then--�g���P�_
			if CheckBuff( OID, 509767 ) == true then--���Ī��A
				Lv =Lv+1;
			end
			if CheckBuff( OID, 509782 ) == true then--�}�x�z�I
				Lv =Lv+2;
			end
			if CheckBuff( OID, 509791 ) == true then--�S���Y
				Lv =Lv-1;
			end
			AddBuff( OID, 509837, Lv, -1 ) --�g���P�_
		end
		
		if Lv ~= 1 and CheckBuff( OID, 509775 ) ~= true then--�z���b��
			SysCastSpellLv( OID, TID, 497741, Lv )--�g��
			return false;
		elseif CheckBuff( OID, 509775 ) == true then--�z���b��
			local Lv = KS_CheckBuffLV( OID, 509837 );
			SysCastSpellLv( OID, TID, 497716, Lv )--�z���b
			CancelBuff( OID, 509837 ) --�g���P�_
			return false;
		end
		 CancelBuff( OID, 509837 ) --�g���P�_
		return true;
	end
	return false;
end

function Lua_ZONE20_PE01_AttackDoublueCheck( Type )--�}��ؼ��ˬd
	local OID = OwnerID();
	local TID = TargetID();

	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID );
	
	if OrgID == MstID[Type] then
		return true;
	end
	return false;
end

--=============================================--
--NPC�]�w

function Lua_ZONE20_PE01_SetGeneral()--�]�w�N�x
	local OID = OwnerID();
	ZONE20_PE01_Var["General"] = OID;
	
	AddBuff( OID, 509929, 0, -1 );--�^��
	AddBuff( OID, 502707, 0,-1 );--����^��
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP );
	WriteRoleValue( OID, EM_RoleValue_HP, MaxHP*0.5 );
end

function Lua_ZONE20_PE01_GeneralBuff()--�N�x�^��
	if HateListCount( OwnerID() ) < 1 then
		AddBuff( OwnerID(), 509929, 0, -1 );--�^��
	end
end

function Lua_ZONE20_PE01_SetBarricades()--�ڰ��]�w
	local Barricades = ZONE20_PE01_Barricades;
	local OID = OwnerID();
	SetModeEx( OID, EM_SetModeType_Fight , true );-- �i�������
	SetModeEx( OID , EM_SetModeType_Strikback , false )	-- ����
	SetModeEx( OID , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( OID, EM_SetModeType_Move , false )		-- ����
	SetModeEx( OID , EM_SetModeType_NotShowHPMP , true )-- ����ܦ��
	AddBuff( OID, 502707, 0, - 1 );--����^��
	
	local Player = SearchRangePlayer( OID, 15 );
	if table.getn(Player) > 0 then
		local X = ReadRoleValue( OID, EM_RoleValue_X );
		local Y = ReadRoleValue( OID, EM_RoleValue_Y );
		local Z = ReadRoleValue( OID, EM_RoleValue_Z );
		for i=0, table.getn(Player)-1 do
			local Site = { -15-rand(3)*5,15+rand(3)*5};
			SetPos( Player[i], X+Site[rand(2)+1], Y+5, Z+Site[rand(2)+1], 0 );
		end
	end
	SetModeEx( OID , EM_SetModeType_Obstruct, true )	--����
	
	for i=1, table.getn(Barricades) do
		if Barricades[i] == OID then
			return;
		end
	end
	table.insert( Barricades, OID );
end

function Lua_ZONE20_PE01_BarricadesDead()--�ڰ����F
	ZONE20_PE01_Var["BarricadesDead"] = ZONE20_PE01_Var["BarricadesDead"] +1;
	local OID = OwnerID();
	SetModeEx( OID, EM_SetModeType_Fight , false );-- �i�������
	SetModeEx( OID , EM_SetModeType_Obstruct, false )	--������
	Hide(OID)
	return false
end

function Lua_ZONE20_PE01_SetWork()--�]�w�u�H
	local Worker = ZONE20_PE01_Worker;
	local OID = OwnerID();
	SetModeEx( OID , EM_SetModeType_Mark , false )	-- �аO
	
	for i=1, table.getn(Worker) do
		if Worker[i] == OID then
			return;
		end
	end
	table.insert( Worker, OID );
end

function Lua_ZONE20_PE01_ClearReg()--�M���Ȧs
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, 0 )
end

function Lua_ZONE20_PE01_MstDead()--�Ǫ����`
	local OID = OwnerID();
	local TID = TargetID();	
	local MstNum = ZONE20_PE01_MstNum;
	local MstID = ZONE20_PE01_Var["MstID"];
	local OrgID = ReadRoleValue( OID, EM_RoleValue_OrgID );
	local MstType = 1;
	for i=1, table.getn(MstID) do
		if OrgID == MstID[i] then
			MstNum[i] = MstNum[i] - 1 ;
			MstType = i;
			break
		end
	end
	
	if CheckBuff( OID, 509779 ) == true then --�u���ؼ�
		local Marker = ReadRoleValue( OID, EM_RoleValue_Register2 );
		ks_QuestKill( Marker, 105738, 2 );--���ȥ����ñ��H�k
	end

	if CheckBuff( OID, 620019 ) == true then --���ڤ���
		local Marker = ReadRoleValue( OID, EM_RoleValue_Register3 );
		ks_QuestKill( Marker, 105738, 1 );--���ȥ����ñ��H�k
	end	
	
	if CheckBuff( TID, 509781 ) == true then--���m�}��
		ks_QuestKill( TID, 105738, 1 );--���ȥ����ñ��H�k
	end
		
	if CheckBuff( TID, 509756 ) == true then--���O�䴩
		if MstType == 1 then
			ks_QuestKill( TID, 105738, 1 );--���ȥ����ñ��H�k
		elseif MstType == 2 then
			ks_QuestKill( TID, 105738, 8 );--���ȥ����ñ��H�k
		elseif MstType == 4 then
			ks_QuestKill( TID, 105738, 4 );--���ȥ����ñ��H�k(
		end
	end
	
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) ~= 1 and ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105741 then--���w
		local Master = ReadRoleValue ( TID , EM_RoleValue_PID );
		ks_QuestKill( Master, 105738, 1 );--���ȥ����ñ��H�k
		if Rand(10)<4 and CheckBuff( master, 509758 ) ~= true then
			AddBuff( master, 509758, 0, -1 )--���P���
		end
	end
	
	DelObj(OID);
	return false;
end

--=============================================--

function Lua_ZONE20_PE01_QuestComplete()--�������Ȱ���
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		AddBuff( Player, 620401, 0, -1 )
	end
end