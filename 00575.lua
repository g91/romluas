function LuaI_200939()	--���Ĩf�Ȫ��x�O
	SetPlot( OwnerID() , "touch" , "LuaI_200939_Quest" , 30 );
end
--------------------------------------------------------------------------------------------------------------

function LuaI_200939_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());
	AddBorderPage( OwnerID(), GetQuestDetail( 420352, 1 ));

	ShowBorder( OwnerID(), 420352, Str, "ScriptBorder_Texture_Paper" )	

end
--------------------------------------------------------------------------------------------------------------