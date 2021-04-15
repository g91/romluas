function ChristineMusic_initialize()
	Christine.Music = Christine.Object:new()
	Christine.Music.class = "Music"

	function Christine.Music:new(_name, _url, _time)
		if type(_name) ~= "string" or type(_url) ~= "string" or type(_time) ~= "number" then
			self:error(0, 0, "Christine.Music:new( _name:String, url:String, _time:Number )") return false
		end
		local _inheritor = {}
		_inheritor.name = _name
		_inheritor.url = _url
		_inheritor.time = _time
		setmetatable(_inheritor, self)
		self.__index = function(_object, _key)
			return self[_key]
		end
		self.__newindex = function(_object, _key, _value)
			rawset(_object, _key, _value)
		end
		return _inheritor
	end

	DebugLog(2, "[Christine Class] Music initialized")
end