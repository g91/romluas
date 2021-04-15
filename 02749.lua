--WriteRoleValue( Thief , EM_RoleValue_Register1 , FlowerNpc ) --�����O�����F
--WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 1 ) --����F�}�l�t�X���аO
--step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --������F�����{�b��t�����q
--key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --������F�����O�_�n�}�ҦU���q��t�A0�}�ҡA1����
--PlayerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 ) --������F�O��{�����a�H��
--FlowerNpc = ReadRoleValue( ObjID , EM_RoleValue_Register5 ) --����F�O��ۤv
--FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --��������F���W�᪺�ƶq�Ѧh��
--FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --��������F�Q��������

function Lua_jiyi_test_Flower_motion() --����F�����󲣥ͼ@��
	local FlowerNpc = OwnerID() --����F
	local RoomID = ReadRoleValue( FlowerNpc , EM_RoleValue_RoomID )
	local GameFlag = { 547321 , 547322 , 547354 } --TEST_�w���W�X�СBTEST_���ʶi�椤�BTEST_�w��L���y
	local Buff = { 623896 , 623704 , 623922 } --�����ʧޯ� , �P�H�x�ܨ��Ĥ� , �������Ī����@��
	local Reg2 = ReadRoleValue( FlowerNpc , EM_RoleValue_Register2 ) --�аO����F�O�_�n��t
	local time = 6
	local NPC = ReadRoleValue( FlowerNpc , EM_RoleValue_Register8 ) --����F�O���봵�S
	local HideBox = LuaFunc_SearchNPCbyOrgID( NPC , 121720 , 300 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	if z2FlowerNpc121654 == nil then
		z2FlowerNpc121654 = {} --�]�����ܼ�TABLE
	end
	z2FlowerNpc121654[RoomID] = {} --�M�Űϰ줺�����ܼ�
	NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_02]") --�����A�ڭn�ǳƤ��ɪᯫ�����ֵ��j�a
	SetModeEx( FlowerNpc , EM_SetModeType_Move , false )--����
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 0 ) --�g�J����F���b��t��
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register6 , 999 ) --�g�J�᪺�ƶq�@999��
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register5 , FlowerNpc ) --������F�O��ۤv	
	Sleep(30)

	local AllPlayer = SearchRangePlayer( FlowerNpc , 150 ) --�j�M����F�d��150�������a
	for i = 0 , #AllPlayer do --�ˬd�d�򤺩Ҧ������a
--		Say( FlowerNpc , "player-"..i )
		if CheckFlag( AllPlayer[i] , GameFlag[3] ) == false then --���a�S���w��L���y�X��
			if CheckFlag( AllPlayer[i] , GameFlag[1] ) == true then --���a���w���W�X��
				if CheckBuff( AllPlayer[i] , Buff[3] ) == true then--���a�����WBUFF
					if CheckBuff( AllPlayer[i] , Buff[2] ) == false then
						DW_CancelMount( AllPlayer[i] ) --�i�J�C�����i�M��
						SetFlag( AllPlayer[i] , GameFlag[2] , 1 ) --���}TEST_���ʶi�椤�X��
						CancelBuff( AllPlayer[i] , Buff[3] ) --�R���w�g���WBUFF
						AddBuff( AllPlayer[i] , Buff[1] , 0 , -1 ) --�������ʥΧޯ�
						AddBuff( AllPlayer[i] , Buff[2] , 0 , -1 ) --�����P�H�x�ܨ��Ĥ�
						CallPlot( AllPlayer[i] , "Lua_jiyi_test_Flower_motion3" , AllPlayer[i] , FlowerNpc ) --�P�ɰ����ˬd���a�M����F�������d�򤤱���	
						table.insert( z2FlowerNpc121654 , AllPlayer[i] ) -- �N���ʤ������a��J#z2FlowerNpc121654��
					--	table.remove( AllPlayer , 1 ) -- �N���ʤ������a�q#AllPlayer������
					end
				end	
			end
		end
	end
	Sleep(30)

	if Reg2 == 0 then 
		local HideBox = SearchRangeNPC( NPC , 400 )
		local OrgID = 121720	--���ê���
		for i = 0 , table.getn(HideBox) do
			if ReadRoleValue( HideBox[i] , EM_RoleValue_OrgID ) == OrgID then
				DelObj( HideBox[i] ) --�R�����ê��� 
			end
		end
		SAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_03]" ) --���F�@��Ϫ̡A�ڥi�H��ߪ��o��[121715]�F
		SetModeEx( FlowerNpc , EM_SetModeType_Move , true )--����
		WriteRoleValue( FlowerNpc , EM_RoleValue_IsWalk , 1 ) 
		CallPlot( FlowerNpc , "Lua_jiyi_test_Flower_motion2" , FlowerNpc , Reg2 )--������F����t�@��
	end
end
--====================================================================
--			����F����t�@��
--====================================================================
function Lua_jiyi_test_Flower_motion2( FlowerNpc , Reg2 ) --����F��t�@��
	WriteRoleValue( FlowerNpc , EM_RoleValue_IsWalk , 1 ) 
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 1 ) --����F�}�l�t�X���аO
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 0 ) --������F�����{�b��t�����q
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) --������F�����O�_�n�}�ҦU���q��t�A0�}�ҡA1����
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register7 , 10 ) --�g�J����F�i�H�Q����10��
	local RoomID = ReadRoleValue( FlowerNpc , EM_RoleValue_RoomID ) --Ū�����yID
	while true do
		local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --��������F���W�᪺�ƶq�Ѧh��
		local FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --��������F�Q��������
		local step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --���q
		local key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --�O�_�}�ҦU���q��t
		local Thief = 121711
		Lua_jiyi_Flower_PlayerCount_2() --�ˬd��U�����a�ƶq
		local PlayerCount = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 )
	--	DebugMsg( 0 , 0 , "PlayerCount 2 ="..PlayerCount )

		if PlayerCount == 0 then
			break
		elseif FlowerNpcAttacked <= 0 then --��Q����10����
			NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_04]") --�o�ǥi�c��[121711]�A�ݧڥΪ᭷�ɻ����A��
			SysCastSpellLv( FlowerNpc ,FlowerNpc , 850539 , 0 )  --����F��ۤv�I�񯻨F�ɧޯ����h���
			Sleep(20)
--			NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_05]")--�Q��[121711]�A�ڤ��o[121715]�F
			Sleep(30)
			break					
		elseif step == 0 then --�Ĥ@�q��t
			if key == 0 then --�}�Ҫ�t
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --�������q��t
				DW_MoveToFlag( FlowerNpc , 781188 , 1 , 0 , 1) --�̾��㹳�X�l�s�X����w�I
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_06]" )--[121711]���X�{�F�A�����ڻ����L��
				PlayMotion( FlowerNpc , 260 ) --����w�I�s�X������x��ʧ@
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --���沣�ͯ��֤��᪺�@��
		--		Say( FlowerNpc , "FlowerNum="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- ���ͪ��@��(�ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--�ˬd�Ī��ƶq
			end
		elseif step == 1 then --�ĤG�q��t
			if key == 0 then
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --�������q��t
				DW_MoveToFlag( FlowerNpc , 781188 , 2 , 0 , 1) --�̾��㹳�X�l�s�X����w�I
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_07]" ) --[121711]�S�X�{�F�A�n�i�ȡA�ֻ����L��
				PlayMotion( FlowerNpc , 260 ) --����w�I�s�X������x��ʧ@
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --���沣�ͯ��֤��᪺�@��
		--		Say( FlowerNpc , "FlowerNum2="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- ���ͪ��@��(�ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--�ˬd�Ī��ƶq
			end
		elseif step == 2 then --�ĤT�q��t
			if key == 0 then
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 1 ) --�������q��t
				DW_MoveToFlag( FlowerNpc , 781188 , 3 , 0 , 1) --�̾��㹳�X�l�s�X����w�I
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_07]" ) --[121711]�S�X�{�F�A�n�i�ȡA�ֻ����L��
				PlayMotion( FlowerNpc , 260 ) --����w�I�s�X������x��ʧ@
				CallPlot( FlowerNpc , "Lua_jiyi_CreateFlower_ByPlayerCount" , FlowerNpc , PlayerCount ) --���沣�ͯ��֤��᪺�@��
		--		Say( FlowerNpc , "FlowerNum3="..FlowerNum )
				CallPlot( FlowerNpc , "Lua_jiyi_Round_Npc" , FlowerNpc , Thief , 3 , 50 )-- ���ͪ��@��(�ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|)
				Sleep(10)
				CallPlot( FlowerNpc , "Lua_jiyi_Flower_Check_FlowerThief" , FlowerNpc , step , key )--�ˬd�Ī��ƶq
			end
		else
			break		
		end
	Sleep(10)
	end
	Say( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_08]" ) --�����A�ݨӧڸ����}�F
	local FlowerTable = SearchRangeNPC( FlowerNpc , 100 )
	local Flowers = 121715
	for j = 0 , #FlowerTable do
		if ReadRoleValue( FlowerTable[j] , EM_RoleValue_OrgID ) == Flowers then
			DelObj( FlowerTable[j] ) --�R�����֤���
		end
	end				
	z2FlowerNpc121654 = {} --�M�������ܼ�TABLE
	z2FlowerNpc121654[RoomID] = {} --�M�Űϰ줺�����ܼ�
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register2 , 0 ) --�аO����F��t����	
	DelObj( FlowerNpc ) --����F�R���ۤv
end
--================================================================================
--					����F���ͦh�֯��֤���
--================================================================================
function Lua_jiyi_CreateFlower_ByPlayerCount( FlowerNpc , PlayerCount ) --����F�̾ڲ{�����a�H�ƨM�w���h�֪�
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --��������F���W�᪺�ƶq�Ѧh��
	Sleep(10)
	if PlayerCount <= 5 then --���a�ƶq�֩�5
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 5 , 50 , true ) --�b�P��50���d���H�����ͯ��֤���
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -5 )
	elseif PlayerCount > 5 and PlayerCount <= 10 then --���a�ƶq�j��5�֩�10
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 10 , 50 , true ) --�b�P��50���d���H�����ͯ��֤���
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -10 )
	else
		Lua_CreateObjToRandownPos( FlowerNpc , 121715 , 15 , 50 , true ) --�b�P��50���d���H�����ͯ��֤���
		AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -15 )		
	end
end				 	
--==================================================================================
--					����F�ˬd���a�ƶq
--==================================================================================
function Lua_jiyi_Flower_PlayerCount_2()
	local FlowerNpc = OwnerID()
	local count = 0
	local AllPlayer = SearchRangePlayer( FlowerNpc , 100 ) --�j�M����F�d��100�������a
	for i = 0 , #AllPlayer  do --�ˬd�d�򤺩Ҧ������a
		if CheckBuff( AllPlayer[i] , 623704 ) == true then --���a���ܨ����A
			count = count + 1		
		end
	end
	WriteRoleValue( FlowerNpc , EM_RoleValue_Register4 , count )
	local PlayerCount = ReadRoleValue( FlowerNpc , EM_RoleValue_Register4 )
--	Say( FlowerNpc , "PlayerCount="..PlayerCount )		
end
--===============================================================
--				���b���a���W�ˬd���a�O�_�٦b���ʤ����j��
--===============================================================
function Lua_jiyi_test_Flower_motion3( player , FlowerNpc )	--���b���a���W�ˬd���a���A�����ʤ���
	while true do
		local Buff = { 623704 , 623896 } --�@��Ϫ̪��A , �����ʧޯ�		
		local dis = GetDistance( FlowerNpc , player ) --�ˬdplayer�M����F�������Z��
		if CheckBuff( player , Buff[1] ) == false or CheckBuff( player , Buff[2] ) == false then --���a�S���ܨ����Abuff�ά��ʧޯ�N���h���
			break
		elseif CheckID( FlowerNpc ) == false then
			break		
		elseif dis >= 150 then --��Z���W�L150�N���h���
			ScriptMessage( FlowerNpc , player , 1 , "[SC_2013FLOWERS_NPC_121654_10]" , C_SYSTEM )--ĵ�i�T��
			break	
		elseif dis >= 100 and dis < 150 then --��Z��100~150��
			ScriptMessage( FlowerNpc , player , 1 , "[SC_2013FLOWERS_NPC_121654_09]" , C_SYSTEM )--�Z���ӻ��F�A�֦^[121654]����O�@�o�a		
		end
	Sleep(10)	
	end
	Sleep(10)
	--���X�j��N�R�����ʧޯ�
	CancelBuff( player , 623896 ) --�R�����ʧޯ�
	CancelBuff( player , 623704 ) --�R���ܨ�
	CancelBuff( Player , 623921 ) --�R���B�~�ޯ�
	for k = 1 , table.getn(z2FlowerNpc121654) do
		if z2FlowerNpc121654[k] == Player then
			table.remove( z2FlowerNpc121654 , k ) -- �N���ʤ������a�q#z2FlowerNpc121654������
		end	
	end
--	DebugMsg( 0 , 0 , "z2FlowerNpc121654="..table.getn(z2FlowerNpc121654) )
	ScriptMessage( player , player , 2 , "[SC_2013FLOWERS_NPC_121654_13]" , C_SYSTEM )--���ʵ����A�Ч�ᤧ���֥浹[121383]	
end
--==================================================================
--				����F�ˬd�Ī��ƶq�@��		
--==================================================================
function Lua_jiyi_Flower_Check_FlowerThief( FlowerNpc , step , key ) --�ˬd�Ī��ƶq
	while true do 
		local SearchThief = SearchRangeNPC( FlowerNpc , 100 )
		local Fairy = 121711
		local ThiefNpc = {}
 	
		for i = table.getn( SearchThief ) , 0 , -1 do
			if ReadRoleValue( SearchThief[i] , EM_RoleValue_OrgID ) == Fairy then
				table.insert( ThiefNpc , SearchThief[i] ) --�O���N��J#ThiefNpc��
				table.remove( SearchThief , i ) --�q#SearchThief���������
			end
		end
		local Num = table.getn( ThiefNpc )
	--	DebugMsg( 0 , 0 , "Num ="..Num )						
		if Num == 0 then		
			if step == 0 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --�S��[121711]�u�n�A�ڭn���U�@���e�i�F
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 1 ) --������F��g�{�b��t���q=1
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) --������F�����}�ҤU���q��t
				break
			elseif step == 1 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --�S��[121711]�u�n�A�ڭn���U�@���e�i�F
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 2 ) --������F��g�{�b��t���q=2
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---������F�����}�ҤU���q��t
				break
			elseif step == 2 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_11]" ) --�S��[121711]�u�n�A�ڭn���U�@���e�i�F
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 3 ) --������F��g�{�b��t���q=3
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---������F�����}�ҤU���q��t
				break
			elseif step == 3 then
				Sleep(10)
				NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_12]" ) --[121715]�o�e���F�A�ڭn�^�h�M�ᯫ�ɥR�@�Ǥ~��
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register1 , 4 ) --������F��g�{�b��t���q=4
				WriteRoleValue( FlowerNpc , EM_RoleValue_Register3 , 0 ) ---������F�����}�ҤU���q��t
				break
			end
		end
	Sleep(10)
	end				
end	
--========================================================
--				�Ī�鲣�ͼ@��
--========================================================
function Lua_jiyi_Round_Npc( ObjID , CreateID , CreateCount , Distance ) --���ͱĪ��@���A��s��"Lua_Hao_Round_wall"
-- �ѦҪ���B�إߪ���ID�B�إߪ��󪺼ƶq�B�ꪺ�b�|
	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local BaseX = ReadRoleValue( ObjID , EM_RoleValue_X )
	local BaseY = ReadRoleValue( ObjID , EM_RoleValue_Y )
	local BaseZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
	local BaseDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
	local FlowerNpc = ReadRoleValue( ObjID , EM_RoleValue_Register5 ) --����F�O��ۤv	
	local CreateID = CreateID -- �إߪ���ID
	local Polygon = CreateCount -- �إߪ��󪺼ƶq
	local dis = Distance -- �Z����ߪ��Z��
	local Count = 1
	local NewCoount = {}

	for i = 1 , Polygon , 1 do
		NewCoount[i] = CreateObj( CreateID , BaseX-dis*math.cos(math.pi*2*(i/Polygon)) , BaseY , BaseZ+dis*math.sin(math.pi*2*(i/Polygon)) , BaseDir , 1 )
		SetModeEx( NewCoount[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( NewCoount[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( NewCoount[i] , EM_SetModeType_Obstruct , false )--����
		SetModeEx( NewCoount[i] , EM_SetModeType_Mark , true )--�аO
		SetModeEx( NewCoount[i] , EM_SetModeType_Move , true )--����
		SetModeEx( NewCoount[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( NewCoount[i] , EM_SetModeType_HideName , true )--�W��
		SetModeEx( NewCoount[i] , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( NewCoount[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NewCoount[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( NewCoount[i] , EM_SetModeType_Show , true )--���
		AdjustFaceDir( NewCoount[i] , ObjID , 0 ) 	-- ���إߪ��󭱦V�ѦҪ���
		AddToPartition( NewCoount[i] , RoomID )
		WriteRoleValue( NewCoount[i] , EM_RoleValue_IsWalk , 0 ) 
		WriteRoleValue( NewCoount[i] , EM_RoleValue_Register1 , FlowerNpc ) --�����O�����F
		local step = ReadRoleValue( FlowerNpc , EM_RoleValue_Register1 ) --���ʶ��q
		local key = ReadRoleValue( FlowerNpc , EM_RoleValue_Register3 ) --�O�_�}�ҦU���q��t
		local Attack = ReadRoleValue( NewCoount[i] , EM_RoleValue_Register2 ) --�ΨӰO�����Q����������
		if step == 0 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 2 ) --�g�J���i�H�Q��������3��
		elseif step == 1 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 4 ) --�g�J���i�H�Q��������5��
		elseif step == 2 then
			WriteRoleValue( NewCoount[i] , EM_RoleValue_Register2 , 9 ) --�g�J���i�H�Q��������10��
		end
		CallPlot( NewCoount[i] , "Lua_jiyi_Flower_Test_FlowerThief" , NewCoount[i] )
	end
end

function Lua_jiyi_Flower_Test_FlowerThief( Thief ) --�Ī�骺���ͼ@��
	local FlowerNpc = ReadRoleValue( Thief , EM_RoleValue_Register1 ) --�����O�����F
	local Attack = ReadRoleValue( Thief , EM_RoleValue_Register2 ) --�ΨӰO�����Q����������
	local Distan = GetDistance( Thief , FlowerNpc ) --�ˬd�Ī��M����F�������Z��
	local X = ReadRoleValue( Thief , EM_RoleValue_X )
	local Y = ReadRoleValue( Thief , EM_RoleValue_Y )
	local Z = ReadRoleValue( Thief , EM_RoleValue_Z )
	local D = ReadRoleValue( Thief , EM_RoleValue_Dir )
	local timer = 0
	while true do
		timer = timer +1
		if Distan < 300 then
			if CheckID( FlowerNpc ) == true then
				if timer%(6+Rand(2)) == 0 then   -- �C5��]�@��
					CastSpell( Thief , FlowerNpc , 850538 ) --���������F�I������ޯ�
				else
					local Range = 20 +  rand(5) --�üƲ��ʽd��
					sleep(10) 
					MoveDirect( Thief , X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
				end
			end
	
			if Attack == 0 or CheckID( FlowerNpc ) == false then
				DelObj( Thief ) --�R�����
			end
		end
	Sleep(10)
	end
end  	