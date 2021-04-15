--==============================
--	����s��ܪ��@�� �]�t�}�Կﶵ
--==============================
function Z26Instance_Boss3_TalkMain()
	local NPC = TargetID()
	local Player = OwnerID()
	
--	if ReadRoleValue( NPC, EM_RoleValue_Register+2 ) == 0 then
--		SetSpeakDetail(Player,"Fight?")
--		AddSpeakOption(Player,NPC,"YES","Z26Instance_Boss3_Talk_Yes",0)
--		AddSpeakOption(Player,NPC,"NO","Z26Instance_Boss3_Talk_No",0)
--	elseif ReadRoleValue( NPC, EM_RoleValue_Register+2 ) == 1 then
		SetSpeakDetail( Player, "[SC_BELLATIA_DUOLICATION_PANGKORRAMS_15]")
		AddSpeakOption( Player, NPC, "[SC_BELLATIA_DUOLICATION_PANGKORRAMS_16]", "Z26Instance_Boss3_Talk_teleport", 0 )
--	end
end

--function Z26Instance_Boss3_Talk_Yes()			--�ǳƦn�}��
--	local NPC = TargetID()
--	local Player = OwnerID()
--	local RoomID = ReadRoleValue( NPC, EM_RoleValue_RoomID )
--
--	Lua_BellatiaDuplication_change_status(RoomID, "boss")				--�q���ƥ��i�פ���
--	WriteRoleValue( NPC, EM_RoleValue_Register+1, 1 )
--	CloseSpeak( Player )
--end

--function Z26Instance_Boss3_Talk_No()			--�٨S�ǳƦn
--	CloseSpeak( Player )
--	return
--end

function Z26Instance_Boss3_Talk_teleport()
	local Player = OwnerID()
	CancelBuff( Player, 624292 )
	local x,y,z,dir	=DW_Location(781282, 5)
	x,y,z,dir	=DW_NewLocation(0, 50, x,y,z,dir);
	SetPos(Player, x,y,z,dir-180);
end

function Z26Instance_Boss3_RangePlot()
	local Player = OwnerID()
	local RangePloter = TargetID()
	local Dark=ReadRoleValue( RangePloter, EM_RoleValue_Register+2);
	local RoomID = ReadRoleValue( RangePloter, EM_RoleValue_RoomID )
	DebugMsg(0,0,"Boss3_RangePlot")
	if(ReadRoleValue(Player,EM_RoleValue_IsDead)==0)and(ReadRoleValue(Player,EM_RoleValue_VOC)~=0)and(CheckRelation(Dark,Player,EM_CheckRelationType_Attackable)==true)then--����;�DGM;�i�Q���s��
		WriteRoleValue( RangePloter, EM_RoleValue_Register+1, 1 )
		Lua_BellatiaDuplication_change_status(RoomID, "boss")			--�q���ƥ��i�פ���
		SetPlot( RangePloter, "range", "", 0 )					--�����d��@��
	end
end

--==============================
--	ControlCenter
--	EM_RoleValue_Register+1	�����԰����A	0��ܨS�}��	1��ܾ԰���	2��ܪ��a����	3��ܪ��a���
--	EM_RoleValue_Register+2	�������sID
--	EM_RoleValue_Register+3	�����t�sID
--	EM_RoleValue_Register+4	�������
--	EM_RoleValue_Register+5	�����e��

--	�X�� 780765
--	1	���s��m
--	2	���s��m
--	3	�d��@��Ĳ�o��
--	4	�e��
--	5	�԰��������_�c����m

--	���s
--	EM_RoleValue_Register+1	����������

--	LightAvatar���s�H��
--	EM_RoleValue_Register+1	�������a��L��ܻ��w�g�ǳƦn�A���������P�_�n�}�ԤF
--	EM_RoleValue_Register+2	�P�_���a��L��ܮɡA�O�_�w�g���ѫ��s

--	RangePloter�d��@�����
--	EM_RoleValue_Register+1	�����쪱�a�a��g��1�A���������P�_�n�}�ԤF
--==============================

function Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
	local org={hard=102567;normal=107985;easy=108048;}; 
	local LightDragon = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 1, 1 )
	local org={hard=102992;normal=107986;easy=108049;};
	local DarkDragon = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 2, 1 )
	SetModeEx( LightDragon, EM_SetModeType_Mark, false )		--�������s���аO�A�H�K�ר쪱�aTarget���s
	SetModeEx( DarkDragon, EM_SetModeType_Mark, false )		--�������s���аO�A���쪱�a�i�H����s�y���ˮ`���ɭԦA���}
	AddToPartition( LightDragon, RoomID )
	AddToPartition( DarkDragon, RoomID )
	SetAttack( LightDragon , DarkDragon)
	SetAttack( DarkDragon , LightDragon)
	FN_SuperTaunt( DarkDragon, LightDragon )
	FN_SuperTaunt( LightDragon, DarkDragon )
	--
	local RangePloter = CreateObjByFlag( 115634, 780765, 3, 1 )
	AddToPartition( RangePloter, RoomID )
	SetModeEx( RangePloter, EM_SetModeType_Show, false )
	SetModeEx( RangePloter, EM_SetModeType_Mark, false )
	--
	WriteRoleValue( RangePloter, EM_RoleValue_Register+1, 0 )
	WriteRoleValue( RangePloter, EM_RoleValue_Register+2, DarkDragon )
	SetPlot( RangePloter, "range", "Z26Instance_Boss3_RangePlot", 300 )
	--
	return LightDragon, DarkDragon, RangePloter
end

function Z26Instance_Boss3_ControlCenter()
	local ControlCenter = OwnerID()
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	Hide(ControlCenter)
	--
	local LightAvatar = CreateObjByFlag( 121806, 780765, 1, 1 )
	local DarkAvatar = CreateObjByFlag( 102835, 780765, 2, 1 )
	AddToPartition( LightAvatar, RoomID )
	AddToPartition( DarkAvatar, RoomID )
	Hide( LightAvatar )
	Hide( DarkAvatar )
	--��l��
	local LightDragon, DarkDragon, RangePloter = Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
	local DarkMaxHp = ReadRoleValue( DarkDragon, EM_RoleValue_MaxHP )
	local LightMaxHp = ReadRoleValue( LightDragon, EM_RoleValue_MaxHP )
	
--	while Lua_BellatiaDuplication_check_status( RoomID, "boss" ) do
	while true do
		local FightCheck = ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 )
		--
		if CheckID( RangePloter ) == true and ReadRoleValue( RangePloter, EM_RoleValue_Register+1 ) == 1 then						--��ܪ��a�a��A�}�Ҿ԰�
			DelObj( RangePloter )
			CallPlot( ControlCenter, "Z26Instance_Boss3_Main", LightDragon, DarkDragon )
			WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 4 )
		end
		if FightCheck == 0 then						--�԰��SĲ�o�A���s�~�򰲥�
			WriteRoleValue( LightDragon, EM_RoleValue_HP, LightMaxHp )
			WriteRoleValue( DarkDragon, EM_RoleValue_HP, DarkMaxHp )		
		elseif FightCheck == 1 then						--��ܪ��a�n�԰�
			
		elseif FightCheck == 2 then						--��ܪ��a����
			Lua_BellatiaDuplication_change_status(RoomID, "fail")		--�q���ƥ��i�פ���
			Lua_BellatiaDuplication_fail()					--���s���a�@���i�ר��x�s�I
--			Sleep(600)							--60���A�ץX�{
			LightDragon, DarkDragon, RangePloter = Z26Instance_Boss3_initialize( ControlCenter, RangePloter, RoomID )
			WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 0 )
		elseif FightCheck == 3 then						--��ܪ��a��� Boss�Q����
			local FrontDoor = ReadRoleValue( ControlCenter, EM_RoleValue_Register+5 )
			DelObj( FrontDoor )
			--�гy�_�c
			local org={hard=107822;normal=107991;easy=108054;}
			local Loot = CreateObjByFlag( org[Global_BellatiaDuplication.type], 780765, 5, 1 )
			SetModeEx( Loot, EM_SetModeType_ShowRoleHead, false )
			SetModeEx( Loot, EM_SetModeType_Move, false )
			AddToPartition( Loot, RoomID )
			--�гy�~�����H�����s
			local bancremz = lua_26in_npcGUID();
			BeginPlot(bancremz, "lua_26in_foreboss4_GoPosition", 0);
			--�H�U�O��t
			Z26Instance_Boss3_EndStage( ControlCenter, LightAvatar, DarkAvatar, RoomID )
			--
			Lua_BellatiaDuplication_change_status(RoomID, "success")	--�q���ƥ��i�פ���
			return
		end
		--

--		���B�C�K����
--		if Global_BellatiaDuplication[RoomID].save_point == 6 and Lua_BellatiaDuplication_check_status(RoomID, "boss") then
--			Global_BellatiaDuplication:debug("pankerrams hp : " .. ReadRoleValue( LightDragon, EM_RoleValue_HP))
--			Global_BellatiaDuplication:debug("status : " .. ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 ))
--		end

		Sleep(10)
	end
end

function Z26Instance_Boss3_EndStage( ControlCenter, LightAvatar, DarkAvatar, RoomID )	--���a����Boss����t
	local Light = ReadRoleValue( ControlCenter, EM_RoleValue_Register+2 )
	local Dark = ReadRoleValue( ControlCenter, EM_RoleValue_Register+3 )
	DebugMsg(0,0,"EndStage")
	SetModeEx( Light, EM_SetModeType_Move, false )
	SetModeEx( Dark, EM_SetModeType_Move, false )
	SetStopAttack( Light )
	SetStopAttack( Dark )
	FaceObj( Light, Dark )
	FaceObj( Dark, Light )
	Sleep(10)
	--PlayMotion( Light, ruFUSION_ACTORSTATE_ATTACK_UNARMED  )	--������s�������s
	CastSpell( Light, Dark, 850864 )					--������s���S��
	Sleep(20)
	PlayMotion( Dark, ruFUSION_ACTORSTATE_DYING  )			--���s�ˤU
	Sleep(50)
	local Dx, Dy, Dz, Ddir = DW_Location( Dark )
	local Lx, Ly, Lz, Ldir = DW_Location( Light )
	DelObj( Dark )
	DelObj( Light )
	SetPos( DarkAvatar, Dx, Dy, Dz, Ddir )					--���s����
	SetPos( LightAvatar, Lx, Ly, Lz, Ldir )					--���s����
	PlayMotionEX( DarkAvatar , ruFUSION_ACTORSTATE_SIT_BEGIN , ruFUSION_ACTORSTATE_SIT_LOOP )	--���s�H������˦a�ʧ@
	SetModeEx( DarkAvatar, EM_SetModeType_Move, false )
	SetModeEx( LightAvatar, EM_SetModeType_Move, false )
	AddBuff( DarkAvatar, 624290, 0, -1 )					--��եίS��
	AddBuff( LightAvatar, 624289, 0, -1 )					--��եίS��
	Show( LightAvatar, RoomID )						--���s�٬��H��
	Show( DarkAvatar, RoomID )						--���s�٬��H��
	Sleep(20)
	CastSpell( LightAvatar, DarkAvatar, 850864 )				--������s
	--PlayMotion( LightAvatar, ruFUSION_ACTORSTATE_CAST_SP01  )	--������s�������s
	Sleep(10)
	CancelBuff( DarkAvatar, 624290 )					--���s�N�S��դF���S��
	--
	for i = 1, 3 do
		local Angle = 120*i
		local Nx,Ny,Nz,Ndir = DW_NewLocation(Angle, 50, Dx, Dy, Dz, Ddir)

		local Unit = CreateObj( 119604, Nx, Ny, Nz, Ndir, 1 )
		SetModeEx( Unit, EM_SetModeType_Mark, false )		--�аO
		SetModeEx( Unit, EM_SetModeType_ShowRoleHead, false )	--�Y����
		SetModeEx( Unit, EM_SetModeType_Move, false )		--����
		SetModeEx( Unit, EM_SetModeType_HideName, true )	--���
		AddToPartition( Unit, RoomID )

		local Hitunit = CreateObj( 119604, Dx, Dy, Dz, Ddir, 1 )
		SetModeEx( Hitunit, EM_SetModeType_Mark, false )	--�аO
		SetModeEx( Unit, EM_SetModeType_ShowRoleHead, false )	--�Y����
		SetModeEx( Hitunit, EM_SetModeType_Move, false )	--����
		SetModeEx( Hitunit, EM_SetModeType_HideName, true )	--���
		AddToPartition( Hitunit, RoomID )

		CastSpell( Hitunit, Unit , 850863 )
	end

	WriteRoleValue( LightAvatar, EM_RoleValue_Register+2, 1 )
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_A]", 2, C_LightBlue)
	sleep(30);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_B]", 2, C_YELLOW)
	sleep(40);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_C]", 2, C_YELLOW)
	sleep(40);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_D]", 2, C_YELLOW)
	sleep(30);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_E]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_F]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_G]", 2, C_LightBlue)
	sleep(35);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_AFTERBOSS3_H]", 2, C_YELLOW)
	sleep(25);
	Yell(LightAvatar,"[SC_26IN_AFTERBOSS3_I]",3);
end
--=======================
--		Boss AI
--=======================
function Z26Instance_Boss3_Main( LightDragon, DarkDragon )	--Boss�гy��]�w
	local ControlCenter = OwnerID()
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	DebugMsg(0,0,"Z26Instance_Boss3_Main")
	--
--	local LightDragon = CreateObjByFlag( 102996, 780765, 1, 1 )
--	local DarkDragon = CreateObjByFlag( 102992, 780765, 2, 1 )
--	AddToPartition( LightDragon, RoomID )
--	AddToPartition( DarkDragon, RoomID )
	--
	local FrontDoor = CreateObjByFlag( 103044, 780765, 4, 1 )
	AddToPartition( FrontDoor, RoomID )
	SetModeEx( FrontDoor, EM_SetModeType_Obstruct, true )	--����
	SetModeEx( FrontDoor, EM_SetModeType_Mark, false )		--�аO
	--
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+2, LightDragon )
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+3, DarkDragon )
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+5, FrontDoor )
	--
	AddBuff( DarkDragon, 624329, 0, -1 )
	CallPlot( DarkDragon, "Z26Instance_Boss3_AI", ControlCenter )
	WriteRoleValue( DarkDragon, EM_RoleValue_Register+1, ControlCenter )
	LockHP( DarkDragon, 1, "Z26Instance_Boss3_Die" )
end

function Z26Instance_Boss3_AI(ControlCenter)
	local Dark = OwnerID()
	local Light = ReadRoleValue( ControlCenter, EM_RoleValue_Register+2 )
	local ZoneID = ReadRoleValue( ControlCenter, EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( ControlCenter, EM_RoleValue_RoomID )
	local BossTime = 0

	local SkillA_T =	7			--�W�Q����
	local SkillB_T =	7			--�a�Ъ{��
	local SkillC_T =	13			--���
	local SkillD_T = 25			--�ܲ��箧

	local SkillA_C = 850851		--�W�Q����
	local SkillB_C = 850852		--�a�Ъ{��
--	local SkillC_C =			--���	�l��p�Ǽ@��
	local SkillD_C = 624330		--�ܲ��箧

	local MinionTable = {}
	local MinionLimit = { [154] = 6; [155] = 4; [156] = 4 }

	local OriStringTable = {"[SC_26IN_BOSS3_11]";
				"[SC_26IN_BOSS3_12]";
				"[SC_26IN_BOSS3_13]";
				"[SC_26IN_BOSS3_14]";
				"[SC_26IN_BOSS3_15]";
				"[SC_26IN_BOSS3_16]";
				"[SC_26IN_BOSS3_17]";
				"[SC_26IN_BOSS3_18]";
				"[SC_26IN_BOSS3_19]"; };
	local UseStringTable = FN_CopyTable(OriStringTable)
	local OriColorTable = {
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
				C_LightBlue;
						};
	local UseColorTable = FN_CopyTable(OriColorTable)

	--�}�ԥx��
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_01]", 2, C_LightBlue);
	Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_01]", 0, C_LightBlue);

	while true do
		Sleep(10)
		Lua_BellatiaDuplication_update_players(RoomID);
		BossTime = BossTime + 1
		--	������q�ѤU10% �����l�ˬ�
		if Lua_PercentHP( Dark ) <= 11 and CheckBuff( Dark, 624329 ) == true then
			SetModeEx( Dark, EM_SetModeType_Mark, true )		--���}���s���аO�A���a�{�b�i�H����s�y���ˮ`
			CancelBuff_NoEvent( Dark, 624329 )
			--�z�ޥx��
			Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_AUTOFIRE]", 2, C_YELLOW);
			Lua_BroadCast_RoomStingTypeColor(RoomID, "[SC_26IN_BOSS3_AUTOFIRE]", 0, C_YELLOW);
		end
		--	�����԰��O�_�ӵ��� = ���s���`
		if ReadRoleValue( Light , EM_RoleValue_IsDead ) == 1 then
			Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )
			return
		end
		--	�����԰��O�_�ӵ��� = ���a����
		local PlayerTable = FN_CountPlayer( Dark )
		for i = 1, #PlayerTable+1 do
			if i == #PlayerTable+1 then	--�ˬd�j��]�쩳��ܨS�����a����
				Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )
				return
			elseif ReadRoleValue( PlayerTable[i] , EM_RoleValue_IsDead ) == 0 then
				-- �u�n�����a���۴N���X�o���ˬdfor�j��
				break
			end
		end
		--�������s�O�_�Q����
		local FightCheck = ReadRoleValue( ControlCenter, EM_RoleValue_Register+1 )
		if FightCheck == 3 then
			return
		end
		--==============
		--AI �԰��L�{
		--==============
		SysCastSpellLv( Dark, Light, 496266, 0 )
		SysCastSpellLv( Light, Dark, 496266, 0 )
--		FN_SuperTaunt( Dark, Light )
--		FN_SuperTaunt( Light, Dark )
		--�ɶ�����
		if BossTime % SkillA_T == 0 then
			SysCastSpellLv( Dark, Light, SkillA_C, 0 )
		end
		if BossTime % SkillB_T == 0 then
			SysCastSpellLv( Dark, Dark, SkillB_C, 0 )
		end
		if BossTime % SkillC_T == 0 then
			if #UseStringTable == 0 then
				UseStringTable = FN_CopyTable(OriStringTable)
				UseColorTable = FN_CopyTable(OriColorTable)
			end
			local StringNum = DW_Rand( #UseStringTable );
			Lua_BroadCast_RoomStingTypeColor(RoomID,UseStringTable[StringNum],2,UseColorTable[StringNum]);
			table.remove( UseStringTable, StringNum )
			table.remove( UseColorTable, StringNum )
			--�W���o�q�O�x��
			for m = #MinionTable, 1, -1 do
				if ReadRoleValue( MinionTable[m], EM_RoleValue_IsDead ) == 1 or CheckID( MinionTable[m] ) == false then
					table.remove( MinionTable, m )
				end
			end
			--
			if #MinionTable < MinionLimit[ZoneID] then
				local TempMinion = Z26Instance_Boss3_MinionCreat( Dark, RoomID, MinionTable )
				for m = 1, #TempMinion do
					table.insert( MinionTable, TempMinion[m] )
				end
			end
		end
		if BossTime % SkillD_T == 0 then
			AddBuff( Dark, SkillD_C, 0, -1 )
		end
	end
end

function Z26Instance_Boss3_DefeatPlayer( ControlCenter, Dark, Light, MinionTable )	--���a����
	local FrontDoor = ReadRoleValue( ControlCenter, EM_RoleValue_Register+5 )

	for i = 1, #MinionTable do
		DelObj( MinionTable[i] )		
	end
	DelObj( FrontDoor )
	DelObj( Light )
	--
	WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 2 )			--�g��2�i�D���������a���ѤF
	--
	DelObj( Dark )
end

function Z26Instance_Boss3_Die()							--���s���Ĳ�o�@��
	local Dark = OwnerID()
	local ControlCenter = ReadRoleValue( Dark, EM_RoleValue_Register+1 )

	WriteRoleValue( ControlCenter, EM_RoleValue_Register+1, 3 )
	SetModeEx( Dark  , EM_SetModeType_Fight , false )	--�i���
	SetModeEx( Dark  , EM_SetModeType_Strikback, false )	--����
	SetModeEx( Dark  , EM_SetModeType_Searchenemy, false )	--����
	FN_DelDel()
end
--=======================
--	���	�l��p�Ǽ@�� & AI
--=======================

function Z26Instance_Boss3_MinionCreat( Dark, RoomID, MinionList )				--���	�l��p�Ǽ@��
	local ZoneID = ReadRoleValue( Dark, EM_RoleValue_ZoneID )
	local PlayerTable = FN_CountPlayer( Dark )
	local Dx, Dy, Dz, Ddir = DW_Location( Dark )
	
	local Org={};
	Org[1]={hard=107817;normal=107987;easy=108050;};
	Org[2]={hard=107818;normal=107988;easy=108051;};
	Org[3]={hard=107819;normal=107989;easy=108052;};
	Org[4]={hard=107820;normal=107990;easy=108053;};
	local MinionType = {};
	
	if(ZoneID==154)then
		--�x���Ҧ��~���o�Ⱖ
		MinionType={ Org[1][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type], Org[4][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type]};
	else
		MinionType={ Org[1][Global_BellatiaDuplication.type], Org[2][Global_BellatiaDuplication.type], Org[3][Global_BellatiaDuplication.type], Org[4][Global_BellatiaDuplication.type] };
	end
	local MinionAnalysis={};
	local MinionMark={};
	for kind=1,#MinionType,1 do
		local Mtype=MinionType[kind];
		for pos=1,#MinionList,1 do
			local Minion=MinionList[pos];
			if(MinionMark[pos]==nil)and(Mtype==ReadRoleValue(Minion,EM_RoleValue_OrgID))then
				MinionAnalysis[kind]="alive";
				MinionMark[pos]="marked";
				break;
			end
		end
	end
	local MinionTable = {}
	
	for i = 1, 6 do
		if ZoneID ~= 154 and i == 5 then
			--�p�G���O�x���Ҧ� ���N���l���5���6���p��
			break
		elseif(MinionAnalysis[i]~="alive")then
			--�w���s�b(�Φ��`)�~�ɤW
			local Temp = DW_Rand( #PlayerTable )
			local x,y,z,dir = DW_Location( PlayerTable[Temp] );
			x,y,z=DW_Relative(Dark,x,y,z,150);

			local Minion = CreateObj( MinionType[i], x,y,z,dir-180, 1 )
			AddToPartition( Minion, RoomID )
			local x,y,z,dir=DW_Location(PlayerTable[Temp]);
			Move(Minion,x,y,z);
			SetFollow( Minion, PlayerTable[Temp] );
			SysCastSpellLv(PlayerTable[Temp],Minion,499110,0);
			SetPlot( Minion, "dead", "Z26Instance_Boss3_MinionDie", 0 )
			WriteRoleValue( Minion, EM_RoleValue_Register+1, Dark );
			table.insert(MinionTable,Minion);
		end
	end

	return MinionTable
end

function Z26Instance_Boss3_MinionDie()	--�p�Ǧ��` Boss����
	local Minion = OwnerID()
	local Dark = ReadRoleValue( Minion, EM_RoleValue_Register+1 )
	local MaxHp = ReadRoleValue( Dark, EM_RoleValue_MaxHP )
	local NowHp = ReadRoleValue( Dark, EM_RoleValue_HP )
	local NewHp= NowHp-(MaxHp*0.04)
	--local NewHp= NowHp-(MaxHp*0.45)
	if NowHp <= MaxHp*0.1 then		--Boss��q����10%�H�U�N���A�]���p�Ǧ��`�Ӧ���
		return
	end
	if NewHp <= MaxHp*0.1 then
		WriteRoleValue( Dark, EM_RoleValue_HP, MaxHp*0.1 )
	else
		WriteRoleValue( Dark, EM_RoleValue_HP, NewHp )
	end
	--					--�p�� ���t ���B�~�B�z�A���`�ɮ�����w���a���W��DEBUFF
	if ReadRoleValue( Minion, EM_RoleValue_OrgID ) == 107818 then
		local Player = ReadRoleValue( Minion, EM_RoleValue_Register+2 )
		CancelBuff( Player, 624335 )
	end
end

function Z26Instance_Boss3_MinionAI_1()		--�շt �p��AI
	local Minion = OwnerID()
	local RoomID = ReadRoleValue( Minion, EM_RoleValue_RoomID )
	local MinionTime = 0

	local PlayerTable
	local P1, P2
	local AttachID = 0
	local Spell,Buff
	local Target=0;
	local LightOrgID=FN_Fake("LightDragon");

	while true do
		Target=ReadRoleValue(Target,EM_RoleValue_AttackTargetID);
		if(ReadRoleValue(Target,EM_RoleValue_OrgID)==LightOrgID)then
			local pos=DW_HatePosInfo(Minion,Target);
			SetHateListPoint(Minion,pos,1);
		end
		if MinionTime % 11 == 0 then				--��ۧN�o
			if CheckID( AttachID ) == true then
				CancelBuff_NoEvent(P1,Buff);CancelBuff_NoEvent(P2,Buff);
				DelObj( AttachID )
			end
			--�L�o�i�Ϊ��a
			PlayerTable = FN_CountPlayer( Minion )
			local _tempTable={};
			local _Atable={};
			local _Btable={};
			--����
			for i=#PlayerTable,1,-1 do
				if(ReadRoleValue(PlayerTable[i],EM_RoleValue_IsDead)==0)then
					table.insert(_tempTable,PlayerTable[i]);
					if(CheckBuff(PlayerTable[i],624340)==false)then table.insert(_Atable,PlayerTable[i]);end
					if(CheckBuff(PlayerTable[i],624342)==false)then table.insert(_Btable,PlayerTable[i]);end
				end
			end
			--DebugMsg(0,RoomID,"Atable="..#_Atable..", Btable="..#_Btable);
			local r=Rand(2);
			Spell = 850858 + r;
			local playerNumEnough=false;
			--�q���T���O����X��H
			if(r==0)and(#_Atable>=2)then
				playerNumEnough=true;
				P1=table.remove(_Atable,DW_Rand(#_Atable));
				P2=table.remove(_Atable,DW_Rand(#_Atable));
			elseif (r==1)and(#_Btable>=2)then
				playerNumEnough=true;
				P1=table.remove(_Btable,DW_Rand(#_Btable));
				P2=table.remove(_Btable,DW_Rand(#_Btable));
			end
			if(playerNumEnough==true)then
				--�Ы�Attach���βy���H��P2�W
				local Ax, Ay, Az, Adir = DW_Location( Minion )
	--			AttachID = CreateObj( 107071, Ax, Ay, Az, Adir, 1 )
				AttachID = CreateObj( 103376, Ax, Ay, Az, Adir, 1 )
				SetModeEx( AttachID, EM_SetModeType_Mark, false )
				SetModeEx( AttachID, EM_SetModeType_HideName, true )
				SetModeEx( AttachID, EM_SetModeType_Strikback , false )
				SetModeEx( AttachID, EM_SetModeType_Searchenemy , false )
				SetModeEx( AttachID, EM_SetModeType_Show , false )
				AddToPartition( AttachID, RoomID )
				AttachObj( AttachID, P2, 4, "p_down", "p_hit_point01" );
				--�I�i�s���S�Īk�N
				Sleep(10)
				WriteRoleValue(AttachID,EM_RoleValue_LiveTime,10);--�T�O�L�ݼv
				SysCastSpellLv( P1, AttachID, Spell, 0 )
				if(r==0)then Buff=624340;else Buff=624342;end
				AddBuff(P1,Buff,0,10);--�T�O�L�ݼv
				AddBuff(P2,Buff,0,10);--�T�O�L�ݼv
			end
		end
		if(P1~=nil)and(P2~=nil)then
			if ReadRoleValue( P1, EM_RoleValue_IsDead ) == 0 and ReadRoleValue( P2, EM_RoleValue_IsDead ) == 0 and P1 ~= P2 then
				if Spell == 850858 then			--��H�����������
					if GetDistance( P1, P2 ) <= 100 then
						SysCastSpellLv( Minion, P1, 850860, 0 )
						SysCastSpellLv( Minion, P2, 850860, 0 )
						DebugMsg(P1,RoomID,"Gray did dmg to you, from:"..P2);
						DebugMsg(P2,RoomID,"Gray did dmg to you, from:"..P1);
					end
				elseif(spell==850859)then						--��H�����a����
					if GetDistance( P1, P2 ) >= 10 then
						SysCastSpellLv( Minion, P1, 850860, 0 )
						SysCastSpellLv( Minion, P2, 850860, 0 )
						DebugMsg(P1,RoomID,"Black did dmg to you, from:"..P2);
						DebugMsg(P2,RoomID,"Black did dmg to you, from:"..P1);
					end	
				end
			elseif CheckID( AttachID ) == true then
				CancelBuff_NoEvent(P1,Buff);CancelBuff_NoEvent(P2,Buff);
				DelObj( AttachID )
			end
		end
		--
		Sleep(10)
		MinionTime = MinionTime +1
	end	
end

function Z26Instance_Boss3_MinionAI_2_3_4()		--���t ���� ���{ �p��AI
	local Minion = OwnerID()
	local RoomID = ReadRoleValue( Minion, EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Minion, EM_RoleValue_ZoneID )
	local OrgID = ReadRoleValue( Minion, EM_RoleValue_OrgID )	--�շt 107817, ���t 107818, ���� 107819, ���{ 107820

	local MinionTime = 0
	local Target=0;
	local LightOrgID=FN_Fake("LightDragon");
	
	

	while true do
		Target=ReadRoleValue(Target,EM_RoleValue_AttackTargetID);
		if(ReadRoleValue(Target,EM_RoleValue_OrgID)==LightOrgID)then
			local pos=DW_HatePosInfo(Minion,Target);
			SetHateListPoint(Minion,pos,1);
		end
		
		if OrgID == 107818 then						--���t 107818
			local PlayerTable = FN_CountPlayer( Minion )
			local TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			if ReadRoleValue( TargetPlayer, EM_RoleValue_IsDead ) == 1 or ReadRoleValue( TargetPlayer, EM_RoleValue_ZoneID ) ~= ZoneID then
				PlayerTable = FN_CountPlayer( Minion )
				TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			end
			FN_SuperTaunt( Minion, TargetPlayer )
			WriteRoleValue( Minion, EM_RoleValue_Register+2, TargetPlayer )	--����w�����a�O���b���W
			if GetDistance( Minion, TargetPlayer ) <= 50 then
				AddBuff( TargetPlayer, 624335, 0, -1 )
			end
		elseif OrgID == 107819 and MinionTime%6 == 0 then			--���� 107819
			local PlayerTable = FN_CountPlayer( Minion )
			local TargetPlayer = PlayerTable[ DW_Rand(#PlayerTable) ]
			CastSpell( Minion, TargetPlayer, 850854 )
		elseif OrgID == 107820 and MinionTime%7 == 0 then			--���{ 107820
			local RandNum = DW_Rand(3)
			if RandNum <= 2 then			--���~ ��j
				local PlayerTable = FN_CountPlayer( Minion )
				local P1, P2 = FN_Rand2Player( PlayerTable )
				-- �W���O�H���D�X2�W���a
				local Spell = { 850855, 850856 }
				SysCastSpellLv( Minion, P1, Spell[RandNum], 0 )
				SysCastSpellLv( Minion, P2, Spell[RandNum], 0 )
			else					--�^��
				CastSpell( Minion, Minion, 850857 )
			end
		end
		--
		Sleep( 10 )
		MinionTime = MinionTime + 1
	end
end

--=======================
--		��L�禡
--=======================
function FN_SuperTaunt( TarID, ListID )
	local MaxHate, HateListPos = cl_ReadTarget_hatelist_Up( TarID , ListID )	--�o�X �̤j����B������m
	SetHateListPoint( TarID , HateListPos , MaxHate*9999 )
	SetAttack( TarID , HateListPos)
end

function FN_CountPlayer(NPC)
	local PlayerTable = {}
	local room=ReadRoleValue(NPC,EM_RoleValue_RoomID);
	for i=1,#Global_BellatiaDuplication[room].players,1 do
		local _player=Global_BellatiaDuplication[room].players[i].guid;
		if(CheckBuff(_player,624292)==true)and(GetDistance(NPC,_player)<800)then
			table.insert( PlayerTable, _player );
		end
	end
	--DebugMSG(0,0,"PlayerNum="..#PlayerTable)
	return PlayerTable
end

function FN_Rand2Player( Group )						--�M���D2�ӭ˷����X��
	if #Group == 1 then
		return Group[1], Group[1]
	elseif #Group >= 2 then
		local Player1
		local Player2
		while true do
			local Temp = DW_Rand( #Group )
			if Player1 == nil then
				Player1 = Group[Temp]
			elseif Group[Temp] ~= Player1 then
				Player2 = Group[Temp]
				break
			end
		end
		return Player1, Player2
	end
end

function FN_DelDel()
	Lua_DavisDelObj( 107817 )
	Lua_DavisDelObj( 107818 )
	Lua_DavisDelObj( 107819 )
	Lua_DavisDelObj( 107820 )
	Lua_DavisDelObj( 107987 )
	Lua_DavisDelObj( 107988 )
	Lua_DavisDelObj( 107989 )
	Lua_DavisDelObj( 107990 )
	Lua_DavisDelObj( 108050 )
	Lua_DavisDelObj( 108051 )
	Lua_DavisDelObj( 108052 )
	Lua_DavisDelObj( 108053 )
	Lua_DavisDelObj( 103044 )
	Lua_DavisDelObj( 107071 )
end

function FN_Nothing()
	return
end

function FN_CopyTable(OriTable)
	local NewTable = {}

	for i = 1, #OriTable do
		table.insert( NewTable, OriTable[i] )
	end

	return NewTable
end
function FN_Fake(who)--�^�ǥ��T�����
	local light={hard=102567;normal=107985;easy=108048;}; 
	local dark={hard=102992;normal=107986;easy=108049;};
	if(who=="LightDragon")then
		return light[Global_BellatiaDuplication.type];
	else
		return dark[Global_BellatiaDuplication.type];
	end	
end