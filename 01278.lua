--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/24
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�m�J�ܨ��Ĥ�§��      204357   �a�ߤl�^�a�h ���ʥ�
------------------------------------------------------------------------------
function LuaI_204357box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204357		--�m�J�ܨ��Ĥ�§�� 
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
			GiveBodyItem( PlayerID , 724443 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724442 , 1 )	 --�]�k�ͪ�
		end
	end
end
-------------------------------------------------------------------------------
--  �m�J�ܨ��Ĥ�§��  ran�X���~    
------------------------------------------------------------------------------
-- �k�� 724443
-- �N�бm�J�ܨ��Ĥ��U (15��)
-- �N�бm�J�ܨ��Ĥ��U (1�p��)
-- �N�бm�J�ܨ��Ĥ��U (2�p��)
-- �N�бm�J�ܨ��Ĥ��U (24�p��)

-- �k�� 724442
--  �����m�J�ܨ��Ĥ��U(15��)
--  �����m�J�ܨ��Ĥ��U(1�p��)
--  �����m�J�ܨ��Ĥ��U(2�p��)
--  �����m�J�ܨ��Ĥ��U(24�p��)
-------------------------------------------------------------------------------