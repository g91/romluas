
-- 702238-�������y�I��

-- ��������§��242164 (5.0.8)
Function LuaI_242164()
	local itemset  = {	25 ,"" 	, { 725632 , 1 }	
				,35 ,"" 	, { 725633 , 1 }	
				,57 ,"" 	, { 726942 , 1 }	
				,72 ,"" 	, { 725634 , 1 }	
				,97 ,"" 	, { 725449 , 1 }	
				,100 ,""	, { 241451 , 1 } }

	return BaseTressureProc(   itemset , 1  )
end

--------------------------�Rflag----------------------------------------------------
function lua_fireday_delflag()
	local OID = OwnerID()

	----- �Ť�ѽL  2013 (5.0.8 )
	Setflag(OID, 547380, 0 )  -- �M������FLAG

	----- �b�]�a���K 2013 (5.0.8 )
	Setflag(OID, 547369, 0 )  -- �M������FLAG

	----- �����ɤ���
	SetFlag( OID , 544702, 0 ) --�ѥ[��
	SetFlag( OID, 544707, 0 ) --X���ﭫ��
	SetFlag( OID, 544728, 0 ) --X�������
	SetFlag( OID, 544731, 0 ) --�d��~
	----- �X���b�|�o�J��
	SetFlag( OID, 544706, 0)--�������ѹ���L��
	SetFlag( OID, 544705, 0)--���ѹ�����
	SetFlag( OID, 544704, 0)--�H������
	CancelBuff( OID, 508510) --�R����BUFF
	CancelBuff( OID, 508614) 

	--�t����֧��Y��
	SetFlag( OID, 546122, 0)
	SetFlag( OID, 546140, 0)
	SetFlag( OID, 546121, 0)

	--�b���X��
	local Count = CountBodyItem( OID , 240510 ) --�Ť峴���ƶq
	DelBodyItem( OID , 240510 , Count ) --�Ť峴��
	DelBodyItem( OID , 240509 , 1 )  --���K����
	CancelBuff( OID , 621833 ) --�R���n�ߤH(���WBUFF)
	SetFlag( OID , 546014 , 0 ) --�R���ѥ[key

	ScriptMessage( OID , OID , 1 , "[SC_FIREDAY_09]" , C_SYSTEM )
end

------------------------���y�I��----------------------------------------------------
function lua_fireday_changegoods()
	local needcount = 5
	local Language = GetServerDataLanguage() 
--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_03][$SETVAR1="..needcount.."]" ) --�P�§A���P�ѻP�U���ʡA�o�O�ڭ̴��Ѫ��S�¡I
	else  
		SetSpeakDetail( OwnerID(), "[SC_FIREDAY_03_TW][$SETVAR1="..needcount.."]" ) --�S���m�r��
	end

	AddSpeakOption( OwnerID(), TargetID( ), "[SC_FIREDAY_04]", "lua_fireday_rewards", 0 ) --����I��


--	if Language ~= "rw" then  -- �x���M�ݨS�����m�ﶵ  ���ե�
	if Language ~= "tw" then  -- �x���M�ݨS�����m�ﶵ  ������
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_FIREDAY_05]" , "lua_fireday_changegame", 0 ) --���ʭ��m--�R�ӫ����ӧI�� 202904
	end
end

 ----------------------����I��----------------------------------------------------------
function lua_fireday_rewards()
	local needcount = 5
	local R = Rand(100)+1

	if CountBodyItem ( OwnerID() , 208918 ) >= needcount then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			-- 5.0.8 �ܧ� -----------------
			DesignLog( OwnerID() , 1217373 , " 2013 Firegame , reward change " )	--  �������y�I������(5.0.8�}�l�~��)
			GiveBodyItem(OwnerID(), 242164, 1) --�����`�y���]
			GiveBodyItem(OwnerID(), 241482, 20 )   -- �P�y�d���� �s������(241482)
			---------------------------------
			DelBodyItem( OwnerID() , 208918 , needcount )
			if R<6 then  -- 5%���v�B�~�����m��
				GiveBodyItem(OwnerID(), 208919, 1) -- ���m��
			end
			
			SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_08")  ) --�P�°ѻP
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --�^�W�@��
		end

	else
		SetSpeakDetail( OwnerID(), GetString("SC_0908SEANSON_26") ) --�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --�^�W�@��
	end
end

---------------------���m�I��----------------------------------------------------------
function lua_fireday_changegame()
	if  CountBodyItem( OwnerID() , 202904 ) >= 1 then
		if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then
			GiveBodyItem(OwnerID(), 208919, 1) 
			DelBodyItem( OwnerID() , 202904 , 1 )
			SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_08")  ) --�P�°ѻP
		else
			SetSpeakDetail( OwnerID(), GetString("SC_111490_DIALOG10")   )--�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --�^�W�@��
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_FIREDAY_07") ) --�ƶq����
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , " lua_fireday_changegoods", 0 ) --�^�W�@��
	end
end