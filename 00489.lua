function LuaS_420608() --°íµwªº¥Ò´ß

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420608, 1  ) );

	ShowBorder( OwnerID(), 420608, "[420608]", "ScriptBorder_Texture_Paper" );	

end

function LuaQ_420608_Complete() --°íµwªº¥Ò´ß

	local Count = CountBodyItem( TargetID() , 201280 )
	if Count > 0 then
		DelBodyItem(  TargetID() , 201280 ,Count )
	end
end