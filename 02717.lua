
-- ���ի��O
-- �D���ʮɬq�}�Ҭ���
function sasa_Auction_test01()
	local OID = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 121088 , 200 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register2 , 100 )
	local test = ReadRoleValue( NPC , EM_RoleValue_Register2 )  --���եγ��W�}��
	Say( OID , "test - auction begin ." )
end

-- �����g�J���W�H�� �u��b���W�ɶ��ɨϥ� ��J�Ʀr�ж� 1 ~ 15
function sasa_Auction_test02(P)
	local OID = OwnerID()
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 121088 , 200 , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	WriteRoleValue( NPC , EM_RoleValue_Register , P )
	local PP = ReadRoleValue( NPC , EM_RoleValue_Register )  -- ���ʳ��W�H��
	Say( OID , "PP ="..PP )
end




function sasa_Auction_ctrl()
	local CTRL = OwnerID() -- ����npc
	local ZoneID = ReadRoleValue( CTRL , EM_RoleValue_ZoneID ) --Ū��ZONE
	AddBuff( CTRL , 503217 , 1 , -1 )			--�`�y�лx
	sasa_Auction_shop()

	while 1 do
		sleep(600)	
		local Hour = GetSystime(1)		--���o�{�b�ɶ��G��
		local Min = GetSystime(2)		--���o�{�b�ɶ��G��
		local test = ReadRoleValue( CTRL , EM_RoleValue_Register2 )  --���եγ��W�}��
		local PID = ReadRoleValue(CTRL, EM_RoleValue_PID )
		--Say( CTRL , "It is "..Hour..":"..min )
		if ZoneID < 1000 then --( ���y 1�G2�B���y 2�G1002�B���y 3�G2002�A�YZoneID�j��1000�h�����y 
			if test == 100 then
				WriteRoleValue( CTRL , EM_RoleValue_Register2 , 0 ) --�N���խȧ�^0
				if  PID == 0 then
					WriteRoleValue( CTRL , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
					BeginPlot( CTRL , "sasa_Auction_begin2" , 0 )  --���W�}�l
				end
			elseif (( Hour >= 08 ) and ( Hour <= 23 )) then
				if min == 40 then
					WriteRoleValue( CTRL , EM_RoleValue_PID , 1 ) --��NPC��PID�ȼg��"1"�A���NPC�}����W
					BeginPlot( CTRL , "sasa_Auction_begin" , 0 )  --���W�}�l
				end
			end
		end
	end
end

-- ���W�`�@��10����
function sasa_Auction_begin()
	local CTRL = OwnerID() -- ����npc
	local timer = 0
	local endtime = 600  -- �]�w���ʳ��W�`�@�ɶ� 600
	local step = 0 -- ���q , �P�_�h�֪��a�ѥ[�� �X�h��npc	
	local speaktime = 60   --   ���D�ت����j 120

--	local msg = { "[SC_SASA2012_12]" , "[SC_SASA2012_13]" , "[SC_SASA2012_14]" , "[SC_SASA2012_15]" }

--	local itemlist  = { 224792 , 224793 , 224794 , 224795 }  --  5.0.1
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
--	local number = rand(3)+1 
	local number = rand(4)+1 
	local rewardid = itemlist[number] 
	WriteRoleValue( CTRL , EM_RoleValue_register10 , rewardid )  -- ���������W���~id�g�J npc R10
	local reward  = ReadRoleValue(Ctrl, EM_RoleValue_register10 )
--	say(CTRL, "this time reward is  "..reward )

--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2��
	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2��
	--�U��_�I�̡A�ثe�b�Z��R�����J�f�s���|��O�����A�o�������~���uxxxxx�v�C

	while true do 
		sleep(10)  --1��]�@��
		timer = timer +1 
	--	say(CTRL, "timer ="..timer  )

		if timer%speaktime == 0 then -- 1�����@�� ���D��
		--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2��
			NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2��
		end
		local PP = ReadRoleValue( CTRL , EM_RoleValue_Register )  -- ���ʳ��W�H��
		--	say(CTRL, " now Join people ="..PP )
		if  PP > 0 and PP <= 3  then
			step = 2
		--	say(CTRL, "step ="..step )
		elseif  PP >= 4 and PP <= 6  then
			step =  3
		--	say(CTRL, "step ="..step )
		elseif PP >= 7 and PP <= 9 then
			step = 4		
		--	say(CTRL, "step ="..step )
		elseif PP >= 10 and PP <= 12  then
			step = 4
		--	say(CTRL, "step ="..step )
		elseif  PP >= 13  then
			step = 5
		--	say(CTRL, "step ="..step )
		end


		if timer == endtime then
			WriteRoleValue( CTRL , EM_RoleValue_Register , 0 )   -- reset ���W�H��
	 		WriteRoleValue( CTRL , EM_RoleValue_PID , 0 ) --��NPC��PID =0
			if step >= 2  then -- �ѥ[�H�� > 0
				Callplot( CTRL , "sasa_Auction_eventbegin" , reward, step )  --���ʶ}�l
			else
				NPCSAY( CTRL , "[SC_SASA2012_11]" )
				--�ݨӤj�a�̪���G���ܦ��L�a�K
				local Player2 = SearchRangePlayer( CTRL , 160  ) --�j�M�P�򪱮a  saha���d��
				for i = 0 , table.getn(Player2)-1  do 	--�j�M�d�򤺪��a
					CloseSpeak(Player2[i])
				end
			end
			break
		end
	end
end

--------------  ���եΪ����W -----------------

-- ���W�`�@��1����
function sasa_Auction_begin2()
	local CTRL = OwnerID() -- ����npc
	local timer = 0
	local endtime = 60 -- �]�w���ʳ��W�`�@�ɶ� 600
	local step = 0 -- ���q , �P�_�h�֪��a�ѥ[�� �X�h��npc	
	local speaktime = 20   --   ���D�ت����j 120

--	local msg = { "[SC_SASA2012_12]" , "[SC_SASA2012_13]" , "[SC_SASA2012_14]" , "[SC_SASA2012_15]" }

--	local itemlist  = { 224792 , 224793 , 224794 , 224795 }  --  5.0.1
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
	local number = rand(4)+1 
	local rewardid = itemlist[number] 
	WriteRoleValue( CTRL , EM_RoleValue_register10 , rewardid )  -- ���������W���~id�g�J npc R10
	local reward  = ReadRoleValue(Ctrl, EM_RoleValue_register10 )
--	say(CTRL, "this time reward is  "..reward )

--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2��
	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2��

	--�U��_�I�̡A�ثe�b�Z��R�����J�f�s���|��O�����A�o�������~���uxxxxx�v�C

	SAY( CTRL , "test - join me  !!" )

	while true do 
		sleep(10)  --1��]�@��
		timer = timer +1 
	--	say(CTRL, "timer ="..timer  )

		if timer%speaktime == 0 then -- 1�����@�� ���D��
			--	NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01]".."["..rewardid.."]" )  -- 6.0.2��
			NPCSAY( CTRL , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2��
		end
		local PP = ReadRoleValue( CTRL , EM_RoleValue_Register )  -- ���ʳ��W�H��
		--	say(CTRL, " now Join people ="..PP )
		if  PP > 0 and PP <= 3  then
			step = 2
		--	say(CTRL, "step ="..step )
		elseif  PP >= 4 and PP <= 6  then
			step =  3
		--	say(CTRL, "step ="..step )
		elseif PP >= 7 and PP <= 9 then
			step = 4		
		--	say(CTRL, "step ="..step )
		elseif PP >= 10 and PP <= 12  then
			step = 4
		--	say(CTRL, "step ="..step )
		elseif  PP >= 13  then
			step = 5
		--	say(CTRL, "step ="..step )
		end


		if timer == endtime then
			WriteRoleValue( CTRL , EM_RoleValue_Register , 0 )   -- reset ���W�H��
	 		WriteRoleValue( CTRL , EM_RoleValue_PID , 0 ) --��NPC��PID =0
			if step >= 2  then -- �ѥ[�H�� > 0
				Callplot( CTRL , "sasa_Auction_eventbegin" , reward, step )  --���ʶ}�l
			else
				NPCSAY( CTRL , "[SC_SASA2012_11]" )
				--�ݨӤj�a�̪���G���ܦ��L�a�K
				local Player2 = SearchRangePlayer( CTRL , 160  ) --�j�M�P�򪱮a  saha���d��
				for i = 0 , table.getn(Player2)-1  do 	--�j�M�d�򤺪��a
					CloseSpeak(Player2[i])
				end
			end
			break
		end
	end
end


-- �ͬ��ʬ�������

function sasa_Auction_eventbegin(reward, step)
	local CTRL = OwnerID() -- ����npc
	local flag = 781176
	local range = 140	--���W�����ʥb�|�d��

	-- �ͬ��ʥD��H
	local Leader = CreateObjByFlag( 121089 , flag , 0 , 1 )  -- �Ѥlid 0 
	AddToPartition( Leader , 0 )
	WriteRoleValue( Leader , EM_RoleValue_Register10 , reward )  -- ���ʥD��npc r10 = reward

	-- �ͬ��ʬ���NPC
	Callplot(CTRL, "sasa_Auction_npcshow", step ,Leader)

	if step >= 4 then
		NPCSAY( Leader , "[SC_SASA2012_10]" )	--�S�Q��ӤF�o��h�H�A�Ƥ��y��A�ڭ̶}�l�a�I
	else
		NPCSAY( Leader , "[SC_SASA2012_09]" )	--�u�n���߷Q�������D�`�w��I
	end

	Sleep(30)
	local Player2 = SearchRangePlayer( CTRL , 160  ) --�j�M�P�򪱮a  saha���d��
	for i = 0 , table.getn(Player2)-1  do 	--�j�M�d�򤺪��a
		CloseSpeak(Player2[i])
	end

	--�����aSKILL
	local Player = SearchRangePlayer( Leader , range  ) --�j�M�P�򪱮a
	for i = 0 , table.getn(Player)-1  do 	--�j�M�d�򤺪��a
		if CheckBuff( Player[i] , 623225 ) == true then		-- �����W�ҩ�buff���H
			AddBuff( Player[i] , 623229 , 0 , 200 )		--���ʧޯ�buff
			WriteRoleValue( Player[i] , EM_RoleValue_Register8 , Leader ) 
			CancelBuff( Player[i] , 623225 )		--�R���W�ҩ�buff
			Callplot(Player[i], "sasa_Auction_checkrange" ,Leader )  -- �] �ˬd�Z���@��
		end
	end

	NPCSAY( Leader , "[SC_SASA2012_24]" )
	--�j�٬ݹL�ӡA�ӬO�A�̪`���o���j�n�ɨ�F!
	ScriptMessage( CTRL , 0 , 2 , "[SC_SASA2012_25]" , 1 ) --�O���m�з|�����}�l�I

	-- ���ʥD��H��check ai
	WriteRoleValue(Leader, EM_RoleValue_PID, 1 )  -- ���ʥD��H PID = 1 ���ʶ}�l
	BeginPlot( Leader , "sasa_Leader_Talkshow_AI" , 0 )
end

-- �������a�P���ʥD��̶Z��  �W�X�ॢ���
function sasa_Auction_checkrange(Leader)
	local OID = OwnerID()
	local timer = 0
	local endtime = 180  -- ����3����
	local range = 140+15 -- 140

	while true do 
		sleep(10)
		timer = timer + 1
		local dis = GetDistance(OID, Leader ) 

		if timer >= 177  then 
			break
		else
			if CheckID(Leader) == false then
				DebugMsg( 0 , 0 , "weave event - not find Leader,  break" )
				break
			else
				if dis > range then -- 140
					CancelBuff(OID , 623229 )  -- Del ���ʧޯ�buff   (�R����|Ĳ�oLeave ���@��)
					break
				elseif dis >= (range-10) then  --130
					ScriptMessage( OID , OID , 1 , "[SC_WEAVE_TAILOR_23]" , 0 )   --�`�N�I�A�Y�N���}���ʰϰ�A�Y���}���ʰϰ�N�|���h���ʸ��I
					ScriptMessage( OID , OID , 0 , "[SC_WEAVE_TAILOR_23]" , 0 )   
				end
			end
		end
	end

end

-- ���ʶi�椤 ���ʧޯ�buff�Q�R����Ĳ�o ( ���� ���u ���` �X��)
function sasa_Auction_leave()
	local OID = OwnerID()
	ScriptMessage( OID , OID , 1 , "[SC_SASA2012_40]" , 0 )   --�A�b�O���m�з|�i�椤���}�A���h�F�ѻP���C
	ScriptMessage( OID , OID , 0 , "[SC_SASA2012_40]" , 0 )   
	CancelBuff(OID , 623237 )  -- Del ���ʤ���buff  
	CancelBuff(OID , 623241 )  -- Del king buff
	CancelBuff( OID , 623245 )	--�R���X�P
	GiveBodyItem( OID , 241645 , 1 )  

end


function sasa_Auction_npcshow(step,Leader)
	local CTRL = OwnerID() -- ����npc
	local flag = 781176
	local bornflag = {1, 2, 3, 4, 5 }
	local moveflag = {6,7,8,9,10 }
	local npclist = { 121092, 121093, 121094, 121095, 121096 }
	local speaklist = { "[SC_SASA2012_19]", "[SC_SASA2012_20]" , "[SC_SASA2012_21]", "[SC_SASA2012_22]" , "[SC_SASA2012_23]" }
	local people = {}

	-- �ͬ��ʰѥ[npc
--	say(CTRL, "now step ="..step )

	for i = 1, step do
		People[i] = CreateObjByFlag( npclist[i] , flag , i , 1 )
		WriteRoleValue( People[i] , EM_RoleValue_Register8 , Leader ) 
		local R = Rand(5)+1
		AddToPartition( People[i] , 0 )
	--	say(people[i], "npc born -"..i )
		DW_MoveToFlag( People[i] , Flag , moveflag[i]  , 0 , 1 )  -- ���ʨ�Ѥl�W
		NPCSay( People[i], speaklist[R] )  -- npc�H���r������
		BeginPlot( People[i]  , "sasa_People_AInew" , 0 )  -- npc���ʶ}�lAI
		sleep(5)
	end
--	say(Ctrl, "npc born end")
end


-- �D��HNPC AI
function sasa_Leader_Talkshow_AI()
	local Leader  = OwnerID()
	local reward = ReadRoleValue(Leader, EM_RoleValue_Register10 )  -- ���ʥD��npc r10 = reward
	local range = 140		--���ʥb�|�d��
	local Maxmoney = 0
	local Leadertimer = 0
	local endtime = 180  -- ��]�w�O 180
	local endchecktime =  endtime-3  -- ���ʵ����e5�� ����M�Ū��a
	local checktime = 20  --  20sec �ˬd�@���ثe�̰����X���� �`�@ sec��
	local checkplayertime = 13
	local mostlv = 0
	local kingbuffid = 623241
	local scorebuff = 623237

	WriteRoleValue(Leader, EM_RoleValue_Register6, 1 )--���ʤ�1 ���ʵ���0
	while true do 
		sleep(10)
		Leadertimer = Leadertimer + 1 
	--	say(Leader, "Leadertimer = "..Leadertimer )

		if Leadertimer == endtime then -- ���ʮɶ���
			WriteRoleValue(Leader, EM_RoleValue_Register6, 0 )--���ʤ�1 ���ʵ���0
			local Player = SearchRangePlayer( Leader , range ) --�P��150���a
--			Maxmoney = ReadRoleValue(Leader,EM_RoleValue_Register8)--�̰���
			sasa_Leader_checkking();
			local king = ReadRoleValue(Leader, EM_RoleValue_Register9 )--�o�Ъ�
		--	local name = getname(king) 

			if ReadRoleValue(king  , EM_RoleValue_IsPlayer ) == 1 then
				NPCSAY( Leader ,  getname(king).."[SC_SASA2012_26]" )--�A�u�O�ӴΤF�A�o����a�O�ݩ�A���I
				GiveBodyItem( king , reward , 1 )  --���j��
			end
			AddBuff(king, kingbuffid, 0, 14  )  -- �ثe�̰�����--��buff�P�_

			for i = 0, table.getn(Player)-1 do
				if CheckBuff(Player[i], 623229 ) == true then -- ���ʧޯ�
					if CheckBuff( Player[i] , scorebuff ) == true then 	--�����ƪ�����
						local bufflv = FN_CountBuffLevel(Player[i], scorebuff )    -- �X������
						local bufflvnew = bufflv+1

						--���ʵ����A�A�b�o���m�з|���X�����Ƭ�<CS>[$VAR1]</CS>�C
						ScriptMessage( Player[i], Player[i] , 1 , "[SC_SASA2012_34][$SETVAR1="..bufflvnew.."]" , C_SYSTEM )   
						ScriptMessage( Player[i], Player[i] , 0 , "[SC_SASA2012_34][$SETVAR1="..bufflvnew.."]" , C_SYSTEM )  

						if CheckBuff(Player[i], kingbuffid ) == false then
							Tell(  Player[i], Leader , "[SC_SASA2012_16]" )
							--���ߧA�աI�֨ӻ���a�I��L�H�]�O��k�A�ڭ̤]������p§�~�n�e���A�̡C
						end

						--  �����ƪ̳���
						if bufflvnew >= 41 then
							GiveBodyItem( Player[i] , 241646 , 1 )  
						elseif bufflvnew >= 31 and bufflvnew <= 40 then
							GiveBodyItem( Player[i] , 241645 , 5 )  
						elseif bufflvnew >= 21 and bufflvnew <= 30 then
							GiveBodyItem( Player[i] , 241645 , 3 )  
						elseif bufflvnew >= 11 and bufflvnew <= 20 then
							GiveBodyItem( Player[i] , 241645 , 2 )  
						elseif bufflvnew >= 1 and bufflvnew <= 10 then
							GiveBodyItem( Player[i] , 241645 , 1 )  
						end

					end

					Setflag(Player[i], 546876, 1 )  -- ������ѧ���key
			--		DesignLog( Player[i], 120905 , "Craft event machine play number".."." )

					sleep(10)
					---------------  �������Լ� --------------------
					Lua_Festival_07_All(Player[i])    -- 2013 ����Լ��禡 
					-----------------------------------------------------
				
					CancelBuff( Player[i] , 623237 )	--�R�ۻ�����
					CancelBuff( Player[i] , 623245 )	--�R���X�P
					CancelBuff_NoEvent( Player[i]  , 623229 )  --�R�ޯ�BAR

				end
			
			end
		
		--	say(king, "del king buff")	
			CancelBuff( king, kingbuffid )
			WriteRoleValue(Leader, EM_RoleValue_Register9, 0 )

			sleep(25)
			NPCSAY(Leader, "[SC_SASA2012_37]")
			-- �P�¦U�쪺�ѻP�A�o�����O���m�з|�즹�����A�ڭ̤U�|���I

			sleep(30)

			-- �R�����ʬ���npc
			local npc = SearchRangeNPC(Leader, range )
			local objlist = { 121092 , 121093 , 121094 , 121095 , 121096  }

		--	say(Leader, "del event obj")

			for i = 0 , table.getn(npc)-1 do 	-- �j�M�d�򤺪��a
				local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
				if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] then
					Delobj(npc[i] )
				end
			end
			Delobj( Leader )
			break
		elseif Leadertimer%checkplayertime == 0 then
			BeginPlot(Leader, "sasa_Leader_checkplayer", 0 )
		elseif Leadertimer%checktime == 0 then  -- �ˬd�ثe�̰�����
			if Leadertimer < endchecktime then  -- �����e5���A�ˬd
				Callplot( Leader, "sasa_Leader_checkking", 0 )
			end
		end
	end
end


function sasa_Leader_checkplayer()
	local Leader  = OwnerID()
	local range = 140		--���ʥb�|�d��
	local joinplayer = {}
	local Player = SearchRangePlayer( Leader , range ) --�P��150���a

	for i = 0, table.getn(Player)-1 do
		if CheckBuff( Player[i] , 623229 ) == true then  -- �ѻP���ʪ����a
			table.insert( joinplayer , Player[i] ) 
		end
	end
--	say(Leader, "joinplayer="..table.getn(joinplayer) )
	if table.getn(joinplayer) == 0 then
		say(Leader, "[SC_SASA2012_36]")
		sleep(25)
		-- �R�����ʬ���npc
		local npc = SearchRangeNPC(Leader, range )
		local objlist = { 121092 , 121093 , 121094 , 121095 , 121096  }

		for i = 0 , table.getn(npc)-1 do 	-- �j�M�d�򤺪��a
			local Orgid = ReadRoleValue(NPC[i], EM_RoleValue_OrgID )
			if Orgid == objlist[1] or Orgid == objlist[2] or Orgid == objlist[3] or Orgid == objlist[4] or Orgid == objlist[5] then
				Delobj(npc[i] )
			end
		end

		Delobj( Leader )
	end

end


function sasa_Leader_checkking()
	local Leader  = OwnerID()
	local reward = ReadRoleValue(Leader, EM_RoleValue_Register10 )  -- ���ʥD��npc r10 = reward
	local number = ReadRoleValue(Leader, EM_RoleValue_Register7 )  -- ���ʥD��npc r7 = �ثe���X�P
	local range = 140		--���ʥb�|�d��
	local Leadertimer = 0
	local mostlv = 0
	local mostindex = 0
	local kingbuffid = 623241
	local scorebuff = 623237
	local scorebuff2 = 623245
	local cardbuff = 623244 -- �X�����X�Pbuff
	local Win01 = SearchRangePlayer( Leader , range ) --�P��150���a
	local Win02 = SearchRangeNPC ( Leader , range ) --�P��150 NPC

	WriteRoleValue(Leader, EM_RoleValue_Register9, 0  )
--	say(Leader, "reset mostlv  ")

	for i = 0 , table.getn(Win01)-1 do  -- �ˬd���a
		if CheckBuff( Win01[i] , scorebuff ) == true then 	--�����ƪ�����
			local bufflv = FN_CountBuffLevel(Win01[i], scorebuff )  
			local bufflv2 = FN_CountBuffLevel(Win01[i], scorebuff2 )  
			if mostlv < bufflv  or (mostlv == bufflv and mostindex > bufflv2)then
				mostlv = bufflv
				mostindex = bufflv2
				WriteRoleValue(Leader, EM_RoleValue_Register9, Win01[i]  )
			end
		end
	end
	for i = 0 , table.getn(Win02)-1 do  -- �ˬdnpc
		if CheckBuff( Win02[i] , scorebuff ) == true then 	--�����ƪ�����
			local bufflv = FN_CountBuffLevel(Win02[i], scorebuff ) 
			local bufflv2 = FN_CountBuffLevel(Win02[i], scorebuff2 )  
			if mostlv < bufflv  or (mostlv == bufflv and mostindex > bufflv2)then
				mostlv = bufflv
				mostindex = bufflv2
				WriteRoleValue(Leader, EM_RoleValue_Register9, Win02[i]  )
			end
		end
	end

	local king = ReadRoleValue(Leader, EM_RoleValue_Register9 )
--	say(king, "I am king")

	if CheckID(king) == True then   -- ��king
		local dis = GetDistance(Leader, king )
	--	say(Leader, "king dis ="..dis )
		if dis <= range then
	--		say(Leader, "in range" )

			local bufflv = FN_CountBuffLevel(king, scorebuff ) 
			local bufflvnew = bufflv + 1
		--	local name = getname(king) 
			AddBuff(king, kingbuffid, 0, 14  )  -- �ثe�̰�����
			NPCSAY( Leader ,  getname(king).."[SC_SASA2012_29][$SETVAR1="..bufflvnew.."]" )
			--���X�����Ƭ�[$VAR1]�A�O�ثe�̰����X���̡A�٦����D�D���էr�H
		end
	end
end


-- ���ʰѻPnpc AI
function sasa_People_AInew()
	local OID = OwnerID()
	local skill1 = 850360  -- �ۻ� (��ۤv�ϥΪ�)
	local skill2 = { 850355 , 850371 }	--�O�� , �M�� (��)
	local range = 140
	local Leader =  LuaFunc_SearchNPCbyOrgID( OID , 121089 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local skill1R = RandRange( 5, 8  )  -- 15 ~ 20 ��
	local skill2R = RandRange( 13, 20  )  -- 10 ~ 15 ��
	local endtime = 180 -- ��]�w�� 180
	local npctimer = 0
	local skill1R = RandRange( 5, 8  )  -- 15 ~ 20 ��
	local skill2R = RandRange( 13, 20  )  -- 10 ~ 15 ��
	sleep(40)

	local NPC1 = LuaFunc_SearchNPCbyOrgID( OID , 121092 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local NPC2 = LuaFunc_SearchNPCbyOrgID( OID , 121093 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local NPC3 = LuaFunc_SearchNPCbyOrgID( OID , 121094 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local NPC4 = LuaFunc_SearchNPCbyOrgID( OID , 121095 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local NPC5 = LuaFunc_SearchNPCbyOrgID( OID , 121096 , range , 0 ) --�H���󬰤��ߡA�V�P��N�X�j�M�S�wIDNPC
	local count_npc1  = Lua_Hao_NPC_Range_Search( OID ,121092 , range )  -- range ������ƶq 
	local count_npc2  = Lua_Hao_NPC_Range_Search( OID ,121093 , range )  -- range ������ƶq 
	local count_npc3  = Lua_Hao_NPC_Range_Search( OID ,121094 , range )  -- range ������ƶq 
	local count_npc4  = Lua_Hao_NPC_Range_Search( OID ,121095 , range )  -- range ������ƶq 
	local count_npc5  = Lua_Hao_NPC_Range_Search( OID ,121096 , range )  -- range ������ƶq 
	local OwnerOrg = ReadRoleValue(OID, EM_RoleValue_OrgID )

	local objlist = {}
	if  ( OwnerOrg ~= 121092 ) and ( count_npc1 > 0 )  then 
		table.insert( objlist , NPC1 ) 
	end
	if  ( OwnerOrg ~= 121093 ) and ( count_npc2 > 0 )  then 
		table.insert( objlist , NPC2 ) 
	end
	if  ( OwnerOrg ~= 121094 ) and ( count_npc3 > 0 )  then 
		table.insert( objlist , NPC3 ) 
	end
	if  ( OwnerOrg ~= 121095 ) and ( count_npc4 > 0)  then 
		table.insert( objlist , NPC4 ) 
	end
	if  ( OwnerOrg ~= 121096 ) and ( count_npc5 > 0 )  then 
		table.insert( objlist , NPC5 ) 
	end

--	say(OID, "NPC Target ="..table.getn(objlist) )

	while true do 
	--	NPCsay(OID, "npctimer = "..npctimer )

		if npctimer == endtime then  -- ���ʮɶ���
			break
		elseif npctimer < ( endtime - 3 ) then
			if CheckBuff(OID, 623228 )  == false then   -- �S���Q�M��
				if npctimer%skill1R == 0 then  -- �I��[��
					CastSpell(OID, OID, 850360 )
				elseif npctimer%skill2R == 0 then  -- �I���L�ޯ�
					local R2 = Rand(100)+1  --�P�_�ϥέ��@��skill
					local RR = Rand(100)+1  -- RAND�n�缾�a �٬ONPC
					if RR >= 65 then  -- ��npc�� 
						if table.getn(objlist) > 0 then
							local RN = Rand(table.getn(objlist))+1  -- �qjoinplayer table ���@�Ӫ��a
							local TargeNPC = objlist[RN]
						--	SAY(TargeNPC, "IT IS ME - NPC ")

							if R2 >= 65 then
								CastSpell(OID, TargeNPC, skill2[1] )
							else
								CastSpell(OID, TargeNPC, skill2[2] )	
							end
						end
					else   -- �缾�a��
						local joinplayer = {}
						local player  = SearchRangePlayer(OID, range )
						local R2 = Rand(100)+1

						for i = 0 , table.getn(player)-1 do 	-- �j�M�d��
						--	SAY(Player[i], "Player ")
							if CheckBuff(Player[i], 623229 ) == true then -- �����ʧޯ�buff
						--		SAY(Player[i], "have buff ")
								table.insert(joinplayer, Player[i] )
							end
						end
						if table.getn(joinplayer) > 0 then
							local RP = Rand(table.getn(joinplayer))+1  -- �qjoinplayer table ���@�Ӫ��a
							local TargetPlayer = joinplayer[RP]
						--	SAY(TargetPlayer, "IT IS ME 2 ")
							if R2 >= 55 then
								CastSpell(OID, TargetPlayer, skill2[1] )
							else
								CastSpell(OID,  TargetPlayer, skill2[2] )	
							end
						end
					end
				end
			end
		end
		sleep(10)
		npctimer = npctimer +1

	end
end


---------------------�ޯ�---------------------

--�ϥ� �ۻ�
function sasa_Skill_Money()
	local Player = OwnerID()
	local Leader = ReadRoleValue(Player,EM_RoleValue_Register8)
	local Maxmoney = ReadRoleValue(Leader,EM_RoleValue_Register8)--�`�ۻ�����
	local Action = ReadRoleValue(Leader,EM_RoleValue_Register6)
	if(Action == 1) then
		Maxmoney = Maxmoney +1
		Addbuff( Player , 623237 , 0 , 310 ) --���a��o����
		WriteRoleValue(Leader, EM_RoleValue_Register9, Player )--���aid
		WriteRoleValue(Leader, EM_RoleValue_Register8, Maxmoney )--�`�ۻ�����
		--�ۻ�����
		CancelBuff(Player, 623245);
		Addbuff( Player , 623245 , Maxmoney , 310 ) --���a�ۻ�����
		
	--	DebugMsg(0,0,"Maxmoney = "..Maxmoney.." PlayerID = "..getname(Player))
		--ScriptMessage( Player , Player , 1 , "[SC_SASA2012_35][$SETVAR1="..Maxmoney.."]" , C_SYSTEM )   -- �A�ϥΤF�X���A�{�b���X�����Ƭ�<CS>[$VAR1]</CS>�C
		--ScriptMessage( Player , Player , 0 , "[SC_SASA2012_35][$SETVAR1="..Maxmoney.."]" , C_SYSTEM )   -- �A�ϥΤF�X���A�{�b���X�����Ƭ�<CS>[$VAR1]</CS>�C
		--NPCSAY( Leader , "[SC_SASA2012_29][$SETVAR1="..Maxmoney.."]" )
	end
end

--�O�� 
function sasa_Skill_Safelive()
	local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local XR = RandRange(6, 8)
	local ZR = RandRange(6, 8)
	local Xman = star_CreateObj_NoAdd( OwnerID() , 121091 , XR , 0 , ZR , Room , 0 )
	SetModeEx( Xman , EM_SetModeType_SearchenemyIgnore , true )	--���󤣷|�Q�j�M
	SetModeEx( Xman , EM_SetModeType_HideName , true )  		--�����Y�W�O�_��ܦW��
	SetModeEx( Xman , EM_SetModeType_HideMinimap , true )		--����O�_�b�p�a�ϤW���
	SetModeEx( Xman , EM_SetModeType_Searchenemy , false )   	--����
	SetModeEx( Xman , EM_SetModeType_Mark , false )				--�аO
	SetModeEx( Xman , EM_SetModeType_Fight , false ) 			--���
	SetModeEx( Xman , EM_SetModeType_Move , false )				--����
	SetModeEx( Xman , EM_SetModeType_ShowRoleHead , true )
	SetModeEx( Xman , EM_SetModeType_Strikback , false )		--����
	SetModeEx( Xman , EM_SetModeType_Show , true )				--�q�X
	AddToPartition( Xman , Room )
	WriteRoleValue( Xman , EM_RoleValue_Livetime, 8 )			--�s�b���
	NPCSAY( Xman , "[SC_SASA2012_17]" )
	--�O�@����I
end


-- �M�� �I�k�ˬd 
function sasa_Check_cantuse01()		
	local OID = OwnerID()
	local buffid = 623229  -- ���ʧޯ�buff
	local npclist = {121092, 121093, 121094, 121095, 121096 }
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )  -- �I�k�ؼЪ�Orgid

	if CheckBuff(TargetID(), 623228 ) == true then  --���M��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_33]" , 0 )  
		return false
	-- �ؼй�H�w��[623228]�ĪG�A�L�k���ƨϥ�
	elseif CheckBuff(TargetID(), 623226 ) == true then  -- ���O��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_41]" , 0 )  
		return false
		-- �ؼй�H����[623226]�ĪG�A�L�k�ϥΡC
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if TargetID() == OwnerID() then  -- ��ۤv�ϥ�
				ScriptMessage( OID , OID , 1 , "[SC_SASA2012_30]" , 0 ) 
				return false
				-- �ϥΥؼп��~�A�й�O���m�з|���ʬ�������ϥΡC
			else
				if CheckBuff(TargetID(), buffid ) == false then
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_32]" , 0 )  
					-- �ؼй�H�S���ѻP���ʡA�L�k�ϥ�
					return false
				else
					return true
				end
			end
		else  -- ���O���a
			if ( OrgID == npclist[1] ) or ( OrgID == npclist[2] ) or ( OrgID == npclist[3] ) or ( OrgID == npclist[4] ) or ( OrgID == npclist[5] ) then
				return true

			else 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_SASA2012_30]" , 0 )   
				 --  �ϥΥؼп��~�A�й�O���m�з|���ʬ�������ϥ�
				return false
			end
		end
	end
end


-- �ۻ� , �O�� �I�k�ˬd (�i��ۤv�Ϊ�)
function sasa_Check_cantuse02()	
	local OID = OwnerID()	
	if TargetID() ~= OwnerID() then
		ScriptMessage( OID , OID , 1 , "[SC_SASA2012_31]" , 0 )
		-- �ϥΥؼп��~�A���ޯ�u���ۤv�ϥ�
		return false
	else
		return true
	end
end 

function mika_weave_auction_test1()
	local OID = OwnerID()	
	local itemlist  = { 232011 , 232012 , 232013 , 232014 }   -- 6.0.2 
	local number = rand(3)+1 
	local rewardid = itemlist[number] 

	SAY( OID , "[SC_WEAVE2013_AUCTION_01][$SETVAR1=".."["..rewardid.."]".."]" )  -- 6.0.2��

end