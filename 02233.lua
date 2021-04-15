
--================================== Init ====================================--

function Lua_Zone13_PE02_GlobalSet()--�ܼƫŧi
	Zone13_PE02_PEIndex = 1302
	Zone13_PE02_Phase = 2	--�}�l���q
	Zone13_PE02_PHIndex = { 100, 200, 300 }
	
	Zone13_PE02_Var = {}	
	Zone13_PE02_Var["MapID"] = 334
	
	Zone13_PE02_Var["Enemy"] = {	105157,
									105162,
									105163
								}
	Zone13_PE02_Var["Friendly"] = {	105222,
									105300
									}
	
	Zone13_PE02_Follow = {}
	
	Zone13_PE02_Var["EnemyNum"] = 0
	Zone13_PE02_Var["FriendlyNum"] = 0		
end

function Lua_Zone13_PE02_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE13_02_NAME"					-- �g�ɳD�s��ŧ��
	local PE_Desc = "SC_PE_ZONE13_02_DESC"					-- ����D�s���ƶq�P���ʤO���`�j�W�A�y���u�^�w�i�n�a�v�U�����H�������ˮ`�A�ƦܬO����P�D�@�Ԫ��u���ļw��ڡv�]�L�i�קK�C
	
	local PEIndex = Zone13_PE02_PEIndex
	local PHIndex = Zone13_PE02_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , Zone13_PE02_Var["MapID"] )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
			
	local PH_Name = {	"SC_PE_ZONE13_02_PH1_NAME",	--(�ڤ��u��)
						"SC_PE_ZONE13_02_PH2_NAME",	--(�ħڧ���)
						"SC_PE_ZONE13_02_PH3_NAME"	--(�ڤ�H��)
					}
	
	local PH_Desc = {	"SC_PE_ZONE13_02_PH1_DESC",--
						"SC_PE_ZONE13_02_PH2_DESC",--
						"SC_PE_ZONE13_02_PH3_DESC"--
					}

	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )	
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[3] , PH_Name[3], PH_Desc[3], 0 , 1 , 1 , 0 )

	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[3], PHIndex[3], "", "", "Zone13_PE02_Lock" , 0, 1,  true )
	
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_OB_SetVisible( PEIndex, PHIndex[3], PHIndex[3], false )
	
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone13_PE02_Leave" )--���}�ϰ�
	
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	
	-- �ƥ�Ұ�
	PE_Start( PEIndex , PHIndex[2] )
end

function Lua_Zone13_PE02_Leave( PEIndex, Player )--���}�ϰ�
	if CheckBuff( Player, 508622 ) == true then
		CancelBuff( Player, 508622 )
	end
end

function Lua_Zone13_PE02_CheckFollow()--�T�w���H
	local Follow = Zone13_PE02_Follow
	while true do
		sleep(50)
		for site in pairs( Follow ) do
			if CheckID(site) == true and KS_InCombat(site) ~= true then
				SetFollow( site, Follow[site] )
			elseif CheckID(site) ~= true then
				table.remove( Follow, site )
			end
		end
		Lua_Zone13_PE02_CheckPhase()--�ˬd���q
	end
end

function Lua_Zone13_PE02_CheckPhase()--�ˬd���q
	local PEIndex = Zone13_PE02_PEIndex
	local PHIndex = Zone13_PE02_PHIndex
	local EnemyNum = Zone13_PE02_Var["EnemyNum"]
	local FriendlyNum = Zone13_PE02_Var["FriendlyNum"]
	
	if EnemyNum >= math.floor(FriendlyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[3] )
		Zone13_PE02_Phase = 3
	elseif FriendlyNum >= math.floor(EnemyNum*1.2) then
		PE_JumpToPhase( PEIndex, PHIndex[1] )
		Zone13_PE02_Phase = 1
	else
		PE_JumpToPhase( PEIndex, PHIndex[2] )
		Zone13_PE02_Phase = 2
	end
end

--================================== CheckType ====================================--

function Lua_Zone13_PE02_CheckType01()--�ˬd�O�_���D��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then		
			return true
		end
	end

	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_CheckCombat01()--�԰����B�ؼФ��O�ۤv
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] and ReadRoleValue( TID, EM_RoleValue_AttackTargetID ) ~= OID then		
			return true
		end
	end	
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_CheckMap()--�ˬd�ϰ�
	local OID = OwnerID()--�ϥΪ�
	if DW_CheckMap( OID, Zone13_PE02_Var["MapID"] ) == true then
		return true		
	end	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end

--================================== Skill 1 ====================================--

function Lua_Zone13_PE02_StealPoison()--���r
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--Ū���ޯ�
	if MID == 496943 then--�X���Ѩ�
		ks_QuestKill( OID, 105221, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	elseif MID == 496944 then--�����r�G
		ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	AddBuff( TID, 508661, 0, -1 )--�L�r
end

--===============================================================================--

--================================== Skill 2 ====================================--

function Lua_Zone13_PE02_SnakeCheck()--�D�������ˬd
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�	
	if CheckBuff( TID, 508665 ) == true and CheckBuff( TID, 508668 ) ~= true then
		if rand(10) > 3 then--�Ͼ�
			NPCSay( TID, "[SC_PE_ZONE13_02_ERROR01]")--�X���F
			AddBuff( TID, 508666, 0, 10 )
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR04]" , 0 )--���ܰT��
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR04]" , 0 )--���ܰT��
			local obj = KS_CreateObjMode( 117313, TID, nil,  15, 1, false, 15 )--�ؼЪ��񲣥ͪ���
			CallPlot( Obj, "Lua_Zone13_PE02_MagicErrorCheck", TID )--�}�l�ˬd
		else
			ks_QuestKill( TID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )			
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR03]" , "0xffffff00" )--���ܰT��
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR03]" , "0xffffff00" )--���ܰT��
		end
		CancelBuff( TID, 508665 )
		return true
	end
	
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) ~= 105196 then
		local Poison = { 496917, 496918, 496919 }
		SysCastSpellLv( OID, TID, Poison[rand(3)+1], 10 )
	end
	return true
end


function Lua_Zone13_PE02_MagicErrorCheck( TID )--�]�k�����ˬd
	local OID = OwnerID()--NPC
	local Type = GameObjInfo_Int( 496948, "ColdownType" )
	
	for i=1, 10 do
		if CheckID(TID) == true and ReadRoleValue( TID, EM_RoleValue_IsDead ) ~= 1 and
			ReadRoleValue( TID, EM_RoleValue_Coldown_Job + Type  ) <= 0 then
			sleep(10)
			AddBuff( TID, 508668, 0, 8 )--�Ѱ��Ͼ���			
			CastSpell( TID, TID, 496948 )--�}�l�N�o
			ScriptMessage( TID, TID, 1 , "[SC_PE_ZONE13_02_ERROR02]" , "0xffffff00" )--���ܰT��
			ScriptMessage( TID, TID, 0 , "[SC_PE_ZONE13_02_ERROR02]" , "0xffffff00" )--���ܰT��
			ks_ActorMode( OID )
			AddToPartition( OID, 0 )
			AdjustFaceDir( OID, TID, 0 ) --���V�ؼ�
			SysCastSpellLv( OID, OID, 495735, 0 )--�ǰe�S��
			sleep(10)
			CastSpell( OID, TID, 496973 )--����I�k�ʧ@
			sleep(20)
			CancelBuff_NoEvent( TID, 508666 )--�����Ͼ�
			MagicInterrupt( OID )
			ks_QuestKill( TID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			SysCastSpellLv( OID, OID, 495735, 0 )--�ǰe�S��
			sleep(5)
			DelFromPartition(OID)
			break
		elseif CheckID(TID) ~= true or ReadRoleValue( TID, EM_RoleValue_IsDead ) == 1 then
			break
		end
		sleep(10)
	end
	DelObj(OID)
end

function Lua_Zone13_PE02_ErrorToDie()--�·����F
	local OID = OwnerID()--�ϥΪ�
	if CheckBuff( OID, 508668 ) == true then
		return false
	end
	return true
end

--===============================================================================--

--================================== Skill 3 ====================================--

function Lua_Zone13_PE02_CreateTrap()--�гy����
	local OID = OwnerID()--�ϥΪ�	
	local obj = KS_CreateObjMode( 105228, OID, nil,  0, 1, true )--�ؼЪ��񲣥ͪ���
	ks_TrapMode(obj)--������
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 14 )
	WriteRoleValue( obj, EM_RoleValue_Register1, OID )--�g�J�гy��
end

function Lua_Zone13_PE02_TrapDo()--�����@���Ʊ�
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE02_Var["Enemy"]

	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			local Creater = ReadRoleValue( OID, EM_RoleValue_Register1 )
			KillID( Creater, TID )--����
			Hide(TID)
			AddBuff( Creater, 508670, 0, -1 )
			ks_QuestKill( Creater, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			DelObj(OID)
			return
		end
	end
end

function Lua_Zone13_PE02_CatchSnakeCheck()--��D�T�{
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE02_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.05 then			
				return true
			end
			ScriptMessage( OID, OID, 1 , "[SYS_CASTSPELL_NEED_HP_LOWER]", 0 )--��q�L��
			return false
		end
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_CatchSnake()--���\��D
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_SNAKE]" , "0xffffff00" )--���ܰT��
	ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_SNAKE]" , "0xffffff00" )--���ܰT��
	ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	Hide(TID)
	KillID( OID, TID )--����
end

--===============================================================================--

--================================== Skill 4 ====================================--

function Lua_Zone13_PE02_CreateTree( TID )-- �ؾ�
	local OID = OwnerID()--�ϥΪ�
	TID = TID or OID
	local tree = ReadRoleValue( OID, EM_RoleValue_Register1 )
	if tree > 0 and CheckID(tree) == true then
		DelObj(tree)
	end
	local obj = KS_CreateObjMode( 117316, OID, nil,  0, 1, true )--�ؼЪ��񲣥ͪ���
	ks_ActorMode( obj )
	WriteRoleValue( obj, EM_RoleValue_Register1, TID )--�g�J�гy��
	BeginPlot( obj, "Lua_Zone13_PE02_TreeGrow", 0 )
	if ReadRoleValue( OID, EM_RoleValue_IsPlayer ) == 0 then Hide(OID) end
	return true
end

function Lua_Zone13_PE02_TreeGrow()--����j	
	local OID = OwnerID()--�g��
	sleep(50)
	local obj = KS_CreateObjMode( 105223, OID, nil,  0, 1, true )--�ؼЪ��񲣥ͪ���
	ks_TrapMode(obj)--������
	AddBuff( Obj, 508946, 0, -1 )
	local Creater = ReadRoleValue( OID, EM_RoleValue_Register1 )
	WriteRoleValue( obj, EM_RoleValue_Register1, Creater )--�g�J�гy��
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 180 )
	WriteRoleValue( Creater, EM_RoleValue_Register1, obj )--�g�J
	DelObj(OID)
end

function Lua_Zone13_PE02_TreeHate()--��Q��
	local TID = TargetID()
	local Creater = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )--�гy��	
	local Enemy = Zone13_PE02_Var["Enemy"]
	
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] then
			SysCastSpellLv( Creater, TID, 496946, 0 )--�W�[����	
			return true
		end
	end
	return false
end


function Lua_Zone13_PE02_DieAndLive()--�ͻP��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105163 then		
		local Obj = SearchRangeNPC( TID, 100 ) --TargetID()
		for i=0, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105223 and ReadRoleValue( Obj[i], EM_RoleValue_Register1 ) == OID then
				DelObj(Obj[i])
				ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
				CallPlot( TID, "Lua_Zone13_PE02_CreateTree", OID )--�ؾ�
				return true
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_NATURE]" , 0 )--����S���۵M����
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_LifeStyle()--�ͩR���Φ�
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105162 then
		local Obj = SearchRangeNPC( TID, 100 ) --TargetID()
		for i=0, table.getn(Obj) do
			if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105223 and ReadRoleValue( Obj[i], EM_RoleValue_Register1 ) == OID then
				BeginPlot( TID, "Lua_Zone13_PE02_Reset", 0 )--����
				return true
			end
		end
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_NATURE]" , 0 )--����S���۵M����
		return false		
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_LifeStyleDmg()--�ͩR���Φ��ˮ`
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE02_Var["Enemy"]
	for i=1, table.getn(Enemy) do
		if ReadRoleValue( TID, EM_RoleValue_OrgID ) == Enemy[i] and ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.3 then
			ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		end
	end
	return true
end

--===============================================================================--

--================================== Skill 5 ====================================--

function Lua_Zone13_PE02_CheckSmith()--�ˬd�O�_���u�K
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
		
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 117317 then
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

function Lua_Zone13_PE02_PlayerWork()--�}�l�u�@
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	local reg = ReadRoleValue( TID, EM_RoleValue_Register2 )
	if reg == 0 and ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 496957 then
		WriteRoleValue( TID, EM_RoleValue_Register2, OID )--���U
		CallPlot( TID, "Lua_Zone13_PE02_SmithWork", OID )--�u�K�}�l�u�@
		ScriptMessage( TID, OID, 1 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--���ܰT��
		ScriptMessage( TID, OID, 0 , "[SC_PE_ZONE13_01_WORK]" , "0xffffff00" )--���ܰT��	
	elseif reg == OID then
		local type = {	[496958] = 1, 
						[496959] = 2,
						[496960] = 3 }	
		local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--Ū���ޯ�		
		if type[MID] ~= nil then
			WriteRoleValue( TID, EM_RoleValue_Register4, type[MID] )--���U�u�@���e
		end
	end
end

function Lua_Zone13_PE02_SmithWork( player )--�u�K�u�@
	local OID = OwnerID()--�u�K
	local count = 0 --���\����
	
	while true do		
		sleep(25)
		local WorkInfo = ReadRoleValue( OID, EM_RoleValue_Register3 )--�u�@���e
		local PlayerWork = ReadRoleValue( OID, EM_RoleValue_Register4 )--���a���檺�u�@
		if 	WorkInfo == 0 then
			local rnd = rand(3)+1
			WriteRoleValue( Player, EM_RoleValue_Coldown_Job + 382 , 0 )
			WriteRoleValue( OID, EM_RoleValue_Register3, rnd )--���U�u�@���e
			ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH0"..rnd.."]" , "0xffffff00" )--���ܰT��
			ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH0"..rnd.."]" , "0xffffff00" )--���ܰT��
		else
			if PlayerWork == WorkInfo then				
				if count == 3 then
					ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH05]" , "0xffffff00" )--�����T��
					ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH05]" , "0xffffff00" )--�����T��					
					ks_QuestKill( player, 105221, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
					sleep(15)
					ks_ResetRegValue()--�Ȧs�ȭ��m
					CallPlot( OID, "ks_resetObj", OID, 60 )--60��᭫��
					break
				else
					count = count +1
					WriteRoleValue( OID, EM_RoleValue_Register3, 0 )--�M���u�@���e
				end
			else
				MagicInterrupt( player )--���_
				ScriptMessage( OID, player, 1 , "[SC_PE_ZONE13_02_SMITH04]" , 0 )--���ѰT��
				ScriptMessage( OID, player, 0 , "[SC_PE_ZONE13_02_SMITH04]" , 0 )--���ѰT��				
				ks_ResetRegValue()--�Ȧs�ȭ��m
				break
			end			
		end
		Sleep(15)
	end
end

--===============================================================================--

--================================== Skill 6 ====================================--

function Lua_Zone13_PE02_CheckDeed()--�T�{ñ����
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if TID ~= OID and ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and DW_CheckMap( TID, Zone13_PE02_Var["MapID"] ) == true then
		return true
	end	
	
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE02_Deed()--ñ��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	WriteRoleValue( TID, EM_RoleValue_Register2, OID )--����
	return true
end

function Lua_Zone13_PE02_ResetReg2()--�M���Ȧs2
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0 )
	return true
end

function Lua_Zone13_PE02_MoneyCheck()--�^������
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if rand(2) > 0 then
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_MONEY01]" , "0xffffff00" )--���\�T��
		ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_MONEY01]" , "0xffffff00" )--���\�T��
		ks_QuestKill( OID, 105221, 2 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	else
		ScriptMessage( OID, OID, 1 , "[SC_PE_ZONE13_02_MONEY02]" , 0 )--���ѰT��
		ScriptMessage( OID, OID, 0 , "[SC_PE_ZONE13_02_MONEY02]" , 0 )--���ѰT��
		ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )	
	end
	CancelBuff( TID, 508675 )--��������
	BeginPlot( TID, "Lua_Zone13_PE02_Reset", 0 )--����
	return true
end

--===============================================================================--

--================================== Skill 7 ====================================--

function Lua_Zone13_PE02_Dog()--�y��
	local OID = OwnerID()
	local TID = TargetID()--�ؼ�
	
	local obj = KS_CreateObjMode( 105196, OID, nil,  15, 1, false, 10 )--�ؼЪ��񲣥ͪ���	
	ks_AttackMode( obj )--�]�w�i����NPC
	WriteRoleValue( obj, EM_RoleValue_LiveTime, 42 )
	WriteRoleValue( obj, EM_RoleValue_Register1, OID )--�D�H
	CastSpell( obj, TID, 490529 )--����
	SysCastSpellLv( TID, obj, 495767, 0 )--�D�]
end

function Lua_Zone13_PE02_RemoveBones()--�h��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105163 then		
		return true
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone13_PE02_FireBones()--�N��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105162 then		
		return true
	end
	ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false	
end

function Lua_Zone13_PE02_DogCD()--�y��CD
	local TID = TargetID()
	local OID = OwnerID()--�ϥΪ�	
	local Type = GameObjInfo_Int( 496965, "ColdownType" )
	local time = ReadRoleValue( OID, EM_RoleValue_Coldown_Job + Type  )
	
	local less = {	[496966] = 25, 
					[496967] = 10 }	
	local MID = ReadRoleValue( OID, EM_RoleValue_SpellMagicID )--Ū���ޯ�	
	
	if less[MID] ~= nil and time > less[MID] then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , time - less[MID] )
	elseif less[MID] ~= nil then
		WriteRoleValue( OID, EM_RoleValue_Coldown_Job + Type , 0 )
	end
	Hide(TID)
end

--===============================================================================--

--================================== Skill 8 ====================================--

function Lua_Zone13_PE02_HealHunter()--�T�{�y�H
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�

	if DW_CheckMap( OID, Zone13_PE02_Var["MapID"] ) == true then	
		if TID == OID or ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105222 then
			return true
		end
		
		ScriptMessage( OID, OID, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
		return false
	end
	
	ScriptMessage( OID, OID, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end
	
function Lua_Zone13_PE02_CheckHunter()--����
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	
	if ReadRoleValue( TID, EM_RoleValue_OrgID ) == 105222 then
		ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
		AddBuff( OID, 508676, 0, 10 )
	end
	return true
end

function Lua_Zone13_PE02_ExpShare()--�g�����
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	local Obj = SearchRangeNPC( OID, 80 ) --TargetID()	
	
	for i= 0, table.getn(Obj) do
		if ReadRoleValue( Obj[i], EM_RoleValue_OrgID ) == 105222 then
			ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			return true
		end
	end	
	return false
end

function Lua_Zone13_PE02_Ice()--�B��
	local TID = TargetID()--�ؼ�
	local OID = OwnerID()--�ϥΪ�
	if ReadRoleValue( TID, EM_RoleValue_HP ) < ReadRoleValue( TID, EM_RoleValue_MaxHP )*0.17 then
		ks_QuestKill( OID, 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	end
	return true
end

--===============================================================================--

function Lua_Zone13_PE02_Reset()--����
	sleep(10)
	Hide(OwnerID())
end

function Lua_Zone13_PE02_Born01()--�y�H�X��
	local OID = OwnerID()
	ks_ResetRegValue()--�Ȧs�ȭ��m
	SetFlag( OID, 544801, 1 )--�������_��
	Zone13_PE02_Var["FriendlyNum"] = Zone13_PE02_Var["FriendlyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE02_Dead01", 0 )--���`�@��
	
	if Zone13_PE02_Phase == 3 and Zone13_PE02_Var["FriendlyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Friendly = Zone13_PE02_Var["Friendly"]
		local Obj = LuaFunc_CreateObjByObj( Friendly[rand(table.getn(Friendly))+1], OID )
		Zone13_PE02_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE02_Born02()--�D���X��
	local OID = OwnerID()
	DebugLog(2,"ScriptSource:Lua_Zone13_PE02_Born02>>DBID:"..ReadRoleValue(OID,EM_RoleValue_DBID)..">>OrgID:"..ReadRoleValue(OID,EM_RoleValue_OrgID));
	ks_ResetRegValue()--�Ȧs�ȭ��m
	SetFlag( OID, 544801, 1 )--�������_��
	Zone13_PE02_Var["EnemyNum"] = Zone13_PE02_Var["EnemyNum"] + 1
	SetPlot( OID, "DEAD", "Lua_Zone13_PE02_Dead02", 0 )--���`�@��
	
	if Zone13_PE02_Phase == 1 and Zone13_PE02_Var["EnemyNum"] < 100 and GetModeEx( OID, EM_SetModeType_Revive ) == true then
		local Enemy = Zone13_PE02_Var["Enemy"]
		local Obj = LuaFunc_CreateObjByObj( Enemy[rand(table.getn(Enemy))+1], OID )
		Zone13_PE02_Follow[Obj] = OID
		SetFollow( Obj, OID )
	end
end

function Lua_Zone13_PE02_Dead01()--�y�H���`
	local OID = OwnerID()	
	Zone13_PE02_Var["FriendlyNum"] = Zone13_PE02_Var["FriendlyNum"] - 1
	Hide(OID)
end

function Lua_Zone13_PE02_Dead02()--�D�����`
	local OID = OwnerID()
	local TID = TargetID()
	DebugLog(2,"ScriptSource:Lua_Zone13_PE02_Dead02>>DBID:"..ReadRoleValue(OID,EM_RoleValue_DBID)..">>OrgID:"..ReadRoleValue(OID,EM_RoleValue_OrgID)..">>TID's OrgID:"..ReadRoleValue(TID,EM_RoleValue_OrgID));
	local Enemy = Zone13_PE02_Var["Enemy"]	
	Zone13_PE02_Var["EnemyNum"] = Zone13_PE02_Var["EnemyNum"] - 1			
	local Num = HateListCount( OID )
	
	if CheckBuff( TID, 508673 ) == true and Num == 1 then--���⻴�}
		AddBuff( OID, 508675, 0, -1 )--����
	end
	
	for i = 0 , Num-1 do
		Hate = HateListInfo( OID, i, EM_HateListInfoType_GItemID )

		if CheckBuff( Hate, 508674 ) == true and rand(10) < 3 then--�����ū���
			ks_QuestKill( ReadRoleValue( Hate, EM_RoleValue_Register2 ), 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			AddBuff( OID, 508675, 0, -1 )--����
		end
		if ReadRoleValue( Hate, EM_RoleValue_OrgID ) == 105196 then			
			ks_QuestKill( ReadRoleValue( Hate, EM_RoleValue_Register1 ), 105221, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
			DelObj(Hate)
		end		
	end
	if KS_CheckBuffLV( TID, 508670 ) >= 3 and CheckBuff( OID, 508679 ) ~= true then
		KS_ClearBuffLV( TID, 508670, 3 )
		AddBuff( OID, 508679, 0, -1 )--�L�k����
		return false
	end
end

function Lua_Zone13_PE02_Test01()
	local OID = OwnerID()
	Say( OID, "Zone13_PE02_Phase = "..Zone13_PE02_Phase )
	Say( OID, " EnemyNum = "..Zone13_PE02_Var["EnemyNum"] .."; FriendlyNum = "..Zone13_PE02_Var["FriendlyNum"] )	
end