--�`�y���� 2010�~3���w�R�`
------------------------------------------------------------------------------
--�w�R�`���ӷ�
------------------------------------------------------------------------------
function LuaN_112311_0() --��Script�g�bNPC�L�g�W
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112311_011]" , "LuaN_112311_1", 0 ) --�ڷQ�F���w�R�`���ӷ� 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_CHANGE01]" , "lua_mika_dancefes_change01", 0 ) --�ڷQ�I��[206841]
end
----------------------------------------------------------------------------------------------
function LuaN_112311_1() --�ڷQ�F���w�R�`���ӷ�
	SetSpeakDetail( OwnerID(), "[SC_112311_02]" )--�w�R�`���G�Ƥ��e(��)  
end
-----------------------------------------------------------------------------
function lua_mika_dancefes_change01() --�ڷQ�I��[206841]
	SetSpeakDetail( OwnerID(), "[SC_DANCEFES_CHANGE11]" )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_OKAY]" , "lua_mika_dancefes_change11", 0 ) --�T�w
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_112311_0", 0 ) --�^��W�@�h
end

function lua_mika_dancefes_change11()  --�ǰe���Ť崫����§��
	local item = CountBodyItem(OwnerID(), 202904 ); -- �ˬd�O�_�� �ǰe���Ť�
	if item >=2 then  --�ƶq���w
		CloseSpeak(OwnerID())
		GiveBodyItem(OwnerID(), 206841 , 1 )  --���w�R����§��1��(206841)
		DelBodyItem(OwnerID(), 202904 , 2 ) --���ǰe���Ť�2�� (202904)
	else 
		SetSpeakDetail(OwnerID(), "[SC_0908SEANSON_26]" )--�A�ҫ������~�ƶq�����C
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "lua_mika_dancefes_change01", 0 ) --�^��W�@�h
	end		
end
-------------------------------------------------------------------------