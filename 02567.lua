--function Lua_na_zone358(RoomID )
function Lua_na_11xmas_zoneAI() --���ʰϰ�AI�A �ϰ쭫�m�F�إߥ����ܼ� PlayerList ���}�C�A�ɶ��]�w
	if PlayerList == nil then
		PlayerList = {}
	end
	while true do
		local hour = GetSystime(1) --��t�ήɶ�(�p��)
		local min = GetSystime(2) --��t�ήɶ�(����)
		local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_RealZoneID)				
		local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- �P�_���y
	--	say( OwnerID() , hour..":"..min)
		say( OwnerID() , "now = "..hour .." : ".. min )
		if Zone == 358 then  --�u���X�{�bZONE 358
			if  hour == 3 or hour  == 7 or hour  == 11 or hour  == 15 or hour  ==19 or hour  == 23  then   --�q�����a�����ϰ�
				if min == 50 then --50�����ɭԶi��s���A10������N�������ϰ�
  					RunningMsgEx( OwnerID() , 1 , 3 , "[SC_2011XMAS_05]" )	-- �B�᪺�ǰe�𮧧e�{��í�w�����A�A�N��10��������N�Ҧ��_�I�̶ǰe�^���i�԰���I
				elseif min  == 59 then --59���ɶi��s���A�ѤU�@���������A�ϰ줤����������M��
  					RunningMsgEx( OwnerID() , 1 , 3 , "[SC_2011XMAS_09]" ) 	-- (0 �ۤv 1 �ϰ� 2 �������a )�C�B�᪺�𮧤w�g���h�A1��������N�Ҧ��_�I�̶ǰe�^���i�԰���I
					BeginPlot( OwnerID() , "Lua_na_11xmas_del" , 0 ) --�R��
				end


			elseif hour  == 0 or hour  == 4 or hour  == 8 or hour  == 12 or hour  == 16 or hour  == 20  then   --�N���a�j��ǰe�XZONE 358
				if min == 0 then 	---����N���a�ǰe�XZONE�A�ϰ쭫�m�@��
					local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
					local Player = SetSearchAllPlayer( RoomID ) --�ˬd�ϰ줤�����a�`��
			
					if  table.getn(PlayerList) ~= nil then 
						for i=1, table.getn(PlayerList) , 1  do
							if CheckID( PlayerList[i] ) ==true then
								CancelBuff( PlayerList[i] , 621720)--�M��BUFF�A���a�|�ǰe�X���ϰ�
							else
								DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
							end	
						end				
					end
				elseif min == 5 then --�}�Ҽɭ����H�@��
					Lua_na_11xmas_ResetAll() --����R�����ת��B������ȼ@��
					Lua_na_11xmas_start() --���ͤ���P������
					Lua_na_11xmas_wood_born()
				end
	--		elseif hour  == 17 then   --�N���a�j��ǰe�XZONE 358
	--			if min == 40 then 	---����N���a�ǰe�XZONE�A�ϰ쭫�m�@��
	--				local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--				local Player = SetSearchAllPlayer( RoomID ) --�ˬd�ϰ줤�����a�`��
	--		
	--				if  table.getn(PlayerList) ~= nil then 
	--					for i=1, table.getn(PlayerList) , 1  do
	--						if CheckID( PlayerList[i] ) ==true then
	--							CancelBuff( PlayerList[i] , 621720)--�M��BUFF�A���a�|�ǰe�X���ϰ�  		--
	--						else
	--							DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
	--						end	
	--					end				
	--				end
	--			elseif min == 42 then --�}�Ҽɭ����H�@��
	--				Lua_na_11xmas_ResetAll() --����R�����ת��B������ȼ@��
	--				Lua_na_11xmas_start() --���ͤ���P������
	--				Lua_na_11xmas_wood_born()
	--			end
			end
		end
		Sleep(600)   --�@�����]�@��
	end
end	


function Lua_na_11xmas_start() --�q�X�в��ͥD����
	local BIGFIRE
	local HideZoneObj
	local Tarlen 
	local Boss

	Tarlen = CreateObjByFlag( 120085, 781065 , 36 , 1 ) --�b�X�� 781065�A0����m�إ߸t�K����
	SetModeEx( Tarlen , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
	SetModeEx( Tarlen , EM_SetModeType_Obstruct , false ) --������
	SetModeEx( Tarlen , EM_SetModeType_Mark , true ) --�аO
	SetModeEx( Tarlen , EM_SetModeType_Move , false ) --������
	SetModeEx( Tarlen , EM_SetModeType_HideName , true ) --��ܦW��
	SetModeEx( Tarlen , EM_SetModeType_ShowRoleHead , true ) --����Y����
	AddToPartition( Tarlen , 0 ) --�ϫإߥX�Ӫ�NPC�X�{
	Tarlencia = Tarlen

	BIGFIRE = CreateObjByFlag( 120081, 781065 , 0 , 1 ) --�b�X�� 781065�A0����m�إ߸t�K����
	SetModeEx( BIGFIRE , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
	SetModeEx( BIGFIRE, EM_SetModeType_Show , false ) --����� 
	SetModeEx( BIGFIRE , EM_SetModeType_Obstruct , false) --����
	SetModeEx( BIGFIRE , EM_SetModeType_Mark , false ) --���аO
	SetModeEx( BIGFIRE , EM_SetModeType_Move , false ) --������
	SetModeEx( BIGFIRE , EM_SetModeType_HideName , false ) --����ܦW��
	SetModeEx( BIGFIRE , EM_SetModeType_ShowRoleHead , false ) --������Y����
	AddToPartition( BIGFIRE , 0 ) --�t�K�P�_
	SaintFire = BIGFIRE

	HideZoneObj= CreateObjByFlag( 120089 , 781065 , 37 , 1 ) --�b�X�� 781065�A0����m�إ߰ϰ����ê���
	SetModeEx(HideZoneObj,  EM_SetModeType_Strikback, false )--����
	SetModeEx( HideZoneObj, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( HideZoneObj, EM_SetModeType_Show,false ) --����� 
	SetModeEx( HideZoneObj, EM_SetModeType_Obstruct, false )--����
	SetModeEx( HideZoneObj, EM_SetModeType_Mark,  false )--�аO
	SetModeEx( HideZoneObj, EM_SetModeType_Move, false )--����
	SetModeEx( HideZoneObj, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( HideZoneObj, EM_SetModeType_HideName, false )--�W��
	SetModeEx( HideZoneObj, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( HideZoneObj, EM_SetModeType_Fight , false )--�i�������
	AddToPartition( HideZoneObj , 0 ) 

	Boss= CreateObjByFlag( 106539 , 781066 , 0 , 1 ) --�b�X�� 781065�A0����m���ͼɭ����H
	SetModeEx(Boss,  EM_SetModeType_Strikback, true )--����
	SetModeEx(Boss,  EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx(Boss,  EM_SetModeType_Show , true ) --����� 
	SetModeEx(Boss,  EM_SetModeType_Obstruct, false )--����
	SetModeEx(Boss,  EM_SetModeType_Mark,  true )--�аO
	SetModeEx(Boss,  EM_SetModeType_Move, true  )--����
	SetModeEx(Boss,  EM_SetModeType_Searchenemy, false )--����
	SetModeEx(Boss,  EM_SetModeType_HideName, true )--�W��
	SetModeEx(Boss,  EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx(Boss,  EM_SetModeType_Fight , true )--�i�������
	AddToPartition( Boss, 0 ) --�ϫإߥX�Ӫ��]�k�}�X�{
	StormMan = Boss
	CallPlot ( StormMan,"MoveAllFlag", 781066 )

end


function Lua_na_11xmas_wood_born()

--	local X = {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20}  --20��
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )	
	local firewood = {}
	for i = 1 , 35, 1 do   -- ����35��
		firewood[i] = CreateObjByFlag( 120083 , 781065, i ,1) --�ϥκX�l���ͳ��� npc �X�l�s�� �ƶq 
		SetModeEx( firewood[i] , EM_SetModeType_Show, true )
		SetModeEx( firewood[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( firewood[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( firewood[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx( firewood[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx( firewood[i]  , EM_SetModeType_Move, true )--����
		SetModeEx( firewood[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( firewood[i]  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( firewood[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( firewood[i]  , EM_SetModeType_Fight , false )--�i�������
		SetDefIdleMotion( firewood[i] , 242 )  --���������A
		AddToPartition( firewood[i] , Room )	--���p��ﲣ��
	--	say( firewood[i] , " i = ".. i )
	end
end



--�ϰ����ê���A�ˬd���a���A�α���NPC������Ȩ��W���ƭ�
function Lua_na_11xmas_gamezone() --120089 �x�V���ʰϰ쪫��
	local BOX = OwnerID()	
	if table.getn(PlayerList) >= 0 then
		PlayerList = {}   --�]�wplayer���Ū��}�C
	--	Say( BOX ,  "TABLE = " ..table.getn(PlayerList) )
	end
	SetPlot( BOX , "Range" , "Lua_na_11xmas_insert_PlayerList" ,10 )
	WriteRoleValue( Tarlencia ,  EM_RoleValue_Register1 , 0 )	
	while true do --�j��A���ʵ����e�@�����浹BUFF���ʧ@
		TarlenReg1 =ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )	
		local X = table.getn(PlayerList)
		if TarlenReg1 == 1 then  -- �w�����a�����t�K�Ϫ�
			local TarlenCount = 0;
		--	say(  Tarlencia , "1 = ".. TarlenReg1 )  -- ���Ϫ�
		--	Say( Tarlencia , " Player = " .. X )
 			for i = 1 , table.getn(PlayerList) , 1 do  
				if CheckID( PlayerList[i] ) == true then
				--	Say( PlayerList[i] , "Player = "..PlayerList[i] )
					if CheckBuff( PlayerList[i] , 621729 ) == true then --�p�G���W���t�K�Ϫ� 
						TarlenCount = TarlenCount + 1;
					--	Say( Tarlencia , "TarlenCount = "..TarlenCount )
					end
				else
					DebugMsg( 0, 0 ,"ID = "..PlayerList[i]);
				end
			end
			--�p�G�W�z�j�餤�����a�S���t�K�Ϫ�
			if TarlenCount == 0 then
				WriteRoleValue( Tarlencia , EM_RoleValue_Register1 , 0 ) --�N������Ȫ��ȼg��0
				TarlenReg1 = ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )	
			--	say(  Tarlencia , "02 = ".. TarlenReg1 )  --�^��0
			end

		elseif TarlenReg1 == 2 then  --�p�G���ʤw�g����
		--	say(  Tarlencia , "END = ".. TarlenReg1)
			Lua_na_11xmas_delallbuff()
			Lua_na_11xmas_del()
			break
		end	
	sleep(10)
	end
	Delobj( BOX)
end



--�w���Ϥ��磌��A����BUFF
function Lua_na_120081_safe() --�w���Ϫ���l�@��						       
	WriteRoleValue( SaintFire , EM_RoleValue_Register1 , 0 )  --�N���K�ȼg��0
--	Lua_na_11xmas_saferange() --�X�{�]�k�}
	Lua_na_11xmas_addDoor() --���ת��X�{	
	BeginPlot( SaintFire , "Lua_na_11xmas_coldbuff" , 0) --�H�N��
--	while true do --�j��A���ʵ����e�@�����浹BUFF���ʧ@
--		SysCastSpellLv( SaintFire , SaintFire , 498901, 0 ) --�I��ŷx������
--		sleep(10)
--	end
	
end	



--function Lua_na_11xmas_saferange() --����
--
--	local Obj = Role:new( OwnerID() ) --�b"�������Ϊ���"���m�A�إ߷s��NPC
--	local BaseX = Obj :X() --���Ϊ���X�b
--	local BaseY = Obj :Y() --���Ϊ���Y�b
--	local BaseZ = Obj :Z() --���Ϊ���Z�b
--	local BaseDir = Obj:Dir() --���Ϊ��󪺭��V
--	local Magic
--
--	Magic = CreateObj( 120082 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�إ�"�]�k�}"
--	SetModeEx( Magic , EM_SetModeType_SearchenemyIgnore , false ) --���Q�j�M
----	SetModeEx( Magic, EM_SetModeType_Gravity, false )--���O
--	SetModeEx( Magic , EM_SetModeType_Obstruct , false ) --������
--	SetModeEx( Magic , EM_SetModeType_Mark , false ) --���аO
--	SetModeEx( Magic , EM_SetModeType_Move , false ) --������
--	SetModeEx( Magic , EM_SetModeType_HideName , false ) --����ܦW��
--	SetModeEx( Magic , EM_SetModeType_ShowRoleHead , false ) --������Y����
--	AddToPartition( Magic , 0 ) --�ϫإߥX�Ӫ��]�k�}�X�{
--end
--

function Lua_na_11xmas_S_fire() --�U�N�������l�@��
	local Owner = OwnerID()
	local Target = TargetID()
	SetDefIdleMotion( Owner , 11 )  --��ܦ��������A
	for i = 1 , 15, 1 do  --15 * 1 sec = 30sec �����
		CastSpell( Owner , Owner ,498904)
		sleep(10)
	end
	Lua_na_11xmas_delfire()
end

-------------------------------------------------------------------------------------------------------------

function Lua_na_11xmas_delallbuff() --�ɭ����H���`��A �M�����a���W�Ҧ�����BUFF
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Xmas = { 621727 , 621729 , 621731 ,621897, 621715 }
	for i = 1 , table.getn(PlayerList), 1 do
		if CheckID( PlayerList[i]) == true then
			for j = 1 , table.getn(Xmas), 1 do
				CancelBuff(PlayerList[i] , Xmas[j] )  --�M�����a���W�Ҧ����ʬ���BUFF
			--	say( PlayerList[i] , "CancelBuff")
			end
		end	
	end
end



		

function Lua_na_11xmas_del() --�ɭ����H���`�����@���A�R���t�K�B�w�����]�k�}�B���ު�����B�U�N������
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 120081 ,120083 , 120084 , 120089 , 106539 }  --�t�K�B���ު�����B�U�N������B�x�V���ʪ���B�ɭ����H

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						Delobj( ID) --�R������οU�N������
					end
				end
			end
		end
	end
--	Sleep(600)   --�@�����]�@��
end


function Lua_na_11xmas_delDoor()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC ={ 120087, 120085 }  --�R��������B�������

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						Delobj( ID) --������
					end
				end
			end
		end
	end
end




--------------------------------------------------------------------------------------------------------------------
function Lua_na_2011xmas_delrange() --�R���]�k�}

	local Modelnpc = { 120082 }

	for i = 1 , table.getn(Modelnpc) , 1 do
		Lua_Hao_NPCofAll_Clear( Modelnpc[i] , 300 )
	end
end



function Lua_na_11xmas_ResetAll()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC ={ 120081 ,120082 ,120083 , 120084  , 120089, 120087, 120085, 106539 }  --�R���t�K�B�w�����]�k�}�B���ު�����B�U�N������B�x�V���ʪ���B������B�������

	if  Count ~= 0 then
		for i=1 , Count , 1 do
		local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						Delobj( ID) --������
					end
				end
			end
		end
	end
end