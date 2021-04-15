function LuaS_208339()	--208339貝爾的紀錄
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_423671_1]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_423671_2]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_423671_3]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_423671_4]" )	--下一頁，字串為書頁內文
	AddBorderPage( OwnerID(), "[SC_423671_5]" )	--下一頁，字串為書頁內文
		ShowBorder( OwnerID(), 0, "[SC_208339]", "ScriptBorder_Texture_Paper" );

end