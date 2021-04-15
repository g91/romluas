-- z22 ��u (�̨�)

---------Q1 �v���˧L ------------------

-- ���b��npc������ 5��npc ��l��ܼ@���W  -119658, 119659, 119660, 119661, 119662  
function lua_mika_z22_Q424824_npc()
	local npc = TargetID()
	local player = OwnerID()
	local questid = { 424827, 425001, 424838 }
	local buffid = 621155
	local npclist = { 119658, 119659, 119660, 119661, 119662 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424827_SPEAK01]" , "[SC_Z22_Q424827_SPEAK02]", "[SC_Z22_Q424827_SPEAK03]", "[SC_Z22_Q424827_SPEAK04]", "[SC_Z22_Q424827_SPEAK05]"  }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			break
		end
	end
	
	for j = 1, table.getn(questid) do
		if CheckBuff(npc, buffid ) == false then  -- npc �Sbuff
			if CheckAcceptQuest( Player, questid[j] ) == true then -- ����������
				AddSpeakOption( player, player, "[SC_Z22_Q424827_SPEAK06]", "lua_mika_z22_Q424824_cure", 0 )--�i��v���]��
				break
			end
		else
			break
		end
	end
		
end

function lua_mika_z22_Q424824_cure()
	local npc = TargetID()
	local player = OwnerID()
	local buffid = 621155	-- �w����v��
	local npcid = 106438	-- �v���t�˪��Ԥh 

	CloseSpeak(player)
--	Say(npc, "npc" )
--	Say(player, "player" )

	DW_QietKillOne(player, npcid  )
	AddBuff( npc, buffid, 0 , 20 ) -- �ĪG 

end

---------Q2 �ְ��[�@------------------

-- ���b�����Ȭ�����2��npc ��l��ܼ@���W -- 119654 , 119655 
function lua_mika_z22_Q424828_01()
	local npc = TargetID()
	local player = OwnerID()	
	local questid = { 424828,  424839, 425002 }
	local npclist = { 119654 , 119655 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424828_01]" , "[SC_Z22_Q424828_02]" }
	-- ���󪫸�������Ʊ���ڴN��F�C	
	-- �p�G�A�����ݭn���F��A�γ\�i�H�Ҽ{�浹�ڭ̥����Űӷ|�C
	local itemid = { 240877 , 240878    }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			break
		end
	end
	
	for j = 1, table.getn(questid) do
		if CheckAcceptQuest( Player, questid[j] ) == true then -- ����������
			AddSpeakOption( player, player, "[SC_Z22_Q424828_03]", "lua_mika_z22_Q424828_02", 0 )-- �ڥN��������a�ӻ���į�
			break
		end
	end
end

function lua_mika_z22_Q424828_02()
	local npc = TargetID()
	local player = OwnerID()
	local npclist = { 119654 , 119655 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z22_Q424828_04]" , "[SC_Z22_Q424828_05]" }  
	--�o�O�A�n���į�A�p�G�٦��䥦�ݨD���H�ɧ�ڡC
	--[ZONE_PANIO_CAMP]�ܡH�o�Ǥw�g�O�ڭ̯ണ�Ѫ��̤j�ƶq�A�����h����a�C
	local itemid = { 240877 , 240878  }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			local count = CountBodyItem(player, itemid[i] )
			local givecount = 5 - count
			if count >= 5 then -- �w�����S�w�ƶq
				CloseSpeak(player)
				ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424828_06]" , 0 ) --�A�w�����������f���C
				break
			else
				SetSpeakDetail(player, string[i] )
				GiveBodyItem( player, itemid[i], givecount )
				break
			end
		end
	end
end


--------- Q3  �֤k�P���K�� --------- 

-- �I�����Ȫ��� ���K�� 119663 ��@��
function lua_mika_Q424829_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q424829_touch2" , 50 )
end

--Ū���I�k���e�ˬd
function lua_mika_Q424829_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local questid = {424829, 425003, 424840 }
	local itemid = 240879

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, 424829 ) == true or CheckAcceptQuest( Player, 425003 ) == true  or CheckAcceptQuest( Player, 424840 ) == true  then

		if CountBodyItem( Player, itemid ) <5 then
			if Mount == true then --���b��y
				if BeginCastBarEvent( Player , NPC , "[SC_Z22_Q424829_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q424829_touch3") ~= 1 then 
				--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424829_03]" , 0 ) --�A�w�Ĩ�������[240879]�C
		end

	else
		ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424829_04]" , 0 )
		 --�A�o�{�@����K�C�⪺��A�p�G�S���ݭn�٬O�O�H�N�Ĩ��a�C
	end

end

function lua_mika_Q424829_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- ��

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]���
				BeginPlot(NPC, "lua_mika_Q424829_show", 10 )  
				BeginPlot(NPC, "lua_mika_Q424829_grass", 10 )  
				EndCastBar( Player , CheckStatus ) --�M���I�k��
			else
				EndCastBar( Player , CheckStatus ) --�M���I�k��
				ScriptMessage( Player , Player , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end

function lua_mika_Q424829_grass()
	local grass = OwnerID()
	local sleeptime = 150

	Hide(grass)
	Sleep(sleeptime)
	Show(grass, 0 )

end

-- �֤k�n�������K��
function lua_mika_Q424829_show()
	local Player = TargetID()

	local RoomID = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local Obj = Role:new( Player  )  -- ���o���a X.Y.Z.Dir��
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local dis = 35

	local newX = BaseX - ( dis * math.cos(math.pi*2*(1/8)) )
	local newZ = BaseZ +  ( dis * math.sin(math.pi*2*(1/8)) )

	local NPC = CreateObj( 119657, newX, BaseY,  newZ, BaseDir, 1 ) --�b���a�y�� X.Y.Z.Dir ���W�ǳƳХߪ���  

	SetModeEx( NPC, EM_SetModeType_Strikback, false )--����
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--����
	SetModeEx( NPC, EM_SetModeType_Move, false )--����
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--����
	SetModeEx( NPC, EM_SetModeType_Mark, false )--�аO
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( NPC, EM_SetModeType_Fight , false )--�i�������
	SetModeEx( NPC, EM_SetModeType_Drag , false )--���O
	SetModeEx( NPC, EM_SetModeType_HideName, true )--�W��
	SetModeEx( NPC, EM_SetModeType_Show, true )--���

	AdjustFaceDir( NPC, Player, 0 )
	AddToPartition( NPC , RoomID) -- �إߪ���
	sleep(15)  

	local R = rand(100)+1
	if R >= 80 then  -- ���T
		Npcsay(NPC, "[SC_Z22_Q424829_01]" )  --��A�A�Ī����O[240879]�S���C
		GiveBodyItem( Player , 240879 , 1 )   -- ���� ���K��
	else -- ���~
		Npcsay(NPC, "[SC_Z22_Q424829_02]" )  --�ݰ_�����M�ܹ��A�i�O�����o���𮧩M[240879]���P�ڡC
	end

	sleep(20)  
	Delobj(NPC)

end

-------- Q5 ���I�s�A���a�I-------------

-- �� ���~-���������A��(240880)�ͦs�ɶ���R���� Ĳ�o�@��
--  ���� 240881 x1 
 
function lua_mika_z22_Q424830_item()
	local player = OwnerID()
	local item = 240881  -- ���h�𮧪���

	GiveBodyItem(player, item , 1 )
	ScriptMessage( Player , Player , 1 , "[SC_Z22_Q424830_01]" , 0 ) --�I�]�̪��A�����G��m�Ӥ[�A���h�F�즳���A��...�C

end	
