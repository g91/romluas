function Test_Init_Zone42to41()
	SetPlot( OwnerID() , "Range" , "Test_Zone42to41" , 150 );
end

function Test_Init_Zone41to42()
	SetPlot( OwnerID() , "Range" , "Test_Zone41to42" , 150 );
end

function Test_Init_Zone41()
	SetPlot( OwnerID() , "touch" , "Test_Zone41" , 100 );
end

function Test_Init_Zone1()
	SetPlot( OwnerID() , "touch" , "Test_Zone1" , 100 );
end


function Test_Zone42to41( )
	local Obj = Role:new( OwnerID() );
	ChangeZone(  OwnerID() , 41 , 0 , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
end

function Test_Zone41to42( )
	local Obj = Role:new( OwnerID() );
	ChangeZone(  OwnerID() , 42 , 0 , Obj:X() , Obj:Y() , Obj:Z() , Obj:Dir() );
end

function Test_Zone41( )
	local Obj = Role:new( OwnerID() );
	ChangeZone(  OwnerID() , 41 , 0 , -4206 , 230 , -8158 , 0  );
end

function Test_Zone1( )
	local Obj = Role:new( OwnerID() );
	ChangeZone(  OwnerID() , 1 , 0 , -4206 , 230 , -8158 , 0  );
end
