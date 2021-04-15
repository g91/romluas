-- 建立一個物件依照另一個物件的資料
function CreateObjByObj( NewObjID, ObjGUID )

	local Obj = Role:new( ObjGUID ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local BaseRoom = Obj:RoomID()

	local NewObjGUID = nil;
 	 
	NewObjGUID = CreateObj( newObjID, BaseX, BaseY, BaseZ, BaseDir, 1 )		
	AddToPartition( NewObjGUID, BaseRoom)

	return NewObjGUID; 

end

function LuaFunc_CreateObjByObj( NewObjID, ObjGUID )

	local Obj = Role:new( ObjGUID ) 

	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local BaseRoom = Obj:RoomID()

	local NewObjGUID = nil;
 	 
	NewObjGUID = CreateObj( newObjID, BaseX, BaseY, BaseZ, BaseDir, 1 )		
	AddToPartition( NewObjGUID, BaseRoom )

	return NewObjGUID; 

end