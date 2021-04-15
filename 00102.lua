-- OwnerID()	執行劇情的 NPC
-- TargetID()	交任務的玩家

function LuaInit_110091()
	-- 一開始就讓 NPC 自己對自己上 BUFF
	CastSpell( OwnerID(), OwnerID(), 490101 );
end

function LuaAfterClickQuestOb_110091()		-- 點完任務物件後的處理
	
	-- 取消掉任務物件身上的 BUFF
	CancelBuff( TargetID(), 500900 );	

	-- 命令被點的物件, 在 N 秒後執行某劇情
	BeginPlot( TargetID(), "LuaQuestDelayProcess_110091", 0 );

	return 1; -- 傳回 1 通知系統繼續點取
end

function LuaQuestDelayProcess_110091()		-- 點完任務物件後的處理

	-- 施展靜化法術
	CastSpell( OwnerID(), OwnerID(), 490102 );

	-- 延遲直到 Server 允許物件重新可以被執行
	Sleep( 300 );

	-- 取消掉任務物件身上的 靜化 BUFF
	CancelBuff( OwnerID(), 500902 );

	-- 重新上特定的 BUFF
	CastSpell( OwnerID(), OwnerID(), 490101 );

end