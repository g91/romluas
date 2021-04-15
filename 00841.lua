
function Check_Relation( Player , RelationType )

	local RelationPosTotal = 20

	for i = 0 , RelationPosTotal - 1 do
		if ( GetRelation_Relation( Player , i ) == RelationType ) then 
			return true
		end
	end

	return false

end

function Get_RelationPos( Player , RelationType )

	local RelationPosTotal = 20
	
	for i = 0 , RelationPosTotal - 1 do
		if ( GetRelation_Relation( Player , i ) == RelationType ) then
			return i
		end
	end
end


function lua_mika_zoneidtest1()  --給夫用的 
	local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
	local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --對方的DBID
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
	local targetzoneID = GetZoneID( targetdbid ) 
	local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	Say(OwnerID(), selfdbid )
	Say(OwnerID(), targetdbid )
	Say(OwnerID(), MyZone)
	Say(OwnerID(), targetzoneID)
end

function lua_mika_zoneidtest2()  --給妻用的 
	local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
	local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --對方的DBID
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
	local targetzoneID = GetZoneID( targetdbid ) 
	local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	Say(OwnerID(), selfdbid )
	Say(OwnerID(), targetdbid )
	Say(OwnerID(), MyZone)
	Say(OwnerID(), targetzoneID)
end

--遊戲販賣婚戒
function LuaQ_202817_MarryTransfer( Option )		-- 男婚戒使用
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --

	if ( Option == "CHECK" ) then
		if  IamW  == true then   --我有沒老婆
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --對方的DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  -- 對方在不在線上
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--判斷自己在不在戰場
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --如果自己在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --你無法在此區域無法進行傳送！
				return false
			elseif targetzone == -1 then --如果對方在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --對方目前所在位置無法進行傳送！
				return false
			else
			--	Say(OwnerID(), targetdbid)
				if online == TRUE then  
					--在線上
				--	say(OwnerID(), "online")
				--	Say(OwnerID(), MyZoneID)
				--	Say(OwnerID(), MyZone)
					if MyZoneID >= 1000 then  --有分流的一般ZONE 
				--		Say(OwnerID(), "YOU CAN GO 1 !") --無分流的一般ZONE 
						if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
							return true
						else
							if targetzoneID >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
							--	Say(OwnerID(), targetzone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
								return FALSE
							end
						end
					else  
						if MyZoneID >= 100 then --如果我所在區域超過100 (即非一般zone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- 無法傳送，你無法在此區域無法進行傳送。
								return FALSE
						else  
					--		Say(OwnerID(), "YOU CAN GO 2 ") --無分流的一般ZONE 
						--	Say(OwnerID(), targetdbid)
						--	Say(OwnerID(), targetzoneID)

							if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
								return true
							else
								if targetzone >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
									return FALSE
								else
									return true
								end
							end
						end
					end
				else
					--不在線上
				--	say(OwnerID(), "offline")
					ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_33") , 0 )		-- 無法傳送，你的配偶目前不在線上或是正在副本中！！
					return false
				end

			end
		else
			--沒老婆
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_32") , 0 )		-- 無法傳送，你尚未建立婚姻關係！！
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( OwnerID(), GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  --去老婆的位置
	end
end

function LuaQ_202818_MarryTransfer( Option )		-- 女婚戒使用
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	if ( Option == "CHECK" ) then
		if  IamH  == true then   --我有沒老公
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --對方的DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  -- 對方在不在線上
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--判斷自己在不在戰場
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --如果自己在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --你無法在此區域無法進行傳送！
				return false
			elseif targetzone == -1 then --如果對方在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --對方目前所在位置無法進行傳送！
				return false
			else
				if online == TRUE then
					--在線上
				--	say(OwnerID(), "online")
					if MyZoneID >= 1000 then  --有分流的一般ZONE 
				--		Say(OwnerID(), "YOU CAN GO 1 !") --無分流的一般ZONE 
						if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
							return true
						else
							if targetzoneID >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
							--	Say(OwnerID(), targetzone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
								return FALSE
							end
						end
					else  
						if MyZoneID >= 100 then --如果我所在區域超過100 (即非一般zone)
								ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- 無法傳送，你無法在此區域無法進行傳送。
								return FALSE
						else  
					--		Say(OwnerID(), "YOU CAN GO 2 ") --無分流的一般ZONE 
						--	Say(OwnerID(), targetdbid)
						--	Say(OwnerID(), targetzoneID)

							if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
								return true
							else
								if targetzone >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
									return FALSE
								else
									return true
								end
							end
						end
					end
				else
					--不在線上
				--	say(OwnerID(), "offline")
					ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_33") , 0 )		-- 無法傳送，你的配偶目前不在線上或是正在副本中！！
					return false
				end
			end
		else
			--沒老公
			ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_MARRY_32") , 0 )		-- 無法傳送，你尚未建立婚姻關係！！
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( OwnerID() , GetRelation_DBID( OwnerID(), Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  --去老公的位置
	end
end

function LuaQ_202543_MarryTransfer( Option )		-- 男婚戒使用
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	local Player = OwnerID()
	if ( Option == "CHECK" ) then
		if  IamW  == true then   --我有沒老婆
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) )  --對方的DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Wife ) ) )  -- 對方在不在線上
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 
	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--判斷自己在不在戰場
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --如果自己在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --你無法在此區域無法進行傳送！
				return false
			elseif targetzone == -1 then --如果對方在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --對方目前所在位置無法進行傳送！
				return false
			else	
				if online == TRUE then
					--在線上
				--	say(OwnerID(), "online")
					if CountBodyItem( Player , 202545 ) >= 1 then
					--	Say(OwnerID(), MyZoneID)
					--	Say(OwnerID(), MyZone)
						if MyZoneID >= 1000 then  --有分流的一般ZONE 
					--		Say(OwnerID(), "YOU CAN GO 1 !") --無分流的一般ZONE 
							if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
								return true
							else
								if targetzoneID >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
									return FALSE
								end
							end
						else  
							if MyZoneID >= 100 then --如果我所在區域超過100 (即非一般zone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- 無法傳送，你無法在此區域無法進行傳送。
									return FALSE
							else  
						--		Say(OwnerID(), "YOU CAN GO 2 ") --無分流的一般ZONE 
							--	Say(OwnerID(), targetdbid)
							--	Say(OwnerID(), targetzoneID)

								if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
									return true
								else
									if targetzone >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
									--	Say(OwnerID(), targetzone)
										ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
										return FALSE
									else
										return true
									end
								end
							end
						end
					else
						ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_31") , 0 )		-- 無法傳送，你需要一個愛愛果凍！！
						return false
					end
				else
					--不在線上
			--		say(OwnerID(), "offline")
					ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_33") , 0 )		-- 無法傳送，你的配偶目前不在線上或是正在副本中！！
					return false
				end
			end
		else
			--沒老婆
			ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_32") , 0 )		-- 無法傳送，你尚未建立婚姻關係！！
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( Player , GetRelation_DBID( Player , Get_RelationPos( Player , EM_RelationType_Wife ) ) )  --去老婆的位置
	end
end

function LuaQ_202544_MarryTransfer( Option )		-- 女婚戒使用
	local IamH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local IamW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  
	local YouH = Check_Relation( OwnerID() , EM_RelationType_Husband )  --
	local YouW = Check_Relation( OwnerID() , EM_RelationType_Wife  )  --
	local Player = OwnerID()
	if ( Option == "CHECK" ) then
		if  IamH  == true then   --我有沒老公
			local selfdbid = ReadRoleValue(OwnerID(), EM_RoleValue_DBID ) 
			local targetdbid = GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) )  --對方的DBID
			local online =  CheckOnlinePlayer(GetRelation_DBID( OwnerID() , Get_RelationPos( OwnerID() , EM_RelationType_Husband ) ) )  -- 對方在不在線上
			local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )  -- 自己的zone id
			local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
			local targetzoneID = GetZoneID( targetdbid ) 
			local targetzone = targetzoneID -1000*math.floor( targetzoneID / 1000 ) 

	--		Say(OwnerID(), selfdbid )
	--		Say(OwnerID(), targetdbid )
	--		Say(OwnerID(), MyZone)
	--		Say(OwnerID(), targetzoneID)
			--判斷自己在不在戰場
			if MyZone == 402 or MyZone == 440 or MyZone == 441 or MyZone == 442 or MyZone == 443 or MyZone == 444 or MyZone == 445 or MyZone == 446 or MyZone == 354 then  --如果自己在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_01]" , 0 ) --你無法在此區域無法進行傳送！
				return false
			elseif targetzone == -1 then --如果對方在戰場
				ScriptMessage(OwnerID(),OwnerID(),1, "[SC_MARRY_RING_02]" , 0 ) --對方目前所在位置無法進行傳送！
				return false
			else
			--	Say(OwnerID(), targetdbid)
				if online == TRUE then
					--在線上
				--	say(OwnerID(), "online")
					if CountBodyItem( Player , 202545 ) >= 1 then
						if MyZoneID >= 1000 then  --有分流的一般ZONE 
					--		Say(OwnerID(), "YOU CAN GO 1 !") --無分流的一般ZONE 
							if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
								return true
							else
								if targetzoneID >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
								--	Say(OwnerID(), targetzone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
									return FALSE
								end
							end
						else  
							if MyZoneID >= 100 then --如果我所在區域超過100 (即非一般zone)
									ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_01]" , 0 )		-- 無法傳送，你無法在此區域無法進行傳送。
									return FALSE
							else  
						--		Say(OwnerID(), "YOU CAN GO 2 ") --無分流的一般ZONE 
							--	Say(OwnerID(), targetdbid)
							--	Say(OwnerID(), targetzoneID)

								if targetzoneID >= 1000 then  --有分流的一般ZONE(對方)
									return true
								else
									if targetzone >= 100 then --如果所在區域超過100 (即非一般zone)(對方)
									--	Say(OwnerID(), targetzone)
										ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MARRY_RING_02]" , 0 )		-- 無法傳送，對方目前所在位置無法進行傳送。
										return FALSE
									else
										return true
									end
								end
							end
						end
					else
						ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_31") , 0 )		-- 無法傳送，你需要一個愛愛果凍！！
						return false
					end
				else
					--不在線上
			--		say(OwnerID(), "offline")
					ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_33") , 0 )		-- 無法傳送，你的配偶目前不在線上或是正在副本中！！
					return false
				end
			end
		else
			--沒老公
			ScriptMessage( Player , Player , 1 , GetString("SC_MARRY_32") , 0 )		-- 無法傳送，你尚未建立婚姻關係！！
			return false
		end
	elseif ( Option == "USE" ) then
		GotoPlayer_DBID( Player , GetRelation_DBID( Player , Get_RelationPos( Player , EM_RelationType_Husband ) ) )  --去老公的位置
	end
end



function Get_MAXLV( Player )
	if ( Player == nil ) then
		Player = OwnerID()
	end

	local LV_Warrior = ReadRoleValue( Player , EM_RoleValue_VOCLV_Warrior )
	local LV_Ranger = ReadRoleValue( Player , EM_RoleValue_VOCLV_Ranger )
	local LV_Rogue = ReadRoleValue( Player , EM_RoleValue_VOCLV_Rogue )
	local LV_Wizard = ReadRoleValue( Player , EM_RoleValue_VOCLV_Wizard )
	local LV_Priest = ReadRoleValue( Player , EM_RoleValue_VOCLV_Priest )
	local LV_Knight = ReadRoleValue( Player , EM_RoleValue_VOCLV_Knight )

	local MAXLV = math.max( LV_Warrior , LV_Ranger , LV_Rogue , LV_Wizard , LV_Priest , LV_Knight )

	--Say( Player , MAXLV )

	return MAXLV
end