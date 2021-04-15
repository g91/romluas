function LuaM_Bag_5_check()
	if ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount ) <=55 then
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BAGADD_5"), C_SYSTEM );--�e�������T���G�I�]�w�X�W5�����
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("MSG_BAGMAX_60"), C_DEFAULT);--�X�W���ѡI�I�]�W����60�����
		return false
	end	
end

function LuaM_Bag_5_Effect()
	AddRoleValue( OwnerID() , EM_RoleValue_BodyCount , 5 )
end

function LuaM_Bag_check( Count )

	local MAX = 160	-- �I�]�̤j�W��
	local Package = ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount )

	if ( Package == MAX ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADDFAIL_MAX") , C_DEFAULT )		-- �e�������T���G�X�W���ѡA�I�]���w�F�̤j�W���A�L�k�A�X�W�I
		return false
	elseif ( Package == Count - 10 ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADD_"..Count-60 ) , C_SYSTEM )		-- �e�������T���G�I�]���w�X�W��50��
		return true
	elseif ( Package >= Count ) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADD_SAME" ) , C_DEFAULT )			-- �e�������T���G�X�W���ѡA�L�k�X�W���ۦP�Τp��{�b����ơI
		return false
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("MSG_BAGADDFAIL_"..Count-60 ) , C_DEFAULT )		-- �X�W���ѡI�I�]��쥲�����X�W��40��
		return false
	end	
end

function LuaM_Bag_Effect( Count )
	WriteRoleValue( OwnerID() , EM_RoleValue_BodyCount , Count )
end