
function LuaFunc_personalfollow()
	local time_count = 0
	local playerID=TargetID()
	local flag_number = 0

	while 1 do
		local s=1
		if s>60000 then
			break
		else
			s = s+1
		end
		
		

		if time_count>50 then
			ScriptMessage( OwnerID(), playerID, 1 ,"Sorry,You need give up,and accept mission again.",0 )
			LuaFunc_ResetObj( OwnerID()  )
			break
		end



		if GetDistance( OwnerID(), playerID ) > 200 then
			time_count=time_count+10
			Move( OwnerID(),  ReadRoleValue( OwnerID(), EM_RoleValue_X)   ,   ReadRoleValue( OwnerID(), EM_RoleValue_Y)    ,   ReadRoleValue( OwnerID(), EM_RoleValue_Z)  )
		else
			
			time_count=0
		

		
			if ( GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_X ) / 10 ) == ( ReadRoleValue( OwnerID(), EM_RoleValue_X) / 10 )  then
				if ( GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_Z ) / 10 ) == ( ReadRoleValue( OwnerID(), EM_RoleValue_Z) / 10 )  then
					if  flag_number == 2  then
						
						Say( OwnerID(), "bingo" )
						SetFlag( playerID , 540853 , 1 )
						LuaFunc_ResetObj( OwnerID() )
						break
					else
						Say( OwnerID(), "next" )
						flag_number =flag_number +1
					end
				else
					Move( OwnerID(), GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_X )  , GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_Y )  , GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_Z )  )

				end
			else
				
				Move( OwnerID(), GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_X )  , GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_Y )  , GetMoveFlagValue( 780074 , flag_number  , EM_RoleValue_Z )  )
			end
			

		end




		sleep(30)
	end
end

