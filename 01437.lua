function LuaYu_Mala2_firesite_01() -- ����U�N�F
	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_firesite_01_2" , 20 )   --
end

function LuaYu_Mala2_firesite_01_2() 
	BeginPlot( TargetID() , "LuaYu_Mala2_firesite_02" , 0 )  
end

function LuaYu_Mala2_firesite_02()   
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a

--	say(O_ID, "OID 1")
--	say(T_ID, "TID 1")
	local Torch =  CountBodyItem( T_ID , 203025 )    --�i�U������
	local FireTorch =  CountBodyItem( T_ID , 203026 )    --�U�N������

	if Torch == 0 and FireTorch == 0 then
		ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_46]" , C_SYSTEM )  --�K�������K���������U�N�ۡC
	elseif FireTorch >= 1 then
		ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_47]" , C_SYSTEM )  --�A��W�ҫ�������N�O�Ҧ��i�U�����׵��̡C
	else
		-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
		if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
			if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYu_Mala2_firesite_03" ) ~= 1 then
				ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
				return
			else 
			--	say(T_ID, "test")
				AttachCastMotionTool( T_ID, 211968 ); --�m���Z�����i�U������
			end
		end
	end
end

function LuaYu_Mala2_firesite_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			if EmptyPacketCount( O_ID ) >= 1  and QueuePacketCount( O_ID ) == 0 then	
				 AttachCastMotionTool( O_ID, 211969 ); --�m���Z�����i�U������
				GiveBodyItem( O_ID , 203026  , 1 )  
				DelBodyItem( O_ID , 203025 , 1 )
			else
				ScriptMessage( O_ID , O_ID , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
			end
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_firesite_test1()
	local O_ID = OwnerID() -- ���a
	AttachCastMotionTool( O_ID , 212076 ) -- �N�Z���m�����Ť�
	GiveBodyItem( O_ID , 203025  , 1 )  
end

--************************************************************************************--���

function LuaYu_Mala2_treecut_01() -- ���
	SetCursorType( OwnerID() , eCursor_Fell ); --����ܦ� ���
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_treecut_01_1" , 50 )   --
end

function LuaYu_Mala2_treecut_01_1() 
	BeginPlot( TargetID() , "LuaYu_Mala2_treecut_02" , 0 )  
end

function LuaYu_Mala2_treecut_02()
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a

--	say(O_ID, "OID tree")
--	say(T_ID, "TID tree")
	local Torch =  CountBodyItem( T_ID , 203025 )    --�i�U������
	local FireTorch =  CountBodyItem( T_ID , 203026 )    --�U�N������

	if CheckBuff( T_ID , 502864 ) == false then  -- ��ʸT��BUFF
		if Torch >= 1 then  -- �� �i�U������
			-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 15, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_1" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
					return
				else
					AttachCastMotionTool( T_ID, 210509 ); --�m���Z�������Y
				end
			end
		elseif FireTorch >= 1 then   -- ���U�N������
			ScriptMessage(T_ID, T_ID , 1 , "[SC_113120_MALA2_49]" , C_SYSTEM )  --�A�N���ⴧ�V�K�F�A�����I�U�L�C

			-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_2" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
					return
				else
					AttachCastMotionTool( T_ID, 211969 ); --�m���Z��������
				end
			end
		else
			-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
			if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
				if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_treecut_03_3" ) ~= 1 then
					ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
					return
				else
				AttachCastMotionTool( T_ID, 210509 ); --�m���Z�������Y
				end
			end
		end
	end
end

function LuaYu_Mala2_treecut_03_1( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����

--	say(O_ID, "OID 2")
--	say(T_ID, "TID 2")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_48]" , C_SYSTEM )  --�Ӱ�w�F�I���G�L�k�A������K�F�C
		
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03_2( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����

--	say(O_ID, "OID 3")
--	say(T_ID, "TID 3")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			
			DelBodyItem( O_ID , 203026  , 1 )   
			SetPlot( T_ID ,"touch",  "" , 30 )
			BeginPlot( T_ID , "LuaYu_Mala2_treecut_03" , 0 )    --�}�l�N��
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_50]" , C_SYSTEM )  --�P�������a�U�N�F�_�ӡC
		
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03_3( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����

--	say(O_ID, "OID 4")
--	say(T_ID, "TID 4")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			AttachCastMotionTool( O_ID, 211968 ); --�m���Z�����i�U������
			GiveBodyItem( O_ID , 203025  , 1 )  
			ScriptMessage(O_ID, O_ID , 1 , "[SC_113120_MALA2_51]" , C_SYSTEM )  --���M�ý��ӹL��T�A��L�ġA���]��o�F�@��[203025]�C�i�U���ý��K�F
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_treecut_03()
	local O_ID = OwnerID() -- ���� �ý�
	local T_ID = TargetID()  -- ���a
--	say(O_ID, "OID 5")
--	say(T_ID, "TID 5")

	local RoomID = ReadRoleValue( T_ID ,EM_RoleValue_RoomID) 

	--------------------------------------------------------------------------------------
	-- 2011.08.15  ����-NPC  �N�������ý�	106276
	local npcid = 106276
	DW_QietKillOne( T_ID, npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

	AddBuff( O_ID ,503990 ,1 , 3 ); --�U�N
	PlaySound( O_ID , "sound\\fx\\skill\\fire\\act_flame01_c_hand.wav", false )
	sleep(30)
	CancelBuff( O_ID ,503047 )
	SetModeEx( O_ID , EM_SetModeType_Obstruct, false )--����
	BeginPlot( O_ID , "LuaP_Dead" , 0 )   
	PlaySound( O_ID , "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	sleep(15)
	Delobj( O_ID )
end


--************************************************************************************--KEY

function LuaYu_Mala2_keyget_01() -- KEY
	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"touch",  "LuaYu_Mala2_keyget_01_1" , 50 )   --
	SetPlot( OwnerID() , "dead", "LuaYu_KEYfloor_dead",0 )   
end

function LuaYu_Mala2_keyget_01_1()
	BeginPlot( TargetID() , "LuaYu_Mala2_keyget_02" , 0 )  
end


function LuaYu_Mala2_keyget_02()
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a

--	say(O_ID, "OID key 1")
--	say(T_ID, "TID key 1")
	-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then
		if BeginCastBarEvent( T_ID, O_ID,"[SC_113120_MALA2_85]", 30, ruFUSION_ACTORSTATE_MINING_BEGIN, ruFUSION_ACTORSTATE_MINING_END, 0, "LuaYu_Mala2_keyget_03" ) ~= 1 then
			ScriptMessage( T_ID, T_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else
			AttachCastMotionTool( T_ID, 211865 ); --�m���Z�����S�Y
		end
	end
end

function LuaYu_Mala2_keyget_03( ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- OBJ

--	say(O_ID, "OID key 2")
--	say(T_ID, "TID key 2")
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			--------------------------------------------------------------------------------------
			-- 2011.08.15  ����-NPC ��o�_�ä��_	106278
			local npcid = 106278
			DW_QietKillOne(O_ID, npcid )
			--	say(OwnerID(), "kill id = "..npcid )
			--------------------------------------------------------------------------------------

			local GetKeys = ReadRoleValue( O_ID ,EM_RoleValue_PID) --�������a��oKEY��			
			ScriptMessage(O_ID, -1 , 1 , "[SC_113120_MALA2_52]" , C_SYSTEM )  --�A��o�F�@�⯫����KEY�C
			ScriptMessage(O_ID, -1 , 0 , "[SC_113120_MALA2_52]" , C_SYSTEM ) 
			GiveBodyItem( O_ID , 203027  , 1 )  
			WriteRoleValue( O_ID  , EM_RoleValue_PID , GetKeys+1 )   --�W�[KEY��

			BeginPlot( T_ID , "LuaYu_Mala2_keyget_04" , 0 )  
		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYu_Mala2_keyget_04()
	local O_ID = OwnerID()  -- key

--	say(O_ID, "KEY dead 1")
	SetPlot( O_ID ,"touch",  "" , 40 )  
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 

	SetModeEx( O_ID , EM_SetModeType_Obstruct, false )--����
	SetModeEx( O_ID  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( O_ID , EM_SetModeType_Fight , false )--�i�������
	BeginPlot( O_ID , "LuaP_Dead" , 0 )   
	sleep(15)
--	local Key = LuaFunc_CreateObjByObj ( 112959 , OwnerID() )

--	SetModeEx( Key  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
--	SetModeEx( Key , EM_SetModeType_Obstruct, false )--����
--	SetModeEx( Key  , EM_SetModeType_Mark, true )--�аO
--	SetModeEx( Key   , EM_SetModeType_Move, false )--����
--	SetModeEx( Key  , EM_SetModeType_Searchenemy, false )--����
--	SetModeEx( Key   , EM_SetModeType_HideName, false )--�W��
--	SetModeEx( Key , EM_SetModeType_ShowRoleHead, false )--�Y����
--	SetModeEx( Key , EM_SetModeType_Fight , false )--�i�������

--	SetPlot( Key ,"touch",  "LuaYu_KEYfloor_thekey" , 30 )
	Delobj( O_ID )
end

function LuaYu_KEYfloor_dead()

	SetPlot( OwnerID() ,"touch",  "" , 40 )  

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	local Player = SearchRangePlayer( OwnerID() , 300 )


	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
	SetModeEx( OwnerID()  , EM_SetModeType_Mark, false )--�аO
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������

	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   

	local Key = LuaFunc_CreateObjByObj ( 112959 , OwnerID() )  -- �_�������~

	SetModeEx( Key  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( Key , EM_SetModeType_Obstruct, false )--����
	SetModeEx( Key  , EM_SetModeType_Mark, true )--�аO
	SetModeEx( Key   , EM_SetModeType_Move, false )--����
	SetModeEx( Key  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( Key   , EM_SetModeType_HideName, false )--�W��
	SetModeEx( Key , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( Key , EM_SetModeType_Fight , false )--�i�������

	SetPlot( Key ,"touch",  "LuaYu_KEYfloor_thekey" , 30 )

	Delobj( OwnerID() )


end

function LuaYu_KEYfloor_thekey()
--OwnerID() ���a
--TargetID() NPC
	SetPlot( TargetID() ,"touch",  "" , 30 )

	local GetKeys = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --�������a��oKEY��			
	ScriptMessage(OwnerID(), -1 , 1 , "[SC_113120_MALA2_52]" , C_SYSTEM )  --�A��o�F�@�⯫����KEY�C
	ScriptMessage(OwnerID(), -1 , 0 , "[SC_113120_MALA2_52]" , C_SYSTEM ) 
	GiveBodyItem( OwnerID() , 203027  , 1 )  

	WriteRoleValue( OwnerID()  , EM_RoleValue_PID , GetKeys+1 )   --�W�[KEY��
	Delobj( TargetID() )
end




--***********************************************************************************  ����

function LuaYU_Mala2_fire()--�}��
	SetCursorType( OwnerID() , eCursor_Interact ); --����ܦ� ����
	SetPlot( OwnerID() ,"touch",  "LuaYU_Mala2_fire_1" , 30 )
end

function LuaYU_Mala2_fire_1()
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()    -- ����

	BeginPlot( TargetID() , "LuaYU_Mala2_fire2" , 0 )  
end

function LuaYU_Mala2_fire2()--�}��
	local O_ID = OwnerID() --����
	local T_ID = TargetID()  --���a

--	say(O_ID, "OID bomb 2")
--	say(T_ID, "TID bomb 2")

	-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
	if Lua_Hao_Check_SetPlot_Touch( T_ID ) == false then

		if CheckBuff( T_ID , 501570) == false then  --�W�[�ˬd�P�_
			AddBuff(T_ID , 501570,0,-1); --�M�ᵹ��BUFF
			AddBuff( T_ID , 502864 ,1 ,-1 ); --�w��BUFF
		--	say(T_ID, "TID bomb 123")

			MoveToFlagEnabled( T_ID, false )
			DialogCreate( T_ID , EM_LuaDialogType_YesNo ,"[SC_113120_MALA2_53]") --�O�_�˸m�����F���ؼСH
			DialogSelectStr( T_ID , "[SC_GETTITLE_1]" );
			DialogSelectStr( T_ID , "[SC_CANCEL]" );
			if( DialogSendOpen( T_ID ) == false ) then 
				ScriptMessage( T_ID, T_ID, 1,"[SYS_FIXEQ_DATA_ERROR]",0)	
				--��ưe�X�����D
				return
			end
			for i = 0 , 1000 , 1 do
				Sleep( 1 );
				SelectID = DialogGetResult( T_ID );
				if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 1000 then
					if ( SelectID == 0 ) then--�T�{

						WriteRoleValue(  T_ID  , EM_RoleValue_Register+8 ,  O_ID ) --�O���x
						Beginplot( T_ID ,"LuaYU_Mala2_fire3", 0 )	
						SetPlot( O_ID ,"touch",  "" , 0 )
						CancelBuff( T_ID, 501570 );--�̫�M��BUFF
						DialogClose( T_ID )
					--	say(T_ID, "TID bomb go 0 ")
						break;
					elseif ( SelectID == 1 ) then
						CancelBuff( T_ID, 501570 );--�̫�M��BUFF
						DialogClose( T_ID )
						CancelBuff( T_ID, 502864  ) --�w��	
					--	say(T_ID, "TID bomb go 1 ")	
						break
					end
				elseif i == 1000 then
					CancelBuff( T_ID, 501570 );--�̫�M��BUFF
					DialogClose( T_ID )
					CancelBuff( T_ID, 502864  ) --�w��
				--	say(T_ID, "TID bomb go 1000 ")		
					break

				elseif ( SelectID == -1 ) then
					CancelBuff( T_ID, 501570 );--�̫�M��BUFF
					DialogClose( T_ID )	
					CancelBuff( T_ID, 502864  ) --�w��
				--	say(T_ID, "TID bomb go -1 ")	
					break
				end
			end
		else
			ScriptMessage( T_ID , T_ID , 0, "[SC_WINDOW_OPENED]", 0 );
		end	
	end
end

function LuaYU_Mala2_fire3()--�}��
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- OBJ

--	say(O_ID, "OID bomb 3")
--	say(T_ID, "TID bomb 3")

	ScriptMessage( O_ID  , -1  , 1 , "[SC_113120_MALA2_54]" ,0 ) -- �п�ܬ�����m�C
	ScriptMessage( O_ID  , -1  , 0 , "[SC_113120_MALA2_54]" ,0 ) 
--	local Firetool = ReadRoleValue( O_ID, EM_RoleValue_Register+8) --����

	-- 2013. 03. 05  6.0.0 �ק� ���I�k�����A��, �L�k�I���t�~�@�Ӫ���
	if Lua_Hao_Check_SetPlot_Touch( O_ID ) == false then
		if BeginCastBarEvent( O_ID, T_ID,"[SC_113120_MALA2_85]", 10, ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE, ruFUSION_ACTORSTATE_EMOTE_SALUTE, 0, "LuaYU_Mala2_fire4" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
			return
		else
		--	SetCursorType( Firetool , eCursor_Interact ); --����ܦ� ����
		--	SetPlot( Firetool ,"touch",  "LuaYU_Mala2_fire2_1" , 30 )
			SetCursorType( T_ID , eCursor_Interact ); --����ܦ� ����
		--	SetPlot( T_ID ,"touch",  "LuaYU_Mala2_fire2_1" , 30 )
		--	say(T_ID, "TID bomb 3_1")
		end
	end
end

function LuaYU_Mala2_fire4(ObjID, CheckStatus )
	local O_ID = OwnerID() -- ���a
	local T_ID = TargetID()  -- ����

--	say(O_ID, "OID bomb 4")
--	say(T_ID, "TID bomb 4")

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );

			AdjustFaceDir( O_ID , T_ID , 90 ) --���V
			AddBuff( O_ID ,503988 ,1 ,-1 ); --�����l��BUFF
			Say( O_ID, " [SC_113120_MALA2_78]") --���u��R����
			SetPlot( T_ID ,"touch",  "" , 0 )
		else
			-- ����
		--	Say( O_ID, " false")  -- ���եΰT��
			CancelBuff( O_ID, 502864  ) --�w��
			SetPlot( T_ID ,"touch",  "LuaYU_Mala2_fire_1" , 30 )
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

------------------------------------------   2013 .06��X�ק�즹����  ------------------------------------------ 

function LuaYU_Mala2_fire5()--���u�@��  OwnerID�BTargetID �w���ؼ�(�b�Y)

--	Say( OwnerID() ," OwnerID " ) --���a
--	Say( TargetID() ," TargetID " ) --�n�F�����ؼ�

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( TargetID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( TargetID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( TargetID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( TargetID() , EM_RoleValue_Dir ) 

	if CheckBuff(  OwnerID() , 503988 ) == true then

		local TARGETGLOD = CreateObj( 113115 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
		AddToPartition( TARGETGLOD , RoomID )  
		SetModeEx( TARGETGLOD  , EM_SetModeType_Gravity, false )--���O
		SetModeEx( TARGETGLOD   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( TARGETGLOD  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( TARGETGLOD , EM_SetModeType_ShowRoleHead, false )--�Y����

		WriteRoleValue( TARGETGLOD  , EM_RoleValue_Register ,  OwnerID()  ) --�O���a

		BeginPlot( TARGETGLOD , "LuaYU_Mala2_fire6" , 0 )   

		CancelBuff( OwnerID() , 503988  ) --��������BUFF

	end

end

function LuaYU_Mala2_fire6()--���w�����ؼЫ�@��

	local Player = ReadRoleValue( OwnerID() ,EM_RoleValue_Register ) --���a
	local Firetool = ReadRoleValue( Player ,EM_RoleValue_Register+8) --����

	AdjustFaceDir( Player, OwnerID() , 0 ) --���V
	sleep(10)
	PlayMotion( Player , 109)  --�����V�e
	Say(Player , " [SC_113120_MALA2_77]")
	sleep(5)
	AdjustFaceDir( Firetool, OwnerID() , 0 ) --���V
	sleep(5)
	PlaySound( Firetool, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlayMotion( Firetool, 161)  --Buff0

	sleep(15)

	CastSpelllv( OwnerID() , OwnerID() , 493655 , 1 )

	--------------------------------------------------------------------------------------
	-- 2011.08.12  ����-NPC  �ϥΤ����}�a�ڰ� 106275
	local npcid = 106275
	DW_QietKillOne(Player, npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

--	sleep(5)
	PlaySound( OwnerID(), "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
	PlaySound( OwnerID(), "sound\\fx\\skill\\physical\\act_berserk_c_freeze_hit.mp3", false )
	sleep(30)
	CancelBuff( Player , 502864  ) --�w��
--	CancelBuff( Player , 503988  ) --��������BUFF
	Delobj(  Firetool )
	Delobj(  OwnerID() )

--	
end

function LuaYu_Mala2_skilllimit() -- ����i�ϥβ��δ��v

	local ZoneID = ReadRoleValue(OwnerID() ,EM_RoleValue_ZoneID )

	local Building_Code = ReadRoleValue( TargetID() ,EM_RoleValue_Register+1) --�j���ؿv��

	if ( ZoneID == 353 ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --���i�A�ƥ��ϥ�
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --���i�A�ƥ��ϥ�

		return false

	elseif ( ZoneID == 402 ) or ( ZoneID == 31 ) then

		if Building_Code == 38 then --�ӥؼЬ��j���ؿv��
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --���i�A�ƥ��ϥ�
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_MAGICSTRING_14]" , C_SYSTEM )  --���i�A�ƥ��ϥ�

			return false
		else
			return true
		end
	else
		return true
	end

end


--*************************************************************************************************--�T�D	

function LuaYu_Mala2_ghost_01() --  ���ͤp������
	local door = OwnerID()  -- ��Ť���
	local PlayerID = ReadRoleValue( door , EM_RoleValue_Register  )  --���a
	local RoomID = ReadRoleValue( door ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( door , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( door , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( door , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( door , EM_RoleValue_Dir ) 

	local PlayerLV = ReadRoleValue( PlayerID , EM_RoleValue_LV  )  
	local MonsterLV 
		if PlayerLV <= 4 then
			MonsterLV = 5
		else
			MonsterLV = PlayerLV - (PlayerLV%5)
		end

	AddBuff( door ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)

	local ghostid= 102369 -- LV 15 ��
	local ghost = CreateObj( ghostid , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	WriteRoleValue( ghost , EM_RoleValue_LV , MonsterLV )	-- �]�w�Ǫ�����
	AddToPartition( ghost , RoomID )  
	AddBuff( ghost ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(10)
	SetAttack( ghost , PlayerID )
 
	WriteRoleValue(  door , EM_RoleValue_PID ,  ghost ) --�O��p������
	WriteRoleValue(   ghost , EM_RoleValue_PID ,  door ) --�O���Ť���

	SetPlot( ghost , "dead","LuaYu_Mala2_ghost_02",0 )  -- �p������ ���`�@�� 

end

function LuaYu_Mala2_ghost_02() --�p�Ǧ��`�@��  OwnerID = �p����
	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_PID)    -- ��Ť���
	WriteRoleValue(   door , EM_RoleValue_PID ,  0 ) --��Ť���pid�M��
	BeginPlot( Door , "LuaYu_Mala2_ghost_01" , 0 )     -- ���A���ͤp��

end

function LuaYu_Mala2_ghost_03() --�O���Ť��� ���`�@��   OwnerID = ��Ť���

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local Ghost = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --�p������

	Delobj( Ghost )

	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
	Delobj( OwnerID() )

end

--*************************************************************************************************--�ǰe��

function LuaYu_Mala2_Door_01() -- OwnerID�ǰe��

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
--	local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  

--	Say(OwnerID() ,  "PlayerLV=".. PlayerLV)
--	Say(OwnerID() ,  "ghost=".. ghost)


	while true do
		sleep(10)
		local ghostNeer = LuaFunc_SearchNPCbyOrgID( OwnerID() , 102369, 30 , 1)
	
		if CheckID( ghostNeer[0] )== true then
			for j = 0 ,table.getn( ghostNeer)  do
				BeginPlot( ghostNeer[j] , "LuaYu_Mala2_Door_02" , 0 )  	
			end
		end
	end
end

function LuaYu_Mala2_Door_02() -- �Ǫ���X�@��  OwnerID=�Ǫ�

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
	SetFightMode( OwnerID() , 0, 0, 0, 0 )
	BeginPlot( OwnerID() , "LuaP_Dead" , 0 )   
	SetModeEx( OwnerID()  , EM_SetModeType_Show , false )--���

	BeginPlot( OwnerID() , "LuaYu_Mala2_ghost_reset" , 0 )  

end

function LuaYu_Mala2_ghost_reset() -- �Ǫ���X�@��  OwnerID=�Ǫ�

	local Door = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local GhostID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID  ) 

	WriteRoleValue(  Door , EM_RoleValue_PID ,  GhostID ) 

	BeginPlot( Door , "LuaYu_Mala2_ghost_reset_2" , 0 )   

	Delobj( OwnerID() )


end

function LuaYu_Mala2_ghost_reset_2() -- �Ǫ���X�@��  OwnerID=Door

	sleep(150)

	local GhostID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) 
	local PlayerID = ReadRoleValue( OwnerID() , EM_RoleValue_Register  )  --���a

	sleep(30)
	local Newghost = LuaFunc_CreateObjByObj ( GhostID , OwnerID() )

	AddBuff( Newghost ,503993 ,1 , 1 ); --�ǰe�S��
	sleep(20)
	SetAttack( Newghost , PlayerID )

	WriteRoleValue(  OwnerID() , EM_RoleValue_PID ,  Newghost ) 
	WriteRoleValue(   Newghost , EM_RoleValue_PID ,  OwnerID() ) 

	SetPlot( Newghost , "dead","LuaYu_Mala2_ghost_02",0 )

end

function LuaYu_Mala2_Door_03() -- �⪱�a�ǥX�h
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	--------------------------------------------------------------------------------------
	-- 2011.08.15  ����-NPC  ��V�]�ۤ���	106277
	local npcid = 106277
	DW_QietKillOne(OwnerID(), npcid )
	--	say(OwnerID(), "kill id = "..npcid )
	--------------------------------------------------------------------------------------

	AddBuff( OwnerID() ,503993 ,1 , 1 ); --�ǰe�S��
	SetPosByFlag( OwnerID() , 780309 , 10 )--�ǰe�� X ���X�l
end