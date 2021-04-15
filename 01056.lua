function LuaI_111576_0()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID  ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	-- 2012.10.02 修正百鬼大遊行會重覆廣播多次的問題。
	local Zone = ZoneID - math.floor( ZoneID/1000 ) * 1000
	--
	local Boy = CreateObjByFlag( 101290, 780199 , 50 , 1 );
	AddToPartition( Boy , RoomID )  
	--2014.09.29 死亡劇情改掛在資料庫的NPC內(奈)
--	SetPlot( Boy  , "dead","yuyu_111611nod_0",0 )                              --死亡劇情

	SetModeEx( Boy  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Boy  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Boy , EM_SetModeType_Fight , false )--可砍殺攻擊

	local Girl = CreateObjByFlag( 101289, 780199 , 49 , 1 );
	AddToPartition( Girl , RoomID )  
	--2014.09.29 死亡劇情改掛在資料庫的NPC內(奈)
--	SetPlot( Girl  , "dead","yuyu_111611nod_0",0 )                              --死亡劇情

	SetModeEx( Girl  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( Girl  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Girl , EM_SetModeType_Fight , false )--可砍殺攻擊

	while true do
		local Leaderg = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101289, 100 , 1)       --女導遊	
		local Leaderb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101290, 100 , 1)       --男導遊
		local Leader = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111576, 100 , 1)       --管理員
		local HelloX = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111604, 100 , 1)       --旁邊的裝飾
--		SAY( Leaderg[0] , "1" )
--		SAY( Leaderb[0] , "2" )
--		SAY( OwnerID() , GetSystime(2) )
		local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local GB = ReadRoleValue( Leaderb[0] ,  EM_RoleValue_PID  ) 
		local GG = ReadRoleValue( Leaderg[0] ,  EM_RoleValue_PID  ) 
		
		if GetSystime(2) == 20 or GetSystime(2) == 50  then
		-- 2012.10.02 修正百鬼大遊行會重覆廣播多次的問題。
		--	if ZoneID == 2 then
		--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --活動將開始/跑馬燈。
		--	end
			if Zone == 2 then
				RunningMsgEx( HelloX[0] , 2 , 3 , "[SC_YU_HW_111611_5]" ) 
			end
		end
		-- 2012.10.22 查詢百鬼大遊行有時會無法進行的問題。		
		if GetSystime(2) == 30 or GetSystime(2) == 0 then
			DesignLog( OwnerID() , 111576 , ""..string.format( "%02d", GetSystime(1) ).." : "..string.format( "%02d", GetSystime(2) ).." GB = "..GB.." GG = "..GG.." LD = "..LD )
		end
		--
	-- 2012.10.22 修正百鬼大遊行有時會無法進行的問題。
	--	if GetSystime(2) == 30 and GB == 1 then	-- 男半點
		if GetSystime(2) == 30 then
	--
			if LD == 0 or LD == 2 then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
				BeginPlot( Leaderb[0] , "yuyu_111612_0" , 0 )  
			end
	-- 2012.10.22 修正百鬼大遊行有時會無法進行的問題。
	--	elseif  GetSystime(2) == 0 and GG == 1 then	--女整點
		elseif  GetSystime(2) == 0 then
	--	
			if LD == 0 or LD == 1 then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
				BeginPlot( Leaderg[0] , "yuyu_111611_0" , 0 )  
			end

		elseif  ( GetSystime(2) == 20 ) or ( GetSystime(2) == 50 )  then              
			SAY( Leader[0] ,GetString("SC_111577_YU_15")  )        
		end
	-- 2012.10.02 修正百鬼大遊行會重覆廣播多次的問題。
		sleep(600)
	--	sleep(350)
	end
--	while true do
--		sleep(9000)
--		local Leader = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111576, 100 , 1)       
--		
--	end
end

function LuaI_2008Mdead_0() 	--2014.10.01 死亡後的劇情改掛在怪物NPC死亡劇情內 (奈)

	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --導遊
	AddRoleValue(  LD  , EM_RoleValue_Register , 1 ) --幫導遊 + 1
	DebugMsg( 0 , 0, "Register= "..ReadRoleValue( LD , EM_RoleValue_Register ) )
--	DelObj(OwnerID())
	return true	
end

function yuyu_111611nod_0() --導遊不死

	return false

end

function yuyu_111611_00() --廣播劇情

end

function yuyu_2008Helloween_GM() --GM指令
	local Leaderg = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101289, 300 , 1)       --女導遊	
	local Leaderb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101290, 300 , 1)       --男導遊
	local HelloX = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111604, 100 , 1)       --旁邊的裝飾
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID  ) 
	local PlayerID = OwnerID()
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	TransferSelect[0] = { "Boy" }
	TransferSelect[1] = { "Girl"  }
	TransferSelect[2] = { "FlagDel"  }
	TransferSelect[3] = { "[SO_EXIT]" }				-- 離開對話

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
		elseif DialogStatus == 3 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then

			--	if ZoneID == 2 then
			--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --活動將開始/跑馬燈。
			--	end
				AddBuff( OwnerID() ,502156 ,1 , -1 ); --變身

				BeginPlot( Leaderb[0] , "yuyu_111612_0" , 0 )  
				DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			--	if ZoneID == 2 then
			--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --活動將開始/跑馬燈。
			--	end
				AddBuff( OwnerID() ,502156 ,1 , -1 ); --變身

				BeginPlot( Leaderg[0] , "yuyu_111611_0" , 0 )  
				DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then

				SetFlag( OwnerID()  , 542154 , 0 )  --關掉旗標
				SetFlag( OwnerID()  , 542155 , 0 )  
				SetFlag( OwnerID()  , 542156 , 0 )  
				SetFlag( OwnerID()  , 542157 , 0 )  
				SetFlag( OwnerID()  , 542158 , 0 )  
				SetFlag( OwnerID()  , 542159 , 0 )  
				SetFlag( OwnerID()  , 542160 , 0 )  
				SetFlag( OwnerID()  , 542161 , 0 )  
				SetFlag( OwnerID()  , 542162 , 0 )  

				DialogClose( PlayerID )
			break
		end

	end


end