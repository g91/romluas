
-- 人類包
function SongSong_Bag_LV4( Option )

	local PlayerID = OwnerID()
	local PackageID = 201846		-- 聚落禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }	
	-- 防具
	local ArmorGroup = { }	
	-- 飾品
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --符文福袋
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201847 , 1 )	-- 給下一個包
		SetFlag( PlayerID , 542324 , 1 )	-- 新手禮包LV4已開啟
	end

end


-- 精靈

function SongSong_Bag_LV4_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205932		-- 認證禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }	
	-- 防具
	local ArmorGroup = { }	
	-- 飾品
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --符文福袋
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205933 , 1 )	-- 給下一個包 大師禮包
		SetFlag( PlayerID , 542324 , 1 )	-- 新手禮包LV4已開啟
	end
end


-- 矮人
function SongSong_Bag_LV4_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241256		-- 祝福禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }	
	-- 防具
	local ArmorGroup = { }	
	-- 飾品
	local AccessGroup = { 221673 , 221673 , 221673 , 221673 , 221673 , 221673  , 221673 , 221673 , 221673 , 221673 }
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663		-- 簡易急救藥水
	local MPPotionID = 201042		-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 50

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542324 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 201521 , 1 )  --符文福袋
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241257 , 1 )	-- 給下一個包 礦坑禮包
		SetFlag( PlayerID , 542324 , 1 )	-- 新手禮包LV4已開啟
	end

end

-- 人類
function SongSong_Bag_LV5( Option )

	local PlayerID = OwnerID()
	local PackageID = 201847		-- 礦坑禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }
	-- 防具
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- 飾品
	local AccessGroup = { }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }

	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- 空間記錄墨水
		GiveBodyItem( PlayerID , 202903 , 5 ) -- 傳送者符文
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201848 , 1 )	-- 給下一個包 lv6
		SetFlag( PlayerID , 542325 , 1 )	-- 新手禮包LV5已開啟
	end

end


-- 精靈
function SongSong_Bag_LV5_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205933		-- 大師禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }
	-- 防具
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- 飾品
	local AccessGroup = { }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }		-- 戰士、遊俠、影行、法師、祭司、騎士
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- 空間記錄墨水
		GiveBodyItem( PlayerID , 202903 , 5 ) -- 傳送者符文
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205934 , 1 )	-- 給下一個包 lv6 遠行禮包
		SetFlag( PlayerID , 542325 , 1 )	-- 新手禮包LV5已開啟
	end
end

-- 矮人
function SongSong_Bag_LV5_2( Option )
	local PlayerID = OwnerID()
	local PackageID = 241257		-- 礦坑禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = { }
	-- 防具
	local ArmorGroup = { 221676 , 221675 , 221675 , 221674 , 221674 , 221676 ,221676 ,221674 ,221674 ,221676 }	
	-- 飾品
	local AccessGroup = { }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = { }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542325 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , 202902, 1 ) -- 空間記錄墨水
		GiveBodyItem( PlayerID , 202903 , 5 ) -- 傳送者符文
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241258 , 1 )	-- 給下一個包 lv6 友誼禮包
		SetFlag( PlayerID , 542325 , 1 )	-- 新手禮包LV5已開啟
	end
end

-- 人類
function SongSong_Bag_LV6( Option )

	local PlayerID = OwnerID()
	local PackageID = 201848		-- 羅格禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {}	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201849 , 1 )	-- 給下一個包 lv7
		SetFlag( PlayerID , 542326 , 1 )	-- 新手禮包LV6已開啟
	end

end


-- 精靈
function SongSong_Bag_LV6_1( Option )

	local PlayerID = OwnerID()
	local PackageID = 205934		-- 遠行禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }	
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {}	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 205935 , 1 )	-- 給下一個包 lv7 蕈林禮包
		SetFlag( PlayerID , 542326 , 1 )	-- 新手禮包LV6已開啟
	end

end

-- 矮人
function SongSong_Bag_LV6_2( Option )

	local PlayerID = OwnerID()
	local PackageID = 241258		-- 友誼禮包
	local NeedSpace = 3 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = { 221677 , 221677 , 221677 , 221677 , 221677 , 221677  , 221677 , 221677  , 221677 , 221677 }	
	-- 藥水
	local HPPotionGroup = { 10, 10, 10 ,5, 5, 5, 5, 5 ,10, 10 }
	local MPPotionGroup = { 0, 0, 0, 5, 5, 5, 5, 5, 0, 0 }		
	local HPPotionID = 200663	-- 簡易急救藥水
	local MPPotionID = 201042	-- 簡易魔力藥水
	-- 護符
	local HuFuGroup = {}	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 80
	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542326 ) == true then
			UseItemDestroy() 		--刪除使用中的物品
			BeginPlot( PlayerID , "SongSong_Bag_Bomb" , 0 )
			return false
		end
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then
		if ( WeaponID ~= nil  ) then		GiveBodyItem( PlayerID , WeaponID , 1 )			end
		if ( ArmorID ~= nil  ) then		GiveBodyItem( PlayerID , ArmorID , 1 )				end
		if ( AccessID ~= nil  ) then		GiveBodyItem( PlayerID , AccessID , 1 )				end
		if ( HuFuID ~= nil  ) then		GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 241259 , 1 )	-- 給下一個包 lv7 膽識禮包
		SetFlag( PlayerID , 542326 , 1 )	-- 新手禮包LV6已開啟
	end

end