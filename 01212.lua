function lua_star_RandomSpawn_00()                                                                                                 
	while 1 do
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) == 0 then 
			local flag_number = 4
			local flag_select = Rand( flag_number )                                                                                        --�H����@�Ѥl
			local mob = CreateObjByFlag( 100909, 780280 , flag_select , 1 )                            --�ѷӫ��w���󪺦�m�Ӳ��ͪ���@(���ͪ�����ID�A�X�lID�A�H�����X���A���ͪ��ƶq)
			WriteRoleValue( OwnerID(), EM_RoleValue_PID , 1 )							
			WriteRoleValue( mob , EM_RoleValue_PID , OwnerID() )
			BeginPlot( mob , "lua_star_RandomSpawn_01" , 0 ) 							
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) == 1 then	
			sleep(50)
		elseif ReadRoleValue( OwnerID() , EM_RoleValue_PID  ) == 2 then	
			sleep(300)	
			WriteRoleValue( OwnerID(), EM_RoleValue_PID , 0 )
		end	
	end		
end

function lua_star_RandomSpawn_01()                                         	
	AddToPartition( OwnerID() , 0 )    
	--SetRandMove( OwnerID(), 200 , 100 , 50 )                                                        
	setplot( OwnerID()  , "dead","lua_star_RandomSpawn_02", 0 )			                           --���`�@��
end

function lua_star_RandomSpawn_02()                                         	
	local spawner = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	WriteRoleValue( spawner, EM_RoleValue_PID , 2 )
end

----------------------------------------------------------------------------------------------------------------------------------------------���j���W�����H
function lua_star_HungryCyclap_01()
	setplot( OwnerID()  , "touch" , "lua_star_HungryCyclap_02", 50 )
end

function lua_star_HungryCyclap_02()
	--Say( OwnerID() , "test" )
	ScriptMessage( OwnerID() , 0 , 2 , "[SC_101625_1]" , 1 )
	local ObjCount = SetSearchRangeInfo( OwnerID(),100 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 101625 then
			--SetFightMode ( ID ,1, 0, 0,1 )
			Yell( ID , "[SC_101625_0]" , 5 )
			sleep(10)
			CastSpell( ID , ID , 492540 )
			sleep(20)
			CancelBuff( ID , 502782 )
			break
		end
	end
end


----------------------------------------------------------------------------------------------------------------------------------------------101623 �ε۪��W��   101633���d��
function lua_star_SleepCyclap_01()
	setplot( OwnerID()  , "dead","lua_star_SleepCyclap_02", 0 )
end

function lua_star_SleepCyclap_02()
	local ObjCount = SetSearchRangeInfo( OwnerID(),300 )
	local obj
	for i = 1 , ObjCount , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if ReadRoleValue( ID , EM_RoleValue_OrgID ) == 101603 then
			SetRoleCamp( ID , "Monster" )
			SetAttack( ID , TargetID() )
			Yell(ID , "[SC_101603_0]" , 5 )	
			BeginPlot( ID ,"lua_star_SleepCyclap_03",0)
			break
		end
	end
end	

function lua_star_SleepCyclap_03()
	while 1 do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then	
			sleep(10)
		else				
			SetRoleCamp( OwnerID()  , "Visitor" )
			break
		end	
	end
end

-------------------------------------------------------------------------------------------------------------------------�ե֪��W��
function lua_star_stealthCyclap()
	while 1 do
	local counter = 0
	AddBuff( OwnerID() , 501055 , 1 , 3600 ) 	
		for i = 0 , 30 do	
			local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
			sleep(10)
			counter = counter + 1 	
			if ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then					
				sleep(600)	
			else
				if counter == 15 then					
					CancelBuff( OwnerID() , 501055 )
					sleep(150)
					break
				end	
			end				
		end
	end
end
