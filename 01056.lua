function LuaI_111576_0()
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID  ) 
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	-- 2012.10.02 �ץ��ʰ��j�C��|���мs���h�������D�C
	local Zone = ZoneID - math.floor( ZoneID/1000 ) * 1000
	--
	local Boy = CreateObjByFlag( 101290, 780199 , 50 , 1 );
	AddToPartition( Boy , RoomID )  
	--2014.09.29 ���`�@���ﱾ�b��Ʈw��NPC��(�`)
--	SetPlot( Boy  , "dead","yuyu_111611nod_0",0 )                              --���`�@��

	SetModeEx( Boy  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Boy  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Boy , EM_SetModeType_Fight , false )--�i�������

	local Girl = CreateObjByFlag( 101289, 780199 , 49 , 1 );
	AddToPartition( Girl , RoomID )  
	--2014.09.29 ���`�@���ﱾ�b��Ʈw��NPC��(�`)
--	SetPlot( Girl  , "dead","yuyu_111611nod_0",0 )                              --���`�@��

	SetModeEx( Girl  , EM_SetModeType_Strikback, false )--����
	SetModeEx( Girl  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Girl , EM_SetModeType_Fight , false )--�i�������

	while true do
		local Leaderg = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101289, 100 , 1)       --�k�ɹC	
		local Leaderb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101290, 100 , 1)       --�k�ɹC
		local Leader = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111576, 100 , 1)       --�޲z��
		local HelloX = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111604, 100 , 1)       --���䪺�˹�
--		SAY( Leaderg[0] , "1" )
--		SAY( Leaderb[0] , "2" )
--		SAY( OwnerID() , GetSystime(2) )
		local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) 
		local GB = ReadRoleValue( Leaderb[0] ,  EM_RoleValue_PID  ) 
		local GG = ReadRoleValue( Leaderg[0] ,  EM_RoleValue_PID  ) 
		
		if GetSystime(2) == 20 or GetSystime(2) == 50  then
		-- 2012.10.02 �ץ��ʰ��j�C��|���мs���h�������D�C
		--	if ZoneID == 2 then
		--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --���ʱN�}�l/�]���O�C
		--	end
			if Zone == 2 then
				RunningMsgEx( HelloX[0] , 2 , 3 , "[SC_YU_HW_111611_5]" ) 
			end
		end
		-- 2012.10.22 �d�ߦʰ��j�C�榳�ɷ|�L�k�i�檺���D�C		
		if GetSystime(2) == 30 or GetSystime(2) == 0 then
			DesignLog( OwnerID() , 111576 , ""..string.format( "%02d", GetSystime(1) ).." : "..string.format( "%02d", GetSystime(2) ).." GB = "..GB.." GG = "..GG.." LD = "..LD )
		end
		--
	-- 2012.10.22 �ץ��ʰ��j�C�榳�ɷ|�L�k�i�檺���D�C
	--	if GetSystime(2) == 30 and GB == 1 then	-- �k�b�I
		if GetSystime(2) == 30 then
	--
			if LD == 0 or LD == 2 then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
				BeginPlot( Leaderb[0] , "yuyu_111612_0" , 0 )  
			end
	-- 2012.10.22 �ץ��ʰ��j�C�榳�ɷ|�L�k�i�檺���D�C
	--	elseif  GetSystime(2) == 0 and GG == 1 then	--�k���I
		elseif  GetSystime(2) == 0 then
	--	
			if LD == 0 or LD == 1 then
				WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2 )
				BeginPlot( Leaderg[0] , "yuyu_111611_0" , 0 )  
			end

		elseif  ( GetSystime(2) == 20 ) or ( GetSystime(2) == 50 )  then              
			SAY( Leader[0] ,GetString("SC_111577_YU_15")  )        
		end
	-- 2012.10.02 �ץ��ʰ��j�C��|���мs���h�������D�C
		sleep(600)
	--	sleep(350)
	end
--	while true do
--		sleep(9000)
--		local Leader = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111576, 100 , 1)       
--		
--	end
end

function LuaI_2008Mdead_0() 	--2014.10.01 ���`�᪺�@���ﱾ�b�Ǫ�NPC���`�@���� (�`)

	local LD = ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) --�ɹC
	AddRoleValue(  LD  , EM_RoleValue_Register , 1 ) --���ɹC + 1
	DebugMsg( 0 , 0, "Register= "..ReadRoleValue( LD , EM_RoleValue_Register ) )
--	DelObj(OwnerID())
	return true	
end

function yuyu_111611nod_0() --�ɹC����

	return false

end

function yuyu_111611_00() --�s���@��

end

function yuyu_2008Helloween_GM() --GM���O
	local Leaderg = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101289, 300 , 1)       --�k�ɹC	
	local Leaderb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101290, 300 , 1)       --�k�ɹC
	local HelloX = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111604, 100 , 1)       --���䪺�˹�
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
	TransferSelect[3] = { "[SO_EXIT]" }				-- ���}���

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
		elseif DialogStatus == 3 or DialogStatus == -1 then
			DialogClose( PlayerID )
			break
		elseif DialogStatus == 0 then

			--	if ZoneID == 2 then
			--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --���ʱN�}�l/�]���O�C
			--	end
				AddBuff( OwnerID() ,502156 ,1 , -1 ); --�ܨ�

				BeginPlot( Leaderb[0] , "yuyu_111612_0" , 0 )  
				DialogClose( PlayerID )
			break
		elseif DialogStatus == 1 then
			--	if ZoneID == 2 then
			--		RunningMsg( HelloX[0] , 2 ,  GetString("SC_YU_HW_111611_5") ) --���ʱN�}�l/�]���O�C
			--	end
				AddBuff( OwnerID() ,502156 ,1 , -1 ); --�ܨ�

				BeginPlot( Leaderg[0] , "yuyu_111611_0" , 0 )  
				DialogClose( PlayerID )
			break

		elseif DialogStatus == 2 then

				SetFlag( OwnerID()  , 542154 , 0 )  --�����X��
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