function LuaQ_420583_Complete()
	DisableQuest( OwnerID() , true )
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 0 then
		WriteRoleValue( OwnerID() , EM_RoleValue_PID , 50 )
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_SIT_END ) --��NPC���_��
		sleep( 30 )
	end
	Say( OwnerID() , GetString("SAY_110254_0") ) --/*�ڭn�}���o�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_EAT)
	sleep( 30 )
	Say( OwnerID() , GetString("SAY_110254_1") ) --/*�ڡ�u�O�����I
	DisableQuest( OwnerID() , false )
end
------------------------------------------------------------------------------------------------------------
function LuaS_110255_0()
	if CheckCompleteQuest( OwnerID(),420282) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110255_0")   );
		--/*�~�M�S�Q�A�ݨ�ک��˦b����F�A�u���y......
	elseif CheckCompleteQuest( OwnerID(),420583) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110255_1")   );
		--/*�u�O�P�§A���ڧ�K���L�ӡI
	else
		SetSpeakDetail( OwnerID(), GetString("ST_110255_2")   );
		--/*......�ڤ���F......�ڦn�j��......
	end

	LoadQuestOption( OwnerID() )

end
--------------------------------------------------------------------------------------------------------------------------
function LuaS_110255_1()

	local FlagID	= 780034;	-- FlagID	���|�X�l�s�եN��
	local Flag	= 0;	-- Flag		���|�X�l�N��
	local Owner	= Role:new( OwnerID() ) 	-- OwnerID()	�O�@�� NPC	
	local DBID	= ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 

	DisableQuest( OwnerID() , true ) --����NPC���o��������L�H������
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )

	if ReadRoleValue( OwnerID() , EM_RoleVAlue_PID) == 0 then
		PlayMotion(OwnerID() , ruFUSION_ACTORSTATE_SIT_END ) --��NPC���_��
		sleep( 30 )
	end
	while 1 do
		if Luafunc_Player_Alive( TargetID(),DBID,100 ) == false or ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			break
		end		
		if( LuaFunc_MoveToFlag( OwnerID(), FlagID , Flag ,0 ) == true and LuaFunc_PlayerCheck( TargetID() , DBID) == true ) then
			-- ��F�ƥ��I 1			
			if( Flag == 0 ) then
				AdjustDir( OwnerID(), -100 )--���ਭ���ʧ@
				Say(OwnerID(),GetString("SAY_110255_0")) 
				--/*�A�ݨ��Ӵ˪L�A���N�O���쨦���˪L�A�̭����ܦh���ͪ��ʪ��C
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)
				sleep( 30 )
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_1"))
				--/*��M�]�����W�����H�ա���Y�H�ա㵥�����Ǫ��Ať���˪L�̲`�B���@�Ӥ��Y�H�������A�ܦh�_�I�̳��Q�h���̫_�I�A���L�ڥi���Q�h����Y�H�����\�ڡI������
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				sleep( 30 )
			end
			
			-- ��F�ƥ��I 2
			
			if( Flag == 4 ) then
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_2")) 
				--/*�A���D�ܡH�o���㥪���s�D�O���`�M�h�Φb��W���e���ɭԶ}�w���Ať�����ӮɭԥX�����Q�ڮ�����b�o�̷N�~��͡A�ҥH�N�ΥL���W�r�өR�W�C
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)			
				sleep( 30 )
				Say(OwnerID(),GetString("SAY_110255_3")) 
				--/*���ڭ̥X�o��������[�������񥻨Ӧ��L�������O�O�I�u�O���e�n���Q�g�����W�����H�}�a���F�A�{�b���b���סC
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
				sleep( 30 )					
			end
	
			-- ��F�ƥ��I 3
			
			if( Flag == 6 ) then
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_4")) 
				--/*�A���D�ڭ̭n�h�������ҥ�����O���˪��a��ܡH���ӯ��ܻ��o�өǦW�r�O�Ĥ@�ӥ���������Ө�o�̮ɥ��Q�����n���A���G�j�a�N��o�Ӧa����s�����ҡC
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)				
				sleep( 30 )
				Say(OwnerID(),GetString("SAY_110255_5")) 
				--/*�����I�����H���Q�����n������_�ǡH���L�����Ҫ��T�O�Ӧ��쪺�a��A���ӥH������T���|���o�Ӥp������S���A�S�Q��Ϧӱa�Ӥ@��_�I�a�M�Ǫ̡A�ϥ��ܱo���c�a�O�I
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_LAUGH)				
				sleep( 30 )		
			END
			
			--��F�ƥ��I4
			
			if( Flag == 8 ) then 
				AdjustDir( OwnerID(), -110 )--���ਭ���ʧ@			
				Say(OwnerID(),GetString("SAY_110255_6")) --/*�ݨ�F�ܡH�����զ⪺�a�V�I�b���U���N�O�����ҥ�����o�I
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_POINT)				
				sleep( 30 )
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_7")) --/*ť�������զ⪺�a�V���O���令���A�ҥH�s�������C�W�����@��ܥ��j�����e�A�`�B�O�B������P�k���ҩ~���a��A�ڴ��g�e�ɵ��~�쳷���h�L�A���u���O�H���a��ڡI
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)				
				sleep( 30 )				
			end
				
			--��F�ƥ��I5
			if( Flag == 11 ) then 
				--���ਭ���ʧ@
				AdjustFaceDir( OwnerID(), TargetID(), 0 )
				Say(OwnerID(),GetString("SAY_110255_8")) --/*�ש��F�A���ڥ��h���o�I�A���֥h��ڭ����a�I
				PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SALUTE)				
				sleep( 30 )
				WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
				if CountBodyItem( TargetID() , 200736 ) == 0 then
					GiveBodyItem( TargetID() , 200736 , 1 )
				end					
			end	
			-- �ˬd�O���O����I�F
			if( Flag == 12 ) then

				--�����j��	
				break;
				
			end		
			--�i���U�@��FLAG
			Flag = Flag+1;		
		end
	
		-- ����O���� 	
		sleep( 1 );
	end

	DisableQuest( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	LuaFunc_ResetObj( OwnerID() )
end
-------------------------------------------------------------