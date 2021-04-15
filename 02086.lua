--��x����npc�l���
--2010.12.20

function Lua_mika_QTool_create_00()  --�ϥΪ��~����檺�@��
	Beginplot( OwnerID() ,"Lua_mika_QTool_create_01", 0 )
end

function Lua_mika_QTool_create_01()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_SPQUESTSET_SELECT_1]" }   --�ظm���Ǧ������~����NPC-[116662]
	TransferSelect[1] = { "[SC_SPQUESTSET_SELECT_2]"  }  --�ظm�e�H����NPC-[116662]
	TransferSelect[2] = { "[SC_SPQUESTSET_SELECT_3]"  }  --�ظm�e�H����NPC-[116663]
	TransferSelect[3] = { "[SC_SPQUESTSET_SELECT_4]"  }  --��ܥثe�Ҧ������]�w��
	TransferSelect[4] = { "[SC_SPQUESTSET_SELECT_5]" }  --�R���Ҧ����Ǧ������~���Ȭ���NPC
	TransferSelect[5] = { "[SC_SPQUESTSET_SELECT_6]" }  --�R���Ҧ��e�H���Ȭ���NPC
	TransferSelect[6] = { "[SC_SPQUESTSET_SELECT_7]" }  --�R���Ҧ����Ȭ������n���~
	TransferSelect[7] = { "[SO_EXIT]" }	-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_01]" )  --�п�ܨϥΥ\��
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		end
		WriteRoleValue(OwnerID() , EM_RoleValue_PID, 0 )   --�M��PID��
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then  --�ظm���Ǧ������~����NPC-116666
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  10 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break
		elseif DialogStatus == 1 then --�ظm�e�H����NPC-1-116662
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID , 20   ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break
		elseif DialogStatus == 2 then --�ظm�e�H����NPC-2-116663
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID , 30   ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_sure", 0 )
			break

		elseif DialogStatus == 3 then  --��ܥثe�Ҧ������]�w��
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			Beginplot( OwnerID() ,"Lua_mika_QTool_ShowValue", 0 )
			break

		elseif DialogStatus == 4 then -- �R���Ҧ����Ǧ������~���Ȭ���NPC
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  50 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure00", 0 )
			break

		elseif DialogStatus == 5 then --�R���Ҧ��e�H���Ȭ���NPC
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  60 ) 
			local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
		--	Say (OwnerID(), "the value is "..value.."" )
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure00", 0 )
			break
		elseif DialogStatus == 6 then --�R���Ҧ����Ȭ������n���~
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_Delkey", 0 )
			break
		elseif DialogStatus == 7 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_QTool_Delkey() --�R���Ҧ����Ȭ������n���~
	Setflag(OwnerID(), 544424, 0 )
	Setflag(OwnerID(), 544425, 0 )
	Setflag(OwnerID(), 544426, 0 )
	Setflag(OwnerID(), 544427, 0 )
	Setflag(OwnerID(), 544708, 0 )
	DebugMsg( 0, RoomID ,"del all quest keyitem !!")
end


------------------------------------��ܥثe�Ҧ������]�w��--------------------------------
function Lua_mika_QTool_ShowValue() --
	local itemid = GetDBKeyValue("ItemID_100") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_100")   --���ȻݨD���ⵥ�� (��x)

	DebugMsg( 0, RoomID ,"quest itemid is "..itemid.."")
	DebugMsg( 0, RoomID ,"quest item need amount is "..needAmount.."")
	DebugMsg( 0, RoomID ,"Reward itemid is "..rewardid.."")
	DebugMsg( 0, RoomID ,"Reward item need amount is "..RewardAmount.."")
	DebugMsg( 0, RoomID ,"Quest litmited leve is "..needlv.."")
end

------------------------------------����NPC--------------------------------
function Lua_mika_QTool_create_sure() -- �T�w�O�_����npc
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --�T�w
	TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_02]" ) --�T�w�n�إ߳]�w��NPC�ܡH
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  --sure
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_ok", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			CancelBuff( PlayerID, 501570 );--
			DialogClose( PlayerID )
			break
		end
	end
end

function Lua_mika_QTool_create_ok()   --�̫�B�J
	local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
--	Say (OwnerID(), "the value is "..value.."" )
	if value == 10 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116666  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
		SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
		SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
		SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
		SetModeEx( NPC, EM_SetModeType_Move, false )--����
		SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
		SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
		SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
		SetModeEx( NPC, EM_SetModeType_Show, true )--���
		AddToPartition( NPC , RoomID) -- �إߪ���
	elseif value  == 20 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116662  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
		SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
		SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
		SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
		SetModeEx( NPC, EM_SetModeType_Move, false )--����
		SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
		SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
		SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
		SetModeEx( NPC, EM_SetModeType_Show, true )--���
		AddToPartition( NPC , RoomID) -- �إߪ���
	elseif value == 30 then
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
		local BaseX = Obj :X()
	 	local BaseY = Obj :Y();
	 	local BaseZ = Obj :Z();
		local BaseDir = Obj:Dir();
		local NPC = CreateObj(  116663  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
		SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
		SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
		SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
		SetModeEx( NPC, EM_SetModeType_Move, false )--����
		SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
		SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
		SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
		SetModeEx( NPC, EM_SetModeType_Show, true )--���
		AddToPartition( NPC , RoomID) -- �إߪ���
	end
end

------------------------------------�M��NPC--------------------------------
function Lua_mika_QTool_create_Delsure00() -- �T�w�O�_�R��npc
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_0908SEANSON_65]" }  --�T�w
	TransferSelect[1] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_SPQUESTSET_ITEM_03]" ) --�T�w�n�R���Ӱϰ쪺����NPC�ܡH
	AddBuff(OwnerID() , 501570,0,-1);
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- ���L�a�j��A600 = �@����
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		elseif DialogStatus == 0 then  --sure
			CancelBuff( PlayerID, 501570 );--
			Beginplot( OwnerID() ,"Lua_mika_QTool_create_Delsure01", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then -- Close
			DialogClose( PlayerID )
			CancelBuff( PlayerID, 501570 );--
			break
		end
	end
end

function Lua_mika_QTool_create_Delsure01()   --�̫�B�J
	local value = ReadRoleValue(OwnerID() , EM_RoleValue_PID  )
--	Say (OwnerID(), "the value is "..value.."" )
	if value == 50 then
		Beginplot( OwnerID() ,"Lua_mika_QTool_DelNPC01", 0 )
	elseif value  == 60 then
		Beginplot( OwnerID() ,"Lua_mika_QTool_DelNPC02", 0 )
	end
end


function Lua_mika_QTool_DelNPC01() 	--�R��NPC-01  (116666)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID) --�M����y���Ҧ���NPC
	local Obj
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ID = GetSearchResult() --���o�j�MNPC�����G
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--�T�{�Ҧ�NPC���s��
				if Name == 116666  then  --�Y�O������npc
				DelObj(ID) 
				DebugMsg( 0, RoomID ,"Delete NPC 116666 !!")
				end
			end
		end
	end
end

function Lua_mika_QTool_DelNPC02() 	--�R��NPC-02  (116662,116663)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID) --�M����y���Ҧ���NPC
	local Obj
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ID = GetSearchResult() --���o�j�MNPC�����G
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--�T�{�Ҧ�NPC���s��
				if Name == 116662  or Name == 116663 then  --�Y�O������npc
				DelObj(ID) 
				DebugMsg( 0, RoomID ,"Delete NPC 116662 and 116663 !!")
				end
			end
		end
	end
end