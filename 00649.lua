

function LuaS_100677()--�ͮ𪺩~�J�㴵
	local player={}

	while true do


		player=SearchRangePlayer ( OwnerID(), 200 )--�N���񪱮a�����}�C

		for i=0,table.getn(player) do
			
			if CheckID( player[i] ) then
				if CountBodyItem( player[i], 201836)>0 then
					ScriptMessage( OwnerID(), player[i] , 1, GetString("EM_100677") , 0 )--�~�J�㴵�����������ۧA�A���ܷw�@�žצ�F�o�ѤO�q�C
				end
				
				if CountBodyItem( player[i], 201836)==0 then
					if CastSpellLV(OwnerID(),player[i],491105,1) then--���w
						ScriptMessage( OwnerID(), player[i] , 2, GetString("EM_100677_0") , 0 )--�~�J�㴵�����������ۧA�A�A�P��@�}�w��K�K
					end
				end
			end
		end

		
		Sleep(40)



	end
end 


