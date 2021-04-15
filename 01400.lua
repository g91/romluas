-- 2013.04.30 �]��6.0.1���ʰƥ��վ�A�ק�����L�q�|�A�վ�50�ťH�W���ŶZ�A�ܧ�50~59�A�÷s�W60�Ū��ŶZ�C --
function Lua_Hao_GoblinRange()	-- ���ä���W���_�l�@��
-- 2013.09.12 ��������ä������d��@���ͩǤ覡�A�վ㬰Npc�ͩǡA�קK���a�P�ɶ��Q�ǰe�ܽd��@��Ĳ�o�d�򤺡A�����v���ƥͩǪ����D --
--	SetPlot( OwnerID() , "Range" , "Lua_Hao_GoblinACT_ALLBegin" , 150 )	-- ���`�Ҧ�
end

function Lua_Hao_GoblinACT_ALLBegin( Npc , Player )
--	local Player = OwnerID()
--	local Npc = TargetID()
--	SetPlot( Npc , "Range" , "" , 0 )
	local Opengate = CheckFlag( Player , 542905 )	-- �O�_�����
	if DeadCount == nil then	-- �����ܼơA�ŧi���a�W�����`�O�ƾڱ�
		DeadCount = {}
	end
	BeginPlot( Npc , "Lua_Hao_GoblinACT_Clock" , 0 )	-- �����ä���Ĳ�o���p�ɼ@��
	
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )	--���o�ҦbRoom
	DeadCount[RoomID] = { 0 , 0 }	-- ��1���d�B��2���d�W�����`�p�Ƽ@��

	local TempObj = {}	-- ��1���d��Npc ID
	local TempObj1 = {}	-- ��2���d��Npc ID
	local Boxobj = {}	-- �����L�_�cID
	local MonsterObj = {}	-- ��1���d��Npc
	local MonsterObj1 = {}	-- ��2���d��Npc
	local Itemobj = {}	-- �إ��_�c��Npc
	local PlayerTeam = LuaFunc_PartyData( Player )           --�P�_�Ҧ��p���������(�ư����PZone�����ư����`��)�A PlayerTeam[0] �Ĥ@����Ƭ������H�ơB�ĤG���H�ᬰ������ơC
	local PlayerLV = 0
	for i= 1,PlayerTeam[0] do	-- ���o�Ҧ������a���šA�ñq�����o�̤j��
		local LV = ReadRoleValue( PlayerTeam[i] , EM_RoleValue_LV  )  --���o���a����
	 	if PlayerLV < LV then
			PlayerLV = LV
		end
	end

	local Step	-- �M�w���d�����Ű϶�
	if PlayerLV <= 29 then
		TempObj = { 102051,102052,102053 }	-- ��1���d��Npc ID
		TempObj1 = { 102054,102055,102056 }	-- ��2���d��Npc ID
		Boxobj = {113093}	-- �_�cID
		Step = 1
	elseif PlayerLV <= 39 then
		TempObj = { 102071,102072,102073 }
		TempObj1 = { 102074,102075,102076 }
		Boxobj = {113162}
		Step = 2
	elseif PlayerLV <= 49 then
		TempObj = { 102082,102083,102084 }
		TempObj1 = { 102085,102086,102087 }
		Boxobj = {113163}
		Step = 3
	elseif PlayerLV <= 59 then
		TempObj = { 102092,102093,102094 }
		TempObj1 = { 102095,102096,102097 }
		Boxobj = {113164}
		Step = 4
	elseif PlayerLV <= 200 then
		TempObj = { 102092,102093,102094 }	-- ���|�������󪫫~�A�u�����v�����_�c
		TempObj1 = { 102095,102096,102097 }	-- �P�W
		Boxobj = {113164}	-- �_�c��ID
		Step = 5
	end
--�_�c
	local KK = Rand(3)
	for i= 1 , 5 , 1 do 
		Itemobj[i] = CreateObjByFlag( Boxobj[1] , 780369 , i + KK - 1  , 1 ) 	-- �إߩǪ��b�X�ФW	--K.J. Aris Fixed 140127
		WriteRoleValue( Itemobj[i] , EM_RoleValue_Register+1 , Step )	-- �N���d�h�żg�J�_�c		
		AddToPartition( Itemobj[i] , RoomID )	--�Ϯ���������X�{
		SetPlot( Itemobj[i] , "touch" , "Hao_Zone352_Chest_1" , 50 )
	end
--ACT1
	for i= 1 , 20 , 1 do
		MonsterObj[i] = CreateObjByFlag( TempObj[1] , 780366 , (i*2-1)-Rand(1)  , 1 ) 	-- �إߩǪ��b�X�ФW
		SetRandMove( MonsterObj[i] , 45 , 30 , 15 )	--������üƲ���
	end
	for i = 21 , 35 , 1 do 
		MonsterObj[i] = CreateObjByFlag( TempObj[2] , 780366 , (i*2-1)-Rand(1)  , 1 )
		SetRandMove( MonsterObj[i] , 50 , 20 , 25 )
	end
	for i= 36 , 50 , 1 do 
		MonsterObj[i] = CreateObjByFlag( TempObj[3] , 780366 , (i*2-1)-Rand(1) , 1 )
		SetRandMove( MonsterObj[i] , 40 , 15 , 20 )
	end
	for i= 1 , 50 , 1 do
		WriteRoleValue( MonsterObj[i] , EM_RoleValue_LV , PlayerLV )	-- �NACT1�Ǫ������ܧ󬰻P�p�����̰����Ŭ���
		AddToPartition(MonsterObj[i] , RoomID)
		SetPlot( MonsterObj[i] , "dead" , "Lua_Hao_GoblinACT1_Buff" , 0 )	-- ���`��Ĳ�o���@���A�p��Ǫ�����e���`����
	end
--ACT2
	for i= 1 , 12 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[1] , 780367 , (i*2-1)-Rand(1) , 1 )
	end
	for i= 13 , 25 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[1] , 780367 , (i*2-1)-Rand(1) , 1 )
		SetRandMove( MonsterObj1[i] , 45 , 30 , 15 )
	end
	for i = 26 , 38 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[2] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
	end
	for i = 39 , 50 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[2] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
		SetRandMove( MonsterObj1[i] , 50 , 20 , 25 )
	end
	for i= 51 , 65 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[3] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
	end
	for i= 66 , 80 , 1 do 
		MonsterObj1[i] = CreateObjByFlag( TempObj1[3] , 780367 , (i*2-1)-Rand(1) , 1 ) 	
		SetRandMove( MonsterObj1[i] , 40 , 15 , 20 )
	end
	for i= 1 , 80 , 1 do
		WriteRoleValue( MonsterObj1[i] , EM_RoleValue_LV , PlayerLV )	-- �NACT1�Ǫ������ܧ󬰻P�p�����̰����Ŭ���
		AddToPartition( MonsterObj1[i] , RoomID )
		SetPlot( MonsterObj1[i] , "dead" , "Lua_Hao_GoblinACT2_Buff" , 0 )
	end

	local ACT = {}
	ACT[1] = CreateObj( 102175 , 2114 , 282 , 3463 , 77 , 1 )	-- ACT1 ��
	ACT[2] = CreateObj( 102175 , 3333 , 85 , 3257 , 266 , 1 )	-- ACT2 ��

	for i = 1 , 2 , 1 do
		SetModeEx( ACT[i] , EM_SetModeType_Strikback , false )	--����
		SetModeEx( ACT[i] , EM_SetModeType_SearchenemyIgnore , false )	--�Q�j�M
		SetModeEx( ACT[i] , EM_SetModeType_Obstruct , true )	--����
		SetModeEx( ACT[i] , EM_SetModeType_Mark , false )	--�аO
		SetModeEx( ACT[i] , EM_SetModeType_Move , false )	--����
		SetModeEx( ACT[i] , EM_SetModeType_Searchenemy , false )	--����
		SetModeEx( ACT[i] , EM_SetModeType_HideName , false )	--�W��
		SetModeEx( ACT[i] , EM_SetModeType_ShowRoleHead , false )	--�Y����
		SetModeEx( ACT[i] , EM_SetModeType_Fight , false )	--�i�������
		SetModeEx( ACT[i] , EM_SetModeType_Drag , true )	--���O
		SetModeEx( ACT[i] , EM_SetModeType_Show , true )	--���
		AddToPartition( ACT[i] , RoomID )	
	end	

	if Opengate ~= true then	-- ���a�S�������P�ɡA���榹�@��
		BeginPlot( ACT[1] , "Lua_Hao_GoblinACT1_value" , 0 )
		BeginPlot( ACT[2] , "Lua_Hao_GoblinACT2_value", 0 )
	else	-- ���a����쵸�ɡA����}���@��
		for i = 1 , 2 , 1 do
			SetModeEx( ACT[i] , EM_SetModeType_Obstruct , false )--����
			Hide( ACT[i] )
			Show( ACT[i] , RoomID )--RoomID�O�o���ŧi
			PlayMotionEX( ACT[i] , 145 , 146 )--����}���ʧ@
		end
	end

	local King = 0
	if Step == 5 then	-- ��p�������a���̰����� >= 60 �ɡA�h�����L����|100%�X�{
		King = CreateObj( 113245 , 3439.5 , 85.0 , 3139.1 , 236.0 , 1 )
		SetModeEx( King , EM_SetModeType_Strikback , false )--����
		SetModeEx( King , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( King , EM_SetModeType_Obstruct , false )--����
		SetModeEx( King , EM_SetModeType_Mark , true )--�аO
		SetModeEx( King , EM_SetModeType_Move , true )--����
		SetModeEx( King , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( King , EM_SetModeType_HideName , false )--�W��
		SetModeEx( King , EM_SetModeType_ShowRoleHead , true )--�Y����
		SetModeEx( King , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( King , EM_SetModeType_Drag , false )--���O
		SetModeEx( King , EM_SetModeType_Show , true )--���
		AddToPartition( King , RoomID )
	--	ScriptMessage( Player , -1 , 2 , "[SC_GOBLINARENA_38]" , C_SYSTEM )
	--	ScriptMessage( Player , -1 , 0 , "[SC_GOBLINARENA_38]" , C_SYSTEM ) -- KING's here
	--	SetRandMove( King , 50 , 20 , 25 )
	end

	ACT[3] = CreateObj( 100292 , 3365 , 85 , 2986 , 110 , 1)	-- ����
	SetModeEx( ACT[3] , EM_SetModeType_Strikback , false )--����
	SetModeEx( ACT[3] , EM_SetModeType_SearchenemyIgnore , false ) --�Q�j�M
	SetModeEx( ACT[3] , EM_SetModeType_Obstruct , false )--����
	SetModeEx( ACT[3] , EM_SetModeType_Mark , false )--�аO
	SetModeEx( ACT[3] , EM_SetModeType_Move , false )--����
	SetModeEx( ACT[3] , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( ACT[3] , EM_SetModeType_HideName , false )--�W��
	SetModeEx( ACT[3] , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( ACT[3] , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( ACT[3] , EM_SetModeType_Drag , false )--���O
	SetModeEx( ACT[3] , EM_SetModeType_Show , false )--���
	AddToPartition( ACT[3]  , RoomID )
	WriteRoleValue( ACT[3] , EM_RoleValue_PID , Step )
	CallPlot( ACT[3]  , "Lua_Hao_GoblinACT3" , ACT[3]  , Step , RoomID , PlayerLV , King )	-- ����B���d�h�šBRoom�B�ƥ������a���̰����šB�N�J���(�L����ɬ�0)
end

function Lua_Hao_GoblinACT_Clock()	-- �����ä�����檺�p�ɼ@��

	local Fire = OwnerID()
	local Time = 1800	-- �C���ɶ�
	local RoomID = ReadRoleValue( Fire , EM_RoleValue_RoomID )
	local XX = 15
	local Obj

	for i = 1 , 2000 do
		if XX >= 15 then	-- �C15���y�@���ϰ�A�í��㪱�a���p�ƾ����A(�D���m�A��K����[�J�����a���o���T�ɶ�)
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for j = 1 , Count , 1 do
					local ID = GetSearchResult()
					ClockClose( ID )
					ClockOpen( ID , EM_ClockCheckValue_5  , Time - i , Time - i , 0  ,"Lua_Clockending"  , "Lua_Clockending" )	--�ɶ��H���
				end
			end
			XX = 0
		end
		if i < Time then	-- i �V�ӶV�j�A Time ����
			XX = XX + 1
			if i == (Time-10) then	-- ��ƳѤU10��ɡA�惡�ϰ쪺���a�s��
				local Count = SetSearchAllPlayer(RoomID)
				if Count ~= 0 then
					for i = 1 , Count , 1 do
						local ID = GetSearchResult()
						LuaDan_HitShrew_CheckOK(10,10,0)
						ScriptMessage( ID , ID , 1 , "[SC_GOBLINARENA_16]" , 0 ) -- �v�ɭ���ɶ��Y�N����A10���N�������ϰ�C
						ScriptMessage( ID , ID , 0 , "[SC_GOBLINARENA_16]" , 0 )
					end
				end
			end
		else	-- �� i >= 1800 �ɡA�N���a�q�ƥ�����X�A�ós����� i - Time ��
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					ChangeZone( ID , 4 , 0 , -5852.6 , 572.2 , 3326.3 , 149.5 )	--�e�����r��
				end	
			end
		end
		Sleep(10)
	end
end

function Lua_Hao_GoblinACT1_Buff()	-- �����bACT1�Ǫ��W�����`Ĳ�o�@���C

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )
	DeadCount[RoomID][1] = DeadCount[RoomID][1] + 1

	if DeadCount[RoomID][1] <= 40 then
		ScriptMessage( Monster , -1 , 1 , "[SC_GOBLINACT1DEAD][$SETVAR1="..DeadCount[RoomID][1].."]" , C_SYSTEM ) 
		ScriptMessage( Monster , -1 , 0 , "[SC_GOBLINACT1DEAD][$SETVAR1="..DeadCount[RoomID][1].."]" , C_SYSTEM ) 
	end
	DelObj(Monster)
end

function Lua_Hao_GoblinACT1_value()	-- �����bACT1�j���W���ͩǼ@��
	sleep(20)
	local Door = OwnerID()
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID )	

	while true do	--�P�_�Ǫ��ѤU�X��
		if DeadCount[RoomID][1] >= 40 then
			SetModeEx( Door , EM_SetModeType_Obstruct , false )	--���������Ϫ��a�i�H�q��
			Hide( Door )
			Show( Door , RoomID )--RoomID�O�o���ŧi
			PlayMotionEX( Door , 145 , 146 )--����}���ʧ@
			ScriptMessage( Door , -1 , 1 , "[SC_GOBLIN_OPENDOOR1]" , C_SYSTEM )	-- �ĤG���J�f�����w�g�Q���}�F�A�U������L�i�h�A�V�e�ڶi�a�I
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLIN_OPENDOOR1]" , C_SYSTEM )
			ScriptMessage( Door , -1 , 2 , "[SC_GOBLINARENA_14]" , C_SYSTEM )	-- �u�n����60��H�W�������L�A�ĤT���J�f���j���N�|�}�ҡC
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLINARENA_14]" , C_SYSTEM )
			break
		end
		sleep(10)	
	end
end

function Lua_Hao_GoblinACT2_Buff()	-- �����bACT2�Ǫ��W�����`Ĳ�o�@���C

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )
	DeadCount[RoomID][2] = DeadCount[RoomID][2] + 1

	if DeadCount[RoomID][2] <= 60 then
		ScriptMessage( Monster , -1 , 1 , "[SC_GOBLINACT2DEAD][$SETVAR1="..DeadCount[RoomID][2].."]" , C_SYSTEM )
		ScriptMessage( Monster , -1 , 0 , "[SC_GOBLINACT2DEAD][$SETVAR1="..DeadCount[RoomID][2].."]" , C_SYSTEM )
	end
	
	local TempObj = {102054,102055,102056,102074,102075,102076,102085,102086,102087,102095,102096,102097}
	local Count = SetSearchAllNPC(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			for j = 1, table.getn(TempObj) do
				if ReadRoleValue( ID ,EM_RoleValue_OrgID ) == TempObj[j] and ReadRoleValue( ID , EM_RoleValue_IsDead ) == 0 then
					AddBuff( ID , 503610 , 0 , -1 )
					castspell( ID , ID , 493376 )
				end
			end
		end
	end
	DelObj(Monster)
end

function Lua_Hao_GoblinACT2_value()	-- �����bACT2�j���W���ͩǼ@��
--	sleep(20)
	local Door = OwnerID()
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID )

	while true do	--�P�_�Ǫ��ѤU�X��
		if DeadCount[RoomID][2] >= 60 then
		--	DebugMsg( 0 , RoomID , "Dead = "..DeadCount[RoomID][2] )
			SetModeEx( Door , EM_SetModeType_Obstruct , false )--���������Ϫ��a�i�H�q��
			Hide( Door )
			Show( Door , RoomID )
			PlayMotionEX( Door , 145 , 146 )--����}���ʧ@
			ScriptMessage( Door , -1 , 1 , "[SC_GOBLIN_OPENDOOR2]" , C_SYSTEM ) -- �ĤT���J�f�����w�g�Q���}�F�A�U������L�i�h�A�~��V�e�ڶi�a�I
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLIN_OPENDOOR2]" , C_SYSTEM )
			ScriptMessage( Door , -1 , 2 , "[SC_GOBLINARENA_15]" , C_SYSTEM ) -- �̫᪺�D�ԡA�u�n���˥����������A�N�ધ����̰����aģ�I
			ScriptMessage( Door , -1 , 0 , "[SC_GOBLINARENA_15]" , C_SYSTEM )
			break
		end
		sleep(10)	
	end
end

function Lua_Hao_GoblinACT3( Fire , Step , RoomID , PlayerLV , King )	-- �����bACT3�j���Ǫ����ä�����檺�@��
	-- ����B���d�h�šBRoom�B�ƥ������a���̰����šB���(�L����ɬ�0)
	-- 2012.12.27 �s�W DesignLog 
	local List = {}
	List[1] = 11265111	-- �M�����ݩʪ������Ǫ���A���ݩ����l�X�{�_�c�ɡA�O���U�����a�M��
	List[2] = 11265112	-- �M�����ݩʪ������Ǫ���A����ݩ����l�X�{�_�c�ɡA�O���U�����a�M��
	List[3] = 11265113	-- �M�����ݩʪ������Ǫ���A����ݩ����l�X�{�_�c�ɡA�O���U�����a�M��
	List[4] = 11265114	-- �M���g�ݩʪ������Ǫ���A��g�ݩ����l�X�{�_�c�ɡA�O���U�����a�M��	
	--
	local BoxLv = {}	-- ��3���d���_�cLv
	BoxLv[RoomID] = 0
	local BoxBorn = {0,0,0,0}	-- �O�������_�c���ͪ��ƶq
	local GoodBoxNM = math.random(4)	-- �H���D��@�Ӱ����_�c�@�������_�c
	
	local BossBorn = 0	-- �O��Boss���ͪ��ƶq

	local TempObj = {} --��3���d��Npc ID
	TempObj[1] = { 102057,102058,102059,102060 }	-- Lv   1 ~ 29
	TempObj[2] = { 102077,102078,102079,102080 }	-- Lv 30 ~ 39
	TempObj[3] = { 102088,102089,102090,102091 }	-- Lv 40 ~ 49
	TempObj[4] = { 102098,102099,102100,102101 }	-- Lv 50 ~ 59
	TempObj[5] = { 102098,102099,102100,102101 }	-- ���B���B���B�g������	 Lv 60 ~ 200

	local BossObj = {}	-- ��3���d��BossID
	BossObj[1] = { 102062 }	-- Lv   1 ~ 29 �g������
	BossObj[2] = { 102081 }	-- Lv 30 ~ 39 ��������
	BossObj[3] = { 102061 }	-- Lv 40 ~ 49 ��������
	BossObj[4] = { 102102 }	-- Lv 50 ~ 59 ��������
	BossObj[5] = { 102062 , 102081 , 102061 , 102102 }	-- Lv 60 ~ 200 ���B���B���B�g�������H���X�@
	BossObj[5] = { BossObj[5][math.random(#BossObj[5])] }	-- �M�w60�ťH�W�����d�O���򤸯�����Boss

	local MonsterObj = {}	-- ��3���d��Npc
	
	for i = 1 , 40 , 1 do	-- ���ͪ����B���B���B�g������
		MonsterObj[i] = CreateObjByFlag( TempObj[Step][math.ceil( i/10 )] , 780368 , (i*2-1)-Rand(1)  , 1 )
		WriteRoleValue( MonsterObj[i] , EM_RoleValue_LV , PlayerLV )	-- �NACT3�Ǫ������ܧ󬰻P�p�����̰����Ŭ���
		SetPlot( MonsterObj[i] , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- ���`��Ĳ�o���@���A�����a�L�k�B������
		AddToPartition( MonsterObj[i] , RoomID )
		SetRandMove( MonsterObj[i] , 50 , 20 , 25 )
	end
	Sleep(20)
--	local OldLive = Lua_Hao_GoblinACT3_SearchLive( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] )
	local OldLive = { 10 , 10 , 10 , 10 }	-- �즸���ͤ����ǮɡA�U�ݩʤ����Ǫ��ƶq
	Sleep(20)
	while true do
		local NewLive = Lua_Hao_GoblinACT3_SearchLive( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] )
		local Elemental = 0
		local ElementalMsg
		--�P�_��4���ͤ@��
		for i = 1 , 4 do
			if NewLive[i] > OldLive[i] then	-- ��s�����Ǽƶq�����
				OldLive[i] = NewLive[i]
			end
		end
		if (OldLive[1] - NewLive[1]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][2] , 780368 , Rand(19)+20  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_17]" -- �������]�����������I�z�Ӥ��w�F�_�ӡC
		end
		if (OldLive[2] - NewLive[2]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][3] , 780368 , Rand(19)+40  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_18]" -- �g�����]�����������I�z�Ӥ��w�F�_�ӡC
		end
		if (OldLive[3] - NewLive[3]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][4] , 780368 , Rand(19)+60  , 1 )
			ElementalMsg = "[SC_GOBLINARENA_19]" -- �������]���g�������I�z�Ӥ��w�F�_�ӡC
		end
 		if (OldLive[4] - NewLive[4]) >= 4 then
			Elemental = CreateObjByFlag( TempObj[Step][1] , 780368 , Rand(19) , 1 )
			ElementalMsg = "[SC_GOBLINARENA_20]" -- �������]�����������I�z�Ӥ��w�F�_�ӡC
		end
		if Elemental ~= 0 then	-- �������Ǫ����ͮɡA�h���榹 if �U���@��
			WriteRoleValue( Elemental , EM_RoleValue_LV , PlayerLV )	-- �NACT3�Ǫ������ܧ󬰻P�p�����̰����Ŭ���
		--	ScriptMessage( Fire , -1 , 2 , ElementalMsg , C_SYSTEM )
			ScriptMessage( Fire , -1 , 0 , ElementalMsg , C_SYSTEM )
			SetPlot( Elemental , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- ���`��Ĳ�o���@���A�����a�L�k�B������
			AddToPartition( Elemental , RoomID )
			SetRandMove( Elemental , 50 , 20  , 25 )
			OldLive = NewLive
		end
--		DebugMsg( 0, RoomID ,"OldLive[1] = "..OldLive[1].."OldLive[2] = "..OldLive[2].."OldLive[3] = "..OldLive[3].."OldLive[4] = "..OldLive[4])
		--�P�_�ۮt6���ͤ�
		if BossBorn == 0 then
			local Monster = 0		
			if NewLive[1] - NewLive[2] >= 6 then	-- �� - �g
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+20 , 1 )
			elseif NewLive[2] - NewLive[1] >=6 then	-- �g - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19) , 1 )
			end
			if NewLive[2] - NewLive[3] >=6 then	-- �g - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+40 , 1 )
			elseif NewLive[3] - NewLive[2] >=6 then	-- �� - �g
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+20 , 1 )
			end
			if NewLive[3] - NewLive[4] >=6 then	-- �� - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+60 , 1 )
			elseif NewLive[4] - NewLive[3] >=6 then	-- �� - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+40 , 1 )
			end
			if NewLive[4] - NewLive[1] >=6 then	-- �� - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)  , 1 )
			elseif NewLive[1] - NewLive[4] >=6 then	-- �� - ��
				Monster = CreateObjByFlag( BossObj[Step][1] , 780368 , Rand(19)+60  , 1 )
			end
			if Monster ~= 0 then
				local Player = Lua_Hao_Goblin_SearchPlayer(RoomID)	-- �����o���a��T			
				WriteRoleValue( Monster , EM_RoleValue_LV , PlayerLV )	-- �NBoss���Žվ㬰�P�p�������a���̰����ŬۦP
				WriteRoleValue( Monster , EM_RoleValue_Register+1 , Step )	-- �N���d�h�żg�JBoss��Reg+1��
				WriteRoleValue( Monster , EM_RoleValue_Register+2 , 1 )	-- �P�_�ΡA��K�t�ΰO�����榺�`�@���ɡA�p�GŪ���� Reg+2=1�ɬ�Boss
				SetPlot( Monster , "dead" , "Hao_GoblinACT3_Dead" , 0 )	-- ���`��Ĳ�o���@���A�����a�L�k�B������
				AddToPartition( Monster , RoomID )
				SetRandMove( Monster , 50 , 20 , 25 )
				SetAttack( Monster, Player[1] )
				ScriptMessage( Fire , -1 , 2 , "[SC_GOBLINARENA_21]" , C_SYSTEM )	-- ��q���ا��ܥO�����s�P�줣�w�A�o�Ѥ��w�P���E�X�F���������@�̡C
				ScriptMessage( Fire , -1 , 0 , "[SC_GOBLINARENA_21]" , C_SYSTEM )
				BossBorn = 1
			end
		end
		for i = 1 , 4 do	-- �m�J�_�c
			if NewLive[i] == 0 and BoxBorn[i] == 0 then
				local Box = CreateObjByFlag( 113137 , 780370 , i-1  , 1 )
				local PlayerName = {}	-- 2013.03.20 �s�W
				local ChestMsg = ""
				
				local Msg = {}
				Msg[1] = { "[SC_GOBLINARENA_25]" , "[SC_GOBLINARENA_43]" }	-- ���æb�������l���f���_�c�X�{�F�C�B��o�}�ҭ����l�_�c��檺�D�Ԫ̬O�G
				Msg[2] = { "[SC_GOBLINARENA_26]" , "[SC_GOBLINARENA_44]" }	-- ���æb�������l���f���_�c�X�{�F�C�B��o�}�Ҥ����l�_�c��檺�D�Ԫ̬O�G
				Msg[3] = { "[SC_GOBLINARENA_27]" , "[SC_GOBLINARENA_46]" }	-- ���æb�g�����l���f���_�c�X�{�F�C�B��o�}�Ҥg���l�_�c��檺�D�Ԫ̬O�G
				Msg[4] = { "[SC_GOBLINARENA_28]" , "[SC_GOBLINARENA_45]" }	-- ���æb�������l���f���_�c�X�{�F�C�B��o�}�Ҥ����l�_�c��檺�D�Ԫ̬O�G
			
				local Keyitem = {}
				Keyitem[1] = { 542875 , 543557 }
				Keyitem[2] = { 542876 , 543558 }
				Keyitem[3] = { 542877 , 543559 }
				Keyitem[4] = { 542878 , 543560 }

				WriteRoleValue( Box , EM_RoleValue_PID , i )	-- �N�����ϼg�J�_�c��
				WriteRoleValue( Box , EM_RoleValue_Register+1 , Step )		-- �N�_�c���żg�J�_�c��
				WriteRoleValue( Box , EM_RoleValue_Register+4 , PlayerLV )	-- �N�p�����a�̰����żg�J�_�c��
				AddToPartition( Box , RoomID )
				ScriptMessage( Fire , -1 , 2 , Msg[i][1] , C_SYSTEM )
				ScriptMessage( Fire , -1 , 0 , Msg[i][1] , C_SYSTEM )
				
				local Count = SetSearchAllPlayer(RoomID)
				if Count ~= 0 then
					ChestMsg = Msg[i][2]
					for j = 1 , Count , 1 do
						local ID = GetSearchResult()
						PlayerName[j] = GetName(ID)
						if CheckFlag( ID , 542743 ) == true then
							if j == Count then	-- �y���ɤ��[�B
								ChestMsg = ChestMsg..PlayerName[j]
							else	-- ���_�y�ɥ[�J�B
								ChestMsg = ChestMsg..PlayerName[j].."[SC_SEPARATEMARK]"
							end
							SetFlag( ID , Keyitem[i][1] , 1 )
							SetFlag( ID , Keyitem[i][2] , 1 )	-- 12/03 �s�W�X�� �������a �j�v�w�߭ײz��&3�I�]���_����q
							DesignLog( ID , List[i] , "A treasure chest appears in the mouth of the wind furnace." )				
						end
					end
					ScriptMessage( Fire , -1 , 0 , ChestMsg , C_SYSTEM )
				end				
				if i == GoodBoxNM then	-- �����_�c
					SetPlot(Box,"touch","Lua_Hao_GoblinboxACT3_02",50)
				else	-- �����_�c
					SetPlot(Box,"touch","Lua_Hao_GoblinboxACT3_01",50)
				end
				BoxBorn[i] = 1
			end
		end
		local AllNPCdead = Lua_Hao_Goblin_Openthegate( TempObj[Step][1] , TempObj[Step][2] , TempObj[Step][3] , TempObj[Step][4] , BossObj[Step] )
		local NPCCount = 0
		for i = 1, 5 do 
			if AllNPCdead[i] == 0 then 
		 		NPCCount = NPCCount + 1
			end
		end 

		-------------------------------------------------------140127 K.J. Aris �T�O�_�c���w�����~���_�j��   
		local _boxesAllGave = true;
		for _index , _value in pairs( BoxBorn ) do
			if ( _value == 0 ) then
				_boxesAllGave = false;--�Y���_�c�٨S��   �h�ϰj���~��
				break;
			end
		end
		----------------------------------------END------------140127 K.J. Aris �T�O�_�c���w�����~���_�j��   
		
		--if NPCCount  == 5 then	-- �����ǻPBoss���Q�M����...
		if ( NPCCount  == 5 ) and ( _boxesAllGave == true ) then--140127 K.J. Aris �T�O�_�c���w�����~���_�j��   
		-- 2011.08.19 �s�W���}1���ٸ� --
			local Count = SetSearchAllPlayer(RoomID)
			if Count ~= 0 then
				for j = 1 , Count , 1 do
					local ID = GetSearchResult()
					-- 2011.08.19 �s�W���}1���ٸ� --
					if CountBodyItem( ID , 530085 ) < 1 then
						GiveBodyItem( ID , 530085 , 1 )
					end
				end
			end
			if King ~= 0 then	-- �b�����L����X�{�����p�U�A�q�������L��������d�w�Q��}
				WriteRoleValue( King , EM_RoleValue_Register+1 , 1 )
			end
			ScriptMessage( Fire , -1 , 2 , "[SC_GOBLINARENA_29]" , C_SYSTEM ) -- �X�f���ǰe�}�w�g�}�ҡC
			ScriptMessage( Fire , -1 , 0 , "[SC_GOBLINARENA_29]" , C_SYSTEM )
			local Leave_Gate = CreateObjByFlag( 113166 , 780368 , 80 , 1 ) 
			SetModeEx( Leave_Gate, EM_SetModeType_Strikback, false )--����
			SetModeEx( Leave_Gate, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( Leave_Gate, EM_SetModeType_Obstruct, false )--����
			SetModeEx( Leave_Gate, EM_SetModeType_Mark, false )--�аO
			SetModeEx( Leave_Gate, EM_SetModeType_Move, false )--����
			SetModeEx( Leave_Gate, EM_SetModeType_Searchenemy, false )--����
			SetModeEx( Leave_Gate, EM_SetModeType_HideName, false )--�W��
			SetModeEx( Leave_Gate, EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( Leave_Gate, EM_SetModeType_Fight , false )--�i�������
			SetModeEx( Leave_Gate, EM_SetModeType_Drag , false )--���O
			SetModeEx( Leave_Gate, EM_SetModeType_Show, true)--���
			AddToPartition( Leave_Gate , RoomID )

			break;--�Y�Ҧ��_�c���w���w  �h���_�j��
		end
		Sleep(10)
	end
end

function Hao_GoblinACT3_Dead()	-- �����bACT3�Ǫ��W�����`Ĳ�o�@���C

	local Monster = OwnerID()
	local RoomID = ReadRoleValue( Monster , EM_RoleValue_RoomID )	-- Ū��Room
--	local Sex = GameObjInfo_int( Monster , "Sex" )	-- Ū����Ʈw�����󪺩ʧO�A���Ȧ��`�ɡA�L�k�Q�B�z
	local Level = ReadRoleValue( Monster , EM_RoleValue_Register+1 )	-- Ū��Boss���������d�h��
	local Boss = ReadRoleValue( Monster , EM_RoleValue_Register+2 )	-- ��Reg+2=1�ɡA�h��Boss

	if Boss == 1 then
		local Chest = CreateObjByObj( 122390 , Monster )	-- �_�c	--113137
		SetModeEx( Chest , EM_SetModeType_Show , true)--���
		SetModeEx( Chest , EM_SetModeType_HideName , false )--�W��
		SetModeEx( Chest , EM_SetModeType_ShowRoleHead , false )--�Y����
		WriteRoleValue( Chest , EM_RoleValue_Register+1 , Level )	-- �N���d�h�żg�J�_�c
		WriteRoleValue( Chest , EM_RoleValue_IsWalk , 1 )--�Ψ�����
		ScriptMessage( Chest , -1 , 2 , "[SC_GOBLINARENA_47]" , C_SYSTEM ) -- �_�c�ǥX�{�F�I���I�������o��h�����y�C
		ScriptMessage( Chest , -1 , 0 , "[SC_GOBLINARENA_47]" , C_SYSTEM )
		ReCalculate( Chest )	
		AddToPartition( Chest , RoomID )
	--	SetRandMove( Chest , 100 , 10 , 75 )
		CallPlot( Chest , "Hao_GoblinACT3_Boss_Chest_RandMove" , Chest )
		SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 10 )		
	end
	DelObj(Monster)
end

function Hao_GoblinACT3_Boss_Chest_RandMove(Chest)	-- �üƲ���

	local X , Y , Z , Dir =DW_Location( Chest )
	while true do
	     	local X , Y , Z , Dir = DW_NewLocation( DW_Rand(360) , 50 , X , Y , Z , Dir )
	     	local Sec = Move( Chest , X , Y , Z )
 	    	Sleep( Sec+1 )
	end
end

function Hao_GoblinACT3_Boss_Chest()	-- Boss ���`��A�]�X�_�c�Ǫ��@��

	local Player = OwnerID()	-- ���a
	local Chest = TargetID()	-- �_�c
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )

	SetPlot( Chest , "touch" , "" , 0 )
		
	if CheckFlag( Player , 542743 ) == false then	-- �p�G�Ӫ��a�S���W�A�S���}���_�c�������A�hĵ�i�æ^�����@���C
		ScriptMessage( Chest , Player , 1 , "[SC_GOBLINARENA_33]" , 0 ) --�A�S���v���}�ҳo���_�c�C
		SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )		
		DesignLog( Player , 113137 , "Cheater" )	-- �����L�_�c
		return
	end
	
	if ReadRoleValue( Chest , EM_RoleValue_PID ) == 1 then				-- ����Ƽƪ��a��P�ɶ}���_�c�A����o�쪺���D�C
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )		-- ���L���A�еy�ԦA�աC
		return
	end
	WriteRoleValue( Chest , EM_RoleValue_PID, 1 )
	
	if BeginCastBarEvent( Player , Chest , "[SO_110195_1]" , 5 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 , "Hao_GoblinACT3_Boss_Chest_1" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--�ؼХ��b���L��
		return
	end	
end

function Hao_GoblinACT3_Boss_Chest_1( Player , CheckStatus )	-- ���ʰƥ� - �����L�q�|Boss�_�c��  Player = ���a�BCheckStatus = ���浲�G(�j��0�O���\�A�p��0�O����)

	local Chest = TargetID()	-- �_�c
	local Level = ReadRoleValue( Chest , EM_RoleValue_Register+1 )	-- Ū�����d�h�šA�H�M�w�_�c����

	local Treasure = {}	-- �_�c���e�� 6.0.1 ��A��
	Treasure[1] = {			-- Lv 1~39 �_�c���e
			520022 ,	-- �O�� II
			520042 ,	-- �@�O II
			520062 ,	-- �o�z II
			520082 ,	-- ��O II
			520102 ,	-- �F�� II
			520122 ,	-- ��O II
			520142 ,	-- �]�O II
			520162 ,	-- �ˮ` II
			520182 ,	-- �]�� II
			520202 ,	-- ���� II
			520222 ,	-- �]�� II
					}
		
	Treasure[2] = {			--Lv 40~59 �_�c���e
			520023 ,	-- �O�� III	
			520043 ,	-- �@�O III
			520063 ,	-- �o�z III
			520083 ,	-- ��O III
			520103 ,	-- �F�� III
			520123 ,	-- ��O III
			520143 ,	-- �]�O III
			520163 ,	-- �ˮ` III
			520183 ,	-- �]�� III
			520203 ,	-- ���� III
			520223 ,	-- �]�� III
					}
	
	Treasure[3] = {			-- Lv 60+ �_�c���e
			520024 ,	-- �O�� IV	
			520044 ,	-- �@�O IV
			520064 ,	-- �o�z IV
			520084 ,	-- ��O IV
			520104 ,	-- �F�� IV
			520124 ,	-- ��O IV
			520144 ,	-- �]�O IV
			520164 ,	-- �ˮ` IV
			520184 ,	-- �]�� IV
			520204 ,	-- ���� IV
			520224 ,	-- �]�� IV
					}	

	if CheckStatus ~= 0 then	-- �p�G���I�k����
		if CheckStatus > 0 then	-- �I�k���\
			if EmptyPacketCount(Player) >= 1 and QueuePacketCount(Player) == 0 then --�ˬd�I�]���
				local Pass = ReadRoleValue( Chest , EM_RoleValue_Register+2 )			
				local Select = {}
				Select["X"] = math.ceil(Level/2)	-- �M�w Treasure[X] ���� X 
				Select["Y"] = math.random(#Treasure[Select["X"]])	-- �M�w Treasure[X][Y] ���� Y
				WriteRoleValue( Chest , EM_RoleValue_PID, 0 )	-- �Ѱ����L���A
				GiveBodyItem( Player , Treasure[Select["X"]][Select["Y"]] , 1 )				
				WriteRoleValue( Chest , EM_RoleValue_Register+2 , Pass+1 )	-- �N���X�Ť�ƶq+1				
				if Pass+1 >= 6 then	-- ����X�Ť�ƶq >= 5 �ɡA�h�R�����ۤv
					DelObj( Chest )
				else
					SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
				end				
			else
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
				WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
				SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
			end
			EndCastBar( Player , CheckStatus )
		else	-- �I�k����
			WriteRoleValue( Chest , EM_RoleValue_PID , 0 )
			SetPlot( Chest , "touch" , "Hao_GoblinACT3_Boss_Chest" , 15 )
			EndCastBar( Player , CheckStatus )
		end
	end
end

function Lua_Hao_GoblinACT3_SearchLive(TempObj1,TempObj2,TempObj3,TempObj4)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local Live = {0,0,0,0}
--	Say(OwnerID(),"TempObj1 = "..TempObj1.."TempObj2 = "..TempObj2.."TempObj3 = "..TempObj3.."TempObj4 = "..TempObj4)
	local Obj
	local Count = SetSearchAllNPC(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:RoomID() == RoomID and Obj:IsNPC() == true and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
				local FlagOrgID = Obj:OrgID()
				if (FlagOrgID == TempObj1) then
					Live[1] = Live[1] + 1
				end
				if (FlagOrgID == TempObj2) then
					Live[2] = Live[2] + 1
				end
				if (FlagOrgID == TempObj3) then
					Live[3] = Live[3] + 1
				end
				if (FlagOrgID == TempObj4) then
					Live[4] = Live[4] + 1
				end
			end
		end	
	end
--	DebugMsg( 0, RoomID ,"======2")
	return Live
end

function Lua_Hao_Goblin_SearchPlayer(RoomID)
	local Player = {}	
	local NM = 1
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				Player[NM] = ID
				NM = NM + 1
			end
		end	
	end
	if Player[1] == nil then
		Player[1] = -1
	end
	return Player
end

function Lua_Hao_Goblin_113166_0()	-- �}����X�{���ǰe�}�Ұ��檺�@��

	SetPlot(OwnerID() ,"range","Lua_Hao_Goblin_113166_1",100)
end

function Lua_Hao_Goblin_113166_1()

	if CheckBuff( OwnerID() , 501570) == false then 	--�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1)	--�M�ᵹ��BUFF
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GOBLINARENA_32]" )
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" )
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" )
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	--��ưe�X�����D
			return
		end
		
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					ChangeZone( OwnerID() , 4, 0, -5852.6, 572.2, 3326.3, 149.5 ) --�e�����r��
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end		
end

function Lua_Hao_Goblin_Openthegate(TempObj1, TempObj2, TempObj3, TempObj4, BossObj1)
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) --���o�Ҧbroom
	local Live = {0,0,0,0,0}

	local Obj
	local Count = SetSearchRangeInfo( OwnerID() , 3000 )
	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )	
		if Obj:RoomID() == RoomID and Obj:IsNPC() == true and ReadRoleValue( ID , EM_RoleValue_IsDead) == 0 then
			local FlagOrgID = Obj:OrgID()
			if (FlagOrgID == TempObj1) then
				Live[1] = Live[1] + 1
			end
			if (FlagOrgID == TempObj2) then
				Live[2] = Live[2] + 1
			end
			if (FlagOrgID == TempObj3) then
				Live[3] = Live[3] + 1
			end
			if (FlagOrgID == TempObj4) then
				Live[4] = Live[4] + 1
			end
			if (FlagOrgID == BossObj1) then
				Live[5] = Live[5] + 1
			end
		end
	end
--	DebugMsg( 0, RoomID ,"======2")
	return Live
end

function Lua_Hao_Goblin_Reset_Instance()	-- ���m�����L�ƥ�

	local Player = OwnerID()
	local Ticket = {}
	Ticket[1] = 542743	--�����L�v�t�p�ɶ}�l
	Ticket[2] = 542742	--�����L�������_�c01	
	Ticket[3] = 542869	--�����L�������_�c02
	Ticket[4] = 542870	--�����L�������_�c03
	Ticket[5] = 542871	--�����L�������_�c04
	Ticket[6] = 542875	--�����L�����_�cKey
	Ticket[7] = 542876	--�����L�����_�cKey
	Ticket[8] = 542877	--�����L�����_�cKey
	Ticket[9] = 542878	--�����L�g���_�cKey
	Ticket[10] = 542904	--�����L���⯵�_�w���
	Ticket[11] = 542905	--�w�ζǰe�̸��޲z��
	Ticket[12] = 543557	--�����L�}���ذe01
	Ticket[13] = 543558	--�����L�}���ذe02
	Ticket[14] = 543559	--�����L�}���ذe03
	Ticket[15] = 543560	--�����L�}���ذe04
	Ticket[16] = 542689	--�D�Ը��	
	
	for i = 1 , table.getn(Ticket) , 1 do
		SetFlag( Player , Ticket[i] , 0 )
	end
end

function Lua_Hao_GoblinACT3_ChestTouch()
--	SetPlot(OwnerID(),"touch","Lua_Hao_GoblinACT3_ChangeChest",30)
end