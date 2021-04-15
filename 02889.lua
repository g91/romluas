--========================================================
--				�ǰeNPC��ܼ@��
--========================================================
function Lua_jiyi_116716_talk() 	--�ǰeNPC��ܼ@��
	local Player = OwnerID() 	--���a
	local Npc = TargetID() 
	local GameFlag = 548009	--����ʤO_�w����
	local Buff = 624164		--���WBUFF

	if CheckFlag( Player , GameFlag ) == true then	--�p�G���a�w�g��L���y
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_01]" )   
	elseif CheckBuff( Player , Buff ) == true then		--���a���w���WBUFF
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_02]" )	--�n�쬡�ʳ��a��?
		AddSpeakOption( Player , Npc , "[SC_2013TWISTPOWER_116716_03]" , "Lua_jiyi_116716_talk02" , 0 )	--�n
	else 
		SetSpeakDetail( Player , "[SC_2013TWISTPOWER_116716_04]" )	--������(�]�t�ѻ����ʳ��W�ɬq�B���ʶ}�l�ɶ�)
		AddSpeakOption( Player , Npc , "[SC_2013TWISTPOWER_116716_05]" , "Lua_jiyi_116716_talk02" , 0 )	--�h�ݬ�	
	end
	CloseSpeak( Player )	
end

function Lua_jiyi_116716_talk02()
	local Player = OwnerID()	--���a
--	Say( Player ,"good luck to me" )
	CloseSpeak( Player )		
	SetPos( Player , 2125.3 , 67.4 , 1924 , 0 )	--�ǰe���a
end
----------------------------------------------------------------------------���ó��~�Ǽ@��
function Lua_jiyi_121397_HideNpc()--���b����NPC�����󲣥ͼ@��
	local Owner = OwnerID() 
	local NPC = SearchRangeNPC( Owner , 400 )
	local OrgID = { 100212 , 100211 }	--�¥ֽ� , ���g�T
	CallPlot( Owner , "Lua_twist_power_reminder" )
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID[1] or ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == OrgID[2] then
			DelFromPartition( NPC[i] )
		end
	end
	LuaN_miyon_action02() --��NPC�`�y�лx
end

function GM_twist_power_delete()
	local me = AddyPlayer:new(OwnerID())
	local npc_amount = SetSearchAllNPC(me.room_id)
	for index = 1, npc_amount do
		local npc = AddyNpc:new(GetSearchResult())
		if npc.ORGID == 103890 or	-- ��q����
		   npc.ORGID == 121108 or 	-- ���ʽd���]�k�}
		   npc.ORGID == 121109 or 	-- �෽�˸m��y
		   npc.ORGID == 121479 or 	-- �෽����
		   npc.ORGID == 121991 or 	-- �෽�Ť�y
--		   npc.ORGID == 121992 or 	-- �N�o�Ť�y
--		   npc.ORGID == 103357 or 	-- �p���Ԥh 
--		   npc.ORGID == 103358 or  	-- �p���Ԥh
--		   npc.ORGID == 103359 or 	-- �p���Ԥh
--		   npc.ORGID == 103030 or	-- ���j���ʭx��
--		   npc.ORGID == 103031 or	-- ���㪺�u��
--		   npc.ORGID == 103362 or	-- �������u��
		   npc.ORGID == 121992 then	-- �N�o�Ť�y
			npc:delete()
		end
	end
end
----------------------------------------------------------------
function Lua_jiyi_twistpower_DeleteBuff()
	local Player = OwnerID() 
	local Buff = { 501308 , 501309 , 501477 , 501568 , 501569 }
	
	for i = 1 , 5 do
	--	Say( Player , "Buff="..Buff[i] )
		CancelBuff( Player , Buff[i] )
	end
end
-------------------------------------------------------------
function Lua_jiyi_twistpower_CheckId()
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --Ū���ؼЪ��~ID
	local Crystal = 103899 
	if TOrgID == Crystal then	 
		return true
	else 
		return false
	end
end