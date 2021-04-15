function LuaI_207253( Option ) -- 7 天青蛙寶寶寵物箱
	local PlayerID = OwnerID()
	local PackageID = 207253		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207225 , 1 )	
	end
end
-------------------------------------------------------------------------------------------------------
function LuaI_207254( Option ) -- 7 天紅蛙寶寶寵物箱
	local PlayerID = OwnerID()
	local PackageID = 207254		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207226 , 1 )	
	end
end
-------------------------------------------------------------------------------------------------------
function LuaI_207255( Option ) -- 7 天冰蛙寶寶寵物箱
	local PlayerID = OwnerID()
	local PackageID = 207255
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207227 , 1 )	
	end
end
-------------------------------------------------------------------------------------------------------
function LuaI_207256( Option ) -- 7 天毒蛙寶寶寵物箱
	local PlayerID = OwnerID()
	local PackageID = 207256
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 207228 , 1 )	
	end
end
-------------------------------------------------------------------------------------------------------
function LuaI_207257( Option )	--公主托付的禮盒

	local PackageID = 207257
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )
	local KEY =  CountBodyItem( OwnerID() , 203178 ) --古老的鑰匙

	local item =	{	20 ,	{ 202506 , 1} ,		-- 黃金修理鎚*1			20%
				40 ,	{ 202916 , 10 } ,		-- 魔物精華*10			20%		
				60 ,	{ 202928 , 1 } ,		-- 魔幻寶盒能量10點*1		20%
				75 ,	{ 203576 , 1 } ,		-- 大師黃金修理鎚*1		15%
				85 ,	{ 201141 , 5 } ,		-- 菲尼克斯的救贖*5		10%
				95 ,	{ 201139 , 1 } ,		-- 大天使的嘆息*1		10%
				100 ,	{ 202881 , 1 }	}	-- 無瑕熔解石*1			5%

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( OwnerID() , PackageID ) >= 1 ) and ( CountBodyItem( OwnerID() , 203178 ) >= 1 ) then -- 確認玩家是否有禮盒及古老鑰匙
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_30]" , 0 ) 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_30]" , 0 ) 
			return false
		end

	elseif ( Option == "USE" ) then

		local Random = rand(100)
		local Step = 0

		for i = 1 , table.getn( item ) , 2 do
		--	Say( OwnerID() , table.getn( item ) )	--14 ( 7 * 2)
		--	Say( OwnerID() , Random )		--Random值
		--	Say( OwnerID() , item[i] )			--20.40.60...100
			if Random < item[i] then
				for j = 1 , table.getn( item[i+1] ) , 2 do
					GiveBodyItem( OwnerID() , item[i+1][j] , item[i+1][j+1] )
					DelBodyItem( OwnerID() , 203178 , 1 )
				--	Say( OwnerID() , table.getn(item[i+1]) )
				--	Say( OwnerID() , item[i+1][j] )		--物品ID
				--	Say( OwnerID() , item[i+1][j+1] )		--物品數量
					Step = 1
				end
			end
			if Step == 1 then
				break
			end
		end
	end
end
-------------------------------------------------------------------------------------------------------
function LuaI_207318() -- 雨蛙的鳴囊

	local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
--	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Zone = ZoneID -1000*math.floor( ZoneID / 1000 ) -- 判斷分流
--	local Obj = Role:new(OwnerID())
--	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
	local Attack = ReadRoleValue( TargetID() ,  EM_RoleValue_IsAttackMode )  

	local BuffType = 0
	local Count = BuffCount ( TargetID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
			BuffType = GameObjInfo_int ( BuffID , "AssistType" )
			break
		end
	end

	if BuffType == 68 then				       	    --/*有騎乘狀態無法使用

		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_GAMEMSGEVENT_167]" , 0 )  --騎乘不能使用
	--	Say( OwnerID() , "Ride" )
		return false
	end
	
	if Attack ~= 1 then     --沒有戰鬥中
	--	Say( OwnerID() , "No attack" )

		if Checkbuff( TargetID() , 506892 ) == false then -- 雨蛙詛咒
			if OwnerID() ~= TargetID() then
				 		
						if Zone > 0 and  Zone < 100 then  
		--				Say( OwnerID() , "Zone<100" )
							return true
				
						elseif Zone > 100 then
							ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]" , C_SYSTEM )	-- 你無法在此區域使用該物品！ 
							ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]" , 0 )		-- 你無法在此區域使用該物品！ 
							return false		
					--	else
					--		ScriptMessage( OwnerID() , OwnerID() , 1 , "System Error" , C_SYSTEM )
					--		ScriptMessage( OwnerID() , OwnerID() , 0 , "System Error" , 0 )	
					--		return false
						end
			else
		--	Say( OwnerID() , "Not Self" )
				ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )	-- 施法對象不正確，請對其他玩家使用。 
				ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_0908SEANSON_MAG01]" , 0 )		-- 施法對象不正確，請對其他玩家使用。 
				return false     
			end
		else
				ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )		-- 使用對象已持有相同效果，無法使用。 
				ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]" , 0 )			-- 使用對象已持有相同效果，無法使用。 
				return false     
		end

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_USECHECK_BATTLE_0]" , C_SYSTEM )	--此物品戰鬥中無法使用！
		return false
	end
end