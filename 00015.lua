function Init_RoleDataTable()
	Role = { }

	function Role:new( RoleID )
		Ret = {}
		Ret.RoleID = RoleID;
		setmetatable( Ret , self )
		self.__index = self;
		return Ret;
	end

	-- �t��_����_���⪫��]�w_�ƭ�
	Init_RoleData_Value();
	-- �t��_����_���⪫��]�w_�欰
	Init_RoleData_Function();

end