--�ĤH�ޯ�.���a�ޯ�

--�˦��ޯ�� --���a
function Lua_mika_losttreasure_godie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
end

function Lua_mika_losttreasure_goup()
	PlayMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
end

---------------------------------------------------------------------------------------------
-- 2011.08.16  [4.0.3�W�[] �ٸ����i�t�� ���ȱ���@��
--�k�N���X-> �򥻪k�N

-- ����-NPC  �����`�F�� 106281
function lua_mika_losttreasure_skillplot01()
	local npcid = 106281
	local id = ReadRoleValue( TargetID(), EM_RoleValue_OrgID )
--	say(OwnerID(), id )
	if id == 101701 then
		DW_QietKillOne( OwnerID(), npcid )
	end
end

------------------------------------------------------------------------------------

--2013.09.27 �s�W�Ǫ��I�k���ˬd���a�O�_�b�˦������A�A���ץ��i�קK���a�L�k�Ѱ����`�ʺA�����D

function Lua_na_355_check_die() --�s�W�b�k�N 505961 ���ϥ��ˬd���
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckBuff( Target , 505297 ) == true then
		return FALSE
	end
end