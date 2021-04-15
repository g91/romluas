function Init_RoleDataTable()
	Role = { }

	function Role:new( RoleID )
		Ret = {}
		Ret.RoleID = RoleID;
		setmetatable( Ret , self )
		self.__index = self;
		return Ret;
	end

	-- 系統_物件_角色物件設定_數值
	Init_RoleData_Value();
	-- 系統_物件_角色物件設定_行為
	Init_RoleData_Function();

end