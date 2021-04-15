function dr_range424063_01() 								 --掛在物品的法術(物品使用以後觸發法術，所以掛在法術集合理面的"基本法術")
											 --基本法術的種類用"執行劇情"
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)					   
	local own = OwnerID()								 --先宣告own = OwnerID()避免重複宣告造成系統負擔			 		   
	local searchrange = SearchRangeNPC ( own , 100 )                       				 --創出一個table裝掃範圍的npc
	local monsterid
	DW_CancelTypeBuff(68,own)
	if CheckAcceptQuest( own, 424063 ) == true and   						--判斷玩家是否有此任務
		CheckCompleteQuest( own, 424063 ) ~= true  then  				--檢查玩家是否完成任務
		for i= 0 , table.getn(searchrange) , 1  do      					--table.getn(searchrange) = 看這table裡面有幾個數
		monsterid = ReadRoleValue(searchrange[i],EM_RoleValue_OrgID) 			--讀取出陣列裡面的npc的GID(資料庫內的物件號碼)
			if monsterid == 117790   then  		 			--XXXXX填入妳要判斷的物件號碼
				local car = LuaFunc_CreateObjByObj ( 105495 , own) 		--你要生出來的車，生再使用物品的人的座標
				SetModeEx(car,EM_SetModeType_AlignToSurface,false)  
				SetModeEx(car,EM_SetModeType_Mark,false)
				SetModeEx(car,EM_SetModeType_Strikback,false)      		--不反擊，被打不還手
				SetModeEx(car,EM_SetModeType_HideName,false)        		--物件頭上是否顯示名稱
				SetModeEx(car,EM_SetModeType_Searchenemy,false)   		--不鎖敵，不會去追怪
				SetModeEx(car,EM_SetModeType_Fight,true)			--可砍殺
				AddToPartition(car,RoomID)                        			--顯現出car再這個zone，配合LuaFunc_CreateObjByObj用
				WriteRoleValue(car,EM_RoleValue_register1,own)     		--把玩家寫入車的reg1(暫存值
				AttachObj( car , own, 0 ,"p_down","p_top" )
				CallPlot(car,"dr_laugh_01",own)                     			--給車script
			end
		end	
	end
end

function dr_laugh_01(own) --beginplot給肉
	local car = OwnerID()
	local ttable = {}  --裝searchnpc用
	local skilltime=0
	while 1 do
		sleep(10)
		skilltime=skilltime+1
		if skilltime%2==0 then                                           					--每1秒掃一次	(%=?)
			FA_GetHeight (car)							--自動抓高度，避免掉到地圖下面的洞
			ttable = SearchRangeNPC ( OwnerID() , 100 )             			--掃肉週圍100內所有的怪來打車
			for i= 0 , table.getn(ttable) do
				sysCastSpellLv (OwnerID() , ttable[i] ,498368, 0 )  		--嘲諷可以參考 496758 這本身就是嘲諷
				                                                        		   		--讓車對怪嘲諷，車陣營要怪會打的snpc之類的
				if  CheckAcceptQuest( own, 424063 ) ==false 
					or checkid(own)==0 
					or ReadRoleValue( own, EM_RoleValue_IsDead )== 1 then
					delobj(car)
				end	
			end
		end
	end
end


function dr_range424063_03() 								--setflag給重要物品
	local skilltime = 0       								--時間
	local skilltable = {}     								--掃周圍的npc
	local monsterid
	while 1 do
	sleep(10)
	skilltime=skilltime+1
		if skilltime%2 == 0 then   							--2秒掃一次
			--say(own,"7")
			skilltable = SearchRangeNPC ( OwnerID() , 100 )             			--掃週圍100內所有的車
			for i=0 , table.getn(skilltable) do
				monsterid = ReadRoleValue(skilltable[i],EM_RoleValue_OrgID)
				if monsterid == 105495   then 					 --XXXX=車
					local master = ReadRoleValue(skilltable[i],EM_RoleValue_register1)  --讀取車的主人
					SetFlag( master, 544892, 1 ) 				 --給車子主人XXXXXX的重要期標
					delobj(skilltable[i])
				end
			end	
		end	
	end
end

function Lua_drsayno()
	local Obj=OwnerID()
	say(obj,"f**k")
end


function LuaQ_drcheck_01()  --在布魯斯‧雷的旁邊才能使用
	local tableA={}
	local x = 0
	local own = OwnerID()
	tableA = SearchRangeNPC ( own , 50 )  --範圍
	-say(OwnerID(),"tableA = "..table.getn(tableA))
		for i=0, table.getn(tableA) do
			--say(OwnerID(),"tableA"..i+1 .."= "..ReadRoleValue( tableA[i] , EM_RoleValue_OrgID))
			if	ReadRoleValue( tableA[i] , EM_RoleValue_OrgID) == 117790  then --要判斷的NPC
				x=x+1
			--else
				--ScriptMessage( OwnerID(), 0 , 2 ,"[SC_104140_08]" , 2 )
			end
		end
		--say(OwnerID(),X)
		if x ~=0 then
			return true
		else
			ScriptMessage( own, own , 2 ,"[SC_424063_01]" , 2 ) --需要XXXXX
			return false
		end	
end	

function LuaQ_drCheck_02()	--在布魯斯‧雷的旁邊才能使用
	local tableX={}
	local obj = OwnerID()
	local Y=0
	tableX = SearchRangeNPC(obj,50)
	for i = 0,table.getn(tableX), 1 do
		if ReadRoleValue(tableX[i],EM_RoleValue_OrgID) == 117790 then
		Y = Y+1
		end
	end
	
	if Y~=0 then
		return true
	else 
		ScriptMessage( obj, obj, 2 ,"[SC_424063_01]" , 2 )
		return false
	end
end


function Lua_drwar_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2,-1 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end

function Lua_drwar_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end


------------------------------------------------------------------------------
function LuaQ_drCheckFlag_01()        --達奇尼斯任務對話
	LoadQuestOption( OwnerID() )
	local x = CheckAcceptQuest( OwnerID(),  424187 )
	local y = CheckFlag(OwnerID(), 544910)
	if x == true and y==true  then
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117817_02]", "LuaQ_drCheckFlag_02", 0 )
	else 
	LoadQuestOption( OwnerID() )
	end 
end 

function LuaQ_drCheckFlag_02()
	SetSpeakDetail( OwnerID(), "[SC_117817_03]" )
	GiveBodyItem( OwnerID(), 544906, 1 )
end
-------------------------------------------------------------------
function dr123(Angle)
	SetDir( OwnerID(), Angle ) 
end
-----------------------------------------------------------------
function LuaQ_drspell_01()
	local obj = ownerID()
	 CastSpell(obj,obj,497182)
end

----------------------------------------------------
function LuaS_dr117741_01()			--傑瑞米對話選項
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_01]", "LuaS_dr117741_02", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_03]", "LuaS_dr117741_03", 0 )
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_117741_05]", "LuaS_dr117741_04", 0 )
end 

function LuaS_dr117741_02()			--魔族
	SetSpeakDetail( OwnerID(), "[SC_117741_02]" )
end

function LuaS_dr117741_03()			--發展
	SetSpeakDetail( OwnerID(), "[SC_117741_04]" )
end

function LuaS_dr117741_04()			--集中
	SetSpeakDetail( OwnerID(), "[SC_117741_06]" )
end
--------------------------------------------------------------------------------
function  LuaQ_drborder117824_01()			--潔兒第一卷
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117824_01]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function  LuaQ_drborder117824_02()			--潔兒第二卷
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117824_02]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

function  LuaQ_drborder117824_03()			--潔兒第三卷
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_117824_03]")
	ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )	
end

--------------------------------------------------------------------------------
function LuaQ_424061_02()				--完成以牙還牙任務刪除眼球
	DelBodyItem(OwnerID(),209242,8)
end

function LuaQ_424044_02()				--惱人的蝙蝠任務刪除翅膀
	DelBodyItem(OwnerID(),209233,10)
end

function LuaQ_424045_02()				--擒賊先擒王任務刪除牙齒
	DelBodyItem(OwnerID(),209235,1)
end

function LuaQ_424059_02()				--限時快遞務刪除舌頭
	DelBodyItem(OwnerID(),209266,5)
end

function LuaQ_424062_02()				--銳利的眼光刪除礦石
	DelBodyItem(OwnerID(),209240,10)
end

function LuaQ_424050_02()				--整備醫療物資刪除草藥
	DelBodyItem(OwnerID(),209234,10)
end

function LuaQ_424194_02()				--淒涼的悲鳴刪除羽毛
	DelBodyItem(OwnerID(),209316,12)
end

function LuaQ_424195_02()				--借力使力刪除武器
	DelBodyItem(OwnerID(),209317,8)
	DelBodyItem(OwnerID(),209318,8)
end

function LuaQ_424185_02()				--生命之源刪除種子
	DelBodyItem(OwnerID(),209310,12)
	PlayMotion(targetID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
end

--------------------------------------------------------------------------------
function andrus_keyitem117722_01()			--菲尼斯解毒劑
	DelBodyItem( OwnerID(),544841, 1 ) 
end

function LuaQ_drkeyitem209245_01()			--給提爾海姆的文件
	DelBodyItem( OwnerID(),544878, 1 ) 
end

function LuaQ_drkeyitem209244_01()			--給莉莉安的文件
	DelBodyItem( OwnerID(),544871, 1 ) 
end

function LuaQ_drkeyitem209313_01()			--關鍵文件
	DelBodyItem( OwnerID(),544909, 1 ) 
end

function LuaQ_drkeyitem209315_01()			--賢者之眼的文件
	DelBodyItem( OwnerID(),544907, 1 ) 
end


function Lua_drwar_matrix01()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2,-1 )
	SetModeEx(ObjMatrix[1],EM_SetModeType_Mark,false)                ---物件頭上是否顯示名稱
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
	SetModeEx(ObjMatrix[2],EM_SetModeType_Mark,false)         
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
	SetModeEx(ObjMatrix[3],EM_SetModeType_Mark,false)         
--	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100054,Matrix,1, 0 )
--	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 1 )
--	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(110001,Matrix,2, 0 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end

function Lua_drwar_matrix_Reset01()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_drwar_matrix" , 0 )
end
