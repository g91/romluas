-- 2013.03.13 6.0.0 �f����X�A�קﰪ���_�c�P�����_�c�����]�w
function Lua_Hao_GoblinboxACT3_01() -- �����_�c

	local Player = OwnerID()	-- ���a
	local Chest = TargetID()	-- �_�c
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Log = { {} , {} , {} , {} }
	local Flag = { 0 , 0 , 0 }
	local Item = { 0 , 0 , 0 }
	local BoxLV = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- Ū���_�c������
	local Open = ReadRoleValue( Chest , EM_RoleValue_Register+2 )	-- Ū���_�c�O�_�w�g�}��
	local CheckPlayer = ReadRoleValue( Chest , EM_RoleValue_Register+3 )	-- �O���}���_�c�����a
	local MaxLv = ReadRoleValue( Chest , EM_RoleValue_Register+4 )	-- Ū���_�c�O�����p���ѻP�D�Ԫ��a�̰�����

	-- 2013.04.01 �ץ����a�i�Q�β��δ��v���첾�ޯ�A�b��ú��J���O�N�i�J�����L�q�|�����D -- 
	if CheckFlag( Player , 542743 ) == false then	-- �p�G�Ӫ��a�S���W�A�S���}���_�c�������A�hĵ�i�æ^�����@���C
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		DesignLog( Player , 113164 , "Cheater" )	-- �����L�_�c
		return
	end
	--

	if BoxLV == 1 then
		Item[1] = 724510	-- LV20~29�����_�c
		Item[2] = 0
		Item[3] = 0
	elseif BoxLV == 2 then
		Item[1] = 724512	-- LV30~39�����_�c
		Item[2] = 0
		Item[3] = 0
	elseif BoxLV == 3 then
		Item[1] = 724514	-- LV40~49�����_�c
		Item[2] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[3] = 725045 	-- LV40 ��e���]���_����q
	elseif BoxLV == 4 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- LV50�����_�c
		Item[2] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[3] = 725045 	-- LV40 ��e���]���_����q
	elseif BoxLV == 5 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- �������S�����
		Item[2] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[3] = 725045 	-- LV40 ��e���]���_����q
	end
	
	local PID = ReadRoleValue( Chest , EM_RoleValue_PID )	-- Ū�����_�c�����B���B���B�g�����@��

	if PID == 1 then
		Flag[1] = 542742 -- �����L�������_�c01
		Flag[2] = 542875 -- �����L�����_�cKey
		Flag[3] = 543557 -- �����L�}���ذe01 �����ײz��
		Log[1][PID] = 11265121	-- �I���_�c��A��Ū���������A�}�ҭ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265131	-- �I���_�c��AŪ�����X�{��A�}�ҭ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��
		Log[3][PID] = 11265141	-- �Ӫ��a�b�}�ҭ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265151	-- �Ӫ��a����ƶ}�ҭ��ݩ��_�c���ɡA���ն}���_�c
	elseif PID == 2 then
		Flag[1] = 542869 -- �����L�������_�c02
		Flag[2] = 542876 -- �����L�����_�cKey
		Flag[3] = 543558 -- �����L�}���ذe02
		Log[1][PID] = 11265122	-- �I���_�c��A��Ū���������A�}�Ҥ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265132	-- �I���_�c��AŪ�����X�{��A�}�Ҥ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��	
		Log[3][PID] = 11265142	-- �Ӫ��a�b�}�Ҥ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265152	-- �Ӫ��a����ƶ}�Ҥ��ݩ��_�c���ɡA���ն}���_�c
	elseif PID == 3 then
		Flag[1] = 542870 -- �����L�������_�c03
		Flag[2] = 542877 -- �����L�g���_�cKey
		Flag[3] = 543559 -- �����L�}���ذe03
		Log[1][PID] = 11265123	-- �I���_�c��A��Ū���������A�}�Ҥ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265133	-- �I���_�c��AŪ�����X�{��A�}�Ҥ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��
		Log[3][PID] = 11265143	-- �Ӫ��a�b�}�Ҥ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265153	-- �Ӫ��a����ƶ}�Ҥ��ݩ��_�c���ɡA���ն}���_�c
	elseif PID == 4 then
		Flag[1] = 542871 -- �����L�������_�c04
		Flag[2] = 542878 -- �����L�����_�cKey
		Flag[3] = 543560 -- �����L�}���ذe04
		Log[1][PID] = 11265124	-- �I���_�c��A��Ū���������A�}�Ҥg�ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265134	-- �I���_�c��AŪ�����X�{��A�}�Ҥg�ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��		
		Log[3][PID] = 11265144	-- �Ӫ��a�b�}�Ҥg�ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265154	-- �Ӫ��a����ƶ}�Ҥg�ݩ��_�c���ɡA���ն}���_�c
	end	
	
	if CheckFlag( Player , Flag[1] ) == true then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_24]" , 0 ) --�A�w�g�}�ҹL�o���_�c�C
		DesignLog( Player , Log[3][PID] , "The player have already opened this treasure chest." )
		return
	elseif CheckFlag( Player , Flag[2] ) == false then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		DesignLog( Player , Log[4][PID] , "The player do not have permission to open this treasure chest." )
		return
	end
	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckPlayer == 0 then  
		WriteRoleValue( Chest , EM_RoleValue_Register+3 , Player )
		CallPlot( Chest , "Hao_Goblin_Check" , Chest , Player , "Lua_Hao_GoblinboxACT3_01" )  --�N�I���������a�a�J�_�c�A�Ӫ��a���b���ϰ�ɡA�h���mĲ�I�@��
	end

	if BeginCastBar( Player , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
			sleep(1)
			local CastBarStatus = CheckCastBar( Player )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0 ) then -- ���\
					result = "OKOK"
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
				end
				EndCastBar( Player , CastBarStatus )
				break				
			end
		end

		if ( result == "OKOK" ) then
			if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				if Open == 0 then
					PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --�_�c���򼽩�145    146
					WriteRoleValue( Chest , EM_RoleValue_Register+2 , 1 )
				end
				local Keyitem = { 543557 , 543558 , 543559 , 543560 }
				local Count = 0
				local EndBonus = { 10 , 20 }
				for i = 1 , table.getn(Keyitem) , 1 do
					if CheckFlag( Player , Keyitem[i] ) == true then
						Count = Count +1
					end
				end
				if PlayerLv >= 50 then
					if Count <= 3 then	-- �������B���B���B�g�_�c���ƶq <= 3 �Ӯ�
						Hao_Monetary_Union_240181( Player , EndBonus[1] )
					elseif Count == 4 then	-- ���a������B���B���B�g�_�c���ƶq = 4 �Ӯ�
						Hao_Monetary_Union_240181( Player , EndBonus[2] )
					end
				end
				GiveBodyItem( Player , Item[1] , 1 )
				SetFlag( Player , Flag[1] , 1 )
				SetFlag( Player , Flag[2] , 0 )
				if Count == 4 then
					GiveBodyItem( Player , Item[2] , 1 )
					GiveBodyItem( Player , Item[3] , 1 )
					for i = 1 , #Keyitem , 1 do
						SetFlag( Player , Keyitem[i] , 0 )
					end
				end
				DesignLog( Player , Log[1][PID] , "Open the treasure box" )
				SetPlot( Chest ,"touch" , "Lua_Hao_GoblinboxACT3_01" , 50 )
			--	sleep(10)
			else
				DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
				ScriptMessage( Chest , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				SetPlot( Chest ,"touch","Lua_Hao_GoblinboxACT3_01", 50 )
			end	
		elseif ( result == "DAME" ) then
			DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
			SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_01" , 50 )
		end
	end
end

function Lua_Hao_GoblinboxACT3_02() -- �����_�c

	local Player = OwnerID()	-- ���a
	local Chest = TargetID()	-- �_�c
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local PlayerLv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Log = { {} , {} , {} , {} }
	local Flag = { 0 , 0 , 0 }
	local Item = { 0 , 0 , 0 , 0 }
	local BoxLV = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- Ū���_�c������
	local Open = ReadRoleValue( Chest , EM_RoleValue_Register+2 )	-- Ū���_�c�O�_�w�g�}��	
	local CheckPlayer = ReadRoleValue( Chest , EM_RoleValue_Register+3 )	-- �O���}���_�c�����a
	local MaxLv = ReadRoleValue( Chest , EM_RoleValue_Register+4 )	-- Ū���_�c�O�����p���ѻP�D�Ԫ��a�̰�����

	-- 2013.04.01 �ץ����a�i�Q�β��δ��v���첾�ޯ�A�b��ú��J���O�N�i�J�����L�q�|�����D -- 
	if CheckFlag( Player , 542743 ) == false then	-- �p�G�Ӫ��a�S���W�A�S���}���_�c�������A�hĵ�i�æ^�����@���C
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		DesignLog( Player , 113164 , "Cheater" )	-- �����L�_�c
		return
	end
	--
	if BoxLV == 1 then
		Item[1] = 724511	-- LV20~29�����_�c
		Item[2] = 724571	-- LV20~29����
		Item[3] = 0
		Item[4] = 0
	elseif BoxLV == 2 then
		Item[1] = 724513	-- LV30~39�����_�c
		Item[2] = 724572	-- LV30~39����
		Item[3] = 0
		Item[4] = 0
	elseif BoxLV == 3 then
		Item[1] = 724515	-- LV40~49�����_�c
		Item[2] = 724573	-- LV40~49����
		Item[3] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[4] = 725045	-- LV40 ��e���]���_����q
	elseif BoxLV == 4 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- LV50~59�����_�c
		Item[2] = 724574	-- LV50~59����
		Item[3] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[4] = 725045	-- LV40 ��e���]���_����q
	elseif BoxLV == 5 then
		Item[1] = Hao_Zone352_Chest_Craft(MaxLv)	-- �������S�����
		Item[2] = 724574	-- �����L�i�h����*2
		Item[3] = 725044	-- LV40 ��e���j�v�U��ײz��
		Item[4] = 725045	-- LV40 ��e���]���_����q
	end

	local PID = ReadRoleValue( Chest , EM_RoleValue_PID )	-- Ū�����_�c�����B���B���B�g�����@��
	
	if PID == 1 then
		Flag[1] = 542742 -- �����L�������_�c01
		Flag[2] = 542875 -- �����L�����_�cKey
		Flag[3] = 543557 -- �����L�}���ذe01 �����ײz��
		Log[1][PID] = 11265121	-- �I���_�c��A��Ū���������A�}�ҭ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265131	-- �I���_�c��AŪ�����X�{��A�}�ҭ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��
		Log[3][PID] = 11265141	-- �Ӫ��a�b�}�ҭ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265151	-- �Ӫ��a����ƶ}�ҭ��ݩ��_�c���ɡA���ն}���_�c	
	elseif PID == 2 then
		Flag[1] = 542869 -- �����L�������_�c02
		Flag[2] = 542876 -- �����L�����_�cKey
		Flag[3] = 543558 -- �����L�}���ذe02
		Log[1][PID] = 11265122	-- �I���_�c��A��Ū���������A�}�Ҥ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265132	-- �I���_�c��AŪ�����X�{��A�}�Ҥ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��	
		Log[3][PID] = 11265142	-- �Ӫ��a�b�}�Ҥ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265152	-- �Ӫ��a����ƶ}�Ҥ��ݩ��_�c���ɡA���ն}���_�c	
	elseif PID == 3 then
		Flag[1] = 542870 -- �����L�������_�c03
		Flag[2] = 542877 -- �����L�g���_�cKey
		Flag[3] = 543559 -- �����L�}���ذe03
		Log[1][PID] = 11265123	-- �I���_�c��A��Ū���������A�}�Ҥ��ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265133	-- �I���_�c��AŪ�����X�{��A�}�Ҥ��ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��
		Log[3][PID] = 11265143	-- �Ӫ��a�b�}�Ҥ��ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265153	-- �Ӫ��a����ƶ}�Ҥ��ݩ��_�c���ɡA���ն}���_�c	
	elseif PID == 4 then
		Flag[1] = 542871 -- �����L�������_�c04
		Flag[2] = 542878 -- �����L�����_�cKey
		Flag[3] = 543560 -- �����L�}���ذe04
		Log[1][PID] = 11265124	-- �I���_�c��A��Ū���������A�}�Ҥg�ݩ����l�X�{�_�c���\�ɡA�O���U�����a�M��
		Log[2][PID] = 11265134	-- �I���_�c��AŪ�����X�{��A�}�Ҥg�ݩ����l�X�{�_�c���ѮɡA�O���U�����a�M��		
		Log[3][PID] = 11265144	-- �Ӫ��a�b�}�Ҥg�ݩ��_�c��A�A�����ն}���_�c
		Log[4][PID] = 11265154	-- �Ӫ��a����ƶ}�Ҥg�ݩ��_�c���ɡA���ն}���_�c	
	end

	if CheckFlag( Player , Flag[1] ) == true then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_24]" , 0 ) --�A�w�g�}�ҹL�o���_�c�C
		DesignLog( Player , Log[3][PID] , "The player have already opened this treasure chest." )
		return
	elseif CheckFlag( Player, Flag[2] ) == false then
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		DesignLog( Player , Log[4][PID] , "The player do not have permission to open this treasure chest." )
		return
	end
	SetPlot( Chest , "touch" , "" , 0 )
	
	if CheckPlayer == 0 then
		WriteRoleValue( Chest , EM_RoleValue_Register+3 , Player )
		CallPlot( Chest , "Hao_Goblin_Check" , Chest , Player , "Lua_Hao_GoblinboxACT3_02" )  --�N�I���������a�a�J�_�c�A�Ӫ��a���b���ϰ�ɡA�h���mĲ�I�@��
	end

	if BeginCastBar( Player , "[SO_110195_1]" , 50 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

		while true do
			sleep(1)
			local CastBarStatus = CheckCastBar( Player )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0 ) then -- ���\
					result = "OKOK"
				elseif ( CastBarStatus < 0 ) then -- ����
					result = "DAME"
				end
				EndCastBar( Player , CastBarStatus )
				break				
			end
		end

		if ( result == "OKOK" ) then
			if EmptyPacketCount( Player ) >= 1 and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				if Open == 0 then
					PlayMotionEX( Chest , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )  --�_�c���򼽩�145    146
					WriteRoleValue( Chest , EM_RoleValue_Register+2 , 1 )					
				end
				local Keyitem = { 543557 , 543558 , 543559 , 543560 }
				local Count = 0
				local EndBonus = { 10 , 20 }
				for i = 1 , table.getn(Keyitem) , 1 do
					if CheckFlag( Player , Keyitem[i] ) == true then
						Count = Count +1 
					end
				end
				if PlayerLv >= 50 then
					if Count <= 3 then	-- �������B���B���B�g�_�c���ƶq <= 3 �Ӯ�
						Hao_Monetary_Union_240181( Player , EndBonus[1] )
					elseif Count == 4 then	-- ���a������B���B���B�g�_�c���ƶq = 4 �Ӯ�
						Hao_Monetary_Union_240181( Player , EndBonus[2] )
					end
				end
				GiveBodyItem( Player , Item[1] , 1 )
				GiveBodyItem( Player , Item[2] , 1 )
				SetFlag( Player , Flag[1] , 1 )
				SetFlag( Player , Flag[2] , 0 )
				if Count == 4 then
					GiveBodyItem( Player , Item[3] , 1 )
					GiveBodyItem( Player , Item[4] , 1 )
					for i = 1 , #Keyitem , 1 do
						SetFlag( Player , Keyitem[i] , 0 )
					end
				end
				DesignLog( Player , Log[1][PID] , "Open the treasure box" )
				SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
			--	sleep(10)
			else
				DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
				ScriptMessage( Chest , Player , 1 , "[K_08MID_DIALOG8]" , 0 )	--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
			end
		elseif ( result == "DAME" ) then
			DesignLog( Player , Log[2][PID] , "Open the treasure box failed" )
			SetPlot( Chest , "touch" , "Lua_Hao_GoblinboxACT3_02" , 50 )
		end
	end
end
-- 2013.03.21 ���E �ץ����a��}�ҲĤT���d���_�c���_�u�δ��Ϸ|�y����L���a�L�k�}�Ҹ��_�c�����D
function Hao_Goblin_Check(Chest , Player , String)

	while true do
		if GetDistance( Chest , Player ) > 50 then
			SetPlot( Chest , "touch" , String , 50 )
			WriteRoleValue( Chest , EM_RoleValue_Register+3 , 0 )
			break
		end
		Sleep(5)
	end
end

function Hao_Zone352_Chest_Craft(MaxLv)

	local Craft = {}
	Craft[1] = { 51 , 207409 , 207411 , 207413 , 207415 }	-- Lv 51 ~ 55 �h�Ůɻ��(4��1): �\���P�ۡB�`���v�B�����ݥۡB����ֺ�
	Craft[2] = { 56 , 207410 , 207412 , 207414 , 207416 }	-- Lv 56 ~ 60 �h�Ůɻ��(4��1):�����P�ۡB���v�B�Ʈ洵���ݥۡBĬ�K�ֺ�
	Craft[3] = { 61 , 208252 , 208253 , 208254 , 208255 }	-- Lv 61 ~ 65 �h�Ůɻ��(4��1):�����P�ۡB���ɰv�B��J�����ݥۡB�ȳ��ֺ�
	Craft[4] = { 66 , 240410 , 240411 , 240412 , 240413 }	-- Lv 66 ~ 70 �h�Ůɻ��(4��1):�Q�P�ۡB���K�v�B��溿���ݥۡB���q�ֺ�
	Craft[5] = { 71 , 241463 , 241464 , 241465 , 241466 }	-- Lv 71 ~ 75 �h�Ůɻ��(4��1):񾯫�P�B�ȾY�v�B��S���ݥۡB�ȧ��ֺ�
	Craft[6] = { 76 , 242063 , 242064 , 242065 , 242066 }	-- Lv 76 ~ 80 �h�Ůɻ��(4��1):�௫�P�B�ȹ]�v�B�]�������ݥۡB����ֺ�
	Craft[7] = { 81 , 242314 , 242315 , 242316 , 242317 }	-- Lv 81 ~ 85 �h�Ůɻ��(4��1):�����P�B���K�v�B�w�������ݥۡB�C���ֺ�
	Craft[8] = { 86 , 242318 , 242319 , 242320 , 242321 }	-- Lv 86 ~ 90 �h�Ůɻ��(4��1):�q��P�B�ȨE�v�Bù�Ǫ��ݥۡB�֪��ֺ�
	Craft[9] = { 91 , 242322 , 242323 , 242324 , 242325 }	-- Lv 91 ~ 95 �h�Ůɻ��(4��1):�ܤk�P�B����v�B���Q�����ݥۡB�Ѥ��ֺ�
	Craft[10] = { 200 , 242326 , 242327 , 242328 , 242329 }	-- Lv 96 ~ 200 �h�Ůɻ��(4��1):�i���P�B�Ȼɰv�B�������ݥۡB�۴��ֺ�

	for i = 1 , #Craft , 1 do
		if MaxLv < Craft[i][1]+5 then
			Craft[0] = Craft[i][math.random( 2 , #Craft[i])]
			break
		end
	end
	DebugMsg( 0 , 0 , "Item = "..Craft[0] )
	return Craft[0]
end

function Lua_Hao_Goblinbox_Test()

	local Player = OwnerID()
	SetFlag( Player , 542743 , 0 )--�T�w�D��
	SetFlag( Player , 542904 , 0 )--�����L���⯵�_�w���
	SetFlag( Player , 542905 , 0 )--�������FLAG
	SetFlag( Player , 543557 , 0 )--�j�v�w�߭ײz��&�]���_����q*3 �X��01
	SetFlag( Player , 543558 , 0 )--�j�v�w�߭ײz��&�]���_����q*3 �X��02
	SetFlag( Player , 543559 , 0 )--�j�v�w�߭ײz��&�]���_����q*3 �X��03
	SetFlag( Player , 543560 , 0 )--�j�v�w�߭ײz��&�]���_����q*3 �X��04
	SetFlag( Player , 542742 , 0 )--�����L�������_�c01
	SetFlag( Player , 542869 , 0 )--�����L�������_�c02
	SetFlag( Player , 542870 , 0 )--�����L�������_�c03
	SetFlag( Player , 542871 , 0 )--�����L�������_�c04
	SetFlag( Player , 542689 , 0 )--�D�Ը��	
end