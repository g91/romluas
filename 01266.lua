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
	TransferSelect[7] = { "[SO_EXIT]" }				-- 離開對話

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
		elseif DialogStatus == 7 or DialogStatus == -1 then	-- 關閉
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then	-- 1 Boss
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_01", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then	-- 1 Boss  + 4 青蛙
			Beginplot( OwnerID() ,"LuaYU_Frogbabago_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 2 then	-- 1 青蛙
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_03", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 3 then	-- 5 青蛙
			Beginplot( OwnerID() ,"LuaYU_Frogbabago5_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 4 then	-- 10 青蛙
			Beginplot( OwnerID() ,"Lua_Hao_FrogGo_NewSelect_05", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 5 then	-- 建立青蛙雕像
			Beginplot( OwnerID() ,"LuaYU_FrogSet_00", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 6 then	-- 清除全部青蛙
			Beginplot( OwnerID() ,"LuaYU_Frogkill_00", 0 )
			DialogClose( PlayerID )
			break
		end
	end
end

function LuaYU_FrogSet_00()   --青蛙雕像

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local FrogSet = LuaFunc_CreateObjByObj ( 101724 , OwnerID() )

	SetModeEx( FrogSet   , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( FrogSet   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( FrogSet   , EM_SetModeType_Obstruct, true )--阻擋
	SetModeEx( FrogSet   , EM_SetModeType_Mark, false )--標記
	SetModeEx( FrogSet   , EM_SetModeType_Move, false )--移動
	SetModeEx( FrogSet   , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( FrogSet   , EM_SetModeType_HideName, true )--名稱
	SetModeEx( FrogSet   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( FrogSet   , EM_SetModeType_Show , true ) --不顯示
	SetModeEx( FrogSet   , EM_SetModeType_Fight , false )--可砍殺攻擊

	Hide( FrogSet )
	Show( FrogSet ,RoomID )
end