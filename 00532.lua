function LuaS_203343( Option )
	local PlayerID = OwnerID()
	local PackageID = 203343
	local job = ReadRoleValue( PlayerID , EM_RoleValue_VOC )
	local HPPotionID = 200663							-- 簡易急救藥水
	local MPPotionID = 201042							-- 簡易魔力藥水
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		else
			return false
		end
	elseif ( Option == "USE" ) then
		if job == 0 then
			ScriptMessage( PlayerID , PlayerID , 2 , "Please don't use GM to test this !!" , C_SYSTEM )	-- 畫面中間訊息
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		elseif job == 1 then
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		elseif job == 2 then
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		elseif job == 3 then
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		elseif job == 4 then
			GiveBodyItem( PlayerID , HPPotionID , 15 )
			GiveBodyItem( PlayerID , MPPotionID , 15 )
		elseif job == 5 then
			GiveBodyItem( PlayerID , HPPotionID , 15 )
			GiveBodyItem( PlayerID , MPPotionID , 15 )
		elseif job == 6 then
			GiveBodyItem( PlayerID , HPPotionID , 15 )
			GiveBodyItem( PlayerID , MPPotionID , 15 )
		elseif job == 7 then
			GiveBodyItem( PlayerID , HPPotionID , 15 )
			GiveBodyItem( PlayerID , MPPotionID , 15 )
		elseif job == 8 then
			GiveBodyItem( PlayerID , HPPotionID , 15 )
			GiveBodyItem( PlayerID , MPPotionID , 15 )
		elseif job == 9 then
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		elseif job == 10 then
			GiveBodyItem( PlayerID , HPPotionID , 30 )
		end
	end
end
function Lua_NewBie_nodead_1()
	--SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_100643_1" , 0 );
end

function QuestNPC_DeathPlot_100643_1()
	if CheckAcceptQuest( TargetID(), 420633) == true then
		if CountBodyItem( TargetID() , 201485 ) == 0 then
			GiveBodyItem ( TargetID() , 201485 , 1 )
		end
	end	
	Say( OwnerID(),GetString("EM_NEWBIE_1") )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DYING )
	setrolecamp(OwnerID(),"SNPC")
	return false;
end

function Lua_NewBie_nodead_2()
	--SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_100643_2" , 0 );
end

function QuestNPC_DeathPlot_100643_2()
	if CheckAcceptQuest( TargetID(), 420633) == true then
		if CountBodyItem( TargetID() , 201486 ) == 0 then
			GiveBodyItem ( TargetID() , 201486 , 1 )
		end
	end	
	Say( OwnerID(),GetString("EM_NEWBIE_2") )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DYING )
	setrolecamp(OwnerID(),"SNPC")
	return false;
end

function Lua_NewBie_nodead_3()
	--SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_100643_3" , 0 );
end

function QuestNPC_DeathPlot_100643_3()
	if CheckAcceptQuest( TargetID(), 420633) == true then
		if CountBodyItem( TargetID() , 201487 ) == 0 then
			GiveBodyItem ( TargetID() , 201487 , 1 )
		end
	end	
	Say( OwnerID(),GetString("EM_NEWBIE_3") )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DYING )
	setrolecamp(OwnerID(),"SNPC")
	return false;
end

function Lua_NewBie_home() --新手教學前往ZONE1劇情
	sleep(50)
	if CheckFlag( TargetID()  , 540851 ) ==true then--檢查有無旗標
		if ChangeZone( TargetID() , 1 , 0 ,-4069,244, -8247, 47) then		--傳送到zone1
		SetFlag( TargetID()  , 540851 , 0 );--刪除旗標
		end
	end
end

