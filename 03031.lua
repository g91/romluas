--z27�G�m=======================================
--=======================================
function Lua_PG_BanishtheCat()	--�X�v���^
	local NPC = OwnerID()
	local Target = SearchRangeNPC( NPC, 70 )	
	local Num = table.getn(Target)		
	local OrgID
	local j
--	NPCSay(Ya, Percent)

	for i = 0,Num do
		OrgID = ReadRoleValue(Target[i], EM_RoleValue_OrgID)
			if OrgID == 107908 then
				j=i
				break
			end
	end

	if OrgID == 107908  then
		PlayMotion(NPC, ruFUSION_ACTORSTATE_ATTACK_1H)
		NPCSay(NPC, "[SC_Z27_DC_01]")
		Sleep(25)
		MoveToFlagEnabled(NPC, true)
	end
end

--z28�G�m=======================================
--=======================================
function Lua_PG_Z28_NPC_1()			--�K�H�H���s
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
--	NPCSay(NPC, "[SC_Z28_DC_1]")	--�j�ٰ��M�I
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_LAUGH)
--	NPCSay(NPC, "[SC_Z28_DC_2]")	--���ڭ̧⤣�n�������̡I�ֵ��_�ð��ۡI
	for  i=1,3 do
		PlayMotion(NPC,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Sleep(10)
	end
end

----------------------------------------------------------------------
--�j�n�s��
function Lua_PG_Z28_NPC_2()
	SetPlot( OwnerID(), "range", "Lua_PG_Z28_NPC_2_1", 50 )
end

function Lua_PG_Z28_NPC_2_1()
	local Player=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand(2)
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and Num==1 then
		CallPlot( NPC, "Lua_PG_Z28_NPC_2_2", NPC, Player )
	end
end

function Lua_PG_Z28_NPC_2_2( NPC, Player )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	AdjustFaceDir( NPC, Player, 0 )
	local Num = DW_Rand(3)
	NpcSay( NPC, "[SC_Z28_DC_"..(Num+2).."]" )	
	--3. �o�̪��ӫ~�����ɦ��I
	--4. �n�F����b�o�I���L���L�d�U���n���L�I
	--5. ���n�[�ޡI�R��n�F��A���A�M�_��K�Q�I
	Sleep(25)
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
end

----------------------------------------------------------------------
--�p���֦�
function Lua_PG_Z28_NPC_3()
	local NPC = OwnerID()
	local RandAct = {}
	RandAct[1] = ruFUSION_ACTORSTATE_EMOTE_IDLE1
	RandAct[2] = ruFUSION_ACTORSTATE_EMOTE_IDLE2
	local Num = DW_Rand(2)
	PlayMotion(NPC, RandAct[Num])
end

----------------------------------------------------------------------
--���[�s��
function Lua_PG_Z28_NPC_4()
	local NPC = OwnerID()

	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	NPCSay(NPC, "[SC_Z28_DC_6]")	--��
end

----------------------------------------------------------------------
--���n
function Lua_PG_Z28_NPC_5()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_7]")	--��p�l�I�O�H���ڤ����b�o�̰ʤ�I
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSay(NPC, "[SC_Z28_DC_8]")	--�ڥu�O������@�ӭ��l�I
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_9]")	--�~���A�J��N�妺�A�I
	Sleep(25)
end

function Lua_PG_Z28_NPC_6()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_10]")	--�u�Ѹ�v��U�G�M���O�ǡu�p��v�C
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSay(NPC, "[SC_Z28_DC_11]")	--�S�����ٴ��j�n�C
	Sleep(25)
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	NPCSay(NPC, "[SC_Z28_DC_12]")	--���p�X�����}�q�W�a�I
	Sleep(25)
end