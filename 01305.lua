--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/04/06
--�ק���: 2009/04/06
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--��y���x      204390   �K�����y ���ʥ�
------------------------------------------------------------------------------
function LuaI_204389box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204389		--��y���x �D��s�����]�w
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then

		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end
	elseif ( Option == "USE" ) then		
		GiveBodyItem( PlayerID , 724464 , 1 )	-- ��y���x ���_ ���]�w
	end
end
-------------------------------------------------------------------------------
--  ��y���x  ran�X���~
------------------------------------------------------------------------------
-- �Ԥ�ߦմU    6%
-- �}�ɷϤ�§�� 94%
-------------------------------------------------------------------------------
------------------------------------------------------------------------------
--�Ԥ�ߦմU§��      204390   �K�����y ���ʥ�
------------------------------------------------------------------------------
function LuaI_204390box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204390		--�Ԥ�ߦմU§�� 
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 )  then
			return true
		end

	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( PlayerID , EM_RoleValue_SEX  )  
		sleep(10)
		If BorG == 0 then
			GiveBodyItem( PlayerID , 724462 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724463 , 1 )	 --�]�k�ͪ�
		end
	end
end
-------------------------------------------------------------------------------
--  �Ԥ�ߦմU§��   
------------------------------------------------------------------------------
-- �k�� 724462
--�Ԥ�ߦմU 223413

-- �k�� 724463
--�Ԥ�ߦմU 223415
-------------------------------------------------------------------------------