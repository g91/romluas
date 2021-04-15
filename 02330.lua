function cl_136_105205_N() ---控制器AI
	local AI = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( AI , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local boss = 0
	local attackflag = 0 ---戰鬥開始 
	local door_1 = 0 ---阻擋門
	local cck = 0 ----測量距離用,避免BOSS跑去追被抓進帽子的人
	local AI2 = 0 -----帽子裡的控制器重置跟施放技能都靠他
	local Rand_Num = 0
	local wark_rand = 0
	local cazry = 0
	local kill_Table = {}
	local kill_rabbit = 0
	local ThesePlayer = {} -----放戰鬥結束時所有玩家的table,要檢查玩家身上的BUFF
	WriteRoleValue ( AI , EM_RoleValue_Register7, 0 )
	local door = CreateObjByFlag( 105207 , 780844 , 1 , 1 ) ------------誰是boss要在哪裡產生
	WriteRoleValue ( AI , EM_RoleValue_Register8, 0 ) --------對BOSS說是中控器AI產生的
	SetModeEx ( door , EM_SetModeType_Obstruct, true) 		---阻擋(是)
	SetModeEx( door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( door , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
	AddToPartition ( door,RoomID ) ----物件加入場景,例行公事
	for i = 1 , 6 do
		wark_rand = DW_Rand(30)
		local rabbit = CreateObjByFlag( 117377 , 780767 , wark_rand , 1 ) ------------誰是boss要在哪裡產生
		SetModeEx( rabbit , EM_SetModeType_Strikback, false) ---反擊(否)
		SetModeEx( rabbit , EM_SetModeType_Searchenemy, false)--索敵(否)
		SetModeEx( rabbit , EM_SetModeType_Mark, true)			---可點選(是)
		SetModeEx( rabbit , EM_SetModeType_ShowRoleHead, true) 		---頭像框(是)
		SetModeEx( rabbit , EM_SetModeType_Fight, false) ---可砍殺(是)
		SetModeEx( rabbit , EM_SetModeType_NotShowHPMP , true) ----不顯示寫條
		AddToPartition ( rabbit , RoomID ) ----物件加入場景,例行公事
		WriteRoleValue ( rabbit , EM_RoleValue_PID, AI )
		table.insert( kill_Table , rabbit )
		BeginPlot( rabbit,"cl_136_rabbit_N", 0 )
		SetPlot( rabbit, "dead","cl_136_opendoor_dead_N", 0 ) --boss執行死亡劇情,將直傳回給中控器判斷階段
		sleep ( 1 )
	end
	while ReadRoleValue ( AI , EM_RoleValue_Register1 ) ~= 4 do
		sleep ( 5 )
		local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )
		local player = ReadRoleValue ( AI , EM_RoleValue_Register6 )
		local kill_rabbit_GM = ReadRoleValue ( AI , EM_RoleValue_Register7 )
		if kill_rabbit_GM == 1 then
			kill_rabbit = table.getn(kill_Table) ----重整這個Table
			for i = 1 , kill_rabbit , 1 do
				if CheckID(kill_Table[i]) == true then
					delobj ( kill_Table[i] )
				end
			end
			WriteRoleValue ( AI , EM_RoleValue_Register5, 6 )
			WriteRoleValue ( AI , EM_RoleValue_Register7, 0 )
		end
		if showAI >= 6 then
			wark_rand = DW_Rand(30)
			boss = CreateObjByFlag( 105560 , 780767 , wark_rand , 1 )  ------------生出魔術帽
			AddToPartition ( boss,RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器AI產生的
			BeginPlot( boss,"cl_136_105204_N", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			SetPlot( boss, "dead","cl_136_105204_dead_N", 0 ) --boss執行死亡劇情,將直傳回給中控器判斷階段
			SetAttack( boss , player)
			WriteRoleValue ( AI , EM_RoleValue_Register5, 0 ) --------對BOSS說是中控器AI產生的
		end
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 戰鬥開始 stage=2 BOSS死亡 stage=3 BOSS離開戰鬥重置
		if stage == 1 then --如果stage等於1執行以下
			cazry = cazry + 1
			if cazry >= 760 then
				WriteRoleValue ( AI , EM_RoleValue_Register9, 9 ) --------要將R5內的值改變否則BOSS會不斷產生
				Addbuff (  boss , 507744 , 0 ,-1 ) ---
				cazry = 0
			end
			if attackflag == 0 then --如果戰鬥開始等於0執行以下
				door_1 = CreateObjByFlag( 105207 , 780844 , 2 , 1 ) ------------誰是boss要在哪裡產生
				SetModeEx ( door_1 , EM_SetModeType_Obstruct, true) 		---阻擋(是)
				SetModeEx( door_1 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( door_1 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( door_1 , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( door_1 , EM_SetModeType_Mark, false)			---可點選(是)
				SetModeEx( door_1 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( door_1 , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( door_1 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition ( door_1,RoomID ) ----物件加入場景,例行公事
				cck = CreateObjByFlag( 105209 , 780844 , 11 , 1 )  ------------生出測距離的透明球
				SetModeEx( cck , EM_SetModeType_Show, false ) ----秀出
				SetModeEx( cck , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( cck , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( cck , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( cck , EM_SetModeType_Mark, false) ---可點選(是)
				SetModeEx( cck , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( cck , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( cck , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition(cck,RoomID) --讓物件出現在場景上
				WriteRoleValue ( cck , EM_RoleValue_PID, AI ) ---在透明球的PID內寫入AI的GID
				WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) ---在透明就的Register1寫入BOSS的GID
				BeginPlot( cck , "cl_105209_chack_N" , 0 ) ----執行檢查BOSS距離是否超出房間
				sleep ( 1 ) --Sleep 0.1秒避免同時間執行太多BeginPlot造成LAG
				AI2 = CreateObjByFlag( 105209 , 780844 , 9 , 1 ) ------------產生帽子內的控制器
				SetModeEx ( AI2 , EM_SetModeType_Obstruct, false) 		---阻擋(是)
				SetModeEx( AI2 , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( AI2 , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( AI2 , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( AI2 , EM_SetModeType_Mark, false)			---可點選(是)
				SetModeEx( AI2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( AI2 , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( AI2 , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
				AddToPartition ( AI2,RoomID ) ----物件加入場景,例行公事
				WriteRoleValue ( AI2 , EM_RoleValue_PID, AI ) ---在AI2的PID寫入誰是AI
				WriteRoleValue ( AI2 , EM_RoleValue_Register1, boss ) ---在AI2的Register1內寫入誰是BOSS
				WriteRoleValue ( boss , EM_RoleValue_Register2, AI2 ) ---產生AI2候在BOSS的GID寫入AI2的GID
				BeginPlot( AI2 , "cl_105209_P_N" , 0 ) --------執行每秒檢查AI的stage的直是多少
				attackflag = 1 ---將戰鬥開始寫成1避免重複做
			end
			local del_boss = ReadRoleValue ( AI , EM_RoleValue_Register8 )
			if del_boss == 1 then
				local xx1 = ReadRoleValue ( boss, EM_RoleValue_X)
				local yy2 = ReadRoleValue ( boss, EM_RoleValue_Y)
				local zz3 = ReadRoleValue ( boss, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
				local MaxHP = ReadRoleValue( boss , EM_RoleValue_MaxHP )
				local bosshp = ReadRoleValue( boss , EM_RoleValue_HP )						--當前血量
				local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
				local HPPercent = ( bosshp / MaxHP )*100
				if HPPercent >= 1 then
					sleep ( 30 )
					delobj ( boss )
					boss = CreateObj( 105560 , xx1, yy2 , zz3 , 0 , 1 )
					AddToPartition ( boss,RoomID ) ----物件加入場景,例行公事
					WriteRoleValue ( boss , EM_RoleValue_HP , bosshp )
					addbuff ( boss , 508517 , 0 , -1 )
					WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器AI產生的
					WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) --------對BOSS說是中控器AI產生的
					if ReadRoleValue ( AI , EM_RoleValue_Register9 ) == 9 then
						Addbuff (  boss , 507744 , 0 ,-1 ) ---便ADD狂暴BUFF給BOSS
					end
					BeginPlot( boss,"cl_136_105204_N", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
					SetAttack( boss , AttackTarget)
					sleep ( 10 )
				elseif HPPercent < 1 then
					SetModeEx( boss , EM_SetModeType_Fight, true) ---可砍殺(是)
				end	
				WriteRoleValue ( AI , EM_RoleValue_Register8 , 0 )
			end
		elseif stage == 2 then ----如果stage值等於2執行以下--BOSS死亡劇情的時候會回傳這個值變成2
			if ReadRoleValue ( AI , EM_RoleValue_Register8 ) ~= 1 then
				ScriptMessage( boss , -1 , 2 ,"[SC_13604_07]" , 2 )----啊．．在精采的表演，終會散場．．．
				sleep ( 20 )
				local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
				for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
					ThesePlayer[i] = GetSearchResult() --將找到的玩家GID暫時存到這個值內
					if CheckID( ThesePlayer[i] )  == true and  ---檢查GID
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
						if CheckBuff( ThesePlayer[i] , 508522 ) or 
							CheckBuff( ThesePlayer[i] , 509438 ) or 
							CheckBuff( ThesePlayer[i] , 508523 ) or 
							CheckBuff( ThesePlayer[i] , 508603 ) or
							CheckBuff( ThesePlayer[i] , 509437 ) or
							CheckBuff( ThesePlayer[i] , 508520 ) ==  true then ---檢查此玩家身上是否有以上的BUFF如果有的話執行以下
							CancelBuff(ThesePlayer[i], 508520)
							CancelBuff(ThesePlayer[i], 509438)
							CancelBuff(ThesePlayer[i], 508522)
							CancelBuff(ThesePlayer[i], 508523)  ---清除掉玩家身上的BUFF
							CancelBuff(ThesePlayer[i], 508603)
							CancelBuff(ThesePlayer[i], 509437)
						end
					end					
				end
				delobj ( door ) --刪除掉後門
				delobj ( door_1 ) --刪除掉前們
				cazry = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 4 ) ---將Register1身上的直寫回去0不然會一值在這個階段
				attackflag = 0 ---將戰鬥開始寫成0
			elseif ReadRoleValue ( AI , EM_RoleValue_Register8 ) == 1 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 ) ---將Register1身上的直寫回去0不然會一值在這個階段
			end
		elseif stage == 3 then ---如果stage等於3代表進入重置階段---BOSS離開戰鬥後會回傳3
			ScriptMessage( boss , -1 , 2 ,"[SC_13604_08]" , 2 )----你們的哀嚎聲，比掌聲還令人陶醉啊！
			delobj ( boss ) --刪除BOSS
			local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
			for i=1,TempPlayer do ---TempPlayer等於數量代表for迴圈要做幾次
				ThesePlayer[i] = GetSearchResult() -- 接暫存值
				if CheckID( ThesePlayer[i] )  == true and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) ==  0 and 
					ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) ==  1 then--檢查玩家是不是還在；檢查是否死亡
					if CheckBuff( ThesePlayer[i] , 508522 ) or 
						CheckBuff( ThesePlayer[i] , 509438 ) or 
						CheckBuff( ThesePlayer[i] , 508523 ) or 
						CheckBuff( ThesePlayer[i] , 508603 ) or
						CheckBuff( ThesePlayer[i] , 509437 ) or
						CheckBuff( ThesePlayer[i] , 508520 ) ==  true then
						CancelBuff(ThesePlayer[i], 508520)
						CancelBuff(ThesePlayer[i], 509438)
						CancelBuff(ThesePlayer[i], 508522)
						CancelBuff(ThesePlayer[i], 508523)
						CancelBuff(ThesePlayer[i], 508603)
						CancelBuff(ThesePlayer[i], 509437)
					else
					end
				end					
			end
			delobj ( door_1 ) --刪除前門
			sleep ( 30 ) ---停留3秒
			WriteRoleValue ( AI , EM_RoleValue_Register9, 0 ) --------要將R5內的值改變否則BOSS會不斷產生
			cazry = 0
			boss = CreateObjByFlag( 105560 , 780844 , 0 , 1 ) ------------重新產生BOSS
			AddToPartition ( boss,RoomID ) ----物件加入場景,例行公事
			WriteRoleValue ( boss , EM_RoleValue_PID, AI ) --------對BOSS說是中控器AI產生的
			WriteRoleValue ( cck , EM_RoleValue_Register1, boss ) --------對BOSS說是中控器AI產生的
			BeginPlot( boss,"cl_136_105204_N", 0 )  -----------將王的scpipt塞進去王身上,讓王執行
			WriteRoleValue ( AI , EM_RoleValue_Register1 , 0 ) ---將AI的Register1寫回去0
			attackflag = 0
		end
	end
end
function cl_136_105204_N() ---bossAI
	local boss = OwnerID() ----我叫做boss
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID的值代表中控器
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---讀取我的Register2裡面的GID代表AI2
	local skill = 28 ---拋帽
	local skill2 = 0 ---施放清仇恨技能~全場AE
	local skill3 = 0 ---範圍150AE打到帽子要扣HP
	local skill7 = 0 ---單體技能
	local skill22 = 0 ---丟六人紙牌
	local skill99 = 0
	local skill99_9 = 0
	local opentime = 0 --開啟時間
	local CombatBegin = 0 ----戰鬥準備
	local bosstime = 0
	local luck = 0
	local skill9 = 0
	local Flag_OP = 780839
	SetPlot( boss, "dead","cl_136_105204_dead_N", 0 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
		sleep ( 10 )
		local AttackTarget = ReadRoleValue( boss , EM_RoleValue_AttackTargetID )-----AttackTarget=當前攻擊目標
		--local openskill2 = ReadRoleValue( boss , EM_RoleValue_Register3 )-----施放清仇恨的時機
		if HateListCount( boss ) ~= 0 then ---如果王的仇恨表內有人就繼續戰鬥
			if CombatBegin == 0 then   -----如果王的仇恨表內有人~就將這個值改變
				CombatBegin = 1       ------將王的戰鬥開始狀態值改成1~意思就是王進入戰鬥了
				local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 戰鬥開始 stage=2 BOSS死亡 stage=3 BOSS離開戰鬥重置
				if stage == 0 then
					WriteRoleValue ( AI , EM_RoleValue_Register1 , 1 ) ----在中控器的Register1裡寫入1讓AI進入戰鬥階段
					local PPL = SetSearchAllPlayer(RoomID ) -----讀取整個ZONE的所有玩家這裡讀取到的是數量
					local Flag = 1  ------宣告旗標的編號
					for i = 1 , PPL , 1 do ---把玩家抓入房間用 讀取到的玩家數量下去決定for迴圈跑幾次
						local ID = GetSearchResult()  ---將掃到ZONE裡的所有玩家依序存入這個暫存器
						if ReadRoleValue( ID , EM_RoleValue_IsDead ) ~= 1 and ---讀取該名玩家是否死亡
							ReadRoleValue( ID, EM_RoleValue_VOC) ~= 0  and  ---是否為GM
							ReadRoleValue( ID , EM_RoleValue_RoomID  ) == RoomID then  ---RoomID是否與BOSS當前RoomID相同
							SetPosByFlag( ID , Flag_OP , Flag ) ----將玩家傳到這個位置
							Flag = Flag + 1  ----Fiag代表旗標號碼的值,美執行一次就+1
							if Flag > GetMoveFlagCount(Flag_OP) -1 then  --- 讀取780839的旗標總數...如果flag已經大於這個值的話
								Flag = 1  ----就將Flag改寫回1-----用意是避免玩家人數超過旗標總數導致發生抱錯
							end
							sysCastSpelllv ( ID , boss , 496773 , 0 )  ---由系統讓玩家對BOSS施放一個影藏的法術~用來讓BOSS開場戰鬥後確保所有玩家都進入仇恨表
						end
					end
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_02]" , 2 )----SHOW TIME ！表演開始！
					CastSpelllv ( boss , boss , 496920 , 40 ) ---技能-開場秀
					sleep ( 30 )
				end
			end
			if CombatBegin == 1 then 
				skill = skill + 1
				skill3 = skill3 + 1
				skill22 = skill22 + 1
				skill7 = skill7 + 1
				skill9 = skill9 + 1
				if skill7 >= 7 then ---單體技與善行攻擊兩招隨機一朝
					CastSpelllv ( boss , AttackTarget , 496927 , 30  )----對當前目標釋放一個巨大傷害
					sleep ( 10 )
					skill7 = 0
				end
				if skill9 >= 9 then
					CastSpelllv ( boss , boss , 497011 , 40  )----前方扇形
					sleep ( 20 )
					skill9 = 0
				end
				if skill3 >= 13 then --每13秒執行以下
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_03]" , 2 )----睜大你們的眼睛！看仔細這場華麗的秀吧！
					CastSpelllv ( boss , boss , 496924 , 40 ) ---施放範圍50碼的AE
					sleep ( 20 ) --slee0.8秒
					cl_496924_N() ---檢查範圍內是否有帽子
					sleep ( 10 )
					skill3 = 0
				end
				if skill22 >= 17 then 
					ScriptMessage( boss , -1 , 2 ,"[SC_13604_04]" , 2 )----華麗的分身秀！來點掌聲鼓勵吧！
					cl_136_496926_N() ---隨機抓六個人施放紙牌
					sleep ( 30 )
					skill22 = 0
				end
				if skill >= 33 then --每33秒一到就將玩家用帽子蓋起
					while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
						sleep(10)
					end
					CastSpelllv ( boss , boss , 496923 , 0 ) --BOSS對自己施放一個表演拋帽的動作
					cl_magicInHand_BIG_NOL() ----讀取仇恨表內誰要蓋帽誰要變大
					skill99_9 = 2
					sleep ( 30 ) --
					skill = 0
					skill2 = 0
				end
				if skill99_9 == 2 then ---檢查自身的Register3如果那個值等於2就做清仇恨的事情ps在執行cl_105204_105206的時候會回傳值回來
					skill99 = skill99 + 1
					if skill99 >= 22 then
						while 	ReadRoleValue( boss , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
							sleep(10)
						end
						ScriptMessage( boss , -1 , 2 ,"[SC_13604_06]" , 2 )----嘎嘎！重新洗牌！發牌！嘎嘎
						sleep ( 10 )
						CastSpelllv ( boss , boss , 496921 , 0 ) ---BOSS 對場上所有玩家施放將仇恨清成1
						SetModeEx( boss , EM_SetModeType_Fight, false) ---可砍殺(是)
						WriteRoleValue ( AI , EM_RoleValue_Register8 , 1 )
						sleep ( 10 ) --施法兩秒要停兩秒
						--WriteRoleValue ( boss , EM_RoleValue_Register3 , 0 )  ----在Register3內寫回0
						--delobj ( boss )
						skill99_9 = 0
						skill99 = 0
					end
				end
			end
		elseif HateListCount ( boss ) == 0 then ---如果王的仇恨表內沒有人就要傳回給中控器
			if CombatBegin == 1 then  ----如果王仇恨表內沒有人了~就將這個值改變
				CombatBegin = 0
				WriteRoleValue ( AI , EM_RoleValue_Register1 , 3 ) ----在中控器的Register1裡寫入1讓AI進入重置階段
				skill = 0
				skill2 = 0
				skill9 = 0
				skill3 = 0
				skill7 = 0
				openskill2 = 0
				skill99_9 = 0
				skill99 = 0
			end
		end
	end
end
function cl_magicInHand_BIG_NOL()
	local boss = OwnerID()
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID的值代表中控器
	local player_table = {}
	local Migic_table = {}
	local BigBuff_table = {}
	local Rand_big = 0
	local hate_table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
	local hate_number = table.getn(hate_table)  ---取出數量
	for i = 1 , hate_number , 1 do
		if ReadRoleValue ( hate_table[i] ,  EM_RoleValue_IsPlayer ) == 1 then
			table.insert( player_table , hate_table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
		end
	end
	local player_number = table.getn(player_table)  ---取出數量
	if player_number < 3 then
		ScriptMessage( boss , -1 , 2 ,"[SC_13604_01]" , 2 )----有更多的觀眾，我才有表演的動力，你們再去多找點人來吧！
		local kill_table = DW_HateRemain(0)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
		local kill_nob=table.getn(kill_table) ----重整這個Table
		for i = 1 , kill_nob , 1 do ---取出來多少數量就做多少次
			Addbuff (  kill_table[i] , 508516 , 0 ,-1 ) ---給所有玩家上一個定身的BUFF用意是不希望玩家的位置看起來跟魔術帽的位置有差異
			sleep ( 20 ) ---停兩秒後---用意是確保玩家已經停止任何的移動
			local xx = ReadRoleValue ( kill_table[i], EM_RoleValue_X)
			local yy = ReadRoleValue ( kill_table[i], EM_RoleValue_Y)
			local zz = ReadRoleValue ( kill_table[i], EM_RoleValue_Z)   ---------讀取目標的座標
			local headgear = CreateObj( 117260 , xx, yy , zz , 0 , 1 )  ------------依照讀取到的座標產生透明球
			SetModeEx( headgear , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( headgear , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( headgear , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( headgear , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( headgear , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( headgear , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( headgear , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
			AddToPartition( headgear,RoomID )  ---將物件產生在同一個RoomID
			WriteRoleValue ( headgear , EM_RoleValue_PID , boss )  ---在PID內紀錄BOSS
			WriteRoleValue ( headgear , EM_RoleValue_Register1 , kill_table[i] ) ---在R1紀錄目標玩家
			WriteRoleValue ( headgear , EM_RoleValue_Register2 , AI )  ---在R2紀錄中控器的值
			BeginPlot( headgear,"cl_105206_N", 0 )  ----執行20秒後將玩家傳出來的動作
			sleep ( 1 )
			if ReadRoleValue( kill_table[i] , EM_RoleValue_RoomID  ) == RoomID then ----讀取該目標玩家是否跟BOSS為同一個RoonID
				SetPosByFlag( kill_table[i], 780844 , i+2 ) -----如果同一個RoomID的話就傳送到旗標位址~
			end
			local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------對應傳入的玩家產生羅比兔
			AddToPartition( rabbit,RoomID ) ----
			WriteRoleValue ( rabbit , EM_RoleValue_Register1 , kill_table[i] ) ------在兔子的R1內紀錄對應目標玩家
			WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --存活時間20秒~
			BeginPlot( rabbit , "cl_136_105208_N" , 0 )  ----執行兔子本身的SCRIPT
			sleep ( 1 )
		end
	elseif player_number > 3 then
		ScriptMessage( boss , -1 , 2 ,"[SC_13604_05]" , 2 )----觀眾是這場魔術秀的重要的關鍵！好好享受吧！嘎嘎嘎！！
		local player_IN_table = {}
		local TK_TANK_table = DW_HateRemain(1)  ----將仇恨表內的玩家依照仇恨高低排列並且排除主坦
		local TK_TANK=table.getn(TK_TANK_table) ----重整這個Table
		for i = 1 , TK_TANK , 1 do
			if ReadRoleValue ( TK_TANK_table[i] ,  EM_RoleValue_IsPlayer ) == 1 then
				table.insert( player_IN_table , TK_TANK_table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
			end
		end
		local del_P_and_D = table.getn(player_IN_table) ----取出仇恨表內的數量
		for i = 1 , del_P_and_D , 1 do ---取出來多少數量就做多少次
			if ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) ~= 0 then --檢查如果不是GM才執行以下
				if ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) == 5 or
					ReadRoleValue( player_IN_table[i] , EM_RoleValue_VOC ) == 8 then --檢查職業是否為祭司或者神官
					table.remove ( player_IN_table , i ) ---如果事的話就將他從table移除掉
					break ---然後抓到第一個補職後就直接離開回圈
				end
			end
		end
		local Nobuff_play = table.getn( player_IN_table ) ----再重新取出一次數量~這個數量已經排除掉其中一補
		local magic_hand_table = {}
		if Nobuff_play > 0 then
			for i = 1 , Nobuff_play , 1 do
				if	CheckBuff( player_IN_table[i] , 508520 ) ~=  true then
					if CheckBuff( player_IN_table[i] , 508522 ) ~=  true then
						if CheckBuff( player_IN_table[i] , 508603 ) ~=  true then
							if CheckBuff( player_IN_table[i] , 508646 ) ~=  true then  ---要檢查目標玩家是否身上有花&松鼠%兔子的BUFF
								if ReadRoleValue( player_IN_table[i] , EM_RoleValue_IsDead ) ~= 1 then  ---檢查是否為死亡狀態
									table.insert( magic_hand_table , player_IN_table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
								end
							end
						end
					end
				end
			end
			local magic_hand = table.getn( magic_hand_table ) ----再重新取出一次數量~這個數量已經排除掉其中一補
			if magic_hand > 0 then
				Rand_big = DW_Rand(magic_hand)  ---取隨機TABLE的位置
				if magic_hand > 0 then
					table.insert( BigBuff_table , magic_hand_table[Rand_big] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
					table.remove ( magic_hand_table , Rand_big ) --則移除掉
					magic_hand = table.getn( magic_hand_table ) ----再重新取出一次數量~這個數量已經排除掉其中一補
					local Rand_magic = DW_Rand(magic_hand)  ---取隨機TABLE的位置
					if magic_hand > 0 then
						table.insert( Migic_table , magic_hand_table[Rand_magic] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
						table.remove ( magic_hand_table , Rand_magic ) --則移除掉
						magic_hand = table.getn( magic_hand_table ) ----再重新取出一次數量~這個數量已經排除掉其中一補
					end
				end
			end
			local BUFF_BIG = table.getn(BigBuff_table) ----將要蓋起來的玩家TABLE重讀取一次數量
			if BUFF_BIG > 0 then
				for i = 1 , BUFF_BIG , 1 do ----依照TABLE裡面的數量下去做for迴圈
					addbuff ( BigBuff_table[i] , 508520 , 0 , -1 )  ---把這些玩家變大~
				end
			end
			local In_magic = table.getn(Migic_table) ----將要蓋起來的玩家TABLE重讀取一次數量
			if In_magic > 0 then ----讀取到的數量大於0的話就執行
				for i = 1 , In_magic , 1 do ----執行取出數量的迴圈次數
					Addbuff (  Migic_table[i] , 508516 , 0 ,-1 ) ---先上一個定身BUFF
				end
				sleep ( 20 )  ---
				for i = 1 , In_magic , 1 do
					local xx = ReadRoleValue ( Migic_table[i], EM_RoleValue_X)
					local yy = ReadRoleValue ( Migic_table[i], EM_RoleValue_Y)
					local zz = ReadRoleValue ( Migic_table[i], EM_RoleValue_Z)   ---------讀取目標玩家的座標
					local headgear = CreateObj( 117260 , xx, yy , zz , 0 , 1 )  ------------產生透明球
					SetModeEx( headgear , EM_SetModeType_Strikback, false) ---反擊(否)
					SetModeEx( headgear , EM_SetModeType_Move, false) ---移動	(否)
					SetModeEx( headgear , EM_SetModeType_Searchenemy, false)--索敵(否)
					SetModeEx( headgear , EM_SetModeType_Mark, true)			---可點選(是)
					SetModeEx( headgear , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
					SetModeEx( headgear , EM_SetModeType_Fight, false) ---可砍殺(是)
					SetModeEx( headgear , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
					AddToPartition( headgear,RoomID ) ----使物件出現在場景上
					WriteRoleValue ( headgear , EM_RoleValue_PID , boss ) ----在PID內紀錄BOSS的值
					WriteRoleValue ( headgear , EM_RoleValue_Register1 , Migic_table[i] ) ----在R1紀錄目標玩家的值
					WriteRoleValue ( headgear , EM_RoleValue_Register2 , AI ) ---在R2紀錄中控器的值
					BeginPlot( headgear,"cl_105206_N", 0 ) ---執行帽子在20秒後傳出玩家的動作
					sleep ( 1 )
					if ReadRoleValue( Migic_table[i] , EM_RoleValue_RoomID  ) == RoomID then
						SetPosByFlag( Migic_table[i], 780844 , i+2 ) ----------------對應傳入的玩家產生羅比兔
					end
					local rabbit = CreateObjByFlag( 105208 , 780844 , i+5 , 1 )  ------------生出羅比兔
					AddToPartition( rabbit,RoomID ) ---使物件出現在場景上
					WriteRoleValue ( rabbit , EM_RoleValue_Register1 , Migic_table[i] ) ----紀錄當前目標玩家
					WriteRoleValue( rabbit , EM_RoleValue_Livetime, 20 )  --存活時間
					BeginPlot( rabbit , "cl_136_105208_N" , 0 )
					sleep ( 1 )
				end
			end
		end
	end
end
function cl_105206_N()  ----魔術帽25秒後把人船出來
	local headgear = OwnerID()
	local boss = ReadRoleValue( headgear , EM_RoleValue_PID )
	local player = ReadRoleValue( headgear , EM_RoleValue_Register1 )
	local AI = ReadRoleValue ( headgear , EM_RoleValue_Register2)
	local RoomID = ReadRoleValue( headgear , EM_RoleValue_RoomID )
	local skill = 1
	local xx = 0
	local yy = 0
	local zz = 0
	sysCastSpelllv ( headgear , headgear , 496882 , 0 )
	SetPlot( headgear, "touch","cl_105206_touch_N", 40 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do
	sleep ( 10 )
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )
		if stage == 1 then
			skill = skill +1
			if skill >= 20 then
				cl_chbuff_117260_N() ----20秒後執行將玩家傳出來並且檢查BUFF的動作
				xx = ReadRoleValue ( headgear, EM_RoleValue_X)
				yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
				zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
				local ball = CreateObj( 105566 , xx, yy , zz , 0 , 1 )  ------------生出魔術帽
				SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
				SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
				SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
				SetModeEx( ball , EM_SetModeType_Mark, true)			---可點選(是)
				SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
				SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
				SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
				AddToPartition( ball,RoomID )
				WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --存活時間
				BeginPlot( ball , "cl_136_105242ball_N" , 0 )
			end
		else
			delobj( headgear )
		end
	end
end
function cl_105206_touch_N()  --觸碰劇情要讓玩家表演施法動作,然後讓小兔子到處亂跑cl_136_496883
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	--CastSpelllv ( player , headgear , 496928 , 0 )
	if CheckBuff(  player , 508520 ) == true then
		if	BeginCastBarEvent( player , headgear , "[SC_13604_12]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_117377_N") ~=1	then
			ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	elseif CheckBuff(  player , 508520 ) == false then
		ScriptMessage( player, player, 1,"[SC_13604_11]", 0 );		--這帽子太大了！你沒辦法搬動它．．
	end
end
function cl_136_117377_N(Executer,Result) ---嘗試著抓取兔子
	if	Result > 0 then --成功狀態
		EndCastBar(Executer,Result)--清除施法條
		BeginPlot( TargetID() , "cl_136_496883_N" , 0)
	else --失敗狀態
		EndCastBar(Executer,Result)--清除施法條
	end
end
function cl_136_105204_dead_N()  ---boss的死亡劇情
	local AI = ReadRoleValue ( OwnerID() , EM_RoleValue_PID ) --PID的值代表中控器
	WriteRoleValue ( AI , EM_RoleValue_Register1 , 2 )
end
function cl_136_496883_N()  ----施法結束後檢查請帽子執行將玩家傳送出來的動作
	local headgear= OwnerID()
	local player = TargetID()
	CancelBuff( player , 508520 )
	BeginPlot( headgear,"cl_chbuff_117260_N", 0 )
end
function cl_chbuff_117260_N() ---將玩家傳送出來~檢查身上有沒有BUFF沒有的話補一個變身法術給玩家
	local headgear = OwnerID()
	local RoomID = ReadRoleValue( headgear , EM_RoleValue_RoomID )
	local player = ReadRoleValue( headgear , EM_RoleValue_Register1 )
	local boss = ReadRoleValue( headgear , EM_RoleValue_PID )
	local xx = 0
	local yy = 0
	local zz = 0
	local xx1 = 0
	local yy1 = 0
	local zz1 = 0
	local randbuff = { 508522 , 508603 , 509437 }
	local rbuff = 0
	xx = ReadRoleValue ( headgear, EM_RoleValue_X)
	yy = ReadRoleValue ( headgear, EM_RoleValue_Y)
	zz = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
	if ReadRoleValue( player , EM_RoleValue_RoomID  ) == RoomID then
		SetPos( player , xx , yy , zz , 0 )
	end
	sleep ( 5 )
	if CheckBuff(  player , 509438 ) == true then
		CancelBuff_NoEvent( player , 509438 ) ---清除BUFF
		sysCastSpelllv ( headgear , headgear , 496884 , 0 ) ---帽子自己表演一個
		--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
		sleep ( 5 )
	elseif CheckBuff(  player , 509438 ) == false then
		if ReadRoleValue( player , EM_RoleValue_IsDead ) ~= 1 then
			rbuff = DW_Rand ( 3 )
			addbuff ( player , randbuff[rbuff] , 0 , -1 ) ----給予變身
			xx1 = ReadRoleValue ( headgear, EM_RoleValue_X)
			yy2 = ReadRoleValue ( headgear, EM_RoleValue_Y)
			zz3 = ReadRoleValue ( headgear, EM_RoleValue_Z)   ---------這裡是捉出Attackplayer裡面的那個人的座標
			local ball = CreateObj( 105566 , xx, yy , zz , 0 , 1 )  ------------生出魔術帽
			SetModeEx( ball , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( ball , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( ball , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( ball , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( ball , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( ball , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( ball , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條
			AddToPartition( ball,RoomID )
			WriteRoleValue( ball , EM_RoleValue_Livetime, 5 )  --存活時間
			BeginPlot( ball , "cl_136_105242ball_N" , 0 )
			--WriteRoleValue ( boss , EM_RoleValue_Register3 , 2 )
			sleep ( 5 )
		end
	end
	delobj( headgear )
end
function cl_105208_dead_N() ----兔子的死亡劇情要給玩家一個檢查的BUFF
	addbuff ( TargetID() , 509438 , 0 , -1 )
	delobj ( OwnerID() )
end
function cl_136_105209_AI2_N() ---BOSS離開戰鬥要傳到這裡
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local TempPlayer = 0
	local xx = 0
	for YY = 1 , 2 , 1 do 
		TempPlayer = SearchRangePlayer ( OwnerID() , 200 )----找魔術帽裡面的所有玩家"TempPlayer"這是一個TABLE
		xx=table.getn(TempPlayer) ----讀取TABLE裡抓到的數量
		for i=0,xx-1 do
			if ReadRoleValue( TempPlayer[i] , EM_RoleValue_RoomID  ) == RoomID then
				SetPosByFlag( TempPlayer[i], 780844 , 10 )  ----依序將玩家傳送到入口點
			end
		end
		sleep ( 50 )
	end
	delobj ( OwnerID() )
end
function cl_105209_chack_N() ---檢查BOSS是否距離超出房間避免BOSS追去打被傳入帽子內的玩家
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	while 1 do
		sleep (30)
		local boss = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		if ReadRoleValue( boss , EM_RoleValue_IsDead ) ==  0 then
			local oo = GetDistance( OwnerID(), boss );
			if oo >= 600 then
				WriteRoleValue ( AI , EM_RoleValue_Register1 ,3 )
			end
		elseif ReadRoleValue( boss , EM_RoleValue_IsDead ) ~=  0 then
			delobj ( OwnerID() )
		end
	end
end
function cl_105209_P_N() ----檢查AI的stage的直是多少
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID)  ------>我去讀取控制器裡面的PID值告訴BOSS王是控制器生出來的
	while 1 do
		sleep (5)
		local stage = ReadRoleValue ( AI , EM_RoleValue_Register1 )  ----stage=1 戰鬥開始 stage=2 BOSS死亡 stage=3 BOSS離開戰鬥重置
		if stage == 1 then
		elseif stage == 2 then
			cl_136_105209_AI2_N()
		elseif stage == 3 then
			cl_136_105209_AI2_N()
		end
	end
end
function cl_136_105208_N() ---兔子的AI
	local rabbit = OwnerID() ----我叫做AI
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local skill = 0
	Addbuff (  rabbit , 508599 , 0 ,-1 ) ---508602
	SetPlot( rabbit, "dead","cl_105208_dead_N", 0 )
	while 1 do
		sleep ( 10 )
		skill = skill + 1
	end
end
function cl_496924_N() --檢查範圍內有沒有帽子
	local boss = OwnerID() ----我叫做boss
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID的值代表中控器
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---我的Register2裡的值為AI2
	local most = {} --most是個table
	most = SearchRangeNPC ( boss , 75 ) --most是我讀取範圍內的NPC
	local mostno = table.getn(most) ---宣告mostno是取出most裡的數量
	for i=1 , mostno , 1 do ---取出來的數量代表要做幾次
		if ReadRoleValue( most[i] , EM_RoleValue_OrgID ) == 117260 then --如果依序找到的NPC裡面有117260帽子的話就執行以下
			sysCastSpelllv ( most[i] , most[i] , 496925 , 0 ) ---請帽子對自己施放一個AE命中的特效沒有任何傷害
			sysCastSpelllv ( AI2 , AI2 , 496929 , 0 ) --請AI2隊帽子裡面的所有玩家施放-80%傷害的AE
		end
	end
end
function cl_136_496926_N()  ---抓六個人丟牌
	local boss = OwnerID() ----我叫做boss
	local RoomID = ReadRoleValue( boss , EM_RoleValue_RoomID ) ----這是AI讀取到的地圖
	local AI = ReadRoleValue ( boss , EM_RoleValue_PID ) --PID的值代表中控器
	local AI2 = ReadRoleValue ( boss , EM_RoleValue_Register2 ) ---我的Register2裡的值為AI2
	local hset_table = {}
	local rand={}
	local hset2_table = {}
	local hset2 = 0
	local z = 0
	local y = 0
	local x = 0
	--local boss2 = 0
	hset_table = DW_HateRemain(0)
	local hset = table.getn(hset_table)
	if hset >= 1 then
		for i = 1 , 6 , 1 do ----抓三個玩家
			Rand_Num = DW_Rand(hset)
			if hset >= 1 then
				table.insert( hset2_table , hset_table[Rand_Num] )
				table.remove ( hset_table , Rand_Num )
				hset=table.getn(hset_table)
			end
		end
	end
	hset2 = table.getn(hset2_table)
	if hset2 >= 1 then
		for i = 1 , hset2 , 1 do
			x = ReadRoleValue (boss, EM_RoleValue_X)
			y = ReadRoleValue (boss, EM_RoleValue_Y)
			z = ReadRoleValue (boss, EM_RoleValue_Z)
			rand = Az_RND_Ary(-150,150,2)
			local boss2 = CreateObj ( 105560 , x+rand[1] , y+30 , z+rand[2] , 0 , 1) --隨機字身周圍生怪
			--local boss2 = CreateObjByFlag( 105204 , 780852 , i , 1 )  ------------生出魔術帽
			SetModeEx( boss2 , EM_SetModeType_Strikback, false) ---反擊(否)
			SetModeEx( boss2 , EM_SetModeType_Move, false) ---移動	(否)
			SetModeEx( boss2 , EM_SetModeType_Searchenemy, false)--索敵(否)
			SetModeEx( boss2 , EM_SetModeType_Mark, true)			---可點選(是)
			SetModeEx( boss2 , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
			SetModeEx( boss2 , EM_SetModeType_Fight, false) ---可砍殺(是)
			SetModeEx( boss2 , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條
			SetModeEx( boss2 , EM_SetModeType_Gravity , false ) ---重利
			AddToPartition( boss2,RoomID )
			WriteRoleValue ( boss2 , EM_RoleValue_PID , boss )
			WriteRoleValue ( boss2 , EM_RoleValue_Register1 , hset2_table[i] )
			WriteRoleValue ( boss2 , EM_RoleValue_Register2 , AI )
			--WriteRoleValue ( boss2 , EM_RoleValue_Livetime , 3 )
			BeginPlot( boss2,"cl_136_hset2_table_N", 0 )
			sleep ( 1 )
		end
	end
end
function cl_136_hset2_table_N() ---分身對玩家施放紙牌技能
	local player = ReadRoleValue ( OwnerID() , EM_RoleValue_Register1 )
	CastSpelllv ( OwnerID() , player , 496926 , 5 )
	sleep ( 30 )
	delobj ( OwnerID() )
end
function cl_117377_touch_N()  --觸碰劇情要讓玩家表演施法動作,然後讓小兔子到處亂跑
	local player = OwnerID()
	local headgear = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	--CastSpelllv ( player , headgear , 496928 , 0 )
	if	BeginCastBarEvent( player , headgear , "[SC_13604_09]" , 20 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END,0 , "cl_136_496928_N") ~=1	then
		ScriptMessage( player, player, 1,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
	end
end
function cl_496928_N() ---施法結束後叫兔子自己執行劇情
	local headgear = OwnerID() --SC_13604_08
	local player  = TargetID()
	local AI = ReadRoleValue( headgear , EM_RoleValue_PID )
	BeginPlot( headgear , "cl_117377_rabbit_N" , 0)
end
function cl_117377_rabbit_N() --讓自己使用碰法術在變大然後刪掉自己
	local AI = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	StopMove( OwnerID() , false )
	Addbuff (  OwnerID() , 508523 , 0 ,-1 ) ---兔子變大
	CastSpelllv ( OwnerID() , OwnerID() , 496884 , 0 )
	sleep ( 10 )
	local showAI = ReadRoleValue ( AI , EM_RoleValue_Register5 )
	WriteRoleValue ( AI , EM_RoleValue_Register5 , showAI+1 )
	WriteRoleValue ( AI , EM_RoleValue_Register6 , TargetID() )
	delobj ( OwnerID() )
end
function cl_136_rabbit_N() ---抓到真的兔子才會變出BOSS來
	local rabbit = OwnerID()
	local RoomID = ReadRoleValue( rabbit , EM_RoleValue_RoomID ) ---宣告這個地圖~是我現在讀到的地圖
	local AI = ReadRoleValue( rabbit , EM_RoleValue_PID )
	local fiag = 0
	SetPlot( rabbit, "touch","cl_117377_touch_N", 20 ) ------PlotType 觸發類型 (分為"touch"觸碰、"range"範圍、"dead"死亡、"collision"碰撞四種)
	while 1 do   ------王的戰鬥迴圈,這裡要告訴王每隔多久就檢查一次
		sleep ( 10 )
		fiag = DW_Rand(30)
		WriteRoleValue( rabbit,EM_RoleValue_IsWalk,0)
		Hide(rabbit)
		Show(rabbit,RoomID)
		DW_MoveToFlag( rabbit , 780767 , fiag , 0 ) ----隨機Rand旗子走路
		sleep ( 10 )
	end
end
function cl_136_496928_N(Executer,Result) ---嘗試著抓取兔子
	if	Result > 0 then --成功狀態
		local oo = GetDistance( OwnerID() , TargetID() );
		if oo <= 40 then ----------------------------------------------------------------------------------------------------------要修改回20
			EndCastBar(Executer,Result)--清除施法條
			BeginPlot( TargetID() , "cl_496928_N" , 0)
		else
			EndCastBar(Executer,-1)--清除施法條
			ScriptMessage( TargetID() , -1 , 2 ,"[SC_13604_10]" , 2 )----SHOW TIME ！表演開始！
		end
	else --失敗狀態
		EndCastBar(Executer,Result)--清除施法條
	end
end
function cl_136_105242ball_N()  --誰?
	CastSpelllv ( OwnerID() , OwnerID() , 496928 , 0 )  -----這是誰放的?
end
function cl_508603_N()  ----傳染的BUFF檢查一下
	if CheckBuff( TargetID() , 509437 ) == false and
		CheckBuff( TargetID() , 508603 ) == false and
		CheckBuff( TargetID() , 508991 ) == false and
		CheckBuff( TargetID() , 508522 ) == false then
		return true
	elseif CheckBuff( TargetID() , 509437 ) == true or
		CheckBuff( TargetID() , 508603 ) == true or
		CheckBuff( TargetID() , 508522 ) == true or
		CheckBuff( TargetID() , 508991 ) == true or
		ReadRoleValue( TargetID() , EM_RoleValue_VOC ) == 0 then
		return false
	end
end
function cl_136_opendoor_dead_N()
	local rabbit = OwnerID()
	local AI = ReadRoleValue ( rabbit , EM_RoleValue_PID )
	WriteRoleValue ( AI , EM_RoleValue_Register7, 1 )
end