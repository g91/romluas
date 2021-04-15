--���~ 208289 �b�k�}�� 
function LuaI_208289_Check()  --�ˬd�ϥΦ����~�ɩҦb�ϰ�(���b���~�ϥ��ˬd)
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- �ۤv��zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
--	Say(OwnerID(), MyZoneID)
--	Say(OwnerID(), MyZone)

	if MyZoneID ~= 15 or MyZone ~= 15 then --�p�G���b15
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_THANKSGIVING_2010_01]" , 0 )	--�e�������T��  �����~�ȯ�b�p�ᤧ�C�ϰ�ϥΡC
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_THANKSGIVING_2010_01]" , 0 )	--�T����
		return false
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_THANKSGIVING_2010_02]" , 0 )	--�e�������T��  �A�\��F[208289]�A�޻�[116038]�e�ӳV���a�C
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_THANKSGIVING_2010_02]" , 0 )	--�T����
		return true
	end
end

function Lua_mika_thankday_putfood() -- �\���b�k����  (���b���~���򥻪k�N)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 116039, BaseX, BaseY, BaseZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ��� 116039 �b�k�Y������
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	Beginplot( NPC, "Lua_mika_thankday_fooddie" , 0 )
	sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END )
end

function Lua_mika_thankday_fooddie()
--	say(OwnerID(), "YA")
	sleep(3000)  -- �������ͫ�����ɶ� 5����
	Delobj(OwnerID())
end


-------------------------------------------------
--���~-208288 �Ф򦬶���
function LuaI_208288_Check()  --�ˬd���~�ϥι�H(���b���~�ϥ��ˬd)
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID = 116038 --�����b�k

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or  ( OrgID ~= MonsterID ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_03") , 0 )	--�����~�ȥu�������b�k�ϥΡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_03") , 0 )	--�����~�ȥu�������b�k�ϥΡC
		return false	
	else
		if Checkbuff(TargetID(), 507707 ) == false then -- �p�G��H�S��"�i����buff"
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_11") , 0 )	--[116038]�F�Ӧa�k��F�A�������C
			ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_11") , 0 )	--[116038]�F�Ӧa�k��F�A�������C
			return false
		end
	end
end

function LuaI_208288_Effect()   --���v�P�w 
--OwnerID�����a
--TargetID���b�k
	local random = rand(100)
	if random >65 then  -- ��� ���v��35%
		BeginPlot( OwnerID() , "LuaI_208288_Delitem" , 10 )  
	else --�줣��  65%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_04") , 0 )	--�K���Ф򥢱ѡA�A�ոլݧa�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_04") , 0 )	--�K���Ф򥢱ѡA�A�ոլݧa�I
	end
end

function LuaI_208288_Delitem()   --���\��^        
--Owner �P Target�Ҭ����a
	local bird = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116038, 50 , 0) 
--	Say(bird, "bird.")  
	local random = rand(100)
	if random >10 then  --  ���v��90%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_06") , C_SYSTEM )	--�A��o�F[208291]�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_06") , C_SYSTEM )	--�A��o�F[208291]�I
		GiveBodyItem( OwnerID() , 208291 , 1)	--���� �b�k�Ф�
	else --���v��10%
		local random2 = rand(100)
		if random2 >5 then  --  ���v��95%
			ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208290]]" , C_SYSTEM )  --�A��o�F�}����[$VAR1]�I
			ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208290]]" , C_SYSTEM )  --�A��o�F�}����[$VAR1]�I
			GiveBodyItem( OwnerID() , 208290 , 1)	--���� ���⤧��
		else  --���v��5%
			ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208293]]" , C_SYSTEM )  --�A��o�F�}����[$VAR1]�I
			ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_05][$SETVAR1=[208293]]" , C_SYSTEM )  --�A��o�F�}����[$VAR1]�I
			GiveBodyItem( OwnerID() , 208293 , 1)	--���� �Ӷ�����
		end
	end
	local time = ReadRoleValue(bird , EM_RoleValue_Register ) --�b�k��register
--	Say(bird, time )
	AddRoleValue(bird , EM_RoleValue_Register, 1 )   --����+1
	local time = ReadRoleValue( bird, EM_RoleValue_Register ) --�b�k��register
--	Say(bird, time )
	-- �ؼ��b�k�����i��buff�� ���\�K��5���Ф�� �|�R���i��buff
	if time >= 5 then
		Cancelbuff(bird, 507707)
	--	Say(bird, "buff clear" )
		WriteRoleValue(bird , EM_RoleValue_Register, 0 )   --�����k�s
		local time = ReadRoleValue( bird, EM_RoleValue_Register ) --�b�k��register
	--	Say(bird, time )
		Beginplot(bird, "Lua_mika_thankday_runaway", 10 )  --�b�k
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_THANKSGIVING_2010_13]" , C_SYSTEM )  --[116038]����F���~�A�ਭ�k���F�I
		ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_THANKSGIVING_2010_13]" , C_SYSTEM )  --[116038]����F���~�A�ਭ�k���F�I
	end
end

function Lua_mika_thankday_runaway()  --�b�k�k��+�����@�}�l
--OwnerID���b�k
--	Say(OwnerID(), "owner")
	local Player = SearchRangePlayer( OwnerID() , 60) --�P�_����O�_�����a
	if CheckID( Player[0] ) == true then	--�p�G����XX�������a
		Npcsay(OwnerID(), "[SC_THANKSGIVING_2010_10]" )  --�b�k����	
		AdjustFaceDir(OwnerID(), Player[0] , 180 ) --���V �I��
		WriteRoleValue( OwnerID()  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
		sleep(5)
		Lua_MoveLine( OwnerID() , 30 ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
		sleep(10)
		Hide( OwnerID() )
		sleep(3000) -- x���X�{ 300sec
		Show( OwnerID(), 0 ) 
	end
end
---------------------------------------------------------
--����Ф� 208290 

-- �ϥΪ���Ф� 208290 �l���b�k
function luaI_208290_effect() 
	local random = rand(100)
	if random > 30 then  --  ���\���v��70%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_07") , C_SYSTEM )	--���ߧA���\�l��F�b�k���M�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_07") , C_SYSTEM )	--���ߧA���\�l��F�b�k���M�I
		BeginPlot( OwnerID() , "luaI_208290_Summon" , 10 )  
	else  -- ���Ѿ��v 30%
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_THANKSGIVING_2010_08") , C_SYSTEM )	--�ݨ��b�k�S��ť��A���I��...�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("SC_THANKSGIVING_2010_08") , C_SYSTEM )	--�ݨ��b�k�S��ť��A���I��...�C
	end
end

--�l���b�k���M
function luaI_208290_Summon()
	local random = rand(100)
	if random <= 5 then  --  5%  �r�V�b�k
		BeginPlot( OwnerID() , "LuaI_208290_Summon01" , 0 )  
	elseif random >= 6 and random <= 10 then ------5% ���a�b�k
		BeginPlot( OwnerID() , "LuaI_208290_Summon02" , 0 )  
	elseif random >= 11 and random <= 45 then ------35% �����b�k
		BeginPlot( OwnerID() , "LuaI_208290_Summon03" , 0 )  
	elseif random >= 46 then ----55% ���b�k
		BeginPlot( OwnerID() , "LuaI_208290_Summon04" , 0 )  
	end
end

function luaI_208290_Summon01()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--�r�V�b�k
	local NPC = CreateObj( 101821, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --�ʧ@
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --�b�k����
	sleep(20)  -- ���ͫ�����ɶ� 6sec
	Delobj(NPC)
	sleep(10)
	--�r�V�b�k
	CastSpell( OwnerID(), OwnerID(), 496080 )
end 

function luaI_208290_Summon02()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--���a�b�k
	local NPC = CreateObj( 102871, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --�ʧ@
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --�b�k����
	sleep(20)  -- ���ͫ�����ɶ� 6sec
	Delobj(NPC)
	sleep(10)
	--���a�b�k
	CastSpell( OwnerID(), OwnerID(), 496079 )
end 

function luaI_208290_Summon03()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--�����b�k
	local NPC = CreateObj( 100719, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --�ʧ@
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --�b�k����
	sleep(20)  -- ���ͫ�����ɶ� 6sec
	Delobj(NPC)
	sleep(10)
	--�M�������b�k
	CastSpell( OwnerID(), OwnerID(), 496078 )
end 

function luaI_208290_Summon04()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	--���b�k
	local NPC = CreateObj( 100718, BaseX-20, BaseY-12, BaseZ, BaseDir+180, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_Show, true )--���
	AddToPartition( NPC , RoomID) -- �إߪ���
	PlayMotion( NPC, ruFUSION_ACTORSTATE_PARRY_UNARMED )  --�ʧ@
	Npcsay(NPC, "[SC_THANKSGIVING_2010_09]" )  --�b�k����
	sleep(20)  -- ���ͫ�����ɶ� 6sec
	Delobj(NPC)
	sleep(10)
	--�M�����b�k
	CastSpell( OwnerID(), OwnerID(), 496077 )
end 
----------------------------------------------------

function Lua_thankday_reset()  --���@�`���ʭ��m�� �ϥ�

	local Player = OwnerID()
	SetFlag( Player , 543288, 0)  --�׮۸�
	SetFlag( Player , 543463, 0)  --�x��
	SetFlag( Player , 544418, 0)  --��ѻ�L�}��
	SetFlag( Player , 544560, 0)  --�Ф����
	SetFlag( Player , 545689 , 0)  --�ɱ��{���a
	SetFlag( Player , 546069 , 0)  --�򥢪��b�k�J
	SetFlag( Player , 546091 , 0 ) --�C��P�w��
	-- ���J�p��
	SetFlag(Player,547130,0)--���ʵ���
	SetFlag(Player,547131,0)--������y
	SetFlag(Player,547132,0)--�^�O�O��
	SetFlag(Player,547133,0)--���u�X��
	SetFlag(Player,547139,0)--�����
	BeginPlot ( Player ,"Lua_jiyi_thanks_test",0)
	BeginPlot ( Player ,"lua_kors_thank_RE" , 0)
--	BeginPlot( Player, "Lua_nehelia_thanks_re" , 0 ) --�]�L����
	ScriptMessage( Player ,  Player, 1, "[SC_THANKSGIVING_2010_12]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ���s�`�����o�I
	ScriptMessage( Player ,  Player, 0, "[SC_THANKSGIVING_2010_12]" , C_SYSTEM )  --�A�{�b�i�H���s�i��Ҧ���s�`�����o�I
end
--------------------------------------------------------------------------
function Lua_nehelia_thanks_re()

	local Player = OwnerID()
	local Quest = { 425092 , 425093 , 425098 , 425099 , 425100 , 425161 }
	SetFlag( Player , 546060 , 0 ) --�����������p�v
	SetFlag( Player , 546061 , 0 ) --�����y�A�����w�թԤ�
	SetFlag( Player , 546062 , 0 ) --�����y�A�����Ǻ��S
	SetFlag( Player , 546063 , 0 ) --�����y�A��������w
	SetFlag( Player , 546084 , 0 ) --�����y�A�����쮦
	SetFlag( Player , 546091 , 0 ) --�C��P�w��
	SetFlag( Player , 546101 , 0 ) --�C�����

	for i = 1 , #Quest , 1 do
		if CheckAcceptQuest( Player , Quest[i] ) == true then
			DeleteQuest( Player , Quest[i] )
		end
	end
end