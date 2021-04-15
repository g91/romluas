-- �ٸ����i�t��npc - �����ȸ��

-- ����
--1. �S���ӽu��ѧ�����key
--2. �S���ӵ��Ź���������key
--3. ���W�S������������

-- ���u --------------------------------------------------------------------------------------
function lua_mika_titlequest_keycheck1()
--	Say(OwnerID(), "OwnerID")
--	Say(TargetID(), "TargetID")

	local Player = OwnerID()
	local joblv = ReadRoleValue(Player, EM_RoleValue_LV ) -- �D¾����

	local todaykey = 545680 --��Ѥw�����������(�D��)
	local todaycheck = CheckFlag(Player, todaykey )  -- �ˬd���key�O�_��	 

	-- all keyitem list ----------------------------------------------
	local AllKeyitemList = {
				545691, 545692, 545693, 545694, 545695, 
				545696, 545697, 545698, 545699, 545700, 
				545701, 545702, 545703, 545704, 545705, 
				545706, 547738, 547739, 547740, 547741, 
				547742, 547743, 547744, 547745 
				}

	-- ���Ŭ۲Ū� keyitem list ----------------------------------------------
	local KeyitemList = {}
	if joblv >= 20 and joblv <= 30 then
		KeyitemList = { 545691 }
	elseif joblv >= 31 and joblv <= 35 then
		KeyitemList = { 545692 }
	elseif joblv >= 36 and joblv <= 45 then
		KeyitemList = { 545693 }
	elseif joblv >= 46 and joblv <= 50 then
		KeyitemList = { 545694, 545695 }
	elseif joblv >= 51 and joblv <= 55 then
		KeyitemList = { 545696, 545697, 545698 }
	elseif joblv >= 56 and joblv <= 60 then
		KeyitemList =
				{ 
				545699, 545700, 545701, 545702, 545703, 
				545704, 545705, 545706 
				}
	elseif joblv >= 61 and joblv <= 65 then
		KeyitemList = { 547738, 547739 }
	elseif joblv >= 66 and joblv <= 70 then
		KeyitemList = { 547740, 547741 }
	elseif joblv >= 71 and joblv <= 75 then
		KeyitemList = { 547742, 547743 }
	elseif joblv >= 76 then 
		KeyitemList = { 547744, 547745 }
	end

	-- NPC list ----------------------------------------------
	local QuestNpcList = {}
	if joblv >= 20 and joblv <= 30 then
		QuestNpcList = { 119554  }
	elseif joblv >= 31 and joblv <= 35 then
		QuestNpcList = { 119562 }
	elseif joblv >= 36 and joblv <= 45 then
		QuestNpcList = {119556 }
	elseif joblv >= 46 and joblv <= 50 then
		QuestNpcList = { 119557, 119561 }
	elseif joblv >= 51 and joblv <= 55 then
		QuestNpcList = { 119562, 119558, 119555 }
	elseif joblv >= 56 and joblv <= 60 then
		QuestNpcList =
				 {  
				119559, 119556, 119553, 119554, 119560, 
				119560, 119560, 119563
				}
	elseif joblv >= 61 and joblv <= 65 then
		QuestNpcList =  {119575 , 119576 }
	elseif joblv >= 66 and joblv <= 70 then
		QuestNpcList = { 119579 , 119580 }
	elseif joblv >= 71 and joblv <= 75 then
		QuestNpcList = { 119591 , 119592 }
	elseif joblv >= 76 then
		QuestNpcList = { 122119 , 122120 }
	end
	
	-- quest list ----------------------------------------------
	local questlist = { 
			424671, 424672, 424673, 424674, 424675, 
	  		424676, 424677, 424678, 424679, 424680, 
	  		424681, 424682, 424683, 424684, 424685, 
	  		424686, 424687, 424688, 424689, 424690, 
			424703, 424704, 424705, 424706
			 }

	---------------------- �ܼƫŧi���� -----------------------
	CloseSpeak(Player)

	if todaycheck == true then  -- �����key (���Ѥw�ѹL)
		ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_21]" , 0 )
		ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_21]" , 0 )
	else  -- �S��

		-- �ˬdkeyitem
		for i = 1 , table.getn(KeyitemList) do
		--	Say( Player, "number ="..i..", key = "..KeyitemList[i] )
			if CheckFlag( Player, KeyitemList[i] ) == true then -- �ˬd�O�_�����Ŭ۹��������n���~
				ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[i].."]".."]" , 0 )  --�A�w�g��o���Ȫ����F�A�֦V[$VAR1]�������ȧa�I
				ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[i].."]".."]" , 0 )
				break  --���X�j��
			end

			-- keyitem �������ˬd��
			if i == table.getn(KeyitemList) then
 			--	say(Player, " 2. Key check ok" )

				-- �ˬdquest
				for i = 1 , table.getn(questlist) do
					if CheckAcceptQuest( Player, questlist[i] ) == true then -- �ˬd�O�_��������
					--	say( Player, "3. HAVE Quest" )
						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_23]" , 0 )  -- �A�ثe�w�����ȡA�L�k����������I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_23]" , 0 )
						break  --���X
					end

					-- quest �������ˬd��
					if i == table.getn(questlist) then
					--	say( Player, "4. quest check ok" )

						-- �W�z�ˬd���L , ��key ---------------------------

						-- ���R���Ҧ����W����������key ( �L�C�����Ȫ�key )
						for i = 1 , table.getn(AllKeyitemList) do
						--	Say(OwnerID(), "number ="..i..", key = "..AllKeyitemList[i] )
							SetFlag(Player, AllKeyitemList[i], 0 )
						end

						-- say( Player, "5. del all keyitem ok" )

						-- �H�������@�өM��D¾�ŦX��key
						local number = rand(table.getn(KeyitemList))+1
						local key = KeyitemList[number]
						local questnpc = QuestNpcList[number]
					--	Say( Player, "number = "..number..", key = "..key )
						Setflag(Player, key, 1)

						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )  --�A�{�b�i�H�V[$VAR1]�������ȤF�I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )

					end
				end
			end
		end
	end
end

-- �Žu --------------------------------------------------------------------------------------
function lua_mika_titlequest_keycheck2()
	local Player = OwnerID()
	local joblv = ReadRoleValue(Player, EM_RoleValue_LV ) -- �D¾����

	local todaykey = 545681 --��Ѥw�����Ŧ����(����)
	local todaycheck = CheckFlag(Player, todaykey )  -- �ˬd���key�O�_��

	-- all keyitem list ----------------------------------------------
	local AllKeyitemList = {
				545690, 545710, 545711, 545712, 545713, 
				545714, 545715, 545716, 545717, 545718,
				547728, 547729 
				}

	-- ���Ŭ۲Ū� keyitem list ----------------------------------------------
	local KeyitemList = {}
	if joblv >= 20 and joblv <= 29 then
		KeyitemList = { 545690, 545710 }
	elseif joblv >= 30 and joblv <= 39 then
		KeyitemList = { 545711, 545712 }
	elseif joblv >= 40 and joblv <= 49 then
		KeyitemList = { 545713, 545714 }
	elseif joblv >= 50 and joblv <= 59 then
		KeyitemList = { 545715, 545716 }
	elseif joblv >= 60 and joblv <= 69 then
		KeyitemList = { 545717, 545718 }
	elseif joblv >= 70 then
		KeyitemList = { 547728, 547729 }
	end

	-- NPC list ----------------------------------------------
	local QuestNpcList = { 119573 }
	
	-- quest list ----------------------------------------------
	local questlist = { 
			424691, 424692, 424693, 424694, 424695, 
			424696, 424697, 424698, 424699, 424700,
			424701, 424702
			 }

	---------------------- �ܼƫŧi���� -----------------------
	CloseSpeak(Player)

	if todaycheck == true then  -- �����key (���Ѥw�ѹL)
		ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_21]" , 0 )
		ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_21]" , 0 )
	else  -- �S��

		-- �ˬdkeyitem
		for i = 1 , table.getn(KeyitemList) do
		--	Say( Player, "number ="..i..", key = "..KeyitemList[i] )
			if CheckFlag( Player, KeyitemList[i] ) == true then -- �ˬd�O�_�����Ŭ۹��������n���~
				ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[1].."]".."]" , 0 )  --�A�w�g��o���Ȫ����F�A�֦V[$VAR1]�������ȧa�I
				ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[1].."]".."]" , 0 )
				break  --���X�j��
			end

			-- keyitem �������ˬd��
			if i == table.getn(KeyitemList) then
 			--	say(Player, " 2. Key check ok" )

				-- �ˬdquest
				for i = 1 , table.getn(questlist) do
					if CheckAcceptQuest( Player, questlist[i] ) == true then -- �ˬd�O�_��������
					--	say( Player, "3. HAVE Quest" )
						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_23]" , 0 )  -- �A�ثe�w�����ȡA�L�k����������I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_23]" , 0 )
						break  --���X
					end

					-- quest �������ˬd��
					if i == table.getn(questlist) then
					--	say( Player, "4. quest check ok" )

						-- �W�z�ˬd���L , ��key ---------------------------

						-- ���R���Ҧ����W����������key ( �L�C�����Ȫ�key )
						for i = 1 , table.getn(AllKeyitemList) do
						--	Say(OwnerID(), "number ="..i..", key = "..AllKeyitemList[i] )
							SetFlag(Player, AllKeyitemList[i], 0 )
						end

						-- say( Player, "5. del all keyitem ok" )

						-- �H�������@�өM��D¾�ŦX��key
						local number = rand(table.getn(KeyitemList))+1
						local key = KeyitemList[number]
						local questnpc = QuestNpcList[1]
				--		Say( Player, "number = "..number..", key = "..key )
						Setflag(Player, key, 1)

						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )  --�A�{�b�i�H�V[$VAR1]�������ȤF�I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )

					end
				end
			end
		end
	end
end


----���u----------------------------------------------------------------------------------------------

function lua_mika_titlequest_keycheck3()
	local Player = OwnerID()

	local todaykey = 545682 --��Ѥw�����������(����)
	local todaycheck = CheckFlag(Player, todaykey )  -- �ˬd���key�O�_��

	-- all keyitem list ----------------------------------------------
	local AllKeyitemList = {
				545659, 545660, 545661, 545662, 545663, 
				545664, 545665, 545666, 545667, 545668, 
				545669, 545670
				}

	-- NPC list ----------------------------------------------
	local QuestNpcList = { 119577 }

	-- quest list ----------------------------------------------
	local questlist = { 
			424711, 424712, 424713, 424714, 424715, 
			424716, 424717, 424718, 424719, 424720, 
			424721, 424722
			 }

	---------------------- �ܼƫŧi���� -----------------------
	CloseSpeak(Player)

	if todaycheck == true then  -- �����key (���Ѥw�ѹL)
		ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_21]" , 0 )
		ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_21]" , 0 )
	else  -- �S��

		-- �ˬdkeyitem
		for i = 1 , table.getn(AllKeyitemList) do
		--	Say( Player, "number ="..i..", key = "..AllKeyitemList[i] )
			if CheckFlag( Player, AllKeyitemList[i] ) == true then -- �ˬd�O�_�����Ŭ۹��������n���~
				ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[1].."]".."]" , 0 )  --�A�w�g��o���Ȫ����F�A�֦V[$VAR1]�������ȧa�I
				ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpcList[1].."]".."]" , 0 )
				break  --���X�j��
			end

			-- keyitem �������ˬd��
			if i == table.getn(AllKeyitemList) then
 			--	say(Player, " 2. Key check ok" )

				-- �ˬdquest
				for i = 1 , table.getn(questlist) do
					if CheckAcceptQuest( Player, questlist[i] ) == true then -- �ˬd�O�_��������
					--	say( Player, "3. HAVE Quest" )
						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_23]" , 0 )  -- �A�ثe�w�����ȡA�L�k����������I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_23]" , 0 )
						break  --���X
					end

					-- quest �������ˬd��
					if i == table.getn(questlist) then
					--	say( Player, "4. quest check ok" )

						-- �W�z�ˬd���L , ��key ---------------------------

						-- �H�������@�өM��D¾�ŦX��key
						local number = rand(table.getn(AllKeyitemList))+1
						local key = AllKeyitemList[number]
						local questnpc = QuestNpcList[1]
					--	Say( Player, "number = "..number..", key = "..key )
						Setflag(Player, key, 1)

						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )  --�A�{�b�i�H�V[$VAR1]�������ȤF�I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..questnpc.."]".."]" , C_SYSTEM )

					end
				end
			end
		end
	end
end


----��u----------------------------------------------------------------------------------------------

function lua_mika_titlequest_keycheck4()
	local Player = OwnerID()

	local todaykey = 545683 --��Ѥw����������(�t��)
	local todaycheck = CheckFlag(Player, todaykey )  -- �ˬd���key�O�_��

	local SkillLv_1 = ReadRoleValue(Player, EM_RoleValue_Skill_Mining )  -- ���q
	local SkillLv_2 = ReadRoleValue(Player, EM_RoleValue_Skill_Lumbering ) --���
	local SkillLv_3 = ReadRoleValue(Player, EM_RoleValue_Skill_Herblism )   --  ����

--	Say(Player, "minging lv ="..SkillLv_1..", lumbering lv = "..SkillLv_2..", herblism lv ="..SkillLv_3 )

	--  ������ NPC  ----------------------------------------------
	local questnpc = 0
	local QuestTypeKey = { 545647, 545648, 545649, 545650 }
	local QuestNpcList = { 119581, 119582, 119583, 119584 }

	for i = 1, table.getn(QuestNpcList) do
		if CheckFlag(Player, QuestTypeKey[i] ) == true then
			QuestNpc = QuestNpcList[i] 
			break
		end
	end

--	Say(Player, "QuestNpc = "..QuestNpc )

	-- quest list ----------------------------------------------
	local questlist = { 
			424731, 424732, 424748, 424749, 424750, 424751, 
			424733, 424734, 424735, 424736, 424737, 
			424738, 424739, 424740, 424741, 424742, 
			424743, 424744, 424745, 424746, 424747
			 }

	---------------------- �ܼƫŧi���� -----------------------
	CloseSpeak(Player)

	if todaycheck == true then  -- �����key (���Ѥw�ѹL)
		ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_21]" , 0 )
		ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_21]" , 0 )
	else  -- �S��

		-- �ˬdkeyitem
		for i = 1 , table.getn(QuestTypeKey) do
		--	Say( Player, "number ="..i..", key = "..AllKeyitemList[i] )
			if CheckFlag( Player, QuestTypeKey[i] ) == true then -- �ˬd�O�_�����Ŭ۹��������n���~
				ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpc.."]".."]" , 0 )  --�A�w�g��o���Ȫ����F�A�֦V[$VAR1]�������ȧa�I
				ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_22][$SETVAR1=".."["..QuestNpc.."]".."]" , 0 )
				break  --���X�j��
			end

			-- keyitem �������ˬd��
			if i == table.getn(QuestTypeKey) then
 			--	say(Player, " 2. Key check ok" )

				-- �ˬdquest
				for i = 1 , table.getn(questlist) do
					if CheckAcceptQuest( Player, questlist[i] ) == true then -- �ˬd�O�_��������
					--	say( Player, "3. HAVE Quest" )
						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_23]" , 0 )  -- �A�ثe�w�����ȡA�L�k����������I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_23]" , 0 )
						break  --���X
					end

					-- quest �������ˬd��
					if i == table.getn(questlist) then
					--	say( Player, "4. quest check ok" )

						-- �W�z�ˬd���L , ��key ---------------------------

						--  �s�D�غ���rand  ----------------------------------------------
						local Keyitem = 0
						local lvtype = { 63, 44, 26, 14, 0 }

						local NewQuestType = Rand(4)+1 -- 1 ~ 4

						local KeyitemList_1 =  { 545626, 545627, 545643, 545644, 545645, 545646 }
						local KeyitemList_2 = { 545632, 545631, 545630, 545629, 545628 }
						local KeyitemList_3 = { 545637, 545636, 545635, 545634, 545633 }
						local KeyitemList_4 = { 545642, 545641, 545640, 545639, 545638 }

						if NewQuestType == 1 then
							Keyitem = KeyitemList_1[Rand(6)+1]
							SetFlag(Player, QuestTypeKey[1], 1 )
						elseif NewQuestType == 2 then
							for i = 1, table.getn(lvtype) do
								if SkillLv_1 >= lvtype[i] then
									Keyitem = KeyitemList_2[i]
									break
								end
							end
							SetFlag(Player, QuestTypeKey[2], 1 )
						elseif NewQuestType == 3 then
							for i = 1, table.getn(lvtype) do
								if SkillLv_2 >= lvtype[i] then
									Keyitem = KeyitemList_3[i]
									break
								end
							end
							SetFlag(Player, QuestTypeKey[3], 1 )
						elseif NewQuestType == 4 then
							for i = 1, table.getn(lvtype) do
								if SkillLv_3 >= lvtype[i] then
									Keyitem = KeyitemList_4[i]
									break
								end
							end
							SetFlag(Player, QuestTypeKey[4], 1 )
						end

						-- new NPC  ----------------------------------------------
						local NewQuestNpc = 0

						for i = 1, table.getn(QuestNpcList) do
							if i == NewQuestType then
								NewQuestNpc = QuestNpcList[i] 
								break
							end
						end
					--	Say(Player, "Quest type ="..NewQuestType..", Keyitem ="..keyitem )
					--	Say(Player, "QuestNpc = "..NewQuestNpc )

						Setflag(Player, keyitem, 1)
						ScriptMessage(Player, Player , 1 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..NewQuestNpc.."]".."]" , C_SYSTEM )  --�A�{�b�i�H�V[$VAR1]�������ȤF�I
						ScriptMessage(Player, Player , 0 , "[SC_TITLEQUEST_24][$SETVAR1=".."["..NewQuestNpc.."]".."]" , C_SYSTEM )

					end
				end

			end
		end
	end
end



-- TEST�� ---------�R���Ҧ����W����������key  ---------------------------------------------------------
function lua_mika_titlequest_delallkey()

	local Player = OwnerID()
	local AllKeyitemList = {
				-- ����
				545691, 545692, 545693, 545694, 545695, 
				545696, 545697, 545698, 545699, 545700, 
				545701, 545702, 545703, 545704, 545705, 
				545706, 547738, 547739, 547740, 547741, 
				547742, 547743, 547744, 547745, 
				-- �Ŧ�
				545690, 545710, 545711, 545712, 545713, 
				545714, 545715, 545716, 545717, 545718, 
				547728, 547729,
				-- ����
				545659, 545660, 545661, 545662, 545663, 
				545664, 545665, 545666, 545667, 545668, 
				545669, 545670, 
				--���
				545626, 545627, 545643, 545644, 545645, 545646, 
				545628, 545629, 545630, 545631, 545632,
				545633, 545634, 545635, 545636, 545637,
				545638, 545639, 545640, 545641, 545642,
				-- ��ѱ��L������
				545647, 545648, 545649, 545650,
				-- ��ѧ���������
				545680, 545681, 545682, 545683
				}


	for i = 1 , table.getn(AllKeyitemList) do
	--	Say(OwnerID(), "number ="..i..", key = "..AllKeyitemList[i] )
		SetFlag(Player, AllKeyitemList[i], 0 )
	end

	say( Player, "del all keyitem ok" )

end