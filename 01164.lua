function LuaI_203618_Quest()---塔倫墨的項鍊
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_421690]")
                ShowBorder( OwnerID(), 421690,str,"ScriptBorder_Texture_Paper" )	
end


function LuaI_112119_0()----
 	SetPlot( OwnerID() , "Range" , "LuaI_112119_1" , 50 )
end
function LuaI_112119_1()
	if CheckAcceptQuest( OwnerID() , 421685 ) == true and CheckFlag( OwnerID() , 542312 ) == false then
                     ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421685]" , 0 )
		SetFlag( OwnerID() , 542312 , 1 )
	end
end