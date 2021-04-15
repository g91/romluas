function Lua_202800_Use()
	-- 2012.10.22 新建，修正 Lua_202800_Effect 因程式變動寫法，而無法使用的問題。
	local Player = OwnerID()
	CallPlot( Player , "Lua_202800_New_Effect" , Player )
	--
--	BeginPlot( OwnerID() , "Lua_202800_Effect" , 0 )
end
function Lua_202800_Effect()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_Input  , GetString("SC_202800_1")); -- 請輸入你想自定的名稱。
		DialogSelectStr( OwnerID() , GetString("SC_202800_2") );	-- 確定
		DialogSelectStr( OwnerID() , GetString("SC_202800_3") );	-- 取消
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	-- 資料有問題
			--資料送出有問題
			return;
		end

		local SelectID = -2;
		local inputstring = ""
		DialogClose( OwnerID() )
		CancelBuff( OwnerID(), 501570 );--最後清除BUFF

		for i = 0 , 600 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 600 then
				inputstring = DialogGetInputResult( OwnerID() );

				TargetName = DialogGetInputResult( OwnerID() );

				if string.len(TargetName) <= 32 then
					if( SelectID == 0 ) then
						if CountBodyItem( OwnerID() , 202800 ) >= 1 then
							if SetCustomTitleString( OwnerID(), inputstring ) == true then
								ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_202800_4"),C_SYSTEM)	-- 自定稱號成功！
								DelBodyItem( OwnerID() , 202800 , 1 )
							else
								ScriptMessage( OwnerID(),OwnerID(),1,"[SC_VALENTINE_RUNMESSAGE7]",0)	--你輸入的文字含有不雅文字。
							end
						else
							ScriptMessage( OwnerID(),OwnerID(),1,GetString("SYS_FIXEQ_DATA_ERROR"),0)	-- 資料有問題
						end
						break
					end
				else
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_202800_5]",0)	--你輸入的字數過多，無法定義稱號。
				end
					
				break

			elseif i == 600 then
				ScriptMessage( OwnerID(),OwnerID(),1,GetString("SC_OVERTIME_MSG"),0)	-- 等待時間過久。		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );	-- 已經開啟一個對話選項
	end

end

function Lua_202800_New_Effect( Player )	-- 2012.10.22 新建，修正 Lua_202800_Effect 因程式變動寫法，而無法使用的問題。

	local Buff = 501570
	
	if CheckBuff( Player , Buff ) == true then 
		ScriptMessage( Player , Player , 0 , "[SC_WINDOW_OPENED]", 0 )	--視窗已經打開了
		return
	end
	
	AddBuff( Player , Buff , 0 , -1 )
	DialogCreate( Player , EM_LuaDialogType_Input , "[SC_202800_1]" )	-- 請輸入你想自定的名稱。
	DialogSelectStr( Player , "[SC_202800_2]" )	-- 確定
	DialogSelectStr( Player , "[SC_202800_3]" )	-- 取消
	
	if ( DialogSendOpen( Player ) == false )  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )
		return
	end

	local Time = 0
	local DialogStatus
	local inputstring = ""
	local Item = 202800	-- 自訂稱號筆記
	
	while true do
		if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Player , Player , 0 , "[SC_BUFFNPC_07]" , 0 ) -- 等待時間過久
			break
		end
		DialogStatus = DialogGetResult( Player )  --檢查使用者選取的項目
	--	DebugMsg( Player , 0 , "Dialog = "..DialogStatus )
		if DialogStatus ~= -2 and DialogStatus ~= -1 then -- 初始化、中斷
			inputstring = DialogGetInputResult( Player )
			if String.len(inputstring) <= 32 then	-- 輸入字串<= 32字元時
				if DialogStatus == 0 then  -- 有填入字串
					if CountBodyItem( Player , Item ) >= 1 then
						if SetCustomTitleString( Player , inputstring ) == true then
							ScriptMessage( Player , Player , 1 ,"[SC_202800_4]" ,C_SYSTEM )	-- 自定稱號成功！
							DelBodyItem( Player , Item , 1 )
						else
							ScriptMessage( Player , Player , 1 , "[SC_VALENTINE_RUNMESSAGE7]" , 0 )	--你輸入的文字含有不雅文字。
						end
					else
						ScriptMessage( Player , Player , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	-- 資料有問題
					end
				end
				break
			else
				ScriptMessage( Player , Player , 1 , "[SC_202800_5]" , 0 )	--你輸入的字數過多，無法定義稱號。
			end
			break
		end
		sleep(1)
		Time = Time+1
	end
	CancelBuff( Player , Buff )
	DialogClose( Player )
end