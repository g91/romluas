

function LuaFunc_followjob()
	local player=SearchRangePlayer(OwnerID(),200)	--search near player
	local player_amount = table.getn(player)	--get array how long
	local party_amount = GetPartyID(TargetID(),-1)
	local long  = 1
	local n=0
	for long=1, player_amount do
		for n=0,party_amount -1 do
			if player[n] == GetPartyID(TargetID() , long) then
				if CheckAcceptQuest(player[n],420635)==false then
					BeginPlot(Player[n],"mission_420635",0)
				end
			end
		end
	end
	
end

function mission_420635()
	ClearBorder( player[n] );
	AddBorderPage( player[n], GetQuestDetail( 420635, 1  ) );
	ShowBorder( player[n],420635 , "questname", "ScriptBorder_Texture_Paper" );
end