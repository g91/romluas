-----諾芙的牛皮紙(寫著一條線索)

function LuaI_203355_Quest()
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_203355]" );
	ShowBorder( OwnerID(), 0,"[203355]", "ScriptBorder_Texture_Paper" )	
end

-----諾芙的牛皮紙(寫著二條線索)

function LuaI_203358_Quest()
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_203358]" );
	ShowBorder( OwnerID(), 0, "[203358]", "ScriptBorder_Texture_Paper" )	
end

-----諾芙的牛皮紙(寫著三條線索)

function LuaI_203369_Quest()
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_203369]" );
	ShowBorder( OwnerID(), 0, "[203369]", "ScriptBorder_Texture_Paper" )	
end

-----諾芙的藏寶圖

function LuaI_203371_Quest()

	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if PLAYERLV < 10 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203371_1]" , 0 )	--未達該物品使用等級，需到達等級10才能開啟。	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203371_1]" , C_SYSTEM )	
	else
		ClearBorder( OwnerID());	--初始化石碑介面
		AddBorderPage( OwnerID(), "[SC_203371]");
		ShowBorder( OwnerID(), 421539, "[203371]", "ScriptBorder_Texture_Paper" )	
	end
end







-----開鎖的箱子拿取娃娃

function LuaI_203365_Quest()

	GiveBodyItem( OwnerID(), 203357, 1 )
	UseItemDestroy() 		--刪除使用中的物品

end



-----羅菈的寶箱

function LuaI_203372_Quest()
	if CheckFlag( OwnerID() , 542292 ) == false and CheckCompleteQuest( OwnerID() , 421539 ) == false then
		GiveBodyItem( OwnerID(), 211517, 1 )
		GiveBodyItem( OwnerID(), 211518, 1 )
		GiveBodyItem( OwnerID(), 211519, 1 )
		SetFlag(OwnerID() , 542292 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421669]" , C_SYSTEM )	
	end
	UseItemDestroy() 		--刪除使用中的物品

end


