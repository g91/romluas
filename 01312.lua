------------------危險的古老種族--------------
function LuaS_112625_0() --萊斯．依卡萊對話劇情

	LoadQuestOption( OwnerID() ) --載入任務NPC模板內容
	if CheckAcceptQuest( OwnerID() , 422197 ) == true then --檢查是否已經接了任務 422197
		AddSpeakOption( OwnerID(), TargetID(),  "[SC_112625_0]", "LuaS_112625_1",0 )	--/*那就請你長話短說的告訴我吧！
	end

end

function LuaS_112625_1() 
	SetSpeakDetail( OwnerID(), "[SC_112625_1]" ) --/*（萊斯用你幾乎快聽不到的聲音開始跟你說話）......（以下略）
	SetFlag( OwnerID() , 542508 , 1 ) --打開重要旗標
	AddSpeakOption( OwnerID(), TargetID(),  "[SO_BACK]", "LuaS_112625_0",0 ); --/*返回上一頁
end
--------------------巨魔的天敵--------------------------
function LuaI_492897_Check() --使用蜘蛛籠後的執行法術檢查 SCRIPT ，來檢查能不能執行抓蜘蛛的動作，OwnerID()是施法者，TargetID() 是施法者的目標

	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --取得目標的 OrgID (資料庫編號)

	--就每一個不允許玩家施法的狀況進行檢查
	if CheckAcceptQuest( OwnerID() , 422202 ) == false or CheckCompleteQuest( OwnerID() , 422202 ) == true then --檢查任務 422202 巨魔的天敵 如果尚未接受或已經完成
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_0]" , 0 ); --顯示訊息：你不需要使用這個物品
		return false --回傳 false 來取消施法，並結束Script
	end
	if CountBodyItem( OwnerID() , 204408 ) >= 10 and Target == 101752 then--檢查如果目標是 101752 時，身上已經有 10 個以上的 204408 的話
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_1]" , 0 );--顯示訊息：你已經捕捉足夠的[101752]了
		return false --回傳 false 來取消施法，並結束Script
	end
	if CountBodyItem( OwnerID() , 204409 ) >= 10 and Target == 101802 then --檢查如果目標是 101802 時，身上已經有 10 個以上的 204409 的話
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_2]" , 0 );--顯示訊息：你已經捕捉足夠的[101802]了
		return false --回傳 false 來取消施法，並結束Script
	end
	if Target ~= 101752 and Target ~= 101802 then --檢查如果目標不是 101752 也不是 101802 的話
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]" , 0 );--顯示訊息：目標錯誤
		return false--回傳 false 來取消施法，並結束Script	
	elseif ReadRoleValue( TargetID() ,EM_RoleValue_IsAttackMode) > 0 then --目標是 101752 或 101802 ，檢查如果目標在戰鬥中的話
		--檢查如果使用者在目標的仇恨列表裡的話，就允許施法，否則則不允許施法，防止搶別人的怪
		local Count = HateListCount( TargetID() ) --取得目標的仇恨列表中有多少人
		for i = 0 , Count -1 , 1 do --開始for迴圈，i 從 0 到 Count -1 ，一次跳 1 
			if HateListInfo(TargetID() , i  , EM_HateListInfoType_GItemID ) == OwnerID() then --檢查目標仇恨列表中 i 位置上的人是不是 OwnerID()
				return true --回傳 true 來產生法術效果 ，並結束 Script
			end
		end --結束迴圈
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_6]"  , 0 );  --顯示訊息：蜘蛛的注意力在其他人身上，你無法捕捉牠
		return false --回傳 false 來取消施法，並結束Script
	end

	--如果以上的條件都通過，沒有回傳 false 的話，則允許施法
	return true --回傳 true 來產生法術效果 ，並結束 Script
end

function LuaC_492897_Effect() --放在使用物品施展法術捕捉蜘蛛後執行的基本法術（基本法術類型選執行script），OwnerID()是施法者，TargetID() 是施法者的目標
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --取得目標的 OrgID (資料庫編號)
	BeginPlot(TargetID() , "LuaI_492897_Reset" , 0 ) --命令目標執行函式 LuaI_492897_Reset
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_7]"  , 0 ); --顯示訊息：你成功補抓到這隻蜘蛛
	if Target == 101752  then --檢查如果目標是 101752 的話
		GiveBodyItem(OwnerID(), 204408, 1 )	--給予 OwnerID() 物品 204408 1個
	elseif Target == 101802 then --檢查如果目標不是 101752 ，是 101802 的話
		GiveBodyItem(OwnerID() ,204409, 1 )	--給予 OwnerID() 物品 204409 1個
	end
end
function LuaI_492897_Reset() --執行此函式的物件會執行重生的動作
	LuaFunc_ResetObj( OwnerID() ) --讓 OwnerID() 執行重生劇情的共用函式
end
------------------蜘蛛是秘密武器？---------------------------------
function LuaI_492898_Check() --使用蜘蛛體液後的執行法術檢查 SCRIPT 

	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID) --取得目標的 OrgID (資料庫編號)

	--就每一個不允許玩家施法的狀況進行檢查
	if CheckAcceptQuest( OwnerID() , 422203 ) == false or CheckCompleteQuest( OwnerID() ,422203) == true then --檢查任務 422203 蜘蛛是秘密武器？如果尚未接受或已經完成
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_0]" , 0 ); --顯示訊息：你不需要使用這個物品
		return false --回傳 false 來取消施法，並結束Script
	end
	if CheckFlag( OwnerID() , 542509 ) == true then--檢查是否已經執行過
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_1]" , 0 );--顯示訊息：你已經知道蜘蛛體液的效果，不用再試了
		return false --回傳 false 來取消施法，並結束Script
	end

	if Target < 101755 or Target >101763 or Target == 101759 then --檢查如果目標不是在 101755 到 101763 之間，或是目標是 101759 （血牙奔狼）的話
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422203_4]" , 0 );--顯示訊息：目標錯誤
		return false--回傳 false 來取消施法，並結束Script
	end
	if CheckBuff( TargetID() , 501463 ) == true or CheckBuff( TargetID() ,500977 ) == true then --檢查目標如果有狂怒(500977)或恐懼(501463)的Buff
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_3]" , 0 );--顯示訊息：目標現在的狀態不適合作實驗
		return false--回傳 false 來取消施法，並結束Script		
	end
	--如果以上的條件都通過，沒有回傳 false 的話，則允許施法
	return true --回傳 true 來產生法術效果 ，並結束 Script
end

function LuaC_492898_Effect() --使用蜘蛛體液後的效果script
	--將目標的名字拼接到字串裡面
	local Str = "[SC_422203_5][$SETVAR1="..GetName(TargetID()).."]"  
	--/*[$VAR1]看起來相當憤怒！
	SetFlag( OwnerID() , 542509 , 1 ) --打開旗標 542509
	AddBuff( TargetID() , 500977 , 1 , 10 ) --給目標身上一個 Buff 500977 (狂怒) ，等級 1 持續 10 秒
	ScriptMessage( OwnerID(), OwnerID(), 1, Str, 0 ); --顯示訊息
	SetAttack( TargetID() , OwnerID() ) --命令 TargetID() 攻擊 OwnerID() 

end
----------另一種蜘蛛？-------------
function LuaI_422204_0() --放在物件的初始劇情，OwnerID()為物件本身，無 TargetID()
	SetPlot( OwnerID() , "range" , "LuaI_422204_1" , 70 ) --設定觸發SCRIPT，觸發類型為範圍 range ，觸發後執行的 Script 為 LuaI_422204_1 ，觸發的範圍半徑為 70
end

function LuaI_422204_1() --範圍劇情觸發後執行的Script，在此例中 OwnerID() 為玩家， TargetID() 為擺放劇情的物件
	if CheckAcceptQuest( OwnerID() , 422204 ) == true and CheckFlag( OwnerID() , 542510 ) == false then --如果有接任務 422204 並且尚未取得 542510 
		SetFlag( OwnerID() , 542510 , 1 ) --打開旗標 542510
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422204_0]", 0 ); --顯示訊息 
	end
end