--��s�`���� ��Lnpc

--���ê���]�@�� 115818
-----�P�_����NPC���ʶ}����W.�}�l.�������A 
-----����]���O�X�{�@��
-----���次�ʶ}�l�ɥX�{���@��
function lua_mika_beercontest_cast()  -- ���ʮɶ��P�_
	local npc = LuaFunc_SearchNPCbyOrgID(OwnerID() , 121168, 100 , 0)       --����NPC
	while true do
		Sleep(600)   --�@�����]�@��
		local hour = GetSystime(1)
		local min = GetSystime(2)

		local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
		local ZoneID = ReadRoleValue(OwnerID() , EM_RoleValue_RealZoneID)				
		if ZoneID <= 1000 then
			if pid == 99 then -- ���եμg�J���W
				RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST01]" )   --�s���}�l  --2012.08.21 �s���睊
				WriteRoleValue( npc , EM_RoleValue_PID , 1) --��ƭȧאּ1 ���W���� (npc)
				local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				Say(npc, "test - come on join, pid = "..pid)
			elseif pid == 100 then -- ���եμg�J���W
				RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST02]" )   --�s���}�l  --2012.08.21 �s���睊
				Beginplot(OwnerID(), "lua_mika_beercontest_boxborn" , 0 )   --���X�{�@��
				WriteRoleValue( npc , EM_RoleValue_PID , 2) --��ƭȧאּ2  ���ʶ}�l (npc)
				WriteRoleValue( npc , EM_RoleValue_Register+1 , 0 ) --�Nnpc��^�S�H�Ĥ@�W
				local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				Say(npc, "test -start,  pid = "..pid)
				Beginplot(OwnerID(), "lua_mika_beercontest_testev" , 0 )   -- ���եΪ����ʮɶ��� , 4��������, 5�����ᵲ��

			elseif hour == 1 or hour == 3 or hour == 5 or hour == 7 or hour == 9 or hour == 11 or hour == 13 or hour == 15 or hour == 17 or hour == 19 or hour == 21 or hour == 23 then
				if  min == 50 then  
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST01]" )   --�s���}�l  --2012.08.21 �s���睊

					-- �Q�ܱo�a�x��o�W�@�L�G�����M�Z���ܡH��s�`���ʡy�B�s�֤�z�{�b�}����W�o�I�I��ɶ������I�A������̽ХߧY�e��[SC_ZONE_DAELANIS]�����f�V[115819]���W�ѥ[�I
					WriteRoleValue( npc , EM_RoleValue_PID , 1) --��ƭȧאּ1 ���W���� (npc)
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				end
			elseif hour == 0 or hour == 2 or hour == 4 or hour == 6 or hour == 8 or hour == 10 or hour == 12 or hour == 14 or hour == 16 or hour == 18 or hour == 20 or hour == 22 then      
				if min == 0 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST02]" )   --�s���}�l  --2012.08.21 �s���睊
					--��s�`���ʡy�B�s�֤�z�}�l�o�I�Ц�[SC_ZONE_DAELANIS]�����U�B��s������s�A�Ĥ@�ӹF�����w�ƶq�æ^���D���H�̡A�N�i��o�a�x�I
					Beginplot(OwnerID(), "lua_mika_beercontest_boxborn" , 0 )   --���X�{�@��
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
					WriteRoleValue( npc , EM_RoleValue_PID , 2) --��ƭȧאּ2  ���ʶ}�l (npc)
					WriteRoleValue( npc , EM_RoleValue_Register+1 , 0 ) --�Nnpc��^�S�H�Ĥ@�W
				--	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				elseif min == 9 then
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST03]" )   --�s���}�l  --2012.08.21 �s���睊
					--��s�`���ʡy�B�s�֤�z�Y�N��1�����ᵲ���A�[�֧A���}�B�����F���ؼЧa�I
				elseif min == 10 then 
					RunningMsgEx( OwnerID() , 2 , 3 , "[SC_BEERDAY_NEW_CAST04]" )   --�s���}�l  --2012.08.21 �s���睊
					Beginplot(OwnerID(), "lua_mika_beercontest_boxkill" , 0 )  --�R�����@��
					--�P�¦U������ѻP�A��������s�`���ʡy�B�s�֤�z�w�����A�U�����ʱN��2�p�ɫ�}�l�C
					local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
					WriteRoleValue( npc , EM_RoleValue_PID , 0 ) --��ƭȧאּ0  ���ʵ���
				--	local pid = ReadRoleValue ( npc , EM_RoleValue_PID )  --NPCPID
				--	Say(OwnerID(), pid)
				end
			end
		end
	end
end

-- ���ե� - �ϥδ��ի��O�����ʶ}�l���p�ɾ�, ���ʪ��ɶ����� �M���ʵ�����
function lua_mika_beercontest_testev()
	local OID = OwnerID()  -- Hidebox
	local npc = LuaFunc_SearchNPCbyOrgID(OID , 121168, 100 , 0)       --����NPC
	local time1 = 240
	local time2 = 300
	local timer = 0 
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	
	while true do 
		timer = timer +1 
		say(npc, "time ="..timer )
		if timer%60 == 0 then -- 60��~�i�Ӥ@��
			if timer == time2 then  -- ���ʶ}�l10���� 
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( OID , 2 , 3 , "[SC_BEERDAY_NEW_CAST04]" )   --�s������  
				end
				Beginplot(OID, "lua_mika_beercontest_boxkill" , 0 )  --�R�����@��
				WriteRoleValue( npc , EM_RoleValue_PID , 0 ) --��ƭȧאּ0  ���ʵ���
				break
			elseif timer == time1 then  -- ���ʶ}�l9����
				if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
					RunningMsgEx( OID , 2 , 3 , "[SC_BEERDAY_NEW_CAST03]" )   --�s������ 
				end
			end
		end
		sleep(10)
	end
end

--���ʶ}�l�ɤ��X�{�@��
function lua_mika_beercontest_boxborn()  
	local X = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99}  --100��
	local Y = 0
	local Y5 = {}
	for i = 1 , 50 do   -- ����50��
		Y = Rand(table.getn(X))+1
		Y5[i] = X[Y]
		table.remove(X,Y)
		local box = {}
		box[i] = CreateObjByFlag(115820 , 780323, Y5[i] ,1) --�ϥκX�l���ͤ�� npc �X�l�s�� �ƶq 
		SetModeEx( box[i]    , EM_SetModeType_Strikback, false )--����
		SetModeEx( box[i]    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( box[i]    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( box[i]    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( box[i]    , EM_SetModeType_Move, false )--����
		SetModeEx( box[i]    , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( box[i]    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( box[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( box[i] , EM_SetModeType_Fight , false )--�i�������
		AddToPartition( box[i], 0 )	--�������
		SetPlot(box[i], "Touch" , "lua_mika_beercontest_box2" , 50 )
	--	Say(OwnerID(),"Y5 "..i.." = "..Y5[i])-- i = �ĴX�� ,  y5[i]  = �Ʀr
	end
--	Say(OwnerID(), "BORN OK")
end


--���ʶ}�l�ɤ��R���@��
function lua_mika_beercontest_boxkill()  
	local TempObj = {115820}
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
--	Say(OwnerID(), "KILL OK")
end

--���@�� 115820
function lua_mika_beerbox_buff()
	Addbuff(OwnerID(), 506936 , 0 , -1 ) --�`�y����BUFF
end

function lua_mika_beercontest_box()
	SetPlot( OwnerID() , "Touch" , "lua_mika_beercontest_box2" , 50 )
end

function lua_mika_beercontest_box2()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if BeginCastBarEvent( O_ID, T_ID,"[SC_BEERDAY_NEW25]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_mika_beercontest_box3" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--�ؼЦ��L��
		return
	end
end

function lua_mika_beercontest_box3(O_ID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	 -- ���a
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "OK" , "0xffffff00" )  --BeginCastBar���\�F�C
		--	ScriptMessage(O_ID, O_ID , 0 , "OK" , "0xffffff00" )  
			local join = Checkbuff(OwnerID(), 506907 ) --�w�ѥ[���Abuff
			local needbeer = 15  --�ݨD��s�ƶq
			if join == true then --�������W���A
				local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq(Player)
				if beercount >= needbeer then
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX01]" , C_SYSTEM )	--�e�������T��  �A�w�F���ؼСA�кɳt�^�����ʥD���H�A���A��o�a�x�I
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX01]" , C_SYSTEM )	--�T����
				else
					local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq(Player)
				--	Say(OwnerID(), beercount)
					AddRoleValue(OwnerID(), EM_LuaValueFlag_UseItem10, 1)  --����+1
					local beercount = ReadRoleValue ( OwnerID() , EM_LuaValueFlag_UseItem10 ) -- ��s���ƶq(Player)
				--	Say(OwnerID(), beercount) 
					Beginplot(TargetID(), "lua_mika_beercontest_hide" , 0 )
					ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX02][$SETVAR1="..beercount.."][$SETVAR2="..needbeer.."]" , C_SYSTEM ) 
				--�e�������T��  �w���o��s�~�ƶq�G[$VAR1] / [$VAR2] �C
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX02][$SETVAR1="..beercount.."][$SETVAR2="..needbeer.."]" , C_SYSTEM )	--�T����
					if beercount >= needbeer then
						ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX03]" , C_SYSTEM )	--�e�������T��  ���ߧA�F���ؼСA�кɳt�^�����ʥD���H�I
						ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX03]" , C_SYSTEM )	--�T����
					end
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_BEERDAY_NEW_BOX04]" , 0 )	--�e�������T��  �A�|���ѥ[�y�B�s�֤�z���ʡA�Щ���W�ɶ����W�ѥ[�C
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_NEW_BOX04]" , 0 )	--�T����
			end

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		--	ScriptMessage(O_ID, O_ID , 1 , "Fail" , "0xffffff00" )  --BeginCastBar���ѤF�C
		--	ScriptMessage(O_ID, O_ID , 0 , "Fail" , "0xffffff00" )  
		end
	end
end

function lua_mika_beercontest_hide()
--	Say(OwnerID(), "11")  --npc
--	Say(TargetID(), "21")  --plyaer
	Hide(OwnerID() )
	local ran = rand(100)   
	if ran <= 20  then   -- 0 -20
		Sleep(200)  --
	elseif ran >= 21 and ran <= 50  then   -- 21 -40
		Sleep(300)  --
	elseif ran >= 51 and ran <= 75  then   -- 41 -60
		Sleep(350)  --
	elseif ran >= 76 and ran <= 90  then   -- 61 -80
		Sleep(350)  --
	elseif ran >= 91  then   --  up 81
		Sleep(400)  --
	end
	Show(OwnerID(), 0)
end