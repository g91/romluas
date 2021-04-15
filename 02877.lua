--�D�u���ȡG426123�A�ү��箦���ܽШ�C
--�D�u���ȡG426124�A���s�ϩR
function lua_Z25Q426123_SZ()
	local player = OwnerID()
	if CheckAcceptQuest( player,426124 ) and CheckFlag( player,547722 )==false then
		SetSpeakDetail( player,"[SC_426124_1]" )
		AddSpeakOption( player,player,"[SC_426124_2]","lua_Z25Q426124_1",0 )
	else
		LoadQuestOption( player )
	end
	if CheckAcceptQuest( player,426123 ) and CheckFlag( player,547721 )==false then
		AddSpeakOption( player,player,"[SC_Z24N120973_1]","lua_Z25Q426123_1",0 )
	end
end
--�e�W
function lua_Z25Q426123_1()
	local player = OwnerID()
	local x,y,z,dir = DW_Location( player )
	local BuffID = 507178
	local Obj
		CloseSpeak( player )
		if CheckBuff( player,BuffID )==false then
			AddBuff( player,BuffID,0,38 )
			Obj = CreateObj( 106794,x,y,z,dir,1 )
				SetFightMode ( Obj,0, 0, 0, 0 ) 
				SetModeEx( Obj, EM_SetModeType_Move, false )	--����
				SetModeEx( Obj, EM_SetModeType_Gravity, false )--���O
				SetModeEx( Obj, EM_SetModeType_Show, false )	--���
				AddToPartition( Obj,0 )
			PlayMotion( TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK )
			CallPlot( Obj,"lua_Z25Q426123_QuestStart",Obj,player )
		end
end
--�e�W
function lua_Z25Q426123_QuestStart( Obj,player )
	CallPlot( Obj,"lua_Z25Q426123_QuestCheck",Obj,player )
	Sleep(10)
	ScriptMessage( player,player,3,"[SC_426123_1]","0xffff8040" )	--�ڭn�����O�d�~�e���G�ơK
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_2]","0xffff8040" )	--�H�����e�A�]�ڬ��F�v�O�B���F�O�q�������Ԥ���A�y���@�ɷ��j���ʶáC
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_3]","0xffff8040" )	--���B���]�ڰQ���U�رj�j���O�q�A���ʫq�f�B�𲱪��s�ڭ̥[�J�Ԥ��C
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_4]","0xffff8040" )	--�s�ھ֦��O�@�����߬y���ϩR�K
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_5]","0xffff8040" )	--�M�ӥ[�J�F�]�ڪ��Ԫ��A�N����a�J�ߤ��A�ϥL�̩ߤU�ۤv���d���M�ѩR�C
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_6]","0xffff8040" )	--�u�s�������r�P�԰��y�������߬y�j��
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_7]","0xffff8040" )	--�̲סA�y�����������X�{�K���ɤw�g�Ӥ��ΤF�K
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_8]","0xffff8040" )	--�s�ڬ��F��������������I�X�F�G�h���N���C
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_9]","0xffff8040" )	--�^�͡K�a�s�����b�������K�묹�ۤv���ʩR�~�����F���������K
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_10]","0xffff8040" )	--���K
	Sleep(30)
	ScriptMessage( player,player,3,"[SC_426123_11]","0xffff8040" )	--�ү��箦���F�p���P�O�q����F��������
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_12]","0xffff8040" )	--�M�ӥL�ä���o�����������ƤO�q�s�����h�j�j�K�����߬y�v�T�@�ɪ��Y�ѡK
	Sleep(25)
	ScriptMessage( player,player,3,"[SC_426123_13]","0xffff8040" )	--�a�s���l�A����J�D��L�S �P �s�ڨϪ�
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_14]","0xffff8040" )	--�b���������X�{�e�A�ڷ|�i��ڦ椧�v
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_15]","0xffff8040" )	--�ڷ|���O�i��״_�����߬y�A�ɥi�઺���z���������k��ù�S���O�q�C
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_16]","0xffff8040" )	--�����ڡA�ЧA�̤@�w�n�K
	Sleep(20)
	ScriptMessage( player,player,3,"[SC_426123_17]","0xffff8040" )	--����ү��箦�����ߡK����d�w�������묹�A�{�b�ڭ̤��o�A���h����u�s���O�q�K
end
--�e�W
function lua_Z25Q426123_QuestCheck( Obj,player )
	local QuestID = 426123
	local FinishFlagID = 547721
	local CheckBuffID = 507178
	local CheckRange =70
		for i= 1, 38 do
			if  CheckID( player ) == true and  
				( CheckAcceptQuest( player, QuestID ) ~= true or --�ˬd���L����
				CheckBuff( player, CheckBuffID ) ~= true or --�ˬd���LBUFF
				CheckFlag( player, FinishFlagID ) == true or --�ˬd���L���n���~
				CheckDistance( player, Obj, CheckRange ) ~= true ) then --�ˬd�O�_�W�L�ˬd�d��
				
					CancelBuff( player, CheckBuffID )
					ScriptMessage( player,player,1,"[SC_422974_FAILED]",0 )
					DelObj( Obj)
					return
			end
			Sleep( 10 )
		end
		Sleep( 30 )
			if  CheckID( player ) == true and  
				( CheckAcceptQuest( player, QuestID ) ~= true or --�ˬd���L����
				CheckBuff( player, CheckBuffID ) ~= true or --�ˬd���LBUFF
				CheckFlag( player, FinishFlagID ) == true or --�ˬd���L���n���~
				CheckDistance( player, Ctrl, CheckRange ) ~= true ) then --�ˬd�O�_�W�L�ˬd�d��	
					SetFlag( player,FinishFlagID,1 )
			end
		DelObj( Obj)
		return	
end

--�e lua_Z25Q426123_SZ()
function lua_Z25Q426124_1()
	SetSpeakDetail( OwnerID(),"[SC_426124_3]" )
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426124_4]","lua_Z25Q426124_2",0 )
end
function lua_Z25Q426124_2()
	SetSpeakDetail( OwnerID(),"[SC_426124_5]" )
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_426124_6]","lua_Z25Q426124_3",0 )
end
function lua_Z25Q426124_3()
	SetSpeakDetail( OwnerID(),"[SC_426124_7]" )
	SetFlag( OwnerID(),547722,1 )
end

--426083 �ڪ��ƨ� ��t������
function lua_Q426083_range()
	SetPlot( OwnerID(), "range","lua_Q426083_run",50 )
end
function lua_Q426083_run()
	if CheckAcceptQuest( OwnerID(),426083 ) then
		SetPlot( TargetID(), "range", "", 0 )
		CallPlot( TargetID(), "lua_Q426083_1", 0 )
	end
end
function lua_Q426083_1()
	local mora1 =OwnerID()
	local tmp = SearchRangeNPC( mora1,70)
	local moralua 
		for i=0 , #tmp  do
			if ReadRoleValue( tmp[i], EM_RoleValue_OrgID ) == 121995 then
				moralua = tmp[i]
			end
		end
			Sleep(10)
			Say( mora1,"[SC_Z25Q426083_4]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_5]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_6]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_7]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_8]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_9]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_10]")
			Sleep(20)
			Say( moralua,"[SC_Z25Q426083_11]")
			Sleep(20)
			Say( mora1,"[SC_Z25Q426083_12]")
			Sleep(10)
			local player = SearchRangePlayer( OwnerID(),100 )
			for i=0, #player do
				if CheckAcceptQuest( player[i],426083 ) and CheckFlag( player[i],547573 )==false then
					ScriptMessage( player[i],player[i],1,"[SC_Z25Q426083_1]",0)
				end
			end
			Sleep(10)
			CallPlot( mora1,"lua_Q426083_range",0)
			--SetPlot( mora1, "range", "lua_Q426082_run", 50 )
end

--426083 �ڪ��ƨ� �ľ�������
function lua_I242357_CheckUse()
	if ReadRoleValue( TargetID(),EM_RoleValue_OrgID ) == 121994 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[KORS_Z23_ITEMUSE4]", 0)
		return false
	end
end
function lua_I242357_UseOK()
	if CheckAcceptQuest( OwnerID(),426083 ) and CheckFlag( OwnerID(),547573 )==false then
		SetFlag( OwnerID(), 547573,1 )
	end
end

function lua_z25testaddbuff()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_BUFF_BEGIN )
	AddBuff( OwnerID() , 622000 , 0 ,-1 )
end

function LuaS_Z25N121995_crouch()------�S��
	AddBuff(OwnerID(),507555,1,-1)
	AddBuff(OwnerID(),507556,1,-1)
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_CROUCH )
end
--��ۣ�H 102280
--�Ǫ��]�]�]
function LuaS_107471_0()

	local count = 4 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 9 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = -1 --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 250 --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	local dis = 20 --���Z

	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107471,Matrix,1, -2 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107501,Matrix,2,  0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107501,Matrix,3, -1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(107514,Matrix,4,  2)

	--���� PID �H�� MONEY �N�@���@�}�l�x�s��ƩҥΡA�p�G�n�ܧ󤺳����ȡA�Цܤ� sleep( checktime )

	--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--���Ӽƭȶ��Ǭ� 1.�إߪ�����ҦbTABLE 2.�إߪ��}�C 3.���Z 4.�}�C���j�p 5.�P�_���ɶ� 6.�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
	--PS.�p�G�]�w���� NPC ���W���� SCRIPT�A�h�g������ 0 �� �ANPC ���ͫ�N���|�۰ʱ� SCRIPT

	--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaS_107471_1" , 0 )
end

function LuaS_107471_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaS_107471_0" , 0 )
end

--�l����
function lua_z25bugrunout_range()
	SetPlot( OwnerID(),"range","lua_z25bugrunout_1",30 )
end
function lua_z25bugrunout_1()
	local objtable = {}
	SetPlot( TargetID(),"range","",0 )
	WriteRoleValue( TargetID(),EM_RoleValue_Register1,3  )
 	objtable = Lua_CreateObjToRandownPos( TargetID(), 107482, 3, 50, true )
		for i = 1, 3 do
			WriteRoleValue( objtable[i], EM_RoleValue_PID,TargetID() )
			SetAttack( objtable[i], OwnerID())
		end
end
--�l���ΡG�����԰�
function lua_z25bugEvent_EndAttack()
	local PID = ReadRoleValue( OwnerID(),EM_RoleValue_PID )
	AddRoleValue( PID, EM_RoleValue_Register1, -1 )
		if ReadRoleValue( PID, EM_RoleValue_Register1) ==0 then
			CallPlot( PID, "lua_z25bugrunout_range", 0 )
		end
		if ReadRoleValue( OwnerID(),EM_RoleValue_IsDead) == 0 then
			DelObj( OwnerID() )
		end
end