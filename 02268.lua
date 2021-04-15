
--================================== Init ====================================--

function Lua_Zone14_PE02_GlobalSet()--�ܼƫŧi
	Zone14_PE02_PEIndex = 1402
	Zone14_PE02_PHIndex = 100
	
	Zone14_PE02_Team = {}
	
	Zone14_PE02_Var = {}
	Zone14_PE02_Var["MapID"] = 422

	Zone14_PE02_Var["EnemyID"] = {	105395,
						105396,
						105397,
						105398
					}
					
	Zone14_PE02_Var["TeamID"] = {	105330,
						105392,
						105393,
						105394
						}
					
	Zone14_PE02_Var["HorseID"] = 117528		--��������
	Zone14_PE02_Var["ForageID"] = 117529	--³��
	Zone14_PE02_Var["CarID"] = 105329		--��
	Zone14_PE02_Var["CarHorseID"] = 105401	--�Ԩ�����
	Zone14_PE02_Var["DeadID"] = 117530		--����
	Zone14_PE02_Var["InjuriesID"] = 117534	--���˪�
	Zone14_PE02_Var["BombID"] = 117533 	--���u	
	
	Zone14_PE02_Var["FlagID"] = 780657 -- �X�и��X
	Zone14_PE02_Var["Ctrl"] = 0
	Zone14_PE02_Var["Car"] = 0
end

function Lua_ZONE14_PE02_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE14_02_NAME"					-- �s��˪L��V��
	local PE_Desc = "SC_PE_ZONE14_02_DESC"					-- �s��˪L�O�@�D�U�����a�ΡA���O�o�U���ϰ�o�M���L�͡A�ϳo�̦����M�I�����`�a��......
	
	local PEIndex = ZONE14_PE02_PEIndex	
	local PHIndex = ZONE14_PE02_PHIndex
	local MapID = ZONE14_PE02_Var["MapID"]
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , MapID )					-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )					-- ��PE��i���հ�
			
	local PH_Name = "SC_PE_ZONE14_02_PH1_NAME"	--�����s����	
	local PH_Desc = "SC_PE_ZONE14_02_PH1_DESC"	--�p�G���N�䴩�V�e�B�e�A�e�u�����X�̴N�|���J�x�ҡA�ҥH�N�⪾�D�˪L�̺��O�L�͡A�_�I���٬O�o�´˪L���t�@�Y�ĥh�I
					
	PE_AddPhase( PEIndex , PHIndex , PH_Name, PH_Desc, 0 , 1 , 1 , 0 )	
	PE_PH_AddObjective_Equal( PEIndex , PHIndex, PHIndex, "", "", "ZONE14_PE02_Value" , 0, 1,  true )	
	PE_OB_SetVisible( PEIndex, PHIndex, PHIndex, false )--���ñ���
	
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_ZONE14_PE02_Leave" )--���}�ϰ�
		
	PE_SetScoreVisible( PEIndex, false )--����ܿn��	
			
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex )
end

function Lua_ZONE14_PE02_Leave( PEIndex, Player )--���}�ϰ�

end

--================================== Type ====================================--

function Lua_Zone14_PE02_CheckMap( Type )
	local OID = OwnerID()--�ϥΪ�
	if DW_CheckMap( OID, Zone14_PE02_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

function Lua_Zone14_PE02_Check01()--�L��/�_�I��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamID = Zone14_PE02_Var["TeamID"]
	
	for i=1, table.getn(EnemyID) do
		local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		if ObjID == EnemyID[i] or ObjID == TeamID[i] then
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone14_PE02_Check02( Type )--�L��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	for i=1, table.getn(EnemyID) do		
		if ObjID == EnemyID[i] then
			return true
		end
	end
	if Type == nil then
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return false
	end
	return false
end

function Lua_Zone14_PE02_Check03( Type )--�_�I��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local TeamID = Zone14_PE02_Var["TeamID"]
	local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	for i=1, table.getn(TeamID) do		
		if ObjID == TeamID[i] then
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone14_PE02_Check04()--�_�I��/����/���a
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local TeamID = Zone14_PE02_Var["TeamID"]
	local CarID = Zone14_PE02_Var["CarID"]
	for i=1, table.getn(TeamID) do
		local ObjID = ReadRoleValue( TID, EM_RoleValue_OrgID )
		if ObjID == TeamID[i] or ObjID == CarID or TID == OID then	
			return true
		end
	end

	return false	
end

function Lua_Zone14_PE02_CheckCar()--���l
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if TID == Zone14_PE02_Var["Car"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end	

function Lua_Zone14_PE02_CheckHorse()--��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["HorseID"] then
		if ReadRoleValue( OID, EM_RoleValue_Register3 ) < 5 then
			return true
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_MAX]" , 0 )--�̤j�ƶq
		return false		
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone14_PE02_CheckForage()--³��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["ForageID"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone14_PE02_CheckDead()--����
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["DeadID"] then
		return true
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone14_PE02_CheckInjuries()--���˪�
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Zone14_PE02_Var["InjuriesID"] then
		if CheckAttachAble( OID ) == true and ReadRoleValue( OID, EM_RoleValue_Register2 ) == 0 then
			return true
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_MAX]" , 0 )--�̤j�ƶq
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone14_PE02_CheckNPC( Type )--�ˬd����NPC
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local OrgID = ReadRoleValue( TID, EM_RoleValue_OrgID )
	
	if OrgID == 117448 or OrgID == 117480 then
		if Type == 0 or Type == nil then--����
			if ReadRoleValue( OID, EM_RoleValue_Register3 ) > 0 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_NULL]" , 0 )--�ƶq����
			return false
		elseif Type == 1 then
			if ReadRoleValue( OID, EM_RoleValue_Register2 ) ~= 0 then
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_HELP]" , 0 )--�|���ϤH
			return false			
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

--================================== Skill 01 ====================================--

function Lua_Zone14_PE02_Skill01Type01()--�L��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	for i=1, table.getn(EnemyID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == EnemyID[i] then
			if ( ReadRoleValue( TID, EM_RoleValue_HP ) - ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.3 ) <= 0 then
				ks_QuestKill( OID, 105399, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			else
				ks_QuestKill( OID, 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			end
			return true
		end
	end

	return false
end

function Lua_Zone14_PE02_Skill01Type02()--�_�I��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local TeamID = Zone14_PE02_Var["TeamID"]
	for i=1, table.getn(TeamID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == TeamID[i] then
			ks_QuestKill( OID, 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			return true
		end
	end

	return false
end

function Lua_Zone14_PE02_CheckDefence()--�u�m���ت�
	local OID = OwnerID()--�ϥΪ�
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamID = Zone14_PE02_Var["TeamID"]
	local EnemyNum = 0
	local TeamNum = 0
	
	local Obj = SearchRangeNPC ( OID, 100 )
	for i=0, table.getn(obj)-1 do
		local ObjID = ReadRoleValue( Obj[i], EM_RoleValue_OrgID )
		for j=1, table.getn(EnemyID) do
			if ObjID == EnemyID[j] then
				EnemyNum = EnemyNum + 1
				KillID( OID, Obj[i] )
			elseif ObjID == TeamID[j] then
				TeamNum = TeamNum + 1
			end
		end
	end
	if TeamNum ~= 0 and EnemyNum > TeamNum then
		ks_QuestKill( OID, 105399, TeamNum )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
end

--==================================Skill 02  ====================================--

function Lua_Zone14_PE02_Legend()--�ǻ�����
	local Team = Zone14_PE02_Team	
	for i=1, table.getn(Team) do
		if CheckID(Team[i])== true then
			AddBuff( Team[i], 509370, 0, 10 )
		end
	end
	AddBuff( Zone14_PE02_Var["Car"], 509370, 0, 10 )
	ks_QuestKill( OwnerID(), 105399, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
end

--==================================Skill 03  ====================================--

function Lua_Zone14_PE02_ClearReg()--�M���Ȧs
	local OID = OwnerID()
	WriteRoleValue( OID, EM_RoleValue_Register1, 0 )--���L�ͼƶq
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 )--�ϤH
	WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--�차
	AddBuff( OID, 509379, 0, 1 )--�Ѱ��M��
end

function Lua_Zone14_PE02_ClearReg2()--�M���Ȧs
	local OID = OwnerID()
	local Injuries = ReadRoleValue( OID, EM_RoleValue_Register2 )
	if Injuries ~= 0 then--�ϤH
		DelObj( Injuries )
		WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
	end
end

function Lua_Zone14_PE02_CatchHorse()--�차
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	
	local Horse = CreateObj( Zone14_PE02_Var["HorseID"], X, Y, Z, 0, 1 )
	AddToPartition( Horse, 0 )
	WriteRoleValue( Horse, EM_RoleValue_Register1, OID )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue( OID, EM_RoleValue_Register3, ReadRoleValue( OID, EM_RoleValue_Register3 )+1 )--���Ǽƶq
	ks_ActorMode( Horse, true )--�]�w�t����NPC
	SysCastSpellLv( Horse, OID, 497284, 0 )
	AddBuff( Horse, 506984, 0, -1 )--�[�t30%
	BeginPlot( Horse, "Lua_Zone14_PE02_HorseRun", 0 )
	Hide( TID )
	KillID( TID, TID )
end

function Lua_Zone14_PE02_HorseRun()--����]
	local  OID = OwnerID()
	local master = ReadRoleValue( OID, EM_RoleValue_Register1 )
	while true do
		if CheckID( master ) == true and CheckBuff( master, 509119 ) == true 
			and ReadRoleValue( master, EM_RoleValue_Register3 ) > 0 
			and ReadRoleValue( master, EM_RoleValue_IsDead ) ~= 1 
			and DW_CheckMap( master, Zone14_PE02_Var["MapID"] ) == true then
			SetFollow( OID, master )
		else
			WriteRoleValue( master, EM_RoleValue_Register3, 0 )
			MagicInterrupt( OID )
			sleep(10)
			DelObj(OID)
		end
		sleep(20)
	end
end

function Lua_Zone14_PE02_HorseBye()--�����T
	local OID = OwnerID()
	local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
	if Num > 0 then
		WriteRoleValue( OID, EM_RoleValue_Register3, 0 )
		ks_QuestKill( OID, 105399, Num )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
end

function Lua_Zone14_PE02_CheckHorseNum()--�ֳt�����ˬd
	local OID = OwnerID()--�ϥΪ�
	if TargetID() == Zone14_PE02_Var["Car"] then
		if ReadRoleValue( OID, EM_RoleValue_Register3 ) > 0 then
			return true
		end
		local HorseID = Zone14_PE02_Var["HorseID"]
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_NULL]" , 0 )--�ƶq����
		return false
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone14_PE02_CheckFast()--�ֳt����
	local OID = OwnerID()
	local Num = ReadRoleValue( OID, EM_RoleValue_Register3 )
	local Team = Zone14_PE02_Team
	for i=1, table.getn(Team) do
		if CheckID(Team[i])== true then
			AddBuff( Team[i], 509324, 0, Num*2 )
		end
	end
	AddBuff( Zone14_PE02_Var["Car"], 509324, 0, Num*2 )
	ks_QuestKill( OwnerID(), 105399, Num )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )		
end

--==================================Skill 04  ====================================--

function Lua_Zone14_PE02_SetBomb()--�񬵼u
	local OID = OwnerID()
	local dis = 30
	local X = ReadRoleValue( OID, EM_RoleValue_X )
	local Y = ReadRoleValue( OID, EM_RoleValue_Y )
	local Z = ReadRoleValue( OID, EM_RoleValue_Z )
	local Dir = ReadRoleValue( OID, EM_RoleValue_Dir )+180
	local PD = Dir*math.pi/180

	X = X+dis/2*math.cos(PD)
	Z = Z-dis/2*math.sin(PD)
	local Bomb = CreateObj( Zone14_PE02_Var["BombID"], X, Y, Z, 0, 1 )
	ks_ActorMode(Bomb, true )
	AddToPartition( Bomb, 0 )
	WriteRoleValue( Bomb, EM_RoleValue_Register1, OID )
	BeginPlot( Bomb, "Lua_Zone14_PE02_Bomb", 0 )
end

function Lua_Zone14_PE02_Bomb()--���u�z��
	local OID = OwnerID()
	local master = ReadRoleValue( OID, EM_RoleValue_Register1 )
	for i=1, 3 do
		ScriptMessage( master, master, 0 , (4-i ).."......", 0 )--�̤j�ƶq
		sleep(5)
	end
	SysCastSpellLv( OID, OID, 497286, 0 )--�S�ĥ�
	SysCastSpellLv( master, master, 497122, 0 )--�ˮ`��
	Sleep(10)
	DelObj(OID)
end

function Lua_Zone14_PE02_BombKill()--���u���H�F
	local TID = TargetID()--�ؼ�
	local master = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	--Say( TID, "HI")
	for i=1, table.getn(EnemyID) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == EnemyID[i] then
			local count = ReadRoleValue( master, EM_RoleValue_Register1 )
			if count == 1 then
				ks_QuestKill( master, 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				WriteRoleValue( master, EM_RoleValue_Register1, 0 ) 
			else
				WriteRoleValue( master, EM_RoleValue_Register1, count+1 )
			end
			return true
		end
	end
	
	return false
end

--==================================Skill 05  ====================================--

function Lua_Zone14_PE02_HelpInjuries()--�ϤH
	local OID = OwnerID()
	local TID = TargetID()
	local obj = CreateObj( ReadRoleValue( TID, EM_RoleValue_OrgID ), ReadRoleValue( TID, EM_RoleValue_X ), ReadRoleValue( TID, EM_RoleValue_Y ), ReadRoleValue( TID, EM_RoleValue_Z ), 0, 1 )
	WriteRoleValue( OID, EM_RoleValue_Register2, obj )
	WriteRoleValue( obj, EM_RoleValue_Register2, OID )
	AddToPartition( obj, 0 )
	CallPlot( obj, "Lua_Zone14_PE02_CheckHelpInjuries", 0 )
	ks_ActorMode( obj, true )--�]�w�t����NPC
	AttachObj( obj, OID, 2,  "" , "" )
	Hide(TID)
	KillID( TID, TID )
end

function Lua_Zone14_PE02_CheckHelpInjuries()--�ˬd�ϤH
	local OID = OwnerID();
	local master = ReadRoleValue( OID, EM_RoleValue_Register2 )
	while true do
		if CheckBuff( master, 509133 ) ~= true then
			DelObj( OID)
		end
		sleep(30)
	end
end

function Lua_Zone14_PE02_InjuriesBye()--��H
	local OID = OwnerID()
	local obj = ReadRoleValue( OID, EM_RoleValue_Register2 )
	DetachObj(  obj )
	ks_QuestKill( OID, 105399, 5 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
	DelObj( Obj )
end

function Lua_Zone14_PE02_HumanUse()--�H���Q��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Obj = ReadRoleValue( OID, EM_RoleValue_Register2 )
	if Obj ~= 0 then
		if TID == Zone14_PE02_Var["Car"] then
			if ReadRoleValue( Zone14_PE02_Var["Ctrl"], EM_RoleValue_Register1 ) > 0 then
				WriteRoleValue( OID, EM_RoleValue_Register2, 0 )
				ks_QuestKill( OID, 105399, 5 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				DelObj(Obj)
				AddBuff( TID, 509375, 0, -1 )--�R���Q��
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CANOT_DO_IT]" , 0 )--�٤���o��
			return false
		end		
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return false
	end
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE14_02_HELP]" , 0 )--�|���ϴ��_�I��
	return false
end

--==================================Skill 06  ====================================--

function Lua_Zone14_PE02_Forage()--���o³��	
	local TID = TargetID()
	ks_QuestKill( OwnerID(), 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	Hide( TID )
	KillID( TID, TID )
end

function Lua_Zone14_PE02_Heal()--�v��75%
	local OID = OwnerID()
	local TID = TargetID()
	local MaxHP = ReadRoleValue( TID, EM_RoleValue_MaxHP )
	local HP = ReadRoleValue( TID, EM_RoleValue_HP )
	if HP < MaxHP*0.7 then
		ks_QuestKill( OID, 105399, 4 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	WriteRoleValue( TID, EM_RoleValue_HP,  HP+MaxHP*0.75 )
end

--==================================Skill 07  ====================================--

function Lua_Zone14_PE02_Deader()--�ۭt����
	local OID = OwnerID()
	local TID = TargetID()
	local X = ReadRoleValue( TID, EM_RoleValue_X )
	local Y = ReadRoleValue( TID, EM_RoleValue_Y )
	local Z = ReadRoleValue( TID, EM_RoleValue_Z )
	local Dir = ReadRoleValue( TID, EM_RoleValue_Dir )
	
	local Skull =  CreateObj( 117531, X, Y, Z, Dir, 1 )
	AddToPartition( Skull, 0 )
	ks_ActorMode( SKull, true )--�]�w�t����NPC
	WriteRoleValue( Skull, EM_RoleValue_LiveTime, 10 )
	ks_QuestKill( OID, 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	Hide(TID)
	KillID( TID, TID )
end

function Lua_Zone14_PE02_Power()--�E�y
	ks_QuestKill( OwnerID(), 105399, 3 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )		
end

--================================== ���� ====================================--

function Lua_Zone14_PE02_CreateTeamCtrl()--�гy�_�I������
	local FlagID = Zone14_PE02_Var["FlagID"]
	local BaseX = GetMoveFlagValue( FlagID, 1, EM_RoleValue_X )--�_�I
	local BaseY = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Y )--�_�I
	local BaseZ = GetMoveFlagValue( FlagID, 1, EM_RoleValue_Z )--�_�I
	local Ctrl = CreateObj( 115053, BaseX, BaseY, BaseZ, 0, 1 )--���֤ͮ�
	Zone14_PE02_Var["Ctrl"] = Ctrl
	SetModeEx( Ctrl, EM_SetModeType_Mark, false )--�аO
	SetModeEx( Ctrl, EM_SetModeType_Fight, false )--���
	SetModeEx( Ctrl, EM_SetModeType_Show, false )--���
	WriteRoleValue( Ctrl, EM_RoleValue_PID, 0 )--��l��(���l�S��)
	AddToPartition( Ctrl, 0 )
	CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--�гy����
end

function Lua_Zone14_PE02_CreateTeam()--�гy�_�I������
	local Ctrl = OwnerID()
	local CtrlX = ReadRoleValue( Ctrl, EM_RoleValue_X )
	local CtrlY = ReadRoleValue( Ctrl, EM_RoleValue_Y )
	local CtrlZ = ReadRoleValue( Ctrl, EM_RoleValue_Z )
	local TeamCtrl = CreateObj( 115053, CtrlX, CtrlY, CtrlZ, 0, 1 )--���֤ͮ�
	WriteRoleValue( TeamCtrl, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled( TeamCtrl, false )
	SetModeEx( TeamCtrl, EM_SetModeType_Mark, false )--�аO
	SetModeEx( TeamCtrl, EM_SetModeType_Fight, false )--���
	SetModeEx( TeamCtrl, EM_SetModeType_Show, false )--���	
	AddToPartition( TeamCtrl, 0 )
	sleep(50)
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 0 )--��l��(�������`�ƶq)
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )--��l��(ŧ�����`�ƶq)
	CallPlot( TeamCtrl, "Lua_Zone14_PE02_TeamCtrlSet", 0 )--���ͱa������
end

function Lua_Zone14_PE02_TeamCtrlSet()--�]�w�_�I��
	local TeamCtrl = OwnerID()
	local Ctrl = Zone14_PE02_Var["Ctrl"]	
	local TeamID = ZONE14_PE02_Var["TeamID"]
	local CarID = Zone14_PE02_Var["CarID"]
	local CarHorseID = Zone14_PE02_Var["CarHorseID"]
	local FlagID = Zone14_PE02_Var["FlagID"]
	local Goal = GetMoveFlagCount( FlagID )-1
	local Site = 1
	local CheckRange = 35
	local Range = 50
	local CheckDis = 700
	local FlagX = GetMoveFlagValue( FlagID , Site , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Z )	
	local RoomID = ReadRoleValue( TeamCtrl, EM_RoleValue_RoomID )
	local Team = Zone14_PE02_Team
	local TeamNum = table.getn(TeamID)
	local Attack = false
	local AttackSite = Rand(Goal-2)+2
	DebugMsg(0,0,"AttackSite = "..AttackSite)
	
	local Horse = CreateObj( CarHorseID, FlagX, FlagY, FlagZ, 0, 1 )
	WriteRoleValue( Horse, EM_RoleValue_IsWalk, 0 )
	SetModeEx( Horse, EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Horse, EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( Horse, EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Horse, EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( Horse, EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Horse, EM_SetModeType_HideName , true )	-- �W��
	MoveToFlagEnabled( Horse, false )
	AddToPartition( Horse, RoomID )
	FaceFlag( Horse, FlagID, 2 )
	WriteRoleValue( Horse, EM_RoleValue_PassengerAttackable, 1 )--�f������̥i�Q���
	AddBuff( Horse, 506984, 0, -1 )--�[�t30%
	
	local Car = LuaFunc_CreateObjByObj( CarID, Horse )
	Zone14_PE02_Var["Car"] = Car
	WriteRoleValue( Car, EM_RoleValue_IsWalk, 0 )
	SetModeEx( Car, EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Car, EM_SetModeType_Strikback , true )	-- ����
	SetModeEx( Car, EM_SetModeType_ShowRoleHead , true )	-- �Y����
	SetModeEx( Car, EM_SetModeType_Fight , true )		-- �i�������
	SetModeEx( Car, EM_SetModeType_Mark , true )		-- �аO
	MoveToFlagEnabled( Car, false )
	
	WriteRoleValue( Car, EM_RoleValue_Register1, Horse )
	WriteRoleValue( Car, EM_RoleValue_Register2, TeamCtrl )
	SetPlot( Car, "dead", "Lua_Zone14_PE02_CarDead", 0 )
	SetFlag( Car, 544801, 1 )--�������_��
	AddBuff( Car, 507514, 0, -1 )--�K�̪v��
	AddBuff( Car, 506984, 0, -1 )--�[�t30%
	AddBuff( Car, 502707, 0, -1 )--���|�^��
	AddBuff( Car, 504113, 0, -1 )--�L�k����
	AttachObj( Car , Horse , 0 ,"p_hit_point02","p_hit_point01" )
	--AttachObj( Car , Horse , 0 ,"p_down","p_top" )
			
	AddBuff( TeamCtrl, 506984, 0, -1 )--�[�t30%
	
	local TransCarDir = ReadRoleValue( TeamCtrl, EM_RoleValue_Dir )
	local TransTeamPosition = Lua_Zone14_PE02_FormationPosition( FlagX , FlagY , FlagZ , Range, TransCarDir )--�|���}���]�w��
	
	for i=1, TeamNum do
		Team[i] = CreateObj( TeamID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , TransCarDir , 1 )
		WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 0 )
		MoveToFlagEnabled( Team[i], false )		
		AddToPartition( Team[i], RoomID )
		SetFlag( Team[i], 544801, 1 )--�������_��
		AddBuff( Team[i], 509304, 0, -1 )--�M��30%
		AddBuff( Team[i], 502707, 0, -1 )--���|�^��
		SetPlot( Team[i], "dead", "Lua_Zone14_PE02_TeamDead", 0 )
	end
				
	local PreviousDir = TransCarDir

	while true do
		local InFight = false
		
		if CheckBuff( Car, 509375 ) == true then--�R���Q��
			DebugMsg(0,0,"Human Use OK!!")
			for i=1, TeamNum do
				if CheckID(Team[i]) ~= true then
					Team[i] = CreateObj( TeamID[i] , TransTeamPosition["X"][i], TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] , TransCarDir , 1 )
					WriteRoleValue( Team[i], EM_RoleValue_IsWalk, 0 )
					MoveToFlagEnabled( Team[i], false )
					WriteRoleValue( Team[i], EM_RoleValue_HP, ReadRoleValue( Team[i], EM_RoleValue_MaxHP )*0.45 )
					AddToPartition( Team[i], RoomID )
					SetFlag( Team[i], 544801, 1 )--�������_��
					AddBuff( Team[i], 509304, 0, -1 )--�M��30%
					AddBuff( Team[i], 502707, 0, -1 )--���|�^��
					SetPlot( Team[i], "dead", "Lua_Zone14_PE02_TeamDead", 0 )
					WriteRoleValue( Ctrl, EM_RoleValue_Register1, ReadRoleValue( Ctrl, EM_RoleValue_Register1 )- 1 )
					CancelBuff( Car, 509375 )
					break
				end
			end
		end
		
		for i=1, TeamNum do
			if CheckID(Team[i]) == true then
				if CheckBuff( Team[i], 509370 ) == true then--�ǻ�����
					SetModeEx( Team[i], EM_SetModeType_Searchenemy , false )	-- ����
					SetModeEx( Team[i], EM_SetModeType_Strikback , false )	-- ����
					SetStopAttack( Team[i] )  
					ClearHateList( Team[i], -1 )
				else
					SetModeEx( Team[i], EM_SetModeType_Searchenemy , true )	-- ����
					SetModeEx( Team[i], EM_SetModeType_Strikback , true )	-- ����
					if KS_InCombat(Team[i]) == true or KS_InCombat(Car) == true then
						InFight = true
						local AttackTarget
						local Hate = KS_GetHateList( Car )
						if Hate[1] ~= nil then
							AttackTarget = Hate[1]
						else
							AttackTarget = ReadRoleValue( Team[i], EM_RoleValue_AttackTargetID )
							if AttackTarget == 0 then
								local Hate = KS_GetHateList( Team[i] )
								AttackTarget = Hate[1]
							end
						end
	
						for j=1, TeamNum do
							if CheckID(Team[j]) == true and KS_InCombat(Team[j]) ~= true and AttackTarget ~= nil then
								SysCastSpellLv( AttackTarget, Team[j], 496946, 9 )--�s�y����
								CancelBuff( Team[j], 509304 )--�Ѱ��M��				
							end
						end				
						StopMove( Horse, true )
						StopMove( TeamCtrl, true )
					end
				end
			end
		end
				
		local TransCarX = ReadRoleValue( TeamCtrl , EM_RoleValue_X )
	 	local TransCarY = ReadRoleValue( TeamCtrl , EM_RoleValue_Y )
	 	local TransCarZ = ReadRoleValue( TeamCtrl , EM_RoleValue_Z )
		TransCarDir = ReadRoleValue( TeamCtrl , EM_RoleValue_Dir )
		local DisX = ( TransCarX - FlagX )^2
		local DisZ = ( TransCarZ - FlagZ )^2
		
		local TeamDead = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )
		if math.floor( (DisX+DisZ)^0.5) < CheckRange and InFight == false then	-- ����w�I�]�w�U�@�I��m
			if Site == Goal then
				for i =1, TeamNum do
					if CheckID( Team[i] ) == true then								
						WriteRoleValue( Team[i] , EM_RoleValue_IsWalk , 1 )
						WriteRoleValue( Team[i], EM_RoleValue_LiveTime, 1 )
						CancelBuff( Team[i], 509304 )
					end
				end
								
				DelObj( Horse )
				DelObj( TeamCtrl )
				DelObj( Car )
				CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--���s�o��
				return
			else
				if Site == AttackSite and Attack == false then
					Attack = true
					InFight = true
					StopMove( Horse, true )
					StopMove( TeamCtrl, true )
					CallPlot( Ctrl, "Lua_Zone14_PE02_TeamAttack", Horse, Car )--Ĳ�o�I����
				elseif TeamDead ~= TeamNum then
					Site = Site + 1
					FlagX = GetMoveFlagValue( FlagID , Site , EM_RoleValue_X )
					FlagY = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Y )
					FlagZ = GetMoveFlagValue( FlagID , Site , EM_RoleValue_Z )					
				end
			end
		elseif InFight == false then
			MoveDirect( TeamCtrl , FlagX , FlagY , FlagZ )-- ��������
		end

		if TeamDead ~= TeamNum and InFight == false then
			local DeltaDir = math.abs( PreviousDir - TransCarDir )	--��V�B�z�A�ݬO�_�ݭn�ܤư}����m
			if DeltaDir > 90 and DeltaDir < 270 then	-- �ܤư}����m
				local tmp = 0
				if Team[1] ~= nil and Team[4] ~= nil then
					tmp = Team[1]
					Team[1] = Team[4]
					Team[4] = tmp
				end
				if Team[2] ~= nil and Team[3] ~= nil then
					tmp = Team[2]
					Team[2] = Team[3]
					Team[3] = tmp
				end
			end
			PreviousDir = TransCarDir

			TransTeamPosition = Lua_Zone14_PE02_FormationPosition( TransCarX , TransCarY , TransCarZ, Range, TransCarDir )--�|���}���]�w��
			--[[local DeltaX = ( TransCarX - ReadRoleValue( Horse , EM_RoleValue_X ) )^2
			local DeltaZ = ( TransCarZ - ReadRoleValue( Horse , EM_RoleValue_Z ) )^2
					
			if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--�O�_�����w��
				AddBuff( Horse, 508176, 0, 3 )--�[�t15%
			end--]]
			MoveDirect( Horse , TransCarX , TransCarY , TransCarZ )	-- �B�f������
			
			for i = 1 , TeamNum do
				if Team[i] ~= nil and CheckID( Team[i] ) == true then	-- �O�_ NPC �B�s�b
					if CheckBuff( Team[i], 509304 ) ~= true then
						MoveToFlagEnabled( Team[i], false )
						AddBuff( Team[i], 509304, 0, -1 )--�M��
					end
					
					--[[DeltaX = ( TransTeamPosition["X"][i] - ReadRoleValue( Team[i] , EM_RoleValue_X ) )^2
					DeltaZ = ( TransTeamPosition["Z"][i] - ReadRoleValue( Team[i] , EM_RoleValue_Z ) )^2
					--Say( Team[i], "Dis = "..math.floor( (DeltaX+DeltaZ)^0.5) )
					if math.floor( (DeltaX+DeltaZ)^0.5) > CheckDis then	--�O�_�����w��
						AddBuff( Team[i], 508956, 0, 3 )--�[�t15%
					end--]]
					MoveDirect( Team[i] , TransTeamPosition["X"][i] , TransTeamPosition["Y"][i] , TransTeamPosition["Z"][i] )
				end
			end
		elseif TeamDead == TeamNum then
			return
		elseif GetDistance( Car, Horse ) < 20 then
			local X = ReadRoleValue( Horse , EM_RoleValue_X )
	 		local Y = ReadRoleValue( Horse , EM_RoleValue_Y )
	 		local Z = ReadRoleValue( Horse , EM_RoleValue_Z )
	 		local Dir = ReadRoleValue( Horse , EM_RoleValue_Dir )
	 		
	 		local nDir = Dir-180
	 		if nDir > 360 then nDir = nDir -360
			elseif nDir < 0 then nDir = nDir +360 end
			
	 		local radian = (math.pi/180)*nDir
		 	X = X +(25*math.cos(radian))
		 	Z = Z - (25*math.sin(radian))
	 		SetPos( Car, X, Y, Z, Dir )
		end
		Sleep(10)
	end
end

function Lua_Zone14_PE02_TeamAttack( Horse, Car )--Ĳ�o�I����
	local Ctrl = OwnerID()
	local X = ReadRoleValue( Horse, EM_RoleValue_X )
	local Y = ReadRoleValue( Horse, EM_RoleValue_Y )
	local Z = ReadRoleValue( Horse, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( Horse, EM_RoleValue_RoomID )
	local Team = Zone14_PE02_Team
	local EnemyID = Zone14_PE02_Var["EnemyID"]
	local TeamNum  = table.getn(Team)
	local MstNum = table.getn(EnemyID)
	local Range = 80
	local obj = {}
	
	for i=1, MstNum do
		obj[i] = CreateObj( EnemyID[i], X-Range*math.cos(math.pi*2*(i/MstNum)), Y, Z+Range*math.sin(math.pi*2*(i/MstNum)), 0, 1 )		
		MoveToFlagEnabled( obj[i], false )
		AddToPartition( obj[i], RoomID )
		SetFlag( obj[i], 544801, 1 )--�������_��
		WriteRoleValue( obj[i], EM_RoleValue_Register4, 1 )--�����������ѥ�
		SetPlot( obj[i], "dead", "Lua_Zone14_PE02_MstDead", 0 )
	end
	
	Sleep(10)
	local MstDead = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )--�L�ͦ��`�ƶq
	DebugMsg(0,0,"TeamAttack MstDead = "..MstDead)
	while ( MstDead < MstNum and CheckID(Car) == true ) do
		local TeamDead = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )--�������`�ƶq
		MstDead = ReadRoleValue( Ctrl, EM_RoleValue_Register2 )--�L�ͦ��`�ƶq
		for i=1, MstNum do
			if CheckID( Obj[i] ) == true then		
				MoveDirect( Obj[i], X, Y, Z )
				SysCastSpellLv( Car, Obj[i], 496946, 9 )--�s�y����
				SysCastSpellLv( Obj[i], Car, 496946, 9 )--�s�y����
				for i=1, TeamNum do
					if CheckID( Team[i] ) == true then
						MoveDirect( Team[i], X, Y, Z )							
						SysCastSpellLv( Obj[i], Team[i], 496946, 9 )--�s�y����
						SysCastSpellLv( Team[i], Obj[i], 496946, 9 )--�s�y����
					end
				end
			end
		end
		sleep(10)
	end
	for i=1, MstNum do
		if CheckID( Obj[i] ) == true then
			DelObj(Obj[i])
		end
	end
	WriteRoleValue( Ctrl, EM_RoleValue_Register2, 0 )
	DebugMsg(0,0,"TeamAttack End")
end

function Lua_Zone14_PE02_TeamLeave()--��������
	local Car = Zone14_PE02_Var["Car"]
	if CheckID(Car )~= true or ReadRoleValue( Car, EM_RoleValue_IsDead ) == 1 then--���l���F ��������
		KillID( OwnerID(), OwnerID() )
	end
end

function Lua_Zone14_PE02_TeamDead()--�������F
	local Ctrl = Zone14_PE02_Var["Ctrl"]
	local Car = Zone14_PE02_Var["Car"]
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, ReadRoleValue( Ctrl, EM_RoleValue_Register1 )+ 1 )
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == table.getn(Zone14_PE02_Team) then
		if CheckID(Car) ~= true  then
			CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--���s�o��
		else
			CallPlot( Car, "Lua_Zone14_PE02_CheckCombat", 0 )--�ˬd�O�_�԰���
		end
	end
	DelObj( OwnerID() )
	return true
end

function Lua_Zone14_PE02_CheckCombat()--�ˬd�O�_�԰���
	local OID = OwnerID()
	while true do
		if CheckBuff( OID, 509136 ) ~= true then
			AddBuff( OID, 509136, 0, -1 )
		else
			Hide(OID)
			KillID( OID, OID )
		end
		sleep(30)
	end
end

function Lua_Zone14_PE02_CarDead()--���l���F
	local OID = OwnerID()	
	local Horse = ReadRoleValue( OID, EM_RoleValue_Register1 )
	local TeamCtrl = ReadRoleValue( OID, EM_RoleValue_Register2 )
	local Team = Zone14_PE02_Team
	DelObj(Horse)
	DelObj(TeamCtrl)
	
	local Ctrl = Zone14_PE02_Var["Ctrl"]
	if ReadRoleValue( Ctrl, EM_RoleValue_Register1 ) == table.getn(Team) then		
		CallPlot( Ctrl, "Lua_Zone14_PE02_CreateTeam", 0 )--���s�o��
	else
		for i=1, table.getn(Team) do
			if CheckID(Team[i]) == true then
				CallPlot( Team[i], "Lua_Zone14_PE02_CheckCombat", 0 )
			end
		end
	end
	DelObj(OID)
	return true
end

function Lua_Zone14_PE02_FormationPosition( X , Y , Z , Range , Dir )--�|���}���]�w��
	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X-Range*math.sin(Dir*math.pi/180+15 )	-- �k�e
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Range*math.cos(Dir*math.pi/180+15)

	Position["X"][2] = X+Range*math.sin(Dir*math.pi/180-15)	-- ���e
	Position["Y"][2] = Y
	Position["Z"][2] = Z+Range*math.cos(Dir*math.pi/180-15)

	Position["X"][3] = X-Range*math.sin(Dir*math.pi/180-15)	-- �k��
	Position["Y"][3] = Y
	Position["Z"][3] = Z-Range*math.cos(Dir*math.pi/180-15)

	Position["X"][4] = X+Range*math.sin(Dir*math.pi/180+15)	-- ����
	Position["Y"][4] = Y
	Position["Z"][4] = Z+Range*math.cos(Dir*math.pi/180+15)

	return Position;
end

--==================================���`�@��  ====================================--

function Lua_Zone14_PE02_MstSet()--��l�@��
	SetFlag( OwnerID(), 544801, 1 )--�������_��
	SetPlot( OwnerID(), "DEAD", "Lua_Zone14_PE02_MstDead", 0 )
end

function Lua_Zone14_PE02_MstDead()--�L�ͦ��`
	local OID = OwnerID()
	local Hate = KS_GetHateList( OID )--�����( Type:1 �̤���; 2 �̶Z��; 3 ���a)
	if Hate[1] ~= nil and CheckBuff( Hate[1], 509118 ) == true then--�W���~�����U
		local count = ReadRoleValue( Hate[1], EM_RoleValue_Register1 )--�Q�ʧްO�ƥ�
		if count == 2 then
			ks_QuestKill( Hate[1], 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, 0 ) 
		else
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, count+1 )
		end
	elseif Hate[1] ~= nil and CheckBuff( Hate[1], 509120 ) == true then--���쪺��ĳ
		local count = ReadRoleValue( Hate[1], EM_RoleValue_Register1 )--�Q�ʧްO�ƥ�
		if count == 1 then
			ks_QuestKill( Hate[1], 105399, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, 0 ) 
		else
			WriteRoleValue( Hate[1], EM_RoleValue_Register1, count+1 )
		end	
	end
	
	
	if ReadRoleValue( OID, EM_RoleValue_Register4 ) > 0 then--��������
		local Ctrl = Zone14_PE02_Var["Ctrl"]
		WriteRoleValue( Ctrl, EM_RoleValue_Register2, ReadRoleValue( Ctrl, EM_RoleValue_Register2 )+ 1 )
		--DelObj(OwnerID())
		return true
	end
	
	--Hide(OID)
	return true
end

--========================================================================--

function Lua_Zone14PE02_QuestComplete()--�������Ȱ���
	local Player = TargetID()
	if LuaPE_KS_CleanBuff( Player ) == true then
		local BuffID = 509378
		local Buff = ReadRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2 )
		
		if CheckBuff( Player, Buff ) == true and Buff ~= BuffID then
			CancelBuff( Player, Buff )
			WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			DebugMsg(0,0,"14PE02 QuestFin Count = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
			return
		end
		
		local PECount = ReadRoleValue( Player, EM_LuaValueFlag_PECount )		
		local Lv = KS_CheckBuffLV( Player, BuffID )
		DebugMsg(0,0,"Old PECount = "..PECount.."; BuffLV = "..Lv)
		if Lv > 0 or ( Lv == 0 and PECount > 5 ) then--�ثe�i�檺PE���ȧ�������
			if Lv == 0 and PECount > 5 then
				WriteRoleValue( Player, EM_LuaValueFlag_PECount, 1 )
			end
			AddBuff( Player, BuffID, 0, -1 )
			WriteRoleValue( Player, EM_LuaValueFlag_PEBuffKeep2, BuffID )--�ثe�i�檺PE�Ҫ��a�����y���A
			DebugMsg(0,0,"New PECount = "..ReadRoleValue( Player, EM_LuaValueFlag_PECount ))
		end
	end
end

--========================================================================--