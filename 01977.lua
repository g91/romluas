function LuaI_240045() --�g��ᯫ����§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 223371 , 1 } , --�ȷ������M		���v	30/ 100
				55 , "" , { 223372 , 1 } , --�ȷ�������u		���v	25/ 100
				70 , "" , { 223373 , 1 } , --�ȷ����L�u��		���v	15/ 100
				85 , "" , { 223374 , 1 } , --�ȷ��۫a 		���v	15/ 100
				100 , "" , { 223370 , 1 } } --�ȷ����ʩܪ�	���v	15/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 223366 , 1 } , --�L����ä��M		���v	30/ 100
				60 , "" , { 223367 , 1 } , --�L���������u		���v	30/ 100
				75 , "" , { 223368 , 1 } , --�L�����L�u��		���v	15/ 100
				90 , "" , { 223369 , 1 } , --�L�������U��		���v	15/ 100
				100 , "" , { 223365 , 1 } } --�L�����L�W��	���v	10/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
-------------------------------------------------------------------------------------------------------------------------
function LuaI_240046() --�g��ڬ��J§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 223399 , 1 } , --�ڬ��J�Q�ڤ�M	���v	30/ 100
				55 , "" , { 223398 , 1 } , --�ڬ��J�Q�ڪ��u	���v	25/ 100
				75 , "" , { 223395 , 1 } , --�ڬ��J�Q�ڴU�l	���v	20/ 100
				90 , "" , { 223397 , 1 } , --�ڬ��J�Q�ڪ���	���v	15/ 100
				100 , "" , { 223396 , 1 } } --�ڬ��J�Q�ڤW��	���v	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 223394 , 1 } , --�ڬ��J�Q�ڤ�M	���v	30/ 100
				55 , "" , { 223393 , 1 } , --�ڬ��J�Q�ڪ��u	���v	25/ 100
				75 , "" , { 223390 , 1 } , --�ڬ��J�Q�ڴU�l	���v	20/ 100
				90 , "" , { 223392 , 1 } , --�ڬ��J�Q�ڪ���	���v	15/ 100
				100 , "" , { 223391 , 1 } } --�ڬ��J�Q�ڤW��	���v	10/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
-------------------------------------------------------------------------------------------------------------------------
function LuaI_240047() --�g��Ŧ~��§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 223418 , 1 } , --�R�ֹŦ~�ت��u	���v	30/ 100
				55 , "" , { 223420 , 1 } , --�R�ֹŦ~�تӹ�	���v	25/ 100
				75 , "" , { 223417 , 1 } , --�R�ֹŦ~�ت���	���v	20/ 100
				90 , "" , { 223416 , 1 } , --�R�ֹŦ~�ؤW��	���v	15/ 100
				100 , "" , { 223419 , 1 } } --�R�ֹŦ~�ح���	���v	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 223422 , 1 } , --�R�ֹŦ~�ت��u	���v	30/ 100
				60 , "" , { 223425 , 1 } , --�R�ֹŦ~�تӹ�	���v	30/ 100
				85 , "" , { 223424 , 1 } , --�R�ֹŦ~�ؾv��	���v	25/ 100
				100 , "" , { 223421 , 1 } } --�R�ֹŦ~�ؤW��	���v	15/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240048() --�g��l��c�]§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 222738 , 1 } , --�l��B���M		���v	30/ 100
				55 , "" , { 222739 , 1 } , --�l��B��c		���v	25/ 100
				75 , "" , { 222740 , 1 } , --�l��B���		���v	20/ 100
				90 , "" , { 222741 , 1 } , --�l��B���Y��		���v	15/ 100
				100 , "" , { 222737 , 1 } } --�l��B��W��	���v  	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 222743 , 1 } , --�c�]�֤k��M		���v	30/ 100
				55 , "" , { 222744 , 1 } , --�c�]�֤k�c 		���v	25/ 100
				75 , "" , { 222745 , 1 } , --�c�]�֤k��		���v	20/ 100
				90 , "" , { 222746 , 1 } , --�c�]�֤k�Y��		���v	15/ 100
				100 , "" , { 222742 , 1 } } --�c�]�֤k�W��	���v	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240049() --�g����Ԥp��§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	25 , "" , { 225156 , 1 } , --�k���Ԥp����M	���v	25/ 100
				50 , "" , { 225161 , 1 } , --�k���Ԥp���ӥ�	���v	25/ 100
				70 , "" , { 225155 , 1 } , --�k���Ԥp���c�l	���v	20/ 100
				85 , "" , { 225160 , 1 } , --�k���Ԥp���Ǥl	���v	15/ 100
				95 , "" , { 225162 , 1 } , --�k���Ԥp���W��	���v	10/ 100
				100 , "" , { 225157 , 1 } } --�k���Ԥp���U�l	���v 	5/ 100
	elseif Sex == 1 then --�k��
		itemset = {	25 , "" , { 225173 , 1 } , --�k���Ԥp����M	���v	25/ 100
				50 , "" , { 225164 , 1 } , --�k���Ԥp���ӥ�	���v	25/ 100
				70 , "" , { 225174 , 1 } , --�k���Ԥp���c�l	���v	20/ 100
				85 , "" , { 225169 , 1 } , --�k���Ԥp���Ǥl	���v	15/ 100
				95 , "" , { 225163 , 1 } , --�k���Ԥp���W��	���v	10/ 100
				100 , "" , { 225172 , 1 } } --�k���Ԥp���U�l	���v	5/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240050() --�g�����x�V§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	25 , "" , { 222975 , 1 } , --����x�V��M	���v	25/ 100
				50 , "" , { 222976 , 1 } , --����x�V���u	���v	25/ 100
				70 , "" , { 222977 , 1 } , --����x�V����	���v	20/ 100
				80 , "" , { 222974 , 1 } , --����x�V�W��	���v	10/ 100
				90 , "" , { 222979 , 1 } , --����x�V�ӹ�	���v	10/ 100
				100 , "" , { 222978 , 1 } } --����x�V�U	���v	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	25 , "" , { 222981 , 1 } , --����x�V��M	���v	25/ 100
				50 , "" , { 222982 , 1 } , --����x�V���u	���v	25/ 100
				70 , "" , { 222983 , 1 } , --����x�V�u��	���v	20/ 100
				80 , "" , { 222980 , 1 } , --����x�V�W��	���v	10/ 100
				90 , "" , { 222985 , 1 } , --����x�V�ӹ�	���v	10/ 100
				100 , "" , { 222984 , 1 } } --����x�V�U	���v	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240051() --�g����v��§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 221917 , 1 } , --��Ư��M		���v	30/ 100
				55 , "" , { 221916 , 1 } , --��Ư���u		���v	25/ 100
				75 , "" , { 221915 , 1 } , --��Ư�U��		���v	20/ 100
				90 , "" , { 221913 , 1 } , --��Ư�Y��		���v	15/ 100
				100 , "" , { 221914 , 1 } } --��Ư�W��	���v	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 221895 , 1 } , --�g���m���K�c		���v	30/ 100
				60 , "" , { 221894 , 1 } , --�g���m���U��		���v	30/ 100
				85 , "" , { 221892 , 1 } , --�g���m���v��		���v	25/ 100
				100 , "" , { 221893 , 1 } } --�g���m���W��	���v	15/ 100		
	end
	return BaseTressureProc(   itemset , 1 )
end
------------------------------------------------------------------------------------------------------------------------------
function LuaI_240052() --�g��g���y�b§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 222993 , 1 } , --�g���Ԥh�⹢		���v	30/ 100
				55 , "" , { 222992 , 1 } , --�g���Ԥh�}��		���v	25/ 100
				75 , "" , { 222989 , 1 } , --�g���Ԥh����		���v	20/ 100
				90 , "" , { 222990 , 1 } , --�g���Ԥh����		���v	15/ 100
				100 , "" , { 222991 , 1 } } --�g���Ԥh�Y��	���v  	10/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 223389 , 1 } , --�ʷP�ߤk����M	���v	30/ 100
				55 , "" , { 222987 , 1 } , --�ʷP�ߤk�����u 	���v	25/ 100
				75 , "" , { 222986 , 1 } , --�ʷP�ߤk���u��	���v	20/ 100
				90 , "" , { 222869 , 1 } , --�ʷP�ߤk���W��	���v	15/ 100
				100 , "" , { 222988 , 1 } } --�ʷP�ߤk������	���v	10/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_240053() --�g��ɩ|���§��

	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = {	30 , "" , { 221922 , 1 } , --�Z���ɱ߮b���u	���v	30/ 100
				60 , "" , { 221923 , 1 } , --�Z���ɱ߮b��M	���v	30/ 100
				85 , "" , { 221921 , 1 } , --�Z���ɱ߮b����	���v	25/ 100
				100 , "" , { 221920 , 1 } } --�Z���ɱ߮b�W��	���v  	15/ 100
	elseif Sex == 1 then --�k��
		itemset = {	30 , "" , { 221926 , 1 } , --�������J���u		���v	30/ 100
				60 , "" , { 221925 , 1 } , --�������J�u�� 		���v	30/ 100
				85 , "" , { 221924 , 1 } , --�������J�~�M		���v	25/ 100
				100 , "" , { 221927 , 1 } } --�������J�U		���v	15/ 100	
	end
	return BaseTressureProc(   itemset , 1 )
end

-------------------------------------------------------------------------------------------------------
-- 6.0.2  2013 ��´�` �s�W
-------------------------------------------------------------------------------------------------------
function LuaI_242697()  -- �g��ջȸt��§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			20 , "" , { 231984 , 1 } , 
			45 , "" , { 231985 , 1 } , 
			65 , "" , { 231986 , 1 } , 
			70 , "" , { 231987 , 1 } , 
			80 , "" , { 231988 , 1 } , 
			100 , "" , { 231989 , 1 } 
			}
	elseif Sex == 1 then --�k��
		itemset = { 
			20 , "" , { 231990 , 1 } , 
			45 , "" , { 231991 , 1 } , 
			65 , "" , { 231992 , 1 } , 
			70 , "" , { 231993 , 1 } , 
			80 , "" , { 231994 , 1 } , 
			100 , "" , { 231995 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242698()  -- �g��t�]�_��§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			10 , "" , { 231976 , 1 } , 
			40 , "" , { 231977 , 1 } , 
			65 , "" , { 231978 , 1 } , 
			100 , "" , { 231979 , 1 } 
			}
	elseif Sex == 1 then --�k��
		itemset = { 
			10 , "" , { 231980 , 1 } , 
			40 , "" , { 231981 , 1 } , 
			65 , "" , { 231982 , 1 } , 
			100 , "" , { 231983 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242699()  -- �g���񯺼v��§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			5 , "" , { 228681 , 1 } , 
			25 , "" , { 228682 , 1 } , 
			35 , "" , { 228683 , 1 } , 
			60 , "" , { 228684 , 1 } , 
			75 , "" , { 228685 , 1 } , 
			100 , "" , { 228686 , 1 } 
			}
	elseif Sex == 1 then --�k��
		itemset = {
			5 , "" , { 228687 , 1 } , 
			25 , "" , { 228688 , 1 } , 
			35 , "" , { 228689 , 1 } , 
			60 , "" , { 228690 , 1 } , 
			75 , "" , { 228691 , 1 } , 
			100 , "" , { 228692 , 1 } 
			}	
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242700() -- �g��ģ��Ȥ�§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			5 , "" , { 230760 , 1 } , 
			20 , "" , { 230759 , 1 } , 
			50 , "" , { 230761 , 1 } , 
			85 , "" , { 222915 , 1 } , 
			87 , "" , { 212446 , 1 } , 
			90 , "" , { 211677 , 1 } , 
			95 , "" , { 211676 , 1 } , 
			100 , "" , { 211678 , 1 } 
			}
	elseif Sex == 1 then --�k��
		itemset = { 
			5 , "" , { 230757 , 1 } , 
			20 , "" , { 220929 , 1 } , 
			50 , "" , { 230758 , 1 } , 
			85 , "" , { 230756 , 1 } , 
			87 , "" , { 212446 , 1 } , 
			90 , "" , { 211677 , 1 } , 
			95 , "" , { 211676 , 1 } , 
			100 , "" , { 211678 , 1 } 
			}
	end
	return BaseTressureProc(   itemset , 1 )

end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242701()  -- �g�嵵�v�t��§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			5 , "" , { 230170 , 1 } , 
			30 , "" , { 230171 , 1 } , 
			60 , "" , { 230172 , 1 } , 
			70 , "" , { 230173 , 1 } , 
			85 , "" , { 230174 , 1 } , 
			95 , "" , { 230175 , 1 } , 
			100 , "" , { 230176 , 1 } , 
			}
	elseif Sex == 1 then --�k��
		itemset = { 
			5 , "" , { 230177 , 1 } , 
			30 , "" , { 230178 , 1 } , 
			60 , "" , { 230179 , 1 } , 
			70 , "" , { 230180 , 1 } , 
			85 , "" , { 230181 , 1 } , 
			95 , "" , { 230182 , 1 } , 
			100 , "" , { 230183 , 1 } , 
			}
	end
	return BaseTressureProc(   itemset , 1 )
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaI_242702()  -- �g�夽��Q�k§��
	local RoleName = GetName( OwnerID() ) 
	local Sex = ReadRoleValue( OwnerID() , EM_RoleValue_SEX )
	local itemset = { }
	if Sex == 0 then --�k��
		itemset = { 
			20 , "" , { 222900 , 1 } , 
			30 , "" , { 222901 , 1 } , 
			55 , "" , { 222904 , 1 } , 
			80 , "" , { 222903 , 1 } , 
			90 , "" , { 222902 , 1 } , 
			100 , "" , { 221424 , 1 } , 
			}
	elseif Sex == 1 then --�k��
		itemset = { 
			25 , "" , { 221934 , 1 } , 
			35 , "" , { 221935 , 1 } , 
			65 , "" , { 221938 , 1 } , 
			90 , "" , { 221937 , 1 } , 
			100 , "" , { 221936 , 1 } , 
			}
	end
	return BaseTressureProc(   itemset , 1 )
end