function Lua_ying_GE2year_118041speak() --NPC塞巴斯帝安對話
			
	local X = CheckFlag( OwnerID() , 545021 ) --已接取任務
	local Y = CheckFlag( OwnerID() , 545022 ) --已完成領取獎勵
	local Z = CheckBuff( OwnerID() , 509601 ) --檢查玩家身上是否有509601 變身術的BUFF
	local Lv = ReadRoleValue( OwnerID() , EM_RoleValue_LV ) --檢查玩家等級

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if Lv >= 48 then --等級48以上
		if X == true then --已接任務
			if Z == true then --有變身
				SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"煩死人了！我的研究室長期以來一直受到青蛙的騷擾，導致這裡總是被弄得亂七八糟，令人受不了！
				AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_11]" , "Lua_ying_GE2year_118041speak02" , 0 ) --"捕捉完成，我要領取獎勵。"選項
			else --沒變身
				SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"煩死人了！我的研究室長期以來一直受到青蛙的騷擾，導致這裡總是被弄得亂七八糟，令人受不了！
				AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_11]" , "Lua_ying_GE2year_118041speak03" , 0 ) --"捕捉完成，我要領取獎勵。"選項
			end
		elseif Y == true then --已完成領取獎勵
			SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_15]" ) --"你今天已經幫助過我了，謝謝你～明天再來吧！"
		else --未接任務&未完成領取獎勵
			SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_01]" ) --"煩死人了！我的研究室長期以來一直受到青蛙的騷擾，導致這裡總是被弄得亂七八糟，令人受不了！
			AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_02]" , "Lua_ying_GE2year_118041speak01" , 0 ) --"我願意幫忙！"選項
		end
	else --等級48以下
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]"   ) -- "我很感謝你的好意，可惜你的能力似乎還沒有辦法幫上我的忙"
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak02() --"捕捉完成，我要領取獎勵。"選項(有變身)

	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_12]" , C_SYSTEM ) --"必須先解除變身才可以領獎勵唷！"
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_12]" , C_SYSTEM ) --"必須先解除變身才可以領獎勵唷！"
	CloseSpeak( OwnerID() )
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak03() --"捕捉完成，我要領取獎勵。"選項(沒變身)

	local X = CountBodyItem( OwnerID() , 209556 ) --檢查玩家身上"裝著青蛙的籠子"有幾個

	SetFlag( OwnerID() , 545021 , 0 ) --刪除 已接任務key
	SetFlag( OwnerID() , 545022 , 1 ) --給予 已完成領取獎勵key
	
	if X == 0 then --0
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_14]" ) --你沒有捕捉到任何[118040]…難道是我所施展的魔法失效了嗎？！
	elseif  X >= 1 and X <=5 then --1~5
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"太好了！這下終於可以專心的做好我的研究…
								                --謝謝你的幫助～這些獎勵代表著我的一點心意，希望你會喜歡。"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --獎勵-歡慶青蛙憑證
		DelBodyItem( OwnerID() , 209556 , X ) --刪除 裝著青蛙的籠子
	elseif X > 5 and X <=10 then --6~10
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"太好了！這下終於可以專心的做好我的研究…
									  --謝謝你的幫助～這些獎勵代表著我的一點心意，希望你會喜歡。"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --獎勵-歡慶青蛙憑證
		GiveBodyItem( OwnerID() , 203495 , 3 ) --必爾汀中級藥水HP+30%  3罐
		AddBuff( OwnerID() , 509610 , 0 , 600 ) --BUFF 10分鐘
		DelBodyItem( OwnerID() , 209556 , X ) --刪除 裝著青蛙的籠子
	elseif X > 10 and X <=15 then --11~15
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"太好了！這下終於可以專心的做好我的研究…
									  --謝謝你的幫助～這些獎勵代表著我的一點心意，希望你會喜歡。"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --獎勵-歡慶青蛙憑證
		GiveBodyItem( OwnerID() , 203495 , 5 ) --必爾汀中級藥水HP+30%  5罐
		AddBuff( OwnerID() , 509610 , 0 , 900 ) --BUFF 15分鐘
		DelBodyItem( OwnerID() , 209556 , X ) --刪除 裝著青蛙的籠子
	elseif X > 15 and X <=25 then --16~25
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"太好了！這下終於可以專心的做好我的研究…
									  --謝謝你的幫助～這些獎勵代表著我的一點心意，希望你會喜歡。"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --獎勵-歡慶青蛙憑證
		GiveBodyItem( OwnerID() , 203495 , 5 ) --必爾汀中級藥水HP+30%  5罐
		AddBuff( OwnerID() , 509610 , 0 , 1200 ) --BUFF 20分鐘
		DelBodyItem( OwnerID() , 209556 , X ) --刪除 裝著青蛙的籠子
	else -- >25以上
		SetSpeakDetail( OwnerID(), "[SC_GE2_2011EV1_13]" ) --"太好了！這下終於可以專心的做好我的研究…
									  --謝謝你的幫助～這些獎勵代表著我的一點心意，希望你會喜歡。"
		GiveBodyItem( OwnerID() , 209561 , 1 ) --獎勵-歡慶青蛙憑證
		GiveBodyItem( OwnerID() , 203496 , 5 ) --必爾汀上級藥水HP+40%  5罐
		AddBuff( OwnerID() , 509610 , 0 , 1800 ) --BUFF 30分鐘
		DelBodyItem( OwnerID() , 209556 , X ) --刪除 裝著青蛙的籠子
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118041speak01() --"我願意幫忙！"選項

	SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_03]" )  --那些青蛙的動作實在太敏捷了！為此我努力研究出一種新的魔法，可以將人的外型改變成青蛙，這樣應該能夠降低那些青蛙的警戒心。
								  --我想，只要有機會更貼近牠們，那麼捕捉成功的機率就會大大提升！
								  --不過，這個變身魔法只能持續10分鐘的時間，所以你一定要好好把握時間～並將捕捉到的青蛙交給我，明白嗎？
								  --若準備好了，就讓我為你施放青蛙變身術吧～
	AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_04]" , "Lua_ying_GE2year_change" , 0 ) --"好的，我準備好了～"選項
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_change() --給予任務

	local X = Lua_Mounts_Copilot( OwnerID() ) --檢查玩家是否在雙人坐騎後座 (true=不在後座，false=在後座)

	if X == true then --不在後座
		DW_CancelTypeBuff( 68,  OwnerID() ) --騎乘坐騎時，下馬
		AddBuff( OwnerID() , 509601 , 0 , 600 ) --給予"傻蛙變身術"
		AddBuff( OwnerID() , 509603 , 0 , 300 ) --給予5分鐘計算隻數BUFF
		GiveBodyItem( OwnerID() , 209555 , 1 ) --給予"魔法籠"
		SetFlag ( OwnerID() ,  545021 , 1 ) --給予 已接取任務key
	else --在後座
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_16]" , C_SYSTEM ) --"騎乘坐騎時無法承接此任務，請解除騎乘狀態再承接。"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_16]" , C_SYSTEM ) --"騎乘坐騎時無法承接此任務，請解除騎乘狀態再承接。"
	end
	CloseSpeak( OwnerID() ) --關閉對話視窗
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_buff() --倒數5分鐘，計算隻數BUFF

	local C = CountBodyItem( OwnerID() , 209556 ) --檢查玩家身上"裝著青蛙的籠子"有幾個
	local X = CountBodyItem( OwnerID() , 530714 ) --檢查玩家身上是否有"捕蛙快手"的稱號
	
	if X < 1 then --無稱號
		if C >= 10 then --玩家身上，裝著青蛙的籠子>=10個
			GiveBodyItem( OwnerID() , 530714 , 1 ) --給予"捕蛙快手"稱號
		end
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_buffclear() --變身的BUFF時間到，10分鐘結束提示玩家繳回任務物品

	local Count = CountBodyItem( OwnerID() , 209556 ) --檢查玩家身上"裝著青蛙的籠子"有幾個

	if Count >= 1 then --1以上
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_20]" , C_SYSTEM ) --"傻蛙變身術效果已消失！趕緊將裝著青蛙的籠子交回給塞巴斯帝安吧～"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_20]" , C_SYSTEM ) --"傻蛙變身術效果已消失！趕緊將裝著青蛙的籠子交回給塞巴斯帝安吧～"
	else --=0
		SetFlag( OwnerID() , 545021 , 0 ) --刪除 已接任務key
		SetFlag( OwnerID() , 545022 , 1 ) --給予 已完成領取獎勵key
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_21]" , C_SYSTEM ) --"傻蛙變身術效果已消失！這次沒捕捉到調皮的青蛙，下次再繼續努力吧～"
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_21]" , C_SYSTEM ) --"傻蛙變身術效果已消失！這次沒捕捉到調皮的青蛙，下次再繼續努力吧～"
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_use() --使用物品時檢查的LUA 
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = NPC - 使用目標
	local X = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --讀取目標的orgid
	local Y = GetDistance( OwnerID(), TargetID() ) --取得玩家與目標的距離
	local Z = CheckBuff( OwnerID() , 509601 ) --檢查玩家身上是否有509601 變身術的BUFF

	if CheckID( TargetID() ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 0 then --青蛙存在
		if Z == true then --有變身
			if X == 105632 or X == 105633 then --105632[友善的青蛙] --105633 [憤怒的青蛙]
				if Y <= 50 then --距離 <= 50碼
					return true			
				else  --距離 > 50
					ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_05]" , 0 )  --"距離過遠，無法使用。"
					return false
				end
			else --其他NPC
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
				return false
			end
		else --沒變身
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_06]" , 0 ) --身上沒有[509601]效果，無法使用。
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[EM_201167_3]" , 0 ) --"目標錯誤"
		return false
	end
end
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_giveitem() --使用物品後執行的LUA
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = NPC - 使用目標
	local X = ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) --讀取目標的orgid
	local Y = Rand(100)+1 --rand(0~99)+1 = 1~100
	local Z = CheckBuff( TargetID() , 509602 ) --檢查目標身上是否有"蛙之護盾"BUFF

	if X == 105632 then --105632[友善的青蛙] 
		if Y <= 30 then --成功機率30%
			DelObj( TargetID() ) --刪除青蛙
			GiveBodyItem( OwnerID() , 209556 , 1 ) --給予"裝著青蛙的籠子"
		else --失敗機率70%
			AddBuff( OwnerID() , 509604 , 0 , 3 ) --給予玩家一個"暈眩"的BUFF，持續3秒
--			AdjustFaceDir( TargetID() , OwnerID() , 180 ) -- NPC面對玩家向以180度轉向
--			WriteRoleValue( TargetID()  ,EM_RoleValue_IsWalk , 0  )-- 讓NPC用跑的
--			Lua_MoveLine( TargetID() , 60 ) --向後移動60碼
		end
	elseif X == 105633 then --105633[憤怒的青蛙]
		if Z == false then --青蛙身上沒護盾
			if Y <= 50 then --成功機率50%
				DelObj( TargetID() ) --刪除青蛙
				GiveBodyItem( OwnerID() , 209556 , 1 ) --給予"裝著青蛙的籠子"
			else -- 失敗機率50%
				AddBuff( OwnerID() , 509604 , 0 , 3 ) --給予玩家一個"暈眩"的BUFF，持續3秒
			end
		else --青蛙身上有護盾
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_07]" , C_SYSTEM ) --"需先破除青蛙身上的[509602]！ "
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GE2_2011EV1_07]" , C_SYSTEM ) --"需先破除青蛙身上的[509602]！ "
		end
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040speak() --調皮的青蛙對話
--	Say(OwnerID(), "Owner") = 玩家
--	Say(TargetID(), "Target") = NPC 
	local X = CheckBuff( OwnerID() , 509601 ) --檢查玩家身上是否有509601，變身術的BUFF

	if X == true then --有變身
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
		SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_08]" ) --"嗨～這位朋友，你是新來的嗎？從沒看過你呢…"
		AddSpeakOption( OwnerID() , TargetID() , "[SC_GE2_2011EV1_09]" , "Lua_ying_GE2year_118040hide" , 0 ) --"是啊…我是新來的，請多指教～" 選項
	else --沒變身
		AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
		SetSpeakDetail( OwnerID() , "[SC_GE2_2011EV1_10]" ) --"嘓～～嘓～～嘓～～ 
									   --(青蛙正對著你鳴叫，似乎有什麼話想說，但你卻又聽不懂…)"
	end
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040hide()
--	Say(OwnerID(), "Owner") --= 玩家
--	Say(TargetID(), "Target") --= NPC 
	CloseSpeak( OwnerID() ) --關閉對話視窗
	BeginPlot( TargetID() , "Lua_ying_GE2year_118040hide01" , 0 ) --執行 調皮的青蛙hide function
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_118040hide01() --hide調皮青蛙，產生新NPC，30秒後調皮青蛙出現，新NPC刪除

	local Obj = Role:new( OwnerID() ) --在"調皮的青蛙"原位置，建立新的NPC
	local BaseX = Obj :X() --青蛙的X軸
	local BaseY = Obj :Y() --青蛙的Y軸
	local BaseZ = Obj :Z() --青蛙的Z軸
	local BaseDir = Obj:Dir() --青蛙的面向
	local R= Rand(100)+1 --Rand(0~99)+1 = 1~100
	local Frog
	
	Hide( OwnerID() ) --使調皮的青蛙消失
	if R <= 30 then --機率30%
		Frog = CreateObj( 105632 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --建立"友善的青蛙"
		BeginPlot( Frog , "Lua_ying_GE2year_move" , 0 ) --友善的青蛙 出生時會移動
		AddToPartition( Frog , 0 ) --使新建立出來的青蛙出現
			local Rd = Rand(10)+1 --1~10

			if Rd <= 4 then
				NPCSay( Frog , "[SC_GE2_2011EV1_18]" ) --那我們來當好朋友吧～呵呵～
			end
	else --機率70%
		Frog = CreateObj( 105633 , BaseX , BaseY , BaseZ , BaseDir , 1 ) --建立"憤怒的青蛙"
		AddBuff( Frog , 509602 , 0 , -1 ) --蛙之護盾
		BeginPlot( Frog , "Lua_ying_GE2year_move" , 0 ) --憤怒的青蛙 出生時會移動
		AddToPartition( Frog , 0 ) --使新建立出來的青蛙出現
			local Ra = Rand(10)+1 --1~10

			if Ra <= 4 then
				NPCSay( Frog , "[SC_GE2_2011EV1_19]" ) --看你一臉傻樣，我最討厭跟這類型的打交道了！看招～
			end
	end
	Sleep(400) --40秒
	if  CheckID( Frog ) == true and ReadRoleValue( Frog , EM_RoleValue_IsDead ) == 0 then --青蛙存在
		ScriptMessage( Frog , TargetID() , 1 , "[SC_GE2_2011EV1_17]" , C_SYSTEM ) --"經過幾番掙扎，青蛙趁你不注意時逃走了～"
		ScriptMessage( Frog , TargetID() , 0 , "[SC_GE2_2011EV1_17]" , C_SYSTEM ) --"經過幾番掙扎，青蛙趁你不注意時逃走了～"
		DelObj( Frog ) --刪除Flog
	end
	Show( OwnerID() , 0 ) --使調皮的青蛙出現
end
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_GE2year_move() --友善的青蛙 出生時會移動

	WriteRoleValue( OwnerID(), EM_RoleValue_IsWalk , 0  )-- 讓NPC用跑的
	Hide(OwnerID())
	Show(OwnerID() , 0 )
--	local Rd = Rand(5)+1 --rand(0~4)+1= 1~5

	while TRUE do
		DW_MoveRand( OwnerID(), 60 )  --ObjID 想進行移動的物件   RandRange 想隨機移動的范圍(直徑)
		Sleep(20)
	end
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------