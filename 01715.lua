function Lua_mika_dancefes_mailok() -- �ܽШ�l�t������ �@�� �����ȼҪO
	SetFlag( TargetID()  , 542390 , 0 )  --�R ���ȶi�椤 flag	
	SetFlag( TargetID()  , 543767, 1 )  --�� ���Ѥw�������� flag
	local letter =  CountBodyItem(  TargetID() , 203865 ) --�R�|�ܽШ�			
	DelBodyItem(  TargetID() , 203865 , letter ) --�ܽШ�
end

function Lua_mika_dancefes_mission1ok() -- �K��§�g������@��  �����ȼҪO
	SetFlag( TargetID()  , 543766, 1 )  --�� ���Ѥw�������� flag
end

function Lua_mika_dancefes_delquest() -- �R��ӥ��Ȫ�����flag
	SetFlag( TargetID()  , 543766, 0 )  --
	SetFlag( TargetID()  , 543767, 0 )  --
end


function Lua_mika_dancefes_mail() 
	LoadQuestOption(OwnerID())  --���J���ȼҪO
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_112311_011]" , "LuaN_112311_1", 0 ) --�ڷQ�F���w�R�`���ӷ� 
end
----------------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail1() --112314 ���g�D�v�Լw
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542393)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112314_02]" ) 
	else
		SetSpeakDetail( OwnerID(), "[SC_112314_03]" )--  
		if mission == true then --���ȶi�椤
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail11", 0 ) --��I[203865]
		end
	end
end

function Lua_mika_dancefes_mail11() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
		SetFlag( OwnerID()  , 542393 , 1 ) -- �����a getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail2() --112315 �F��Dù��
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542391)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_DANCEFES_MAIL02]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112315_01]" )--  
		if mission == true then --���ȶi�椤
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail12", 0 ) --��I[203865]
		end
	end
end

function Lua_mika_dancefes_mail12() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
		SetFlag( OwnerID()  , 542391 , 1 ) -- �����a getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail3() --112316 �i�Q���D��w
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542392)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112316_02]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112316_01]" )--  
		if mission == true then --���ȶi�椤
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail13", 0 ) --��I[203865]
		end
	end
end

function Lua_mika_dancefes_mail13() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
		SetFlag( OwnerID()  , 542392 , 1 ) -- �����a getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail4() --112317 �Ǽw�D����_
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542394)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112317_03]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_DANCEFES_MAIL03]" )--  
		if mission == true then --���ȶi�椤
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail14", 0 ) --��I[203865]
		end
	end
end

function Lua_mika_dancefes_mail14() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if letter > 0 then
		Closespeak(OwnerID())			
		DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
		SetFlag( OwnerID()  , 542394 , 1 ) -- �����a getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
	end
end
-----------------------------------------------------------------------------------------
function Lua_mika_dancefes_mail5() --112318 �[���D���
	local mission = CheckFlag(OwnerID(), 542390)
	local ok = CheckFlag(OwnerID(), 542395)
	if ok == true then 
		SetSpeakDetail( OwnerID(), "[SC_112318_03]" )
	else
		SetSpeakDetail( OwnerID(), "[SC_112318_01]" )--  
		if mission == true then --���ȶi�椤
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_DANCEFES_MAIL01]" , "Lua_mika_dancefes_mail15", 0 ) --��I[203865]
		end
	end
end

function Lua_mika_dancefes_mail15() 
	local letter =  CountBodyItem( OwnerID() , 203865 ) --�R�|�ܽШ�
	if letter > 0 then
		Closespeak(OwnerID())
		DelBodyItem( OwnerID() , 203865 , 1 ) --�ܽШ�
		SetFlag( OwnerID()  , 542395 , 1 ) -- �����a getnpc1 Flag
	else
		SetSpeakDetail( OwnerID(), "[SC_1123_LOST]" )-- ����H�A�����ܽШ�d��F�H�ڨSť���a�H
	end
end
-----------------------------------------------------------------------------------------