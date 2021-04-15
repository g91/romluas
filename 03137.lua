--德國五周年，寶箱搶翻天

--活動npc 123583 可可潔妮
function Lua_na_5years_NPC(Zone)
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	local Count = CountBodyItem( Owner , 243208)
	if Zone == 2 then --在凡瑞娜絲城
		AdjustFaceDir( Target , Owner , 0 ) --面向
		if CheckFlag( Owner , 545464) == true then --如果玩家當日已經完成過活動
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK01]" )  --我可以理解開寶箱的樂趣，不過一天還是只能玩一次喔！
		else
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK02]" ) --活動簡介
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT1]" , "Lua_na_5years_Trans" , 0 )	
		end
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT5]" , "Lua_5years_CollectWord" , 0 ) --集字兌換
	elseif Zone == 357 then--在秘境花園 z357
		AdjustFaceDir( Target , Owner , 0 ) --面向
		if CheckBuff( Owner , 625474) == true then
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK05]" )	--怎麼還在磨蹭呢！動作不快點的話，寶箱就要消失了！
		elseif CheckFlag( Owner , 545464) == true then
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK10]" )  --開到什麼好東西了嗎？
		else
			SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK03]" )	--說明
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT2]" , "Lua_na_5years_rule" , 0 ) -- 關於寶箱內的東西...
			AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT4]" , "Lua_na_5years_ready" , 0 ) --我準備好了
		end
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT3]" , "Lua_na_5years_TransBack" , 0 ) --	我要離開
	end
	if Count ~= 0 then
		AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT8]" , "Lua_na_5years_wool" , 0 ) --	交出金羊毛	
	end
end


--寶箱說明
function Lua_na_5years_rule()
	local Owner = OwnerID()
	SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK04]" )
	AddSpeakOption( Owner , Owner , "[SC_5YEARS_OPT4]" , "Lua_na_5years_ready" , 0 ) --	準備好了
	AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_5years_NPC(357)", 0 ) --回到上一頁
end


--傳送至活動區域
function Lua_na_5years_Trans()
	local Owner = OwnerID()
	ChangeZone( Owner, 357, -1 , -125 , 5 , -388 , 254)
end


--傳送至Z2
function Lua_na_5years_TransBack() 
	local Owner = OwnerID()
	ChangeZone( Owner, 2, 0 , 3431 , 44 , 210 , 103)
end


 --金羊毛兌換青蛙憑證
function Lua_na_5years_wool() 
	local Owner = OwnerID()
	local Count = CountBodyItem( Owner , 243208)
	SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK07]")
	DelBodyItem( Owner , 243208 , Count)
	GiveBodyItem( Owner , 209561 , Count)
end


--集字兌換
function Lua_5years_CollectWord()
	local Owner = OwnerID()
	local Word = {	243209, 243210, 243211, 
			243212, 243213, 243214	}
	local MissWord = {	}
	
	for i = 1 , #Word do
		if CountBodyItem( Owner , Word[i] ) < 1 then
			table.insert( MissWord , Word[i] )
		end
	end

	if #MissWord == 0 then
		SetSpeakDetail( Owner , "[SC_5YEARS_SPEAK08]" )
		for i = 1 , #Word do
			DelBodyItem( Owner, Word[i] , 1 )
		end
		GiveBodyItem( Owner , 203178 , 1 )

	elseif #MissWord == 6 then
		SetSpeakDetail( Owner ,  "[SC_5YEARS_SPEAK06]" )
	else
		DeBugMsg( 0, 0 , "MissWord = "..#MissWord)	--確認不足的數量
		WordMsg = "[SC_5YEARS_SPEAK09]"
		for j = 1 , #MissWord do
			if j == #MissWord then
				WordMsg = WordMsg.."["..MissWord[j].."]</CS>".."[SC_STARPET_NO13_MISS01][$SETVAR1="..#MissWord.."]" --，共[$VAR1]個，請加把勁，努力收集吧！
			else
				WordMsg = WordMsg.."["..MissWord[j].."]</CS>".."[SC_SEPARATEMARK]<CS>"
			end
		end
		SetSpeakDetail( Owner , WordMsg )
		AddSpeakOption( Owner , Owner, "[SO_BACK]", "Lua_na_5years_NPC", 0 ) --回到上一頁
	end
end


--活動開始
function Lua_na_5years_ready() 
	local Owner = OwnerID() --玩家
	local Target = TargetID() --NPC
	local Obj = SearchRangeNPC( Target , 100)
	CloseSpeak( Owner)
	DesignLog( Owner , 123562 , "5thYear event start!" )	-- 活動開始
	for i = 0 , #Obj do 
		if ReadRoleValue( Obj[i] , EM_RoleValue_OrgID ) == 123565 then
			WriteRoleValue( Obj[i] , EM_RoleValue_PID , 1 ) --將隱藏物件的PID寫為1，活動開始
			break
		end
	end
	Sleep(10)
	AddBuff( Owner , 625474 , 0 , -1)
	ClockOpen( Owner , EM_ClockCheckValue_32  , 61 , 61 , 0  ,"Lua_Clockending"  , "Lua_Clockending" );--時間以秒算
end


--活動隱藏物件
function Lua_na_5years_HideObj() --活動物件的初始劇情，於區域形成後產生，先跑迴圈檢查活動是否開啟，活動啟動後檢查60秒後刪除場上所有相關物件
	local Owner = OwnerID() --隱藏物件
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x, y, z, dir=DW_Location( Owner)
	local T = 0
	WriteRoleValue( Owner, EM_RoleValue_PID , 0 )
	while true do --隱藏物件產生，檢查活動是否開始，0尚未開始，1為開始
		local PID = ReadRoleValue( Owner , EM_RoleValue_PID)
		if PID  == 1 then
			Lua_na_chest_create() --產生寶箱
			break
		end
		sleep(10)
	end

	while T <= 60 do 	--活動開始倒數計時60秒
		if T == 60 then
			 Lua_na_5years_DELObj()
			BeginPlot( Owner , "Lua_na_5years_HideObj2" , 50 )
			Break
		else
			T = T +1
		end
		sleep(10)
	end		
end


--隱藏物件重置
function Lua_na_5years_HideObj2()
	local Owner = OwnerID()
	Sleep(50)
	BeginPlot( Owner , "Lua_na_5years_HideObj" , 0 )
end


--產生110個寶箱
function Lua_na_chest_create() 
	local Owner = OwnerID()
	local array = 10  --10，矩陣為11*10
	local Matrix = LuaFunc_Matrix_Maker( 50 , array)
	local flag = { }
	local i = 1
	local SPChest = {}
	for j = 1 , array , 1 do  --寶箱產生 行 從1開始
		for k = -5, 5 , 1 do --列 中間為0，左為負，右為正
			flag[i] = LuaFunc_CreateNPCByMatrix(123536,Matrix, j , k )
			WriteRoleValue( flag[i] , EM_RoleValue_PID , 0) 
			i = i + 1
		end
	end
	--改變特定寶箱的變數，讓玩家點擊時，會有不同的結果 (金綿羊 / 精靈)
	for m = 1 , 8 do
		local R = DW_Rand(#flag)
		table.insert( SPChest , flag[R] )
		table.remove( flag , R )
	end
	
	for n = 1 , #SPChest do
		if n <= 3 then
			WriteRoleValue( SPChest[n] , EM_RoleValue_PID , 1 ) -- 金綿羊x3	
		else 
			WriteRoleValue( SPChest[n] , EM_RoleValue_PID , 2 ) --精靈x5			
		end
	end
end 


--寶箱劇情
function Lua_na_5years_Chest()
	SetPlot( OwnerID() , "touch" , "Lua_na_5years_ChestOpen", 30 )
end

--開啟寶箱
function Lua_na_5years_ChestOpen()
	local Owner = OwnerID()
	local Target = TargetID()
	BeginCastBarEvent( Owner, Target ,"[SC_5YEARS_OPT7]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_na_5years_ChestOpen_2" )
end


function Lua_na_5years_ChestOpen_2( Owner, CheckStatus )
	local Owner = OwnerID()  -- 玩家
	local Target= TargetID() --寶箱
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
	local x, y, z, dir=DW_Location( Target)
	local PID = ReadRoleValue( Target , EM_RoleValue_PID)
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			PlayMotionEX( Target, 145 , 146)
			if PID == 1 then --金綿羊
				Sheep = CreateObj( 108874 , x, y, z, dir , 1 )
				ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108874] ]" , 0 )
				AddToPartition( Sheep, Room)	
			elseif PID == 2 then -- 精靈
				local R = DW_Rand(10)
				if R > 5 then
					Fairy = CreateObj( 108887 , x, y, z, dir , 1 )	 --LUCKY
					ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108887] ]" , 0 )
				else
					Fairy = CreateObj( 108888, x, y, z, dir , 1 )	--LIGHT
					ScriptMessage( Owner, Owner , 2 , "[SC_5YEARS_MES01][$SETVAR1=[108888] ]" , 0 )
				end	
				SetModeEx(Fairy , EM_SetModeType_Searchenemy, false )--索敵
				SetModeEx(Fairy , EM_SetModeType_Strikback, false )--反擊
				SetModeEx(Fairy , EM_SetModeType_Fight , false )--可砍殺攻擊
				SetModeEx(Fairy , EM_SetModeType_Move , false) --移動
				AddToPartition( Fairy, Room)
			else
				if CheckBuff( Owner, 625476) == true then --幸運的鈴音 ，一定會開到寶物
					GiveBodyItem( Owner , 727021 , 1 )
				end
				GiveBodyItem( Owner , 727021 , 1 )
			end
		--	ScriptMessage(Owner, Owner , 0 ,"You Got it" , 0 )
			EndCastBar( Owner , CheckStatus ) --清除施法條
			Sleep(20)
			DelObj( Target)
		else --失敗
		--	ScriptMessage (Owner, Owner, 0 ,"Mission error" , 0 )		
			EndCastBar( Owner , CheckStatus ) --清除施法條
		end
	end
end
	

--特殊寶箱劇情
--金綿羊出現劇情 108874
function Lua_na_5years_sheep() 
	local Owner = OwnerID()
	local Time = 0
	SetModeEx(Owner  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx(Owner , EM_SetModeType_Strikback, false )--反擊
	addbuff( Owner , 625473 , 0 , -1)
	addbuff( Owner , 625472 , 0 , -1)
	WriteRoleValue( Owner , EM_RoleValue_IsWalk , 0 )
	while true do
		DW_MoveRand(Owner, 50 ) 
		sleep(10)
		Time = Time + 1
		if Time == 60  then
			break
		end
	end
	DelObj( Owner)
end


--妖精劇情
function Lua_na_5years_Fairy()
	local Owner = OwnerID()
	local OrgID = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	if OrgID == 108887 then
		SysCastSpellLv( Owner , Owner , 851672 , 0 )
	elseif OrgID == 108888 then
		SysCastSpellLv( Owner , Owner , 851671 , 0 )
	end
	Sleep(20)
	DelObj( Owner)	
end

--刪除場上所有相關物件
--function Lua_na_5years_DELObj() 
--	local Owner = OwnerID() --隱藏物件
--	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID)
--	local ObjID = {	123536 , 108887 , 108888	}  --需要被刪除寶箱等相關NPC ID 秘境寶箱/幸運精靈/羽翼精靈
--	local NPC = SearchRangeNPC(Owner , 1500)
----	Say( Owner ,"NPC =".. #NPC)
--	for i = 0 , #NPC do 		--刪除所有活動相關NPC
--		for j = 1 , #ObjID do
--			if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID) == ObjID[j] then
--				DelObj( NPC[i] )
--			end
--		end
--	end
--end




function Lua_na_5years_DELObj()  --刪除寶箱
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = 123536 

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
	--			for j = 1 , table.getn( NPC ) , 1 do
				--	if Name == NPC[j] then  --若為陣列中的值
					if Name == NPC then  --若為陣列中的值
						DelObj( ID)
					end
	--			end
			end
		end
		DeBugMsg( 0, RoomID ,"DEL")
	end
end

--活動BUFF結束，設定活動旗標
function Lua_na_5years_625474_Cls()
	SetFlag( OwnerID() , 545464 , 1 ) 
	return true
end


-- 商城點，慶典造型禮包 206848
function LuaI_206848( Option )
	local Owner = OwnerID()
	local PackageID = 206848		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then		
		local BorG = ReadRoleValue( Owner , EM_RoleValue_SEX  )  
		If BorG == 0 then
			GiveBodyItem( Owner , 725106 , 1 )	 --跑男生的
		elseif BorG == 1 then
			GiveBodyItem( Owner, 724948 , 1 )	 --跑女生的
		end
	end
end


-- 商城點，古老的翡翠寶箱 206824
function LuaI_206824( Option )
	local Owner = OwnerID()
	local PackageID = 206824		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then 
			return false
		elseif CountBodyItem( Owner , 243215) == 0 then --玩家需要擁有翡翠寶箱的鑰匙才能開啟寶箱
			ScriptMessage( Owner , Owner , 1 , "[SC_5YEARS_MES03]" , 0 )
			return false
		else
			return true
		end

	elseif ( Option == "USE" ) then		
		DelBodyItem( Owner , 243215 , 1 )
		GiveBodyItem( Owner , 727022 , 1 )
	end
end


-- 商城點，閃爍光芒的古代寶箱 243216
function LuaI_243216( Option )
	local Owner = OwnerID()
	local PackageID = 243216		
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( Owner , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then 
			return false
		elseif CountBodyItem( Owner , 203178) == 0 then  --玩家身上需要有 古老的鑰匙 才能開啟寶箱
			ScriptMessage( Owner , Owner , 1 , "[SC_DAN_111700_30]" , 0 )
			return false
		else	
			return true
		end

	elseif ( Option == "USE" ) then		
		DelBodyItem( Owner , 203178 , 1 )
		GiveBodyItem( Owner , 727023 , 1 )
	end
end


--小凱蒙，每日可領取一次243215 金鑰匙，對話劇情
function Lua_na_5years_123584()
	local Owner = OwnerID()
	local Target = TargetID()
	AdjustFaceDir( Target , Owner , 0 ) --面向
	if CheckFlag( Owner , 547538 ) == true then  --已經領取過鑰匙了
		SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK12]" )
	else
		SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK11]" )	
		AddSpeakOption( Owner , Owner ,"[SC_5YEARS_OPT9]" , "Lua_na_5years_Key", 0 )	
	end
end


function Lua_na_5years_Key()
	local Owner = OwnerID()
	SetSpeakDetail( Owner, "[SC_5YEARS_SPEAK12]" )
	GiveBodyItem( Owner , 243215 , 1 )
	GiveBodyItem( Owner , 203178 , 1 )
	SetFlag( Owner , 547538 , 1)
end

--五周年登入禮包
Function LuaI_242211() --五週年慶禮包
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242211]][$SETVAR3=[202936]]" 

	local itemset  = {	1 , Prize1Str 	, { 202936 , 1 }	
				, 1 ,""	, { 202936 , 1 }			--永久黃色蘑菇人坐騎*1 	202936		
				, 201 ,""	, { 202934 , 1 }			--30天黃色蘑菇人坐騎*1 202934	
				, 500 ,""	, { 202434 , 1 } 	   		--每日任務重置券*3 202434
				, 1050 ,""	, { 202434 , 3 } 	   	--每日任務重置券*1 202434
				, 1600 ,""	, { 201141 , 1 }		--菲尼克斯的救贖*1 201141
				, 2600 ,""	, { 242723 , 3 }		--進階星屑武器石*3 242723
				, 3600 ,""	, { 242724 , 3 }		--進階星屑裝備石*3 242724
				, 4600 ,""	, { 242725 , 3 }		--進階星屑首飾石*3 242725
				, 6400 ,""	, { 202435 , 5 }		--家的羈絆*5 202435
				, 8200 ,""	, { 202902 , 5 }		--空間紀錄墨水*5 202902
				, 10000 ,""	, { 202903 , 5 }	}	--傳送者符文*5 202903

	return BaseTressureProc4(   itemset , 1  )

end

--測試廣播訊息用
function LuaI_242211_Cast()
	local RoleName = GetName( OwnerID() )
	local Prize1Str  = "[ITEMSHOP_RUNMESSAGE_GETITEM][$SETVAR1="..RoleName .."][$SETVAR2=[242211]][$SETVAR3=[202936]]" 
	RunningMsgEx( OwnerID() , 2 , 2 , Prize1Str )
end