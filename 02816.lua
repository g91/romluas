--781256		�гy�Ѥl��l�ѷӪ��X��
--�Ѥl��Register1	��ܴѤlX�b
--�Ѥl��Register1	��ܴѤlY�b
--�Ѥl��PID		��ܴѤl�ѷ�flag�s�� & �btable������m
--���a��Register10	�ΨӬ���NPC���s��
--NPC��Register8	�ΨӬ����{�b���W���h�֤l�ܦ�F�A�p�G�ܦ⪺�l�F25�N�P�w����
--NPC��Register9	�Ψӱ���h�Ӫ��a�P�ɱo���ɡA�T�����n���ƥX�{���}����
--NPC��Register10	�ΨӬ�������


function FireDay2013_test()
	AddBuff(OwnerID(), 623957, 0, -1)
end

function FireDay2013_Chess_ControlCenter()	--���������󲣥ͼ@��
	local Control = OwnerID()
	local RoomID = ReadRoleValue( Control, EM_RoleValue_RoomID )
	
	if FireDay121738 == nil then
		FireDay121738 = {}
	end

	for x = 0, 4 do
		-- �إx�y
		for y = 1, 5 do
			local Pos = (x*5) + y
			local stone = CreateObjByFlag( 121742 , 781256 , Pos , 1 )
			SetModeEx( stone, EM_SetModeType_Gravity, false )--���O
			SetModeEx( stone, EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( stone, EM_SetModeType_Mark, false )--�аO
			SetModeEx( stone, EM_SetModeType_Obstruct, false ) --����
			AddToPartition(stone , RoomID)
			local x_stone = ReadRoleValue(stone, EM_RoleValue_X )
			local y_stone =ReadRoleValue(stone, EM_RoleValue_Y  )
			local z_stone = ReadRoleValue(stone, EM_RoleValue_Z )

		--	local Chess = CreateObjByFlag( 121746 , 781256 , Pos , 1 )
			local Chess = CreateObj( 121746 , x_stone , y_stone+3 , z_stone , 0 , 1)
			WriteRoleValue( Chess, EM_RoleValue_Register1, x )		-- �g�JX�y��
			WriteRoleValue( Chess, EM_RoleValue_Register2, y )		-- �g�JY�y��
			WriteRoleValue( Chess, EM_RoleValue_PID, Pos )
			WriteRoleValue( Chess, EM_RoleValue_Register10, Control )
			SetModeEx( Chess, EM_SetModeType_Gravity, false )--���O
			SetModeEx( Chess, EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Chess, EM_SetModeType_Obstruct, false ) --����
			AddToPartition(Chess , RoomID)
			table.insert( FireDay121738, Pos, Chess )
			CallPlot(  Chess, "FireDay2013_Chess_CreatSet", 0 )
			-- ��ХX�Ӫ��Ѥl�����O������ܼ� FireDay121738 �̭�
		end
	end
end

function FireDay2013_Chess_CreatSet()	--���b�Ѥl�W�����󲣥ͼ@��
	local Chess = OwnerID()

	SetModeEx( Chess , EM_SetModeType_Strikback, false )		--����
	SetModeEx( Chess , EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
	SetModeEx( Chess , EM_SetModeType_Obstruct, false )		--����
	SetModeEx( Chess , EM_SetModeType_Mark, true )			--�аO
	SetModeEx( Chess , EM_SetModeType_Move, false )			--����
	SetModeEx( Chess , EM_SetModeType_Searchenemy, false )	--����
	SetModeEx( Chess , EM_SetModeType_HideName, true )		--�W��
	SetModeEx( Chess , EM_SetModeType_ShowRoleHead, false )	--�Y����
	SetModeEx( Chess , EM_SetModeType_Fight , false )			--�i�������
	SetModeEx( Chess , EM_SetModeType_DisableRotate, false )	--��V
	SetPlot( Chess, "touch", "FireDay2013_Chess_Touch", 30 )
end

function FireDay2013_Chess_Touch()
	local Player = OwnerID()
	local Chess = TargetID()
	local MainNPC = ReadRoleValue( Chess, EM_RoleValue_Register10 )		-- �q�Ѥl��Register10�hŪ��NPC�O��
	--/*
	local BuffID = { 623957, 623958, 623956 }	-- �̧Ǭ����B�šB��
	local ChessColor = 0				-- �M�w�n�m�����Ѥl���C��
	local ChessCount = ReadRoleValue( MainNPC, EM_RoleValue_Register8 )		-- �����{�b���W���h�֤l�ܦ�F
	--/*
	for b = 1, 4 do					-- �T�w���a���W���O�����C��A�M���Buff�R��
		if b == 4 then				-- �|�]��4��ܪ��a�èS�����ʻݨD���C��Buff
			ScriptMessage( Player , Player , 1 , "[SC_2013FIRE_EV1_MSG_09]" , 0  )   -- �A�������Ť��
			ScriptMessage( Player , Player , 0 , "[SC_2013FIRE_EV1_MSG_09]" , 0  )   -- �A�������Ť��
			return
		elseif CheckBuff( Player, BuffID[b] ) == true then
			ChessColor = BuffID[b]
			CancelBuff( Player, BuffID[b] )
			break
		end
	end
	--/*
	local ObjID = { [623957] = 121739, [623958] = 121740, [623956] = 121741 }		-- �n�ܦ⪺�X�l����A�̧Ǭ����B�šB���A�}�C����m�O����BuffID
	local SEID = { [623957] = 850575, [623958] = 850575, [623956] = 850575 }		-- �s�u���\���h���S�ġA�̧Ǭ����B�šB���A�}�C����m�O����BuffID
	local CheckNum = { 	[1] = { 1, 0 };		-- ��					-- �o�}�C���\��O�Ψӭp��XY�y�Ъ��첾
				[2] = { 0, 1 };		-- ��
				[3] = { 1, 1 };		-- �k��
				[4] = { -1, 1 };	}	-- ����
	local cX = ReadRoleValue( Chess, EM_RoleValue_Register1 )		-- �������a��m�����@�l��X�y��
	local cY = ReadRoleValue( Chess, EM_RoleValue_Register2 )		-- �������a��m�����@�l��Y�y��
	local Pos = ReadRoleValue( Chess, EM_RoleValue_PID )
	--/*
	SetPlot( Chess, "touch", "", 0 )						--��Ĳ�I�@�������A�]���n�ܦ�F
	ChangeObjID( Chess, ObjID[ChessColor])					--�m���Ѥl�A���Ѥl�ܦ�
	ChessCount = ChessCount + 1						--�w�g�ܦ⪺�Ѥl�ƶq+1
	--/*
	local LineNum = 0
	local ChessNum = 1		-- �򥻩�U���o�@�l�N���
	local ChessTable = {}

	for x = 1, 4 do			-- �̧ǧP�_ ��/��/�k��/���סA�@4��
		local TempChess = 0	-- �p��o�զ��X�l���Ȯɭ�
		local TempTable = {}	-- �����o�զ����X�Ӥl���Ȯɭ�
		for  y = 1, 2 do			-- �P�_ "+ -" ��V
			local NewNum= { 1, -1 }	-- 1�O"��+" 2�O"��-"
			local NewX = cX
			local NewY = cY
			for z = 1, 4 do	-- ���~�P�_�̦h4��
				NewX = NewX + CheckNum[x][1] * NewNum[y]		-- �p��P�_�L�h���s��mX�y��
				NewY = NewY + CheckNum[x][2] * NewNum[y]		-- �p��P�_�L�h���s��mY�y��
				if NewX > 4 or NewX < 0 or NewY > 5 or NewY < 1 then	--�P�_���L�W�L���
					break
					-- �P�_�p�G�o�Ӥ�V�w�g�W�X��ءA�N�����������A���o�Ӥ�V�ˬd�L�h
				end
				--/*
				local NewPos = (NewX*5) + NewY		-- �p��P�_�ηs��m���s��
				local NewChess = FireDay121738[NewPos]	-- �s�s�����Ѥl�O��
				local NewObjID = ReadRoleValue( NewChess, EM_RoleValue_OrgID )
				if NewObjID == ObjID[ChessColor] then	-- �����U�h�����l�O�_�P��
					TempChess = TempChess + 1
					table.insert( TempTable, NewChess )
				else
					break					--���P��N����
				end
			end
		end
		-- �p�⧹�@�դ�V����A�ݳo�զ��S���W�L3�l�A�p�G�����ܪ�ܦ��s���@���u
		if TempChess >= 2 then				-- ��2�O�]���[�W��U�h�����l�N��3�l�F
			LineNum = LineNum + 1			--�������\�s�u��+1
			ChessNum = ChessNum + TempChess	--���\�s�u���l��i�h
			for p = 1, table.getn(TempTable) do
			table.insert( ChessTable, TempTable[p] )	--�T�w�s�u���\����A��iChessTable���N�O���U�o����n�������l
			end
		end
	end
	-- �̫��X��LineNum�ƶq���\�s�u�ơBChessNum�N�O�o�ǳs�u�ۥ[�`�@�X�l
	--�o������������Mika�����G(��o����)= (�s�u��*�X�l)
	if LineNum >= 1 then
		local OrgScroe = ReadRoleValue( MainNPC, EM_RoleValue_Register10 )		-- NPC���W�ҰO���{������
		local AddScore = LineNum * ChessNum						-- �o���s�u���\�[������
		OrgScroe = OrgScroe + AddScore
		WriteRoleValue( MainNPC, EM_RoleValue_Register10, OrgScroe )
		--/*
	--	Sleep(10)  -- mika - ��hide�o�q
		table.insert( ChessTable, Chess )
		for i = 1, table.getn( ChessTable ) do							-- �⦳������l���ܦ^�զ�
			SysCastSpellLv( ChessTable[i], ChessTable[i], SEID[ChessColor], 0)		-- �s�u���\���h���S�ġA�|�����C��
			SysCastSpellLv( ChessTable[i], Player, 850584, 0)				-- �s�u���\�A���a��o���ƯS��
			ChangeObjID( ChessTable[i], 121746 )					-- ����
			SetPlot( ChessTable[i], "touch", "FireDay2013_Chess_Touch", 30 )		-- �ܦ^�զ�N��Ĳ�I�@���A�}
		end
		ChessCount = ChessCount - ChessNum						--�w�g�ܦ⪺�Ѥl�ƶq - ���h���Ѥl�ƶq
		-- mika�W�[ �i�D���a��U���� 
		local FireDayChessGotScoreIng = ReadRoleValue( MainNPC, EM_RoleValue_Register9 )
		if FireDayChessGotScoreIng == 0  then
			WriteRoleValue( MainNPC, EM_RoleValue_Register9, 1 )			--  �o��ing
			for j = 1, #FireDayChessPlayers do
				ScriptMessage( FireDayChessPlayers[j] , FireDayChessPlayers[j] , 1 , "[SC_2013FIRE_EV1_MSG_07][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )   -- �s�u���\�I�ثe�����Ƭ�[$VAR1]��
				ScriptMessage( FireDayChessPlayers[j] , FireDayChessPlayers[j] , 0 , "[SC_2013FIRE_EV1_MSG_07][$SETVAR1="..OrgScroe.."]" , C_SYSTEM  )   -- �s�u���\�I�ثe�����Ƭ�[$VAR1]��
			end
			WriteRoleValue( MainNPC, EM_RoleValue_Register9, 0 )			--  �o������
		end
	end
	--/*
	AddBuff( Player, BuffID[DW_Rand(3)], 0, -1 )					-- �H���������a�C��Buff
	WriteRoleValue( MainNPC, EM_RoleValue_Register8, ChessCount )	-- ����W�ܦ�l���ƶq�g�^�hNPC���W�A��K�P�_�O�_�w�g����
end

function FireDay2013_Chess_Reboot()	-- �C�������ɭ��m���W�Ҧ��X�l
	for i = 1, table.getn(FireDay121738) do
		local ObjID =  ReadRoleValue( FireDay121738[i], EM_RoleValue_OrgID )
		if ObjID ~= 121746 then
			ChangeObjID( FireDay121738[i], 121746 )
			SetPlot( FireDay121738[i], "touch", "FireDay2013_Chess_Touch", 30 )		-- �ܦ^�զ�N��Ĳ�I�@���A�}
		end
	end
end