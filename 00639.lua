function LuaS_MonthReport()

	local Mount = {[1]=201482,[2]=201488,[3]=201489,[4]=201490,[5]=201468,[6]=201469,[7]=201470}
	local Check = 0
	for i = 1 , table.getn(Mount),1 do
		if CountBodyItem( TargetID() , Mount[i] ) > 0 then
			Check = 1
		end
	end 
	if Check == 1 then
		ScriptMessage( TargetID(), OwnerID(), 1, GetString("SAY_MOUTH_ERROR_B"), 0 ); 
	else
		GiveBodyItem( TargetID() , 201482 , 1 )
	end

	return true

end