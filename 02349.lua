function Lua_ying_springev1_npctalk() 

	AddBuff( TargetID(),  503217, 1, -1) --掛在節慶活動NPC上 ，頭上的煙火標誌
	SetPlot( OwnerID() , "range" , "Lua_ying_springev1_npctalk01" , 50 ) --範圍劇情，檢查玩家是否在範圍50內
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npctalk01()
--	Say(OwnerID(), "Owner") --玩家
--	Say(TargetID(), "Target") --NPC
	local A = CheckFlag ( OwnerID() , 544858 ) --已與NPC對話
	local B = CheckFlag ( OwnerID() , 544859 ) --已接取任務
	local C = CheckFlag ( OwnerID() , 544860 ) --已成功
	local D = CheckFlag ( OwnerID() , 544861 ) --已完成任務

	if A == false and B == false and C ==false and D == false then
		tell(  OwnerID() , TargetID() , "[SC_SPRING_2011EV1_01]" ) --密語：" 嗨～這位朋友，願意停下你的腳步聽我說嗎？ "
	end
end
------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npcspeak() --NPC 黛妮．拉比對話內容

	local over = CheckFlag( OwnerID() , 544861 ) --已完成任務
	local X = CheckFlag( OwnerID() , 544859 ) --已接取任務
	local Y = CheckFlag( OwnerID() , 544860 ) --已成功
	local Z = CheckFlag( OwnerID() , 544858 ) --已與NPC對話

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if over == true then
		SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) --你今天已經完成了這個任務，請你明天再來吧。
	elseif X == true or Y == true or Z == true then
		LoadQuestOption( OwnerID()) --讀取任務模板
	else
		SetSpeakDetail( OwnerID() , "[SC_SPRING_2011EV1_02]" ) --"你好！我是春雨節活動管理員[118156]～春雨的季節又來臨了，有興趣聽看看關於拉比兔的事嗎？挺有趣的唷～"
		AddSpeakOption( OwnerID() , TargetID() , "[SC_SPRING_2011EV1_03]" , "Lua_ying_springev1_npcspeak01" , 0 ) --選項"好呀！什麼事情呢？"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_springev1_npcspeak01()----選項"好呀！什麼事情呢？"

	SetFlag( OwnerID() , 544858 , 1 ) --給予已與NPC對話重要物品
	LoadQuestOption( OwnerID()) --讀取任務模板
end
-----------------------------------------------------------------------------------------------------------------------------------
function Lua_spring_ying_q424039over() --任務424039完成後執行
	
	SetFlag( TargetID() , 544858 , 0 ) --刪除已與NPC對話
	SetFlag( TargetID() , 544859 , 0 ) --刪除任務接取
	SetFlag( TargetID() , 544860 , 0 ) --刪除任務成功
	SetFlag( TargetID() , 544861 , 1 ) --跳躍拉比-當日完成
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_chkflag() --套用於集合法術上，判斷玩家是否有法術效果

	local X = CheckFlag( TargetID() , 544859 ) --檢查玩家身上是否有接取任務
	if X == true then
		return true
	else
		return false
	end
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_monster() --陷阱產生時，物件產生劇情

	SetPlot( OwnerID() , "range" , "Lua_ying_spring_monster01" , 40 ) --範圍劇情，檢查玩家是否在40碼內
end
---------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_monster01() --在陷阱設定範圍內(40碼)，陷阱施放法術(觸發)
--	Say(OwnerID(), "Owner") --玩家
--	Say(TargetID(), "Target") --NPC

	local X = Rand(9)+1 --rand(0~8)+1 = 1~9

	if X <=3 then --1~3
		CastSpell( TargetID() , OwnerID() , 497555 ) --施放法術集合：497555 迷幻陷阱
	elseif X >3 and X <=6 then --4~6
		CastSpell( TargetID() , OwnerID() , 497556 ) --施放法術集合：497556 爆炸陷阱
	else --7~9
		CastSpell( TargetID() , OwnerID() , 497557 ) --施放法術集合：497557 冰凍陷阱
	end
	Sleep(30) --3秒
	DelObj( TargetID() ) --刪除物件 
end
--------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_rabbit() --兔子產生陷阱(物件產生劇情)
--	Say(OwnerID(), "Owner") --NPC
--	Say(TargetID(), "Target") --NPC
	AddBuff( OwnerID() , 508996 , 1 , -1 ) --兔子+速
	BeginPlot( OwnerID() , "Lua_ying_spring_trap01" , 0 ) --產生陷阱迴圈
	while true do
		BeginPlot( OwnerID() , "Lua_ying_spring_run" , 0 ) --無限執行
		sleep(10) --每秒執行一次
--		Say(OwnerID() , "1")
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_trap01()

	while true do
--		Say(OwnerID() , "2")
		local Rd = Rand(90)+1 --1~90
	
		if Rd <= 30 then--1~30
			Sleep(100) --10秒					
		elseif Rd >30 and Rd<= 60 then --31~60
			Sleep(80) --8秒
		else --61~90
			Sleep(60)--6秒
		end
		BeginPlot( OwnerID() , "Lua_ying_spring_trap" , 0 ) --執行陷阱function
--		Say(OwnerID() , "okok")
--		break
	end
end
------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_trap() --產生陷阱

	local Obj = Role:new( OwnerID() ) --在"兔子"原位置，建立新的NPC
	local BaseX = Obj :X() --兔子的X軸
	local BaseY = Obj :Y() --兔子的Y軸
	local BaseZ = Obj :Z() --兔子的Z軸
	local BaseDir = Obj:Dir() --兔子的面向
	local Trap --陷阱

	Trap = CreateObj( 105631 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --建立"陷阱"
	SetModeEx( Trap , EM_SetModeType_Strikback , false ) --不反擊
	SetModeEx( Trap , EM_SetModeType_SearchenemyIgnore , false ) --不被搜尋
	SetModeEx( Trap , EM_SetModeType_Obstruct , false ) --不阻擋
	SetModeEx( Trap , EM_SetModeType_Mark , false ) --不標記
	SetModeEx( Trap , EM_SetModeType_Move , false ) --不移動
	SetModeEx( Trap , EM_SetModeType_Searchenemy , false ) --不索敵
	SetModeEx( Trap , EM_SetModeType_HideName , false ) --不顯示名稱
	SetModeEx( Trap , EM_SetModeType_ShowRoleHead , false ) --不顯示頭像框
	SetModeEx( Trap , EM_SetModeType_Fight , false ) --不可砍殺攻擊
	AddToPartition( Trap , 0 ) --使新建立出來的陷阱出現
	Sleep(30) --3秒
--	Say(OwnerID() , "Del")
	DelObj( Trap ) --刪除陷阱
end
-------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_spring_run() --跟著兔子跑
--	Say(OwnerID(), "Owner") --NPC
--	Say(TargetID(), "Target") --NPC
	local Player =SearchRangePlayer( OwnerID() , 70 )

	for i= 0 , table.getn(Player) , 1 do
		local Dis = CheckDistance( OwnerID() , Player[i] , 50 ) --檢查玩家與兔子的距離
		local key = CheckFlag( Player[i] , 544859 ) --檢查玩家身上是否有"已接任務key"
		local BuffLV = FN_CountBuffLevel( Player[i] , 509701 ) --檢查玩家身上BUFFLV (一開始回傳值為-1，但遊戲內BUFF已顯示為1 )
		local Count = CountBodyItem( Player[i] , 530716 ) --檢查玩家身上是否有稱號
		local Ride = Lua_Mounts_Copilot( Player[i] ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)
--		Say( Player[i] , "BuffLV ="..BuffLV)
		if key == true then --有已接任務key
			if Ride == true then --不在後座
				if Dis == true then --與兔子距離在50碼內
					if BuffLV == 58 then --遊戲內BuffLV60
						SetFlag( Player[i] , 544860 , 1 ) --給予任務成功key
					elseif BuffLV == 148 then --遊戲內BuffLV150
						if Count < 1 then
							GiveBodyItem( Player[i] , 530716 , 1 ) --給予稱號
						end
					end
					DW_CancelTypeBuff( 68,  Player[i] ) --騎乘坐騎時，下馬
					AddBuff( Player[i] , 509701 , 0 , 3 ) --變烏龜
				else --不在兔子50碼內
					ScriptMessage( OwnerID() , Player[i] , 1 , "[SC_SPRING_2011EV1_04]" , 0 ) --"媞媞拉比快看不見你了，趕緊跟上牠的腳步！"
				end
			end
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------