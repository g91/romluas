--�ˬd�O�_���d��
function Hsiang_CheckNoPet(  )
	if ReadRoleValue( OwnerID() , EM_RoleValue_PetID ) <= 0 then
		return true;
	end
	return false;
end