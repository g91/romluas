
_brook = {};
_brook._role = {};

function _brook._role:new( _guid )
	local _inheritor = {};
	setmetatable( _inheritor, self );
	
	self.__index = function( _object , _key )
		if _brook._role_getter[_key] then
			return _brook._role_getter[ _key ]( _object );
		else
			return self[_key];
		end
	end
	
	self.__newindex = function( _object , _key , _value )
		if _brook._role_setter[ _key ] then
			return _brook._role_setter[ _key ]( _object , _value );
		else
			return rawset( _object , _key , _value );
		end
	end
	_inheritor._guid = _guid or 0;
	
	
	return _inheritor;
end

_brook._role_getter = {
	_hp = function( _object ) return ReadRoleValue( _object._guid , EM_RoleValue_HP ) end;
}

_brook._role_setter = {
	_hp = function( _object , _value ) return WriteRoleValue( _object._guid ,  EM_RoleValue_HP ,  _value ) end;
}