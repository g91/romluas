------------------------------------------- ���u -------------------------------------------

function LuaYU_111813_003()   --���u  --OwnerID() ���a
	BeginPlot( TargetID() , "LuaYU_111813_003_UU" , 0 )  
end

function LuaYU_111813_003_UU()   --���u  --OwnerID() ���a
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

       --int BeginCastBarEvent ( int iObjID, int iClickObjID, const char* pszString, int iTime, int iMotionID, int iMotionEndID, int iFlag, const char* pszLuaEvent )  �s��CastingBar
       --                                     �]  �}bar��  ,    �Q�}��           ,       Bar�W����r   ,        �һݮɶ�   ,  �}�l�ʧ@     ,  �����ʧ@             , ���_�Ҧ�  ,  �s���ƥ� �^
	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_003_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function LuaYU_111813_003_UU_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --�����Q���}��
			--------------------------------------------------------------------------------------
			-- 2011.08.11  ����-NPC  �������_�a�j  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			WriteRoleValue( T_ID , EM_RoleValue_Register+7 , PlayerLV )   --�������a����
			BeginPlot( T_ID , "LuaYU_111813_Bob" , 0 )  
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end


function LuaYU_111813_Bob()   
	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7  )  
	local P = 100
	local XX = Rand( P )    
	local magicid = {492453, 850865, 850866}  -- �p���u ,�����u, �j���u

	if XX > 40 and XX <= 100 then   --60%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_17]".. "|r" , 0 ) --���A�A�A�A��O��[101486]�r�I�A�A�A�A��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_17]".. "|r" , 0 ) --���A�A�A�A��O��[101486]�r�I�A�A�A�A��
		local Bob = LuaFunc_CreateObjByObj ( 101486 , OwnerID() ) --�p���u
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[1] )   -- �p���u�k�N
		sleep(10)
		Delobj(Bob)

	elseif XX <= 40 and XX > 10 then  --30%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_18]".. "|r" , 0 ) --���A�A�A�A��O��[101487]��I�A�A�A�A��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_18]".. "|r" , 0 ) --���A�A�A�A��O��[101487]��I�A�A�A�A��
		local Bob = LuaFunc_CreateObjByObj ( 101487 , OwnerID() ) --�����u
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[2] )   -- �����u�k�N
		sleep(10)
		Delobj(Bob)
	else --10%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_19]".. "|r" , 0 ) --���A�A�A�A��O��[101488]��I�A�A�A�A��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_19]".. "|r" , 0 ) --���A�A�A�A��O��[101488]��I�A�A�A�A��
		local Bob = LuaFunc_CreateObjByObj ( 101488 , OwnerID() ) --�j���u
		SetFightMode(  Bob , 0, 0, 0, 0 )
		sleep(25)
		CastSpell( Bob, Bob, magicid[3] )   -- �j���u�k�N
		sleep(10)
		Delobj(Bob)

	end
end

------------------------------------------- �Ǫ� -------------------------------------------

function LuaYU_111813_004()   --�Ǫ�  --OwnerID() ���a
	BeginPlot( TargetID() , "LuaYU_111813_004_UU" , 0 )  
end

function LuaYU_111813_004_UU()   --�Ǫ�
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_004_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function LuaYU_111813_004_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )

			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --�����Q���}��
			--------------------------------------------------------------------------------------
			-- 2011.08.11  ����-NPC  �������_�a�j  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			Callplot( T_ID , "LuaYU_111813_Monster" , PlayerLV )  
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_Monster(PlayerLV)   --��
	local stone = OwnerID() -- �۪O
	local stone_x = ReadRoleValue(stone, EM_RoleValue_X)
	local stone_y = ReadRoleValue(stone, EM_RoleValue_Y)
	local stone_z = ReadRoleValue(stone, EM_RoleValue_Z)
	local stone_dir = ReadRoleValue(stone, EM_RoleValue_dir)
	local RoomID = ReadRoleValue(stone, EM_RoleValue_RoomID )
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end
--	Say(Player, "1 PlayerLV = "..PlayerLV )
--	Say(Player, "1 MonsterLV = "..MonsterLV )

	--�䪱�a
	local PlayerID = 0
	local Obj
	local Count = SetSearchAllPlayer(RoomID)
	if Count ~= 0 then
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsPlayer() == True then
				PlayerID = ID
			end
		end	
	end

	local Ma = 101271 --�u�@�C�h  (��26�H�U��)
 	local Mb = 101270 --�u�@�äh (��26�H�U��)
	local Mc = 101272 --�g�ɴc�]�C�h (��26�H�U��)

	local P = 100
	local XX = Rand( P )    

	if XX > 40 and XX <= 100 then   --60%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_21]".. "|r" , 0 ) --���A�A�A�A��A��[101271]���ʦL���Ѱ��F�r�I�A�A�A�A��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_21]".. "|r" , 0 ) --���A�A�A�A��A��[101271]���ʦL���Ѱ��F�r�I�A�A�A�A��
	--	local Monster = LuaFunc_CreateObjByObj( Ma , OwnerID() ) --�u�@�C�h

		local Monster =  CreateObj( Ma, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
		SetModeEx( Monster    , EM_SetModeType_Strikback, true )--����
		SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Monster    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Monster    , EM_SetModeType_Move, true )--����
		SetModeEx( Monster    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( Monster    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Monster , EM_SetModeType_Fight , true )--�i�������
		MoveToFlagEnabled( Monster , false )   	       --�}�������޼@��
		AddToPartition( Monster, RoomID )	--�����󲣥�  
		AddBuff( Monster ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )

	elseif XX <= 40 and XX > 5 then  --35%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_20]".. "|r" , 0 ) --���A�A�A�A��A��[101270]���ʦL���Ѱ��F�r�I�A�A�A�A��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_20]".. "|r" , 0 ) --���A�A�A�A��A��[101270]���ʦL���Ѱ��F�r�I�A�A�A�A��

		local Monster =  CreateObj( Mb, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
		SetModeEx( Monster    , EM_SetModeType_Strikback, true )--����
		SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Monster    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Monster    , EM_SetModeType_Move, true )--����
		SetModeEx( Monster    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( Monster    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Monster , EM_SetModeType_Fight , true )--�i�������
		MoveToFlagEnabled( Monster , false )   	       --�}�������޼@��
		AddToPartition( Monster, RoomID )	--�����󲣥�  
		AddBuff( Monster ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )

	else --5%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --���A�A�A�A��O[101272]�I�A�~�M�Ѱ��F�L���ʦL�I���M���ѥL�����o�D�`�}�������~�A�����U�A�٬O�]�a�I
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_22]".. "|r" , 0 ) --���A�A�A�A��O[101272]�I�A�~�M�Ѱ��F�L���ʦL�I���M���ѥL�����o�D�`�}�������~�A�����U�A�٬O�]�a�I

		local Monster =  CreateObj( Mc, stone_x, stone_y, stone_z, stone_dir, 1 )
		WriteRoleValue( Monster , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
		SetModeEx( Monster    , EM_SetModeType_Strikback, true )--����
		SetModeEx( Monster    , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Monster    , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Monster    , EM_SetModeType_Mark, true )--�аO
		SetModeEx( Monster    , EM_SetModeType_Move, true )--����
		SetModeEx( Monster    , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( Monster    , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Monster , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( Monster , EM_SetModeType_Fight , true )--�i�������
		MoveToFlagEnabled( Monster , false )   	       --�}�������޼@��
		AddToPartition( Monster, RoomID )	--�����󲣥�  
		AddBuff( Monster ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		SetAttack( Monster , PlayerID  )
	end
end

------------------------ �S�F�� ------------------------ 

function LuaYU_111813_005()   --�S�F��   --OwnerID() ���a
	BeginPlot( TargetID() , "LuaYU_111813_005_UU" , 0 )  
end

function LuaYU_111813_005_UU()   --�S�F��
	local O_ID = OwnerID() --�a�O
	local T_ID = TargetID()  --���a

	if BeginCastBarEvent( T_ID, O_ID,"[SC_111813_YU_25]", 50, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYU_111813_005_UU_1" ) ~= 1 then
		ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
		return
	else
		AttachCastMotionTool( T_ID, 210508 ); --CastingBarĲ�o���\�A�m���Z��������
	end
end

function LuaYU_111813_005_UU_1( ObjID, CheckStatus )

	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- �a�O

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			SetPlot( T_ID,"touch","",0 )
			local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 
			SetModeEx( T_ID  , EM_SetModeType_Mark, false )--�аO
			SetModeEx( T_ID  , EM_SetModeType_HideName, true )--�W��
			Hide(T_ID)
			Show(T_ID , RoomID )
			PlayMotionEX( T_ID, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --���򼽩�145    146
			WriteRoleValue( T_ID , EM_RoleValue_Register , 1 )   --�����Q���}��

			--------------------------------------------------------------------------------------
			-- 2011.08.11  ����-NPC  �������_�a�j  106272
				local npcid = 106272
				DW_QietKillOne(OwnerID(), npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local PlayerLV = ReadRoleValue( O_ID , EM_RoleValue_LV  )  
			WriteRoleValue( T_ID , EM_RoleValue_Register+7 , PlayerLV )   --�������a����
			BeginPlot( T_ID , "LuaYU_111813_Nothing" , 0 )  
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_111813_Nothing()   --�S�F��
	local P = 100
	local XX = Rand( P )    
	local magicid = { 492458, 492456, 492457 }   --  ���� (�v��) ����(�˦a+����) �Ŧ�(�[�t)

	if XX >= 60 and XX < 100 then   --40%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_23]".. "|r" , 0 ) --���A�A�A�A��S�F��C��n�a�A�������A�v���@�U�n�F��
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_111813_YU_23]" , 0 ) --���A�A�A�A��S�F��C��n�a�A�������A�v���@�U�n�F��
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492458 )        --����
	elseif XX > 20 and XX <= 60 then   --40%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_26]".. "|r" , 0 ) --���A�A�A�A��S�F��C��n�a�A���N�~�A�@�U�n�F��
		ScriptMessage( OwnerID() , -1 , 0 , "|cffff00ff" .."[SC_111813_YU_26]".. "|r" , 0 ) --���A�A�A�A��S�F��C��n�a�A���N�~�A�@�U�n�F��
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492456 )        --����
	else--20%
		ScriptMessage( OwnerID() , -1 , 1 , "|cffff00ff" .."[SC_111813_YU_24]".. "|r" , 0 ) --���A�A�A�A��S�F��C��n�a�A�������A�[�t�@�U�n�F��
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_111813_YU_24]" , 0 ) --���A�A�A�A��S�F��C��n�a�A�������A�[�t�@�U�n�F��
		Callplot( OwnerID() , "LuaYU_111813_curestaff" , 492457 )        --�Ŧ�
	end

end

function LuaYU_111813_curestaff(magicid)   --��
	local staffnolight = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101472, 300 , 1)       -- ���o���]��
	local staff = LuaFunc_CreateObjByObj ( 101273 , staffnolight[0] )   -- �o���]��

	SetModeEx( staff    , EM_SetModeType_Mark, false )--�аO
	SetModeEx( staff    , EM_SetModeType_HideName, true )--�W��
	SetModeEx( staff   , EM_SetModeType_ShowRoleHead, false )--�Y����
--	AddToPartition( staff, RoomID) 	
	SetFightMode(  staff , 0, 0, 0, 0 )

	CastSpell( staff ,  staff , magicid)
	sleep(30)		
	Delobj(staff)
end