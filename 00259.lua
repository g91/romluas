--ù�}��
function LuaQ_420060_Complete()

	MoveToFlagEnabled( OwnerID(), false );	--�������޼@��-ù�}��
	sleep(20);
	WaitMoveTo( OwnerID(), 3118, 23, 5574);		--���ʨ���w�y��
	sleep(20);
	SAY( OwnerID(), "�i�c���Τl�A�q�q�����I");
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN );	--ù�}������u�@���ʧ@
	Sleep(50);

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_END);	--ù�}�������u�@���ʧ@
	Sleep(20);

	MoveToFlagEnabled(  OwnerID(), true);	--�}�Ҩ��޼@��-ù�}��
End