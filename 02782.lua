function Hao_Test_Table_Mounts(Num)

	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	if Num < 10 then
		CallPlot( Player , "Hao_Test_Table_Mounts_Begin" , Player , RoomID , Num )
	else
		DebugMsg( Player , RoomID , "Input error" )
	end
end

function Hao_Test_Table_Mounts_Begin( Player , RoomID , Num )

	local Topic = "Please choose the mounts."
	local Hint = "Idle for more than 30s, window will close automatically."	-- ���m�W�L30��,�۰����������C
	local Choise = ReadRoleValue( Player , EM_RoleValue_PID )
	local Random , Time = {} , 0
	local DialogStatus
	local Mounts = {	505075 ,	--01.�M�����a�b�k
				505111 ,	--02.�M���r�V�b�k
				505113 ,	--03.�M�������԰�
				505127 ,	--04.�M�������԰�
				505472 ,	--05.�M���Һ����L
				505473 ,	--06.�M���խ߹��L
				505474 ,	--07.�M���a�����L
				505475 ,	--08.�M�����V���L
				505476 ,	--09.�M���`�W���L
				505477 ,	--10.�M���]����L
				505478 ,	--11.�M���ƥ����I
				505479 ,	--12.�M�����K�԰�
				505480 ,	--13.�M���s��Ծs
				505481 ,	--14.�M���Ȫe�Ѱ�
				506001 ,	--15.�M���զ��@��
				506002 ,	--16.�M���¦��@��
				506109 ,	--17.�M���Ħ��@��
				506137 ,	--18.�M���������j
				506174 ,	--19.�M���ɭ��N���~
				506175	--20.�M���N�����C��
						}
	DialogClose( Player )
	DialogCreate( Player , EM_LuaDialogType_Select , Topic )

	if Choise ~= 0 then	-- �� PID ������ 0 �ɡA�N��w�I�k�M���L���M PID
		for i = 1 , #Mounts , 1 do
			if Choise == Mounts[i] then
				table.remove( Mounts , i )
			--	DebugMsg( Player , RoomID , "Remove = "..i )
			end
		end
	end
	
	for i = 0 , Num-1 , 1 do
		Random[i] = table.remove( Mounts , math.random(#Mounts) )
		DialogSelectStr( Player , string.format("%02d", i+1 )..".".."["..Random[i].."]" )
	end
	DialogSelectStr( Player , "[SO_EXIT]")	-- ���}
	
	if( DialogSendOpen( Player ) == false ) then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return 0
	end
	
	while true do
		Sleep(1)
		Time = Time + 1
		DialogStatus = DialogGetResult( Player )
	--	DebugMsg( Player , RoomID , "Time = "..Time.." DialogStatus = "..DialogStatus )
		if Time > 300 then -- ���L�a�j��
			DebugMsg( Player , RoomID , Hint )	-- ���m�W�L30��,�۰����������C
			break
		end
		if DialogStatus == -1 or DialogStatus == Num then	-- ���_�B���}
			break
		elseif DialogStatus ~= -2 then	-- ��l��
			AddBuff( Player , Random[DialogStatus] , 0 , -1 )
			WriteRoleValue( Player , EM_RoleValue_PID , Random[DialogStatus] )
			break
		end
	end
	DialogClose( Player )
end

--lua�i���D��1�G�b���a�e��C50�Z���إ�1�ӽc�l�@10�ӽc�l�A�b�c�l�W����10�Ӥ��@�˪�npc�A�C������W����npc�H�����t
--lua�i���D��2�G�b���a����l�إߤ@��npc�A�u�۽c�l�����j�B�A�D�Ω��e����̫�@�ӽc�l�A�b���^�ӡC���g�H�GFN�B�����B�p���B���E�B����
--lua�i���D��3�G�D��2��npc�����H���Ϋe�i�C���g�H�G�p���B���E

function Hao_Test_Build_Box_Array_1()	-- �D��1

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���y��
	local BoxNum = 106747		-- �c�l�s��
	local Distance = 50			-- �C�ӽc�l�����Z
	local Box , Npc = {} , {}			-- �c�l�BNpc
	local NpcList = {
				114798 ,	-- Npc �s��
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Player , BoxNum , Count*Distance , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V�G0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
		Hao_Test_Build_Box_Array_Status( Box[Count] )	-- �]�w���A
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" ) 	-- �Х� Npc
		Hao_Test_Build_Box_Array_Status( Npc[Count] )	-- �]�w���A
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
	end
end

function Hao_Test_Build_Box_Array_2(Choise)	-- �D��2�P3
	--�D��2 /gm ? pcall Hao_Test_Build_Box_Array_2(1
	--�D��3 /gm ? pcall Hao_Test_Build_Box_Array_2(2
	
	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���y��
	local Walker = 114798					-- ���ʪ�Npc

	Walker = CreateObj( Walker , X , Y , Z , Dir , 1 )
	Hao_Test_Build_Box_Array_Status(Walker)
	AddToPartition( Walker , Room )
	CallPlot( Walker , "Hao_Test_Build_Box_Array_2_"..Choise , X , Y , Z , Dir , Walker , Player , Room )
end

function Hao_Test_Build_Box_Array_2_1( X , Y , Z , Dir , Walker , Player , Room )
	
	local BoxNum = 106747		-- �c�l�s��
	local Distance = 50			-- �C�ӽc�l�����Z
	local Box , Npc  = {} , {}			-- �c�l�B�c�l�W��Npc
	local Pos = {}				-- �����I�GX�BY�BZ
	local NpcList = {	
				114798 ,	-- Npc �s��
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}
	local Point = #NpcList
	Pos[0] = {}
	Pos[0]["X"] , Pos[0]["Y"] , Pos[0]["Z"]  = X , Y , Z
	WriteRoleValue( Walker , EM_RoleValue_IsWalk , 0 )	-- �樫�H�]�B�覡

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Walker , BoxNum , Count*Distance , 180 )	--�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" )
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		Hao_Test_Build_Box_Array_Status( Box[Count] )
		Hao_Test_Build_Box_Array_Status( Npc[Count] )		
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
		Pos[Count] = {}
		Pos[Count]["X"] , Pos[Count]["Y"] , Pos[Count]["Z"] = Hao_Test_Build_Box_Array_Tools( Box[Count] , Distance , Count%2 )	-- �l�Ƭ�1�ɩ������ʡB��0�ɩ��k����
		if Count == Point then
			Pos[Count+1] = {}
		 	Pos[Count+1]["X"] , Pos[Count+1]["Y"] , Pos[Count+1]["Z"] = Hao_Test_Build_Box_Array_Tools(Box[Count] , Distance )
		end
	end
	while true do
		for Step = 1 , #Pos , 1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
		for Step = #Pos , 0 , -1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
	end
end

function Hao_Test_Build_Box_Array_2_2( X , Y , Z , Dir , Walker , Player , Room )
	
	local BoxNum = 106747	-- �c�l�s��
	local Distance = 50		-- �C�ӽc�l�����Z
	local Polygon = 5		-- �ꪺ�ѪR�סB�H6���I����5���u
	local Box , Npc  = {} , {}		-- �c�l�B�c�l�W��Npc
	local Pos = {}			-- Walker ���ʶ���
	local Steps = 0			-- Walker  �B��
	local NpcList = {		-- Npc �s��
				114798 ,
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}

	WriteRoleValue( Walker , EM_RoleValue_IsWalk , 0 )	-- �樫�H�]�B�覡
	Pos[Steps] = {}
	Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z

	for Count = 1 , #NpcList , 1 do
		Box[Count] = Lua_CreateObjByDir( Walker , BoxNum , Count*Distance , 180 )	--�ѦҪ���A���ͪ�����id�A�Z�� �A���V �G 0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
		Npc[Count] = CreateObj_ByObjPoint( Box[Count] , table.remove( NpcList , math.random(#NpcList) ) ,"p_Hit_point01" )
		SetDefIdleMotion( Npc[Count] , ruFUSION_MIME_SIT_CHAIR_LOOP )
		Hao_Test_Build_Box_Array_Status( Box[Count] )
		Hao_Test_Build_Box_Array_Status( Npc[Count] )
		AddToPartition( Box[Count] , Room )
		AddToPartition( Npc[Count] , Room )
		if Count%2 == 1 then	-- 1 , 3 , 5 , 7 , 9 ��...�_��
			for Step = (Count-1)*10 , (Count*10)-5 , 1 do
				X , Y , Z  = Hao_Test_Build_Box_Array_Circle( Box[Count] , Distance/2 , Step%10 , Polygon )	-- ����B�Z���B�b������X����(���l)�B�b������X����(����)
				Steps = Steps+1
				Pos[Steps] = {}				
				Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z
			end			
		else	-- 2 , 4 , 6 , 8 , 10 ��...����
			for Step = Count*10 , (Count-1)*10+5 , -1 do
				X , Y , Z  = Hao_Test_Build_Box_Array_Circle( Box[Count] , Distance/2 , Step%10 , Polygon )	-- ����B�Z���B�b������X����(���l)�B�b������X����(����)
				Steps = Steps+1
				Pos[Steps] = {}
				Pos[Steps]["X"] , Pos[Steps]["Y"] , Pos[Steps]["Z"] = X , Y , Z
			end
		end		
	end

	while true do
		for Step = 1 , #Pos , 1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
		for Step = #Pos , 0 , -1 do
			DW_WaitMoveTo( Walker , Pos[Step]["X"] , Pos[Step]["Y"] , Pos[Step]["Z"] )
		end
	end
end

function Hao_Test_Build_Box_Array_Status(ObjID)	-- �޲z���󪬺A

	SetModeEx( ObjID , EM_SetModeType_Obstruct , false )	-- ����
	SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )	-- ����
	SetModeEx( ObjID , EM_SetModeType_NotShowHPMP, true )	-- ����ܦ��
	SetModeEx( ObjID , EM_SetModeType_HideName , true )	-- ����ܦW��
	SetModeEx( ObjID , EM_SetModeType_Mark , false )		-- �аO
	SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )	-- �Y����
	MoveToFlagEnabled( ObjID , false )				-- �������޼@��
end

function Hao_Test_Build_Box_Array_Tools(ObjID , Distance , Direction)	-- �D��2�u��G����B�Z���B��ܥ��k
	
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(ObjID)	-- ���y��
	local Pos = {}
	
	if Direction == 0 then
		Dir = Dir + 90
		if Dir >= 360 then
			Dir = Dir - 360
		end
	elseif Direction == 1 then
		Dir = Dir - 90
		if Dir < 0 then
			Dir = Dir + 360
		end
	else
		Dir = Dir
	end

	local Cal = (math.pi/180)*(Dir)	-- Math.pi =(�ꪺ�P��/���|) , �|���ਤ��
	Pos["X"] = X +( Distance*math.cos(Cal) )
	Pos["Z"] = Z - ( Distance*math.sin(Cal ))
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
	return Pos["X"] , Pos["Y"] , Pos["Z"]
end

function Hao_Test_Build_Box_Array_Circle(ObjID , Distance , Step , Polygon )	-- �D��3�u��G����B�Z���B�b������X����(���l)�B�b������X����(����)

	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate( ObjID )	-- ���y��
	local Pos = {}
	local Cal = (math.pi/180)*(Dir)	-- Math.pi =(�ꪺ�P��/���|) , �|���ਤ��
	Pos["X"] = X-( Distance*math.cos(math.pi*(Step/Polygon)+Cal) )
	Pos["Z"] = Z+( Distance*math.sin(math.pi*(Step/Polygon)+Cal) )
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] )
	return Pos["X"] , Pos["Y"] , Pos["Z"]
end

function Hao_Test_Build_Box_Array_Clear()	-- �M���D��1 ~ 3�Ҧ� Npc

	local ObjList = {	106747 , 
				114798 ,	-- Npc �s��
				114799 ,
				114802 ,
				114801 ,
				114803 ,
				114805 ,
				114811 ,
				116707 ,
				116708 ,
				116703	
						}	
	
	for Num = 1 , #ObjList , 1 do
		Lua_Hao_NPCofAll_Clear(ObjList[Num])
	end
end