function LuaS_111622_Quest()

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),421531)==true )and(CheckFlag( OwnerID() , 542180 )==false)then	--�M�_�C������

		AddSpeakOption(OwnerID(),TargetID(),"[SC_421531_1]","LuaS_421531_1",0)
	end

	if (CheckAcceptQuest(OwnerID(),421532)==true )and(CountBodyItem( OwnerID(), 203354 )<1)then	--�M�_�C�����d�@����
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_3]","LuaS_421532_1",0)  --��u����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_1",0)  --�\��}
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_5]","LuaS_421532_2",0)	--�̨��q�|
	end

	if (CheckAcceptQuest(OwnerID(),421533)==true )and(CountBodyItem( OwnerID(), 203356 )<1)then	--�M�_�C�����d�G����
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_1",0)  --�\��}
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_3]","LuaS_421532_2",0)  --��u����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--�}���E��
	end

	if (CheckAcceptQuest(OwnerID(),421536)==true )and(CountBodyItem( OwnerID(), 203368 )<1)then	--�M�_�������d�T����
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_4]","LuaS_421532_2",0)  --�\��}
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_7]","LuaS_421532_1",0)  --���H�}�]
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--�}���E��
	end

	if (CheckAcceptQuest(OwnerID(),421538)==true )and(CountBodyItem( OwnerID(), 203370 )<1)then	--�M�_�������d�|����
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_6]","LuaS_421532_1",0)	--�}���E��
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_8]","LuaS_421532_1",0)	--ù����
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_7]","LuaS_421532_2",0)  --���H�}�]
	end

	if (CheckAcceptQuest(OwnerID(),421540)==true )and(CheckFlag( OwnerID() , 542185)==false)then	--�ժܪ���ѥ���
		
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421540_3]","LuaS_421540_1",0)
	end

	if (CheckCompleteQuest( OwnerID() , 421539) == false )and( CheckCompleteQuest( OwnerID() , 421538) == true) and( CountBodyItem( OwnerID(), 203371 )<1) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421532_9]","LuaS_add_421532",0)  
	end

end

------------------------------------
function LuaS_421531_1()           --�M�_�C������

	SetSpeakDetail(OwnerID(),"[SC_421531_2]")	
	SetFlag(OwnerID() , 542180 , 1 )
end

function LuaS_421532_1()     

	SetSpeakDetail(OwnerID(),"[SC_421532_1]")	--������A�q�q�C
end

function LuaS_421532_2()     

	SetSpeakDetail(OwnerID(),"[SC_421532_2]")	--����F�I���֥h�a��
end

------------------------------------
function LuaS_421540_1()           --�ժܪ����

	SetSpeakDetail(OwnerID(),"[SC_421540_4]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421540_1]","LuaS_421540_2",0)	
end

function LuaS_421540_2()           --�ժܪ����

	SetSpeakDetail(OwnerID(),"[SC_421540_2]")	
	SetFlag(OwnerID() , 542185 , 1 )
end

function LuaS_add_421532()

	GiveBodyItem( OwnerID(), 203371, 1 )
	CloseSpeak( OwnerID() )
end

