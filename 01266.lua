function Lua_FrogbabaGOlist_0()

		Beginplot( OwnerID() ,"Lua_FrogbabaGOlist_1", 0 )
end

function Lua_FrogbabaGOlist_1()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "1 BOSS" }
	TransferSelect[1] = { "1 BOSS and 4 Frogs" }
	TransferSelect[2] = { "1 Frog" }
	TransferSelect[3] = { "5 Frogs" }
	TransferSelect[4] = { "10 Frogs" }
	TransferSelect[5] = { "Frog Statue" }
	TransferSelect[6] = { "Kill Frogs" }
	TransferSelect[7] = { "[SO_EXIT]" }				-- ���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Do You Want ?" )
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
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 7 or DialogStatus == -1 then	-- ����
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then	-- 1 Boss
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_01", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then	-- 1 Boss  + 4 �C��
			Beginplot( OwnerID() ,"LuaYU_Frogbabago_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then	-- 1 �C��
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_03", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then	-- 5 �C��
			Beginplot( OwnerID() ,"LuaYU_Frogbabago5_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then	-- 10 �C��
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_05", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 5 then	-- �إ߫C���J��
			Beginplot( OwnerID() ,"LuaYU_FrogSet_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 6 then	-- �M�������C��
			Beginplot( OwnerID() ,"LuaYU_Frogkill_00", 0 )
			DialogClose( PlayerID )
			break
		end
	end
end

function LuaYU_FrogSet_00()   --�C���J��

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local FrogSet = LuaFunc_CreateObjByObj ( 101724 , OwnerID() )

	SetModeEx( FrogSet   , EM_SetModeType_Strikback, false )--����
	SetModeEx( FrogSet   , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( FrogSet   , EM_SetModeType_Obstruct, true )--����
	SetModeEx( FrogSet   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( FrogSet   , EM_SetModeType_Move, false )--����
	SetModeEx( FrogSet   , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( FrogSet   , EM_SetModeType_HideName, true )--�W��
	SetModeEx( FrogSet   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( FrogSet   , EM_SetModeType_Show , true ) --�����
	SetModeEx( FrogSet   , EM_SetModeType_Fight , false )--�i�������

	Hide( FrogSet )
	Show( FrogSet ,RoomID )
end