Function LuaI_207074() --���h�y§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 206196,1 , 201383 ,1, 203592 ,1, 202903 ,10, 202904 ,5, 202905 ,5, 202902 ,5}
			 }

	return BaseTressureProc(   itemset , 7  )
end



Function LuaI_207109() --�ĤT���i��§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 207087,1 , 203057,1 , 206209,1 , 222926,1 , 222925,1 ,202506,1 , 201087,1 , 201139,1 , 205547,1, 201610,1 , 201134,1 , 201459,1 }
			 }

	return BaseTressureProc(   itemset , 12  )
end



Function LuaI_207110() --�ĤT���^��§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 207088,1 , 203057,1 , 206209,1 , 222926,1 , 222925,1 ,202506,1 , 201087,1 , 201139,1 , 205547,1, 201610,1 , 201134,1 , 201459,1 }
			 }

	return BaseTressureProc(   itemset , 12  )
end



Function LuaI_207111() --CBS�׭^§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 226229,1 , 207083,1 }
			 }

	return BaseTressureProc(   itemset , 2  )
end


Function LuaI_207083() --���§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 201458,1 , 201459,1 , 203043,1 , 201088,1 , 201238,1 , 203054,1 , 202506,1} 
			 }

	return BaseTressureProc(   itemset , 7  )
end


Function LuaI_207121() --���x�f�t§�]

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 206944,1 , 203591,1 , 202322,1 , 222926,1 , 222925,1 , 201610,1 , 201134,1} 
			 }

	return BaseTressureProc(   itemset , 7  )
end

Function LuaI_207006() --���x�f�t§�]

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 206024,1 ,201014,1 ,201087,1 ,201458,1 ,206963,1 ,202322,1 ,201292,1} }

	return BaseTressureProc(   itemset , 7  )
end

Function LuaI_207951() --FaceBook & Twitter§�]

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 201619,1 ,222926,1 ,222925,1 ,201014,1 ,201381,1} }

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207957() --FaceBook & Twitter§�]

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , ""	, { 222926,1 ,222925,1 ,201014,1 ,201386,1 ,206130,1} }

	return BaseTressureProc(   itemset , 5  )
end

Function LuaI_207150() --���h�y§�]20100720�s��

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 206020,1 , 201383 ,1, 203592 ,1, 202903 ,10, 202904 ,5, 202905 ,5, 202902 ,5}
			 }

	return BaseTressureProc(   itemset , 7  )
end

Function LuaI_207151() --�y��ɩ|�k��§�] 2010/08/02

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 227172,1 , 227173 ,1}
			 }

	return BaseTressureProc(   itemset , 2  )
end

Function LuaI_208176() --�y��ɩ|�k��§�] 2010/08/02

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 227169,1 , 227170 ,1 , 227171 ,1}
			 }

	return BaseTressureProc(   itemset , 3  )
end

function LuaI_208333(Option )
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		local class = ReadRoleValue ( OwnerID(), EM_RoleValue_VOC)
		if class == 1 then	--�Ԥh
			GiveBodyItem(OwnerID(),212570,1)
		elseif class == 2 then	--�C�L
			GiveBodyItem(OwnerID(),212569,1)
		elseif class == 3 then	--�v���
			GiveBodyItem(OwnerID(),212575,1)
		elseif class == 4 then	--�k�v
			GiveBodyItem(OwnerID(),212574,1)
		elseif class == 5 or class == 8 then	--���q / �۵M���x
			GiveBodyItem(OwnerID(),212571,1)
		elseif class == 6 then	--�M�h
			GiveBodyItem(OwnerID(),212572,1)
		elseif class == 7 then	--�˪L����
			GiveBodyItem(OwnerID(),212573,1)
		end
	end
end


---------------------------------------------------
--�w��G�P�~ ���y§�]

Function LuaI_209562()  --��θ˳Ʊj��§��
	local itemset  = {	10 ,"" 	, { 221383 , 1 }	
				,15 ,"" 	, { 221384 , 1 }	
				,25 ,"" 	, { 201087 , 1 }	
				,33 ,"" 	, { 201237 , 1 }	
				,41 ,"" 	, { 203053 , 1 }		
				,46 ,"" 	, { 207495 , 1 }	
				,54 ,"" 	, { 207761 , 3 }	
				,67 ,"" 	, { 207762 , 3 }	
				,80 ,"" 	, { 207763 , 3 }	
				,90 ,"" 	, { 208932 , 1 }	
				,97 ,"" 	, { 202928 , 1 }	
				,100 ,""	, { 202928 , 3 } }

	return BaseTressureProc(   itemset , 1  )
end


Function LuaI_209563()
	local itemset  = {	5 ,"" 	, { 208203 , 1 }	
				,10 ,"" 	, { 208206 , 1 }	
				,15 ,"" 	, { 208205 , 1 }	
				,20 ,"" 	, { 205711 , 1 }	
				,25 ,"" 	, { 205715 , 1 }	
				,30 ,"" 	, { 205703 , 1 }	
				,35 ,"" 	, { 201477 , 1 }	
				,40 ,"" 	, { 201519 , 1 }	
				,50 ,""     , { 204678 , 1 }
				,60 ,"" 	, { 204708 , 1 }	
				,70 ,"" 	, { 204717 , 1 }
				,80 ,"" 	, { 204674 , 1 }
				,90 ,"" 	, { 206495 , 1 }
				,95 ,"" 	, { 201386 , 1 }
				,100 ,""	, { 201387 , 1 } }

	return BaseTressureProc(   itemset , 1  )
end

Function LuaI_209564()
	local itemset  = {	 10 ,"" 	, { 202434 , 3 }	
				, 25 ,""	, { 201139 , 3 }	
				, 40 ,""	, { 201141 , 3 } 
				, 50 ,""	, { 208792 , 1 }	
				, 60 ,""	, { 208788 , 1 }
				, 66 ,""	, { 208787 , 1 }	
				, 76 ,""	, { 208785 , 1 }	
				, 82 ,""	, { 208784 , 1 }	
				, 97 ,""	, { 207049 , 1 }	
				, 100 ,"" , { 207050  , 1 }	}

	return BaseTressureProc(   itemset , 1  )
end


Function LuaI_209565()
	local itemset  = {  22 ,"" 	, { 207582 , 1 }	
				, 32 ,""	, { 209559 , 1 } 
				, 68 ,""	, { 208740 , 1 }	
				, 76 ,""	, { 208739 , 1 }
				, 96 ,""	, { 209485 , 1 }	
				, 100 ,"", { 209486 , 1 } }

	return BaseTressureProc(   itemset , 1  )
end

--�w��T�P�~ ���y§�]
Function LuaI_208989()
	local itemset  = {  6 ,"" 	, { 226910 , 1 }	
				, 12 ,""	, { 227537 , 1 } 
				, 24 ,""	, { 222997 , 1 }	
				, 36 ,""	, { 226295 , 1 }
				, 45 ,""	, { 224988 , 1 }	
				, 54 ,""	, { 224865 , 1 }	
				, 68 ,""	, { 221897 , 1 }	
				, 76 ,""	, { 222899 , 1 }	
				, 88 ,""	, { 223427 , 1 }	
				, 100 ,"", { 224986 , 1 } }

	return BaseTressureProc(   itemset , 1  )
end

-- �w��T�P�~ �C����l�d��§��
function LuaI_241130()
	local itemset  = {  77 ,"" 	, { 241171 , 1 }	
			, 97 ,""		, { 241172 , 1 } 
			, 100 ,""	, { 241173 , 1 }	}

	return BaseTressureProc(   itemset , 1  )

end

--------------------------------------------

function LuaI_240448() -- �w�� �ĥ|��§�] 2011/05/18

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209600 , 1 , 208536 , 1 , 206129 , 1 , 202264 , 1 , 202320 , 1 , 206410 , 1 , 201087, 1 , 202903, 2 , 202435,2 ,222925, 1, 207765,1,207762,1 } }
	-- 
	return BaseTressureProc(   itemset , 12 )
end

function LuaI_240449() -- �w�� �ĥ|��§�] II 2011/05/18

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 209508 , 1 , 208536 , 1 , 206129 , 1 , 202264 , 1 , 202320 , 1 , 206410 , 1 , 201087, 1 , 202903, 2 , 202435,2 ,222925, 1, 207765,1,207762,1 } }
	-- 
	return BaseTressureProc(   itemset , 12 )
end

function LuaI_240514() -- �w�� �p���d�� 2011/05/30

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240512 , 1 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end


function LuaI_240515() -- �w�� �L���d�� 2011/05/30

	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240513 , 1 } }
	-- 
	return BaseTressureProc(   itemset , 1 )
end

function LuaI_240544() --�w�� Gamesload Bundle�d���] 2011/06/16
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 203592 , 1 ,203290, 1} }
	-- 
	return BaseTressureProc(   itemset , 2 )
end

function LuaI_240498() --�w�� Energy Package�] 2011/07/04
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , {208733,1,208926,1,203066,1,201460,1,201608,1,201617,1,201619,1} }
	-- 
	return BaseTressureProc(   itemset , 7 )
end

function LuaI_240585() -- �w�� 4.0.2§�]	2011/07/25 �s�@
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 240183 , 1 , 206130 , 1 , 201386 , 1 , 201014 , 1 , 222926 , 1 , 222925 , 1} }
	-- 
	return BaseTressureProc(   itemset , 6 )
end

function LuaI_240586() -- �w�� 4.0.2§�]	2011/07/25 �s�@
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 208733 , 1 , 208926 , 1 , 203066 , 1 , 201460 , 1 , 201608 , 1 , 201617 , 1 , 201619 , 1} }
	-- 
	return BaseTressureProc(   itemset , 7 )
end

----------------------------4.0.2§�]    2011/09/05 �s�@
function LuaI_240781() --Decoration Package
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 204460 , 1 , 201504 , 1 , 201512 , 1 , 201410 , 1  } }
	--�¦|���_�c�B�I�����B�j���J���d�B�Q���J����l
	return BaseTressureProc(   itemset , 4 )
end

---------------------------------------------------------------------------------------------------
function LuaI_240782()--Amazing Pet Package
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207575 , 1 , 207582 , 1} }
	--�j���d���������B���_����(1��)�C
	return BaseTressureProc(   itemset , 2 )
end

---------------------------------------------------------------------------------------------------
function LuaI_240783()--Simple Refining Package
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207761 , 1 , 207762 , 1 , 207763 , 1  } }
	--�O��Z���ۡB�O��˳ƥۡB�O�䭺���ۡC
	return BaseTressureProc(   itemset , 3 )
end

---------------------------------------------------------------------------------------------------
function LuaI_240784()--Prime Bundle
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 206024 , 1 ,206129 , 1 , 202264 , 1 , 202320 , 1 , 206410 , 1 , 201087 , 1 , 202903 , 1 , 202435 , 1 , 222925 , 1 , 207765 , 1 , 207762 , 1  } }
	-- �ä[�����b�m�d���J�B���ؤG�h��Ϊ��a�U�ǫ����B1�Ѹg���ľ��B1�ѧޯ�g���ľ��B�^�X��߳J�B��¦�Z�����վ��B�ǰe���Ť�B�a�����̡B��Ÿg���@�šB�i���O��˳ƥۡB�O��˳ƥۡC
	return BaseTressureProc(   itemset , 11 )
end

---------------------------------------------------------------------------------------------------
function LuaI_240785()--Masterly Refining Package
	local RoleName = GetName( OwnerID() ) 
	local itemset = { 100 , "" , { 207764 , 1 , 207765 , 1 , 207766 , 1  } }
	--�i���O��Z���ۡB�i���O��˳ƥۡB�i���O�䭺���ۡC
	return BaseTressureProc(   itemset , 3 )
end