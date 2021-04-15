un_changeskillcon1 = {}
un_foodlistcount1 = {}
un_zone19skilltime1 = {}
function un_zone19_boss5_01()--FOR 湯***********************************	
	SetPlot( OwnerID(),"touch","un_zone19_boss5_1",30 )--觸碰劇情
	AddBuff( OwnerID(), 508370, 0, -1 ) --物品發光
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_3_01()--FOR 酒******************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_4",30 )--觸碰劇情
	AddBuff( OwnerID(), 508370, 0, -1 ) --物品發光
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_5_01()--FOR蠟燭***************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_6",30 )--觸碰劇情
	AddBuff( OwnerID(), 508370, 0, -1 ) --物品發光
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end


function un_zone19_boss5_8_01() --FOR肉************************
	SetPlot( OwnerID(),"touch","un_zone19_boss5_9",30 )--觸碰劇情
	AddBuff( OwnerID(), 508370, 0, -1 ) --物品發光
	callplot(OwnerID(),"un_zone19_boss5_15_01",0)
	WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
end

function un_zone19_boss5_15_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	while 1 do
	sleep(10)
		if un_foodlistcount1[RoomID][1]==1 then
		Delobj(OwnerID())
		end
	end	
end
function un_zone19_boss5_13_01()----*****掛在控制器上面讓食物產生
	local FlagObjID = 780793  --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local Obj = {117195,117196,117197,117198}--種植物件編號
	local ObjNum = math.floor( FlagNum  )   --種植物件數量
	local resetTime = 50 --重製時間(秒) 
	local Range = 5	--物件產生在旗幟的範圍
	local Gravity = true --有無重力
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end
--控制器Ctrl的reg1 = 判斷階段
--控制器Ctrl的reg2 = 觸發戰鬥的小球
--觸發戰鬥的小球littlemonster 的 reg1 = 控制器
--小怪的reg1 = 控制器
--小怪的reg2 = 觸發戰鬥的小球

function un_zone19_boss5_allconreal_1_01() 						   ----總中控(控制BOSS+演戲+轉階段)                                  
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --讀取出現在的RoomID，並宣告成RoomID
	local Ctrl = OwnerID()       							   --宣告Ctrl = OwnerID() ， 避免重複呼叫
	un_zone19skilltime1[RoomID] = {}
	un_zone19skilltime1[RoomID][1] = 25
	un_foodlistcount1[RoomID] = {}
	un_foodlistcount1[RoomID][1] = 0
	un_changeskillcon1[RoomID] = {}
	un_changeskillcon1[RoomID][1] = 0
	--un_zone19skilltime1[RoomID] = 25  --小怪階段時間
	--un_foodlistcount1[RoomID] = 0
	--un_changeskillcon1[RoomID] = 0  
	--判斷階段 0 = 待機  ， 1 = 小怪階段 ， 2 = BOSS階段(無任務) ， 3 = BOSS階段(任務) ，4 = 重置階段
	local skilltalk = {"[SC_105099_01]","[SC_105099_02]","[SC_105099_04]"}    --BOSS對話
	WriteRoleValue(Ctrl,EM_RoleValue_register3,0)
	local littlemonster          							   --觸發戰鬥的小球
	littlemonster = CreateObjByFlag( 105104, 780838 , 0 , 1 )  --依據旗標生出觸發戰鬥的小球
	SetModeEx(littlemonster,EM_SetModeType_Fight, false)       --宣告littlemonster1不能被攻擊/true = 能被攻擊
	SetModeEx(littlemonster,EM_SetModeType_Mark,false)                  ----標記
	SetModeEx(littlemonster,EM_SetModeType_Strikback,false)             ---反擊
	SetModeEx(littlemonster,EM_SetModeType_Move,false)                  ---移動	
	SetModeEx(littlemonster,EM_SetModeType_SearchenemyIgnore,false)     ---物件不會被搜尋
	SetModeEx(littlemonster,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
	SetModeEx(littlemonster,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
	SetModeEx(littlemonster,EM_SetModeType_Searchenemy,false)           ---鎖敵
	SetModeEx(littlemonster,EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	SetModeEx(littlemonster,EM_SetModeType_show,false)                  --秀出
	Beginplot(littlemonster,"un_zone19_boss5_fight_01",0)         --讓littlemonster1執行範圍劇情的Script
	WriteRoleValue(littlemonster,EM_RoleValue_register1,Ctrl)  --將Ctrl寫入littlemonster1的EM_RoleValue_register1
	WriteRoleValue(Ctrl,EM_RoleValue_register2,littlemonster)  --將littlemonster1寫入Ctrl的EM_RoleValue_register2
	AddToPartition(littlemonster,RoomID)                       --顯現出littlemonster1
	local x1 = ReadRoleValue (littlemonster, EM_RoleValue_X)   --記錄littlemonster的X
	local y1 = ReadRoleValue (littlemonster, EM_RoleValue_Y)   --記錄littlemonster的y
	local z1 = ReadRoleValue (littlemonster, EM_RoleValue_Z)   --記錄littlemonster的z
	local monster = {105101,105102,105103}					   --要出的小怪的table
	local monster1                                             --宣告成要創的小怪
	local monster2                                             --宣告成要創的小怪
	local food                                            --記錄有沒有要出食物的變數      
	local foodCtrl	                                           --宣告成要產出食物的中控
	
	local Boss                                                 --Boss
	Boss = CreateObjByFlag( 105351, 780838 , 1 , 1 )           --依據旗標生出Boss
	WriteRoleValue(Boss,EM_RoleValue_register1,Ctrl)           --將Ctrl寫入Boss的EM_RoleValue_register1
	SetModeEx(Boss,EM_SetModeType_Strikback,false) 		   ---反擊
	SetModeEx(Boss,EM_SetModeType_Fight,false)    		   ---可砍殺
	SetModeEx(Boss,EM_SetModeType_Searchenemy,false)	   ---鎖敵
	AddToPartition(Boss,RoomID)                     		   --顯現Boss
	Setplot(Boss,"dead","un_zone190_boss5Die_01",0) 
	local box
	box = CreateObjByFlag( 102679, 780838 , 1 , 1 )           --依據旗標生出box
	SetModeEx(box,EM_SetModeType_Fight, false)       --宣告littlemonster1不能被攻擊/true = 能被攻擊
	SetModeEx(box,EM_SetModeType_Mark,false)                  ----標記
	SetModeEx(box,EM_SetModeType_Strikback,false)             ---反擊
	SetModeEx(box,EM_SetModeType_Move,false)                  ---移動	
	SetModeEx(box,EM_SetModeType_SearchenemyIgnore,false)     ---物件不會被搜尋
	SetModeEx(box,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
	SetModeEx(box,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
	SetModeEx(box,EM_SetModeType_Searchenemy,false)           ---鎖敵
	SetModeEx(box,EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
	SetModeEx(box,EM_SetModeType_Obstruct,true)               ---阻擋
	SetModeEx(box,EM_SetModeType_show,false)                  --秀出
	AddToPartition(box,RoomID) 
	local door = 0

	
	while true do                                              --持續執行while迴圈
	--say(Ctrl,"skillcount = "..un_changeskillcon1[RoomID][1])
		sleep(10)                                              --讓while迴圈每停一秒後才開始執行
		if un_changeskillcon1[RoomID][1] == 1 then                            --小怪階段*********************************
			un_zone19skilltime1[RoomID][1]=un_zone19skilltime1[RoomID][1]+1                              --計數用
			food = ReadRoleValue(Ctrl,EM_RoleValue_register3)
			if food == 0 then
			un_foodlistcount1[RoomID][1]  = 0
				ScriptMessage( Boss, -1 , 2 , skilltalk[1] , 2 )    --Boss開戰對話
				foodCtrl = CreateObjByFlag( 105104, 780838 , 2 , 1 )--產出食物控制器
				SetModeEx(foodCtrl,EM_SetModeType_Mark,false)       ----標記
				SetModeEx(foodCtrl,EM_SetModeType_Strikback,false)  ---反擊
				SetModeEx(foodCtrl,EM_SetModeType_Move,false)       ---移動	
				SetModeEx(foodCtrl,EM_SetModeType_Fight,false)      ---可砍殺
				SetModeEx(foodCtrl,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
				SetModeEx(foodCtrl,EM_SetModeType_HideName,false)   ---物件頭上是否顯示名稱
				SetModeEx(foodCtrl,EM_SetModeType_HideMinimap,false)---物件是否在小地圖上顯示
				SetModeEx(foodCtrl,EM_SetModeType_Searchenemy,false)---鎖敵
				SetModeEx(foodCtrl,EM_SetModeType_Show,false)       ---顯示  
				AddToPartition(foodCtrl,RoomID )
				Beginplot(foodCtrl,"un_zone19_boss5_13_01",0)
				door = CreateObjByFlag( 104538, 780838 , 6 , 1 )           --依據旗標生出door
				SetModeEx(door,EM_SetModeType_Fight, false)       --宣告littlemonster1不能被攻擊/true = 能被攻擊
				SetModeEx(door,EM_SetModeType_Mark,false)                  ----標記
				SetModeEx(door,EM_SetModeType_Strikback,false)             ---反擊
				SetModeEx(door,EM_SetModeType_Move,false)                  ---移動	
				SetModeEx(door,EM_SetModeType_SearchenemyIgnore,false)     ---物件不會被搜尋
				SetModeEx(door,EM_SetModeType_HideName,false)              ---物件頭上是否顯示名稱
				SetModeEx(door,EM_SetModeType_HideMinimap,false)           ---物件是否在小地圖上顯示
				SetModeEx(door,EM_SetModeType_Searchenemy,false)           ---鎖敵
				SetModeEx(door,EM_SetModeType_NotShowHPMP,false)           ---不顯示血條
				SetModeEx(door,EM_SetModeType_Obstruct,true)               ---阻擋
				SetModeEx(door,EM_SetModeType_show,true)
				Beginplot(door,"un_zone190_doordel_1",0)
				AddToPartition(door,RoomID) 
				WriteRoleValue(Ctrl,EM_RoleValue_register3,1)              --宣告城1代表出過食物階段了
			end
			if un_zone19skilltime1[RoomID][1]%30==0 and un_zone19skilltime1[RoomID][1]<270 then          --每30秒執行一次
				for i = 1 , table.getn(monster) do             --出怪的數量 = for迴圈執行次數， table.getn()取得陣列數量
					local rand = Az_RND_Ary(-100,100,2)        --由 -100 ~ 100 隨機取 2 個數
					monster1 = CreateObj ( monster[i] , x1+rand[1] , y1 , z1+rand[2] , 0 , 1)
					monster2 = CreateObj ( monster[i] , x1+rand[2] , y1 , z1+rand[1] , 0 , 1)
					--以上是CreateObj物件再做標 x , y , z 上，+ rand[1][2] 是變成隨機點

					WriteRoleValue(monster1,EM_RoleValue_register1,Ctrl)  --給創出的怪的Reg1寫入控制器
					WriteRoleValue(monster2,EM_RoleValue_register1,Ctrl)  --給創出的怪的Reg1寫入控制器
					WriteRoleValue(monster1,EM_RoleValue_register2,littlemonster)  --給創出的怪的Reg2寫入觸發戰鬥球
					WriteRoleValue(monster2,EM_RoleValue_register2,littlemonster)  --給創出的怪的Reg2寫入觸發戰鬥球
					WriteRoleValue(monster1,EM_RoleValue_register3,door)  --給創出的怪的Reg2寫入觸發戰鬥球
					WriteRoleValue(monster2,EM_RoleValue_register3,door)  --給創出的怪的Reg2寫入觸發戰鬥球
					WriteRoleValue(monster1,EM_RoleValue_register4,foodCtrl)  --給創出的怪的Reg2寫入觸發戰鬥球
					WriteRoleValue(monster2,EM_RoleValue_register4,foodCtrl)  --給創出的怪的Reg2寫入觸發戰鬥球
					AddToPartition(monster1,RoomID)          			  --顯現出創造物
					AddToPartition(monster2,RoomID)          			  --顯現出創造物
					Beginplot(monster1,"un_zone19_monster_01",0)
					Beginplot(monster2,"un_zone19_monster_01",0)
					
				end
			end
			if un_zone19skilltime1[RoomID][1] == 250 then  
				ScriptMessage( Boss, -1 , 2 , "[SC_105099_09]" , 2 )
			end
			if un_zone19skilltime1[RoomID][1] >= 270 then                           --400秒以後結束出怪階段(判斷玩家有無任務需要進入的階段)
				un_zone19skilltime1[RoomID][1] = 25                                  --先階段歸0，避免再出怪
				Delobj(foodCtrl)                               --刪除食物中控器避免再出食物
				un_foodlistcount1[RoomID][1]  = 1
				WriteRoleValue(Ctrl,EM_RoleValue_register3,0)  --產出食物變術再宣告回0，讓重置時能再出食物
				un_changeskillcon1[RoomID][1] = 2                             --接著改成正常BOSS戰階段
				local player = SetSearchAllPlayer(RoomID)      --讀取此層zone所有玩家數量
				local playername                               --先宣告要取出掃zone後的玩家
				for i = 1 , player do                          --幾個玩家執行幾次for迴圈，判斷所有玩家
					playername = GetSearchResult()             --取出掃zone後取得的玩家GID
					if CheckAcceptQuest( playername, 423755 ) == true and   --判斷玩家是否有此任務
					CheckCompleteQuest( playername, 423755 ) ~= true and    --擠查玩家是否完成任務
					CheckFlag( playername, 544639 ) ~= true then            --判斷玩家是否有完成此任務的旗標
						un_changeskillcon1[RoomID][1] = 3                                   --只要有玩家有任務就跳到任務階段
					end
				end
			end
		elseif un_changeskillcon1[RoomID][1] == 2 then                        --Boss階段*********************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[2] , 2 )   --Boss開戰對話
			sleep(10)
			
			Beginplot(Boss,"un_zone19_Boss5AI_01_01",0)           --直接塞Script給Boss執行
			un_changeskillcon1[RoomID][1] = 6                                 --再把模式切換到待機，避免重複執行Script
			--Setplot(Boss,"dead","un_zone190_boss5Die_012_01",0)    --丟死亡劇情給BOSS
			
		elseif un_changeskillcon1[RoomID][1] == 3 then                        --Boss階段(演戲)***************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[2] , 2 )
			Addbuff(Boss,502707,0,-1)                          --給Boss不能回血的BUFF
			Beginplot(Boss,"un_zone19_Boss5AI_02_01",0)           --直接塞Script給Boss執行
			un_changeskillcon1[RoomID][1] = 6                                 --再把模式切換到待機，避免重複執行Script
			--Setplot(Boss,"dead","un_zone190_boss5Die_01",0)       --丟死亡劇情給BOSS
			
		elseif un_changeskillcon1[RoomID][1] == 4 then                        --重置階段*********************************
			ScriptMessage( Ctrl, -1 , 2 , skilltalk[3] , 2 )
			Delobj(Boss)                                        --刪除BOSS
			delobj(door)
			un_changeskillcon1[RoomID][1] = 0                                 --再將階段寫回0，避免重生
			Boss = CreateObjByFlag( 105351, 780838 , 1 , 1 )   --依據旗標生出Boss
			WriteRoleValue(Boss,EM_RoleValue_register1,Ctrl)   --將Ctrl寫入Boss的EM_RoleValue_register1
			SetModeEx(Boss,EM_SetModeType_Strikback,false)     ---反擊
			SetModeEx(Boss,EM_SetModeType_Fight,false)    	   ---可砍殺
			SetModeEx(Boss,EM_SetModeType_Searchenemy,false)   ---鎖敵 
			AddToPartition(Boss,RoomID)                        --顯現Boss
			Beginplot(littlemonster,"un_zone19_boss5_fight_01",0) --讓範圍觸發戰鬥劇情重新Beginplot
			Setplot(Boss,"dead","un_zone190_boss5Die_01",0) 
			local searnpc = {}
			searnpc = SearchRangeNPC ( OwnerID() , 500 )
			for i=0 , table.getn(searnpc) do
				if ReadRoleValue(searnpc[i],EM_RoleValue_OrgID) ==105106 then
					delobj(searnpc[i])
				end
			end
			local searplayer = {}
			searplayer = SearchRangeplayer ( OwnerID() , 500 )
			--say(OWnerID(),table.getn(searplayer))
			for i= 0, table.getn(searplayer) do
				if CheckBuff( searplayer[i] , 508391) == true then
					CancelBuff(searplayer[i], 508391 ) 
				end
			end
		elseif un_changeskillcon1[RoomID][1] == 5 then
			local searnpc = {}
			searnpc = SearchRangeNPC ( OwnerID() , 500 )
			for i=0 , table.getn(searnpc) do
				if ReadRoleValue(searnpc[i],EM_RoleValue_OrgID) ==105106 then
					delobj(searnpc[i])
				end
			end
			local searplayer = {}
			searplayer = SearchRangeplayer ( OwnerID() , 500 )
			for i= 0, table.getn(searplayer) do
				if CheckBuff( searplayer[i] , 508391) == true then
					CancelBuff(searplayer[i], 508391 ) 
				end
			end			
		delobj(box)
		delobj(door)
		delobj(littlemonster)
		delobj(OwnerID())
		end
	end
end

function un_zone19_boss5_fight_01()                     		   --小怪中控器script(範圍觸發)
	local fight = OwnerID()                                    --宣告fight = OwnerID()避免重複宣告
	WriteRoleValue(fight,EM_RoleValue_register1,0) 
	local skill = ReadRoleValue(fight,EM_RoleValue_register1)  --判斷避免重複觸發0 = 觸發 ， 1 = 不觸發

	--if ReadRoleValue(TargetID(),EM_RoleValue_VOC)==0 then
	--else
		if skill == 0 then
			SetPlot( fight,"range","un_zone19_boss5_fight_01_2_01",100 ) --範圍100內觸發script
		end
	--end	
end


function un_zone19_boss5_fight_01_2_01()                     	  	        --小怪中控器script
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local tar  =  TargetID()                                      --宣告tar = 控制器(此時控制器是TargetID,觸發的人是OwnerID())
	SetPlot( tar,"range","",100 )                                     --重新宣告個空的範圍劇情避免重複觸發
	--say(OwnerID(),"1")
	--say(TargetID(),"2")
	if ReadRoleValue(OwnerID(),EM_RoleValue_VOC)==0 or ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==1 then
		--SetPlot( tar,"range","un_zone19_boss5_fight_01_2_01",100 )
		Beginplot(tar,"un_zone19_boss5_fight_01",0)
	else	
		un_changeskillcon1[RoomID][1] = 1   	--將控制器的Reg1寫成1代表模式1小怪模式
	end
end

function un_zone19_Boss5AI_01_01()                                --BossAI_Script正常階段******
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --讀取出現在的RoomID，並宣告成RoomID 
	local Boss = OwnerID()                                     --宣告Boss=OwnerID()避免重複宣告造成效能消耗
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_register1)    --讀取Boss的reg1為控制器的GID，並宣告成Ctrl
	local skilltime = 0                                        --宣告主要時間 skilltime = 0 
	local player = {}                                          --宣告一個player給仇恨列表用
	local rand                                                 --宣告一個rend來做仇恨列表的隨機
	local Targ                                                 --宣告一個targ當作BOSS當前目標
	local Play_Chose = {}                                      --宣告一個陣列來放打亂的陣列
	local skill = 0                                            --宣告skill為判斷是否在戰鬥的值
	local ball                                                 --宣告一個ball存放7秒丟玩家BUFF的判斷球
	local retime = 0
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---反擊
	SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---可砍殺
	SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	   ---鎖敵
	while 1 do
		sleep(10)
		skilltime = skilltime + 1 
		if hatelistcount(Boss) ==0 and skill==0 then
			retime = retime+1 
			if retime == 5 then
				un_changeskillcon1[RoomID][1] = 4  
			end
		end
		if hatelistcount(Boss)~=0 then                             --Boss仇恨列表有人=進入戰鬥
			if skill == 0 then                                     --如果Boss進入戰鬥就將skill=1代表進入戰鬥
				skill = 1
			end
			if skilltime%7 == 0 then
				--say(Boss,"time = "..7)
				Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS的當錢目標
                 --給隨機一人buff
				CastSpelllv( OwnerID(), Targ,497495 ,0 )           --對當前目標放毒爪
				sleep(20)                                          --停留2秒避免動作沒放完卡招
			end
			if skilltime%10 == 0 then
			sleep(10)
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
				end			
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				if table.getn(player)>0 then
					rand = DW_rand(table.getn(player))                 --rand一個數字，看player陣列是多少數量
					while ReadRoleValue( player[rand] , EM_RoleValue_IsPlayer) == 0 do
						rand = DW_rand(table.getn(player))
					end
					local x= ReadRoleValue ( player[rand], EM_RoleValue_X)--宣告一個X儲存被丟BUFF玩家的X 
					local y= ReadRoleValue ( player[rand], EM_RoleValue_y)--宣告一個y儲存被丟BUFF玩家的y
					local z= ReadRoleValue ( player[rand], EM_RoleValue_z)--宣告一個z儲存被丟BUFF玩家的z 
					ball=CreateObj ( 105105 , x , y , z , 0 , 1)          --參照zyz生出一個紀錄時間的控制器
					SetModeEx(ball,EM_SetModeType_Mark, false)
					SetModeEx(ball,EM_SetModeType_HideName, false)
					SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(ball,EM_SetModeType_Strikback, false)
					SetModeEx(ball,EM_SetModeType_Move, false)
					SetModeEx(ball,EM_SetModeType_Fight, false)
					SetModeEx(ball,EM_SetModeType_Searchenemy, false)
					AddToPartition(ball,roomID )
					WriteRoleValue(ball,EM_RoleValue_register1,player[rand])--將被丟BUFF的人紀錄再ball的reg1
					Beginplot(ball,"un_zone19_bossball",0)                  --ball執行5秒計時判斷玩家buff是否有解除

					Addbuff(player[rand],508386,0,6)  
					local PlayerName=GetName(player[rand])
					local MsgStr="[SC_105099_08][$SETVAR1="..PlayerName.."]"
					ScriptMessage( Boss, -1 , 2 ,MsgStr, 2 )
				end	
			end
			if skilltime%15 == 0 then
			sleep(10)
				--say(Boss,"time = "..15)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_07]", 2 )
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				Play_Chose =KS_RegroupArray( player, num )         --打亂陣列列表
				CastSpelllv( OwnerID(), OwnerID(),496761 ,0 )      --做一個表演法術
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
				end
				if table.getn(Play_Chose)<4 then                   --判斷如果BOSS仇恨列表<6人
					for i=1 , table.getn(Play_Chose) do            --對仇恨列表內所有人放招
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--系統放傷害招
					end
				end
				if table.getn(Play_Chose)>=4 then                   --判斷如果BOSS仇恨列表>4人
					for i=1 , 4 do                                  --對仇恨列表內4人放招
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--系統放傷害招
					end
				end
				sleep(30)
			end
			
			if skilltime%40 == 0 then
				--say(Boss,"time = "..40)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_05]", 2 )
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				if table.getn(player)>0 then
					Play_Chose =KS_RegroupArray( player, num )         --打亂陣列列表
					local tabskill = {}
					for i=1 , table.getn(Play_Chose) do
						if ReadRoleValue(  Play_Chose[i] , EM_RoleValue_IsPlayer) == 1 then
							table.insert(tabskill,Play_Chose[i])
						end
					end
					if table.getn(tabskill)<2 then                   --判斷如果BOSS仇恨列表<3人
						for i=1 , table.getn(tabskill) do            --對仇恨列表內所有人放招
							Addbuff(tabskill[i],508389,0,-1)                 --給BUFF
						end
					end	
					if table.getn(tabskill)>=2 then                   --判斷如果BOSS仇恨列表>3人
						for i=1 , 2 do                                  --對仇恨列表內3人放招
							Addbuff(tabskill[i],508389,0,-1)                 --給BUFF
						end
					end
					sleep(10)
				end	
			end
			if skilltime>=200 then
				addbuff(OwnerID(),507744,0,-1)
			end
		elseif 	hatelistcount(Boss)==0 and skill ==1 then           --Boss仇恨表沒人+曾經戰鬥過 =重置階段
			un_changeskillcon1[RoomID][1] = 4                                      --將控制器階段寫到重置4
		end
	end
end


function un_zone19_Boss5AI_02_01()                                   --BossAI_Script演戲階段******
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)  --讀取出現在的RoomID，並宣告成RoomID 
	local Boss = OwnerID()                                     --宣告Boss=OwnerID()避免重複宣告造成效能消耗
	local Ctrl = ReadRoleValue(Boss,EM_RoleValue_register1)    --讀取Boss的reg1為控制器的GID，並宣告成Ctrl
	local skilltime = 0                                        --宣告主要時間 skilltime = 0 
	local player = {}                                          --宣告一個player給仇恨列表用
	local rand                                                 --宣告一個rend來做仇恨列表的隨機
	local Targ                                                 --宣告一個targ當作BOSS當前目標
	local Play_Chose = {}                                      --宣告一個陣列來放打亂的陣列
	local skill = 0                                            --宣告skill為判斷是否在戰鬥的值
	local ball                                                 --宣告一個ball存放7秒丟玩家BUFF的判斷球
	local mpcskill = 0                                         --演戲階段
	local maxhp = ReadRoleValue(Boss,EM_RoleValue_MaxHP)       --記錄Boss最大HP血量
	local NowHp                                                --目前Boss血量
	local Hp                                                   --目前BossHP%數

	sleep(10)
	ScriptMessage( Boss, -1 , 2 ,"[SC_105099_03]" , 2 )        --boss對話"看來我們除了新朋友以外，還有熟面孔阿。"
	sleep(10)
	local ika = CreateObjByFlag( 105070, 780838 , 3 , 1 )      --依據旗標生出艾可
	local show = CreateObjByFlag( 105069, 780838 , 4 , 1 )     --依據旗標生出夜梟
	local body = CreateObjByFlag( 117158, 780838 , 5 , 1 )     --依據旗標生出屍體
	Addbuff(Boss,502707,0,-1)
	Addbuff(ika,502707,0,-1)
	Addbuff(body,502707,0,-1)
	PlayMotionEX(body, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)--裝死用
	WriteRoleValue(ika,EM_RoleValue_register1,body)            --把老爸寫給她女兒
	WriteRoleValue(boss,EM_RoleValue_register3,ika)            --把女兒寫給BOSS
	WriteRoleValue(boss,EM_RoleValue_register4,show)           --把黑鳥寫給BOSS
	WriteRoleValue(ika,EM_RoleValue_register5,show)            --把黑鳥寫給女兒
	WriteRoleValue(ika,EM_RoleValue_register9,boss)            --把boss寫給女兒
	SetModeEx(ika,EM_SetModeType_Fight,false)      ---可砍殺
	SetModeEx(show,EM_SetModeType_Fight,false)      ---可砍殺
	SetModeEx(ika,EM_SetModeType_Move,false)       ---移動
	SetModeEx(show,EM_SetModeType_Move,false)       ---移動
	WriteRoleValue(ika,EM_RoleValue_register6,0)            
	--Npcsay(Boss,"[SC_423755_1]")         --boss對話"小麻雀...終究還是回到我的身邊？快過來和你的父親團聚啊！"
	Yell( Boss ,"[SC_423755_1]" , 2 )
	Addbuff(body,508299,0,-1)                                  --給屍體BUFF
	AddToPartition(ika,roomID )
	AddToPartition(show,roomID )
	AddToPartition(body,roomID )
	SetModeEx(body,EM_SetModeType_Mark,false)       ----標記
	SetModeEx(body,EM_SetModeType_Strikback,false)  ---反擊
	SetModeEx(body,EM_SetModeType_Move,false)       ---移動	
	SetModeEx(body,EM_SetModeType_Fight,false)      ---可砍殺
	SetModeEx(body,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(body,EM_SetModeType_HideName,false)   ---物件頭上是否顯示名稱
	SetModeEx(body,EM_SetModeType_HideMinimap,false)---物件是否在小地圖上顯示
	SetModeEx(body,EM_SetModeType_Searchenemy,false)---鎖敵
	SetModeEx(body,EM_SetModeType_Show,true)       ---顯示  
	sleep(50)
	--Npcsay(ika,"[SC_423755_2]")                            --艾可yell：住口！我不允許你再污衊我的父親！
	Yell( ika ,"[SC_423755_2]" , 2 )
	sleep(30)
	--Npcsay(show,"[SC_423755_3]")                           --夜梟yell：[116585]，別生氣！讓我們一起復仇吧！
	Yell( show ,"[SC_423755_3]" , 2 )
	sleep(30)
	--Npcsay(boss,"[SC_423755_4]")                           --拉法挨爾yell：哈～如果辦得到的話就試試看吧！
	Yell( boss ,"[SC_423755_4]" , 2 )
	sleep(30)
	
	SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---反擊
	SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---可砍殺
	SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	       ---鎖敵
	local retime = 0
	while 1 do
		sleep(10)
		skilltime = skilltime + 1 
		if hatelistcount(Boss) ==0 and skill==0 then
			retime = retime+1 
			if retime == 5 then
			delobj(body)
			Delobj(ika)
			Delobj(show)
			sleep(20)
			un_changeskillcon1[RoomID][1]= 4  
			end
		end
		if hatelistcount(Boss)~=0 then                             --Boss仇恨列表有人=進入戰鬥
			if skill == 0 then                                     --如果Boss進入戰鬥就將skill=1代表進入戰鬥
				skill = 1
				SetModeEx(ika,EM_SetModeType_Move,true)       ---移動
				SetModeEx(show,EM_SetModeType_Move,true)       ---移動
			end	
			NowHp = ReadRoleValue(OwnerID(),EM_RoleValue_HP)       --讀取當前血量
			Hp = (NowHp / maxhp) *100                              --算出當前血量比
			if Hp<=70 and mpcskill==0 then                         --血量低於70%，且階段再0的時候
				sleep(20)
				--Npcsay(boss,"[SC_423755_5]")                           --拉法埃爾yell：怎麼！小麻雀，想復仇就只有這點力量嗎？
				Yell( boss ,"[SC_423755_5]" , 2 )
				sleep(30)
				--Npcsay(boss,"[SC_423755_6]")                           --拉法埃爾yell：看來你身邊的雜魚，也不過就如此嘛！
				Yell( boss ,"[SC_423755_6]" , 2 )
				sleep(30)
				--Npcsay(ika,"[SC_423755_7]")                            --艾可yell：我必定會拿回父親的軀體，不再受你侮辱！
				Yell( ika ,"[SC_423755_7]" , 2 )
				sleep(30)
				--Npcsay(boss,"[SC_423755_8]")                           --拉法埃爾yell：是嗎？我懷念起你小時候的模樣了！總是紅著眼睛怯懦的看著我！
				Yell( boss ,"[SC_423755_8]" , 2 )
				sleep(30)
				--Npcsay(show,"[SC_423755_9]")                           --夜梟yell：你得意不會太久的，我們會合力打敗你！殺掉你的主子！為我們過去復仇！
				Yell( show ,"[SC_423755_9]" , 2 )
				sleep(30)
	
				mpcskill = 1                                       --改變階段避免重複觸發
			end
			if Hp<=40 and mpcskill==1 then                         --血量低於70%，且階段再0的時候

				sleep(20)
				--Npcsay(show,"[SC_423755_10]")                        --夜梟yell：總算到這個時候了！[116585]，快將你父親的遺體！帶走！殺掉你的主子！為我們過去復仇！
				Yell( show ,"[SC_423755_10]" , 2 )
				sleep(30)
				SetModeEx(Boss,EM_SetModeType_Strikback,false) 		   ---反擊
				SetModeEx(Boss,EM_SetModeType_Fight,false)    		   ---可砍殺
				SetModeEx(Boss,EM_SetModeType_Searchenemy,false)	   ---鎖敵 
				sleep(20)
				SetStopAttack(ika)
				Beginplot(ika,"un_zone19_ika_01",0)
				SetModeEx(Boss,EM_SetModeType_Strikback,true) 		   ---反擊
				SetModeEx(Boss,EM_SetModeType_Fight,true)    		   ---可砍殺
				SetModeEx(Boss,EM_SetModeType_Searchenemy,true)	       ---鎖敵
				                 --給ika執行走到旁邊撿老爹屍體的Script
				sleep(30)
				
				mpcskill = 2									   --改變階段避免重複觸發
			end
			if skilltime%7 == 0 then
				--say(Boss,"time = "..7)
				Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS的當錢目標
				CastSpelllv( OwnerID(), Targ,497495 ,0 )           --對當前目標放毒爪
				sleep(20)                                          --停留2秒避免動作沒放完卡招
			end
			if skilltime%10 == 0 then
			sleep(10)
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
				end			
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				rand = DW_rand(table.getn(player))                 --rand一個數字，看player陣列是多少數量
				while ReadRoleValue( player[rand] , EM_RoleValue_IsPlayer) == 0 do
					rand = DW_rand(table.getn(player))
				end
				local x= ReadRoleValue ( player[rand], EM_RoleValue_X)--宣告一個X儲存被丟BUFF玩家的X 
				local y= ReadRoleValue ( player[rand], EM_RoleValue_y)--宣告一個y儲存被丟BUFF玩家的y
				local z= ReadRoleValue ( player[rand], EM_RoleValue_z)--宣告一個z儲存被丟BUFF玩家的z 
				ball=CreateObj ( 105105 , x , y , z , 0 , 1)          --參照zyz生出一個紀錄時間的控制器
				SetModeEx(ball,EM_SetModeType_Mark, false)
				SetModeEx(ball,EM_SetModeType_HideName, false)
				SetModeEx(ball,EM_SetModeType_NotShowHPMP, false)
				SetModeEx(ball,EM_SetModeType_Strikback, false)
				SetModeEx(ball,EM_SetModeType_Move, false)
				SetModeEx(ball,EM_SetModeType_Fight, false)
				SetModeEx(ball,EM_SetModeType_Searchenemy, false)
				AddToPartition(ball,roomID )
				WriteRoleValue(ball,EM_RoleValue_register1,player[rand])--將被丟BUFF的人紀錄再ball的reg1
				Beginplot(ball,"un_zone19_bossball",0)                  --ball執行5秒計時判斷玩家buff是否有解除

				Addbuff(player[rand],508386,0,6)  
				local PlayerName=GetName(player[rand])
				local MsgStr="[SC_105099_08][$SETVAR1="..PlayerName.."]"
				ScriptMessage( Boss, -1 , 2 ,MsgStr, 2 )
			end
			if skilltime%15 == 0 then
			sleep(10)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_07]", 2 )
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				Play_Chose =KS_RegroupArray( player, num )         --打亂陣列列表
				CastSpelllv( OwnerID(), OwnerID(),496761 ,0 )      --做一個表演法術
				while ReadRoleValue(OWnerID(),EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
					sleep(2)
				end
				if table.getn(Play_Chose)<4 then                   --判斷如果BOSS仇恨列表<6人
					for i=1 , table.getn(Play_Chose) do            --對仇恨列表內所有人放招
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--系統放傷害招
					end
				end
				if table.getn(Play_Chose)>=4 then                   --判斷如果BOSS仇恨列表>6人
					for i=1 , 4 do                                  --對仇恨列表內6人放招
						sysCastSpelllv(OwnerID(),Play_Chose[i],497510,0)--系統放傷害招
					end
				end
				sleep(30)
			end
			
			if skilltime%40 == 0 then
			sleep(10)
				ScriptMessage( Boss, -1 , 2 ,"[SC_105099_05]", 2 )
				player = DW_HateRemain(0)                          --player = 取得仇恨列表，為一個陣列
				Play_Chose =KS_RegroupArray( player, num )         --打亂陣列列表
				local tabskill = {}
				for i=1 , table.getn(Play_Chose) do
					if ReadRoleValue(  Play_Chose[i] , EM_RoleValue_IsPlayer) == 1 then
						table.insert(tabskill,Play_Chose[i])
					end
				end
				if table.getn(tabskill)<2 then                   --判斷如果BOSS仇恨列表<3人
					for i=1 , table.getn(tabskill) do            --對仇恨列表內所有人放招
						Addbuff(tabskill[i],508389,0,-1)                 --給BUFF
					end
				end	
				if table.getn(tabskill)>=2 then                   --判斷如果BOSS仇恨列表>3人
					for i=1 , 2 do                                  --對仇恨列表內3人放招
						Addbuff(tabskill[i],508389,0,-1)                 --給BUFF
					end
				end
				sleep(10)
			end	
			if skilltime>=200 then
				addbuff(OwnerID(),507744,0,-1)
			end
		elseif 	hatelistcount(Boss)==0 and skill ==1 then           --Boss仇恨表沒人+曾經戰鬥過 =重置階段
			delobj(body)
			Delobj(ika)
			Delobj(show)
			sleep(20)
			un_changeskillcon1[RoomID][1]= 4                                      --將控制器階段寫到重置4
		end
	end                             
end

function un_zone19_monster_01()                                      --小怪離開戰鬥判斷重置階段******
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	local skilltime =0                                            --宣告小怪未進入戰鬥的秒數
	local skilltime2 = 0
	local own = OwnerID()                                         --宣告own= OwnerID()，避免重複宣告
	local Ctrl = ReadRoleValue(own,EM_RoleValue_register1)        --從小怪的reg1讀取出中控器，並宣告成Ctrl
	local Ctrlball = ReadRoleValue(own,EM_RoleValue_register2)    --從小怪的reg1讀取出觸發戰鬥小球，並宣告成Ctrlball
	local player = {}
	local door = ReadRoleValue(own,EM_RoleValue_register3)
	local food = ReadRoleValue(own,EM_RoleValue_register4)
	local rand 
	local rand2
	while 1 do                                                    --每秒執行while迴圈
		sleep(10)
		if hatelistcount(own)==0 then                             --判斷小怪本身有無進入戰鬥，==0則仇恨表無人
			skilltime = skilltime+1    
			if skilltime %3==0 then                                 --沒進入戰鬥以後3秒找可以打的玩家打
				local plplayer = {} 
				local plplayer2 = {}
				plplayer = SearchRangeplayer ( own, 500 )
				for i= 0 , table.getn(plplayer) do
					if ReadRoleValue(TargetID(),EM_RoleValue_VOC)~=0 and 
					ReadRoleValue(TargetID(),EM_RoleValue_IsDead)~=1 and 
					ReadRoleValue(TargetID(),EM_SetModeType_Fight) ~=true and
					ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer) ==1 then
					
					table.insert(plplayer2,plplayer[i])
					end
				end
				rand = DW_rand(table.getn(plplayer2))
				if table.getn(plplayer2)~= 0 then
					SetAttack( own, plplayer2[rand] )
				end
			end
			if skilltime ==15 then                                 --未進入戰鬥持續10秒
				if checkID(door) == true then
					Delobj(door)
				end
				if checkID(food) == true then
					un_foodlistcount1[RoomID][1]  = 1
					Delobj(food)
				end
				
				un_changeskillcon1[RoomID][1] = 0                                --將階段寫回0，階段0 = 待機
				WriteRoleValue(Ctrl,EM_RoleValue_register3,0)
				SetPlot( Ctrlball,"range","un_zone19_boss5_fight_01_2_01",100 )--將觸發戰鬥的球重新寫回未觸發
				un_zone19skilltime1[RoomID][1] = 25
				Delobj(own)                                       --刪除小怪本身
			end
		elseif hatelistcount(own)~=0 then
			skilltime = 0
			skilltime2 = skilltime2 + 1
			if skilltime2%10 ==0 then
				player = SearchRangeplayer ( own, 500 )    --從仇恨列表中隨機選一人
				rand2 = DW_rand(table.getn(player))
				SysCastSpellLv(player[rand2], OwnerID(),497013,0)		  --讓被選重的人嘲諷小怪10秒	
			end
		end
	end
end

function un_zone19_ika_01()                        --演戲撿東西
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	SetModeEx(OwnerID(),EM_SetModeType_Strikback,false) ---反擊	
	SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,false)
	--MoveToFlagEnabled(OwnerID(), false)
	local mob9898 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	local boss = ReadRoleValue(OwnerID(),EM_RoleValue_Register9)
	local father = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	local final
	local bird = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)
	while true do
		final = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)
		--say(OwnerID(),"final = "..final)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			--MoveToFlagEnabled(OwnerID(), false)
			if final == 0 then
				if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
					if mob9898==0 then
					--MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780838 ,5,20)
					WriteRoleValue(OwnerID(),EM_RoleValue_Register4,mob9898+1)
					PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
					sleep(10)
					delobj(father)
					--Npcsay(OwnerID(),"[SC_423755_11]") 
					Yell( OwnerID() ,"[SC_423755_11]" , 2 )
					sleep(20)
					PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_END)
					sleep(10)
						SetModeEx(OwnerID(),EM_SetModeType_Strikback,true) ---反擊	
						SetModeEx(OwnerID(),EM_SetModeType_Searchenemy,true)
						SetAttack(OWnerID(),boss)
					end
				end
			end
			if final==1 then
				--Npcsay(OwnerID(),"[SC_423755_12]") 
				Yell( OwnerID() ,"[SC_423755_12]" , 2 )
				sleep(30)
				--Npcsay(bird,"[SC_423755_13]") 
				Yell( bird ,"[SC_423755_13]" , 2 )
				sleep(30)
				--Npcsay(OwnerID(),"[SC_423755_14]")
				Yell( OwnerID() ,"[SC_423755_14]" , 2 )				
				sleep(30)
				--Npcsay(OwnerID(),"[SC_423755_15]") 
				Yell( OwnerID() ,"[SC_423755_15]" , 2 )
				sleep(30)
				--Npcsay(bird,"[SC_423755_16]") 
				Yell( bird ,"[SC_423755_16]" , 2 )
				sleep(30)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register6,2)
			end
			if final==2 then
				MoveToFlagEnabled(OwnerID(), false)
				MoveToFlagEnabled(bird, false)
				WriteRoleValue(OwnerID(),EM_RoleValue_IsWalk,0)
				WriteRoleValue(bird,EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Hide(bird)
				Show(OwnerID(),RoomID)
				Show(bird,RoomID)
				DW_MoveToFlag(bird , 780838 ,3,0)
				DW_MoveToFlag( OwnerID() , 780838 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register6,3)
				delobj(bird)
				delobj(OwnerID())
			end
		sleep(10)
	end
end

function un_zone190_boss5Die_01()
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local ika = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
	local bird = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	WriteRoleValue(ika,EM_RoleValue_Register6,1)
	--WriteRoleValue(bird,EM_RoleValue_Register3,1)
	local player = SetSearchAllPlayer(RoomID)      --讀取此層zone所有玩家數量
	local playername                               --先宣告要取出掃zone後的玩家
	for i = 1 , player do                          --幾個玩家執行幾次for迴圈，判斷所有玩家
		playername = GetSearchResult()             --取出掃zone後取得的玩家GID
		if CheckAcceptQuest( playername, 423755 ) == true and   --判斷玩家是否有此任務
		CheckCompleteQuest( playername, 423755 ) ~= true and    --擠查玩家是否完成任務
		CheckFlag( playername, 544639 ) ~= true then            --判斷玩家是否有完成此任務的旗標
			SetFlag(playername,544639,1)                        --讓玩家完成任務
		end
	end
	un_changeskillcon1[RoomID][1] = 5
	ScriptMessage( OwnerID(), -1 , 2 ,"[SC_105099_06]" , 2 )
end
function un_zone190_boss5Die_012_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_changeskillcon1[RoomID][1] = 5
	ScriptMessage( OwnerID(), -1 , 2 , "[SC_105099_06]"  , 2 )
end

function un_zone19_boss5use_3_01()  --直接出任務BOSS
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_changeskillcon1[RoomID][1] = 3
end

function un_zone19_boss5use_1_01()  --結束出小怪階段
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	un_zone19skilltime1[RoomID][1]= 268
end
function un_zone19_hit1_01()                        --Boss丟毒水的判斷1
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local x1=ReadRoleValue ( TargetID(), EM_RoleValue_X)
	local y1=ReadRoleValue ( TargetID(), EM_RoleValue_y)
	local z1=ReadRoleValue ( TargetID(), EM_RoleValue_z)
	local ball =CreateObj ( 105106 , x1 , y1 ,z1 , 0 , 1)
	SetModeEx(ball,EM_SetModeType_Mark,false) ----標記
	SetModeEx(ball,EM_SetModeType_Strikback,false) ---反擊
	SetModeEx(ball,EM_SetModeType_Move,false) ---移動	
	SetModeEx(ball,EM_SetModeType_Fight,false) ---可砍殺
	SetModeEx(ball,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
	SetModeEx(ball,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
	SetModeEx(ball,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
	SetModeEx(ball,EM_SetModeType_Searchenemy,false)  ---鎖敵
	WriteRoleValue(ball,EM_RoleValue_Livetime,16)
	AddToPartition(ball,RoomID )
	beginplot(ball,"un_zone19_hit2_01",0)
end

function un_zone19_hit2_01()                        --Boss丟毒水的判斷2
	AddBuff( OwnerID() ,506823 ,0 ,-1 )
	while true do
	sleep(10)
		sysCastSpellLv(OwnerID(),OwnerID(),497496,0)
	end	
end
function un_zone190_doordel_1()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	while 1 do
		sleep(50)
		if un_changeskillcon1[RoomID][1] == 0 or un_changeskillcon1[RoomID][1] == 4 or un_changeskillcon1[RoomID][1] == 5 then
			delobj(OwnerID())	
		end
	end
end