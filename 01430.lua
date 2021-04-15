---------------------三層---小怪技能_1----------

function Lua_AP_AQ_mob_1()	
	while 1 do		
		sleep(10)
		CastSpell( OwnerID() , OwnerID() , 493520) 	 ----毒氣四溢
	end
end
-----------------------------三層---小怪技能_2------------------------------------------------------------------------------------
function Lua_AP_AQ_mob_2()	
	while 1 do
		sleep(10)
		local counter1 = 0
		local bomb_Num = 0
		while 1 do	
			sleep(10)
			counter1 = counter1 + 1
			if counter1 == 1 then
				for i = 10 , 1 , -1 do
				bomb_Num = i
				say (OwnerID() , bomb_Num)
				break
				end
			counter1 = 0
			end
		end
	end
end			
------------------------------------------------------------------------------------------------------------------------------------------------------------------------

