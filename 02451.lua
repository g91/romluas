--AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , 10000 )  �ޯ��I��

function Lua_na_me_ramadan_npc()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --�ˬdNPC�P���a���Z��

	if CheckBuff ( OwnerID() , 509694 ) ==false then  --�����PNPC��ܡA�M�����Ǫ��p��
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , 0 )
		AddBuff( OwnerID(), 509694 , 0, -1)
		local U =ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 )
	--	Say( OwnerID(), U )
	end

	SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_MAIN]")  --[SC_RAMADAN2011_MAIN]�C
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_01]", "Lua_na_ramadan2011_01",0 ) --�ڷQ��2�I�s������I�ƧI��
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_02]", "Lua_na_ramadan2011_02",0 ) --�ڷQ��[203650]�I�����~[208801]
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_03]", "Lua_na_ramadan2011_03",0 ) --�ڷQú�樭�W�ֿn��[203650]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_08]", "Lua_na_ramadan2011_04",0 ) --�d�ߤw��X��[203650]�`�q

end


function Lua_na_ramadan2011_01() --�Ϋ����I�ƧI���ؤl
	local X = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount )  --�߬d���a���W�������I��
	
	if X >= 2 then
		GiveBodyItem( OwnerID() , 209380 , 1 ) --���ؤl
		WriteRoleValue( OwnerID() , EM_RoleValue_MedalCount , X-2 )
		local Z = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount ) --�A���ŧi�ƭȡA�T�w�g�J
	--	say( OwnerID() , "before is "..X.." , now is "..Z )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_04]" ) --�A�S�������������I�ƥi�ѧI���C
	end
end


function Lua_na_ramadan2011_02() --�I�����y�A���aú��ɡA�֭p��Ǽƶq
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_REWARD]")  --�A�Q�n�I������O�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD1]", "Lua_na_me_ramadan_rw1",0 ) --��10��[203650]�I��[209381]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD5]", "Lua_na_me_ramadan_rw2",0 ) --��20��[203650]�I��50��[203038]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD2]", "Lua_na_me_ramadan_rw3",0 ) --��60��[203650]�I���ǲΪA��
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD3]", "Lua_na_me_ramadan_rw4",0 ) --��100��[203650]�I��[208801]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD4]", "Lua_na_me_ramadan_rw5",0 ) --��500��[203650]�I���ٸ�[530650]
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_09]" )	--�A�����W�ثe�S������s�A�����
	end	
end


function Lua_na_me_ramadan_rw1() --10���s�A����ǧI��fusion stone1
	local X= ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 10 then
		local random = rand (3)+1
		local stone = { 209381 , 209382 , 209383 }
		GiveBodyItem ( OwnerID(), stone[random] , 1 ) --�H�������ݩʺ��ѥ�
		DelBodyItem( OwnerID() , 203650 , 10 )
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+10 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --�A�S��������[203650] �s�A�����
	end
end


function Lua_na_me_ramadan_rw2() --20���s�A����ǧI��50�ӥ����ťN��
	local X= ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 20 then
		local random = rand (3)+1
		GiveBodyItem ( OwnerID(), 203038 , 50 ) --�H�������ݩʺ��ѥ�
		DelBodyItem( OwnerID() , 203650 , 20 )
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+20 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --�A�S��������[203650] �s�A�����
	end
end



function Lua_na_me_ramadan_rw3()
	SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_REWARD6]")  --�A�Q�n�I������O�H
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD7]", "Lua_na_me_ramadan_rw31",0 ) --�ڷQ�I���ǲ��Y�y
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD8]", "Lua_na_me_ramadan_rw32",0 ) --�ڷQ�I���ǲΪA��
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]", "Lua_na_ramadan2011_02",0 ) --�^��W�@��		
end


function Lua_na_me_ramadan_rw31() --60���s�A����ǧI���U�l
	local X= ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	local SEX =ReadRoleValue( OwnerID() , EM_RoleValue_SEX )

	if dates >= 60 then  --���U�l
		if SEX == 0 then
			GiveBodyItem( OwnerID(), 229701 , 1)

		else 
			GiveBodyItem( OwnerID(), 229705 , 1)		
		end
		DelBodyItem( OwnerID(), 203650 , 60)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I			
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+60 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --�A�S��������[203650] �s�A�����
	end
end



function Lua_na_me_ramadan_rw32() --60���s�A����ǧI����A
	local X= ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	local SEX =ReadRoleValue( OwnerID() , EM_RoleValue_SEX )

	if dates >= 60 then  --���U�l
		if SEX == 0 then
			GiveBodyItem( OwnerID(), 229702 , 1)

		else 
			GiveBodyItem( OwnerID(), 229706 , 1)		
		end
		DelBodyItem( OwnerID(), 203650 , 60)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I			
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+60 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --�A�S��������[203650] �s�A�����
	end
end


function Lua_na_me_ramadan_rw4() --100���s�A����ǧI�����M
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 100 then
		GiveBodyItem( OwnerID(), 208801 , 1 )  --����15���d�m���M x 1
		DelBodyItem( OwnerID(), 203650 , 100)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+100 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --�A�S��������[203650] �s�A�����
	end
end



function Lua_na_me_ramadan_rw5() --500���s�A����ǧI���ٸ�
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	if CountBodyItem ( OwnerID() ,  530650 ) < 1 then --�Y���a�|�����o���ٸ� 
		local dates = CountBodyItem( OwnerID(), 203650)
		if dates >= 500 then
			GiveBodyItem( OwnerID(), 530650 , 1 ) --�����ٸ�
			DelBodyItem( OwnerID(), 203650 , 500)
			ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --�Ʊ�A�|���w�o��§���I
			WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+500 )
			CloseSpeak(OwnerID())
		else
			ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_05]", 0 ) --�A�S��������[203650] �s�A�����
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_RAMADAN2011_05]", 0 ) --�A�S��������[203650]
			CloseSpeak(OwnerID())
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_QTITLENPC_013]" ) --�A�w�g�I���L���ٸ��o�C
		CloseSpeak(OwnerID())
	end
end


function Lua_na_ramadan2011_03()  --�߰ݬO�_�T�{�nú����
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_10][$SETVAR1="..dates.."]" ) --�ثe�A���W�֦�����Ǽƶq�@[$VAR1]�� �A�O�_�T�w�n����ú��O�H
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_11]", "Lua_na_ramadan2011_031",0 ) --�ڭnú��[203650]
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_09]" )	--�A�����W�ثe�S������s�A�����	
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110150_2]" , "Lua_na_me_ramadan_npc", 0 ) --�^��W�@��
end



function Lua_na_ramadan2011_031()  --ú�樭�W���Ҧ����
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	local dates = CountBodyItem( OwnerID(), 203650)
	local Z = X+dates
	if dates >=1 then
		DelBodyItem( OwnerID(), 203650 , dates)
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 , Z )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_RAMADAN2011_06][$SETVAR1="..dates.."][$SETVAR2="..Z.."]" , C_SYSTEM )  --�A�wú��[203650][$VAR1]�ӡA�ثe�A�ֿn���`�Ƭ�[$VAR2]
		CloseSpeak ( OwnerID())
	else
		ScriptMessage ( OwnerID() , OwnerID(), 1 , "[SC_RAMADAN2011_09]", 0) --�A�����W�ثe�S������s�A�����
		ScriptMessage ( OwnerID() , OwnerID(), 0 , "[SC_RAMADAN2011_09]", 0) --�A�����W�ثe�S������s�A�����
		CloseSpeak(OwnerID())		
	end
end



function Lua_na_ramadan2011_04()  --�d�ߤwú�檺�ƶq
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --�ˬd���a���W�w�gú�檺���
	CloseSpeak ( OwnerID())
	ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_RAMADAN2011_07][$SETVAR1=".. X .."]"  , C_SYSTEM)  --�{�b�A�֭p����Ǽƶq�@[$VAR1]�� 
	ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_RAMADAN2011_07][$SETVAR1=".. X .."]"  , C_SYSTEM)
end



------------------------------------------------------------------------------------------------------------------------------------------------
--���ի��O

function Lua_na_ramadan_check0() --�ˬd���a���W����Ǽƶq
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "Before = "..X )
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , 0 )
	local Z = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "After = "..Z )
end


function Lua_na_ramadan_check1() --�ˬd���a���W����Ǽƶq
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "X= "..X )
end


function Lua_na_ramadan_addpoint() --����10�I�����I��
	local X = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount )  --�߬d���a���W�������I��
	
	WriteRoleValue( OwnerID() , EM_RoleValue_MedalCount , X+10 )
	local Z = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount ) --�A���ŧi�ƭȡA�T�w�g�J
	say( OwnerID() , "before is "..X.." , now is "..Z )

end



---------------------------------------------------------------------------------------------------------
--�s�A����ǪG��
function LuaI_203650_check()
	if CheckBuff( OwnerID(), 509695 )== true or CheckBuff( OwnerID() , 509707 ) == true then
		ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_RAMADAN2011_ITEM]"  , C_SYSTEM)  --�ثe�֦������~�ĪG�A�L�k�A���ϥΡC
		return FALSE
	else
		DelBodyItem( OwnerID(), 203650 , 1 )
		return true
	end
end


function LuaI_203650_use()
	CastSpell( OwnerID(), OwnerID(), 497141 )
end