--npc�k�N



function LuaN_mika_09summerlove_joingood() --�����a�R�ʤ��k
	CloseSpeak(OwnerID())  --������ܵ���
	if CheckFlag(OwnerID() , 542979) == true or CheckBuff(OwnerID() , 504181 ) == true or CheckFlag(OwnerID() , 542982 ) == true or CheckFlag(OwnerID() , 542982 ) == true then  --���C�줧�k
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG13]" , C_SYSTEM )	--�A�����C�줧�k�ޯ�A�L�k�P�ɫ������ޯ�C
	elseif CheckBuff(OwnerID() , 504156 ) == true or CheckBuff(OwnerID() , 504180 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG16]" , C_SYSTEM )	--�A�w�������ޯ�A�L�k�P�ɫ����ۦP�ޯ�C
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_19]" , C_SYSTEM )	--�A����F�p�Ѩϵ������k�N�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_19]" , C_SYSTEM )	--�A����F�p�Ѩϵ������k�N�I
		SetFlag( OwnerID()  , 542981 , 1 ) -- �� �Ѩ϶i�椤(�@��)
		AddBuff( OwnerID(),  504156, 1, 21600) --6hr  ���ܸ`�k�N�ޯ� 
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
	end

end


function LuaN_mika_09summerlove_joinbad() --�����a�C�줧�k
	CloseSpeak(OwnerID())  --������ܵ���
	if CheckBuff(OwnerID(), 504156) == true or CheckBuff(OwnerID(), 504180) == true or CheckFlag(OwnerID(), 542978 ) == true or CheckFlag(OwnerID(), 542983 ) == true then  --���R�ʤ��k �η�Ѥw�L��
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG12]" , C_SYSTEM )	--�A�����R�ʤ��k�ޯ�A�L�k�P�ɫ������ޯ�C
	elseif CheckBuff(OwnerID() , 504160 ) == true or CheckBuff(OwnerID() , 504181 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG16]" , C_SYSTEM )	--�A�w�������ޯ�A�L�k�P�ɫ����ۦP�ޯ�C
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_20]" , C_SYSTEM )	--�A����F�p�c�]�������k�N�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_20]" , C_SYSTEM )	--�A����F�p�c�]�������k�N�I
		SetFlag( OwnerID()  , 542982 , 1 ) -- �� �c�]�i�椤(�@��)
		AddBuff( OwnerID(),  504160, 1, 21600) --6hr  ���ܸ`�k�N�ޯ� 
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
	end
end



function LuaM_mika_09summerlove_magic()  --�򥻪k�N����@��

	local go_angel = CheckFlag(OwnerID()  , 542981 ) -- �i��ѨϤ�(�@��)
	local go_devil = CheckFlag(OwnerID()  , 542982 ) -- �i��c�]��(�@��)
	local goon_angel = CheckFlag(OwnerID()  , 542983 ) -- �i��ѨϤ�(�ӫ�)
	local goon_devil = CheckFlag(OwnerID()  , 542984 ) -- �i��c�]��(�ӫ�)
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --�I�k��H���ʧO
	local usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���


	if go_angel == true then --���p�Ѩ϶i��X��
		if  CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --���߸Hbuff
			if BorG_Target == 0 then --��H�O�k��
				CancelBuff( TargetID(), 504223 ) -- ������H�� �¤�buff  
				Sleep(10)
				CancelBuff( TargetID(), 504338 ) -- ������H�� �¤�buff  
				Sleep(10)
			elseif BorG_Target == 1 then --��H�O�k��
				CancelBuff( TargetID(), 504161 ) -- ������H�� �¤�buff  
				Sleep(10)
				CancelBuff( TargetID(), 504222 ) -- ������H�� �¤�buff  
				Sleep(10)
			end
			GiveBodyItem( OwnerID(), 205725 , 1) -- ���p�Ѩ�����X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ��ơG[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ��ơG[$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				CancelBuff( OwnerID(), 504156 ) -- �����ۤv���W�� �Ѩϧޯ�  
				SetFlag( OwnerID()  , 542981 , 0 ) -- �R �Ѩ϶i�椤(�@��)
				SetFlag( OwnerID()  , 542980 , 1 ) -- �� ���o�I������§�����
				SetFlag( OwnerID()  , 542978 , 1 ) -- �� ��Ѥw�����L�Ѩ�
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
			if BorG_Target == 0 then --��H�O�k��
				CancelBuff( TargetID(), 504158 ) -- ������H�� �C��buff(�k)
				Sleep(10)
				CancelBuff( TargetID(), 504221 ) -- ������H�� �C��buff(�k)
				Sleep(10)
				AddBuff( TargetID(), 504335, 1, 900 ) -- ���Y�J�R�e�����l
			elseif BorG_Target == 1 then --��H�O�k��
				CancelBuff( TargetID(), 504157 ) -- ������H�� �C��buff (�k)
				Sleep(10)
				CancelBuff( TargetID(), 504220 ) -- ������H�� �C��buff (�k)
				Sleep(10)
				AddBuff( TargetID(), 504162, 1, 900 ) -- ���Y�J�R�e�����D
			end
			GiveBodyItem( OwnerID(), 205725 , 1) -- ���p�Ѩ�����X1 
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ��ơG[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ��ơG[$VAR1] / 5
			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				CancelBuff( OwnerID(), 504156 ) -- �����ۤv���W�� �Ѩϧޯ�  
				SetFlag( OwnerID(), 542981 , 0 ) -- �R �Ѩ϶i�椤(�@��)
				SetFlag( OwnerID(), 542980 , 1 ) -- �� ���o�I������§�����
				SetFlag( OwnerID(), 542978 , 1 ) -- �� ��Ѥw�����L�Ѩ�
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
		else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
		end
	elseif go_devil == true then --���p�c�]�i��X��
		if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
			if BorG_Target == 0 then --��H�O�k��
				CancelBuff(TargetID(), 504335 ) -- �R����buff  
				Sleep(10)
				CancelBuff(TargetID(), 504339 ) -- �R����buff  
				Sleep(10)
				AddBuff( TargetID(), 504223, 1, 900 ) -- ���߸H�d�˪����l
			elseif BorG_Target == 1 then --��H�O�k��
				CancelBuff(TargetID(), 504162 ) -- �R����buff  
				Sleep(10)
				CancelBuff(TargetID(), 504337 ) -- �R����buff  
				Sleep(10)
				AddBuff( TargetID(), 504161, 1, 900 ) -- ���߸H�d�˪����D
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- ���p�c�]����X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ���:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ���:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				CancelBuff( OwnerID(), 504160 ) -- �����ۤv���W�� �C��ޯ�  
				SetFlag( OwnerID()  , 542982 , 0 ) -- �R �c�]�i�椤(�@��)
				SetFlag( OwnerID()  , 542973 , 1 ) -- �� ���o�I������§�����
				SetFlag( OwnerID()  , 542979 , 1 ) -- �� ��Ѥw�����L�c�]
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --���߸Hbuff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
		else
			local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  ) 
			if BorG_Target == 0 then --��H�O�k��
				AddBuff( TargetID(), 504158, 1, 900 ) -- �����buff
			elseif BorG_Target == 1 then --��H�O�k��
				AddBuff( TargetID(), 504157, 1, 900 ) -- ������buff
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- ���p�c�]����X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ���:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ���:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��A�i�i��^��������y�C
				CancelBuff( OwnerID(), 504160 ) -- �����ۤv���W�� �C��ޯ�  
				SetFlag( OwnerID()  , 542982 , 0 ) -- �R �c�]�i�椤(�@��)
				SetFlag( OwnerID()  , 542973 , 1 ) -- �� ���o�I������§�����
				SetFlag( OwnerID()  , 542979 , 1 ) -- �� ��Ѥw�����L�c�]
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end						 							
		end
	end
end


--buff�ɶ���� ����R���i�椤key

function Lua_mika_summerlove_Keyitem1() --�Ѩ�(�@��)
	SetFlag( OwnerID()  , 542981 , 0 ) -- �R �Ѩ϶i�椤(�@��)
--	Say(OwnerID(), "del key - angel normal.")
end

function Lua_mika_summerlove_Keyitem2() --�c�](�@��)
	SetFlag( OwnerID()  , 542982 , 0 ) -- �R �c�]�i�椤(�@��)
--	Say(OwnerID(), "del key - devil normal.")
end

function Lua_mika_summerlove_Keyitem3() --�Ѩ�(�ӫ�)
	SetFlag( OwnerID()  , 542983 , 0 ) -- �R �Ѩ϶i�椤(�ӫ�)
--	Say(OwnerID(), "del key - angel mall.")
end

function Lua_mika_summerlove_Keyitem4() --�c�](�ӫ�)
	SetFlag( OwnerID()  , 542984 , 0 ) -- �R �c�]�i�椤(�ӫ�)
--	Say(OwnerID(), "del key - devil mall.")
end