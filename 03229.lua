function Init_VectorTable()
	CVector = {};

	function CVector:New( x, y, z )
		local ret = {}
		ret.x = x or 0;
		ret.y = y or 0;
		ret.z = z or 0;
		setmetatable( ret , self )
		self.__index = self;
		
		self.__add = function( a, b )
			return CVector:new( a.x+b.x, a.y+b.y, a.z+b.z );
		end
		self.__sub = function( a, b )
			return CVector:new( a.x-b.x, a.y-b.y, a.z-b.z );
		end
		self.__mul = function( obj, val )
			return CVector:new( obj.x*val, obj.y*val, obj.z*val );
		end
		self.__div = function( obj, val )
			return CVector:new( obj.x/val, obj.y/val, obj.z/val );
		end
		self.__tostring = function( self )
			return "("..self.x..","..self.y..","..self.z..")"
		end
		return ret;
	end
	
	function CVector:Len()
		return math.sqrt( self.x*self.x + self.y*self.y + self.z*self.z );
	end
	
	function CVector:Magnitude()
		return math.sqrt( self.x*self.x + self.y*self.y + self.z*self.z )
	end
	
	function CVector:SquaredMagnitude()
		return self.x * self.x + self.y * self.y + self.z * self.z;
	end
	
	function CVector:Normalize()
		local sqrtMag = self.x * self.x + self.y * self.y + self.z * self.z;
		if( sqrtMag > 0 )then
			local mag = math.sqrt( sqrtMag );
			self.x = self.x / mag;
			self.y = self.y / mag;
			self.z = self.z / mag;
		else
			self.x = 0;
			self.y = 0;
			self.z = 0;
		end
		return self
	end
	
	function CVector:Dot(vec)
		return self.x*vec.x + self.y*vec.y + self.z*vec.z;
	end
	
	function CVector:Cross(vec)
		return CVector:new(
			self.y * vec.z - self.z * vec.y,
			self.z * vec.x - self.x * vec.z,
			self.x * vec.y - self.y * vec.x
		)
	end

	function CVector:IsZero()
		return self.x == 0 and self.y == 0 and self.z == 0;
	end
	
	function CVector:Clone()
		return CVector:new( self.x, self.y, self.z );
	end
	
	function CVector:ToString()
		return "("..self.x..","..self.y..","..self.z..")"
	end
end

function Vector_GetRolePos( guid )	-- 取得指定物件的座標

	return CVector:New( 
		ReadRoleValueFloat( guid , EM_RoleValue_X ), 
		ReadRoleValueFloat( guid , EM_RoleValue_Y ),  
		ReadRoleValueFloat( guid , EM_RoleValue_Z ) );
end

function Vector_DirToVector( dir )	-- 角度轉向量

	dir = dir * math.pi / 180;
	return CVector:New( math.sin(dir) , 0 , math.cos(dir) );
end

function Vector_VectorToDir( vecObj )	-- 向量轉角度

	return CalDir( vecObj.x, vecObj.z );
end

function Vector_GetRoleDir( guid )	-- 取得角度
	local dir = ReadRoleValue( guid, EM_RoleValue_Dir )
	return Vector_DirToVector( dir );
end

function Vector_GetShootDir( targetX, targetY, targetZ, guid )	-- 取得與目標向量

	local targetpos = CVector:New( targetX, targetY, targetZ );
	local ownerPos = Vector_GetRolePos( guid );
	local dir =  targetpos - ownerPos;
	
	if( dir:Len() < 1 )then
		return Vector_GetRoleDir( guid );
	end
	
	dir:Normalize();
	return  dir;
end

--用Y軸旋轉向量
function Vector_YawVector( vecObj, dir )
	dir = dir * math.pi / 180;
	local _x = math.sin(dir) * vecObj.z + math.cos(dir) *  vecObj.x;
	local _z = math.cos(dir) * vecObj.z - math.sin(dir) * vecObj.x;
	
	vecObj.x = _x;
	vecObj.z = _z;
end

--用X軸旋轉向量
function Vector_PitchVector( vecObj, dir )
	dir = dir * math.pi / 180;
	local _y = -math.sin(dir) * vecObj.z + math.cos(dir) * vecObj.y;
	local _z = math.cos(dir) * vecObj.z + math.sin(dir) * vecObj.y;
	
	vecObj.y = _y;
	vecObj.z = _z;
end

--
function Vector_CalculateYawPitch( vecObj )

	local pitch = 0;
	local yaw = 0;
	
	local length = vecObj:Magnitude();
	if( length == 0 )then
		return yaw,pitch;
	end
	
	vecObj = vecObj * (1/length);
	
	if( vecObj.x == 0 and vecObj.z == 0 )then
	
		if( vecObj.y > 0 )then
			pitch = -math.pi;
		else
			pitch = math.pi;
		end
	
	else
	 	pitch = -math.asin( vecObj.y );

		local len = math.sqrt( vecObj.x * vecObj.x + vecObj.z * vecObj.z );
		if( len < vecObj.x )then
			len = vecObj.x;
		end

		yaw = math.asin( vecObj.x / len );

		if( vecObj.z < 0)then
			yaw = math.pi - yaw;
		end
	end
	
	pitch = pitch * 180 / math.pi;
	yaw = yaw * 180 / math.pi;

	return yaw,pitch;
end


--檢查直線是否可以射到目標
--射不到傳回nil
--射的到傳回距離
function Vector_CheckShootObj( beginPos, endPos, width, height, targetPos )

	local vec = endPos - beginPos;	-- 終點
	local len = vec:Magnitude();	-- 兩點長度
	local yaw, pitch = Vector_CalculateYawPitch( vec )	-- Dir、仰角

	vec = targetPos - beginPos;
	
	Vector_YawVector( vec, -yaw );
	Vector_PitchVector( vec, -pitch );
	
	if( vec.z < 0 or vec.z > len )then
		--DebugMsg( 0, "vec.z = " .. vec.z );
		return nil;
	end
	
	if( vec.x > width or vec.x < -width )then
		--DebugMsg( 0, "vec.x = " .. vec.x);
		return nil;
	end
	
	if( vec.y > height or vec.y < -height )then
		--DebugMsg( 0, "vec.y = " .. vec.y );
		return nil;
	end
	
	return vec.z;

end