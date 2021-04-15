function LuaI_110889()
	SetPlot( OwnerID() , "touch" , "LuaS_Kuro_110889_Walk" , 20 )
end

function LuaS_Kuro_110889_Walk()

	if ( CheckAcceptQuest( OwnerID() , 420752 ) == true ) and ( CountBodyItem( OwnerID() , 201647 ) >= 1 ) then
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420752_2") , 0 )
		DelBodyItem( OwnerID() , 201647 , 1 )
		GiveBodyItem( OwnerID() , 201648 , 1 )
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , GetString("ST_420752_1") , 0 )
	end

	BeginPlot( TargetID() , "LuaS_Kuro_110889_Walk_01" , 0 )
end

function LuaS_Kuro_110889_Walk_01()
		local RND =  Rand( 5 ) + 1	-- 產生 1~5 的亂數
		if ( RND <= 1 ) then
			SetPosByFlag( OwnerID() , 780076 , 1 )
			Hide( OwnerID() )
		elseif ( RND == 2 ) then
			SetPosByFlag( OwnerID() , 780076 , 2 )
			Hide( OwnerID() )
		elseif ( RND == 3 ) then
			SetPosByFlag( OwnerID() , 780076 , 3 )
			Hide( OwnerID() )
		elseif ( RND == 4 ) then
			SetPosByFlag( OwnerID() , 780076 , 4 )
			Hide( OwnerID() )
		elseif ( RND == 5 ) then
			SetPosByFlag( OwnerID() , 780076 , 5 )
			Hide( OwnerID() )
		end
		Sleep( 600 )
		Show( OwnerID() , 0 )
end