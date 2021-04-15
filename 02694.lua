--NPC 潔米蕊兒 121044

function Lua_na_2012loom_jammie()
	local Owner = OwnerID()

	if CheckFlag ( Owner , 546728 ) == true then --如果本日已經完成過活動

		local Language = GetServerDataLanguage() 		           --抓取目前server的語系
		if Language == "tw" then  -- 台版專屬沒有重置選項
			SetSpeakDetail( Owner , "[SC_2012LOOM_NEXTDAY2]" )  -- 新增字串
		else  
			SetSpeakDetail( Owner , "[SC_2012LOOM_NEXTDAY]" )
			AddSpeakOption( Owner , Owner , "[SC_FLOWERFES_KORS_RS05]" , "Lua_na_2012loom_again" , 0 )	
		end
	elseif CheckFlag ( Owner , 546685 ) == true then --完成度 ==0
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK5]" ) --我想應該沒有這麼困難才對……是我的說明不夠詳細嗎……？
		GiveBodyItem( Owner , 241645 , 1 ) --給予1個實用紡織材料包
		SetFlag( Owner , 546685 , 0) 
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 		
	elseif CheckFlag ( Owner , 546867 ) == true then -- 完成度<=3
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK5]" ) --我想應該沒有這麼困難才對……是我的說明不夠詳細嗎……？
		GiveBodyItem( Owner , 241645 , 1 ) --給予1個實用紡織材料包
		GiveBodyItem( Owner , 725649 , 1 ) --7天節慶能力藥水(5個)
		SetFlag( Owner , 546867 , 0)
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 
	elseif CheckFlag ( Owner , 546868 ) == true then  --完成度 <=10
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK6]" ) --是我高估你了嗎？我原本期望你可以做得更好……
		GiveBodyItem( Owner , 241645 , 2 ) --給予2個實用紡織材料包
		GiveBodyItem( Owner , 725649 , 1 ) --7天節慶能力藥水(5個)
		SetFlag( Owner , 546868 , 0)
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 
	elseif CheckFlag ( Owner , 546869 ) == true then --完成度 <=15
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK7]" ) --我想你會越來越得心應手的！我會繼續期待你的表現！
		GiveBodyItem( Owner , 241645 , 3 ) --給予3個實用紡織材料包
		GiveBodyItem( Owner , 725649 , 1 ) --7天節慶能力藥水(5個)
		SetFlag( Owner , 546869 , 0)
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 
	elseif CheckFlag ( Owner , 546870 ) == true then  --完成度 <=19
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK8]" ) --好可惜，就差一點了！你果然是值得依賴的對象，我相信你下一次的表現一定可以達到完美境界。
		GiveBodyItem( Owner , 241645 , 5) --給予5個實用紡織材料包
		GiveBodyItem( Owner , 725649 , 1 ) --7天節慶能力藥水(5個)
		SetFlag( Owner , 546870 , 0)
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 
	elseif CheckFlag ( Owner , 546729 ) == true then  --完美達成
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK9]" ) --你的表現真的太精湛了！果然不負我的期望！
		GiveBodyItem( Owner , 241646 , 1) --給予1個女神紡織材料包
		GiveBodyItem( Owner , 725649 , 1 ) --7天節慶能力藥水(5個)
		SetFlag( Owner , 546729 , 0)
		SetFlag( Owner , 546728 , 1) --給予本日完成旗標
		DesignLog( Owner, 121044 , "2012 weave event- loom helper end" )
	--	Lua_2012loom_allnewevent()
		Lua_Festival_07_All(Owner)    -- 2013 改全勤獎函式 
	elseif CheckFlag ( Owner , 546686 ) == true then --本日已領取過鑰匙，但鑰匙不在身上
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]" ) --我很期待你的表現！
	elseif CountBodyItem( Owner , 241638 ) < 1 then --身上沒有鑰匙
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK]" )
		AddSpeakOption( Owner , Owner , "[SC_423911_02]" , "Lua_na_2012loom_yes" , 0 )
		AddSpeakOption( Owner , Owner ,"[SC_2012LOOM_NO]" , "Lua_na_2012loom_no" , 0 )
	else --有鑰匙尚未完成任務
		SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]" ) --我很期待你的表現！
	end
	AddSpeakOption( Owner, Owner, "[SC_COLORWEAVE_01]","lua_mika_weave_story",0) --綵織節的由來
end

function Lua_na_2012loom_yes()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK1]") --活動說明
	AddSpeakOption( Owner , Owner , "[SC_2012LOOM_SPEAK2]" , "Lua_na_2012loom_give", 0)	--收下織布機啟動器
	DesignLog( Owner, 121044 , "2012 weave event- loom helper start" )
end

function Lua_na_2012loom_give() --給予啟動器
	local Owner = OwnerID()
	SetFlag( Owner ,546686 , 1 ) --本日已經領取過鑰匙
	GiveBodyItem( Owner , 241638 , 1 )
	SetSpeakDetail( Owner , "[SC_2012LOOM_SPEAK3]") --我很期待你的表現！
end	

function Lua_na_2012loom_no()
	SetSpeakDetail( OwnerID() , "[SC_2012LOOM_SPEAK4]") --既然你不願意，我也不能勉強你！我想你應該只是還沒準備好吧……
end

--function Lua_2012loom_allnewevent()
--	local OID = OwnerID()
--	local allcount = 3  -- 所有新活動數量
--	local count = 0
--	local keylist =  {
--		546728, -- 魔幻織布機
--		546864, -- 魔法裁縫師
--		546876  -- 慈善拍賣會
--		}
--
--	for i =  1 , table.getn(keylist) do
--		if Checkflag(OID , keylist[i] )  == true then
--			count = count +1
--		end
--		if i == table.getn(keylist) then
--			if count == allcount then -- 如果完成全部
--			lua_mika_festivalbuffgive(OID, 0 )  -- 2012. 5月愛樂節活動 為等級0
--			end
--		end
--	end
--end



function Lua_na_2012loom_again()
	local Owner = OwnerID()
	if CountBodyItem ( Owner , 202903 ) >= 1 then
		DelBodyItem( Owner , 202903 , 1 )
		SetFlag( Owner ,546728 , 0 ) --本日已完成
		SetFlag( Owner ,546686 , 0 ) --本日已領取鑰匙
		ScriptMessage( Owner , Owner , 0 ,"[SC_2012LOOM_GIVE]" , 0 ) --獲得再次挑戰的機會。		
		ScriptMessage( Owner , Owner , 2 ,"[SC_2012LOOM_GIVE]" , 0 ) --獲得再次挑戰的機會。
		CloseSpeak( Owner)		
	else
		ScriptMessage( Owner , Owner , 1 ,"[SC_202903_NOTENOUGH]" , 0 )
		CloseSpeak( Owner)
	end
end	


--織布機的劇情
function Lua_na_Weave_loom() -- 121040 織布機初始劇情
	local Owner = OwnerID()
	WriteRoleValue ( Owner , EM_RoleValue_Register1 , 0 ) --將自己的Reg 1 值寫為0，表示可以進行遊戲
	WriteRoleValue (Owner , EM_RoleValue_Register2 , 0 ) -- 答案歸零 
	WriteRoleValue ( Owner , EM_RoleValue_Register8 , 0 ) --清空玩家	
--	local Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register1)
--	Say (Owner , Reg2 )
	SetPlot( Owner, "touch" , "Lua_na_loom_touch" , 50) --設定觸碰劇情
end


function Lua_na_loom_touch()
	local Owner = OwnerID() --玩家
	local Target = TargetID() --織布機
	if ReadRoleValue( Target , EM_RoleValue_Register1) == 0 then --檢查織布機是否可用
		if CountBodyItem( Owner , 241638 )  >= 1 then --檢查玩家身上是否有起動器 241638
			WriteRoleValue( Target , EM_RoleValue_Register1 , 1) --將織布機寫為1，表示目前使用中
			WriteRoleValue( Target , EM_RoleValue_Register8 , Owner)  --讓織布機記住玩家 
			DelBodyItem( Owner , 241638, 1 ) -- 刪除啟動鑰匙 
			BeginPlot( Target , "Lua_na_loom_start" , 0 ) --織布機啟動劇情  
			AddBuff( Owner , 622971 , 0 , 30 ) --織布機驅動者
			AddBuff( Owner , 623052 , 0 , -1 ) --計分
		else
			ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_MES02]" , 0) --身上沒有織布機啟動器
			return
		end
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_MES01]" , 0 ) --織布機目前正在運作中！
	end	
end


function Lua_na_loom_start()
	local loom = OwnerID() --織布機
	local Target = TargetID()
	local Reg1 = ReadRoleValue ( loom , EM_RoleValue_Register1 )
	PlayMotion( loom , 146 )
	AddBuff( loom , 622965, 0 , 60 )
	sleep(10)
	Beginplot( loom , "Lua_na_2012_loom_start" , 0 )
	Lua_na_loom_marks_born2(loom)
end


--出現印記
function Lua_na_loom_marks_born2(loom)
	local X = {1,2,3}  --三個旗標位置
	local Y = 0
	local Y1 = {}
	local Mark123 = {121041 , 121042 , 121043}  --梭子、彩線、剪刀，三個印記。
	for i = 1 , 3 do   -- 產生3個
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local Mark = {}
		Mark[i]  = CreateObjByFlag( Mark123[i] , 781172, Y1[i] ,1) --使用旗子產生 npc 旗子編號 數量 
		SetModeEx( Mark[i]  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Mark[i]  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Mark[i] , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Mark[i] , EM_SetModeType_Mark, false )--標記
		SetModeEx( Mark[i] , EM_SetModeType_Move, false )--移動
		SetModeEx( Mark[i] , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Mark[i] , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Mark[i] , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Mark[i] , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Mark[i], EM_SetModeType_Drag , false )--阻力
		SetModeEx( Mark[i], EM_SetModeType_Show, true )--顯示
		AddToPartition( Mark[i]  , 0 )	--產生旗標
		WriteRoleValue( Mark[i] , EM_RoleValue_Register9 , loom) --紀錄織布機
		local Reg9 = ReadRoleValue( Mark[i] , EM_RoleValue_Register9)
	end		
end


function Lua_na_weave_item() 
	local Owner = OwnerID()
	local OrgID = ReadRoleValue(  Owner , EM_RoleValue_OrgID)
	local loom = ReadRoleValue( Owner , EM_RoleValue_Register9)
	local loomstarter =  ReadRoleValue( loom , EM_RoleValue_Register8)
	local RoomID = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local Obj = Role:new( Owner )  -- 取得印記X.Y.Z.Dir值
	local BaseX = Obj :X()
 	local BaseY = Obj :Y();
 	local BaseZ = Obj :Z();
	local BaseDir = Obj:Dir();
	local NPC = CreateObj( 121051, BaseX, BaseY, BaseZ, BaseDir, 1 ) --在印記座標 X.Y.Z.Dir 創立物件
	SetModeEx( NPC, EM_SetModeType_Strikback, false )--反擊
	SetModeEx( NPC, EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( NPC, EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( NPC, EM_SetModeType_Mark, true )--標記
	SetModeEx( NPC, EM_SetModeType_Move, false )--移動
	SetModeEx( NPC, EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( NPC, EM_SetModeType_HideName, true )--名稱
	SetModeEx( NPC, EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( NPC, EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( NPC, EM_SetModeType_Drag , false )--阻力
	SetModeEx( NPC, EM_SetModeType_Show, true )--顯示
	if OrgID == 121041 then
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 1 )  --點擊此箱子，表示梭子
	elseif OrgID == 121042 then
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 2 ) --點擊此箱子，表示彩線
	else
		WriteRoleValue( NPC , EM_RoleValue_Register1 , 3 ) --點擊此箱子，表示剪刀
	end
	WriteRoleValue( NPC , EM_RoleValue_Register9 , loom ) --將織布機寫入寶箱
	WriteRoleValue( NPC , EM_RoleValue_Register8 , loomstarter) --將玩家寫入寶箱
	AddToPartition( NPC , RoomID) -- 建立物件
	SetPlot( NPC , "touch" , "Lua_na_weave_item1" , 10 )
end

function Lua_na_weave_item1() --寶箱的觸碰劇情
	local Owner = OwnerID() --玩家
	local Target = TargetID() -- 寶箱
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID) 
	local loom = ReadRoleValue( Target , EM_RoleValue_Register9) --織布機
	local loomstarter =  ReadRoleValue( loom , EM_RoleValue_Register8)	--玩家
	local Type= ReadRoleValue( Target , EM_RoleValue_Register1)
	if Owner == loomstarter then
		if Type == 1 then
			SysCastSpellLv( loomstarter , loom , 499515 ,1)  
		elseif Type == 2 then
			SysCastSpellLv( loomstarter , loom , 499516 ,1)
		elseif Type == 3 then
			SysCastSpellLv( loomstarter , loom , 499517 ,1)  
		end
	Sleep(10)
	end
end



---織布機活動出題劇情
function Lua_na_2012_loom_start()
	local Owner = OwnerID() --織布機
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register8 )
	local Mes = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --字串
	local ColorBuff = { 622962 , 622963, 622964 } -- 魔法陣提示
	sleep(20)
	ScriptMessage( Owner , Player , 0 , "[SC_2012LOOM_START01]" , C_SYSTEM) --[121040](織布機)開始啟動，織出第一排布料。
	ScriptMessage( Owner , Player , 1 , "[SC_2012LOOM_START01]" , C_SYSTEM)
	sleep(30)
	for i = 1 , 3 do --前三回合為正常
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
		--	local R = rand(3)+1	 --隨機出題
			local TR = (rand(3)+3)*10   --每次出題的間隔時間
			ScriptMessage(Player , Player, 2 , Mes[i] , 0) --警告！織布機的 訊息 告知出現錯誤！
			AddBuff( Owner , ColorBuff[i] , 0 , 8 )
			WriteRoleValue (Owner , EM_RoleValue_Register2 , i)  --檢查織布機身上的答案		 
			Sleep(50) --8秒之內要回答問題
			if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
				AddBuff( Owner , 623054 , 0 , 3)
			end
			sleep(30)
			
			if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 0 then
				break
			elseif ReadRoleValue( Owner , EM_RoleValue_Register2 ) == i then
			--	CancelBuff( Owner , 622965 ) 
			--	ScriptMessage( Player , Player , 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
				ScriptMessage( Player , Player , 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
				WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
				CancelBuff( Owner , 622965)  --刪除織布機的運作BUFF
				CancelBuff ( Player , 622971)
				CancelBuff( Owner , 622966)
				break
			end
		end
		sleep(TR)
	end

	for i = 1, 7 do	--接續7題將隨機出題
		local Mes1 = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --字串
		local ColorBuff1 = { 622962 , 622963, 622964 } -- 魔法陣提示
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			local QR = rand(100)+1 -- 分為正常、訊息錯誤、色彩錯誤
			local TR = (rand(3)+3)*10  --每次出題的間隔時間
			local R = rand(3)+1	 --隨機出題
			if QR <=20 then--正常題
			--	ScriptMessage(Player , Player, 0 , Mes1[R] , 0) 
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --檢查織布機身上的答案		 
				Sleep(50) --8秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~=0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				sleep(30)	

				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player , 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
	      		  	end
					sleep(TR)
		
			elseif QR <= 60 then --訊息異常
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES04]" , 0) --警告！織布機的 訊息 告知出現錯誤！
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES04]" , 0) --警告！織布機的 訊息 告知出現錯誤！
				table.remove(Mes1 , R)
				local QMes = Rand(2)+1
				AddBuff( Owner , 622966 , 0 , 9)
				Sleep(10)
				ScriptMessage(Player , Player, 2 , Mes1[QMes] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --檢查織布機身上的答案		 
				Sleep(50) --8秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
	      		  	end
					sleep(TR)

	
			else --色彩提示異常
				ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES05]" , 0) --警告！織布機的 色彩 告知出現錯誤！
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES05]" ,  0) --警告！織布機的 色彩 告知出現錯誤！
				table.remove(ColorBuff1 , R)
				local QBuff = Rand(2)+1
				AddBuff( Owner , 622966 , 0 , 9)
				Sleep(10)
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[QBuff] , 0 , 8 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --檢查織布機身上的答案		 
				Sleep(50) --8秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
					CancelBuff( Owner , 622965 )  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
	      		  	end
					sleep(TR)
			end
		else
			CancelBuff( Owner , 622966)
			break
		end
	end
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES07]" , 0) --注意！織布機目前處於過熱的狀態！
			ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_MES07]" , 0) --注意！織布機目前處於過熱的狀態！	
			AddBuff( Owner , 622966 , 0 , -1)
			Sleep(30)
		end

	for i = 1, 10 do	--接續10題將隨機出題
		local Mes1 = { "[SC_2012LOOM_01] ", "[SC_2012LOOM_02]", "[SC_2012LOOM_03]" }  --字串
		local ColorBuff1 = { 622962 , 622963, 622964 } -- 魔法陣提示
		if ReadRoleValue( Owner , EM_RoleValue_Register1 ) == 1 then
			local QR = rand(100)+1 -- 分為正常、訊息錯誤、色彩錯誤
			local TR = (rand(3)+3)*10  --每次出題的間隔時間
			local R = rand(3)+1	 --隨機出題
			if QR <=40 then--訊息與顏色皆錯
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES06]" ,  0) --警告！織布機 訊息 與 色彩 告知都出現錯誤！
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES06]" , 0) --警告！織布機 訊息 與 色彩 告知都出現錯誤！
				local A = {}
				local ERROR = {}
				local R2 = Rand(2)+1
				local Quest = { 1, 2, 3}
				table.insert (ERROR , Mes1[R])
				table.remove(Quest , R )
				table.remove(Mes1 , R)
				table.remove(ColorBuff1, R)

				table.insert( ERROR, ColorBuff1[R2] )
				table.remove(Quest , R2 )
				table.remove(Mes1, R2)
				table.remove(ColorBuff1, R2)

				ScriptMessage(Player , Player, 2 , ERROR[1] , 0) 
				AddBuff( Owner , ERROR[2] , 0 , 6 )
				WriteRoleValue ( Owner , EM_RoleValue_Register2 , Quest[1])  --檢查織布機身上的答案		 
				Sleep(30) --秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == Quest[1] then
					CancelBuff( Owner , 622965 )  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
				end
				sleep(TR)
 		
			elseif QR <= 70 then --訊息異常
				ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_MES04]" ,  0) --警告！織布機的 訊息 告知出現錯誤！
				ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_MES04]" ,  0) --警告！織布機的 訊息 告知出現錯誤！
				table.remove(Mes1 , R)
				local QMes = Rand(2)+1
				ScriptMessage(Player , Player, 2 , Mes1[QMes] , 0) 
				AddBuff( Owner , ColorBuff1[R] , 0 , 6 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --檢查織布機身上的答案		 
				Sleep(30) --6秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					CancelBuff( Owner ,622965)  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971 )
					CancelBuff( Owner , 622966)
					break
				end
				sleep(TR)

			else --色彩提示異常
				ScriptMessage(Player , Player, 0 , "[SC_2012LOOM_MES05]" ,  0) --警告！織布機的 色彩 告知出現錯誤！
				ScriptMessage(Player , Player, 1 , "[SC_2012LOOM_MES05]" , 0) --警告！織布機的 色彩 告知出現錯誤！
				table.remove(ColorBuff1 , R)
				local QBuff = Rand(2)+1
				ScriptMessage(Player , Player, 2 , Mes1[R] , 0) 
				AddBuff( Owner , ColorBuff1[QBuff] , 0 , 6 )
				WriteRoleValue (Owner , EM_RoleValue_Register2 , R)  --檢查織布機身上的答案		 
				Sleep(30) --6秒之內要回答問題
				if  ReadRoleValue( Owner , EM_RoleValue_Register2 ) ~= 0 then
					AddBuff( Owner , 623054 , 0 , 3)
				end
				Sleep(30)
				if ReadRoleValue(Owner , EM_RoleValue_Register2 ) == R then
				--	CancelBuff( Owner , 622965 ) 
					CancelBuff( Owner , 622965 )  --刪除織布機的運作BUFF
					CancelBuff ( Player , 622971)
					CancelBuff( Owner , 622966)
				--	ScriptMessage( Player , Player, 0 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					ScriptMessage( Player , Player, 1 , "[SC_2012LOOM_ANS03]" , 0) --無法及時給予輔助物品，布料織壞了。
					WriteRoleValue( Owner , EM_RoleValue_Register1 , 0) 
					break
				end
				sleep(TR)
			end
		else
			CancelBuff(Owner , 622966)
			break
		end
	end	
	CancelBuff( Owner , 622965) --織布機停止
	CancelBuff( Owner , 622966) --織布機冒煙特效
	CancelBuff( Player , 622971) --玩家結算分數
end