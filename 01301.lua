--�`�y���� 2009�~4��K�B�`
--�إ߮ɶ�: 2009/03/24
--�ק���: 2009/04/03
--�إߪ�  : ���ʥ��� ��ʨ�
------------------------------------------------------------------------------
--�ߤl�ܨ��Ĥ�§��      204356   
------------------------------------------------------------------------------
function LuaI_204356box( Option )
	local PlayerID = OwnerID()
	local PackageID = 204356		--�ߤl�ܨ��Ĥ�§�� 
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
			GiveBodyItem( PlayerID , 724445 , 1 )	 --�]�k�ͪ�
		elseif BorG == 1 then
			GiveBodyItem( PlayerID , 724444 , 1 )	 --�]�k�ͪ�
		end
	end
end
-------------------------------------------------------------------------------
--  �ߤl�ܨ��Ĥ�§��  ran�X���~    
------------------------------------------------------------------------------
-- �k�� 724445
-- �Ԥh�űa�ܨ��Ĥ��U (15��)
-- �Ԥh�űa�ܨ��Ĥ��U (1�p��)
-- �Ԥh�űa�ܨ��Ĥ��U (2�p��)
-- �Ԥh�űa�ܨ��Ĥ��U (24�p��)

-- �k�� 724444
--  �Q�k�߸��ܨ��Ĥ��U(15��)
--  �Q�k�߸��ܨ��Ĥ��U(1�p��)
--  �Q�k�߸��ܨ��Ĥ��U(2�p��)
--  �Q�k�߸��ܨ��Ĥ��U(24�p��)
-------------------------------------------------------------------------------