function Mihucat_CreateMonster( MonsterObjID )
	local Obj = Role:new( OwnerID() )
	local X = Obj:X()
	local Z = Obj:Z()

	local MonsterID  = CreateObj( MonsterObjID , X , Obj:Y() , Z , 0 , 1 );
	AddToPartition( MonsterID   , 0 );
end

function Mihucat_PlotDialogChangeMonster( )
	
	local KeyName = {"Queen" , "Dragon" , "Robot" }
	local MonsterID = {100036,100037,100038}
	local total = table.getn(KeyName) 

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "create monster" );
	
	for i = 1 , total do
		DialogSelectStr( OwnerID() , KeyName [i] );
	end
	
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	SelectID = SelectID + 1
	if ( SelectID >= 1 and SelectID < total ) then
		Mihucat_CreateMonster( MonsterID[ SelectID ] )
	end

	DialogClose( OwnerID() )

end