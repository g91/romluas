--702759 �U�t����_�a�j�D�J

------------------------------  �n�� ------------------------------ 

function lua_mika_2012hallow_obj1_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj1_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj1_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a
	
	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj1_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj1_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������
			BeginPlot( T_ID, "lua_mika_2012hallow_obj1_04" , 0 )  -- �X�{��
			sleep(10)

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �X�{��
function lua_mika_2012hallow_obj1_04()
	local O_ID = OwnerID() -- �a�O
	local T_ID = TargetID()  -- ���a
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)

	local OBJ = LuaFunc_CreateObjByObj ( 121405 , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( OBJ, EM_SetModeType_Strikback, false )--����
	SetModeEx( OBJ, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( OBJ, EM_SetModeType_Obstruct, false )--����
	SetModeEx( OBJ, EM_SetModeType_Mark, true )--�аO
	SetModeEx( OBJ, EM_SetModeType_Move, true )--����
	SetModeEx( OBJ, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OBJ, EM_SetModeType_HideName, true )--�W��
	SetModeEx( OBJ, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( OBJ, EM_SetModeType_Show , True ) --�����
	SetModeEx( OBJ, EM_SetModeType_Fight , false )--�i�������
	AddToPartition( OBJ, RoomID) 

	local light = LuaFunc_CreateObjByObj ( 121408 , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( light, EM_SetModeType_Mark, false )--�аO
	SetModeEx( light, EM_SetModeType_Strikback, false )--����
	SetModeEx( light, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( light, EM_SetModeType_Obstruct, false )--����
	SetModeEx( light, EM_SetModeType_Move, false )--����
	SetModeEx( light, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( light, EM_SetModeType_HideName, true )--�W��
	SetModeEx( light, EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( light, EM_SetModeType_Show , True ) --�����
	SetModeEx( light, EM_SetModeType_Fight , false )--�i�������
	AddToPartition( light, RoomID) 
	Hide( light )
	sleep(5)
	Show( light ,RoomID)

	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_16]".. "|r" , 0 )  -- ���A�A�A�A��O��[121405]�r�I�A�A�A�A��
	WriteRoleValue(OBJ, EM_RoleValue_Register+1, light )
	BeginPlot(OBJ, "lua_mika_2012hallow_obj1_05", 0 ) 
end

--  �_�cĲ�I�@��
function lua_mika_2012hallow_obj1_05()
	local O_ID = OwnerID() -- ��
	Setplot(O_ID, "Touch", "lua_mika_2012hallow_obj1_06", 60)
end

-- �I���_�c�@��
function lua_mika_2012hallow_obj1_06()
	local OID = OwnerID()  --���a
	local TID = TargetID()  -- ��

	GiveBodyItem( OID , 720724 , 1 );    -- �����y
	AddRoleValue(OID, EM_RoleValue_Register+9, 1 )  -- �O�����a�}���_�c��
	local count = ReadRoleValue(OID, EM_RoleValue_Register+9 )
--	SAY(OID, "treasure get ="..count )
	local light = ReadRoleValue(TID, EM_RoleValue_Register+1 )
	Setplot(TID, "Touch", "", 0)
	Delobj(light)
	Delobj(TID)
end


------------------------------  �Q���� ------------------------------ 
function lua_mika_2012hallow_obj2_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj2_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj2_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj2_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj2_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������
			BeginPlot( T_ID , "lua_mika_2012hallow_obj2_04" , 0 )  -- �X�{�a��
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------------  03 ���u��  ------------------------------ 
function lua_mika_2012hallow_obj3_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj3_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj3_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj3_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj3_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������

			BeginPlot( T_ID , "lua_mika_2012hallow_obj3_04" , 0 )  -- �X�{���u��
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �X�{���u��
function lua_mika_2012hallow_obj3_04()
	local O_ID = OwnerID() -- �a�O
	local T_ID = TargetID()  -- ���a
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)

	local OBJ = LuaFunc_CreateObjByObj ( 121412 , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--����
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( OBJ    , EM_SetModeType_Move, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --���
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( OBJ, RoomID) 

	ScriptMessage( OBJ  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_18]".. "|r" , 0 ) 
	NPCSAY(OBJ, "[SC_2012HALLOW_MALA_13]" )	-- ������ӳå��_���ڬ����H
	BeginPlot(OBJ, "lua_mika_2012hallow_obj3_05", 0 )
end

function lua_mika_2012hallow_obj3_05()
	local OID = OwnerID()
	setplot(OID, "touch", "lua_mika_2012hallow_obj3_06", 30 )
end

function lua_mika_2012hallow_obj3_06()
	local OID = OwnerID()  --���a
	local TID = TargetID()  -- ��

	if CheckBuff(TID, 623500) == true then  -- ��cd
		NPCSAY(TID, "[SC_2012HALLOW_MALA_25]" )	-- ���ڥ𮧤@�U�a�A�H�H�I
	else
		if CheckBuff(OID, 623466)  == false then  -- buff ���u��
			WriteRoleValue(OID, EM_RoleValue_Register+3, TID)  -- �N�ʼg�J���aR+3
			WriteRoleValue(TID, EM_RoleValue_Register+3, OID)  -- �N���a�g�J��R+3
			ScriptMessage( TID  , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_32]".. "|r" , 0 ) 
			AddBuff(OID, 623466, 0, -1 )  -- �����a�ޯ�Buff X����
		else
			NPCSAY(TID, "[SC_2012HALLOW_MALA_14]" )	-- ���F���a�I�O���ڵ��I
		end
	end
end

--  �k�N���X �ˬd
function lua_mika_2012hallow_obj3_07()
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- �ؼ�
	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID ) -- �ؼЪ�orgid 
	local pumpkin = ReadRoleValue(OID, EM_RoleValue_Register+3 )  -- ���u��

	if OrgID == 121407 then  -- �X��
		return true
	else
		NPCSAY(pumpkin, "[SC_2012HALLOW_MALA_15]" )	-- �ڬ����F�o�å�A���ӧO���a�I
		return false
	end
end


-- �򥻪k�N ����
function lua_mika_2012hallow_obj3_08()
	local OID = OwnerID()  -- ���a
	local TID = TargetID()  -- �ؼ�
	local pumpkin = ReadRoleValue(OID, EM_RoleValue_Register+3 )  -- ���u��

	CancelBuff(OID, 623466 )
	CastSpell(pumpkin, TID, 850414 )   -- ���u�F��  �u���S��
	Beginplot(TID, "lua_mika_2012hallow_obj3_09" ,0 )
	AddBuff(pumpkin, 623500, 0, 60 )  -- ����Buff X���� CD��  �w�t
	WriteRoleValue( OID, EM_RoleValue_Register+3, 0 )  -- �M��R3

end

function lua_mika_2012hallow_obj3_09()
	local OID = OwnerID()  -- �X��
	local mist = ReadRoleValue(OID, EM_RoleValue_Register+8 )  -- ���ͪ���

	sleep(5)
	Delobj(mist)
	sleep(5)
--	say(OID, "dead")
	Delobj(OID)

end


------------------------------ 04 ����  ------------------------------ 

function lua_mika_2012hallow_obj4_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj4_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj4_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj4_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj4_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������

			BeginPlot( T_ID , "lua_mika_2012hallow_obj4_04" , 0 )  -- �X�{����
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �X�{����
function lua_mika_2012hallow_obj4_04()
	local O_ID = OwnerID() -- �a�O
	local T_ID = TargetID()  -- ���a

	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local objid = 121404 -- ��������id

	local OBJ = LuaFunc_CreateObjByObj ( objid , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( OBJ    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--����
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Move, true )--����
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --�����
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( OBJ, RoomID)  -- �Ϫ��󲣥�
	Hide( OBJ )
	sleep(5)
	Show( OBJ ,RoomID)

	ScriptMessage( T_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_19]".. "|r" , 0 ) 

	BeginPlot( OBJ , "lua_mika_2012hallow_obj4_05" , 0 )  
	Delobj(O_ID)  -- �R���a�O

end

function lua_mika_2012hallow_obj4_05()
	local O_ID = OwnerID() -- ����
	local R = Rand(5)+1 
	sleep(15)
	While true do 
		CastSpell(O_ID, O_ID, 850400 )
		sleep(15+R)
	end
end



------------------------------  ���� ------------------------------ 

function lua_mika_2012hallow_obj5_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj5_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj5_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj5_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj5_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������

			BeginPlot( T_ID , "lua_mika_2012hallow_obj5_04" , 0 )  -- �X�{����
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �X�{����
function lua_mika_2012hallow_obj5_04()
	local O_ID = OwnerID() -- �a�O
	local T_ID = TargetID()  -- ���a
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local ghostlist = {107346, 107347, 107348}
	local R = Rand(3)+1 -- 1. 2

	-- ���Ͱ���
	local OBJ = LuaFunc_CreateObjByObj ( 121407 , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--����
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Mark, True )--�аO
	SetModeEx( OBJ    , EM_SetModeType_Move, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, True )--�Y����
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --���
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--�i�������

	local mist = LuaFunc_CreateObjByObj ( 121410 , OBJ )  -- ���Ӫ����m���ͪ���  
	SetModeEx( mist    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( mist    , EM_SetModeType_Strikback, false )--����
	SetModeEx( mist    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( mist    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( mist    , EM_SetModeType_Move, false )--����
	SetModeEx( mist    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( mist    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( mist   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( mist   , EM_SetModeType_Show , True ) --���
	SetModeEx( mist   , EM_SetModeType_Fight , false )--�i�������
	sleep(5)
	AddToPartition( OBJ, RoomID) 
	AddToPartition( mist, RoomID) 

	WriteRoleValue(obj, EM_RoleValue_Register+8, mist  ) -- �Nmist�g�J�X��r8
	Sleep(15)

	-- ���Ͱ�
	local ghost = LuaFunc_CreateObjByObj ( ghostlist[R] , OBJ )  -- ���Ӫ����m���ͪ���  
	SetModeEx( ghost    , EM_SetModeType_Strikback, true )--����
	SetModeEx( ghost    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( ghost    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( ghost    , EM_SetModeType_Mark, true )--�аO
	SetModeEx( ghost    , EM_SetModeType_Move, true )--����
	SetModeEx( ghost    , EM_SetModeType_Searchenemy, true )--����
	SetModeEx( ghost    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( ghost   , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( ghost   , EM_SetModeType_Show , True ) --���
	SetModeEx( ghost   , EM_SetModeType_Fight , true )--�i�������

	sleep(5)
	AddToPartition( ghost, RoomID)  -- �ϰ�����
	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_20]".. "|r" , 0 ) 

	BeginPlot(obj, "lua_mika_2012hallow_obj5_05", 0 )  -- ���������S

	WriteRoleValue(ghost, EM_RoleValue_Register+9, obj )  -- �N�X�Ӽg�J����r9
	WriteRoleValue(obj, EM_RoleValue_Register+9, ghost  ) -- �N���g�J�X��r9
	Beginplot(ghost, "lua_mika_2012hallow_obj5_06", 0 ) -- �ˬd�԰�, �D�԰����A�~�]�H�����ʼ@��

end

--��Ʈwnpc�]�w 
function lua_mika_2012hallow_obj5_07()
	local Ghost = OwnerID()
	AddBuff(ghost, 623467, 0, -1 )
--	say(ghost, "addbuff")
end

-- �X�ӱ��Ǧ��`�S
function lua_mika_2012hallow_obj5_05()
	local Grave = OwnerID()
	local RoomID = ReadRoleValue( Grave ,EM_RoleValue_RoomID)
	local ghostlist = {107346, 107347, 107348}
	local R = Rand(3)+1 -- 1. 2

	while true do 
		local key = ReadRoleValue(grave, EM_RoleValue_Register+2 )
		if key == 99 then
		--	say(grave, "key ="..key )
			-- ���Ͱ�
			sleep(100)  -- 10 ��
			local ghost = LuaFunc_CreateObjByObj ( ghostlist[R] , Grave )  -- ���Ӫ����m���ͪ���  
			SetModeEx( ghost    , EM_SetModeType_Strikback, true )--����
			SetModeEx( ghost    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
			SetModeEx( ghost    , EM_SetModeType_Obstruct, false )--����
			SetModeEx( ghost    , EM_SetModeType_Mark, true )--�аO
			SetModeEx( ghost    , EM_SetModeType_Move, true )--����
			SetModeEx( ghost    , EM_SetModeType_Searchenemy, true )--����
			SetModeEx( ghost    , EM_SetModeType_HideName, true )--�W��
			SetModeEx( ghost   , EM_SetModeType_ShowRoleHead, true )--�Y����
			SetModeEx( ghost   , EM_SetModeType_Show , True ) --���
			SetModeEx( ghost   , EM_SetModeType_Fight , true )--�i�������
			sleep(5)
			AddToPartition( ghost, RoomID)  -- �ϰ�����
			WriteRoleValue(grave, EM_RoleValue_Register+2, 0 )
			WriteRoleValue(ghost, EM_RoleValue_Register+9, Grave )  -- �N�X�Ӽg�J����r9
			Beginplot(ghost, "lua_mika_2012hallow_obj5_06", 0 ) -- �ˬd�԰�, �D�԰����A�~�]�H�����ʼ@��
		end
		sleep(30)
	end


end

-- �ˬd�O�_�԰����A, �D�԰����A�N�H������
function lua_mika_2012hallow_obj5_06()
	local ghost = OwnerID()

	local x = ReadRoleValue(ghost, EM_RoleValue_X )
	local y = ReadRoleValue(ghost, EM_RoleValue_Y )
	local z = ReadRoleValue(ghost, EM_RoleValue_Z )
	local Range = 30+Rand(15)  --�üƲ��ʽd��
	local timer = 0
	local movetime = 3  -- �Cx���H�����ʤ@�� 

	while true do 
		timer = timer + 1 
		local attack =  ReadRoleValue( ghost , EM_RoleValue_AttackTargetID ) 
--		say(ghost, "now timer ="..timer)
---		say(ghost, "attackflag ="..attack )

		if timer%movetime == 0 then -- �Cx���H�����ʤ@��
			if attack == 0 then --�ˬd�O�_���}�԰� �p�G�S�԰�, �N�H�쥻��m�H��move
			--	say(ghost, "move" )
				MoveDirect( ghost, X+math.random(-Range,Range), Y, Z+math.random(-Range,Range) )
			end
		end
		sleep(10)
	end
end

------------------------------  �v��  ------------------------------ 
function lua_mika_2012hallow_obj6_01()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "lua_mika_2012hallow_obj6_02" , 0 )  
end

-- �o�q�u�n��s���ƥ�function�N�n
function lua_mika_2012hallow_obj6_02()   
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if ReadRoleValue( T_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	AttachCastMotionTool( T_ID , 212076 ) -- �N�Z���m�����Ť�
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "lua_mika_2012hallow_obj6_03" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function lua_mika_2012hallow_obj6_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if ReadRoleValue( O_ID , EM_RoleValue_SpellMagicID ) ~= 0 then  -- �I�k���N���]
		return
	end

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			AddRoleValue(O_ID, EM_LuaValueFlag_UseItem42 , 1 )  -- �O�����a������

			BeginPlot( T_ID , "lua_mika_2012hallow_obj6_04" , 0 )  -- �X�{�v¡�p�n��
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

-- �X�{�v¡�p�n��
function lua_mika_2012hallow_obj6_04()
	local O_ID = OwnerID() -- �a�O
	local T_ID = TargetID()  -- ���a

	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID)
	local objid = 121411 -- �p�n�� ����id

	local OBJ = LuaFunc_CreateObjByObj ( objid , O_ID )  -- ���Ӫ����m���ͪ���  
	SetModeEx( OBJ    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( OBJ    , EM_SetModeType_Strikback, false )--����
	SetModeEx( OBJ    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( OBJ    , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OBJ    , EM_SetModeType_Move, true )--����
	SetModeEx( OBJ    , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OBJ    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( OBJ   , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( OBJ   , EM_SetModeType_Show , True ) --�����
	SetModeEx( OBJ   , EM_SetModeType_Fight , false )--�i�������
	AddToPartition( OBJ, RoomID) 
	Hide( OBJ )
	sleep(5)
	Show( OBJ ,RoomID)

	ScriptMessage( O_ID , -1 , 1 , "|cffff00ff" .."[SC_2012HALLOW_MALA_21]".. "|r" , 0 ) 

	Sleep(10)
	NPCSAY(OBJ, "[SC_2012HALLOW_MALA_27]") --�K�K�A���ڪv���@�U�a�I
	CastSpell(OBJ, T_ID,  850399 ) -- �I��v¡�N 
	BeginPlot(OBJ, "lua_mika_2012hallow_obj6_05", 0 )
end

function lua_mika_2012hallow_obj6_05()
	local O_ID = OwnerID() -- �p�n��
	sleep(20)
	DelObj(O_ID)

end