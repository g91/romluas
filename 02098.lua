
--==============================================================--

function Zone18_CropSet()--�]����
	local obj = OwnerID()
	Hide( obj )
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Obstruct , true )			-- ����
	SetModeEx( Obj , EM_SetModeType_Gravity , true )			-- ���O
	SetModeEx( Obj , EM_SetModeType_Mark , true )				-- �аO
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- ����
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- �s��
	SetModeEx( Obj , EM_SetModeType_Searchenemy , true )		-- ����
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- �W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- �i�������
	Show( obj, 0 )
	AddBuff( obj, 507899, 0, -1 )--���i���z����
end

function Zone18_StoneSet()--�˹��Φ@���
	local obj = OwnerID()
	Hide( obj )
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Obstruct , true )			-- ����
	SetModeEx( Obj , EM_SetModeType_Gravity , true )			-- ���O
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( Obj , EM_SetModeType_Move , false )				-- ����
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- �s��
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false )		-- ����
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- �W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- �Y����
	SetModeEx( Obj , EM_SetModeType_Fight , false )				-- �i�������
	Show( obj, 0 )
end

--===============================================================--

function Zone18_Lymun_Set()
	local obj = OwnerID()
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , false )	-- �Q�j�M
	SetModeEx( Obj , EM_SetModeType_Mark , false )				-- �аO
	SetModeEx( Obj , EM_SetModeType_Save , true )				-- �s��
	SetModeEx( Obj , EM_SetModeType_HideName , true )			-- �W��
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , false )		-- �Y����
end


--==============================================================--
--		�a�u��						--
--===============================================================--

function Lua_116436_0()--�B�J�D���w
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_010]","Lua_116436_1",0) --�߰ݵo�ͤ����
end

function Lua_116436_1()
	SetSpeakDetail(OwnerID(),"[SC_116436_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116436_0",0) --�^�W�@��
end

--===========================================================--

function Lua_116147_0()--�F��i�D�װ򨽿�(�e�UNPC)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116147_0]","Lua_116147_1",0) --�߰ݨȰ�B���׶�
end

function Lua_116147_1()
	SetSpeakDetail(OwnerID(),"[SC_116147_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116147_0",0) --�^�W�@��
end

--===========================================================--

function Lua_116146_0()--�Ͳ��D�ե캸(�e�UNPC)
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116146_00]","Lua_116146_1",0) --�߰ݶ����ê��ǻ�
end

function Lua_116146_1()
	SetSpeakDetail(OwnerID(),"[SC_116146_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116146_01]","Lua_116146_2",0) --�߰ݥd�U�J����
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116146_0",0) --�^�W�@��
end

function Lua_116146_2()
	SetSpeakDetail(OwnerID(),"[SC_116146_1]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116146_1",0) --�^�W�@��
end

--===========================================================--

function Lua_116447_0()--���i�E�N�S��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116447_1",0) --�߰ݭ�]
end

function Lua_116447_1()
	SetSpeakDetail(OwnerID(),"[SC_116447_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116447_00]","Lua_116447_2",0)--�߰ݦ@���
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116447_0",0) --�^�W�@��
end

function Lua_116447_2()
	SetSpeakDetail(OwnerID(),"[SC_116447_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116447_1",0) --�^�W�@��
end

--===========================================================--

function Lua_116439_0()--��̡D����
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116439_00]","Lua_116439_1",0) --�߰ݦa�u�����Ѩ�
end

function Lua_116439_1()
	SetSpeakDetail(OwnerID(),"[SC_116439_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116439_01]","Lua_116439_2",0) --�߰ݴ�u�W������
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116439_0",0) --�^�W�@��
end

function Lua_116439_2()
	SetSpeakDetail(OwnerID(),"[SC_116439_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116439_1",0) --�^�W�@��
end

--===========================================================--

function Lua_116450_0()--�J�L�E�Q��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116450_1",0) --�߰ݭ�]
end

function Lua_116450_1()
	SetSpeakDetail(OwnerID(),"[SC_116450_0]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116450_0",0) --�^�W�@��
end

--===========================================================--

function Lua_116452_0()--�J�L�i�E�Q��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116452_00]","Lua_116452_1",0) --�߰ݵs���
end

function Lua_116452_1()
	SetSpeakDetail(OwnerID(),"[SC_116452_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116452_01]","Lua_116452_2",0) --�߰ݻG���@��
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116452_0",0) --�^�W�@��
end

function Lua_116452_2()
	SetSpeakDetail(OwnerID(),"[SC_116452_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116452_1",0) --�^�W�@��
end

--===========================================================--

function Lua_116441_0()--�Ũ����D�w��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_115038_010]","Lua_116441_1",0) --�߰ݵo�ͤ����
end

function Lua_116441_1()
	SetSpeakDetail(OwnerID(),"[SC_116441_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116441_0",0) --�^�W�@��
end


--==============================================================--
--		�ܼ}������					--
--===============================================================--

function Lua_116621_0()--�ƺ����D�Q��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116621_0]","Lua_116621_1",0) --�߰ݮ�������]
end

function Lua_116621_1()
	SetSpeakDetail(OwnerID(),"[SC_116621_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116621_0",0) --�^�W�@��
end

--===============================================================--

function Lua_116622_0()--�K�ԡD����
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116622_0]","Lua_116622_1",0) --�߰ݮ�������]
end

function Lua_116622_1()
	SetSpeakDetail(OwnerID(),"[SC_116622_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_116622_00]", "Lua_116622_2",0) --�~���ť
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116622_0",0) --�^�W�@��
end

function Lua_116622_2()
	SetSpeakDetail(OwnerID(),"[SC_116622_2]")
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116622_1",0) --�^�W�@��
end

--===============================================================--

function Lua_116623_0()--�̴̦��D�u��
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ASK]","Lua_116623_1",0) --�߰ݭ�]
end

function Lua_116623_1()
	SetSpeakDetail(OwnerID(),"[SC_116623_0]")	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]", "Lua_116623_0",0) --�^�W�@��
end

--===============================================================--

