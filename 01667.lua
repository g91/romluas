function LuaS_111220()	-- 421281 ³���ɵ� 203070 Ĭ��o
	local ItemID = 203070
	local QuestID = 421281

	LoadQuestOption( OwnerID() )  --���J���ȼҪO
	if CountBodyItem( OwnerID() , ItemID ) < 1 and CheckAcceptQuest( OwnerID() , QuestID ) == true then  	
		GiveBodyItem( OwnerID() , ItemID , 1 )
	end
end