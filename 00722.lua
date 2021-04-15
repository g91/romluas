function LuaQ_202449_RandomQuest( Option )		-- 隨機委託任務

	if ( Option == "CHECK" ) then
		local QuestGroup = { 420457 , 420466 , 420467 }
		local QuestNoAccept = {}
		local AcceptNum = 0

		for i = 1,  table.getn( QuestGroup ) do
			if CheckAcceptQuest( OwnerID() , QuestGroup[i] ) == false then
				table.insert( QuestNoAccept , QuestGroup[i] )
			end
		end

		local QuestNum = table.getn( QuestNoAccept )
		local QuestRND =  Rand( QuestNum ) + 1
		local QuestID = QuestNoAccept[QuestRND]

		if ( QuestNum == 0 ) then
			Say( OwnerID() , "You Already Accepted All Quest of this Scroll !!" )
			return false
		else
			--Say( OwnerID() , GetObjNameByGUID( QuestID ) )			
			return true
		end
	elseif ( Option == "USE" ) then
		local str = "[".. QuestID.."]"
		ClearBorder( OwnerID() )
		AddBorderPage( OwnerID() , GetQuestDetail( QuestID , 1 ) )
		ShowBorder( OwnerID() , QuestID , str, "ScriptBorder_Texture_Paper" )
	end

end