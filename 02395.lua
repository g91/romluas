function Lua_ThridJob_Check()
	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ); --Ū�����a���D¾����
	local SubLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ); --Ū�����a����¾����
	if LV >=20 and SubLV >=20 then
		if ReadAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 ) == 0 then
			WriteAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 , 1);
		end
		-- �ĤT¾�~�ǰe�N
		if CheckFlag( OwnerID() , 540193 ) == false then
			BeginPlot(OwnerID(),"Lua_ThridJob_Deliver",0)
		end
		sleep(15)
		-- 5.0.0 �s�W �ĤT¾�~����ŦX�� ���˳Ƥ������
		if CheckFlag( OwnerID(), 540029 ) == false then
			BeginPlot(OwnerID(),"Lua_ThridJob_eqkeygive",0)
		end

		BeginPlot(OwnerID(),"Lua_ThridJob_Tip",0)
		if CheckFlag( OwnerID(),545158) == true then
		else
			SetFlag( OwnerID(), 545158, 1);
		end
	end
end

function Lua_ThridJob_Tip()
	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ); --Ū�����a���D¾����
	local SubLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ); --Ū�����a����¾����
	local DiStr = "[SC_THRIDJOB_1]"
	if  LV==60 and SubLV == 60 and CheckFlag(OwnerID(),549097)==false then	
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_THRIDJOB_4]", 0 );
		ScriptMessage( OwnerID() , OwnerID() , 2, "[SC_THRIDJOB_4]", 0 );
		SetFlag(OwnerID(),549097,1)
	elseif LV>=20 and SubLV >= 20 then
		DiStr = "[SC_THRIDJOB_2]"
	end

	if CheckFlag( OwnerID(),545166) == true then
	else
		if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_

			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , DiStr); --/*�A�w�g�i�H���o�ĤT¾�~�F!�H�ᤣ�A����?
			DialogSelectStr( OwnerID() , "[SO_YES]" );
			DialogSelectStr( OwnerID() , "[SO_NO]" );
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
			if( DialogSendOpen( OwnerID() ) == false ) then 
				--��ưe�X�����D
				return;
			end
			local n = 0;
			local DialogStatus = 0;
			while true do
				sleep( 1 )
				n = n + 1;
				DialogStatus = DialogGetResult( OwnerID() );
				--Say( OwnerID() , DialogStatus );
				if n > 600 then -- ���L�a�j��A600 = �@����
					--ScriptMessage( OwnerID() , OwnerID() , 0,  "[SC_OVERTIME_MSG]", 0 );
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				else
					--ScriptMessage( OwnerID() , OwnerID() , 0, "�X�k�j��", 0 );
				end
				if DialogStatus == -2  then -- ��l��
				elseif DialogStatus == -1  or ( DialogStatus == 0 ) then--���_
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				elseif ( DialogStatus == 1 ) then
					SetFlag( OwnerID(), 545166, 1);
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end

-- �ĤT¾�~�ǰe�N
function Lua_ThridJob_Deliver()
	SetFlag(OwnerID(),540193,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
end

-- �ĤT¾�~����ŦX�� �n�J & �ɯ�Ĳ�o�@��
function Lua_ThridJob_eqkeygive()
	--  5.0.0 �����˳Ƥ������ĤT��  -------------------------------------------------------------------
	SetFlag(OwnerID(),540029,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THRIDJOB_3]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THRIDJOB_3]" , C_SYSTEM )
	-- �r��: 
	-- �˳Ƥ��������X�R�F1�աA�Цb����˳Ƥ��������˳Ƥ������s�W�]�w�s���˳ƲզX�C
end


function Lua_ThridJob_Test(N)
	if N==0 then
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 , 0);
	else
		WriteAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 , 1);
	end
end
--ReadAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 )
--WriteAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 , 1 )


-- ���եΫ��O �Ω���ձ���ŦX�ɥX�{���T�����e
function lua_mika_thirdjob_testmsg()
		SetFlag(OwnerID(),540193,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
		--  5.0.0 �����˳Ƥ������ĤT��  -------------------------------------------------------------------
		SetFlag(OwnerID(),540029,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THRIDJOB_3]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THRIDJOB_3]" , C_SYSTEM )
		-- �r��: 
		-- �˳Ƥ��������X�R�F1�աA�Цb����˳Ƥ��������˳Ƥ������s�W�]�w�s���˳ƲզX�C
end

function lua_mika_thirdjob_test01()
	local OID = OwnerID()
	local account = ReadAccountFlagValue( OID , EM_AccountFlag_TJ_Check_1 , 1 ) 
	say (OID, "AccountFlagValue = "..account )
end