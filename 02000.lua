-- ���a
-- EM_RoleValue_Register 	�����a�O�o�Щx
-- EM_RoleValue_Register+1	�����a�O�o�}�����ê���
-- EM_RoleValue_Register+2	�y��l�ܼҦ� 1���l�� 0�����l��
-- EM_RoleValue_Register+3	�����a�O�o�IĲ���y�᪺���Ϊ���
-- EM_RoleValue_Register+3	�����a�O�o�ثe���񪺭���
-- �Щx
-- EM_RoleValue_Register 	�O�����a�O�_���L������
-- EM_RoleValue_Register+2	���Щx�O�o���a
-- �}�����ê���
-- �IĲ���y�᪺���Ϊ���
-- EM_RoleValue_Register+2 ������O�o���a
-- ���ʲy��
-- EM_RoleValue_Register	�Ҧ�
-- EM_RoleValue_Register+1	���y��O�o���a
-- EM_RoleValue_Register+3	���y��O�oĲ�I���ê���

function Lua_Hao_GuildBall_NPC()	-- �ǰe��a��NPCĲ�o�@��
	SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_NPC_2" , 150 )
end

function Lua_Hao_GuildBall_NPC_2()	-- ��t�@��
--	say(OwnerID() , "1" ) --���a
--	say(TargetID() , "2" ) --NPC
	local Face = { 109 , 114 }	-- �ֹL�ӡA�V�m�ҵ{�w�g�ǳƦn�F�C , �Q�n�ǲߧ󧹬����ޥ���?
	local String = { "[SC_GUILD_BARRAGE_3]" , "[SC_GUILD_BARRAGE_4]" }

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then 	-- �� NPC ��t�@��
		return
	else
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , OwnerID() )	-- �N���a�g�JNPC 116472 ��
	--	local Player = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )
		CallPlot( TargetID() , "Lua_Hao_GuildBall_NPC_5" , OwnerID() , 500 )		-- �קK�C���i�椤�������n�A�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		for i = 1 , table.getn(Face) , 1 do
			Sleep(20)
			AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
			PlayMotion( TargetID() , Face[i] ) -- ���V
			ScriptMessage( TargetID() , OwnerID() , 2 , String[i] , 0 )
			ScriptMessage( TargetID() , OwnerID() , 0 , String[i] , 0 )
		end
	end
end

function Lua_Hao_GuildBall_NPC_3()	-- �PNPC��ܫ᪺�@��
--	say(OwnerID() , "3" ) --���a
--	say(TargetID() , "4" ) --NPC

	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  )	-- ¾�~
	local Bonus = ReadRoleValue( TargetID() , EM_RoleValue_Register  )	-- NPC���W��Reg�ȡA�ΨӰO�����a�O�_���L������	���ϥ�
	local Highest = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20 )	-- �n�����̰��O��
	local Ticket = CheckFlag( OwnerID() , 542248 )				-- ��

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 111 ) --�q§
	BeginPlot( TargetID() , "Lua_Hao_GuildBall_NPC_4" , 0 )	-- �W�L�Z��50�Y��������

	if CheckBuff( OwnerID() , 503783 ) == true then
			SetSpeakDetail( OwnerID() , "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C  
	else
	--	if Bonus == 0 or PlayerJob == 0 then
		if Ticket == false or PlayerJob == 0 then
			if Highest ~= 0 then
				SetSpeakDetail( OwnerID() , "[SC_GUILD_BARRAGE_12][$SETVAR1="..Highest.."]" ) --[$PLAYERNAME]�A�A���g��o���a�A�I�Ƴ̰��O����<CY>[$VAR1]</CY>�A�ǳƦn�����D�ԤF�ܡH
			else
				SetSpeakDetail( OwnerID() , "[SC_GUILD_WARRIOR_16]"  ) --[$PLAYERNAME]�A�ǳƦn�����D�ԤF�ܡH
			end
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_GUILD_BARRAGE_5]" , "Lua_Hao_GuildBall_Teaching", 0 )--�����Ĭ𻡩�
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_GUILD_BARRAGE_6]" , "Lua_Hao_GuildBall_Begin " , 0 )--�i�� <CB>�����Ĭ�</CB>
			AddSpeakOption( OwnerID() , TargetID( ) , "[SC_CLICKFUNGO04]" , "Lua_Hao_GuildBall_Leave", 0 )--���}�ճ�
	--	elseif Bonus == 101 then
		elseif Ticket == true then
			SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_12]"  ) -- �o�����շҨ즹����A���ݧA�U������{�C
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_GuildBall_Leave", 0 )--���}�ճ�
		end
	end
end

function Lua_Hao_GuildBall_NPC_4()	-- ������ܼ@��
--	say(OwnerID() , "IamNPC" ) --NPC
--	say(TargetID() , "IamPlayer" ) --���a

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end

function Lua_Hao_GuildBall_NPC_5( Player , Range )		-- �קK�C���i�椤�������n�A�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D

	while true do	--�� NPC �ۤv�P�_�O�_�n�R���ۤv
		if CheckID(Player) == false then
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then
			BeginPlot( Player , "Lua_Hao_GuildBall_Del_NPC" , 0 )
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildBall_Teaching() -- �y�����Ĭ�z�ҵ{�`�N�ƶ��G
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 112 ) 
	SetSpeakDetail( OwnerID() , "[SC_GUILD_BARRAGE_7]" ) 
	AddSpeakOption( OwnerID() , TargetID( ) , "[SC_111352_2]" , "Lua_Hao_GuildBall_NPC_3" , 0 )--�^�W�@��
end

function Lua_Hao_GuildBall_Leave()--���}�V�m��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	CloseSpeak( OwnerID() ) 	
	ChangeZone( OwnerID() , 354 , RoomID , 5121.3 , 13.4 , 2515.2 , 269.9 )	--ChangeZone( OwnerID() , ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x , y , z , Dir )
	DelObj( TargetID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildBall_Begin() -- �ǳƶ}�l�C���@�NNPC�����аO

	SetModeEx( TargetID() , EM_SetModeType_Show , false )--���
	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--�аO
	BeginPlot( OwnerID() , "Lua_Hao_GuildBall_LoopClose" , 0 )
	DisableQuest( TargetID() , true )
--	say(OwnerID() , "5" ) --���a
--	say(TargetID() , "6" ) --NPC
--	DebugMsg( 0 , 0 , "OwnerID:"..OwnerID() )
--	DebugMsg( 0 , 0 , "TargetID:"..TargetID )
--	Hide( TargetID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , TargetID() )  -- �����a�O�oNPC�� Reg
	Beginplot( OwnerID() , "Lua_Hao_GuildBall_Action" , 0 )
end

function Lua_Hao_GuildBall_LoopClose() -- �C1/100�������@����ܵ����A����C���}�l�������A�bNPC�����e�A���a�٥i�H�I��NPC�a�Ӫ����D�C

	local Step = 0

	while Step < 200 do
		for i = 1 , 10 , 1 do
			CloseSpeak( OwnerID() ) 
			Step = Step + 1
		--	DebugMsg( OwnerID() , 0 , "Step = "..Step )
		end
	--	DebugMsg( OwnerID() , 0 , "Step_End = "..Step )
		sleep(1)
	end
end

function Lua_Hao_GuildBall_Action()
-- �i�H�����@�Ĥ@��B�ĤG��B�ĤT��B�ĥ|��B�Ĥ���@(���i��)���ʳt�ץ[�ֵ��C
--	say(OwnerID() , "5" ) --���a
--	say(TargetID() , "6" ) --���a
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

--	DeBugMSG( OwnerID() , 0 , "Start Memory = "..GetMemory() )
	Lua_Hao_Get_Memory()

	local Time = 5

	Lua_Hao_GuildBall_Build_QBox( 113105 , 1 )

	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	CallPlot( QNPC , "Lua_Hao_GuildBall_Build_Door" , OwnerID() )
--	BeginPlot( QNPC , "Lua_Hao_GuildBall_Build_Door" , 0 )

	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
	WriteRoleValue( QBOX , EM_RoleValue_Register , OwnerID() ) --�����ê���O���a
	ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_7]" , C_SYSTEM ) -- ����N�b5���}�l�C

	AddBuff( OwnerID() , 506509 , 0 , -1 ) -- �շҪ̪�����
	AddBuff( OwnerID() , 506580 , 0 , -1 ) -- �w���A�����a���ઽ���e������
	sleep(15)

	LuaDan_HitShrew_CheckOK(5,5,0)--�˼Ƥ���i��

	if GuildBallStep == nil then	-- �i��
		GuildBallStep = {}
	end
	if GuildBallScore == nil then	-- ����
		GuildBallScore = {}
	end
	if GuildBallSoundID == nil then	-- ����
		GuildBallSoundID = {}
	end
	
	GuildBallStep[RoomID] = 0
	GuildBallScore[RoomID] = 0
--	GuildBallSoundID[RoomID] = 0

	SetSmallGameMenuType( OwnerID() , 13 , 1 ) --�}�Ҥ��� 
	SetSmallGameMenuStr( OwnerID() , 13 , 1 , "[SC_GUILD_BARRAGE_1][$SETVAR1="..GuildBallStep[RoomID].."]" ) -- �i��		-- INSTANCE_STATE_13
	SetSmallGameMenuStr( OwnerID() , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- ����	-- INSTANCE_SCORE_13
																	-- INSTANCE_TIPS_13
	for i = 1 , 5 , 1 do
	--	ScriptMessage( OwnerID(),  -1 , 1 , "[SC_GUILD_WARRIOR_3][$SETVAR1="..Time.."]" , C_SYSTEM ) --[$VAR1]
		CancelBuff( OwnerID() , 500675 ) -- �ޱ��ؼм��
		CancelBuff( OwnerID() , 500745 ) -- �ޱ��ؼи���
		CancelBuff( OwnerID() , 504888 ) -- �ޱ���^�ޯ����
		CancelBuff( OwnerID() , 501909 ) -- �ޱ��ؼ��H���ӳu
		CancelBuff( OwnerID() , 500535 ) -- �ޱ��t�F����
		if Time ==5 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	�Ъ`�N�A�b�v�޳��������շҤU�A�L�k�ϥέ즳¾�~�ޯ�C
			ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	�Ъ`�N�A�b�v�޳��������շҤU�A�L�k�ϥέ즳¾�~�ޯ�C
		elseif Time == 3 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_LOSTTREASURE_10]" , C_SYSTEM )	--	���A�n�B
		elseif Time == 1 then
			ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	����}�l !
			ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	����}�l !
		end
		sleep(10)
		Time = Time - 1
	end
	Setflag( OwnerID() , 542248 , 1 )
	CancelBuff( OwnerID() , 506580 )
	ClockOpen( OwnerID() , EM_ClockCheckValue_23 , 121 ,121 , 0 , "Lua_Hao_GuildBall_Del_NPC" , "Lua_Hao_GuildBall_Del_NPC" ) --�˼ƭp�ɾ�  ( �禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡" )
--	PlaySoundToPlayer( OwnerID() , "music\\Guild_Drill_Ground\\9\\ET09_04_JFL_kings_valor.mp3", false )
	BeginPlot( QBOX , "Lua_Hao_GuildBall_Action_2" , 0 )
end

function Lua_Hao_GuildBall_Action_2()
--	say(OwnerID() , "3" ) --���ê���
--	say(TargetID() , "4" ) --���a

	local Job = ReadRoleValue( TargetID() , EM_RoleValue_VOC )
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local LifeBuff , LifeBuff_Icon = 507593 , 507600

--	if Job == 0 then
		CancelBuff( TargetID() , LifeBuff )
		AddBuff( TargetID() , LifeBuff , 9 , -1 )
--	end

	while true do
		local QNPC = { }
		local Flag = 780373	-- �X��ID
		local Count = { }	-- ���󲣥ͼƶq
			Count[1] = 1	--3
			Count[2] = 3	--6	
			Count[3] = 6	--9
			Count[4] = 8	--12	
			Count[5] = 12	--15	
		local Array = { }
			Array[1] = { 1,2,3,4,5,6 }											-- �X�жq�@�Ĥ@�Ӷ� 6�Ӳ����I
			Array[2] = { 7,8,9,10,11,12,13,14,15,16,17,18 }									-- �X�жq�@�ĤG�Ӷ� 12�Ӳ����I
			Array[3] = { 19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36 }						-- �X�жq�@�ĤT�Ӷ� 18�Ӳ����I
			Array[4] = { 37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60 }				-- �X�жq�@�ĥ|�Ӷ� 24�Ӳ����I
			Array[5] = { 61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90 }		-- �X�жq�@�Ĥ��Ӷ� 30�Ӳ����I
		local DelArray = { }	-- �qArray��X�䤤�@�Ӽƭ�
		local Value = 1
		local SearchFlag	-- �j�M�X�Ц�m
		local Random

		for i = 1 , 5 , 1 do
			local HideBox = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )	--Ū�����a�� Reg+2 �ȡA�Y�ӭȬ�1�H�W�A�|�l�ܪ��a
			local YellowBox = ReadRoleValue( TargetID() , EM_RoleValue_Register+3 )	--Ū�����a�� Reg+3 �ȡA�O���IĲ���y�Უ�ͪ����ê���
			local RollNPC
		--	Say( TargetID() , "HideBox = "..HideBox )
			if HideBox == 1 then				-- �u�ͬ��y
				QNPC = { 115348 , 115348 , 115348 }	-- �����y(��)
			elseif HideBox == 2 then			-- �u���Ųy
				QNPC = { 116470 , 116470 , 116470 }	-- �o���y(��)
			else
				QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- �����y(��)�B�o���y(��)�B�S��y(��)�B�S��yEx(��)�B�ƥβy(��)
			end

			for j = 1 , Count[Value] , 1 do	-- 6 12 18 24 30
				Random = Rand(100)+1	-- �������y
			--	Random = 91			-- ���y
				SearchFlag = Rand( table.getn( Array[Value] ) )+1	-- 1 2 3 4 5
				DelArray[j] = Array[Value][SearchFlag]
				if Random <= 50 then				-- �����y
					RollNPC = QNPC[1]
				elseif Random > 50 and Random <= 90 then	-- �[���y
					RollNPC = QNPC[2]
				elseif Random > 90 and Random <= 100 then	-- �S��y
					RollNPC = QNPC[3]
				end

				local NPC = CreateObjByFlag( RollNPC , Flag , DelArray[j]  , 1 )	-- (���ͪ���ID , ���ͺX�lID , �X�l��mID , ���ͼƶq)
				local ID = ReadRoleValue( NPC , EM_RoleValue_OrgID )		-- �y��ID

				if HideBox ~= 0 then
					WriteRoleValue( NPC , EM_RoleValue_Register , 1 )		-- �N�Ҧ��g�J�y�骺 Reg1
					WriteRoleValue( NPC , EM_RoleValue_Register+1 , TargetID() )	-- �N���a�g�J�y�骺 Reg2
				end

				AddToPartition( NPC , RoomID )
				local DelDate = table.remove( Array[Value] , SearchFlag )
			end
			Value = Value + 1
			sleep(20)
			GuildBallStep[RoomID] = GuildBallStep[RoomID] + 1
			SetSmallGameMenuStr( TargetID() , 13 , 1 , "[SC_GUILD_BARRAGE_1][$SETVAR1="..GuildBallStep[RoomID].."]" ) -- �i��
		end
	end
end

function Lua_Hao_GuildBall_Score_Ball()	-- �o���y�B�����y�B�S��y�A���᪺ͫ����@���C
-- O.T �������ê���
	local Flag = 780373
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )			-- �y��ID
	local Type = ReadRoleValue( OwnerID() , EM_RoleValue_Register )		-- Type ��1�ɡA���ͪ��y��|�l�ܪ��a
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	local QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- �����y(��)�B�o���y(��)�B�S��y(��)�B�S��yEx(��)�B�ƥβy(��)
	Sleep(10)
	CallPlot( OwnerID() , "Lua_Hao_GuildBall_Ball_Move" , Type )	-- ���q���ʩΤޤO

	if ID == QNPC[1] then
		while true do
		--	for i = 1 , 10 , 1 do	-- 10/1000��I��@��
				SysCastSpellLv( OwnerID() , TargetID() , 496232 , 0 )
		--	end
			sleep(1)
		end
	elseif ID == QNPC[2] then
		while true do
		--	for i = 1 , 10 , 1 do
				SysCastSpellLv( OwnerID() , TargetID() , 496229 , 0 )
		--	end
			sleep(1)
		end
	elseif ID == QNPC[3] then
		while true do
			for i = 1 , 10 , 1 do
				SysCastSpellLv( OwnerID() , TargetID() , 496230 , 0 )
			end
			sleep(1)
		end
--	elseif ID == QNPC[4] then
--		SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_Blue_Ball" , 15 )
--	elseif ID == QNPC[5] then
--		SetPlot( OwnerID() , "range" , "Lua_Hao_GuildBall_Purple_Ball" , 15 )
	end
end

function Lua_Hao_GuildBall_Ball_Move( Type )
--	O ���y��
	local Flag = 780373
	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- ���y��O�o���a�O��
	local QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }		-- �����y(��)�B�o���y(��)�B�S��y(��)�B�S��yEx(��)�B�ƥβy(��)
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 ) 			-- �]�w���]�B
	CallPlot( OwnerID() , "Lua_Hao_GuildBall_Ball_DelObj" , 0 )

	if Type == 0 then
		while true do
			local Random = Rand(91)
			DW_MoveToFlag( OwnerID() , Flag , Random , 0 , Enable )
		--	function DW_MoveToFlag( ObjID , FlagObjID , FlagID,Range , Enable )
		--	���沾�ʪ���H�B�X�l����Ʈw�s���B�X�l�s���B�üƨM�w���ʨ�w�I���d��BEnable  0�A������movotoflag   1�A����movetoflag
		--	LuaFunc_MoveToFlag( OwnerID() , Flag , Random , 10 )	-- ����N���B�X�����B�X�l�s���B���\�d��
		end
	elseif Type == 1 then
		local Count = BuffCount( OwnerID() )				-- �d�ߨ��W���ޯ�
		for i = 0 , Count , 1 do
			local BuffID = BuffInfo( OwnerID() , i , EM_BuffInfoType_BuffID )
			if BuffID == 507596 then
				CancelBuff( OwnerID() , BuffID )
			end
		end
		if ID == QNPC[1] then
		--	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 ) --�]�w������
		--	AddBuff( OwnerID() , 507595 , 0 , -1 )
		--	AddBuff( OwnerID() , 507594 , 4 , -1 )
		elseif ID == QNPC[2] then
			AddBuff( OwnerID() , 507603 , 2 , -1 )
		--	AddBuff( OwnerID() , 502875 , 0 , -1 )
		end
		SetFollow( OwnerID() , Player )
	end
end

function Lua_Hao_GuildBall_Ball_DelObj(Key)	-- �R���@��

	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )

	for i = 1 , 10 , 1 do
		sleep(10)
		if i == 10 then
			Delobj( OwnerID() )
			if Key ~= 0 then
				WriteRoleValue( Player , EM_RoleValue_Register+2 , 0 ) --�NKey�ȼg�i���aReg+2
				WriteRoleValue( Player , EM_RoleValue_Register+3 , 0 ) --�NKey�ȼg�i���aReg+3	
			--	Say( Player , "Wait 10 Sec" )
			end
		end
	end
end

function Lua_Hao_GuildBall_Red_Ball()		-- �IĲ�����y(��)
--	SetPlot( OwnerID() , "range" , "" , 15 )
--	PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\red_ball.mp3", false )
	AddBuff( TargetID() , 507599 , 0 , 1 )		-- ���y�S��

	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )	-- Ū������ID
	local BuffLv , NewBuffLv					-- �ޯ൥��
	local Count = BuffCount( TargetID() )				-- �d�ߨ��W���ޯ�
	local QNPC = 115348						-- �����y(��)
--	local Reverse = CheckBuff( TargetID() , 507603 )		-- ����
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	DelObj( OwnerID() )

	for i = 0 , Count , 1 do
		local BuffID = BuffInfo( TargetID() , i , EM_BuffInfoType_BuffID )
		if BuffID == 507593 then	-- 507593 �C����O
			BuffLv = BuffInfo( TargetID() , i , EM_BuffInfoType_Power )
			if ID == QNPC then
			--	if Reverse == true then
					NewBuffLv = BuffLv - 1
					CancelBuff( TargetID() , BuffID )			-- �������a���W����O
					AddBuff( TargetID() , BuffID , NewBuffLv , -1 )	-- �����a���W����O-1
					if NewBuffLv == -1 then	-- ����O��0�ɡA�h����...
						CancelBuff( TargetID() , BuffID )
					--	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_DDR_STRING01_FINISH] " , C_SYSTEM ) -- �������շҵ����F�A�̷���o���n���N�ର�W�[�A���a�A�ȡC 
					--	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_DDR_STRING01_FINISH] " , C_SYSTEM )
						BeginPlot( TargetID() , "Lua_Hao_GuildBall_Del_NPC" , 0 )
						return false
					elseif NewBuffLv <= 2 then
						CancelBuff( TargetID() , 507600 )
						AddBuff( TargetID() , 507599 , 0 , -1 )
						ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_8] " , C_SYSTEM ) -- �`�N�I�ͩR�I�Ƥ���
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_GUILD_BARRAGE_8] " , C_SYSTEM )
					--	Lua_Hao_GuildBall_MSG_TIPS( TargetID() , 5 , 5 , 2 , 1 )
					end
					return false
			--	end
			--	break
			end
		end
	end
end

function Lua_Hao_GuildBall_Blue_Ball()		-- �IĲ�o���y(��)
--	SetPlot( OwnerID() , "range" , "" , 15 )
--	PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\blue_ball.mp3", false )
--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\blue_ball.mp3", false )
	AddBuff( TargetID() , 507596 , 0 , 1 )				-- �Ųy�S��
	AddBuff( TargetID() , 507603 , 0 , 5 )				-- �Ųy���y

	local ID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local QNPC = 116470							-- �o���y(��)
	local Bonus = Lua_Hao_Return_Buff_Lv( TargetID() , 507603 )		-- �Ųy���y	�̷Ӱ��|Buff�[��
--	local Reverse = CheckBuff( TargetID() ,  507603 )			-- ����
	local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
--	local Bonus = 1	-- ���̷Ӱ��|Buff�[��
	DelObj( OwnerID() )

	if ID == QNPC then	--	�o���y
		Bonus = Bonus+1
		GuildBallScore[RoomID] = GuildBallScore[RoomID] + Bonus
		SetSmallGameMenuStr( TargetID() , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- ����(��)
		return false
	end
end

function Lua_Hao_GuildBall_Yellow_Ball()	-- �IĲ�S��y(��)

	AddBuff( TargetID() , 507601 , 0 , 1 )			-- ���y�S��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--	local Random , Type = Rand(1)+7 , 0	-- 0 �����`�Ҧ��B1�����y�l�v�Ҧ��B2���Ųy�l�v�Ҧ�
	local Random , Type = Rand(10)+1 , 0	-- 0 �����`�Ҧ��B1�����y�l�v�Ҧ��B2���Ųy�l�v�Ҧ�
	local Bonus = 507595							-- ���y���y
--	local SoundID = 0
	Lua_Hao_GuildBall_Build_QBox( 113105 , 2 )				-- ���y��O��IĲ���y��A���ͪ����ê���
	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 )	-- ���y��O�_���ê���
	WriteRoleValue( QBOX , EM_RoleValue_Register+2 , TargetID() )	-- ����eĲ�I�����ê���O���a
	Delobj( OwnerID())
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		
	if CheckBuff( TargetID() , Bonus ) == false then
		if Random <= 6 then				-- 6/10
			Type = 0
		elseif Random >= 7 and Random <= 8 then	-- 2/10
			Type = 1
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_9]" , C_SYSTEM ) -- ĵ�i�I����ĵ��
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_GUILD_BARRAGE_9]" , C_SYSTEM ) -- ĵ�i�I����ĵ��
		--	GuildBallSoundID[RoomID] = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3", false )
		--	SoundID = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3", false )
		--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\bad_yallow_ball.mp3", false )
		--	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		--		RunningMsgEx( OwnerID() , 0 , 0 , "[SC_GUILD_BARRAGE_9]" )  
		--	end
		else						-- 2/10
			Type = 2
			ScriptMessage( TargetID() , TargetID() , 0 , "[SC_GUILD_BARRAGE_10]" , C_SYSTEM ) -- �o���ɶ�
			ScriptMessage( TargetID() , TargetID() , 2 , "[SC_GUILD_BARRAGE_10]" , C_SYSTEM ) -- �o���ɶ�
		--	GuildBallSoundID[RoomID] = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\good_yallow_ball.mp3", false )
		--	SoundID = PlaySoundToPlayer( TargetID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\good_yallow_ball.mp3", false )
		--	PlaySoundToPlayer( TargetID() , "sound\\guildBall\\good_yallow_ball.mp3", false )
		--	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		--		RunningMsgEx( OwnerID() , 0 , 1 , "[SC_GUILD_BARRAGE_10]" )  
		--	end
		end
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Type ) --�NKey�ȼg�i���aReg+2
	--	WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , SoundID ) --�N�ثe���񭵮ļg�i���aReg+4
		CallPlot( QBOX , "Lua_Hao_GuildBall_Ball_DelObj" , 1 )		-- ����R���@��
	else
		CallPlot( QBOX , "Lua_Hao_GuildBall_Ball_DelObj" , 0 )		-- ����R���@��
	end
	BeginPlot( QBOX , "Lua_Hao_GuildBall_Yellow_Ball_2" , 0 )	-- ������y�@��
end

function Lua_Hao_GuildBall_Yellow_Ball_2()	-- �S��y(��)

--	local Ball = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- �����ê���O�_�y��
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	-- �����ê���O�_���a
	local ID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
--	local ID = ReadRoleValue( Ball , EM_RoleValue_OrgID )
	local QNPC = 116469							-- �S��y(��)
--	local Reverse = CheckBuff( Player , 507603 )				-- ����
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Bonus = 507595							-- �B�~���y

--	Say( Player , "ID = "..ID )	-- �y��
--	Say( Player , "Hello" )		-- ���a

	if CheckBuff( Player , Bonus ) == false then
		AddBuff( Player , Bonus , 0 , 10 )
		if ID == QNPC then						-- �S��y�ĪG1 �y�w�t
			local Random = Rand(90)+1
			if Random <= 45 then	-- �w�t
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 507594 )
				AddBuff( Player , 507594 , 4 , 10 )				-- ���a���W���w�t
				ScriptMessage( Player , Player , 1 , "[507594]" , C_SYSTEM )
				return false
			elseif Random > 45 and Random <= 90 then		-- �S��y�ĪG2 �y�[�t
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 507597 )	-- �[�t
				ScriptMessage( Player , Player , 1 , "[507597]" , C_SYSTEM )
				return false
			elseif Random > 90 and Random <= 100 then 		-- �S��y�ĪG3 �M�Žd�򤺶�y
				CallPlot( OwnerID() , "Lua_Hao_GuildBall_Skill_Basic" , 999999 )
				SysCastSpellLv( Player , TargetID() , 492456 , 0 )
				ScriptMessage( Player , Player , 1 , "Clear" , C_SYSTEM )
				return false
			end
		end
	else
		GuildBallScore[RoomID] = GuildBallScore[RoomID] + 10
		SetSmallGameMenuStr( Player , 13 , 2 , "[SC_GUILD_BARRAGE_2][$SETVAR1="..GuildBallScore[RoomID].."]"  ) -- ����(��)
		return false
	end
end

function Lua_Hao_GuildBall_Skill_Basic(Value) -- �R���B�[�t�Ӱϰ쪺�Ҧ�����

	local QNPC =  { }
	local Quantity , Sec = 0 , 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 )	-- �����ê���Q�_���a
	local Buff = { 507594 , 507597 }

	if Value == 999999 then
		QNPC = { 115348 }						-- �����y(��)�B�S��y(��)
	else
		QNPC = { 115348 , 116470 , 116469 , 116468 , 116471 }	-- �����y(��)�B�o���y(��)�B�S��y(��)�B�S��yEx(��)�B�ƥβy(��)
	end

	while Sec < 101 do
		for i=1 , table.getn( QNPC ) , 1 do
			local Count = SetSearchAllNPC( RoomID )
			for j = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				if Name == QNPC[i] then  --�Y���}�C������
					Quantity = Quantity + 1
					if Value == 999999 then
						DelObj(ID)			-- �M�����y
					elseif Value == Buff[1] then
						WriteRoleValue( ID , EM_RoleValue_IsWalk , 1 ) --�]�w������
					else
						AddBuff( ID , Value , 0 , 3 )
					end
				end
			end
		--	DebugMsg( 0 , RoomID ,"Total '"..NPC[i].."' Remove is "..Quantity )
		end
		if Value == 999999 then
			break
		end
		Sleep(1)
		Sec = Sec + 1
	end
end

function Lua_Hao_GuildBall_Del_NPC() 	--����R�����y�A�����C���ɰ��檺�@��
--	Say( OwnerID() ,"THE END" ) -- ���a
--	Say( TargetID() ,"THE END" ) -- NPC

	Lua_Hao_Get_Memory()

	ScriptMessage( OwnerID(),  -1, 1, "[SC_DDR_STRING01_FINISH]" , C_SYSTEM )-- �������շҵ����F�A�̷���o���n���N�ର�W�[�A���a�A�ȡC
	ScriptMessage( OwnerID(),  -1, 0, "[SC_DDR_STRING01_FINISH]" , C_SYSTEM )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local NPC = { 115348 , 116468 , 116469 , 116470 , 116471 , 113621 }
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register )		-- �����a�Q�_ Reg ������NPC
	local QBOX = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )		-- �����a�Q�_ Reg+1 �����ê���
--	local SoundID = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 )	-- �����a�Q�_�ثe���񪺭���
	local Buff = { 506509 , 506580 , 507593 , 507594 , 507595 , 507596 , 507597 , 507598 , 507599 , 507600 , 507601 , 507603 }	-- ����Buff

--	StopSound( OwnerID() , GuildBallSoundID[RoomID] )	--�����ثe���񪺭���
	SetModeEx( QNPC , EM_SetModeType_Mark, true )	--�аO
	SetModeEx( QNPC , EM_SetModeType_Show , true )	--���
	DisableQuest( QNPC , false )
--	Show( QNPC , RoomID )
	WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 	-- �� NPC ���D���a�w�g���L���C�� �ȮɨS��

	local Step = GuildBallStep[RoomID]
	local Score = GuildBallScore[RoomID]

	for i = 1 , table.getn(Buff) , 1 do
		CancelBuff( OwnerID() , Buff[i] )
	end

	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--���嵲��
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_1][$SETVAR1="..Step.."]" , C_SYSTEM )	--<CY>���d�G</CY>[$VAR1] 
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--<CY>���ơG</CY>[$VAR1]
--------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 13 , 2 )		-- ��������
	ClockClose( OwnerID() ) 				-- �����p�ƾ�
--------------------------------------------------
	DelObj( QBOX )

	if  Count ~= 0 then
		for i=1 , table.getn( NPC ) , 1 do
			local Count = SetSearchAllNPC( RoomID )
			local Quantity = 0
			for j = 1 , Count , 1 do
				local ID = GetSearchResult() -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				if Name == NPC[i] then  --�Y���}�C������
					DelObj(ID) 
					Quantity = Quantity + 1
				end
			end
			if Quantity ~= 0 then
			DebugMsg( 0 , RoomID ,"Total '"..NPC[i].."' Remove is "..Quantity )
			end
		end
	end

	FN_GuildGame_Honor( OwnerID(), Score )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , Score )--�����a�A��
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��

	local OldScore = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20 ) -- �O���̰�����
	if OldScore == 0 then
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )	
	elseif OldScore >= Score then

	elseif OldScore < Score then
	--	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_BARRAGE_13][$SETVAR1="..Score.."]" , C_SYSTEM )
		ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_BARRAGE_13][$SETVAR1="..Score.."]" , C_SYSTEM )
		--���ߧA���}�F���e�O�������ưO���A�{�b���O����<CY>[$VAR1]</CY>�A�o�����շҨ즹����A���ݧA�U������{�C
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )
	end

	GuildBallStep[RoomID] = 0
	GuildBallScore[RoomID] = 0

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	for i = 0 , 9 , 1 do
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+i , 0 )
	end
end

function Lua_Hao_GuildBall_Build_QBox( ObjID , Choise )	-- �ت���B�åB�����a(�y��)�O��Ӫ���

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local QBOX = CreateObj( ObjID , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�b���a(�y��)�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( QBOX , EM_SetModeType_Strikback , false )--����
	SetModeEx( QBOX , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( QBOX , EM_SetModeType_Obstruct , false )--����
	SetModeEx( QBOX , EM_SetModeType_Mark , false )--�аO
	SetModeEx( QBOX , EM_SetModeType_Move , false )--����
	SetModeEx( QBOX , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( QBOX , EM_SetModeType_HideName , false )--�W��
	SetModeEx( QBOX , EM_SetModeType_ShowRoleHead , false )--�Y����
	SetModeEx( QBOX , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( QBOX , EM_SetModeType_Drag , false )--���O
	SetModeEx( QBOX , EM_SetModeType_Show , true )--���

	if Choise == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , QBOX ) --�����a�O��_�l���ê���
	elseif Choise == 2 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , QBOX ) --���y��O��IĲ���y��A���ͪ����ê���
	end
	AddToPartition( QBOX , RoomID ) -- �إߪ���
	Hide(QBOX)
end

function Lua_Hao_GuildBall_Build_Box()	-- ���Ͷꫬ����

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 113105 -- ���ê���
	local X = { 1 , 6 , 12 , 18 , 24 , 30 }-- �X�䫬
	local dis = { 0 , 30 , 60 , 90 , 120 , 150 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])),BaseY,BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])),BaseDir, 1 )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i] , RoomID )
	end
end

function Lua_Hao_GuildBall_Recall_SS()	-- �i���B�a�A�I��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Step , Score = GuildBallStep[RoomID] , GuildBallScore[RoomID]

	Say( OwnerID() , "Step = "..Step )
	Say( OwnerID() , "Score = "..Score )
end

function Lua_Hao_GuildBall_MSG_TIPS( ObjID , Time , NowTime , type , Select )

	local RoomID = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == true then
				if Select == 1 then
					StartClientCountDown ( ID , Time , NowTime , 0 , 0 , type , "[SC_GUILD_BARRAGE_8]" )	-- �p�ߡA�ͩR�I�Ƥ���
				end
			end
		end	
	end
end

function Lua_Hao_GuildBall_Build_Door( Player )	-- ���ͪ��ת�

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	Lua_Hao_NPCofAll_Clear( 113621 , 500 ) 	-- �M��

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 113621 -- ��
	local X = { 36 }-- �X�䫬
	local dis = { 160 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
--	PlaySoundToPlayer( Player , "sound\\guildBall\\metal_door.mp3", false )
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , true )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , false )--�аO
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , false )--�W��
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , false )--�Y����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--���
		Sleep(2)
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
	--	MoveToflagEnabled( MonsterGroup[i] , false )
		AddToPartition( MonsterGroup[i] , RoomID )
		if i == 5 then
		--	PlaySoundToPlayer( Player , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\metal_door.mp3", false )
		end
	end
end

function Lua_Hao_GuildBall_Reset_Key( Score ) -- ���m

	if Score == nil then
		Setflag( OwnerID() , 542248 , 0 )
		Score = "Reset"
	elseif Score >= 0 then
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem20  , Score )
	else
		Score = "Entry error"
	end
	DeBugMSG( OwnerID() , 0 , Score )
end

function Lua_Hao_Test_Clear_Buff()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )

	AddBuff( OwnerID() , 503693 , 1 , -1 ) --�ǰe�S��
	sleep(10)
	ChangeZone( OwnerID() , 354 , RoomID , 4110.1 , 16.3 , 3468.4 , 269.7 )
end

function Lua_Hao_GuildBall_Test_PlaySound()

--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound/sound_new/skill/Music_Festival/scale/5.mp3" , false )

--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\metal_door.mp3", false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3" , false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Guild_Drill_Ground\\9\\bad_yallow_ball.mp3" , false )
--	local SoundID = PlaySoundToPlayer( OwnerID() , "sound\\guildBall\\bad_yallow_ball.mp3" , false )
	--PlaySoundToPlayer( OwnerID() , "music\\Guild_Drill_Ground\\9\\ET09_04_JFL_kings_valor.mp3", false )
	Sleep(50)
	StopSound( OwnerID() , SoundID )
end