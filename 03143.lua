--z32�G�m=======================================
--=======================================
--===============�a�@����
function LuaPG_Z32_Group()
--		<<�y�� Matrix ��ƥN���m���ܷN��>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	
	local NPC = OwnerID()
	local dis = 25
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local LeaderPID = ReadRoleValue(NPC, EM_RoleValue_PID)
--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local MonPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	
--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}

	if  MonPID==0	then	--�޲ܲ�
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108731,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108911,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108911,Matrix,3,-1 )

	elseif MonPID==1	then	--�೽�H����̻P���ǲ�
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108730,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108733,Matrix,3,1 )		

	elseif MonPID==2	then	--�೽�H���ު̻P���ǲ�
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108729,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108733,Matrix,3,1 )

	elseif  MonPID==3	then	--�����̻P���ު̲�
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108729,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108730,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108730,Matrix,3,-1 )

	elseif  MonPID==4	then	--�T��
		Matrix = LuaFunc_Matrix_Maker( 45 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108674,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108673,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108673,Matrix,3,-1 )

	elseif  MonPID==5	then	--�G���β�
		Matrix = LuaFunc_Matrix_Maker( 40 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(123863,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(123861,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(123862,Matrix,3,-1 )

	elseif  MonPID==6	then	--�p�İl����
		Matrix = LuaFunc_Matrix_Maker( 6 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(114794,Matrix,3,1 )
		ks_ActSetMode( ObjMatrix[1] )
		SetModeEx( ObjMatrix[1] , EM_SetModeType_HideName , true )
		WriteRoleValue(ObjMatrix[1]  ,EM_RoleValue_IsWalk , 0 )
	end

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( NPC, "LuaPG_Z32_Group_02" , 0 );
end

function LuaPG_Z32_Group_02()
	BeginPlot( OwnerID() , "LuaPG_Z32_Group" , 2 );
end

--=======================================
--===============�����˸m�S��
function LuaPG_Z32_Seafood_device()
	local Seafood = OwnerID()
	local x,y,z,dir=DW_Location(Seafood)
	local BuffMan = CreateObj(119306, x, y, z, dir, 1 )	--�ͦ�
	AddToPartition(BuffMan, 0)
	SetModeEx(BuffMan, EM_SetModeType_Mark,FALSE)
	SetModeEx(BuffMan, EM_SetModeType_Move,FALSE)
	AddBuff(BuffMan, 625489, 0, -1)
	WriteRoleValue(Seafood, EM_RoleValue_Register3, BuffMan)
end

--=======================================
--===============�೽�H�S��
function LuaPG_Z32_Seafood_Head()
	local Seafood = OwnerID()
	AddBuff(Seafood, 625728, 0, -1)
end

--=======================================
--===============�cŢ�H��
function LuaPG_Z32_Hostage_Act()
	local NPC = OwnerID()
	local RandNum = Rand(3)+1
	local Act = {ruFUSION_ACTORSTATE_EMOTE_CRY, ruFUSION_ACTORSTATE_EMOTE_BEG, ruFUSION_ACTORSTATE_EMOTE_ANGRY}
	PlayMotionEX(NPC, Act[RandNum], Act[RandNum])
end

--=======================================
--===============�����S��
function LuaPG_Z32_Smoke()
	local NPC = OwnerID()
	local x,y,z,dir=DW_Location(NPC)
	local  Smoke = CreateObj(123606, x, y, z, dir, 1 )	--�ͦ�
	AddToPartition(Smoke, 0)
end

--=======================================
--===============�y�����A��
function LuaPG_Z32_RumourFarmer()
	local Farmer = OwnerID()
	local RandNum = Rand(5)+1
	local SpeakString = {"[SC_FARMER_1]","[SC_FARMER_2]","[SC_FARMER_3]","[SC_FARMER_4]","[SC_FARMER_5]"}
	NPCSay(Farmer, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============�@�����u
function LuaPG_Z32_123710()
	SetIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_ROFL)
end

--=======================================
--===============�۵h
function LuaPG_Z32_123710_2()
	local Farmer = OwnerID()
	local RandNum = Rand(2)+1
	local SpeakString = {"[SC_123710_1]","[SC_123710_2]"}
	NPCSay(Farmer, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============�p���ܤ�
function LuaPG_Z32_Animal_Water()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_PARRY_1H)
end

--=======================================
--===============�೽�H�V�m��
function LuaPG_Z32_Seafood_Train()
	local Seafood = OwnerID()
	local RandNum = Rand(2)+1
	local SpeakString = {"[SC_SEAFOOD_1]","[SC_SEAFOOD_2]"}
	PlayMotion(Seafood, ruFUSION_ACTORSTATE_CAST_SP01)
	NPCSay(Seafood, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============�೽�H����˸m�I�k
function LuaPG_Z32_Seafood_DeviceShow()	--��ۯS�Ĳy�I��k�N
	local NPC = OwnerID()
	local Ball = LuaFunc_SearchNPCbyOrgID( NPC, 123857, 200, 0 )

	while 1 do
		local Attack = HateListCount(NPC) --�԰����A
		if Attack ==0	then
			PlayMotion( NPC, ruFUSION_MIME_BUFF_BEGIN)
			CastSpell(NPC, Ball, 851957)
		--else
			--SetDefIdleMotion(NPC, ruFUSION_MIME_NONE)
		end
		Sleep(50)
	end
end

function LuaPG_Z32_Seafood_DeviceShow_2()
	AddBuff(OwnerID(), 625728, 0, -1)
end


--=======================================
--===============���a
function LuaPG_Z32_Cleaning()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	Sleep(25)
end

--=======================================
--===============�K�K
function LuaPG_Z32_Blacksmith()
	local NPC = OwnerID()
	SetDefIdleMotion(NPC, ruFUSION_MIME_ATTACK_1H)
end

--=======================================
--===============�T
function LuaPG_Z32_Wolf()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Sleep(15)
end

--=======================================
--===============��a
function LuaPG_Z32_Swim()
	local NPC = OwnerID()
	SetDefIdleMotion(NPC, ruFUSION_MIME_SWIM_IDLE)
end