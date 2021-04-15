
--================================== Init ====================================--

function Lua_Zone13_PE01_GlobalSet()--�ܼƫŧi
	Zone13_PE01_PEIndex = 1301
	Zone13_PE01_Phase = 2	--�}�l���q
	Zone13_PE01_PHIndex = { 100, 200, 300 }
	
	Zone13_PE01_Follow = {}
	
	Zone13_PE01_Var = {}
	Zone13_PE01_Var["MapID"] = 313

	Zone13_PE01_Var["Enemy"] = {	105140,
									105144,
								}
	Zone13_PE01_Var["Friendly"] = {	105194,
									105195,
									105265
								}	
	
	Zone13_PE01_Var["FlagID"] = 780656 -- �X�и��X
	Zone13_PE01_Var["EnemyNum"] = 0
	Zone13_PE01_Var["FriendlyNum"] = 0		
end

function Lua_Zone13_PE01_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE13_01_NAME"					-- ���W���I����
	local PE_Desc = "SC_PE_ZONE13_01_DESC"					-- �_�誺���s���������a�����Ǹ귽�����j����I���O�ȳ��_�I�̤��|���L�̱o�x���I���������a�h��j���D��J����A�L���ǥ��ȭn���A�I
	
	local PEIndex = Zone13_PE01_PEIndex
	local PHIndex = Zone13_PE01_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , Zone13_PE01_Var["MapID"] )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
			
	local PH_Name = {	"SC_PE_ZONE13_01_PH1_NAME",	--�s�F�ӤW(�ڤ��u��)
						"SC_PE_ZONE13_01_PH2_NAME",	--���ս���(�ħڧ���)
						"SC_PE_ZONE13_01_PH3_NAME"	--�Ĳ��ڹ�(�ڤ�H��)
					}
	
	local PH_Desc = {	"SC_PE_ZONE13_01_PH1_DESC",--�_����s���H�ƭ��W�I
						"SC_PE_ZONE13_01_PH2_DESC",--�ȳ��_�I�̩M�_����s����ܳ��J���ۡA�֤]������W���I
						"SC_PE_ZONE13_01_PH3_DESC"--�ȳ��_�I�̵����|����������a�_���I
					}

	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )	
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[3] , PH_Name[3], PH_Desc[3], 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[3], PHIndex[3], "", "", "Zone13_PE01_Lock" , 0, 1,  true )
	
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_OB_SetVisible( PEIndex, PHIndex[3], PHIndex[3], false )
	
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex[2] )
end

function Lua_Zone13_PE01_CheckFollow()--�T�w���H
	local Follow = Zone13_PE01_Follow
	while true do
		sleep(50)
		for site in pairs( Follow ) do
			if CheckID(site) == true and KS_InCombat(site) ~= true then
				SetFollow( site, Follow[site] )
			elseif CheckID(site) ~= true then
				table.remove( Follow, site )
			end
		end
		Lua_Zone13_PE01_CheckPhase()--�ˬd���q
	end
end

function Lua_Zone13_PE01_CheckPhase()--�ˬd���q
	local PEIndex = Zone13_PE01_PEIndex
	local PHIndex = Zone13_PE01_PHIndex
	local EnemyNum = Zone13_PE01_Var["EnemyNum"]
	local FriendlyNum = Zone13_PE01_Var["FriendlyNum"]
	
	if EnemyNum > math.floor(FriendlyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[3] )
		Zone13_PE01_Phase = 3
	elseif FriendlyNum > math.floor(EnemyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[1] )
		Zone13_PE01_Phase = 1
	else
		PE_JumpToPhase( PEIndex, PHIndex[2] )
		Zone13_PE01_Phase = 2
	end
end

--================================== CheckType ====================================--

function Lua_Zone13_PE01_CheckType01()--�ˬd�O�_�����s
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then		
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_CheckType02()--�ˬd�O�_���_�I��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()
	local Friendly = Zone13_PE01_Var["Friendly"]
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_CheckType03()--�ˬd�O�_���_�I�̥BHP�C��50%
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] and 
			ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.5 then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_CheckType04()--�ˬd�O�_�����s�BHP�C��50%
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE01_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then 
			if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.5 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 )--��q�Ӱ��L�k�ϥ�
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_CheckType05()--�ˬd�O�_���_�I�̩Ϊ��a
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] or ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 then
			return true
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

--================================== skill 1 ====================================--

function Lua_Zone13_PE01_CheckKill01()--�ˬd75%�ˮ`�U�O�_�|���`
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	if ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.75 > ReadRoleValue( TID, EM_RoleValue_HP ) then
		ks_QuestKill( OID, 105197, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	else
		ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	return true
end


--================================== skill 2 ====================================--

function Lua_Zone13_PE01_CheckSmith()--�ˬd�O�_���u�K
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 117314 then
		local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
		if reg == 0 or reg == OID then
			return true
		else
			ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--�ؼХ��b���L��
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_PlayerWork()--�}�l�u�@
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
	if reg == 0 and ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496911 then
		WriteRoleValue( TID, EM_RoleValue_Register2, OID )--���U
		CallPlot( TID, "Lua_Zone13_PE01_SmithWork", OID )--�u�K�}�l�u�@
		ScriptMessage( TID, OID, 1 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--���ܰT��
		ScriptMessage( TID, OID, 0 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--���ܰT��		
	elseif reg == OID then
		local type = {	[496878] = 1, 
						[496879] = 2,
						[496880] = 3 }	
		local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--Ū���ޯ�
		if type[MID] ~= nil then
			WriteRoleValue( TID, EM_RoleValue_Register4, type[MID] )--���U�u�@���e
		end
	end
end

function Lua_Zone13_PE01_SmithWork( player )--�u�K�u�@
	local OID = OwnerID()--�u�K
	local count = 0 --���\����
	
	while true do		
		sleep(25)
		local WorkInfo = ReadRoleValue( OID, EM_RoleValue_Register3 )--�u�@���e
		local PlayerWork = ReadRoleValue( OID, EM_RoleValue_Register4 )--���a���檺�u�@
		if 	WorkInfo == 0 then
			local rnd = rand(3)+1
			AdjustFaceDir( OID, player, 0 ) --���V�ؼ�
			WriteRoleValue( Player, EM_RoleValue_Coldown_Job + 382 , 0 )
			WriteRoleValue( OID, EM_RoleValue_Register3, rnd )--���U�u�@���e
			ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH0"..rnd.."]" , "0xffffff00" )--���ܰT��
			ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH0"..rnd.."]" , "0xffffff00" )--���ܰT��
		else
			if PlayerWork == WorkInfo then				
				if count == 3 then
					AdjustFaceDir( OID, player, 0 ) --���V�ؼ�
					ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH05]" , "0xffffff00" )--�����T��
					ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH05]" , "0xffffff00" )--�����T��					
					ks_QuestKill( player, 105197, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					sleep(15)
					ks_ResetRegValue()--�Ȧs�ȭ��m
					CallPlot( OID, "ks_resetObj", OID, 10 )--60��᭫��
					break
				else
					count = count +1
					WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--�M���u�@���e					
				end
			else				
				MagicInterrupt( player )--���_
				AdjustFaceDir( OID, player, 0 ) --���V�ؼ�
				ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_01_SMITH04]" , 0 )--���ѰT��
				ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_01_SMITH04]" , 0 )--���ѰT��				
				ks_ResetRegValue()--�Ȧs�ȭ��m
				break
			end			
		end
		Sleep(15)
	end
end

--================================== skill 3 ====================================--

function Lua_Zone13_PE01_ConvinceEnemy()--���A
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if CheckBuff( TID, 508582 ) == true or rand(10)>4 then
		ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		BeginPlot( TID, "Lua_Zone13_PE01_FriendlyGoBack", 0 )--�]�^�a
	else
		SysCastSpellLv( OID, TID, 495767, 0 )--����̰��ŬD�]
	end	
end

function Lua_Zone13_PE01_CheckBribe()--�ˬd�O�_�����s�B�i���
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if CheckBuff( TID, 508948 ) ~= true then			
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SAY_NPC_BUSY]" , 0 )--���L��
			return false			
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE01_BribeEnemy()--���R
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	AddBuff( TID, 508948, 0, -1 )--��A��
	CallPlot( TID, "Lua_Zone13_PE01_BribeEnemyDo", OID )
end	

function Lua_Zone13_PE01_BribeEnemyDo( player )--�}�l���R	
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	AddBuff(OwnerID() , 501570,0,-1);
	DialogCreate( player, EM_LuaDialogType_Select, "[SC_PE_ZONE13_01_GOLD]")
	for i=1, 5 do
		DialogSelectStr( player, "[SC_PE_ZONE13_01_GOLD"..i.."]" )
	end

	local times = 0
	local percent = { 7,15,30,60,100 }
	local LessMoney = { 100,200,400,800,1600 }
	if ( DialogSendOpen( Player ) == false ) then 
		ScriptMessage( Player , Player , 1 , GetString("SYS_FIXEQ_DATA_ERROR") , 0 )	--��ưe�X�����D
		CancelBuff( Player, 501570 );--
		return
	end

	local FX = ReadRoleValue( Player,EM_RoleValue_X )--�ˬd��e�y��
	local FZ = ReadRoleValue( Player,EM_RoleValue_Z )--�ˬd��e�y��
	
	while true do		--���ݪ��a�I��
		if times == 10 then
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--������A
			return
		end
		times = times + 1
				
		if	DW_CheckMap( player, Zone13_PE01_Var["MapID"] ) ~=true then 
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--������A
			return
		end

		local PX = ReadRoleValue( Player,EM_RoleValue_X )--�ˬd��e�y��
		local PZ = ReadRoleValue( Player,EM_RoleValue_Z )--�ˬd��e�y��
		local Dis = math.floor(( (FX-PX)^2 + (FZ-PZ)^2 )^0.5)--�D�Z��		
		if	Dis > 100	then --�Y�Z���W�LRange �h�j��������
			DialogClose( Player )
			CancelBuff( Player, 501570 );--
			CancelBuff( OwnerID(), 508948 )--������A
			return
		end
		
		local Result = DialogGetResult( Player )	
		if Result~=nil and Result>-2 then
			if Result >= 0 then
				DialogClose( Player )
				CancelBuff( Player, 501570 );--
				local Money = ReadRoleValue( Player, EM_RoleValue_Money )
				if ( Money - LessMoney[Result+1] ) >= 0 then
					WriteRoleValue( Player, EM_RoleValue_Money, Money - LessMoney[Result+1] )
					if percent[Result+1] > rand(100) then
						Lua_Zone13_PE01_FriendlyGoBack()--�]�^�a
						ks_QuestKill( Player, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					else
						local message = {	"[SC_PE_ZONE13_01_ERROR1]",
										"[SC_PE_ZONE13_01_ERROR2]"
									}
						NPCSay( OwnerID(), message[rand(2)+1])				
					end
				else
					ScriptMessage( Player, Player, 1 , "[SYS_GAMEMSGEVENT_507]" , 0 )--��������
				end
				CancelBuff( OwnerID(), 508948 )--������A
				break
			elseif Result==-1 then
				DialogClose( Player )
				CancelBuff( Player, 501570 );
			end
		end
		Sleep( 10 )
	end
	
end


function Lua_Zone13_PE01_HealEnemy()--�v��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	local MaxHP = ReadRoleValue( TID, EM_RoleValue_MaxHP )
	local HP = ReadRoleValue( TID, EM_RoleValue_HP )
	
	if (4 - math.floor((HP/MaxHP)*5))*30 > rand(100) then
		ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		if rand(10)>3 then
			NPCSay( TID, "[SC_PE_ZONE13_01_SUCCESS]" )
		end
		BeginPlot( TID, "Lua_Zone13_PE01_FriendlyGoBack", 0 )--�ܦ��ͭx�^�a
	end
end

function Lua_Zone13_PE01_FriendlyGoBack()--�ܦ��ͭx�^�a
	local OID = OwnerID()
	local Change = {	[105140] = 117478,
						[105144] = 117479
					}
	local Friendly = Zone13_PE01_Var["Friendly"]
	local FlagID = Zone13_PE01_Var["FlagID"]
	local Obj = LuaFunc_CreateObjByObj( Change[ReadRoleValue( OID, EM_RoleValue_OrgID )], OID )
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 0 )
	ks_ActorMode( Obj, true )--�]�w�t����NPC	
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 3 )--X������
	ks_Move( Obj, 30, FlagID, 1 ) --��H(RoleID)���ʨ���w��m
	Hide(OID)
	KillID( OID, OID )	
end


--===============================================================================--

--================================== skill 4 ====================================--

function Lua_Zone13_PE01_Rumor()--����
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	if rand(10) > 0 then
		AddBuff( TID, 508582, 0, -1 )
		ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
end

function Lua_Zone13_PE01_Roll()--½�u
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Obj = ks_CreateHideCtrl( TID )--�������Τ���
	if CheckBuff( TID, 508589 ) ~= true then
		ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	WriteRoleValue( Obj, EM_RoleValue_Register1, OID )
	BeginPlot( Obj, "Lua_Zone13_PE01_RollDo", 0 )--�}�l½�u
end	

function Lua_Zone13_PE01_CheckCamp()--�ˬd�}��&�o�o
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�	
	local Camp = ReadRoleValue( TID, EM_RoleValue_CampID )
	if Camp ~= 6 then
		if  CheckBuff( TID, 508589 ) ~= true then
			AddBuff( TID, 508589, 0, 60 )--�K���o�o		
			return true
		end
		if Camp ~= 5 and ReadRoleValue( TID, EM_RoleValue_Register4 ) == 0 then
			local Player = ReadRoleValue( OID, EM_RoleValue_Register1 )
			WriteRoleValue( TID, EM_RoleValue_Register4, Player )--�T���H���
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_01_NOEFFECT]" , 0 )--�S���ĪG
		end
		return false
	else
		return false
	end
end

function Lua_Zone13_PE01_RollDo()--�}�l½�u
	local OID = OwnerID()--���ͪ�
	for i=1, 5 do
		SysCastSpellLv( OID, OID, 496912, 0 )--���G�r��
		sleep(10)
	end
	DelObj(OID)
end

function Lua_Zone13_PE01_CancelRoll()--�������u
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	CancelBuff( TID, 508583 )
	ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
end


--===============================================================================--

--================================== skill 5 ====================================--

function Lua_Zone13_PE01_RegHand()--���U��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	WriteRoleValue( TID, EM_RoleValue_Register1, OID )--���U�j�a����
	return true
end

function Lua_Zone13_PE01_CooldownHand()--��֤�CD
	local OID = OwnerID()--�ϥΪ�		
	local Type = GameObjInfo_Int( 496891, "ColdownType" )
	local time = ReadRoleValue( OID, EM_RoleValue_Coldown_Job + Type  )
	
	if time > 20 then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , time - 20 )
	else
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , 0 )
	end
end


--===============================================================================--

--================================== skill 6 ====================================--

function Lua_Zone13_PE01_RegAccuser()--���U���i��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	WriteRoleValue( TID, EM_RoleValue_Register2, OID )--���U
	AddBuff( TID, 508707, 0, -1 )
	SetRoleCamp( TID, "WF_D" )
	SysCastSpellLV( TID, TID, 496914, 0 )--�d��D�]
end

--===============================================================================--

--================================== skill 7 ====================================--

function Lua_Zone13_PE01_BurstMagic()--�z���]�k
	local OID = OwnerID()--�ϥΪ�	
	local Obj = LuaFunc_CreateObjByObj( 117453, OID )--�]�k�}
	
	ks_TrapMode( obj )--�]�w������NPC
	--AddBuff( Obj, 508620, 0, -1 )--�L�Ĭ�
	SetRoleCamp( Obj, "SNPC" )
	WriteRoleValue( Obj, EM_RoleValue_Register1, OID )--���U	
	BeginPlot( Obj, "Lua_Zone13_PE01_StartBurst", 0 )--�z���a
end

function Lua_Zone13_PE01_StartBurst()--�}�l�z��
	local OID = OwnerID()--���ͪ�
	
	for i=1, 4 do
		SysCastSpellLv( OID, OID, 496916, 0 )--�z���a!!
		sleep(20)
	end
	DelObj(OID)	
end

function Lua_Zone13_PE01_CheckKill02()--�ˬd60%�ˮ`�U�O�_�|���`
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE01_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.6 > ReadRoleValue( TID, EM_RoleValue_HP ) then
				ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register1 ), 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			end
			return true
		end
	end
	
	return false
end

function Lua_Zone13_PE01_Stereotype()--�誩�ĪG
	local OID = OwnerID()--�ϥΪ�
	
	--while ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496904 do
		PlayMotion( OID, ruFUSION_ACTORSTATE_CHANNEL_LOOP )
		AddBuff( OID, 502662, 0, 1 ) --��o��
		SysCastSpellLV( OID, OID, 496914, 0 )--�d��D�]
	--	sleep(10)
	--end
end


--===============================================================================--

--================================== skill 8 ====================================--

function Lua_Zone13_PE01_GetSample()--���o�˥�
	local OID = OwnerID()--�ϥΪ�
	AddBuff( OID, 508623, 0, 6 )
end

function Lua_Zone13_PE01_CheckMap01()--�O�_�b��������a
	local OID = OwnerID()--�ϥΪ�
	if DW_CheckMap( OID, Zone13_PE01_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function Lua_Zone13_PE01_CheckDevice()--�O�_���˸m
	local OID = OwnerID()--�ϥΪ�
	local Obj = SearchRangeNPC( OID, 45 ) --TargetID()	
	for i= 0, table.getn(Obj) do				
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 117277 then
			return true
		end
	end
	ScriptMessage( OID, OID, 1 , "[SYS_TOUCH_NOTARGET]" , 0 )--�S���ؼ�
	return false
end

function Lua_Zone13_PE01_PaySample()--ú��˥�
	local OID = OwnerID()--�ϥΪ�
	CancelBuff( OID, 508623 )
	ks_QuestKill( OID, 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
end


--===============================================================================--

--================================== skill 9 ====================================--

function Lua_Zone13_PE01_RegBuff01()--���U���R���P
	local OID = OwnerID()--�ϥΪ�
	local TID = TargetID()--�ؼ�
	
	WriteRoleValue( TID, EM_RoleValue_Register1, OID )
	return true
end

function Lua_Zone13_PE01_RegBuff02()--���U�����E��
	local OID = OwnerID()--�ϥΪ�
	local TID = TargetID()--�ؼ�	
	local Friendly = Zone13_PE01_Var["Friendly"]
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] and CheckBuff( TID, 508628 ) ~= true then
			WriteRoleValue( TID, EM_RoleValue_Register2, OID )
			return true
		end
	end
	return false
end

--===============================================================================--

function Lua_Zone13_PE01_Born01()--�_�I�̥X��
	local OID = OwnerID()
	ks_ResetRegValue()--�Ȧs�ȭ��m
	SetFlag( OID, 544801, 1 )--�������_��
	Zone13_PE01_Var["FriendlyNum"] = Zone13_PE01_Var["FriendlyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE01_Dead01", 0 )--���`�@��
	
	if Zone13_PE01_Phase == 3 and Zone13_PE01_Var["FriendlyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Friendly = Zone13_PE01_Var["Friendly"]
		local Obj = LuaFunc_CreateObjByObj( Friendly[rand(table.getn(Friendly))+1], OID )
		Zone13_PE01_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE01_Born02()--���s�X��
	local OID = OwnerID()
	ks_ResetRegValue()--�Ȧs�ȭ��m
	SetFlag( OID, 544801, 1 )--�������_��
	Zone13_PE01_Var["EnemyNum"] = Zone13_PE01_Var["EnemyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE01_Dead02", 0 )--���`�@��
	SetRoleCamp( OID, "Monster" )
	
	if Zone13_PE01_Phase == 1 and Zone13_PE01_Var["EnemyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Enemy = Zone13_PE01_Var["Enemy"]
		local Obj = LuaFunc_CreateObjByObj( Enemy[rand(table.getn(Enemy))+1], OID )
		Zone13_PE01_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE01_Dead01()--�_�I�̦��`
	local OID = OwnerID()	
	Zone13_PE01_Var["FriendlyNum"] = Zone13_PE01_Var["FriendlyNum"] - 1
	Hide(OID)
end

function Lua_Zone13_PE01_Dead02()--���s���`
	local OID = OwnerID()
	local TID = TargetID()
	local Enemy = Zone13_PE01_Var["Enemy"]
	local Friendly = Zone13_PE01_Var["Friendly"]	
	Zone13_PE01_Var["EnemyNum"] = Zone13_PE01_Var["EnemyNum"] - 1	
	
	if ReadRoleValue( OID, EM_RoleValue_Register3 ) ~= 0 then
		DialogClose( ReadRoleValue( OID, EM_RoleValue_Register3 ) )
		CancelBuff( ReadRoleValue( OID, EM_RoleValue_Register3 ), 501570 );--
	end
	
	if CheckBuff( OID, 508588 ) == true then--�j�a����
		--Say( OID, "Die in the hands of the earth " )
		ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register1 ), 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	
	for i=1, table.getn(Friendly) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Friendly[i] then
			if CheckBuff( TID, 508627 ) == true then --���R���P
				--Say( OID, "Revolutionary Kill" )
				ks_QuestKill( ReadRoleValue( TID, EM_RoleValue_Register1 ), 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			end
			if CheckBuff( TID, 508628 ) == true then --�����E��
				--Say( OID, "Emotional Kill" )
				ks_QuestKill( ReadRoleValue( TID, EM_RoleValue_Register2 ), 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			end
			break
		end
	end
	
	for i = 0 , HateListCount( OID )-1 do
		Hate = HateListInfo( OID, i, EM_HateListInfoType_GItemID )
		for i=1, table.getn(Enemy) do
			if ReadRoleValue( Hate, EM_RoleValue_OrgID ) == Enemy[i] then
				AddBuff( Hate, 508593, 0, 5 )--�j���{�Y
				--Say( TID, "Catastrophe Transfer" )
				ks_QuestKill( ReadRoleValue( OID, EM_RoleValue_Register2 ), 105197, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				return true
			end
		end
	end
	
end

function Lua_Zone13_PE01_Test01()
	local OID = OwnerID()
	Say( OID, "Zone13_PE01_Phase = "..Zone13_PE01_Phase )
	Say( OID, " EnemyNum = "..Zone13_PE01_Var["EnemyNum"] .."; FriendlyNum = "..Zone13_PE01_Var["FriendlyNum"] )	
end