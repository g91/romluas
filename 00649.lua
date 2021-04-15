

function LuaS_100677()--生氣的居克艾斯
	local player={}

	while true do


		player=SearchRangePlayer ( OwnerID(), 200 )--將附近玩家取成陣列

		for i=0,table.getn(player) do
			
			if CheckID( player[i] ) then
				if CountBodyItem( player[i], 201836)>0 then
					ScriptMessage( OwnerID(), player[i] , 1, GetString("EM_100677") , 0 )--居克艾斯的拳風壓迫著你，但抗暈護符擋住了這股力量。
				end
				
				if CountBodyItem( player[i], 201836)==0 then
					if CastSpellLV(OwnerID(),player[i],491105,1) then--擊暈
						ScriptMessage( OwnerID(), player[i] , 2, GetString("EM_100677_0") , 0 )--居克艾斯的拳風壓迫著你，你感到一陣暈昡……
					end
				end
			end
		end

		
		Sleep(40)



	end
end 


