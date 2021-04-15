--==================================================--
-- �W�u�e�ݭn�վ㪺����
-- 1.�D�H�ɵ��u���G��
-- 2.���m���ɶ��n�վ�
--==================================================--

--==================================================--
--  ���ը禡��                                      --
--==================================================--
function LuaPE_ZONE8_02SCA_DeleteAll( DeleteMode )
	local Obj = LuaPE_ZONE8_02SCA_Obj
	local StartNum = 1

	if DeleteMode ~= nil and DeleteMode == 1 then
		StartNum = 2
	end

	for i = StartNum, table.getn(Obj) do
		if CheckID(Obj[i]) == true then
			DelObj( Obj[i] )
		end
	end
end
--==================================================--



--==================================================--
--  �����ܼư�                                      --
--==================================================--
function LuaPE_ZONE8_02SCA_GlobalSet()
	LuaPE_ZONE8_02SCA_Obj = {}		-- �ϥΪ���޲z�}�C
	LuaPE_ZONE8_02SCA_Var = {}		-- �ϥΰѼƺ޲z�}�C
	LuaPE_ZONE8_02SCA_Phase = 0		-- �i���ġH���q

	LuaPE_ZONE8_02SCA_Var[1] = 0	-- ��ɪ���GID(�X�m)
	LuaPE_ZONE8_02SCA_Var[2] = 0	-- �B���K���sID
	LuaPE_ZONE8_02SCA_Var[3] = 1	-- �B���K���s�ثe������@�ӺX��
	LuaPE_ZONE8_02SCA_Var[4] = {}	-- �@�î�
	LuaPE_ZONE8_02SCA_Var[5] = 0	-- ���`��
	LuaPE_ZONE8_02SCA_Var[11] = 3600	-- �������ȭ��m�ɶ�(��)1�p��
end
--==================================================--



--==================================================--
--  �T���B�z��                                      --
--==================================================--
--�ǰe�T��
function LuaPE_ZONE8_02SCA_Message( Index , Color )
	local AreaPlayer = LuaPE_ZONE8_02SCA_GetAreaPlayer()
	local Message = ""

	    if Index == 1 then
		Message = "[SC_PE_ZONE8_01][$SETVAR1=[SC_PE_ZONE8_02SCA_M01]]"	-- �ƥ� [$VAR1] �}�l�i��I�I $VAR1=�K���s�ɵ�
	elseif Index == 2 then
		Message = "[SC_PE_ZONE8_02SCA_M02]"	-- �@���K���s�ɵ��p���X�o�F�I�I
	elseif Index == 3 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M03]]"	-- �K���s�ɵ��p���o�{��ê�I�I
	elseif Index == 4 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M04]]"	-- �K���s�ɵ��p���ư���ê�A�~��e�i�I�I
	elseif Index == 5 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M05]]"	-- �B���K���s�������~�A�ֳt�k�]�I�I
	elseif Index == 6 then
		Message = "[SC_PE_ZONE8_04][$SETVAR1=[SC_PE_ZONE8_02SCA_M06]]"	-- �B���K���s�����Y���ˮ`�A�ܱo����I�I
	elseif Index == 7 then
		Message = "[SC_PE_ZONE8_02SCA_M07]"	-- �K���s�ɵ��p�����Q���N���~�B���F�w�I�I�I
	elseif Index == 8 then
		Message = "[SC_PE_ZONE8_02SCA_M08]"	-- �K���s�ɵ��p��ĵ���ԷV���ڤJ�۾��A���H�䤣��Żا����I�I
	elseif Index == 9 then
		Message = "[SC_PE_ZONE8_02SCA_M09]"	-- �K���s�ɵ��p�����Q���q�L�۾��Aĵ�ٵy�L���P�F�U�ӡI�I
	elseif Index == 11 then
		Message = "[SC_PE_ZONE8_05][$SETVAR1=[SC_PE_ZONE8_02SCA_M01]]"	-- �ƥ� [$VAR1] �ܦ������I�I $VAR1=�K���s�ɵ�
	end

	for i = 1 , table.getn(AreaPlayer) do
		ScriptMessage( OwnerID(), AreaPlayer[i] , 1 , Message , Color )
		ScriptMessage( OwnerID(), AreaPlayer[i] , 0 , Message , Color )
	end
end
--==================================================--



--==================================================--
--  �@�Ψ禡��                                      --
--==================================================--
--���Y�X�l����]�w
function LuaPE_ZONE8_02SCA_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )
	local Leader = CreateObjByFlag( LeaderID , FlagID , LeaderBronFlag , 1 )
	SetModeEx( Leader , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Leader , EM_SetModeType_Obstruct , true )		-- ����
	SetModeEx( Leader , EM_SetModeType_Gravity , false )		-- ���O
	SetModeEx( Leader , EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Leader , EM_SetModeType_Move , false )		-- ����
	SetModeEx( Leader , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Leader , EM_SetModeType_HideName , false )		-- �W��
	SetModeEx( Leader , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	SetModeEx( Leader , EM_SetModeType_Fight , false )		-- �i�������
	SetModeEx( Leader , EM_SetModeType_Show , true )		-- ���
	AddToPartition( Leader , RoomID )

	LuaPE_ZONE8_02SCA_Obj[1] = Leader	-- �N�ާ@����[�J�Ĥ@��
	LuaPE_ZONE8_02SCA_Var[1] = Leader	-- ��ɪ���GID

	return Leader;
end

--����ϰ쪱�a
function LuaPE_ZONE8_02SCA_GetAreaPlayer()
	local RoomID = 0
	local AreaID = 664	-- �D�H�ɵ��u����
	--local AreaID = 667	-- �D�H�ɵ��u�F��
	local TestID = 1	-- ���հ�
	local AreaPlayer = {}
	local ZonePlayer = {}

	local PlayerCount = SetSearchAllPlayer( RoomID )	-- �^�ǧ��Ӽ�
	for i = 1 , PlayerCount do
		ZonePlayer[i] = GetSearchResult()	-- ���o�j�M�쪺���a
		local X = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_X )
		local Y = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Y )
		local Z = ReadRoleValue( ZonePlayer[i] , EM_RoleValue_Z )
		if CheckMapID( X , Y , Z , AreaID ) == true or CheckMapID( X , Y , Z , TestID ) then
			table.insert( AreaPlayer , ZonePlayer[i] )	-- �j�M��o�Ӥ��Ϫ����a�N�[�i�h
		end
	end

	return AreaPlayer;
end

-- �����}��
function LuaPE_ZONE8_02SCA_FormationPosition( X , Y , Z , Width , Height , Angle , Angle2 )
	if Height == nil then Height = Width end
	if Angle2 == nil then Angle2 = 15 end

	local Position = {}
	Position["X"] = {}
	Position["Y"] = {}
	Position["Z"] = {}

	Position["X"][1] = X+Height*math.cos(Angle*math.pi/180)	-- �e
	Position["Y"][1] = Y
	Position["Z"][1] = Z-Height*math.sin(Angle*math.pi/180)

	Position["X"][2] = X-Width*math.sin(Angle*math.pi/180+Angle2)	-- �k�e
	Position["Y"][2] = Y
	Position["Z"][2] = Z-Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][3] = X+Width*math.sin(Angle*math.pi/180-Angle2)	-- ���e
	Position["Y"][3] = Y
	Position["Z"][3] = Z+Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][4] = X-Width*math.sin(Angle*math.pi/180-Angle2)	-- �k��
	Position["Y"][4] = Y
	Position["Z"][4] = Z-Width*math.cos(Angle*math.pi/180-Angle2)

	Position["X"][5] = X+Width*math.sin(Angle*math.pi/180+Angle2)	-- ����
	Position["Y"][5] = Y
	Position["Z"][5] = Z+Width*math.cos(Angle*math.pi/180+Angle2)

	Position["X"][6] = X-Height*math.cos(Angle*math.pi/180)	-- ��
	Position["Y"][6] = Y
	Position["Z"][6] = Z+Height*math.sin(Angle*math.pi/180)

	return Position;
end
--==================================================--



--==================================================----==================================================--
--           ��������-��ͤ��a-�ɵ��d�I��           ----                                                  --
--==================================================----==================================================--



--==================================================--
--  �ɵ��d�I��  �ҰʳB�z��                          --
--==================================================--
function LuaPE_ZONE8_02SCA_Start( Mode )
	local Obj = LuaPE_ZONE8_02SCA_Obj
	local Var = LuaPE_ZONE8_02SCA_Var

	local LeaderID = 113607		-- �D�H�x���X�m
	local FlagID = 780462
	local LeaderBronFlag = 0
	local RoomID = 0
	local FlagTmp = 0

	if Obj ~= nil then
		LuaPE_ZONE8_02SCA_DeleteAll( Mode )	-- �N���e���e�@�Өƥ󪺪�������R��
	end

	if Mode ~= nil and Mode == 1 then
		FlagTmp = Var[1]	-- �X�m�s���Ȧs
	end

	LuaPE_ZONE8_02SCA_GlobalSet()	-- �]�w�@���ܼ�

	local Leader = LuaPE_ZONE8_02SCA_LeaderSet( LeaderID , FlagID , LeaderBronFlag , RoomID )	-- �]�w���Y�X�m(�D�H�X�m)

	LuaPE_ZONE8_02SCA_Message( 1 , C_SYSTEM )
	LuaPE_ZONE8_02SCA_Phase = 1		-- �i�J�Ĥ@���q

	Sleep( 10 )	-- ���ݤ@�U
	local Ankylo = LuaPE_ZONE8_02SCA_AnkyloCreate()	-- �����K���s
	LuaPE_ZONE8_02SCA_Var[2] = Ankylo

	BeginPlot( Leader , "LuaPE_ZONE8_02SCA_AnkyloDo" , 0 )	-- ����B��L�{�j��
	LuaPE_ZONE8_02SCA_Message( 2 , C_SYSTEM )

	if Mode ~= nil and Mode == 1 then
		DelObj( FlagTmp )	-- �R���e�@�ӺX�m
	end
end
--==================================================--



--==================================================--
--  �ɵ��d�I��  ���󲣥Ͱ�                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloCreate()	-- ����ɵ���
	local AnkyloID = 102713	-- 102713�B���K���s
	local FlagID = 780462
	local AnkyloBronFlag = 1
	local RoomID = 0
	local SnakeID = { 102716 , 102715 , 102715 , 102715 , 102715 , 102715 }	--102709���D�ɵ��L 102710�D�H�ɵ��L
	local SnakeNum = 5	-- �o��u���� �e�򥪥k���䪺�@��

	local Ankylo = CreateObjByFlag( AnkyloID , FlagID , AnkyloBronFlag , 1 )
	SetModeEx( Ankylo , EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( Ankylo , EM_SetModeType_Strikback , false )		-- ����
	SetModeEx( Ankylo , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( Ankylo , EM_SetModeType_Fight , false )		-- �i�������
	WriteRoleValue( Ankylo , EM_RoleValue_IsAttackMode , 0 )	-- ���O�������A
	WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )	-- �Ψ�������
	AddToPartition( Ankylo , RoomID )
	MoveToFlagEnabled( Ankylo , false )	-- �������޼@��
	table.insert( LuaPE_ZONE8_02SCA_Obj , Ankylo )
	Sleep( 5 )

	SetPlot( Ankylo , "DEAD" , "LuaPE_ZONE8_02SCA_AnkyloDead" , 0 )	-- �]�w���`�@��

	local X = ReadRoleValue( Ankylo , EM_RoleValue_X )
 	local Y = ReadRoleValue( Ankylo , EM_RoleValue_Y )
 	local Z = ReadRoleValue( Ankylo , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Ankylo , EM_RoleValue_RoomID )

	local Width = 60
	local Height = 90

	local Snake = {}
	local SnakeBornPosition = LuaPE_ZONE8_02SCA_FormationPosition( X , Y , Z , Width , Height , Dir )

	for i = 1 , SnakeNum do
		if SnakeID[i] ~= nil then
			Snake[i] = CreateObj( SnakeID[i] , SnakeBornPosition["X"][i], SnakeBornPosition["Y"][i] , SnakeBornPosition["Z"][i] , Dir , 1 )
			WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )	-- �Ψ�������
			AddToPartition( Snake[i] , RoomID )
			MoveToFlagEnabled( Snake[i] , false )	-- �������޼@��
			table.insert( LuaPE_ZONE8_02SCA_Obj , Snake[i] )
			SetPlot( Snake[i] , "DEAD" , "LuaPE_ZONE8_02SCA_SnakeDead" , 0 )	-- �]�w���`�@��
		end
	end

	LuaPE_ZONE8_02SCA_Var[4] = Snake

	return Ankylo;	-- �^�ǹB���K���s��ID
end



--==================================================--
--  �ɵ��d�I��  ���ʪ�t��                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloDo()
	local Var = LuaPE_ZONE8_02SCA_Var

	local FlagObjID = 780462 
	local FlagGoID = 1	-- �q�� 1 �I�}�l��
	local Range = 10
	local Width = 60
	local Height = 90
	local CheckDis = 50
	local SnakeNum = 5	-- �o��u���� �e�򥪥k���䪺�@��

	local Leader = Var[1]
	local Ankylo = Var[2]
	local Snake = Var[4]

	local FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
	local FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
	local FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )

	local AnkyloDir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Ankylo , EM_RoleValue_RoomID )
	PreviousDir = AnkyloDir

	local IsAttack = 0
	local Wude = 0 -- �۾��W�L�Ī��A

	MoveDirect( Ankylo , FlagX , FlagY , FlagZ )	-- �K���s����

	while true do
		local Phase = LuaPE_ZONE8_02SCA_Phase

		Sleep( 10 )
		local AnkyloX = ReadRoleValue( Ankylo , EM_RoleValue_X )
	 	local AnkyloY = ReadRoleValue( Ankylo , EM_RoleValue_Y )
	 	local AnkyloZ = ReadRoleValue( Ankylo , EM_RoleValue_Z )
		local AnkyloDir = ReadRoleValue( Ankylo , EM_RoleValue_Dir )

		if math.abs( AnkyloX - FlagX ) < Range and math.abs( AnkyloZ - FlagZ ) < Range then	-- ����w�I�]�w�U�@�I��m
			FlagGoID = FlagGoID + 1
			FlagX = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_X )
			FlagY = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Y )
			FlagZ = GetMoveFlagValue( FlagObjID , FlagGoID , EM_RoleValue_Z )
			FlagX = FlagX + Rand( Range ) * 2 - Range + 1
			FlagZ = FlagZ + Rand( Range ) * 2 - Range + 1
			MoveDirect( Ankylo , FlagX , FlagY , FlagZ )	-- �K���s����
		end

		local DeltaDir = math.abs( PreviousDir - AnkyloDir )	--��V�B�z�A�ݬO�_�ݭn�ܤư}����m
		if DeltaDir > 90 and DeltaDir < 270 then	-- �ܤư}����m
			local tmp = 0
			if Snake[1] ~= nil and Snake[6] ~= nil then
				tmp = Snake[1]
				Snake[1] = Snake[6]
				Snake[6] = tmp
			end
			if Snake[2] ~= nil and Snake[5] ~= nil then
				tmp = Snake[2]
				Snake[2] = Snake[5]
				Snake[5] = tmp
			end
			if Snake[3] ~= nil and Snake[4] ~= nil then
				tmp = Snake[3]
				Snake[3] = Snake[4]
				Snake[4] = tmp
			end
		end
		PreviousDir = AnkyloDir

		local SnakePosition = LuaPE_ZONE8_02SCA_FormationPosition( AnkyloX , AnkyloY , AnkyloZ , Width , Height , AnkyloDir )	-- �p��Ө��쪺��m

		for i = 1 , SnakeNum do
			if Snake[i] ~= nil and CheckID( Snake[i] ) == true and ReadRoleValue( Snake[i] , EM_RoleValue_IsNPC ) == 1 then	-- �O�_ NPC �B�s�b
				if ReadRoleValue( Snake[i] , EM_RoleValue_IsAttackMode ) == 1 and ReadRoleValue( Snake[i] , EM_RoleValue_IsDead ) ~= 1 then	--  �b�԰��� �B ����
					local AttackTargetID = ReadRoleValue( Snake[i] , EM_RoleValue_AttackTargetID )
					for j = 1 , SnakeNum do
						if Snake[j] ~= nil then
							SetAttack( Snake[j] , AttackTargetID )	-- �Ҧ��H����
						end
					end
					IsAttack = 1
				else
					IsAttack = 0
					MoveToFlagEnabled( Snake[i] , false )  --�԰��L��|���}�A�ҥH�ݭn�A���@��
--					local Snake = Snake[i]
					local DeltaX = math.abs( SnakePosition["X"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_X ) )
					local DeltaY = math.abs( SnakePosition["Y"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_Y ) )
					local DeltaZ = math.abs( SnakePosition["Z"][i]-ReadRoleValue( Snake[i] , EM_RoleValue_Z ) )
					if DeltaX > CheckDis or DeltaY > CheckDis or DeltaZ > CheckDis then
						WriteRoleValue( Snake[i] , EM_RoleValue_IsWalk , 0 )
						if DeltaX < 3*CheckDis or DeltaY < 2*CheckDis or DeltaZ < 3*CheckDis then
							if FlagGoID ~= 10 then
								local CastTime = SetPos( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] , AnkyloDir )
							else
								local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
							end
						elseif DeltaX < 2*CheckDis and DeltaY < 2*CheckDis and DeltaZ < 2*CheckDis then
							local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
						else
							local CastTime = Move( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
						end
					else
						if FlagGoID ~= 10 then
							WriteRoleValue( Snake[i] , EM_RoleValue_IsWalk , 1 )
						end
						local CastTime = MoveDirect( Snake[i] , SnakePosition["X"][i] , SnakePosition["Y"][i] , SnakePosition["Z"][i] )
					end
				end
			end
		end

		local SnakeDeadNum = Var[5]
		if IsAttack == 1 and SnakeDeadNum < SnakeNum then	-- ���� �٨S����
			if Phase == 1 or Phase == 3 then
				LuaPE_ZONE8_02SCA_Message( 3 , C_DEFAULT )
				LuaPE_ZONE8_02SCA_Phase = 2
			end
			SetModeEX( Ankylo , EM_SetModeType_Move , false )	-- ������
			Hide( Ankylo )
			Show( Ankylo , RoomID )
		elseif IsAttack == 0 and SnakeDeadNum < SnakeNum then	-- ������� �٨S����
			if Phase == 2 then
				LuaPE_ZONE8_02SCA_Message( 4 , C_SYSTEM )
				LuaPE_ZONE8_02SCA_Phase = 3
			end
			SetModeEX( Ankylo , EM_SetModeType_Move , true )	-- ����
			MoveDirect( Ankylo , FlagX , FlagY , FlagZ )		-- �K���s����
		elseif SnakeDeadNum == SnakeNum then
			if Phase == 2 then
				LuaPE_ZONE8_02SCA_Message( 5 , C_DEFAULT )
				LuaPE_ZONE8_02SCA_Phase = 4
			end
			if ReadRoleValue( Ankylo , EM_RoleValue_IsAttackMode ) ~= 1 then
				SetModeEX( Ankylo , EM_SetModeType_Move , true )	-- ����
				MoveDirect( Ankylo , FlagX , FlagY , FlagZ )		-- �K���s����
			end
		end

		if FlagGoID == 10 then
			if Wude == 0 and SnakeDeadNum < SnakeNum then
				Wude = 1
				LuaPE_ZONE8_02SCA_Message( 8 , C_DEFAULT )

				WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 0 )		-- �ζ]������
				Hide( Ankylo )
				Show( Ankylo , RoomID )

				for k = 1 , SnakeNum do
					if Snake[k] ~= nil then
						SetModeEx( Snake[k] , EM_SetModeType_Strikback , false )	-- ����
						SetModeEx( Snake[k] , EM_SetModeType_Searchenemy , false )	-- ����
						SetModeEx( Snake[k] , EM_SetModeType_Fight , false )	-- �i�������
						WriteRoleValue( Snake[k] , EM_RoleValue_IsWalk , 0 )		-- �ζ]������
						Hide( Snake[k] )
						Show( Snake[k] , RoomID )
					end
				end
			end
		elseif FlagGoID == 11 then
			if Wude == 1 and SnakeDeadNum < SnakeNum then
				Wude = 2
				LuaPE_ZONE8_02SCA_Message( 9 , C_SYSTEM )

				WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 1 )		-- �Ψ�������
				Hide( Ankylo )
				Show( Ankylo , RoomID )

				for l = 1 , SnakeNum do
					if Snake[l] ~= nil then
						SetModeEx( Snake[l] , EM_SetModeType_Strikback , true )	-- ����
						SetModeEx( Snake[l] , EM_SetModeType_Searchenemy , true )	-- ����
						SetModeEx( Snake[l] , EM_SetModeType_Fight , true )	-- �i�������
						WriteRoleValue( Snake[l] , EM_RoleValue_IsWalk , 1 )		-- �Ψ�������
						Hide( Snake[l] )
						Show( Snake[l] , RoomID )
					end
				end
			end
		elseif FlagGoID == 15 then
			if CheckID( Ankylo ) == true then
				DelObj( Ankylo )
			end
			for i = 1 , SnakeNum do
				if Snake[i] ~= nil then
					if CheckID( Snake[i] ) == true then
						DelObj( Snake[i] )
					end
				end
			end
			LuaPE_ZONE8_02SCA_Message( 7 , C_SYSTEM )
			BeginPlot( Leader , "LuaPE_ZONE8_02SCA_Reset" , 0 )	-- ���m
			break;
		end
	end
end
--==================================================--



--==================================================--
--  �ɵ��d�I��  ���`�B�z��                          --
--==================================================--
function LuaPE_ZONE8_02SCA_AnkyloDead()
	LuaPE_ZONE8_02SCA_Phase = 5
	LuaPE_ZONE8_02SCA_Message( 6 , C_DEFAULT )
	CallPlot( OwnerID() , "LuaPE_ZONE8_02SCA_AnkyloDeadDo" , TargetID() )
	return false
end
function LuaPE_ZONE8_02SCA_AnkyloDeadDo( NowTarget )

	local AnkyloID = 102713		-- �B���K���s
	local Ankylo2ID = 102714	-- �����K���s
	local Player = OwnerID()
	local WoodBoxID = { 113714 , 113714 , 113714 , 113714 , 113714 }
	local BarricoID = { 113715 , 113715 , 113715 , 113715 , 113715 }

	local X = ReadRoleValue( Player , EM_RoleValue_X )
 	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
 	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Dir = ReadRoleValue( Player , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Angle = Dir
	local Width = 30
	local High = 20

	SetModeEX( Player , EM_SetModeType_Move , false )	-- ������
	CastSpell( Player , Player , 494395 )	-- �z���S��
	Sleep( 10 )

	-- ���͸˹��Τ��Y
	local WoodBox = {}
	local Barrico = {}
	for i = 1 , 3 do
		WoodBox[i] = CreateObj( WoodBoxID[i] , X-Width*math.sin(Angle*math.pi/180-Rand(Width)) , Y+High , Z-Width*math.cos(Angle*math.pi/180-Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( WoodBox[i] , RoomID )
		BeginPlot( WoodBox[i] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		WoodBox[i+3] = CreateObj( WoodBoxID[i] , X+Width*math.sin(Angle*math.pi/180+Rand(Width)) , Y+High , Z+Width*math.cos(Angle*math.pi/180+Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( WoodBox[i+3] , RoomID )
		BeginPlot( WoodBox[i+3] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		Barrico[i] = CreateObj( BarricoID[i] , X-Width*math.sin(Angle*math.pi/180-Rand(Width)) , Y+High , Z-Width*math.cos(Angle*math.pi/180-Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( Barrico[i] , RoomID )
		BeginPlot( Barrico[i] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
		Barrico[i+3] = CreateObj( BarricoID[i] , X+Width*math.sin(Angle*math.pi/180+Rand(Width)) , Y+High , Z+Width*math.cos(Angle*math.pi/180+Rand(Width)) , Dir+Rand(360) , 1 )
		AddToPartition( Barrico[i+3] , RoomID )
		BeginPlot( Barrico[i+3] , "LuaPE_ZONE8_02SCA_WoodBoxLife" , 0 )
	end

	-- �����_�c
	local BowBox1 = CreateObj( 113716 , X-Width*math.sin(Angle*math.pi/180) , Y+High , Z-Width*math.cos(Angle*math.pi/180) , Dir+90 , 1 )
	local BowBox2 = CreateObj( 113716 , X+Width*math.sin(Angle*math.pi/180) , Y+High , Z+Width*math.cos(Angle*math.pi/180) , Dir-90 , 1 )
	table.insert( LuaPE_ZONE8_02SCA_Obj , BowBox1 )
	table.insert( LuaPE_ZONE8_02SCA_Obj , BowBox2 )
	SetModeEx( BowBox1 , EM_SetModeType_Obstruct , true )		-- ����
	SetModeEx( BowBox2 , EM_SetModeType_Obstruct , true )		-- ����
	AddToPartition( BowBox1 , RoomID )
	AddToPartition( BowBox2 , RoomID )
	SetPlot( BowBox1 , "TOUCH" , "LuaPE_ZONE8_02SCA_BowBox1" , 15 )
	SetPlot( BowBox2 , "TOUCH" , "LuaPE_ZONE8_02SCA_BowBox2" , 15 )

	-- ���ͼ����K���s
	local Ankylo2 = CreateObjByObj( Ankylo2ID , Player )
	table.insert( LuaPE_ZONE8_02SCA_Obj , Ankylo2 )				-- �K���s�[�J����޲z
	BeginPlot( Ankylo2 , "LuaPE_ZONE8_02SCA_Ankylo2Life" , 0 )
	SetPlot( Ankylo2 , "DEAD" , "LuaPE_ZONE8_02SCA_Ankylo2Dead" , 0 )	-- �]�w���`�@��
	SetAttack( Ankylo2 , NowTarget )					-- ���������B���K���s����H

	DelObj( Player )
	Sleep( 5 )

end
function LuaPE_ZONE8_02SCA_WoodBoxLife()
	local LifeTime = 50

	Sleep( LifeTime )
	if CheckID( OwnerID() ) == true then
		DelObj( OwnerID() )
	end
end
function LuaPE_ZONE8_02SCA_BowBox1()	-- �}�_�c�ʧ@
	local AlreadyOpen = 0

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 or CheckID( TargetID() ) == false then
		AlreadyOpen = 1
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )

	if AlreadyOpen == 0 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			--Say(OwnerID() , EmptyPacketCount( OwnerID() ) )
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return			
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			local BoxContentID , BoxContentNum = LuaPE_ZONE8_02SCA_BoxContent()
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			for i = 1 , table.getn(BoxContentID) do
				GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
				Sleep(5)
			end
			Sleep( 10 )
			DelObj( TargetID() )
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_02SCA_BowBox2()	-- �}�_�c�ʧ@
	local AlreadyOpen = 0

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 or CheckID( TargetID() ) == false then
		AlreadyOpen = 1
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )

	if AlreadyOpen == 0 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return			
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- ���\
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			local BoxContentID , BoxContentNum = LuaPE_ZONE8_02SCA_BoxContent()
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
			for i = 1 , table.getn(BoxContentID) do
				GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
				Sleep(5)
			end
			Sleep( 10 )
			DelObj( TargetID() )
		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_02SCA_Ankylo2Life()	-- �����K���s���ͦs�ɶ�
	local LifeTime = 3000	-- ������

	Sleep( LifeTime )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			if CheckID( OwnerID() ) == true then
				local Reset = LuaPE_ZONE8_02SCA_Ankylo2Dead()
				DelObj( OwnerID() )
			end
			break;
		end
		Sleep( 5 )
	end
end
function LuaPE_ZONE8_02SCA_Ankylo2Dead()	-- �����K���s�]���`�N���m��Ӥ���
	local Leader = LuaPE_ZONE8_02SCA_Var[1]

	BeginPlot( Leader , "LuaPE_ZONE8_02SCA_Reset" , 0 )
	return true
end
function LuaPE_ZONE8_02SCA_SnakeDead()
	local Var = LuaPE_ZONE8_02SCA_Var

	local Ankylo = Var[2]
	local Snake = Var[4]
	local SnakeDeadNum = Var[5]
	local RoomID = 0

	local SnakeNum = 5	-- �o��u���� �e�򥪥k���䪺�@��

	for i = 1 , SnakeNum do
		if Snake[i] ~= nil then
			if Snake[i] == OwnerID() then
				SnakeDeadNum = SnakeDeadNum + 1
				LuaPE_ZONE8_02SCA_Var[5] = SnakeDeadNum
				table.remove( Snake , i )	
				break;
			end
		end
	end

	if SnakeDeadNum >= SnakeNum then	--�u������
		SetModeEx( Ankylo , EM_SetModeType_Mark , true )		-- �аO
		SetModeEx( Ankylo , EM_SetModeType_Strikback , true )		-- ����
		SetModeEx( Ankylo , EM_SetModeType_Searchenemy , true )		-- ����
		SetModeEx( Ankylo , EM_SetModeType_Fight , true )		-- �i�������
		WriteRoleValue( Ankylo , EM_RoleValue_IsWalk , 0 )		-- �Ψ�������
		Hide( Ankylo )
		Show( Ankylo , RoomID )
	end
end
--==================================================--



--==================================================--
--  �ɵ��d�I��  �ҰʳB�z��                          --
--==================================================--
function LuaPE_ZONE8_02SCA_Reset()
	local ResetTime = LuaPE_ZONE8_02SCA_Var[11]		-- ��
	local Mode = 1

	LuaPE_ZONE8_02SCA_Message( 11 , C_SYSTEM )
	Sleep( ResetTime*10 )
	LuaPE_ZONE8_02SCA_Start( Mode )
end
--==================================================----==================================================--
function LuaPE_ZONE8_02SCA_BoxContent()

	local BoxContentID = {}
	local BoxContentNum = {}

	BoxContentID[1] = 206249	-- �@�U���ѥ�
	BoxContentNum[1] = 2

	BoxContentID[2] = 206250	-- �@�U�Ť�
	BoxContentNum[2] = 1

	local RNDType = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	
	if RNDType > 1 and RNDType <= 50 then
		local MaterialID = {}	-- ����LV53
		MaterialID[1] = 200242	-- ���K�q
		MaterialID[2] = 200306	-- ������
		MaterialID[3] = 200345	-- ��۱�
		local MaterialNum = {}
		MaterialNum[1] = 20
		MaterialNum[2] = 20
		MaterialNum[3] = 20

		BoxContentID[3] = MaterialID[1]	-- ���K�q
		BoxContentNum[3] = MaterialNum[1]
		BoxContentID[4] = MaterialID[2]	-- ������
		BoxContentNum[4] = MaterialNum[2]
		BoxContentID[5] = MaterialID[3]	-- ��۱�
		BoxContentNum[5] = MaterialNum[3]


		local MaterialRuneID = {}	-- �Ͳ��Ť�
		MaterialRuneID[1] = 200850	-- �s��
		MaterialRuneID[2] = 200851	-- �N�o
		MaterialRuneID[3] = 200852	-- ����
		MaterialRuneID[4] = 200853	-- ����
		MaterialRuneID[5] = 200854	-- �¤�
		MaterialRuneID[6] = 200855	-- �V�X
		local MaterialRuneNum = {}
		MaterialRuneNum[1] = 10
		MaterialRuneNum[2] = 10
		MaterialRuneNum[3] = 10
		MaterialRuneNum[4] = 10
		MaterialRuneNum[5] = 10
		MaterialRuneNum[6] = 10

		local RND1 = Rand( 6 ) + 1	-- ���� 1~6 ���ü�
		BoxContentID[6] = MaterialRuneID[RND1]	-- �Ͳ��Ť�
		BoxContentNum[6] = MaterialRuneNum[RND1]

	elseif RNDType > 50 and RNDType <= 100 then
		local PotionID = {}	--  ���e�Ĥ�
		PotionID[1] = 204889	-- ���F�į�
		PotionID[2] = 204890	-- ���F������
		PotionID[3] = 200229	-- �j��������
		PotionID[4] = 200270	-- �j���F�P�Ĥ�
		local PotionNum = {}
		PotionNum[1] = 10
		PotionNum[2] = 10
		PotionNum[3] = 4
		PotionNum[4] = 4

		BoxContentID[3] = PotionID[1]	-- ���F�į�
		BoxContentNum[3] = PotionNum[1]
		BoxContentID[4] = PotionID[2]	-- ���F������
		BoxContentNum[4] = PotionNum[2]
		BoxContentID[5] = PotionID[3]	-- �j��������
		BoxContentNum[5] = PotionNum[3]
		BoxContentID[6] = PotionID[4]	-- �j���F�P�Ĥ�
		BoxContentNum[6] = PotionNum[4]
	end

	return BoxContentID , BoxContentNum;

end