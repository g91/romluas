function LuaS_buffnpc_begin()

	BeginPlot( OwnerID(), "LuaS_buffnpc_na", 0)

end

function LuaS_buffnpc_na()

	-- 2013.07.02 �[�J�ϥΪ̬O�_�� GM ���ˬd
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		DebugMsg( OwnerID() , 0 , "GM only" )
		return false
	end
	--

	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_01]" )   --NPC������ܪ��
	AddBuff(OwnerID() , 501570,0,-1);
 		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_02]")  -- TP����[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_03]") --EXP����[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_04]") --DR����[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_05]") --Debt����[3]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_06]") --����[4]

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--���}�Ҥ���A����j��
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- �@�����L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������
			if DialogStatus == -2  then -- ��l��
			
			elseif DialogStatus == -1  then--���_
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break

			elseif DialogStatus == 0 then  --TP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_TP" , 0 )
				DialogClose( OwnerID() )
				
			--	Say( OwnerID() , DialogStatus )			
				Step = 1			
			elseif DialogStatus == 1 then --EXP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_EXP" , 0 )
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 2 then --���_�v
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DR", 0 )
				DialogClose( OwnerID() )
				Step = 1
			elseif DialogStatus == 3 then --����
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_debt" , 0 )
				DialogClose( OwnerID())
				Step = 1
			elseif DialogStatus == 4 then --�R��NPC
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_DelNPC_01", 0 )
				DialogClose( OwnerID() )
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end  	--�Ĥ@�i��浲��

		

function LuaS_buffnpc_na_TP()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_08]" )   --TP�ƭȤ�v���
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_09]" ) --����[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_10]" ) --����[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_11]" ) --����[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --����[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --��l�� 
		elseif DialogStatus == -1 then --���_
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_TP_na_20" , 0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_TP_na_50" , 0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_TP_na_100" , 0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- �^��W����
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na" , 0 )
			DialogClose( OwnerID() )
			Step= 1 
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_EXP()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_13]" )   --EXP�ƭȤ�v���
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_14]" ) --����[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_15]" ) --����[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_16]" ) --����[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --����[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --��l�� 
		elseif DialogStatus == -1 then --���_
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_EXP_na_20",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_EXP_na_50",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_EXP_na_100",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- �^��W����
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_DR()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_17]" )   --DR�ƭȤ�v���
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_18]" ) --����[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_19]" ) --����[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_20]" ) --����[2]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --����[3]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30 then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then   --��l�� 
		elseif DialogStatus == -1 then --���_
		break

		elseif DialogStatus == 0 then --20%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_DR_na_20",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- 50%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_DR_na_50",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 2 then --100%
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_DR_na_100",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 3 then -- �^��W����
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end



function LuaS_buffnpc_na_debt()
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	local Time = 0 
	local DialogStatus = 0
	local Step = 0 	

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_21]" )   --EXP�ƭȤ�v���
	CancelBuff( OwnerID(), 501570 );--
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_22]" ) --����[0]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_23]" ) --����[1]
		DialogSelectStr( OwnerID(), "[SC_BUFFNPC_12]") --����[2]
	
	if  ( DialogSendOpen( OwnerID() ) == false) then
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end
	
	while true do
		sleep(10)
			Time = Time+1
		if Time>30  then
	--		say( OwnerID() , Time)
			ScriptMessage( OwnerID(), OwnerID(), 0 , "[SC_BUFFNPC_07]",0 )
			DialogClose( OwnerID())
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
	DialogStatus = DialogGetResult( OwnerID() )

		if DialogStatus == -2 then  --��l�� 
		elseif DialogStatus == -1 then --���_
		break

		elseif DialogStatus == 0 then --�@�w�ƶq
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID() , "LuaS_debt_na_part",0 )
			DialogClose( OwnerID() )
			Step= 1

		elseif DialogStatus == 1 then -- ����
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_debt_na_all",0 )
			DialogClose( OwnerID() )
			Step= 1
	
 		elseif DialogStatus == 2 then -- �^��W����
 			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "LuaS_buffnpc_na",0 )
			DialogClose( OwnerID() )
			Step= 1
		end
		if Step == 1 then
			break
		end
	end
end


function LuaS_TP_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 101 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_TP_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 102 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_TP_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115554  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 103 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_EXP_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 201 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_EXP_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 202 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_EXP_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115555  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 203 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_DR_na_20( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 301 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_DR_na_50( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 302 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_DR_na_100( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115556  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 303 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_debt_na_part( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115557  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 401 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end


function LuaS_debt_na_all( )		

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj(  115557  , BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
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
	WriteRoleValue( NPC , EM_RoleValue_PID , 402 )
	AddToPartition( NPC , RoomID) -- �إߪ���

end