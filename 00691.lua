--�F�N��
function LuaS_420852_0_0()
	if CheckAcceptQuest( OwnerID() , 420852) == true and CountBodyItem( OwnerID(), 202176)>=1 and CheckFlag( OwnerID(), 540952 ) == false then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420852_0") , "LuaS_420852_0_1", 0 ) --���a�ﶵ�G�������n�ڮ��������A�Y
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420852_0_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420852_1" )   )
	DelBodyItem( OwnerID(), 202176, 1 )
	SetFlag( OwnerID()  , 540952 , 1 )
end

--�z�j
function LuaS_420852_1_0()
	if CheckAcceptQuest( OwnerID() , 420852) == true and CountBodyItem( OwnerID(), 202176)>=1 and CheckFlag( OwnerID(), 540953 ) == false then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420852_0") , "LuaS_420852_1_1", 0 ) --���a�ﶵ�G�������n�ڮ��������A�Y
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420852_1_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420852_2" )   )
	DelBodyItem( OwnerID(), 202176, 1 )
	SetFlag( OwnerID()  , 540953 , 1 )
end

--���u
function LuaS_420852_2_0()
	if CheckAcceptQuest( OwnerID() , 420852) == true and CountBodyItem( OwnerID(), 202176)>=1 and CheckFlag( OwnerID(), 540954 ) == false  then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420852_0") , "LuaS_420852_2_1", 0 ) --���a�ﶵ�G�������n�ڮ��������A�Y
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420852_2_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420852_3" )   )
	DelBodyItem( OwnerID(), 202176, 1 )
	SetFlag( OwnerID()  , 540954 , 1 )
end

--�w�w��
function LuaS_420852_3_0()
	if CheckAcceptQuest( OwnerID() , 420852) == true and CountBodyItem( OwnerID(), 202176)>=1 and CheckFlag( OwnerID(), 540955 ) == false  then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420852_0") , "LuaS_420852_3_1", 0 ) --���a�ﶵ�G�������n�ڮ��������A�Y
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420852_3_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420852_4" )   )
	DelBodyItem( OwnerID(), 202176, 1 )
	SetFlag( OwnerID()  , 540955 , 1 )
end

--�_���
function LuaS_420852_4_0()
	if CheckAcceptQuest( OwnerID() , 420852) == true and CountBodyItem( OwnerID(), 202176)>=1 and CheckFlag( OwnerID(), 540956 ) == false  then
		LoadQuestOption(OwnerID())
		AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_420852_0") , "LuaS_420852_4_1", 0 ) --���a�ﶵ�G�������n�ڮ��������A�Y
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaS_420852_4_1()
	SetSpeakDetail ( OwnerID(), GetString ( "EM_420852_5" )   )
	DelBodyItem( OwnerID(), 202176, 1 )
	SetFlag( OwnerID()  , 540956 , 1 )
end



function LuaS_420850_0()
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_420850_0]" )
	ShowBorder( OwnerID(), 0, "[SC_420850_1]" , "ScriptBorder_Texture_Paper" )	
end