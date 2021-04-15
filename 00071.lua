function S_CreateNPC(GUID, FlagGroup, FlagID, FaceFlagGroup, FaceFlagID)
local ObjID = CreateObjByFlag( GUID, FlagGroup, FlagID, 1 );
FaceFlag( ObjID, FaceFlagGroup, FaceFlagID );
AddToPartition( ObjID, 0 );
return ObjID;
end