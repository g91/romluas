Function LuaQ_420101_Complete()

--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_BUSY", 40); --NPC��t����w
	
	local M =  LuaFunc_SearchNPCbyOrgID( OwnerID() ,110053 ,300 );	--�q��������m�M��̩Ԩ�
	sleep ( 30);
--	setplot( M, "touch" , "LuaFunc_Obj_BUSY", 40);	--NPC��t����w
	
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_WAVE );	--��������
	BeginPlot( M , "LuaQ_420101_Complete_B" , 30 )
	sleep( 200 )
--	setplot( OwnerID(), "touch" , "", 40);	--�Ѱ���w
--	setplot( M, "touch" , "", 40);	--�Ѱ���w


End

Function LuaQ_420101_Complete_B()
	
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 0 )

	FaceObj( OwnerID(), TargetID() );  	--�̩Ԩȭ��V����
 	sleep (100);

	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_HURT );	--�̩ԨȪ�t�ʧ@
	sleep(60);
	--PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_LAUGH );  �̩ԨȪ�t�����ʧ@�A�ثe�L���ʧ@
	
	MoveToFlagEnabled( OwnerID() , true )	
end