function LuaYU_VN_Kill_Boss( Option )
	sleep(5)
	local PlayerID = OwnerID()
	local PackageID = 203575		-- Kill_Boss
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ReadRoleValue(OwnerID(),EM_RoleValue_VOC ) == 0 then
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "|off00ff00" .." You are not GM!!! ".. "|r" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "|off00ff00" .." You are not GM!!! ".. "|r" , 0 ) 
			return false
		end
	elseif ( Option == "USE" ) then

		Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )

	end
end

function LuaYU_VN_BossComeOn_00()

		Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )

end

function LuaYU_VN_BossComeOn_01()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "<CS>-------- LV1 Box --------</CS>" }
	TransferSelect[1] = { "<CS>-------- LV2 Box --------</CS>" }
	TransferSelect[2] = { "<CS>-------- LV3 Box --------</CS>" }
	TransferSelect[3] = { "<CS>-------- LV4 Box --------</CS>" }
	TransferSelect[4] = { "Clear <CS>ALL</CS> Boss" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���

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
		elseif DialogStatus == 5 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_02", 0 )
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_03", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_04", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 3 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_05", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 4 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossGoDead_00", 0 )
			DialogClose( PlayerID )
			break

		end
	end

end
---------------LV1 BOX

function LuaYU_VN_BossComeOn_02()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "<CS>-------- LV1 Box --------</CS>" }
	TransferSelect[1] = { "[100122]".." You need 5 Boss"  }
	TransferSelect[2] = { "[100904]".." You need 5 Boss"  }
	TransferSelect[3] = { "[100906]".." You need 13 Boss"  }
	TransferSelect[4] = { "[101462]".." You need 13 Boss"  }
	TransferSelect[5] = { "Clear <CS>ALL</CS> Boss" }
	TransferSelect[6] = { "[SO_EXIT]" }				-- ���}���
	TransferSelect[7] = { "<CS>-------- Back --------</CS>" }

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

		if DialogStatus == -2   then
			-- DO nothing
		elseif DialogStatus == 6 or DialogStatus == -1 or DialogStatus == 0 then
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100122 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_1", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100904 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_1", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100906 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_1", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 4 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  101462 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_1", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 5 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossGoDead_00", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 7 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )
			DialogClose( PlayerID )
			break



		end
	end

end

---------------LV2 BOX

function LuaYU_VN_BossComeOn_03()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "<CS>-------- LV2 Box --------</CS>" }
	TransferSelect[1] = { "[100821]".." You need 15 Boss"  }
	TransferSelect[2] = { "[100918]".." You need 20 Boss"  }
	TransferSelect[3] = { "[100674]".." You need 10 Boss"  }
	TransferSelect[4] = { "Clear <CS>ALL</CS> Boss" }
	TransferSelect[5] = { "[SO_EXIT]" }				-- ���}���
	TransferSelect[6] = { "<CS>-------- Back --------</CS>" }

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

		if DialogStatus == -2   then
			-- DO nothing
		elseif DialogStatus == 5 or DialogStatus == -1 or DialogStatus == 0 then
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100821 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_2", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100918 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_2", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100674 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_2", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 4 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossGoDead_00", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 6 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )
			DialogClose( PlayerID )
			break

		end
	end

end

---------------LV3 BOX

function LuaYU_VN_BossComeOn_04()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "<CS>-------- LV3 Box --------</CS>" }
	TransferSelect[1] = { "[100675]".." You need 3 Boss"  }
	TransferSelect[2] = { "[100692]".." You need 15 Boss"  }
	TransferSelect[3] = { "[100726]".." You need 15 Boss"  }
	TransferSelect[4] = { "[100676]".." You need 5 Boss"  }
	TransferSelect[5] = { "[100140]".." You need 13 Boss"  }
	TransferSelect[6] = { "Clear <CS>ALL</CS> Boss" }
	TransferSelect[7] = { "[SO_EXIT]" }				-- ���}���
	TransferSelect[8] = { "<CS>-------- Back --------</CS>" }

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

		if DialogStatus == -2   then
			-- DO nothing
		elseif DialogStatus == 7 or DialogStatus == -1 or DialogStatus == 0 then
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100675 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100692 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_3", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100726 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 4 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100676 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 5 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100140 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_3", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 6 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossGoDead_00", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 8 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )
			DialogClose( PlayerID )
			break

		end
	end

end

---------------LV4 BOX

function LuaYU_VN_BossComeOn_05()
	local PlayerID = OwnerID()
	local CheckTime = 1
	local RunTime = 1
	local DialogStatus = 0
	local TransferSelect = {}
	local RoomID = ReadRoleValue( PlayerID ,EM_RoleValue_RoomID) 
	TransferSelect[0] = { "<CS>-------- LV4 Box --------</CS>" }
	TransferSelect[1] = { "[100677]".." You need 5 Boss"  }
	TransferSelect[2] = { "[100629]".." You need 13 Boss"  }
	TransferSelect[3] = { "[100350]".." You need 5 Boss"  }
	TransferSelect[4] = { "[100678]".." You need 3 Boss"  }
	TransferSelect[5] = { "[100154]".." You need 3 Boss"  }
	TransferSelect[6] = { "[101057]".." You need 1 Boss"  }
	TransferSelect[7] = { "[101023]".." You need 1 Boss"  }
	TransferSelect[8] = { "Clear <CS>ALL</CS> Boss" }
	TransferSelect[9] = { "<CS>-------- Back --------</CS>" }

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

		if DialogStatus == -2  or DialogStatus == 0 then
			-- DO nothing
		elseif DialogStatus == -1 or DialogStatus == 0 then
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 1 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100677 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100629 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break


		elseif DialogStatus == 3 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100350 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 4 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100678 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 5 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  100154 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 6 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  101057 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 7 then
			WriteRoleValue(  OwnerID()  , EM_RoleValue_PID ,  101023 ) 
			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_GO_4", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 8 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossGoDead_00", 0 )
			DialogClose( PlayerID )
			break

		elseif DialogStatus == 9 then

			Beginplot( OwnerID() ,"LuaYU_VN_BossComeOn_01", 0 )
			DialogClose( PlayerID )
			break

		end


	end

end


-----------------------------------------------------�M�������𪺶V�n�n��BOSS-----------------------------------------------------------

function LuaYU_VN_BossGoDead_00()


		local ToDel = {}

		ToDel[1] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100122, 300 , 1)     --���m����A����Ĳ�I�ɡA�R�����d�̭p�����d�B��t���Ը���
		ToDel[2] = LuaFunc_SearchNPCbyOrgID( TargetID() , 101462, 60 , 1)     --�оǥ�NPC
		ToDel[3] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100904, 300 , 1)     --�_�c
		ToDel[4] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100906, 300 , 1)     --�S�O�_�c
		ToDel[5] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100821, 300 , 1)     
		ToDel[6] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100918, 300 , 1)     
		ToDel[7] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100674, 300 , 1)     
		ToDel[8] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100675, 300 , 1)     
		ToDel[9] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100692, 300 , 1)  
		ToDel[10] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100726, 300 , 1)     
		ToDel[11] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100676, 300 , 1)     
		ToDel[12] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100140, 300 , 1)  
		ToDel[13] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100677, 300 , 1)     
		ToDel[14] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100629, 300 , 1)     
		ToDel[15] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100350, 300 , 1)  
		ToDel[16] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100678, 300 , 1)     
		ToDel[17] = LuaFunc_SearchNPCbyOrgID( TargetID() , 100154, 300 , 1)     
		ToDel[18] = LuaFunc_SearchNPCbyOrgID( TargetID() , 101057, 300 , 1)  
		ToDel[19] = LuaFunc_SearchNPCbyOrgID( TargetID() , 101023, 300 , 1)    
		ToDel[20] = LuaFunc_SearchNPCbyOrgID( TargetID() , 112068, 300 , 1)    


 
		for i=1 , table.getn(ToDel) do	

			if ToDel[i] ~= -1 then
				for j = 0 ,table.getn(ToDel[i])  do

					Delobj(ToDel[i][j])
				end
			end
		end

end

-----------------------------------------------------�Ͱ����𪺶V�n�n��BOSS-----------------------------------------------------------

function LuaYU_VN_BossComeOn_GO_1()

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local BossID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )


	local Boss = LuaFunc_CreateObjByObj ( BossID , OwnerID() )
--	SetModeEx( Boss   , EM_SetModeType_Revive , true )--�i����


	AddToPartition( Boss, RoomID) 
	WriteRoleValue(  Boss  , EM_RoleValue_PID ,  111 ) --LV1���_�c
	SetPlot( Boss , "dead","LuaYU_VN_BossDead_GO",0 )

	SetRandMove( Boss , 100 ,300,50 )


end

function LuaYU_VN_BossComeOn_GO_2()

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local BossID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )


	local Boss = LuaFunc_CreateObjByObj ( BossID , OwnerID() )
--	SetModeEx( Boss   , EM_SetModeType_Revive , true )--�i����


	AddToPartition( Boss, RoomID) 
	WriteRoleValue(  Boss  , EM_RoleValue_PID ,  222 ) --LV2���_�c
	SetPlot( Boss , "dead","LuaYU_VN_BossDead_GO",0 )

	SetRandMove( Boss , 100 ,300,50 )


end

function LuaYU_VN_BossComeOn_GO_3()

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local BossID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )


	local Boss = LuaFunc_CreateObjByObj ( BossID , OwnerID() )
--	SetModeEx( Boss   , EM_SetModeType_Revive , true )--�i����


	AddToPartition( Boss, RoomID) 
	WriteRoleValue(  Boss  , EM_RoleValue_PID ,  333 ) --LV3���_�c
	SetPlot( Boss , "dead","LuaYU_VN_BossDead_GO",0 )

	SetRandMove( Boss , 100 ,300,50 )


end

function LuaYU_VN_BossComeOn_GO_4()

	local RoomID = ReadRoleValue(  OwnerID() ,EM_RoleValue_RoomID) 
	local BossID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )


	local Boss = LuaFunc_CreateObjByObj ( BossID , OwnerID() )
--	SetModeEx( Boss   , EM_SetModeType_Revive , true )--�i����


	AddToPartition( Boss, RoomID) 
	WriteRoleValue(  Boss  , EM_RoleValue_PID ,  444 ) --LV4���_�c
	SetPlot( Boss , "dead","LuaYU_VN_BossDead_GO",0 )

	SetRandMove( Boss , 100 ,300,50 )


end

function LuaYU_VN_BossDead_GO()

	local BOXLV = ReadRoleValue( OwnerID() , EM_RoleValue_PID )

	local MonsterGroup = Lua_Davis_BornByMultilateral( 112068 , 15 , 70 )
--	local MonsterGroup = Lua_Davis_BornByMultilateral( MonsterID , X , dis )

	--�H�U�H���P�_�����_�c��m
		local BoxX={}

		for i= 1,table.getn(MonsterGroup) do
			BoxX[i]=MonsterGroup[i]

		end

		local Y={}

		for i=1 , table.getn(BoxX) do
			local W = rand(table.getn(BoxX)) +1   -- �x�}�H�����ˡA+1�t���q1�}�l�C

			Y[i] = BoxX[W]

			table.remove(BoxX,W)
		end

		for i=1, 3 do

			if BOXLV == 111 then
				SetPlot( Y[i] ,"touch",  "LuaYU_VN_BOXGood_0" , 10 ) 
				BeginPlot(  Y[i]  , "LuaYU_VN_BOXEND_0" , 0 )  
				--Say( Y[i]  ,"BOX" )

			elseif BOXLV == 222 then
				SetPlot( Y[i] ,"touch",  "LuaYU_VN_BOXGood_1" , 10 ) 
				BeginPlot(  Y[i]  , "LuaYU_VN_BOXEND_0" , 0 )  
				--Say( Y[i]  ,"BOX" )

			elseif BOXLV == 333 then
				SetPlot( Y[i] ,"touch",  "LuaYU_VN_BOXGood_2" , 10 ) 
				BeginPlot(  Y[i]  , "LuaYU_VN_BOXEND_0" , 0 )  
				--Say( Y[i]  ,"BOX" )

			elseif BOXLV == 444 then
				SetPlot( Y[i] ,"touch",  "LuaYU_VN_BOXGood_3" , 10 ) 
				BeginPlot(  Y[i]  , "LuaYU_VN_BOXEND_0" , 0 )  
				--Say( Y[i]  ,"BOX" )

			end


		end

		for i=4, table.getn(MonsterGroup) do

			SetPlot( Y[i] ,"touch",  "LuaYU_VN_BOXMONSTER_01" , 10 ) 
			BeginPlot(  Y[i]  , "LuaYU_VN_BOXEND_0" , 0 )  

		end


end

function LuaYU_VN_BOXGood_0()--�}�ҫ�O���_�����_�c

--	SetPlot( TargetID() ,"touch",  "" , 10 ) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
		--�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
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

			if CheckID( TargetID() ) == true then
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
					GiveBodyItem( OwnerID() , 720595 , 1 );  --LV1

					Delobj( TargetID() )
	
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
		end
	end

end

function LuaYU_VN_BOXGood_1()

--	SetPlot( TargetID() ,"touch",  "" , 10 ) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
		--�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
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

			if CheckID( TargetID() ) == true then
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
					GiveBodyItem( OwnerID() , 720596 , 1 );  --LV2

					Delobj( TargetID() )
	
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
		end
	end
end

function LuaYU_VN_BOXGood_2()

--	SetPlot( TargetID() ,"touch",  "" , 10 ) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
		--�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
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

			if CheckID( TargetID() ) == true then
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
					GiveBodyItem( OwnerID() , 720597 , 1 );  --LV3

					Delobj( TargetID() )
	
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
		end
	end
end

function LuaYU_VN_BOXGood_3()

--	SetPlot( TargetID() ,"touch",  "" , 10 ) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )

	if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
		--�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
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

			if CheckID( TargetID() ) == true then
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

					PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
					GiveBodyItem( OwnerID() , 720598 , 1 );  --LV4

					Delobj( TargetID() )
	
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
		end
	end
end

function LuaYU_VN_BOXEND_0()--���j�h�[�S�}�c�N�۷�
	sleep(1200)

	if CheckID( OwnerID() ) == true then
		Delobj( OwnerID() )
	end

end

function LuaYU_VN_BOXMONSTER_01()--�ͥX�_�c��

--	SetPlot( TargetID() ,"touch",  "" , 10 ) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID) == 1 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 1 )


	if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)	
		--�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
		sleep( 2 )
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

			if CheckID( TargetID() ) == true then
				if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then

					local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
					local Master = LuaFunc_CreateObjByObj ( 101553 , TargetID()  )

					Delobj(TargetID())

					SetModeEx( Master , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( Master , EM_SetModeType_Searchenemy, false )--����
					Hide(Master)
					Show(Master, RoomID)


					WriteRoleValue(  Master  , EM_RoleValue_PID ,  OwnerID()  ) --�O���a
					BeginPlot(  Master  , "LuaYU_VN_BOXMONSTER_02" , 0 )  

	
				else
					ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C

				end	
			end

		elseif ( result == "DAME" ) then

--			SetPlot( TargetID(),"touch","LuaYU_VN_BOXGood_0",10 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
		end
	end

end

function LuaYU_VN_BOXMONSTER_02()--�_�c�Ƕ}��

		local Player = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		local Master = OwnerID()

		PlayMotion( Master, 15) --�ܨ�
		sleep(10)
		AdjustFaceDir( Master, Player , 0 ) --���V
		AddBuff( Master ,503048 ,1 ,-1 ); --�ܤj 2.5
		PlayMotion( Master, 164) --�~�@��
		sleep(10)
		AddBuff( Player ,502500 ,1 ,2 ); --����
		sleep(10)
		SetFollow( Master, Player )
		PlayMotion( Master, 56) --�岴
		sleep(20)
		BeginPlot(  Master , "LuaP_Dead" , 0 )   
		CancelBuff( Master, 503048 )

		SetModeEx( Master , EM_SetModeType_Move, false )--����
		sleep(20)
		Delobj( Master )


end