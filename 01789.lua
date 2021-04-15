
function Hsiang_DebugSay( ID , Str  )
	Say( ID , Str );
end

--�]�wbuff
function Hsiang_AssistMagic(  MagicBaseID , Time  )
	AssistMagic( OwnerID()  , MagicBaseID , Time )
end

--�۳��d���ɪ��@��
function lua_mika_pettest01() --�򥻪k�N 506407 ����
	BeginPlot(OwnerID(), "Hao_Pet_SetModeEx", 0 )
	AssistMagic( OwnerID()  , 506591 ,  3600000 )
--	Say(OwnerID(), "OwnerID") --���a
--	Say(TargetID(), "TargetID") --�d��
end

function Hsiang_PetOntimeScript() --���b�k�N���X 495585 �ˬd�k�N �ϥ��ˬdLua
--	Say( OwnerID() , "TEST"  )
	Hsiang_GuildPetProc() --�ƥ�Ĳ�o
	return false;
end

--���ͷs������d��
function Hsiang_CreateGuildPet()
	SysCastSpellLv( OwnerID() , OwnerID() , 495393 , 0  )
end

--�s���d�� ����n�J�B�z�@��
function Hsiang_GuildPetProc_PlayerLogin()
	local PlayerLV = ReadRoleValue( TargetID() , EM_RoleValue_LV ) --Ū�����a���D¾����
	if PlayerLV <= 30 then
		Beginplot( OwnerID() , GuildPetProc_PlayerLogin_Language , 300 )
		Addbuff( OwnerID(), 622704, 0 , -1 )  -- ����ū�o��P�_�� BUFF 5.0.0 �s�W
	end
end

--�U�y�tĲ�o�@��
function Hsiang_GuildPetProc_PlayerLogin_None()
--	Tell ( OwnerID() ,  TargetID(),  "Hsiang_GuildPetProc_PlayerLogin_None" )	
end

function Hsiang_GuildPetProc_PlayerLogin_rw() --runewaker�����ϥ�
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Cn()  --²�餤��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Tw()  --�c�餤��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Eneu() -- �ڬw�^��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

Function Hsiang_GuildPetProc_PlayerLogin_Enus()  --�_���^��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_De()  --�w��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Fr()  --�k��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Es() --��Z����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Pl() --�i����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

-------------------

function Hsiang_GuildPetProc_PlayerLogin_Ru()  --�Xù����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Kr()  --����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Jp()  --���
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Tr()  --�g�ը��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

--function Hsiang_GuildPetProc_PlayerLogin_Saes()  --���n���w(��Z��)
function Hsiang_GuildPetProc_PlayerLogin_Sa()  --���n���w(��Z��)
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Sapt()  --���n���w(�����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Id()  --�L��
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Ae()  --���F
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end


function Hsiang_GuildPetProc_PlayerLogin_Vn()  --�V�n
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Ph()  --��߻�
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Th()  --����
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end

function Hsiang_GuildPetProc_PlayerLogin_Sg()  --�s�[�Y
	Hsiang_CreateGuildPet()
	if CountBodyItem(OwnerID(), 207051) == 0 then -- �S���s���d���D��
		GiveBodyItem(OwnerID(), 207051 , 1)
		Sleep(10)
		if CheckFlag(OwnerID(), 543807) == false then
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM01]" , C_SYSTEM ) --�w��A�[�J�C���A�I�]�����Ѫ�[207051]�i�Ω�l��Φ��^[113199]�C
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			ScriptMessage ( OwnerID() , OwnerID() , 0 , "[SC_NEWPLAYERPET_ITEM02]" , C_SYSTEM ) --[113199]��b�C��������ѧA�U�ئ��Ϊ���U�C
			SetFlag(OwnerID(), 543807,1)
		end
	end
end



function lua_mika_serverlanguage() --��ܥثeserver���y�t
	local Language = GetServerDataLanguage() 
	say(OwnerID(), Language)
end

--�s������d���ƥ��ƼзǤ�
function Hsiang_GuildPet_Init()

		--GuildPetProc_PlayerLogin_Language ����n�J�ƥ�

		local Language = GetServerDataLanguage() 		           --����ثeserver���y�t
		local LanguageFunc = {}
		LanguageFunc[ "rw"]  = "Hsiang_GuildPetProc_PlayerLogin_rw";
		LanguageFunc[ "cn"]  = "Hsiang_GuildPetProc_PlayerLogin_Cn";
		LanguageFunc[ "tw"]  = "Hsiang_GuildPetProc_PlayerLogin_Tw";
		LanguageFunc[ "eneu"] = "Hsiang_GuildPetProc_PlayerLogin_Eneu";
		LanguageFunc[ "enus"]  = "Hsiang_GuildPetProc_PlayerLogin_Enus";
		LanguageFunc[ "de"]  = "Hsiang_GuildPetProc_PlayerLogin_De";
		LanguageFunc[ "fr"]  = "Hsiang_GuildPetProc_PlayerLogin_Fr";
		LanguageFunc[ "es"]  = "Hsiang_GuildPetProc_PlayerLogin_Es";
		LanguageFunc[ "pl"]  = "Hsiang_GuildPetProc_PlayerLogin_Pl";
		LanguageFunc[ "jp"]  = "Hsiang_GuildPetProc_PlayerLogin_Jp";
		LanguageFunc[ "id"]  = "Hsiang_GuildPetProc_PlayerLogin_Id";
		LanguageFunc[ "ae"]  = "Hsiang_GuildPetProc_PlayerLogin_Ae";
		LanguageFunc[ "vn"]  = "Hsiang_GuildPetProc_PlayerLogin_Vn";
		LanguageFunc[ "th"]  = "Hsiang_GuildPetProc_PlayerLogin_Th";
		LanguageFunc[ "ph"]  = "Hsiang_GuildPetProc_PlayerLogin_Ph";
		LanguageFunc[ "sg"]  = "Hsiang_GuildPetProc_PlayerLogin_Sg";
		LanguageFunc[ "kr"]  = "Hsiang_GuildPetProc_PlayerLogin_Kr";
		LanguageFunc[ "tr"]  = "Hsiang_GuildPetProc_PlayerLogin_Tr";
		LanguageFunc[ "sa"]  = "Hsiang_GuildPetProc_PlayerLogin_Sa";
		LanguageFunc[ "sapt"]  = "Hsiang_GuildPetProc_PlayerLogin_Sapt";
--		LanguageFunc[ "ru"]  = "Hsiang_GuildPetProc_PlayerLogin_Ru";


		if (LanguageFunc[Language ] ~= null ) then
			GuildPetProc_PlayerLogin_Language  = LanguageFunc[Language ];
		else
			GuildPetProc_PlayerLogin_Language = Hsiang_GuildPetProc_PlayerLogin_None;
		end


	--{Minlv , maxlv,  ZoneID , MapID , �ݨD���� , KeyItemID , Function }
-- example 	
--	local NormalEvent = {  {2, 2, 1, 10 , -1, 543833, lua_mika_newpet_event01 } 		
--		    ,{2,10,1 , 10 , 420666, 543841, lua_mika_newpet_qevent01 }  }
	local NormalEvent = {  {2, 2, -1, -1 , -1, 543833, lua_mika_newpet_event01 }, 
		    {4,4,-1 , -1 , -1, 543859, lua_mika_newpet_event06 } ,
		    {5,5,-1 , -1 , -1, 543834, lua_mika_newpet_event02 } ,
		    {7,7,-1 , -1 , -1, 543835, lua_mika_newpet_event03 }, 
		    {8,8,-1 , -1 , -1, 543836, lua_mika_newpet_event04 } ,
		    {11,11,-1 , -1 , -1, 543837, lua_mika_newpet_event05 }, 
		    {1,50,1 , -1 , 420666, 543841, lua_mika_newpet_event_hq01 },   --�H��q1 ��ը���
		    {1,50,1 , -1 , 421435, 543843, lua_mika_newpet_event_hq03 },   --�H��q3 �R�ۺq����w
		    {1,50,1 , -1 , 421437, 543844, lua_mika_newpet_event_hq04 },   --�H��q4 �����F���R�R��
		    {1,50,1 , -1 , 420479, 543845, lua_mika_newpet_event_hq05 },   --�H��q5 �l���]������
		    {1,50,1 , -1 , 421449, 543846, lua_mika_newpet_event_hq06 },   --�H��q6 �a��:�_���d���`�F
		    {1,50,1 , -1 , 421448, 543847, lua_mika_newpet_event_hq06 },   --�H��q7 �a��:�ֺ��ԿէJ������
		    {1,50,1 , -1 , 421347, 543848, lua_mika_newpet_event_hq06 },   --�H��q8 �a��:�g�Y���d�|�w
		    {1,50,-1 , -1 , 422242, 543849, lua_mika_newpet_event_eq01 } }  --���Fq1 ���F�ǰ|

	--[lv][index]={ ZoneID , MapID , �ݨD���� , KeyItemID , Function }
	ToutorialPetLvEvent = {}
	
	for i = 1 , table.getn( NormalEvent ) do
		for j = NormalEvent[i][1] , NormalEvent[i][2]   do
			if ToutorialPetLvEvent[ j ] == nil then
				ToutorialPetLvEvent[ j ] = {}
	--			Hsiang_DebugSay( OwnerID() ,  "ToutorialPetLvEvent( "..j..") = {}")
			end
			
			local EventCount = table.getn( ToutorialPetLvEvent[ j ] );

	--		Hsiang_DebugSay( OwnerID() ,  "push ToutorialPetLvEvent( ".. j .. " )( " .. EventCount+1 .. ")"  )
			ToutorialPetLvEvent[ j ][ EventCount+1 ] = { NormalEvent[i][3] , NormalEvent[i][4] , NormalEvent[i][5] ,NormalEvent[i][6] ,NormalEvent[i][7] }
		end
	end	

end


function  lua_mika_newpetspeak()  --hp�C��20% �d������
--	Say(OwnerID(), "O")  
--	Say(TargetID(), "T") 
	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID ); --�D�H
	local PlayerRace = ReadRoleValue( MasterGUID , EM_RoleValue_RACE ) --�D�H���ر�
	Tell ( MasterGUID , OwnerID() , GetString("SC_NEWPLAYERPET_PETHEAL") );	-- �D�H�A���������U�A�a�I
end

function Hsiang_GuildPetProc()  --�ƥ�Ĳ�o

	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID );
	local MasterObj = Role:new( MasterGUID )
	local OwnerObj = Role:new( OwnerID() )
	local Level = MasterObj:Level();
	local ZoneID = MasterObj:ZoneID();
	local MapID = FindMapID( MasterObj:X() , MasterObj:Y() , MasterObj:Z() );
--	Hsiang_DebugSay( OwnerID() ,  "Master Lv  =" .. Level .. "  ZoneID=" .. ZoneID .. "  MapID=" .. MapID )
--	Say(OwnerID(), "PET")
--	Say(MasterGUID , "Master")

	local Lv =     ReadRoleValue( MasterGUID , EM_RoleValue_LV  ) --���ⵥ��
	local NowHP = ReadRoleValue( MasterGUID , EM_RoleValue_HP ) --�ثeHP
	local MaxHP = ReadRoleValue( MasterGUID , EM_RoleValue_MaxHP) --�̤jHP
	local HPPercent = NowHP / MaxHP

	if Lv <= 10 then
		AddBuff(MasterGUID,509705,0,10)
		if ReadRoleValue(MasterGUID,EM_RoleValue_IsAttackMode) == 1 then
			AddBuff(MasterGUID,509706,0,10)
		end
	end

	if Lv <= 30 then
--		Say( OwnerID(), "HP = "..(HPPercent*100).."%" )
			if (  HPPercent  <= 0.2 ) then  
				CastSpell( OwnerID() , MasterGUID , 495664 )	-- ��k�N(�I�k��,��Hid,�k�Nid) 
			end
			--2011 FN�s�W���C�s��y�����שҼW�[�ˬdBuff
	end

	--���Ũƥ�
	local Event = ToutorialPetLvEvent[ Level ]

	if Event ~= nil then	
	--	Hsiang_DebugSay( OwnerID() ,  "Event Check Count= " ..  table.getn( Event ) )
		for i = 1 , table.getn( Event ) do
			if Hsiang_CheckGuildPetEvent( MasterGUID , Event[i]  , ZoneID , MapID  ) == true then

	--			Hsiang_DebugSay( OwnerID() ,  "Event OK QuestID=" .. Event[i][3]  )

				--����ƥ�
				Event[i][5]();
				--�]�w�w�B�z�X��
				SetScriptFlag( MasterGUID , Event[i][4] , 1 );
			end	
		end
	end

	--�ɯ��ˬd
	local LastProcLv = ReadRoleValue( MasterGUID , EM_LuaValueFlag_UseItem26 )

--	Hsiang_DebugSay( OwnerID() ,  "LastProcLv  =" .. LastProcLv )

	if LastProcLv < Level  then
		Hsiang_RoleLevelUp( Level  )
		WriteRoleValue( MasterGUID , EM_LuaValueFlag_UseItem26 , Level )
	end
end
function Hsiang_CheckGuildPetEvent( MasterGUID , Event , ZoneID , MapID )
	--Event{} = ZoneID , MapID , �ݨD���� , KeyItemID , Function
	-- �ϰ��ˬd
	if Event[1] ~= -1 and Event[1] ~= ZoneID then
		return false
	end
	--�ˬdMapID
	if Event[2] ~= -1 and  Event[2] ~= MapID then
		return false;
	end
		
	--�ˬd���n���~
	if Event[4] ~= -1 and  CheckScriptFlag( MasterGUID , Event[4] ) == true then
--		say(MasterGUID, "Event[4]="..Event[4])
		return false;
	end
				
	--�ˬd�ݨD����
	if Event[3] ~= -1 and GetQuestState( MasterGUID , Event[3] ) == -1 then
	--	say(MasterGUID, "Event[3]="..Event[3])
		return false;
	end
	return true;
end

--�ɯŨƥ�
function Hsiang_RoleLevelUp( Lv )	
--	if Lv == 1 then
--		Say( OwnerID() , "Level 1" );
--	elseif Lv== 2 then
--		Say( OwnerID() , "Level 2" );
--	elseif Lv == 3 then 
--		Say( OwnerID() , "Level 3" );
--	end
--	Say(OwnerID(), "O")  --pet
--	Say(TargetID(), "T")  --pet

	local MasterGUID = ReadRoleValue( OwnerID() , EM_RoleValue_OwnerGUID ); --�D�H
	local PlayerRace = ReadRoleValue( MasterGUID , EM_RoleValue_RACE ) --�D�H���ر�

	local MyZoneID =  ReadRoleValue(  MasterGUID , EM_RoleValue_ZoneID )  -- �D�H��zone id (���B�z���y)
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )  --�D�H��zone id (�B�z���y)
--	Say(OwnerID(), MyZoneID)
--	Say(OwnerID(), MyZone)

	if MyZone == 31 then
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106557]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106556]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106562]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106558]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106560]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106565]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106564]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106566]][$SETVAR2=[106563]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[106567]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106670]][$SETVAR2=[106667]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[106666]][$SETVAR2=[106669]][$SETVAR3="..Lv.."]"  );
		-- 13����M�H���@��
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end

	elseif MyZone == 13 then
	--	Say(OwnerID(), "zone 13")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP2][$SETVAR1=[105390]][$SETVAR2="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105144]][$SETVAR2=[105140]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105143]][$SETVAR2=[105139]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105143]][$SETVAR2=[105139]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105139]][$SETVAR2=[105141]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105141]][$SETVAR2=[105193]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105141]][$SETVAR2=[105193]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105145]][$SETVAR2=[105142]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105145]][$SETVAR2=[105142]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105151]][$SETVAR2=[105150]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105151]][$SETVAR2=[105150]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105148]][$SETVAR2=[105147]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105148]][$SETVAR2=[105147]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105149]][$SETVAR2=[105146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[105149]][$SETVAR2=[105146]][$SETVAR3="..Lv.."]"  );
		end
	elseif  MyZone == 1 then -- 01-10 
	--	Say(OwnerID(), "zone 1")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100054]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100061]][$SETVAR2=[100030]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100055]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	elseif MyZone == 12 then -- 01-10
--		Say(OwnerID(), "zone 12")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101925]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101926]][$SETVAR2=[101924]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101929]][$SETVAR2=[101926]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101932]][$SETVAR2=[101933]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101935]][$SETVAR2=[101936]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101936]][$SETVAR2=[101938]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101939]][$SETVAR2=[101937]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[101942]][$SETVAR2=[101943]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	elseif MyZone == 2 then  -- 11-20
	--	Say(OwnerID(), "zone 2")
		if Lv== 2 then
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 3 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100054]][$SETVAR2=[100452]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 4 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100054]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 5 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100056]][$SETVAR2=[100146]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 6 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 7 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100156]][$SETVAR2=[100118]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 8 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100061]][$SETVAR2=[100030]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 9 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100152]][$SETVAR2=[100203]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 10 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100055]][$SETVAR2=[100063]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 11 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100132]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 12 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100211]][$SETVAR2=[100212]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 13 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100294]][$SETVAR2=[100082]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 14 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100079]][$SETVAR2=[100080]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 15 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100456]][$SETVAR2=[100399]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 16 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100295]][$SETVAR2=[100213]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 17 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100299]][$SETVAR2=[100298]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 18 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100379]][$SETVAR2=[100209]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 19 then 
			Tell( MasterGUID, OwnerID() , "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100064]][$SETVAR2=[100065]][$SETVAR3="..Lv.."]"  );
		elseif Lv == 20 then 
			Tell( MasterGUID, OwnerID() ,  "[SC_NEWPLAYERPET_LVUP][$SETVAR1=[100454]][$SETVAR2=[100455]][$SETVAR3="..Lv.."]"  );
		end
	end
end