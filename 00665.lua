function SongSong_Bag_LV13( Option )

	local PlayerID = OwnerID()
	local PackageID = 201855		-- 朵利安禮包
	local NeedSpace = 2 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- 急救藥水
	local MPPotionID = 201046	-- 魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542333 ) == true then
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
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201856 , 1 )	-- 給下一個包 lv14
		SetFlag( PlayerID , 542333 , 1 )	-- 新手禮包LV13已開啟
	end

end

function SongSong_Bag_LV14( Option )

	local PlayerID = OwnerID()
	local PackageID = 201856		-- 暮棘禮包
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- 急救藥水
	local MPPotionID = 201046	-- 魔力藥水
	-- 護符
	local HuFuGroup = { }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542334 ) == true then
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
		if ( HuFuID ~= nil  ) then			GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201857 , 1 )	-- 給下一個包 lv 15
		SetFlag( PlayerID , 542334 , 1 )	-- 新手禮包LV14已開啟
	end

end

function SongSong_Bag_LV15( Option )
	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = {"kr","cn"}

	local PlayerID = OwnerID()
	local PackageID = 201857		-- 塔格納禮包

	local NeedSpace = 2 + 7			--正常只要7格
	if Language == Country[1] then	--韓國少給一個所以只要6格
		NeedSpace = 2 + 6
	elseif Language == Country[2] then	--中國多給一個所以要8格
		NeedSpace = 2 + 8
	end
--	local NeedSpace = 2 + 7
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- 武器
	local WeaponGroup = {  }
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }
	local HPPotionID = 200807							-- 急救藥水
	local MPPotionID = 201046							-- 魔力藥水
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542335 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		DebugMsg( 0 , 0 , "Language ="..Language )
		GiveBodyItem( PlayerID , 201858 , 1 )	-- 給下一個包  lv 16

		GiveBodyItem( PlayerID , 200840 , 5 )  -- 基礎武器石
		GiveBodyItem( PlayerID ,201201, 5 )  -- 基礎裝備石
		GiveBodyItem( PlayerID , 202902, 3 ) -- 空間記錄墨水
		GiveBodyItem( PlayerID , 202903 , 10 ) -- 傳送者符文
		GiveBodyItem( PlayerID , 203574, 3 ) -- 高級經驗藥劑

		if Language ~= Country[1] then  --判斷是不是非韓語系
			GiveBodyItem( PlayerID , 202506, 2 )   -- 非韓國語系才給黃金修理槌	
		end
		if Language == Country[2] then --中國語系特別處理
			GiveBodyItem( PlayerID , 202671 , 1 )	--中國給予仙豆
		end

		SetFlag( PlayerID , 542335 , 1 )	-- 新手禮包LV15已開啟
	end

end