--�� �ܼƪ�l�� ��--

function sasa_106236_init()			--���α��b����a��	
	if sasa_106236_killcount == nil then
		sasa_106236_killcount = {}
	end
end

function sasa_106236_init_N()			--���α��b����a��
	if sasa_106236_killcount_N == nil then
		sasa_106236_killcount_N = {}
	end
end

function sasa_106236_init_E()			--���α��b����a��
	if sasa_106236_killcount_E == nil then
		sasa_106236_killcount_E = {}
	end
end

--�� K���� ��--

function sasa_106215_Stone()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	----Ū�b���@�h
	local EnterFight
	SetIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 ) 		--����Y
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID() ) ~= 0 then			--Ū������ƶq(���H)
			SetDefIdleMotion( OwnerID() , ruFUSION_MIME_NONE )
			if EnterFight == 0 then
				EnterFight = 1
				--Sleep(10)
				SetDefIdleMotion( OwnerID() , ruFUSION_MIME_ATTACK_1H )
			end
		elseif HateListCount( OwnerID() ) == 0 then		--Ū������ƶq(�S�H)
			Sleep(30)
			SetIdleMotion( OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01 ) 		--����Y
			if EnterFight == 1 then
				EnterFight = 0	
				--SetDefIdleMotion( OwnerID() , ruFUSION_MIME_SIT_CHAIR_LOOP )
			end
		end
	end
end

--�� ���ƨ��ޭx ��--

function sasa_106217_AI()		-----������
	local patrol_ant = 106217	
	local smeltbuff = 622984		--�g�V���
	local nonattackbuff = 622986	--�T����Ʀۤv�����P����
	local AttackTarget = 0
	while true do
		sleep(10)
		AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			--say( OwnerID() , "1" )
			if CheckBuff( AttackTarget , smeltbuff ) == true then
				--and CheckBuff( OwnerID() , nonattackbuff ) == false then
				--say( OwnerID() , "2" )
				AddBuff( OwnerID() , nonattackbuff , 0 , -1)	
				--SysCastSpellLv( AttackTarget  , OwnerID() , 850326 , 0 )				
			end
		end	
	end
end

function sasa_106159_AI() 		------ĵ����
	local alarm_ant = 106159
	local AttackTarget = 0
	local smeltbuff = 622984		--�g�V���
	local ClearSpell = 850325 			--�M������k�N
	while true do
		sleep(10)
		AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			if CheckBuff( AttackTarget , smeltbuff ) == true then
				SysCastSpellLv( OwnerID() , OwnerID() , ClearSpell , 0 )
			end	
		end
	end
end

function sasa_106217_dead_1()
	Setplot( OwnerID() , "dead" , "sasa_106217_dead_2" , 30)
end

function sasa_106217_dead_2()
	local buff = 622984		--�g�V���
	local smelt = 850324	--����k�N
	SysCastSpellLv( TargetID() , TargetID() , smelt , 0 )	--�ѱ������ƪ��H�H�ۨ��d��I��@�Ӫg�V����k�N
end

--�� �U�p�� ��--

function sasa_106127_Babyant()
	Setplot( OwnerID() , "dead" , "sasa_106127_Babyant_dead" , 30 )
	--WriteRoleValue( OwnerID() , EM_RoleValue_register1 , arg )
end

function sasa_106127_Babyant_dead()
	--local arg = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local arg = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Babyant1
	local Babyant2
	local flagnum = (arg-1)*2
	--say( OwnerID() , flagnum )
	Babyant1 = CreateObjByFlag( 106126 , 781171 , flagnum+1 , 1 )		-----����1
	AddToPartition( Babyant1 , Room )
	BeginPlot( Babyant1 , "sasa_106125_AI" , 0 )
	Babyant2 = CreateObjByFlag( 106126 , 781171 , flagnum+2 , 1 )		-----����2
	AddToPartition( Babyant2 , Room )
	BeginPlot( Babyant2 , "sasa_106125_AI" , 0 )
	------------------------------------------------�H�U�}���p�ƥ�
	if arg == 2 then
		sasa_106236_killcount[Room][1] = sasa_106236_killcount[Room][1] + 1
		--Say( TargetID() , "arg1 ="..arg)
	elseif arg== 3 then
		sasa_106236_killcount[Room][2] = sasa_106236_killcount[Room][2] + 1
		--Say( TargetID() , "arg2 ="..arg)
	end
end

function sasa_106125_AI()
	local AttackTarget = 0
	while true do
		sleep(10)
		AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )			
		if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then
			SysCastSpellLv( OwnerID() , OwnerID() , 498420 , 0 )
			--AddBuff( OwnerID() , 621864 , 0 , -1 )
		end
	end
end

function sasa_106125_AI_Check()		--��b621864���ˬdLua
	local GID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )	--�ˬd�I�k�ؼЪ�ID
	if GID == 106126 or GID == 107264 or GID == 107284 then		--�O���Ƥ~�i�H�I��
		return true
	else
		return false
	end
end

--�� �p���ƲM���}�� ��--

function sasa_106236_door_1()		--���b�Ĥ@�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount == nil then
		sasa_106236_killcount = {}
	end
	if sasa_106236_killcount[Room] == nil then
		sasa_106236_killcount[Room] = {}
	end	
	if sasa_106236_killcount[Room][1] == nil then
		sasa_106236_killcount[Room][1] = 0
	elseif sasa_106236_killcount[Room][1] ~= 0 then
		sasa_106236_killcount[Room][1] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount[Room][1] )
		if sasa_106236_killcount[Room][1] >= 10	then
			Delobj( OwnerID() )
		end
	end
end

function sasa_106236_door_2()		--���b�ĤG�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount == nil then
		sasa_106236_killcount = {}
	end
	if sasa_106236_killcount[Room] == nil then
		sasa_106236_killcount[Room] = {}
	end
	if sasa_106236_killcount[Room][2] == nil then
		sasa_106236_killcount[Room][2] = 0
	elseif sasa_106236_killcount[Room][2] ~= 0 then	
		sasa_106236_killcount[Room][2] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount[Room][2] )
		if sasa_106236_killcount[Room][2] >= 7	then
			Delobj( OwnerID() )
			local PPL = SetSearchAllPlayer(Room)
			for i = 1 , PPL , 1 do
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
					if CountBodyItem ( ID, 530929 ) == 0 then
						GiveBodyItem( ID, 530929, 1 )
					end
				end	
			end		
		end
	end
end

function sasa_106236_DoorAI()		--�I�����󲣥ͦr��
	local AI = TargetID()
	local RoomID = ReadRoleValue ( AI , EM_RoleValue_RoomID )
	--Say( OwnerID() , "Here" )
	if ReadRoleValue( OwnerID() , EM_RoleValue_VOC ) ~= 0 then
		--Say( OwnerID() , "There" )
		ScriptMessage( OwnerID() , -1 , 2 , "[SC_106382_06]" , 2 )
		--�o�D�ʦL�����P[106127]�������۬۳s���Y�C
		sleep ( 10 )
	end
end

-------------------Normal

--�� �U�p�� ��--

function sasa_106127_Babyant_N()
	Setplot( OwnerID() , "dead" , "sasa_106127_Babyant_dead_N" , 30 )
	--WriteRoleValue( OwnerID() , EM_RoleValue_register1 , arg )
end

function sasa_106127_Babyant_dead_N()
	--local arg = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local arg = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Babyant1
	local Babyant2
	local flagnum = (arg-1)*2
	--say( OwnerID() , flagnum )
	Babyant1 = CreateObjByFlag( 107264 , 781171 , flagnum+1 , 1 )		-----����1
	AddToPartition( Babyant1 , Room )
	BeginPlot( Babyant1 , "sasa_106125_AI" , 0 )
	Babyant2 = CreateObjByFlag( 107264 , 781171 , flagnum+2 , 1 )		-----����2
	AddToPartition( Babyant2 , Room )
	BeginPlot( Babyant2 , "sasa_106125_AI" , 0 )
	------------------------------------------------�H�U�}���p�ƥ�
	if arg == 2 then
		sasa_106236_killcount_N[Room][1] = sasa_106236_killcount_N[Room][1] + 1
		--Say( TargetID() , "arg1 ="..arg)
	elseif arg== 3 then
		sasa_106236_killcount_N[Room][2] = sasa_106236_killcount_N[Room][2] + 1
		--Say( TargetID() , "arg2 ="..arg)
	end
end

--�� �p���ƲM���}�� ��--

function sasa_106236_door_1_N()		--���b�Ĥ@�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount_N == nil then
		sasa_106236_killcount_N = {}
	end
	if sasa_106236_killcount_N[Room] == nil then
		sasa_106236_killcount_N[Room] = {}
	end	
	if sasa_106236_killcount_N[Room][1] == nil then
		sasa_106236_killcount_N[Room][1] = 0
	elseif sasa_106236_killcount_N[Room][1] ~= 0 then
		sasa_106236_killcount_N[Room][1] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount_N[Room][1] )
		if sasa_106236_killcount_N[Room][1] >= 5	then
			Delobj( OwnerID() )
		end
	end
end

function sasa_106236_door_2_N()		--���b�ĤG�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount_N == nil then
		sasa_106236_killcount_N = {}
	end
	if sasa_106236_killcount_N[Room] == nil then
		sasa_106236_killcount_N[Room] = {}
	end
	if sasa_106236_killcount_N[Room][2] == nil then
		sasa_106236_killcount_N[Room][2] = 0
	elseif sasa_106236_killcount_N[Room][2] ~= 0 then	
		sasa_106236_killcount_N[Room][2] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount_N[Room][2] )
		if sasa_106236_killcount_N[Room][2] >= 5	then
			Delobj( OwnerID() )
			local PPL = SetSearchAllPlayer(Room)
			for i = 1 , PPL , 1 do
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
					if CountBodyItem ( ID, 530929 ) == 0 then
						GiveBodyItem( ID, 530929, 1 )
					end
				end	
			end		
		end
	end
end

-------------------Easy

--�� �U�p�� ��--

function sasa_106127_Babyant_E()
	Setplot( OwnerID() , "dead" , "sasa_106127_Babyant_dead_E" , 30 )
	--WriteRoleValue( OwnerID() , EM_RoleValue_register1 , arg )
end

function sasa_106127_Babyant_dead_E()
	--local arg = ReadRoleValue( OwnerID() , EM_RoleValue_register1 )
	local arg = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Babyant1
	local Babyant2
	local flagnum = (arg-1)*2
	--say( OwnerID() , flagnum )
	Babyant1 = CreateObjByFlag( 107284 , 781171 , flagnum+1 , 1 )		-----����1
	AddToPartition( Babyant1 , Room )
	BeginPlot( Babyant1 , "sasa_106125_AI" , 0 )
	Babyant2 = CreateObjByFlag( 107284 , 781171 , flagnum+2 , 1 )		-----����2
	AddToPartition( Babyant2 , Room )
	BeginPlot( Babyant2 , "sasa_106125_AI" , 0 )
	------------------------------------------------�H�U�}���p�ƥ�
	if arg == 2 then
		sasa_106236_killcount_E[Room][1] = sasa_106236_killcount_E[Room][1] + 1
		--Say( TargetID() , "arg1 ="..arg)
	elseif arg== 3 then
		sasa_106236_killcount_E[Room][2] = sasa_106236_killcount_E[Room][2] + 1
		--Say( TargetID() , "arg2 ="..arg)
	end
end

--�� �p���ƲM���}�� ��--

function sasa_106236_door_1_E()		--���b�Ĥ@�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount_E == nil then
		sasa_106236_killcount_E = {}
	end
	if sasa_106236_killcount_E[Room] == nil then
		sasa_106236_killcount_E[Room] = {}
	end	
	if sasa_106236_killcount_E[Room][1] == nil then
		sasa_106236_killcount_E[Room][1] = 0
	elseif sasa_106236_killcount_E[Room][1] ~= 0 then
		sasa_106236_killcount_E[Room][1] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount_E[Room][1] )
		if sasa_106236_killcount_E[Room][1] >= 5	then
			Delobj( OwnerID() )
		end
	end
end

function sasa_106236_door_2_E()		--���b�ĤG�Ӫ��W
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	SetPlot( OwnerID() , "range" , "sasa_106236_DoorAI" , 50 )
	if sasa_106236_killcount_E == nil then
		sasa_106236_killcount_E = {}
	end
	if sasa_106236_killcount_E[Room] == nil then
		sasa_106236_killcount_E[Room] = {}
	end
	if sasa_106236_killcount_E[Room][2] == nil then
		sasa_106236_killcount_E[Room][2] = 0
	elseif sasa_106236_killcount_E[Room][2] ~= 0 then	
		sasa_106236_killcount_E[Room][2] = 0
	end
	while 1 do
		sleep(10)
		--Say( OwnerID() , sasa_106236_killcount_E[Room][2] )
		if sasa_106236_killcount_E[Room][2] >= 5	then
			Delobj( OwnerID() )
			local PPL = SetSearchAllPlayer(Room)
			for i = 1 , PPL , 1 do
				local ID = GetSearchResult()
				if ReadRoleValue( ID , EM_RoleValue_RoomID ) == Room then
					if CountBodyItem ( ID, 530929 ) == 0 then
						GiveBodyItem( ID, 530929, 1 )
					end
				end	
			end		
		end
	end
end