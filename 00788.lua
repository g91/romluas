function star_ChangeJobList( )
	local Name = {"SYS_CLASSNAME_WARRIOR" , "SYS_CLASSNAME_RANGER" , "SYS_CLASSNAME_THIEF", "SYS_CLASSNAME_MAGE" , "SYS_CLASSNAME_AUGUR" , "SYS_CLASSNAME_KNIGHT" }
	local KeyName = {"Warrior" , "Ranger" , "Thief"	, "Mage" , "Augur" , "Knight" }

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select Job" );
	
	for i = 1 , table.getn(Name) do
		DialogSelectStr( OwnerID() , GetString( Name[i] ) );
	end
	
	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	
	if SelectID >= 0  and SelectID < table.getn(Name) then
		star_ChangeJob( GetString( Name[SelectID+1] ) , SelectID+1 )
	end

	DialogClose( OwnerID() )

end

function star_ChangeJob( Name , VocNum )

	local RoleLvList= { 1, 5 , 10,15,20,25,30,35,40,45,50,55,60,65,70 }

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "Select" .. Name .. " Level");
	
	for i = 1 , table.getn( RoleLvList ) do
		DialogSelectStr( OwnerID() , "("..i..")"..RoleLvList[i] .."LV" );
	end

	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	local Obj = Role:new( OwnerID() )	

	if SelectID >=0 and SelectID <  table.getn( RoleLvList )  then
		Obj:SetJob( VocNum )
		Obj:SetLevel( RoleLvList[SelectID+1] )
		
		SetStandardClearMagicPointAndSetTP( OwnerID() )
		DialogClose( OwnerID() )
	else
		star_ChangeJobList( )
	end
end

function star_ResetTp( )
	SetStandardClearMagicPointAndSetTP( OwnerID() )
end
-----------------------------------------------------------------------技能測試
function luatest_skill()
	CastSpell(OwnerID() , OwnerID() , 491009) 
end