----------240706���~�ϥ��ˬd(�˪L�����~)---------------------------------------------------------------------------------
function Lua_ying_Q424871_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( NPC , EM_RoleValue_MaxHP ) --�`��q
	local NowHP = ReadRoleValue( NPC , EM_RoleValue_HP ) --�ثe��q

	DW_CancelTypeBuff( 68 , OwnerID()) --�M�����M�ɡA�I���U��

	if OrgID == 106391 then --�L�����\
		if GetDistance( Player , NPC ) <= 30 then --�Z��30��
			if CheckID( NPC ) == true and ReadRoleValue( NPC , EM_RoleValue_IsDead ) == 0 then --���㪺���\����s�b
				if NowHP/MaxHP <= 0.4 then --�ثe��q<= 40%
					return true
				else
					ScriptMessage( Player , Player , 1 , "[SC_424871_1][$SETVAR1=".."[".."106391".."]".."]" , 0 ) --�����b[�L�����\]����L�h�ɤ~�i�i��ļˡI
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[SC_422565_2]" , 0 ) --�ؼФw���`
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --�A���Z���ӻ��A�ЦA�a��@�I�I
			return false
		end
	else
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
		return false
	end
end
------�ϥ�240706���~--------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424871_use()

	local Monster = TargetID()
	local Player = OwnerID()
	local PID = ReadRoleValue( Monster , EM_RoleValue_PID ) --Ū���\PID

	 if PID == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_424871_2]" , 0 ) --���ؼФw�Q�ļ˹L�I
	else
		GiveBodyItem( Player , 240032 , 1 ) --�������\����G�˥�
		DelBodyItem( Player , 240706 , 1 ) --�ļ˥ΪŲ~
		WriteRoleValue( Monster , EM_RoleValue_PID , 1 ) --�ļ˫�PID�g�J1
--		BeginPlot( Monster , "Lua_ying_Q424871_leave" , 0 ) 
	end
end
------�ˬd�O�_���}�԰�----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424871_leave()

	local Monster = OwnerID()

	while true do
		if HateListCount( Monster ) ~= 0 then --������ƶq~=0 ��ܾ԰���
			Sleep(10) --�C���ˬd�@��
		else
			WriteRoleValue( Monster , EM_RoleValue_PID , 0 ) --���}�԰�PID�אּ0
			break
		end
	end
end
--------620923�򥻪k�N-�ˬdLUA--------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )

	if OrgID == 119648 then --��տ���
		return true
	else
		ScriptMessage( Player , Player , 1 , "[SC_102706_13]" , 0 ) --"�I�k�ؼФ����T"
		return false
	end
end
-------119648��տ���-���󲣥ͼ@��-----------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick()

	SetPlot( OwnerID() , "Touch" , "Lua_ying_Q424873_pick01" , 30 )
end
-------�Ĺ�տ���119648---------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick01()

	local Player = OwnerID()
	local NPC = TargetID()
	local Quest1 = CheckAcceptQuest( Player , 424873 ) --���ȡG��w���F
	local Quest2 = CheckAcceptQuest( Player , 424880 ) --���ȡG��w���F
	local Quest3 = CheckAcceptQuest( Player , 424886 ) --���ȡG��w���F
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )

	if Quest1 == true or Quest2 == true or Quest3 == true then
		if Mount == true then
			DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��
			if Magic == 0 then --�ثe�S���I�����k�N
				if BeginCastBarEvent( Player , NPC , "[SC_424873_2]" , 20 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q424873_pick02") ~= 1 then -- �K����տ�(2��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
--				else --CastBarĲ�o���\
--					BeginPlot( Player , "Lua_ying_Q424873_breakbar", 0 )
				end
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
		end
	else --��������
		ScriptMessage( Player , Player , 1 , "[SC_424873_1]" , C_SYSTEM ) --�o�迹����G���Ǥ��P�K
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_Q424873_breakbar()
--
--	local Player = OwnerID()
--	local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )
--
--	for  i = 1 , 10 , 1 do
--		local Magic = ReadRoleValue( Player , EM_RoleValue_SpellMagicID )
--		Say( Player , "Magic = "..Magic )
--		if Magic ~= 0 then
--			--EndCastBar( Player , CheckCastBar( Player ) ) --�M���I�k��
--			MagicInterrupt( Player )
--			break
--		end
--		Sleep(2)
--	end
--end
-------����Ķ��I�k��---------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_pick02( Player , CheckStatus )

	local NPC = TargetID()
	local BUFF = CheckBuff( NPC , 620923 ) --�F�𺡷�

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				if BUFF == true then
					GiveBodyItem( Player , 240786 , 1 ) --������տ�
				else
					GiveBodyItem( Player , 240787 , 1 ) --�������q����	
				end
				SetModeEx( NPC , EM_SetModeType_Mark , false ) --���üаO
				SetModeEx( NPC , EM_SetModeType_Show , false ) --���ù�կ�
				BeginPlot( NPC , "Lua_ying_Q424873_show", 0 ) --��ܹ�կ�
				EndCastBar( Player , CheckStatus ) --�M���I�k��
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end
-----------10�����ܹ�կ�----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_show()

	local NPC = OwnerID()
	Sleep(100) --10��
	SetModeEx( NPC , EM_SetModeType_Mark , true ) --��ܼаO
	SetModeEx( NPC , EM_SetModeType_Show , true ) --��ܹ�կ�
end
----------240789���~�ϥ��ˬd(�W�h�F��)-------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_check()

	local NPC = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( NPC , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( NPC , EM_RoleValue_MaxHP ) --�`��q
	local NowHP = ReadRoleValue( NPC , EM_RoleValue_HP ) --�ثe��q
	local PID = ReadRoleValue( NPC , EM_RoleValue_PID )

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckID( NPC ) == true and ReadRoleValue( NPC , EM_RoleValue_IsDead ) == 0 then --���㪺���\����s�b
		if PID == 0 then
			if OrgID == 106415 then --���㪺���\����
				if GetDistance( Player , NPC ) <= 30 then --�Z��30��
					if NowHP/MaxHP <= 0.3 then --�ثe��q<= 30%
						return true
					else
						ScriptMessage( Player , Player , 1 , "[SC_424874_1][$SETVAR1=".."[".."106415".."]".."]" , 0 ) --[���㪺���\����]���¥R���ۤO�q�A���_��ܡK
						return false
					end
				else
					ScriptMessage( Player , Player , 1 , "[SC_424086_8]" , 0 ) --�A���Z���ӻ��A�ЦA�a��@�I�I
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
				return false
			end
		else
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
			return false
		end
	else --���s�b
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
		WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --���`��PID�g�J1
		return false
	end
end
----------���㪺���\����-���󲣥ͼ@��----------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_reset()

	local Monster = OwnerID()
	WriteRoleValue( Monster , EM_RoleValue_PID , 0 )
	ic_MOB_BUFF_22()
end
-----------�ϥ�240789���~-----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424874_use()
	CallPlot( TargetID(), "Lua_ying_Q424874_do", OwnerID() )
end

function Lua_ying_Q424874_do( Player )
	local Monster = OwnerID()
	local Obj = Role:new( Monster ) --�b"���㪺���\����"���m�A�إ߷s��NPC
	local Ghost
	local Npcid = 106368 --���\��w�F��h�W

	Hide( Monster )
	KillID( Monster , Monster )
	if DW_Rand(100) <= 70  then
		Ghost = CreateObj( 106416 , Obj :X() , Obj :Y()  , Obj :Z() , Obj:Dir() , 1 ) --�إ�"���R�����\����"
		DW_QietKillOne( Player , Npcid ) --��������NPC - ���\��w�F��h�W
	else
		Ghost = CreateObj( 106417 , Obj :X() , Obj :Y()  , Obj :Z() , Obj:Dir() , 1 ) --�إ�"�o�g�����\����"
	end
	AddToPartition( Ghost , 0 )
	BeginPlot( Ghost , "Lua_ying_Q424873_move" , 0 ) --����
	WriteRoleValue( Ghost , EM_RoleValue_LiveTime , 30 ) --�ͦs�ɶ�30��
end
----------�ϫإߥX�Ӫ����------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424873_move()

	local Monster = OwnerID()

	WriteRoleValue( Monster , EM_RoleValue_IsWalk , 1  )-- ��NPC�Ψ���
	Hide( Monster )
	Show( Monster , 0 )

	while TRUE do
		DW_MoveRand( Monster , 140 )  --ObjID �Q�i�沾�ʪ�����   RandRange �Q�H�����ʪ��S��(���|)
		Sleep(50)
	end
end
---------�ϥΪ��~240826��g��119632------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_search()

	local Player = OwnerID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }
	--�X�Ц�m = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 }
	local KeyPos = {}
--	local KeyPos = {[545822] = 1;
--			[545823] = 2;
--			[545824] = 3;}
	local HaveKey = {} --���]{ 545823 , 525826 }
	local KeyNum = 0 --�p�⨭�W���X��key

	for j = 1 , 10 , 1 do
		KeyPos[545821+j] = j-1 --KeyPos[545822]=0 , KeyPos[545823]=1 , KeyPos[545824]=2...
	end

	for i = table.getn(Key) , 1 , -1 do --�q�᩹�e�� -- i �q 10 �Ʀ^ 1
		if CheckFlag( Player , Key[i] ) == true then --��key
			table.insert( HaveKey , Key[i] ) --�ĤG������ɡAHaveKey�|�M�Ŭ�{} �A�ҥH�N����key��JHaveKey
--			table.remove( Key , i ) --�N����key�qKey table �R��
			KeyNum = KeyNum +1 --��key�[1
		end
	end

	if KeyNum < 1 then
		local Random = DW_Rand(#Key)
		SetFlag( Player , Key[Random] , 1 )
		table.insert( HaveKey , Key[Random] )
	end

	local Count = CountBodyItem( Player , 240790 ) --�K������
	local Dis , Pos

	if Count < 1 then
		local X = HaveKey[1] --545823
		Pos = KeyPos[X] --�X�Ц�m --KeyPos[545823]=1
		Dis = KS_GetFlagDistance( Player , 781047,  Pos ) --�P�X�жZ��(����, �X��ID, �X�Ц�m) 
	else
		ScriptMessage( Player , Player , 1 , "[SC_424875_5]" , 0 ) --�A�w�g�֦��F�K�������I
		return
	end
	
	local String = Math.ceil(Dis / 150) --�L����i��(�Z��/150)
	--1. ��q���ӷ���m�X�{�F�I 2. �V�ӶV�a���q���ӷ��K 3. �o������G���ۨǷL����q�K  4. ����������������q�K
	if String == 1 then --�Z��150��
		Q424875_Soilobj = Q424875_Soilobj or {} --�g������ܼ� --�p�G Q424875_Soilobj ~= nil �h Q424875_Soilobj  �|���� Q424875_Soilobj�A�p�G Q424875_Soilobj  == nil �h Q424875_Soilobj  = {}
		if Q424875_Soilobj[Pos] == nil or CheckID( Q424875_Soilobj[Pos] ) == false then --Q424875_Soilobj[Pos] =nil���X�{�L�g�� , CheckID( Q424875_Soilobj[Pos] ) = false �X�{�L�g����R��
			Q424875_Soilobj[Pos] = CreateObjByFlag( 119632 , 781047 , Pos , 1 ) --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq ) --�N���ͪ�GUID�����bQ424875_Soilobj[Pos]��
			SetModeEx( Q424875_Soilobj[Pos] , EM_SetModeType_Mark , true ) --��ܼаO
			SetModeEx( Q424875_Soilobj[Pos] , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
			AddToPartition( Q424875_Soilobj[Pos] , 0 )
			WriteRoleValue( Q424875_Soilobj[Pos] , EM_RoleValue_Register1 , Pos ) --�g�JRegister1��Pos��
			BeginPlot( Q424875_Soilobj[Pos] , "Lua_ying_Q424875_delSoil", 0 ) --20���R���g��
		end
	elseif String > 4 then --�Z���b450�H�W
		String = 4
	end
	ScriptMessage( Player , Player , 1 , "[SC_424875_"..String.."]" , C_SYSTEM )
end
----------20���R���g��-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delSoil()

	local Soil = OwnerID()
	
	Sleep(200) --20��
	if CheckFlag( Soil , 545874 ) == true then --�ˬd�O�_���H�I���g�� --true=��
		SetFlag( Soil , 545874 , 0 ) --�R���g��W���ˬdKEY
		Lua_ying_Q424875_delSoil()
	else --�SKEY�A�S�H�I��
		DelObj( Soil )
	end
end
----------�I���g��--------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_soilbar()
	
	SetPlot( OwnerID() , "Touch" , "Lua_ying_Q424875_soil01" , 30 )
end
---------Ū���I�k���e�ˬd------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_soil01()

	local Player = OwnerID()
	local NPC = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }
	--�X�Ц�m = { 0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 }
	local Pos = ReadRoleValue( NPC , EM_RoleValue_Register1 ) --Ū���g��W��Register1�� --�P�_�g���mPos
	local Count = CountBodyItem( Player , 240790 ) --�K������
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local Type = 0 --�p��

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if Mount == true then --���b��y
		for i = 1 , #Key , 1 do
			if CheckFlag( Player , Key[i] ) == true then
				if i - 1 == Pos then --key�P�g�諸pos�ŦX
					if Count < 1 then --���a���W���K������0��
						if BeginCastBarEvent( Player , NPC , "[SC_VALENTINE_2011EV1_08]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "Lua_ying_Q424875_pick02") ~= 1 then --�����g��(3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
							ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
						else --CastBarĲ�o���\
							SetFlag( NPC , 545874 , 1 ) --�I���ɵ����g���ˬdkey
						end
					else --������
						ScriptMessage( Player , Player , 1 , "[SC_424875_5]" , 0 ) --�A�w�g�֦��F�K�������I
					end
				else --���ŦX
					AddBuff( Player , 621220 , 0 , 3 )
					ScriptMessage( Player , Player , 1 , "[SC_424875_6]" , 0 ) --�a�����K���g��...
				end
				return
			else --�S��key
				Type = Type + 1
				if Type == #Key then
					AddBuff( Player , 621220 , 0 , 3 )
					ScriptMessage( Player , Player , 1 , "[SC_424875_6]" , 0 ) --�a�����K���g��...
				end
			end
		end
	else --�b��y
		ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
	end
end
---------(����� , �Ѽ�)---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_pick02( Player , CheckStatus )

	local NPC = TargetID()
	
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				GiveBodyItem( Player , 240790 , 1 ) --����"�K������"
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				DelObj( NPC )
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				SetFlag( NPC , 545874 , 0 ) --�R���g��W��key
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
			SetFlag( NPC , 545874 , 0 ) --�R���g��W��key
		end
	end
end
---------�������Ȱ���----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delkeyitem()

	local Player = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }

	Lua_ZonePE_3th_GetScore(150)
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			SetFlag( Player , Key[i] , 0 ) --�������ȧR��Key
			return
		end
	end
end

---------�������Ȱ���----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_Q424875_delkeyitem_1()

	local Player = TargetID()
	local Key = { 545822 , 545823 , 545824 , 545825 , 545826 , 545827 , 545828 , 545829 , 545830 , 545831 }

--	Lua_ZonePE_3th_GetScore(150)
	for i = 1 , #Key , 1 do
		if CheckFlag( Player , Key[i] ) == true then
			SetFlag( Player , Key[i] , 0 ) --�������ȧR��Key
			return
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_test_cleartable()

	Q424875_Soilobj  = {}
	Say( OwnerID() , "ClearOK" )
end