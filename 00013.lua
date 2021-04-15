function Test_RandCreateNPC_OnDead()
	local GItemID 
	
	local RandID = rand(50) 
	if RandID == 0 then
		GItemID = CreateObjByFlag( 100002 ,0 ,  -1 , 1 )	
	elseif RandID < 11 then
		GItemID = CreateObjByFlag( 100003 ,0 ,  -1 , 1 )	
	else
		GItemID = CreateObjByFlag( 100001 ,0 ,  -1 , 1 )	
	
	end

	local GItem = Role:new( GItemID )
	local Temp
	
	Temp = 	Def_Mode_Save + Def_Mode_Revive + Def_Mode_Obstruct;
	
	SetMode( GItemID  , Hex("0xffffffff") - Def_Mode_Save - Def_Mode_Revive - Def_Mode_Obstruct )   
	GItem:RunPlot( "Test_RandCreateNPC_Show" );
end