--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/04/03
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- 204371~204378 �ߤl�ܨ��Ĥ��U�t�C

-- �U����15�� 1�p�� 2�p�� 24�p��

--�Ԥh�űa�ܨ��Ĥ�  1��
--�Ԥh�űa�ܨ��Ĥ�  3��
--�Ԥh�űa�ܨ��Ĥ�  5��

--�Q�k�߸��ܨ��Ĥ�  1��
--�Q�k�߸��ܨ��Ĥ�  3��
--�Q�k�߸��ܨ��Ĥ�  5��
------------------------------------------------------------------------------
------------------------------------------------------------------------------
--�Ԥh�űa�ܨ��Ĥ��U      204371   
--15������
-------------------------------------------------------------------------------
function LuaI_204371box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204371		--�Ԥh�űa�ܨ��Ĥ��U (15��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724446 , 1 )	 --15�� �Ԥh�űa�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Ԥh�űa�ܨ��Ĥ��U      204372   
--1�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204372box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204372		--�Ԥh�űa�ܨ��Ĥ��U  (1�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724447 , 1 )	 --1�p�� �Ԥh�űa�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Ԥh�űa�ܨ��Ĥ��U      204373  
--2�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204373box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204373		--�Ԥh�űa�ܨ��Ĥ��U (2�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724448 , 1 )	 --2�p�� �Ԥh�űa�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Ԥh�űa�ܨ��Ĥ��U      204374
--24�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204374box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204374		--�Ԥh�űa�ܨ��Ĥ��U (24�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724449 , 1 )	 --24�p�� �Ԥh�űa�ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------

------------------------------------------------------------------------------
--�Q�k�߸��ܨ��Ĥ��U      204375   
--15������
-------------------------------------------------------------------------------
function LuaI_204375box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204375		--�Q�k�߸��ܨ��Ĥ��U (15��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724450 , 1 )	 --15�� �Q�k�߸��ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Q�k�߸��ܨ��Ĥ��U      204376   
--1�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204376box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204376		--�Q�k�߸��ܨ��Ĥ��U (1�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724451 , 1 )	 --1�p�� �Q�k�߸��ܨ��Ĥ��U ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Q�k�߸��ܨ��Ĥ��U      204377 
--2�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204377box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204377		--�Q�k�߸��ܨ��Ĥ��U(2�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724452 , 1 )	 --2�p�� �Q�k�߸��ܨ��Ĥ��U ���_
	end
end
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
--�Q�k�߸��ܨ��Ĥ��U      204378
--24�p�ɪ�
------------------------------------------------------------------------------
function LuaI_204378box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204378		--�Q�k�߸��ܨ��Ĥ��U(24�p��)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724453 , 1 )	 --24�p�� �Q�k�߸��ܨ��Ĥ��U  ���_
	end
end
-------------------------------------------------------------------------------