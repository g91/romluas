
--120086 �[�Z�g��
function Lua_na_11xmas_muven_0() --120086�[�Z�g�����
	local Player = OwnerID()
	local Muven = TargetID()
	local MuvenPID = ReadRoleValue ( Muven, EM_RoleValue_PID )
	AdjustFaceDir( Muven , Player , 0 ) -- ���V
	if MuvenPID == 1 then
		SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN") ) --�ڭ̬O��O�J��s�Ϊ��ѶH�[���H���A�N�b���~�J�V���ɸ`�A�ڭ̪`�N��@�ǲӷL�����H�A�쥻�ڭ̤��H���N�A���O���~���V�u����ūo�Q�����M�`�K
		AddSpeakOption( Player , Muven , GetString("SC_2011XMAS_MUVEN_YES"), "Lua_na_11xmas_muven_YES", 0 ) -- �ڷǳƦn�F�I
		AddSpeakOption( Player , Muven , GetString("SC_2011XMAS_MUVEN_NO"), "Lua_na_11xmas_muven_NO", 0 ) --�A���ڦҼ{�@�U�K
	else
		SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN_1") ) --���§A�����ߡA[$playername]�I�O��ߡA�ڨä��O�J���άO���x�b�o�����������I...
	end
		
end

function Lua_na_11xmas_muven_YES() -- ���������A�ǰe�쬡�ʰϡI
	local Owner = OwnerID()
	local Muven = TargetID()
	local MuvenPID = ReadRoleValue( Muven , EM_RoleValue_PID ) 
	CloseSpeak( Owner )
	AdjustFaceDir( Muven , Owner  , 0 ) -- ���V
	if MuvenPID == 1 then
		CastSpell( Muven , Owner   , 498386 ) --�ǰe�ܬ��ʰ�
	else
		SetSpeakDetail( Owner , "[SC_2011XMAS_MUVEN_YES1]" )  --�B���y�w�g�����A�ثe�L�k�i�J�C
	end
end

function Lua_na_11xmas_muven_NO()
	local Player = OwnerID()	
	SetSpeakDetail( Player, GetString("SC_2011XMAS_MUVEN_NO1") ) --�p�G�A���@�N�ڤ]�L�k�j�j�A�A�٬O�Ʊ�A����V���Ҽ{�ݬ�...
end


--����BUFF

function Lua_na_11xmas_insert_PlayerList()
	local Owner = OwnerID()
	local Target = TargetID()
	if  CheckBuff( Owner , 621731 ) == false then --  �p�G���a���W�S������BUFF
	--	local DBID = ReadRoleValue( Owner , EM_RoleValue_DBID  )
	--	table.insert ( PlayerList , DBID)
		table.insert ( PlayerList , Owner )
		WriteRoleValue( Owner , EM_RoleValue_Register2 , 0 )
		ScriptMessage( Owner ,  Owner, 1, "[SC_2011XMAS_01]" , C_SYSTEM )  --�Ь@�Ϥ麥�H�N���x�V�`�I
		ScriptMessage( Owner ,  Owner, 0, "[SC_2011XMAS_01]" , C_SYSTEM )  --�Ь@�Ϥ麥�H�N���x�V�`�I
		sleep(10)
		Addbuff( Owner, 621720 , 2, 14400) --�P�_���u�ǰe��BUFF
		AddBuff( Owner , 621731 , 1, -1) --�U��
		sleep(10)
		local score = ReadRoleValue ( Owner , EM_RoleValue_Register2 )
		local X = table.getn(PlayerList)
	--	Say( Owner , "score= ".. score )
	--	Say( Owner , "player = " .. X )
	end
end


--120085 �������
function Lua_na_tarlencia()--������Ȫ���l�@��
	LuaN_miyon_action02()
	local Owner = OwnerID()
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 ) --�N������Ȩ��W��Register�ȼg��0�A��ܬ��ʩ|������
--	local Reg1 = ReadRoleValue( Owner , EM_RoleValue_Register1)
--	say( Owner , Reg1 ) --�ˬdNPC���W����
end
	



function Lua_na_11xmas_npc() --������ȹ�ܼ@��
--Owner ���a
--Target �������
	local Player = OwnerID()
	local Target = TargetID()
	local check = ReadRoleValue( Target , EM_RoleValue_Register1 )
	-- ����ﶵ�P�_��KEY ---
	local winkeyid  = 546141   -- ��Ĺboss
	local checkwinkey = Checkflag(Player, winkeyid )

	AdjustFaceDir( Target , Player , 0 ) -- ���V
	if check == 0 then  --�p�G���ʩ|������
		SetSpeakDetail( Player , "[SC_2011XMAS_02]" ) --[$playername]�A�A�n�I�ڬO�P�K�͹��ЩZ����ȡA�S�a�e�Ө�U�x�V�`���H����_...
		AddSpeakOption( Player , Target, "[SC_2011XMAS_03]" , "Lua_na_11xmas_saintbegin", 0 ) --�����ڦ����t�K�Ϫ�
		AddSpeakOption( Player , Target ,"[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --�ڷQ���}�o�̡C

	elseif check == 1 then  --���W���Ϫ̡A���ÿﶵ
		SetSpeakDetail( Player , "[SC_2011XMAS_02]"  ) -- --[$playername]�A�A�n�I�ڬO�P�K�͹��ЩZ����ȡA�S�a�e�Ө�U�x�V�`���H����_...
		AddSpeakOption( Player , Target , "[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --�ڷQ���}�o�̡C

	else  --���ʤw�g����
		SetSpeakDetail( Player , "[SC_2011XMAS_07]"  ) --�P�§A�̪���U�A�ڷQ�o�����M���w�g�Ѱ��F�I���O�ڦ��w�P�A�ɭ����H�٬O�|�A�ץX�{...
		if checkwinkey == true then  -- ����Ĺboss 
			AddSpeakOption( Player ,Target , "[SC_FIREDAY_EV1_21]"  , "lua_mika_xmas2011_reward02" , 0)   --  reward
		end
		AddSpeakOption( Player , Target , "[SC_2011XMAS_08]" , "Lua_na_11xmas_leave", 0 ) --�ڷQ���}�o�̡C
	end


	sleep(10)
end


function Lua_na_11xmas_saintbegin() --�����t�K
--Owner ���a
--Target �������
	local Owner = OwnerID()
	local Target = TargetID()
	local check = ReadRoleValue( Target , EM_RoleValue_Register1 )
	if check == 0  then --�ˬd�O�_�w�g���H�����t�K�Ϫ̤F
		if CheckBuff( Owner , 621727 ) == true then --���a���W���ݯd���t�K
			ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_11]", 0 )  --���W�٦��ݯd���t�K�A�ȮɵL�k�����t�K�Ϫ̡C
		else
			CancelBuff( Owner , 621897 ) --�R���ؼШ��W���H�N��
			AddBuff ( Owner , 621729, 0 , 60 ) --�����t�K���@��BUFF
			WriteRoleValue( Target , EM_RoleValue_Register1 , 1 )-- �N������Ȩ��W��reg1�ȼg��1
			local Reg1 = ReadRoleValue(Target , EM_RoleValue_Register1 )
		--	say( Target , Reg1 ) --�ˬdNPC���W����
		end
	elseif check == 1 then
		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_06]", 0 )  --�w�g���H�����t�K�Ϫ̤F
	end
	CloseSpeak( Owner )
end

--function Lua_na_11xmas_firestart()
--	local Owner = OwnerID()
--	if CheckBuff ( Owner , 621731 ) == true then --�p�G�w���U��BUFF 
--		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_13]", 0 )  --�A�w�g�֦����ޯ�F�I
--	elseif CheckBuff( Owner, 621729 ) == true then --�p�G�O�t�K�Ϫ�
--		ScriptMessage(Owner , Owner , 1 ,  "[SC_2011XMAS_14]", 0 )  --�A�ثe�O�t�K�Ϫ̡A�L�k��o���ޯ�C
--	else
--		table.insert ( PlayerList , Owner ) --�N���~���u�A���s�^����W�����a�A���g�JTABLE��
--		AddBuff( Owner , 621731 , 1, -1) --�U��
--	end
--end



function Lua_na_11xmas_addDoor()	-- ���ͪ��ת�
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID) --�T�{���A�������y
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local MonsterID = 120087 -- ��
	local X = { 40 }-- �X�䫬
	local dis = { 700 } -- �Z����ߪ��Z��
	local Count = 1

	for i = 1 , table.getn(X) do
		for j = 1 , X[i] , 1 do
			MonsterGroup[Count] = CreateObj( MonsterID , BaseX-dis[i]*math.cos(math.pi*2*(j/X[i])) , BaseY , BaseZ+dis[i]*math.sin(math.pi*2*(j/X[i])) , BaseDir , 1 )
			WriteRoleValue( MonsterGroup[Count] , EM_RoleValue_PID , Count )
			Count = Count + 1
		end
	end
	for i = 1 , table.getn(MonsterGroup) do
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Strikback , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Obstruct , true )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Mark , false )--�аO
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Move , false )--����
		SetModeEx( MonsterGroup[i], EM_SetModeType_Gravity, true )--���O
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Searchenemy , false )--����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_HideName , false )--�W��
		SetModeEx( MonsterGroup[i] , EM_SetModeType_ShowRoleHead , false )--�Y����
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Drag , false )--���O
		SetModeEx( MonsterGroup[i] , EM_SetModeType_Show , true )--���
		Sleep(2)
		AdjustFaceDir( MonsterGroup[i] , OwnerID() , 0 ) 
		AddToPartition( MonsterGroup[i] , RoomID )
	end
end



function Lua_na_11xmas_boss_dead()	--�����᪺�@��
	local winkeyid  = 546141
	BeginPlot( SaintFire , "Lua_na_11xmas_boss_dead1", 0 )
	WriteRoleValue( Tarlencia , EM_RoleValue_Register1 , 2 ) 
	TarlenReg1 = ReadRoleValue( Tarlencia , EM_RoleValue_Register1 )
	ScriptMessage(Tarlencia , -1 , 1 ,  "[SC_2011XMAS_REWARD]", C_SYSTEM )  --�O�o�P������Ȼ�����y��I
	for i = 1 , table.getn(PlayerList), 1 do
		if CheckID( PlayerList[i]) == true then
			SetFlag( PlayerList[i] , winkeyid , 1)
		else
			DebugMsg( 0, 0 ,"ID = "..PlayerList[i]);
		end
	end
	return true
end

function Lua_na_11xmas_leave()
	local Owner = OwnerID()
	local Target = TargetID()
	CloseSpeak( Owner )

	if CheckBuff( Owner , 621720 ) == false then
		SysCastSpellLv( Owner, Owner ,498968 , 1) 
	--	say( Owner , "TRANS" )
	else
		CancelBuff( Owner , 621720)	
	end
end

function Lua_na_11xmas_boss_dead1()
	BeginPlot( SaintFire, "Lua_na_11xmas_delallbuff", 0 )
	sleep(100)
	BeginPlot( SaintFire, "Lua_na_11xmas_del" ,0 )
end



function Lua_na_11xmas_transZone()
	local Owner = OwnerID()
	local ZoneID = ReadRoleValue( Owner , EM_RoleValue_ZoneID )
	ChangeZone(Owner , 5 , -1 ,  -15292 , 879 , -1849 , 305)
end