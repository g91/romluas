function LuaI_241845() --2012�~�n�ʸ` �R�d�Ǹ˹��]

	local itemset  = {	2500	, ""	, { 203231 , 1 } ,		-- ����n�ʸ˹�
				5000	, ""	, { 203232 , 1 } ,		-- ���F�y���˹�
				7500	, ""	, { 203233 , 1 } ,		-- ���F�t�q�˹�
				10000	, ""	, { 203234 , 1 }	}	-- �űC�y���˹�
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241846() --2012�~�n�ʸ` �p�o�J�٦�]

	local RoleName = GetName( OwnerID() )
	local Package = "[241846]"	-- §�]ID
	local Gift = {}			-- �s�����~ID
	local Msg  = {}
	Gift[1] = "[241837]"	-- �ä[�o�J��300�d���J 
	Gift[2] = "[241842]"	 -- �ä[�a���T�Y���d���J
	Gift[3] = "[241805]"	 -- �ä[�p�c�]2000���M
	Msg[1] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[1].."]"
	Msg[2] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[2].."]"
	Msg[3] = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2="..Package.."][$SETVAR3="..Gift[3].."]"

	local itemset  = {	2400	, ""	, { 241835 , 1 } ,		-- 7�ѷo�J��300�d���J		
				3200	, ""	, { 241836 , 1 } ,		-- 30�ѷo�J��300�d���J		
				3375	, Msg[1] , { 241837 , 1 } ,		-- �ä[�o�J��300�d���J		
				5775	, ""	, { 241840 , 1 } ,		-- 7�Ѧa���T�Y���d���J		
				6575	, ""	, { 241841 , 1 } ,		-- 30�Ѧa���T�Y���d���J		
				6750	, Msg[2] , { 241842 , 1 } ,		-- �ä[�a���T�Y���d���J		
				9150	, ""	, { 209480 , 1 } ,		-- 7�Ѥp�c�]2000���M
				9950	, ""	, { 209481 , 1 } ,		-- 30�Ѥp�c�]2000���M
				10000	, Msg[3] , { 241805 , 1 }	}	-- �ä[�p�c�]���M
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241847() --2012�~�n�ʸ` ����]����_§��(�k��)

	local itemset  = {	2500	, ""	, { 227546 , 1 } ,		-- ����]����M(�k)
				3500	, ""	, { 227547 , 1 } ,		-- ����]������(�k)
				5000	, ""	, { 227548 , 1 } ,		-- ����]���@��(�k)
				7500	, ""	, { 227551 , 1 } ,		-- ����]�����u(�k)
				9000	, ""	, { 227549 , 1 } ,		-- ����]������(�k)
				10000	, ""	, { 227550 , 1 }	}	-- ����]������(�k)
	return BaseTressureProc4( itemset , 1 )
end

function LuaI_241848() --2012�~�n�ʸ` ����]���x��§��(�k��)

	local itemset  = {	2500	, ""	, { 228675 , 1 } ,		-- ����]���@��(�k)
				3500	, ""	, { 228676 , 1 } ,		-- ����]������(�k)
				5000	, ""	, { 228677 , 1 } ,		-- ����]���@��(�k)
				7500	, ""	, { 228678 , 1 } ,		-- ����]���žc(�k)
				9000	, ""	, { 228679 , 1 } ,		-- ����]���u��(�k)
				10000	, ""	, { 228680 , 1 }	}	-- ����]������(�k)
	return BaseTressureProc4( itemset , 1 )
end