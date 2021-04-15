function Lua_Hao_Sop_Daily_Articles_Basic_1() -- �C��e1�Ӫ��~A

	Lua_Hao_Sop_Daily_Articles_Basic_1_0( GetDBKeyValue("BagSpace_00") , GetDBKeyValue("ItemID_00") , GetDBKeyValue("ItemAmount_00") , GetDBKeyValue("Keyitem_00") , GetDBKeyValue("Lvlimit_00")  )
end

function Lua_Hao_Sop_Daily_Articles_Basic_1_0( BagSpace_00 , ItemID_00 , ItemAmount_00 , Keyitem_00 , Lvlimit_00 ) -- �C�骫�~��¦ 
	--( �ݨD�Ŷ��B���~ID�B���~�ƶq�B���n���~�B����� )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- Ū�����a����

	if Check_Bag_Space( OwnerID() , BagSpace_00 ) == false or Lvlimit_00 > PlayerLv  then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_00 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		PlayMotion( TargetID() , 107 )	-- �n�Y
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_00 , ItemAmount_00 )
		SetFlag( OwnerID() , Keyitem_00 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115808 ,"1 Present Daily (Plan 1) is "..ItemAmount_00.."x".."["..ItemID_00.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_2() -- �C��e1�Ӫ��~B

	Lua_Hao_Sop_Daily_Articles_Basic_2_0( GetDBKeyValue("BagSpace_01") , GetDBKeyValue("ItemID_01") , GetDBKeyValue("ItemAmount_01") , GetDBKeyValue("Keyitem_01") , GetDBKeyValue("Lvlimit_01") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_2_0( BagSpace_01 , ItemID_01 , ItemAmount_01 , Keyitem_01 , Lvlimit_01 ) -- �C�骫�~��¦ 
	--( �ݨD�Ŷ��B���~ID�B���~�ƶq�B���n���~�B����� )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- Ū�����a����

	if Check_Bag_Space( OwnerID() , BagSpace_01 ) == false or Lvlimit_01 > PlayerLv then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_01 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		PlayMotion( TargetID() , 107 )	-- �n�Y
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_01 , ItemAmount_01 )
		SetFlag( OwnerID() , Keyitem_01 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115809 ,"1 Present Daily (Plan 2) is "..ItemAmount_01.."x".."["..ItemID_01.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_3() -- �C��e2�Ӫ��~

	Lua_Hao_Sop_Daily_Articles_Basic_3_0( GetDBKeyValue("BagSpace_02") , GetDBKeyValue("ItemID_02") , GetDBKeyValue("ItemID_02_1") , GetDBKeyValue("ItemAmount_02") , GetDBKeyValue("ItemAmount_02_1") , GetDBKeyValue("Keyitem_02") , GetDBKeyValue("Lvlimit_02") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_3_0( BagSpace_02 , ItemID_02 , ItemID_02_1 , ItemAmount_02 , ItemAmount_02_1 , Keyitem_02 , Lvlimit_02 )
	--( �ݨD�Ŷ��B���~ID�B���~ID2�B���~�ƶq�B���~�ƶq2�B���n���~�B����� )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- Ū�����a����

	if Check_Bag_Space( OwnerID() , BagSpace_02 ) == false or Lvlimit_02 > PlayerLv  then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_02 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		PlayMotion( TargetID() , 107 )	-- �n�Y
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_02 , ItemAmount_02 )
		GiveBodyItem( OwnerID() , ItemID_02_1 , ItemAmount_02_1 )
		SetFlag( OwnerID() , Keyitem_02 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115810 ,"2 Present Daily is "..ItemAmount_02.."x".."["..ItemID_02.."]".." , "..ItemAmount_02_1.."x".."["..ItemID_02_1.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Basic_4() --�C��e3�Ӫ��~

	Lua_Hao_Sop_Daily_Articles_Basic_4_0( GetDBKeyValue("BagSpace_03") , GetDBKeyValue("ItemID_03") , GetDBKeyValue("ItemID_03_1") , GetDBKeyValue("ItemID_03_2") , GetDBKeyValue("ItemAmount_03") , GetDBKeyValue("ItemAmount_03_1") , GetDBKeyValue("ItemAmount_03_2") , GetDBKeyValue("Keyitem_03") , GetDBKeyValue("Lvlimit_03") )
end

function Lua_Hao_Sop_Daily_Articles_Basic_4_0( BagSpace_03 , ItemID_03 , ItemID_03_1 , ItemID_03_2 , ItemAmount_03 , ItemAmount_03_1 , ItemAmount_03_2 , Keyitem_03 , Lvlimit_03 ) -- �C�骫�~��¦ 
	--( �ݨD�Ŷ��B���~ID�B���~ID2�B���~ID3�B���~�ƶq�B���~�ƶq2�B���~�ƶq3�B���n���~�B����� )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )	-- Ū�����a����

	if Check_Bag_Space( OwnerID() , BagSpace_03 ) == false or Lvlimit_03 > PlayerLv then
		return false
	end

	if CheckFlag( OwnerID() , Keyitem_03 ) == true then
		SetSpeakDetail( OwnerID() , "[SC_BUFFNPC_27]") --�A���Ѥw�g����L�F�A���ѦA�ӧa�C
		PlayMotion( TargetID() , 107 )	-- �n�Y
		return false
	else
		GiveBodyItem( OwnerID() , ItemID_03 , ItemAmount_03 )
		GiveBodyItem( OwnerID() , ItemID_03_1 , ItemAmount_03_1 )
		GiveBodyItem( OwnerID() , ItemID_03_2 , ItemAmount_03_2 )
		SetFlag( OwnerID() , Keyitem_03 , 1 )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115811 ,"3 Presents Daily is "..ItemAmount_03.."x".."["..ItemID_03.."]".." , "..ItemAmount_03_1.."x".."["..ItemID_03_1.."]".." , "..ItemAmount_03_2.."x".."["..ItemID_03_2.."]" )
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_Basic_1(  ) -- �HA��B ���1(��ܼ@��)

	Lua_Hao_Sop_Barter_Basic_1_0( GetDBKeyValue("ExBagSpace_00") , GetDBKeyValue("ExItemID_00") , GetDBKeyValue("ExItemAmount_00") , GetDBKeyValue("ExReturnGoods_00") , GetDBKeyValue("ExReturnAmount_00") )
end

function Lua_Hao_Sop_Barter_Basic_1_0( ExBagSpace_00 , ExItemID_00 , ExItemAmount_00 , ExReturnGoods_00 , ExReturnAmount_00 ) -- �H������
	--( �ݨD�Ŷ��B���~ID�B���~�ƶq�B�������~ID�B�������~�ƶq )
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count5_8 , 8 )		-- Ū�����a�b��������W���q
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- Ū��Server���|�l����q
	local MaxHeap = GameObjInfo_Int( ExReturnGoods_00 ,"MaxHeap" ) -- �쪫�~�����|�q
	local ItemB_I = Math.floor( ExReturnAmount_00 / MaxHeap )	-- ���~B���
	local ItemB_R = ExReturnAmount_00 % MaxHeap			-- ���~B�l��

--	DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )

	if ExBagSpace_00 > 8 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- �C���̦h�u�䴩8�Ӫ��~�A�ﶵ���~
		return false
	end

	if Check_Bag_Space( OwnerID() , ExBagSpace_00 ) == false then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- �A���I�]�Ŷ�����
		return false
	end 

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- I am very sorry but our exchange service for today has ended.
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	end
		
	if CountBodyItem( OwnerID() , ExItemID_00 ) < ExItemAmount_00 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_112311_6]") -- �z�ҫ������ƶq�����A�٤���I����C 
		return false	
	elseif CountBodyItem( OwnerID() , ExItemID_00 ) >= ExItemAmount_00 then
		--------------------2011.03.10--------------------�s�l�[
		if ExReturnAmount_00 > MaxHeap then
--		DebugMsg( 0 , 0 , "MaxHeap = "..MaxHeap )
			local Recheck = Math.floor( ExReturnAmount_00 / MaxHeap + 0.999 )
--		Say( OwnerID() , "Recheck = "..Recheck )
			if Check_Bag_Space( OwnerID() , Recheck ) == false then
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "[SC_TREASURE_NOSPACE]" ) -- �A���I�]�Ŷ�����
				return false
			end
			if Recheck > 8 then
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "Maximum number of support are 8 items per time,Setting error." ) -- �C���̦h�u�䴩8�Ӫ��~�A�ﶵ���~
				return false
			end
			-- �������~B
			for i = 1 , ItemB_I , 1 do
				GiveBodyItem( OwnerID() , ExReturnGoods_00 , MaxHeap )
			end
			if ItemB_R ~= 0 then
				GiveBodyItem( OwnerID() , ExReturnGoods_00 , ItemB_R )
			end
		else
			GiveBodyItem( OwnerID() , ExReturnGoods_00 , ExReturnAmount_00 )
		end
		DelBodyItem( OwnerID() , ExItemID_00 , ExItemAmount_00 )
		Servertrade = Servertrade - 1
		Freetrade = Freetrade - 1
		WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count5_8 , 8 , Freetrade )
		CloseSpeak( OwnerID() )
		DesignLog( OwnerID() , 115812 ,"Exchange "..ExItemAmount_00.."x".."["..ExItemID_00.."]".." for "..ExReturnAmount_00.."x".."["..ExReturnGoods_00.."]" )
		if Servertrade == 0 then
		--	DesignLog( OwnerID() , 1158120 ,"There is a limit cap in exchanging ".."["..ExItemID_00.."]".." to ".."["..ExReturnGoods_00.."]".." today" )
			DesignLog( OwnerID() , 1158120 ,"There is a limit cap in exchanging "..ExItemAmount_00.."x".."["..ExItemID_00.."]".." to "..ExReturnAmount_00.."x".."["..ExReturnGoods_00.."]".." today" )
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_1(  ) -- �H���إ�NPC �C�����I�����p(��ܼ@��)

	Lua_Hao_Sop_MandD_Trade_Basic_1_0( GetDBKeyValue("Money_00") , GetDBKeyValue("Diamond_00") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_1_0( Money_00 , Diamond_00 ) -- �C�����I�����p

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	local Starttime_00 = GetDBKeyValue("Starttime_00")						-- �C�����_�l�ɶ�
	local Endtime_00 = GetDBKeyValue("Endtime_00")						-- �C���������ɶ�
	local Lowestlv_00 = GetDBKeyValue("Lowestlv_00")						-- �i����̧C����
	local Highestlv_00 = GetDBKeyValue("Highestlv_00")						-- �i����̰�����
	local Freetrade_00 = GetDBKeyValue("Freetrade_00")						-- ���a���������
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )				-- Ū�����a����
	local Hour_Now = GetSystime(1)								-- Ū���{�b�ɶ�(��)
	local Date_Now = GetSystime(4)								-- Ū���{�b���
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count1_8 , 8 )	-- Ū�����a�b��������W���q
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- Ū��Server���|�l����q
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" )
	
	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- ����I�����Ƥw�F�W���A���q�O�ݻŪ�...�бz���ѦA�ӡC
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- �����I�����Ƥw�F�W���A�I���A�ȱN����A�����@�᭫�s�}��C
		return false
	end

	if Starttime_00 >= 24 then
		Starttime_00 = 0
	end
	if Endtime_00 >= 24 or Endtime_00 == 0 then
		Endtime_00 = 24
	end

	if Hour_Now >= Starttime_00 and Hour_Now < Endtime_00 then	-- �p�ɧP�_
		if PlayerLv >= Lowestlv_00 and PlayerLv <= Highestlv_00 then	-- ���a���ŧP�_
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < Money_00 then
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- �z�ҫ������ƶq�����A�٤���I����C 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- �I�Y
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , Diamond_00 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money , - Money_00 )
				DesignLog( OwnerID() , 115813 ,"Convert "..Diamond_00.." diamonds with "..Money_00.." gold successfully" ) -- �����I�����p �H�� �I������
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 200000 ,"There is a limit cap in exchanging "..Money_00.." money to "..Diamond_00.." diamond today" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 20000000 ,"Your exchange times for "..Money_00.." money to "..Diamond_00.." diamond  arrived to the cap this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count1_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_100" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- �n�Y
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_00.."][$SETVAR2="..Highestlv_00.."]" )
			-- �z���D¾���ť����b<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>���϶����~�ŦX�I�����A�бz���F�����ݨD�C
		end
	else
		PlayMotion( TargetID() , 107 )	-- �n�Y
		Starttime_00 = string.format("%02d", Starttime_00 )
		Endtime_00 = string.format("%02d", Endtime_00 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_00.."][$SETVAR2="..Endtime_00.."]" ) 
		-- �I���A�ȱN��<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>�}��A�бz�@�ߵ��ԡC
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_2(  ) -- �H���إ�NPC ���p�I���C����(��ܼ@��)

	Lua_Hao_Sop_MandD_Trade_Basic_2_0( GetDBKeyValue("Money_01") , GetDBKeyValue("Diamond_01") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_2_0( Money_01 , Diamond_01 ) -- ���p�I���C����

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	local Starttime_01 = GetDBKeyValue("Starttime_01")			-- �C�����_�l�ɶ�
	local Endtime_01 = GetDBKeyValue("Endtime_01")			-- �C���������ɶ�
	local Lowestlv_01 = GetDBKeyValue("Lowestlv_01")			-- �i����̧C����
	local Highestlv_01 = GetDBKeyValue("Highestlv_01")			-- �i����̰�����
	local Freetrade_01 = GetDBKeyValue("Freetrade_01")			-- ���a���������
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- Ū�����a����
	local Hour_Now = GetSystime(1)						-- Ū���{�b�ɶ�(��)
	local Date_Now = GetSystime(4)						-- Ū���{�b���
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count2_8 , 8 )		-- Ū�����a�b��������W���q
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- Ū��Server���|�l����q
	local TotalDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )		-- �`���p
	local LockDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_AccountLock )		-- �H�Υd�ʶR��A���30�Ѫ����p
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" )

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- �����I�����Ƥw�F�W���A�I���A�ȱN����A�����@�᭫�s�}��C
		return false
	end

	if Starttime_01 >= 24 then
		Starttime_01 = 0
	elseif Endtime_01 >= 24 or Endtime_01 == 0 then
		Endtime_01 = 24
	end

	if Hour_Now >= Starttime_01 and Hour_Now < Endtime_01 then	-- �p�ɧP�_
		if PlayerLv >= Lowestlv_01 and PlayerLv <= Highestlv_01 then	-- ���a���ŧP�_
			if ( TotalDiamond - LockDiamond ) < Diamond_01 then	-- 2010.09.24 �H�Υd����
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- �z�ҫ������ƶq�����A�٤���I����C 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- �I�Y
				AddRoleValue( OwnerID() , EM_RoleValue_Money , Money_01 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , - Diamond_01 )
				DesignLog( OwnerID() , 115814 ,"Convert "..Money_01.." gold with "..Diamond_01.." diamonds successfully" ) -- ���p�I������ �H�� �I������
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 200003 ,"There is a limit cap in exchanging "..Diamond_01.." diamond to "..Money_01.." money today" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 20000003 ,"Your exchange times for "..Diamond_01.." diamond to "..Money_01.." money arrived to the cap this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count2_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_101" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- �n�Y
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_01.."][$SETVAR2="..Highestlv_01.."]" )
			-- �z���D¾���ť����b<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>���϶����~�ŦX�I�����A�бz���F�����ݨD�C
		end
	else
		PlayMotion( TargetID() , 107 )	-- �n�Y
		Starttime_01 = string.format("%02d", Starttime_01 )
		Endtime_01 = string.format("%02d", Endtime_01 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_01.."][$SETVAR2="..Endtime_01.."]" ) 
		-- �I���A�ȱN��<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>�}��A�бz�@�ߵ��ԡC
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_3(  ) -- Zone2 NPC �����I�����p(��ܼ@��)

	Lua_Hao_Sop_MandD_Trade_Basic_3_0( GetDBKeyValue("Money_11") , GetDBKeyValue("Diamond_11") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_3_0( Money_11 , Diamond_11 ) -- Zone2 NPC �����I�����p

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	local Starttime_11 = GetDBKeyValue("Starttime_11")			-- �C�����_�l�ɶ�
	local Endtime_11 = GetDBKeyValue("Endtime_11")			-- �C���������ɶ�
	local Lowestlv_11 = GetDBKeyValue("Lowestlv_11")			-- �i����̧C����
	local Highestlv_11 = GetDBKeyValue("Highestlv_11")			-- �i����̰�����
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- Ū�����a����
	local Freetrade_11 = GetDBKeyValue("Freetrade_11")			-- ���a���������
	local Hour_Now = GetSystime(1)						-- Ū���{�b�ɶ�(��)
	local Date_Now = GetSystime(4)						-- Ū���{�b���
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count3_8 , 8 )	-- Ū�����a�b��������W���q
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )		-- Ū��Server���|�l����q
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_100" )
	
	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" ) -- I am very sorry but our exchange service for today has ended.
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- �����I�����Ƥw�F�W���A�I���A�ȱN����A�����@�᭫�s�}��C
		return false
	end

	if Starttime_11 >= 24 then
		Starttime_11 = 0
	elseif Endtime_11 >= 24 or Endtime_11 == 0 then
		Endtime_11 = 24
	end

	if Hour_Now >= Starttime_11 and Hour_Now < Endtime_11 then	-- �p�ɧP�_
		if PlayerLv >= Lowestlv_11 and PlayerLv <= Highestlv_11 then	-- ���a���ŧP�_
			if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < Money_11 then
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- �z�ҫ������ƶq�����A�٤���I����C 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- �I�Y
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , Diamond_11 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money , - Money_11 )
				DesignLog( OwnerID() , 115815 ,"Convert "..Diamond_11.." diamonds with "..Money_11.." gold successfully in Zone 2" ) -- �����I�����p Zone2 �I������
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 2000000 ,"There is a limit cap in exchanging  "..Money_11.." money to "..Diamond_11.." diamond today in Zone 2" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 200000000 ,"Your exchange times for "..Money_11.." money to "..Diamond_11.." diamond  arrived to the cap in Zone 2 this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count3_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_100" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- �n�Y
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_11.."][$SETVAR2="..Highestlv_11.."]" )
			-- �z���D¾���ť����b<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>���϶����~�ŦX�I�����A�бz���F�����ݨD�C
		end
	else
		PlayMotion( TargetID() , 107 )	-- �n�Y
		Starttime_11 = string.format("%02d", Starttime_11 )
		Endtime_11 = string.format("%02d", Endtime_11 )

		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_11.."][$SETVAR2="..Endtime_11.."]" ) 
		-- �I���A�ȱN��<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>�}��A�бz�@�ߵ��ԡC
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_4(  ) -- Zone2 NPC ���p�I������(��ܼ@��)

	Lua_Hao_Sop_MandD_Trade_Basic_4_0( GetDBKeyValue("Money_12") , GetDBKeyValue("Diamond_12") )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Basic_4_0( Money_12 , Diamond_12 ) -- ���p�I������

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V

	local Starttime_12 = GetDBKeyValue("Starttime_12")			-- �C�����_�l�ɶ�
	local Endtime_12 = GetDBKeyValue("Endtime_12")			-- �C���������ɶ�
	local Lowestlv_12 = GetDBKeyValue("Lowestlv_12")			-- �i����̧C����
	local Highestlv_12 = GetDBKeyValue("Highestlv_12")			-- �i����̰�����
	local PlayerLv = ReadRoleValue( OwnerID() , EM_RoleValue_LV )		-- Ū�����a����
	local Freetrade_12 = GetDBKeyValue("Freetrade_12")			-- ���a���������
	local Hour_Now = GetSystime(1)						-- Ū���{�b�ɶ�(��)
	local Date_Now = GetSystime(4)						-- Ū���{�b���
	local Freetrade = ReadAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count4_8 , 8 )	-- Ū�����a�b��������W���q
	local Servertrade = ReadRoleValue( TargetID() , EM_RoleValue_Register+2 )			-- Ū��Server���|�l����q
	local TotalDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_Account )		-- �`���p
	local LockDiamond = ReadRoleValue( OwnerID() , EM_RoleValue_Money_AccountLock )		-- �H�Υd�ʶR��A���30�Ѫ����p
	local Weektrade = GetWorldVar( "SC_ITEM_SOP_101" )

	if Starttime_12 >= 24 then
		Starttime_12 = 0
	elseif Endtime_12 >= 24 or Endtime_12 == 0 then
		Endtime_12 = 24
	end

	if Servertrade <= 0 or Freetrade <= 0 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_08]" )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ITEM_SOP_09]" , C_SYSTEM )
		return false
	elseif Weektrade <= 100 then
		PlayMotion( TargetID() , 107 )	-- �n�Y
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_14]" ) -- �����I�����Ƥw�F�W���A�I���A�ȱN����A�����@�᭫�s�}��C
		return false
	end

	if Hour_Now >= Starttime_12 and Hour_Now < Endtime_12 then		-- �p�ɧP�_
		if PlayerLv >= Lowestlv_12 and PlayerLv <= Highestlv_12 then	-- ���a���ŧP�_
			if ( TotalDiamond - LockDiamond ) < Diamond_12 then	-- 2010.09.24 �H�Υd����
				PlayMotion( TargetID() , 107 )	-- �n�Y
				SetSpeakDetail( OwnerID() , "[SC_112311_6]" ) -- �z�ҫ������ƶq�����A�٤���I����C 
				return false
			else
				PlayMotion( TargetID() , 106 )	-- �I�Y
				AddRoleValue( OwnerID() , EM_RoleValue_Money , Money_12 )
				AddRoleValue( OwnerID() , EM_RoleValue_Money_Account , - Diamond_12 )
				DesignLog( OwnerID() , 115816 ,"Convert "..Money_12.." gold with "..Diamond_12.." diamonds successfully in Zone 2" ) -- ���p�I������ Zone2 �I������
				PlaySoundToPlayer( OwnerID() , "sound\\interface\\ui_backpack_loot01.mp3", false )
				Servertrade = Servertrade - 1
				Freetrade = Freetrade - 1
				Weektrade = Weektrade - 1
				if Servertrade == 0 then
					DesignLog( OwnerID() , 2000003 ,"There is a limit cap in exchanging "..Diamond_12.." diamond to "..Money_12.." money today in Zone 2" )
				end
				if Weektrade == 100 then
					DesignLog( OwnerID() , 200000003 ,"Your exchange times for "..Diamond_12.." diamond to "..Money_12.." money arrived to the cap in Zone 2 this week" )
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , Servertrade )
				WriteAccountFlagValue( OwnerID() , EM_AccountFlag_CE_Count4_8 , 8 , Freetrade )
				SetWorldVar( "SC_ITEM_SOP_101" , Weektrade )
				CloseSpeak( OwnerID() )
			end
		else
			PlayMotion( TargetID() , 107 )	-- �n�Y
			SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_45][$SETVAR1="..Lowestlv_12.."][$SETVAR2="..Highestlv_12.."]" )
			-- �z���D¾���ť����b<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>���϶����~�ŦX�I�����A�бz���F�����ݨD�C
		end
	else
		PlayMotion( TargetID() , 107 )	-- �n�Y
		Starttime_12 = string.format("%02d", Starttime_12 )
		Endtime_12 = string.format("%02d", Endtime_12 )
		SetSpeakDetail( OwnerID() , "[SC_ITEM_SOP_46][$SETVAR1="..Starttime_12.."][$SETVAR2="..Endtime_12.."]" ) 
		-- �I���A�ȱN��<CM>[$VAR1]</CM> ~ <CM>[$VAR2]</CM>�}��A�бz�@�ߵ��ԡC
	end
end

--	PlayMotion( TargetID() , 112 ) -- ��
--	PlayMotion( OwnerID() , 119 ) -- �C�ܤ��w
--	PlayMotion( OwnerID() , 120 ) -- �q��
--	PlayMotion( OwnerID() , 250 ) -- ���k
--	PlayMotion( OwnerID() , 253 ) -- ���ꦡ��§
--	PlayMotion( OwnerID() , 254 ) -- ���i�y
--	PlayMotion( OwnerID() , 266 ) -- �N�ְ{ģ
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Del_NPC()	-- �R��NPC���

	local Owner = OwnerID();

	if CheckBuff( Owner, 501570 ) == true then 
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end

	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	
	AddBuff( Owner, 501570,0,-1);
	DialogCreate( Owner, EM_LuaDialogType_Select, "[SC_ITEM_SOP_1]" )   --NPC������ܪ��
 		DialogSelectStr( Owner, "[SC_BUFFNPC_39]") 	--�O��
		DialogSelectStr( Owner, "[SO_BACK]")	--��^�W�@��

	if ( DialogSendOpen( Owner ) == false )  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Owner, Owner, 1 , "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--���}�Ҥ���A����j��
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  --30��L�ʧ@�A������ܵ���
			ScriptMessage( Owner, Owner, 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( Owner )
			CancelBuff( Owner, 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( Owner )  --�ˬd�ϥΪ̿��������
			if DialogStatus == -2  then -- ��l��
			
			elseif DialogStatus == -1  then-- ���_
				CancelBuff( Owner, 501570 );--
				DialogClose( Owner )
				Step = 1
			elseif DialogStatus == 0 then  -- �R��NPC
				CancelBuff( Owner, 501570 );--
				Beginplot( Owner, "Lua_Hao_Sop_Del_NPC_01" , 0 )
				DialogClose( Owner )	
				Step = 1			
			elseif DialogStatus == 1 then -- �^��W����
				CancelBuff( Owner, 501570 );--
				Beginplot( Owner, "Lua_Hao_Item_SOP_00", 0 )
				DialogClose( Owner )
				Step= 1
			end
		if Step == 1 then
			break
		end
	end
end  
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Del_NPC_01() 	--����R��NPC

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115808 , 115809 , 115810 , 115811 , 115812 , 115813 , 115814 , 115817 , 115825 , 116067, 124148, 124149 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for i = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[i] then  --�Y���}�C������
						DelObj(ID) 
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Ranger( dis )	-- �Z���W�L�Y������ܵ���

	local Player = OwnerID()
	local BuffID = 621751
	local BuffIDPos , NpcGuid , Npc
	while true do
		BuffIDPos = Lua_BuffPosSearch( Player , BuffID )				-- �� Buff ����m
		NpcGuid = BuffInfo( Player , BuffIDPos , EM_BuffInfoType_OwnerID )	-- �� Buff �I�i��
		Npc = ReadRoleValue( NpcGuid , EM_RoleValue_OrgID )
	--	DebugMsg( 0 , 0 , " Npc = "..Npc )
		if GetDistance( Player , NpcGuid )  >= dis then
			CloseSpeak( Player )
			AdjustFaceDir( NpcGuid , Player , 0 ) -- ���V
			if Npc ==  115808 then	--�C��e1�Ӫ��~A
				PlayMotion( NpcGuid , 111 ) -- �P�q
				break
			elseif Npc == 115809 then	--�C��e1�Ӫ��~ B
				PlayMotion( NpcGuid , 251 ) -- �c��§��
				break
			elseif Npc == 115810 then	--�C��e2�Ӫ��~
				PlayMotion( NpcGuid , 250 ) -- ���k
				break
			else									--�䥦
				PlayMotion( NpcGuid , 116 ) -- �A��				
				break
			end
		end
		sleep(1)
	end
	CancelBuff_NoEvent( Player , BuffID )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Keyitem()	-- �N�C�魫�n�X���k�s

	local Owner = OwnerID();
	local Flag = { 544045 , 544046 , 544047 , 544048 , 544049 };

	for i = 1 , table.getn(Flag) , 1 do
		SetFlag( Owner, Flag[i], 0 );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Player(Amount) -- ���m"���a"���1.�w�I�������B���p 2.�H�����������ơA��_�ܫ�x�]�w���W�����ơC

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Upperlimit = {
				GetDBKeyValue("Freetrade_00"),	-- ���~�۴�NPC �����I�����p  
				GetDBKeyValue("Freetrade_01"),	-- ���~�۴�NPC ���p�I������
				GetDBKeyValue("Freetrade_11"),	-- Zone2 NPC �����I�����p
				GetDBKeyValue("Freetrade_12"),	-- Zone2 NPC ���p�I������
				GetDBKeyValue("ExBarterlimit_00"),	-- �HA��B ���1
				GetDBKeyValue("ExBarterlimit_01"),	-- �HA��B ���2
				GetDBKeyValue("ExBarterlimit_02"),	-- �HA��B�BC
				GetDBKeyValue("ExBarterlimit_03"),	-- �HA��B�BC�BD
				GetDBKeyValue("Plus_01_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���1
				GetDBKeyValue("Plus_02_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���2
				GetDBKeyValue("Plus_03_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���3
				GetDBKeyValue("Plus_04_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���4
				GetDBKeyValue("Plus_05_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���5
				GetDBKeyValue("Currency_01_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���1
				GetDBKeyValue("Currency_02_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���2
				GetDBKeyValue("Currency_03_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���3
				GetDBKeyValue("Currency_04_DailyAccountLimit"),	-- �u�ʳ]�w�H������ ���4
				GetDBKeyValue("Currency_05_DailyAccountLimit")	-- �u�ʳ]�w�H������ ���5
										}

	local Count = {
			EM_AccountFlag_CE_Count1_8,
			EM_AccountFlag_CE_Count2_8,
			EM_AccountFlag_CE_Count3_8,
			EM_AccountFlag_CE_Count4_8,
			EM_AccountFlag_CE_Count5_8,
			EM_AccountFlag_CE_Count6_8,
			EM_AccountFlag_CE_Count7_8,
			EM_AccountFlag_CE_Count8_8,
			EM_AccountFlag_CE_Count9_8,
			EM_AccountFlag_CE_Count10_8,
			EM_AccountFlag_CE_Count11_8,
			EM_AccountFlag_CE_Count12_8,
			EM_AccountFlag_CE_Count13_8,
			EM_AccountFlag_CE_Count14_8,
			EM_AccountFlag_CE_Count15_8,
			EM_AccountFlag_CE_Count16_8,
			EM_AccountFlag_CE_Count17_8,
			EM_AccountFlag_CE_Count18_8
							};

	for Index, Limit in pairs(Upperlimit) do
		local SetValue
		if type(Amount) == "number" and Amount >= 0 then
			SetValue = Amount;
		else
			SetValue = Limit;
		end
		WriteAccountFlagValue( Owner, Count[Index], 8, SetValue );
	--	DebugMsg( Owner, Room, "Index = "..Index..", Value = "..SetValue );
	--	Say( Owner, "Index = "..Index..", Value = "..SetValue );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_Reset_Server(Amount)	-- ���m"���A��"���1.�w�I�������B���p 2.�H�����������ơA��_�ܫ�x�]�w���W�����ơC( �ȭ��ϥΪ̥ثeZone )

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Upperlimit = {
				{ 115813, GetDBKeyValue("Servertrade_00"), EM_RoleValue_Register+2 },	-- ���~�۴�NPC �����I�����p
				{ 115814, GetDBKeyValue("Servertrade_01"), EM_RoleValue_Register+2 },	-- ���~�۴�NPC ���p�I������
				{ 115815, GetDBKeyValue("Servertrade_11"), EM_RoleValue_Register+2 },	-- Zone2 NPC �����I�����p
				{ 115816, GetDBKeyValue("Servertrade_12"), EM_RoleValue_Register+2 },	-- Zone2 NPC ���p�I������
				{ 115812, GetDBKeyValue("ExServerBarterlimit_00"), EM_RoleValue_Register+2 },	-- �HA��B ���1
				{ 115817, GetDBKeyValue("ExServerBarterlimit_01"), EM_RoleValue_Register+2 },	-- �HA��B ���2
				{ 115825, GetDBKeyValue("ExServerBarterlimit_02"), EM_RoleValue_Register+2 },	-- �HA��B�BC
				{ 116067, GetDBKeyValue("ExServerBarterlimit_03"), EM_RoleValue_Register+2 },	-- �HA��B�BC�BD

				{ 124148, GetDBKeyValue("Plus_01_DailyServerLimit"), EM_RoleValue_Register+1 },	-- �u�ʳ]�w�H������ ���1
				{ 124148, GetDBKeyValue("Plus_02_DailyServerLimit"), EM_RoleValue_Register+3 },	-- �u�ʳ]�w�H������ ���2
				{ 124148, GetDBKeyValue("Plus_03_DailyServerLimit"), EM_RoleValue_Register+5 },	-- �u�ʳ]�w�H������ ���3
				{ 124148, GetDBKeyValue("Plus_04_DailyServerLimit"), EM_RoleValue_Register+7 },	-- �u�ʳ]�w�H������ ���4
				{ 124148, GetDBKeyValue("Plus_05_DailyServerLimit"), EM_RoleValue_Register+9 },	-- �u�ʳ]�w�H������ ���5

				{ 124149, GetDBKeyValue("Currency_01_DailyServerLimit"), EM_RoleValue_Register+1 },	-- �u�ʳ]�w�H������ ���1
				{ 124149, GetDBKeyValue("Currency_02_DailyServerLimit"), EM_RoleValue_Register+3 },	-- �u�ʳ]�w�H������ ���2
				{ 124149, GetDBKeyValue("Currency_03_DailyServerLimit"), EM_RoleValue_Register+5 },	-- �u�ʳ]�w�H������ ���3
				{ 124149, GetDBKeyValue("Currency_04_DailyServerLimit"), EM_RoleValue_Register+7 },	-- �u�ʳ]�w�H������ ���4
				{ 124149, GetDBKeyValue("Currency_05_DailyServerLimit"), EM_RoleValue_Register+9 }	-- �u�ʳ]�w�H������ ���5
														}

	local Count = SetSearchAllNPC( Room );
	for i=1 , Count , 1 do
		local Guid = GetSearchResult();
		local OrgID = ReadRoleValue( Guid, EM_RoleValue_OrgID );	-- Npc �s��
		for Index, Date in pairs(Upperlimit) do
			if OrgID == Date[1] then  -- �Y���}�C������
				if type(Amount) == "number" and Amount >= 0 then
					WriteRoleValue( Guid, Date[3], Amount );
				else
					WriteRoleValue( Guid, Date[3], Date[2] );
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Open()	-- �}�ҥؼ�NPC���I���A��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115813 , 115814 , 115815 , 115816 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						WriteRoleValue( ID , EM_RoleValue_PID , 1 )
					end
					if Name == 115815 or Name == 115816 then
						WriteRoleValue( ID ,  EM_RoleValue_Register+1  , 0 )
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Close()	-- �����ؼ�NPC���I���A��

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 115813 , 115814 , 115815 , 115816 }

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
						WriteRoleValue( ID , EM_RoleValue_PID , 0 )
					end
					if Name == 115815 or Name == 115816 then
						WriteRoleValue( ID , EM_RoleValue_Register+1  , 1 )
					end
				end
			end
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Test_Server_Count()	-- Ū�����a�b�����O���������ɶ��P�Ʀr

	local Owner = OwnerID();
	local Date = {
			EM_AccountFlag_CE_Date1_12,
			EM_AccountFlag_CE_Date2_12,
			EM_AccountFlag_CE_Date3_12,
			EM_AccountFlag_CE_Date4_12,
			EM_AccountFlag_CE_Date5_12,
			EM_AccountFlag_CE_Date6_12,
			EM_AccountFlag_CE_Date7_12,
			EM_AccountFlag_CE_Date8_12,
			EM_AccountFlag_CE_Date9_12,
			EM_AccountFlag_CE_Date10_12,
			EM_AccountFlag_CE_Date11_12,
			EM_AccountFlag_CE_Date12_12,
			EM_AccountFlag_CE_Date13_12,
			EM_AccountFlag_CE_Date14_12,
			EM_AccountFlag_CE_Date15_12,
			EM_AccountFlag_CE_Date16_12,
			EM_AccountFlag_CE_Date17_12,
			EM_AccountFlag_CE_Date18_12
							};

	local Count = {
			EM_AccountFlag_CE_Count1_8,
			EM_AccountFlag_CE_Count2_8,
			EM_AccountFlag_CE_Count3_8,
			EM_AccountFlag_CE_Count4_8,
			EM_AccountFlag_CE_Count5_8,
			EM_AccountFlag_CE_Count6_8,
			EM_AccountFlag_CE_Count7_8,
			EM_AccountFlag_CE_Count8_8,
			EM_AccountFlag_CE_Count9_8,
			EM_AccountFlag_CE_Count10_8,
			EM_AccountFlag_CE_Count11_8,
			EM_AccountFlag_CE_Count12_8,
			EM_AccountFlag_CE_Count13_8,
			EM_AccountFlag_CE_Count14_8,
			EM_AccountFlag_CE_Count15_8,
			EM_AccountFlag_CE_Count16_8,
			EM_AccountFlag_CE_Count17_8,
			EM_AccountFlag_CE_Count18_8
							};

	for Index, Define in ipairs(Date) do
		Say( Owner, "Index = "..Index.." ,Date = "..ReadAccountFlagValue( Owner, Define, 12 ).." ,Count = "..ReadAccountFlagValue( Owner, Count[Index], 8 ) );
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_Sop_Diamond_Lock()	-- Ū�����a���H�����p���q

	local Owner = OwnerID();
	local LockDiamond = ReadRoleValue( Owner, EM_RoleValue_Money_AccountLock );
	Say( Owner, LockDiamond );
end

function Lua_Hao_Test_Week0(X)	-- �վ���A���C�P����W���q

	local String = "SC_ITEM_SOP_";
	local List = {};
	List[1] = 100	-- ���p�I������
	List[2] = 101	-- �����I�����p
	List["WeeklyServerItemExchang_01"] = 200	-- �u�ʳ]�w ���w���~�I�����w���~ ���1
	List["WeeklyServerItemExchang_02"] = 201
	List["WeeklyServerItemExchang_03"] = 202
	List["WeeklyServerItemExchang_04"] = 203
	List["WeeklyServerItemExchang_05"] = 204
	List["WeeklyServerCurrencyExchang_01"] = 205	-- �u�ʳ]�w ���w�f���I�����w�f�� ���1
	List["WeeklyServerCurrencyExchang_02"] = 206
	List["WeeklyServerCurrencyExchang_03"] = 207
	List["WeeklyServerCurrencyExchang_04"] = 208
	List["WeeklyServerCurrencyExchang_05"] = 209

	for Index, Number in pairs(List) do
		SetWorldVar( String..Number , X+100 );

	end
	DebugMsg( 0, 0, "Ready to work" );
end

function Lua_Hao_Test_Week1()	-- ���m���A���C�P����W���q

	local Weektrade_00 = GetDBKeyValue("Weektrade_00") + 100;	-- �����I�������p - ���A���C�P����W���q
	local Weektrade_01 = GetDBKeyValue("Weektrade_01") + 100;	-- ���p�I�������� - ���A���C�P����W���q
	SetWorldVar( "SC_ITEM_SOP_100", Weektrade_00 );
	SetWorldVar( "SC_ITEM_SOP_101", Weektrade_01 );

	-- �u�ʳ]�w ���~�I�����~(5�Ӥ��) Plus_01_WeeklyServerLimit ~ Plus_05_WeeklyServerLimit ���� SC_ITEM_SOP_200 ~ SC_ITEM_SOP_204
	for i = 0, 4 do
		local WeeklyServerLimit = GetDBKeyValue("Plus_"..string.format( "%02d", i+1 ).."_WeeklyServerLimit") + 100;	-- Server �C�P�I���W���q
		SetWorldVar( "SC_ITEM_SOP_20"..i , WeeklyServerLimit );
	end

	-- �u�ʳ]�w �f���I���f��(5�Ӥ��) Currency_01_WeeklyServerLimit ~ Currency_05_WeeklyServerLimit ���� SC_ITEM_SOP_205 ~ SC_ITEM_SOP_209
	for i = 0, 4 do
		local WeeklyServerLimit = GetDBKeyValue("Currency_"..string.format( "%02d", i+1 ).."_WeeklyServerLimit") + 100;	-- Server �C�P�I���W���q
		SetWorldVar( "SC_ITEM_SOP_20"..(i+5) , WeeklyServerLimit );
	end
end

function Lua_Hao_Test_Week2()	-- ��ܦ��A����e���C�P����W���q

	local Owner = OwnerID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local Weektrade_00 = GetWorldVar( "SC_ITEM_SOP_100" ) - 100;	-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
	local Weektrade_01 = GetWorldVar( "SC_ITEM_SOP_101" ) - 100;	-- Ū���}�����]�w��-- �t�X���A���}�� / ��������W���q
	DebugMsg( Owner, Room, "Weektrade_00 = "..Weektrade_00 );
	DebugMsg( Owner, Room, "Weektrade_01 = "..Weektrade_01 );

	for i = 0, 9 do	-- �u�ʳ]�w �H�������ΥH������
		local WeeklyServerLimit = GetWorldVar("SC_ITEM_SOP_20"..i ) - 100;	-- Server �C�P�I���W���q
		DebugMsg( Owner, Room, "WeeklyServerLimit_0"..i.." = "..WeeklyServerLimit );
	end
end