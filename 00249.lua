Function LuaI_110230()
	--SetPosture( OwnerID(), 32, ruFUSION_ACTORSTATE_SIT_BEGIN  )
	--sleep(30)
	--SetIdleMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_LOOP )	--���祧���槤�U�ʧ@
End

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function LuaS_110230_Complet()

--	setplot( OwnerID(), "touch" , "LuaFunc_Obj_BUSY", 40)	
	--LoadQuestOption( OwnerID() );  --���J���ȼҪO
	--sleep(10);
	--PlayMotion( TargetID(), ruFUSION_ACTORSTATE_SIT_END );		--���祧�������U�ʧ@
	--sleep(30);
	--Say( TargetID(), "���W�_���A�̤��򻡧ڴN�O������...");	--���祧�d��o��
	--MoveToFlagEnabled( OwnerID(), false);	--�������޼@��
	--Move( OwnerID(), 3591,-36,4053 );	--���ʨ���w�y��	
	--sleep(50);

	--Hide( OwnerID() );	--NPC����
	--sleep(50);
	--LuaFunc_ResetObj( TargetID() );		--���mNPC�@��
	
End
