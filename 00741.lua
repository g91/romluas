Function LuaI_200967_Quest()
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--ªì©l¤Æ¥Û¸O¤¶­±
	AddBorderPage( OwnerID(), GetQuestDetail( 421208, 1 ));

	ShowBorder( OwnerID(), 421208,str,"ScriptBorder_Texture_Paper" )	

end

Function LuaI_100817_0()
	SetPlot(OwnerID(),"dead" ,"LuaI_100817_1" , 40 )
end

function LuaI_100817_1()
	local Player = LuaFunc_PartyData(TargetID())  
	for i = 1 , Player[0] , 1 do
		If CheckCompleteQuest( Player[i] , 421208 ) == false and CountBodyItem( Player[i] , 200967 ) == 0 then
			Givebodyitem( Player[i] ,200967 , 1 )
		end
	end
	return true
end