function Lua_mika_losttreasure_insideNPC5() --�}�l�C��
	--	Say(OwnerID(), "ownerID")
	--	Say(TargetID(), "targetID")
-------------------------------------- 
		local NPC = OwnerID()
		local Player = TargetID() 
		local range = 2000
--		local box3 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114120, 3000 , 0)       --1
--		local box5 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114316, 3000 , 0)       --2
--		local box8 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114319, 3000 , 0)       --3
--		local box11 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114322, 3000 , 0)       --4
--		local box14 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114325, 3000 , 0)       --5
--		local box18 = LuaFunc_SearchNPCbyOrgID( TargetID() , 114329, 3000 , 0)       --6

--		local door1 = LuaFunc_SearchNPCbyOrgID( Player , 113620, range , 0)       --���j��
--		local door2 = LuaFunc_SearchNPCbyOrgID( Player , 114086, range , 0)       --���j��
--		local door3 = LuaFunc_SearchNPCbyOrgID( Player , 114082, range , 0)       --���j��
--		local door4 = LuaFunc_SearchNPCbyOrgID( Player , 114085, range , 0)       --���j��
--		local door5 = LuaFunc_SearchNPCbyOrgID( Player , 114083, range , 0)       --���j��
--		local door6 = LuaFunc_SearchNPCbyOrgID( Player , 114084, range , 0)       --���j��

		SetFlag( Player  , 543406 , 1 ) -- ���ѽT�w�ѥ[(�K�O)
		SetFlag( Player  , 543573 , 1 ) -- �j�N���_�i�椤
		SetFlag( Player  , 543497 , 0 ) --�R �F�|����
		DelBodyItem( Player , 203038 , 30 ) --�R �����ťN��
		WriteRoleValue(Player , EM_RoleValue_Register+9, 0)
		WriteRoleValue(Player , EM_RoleValue_Register+8, 0)

		mika_losttreasure_objdel()   --���W������.�Ǫ�
		mika_losttreasure_objborn()  -- ���ͷs������
		mika_losttreasure_mosterborn(Player) -- ���ͩҦ��Ǫ�
		BeginPlot( Player, "lua_mika_ResetColdown_trasure01" , 0 )    -- �M���k�N��CD�ɶ�
		BeginPlot( Player, "lua_mika_losttreasure_count" , 0 )    -- --�ɶ��˼�

		-----  �}�j��------
		local doorkey = { 543491, 543492, 543493, 543494, 543495, 543496 }
		local doorlist = {113620, 114086, 114082, 114085 , 114083, 114084 }
		for i = 1,  #doorkey do
			local door = LuaFunc_SearchNPCbyOrgID( Player , doorlist[i], range , 0)       --���j��
			if CheckFlag(Player, doorkey[i] ) == true then
				PlayMotion(door, 145) 
			end
		end

		sleep(10)
		ScriptMessage( OwnerID() ,  TargetID(), 1, "[SC_LOSTTREASURE_20]" , C_SYSTEM )  --�j���w�g�}�ҡA�Цb�ɭ����I�U3�y��O��F�������_�w�a�I
		ScriptMessage( OwnerID() ,  TargetID(), 0, "[SC_LOSTTREASURE_20]" , C_SYSTEM )  --�j���w�g�}�ҡA�Цb�ɭ����I�U3�y��O��F�������_�w�a�I
		ClockOpen( TargetID() ,EM_ClockCheckValue_7, 600 ,600,0,"Lua_mika_losttreasure_chanzone","Lua_mika_losttreasure_timeup") --10���� �˼ƭp�ɾ�  (�᭱����өI�s�禡�G "���Ϯ���"�A"�ɶ���ɩI�s�禡")
		AddBuff( TargetID() , 505278 , 1, 900)  --15����
		Sleep(1)
		AddBuff(TargetID() , 505279 , 1, 900)  --15����  
		Sleep(1)
		AddBuff( TargetID() , 505280 , 1, 900)  --15���� 
		Sleep(1)
		AddBuff( TargetID() , 505281 , 1, 900)  --15����

end

--del �Ҧ��W������
function mika_losttreasure_objdel()  --�M������
	local NPC = OwnerID()
	--�R����
	local TempObj = {113614,114117,114118,113615,113616,114310,114080,113617,113618,113619,114079,114081,101699,101700,101701,101702}
	for i = 1 ,table.getn(TempObj) do
		Lua_DavisDelObj(TempObj[i])
	end
--	Say(NPC, "del all obj and monster")
end

-- ���ͩҦ�����
function mika_losttreasure_objborn()
	local NPC = OwnerID()
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn1" , 0 )  --�ͦB�V��x1
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn2" , 0)  --�ͦB�V��x2
	BeginPlot (NPC, "Lua_mika_losttreasure_iceborn3" , 0 )  --�ͦB�V��x3
	BeginPlot (NPC, "Lua_mika_losttreasure_cureborn" , 0 )  --�Ͳb����x
	BeginPlot (NPC, "Lua_mika_losttreasure_stoneborn" , 0 )  --�۪ͥ�
	BeginPlot (NPC, "Lua_mika_losttreasure_desborn" , 0 )  --�ͩR�B���l
	BeginPlot (NPC, "Lua_mika_losttreasure_hallborn" , 0 )  --�Ͷ¬}
--	Say(NPC, "obj born")
end

-- ���ͩҦ��Ǫ�
function mika_losttreasure_mosterborn(Player)
	local NPC = OwnerID()
--	Say(Player, "Player")
	Callplot(NPC, "mika_LostTreasure_dog", Player )
	Callplot(NPC, "mika_LostTreasure_Soldier", Player )
	Callplot(NPC, "mika_LostTreasure_Arrow", Player )
	Callplot(NPC, "mika_LostTreasure_Boss1", Player )
--	Say(NPC, "Monster born")
end