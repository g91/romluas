function LuaS_101768_0()

	local count = 7 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 9 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = -1 --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 250 --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local dis = 20 --間距

	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(101768,Matrix,1, -2 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(101735,Matrix,2,  0 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(101735,Matrix,3, -4)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(101735,Matrix,4,  -1)
	ObjMatrix[5] = LuaFunc_CreateNPCByMatrix(101753,Matrix,4,   2 )
	ObjMatrix[6] = LuaFunc_CreateNPCByMatrix(101753,Matrix,5,  -3)

	--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

	--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT

	--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaS_101768_1" , 0 )
end

function LuaS_101768_1()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaS_101768_0" , 0 )
end


function LuaS_101858_0()--水手陣形
	LuaDavis_custom_matrix(10,9,101858,0,0,0,0,0,101858,0,0)
end

function LuaS_101755_0()--巨魔獵手
	LuaDavis_custom_matrix(10,9,101755,0,0,0,0,0,101754,0,0)
end

function LuaS_101756_0()--巨魔戰士&薩滿
	LuaDavis_custom_matrix(10,9,101756,0,0,0,0,0,101757,0,0)
end

function LuaS_101759_0()--血牙獵手&血狼
	LuaDavis_custom_matrix(10,9,101759,0,0,0,0,0,101760,0,0)
end

function LuaS_101760_0()--血牙戰士&血牙戰士
	LuaDavis_custom_matrix(10,9,101761,0,0,0,0,0,101761,0,0)
end

function LuaS_101769_0()
	LuaDavis_custom_matrix(12,9,101769,0,0,0,0,0,101770,0,0)
end
