function Lua_SummerFrogGreen_0()

	Beginplot( OwnerID() ,"Lua_SummerFrogGreen_1", 0 )
end

function Lua_SummerFrogGreen_1()

	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID ) 
	TransferSelect[0] = { "Lv10 10 Green Frogs" }
	TransferSelect[1] = { "Lv20 10 Green Frogs" }
	TransferSelect[2] = { "Lv30 10 Green Frogs" }
	TransferSelect[3] = { "Lv40 10 Green Frogs" }
	TransferSelect[4] = { "Lv50 10 Green Frogs" }
	TransferSelect[5] = { "Kill Frogs" }
	TransferSelect[6] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Do You Want ?" )
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 6 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100 ) -- Lv 10
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  110 ) -- Lv 20
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  120 ) -- Lv 30
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  130 ) -- Lv 40
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  140 ) -- Lv 50
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 5 then
			Beginplot( OwnerID() ,"LuaYU_SummberFrogkill_00", 0 )
			DialogClose( PlayerID )
			break
		end
	end
end
-------------------------------------------------以下是紅青蛙-----------------------------------------------------------
function Lua_SummerFrogRed_0()

	Beginplot( OwnerID() ,"Lua_SummerFrogRed_1", 0 )
end

function Lua_SummerFrogRed_1()

	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "Lv10 10 Red Frogs" }
	TransferSelect[1] = { "Lv20 10 Red Frogs" }
	TransferSelect[2] = { "Lv30 10 Red Frogs" }
	TransferSelect[3] = { "Lv40 10 Red Frogs" }
	TransferSelect[4] = { "Lv50 10 Red Frogs" }
	TransferSelect[5] = { "Kill Frogs" }
	TransferSelect[6] = { "[SO_EXIT]" }				-- 離開對話

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Do You Want ?" )
	for i = 0, table.getn( TransferSelect ) do
		DialogSelectStr( OwnerID() , TransferSelect[i][1] )
	end
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 5 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 6 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  150 ) 
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  160 ) 
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  170 ) 
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  180 ) 
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  190 ) 
			Beginplot( OwnerID() ,"LuaYU_SummberFrog_0", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 5 then
			Beginplot( OwnerID() ,"LuaYU_SummberFrogkill_00", 0 )
			DialogClose( PlayerID )
			break
		end
	end
end
-----------------------------------------------------清除夏日青蛙-----------------------------------------------------------
function LuaYU_SummberFrogkill_00()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 105079 , 105080 , 105081 , 105082 , 105083 , 105084 , 105085 , 105086 , 105087 , 105088  }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for i = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[i] then  --若為陣列中的值
						DelObj(ID) 
					end
				end
			end
		end
	end
end