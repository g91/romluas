
-- �饻�t�Ӭ��� BLOOD-C Tie-up ����

-- ���ʼ��y§�]�}��
function lua_mika_jpbloodc_bag01()
	local OID = OwnerID()
	local ItemID = 720033
	GiveBodyItem(OID, ItemID, 1 )
end


function lua_mika_jpbloodc_bag02()
	local OID = OwnerID()
	local ItemID = 720034
	GiveBodyItem(OID, ItemID, 1 )
end

function lua_mika_jpbloodc_bag03()
	local OID = OwnerID()
	local ItemID = 720035
	GiveBodyItem(OID, ItemID, 1 )
end


-- �饻�t�Ӭ���  BLOOD-C Tie-up ����

-- ���b�����Ǫ����`�@���W
--���a�����Ǫ���, ��ۤv�I�k��obuff lv +1 (����ܪk�N)
function lua_mika_jpbloodc_score()
	local OID = OwnerID()  -- monster 
	local TID = TargetID()   -- Player

	BeginPlot(TID, "lua_mika_jpbloodc_score2" , 0)
end

function lua_mika_jpbloodc_score2()
	local OID = OwnerID()  -- player

	CastSpell(OID, OID, 499652 )  --  ��o����BUFF  , ��������  507607
--	Say(OID, "Kill 1")
end

-- ���եΰ򥻪k�N ����@�� �����L��
function lua_mika_jpbloodc_test01()
	local TID = TargetID()
	CancelBuff(TID, 507610 )  -- �M��Buff
	say(TID, "del Buff")
end

-- ��OID�W�L�k�Q�v����buff
function lua_mika_jpbloodc_test02()
	local OID = OwnerID()
	AddBuff(OID, 507609, 0,  -1 )   
end

-- ��b����buff�C2���ˬd�P������range  
function lua_mika_jpbloodc_rangecheck()
	local OID = OwnerID()
	local timer = 0
	local limittime = 1200  -- 20��
	local range = 350
	
	local NPC = LuaFunc_SearchNPCbyOrgID( OID , 119567 , range+200 , 0 ) --�H����-�����ߡA�V�P��N�X�j�M�S�wIDNPC
	local dis = GetDistance(OID, NPC )
--	say(OID, "Test - dis ="..dis)

	if  dis >= range then  -- �W�L0 
		ScriptMessage( OID , OID , 1 , "[SC_BLOODC_MSG02]" , 0 )   --�A�w����U[103019]�C
		ScriptMessage( OID , OID , 0 , "[SC_BLOODC_MSG02]" , 0 )   
		CancelBuff(OID , 507607 )  -- Del ���ʧޯ�buff
	elseif dis >= (range-80) then
		ScriptMessage( OID , OID , 1 , "[SC_BLOODC_MSG01]" , 0 )   -- �A�Y�N���}���a�A����U[103019]�I
		ScriptMessage( OID , OID , 0 , "[SC_BLOODC_MSG01]" , 0 )   
	end

end

--function lua_mika_testmsg_0830()
--	local OID = OwnerID()
--	ScriptMessage( OID, 0, 2 , "123abc" , C_SYSTEM )
--end