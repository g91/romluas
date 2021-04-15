function Signs_GetNumbers()
	local me = OwnerID();
	local Num =0 ;
	local SignsTable ={}; 
	local TempSignsID = 0;
	local Signs = 122690;
	local SignsCount = 0 ;
	local WTG = 1 ;
	local true_table = {};
	SignsTable = SearchRangeNPC ( me , 500 );
	while #true_table<12 do
		for a = 1, #SignsTable do
			TempSignsID = SignsTable[a];
			DebugMsg(0,0,"OrgID = "..ReadRoleValue(TempSignsID, EM_RoleValue_OrgID)) 
			if ReadRoleValue(TempSignsID, EM_RoleValue_OrgID) == Signs then
				true_table[a] = TempSignsID
			end
		end
		for b = 1, #true_table do
			TempSignsID = true_table[b];
			DebugMsg(0,0,"OrgID = "..ReadRoleValue(TempSignsID, EM_RoleValue_OrgID)) 
			if TempSignsID <= me then
			Num = Num +1;
			WriteRoleValue(me , EM_RoleValue_Register1,Num);
			end
		end
	end
	DebugMsg(0, 0, "R1 is Writen as "..ReadRoleValue(me, EM_RoleValue_Register1) ) ;
	if  ReadRoleValue (me, EM_RoleValue_Register1 ) == 1 then
		WTG = 2
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 2 then
		WTG = 3
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 3 then
		WTG = 4
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 4 then
		WTG = 7
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 5 then
		WTG = 2
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 6 then
		WTG = 7
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 7 then
		WTG = 9
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 8 then
		WTG = 11
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 9 then
		WTG = 8
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 10 then
		WTG = 5
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 11 then
		WTG = 10
	elseif ReadRoleValue (me, EM_RoleValue_Register1 )== 12 then
		WTG = 11
	end
	WriteRoleValue(me , EM_RoleValue_Register2, WTG);
	DebugMsg(0, 0, "R2 is Writen ! CurrentWTG = "..ReadRoleValue(me , EM_RoleValue_Register2));
	DebugMsg(0,0,"Register1 = "..ReadRoleValue (me, EM_RoleValue_Register1 ) )
end

function GUIDtoRegister1(a)
	x = ReadRoleValue(a,EM_RoleValue_Register1);
	DebugMsg (0,0,"Obj"..a.." read Register1 = "..x)
end