--z32佈置=======================================
--=======================================
--===============帶一隻怪
function LuaPG_Z32_Group()
--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	
	local NPC = OwnerID()
	local dis = 25
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 100  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local LeaderPID = ReadRoleValue(NPC, EM_RoleValue_PID)
--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local MonPID = ReadRoleValue(NPC, EM_RoleValue_PID)
	
--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}

	if  MonPID==0	then	--蹬羚組
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108731,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108911,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108911,Matrix,3,-1 )

	elseif MonPID==1	then	--獅魚人喚水者與魚怪組
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108730,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108733,Matrix,3,1 )		

	elseif MonPID==2	then	--獅魚人巡邏者與魚怪組
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108729,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108733,Matrix,3,1 )

	elseif  MonPID==3	then	--換水者與巡邏者組
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108729,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108730,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108730,Matrix,3,-1 )

	elseif  MonPID==4	then	--狼組
		Matrix = LuaFunc_Matrix_Maker( 45 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(108674,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(108673,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(108673,Matrix,3,-1 )

	elseif  MonPID==5	then	--隼之團組
		Matrix = LuaFunc_Matrix_Maker( 40 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(123863,Matrix,2,0 )
		ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(123861,Matrix,3,1 )
		ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(123862,Matrix,3,-1 )

	elseif  MonPID==6	then	--小孩追狗組
		Matrix = LuaFunc_Matrix_Maker( 6 , count ) 
		ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(114794,Matrix,3,1 )
		ks_ActSetMode( ObjMatrix[1] )
		SetModeEx( ObjMatrix[1] , EM_SetModeType_HideName , true )
		WriteRoleValue(ObjMatrix[1]  ,EM_RoleValue_IsWalk , 0 )
	end

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( NPC, "LuaPG_Z32_Group_02" , 0 );
end

function LuaPG_Z32_Group_02()
	BeginPlot( OwnerID() , "LuaPG_Z32_Group" , 2 );
end

--=======================================
--===============離水裝置特效
function LuaPG_Z32_Seafood_device()
	local Seafood = OwnerID()
	local x,y,z,dir=DW_Location(Seafood)
	local BuffMan = CreateObj(119306, x, y, z, dir, 1 )	--生成
	AddToPartition(BuffMan, 0)
	SetModeEx(BuffMan, EM_SetModeType_Mark,FALSE)
	SetModeEx(BuffMan, EM_SetModeType_Move,FALSE)
	AddBuff(BuffMan, 625489, 0, -1)
	WriteRoleValue(Seafood, EM_RoleValue_Register3, BuffMan)
end

--=======================================
--===============獅魚人特效
function LuaPG_Z32_Seafood_Head()
	local Seafood = OwnerID()
	AddBuff(Seafood, 625728, 0, -1)
end

--=======================================
--===============牢籠人質
function LuaPG_Z32_Hostage_Act()
	local NPC = OwnerID()
	local RandNum = Rand(3)+1
	local Act = {ruFUSION_ACTORSTATE_EMOTE_CRY, ruFUSION_ACTORSTATE_EMOTE_BEG, ruFUSION_ACTORSTATE_EMOTE_ANGRY}
	PlayMotionEX(NPC, Act[RandNum], Act[RandNum])
end

--=======================================
--===============煙霧特效
function LuaPG_Z32_Smoke()
	local NPC = OwnerID()
	local x,y,z,dir=DW_Location(NPC)
	local  Smoke = CreateObj(123606, x, y, z, dir, 1 )	--生成
	AddToPartition(Smoke, 0)
end

--=======================================
--===============造謠的農民
function LuaPG_Z32_RumourFarmer()
	local Farmer = OwnerID()
	local RandNum = Rand(5)+1
	local SpeakString = {"[SC_FARMER_1]","[SC_FARMER_2]","[SC_FARMER_3]","[SC_FARMER_4]","[SC_FARMER_5]"}
	NPCSay(Farmer, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============一直打滾
function LuaPG_Z32_123710()
	SetIdleMotion( OwnerID(), ruFUSION_MIME_EMOTE_ROFL)
end

--=======================================
--===============喊痛
function LuaPG_Z32_123710_2()
	local Farmer = OwnerID()
	local RandNum = Rand(2)+1
	local SpeakString = {"[SC_123710_1]","[SC_123710_2]"}
	NPCSay(Farmer, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============小鹿喝水
function LuaPG_Z32_Animal_Water()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_PARRY_1H)
end

--=======================================
--===============獅魚人訓練區
function LuaPG_Z32_Seafood_Train()
	local Seafood = OwnerID()
	local RandNum = Rand(2)+1
	local SpeakString = {"[SC_SEAFOOD_1]","[SC_SEAFOOD_2]"}
	PlayMotion(Seafood, ruFUSION_ACTORSTATE_CAST_SP01)
	NPCSay(Seafood, SpeakString[RandNum])
	Sleep(25)
end

--=======================================
--===============獅魚人之對裝置施法
function LuaPG_Z32_Seafood_DeviceShow()	--對著特效球施放法術
	local NPC = OwnerID()
	local Ball = LuaFunc_SearchNPCbyOrgID( NPC, 123857, 200, 0 )

	while 1 do
		local Attack = HateListCount(NPC) --戰鬥狀態
		if Attack ==0	then
			PlayMotion( NPC, ruFUSION_MIME_BUFF_BEGIN)
			CastSpell(NPC, Ball, 851957)
		--else
			--SetDefIdleMotion(NPC, ruFUSION_MIME_NONE)
		end
		Sleep(50)
	end
end

function LuaPG_Z32_Seafood_DeviceShow_2()
	AddBuff(OwnerID(), 625728, 0, -1)
end


--=======================================
--===============掃地
function LuaPG_Z32_Cleaning()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE0)
	Sleep(25)
end

--=======================================
--===============鐵匠
function LuaPG_Z32_Blacksmith()
	local NPC = OwnerID()
	SetDefIdleMotion(NPC, ruFUSION_MIME_ATTACK_1H)
end

--=======================================
--===============狼
function LuaPG_Z32_Wolf()
	local NPC = OwnerID()
	PlayMotion(NPC, ruFUSION_ACTORSTATE_EMOTE_IDLE)
	Sleep(15)
end

--=======================================
--===============游泳
function LuaPG_Z32_Swim()
	local NPC = OwnerID()
	SetDefIdleMotion(NPC, ruFUSION_MIME_SWIM_IDLE)
end