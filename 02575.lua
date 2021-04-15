function Lua_ying_fireday_begin() --�������Ϊ���

	local BOX = OwnerID()
	local ZoneID = ReadRoleValue( BOX , EM_RoleValue_RealZoneID ) --Ū�����ê��������Zone
	local NPC = LuaFunc_SearchNPCbyOrgID( BOX , 119551 , 100 , 0 ) --�H���ê���114041�����ߡA�V�P��100�X�j�MNPC���119551
										       --(�̫᪺0��Type�AType 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼ�)
										       --(1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�)
	while true do

		local Hour = GetSystime(1) --���o�{�b�ɶ��G��
		local Min = GetSystime(2) --���o�{�b�ɶ��G��
		local PID

		if Hour == 12 or Hour== 15 or Hour == 18 or Hour == 21 then
			if Min == 0 then
				if ZoneID < 1000 then --(�YZoneID�j��1000�h�����y)
					RunningMsgEx( BOX , 2 , 3 , "[SC_FIREDAY_2012_1]" ) --�ȴ餧���W���\�h�ʪ������줣���̯f�I�`�I�Z��R�������f�����A���b�x�D�i�����_�I�̫e����U�ʪ��̻����̱��K
				end
				BeginPlot( BOX , "Lua_ying_fireday_monsterborn" , 0 )
				WriteRoleValue( NPC , EM_RoleValue_PID , 1 ) --�i������~pid=1
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			elseif Min == 15 then
				if ZoneID < 1000 then
					RunningMsgEx( BOX , 2 , 3 , "[SC_FIREDAY_2012_2]" ) --�]�_�I�̭̪���U�A���G�b�ʪ��̨��W�������̯f�Ȯ���o�F�w�M�K
				end
				BeginPlot( BOX , "Lua_ying_fireday_delmonster" , 0 )
				WriteRoleValue( NPC , EM_RoleValue_PID , 0 ) --���ʵ���pid=0
--				PID = ReadRoleValue ( NPC , EM_RoleValue_PID )
--				Say( BOX , "PID = "..PID )
			end
		end
		Sleep(600) --1�����]�@���j��
	end
end
----------�إߩǪ�------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_monsterborn()

	local Flag = 781068
	local Monster = { 103006 , 103007 , 103008 , 103009 }
	local Ani

	for j = 1 , 4 , 1 do
		for i = 0 , 9 , 1 do
			if j == 1 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i , 1 ) --�ѷӫ��w�X�l����m�Ӳ��ͪ���(NPC�s���B�X�l�N���B�ĴX���X�l�B����ƶq )
			elseif j == 2 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i+10 , 1 )
			elseif j == 3 then
				Ani = CreateObjByFlag( Monster[j] , Flag , i+20 , 1 )
			else
				local Random = DW_Rand(5)
				Ani = CreateObjByFlag( Monster[j] , Flag , 29+Random , 1 )
				SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
				SetModeEx( Ani , EM_SetModeType_Show , true ) --���
				SetFlag( Ani , 544801 , 1 )--�������_��
				AddToPartition( Ani , 0 )
				break
			end

			local X = ReadRoleValue( Ani , EM_RoleValue_X )
			local Y = ReadRoleValue( Ani , EM_RoleValue_Y )
			local Z = ReadRoleValue( Ani , EM_RoleValue_Z )

			WriteRoleValue( Ani , EM_RoleValue_Register1 , X )
			WriteRoleValue( Ani , EM_RoleValue_Register2 , Y )
			WriteRoleValue( Ani , EM_RoleValue_Register3 , Z )
			SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
			SetModeEx( Ani , EM_SetModeType_Revive , true )--�i����
			SetModeEx( Ani , EM_SetModeType_Show , true ) --���
			SetFlag( Ani , 544801 , 1 )--�������_��
			AddToPartition( Ani , 0 )
		end
	end
end
----------���ʮɶ���R���ʪ�----------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_delmonster()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 103006 , 103007 , 103008 , 103009 }
	local Number = 0

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
		--	Obj=Role:New(ID)
		--	if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						DelObj(ID)
					end
				end
		--	end
		end
	end
end
----------�p�ʪ������󲣥ͼ@��--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_add621299()

	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local X = ReadRoleValue( Monster , EM_RoleValue_X )
	local Y = ReadRoleValue( Monster , EM_RoleValue_Y )
	local Z = ReadRoleValue( Monster , EM_RoleValue_Z )
	local MonsterID ={ }
	MonsterID[103006] = 1
	MonsterID[103007] = 3
	MonsterID[103008] = 5
	MonsterID[103009] = 10

	CancelBuff_NoEvent( Monster , 621299 )
	SetModeEx( Monster , EM_SetModeType_Move , true ) ---����
	AddBuff( Monster , 621299 , MonsterID[OrgID]-1 , -1 ) --�f�r�P�VBUFF
	WriteRoleValue( Monster , EM_RoleValue_PID , 0 ) --PID�g�J0
	WriteRoleValue( Monster , EM_RoleValue_Register6 , 0 )
	WriteRoleValue( Monster , EM_RoleValue_Register7 , 0 )

	if OrgID == 103008 then
		AddBuff( Monster , 621807 , 0 , -1 ) --���ֶ]
	end

	while true do
		local Reg = ReadRoleValue( Monster , EM_RoleValue_Register6 )
--		Say( Monster , "Reg="..Reg )
		if Reg == 0 then
			local Range = 70 +  rand(6) --�üƲ��ʽd��
			local Random = Rand(6)+1 --1~6
			Sleep( Random*10 )
			MoveDirect( Monster , X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
		else --Reg6 = 1
			break
		end
	end
end
----------�԰��}�l----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_fight()

	local Monster = OwnerID()
	WriteRoleValue( Monster , EM_RoleValue_Register6 , 1 ) --Register6�g�J�A�P�_�O�_�԰���
end
---------�԰�����------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_exitfight()

	CallPlot( OwnerID() , "Lua_ying_fireday_add621299" , 0 )
end
----------�ϥΤ��K����240509�ˬdLUA------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_240509check()

	local Monster = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local PID = ReadRoleValue( Monster , EM_RoleValue_PID )
	local RegM = ReadRoleValue( Monster , EM_RoleValue_Register7 ) --�Ǫ���Register7��
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID ) --���a��DBID

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��
	if CheckID( Monster ) == true and ReadRoleValue( Monster , EM_RoleValue_IsDead ) == 0 then --�ؼЦs�b
		if PID == 0 then --�S��
			if OrgID == 103006 or OrgID == 103007 or OrgID == 103008 or OrgID == 103009 then
				if RegM == 0 or RegM == DBID then
					if CheckBuff( Monster , 621299 ) == true then --���f�rBUFF
						return true
					else --�S���f�rBUFF
						ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_6]" ,  C_SYSTEM ) --���ؼФw�b�Ƨ����I
						return false
					end
				elseif RegM~= 0 and RegM ~= DBID then
					ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_7]" ,  C_SYSTEM ) --���ؼХ��Q�b�Ƥ��I
					return false
				end
			else
				ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
				return false
			end
		elseif PID== 1 then --�w���`
			ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
			return false
		end
	else --�ؼФ��s�b
		ScriptMessage( Player , Player , 1 , "[EM_201167_3]" , 0 ) --"�ؼп��~"
		WriteRoleValue( Monster , EM_RoleValue_PID , 1 ) --���`��PID�g�J1
		return false
	end
end
---------�ϥΤ��K����240509�����LUA----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_240509use()

	local Monster = TargetID()
	local Player = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID )
	local BuffLV = FN_CountBuffLevel( Monster , 621299 ) --�ʪ����W�f�r���h��
	local Ani = { 103007 , 103008 }
	local MonsterID ={ }
	MonsterID[103006] = 1 --���� --�Q��
	MonsterID[103007] = 5 --���W
	MonsterID[103008] = 10 --��
	MonsterID[103009] = 20 --�a��

	WriteRoleValue( Monster , EM_RoleValue_Register7 , DBID )
	CancelBuff( Monster , 621299 )
	if BuffLV > 0 then
		AddBuff( Monster , 621299 , BuffLV-1 , -1 )
	else
		WriteRoleValue( Monster , EM_RoleValue_Register7 , 0 )
		AddBuff( Player , 621298 , MonsterID[OrgID]-1 , 7200 )
		ScriptMessage( Player , Player , 0 , "[SC_FIREDAY_2012_8]" ,  C_SYSTEM ) --�b�Ƨ����I
		ScriptMessage( Player , Player , 1 , "[SC_FIREDAY_2012_8]" ,  C_SYSTEM ) --�b�Ƨ����I
		if OrgID == 103009 then
			if CountBodyItem( Player , 530865 ) < 1 then
				GiveBodyItem( Player , 530865 , 1 ) --���ߪ����ͪ�
			end
		end
--		AddBuff( Player , 621879 , 0 , 3 ) --�����԰�
		Sleep(40)
		Hide( Monster )
		SetModeEx( Monster , EM_SetModeType_Move , true ) ---����
		AddBuff( Player , 621879 , 0 , 3 ) --�����԰�
		if OrgID == 103009 then
			DelObj( Monster )
		else
			KillID( Monster , Monster )
--			BeginPlot( Monster , "Lua_ying_fireday_createmoster" , 0 )
		end
	end

	if OrgID == 103007 or 103008 or 103009 then
		CastSpell( Player , Monster , 498402 )
	end
end
------------------------------------
function Lua_ying_fireday_createmoster()

	local Monster = OwnerID()
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )
	local X = ReadRoleValue( Monster , EM_RoleValue_Register1 )
	local Y = ReadRoleValue( Monster , EM_RoleValue_Register2 )
	local Z = ReadRoleValue( Monster , EM_RoleValue_Register3 )
	local Ani
--	Say( Monster , "X="..X.."Y="..Y.."Z="..Z )
	Ani = CreateObj( OrgID , X , Y , Z , 0 , 1 )
	SetModeEx( Ani , EM_SetModeType_SearchenemyIgnore , false ) --���i�Q�j�M
	SetModeEx( Ani , EM_SetModeType_Revive , true )--�i����
	SetFlag( Ani , 544801 , 1 )--�������_��
	Sleep(150)
	AddToPartition( Ani , 0 )
	DelObj( Monster )
end
----------498401�b�Ƥ�_�k�N���X_�ϥ��ˬdLUA--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498401()
	local OID = OwnerID()
	local Type = GameObjInfo_Int( 498401, "ColdownType" ) -- ��o�Ӫk�N���N�o���O(�k�N���X-�I�k�N�o������)

	if ReadRoleValue( OID, EM_RoleValue_Coldown_Item+Type ) == 0 then
		CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_CRAFTING_BEGIN ) --�Ķ��ʧ@
		return true
	end
	return false
end
----------498973�Ť峴���ĪG_�k�N���X_�ϥ��ˬdLUA------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_498973check()

	local Trap = OwnerID()
	local Monster = TargetID()

	while true do
		local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )

		if OrgID == 103006 or 103007 or 103008 or 103009 then
			return true
		end
		Sleep(5)
	end
end
----------498467�񳴨�_�k�N���X_�ϥ��ˬdLUA-----------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498467()

	local OID = OwnerID()

	CallPlot( OID, "PlayMotion" , OID, ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --�ۤU�ʧ@
	CallPlot( OID , "Lua_ying_fireday_mot498467_01", 0 )
	return true
end
----------�����ۤU�ʧ@------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_mot498467_01()

	local OID = OwnerID()

	for i = 1 , 5 do
		if ReadRoleValue( OID, EM_RoleValue_SpellMagicID ) == 0  then --���b�I�k��
			PlayMotion( OID , 150 ) --�ۤU�ʧ@����
			break
		end
		sleep(2)
	end
	PlayMotion( OID , 150 ) --�ۤU�ʧ@����
end
----------621819�w���ʪ�----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_621819()

	local Trap = OwnerID()
	local Monster = TargetID()

	SetModeEx( Monster , EM_SetModeType_Move , false ) ---������
	return true
end
----------621819������Ĳ�o------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_621819over()

	local Monster = OwnerID()

	SetModeEx( Monster , EM_SetModeType_Move , true ) ---����
	return true
end
----------NPC���(119551)��ܼ@��----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_119551talk()

	local Player = OwnerID()
	local NPC = TargetID()
	local PID = ReadRoleValue ( NPC , EM_RoleValue_PID )

	AdjustFaceDir( NPC , Player , 0 ) --NPC���V���a
	if PID == 1 then --���ʶ}�l�i����D��
		LoadQuestOption( Player )
		AddSpeakOption( Player , NPC , "[SC_FIREDAY_2012_4]" , "Lua_ying_fireday_guntrap" , 0 ) --�е��ڤ��K�����M�Ť峴���I
	else --���ʥ��}�l
		LoadQuestOption( Player )
	end
	AddSpeakOption( Player , NPC , "[SC_FIREDAY_02]" , "Lua_ying_fireday_story", 0 ) --�ڷQ���D�����`���Ѩ�
	AddSpeakOption( Player , NPC , "[SC_FIREDAY_2012_3]" , "Lua_ying_fireday_gamestory" , 0 ) --����u�b���X�̡v�ﶵ
	AddSpeakOption( Player , NPC , "[SO_110111_2]" , "Lua_ying_fireday_givegift" , 0 ) --������S
end
-------������S----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_givegift()

	local Player = OwnerID()
	local Buff = CheckBuff( Player , 621298 ) --�b�ƭ�
	local BuffLV = FN_CountBuffLevel( Player , 621298 )

	if Buff == true then
		if BuffLV < 5 then -- 0~4 --�C����1~5
			GiveBodyItem( Player , 725654 , 1 ) --�������Ĥ�
		elseif BuffLV >= 5 and BuffLV < 15 then --5~14 --6~15
			GiveBodyItem( Player , 208918 , 1 ) --�����`����
		elseif BuffLV >= 15 and BuffLV < 35 then --15~34 --16~35
			GiveBodyItem( Player , 208918 , 1 )
			GiveBodyItem( Player , 240377 , 1 ) --���S�]��
		elseif BuffLV >= 35 and BuffLV < 60 then --35~59 --36~60
			GiveBodyItem( Player , 208918 , 2 )
		else --61�H�W
			GiveBodyItem( Player , 208918 , 2 )
			GiveBodyItem( Player , 208932 , 1 ) --��q5�I
		end
		GiveBodyItem( Player , 240996 , 2 ) --�B�N�Ť�
		CancelBuff( Player , 621298 ) --�R���b�ƭ�
		CancelBuff( Player , 621833 ) --�R���n�ߤH(���WBUFF)
	else
		ScriptMessage( TargetID() , Player , 1 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
		ScriptMessage( TargetID() , Player , 0 , "[SC_WEAVE_2011_19]" , C_SYSTEM ) --�A�ä��ŦX�i�������I
	end
	CloseSpeak( Player )
end
-------���WBUFF��������@��---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_aftercel621833()

	local Player = OwnerID()
	local Count = CountBodyItem( Player , 240510 ) --�Ť峴���ƶq

	DelBodyItem( Player , 240509 , 1 ) --���K����
	DelBodyItem( Player , 240510 , Count ) --�Ť峴��
end
-------����u�b���X�̡v-------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_gamestory()

	local Player = OwnerID()
	SetSpeakDetail( Player , "[SC_FIREDAY_2012_9]" ) --�C�~���o�ӮɭԡA�ȴ餧���W���ʪ��̡A�`�|�Q�޲����f�r�񨭡A�g�L���ɶ�����s�A�Ʊ��`�⦳�I�ܥؤF...
end
-------�е��ڤ��K�����M�Ť峴���I-------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_guntrap()

	local Player = OwnerID()
	local Gun = CountBodyItem( Player , 240509 ) --���K����
	local Trap = CountBodyItem( Player , 240510 ) --�Ť峴��
	local Buff = CheckBuff( Player , 621833 ) --���WBUFF
	local Key = CheckFlag( Player , 546014 ) --�w�ѥ[key

	if Buff == false and Key == true then
		SetSpeakDetail( Player , "[SC_THANKS_2011_5]" ) --�A���Ѥw�g���W�ѻP�L�������o�A�Щ��ѦA�~����W�a�C
	elseif Buff == false and Key == false then
		GiveBodyItem( Player , 240510 , 20 )
		GiveBodyItem( Player , 240509 , 1 )
		SetFlag( Player , 546014 , 1 ) --�����ѥ[key
		AddBuff( Player , 621833 , 0 ,  630 ) --���WBUFF
		CancelBuff_NoEvent( Player , 502030 ) --�M���̲ױ�ūBUFF
		CloseSpeak( Player ) --������ܵ���
	elseif Buff == true and Key == true then
		if Gun < 1 then
			GiveBodyItem( Player , 240509 , 1 )
			CloseSpeak( Player ) --������ܵ���
		elseif Gun >= 1 and Trap >= 1 then
			SetSpeakDetail( Player , "[SC_FIREDAY_2012_5]" ) --�A�w�������������K�����M�Ť峴���I�ɶ��򭢡A����e�h�b�ƨ��Ǥp�ʪ��a��
		elseif Trap < 1 then
			SetSpeakDetail( Player , "[SC_FIREDAY_2012_10]" ) --�A�w����L�Ť峴���o�I
		end
	end
end
--------�ڷQ���D�����`���Ѩ�--------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_story()

	local Player = OwnerID()

	SetSpeakDetail( Player , "[SC_FIREDAY_01]" ) --�q�e�A�������ɭ��B�����������....
end
----------���ի��O------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fireday_test_gamebegin( Select ) -- Select ��0�ɡA���ʶ}�l�ASelect ��1�ɡA���ʵ����C

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID ) --Ū�����ê��������Zone
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	local Reg
	local NPC = {}
	NPC[1] = LuaFunc_SearchNPCbyOrgID( Player , 114041 , 200 , 0 ) --BOX
	NPC[2] = LuaFunc_SearchNPCbyOrgID( Player , 119551 , 200 , 0 )
	
	if Select == 0 then
		if CheckID(NPC[1]) == true and CheckID(NPC[2]) == true then
			BeginPlot( NPC[1] , "Lua_ying_fireday_monsterborn" , 0 )
			WriteRoleValue( NPC[2] , EM_RoleValue_PID , 1 ) --�i������~pid=1	
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_			
				RunningMsgEx( Player , 2 , 3 , "[SC_FIREDAY_2012_1]" ) --�ȴ餧���W���\�h�ʪ������줣���̯f�I�`�I�Z��R�������f�����A���b�x�D�i�����_�I�̫e����U�ʪ��̻����̱��K
			end
		else
			DebugMsg( Player , Room , "Error" )
		end
	elseif Select == 1 then
		if CheckID(NPC[1]) == true and CheckID(NPC[2]) == true then
			BeginPlot( NPC[1] , "Lua_ying_fireday_delmonster" , 0 )
			WriteRoleValue( NPC[2] , EM_RoleValue_PID , 0 ) --���ʵ���pid=0
			if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
				RunningMsgEx( Player , 2 , 3 , "[SC_FIREDAY_2012_2]" ) --�]�_�I�̭̪���U�A���G�b�ʪ��̨��W�������̯f�Ȯ���o�F�w�M�K
			end
		else
			DebugMsg( Player , Room , "Error" )
		end
	else
		DebugMsg( Player , Room , "Error" )
	end
end

function Lua_ying_test_621298add(BuffLV)

	CancelBuff( OwnerID() , 621298 )
	AddBuff( OwnerID() , 621298 , BuffLV-1 , 7200 )
end