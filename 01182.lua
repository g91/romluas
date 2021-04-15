



function LuaI_203631_Quest()---信籤
               if(CheckAcceptQuest( OwnerID() , 421802 ) == true ) and ( CountBodyItem( OwnerID() ,542319  ) < 1 ) then
               GiveBodyItem( OwnerID() , 542319 , 1 )
end
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_421718]")
                ShowBorder( OwnerID(),421718, str, "ScriptBorder_Texture_Paper" )	
end
------
function LuaI_112206_0()---潘尼西亞寶物
 	SetPlot( OwnerID() , "Range" , "LuaI_112206_1" , 50 )
end
function LuaI_112206_1()
	if(CheckAcceptQuest( OwnerID() , 421749 ) == true ) and ( CountBodyItem( OwnerID() , 203643 ) < 1 ) then
	BeginPlot( OwnerID() , "LuaI_112206_2" , 0 )
	end
end
function LuaI_112206_2()
               if Countbodyitem( OwnerID() , 203666 ) >=1  and CountBodyItem( OwnerID() , 203643 ) ==0 then
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112206_1]" , 0 )
                DelBodyItem ( OwnerID() , 203666 , 1 )	
	GiveBodyItem( OwnerID() , 203643 , 1 )
	END
END