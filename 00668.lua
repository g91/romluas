function SongSong_Bag_LV30( Option )

	local PlayerID = OwnerID()
	local PackageID = 201863		-- �B�A§�]
	local NeedSpace = 1 + 2
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )
	-- �Z��
	local WeaponGroup = {  }	
	-- ����
	local ArmorGroup = {  }	
	-- ���~
	local AccessGroup = {  }	
	-- �Ĥ�
	local HPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0  , 0 }	
	local MPPotionGroup = { 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0 , 0  , 0 }	
	local HPPotionID =  {}
	local MPPotionID = {}
	-- �@��
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 3000

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local Country = "kr"

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542342 ) == true then
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
		--if ( SpecBagID ~= nil  ) then		GiveBodyItem( PlayerID , SpecBagID , 1 )			end
		if ( HPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , HPPotionID , HPPotionNum )		end
		if ( MPPotionNum ~= 0 ) then		GiveBodyItem( PlayerID , MPPotionID , MPPotionNum )		end
		if ( Money ~= nil ) then		AddRoleValue( PlayerID , EM_RoleValue_Money , Money )		end

		if Language ~= Country then  --����y�t
			DebugMsg( 0 , 0 , "Language ="..Language )
			GiveBodyItem( PlayerID , 202506 , 3 ) 
		end

		GiveBodyItem( PlayerID , 203577 , 1 ) --�]���_����q10�I
		GiveBodyItem( PlayerID , 201522, 1 )   --�Ť�ֳUII
		GiveBodyItem( PlayerID , 221395, 1 )  -- ���ŧޯध��
		GiveBodyItem( PlayerID , 203573 , 1 )  -- 1�Ѷ¦�԰����M
		GiveBodyItem( PlayerID , 201086, 1 )  -- �����ޯ୫�m��

		SetFlag( PlayerID , 542342 , 1 )	-- �s��§�]LV30�w�}��
	end

end

------ 35����n�L���Ȥ~�|���� 