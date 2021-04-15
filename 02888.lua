--z26佈置=======================================
--=======================================
--監視螞蟻--
function Lua_PG_Ant_Keep_Sight()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 30
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 100  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	local MonPID = ReadRoleValue(OwnerID(), EM_RoleValue_PID)
	if MonPID ==0		then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107721,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107724,Matrix,3,1 )
	elseif MonPID ==1	then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107726,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107724,Matrix,3,1 )
	elseif MonPID ==2	then
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107730,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107729,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107729,Matrix,3,-1 )
	end


--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_PG_Ant_Keep_Sight_02" , 0 );
end

function Lua_PG_Ant_Keep_Sight_02()
	BeginPlot( OwnerID() , "Lua_PG_Ant_Keep_Sight" , 2 );
end


--=======================================
--佩翠希--
function Lua_PG_Z26NPC_01()
	local Player = OwnerID()
	LuaP_117278_01()	
	NPCSAY(Player,"[SC_Z26_NPC_01]")
	Sleep(30)
end

--=======================================
--未武裝攻擊--
function Lua_PG_ATTACK_UNARMED()
	local Player = OwnerID()
	PlayMotion(Player,ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	Sleep(30)
end

--=======================================
--營地裡的壞話悄悄話--
function Lua_PG_Z26_Gossip()
	SetPlot( OwnerID(),"range","Lua_PG_Z26_Gossip_01",40 )	
end

function Lua_PG_Z26_Gossip_01()
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_01]")
	Sleep(10)
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_02]")
end

function Lua_PG_Z26_Gossip_03()
	SetPlot( OwnerID(),"range","Lua_PG_Z26_Gossip_04",40 )
end

function Lua_PG_Z26_Gossip_04()
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_03]")
	Sleep(10)
	Tell(OwnerID() ,TargetID() ,"[SC_Z26_GOSSIP_04]")
end


--=======================================
--熊人坐下--
function Lua_PG_Bear_Sit()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_KNOCKDOWN_END)
end

--=======================================
--敬禮．改--
Function Z26_PG_Keirei_00()
	local NPC=OwnerID()
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
	SetPlot( NPC, "range", "Z26_PG_Keirei_01", 50 )
End
Function Z26_PG_Keirei_01()
	local PID=OwnerID()
	local NPC=TargetID()
	local Num=DW_Rand(2)
	if ReadRoleValue( NPC, EM_RoleValue_Register1 )==0 and Num==1 then
		CallPlot( NPC, "Z26_PG_Keirei_02", NPC, PID )
	else 	return
	end
End
Function Z26_PG_Keirei_02( NPC, PID )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 1 )
	local OBJ=SearchRangeNPC( NPC, 50 )
	for i=0, table.getn( OBJ ), 1 do
		if ReadRoleValue( OBJ[i], EM_RoleValue_OrgID )==122418 and
		ReadRoleValue( OBJ[i], EM_RoleValue_Register1 )==0 then
			CallPlot( OBJ[i], "Z26_PG_Keirei_03", NPC, PID, OBJ[i] )
		end
	end
End
Function Z26_PG_Keirei_03( NPC, PID, OBJ )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 1 )
	AdjustFaceDir( OBJ, PID, 0 )
	NpcSay( OBJ, "[SC_NPC122400_00]" )
	PlayMotion( OBJ, ruFUSION_ACTORSTATE_EMOTE_SALUTE )
	Sleep(20)
	AdjustFaceDir( OBJ, NPC, 0 )
	WriteRoleValue( OBJ, EM_RoleValue_Register1, 0 )
	WriteRoleValue( NPC, EM_RoleValue_Register1, 0 )
End

--=======================================
--貝拉蒂亞.懈怠之索雷爾頓--
function Lua_PG_Z26NPC_02()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_02]")
	Sleep(30)
	NPCSAY(Player,"[SC_Z26_NPC_03]")
	Sleep(35)
end

function Lua_PG_Z26NPC_03()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_04]")
	Sleep(30)
end
function Lua_PG_Z26NPC_04()
	local Player = OwnerID()	
	NPCSAY(Player,"[SC_Z26_NPC_05]")
	Sleep(50)
end

--=======================================
--幽龍BUFF修正--
function LuaPG_BlackDragon_02()
	AddBuff( OwnerID(),624666,0,-1)
	AddBuff( OwnerID(),624667,0,-1)
end