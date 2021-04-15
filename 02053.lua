
function lua_mika_wolfcome_npc_00()	-- �PNPC��� ��l�@��
--	say(OwnerID() , "3" ) --���a
--	say(TargetID() , "4" ) --NPC

	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  )	-- ¾�~
	local todayplay = CheckFlag( OwnerID() , 542249 )				-- ���Ѫ��L

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V

	if CheckBuff( OwnerID() , 503783 ) == true then
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C  
	else
		if todayplay == false or PlayerJob == 0 then
			SetSpeakDetail( OwnerID() , "[SC_TRAIN10_NPC_SPEAK01]"  ) --�Ať�A�o���O�T�s���z�s�n�ܡH (����٨S�ѹL, ��l��� )
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_TRAIN10_NPC_SPEAK02]" , "lua_mika_wolfcome_npc_01", 0 )--�ڸӫ�����U�A�H ( �C������)
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_TRAIN10_NPC_SPEAK04]" , "lua_mika_wolfcome_npc_02" , 0 )--�}�l�C�� 
		elseif todayplay == true then
			SetSpeakDetail(  OwnerID(), "[SC_TRAIN10_NPC_SPEAK08]"  ) -- (��ѸѹL)
		end
	end
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_TRAIN10_NPC_SPEAK09]"  , "lua_mika_wolfcome_leave", 0 )--���}���C��
end

function lua_mika_wolfcome_npc_01() --  �ڸӫ�����U�A? (�ƥ��C���W�h)
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V

	SetSpeakDetail( OwnerID() , "[SC_TRAIN10_NPC_SPEAK05]" )   --�W�h���e
	AddSpeakOption( OwnerID() , TargetID( ) , "[SC_111352_2]" , "lua_mika_wolfcome_npc_00" , 0 )--�^�W�@�� (��^ �D��)
end

function lua_mika_wolfcome_npc_02() --  �}�l�C�� (�ƥ��C���W�h)

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	CloseSpeak(OwnerID())

--	say(OwnerID() , "OwnerID" ) --���a
--	say(TargetID() , "TargetID" ) --NPC
--	Say(OwnerID(), "Start the game" ) 

-- �N����NPC����

	SetModeEx( TargetID() , EM_SetModeType_Show , false )--���
	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--�аO


	if GuildWolfcomeScore  == nil then	-- �ŧi�����ܼ�
		GuildWolfcomeScore  = {}
	end

	GuildWolfcomeScore[RoomID] = 0   -- �N�oROOM���ܼ� (����) �k�s

	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_01]" , C_SYSTEM )  --�Цb�ɶ����A�a����k��e���a�W�Y��A�ña�^�ﭱ���A���C
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_01]" , C_SYSTEM )  

	Setflag(OwnerID(), 542249 , 1 )  -- �� ���Ѥw�ѥ[�L�г�10 ���n���~
	ClockOpen( OwnerID() , EM_ClockCheckValue_24 , 300, 300 , 0 , "lua_mika_wolfcome_close2" , "lua_mika_wolfcome_close1" ) --�˼ƭp�ɾ�  ( �禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡" )
	AddBuff(OwnerID(), 506289, 0 , 300 )  -- ���M�Χޯ� 

	SetSmallGameMenuType( OwnerID() , 14 , 1 ) ---- �}�Ҥ���  (�O���O�A��1���гy�A��2������)
	SetSmallGameMenuStr( OwnerID() , 14 , 1 , "[SC_TRAIN10_INTERFACE_01]" ) -- �T�ӤF
	SetSmallGameMenuStr( OwnerID() , 14 , 2 , "[SC_TRAIN10_INTERFACE_02][$SETVAR1="..GuildWolfcomeScore[RoomID].."]" ) -- <CY>���ơG</CY>[$VAR1]

	Beginplot(TargetID(), "lua_mika_welcome_playercheck", 0 )  --������npc �}�l�����ˬd�P�򪱮a�O�_�s�b
	Beginplot(TargetID(), "lua_mika_wolfcome_objborn" , 0 )  -- ���ͤ������� (�����W�䥦����Ѥ��������X)
	Beginplot(TargetID(), "lua_mika_wolfcome_checkborn" , 0 )  -- ���ͶZ���X������ 
end

function lua_mika_wolfcome_checkborn()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

--	Say(OwnerID(), "checkobj born")

	local checkobj ={}
	for i = 0,8 do  --9��
		checkobj[i] = CreateObjByFlag(117053,780821, i ,1)
		SetModeEx( checkobj[i], EM_SetModeType_Show, false )--��� (false)
		SetModeEx( checkobj[i], EM_SetModeType_Mark, false )--�аO (false)
		AddToPartition( checkobj[i] , RoomID )
	end

	Beginplot(checkobj[0], "lua_mika_wolfcome_control_R2" , 0 )  --250
	Beginplot(checkobj[1], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[2], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[3], "lua_mika_wolfcome_control_R1" , 0 )   -- 160
	Beginplot(checkobj[4], "lua_mika_wolfcome_control_R3" , 0 )   -- 200
	Beginplot(checkobj[5], "lua_mika_wolfcome_control_R1" , 0 )  -- 160

	Beginplot(checkobj[6], "lua_mika_wolfcome_control_RR" , 0 )  -- �ϱM�α��s�Y 200
	Beginplot(checkobj[7], "lua_mika_wolfcome_control_RR" , 0 )  -- �ϱM�α��s�Y 200

	Beginplot(checkobj[8], "lua_mika_wolfcome_control_04" , 0 )   -- ������������ 350

--	Say(OwnerID(), "checkobj born end")
end

--���ʶ}�l �ͥX�U����
function lua_mika_wolfcome_objborn()
--	say(OwnerID() , "OwnerID 1" ) ---NPC

	-- �ͥX�U��������
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

	local com1 = CreateObjByFlag(117053 , 780823, 0 ,1) 
	SetModeEx( com1, EM_SetModeType_Show, false )--��� (false)
	SetModeEx( com1, EM_SetModeType_Mark, false )--�аO (false)
	AddToPartition( com1 , RoomID )
	
	local com2 = CreateObjByFlag(117053 , 780823, 1 ,1) 
	SetModeEx( com2, EM_SetModeType_Show, false )--��� (false)
	SetModeEx( com2, EM_SetModeType_Mark, false )--�аO (false)
	AddToPartition( com2 , RoomID )

	local com3 = CreateObjByFlag(117053 , 780823, 2 ,1) 
	SetModeEx( com3, EM_SetModeType_Show, false )--��� (false)
	SetModeEx( com3, EM_SetModeType_Mark, false )--�аO (false)
	AddToPartition( com3 , RoomID )


	local com4 = CreateObjByFlag(117053 , 780823, 3 ,1) 
	SetModeEx( com4, EM_SetModeType_Show, false )--��� (false)
	SetModeEx( com4, EM_SetModeType_Mark, false )--�аO (false)
	AddToPartition( com4, RoomID )

	BeginPlot (com1, "lua_mika_wolfcome_control_01" , 0 )  -- �T  ���
	BeginPlot (com2, "lua_mika_wolfcome_control_02" , 0 )  -- ��  ��� ok
	BeginPlot (com3, "lua_mika_wolfcome_control_03" , 0 )  -- �� ���
	BeginPlot (com4, "lua_mika_wolfcome_control_05" , 0 )  --  ���������I

--	DebugMsg( 0 , 0 , "obj born ok" )

end
--------------------------------------------
-- ���}���C��
function lua_mika_wolfcome_leave()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )

--	say(OwnerID() , "OwnerID" )  -- player 
--	say(TargetID() , "TargetID" )  -- NPC

	CloseSpeak(OwnerID())
	CancelBuff(OwnerID(), 506289 )  -- �M���M�Χޯ� 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- ��������  (�O���O�A��1���гy�A��2������)
	ClockClose( OwnerID() ) 			-- �����p�ƾ�

	SetModeEx( TargetID() , EM_SetModeType_Show , True )--���
	SetModeEx( TargetID() , EM_SetModeType_Mark ,  True )--�аO

	-- �Ǧ^�г��Щx��m
	ChangeZone( OwnerID(), 354 , RoomID , 5122 , 13, 2527, 270 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  

end

--------------------------------------------
--�p�ɾ�����@�� (����b���a���W)
--------------------------------------------
-- �i�����a����. �[�a�A��,  �M���p�ɾ�,�p���O,   �N���a�ǰe�^�Щx��m

function lua_mika_wolfcome_close1() 	--�����C�� (�ɶ���)
--	DebugMsg( 0 , 0 , "time out start" )

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
--	say(OwnerID() , "OwnerID" )  -- Player

	local score = GuildWolfcomeScore[RoomID]
	local reward = score*10

	DebugMsg( 0 , 0 , "score = "..score )
	DebugMsg( 0 , 0 , "reward = "..reward )

	--�ť��o�� �ഫ�a�A�I��
	local NPC = Lua_Hao_NPC_Closest_Search( OwnerID() , 117051  , 1600 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���  (2011.11.22 �ק�d��ƭȬ�1600)
--	Say(NPC, "SHOW")
	SetModeEx( NPC , EM_SetModeType_Show , True )--���
	SetModeEx( NPC , EM_SetModeType_Mark , True)--�аO

	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- �C�������A�A�o�����o�����G[$VAR1]
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- �C�������A�A�o�����o�����G[$VAR1]
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )-- �������շҵ����F�A�̷���o���n���N�ର�W�[�A���a�A�ȡC
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )
	AddRoleValue( OwnerID() , EM_RoleValue_Honor , reward )--�����a�A��
	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��	

	CancelBuff(OwnerID(), 506289 )  -- �M���M�Χޯ� 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- ��������  (�O���O�A��1���гy�A��2������)
	ClockClose( OwnerID() ) 			-- �����p�ƾ�	
	ChangeZone( OwnerID(), 354 , RoomID , 5122 , 13, 2527, 270 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  

	DebugMsg( 0 , 0 , "time out end" )

end

--�M���p�ɾ�,�p���O, 
function lua_mika_wolfcome_close2() 	--�����C�� (����)

	DebugMsg( 0 , 0 , "change zone event start" )

	CancelBuff(OwnerID(), 506289 )  -- �M���M�Χޯ� 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- ��������  (�O���O�A��1���гy�A��2������)
	ClockClose( OwnerID() ) 			-- �����p�ƾ�

	DebugMsg( 0 , 0 , "change zone event end" )
	
end


---------------------------
-- �C���ˬd���ϰ�O�_�����a�s�b, �p�G�S���N�R�b���Ҧ��B�@������
-- �ɶ���ɧR�������W����npc

function lua_mika_welcome_playercheck()
-- OwnerID -- NPC

	local time = 300 

	while true do 
		time = time -1
		local Player = SearchRangePlayer( OwnerID() , 1600 ) --�P�_����O�_�����a 1600/2 = 800 (2012.05. 29 �ק�d��ƭȬ�2000)
	--	Tell( player[0], OwnerID(),  "time = "..time )  --�K�y   ���ܤH,�o�ܤH,string
		sleep(10)  -- ���j�ˬd�ɶ�
		if table.getn(player) > 0 then
	--	if CheckID( Player[0] ) == true then	--�p�G����XX�������a
			local Dis = GetDistance(OwnerID(), player[0])
		--	Tell( player[0], OwnerID(),  "dis = "..Dis )  --�K�y   ���ܤH,�o�ܤH,string
		--	Tell( player[0], OwnerID(),  "ok ok" )  --�K�y   ���ܤH,�o�ܤH,string
		else
		--	Tell( player[0], OwnerID(),  "player is not here" )  --�K�y   ���ܤH,�o�ܤH,string
		--	Tell( player[0], OwnerID(),  "kill all npc" )  --�K�y   ���ܤH,�o�ܤH,string

			sleep(10)
			DebugMsg( 0 , 0 , "player is not here" )

		--	Say(OwnerID(), "SHOW")
			SetModeEx( OwnerID() , EM_SetModeType_Show , True )--���
			SetModeEx( OwnerID() , EM_SetModeType_Mark , True )--�аO
			Beginplot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )
			break
		end

		if time  == 0 then
			DebugMsg( 0 , 0 , "time is over" )
		--	Say(OwnerID(), "SHOW")
			SetModeEx( OwnerID() , EM_SetModeType_Show , True )--���
			SetModeEx( OwnerID() , EM_SetModeType_Mark , True )--�аO
			Beginplot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )
			break
		end

	end
end


-- �R���Ҧ��ͥX���� ( �T, �� , �� , �۰� , ��� ) 
function lua_mika_wolfcome_delobj()
	local TempObj = {117052, 117050, 117053, 105023, 105024  }
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
	DebugMsg( 0 , 0 , "delete ok" )
end

--117052 --����
--117050 --�۰�
--117053 --���ê���(������)
--105023 --���k
--105024 --�T
------------------------------------------

--���ձM�Ϋ��O

-- �i�椤�Y�ݭ��s�}�l
function lua_mika_wolfcome_test01()

	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
--	say(OwnerID() , "OwnerID" )  -- Player

	DebugMsg( 0 , 0 , "RESET GAME 10" )

	local NPC = Lua_Hao_NPC_Closest_Search( OwnerID() , 117051  , 800 )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪��� (2011.11.22 �ק�d��ƭȬ�1600)
	Say(NPC, "SHOW")
	SetModeEx( NPC , EM_SetModeType_Show , True )--���
	SetModeEx( NPC , EM_SetModeType_Mark , True )--�аO

	BeginPlot(OwnerID(), "lua_mika_wolfcome_delobj" , 0 )

	local score = GuildWolfcomeScore[RoomID]
	local reward = score*10

--	DebugMsg( 0 , 0 , "score = "..score )
--	DebugMsg( 0 , 0 , "reward = "..reward )

	--�ť��o�� �ഫ�a�A�I��
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- �C�������A�A�o�����o�����G[$VAR1]
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_05][$SETVAR1="..score.."]" , C_SYSTEM )  -- �C�������A�A�o�����o�����G[$VAR1]
	ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )-- �������շҵ����F�A�̷���o���n���N�ର�W�[�A���a�A�ȡC
	ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_06]" , C_SYSTEM )
	FN_GuildGame_Honor( OwnerID(), reward )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , reward )--�����a�A��
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..reward.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��	

	CancelBuff(OwnerID(), 506289 )  -- �M���M�Χޯ� 
	SetSmallGameMenuType( OwnerID() , 14 , 2 )	-- ��������  (�O���O�A��1���гy�A��2������)
	ClockClose( OwnerID() ) 			-- �����p�ƾ�	

	Setflag(OwnerID(), 542249, 0)

	DebugMsg( 0 , 0 , "RESET GAME 10 OK !!" )
end