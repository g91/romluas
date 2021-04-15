function Lua_CheckPartyToGetTitle(TitleID)
	local O_ID = OwnerID();
	local PartyNum = GetPartyID(O_ID , -1)	--讀取玩家隊伍人數
	local PlayerGroup = {}
	if PartyNum == 0 then
		GiveBodyItem( O_ID , TitleID , 1 )
	else
		for i= 1, PartyNum do
			local player = GetPartyID(O_ID , i)
			if ReadRoleValue(player,EM_RoleValue_IsDead) == 0 and GetDistance(O_ID,player)<=200 then
				GiveBodyItem( player , TitleID , 1 )
			end
		end
	end
end
function cl_BOSS_DEAD_GIVEITEM(ITEM_NUMBER)
	GiveBodyItem ( TargetID(), ITEM_NUMBER, 1 )
end