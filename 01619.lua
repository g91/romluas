--�ƥ���NPC.�ƥ��y�{

--�ƥ��J�fNPC-------------------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC0()
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_11]"   ) -- ������Ӫ��s�_�I�̶ܡH
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_12]" , "Lua_mika_losttreasure_insideNPC1", 0 ) --�}�ҫ��n��
--	if CheckFlag(OwnerID(), 543573) == false then --�j�N���_�i�椤
--		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_43]" , "Lua_mika_losttreasure_insideNPC6", 0 ) --���o�F�|������
--	end
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_14]" , "Lua_mika_losttreasure_insideNPC2", 0 ) --�٬O���ڥX�h�a
	if CheckFlag(OwnerID(), 543573) == false then --�j�N���_�i�椤
		AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_13]" , "Lua_mika_losttreasure_insideNPC3", 0 ) --�ڷǳƦn�F
	end
end
--------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC1()--�}�ҫ��n��
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_15]"   ) -- 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE1]"  , "Lua_mika_losttreasure_insideNPC_page1", 0 ) --�Ĥ@�� �����񤺥X�S���`�F
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE2]"  , "Lua_mika_losttreasure_insideNPC_page2", 0 ) --�ĤG�� �������\�]������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_LOSTTREASURE_PAGE3]"  , "Lua_mika_losttreasure_insideNPC_page3", 0 ) --�ĤT�� ����ҹ���Ѫ��ޯ�ĪG
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC0", 0 )--�^�W�@��
end

function Lua_mika_losttreasure_insideNPC_page1()--�Ĥ@�� �����񤺥X�S���`�F
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE11]"   ) -- ���e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--�^�W�@��
end

function Lua_mika_losttreasure_insideNPC_page2()--�ĤG�� �������\�]������
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE21]"   ) -- ���e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--�^�W�@��
end

function Lua_mika_losttreasure_insideNPC_page3()--�ĤT�� ����ҹ���Ѫ��ޯ�ĪG
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_PAGE31]"   ) -- ���e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC1", 0 )--�^�W�@��
end
------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC2()--�٬O���ڥX�h�a
	CloseSpeak( OwnerID() )   
	BeginPlot(  OwnerID()  , "Lua_mika_losttreasure_exit02" , 0 )  
end
--------------------------------------------------------------------------
function Lua_mika_losttreasure_insideNPC3()--
	SetSpeakDetail( OwnerID(), "[SC_LOSTTREASURE_16]"   ) -- �n�}�ҳo�����������ݦ�30��<CN>[203038]</CN>�A�ڷQ�A���Ӧ��ǳƦn�a�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_LOSTTREASURE_17]" , "Lua_mika_losttreasure_insideNPC4", 0 ) --��I30��[203038]
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_mika_losttreasure_insideNPC0", 0 )--�^�W�@��
end

function Lua_mika_losttreasure_insideNPC4()--��I30��[203038]
	CloseSpeak( OwnerID() )    
	if CountBodyItem( OwnerID(), 203038 ) >= 30 then                            --�����ťN��
--		Say(OwnerID(), "Normal ")
		BeginPlot(  TargetID()  , "Lua_mika_losttreasure_insideNPC5" , 0 ) --�}�l�C��
	else
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��  (  *  �@�Φr��   )
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_111813_YU_36]" ,0  )--�A�S�������������ťN��
	end
end

function Lua_mika_losttreasure_insideNPC7() --�ϥ�1��[202903]���o�F�|���֮ĪG
	local rune = CountBodyItem(OwnerID(), 202903) --�ǰe�̲Ť�
	if CheckFlag(OwnerID(), 543497) == true then --�p�G�w�g���F�|���ֺX��
		CloseSpeak(OwnerID())
		ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_49]" ,C_SYSTEM   ) --�A�w�g�����F�|���֮ĪG�C
		ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_49]" ,C_SYSTEM   ) --�A�w�g�����F�|���֮ĪG�C
	else
		if rune >= 1 then 
			SetFlag(OwnerID(),543497, 1) --���ϥΨF�|���ֺX��
			DelBodyItem(OwnerID(), 202903, 1)
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_46]" ,C_SYSTEM  )--�A�w���o�F�|���֮ĪG�A�{�b�лP[113622]��ܶ}�ҹC���a�I
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_46]" ,C_SYSTEM  )--�A�w���o�F�|���֮ĪG�A�{�b�лP[113622]��ܶ}�ҹC���a�I
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
			ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_0908SEANSON_26]" ,0  )--�A�ҫ������~�ƶq�����C
		end
	end
end
--------------------------------------------------------------------
function Lua_mika_losttreasure_count() --�ɶ��˼�
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9,  600 )    
	while true do
		AddRoleValue(OwnerID() , EM_RoleValue_Register+9,  -1 )    
		local A = ReadRoleValue(OwnerID() , EM_RoleValue_Register+9)   
--		Say(OwnerID(),A)
		if CheckFlag(OwnerID(), 543489 ) == true then
			break
		end
		sleep(10)
	end
end

-----------------------------------------------------------
--���_�w�j��
function Lua_mika_losttreasure_indoorclose() --���_�]�j��close  �}�ҹC����  --ok
	local treasuredoor = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113621, 3000 , 0)       --�_�w�j��
	PlayMotion(treasuredoor, 147) 
end

-----------------------------------------------------------
--�ɶ������
function Lua_mika_losttreasure_timeup()
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --���j��
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --���j��
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --���j��
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --���j��
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --���j��
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --���j��
	BeginPlot(  OwnerID()  , "Lua_Clockending" , 0 )   --�I�sclockclose
	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_TIMEUP]" ,0  )--�ɶ���A�A�Q�@�ѱj��O�q�ǰe�X�h�C
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_TIMEUP]" ,0  )--�ɶ���A�A�Q�@�ѱj��O�q�ǰe�X�h�C
	PlayMotion(door1, 147)  -- ���J�f�j�� 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --���_�j��close
	ChangeZone( OwnerID() , 10 , 0 , -35785.7,147.5, 5438.2, 213) -- �ƥ��~NPC��m ot
	sleep(50)
	ScriptMessage( OwnerID(), TargetID()  , 1 ,"[SC_LOSTTREASURE_TIMEUP2]" ,0  )--�A�b���~�����h�F�N�ѡA�^��F���~�C
	ScriptMessage( OwnerID(),TargetID()  , 0 ,"[SC_LOSTTREASURE_TIMEUP2]" ,0  )--�A�b���~�����h�F�N�ѡA�^��F���~�C
	if CheckFlag(OwnerID(), 543489) == TRUE then
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --�ٸ��O��
		local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
	SetFlag(OwnerID(),543573 , 0 ) -- �R �j�N���_�i�椤
end
-----------------------------------------------------------
--���Ϯ���
function Lua_mika_losttreasure_chanzone()
--	Say(OwnerID(), "O" )
--	Say(TargetID(), "T" )
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --���j��
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --���j��
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --���j��
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --���j��
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --���j��
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --���j��
	BeginPlot( OwnerID()  , "Lua_Clockending" , 0 )   --�I�sclockclose
	PlayMotion(door1, 147)  -- ���J�f�j�� 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --���_�j��close
	SetFlag(OwnerID(),543573 , 0 ) -- �R �j�N���_�i�椤
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
end
-----------------------------------------------------------
--���}�ƥ����K��O
function Lua_mika_losttreasure_exit00()   --�������}�ƥ��ζǰe�}  --ok
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );
	ScriptMessage( OwnerID(), OwnerID()  , 1 ,"[SC_LOSTTREASURE_24]" ,0  )--���_�w���f�X�{�i�ǰe���}�o�̪���O�C
	ScriptMessage( OwnerID(), OwnerID()  , 0 ,"[SC_LOSTTREASURE_24]" ,0  )--���_�w���f�X�{�i�ǰe���}�o�̪���O�C
	local EXIT = CreateObjByFlag( 113615, 780486, 1 , 1 )
	AddToPartition( EXIT,RoomID )
	SetPlot( EXIT, "touch", "Lua_mika_losttreasure_exit02", 10 );
end

function Lua_mika_losttreasure_exit02() --ok
	if CheckBuff( OwnerID() , 501570) == true then  --�W�[�ˬd�P�_
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	end

	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_LOSTTREASURE_LEAVE]")  --�A�T�w�n���}�o�̶ܡH
	DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );  --�T�w
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );  --����
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
		--��ưe�X�����D
		return
	end
	for i = 0 , 100 , 1 do
		Sleep( 1 );
		SelectID = DialogGetResult( OwnerID() );
		if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
			if ( SelectID == 0 ) then
				BeginPlot( OwnerID() , "Lua_mika_losttreasure_exit03" , 0 )  
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break;
			elseif ( SelectID == 1 ) then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		elseif i == 100 then
			CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
			DialogClose( OwnerID() )		
			break
		end
	end
end

function Lua_mika_losttreasure_exit03()  --���\���}�ƥ�
--	Say(OwnerID(), "O" )
--	Say(TargetID(), "T" )
	local range = 2000
	local door1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113620, range , 0)       --���j��
	local door2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114086, range , 0)       --���j��
	local door3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114082, range , 0)       --���j��
	local door4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114085, range , 0)       --���j��
	local door5 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114083, range , 0)       --���j��
	local door6 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 114084, range , 0)       --���j��
	BeginPlot(OwnerID()  , "Lua_Clockending" , 0 )   --�I�sclockclose
	ChangeZone( OwnerID() , 10 , 0 , -35785.7,147.5, 5438.2, 213) -- �ƥ��~NPC��m
	PlayMotion(door1, 147)  -- ���J�f�j�� 
	PlayMotion(door2, 147) 
	PlayMotion(door3, 147) 
	PlayMotion(door4, 147) 
	PlayMotion(door5, 147) 
	PlayMotion(door6, 147) 
	BeginPlot(OwnerID()  , "Lua_mika_losttreasure_indoorclose" , 0 )   --���_�j��close
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+9, 0)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+8, 0)
	ScriptMessage( OwnerID() , -1 , 1 , "[SC_LOSTTREASURE_PASS]", C_SYSTEM )--�A�b���~�����h�F�N�ѡA�^��F���~�C
	ScriptMessage( OwnerID() , -1 , 0 , "[SC_LOSTTREASURE_PASS]", C_SYSTEM )--�A�b���~�����h�F�N�ѡA�^��F���~�C
	if CheckFlag(OwnerID(), 543489) == TRUE then
		AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5 , 1 )   --�ٸ��O��
		local passtime = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem5  )   --�ٸ��ֿn����
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]" , C_SYSTEM )	--�ثe�D�Ԧ��\���ơG[$VAR1] �C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_PASSTIME][$SETVAR1="..passtime.."]"  , C_SYSTEM )
	end
	SetFlag(OwnerID(),543573 , 0 ) -- �R �j�N���_�i�椤
end
-----------------------------------------------------------

function Lua_mika_losttreasure_givebuff1() --�J�f���Ϊ���
	While true do
		SetPlot( OwnerID(), "range", "Lua_mika_losttreasure_givebuff2", 200 )  
		Sleep(50)
	end
end

function Lua_mika_losttreasure_givebuff2() --���A�Gbuff
--	Say(OwnerID(), "OwnerID") --player
--	Say(TargetID(), "TargetID")  --box
	Sleep(10)
	if CheckBuff(OwnerID(), 505590) == false then
--		Say(OwnerID(), "OwnerID2") --player
--		Say(TargetID(), "TargetID2") --box
--		AddBuff(OwnerID(), 505589, 1, 30) --�M�������k�N
		local MyPet = ReadRoleValue ( OwnerID() , EM_RoleValue_PetID ) ------���d��ID
		DelObj ( MyPet ) ---�R���d��
		AddBuff(OwnerID(), 505590, 1, -1 ) --�`�F�A�G
		CancelBuff(OwnerID(), 500675 ) --�s�� ���
		CancelBuff(OwnerID(), 500535 ) --���q �t�F�}��
		ScriptMessage( OwnerID() , -1, 1 , "[SC_LOSTTREASURE_48]" , C_SYSTEM )	--�A�����񤺤`�F���A�G�v�T�A�Ȯɿ�ѤF�쥻��¾�~�ޯ�C
		ScriptMessage( OwnerID() , -1 , 0 , "[SC_LOSTTREASURE_48]"  , C_SYSTEM )
	end
end

function Lua_mika_losttreasure_delnpc2() --�I�U�T����O�� �R���_�w�P��npc
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local range = 200
	local ToDel = {}
	ToDel[1] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101699, range , 1)     
	ToDel[2] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101700, range , 1)     
	ToDel[3] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101701, range , 1)     
	ToDel[4] = LuaFunc_SearchNPCbyOrgID( OwnerID() , 101702, range , 1) 
	for i=1 , table.getn(ToDel) do	
		if ToDel[i] ~= -1 then
			for j = 0 ,table.getn(ToDel[i])  do
				local PID = ReadRoleValue( ToDel[i][j] , EM_RoleValue_PID) 
				if PID == 555 then
					Delobj(ToDel[i][j])
				end
			end
		end
	end
--	Say(OwnerID(), "Del monster ! ")
end