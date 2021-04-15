--�o�U�����F�I
--���Ƚs�� 422294
--�Ǫ� �v�i�k�v �s�� 101933
--���~�s�� �v�i�k�v��Ĩۣ�� 204625
--���~�s�� �����u�� 204624
function LuaI_204624_Check()
	if CheckAcceptQuest( OwnerID() , 422294 ) == false or CountBodyItem( OwnerID() , 204625 ) >= 6 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_0]" , 0 ) --�A�ثe���ݭn�Ķ�204625
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_0]" , 0 )
			return false
	end
	local npc = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if npc == 101933 then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			if CheckFlag( TargetID() , 542497 ) == true then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ALREADY_USED]" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ALREADY_USED]" , 0 )
				return false
			end
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_1]" , 0 ) --[101933]��A���欰�Q���ͮ�
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_1]" , 0 )	
			SetAttack( TargetID() , OwnerID() )
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) --�ؼп��~
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 )	
		return false
	end
end
function LuaI_204624_USE()
	if CheckFlag( TargetID() , 542497 ) == false then
		GiveBodyItem( OwnerID(), 204625, 1 )
		SetFlag( TargetID() , 542497 , 1 )
	end
end


--���ƪ��·�ۣ
--���Ƚs�� 422293
--��ۣ����s�� 112891
--�X�нs�� 780359
function LuaQ_Complete_422293()
	--�нs�� 780359�A�X�l�s���n�q0�}�l�A�������i�H����
	DisableQuest( OwnerID() , true )
	sleep( 20 )
	Say( OwnerID() , "[SC_422293_0]" ) --�u�_�ǡH�ڪ������٬O�ʤ��F......�v
	sleep( 30 )
	local Count = GetMoveFlagCount(780359)
	local obj = {}
	for i = 0 , Count-1 , 1 do
		sleep( Rand(5) + 1 )
		obj[i] = CreateObjByFlag( 112891 , 780359 , i , 1 )
		Lua_ObjDontTouch( Obj[i] ) 
		AddToPartition( Obj[i] , 0 )
		WriteRoleValue( Obj[i] , EM_RoleValue_LiveTime , 15 )
	end
	Say( OwnerID() , "[SC_422293_1]" ) --�u�o�O����H���㤣��ڪ�������|���XĨۣ�ӡI�v
	DisableQuest( OwnerID() , false )
end