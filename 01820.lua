--============================================--
-- Z16�e�U����				 	--
--============================================--

function Lua_422939() --����:�ǷϪ��ժ� ���o:�ժ�
	SetPlot( OwnerID(), "touch", "Lua_422939_run", 20 )
end

function Lua_422939_run()
	BeginPlot( TargetID(), "Lua_422939_do", 0 )
end

function Lua_422939_do()
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	if CheckQuest( T_ID, 422939 , 0 ) == true then
		if CountBodyItem ( T_ID,  207167 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207167, 1, 150 ) -- ���a �������~ �ƶq �ɶ�(time = 0  �h��script������     time > 0 �htime�����ݭ��ͮɶ� )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207167 .."]]", 0 ) --XXX�ƶq�w�F�W���C
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end
---------------------------------------------------------------------

function lua_207345_give() --�@�ɤ� �M�l�N�J�i  ���o�j�Ѫ�����
	giveBodyItem( OwnerID(), 207166, rand(30)+20 )
end

---------------------------------------------------------------------


function Lua_423215() --����:�D���O�d�h�� ���o:�d�h��
	SetPlot( OwnerID(),"touch","Lua_423215_do",30 )
end

function Lua_423215_do()
	BeginPlot( TargetID(), "Lua_423215_Get", 0 )
end

function Lua_423215_create()	
	local FlagObjID = 780625 --�X�m����s�� --780625
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq43	
	local Obj = 115020 --�شӪ���s��
	local ObjNum = math.floor( FlagNum / 4 )   --�شӪ���ƶq
	local resetTime = 150 --���s�ɶ�(��)
	local Range = 20
	local Gravity = true --���O 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423215_Get()	
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	if CheckQuest( T_ID, 423215 , 0 ) == true then
		if CountBodyItem ( T_ID,  207168 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207168, 1, 0 ) -- ���a �������~ �ƶq �ɶ�(time = 0  �h��script������     time > 0 �htime�����ݭ��ͮɶ� )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207168 .."]]", 0 ) --XXX�ƶq�w�F�W���C
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end

--------------------------------------------------------------------

function Lua_422943() --����:��������� ���o:�ǷϤ��
	SetPlot( OwnerID(),"touch","Lua_422943_run",20 )
end

function Lua_422943_run()
	BeginPlot( TargetID(), "Lua_422943_do", 0 )
end

function Lua_422943_do()
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	if CheckQuest( T_ID, 422943 , 0 ) == true then
		if CountBodyItem ( T_ID,  207170 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207170, 1, 150 ) -- ���a �������~ �ƶq �ɶ�(time = 0  �h��script������     time > 0 �htime�����ݭ��ͮɶ� )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207170 .."]]", 0 ) --XXX�ƶq�w�F�W���C
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end
--------------------------------------------------------------------

function Lua_423217() --����:���������� ���o:�j�Ѥu���~
	SetPlot( OwnerID(),"touch","Lua_423217_do",20 )
end

function Lua_423217_do()
	BeginPlot( TargetID(), "Lua_423217_Get", 0 )
end

function Lua_423217_create()	
	local FlagObjID = 780659 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local Obj = 115047 --�شӪ���s��
	local ObjNum = math.floor( FlagNum / 4 )   --�شӪ���ƶq
	local resetTime = 150 --���s�ɶ�(��)
	local Range = 10
	local Gravity = true --���O 	

	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423217_Get()
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	if CheckQuest( T_ID, 423217, 0 ) == true then
		if CountBodyItem ( T_ID,  207187 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207187, 1, 0 ) -- ���a �������~ �ƶq �ɶ�(time = 0  �h��script������     time > 0 �htime�����ݭ��ͮɶ� )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207187 .."]]", 0 ) --XXX�ƶq�w�F�W���C
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end

--------------------------------------------------------------------

function Lua_422935() --����:�Υ��RNo.5���t�� ���o:�o���筻��
	SetPlot( OwnerID(), "touch", "Lua_422935_run", 20 )
	SetModeEx( OwnerID(),EM_SetModeType_Move, true ) 
	SetModeEx( OwnerID(),EM_SetModeType_Show,false) 
	SetModeEx( OwnerID(), EM_SetModeType_Mark , false )				-- �аO
end

function Lua_422935_1()
	local x= 0
	local NPC = SearchRangeNPC ( OwnerID() , 50 )
	for i=0,table.getn(NPC),1 do
		if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==115023	then
			x= x+1
		end
	end
	if	x > 3	then
		DelFromPartition(OwnerID())
		ReSetNPCInfo( OwnerID() )
		AddToPartition(OwnerID(),0)
		return
	end
	SetModeEx( OwnerID(),EM_SetModeType_Move, false ) 
	SetModeEx( OwnerID() , EM_SetModeType_Mark , true )				-- �аO
	SetModeEx(OwnerID(),EM_SetModeType_Show,true) 
end

function Lua_422935_run()
	BeginPlot( TargetID(), "Lua_422935_do", 0 )
end

function Lua_422935_do()
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	if CheckQuest( T_ID, 422935, 0 ) == true then
		if CountBodyItem ( T_ID,  207158 ) < 50 then
			CallPlot( O_ID, "ks_SquatGetItem", T_ID, 207158, 1, 150 ) -- ���a �������~ �ƶq �ɶ�(time = 0  �h��script������     time > 0 �htime�����ݭ��ͮɶ� )
		else
			ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" .. 207158 .."]]", 0 ) --XXX�ƶq�w�F�W���C
		end
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --�S���ŦX���e�U����
	end
end
--------------------------------------------------------------------

function Lua_423218() --����:���� ���o:Ī��
	SetPlot( OwnerID(),"touch","Lua_423218_run", 150 )
	local x = ReadRoleValue( OwnerID(), EM_RoleValue_X )+ rand(10)-5
	local y = ReadRoleValue( OwnerID(), EM_RoleValue_Y ) + rand(5)+5
	local z = ReadRoleValue( OwnerID(), EM_RoleValue_Z )+ rand(10)-5
	MoveDirect( OwnerID(), x, y, z)
end

function Lua_423218_create()	
	local FlagObjID = 780658 --�X�m����s�� 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local Obj = 115044 --�شӪ���s��
	local ObjNum = math.floor( FlagNum / 4 )   --�شӪ���ƶq
	local resetTime = 150 --���s�ɶ�(��)
	local Range = 20
	local Gravity = false --���O 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423218_run()
	BeginPlot( TargetID(), "Lua_423218_do", 0 )
end

function Lua_423218_do()
	local O_ID = OwnerID()	--�I������
	local T_ID = TargetID()	--���a
	local require = 207192	 --����
	local item = 207164  	-- Ī��
	local num = 1 		--�ƶq
	cancelBuff( T_ID , 506709 ) --�M����_����buff
	CastSpell( T_ID, T_ID, 495596 ) --���W��_����buff
	sleep(5)
	if CountBodyItem( T_ID, require ) > 0 and CheckQuest( T_ID, 423218 , 0 ) == true then	--�ˬd���L����
		if CheckBuff( T_ID, 506709 ) == true then --�ˬd�O�_�b��a
			if CountBodyItem( T_ID, item ) < 50 then
				if GetDistance( O_ID, T_ID ) > 40 then --�ˬd�Z���O�_�L��					
					if ReadRoleValue( O_ID, EM_RoleValue_Register3 ) == 1 then
						ScriptMessage( O_ID, T_ID, 1, "[SYS_AUCTION_WAIT_NEXT]", 0 )	--���L���A�еy�ԦA�աC
					else 
						WriteRoleValue( O_ID, EM_RoleValue_Register3, 1 )
						BeginCastBar( T_ID, "[SC_423218]", 50 , ruFUSION_ACTORSTATE_FISHING_CAST, ruFUSION_ACTORSTATE_FISHING_REEL, 0 )--����			
						AttachCastMotionTool( T_ID, 212402 ); --CastingBarĲ�o���\�A�m���Z��������
						while true do
							sleep(5)
							local CastBarStatus = CheckCastBar( T_ID )
							if ( CastBarStatus > 0) then
								GiveBodyItem( T_ID, item, num )	
								BeginPlot( O_ID, "ks_CreateObj_reset", 0 )	
								EndCastBar( T_ID, CastBarStatus )
								break
							elseif ( CastBarStatus < 0 ) then 
								WriteRoleValue( O_ID, EM_RoleValue_Register3, 0 )			
								EndCastBar( T_ID, CastBarStatus )
								break
							end					
						end
					end			
				else
					ScriptMessage( O_ID, T_ID, 1, "[WARRING_TARGET_TOO_CLOSE]",0) --�Z���ؼФӪ�
				end
			else
				ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_ITEM][$SETVAR1=" .."[" ..item .."]]", 0 ) --XXX�ƶq�w�F�W���C
			end			
		end
	else
		ScriptMessage( O_ID, T_ID,1,"[SC_SQUATGETITEM][$SETVAR1=" .."["..require.."]] [SC_Z16_OR] [SC_Z16_REQUIRE]",0) --�A���W�S��XXX �Ϊ� �S���ŦX���e�U����
	end
end

--------------------------------------------------------------------

function Lua_423223() --����:�`�̪���ū ���o:�`�̪��L�� �ݨD:����
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_IDLE_DEAD)	
end

function Lua_423223_start()
	BeginPlot( TargetID(), "Lua_423223_do", 0 )	
	return 1
end

function Lua_423223_save()
	DW_QietKillOne( 0, 103851 ) 
end

function Lua_423223_do()
	local target = TargetID()	 --���a
	local owner = OwnerID()	 --����
	local require = 207189	 --����
	local objType
	local obj = { }
	obj[115509] = { [0] = 115050; [1] =  103852 }--�H��
	obj[115510] = { [0] = 115493; [1] =  103916 }--�H��
	obj[115512] = { [0] = 115491; [1] =  103918 }--���H
	obj[115515] = { [0] = 115492; [1] =  103917 }--��H
	obj[115516] = { [0] = 115497; [1] =  103923 }--�\�H

		 
	if CountBodyItem ( target, require ) > 0 then
		local fire = LuaFunc_CreateObjByObj ( 115049, owner )
		SetModeEx( fire , EM_SetModeType_Mark	, false )
		sleep(10)
		objType = ReadRoleValue( owner, EM_RoleValue_OrgID )
		local rnd = rand(2)
		local ghost = LuaFunc_CreateObjByObj( obj[objType][rnd], owner )
		Sleep(5)
		MoveToFlagEnabled ( ghost, false )
		AdjustFaceDir( ghost, target, 0 )		
		sleep(10)
		if rnd == 0 then
			tell( target, ghost, "[SC_422981_50]")
			BeginPlot( target, "Lua_423223_save", 0 )
			sleep(20)
			DelObj( ghost )
		elseif rnd == 1 then
			BeginPlot( ghost, "LuaS_Discowood_CheckPeace", 0 ) --8.5�����i�J�԰����A�N�|����
		end
		DelObj( fire )
		CallPlot( owner, "LuaFunc_ResetObj", owner )
	else
		ScriptMessage( owner, target, 1, "[SC_SQUATGETITEM][$SETVAR1=" .."["..require.."]".."]",0) --�A���W�S��XXX
	end
end
--------------------------------------------------------------------

function Lua_423221() --�@�Ϩ�����
	LoadQuestOption(OwnerID())
	AdjustFaceDir( TargetID(), OwnerID(), 0 ) --�Ϧۤv���V�ؼ�
	if CountBodyItem ( OwnerID(), 207172 ) > 0 and ReadRoleValue( TargetID(), EM_RoleValue_PID ) ==0 then --�V�媺�_��
		AddSpeakOption( OwnerID(),TargetID(),"[SC_423221_0]","Lua_423221_key",0) --���_�͵��L
	end	
end

function Lua_423221_create()	
	local FlagObjID = 780612 --�X�m����s��
	local Obj = {	115046,
			115166,
			115500,
			115502,
			115503,
			115505	} --�شӪ���s��

	local FlagNum = GetMoveFlagCount( FlagObjID ) --�X�m�ƶq	
	local ObjNum = math.floor( FlagNum / 3 )  +2 --�شӪ���ƶq
	local resetTime = 150 --���s�ɶ�(��)
	local Range = 20
	local Gravity = true --���O 
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end

function Lua_423221_key()
	DisableQuest( TargetID() , true)
	WriteRoleValue( TargetID(), EM_RoleValue_PID, 1 )
	SetSpeakDetail( OwnerID(), "[SC_423221_1" ..rand(4) .."]") -- �H���^�� 
	BeginPlot( TargetID(),  "Lua_423221_do", 0 )
end

function Lua_423221_do()
	Sleep(20)
	DW_QietKillOne( 1, 103855 ) 
	DelBodyItem ( TargetID(), 207172, 1 ) 
	CloseSpeak( TargetID() )
	BeginPlot( OwnerID(), "ks_CreateObj_reset", 0 )
end


---------------------------------------------------------------------

