function Lua_Dan_Item()
	--local Name = GetName( OwnerID())
	--local Name2 = GetName( TargetID())
	local Obj = Role:new(OwnerID())
	local attack     = ReadRoleValue( OwnerID(),  EM_RoleValue_IsAttackMode )  
	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
	local BuffType = 0
	local Count = BuffCount ( TargetID())

--say(OwnerID(), "1")
--say(TargetID(), "2")

		--ScriptMessage( OwnerID(), OwnerID(), 2,  "[SC_DAN_111700_39][$SETVAR1="..Name.."]", 0 ) --你對[VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
		--ScriptMessage( TargetID(),TargetID(), 2, "[SC_DAN_111700_40][$SETVAR1="..Name2.."]", 0 ) --[VAR1]對你施展了[204214]！你獲得了[204214]效果！
	
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
				if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
				end
		end
			
	
			

		
		
		if BuffType ~= 68 then		--/*沒有變身
		
			if attack ~= 1 then     --沒有戰鬥中
		 		
				if ZoneID > 0 and  ZoneID < 100 and Obj:RoomID() == 0 then  
					--ScriptMessage( OwnerID(), OwnerID() , 1, "" , C_SYSTEM )
					--ScriptMessage( OwnerID(), OwnerID(),  0, "" , 0 )
					--ScriptMessage( OwnerID(), OwnerID(),  2,  "[SC_DAN_111700_39][$SETVAR1="..Name2.."]", 0 ) --你對[$VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
					--ScriptMessage( OwnerID(), OwnerID(),  0,  "[SC_DAN_111700_39][$SETVAR1="..Name2.."]", 0 ) --你對[$VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
					--ScriptMessage( OwnerID(), TargetID(), 2,  "[SC_DAN_111700_40][$SETVAR2="..Name.."]", 0 ) --[$VAR1]對你施展了[204214]！你獲得了[204214]效果！
					--ScriptMessage( OwnerID(), TargetID(), 0,  "[SC_DAN_111700_40][$SETVAR2="..Name.."]", 0 ) --[$VAR1]對你施展了[204214]！你獲得了[204214]效果！	
					return true
		
				elseif ZoneID > 100 or Obj:RoomID() ~= 0 then
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
					return false
		
				else
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "System Error" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
					return false
				end 
			else 
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_USECHECK_BATTLE_0]" , C_SYSTEM )
					return false --戰鬥中無法使用
			end

		else 

 			ScriptMessage( OwnerID(),OwnerID(),1,"[SC_NORIDE]",0)
			return false
		end 
	      
end


function Lua_Dan_Message()

	local Name = GetName( OwnerID())
	local Name2 = GetName( TargetID())


					ScriptMessage( OwnerID(), OwnerID(),  2,  "[SC_DAN_111700_39][$SETVAR1="..Name2.."]", 0 ) --你對[$VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
					ScriptMessage( OwnerID(), OwnerID(),  0,  "[SC_DAN_111700_39][$SETVAR1="..Name2.."]", 0 ) --你對[$VAR1]施展了[204214]！[VAR1]獲得了[204214]效果！
					ScriptMessage( OwnerID(), TargetID(), 2,  "[SC_DAN_111700_40][$SETVAR2="..Name.."]", 0 ) --[$VAR1]對你施展了[204214]！你獲得了[204214]效果！
					ScriptMessage( OwnerID(), TargetID(), 0,  "[SC_DAN_111700_40][$SETVAR2="..Name.."]", 0 ) --[$VAR1]對你施展了[204214]！你獲得了[204214]效果！
					return true

end


