function Lua_KRCallBosslist_0()
	local Job = ReadRoleValue(OwnerID(),EM_RoleValue_VOC)
	if Job == 0 then
		Beginplot( OwnerID() ,"Lua_KRCallBosslist_1", 0 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "You are not GM!" , 0 )
	end
end

function Lua_KRCallBosslist_1()
	local Obj = Role:new( OwnerID() )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	if ZoneID >= 100 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]" , 0 )	--你不能再這裡使用該物品
		return
	end
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "[100905]" ,100905}
	TransferSelect[1] = { "[100706]" ,100706}
	TransferSelect[2] = { "[100707]" ,100707}
	TransferSelect[3] = { "[100621]" ,100621}
	TransferSelect[4] = { "[SO_EXIT]" ,0}				-- 離開對話
	
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return
	end
	
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "What Do You Want ?" )
	AddBuff(OwnerID() , 501570,0,-1);
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
		if RunTime  > 100 then -- 防無窮迴圈，100 = 10秒

			DebugMsg( 0, RoomID ,"Exit the MENU because IDLE a long Time !!")
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		end

		DialogStatus = DialogGetResult( PlayerID )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 4 or DialogStatus == -1 then
			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		elseif DialogStatus == 0 then

			CallPlot( OwnerID() ,"LuaDavis_KRCallBoss", TransferSelect[DialogStatus][2] )

			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		elseif DialogStatus == 1 then

			CallPlot( OwnerID() ,"LuaDavis_KRCallBoss", TransferSelect[DialogStatus][2] )

			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break

		elseif DialogStatus == 2 then

			CallPlot( OwnerID() ,"LuaDavis_KRCallBoss", TransferSelect[DialogStatus][2] )

			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break


		elseif DialogStatus == 3 then

			CallPlot( OwnerID() ,"LuaDavis_KRCallBoss", TransferSelect[DialogStatus][2] )

			DialogClose( PlayerID )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	end

end
function LuaDavis_KRCallBoss(MonsterID)
	CreateMonsterByBOSSBatch(MonsterID,OwnerID(),0,0)
end