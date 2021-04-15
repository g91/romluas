-- Z31 �s�رڤ�u���ȼ@�� (�̨�)

--------- Q1  --------- 

-- �I�����Ȫ���  �u�����q�Ķ��I- 120428
function lua_mika_Q425018_touch()
	local obj = OwnerID()
	Setplot(obj,  "touch" , "lua_mika_Q425018_touch2" , 50 )
end

--Ū���I�k���e�ˬd
function lua_mika_Q425018_touch2()

	local Player = OwnerID()
	local NPC = TargetID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)
	local questid = 425018 
	local itemid = 241057  -- �õ}���u�����q��

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, questid ) == true  then

		if CountBodyItem( Player, itemid ) <5 then
			if Mount == true then --���b��y
				if BeginCastBarEvent( Player , NPC , "[SC_TITLEQUEST_05]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425018_touch3") ~= 1 then 
				--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)
					ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
				end
			else --�b��y
				ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
			end
		else
			ScriptMessage( Player , Player , 1 , "[SC_420952_0]" , 0 ) --�A�w�g�����쨬�������~�F
		end

	else
		ScriptMessage( Player , Player , 1 , "[SC_Z31_Q425018_01]" , 0 ) --�{�b�٤��ݭn�Ĩ����q�ۡC
	end

end

function lua_mika_Q425018_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- �q
	local itemid = 241057  -- �õ}���u�����q��
	local itemid2 = 241058  -- ���q���u�����q��

	DW_CancelTypeBuff( 68 , Player) --�M�����M�ɡA�I���U��
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			if EmptyPacketCount( Player ) >= 1  and QueuePacketCount( Player ) == 0 then --�ˬd�I�]��� 
				local R= rand(100)+1 
				if  R > 15 then -- 85 % ���v������ȻݨD
					GiveBodyItem(Player, itemid , 1 )
				else
					GiveBodyItem(Player, itemid2 , 1 )	
				end
				BeginPlot(NPC, "lua_mika_Q425018_hidden", 10 )  
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

function lua_mika_Q425018_hidden()
	local npc = OwnerID()
	local sleeptime = 150    --30

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end
 
---------- Q3 -----------
--��I���D 425028


--  ���b�t����w 106564 �� 106566 �t����γo�Ⱖ�Ǫ������`�@���W

function lua_mika_Q425028_dead1()
	local OID = OwnerID()  -- monster
	local TID = TargetID()  -- player

	local Room = ReadRoleValue(OID, EM_RoleValue_RoomID )
	local questid = 425028
	local itemid = 241060
	local itemcount = CountBodyItem(TID,  itemid )
--	say(OID, "OID" )
--	say(TID, "TID" )

	-- �t����w �ηt�����  ����pid�k�s
	WriteRoleValue(OID, EM_RoleValue_PID , 0 )  -- �g�J�Ǫ�PID

	if CheckCompleteQuest(TID, questid)==false and CheckAcceptQuest(TID, questid ) == false and itemcount == 0 then  
		ScriptMessage( TID, TID , 1 , "[SC_Z31_Q425028_01]" , C_SYSTEM ) --  ���񱼸��F�@�Ӥp�U�l�A���p�߰_�ӨӬݬݡH

		local npcid = 120662  -- �}�ª��U�l
		local NPC = Lua_CreateObjByDir( OID , npcid , 15 , 0);
		SetModeEx(NPC, EM_SetModeType_Move, false )--����
		SetModeEx(NPC, EM_SetModeType_Show, true )--���
		SetModeEx(NPC, EM_SetModeType_Mark, true )--�аO
		SetModeEx(NPC, EM_SetModeType_Strikback, false )--����
		SetModeEx(NPC, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(NPC, EM_SetModeType_Obstruct, false )--����
		SetModeEx(NPC, EM_SetModeType_Searchenemy, false )--����
		SetModeEx(NPC, EM_SetModeType_HideName, false )--�W��
		SetModeEx(NPC, EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx(NPC, EM_SetModeType_Fight , false  )--�i�������
		SetModeEx(NPC, EM_SetModeType_Drag , false )--���O

		AddToPartition( NPC , Room ) -- �إߪ���
		Setplot(NPC, "touch", "lua_mika_Q425028_objtouch" , 50 )
		BeginPlot(NPC, "lua_mika_Q425028_delete", 0 )    --  �L�H�I��30S�����
	end
end


function lua_mika_Q425028_objtouch()
	local OID = OwnerID()  -- player
	local TID = TargetID()  -- npc

	GiveBodyItem(OID, 241060 , 1 )
	Delobj(TID)
end

function lua_mika_Q425028_delete()
	local OID = OwnerID()  -- obj

--	say(OID, "hi" )
	Sleep(300)
	Delobj(OID)
--	say(OID, "delete" )
end


-- �I�磌�~Ĳ�o�۸O���� 241060 ��u�K�s����
function lua_mika_Q425028_item()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	local needlv = 6  -- ���ȻݨD���� 
		
	ClearBorder( OwnerID());  --��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 425028 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= needlv then
		ShowBorder( OwnerID(),425028, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end




-----------  Q4 -------------- 
-- 425029 �O�Ф����e��

-- ����npc��l��ܼ@��
function lua_mika_Q425029_01()
	local npc = TargetID()
	local player = OwnerID()	

	local npclist = { 120437 , 120438 , 120439 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z31_Q425029_02]" , "[SC_Z31_Q425029_04]" , "[SC_Z31_Q425029_06]"}
	local keyitem = {546223 , 546224, 546225 }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			if CheckAcceptQuest( Player, 425029 ) == true then -- ����������
				if Checkflag(Player,keyitem[i] ) == false then
					AddSpeakOption( player, player, "[SC_Z31_Q425029_01]", "lua_mika_Q425029_02", 0 )-- �A�n�A�ڦ���ƷQ�а�......�C
					break
				end
			end
		end
	end
end

function lua_mika_Q425029_02()
	local npc = TargetID()
	local player = OwnerID()
	local npclist = { 120437 , 120438 , 120439 }
	local Orgid = ReadRoleValue(npc , EM_RoleValue_OrgID )
	local string = { "[SC_Z31_Q425029_03]" , "[SC_Z31_Q425029_05]" , "[SC_Z31_Q425029_07]"}
	local keyitem = {546223 , 546224, 546225 }

	for i = 1, table.getn(npclist) do
		if Orgid == npclist[i] then
			SetSpeakDetail(player, string[i] )
			Setflag(player, keyitem[i] , 1 )
			break
		end
	end
end

--------------Q6 --------------

-- ������M  425031
--���~ - �c�T���ֳU - 241061  �ϥ��ˬd
function lua_mika_Q425031_item_check()
	local TID = TargetID()    -- NPC
	local OID = OwnerID()  -- Player

	local OrgID = ReadRoleValue( TID , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue( TID , EM_RoleValue_MaxHP )	--Ū����q
	local NowHP = ReadRoleValue(  TID , EM_RoleValue_HP )
	local HPPercent = NowHP / MaxHP	--��q�ʤ���
	local Count = CountBodyItem(OID, 241062 )  --  ��z�������A�D

	if  CheckAcceptQuest(OID,425031 ) == true then  -- ����������
		if count >= 5 then
			ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425055_06]" , 0 ) --�A�w���o���������~�C
			return false
		else
			if ( CheckID( TID ) == false ) then  --�S����H
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				return false
			else  
				if OrgID == 106558  then   -- ��H���T �����A�D 106558
					if  ReadRoleValue(  TID , EM_RoleValue_IsDead ) == 1 then   -- �p�G�ؼФw������
						ScriptMessage( OID , OID , 1 , "[SC_493625_2]" , 0 )	--�ؼФw���`
						return false

					else
						if  HPPercent > 0.3  then  -- �ؼЦ�q �h��30 %
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425031_01]" , 0 ) -- [106558]�k��F�A�������C
							return false
						else	
							  -- ���\
							return true
						end
					end

				else
					ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 )  --�ϥΥؼп��~�I
					return false
				end

			end
		end

	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- �S��������
		return false
	end

end


--���~ - �c�T���ֳU - 241061  �ϥήĪG
function lua_mika_Q425031_item_use()
	local OID = OwnerID()  -- Player
	local Monster = TargetID()  

	BeginPlot(Monster, "lua_mika_Q425031_objhide", 0 )
	GiveBodyItem( OID, 241062, 1 )  -- ��z�������A�D	241062  
end

function lua_mika_Q425031_objhide()
	local npc = OwnerID()
	local sleeptime = 150    

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )
end

-------------- Q7 --------------
 
-- 425032 �h��������
-- ���~ - ���L�D�� 241063  �ϥ��ˬd
function lua_mika_Q425032_itemcheck()

	local OID = OwnerID()   -- player
	local TID = TargetID()
	local OrgID = ReadRoleValue(  TID , EM_RoleValue_OrgID )
	-- �i�H�ϥΪ�NPC�C�� �s���W���~��
	local TargetNPC = {  
			106583, 119641, 119642, 119645, 119879, 119880, 119881, 119883, 119884, 119904, 
			119905, 120434, 120435, 120437, 120438, 120439, 120237, 120238, 120239, 120240,
			120244, 120245, 120249, 120440, 120442, 120443, 120453 
			}

	local buffid = 622201

	local dis = GetDistance(OID, TID )

	if Checkquest( OID, 425032, 0 )  == true  or Checkquest( OID, 425221, 0 )  == true then  -- ����������  

		if dis <= 50 then
			if ( CheckID( TargetID() ) == false ) then  --�S����H
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				return false
			elseif ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
				ScriptMessage( OID , OID , 1 , "[SC_424142_1]" , 0 ) --�ϥΥؼп��~�I
				return false
			else  
				for i = 1 , table.getn(TargetNPC)  do
					if OrgID == TargetNPC[i] then
						if CheckBuff( TID, buffid ) == false then  -- �Sbuff
							return true
						else  -- ��buff
							ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_02]" , 0 )   -- new �o�e��H�w����[241063]�C
							return false
						end
					end
				end
				-- �еo�e��[ZONE_IFANTRISH_CRYPT_02]���~���̡C new
				ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_01]" , 0 )
				return false
			end
		else
			ScriptMessage( OID , OID , 1 , "[SC_204639_2]" , 0 )  -- �ؼжZ���L��
			return false
		end
	else
		ScriptMessage( OID,  OID, 1, "[SC_424626_2]" , 0 )  -- �S��������
		return false
	end
end

-- ���~ - ���L�D�� 241063  �ϥμ@��
function lua_mika_Q425032_itemuse()
	local OID = OwnerID()  -- Player 
	local TID = TargetID() -- npc
	local npcid = 106684  -- �o�e���L�D��
	local buffid = 622201
	local buffitme = 30

	local R = Rand(100)+1
--	Say(OwnerID(), "R = "..R )

	if R > 55 then   -- 45
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_03]" , C_SYSTEM )  --  �o�Ө��D......�x�A���y�W���}�l�U�_�B�ӤF�H
	elseif R <= 55 and R >= 35 then  -- 20
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_04]" , C_SYSTEM )  -- �ɨ������O�o��}�ߪ��@��ưڡA�A���ڦ^�Q�_�ӤF�C
	elseif R < 35 then
		ScriptMessage( OID , OID , 1 , "[SC_Z31_Q425032_05]" , C_SYSTEM )  -- �٦��S���h���൹�ڡH���U�I
	end
	DW_QietKillOne(OID, npcid  )
	AddBuff(TID, buffid , 0 , buffitme ) 

end

-------------- Q9 -------------- 

-- ��s���� 120429
--- ����Ĳ�I�@��  
function lua_mika_Q425034_touch()
	local obj = OwnerID()	
	Setplot(obj,  "touch" , "lua_mika_Q425034_touch2" , 50 )		
end 


function lua_mika_Q425034_touch2()
	local NPC = TargetID()
	local player = OwnerID()
	local Mount = Lua_Mounts_Copilot( Player ) --�ˬd���a�O�_�b���H���M��y (true=���b��y�Afalse=�b��y)

	DW_CancelTypeBuff( 68 , Player ) --�M�����M�ɡA�I���U��

	if CheckAcceptQuest( Player, 425034 ) == true then
		if Mount == true then --���b��y
			if BeginCastBarEvent( Player , NPC , "[SC_Z31_Q425034_01]" , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 , "lua_mika_Q425034_touch3") ~= 1 then 
			--3��/�_�l�ʧ@/�����ʧ@/0=���ʤ��_/�����ɰ��檺�禡)  
			-- ���s�����ʤ�} new
				ScriptMessage( Player , Player , 1 , "[SAY_NPC_BUSY]" , 0 ) --�ؼЦ��L��
			end
		else --�b��y
			ScriptMessage( Player , Player , 1 , "[SC_CRAFT_2011_08]" , 0 ) --"�M�����M�ɵL�k�i�榹�ʧ@�A�Х��Ѱ��M�����A�C"
		end

	else
		ScriptMessage( Player, Player, 1, "[SC_424626_2]" , 0 ) -- �S�������� 
	end
end

function lua_mika_Q425034_touch3( Player , CheckStatus )
	local NPC = TargetID()  -- ����

	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			local Orgid = ReadRoleValue(NPC , EM_RoleValue_OrgID )
			local npcid = 106685  -- ���s�����ʤ�}

			DW_QietKillOne( Player, npcid ) 
			BeginPlot(NPC, "lua_mika_Q425034_hidden", 0 )  
			EndCastBar( Player , CheckStatus ) --�M���I�k��	
		else --����
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end

function lua_mika_Q425034_hidden()
	local npc = OwnerID()
	local sleeptime = 180

	Hide(npc)
	Sleep(sleeptime)
	Show(npc, 0 )

end
--------------------------------------