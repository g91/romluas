
-- (�@�P)
function SongSong_Bag_LV10( Option )
	local PlayerID = OwnerID()
	local PackageID = 201852		-- �z�s§�]
	local NeedSpace = 4 + 4
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }	
	-- ����
	local ArmorGroup = { 221687 , 221686 , 221686 , 221685 , 221685 , 221687, 221687, 221685, 221685, 221687 }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10  , 10 , 10 , 20 , 20 }	
	local MPPotionGroup = { 0 , 0 , 0 , 10, 10, 10   , 10 , 10 , 0 , 0 }	
	local HPPotionID = 200807  -- ����Ĥ�
	local MPPotionID = 201046 -- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542330 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201853 , 1 )	-- ���U�@�ӥ] lv11
		GiveBodyItem( PlayerID , 202902 , 3 )	-- �Ŷ��O������ 
		GiveBodyItem( PlayerID , 202903 , 10 )	-- �ǰe�̲Ť� 
		GiveBodyItem( PlayerID , 202435 , 3 )  -- �a������	
		GiveBodyItem( PlayerID , 201201 , 5 ) -- ��¦�˳ƥ�
		SetFlag( PlayerID , 542330 , 1 )	-- �s��§�]LV10�w�}��
	end

end


function SongSong_Bag_LV11( Option )

	local PlayerID = OwnerID()
	local PackageID = 201853		-- �s��§�]
	local NeedSpace = 2 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- ����Ĥ�
	local MPPotionID = 201046	-- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542331 ) == true then
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
		GiveBodyItem( PlayerID , 201854 , 1 )	-- ���U�@�ӥ] 12
		SetFlag( PlayerID , 542331 , 1 )	-- �s��§�]LV11�w�}��
	end

end

function SongSong_Bag_LV12( Option )

	local PlayerID = OwnerID()
	local PackageID = 201854		-- ������§�]
	local NeedSpace = 2 + 3
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	-- �Z��
	local WeaponGroup = {  }
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 20 , 20 , 20 , 10 , 10 , 10 , 10 , 10 , 20 , 20  }	
	local MPPotionGroup = { 0 ,  0 ,     0 , 10, 10, 10 , 10, 10 , 0 , 0  }	
	local HPPotionID = 200807	-- ����Ĥ�
	local MPPotionID = 201046	-- �]�O�Ĥ�
	-- �@��
	local HuFuGroup = { }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 100

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542332 ) == true then
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
		if ( HuFuID ~= nil  ) then			GiveBodyItem( PlayerID , HuFuID , 1 )				end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end
		GiveBodyItem( PlayerID , 201855 , 1 )	-- ���U�@�ӥ]
		GiveBodyItem( PlayerID , 221394 , 1 ) 	-- �ޯध��
		GiveBodyItem( PlayerID , 221394 , 1 ) 	-- �ޯध��
		SetFlag( PlayerID , 542332 , 1 )	-- �s��§�]LV12�w�}��
	end

end