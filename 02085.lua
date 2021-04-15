--�w��ݨD ��x���ȼҪO�u��

function lua_mika_questcreate_Q1()
	local getkey = 544424 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544425 --��ѧ������Ȫ�key(�T�w)
	local itemid = GetDBKeyValue("ItemID_100") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_100")   --���ȻݨD���ⵥ�� (��x)
	
	if Checkflag(OwnerID(), okkey) == True then --�p�G����ѧ�������key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --���@����
	else
		if Checkflag(OwnerID(), getkey ) == True then --�p�G����Ѥw���L����key
			local count = CountBodyItem(OwnerID(), itemid )  --���a���W�D��ƶq
			if  count >= needAmount then --���������ȹD��
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --���@����
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_COMPLETE]" , "lua_mika_questcreate_Q1_complete", 0 ) --���-��������
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_02]" )  --�����������
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVEUP]" , "lua_mika_questcreate_Q1_giveup", 0 ) --���-������
			end
		else
			local PlayerLv =  ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			if PlayerLv >= needlv then --��ܥi������
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_01]" )  --�����Ȥ��e
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GET]" , "lua_mika_questcreate_Q1_get", 0 ) --���-��������
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q1_04]" )  --���@����
			end
		end
	end
end

function lua_mika_questcreate_Q1_giveup()
	local getkey = 544424 --��ѱ��L���Ȫ�key(�T�w)
	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 0 )  --�R��key
	CancelBuff(OwnerID(), 506949) -- �R�� �ˬd���ȱ���buff
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GIVEUP2]", 0 )   --�A�w��󦹥��ȡC
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GIVEUP2]" , 0 ) 

end


function lua_mika_questcreate_Q1_get()  --���-��������
	local getkey = 544424 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544425 --��ѧ������Ȫ�key(�T�w)
	local itemid = GetDBKeyValue("ItemID_100") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_100")   --���ȻݨD���ⵥ�� (��x)

	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 1 )
	Addbuff(OwnerID(), 506949, 0, -1   )   -- ���W�ˬd���ȱ���buff  �ثebuff�ȵL�ɶ����� �i��A��
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GETMSG][$SETVAR1=".."["..itemid.."]".."][$SETVAR2="..needAmount.."]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GETMSG][$SETVAR1=".."["..itemid.."]".."][$SETVAR2="..needAmount.."]" , C_SYSTEM ) 
	--�Цܭ쳥���y�Ǫ����o[$VAR2]��[$VAR1]�A������V[116666]�^�����ȡC
end

function lua_mika_questcreate_Q1_complete() --���-��������
	local getkey = 544424 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544425 --��ѧ������Ȫ�key(�T�w)
	local itemid = GetDBKeyValue("ItemID_100") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_100")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_100")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_100")   --���ȻݨD���ⵥ�� (��x)

	local count = CountBodyItem(OwnerID(), itemid )  --���a���W�D��ƶq
	if  count >= needAmount then --���������ȹD��
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM )   --���ߧA�������ȡI
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM ) 
		DelBodyItem(OwnerID(), itemid, needAmount )  --�R�����ȹD��
		GiveBodyItem(OwnerID(), rewardid, RewardAmount ) --���P���y�D��
		Setflag(OwnerID(), okkey, 1 )
		Setflag(OwnerID(), getkey, 0 )
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_NOITEM]", 0 )   --�A�ҫ����ȹD�㤣���A�L�k�������ȡC
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_NOITEM]" , 0 ) 
	end
end

--------------�]�L����--------------

--NPC-A ��l���
function lua_mika_questcreate_Q2()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544427 --��ѧ������Ȫ�key(�T�w)
	local givekey = 544708 --��ѹF�����ȱ���key(�T�w)
	local itemid = GetDBKeyValue("ItemID_110") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_110")   --���ȻݨD���ⵥ�� (��x)

	if Checkflag(OwnerID(), okkey) == True then --�p�G����Ѥw��������key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_04]" )  --���@����
	else
		if Checkflag(OwnerID(), getkey ) == True then --�p�G����Ѥw���L����key
			if  Checkflag(OwnerID(), givekey ) == True then --�p�G���F������key = ��������
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_06]" )  --���F��������
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_COMPLETE]" , "lua_mika_questcreate_Q2_complete", 0 ) --���-��������
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_02]" )  --�����������(NPC-A)
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVEUP]" , "lua_mika_questcreate_Q2_giveup", 0 ) --���-������
			end
		else
			local PlayerLv =  ReadRoleValue( OwnerID() , EM_RoleValue_LV)
			if PlayerLv >= needlv then --��ܥi������
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_01]" )  --�����Ȥ��e
				AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GET]" , "lua_mika_questcreate_Q2_get", 0 ) --���-��������
			else
				SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_04]" )  --���@����
			end
		end
	end
end

function lua_mika_questcreate_Q2_giveup()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local itemid = GetDBKeyValue("ItemID_110") --���ȻݨD�D��ID (��x)
	local count = CountBodyItem(OwnerID(), itemid ) --���a���W���ȹD��ƶq

	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(), itemid , count )
	Setflag(OwnerID(), getkey, 0 )  --�R��key
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GIVEUP2]", 0 )   --�A�w��󦹥��ȡC
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GIVEUP2]" , 0 ) 
end

--NPC-A ���U����
function lua_mika_questcreate_Q2_get()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544427 --��ѧ������Ȫ�key(�T�w)
	local itemid = GetDBKeyValue("ItemID_110") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_110")   --���ȻݨD���ⵥ�� (��x)
	local givekey = 544708 --��ѹF�����ȱ���key(�T�w)

	CloseSpeak(OwnerID())
	Setflag(OwnerID(), getkey, 1 )
	GiveBodyItem(OwnerID(), itemid , needAmount ) --���P���ȹD��
--	Addbuff(OwnerID(), )   
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_GETMSG1][$SETVAR1=".."["..itemid.."]".."]" , C_SYSTEM )  
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_GETMSG1][$SETVAR1=".."["..itemid.."]".."]" , C_SYSTEM ) 
	--
end

--NPC-B- ��l���
function lua_mika_questcreate_Q2_B()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544427 --��ѧ������Ȫ�key(�T�w)
	local givekey = 544708 --��ѹF�����ȱ���key(�T�w)

	local itemid = GetDBKeyValue("ItemID_110") --���ȹD��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --���ȹD��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_110")   --���ȻݨD���ⵥ�� (��x)

	local count = CountBodyItem(OwnerID(), itemid )  --���a���W�D��ƶq
	if Checkflag(OwnerID(), getkey ) == True and count >= needAmount then --�p�G����Ѥw���L���� �B���ȹD��ƶq���T key
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_03]" )  --���F��������(B)
		AddSpeakOption( OwnerID(), TargetID(), "[SC_SPQUESTSET_GIVE]" , "lua_mika_questcreate_Q2_B2", 0 ) --���-��I���~
	else
		SetSpeakDetail(OwnerID(), "[SC_SPQUESTSET_Q2_05]" )  --���@���� ���a��������
	end
end

--NPC-B --���-��I���~
function lua_mika_questcreate_Q2_B2()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544427 --��ѧ������Ȫ�key(�T�w)
	local givekey = 544708 --��ѹF�����ȱ���key(�T�w)
	local itemid = GetDBKeyValue("ItemID_110") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_110")   --���ȻݨD���ⵥ�� (��x)

	local count = CountBodyItem(OwnerID(), itemid )  --���a���W�D��ƶq
	if  count >= needAmount then --���������ȹD��
		CloseSpeak(OwnerID())
		DelBodyItem(OwnerID(), itemid, needAmount )  --�R�����ȹD��
		Setflag(OwnerID(), givekey, 1 )  --�� ���n���~ �F�����ȱ���
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_BACK]", C_SYSTEM )   --�Хh��[116663]�^�����ȡC
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_BACK]" , C_SYSTEM ) 
	else
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_NOITEM]", 0 )   --�A�ҫ����ȹD�㤣���A�L�k�������ȡC
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_NOITEM]" , 0 ) 
	end
end


function lua_mika_questcreate_Q2_complete()
	local getkey = 544426 --��ѱ��L���Ȫ�key(�T�w)
	local okkey = 544427 --��ѧ������Ȫ�key(�T�w)
	local givekey = 544708 --��ѹF�����ȱ���key(�T�w)
	local itemid = GetDBKeyValue("ItemID_110") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_110")   --���ȻݨD�D��ƶq (��x)
	local rewardid = GetDBKeyValue("RewardItemID_110")   -- �������yID(��x)
	local RewardAmount = GetDBKeyValue("RewardItemIDAmount_110")   -- �������y�ƶq(��x)
	local needlv = GetDBKeyValue("Lvlimit_110")   --���ȻݨD���ⵥ�� (��x)

	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM )   --���ߧA�������ȡI
	ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_COMPLETE1]", C_SYSTEM ) 
	GiveBodyItem(OwnerID(), rewardid, RewardAmount ) --�������y�D��
	Setflag(OwnerID(), okkey, 1 )
	Setflag(OwnerID(), getkey, 0 )
	Setflag(OwnerID(), givekey, 0 )
end

---�򥻪k�N�@��
function lua_mika_QTool_itemcheck() 
 -- ���@���j�b [�򥻪k�N-506949] �C5��Ĳ�o�� [�k�N���X-497638] - [ �򥻪k�N-505821] �W  

	local itemid = GetDBKeyValue("ItemID_100") --���ȻݨD�D��ID (��x)
	local needAmount = GetDBKeyValue("ItemIDAmount_100")   --���ȻݨD�D��ƶq (��x)
	local count = CountBodyItem(OwnerID(), itemid )  -- ���a������ ���ȹD��ƶq

--	Say(OwnerID(), needAmount )
--	Say(OwnerID(), count )
	if count >= needAmount then  --�Y���a���� >= ���ȻݨD�q, �Y�ŦX���ȱ���
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_SPQUESTSET_OKMSG]", C_SYSTEM )   
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_SPQUESTSET_OKMSG]" , C_SYSTEM ) 
		-- �F�����ȱ���A�֦V[116666]�^�����ȧa�C
		CancelBuff(OwnerID(), 506949 )
	end
end