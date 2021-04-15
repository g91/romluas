---------------------------------------------------------
--		2013 01 �����` ���Լ�	(5.0.8 ) 	--
---------------------------------------------------------
function Lua_Festival_01_All(PlayerID) 

	local Allcheck = true
	local KeyItemTable = {
				547380 ,	--�Ť�ѽL
				547369 	--�b�]�a���K
						 }

	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9���s�`���� ������0  ( �`�N: 6.0.0 ���`�y �O�o�n��BUFF����)
		DesignLog( PlayerID , 1221801 , "festival - 1  , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end

---------------------------------------------------------
--		2013  �ᯫ�`���Լ�( 5.0.7 )	 --
---------------------------------------------------------
function Lua_Festival_02_All(PlayerID) --�쥻�O2�몺�ᯫ�`

	local Allcheck = true
	local KeyItemTable = {
				547360 ,	--��������
				547354 	--��������
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9���s�`���� ������0
		DesignLog( PlayerID , 1221802 , "festival - 2  , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end



---------------------------------------------------------
--		2013 05 �R�ָ`���Լ�(6.0.0)	--
---------------------------------------------------------
function Lua_Festival_05_All(PlayerID) 

	local Allcheck = true
	local KeyItemTable = {
				547704 ,	--��a!�d�n��
				547578 	--�R�֦u�y��
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- ( �`�N: 6.0.0 ���`�y �O�o�n��BUFF���šA0 ����)
		DesignLog( PlayerID , 1221805 , "festival - 6 , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end


---------------------------------------------------------
--		2013 06 �����` ���Լ�(6.0.1)	--
---------------------------------------------------------

-- 6.0.1 �[�J���Լ� desgin log , ����вΤ@�[�J

function Lua_Festival_06_All(PlayerID) 
	local Allcheck = true
	local KeyItemTable = {
				546708 ,	--�o���a������
				546707 ,	-- �s�y�j�D�i
				543897 ,	-- ���K���n���� ����1��s
				548009  	-- 2013�s����- ����ʤO    
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- 6.0.0 �H�᪺�`�y, buff���Ŭ�1 
		DesignLog( PlayerID , 1221806 , "festival - 6 , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end

---------------------------------------------------------
--		2013 06 ��´�` ���Լ�(6.0.2)	--
---------------------------------------------------------
-- 6.0.1 �[�J���Լ� desgin log , ����вΤ@�[�J

function Lua_Festival_07_All(PlayerID) 
	local Allcheck = true
	local KeyItemTable = {
		546728, -- �]��´����
		546864, -- �]�k���_�v
		546876,  -- �O�����|
		548131  -- �M�Ԯɸ˷f�t�j�v (2013 �s����)
		}

	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 ) -- 6.0.0 �H�᪺�`�y, buff���Ŭ�1 
		DesignLog( PlayerID , 1221807 , "festival - 7 , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end
---------------------------------------------------------
--		2013���ܸ`���Լ� (6.0.3 )	--
---------------------------------------------------------

--function FN_FairyTale2012_All(PlayerID)
function Lua_Festival_08_All(PlayerID) --2013
	local Allcheck = true
	local KeyItemTable = {
				546901, --�����֦~
				541322, --�ܼ@�j��
				546907 --�Q�泌�s
				}

	for i=1,table.getn(KeyItemTable) do
		if CheckFlag(PlayerID, KeyItemTable[i]) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive(PlayerID, 1 )  -- 2013. 8�뵣�ܸ`���� �אּ����1
		DesignLog( PlayerID , 1221808 , "festival - 8 , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end


---------------------------------------------------------
--  (6.0.4 ) 2012 09 �G�ĸ`���Լ�		--
---------------------------------------------------------
function Lua_Festival_09_All(PlayerID) --2012
	local Allcheck = true
	local KeyItemTable = {
				545616, --90��L���Z��
				541866, --�����ƨg�s�O����		
				546925, --�����i�_
				545751  --��s�`�|�ӥ��Ȫ��C��
				}
	local KeyItemTablePlus = {545746, 545747, 545748, 545749}	--��s�`�|�ӥ��Ȫ��C��P�_�Ϊ�Key

	for i=1,table.getn(KeyItemTable) do
		if CheckFlag(PlayerID, KeyItemTable[i]) == false then
			Allcheck = false
		end
	end

	for i=1,table.getn(KeyItemTablePlus) do
		if CheckFlag(PlayerID, KeyItemTablePlus[i]) == true then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive(PlayerID, 1 )  -- 2013. 9��G�ĸ`���� �אּ����1
		DesignLog( PlayerID , 1221809 , "festival - 9  , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end

---------------------------------------------------------
--		2012 10 �n�ʸ`���Լ�		--
---------------------------------------------------------
function Lua_Festival_10_All(PlayerID)	-- 2012.10 �n�ʸ`���Լ�

	local Allcheck = true
	local KeyItemTable = {
				547019 ,	--���F�A��
				547021 , 	--�찭�j�v
				547026 ,	--���ѻݭn�I�y�s
				547086		-- ���԰���
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 1 )  -- 2012. 9���s�`���� ������0
		DesignLog( PlayerID , 1221810 , "festival - 10  , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end

---------------------------------------------------------
--		2012 11 ���@�`���Լ�		--
---------------------------------------------------------
function Lua_Festival_11_All(PlayerID)

	local Allcheck = true
	local KeyItemTable = {
				547130 ,	--���J�p��
				547135 , 	--�b�k�K�X
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		lua_mika_festivalbuffgive( PlayerID , 0 )  -- 2012. 9���s�`���� ������0
		DesignLog( PlayerID , 1221811 , "festival - 10  , join all event" ) -- ��o���Լ��p�� (6.0.1��)
	end
end

---------------------------------------------------------
--		2013 12 �x�V�`���Լ�		--
---------------------------------------------------------
function Lua_Festival_12_All(PlayerID)

	local Allcheck = true
	local KeyItemTable = {
				547323 ,	
				547324 , 	
				547325 ,
				547326 ,
				547327 ,
				547328 ,
				547330 ,
				547331 ,
				547332 ,
				547333 ,
				547334 ,
				547335 ,
				547336 ,
				547337 ,
						 }
	
	for i=1 , #(KeyItemTable) , 1 do
		if CheckFlag( PlayerID , KeyItemTable[i] ) == false then
			Allcheck = false
		end
	end

	if Allcheck == true then
		for x=1 , #(KeyItemTable) , 1 do
			SetFlag( PlayerID, KeyItemTable[x], 0 )
		end
		lua_mika_festivalbuffgive( PlayerID , 1 )  -- 2013. 12��x�V�`���� ������1
		DesignLog( PlayerID , 1221812 , "festival - 10  , join all event" ) -- ��o���Լ��p�� (6.0.5��)
	end
end