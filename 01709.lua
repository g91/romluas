--==================================================--
--  �p�ᤧ�C�������ȥ洫����                              --
--==================================================--
function LuaPE_ZONE15_ExChangeTalk()
	local Item1ID = 206871	-- ù�ܬ��զ�ï]
	local Item2ID = 206872	-- ù�ܬ��¦�ï]
	local Item3ID = 206873	-- �޲z�M�h���ɹ�
	local ExChangeNum1 = 10
	local ExChangeNum2 = 10
	local ExChangeNum3 = 10

	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum1.."][$SETVAR2=["..Item1ID.."]]" , "LuaPE_ZONE15_ExChange1" , 0 )	-- �ڦ� 10 ��[206871] �i�H��A�洫
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum2.."][$SETVAR2=["..Item2ID.."]]" , "LuaPE_ZONE15_ExChange2" , 0 )	-- �ڦ� 10 ��[206872] �i�H��A�洫
	AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EX01][$SETVAR1="..ExChangeNum3.."][$SETVAR2=["..Item3ID.."]]" , "LuaPE_ZONE15_ExChange3" , 0 )	-- �ڦ� 10 ��[206873] �i�H��A�洫
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_114780_0]","LuaS_114780_DW_0", 0 )    --���¹�

end

function LuaPE_ZONE15_ExChange1()

	CloseSpeak( OwnerID() )		-- ������ܵ���

	local ItemID = 206871	-- ù�ܬ��զ�ï]
	local BonusBagID = 206911	-- �ڧJ���Ŧ�§�]
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- �A�ҫ�����[206871]�ƶq���G�S���F��ڪ��n�D�A�A�i��o�յۥh�h���o�@�ǡC
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- �o�O�A�ҥ洫��[206911]�A���§A���B�n�I
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_ExChange2()

	CloseSpeak( OwnerID() )		-- ������ܵ���

	local ItemID = 206872	-- ù�ܬ��¦�ï]
	local BonusBagID = 206912	-- �ڧJ���Ŧ�§�]
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- �A�ҫ�����[206872]�ƶq���G�S���F��ڪ��n�D�A�A�i��o�յۥh�h���o�@�ǡC
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- �o�O�A�ҥ洫��[206912]�A���§A���B�n�I
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_ExChange3()

	CloseSpeak( OwnerID() )		-- ������ܵ���

	local ItemID = 206873	-- �޲z�M�h���ɹ�
	local BonusBagID = 206913	-- �ڧJ�����§�]
	local ExChangeNum = 10

	local ItemNum = CountBodyItem( OwnerID() , ItemID )

	if ItemNum < ExChangeNum then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX02][$SETVAR1=[<S>"..ItemID.."]]" )	-- �A�ҫ�����[206873]�ƶq���G�S���F��ڪ��n�D�A�A�i��o�յۥh�h���o�@�ǡC
	else
		local NeedSpace = 1
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )	-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		end

		if DelBodyItem( OwnerID() , ItemID , ExChangeNum ) == true then
			SetSpeakDetail( OwnerID() , "[SC_PE_ZONE15_EX03][$SETVAR1=["..BonusBagID.."]]" )	-- �o�O�A�ҥ洫��[206913]�A���§A���B�n�I
			GiveBodyItem( OwnerID() , BonusBagID , 1 )
		end
	end
end

function LuaPE_ZONE15_BonusBag1( Option )
	local BonusBagID = 206911 -- �ڧJ���Ŧ�§�]
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent1()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--�R���ϥΤ������~
	end
end
function LuaPE_ZONE15_BagContent1()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- �@�U���ѥ�
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- �@�U�Ť�
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- ���F�į�
	PotionID[2] = 204890	-- ���F������
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- ���F�į�
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- ���F������
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- ����LV53
		gMaterialID[2] = 206696	-- �줧���
		local gMaterialNum = {}
		gMaterialNum[2] = 5

		BagContentID[5] = gMaterialID[2]	-- �줧���
		BagContentNum[5] = gMaterialNum[2]
		BagContentID[6] = gMaterialID[2]	-- �줧���
		BagContentNum[6] = gMaterialNum[2]


	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  ���e�Ĥ�
		PotionID[3] = 200229	-- �j��������
		PotionID[4] = 200270	-- �j���F�P�Ĥ�

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- �j��������
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- �j���F�P�Ĥ�
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- �H���Ĥ�
		RNDPotionID[1] = 200272	-- �t�O�Ĥ�
		RNDPotionID[2] = 200113	-- �N�x�T�⭻�z
		RNDPotionID[3] = 200114	-- ���K�����`��
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- ���� 1~3 ���ü�
		BagContentID[5] = RNDPotionID[RND3]	-- �H���Ĥ�
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- �H������
		RNDFoodID[1] = 200143	-- �����P��
		RNDFoodID[2] = 200144	-- ����i�i�p
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- ���� 1~2 ���ü�
		BagContentID[6] = RNDFoodID[RND3]	-- �H������
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end
function LuaPE_ZONE15_BonusBag2( Option )
	local BonusBagID = 206912 -- �ڧJ���Ŧ�§�]
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent2()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--�R���ϥΤ������~
	end
end
function LuaPE_ZONE15_BagContent2()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- �@�U���ѥ�
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- �@�U�Ť�
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- ���F�į�
	PotionID[2] = 204890	-- ���F������
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- ���F�į�
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- ���F������
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- ����LV53
		gMaterialID[1] = 206695	-- �q�����
		local gMaterialNum = {}
		gMaterialNum[1] = 5

		BagContentID[5] = gMaterialID[1]	-- �q�����
		BagContentNum[5] = gMaterialNum[1]
		BagContentID[6] = gMaterialID[1]	-- �q�����
		BagContentNum[6] = gMaterialNum[1]

	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  ���e�Ĥ�
		PotionID[3] = 200229	-- �j��������
		PotionID[4] = 200270	-- �j���F�P�Ĥ�

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- �j��������
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- �j���F�P�Ĥ�
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- �H���Ĥ�
		RNDPotionID[1] = 200272	-- �t�O�Ĥ�
		RNDPotionID[2] = 200113	-- �N�x�T�⭻�z
		RNDPotionID[3] = 200114	-- ���K�����`��
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- ���� 1~3 ���ü�
		BagContentID[5] = RNDPotionID[RND3]	-- �H���Ĥ�
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- �H������
		RNDFoodID[1] = 200143	-- �����P��
		RNDFoodID[2] = 200144	-- ����i�i�p
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- ���� 1~2 ���ü�
		BagContentID[6] = RNDFoodID[RND3]	-- �H������
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end
function LuaPE_ZONE15_BonusBag3( Option )
	local BonusBagID = 206913 -- �ڧJ�����§�]
	local NeedSpace = 6

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
			return false;
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_PE_ZONE8_17]" , C_DEFAULT )		-- �е��ݪ��~�����i�J��I�]�����I
			return false;
		elseif ( CountBodyItem( OwnerID() , BonusBagID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local BagContentID , BagContentNum = LuaPE_ZONE15_BagContent3()
		for i = 1 , table.getn(BagContentID) do
			GiveBodyItem( OwnerID() , BagContentID[i] , BagContentNum[i] )
			Sleep(5)
		end

		UseItemDestroy() 		--�R���ϥΤ������~
	end
end
function LuaPE_ZONE15_BagContent3()

	local BagContentID = {}
	local BagContentNum = {}

	BagContentID[1] = 206249	-- �@�U���ѥ�
	BagContentNum[1] = 2

	BagContentID[2] = 206250	-- �@�U�Ť�
	BagContentNum[2] = 1

	local PotionID = {}
	local PotionNum = {}
	PotionID[1] = 204889	-- ���F�į�
	PotionID[2] = 204890	-- ���F������
	PotionNum[1] = 10
	PotionNum[2] = 10
	BagContentID[3] = PotionID[1]	-- ���F�į�
	BagContentNum[3] = PotionNum[1]
	BagContentID[4] = PotionID[2]	-- ���F������
	BagContentNum[4] = PotionNum[2]

	local RNDType = Rand( 100 ) + 1	-- ���� 1~100 ���ü�
	
	if RNDType > 1 and RNDType <= 33 then
		local gMaterialID = {}	-- ����LV53
		gMaterialID[3] = 206697	-- �󤧺��
		local gMaterialNum = {}
		gMaterialNum[3] = 5

		BagContentID[5] = gMaterialID[3]	-- �󤧺��
		BagContentNum[5] = gMaterialNum[3]
		BagContentID[6] = gMaterialID[3]	-- �󤧺��
		BagContentNum[6] = gMaterialNum[3]


	elseif RNDType > 33 and RNDType <= 66 then
		--local PotionID = {}	--  ���e�Ĥ�
		PotionID[3] = 200229	-- �j��������
		PotionID[4] = 200270	-- �j���F�P�Ĥ�

		--local PotionNum = {}
		PotionNum[3] = 4
		PotionNum[4] = 4

		BagContentID[5] = PotionID[3]	-- �j��������
		BagContentNum[5] = PotionNum[3]
		BagContentID[6] = PotionID[4]	-- �j���F�P�Ĥ�
		BagContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local RNDPotionID = {}	-- �H���Ĥ�
		RNDPotionID[1] = 200272	-- �t�O�Ĥ�
		RNDPotionID[2] = 200113	-- �N�x�T�⭻�z
		RNDPotionID[3] = 200114	-- ���K�����`��
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND3 = Rand( 3 ) + 1	-- ���� 1~3 ���ü�
		BagContentID[5] = RNDPotionID[RND3]	-- �H���Ĥ�
		BagContentNum[5] = RNDPotionNum[RND3]

		local RNDFoodID = {}	-- �H������
		RNDFoodID[1] = 200143	-- �����P��
		RNDFoodID[2] = 200144	-- ����i�i�p
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- ���� 1~2 ���ü�
		BagContentID[6] = RNDFoodID[RND3]	-- �H������
		BagContentNum[6] = RNDFoodNum[RND3]
	end

	return BagContentID , BagContentNum;

end


function LuaS_114780_DW_0()
	local ExChangeNum = 20
	local Item1ID = 206871	-- ù�ܬ��զ�ï]
	local Item2ID = 206872	-- ù�ܬ��¦�ï]
	local Item3ID = 206873	-- �޲z�M�h���ɹ�

	SetSpeakDetail( OwnerID(),"[SC_114780_1]")
	if	CountBodyItem(OwnerID(), Item1ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item1ID.."]]" , "LuaS_114780_DW_1" , 0 )	-- �ڦ� [$VAR1] ��[$VAR2] �Q��A�洫1�ӥj�N�򪫡I
	end
	if	CountBodyItem(OwnerID(), Item2ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item2ID.."]]" , "LuaS_114780_DW_2" , 0 )	-- �ڦ� [$VAR1] ��[$VAR2] �Q��A�洫1�ӥj�N�򪫡I
	end
	if	CountBodyItem(OwnerID(), Item3ID )>=20	then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE15_EXCHANGE][$SETVAR1="..ExChangeNum.."][$SETVAR2=[<S>"..Item3ID.."]]" , "LuaS_114780_DW_3" , 0 )	-- �ڦ� [$VAR1] ��[$VAR2] �Q��A�洫1�ӥj�N�򪫡I
	end
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_114780_5]","LuaPE_ZONE15_ExChangeTalk", 0 )
end


function LuaS_114780_DW_1()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206871, 20 )	then
			YOYO_GetTokenValue( 2, 1);--�j�N��
		end
	else
		ScriptMessage( OID , OID , 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
	end
	LuaS_114780_DW_0()
end


function LuaS_114780_DW_2()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206872,20 )	then
			YOYO_GetTokenValue( 2, 1);--�j�N��
		end
	else
		ScriptMessage( OID, OID, 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
	end
	LuaS_114780_DW_0()
end


function LuaS_114780_DW_3()
	local OID = OwnerID()
	if EmptyPacketCount( OID ) > 0 and QueuePacketCount( OID ) == 0 then
		if	DelBodyItem( OID, 206873,20 )	then
			YOYO_GetTokenValue( 2, 1);--�j�N��
		end
	else
		ScriptMessage( OID, OID, 1 , "[MSG_SONGSONGBAGWARN]" , C_DEFAULT )	-- �I�]�Ů���줣���A�L�k�~����o���~�I
	end
	LuaS_114780_DW_0()
end


function LuaS_115224_DW_0()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 ); --/�ڷQ�ݬݧA�檺�F��
end

function LuaS_115224_DW_1()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_Armor  )
	SetShop( OwnerID() , 600214 , "Test_Shop_Close" );
end