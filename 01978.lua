--����@��

-- lua_mika_wolfcome_control_01  -- �T  ���
-- lua_mika_wolfcome_control_02  -- ��  ���
-- lua_mika_wolfcome_control_03  -- �� ���
-- lua_mika_wolfcome_control_04 -- ����X�v�� ���
-- lua_mika_wolfcome_control_05 -- ���������I


--  1. �T���
--�\��: ���ʶ}�l�U�ɶ��϶� �]�T�X�ͼ@�� �@���u�ͤ@��

function lua_mika_wolfcome_control_01()

	local wolftimer = 0
	WriteRoleValue(OwnerID(),  EM_RoleValue_Register , 0 ) 
	WriteRoleValue(OwnerID(),  EM_RoleValue_Register2 , 0 ) 	
	local R1 = RandRange(  24 , 28 )  --   31 --   60   [  1 ]
	local R2 = RandRange(  28 , 36 )  --   61 -- 150  [ 2 ~ 3 ]
	local R3 = RandRange(  22 , 32 )  -- 151 -- 210  [ 1 ~ 2]
	local R4 = RandRange(  18 , 28 )  -- 211 -- 260  [ 1 ~ 3 ]
	local R5 = RandRange(  20 , 26 )  -- 261 -- 290 [ 1 ]

--	DebugMsg( 0 , 0 , "R1 = "..R1 )
--	DebugMsg( 0 , 0 , "R2 = "..R2 )
--	DebugMsg( 0 , 0 , "R3 = "..R3 )
--	DebugMsg( 0 , 0 , "R4 = "..R4 )
--	DebugMsg( 0 , 0 , "R5 = "..R5 )

	while true do
		sleep(10)
		wolftimer = wolftimer +1
		local count = ReadRoleValue(OwnerID(), EM_RoleValue_Register ) -- ����� �ثe�T�w���ͼƶq
		local check = ReadRoleValue(OwnerID(), EM_RoleValue_Register2 )   -- �T�X�Ͷ}��  0 = �i�H�ͯT 1 ����  ����script ����run
		local nowcount = Lua_Hao_NPC_Range_Search( OwnerID() ,105024 , 900 )  -- range ������ƶq (�T) 
 	--	DebugMsg( 0 , 0 , "wolf timer = "..wolftimer)	
 	--	DebugMsg( 0 , 0 , "wolf summon count = "..count )	
 	--	DebugMsg( 0 , 0 , "check = "..check )
 --		DebugMsg( 0 , 0 , "now count = "..nowcount )

		if wolftimer > 30 and wolftimer <= 60 and count == 0 and nowcount == 0 and check == 0 then   
		--	DebugMsg( 0 , 0 , "R1 = "..R1 )

			if wolftimer%R1 == 0 then
		--		say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- �l�ꦸ��+1
			end 

		elseif wolftimer >= 61  and wolftimer <= 150 and count <= 3 and nowcount == 0 and check == 0 then   
	--		DebugMsg( 0 , 0 , "R2 = "..R2 )

			if wolftimer%R2 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- �l�ꦸ��+1

			end 

		elseif wolftimer >= 151  and wolftimer <= 210 and count <= 5 and nowcount <= 1 and check == 0 then     -- 0 ~ 2
	--		DebugMsg( 0 , 0 , "R3 = "..R3 )

			if wolftimer%R3 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- �l�ꦸ��+1

			end 

		elseif wolftimer >= 211  and wolftimer <= 260 and count <= 7 and nowcount <= 2 and check == 0 then  -- 0 ~ 3
		--	DebugMsg( 0 , 0 , "R4 = "..R4 )

			if wolftimer%R4 == 0 then
		--		say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- �l�ꦸ��+1

			end 

		elseif wolftimer >= 261  and wolftimer <= 290 and count <= 9 and nowcount <= 2 and check == 0 then -- 0 ~ 3
	--		DebugMsg( 0 , 0 , "R5 = "..R5 )

			if wolftimer%R5 == 0 then
	--			say(OwnerID(), "lets born wolf !")

				Beginplot(OwnerID(), "lua_mika_wolfcome_wolf_born1" , 0 )  
				AddRoleValue(OwnerID(),  EM_RoleValue_Register , 1 ) -- �l�ꦸ��+1

			end 

		elseif wolftimer >= 300 then

		--	say(OwnerID(), " END ")
			break
		end
	end
end


-- 2. �� ���
--�\��: �]���ϰ줺 �p�G�Ϥ֩�3��, �N�H���bflag�W�ͥX��

function lua_mika_wolfcome_control_02()
	local FlagObjID = 780825 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local Obj = 105023 --  ��
	local ObjNum =  3      --math.floor( FlagNum / 4 )   --�شӪ���ƶq   3 /9 ( 0 - 8 )
	local resetTime =  10
	local Range = 10 --�üƽd��
	local Gravity = true --���O

	Lua_Zone354_Create( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range ) 
end

-- 3. �� ���
function lua_mika_wolfcome_control_03()
	local FlagObjID = 780822  --�X�m����s��
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local Obj = 117052 -- ����
	local ObjNum =  5      --math.floor( FlagNum / 4 )   --�شӪ���ƶq       5 /10 ( 0 - 9 )
	local resetTime =  40
	local Range = 10 --�üƽd��
	local Gravity = true --���O

	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )--�o�O�w�ɰ��檺�j��
end
-- �� �����S�����@��

-- 4 ���a�������ê��� ���^�ӱM��
function lua_mika_wolfcome_control_04()
	local range = 500
	local limitdis = 350

	while true do
		sleep(30)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- ���a���Ҧ�����ƶq   ��
	--	say(OwnerID(), "obj1 count ="..count1 )

		if count1 == 0  then -- �p�G�L
	--		say(OwnerID(), "nobody " )
		else
			local  SearchID= LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				local dis = GetDistance(OwnerID(), SearchID[i] )
	--			say(OwnerID(), "obj"..i.."range ="..dis )
				if dis > limitdis then -- �p�G��̶Z���W�L�i���\�d��
	--				Say(SearchID[i], "obj"..i.."over range" )
					AdjustFaceDir(SearchID[i], OwnerID() , 0 ) --���V �I��
					WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
					sleep(5)
					Lua_MoveLine( SearchID[i] , 40 ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
				else
	--				Say(SearchID[i], "obj"..i.."range is ok" )
				end
			end
		end
	end

end


-- �۰� : ��ƮwNPC�]�w  ���󲣥ͼ@������ �I��

-- 5  ���������� (���I)
function lua_mika_wolfcome_control_05()
	local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local range = 95
	local score = 5  -- �e�Ϧ^�a���\��, ��o������

--	say(OwnerID(), range )

	while true do
--		say(OwnerID(), "CHECK" )
		sleep(30)  --�C���@��

		local count1 = Lua_Hao_NPC_Closest_Search( OwnerID() , 105023, range )-- �HOwner�����߰��S��j�M�A�^�ǳ̱��񪺪���
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range ������ƶq  �T

		if count1 ==0 and count2 == 0 then
	--		say(OwnerID(), "no sheep" )
		elseif count1 > 0 then
			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
		--		Say( SearchID[i] , "i = "..i )
				local bufflv = FN_CountBuffLevel(SearchID[i], 507700 )  -- ������buff ����

				if bufflv >= 0 then  
					--�i�H�^����
	--				Say( SearchID[i] , "buff ok  "..i ) 

					local Player = SearchRangePlayer( OwnerID() , 900 ) --�j�M�P�򪱮a

					ScriptMessage( OwnerID(),  -1, 1, "[SC_TRAIN10_MSG_07][$SETVAR1="..score.."]" , C_SYSTEM )  --���\�a��[105023]�^��A���A��o[$VAR1]���C
					ScriptMessage( OwnerID(),  -1, 0, "[SC_TRAIN10_MSG_07][$SETVAR1="..score.."]" , C_SYSTEM )  
					GuildWolfcomeScore[RoomID] = GuildWolfcomeScore[RoomID] + score
					SetSmallGameMenuStr( Player[0] , 14 , 2 , "[SC_TRAIN10_INTERFACE_02][$SETVAR1="..GuildWolfcomeScore[RoomID].."]" ) 

					DelObj(SearchID[i])
					Lua_Zone354_Reset( SearchID[i] )--���ͦ�m�M��
			--		say(OwnerID(), "del sheep ok " )

				else
			--		Say( SearchID[i] , "buff no ok  "..i )

					-- ���٤���^�a��
					local dis = Rand( 60 )+1    --���ʶZ��40-60
					if dis < 40 then
						dis = 40
					end
			--		Say(SearchID[i], "Move="..dis )
					AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --���V �I��
					WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
					sleep(5)
					Lua_MoveLine( SearchID[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
					sleep(10)

				end
			end
		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 80 )+1    --���ʶZ��60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		end

	end
end


-- ��������X�v ����_ range 100
-- ��npc �H������ �N�~����

function lua_mika_wolfcome_control_R1()
	local range = 160

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range ������ƶq  ��
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range ������ƶq  �T

	--	say(OwnerID(), "obj1 count ="..count1 )
	--	say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
		--	say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 60 )+1    --���ʶZ��40-60
				if dis < 40 then
					dis = 40
				end
		--		Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 80 )+1    --���ʶZ��60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		end
	end
end


function lua_mika_wolfcome_control_R2()
	local range = 250

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range ������ƶq  ��
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range ������ƶq  �T

--		say(OwnerID(), "obj1 count ="..count1 )
--		say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
--			say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 60 )+1    --���ʶZ��40-60
				if dis < 40 then
					dis = 40
				end
--				Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 80 )+1    --���ʶZ��60-80
				if dis < 60 then
					dis = 60
				end
--				Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		end
	end
end

function lua_mika_wolfcome_control_R3()
	local range = 200

	while true do
		sleep(10)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range ������ƶq  ��
		local count2 = Lua_Hao_NPC_Range_Search( OwnerID() , 105024, range )  -- range ������ƶq  �T

	--	say(OwnerID(), "obj1 count ="..count1 )
	--	say(OwnerID(), "obj2 count ="..count2 )

		if count1 ==0 and count2 == 0 then
		--	say(OwnerID(), "nobody " )

		elseif count1 > 0 then

			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )

			for i = 0 , table.getn(SearchID) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 60 )+1    --���ʶZ��40-60
				if dis < 40 then
					dis = 40
				end
		--		Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		elseif count2 > 0 then
			local  SearchID2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105024 , range , 1 )

			for i = 0 , table.getn(SearchID2) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 80 )+1    --���ʶZ��60-80
				if dis < 60 then
					dis = 60
				end
		--		Say(SearchID2[i], "Move back ="..dis )
				AdjustFaceDir(SearchID2[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID2[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID2[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
			end

		end
	end
end



-- �ϱM��
function lua_mika_wolfcome_control_RR()
	local range = 200

	while true do
		sleep(30)
		local count1 = Lua_Hao_NPC_Range_Search( OwnerID() , 105023, range )  -- range ������ƶq  ��
	--	say(OwnerID(), "obj1 count ="..count1 )

		if count1 == 0 then
	--		say(OwnerID(), "nobody " )

		else
			local  SearchID = LuaFunc_SearchNPCbyOrgID( OwnerID() , 105023 , range , 1 )
			for i = 0 , table.getn(SearchID) , 1 do
				-- �o�̤���A�a��
				local dis = Rand( 80 )+1    --���ʶZ��60-80
				if dis < 60 then
					dis = 60
				end
	--			Say(SearchID[i], "Move back ="..dis )
				AdjustFaceDir(SearchID[i], OwnerID() , 180 ) --���V �I��
				WriteRoleValue( SearchID[i]  ,EM_RoleValue_IsWalk , 0  )--�ζ]��
				sleep(5)
				Lua_MoveLine( SearchID[i] , dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)
				sleep(10)
			end
		end
	end
end