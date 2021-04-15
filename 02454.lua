function LuaS_dr424509_start()						--424509靜待人王到來
	local Tar=TargetID()	--player
	--say(Tar,"i am target")
	--say(OwnerID(),"i am owner")
	AddBuff(Tar,620662,0,-1)
	local horn=Lua_DW_CreateObj( "flag" , 119017 , 780996 , 0 , 1 , 1 )
	local bow=Lua_DW_CreateObj( "flag" , 119020 , 780996 , 1 , 1 , 1 )
	local king=Lua_DW_CreateObj( "flag" , 119021 , 780996 , 2 , 1 , 1 )
	DW_MoveDirectToFlag( king , 780996 , 3 , 1  )
	local shied=Lua_DW_CreateObj( "flag" , 119016 , 780996 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( shied , 780996 , 5 , 1  )
	PlayMotion(king,112)
	Say(king,"[SC_424509_0]")
	sleep(30)
	PlayMotion(horn,112)
	Say(horn,"[SC_424509_1]")
	sleep(40)
	PlayMotion(horn,112)
	Say(horn,"[SC_424509_2]")
	sleep(40)
	PlayMotion(king,112)
	Say(king,"[SC_424509_3]")
	sleep(30)
	PlayMotion(bow,112)
	Say(bow,"[SC_424509_4]")
	Sleep(10)
	DelObj(king)
	DelObj(shied)
	DelObj(horn)
	DelObj(bow)
	CancelBuff(Tar, 620662)
end

function LuaS_dr424510_end()						--424510新的決策
	local Tar=TargetID()	--player
	AddBuff(Tar,620668,0,-1)
	local horn=Lua_DW_CreateObj( "flag" , 119115 , 780997 , 0 , 1 , 1 )
	local bow=Lua_DW_CreateObj( "flag" , 119116 , 780997 , 1 , 1 , 1 )
	local king=Lua_DW_CreateObj( "flag" , 119113 , 780997 , 2 , 1 , 1 )
	local shied=Lua_DW_CreateObj( "flag" , 119114 , 780997 , 3 , 1 , 1 )
	local dog=Lua_DW_CreateObj( "flag" , 119119 , 780997 , 4 , 1 , 1 )
	local cat=Lua_DW_CreateObj( "flag" , 119118 , 780997 , 5 , 1 , 1 )
	PlayMotion(king,112)
	Say(king,"[SC_424510_0]")
	sleep(20)
	PlayMotion(cat,112)
	Say(cat,"[SC_424510_1]")
	sleep(10)
	PlayMotion(dog,112)
	Say(dog,"[SC_424510_2]")
	sleep(10)
	DW_MoveDirectToFlag( cat , 780997 , 7 , 1  )
	DW_MoveDirectToFlag( dog , 780997 , 6 , 1  )
	Sleep(20)
	DelObj(cat)
	DelObj(dog)
	PlayMotion(king,112)
	Say(king,"[SC_424510_3]")
	sleep(20)
	PlayMotion(bow,112)
	Say(bow,"[SC_424510_4]")
	Sleep(20)
	PlayMotion(king,112)
	Say(king,"[SC_424510_5]")
	sleep(10)
	PlayMotion(shied,112)
	Say(shied,"[SC_424510_6]")
	sleep(20)
	PlayMotion(king,101)
	Say(king,"[SC_424510_7]")
	sleep(20)
	DW_MoveDirectToFlag( king , 780997 , 8 , 1  )
	DW_MoveDirectToFlag( horn , 780997 , 9 , 1  )
	DW_MoveDirectToFlag( shied , 780997 , 10 , 1  )
	Sleep(20)
	DelObj(king)
	DelObj(shied)
	DelObj(horn)
	DelObj(bow)
	CancelBuff(Tar, 620668)
end

function LuaS_dr424511_start()						--424511展開調查
	local Tar=TargetID()	--player
	--say(Tar,"i am target")
	--say(OwnerID(),"i am OWN")
	AddBuff(Tar,620669,0,-1)
	local bow=Lua_DW_CreateObj( "flag" , 119025 , 780999 , 0 , 1 , 1 )
	DW_MoveDirectToFlag( bow , 780999 , 1 , 1  )
	Say(bow,"[SC_423705_01]")
	Sleep(20)
	DelObj(bow)
	callplot(tar,"Lua_Zone21_Assassinate_Plot",tar,15)
	CancelBuff(Tar, 620669)
end

function LuaS_dr424512_start()						--424512薩爾多堡密件
	local Tar=TargetID()	--player
	AddBuff(Tar,620671,0,-1)
	local mor=Lua_DW_CreateObj( "flag" , 119042 , 780999 , 2 , 1 , 1 )
	local ji=Lua_DW_CreateObj( "flag" , 119028 , 780999 , 3 , 1 , 1 )
	local ro=Lua_DW_CreateObj( "flag" , 119029 , 780999 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( mor ,780999 , 5 , 1  )
	DW_MoveDirectToFlag(ji , 780999, 6 , 1  )
	DW_MoveDirectToFlag(ro , 780999 , 7 , 1  )
	PlayMotion(mor,112)
	Say(mor,"[SC_424512_0]")
	sleep(20)
	PlayMotion(ro,112)
	Say(ro,"[SC_424512_1]")
	sleep(20)
	PlayMotion(ro,112)
	Say(ji,"[SC_424512_2]")
	Sleep(20)
	DelObj(mor)
	DelObj(ji)
	DelObj(ro)
	CancelBuff(Tar, 620671)
end

function LuaQ_424512_End()							--424512任務完成後人王的密語&表演
	local own=OwnerID()	--player
	local Tar=TargetID()	--npc
	Tell(Tar,own,"[SC_424512_3]")
	AddBuff(Tar,620662,0,-1)
	Sleep(10)
	local woman=Lua_DW_CreateObj( "flag" , 118972 , 780999 , 8 , 1 , 1 )
	DW_MoveDirectToFlag( woman ,780999 , 9 , 1  )
	Sleep(20)
	Say(woman,"[SC_424512_4]")					 --唔...這些人是你的同伴嗎？嗯...那個...可以麻煩你到我家嗎？不會耽擱您太多時間...
	PlayMotion(woman,112)
	Sleep(40)
	Sleep(10)
	DW_MoveDirectToFlag( woman ,780999 , 10 , 1  )
	Sleep(20)
	DelObj(woman)
	CancelBuff(Tar, 620662)
end

function LuaS_dr424516_end()						--424516流落的王儲
	local Tar=TargetID()	--player
	AddBuff(Tar,620662,0,-1)
	local rebel=Lua_DW_CreateObj( "flag" , 119013 , 781000 , 2 , 1 , 1 )
	local Alton=Lua_DW_CreateObj( "flag" , 119015 , 781000 , 3 , 1 , 1 )
	local Hifu=Lua_DW_CreateObj( "flag" , 119014 , 781000 , 4 , 1 , 1 )
	DW_MoveDirectToFlag( rebel , 781000 , 5 , 1  )
	Sleep(50)
	PlayMotion(rebel,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(rebel,"[SC_424516_001]")
	Sleep(30)
	DW_MoveDirectToFlag( rebel , 781000 , 6 , 1  )
	Sleep(10)
	DelObj(rebel)
	PlayMotion(Alton,101)
	Say(Alton,"[SC_424516_002]")
	AdjustFaceDir(Alton,Hifu , 0 )
	sleep(20)
	PlayMotion(Alton,112)
	Say(Alton,"[SC_424516_003]")
	sleep(20)
	AdjustFaceDir( Hifu, Alton, 0 )
	PlayMotion(Hifu,112)
	Say(Hifu,"[SC_424516_004]")
	sleep(20)
	PlayMotion(Hifu,112)
	Say(Hifu,"[SC_424516_005]")
	sleep(20)
	DW_MoveDirectToFlag( Hifu , 781000 , 7 , 1  )
	sleep(20)
	DelObj(Hifu)
	Say(Alton,"[SC_424516_006]")
	PlayMotion(Alton,101)
	sleep(10)
	DelObj(Alton)
	CancelBuff(Tar, 620662)
	Lua_ZonePE_3th_GetScore(100)
end

function LuaS_424433_MISSION_END()				--產生怪物
	local ctrl = OwnerID()
	local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	local frog = Lua_CreateObjByDir( ctrl , 106157 , 100 , 0)
	local OldX,OldY,OldZ,OldDir = Lua_GetPostion(frog);
	local dis = 60
	local Cal1 = math.rad(OldDir)
	local Cal2 = Cal1+math.pi*2*(4/10);
	local Cal3 = Cal1+math.pi*2*(6/10);
	local snake1 = CreateObj( 106156, OldX-dis*math.cos(Cal2),OldY ,OldZ +dis*math.sin(Cal2),OldDir , 1 )
	local snake2 = CreateObj( 106156, OldX- dis*math.cos(Cal3),OldY ,OldZ +dis*math.sin(Cal3),OldDir , 1 )
	AdjustFaceDir( snake1, frog, 0 )
	AdjustFaceDir( snake2, frog, 0 )
	AddToPartition(frog,RoomID)
	AddToPartition(snake1,RoomID)
	AddToPartition(snake2,RoomID)
	SetAttack( snake1 , frog ) 
	SetAttack( snake2 , frog ) 
	sleep(40)
	NPCDead(frog ,snake1) 
	sleep(10)
	NPCDead(snake1,snake1) 
	sleep(10)
	NPCDead(snake2,snake2) 
	sleep(20)
	DelObj(frog)
	DelObj(snake1)
	DelObj(snake2)
end

function LuaQ_Z21COMEHERE_0()						--傳出來
		SetPlot(OwnerID(),"range","LuaQ_Z21COMEHERE_1",45)
end

function LuaQ_Z21COMEHERE_1()
	local npc = TargetID()
	local player =  OwnerID()
	If CheckFlag(player ,545594)==false THEN
		SetPos(player,-25383.7,162.7,35005.7,268.8)
		CallPlot(npc ,"LuaQ_Z21COMEHERE_2",npc ,player)
	else
		return
	end
end

function LuaQ_Z21COMEHERE_2(npc ,player )
	AddBuff(player,620953,0,-1)
	NPCsay(npc ,"[SC_Z21COME_01]")		--嘿！那邊的過來！
	--AdjustFaceDir(OwnerID(),TargetID() , 0 )
	PlayMotion( npc , ruFUSION_ACTORSTATE_EMOTE_POINT)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_02]")		--你有沒有看到甚麼可疑人物，最好老老實實的?出來！
	PlayMotion(npc ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_03]")		--要是窩藏反抗軍這可是重罪！
	PlayMotion(npc ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(20)
	NPCsay(npc ,"[SC_Z21COME_04]")		--好了！你可以走了！
	SetFlag(player,545594,1)
	CancelBuff(player,620953)
end

function LuaQ_Z21_bloodeffect()
	addbuff(ownerID(),620954,0,-1)
end


function LuaS_DRNPC_SHOW()
	local obj = OwnerID()
	SetModeEx(obj,EM_SetModeType_Show,true)
	SetModeEx(obj,EM_SetModeType_MARK,false)
end

function LuaS_DRNPC_HIDE()
	local obj = OwnerID()
	SetModeEx(obj,EM_SetModeType_Show,false)
	SetModeEx(obj,EM_SetModeType_MARK,false)
end

function LuaM_Z21Lechif_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 13
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106064,Matrix,1, -1 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, 0 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, 1 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(106064,Matrix,2, -1)
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_Z21Lechif_matrix" , 0 )
end

function LuaM_Z21Lechif_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z21Lechif_matrix" , 0 )
end
