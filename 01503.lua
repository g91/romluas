function Lua_Hao_GuildwarriorNPC() -- �ǰe��a��NPCĲ�o�@��

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 
	SetPlot( OwnerID() , "range" , "Lua_Hao_GuildwarriorNPC_2" , 100 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_2() -- �b����N���۩I


--	say(OwnerID() , "3" ) --���a
--	say(TargetID() , "4" ) --NPC

------------------------------------------------------------------------------2011.06.13 �ץ��C���i�椤�������n�Υd�I�^���ɡA�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
	CallPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_5" , OwnerID() , 500 )
------------------------------------------------------------------------------
--	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_5" , 0 )

	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		return
	end

	WriteRoleValue( TargetID() , EM_RoleValue_PID ,  1 )
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	Sleep(20)
	ScriptMessage( TargetID() , OwnerID() , 2 , "|cFFFFD700 ".."[SC_GUILD_WARRIOR_11]".. "|r" , 0 ) -- �A�n�A�ڬO�t�d�y�����Ԥh�z�շҪ�[114332]�C
	ScriptMessage( TargetID() , OwnerID() , 0 , "|cFFFFD700 ".."[SC_GUILD_WARRIOR_11]".. "|r" , 0 ) -- �A�n�A�ڬO�t�d�y�����Ԥh�z�շҪ�[114332]�C

	PlayMotion( TargetID() , 116 ) --����
	Sleep(20)
	PlayMotion( TargetID() , 111 ) --�q§ 

end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_3() -- �PNPC��ܫ�AĲ�o���@���C

--	say(OwnerID() , "1" ) --���a
--	say(TargetID() , "2" ) --NPC
	local PlayerVoc = ReadRoleValue( OwnerID() , EM_RoleValue_VOC  ) -- ¾�~
	local Bonus = ReadRoleValue( TargetID() , EM_RoleValue_Register  ) --Reg��
	local Highest = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 ) -- �n�����̰��O��
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

--	Say( TargetID() , "Bonus ="..Bonus )

	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID() , 111 ) --�q§
	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorNPC_4" , 0 )

	if CheckBuff (OwnerID(), 503783) == true then
			SetSpeakDetail( OwnerID(), "[GUILD_TC_HITPLATYPUS_27]"   ) --�A���W�֦��R�B�������ĪG�A�L�k�i��C���C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_GuildTrainer_01", 0 ) --�^�W�@��
	else
		if Bonus == 0 or PlayerVoc == 0 then

			if Highest ~= 0 then
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_18][$SETVAR1="..Highest.."]" ) --[$PLAYERNAME]�A�A���g��o���a�A�I�Ƴ̰��O����<CY>[$VAR1]</CY>�A�ǳƦn�����D�ԤF�ܡH
			else
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_16]"  ) --[$PLAYERNAME]�A�ǳƦn�����D�ԤF�ܡH
			end
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILD_WARRIOR_13]"  , "Lua_Hao_Guildwarriorteaching", 0 )--����W�h����
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILD_WARRIOR_14]"  , "Lua_Hao_Guildwarrior02 ", 0 )--�i�� <CB>�����Ԥh</CB>
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_Guildwarrior_Leave", 0 )--���}�ճ�

		elseif Bonus == 101 then
				SetSpeakDetail(  OwnerID(), "[SC_GUILD_WARRIOR_12]"  ) -- �o�����շҨ즹����A���ݧA�U������{�C
				AddSpeakOption( OwnerID(), TargetID( ), "[SC_CLICKFUNGO04]"  , "Lua_Hao_Guildwarrior_Leave", 0 )--���}�ճ�
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorNPC_4()

--	say(OwnerID() , "3" ) --NPC
--	say(TargetID() , "4" ) --���a
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	while true do
		if GetDistance( OwnerID() , TargetID() )  >= 50 then
			CloseSpeak( TargetID() )
			break
		end
		sleep(5)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior_Leave()--���}�V�m��

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Buff = { 505763 , 505588 , 505582 , 505563 , 505585 , 505560 , 506509 } -- �԰���U�B���h�߱o�B�U�Ҳ��ġB�s�U���B�۵M�����B�����پ��B�շҪ̪�����

	for i = 1 , 7 , 1 do
		CancelBuff( OwnerID() , Buff[i] )
	end

	CloseSpeak( OwnerID() ) 	
	ChangeZone( OwnerID(), 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )	--ChangeZone( OwnerID(), ZoneID �ϰ�ID , �ĴX�h 0 ����0�h -1�N��u�]�ƥ��W�h , x, y, z, Dir)  
	delObj( TargetID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarriorteaching() -- �����Ԥh�о�
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) --���V
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(  OwnerID(), " [SC_GUILD_WARRIOR_4] " ) 
--	�y�����Ԥh�z�ҵ{�`�N�ƶ��G	
--	�@1. �շҮɶ���<CM>15</CM>�����A�u�n�b�ɶ������˼Ĺ�ؼСA�շҵ����ɡA�N����o<CM>�a�A�I��</CM>�C	
--	�@2. �շҶ}�l�A�|�ᤩ<CM>�C�B�ޡB��</CM>�T�ث��A�A�C�ث��A�����M�ݪ��ޯ�A���A�����L�k�@�s�A�i���ݨD���ۥ��ഫ�C	
--	�@3. �u�n���˼Ĺ�ؼСA�N�����o<CM>�j�ƪk�N</CM>�άO�����U�ث��A�U��<CM>�s�W�ޯ�</CM>�C

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_Hao_GuildwarriorNPC_3", 0 )--�^�W�@��
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior02()--�ǳƶ}�l�C���@�NNPC �����аO

--	say(OwnerID() , "5" ) --���a
--	say(TargetID() , "6" ) --NPC
	CloseSpeak( OwnerID() ) 
	local RoomID = ReadRoleValue( TargetID() ,EM_RoleValue_RoomID) 

	BeginPlot( OwnerID() , "Lua_Hao_GuildwarriorGetReady" , 0 )

	SetModeEx( TargetID() , EM_SetModeType_Mark , false )--�аO

	Hide(TargetID())
	Show(TargetID() , RoomID )
	WriteRoleValue(  OwnerID()  , EM_RoleValue_Register+4 ,  TargetID() )  -- �����a�O�oNPC�� Reg4 
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorGetReady() -- �}�l�C��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV  ) 
	local Time = 5

	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 113105, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, false )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, false )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6 , NPC ) --�����a�O�����ê���
	WriteRoleValue( NPC , EM_RoleValue_Register , OwnerID() ) --�����ê���O���a
	ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_7]" , C_SYSTEM ) -- ����N�b5���}�l�C
	sleep(10)

	AddBuff( OwnerID() , 506509 , 0 , -1 ) -- �շҪ̪�����
	AddBuff( OwnerID() , 506580 , 0 , -1 ) -- �w���A�����a���ઽ���e������

	LuaDan_HitShrew_CheckOK(5,5,0)--�˼Ƥ���i��

	BeginPlot( TargetID() , "Lua_Hao_GuildwarriorMenu" , 0 )

		for i = 1 , 5 , 1 do
--			ScriptMessage( OwnerID(),  -1 , 1 , "[SC_GUILD_WARRIOR_3][$SETVAR1="..Time.."]" , C_SYSTEM ) --[$VAR1]
			CancelBuff( OwnerID() , 500675 ) -- �ޱ��ؼм��
			CancelBuff( OwnerID() , 500745 ) -- �ޱ��ؼи���
			CancelBuff( OwnerID() , 501909 ) -- �ޱ��ؼ��H���ӳu
			CancelBuff( OwnerID() , 500535 ) -- �ޱ��t�F����

			if Time == 5 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_5]" , C_SYSTEM )	--	�е��θ���ᤩ���M�ݫ��A
			elseif Time ==3 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	�Ъ`�N�A�b�v�޳��������շҤU�A�L�k�ϥέ즳¾�~�ޯ�C
				ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_20]" , C_SYSTEM )	--	�Ъ`�N�A�b�v�޳��������շҤU�A�L�k�ϥέ즳¾�~�ޯ�C
			elseif Time == 2 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_LOSTTREASURE_10]" , C_SYSTEM )	--	���A�n�B
			elseif Time == 1 then
				ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	����}�l !
				ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_10]" , C_SYSTEM )	--	����}�l !
			end
		sleep(10)
		Time = Time - 1
		end

	CancelBuff( OwnerID() , 506580 )

	if DeadCount == nil then
		DeadCount = {}
	end
	if ScoreCount == nil then
		ScoreCount = {}
	end
	if BuffLv == nil then
		BuffLv = {}
	end 
	if NPCObj1 == nil then
		NPCObj1 = {}
	end
	
	ClockOpen( OwnerID() ,EM_ClockCheckValue_11,900,900,0,"Lua_Hao_Guildwarrior_mission" , "Lua_Hao_Guildwarrior_mission") --�˼ƭp�ɾ�  ( �禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡" )
	DeadCount[RoomID] = 0
	ScoreCount[RoomID] = 0
	BuffLv[RoomID] = 0
	NPCObj1[RoomID] ={}

	BeginPlot ( NPC , "Lua_Hao_GuildWarriorDead" , 0 ) -- �b�c�l�W����{��

	local NPCObj
	local MonsterObj
	local MonsterObj1
	local BuffID = { 504191 , 505958 , 505959 , 505960 } -- �ͩR�E�o�B��q��ܡB������ܡB�g�ɨ�E
	SetSmallGameMenuType( OwnerID() , 7 , 1 ) --�}�Ҥ��� 
	SetSmallGameMenuStr( OwnerID() , 7 , 1 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..DeadCount[RoomID].."]" ) -- ������
	SetSmallGameMenuStr( OwnerID() , 7 , 2 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..ScoreCount[RoomID].."]"  ) -- ����

--	say(OwnerID() , "1" ) --���a
--	say(TargetID() , "2" ) --NPC
	if PlayerLV <= 10 then -- 1 ~ 10
		NPCObj = 102487 -- �Ǫ����� 5
		NPCObj1[RoomID] = { 102487 , 103288 , 103289 } -- �Ǫ����� 5 , 5(��^) , 7(��^)
	elseif PlayerLV <= 20 then -- 11 ~ 20
		NPCObj = 102488 -- �Ǫ����� 15
		NPCObj1[RoomID] = { 102488 , 101270 , 103290 } -- �Ǫ����� 15 , 15(��^) , 17(��^)
	elseif PlayerLV <= 30 then -- 21 ~ 30
		NPCObj = 102489 -- �Ǫ����� 25
		NPCObj1[RoomID] = { 102489 , 102059 , 102062 } -- �Ǫ����� 25 , 27(��^) , 27(���ź�^ )
	elseif PlayerLV <= 40 then -- 31 ~ 40
		NPCObj = 102490 -- �Ǫ����� 35
		NPCObj1[RoomID] = { 102490 , 102080 , 102081 } -- �Ǫ����� 35 , 37(��^) , 37(���ź�^)
	elseif PlayerLV <= 50 then -- 41 ~ 50
		NPCObj = 102491 -- �Ǫ����� 45
		NPCObj1[RoomID] = { 102491 , 102089 , 102061 } -- �Ǫ����� 45 , 47(��^) , 47(���ź�^)
	elseif PlayerLV <= 100 then -- 51 ~ 55
		NPCObj = 102492 -- �Ǫ����� 50
		NPCObj1[RoomID] = { 102492 , 102098 , 102102 } -- �Ǫ����� 50 , 50(��^) , 50(���ź�^)
	end
--ACT1
	MonsterObj = CreateObjByFlag( NPCObj , 780371 , 1 , 1 ) 	-- �إߩǪ��b�X�ФW
	AddToPartition( MonsterObj , RoomID)	--�Ϯ���������X�{
	AddBuff( MonsterObj , 505586 , 0 ,-1)
	SetModeEx( MonsterObj , EM_SetModeType_Searchenemy , false )--����
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	WriteRoleValue( MonsterObj , EM_RoleValue_Register+1 , 1 ) -- �P�wACT1�Ǫ����������y�O����
	SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
--ACT2
--ACT2 ���x
	local norbox = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 4110.2  , 16.3 , 3602.1 , 88.5 , 35 , 35 , 3  , 3 ) -- npcid , x, y ,z , dir , ��m, ��m,  ���, �C�� (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
													--�bXYZ�����OrgID����إߤ@�ӹ�߯x��Wnm�ݬ�1.3.5....Lnm�ݬ������,Wdis����V���Z,Ldis���e�ᶡ�Z
	for x=1 , table.getn(norbox) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox[x] , RoomID )	--�����󲣥�
		WriteRoleValue( norbox[x] , EM_RoleValue_PID , 1 )
		WriteRoleValue( norbox[x] , EM_RoleValue_Register+2 , 1 ) -- �P�wACT2�Ǫ����������y�O����
		SetPlot( norbox[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
--ACT2 �k�x
	local norbox1 = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 3940.7  , 16.3 , 3602.1 , 88.5 , 50 , 50 , 3  , 2 ) -- npcid , x, y ,z , dir , ��m, ��m,  ���, �C�� (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
	for x=1 , table.getn(norbox1) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox1[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox1[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox1[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox1[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox1[x] , RoomID )	--�����󲣥�
		WriteRoleValue( norbox1[x] , EM_RoleValue_PID , 2 )
		WriteRoleValue( norbox1[x] , EM_RoleValue_Register+2 , 1 ) -- �P�wACT2�Ǫ����������y�O����
		SetPlot( norbox1[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
--ACT2 ���x
	local norbox2 = Lua_MadeRectangleByXYZ_noyell(NPCObj1[RoomID][1] , 4277.8  , 16.3 , 3602.1 , 88.5 , 50 , 50 , 3  , 2 ) -- npcid , x, y ,z , dir , ��m, ��m,  ���, �C�� (OrgID , OldX , OldY , OldZ , OldDir , Wdis , Ldis , Wnm , Lnm)
	for x=1 , table.getn(norbox2) do
		local Random = Rand(100)+1
		if Random <= 25 then
			AddBuff( norbox2[x] , BuffID[1] , 0 , -1 )
		elseif Random > 25 and Random <= 50 then
			AddBuff( norbox2[x] , BuffID[2] , 0 , -1 )
		elseif Random > 50 and Random <= 75 then
			AddBuff( norbox2[x] , BuffID[3] , 0 , -1 )
		elseif Random > 75 then
			AddBuff( norbox2[x] , BuffID[4] , 0 , -1 )
		end
		AddToPartition( norbox2[x] , RoomID )	--�����󲣥�
		WriteRoleValue( norbox2[x] , EM_RoleValue_PID , 3 )
		WriteRoleValue( norbox2[x] , EM_RoleValue_Register+2 , 1 ) -- �P�wACT2�Ǫ����������y�O����
		SetPlot( norbox2[x] , "dead" , "Lua_Hao_GuildwarriorACT2" , 0 )
	end
-- ACT2 �p��
	MonsterObj1 = CreateObjByFlag( NPCObj1[RoomID][2] , 780371 , 2 , 1 )
	AddToPartition( MonsterObj1 , RoomID )
	AddBuff( MonsterObj1 , 505764 , 0 , -1 )
	SetPlot( MonsterObj1 , "dead" , "Lua_Hao_GuildwarriorACT2_leader" , 0 )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT1() -- ���ͤp��100���C

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local MonsterID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID ) --�өǦb��Ʈw���Τ@ID
	local Countdead = ReadRoleValue( OwnerID(),EM_RoleValue_PID )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 ) -- �P�wACT1�Ǫ����������y�O����

	Lua_Hao_GuildWarriorCount() -- ���槹�� function ��~���U�]��LScript

--	say(OwnerID() , "5" ) --NPC
--	say(TargetID() , "6" ) --���a
		if Countdead == 18 or Countdead == 38 or Countdead == 58 or Countdead == 78 then 
			BuffLv[RoomID] = BuffLv[RoomID]+1
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- �إߩǪ��b�X�ФW
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--�Ϯ���������X�{
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 ) -- �O��
			SetModeEx( MonsterObj , EM_SetModeType_Searchenemy, false )--����
			AddBuff( MonsterObj , 505587 , BuffLv[RoomID]-1 ,-1)
			Say( MonsterObj , "[SC_111368_3]" )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		elseif Countdead <= 97 then
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- �إߩǪ��b�X�ФW
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--�Ϯ���������X�{
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 )
			AddBuff( MonsterObj, 505586 , NewCountdead ,-1)
			SetAttack( MonsterObj , TargetID() )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		elseif Countdead == 98 then
			BuffLv[RoomID] = BuffLv[RoomID]+1
			local MonsterObj = CreateObjByFlag( MonsterID , 780371 , 1 , 1 ) -- �إߩǪ��b�X�ФW
			local NewCountdead = Countdead+1
			AddToPartition ( MonsterObj , RoomID)	--�Ϯ���������X�{
			WriteRoleValue ( MonsterObj , EM_RoleValue_PID ,  Countdead+1 )
			WriteRoleValue( TargetID() , EM_RoleValue_Register , 4 ) -- �O��
			SetModeEx( MonsterObj , EM_SetModeType_Searchenemy, false )--����
			AddBuff( MonsterObj , 505587 , BuffLv[RoomID]-1 ,-1)
			Say( MonsterObj , "[SC_111368_4]" )
			SetPlot( MonsterObj , "dead" , "Lua_Hao_GuildwarriorACT1" , 0 )
		else
			return true
		end	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) ==1 then-- �P�wACT1�Ǫ����������y�O����
	local NPC = CreateObjbyObj( 205030 , OwnerID() , 1 )
	AddToPartition ( NPC , RoomID )	--�Ϯ���������X�{
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).." ACT1 CreateObj 205030")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- �Ǫ����`�������屼����A�L�k�B���������C
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2()

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --���a

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCPID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--	Say( OwnerID() , NPCPID )

	Lua_Hao_GuildwarriorACT2_Until()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) == 1 then -- �P�wACT2�Ǫ����������y�O����
	local NPC = CreateObjbyObj( 205031 , OwnerID() , 1 )
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- �Ǫ����`�������屼����A�L�k�B���������C
	AddToPartition ( NPC , RoomID )	--�ϮĪG���y�X�{
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 CreateObj 205031")
	end
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_Until() -- �p�Ǧ��`��A�üƭ��� 

-- �X�� 780371
-- 0 �ճ��Щx �B 1 ACT1 �B 2 ACT2 �pBoss �B 3 ACT2 �jBoss �B 4.5 ACT2 �����X���I �B 6.7 ACT2 �k���X���I �B 8.9.10 ACT2 �����X���I

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --���a

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local NPCPID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	local Random2
	local MonsterObj1
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 1 then -- ���x
			Random2 = 8+Rand(3)
--			Say( OwnerID() , NPCPID )
		elseif  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 2 then -- ���x
			Random2 = 6+Rand(2)
		elseif  ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 3 then -- �k�x
			Random2 = 4+Rand(2)
		end

	local Count = Rand(5)+1
	local BuffID = { 504191 , 505958 , 505959 , 505960 } -- �ͩR�E�o�B��q��� �B ������� �B �g�ɨ�E
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 ) -- �O��
	Lua_Hao_GuildWarriorCount()

	for i = 1 , Count , 1 do
		MonsterObj1 = CreateObjByFlag( NPCObj1[RoomID][1] , 780371 , Random2 , Count ) -- NPC�s�� , �X�lID . �X�l��m . �ƶq
		AddToPartition( MonsterObj1 , RoomID)
		local Random = Rand(100)+1
			if Random <= 25 then
				AddBuff( MonsterObj1 , BuffID[1] , 0 , -1 )
			elseif Random > 25 and Random <= 50 then
				AddBuff( MonsterObj1 , BuffID[2] , 0 , -1 )
			elseif Random > 50 and Random <= 75 then
				AddBuff( MonsterObj1 , BuffID[3] , 0 , -1 )
			elseif Random > 75 then
				AddBuff( MonsterObj1 , BuffID[4] , 0 , -1 )
			end
		SetAttack( MonsterObj1 , TargetID() )
		WriteRoleValue( MonsterObj1 , EM_RoleValue_Register+2 , 1 ) -- �P�wACT2�Ǫ����������y�O����
		SetPlot( MonsterObj1 , "dead" , "Lua_Hao_GuildwarriorACT2_Until2" , 0 )
	end
	if Count == 5 then
		ScriptMessage( OwnerID() , -1  , 1 , "[SC_GUILD_WARRIOR_17]" , C_SYSTEM )--	�Ĥ�j�x��ŧ�I
		ScriptMessage( OwnerID() , -1  , 0 , "[SC_GUILD_WARRIOR_17]" , C_SYSTEM )--	�Ĥ�j�x��ŧ�I
	
	end
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_Until2()

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --���a
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 1 ) -- �O��
	Lua_Hao_GuildWarriorCount()

	if ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) == 1 then -- �P�wACT2�Ǫ����������y�O����
	local NPC = CreateObjbyObj( 205031, OwnerID(), 1 )
	AddToPartition ( NPC , RoomID )	--�Ϯ���������X�{
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 UN CreateObj 205031")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACTDelobj" , 0 ) -- �Ǫ����`�������屼����A�L�k�B���������C
	end
--	delobj( OwnerID() )
end
------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorACT2_leader() -- �����p����A����Boss�C

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV  ) 
	local MonsterObj

--	Say( TargetID() ,"I am TargetID" ) --  ���a
--	Say( OwnerID() ,"I am OwnerID" ) --  NPC
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 2 ) -- �O��
	Lua_Hao_GuildWarriorCount()

	MonsterObj = CreateObjByFlag( NPCObj1[RoomID][3] , 780371 , 3 , 1 )

	if PlayerLV > 20 then
		AddBuff( MonsterObj , 505963 , 1 , -1 )
		AddToPartition( MonsterObj , RoomID )
		SetPlot( MonsterObj , "dead" , "Lua_Hao_Guildwarrior_The_End" , 0 )
	else
		AddToPartition( MonsterObj , RoomID )
		SetPlot( MonsterObj , "dead" , "Lua_Hao_Guildwarrior_The_End" , 0 )
	end

	local NPC = CreateObjbyObj( 205031, OwnerID(), 1 )
	AddToPartition ( NPC , RoomID )	--�ϮĪG���y�X�{
--	Say( NPC , "ID = "..ReadRoleValue(OwnerID(),EM_RoleValue_OrgID).."ACT2 LEA CreateObj 205031")
	Beginplot( NPC , "Lua_Hao_GuildWarriorACT2Delobj" , 0 ) -- �Ǫ����`�������屼����A�L�k�B���������C
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorACTDelobj() -- �Ǫ����`�������屼����A�L�k�B���������C

--	say( OwnerID() , "1") --NPC
--	say( TargetID() , "2") --���a

	delobj( TargetID() )
	sleep(50) -- 5���R��Buff�y
	delobj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorACT2Delobj() -- �����p����A�R���p�ǡC

--	Say( TargetID() ,"I am TargetID2" ) --  NPC
--	Say( OwnerID() ,"I am OwnerID2" ) --  Buff�y

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	delobj( TargetID() )

	local TempObj = { 102487 , 102488 , 102489 , 102490 , 102491 , 102492 }

	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 5000 )
	for i = 1 , T1Count , 1 do
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1ID ~= OwnerID() then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
			end
		end
	end
	sleep(100)
	delobj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_The_End() -- �����������A����

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )

	WriteRoleValue( TargetID() , EM_RoleValue_Register , 3 ) -- �O��
	Lua_Hao_GuildWarriorCount()
	delobj( OwnerID() )
	BeginPlot( TargetID() , "Lua_Hao_Guildwarrior_The_End02" , 0 ) -- 
--	Say( OwnerID() ,"NPC" ) -- NPC
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_The_End02() --�����������A�M�����a���W��Reg��&�ճ��ޯ�&���W�Ҧ��Ǫ�

	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID )
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4  )   --�����a���D Register+4 ������NPC

------------------------------------------------------------------------------------------------------------------
			SetModeEx( QNPC   , EM_SetModeType_Mark, true )--�аO
			Hide( QNPC )
			Show( QNPC , RoomID )
			WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 
------------------------------------------------------------------------------------------------------------------
--	local Time = 5
	local A = DeadCount[RoomID]
	local Score = ScoreCount[RoomID]
--	Say( OwnerID() ,"THE END" ) -- ���a
--	Say( TargetID() ,"THE END" ) -- NPC

	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" , C_SYSTEM ) 	--��ܵ���
	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--��ܵ���

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 1 )  -- �a�A�I�ƪ�����Key 
	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Cancel" , 0 ) -- �M�����a���W��Reg��&�ճ��ޯ�&���W�Ҧ��Ǫ��C�@�����ơ����ơH
	Setflag( OwnerID() , 542177 , 1 )
--------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 7 , 2 ) --��������
--------------------------------------------------
	ClockClose( OwnerID() ) 
	Lua_Hao_GuildwarriorMenu_reset() -- �M���ۥ�CD
--	ChangeZone( OwnerID() , 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--�Ǧ^�p�ж�
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_mission()	--	���ȥ��ѫ����A�M��Reg�ȡB�ޯ�B�Ҧ��Ǫ�  ���� . ���u����

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local QNPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+4  )   --�����a���D Register+4 ������NPC
------------------------------------------------------------------------------------------------------------------
		SetModeEx( QNPC   , EM_SetModeType_Mark, true )--�аO
		Hide( QNPC )
		Show( QNPC , RoomID )
		WriteRoleValue(  QNPC  , EM_RoleValue_Register ,  101 ) 
------------------------------------------------------------------------------------------------------------------
--	Say( TargetID() ,"I am TargetID" ) -- ���a
--	Say( OwnerID() ,"I am OwnerID" ) -- ���a
	ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--���嵲��

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5 , 1 )  -- �a�A�I�ƪ�����Key 
	Setflag( OwnerID() , 542177 , 1 )
	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Cancel" , 0 ) -- �M�����a���W��Reg��&�ճ��ޯ�&���W�Ҧ��Ǫ�&������&����
-------------------------------------------------------------------------------------------------------------------
	SetSmallGameMenuType( OwnerID() , 7 , 2 ) --��������
-------------------------------------------------------------------------------------------------------------------
	ClockClose( OwnerID() ) 
	Lua_Hao_GuildwarriorMenu_reset() -- �M���ۥ�CD

--	ChangeZone( AttackID, 354 , RoomID , 5121.3, 13.4, 2515.2, 269.9 )--�Ǧ^�p�ж�
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_Cancel() -- �M�����a���W��Reg��&�ճ��ޯ�&���W�Ҧ��Ǫ��C

--	Say( TargetID() ,"I am TargetID" ) --  ���a
--	Say( OwnerID() ,"I am OwnerID" ) --  ���a
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Score = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )
--	local Score = ScoreCount[RoomID]
	local Okay = ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 )
-------------------------------------------------------------------------------------------------------------------
	if Okay == 1 then
	FN_GuildGame_Honor( OwnerID(), Score )
--	AddRoleValue( OwnerID() , EM_RoleValue_Honor , Score )--�����a�A��
--	ScriptMessage( OwnerID(),  -1, 1, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
--	ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
	end
-------------------------------------------------------------------------------------------------------------------
	local OldScore = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 ) -- �O���̰�����
		if OldScore == 0 then
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6  , Score )	
		elseif OldScore >= Score then
		--	return false
		elseif OldScore < Score then
			ScriptMessage( OwnerID(),  -1, 2, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
			ScriptMessage( OwnerID(),  -1, 0, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
			--���ߧA���}�F���e�O�����a�A�I�ưO���A�{�b���O����<CY>[$VAR1]</CY>�A�o�����շҨ즹����A���ݧA�U������{�C
			WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6  , Score )
		end
-------------------------------------------------------------------------------------------------------------------
	Lua_Hao_Guildwarrior_Clear()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register, 0 ) -- �O������
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1, 0 ) -- �O���������A
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2, 0 ) -- �O�����m���A
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, 0 ) -- �O���]�k���A
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, 0 ) -- �O���_�lNPC&�L���P�_
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+5, 0 ) -- �O�����Ʀh��õ������a�a�A�I��
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+6, 0 ) -- ���ê���A�C��j�M���a�A�P�_���`����@��
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7, 0 ) -- ��Zone�O���ճ����ƥ�
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+8, 0 ) -- �|�L�ϥ�
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9, 0 ) -- �|�L�ϥ�
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+10, 0 ) -- �|�L�ϥ�

	local Buff = {	505540 , 505541 , 505542 ,
			504192 , 504193 , 504194 ,
			505544 , 505545 , 505546 , 505547 , 505548 ,
			505554 , 505555 , 505556 , 505557 , 505558 ,
			505564 , 505565 , 505566 , 505567 , 505568 , 506509 }

	for i = 1 , 22 , 1 do
		CancelBuff( OwnerID() ,Buff[i] )
	end

end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildWarriorCount() -- �p��1���A�p��10���A�j��25���A���ä�50��

	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )

	DeadCount[RoomID] = DeadCount[RoomID] + 1

	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 1
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 1 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 1
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 2 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 10
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 3 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 25
	elseif ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 4 then
		ScoreCount[RoomID] = ScoreCount[RoomID] + 50
	end
	local A = DeadCount[RoomID]
	local Score = ScoreCount[RoomID]

--	DebugMsg( TargetID() , RoomID , "Npc_Dead  = "..A )
--	DebugMsg( TargetID() , RoomID , "Npc_Score = "..Score )

	WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , Score ) -- ChangeZone
--	Say(OwnerID(), "OwnerID")-- NPC
--	Say(TargetID(), "TargetID")-- Player
------------------------------------ �O���O
	SetSmallGameMenuStr( TargetID() , 7 , 1 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" ) -- ������
	SetSmallGameMenuStr( TargetID() , 7 , 2 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]"  ) -- ����
-----------------------------------
	WriteRoleValue( TargetID() , EM_RoleValue_Register , 0 )
	local Tell = { 10 , 20 , 30 , 40 , 50 , 100 , 150 , 200 , 250 , 300 , 350 , 400  , 450 , 500 }
	for i = 1 , table.getn(Tell) , 1 do
		if A == Tell[i] then
			ScriptMessage( TargetID(),  -1, 1, "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."!]" , C_SYSTEM ) 
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorMenu()

--	Say(OwnerID(), "OwnerID")-- NPC
--	Say(TargetID(), "TargetID")-- Player	

	AddBuff( TargetID() , 505540 , 0 , -1 ) -- �C
	AddBuff( TargetID() , 505541 , 0 , -1 ) -- ��
	AddBuff( TargetID() , 505542 , 0 , -1 ) -- ��

end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorSword() -- �������A

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- ���o���a����
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1)

	if CheckBuff( OwnerID() , 504192 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504193 ) -- ���K���S �Q�ʧޯ�
	CancelBuff( OwnerID() ,504194 ) -- ���F���� �Q�ʧޯ�
-------------------------------------------------------------------��
	CancelBuff( OwnerID() ,505554 ) -- �B����
	CancelBuff( OwnerID() ,505555 ) -- �����پ�
	CancelBuff( OwnerID() ,505556 ) -- �L���b��
	CancelBuff( OwnerID() ,505557 ) -- ���@�u�@
	CancelBuff( OwnerID() ,505558 ) -- �s�תŶ�
-------------------------------------------------------------------��
	CancelBuff( OwnerID() ,505564 ) -- �d�����
	CancelBuff( OwnerID() ,505565 ) -- �v�Ť��q
	CancelBuff( OwnerID() ,505566 ) -- ���t�f�P
	CancelBuff( OwnerID() ,505567 ) -- �Ʊ椧��
	CancelBuff( OwnerID() ,505568 ) -- �۵M����

	AddBuff( OwnerID() ,504192 , 0 , -1 ) -- ��d�x�Q�ʧޯ�

	AddBuff( OwnerID() ,505544 , PlayerLV , -1 ) -- �E����
	AddBuff( OwnerID() ,505545 , PlayerLV , -1 ) -- ��{��¶
		if X == 3 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- ���߾ԧq
		AddBuff( OwnerID() ,505547 , PlayerLV , -1 ) -- �̲׽���
		AddBuff( OwnerID() ,505548 , PlayerLV , -1 ) -- �U�Ҳ���
		elseif X==2 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- ���߾ԧq
		AddBuff( OwnerID() ,505547 , PlayerLV , -1 ) -- �̲׽���
		elseif X == 1 then
		AddBuff( OwnerID() ,505546 , PlayerLV , -1 ) -- ���߾ԧq
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorShield() -- ���m���A

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- ���o���a����
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+2)

	if CheckBuff( OwnerID() , 504193 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504192 ) -- ��d�x �Q�ʧޯ�
	CancelBuff( OwnerID() ,504194 ) -- ���F���� �Q�ʧޯ�

-------------------------------------------------------------------�C
	CancelBuff( OwnerID() ,505544 ) -- �E����
	CancelBuff( OwnerID() ,505545 ) -- ��{��¶
	CancelBuff( OwnerID() ,505546 ) -- ���߾ԧq
	CancelBuff( OwnerID() ,505547 ) -- �̲׽���
	CancelBuff( OwnerID() ,505548 ) -- �U�Ҳ���
-------------------------------------------------------------------��
	CancelBuff( OwnerID() ,505564 ) -- �d�����
	CancelBuff( OwnerID() ,505565 ) -- �v�Ť��q
	CancelBuff( OwnerID() ,505566 ) -- ���t�f�P
	CancelBuff( OwnerID() ,505567 ) -- �Ʊ椧��
	CancelBuff( OwnerID() ,505568 ) -- �۵M����

	AddBuff( OwnerID() ,504193 , 0, -1) -- ���K���S �Q�ʧޯ�

	AddBuff( OwnerID() ,505554  , PlayerLV , -1) -- �B����
	AddBuff( OwnerID() , 505555 , PlayerLV , -1 )

		if X == 3 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- �L���b��
			AddBuff( OwnerID() , 505557 , PlayerLV , -1 ) -- ���@�u�@
			AddBuff( OwnerID() , 505558 , PlayerLV , -1 ) -- �s�תŶ�
		elseif X==2 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- �L���b��
			AddBuff( OwnerID() , 505557 , PlayerLV , -1 ) -- ���@�u�@
		elseif X == 1 then
			AddBuff( OwnerID() , 505556 , PlayerLV , -1 ) -- �L���b��
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_GuildwarriorMenuStaff() -- �k�N���A

	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- ���o���a����
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_Register+3)

	if CheckBuff( OwnerID() , 504194 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_DUEL_ERROR_1]" , 0 )
		return
	else
	CancelBuff( OwnerID() ,504192 ) -- ��d�x �Q�ʧޯ�
	CancelBuff( OwnerID() ,504193 ) -- ���K���S �Q�ʧޯ�

-------------------------------------------------------------------�C
	CancelBuff( OwnerID() ,505544 ) -- �E����
	CancelBuff( OwnerID() ,505545 ) -- ��{��¶
	CancelBuff( OwnerID() ,505546 ) -- ���߾ԧq
	CancelBuff( OwnerID() ,505547 ) -- �̲׽���
	CancelBuff( OwnerID() ,505548 ) -- �U�Ҳ���
-------------------------------------------------------------------��
	CancelBuff( OwnerID() ,505554 ) -- �B����
	CancelBuff( OwnerID() ,505555 ) -- �����پ�
	CancelBuff( OwnerID() ,505556 ) -- �L���b��
	CancelBuff( OwnerID() ,505557 ) -- ���@�u�@
	CancelBuff( OwnerID() ,505558 ) -- �s�תŶ�

	AddBuff( OwnerID() ,504194 , 0, -1) -- ���F���� �Q�ʧޯ�

	AddBuff( OwnerID() , 505564 , PlayerLV , -1 ) -- �d�����
	AddBuff( OwnerID() , 505565 , PlayerLV , -1 ) -- �v�Ť��q
		if X == 3 then
			AddBuff( OwnerID() , 505566 , PlayerLV , -1 ) -- ���t�f�P
			AddBuff( OwnerID() , 505567 , PlayerLV , -1 ) -- �Ʊ椧��
			AddBuff( OwnerID() , 505568 , PlayerLV , -1 ) -- �۵M����
		elseif X== 2 then
			AddBuff( OwnerID() , 505566 , PlayerLV , -1 ) -- ���t�f�P
			AddBuff( OwnerID() , 505567 , PlayerLV , -1 ) -- �Ʊ椧��
		elseif X == 1 then
			AddBuff( OwnerID() ,505566 , PlayerLV , -1 ) -- ���t�f�P
		end
	end
end
-------------------------------------------------------------------------------------------------------------------
Function Lua_Hao_Guildwarrior_Buff()

	local Buff = { 505546 , 505547 , 505548 , 505556 , 505557 ,  505558 , 505566 , 505567 , 505568 }
	local Buff2 = { 505763 } -- �԰���U
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) -- ���o���a����
--	say( OwnerID() , "1") --���a
--	say( TargetID() , "2") --���a

	if  CheckBuff( OwnerID() , 504192 ) == false and CheckBuff( OwnerID() , 504193 ) == false and CheckBuff( OwnerID() , 504194 ) == false then
			AddBuff( OwnerID() , Buff2[1] , 0 , -1 )	
	elseif CheckBuff( OwnerID() , 504192 ) == true then
			if CheckBuff( OwnerID() , Buff[1] ) == false then
				AddBuff( OwnerID() , Buff[1] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 ) 
--				say( OwnerID() , "Step 1")
			elseif CheckBuff( OwnerID() , Buff[1] ) == true and  CheckBuff( OwnerID() , Buff[2] ) == false then
				AddBuff( OwnerID() , Buff[2] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 2 ) 
--				say( OwnerID() , "Step 2")
			elseif CheckBuff( OwnerID() , Buff[2] ) == true and  CheckBuff( OwnerID() , Buff[3] ) == false then
				AddBuff( OwnerID() , Buff[3] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 3 ) 
--				say( OwnerID() , "Step 3")
			elseif CheckBuff( OwnerID() , Buff[2] ) == true and  CheckBuff( OwnerID() , Buff[3] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
--				say( OwnerID() , "Step 4")
			end
	elseif CheckBuff( OwnerID() , 504193 ) == true then
			if CheckBuff( OwnerID() , Buff[4] ) == false then
				AddBuff( OwnerID() , Buff[4] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 1 ) 
			elseif CheckBuff( OwnerID() , Buff[4] ) == true and  CheckBuff( OwnerID() , Buff[5] ) == false then
				AddBuff( OwnerID() , Buff[5] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 2 ) 
			elseif CheckBuff( OwnerID() , Buff[5] ) == true and  CheckBuff( OwnerID() , Buff[6] ) == false then
				AddBuff( OwnerID() , Buff[6] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 3 ) 
			elseif CheckBuff( OwnerID() , Buff[5] ) == true and  CheckBuff( OwnerID() , Buff[6] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
			end
	elseif CheckBuff( OwnerID() , 504194 ) == true then
			if CheckBuff( OwnerID() , Buff[7] ) == false then
				AddBuff( OwnerID() , Buff[7] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 1 ) 
			elseif CheckBuff( OwnerID() , Buff[7] ) == true and  CheckBuff( OwnerID() , Buff[8] ) == false then
				AddBuff( OwnerID() , Buff[8] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 2 ) 
			elseif CheckBuff( OwnerID() , Buff[8] ) == true and  CheckBuff( OwnerID() , Buff[9] ) == false then
				AddBuff( OwnerID() , Buff[9] , PlayerLV , -1 )
				WriteRoleValue( OwnerID() , EM_RoleValue_Register+3 , 3 ) 
			elseif CheckBuff( OwnerID() , Buff[8] ) == true and  CheckBuff( OwnerID() , Buff[9] ) == true then
				AddBuff( OwnerID() , Buff2[1] , 0 , -1 )
			end
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildWarriorDead() -- �b���ê���W����A�P�_���a�O�_���`

	BeginPlot( OwnerID() , "Lua_Hao_GuildWarriorDelNPC" , 0 )

	while true do	--�P�_���a���L���`
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
		local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register ) -- Ū��Reg�ȡA��NPC�O�_���a
		local QNPC = ReadRoleValue( PlayerID , EM_RoleValue_Register+4  )   -- Ū��Reg�ȡA�����a�O�_ Register+4 ������NPC
		local Count = SetSearchAllPlayer(RoomID)
		local A = DeadCount[RoomID]
		local Score = ScoreCount[RoomID]
	--	DebugMsg( 0 , RoomID , "DeadCount = "..A )
	--	DebugMsg( 0 , RoomID , "DeadCount = "..Score )

	--	Say( QNPC , "Hello")
		if count ~= 0 then -- �p�Groom�٦����a�h����
			if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) ==1 then -- �p�G����NPC��PID�Ȭ�1 �h break
				break				
			end
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()  -- �^�ǰ��� SetSearchAllNPC ��ҷj�M�쪺�Ҧ�����
				Obj = Role:New( ID ) -- ���P�� ReadRoleValue( ID() , EM_RoleValue_OrgID )	Org = ��Ʈw����ID
				if Obj:IsPlayer() == True then
					if ReadRoleValue( PlayerID , EM_RoleValue_IsDead ) == 1 then --�O���OPlayer���`
--					ScriptMessage( OwnerID() , -1 , 0,"Dead", C_SYSTEM ) 
--					Say( PlayerID , "Dead")-- Player	
						ScriptMessage( PlayerID ,  -1, 2, "[SC_GUILD_WARRIOR_8]" , C_SYSTEM ) 	--���嵲��
						Setflag( PlayerID , 542177 , 1 ) -- �����D�ԺX��
						SetSmallGameMenuType( PlayerID , 7 , 2 )		--��������
						ClockClose( PlayerID )	-- �����p�ƾ�
						Delobj(QNPC)
						WriteRoleValue( PlayerID , EM_RoleValue_Register , 0 ) -- �O������
						WriteRoleValue( PlayerID , EM_RoleValue_Register+1 , 0 ) -- �O���������A
						WriteRoleValue( PlayerID , EM_RoleValue_Register+2 , 0 ) -- �O�����m���A
						WriteRoleValue( PlayerID , EM_RoleValue_Register+3 , 0 ) -- �O���]�k���A
						WriteRoleValue( PlayerID , EM_RoleValue_Register+4 , 0 ) -- �O���_�lNPC&�L���P�_
						WriteRoleValue( PlayerID , EM_RoleValue_Register+5 , 0 ) -- �O�����Ʀh��õ������a�a�A�I��
						WriteRoleValue( PlayerID , EM_RoleValue_Register+6 , 0 ) -- �����a�ѰO���ê���
						WriteRoleValue( PlayerID , EM_RoleValue_Register+7, 0 ) -- ��Zone�O���ճ����ƥ�
						AddRoleValue( PlayerID , EM_RoleValue_Honor , Score )--�����a�A��
						WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) -- �g�JPID�ȡA�i����NPC
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_1][$SETVAR1="..A.."]" , C_SYSTEM ) 		--��ܵ���
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_2][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--��ܵ���
						ScriptMessage( PlayerID , -1 , 1 , "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��
						ScriptMessage( PlayerID , -1 , 0 , "[SC_GUILD_WARRIOR_15][$SETVAR1="..Score.."]" , C_SYSTEM ) 	--�A��o�F [$VAR1] �I�a�A�I��

						local OldScore = ReadRoleValue( PlayerID , EM_LuaValueFlag_UseItem6 ) -- �O���̰�����
							if OldScore == 0 then
								WriteRoleValue( PlayerID , EM_LuaValueFlag_UseItem6  , Score )	
							elseif OldScore >= Score then
							--	return false
							elseif OldScore < Score then
								ScriptMessage( PlayerID ,  -1, 2, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
								--���ߧA���}�F���e�O�����a�A�I�ưO���A�{�b���O����<CY>[$VAR1]</CY>�A�o�����շҨ즹����A���ݧA�U������{�C
								ScriptMessage( PlayerID ,  -1, 0, "[SC_GUILD_WARRIOR_19][$SETVAR1="..Score.."]" , C_SYSTEM )
								--���ߧA���}�F���e�O�����a�A�I�ưO���A�{�b���O����<CY>[$VAR1]</CY>�A�o�����շҨ즹����A���ݧA�U������{�C
								WriteRoleValue( PlayerID , EM_LuaValueFlag_UseItem6  , Score )
							end

						Lua_Hao_Guildwarrior_Clear() -- �M�������W�Ҧ��Ǫ�
						BeginPlot( PlayerID , "Lua_Hao_GuildwarriorMenu_reset" , 0 )
--						Lua_Hao_GuildwarriorMenu_reset() -- �M���k�N��CD�ɶ�
					else
--					ScriptMessage( OwnerID() , -1 , 0,"Live", C_SYSTEM ) 
--					Say( PlayerID , "Live")-- Player	
					end
				end
			end
	--	elseif count == 0 then		-- 2010/11/02 �ץ��C���i�椤�������n�A�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
	--		DelObj(QNPC)
		end
	sleep(10)
	end
end

function Lua_Hao_GuildwarriorNPC_5( Player , Range )	-- 2011.06.13 �ץ��C���i�椤�������n�Υd�I�^���ɡA�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D

	while true do
		if CheckID(Player) == false then	-- �p�G���a���b���ϰ�
			DelObj( OwnerID() )
			break
		elseif CheckDistance( OwnerID() , Player , Range ) == false then	-- �p�G���a���b���ճ��d��
			BeginPlot( Player , "Lua_Hao_Guildwarrior_mission" , 0 )
			DelObj( OwnerID() )
			break
		end
		sleep(10)
	end
--	while true do	--�� NPC �ۤv�P�_�O�_�n�R���ۤv
--	--	Say( OwnerID() , "ok" )
--		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
--		local Count = SetSearchAllPlayer( RoomID )
--	--	Say( OwnerID() , "Count ="..Count )
--		if Count == 0 then	-- 2010/11/02 �ץ��C���i�椤�������n�A�Y�ϥΤ��|�ճ����m���A�i�J��|�ݨ�ⰦNPC�����D
--			DelObj( OwnerID() )
--			break
--		end
--	sleep(10)
--	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildWarriorDelNPC()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	Sleep(9600)	-- 16������A�R�������Ԥh���W�Ҧ��Ǫ��Φۤv�C
	Lua_Hao_Guildwarrior_Clear()
--	BeginPlot( OwnerID() , "Lua_Hao_Guildwarrior_Clear" , 0 )	
--	DelObj( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_ResetUseItem6() -- �M�� Useitem 6 ����
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 , 0 )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_SayUseItem6() -- ���X UseItem 6 ����
	local UseItem = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem6 )
	say( OwnerID() , UseItem )
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guild_War_Key()
	Setflag( OwnerID() , 542177 , 0 )
end
------------------------------------------------------------------------------------------------------------------
function Lua_Hao_Guildwarrior_Clear() -- �M�������W�Ҧ��Ǫ�

--	say( OwnerID() , "1") --���a
--	say( TargetID() , "2") --���a
	local Box = 113105
	local BoxReady = 0
	local TempObj = {	102487 , 103288 , 103289 ,
				102488 , 101270 , 103290 ,
				102489 , 102059 , 102062 ,
				102490 , 102080 , 102081 ,
				102491 , 102089 , 102061 ,
				102492 , 102098 , 102102 	}

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) 
	local T1Obj
	local T1Count = SetSearchRangeInfo( OwnerID() , 5000 )
	for i = 1 , T1Count , 1 do
--		Say( OwnerID() , "OrgID="..TempObj[i] )
		local T1ID = GetSearchResult()
		T1Obj = Role:New( T1ID )	
		if T1Obj:RoomID() == RoomID and T1Obj:IsPlayer() == false then
			local FlagOrgID = T1Obj:OrgID()
			for i = 1 , table.getn(TempObj) do
				if (FlagOrgID == TempObj[i]) then
					DelObj(T1ID)
				end
				if (FlagOrgID == Box ) then
					BoxReady = T1ID
				end
			end
		end
	end
	if BoxReady ~= 0 then
		DelObj(BoxReady)
	end
end
-------------------------------------------------------------------------------------------------------------------
function Lua_Hao_GuildwarriorMenu_reset() -- �M���k�N��CD�ɶ�

	Lua_Hao_ResetColdown( OwnerID() , 494846 , 0) --���߾ԧq
	Lua_Hao_ResetColdown( OwnerID() , 494848 , 0) --�U�Ҳ���
	Lua_Hao_ResetColdown( OwnerID() , 494850 , 0) --�����پ�
	Lua_Hao_ResetColdown( OwnerID() , 494851 , 0) --�L���b��
	Lua_Hao_ResetColdown( OwnerID() , 494852 , 0) --���@�u�@
	Lua_Hao_ResetColdown( OwnerID() , 494853 , 0) --�s�U���
	Lua_Hao_ResetColdown( OwnerID() , 494856 , 0) --���t�f�P
	Lua_Hao_ResetColdown( OwnerID() , 494857 , 0) --�Ʊ椧��
	Lua_Hao_ResetColdown( OwnerID() , 494858 , 0) --�۵M����
end
-------------------------------------------------------------------------------------------------------------------