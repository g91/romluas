-- Index: 
-- FA_GotMiddle�G�����I�����y��
-- FA_BuffInfo�G�x�Ψ��oBuff�U�ظ�T
-- FA_CalDir�G��������I�y�����A���V
-- FA_CalFaceDir�G�������Ӫ������A����V
-- FA_GetXZ�G�殳���� X �P Z ����T
-- FA_GetXZ_Table�G�殳���� X �P Z ����T�A��XTable
-- FA_CheckQuestOrFlag�G�P���ˬd�������ȻP���n���~
-- FA_CheckLineEX�G�x�Ϋ��W��CheckLine
-- FA_FindError�G��ֱ��� Function�A�����b������Func�̭��I�s�o��Func�N�n�C
-- FA_SearchNPC�G�j�M�S�w����NPC�A�åB��L�̪�GUID�Ǧ^�A�p�G�u���@�ӫh�u�|�OID�s���A�p�G���Ƽƭӫh�|�Ǧ^�@��table

--------------------------------- FA_GotMiddle ---------------------------------
--------------------------------- �����I�����y�� ---------------------------------
-- ��ӰѦ��I�i�H�ۥѫ��w�y�СBFlag�Ϊ���C
-- ObjID1 / FlagNum1 / Z1 �� ObjID2 / FlagNum2 / Z2 ����k�G
	-- �e���@�լO A �I�A�᭱�@�լO B �I�A�ҿת����I�����Y����AB�I�������CAB�I�i���w���P�������Ѧ��I�C
	-- �Y�Ѧ��I������A�h�u�ݭn��J ObjID1 �� ObjID2
	-- �Y�Ѧ��I��Flag�A�h�g�J�X�l���s�ա]��Ʈw�s���^�� ObjID1 �� ObjID2 �ç�s���g�� FlagNum1 �� FlagNum2 ���C
	-- �Y�Ѧ��I���y�СA�h�g�JXYZ�ȹ�����J ObjID1 / FlagNum1 / Z1 �� ObjID2 / FlagNum2 / Z2  ��
	-- �A�S�Ψ쪺�ѼƴN��0
-- Range	�üƨM�w�H���d��A���H���Яd�ũζ�s
-- CheckLine	�n���n�ˬd���I��m�O�_�P��Ѧ��I�����Z�q�L��

function FA_GotMiddle(ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2 , Z2 , Range , CheckLine)
 	local Pos
	local Pos2 = {}
	Range = Range or 0
	local GetRange = 	function ()
					return Rand( Range ) * 2 - Range + 1
				end
 
	if Z1 ~= nil and Z2 ~= nil then
		Pos = {ObjID1, FlagNum1, Z1, ObjID2, FlagNum2, Z2}
	elseif FlagNum1 ~= nil and FlagNum2 ~=nil then
		Pos = { GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_X ),
			GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_Y ),
			GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_Z ),
			GetMoveFlagValue( ObjID2 , FlagNum2 , EM_RoleValue_X ),
			GetMoveFlagValue( ObjID2 , FlagNum2 , EM_RoleValue_Z ) }
	else
		Pos = { ReadRoleValue(ObjID1,EM_RoleValue_X),
			ReadRoleValue(ObjID1,EM_RoleValue_Y),
			ReadRoleValue(ObjID1,EM_RoleValue_Z),
			ReadRoleValue(ObjID2,EM_RoleValue_X),
			ReadRoleValue(ObjID2,EM_RoleValue_Z) }
	end

	for i = 1,11 do
		Pos2[1] = (Pos[1] + Pos[4]) / 2
		if Range ~= 0 then Pos2[1] = Pos2[1] + GetRange() end
		Pos2[3] = (Pos[3] + Pos[5]) / 2
		if Range ~= 0 then Pos2[1] = Pos2[1] + GetRange() end

		Pos2[2] = GetHeight( Pos[1] , Pos[2] , Pos[3] )
		if CheckLine == 1 then
			if FA_CheckLineEX(0, 2, Pos2[1], Pos2[2],Pos2[3],ObjID1,FlagNum1,0)
			and FA_CheckLineEX(0, 2, Pos2[1], Pos2[2],Pos2[3],ObjID2,FlagNum2,0) == true then
				break
			end
		else
			break
		end
		if i == 11 then
			DebugMsg(0,0,"FA_GotMiddle ERROR: Cant find a point with CheckLine!")
			return false
		end
	end
	return Pos2[1],Pos2[2],Pos2[3]
end

--------------------------------- FA_BuffInfo ---------------------------------
--------------------------------- �x�Ψ��oBuff�U�ظ�T ---------------------------------
-- ObjID =	�ˬd������s��
-- BuffID =	�n�ˬd��Buff�s��
-- Info =	�A�n�����T�A�p�G���g�ζüg�N�w�]��0
	-- 0 =	Buff �I�i��
	-- 1 = 	�]�kID
	-- 2 = 	�ѤU�ɶ�(��)
	-- 3 = 	�¤O( �]�k�ֿn����)
	-- 4 = 	�I��( �]�k�ޥi���I��or ����)

function FA_BuffInfo(ObjID,BuffID,Info)
	local BuffInfoGot
	if type(Info) ~= "number" or Info > 4 or Info < 0 then Info = 0 end
	if CheckBuff(ObjID,BuffID) == true then
		for i = 0,BuffCount(ObjID) do
			if BuffInfo ( ObjID , i , 1 ) == BuffID then
				BuffInfoGot = BuffInfo ( ObjID , i , Info )
				return BuffInfoGot
			end
		end
	else
		return false
	end
end

-------------------------- FA_CalDir ---------------------------
------------------ ��������I�y�����A���V---------------------
-- 1.	�i�H��������ӧt�y�Ъ� table �b PosA �� PosB ���a��
--	�o�ˤ��ݭn�� PosAz, PosBz
--	PosA[1] �� PosB[1] �|�Q�ѧO������I�y�Ъ� X
--	PosA[3] �� PosB[3] �|�Q�ѧO������I�y�Ъ� Z
--	�p�G�ĤT�Ӧ�m�O�Ū��A�N��A�i�ઽ�����F X �� Z ����I�Ӥw
--	�����p�|��� PosA[3] �� PosB[3]
-- 2.	�A�]�i�H���������I�� X �� Z �����ӧO�ǤJ�Ӥ��� table
--	PosA �� �Ĥ@���I�� X
--	PosB �� �ĤG���I�� X
--	PosAz �� �Ĥ@���I�� Z
--	PosBz �� �ĤG���I�� Z
--	���L�A�o���p�U PosA �� PosB �̵M�i�H���@�M table�A�L�٬O���D�h��Ĥ@�Ӥ���
--	����A�i�H�ۦ��B�~���w����I�� Z ���N��

function FA_CalDir ( PosA, PosB, PosAz, PosBz )
	local A,B = {},{}

	A[1] = PosA[1] or PosA
	A[2] = PosAz or PosA[3] or PosA[2]

	B[1] = PosB[1] or PosB
	B[2] = PosBz or PosB[3] or PosB[2]

	if not (A[1] and A[2] and B[1] and B[2]) then
		return false
	end

	return CalDir( A[1] - B[1], A[2] - B[2] )

end

--------------------------- FA_CalFaceDir ---------------------------
-------------------- �������Ӫ������A����V ---------------------

function FA_CalFaceDir ( ObjA, ObjB )
	return FA_CalDir( FA_GetXZ_Table (ObjA), FA_GetXZ_Table (ObjB) )
end

--------------------------- FA_GetXZ ---------------------------
-------------------- �殳���� X �P Z ����T ------------------

function FA_GetXZ ( Obj, FlagNum )
	Obj = Obj or OwnerID()
	local X, Z

	if type( Obj ) ~= "number" then
		return false
	end

	if type(FlagNum)=="number" then
		X = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_X )
		Z = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_Z )
		return X, Z
	else
		X = ReadRoleValue( Obj , EM_RoleValue_X )
		Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		return X, Z
	end
end

--------------------------- FA_GetXZ_Table -----------------------------
----------------- �殳���� X �P Z ����T�A��XTable ------------------

function FA_GetXZ_Table ( Obj, FlagNum )
	return { FA_GetXZ ( Obj, FlagNum ) }
end

--------------------------------- FA_CheckQuestOrFlag ---------------------------------
--------------------------------- �P���ˬd�������ȻP���n���~ ---------------------------------
-- �ˬd�ѧ�Quest�Ϊ̬Y��Flag(KeyItem)�O�_�䤤�@�̦�
-- AndOr = 1 �ܦ���̬ҭn���C�p�GQuestNum��FlagNum���ʼg���h�öǦ^false
function FA_CheckQuestOrFlag(Who,QuestNum, FlagNum,AndOr)
	QuestNum = QuestNum or -1
	FlagNum = FlagNum or -1
	if AndOr == 1 then
		return CheckCompleteQuest(Who,QuestNum) and CheckFlag(Who,FlagNum)
	else
		return CheckCompleteQuest(Who,QuestNum) or CheckFlag(Who,FlagNum)
	end
	return false
end

--------------------------------- FA_CheckLineEX ---------------------------------
--------------------------------- �x�Ϋ��W��CheckLine ---------------------------------
-- �ˬd���I�����O�_�Z�q
-- �ϥ� 117666 ���Ϊ��~��{�U������checkline
-- P1 �� P2 ��J�Ĥ@�Ӹ�ĤG���I�]�L���ǡ^�������A�ϥΥN�X�p�U�G
	-- �j�p�g�L�ҿ� --
	-- "xyz"�� "X" �� "0"	�Ѧ��I���w���y��
	-- "Obj" �� "O" �� "1"	�Ѧ��I���w������
	-- "Flag" �� "F" �� "2"	�Ѧ��I���w���X��
-- ��J���������աAP1 ��������� Va1 ~ Va3�AP2 ��������� Vb1 ~ Vb3
	-- �A�S�Ψ쪺�ѼƴN��0
-- GetHeight��J1�A�h�|�����J��XYZ�������@��GetHeight�]�a��I���I���ס^
	-- �ҥH�o�˰����� y �N�i�H�H�K�g�F�C���L�L�u�|���a���I�A���~�W���N�S��k�F�C

function FA_CheckLineEX(P1, P2, Va1, Va2, Va3,Vb1,Vb2,Vb3,GetHeight)
	Local Pos
	local FlagXYZ
	local ObjCreated
	local ArgTable = {	["xyz"] = 0, ["x"] = 0, ["0"] = 0, [0] = 0,
				["obj"] = 1, ["o"] = 1, ["1"] = 1, [1] = 1,
				["flag"] = 2, ["f"] = 2, ["2"] = 2, [2] = 2	}

	P1, P2 = ArgTable[string.lower(P1)], ArgTable[string.lower(P2)]

	if P1 == nil or P2 == nil then
		DebugMsg(0,0,"FA_CheckLineEX ERROR: Give me a right point's type arg please!")
		return false
	end

	if GetHeight == 1 then
		if P1 == 0 then
			Va2 = GetHeight(Va1 , Va2 , Va3)
		end
		if P2 == 0 then
			Vb2 = GetHeight(Vb1 , Vb2 , Vb3)
		end
	end

	if P1 == 0 then

		if P2 == 0 then
			Pos = {CreateObj( 117666, Va1 , Va2 , Va3 ,0 , 1),Vb1,Vb2,Vb3}
			ObjCreated = true
		elseif P2 == 1 then
			Pos = {Vb1,Va1,Va2,Va3}
		elseif P2 == 2 then
			Pos = {CreateObjByFlag(117666,Vb1,Vb2,1),Va1,Va2,Va3}
			ObjCreated = true
		end

	elseif P1 == 1 then

		if P2 == 0 then
			Pos = {Va1,Vb1,Vb2,Vb3}
		elseif P2 == 1 then
			return CheckRelation( Va1 , Vb1 , EM_CheckRelationType_CheckLine ) 
		elseif P2 == 2 then
			FlagXYZ = DW_GetFlagXYZ(Vb1,Vb2)
			Pos = {Va1,FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
		end

	elseif P1 == 2 then

		if P2 == 0 then
			Pos = {CreateObjByFlag(117666,Va1,Va2,1),Vb1,Vb2,Vb3}
			ObjCreated = true
		elseif P2 == 1 then
			FlagXYZ = DW_GetFlagXYZ(Va1,Va2)
			Pos = {Vb1,FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
		elseif P2 == 2 then
			FlagXYZ = DW_GetFlagXYZ(Vb1,Vb2)
			Pos = {CreateObjByFlag(117666,Va1,Va2,1),FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
			ObjCreated = true
		end

	end

	if ObjCreated == true then
		DelObj(Pos[1])
	end

	return CheckLine(Pos[1],Pos[2],Pos[3],Pos[4])

end

function FA_FindError()
	DebugMsg(0,0,"Error on me! My ID is "..OwnerID().."!!")
end

-- �j�M�S�w����NPC�A�åB��L�̪�GUID�Ǧ^�A�p�G�u���@�ӫh�u�|�OID�s���A�p�G���Ƽƭӫh�|�Ǧ^�@��table
-- Center �j�M�����I��GUID
-- Range �d��
-- OrgID �n�j�M��H����Ʈw�s��
-- PID �n�j�M��H��PID
-- IsBoth �p�G�o�Ӧa��g1��true�A���N�O�ݭn�W����ӱ��󳣦��ߡ]and�^
--	  �_���h�O����@�h���ߡ]or�^
function FA_SearchNPC( Center, Range, OrgID, PID, IsBoth )
	local SearchTable = {}
	local ReturnTable = {}

	Range = Range or 300
	Center = Center or OwnerID()

	SearchTable = SearchRangeNPC(Center,Range)

	for i = 1, table.getn(SearchTable)	do
		if IsBoth == true or IsBoth == 1 then
			if ReadRoleValue(SearchTable[i], EM_RoleValue_OrgID ) == OrgID
			and ReadRoleValue(SearchTable[i], EM_RoleValue_PID ) == PID then
				table.insert(ReturnTable,SearchTable[i])
			end
		else
			if ReadRoleValue(SearchTable[i], EM_RoleValue_OrgID ) == OrgID
			or ReadRoleValue(SearchTable[i], EM_RoleValue_PID ) == PID then
				table.insert(ReturnTable,SearchTable[i])
			end
		end
	end

	if table.getn(ReturnTable) == 1 then
		return ReturnTable[1]
	elseif ReturnTable == {} then
		return nil
	else
		return ReturnTable
	end

end
