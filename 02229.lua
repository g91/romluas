function Lua_Hao_Tell_All_Reg_PID( Obj ) -- Ū�����a�� PID �� Reg��

	--	EM_RoleValue_Register = EM_RoleValue_Register1
	--	EM_RoleValue_Register1 = EM_RoleValue_Register+0
	--	EM_RoleValue_Register2 = EM_RoleValue_Register+1
	--	EM_RoleValue_Register3 = EM_RoleValue_Register+2
	--	EM_RoleValue_Register4 = EM_RoleValue_Register+3
	--	EM_RoleValue_Register5 = EM_RoleValue_Register+4
	--	EM_RoleValue_Register6 = EM_RoleValue_Register+5
	--	EM_RoleValue_Register7 = EM_RoleValue_Register+6
	--	EM_RoleValue_Register8 = EM_RoleValue_Register+7
	--	EM_RoleValue_Register9 = EM_RoleValue_Register+8
	--	EM_RoleValue_Register10 = EM_RoleValue_Register+9
	
	if Obj == Nil then
		Obj = OwnerID()
	end

	local Reg
	local PID = ReadRoleValue( Obj , EM_RoleValue_PID )

	DebugMsg( 0 , 0 , "PID ="..PID )
	Say( Obj , "PID ="..PID )
	for i = 0 , 9 , 1 do
		Reg =  ReadRoleValue( Obj , EM_RoleValue_Register+i )
		Say( Obj , "Reg".."+"..i.." = "..Reg )
		DebugMsg( 0 , 0 , "Reg".."+"..i.." = "..Reg )
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPCofAll_Clear( ObjID , Range ) -- �M���ϰ�νd�򤺪��Ҧ�����

	local NpcID = ObjID
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local T1Obj , NewID

	if Range == nil or Range <= -1 then
		local Count = SetSearchAllNPC( RoomID )
		local Obj
		local NPC = { ObjID }
		local Number = 0
		if  Count ~= 0 then
			for i=1 , Count , 1 do
				local ID = GetSearchResult()
				Obj=Role:New(ID)
				if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
					for j = 1 , table.getn( NPC ) , 1 do
						if Name == NPC[j] then  --�Y���}�C������
						--	SetModeEx( ID , EM_SetModeType_Revive , false )	-- ��������
						--	SetModeEx( ID , EM_SetModeType_Save , false )	-- �����x�s
							DelObj( ID )
							Number = Number + 1
						end
					end
				end
			end
		end
		DebugMsg( OwnerID() , 0 , "Del "..Number )

	else
		local Count = SetSearchRangeInfo( OwnerID() , Range )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
		for i = 1 , Count , 1 do
			local T1ID = GetSearchResult()	-- �^�ǽd�򤺩Ҧ����� GitemID
		--	Say( T1ID , "0" )
			if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- �Y�� NPC ��...
		--		Say( T1ID , "1" )
				T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- Ū���Ӫ��� OrgID
				if NpcID == T1Obj then
				--	Say( T1ID , "2" )
					if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- �Y���D���a�è��� Room
					--	Say( T1ID , "3" )
						DelObj( T1ID )
					end
				end
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPCofAll_Clear_Test()

	Lua_Hao_NPCofAll_Clear( 113105 , 1000 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_NPC_Range_Search( ObjID , SearchID , Range ) -- �^���d�򤺪����w���󦳴X��

	local RoomID , Number = ReadRoleValue( ObjID , EM_RoleValue_RoomID )  , 0
	local Count = SetSearchRangeInfo( ObjID , Range )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
	local T1Obj
	for i = 1 , Count , 1 do
		local T1ID = GetSearchResult()	-- �^�ǽd�򤺩Ҧ����� GitemID
	--	Say( T1ID , "0" )
		if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- �Y�� NPC ��...
	--		Say( T1ID , "1" )
			T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- Ū���Ӫ��� OrgID
			if SearchID == T1Obj then
			--	Say( T1ID , "2" )
				if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- �Y���D���a�è��� Room
					Number = Number + 1
				--	Say( T1ID , "3" )
				end
			end
		end
	end
--	DebugMsg( 0 , 0 , "Number = "..Number )
	return Number
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Search_NPC_Mode( ObjID )	-- �j�M�Ӱϰ쪺�����󦳴X��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { ObjID }
	local Number = 0

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						Number = Number + 1
					end
				end
			end
		end
		Say( OwnerID() , "Number ="..Number )
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetColdown(ObjID,MagicID,Value)  -- �M���S�wCD�ɶ�( Value ����J�ɲM�����~CD�B = 0 �ɲM��¾�~CD�B = 1 �ɲM���˳�CD )

	local Class = GameObjInfo_Int( MagicID ,"ColdownClass")  -- ��o�Ӫk�N���I�k�N�o��� - ����
	local Type = GameObjInfo_Int( MagicID ,"ColdownType")  -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o����
	local CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�
	local Data

	if CD > 0 then
	--	if Class == 3 then
		--	if Type == 14 or Type == 18 or Type == 19 or Type == 24 then
			if Value == nil then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ,  0 ) 
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type )
--				Say( ObjID , ReadRoleValue( ObjID , EM_RoleValue_Coldown_Item + Type ) )
			elseif Value == 0 then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type ,  0 )
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_Job + Type )
			--	DebugMsg( OwnerID() , 0 , Value.." , Value = "..Value )
			elseif Value == 1 then
				WriteRoleValue( ObjID , EM_RoleValue_Coldown_EQ + Type ,  0 )
				Data = ReadRoleValue( ObjID , EM_RoleValue_Coldown_EQ + Type )
			--	DebugMsg( OwnerID() , 0 , Value.." , Value = "..Value )
			end
				CD = GameObjInfo_Int( MagicID ,"ColdownTime") -- ��o�Ӫk�N���I�k�N�o��즸���� - �N�o�ɶ�
			--	DebugMsg( OwnerID() , 0 , ObjID.." , Data = "..Data )
			--	DebugMsg( OwnerID() , 0 , ObjID.." , Coldown = "..CD )
--				Say( ObjID , "Class = "..Class )
--				Say( ObjID , "Type = "..Type )
--				Say( ObjID , "CD = "..CD )
		--	end
	--	end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Reset_TestMagic()

	Lua_Hao_ResetColdown( OwnerID() , 493069 )
end

function Lua_Mounts_Copilot2()

	Lua_Mounts_Copilot( OwnerID() )
end

function Lua_Mounts_Copilot( ObjID )	-- �����y�ؼСz�O�_�b���H���M���Ʈy�W�A���O�h���� -1 �A�p�G�O�h������ -1

	if ObjID == nil then
		ObjID = OwnerID()
	end
	local Mode = ReadRoleValue( ObjID , EM_RoleValue_AttachObjGUID )
--	DebugMsg( 0 , 0 , "GUID = "..Mode )
	if Mode == -1 then
		return true
	else
		return false
	end
	--�d��
--	if Lua_Mounts_Copilot( OwnerID() ) == false then	-- ��OwnerID()�b�Ʈy��...
--		Say( OwnerID() , "1" )		-- ���ؼеL�k�����o�ӥ���
--	else					-- ��OwnerID()���b�Ʈy��...
--		Say( OwnerID() , "2" )		--���ؼХi�H�����o�ӥ���
--	end
end

function Lua_UseItem_CastingBar( ObjID )	-- �����y�ؼСz�O�_���B��ϥΪ��~�᪺�I�k�����A-1 ����l�ȡB0�����I�k�����A

	local Cast =  ReadRoleValue( ObjID , EM_RoleValue_CastingType )

	if Cast == -1 then
		return false
	else
		return true
	end
	--�d��
--	if Lua_UseItem_CastingBar( OwnerID() ) == true then	-- ��OwnerID()�٦��ϥΪ��~�᪺�I�k����...
--		Say( OwnerID() , "1" )		-- ���ؼеL�k����䥦�ʧ@...
--	else					-- ��OwnerID()�S���ϥΪ��~�᪺�I�k����...
--		Say( OwnerID() , "2" )		--���ؼХi�H����䥦�ʧ@...
--	end
end

function Lua_UseItem_CastingBar_Test()	-- �d��

	if Lua_UseItem_CastingBar( OwnerID() ) == true then	-- ��OwnerID()�٦��ϥΪ��~�᪺�I�k����...
		Say( OwnerID() , "1" )		-- ���ؼеL�k����䥦�ʧ@...
	else					-- ��OwnerID()�S���ϥΪ��~�᪺�I�k����...
		Say( OwnerID() , "2" )		--���ؼХi�H����䥦�ʧ@...
	end
end

function Lua_Dual_Battle( ObjID )	-- �����y�ؼСz�O�_���B��M��

	local Dual = ReadRoleValue( ObjID , EM_RoleValue_DualTargetDBID )

	if Dual ~= 0 then
		return false
	else
		return true
	end
	--�d��
--	if Lua_Dual_Battle( OwnerID() ) == true then	-- ��OwnerID()����H�M����
--		Say( OwnerID() , "1" )		-- ������@��
--	else					-- ��OwnerID()�S����H�M����
--		Say( OwnerID() , "2" )		-- ����@��
--	end
end

function Lua_Check_Flag( Keyitem )

	if CheckFlag( OwnerID() , Keyitem ) == true then
		DebugMsg( 0 , 0 , "You already have "..Keyitem )
	else
		DebugMsg( 0 , 0 , "Miss Keyitem" )
	end
end

function Lua_Hao_Test_Dept_EXP_TP()	-- �վ�t�ť�

	Lua_Hao_Test_Dept_EXP_TP_01( 0 )
end

function Lua_Hao_Test_Dept_EXP_TP_01( X , DebtExp , DebtTp )

	local Time = 0 
	local Key , DialogStatus
	local inputstring = ""

	if DebtExp == nil then
		DebtExp = 0
	end
	if DebtTp == nil then
		DebtTp = 0
	end


	if X == 0 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice DebtExp" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Exp value" , 0 )
	elseif X == 1 then
		DialogCreate( OwnerID() , EM_LuaDialogType_Input , "Choice DebtTp" )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "Please enter Tp value" , 0 )
	end
	DialogSelectStr( OwnerID() , "Accept" )
	DialogSelectStr( OwnerID() , "Cancel" )

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(1)
		Time = Time+1
	 	if Time > 300 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������

		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- ��l�ơB���_

			inputstring = DialogGetInputResult( OwnerID() )

			if DialogStatus == 0 then  -- ����J�r��
				X = X + 1
			--	Say( OwnerID() , "X ="..X )
				if X == 1 then
					DebtExp = inputstring
				--	Say( OwnerID() , "DebtExp ="..DebtExp )
				elseif X == 2 then
					DebtTp = inputstring
				--	Say( OwnerID() , "DebtTp ="..DebtTp )
				end

				if X < 2 then
					return Lua_Hao_Test_Dept_EXP_TP_01( X , DebtExp , DebtTp )
				elseif X == 2 then
					local OldDebtEXP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtExp )
					local OldDebtTP = ReadRoleValue( OwnerID() , EM_RoleValue_DebtTP )
				--	Say( OwnerID() , "OldDebtEXP = "..OldDebtEXP )
				--	Say( OwnerID() , "OldDebtTP = "..OldDebtTP )
					local NewDebtEXP = DebtExp + OldDebtEXP
					local NewDebtTP = DebtTp + OldDebtTP
					local Msg = 0
					if NewDebtEXP >= 0 and NewDebtTP >= 0 then
						ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpEXP and DetpTP" , C_SYSTEM )		--�A�t�Ťw�g�M�ŤF�I
						Msg = 1
					end
					if NewDebtEXP < 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , NewDebtEXP )
					elseif NewDebtEXP >= 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtExp , 0 )
						if Msg == 0 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpEXP" , C_SYSTEM )		--�A�t�Ťw�g�M�ŤF�I
						end
					end
					if NewDebtTP < 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , NewDebtTP )
					elseif NewDebtTP >= 0 then
						WriteRoleValue( OwnerID() , EM_RoleValue_DebtTP , 0 )
						if Msg == 0 then
							ScriptMessage( OwnerID() , OwnerID() , 0 , "Your have no DetpTP" , C_SYSTEM )		--�A�t�Ťw�g�M�ŤF�I
						end
					end
				end
			end
			Key = 1
		else
		end
		if Key == 1 then
			DialogClose( OwnerID() )
			break
		end
	end
end

function Lua_Hao_NPC_Closest_Search( ObjID , SearchID , Range ) -- �HObjID�����߰��d��j�M�A�^�ǽd�򤺳̱���NPC����

	local RoomID , Number = ReadRoleValue( ObjID , EM_RoleValue_RoomID )  , 0
	local Count = SetSearchRangeInfo( ObjID , Range )	-- ���X�d�򤺩Ҧ�����(�t�ۤv)
	local Closest = 9999
	local T1Obj
	local ID = 0
	for i = 1 , Count , 1 do
		local T1ID = GetSearchResult()	-- �^�ǽd�򤺩Ҧ����� GitemID
		local Distance = GetDistance( OwnerID() , T1ID ) 
		if ReadRoleValue( T1ID , EM_RoleValue_IsNPC ) == 1 then -- �Y�� NPC ��...
			T1Obj = ReadRoleValue( T1ID , EM_RoleValue_OrgID )	-- Ū���Ӫ��� OrgID
			if SearchID == T1Obj then
				if ReadRoleValue(  T1ID ,  EM_RoleValue_RoomID ) == RoomID and ReadRoleValue( T1ID , EM_RoleValue_IsPlayer ) ~= 1 then	-- �Y���D���a�è��� Room
				--	Say( T1ID , "OrgID"..T1ID.." Distance ="..Distance )
					if Closest > Distance then
						Closest = Distance
						ID = T1ID
					end
				end
			end
		end
		if i == Count then
		--	Say( ID , "I am close you")
			DebugMsg( OwnerID() , 0 , "Distance = "..Closest.." ID = "..ID )
			return ID
		end
	end
end

function Lua_Hao_Set_GuildResources( Player , Gold , BonusGold , Mine , Wood , Herb , Rune , Stone )	-- �W�[���|�귽
	-- ����B���p�B�q���B����B�į�B�]����ءB���̮֤�
	AddGuildResource( Player , Gold , BonusGold , Mine , Wood  , Herb , Rune , Stone ," " )
end

function Lua_Hao_ReSet_GuildResources( )	-- ���m���|�귽

	local Player = OwnerID()
	local Gold = GuildInfo( Player , EM_GuildInfoType_Resource_Gold )		-- ���
	local BonusGold = GuildInfo( Player , EM_GuildInfoType_Resource_BonusGold )	-- ���p
	local Mine = GuildInfo( Player , EM_GuildInfoType_Resource_Mine )		-- �q��
	local Wood = GuildInfo( Player , EM_GuildInfoType_Resource_Wood )		-- ���
	local Herb = GuildInfo( Player , EM_GuildInfoType_Resource_Herb )		-- �į�
	local Rune = GuildInfo( Player , EM_GuildInfoType_Resource_GuildRune )	-- �]�����
	local Stone = GuildInfo( Player , EM_GuildInfoType_Resource_GuildStone )	-- ���̮֤�

	AddGuildResource( Player , -Gold , -BonusGold , -Mine , -Wood  , -Herb , -Rune , -Stone ," " )
end

function Lua_Hao_Test_Round_wall()
	Lua_Hao_Round_wall( OwnerID() , 113621 , 36 , 100 , 2 )
end
function Lua_Hao_Round_wall( ObjID , CreateID , CreateCount , Distance , Delay )
-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|�B�إߪ���O�_����
	Lua_Hao_NPCofAll_Clear( CreateID , 500 ) 	-- �M��
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local CreateWall
	local CreateID = CreateID -- ��
	local Polygon = CreateCount -- �X�䫬
	local dis = Distance -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , Polygon , 1 do
		CreateWall = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( CreateWall , EM_SetModeType_Strikback , false )--����
		SetModeEx( CreateWall , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( CreateWall , EM_SetModeType_Obstruct , true )--����
		SetModeEx( CreateWall , EM_SetModeType_Mark , false )--�аO
		SetModeEx( CreateWall , EM_SetModeType_Move , false )--����
		SetModeEx( CreateWall , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( CreateWall , EM_SetModeType_HideName , false )--�W��
		SetModeEx( CreateWall , EM_SetModeType_ShowRoleHead , false )--�Y����
		SetModeEx( CreateWall , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( CreateWall , EM_SetModeType_Drag , false )--���O
		SetModeEx( CreateWall , EM_SetModeType_Show , true )--���
		AdjustFaceDir( CreateWall , ObjID , 0 ) 	-- ���إߪ��󭱦V�ѦҪ���
		AddToPartition( CreateWall , RoomID )
		if Delay ~= 0 or Delay ~= nil then
			Sleep(Delay)
		end
	end
end