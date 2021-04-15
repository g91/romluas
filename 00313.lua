function Hsiang_PlotDialogChangeZoneList( )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "選擇一個區域傳送" );
	DialogSelectStr( OwnerID() , "(1)嚎叫山麓" );
	DialogSelectStr( OwnerID() , "(2)銀湧之野" );
	DialogSelectStr( OwnerID() , "(3)掠鴉荒原" );
	DialogSelectStr( OwnerID() , "(4)艾索蘭斜谷" );

	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end
	
	local SelectID = Hsiang_GetDialogResoult( OwnerID() );
	
	if SelectID == 0  then
		Hsiang_PlotDialogZone1Pos(  )	
	elseif SelectID == 1  then
		Hsiang_PlotDialogZone2Pos(  )
	elseif SelectID == 2  then
		Hsiang_PlotDialogZone3Pos(  )
	elseif SelectID == 3  then
		Hsiang_PlotDialogZone4Pos(  )
	else 
		-- 沒選
	end

	DialogClose( OwnerID() )

end

function Hsiang_PlotDialogZone1Pos(  )

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "嚎叫山麓 選個地方傳送");
	DialogSelectStr( OwnerID() , "(1) 出生點" );
	DialogSelectStr( OwnerID() , "(2) 羅格鎮" );
	DialogSelectStr( OwnerID() , "(3) 尖石丘" );
	DialogSelectStr( OwnerID() , "(4) ??木洞 " );
	DialogSelectStr( OwnerID() , "(5) 月泉裂井" );
	DialogSelectStr( OwnerID() , "(6) 回上頁" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--出生點
		ChangeZone( OwnerID(), 1 , 0 , -4162 ,240  ,-8210 , 0 );
	elseif SelectID == 1  then
		--羅格鎮
		ChangeZone( OwnerID(), 1 , 0 , -234 ,15  ,-6503 , 0 );
	elseif SelectID == 2  then
		--尖石丘
		ChangeZone( OwnerID(), 1 , 0 ,-2202,130,-4267 , 0 );
	elseif SelectID == 3  then
		--枯木洞
		ChangeZone( OwnerID(), 1 , 0 , -3877,15,-6004 , 0 );
	elseif SelectID == 4  then
		--月泉裂井 
		ChangeZone( OwnerID(), 1 , 0 , 877,32,-5215 , 0 );
	elseif SelectID == 5 then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	else 
	end


end
function Hsiang_PlotDialogZone2Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "嚎叫山麓 選個地方傳送");
	DialogSelectStr( OwnerID() , "(1)入口" );
	DialogSelectStr( OwnerID() , "(2)回上頁" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--出生點
		ChangeZone( OwnerID(), 2 , 0 , -1 , 4 , -1292 , 0 );
	elseif SelectID == 1 then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	else 
	end

end
function Hsiang_PlotDialogZone3Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "掠鴉荒原 選個地方傳送");
	DialogSelectStr( OwnerID() , "(1)回上頁" );
	DialogSelectStr( OwnerID() , "(2)回上頁" );


	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	elseif SelectID == 1 then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	else 
	end	
end
function Hsiang_PlotDialogZone4Pos(  )
	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "艾索蘭斜谷 選個地方傳送");
	DialogSelectStr( OwnerID() , "(1)回上頁" );
	DialogSelectStr( OwnerID() , "(2)回上頁" );



	if( DialogSendOpen( OwnerID() ) == false ) then 
		--資料送出有問題
		return;
	end

	local SelectID = Hsiang_GetDialogResoult( OwnerID() );

	if SelectID == 0  then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	elseif SelectID == 1 then
		--回上頁
		Hsiang_PlotDialogChangeZoneList();
	else 
	end
end