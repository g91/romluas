--陣型產生範例
function LuaYuyu_gobolin2_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- 	[1][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[2][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--  	[3][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--                                :
--  [Count][-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]

	local count = 13 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local dis = 15 --陣列的間距
	local checktime = 60 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000 --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000 --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生

--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(100634,Matrix,2, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(100634,Matrix,3, -2 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(100634,Matrix,3, 2 )
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(100997,Matrix,4, 1 )
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(100997,Matrix,4,-1 )


--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaYuyu_gobolin2_matrix_Reset" , 0 )
end

function LuaYuyu_gobolin2_matrix_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaYuyu_gobolin2_matrix" , 0 )
end