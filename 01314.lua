--701314

function LuaDan_112698_0()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112698_1]" )                                   --���ʺ޲z����ܤ��e
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_2]", "Lua_Dan_112698_1", 0) --����R�ָ`�I��
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_3]", "Lua_Dan_112698_2", 0) --���󭵼ְ��N�v�ɬ���
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_4]", "Lua_Dan_112698_3", 0) --����׹D�|�y�v
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_2]", "Lua_Dan_112589_1", 0) --����§�~�I���覡      
end
---------------------------------------------------------------------------------------------------
--����R�ָ`�I��
function Lua_Dan_112698_1()  
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_5]") 				      --�R�ָ`�I������
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_16]", "Lua_Dan_112698_1_0", 0) --��h�R�ָ`�I��
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)             --�^��W�@��
end

function Lua_Dan_112698_1_0()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_17]") 				   --�R�ָ`�I������2
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)          --�^��W�@��
end
---------------------------------------------------------------------------------------------------
--���󭵼ְ��N�v�ɬ���
function Lua_Dan_112698_2()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_6]")					    --���ְ��N�v�ɬ��ʤ��� (�@�~�@�ת����ְ��N�v�ɤS�n�}�l�o�A��ۧA���԰��٦�A����A���޳N�A�V�۲��I�e�i�a�I)
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_7]", "Lua_Dan_112698_4", 0)  --�p�󧹦����ְ��N�v�ɬ���
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_8]", "Lua_Dan_112698_5", 0)  --�ڭn���W���ְ��N�v�ɬ��� (����)
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_21]", "Lua_Dan_112698_8", 0) --�ڭn���W��U�N���ֲ��e�F���I (����)
       	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)           --�^��W�@��
end

--�p�󧹦����ְ��N�v�ɬ���
function Lua_Dan_112698_4() --�W�h1
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_12]")  	
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_34]", "Lua_Dan_112698_9", 0) --�U�@��
end

function Lua_Dan_112698_9() --�W�h2
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_33]")  	
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)
end
---------------------------------------------------------------------------------------------------
--����׹D�|�y�v
function Lua_Dan_112698_3()
	local PFlag = CheckFlag(OwnerID()  , 542553)   --�y�v�C��flag
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_9]") 				    --�׹D�|�y�v���ʤ���
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_10]", "Lua_Dan_112698_6", 0) --�p�󧹦��׹D�|�y�v����
	if PFlag == false then --���ѨS���L
		AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_11]", "Lua_Dan_112698_7", 0) --�ڭn���W�׹D�|�y�v����
	end
       	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)           --�^��W�@��
end

function Lua_Dan_112698_6() ---�׹D�|�y�v���ʳW�h
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_14]") 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112698_3", 0)
end

function Lua_Dan_112698_7() --�ڭn���W�׹D�|�y�v����
	CloseSpeak(OwnerID())   --������ܵ��� 
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112698_15]", C_SYSTEM ) --�a�۳o�ӯ��_�����ֲ��A�@�w�|�b�A�e���׹D�|���ȳ~�W�A�A�ɪ��U�A�@�u���O�I			
	GiveBodyItem( OwnerID() , 204541, 3 ) 	  				   --�����ֲ� 				
	SetFlag( OwnerID()  , 542553 , 1 )      
end
---------------------------------------------------------------------------------------------------
--����§�~�I���覡 
function Lua_Dan_112589_1()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112589_6]" )	 --§�~�I���W�h
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_3]", "Lua_Dan_112589_2", 0) --�ڭn�I��������§�� 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)         --�^��W�@��
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112589_2() --������§�����e��
	local PlayerID = OwnerID()
	local Score = CountBodyItem( OwnerID() , 204457) --����
	local Note  = CountBodyItem( OwnerID() , 204428) --����
	if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		   	if Score >= 15 and Note >= 15 then 
                       		  	SetSpeakDetail (OwnerID(), "[SC_111584_YU_27]" ) --���§A�������I�Ц��U�o��§���a�I
				AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112589_1", 0)--�^��W�@��
				DelBodyItem( OwnerID() , 204457 , 15 ) --�R������15��
				DelBodyItem( OwnerID() , 204428 , 15 ) --�R������15��
       		               	GiveBodyItem( OwnerID() , 204427  , 1) --������§��
				GiveBodyItem( OwnerID() , 241482  , 15) --15�Ӥs������
				DesignLog( OwnerID() , 112698 , "exchage reward" ) -- �I�����y
				----------------  �B�~��20% ���v�� ���|�귽 --------------
				local Random = rand(100)+1
				if Random > 80 then
					GiveBodyItem( PlayerID , 725449 , 1 )
				end
				-------------------------------------------------------------
		  	 else
				SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --�z�ҫ������ƶq�����A�٤���I����C			  	
				AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112589_1", 0)--�^��W�@��
		  	 end 
	else
       		 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]")  --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C	
      		 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "Lua_Dan_112589_1", 0 ) --�^��W�@��       
	end
end

------------------------------------------------------------------------------
--���~ ����̲M�� 204114
function LuaDan_112589_List()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_DAN_112698_30]" );
	ShowBorder( OwnerID(), 0, "[SC_DAN_112698_27]" , "ScriptBorder_Texture_Paper" )
end
------------------------------------------------------------------------------
function LuaDan_112589_spellusingcheck()  --�ˬd�����~�O�_�b�S�wNPC���W
	
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID1 = 101998 --����npc
	--local MonsterID2 = 101999 --�Ԥ�� ����npc
	local MonsterID3 = 102000 --�Ԥ�� ����npc
	local MonsterID4 = 102001 --�Ԥ�� ����npc
	local MonsterID5 = 102002 --�Ԥ�� ����npc
	local MonsterID6 = 102003 --�Ԥ�� ����npc
	local MonsterID7 = 102004 --�Ԥ�� ����npc
	local MonsterID8 = 102005 --�Ԥ�� ����npc
	local MonsterID9 = 102006 --�Ԥ�� ����npc

	if ( CheckID( TargetID() ) == true ) and ( TargetID() ~= OwnerID() ) and ( (OrgID == MonsterID1) or (OrgID == MonsterID3) or (OrgID == MonsterID4) or (OrgID == MonsterID5) or (OrgID == MonsterID6) or (OrgID == MonsterID7) or (OrgID == MonsterID8) or (OrgID == MonsterID9) ) then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_112698_28]" , C_SYSTEM )	--���ޯ�ШϥΩ󭵼ְ��N���ɥX�{���Ǫ����W�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_112698_28]" , C_SYSTEM )	--���ޯ�ШϥΩ󭵼ְ��N���ɥX�{���Ǫ����W�I�C
		return false	
	end
end	