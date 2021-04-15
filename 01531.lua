---------------------------------------------------
function LuaS_118toZone1_0()
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_118toZone1_1",50)
end

---------------------------------------------------
function LuaS_118toZone1_1()--�X�h
---------------------------------------------------
	ChangeZone(OwnerID(),1,0,2390,-210,-5415,146)
end

---------------------------------------------------
function LuaS_118toZone1_2() --���b�� �[�զh�����X�ͼ@��
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_118toZone1_3",50)
end

---------------------------------------------------
function LuaS_118toZone1_3() --�}�Ҷǰe�e���T�{��� �y�i ##�`�N�G������u�����`�B�����Ȥ��e���즹�B �j�z
---------------------------------------------------
--�y�i ##�`�N�G������u�����`�B�����Ȥ��e���즹�B �j�z
--�P�_�O�_��������
--�����ܥ��ȧ���
	if CheckAcceptQuest( OwnerID() , 420491 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SAY_420491") , 0 )
		SetFlag( OwnerID() , 540777 , 1)
	end

--���s�}�����ȼ@��
	local Ans
	if	CheckBuff(OwnerID(),504308)	then
--�ǰT��	
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
			Tell(OwnerID(),TargetID(),"[SC_422717_3]")
			--�X�{�G�ܿ�� �ݥL�n���n�^��ͤ��a
			DialogCreate(OwnerID(),EM_LuaDialogType_YesNo,"[SC_422717_4]")
			DialogSelectStr( OwnerID(),"[SO_YES]")
			DialogSelectStr( OwnerID(),"[SO_NO]")
			Ans = LuaS_DialogRePort_TwoChoose(OwnerID())
			if	Ans == "Etc"	then
				CancelBuff(OwnerID(),504308)
				return
			end
			if	Ans == "Yes"	then
				ChangeZone(OwnerID(),8,0,-2468,350,23582,215)
			end
			if	Ans == "No"	then
				CancelBuff(OwnerID(),504308)
				return
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end

-----------------------------------------------------------------------
function LuaS_118toZone1_4() --�԰��������Უ�Ͷǰe�����L�����}
-----------------------------------------------------------------------
--�X�{�ݼv
--���
	local King = Lua_DW_CreateObj("flag",113581,780088,3)
	WriteRoleValue(King,EM_RoleValue_LiveTime,8)
	sleep(20)
	Say(King,"[SC_102623_18]")
	sleep(20)
--�إ߶ǰe��
--�������O �Y���� �W��
--������m
	local Door = Lua_DW_CreateObj("flag",113570,780088,2,0)
	SetModeEx(Door,EM_SetModeType_Gravity,false) 
	SetModeEx(Door,EM_SetModeType_ShowRoleHead,false) 
	SetModeEx(Door,EM_SetModeType_HideName, true) 
	SetModeEx( Door,EM_SetModeType_Move, false )
	WriteRoleValue(Door,EM_RoleValue_Y,ReadRoleValue(Door,EM_RoleValue_Y)+20)
	AddToPartition(Door,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	sleep(10)
end


---------------------------------------------------------------------
function LuaS_118toZone1_5() -- �ǰe������ܼ@��
---------------------------------------------------------------------
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_102623_6]","LuaS_118toZone1_6", 0 )
end

---------------------------------------------------------------------
function LuaS_118toZone1_6() --����ǰe
---------------------------------------------------------------------
	CloseSpeak(OwnerID())
	ChangeZone(OwnerID(),118,-1,563,676.3,-137,270)
end

---------------------------------------------------
function LuaS_Zone1to118_0() --�i��
---------------------------------------------------
	SetPlot(OwnerID(),"range","LuaS_Zone1to118_1",50)
end

---------------------------------------------------
function LuaS_Zone1to118_1()
---------------------------------------------------
	if	CheckCompleteQuest(OwnerID(),422715)	then
		CancelBuff(OwnerID(),504308)
		if ChangeZone(OwnerID(),118,-1,-102.2,670.3,-2148,303) then
			local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
			local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
			DesignLog( OwnerID() , 118 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_422717_5]", 0 )
	end
end

------------------------------------------------------------------------------------------
function LuaI_the_118_Enter()  ----�ǰe���i�J��
--------------------------------------------------------------------------------------------
	SetPlot( OwnerID() , "Collision" , "LuaS_the_Zone118_Enter" , 0 )
end
function LuaS_the_Zone118_Enter()
	if ChangeZone( OwnerID() , 118 , -1 , -61 , 670 , -2080 , 294 ) then ---���i�h�ƥ����y��
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					-- ���o���a����
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				-- ���o���a��¾����
		DesignLog( OwnerID() , 118 , " last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV )		-- �����i�J�H��	
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end

----------------------------------------------------------------------------------------------
function LuaI_the_118_Out() ---�ǰe���X�f��
---------------------------------------------------------------------------------------------
	SetPlot( OwnerID() , "Collision" , "LuaS_the_Zone118_Out" , 0 )
end
function LuaS_the_Zone118_Out()
	if ChangeZone( OwnerID() , 1 , 0, 2417 , -220, -5416 , 232 ) then ---�X�ƥ��᪺�y���I

	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[WARRING_ZONE_NOT_OPEN]" , 0 )
	end
end