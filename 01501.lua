--�ӫ��Ϊk�N
function LuaI_205732book( Option ) --���o�R�ʤ��k�k�N  ���b���~�ϥΤW

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() ~= OwnerID() )   then   --�Y��H�O�O�H
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
				return false
			elseif CheckBuff( TargetID() , 504156) == true or CheckBuff( TargetID() , 504180) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG10]" , C_SYSTEM )	--�A�w�����D��ĪG�A�L�k���ƨϥΡC
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG10]"  , C_SYSTEM )	--�A�w�����D��ĪG�A�L�k���ƨϥΡC
				return false
			elseif CheckBuff( TargetID() , 504160) == true or CheckBuff( TargetID() , 504181) == true then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG13]" , C_SYSTEM )	--�A�����C�줧�k�ޯ�A�L�k�P�ɫ������ޯ�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG13]"  , C_SYSTEM )	--�A�����C�줧�k�ޯ�A�L�k�P�ɫ������ޯ�C
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
			return false
		end
	elseif ( Option == "USE" ) then	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MALL01]" , C_SYSTEM )	--�A���o�F�ޯ�u�R�ʤ��k�v�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MALL01]" , C_SYSTEM )	--�A���o�F�ޯ�u�R�ʤ��k�v�C
		AddBuff( OwnerID(),  504180, 1, 21600) --2hr  �R�ʤ��k 
		SetFlag( OwnerID(), 542983 , 1 ) -- �� �Ѩ϶i�椤(�ӫ�)
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
	end
end

function LuaI_205733book( Option )  --���o�C�줧�k�k�N  ���b���~�ϥΤW

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			if ( TargetID() ~= OwnerID() )   then   --�Y��H�O�O�H
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
				return false
			elseif CheckBuff( TargetID() , 504160) == true or CheckBuff( TargetID() , 504181) == true then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG10]" , C_SYSTEM )	--�A�w�����D��ĪG�A�L�k���ƨϥΡC
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG10]"  , C_SYSTEM )	--�A�w�����D��ĪG�A�L�k���ƨϥΡC 
				return false
			elseif CheckBuff( TargetID() , 504156) == true or CheckBuff( TargetID() , 504180) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG12]" , C_SYSTEM )	--�A�����R�ʤ��k�ޯ�A�L�k�P�ɫ������ޯ�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG12]"  , C_SYSTEM )	--�A�����R�ʤ��k�ޯ�A�L�k�P�ɫ������ޯ�C
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--�����~�u���ۤv�ϥΡC
			return false
		end

	elseif ( Option == "USE" ) then	
		ScriptMessage(  OwnerID() ,  OwnerID() , 1 , "[SC_0908SEANSON_MALL02]" , C_SYSTEM )	--�A���o�F�ޯ�u�C�줧�k�v�C
		ScriptMessage(  OwnerID() ,  OwnerID() , 0 , "[SC_0908SEANSON_MALL02]" , C_SYSTEM )	--�A���o�F�ޯ�u�C�줧�k�v�C
		AddBuff(  OwnerID(),  504181, 1, 21600) --2hr  �C�줧�k 
		SetFlag(  OwnerID(), 542984 , 1 ) -- �� �c�]�i�椤(�ӫ�)
		WriteRoleValue(  OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
	end
end


function LuaM_mika_09summerlove_checkm() --�I�k�ˬd-�R��.�C�줧�k
	local go_angel = CheckFlag(OwnerID()  , 542981 ) -- �i��ѨϤ�(�@��)
	local go_devil = CheckFlag(OwnerID()  , 542982 ) -- �i��c�]��(�@��)

	local goon_angel = CheckFlag(OwnerID()  , 542983 ) -- �i��ѨϤ�(�ӫ�)
	local goon_devil = CheckFlag(OwnerID()  , 542984 ) -- �i��c�]��(�ӫ�)

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) then   --�Y�S����H�ι�H�O�ۤv
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )	--�I�k��H�����T�A�й��L���a�ϥΡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG01]"  , C_SYSTEM )	--�I�k��H�����T�A�й��L���a�ϥΡC
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --�I�k��H�O���a
			local BuffType = 0
			local Count = BuffCount ( TargetID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
				if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
					BuffType = GameObjInfo_int ( BuffID , "AssistType" )
					break
				end
			end
			if BuffType == 68 then				       	    --/*���M�����A
				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --�ϥι�H���M���ĪG�A�L�k�ϥΡC
				return false
			else
				if goon_angel == true or go_angel == true then
					if CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --���߸Hbuff
						return true
					elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
						return true
					elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
						return false
					end
				elseif  goon_devil == true or go_devil == true then
					if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
						return true
					elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --���߸Hbuff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						return false
					elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
						return false
					else
						return true
					end
				end
			end

		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--�I�k��H�����T�A�й缾�a�ϥΡC
			return false
		end
	end
end


function LuaM_mika_09summerlove_mallmagic()  --�򥻪k�N����@�� (�ӫ�)

	local goon_angel = CheckFlag(OwnerID() , 542983 ) -- �i��ѨϤ�(�ӫ�)
	local goon_devil = CheckFlag(OwnerID() , 542984 ) -- �i��c�]��(�ӫ�)
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --�I�k��H���ʧO
	local usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���

	if goon_angel == true then --���p�Ѩ϶i��X��
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
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				CancelBuff( OwnerID(), 504180 ) -- �����ۤv���W�� �Ѩϧޯ�  
				SetFlag( OwnerID()  , 542983 , 0 ) -- �R �Ѩ϶i�椤(�@��)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
			if BorG_Target == 0 then --��H�O�k��
				CancelBuff( TargetID(), 504158 ) -- ������H�� �C��buff(�k)
				Sleep(10)
				CancelBuff( TargetID(), 504221 ) -- ������H�� �C��buff(�k)
				Sleep(10)				
				AddBuff( TargetID(), 504339, 1, 900 ) -- ���Y�J�R�e�����l
			elseif BorG_Target == 1 then --��H�O�k��
				CancelBuff( TargetID(), 504157 ) -- ������H�� �C��buff (�k)
				Sleep(10)
				CancelBuff( TargetID(), 504220 ) -- ������H�� �C��buff (�k)
				Sleep(10)
				AddBuff( TargetID(), 504337, 1, 900 ) -- ���Y�J�R�e�����D
			end
			Sleep(10)  
			GiveBodyItem( OwnerID(), 205725 , 1) -- ���p�Ѩ�����X1 
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ��ơG[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ��ơG[$VAR1] / 5
			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				CancelBuff( OwnerID(), 504180 ) -- �����ۤv���W�� �Ѩϧޯ�  
				SetFlag( OwnerID(), 542983 , 0 ) -- �R �Ѩ϶i�椤(�@��)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
		else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--�ϥι�H�S���ݭn�Ѱ����ĪG�C
		end
	elseif goon_devil == true then --���p�c�]�i��X��
		if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--���R��buff 
			if BorG_Target == 0 then --��H�O�k��
				CancelBuff(TargetID(), 504335 ) -- �R����buff  
				Sleep(10)
				CancelBuff(TargetID(), 504339 ) -- �R����buff  
				Sleep(10)
				AddBuff( TargetID(), 504338, 1, 900 ) -- ���߸H�d�˪����l
			elseif BorG_Target == 1 then --��H�O�k��
				CancelBuff(TargetID(), 504162 ) -- �R����buff  
				Sleep(10)
				CancelBuff(TargetID(), 504337 ) -- �R����buff 
				Sleep(10)
				AddBuff( TargetID(), 504222, 1, 900 ) -- ���߸H�d�˪����D
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- ���p�c�]����X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ���:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM ) --�w�ϥΦ���:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				CancelBuff( OwnerID(), 504181 ) -- �����ۤv���W�� �C��ޯ�  
				SetFlag( OwnerID()  , 542984 , 0 ) -- �R �c�]�i�椤(�@��)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end
		elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --���߸Hbuff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--���C��buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--�ϥι�H�w�g�����ĪG�A�L�k�I��k�N�C
		else
			if BorG_Target == 0 then --��H�O�k��
				AddBuff( TargetID(), 504221, 1, 900 ) -- �����buff
			elseif BorG_Target == 1 then --��H�O�k��
				AddBuff( TargetID(), 504220, 1, 900 ) -- ������buff
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- ���p�c�]����X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --����+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --�ϥΦ���
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--�w�ϥΦ���:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--�w�ϥΦ���:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--�A�������I�k���Ƥw�Χ��C
				CancelBuff( OwnerID(), 504181 ) -- �����ۤv���W�� �C��ޯ�  
				SetFlag( OwnerID()  , 542984 , 0 ) -- �R �c�]�i�椤(�@��)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --�M�Ŧ���
			end						 							
		end
	end
end