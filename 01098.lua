
-----�b�W��Wñ�p�W�r

function LuaI_203376_Quest()

	GiveBodyItem( OwnerID(), 203377, 1 )
	UseItemDestroy() 		--�R���ϥΤ������~
	
end

-----�I����S�E���w����������

function LuaS_203504()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111680 , 44 )
	--local OBJ = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJ == 111680 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203504]" , 0 )	--  �o����S����S�E���w�������X�ӡI
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203504]" , C_SYSTEM )	
		return false
	end
end

function LuaS_203504_1()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111680 , 44 )
	local MonsterA = LuaFunc_CreateObjByObj ( 101434 , Tomb )
	AddToPartition( MonsterA ,    0 )
	SetAttack( MonsterA , OwnerID() )
	SetFlag(OwnerID() , 542252 , 1 )
	BeginPlot(MonsterA , "LuaS_203504_2" , 0 )
	UseItemDestroy() 
end

function LuaS_203504_2()
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




-----�I��ù�Ǧ㺸����������

function LuaS_203505()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111689 , 44 )
	--local OBJB = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJB == 111689 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203505]" , 0 )	--  �o����S��ù�Ǧ㺸�������X�ӡI
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203505]" , C_SYSTEM )
		return false
	end
end

function LuaS_203505_1()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111689 , 44 )
	local MonsterB = LuaFunc_CreateObjByObj ( 101435 , Tomb )
	AddToPartition( MonsterB ,    0 )
	SetAttack( MonsterB , OwnerID() )
	SetFlag(OwnerID() , 542253 , 1 )
	BeginPlot(MonsterB , "LuaS_203505_2" , 0 )	
	UseItemDestroy()
end

function LuaS_203505_2()
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

-----�ĭۼw���H

function LuaI_203387_Quest()

	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if PLAYERLV < 18 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203387]" , 0 )	--���F�Ӫ��~�ϥε��šA�ݨ�F����18�~��}�ҡC	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203387]" , C_SYSTEM )	
	else
		ClearBorder( OwnerID());	--��l�ƥ۸O����
		AddBorderPage( OwnerID(), GetQuestDetail( 421559, 1 ));
		ShowBorder( OwnerID(), 421559, "[203387]", "ScriptBorder_Texture_Paper" )	
	end
end



