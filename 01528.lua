
-------------------------------------------------------
function LuaS_422712_0()--�ϥ��[���������ˬd
-------------------------------------------------------
--�ϥκX�l 780093 �s�� 1
--�ˬd�Z���O�_����
	if	not DW_CheckDis(OwnerID(),780093,1,40)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422712_0]", 0 )
		return false
	end
	local NPC = {}
--�j�M����npc
	NPC = SearchRangeNPC ( OwnerID() , 300 )
--���O�_�w�������s�b
	for i=0,table.getn(NPC),1 do
		if	NPC[i] == -1	then
		end
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID) == 113430	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422712_6]", 0 )
			return false
		end
	end
--�ˬd����
	return true
end


-------------------------------------------------------
function LuaS_422712_1()--�ϥ��[����������@��
-------------------------------------------------------
--�ϥκX�l 780093 �s�� 2
--�гy����
--�R�O������I�Ǽ@��
	local Tester = Lua_DW_CreateObj("flag",113430,780093,2)
	BeginPlot(Tester,"LuaS_422712_2",0)
end

-------------------------------------------------------
function LuaS_422712_2()--�����I�Ǽ@��
-------------------------------------------------------
--�p��
	local X = 0
--�ϥκX�l 780093 �s�� 3 4 5 9 10
	local Disco = {}
	local EndBall = 0
--���ͯS�Ĳy
--�d��T��:�����}�l���⵲����t���t��
--��S�Ĳy�I�k
	local StartBall = Lua_DW_CreateObj("flag", 112307 ,780093,9)
	sleep(10)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422712_1]", C_YELLOW )
	ScriptMessage( OwnerID(), 0, 0, "[SC_422712_1]", C_YELLOW )
	sleep(10)
	CastSpell(OwnerID(),StartBall,492681)
	local sec = 0
	for i=1,30,1 do
		sleep(10)
--��ܰT�����B�J &�p��
		sec = sec + 1
		if	sec == 20	then
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_3]", 0 )
		end
--�T���u�q�X�@��
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) > 10	and
			X == 0							then
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_4]", 0 )
			X = 1
		end
--�ˬd�ۤv�O�_�s��
--��PID�O���ͩR��
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) > 14	then
--��������
			ScriptMessage( OwnerID(), 0, 2, "[SC_422712_5]", 0 )
--�Ѵ��e�R�h�Ҧ����i�J�԰�������
			for i = 1,3,1 do
--���Ыثh���B�z
--�԰��������鵹�� ���}�԰��K��۰ʮ��������O
--���i�J�԰������骽���R��
				if	Disco[i] ~= nil		then
					if	HateListCount( Disco[i])>0	then
						CallPlot(Disco[i],"LuaFunc_Obj_Suicide",30)
					else
						DelObj(Disco[i])
					end
				end
			end
--�R�h���ͥX�Ӫ��S�Ĳy�M�ۤv
			DelObj(StartBall)
			DelObj(OwnerID())
		end
--�p�G���ЫءBID�w���� �h�H���P�_���ͩǪ�
--�����Ǫ����ai

		for i = 1,3,1 do
			if	Disco[i] ~= nil		then
				if	not CheckID(Disco[i])	then
					if	DW_Rand(100)>23	then
						Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
						WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
						BeginPlot(Disco[i],"LuaS_422712_3",0)
					end
				else
					if	ReadRoleValue(Disco[i],EM_RoleValue_IsDead)==1	then
						if	DW_Rand(100)>23	then
							Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
							WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
							BeginPlot(Disco[i],"LuaS_422712_3",0)
						end
					end
				end
			else
				if	DW_Rand(100)>23	then
					Disco[i] = Lua_DW_CreateObj("flag",102244,780093, i+2)
					WriteRoleValue(Disco[i],EM_RoleValue_PID,i)
					BeginPlot(Disco[i],"LuaS_422712_3",0)
				end
			end
		end
	end
--�d��T���G�����ХܥX�Ʀ~�᪺������t
--�ɶ��� ������������
--���ܬI�k��V
	AddBuff( OwnerID() ,502383,1 ,1)
	sleep(20)
	EndBall = Lua_DW_CreateObj("flag", 112307 ,780093,10)
	CastSpell(OwnerID(),EndBall,492681)
	ScriptMessage( OwnerID(), 0, 2, "[SC_422712_2]", C_YELLOW )
	ScriptMessage( OwnerID(), 0, 0, "[SC_422712_2]", C_YELLOW )
--�j�M���񪺪��a
--�������Ȫ��� �N�������n���~
	local Player = SearchRangePlayer ( OwnerID() , 100 )
	for i=0,table.getn(Player),1 do
		if	Player[i] ~= -1		then
			if	CheckAcceptQuest(Player[i],422712)	then
				SetFlag(Player[i],543268,1)
			end
		end
	end
	sleep(30)
	DelObj(StartBall)
	DelObj(EndBall)
	for i = 1,3,1 do
--���Ыثh���B�z
--�԰��������鵹�� ���}�԰��K��۰ʮ��������O
--���i�J�԰������骽���R��
		if	Disco[i] ~= nil		then
			if	HateListCount( Disco[i])>0	then
				CallPlot(Disco[i],"LuaFunc_Obj_Suicide",30)
			else
				DelObj(Disco[i])
			end
		end
	end
--�R�h���ͥX�Ӫ��S�Ĳy�M�ۤv
	DelObj(StartBall)
	DelObj(EndBall)
	DelObj(OwnerID())
end


-------------------------------------------------------
function LuaS_422712_3()--�u�ê����ai
-------------------------------------------------------
--�ϥκX�l 780093 �s�� 6 7 8
--�~�ӺX���s��
--����Ө쪺�w�I
	local flag = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	DW_MoveToFlag( OwnerID() , 780093 , flag+5,0 , 1  )
--�Y�S���i�J�԰�  �h�ʤ�R������
	while true do
		if	HateListCount( OwnerID())==0	then
--�p�G�]�԰����}�ӻ� �h���s�^��iĲ�νd�� �A�i��I�k
			if	DW_CheckDis(OwnerID(),780093,flag+5,130)	then
				CastSpell(OwnerID(),TargetID(),493889)
			else
				DW_MoveToFlag( OwnerID() , 780093 , flag+5,0 , 1  )
			end
		end
		sleep(20)
	end
end


-------------------------------------------------------
function LuaS_422712_4()--�W�[������PID
-------------------------------------------------------
	local PID = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	WriteRoleValue(TargetID(),EM_RoleValue_PID,PID+1)
end