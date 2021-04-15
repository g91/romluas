function Z34_NPC124257_Initial()		-- 庫魯依斯門
	local npc = OwnerID();

	SetPlot( npc , "touch" , "Z34_NPC124257_Touch" , 15 );
	CallPlot( npc , "SetMark_FlightPoint" );			-- 傳送翅膀圖示

	return true;
end

function Z34_NPC124257_Touch()		-- 庫魯依斯門
	local player = OwnerID();
	local QuestID = 427390;	-- 前進庫魯依斯島

	if CheckAcceptQuest( player , QuestID ) == true or CheckCompleteQuest( player , QuestID ) == true then	-- 判斷是否有接任務
	local String = "[Z34_QUEST427360_02]"		-- 你要使用這個傳送門？
	if String == -1 then
		ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	--資料送出有問題
		return 0
	end
	if CheckBuff( Player , 501570) == false then  --增加檢查判斷
		DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( Player , GetString("SO_YES") );
		DialogSelectStr( Player , GetString("SO_NO") );
		AddBuff( Player, 501570, 0 ,-1 );	--然後給予BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	-- 資料送出有問題
			return 0
		end
		-- 通用取得DIALOG判斷( 取得的物件ID、存在的秒數、距離限制、距離限制參考的目標 )
		local SelectID = EX_GetDialogResoult( Player, 30 , 75 , TargetID() )
		DialogClose( Player )
		CancelBuff( Player, 501570 );	-- 最後清除BUFF
		if SelectID == 0  then
			CastSpell( Player , Player , 491008 )
			sleep( 5 )
			ChangeZone( Player , 35, 0, -2240, -30, -860, 275 )	-- 庫魯依斯島
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
	end

	else
		ScriptMessage( player, player, 0, "[Z34_QUEST427360_01]", 0 )		-- 訊息：你並不具備使用這個傳送門的資格！
		ScriptMessage( player, player, 1, "[Z34_QUEST427360_01]", C_Red )
	end
end

function Z34_NPC124401_Initial()		-- 庫魯依斯門
	local npc = OwnerID();

	SetPlot( npc , "touch" , "Z34_NPC124401_Touch" , 15 );
	CallPlot( npc , "SetMark_FlightPoint" );			-- 傳送翅膀圖示

	return true;
end

function Z34_NPC124401_Touch()		-- 核心要塞門
	local player = OwnerID();

	local String = "[Z34_QUEST427360_02]"		-- 你要使用這個傳送門？
	if String == -1 then
		ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	--資料送出有問題
		return 0
	end
	if CheckBuff( Player , 501570) == false then  --增加檢查判斷
		DialogCreate( Player , EM_LuaDialogType_YesNo  , String);
		DialogSelectStr( Player , GetString("SO_YES") );
		DialogSelectStr( Player , GetString("SO_NO") );
		AddBuff( Player, 501570, 0 ,-1 );	--然後給予BUFF
		if( DialogSendOpen( Player ) == false ) then 
			ScriptMessage( Player, Player, 1, GetString("SYS_FIXEQ_DATA_ERROR"), 0 )	-- 資料送出有問題
			return 0
		end
		-- 通用取得DIALOG判斷( 取得的物件ID、存在的秒數、距離限制、距離限制參考的目標 )
		local SelectID = EX_GetDialogResoult( Player, 30 , 75 , TargetID() )
		DialogClose( Player )
		CancelBuff( Player, 501570 );	-- 最後清除BUFF
		if SelectID == 0  then
			CastSpell( Player , Player , 491008 )
			sleep( 5 )
			ChangeZone( Player , 34, 0, -4044, 530, -2933, 195 )	-- 核心要塞
			return 1
		elseif SelectID == 1  then
			return 0
		else 
			return 0
		end
	else
		ScriptMessage( Player , Player , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
function Z35_NPC124333and34_ClickBefore()	-- 獨眼巨人＆戰牛擺飾
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427467;	-- 找出聯手的原因

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		return true;		-- 給過
	end

	return false;			-- 不給過

end

function  Z35_NPC124333and34_ClickAfter()		-- 獨眼巨人＆戰牛擺飾
	local player = OwnerID();
	local npc = TargetID();
	local QuestID = 427467;		-- 找出聯手的原因
	local Obj1 = 124333		-- 獨眼巨人擺飾
	local Obj2 = 124334		-- 戰牛擺飾
	local Item1 = 243446;		-- 合作密件
	local Item2 = 243447;		-- 神諭之示
	local Flag = 549376;		-- 找出獨眼巨人和戰牛族與不息之子聯手的緣由

	if CheckAcceptQuest( player , QuestID ) == true then	-- 有接任務
		if ReadRoleValue( npc, EM_RoleValue_OrgID ) == Obj1 and CountBodyItem( player, Item1 ) < 1 then
			GiveBodyItem( player, Item1, 1 );
		end
		if ReadRoleValue( npc, EM_RoleValue_OrgID ) == Obj2 and CountBodyItem( player, Item2 ) < 1 then
			GiveBodyItem( player, Item2, 1 );
		end
		if CountBodyItem( player, Item1 ) >= 1 and CountBodyItem( player, Item2 ) >= 1 then
			SetFlag( player , Flag , 1 );
		end
	end
	
	return true;
end