
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW11() --�b�����������W���檺�@��
-----------------------------------------------------------------------------------------------
--�ϥκX�l 780023 �s�� 1���~��all(�p�x�X�{����m)
--�ϥκX�l 780082 �s�� 1(�������ʪ����|)
--�ϥκX�l 780083 �s�� 1(�������ʪ����|)
--�ϥκX�l 780084 �s�� 1(�������ʪ����|)
--�ϥκX�l 780085 �s�� 1(�������ʪ����|)
--�ϥκX�l 780086 �s�� 1(�������ʪ����|)
--�ϥκX�l 780082 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780083 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780084 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780085 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780086 �s�� 1���~��all(�p�x���ʪ����|)

--�ϥκX�l 780184 �s�� 1(�����e���z�}�����Ϊ���)
--�ϥκX�l 780185 �s�� 1(�����e���z�}�����Ϊ���)
--�ϥκX�l 780186 �s�� 1(�����e���z�}�����Ϊ���)
--�ϥκX�l 780187 �s�� 1(�����e���z�}�����Ϊ���)
--�ϥκX�l 780188 �s�� 1(�����e���z�}�����Ϊ���)
--�ϥκX�l 780184 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780185 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780186 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780187 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780188 �s�� 1���~��all(�D�H�X�{����m)
	local MapID = 731
	local Humen = {}
	local HumenCount = 6
	local HumenRand = {102817,102818}
	local Snake = {}
	local SnakeCount = 6
	local SnakeRand = {102514,102529,102530,102531}


--�̷ӺX�l���Ͳ��ͬ�������
--�}�C�üƲ��ͨk�k����
	for i=1,HumenCount,1 do
		Humen[i] = Lua_DW_CreateObj("flag",HumenRand[DW_Rand(table.getn(HumenRand))],780023,i+1)
		WriteRoleValue(Humen[i],EM_RoleValue_IsWalk,0)
		BeginPlot(Humen[i],"LuaPE_9_1_DW12",0)
		Hide(Humen[i])
	end
	sleep(10)
	for i=1,HumenCount,1 do
		Show(Humen[i],0)
	end
	sleep(15)
	local j=1
--�j��I�I
--����5�����j��  �������@�@�}�a5���I
--�����j��N���q����
	while j<9 do
--�e���Ъ���
--�N�����s���O�JPID
--�e���Ъ��и��N�O�̷�PID�s���e��
		for i=1,table.getn(Humen),1 do
			if	CheckID(Humen[i])	then
				WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
				CallPlot(Humen[i],"LuaPE_9_1_DW14",780082+(j-1)/2)
			end
		end
		DW_MoveToFlag( OwnerID() , 780082+(j-1)/2 , 1 , 0 , 1  )
		sleep(10)
--��F�}�a�I
--�P�_�O�_�n�إ߳D�H���x(�D�H�����q���`�ƶq�n����10)
--�X�Ъ��إߤ@�w�n�h1��(����ϥΦP�@��)
--�D�H���x����������
		local Pass = true
		if	PE_Zone9_1_Global_1 < 10	then
			for i=1,SnakeCount,1 do
				Snake[i] = Lua_DW_CreateObj("flag",SnakeRand[DW_Rand(table.getn(SnakeRand))],780184+(j-1)/2,i+1)
				WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
				Hide(Snake[i])
				Show(Snake[i],0)
				SetAttack(Snake[i],OwnerID())
			end
			sleep(10)
--�T���G�D�H���X�F���x�i�}�I���I�����L�̡I  SC_PE_9_1_13
			DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_13]",C_Red,MapID)
		else
			Pass = false
		end
--�T�{�Ҧ����D�H���w�g���`
--�Q�ΰj��ӽT�{
--id���s�b�άO�w���`����
		while	Pass	do
			sleep(10)
			for i=1,table.getn(Snake),1 do
				if	CheckID(Snake[i])	then
					if	ReadRoleValue(Snake[i],EM_RoleValue_IsDead)==0	then
						break
					end
				end
				if	i==table.getn(Snake)	then
					Pass = false
				end
			end
		end
		PE_Zone9_1_Global_1 = 0
		sleep(5)
		Pass = true
		local AllPlayer = {}
		local AllPlayerNum
		while Pass do
			sleep(10)
--�������Ϊ��Ъ���
			local book = Lua_DW_CreateObj("flag",112399,780184+(j-1)/2,1,0)
			SetModeEx(book,EM_SetModeType_Mark,false) 
			SetModeEx(book,EM_SetModeType_ShowRoleHead,false) 
			AddToPartition(book,0)
			if	HateListCount( OwnerID()) == 0 then
--�����A�Ũ��h
--�ۤU
--���_���^��
				SetFightMode(OwnerID(),0,1,0,0 )
				FaceObj( OwnerID(), book )
				sleep(20)
				PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
				sleep(20)
				PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
				BeginPlot(book,"LuaPE_9_1_DW15",0)
				DW_MoveToFlag( OwnerID() , 780082+(j-1)/2 , 1 , 0 , 1  )
				Pass = false
				sleep(20)
				SetFightMode(OwnerID(),1,1,0,1 )
--�j�M�Ҧ������a
--�u�n�s�b��Ԩ�&������
--�������ȧ����X��
				AllPlayerNum = SetSearchAllPlayer(0)
				for k=1,AllPlayerNum,1 do
					AllPlayer[k] = GetSearchResult()
					if	DW_CheckMap(AllPlayer[k],MapID)	and
						ReadRoleValue(AllPlayer[k],EM_RoleValue_IsDead)==0	then
						SetFlag(AllPlayer[k],543564+(j-1)/2,1)
					end
				end
--�H���o��
			end
		end
		WriteRoleValue(OwnerID(),EM_RoleValue_Register2,ReadRoleValue(OwnerID(),EM_RoleValue_Register2)+1)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]"..ReadRoleValue(OwnerID(),EM_RoleValue_Register2).."/".."4",C_Yellow,MapID)
		j=j+2
	end
--�ĥ|�ںX�l����
--����G�_ĵ�ܷϤ�
--�ǳƺt���i�J�ĥ|���q
	for i=1,table.getn(Humen),1 do
		if	CheckID(Humen[i])	then
			WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
			CallPlot(Humen[i],"LuaPE_9_1_DW14",780086)
		end
	end
	DW_MoveToFlag( OwnerID() , 780086 , 1 , 0 , 1  )
--�������`�N�Y�Ӥ�V(���ܭ��V)
	SetFightMode(OwnerID(),0,1,0,0 )
	SetDir( OwnerID(), 0 )
--���G�x�H�o�H��......
	Yell(OwnerID(),"[SC_PE_9_1_16]",4)
--�إ����Ϊ���G�T
--�Ϥ����۬I�k
	local XYZ = {-6226,484,29769}
	local CastFire = Lua_DW_CreateObj("xyz",112399,XYZ)
	XYZ[2] = XYZ[2]+350
	local Bomb = Lua_DW_CreateObj("xyz",112307,XYZ,0)
	SetModeEx(Bomb,EM_SetModeType_Gravity,false) 
	AddToPartition(Bomb,0)
	AddBuff(Bomb,505012,1,-1)
	CastSpell(CastFire,Bomb,494400)
--�������V�Ϥ�����m
	sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_POINT)
--���G�i�c�I[102532]�ӤF�I
	Yell(OwnerID(),"[SC_PE_9_1_17]",5)
	sleep(20)
--���G�S���Y�A�ڭ̤w�g�}�a�F�@�������x�ƪ���I���M�h�a�I
	Yell(OwnerID(),"[SC_PE_9_1_18]",5)
--5���j�駹��  �i�J�ĥ|���q
	PE_Zone9_1_GlobalStep = 4
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_31]".."4".."/".."4",C_Yellow,MapID)
	sleep(20)
--���G�Q�γD�H�����ı��@�ڭ̺M�h�I�p�ߦۤv�H�I
	Yell(OwnerID(),"[SC_PE_9_1_35]",5)
--�ϥκX�l 780205 �s�� 1(�������ʪ����|)
--�ϥκX�l 780206 �s�� 1(�������ʪ����|)
--�ϥκX�l 780207 �s�� 1(�������ʪ����|)
--�ϥκX�l 780208 �s�� 1(�������ʪ����|)
--�ϥκX�l 780209 �s�� 1(�������ʪ����|)
--�ϥκX�l 780205 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780206 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780207 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780208 �s�� 1���~��all(�p�x���ʪ����|)
--�ϥκX�l 780209 �s�� 1���~��all(�p�x���ʪ����|)

--�ϥκX�l 780214 �s�� 1(�j�j�D�H�X�{����m)
--�ϥκX�l 780215 �s�� 1(�j�j�D�H�X�{����m)
--�ϥκX�l 780216 �s�� 1(�j�j�D�H�X�{����m)
--�ϥκX�l 780217 �s�� 1(�j�j�D�H�X�{����m)
--�ϥκX�l 780218 �s�� 1(�j�j�D�H�X�{����m)
--�ϥκX�l 780214 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780215 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780216 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780217 �s�� 1���~��all(�D�H�X�{����m)
--�ϥκX�l 780218 �s�� 1���~��all(�D�H�X�{����m)

	Snake = {}
	SnakeCount = 2
	SnakeRand = {102514,102529,102530,102531}
--�i�J�k�]�j��
	j=1
	while J<11 do
--�����٦s���������e���U���I
		for i=1,table.getn(Humen),1 do
			if	CheckID(Humen[i])	then
--�����q���ᤣ�|�A�^��
				AddBuff(Humen[i],502707,1,-1)
				WriteRoleValue(Humen[i],EM_RoleValue_PID,i+1)
				WriteRoleValue(Humen[i],EM_RoleValue_Register1,780205+(j-1)/2)
				WriteRoleValue(Humen[i],EM_RoleValue_Register2,0)
				if	j==1	then
					BeginPlot(Humen[i],"LuaPE_9_1_DW17",0)
				end
			end
		end
--�ۤv�]�e���U���I
--�����q�ᤣ�|�A�^��
		AddBuff(OwnerID(),502707,1,-1)
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register1,780205+(j-1)/2)
		WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
		if	j==1	then
DeBugMSG(0,0,"Captain GoGoGo !!!")
			SetFightMode(OwnerID(),0,1,0,1 )
			BeginPlot(OwnerID(),"LuaPE_9_1_DW17",0)
		end
--���q���i
		DW_AreaMessage(OwnerID(),2,"[SC_PE_9_1_27]",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_27]",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."0".."/".."1",C_Yellow,MapID)
		DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."0".."/".."1",C_Yellow,MapID)
--���ͤU�Ӹ`�I���D�H
		Snake[1] = Lua_DW_CreateObj("flag",102848,780214+(j-1)/2,1)
		for i=2,SnakeCount,1 do
			Snake[i] = Lua_DW_CreateObj("flag", SnakeRand[DW_Rand(table.getn(SnakeRand))] ,780214+(j-1)/2,i+1)
		end
		for i=1,table.getn(Snake),1 do
--��窱�A�G�]�B
			WriteRoleValue(Snake[i],EM_RoleValue_IsWalk,0)
			Hide(Snake[i])
			Show(Snake[i],0)

			MoveToFlagEnabled(Snake[i], false)
			BeginPlot(Snake[i],"LuaPE_9_1_DW42",0)
		end
--�P�_�����w�X�l�٦��h��
		while DW_CheckDis(OwnerID(),780205+(j-1)/2,1,50)==false do
			sleep(5)
		end
		sleep(5)
		j=j+2
		PE_Zone9_1_Global_1 = PE_Zone9_1_Global_1 + 1
	end
--���\��F���w����m
--�����q���\
--�t�����L�̰k��
--�Ȯɤ������
	sleep(40)
	PE_Zone9_1_GlobalStep = 5
	PE_Zone9_1_Global_1 = 0
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_33]".."1".."/".."1",C_Yellow,MapID)
--�j�M�Ҧ������a
--�u�n�s�b��Ԩ�&������
--�������ȧ����X��
	local AllPlayer = {}
	local AllPlayerNum
	AllPlayerNum = SetSearchAllPlayer(0)
	for k=1,AllPlayerNum,1 do
		AllPlayer[k] = GetSearchResult()
		if	DW_CheckMap(AllPlayer[k],MapID)	and
			ReadRoleValue(AllPlayer[k],EM_RoleValue_IsDead)==0	then
			SetFlag(AllPlayer[k],543568,1)
		end
		CancelBuff_NoEvent(AllPlayer[k],505112)
	end
	DelObj(OwnerID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW12() --�p�G���������N���Ѧۤv�R�����z��
-----------------------------------------------------------------------------------------------
	while CheckID(TargetID())==true do
		sleep(10)
	end
	if	PE_Zone9_1_GlobalStep < 4	then
		WriteRoleValue(OwnerID(),EM_RoleValue_LiveTime,12)
		sleep(120)
--�d����r�T���G�b[102816]����A���������ɯɺM�X�F��Ԩ��I   SC_PE_9_1_10
		ScriptMessage( OwnerID(), 0, 1, "[SC_PE_9_1_10]", C_Red )
	else
--�������\�k���N�i��R��
		DelObj(OwnerID())
	end
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW13()  --�����D���Ů涤�������`�@��(�ɭPPE�@�����m)
-----------------------------------------------------------------------------------------------
	local MapID = 731
--���m���q
	PE_Zone9_1_Global_1 = 0
	PE_Zone9_1_GlobalStep = 0
DeBugMSG(0,0,"PE_Zone9_1_GlobalStep="..PE_Zone9_1_GlobalStep)
--�T���G[102816]�����b������ʤ��Ԧ��ISC_PE_9_1_11
--�T���G�t�@�譱�A���]�]���H�A��o�إF�����԰����_����A�������}�F��Ԩ�...           SC_PE_9_1_12
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_34]".."1".."/".."1",C_Yellow,MapID)
	DW_AreaMessage(OwnerID(),1,"[SC_PE_9_1_11]",C_Red,MapID)
	DW_AreaMessage(OwnerID(),0,"[SC_PE_9_1_12]",C_Yellow,MapID)
	local AllPlayer = {}
	local AllPlayerNum
	AllPlayerNum = SetSearchAllPlayer(0)
	for k=1,AllPlayerNum,1 do
		AllPlayer[k] = GetSearchResult()
		CancelBuff_NoEvent(AllPlayer[k],505112)
	end
	return true
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW14(flag) --���w���ʮy��
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,99)
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DW_MoveToFlag( OwnerID() , flag , Num ,30 , 1  )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
end




-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW15() --�z���S��
-----------------------------------------------------------------------------------------------
	sleep(20)
	local Target = {114028,114030,114032,114034,114036,114037}
	local NPC = SearchRangeNPC ( OwnerID() , 300 )
	for i=0,table.getn(NPC)-1,1 do
		for j=1,table.getn(Target),1 do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==114040		then
--�P�_�n����٬O��S��
				if	ReadRoleValue(NPC[i],EM_RoleValue_PID)==113940	then
--���
					BeginPlot(NPC[i],"LuaPE_9_1_DW25",0)
				else
--��S��
					BeginPlot(NPC[i],"LuaPE_9_1_DW38",0)
				end
				break
			end
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Target[j]	then
				BeginPlot(NPC[i],"LuaPE_9_1_DW25",0)
			end
		end
	end
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW16() --�l�D�N�x�����ʱ���
-----------------------------------------------------------------------------------------------
--��窱�A�G�]�B
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--�ϥκX�l  780030 �s��all(�l�D�N�x���ު����u)
	local Flag = 1
--�����j�����
--�s�y�X�Ӧ^�j�M���Pı
	while true do
--�V�s���֪���V�j�M
--�p�G�s���w�g�֩�����ܼ� �N��j�M�L�Y
--���X �e���ֽs�����j��
		while flag > 1	do
			sleep(10)
			if	Flag <= (PE_Zone9_1_Global_1+1)*2	then
				break
			end
			Flag = Flag - 1
--			Say(OwnerID(),"PE_Zone9_1_Global_1="..PE_Zone9_1_Global_1.."###Flag="..Flag)
			DW_MoveToFlag( OwnerID() , 780030 , Flag,10 , 1  )
		end
--�V�s���h����V�j�M
--�p�G�s���w�g�j������ܼ� �N��j�M�L�Y
--���X �e���̲׽s�����j��
		while Flag <= GetMoveFlagCount(780030)-1 do
			sleep(10)
			if	Flag > (PE_Zone9_1_Global_1+1)*2	then
				break
			end
			Flag = Flag + 1
--			Say(OwnerID(),"PE_Zone9_1_Global_1="..PE_Zone9_1_Global_1.."###Flag="..Flag)
			DW_MoveToFlag( OwnerID() , 780030 , Flag,10 , 1  )
		end
--�j�鵲�� ���Y�}�l
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW17() --���a�]���԰�ai�@��
-----------------------------------------------------------------------------------------------
--��窱�A�G�]�B
	WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),0)
--��l��
	local TempID
	while true do
		sleep(10)
--�p�G���d��a���B�z
		if	HateListCount( OwnerID())==0	then
--�h���L��buff
			CancelBuff(OwnerID(),505380)
--���}����
			SetFightMode ( OwnerID(),0,1,0,1 )
--���s�o�e���ʫ��O
			if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2) == 0	then
				CallPlot(OwnerID(),"LuaPE_9_1_DW41",ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
			end
		else
--�p�G��i�J�԰�
--���_���ʪ����p
			sleep(10)
			for i=0,HateListCount( OwnerID()),1 do
				TempID = HateListInfo(OwnerID(),i, EM_HateListInfoType_GItemID)
--�p�G���H���ؼЬO�ۤv�u�ӥB�v�Z���b200�H��
				if	ReadRoleValue(TempID,EM_RoleValue_AttackTargetID)==OwnerID()	and
					CheckDistance(OwnerID(),TempID, 200)	then
					break
				end
--�p�G�Ҧ����ĤH���S���b�����ۤv
				if	HateListCount( OwnerID())==i	then
--�~�򲾰�(�p�G���A�O���U��)
--���W���������buff
--�o�e���}�԰������O
					SetFightMode ( OwnerID(),0,1,0,0 )
					AddBuff(OwnerID(),505380,9,10)
					SetStopAttack(OwnerID())
					if	ReadRoleValue(OwnerID(),EM_RoleValue_Register2) == 0	then
if	ReadRoleValue(OwnerID(),EM_RoleValue_OrgID)==102816		then
	DeBugMSG(0,0,"out Fight Mode3")
end
						if	DW_Rand(100)>50	then
							if	DW_Rand(100) > 50	then
--�x���G�ڭ̧֨S�ɶ��F�I�A�@�w�n��W�ӡI   SC_PE_9_1_19
								Say(OwnerID(),"[SC_PE_9_1_19]")
							else
--�x���G�A���藍�i�H���b�L�̤�W�Iť�M���F�ܡI  SC_PE_9_1_20
								Say(OwnerID(),"[SC_PE_9_1_20]")
							end
						end
						CallPlot(OwnerID(),"LuaPE_9_1_DW41",ReadRoleValue(OwnerID(),EM_RoleValue_Register1))
					end
				end
			end
		end
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW18() --�z��Ĳ�I�@��
-----------------------------------------------------------------------------------------------
--�����A��Ĳ�o���i��
	SetPlot(TargetID(),"touch","",0)
--�b�z���W����@��
	BeginPlot(TargetID(),"LuaPE_9_1_DW43",0)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW19() --�z��buff����U�@��
-----------------------------------------------------------------------------------------------
--�P�_���q�i���i�HĲ�o
--����buff(��Ĳ�o�k�N������)
	if	PE_Zone9_1_GlobalStep ~= 0	and
		PE_Zone9_1_GlobalStep ~= 4	and
		PE_Zone9_1_GlobalStep ~= 5	then
		CancelBuff_NoEvent(OwnerID(),505112)
		return
	end
--���ͤ��ı�(�f��)�i������
	local Powder = Lua_CreateObjByDir( OwnerID() , 102845 , 30 , 0) 
	SetPlot(Powder,"dead","LuaPE_9_1_DW21",0)
	AddToPartition(Powder,0)
	BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	BeginPlot(Powder,"LuaPE_9_1_DW20",0)
--����buff(��Ĳ�o�k�N������)
	CancelBuff_NoEvent(OwnerID(),505112)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW20() --�z���۰ʦ^���@��
-----------------------------------------------------------------------------------------------
--�ɭ����S���Q���z�|�٭�...
	sleep(200)
	if	PE_Zone9_1_GlobalStep == 0	or
		PE_Zone9_1_GlobalStep == 4	or
		PE_Zone9_1_GlobalStep == 5	then
		local Powder = Lua_DW_CreateObj("obj",113941,OwnerID())
		SetPlot(Powder,"touch","LuaPE_9_1_DW18",50)
		BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	end
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW21() --�z�����`�@��
-----------------------------------------------------------------------------------------------
--300%�����βy
--�I�k�S��
	local Ball = Lua_DW_CreateObj("obj",112307,OwnerID(),0)
	SetModeEx(Ball,EM_SetModeType_Mark,false) 
	SetModeEx(Ball,EM_SetModeType_ShowRoleHead,false) 
	AddToPartition(Ball,0)
	BeginPlot(Ball,"LuaPE_9_1_DW46",0)
--�I��̫����
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW22() --�k�N���ˬdscript
-----------------------------------------------------------------------------------------------
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102816	or
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102532 	then
		AddBuff(TargetID(),505124,5,5)
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102817	or
		ReadRoleValue(TargetID(),EM_RoleValue_OrgID)== 102818 	then
		AddBuff(TargetID(),505126,1,10)
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_CampID)==6	then
		return false
	end
	return true
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW23() --�z���U��Ĳ�o�@��
-----------------------------------------------------------------------------------------------
--�P�_���q�i���i�H�إX�s���z��
--���檽������
	if	PE_Zone9_1_GlobalStep ~= 0	and
		PE_Zone9_1_GlobalStep ~= 4	and
		PE_Zone9_1_GlobalStep ~= 5	then
		CancelBuff_NoEvent(OwnerID(),505112)
		return
	end
--������buff�n�ܦ^���`���z��
	local Powder = Lua_DW_CreateObj("obj",113941,OwnerID())
--Ĳ�I�@��
	SetPlot(Powder,"touch","LuaPE_9_1_DW18",50)
--�P�_���q����
	BeginPlot(Powder,"LuaPE_9_1_DW24",0)
	CancelBuff_NoEvent(OwnerID(),505112)
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW24() --�z��P�_���q�������@��
-----------------------------------------------------------------------------------------------
--�u�s���b�ĥ|���q
	while	PE_Zone9_1_GlobalStep == 0	or
		PE_Zone9_1_GlobalStep == 4	or
		PE_Zone9_1_GlobalStep == 5	do
		sleep(10)
	end
--�����ĥ|���q�N�ߨ����
	DelObj(OwnerID())
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW25() --�����ܤƪ��@��
-----------------------------------------------------------------------------------------------
	sleep(15)
--Ū�X�����Q�}�a������
--�ھڦۨ�����m�ب���W
	local Broken
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	then
		Broken = Lua_DW_CreateObj("obj",ReadRoleValue(OwnerID(),EM_RoleValue_PID),OwnerID(),0)
		SetModeEx(Broken,EM_SetModeType_Mark,false) 
		SetModeEx(Broken,EM_SetModeType_ShowRoleHead,false) 
		AddToPartition(Broken,0)
	end
--���æۨ�
	Hide(OwnerID())
--�j���ˬd���q
--���q�Ƥ��ŦX����
--�R��broken �q�X�ۤv
	while	true	do
		sleep(10)
		if	PE_Zone9_1_GlobalStep==1	then
			if	Broken~=nil	then
				DelObj(Broken)
			end
			Show(OwnerID(),0)
			return
		end
	end
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW26() --�����l�ƪ��@��114028
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114029)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW27() --�����l�ƪ��@��114030
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114031)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW28() --�����l�ƪ��@��114032
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114033)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW29() --�����l�ƪ��@��114034
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,114035)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW30() --�����l�ƪ��@��114036
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113714)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW31() --�����l�ƪ��@��114037
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113715)
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW32() --����|�����ܦ���
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,113940)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW33() --����@���Ϊ��۱��N
-----------------------------------------------------------------------------------------------
	KillID(TargetID(),TargetID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW34()--���եΫ��
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_GlobalStep = 0
	PE_Zone9_1_Global_1 = 0
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW35(Num)--���եΫ�� �]�w����
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_Global_1 = Num
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW36(Num)--���եΫ�� �]�w���q
-----------------------------------------------------------------------------------------------
	PE_Zone9_1_GlobalStep = Num
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW37() --�����l�Ƽ@�� �]�w�z���I�b�פW
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,9)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW38() --�z���S�ļ@��
-----------------------------------------------------------------------------------------------
	local RandSec = DW_Rand(3)
	sleep(RandSec*5)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==9	then
		CastSpell(OwnerID(),OwnerID(),494406)
	else
		CastSpell(OwnerID(),OwnerID(),494640)
	end
end



-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW39( ObjID , FlagObjID , FlagID,Range , Enable  ) -- �S����
-----------------------------------------------------------------------------------------------
	if	Enable ~= nil	then
		if	Enable == 1	then
			MoveToFlagEnabled( ObjID , false )
		end
	end
 	local X , Y , Z
	X = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_X )
	Y = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Y )
	Z = GetMoveFlagValue( FlagObjID , FlagID , EM_RoleValue_Z )

	X = X + Rand( Range) * 2 - Range + 1
	Z = Z + Rand( Range) * 2 - Range + 1

	return LuaPE_9_1_DW40( ObjID , X , Y  , Z );
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW40( ObjID , X , Y, Z)
-----------------------------------------------------------------------------------------------
	local Obj = Role:new( ObjID )
	local LastX = 0
	local LastZ = 0
	local NowX,NowZ
	local DW = 0
	Obj:Move(  X , Y ,Z  )
	while 1 do
		for i = 0 , 60 , 1 do
			NowX = Obj:X()
			NowZ = Obj:Z()

			if Abs( NowX - X ) < 10 and Abs( NowZ - Z ) < 10 then
				return true
			end

			if	(LastX == NowX 	and LastZ == NowZ) and
				ReadRoleValue(ObjID,EM_RoleValue_IsAttackMode)==0	then
				DW = DW + 1
				Obj:Move(  X , Y ,Z  )
			else
				if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==1	then
					if	ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)==0	then
						if	LastX == NowX 	and
							LastZ == NowZ		then
							DW = DW + 1
						end
					else
						DW = 0
					end
				else
					DW = 0
				end
			end

			if	DW >1	then
				return true
			end

			LastX = NowX
			LastZ = NowZ
			Sleep( 10 )
		end 
	end
	return false
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW41(flag) --���w���ʮy��
-----------------------------------------------------------------------------------------------
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,99)
	local Num = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	LuaPE_9_1_DW39( OwnerID() , flag , Num ,30 , 1  )
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,0)
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW42() --���m���q�����ɧR��
-----------------------------------------------------------------------------------------------
	while	PE_Zone9_1_GlobalStep~=1	do
		sleep(10)
	end
	while	HateListCount( OwnerID())~=0	do
		sleep(10)
	end
	DelObj(OwnerID())
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW43() -- 
-----------------------------------------------------------------------------------------------
	local CheckBar
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,TargetID())
	CallPlot(OwnerID(),"LuaPE_9_1_DW44",TargetID())
	if	BeginCastBar( TargetID(), "[SC_PE_9_1_21]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1	then
			ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
	end
	while	true	do
		sleep(2)
		CheckBar = CheckCastBar(TargetID())
		if	CheckBar~=0	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=TargetID()	then
				ScriptMessage ( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
				return
			end
--�p�G���榨�\
--�����aBUFF
--�R���ۤv
			if	CheckBar > 0	then
				EndCastBar(TargetID(),CheckCastBar(TargetID()))
				AddBuff(TargetID(),505112,1,-1)
				DelObj(OwnerID())
			else
--�p�G���楢��
--���]PID
--���]Ĳ�I�@��
				if	CheckBar<0	then
					EndCastBar(TargetID(),CheckCastBar(TargetID()))
					WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
					SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
					return
				end
			end
		end
	end
end

-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW44()
-----------------------------------------------------------------------------------------------
	for i=1,10,1 do
		sleep(2)
--�p�GPID���۵�
--������浲��
--����SCRIPT
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=TargetID()	then
			return
		end
	end
	sleep(10)
--�p�G�@����
--���M����N�O�X���S�����m
	if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==TargetID()	then
		WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
		SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
		return
	end
	return
end
-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW45()
-----------------------------------------------------------------------------------------------
	SetPlot(OwnerID(),"touch","LuaPE_9_1_DW18",50)
end


-----------------------------------------------------------------------------------------------
function LuaPE_9_1_DW46()
-----------------------------------------------------------------------------------------------
	CastSpell(OwnerID(),OwnerID(),494640)
	sleep(10)
	SysCastSpellLv(OwnerID(),OwnerID(),494641,200)
	sleep(10)
	DelObj(OwnerID())
end


-------------------------------------------------------------------------
function LuaPE_9_1_DW47() -- �}�μ@��
-------------------------------------------------------------------------
	local dis = 20
	local count = 7 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local ReviveTime = -1  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	local SnakeRand = {102926,102927}
	local FinalRand = DW_Rand(table.getn(SnakeRand))

	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,-3)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,1,3)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,-3)
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,-1)
	ObjMatrix[7] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,1)
	ObjMatrix[8] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,3,3)
	ObjMatrix[9] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,-3)
	ObjMatrix[10] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,-1)
	ObjMatrix[11] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,1)
	ObjMatrix[12] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,5,3)
	ObjMatrix[13] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,-3)
	ObjMatrix[14] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,-1)
	ObjMatrix[15] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,1)
	ObjMatrix[16] = LuaFunc_CreateNPCByMatrix(SnakeRand[FinalRand],Matrix,7,3)

	LuaFunc_ResetMatrix( ReviveTime , Matrix)
end

-------------------------------------------------------------------------
function LuaPE_9_1_DW48() --�V�ܪ�t�@��
-------------------------------------------------------------------------
	local Now = DW_Rand(10)
	if	Now==1	then	Yell(OwnerID(),"[SC_PE_9_1_36]",2)	end
	if	Now==3	then	Yell(OwnerID(),"[SC_PE_9_1_37]",2)	end
	if	Now==5	then	Yell(OwnerID(),"[SC_PE_9_1_38]",2)	end
	if	Now==7	then	Yell(OwnerID(),"[SC_PE_9_1_39]",2)	end
	if	Now==8	then	Yell(OwnerID(),"[SC_PE_9_1_40]",2)	end
	return
end