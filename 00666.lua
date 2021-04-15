function SongSong_Bag_LV16( Option )

	local PlayerID = OwnerID()
	local PackageID = 201858		-- �º���§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }	
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }
	local HPPotionID = 200808	-- ���ī���Ĥ�
	local MPPotionID = 201047	-- �����]�O�Ĥ�
	-- �@��
	local HuFuGroup = {}	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 200

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542336 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 201859 , 1 )	-- ���U�@�ӥ] LV 17
		GiveBodyItem( PlayerID , 221394 , 1 ) -- �ޯध��
		SetFlag( PlayerID , 542336 , 1 )	-- �s��§�]LV16�w�}��
	end

end

function SongSong_Bag_LV17( Option )

	local PlayerID = OwnerID()
	local PackageID = 201859		-- ����§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }			
	local HPPotionID = 200808  -- ���ī���Ĥ�
	local MPPotionID = 201047  -- �����]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542337 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 201860 , 1 )	-- ���U�@�ӥ] LV18
		SetFlag( PlayerID , 542337 , 1 )	-- �s��§�]LV17�w�}��
	end

end

function SongSong_Bag_LV18( Option )

	local PlayerID = OwnerID()
	local PackageID = 201860		-- ���[§�]
	local NeedSpace = 2 + 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }	
	-- ����
	local ArmorGroup = {  }		
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 10 , 10 , 10 , 5 , 5 , 5 , 5 , 5 , 10 , 10  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 5, 5, 5 , 5, 5 , 0 , 0  }			
	local HPPotionID = 200808  -- ���ī���Ĥ�
	local MPPotionID = 201047  -- �����]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542338 ) == true then
			UseItemDestroy() 		--�R���ϥΤ������~
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
		GiveBodyItem( PlayerID , 201861 , 1 )	-- ���U�@�ӥ] lv 19
		SetFlag( PlayerID , 542338 , 1 )	-- �s��§�]LV18�w�}��
	end

end