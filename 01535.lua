--焰火啤酒
function LuaI_205898( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() == OwnerID() )   then   --若對象是自己
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*有騎乘狀態
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --有極冰buff
						CastSpell( TargetID(), TargetID(), 494149 ) --喝酒動作
						CancelBuff(TargetID(), 504666) --取消極冰
						DelBodyItem( OwnerID() , 205898 , 1 ) --焰火啤酒
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC18]" , C_SYSTEM )	--你溶解了周圍的寒冷。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC18]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --有焰火buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC16]" , C_SYSTEM )	--你飲用了焰火啤酒，突然感到全身發熱。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC16]"  , C_SYSTEM )	--
						return true
					end
				end
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*有騎乘狀態
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --有極冰buff
						CastSpell( TargetID(), TargetID(), 494149 ) --喝酒動作
						CancelBuff(TargetID(), 504666) --取消極冰
						DelBodyItem( OwnerID() , 205898 , 1 ) --焰火啤酒
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC06]" , C_SYSTEM )	--你溶解了對方周圍的寒冷。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC06]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC07]" , C_SYSTEM )	--某個熱情的玩家使用焰火啤酒，融化了你周圍的寒冷。
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC07]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --有焰火buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC08]" , C_SYSTEM )	--你邀請對方飲用了一瓶[205898]。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC08]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC09]" , C_SYSTEM )	--某個熱情的玩家邀請你飲用了[205898]，你突然覺得全身發熱。
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC09]"  , C_SYSTEM )	--
						return true
					end
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--此物品只能對其他玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--此物品只能對其他玩家使用。
			return false
		end
	elseif ( Option == "USE" ) then
		CastSpell( TargetID(), TargetID(), 494184 ) 
	end
end

--極冰啤酒
function LuaI_205899( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() == OwnerID() )   then   --若對象是自己
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*有騎乘狀態
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
					return false
				else
					if CheckBuff(TargetID(), 504666) == true then  --有極冰buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						return false
					elseif CheckBuff(TargetID(), 504665) == true then  --有焰火buff
						CastSpell( TargetID(), TargetID(), 494149 ) --喝酒動作
						CancelBuff(TargetID(), 504665) --取消焰火
						DelBodyItem( OwnerID() , 205899 , 1 ) --極冰啤酒
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC19]" , C_SYSTEM )	--你熄滅了周圍的熱度。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC19]"  , C_SYSTEM )	--
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC17]" , C_SYSTEM )	--你飲用了[205899]，突然感到全身發冷。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC17]"  , C_SYSTEM )	--
						return true
					end
				end
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*有騎乘狀態
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
					return false
				else
					if CheckBuff(TargetID(), 504665) == true then  --有焰火buff
						CastSpell( TargetID(), TargetID(), 494149 ) --喝酒動作
						CancelBuff(TargetID(), 504665) --取消焰火
						DelBodyItem( OwnerID() , 205899 , 1 ) --極冰啤酒
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC10]" , C_SYSTEM )	--你熄滅了對方周圍的熱度。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC10]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC11]" , C_SYSTEM )	--某個神秘的玩家使用極冰啤酒，融化了你周圍的熱度。
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC11]"  , C_SYSTEM )	--
						return false
					elseif CheckBuff(TargetID(), 504666) == true then  --有極冰buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC05]"  , C_SYSTEM )	--使用對象已持有相同類型效果，無法使用。
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC12]" , C_SYSTEM )	--你邀請對方飲用了一瓶[205899]。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC12]"  , C_SYSTEM )	--
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC13]" , C_SYSTEM )	--某個神秘的玩家邀請你飲用了[205899]，你突然覺得全身發冷。
						ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC13]"  , C_SYSTEM )	--
						return true
					end
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--此物品只能對其他玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--此物品只能對其他玩家使用。
			return false
		end
	elseif ( Option == "USE" ) then
		CastSpell( TargetID(), TargetID(), 494185 ) 
	end
end

--特調啤酒法術
function LuaI_205894( Option ) 
	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() == OwnerID() )   then   --若對象是自己
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC01]" , C_SYSTEM )	--此物品無法對自己使用，請對其它玩家使用。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC01]"  , C_SYSTEM )	--此物品無法對自己使用，請對其它玩家使用。
				return false
			else
				local BuffType = 0
				local Count = BuffCount ( TargetID())
				for i = 0 , Count do
					local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
					if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
						BuffType = GameObjInfo_int ( BuffID , "AssistType" )
						break
					end
				end
				if BuffType == 68 then				       	    --/*有騎乘狀態
					ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
					return false
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC14]" , C_SYSTEM )	--你邀請對方一同飲用一瓶[205894]。
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC14]"  , C_SYSTEM )	
					ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_BEERDAY_MAGIC15]" , C_SYSTEM )	--某個人邀請你一同飲用了[205894]。
					ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_BEERDAY_MAGIC15]"  , C_SYSTEM )	
					return true
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_BEERDAY_MAGIC02]" , C_SYSTEM )	--此物品只能對其他玩家使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BEERDAY_MAGIC02]"  , C_SYSTEM )	--此物品只能對其他玩家使用。
			return false
		end
	elseif ( Option == "USE" ) then
	--	PlayMotion( TargetID(), 118) --喝
	--	PlayMotion( OwnerID(), 118) --喝
		local RANDOWN = rand(19)
		if RANDOWN == 0 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP1/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "0HP" )
		elseif RANDOWN == 1 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP1/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "1MP" )
		elseif RANDOWN == 2 then  
			CastSpell( OwnerID(), TargetID(), 494262 ) --物攻魔攻1/1
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494262 ) 
			sleep(10)
--			Say(OwnerID(), "2attack" )
		elseif RANDOWN == 3 then  
			CastSpell( OwnerID(), TargetID(), 494260 ) --hpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494260 ) 
			sleep(10)
--			Say(OwnerID(), "3hpmax" )
		elseif RANDOWN == 4 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP2/7
			sleep(10)
			CastSpell(TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "5HP" )
		elseif RANDOWN == 5 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP2/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "5MP" )
		elseif RANDOWN == 6 then  
			CastSpell( OwnerID(), TargetID(), 494188 ) --命中 1/1
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494188 ) 
			sleep(10)
--			Say(OwnerID(), "6up" )
		elseif RANDOWN == 7 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP3/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "7HP" )
		elseif RANDOWN == 8 then  
			CastSpell( OwnerID(), TargetID(), 494260 ) --hpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494260 ) 
			sleep(10)
--			Say(OwnerID(), "8hpmax" )
		elseif RANDOWN == 9 then  
			CastSpell( OwnerID(), TargetID(), 494261 ) --mpmax 1/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494261 ) 
			sleep(10)
--			Say(OwnerID(), "9mpmax" )
		elseif RANDOWN == 10 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP3/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "10MP" )
		elseif RANDOWN == 11 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP5/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "11MP" )
		elseif RANDOWN == 12 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP4/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "12HP" )
		elseif RANDOWN == 13 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP6/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "13MP" )
		elseif RANDOWN == 14 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP5/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "14HP" )
		elseif RANDOWN == 15 then  
			CastSpell( OwnerID(), TargetID(), 494261 ) --mpmax 2/2
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494261 ) 
			sleep(10)
--			Say(OwnerID(), "15mpmax" )
		elseif RANDOWN == 16 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP4/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "16MP" )
		elseif RANDOWN == 17 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP6/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "17HP" )
		elseif RANDOWN == 18 then  
			CastSpell( OwnerID(), TargetID(), 494187 ) --MP7/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494187 ) 
			sleep(10)
--			Say(OwnerID(), "18MP" )
		elseif RANDOWN == 19 then  
			CastSpell( OwnerID(), TargetID(), 494186 ) --HP7/7
			sleep(10)
			CastSpell( TargetID(), OwnerID(), 494186 ) 
			sleep(10)
--			Say(OwnerID(), "19HP" )
		end
	end
end

--(1) up       1/20	1小時內，命中率提升3%    504631 -
--(2) mpmax 2/20	1小時內，最大MP上限提升5%  504632
--(3) hpmax 2/20	1小時內，最大HP上限提升5%  504633
--(4)attack  1/20	1小時內，物攻魔攻各提升5%  504634
--(5) hp  7/20	直接恢復使用者雙方HP15%	494186 --Castspell -
--(6) mp 7/20	直接恢復使用者雙方MP15%	494187 --Castspell --