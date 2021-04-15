function Lua_ying_fairytale_119217tell() --物件產生劇情

	AddBuff(  TargetID(),  503217, 1, -1) 
	SetPlot( OwnerID() , "range" , "Lua_ying_fairytale_rangetalk" , 50 ) --範圍劇情	-- 檢查玩家是否接近範圍50以內
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_rangetalk()

	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 , 545525 } --任務key、今日完成key
	local Step = 0

	for i = 1 , table.getn(Key) , 1 do
		if CheckFlag( OwnerID() , Key[i] ) == false then
			Step = Step + 1
		end
		if Step == 6 then
			tell( OwnerID() , TargetID() , "[SC_FAIRYTALE_2011_29]" ) --嘿！這位冒險者，能否停下你的腳步？我需要你的協助…
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119217speak()

	local over = CheckFlag( OwnerID() , 545525 ) --完成任務
	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --任務key
	local Step = 0

	if over == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_30]" ) --你好！我是必爾汀商會的雷吉諾德～
		return;
	end

	for i = 1 , table.getn(Key) , 1 do
		if CheckFlag( OwnerID() , Key[i] ) == true then
			LoadQuestOption( OwnerID() )
			return
		elseif CheckFlag( OwnerID() , Key[i] ) == false and over == false then	-- 當日沒有完成，也沒有
			Step = Step + 1
		end
		if Step == 5 then
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_30]" ) --你好！我是必爾汀商會的雷吉諾德～
			AddSpeakOption( OwnerID() , TargetID(), "[SC_111490_DIALOG7_2]" , "Lua_ying_fairytale_119217speak01" , 0 ) --然後呢？
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119217speak01()

	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --任務key
	local Random = Rand(5)+1 --1~5

	SetFlag( OwnerID() , Key[Random] , 1 )
	Lua_ying_fairytale_119217speak()
end
---------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_questover() --任務完成
--2014/09/12修改：取消活動BUFF，改為判斷USEITEM，當玩家完成任務14次，便可獲得稱號
	local Owner = OwnerID()	-- Npc
	local Target = TargetID()	-- 玩家
	local Key = { 543898 , 543899 , 543900 , 545250 , 545524 } --任務key
--	local BuffLV = FN_CountBuffLevel( Target , 509578 ) --判斷完成第幾天BUFF --支援劇團
	local UI47 = ReadRoleValue( Target , EM_LuaValueFlag_UseItem47) --USEITEM47 作為判斷完成次數記錄
	local Count = CountBodyItem( Target , 530724 ) --稱號：童話劇團的好幫手
	
	for i = 1 , table.getn(Key) , 1 do
	--	if CheckFlag( Target , Key[i] ) == true then
			SetFlag( Target , Key[i] , 0 ) --刪除任務key
	--	end
	end

	SetFlag( Target , 545525 , 1 ) --給予當日完成key

	if Count == 1 then --稱號
		return
	end
--	if BuffLV == 12 then --14天
	if UI47 >= 13 then --完成第14次
		GiveBodyItem( Target , 530724 , 1 ) --稱號：童話劇團的好幫手
	--	CancelBuff( Target , 509578 )
	else
		WriteRoleValue( Target , EM_LuaValueFlag_UseItem47 , UI47+1)
		local NEWUI47 = ReadRoleValue( Target , EM_LuaValueFlag_UseItem47)
		ScriptMessage( Owner, Owner, 3, "[SC_FAIRYTALE_2015_MES01]"..NEWUI47, 0 )  --20140912增加提示訊息
	--	AddBuff( Target ,  509578 , 0 ,  129600 ) --判斷完成第幾天BUFF --支援劇團
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
-- 2015.09.01 阿浩 : 於童話節活動 - 「貪玩的三兄弟」 加入監控劇情，避免大寶、二寶、小寶因未知原因導致重生機制無法作用的問題。
-- 2015.09.01 阿浩 : 於童話節活動 - 「貪玩的三兄弟」- 大寶、二寶、小寶產生時加入範圍劇情，加入提示訊息，避免玩家搜尋不到大寶、二寶、小寶的問題。
local g_PlayfulBoy = {};	-- 僅供此 Script 編號使用的全域變數，記錄物件
g_PlayfulBoy[119219] = 0;	-- 大寶
g_PlayfulBoy[119220] = 0;	-- 二寶
g_PlayfulBoy[119221] = 0;	-- 小寶

local g_KeyItem = {};	-- 僅供此 Script 編號使用的全域變數，記錄對應的重要物品
g_KeyItem[119219] = 545529;	-- 已找到大寶
g_KeyItem[119220] = 545530;	-- 已找到二寶
g_KeyItem[119221] = 545531;	-- 已找到小寶

local g_Flag = 780773;	-- 僅供此 Script 編號使用的全域變數，記錄對應的旗標編號

local g_FlagNum = {};	-- 僅供此 Script 編號使用的全域變數，記錄對應的旗標範圍
g_FlagNum[119219] = { 0, 4 };	-- 大寶
g_FlagNum[119220] = { 5, 9 };	-- 二寶
g_FlagNum[119221] = { 10, 14 };	-- 小寶

function Hao_Fairytale_422913_Accept()	-- 每當有玩家接受此任務時，檢查大寶、二寶、小寶是否存在，不存在則執行重生。防呆，避免未知原因導致物件消失的問題。

	local Owner = OwnerID();	-- Npc
	local Target = TargetID();	-- 玩家

	for Index, Value in pairs(g_PlayfulBoy) do
		if not CheckID( g_PlayfulBoy[Index] ) then
		--	DebugMsg( 0, 0, "PlayfulBoy["..Index.."] not found!" );
			Hao_Fairytale_PlayfulBoy_Reborn( Index );
		else
		--	DebugMsg( 0, 0, "PlayfulBoy["..Index.."] check ok!" );
		end
	end
end

function Hao_Fairytale_PlayfulBoy_Reborn( Index )	-- 大寶、二寶、小寶重生機制

	local Owner = OwnerID();
	local Random = Math.random( g_FlagNum[Index][1], g_FlagNum[Index][2] );
	local Obj = CreateObjByFlag( Index, g_Flag, Random , 1 );	-- 參照指定旗子的位置來產生物件( 物件編號、旗子代號、第幾號旗子、物件數量 )
	AddToPartition( Obj, 0 );
	BeginPlot( Obj, "Hao_Fairytale_PlayfulBoy_Init", 0 );
end

function Hao_Fairytale_PlayfulBoy_Init()	-- 貪玩的三兄弟 物件產生劇情

	local Owner = OwnerID();	-- Npc
	local OrgID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
	g_PlayfulBoy[OrgID] = Owner;	-- 在產生時將自己列入僅供此 Script 編號使用的全域
	SetModeEx( Owner, EM_SetModeType_SearchenemyIgnore, false );	-- 不可被搜尋
	SetModeEx( Owner, EM_SetModeType_Move, false );	-- 關閉移動
	SetPlot( Owner, "range", "Hao_Fairytale_PlayfulBoy_Plot", 100 );	-- 移動至目標 100 以內時，給予提示
end

function Hao_Fairytale_PlayfulBoy_Plot()	-- 範圍劇情

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc

	if CheckAcceptQuest( Owner, 422913 ) then	--當玩家有接取任務：貪玩的三兄弟時
		local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );	-- 查詢 Npc 的 ObjID
		if not CheckFlag( Owner, g_KeyItem[OrgID] ) then	-- 當玩家尚未找到該目標時
			Tell( Owner, Target, "[SC_113348_1]" );	-- 噓~壓低聲音，過來這邊！
		end
	end
end

function Hao_Fairytale_PlayfulBoy_Speak()	-- 大寶、二寶、小寶，共用對話劇情

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc
	local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
	local Quest = CheckAcceptQuest( Owner, 422913 ); --任務：貪玩的三兄弟

	if CheckAcceptQuest( Owner, 422913 ) then	-- 有接取任務 - 貪玩的三兄弟
		if not CheckFlag( Owner, g_KeyItem[OrgID] ) then
			LoadQuestOption( Owner );
			AddSpeakOption( Owner, Target, "[SC_FAIRYTALE_2011_01]" , "Hao_Fairytale_PlayfulBoy_Speak2" , 0 ); --原來你在這裡…
		else	
			SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_02]" ); --請幫我轉告雷吉諾德，我待會就會回去了～	
		end
	else
		LoadQuestOption( Owner );
	end		
end

function Hao_Fairytale_PlayfulBoy_Speak2()	-- 與三寶對話後的後續對話劇情

	local Owner = OwnerID();	-- 玩家
	local Target = TargetID();	-- Npc

	if CheckAcceptQuest( Owner, 422913 ) then --任務：貪玩的三兄弟
		local PID = ReadRoleValue( Owner, EM_RoleValue_PID );	-- 避免複數以上接取任務的玩家同時與 Npc 對話時，會有 already running 的問題。
		if PID == 1 then
			SetSpeakDetail( Owner, "[SAY_NPC_BUSY]" ); -- 目標忙碌中
		else
			local OrgID = ReadRoleValue( Target, EM_RoleValue_OrgID );
			WriteRoleValue( Target, EM_RoleValue_PID, 1 );
			CloseSpeak( Owner );
			SetFlag( Owner, g_KeyItem[OrgID], 1 ) --找到指定三寶
			ScriptMessage( Owner, Owner, 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."["..OrgID.."]".."]" , C_SYSTEM ) --你成功找回了指定三寶！
			Hide( Target ) --先隱藏NPC
			BeginPlot( Target, "Hao_PlayfulBoy_SetPos", 50 )	-- 5 秒後傳送 Npc 至指定旗標的隨機編號
		end
	else
		SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_04]" ) --你是誰…？
	end
end

function Hao_PlayfulBoy_SetPos()

	local Owner = OwnerID();
	local OrgID = ReadRoleValue( Owner, EM_RoleValue_OrgID );
	local RandomNum = Math.random( g_FlagNum[OrgID][1], g_FlagNum[OrgID][2] );	-- 每次隨機顯示時的位置
--	DebugMsg( 0, 0, "RandomNum = "..RandomNum );
	WriteRoleValue( Owner, EM_RoleValue_PID, 0 );
	SetPosByFlag( Owner, g_Flag, RandomNum );
	Show( Owner, 0 );
end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak01() --大寶對話劇情
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --任務：貪玩的三兄弟
--	local Key = CheckFlag( OwnerID() , 545529 ) --找到大寶
--
--	if Quest == true then --有任務
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow01" , 0 ) --原來你在這裡…
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --請幫我轉告雷吉諾德，我待會就會回去了～	
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow01()
--
--	local Owner = OwnerID();	-- 玩家
--	local Target = TargetID();	-- Npc
--
--	if CheckAcceptQuest( Owner, 422913 ) then --任務：貪玩的三兄弟
--		local PID = ReadRoleValue( Owner, EM_RoleValue_PID );	-- 避免複數以上接取任務的玩家同時與 Npc 對話時，會有 already running 的問題。
--		if PID == 1 then
--			SetSpeakDetail( Owner, "[SAY_NPC_BUSY]" ); -- 目標忙碌中
--		else
--			WriteRoleValue( Target, EM_RoleValue_PID, 1 );
--			CloseSpeak( Owner );
--			SetFlag( Owner, 545529 , 1 ) --找到大寶
--			ScriptMessage( Owner, Owner, 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119219".."]".."]" , C_SYSTEM ) --你成功找回了大寶！
--			Hide( Target ) --先隱藏NPC
--			BeginPlot( Target, "Hao_Fairytale_PlayfulBoy_SetPos", 50 )	-- 5 秒後傳送 Npc 至指定旗標的隨機編號
--		--	BeginPlot( Target, "Lua_ying_fairytale_add01" , 100 ) --10秒後才執行建立新NPC
--		--	BeginPlot( Target, "Lua_ying_fairytale_del" , 0 ) --刪除原有隱藏大寶
--		end
--	else
--		SetSpeakDetail( Owner, "[SC_FAIRYTALE_2011_04]" ) --你是誰…？
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add01()
--
--	local Random = Math.random( 0, 4 );	--0~4
--	local NPC = CreateObjByFlag( 119219 , 780773 , Random , 1 )  --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
------------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak02() --二寶對話劇情
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --任務：貪玩的三兄弟
--	local Key = CheckFlag( OwnerID() , 545530 ) --找到二寶
--
--	if Quest == true then --有任務
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow02" , 0 ) --原來你在這裡…
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --請幫我轉告雷吉諾德，我待會就會回去了～
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow02()
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --任務：貪玩的三兄弟
--
--	if Quest == true then
--		CloseSpeak( OwnerID() )
--		SetFlag( OwnerID() , 545530 , 1 ) --找到二寶
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119220".."]".."]" , C_SYSTEM ) --你成功找回了二寶！
--		Hide( TargetID() ) --先隱藏NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_add02" , 100 ) --10秒後才執行建立新NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_del" , 0 ) --刪除原有隱藏二寶
--	else
--		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_04]" ) --你是誰…？
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add02()
--
--	local Random = Math.random( 5, 9 ); --5~9
--	local NPC = CreateObjByFlag( 119220 , 780773 , Random , 1 )  --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bowspeak03() --小寶對話劇情
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --任務：貪玩的三兄弟
--	local Key = CheckFlag( OwnerID() , 545531 ) --找到小寶
--
--	if Quest == true then --有任務
--		if Key == false then
--			LoadQuestOption( OwnerID() )
--			AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_01]" , "Lua_ying_fairytale_bow03" , 0 ) --原來你在這裡…
--		else
--			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_02]" ) --請幫我轉告雷吉諾德，我待會就會回去了～	
--		end
--	else
--		LoadQuestOption( OwnerID() )
--	end
--end
------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_bow03()
--
--	local Quest = CheckAcceptQuest( OwnerID() , 422913 ) --任務：貪玩的三兄弟
--
--	if Quest == true then
--		CloseSpeak( OwnerID() )
--		SetFlag( OwnerID() , 545531 , 1 ) --找到小寶
--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_FAIRYTALE_2011_03][$SETVAR1=".."[".."119221".."]".."]" , C_SYSTEM ) --你成功找回了小寶！
--		Hide( TargetID() ) --先隱藏NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_add03" , 100 ) --10秒後才執行建立新NPC
--		BeginPlot( TargetID() , "Lua_ying_fairytale_del" , 0 ) --刪除原有隱藏小寶
--	else
--		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_04]" ) --你是誰…？
--	end
--end
---------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_add03()
--
--	local Random = Math.random( 10, 14 ); --10~14
--	local NPC = CreateObjByFlag( 119221 , 780773 , Random , 1 )  --參照指定旗子的位置來產生物件(NPC編號、旗子代號、第幾號旗子、物件數量 )
--
--	SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false ) --不可被搜尋
--	AddToPartition( NPC , 0 )
--	DelObj(OwnerID());
--end
----------------------------------------------------------------------------------------------------------------------------------------------
--function Lua_ying_fairytale_del()
--
--	Sleep(130)
--	DelObj( OwnerID())
--end
-----------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_usecheck() --野豬籠，使用檢查lua
--	Say(TargetID(), "Target") --= NPC
	local NPC = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --讀取目標的orgid
	local Dis = GetDistance( OwnerID(), TargetID() ) --取得玩家與目標的距離

	DW_CancelTypeBuff( 68 , OwnerID()) --騎乘坐騎時，點擊下馬

	if NPC == 106107 then --小野豬
		if Dis <= 30 then
				return true --可使用
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_FAIRYTALE_2011_05][$SETVAR1=".."[".."106107".."]".."]" , 0 ) --你與小野豬距離太遠，必須再靠近一點才可使用！
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
		return false
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_Motion() --使用檢查LUA
	CallPlot( OwnerID(), "PlayMotion", OwnerID(), ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	return true
end
-----------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_use()
	local pig = TargetID()
	local player = OwnerID()
	local PID = ReadRoleValue( pig , EM_RoleValue_PID ) --讀取野豬PID

	if PID == 1 then --已被抓取
		ScriptMessage( player , player , 1 , "[SC_MAGICSTRING_9]" , 0 ) --技能目標有問題
	else	
		if Rand(100) < 50 then
			GiveBodyItem( player , 240056 , 1 ) --給予裝著野豬的籠子
			--UseitemDestroy()
			DelBodyItem( player , 240055 , 1 ) --刪除野豬籠
		else --失敗
			ScriptMessage( player, player , 1 , "[SC_FAIRYTALE_2011_06]" , C_SYSTEM ) --小野豬掙脫了籠子，一溜煙的跑走了～
		end
		WriteRoleValue( pig , EM_RoleValue_PID , 1 ) --抓取後PID寫入1
		Hide( pig )
		BeginPlot( pig , "Lua_ying_fairytale_shownpc" , 0 )
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_shownpc()

	Sleep(300) --30秒
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) --抓取後PID寫入0
	Show( OwnerID() , 0 )
end
----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_pigdead() --小野豬死亡劇情
--	Say( OwnerID() , "1" )	--野豬
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 ) --PID寫入1
--	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--		Say( OwnerID() , "PID ="..PID )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_pigborn() --小野豬物件產生劇情

	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 ) --PID寫入0
--	local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
--		Say( OwnerID() , "PID ="..PID )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_119222talk() --npc 艾爾瑪 對話劇情

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --任務：美味的手工餅乾
	local Count = CountBodyItem( OwnerID() , 240057 ) --檢查手工餅乾數量
	local OKKey =CheckFlag( OwnerID() , 545538 ) --已完成小遊戲key
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1
	local Key = { 545459 , 545460 , 545461 } --題目KEY

	if Quest == true then --有任務
		if OKKey == true then --已完成
			if Count < 10 then --0~9個餅乾
				LoadQuestOption( OwnerID() )
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_07]" , "Lua_ying_fairytale_cookiegive" , 0 ) --我弄丟了手工餅乾…
			else
				SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_08]" ) --趕緊將熱騰騰的手工餅乾帶回給雷吉諾德吧～
			end
		else --未完成
			if CheckFlag( OwnerID() , Key[1] ) == true then
				Lua_ying_fairytale_select1()
			elseif CheckFlag( OwnerID() , Key[2] ) == true then
				Lua_ying_fairytale_select2()
			elseif CheckFlag( OwnerID() , Key[3] ) == true then
				Lua_ying_fairytale_select3()
			else
				if BuffLV == -1 then --沒答對過
					LoadQuestOption( OwnerID() ) --想要製作出美味的餅乾，除了食材的品質以外，烹飪時放入食材的先後順序也很重要哦～
					AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_09]" , "Lua_ying_fairytale_givekey" , 0 ) --我想向妳索取一些手工餅乾…
				end
			end
		end
	else --沒任務
		LoadQuestOption( OwnerID() ) --想要製作出美味的餅乾，除了食材的品質以外，烹飪時放入食材的先後順序也很重要哦～
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_givekey() --我想向妳索取一些手工餅乾…

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --任務：美味的手工餅乾
	local Key = { 545459 , 545460 , 545461 } --題目KEY
	local Random = Rand(3)+1 --1~3
	local Select = { "Lua_ying_fairytale_select1" , "Lua_ying_fairytale_select2" , "Lua_ying_fairytale_select3" }

	if Quest == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_10]" ) --原來是雷吉諾德請你來的～不過…想要取得手工餅乾，得必須先正確的回答我所問的問題才行！
		for i = 1 , table.getn(Key) , 1 do
			if CheckFlag( OwnerID() , Key[1] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select1" , 0 ) --好的！
				return
			elseif CheckFlag( OwnerID() , Key[2] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select2" , 0 ) --好的！
				return
			elseif CheckFlag( OwnerID() , Key[3] ) == true then
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , "Lua_ying_fairytale_select3" , 0 ) --好的！
				return
			else --三個key都false
				SetFlag( OwnerID() , Key[Random] , 1 ) --給予題目key
				AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_11]" , Select[Random] , 0 ) --好的！
				return
			end
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_12]" ) --（艾爾瑪正專心的在做自己的事…）
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select1()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1

	if BuffLV == -1 then --沒buff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_14]" ) --請你依照我的提示，回答出正確的製作餅乾流程～砂糖比可可粉早放，杏仁片比麵粉晚放，放可可粉之前得先放麵粉，奶油最早放。
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --最後放入的材料是？
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --接下來該放入什麼材料呢？
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --答對了，再來該放入什麼呢？
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --厲害唷～接下來該放入什麼呢？
	end
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_17]" , "Lua_ying_fairytale_check1" , 0 ) --杏仁片
	AddSpeakOption( OwnerID() , TargetID(), "[".."203421".."]" , "Lua_ying_fairytale_check2" , 0 ) --麵粉
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_19]" , "Lua_ying_fairytale_check3" , 0 ) --可可粉
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_20]" , "Lua_ying_fairytale_check4" , 0 ) --砂糖
	AddSpeakOption( OwnerID() , TargetID(), "[".."200782".."]" , "Lua_ying_fairytale_check5" , 0 ) --奶油
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select2()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1

	if BuffLV == -1 then --沒buff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_15]" ) --奶油比雞蛋早放，牛奶比砂糖晚放，放雞蛋之前得先放砂糖，鬆餅粉最晚放。
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --最後放入的材料是？
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --接下來該放入什麼材料呢？
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --答對了，再來該放入什麼呢？
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --厲害唷～接下來該放入什麼呢？
	end
	AddSpeakOption( OwnerID() , TargetID(), "[".."202983".."]" , "Lua_ying_fairytale_check6" , 0 ) --牛奶
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_18]" , "Lua_ying_fairytale_check7" , 0 ) --鬆餅粉
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_20]" , "Lua_ying_fairytale_check4" , 0 ) --砂糖
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_21]" , "Lua_ying_fairytale_check8" , 0 ) --雞蛋
	AddSpeakOption( OwnerID() , TargetID(), "[".."200782".."]" , "Lua_ying_fairytale_check5" , 0 ) --奶油
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_select3()

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1

	if BuffLV == -1 then --沒buff
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_16]" ) --放葡萄乾之前不可以放雞蛋，放麵粉之前不可以放小麥胚芽，放雞蛋之前得先放蜂蜜，麵粉比蜂蜜晚放。
	elseif BuffLV == 3 then 
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_24]" ) --最後放入的材料是？
	elseif BuffLV == 0 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_25]" ) --接下來該放入什麼材料呢？
	elseif BuffLV == 1 then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_28]" ) --答對了，再來該放入什麼呢？
	else --BuffLV= 2
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_31]" ) --厲害唷～接下來該放入什麼呢？
	end
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_32]" , "Lua_ying_fairytale_check4" , 0 ) --蜂蜜
	AddSpeakOption( OwnerID() , TargetID(), "[".."203421".."]" , "Lua_ying_fairytale_check2" , 0 ) --麵粉
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_22]" , "Lua_ying_fairytale_check9" , 0 ) --小麥胚芽
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_23]" , "Lua_ying_fairytale_check5" , 0 ) --葡萄乾
	AddSpeakOption( OwnerID() , TargetID(), "[SC_FAIRYTALE_2011_21]" , "Lua_ying_fairytale_check8" , 0 ) --雞蛋
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check1()  --杏仁片
	
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1

	if BuffLV == 3 then --已答對4次
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --太棒了，你回答的很正確，那我就把手工餅乾給你囉～
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --完成小遊戲
		SetFlag( OwnerID() , 545459 , 0 ) --刪除題目1 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --給予10個手工餅乾
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" ) --順序錯了唷～你要不要再思考看看？
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check2() --麵粉

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )
	
	if CheckFlag( OwnerID() , 545459 ) == true then --題目1
		if BuffLV == 1 then --已答對2次
			AddBuff( OwnerID() , 620630 , 0 , -1 )
			Lua_ying_fairytale_select1()
		else
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" ) --順序錯了唷～你要不要再思考看看？
			CancelBuff( OwnerID() , 620630 )
		end
	else --題目3
		if BuffLV == 2 then --已答對3次
			AddBuff( OwnerID() , 620630 , 0 , -1 )
			Lua_ying_fairytale_select3()
		else
			SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
			CancelBuff( OwnerID() , 620630 )
		end
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check3() --可可粉

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 2 then --已答對3次
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		Lua_ying_fairytale_select1()
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check4() --砂糖、蜂蜜

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 0 then --已答對1次
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545459 ) == true then --題目1
			Lua_ying_fairytale_select1()
		elseif CheckFlag( OwnerID() , 545460 ) == true then --題目2
			Lua_ying_fairytale_select2()
		else --題目3
			Lua_ying_fairytale_select3()	
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check5() --奶油 、葡萄乾

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == -1 then --都沒答對過
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545459 ) == true then --題目1
			Lua_ying_fairytale_select1()
		elseif CheckFlag( OwnerID() , 545460 ) == true then --題目2
			Lua_ying_fairytale_select2()
		else --題目3
			Lua_ying_fairytale_select3()
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check6() --牛奶

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 2 then --已答對3次
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		Lua_ying_fairytale_select2()
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check7() --鬆餅粉

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 3 then --已答對4次
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --太棒了，你回答的很正確，那我就把手工餅乾給你囉～
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --完成小遊戲
		SetFlag( OwnerID() , 545460 , 0 ) --刪除題目2 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --給予10個手工餅乾
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end	
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check8() --雞蛋

	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 )

	if BuffLV == 1 then --已答對2次
		AddBuff( OwnerID() , 620630 , 0 , -1 )
		if CheckFlag( OwnerID() , 545460 ) == true then --題目2
			Lua_ying_fairytale_select2()
		else --題目3
			Lua_ying_fairytale_select3()
		end
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_check9()  --小麥胚芽
	
	local BuffLV = FN_CountBuffLevel( OwnerID() , 620630 ) --判斷玩家身上BUFF(答對幾次)，若沒此BUFF則為-1

	if BuffLV == 3 then --已答對4次
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_26]" ) --太棒了，你回答的很正確，那我就把手工餅乾給你囉～
		CancelBuff( OwnerID() , 620630 )
		SetFlag( OwnerID() , 545538 , 1 ) --完成小遊戲
		SetFlag( OwnerID() , 545461 , 0 ) --刪除題目3 KEY
		GiveBodyItem( OwnerID() , 240057 , 10 ) --給予10個手工餅乾
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_27]" )
		CancelBuff( OwnerID() , 620630 )
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_cookiegive() --我弄丟了手工餅乾…

	local Quest = CheckAcceptQuest( OwnerID() ,  424042 ) --任務：美味的手工餅乾
	local Count = CountBodyItem( OwnerID() , 240057 ) --檢查手工餅乾數量

	if Quest == true then
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_13]" ) --該不會是你偷吃了手工餅乾吧？！
		DelBodyItem( OwnerID() , 240057 , Count )
		GiveBodyItem( OwnerID() , 240057 , 10 )
	else
		SetSpeakDetail( OwnerID() , "[SC_FAIRYTALE_2011_12]" ) --（艾爾瑪正專心的在做自己的事…）
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_fairytale_q424042() --接受任務時觸發

	CancelBuff( TargetID() , 620630 )
end

--填入已支援活動的次數
function Lua_na_fairytale_complete13(Times)
	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem47 , Times)
	Say( OwnerID(), Times.."times") 
end