function Test_Function()
	local List = SearchRangeNPC( OwnerID() , 100 );
	local Obj
	for i = 0 , 100 , 1 do
		if List[i] == -1 then 
			break;
		end
		Obj = Role:New( List [i] )
		Obj:Say( "Test" )
	end
end