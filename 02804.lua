--=========================================================
--				�᪺Ĳ�I�@��
--=========================================================
function Lua_jiyi_Flower_touch() --���b�᪺���󲣥ͼ@���W
	local Flower = OwnerID()
	local Player = TargetID()

	SetPlot( Flower , "touch" , "Lua_jiyi_Flower_touch2" , 30 )
	for i = 0 , 30 do
		Sleep(10)
		if i == 30 then
			WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --���iĲ�I
			DelObj( Flower ) --�R��Flower		
		end
	end
end

function Lua_jiyi_Flower_touch2()
	local Player = OwnerID()
	local Flower = TargetID()
	local GameFlag = { 547321 , 547354 } --TEST_�w���W�X�СBTEST_�w��L���y
	local Buff = { 623704 , 623703 , 623900 , 623921 } --�ܨ�BUFF�B�o��BUFF�B�w�ĹL��BUFF�B���B�~�ޯ�
	local touch = ReadRoleValue( Flower , EM_RoleValue_PID  )
	local RandNum = DW_Rand(10)
	if touch == 0 then
		if CheckBuff ( Player , Buff[1] ) == true then --���a���b���ʤ����ܨ�BUFF
			if CheckFlag( player , GameFlag[2] ) == false then --���a�٨S���
				if CheckBuff ( Player , Buff[3] ) == false then --���a�S���w�ĹL��BUFF
					if RandNum == 1 or RandNum == 5 or RandNum == 7 then
						AddBuff ( Player , Buff[4] , 0 , -1 ) --���B�~�ޯ�
						AddBuff ( Player , Buff[2] , 0 , -1 ) --�o��
						AddBuff ( Player , Buff[3] , 0 , 10 ) --�w�ĹL��BUFF				
						ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_04]" , C_SYSTEM )--�A�ߨ�@���֦��S�O�h��q��[121715]�A�⮩��[850541]�ޯ�			
						WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --���iĲ�I
						DelObj( Flower ) --�R�����֤���	
					else
						AddBuff ( Player , Buff[2] , 0 , -1 ) --�o��
						AddBuff ( Player , Buff[3] , 0 , 10 ) --�w�ĹL��BUFF				
						ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_02]" , C_SYSTEM )--�A��o�F�ᤧ����			
						WriteRoleValue( Flower , EM_RoleValue_PID , 1 ) --���iĲ�I
						DelObj( Flower ) --�R�����֤���
					end
				else
					ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_03]" , C_SYSTEM )--�A�ĹL���֤���F�A�d�@�ǵ��O�H�a
				end				
			else
				ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )	
			end
		else
			ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )
		end
	else
		ScriptMessage( Player , Player , 2 , "[SC_2013FLOWERS_NPC_121715_01]" , C_SYSTEM )			
	end		
end
--=========================================================
--				���WNPC��ܼ@��
--=========================================================
function Lua_jiyi_test_FlowerNpc()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local GameFlag = { 547321 , 547322 , 547354 } --TEST_�w���W�X�СBTEST_���ʶi�椤�BTEST_�w��L���y
	local Buff = 623922 --���WBUFF
	local SignUp = ReadRoleValue( Npc , EM_RoleValue_PID ) --NPC�i�_���W

	if CheckFlag( Player , GameFlag[3] ) == true then --���a��TEST_�w��L���y�X��
		SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_05]" ) --�A���Ѥw�g���O�@�L[121654]�A�ᯫ�i��w�g�O��A�F�A���Ѧb�A�����ڧa�C
	elseif SignUp == 1 then --0~10���i�H���W���ɭ�		
		if CheckFlag( Player , GameFlag[2] ) == true then --���a�����ʶi�椤�X��
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_06]" )--�A��ᤧ���ֱa�ӤF�ܡH
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_07]" , "Lua_jiyi_test_FlowerNpc4" , 0 )  --�O���A�����A�a�^�ӤF�C
		elseif CheckFlag( Player , GameFlag[1] ) == false then --���a�S���w���W�X��
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_01]" )  --�A�@�N���U�ڶܡH
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_02]" , "Lua_jiyi_test_FlowerNpc2" , 0 )  --�p�G�گ����o�W�A�����A�A�N���ݬݧa�C
		elseif CheckFlag( Player , GameFlag[1] ) == true and CheckBuff( Player , Buff ) == false then --���a���w���W�X�Ц��S�����WBUFF
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_20]" )--�A�w�g���ѿ��L�������֪����|�A�ЧA���ѦA�������ڧa�C
		else 
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_04]" )  --�y���@�U�A[121654]�N�|�X�{�b�e�褣���B�C		
		end							
	else --�D���W�ɶ�
		if CheckFlag( Player , GameFlag[2] ) == true then --���a�����ʶi�椤�X��
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_06]" )--�A��ᤧ���ֱa�ӤF�ܡH
			AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_07]" , "Lua_jiyi_test_FlowerNpc4" , 0 )  --�O���A�����A�a�^�ӤF�C
		elseif CheckFlag( Player , GameFlag[1] ) == true and CheckFlag( Player , GameFlag[2] ) == false then --���a���w���W�X�Ц��S�����ʶi�椤�X��
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_20]" )--�A�w�g���ѿ��L�������֪����|�A�ЧA���ѦA�������ڧa�C	
		else
			SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_21]" )--�n�Q��o�ᯫ�����ְڡK		
		end
	end					
end

function Lua_jiyi_test_FlowerNpc2() --�@�N���U�L
	local player = OwnerID() --���a
	local npc = TargetID() --npc
--	CloseSpeak( player )	--������ܵ���
	SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_03]" )  --���ʻ���
	AddSpeakOption( player , npc , "[SC_2013FLOWERS_NPC_121383_08]", "Lua_jiyi_test_FlowerNpc3" , 0 )  --�n�ڡA�ڥh���A�����@�ǯ��֡C
--	CloseSpeak( player )	--������ܵ���
end

function Lua_jiyi_test_FlowerNpc3()
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local GameFlag = { 547321 , 547354 } --TEST_�w���W�X�СBTEST_�w��L���y
	local buff = 623922 
	DesignLog( Player , 121383 , " 2013Flower Code event STAR" )	--�O���ѥ[�H��
--	CloseSpeak( Player )	--������ܵ���
	SetSpeakDetail( player , " [SC_2013FLOWERS_NPC_121383_09] " )  --�ڪ����ִN��I��A�F�C
	AddBuff( Player , buff , 0 , 900 )--�������Ī����@��
	SetFlag( Player , GameFlag[1] , 1 )
--	CloseSpeak( Player )	--������ܵ���
end

function Lua_jiyi_test_FlowerNpc4()--����y
	local Player = OwnerID() --���a
	local Npc = TargetID() --NPC
	local BuffID = 623703
	local reward = { 209161 , 724509 } --���y�G���ʼ���B�������Ĥ�
	local BuffLv =  FN_CountBuffLevel( Player , BuffID ) --�ˬd���a���WBUFF
	local GameFlag = { 547321 , 547322 , 547354 } --�w���W�X�СB���ʶi�椤�B�w��L���y
	CloseSpeak( Player )	--������ܵ���
	if BuffLv <= 0 then --BuffLv���1
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[2] , 1 ) --���@���Ĥ�
	elseif BuffLv >= 1 and BuffLv < 59 then --BuffLv>=1<60
		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 1 ) --���@�i���ʼ���
	elseif BuffLv >= 59 and BuffLv < 98 then --BuffLv>=60<99
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --���G�i���ʼ���
	elseif BuffLv >= 98  then --BuffLv>=99
 		CancelBuff( player , BuffID )
		GiveBodyItem( player , reward[1] , 2 ) --��2�i���ʼ���
		GiveBodyItem( player , reward[2] , 1 ) --���@���Ĥ�	
	end
	SetSpeakDetail( player , "[SC_2013FLOWERS_NPC_121383_10]" ) --���§A���ڦ�������
--	SetFlag( Player , GameFlag[1] , 0 ) --�����w���W�X�кX��
	SetFlag( Player , GameFlag[2] , 0 ) --�������ʶi�椤�X��
	SetFlag( Player , GameFlag[3] , 1 )-- �w�g����L���y
	DesignLog( Player , 1213831 , " 2013Flower Code event OVER" )	--�O�������H��
	Lua_Festival_02_All(Player) --���Լ�
end
--======================================================
--				���b121383���W�ˬd�ɶ���������
--======================================================
function Lua_jiyi_Flower_Test_Control()
	local Npc = OwnerID()
	local Box = LuaFunc_SearchNPCbyOrgID( Npc , 121383 , 100 , 0 ) --�H���ê��󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local RoomID = ReadRoleValue( Npc , EM_RoleValue_RoomID ) --Ū�����yID
	AddBuff( Npc , 503217 , 1 , -1 ) --�`�y�Ÿ�
	while true do
		local Hour = GetSystime(1) --���o�{�b�ɶ��G��
		local Min = GetSystime(2) --���o�{�b�ɶ��G��
--		Say( Npc , GetSystime(1)..":"..GetSystime(2) )
		local Reg1 = ReadRoleValue( Box , EM_RoleValue_Register1 )  -- ���եγ��W�}��
		if  Reg1 == 100  then  
--			Say( Box , "100" )
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --��NPC��PID�ȼg��"0"�A�����}����W
			local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --���ͬ���NPC
			SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--�Y����
			addToPartition( FlowerNpc , RoomID )
			WriteRoleValue( Box , EM_RoleValue_Register1 , 0 ) -- �NNPC R1 ��^ 0
			NPCSAY( Box , "The game is star" )	
			WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--������F�O��봵�S	
		--	local reg8 = ReadRoleValue( FlowerNpc , EM_RoleValue_Register8 )
	--		DebugMsg( 0 , 0 , "reg8="..reg8 )						
		elseif Reg1 == 99 then  	---- ���եγ��W�ɬq
--			Say( Box , "99" )
			NPCSAY( Box , " The game will begin , please join me !" )
			if ReadRoleValue( Npc , EM_RoleValue_PID )  == 0 then 
				WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
			end
			local HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --�������ê���
			addToPartition( HideBox , RoomID )
			NPCSAY( Box , "[SC_2013FLOWERS_NPC_121383_19]" ) --�A�L�X����[121654]�N�n�X�{�F
			WriteRoleValue( Box , EM_RoleValue_Register1 , 0 ) -- �NNPC R1 ��^ 0
		else
			if ( Hour == 13 ) or ( Hour == 16 ) or ( Hour == 19 ) or ( Hour == 22 )  then 
				if min == 0 then
					local HideBox 
					HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --�������ê���
					addToPartition( HideBox , RoomID )
					RunningMsgEx( Npc , 2 , 3 , "[SC_2013FLOWERS_NPC_121383_11]" ) --�i�H�}�l���W
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --NPC�i���W���A
				elseif Min == 10 then --10�����ʶ}�l���ɭ�
					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC���i���W���A 
					local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --���ͬ���NPC	
					SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--�Y����
					addToPartition( FlowerNpc , RoomID )
					WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--������F�O��봵�S	
				elseif Min == 1 or Min == 3 or Min == 5 or Min == 9 then
					NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_19]" ) --�A�L�X����[121654]�N�n�X�{�F
				elseif Min == 7 then --7�����ʧֶ}�l���ɭ�	
					NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_12]" ) --�A�L3����[121654]�N�n�X�{�F
--				else --��L�D���W�ɶ�
--					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC���i���W���A
				end				
			else --��L�p��
				if Min == 0 then --0�����ʳ��W���ɭ�
					local HideBox = CreateObjByFlag( 121720 , 781188 , 0 , 1 ) --�������ê���
					addToPartition( HideBox , RoomID )
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --NPC�i���W���A			
				elseif Min == 10 then --10�����ʶ}�l���ɭ�
					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC���i���W���A 
					local FlowerNpc = CreateObjByFlag( 121654 , 781188 , 0 , 1 ) --���ͬ���NPC	
					SetModeEx( FlowerNpc  , EM_SetModeType_ShowRoleHead , True )--�Y����
					addToPartition( FlowerNpc , RoomID )
					WriteRoleValue( FlowerNpc , EM_RoleValue_Register8 , Npc )	--������F�O��봵�S		
				elseif Min > 0 and Min< 10 then --0~10�����W���ɭ�
					if Min == 1 or Min == 3 or Min == 5 or Min == 9 then
						NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_19]" ) --�A�L�X����[121654]�N�n�X�{�F
					elseif Min == 7 then --7�����ʧֶ}�l���ɭ�	
						NPCSAY( Npc , "[SC_2013FLOWERS_NPC_121383_12]" ) --�A�L3����[121654]�N�n�X�{�F
					end
--				else --��L�D���W�ɶ�
--					WriteRoleValue( Npc , EM_RoleValue_PID , 0 ) --NPC���i���W���A
				end
			end
		end				
	Sleep(600) --�C�����ˬd
	end	
end
-------------------------------------------------------------------------------------------------------------------------
--					���ի��O
-------------------------------------------------------------------------------------------------------------------------
function Lua_jiyi_2013Flower_Test_Control() --���ն}�ҳ��W�ɬq
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 121383 , 300 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 99 )
	WriteRoleValue( Npc , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )  -- ���եγ��W�}��
	Say( NPC , "Flower NPC ="..Reg1 )
end

function Lua_jiyi_2013Flower_Test_Control2() --���ն}�Ҭ��ʮɬq
	local player = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( player , 121383 , 300 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register1 , 100 ) 
	local Reg1 = ReadRoleValue( NPC , EM_RoleValue_Register1 )  -- ���եγ��W�}��
	Say( NPC , "Flower NPC ="..Reg1 )
end

function Lua_jiyi_2013Flower_Test_GameFlag()--���եΧR�������X�СB����BUFF
	local player = OwnerID()
	local Mode = { 547321 , 547322 , 547354 }	--���ʥκX�СG�w���W�������֡B�������ֶi�椤�B�w��L���ּ��y
	local buff = { 623703 , 623704 , 623894 , 623896 , 623921 , 623922 } --�ᤧ����(����BUFF)�B�@��Ϫ̪��A�B�@��x�B�����ʧޯ�B���B�~�ޯ�B�������Ī����@��
	for i = 1 , 3 do
		setflag( player , Mode[i] , 0 ) --�����Ҧ��X��
	end

	for i = 1 , 6 do
		CancelBuff( player , buff[i] ) --�R������BUFF
	end
end

function Lua_jiyi_2013Flower_Test_GameFlag2()--���եΧR�����ʺX�СB����BUFF(�u�O�d�w���W�X��)
	local player = OwnerID()
	local Mode = { 547322 , 547354 }	--���ʥκX�СG�������ֶi�椤�B�w��L���ּ��y
	local buff = { 623703 , 623704 , 623894 , 623896 , 623921 } --�ᤧ����(����BUFF)�B�@��Ϫ̪��A�B�@��x�B�����ʧޯ�B���B�~�ޯ�
	for i = 1 , 2 do
		setflag( player , Mode[i] , 0 ) --�����Ҧ��X��
	end

	for i = 1 , 5 do
		CancelBuff( player , buff[i] ) --�R������BUFF
	end
end

function Lua_jiyi_2013Flower_Test_122801(lv) --���դ���
	local PlayerID = OwnerID()	
	AddBuff( PlayerID , 623703 , lv , -1 )
end