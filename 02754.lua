function Lua_Hao_Return_Coordinate( ObjID )	-- �^�Ǯy��

	local X = ReadRoleValuefloat( ObjID , EM_RoleValue_X )
	local Y = ReadRoleValuefloat( ObjID , EM_RoleValue_Y )  
	local Z = ReadRoleValuefloat( ObjID , EM_RoleValue_Z )
	local Dir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	return X , Y , Z , Dir
end

function Lua_Hao_Pumpkin_CreateObj( ObjID , Room , Choise )	-- �إߪ���

	if Choise == nil then
		SetModeEx( ObjID , EM_SetModeType_ShowRoleHead , false )	--�Y����
		SetModeEx( ObjID , EM_SetModeType_Show , true )		--���
		SetModeEx( ObjID , EM_SetModeType_Mark , false )		--�аO 
		SetModeEx( ObjID , EM_SetModeType_HideName , true )	--����ܦW��
		SetModeEx( ObjID , EM_SetModeType_Fight , false )		--���		
	elseif Choise == 1 then	
		SetModeEx( ObjID , EM_SetModeType_Show , false )		--���
		SetModeEx( ObjID , EM_SetModeType_Mark , false )		--�аO
		SetModeEx( ObjID , EM_SetModeType_HideName , true )	--����ܦW��
		SetModeEx( ObjID , EM_SetModeType_Move , false )		--����		
	end
	MoveToFlagEnabled( ObjID , false )				--�������޼@��
	AddToPartition( ObjID , Room )
end

function Lua_Hao_Pumpkin_Step_1()	-- �إ߰_�l�����Ϊ���

	local Maker = OwnerID()
	local Player = {}
	local Room = ReadRoleValue( Maker , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate( Maker )	-- ���o�y��
	local ObjID = CreateObj( 101227 , X , Y , Z , Dir , 1 )		-- �إߪ���
	CallPlot( ObjID , "Lua_Hao_Pumpkin_CreateObj" , ObjID , Room )
	CallPlot( ObjID , "Lua_Hao_Pumpkin_Step_2" , ObjID , Room , X , Y , Z , Dir )	-- ���y���a�_�I�d�򤺪��a
	CallPlot( ObjID , "Lua_Hao_Pumpkin_Step_3" , ObjID , Room )			-- �I�s�_�l�����Ϊ��󲣥ͤp��
end

function Lua_Hao_Pumpkin_Step_2( ObjID , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )	-- ���y���a�_�I�d�򤺪��a

	local X , Y , Z , Dir	-- �C�쪱�a�� X , Y , Z 
	local Player = {}	-- ���a�s
	local Boxer		-- �C�쪱�a���²��l

	while true do	-- ���y�d�򤺪��w���W�����a
		Player = SearchRangePlayer( ObjID , 20 )
		for i = 0 , #Player , 1 do
		--	if CheckID( Player[i] ) == true and CheckFlag( Player[i] , 547023 ) == false then	-- �P�_�J������ �w���W(547023)�B�i�椤(547024)�B�w����(547025)
			if CheckID( Player[i] ) == true and CheckBuff( Player[i] , 623477 ) == false then	-- �P�_�J������ �w���W(547023)�B�i�椤(547024)�B�w����(547025)
				X , Y , Z , Dir = Lua_Hao_Return_Coordinate( Player[i] )	-- ���o�y��
				Boxer = CreateObj( 113105 , X , Y , Z , Dir , 1 )
				CallPlot( Boxer , "Lua_Hao_Pumpkin_CreateObj" , Boxer , Room , 1 )	-- �إߨC��ѻP���a���M�ݶ²��l
				CallPlot( Boxer , "Lua_Hao_Pumpkin_Gravitation" , Player[i] , ObjID , Boxer , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )	-- �U���ޤO
				-- ���a�B�_�l����B�ӤH�����Ϊ���B�_�l���� Room , X , Y , Z , Dir
				AddBuff( Player[i] , 623477 , 0 , -1 )
			--	SetFlag( Player[i] , 547023 , 1 )
			end
		end
		sleep(1)
	end
end

function Lua_Hao_Pumpkin_Step_3( Maker , Room )	-- �I�s�_�l�����Ϊ��󲣥ͤp��

	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Maker)	-- ���o�y��
	local ObjID , Random , Choise , MagicChoise
	local Range = 150
	local Num = 0
	local Build = 107336				-- ���
--	local Monster = { 107337 , 107338 , 107339 }	-- ���M�w�B�n�ʦ����B�T�Y��
--	local Magic = { 850395 , 850395 , 850397 }	-- ���ơB�w�t�B�ίv
	local Monster = { 107337 , 107338 }	-- �p�n�ʩǡB�n�ʦ���
	local Magic = { 850395 , 850397 }	-- �w�t�B�ίv
	local MonsterCount = #(Monster)		-- �Ǫ��`�q
	local MagicCount = #(Magic)			-- �k�N�`�q
	local Motion = ruFUSION_ACTORSTATE_BUFF_BEGIN -- emotion 81

	while true do
--	while Num < 30 do
		if Num%5 == 0 then
			Random = Math.Random( -25 , 25 )					-- �H�����ͪ�X�Z��
			MagicChoise = 0							-- �I��k�N
			ObjID = CreateObj( Build , X+Random , Y , Z-Range , Dir , 1 )		-- �������
			SetPlot( ObjID , "Collision" ,  "Lua_Hao_Pumpkin_Fence" , 0 )		-- �I���@��
		--	BeginPlot( ObjID , "Lua_Hao_Pumpkin_Fence" , 0 )			-- ����I��k�N
		--	DebugMsg( 0 , 0 , "Dir = "..Dir )
		else
			Random = Math.Random( -30 , 30 )					-- �H�����ͪ�X�Z��
			Choise = Math.Random(MonsterCount)				-- �H�����ͪ��Ǫ�
			MagicChoise = Magic[Choise]						-- �I��k�N
			ObjID = CreateObj( Monster[Choise] , X+Random , Y , Z-Range , Dir , 1 )	-- ���ͤp��
		end
		CallPlot( ObjID , "Lua_Hao_Pumpkin_CreateObj" , ObjID , Room )	-- �إߪ���
	--	if Dir > 45 or Dir <= 135 then		-- 46 ~ 135
		--	SetDir( ObjID , 90 )
	--		SetDir( ObjID , 270 )
	--	elseif Dir > 135 or Dir <= 215 then	-- 136 ~ 215
		--	SetDir( ObjID , 180 )
	--		SetDir( ObjID , 0 )
	--	elseif Dir > 215 or Dir <= 315 then	-- 216 ~ 315
		--	SetDir( ObjID , 270 )
	--		SetDir( ObjID , 90 )
	--	else					-- 316 ~ 45
		--	SetDir( ObjID , 0 )
	--		SetDir( ObjID , 180 )
	--	end
	
	--	SetDir( ObjID , Dir )
		AdjustFaceDir( ObjID , Maker , 0 )
		Callplot( ObjID , "Lua_Hao_Pumpkin_Direction" , Maker , 1 , 2 , MagicChoise , Motion )	-- �ؼЪ���B�C�X�������@���B�C���������Z���B�k�NID�B�`�n�ʧ@
		Sleep(10)
		Num = Num + 1
	end
	DelObj(Maker)
end

function Lua_Hao_Pumpkin_Gravitation( Player , ObjID , Boxer , Room , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )

	Sleep(30)
--	DebugMsg( 0 , 0 , "Start" )
	local Time , X_Dis , Z_Dis = 1 , 0.5 , 0.5	-- �C�X�������@���B�C��������X�Z���B�C��������Y�Z��
	local X , Y , Z , Dir , Status
	local Num = 0
	local Buff = 623475
	
	while true do
		Status = CheckBuff( Player , Buff )
	--	Run = ReadRoleValue( Player , EM_RoleValue_NpcOnMove )
	--	�٭n�ˬd�O�_�i�椤
	--	if Status == 0 then
		if Status == true then
			X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���o�y��
			if Math.Abs( X - Boxer_X ) > 1 then
				if X > Boxer_X then
			--		X = X - (X_Dis*Math.Cos(Cal))
					X = X - X_Dis
				else
			--		X = X + (X_Dis*Math.Cos(Cal))
					X = X + X_Dis   
				end
			end
			if Math.Abs( Z - Boxer_Z ) > 1 then
				if Z > Boxer_Z then
			--		Z = Z + (Z_Dis*Math.Sin(Cal))
					Z = Z - Z_Dis
				else
			--		Z = Z - (Z_Dis*Math.Sin(Cal))
					Z = Z + Z_Dis
				end
			end
			SetPos( Player , X , Y , Z , Dir )
			if Math.Abs( X - Boxer_X ) < 1 and Math.Abs( Z - Boxer_Z ) < 1 then
			--	SetPos( Player , Boxer_X , Boxer_Y , Boxer_Z , Boxer_Dir )
				DebugMsg( Player , Room , "break" )
				break
			end
		end
		Sleep(Time)			
	end
	DelObj(Boxer)
end

function Lua_Hao_Pumpkin_Fence()	-- ����_�l�@��

	SetPlot( Npc , "Collision" ,  "" , 0 )		-- �I���@��
--	local Npc = OwnerID()
	local Player = OwnerID()
	local Npc = TargetID()
--	local Player = {}
	local Effect = 623475			-- �����Ĳ�o���k�N - �V��
	local X , Y , Z , Dir			-- ����� X , Y , Z , Dir
	local P_X , P_Y , P_Z , P_Dir		-- ���a�� X , Y , Z , Dir
	local X_Dis , Y_Dis , Z_Dis = 5 , 7 , 20	-- ���a�P���󤹳\�t�Z�� X , Y , Z �Z��

--	X , Y , Z =  Lua_Hao_Return_Coordinate( Npc )
--	P_X , P_Y , P_Z , P_Dir =  Lua_Hao_Return_Coordinate( Player )
--	while true do
	--	Player = SearchRangePlayer( Npc , 20 )
	--	for i = 0 , #Player , 1 do
	--		if CheckID( player[i] ) == true then
			if ReadRoleValue( Player , EM_RoleValue_IsPlayer ) == 1 then
				X , Y , Z =  Lua_Hao_Return_Coordinate( Npc )
				P_X , P_Y , P_Z =  Lua_Hao_Return_Coordinate( Player )
	--			if Math.Abs( X - P_X ) < X_Dis and Math.Abs( Z - P_Z ) < Z_Dis then
--	Say( Npc , "|cff0000ff" ..X.. "|r".." ".."|cff0000ff" ..Y.. "|r".." ".."|cff0000ff" ..Z.. "|r" )
			--	DebugMsg( 0 , 0 , "Y = "..Y.." P_Y = "..P_Y )
					if Math.Abs( Y - P_Y ) > Y_Dis then
						DebugMsg( 0 , 0 , Math.Abs( Y - P_Y ) )
						Say( Npc , "|cff00ff00" .."Cross".. "|r" )
					--	Say( Npc , "Cross" )					
					else
					--	AddBuff( Player[i] , Effect , 0 , 3 )
						AddBuff( Player , Effect , 0 , 3 )
						Say( Npc , "|cffff0000" .."Hit".. "|r" )
					--	Say( Npc , "Hit" )
					end
	--			else
	--				Say( Npc , "|cffffff00" .."Close".. "|r" )				
				--	Say( Npc , "Close" )			
	--			end
	--		end
			end
	--	end
--		sleep(1)
--	end
	SetPlot( Npc , "Collision" ,  "Lua_Hao_Pumpkin_Fence" , 0 )		-- �I���@��
end

function Lua_Hao_Pumpkin_Direction( Target , Time , Dis , Magic , Motion )	-- �ؼЪ���B�C�X�������@���B�C���������Z���B�k�NID�B�`�n�ʧ@
	-- �O�_�ݭn�[�J Dir
	local ObjID = OwnerID()	-- ��������
--	Say( ObjID , "Magic  = "..Magic )
	local Target_X , Target_Y , Target_Z , Target_Dir = Lua_Hao_Return_Coordinate( Target )	-- ���o�y��
--	local Target_X , Target_Y , Target_Z	-- �ؼЪ��� X , Y , Z
--		Target_X = ReadRoleValue( Target , EM_RoleValue_X )
--		Target_Y = ReadRoleValue( Target , EM_RoleValue_Y )
--		Target_Z = ReadRoleValue( Target , EM_RoleValue_Z )
	local X , Y , Z , Dir , NewZ	-- �������� X , Y , Z , ��������P�ؼЪ��󪺶Z��
--	local Dir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local Count = 0
	local PID

	while true do
		X , Y , Z , Dir = Lua_Hao_Return_Coordinate( ObjID )	-- ���o�y��
	--	X = ReadRoleValue( ObjID , EM_RoleValue_X )
	--	Z = ReadRoleValue( ObjID , EM_RoleValue_Z )
	--	Y = GetHeight( X , ReadRoleValue( ObjID , EM_RoleValue_Y ) , Z )
		NewZ = Math.Abs( Target_Z - Z )
		if Count % 5 == 0 then
			PlayMotion( ObjID , Motion )
		end
		if NewZ - Dis >= 0 then
			if Magic > 0 then
				SysCastSpellLv ( ObjID , ObjID , Magic , 0 )
			else
				PID = ReadRoleValue( ObjID , EM_RoleValue_PID )
				if PID == 0 then
					WriteRoleValue( ObjID , EM_RoleValue_PID , Rand(2)+1 )
				end
				PID = ReadRoleValue( ObjID , EM_RoleValue_PID )
				if PID == 1 then
					Dir = Dir + 20
					if Dir >= 360 then
						Dir = Dir - 360
					end
				elseif PID == 2 then
					Dir = Dir - 20
					if Dir <= 0 then
						Dir = Dir + 360
					end
				end
			end
			if Z > Target_Z then
				SetPos( ObjID , X , Y , Z-Dis , Dir )
			elseif Z < Target_Z then
				SetPos( ObjID , X , Y , Z+Dis , Dir )
			end
		else
			SetPos( ObjID , X , Y , Target_Z , Dir )
			Sleep(1)
			DelObj(ObjID)
			break
		end
		ReCalculate( ObjID )
		Sleep(Time)
		Count = Count + 1
	end
end

function Lua_Hao_Pumpkin_Check_Buff(Buff)

	local Player = TargetID()
--	DebugMsg( 0 , 0 , GetDistance( OwnerID() , TargetID() ) )
	if CheckBuff( Player , Buff ) == true then
		return false
	end
end

function Lua_Hao_Pumpkin_Check_Height()	-- ���հ���

	DebugMsg( 0 , 0 , "123" )
	local Player = TargetID()
	local Y = ReadRoleValuefloat( Player , EM_RoleValue_Y )
	if Y <= 4 then
		Say( Player , "Oh No!!!" )
	elseif Y >= 8 then
		Say( Player , "Well Done!!!" )
	else
		Say( Player , "Good" )
	end
end
	
function Lua_Hao_Direction_Test()	-- ���ղ��ʤ�

	local Player = OwnerID()
	while true do
		Say( Player , ReadRoleValue( Player , EM_RoleValue_NpcOnMove ) )
		Sleep(1)
	end
end

function Lua_Hao_Test_Color_Change()

	Say( OwnerID() , "|cff00ff00" .."Cross".. "|r" )
--	"|cffff00ff" .."Cross".. "|r"
end

function Lua_Hao_HateListInfo_Test()	-- ���դ���C��

	local Boxer = OwnerID()
	local Player = TargetID()
	local Num , ID , HatePoint	-- ����C��B����ؼСB�����I��
	--HateListInfo(OwnerID() ,Pos , EM_HateListInfoType_GItemID )
	Num = HateListCount( Player )
	Say( Player , Num )
	if Num > 0 then
		for i = 0 , Num-1 , 1 do
			ID = HateListInfo( Player , i , EM_HateListInfoType_GItemID )
			if ID == Boxer then
				Say( ID , "I am" )
				return false
			else
				Say( ID , "I am not" )			
			end
		end
	end
end

function Lua_Hao_Test_Collision_0()	-- ���ոI���@��

	X , Y , Z , Dir = Lua_Hao_Return_Coordinate( OwnerID() )	-- ���o�y��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boxer
	local Week = GetSystime(5)
	DebugMsg( 0 , 0 , Week )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	BeginPlot( OwnerID() , "Lua_Hao_Test_Collision_2" , 0 )
	for i = 0 , 29 , 1 do
		Boxer = CreateObj( 107336 , X+i*75 , Y , Z , Dir , 1 )
		AdjustFaceDir( Boxer , OwnerID() , 0 )
		CallPlot( Boxer , "Lua_Hao_Pumpkin_CreateObj" , Boxer , Room )	-- �إߨC��ѻP���a���M�ݶ²��l
		SetPlot( Boxer , "Collision" ,  "Lua_Hao_Test_Collision_1" , 0 )
	end
end

function Lua_Hao_Test_Collision_1()	-- ���ոI���@��

--1 ���o�ɶ������ɡ�(0-23 �ȩ]12�I��0 )
--2 ���o�ɶ���������(0-59 )
--3 ���o�ɶ������롨(0-11 �@�묰0 )
--4 ���o�ɶ������顨(1-31)
--5 ���o�ɶ������P����(0-6 �P���Ѭ�0 )
	local Num = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	Num = Num / 10 
	Say( OwnerID() , Num )
--	SetPlot( TargetID() , "Collision" ,  "" , 0 )
	Say( TargetID() , "|cffff0000" .."Hit".. "|r" )
--	Say( OwnerID() , "I am OwnerID" )	-- ���a
--	Say( TargetID() , "I am TargetID" )	-- Npc
--	ReCalculate( OwnerID() )
--	ReCalculate( TargetID() )
--	SetPlot( TargetID() , "Collision" ,  "Lua_Hao_Test_Collision_1" , 0 )
end

function Lua_Hao_Test_Collision_2()	-- ���ոI���@��

	local Num = 0
	while true do
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
		sleep(1)
		Num = Num + 1
	end
end