function lua_skwerl_mobius_npc_town() --城裡傳送NPC
local player=OwnerID()

		SetSpeakDetail(player, "[SKWERL_MOBIUS_42]" )
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_24]" , "lua_skwerl_mobius_mode_time", 0)--傳送到安德爾斯靶場
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_47]" , "lua_FN_mobius_NPCtrade_reward", 0)--傳送到安德爾斯靶場

end

-----------傳送到靶場的系統------------------------------
function lua_skwerl_mobius_timemodeconfirm() --選擇計時模式
	Callplot(OwnerID(), "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_41]","lua_skwerl_mobius_mode_time","")
end


function lua_skwerl_mobius_mode_time()
	ChangeZone(OwnerID(), 360, -1, -37.2, 961.6, 324.8, 263.3) ---把玩家傳到場地	
end



------------------------------------------------------------------------------------------------

function lua_skwerl_mobius_npc() ---活動現場NPC
	local player=OwnerID()
	if CheckFlag( player, 546722) == true then --玩家今天玩過活動的旗標
		SetSpeakDetail(player, "[SKWERL_MOBIUS_30]" )-- 你已經完成今天的訓練了，請明天再來。
--		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_21]" , "lua_skwerl_mobius_restart_check", 0)--當日重製
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_39]" , "lua_skwerl_mobius_rtb", 0)--返回凡瑞納斯城
		
	else

		SetSpeakDetail(player, "[SKWERL_MOBIUS_16]" ) --歡迎來到靶場，你想參與那一個訓練？ 不過請注意，不同的訓練模式會有不同的標準與獎勵！
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_14]" , "lua_skwerl_mobius_timemodemenu", 0)--計時模式
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_15]" , "lua_skwerl_mobius_survivalmodemenu", 0)--生存模式
		AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_39]" , "lua_skwerl_mobius_rtb", 0)--返回凡瑞納斯城

	end
end
-------------------------------第2層----------------------------------------------
function lua_skwerl_mobius_timemodemenu() --計時模式
	local player= OwnerID()
	SetSpeakDetail(player, "[SKWERL_MOBIUS_26]" ) --計時模式
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_25]" , "lua_skwerl_mobius_start_check", 0) --開始遊戲
	AddSpeakOption( player, TargetID( ), "[SKWERL_MOBIUS_28]" , "lua_skwerl_mobius_rulestime", 0)--遊戲規則與說明
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_npc", 0 ) --回上一頁
end

function lua_skwerl_mobius_survivalmodemenu() --生存模式
	local player= OwnerID()
	SetSpeakDetail(player, "[SKWERL_MOBIUS_27]" )  ---生存模式
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_25]" , "lua_skwerl_mobius_start_check2", 0) --開始遊戲
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_28]" , "lua_skwerl_mobius_rulessurvival", 0)--遊戲規則與說明
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_npc", 0 ) --回上一頁
end

-------------------------------第3層----------------------------------------------

function lua_skwerl_mobius_rulestime() --遊戲規則與說明
	SetSpeakDetail( OwnerID(), "[SKWERL_MOBIUS_29]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_timemodemenu", 0 ) --回上一頁
end

function lua_skwerl_mobius_rulessurvival() --遊戲規則與說明
	SetSpeakDetail( OwnerID(), "[SKWERL_MOBIUS_29]" ) 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_survivalmodemenu", 0 ) --回上一頁
end
----------------------回城傳送------------------------
function lua_skwerl_mobius_rtb()---回城確認
	Callplot(OwnerID(), "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_40]","lua_skwerl_mobius_mode_returntotown","")
end





-------------------------遊戲執行----------------------------------------------
function lua_skwerl_mobius_start_check() ---計時模式確認視窗
   	local player=OwnerID()	
	SetSpeakDetail(player, "[SKWERL_MOBIUS_41]" ) --參加訓練需要30個[203038]，你確定要參加嗎？
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_23]" , "lua_skwerl_mobius_start", 0) --確定
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_timemodemenu", 0 ) --回上一頁
end

function lua_skwerl_mobius_start_check2() ---生存闖關模式確認視窗
   	local player=OwnerID()	
	SetSpeakDetail(player, "[SKWERL_MOBIUS_41]" ) --參加訓練需要30個[203038]，你確定要參加嗎？
	AddSpeakOption(player, TargetID( ), "[SKWERL_MOBIUS_23]" , "lua_skwerl_mobius_start2", 0) --確定
	AddSpeakOption( player, TargetID(), "[SC_111352_2]" , "lua_skwerl_mobius_survivalmodemenu", 0 ) --回上一頁
end


function lua_skwerl_mobius_start() ---計時模式
	local player=OwnerID()
	local npc= TargetID()
	local coincount=Countbodyitem(player, 203038) --檢查玩家的畢爾丁代幣量

	if coincount<30 then --   如果畢爾丁代幣不夠
		Closespeak(player)
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_43]", C_SYSTEM) --很抱歉，你沒有足夠的代幣
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_43]", C_SYSTEM) --很抱歉，你沒有足夠的代幣
		return false
	end

	Delbodyitem(player, 203038, 30) --刪除30個畢爾丁代幣
	WriteRoleValue(player, EM_RoleValue_Register+3, 1 ) --遊戲辨認玩家選擇了計時模式
	Callplot(npc, "lua_skwerl_mobius_loop", player, npc, 210) --開始執行遊戲計時模式
end

function lua_skwerl_mobius_start2() --生存闖關模式
	local player=OwnerID()
	local npc= TargetID()
	local coincount=Countbodyitem(player, 203038) --檢查玩家的畢爾丁代幣量
	if coincount<30 then --   如果畢爾丁代幣不夠
		Closespeak(player)
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_43]", C_SYSTEM) --很抱歉，你沒有足夠的代幣
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_43]", C_SYSTEM) --很抱歉，你沒有足夠的代幣
		return false
	end


	Delbodyitem(player, 203038, 30) --刪除30個畢爾丁代幣
	Callplot(npc, "lua_skwerl_mobius_loop", player, npc, 220) --開始執行遊戲生存闖關模式
end

---------------------------------重製系統----------------------------------------------------
function lua_skwerl_mobius_restart_check() ---生存闖關模式確認視窗
  	local player=OwnerID()	
	Callplot(player, "DW_ChooseOneFromTwo", OwnerID(),"[SKWERL_MOBIUS_22]","lua_skwerl_mobius_restart","")
end


function lua_skwerl_mobius_restart() ---重製機制
	local player=OwnerID()
	local ticketcount=Countbodyitem(player, 241649) --檢查玩家的重製券
	if ticketcount<1 then
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_45]", C_SYSTEM) ----你需要重製券
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_45]", C_SYSTEM) ---- 你需要重製券
	else
		Delbodyitem(player, 546722, 1) --刪除活動完成旗標
		delbodyitem(player, 241649, 1) --刪除活動重製券x1	
		ScriptMessage(player, player, 2, "[SKWERL_MOBIUS_46]", C_SYSTEM) ----重置成功!
		ScriptMessage(player, player,0, "[SKWERL_MOBIUS_46]", C_SYSTEM) ---- 重置成功!
	end
end




----------------------------------------------------------------------------------------------------


function lua_skwerl_mobius_mode_returntotown() ---回城
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+4, 0)--清空register值
	ChangeZone(OwnerID() , 2, 0, 4947.5, 109.3, -1920.9, 121.4) ---把玩家傳到場地	
end




-----以下為測試用指令---------------------------------------------------------------------



function lua_skwerl_mobius_cheat()
	addbuff(OwnerID(), 622646, 999, -1) --給予五發範圍技
	Addbuff(OwnerID(), 622601, 1, -1)--給AOE技
end

function lua_skwerl_boardtest1()
WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem38 , 0 ) --把分數新高記錄下來
Billboard_Update (OwnerID(), EM_BillboardSortType_Range, 0)  --把分數新高寫到計分板上
--Billboard_Update (OwnerID(), EM_BillboardSortType_AncientDreamSpace , 50)
say(OwnerID(), "reset")

end

function lua_skwerl_boardtest2a()
--	Billboard_Update (OwnerID(), EM_BillboardSortType_Range_Survival, 999)  --把分數新高寫到計分板上
	Billboard_TopUpdate(OwnerID() , EM_BillboardSortType_Range, 1999 )
say(OwnerID(), "uploading2a time")
end

function lua_skwerl_boardtest2b()
	Billboard_TopUpdate(OwnerID() , EM_BillboardSortType_Range, 200 )
say(OwnerID(), "uploading2b time")
end

function lua_skwerl_boardtest2c()
Billboard_Update (OwnerID(), EM_BillboardSortType_Range_Survival,0)  --把分數新高寫到計分板上
say(OwnerID(), "reset survival")
end


function lua_skwerl_boardtest2d()
Billboard_Update (OwnerID(), EM_BillboardSortType_Range,300)  --把分數新高寫到計分板上
say(OwnerID(), "300 time")
end


function lua_skwerl_timereport()
	local hour
	local min
	hour = GetSystime(1) --取得現在時間：時
	min = GetSystime(2) --取得現在時間：分
	say(OwnerID(), hour..":"..min)

end


function lua_skwerl_mobius_achievementreset() --刪除稱號
local player=OwnerID()
	DelBodyItem(player, 530920, 1) 
	DelBodyItem(player, 530921, 1)
	DelBodyItem(player, 530922, 1)
	DelBodyItem(player, 530923, 1)
	DelBodyItem(player, 530924, 1)
	
end


--2013/11/20新增重置券
function Lua_na_361_241649()
	SetFlag( OwnerID() , 546722, 0 )
end