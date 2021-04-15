-- �v��
function LuaS_421537_Check()
	if CountBodyItem( OwnerID() , 203354 ) < 1 then		-- �ժܪ��p���Y��
	 	return false
	end
	if CountBodyItem( OwnerID() , 203357 ) < 1 then		-- �ժܪ��v����
	 	return false
	end
	if CountBodyItem( OwnerID() , 203368 ) < 1 then		-- �ժܪ�����
	 	return false
	end

	return true

end

function LuaS_421539_CHECK()	-- ���୫�Ʈ��_�c
	if CheckFlag( OwnerID() , 542292 ) == true or CountBodyItem( OwnerID() , 203372 ) > 0 then
		--ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421539_1]" , 0 )	--  �A�S���o�{���󪫫~�I�I
		return false
	else
		return true
	end
end

function LuaS_421533_Complete()
	if CountBodyItem( TargetID() , 203355 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  ���֯ȤW���M�_�u����s�F�I�I
		DelBodyItem( TargetID() , 203355 , 1 )
	else
	end
	return true
end

function LuaS_421536_Complete()
	if CountBodyItem( TargetID() , 203358 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  ���֯ȤW���M�_�u����s�F�I�I
		DelBodyItem( TargetID() , 203358 , 1 )
	else
	end
	return true
end

function LuaS_421538_Complete()
	if CountBodyItem( TargetID() , 203369 ) >= 1 then
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_421533_1]" , C_SYSTEM )		--  ���֯ȤW���M�_�u����s�F�I�I
		DelBodyItem( TargetID() , 203369 , 1 )
	else
	end
	return true
end

function LuaS_421539_Complete()
	if CountBodyItem( TargetID() , 203371 ) >= 1 then
		DelBodyItem( TargetID() , 203371 , 1 )
	else
	end
	return true
end

function LuaS_421537_Do()
	if DelBodyItem( OwnerID() , 203354 , 1 ) and DelBodyItem( OwnerID() , 203357 , 1 ) and DelBodyItem( OwnerID() , 203368 , 1 ) then		-- �ժܪ��p���Y���B �ժܪ��v�����B �ժܪ�����
		BeginPlot( OwnerID() , "LuaS_421537_Do_01" , 0 )
		CastSpell( TargetID() , TargetID() , 492217 )	-- ��t�S�� ���i
	end

	return true

end

function LuaS_421537_Do_01()
	Sleep( 20 )
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421537_01]" , C_SYSTEM )		-- �Ať��@�n�۵�ŶǨӪ��C�q�I�I
end

function LuaS_421543_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111818 , 780214 , 0 , 1 )
	AddToPartition( NPC1 , 0 )
	WriteRoleValue( NPC1 , EM_RoleValue_IsWalk , 0 )
	local X3 , Y3 , Z3
	X3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_X )
	Y3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_Y )
	Z3 = GetMoveFlagValue( 780214 , 3 , EM_RoleValue_Z )
	local Obj1 = Role:new( NPC1 )
	Obj1:Move(  X3 , Y3 , Z3  )
	Sleep( 5 )

	local NPC2 = CreateObjByFlag( 111819 , 780214 , 1 , 1 )
	AddToPartition( NPC2 , 0 )
	WriteRoleValue( NPC2 , EM_RoleValue_IsWalk , 0 )
	local X4 , Y4 , Z4
	X4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_X )
	Y4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_Y )
	Z4 = GetMoveFlagValue( 780214 , 4 , EM_RoleValue_Z )
	local Obj2 = Role:new( NPC2 )
	Obj2:Move(  X4 , Y4 , Z4  )
	Sleep( 5 )

	local NPC3 = CreateObjByFlag( 111822 , 780214 , 2 , 1 )
	AddToPartition( NPC3 , 0 )
	WriteRoleValue( NPC3 , EM_RoleValue_IsWalk , 0 )
	local X5 , Y5 , Z5
	X5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_X )
	Y5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_Y )
	Z5 = GetMoveFlagValue( 780214 , 5 , EM_RoleValue_Z )
	local Obj3 = Role:new( NPC3 )
	Obj3:Move(  X5 , Y5 , Z5  )

	Sleep( 70 )

	SetPosByFlag( NPC1 , 780214 , 3 )
	SetPosByFlag( NPC2 , 780214 , 4 )
	SetPosByFlag( NPC3 , 780214 , 5 )

	SetPosByFlag( OwnerID() , 780214 , 6 )

	Say( NPC1 , "[SC_421543_1]" )				-- �O�H�q�R��ĳ���j�H�A����W���ШD�z�@�w�n�q�L��ĳ��...
	Sleep( 15 )
	Say( OwnerID() , "[SC_421543_2]" )				-- �Q����p�A�ŹD���A���O�ڤ��@�N���A�o�Ӧ��A�ӬO���ת��q�L�A�����̾a���ĳ�|�벼��M�A�o�]�Oĳ�|�s�b���N�q�A���O�ܡH
	Sleep( 30 )
	Say( NPC1 , "[SC_421543_3]" )				-- �ڷ�M���աA���Oĳ���j�H�A�p�G�z��B�Τ@�U�zĳ�����v�O...
	Sleep( 30 )
	Say( OwnerID() , "[SC_421543_4]" )				-- �o�ڮ��ȿ줣��...
	Sleep( 20 )
	Say( NPC1 , "[SC_421543_5]" )				-- .........
	Sleep( 20 )
	Say( NPC1 , "[SC_421543_6]" )				-- �S���Y�A���O���o�����͸ܻP���U�ӥi��|�o�ͪ��Ʊ��A�b���A�ڥ���F�ڪ���ѡC
	Sleep( 30 )

	local X1 , Y1 , Z1
	X1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_X )
	Y1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_Y )
	Z1 = GetMoveFlagValue( 780214 , 1 , EM_RoleValue_Z )
	local Obj4 = Role:new( NPC2 )
	Obj4:Move(  X1 , Y1 , Z1  )
	Sleep( 5 )

	local X2 , Y2 , Z2
	X2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_X )
	Y2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_Y )
	Z2 = GetMoveFlagValue( 780214 , 2 , EM_RoleValue_Z )
	local Obj5 = Role:new( NPC3 )
	Obj5:Move(  X2 , Y2 , Z2  )
	Sleep( 5 )

	local X , Y , Z
	X = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_X )
	Y = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_Y )
	Z = GetMoveFlagValue( 780214 , 0 , EM_RoleValue_Z )
	local Obj6 = Role:new( NPC1 )
	Obj6:Move(  X , Y , Z  )

	Sleep( 55 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_111669()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	if CheckAcceptQuest( OwnerID() , 421544 ) == true and CheckFlag(OwnerID() , 542186 ) == false then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_421544_6]" , "LuaS_421544_About_1" , 0 )		-- �ﶵ�A�����ŹD��ĳ��......
	end
end

function LuaS_421544_About_1()
	SetSpeakDetail( OwnerID() , "[SC_421544_7]" )		--�O����ĳ���n�A�L�ӽլd���ܡH�ŹD��ĳ�����Ӧb�٦bĳ�|�਺��A�A�i�H�L�h�ݬݡC�p�G���H�ݰ_�A�������A�A�N���O�ӥ������H�N��F�C
	AddSpeakOption( OwnerID() , TargetID() , "[SC_421544_8]" , "LuaS_421544_About_2" , 0 )		-- �ﶵ�A���¡A�ک��դF�I
end

function LuaS_421544_About_2()

	CloseSpeak( OwnerID() )
	SetFlag( OwnerID() , 542186 , 1 )
	Sleep( 10 )
	BeginPlot( TargetID() , "LuaS_421544_Complete" , 0 )

end

function LuaS_421544_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111818 , 780215 , 0 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC2 = CreateObjByFlag( 111819 , 780215 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC3 = CreateObjByFlag( 111822 , 780215 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Sleep( 20 )

	Say( NPC2 , "[SC_421544_1]" )				-- �ŹD��ĳ���A�ڷQ�����z���դ@�I�A�p�G�z�L�k���Q���o�Ӵ��׳q�L���ܡA���ڭ̩ҵ����z����U�A���ȱo�Ȱ��F�I
	Sleep( 15 )
	Say( NPC1 , "[SC_421544_2]" )				-- �d�U�O�o�򻡡A�ثe�u�O�y�L�D�J�@�Ǥp����}�F�A�ڷ|�Q�k�������׳q�L���C
	Sleep( 40 )
	Say( NPC3 , "[SC_421544_3]" )				-- ����A����ť��z���n�����A�p�G�u������A�ڷQ�A�ڭ̷|�t�~�A�䦳��O��ĳ���ӦX�@�C
	Sleep( 15 )
	Say( NPC2 , "[SC_421544_4]" )				-- �S���A�z�O���D���A���D�`�h��ĳ�������ݵ۱����ڭ̪���U�C
	Sleep( 20 )
	Say( NPC1 , "[SC_421544_5]" )				-- .........�ک��դF�C
	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 30 )

	DisableQuest( OwnerID() , false )

	return true

end

function LuaS_203380()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111679 , 44 )
	--local OBJ = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJ == 111679 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203380]" , 0 )	--  �o����S�����Դ��S�������X�ӡI
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203380]" , C_SYSTEM )	
		return false
	end
end

function LuaS_203380_1()
	SetFlag(OwnerID() , 542251 , 1 )
	UseItemDestroy()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111679 , 44 )
	BeginPlot( Tomb , "LuaS_421548_Complete" , 0 )
	return true
end

function LuaS_421548_Complete()

	Hide( OwnerID())

	local NPC1 = CreateObjByFlag( 111823 , 780216 , 3 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC2 = CreateObjByFlag( 111819 , 780216 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC3 = CreateObjByFlag( 111822 , 780216 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Sleep( 20 )

	Say( NPC1 , "[SC_421548_1]" )				-- �O�A�̻����Ӷ��ƥu�|���H���g�A�ڤ~�������A�̸����ĮĪ��I
	Sleep( 30 )
	Say( NPC1 , "[SC_421548_2]" )				-- ���G�{�b�ڪ������̥������r���`�A�A�̻��ӫ���I
	Sleep( 15 )
	Say( NPC2 , "[SC_421548_3]" )				-- �i��O���q�U�o�ӭ��~�|...
	Sleep( 30 )
	Say( NPC3 , "[SC_421548_4]" )				-- �Ʊ��w�g�o�ͤF�A�A�]���Q���o��ƪ��u�۶ǥX�h�a�H
	Sleep( 20 )
	Say( NPC3 , "[SC_421548_5]" )				-- �N�F�a�I��o�ǫ���N�F�C
	Sleep( 15 )
	Say( NPC1 , "[SC_421548_6]" )				-- �N...�I�A�n�ڿN�F�ڪ����H�I
	Sleep( 30 )
	Say( NPC2 , "[SC_421548_7]" )				-- �����A���H�ӤF�A�����}�o�̡C
	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 30 )

	Show( OwnerID() , 0 )

	return true
end

function LuaS_421555_Complete()

	DisableQuest( OwnerID() , true )

	local NPC1 = CreateObjByFlag( 111699 , 780218 , 3 , 1 )
	AddToPartition( NPC1 , 0 )
	DisableQuest( NPC1 , true )

	local X1 , Y1 , Z1
	X1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_X )
	Y1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_Y )
	Z1 = GetMoveFlagValue( 780218 , 1 , EM_RoleValue_Z )
	local Obj1 = Role:new( NPC1 )
	Obj1:Move(  X1 , Y1 , Z1  )

	Sleep( 50 )

	SetPosByFlag( NPC1 , 780218 , 1 )
	SetPosByFlag( OwnerID() , 780218 , 2 )

	Sleep( 5 )
	Say( NPC1 , "[SC_421555_1]" )				-- �����k�S�A�A�S�A�I�]�k�F�I
	Sleep( 15 )
	Say( OwnerID() , "[SC_421555_2]" )				-- �o���O�]�k�A�o�O�ĭۼw�Ѯv���ڪ��s���Ť�O�q�I
	Sleep( 20 )
	Say( NPC1 , "[SC_421555_3]" )				-- �ĭۼw�I�S�O�ĭۼw�I���O�i�D�A���n�A��L�ǪF��F�ܡH
	Sleep( 15 )
	Say( OwnerID() , "[SC_421555_4]" )				-- �i�O�A����...
	Sleep( 10 )
	Say( NPC1 , "[SC_421555_5]" )				-- �ڤ��Q�Ať�A�����I�p�G�A�A�~��L��ɪ��l�D�o�ǥi�ȤO�q�A�N�û����O�Q�A��ڻ��ܡI
	Sleep( 50 )

	local X , Y , Z
	X = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_X )
	Y = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_Y )
	Z = GetMoveFlagValue( 780218 , 3 , EM_RoleValue_Z )
	local Obj2 = Role:new( NPC1 )
	Obj2:Move(  X , Y , Z  )

	Sleep( 30 )

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end

	DisableQuest( NPC1 , false )
	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_421563_Complete()
	DisableQuest( OwnerID() , true )

	local NPC2 = CreateObjByFlag( 111819 , 780219 , 1 , 1 )
	AddToPartition( NPC2 , 0 )

	local NPC1 = CreateObjByFlag( 111822 , 780219 , 3 , 1 )
	AddToPartition( NPC1 , 0 )

	local NPC3 = CreateObjByFlag( 111819 , 780219 , 2 , 1 )
	AddToPartition( NPC3 , 0 )

	Say( NPC1 , "[SC_421563_1]" )				-- �N�O�L�I�I
	Sleep( 10 )
	Say( NPC2 , "[SC_421563_2]" )				-- �O���L�������}�o�̡I�I
	Sleep( 10 )
	Say( NPC3 , "[SC_421563_3]" )				-- ���F�L�I�I
	Sleep( 10 )

	CastSpell( NPC1 , OwnerID() , 492224 )	-- ��t�S�� ���y�N
	Sleep( 5 )
	CastSpell( NPC2 , OwnerID() , 492224 )	-- ��t�S�� ���y�N
	Sleep( 5 )
	CastSpell( NPC3 , OwnerID() , 492224 )	-- ��t�S�� ���y�N

	Sleep( 10 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )

	Sleep( 10 )

	Say( NPC1 , "[SC_421563_4]" )				-- ���ȧ����A���}�I

	if CheckID( NPC1 ) == true then DelObj( NPC1 ) end
	if CheckID( NPC2 ) == true then DelObj( NPC2 ) end
	if CheckID( NPC3 ) == true then DelObj( NPC3 ) end

	Sleep( 50 )

	DisableQuest( OwnerID() , false )
	Sleep( 5 )

	LuaFunc_ResetObj( OwnerID() )

	return true

end

function LuaS_421571_Complete()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421571]" , 0 )	--  �A�]�������O�A�I��X���ϯd�s�󦹦a���O�СC
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421571]" , C_SYSTEM )
	BeginPlot( TargetID() , "LuaS_421571_Show" , 0 )
	return 1
end

function LuaS_421571_Show()
	Sleep( 10 )
	local WaterElf = CreateMonsterByBOSSBatch( 111752 , OwnerID() , 3 , -20 )	-- �����Ϫ�

	Say( WaterElf , "[SC_421571_1]" )		-- ���j�ɴ��A���ǤH���ϥβŤ��y�ۤv������H��o�O�q�A�o�ǧ�y�ۤv���H���A��ӳQ�٬��]�ڡC
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_2]" )		-- ���[��A�@�ɥ����i�J���]�کҲզ�����ɶ��h�Ϊv���ɥN�A�]�ڶ}�l�j�W�ҰQ�ﲧ�v�������ϧܶդO�C
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_3]" )		-- ����A�ѤH���d�ĩi�Ҳλ⪺�]�ڤϧܭx�A�ѥ_��j���}�l�i�}�����A�ì@�ϳ\�h�H�̲����]�ڪ����`�C
	Sleep( 30 )
	Say( WaterElf , "[SC_421571_4]" )		-- ���O�A�b�֦��u�Ť�C-�大§�g�v���A�大���X�{����A�ϧܭx���{�e�ҥ������M��......
	Sleep( 30 )

	Sleep( 30 )
	if CheckID( WaterElf ) == true then DelObj( WaterElf ) end
end


function LuaI_111762()

	while true do
		Sleep( 1800 )
		DisableQuest( OwnerID() , true )
		local P = Rand( 5 ) + 1
		if P == 1 then
			SetPosByFlag( OwnerID(), 780220 , 1 )
		elseif P == 2 then
			SetPosByFlag( OwnerID(), 780220 , 2 )
		elseif P == 3 then
			SetPosByFlag( OwnerID(), 780220 , 3 )
		elseif P == 4 then
			SetPosByFlag( OwnerID(), 780220 , 4 )
		else
			SetPosByFlag( OwnerID(), 780220 , 5 )
		end
		DisableQuest( OwnerID() , false )
	end

end

function LuaS_421572_CHECK()
	if CountBodyItem( OwnerID(), 203409 ) >= 1 then	-- ù�L
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421572_1]" , 0 )	--  �A�S���i�H�`�J�L���ت����~�I�I
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421572_1]" , C_DEFAULT )
		return false
	end
end

function LuaS_421572_Complete()
	if DelBodyItem( OwnerID(), 203409 , 1 ) then 
		BeginPlot( OwnerID() , "LuaS_421572_Show" , 0 )
	end
	return true
end

function LuaS_421572_Show()
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()
	local Goblin = CreateObj( 111825 , BaseX -5 , BaseY, BaseZ + 5 , BaseDir + 180 , 1 )	-- �����L
	AddToPartition( Goblin , BaseRoom )
	Sleep( 10 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421572_2]" , 0 )		-- ��M�X�{�@�������L�m���F�A���W��ù�L�I�I
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421572_2]" , C_SYSTEM )
	PlayMotionEX( Goblin , ruFUSION_ACTORSTATE_ATTACK_1H , ruFUSION_ACTORSTATE_NORMAL )
	Sleep( 20 )
	if CheckID( Goblin ) == true then DelObj( Goblin ) end
end

function LuaS_421574_Complete()
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421571]" , 0 )	--  �A�]�������O�A�I��X���ϯd�s�󦹦a���O�СC
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421571]" , C_SYSTEM )
	BeginPlot( TargetID() , "LuaS_421574_Show" , 0 )
	return true
end

function LuaS_421574_Show()
	Sleep( 10 )
	DisableQuest( OwnerID() , true )

	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
 	local BaseY = Obj :Y()
 	local BaseZ = Obj :Z()
	local BaseDir = Obj:Dir()
	local BaseRoom = Obj:RoomID()
	local WaterElf = CreateObj( 111824 , BaseX +20 , BaseY + 5 , BaseZ + 35 , BaseDir , 1 )	-- ���Ͽժ�
	SetModeEx( WaterElf , EM_SetModeType_Gravity , false )		-- �������O
	AddToPartition( WaterElf , BaseRoom )

	Sleep( 10 )
	Say( WaterElf , "[SC_421574_1]" )		-- �ڳ̤��֨������εo�ͤF......
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_2]" )		-- �]�ڻP�H���������E�P�Ĭ�A�y���\�h���ˤ`�P�����A�M�ӧګo�L�ର�O�C
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_3]" )		-- �a�Ϧb�ڷ��O�U�����U�A���µL�k���w�w�Ĵ��������Ԫ����Y�C
	Sleep( 30 )
	Say( WaterElf , "[SC_421574_4]" )		-- ���o�w�A�ڥu�n�����d�ĩi�A���U�H���i��ʦL����......
	Sleep( 30 )

	Sleep( 30 )
	if CheckID( WaterElf ) == true then DelObj( WaterElf ) end
	DisableQuest( OwnerID() , false )
end

function LuaP_Goblin_Dead()
	SetIdleMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
end

function LuaS_111763_ShowFire()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111763 then
		CastSpell( TargetID() , TargetID() , 492269 )	-- ��t�S�� ���N
	end
	return true
end

function LuaS_111764_Do()
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 111764 then
		local Monster = CreateMonsterByBOSSBatch( 101443 , TargetID() , 0 , 0 )	-- ���p���y�l����
		SetAttack( Monster , OwnerID() )
		Say( Monster , "[SC_111764_1]" )		-- ��Q����ù�L�I
		BeginPlot( Monster , "LuaS_101368_Monster" , 0 )
	end
	return true
end

function LuaS_101368_Monster()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --�ˬd�O�_���}�԰�
			Sleep( 10 )	-- �@���ˬd�@��	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end