--z30佈置=======================================
--=======================================
--==============母象帶小象
function LuaPG_108424_Elephant()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 40
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 100  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108424,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108554,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108554,Matrix,3,-1 )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaPG_108424_Elephant_02" , 0 );
end

function LuaPG_108424_Elephant_02()
	BeginPlot( OwnerID() , "LuaPG_108424_Elephant" , 2 );
end

--==============石板下的法陣
function LuaPG_123322_MagicCircle()
	local Board = OwnerID()
	local x,y,z,dir=DW_Location(Board)
	local MagicCircle01 = CreateObj(120303, x, y, z , dir, 1 )	--生成
	local MagicCircle02 = CreateObj(123357, x, y, z , dir, 1 )	--生成
	AddToPartition(MagicCircle01, 0)	
	AddToPartition(MagicCircle02, 0)	
end

--==============墓室傳送門
function LuaPG_Grave_Down()		--傳到墓穴下
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Grave_Down_02" , 60 )
end

function LuaPG_Grave_Down_02()
	local Player = OwnerID()
	if (DW_CheckQuestAccept("or",Player,426804)==true	or
	CheckCompleteQuest(Player, 426804)==true)		and
	CheckCompleteQuest(Player, 426900)==false		then
		ChangeZone( Player , 30 , 0 , 16317.4 , -425.0 , 41871.8 , 270.8 )
	elseif CheckCompleteQuest(Player, 426900)==true	then
		ChangeZone( Player , 30 , 0 , 16317.4 , -1655.3 , 41871.8 , 270.8 )
	end
end

function LuaPG_Grave_Up()		--傳到墓室上
	local Player = OwnerID()
	SetPlot( Player, "range" , "LuaPG_Grave_Up_02" , 60 )
end

function LuaPG_Grave_Up_02()
	ChangeZone( OwnerID() , 30 , 0 , 16333.0 , 757.3, 42189.3 , 262 )
end

--==============瘋掉的卡沙融合體
function LuaPG_Z30_Talk1()
	local NPC = OwnerID()
	LuaP_Sitting()
	SetPlot(NPC,"touch","LuaPG_Z30_Talk1_1",30)
	SetCursorType( NPC , eCursor_Speak) 
end
function LuaPG_Z30_Talk1_1()
	local num = Rand(3)+1
	NpcSay(TargetID(),"[SC_Z30_TALK1_"..num.."]")
end

--==============自言自語
function LuaPG_Z30_Talk2_1()
	local num = Rand(3)+1
	NpcSay(OwnerID(),"[SC_Z30_TALK2_"..num.."]")
	Sleep(25)
end

--==============史塔克的閒聊
function LuaPG_Z30_Talk3_1()
	local NPC = OwnerID()
	SetPlot(NPC,"touch","LuaPG_Z30_Talk3_2",30)
	SetCursorType( NPC , eCursor_Speak) 
end
function LuaPG_Z30_Talk3_2()
	local num = Rand(3)+1
	NpcSay(TargetID(),"[SC_Z30_TALK3_"..num.."]")
end

--==============一群蝙蝠
function LuaPG_108428_Bat()
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
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108428,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108428,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108428,Matrix,3,-1 )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "Lua_PG_108424_Elephant_02" , 0 );
end

function LuaPG_108428_Bat_02()
	BeginPlot( OwnerID() , "Lua_PG_108424_Elephant" , 2 );
end

--==============坦希拉放火
function LuaPG_108504_Tan()
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_CAST_SP01)
	CastSpell( OwnerID(), OwnerID(), 850752)
end

--==============三區傳送點
function LuaPG_Z30_TransPos()
	local Player = OwnerID() 
	local TransPos = TargetID()
	local TransPID = ReadRoleValue( TransPos, EM_RoleValue_PID )
	LoadQuestOption(Player)
	if TransPID==1	then	--奧維克
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_2]", "LuaPG_Z30_TransPos_01(2)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_3]", "LuaPG_Z30_TransPos_01(3)", 0)
	elseif TransPID==2	then	--薩爾巴諾
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_1]", "LuaPG_Z30_TransPos_01(1)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_3]", "LuaPG_Z30_TransPos_01(3)", 0)
	elseif TransPID==3	then	--隱蔽的營地
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_1]", "LuaPG_Z30_TransPos_01(1)", 0)
		AddSpeakOption(Player, TransPos, "[SC_Z30TRANSPOS_2]", "LuaPG_Z30_TransPos_01(2)", 0)	
	end
end

function LuaPG_Z30_TransPos_01(Pos)
	local Player = OwnerID()
	local obiect = TargetID()
	local x, y, z, dir=DW_Location( obiect ) 
    	local BallFx=CreateObj( 122133, x, y-10, z, dir, 1 ) 
	AddToPartition( BallFx, 0 ) 
	CastSpell( Player, Player, 490513 ) 
	Sleep( 20 )
	if CheckID( Player )==true	then
		DelObj(BallFx)
		if Pos==1		then
			SetPosByFlag( Player , 781381, 71 )
		elseif Pos==2		then
			SetPosByFlag(  Player , 781381, 72 )
		elseif Pos==3		then
			SetPosByFlag( Player , 781381, 73 )
		end
	else DelObj(BallFx)
	end
	if DW_CheckQuestAccept("or",Player,427304)==true	then
		SetFlag(Player, 549352, 1)
	end
end