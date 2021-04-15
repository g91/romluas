function Lua_423236() --�����L�a		
	local  guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0) --���ޭ� �v�үS �s�b?
	if CheckAcceptQuest( OwnerID() ,423236 ) == true and guard ~= -1 and CheckFlag( OwnerID(), 543970 ) == false then		
		SetSpeakDetail(OwnerID(),"[SC_423236_0]") --�ǳƦn�F�ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_10]","Lua_423236_ok",0) --�O���C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423236_11]","Lua_423236_cancel",0) --�A�����A�ڧѤF�@�ǪF��K�K
	elseif CheckAcceptQuest( OwnerID() ,423236 ) == true and guard == -1 and CheckFlag( OwnerID(), 543970 ) == false then
		SetSpeakDetail(OwnerID(),"[SC_423236_00]") --�е��@�U�a�A�v�үS��H�X�h���ޤF�C
	else
		LoadQuestOption( OwnerID())
	end
end

function Lua_423236_cancel()
	SetSpeakDetail(OwnerID(),"[SC_423236_21]") --���A�˧��A�L�ӧa�C
end

function Lua_423236_ok()
	NPCSay( TargetID(), "[SC_423236_20]" ) --���A�̥X�o�a...
	local guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0)
	BeginPlot( guard, "Lua_423236_start", 0 )
	CloseSpeak( OwnerID() )	
end

function Lua_423236_start()
	local Phase = 0
	local guard = OwnerID() 
	local BackPhase = 0
	local waiting = 0
	local lose = 3 --�s�򵥫ݥ��Ѧ���
	local loseTime = 180 --������ȳ̤j�ɶ�(��)
	local FlagObjID = 780608
	local monsterID = {}	
	monsterID[0] = 103604 --�ǷϹp�w�d�y��
	monsterID[1] = 103605 --�ǷϹp�w�d����
	monsterID[2] = 103605 --�ǷϹp�w�d����
	local Num = 3 --�C���԰� �Ǫ����ͼƶq
	local Des ={}
	local player = {}
	local monster = {}
	local Des = {}	
	Des[0] = 115223 --�����IA
	Des[1] = 115227 --�����IB
	Des[2] = 115199 --�����IC	
	WriteRoleValue( guard, EM_RoleValue_Register, 0 )	
	WriteRoleValue( guard, EM_RoleValue_IsWalk , 1 )
	MoveToFlagEnabled( guard, false )
	SetRoleEquip( guard, EM_EQWearPos_MainHand, 210474, 1 ) --���� NPC �Z��
	SetRoleEquip( guard, EM_EQWearPos_SecondHand, 221270, 1 ) ----���� NPC ��
	sleep(20)
	NPCSay( guard, "[SC_423236_22]" ) --�ڭ̨��a�A�n���U�|�P�w�M�C
	
	SetPlot( guard, "dead", "Lua_423236_dead", 0 )		
	for i=0, loseTime do   --5�����������ѧ�	
		WriteRoleValue( guard, EM_RoleValue_IsWalk , 1 )
		sleep(10)
		if Phase > 13 then  --�������ȶ��q
			Lua_423236_reset( 1 ) 			
			LuaFunc_ResetObj( guard )
			break
		end
		if Phase > BackPhase then 
			BackPhase = Phase --���q����
		end
		if waiting >lose then --���ȥ���
			Lua_423236_reset( guard ) 
			waiting = 0				
			break				
		end	
		Phase, waiting = Lua_423236_do( monster, Phase, guard, waiting, FlagObjID, monsterID, Des, Num ) --�U���q���椺�e
		if i == loseTime then --������Ȯɶ��Ӥ[ ����
			Lua_423236_reset( guard ) 
			break 
		end		
	end
end

function Lua_423236_reset( result )	
	if result ~= 1 then		
		local player = SearchRangePlayer ( result, 200 ) 
		for i=0, table.getn( player ) do
			if CheckAcceptQuest( player[i], 423236 ) == true then 
				ScriptMessage( player[i], player[i], 1, "[SC_422974_FAILED]", 0 )--���ȥ��ѡA�Э��s�A��
				ScriptMessage( player[i], player[i], 0, "[SC_422974_FAILED]", 0 )--���ȥ��ѡA�Э��s�A��
			end
		end
		MoveToFlagEnabled( result, true )
		LuaFunc_ResetObj( result )					
	end
	if result == 1 then -- ���ȧ���
		local guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 100, 0)
		local player = SearchRangePlayer ( guard, 100 ) 
		for i=0, table.getn( player ) do
			if CheckAcceptQuest( player[i], 423236 ) == true then 
				ScriptMessage( player[i], player[i], 1, "[BILLBOARD_015]", 0 )--���ȧ���
				ScriptMessage( player[i], player[i], 0, "[BILLBOARD_015]", 0 )--���ȧ���
				SetFlag( player[i], 543970, 1 )	
			end
		end
	end	
end

function Lua_423236_dead()
	CallPlot( OwnerID(), "Lua_423236_reset", OwnerID() )
	return false
end

function Lua_423236_do( monster ,Phase, guard, waiting, FlagObjID, monsterID, Des, Num )
	local check = {}
	local time = 90 --�԰��̪��ɶ�(��)			
	waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --�ˬd���a��NPC�Z�� �O�_�ݭn����
	Phase = Lua_423236_checkFlag( FlagObjID, Phase )	
	if Phase == 3 then
		check[0] = LuaFunc_SearchNPCbyOrgID( guard, Des[0], 30, 0) --�j�M�d�� 30���������IA
		Sleep(10)
		if check[0] ~= -1 then --�ˬd�IA		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --�o�̤@�����`�A�~��e�i�C	
		end
	elseif Phase == 5 then --�԰�1					
		while true do		
			sleep(10)	
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --�ˬd���a��NPC�Z�� �O�_�ݭn����
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+20 ) == true then
				NPCSay( guard, "[SC_423236_32]" ) --ĵ��!���F��a��C
				Sleep(10)
				monster = Lua_423236_Create( monster, monsterID, FlagObjID, 15, Phase, Num ) --���w�X�нs������	
				break
			end
		end
		for i=0, time do			
			waiting = Lua_423236_killOver( Num ) --�P�_�Ǫ������S
			if waiting == 0 then --�ǥ��� �y�{�~��			
				sleep(20)			
				NPCSay( guard, "[SC_423236_34]" ) --�ݨӳo��S�����D�F�A�ڭ��~��e�i�a�C
				break
			end			
			if i == time then waiting = time end
			sleep(10)
		end
	elseif Phase == 7 then
		check[1] = LuaFunc_SearchNPCbyOrgID( guard, Des[1], 30, 0) --�j�M�d�� 30���������IA
		Sleep(10)
		if check[1] ~= -1 then --�ˬd�IA		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --�o�̤@�����`�A�~��e�i�C
		end
	elseif Phase == 10 then
		check[2] = LuaFunc_SearchNPCbyOrgID( guard, Des[2], 30, 0) --�j�M�d�� 30���������IA
		Sleep(10)
		if check[2] ~= -1 then --�ˬd�IA		
			StopMove( guard, true )			
			Sleep(20)
			NPCSay( guard, "[SC_423236_30]" ) --�o�̤@�����`�A�~��e�i�C
		end
	elseif Phase == 12 then --�԰�2
		while true do		
			sleep(10)
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --�ˬd���a��NPC�Z�� �O�_�ݭn����
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+20 ) == true then
				NPCSay( guard, "[SC_423236_32]" ) --ĵ��!���F��a��C
				Sleep(10)
				monster = Lua_423236_Create( monster, monsterID, FlagObjID, 14, Phase, Num ) --���w�X�нs������	
				break
			end
		end
		for i=0, time do
			waiting = Lua_423236_killOver( Num ) --�P�_�Ǫ������S
			if waiting == 0 then --�ǥ��� �y�{�~��
				sleep(20)			
				NPCSay( guard, "[SC_423236_34]" ) --�ݨӳo��S�����D�F�A�ڭ��~��e�i�a�C
				break
			end			
			if i == time then waiting = time end
			sleep(10)
		end
	elseif Phase == 13 then
		while true do
			Sleep(10)
			waiting = Lua_423236_check( guard, FlagObjID, Phase, waiting ) --�ˬd���a��NPC�Z�� �O�_�ݭn����
			if DW_CheckDis( guard, FlagObjID, Phase, rand(10)+10 ) == true then
				NPCSay( guard, "[SC_423236_4]" ) --������A���§A�F...							
				Sleep(10)
				break
			end
		end
	end
	return Phase, waiting;
end

function Lua_423236_check( RoleID, FlagObjID, Phase, waiting )
	local player = {}
	local playerCount = 0
	local count = 0

	if HateListCount( RoleID ) > 0 then
		NPCSay( RoleID, "[SC_423236_31]" ) --�o�����W�i�u�����R�C
	end
	
	player = SearchRangePlayer ( RoleID, 80+rand(20) ) 

	for pry , obj in pairs(player) do
		playerCount = playerCount + 1
	end
	for i= 0, playerCount-1 do	
		if CheckAcceptQuest( player[i], 423236 ) == true then 
			ks_MoveToFlag( RoleID, FlagObjID, Phase, 5)			
			waiting = 0
			count = 0	
			sleep( rand(10)+5 )
		else
			count = count + 1
		end		
		if Count == playerCount then							
			StopMove( RoleID, true )
			NPCSay( RoleID, "[SC_423236_33]" ) --�ָ�W�a�A�ڭ̪��u�@�i�٨S�����C
			waiting = waiting + 1
			sleep( rand(20)+20 )				
		end
	end
	return waiting
end

function Lua_423236_checkFlag( FlagGroup, Phase ) --�ˬd��F�w��S
	if DW_CheckDis( OwnerID(), FlagGroup, Phase, rand(10)+20 ) == true then
		Phase = Phase + 1		
	end
	return Phase
end


function Lua_423236_killOver( Num )
	local killCount = ReadRoleValue( OwnerID(), EM_RoleValue_Register )
	if killCount == Num then
		WriteRoleValue( OwnerID(), EM_RoleValue_Register, 0 )
		return 0
	end
	return Num
end

function Lua_423236_kill()
	local  guard = LuaFunc_SearchNPCbyOrgID( OwnerID(), 115198, 200, 0)
	local killCount = ReadRoleValue( guard, EM_RoleValue_Register )
	WriteRoleValue( guard, EM_RoleValue_Register, killCount + 1 )
end

function Lua_423236_Create( monster, monsterID, FlagObjID, FlagID, Phase, Num )
	for i = 0 , Num-1 do
		monster[ i ] = CreateObjByFlag( MonsterID[rand(3)], FlagObjID , FlagID, 1 )
	end
	for i = 0, table.getn(monster) do
		AddToPartition(monster[i], 0 )
		sleep( rand(10) )
		ks_MoveToFlag( monster[i], FlagObjID, Phase, 10 )
		SetPlot( monster[i], "dead", "Lua_423236_kill", 10)
		sleep( rand(10)+10 )
	end
	return monster
end
