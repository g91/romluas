
kg_Role = Role:new(0)--繼承Role
function kg_Role:new( RoleID, Class )--( GitemID , 自訂類別 )
	RoleID = RoleID or 0
	if type(Class)=="table" then else Class = {} end
	Class.Gid=RoleID
	Class.RoleID=RoleID--self 即 kg_Role
	setmetatable( Class , self )
	self.__index = self
	return Class
end

function kg_Role:GetHateList( Mode )
	return KS_GetHateList( self.RoleID , Mode )
end

function kg_Role:InBattle( )
	return kg_InBattle(self.RoleID)
end

function kg_Role:GetPos( ObjID , Dis , AddY , angle , face )--ObjID 為 nil 則是回傳位置資訊
	if Dis==nil then return kg_GetPos( self.RoleID )
	else return kg_GetPosRX( self.RoleID , ObjID , Dis , AddY , angle , face ) end
end

function kg_Role:ScriptMessage( Mode , String , Color )
	ScriptMessage(self.RoleID,self.RoleID,Mode,String,Color)
end

function kg_Role:MoveDirect( x , y, z )
	MoveDirect(self.RoleID,x,y,z)
end

function kg_Role:AddToPartition( RoomID )
	RoomID = RoomID or 0
	AddToPartition( self.RoleID,RoomID )
end

function kg_Role:ModeEx( ModeType , bool )
	if bool == nil then
		return GetModeEx( self.RoleID , ModeType )
	else
		SetModeEx( self.RoleID , ModeType, bool )
	end
end

function kg_Role:ClearReg( )
	kg_ClearReg( self.RoleID )
end

function kg_Role:Reg( num , value )--( Reg編號 ,寫入的數值(nil則表示為讀取))
	return kg_Reg( self.RoleID , num , value )
end