function SongSong_Bag_LV19( Option )

	local PlayerID = OwnerID()
	local PackageID = 201861		-- ��N�y§�]
	local NeedSpace = 2 + 2
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
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 300

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542339 ) == true then
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
		GiveBodyItem( PlayerID , 201862 , 1 )	-- ���U�@�ӥ] lv 20
		SetFlag( PlayerID , 542339 , 1 )	-- �s��§�]LV19�w�}��
	end

end

function SongSong_Bag_LV20( Option )
	local Language = GetServerDataLanguage()           --����ثeserver���y�t
	local Country = {"kr"}

	local PlayerID = OwnerID()
	local PackageID = 201862		-- �w����§�]

	local NeedSpace = 7			--���`�u�n7��
	if Language == Country[1] then	--����ֵ��@�өҥH�u�n6��
		NeedSpace = 6
	end
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
	local HuFuGroup = {  }	
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 2000

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542340 ) == true then
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

		DebugMsg( 0 , 0 , "Language ="..Language )
		GiveBodyItem( PlayerID , 201522 , 1 ) -- �Ť�ֳUII
		GiveBodyItem( PlayerID , 203572 , 1 )  -- 1�ѥզ��@�����M
		GiveBodyItem( PlayerID , 203574 , 3 )  -- ���Ÿg���ľ�
		GiveBodyItem( PlayerID , 202902 , 3 )  -- �Ŷ��O������
		GiveBodyItem( PlayerID , 202903 , 10 ) -- �ǰe�̲Ť�
	--	GiveBodyItem( PlayerID , 202435 , 3 )  -- �a������

		GiveBodyItem( PlayerID , 201883 , 1 )	-- ���U�@�ӥ] lv 25
		if Language ~= Country[1] then	--����y�t�S�O�B�z
			GiveBodyItem( PlayerID , 202506 , 3 )	--����y�t���������ײz�l 2010.12.28
		end

		SetFlag( PlayerID , 542340 , 1 )	-- �s��§�]LV20�w�}��
	end
end

function SongSong_Bag_LV25( Option )

	local PlayerID = OwnerID()
	local PackageID = 201883		-- �����§�]
	local NeedSpace = 1 + 1
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
	local HuFuGroup = {  }		
	-- �S�O�]
	local SpecBagGroup = {  }
	-- ��
	local Money = 2500

	local WeaponID , ArmorID , AccessID , HPPotionNum , MPPotionNum , HuFuID , SpecBagID = SongSong_Bag_LV0( WeaponGroup , ArmorGroup , AccessGroup , HPPotionGroup , MPPotionGroup , HuFuGroup , SpecBagGroup )

	if ( Option == "CHECK" ) then
		if CheckFlag( PlayerID , 542341 ) == true then
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
		GiveBodyItem( PlayerID , 201863 , 1 )	-- ���U�@�ӥ] LV 30
		GiveBodyItem( PlayerID , 201522 , 1 )   -- �Ť�ֳUII
		GiveBodyItem( PlayerID , 221395 , 1 )  -- ���ŧޯध��
		SetFlag( PlayerID , 542341 , 1 )	-- �s��§�]LV25�w�}��
	end

end