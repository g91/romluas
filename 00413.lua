function Zone1_Treasure_Init()
	-- SetMinimapIcon ( OwnerID(), 6 );
	sleep( 50 )
	--AddToPartition( OwnerID() , 0 )
	SetPlot( OwnerID() , "Touch" , "Zone1_Treasure_Touch" , 15 );
end


function TreasureTouch( ObjID , KeyID , ItemID1 , ItemID2 , ItemID3 , ItemID4 , ItemID5 )
	local Obj = Role:new( ObjID )
	local result = false;
	if( Obj:IsDead() == true ) then
		return;
	end
	
	--local DelRet =  DelBodyItem( ObjID , KeyID , 1);

	if( KeyID ~= 0 and  CountBodyItem( ObjID , KeyID ) <= 0 ) then
		Say( TargetID() , GetString( "TREASURE_NEED_KEY" ));
		return;	
	end

	if BeginCastBar( ObjID , GetString("TREASURE_OPEN") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
		ScriptMessage ( ObjID , ObjID  , 1 , "[SAY_NPC_BUSY]" , 0 )
		return
	end
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( ObjID  );
		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- жие\
				result = true
				EndCastBar( ObjID  , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ев▒╤
				result = false
				EndCastBar( ObjID  , CastBarStatus )
				break;
			end
		end
	end

	if ( result == true and KeyID == 0 ) then
		if( KillID( ObjID  , TargetID() ) == true ) then 
			if ItemID1 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID1 , 1 );
			end
			if ItemID2 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID2 , 1 );
			end
			if ItemID3 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID3 , 1 );
			end
			if ItemID4 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID4 , 1 );
			end
			if ItemID5 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID5 , 1 );
			end

		end
	elseif ( result == true and CountBodyItem(ObjID , KeyID) > 0 ) then
		if( KillID( ObjID  , TargetID() ) == true and DelBodyItem( ObjID , KeyID , 1) == true ) then 
			if ItemID1 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID1 , 1 );
			end
			if ItemID2 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID2 , 1 );
			end
			if ItemID3 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID3 , 1 );
			end
			if ItemID4 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID4 , 1 );
			end
			if ItemID5 ~= nil  then 
				GiveBodyItem( ObjID  , ItemID5 , 1 );
			end

		end
	end

end

function Zone1_Treasure_Touch()
	local Item3;
	local RandValue = Rand( 2 ) ;
	if( RandValue == 0 ) then
		Item3 = 721223;
	elseif( RandValue == 1 ) then
		Item3 = 721222;
	end

	
	TreasureTouch( OwnerID() , 201620 , 721221 , 721225 , Item3 )
end