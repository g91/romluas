---------------------------------------------------------------------------
--動作集
-----------------------------------------------------------------------------
function LuaP_117280_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)  ----工作中
	sleep(30)
	NPCSAY(OwnerID(),"[SC_117280_02]") ----這個加這個……那個加那個……
	sleep(30)
	NPCSAY(OwnerID(),"[SC_117280_01]")   ----可惡！又失敗了！
	sleep(30)	
end

-----------------------------------------------------------------------------
function LuaP_117281_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)    ----搖頭
	Sleep(40)
end

-----------------------------------------------------------------------------
function LuaP_117278_01()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)    ----蹲下
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_LOOP)    
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)    
	Sleep(40)
end

-----------------------------------------------------------------------------
function LuaP_117374_01()
	AdjustFaceDir( TargetID(),OwnerID(), 0 )    ----面向	
end

function LuaP_117396_01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	Sleep(25)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE4)
	Sleep(25)
end

-----------------------------------------------------------------------------
function LuaPG_SIT_CHAIR()   ----坐椅子＋站起
	while 1 do
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_CHAIR_BEGIN)
	sleep(50)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SIT_CHAIR_END )
	sleep(50)
	end	
end

-----------------------------------------------------------------------------
function LuaPG_STRETCH()   ----伸伸懶腰
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	sleep(30)
end

-----------------------------------------------------------------------------
function LuaPG_FEAR()   ----表現出恐懼感
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_CRY)
	sleep(30)
end

-----------------------------------------------------------------------------
function LuaPG_applause()   ----拍手
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_applause)
end

-----------------------------------------------------------------------------
function LuaPG_angry()    ----生氣，或者不耐煩
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
end

-----------------------------------------------------------------------------
function LuaPG_GUICKKILL()
	local Owner=OwnerID()
	local Target=TargetID()
	
	if Target~=nil then
		if   ReadRoleValue(Target,EM_RoleValue_OrgID)==102548 then
			KillID(Owner,Target)
		end
	end
end

-----------------------------------------------------------------------------
function LuaPG_GUICKKILL_01(wanttokill)
	local Owner=OwnerID()
	local wanttokill=TargetID()
	
	if wanttokill~=nil then
		if   ReadRoleValue(Target,EM_RoleValue_OrgID)==wanttokill then
			Sleep(5)
			KillID(Owner,wanttokill)
		end
	end
end

-----------------------------------------------------------------------------
function LuaPG_SURRENDER()    
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
end

-----------------------------------------------------------------------------

function LuaPG_STRANGE_VILLAGER_01()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)
	Sleep(20)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(20)
	NPCSAY(OwnerID(),"[SC_STRANGE_VILLAGER_01]")
end

-----------------------------------------------------------------------------
function LuaPG_LAUGH()  ----笑
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_LAUGH)
end

-----------------------------------------------------------------------------
function Lua_practice() ----練刀
	CastSpell(OwnerID(),OwnerID(),497558)
end

-----------------------------------------------------------------------------
function Lua_PG_Gather()	----一直工作
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_GATHER_BEGIN)
----	FA_FindError()
end
-----------------------------------------------------------------------------
function Lua_PG_Gun_Channel()	----槍弩預備動作
	local Obj = OwnerID()
	SetDefIdleMotion(Obj,ruFUSION_MIME_ATTACK_GUN_BEGIN)
end


-----------------------------------------------------------------------------
function Lua_PG_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 6
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(118593,Matrix,2,-1 )
--	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 1 )
--	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(117820,Matrix,2, 0 )
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
	BeginPlot( OwnerID() , "Lua_PG_matrix" , 0 )
end

function Lua_PG_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_PG_matrix" , 0 )
end

------------------------------------------------------
function Lua_PG_BOYS()
	NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_01]")   
	Sleep(20)
end

function Lua_PG_BOYS_01()
	NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_03]")   
	Sleep(20)
end

function Lua_PG_BOYS_02()
	SetModeEx( OwnerID() , EM_SetModeType_HideName , true )		-- 名稱
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( OwnerID() , EM_SetModeType_Mark , false )		-- 不可標記

	while true do
		Sleep(30)
		NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_02]")   
		Sleep(130)
		NPCSAY(OwnerID(),"[SC_FIREFOOT_BOYS_04]")   		
	end
end

------------------------------------------------------
function Lua_PG_Pit()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_2H)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Find_Book()
	NPCSAY(OwnerID(),"[SC_FIND_BOOK]")
	Sleep(20)
	NPCSAY(OwnerID(),"[SC_FIND_BOOK_02]")
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Drink_and_Dance()	--喝酒狂歡姿勢
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_08]")
	Sleep(10)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_09]")
end

------------------------------------------------------
function Lua_PG_Point()		--指向前方
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	Sleep(30)
end

------------------------------------------------------
function Lua_PG_Think()		--思考
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	Sleep(30)
end
------------------------------------------------------
function Lua_PG_Ask()			--火靴矮人交換紅木組
	NPCSAY(OwnerID(),"[SC_ASK_01]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(30)
end

function Lua_PG_Ask_01()		--火靴矮人交換紅木組
	NPCSAY(OwnerID(),"[SC_ASK_02]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Yell()		--BUFF
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(10)
end
------------------------------------------------------
function Lua_PG_Government()		--火靴官員的對話
	NPCSAY(OwnerID(),"[SC_GOVERNMENT]")
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(10)
end

function Lua_PG_Government_01()	--火靴官員的對話
	NPCSAY(OwnerID(),"[SC_GOVERNMENT_02]")
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_SPEAK)
	Sleep(10)
end

------------------------------------------------------
function Lua_PG_Buff()			--矮人工作感
	PlayMotionEX(OwnerID(),ruFUSION_MIME_BUFF_INSTANT,ruFUSION_MIME_BUFF_INSTANT)
	Sleep(10)
end


-----------------------------------------------------------------------------
function Lua_PG_forest_leader()

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2,-1 )
	SetModeEx( ObjMatrix[1], EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2, 1 )
	SetModeEx( ObjMatrix[2], EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(105842,Matrix,2, 0 )
	SetModeEx( ObjMatrix[3], EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_PG_forest_leader" , 0 )
end


-----------------------------------------------------------------------------
function Lua_PG_dodge()		
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
	sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
end

-----------------------------------------------------------------------------
function Lua_PG_NPC_01()		--煉金材料商人
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_01]")
end

function Lua_PG_NPC_02()		--地上小店
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_02]")
	Sleep(50)
end

function Lua_PG_NPC_03()		--談論針法
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_03]")
	Sleep(30)
end

function Lua_PG_NPC_04()		--談論針法
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_04]")
	Sleep(30)
end


function Lua_PG_NPC_05()		--談話的矮人兵
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_06]")
	Sleep(50)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_07]")
end

function Lua_PG_NPC_06()		--談話的矮人兵
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_05]")
	Sleep(30)
end

function Lua_PG_NPC_07()		--找貨物的矮人
	Sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_10]")
	Sleep(30)
end

function Lua_PG_NPC_08()		--選武器的矮人
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_11]")
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_emote_point)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_12]")
	Sleep(30)
end

function Lua_PG_NPC_09()		--討價還價的商人
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_13]")
	Sleep(30)
end

function Lua_PG_NPC_10()		--討價還價的商人
	Sleep(30)
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_14]")
end

function Lua_PG_NPC_11()		--上油的機師
	PlayMotion( OwnerID(), ruFUSION_MIME_BUFF_INSTANT)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_15]")
	Sleep(30)
end

function Lua_PG_Yell_02()			--鼓舞士氣的矮人
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	NPCSAY(OwnerID(),"[SC_Z20_FIREFOOT_NPC_16]")	
	Sleep(10)
end