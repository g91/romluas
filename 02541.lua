function LuaQ_Z22_bird()
	local bird = OwnerID()
	if CheckBuff(bird,621240)==false then
		Sleep(100)
		AddBuff(bird,621240,0,-1)
	end
	ic_MOB_BUFF_22()
end

function Luas_z22_paniro_npc()
	local OID = OwnerID()
	local OGUID = ReadRoleValue(OID,EM_RoleValue_OrgID)
	while true do
		ScriptMessage(OID,2,0,OGUID, 0 );
		Sleep(80)
	end
end

Function LuaP_dr_Z22_NPC() 
	local OID = OwnerID()
	local Z = 0
	while true do
		Sleep(55)
		if Z == 0 then
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_1]")
			Z = Z+1
		elseif Z == 1 then 
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_2]")
			Z = Z+1
		elseif Z == 2 then 
			PlayMotion( OID, ruFUSION_ACTORSTATE_EMOTE_ROFL)
			NPCSAY(OID,"[SC_119943_3]")
			Z = 0
		end
	end

end

function LuaM_Z22DRmilitary_matrix()			--士兵

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
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106366,Matrix,2, 0 )
	Lua_SetRrSoldierMode(ObjMatrix[1])
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106366,Matrix,2, -1 )
	Lua_SetRrSoldierMode(ObjMatrix[2])
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106366,Matrix,1, 0 )
	Lua_SetRrSoldierMode(ObjMatrix[3])
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106366,Matrix,1, -1 )
	Lua_SetRrSoldierMode(ObjMatrix[4])
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_Z22DRmilitary_matrix" , 0 )
end

function LuaM_Z22DRmilitary_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z22DRmilitary_matrix" , 0 )
end

function Lua_SetRrSoldierMode(obj)
	SetModeEx( obj   , EM_SetModeType_Fight , true )--可砍殺攻擊
	SetModeEx( obj   , EM_SetModeType_Strikback, true )--反擊
	SetModeEx( obj   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
	SetModeEx( obj   , EM_SetModeType_Obstruct, false )--阻擋
	SetModeEx( obj   , EM_SetModeType_Mark, false )--標記
	SetModeEx( obj   , EM_SetModeType_Move, true )--移動
	SetModeEx( obj  , EM_SetModeType_Searchenemy, true )--索敵
	SetModeEx( obj   , EM_SetModeType_ShowRoleHead, false )--頭像框
	SetModeEx( obj   , EM_SetModeType_HideName, true )--名稱
end

function LuaS_424981_Change()
	local player = OwnerID()
	local Npc = TargetID()
	LoadQuestOption(player)
	if CheckCompleteQuest(player,424981)==true then
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240941".."]".."][$SETVAR2=".."[".."206874".."]".."]","LuaS_424981_ChangeItem(1)",0)	--+HP
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240942".."]".."][$SETVAR2=".."[".."206877".."]".."]","LuaS_424981_ChangeItem(2)",0)	--+HP
		AddSpeakOption(player,Npc,"[SC_424981_CHANGE][$SETVAR1=".."[".."240943".."]".."][$SETVAR2=".."[".."206890".."]".."]","LuaS_424981_ChangeItem(3)",0)	--+HP
	end
end

function LuaS_424981_ChangeItem(Num)
	local player = OwnerID()
	if Num == 1 and CountBodyItem(player,240941)>=1 then
		GiveBodyItem(player,206874,1)
		DelBodyItem(player,240941,1)
	elseif Num == 2 and CountBodyItem(player,240942)>=1 then
		GiveBodyItem(player,206877,1)
		DelBodyItem(player,240942,1)
	elseif Num == 3 and CountBodyItem(player,240943)>=1 then
		GiveBodyItem(player,206890,1)
		DelBodyItem(player,240943,1)
	else 
		ScriptMessage( player, player, 0,"[K_08MID_DIALOG7]", 0 )
	end
	CloseSpeak(player)
end