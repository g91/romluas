function LuaS_111220()	-- 421281 Â³­¹¸Éµ¹ 203070 Ä¬¯óªo
	local ItemID = 203070
	local QuestID = 421281

	LoadQuestOption( OwnerID() )  --¸ü¤J¥ô°È¼ÒªO
	if CountBodyItem( OwnerID() , ItemID ) < 1 and CheckAcceptQuest( OwnerID() , QuestID ) == true then  	
		GiveBodyItem( OwnerID() , ItemID , 1 )
	end
end