function lua_star_emptysoul1()
	while 1 do				
		sleep(10)	
		local spam = 0
		local undead = {}
			for i = 1 , 8 do
				undead[i] = 0
			end
		local nopriest = 1	
		while 1 do
			sleep(10)	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )					
			if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
				local NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )
				local HPPercent =( NowHP / MaxHP)*100
				local partymember = LuaFunc_PartyData( AttackTarget )				
				local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )							
				if HPPercent <= 90 and spam == 0  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[1] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[1] , partymember[i] )
							nopriest = 0
							break					
						end
					end	
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[1] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[1] , partymember[i] )				
							break								
						end	
					end
				elseif HPPercent <= 80 and spam == 1  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[2] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[2] , partymember[i] )
							nopriest = 0
							break					
						end
					end	
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[2] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[2] , partymember[i] )				
							break								
						end	
					end
				elseif HPPercent <= 70 and spam == 2  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[3] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[3] , partymember[i] )
							nopriest = 0
							break					
						end
					end
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[3] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[3] , partymember[i] )				
							break								
						end	
					end
				elseif HPPercent <= 60 and spam == 3  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[4] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[4] , partymember[i] )
							nopriest = 0
							break					
						end
					end
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[4] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[4] , partymember[i] )				
							break								
						end	
					end	
				elseif HPPercent <= 50 and spam == 4  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then		
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[5] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[5] , partymember[i] )
							nopriest = 0
							break					
						end
					end	
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[5] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[5] , partymember[i] )				
							break								
						end	
					end	
				elseif HPPercent <= 40 and spam == 5  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[6] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[6] , partymember[i] )
							nopriest = 0
							break					
						end
					end
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[6] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[6] , partymember[i] )				
							break								
						end	
					end
				elseif HPPercent <= 30 and spam == 6  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[7] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[7] , partymember[i] )
							nopriest = 0
							break					
						end
					end	
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[7] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[7] , partymember[i] )				
							break								
						end	
					end
				elseif HPPercent <= 20 and spam == 7  then										
					spam = spam + 1
					for i = 1 , partymember[0] , 1 do
						if ReadRoleValue( partymember[i] , EM_RoleValue_VOC ) == 5 and ReadRoleValue( partymember[i] , EM_RoleValue_IsDead ) ~= 1  then	
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[8] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)
							SetAttack( undead[8] , partymember[i] )
							nopriest = 0
							break					
						end
					end
					if nopriest == 1 then
						for i = 1 , partymember[0] , 1 do			
							ScriptMessage( OwnerID() , -1 , 2 , GetString("SC_100563_1") , 1 )                    ------糧辅艶活ㄓ
							sleep(10)
							undead[8] = lua_star_CreateNPC( partymember[i] , 0 , 100071 , 10 , roomid1)							
							SetAttack( undead[8] , partymember[i] )				
							break								
						end	
					end	
				end
			else
				--Say( OwnerID() , "ok" )
				for i = 1 , 8 , 1 do
					sleep(1)					
					if undead[i] ~= nil and CheckID(undead[i] ) == true  then
						DelObj( undead[i] )	
					end		
				end
				--undead = {}
				break		
			end
		end	
	end
end
