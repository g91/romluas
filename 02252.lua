-------------------------------Initialization--------------------------------------------
function kg_Z13PE03_Init()
	Lua_Zone13_PE03_GlobalSet()
	Lua_Zone13_PE01_PESet()
end

function Lua_Zone13_PE03_GlobalSet()--�ܼƫŧi
	Zone13_PE03_PEIndex = 1303
	Zone13_PE03_PHIndex = { 100, 200, 300 }
	Zone13_PE03_Var_ForgedBox={}--���a�I�񪺰��c�l�A�C���c�l�����Q�v�T���Ǫ�
	
	Zone13_PE03_Var = {}
	Zone13_PE03_Var["MapID"] = 366
	Zone13_PE03_Var["CheckTime"] = 30
	
	Zone13_PE03_Var["Enemy"] = {	105269,	--��_�}�n���ȤH
					105270	--�̵M��z���ȤH
					--���r���j�N�ȤH
					}
	Zone13_PE03_Var["Group"] = {}			--���거�ܪ̸s��(�ȤH+�f��)
	Zone13_PE03_Var["Friendly"] = { 105301,	--�u�ƪ��_�I��
					105316,	--�����Z���B�f��
					105317	--�ǳƥX�o���B�f��
					}
	Zone13_PE03_Var["QuestBox"]	= 117583	--�Q�m�ܪ��f��
	--Zone13_PE03_Var["QuestCar"] = 105304	--����
	--Zone13_PE03_Var["QuestArrow"] = 117509 	--�b�Y
	Zone13_PE03_Var["FlagID"] = {	780875, 		-- �X�и��X
					780876
					}
end

function Lua_Zone13_PE03_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE13_03_NAME"					-- ���~�止���Z�\�w��a
	local PE_Desc = "SC_PE_ZONE13_03_DESC"					-- �b�Q��ŧ���h��a��A�Z�\�w�p�����إߤF�{�ɩʪ����I�A�b�@���٫ܷW�ê��ɭԡA�ȤH�̦A���³o�Ӿ��I�i�}�����A�øչϷm�ܪ���I
	local PEIndex = Zone13_PE03_PEIndex
	local PHIndex = Zone13_PE03_PHIndex
	local TestID = 1
	
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , Zone13_PE03_Var["MapID"] )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�
	PE_AddPhase( PEIndex , 10 , "SC_PE_ZONE13_03_PH1_NAME", "SC_PE_ZONE13_03_PH1_DESC", 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , 10, 10, "", "", "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, 10, 10, false )
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone13_PE03_Leave" )--���}�ϰ�
	PE_Start( PEIndex , 10 )-- �ƥ�Ұ�
end

function Lua_Zone13_PE03_Leave( PEIndex , Player )
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
end

function LuaPE_kg_GetBuff()
	local Player = TargetID()
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player , 508745 )
	LuaPE_KS_GetBuff( Player )
end

function LuaPE_kg_CleanBuff()
	local Player = TargetID()
	Lua_Zone13_PE03_ClearPlayerBuff( Player )
	CancelBuff(Player , 508745 )
	LuaPE_KS_CleanBuff( Player )
end

function Lua_Zone13_PE03_ClearPlayerBuff( Player )
	local Buff= { 508736, 508743 , 508744 ,508746 ,508880 }
	for i in pairs(Buff) do
		CancelBuff(Player,Buff[i])
	end
end

function Lua_Zone13_PE03_CtrlInit()--���거�ܪ̤�������l��
	Sleep(10)
	local Ctrl = OwnerID()
	WriteRoleValue( Ctrl , EM_RoleValue_Register10 , 0 )	--�f���ثe�Q���a�������ƶq
	WriteRoleValue( Ctrl , EM_RoleValue_Register9, kg_Rand(4) )	--���K���j�M�b�Y�Ҧb��m
	kg_CtrlInit(Ctrl)
	local Enemy = Zone13_PE03_Var["Enemy"]
	local QuestBox = Zone13_PE03_Var["QuestBox"]
	local TempGroup = SearchRangeNPC( Ctrl , 100 )	--�������j���d��
	local NPCGroup = {}
	NPCGroup["Ctrl"]=Ctrl
	NPCGroup["Enemy"]={}
	NPCGroup["Box"]={}
	for i in pairs(TempGroup) do
		if ReadRoleValue( TempGroup[i],EM_RoleValue_PID )==130304 then 		--���거�ܪ̪��ȤH
			table.insert(NPCGroup["Enemy"] , TempGroup[i])
		end
		if ReadRoleValue( TempGroup[i], EM_RoleValue_OrgID ) == QuestBox  then	--�P�wOrgID�O�_���f��
			table.insert(NPCGroup["Box"] , TempGroup[i])
		end
	end
	local Group = Zone13_PE03_Var["Group"]
	local GroupNum =0
	if  Group[1]==nil then
		GroupNum=1
	else
		GroupNum = table.getn(Group)+1
	end
	Group[GroupNum]=NPCGroup--������
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , GroupNum )			--�s�դ������O��ۤv���ݪ��s�սs��
	for i in pairs(NPCGroup["Enemy"]) do
		WriteRoleValue( NPCGroup["Enemy"][i] , EM_RoleValue_Register1 , GroupNum )	--�C�ӨȤH���O��ۤv���ݪ��s�սs��
		WriteRoleValue( NPCGroup["Enemy"][i] , EM_RoleValue_Register2 , Ctrl )		--�C�ӨȤH���O��Ӹs�ժ�������
		--Say( NPCGroup["Enemy"][i],"Ready!")
	end
	for i in pairs(NPCGroup["Box"]) do
		WriteRoleValue( NPCGroup["Box"][i] , EM_RoleValue_Register1 , GroupNum )	--�C�ӳf�����O��ۤv���ݪ��s�սs��
		WriteRoleValue( NPCGroup["Box"][i] , EM_RoleValue_Register2 , Ctrl )		--�C�ӳf�����O��Ӹs�ժ�������
		BeginPlot( NPCGroup["Box"][i] , "Lua_Zone13_PE03_QuestBoxInit" , 0 )
	end
	DebugMsg( 0,0,"GroupID = "..table.getn(Group) )
end

function Lua_Zone13_PE03_QuestBoxInit()--�f����l��
--EM_RoleValue_Register10 �f���Q���a�I��j�w��
	local Box = OwnerID()
	WriteRoleValue( Box , EM_RoleValue_Register10, 0 )	--�ƹ��I�����w
	WriteRoleValue( Box , EM_RoleValue_Register9, 0 )	--�������b�Y��w
	SetModeEx( Box , EM_SetModeType_Mark, TRUE)---�i�I��
	SetPlot( Box,"touch","Lua_Zone13_PE03_TouchQuestBox",30 )
	SetModeEx( Box , EM_SetModeType_Show, TRUE )--�O�_ø�s�X�ҫ�
	--Say( Box , "Ready" )
	DebugMsg(0,0,"BoxInit")
end

function Lua_Zone13_PE03_TouchQuestBox()--���a�ϥγf��
	local Box = TargetID()
	local Player = OwnerID()
	if CheckBuff(Player,508736)~=TRUE then	--���a���W�S�����˫h�I�s�P�s�ժ��ȤH�L��
		local GroupID = ReadRoleValue( Box , EM_RoleValue_Register1 )--Ū���f���Ҧb���s��ID
		local Group = Zone13_PE03_Var["Group"][GroupID]
		for i in pairs(Group["Enemy"]) do
			if CheckBuff(Group["Enemy"][i] , 508737)~=true and CheckBuff(Group["Enemy"][i] , 508738)~=true then
				SysCastSpellLv( Player, Group["Enemy"][i] , 496946, 0 )--�W�[����
			end
		end
	end
	if ReadRoleValue(Box,EM_RoleValue_Register10)==0 and ReadRoleValue(Box,EM_RoleValue_Register9)==0 then--�P�w�O�_�Q���a��w�ӥB�b�Y�S�X�{
		WriteRoleValue(Box,EM_RoleValue_Register10, 1 )	--�ƹ��I�����w
		if BeginCastBarEvent( Player, Box , "[SC_PE_ZONE13_03_CASTBARSTRING]", 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 , "Lua_Zone13_PE03_QuestBoxTriger")~=1 then
			ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	elseif ReadRoleValue(Box,EM_RoleValue_Register9)==1 and CheckBuff(Player,508715)==true and ReadRoleValue(Box,EM_RoleValue_Register10)==0 then--�o�O���Kbuff
		WriteRoleValue(Box,EM_RoleValue_Register10, 1 )	--�ƹ��I�����w
		if BeginCastBarEvent( Player, Box , "[SC_PE_ZONE13_03_CASTBARSTRING]", 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0 , "Lua_Zone13_PE03_QuestBoxTriger")~=1 then
			ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
		end
	else
		ScriptMessage( Box, Player, 0,"[SAY_NPC_BUSY]", 0 )
	end
end

function Lua_Zone13_PE03_QuestBoxTriger( ObjID, CheckStatus )
	local Player = OwnerID()
	local Box = TargetID()
	if CheckStatus >0  then
		EndCastBar( Player,CheckStatus )
		if CheckBuff(Player,508712)==true then--�Z�\�w���٪�
			CallPlot(Box,"Lua_Zone13_PE03_QuestBoxReset",Player )
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE02]" , C_SYSTEM )--�A�m�^�F�Q�m�ܪ�����I
		elseif CheckBuff(Player,508715)==true then--�o�O���Kbuff
			if ReadRoleValue(Box,EM_RoleValue_Register9)==1 and  CheckBuff(Player,508880)~=true then--�u�n���a�ݪ���b�Y�ӥB��buff���i�H��
				WriteRoleValue( Box,EM_RoleValue_Register10,0)--�Ѱ���w
				AddBuff( Player,508880,0,-1 )--���K���
				AddBuff( Player,508746,0,-1 )--����Ž�
				ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE05]" , 0 )--�A�w�g������K���I�֮��^�h�����F���D�w�N���I
			else	--���a�I���c�l�Ψ��W�����K���
				WriteRoleValue( Box,EM_RoleValue_Register10,0)
				ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--�A����]�S���C
			end
		else
			WriteRoleValue( Box,EM_RoleValue_Register10,0 )
			ScriptMessage( Player, Player, 1 , "[SC_PE_ZONE13_03_MESSAGE03]" , 0 )--�A����]�S���C
		end
	else
		EndCastBar( Player,CheckStatus)
		WriteRoleValue( Box,EM_RoleValue_Register10,0)
	end
end

function Lua_Zone13_PE03_QuestBoxReset( Player )	--�f���Q������i�J�N�o���A�A�p�G��Ӹs�ժ��c�l���Q���N�i�J�˼ƧN�o
	local Box = OwnerID()
	ks_QuestKill( Player, 105315, 1 )--���ȥ����ñ��H�k( killer���H��(0=OID,1=TID, other), DeadID�Q����H, num�����ƶq )
	--DebugMsg( 0,0,"Get 1 QuestKey!" )
	--Say(Player,"I Get 1 QuestKey!"  )
	
	Hide(Box)
	SetModeEx( Box , EM_SetModeType_Mark, FALSE)---�i�I��
	SetModeEx( Box , EM_SetModeType_Show, FALSE )--�O�_ø�s�X�ҫ�
	Show(Box,0)
	SetPlot( Box,"touch","",30 )
	local Ctrl = ReadRoleValue( Box,EM_RoleValue_Register2 )
	local BoxCount = ReadRoleValue( Ctrl , EM_RoleValue_Register10 )+1
	if BoxCount>=4 then
		local GroupID = ReadRoleValue( Box , EM_RoleValue_Register1 )--Ū���f���Ҧb���s��ID
		local Group = Zone13_PE03_Var["Group"][GroupID]
		for i=1,table.getn(Group["Enemy"]) do--��s�դ����ȤH�[�W"���h����"
			AddBuff(Group["Enemy"][i],508748,0,-1)--���h����
		end
		--508748
		Sleep(50)--�Ҧ��f�����N�o�ɶ�
		DebugMsg(0,0,"BoxReset!")
		for i=1,table.getn(Group["Box"]) do--���ͦP�s�ժ��Ҧ��f��
			BeginPlot( Group["Box"][i] ,"Lua_Zone13_PE03_QuestBoxInit",1 )
		end
		for i=1,table.getn(Group["Enemy"]) do--�����P�s�ժ����h���ꪬ�A
			CancelBuff(Group["Enemy"][i],508748)--���h����
		end
		WriteRoleValue( Ctrl , EM_RoleValue_Register10 , 0 )--���������f���p�q�k�s
	else
		WriteRoleValue( Ctrl , EM_RoleValue_Register10 , BoxCount )
	end
end


---------------------------------CheckType----------------------------------------
function Lua_Zone13_PE03_CheckArea01()--�j�M����O�_���Q�ܨ����f��(���O�䤤����),�ӥB�ȤH�Z���n�W�L�Y��¾�H�W
	local Oid = OwnerID()--���a
	--Say(Oid,"Zone13PE03_CheckArea01...")
	local Group =  Zone13_PE03_Var["Group"]
	for i in pairs(Group) do
		local TargetCtrl=Group[i]["Ctrl"]
		--Say(Oid,"SearchCtrl= ".. TargetCtrl.." ,Distance= "..GetDistance( Oid,TargetCtrl ) )
		if GetDistance( Oid,TargetCtrl )<=100 then
			--Say( TargetCtrl , "Yo... "..TargetCtrl )
			local EnemyGroup = Group[i]["Enemy"]
			for j in pairs(EnemyGroup) do
				if GetDistance(EnemyGroup[j],Oid)<=140 and ReadRoleValue(EnemyGroup[j],EM_RoleValue_Register7)==0  then
					ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--�ޯ���󤣲�
					return false
				end
			end
			--Say(Oid,"No Enemy Here...")
			WriteRoleValue(Oid,EM_RoleValue_Register5,TargetCtrl )--�b���a���W��̪񪺤�����ID
			return true
		else
			--Say(Oid,"No Ctrl.....")
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--�ޯ���󤣲�
	return false
end

function Lua_Zone13_PE03_CheckArea02()--�j�M���K��󪺰ϰ�P�w
	local Oid = OwnerID()
	local Group =  Zone13_PE03_Var["Group"]
	if CheckBuff(Oid,508745)==TRUE then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE04]" , 0 )--�A�w�g��^���K���I
		return FALSE
	elseif CheckBuff(Oid,508880)==TRUE then
		ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_MESSAGE05]" , 0 )--�A�w�g������K���I�֮��^�h�����F���D�w�N���I
		return FALSE
	else
		for i=1 , table.getn( Group ) do
			local TargetCtrl=Group[i]["Ctrl"]
			if GetDistance( Oid,TargetCtrl )<=100 then
				DebugMsg(0,0,"Ctrl="..TargetCtrl.." ,Distance="..GetDistance( Oid,TargetCtrl ) )
				local BoxGroup = Group[i]["Box"]
				for i in pairs(BoxGroup) do
					if GetModeEx( BoxGroup[i], EM_SetModeType_Show )==true then
						DebugMsg(0,0,"Box....")
						WriteRoleValue(Oid,EM_RoleValue_Register5,TargetCtrl )--�b���a���W��̪񪺤�����ID
						return true
					end
				end
				ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
				return false
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return FALSE
end

function Lua_Zone13_PE03_CheckBox()--�ˬd�O�_���f��
	local Oid = OwnerID()--�ϥΪ�
	local Tid =TargetID()
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )== Zone13_PE03_Var["QuestBox"] then
		return TRUE
	end
	
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckForgedBox()--�ˬd���a���W������c
	local Oid = OwnerID()
	local ForgedBox=ReadRoleValue(Oid,EM_RoleValue_Register9 )
	if CheckID(ForgedBox)==TRUE and ReadRoleValue(ForgedBox,EM_RoleValue_OrgID )==117507 and ReadRoleValue(ForgedBox,EM_RoleValue_Register8)==1 then
		return TRUE
	end
	
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR01]" , 0 )--�A�S�����f��
	return FALSE
end

function Lua_Zone13_PE03_CheckBuff01()--�ˬd�ȤH���W�O�_���Q�ʵ��P��O�J�аO�A�аO�ˬd��
	local Oid =OwnerID()
	local Tid = TargetID()
	local Enemy = Zone13_PE03_Var["Enemy"]
	for i=1, table.getn( Enemy ) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[i] then
			if CheckBuff(Tid,508739)~=TRUE and CheckBuff(Tid,508741)~=TRUE and CheckBuff(Tid,508742)~=TRUE and CheckBuff(Tid,508740 )~=TRUE and KS_InCombat(Tid)~=TRUE then
				return TRUE
			end
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckType01()--�ˬd�O�_���ȤH
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	local Enemy = Zone13_PE03_Var["Enemy"]
	for i=1, table.getn( Enemy ) do
		if ReadRoleValue( Tid, EM_RoleValue_OrgID ) == Enemy[i] then
			return true
		end
	end

	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return false
end

function Lua_Zone13_PE03_CheckType02()--�ˬdNPC�O�_�����F���D�w�N��
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117508 and CheckBuff(Oid,508880)==TRUE then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckType03()--�ˬdNPC�O�_���ѽm���e�f��
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117510 then
		if CheckBuff(Oid,508745)==true then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR03]" , 0 )--�A�w�g�������ȤF
			return false
		else
			return true
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckType04()--�ˬdNPC�O�_���ռw�D�v���Z
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==117511 then
		if CheckBuff(Oid,508745)==true then
			ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR03]" , 0 )--�A�w�g�������ȤF
			return false
		else
			return true
		end
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckType05()--�ˬd�ۤv�O�_�b�e�f������B�e�f���D�԰�
	local Oid = OwnerID()--�ϥΪ�
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and  GetDistance(Oid,QuestMember)<=100  and KS_InCombat(QuestMember)~=TRUE then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_PE_ZONE13_03_ERROR02]" , 0 )--�ޯ���󤣲�
	return FALSE
end

function Lua_Zone13_PE03_CheckType06()--�ˬd�ۤv�O�_�b�e�f������B�e�f���԰���
	local Oid = OwnerID()--�ϥΪ�
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if HateListCount(QuestMember)>0 then --KS_InCombat(QuestMember)==TRUE then
		DebugMsg(0,0,QuestMember)
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return FALSE
end

function Lua_Zone13_PE03_CheckType07()--�ˬd�ۤv�O�_�b�e�f������
	local Oid = OwnerID()--�ϥΪ�
	local QuestMember = ReadRoleValue(Oid,EM_RoleValue_Register9)
	if kg_CheckLive(QuestMember)==TRUE and  GetDistance(Oid,QuestMember)<=100  then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return FALSE
end

function Lua_Zone13_PE03_CheckType08()--�ˬd�ؼЬO�_�����`����
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183 then
		return TRUE
	end
	ScriptMessage( Oid, Oid, 1 , "[EM_200928_2]" , 0 )--�ؼп��~
	return FALSE
end

function Lua_Zone13_PE03_CheckType09()--�ˬd�ؼЬO�_�����`����γf��
	local Tid = TargetID()--�ؼ�
	local Oid = OwnerID()--�ϥΪ�
	if ReadRoleValue( Tid , EM_RoleValue_OrgID )==105318 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105183 or ReadRoleValue( Tid , EM_RoleValue_OrgID )==105304 then
		return TRUE
	end
	return FALSE
end

function Lua_Zone13_PE03_CheckMap()--�ˬd�ϰ�A�ȤH���˨ϥΧP�w
	local Oid = OwnerID()
	if DW_CheckMap( OID , Zone13_PE03_Var["MapID"] ) == true then
		return true
	end	
	ScriptMessage( Oid, Oid, 1 , "[SC_421324_1]" , 0 )--���b�ؼаϰ줺
	return false
end
------------------------------Born-----------------------------------------
function Lua_Zone13_PE03_Born01()--���거�ܪ̨ȤH��l��
	local Oid = OwnerID()
	SetFlag( Oid, 544801, 1 )--�������_��
	WriteRoleValue(Oid,EM_RoleValue_Register10,0)--�o�ۦ���ɰO���a��ID
	WriteRoleValue(Oid,EM_RoleValue_Register7,0)--�ȤH���`
	SetPlot( Oid , "DEAD", "Lua_Zone13_PE03_Dead01", 0 )--���`�@��
	--Say( Oid ,"Ready!" )
end

function Lua_Zone13_PE03_Born02()--�u�ƪ̸s��NPC��l��
	local Oid = OwnerID()
	WriteRoleValue(Oid,EM_RoleValue_PID,130301)
	SetFlag( Oid, 544801, 1 )--�������_��
	SetPlot( Oid , "DEAD", "Lua_Zone13_PE03_Dead02", 0 )--���`�@��
	AddBuff(Oid,508871,0,-1)--�C10S�����k�N
	--Say( Oid ,"Ready!" )
end

function Lua_Zone13_PE03_10sChangeBuff()--����Buff�C10��Ĳ�o�@��
	math.randomseed(math.random(10000, 99999))
	local Oid =OwnerID()
	local BuffID = { 508750,508751,508752,508753 }
	local randnum = math.random(4)
	if CheckBuff(Oid, 508754 )~=TRUE then
		AddBuff(Oid,BuffID[randnum],0,-1)
		--Say(Oid,"BuffRand= "..randnum )
	end
end
------------------------------Dead----------------------------------------------
function Lua_Zone13_PE03_Dead01()	--�ȤH���`�A���u�@�̯h��
	WriteRoleValue(OwnerID(),EM_RoleValue_Register7,1)--�ȤH���`
	local Tid =TargetID()
	if ReadRoleValue(Tid,EM_RoleValue_PID)==130301 and CheckBuff(Tid,508876)~=TRUE then--���u�@�̦ӥB�u�@�̨��W�S���h�ҧK��
		AddBuff( Tid , 508749 , 0 , -1 )--�h��
	end
end

function Lua_Zone13_PE03_Dead02()	----�u�ƪ̸s��NPC���`
	
end

function Lua_Zone13_PE03_Dead03()	--�e�f�����`
	local QuestMember =OwnerID()
	local QuestCar = ReadRoleValue(QuestMember,EM_RoleValue_Register9)
	DelObj(QuestCar)
end

function Lua_Zone13_PE03_Dead04()	--�f�����`
	local QuestCar =OwnerID()
	local QuestMember = ReadRoleValue(QuestCar,EM_RoleValue_Register9)
	DelObj(QuestMember)
end
-----------------------------Function-------------------------------
function Lua_Zone13_PE03_SearchArea( Player )--�j�M���a���񦳨S���ϰ줤����
	local Group =  Zone13_PE03_Var["Group"]
	for i=1 , table.getn( Group ) do
		local TargetCtrl=Group[i]["Ctrl"]
		if GetDistance(Player,TargetCtrl)<=100 then
			DebugMsg(0,0,"Ctrl Find! ")
			return TargetCtrl
		end
	end
	DebugMsg(0,0,"No Ctrl! ")
	return 0
end
-----------------------------------Test-------------------------------------------
function kg_Zone13PE3_PrintGroup()--�C�X���거�ܪ̸s��
	local Group = Zone13_PE03_Var["Group"]
	if Group[1]~=nil then
		for i=1 , table.getn(Group) do--�s�դ����C�@�����
			DebugMsg(0,0,"===============���j�u===================")
			DebugMsg(0,0,"Ctrl = "..Group[i]["Ctrl"] )
			for j in pairs(Group[i]["Enemy"] ) do
				DebugMsg(0,0,"Enemy_"..j.." = "..Group[i]["Enemy"][j] )
			end
			for k in pairs(Group[i]["Box"] ) do
				DebugMsg(0,0,"Box_"..k.." = "..Group[i]["Box"][k] )
			end
		end
	else
		DebugMsg(0,0,"Group==nil  !!")
	end
end

function kg_Zone13PE3_GetCtrlGroup()--��s�դ������ϥΡA�L�X�Ӥ��������s�զ���
	DebugMsg(0,0,"===============���j�u===================")
	local Ctrl = OwnerID()
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Group = Zone13_PE03_Var["Group"][GroupID]
	DebugMsg(0,0,"Ctrl = "..Group["Ctrl"] )
	for j in pairs(Group["Enemy"] ) do
		DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
	end
	for k in pairs(Group["Box"] ) do
		DebugMsg(0,0,"Box_"..k.." = "..Group["Box"][k] )
	end
end