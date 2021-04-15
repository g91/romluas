--南瓜寶寶寵物箱 7 天
function LuaI_helloegg011( Option )
	local PlayerID = OwnerID()
	local PackageID = 203143		
	local Item = 203157                               
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--南瓜寶寶寵物箱 30 天
function LuaI_helloegg012( Option )
	local PlayerID = OwnerID()
	local PackageID = 203145		
	local Item = 203147                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--死神寶寶寵物箱 7 天
function LuaI_helloegg021( Option )
	local PlayerID = OwnerID()
	local PackageID = 203144		
	local Item = 203158                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--死神寶寶寵物箱 30 天
function LuaI_helloegg022( Option )
	local PlayerID = OwnerID()
	local PackageID = 203146		
	local Item = 203156                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--蠑螈寶寶寵物箱 7天
function LuaI_helloegg031( Option )
	local PlayerID = OwnerID()
	local PackageID = 203181		
	local Item = 203206                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--蠑螈寶寶寵物箱 30天
function LuaI_helloegg032( Option )
	local PlayerID = OwnerID()
	local PackageID = 203188		
	local Item = 203197                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--哥不林寵物箱 7天
function LuaI_helloegg041( Option )
	local PlayerID = OwnerID()
	local PackageID = 203182		
	local Item = 203207                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--哥不林寵物箱 30天
function LuaI_helloegg042( Option )
	local PlayerID = OwnerID()
	local PackageID = 203189		
	local Item = 203198                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--幼狼寶寶寵物箱 7天
function LuaI_helloegg051( Option )
	local PlayerID = OwnerID()
	local PackageID = 203183		
	local Item = 203208                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--幼狼寶寶寵物箱 30天
function LuaI_helloegg052( Option )
	local PlayerID = OwnerID()
	local PackageID = 203190		
	local Item = 203199                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--黑皮豬寵物箱 7天
function LuaI_helloegg061( Option )
	local PlayerID = OwnerID()
	local PackageID = 203184		
	local Item = 203209                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--黑皮豬寵物箱 30天
function LuaI_helloegg062( Option )
	local PlayerID = OwnerID()
	local PackageID = 203191		
	local Item = 203200                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--粉色球球寵物箱 7天
function LuaI_helloegg071( Option )
	local PlayerID = OwnerID()
	local PackageID = 203185		
	local Item = 203210                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--粉色球球寵物箱 30天
function LuaI_helloegg072( Option )
	local PlayerID = OwnerID()
	local PackageID = 203192		
	local Item = 203201                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--橘色球球寵物箱 7天
function LuaI_helloegg081( Option )
	local PlayerID = OwnerID()
	local PackageID = 203186		
	local Item = 203211                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--橘色球球寵物箱 30天
function LuaI_helloegg082( Option )
	local PlayerID = OwnerID()
	local PackageID = 203193		
	local Item = 203202                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--南瓜怪寵物箱 7天
function LuaI_helloegg091( Option )
	local PlayerID = OwnerID()
	local PackageID = 203187		
	local Item = 203212                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--南瓜怪寵物箱 30天
function LuaI_helloegg092( Option )
	local PlayerID = OwnerID()
	local PackageID = 203194		
	local Item = 203203                                
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--小巨人寵物箱 30天
function LuaI_helloegg093( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 201161
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar01 30天
function LuaI_helloegg101( Option )
	local PlayerID = OwnerID()
	local PackageID = 204095		
	local Item = 204102
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar02 30天
function LuaI_helloegg102( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204103
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar03 30天
function LuaI_helloegg103( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204104
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar04 30天
function LuaI_helloegg104( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204105
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar05 30天
function LuaI_helloegg105( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204106
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar06 30天
function LuaI_helloegg106( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204107
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end

--ForgStar07 30天
function LuaI_helloegg107( Option )
	local PlayerID = OwnerID()
	local PackageID = 203584		
	local Item = 204108
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
			GiveBodyItem( PlayerID , Item , 1 )	
	end
end