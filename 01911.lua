-- �w�}�� --
-- �C�骫�~
-- �洫���~
-- ���p�B�����I��

-- ���}�� --
-- �`�����~
-- ���ǻ`�����~
-- �C���]�k
-- �C�骫�~�A�������|�V�ӶV�n������
-- �C�骫�~�A�̷ӤѼƤ��P�A�e�X��§���]���P( Day1 �BDay2�BDay3�BDay4�BDay5�BDay6�BDay7 )
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Item_SOP_CHECK()

	local Owner = OwnerID();
	local Obj = Role:new( Owner )
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )	-- �P�_Zone�P���y
	--local ZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) 
	--local Zone = ZoneID -1000*math.floor( ZoneID / 1000 )

	if ZoneID> 0 and  ZoneID< 100 and Obj:RoomID() == 0 then
		return true
	else
		ScriptMessage( Owner, Owner, 1 , "[SC_CANTHOME]" , 0 )	--�A����b���ϥΡC
		ScriptMessage( Owner, Owner, 0 , "[SC_CANTHOME]" , 0 )	--�A����b���ϥΡC
		return false
	end
end

function Lua_Hao_Item_SOP_00()

	BeginPlot( OwnerID() , "Lua_Hao_Item_SOP_01" , 0 )
end

function Lua_Hao_Item_SOP_01()

	local Owner = OwnerID();

	if CheckBuff( Owner, 501570 ) == true then 
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}	
	Menu[1]={ "[SC_ITEM_SOP_20]" }	--�C�骫�~
	Menu[2]={ "[SC_ITEM_SOP_21]" }	--�H������
	Menu[3]={ "[SC_ITEM_SOP_22]" }	--�C�����P���p���
	Menu[4]={ "[SC_ITEM_SOP_227]" }	--�إ߼u�ʪ��~����Npc
	Menu[5]={ "[SC_ITEM_SOP_228]" }	--�إ߼u�ʳf������Npc
	Menu[6]={ "[SC_BUFFNPC_06]" }	--�R��NPC
	Menu[7]={ "[SO_EXIT]"}			--���}���

	DialogCreate( Owner, EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC������ܪ�� �п�ܬ��ʤ��e
	AddBuff( Owner, 501570,0,-1);
	
	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( Owner, Menu[i][1] ) 	--�C�骫�~
	end

	if ( DialogSendOpen( Owner ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( Owner, Owner, 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( Owner, Owner, 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			DialogClose( Owner )
			CancelBuff( Owner, 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( Owner)  --�ˬd�ϥΪ̿��������
			if DialogStatus == -2  then -- ��l��
			
			elseif DialogStatus == -1  then--���_
				Step = 1
			elseif DialogStatus == 0 then  -- �C�骫�~
				Beginplot( Owner, "Lua_Hao_Sop_Daily_Articles_Menu" , 0 )
				Step = 1			
			elseif DialogStatus == 1 then -- �H������
				Beginplot( Owner, "Lua_Hao_Sop_Barter_Menu" , 0 )
				Step = 1
			elseif DialogStatus == 2 then --�C�����P���p���
				Beginplot( Owner, "Lua_Hao_Sop_MandD_Trade_Menu" , 0 )
				Step = 1
			elseif DialogStatus == 3 then	-- �u�ʧI�����~
				CallPlot( Owner, "Lua_Hao_Sop_CreateNPC", 124148 );
				Step = 1
			elseif DialogStatus == 4 then	-- �u�ʧI���f��
				CallPlot( Owner, "Lua_Hao_Sop_CreateNPC", 124149 );
				Step = 1
			elseif DialogStatus == 5 then -- �R��NPC
				Beginplot( Owner, "Lua_Hao_Sop_Del_NPC" , 0 )
				Step = 1
			elseif DialogStatus == 6 then -- ���}���
				Step = 1
			end
		if Step == 1 then
			CancelBuff( Owner, 501570 );
			DialogClose( Owner)
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_Menu( )	-- �C�骫�~�ذe���
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}

	Menu[1]={ "[SC_ITEM_SOP_30]" }	--�C���ذe1�Ӫ��~ ���1
	Menu[2]={ "[SC_ITEM_SOP_31]" }	--�C���ذe1�Ӫ��~ ���2
	Menu[3]={ "[SC_ITEM_SOP_32]" }	--�C��P���ذe2�Ӫ��~
	Menu[4]={ "[SC_ITEM_SOP_33]" }	--�C��P���ذe3�Ӫ��~
	Menu[5]={ "[SO_BACK]"}		--�^��W�@��
	Menu[6]={ "[SO_EXIT]"}		--���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC������ܪ��
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	--�C�骫�~
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������

		if DialogStatus == -2  then -- ��l��
		
		elseif DialogStatus == -1  then--���_
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --�C��e1�Ӫ��~A
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --�C��e1�Ӫ��~B
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --�C��e2�Ӫ��~
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_3" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --�C��e3�Ӫ��~
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Daily_Articles_4" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --�^��W�@��
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --���}���
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_Menu()	-- �H���������
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	local Time , Step , DialogStatus = 0 , 0 , 0
	local Menu = {}
--	�椣�q�A���~��榳�r�Ʃγs���W��
	-- �HA����B ���1
--	local ID_1 = GetDBKeyValue("ExItemID_00")		-- �I�X�����~A_ID
--	local Count_1 = GetDBKeyValue("ExItemAmount_00")	-- �I�X�����~A_�ƶq
--	local RID_1 = GetDBKeyValue("ExReturnGoods_00")	-- �o�쪺���~B_ID
--	local RCount_1 = GetDBKeyValue("ExReturnAmount_00")	-- �o�쪺���~B_�ƶq
--	-- �HA����B ���2
--	local ID_2 = GetDBKeyValue("ExItemID_01")		-- �I�X�����~A_ID
--	local Count_2 = GetDBKeyValue("ExItemAmount_01")	-- �I�X�����~A_�ƶq
--	local RID_2 = GetDBKeyValue("ExReturnGoods_01")	-- �o�쪺���~B_ID
--	local RCount_2 = GetDBKeyValue("ExReturnAmount_01")	-- �o�쪺���~B_�ƶq
--	-- �HA����B�BC
--	local ID_3 = GetDBKeyValue("ExItemID_02")			-- �I�X�����~A_ID
--	local Count_3 = GetDBKeyValue("ExItemAmount_02")		-- �I�X�����~A_�ƶq
--	local RID_3_0 = GetDBKeyValue("ExReturnGoods_02")		-- �o�쪺���~B_ID
--	local RCount_3_0 = GetDBKeyValue("ExReturnAmount_02")	-- �o�쪺���~B_�ƶq
--	local RID_3_1 = GetDBKeyValue("ExReturnGoods_02_1")		-- �o�쪺���~C_ID
--	local RCount_3_1 = GetDBKeyValue("ExReturnAmount_02_1")	-- �o�쪺���~C_�ƶq
--	-- �HA����B�BC�BD
--	local ID_4 = GetDBKeyValue("ExItemID_03")			-- �I�X�����~A_ID
--	local Count_4 = GetDBKeyValue("ExItemAmount_03")		-- �I�X�����~A_�ƶq
--	local RID_4_0 = GetDBKeyValue("ExReturnGoods_03")		-- �o�쪺���~B_ID
--	local RCount_4_0 = GetDBKeyValue("ExReturnAmount_03")	-- �o�쪺���~B_�ƶq
--	local RID_4_1 = GetDBKeyValue("ExReturnGoods_03_1")		-- �o�쪺���~C_ID
--	local RCount_4_1 = GetDBKeyValue("ExReturnAmount_03_1")	-- �o�쪺���~C_�ƶq
--	local RID_4_2 = GetDBKeyValue("ExReturnGoods_03_2")		-- �o�쪺���~D_ID
--	local RCount_4_2 = GetDBKeyValue("ExReturnAmount_03_2")	-- �o�쪺���~D_�ƶq
--
--	Menu[1]={ "[SC_ITEM_SOP_50][$SETVAR1="..Count_1.."][$SETVAR2=".."["..ID_1.."]".."][$SETVAR3="..RCount_1.."][$SETVAR4=".."["..RID_1.."]".."]" }
--	--�H<CM>[$VAR2]</CM>x<CY>[$VAR1]</CY>�I��<CM>[$VAR4]</CM>x<CY>[$VAR3]</CY>�C
--	Menu[2]={ "[SC_ITEM_SOP_50][$SETVAR1="..Count_2.."][$SETVAR2=".."["..ID_2.."]".."][$SETVAR3="..RCount_2.."][$SETVAR4=".."["..RID_2.."]".."]" }
--	--�H<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>�I��<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>�C
--	Menu[3]={ "[SC_ITEM_SOP_51][$SETVAR1="..Count_3.."][$SETVAR2=".."["..ID_3.."]".."][$SETVAR3="..RCount_3_0.."][$SETVAR4=".."["..RID_3_0.."]".."][$SETVAR5="..RCount_3_1.."][$SETVAR6=".."["..RID_3_1.."]".."]" }
--	--�H<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>�I��<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>�B<CY>[$VAR5]</CY> x <CM>[$VAR6]</CM>�C
--	Menu[4]={ "[SC_ITEM_SOP_52][$SETVAR1="..Count_4.."][$SETVAR2=".."["..ID_4.."]".."][$SETVAR3="..RCount_4_0.."][$SETVAR4=".."["..RID_4_0.."]".."][$SETVAR5="..RCount_4_1.."][$SETVAR6=".."["..RID_4_1.."]".."][$SETVAR7="..RCount_4_2.."][$SETVAR8=".."["..RID_4_2.."]".."]" }
--	--�H<CY>[$VAR1]</CY> x <CM>[$VAR2]</CM>�I��<CY>[$VAR3]</CY> x <CM>[$VAR4]</CM>�B<CY>[$VAR5]</CY> x <CM>[$VAR6]</CM>�B<CY>[$VAR7]</CY> x <CM>[$VAR8]</CM>�C
	Menu[1]={ "[SC_ITEM_SOP_50]" }	--�HA����B(���1)
	Menu[2]={ "[SC_ITEM_SOP_51]" }	--�HA����B(���2)
	Menu[3]={ "[SC_ITEM_SOP_52]" }	--�HA����B�BC
	Menu[4]={ "[SC_ITEM_SOP_53]" }	--�HA����B�BC�BD
	Menu[5]={ "[SO_BACK]"}		--�^��W�@��
	Menu[6]={ "[SO_EXIT]"}		--���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC������ܪ��
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	-- �H������
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������

		if DialogStatus == -2  then -- ��l��
		
		elseif DialogStatus == -1  then--���_
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --�HA����B ���1
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --�HA����B ���2
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --�HA����B�BC
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_3" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --�HA����B�BC�BD
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_Barter_4" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --�^��W�@��
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --���}���
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_Menu( )	-- �����B���p�I�����
	if CheckBuff( OwnerID() , 501570) == true then 
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );--�����w�g���}�F
		return 0
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0
	local Menu = {}

	Menu[1]={ "[SC_ITEM_SOP_40]" }	--�H�����������p
	Menu[2]={ "[SC_ITEM_SOP_41]" }	--�H���p��������
	Menu[3]={ "[SC_ITEM_SOP_42]"}	--�}��ؼ�NPC���I���A��
	Menu[4]={ "[SC_ITEM_SOP_43]"}	--�����ؼ�NPC���I���A��
	Menu[5]={ "[SO_BACK]"}		--�^��W�@��
	Menu[6]={ "[SO_EXIT]"}		--���}���

	DialogCreate( OwnerID() , EM_LuaDialogType_Select , "[SC_ITEM_SOP_0]" )   --NPC������ܪ��
	AddBuff(OwnerID() , 501570,0,-1);

	for i = 1 , table.getn(Menu) , 1 do
 		DialogSelectStr( OwnerID() , Menu[i][1] ) 	--�C�骫�~
	end

	if ( DialogSendOpen(OwnerID() ) == false)  then  --���ϥο��~�A�^�ǿ��~�T��
		ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) 
		return
	end

	while true do
		sleep(5)
		Time = Time+1
	 	if Time > 60 then  -- 30��L�ʧ@�A������ܵ���
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 ) -- ���m�W�L30��,�۰����������C
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
	
		DialogStatus = DialogGetResult( OwnerID() )  --�ˬd�ϥΪ̿��������

		if DialogStatus == -2  then -- ��l��
		
		elseif DialogStatus == -1  then--���_
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 0 then --�����������p
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_1" , 0 )
			DialogClose( OwnerID() )
			Step = 1			
		elseif DialogStatus == 1 then --���p��������
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_2" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 2 then --�}���Zone NPC�I���A��
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_Open" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 3 then --������Zone NPC�I���A��
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Sop_MandD_Trade_Close" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 4 then --�^��W�@��
			CancelBuff( OwnerID(), 501570 );--
			Beginplot( OwnerID(), "Lua_Hao_Item_SOP_00" , 0 )
			DialogClose( OwnerID() )
			Step = 1
		elseif DialogStatus == 5 then --���}���
			CancelBuff( OwnerID(), 501570 );--
			DialogClose( OwnerID() )
			Step = 1
		end

		if Step == 1 then
			break
		end
	end
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_1( )		 --�C��e1�Ӫ��~A		

	Lua_Hao_Sop_CreateNPC( 115808  )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_2( )		 --�C��e1�Ӫ��~B	

	Lua_Hao_Sop_CreateNPC( 115809 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_3( )		 --�C��e2�Ӫ��~	

	Lua_Hao_Sop_CreateNPC( 115810 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Daily_Articles_4( )		 --�C��e3�Ӫ��~	

	Lua_Hao_Sop_CreateNPC( 115811 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_1()			-- �HA��B ��פ@

	Lua_Hao_Sop_CreateNPC( 115812 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_2()			-- �HA��B ��פG

	Lua_Hao_Sop_CreateNPC( 115817 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_3()			-- �HA��B�BC

	Lua_Hao_Sop_CreateNPC( 115825 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_Barter_4()			-- �HA��B�BC�BD

	Lua_Hao_Sop_CreateNPC( 116067 )
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_1( )		--�H���إ�NPC �C�����洫�����p

	local Pass = GetDBKeyValue("Pass_00")	-- �O�_�i�������
	Lua_Hao_Sop_CreateNPC( 115813 , 1 )
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )	-- �����a�O�_NPC
	WriteRoleValue( NPC , EM_RoleValue_PID , Pass )			-- �N��N�}���g�JNPC
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		-- �N���a Reg +9 �ȲM��
end
----------------------------------------------------------------------------------------------------------------
function Lua_Hao_Sop_MandD_Trade_2( )		--�H���إ�NPC ���p�洫���C����

	local Pass = GetDBKeyValue("Pass_01")	-- �O�_�i�������
	Lua_Hao_Sop_CreateNPC( 115814 , 1 )
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_Register+9 )	-- �����a�O�_NPC
	WriteRoleValue( NPC , EM_RoleValue_PID , Pass )			-- �N����}���g�JNPC
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		-- �N���a Reg+9 �ȲM��
end

function Lua_Hao_Sop_CreateNPC(QNPC , Step)	-- �� Owner �a�I�إ� QNPC

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Obj = Role:new( OwnerID() )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj : X()
 	local BaseY = Obj : Y()
 	local BaseZ = Obj : Z()
	local BaseDir = Obj : Dir()
	local NPC = CreateObj( QNPC , BaseX , BaseY , BaseZ , BaseDir , 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���
	SetModeEx( NPC , EM_SetModeType_Strikback , false )--����
	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
	SetModeEx( NPC , EM_SetModeType_Obstruct , false )--����
	SetModeEx( NPC , EM_SetModeType_Mark , true )--�аO
	SetModeEx( NPC , EM_SetModeType_Move , false )--����
	SetModeEx( NPC , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( NPC , EM_SetModeType_HideName , false )--�W��
	SetModeEx( NPC , EM_SetModeType_ShowRoleHead , true )--�Y����
	SetModeEx( NPC , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC , EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC , EM_SetModeType_Show , true )--���
	AddBuff( NPC , 503217 , 0 , -1 )
	AddToPartition( NPC , RoomID ) -- �إߪ���
	if Step == 1 then
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , NPC )	-- ���F�g�J�}��
	else
	--	Say( OwnerID() , "0" )
	end
end

function Lua_Hao_Sop_Reset_WorldVar() -- ���m�@���ܼ�

	local Weektrade_00 = GetDBKeyValue("Weektrade_00")	--�����I�����p
	local Weektrade_01 = GetDBKeyValue("Weektrade_01")	--���p�I������
	AddBuff( TargetID() , 503217 , 0 , -1 )
	SetWorldVar( "SC_ITEM_SOP_100" , Weektrade_00+100 )
	SetWorldVar( "SC_ITEM_SOP_101" , Weektrade_01+100 )
--	SetWorldVar( "SC_ITEM_SOP_100" , Value )
--	SetWorldVar( "SC_ITEM_SOP_101" , Value )
end

function Lua_Hao_Sop_Reset_WorldVar2() -- Ū���@���ܼ�

	local Gold = GetWorldVar( "SC_ITEM_SOP_100" )	-- �����I�����p
	local Diamond = GetWorldVar( "SC_ITEM_SOP_101" )	-- ���p�I������

	DebugMsg( OwnerID() , 1 , "Money to Diamond = "..Gold )
	DebugMsg( OwnerID() , 1 , "Diamond to Money = "..Diamond )
end

function Lua_Hao_Sop_Set_WorldVar( Value )

	SetWorldVar( "SC_ITEM_SOP_100" , Value )
	SetWorldVar( "SC_ITEM_SOP_101" , Value )

	local Gold = GetWorldVar( "SC_ITEM_SOP_100" )	-- �����I�����p
	local Diamond = GetWorldVar( "SC_ITEM_SOP_101" )	-- ���p�I������

	DebugMsg( OwnerID() , 1 , "Money to Diamond = "..Gold )
	DebugMsg( OwnerID() , 1 , "Diamond to Money = "..Diamond )
end