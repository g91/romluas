--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/04/03
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- 204381~204388 �m�J�ܨ��Ĥ��U�t�C

-- �U����15�� 1�p�� 2�p�� 24�p��

--�N�бm�J�ܨ��Ĥ�  1��
--�N�бm�J�ܨ��Ĥ�  3��
--�N�бm�J�ܨ��Ĥ�  5��

--�����m�J�ܨ��Ĥ�  1��
--�����m�J�ܨ��Ĥ�  3��
--�����m�J�ܨ��Ĥ�  5��
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--�N�бm�J�ܨ��Ĥ��U      204381   
--15������
-------------------------------------------------------------------------------
function LuaI_204381box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204381		--�N�бm�J�ܨ��Ĥ��U (15��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724454 , 1 )	 --15�� �N�бm�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�N�бm�J�ܨ��Ĥ��U      204382   
--1�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204382box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204382		--�N�бm�J�ܨ��Ĥ��U  (1�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724455 , 1 )	 --1�p�� �N�бm�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�N�бm�J�ܨ��Ĥ��U      204383  
--2�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204383box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204383		--�N�бm�J�ܨ��Ĥ��U (2�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724456 , 1 )	 --2�p�� �N�бm�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�N�бm�J�ܨ��Ĥ��U      204384
--24�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204384box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204384		--�N�бm�J�ܨ��Ĥ��U (24�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724457 , 1 )	 --24�p�� �N�бm�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
--�����m�J�ܨ��Ĥ��U      204385   
--15������
-------------------------------------------------------------------------------
function LuaI_204385box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204385		--�����m�J�ܨ��Ĥ��U (15��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724458 , 1 )	 --15�� �����m�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�����m�J�ܨ��Ĥ��U      204386   
--1�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204386box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204386		--�����m�J�ܨ��Ĥ��U (1�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724459 , 1 )	 --1�p�� �����m�J�ܨ��Ĥ��U ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�����m�J�ܨ��Ĥ��U      204387 
--2�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204387box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204387		--�����m�J�ܨ��Ĥ��U(2�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724460 , 1 )	 --2�p�� �����m�J�ܨ��Ĥ��U ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�����m�J�ܨ��Ĥ��U      204388
--24�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204388box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204388		--�����m�J�ܨ��Ĥ��U(24�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724461 , 1 )	 --24�p�� �����m�J�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------