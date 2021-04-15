-------------------------------Initialization--------------------------------------------
function kg_Z14PE01_Init()
	Lua_Zone14_PE01_GlobalSet()
	Lua_Zone14_PE01_PESet()
end

function Lua_Zone14_PE01_GlobalSet()--�ܼƫŧi
	Zone14_PE01_PEIndex = 1401
	Zone14_PE01_PHIndex = { 100, 200 }
	Zone14_PE01_Phase = 1
	Zone14_PE01_PowerNPClimit = 5
	Zone14_PE01_NpcDebuffMax={30,4}	--[1]���]  [2]�Ҽ{���H
	Zone14_PE01_BossFailMax=4		--boss ���ѤW��

	Zone14_PE01_Var = {}
	Zone14_PE01_Var["BossFail"]=0	--Boss�Q���]������
	Zone14_PE01_Var["CurrentDeBuff"]=0	--����0�ɪ�ܨȫשg�����s�b
	Zone14_PE01_Var["GlobalDeBuffID"]={	508965,	--�L�v�����p��
						508966,	--�@�O����
						508967,	--���W�[��
						509104	--�ƨg�N��
						}
	Zone14_PE01_Var["NPCBuffID"] = {	508960,	--���]
						508961,	--�d�A���߸�
						508962,	--�Ҽ{���H
						508963,	--�ȫץ����U��
						508964	--�ȫץ���
						}
	Zone14_PE01_Var["MapID"] = 418
	Zone14_PE01_Var["Friend"] = { 	105338,	--�_�I��--PID:140101
					105423,	--�ⶤ
					105424,	--���g�窺
					105425,
					105426,	--���g�窺
					105427
					}
	Zone14_PE01_Var["Enemy"] = {	105339,	--����--PID:140102
					105580,
					105581,
					105582
					}

	Zone14_PE01_Var["PowerFriend"] = {}		--
	Zone14_PE01_Var["PowerEnemy"]={}		--
	Zone14_PE01_Var["PowerBoss"] = 0
	Zone14_PE01_Var["GlobalCtrl"] = 0	--���줤����
	Zone14_PE01_Var["NPCGroup"] = {}		--��ܸs��(�_�I��+����)
	Zone14_PE01_Var["TrashNPC"] = {}
end

function Lua_Zone14_PE01_PESet()--PE�\��
	local PE_Name = "SC_PE_ZONE14_01_NAME"					-- ���~�止���Z�\�w��a
	local PE_Desc = "SC_PE_ZONE14_01_DESC"					-- �b�Q��ŧ���h��a��A�Z�\�w�p�����إߤF�{�ɩʪ����I�A�b�@���٫ܷW�ê��ɭԡA�ȤH�̦A���³o�Ӿ��I�i�}�����A�øչϷm�ܪ���I
	local PEIndex = Zone14_PE01_PEIndex
	local PHIndex = Zone14_PE01_PHIndex
	local TestID = 1
	PE_AddPE( PE_Name, PE_Desc, PEIndex , 0 ) 				-- �s�W�@�Өƥ�
	PE_AddRegion( PEIndex , Zone14_PE01_Var["MapID"] )							-- ��PE��i��ڤ���
	PE_AddRegion( PEIndex , TestID )						-- ��PE��i���հ�

	local PH_Name = {	"SC_PE_ZONE14_01_PH1_NAME",	--��񪺨ȫץ���
						"SC_PE_ZONE14_01_PH2_NAME"	--�ȫץ����O�w���Ȫ��߸����@�A�ժ����e��ˡA�b�ԯ����ȶi��t���}�a......
					}

	local PH_Desc = {	"SC_PE_ZONE14_01_PH1_DESC",--�t�鬤��
						"SC_PE_ZONE14_01_PH2_DESC"--��������L���_�I�̵o�{�o�Ǳ��p�A�Ϥh����쥴���A�M�ȫץ�������ܥu��b�t�a�̶i��......
					}
	local PE_FactorName = {	"SC_PE_ZONE14_01_FA1_NAME",	--����ȫץ���
					"SC_PE_ZONE14_01_FA2_NAME"	--�ȫץ����k��
					}
	local PE_FactorDesc = {		"SC_PE_ZONE14_01_FA1_DESC",	--�Q�n�ȫץ����L�k�o���v�T�O�A�N��������X�L�{�b�����ˬO����C
					"SC_PE_ZONE14_01_FA2_DESC"	--�ȫץ������M�ȮɱѰh�A���O���i�s�����եΤ��F�L�Ӧh���ɶ��C
					}
	--DebugMsg( 0,0,PHIndex[1].." and "..PHIndex[2] )
	PE_AddPhase( PEIndex , PHIndex[1] , PH_Name[1], PH_Desc[1], 0 , 1 , 1 , 0 )
	PE_AddPhase( PEIndex , PHIndex[2] , PH_Name[2], PH_Desc[2], 0 , 1 , 1 , 0 )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[1], PHIndex[1], PE_FactorName[1], PE_FactorDesc[1], "" , 0, 1,  true )
	PE_PH_AddObjective_Greater( PEIndex , PHIndex[2], PHIndex[2], PE_FactorName[1], PE_FactorDesc[1], "" , 0, 1,  true )
	PE_OB_SetVisible( PEIndex, PHIndex[1], PHIndex[1], false )
	PE_OB_SetVisible( PEIndex, PHIndex[2], PHIndex[2], false )
	PE_SetScoreVisible( PEIndex, false )--����ܿn��
	PE_SetCallBackOnPlayerEnter (PEIndex, "Lua_Zone14_PE01_Enter" )--�i�J�ϰ�
	PE_SetCallBackOnPlayerLeave( PEIndex, "Lua_Zone14_PE01_Leave" )--���}�ϰ�
	PE_Start( PEIndex , PHIndex[1] )-- �ƥ�Ұ�
end

function Lua_Zone14_PE01_Enter( PEIndex , Player )
	DebugMsg(0,0,GetName(Player).."("..Player..")".." Enter "..PEIndex );
	--ScriptMessage( Player,Player,0,GetName(Player).."("..Player..")".." Enter "..PEIndex , 0 );
	--ChangeZone( Player, ReadRoleValue(Player,EM_RoleValue_ZoneID) ,1, kg_GetPos(Player) );
	if Zone14_PE01_Phase ==1 and Zone14_PE01_Var["PowerBoss"]~=0 then
		AddBuff( Player, Zone14_PE01_Var["GlobalDeBuffID"][ Zone14_PE01_Var["CurrentDeBuff"] ],0,-1)
	end
end

function Lua_Zone14_PE01_Leave( PEIndex ,Player )
	DebugMsg(0,0,GetName(Player).."("..Player..")".." Leave "..PEIndex );
	--ScriptMessage( Player,Player,0,GetName(Player).."("..Player..")".." Leave "..PEIndex , 0 );
	--ChangeZone( Player, ReadRoleValue(Player,EM_RoleValue_ZoneID) ,0, kg_GetPos(Player) );
	local Buff=Zone14_PE01_Var["GlobalDeBuffID"]
	for i in pairs(Buff) do
		CancelBuff(Player,Buff[i])
	end
end

function Lua_Zone14_PE01_JumpPhase( Phase )
	local PEIndex = Zone14_PE01_PEIndex
	local PHIndex = Zone14_PE01_PHIndex
	DebugMsg(0,0,"PEIndex = "..PEIndex.." ,PHIndex= "..PHIndex[Phase] )
	PE_JumpToPhase( PEIndex, PHIndex[Phase] )
	Zone14_PE01_Phase = Phase
	DebugMsg(0,0,"JumpPhase_"..Phase)
end

-------------------------------Controller Initialization--------------------------------------------
function Lua_Zone14_PE01_GloabalCtrl()
	Sleep(60)
	local Ctrl = OwnerID()
	kg_CtrlInit(Ctrl)
	Zone14_PE01_Var["GlobalCtrl"] = Ctrl
	kg_Zone14_PE01_RandPowerBuff( Zone14_PE01_PowerNPClimit )
	local CurrentDeBuff = Zone14_PE01_Var["CurrentDeBuff"]
	CallPlot( Ctrl,"Lua_Zone14_PE01_GloabalCtrl_CheckAllPowerNPC" , Ctrl )
	while 1 do
		if Zone14_PE01_Phase==1 and Zone14_PE01_Var["PowerBoss"]~=0 then
			CurrentDeBuff = Zone14_PE01_Var["CurrentDeBuff"]+1
			if CurrentDeBuff>3 then CurrentDeBuff=1 end
			kg_Zone14_PE01_ChangeDebuff( CurrentDeBuff )
		end
		Sleep(3000)--������=3000
	end
end

function Lua_Zone14_PE01_GloabalCtrl_CheckAllPowerNPC( Ctrl )--�@�w�ɶ��ˬd�øɥR��ɤ�NPC
	while 1 do
		Sleep(300)
		--DebugMsg(0,0,"Check AllPowerNPC...")
		Lua_Zone14_PE01_CheckAllPowerNPC(0)
		Lua_Zone14_PE01_CheckAllPowerNPC(1)
		if Zone14_PE01_Phase==1  then
			Lua_Zone14_PE01_CheckAllPowerNPC(2)
		end
	end
end

function Lua_Zone14_PE01_CheckAllPowerNPC( Type )--�ˬd����NPC�øɦ�  0:�_�I�� 1:����  2:Boss
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local PowerNPClimit = Zone14_PE01_PowerNPClimit
	if PowerNPClimit>=table.getn(NPCGroup) then PowerNPClimit=table.getn(NPCGroup) end
	if Type ==0 then
		if table.getn(PowerFriend)<PowerNPClimit then
			local Amount = PowerNPClimit-table.getn(PowerFriend)--�ʪ��ƶq
			for i=1 , Amount do
				kg_Zone14_PE01_SinglePowerBuff( Type )
			end
		else
			--DebugMsg(0,0,"enough PowerFriend")
		end
	elseif Type ==1 then
		if table.getn(PowerEnemy)<PowerNPClimit then
			local Amount = PowerNPClimit-table.getn(PowerEnemy)--�ʪ��ƶq
			for i=1 , Amount do
				kg_Zone14_PE01_SinglePowerBuff( Type )
			end
		else
			--DebugMsg(0,0,"enough PowerEnemy")
		end
	elseif Type ==2 then
		if PowerBoss==0 then
			kg_Zone14_PE01_SinglePowerBuff( Type )
		else
			--DebugMsg(0,0,"PowerBoss Still Exist")
		end
	end
end

function Lua_Zone14_PE01_GloabalCtrl_JumpPhase2( Boss )
		Lua_Zone14_PE01_JumpPhase( 2 )
		kg_Zone14_PE01_ChangeDebuff( 0 )--�M�����W�Ҧ�Buff
		--���ͨȫשg��
		Sleep(200)
		Lua_Zone14_PE01_JumpPhase( 1 )
		Zone14_PE01_Var["BossFail"]=0
end

function Lua_Zone14_PE01_GroupCtrl()
	--Lua_Zone14_PE01_GlobalSet()
	--Sleep(20)
	Debuglog(2,"Lua_Zone14_PE01_GroupCtrl Start....")
	local Ctrl = OwnerID()
	kg_CtrlInit(Ctrl)
	WriteRoleValue( Ctrl , EM_RoleValue_Register2 , 0 )--�O�_���j�O�_�I��
	WriteRoleValue( Ctrl , EM_RoleValue_Register3 , 0 )--�O�_���j�O����
	WriteRoleValue( Ctrl , EM_RoleValue_Register4 , 0 )--�O�_��Boss
	local PID  = ReadRoleValue(Ctrl,EM_RoleValue_PID)
	local FlagID = tonumber(string.sub(PID,1,6))
	local StartNum = tonumber(string.sub(PID,-2,-1))
	WriteRoleValue( Ctrl , EM_RoleValue_Register5 , FlagID )--FlagID
	WriteRoleValue( Ctrl , EM_RoleValue_Register6 , StartNum )--���|�_�l�s��(�f�V)
	local EnemyID = Zone14_PE01_Var["Enemy"][math.random( table.getn(Zone14_PE01_Var["Enemy"]) ) ]--�üƧ�ID
	local FriendID = Zone14_PE01_Var["Friend"][math.random( table.getn(Zone14_PE01_Var["Friend"]) ) ]--�üƧ�ID
	local RoomID = ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local TempGroup = SearchRangeNPC( Ctrl , 100 )	--�������j���d��
	local Group = {}
	Group["Ctrl"]=Ctrl
	Group["RefObj"]={}--�ѦҪ���(��NPC�Ϊ��ѦҮy��)
	Group["Enemy"]={}--����
	Group["Friend"]={}--�_�I��
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupNum =0
	if  NPCGroup[1]==nil then
		GroupNum=1
	else
		GroupNum = table.getn(NPCGroup)+1
	end
	Zone14_PE01_Var["NPCGroup"][GroupNum]=Group--���d��
	WriteRoleValue( Ctrl , EM_RoleValue_Register1 , GroupNum )
	for i in pairs(TempGroup) do
		if ReadRoleValue( TempGroup[i],EM_RoleValue_OrgID )==105340 then		--NPC�����I
			table.insert(Group["RefObj"] , TempGroup[i])
			WriteRoleValue(TempGroup[i] ,EM_RoleValue_Register1,GroupNum)
			WriteRoleValue(TempGroup[i] ,EM_RoleValue_Register2,Ctrl)--�N�������O�bNPC�����I��reg1
		end
	end
	local RefObj =  Group["RefObj"]
	local RefObjCount =table.getn(RefObj)
	if RefObjCount%2==0 then	--�ѦҪ��󬰰���
		for i=1,RefObjCount/2 do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 1 )
		end
		for i=1+RefObjCount/2 , RefObjCount do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 0 )
		end
	else	--�ѦҪ���D���ơA������_�I�̦h�@��
		local middleNum = math.ceil( RefObjCount/2 )
		for i=1,middleNum do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 1 )
		end
		for i=1+middleNum , RefObjCount do
			Lua_Zone14_PE01_ReBornNPC( RefObj[i] , 0 )
		end
	end
	--NPCGroup[GroupNum]=Group
	--DebugMsg(0,0,"GroupNum = "..GroupNum)
	BeginPlot(Ctrl,"Lua_Zone14_PE01_GCtrlMain",0)
	BeginPlot(Ctrl,"Lua_Zone14_PE01_GroupTalk",1)
end

function Lua_Zone14_PE01_GroupTalk()--�s�զ۰ʲ��--SC_PE_ZONE14_01_NPCTALK01
	local Ctrl =OwnerID()
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Ctrl,EM_RoleValue_Register1)]
	local TalkString = { 	"[SC_PE_ZONE14_01_NPCTALK01]",
				"[SC_PE_ZONE14_01_NPCTALK02]",
				"[SC_PE_ZONE14_01_NPCTALK03]",
				"[SC_PE_ZONE14_01_NPCTALK04]",
				"[SC_PE_ZONE14_01_NPCTALK05]",
				"[SC_PE_ZONE14_01_NPCTALK06]",
				"[SC_PE_ZONE14_01_NPCTALK07]",
				"[SC_PE_ZONE14_01_NPCTALK08]",
				"[SC_PE_ZONE14_01_NPCTALK09]",
				"[SC_PE_ZONE14_01_NPCTALK10]", }
	local Turn = 1--�ӭ��Ӹs�ջ���
	local RandPick = 0
	local FriendCount = 0
	local EnemyCount =0
	while 1 do
		FriendCount = table.getn( Group["Friend"] )
		EnemyCount = table.getn(Group["Enemy"])
		if Turn==0 then--�_�I�̻���
			if FriendCount>0 and EnemyCount>0 then
				RandPick = math.random( table.getn( Group["Friend"]) )
				if ReadRoleValue(Group["Friend"][RandPick],EM_RoleValue_Register8)==0 and ReadRoleValue(Group["Friend"][RandPick],EM_RoleValue_Register7)==0 then
					PlayMotion( Group["Friend"][RandPick] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					Say( Group["Friend"][RandPick] , TalkString[kg_Rand(1,5)] )
				end
				Turn=1
			end
		else--��������
			if FriendCount>0 and EnemyCount>0 then
				RandPick = math.random( table.getn( Group["Enemy"]) )
				if ReadRoleValue(Group["Enemy"][RandPick],EM_RoleValue_Register8)==0  then
					PlayMotion( Group["Enemy"][RandPick] , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
					Say( Group["Enemy"][RandPick] , TalkString[kg_Rand(6,10)] )
				end
				Turn=0
			end
		end
		Sleep(50)
	end
end

function Lua_Zone14_PE01_GCtrlMain()
	local Ctrl = OwnerID()
	--Say(Ctrl,"MainStart..")
	local Group = Zone14_PE01_Var["NPCGroup"][ReadRoleValue(Ctrl,EM_RoleValue_Register1)]
	local BuffID = Zone14_PE01_Var["NPCBuffID"]
	local timer = 0
	while 1 do
		Sleep(50)--�C5����|
		timer =timer+5
		local FriendBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register2)--0:�@��_�I��  1:��ɯ�
		local EnemyBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register3)--0:�@����� 1:�U��
		local BossBuff = ReadRoleValue(Ctrl,EM_RoleValue_Register4)
		if table.getn(Group["Enemy"])>0 then--������
			if table.getn(Group["Friend"])>0 then--���_�I��
				--DebugMsg(0,0,"Timer= "..timer.." Sec")
				for i in pairs( Group["Friend"] ) do
					if EnemyBuff==0 and BossBuff==0 then--����u������
						if CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and timer%10==0  and FriendBuff ==0 then--�D��ɯū_�I��
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and FriendBuff ==1 and timer%20==0 then--�s�դ�����ɯū_�I��
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						end
					elseif EnemyBuff==1 and BossBuff==0 then--����u���U��
						if CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and timer%5==0  and FriendBuff ==0 then--�D��ɯū_�I��,�C5��+1
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])~=TRUE and FriendBuff ==1 and timer%10==0 then--�s�դ�����ɯū_�I��,�C10��+1
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						elseif CheckBuff(Group["Friend"][i],BuffID[2])==TRUE and  timer%10==0 then--�����O��ɯū_�I��
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 1 )
						end
					elseif BossBuff==1 then--���񦳨ȫץ���
						if  timer%10==0 then
							Lua_Zone14_PE01_AddDeBuff( Group["Friend"][i] , BuffID[1] , 3 )
						end
					end
				end
				if Lua_Zone14_PE01_CheckFriendState( Group["Friend"]  )==TRUE and timer%10==0 then--�s�դ����_�I�̪��|�[�i�׽w�C
					for i in pairs(Group["Enemy"]) do
						Lua_Zone14_PE01_AddDeBuff(Group["Enemy"][i],BuffID[3],1)
					end
					for i in pairs( Group["Friend"] ) do	--�H���_�I�̥u�Q���@�����] �N���������|�[�{�Hbuff
						WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register10 , ReadRoleValue( Group["Friend"][i] , EM_RoleValue_Register9 ) )
					end
				end
			else	--�s�դ��������S�_�I��
				if timer%10==0 then
					for i in pairs( Group["Enemy"] ) do
						if ReadRoleValue( Group["Enemy"][i] , EM_RoleValue_Register10 )==0 then--���a�S�����\���A
							Lua_Zone14_PE01_AddDeBuff( Group["Enemy"][i] , BuffID[3] , 1 )
						end
					end
				end
			end
		else	--�s�դ��S�������A�M���Ҧ��_�I��buff
			for i in pairs( Group["Friend"] ) do
				CancelBuff(Group["Friend"][i] , 508960 )
				WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register9 , 0 )
				WriteRoleValue( Group["Friend"][i] , EM_RoleValue_Register10 , 0 )
			end
		end
		if timer==20 then timer=0 end--�C20���k�s
	end
end

function Lua_Zone14_PE01_CheckFriendState( FriendGroup )--�ˬd�_�I�̸s�դ������]���p
	--DebugMsg(0,0,"CheckFriendState...")
	for i in pairs(FriendGroup) do
		local CurrentLV = ReadRoleValue(FriendGroup[i],EM_RoleValue_Register9)
		local BasicLV = ReadRoleValue(FriendGroup[i],EM_RoleValue_Register10)
		if CurrentLV<BasicLV  then
			--DebugMsg(0,0,"CheckFriendState OK..".." CurrentLV = "..CurrentLV.." ,BasicLV = "..BasicLV )
			return TRUE
		elseif CheckBuff(FriendGroup[i] ,508970)==TRUE then
			--DebugMsg(0,0,"Target have 508970...")
			return TRUE
		else
			--DebugMsg(0,0,"CheckFriendStateFail..".." CurrentLV = "..CurrentLV.." ,BasicLV = "..BasicLV )
		end
	end
	return FALSE
end

function Lua_Zone14_PE01_AddDeBuff( Obj , BuffID , AddLV )--�W�[debuff
	local BuffLevel = 0
	local NPCBuffID = Zone14_PE01_Var["NPCBuffID"]
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local Ctrl = ReadRoleValue(Obj,EM_RoleValue_Register2)
	if Zone14_PE01_Var["CurrentDeBuff"]==1 and PID==140101 then--�Ҧ��������]�t��+1
		BuffLevel = BuffLevel+AddLV+1
	else
		BuffLevel = BuffLevel +AddLV
	end
	if PID==140101 and CheckBuff(Ctrl,509093)==TRUE then--���������y�b���ŭ��C
		BuffLevel = BuffLevel-KS_CheckBuffLV(Ctrl,509093)
		if BuffLevel<=0 then BuffLevel=1 end
	end
	if PID==140101 and CheckBuff(Obj,509103)==TRUE then --�C��������]��1
		BuffLevel = BuffLevel-1
		if BuffLevel<0 then BuffLevel=0 end
		--DebugMsg(0,0,"CheckBuff 509103 Success,BuffLevel = "..BuffLevel )
	end
	--Say(Obj,"AddBuffLevel = "..BuffLevel)
	if PID==140101 and CheckBuff(Obj,508970)~=TRUE then	----���]����
		if BuffLevel>0 then
			AddBuff(Obj,BuffID,BuffLevel-1,-1)
			local CurrentBuffLevel = BuffLevel + ReadRoleValue(Obj ,EM_RoleValue_Register9 )
			WriteRoleValue(Obj,EM_RoleValue_Register9,CurrentBuffLevel )--������e���]��
			local BasicBuffLevel = BuffLevel + ReadRoleValue(Obj ,EM_RoleValue_Register10 )
			WriteRoleValue(Obj,EM_RoleValue_Register10 ,BasicBuffLevel )--�����򥻵��]��
			--Say( Obj ,"My CurrentDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register9) )
			--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		elseif BuffLevel==0 then	--����]���ųQ����0���ܡA�򥻼h�ƭn�W�[
			local BasicBuffLevel = ReadRoleValue(Obj ,EM_RoleValue_Register10 )+1
			WriteRoleValue(Obj,EM_RoleValue_Register10 ,BasicBuffLevel )--�����򥻵��]��
			--Say( Obj ,"My CurrentDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register9) )
			--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		end
	elseif PID == 140102 then
		AddBuff(Obj,BuffID,BuffLevel-1,-1)
		--Say( Obj ,"My CurrentDeBuffLv = "..KS_CheckBuffLV( Obj, NPCBuffID[3] ) )
	elseif PID==140101 and CheckBuff(Obj,508970)==TRUE  then
		--Say( Obj ,"My BasicDeBuffLv = "..ReadRoleValue(Obj,EM_RoleValue_Register10) )
		--Say( Obj ,"Wahahahahaha.." )
	end

	if ReadRoleValue(Obj,EM_RoleValue_Register9) >=Zone14_PE01_NpcDebuffMax[1] and PID==140101 then--�_�I��
		Lua_Zone14_PE01_NPCLeave( Obj )
	elseif KS_CheckBuffLV( Obj, NPCBuffID[3] )>=Zone14_PE01_NpcDebuffMax[2] and PID==140102 then--���� ��{�Hbuff���ŶW�L4��
		Lua_Zone14_PE01_NPCLeave( Obj )
	end
end

function Lua_Zone14_PE01_EnemyDelayLeave( Obj , DelayTime , Success )
	DelayTime = DelayTime or 1
	Success = Success or 0
	WriteRoleValue( Obj ,EM_RoleValue_Register10, Success )--�i�������L���\�F
	Sleep(DelayTime)
	Lua_Zone14_PE01_NPCLeave( Obj )
end

function Lua_Zone14_PE01_NPCLeave( Obj , GoAway , DelayTime , RebornWaitTime )	--���w�Y��NPC���W�����N����o�� �A�|�̳yPID�۰ʧP�w
	Obj = Obj or OwnerID()
	GoAway = GoAway or 1
	DelayTime = DelayTime or 30
	RebornWaitTime = RebornWaitTime or 100
	if ReadRoleValue(Obj,EM_RoleValue_Register8)==0 then

	WriteRoleValue( Obj , EM_RoleValue_Register8 , 1 )--�i�J���}���q
	local Ctrl = ReadRoleValue( Obj,EM_RoleValue_Register2 )
	local FlagID = ReadRoleValue(Ctrl,EM_RoleValue_Register5)
	local StartNum = ReadRoleValue(Ctrl,EM_RoleValue_Register6)

	if CheckBuff(Obj, Zone14_PE01_Var["NPCBuffID"][5])==TRUE and ReadRoleValue(Obj,EM_RoleValue_Register10)==0 then--�������boss��
		local BossFail = Zone14_PE01_Var["BossFail"]--Boss�Q���]������
		local BossFailMax = Zone14_PE01_BossFailMax
		BossFail = BossFail+1
		DebugMsg(0,0,"BossFail = "..BossFail )
		if Zone14_PE01_Var["CurrentDeBuff"]==2 and BossFail>=( math.ceil( (BossFailMax/2)+BossFailMax ) ) then
			--�����q�A�������W�������g��
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
			CallPlot( Zone14_PE01_Var["GlobalCtrl"] ,"Lua_Zone14_PE01_GloabalCtrl_JumpPhase2",Obj )
		elseif  BossFail>= BossFailMax then
			--�����q�A�������W�������g��
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
			CallPlot( Zone14_PE01_Var["GlobalCtrl"] ,"Lua_Zone14_PE01_GloabalCtrl_JumpPhase2",Obj )
		else
			Zone14_PE01_Var["BossFail"]=BossFail
			WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
			Zone14_PE01_Var["PowerBoss"]=0
			Zone14_PE01_Var["CurrentDeBuff"]=0
		end
	elseif CheckBuff(Obj, Zone14_PE01_Var["NPCBuffID"][5])==TRUE and ReadRoleValue(Obj,EM_RoleValue_Register10)==1 then--��Boss���\�a���}
		WriteRoleValue(Ctrl,EM_RoleValue_Register4,0)
		Zone14_PE01_Var["PowerBoss"]=0
		Zone14_PE01_Var["CurrentDeBuff"]=0
	end

	--DebugMsg(0,0,Obj.." ganna go.....")
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	local GroupID = ReadRoleValue(Obj,EM_RoleValue_Register1)
	local NPCBuffID = Zone14_PE01_Var["NPCBuffID"]
	local BuffID = {}
	BuffID[140101]=NPCBuffID[2]
	BuffID[140102]=NPCBuffID[4]
	local Group = {}
	if PID==140101 then
		Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]
	elseif PID==140102 then
		Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
	end
	--DebugMsg(0,0,"GroupMemberCount = "..table.getn(Group) )
	for i in pairs(Group) do
		if Group[i]==Obj then
			if CheckBuff( Obj, BuffID[PID] )==TRUE then--�d�A���߸� or �ȫץ����U��
				local Ctrl = ReadRoleValue( Obj,EM_RoleValue_Register2 )
				if PID == 140101 then
					WriteRoleValue(Ctrl,EM_RoleValue_Register2,0)--������ɯū_�I��
					local PowerFriend = Zone14_PE01_Var["PowerFriend"]
					--DebugMsg(0,0,"PowerFriendNum = "..table.getn(Zone14_PE01_Var["PowerFriend"] ) )
					for i in pairs( PowerFriend ) do
						if Obj==PowerFriend[i] then
							table.remove(PowerFriend ,i )
							--DebugMsg(0,0,"PowerFriendNum = "..table.getn(Zone14_PE01_Var["PowerFriend"] ) )
							break
						end
					end
				elseif PID == 140102 then
					WriteRoleValue(Ctrl,EM_RoleValue_Register3,0)--�����U�����
					local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
					--DebugMsg(0,0,"PowerEnemyNum = "..table.getn(Zone14_PE01_Var["PowerEnemy"] ) )
					for i in pairs( PowerEnemy ) do
						if Obj==PowerEnemy[i] then
							table.remove(PowerEnemy ,i )
							--DebugMsg(0,0,"PowerEnemyNum = "..table.getn(Zone14_PE01_Var["PowerEnemy"] ) )
							break
						end
					end
				end
			end
			if PID == 140101 and table.getn( Group)==1 and ReadRoleValue(Obj,EM_RoleValue_Register9)>=Zone14_PE01_NpcDebuffMax[1] then
				--�_�I�̸s�եu�Ѥ@��ӥB�O���]�W�L30��
				--DebugMsg(0,0,"Enemy Success and Leave..." )
				local EnemyGroup = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
				for i in pairs(EnemyGroup) do
					CallPlot( EnemyGroup[i] , "Lua_Zone14_PE01_EnemyDelayLeave" , EnemyGroup[i] , 50 , 1 )
				end
			end
			table.insert(Zone14_PE01_Var["TrashNPC"],Obj)
			table.remove(Group ,i )
			break
		end
	end
	--DebugMsg(0,0,"Group_"..GroupID.."_FriendNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]) )
	--DebugMsg(0,0,"Group_"..GroupID.."_EnemyNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]) )
	if PID==140102 and ReadRoleValue(Obj,EM_RoleValue_Register10)==0 then
		SysCastSpellLv(Obj,Obj,497254,0)--��d��k�N���������N�����a��o�����{
	end
	if GoAway==1 then	--�M�w�n�Ψ����٬O�ζǰe��
		CallPlot( Obj , "Lua_Zone14_PE01_GoAway" , Obj  , FlagID , StartNum )
	else
		CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",DelayTime  , RebornWaitTime )
	end

	else DebugMsg(0,0,Obj.." Already Leave...") end
end

function Lua_Zone14_PE01_GoAway( Obj , FlagID , StartNum )
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)
	WriteRoleValue(Obj,EM_RoleValue_IsWalk, 0 )	--�Ψ�������
	local Step = StartNum
	local Goal = 0
	Sleep( kg_Rand(1,15) )--�H�����ݤ@�q�ɶ��A�קKNPC���|���|
	Say( Obj,"[SC_PE_ZONE14_01_TALK26]".."......" )
	while 1 do
		if Step>=Goal  then
			if DW_CheckDis( Obj, FlagID, step , 60 ) == true and Step>Goal then
				Step = Step -1
			elseif Step==Goal and  DW_CheckDis( Obj, FlagID, step , 30 ) == true  then
				if PID==140101 then
					WriteRoleValue(Obj,EM_RoleValue_Register6,1)--�����w������~
					break
				elseif PID==140102 then
					CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3������,10��᭫��
					break
				end
			else
				KS_Move( Obj, 10 , FlagID , Step )
			end
		end
		Sleep(10)
	end
	------------------�_�I�̥t�~����----------------------
	if PID==140101 then
		--Say(Obj,"Outside..")
		FlagID = 780915
		Step = 0
		Goal = GetMoveFlagCount( FlagID )-1
		while 1 do
			if Step<=Goal  and CheckBuff(Obj,508960)==true then
				if DW_CheckDis( Obj, FlagID, step , 60 ) == true and Step<Goal then
					Step = Step +1
				elseif Step==Goal and  DW_CheckDis( Obj, FlagID, step , 30 ) == true  then
					CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3������,10��᭫��
					break
				else
					KS_Move( Obj, 10 , FlagID , Step )
				end
			elseif CheckBuff(Obj,508960)~=true then
				CallPlot(Obj,"Lua_Zone14_PE01_DelAndReborn",1 , 50 )--3������,10��᭫��
				break
			end
			Sleep(10)
		end
	end
end

function Lua_Zone14_PE01_ReBornNPC( RefObj , Type ,DelayTime )--�̳y�ѦҪ��󲣥�NPC 0�_�I�� 1����
	if DelayTime~=nil then
		if DelayTime>0 then
			Sleep(DelayTime)
		end
	end
	local GroupID = ReadRoleValue(RefObj,EM_RoleValue_Register1)
	local Ctrl = ReadRoleValue(RefObj,EM_RoleValue_Register2)
	local EnemyID = Zone14_PE01_Var["Enemy"][math.random( table.getn(Zone14_PE01_Var["Enemy"]) ) ]--�üƧ�ID
	local FriendID = Zone14_PE01_Var["Friend"][math.random( table.getn(Zone14_PE01_Var["Friend"]) ) ]--�üƧ�ID
	local RoomID = ReadRoleValue(RefObj,EM_RoleValue_RoomID)
	if Type ==0 then
		local Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]
		local newFriend = kg_GetPos( RefObj , FriendID )
		kg_ActorInit( newFriend )
		WriteRoleValue(newFriend,EM_RoleValue_Register1,GroupID)
		WriteRoleValue(newFriend,EM_RoleValue_Register2,Ctrl)
		WriteRoleValue(newFriend,EM_RoleValue_Register3,RefObj)
		WriteRoleValue(RefObj,EM_RoleValue_Register3,newFriend)
		WriteRoleValue(newFriend,EM_RoleValue_Register6,0)--�w���X���~
		WriteRoleValue(newFriend,EM_RoleValue_Register7,0)--���b�P���a��ܤ�
		WriteRoleValue(newFriend,EM_RoleValue_Register8,0)--�w�i�J���}���q
		WriteRoleValue(newFriend,EM_RoleValue_Register9,0)--��ڵ��]��
		WriteRoleValue(newFriend,EM_RoleValue_Register10,0)--�򥻵��]��
		WriteRoleValue(newFriend,EM_RoleValue_PID,140101)
		AddToPartition(newFriend,RoomID)
		table.insert(Group,newFriend)
		--DebugMsg(0,0,"Group_"..GroupID.."_FriendNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Friend"]) )
	elseif Type==1 then
		local Group = Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]
		local newEnemy = kg_GetPos( RefObj , EnemyID )
		kg_ActorInit( newEnemy )
		WriteRoleValue(newEnemy,EM_RoleValue_Register1,GroupID)
		WriteRoleValue(newEnemy,EM_RoleValue_Register2,Ctrl)
		WriteRoleValue(newEnemy,EM_RoleValue_Register3,RefObj)
		WriteRoleValue(RefObj,EM_RoleValue_Register3,newEnemy)
		WriteRoleValue(newEnemy,EM_RoleValue_Register8,0)--�w�i�J���}���q
		WriteRoleValue(newEnemy,EM_RoleValue_Register10,0)--���b�_�I�̦��\
		WriteRoleValue(newEnemy,EM_RoleValue_PID,140102)
		AddToPartition(newEnemy,RoomID)
		table.insert(Group,newEnemy)
		--DebugMsg(0,0,"Group_"..GroupID.."_EnemyNum = "..table.getn(Zone14_PE01_Var["NPCGroup"][GroupID]["Enemy"]) )
	end
	Debuglog(2,"Lua_Zone14_PE01_ReBornNPC End ".."Type="..Type )
end

---------------------------------function----------------------------------------
function Lua_Zone14_PE01_DelNPC(Type )--�R����ܸs��:0����1����2�_�I��
	Zone14_PE01_Var["PowerFriend"] = {}
	Zone14_PE01_Var["PowerEnemy"]={}
	Zone14_PE01_Var["PowerBoss"] = 0
	Zone14_PE01_Var["CurrentDeBuff"]=0
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	for i in pairs(NPCGroup) do
		local Group = NPCGroup[i]
		if Type==0 then
			for j in pairs(Group["Enemy"] ) do
				if Group["Enemy"][j]~=nil then
					DelObj(Group["Enemy"][j])
				end
			end
			Group["Enemy"]={}
			for j in pairs(Group["Friend"] ) do
				if Group["Friend"][j]~=nil then
					DelObj(Group["Friend"][j])
				end
			end
			Group["Friend"]={}
		elseif Type==1 then
			for j in pairs(Group["Enemy"] ) do
				if Group["Enemy"][j]~=nil then
					DelObj(Group["Enemy"][j])
				end
			end
			Group["Enemy"]={}
		elseif Type==2 then
			for j in pairs(Group["Friend"] ) do
				if Group["Friend"][j]~=nil then
					DelObj(Group["Friend"][j])
				end
			end
			Group["Friend"]={}
		end
	end
	for j in pairs(Zone14_PE01_Var["TrashNPC"]) do
		if Zone14_PE01_Var["TrashNPC"][j]~=nil then
			DelObj(Zone14_PE01_Var["TrashNPC"][j])
		end
	end
	Zone14_PE01_Var["TrashNPC"]={}
end

function kg_Zone14_PE01_PrintGroup()--�L�X���s�ժ�����
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	if NPCGroup[1]~=nil then
		DebugMsg(0,0,"===============���j�u===================")
		DebugMsg(0,0,"There are "..table.getn(NPCGroup).." Groups.")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			DebugMsg(0,0,"Ctrl_"..z.." = "..Group["Ctrl"])
			for i in pairs(Group["RefObj"] ) do
				DebugMsg(0,0,"RefObj_"..i.." = "..Group["RefObj"][i] )
			end
			for j in pairs(Group["Enemy"] ) do
				DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
			end
			for k in pairs(Group["Friend"] ) do
				DebugMsg(0,0,"Friend_"..k.." = "..Group["Friend"][k] )
			end
		end
	else
		DebugMsg(0,0,"Group==nil  !!")
	end
end

function kg_Zone14_PE01_GetCtrlGroup()--��s�դ������ϥΡA�L�X�Ӥ��������s�զ���
	DebugMsg(0,0,"===============���j�u===================")
	local Ctrl = OwnerID()
	local GroupID = ReadRoleValue(Ctrl,EM_RoleValue_Register1)
	local Group = Zone14_PE01_Var["NPCGroup"][GroupID]
	DebugMsg(0,0,"Ctrl = "..Group["Ctrl"] )
	for i in pairs(Group["RefObj"] ) do
		DebugMsg(0,0,"RefObj_"..i.." = "..Group["RefObj"][i] )
	end
	for j in pairs(Group["Enemy"] ) do
		DebugMsg(0,0,"Enemy_"..j.." = "..Group["Enemy"][j] )
	end
	for k in pairs(Group["Friend"] ) do
		DebugMsg(0,0,"Friend_"..k.." = "..Group["Friend"][k] )
	end
end

function kg_Zone14_PE01_ChangeDebuff( CurrentDeBuff )--�ߨ�������ϰ�debuff
	Zone14_PE01_Var["CurrentDeBuff"] = CurrentDeBuff--�j����w�����ܼ�
	local DeBuff = Zone14_PE01_Var["GlobalDeBuffID"]
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local PE_PlayerCount = PE_GetActivePlayerGUIDCount(Zone14_PE01_PEIndex)
	if CurrentDeBuff==1 then	--������Τ@�Udebuff
		--DebugMsg(0,0,"AddBuff �L�v�����p��")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do
				AddBuff(Group["Enemy"][i],DeBuff[4],0,-1)--�ƨg�N��
			end
		end
		if PE_PlayerCount>0 then--��Ҧ����a�WDebuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)--�L�v�����p��
			end
		end
	elseif CurrentDeBuff==2 then
		--DebugMsg(0,0,"AddBuff �@�O����")
		for z in pairs(NPCGroup) do	--����������debuff
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--��Ҧ����a�WDebuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)
			end
		end
	elseif CurrentDeBuff==3 then
		--DebugMsg(0,0,"AddBuff ���W�[��")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do	--����������debuff
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--��Ҧ����a�WDebuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
				AddBuff(Player,DeBuff[CurrentDeBuff],0,-1)
			end
		end
	elseif CurrentDeBuff==0 then
		--DebugMsg(0,0,"�M���Ҧ�Debuff")
		for z in pairs(NPCGroup) do
			local Group = NPCGroup[z]
			for i in pairs(Group["Enemy"]) do	--����������debuff
				CancelBuff(Group["Enemy"][i],DeBuff[1])
			end
		end
		if PE_PlayerCount>0 then--��Ҧ����a�M��debuff
			for i=1,PE_PlayerCount do
				local Player = PE_GetActivePlayerGUID(Zone14_PE01_PEIndex)
				for i in pairs(DeBuff) do
					CancelBuff(Player,DeBuff[i])
				end
			end
		end
	end
end

function kg_Zone14_PE01_SinglePowerBuff( Type )--�ɥR�@���ɯ�NPC : 0�_�I��,1����,2Boss
	Type = Type or 0
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupCount = table.getn( NPCGroup )
	local NPCBuff = Zone14_PE01_Var["NPCBuffID"]
	local Group = {}
	local randArray = {}
	if Type==0 then
		for i=1 , GroupCount do
			local FriendNum = table.getn(NPCGroup[i]["Friend"])
			if ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register2 )==0 and FriendNum>0 then--��X�S���_�I�̪��s��
				table.insert( randArray,i)
			end
		end
		if table.getn(randArray)>0 then
			local randNum = randArray[math.random( table.getn(randArray) ) ]
			Group = NPCGroup[randNum]
			randNum =math.random( table.getn(Group["Friend"]) )
			local PowerFriend = Group["Friend"][randNum]
			WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register2,1)
			AddBuff(PowerFriend,NPCBuff[2],0,-1)
			table.insert( Zone14_PE01_Var["PowerFriend"],PowerFriend )
			--DebugMsg(0,0,"PowerFriend Born")
		else
			--DebugMsg(0,0,"No More PowerFriend")
		end
	elseif Type ==1 then
		for i=1 , GroupCount do
			local EnemyNum = table.getn(NPCGroup[i]["Enemy"])
			if ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register3 )==0 and ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register4 )==0 and EnemyNum>0 then--��X�S���U�⪺�s��
				table.insert( randArray,i)
			end
		end
		if table.getn(randArray)>0 then
			local randNum = randArray[math.random( table.getn(randArray) ) ]
			Group = NPCGroup[randNum]
			randNum =math.random( table.getn(Group["Enemy"]) )
			local PowerEnemy = Group["Enemy"][randNum]
			WriteRoleValue( Group["Ctrl"] ,EM_RoleValue_Register3,1 )
			AddBuff(PowerEnemy,NPCBuff[4],0,-1)
			table.insert( Zone14_PE01_Var["PowerEnemy"] , PowerEnemy )
			--DebugMsg(0,0,"PowerEnemy Born")
		else
			--DebugMsg(0,0,"No More PowerEnemy")
		end
	elseif Type == 2 and Zone14_PE01_Phase==1 then
		for i=1 , GroupCount do
			local EnemyNum = table.getn(NPCGroup[i]["Enemy"])
			if EnemyNum>0 then--��X���������s��
				--DebugMsg(0,0,"Group_"..i.." have "..EnemyNum.." Enemys")
				if EnemyNum==1 and ReadRoleValue( NPCGroup[i]["Ctrl"],EM_RoleValue_Register3 )==1  then--���U��ŧ����B�����u���@��ɤ��H�ư�
					--
				else
					table.insert( randArray,i)
					--DebugMsg(0,0,"Insert Group_"..i )
				end
			end
		end
		if table.getn(randArray)>0 then
			local randNum = 0
			if table.getn(randArray)==1 then
				randNum =1
			else
				 randNum = randArray[math.random( table.getn(randArray) ) ]
			end
			--DebugMsg(0,0,"randNum = "..randNum)
			Group = NPCGroup[randNum]
			local PowerBoss = 0
			for i in pairs(Group["Enemy"]) do
				if CheckBuff( Group["Enemy"][i] , NPCBuff[4] )~=TRUE then
					 PowerBoss = Group["Enemy"][i]
					break
				end
			end
			WriteRoleValue( Group["Ctrl"] ,EM_RoleValue_Register4,1 )
			AddBuff(PowerBoss,NPCBuff[5],0,-1)
			Zone14_PE01_Var["PowerBoss"] = PowerBoss
			kg_Zone14_PE01_ChangeDebuff( 1 )--Boss�@�X�{�N��s����debuff
			--DebugMsg(0,0,"Boss Born")
		else
			--DebugMsg(0,0,"BossBornFail... no more Enemy")
		end
	elseif Type == 2 and Zone14_PE01_Phase==2 then
		--DebugMsg(0,0,"PE1401_Phase=2 , You can't add Boss")
	end
end

function kg_Zone14_PE01_RandPowerBuff( Amount )--�H������s�ղ��ͻ�ɯū_�I�̻P�����A�ȥ��T�w�C�Ӹs�ճ����_�I�̻P����
	local NPCGroup = Zone14_PE01_Var["NPCGroup"]
	local GroupCount = table.getn( NPCGroup )
	if Amount>GroupCount then Amount = GroupCount end	--����s�ժ��ƶq�j����w���ƶq��
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	local PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	local NPCBuff = Zone14_PE01_Var["NPCBuffID"]
	------------------------�M���{������ɯ�NPC------------------------
	if CheckID(PowerBoss)==TRUE then
		--DebugMsg(0,0,"PowerBoss Clear")
		CancelBuff( PowerBoss,NPCBuff[5] )
		local ParentCtrl = ReadRoleValue(PowerBoss,EM_RoleValue_Register2)
		WriteRoleValue(ParentCtrl,EM_RoleValue_Register4,0)
		Zone14_PE01_Var["PowerBoss"]=0
		Zone14_PE01_Var["CurrentDeBuff"]=0
	end
	if PowerFriend[1]~=nil then
		--DebugMsg(0,0,"PowerFriend Clear")
		for i in pairs(PowerFriend) do
			CancelBuff( PowerFriend[i],NPCBuff[2] )
			local ParentCtrl = ReadRoleValue(PowerFriend[i],EM_RoleValue_Register2)
			WriteRoleValue(ParentCtrl,EM_RoleValue_Register2,0)
		end
		Zone14_PE01_Var["PowerFriend"] = {}
	end
	if PowerEnemy[1]~=nil then
		--DebugMsg(0,0,"PowerEnemy Clear")
		for i in pairs(PowerEnemy) do
			CancelBuff( PowerEnemy[i],NPCBuff[4] )
			local ParentCtrl = ReadRoleValue(PowerEnemy[i],EM_RoleValue_Register2)
			WriteRoleValue(ParentCtrl,EM_RoleValue_Register3,0)
		end
		Zone14_PE01_Var["PowerEnemy"] = {}
	end

	-------------------------------------�H������------------------------------------------
	local randArray = {}	-- { 1,2,3.......�o��PE����ܸs�ռƶq }
	for i=1 , GroupCount do
		randArray[i]=i
	end
	local randNumber=0
	local Group={}
	for i=1 , Amount do
		randNumber = math.random( table.getn(randArray) )--�H�����@�s��
		table.remove(randArray,randNumber)
		Group = NPCGroup[randNumber]
		randNumber = math.random(table.getn(Group["Enemy"]))--�H����Ӹs�ժ�����
		PowerEnemy = Group["Enemy"][randNumber]
		WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register3,1)
		AddBuff(PowerEnemy,NPCBuff[4],0,-1)
		table.insert( Zone14_PE01_Var["PowerEnemy"],PowerEnemy )
		--DebugMsg(0,0,"PowerEnemy Born")
	end

	kg_Zone14_PE01_SinglePowerBuff(2)
	-------------------------------------�H���_�I��------------------------------------------
	randArray = {}
	for i=1 , GroupCount do
		randArray[i]=i
	end
	for i=1 , Amount do
		randNumber = math.random( table.getn(randArray) )--�H�����@�s��
		table.remove(randArray,randNumber)
		Group = NPCGroup[randNumber]
		randNumber = math.random(table.getn(Group["Friend"]))--�H����Ӹs�ժ��_�I��
		PowerFriend = Group["Friend"][randNumber]
		WriteRoleValue(Group["Ctrl"] ,EM_RoleValue_Register2,1)
		AddBuff(PowerFriend,NPCBuff[2],0,-1)
		table.insert( Zone14_PE01_Var["PowerFriend"],PowerFriend )
		--DebugMsg(0,0,"PowerFriend Born")
	end
end

function kg_Zone14_PE01_PrintPowerNPC()--�L�X�Ҧ����S���ɯ�NPC
	local PowerBoss = Zone14_PE01_Var["PowerBoss"]
	DebugMsg(0,0,"PowerBoss= "..PowerBoss )
	Say(PowerBoss,"PowerBoss!")
	local PowerFriend = Zone14_PE01_Var["PowerFriend"]
	if PowerFriend[1]~=nil then
		for i in pairs(PowerFriend) do
			DebugMsg(0,0,"PowerFriend= "..PowerFriend[i] )
			Say(PowerFriend[i],"PowerFriend!")
		end
	else
		DebugMsg(0,0,"No PowerFriend" )
	end
	local  PowerEnemy = Zone14_PE01_Var["PowerEnemy"]
	if PowerEnemy[1]~=nil then
		for i in pairs(PowerEnemy) do
			DebugMsg(0,0,"PowerEnemy= "..PowerEnemy[i] )
			Say(PowerEnemy[i],"PowerEnemy!")
		end
	else
		DebugMsg(0,0,"No PowerEnemy" )
	end
end