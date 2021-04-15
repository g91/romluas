function Hao_BuffTools()
	
	local Owner = OwnerID();
	local Target = TargetID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	CallPlot( Owner, "Hao_BuffToolsRunning", Owner, Target, Room );
end

function Hao_BuffToolsRunning( Owner, Target, Room )

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	--視窗已經打開了
		return 0;
	end
	AddBuff( Owner, 501570, 0, -1 );

	local String = "Target : "..GetName( Target ).."\n".."\n";
	String = String.."[SC_BUFFTOOLS_INSTRUCTION]";	-- 黃色字體為 Buff，紅色字體為 Debuff，白色字體為商城Buff。

	DialogCreate( Owner, EM_LuaDialogType_Select , String );	-- 目標鎖定：
	
	local Menu = {};
	Menu[0]="[SC_BUFFTOOLS_SHOW_ALL]";	-- 列出目標身上所有的 Buff 與 Debuff
	Menu[1]="[SC_BUFFTOOLS_GET]";	-- 給予目標身上指定的 Buff 或 Debuff
	Menu[2]="[SC_BUFFTOOLS_DELETE]";	-- 刪除目標身上的指定 Buff 或 Debuff
	Menu[3]="[SO_EXIT]";	-- 離開選單
	
	for i = 0, #Menu do
 		DialogSelectStr( Owner, Menu[i] );
	end

	if not DialogSendOpen( Owner ) then	-- 表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );
		return;
	end

	local Time = 0;
	local Select;

	while true do
		Sleep(1);
		Time = Time+1;
		Select = DialogGetResult( Owner );  --檢查使用者選取的項目
	--	DebugMsg( Owner, Room, "Time = "..Time..", Select = "..Select );

	 	if Time > 600 then  -- 60秒無動作，關閉對話視窗
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60 sec, window will close automatically.", 0 );	-- 閒置超過60秒，自動關閉視窗。
			break;
		end
	
		if Select == -1 or Select == 3 then	-- 中斷、離開選單
			break;
		elseif Select == 0 then	-- 查詢
			CancelBuff_NoEvent( Owner, 501570 );	-- 避免列出此隱藏 Buff
			local BuffList = Hao_BuffTools_ShowAll( Owner, Target, Room );	-- 先列出目標身上的 Buff 與 Debuff。
			if #BuffList == 0 then
				ScriptMessage( Owner, Owner, 0, "No search results.", 0 );	-- 查無結果
			end
			break;
		elseif Select ~= -2 then	-- - 2 為預設值，不處理，給予與刪除的共用 function
			CallPlot( Owner, "Hao_BuffTools_Settings" , Owner, Target, Room, Select  );
			break;
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end

function Hao_BuffTools_Settings( Owner, Target, Room, Select )	-- 設定檢查、給予、刪除

	local BuffList = Hao_BuffTools_ShowAll( Owner, Target, Room );	-- 先列出目標身上的 Buff 與 Debuff。

	if CheckBuff( Owner, 501570 ) then
		ScriptMessage( Owner, Owner, 0, "[SC_WINDOW_OPENED]", 0 );	-- 視窗已經打開了
		return 0;
	end

	AddBuff( Owner, 501570, 0, -1 );
	local String = "Target : "..GetName(Target);
--	ScriptMessage( Owner, Owner, 0, "[SC_107213_WORLDBOSS_0]"..GetName(Target), 0 );

	if Select == 1 then	-- 給予 Buff
		String = String.."\n".."\n".."[SC_BUFFTOOLS_GET_MENU]";
		DialogCreate( Owner, EM_LuaDialogType_Input, String );	-- 請輸入指定ID
	--	DialogCreate( Owner, EM_LuaDialogType_Input, "[SC_BUFFTOOLS_GET_MENU]" );	-- 請輸入指定ID
	else	-- 刪除 Buff
		String = String.."\n".."\n".."[SC_BUFFTOOLS_DELETE_MENU]";
		DialogCreate( Owner, EM_LuaDialogType_Input, String );	-- 請輸入指定 ID，刪除所有 Buff(Debuff) 時請輸入 - 1，刪除非商城類的所有 Buff(Debuff) 時請輸入 -2
	--	DialogCreate( Owner, EM_LuaDialogType_Input, "[SC_BUFFTOOLS_DELETE_MENU]" );	-- 請輸入指定 ID，刪除所有 Buff(Debuff) 時請輸入 - 1，刪除非商城類的所有 Buff(Debuff) 時請輸入 -2
	end
	DialogSelectStr( Owner, "[SO_YES]" );	-- 確定
	DialogSelectStr( Owner, "[SC_CANCEL]" );	-- 取消

	local Time = 0;
	local DialogStatus;

	if not DialogSendOpen( Owner ) then	-- 表單使用錯誤，回傳錯誤訊息
		ScriptMessage( Owner, Owner, 1, "[SYS_FIXEQ_DATA_ERROR]", 0 );	-- 資料有問題
		return;
	end

	while true do
		Sleep(1);
		Time = Time+1;
		DialogStatus = DialogGetResult( Owner );	-- 檢查使用者選取的項目

	 	if Time > 600 then	-- 60秒無動作，關閉對話視窗
			ScriptMessage( Owner, Owner, 0, "Idle for more than 60s, window will close automatically.", 0 );	-- 閒置超過60秒，自動關閉視窗。
			break;
		end

	--	if DialogStatus == -2 then	-- 預設值，不處理
	--	end

		if DialogStatus == -1 or DialogStatus == 1 then	-- 中斷、按下取消時
			break;
		end

		if DialogStatus == 0 then	-- 按下確定時
			local BuffID = tonumber( DialogGetInputResult( Owner ));	-- 取得使用者輸入字串
		--	DebugMsg( Owner, Room, "String = "..tostring(InputString) );
			if BuffID ~= nil then
				if ( BuffID >= 500000 and BuffID <= 509999 ) or ( BuffID >= 620001 and BuffID <= 629999 ) then	-- 當輸入字串為有效數字時
					local WordColor = "0xcFFFFFFFF";	-- 白色，商城 Buff 以此顏色表示
					if not DW_CheckGameInfoBitColumn( BuffID, "settingflagex", 1 ) then	-- 非商城Buff - 沒勾選基本法術中的旗標 - 「商城 Buff」
						if DW_CheckGameInfoBitColumn( BuffID, "settingflag", 0 ) then	-- 有勾選基本法術中的旗標 - 「好的法術」
							WordColor = "0xcFFFF0000"	-- 黃色，Buff 以此顏色表示
						else
							WordColor = "0xcFFB22222"	-- 紅色，Debuff 以此顏色表示
						end
					end
					if Select == 1 then	-- 給予 Buff
						AddBuff( Target, BuffID, 0, -1 );
						ScriptMessage( Owner, Owner, 0, "Get "..BuffID.." ".."["..BuffID.."]", WordColor );	-- 獲得 指定名稱的 Buff
					else	-- 刪除 Buff
						CancelBuff_NoEvent( Target, BuffID );
						ScriptMessage( Owner, Owner, 0, "Delete "..BuffID.." ".."["..BuffID.."]", WordColor );	-- 獲得 指定名稱的 Buff
					end
				elseif Select == 2 and BuffID == - 1 then	-- 刪除所有非商城類的 Buff(Debuff)
					for i = 1, #BuffList do
						if not BuffList[i].itemshop then
							CancelBuff_NoEvent( Target, BuffList[i].id );
						end
					end
					ScriptMessage( Owner, Owner, 0, "[SC_BUFFTOOLS_DELETE_BESIDES_ITEM_SHOP]", 0 );
				elseif Select == 2 and BuffID == - 2 then	-- 刪除所有 Buff(Debuff)
					for i = 1, #BuffList do
						CancelBuff_NoEvent( Target, BuffList[i].id );
					end
					ScriptMessage( Owner, Owner, 0, "[SC_BUFFTOOLS_DELETE_ALL]", 0 );
				else
					ScriptMessage( Owner, Owner, 0, "Invalid string.", 0 );	-- 無效字串
				end
				break;
			else
				ScriptMessage( Owner, Owner, 0, "Invalid string.", 0 );	-- 無效字串
				break;
			end
		end
	end
	CancelBuff_NoEvent( Owner, 501570 );
	DialogClose( Owner );
end

function Hao_BuffTools_ShowAll( Owner, Target, Room )

	local Owner = Owner or OwnerID();	-- 以目標頭像框指向的對象為檢查對象
	local Target = Target or TargetID();
	local Room = ReadRoleValue( Owner, EM_RoleValue_RoomID );
	local CountBuff = BuffCount( Target );
	local BuffList = {};

--	DebugMsg( Owner, Room, "Your target is "..GetName(Target)..", Total Buffs&Debuffs : "..CountBuff );
	if Target ~= Owner then
	--	Tell( Owner, Target, "[SC_422833_12]" );
	end
--	ScriptMessage( Owner, Owner, 0, "Target : "..GetName(Target), 0 );

	for Pos = 0 , CountBuff-1 , 1 do
		local Buff = {};
		local BuffID = BuffInfo( Target, Pos, EM_BuffInfoType_BuffID );
		local Flag = GameObjInfo_Int( BuffID, "settingflag" );	-- 取得資料庫中的 設定旗標 設定
		local FlagEx = GameObjInfo_int( BuffID, "settingflagex" );	-- 取得資料庫中的 settingflagex 設定
		local WordColor = "0xcFFFFFFFF";	-- 白色，商城 Buff 以此顏色表示

		Buff.id = BuffID;	-- 記錄 Buff ID
		Buff.itemshop = true;	-- 記錄 Buff 是否為商城類型

		if not DW_CheckGameInfoBitColumn( BuffID, "settingflagex", 1 ) then	-- 非商城Buff - 沒勾選基本法術中的旗標 - 「商城 Buff」
			if DW_CheckGameInfoBitColumn( BuffID, "settingflag", 0 ) then	-- 有勾選基本法術中的旗標 - 「好的法術」
				WordColor = "0xcFFFF0000"	-- 黃色，Buff 以此顏色表示
			else
				WordColor = "0xcFFB22222"	-- 紅色，Debuff 以此顏色表示
			end
			Buff.itemshop = false;
		end
		table.insert( BuffList, Buff );
		ScriptMessage( Owner, Owner, 0, String.format("%02d",Pos+1)..". "..BuffID.." ".."["..BuffID.."]" , WordColor );
	end
	return BuffList;
end