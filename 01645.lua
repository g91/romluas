-- 2013.05.28 ���E�G���g�νվ�H�U�Ҧ� function�A�վ㫰���g�k�C
function PlayOpenDoor_Main1() --������l�@��

	local Door = OwnerID()
	local Zone = ReadRoleValue( Door , EM_RoleValue_ZoneID )	-- Ū��Zone ID
	local RoomID = ReadRoleValue( Door , EM_RoleValue_RoomID)
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��

	if Zone == 402 or ( Zone >= 930 and Zone <= 957 ) then
		WriteRoleValue( Door, EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		SetModeEx( Door , EM_SetModeType_Show , true )	--���
		SetModeEx( Door , EM_SetModeType_Mark , true )	--�аO
		SetModeEx( Door , EM_SetModeType_HideName , false )	--�W��
		SetModeEx( Door , EM_SetModeType_ShowRoleHead , true )	--�Y����
		SetModeEx( Door , EM_SetModeType_Fight , true )	--�i�������
		SetModeEx( Door , EM_SetModeType_Move , false )	--����
		SetModeEx( Door , EM_SetModeType_Obstruct , true )	--����
		SetModeEx( Door , EM_SetModeType_Strikback , false )	--����
		SetModeEx( Door , EM_SetModeType_SearchenemyIgnore , false )	--�����j�M
		SetModeEx( Door , EM_SetModeType_DisableRotate , true )	--��V
		SetModeEx( Door , EM_SetModeType_Searchenemy , false )	--����
		SetModeEx( Door , EM_SetModeType_NotShowHPMP , true )	--����ܦ��
		SetModeEx( Door , EM_SetModeType_Revive , false )	--����

		AddBuff( Door , 505921 , 98 , -1 )	-- �Q���a�����ɡA���쪺�ˮ`�q��� 99%
		AddBuff( Door , 505516 , 99 , -1 )	-- �QNPC�����ɡA���쪺�ˮ`�q�W�[ 100%
		AddBuff( Door , 506164 , 0 , -1 )	-- ���쪺�v���ĪG�U�� 95%
		AddBuff( Door , 502707 , 0 , -1 )	-- ���^��

		WriteRoleValue( Door , EM_RoleValue_Register+1 , 38 )	-- �O�����j���ؿv���A�����δ��v�L�k�@�Ω󦹥ؼ�
		SetPlot( Door , "range" , "Hao_GuildWar_Door_Switch_Car" , 90 )	-- ���㱵�񫰪��᪺�d��@��
		SetPlot( Door , "dead" , "Hao_GuildWar_Door_Death_Plot" , 0 )	--�j�������`�@��
	end
	Setplot( Door , "touch" , "Hao_GuildWar_Door_Switch_Player" , 20 )	-- ���aĲ�I�����᪺Ĳ�I�@��
	
	-- 2013.07.15 YoYo�G�s�W�d�����׽u�����\��A�����d�����𥴤H�C
	local LeftX , LeftZ , RightX , RightZ = Hao_GuildWar_Door_Biock( Door , 25 , 100 , 100 )	--�p�⫰�����25���׽u����I��X�BZ�y��

	local BlockLineFlag = 780234	--�d�����׽u�M�Ϊ��X��
	local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--�P�_������m���X�нs��
	local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--���׽u���s��
	--21�G�Ŷ� - �k��(���|�J)
	--22�G�Ŷ� - ����(�R�ĩ_)
	--23�G�Ŷ� - ����
	--31�G���� - �k��(������)
	--32�G���� - ����(���Ǽw)
	--33�G���� - ����
	for I = 1 ,  #DoorFlagSite do
		if KS_GetFlagDistance( Door , BlockLineFlag , DoorFlagSite[ I ] ) < 200 then	--����P�P�_�Z��<200�A�h�ͦ����׽u
			AddLineBlock( RoomID , BlockLineID[ I ] , LeftX , LeftZ , RightX , RightZ )	-- �إ߫��������׽u
		end
	end	
end

function Hao_GuildWar_Door_Switch_Player()	-- ���aĲ�I�����᪺Ĳ�I�@��

	local Player = OwnerID()
	local Door = TargetID()
	local Dis = 120
	AdjustFaceDir( Player , Door , 0 ) --���V
	CallPlot( Player , "Hao_GuildWar_Door_Switch_1" , Player , Door , Dis )
end

function Hao_GuildWar_Door_Switch_Car()	-- ���㱵�񫰪��᪺�d��@��

	local Player = OwnerID()
	local Door = TargetID()
	local Car = ReadRoleValue( Player , EM_RoleValue_PID )	-- Ū������s��
	local Driver = CheckFlag( Player , 543769 )	-- �ˬd�O�_���b�r�p���㤤
	
	if Car ~= 0 and Driver == true then	-- ����s�b�B���r�p����
		local Dis = 150
		AdjustFaceDir( Car , Door , 0 ) --���V
		AdjustFaceDir( Player , Door , 0 ) --���V
		CallPlot( Player , "Hao_GuildWar_Door_Switch_1" , Player , Door , Dis )
	else
		return
	end
end

function Hao_GuildWar_Door_Switch_1( Player , Door , Dis )	-- ���|���@�ζ}�����@��(Zone 401�BZone 402)�A���a�B���B�Z��

	local PlayerGuildID = GetRoleCampID( Player )	-- Ū�����a�}��
	local BuildingGuildID = GetRoleCampID( Door )	-- Ū���j���}��
	local Zone = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Zone == 402 or ( Zone >= 930 and Zone <= 957 ) then
		if ( PlayerGuildID == BuildingGuildID ) or ReadRoleValue( Player , EM_RoleValue_VOC ) == 0 then	-- ���a�}��P�j���}��ŦX�Ϊ��a¾�~�� gm ��
			local Pos = {}
			Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Door) -- ���o�����Ҧb�y��
			Pos["PlayerDir"] = ReadRoleValue( Player , EM_RoleValue_Dir )	--���a
			local Cal = (math.pi/180)*(Pos["Dir"])	-- ����
			local Ca = Pos["PlayerDir"] - Pos["Dir"]	-- ���a�P�j���ۮt����
			if Ca < 0 then
				Ca = Ca + 360
			end
			if Ca < 90 or Ca > 270 then
				SetPos( Player , Pos["X"]+Dis*math.cos(Cal) , Pos["Y"]+5 , Pos["Z"]-Dis*math.sin(Cal) , Pos["Dir"] )
			else
				SetPos( Player , Pos["X"]-Dis*math.cos(Cal) , Pos["Y"]+5 , Pos["Z"]+Dis*math.sin(Cal) , Pos["Dir"]+180 )
			end
			AddBuff( Player , 503993 , 0 , 1 )	--�ǰe�S��
		end
	else
		if ReadRoleValue( Door , EM_RoleVAlue_PID ) == 0 then	-- �D���|���԰���}��
			CallPlot( Door , "Hao_GuildWar_Door_Switch_2" , Door , "Open" , 50 )
		elseif ReadRoleValue( Door , EM_RoleVAlue_PID ) == 1 then	-- �D���|���԰�������
			CallPlot( Door , "Hao_GuildWar_Door_Switch_2" , Door , "Close" , 50 )
		else
			DebugMsg( Player , Room , "Repeat" )
		end
	end
end

function Hao_GuildWar_Door_Switch_2( Door , Status , Time )	-- ���B���A�BSleep�ɶ�

	if Status == "Open" then	-- ����}���ʧ@
		PlayMotionEX( Door , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
		WriteRoleValue( Door , EM_RoleValue_PID , 2 )	-- �קK Already running
		Sleep(Time)
		WriteRoleValue( Door , EM_RoleValue_PID , 1 )	-- �g���i����
	else	-- ���������ʧ@
		PlayMotionEX( Door , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )
		WriteRoleValue( Door , EM_RoleValue_PID , 2 )	-- �קK Already running
		Sleep(Time)
		WriteRoleValue( Door , EM_RoleValue_PID , 0 )	-- �g���i�}��
	end
end
-- 2013.04.23 ���E:�վ㤽�|���Գ�(Zone 402)�ͦ������ؿv�I���g�k�A�ץ������Q�R���ɡA�����v���|���ͫ����ؿv�I(113200)�����D�C
function Hao_GuildWar_Door_Death_Plot()	--�������`��t�@��

	local Gate = OwnerID()	--����
	local Gate_OrgID = ReadRoleValue( Gate , EM_RoleValue_OrgID )	-- ���o����OrgID
	local Gate_CampID = GetRoleCampID( Gate )	-- ���o�����}��
	
	local Pos = {}
	Pos["RoomID"] = ReadRoleValue( Gate , EM_RoleValue_RoomID )	-- ���o�����Ҧb Room
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] = Lua_Hao_Return_Coordinate(Gate) -- ���o�����Ҧb�y��
	SetModeEx( Gate , EM_SetModeType_Fight , false )	-- ���i���
	
	-- 2013.07.11 YoYo�G�s�W�d�����׽u�����\��A�����d�����𥴤H�C
	local BlockLineFlag = 780234	--�d�����׽u�M�Ϊ��X��
	local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--�P�_������m���X�нs��
	local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--���׽u���s��
	--21�G�Ŷ� - �k��(���|�J)
	--22�G�Ŷ� - ����(�R�ĩ_)
	--23�G�Ŷ� - ����
	--31�G���� - �k��(������)
	--32�G���� - ����(���Ǽw)
	--33�G���� - ����
	for I = 1 , #DoorFlagSite do
		if KS_GetFlagDistance( Gate , BlockLineFlag , DoorFlagSite[ I ] ) < 200 then	--����P�P�_�Z��<200�A�h�����������׽u
			DelLineBlock( Pos["RoomID"] , BlockLineID[ I ] )	--�������׽u
		end
	end

	local Bonfire = CreateObjByObj( 114740 , Gate , 1 )	-- �b�����W�إ����ä��磌��A���񫰪��Q�R����A����U�N���ʧ@
	SetModeEx( Bonfire , EM_SetModeType_Fight , false )	-- ���i���
	SetModeEx( Bonfire , EM_SetModeType_HideName , true )	--���æW��
	SetModeEx( Bonfire , EM_SetModeType_Mark , false )	--�аO
	CallPlot( Bonfire , "Hao_GuildWar_DelObj" , Bonfire , 35 )	--  ������b�]�w��ƫ�R���ۤv�C

	local GatePoint = CreateObj( 113200 , Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"] , 1 )	-- �إ߫����ؿv�I
	SetModeEx( GatePoint , EM_SetModeType_Fight , false )	-- ���i���
	SetModeEx( GatePoint , EM_SetModeType_Show , false )	-- ���
	SetModeEx( GatePoint , EM_SetModeType_Mark , false )	-- �аO	
	SetModeEx( GatePoint , EM_SetModeType_HideName , false )	-- �W��
	SetModeEx( GatePoint , EM_SetModeType_ShowRoleHead , true )	-- �Y����
	SetModeEx( GatePoint , EM_SetModeType_Move , false )	-- ����
	SetModeEx( GatePoint , EM_SetModeType_Obstruct , false )	-- ����
	SetModeEx( GatePoint , EM_SetModeType_NotShowHPMP , true )	-- ����ܦ��
	SetRoleCampID( GatePoint , Gate_CampID )	-- �N�����}��g�J�����ؿv�I��
	WriteRoleValue( GatePoint  , EM_RoleValue_Register+4 , Gate_OrgID )	-- �N������OrgID�g�J�����ؿv�I��
	-- 2013.06.28 �l�[���`�@���A�d�ֱ߽��������ؿv�I�A�l�ܫ����ؿv�I�L�G���`�����D�A�ñN���`�@�� return false
	SetPlot( GatePoint , "dead" , "Hao_GuildWar_GatePoint_Dead" , 0 )	--���`�@��
	--
	AddToPartition( GatePoint , Pos["RoomID"] )
	Beginplot( GatePoint ,"Hao_GuildWar_GatePoint", 0 )	-- ���櫰���ؿv�I���@��

	local GatePoint_CampID = GetRoleCampID( GatePoint )	-- ���o�����ؿv�I�}��
	CallPlot( Gate , "Hao_GuildWar_DelObj" , Gate , 0 )	--  �������b�]�w��ƫ�R���ۤv�C
end

function Hao_GuildWar_GatePoint_Dead()	-- �����ؿv�I���`�@��

	local GatePoint = OwnerID()
	local Count = HateListCount(GatePoint)	-- Ū������C��

	for i = 1 , Count , 1 do	-- �v�@��Ѥ���C��W��
			local Killer = HateListInfo( GatePoint , i-1 , EM_HateListInfoType_GItemID )
			local OrgID = ReadRoleValue( Killer , EM_RoleValue_OrgID )
			DesignLog( Killer , 113200 , "Killer = "..OrgID )	-- ������^�Ǧۤv��OrgID��Designlog��
	end
	
	local MaxHP = ReadRoleValue( GatePoint , EM_RoleValue_MaxHP )	-- �N�����ؿv�I��q�ɺ�
	WriteRoleValue( GatePoint , EM_RoleValue_HP , MaxHP )
	return false
end

function Hao_GuildWar_DelObj( Obj , Time)
	Sleep(Time)
	DelObj(Obj)
end

function Hao_GuildWar_GatePoint()	-- �����ؿv�I����@��

	local GatePoint = OwnerID()
	sleep(40)
	SetModeEx( GatePoint , EM_SetModeType_Show , true )	--���
	SetModeEx( GatePoint , EM_SetModeType_Mark , true )	--�аO
	SetPlot( GatePoint , "touch" , "Hao_GuildWar_GatePoint_Touch" , 50 )	--Ĳ�I�A�ͼ@��
	SetCursorType( GatePoint , eCursor_repair )	 -- ����ܦ��ײz��
--	SetCursorType( GatePoint , eCursor_Interact )	 -- ����ܦ�����
end

-- 2013.03.07 ���E�G���g�H�U�@���A�ץ����|���Գ�(Zone 402)�I�������ؿv�I(113200)�ɵo�ͪ����D�A�Ա��Ш�������x�A�H�����ؿv�I������r�j�M
function Hao_GuildWar_GatePoint_Touch() -- �����ؿv�I��Ĳ�I�@��

	local Player = OwnerID()	-- ���a
	local GatePoint = TargetID()	-- �����ؿv�I
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- ���o���a¾�~�A¾�~�]�w��GM�ɡA�i�����}��P�_����
	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( Player )		-- ���o���a�}��
	local GatePointGuildID = GetRoleCampID( GatePoint )	-- ���o�����ؿv�I�}��
	local Player_Energy = GetGuildWarEnergy( Player )	-- ���o���a������q
	local Player_Record =  CountBodyItem( Player , 206685 )	-- ���o���a�������Z
	local Record = 20 -- ���s�سy�����һݾ��Z
	local Energy = 200 -- ���s�سy�����һݯ�q

	DialogClose( Player )

	if Voc ~= 0 then	-- ¾�~�D GM �ɡA�[�J�}��P�_
		if PlayerGuildID ~= GatePointGuildID then	-- ���P�}��N return
			ScriptMessage( Player , Player , 1 , "[GUILD_REMINDER]" , C_SYSTEM )	--�A���O�����|������
			ScriptMessage( Player , Player , 0 , "[GUILD_REMINDER]" , C_SYSTEM )
			return
		end
	end

	if ReadRoleValue( GatePoint , EM_RoleValue_PID ) == 1 then
		ScriptMessage( Player , Player , 1 ,"[SYS_AUCTION_WAIT_NEXT]" , 0 )	-- ���L���A�еy�ԦA�աC
		return
	end

	if CheckBuff( Player , 501570 ) == true then
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--�����w�g���}�F
		return
	end

	AddBuff( Player , 501570 , 0 , -1 )

	local Time = 0
	local DialogStatus , Distance
	local DistanceLimit = 50
	local TransferSelect = {}
	TransferSelect[0] = { "[SC_OKAY]" }	-- �T�w
	TransferSelect[1] = { "[SC_CANCEL]" }	-- ���}���

	DialogCreate( Player , EM_LuaDialogType_Select , "[SC_YU_GUILDWAR_BUILD_87][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" )	-- �سy�����ݪ�O...
	for i = 0 , table.getn(TransferSelect) , 1 do
		DialogSelectStr( Player , TransferSelect[i][1] )
	end

	if DialogSendOpen(Player) == false then
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--��ưe�X�����D
		return
	end
	
	while true do
		Sleep(1)
		Time = Time + 1
		Distance = GetDistance( Player , GatePoint )		
		if Time  > 600 then	-- ���L�a�j��
			DebugMsg( Player , RoomID ,"Idle for more than 60 sec , Menu will close automatically." )
			break
		elseif Distance > DistanceLimit then
			ScriptMessage( Player , Player , 1 , "[SC_204425_5]" , 0 )	-- �ؼжZ���L��
			break
		end
		DialogStatus = DialogGetResult( Player )
		if DialogStatus == 0 then	-- ���a�I��O
			if Player_Energy >= Energy and Player_Record >= Record then	-- �������q>=��o��q�Ϋ������Z>=��o���Z��
				CallPlot( GatePoint , "Hao_GuildWar_GatePoint_Touch_1" , GatePoint , Player , Record , Energy , DistanceLimit )
			elseif Player_Energy < Energy and Player_Record < Record then
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_27]" , 0 )	-- ��o�һݤ���q�B���Z����
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_27]" , 0 )
			elseif Player_Energy < Energy and Player_Record >= Record then				
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_31]" , 0 )	-- ��o�һݤ���q����
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_31]" , 0 )
			elseif Player_Energy >= Energy and Player_Record < Record then				
				ScriptMessage( Player , Player , 1 , "[SC_YU_GUILDWAR_BUILD_32]" , 0 )	-- ��o�һݤ����Z����
				ScriptMessage( Player , Player , 0 , "[SC_YU_GUILDWAR_BUILD_32]" , 0 )
			end
			break
		elseif DialogStatus == 1 or DialogStatus == -1 then	-- �I��_�Τ��_�@��
			break
		end
	end
	CancelBuff( Player , 501570 )
	DialogClose( Player )
end

function Hao_GuildWar_GatePoint_Touch_1( GatePoint , Player , Record , Energy , DistanceLimit )	-- ���s�س]����
	-- �����ؿv�I�B���a�B���Ӿ��Z�B���ӯ�q�B�����ؿv�I�P���a�����i�����I�����Z��
	local CastTime = 200			-- �ؿv�����ݨD�ɶ�
	if ReadRoleValue( GatePoint , EM_RoleValue_PID ) == 1 then	-- �����ؿv�I�����a���b�ϥή�
		ScriptMessage( Player , Player , 1 , "[SYS_AUCTION_WAIT_NEXT]" , 0 )	--���L���A�еy�ԦA�աC
		return
	end
	CallPlot( GatePoint , "Hao_GuildWar_Check_State" , GatePoint , Player , DistanceLimit )	-- �d�ߪ��a�O�_�٦b�Ӱϰ�
	WriteRoleValue( GatePoint , EM_RoleValue_PID , 1 )	--��o��w���A�������ؿv�I���i�A�Q��L���a�I��
	ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )	-- �}�l�ؿv
	ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_START]" , C_SYSTEM )
	if BeginCastBarEvent( Player , GatePoint , "[SC_YU_GUILDWAR_BUILD_88]" , CastTime , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END , 0 , "Hao_GuildWar_Door_Rebirth" ) ~= 1 then
		ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]" , 0 )	--�ؼХ��b���L��
		return
	else
		AttachCastMotionTool( Player , 210644 )	--�m���Z�����}�Y
	end
end

function Hao_GuildWar_Check_State( Npc , Player , DistanceLimit )	-- �d�ߪ��a�O�_�٦b�Ӱϰ�

	while ReadRoleValue( Npc , EM_RoleValue_PID ) == 1 do
		if CheckID(Player) == false or GetDistance( Npc , Player ) > DistanceLimit then	-- �T�{�I�������a�O�_���}�ϰ���_�u
			WriteRoleValue( Npc , EM_RoleValue_PID , 0 )
			break
		end
		Sleep(10)
	end
end

function Hao_GuildWar_Door_Rebirth( Player , CheckStatus ) -- ����̡B���浲�G(�j��0�O���\�A�p��0�O����)

	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local GatePoint = TargetID()
	local PlayerGuildID = GetRoleCampID( Player )	--���a���}��
	local DoorID = ReadRoleValue( GatePoint , EM_RoleValue_Register+4 )	-- Ū���O���b�����ؿv�I�W���j��ID
	local Player_Energy = GetGuildWarEnergy( Player )	-- ���o���a������q
	local Energy = 200	--�Ͳ��һݯ�q	
	local Player_Record =  CountBodyItem( Player , 206685 )	-- ���o���a�������Z
	local Record = 20	--�Ͳ��һݾ��Z
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )	-- Ū�����a¾�~
	
	if CheckStatus ~= 0 then	-- �p�G���I�k����
		if CheckStatus > 0 and ( Player_Record >= Record and Player_Energy >= Energy ) then	-- �I�k���\�B�����귽>=�ݨD�귽��
			local Door = CreateObjByObj( DoorID , GatePoint , 1 )	-- �b�����ؿv�I�W���ؤj��
			local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��
			WriteRoleValue( Door, EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
			AddBuff( Door , 505013 , 1 , 1  )	-- �Y�p
			SetRoleCampID( Door , PlayerGuildID )	-- �N���a�}��g�J����
			DelBodyItem( Player , 206685 , Record )	-- �������a�������Z
			AddGuildWarEnergy( Player , -Energy )	-- �������a������q
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )	-- �ؿv�����A���ӯ�q[$VAR1]�B���Z[$VAR2]
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_COMPLETED][$SETVAR1="..Energy.."][$SETVAR2="..Record.."]" , C_SYSTEM )
			AttachCastMotionTool( Player , 212076 )  --�m���Z�����Ť�			
			EndCastBar( Player , CheckStatus )
			Delobj(GatePoint)
			
--[[			-- 2013.07.11 YoYo�G�s�W�d�����׽u�����\��A�����d�����𥴤H�C
			local BlockLineFlag = 780234	--�d�����׽u�M�Ϊ��X��
			local DoorFlagSite = { 21 , 22 , 23 , 31 , 32 , 33 }	--�P�_������m���X�нs��
			local BlockLineID = { 107 , 108 , 109 , 207 , 208 , 209 }	--���׽u���s��
			--21�G�Ŷ� - �k��(���|�J)
			--22�G�Ŷ� - ����(�R�ĩ_)
			--23�G�Ŷ� - ����
			--31�G���� - �k��(������)
			--32�G���� - ����(���Ǽw)
			--33�G���� - ����
			local BlockPointTable = { { 2 , 3 } , { 5 , 6 } , { 8 , 9 } , { 12 , 13 } , { 15 , 16 } , { 18 , 19 } }	--���׳s�u�Ϊ��I
			for I = 1 , #DoorFlagSite do
				if KS_GetFlagDistance( Door , BlockLineFlag , DoorFlagSite[ I ] ) < 100 then	--����P�P�_�Z��<100�A�h�ͦ����׽u
					local BP1X , BP1Y , BP1Z , BP1Dir = DW_Location( BlockLineFlag , BlockPointTable[ I ][ 1 ] ) --���o���׽u�X��1����m�P���V
					local BP2X , BP2Y , BP2Z , BP2Dir = DW_Location( BlockLineFlag , BlockPointTable[ I ][ 2 ] ) --���o���׽u�X��2����m�P���V
					AddLineBlock( RoomID , BlockLineID[ I ] , BP1X , BP1Z , BP2X , BP2Z )	--�s�W���׽u
				end
			end
			--]]
		else	-- �I�k����
			WriteRoleValue( GatePoint , EM_RoleValue_PID , 0 )	--�Ѱ���w�i�A����o
			ScriptMessage( Player , Player , 1 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )	-- �ؿv����
			ScriptMessage( Player , Player , 0 , "[SC_GUILDWAR_BUILDING_FAILED]" , C_RED )
			AttachCastMotionTool( Player , 212076 )  --�m���Z�����Ť�
			EndCastBar( Player , CheckStatus )
		end
	end
end
-- 2013.07.16 ���E�G�s�W���|���Ԫ��׽u�@�Ψ禡
function Hao_GuildWar_Door_Biock( Obj , BehindDis , LeftDis , RightDis )	-- �ѦҪ���B��諫���Z���B��������Z���B�k������Z��

	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local Pos , Dir , Cal = {} , {} , {}	-- �y�СB���סB����
	Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- ���oObj�Ҧb�y��

	-- ��X������180�ת�����
	Dir["Behind"] = Pos["Dir"] + 180
	if Dir["Behind"] >= 360 then
		Dir["Behind"] = Dir["Behind"] - 360
	end
	Cal["Behind"] = (math.pi/180)*(Dir["Behind"])	-- ��詷��

	-- ��X���󥪤�90�׮ɪ�����
	Dir["Left"] = Pos["Dir"]+90
	if Dir["Left"] >= 360 then
		Dir["Left"] = Dir["Left"] - 360
	end
	Cal["Left"] = (math.pi/180)*(Dir["Left"])	-- ���詷��

	-- ��X����k��90�׮ɪ�����
	Dir["Right"] = Pos["Dir"]-90
	if Dir["Right"] < 0 then
		Dir["Right"] = Dir["Right"] + 360
	end
	Cal["Right"] = (math.pi/180)*(Dir["Right"])	-- �k�詷��

	-- ��e���V�����180�סA�V��BehindDis�Z���᪺ X Y Z �I
	Pos["BehindX"] = Pos["X"]+(BehindDis*math.cos(Cal["Behind"]))
	Pos["BehindZ"] = Pos["Z"]-(BehindDis*math.sin(Cal["Behind"]))
	Pos["BehindY"] = GetHeight( Pos["BehindX"] , Pos["Y"] , Pos["BehindZ"] )	-- ���o���I���a����
	
	-- ��e���V������90�סA�V��LeftDis�Z���᪺ X Y Z �I
	Pos["LeftX"] = Pos["BehindX"]-(LeftDis*math.cos(Cal["Left"]))
	Pos["LeftZ"] = Pos["BehindZ"]+(LeftDis*math.sin(Cal["Left"]))
	Pos["LeftY"] = GetHeight( Pos["LeftX"] , Pos["Y"] , Pos["LeftZ"] )
	
	-- ��e���V���k��90�סA�V�kRightDis�Z���᪺ X Y Z �I
	Pos["RightX"] = Pos["BehindX"]-(RightDis*math.cos(Cal["Right"]))
	Pos["RightZ"] = Pos["BehindZ"]+(RightDis*math.sin(Cal["Right"]))
	Pos["RightY"] = GetHeight( Pos["RightX"] , Pos["Y"] , Pos["RightZ"] )

--	local Obj1 = CreateObj( 110987 , Pos["LeftX"] , Pos["LeftY"] , Pos["LeftZ"] , Pos["Dir"] , 1 )
--	local Obj2 = CreateObj( 110987 , Pos["RightX"] , Pos["RightY"] , Pos["RightZ"] , Pos["Dir"] , 1 )
--	local Obj3 = CreateObj( 110987 , Pos["BehindX"] , Pos["BehindY"] , Pos["BehindZ"] , Pos["Dir"] , 1 )
--	AddToPartition( Obj1 , Room )
--	AddToPartition( Obj2 , Room )
--	AddToPartition( Obj3 , Room )
	return Pos["LeftX"] , Pos["LeftZ"] , Pos["RightX"] , Pos["RightZ"]	
end