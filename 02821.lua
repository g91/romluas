--z25佈置=======================================
--=======================================
--蟲子藏起來
---------------------------------------------------------------------------
function LuaPG_Hiding_Bug()
	local Bug = OwnerID()
	local HateorNot
	local Fightornot
	PlayMotionEX( Bug, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	while 1 do		--迴圈，無戰鬥狀態就睡覺
		Sleep(60)
		HateorNot = HateListCount(Bug)
		Fightornot = ReadRoleValue( Bug, EM_RoleValue_AttackTargetID )
		if HateorNot~=0	then
			SetDefIdleMotion(Bug, ruFUSION_MIME_NONE)
			if Fightornot ~=0	then
				SetDefIdleMotion(Bug, ruFUSION_MIME_ATTACK_1H)
			end
		end
		if HateorNot==0	then
			--PlayMotionEX( Bug, ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
			SetDefIdleMotion(Bug, ruFUSION_MIME_IDLE_SLEEP)
		end
	end
end


function LuaPG_Gupu()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(50)
end

function LuaPG_Gupu_02()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_BUFF_SP02)
	Sleep(50)
end

function LuaPG_Cat()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_THINK)
	Sleep(50)
end

function LuaPG_KillTheButterfly()
	local Monster_Weak = TargetID()
	local OrgID = ReadRoleValue(Monster_Weak, EM_RoleValue_OrgID)
	if OrgID ~= 107474	then
		return false
	end
end

function LuaPG_FEAR_02()   ----表現出恐懼感
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_head_shake)
	sleep(30)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_CRY)
	sleep(30)
end

function LuaPG_KillTheButterfly_buff() --獲得此狀態的小動物會被場景中的肉食怪秒殺
	AddBuff ( OwnerID(),621301,0,-1)
end

function LuaPG_Dra()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_HURT_NORMAL)
	Sleep(30)
end

function LuaPG_CryingAllTheTime()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_CRY)
	Sleep(30)
end

function LuaPG_SLUMBER()
	SetDefIdleMotion(OwnerID(), ruFUSION_MIME_SLUMBER)
end

---------------------------------------------------------------------------
--潛行＆死亡會消失
---------------------------------------------------------------------------
function LuaS_PG_NowToHide()
	AddBuff( OwnerID() ,624171,1 ,-1)
end

---------------------------------------------------------------------------
--吉兒飛在空中
---------------------------------------------------------------------------
function LuaS_PG_Gill_Fly()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_JUMP_LOOP)
end

---------------------------------------------------------------------------
--龍獸
---------------------------------------------------------------------------
function LuaS_PG_Dra_01()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_MINING_LOOP)
	Sleep(10)
end

---------------------------------------------------------------------------
--烏龜
---------------------------------------------------------------------------
function LuaPG_Eat()
	PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(10)
end

---------------------------------------------------------------------------
--幽龍特效
---------------------------------------------------------------------------
function LuaPG_DarkDra_Buff()
	CastSpell(OwnerID(),OwnerID(),850755)
end

---------------------------------------------------------------------------
--咕卜多採集
---------------------------------------------------------------------------
function LuaPG_Gupu_Get_Mushroom()
	local NPC = OwnerID()
	local OrgID 
	local Plant = SearchRangeNPC(NPC, 50)
	local Ball
	local x,y,z,dir
	for i = 0,#Plant do
		OrgID = ReadRoleValue(Plant[i], EM_RoleValue_OrgID)
		--Say(NPC,"00")
		if OrgID == 122151 then
			x,y,z,dir = DW_Location(Plant[i])
			Ball = CreateObj(119875, x, y+5, z , dir, 1 )		--生成隱形球做特效用
			SetModeEx(Ball, EM_SetModeType_Mark,FALSE)
			SetModeEx(Ball, EM_SetModeType_Move,FALSE)
			--SetModeEx(Ball, EM_SetModeType_Gravity, false);
			AddToPartition(Ball, 0)
			--Say(Ball,"33")
			--Say(NPC,"11")
			MoveToFlagEnabled( NPC, false )
			for K=1,5 do
				CastSpell(NPC, Ball,850756)
				Sleep(100)
			end
			DelObj(Ball)
			MoveToFlagEnabled( NPC, true )
			break
		end
		Sleep(10)
	end
end

function Lua_PG_GuPu_Follow()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 6
	local count = 2 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(122152,Matrix,2,-1 )
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_PG_GuPu_Follow_Reset" , 0 )
end

function Lua_PG_GuPu_Follow_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_PG_GuPu_Follow" , 0 )
end


---------------------------------------------------------------------------
--黑色法陣
---------------------------------------------------------------------------
function LuaPG_DarkBuff()
	CastSpell(OwnerID(),OwnerID(),850758)
end

function LuaPG_DarkBuff_01()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_RUN_CHARGE2)
	CastSpell(OwnerID(),OwnerID(),850759)
end