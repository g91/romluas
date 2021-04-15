function SongSong_Bag_LV30( Option )

	local PlayerID = OwnerID()
	local PackageID = 201863		-- 翡翠禮包
	local NeedSpace = 1 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	-- 武器
	local WeaponGroup = {  }	
	-- 防具
	local ArmorGroup = {  }	
	-- 飾品
	local AccessGroup = {  }	
	-- 藥水
	local HPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0  , 0 }	
	local MPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0  , 0 }	
	local HPPotionID =  {}
	local MPPotionID = {}
	-- 護符
	local HuFuGroup = {  }	
	-- 特別包
	local SpecBagGroup = {  }
	-- 錢
	local Money = 3000

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	local Language = GetServerDataLanguage()           --抓取目前server的語系
	local Country = "kr"

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542342 ) == true then
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

		if Language ~= Country then  --韓國語系
			DebugMsg( 0 , 0 , "Language ="..Language )
			GiveBodyItem( PlayerID , 202506 , 3 ) 
		end

		GiveBodyItem( PlayerID , 203577 , 1 ) --魔幻寶盒能量10點
		GiveBodyItem( PlayerID , 201522, 1 )   --符文福袋II
		GiveBodyItem( PlayerID , 221395, 1 )  -- 高級技能之源
		GiveBodyItem( PlayerID , 203573 , 1 )  -- 1天黑色戰馬坐騎
		GiveBodyItem( PlayerID , 201086, 1 )  -- 高等技能重置石

		SetFlag( PlayerID , 542342 , 1 )	-- 新手禮包LV30已開啟
	end

end

------ 35之後要過任務才會拿到 