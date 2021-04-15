function Hao_20130219_Buff()	-- �j�M���W�O�_���ܨ��ĪG

	local Player = OwnerID()
	local CountBuff = BuffCount( Player )	-- Ū�����W��Buff�ƶq
	
	for Pos = 0 , CountBuff , 1 do
		local MagicID = BuffInfo( Player , Pos , EM_BuffInfoType_BuffID )	-- Ū����Buff��ID
		local ChangeID	= GameObjInfo_Int( MagicID ,"ChangeID" )		-- Ū����Buff���ܨ��ϧ�ID
		DebugMsg( Player , 0 , "MagicID = "..ChangeID )
		if ChangeID ~= 0 then
			DebugMsg( Player , 0 , "return false" )
			break
		end
	end
end

function Hao_20130119_2_Test()

	local ObjID = OwnerID()
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local MaxLv = ReadRoleValue( ObjID , EM_RoleValue_MaxLv )
	
	DebugMsg( 0 , Room , "MaxLv = "..MaxLv )
end

function Hao_Test_Random_PetLv(Zone)

	local Player = OwnerID()
	local PetLv = {	[1] = 0 ,
			[2] = 5 ,
			[3] = 10 ,
			[5] = 15 ,
			[10] = 20	}

	if PetLv[Zone] ~= nil then
		DebugMsg( Player , 0 , "PetLv = "..Rand(PetLv[Zone]) )
	else
		local MaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- Ū���Ӧ��A����e�]�w�n�����a�̰�����
		PetEggLv = Math.random( Math.floor( MaxLv*(2/3) ) )	-- �d���J���� = (���a�̰�����*2/3)�����
		DebugMsg( Player , 0 , "PetLv = "..Math.random( Math.floor(MaxLv*(2/3)) ) )
	end
end

function Hao_Test_Client_CountDown(Choise)

	local Player = OwnerID()
	StartClientCountDown ( Player , 10 , 0 , 0 , 0 , Choise , "[SC_1V1PVP_COUNTDOWN]" )	--���aClient��ܭ˼�10��
end

function Hao_Test_Coin_240181(Coin)

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	AddSpeicalCoin( Player , 11 , 11 , Coin )
	DebugMsg( Player , Room , "Coin = "..Coin )
	if CheckSpeicalCoin( Player , 11 , 1000 ) == true then	-- �d�߸Ө��⪺�����Ŷꨩ�ƶq�O�_�F�� 1000 ��
		DebugMsg( Player , Room , "True" )
	else
		DebugMsg( Player , Room , "False" )
	end
end

function Hao_Recall_Zone_25_Npc(Clear)

	if Clear == nil then
		Clear = 0
	end

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���y��
	local Distance = 100			-- �C�ӽc�l�����Z
	local Npc = {}	
	local NpcList = {			-- Zone 25 ���~�p�ǽs��
				107125 ,
				107468 ,
				107469 ,
				107474 ,
				107475 ,
				107499 ,
				107500 ,
				107502 ,
				107503 ,
				107504 ,
				107505 ,
				107506 ,
				107511 ,
				107571 ,
				107127 ,
				107471 ,
				107472 ,
				107482 ,
				107501 ,
				107514 ,
				107470 ,
				107473 ,
				107483 ,
				107507 ,
				107508 ,
				107510 ,
				107512 ,
				107513 ,
				107645 ,
				107484 ,
				107563 ,
				107539 ,
				107486 ,
				107487 ,
				107488 ,
				107509 ,
				107489 ,
				107490 ,
				107491 ,
				107498 ,
				107669 ,
				107675 ,
				107572 ,
				107633 ,
				107640 ,
				107627 ,
				107672
						}

	if Clear == 0 then
		for Count = 1 , #NpcList , 1 do
			local Level = GameObjInfo_Int( NpcList[Count] , "Level" )	-- Ū����Ʈw���]�w�����šA���]�t�H���϶�����
			Npc[Count] = Lua_CreateObjByDir( Player , NpcList[Count] , Count*Distance , 0 ) --�ѦҪ���A���ͪ�����id�A�Z�� �A���V�G0 ���ܬO���V�ѦҪ���A180 ���ܬO�I�V�ѦҪ���
			WriteRoleValue( Npc[Count] , EM_RoleValue_LV , Level )	-- �]�w��ƪ����� Level
			SetModeEx( Npc[Count] , EM_SetModeType_Show , true )	-- ���
			SetModeEx( Npc[Count] , EM_SetModeType_Drag , true )		-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Searchenemy , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Mark , true )		-- �аO
			SetModeEx( Npc[Count] , EM_SetModeType_Revive , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Strikback , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_Fight , true )		-- ���
			SetModeEx( Npc[Count] , EM_SetModeType_Gravity , true )	-- ���O
			SetModeEx( Npc[Count] , EM_SetModeType_Move , true )	-- ����
			SetModeEx( Npc[Count] , EM_SetModeType_ShowRoleHead , true )	-- �Y����	
			AddToPartition( Npc[Count] , Room )
		end
	elseif Clear == 1 then
		local SearchNpc = SetSearchAllNPC( Room )
		for i = 1 , SearchNpc , 1 do
			local Result = GetSearchResult()
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )
			for j = 1 , #NpcList , 1 do
				if OrgID == NpcList[j] then
					DelObj(Result)
					break
				end
			end
		end
	end
end

function Hao_Test_String_Eneu()

	local Player = OwnerID()
	local ChestMsg = "[SC_GOBLINARENA_43]"	-- ��o�}�ҭ����l�_�c��檺�D�Ԫ̬O�G
	local PlayerName = { "Chaos" , "Snake" , "Herroyuy" }
	for i = 1 , #PlayerName , 1 do
		if i == #PlayerName then	-- �y���ɤ��[�B
			ChestMsg = ChestMsg..PlayerName[i]
		else	-- ���_�y�ɥ[�J�B
			ChestMsg = ChestMsg..PlayerName[i].."[SC_SEPARATEMARK]"
		end
	end
	ScriptMessage( Player , -1 , 0 , ChestMsg , C_SYSTEM )
end

function Hao_Test_AddMoney_return_Log(Choise)

	local Player =OwnerID()
	if Choise == 1 then
		AddMoneyEx_Account( Player ,  EM_ActionType_BUY_COOLSUITPAGE , 1000 , true )
	elseif Choise == 2 then
		AddMoney( Player , EM_ActionType_BUY_COOLSUITPAGE , 1000 )
	end
end

function Hao_Test_String_Newline()

	local Word = "Hello".."\n ".."World"
	Say( OwnerID() , Word )
end

function Hao_Test_Math_ceil(Number)	-- ���յL����i��

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	for i = 1 , 40 , 1 do
		DebugMsg( OwnerID() , Room , i.." = "..math.ceil(i/10) )
	end
end

-- ���k2 �HOwnerID�W�S��ID�ۦ�إߪ��׽u
function Hao_Test_GuildWar_Door_Block_2()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- ���o�����Ҧb�y�СA���ծɥ��H���a�N��
	local Door = CreateObj( 112064 , X , Y , Z , Dir , 1 )
	AddToPartition( Door , Room )
	local Dis = 100
	local LeftDir , RightDir	-- ���訤�סB�k�訤��	
	local LeftCal , RightCal	-- ���詷�סB�k�詷��
	
	-- ��X���󥪤�90�׮ɪ�����
	LeftDir = Dir+90
	if LeftDir >= 360 then
		LeftDir = LeftDir - 360
	end
	LeftCal = (math.pi/180)*(LeftDir)	-- ���詷��
--	DebugMsg( 0 , 0 , "LeftCal = "..LeftCal )

	-- ��X����k��90�׮ɪ�����
	RightDir = Dir-90
	if RightDir < 0 then
		RightDir = RightDir + 360
	end
	RightCal = (math.pi/180)*(RightDir)	-- �k�詷��
--	DebugMsg( 0 , 0 , "RightCal = "..RightCal )
	
	-- ��e���V������90�סA�V��Dis�Z���᪺ X1 Z1 Y1 �I
	local X1 = X-(Dis*math.cos(LeftCal))
	local Z1 = Z+(Dis*math.sin(LeftCal))
	local Y1 = GetHeight( X1 , Y , Z1 )	-- ���o���I���a����
	-- ��e���V���k��90�סA�V�kDis�Z���᪺ X2 Z2 Y2 �I
	local X2 = X-(Dis*math.cos(RightCal))
	local Z2 = Z+(Dis*math.sin(RightCal))
	local Y2 = GetHeight( X2 , Y , Z2 )	-- ���o���I���a����

	local Obj1 = CreateObj( 110987 , X1 , Y1 , Z1 , Dir , 1 )
	local Obj2 = CreateObj( 110987 , X2 , Y2 , Z2 , Dir , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	--AddLineBlock( Room , Door , X1 , Z1 , X2 , Z2 )	-- �إ߫��������׽u
end

function Hao_Test_20130715_RandMove()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- ���o�����Ҧb�y�СA���ծɥ��H���a�N��local 
	local Chest = CreateObj( 122390 , X , Y , Z , Dir , 1 )
	AddToPartition( Chest , RoomID )
	CallPlot( Chest , "Hao_Test_20130715_RandMove_1" , Chest )
end	

function Hao_Test_20130715_RandMove_1(Chest)	-- �üƲ���

	local X , Y , Z , Dir =DW_Location( Chest )
	while true do
	--	DebugMsg( 0 , 0 , "X = "..X.." , Y = "..Y.." , Z = "..Z.." , Dir = "..Dir )
	--	Sleep(10)
	     	local X , Y , Z , Dir = DW_NewLocation( DW_Rand(360) , 5 , X , Y , Z , Dir )
	     	local Sec = Move( Chest , X , Y , Z )
		DebugMsg( 0 , 0 , "Sec = "..Sec.." , X = "..X.." , Y = "..Y.." , Z = "..Z.." , Dir = "..Dir )
	--	Sleep( Sec-10 )
 	    	Sleep( Sec+1 )
	end
end

function Hao_Test_GuildWar_Door_Block_3()

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player) -- ���o�����Ҧb�y�СA���ծɥ��H���a�N��
--	local Door = CreateObj( 112064 , X , Y , Z , Dir , 1 )
--	AddToPartition( Door , Room )
	local Dis = 100
	local LeftDir , RightDir	-- ���訤�סB�k�訤��	
	local LeftCal , RightCal	-- ���詷�סB�k�詷��
	
	-- ��X���󥪤�90�׮ɪ�����
	LeftDir = Dir+90
	if LeftDir >= 360 then
		LeftDir = LeftDir - 360
	end
	LeftCal = (math.pi/180)*(LeftDir)	-- ���詷��
	DebugMsg( 0 , 0 , "LeftDir = "..LeftDir.." , LeftCal = "..LeftCal )

	-- ��X����k��90�׮ɪ�����
	RightDir = Dir-90
	if RightDir < 0 then
		RightDir = RightDir + 360
	end
	RightCal = (math.pi/180)*(RightDir)	-- �k�詷��
	DebugMsg( 0 , 0 , "RightDir = "..RightDir.." , RightCal = "..RightCal )

	local BehindDir , BehindCal	-- ��訤�סB��詷��
	local BehindDis = 50
	-- ��X������180�ת�����
	BehindDir = Dir + 180
	if BehindDir >= 360 then
		BehindDir = BehindDir - 360
	end
	BehindCal = (math.pi/180)*(BehindDir)	-- ��詷��
	DebugMsg( 0 , 0 , "BehindDir = "..BehindDir.." , BehindCal = "..BehindCal )
	-- ��e���V�����180�סA�V��Dis�Z���᪺ X3 Z3 Y3 �I
	local X3 = X+(BehindDis*math.cos(BehindCal))
	local Z3 = Z-(BehindDis*math.sin(BehindCal))
	local Y3 = GetHeight( X3 , Y , Z3 )	-- ���o���I���a����
	
	-- ��e���V������90�סA�V��Dis�Z���᪺ X1 Z1 Y1 �I
	local X1 = X3-(Dis*math.cos(LeftCal))
	local Z1 = Z3+(Dis*math.sin(LeftCal))
	local Y1 = GetHeight( X1 , Y , Z1 )	-- ���o���I���a����
	-- ��e���V���k��90�סA�V�kDis�Z���᪺ X2 Z2 Y2 �I
	local X2 = X3-(Dis*math.cos(RightCal))
	local Z2 = Z3+(Dis*math.sin(RightCal))
	local Y2 = GetHeight( X2 , Y , Z2 )	-- ���o���I���a����

	local Obj1 = CreateObj( 110987 , X1 , Y1 , Z1 , Dir , 1 )
	local Obj2 = CreateObj( 110987 , X2 , Y2 , Z2 , Dir , 1 )
	local Obj3 = CreateObj( 110987 , X3 , Y3 , Z3 , Dir , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	AddToPartition( Obj3 , Room )	
	Yell( Obj1 , "1" , 3 )
	Yell( Obj2 , "2" , 3 )
	Yell( Obj3 , "3" , 3 )
	--AddLineBlock( Room , Door , X1 , Z1 , X2 , Z2 )	-- �إ߫��������׽u
end

function Hao_Test_20130717()

	local Player = OwnerID()
	local WeaponID = GetItemInfo( Player , EM_ItemPacketType_EQ , 9 , EM_ItemValueType_OrgObjID )	-- Ū���u����쪺ID
	local WeaponType = GameObjInfo_Int( WeaponID ,"WeaponType" )	-- �����Ʈw���]�w�n�������A�b��14�A���Y���h��16
	
	if WeaponType == 16 then
		return true
	end
	return false
end

function Test_Build_GuildWar_Tower(Dis)	-- 2013.08.12 �l�����ռ@��

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
--	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���o���a��e�y��
--	local PlayerCamp = GetRoleCampID( Player )	-- ���o���a�}��
	local PlayerCamp = 8	-- ���o���a�}��
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- ���oServer�W Global.ini ���\�����a�̰�����
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local TowerID = 102486

	if Dis == nil or Dis == 0 then
		Lua_Hao_NPCofAll_Clear(102486)
		Lua_Hao_NPCofAll_Clear(103141)
		Lua_Hao_NPCofAll_Clear(103142)		
		return
	end

	BeginPlot( Player , "Yuyu_GWar_Leader_skill_04" , 0 )

	for Distance = 0 , Dis , 25 do
		local Tower = Lua_CreateObjByDir( Player , TowerID , Distance , 0 )
		SetModeEx( Tower , EM_SetModeType_Mark , true )	-- �аO
		SetModeEx( Tower , EM_SetModeType_HideName , true )	-- �W��
		SetModeEx( Tower , EM_SetModeType_ShowRoleHead , true )	-- �Y����
		SetModeEx( Tower , EM_SetModeType_Fight , true )	-- �i�������
		SetModeEx( Tower , EM_SetModeType_Move , false )	-- ����
		SetModeEx( Tower , EM_SetModeType_Obstruct , false )	-- ����
	
		WriteRoleValue( Tower , EM_RoleValue_LV , ServerMaxLv )	-- �N�̰����żg�J�ܶ�
		WriteRoleValue( Tower , EM_RoleValue_Register+1 , 38 )	-- �O�����j���ؿv���A�קK�v��̪����Τۼv�i��������ϥ�
		SetRoleCampID( Tower , PlayerCamp )--�g�J�}��

		-- 2013.07.31 ���E:�ץ����|���Ԫ��~ - �l��N�G�V���(206664)�A�l��X���V���(102481)�L�k�V����q�����D�C(�վ��q���禡�L�k��Npc����A�ҥH�קאּ���a����)
		if TowerID == 102481 then
			CallPlot( Tower , "Hao_GuildWar_Crystal_Extraction_Gem" , Player )	-- �N���a�N�J�ѨV�����檺�@�����C
		end
		--
		SetPlot( Tower , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	-- Ĳ�I�@��
		SetPlot( Tower , "dead" , "Yuyu_GWB_Tower_dead" , 0 )	-- ���`�@��
		
		-- �H�U�P�_���a�O�_���ǲߨ��m�u�{�����
		local SetA = -1
		local Count = BuffCount(Player)
		for i = 0 , Count , 1 do
			local BuffID = BuffInfo( Player , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
			if BuffID == 505314 then	-- ���a�߱o�����m�u�{����
				local BuffLv = BuffInfo( Player , i , EM_BuffInfoType_Power )	--�ӫؿv�� j ��BUFF������
				SetA = BuffLv
				break
			end
		end
		
		if SetA > -1 then
			AddBuff( Tower , 505511 , SetA , -1 )	-- �ؿv�������m�u�{����
		end
		AddBuff( Tower , 505921 , 84 , -1 )	-- ��ֳQ���a�ˮ`�q85%
		AddBuff( Tower , 502707 , 0 , -1 )	-- ����۰ʦ^HP�BSP�BMP
		AddToPartition( Tower , Room )
	end
end

function Hao_Test_20130830()
	
	Hao_Test_SQUARE( OwnerID() , -100 , 50 , 50 )	-- �ѦҪ���B��諫���Z���B��������Z���B�k������Z��
end

function Hao_Test_SQUARE( Obj , BehindDis , LeftDis , RightDis )	-- �ѦҪ���B��諫���Z���B��������Z���B�k������Z��

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Pos , Dir , Cal = {} , {} , {}	-- �y�СB���סB����
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- ���oObj�Ҧb�y��

	-- ��X������180�ת�����
	Dir["Behind"] = Pos["Dir"] + 180
	if Dir["Behind"] >= 360 then
		Dir["Behind"] = Dir["Behind"] - 360
	end
	Cal["Behind"] = (math.pi/180)*(Dir["Behind"])	-- ��詷��

	-- ��X���󥪤�90�׮ɪ�����
	Dir["Left"] = Pos["Dir"]+90
	if Dir["Left"] >= 360 then
		Dir["Left"] = Dir["Left"] - 360
	end
	Cal["Left"] = (math.pi/180)*(Dir["Left"])	-- ���詷��

	-- ��X����k��90�׮ɪ�����
	Dir["Right"] = Pos["Dir"]-90
	if Dir["Right"] < 0 then
		Dir["Right"] = Dir["Right"] + 360
	end
	Cal["Right"] = (math.pi/180)*(Dir["Right"])	-- �k�詷��

	-- ��e���V�����180�סA�V��BehindDis�Z���᪺ X Y Z �I
	Pos["BehindX"] = Pos["X"]+(BehindDis*math.cos(Cal["Behind"]))
	Pos["BehindZ"] = Pos["Z"]-(BehindDis*math.sin(Cal["Behind"]))
	Pos["BehindY"] = GetHeight( Pos["BehindX"] , Pos["Y"] , Pos["BehindZ"] )	-- ���o���I���a����
	
	-- ��e���V������90�סA�V��LeftDis�Z���᪺ X Y Z �I
	Pos["LeftX"] = Pos["BehindX"]-(LeftDis*math.cos(Cal["Left"]))
	Pos["LeftZ"] = Pos["BehindZ"]+(LeftDis*math.sin(Cal["Left"]))
	Pos["LeftY"] = GetHeight( Pos["LeftX"] , Pos["Y"] , Pos["LeftZ"] )
	
	-- ��e���V���k��90�סA�V�kRightDis�Z���᪺ X Y Z �I
	Pos["RightX"] = Pos["BehindX"]-(RightDis*math.cos(Cal["Right"]))
	Pos["RightZ"] = Pos["BehindZ"]+(RightDis*math.sin(Cal["Right"]))
	Pos["RightY"] = GetHeight( Pos["RightX"] , Pos["Y"] , Pos["RightZ"] )

	local Obj1 = CreateObj( 110987 , Pos["LeftX"] , Pos["LeftY"] , Pos["LeftZ"] , Pos["Dir"] , 1 )
	local Obj2 = CreateObj( 110987 , Pos["RightX"] , Pos["RightY"] , Pos["RightZ"] , Pos["Dir"] , 1 )
	local Obj3 = CreateObj( 110987 , Pos["BehindX"] , Pos["BehindY"] , Pos["BehindZ"] , Pos["Dir"] , 1 )
	AddToPartition( Obj1 , Room )
	AddToPartition( Obj2 , Room )
	AddToPartition( Obj3 , Room )
--	return Pos["LeftX"] , Pos["LeftZ"] , Pos["RightX"] , Pos["RightZ"]	
end

function Hao_Test_Zone355_DogBug()

	local Player = OwnerID()
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- ���o���a��e�y��	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local DogID = 101701
	local Dog = CreateObj( DogID , X , Y , Z , Dir , 1 )
	SetModeEx( Dog  , EM_SetModeType_Strikback, true )--����
	SetModeEx( Dog  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Dog  , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Dog  , EM_SetModeType_Mark, true )--�аO
	SetModeEx( Dog  , EM_SetModeType_Move, true )--����
	SetModeEx( Dog  , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( Dog  , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Dog , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( Dog , EM_SetModeType_Fight , true )--�i�������
	WriteRoleValue( Dog , EM_RoleValue_IsWalk , 1) --�R�O�Ө��ⳣ�Ψ���(0�];1��)
	MoveToFlagEnabled( Dog , false )   	       --�}�������޼@��
	AddToPartition( Dog, RoomID )	--�����󲣥�
	AddBuff(Dog, 624276, 0 , -1 )  -- ��ת��a�ˮ`buff  �T�w����
	WriteRoleValue( Dog, EM_RoleValue_Register+1, Player )  --- �N���a�g�J��R+1
	Callplot(Dog, "mika_test_dog_skill", 0 )  -- �`�F�����ޯ�	
end

function Hao_Test_Zone355_DogBug_1()

	PlayMotionEX( OwnerID() , ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
--	AddBuff( OwnerID() , 505961 , 0 , 6 )
--	Sleep(1)
	PlayMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
end

function Hao_20131001()

	local Owner = OwnerID()
	local Target = TargetID()
	local List = {}

	if Owner ~= Target then
		List = { Target , Owner }
	else
		List = { Owner }
	end

	local Value = {
			{ "Lv" ,  EM_RoleValue_LV		} ,	-- ����
			{ " Hp" , EM_RoleValue_HP		} ,	-- HP
			{ 0 , EM_RoleValue_MaxHP		} ,	-- MaxHP
			{ "Sp" ,  EM_RoleValue_SP		} ,
			{ 0 , EM_RoleValue_MaxSP		} ,
			{ "Str" ,  EM_RoleValue_FinStr		} ,
			{ " Agi" ,  EM_RoleValue_FinAgi		} ,
			{ " Sta" ,  EM_RoleValue_FinSta		} ,
			{ " Int" , EM_RoleValue_FinInt		} ,
			{ " Mnd" , EM_RoleValue_FinMnd	}
		--	{ " MaxHp" , EM_RoleValue_Fin_MaxHP	} ,	-- MaxHP 
		--	{ " Ep" ,  EM_RoleValue_EP		} ,	-- EP
		--	{ 0 , EM_RoleValue_Fin_MaxEP		} ,	-- MaxEP
		--	�Z���ˮ`
		--	�@���I��
		--	{ "Mig" ,  EM_RoleValue_Fin_Mig	} ,	-- �¯�
		--	{ " Brv" ,  EM_RoleValue_Fin_Brv		} ,	-- �^�i
		--	{ " Wil" ,  EM_RoleValue_Fin_Wil		} ,	-- �N��
		--	{ " Vig" , EM_RoleValue_Fin_Vig		} ,	-- ���
		--	{ " Foc" ,  EM_RoleValue_Fin_Foc	}	-- �M�`	
										}							

	for Count = 1 , #List , 1 do
		local String = "Name="..GetName(List[Count]).." "
	--	ScriptMessage( List[Count] , Target , 0 , GetName(List[Count]) , C_SYSTEM )	-- ROM ��ܤ覡
	--	ScriptMessage( List[Count] , Owner , EM_ScriptMessageSendType_Target , EM_ClientMessage_Chat , GetName(List[Count]) , 0 )	-- DP ��ܤ覡
	--	DebugMsg( 0 , 0 , GetName(List[Count]) )
		for Fields = 1 , #Value , 1 do
			if Fields%6 == 0 then
			--	String = String.."\n [DEBUG] "	-- DEBUG�T����
				String = String.."\n"	-- ScriptMessage�T����
			end
			if Type(Value[Fields][1]) == "string" then
				String = String..Value[Fields][1].."="..ReadRoleValue( List[Count] , Value[Fields][2] )..""
			else
				String = String.."/"..ReadRoleValue( List[Count] , Value[Fields][2] ).." "
			end
		end
		ScriptMessage( List[Count] , Target , 0 , String , C_SYSTEM )
	--	DebugMsg( 0 , 0 , String )
	--	Say( List[Count] , String )
	end
end

function Hao_20131021(Dis_target)	-- ���W�B����B���t�B����ˮ`����

	local Player = OwnerID()
	local Dps = 317	-- ��lDPS
	local Dps_per = 0.25	-- Dps�C���ܰʪ�%

	local Dis_total = 125	-- �`�Z��
	local Dis_per = 25	-- �C���ܰʶZ��
--	local Dis_target = 50	-- �ؼжZ��

	-- ���W
--	local Add = Dps*(1+(math.floor((Dis_total-Dis_target)/Dis_per)*Dps_per))
	local Add = Dps*(1+(math.floor(Dis_target/Dis_per)*Dps_per))
	-- ����
--	local Reduce = Dps*(1-(math.floor((Dis_total-Dis_target)/Dis_per)*Dps_per))
	local Reduce = Dps*(1-(math.floor(Dis_target/Dis_per)*Dps_per))
	-- ����
	local Geometric = Dps*(1+Dps_per)^math.floor(Dis_target/Dis_per)
--	local Geometric = Dps*(1+Dps_per)^(math.floor(Dis_target/Dis_per)*Dps_per)
	--local Geometric = 1000*(1+0.1)^math.floor((100-50)/10)
	-- ���t
	local Arithmetic = Dps*(1-Dps_per)^math.floor(Dis_target/Dis_per)
--	local Arithmetic = Dps*(1-Dps_per)^(math.floor(Dis_target/Dis_per)*Dps_per)
	--local Arithmetic = 1000*(1-0.1)^math.floor((100-50)/10)
	DebugMsg( Player , 0 , "Add = "..Add )
	DebugMsg( Player , 0 , "Reduce = "..Reduce )
	DebugMsg( Player , 0 , "Geometric = "..Geometric )
	DebugMsg( Player , 0 , "Arithmetic = "..Arithmetic )
end

function Hao_20131024()

	local BlockPointTable = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14 , 15 , 16 , 17 , 18 , 19 }	--���׽u�X�аƽs��Table�A������m�p�U�G
	for i = 0 , #BlockPointTable-1 do
		Say( OwnerID() , i )	
	end
end

function Hao_Test_20150727_1(Var)

	SetItemInfo( OwnerID(), EM_ItemPacketType_EQ, 0, EM_ItemValueType_MaxDurable, Var*100 );
end

function Hao_Test_20150806(Select,Value)

	local Owner = OwnerID();
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	if Select == 0 then
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- ����
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	elseif Select == 1 then
		WriteRoleValue( Owner, EM_RoleValue_Skill_Blade, Value );
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- ����
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	elseif Select == 2 then
		AddSkillValue( Owner, EM_SkillValueType_Blade, Value );
		local Lv = ReadRoleValue( Owner, EM_RoleValue_Skill_Blade );	-- ����
		DebugMsg( Owner, RoomID, "Lv = "..Lv );
	end
end

function Hao_Test_20150820()

	local Owner = OwnerID();
	local Zone = ReadRoleValue( Owner, EM_RoleValue_ZoneID );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local a = 10
	local b = 10

	DebugMsg( Owner, Room, "1.Zone = "..Zone..", Room = "..Room );

	local function Test_Slayer()
		a = a + 1
		b = b + 10
		DebugMsg( Owner, Room, "Zone = "..Zone..", Room = "..Room..", a = "..a..", b = "..b );
	end	

	function Test_Slayer2()
		a = a + 100
		b = b + 1000
		DebugMsg( Owner, Room, "Zone = "..Zone..", Room = "..Room..", a = "..a..", b = "..b );
	end

	DebugMsg( Owner, Room, "Msg" );
	Test_Slayer()
	Test_Slayer2()

--	CallPlot( Owner, "" )
end

function Hao_Test_20150825()

	local Owner = OwnerID();
	local Table = { 1, 2, 3 };

	BeginPlot( Owner, "Hao_Test_20150825_2(Owner,Table)", 10 )
end

function Hao_Test_20150825_2(Owner,Table)

	local Self = OwnerID();
	Say( Self, tostring(Owner) );
	Say( Self, tostring(Table) );
end

function Hao_Test_20150826(Target)

	local Owner = OwnerID();
	local Target =Target or TargetID();

	Say( Owner, "O" );
	Say( Target, "T" );
	local OwnerPos = Vector_GetRolePos(Owner);
	local TargetPos = Vector_GetRolePos(Target);
	-- Owner �y���I�V Target �y���I�ݹL�h������
	local Dir = Lua_GetAngle( OwnerPos.X, OwnerPos.Z, TargetPos.X, TargetPos.Z );
	Say( Owner, "Dir = "..Dir );
end

function Hao_Test_20150831()

	local Owner = OwnerID();
	CallPlot( Owner, "Hao_Test_20150831_2", Owner );
end

function Hao_Test_20150831_2( Owner )

	local A = true;
	local B = 0;

	while A do
		Say( Owner, B );
		A = false;
		Say( Owner, B+1 );
		Sleep(1)
	end
end

function Hao_Test_20150903()

	local DragonEgg = CreateObjByFlag( 121185, 781180, 0, 1 );	 -- �s�J
	AddToPartition( DragonEgg, 0 );
	Hide( DragonEgg );

	BeginPlot( DragonEgg, "Hao_Test_20150903_2", 0 );
end

function Hao_Test_20150903_2()

	Sleep(50);
	Show( OwnerID(), 0 )
	SetModeEx( OwnerID(), EM_SetModeType_HideName, false );	-- ���æW��
end

function Hao_Test_20150908( Owner, Target )

	local Owner = Owner or OwnerID();
	local Target = Target or TargetID();
	CallPlot( Owner, "Hao_Test_20150908_2", Owner, Target );
end

function Hao_Test_20150908_2( Owner, Target )

	local Owner = Owner or OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Target = Target or TargetID();

	local OwnerPos = Vector_GetRolePos( Owner );
	local TargetPos = Vector_GetRolePos( Target );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Distance = GetDistance( Owner, Target );	-- �Z��
	local DelayTime = ( Distance / 200 )*10;
	DebugMsg( 0, 0, "DelayTime = "..Math.ceil(DelayTime)..", Distance = "..Distance );
	CastSpellPos( Owner, TargetPos.X, TargetPos.Y, TargetPos.Z, 499229, 0 );
	Sleep( DelayTime+12 );
	CallPlot( Owner, "Zone_166_Boss2_Stage1_CreateNightFire", TargetPos, Dir, Room );
end

function Hao_Test_20150910()

	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos( Owner );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Pos = {
			{ 106968, 60, 20, 60 },
			{ 106969, 60, 20, -60 },
			{ 106970, -60, 20, 60 },
			{ 106971, -60, 20, -60 }
						};
	for i = 1, #Pos do
		local ElementObj = CreateObj( Pos[i][1], OwnerPos.X+Pos[i][2], OwnerPos.Y+Pos[i][3], OwnerPos.Z+Pos[i][4], 0, 1 ); 	-- �ľW�z������
		SetModeEx( ElementObj, EM_SetModeType_Show, true );	-- ���
		SetModeEx( ElementObj, EM_SetModeType_Mark, false );	-- �аO
		SetModeEx( ElementObj, EM_SetModeType_Strikback, false );	-- ����
		SetModeEx( ElementObj, EM_SetModeType_Searchenemy, false );	-- ����
		SetModeEx( ElementObj, EM_SetModeType_Move, false );	-- ��������
		SetModeEx( ElementObj, EM_SetModeType_Gravity, false );	-- �������O
		WriteRoleValue( ElementObj, EM_RoleValue_LiveTime, 20 );	-- �z������ͦs�ɶ�
		AddToPartition( ElementObj, Room );
		BeginPlot( ElementObj, "Hao_Test_20150910_2", 0 );
	end
end

function Hao_Test_20150910_2()

	Sleep(50);
	SetModeEx( OwnerID(), EM_SetModeType_Show, false );	-- ���
	BeginPlot( OwnerID(), "Hao_Test_20150910_3", 0 );
end

function Hao_Test_20150910_3()

	Sleep(50);
	SetModeEx( OwnerID(), EM_SetModeType_Show, true );	-- ���
	BeginPlot( OwnerID(), "Hao_Test_20150910_2", 0 );
end


function Hao_Test_20150911()

	CallPlot( OwnerID(), "Hao_Test_20150911_2", 0 )
end

function Hao_Test_20150911_2( Count )

	while true do
		DebugMsg( 0, 0, "Counter = "..Count );
		Sleep(1);
		Count = Count + 1;
	end
end

function Hao_Test_20140916()

	local Owner = OwnerID()
	local Pos = Vector_GetRolePos( Owner );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );

	local Obj = CreateObj( 101405, Pos.x, Pos.y, Pos.z, 0, 1 );
	MoveToFlagEnabled( Obj, false );
	SetModeEx( Obj, EM_SetModeType_Fight, true );
	SetModeEx( Obj, EM_SetModeType_Searchenemy, true );
	SetModeEx( Obj, EM_SetModeType_Strikback, true );
	WriteRoleValue( Obj, EM_RoleValue_IsWalk, 1 );
	AddToPartition( Obj, Room );
	DebugMsg( 0, 0, "R" )
end

function Hao_Patch_6_4_1_Encyclopedias()

	local Owner = OwnerID();
	CallPlot( Owner, "Hao_Patch_6_4_1_Encyclopedias_2", Owner );
end

function Hao_Patch_6_4_1_Encyclopedias_2( Owner )

	local Books = {
			243304,	--7�Ѿ԰��нm�ʬ�I
			243305,	--7�Ѿ԰��нm�ʬ�II
			243306,	--7�Ѿ԰��нm�ʬ�III
			243307,	--7�Ѿ԰��нm�ʬ�IV
			243308,	--7�Ѿ԰��нm�ʬ�V
			243309,	--7�Ѿ԰��нm�ʬ�VI
			243310,	--7�Ѿ԰��нm�ʬ�VII
			243311,	--7�ѧޯ�׷Ҧʬ�I
			243312,	--7�ѧޯ�׷Ҧʬ�II
			243313,	--7�ѧޯ�׷Ҧʬ�III
			243314,	--7�ѧޯ�׷Ҧʬ�IV
			243315,	--7�ѧޯ�׷Ҧʬ�V
			243316,	--7�ѧޯ�׷Ҧʬ�VI
			243317,	--7�ѧޯ�׷Ҧʬ�VII
			243318,	--1�ѱĶ�����Ų
			243319,	--1���q���j��
			243320,	--1�Ѷi���q���j�ʬ�
			243321,	--1�Ѳ׷��q���ʬ����
			243322,	--1�ѥ��j��
			243323,	--1�Ѷi������j�ʬ�
			243324,	--1�Ѳ׷����ʬ����
			243325,	--1���į�j��
			243326,	--1�Ѷi���į�j�ʬ�
			243327,	--1�Ѳ׷��į�ʬ����
			243328,	--7�ѱĶ�����Ų
			243329,	--7���q���j��
			243330,	--7�Ѷi���q���j�ʬ�
			243331,	--7�Ѳ׷��q���ʬ����
			243332,	--7�ѥ��j��
			243333,	--7�Ѷi������j�ʬ�
			243334,	--7�Ѳ׷����ʬ����
			243335,	--7���į�j��
			243336,	--7�Ѷi���į�j�ʬ�
			243337,	--7�Ѳ׷��į�ʬ����
			243338,	--1�ѻs�y�j�ʬ�
			243339,	--1�ѧA�]�i�H�ǥ��K
			243340,	--1�ѥv�K�����ͪ�����
			243341,	--1�ѥ��K�ϥ@��
			243342,	--1�Ѻ�K���K����
			243343,	--1�Ѧܰ����K�ǩ�
			243344,	--1��²��Ǥ�u
			243345,	--1�Ѥ�u�ޥ���s
			243346,	--1�Ѳ`�J�A�Ѥ�u
			243347,	--1�Ѥj�v�ͤ�u���N
			243348,	--1�ѤW�j��u�p��
			243349,	--1�ѻs�ҾǷ��n
			243350,	--1�Ѥ����s�Ҿ�
			243351,	--1�Ѱ��Żs�Ҿ�
			243352,	--1�����A�����s�Ҥj�v
			243353,	--1�ѵL���s�Ҿ�
			243354,	--1�Ѧp��Ǧn���_
			243355,	--1�ѶQ�ڵ��_����
			243356,	--1�ѬӮa���_����
			243357,	--1�ѳ���´�~���P��
			243358,	--1�ѭ��u���_����
			243359,	--1�ѷR�W�i�����Ĥ@�B
			243360,	--1�ѧ��R�H���G
			243361,	--1�Ѳi������
			243362,	--1�ѮƲz�F�H���p�е�
			243363,	--1�ѷ��P�Ʋz���O��
			243364,	--1�Ѱ�¦�Ҫ���
			243365,	--1�Ѷi���Ҫ��N
			243366,	--1�Ѳ`���Ҫ��N
			243367,	--1�ѽ�̪�������N
			243368,	--1�ѯE�v�Ҫ��⥾
			243369,	--7�ѻs�y�j�ʬ�
			243370,	--7�ѧA�]�i�H�ǥ��K
			243371,	--7�ѥv�K�����ͪ�����
			243372,	--7�ѥ��K�ϥ@��
			243373,	--7�Ѻ�K���K����
			243374,	--7�Ѧܰ����K�ǩ�
			243375,	--7��²��Ǥ�u
			243376,	--7�Ѥ�u�ޥ���s
			243377,	--7�Ѳ`�J�A�Ѥ�u
			243378,	--7�Ѥj�v�ͤ�u���N
			243379,	--7�ѤW�j��u�p��
			243380,	--7�ѻs�ҾǷ��n
			243381,	--7�Ѥ����s�Ҿ�
			243382,	--7�Ѱ��Żs�Ҿ�
			243383,	--7�����A�����s�Ҥj�v
			243384,	--7�ѵL���s�Ҿ�
			243385,	--7�Ѧp��Ǧn���_
			243386,	--7�ѶQ�ڵ��_����
			243387,	--7�ѬӮa���_����
			243388,	--7�ѳ���´�~���P��
			243389,	--7�ѭ��u���_����
			243390,	--7�ѷR�W�i�����Ĥ@�B
			243391,	--7�ѧ��R�H���G
			243392,	--7�Ѳi������
			243393,	--7�ѮƲz�F�H���p�е�
			243394,	--7�ѷ��P�Ʋz���O��
			243395,	--7�Ѱ�¦�Ҫ���
			243396,	--7�Ѷi���Ҫ��N
			243397,	--7�Ѳ`���Ҫ��N
			243398,	--7�ѽ�̪�������N
			243399,	--7�ѯE�v�Ҫ��⥾
			243400,	--1�ѪZ�����γq��
			243401,	--1�ѪŤ�i���ޥ�
			243402,	--1�ѳ��C�ǲ߱Ч�
			243403,	--1�ѤP���ǲ߱Ч�
			243404,	--1���v���ǲ߱Ч�
			243405,	--1�ѳ���ǲ߱Ч�
			243406,	--1�ѳ����ǲ߱Ч�
			243407,	--1������C�ǲ߱Ч�
			243408,	--1��������ǲ߱Ч�
			243409,	--1�������ǲ߱Ч�
			243410,	--1��������ǲ߱Ч�
			243411,	--1�Ѫ��`�Z���ʬ�
			243412,	--1�Ѥ}�ǲ߱Ч�
			243413,	--1�ѩ��ǲ߱Ч�
			243414,	--1�Ѩ��m�߱o
			243415,	--7�ѪZ�����γq��
			243416,	--7�ѪŤ�i���ޥ�
			243417,	--7�ѳ��C�ǲ߱Ч�
			243418,	--7�ѤP���ǲ߱Ч�
			243419,	--7���v���ǲ߱Ч�
			243420,	--7�ѳ���ǲ߱Ч�
			243421,	--7�ѳ����ǲ߱Ч�
			243422,	--7������C�ǲ߱Ч�
			243423,	--7��������ǲ߱Ч�
			243424,	--7�������ǲ߱Ч�
			243425,	--7��������ǲ߱Ч�
			243426,	--7�Ѫ��`�Z���ʬ�
			243427,	--7�Ѥ}�ǲ߱Ч�
			243428,	--7�ѩ��ǲ߱Ч�
			243429	--7�Ѩ��m�߱o
					}

	for i = 1, #Books do
		GiveBodyItem( Owner, Books[i], 1 );
		Sleep(5);
	end
end

function Hao_Test_20150922(CreateID,Select,Sec)

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );

	if CreateID < 100000 then
		CreateID = 106967;
	end

	local Boss = CreateObj( CreateID, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	WriteRoleValue( Boss, EM_RoleValue_LiveTime, Sec );

	if Select == 999 then
		AddBuff( Boss, 500226, 0, -1 );	-- �L��
		AddBuff( Boss, 624219, 0, -1 );	-- �Y��
	else
		local DownObj = CreateObj( 106973, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( DownObj, EM_SetModeType_move, false );
		SetModeEx( DownObj, EM_SetModeType_Mark, false );
		SetModeEx( DownObj, EM_SetModeType_ShowRoleHead, false );
		SetModeEx( DownObj, EM_SetModeType_Searchenemy, false );
		SetModeEx( DownObj, EM_SetModeType_Fight, false );
		SetModeEx( DownObj, EM_SetModeType_Strikback, false );
		WriteRoleValue( DownObj, EM_RoleValue_LiveTime, Sec );
		AddBuff( DownObj, 500226, 0, -1 );
		AddToPartition( DownObj, Room );
		AttachObj( DownObj, Boss, Select, "p_down", "p_down" );
	
		local TopObj = CreateObj( 106972, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
		SetModeEx( TopObj, EM_SetModeType_move, false );
		SetModeEx( TopObj, EM_SetModeType_Mark, false );
		SetModeEx( TopObj, EM_SetModeType_ShowRoleHead, false );
		SetModeEx( TopObj, EM_SetModeType_Searchenemy, false );
		SetModeEx( TopObj, EM_SetModeType_Fight, false );
		SetModeEx( TopObj, EM_SetModeType_Strikback, false );
		WriteRoleValue( TopObj, EM_RoleValue_LiveTime, Sec );
		AddBuff( TopObj, 624219, 0, -1 );
		AddToPartition( TopObj, Room );
		AttachObj( TopObj, Boss, Select, "p_top", "p_top" );
	end
	AddToPartition( Boss, Room );
	DebugMsg( 0, 0, "Running" )
end

function Hao_Test_20150922_2(Select,Sec)

	local Owner = OwnerID();
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local OwnerPos = Vector_GetRolePos( Owner );
	local Boss = CreateObj( 106967, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	WriteRoleValue( Boss, EM_RoleValue_LiveTime, Sec );
	AddToPartition( Boss, Room );

	local Obj = CreateObj( 107854, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Mark, false );
	SetModeEx( Obj, EM_SetModeType_ShowRoleHead, false );
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );
	SetModeEx( Obj, EM_SetModeType_Fight, false );
	SetModeEx( Obj, EM_SetModeType_Strikback, false );
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, Sec );
	AddBuff( Obj, 500226, 0, -1 );
	AddToPartition( Obj, Room );
	CallPlot( Obj, "Hao_FollowBoss", Obj, Boss );
--	AttachObj( Obj, Boss, Select, "p_down", "p_down" );
end

function Hao_FollowBoss( Obj, Boss )

	while true do
		local BossPos = Vector_GetRolePos(Boss);
		MoveDirect( Obj, BossPos.x, BossPos.y, BossPos.z );
		Sleep(1);
	end
end

function Hao_Test_20150923()

	local Owner = OwnerID();
	local OwnerPos = Vector_GetRolePos( Owner );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local VecDir = Vector_DirToVector( Dir+90 );
	local TargetPos = OwnerPos + VecDir * 50;
	local TargetDir = Dir - 180;

	if TargetDir > 360 then
		TargetDir = TargetDir - 360;
	elseif TargetDir < 0 then
		TargetDir = TargetDir + 360;
	end

	DebugMsg( 0, 0, "Pos = "..tostring(OwnerPos)..", Dir = "..Dir..", TargetDir = "..TargetDir );
	local Npc = CreateObj( 106956, TargetPos.x, TargetPos.y, TargetPos.z, TargetDir, 1 );
	AddToPartition( Npc, 0 );
end

function Hao_Test_20150924()

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Dir = ReadRoleValue( Owner, EM_RoleValue_Dir );
	local Distance = 120;	-- �k�N���X�������Ľd�� = ���Ī���
	local Width = 20;	-- ���ļe��
	local Height = 60;	-- ���İ���
	local FlySpeed = 6;	-- �ޯ�t��(���:0.1��)�A�ݻP���Ī��׾㰣
	local FlyTime = Math.Ceil( Distance / FlySpeed );	-- �ޯ�Ѱ_�I����ܲ��I���ɶ�(���:0.1��)

	local OwnerPos = Vector_GetRolePos( Owner );
	local Obj = CreateObj( 107071, OwnerPos.x, OwnerPos.y, OwnerPos.z, Dir, 1 );
	SetModeEx( Obj, EM_SetModeType_Show, false );	-- ���
	SetModeEx( Obj, EM_SetModeType_Mark, false );	-- �аO
	SetModeEx( Obj, EM_SetModeType_Strikback, false );	-- ����
	SetModeEx( Obj, EM_SetModeType_Searchenemy, false );	-- ����
	SetModeEx( Obj, EM_SetModeType_Move, false );	-- ��������
	WriteRoleValue( Obj, EM_RoleValue_LiveTime, 30 );	-- �z������ͦs�ɶ�
	AddToPartition( Obj, Room );
--	SysCastSpellLv( Owner, Obj, 851915, 0 );
	CallPlot( Obj, "Hao_Test_20150924_2", Obj, Dir, Width, Height, Distance, FlySpeed, FlyTime );
end

function Hao_Test_20150924_2( Owner, Dir, Width, Height, Distance, FlySpeed, FlyTime )

	local OwnerPos = Vector_GetRolePos( Owner );
	local BeginPos = OwnerPos;
	local VecDir = Vector_DirToVector(Dir+90);	-- ������V�q
	local EndPos
	DebugMsg( 0, 0, "Dir = "..tostring(Dir)..", VecDir = "..tostring(VecDir)..", FlyTime = "..FlyTime );

	while FlyTime > -1 do
		local TargetList = SetSearchRangeInfo( Owner, 150 );
		EndPos = OwnerPos + VecDir * FlySpeed;
		DebugMsg( 0, 0, "FlyTime = "..FlyTime );
	--	DebugMsg( 0, 0, "OwnerPos = "..tostring(OwnerPos) );
	--	DebugMsg( 0, 0, "EndPos = "..tostring(EndPos) );
	--	DebugMsg( 0, 0, "Distance = "..(OwnerPos-EndPos):Len() );
		for i = 1, TargetList do
			local Target = GetSearchResult();
			local TargetPos = Vector_GetRolePos( Target );
			--�ˬd�ؼЬO�_�b���w���B�e�����u�d�򤺡A�_�^��Nil�B�O���ܦ^�ǥؼлP�_�I���Z�� ( �_�I�y�СB���I�y�СB�e�סB���סB�ؼЮy��)
			local Status = Vector_CheckShootObj( OwnerPos, EndPos, Width, Height, TargetPos );
		--	DebugMsg( 0, 0, "No. "..i.. ", Hit = "..tostring( Status ) );
			if Status then
				Say( Target, "Hit = "..tostring( Status )..", Begin:Target Distance = "..(BeginPos-TargetPos):Len() );
			--	SysCastSpellLv( Master, Player, g_IcePierceAttackMagicID, 0 );	-- �ˮ`
			end
		end
		OwnerPos = EndPos;
		FlyTime = FlyTime - 1;
		Sleep(1)
	end
end

function Hao_241910_UseItem_CheckUse( UseType, Pos )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	DebugMsg( Owner, Room, "CheckUse, UseType = "..tostring(UseType)..", Pos = "..tostring(Pos) );
end

function Hao_241910_UseItem_ItemUseOK( UseType, Pos )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	DebugMsg( Owner, Room, "UseOK, UseType = "..tostring(UseType)..", Pos = "..tostring(Pos) );
end