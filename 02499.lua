function LuaQ_DR_Z21PESTART()		--PE�}�l
	local player = TargetID()
	local OID = OwnerID()
	--say(player ,"i am target")
--	SetFlag(player,545555,1)
	SetFlag(player,545559,1)
	SetFlag(player,545561,1)
	SetFlag(player,545563,1)
	Lua_ZonePE_3th_GetScore(100)

end

function LuaQ_DR_Z21PE01()		--�X�v���O
	local player = TargetID()
	local OID = OwnerID()
--	SetFlag(player,545556,1)
--	DelBodyItem(player,545555,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE02()		--�ѱϧ���
	local player = TargetID()
	local OID = OwnerID()
--	SetFlag(player,545557,1)
--	DelBodyItem(player,545556,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE03()		--���ѭ���
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545558,1)
--	DelBodyItem(player,545557,1)
	Lua_ZonePE_3th_GetScore(210)
end

function LuaQ_DR_Z21PE04()		--���īy����
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545560,1)
	DelBodyItem(player,545559,1)
	Lua_ZonePE_3th_GetScore(400)
end

function LuaQ_DR_Z21PE05()		--�߶������b
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545562,1)
	DelBodyItem(player,545561,1)
	Lua_ZonePE_3th_GetScore(350)
end

function LuaQ_DR_Z21PE06()		--��R���W�o
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545563,1)
	Lua_ZonePE_3th_GetScore(200)
end

function LuaQ_DR_Z21PE07()		--�Z���e�e
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545559,1)
	DelBodyItem(player,545560,1)
	Lua_ZonePE_3th_GetScore(100)
end



function LuaQ_DR_Z21PE09()		--�t�o�ɵ�
	local player = TargetID()
	local OID = OwnerID()
	SetFlag(player,545561,1)
	DelBodyItem(player,545562,1)
	Lua_ZonePE_3th_GetScore(150)
end