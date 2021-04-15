function LuaInside_CAPTUREFLAG()
	SetCrystalID( TargetID(), 431 ); 	--�]�w�޲z���v�޳�
	LoadQuestOption( OwnerID() )
	--AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAGINSIDE_1]" , "Lua_CAPTUREFLAG_GetGuildBidInfo", 0 ) --�ڷQ���W3v3�ͦs�Գ�������
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_CAPTUREFLAGINSIDE_2]" , "Lua_CAPTUREFLAG_Teach", 0 ) --�ڷQ�F��3v3�ͦs�Գ����W�h
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_DEFEND_2]" , "Lua_DEFEND_Teach", 0 ) --�ڷQ�F��3v3�ͦs�Գ����W�h
end

function Lua_CAPTUREFLAG_GetGuildBidInfo()
	CloseSpeak( OwnerID() )
	local Party = LuaFunc_PartyData(OwnerID())
	if (CheckZone(431) == false) then
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_ZONEERROR]" , 0 )	--�Գ��٦b�ǳƤ�
	else		
		if Party[0] == 1 then
			-- �n�D�}�Ҥ��|���v�Ф���, ��T�ǵ� DC, DC �b�N��T�൹ Client
			SendBGInfoToClient( 431, OwnerID() )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_1V1PVP_PARTYERROR]" , 0 )	--�Х���������b���W
		end
	end
--	Say(OwnerID(),"SendBGInfoToClient")
end
function Lua_CAPTUREFLAG_Teach()
	SetSpeakDetail( OwnerID(), "[SC_CAPTUREFLAGINSIDE_3]"   )
	--1.����}��D�����Ҧ��H�x�Ӱ}�窺�ťۡC
	--2.Ĳ�I�Ĥ�}�窺�ťۥi�H��a�ӲťۡA�åB�ܨ����ťۦu�ê̡]+100�H�����O-50�H���m�O�^�A�o�ɥu�n�N�Ӳť۱a�^�v��}�窺�ťۮy�A�N�i�H��o700���C
	--3.������ť۪��A�Q�����ɡA�ť۷|�����b���`���a�I�A���ɦp�G�v��}��Ĳ�I�ӲťۡA�h�Ӳťۦ^��D���ťۮy�C
	--4.�����@�ӼĤ�}�窺���a�i�H��o50���C
	--5.�C15������}��ҷ|��o10���n���C
	--6.���ƹF��500�B1000�B1500�����ɭԦP�}�禨���|��o50�I�a�A�C
	--7.�`�����F��2000�����}�笰�ӧQ��A�ӧQ����馨���|��o100�I�a�A�C
end
function Lua_DEFEND_Teach()
	SetSpeakDetail( OwnerID(), "[SC_DEFEND_3]"   )
	--1.����}��D�����Ҧ��H�x�Ӱ}�窺�ťۡC
	--2.Ĳ�I�Ĥ�}�窺�ťۥi�H��a�ӲťۡA�åB�ܨ����ťۦu�ê̡]+100�H�����O-50�H���m�O�^�A�o�ɥu�n�N�Ӳť۱a�^�v��}�窺�ťۮy�A�N�i�H��o700���C
	--3.������ť۪��A�Q�����ɡA�ť۷|�����b���`���a�I�A���ɦp�G�v��}��Ĳ�I�ӲťۡA�h�Ӳťۦ^��D���ťۮy�C
	--4.�����@�ӼĤ�}�窺���a�i�H��o50���C
	--5.�C15������}��ҷ|��o10���n���C
	--6.���ƹF��500�B1000�B1500�����ɭԦP�}�禨���|��o50�I�a�A�C
	--7.�`�����F��2000�����}�笰�ӧQ��A�ӧQ����馨���|��o100�I�a�A�C
end
 



