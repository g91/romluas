--------------------------------------------------------------------------------------------------------------
--�������x�Ȥ�O
Function LuaI_200936_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetString("ST_200936_1"));
	AddBorderPage( OwnerID(), GetString("ST_200936_2"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_3"));
	AddBorderPage( OwnerID(), GetString("ST_200936_4"));
	AddBorderPage( OwnerID(), GetString("ST_200936_5"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_6"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_7"));
	AddBorderPage( OwnerID(), GetString("ST_200936_8"));
	AddBorderPage( OwnerID(), GetString("ST_200936_0"));
	AddBorderPage( OwnerID(), GetString("ST_200936_9"));
	AddBorderPage( OwnerID(), GetQuestDetail( 420349, 1 ));

	ShowBorder( OwnerID(), 420349, str,"ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------
--���Cù���Ф�
Function LuaI_201635_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 420733, 1 ));

	ShowBorder( OwnerID(), 420733, str , "ScriptBorder_Texture_Paper" )	

end
--�@�i�ѤU
function LuaQ_420733_Complete()
	local Name = GetName( TargetID() )
	local String = "[SAY_420733_0][$SETVAR1="..Name.."]"
	RunningMsg( OwnerID() , 1 , String )
end
--------------------------------------------------------------------------------------------------------------
--�ǲ����H
Function LuaI_201646_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetQuestDetail( 420761, 1 ));

	ShowBorder( OwnerID(), 420761, Str, "ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------
function LuaS_110913_0()
	LoadQuestOption(OwnerID())
	if CheckCompleteQuest(OwnerID(),420761) == false and CountBodyItem(OwnerID(),201646) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110913_1"),  "LuaS_110913_1",  0 );
		--/*�J���ˬd����
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110913_1()
	SetSpeakDetail( OwnerID(), GetString("ST_110913_1")   ); --/*�A�o�{���骺�h�����@���P�_�Ӫ��ȡC
	if CheckCompleteQuest(OwnerID(),420761) == false and CountBodyItem(OwnerID(),201646) == 0 then
		AddSpeakOption(  OwnerID(), TargetID( ), GetString("SO_110913_2"),  "LuaS_110913_2",  0 );
		--/*�N�P�_�Ӫ��ȩ�X
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110913_2()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() ,201646, 1 )
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110919_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),420761) == true then
		SetSpeakDetail( OwnerID(), GetString("ST_110919_1")   ); 
		--/*�o�Ӥg��ݱo�X�ӳQ���~���L�A�A�q���}���g�[���ݨ�U����G�I�äF����F��C
	elseif CheckCompleteQuest(OwnerID(),420761) == true then 
		SetSpeakDetail( OwnerID(), GetString("ST_110919_2")   ); 
		--/*�o�Ӥg�襤�w�g�S������A�P���쪺�F��F�C
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110917_0()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),420740) == true then
		AddSpeakOption(OwnerID(),TargetID(),GetString("SO_420740_1"),"LuaS_110917_1",0)
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110917_1()
	SetSpeakDetail( OwnerID(), GetString("ST_420740_1")   ); 
	GiveBodyItem(OwnerID(),201668,1)
end
--------------------------------------------------------------------------------------------------------------
--�d�F�ت��^��
Function LuaI_200432_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetString("ST_200432_1"));
	AddBorderPage( OwnerID(), GetString("ST_200432_2"));
	ShowBorder( OwnerID(), 0,str,"ScriptBorder_Texture_Paper" )	

end
--------------------------------------------------------------------------------------------------------------
function LuaS_Kasak_A()
	if CheckCompleteQuest(OwnerID(),420339) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_1")   ); 
	else
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_2")   ); 
	end
end
--------------------------------------------------------------------------------------------------------------
function LuaS_Kasak_B()
	if CheckCompleteQuest(OwnerID(),420339) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_3")   ); 
	else
		SetSpeakDetail( OwnerID(), GetString("ST_KASAK_4")   ); 
	end
end
--------------------------------------------------------------------------------------------------------------
--����������
Function LuaI_202787_Quest()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID());	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), GetString( "SC_202787_1" ));

	ShowBorder( OwnerID(), 421388,Str,"ScriptBorder_Texture_Paper" )	

end

--------------------------------------------------------------------------------------------------------------