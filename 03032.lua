-----------------------------------------------------------------------------
--Z27_�n����
-----------------------------------------------------------------------------
-----------------------------------------------------426519�ͦn��ܤ@�G�����N��
--122825 �N�׬[
--242924 �T�L��(�ؼ�:10)
--���ϥίT�L��(�ؼ�:10)(NPC:108132)
function lua_Z27Q426519_1()
	if CountBodyItem( OwnerID(),242924 ) > 0 then
		return true
	else
		--�A�S���i�H�N���F��
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426519_1]", 0 )
		return false
	end
end
function lua_Z27Q426519_2()
	--�P�_��buff
	if CheckBuff( TargetID(),624726 )==false then
		CallPlot( TargetID(),"lua_Z27Q426519_3",OwnerID() )
		return 1
	else
		--���٦b�N�ۡ�
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426519_2]", 0 )
		return 1
	end
end
function lua_Z27Q426519_3( player )
	local num = Rand(50) +100
	AddBuff( OwnerID(),624726,0,num )
	if DelBodyItem( player,242924,1 ) then
		Sleep(10)
		--��פ����[�l�W�A�}�l�N�ס�
		ScriptMessage( OwnerID(), player, 2, "[SC_426519_3]", 0 )
		--Say( OwnerID(), "[SC_426519_3]" )
		Sleep(10)
		DW_QietKillOne( player,108132 )
		return 1
	end
end
-----------------------------------------------------426520�ͦn��ܤG�G�إм�
--122828 ��ʥЦa
--242925 �˺�������(�ؼ�:5)
--���ϥθ˺�������(�ؼ�:5)(NPC:108133)
function lua_Z27Q426520_1()
	LoadQuestOption( OwnerID() )
	if CountBodyItem( OwnerID(),242925 ) > 0 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_426520_1]","lua_Z27Q426520_2",0)--��@�Цa�I
		--�A�S���i�H�Ψ���@����
	end

end
function lua_Z27Q426520_2()
	CloseSpeak( OwnerID())
	--�P�_��buff
	if CheckBuff( TargetID(),624726 )==false then
		CallPlot( TargetID(),"lua_Z27Q426520_3",OwnerID() )
		return 1
	else
		--�w�g��@�L�F��
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_426520_2]", 0 )
		return 1
	end
end
function lua_Z27Q426520_3( player )
	local num = Rand(50) +100
	AddBuff( OwnerID(),624726,0,num )
	if DelBodyItem( player,242925,1 ) then
		Sleep(10)
		--�N�����������ê����b�Цa�W��
		ScriptMessage( OwnerID(), player, 2, "[SC_426520_3]", 0 )
		Sleep(10)
		DW_QietKillOne( player,108133 )
		return 1
	end
end
-----------------------------------------------------426522�i��ͧP
--122832 ���D�v��
--242926 �ĤC�����o�����˵��H��
--(�X��548353)��H�e�h�����D�v��
function lua_Z27Q426522_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426522 )==true and CheckFlag( OwnerID() ,548353 )==false then
		if CountBodyItem( OwnerID(),242926 ) > 0 then--���ĤC�����o�������H��
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426522_0]","lua_Z27Q426522_2",0 )
		else
			--�A���������H�n���ڡH�H�b���̡H
			SetSpeakDetail( OwnerID(), "[SC_426522_1]" )	
		end
	end
end
function lua_Z27Q426522_2()
	CloseSpeak( OwnerID())
	--��F�A�T��O�������˵��H��C
	SetSpeakDetail( OwnerID(), "[SC_426522_2]" )
	SetFlag( OwnerID(), 548353  ,1)
	DelBodyItem( OwnerID(),242926,1 ) 
end
-----------------------------------------------------426525���ҤH
--122835 �Q�R��
--122836 �ڬ��S
--122837 �Ԩ�ù
function lua_Z27Q426525_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true  and  CheckFlag( OwnerID() ,548349 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_1_1",0 )--���ѡA�ڪ��n�|������A�ݭn�A�b���C
	end
end
function lua_Z27Q426525_2()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true and CheckFlag( OwnerID() ,548350 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_2_1",0 )
	end
end
function lua_Z27Q426525_3()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426525 )==true and CheckFlag( OwnerID() ,548351 )==false then
		AddSpeakOption(  OwnerID(),TargetID(),"[SC_426525_0]","lua_Z27Q426525_3_1",0 )
	end
end
--���������X��
--(�X��548349)
--(�X��548350)
--(�X��548351)
function lua_Z27Q426525_1_1()
	--�I�ǡ�����H���D�F�I���W�^�h�I
	--SetSpeakDetail( OwnerID(), "[SC_426525_1_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548349  ,1)
	CallPlot( OwnerID(),"lua_Z27_122835_1",0 )
end
function lua_Z27Q426525_2_1()
	--�I�ǡ�n�[�S�ݨ�����A���ݡ�I
	--SetSpeakDetail( OwnerID(), "[SC_426525_2_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548350  ,1)
	CallPlot( OwnerID(),"lua_Z27_122836_1",0 )
end
function lua_Z27Q426525_3_1()
	--�I�ǡ�u���������H�^�h�S���A���F�A�I
	--SetSpeakDetail( OwnerID(), "[SC_426525_3_1]" )
	--Sleep(10)
	CloseSpeak( OwnerID())
	SetFlag( OwnerID(), 548351  ,1)
	CallPlot( OwnerID(),"lua_Z27_122837_1",0 )
end
--122841 �Q�R�����}����
--122842 �ڬ��S���}����
--122843 �Ԩ�ù���}����
function lua_Z27_122835_1()
	local newnpc = 122841
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122841_1]" )--�I�ǡ㦳�~�ġA�D�`���A����M�n������C
		LuaFunc_moveToFlag( obj,781338,1,0 )
		DelObj( obj)
end
function lua_Z27_122836_1()
	local newnpc = 122842
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122842_1]" )--�I�ǡ������n�I�j�a�߱����|�n�I
		LuaFunc_moveToFlag( obj,781338,2,0 )
		DelObj( obj)
end
function lua_Z27_122837_1()
	local newnpc = 122843
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newnpc,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		MoveToFlagEnabled( obj ,false )
		AddToPartition( obj,0 )
		Say( obj, "[SC_122843_1]" )--�I�ǡ㬼�y����F�A�ά��������٦b���ۧڭ̡A�n�֡�
		LuaFunc_moveToFlag( obj,781338,3,0 )
		DelObj( obj)
end

-----------------------------------------------------426526�ͱ��H�x
--122822 ù�Ǻ��D����
--242930 �I�P���ͦn�ҩ�
--���o�I�P�ڱڪ����q���ҩ�(�X��548352)
--�N�I�P���ͦn�ҩ��e�浹ù�Ǻ��D����(�X��548356)
function lua_Z27Q426526_1()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,426526 )==true and CheckFlag( OwnerID() ,548356 )==false then
		if CountBodyItem( OwnerID(),242930 ) > 0 then--���I�P���ͦn�ҩ�
			AddSpeakOption(  OwnerID(),TargetID(),"[SC_426526_0]","lua_Z27Q426526_2",0 )
		else
			--���W�F�A���L�A�����ҩ��b���̡H
			SetSpeakDetail( OwnerID(), "[SC_426526_1]" )	
		end
	end
end
function lua_Z27Q426526_2()
	CloseSpeak( OwnerID())
	--�����@�@�o�o�Ӥ������ҩ��C
	SetSpeakDetail( OwnerID(), "[SC_426526_2]" )
	SetFlag( OwnerID(), 548352  ,1)
	SetFlag( OwnerID(), 548356  ,1)
	DelBodyItem( OwnerID(),242930,1 ) 
end





-----------------------------------------------------------------------------
--Z27 ���H
-----------------------------------------------------------------------------
-----------------------------------------------------�v��J���s�γ��A����
function lua_Z27m_Talk1()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk1_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk1_1()
	local num = Rand(5)+1
	--Say( OwnerID(),num)
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK1_"..num.."]")
end
-----------------------------------------------------�k���J���s�γ��A����
function lua_Z27m_Talk2()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk2_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk2_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK2_"..num.."]")
end
-----------------------------------------------------�S�ƷF���ӤH���A����
function lua_Z27m_Talk3()
	SetPlot(OwnerID(),"touch","lua_Z27m_Talk3_1",30)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_Z27m_Talk3_1()
	local num = Rand(5)+1
	AdjustFaceDir( TargetID(),OwnerID(),0)
	NpcSay(TargetID(),"[SC_Z27M_TALK3_"..num.."]")
end

