-----------------------------------------------------------------------------------------------------------
--����
-----------------------------------------------------------------------------------------------------------

function LuaI_110483()

	SetPlot( OwnerID(),"range","LuaI_110483_Detail",75 );

end
-----------------------------------------------------------------------------------------------------------

function LuaI_110483_Detail()

	if CheckAcceptQuest( OwnerID(), 420700) == true then
		Tell ( OwnerID() ,  TargetID(),  GetString("ST_110483_4") );	--�K�A�S���s��_�I�̨Ӥ䴩�A�O�o�n�h�p�y��������n�O�ڡI
		--SAY( TargetID(),  GetString("ST_110483_4") );
	else
	
	end

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_0") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_YES"), "LuaS_110483_Detail_Yes",0 );		--�W�[�@�ӿﶵ�A�O
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_NO"),  "LuaS_110483_Detail_No", 0 );		--�W�[�@�ӿﶵ�A�_

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_Yes()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_1") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110483_LATON"), "LuaS_110483_Detail_Laton",0 );	--�W�[�@�ӿﶵ�A�p�y����
end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_No()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_2") );
	AddSpeakOption( OwnerID(), TargetID(),  GetString("SO_110483_LATON"), "LuaS_110483_Detail_Laton",0 );	--�W�[�@�ӿﶵ�A�p�y����

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Detail_Laton()

	SetSpeakDetail( OwnerID(), GetString("ST_110483_3") );

end

-----------------------------------------------------------------------------------------------------------

function LuaS_110483_Exit()

	CloseSpeak( OwnerID() );	--������ܵ���

end

-----------------------------------------------------------------------------------------------------------
