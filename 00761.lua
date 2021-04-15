function LuaS_Area_ListDialog(Area,Flag)
	local ResultGOGO = {[0]="LuaS_111272_Close"}
	DialogSelectStr( OwnerID(),   GetString ( "SO_EXIT")  )--離開
	if Area == 1 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )--傳送到凡瑞娜絲城
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
	end
	if Area == 2 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----傳送到黑曜石要塞
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[1] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_1")  )----傳送到羅格鎮
			table.insert (ResultGOGO, "LuaS_111256_1A")
		end
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_4")  )----傳送到銀瀑村
			table.insert (ResultGOGO, "LuaS_111256_4A")
		end
	end
	if Area == 4 then	
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )----傳送到凡瑞娜絲城
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )-- --傳送到哈洛夫交易站
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
	end
	if Area == 5 then
		if CheckFlag( OwnerID() , Flag[4] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_4")  )----傳送到銀瀑村
			table.insert (ResultGOGO, "LuaS_111256_4A")
		end
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----傳送到黑曜石要塞
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_11")  )----傳送到雷克鎮
			table.insert (ResultGOGO, "LuaS_111256_11A")
		end
	end
	if Area == 6 then
		if CheckFlag( OwnerID() , Flag[2] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_2")  )----傳送到凡瑞娜絲城
			table.insert (ResultGOGO, "LuaS_111256_2A")
		end
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )----傳送到哈洛夫交易站
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_10")  )----傳送到艾爾恩商隊
			table.insert (ResultGOGO, "LuaS_111256_10A")
		end
	end
	if Area == 10 then
		if CheckFlag( OwnerID() , Flag[6] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_6")  )----傳送到黑曜石要塞
			table.insert (ResultGOGO, "LuaS_111256_6A")
		end
		if CheckFlag( OwnerID() , Flag[11] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_11")  )----傳送到雷克鎮
			table.insert (ResultGOGO, "LuaS_111256_11A")
		end
	end
	if Area == 11 then
		if CheckFlag( OwnerID() , Flag[5] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_5")  )----傳送到哈洛夫交易站
			table.insert (ResultGOGO, "LuaS_111256_5A")
		end
		if CheckFlag( OwnerID() , Flag[10] ) == true then
			DialogSelectStr( OwnerID(),   GetString ( "SC_111256_10")  )----傳送到艾爾恩商隊
			table.insert (ResultGOGO, "LuaS_111256_10A")
		end
	end
	return ResultGOGO
end