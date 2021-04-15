-- 702775 �s�����B�t��_NPC�ǰe

---------- NPC�ǰe���� ----------------------------------------- 

-- npc�����ܼƭ��m (���q���bnpc�M�Ϊ�l�@��)  z2 �B§�ӽЭ�
function lua_mika_weddingtrans_NPC0()
	local NPC = OwnerID()  -- NPC
	-- SC_2012MARRY_TRANSNPC01 �p�H�B�b�|���ӽ�
	SetWorldVar( "SC_2012MARRY_TRANSNPC01" , 000000000) -- �]�w�@���ܼ� 
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
--	Say(NPC, "Reset Room status = "..Room)

end

-- ���ի��O- �g�J�ж�id
function lua_mika_weddingtrans_test01(SN)
	local Player = OwnerID()  -- ���a
	WriteRoleValue(Player, EM_LuaValueFlag_UseItem43, SN )
	Say(Player, "SN = "..SN)

end

-- ���ի��O - ���m���a�ӽЪ��p (���a����)
function lua_mika_weddingtrans_test02(number)
	local Player = OwnerID() 
	-- SC_2012MARRY_TRANSNPC01 �p�H�B�b�|���ӽ�
	SetWorldVar( "SC_2012MARRY_TRANSNPC01" , number ) -- �]�w�@���ܼ� 
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
	Say(Player, "Reset Room status = "..Room)
end

-- ���ի��O
function lua_mika_weddingtrans_test03()
	local Player = OwnerID()  -- ���a
	local SN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43 )
	Say(Player, "SN = "..SN)

end

function lua_mika_weddingtrans_test05()
	local box = OwnerID()


	while true do 
		local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
		say(box, "Room ="..Room)
		sleep(100)
	end
end
-------------------------------------------------------
-- �|���ǰenpc ��l���
function lua_mika_weddingtrans_NPC1()
	local Player = OwnerID()  
	local PartyNum = GetPartyID(player , -1 )
	local Couple1 = GetPartyID( player , 1 )
	local Couple2 = GetPartyID( player , 2 )

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�  - �p�H�B§�|���ӽ�
	local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
	local count = 0
	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- ����1�өж�  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 	-- ����2�өж� 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 	-- ����3�өж� 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- ����4�өж� 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)		-- ����5�өж� 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)		-- ����6�өж� 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- ����7�өж� 305 - 3
	RoomList[8] = math.floor(Room%100/10)			-- ����8�өж� 306 - 3 
	RoomList[9] = math.floor(Room%10/1)			-- ����9�өж� 307 - 3

	if CheckBuff(Player, 623790 ) == True then  -- ���p�H�|������buff
		SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC02]")   -- �A���i�J�|���H
		AddSpeakOption(Player,Player,"[SC_GETTITLE_1]","Lua_Mika_weddingtrans_room6("..ChoosedSN..")", 0)  -- �T�w
	else
		if PartyNum ~= 2 then
			CloseSpeak(player)
			ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC21]" , 0 )	--�e�������T��  �ӽХ��ѡA����������H�p���A�~�i��z���B�ӽ�
			ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC21]" , 0 )	--�T����
		else --   �H��ok
			if Player == Couple1 then
				SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC06]")   -- �B§�|������
				AddSpeakOption( Player, Player, "[SC_2012MARRY_TRANSNPC15]" , "Lua_Mika_weddingtrans_room", 0 )  -- �p�H�B§�|���ӽ�
				AddSpeakOption( Player,  Player,"[SC_MARRY_36]" , "lua_mika_merryzonego" , 0 )  --�e���@��B§�|��
			else
				CloseSpeak(player)
				ScriptMessage( player, player, 2, "[SC_2012MARRY_TRANSNPC22]" , 0 )	--�e�������T��  �Ȧ������i��z�B§�|���ӽ�
				ScriptMessage( player, player, 0, "[SC_2012MARRY_TRANSNPC22]" , 0 )
			end
		end
	end
end

function Lua_Mika_weddingtrans_room()
	local Player = OwnerID()  
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�  - �p�H�B§�|���ӽ�
	local ChoosedSN = ReadRoleValue(Player, EM_LuaValueFlag_UseItem43)
	local count = 0
	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- ����1�өж�  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 		-- ����2�өж� 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 		-- ����3�өж� 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- ����4�өж� 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)			-- ����5�өж� 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)			-- ����6�өж� 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- ����7�өж� 305 - 3
	RoomList[8] = math.floor(Room%100/10)				-- ����8�өж� 306 - 3 
	RoomList[9] = math.floor(Room%10/1)				-- ����9�өж� 307 - 3


		for i = 1 , #RoomList , 1 do
			if RoomList[i] == 0 then
				count = count + 1
			end
			if i == #RoomList then
				if count > 0 then
					SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC13]")   -- �п��..
				else
					SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC10]")   -- �ثe�S���i�ϥΪ��|��
				end
			end
		end

		local string = { 
				"[SC_2012MARRY_TRANSNPC03]" ,
				"[SC_2012MARRY_TRANSNPC04]" ,
				"[SC_2012MARRY_TRANSNPC05]" 
									}  -- �U���a�����W��

		for Style=1,3,1 do  -- �˦�1~ 3 
			for Position=1,3,1 do   -- �ж�1~3
				local SN=(Style-1)*3+Position; -- �Ǹ�1~9
				if RoomList[SN]==0 then -- �Ū��ж��~�C�X�ﶵ
					AddSpeakOption(Player,Player,string[Style].."("..Position..")","Lua_Mika_weddingtrans_room1("..SN..")", 0)  -- �|�����ﶵ
				end
			end
		end

end

-- �ˬd��ܩж����S���H�w��F
function Lua_Mika_weddingtrans_gocheck(SN)  -- SN
	local Player = OwnerID()
	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }

	local RoomList = {}
	RoomList[1] = math.floor(Room%1000000000/100000000) 	-- ����1�өж�  305  - 1
	RoomList[2] = math.floor(Room%100000000/10000000) 		-- ����2�өж� 306 - 1
	RoomList[3] = math.floor(Room%10000000/1000000) 		-- ����3�өж� 307 - 1
	RoomList[4] = math.floor(Room%1000000/100000) 		-- ����4�өж� 305 - 2 
	RoomList[5] = math.floor(Room%100000/10000)			-- ����5�өж� 306 - 2
	RoomList[6] = math.floor(Room%10000/1000)			-- ����6�өж� 307 - 2
	RoomList[7] = math.floor(Room%1000/100)			-- ����7�өж� 305 - 3
	RoomList[8] = math.floor(Room%100/10)				-- ����8�өж� 306 - 3 
	RoomList[9] = math.floor(Room%10/1)				-- ����9�өж� 307 - 3

	if Roomlist[SN] == 0 then -- ok
		return true 
	else
		return false
	end

end

-- ���X�ж�����
function Lua_Mika_weddingtrans_room1(roomid)
	local player = OwnerID()
	local NPC = TargetID()
	local NPCOrgID = ReadRoleValue(NPC, EM_RoleValue_OrgID ) -- NPC ID
	local NPCID = { 115002 ,111274 }  -- 1 �P�ʤ��i���B  2. �P�ʥi���B

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- ��x����	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  �|��1 ����
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  �|��2 ����
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  �|��3 ����
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  �|��1 ���O���B����
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  �|��1 ���O���B����
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  �|��3 ���O���B����
	-- ���ժ���
--	local coin1 = 10
--	local coin2 = 20
--	local coin3 = 30

--	Say(NPC, "orgid = "..NPCOrgID )

	if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- ��ܪ��ж��O�Ū�
		if roomid <= 3 then  -- �|��1 
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC07][$SETVAR1=".."["..type1.."]".."][$SETVAR2="..coin1.."]")
		elseif roomid >= 4 and  roomid <= 6 then  -- �|��2
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC08][$SETVAR1=".."["..type2.."]".."][$SETVAR2="..coin2.."]")
		elseif roomid >= 7 and  roomid <= 9 then  -- �|��3
			SetSpeakDetail(Player, "[SC_2012MARRY_TRANSNPC09][$SETVAR1=".."["..type3.."]".."][$SETVAR2="..coin3.."]")
		end

		if NPCOrgID == NPCID[1] then
		--	say(NPC, "NPC1")
			AddSpeakOption( Player, NPC, "[SC_0908SEANSON_65]" , "Lua_Mika_weddingtrans_room2_1("..roomid..")", 0 )  -- �T�w  -- �B§���a�ӽ�  (�P�ʤ��i���B)
		elseif NPCOrgID == NPCID[2] then
		--	say(NPC, "NPC2")
			AddSpeakOption( Player, NPC, "[SC_0908SEANSON_65]" , "Lua_Mika_weddingtrans_room2_2("..roomid..")", 0 )  -- �T�w  -- �B§���a�ӽ�  (�P�ʥi���B)
		end
	else
		CloseSpeak(Player)
		ScriptMessage( Player , Player , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );  --�ӽХ��ѡA�z��ܪ��|���ثe�w�Q���ɤ�
	end
end

-- �B§���a�ӽ�  (�P�ʤ��i���B)
function Lua_Mika_weddingtrans_room2_1(roomid)
	local player = OwnerID()

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- ��x����	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  �|��1 ����
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  �|��2 ����
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  �|��3 ����
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  �|��1 ���O���B����
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  �|��1 ���O���B����
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  �|��3 ���O���B����

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local typelist = {type1, type1, type1, type2, type2, type2, type3, type3, type3 }
	local mycoin = CountBodyItem(Player, itemid )  -- �����ťN�������q
-- 	

	CloseSpeak(player)
	if Marry_Apply_Check_1(player) == true then  -- �q�L���B�|���ӽи���ˬd (�P�ʤ��i���B)
		local Couple1 = GetPartyID( player , 1 )
		local Couple2 = GetPartyID( player , 2 )

		if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- ��ܪ��ж��O�Ū�	
		--	say(Couple1, "coin type ="..typelist[roomid] )
			if typelist[roomid] ~= 203038 then -- ���O�����ťN��
				if (AddMoneyEx_Account( Couple1 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) and ( AddMoneyEx_Account( Couple2 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) then 
				--	Say(Couple1, "Roomid = "..roomid)
					Room = Room + number[roomid]
					SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- �]�w�@���ܼ� 
				--	Say(Couple2, "Room status = "..room)

					WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
					WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
				--	DelBodyItem(Couple1, itemid, coinlist[roomid])
				--	DelBodyItem(Couple2, itemid, coinlist[roomid])
					DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
					local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
				--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
					Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
					Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
				else
					ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );   -- �ӽХ��ѡA����Ψ䤤���@���������p�ƶq����
					ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );
					ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );	
					ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );	
				end
			else --  �����ťN��
				if Marry_Money_Check(Couple1, roomid ) == true and Marry_Money_Check(Couple2, roomid ) == true then	
				--	Say(Couple1, "Roomid = "..roomid)
					Room = Room + number[roomid]
					SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- �]�w�@���ܼ� 
				--	Say(Couple2, "Room status = "..room)

					WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
					WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
					DelBodyItem(Couple1, itemid, coinlist[roomid])
					DelBodyItem(Couple2, itemid, coinlist[roomid])
					DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
					local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
				--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
					Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
					Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
				else
					ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );   -- �ӽХ��ѡA����Ψ䤤���@������[203038]�ƶq����
					ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );
					ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );	
					ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );	
				end
			end
		else
			ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );   --�ӽХ��ѡA�z��ܪ��|���ثe�w�Q���ɤ�
			ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );   
			ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );
			ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );
		end

	end
end

-- �B§���a�ӽ�  (�P�ʥi���B)
function Lua_Mika_weddingtrans_room2_2(roomid)
	local player = OwnerID()

	local Room = GetWorldVar( "SC_2012MARRY_TRANSNPC01" )	-- Ū���@���ܼ�
	local number = {
			100000000, 10000000, 1000000, 
			100000, 10000, 1000, 
			100, 10 , 1
			 }
	-- ��x����	
	local coin1 = GetDBKeyValue("WeddingRoomCost_01")	--  �|��1 ����
	local coin2 = GetDBKeyValue("WeddingRoomCost_02")	--  �|��2 ����
	local coin3 = GetDBKeyValue("WeddingRoomCost_03")	--  �|��3 ����
	local type1 = GetDBKeyValue("WeddingRoomCoin_01")               --  �|��1 ���O���B����
	local type2 = GetDBKeyValue("WeddingRoomCoin_02")               --  �|��1 ���O���B����
	local type3 = GetDBKeyValue("WeddingRoomCoin_03")    	--  �|��3 ���O���B����

	local itemid = 203038
	local coinlist = {coin1, coin1, coin1, coin2, coin2, coin2, coin3, coin3, coin3 }
	local typelist = {type1, type1, type1, type2, type2, type2, type3, type3, type3 }
	local mycoin = CountBodyItem(Player, itemid )  -- �����ťN�������q
-- 	

	CloseSpeak(player)
	if Marry_Apply_Check_2(player) == true then  -- �q�L���B�|���ӽи���ˬd (�P�ʥi���B)

		local Couple1 = GetPartyID( player , 1 )
		local Couple2 = GetPartyID( player , 2 )
		if CheckFlag(Couple1, 541320) == false or CheckFlag(Couple2, 541320) == false then  --  �䤤���@�襼��z�B§�ӽ�
			ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC20]", 0 );   -- �ӽХ��ѡA����Ψ䤤���@���������p�ƶq����
			ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC20]", 0 );
			ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC20]", 0 );	
			ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC20]", 0 );	
		else
			if Lua_Mika_weddingtrans_gocheck(roomid) == true then  -- ��ܪ��ж��O�Ū�	
			--	say(Couple1, "coin type ="..typelist[roomid] )
				if typelist[roomid] ~= 203038 then -- ���O�����ťN��
					if (AddMoneyEx_Account( Couple1 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) and ( AddMoneyEx_Account( Couple2 , EM_ActionType_PlotGive , -(coinlist[roomid]) , true ) == true ) then 
					--	Say(Couple1, "Roomid = "..roomid)
						Room = Room + number[roomid]
						SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- �]�w�@���ܼ� 
					--	Say(Couple2, "Room status = "..room)

						WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
						WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
						DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
					--	DelBodyItem(Couple1, itemid, coinlist[roomid])
					--	DelBodyItem(Couple2, itemid, coinlist[roomid])
						local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
						local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
					--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
						Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
						Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
					else
						ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );   -- �ӽХ��ѡA����Ψ䤤���@���������p�ƶq����
						ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );
						ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC19]", 0 );	
						ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC19]", 0 );	
					end
				else --  �����ťN��
					if Marry_Money_Check(Couple1, roomid ) == true and Marry_Money_Check(Couple2, roomid ) == true then	
					--	Say(Couple1, "Roomid = "..roomid)
						Room = Room + number[roomid]
						SetWorldVar( "SC_2012MARRY_TRANSNPC01" , Room) -- �]�w�@���ܼ� 
					--	Say(Couple2, "Room status = "..room)
						WriteRoleValue(Couple1, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
						WriteRoleValue(Couple2, EM_LuaValueFlag_UseItem43, roomid)  -- �g�J�ж�id
						DelBodyItem(Couple1, itemid, coinlist[roomid])
						DelBodyItem(Couple2, itemid, coinlist[roomid])
						DesignLog( Couple1, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						DesignLog( Couple2, 1150001,"Wedding venue apply , Roomid = "..roomid..", costtype = "..typelist[roomid]..", cost count = "..coinlist[roomid]  )
						local SD1 = ReadRoleValue(Couple1, EM_LuaValueFlag_UseItem43)
						local SD2 = ReadRoleValue(Couple2, EM_LuaValueFlag_UseItem43)
					--	say(Couple1, "SD ="..SD1..", SD2 ="..SD2 )
						Callplot(Couple1, "Lua_Mika_weddingtrans_room5", roomid)
						Callplot(Couple2, "Lua_Mika_weddingtrans_room5", roomid)
					else
						ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );   -- �ӽХ��ѡA����Ψ䤤���@������[203038]�ƶq����
						ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );
						ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC16]", 0 );	
						ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC16]", 0 );	
					end
				end
			else
				ScriptMessage( Couple1 , Couple1 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );   --�ӽХ��ѡA�z��ܪ��|���ثe�w�Q���ɤ�
				ScriptMessage( Couple1 , Couple1 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );   
				ScriptMessage( Couple2 , Couple2 , 2, "[SC_2012MARRY_TRANSNPC17]", 0 );
				ScriptMessage( Couple2 , Couple2 , 0, "[SC_2012MARRY_TRANSNPC17]", 0 );
			end
		end
	end
end


-- �ǤJ�|��
function Lua_Mika_weddingtrans_room5(roomid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem �ǤJ�ϰ�ɵ���
	local fulltime = 3600 -- ���T�ɶ�  
	local fulltime = 600 -- �ȩw�ɶ�  

	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}

	CloseSpeak(player)
	Setflag(Player, EnterKey, 0 ) --�M�����ê���d��Ĳ�o�@��Key
	if CheckBuff(Player, 623790) == false then
		AddBuff(Player, 623790, 0, fulltime )  -- ����2�p�� �p�H�B§�|�����ɾ��� BUFF  �ΨӧP�_�|���ܽШ�NPC
	end
--	say(Player, "pos1 ="..pos[roomid][1]..", pos2 ="..pos[roomid][2]..", pos3 ="..pos[roomid][3]..", pos4 ="..pos[roomid][4]..", pos5 ="..pos[roomid][5]  )
	ChangeZone( Player , pos[roomid][1] , 0, pos[roomid][2] , pos[roomid][3], pos[roomid][4], pos[roomid][5] ) 
end

-- �A���i�J�|��

function Lua_Mika_weddingtrans_room6(roomid)
	local Player = OwnerID()
	local EnterKey =  545671-- keyitem �ǤJ�ϰ�ɵ���
	local pos = {
		[1] =  { 305 ,  -3578, 226, 3371, 256 }, 
		[2] =  { 306 ,  -3578, 226, 3371, 256 }, 
		[3] =  { 307 ,  -3578, 226, 3371, 256 }, 
		[4] =  { 305 ,  -3554, 225, -498, 262 }, 
		[5] =  { 306 ,  -3554, 225, -498, 262 }, 
		[6] =  { 307 ,  -3554, 225, -498, 262 }, 
		[7] =  { 305 ,  -3563, 340, -4176, 96 }, 
		[8] =  { 306 ,  -3563, 340, -4176, 96 }, 
		[9] =  { 307 ,  -3563, 340, -4176, 96 }
		}

	CloseSpeak(Player)
	if CheckBuff(Player, 623790) == false then  -- �p�G�S��buff
		ScriptMessage( Player , Player , 2, "[SC_2012MARRY_TRANSNPC18]", 0 );   --[623790]�ĪG�w���
		ScriptMessage( Player , Player , 0, "[SC_2012MARRY_TRANSNPC18]", 0 );   
	else
		Setflag(Player, EnterKey, 0 ) --�M�����ê���d��Ĳ�o�@��Key
	--	say(Player, "pos1 ="..pos[roomid][1]..", pos2 ="..pos[roomid][2]..", pos3 ="..pos[roomid][3]..", pos4 ="..pos[roomid][4]..", pos5 ="..pos[roomid][5]  )
		ChangeZone( Player , pos[roomid][1] , 0, pos[roomid][2] , pos[roomid][3], pos[roomid][4], pos[roomid][5] ) 
	end
end