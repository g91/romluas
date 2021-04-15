function LuaQ_420291_Accept()
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40)
	Say( OwnerID() ,GetString("SAY_110268_0") ) --/*�ڳo�ӪB�ͩҦb���a������K�A�ڥs�@���T�ɱa�A�L�h�C
	sleep( 20 )
	--�o�̴���Z�ਭ���ʧ@
	Say( OwnerID() ,GetString("SAY_110268_1") ) --/*���B�S��
	local DOG = CreateObjByFlag( 100143 , 780037 , 0 , 1)
	SetRoleCamp( DOG , "SNPC" )
	SetPlot( DOG , "touch" , "LuaFunc_Obj_BUSY" , 40)
	AddToPartition( DOG , 0 )
	FaceObj( DOG , OwnerID())
	sleep( 50 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG )--�o�̴���Z�ۤU���ʧ@
	Say( OwnerID() ,GetString("SAY_110268_2") ) --/*���B�S�A�a�o��B�ͥh�ڭ̪����K�}�ޡC
	sleep( 10 )
	Say( DOG ,GetString("SAY_110268_3") ) --/*�L�I�L�I
	BeginPlot( TargetID() , "LuaQ_420291_LeadA" , 0 )
	--�o�̴���Z�ਭ�^���쪺�ʧ@
	SetPlot( OwnerID() , "touch" , "" , 0)
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420291_LeadA()
	local DOG = LuaFunc_SearchNPCbyOrgID( TargetID() , 100143 , 100 )
	BeginPlot( DOG , "LuaQ_420291_LeadB" , 0 )
end
-------------------------------------------------------------------------------------------------------------
function LuaQ_420291_LeadB()

	local FlagID	= 780037;	-- FlagID	���|�X�l�s�եN��
	local Flag	= 0;	-- Flag		���|�X�l�N��
	local Owner	= Role:new( OwnerID() ) 	-- OwnerID()	�O�@�� NPC	
	local DBID	= ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 	

	while 1 do
		if( LuaFunc_MoveToFlag( OwnerID(), FlagID , Flag ,0 ) == true and LuaFunc_PlayerCheck( TargetID() , DBID) == true ) then
			-- ��F�ƥ��I 1			
			if( Flag == 0 ) then
			
				Say(OwnerID(),GetString("SAY_110268_3")) --/*�L�I�L�I
				sleep( 30 )	
			end
			

			-- �ˬd�O���O����I�F
			if( Flag == 10 ) then
				
				Say(OwnerID(),GetString("SAY_110268_3")) --/*�L�I�L�I
				local Check = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110270 , 150, 1 ) 
				local Check2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100040 , 150, 1 ) 
				if Check[0] == -1 and Check2[0] == -1 then
					local Bull = CreateObjByFlag( 110270 , FlagID , 11 , 1)
					AddToPartition( Bull , 0 )
					SetPlot( Bull , "touch" , "LuaFunc_Obj_BUSY" , 40)
					BeginPlot( Bull , "LuaQ_420291_Friend" , 0 )
					sleep( 30 )
				 	LuaFunc_MoveToFlag( OwnerID(), FlagID , 9 ,0 )
				end
				--�����j��	
				break;
				
			end		
			--�i���U�@��FLAG
			Flag = Flag+1;
		else
			break
		end
	
		-- ����O���� 	
		sleep( 1 );
	end
	DelObj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------------
function LuaQ_420291_Friend()
	MoveToFlagEnabled( OwnerID(), false );
	WriteRoleValue( OwnerID() ,EM_RoleValue_IsWalk , 1  )
 	LuaFunc_MoveToFlag( OwnerID(), 780037 , 10 ,0 )
	Sleep( 20 )
	SetPlot( OwnerID() , "touch" , "" , 0)
	sleep( 300 )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 40)
 	LuaFunc_MoveToFlag( OwnerID(), 780037 , 11 ,0 )
	sleep( 20 )
	DelObj( OwnerID() )	
end
-----------------------------------------------------------------------------------------------------------
function LuaS_110270_0()

	if CheckFlag( OwnerID() , 540213 ) == false and CheckFlag( OwnerID() , 540796 ) == false and CheckCompleteQuest( OwnerID() , 420291 ) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110270_0") );		--/*�A���Z�S�s�����Į����F�o�Ө��˪����Y�H�A�L��A��ĵ�٤]���P�F�U�ӡA�b�A�J���[��F����A�A�o�{�L���˶դ�A�Q�����Y���\�h�A�o���ħA�ܽT�w��L���˶ըèS������ĥΡC
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110270_0") , "LuaS_110270_2" , 0 )		--/*�۫H�L���ͩR�O�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_110270_1") , "LuaS_110270_1" , 0 )		--/*���F�o�Ӥ��Y�H�A�����L���h�W�C
	else		
		LoadQuestOption( OwnerID() )
	end
	
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_EXIT()
	CloseSpeak(OwnerID())
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_1()
	CloseSpeak(OwnerID())
	BeginPlot(TargetID() , "LuaS_110270_Fight" , 0 )
end
------------------------------------------------------------------------------------------------------------
function LuaS_110270_2()
	CloseSpeak(OwnerID())
	SetFlag( OwnerID() , 540796, 1 )
end
-------------------------------------------------------------------------------------------------------------
function LuaS_110270_Fight()
	local n =0
	local O = OwnerID() 
	local T = TargetID() 

	Hide( O )
	local Bull = LuaFunc_CreateObjByObj ( 100633 , O )
	SetPlot( Bull ,"Dead" , "LuaS_110270_Dead" , 40 )
	SetAttack( Bull , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- ���L�a�j��
			ScriptMessage( TargetID(), TargetID(), 0, "�L�a�j��", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "�X�k�j��", 0 )
		end
		if ReadRoleValue( Bull , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Bull ) == true then  --�ˬd�O�_���}�԰�
			sleep(60)	-- �����ˬd�@��	
		else
			if CheckID( Bull ) == true then
				DelObj( Bull )
			end 
			sleep( 60 )
			break
		end
	sleep(1)
	end

	sleep( 300 )
	Show( O , 0 )

end
-------------------------------------------------------------------------------------------------------------
function LuaS_110270_Dead()
	if CheckFlag(TargetID(),540213) == false and CheckFlag( OwnerID() , 540796 ) == false and CheckCompleteQuest(TargetID(),420291) == true then
		SetFlag( TargetID() , 540213 , 1 )
	end
end
-------------------------------------------------------------------------------------------------------------
