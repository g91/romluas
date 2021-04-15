--填在模板的檢查是否有物品(或旗標)的劇情
function Lua_DW_CheckSome(  WantID , Num  )
	if	WantID == nil	then
		return -1
	end
	local name = "["..WantID.."]"
	local Str = "[SC_SYS_0][$SETVAR1="..name.."]"
	if	WantID >= 540000	and WantID < 550000	then

		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			return CheckFlag( OwnerID()  , WantID  )
		else
			return CheckFlag( TargetID()  , WantID  )
		end

	else

		if	Num == nil	then
			Num = 1
		end

		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			if	CountBodyItem( OwnerID() , WantID  ) >= Num	then
				return 1
			else
				ScriptMessage( OwnerID(), OwnerID(), 1, Str , 0 );
				return -1
			end
		else
			if	CountBodyItem( TargetID() , WantID  ) >= Num	then
				return 1
			else
				ScriptMessage( TargetID(), TargetID(), 1, Str  , 0 );
				return -1
			end
		end
	end
	return 1
end


--填在模板的刪除物品(或關旗標)劇情
function Lua_DW_DelSome( WantID , Num )
	if	WantID == nil	then
		return -1
	end

	if	WantID > 540000		then
		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			SetFlag( OwnerID()  , WantID , 0 )
		else
			SetFlag( TargetID()  , WantID , 0 )
		end
	else
		if	Num == nil	then
			Num = 1
		end

		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			DelBodyItem( OwnerID() , WantID , Num )
		else
			DelBodyItem( TargetID() , WantID , Num )			
		end
	end
	return 1
end

--填在模板的增加物品(或開旗標)劇情
function Lua_DW_AddSome( WantID , Num )
	if	WantID == nil	then
		return -1
	end

	if	WantID > 540000		then
		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			SetFlag( OwnerID()  , WantID , 1 )
		else
			SetFlag( TargetID()  , WantID , 1 )
		end
	else
		if	Num == nil	then
			Num = 1
		end

		if	ReadRoleValue(OwnerID() , EM_RoleValue_IsPlayer ) == 1	then
			GiveBodyItem( OwnerID() , WantID , Num )
		else
			GiveBodyItem( TargetID() , WantID , Num )			
		end
	end
	return 1
end
