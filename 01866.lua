--701866 �s���d���U�ƥ�


--�@��ƥ�
function lua_mika_newpet_event01()  --LV2
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	Say(OwnerID(), "[SC_NEWPLAYERPET_EVENT_LV2]")
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV2]" , C_SYSTEM )
end

function lua_mika_newpet_event02()  --LV5
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	Say(OwnerID(), "[SC_NEWPLAYERPET_EVENT_LV2]")
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV6_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV6_2]" , C_SYSTEM )
	GiveBodyItem(MasterGUID, 200876 , 1 )--���� �զ���������@��
end

function lua_mika_newpet_event03()  --LV7
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	Say(OwnerID(), "[SC_NEWPLAYERPET_EVENT_LV2]")
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV7_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV7_2]" , C_SYSTEM )
end

function lua_mika_newpet_event04()  --LV8
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	Say(OwnerID(), "[SC_NEWPLAYERPET_EVENT_LV2]")
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV8]" , C_SYSTEM )
end

function lua_mika_newpet_event05()  --LV11
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	Say(OwnerID(), "[SC_NEWPLAYERPET_EVENT_LV2]")
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_TOUCH06_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_TOUCH06_2]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_TOUCH06_3]" , C_SYSTEM )
end

-------- 5.0.0 �s�W
function lua_mika_newpet_event06()  --LV4
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );

	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV4_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV4_2]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV4_3]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_LV4_4]" , C_SYSTEM )

end



--���Ȩƥ�
function lua_mika_newpet_event_hq01()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN01_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN01_2]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN01_3]" , C_SYSTEM )
end

function lua_mika_newpet_event_hq02()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN02_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN02_2]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN02_3]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN02_4]" , C_SYSTEM )
end

function lua_mika_newpet_event_hq03()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_2]" , C_SYSTEM )
	GiveBodyItem(MasterGUID, 201749 , 3 )--����[201749]3��
	GiveBodyItem(OwnerID(), 201749 , 3 )--����[201749]3��  ------------------------���ꬰ���ե�
	Sleep(20)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_3]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_4]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_5]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_6]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN03_7]" , C_SYSTEM )
end

function lua_mika_newpet_event_hq04()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN04_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN04_2]" , C_SYSTEM )
	GiveBodyItem(MasterGUID, 200335 , 10 )--����[200335]10��
	GiveBodyItem(OwnerID(), 200335 , 10 )--����[200335]10��  ------------------------���ꬰ���ե�
end

function lua_mika_newpet_event_hq05()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN05]" , C_SYSTEM )
end

function lua_mika_newpet_event_hq06()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN06_1]" , C_SYSTEM )
	Sleep(10)
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_HUMAN06_2]" , C_SYSTEM )
end

function lua_mika_newpet_event_eq01()
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_ELF01]" , C_SYSTEM )
end

--function lua_mika_newpet_event_eq02()
--	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
--	ScriptMessage ( OwnerID() , MasterGUID , 0 , "[SC_NEWPLAYERPET_EVENT_ELF02]" , C_SYSTEM )
--end



--�ˬd�U���Ȫ��A.���P�����Ȫ��A
--�H��q1 ��ը��� 420666
--�H��q2 �V���_�s 420670
--�H��q3 �R�ۺq����w 421435
--�H��q4 �����F���R�R�� 421437
--�H��q5 �l���]������ 420479
--�H��q6 �a��:�_���d���`�F 421449
--�H��q7 �a��:�ֺ��ԿէJ������ 421448
--�H��q8 �a��:�g�Y���d�|�w  421347
--���Fq1 ���F�ǰ| 422242

function lua_mika_newpet_check()
	local CheckQueststatus = {  {"Q01" , 420666},
				 {"Q03" , 421435} ,
				 {"Q04" , 421437} ,
				 {"Q05" , 420479} ,
				 {"Q06" , 421449} ,
				 {"Q07" , 421448} ,
				 {"Q08" , 421347} ,
				 {"Q09" , 422242} }
	for i = 1 , table.getn( CheckQueststatus ) do
		local  status = GetQuestState( OwnerID() , CheckQueststatus[i][2] )
		Say(OwnerID() , "no.="..CheckQueststatus[i][1]..",".."questid="..CheckQueststatus[i][2]..",".."status="..status )
	end
end	