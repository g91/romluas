function LuaS_Area_ListDialog(Area,Flag)
	local ResultGOGO = {[0]="LuaS_111272_Close"}
	DialogSelectStr( OwnerID(),   GetString ( "SO_EXIT")  )--���}
	if Area == 1 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )--�ǰe��Z��R����
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
	end
	if Area == 2 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----�ǰe����`�ۭn��
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[1] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_1")  )----�ǰe��ù����
			table.insert (ResultGOGO, "LuaS_111256_1A")
		end
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_4")  )----�ǰe����r��
			table.insert (ResultGOGO, "LuaS_111256_4A")
		end
	end
	if Area == 4 then	
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )----�ǰe��Z��R����
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )-- --�ǰe�쫢���ҥ����
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
	end
	if Area == 5 then
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_4")  )----�ǰe����r��
			table.insert (ResultGOGO, "LuaS_111256_4A")
		end
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----�ǰe����`�ۭn��
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_11")  )----�ǰe��p�J��
			table.insert (ResultGOGO, "LuaS_111256_11A")
		end
	end
	if Area == 6 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )----�ǰe��Z��R����
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )----�ǰe�쫢���ҥ����
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_10")  )----�ǰe��㺸���Ӷ�
			table.insert (ResultGOGO, "LuaS_111256_10A")
		end
	end
	if Area == 10 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----�ǰe����`�ۭn��
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_11")  )----�ǰe��p�J��
			table.insert (ResultGOGO, "LuaS_111256_11A")
		end
	end
	if Area == 11 then
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )----�ǰe�쫢���ҥ����
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_10")  )----�ǰe��㺸���Ӷ�
			table.insert (ResultGOGO, "LuaS_111256_10A")
		end
	end
	return ResultGOGO
end