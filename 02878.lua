-----------------------------------------------------------------------------
--Z25_�ʧ@��
-----------------------------------------------------------------------------
---�K�����]�Ʈ���
function LuaM_107486_casting()---���i�y
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
end
-----------------------------------------------------------------------------
---�K�����g����
function LuaM_107487_attack()---�ܫ�
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(40)
end
-----------------------------------------------------------------------------
---���㪺���ؤ��]
function LuaM_107488_cast01()---�q�s
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
--	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_INSTANT)    
--	Sleep(40)
	
end
-----------------------------------------------------------------------------
---���s�Ȱ�B
function LuaM_107539_buff_sp()---½�u
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(40)
	
end

function LuaM_107539_cast()---�ܫ�
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP02)
	Sleep(30)

end
-----------------------------------------------------------------------------
---���������
function LuaM_107489_attack()---�ܫ�
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---�ոˤ�����
function LuaM_107490_attack()---����
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---���d�Ψ����
function LuaM_107498_buff01()---������
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(30)
	
end

function LuaM_107498_buff02()---�ڳ�
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---���L�s�~
function LuaM_107127_cast()---��������
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	
end
-----------------------------------------------------------------------------
---���l�۹���
function LuaM_107513_attack()---���� 31
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	
end

function LuaM_107513_buff()---
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)--��� 20
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)--���~ 161
	
end

function LuaM_107513_cast()-----���� 31 �o�g 164
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	
end
-----------------------------------------------------------------------------
---�p���Ԥh
---�Ť�,��ȯ��S��
function LuaM_107566_01()---���x�ާ@��
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)--�ާ@ 131
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)--����ާ@ 133
	
end

function LuaM_107566_02()---�ۤU
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)--�ۤU
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)--�_��
	
end

function LuaM_107566_03()---���x����
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)--�ާ@ 131
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)--����ާ@ 133
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)--�ۤU
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)--�_��
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)--���Ծ��� 51
	Sleep(20)
	
end
--�M��
function LuaM_107566_04_1()
	SetModeEx( OwnerID(), EM_SetModeType_Show, TRUE )--�X�{
	CastSpell( OwnerID(),OwnerID(),496116)
	Sleep(35)

end

function LuaM_107566_04_2()
	LuaP_RidingBlackHouse(OwnerID)--�W��

end

function LuaM_107566_04_3()
	DW_CancelTypeBuff(68,OwnerID())--�U��
	Sleep(10)
	CastSpell( OwnerID(),OwnerID(),496116)
	Sleep(35)
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )--����

end
