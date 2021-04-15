
-------- Q6 �O��ĵ��  ------------

-- ���~ - 240882�a���J�Ԭ��u �ϥ��ˬd

function lua_mika_z22_Q424830_check()
	local npc = TargetID()
	local player = OwnerID()	
	local npclist = { 119684, 119924, 119925, 119926, 119927 }
	local keyitem = { 545799, 545800, 545801, 545802, 545803 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )

	if CheckAcceptQuest( Player, 424831 ) == true or CheckAcceptQuest( Player, 425005 ) == true or CheckAcceptQuest( Player, 424842 ) == true then -- ����������
		-- �ˬd�ϥι�H�O���O�ۤv (���i�H�O�ۤv)
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then --�I�k��H
			for j = 1, table.getn(npclist) do
				if Orgid == npclist[j] then
					if Checkflag(player, keyitem[j] ) == false then  -- �Skey
						-- �i�H�]�@��
						return true
					else
						ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_03]" , 0 )  
						-- �w�g���L�L�аV�F�A�Ȯɥ��[��L�ݬݧa�C
						return false
					end
				end
			end

			ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )  
			--�ϥΥؼп��~�I
			return false
		else
			ScriptMessage( Player , Player , 1 , "[SC_424142_1]" , 0 )  
			--�ϥΥؼп��~�I
			return false
		end
	else  --�S����
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_04]" , 0 )  
		-- �S�������R�O�����p�U�A�٬O���n�H�K���Ԥh�̴c�@�@�a�C
		return false
	end
end

function lua_mika_z22_Q424830_use()
	local NPC = TargetID()
	local player = OwnerID()	

	local npclist = { 119684, 119924, 119925, 119926, 119927 }
	local keyitem = { 545799, 545800, 545801, 545802, 545803 }
	local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424831_01]" , "[SC_Z22_Q424831_02]" }
		-- �o�O����K�y�y�A���K���K����I�I
		-- ���I���ڤ��ڡСССI�I�I

	-- ��NPC�Ȯɲ����Y�H�� �аO�]�w �Ϫ��a�����I��
	SetModeEx( NPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����

	sleep(10)

--	PlayMotion( NPC, 105 )  -- ����

	--NPC���� ( �䤤�@�� )
	local R = Rand(100)+1
	if R > 60 then
		Npcsay(NPC, "[SC_Z22_Q424831_01]" )  --�o�O����K�y�y�A���K���K����I�I
	else
		Npcsay(NPC, "[SC_Z22_Q424831_02]" )  --���I���ڤ��ڡСССI�I�I
	end

	for i = 1 , table.getn(npclist) do
		if Orgid == npclist[i] then
			Setflag(player, keyitem[i], 1 )  -- ��������keyitem
			break
		end
	end

	BeginPlot(NPC, "lua_mika_z22_Q424830_show" , 50 )

end

function lua_mika_z22_Q424830_show()
	local NPC = OwnerID()

	SetModeEx( NPC, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, true )--�Y����

end

function lua_mika_z22_Q424831_complete()
	local itemid = 240882
	local count = CountBodyItem(TargetID(), itemid )
	DelBodyItem(TargetID(), itemid, count )
--	say(TargetID(), "delete item" )
	Lua_ZonePE_3th_GetScore(130)
end

-------- Q7 �@�L���F -----------------------------------------------------------------
-- �@�L���F	424832	425006	424843
-- ���~ 240883 �c�T��÷�l �ϥ��ˬd
function lua_mika_z22_Q424832_check()
	local npc = TargetID()
	local player = OwnerID()	
	local npclist = { 119930, 119931 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )

	if CheckAcceptQuest( Player, 424832 ) == true or CheckAcceptQuest( Player, 425006 ) == true or CheckAcceptQuest( Player, 424843 ) == true then -- ����������
		-- �ˬd�ϥι�H�O���O�ۤv (���i�H�O�ۤv)
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) ~= 1 then --�I�k��H
			for j = 1, table.getn(npclist) do
				if Orgid == npclist[j] then
					return true
				end
			end

			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_04]" , 0 )  
			--�u��ϥΩ�[119930]�C
			return false

		else   --�O���a

			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_04]" , 0 )  
			--�u��ϥΩ�[119930]�C
			return false
		end
	else  --�S����
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424831_04]" , 0 )  -- �M�O���Ȧ@�Φ��r��
		-- �S�������R�O�����p�U�A�٬O���n�H�K���Ԥh�̴c�@�@�a�C
		return false
	end
end

-- 498577 �ϥΨc�T��÷�l
-- 621157 �ϥΨc�T��÷�l
function lua_mika_z22_Q424832_use()
	local NPC = TargetID()
	local player = OwnerID()	
	local NPCID =  106439	-- �e���i���Ԥh

	DW_QietKillOne(player, NPCID  )
	BeginPlot(NPC, "lua_mika_z22_Q424832_delete" , 0 )

end

-- �ϥΪ��~���NPC �h�L����
function lua_mika_z22_Q424832_delete()
	local NPC = OwnerID()

	DelObj(NPC)
end

-- ���\, ���ϥΪ��~ 10���h�L�ۤv����
function lua_mika_z22_Q424832_delete2()
	local NPC = OwnerID()
	local sleeptime = 100   -- 10s

	sleep(sleeptime)
	NPCSay( NPC, "[SC_Z22_Q424832_06]" )    -- �X���|�I�ְk�I
	DelObj(NPC)
end


 ------------ ����Ĳ�I�@�� ���O  ------------ 
function lua_mika_z22_Q424832_touch()
	local obj = OwnerID()	

	Setplot(obj,  "touch" , "lua_mika_z22_Q424832_touch2" , 50 )		
end 

function lua_mika_z22_Q424832_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, 424832 ) == true or CheckAcceptQuest( Player, 425006 ) == true or CheckAcceptQuest( Player, 424843 ) == true then
		if Mount == true then --���b��y
			if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424832_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_z22_Q424832_touch3") ~= 1 then 
			--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
				ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
			end
		else --�b��y
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
		end
	else
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424832_03]" , 0 )
		 --�n�����I�i�ê����O�K�C
	end


end

function lua_mika_z22_Q424832_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- ���O

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			local R = Rand(100)+1  -- �ƥ���v
			if R >= 75 then -- ����
				BeginPlot(NPC, "lua_mika_z22_Q424832_born2" , 0 )
			else  -- ���\
				BeginPlot(NPC, "lua_mika_z22_Q424832_born1" , 0 )
			end
			BeginPlot(NPC, "lua_mika_z22_Q424832_show" , 0 )  --�����O���� 20���X�{
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end

-- ���O ���ë� ����
function lua_mika_z22_Q424832_show()
	local grass = OwnerID()
	local sleeptime = 250

	Hide(grass)
	Sleep(sleeptime)
	Show(grass, 0 )
end

-- ���\
function lua_mika_z22_Q424832_born1()
	local NPC = OwnerID()   --���O
	local Player = TargetID()

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- ���o���O X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID
		local R = Rand(100)+1
		if R >= 60 then    
			NPCID = 119930  --���i���h�L
		else
			NPCID = 119931  --���i���h�L
		end
	local String = "[SC_Z22_Q424832_02]"   -- �ڡI��...�ǤF�ڧa�I
	local emoteid = 264  --  emote_amazed

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --�bNPC�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC2, EM_SetModeType_Move, false )--����
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC2, EM_SetModeType_Show, true )--���
	-- �i�H�쪺�]�w
	SetModeEx( NPC2, EM_SetModeType_Mark, true )--�аO
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, true )--�Y����

	AdjustFaceDir( NPC2, Player, 0 )
	AddToPartition( NPC2 , RoomID) -- �إߪ���
	Sleep(10)
	PlayMotion( NPC2,  264 )   -- emote_amazed
	Npcsay( NPC2, String )
	-- 
	BeginPlot( NPC2, "lua_mika_z22_Q424832_Delete2" , 0 )
end


-- ����
function lua_mika_z22_Q424832_born2()
	local NPC = OwnerID()   --���O
	local Player = TargetID()

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- ���o���O X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID
		local R = Rand(100)+1
		if R >= 60 then    
			NPCID = 119930  --���i���h�L
		else
			NPCID = 119931  --���i���h�L
		end
	local String = "[SC_Z22_Q424832_01]"   -- �Q��ڡH�S����²��I
	local emoteid = 108  --  emote_laugh

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --�bNPC�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC2, EM_SetModeType_Move, false )--����
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC2, EM_SetModeType_Show, true )--���
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--�W��
	-- ���i�쪺�]�w
	SetModeEx( NPC2, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, false )--�Y����

	AdjustFaceDir( NPC2, Player, 0 )
	AddToPartition( NPC2 , RoomID) -- �إߪ���
	Sleep(10)
	PlayMotion( NPC2,  emoteid )  --  emote_laugh
	Npcsay( NPC2, String )  -- �Q��ڡH�S����²��I

	Sleep(15)
	DelObj(NPC2)

end


-------- ------------- Q8  ��U�����״_----------------------------------------------------
-- ��U�����״_ 424833 / 425007  / 424844

-- 119667 �V�m�ΰ��H  /  119932 �V�m�νb�v

 ------------ ����Ĳ�I�@��  ------------ 
function lua_mika_z22_Q424833_touch()
	local obj = OwnerID()	

	Setplot(obj,  "touch" , "lua_mika_z22_Q424833_touch2" , 50 )		
end 


function lua_mika_z22_Q424833_touch2()
	local NPC = TargetID()
	local player = OwnerID()

	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, 424833 ) == true or CheckAcceptQuest( Player, 425007 ) == true or CheckAcceptQuest( Player, 424844 ) == true then

		if CheckBuff( NPC, 621159 ) == false then

			if Mount == true then --���b��y
				if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424833_01]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_z22_Q424833_touch3") ~= 1 then 
				--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424833_02]" , 0 ) -- �ثe�٤��ݭn�״_�������C
		end
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- �S�������� 
	end


end

function lua_mika_z22_Q424833_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- ����

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
			local objid_1 = 119667	--�V�m�ΰ��H
			local objid_2 = 119932 --�V�m�νb�v
			local npcid_1 = 106440  -- �״_�V�m�ΰ��H
			local npcid_2 = 106472 -- �״_�V�m�νb�v

			local buffid = 621159  --  Z22Q424833�����״_�L
			local bufftime = 20

			if Orgid == objid_1 then
				DW_QietKillOne( Player, npcid_1 ) 
			else
				DW_QietKillOne( Player, npcid_2 ) 
			end
			AddBuff( NPC, buffid , 0 , bufftime )
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end

-------- ------------- Q11  ���K�Z�� ----------------------------------------------------
-- ���K�Z��  424836  / 425010  / 424847
-- �����Ȯɭn�R������KEY �M ���Ȭ������~

-- 230164  ��������   ���~�ϥ��ˬd

function lua_mika_z22_Q424836_check()
	local player = OwnerID()

	if CheckAcceptQuest( Player, 424836 ) == true or CheckAcceptQuest( Player, 425010 ) == true or CheckAcceptQuest( Player, 424847 ) == true then
		return true
	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- �S�������� 
		return false
	end
end

-- 230164  ��������   ���~�ϥήĪG
function lua_mika_z22_Q424836_use()
	local player = OwnerID()
	local keyitem = 545804 -- �ݨ������\���I	

	if CheckFlag(player, keyitem) == true then  -- ��keyitem
		CastSpell(player, player, 495735 )
		ScriptMessage( Player, Player, 1, "[SC_Z22_Q424836_02]" , C_SYSTEM ) -- close
		Setflag(player, keyitem, 0 )
	else
		CastSpell(player, player, 495735 )
		ScriptMessage( Player, Player, 1, "[SC_Z22_Q424836_01]" , C_SYSTEM ) -- Open
		Setflag(player, keyitem, 1 )
	end

end


-- Z22 ���Ȫ��~ -��K�a�p����  240886   �ϥ��ˬd
function lua_mika_z22_240886_check()
	local Player = OwnerID()
	local npcid = 119935  --�����\��O��
	local range = 30
	local count = Lua_Hao_NPC_Range_Search( Player , npcid , range )  -- range �� �����\��O��  ����ƶq

	if CheckAcceptQuest( Player, 424836 ) == true or CheckAcceptQuest( Player, 425010 ) == true or CheckAcceptQuest( Player, 424847 ) == true then

		if count > 0 then -- �p�G������npc
			return true
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424836_03]" , 0 )  -- �A���b[119935]������C
			ScriptMessage( Player , Player , 0 , "[SC_Z22_Q424836_03]" , 0 )
			return false
		end
	else
		ScriptMessage( Player,  Player, 1, "[SC_424626_2]" , 0 )  -- �S��������
		ScriptMessage( Player,  Player, 0, "[SC_424626_2]" , 0 )  
		return false
	end
end
		

-- Z22 ���Ȫ��~ -��K�a�p����  240886   �ϥήĪG
function lua_mika_z22_240886_use()
	local Player = OwnerID()
	local npcid = 119935  --�����\��O��
	local range = 30
	local killid = 106441	--�\��a�p����

	local obj = Lua_Hao_NPC_Closest_Search( Player , npcid  , range ) -- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���

	DW_QietKillOne(Player, killid  )  -- �t�t�����@��NPC (���ȱ���)
	BeginPlot(obj, "lua_mika_z22_240886_objhidden", 0 )   --  �\��O�� = OBJ  ���� HIDE
	BeginPlot(Player, "lua_mika_z22_240886_bombborn" , 0 )   -- ���a ���� ���ͳ�������

end

-- �\��O�� ���� 15sec�� �X�{
function lua_mika_z22_240886_objhidden()
	local obj = OwnerID()  
	Sleep(15)
	Hide(obj)
	sleep(200)  -- 15S
	Show( obj , 0  ) 
end

-- ���a ���� ���ͳ�������
function lua_mika_z22_240886_bombborn()

	local NPC = OwnerID()   --�\��O��

	local RoomID = ReadRoleValue( NPC , EM_RoleValue_RoomID )
	local Obj = Role:new( NPC  )  -- ���o���O X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPCID =  119936	-- ��K�a�p����

	Sleep(10)	

	local NPC2 = CreateObj( NPCID, BaseX, BaseY,  BaseZ, BaseDir, 1 ) --�bNPC�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  
	SetModeEx( NPC2, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC2, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC2, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC2, EM_SetModeType_Move, false )--����
	SetModeEx( NPC2, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC2, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC2, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC2, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC2, EM_SetModeType_ShowRoleHead, false )--�Y����

	SetModeEx( NPC2, EM_SetModeType_Show, true )--���
	SetModeEx( NPC2, EM_SetModeType_HideName, true )--�W��
	AddToPartition( NPC2 , RoomID) -- �إߪ���

	Sleep(50)
	DelObj(NPC2)

end

---------------------------------------------

----���b 119681  �w�q�ˡD���� ���󲣥ͼ@��
function lua_mika_z22_itemshop_set() 
	local shopid = 600374
	SetShop(OwnerID() , shopid , "Test_Shop_Close" ); 
end