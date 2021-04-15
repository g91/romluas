function Lua_ThridJob_Check()
	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ); --讀取玩家的主職等級
	local SubLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ); --讀取玩家的副職等級
	if LV >=20 and SubLV >=20 then
		if ReadAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 ) == 0 then
			WriteAccountFlagValue( OwnerID() , EM_AccountFlag_TJ_Check_1 , 1 , 1);
		end
		-- 第三職業傳送術
		if CheckFlag( OwnerID() , 540193 ) == false then
			BeginPlot(OwnerID(),"Lua_ThridJob_Deliver",0)
		end
		sleep(15)
		-- 5.0.0 新增 第三職業條件符合時 給裝備切換欄位
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
	local LV = ReadRoleValue( OwnerID() , EM_RoleValue_LV ); --讀取玩家的主職等級
	local SubLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB ); --讀取玩家的副職等級
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
		if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷

			DialogCreate( OwnerID() , EM_LuaDialogType_YesNo  , DiStr); --/*你已經可以取得第三職業了!以後不再提醒?
			DialogSelectStr( OwnerID() , "[SO_YES]" );
			DialogSelectStr( OwnerID() , "[SO_NO]" );
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
			if( DialogSendOpen( OwnerID() ) == false ) then 
				--資料送出有問題
				return;
			end
			local n = 0;
			local DialogStatus = 0;
			while true do
				sleep( 1 )
				n = n + 1;
				DialogStatus = DialogGetResult( OwnerID() );
				--Say( OwnerID() , DialogStatus );
				if n > 600 then -- 防無窮迴圈，600 = 一分鐘
					--ScriptMessage( OwnerID() , OwnerID() , 0,  "[SC_OVERTIME_MSG]", 0 );
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				else
					--ScriptMessage( OwnerID() , OwnerID() , 0, "合法迴圈", 0 );
				end
				if DialogStatus == -2  then -- 初始化
				elseif DialogStatus == -1  or ( DialogStatus == 0 ) then--中斷
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break;
				elseif ( DialogStatus == 1 ) then
					SetFlag( OwnerID(), 545166, 1);
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break;
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
		end
	end
end

-- 第三職業傳送術
function Lua_ThridJob_Deliver()
	SetFlag(OwnerID(),540193,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
end

-- 第三職業條件符合時 登入 & 升級觸發劇情
function Lua_ThridJob_eqkeygive()
	--  5.0.0 給予裝備切換欄位第三欄  -------------------------------------------------------------------
	SetFlag(OwnerID(),540029,1)
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THRIDJOB_3]" , C_SYSTEM )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THRIDJOB_3]" , C_SYSTEM )
	-- 字串: 
	-- 裝備切換欄位數擴充了1組，請在角色裝備介面中的裝備切換按鈕上設定新的裝備組合。
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


-- 測試用指令 用於測試條件符合時出現的訊息內容
function lua_mika_thirdjob_testmsg()
		SetFlag(OwnerID(),540193,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_JOBGIVETRANSPORT][$SETVAR1=[497649]]" , C_SYSTEM )
		--  5.0.0 給予裝備切換欄位第三欄  -------------------------------------------------------------------
		SetFlag(OwnerID(),540029,1)
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_THRIDJOB_3]" , C_SYSTEM )
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_THRIDJOB_3]" , C_SYSTEM )
		-- 字串: 
		-- 裝備切換欄位數擴充了1組，請在角色裝備介面中的裝備切換按鈕上設定新的裝備組合。
end

function lua_mika_thirdjob_test01()
	local OID = OwnerID()
	local account = ReadAccountFlagValue( OID , EM_AccountFlag_TJ_Check_1 , 1 ) 
	say (OID, "AccountFlagValue = "..account )
end