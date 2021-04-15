function LuaQ_420554_OnClickObj()
	if CountItem( OwnerID() , 200729 ) > 0 then
		return false
	end
	return true
end
function LuaQ_420554_AfterClickObj()
	--ScriptMessage( OwnerID(), TargetID(), 0, GetString("EM_420255"), 0 )	--/*你在破碎的石碑中看到一個刻了符文的綠色石盤。
	if CheckAcceptQuest( OwnerID() , 421571 ) == true and CountItem( OwnerID() , 203408 ) == 0 then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421571]" , 0 )	--  你因水神之力，呼喚出神使留存於此地的記憶。
		ScriptMessage( OwnerID() ,  OwnerID() , 1 , "[SC_421571]" , C_SYSTEM )
		BeginPlot( TargetID() , "LuaS_421571_Show" , 0 )
	end
	BeginPlot( TargetID() , "LuaQ_420554_Play" , 0 )
	return 1
end
----------------------------------------------------
function LuaQ_420554_Play()
	SetPlot( OwnerID() ,"touch" ,"LuaFunc_Obj_BUSY" , 50 )
	if CheckID(TargetID()) == true and CheckAcceptQuest(TargetID() , 421571 ) == true and CountItem( TargetID() , 203408 ) == 0 then
		GiveBodyItem( TargetID() , 203408 , 1 )
		sleep( 120 )
	end
	if CheckID(TargetID()) == true and CheckAcceptQuest(TargetID() , 420554 ) == true and CountItem( TargetID()  , 200729 ) == 0 and GetDistance( TargetID() , OwnerID() ) <= 250 then
		GiveBodyItem( TargetID() , 200729 , 1 )
		local String  
		local Makhaz1
		local Makhaz2
		local Disciple
		--DisableQuest( OwnerID() , true )
		Disciple = CreateObjByFlag( 100220 , 780028 , 0 , 1 )
		SetRoleCamp( Disciple , "Visitor" ) 
		AddToPartition( Disciple , 0)
		sleep( 10 )
		Say( Disciple , GetString("SAY_420255_1") )
		sleep( 30 )
		Say( Disciple , GetString("SAY_420255_2") )
		SetRoleCamp( Disciple , "Monster" ) 
		Hide( Disciple )
		Show(Disciple,0)
		Makhaz1 = CreateObjByFlag( 100221 , 780028 , 1 , 1 )
		AddToPartition( Makhaz1 , 0)
		Makhaz2 = CreateObjByFlag( 100221 , 780028 , 2 , 1 )
		AddToPartition( Makhaz2 , 0)
		BeginPlot( Disciple ,"LuaQ_420554_Sui",0)
		SetPlot( Disciple,"Dead","LuaI_100220_Dead",40 )
		BeginPlot( Makhaz1 ,"LuaQ_420554_Sui",0)
		SetPlot( Makhaz1,"Dead","LuaQ_420554_Dead",40 )
		BeginPlot( Makhaz2 ,"LuaQ_420554_Sui",0)
		SetPlot( Makhaz2,"Dead","LuaQ_420554_Dead",40 )
		SetAttack( Disciple , TargetID() )
		SetAttack( Makhaz1 , TargetID() )
		SetAttack( Makhaz2 , TargetID() )
		while 1 do
			sleep( 10 )
			if CheckID( Disciple ) == false and CheckID( Makhaz1 ) == false and CheckID( Makhaz2 ) == false then
				--DisableQuest( OwnerID() , false )
				break
			end
			sleep( 10 )
		end
	end
	SetPlot( OwnerID() ,"touch" ,"" , 0 )
end
---------------------------------------------------------------------------------
function LuaQ_420554_Sui()
	LuaFunc_Obj_Suicide(100)
end
---------------------------------------------------------------------------------
function LuaI_100220_Dead()

	BeginPlot( OwnerID() , "LuaFunc_DeadPlay" , 0 )
	return false
end
---------------------------------------------------------------------------------
function LuaQ_420554_Dead()
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay" , 0 )
	return false	
end
