
-------------------------------------------------------------------------
function LuaS_102387_0()--�Z������PQ�D�y�{���
-------------------------------------------------------------------------
--�����ܼƱ��
	ZonePQ_ValueGroup_Drama[1] = 0
	Step = 1			--���q����	��l��1
	BackDoor = 0			--���ժ����
	StepDownNumber = 1	--�O�_�s��
--��l�T�w��
	local CountDown = 0		--�˼ƭp�ɾ�
	local Initial = 0		--��l�ƼаO
	local Crevice = {}		--�ĤG���q���_�Ű}�C
	local Boss = {}			--�ĤT���q�Ѥ�
	local SeeA = 0			--�ƺ�������
	local XYZ = {769,300,617}	--�ƺ�����������m
	local Yuris = 0			--�ר��h
	local RandArray = {}		--�H���X�{
	local RandFull = 0
	local later = {}			--�����ɶ�
	local NowTime = {}		--�w�i��ɶ�

--��l�ܤƳ]�w��
	local StepOneCD = 120			--���q�@���˼Ʈɶ��G120
	local StepIII = {102408,102409,102410}	--���q�T���Ǫ��W��
	local StepFourCD = 180			--���q�|���˼Ʈɶ��G180
	local early = {}			--�_�l�ɶ�
	early[1] = GetSystime(2)		
	early[2] = GetSystime(1)
	early[3] = GetSystime(4)
	early[4] = GetSystime(3)
--���q�G�ϥ���X	780088
--���q�T�ϥ���X	780089
--�ר��h����m	780090
--�ר��h�x����i���u	780091
--�ק�ɶ�����Ӧa��ݭn�ק�

	CallPlot( OwnerID(), "LuaS_102387_ClearGarbage", 0 )--�j��˩U��

	while	true	do
		sleep(10)
--���q�@�G�c�ګe�����R
		if	Step == 1	then
--���q�@��l��
			if	Initial == 0	then
				Initial = 1
				CountDown = StepOneCD
			end
--���q�@����������G�˼Ʀ�0
			if	CountDown == 0	then
				Step = 2
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
			else
				CountDown = CountDown - 1
				if	math.fmod(CountDown,15) == 0	and
					CountDown ~= 0			then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_25]"..CountDown , C_Yellow   )
				end
			end
		end

--���q�G�G�²M���_
		if	Step == 2	then
--���q�G��l��
				if	Initial == 0	then
					Initial = 1
					CountDown = 30
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_26]" , C_Yellow   )
--�b�w�w��m���͵��_	����@��
					for i=1,GetMoveFlagCount(780088)-1,1	do
						Crevice[i] = Lua_DW_CreateObj("flag",113335,780088,i)
						SetPlot(Crevice[i],"dead","LuaS_102387_8",0)
						BeginPlot(Crevice[i],"LuaS_102387_6",0)
--��������
						DisableQuest(Crevice[i],true)
						SetRoleCamp(Crevice[i],"Monster")
					end
--�ר��h�n����t
					Yuris = Lua_DW_CreateObj("flag",113339,780090,1,0)
					SetRoleCamp(Yuris,"Visitor")
					AddToPartition(Yuris,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
					BeginPlot(Yuris,"LuaS_102387_12",0)
				end
--�ˬd�Ҧ������_���A(�i���ˬd)
				ZonePQ_ValueGroup_Drama[1] = 0
				RandArray = {}
				for i=1,table.getn(Crevice),1 do
					if	ReadRoleValue(Crevice[i],EM_RoleValue_HP) < ReadRoleValue(Crevice[i],EM_RoleValue_MaxHP)	then
						ZonePQ_ValueGroup_Drama[1] = ZonePQ_ValueGroup_Drama[1] + 1
--�N��í�w�����_���X�_��
						table.insert(RandArray,table.getn(RandArray)+1,Crevice[i])
					end
				end
--�C30��i��@���i�׶׳�
				if	math.fmod(CountDown,30) == 0	then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_21]"..ZonePQ_ValueGroup_Drama[1].."/"..GetMoveFlagCount(780088)-1 , C_Yellow   )
--DebugMsg(0,0,"CountDown="..CountDown)
				end
--�C30�� �Y�O��6�ӥH�W�����_�D�챱��
--�h�H����ܤ@�Ӧ^�_í�w���A �äW�L�Ī��A�Q��
--�V���񪺪��a�s�����i��_���T��
				RandFull = 0
				if	CountDown == 4	and
					table.getn(RandArray) > 5	then
					RandFull = DW_Rand(table.getn(RandArray))
--DebugMsg(0,0,"RandFull="..RandFull)
					AddBuff(RandArray[RandFull],502921,1,-1)
					WriteRoleValue(	RandArray[RandFull],	EM_RoleValue_HP,	ReadRoleValue(RandArray[RandFull],EM_RoleValue_MaxHP) )
					ScriptMessage( RandArray[RandFull] , 0 , 0 , "[SC_102387_23]" , C_Yellow   )
				end
			
			if	CountDown == -1	then
				CountDown = 29
			else
				CountDown = CountDown - 1
			end

--���q�G����������G�ϰ챱����P�X�м�
			if	ZonePQ_ValueGroup_Drama[1] == GetMoveFlagCount(780088)-1	or
				BackDoor == 1	then
--�N������O���m
				BackDoor = 0
				for i=1,table.getn(Crevice),1	do
--�}�Ҥ���	���ܰ}��	���s�㹳
					CancelBuff(Crevice[i],504081) --�����^��
					DisableQuest(Crevice[i],false)
					SetRoleCamp(Crevice[i],"Visitor")
					Hide(Crevice[i])
					sleep(10)
					Show(Crevice[i],0)
				end
--�j�M�a�Ϥ��Ҧ���npc
				local Count = SetSearchAllNPC(0)
				local NPC = {}
				for i = 1 , Count do
					NPC[i] = GetSearchResult()
				end
--�p�G�o�{�a���̩άO�Q�гy�X�Ӫ�����		�R��!
				for i = 1,table.getn(NPC),1 do
					if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102405	or
						ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102406	or
						ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102407	then
						if	ReadRoleValue(NPC[i],EM_RoleValue_HP)>=ReadRoleValue(NPC[i],EM_RoleValue_MaxHP)	then
							DelObj(NPC[i])
						end
					end
				end
--���m�ܼ�
				Step = 3
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_20]" , C_Yellow   )
			end
		end
--�ĤT���q�G�`�h�c��
		if	Step == 3	then
--���q�T��l��
			if	Initial == 0	then
				sleep(20)
				Initial = 1
--�ƺ��������X��	�a�_�x��
				SeeA = Lua_DW_CreateObj("xyz",102387,XYZ,1,93)
				SetFightMode(SeeA,0,0,0,0)
				BeginPlot(SeeA,"LuaI_102387_FireAround",0)
--�x���ɶ�
				LuaS_102387_1()
				sleep(15)
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_11]" , C_Yellow   )
				CountDown = StepFourCD
--���ͤ��ũǪ� 780089 1~3 
				for i = 1,table.getn(StepIII),1	do
					Boss[i] = Lua_DW_CreateObj("flag",StepIII[i],780089,i)
--�H���`�@���P�ϰ챱����q
					SetPlot(Boss[i],"dead","LuaS_102387_5",0)
				end
			end
--���q�T����������G�ϰ챱����P�}�C�j�p
			if	ZonePQ_ValueGroup_Drama[1] == table.getn(StepIII)	then
--���q�T����
--�T�{�O�_�g�L8�p�� OR ���\�S��
--�O�U�������q���ɶ�	�ñN�ƭȰe��B��
				later[1] = GetSystime(2)		
				later[2] = GetSystime(1)
				later[3] = GetSystime(4)
				later[4] = GetSystime(3)
				NowTime = DW_TimeCount(later,early)
				if	(NowTime[2] >= 8	or	NowTime[3] > 0	or	NowTime[4] > 0)	or
					StepDownNumber	== 1	then
--�ɶ���F
--���q�i�� ���m�ܼ�
					Step = 4
					Initial = 0
					ZonePQ_ValueGroup_Drama[1] = 0
				else
--�������i�J�̲׶��q���n�D �Ӧ^��Ĥ@���q
					Step = 1
					Initial = 0
--���m����t�@���G�ƺ������������h	�R���ƺ�������
					sleep(20)
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_28]" , C_Red )
					DelObj(SeeA)
--�R�����W�٬��۪��@�ɤ��ŵ׭^
					for i=1,table.getn(Boss),1 do
						if	CheckID(Boss[i])	and
							ReadRoleValue(Boss[i],EM_RoleValue_IsDead)==0	then
							DelObj(Boss[i])
						end
					end
--�R�����_
					for i=1,table.getn(Crevice),1	do
						DelObj(Crevice[i])
					end
--�R���ר��h�����H��
					DelObj(Yuris)
					LuaS_102387_14()
				end
			end
--���q�T�����ѱ���G�˼ƶW�L
			if	CountDown == 0	then
				Step = 1
				Initial = 0
--���Ѫ���t�@���G�ƺ����������J��	�R���ƺ�������
				sleep(20)
				ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_12]" , C_Red )
				DelObj(SeeA)
--�R�����W�����ŵ׭^
				for i=1,table.getn(Boss),1 do
					if	CheckID(Boss[i])	then
						DelObj(Boss[i])
					end
				end
--�R�����_
				for i=1,table.getn(Crevice),1	do
					DelObj(Crevice[i])
				end
--�R���ר��h�����H��
				DelObj(Yuris)
				LuaS_102387_14()
			else
--����˼�
				CountDown = CountDown - 1
--�C30��i��@���׳�
				if	math.fmod(CountDown,30)==0	and
					CountDown ~= 0			then
					ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_24]"..CountDown , C_Yellow   )
				end
			end
		end

--�ĥ|���q�G�w�h�Q��
		if	Step == 4	then
--���q�|�G��l��
			if	Initial == 0	then
				Initial = 1
				sleep(20)
--���ƺ����������ͦw�h�Q��
				CallPlot(SeeA,"LuaI_102387_0",Yuris)
			end
--���q�|����������G�ƺ�����������
			if	not CheckID(SeeA)	then
--�p�G�w�h�Q���Ա�	�O����ɪ��ɶ�
				if	StepDownNumber == 0 	then
					early[1] = GetSystime(2)		
					early[2] = GetSystime(1)
					early[3] = GetSystime(4)
					early[4] = GetSystime(3)
				end
--���m���q�y�{
				Step = 1
				Initial = 0
				ZonePQ_ValueGroup_Drama[1] = 0
--�R�����_
				for i=1,table.getn(Crevice),1	do
					DelObj(Crevice[i])
				end
--�R���ר��h�����H��
				DelObj(Yuris)
				LuaS_102387_14()
			end
		end
--�P�_�ɶ��O�_�g�L8�p�� �O�_�w�B�z�L�H
		later[1] = GetSystime(2)
		later[2] = GetSystime(1)
		later[3] = GetSystime(4)
		later[4] = GetSystime(3)
		NowTime = DW_TimeCount(later,early)
		if	(NowTime[2] >= 8	or	NowTime[3] > 0	or	NowTime[4] > 0)	and
			(CheckID(SeeA) == false	or	Step == 3)					and
			StepDownNumber == 0								then
			StepDownNumber = 1
--��ܶ]���O
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsg( OwnerID() , 2, "[SC_102387_27]")
			end
		end
	end
--DebugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"ZonePQ_ValueGroup_Drama="..ZonePQ_ValueGroup_Drama[1].."##CountDown="..CountDown.."##Step="..Step)
end


-------------------------------------------------------------------------
function LuaS_102387_1()--�ƺ����������}���Ũ�
-------------------------------------------------------------------------
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_7]"   , C_Red   )
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_8]"   , C_Red   )
	sleep(25)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_9]"   , C_Red   )
	sleep(30)
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_10]"   , C_Red   )
	return true
end
-------------------------------------------------------------------------
function LuaS_102387_2()--���_����ܼ@��
-------------------------------------------------------------------------
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102387_13]","LuaS_102387_3",0)
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102387_14]","LuaS_102387_4",0)
end
-------------------------------------------------------------------------
function LuaS_102387_3() --�ǰe��c�ڼs��
-------------------------------------------------------------------------
	ChangeZone( OwnerID(), 208 , 0 ,300,180,200, 330 )
end

-------------------------------------------------------------------------
function LuaS_102387_4() --�ǰe�X�ƥ�
-------------------------------------------------------------------------
	local Obj = OwnerID()
	if	CheckBuff(Obj,508902)==true	then
		CancelBuff_NoEvent(Obj,508902)
	end
	ChangeZone( Obj, 2 , 0 ,2700,60,-1000, 235 )
end
-------------------------------------------------------------------------
function LuaS_102387_5() -- �ĤT���q�Ѥ������`�@��
-------------------------------------------------------------------------
	if	Step == 3	then
	ZonePQ_ValueGroup_Drama[1] = ZonePQ_ValueGroup_Drama[1] + 1
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_102387_22]"..ZonePQ_ValueGroup_Drama[1].."/".."3" , C_Yellow   )
	end
	return true
end
-------------------------------------------------------------------------
function LuaS_102387_6()--�ĤG���q���X�Ǽ@��
-------------------------------------------------------------------------
	local Mob = {102405,102406,102407}--�ĤG���q���p�ǦC��
	local Now = {}
	local Initial = 0
	local Sec = 11
	local RePort = 1
	local ShowMsg = 0
	local Togather = 0
--�ĤG���q�����
	while	Step == 2	do
		sleep(10)
		if	Initial == 0 	then
			Initial = 1
--���]�԰����A(���i�԰�)
			SetFightMode(OwnerID(),0,0,0,0)
--�T�w�ɶ���_	����۰ʦ^��
			AddBuff(OwnerID(),504081,1,-1)
			AddBuff(OwnerID(),502707,1,-1)	
		end
--���^���}�`�άO�|���إ�
--�B�����媬�A
		while	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0			and
			ReadRoleValue(OwnerID(),EM_RoleValue_HP)>=ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)	do

			if	Sec > 10	then
				Sec = 0
				if	ShowMsg == 1	then
					ScriptMessage( OwnerID() , 0 , 0 , "[SC_102387_19]" , C_Yellow   )
				end
--�����L�Ī��A
--�إ��@��
				if	CheckBuff(OwnerID(),502921)	then
					CancelBuff(OwnerID(),502921)
				end
				for i = 1,table.getn(Mob),1	do
					Now[i] = Lua_DW_CreateObj("obj",Mob[i],OwnerID())
					WriteRoleValue(Now[i],EM_RoleValue_PID,OwnerID())
--�p�ⲣ�X�`��
					WriteRoleValue(OwnerID(),EM_RoleValue_PID,ReadRoleValue(OwnerID(),EM_RoleValue_PID)+1)
					SetPlot(Now[i],"dead","LuaS_102387_10",0)
					BeginPlot(Now[i],"LuaS_102387_9",0)
				end
			else
				Sec = Sec + 1
			end
			break
		end
--�Ǫ�����������
		if	RePort == 0	and
			ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0	then
			RePort = 1
			ShowMsg = 1
			ScriptMessage( OwnerID() , 0 , 0 , "[SC_102387_18]", C_Yellow )
		end
--�Y�O�٦��Ʀs���Ǫ�
--�N�w�Ƽs�����ȳ]�w
--�ˬd�O�_�ݭn�ҵo�s�ʾ���
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) ~= 0	then
			RePort = 0
			if	Togather == 0		then
--�T�{�O�_���H�i�J�԰�
--�Y�i�J�԰� ���ܳs�ʪ��A
--�O����e�԰��ؼ�
				for i=1,table.getn(Now),1 do
					if	CheckID(Now[i])	then
						if	HateListCount( Now[i]) > 0	then
							Togather = ReadRoleValue(Now[i],EM_RoleValue_AttackTargetID)
--DeBugMSG(0,0,"ID:"..Now[i].."  ##Togather:"..Togather)
							break
						end
					end
				end
--�N�԰��ؼжǵ���L���i�J�԰������
--��M �e���O�ӳ��|�s
				if	Togather ~= 0		then
					for i=1,table.getn(Now),1 do
						if	CheckID(Now[i])	then
							if	HateListCount( Now[i])==0	then
								SetAttack(Now[i],Togather)
							end
						end
					end
				end
			else
--�s�ʪ��A�U
--�T�{�O�_�T�������}�԰�
--�����}�԰����� �����s�ʪ��A
				for i=1,table.getn(Now),1 do
					if	CheckID(Now[i])	then
						if	HateListCount( Now[i])~=0	then
							break
						end
					end
					if	i==table.getn(Now)	then
						Togather = 0
					end
				end
			end
		end

		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 0		then
--���]�԰����A(�i�԰�)
			SetFightMode(OwnerID(),0,0,0,1)
		else
--���]�԰����A(���i�԰�)
			SetFightMode(OwnerID(),0,0,0,0)
		end
	end
end


-------------------------------------------------------------------------
function LuaS_102387_7() --���եΫ�� �ΥH�q�L�ĤG���q
-------------------------------------------------------------------------
	BackDoor = 1
end

-------------------------------------------------------------------------
function LuaS_102387_8() --���q�G���_�����`�@��
-------------------------------------------------------------------------
--���|���`
	return false
end


-------------------------------------------------------------------------
function LuaS_102387_9() --���_���ͪ��T������  ����l�Ƽ@��
-------------------------------------------------------------------------
	local Num
	local Sec = 0
--Ū�����_���� ��X���_����m
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--�����԰�
	SetFightMode(OwnerID(),0,1,0,0)
--�P�_�ۤv������
	for i = 1,GetMoveFlagCount(780088),1	do
		if	DW_CheckDis(OwnerID(),780088,i,50)	then	
			Num = i
		end
	end
--�üƲ���
	DW_MoveToFlag(OwnerID(),780088,Num,60,1)
--�}�Ҿ԰�
	SetFightMode(OwnerID(),1,1,0,1)
	while true do
		sleep(20)
--�Y�O���}�԰���
--�Z�����_�W�L�@�w����
--�R���ۤv
		if	HateListCount( OwnerID())==0	then
			Sec = Sec + 2
			if	CheckDistance(OwnerID(),Master,100)==false	and
				Sec > 14						then
				WriteRoleValue(Master,EM_RoleValue_PID,	ReadRoleValue(Master,EM_RoleValue_PID)-1 )
				DelObj(OwnerID())
			end
		else
			Sec = 0
		end
	end
end

-------------------------------------------------------------------------
function LuaS_102387_10() --���q�G�Ǫ����`�@��
-------------------------------------------------------------------------
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	WriteRoleValue(Master,EM_RoleValue_PID,	ReadRoleValue(Master,EM_RoleValue_PID)-1	)
	return true
end

-------------------------------------------------------------------------
function LuaS_102387_11() -- �}�μ@��
-------------------------------------------------------------------------
	local dis = 12
	local count = 7 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 8 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 5  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 0  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,-3)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,-2)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(102411,Matrix,1,2)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,-3)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,-2)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(102411,Matrix,2,2)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,-3)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,-2)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,1)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(102411,Matrix,3,2)
--���ݤר��h�V��
	sleep(40)
	for i = 1,table.getn(ObjMatrix),1 do
		AddBuff(ObjMatrix[i],504093,1,-1)
	end

	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

	LuaFunc_ResetMatrix( ReviveTime , Matrix)
end

-------------------------------------------------------------------------
function LuaS_102387_12() -- �ר��h����t�@��
-------------------------------------------------------------------------
--�a���̤���{�� ����Q���X ���঳�Y����
	local Soldier = 0--�ר��h���N�ӭ�
	Soldier = Lua_DW_CreateObj("flag",102280,780090,2,0)
	SetModeEx(Soldier,EM_SetModeType_Show,false)
	SetModeEx(Soldier,EM_SetModeType_Mark,false)
	SetModeEx(Soldier,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Soldier,EM_SetModeType_NotShowHPMP,false)
	AddToPartition( Soldier , ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) )
	WriteRoleValue(Soldier,EM_RoleValue_IsWalk,1)
--�즸�]�w
--����}��
	BeginPlot(Soldier,"LuaS_102387_11",0)
--�t��
	sleep(10)
	Say(OwnerID(),"[SC_102387_15]") -- �ƺ����������b�}�a�ڭ̩ҷR���a��I
	sleep(20)
	Say(OwnerID(),"[SC_102387_16]") -- �ڭ̵��藍�������ӴݧԪ��c�]�o�x�I
	sleep(10)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
	Say(OwnerID(),"[SC_102387_17]") --���F�aģ�I�^�i���Ԥh�̡I
	
--�����
	BeginPlot(Soldier,"LuaS_102387_13",0)
	while true do
--����20��
		for	i=1,20,1	do
			sleep(10)
		end
--���ݱa�YNPC�^�쨭��
--�^�Ӥ���ߨ���X�j��i�J�U�Ӷ��q
		while	not CheckDistance( OwnerID(), Soldier,100 )	do
			sleep(10)
		end
		sleep(200)
--����}��
		BeginPlot(Soldier,"LuaS_102387_11",0)
--�t��
		sleep(10)
		Say(OwnerID(),"[SC_102387_15]") -- �ƺ����������b�}�a�ڭ̩ҷR���a��I
		sleep(20)
		Say(OwnerID(),"[SC_102387_16]") -- �ڭ̵��藍�����o�ӴݧԪ��c�]�o�x�I
		sleep(10)
		PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_POINT)
		Say(OwnerID(),"[SC_102387_17]") -- �X�o�I�^�i���Ԥh�̡I
--�����
		BeginPlot(Soldier,"LuaS_102387_13",0)
	end
end


-------------------------------------------------------------------------
function LuaS_102387_13() -- �a���̪����ʼ@��
-------------------------------------------------------------------------
	MoveToFlagEnabled(OwnerID(),false)
	local NPC = {}
	local Flag = 1
	while true do
--�^����I�ɨ����o�q�j�骺����
--�z�L�P�_�X�Ъ��Z���ӧP�_�O�_�^����I
		if	flag >= 2	then
			if	DW_CheckDis(OwnerID(),780090,2,30)	then
				return
			end
		end
		sleep(20)
		if	flag >= 2	then
			if	DW_CheckDis(OwnerID(),780090,2,30)	then
				return
			end
		end
--�����P�ۤv�b�@�w�d�򤺴N�N��L�̤w�g��W�}�B
--�ҥH�~���L���U�@�I�e�i
		NPC = SearchRangeNPC(OwnerID(),60)
		for i = 0,table.getn(NPC)-1,1 do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102411	then
				Flag = Flag + 1
				if	Flag > GetMoveFlagCount(780091)-1	then
					return
				end
				LuaFunc_MoveToFlag( OwnerID(), 780091 , Flag , 0 )
				break
			end
		end
		NPC = {}
	end
end

-------------------------------------------------------------------------
function LuaS_102387_14()--�R���a���̩M�h�L
-------------------------------------------------------------------------
--�j�M�a�Ϥ��Ҧ���npc
	local Count = SetSearchAllNPC(0)
	local NPC = {}
	for i = 1 , Count do
		NPC[i] = GetSearchResult()
	end
--�p�G�o�{�a���̩άO�Q�гy�X�Ӫ�����		�R��!
	for i = 1,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102280	then
			DelObj(NPC[i])
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 102411	then
			DelObj(NPC[i])
		end
	end
end

-------------------------------------------------------------------------
function LuaS_102387_15()--�J�f�d��@��
-------------------------------------------------------------------------
--�]�w�d��@��
	SetPlot(OwnerID(),"range","LuaS_102387_16",60)
end

-------------------------------------------------------------------------
function LuaS_102387_16()--�J�f�d��@������
-------------------------------------------------------------------------
--�ˬd�O�_�w��buff
	if	not	CheckBuff(OwnerID(),504111)		then
--�O�_�w�F��s�����ɶ��H
		if	StepDownNumber == 1	then
--�q�X�T��
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_102387_31]",C_Red)
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_102387_31]",C_Red)
--�\�W�L���@���ѧO
			AddBuff(OwnerID(),504111,1,-1)
		end
	end
end


------------------------------------------------------------------------------
function LuaS_102387_17() -- ���h�^��buff
------------------------------------------------------------------------------
	CancelBuff(ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID),504081)
end

function LuaS_102387_ClearGarbage()--�j��˩U��
	while true do
		sleep(600)
		collectgarbage("collect")
	end
end