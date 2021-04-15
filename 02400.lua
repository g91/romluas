-- Index: 
-- FA_GotMiddle：取兩點中間座標
-- FA_BuffInfo：泛用取得Buff各種資訊
-- FA_CalDir：直接丟兩點座標幫你算方向
-- FA_CalFaceDir：直接丟兩個物件幫你算算方向
-- FA_GetXZ：單拿物件的 X 與 Z 的資訊
-- FA_GetXZ_Table：單拿物件的 X 與 Z 的資訊，輸出Table
-- FA_CheckQuestOrFlag：同時檢查完成任務與重要物品
-- FA_CheckLineEX：泛用型超級CheckLine
-- FA_FindError：抓誰掛錯 Function，直接在報錯的Func裡面呼叫這個Func就好。
-- FA_SearchNPC：搜尋特定條件的NPC，並且把他們的GUID傳回，如果只有一個則只會是ID編號，如果抓到複數個則會傳回一個table

--------------------------------- FA_GotMiddle ---------------------------------
--------------------------------- 取兩點中間座標 ---------------------------------
-- 兩個參考點可以自由指定座標、Flag或物件。
-- ObjID1 / FlagNum1 / Z1 跟 ObjID2 / FlagNum2 / Z2 的填法：
	-- 前面一組是 A 點，後面一組是 B 點，所謂的兩點中間即為此AB點之中間。AB點可指定不同類型的參考點。
	-- 若參考點為物件，則只需要輸入 ObjID1 或 ObjID2
	-- 若參考點為Flag，則寫入旗子的群組（資料庫編號）到 ObjID1 或 ObjID2 並把編號寫到 FlagNum1 或 FlagNum2 內。
	-- 若參考點為座標，則寫入XYZ值對應塞入 ObjID1 / FlagNum1 / Z1 或 ObjID2 / FlagNum2 / Z2  內
	-- 你沒用到的參數就填0
-- Range	亂數決定隨機範圍，不隨機請留空或填零
-- CheckLine	要不要檢查該點位置是否與兩參考點之間暢通無阻

function FA_GotMiddle(ObjID1 , FlagNum1 , Z1 , ObjID2 , FlagNum2 , Z2 , Range , CheckLine)
 	local Pos
	local Pos2 = {}
	Range = Range or 0
	local GetRange = 	function ()
					return Rand( Range ) * 2 - Range + 1
				end
 
	if Z1 ~= nil and Z2 ~= nil then
		Pos = {ObjID1, FlagNum1, Z1, ObjID2, FlagNum2, Z2}
	elseif FlagNum1 ~= nil and FlagNum2 ~=nil then
		Pos = { GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_X ),
			GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_Y ),
			GetMoveFlagValue( ObjID1 , FlagNum1 , EM_RoleValue_Z ),
			GetMoveFlagValue( ObjID2 , FlagNum2 , EM_RoleValue_X ),
			GetMoveFlagValue( ObjID2 , FlagNum2 , EM_RoleValue_Z ) }
	else
		Pos = { ReadRoleValue(ObjID1,EM_RoleValue_X),
			ReadRoleValue(ObjID1,EM_RoleValue_Y),
			ReadRoleValue(ObjID1,EM_RoleValue_Z),
			ReadRoleValue(ObjID2,EM_RoleValue_X),
			ReadRoleValue(ObjID2,EM_RoleValue_Z) }
	end

	for i = 1,11 do
		Pos2[1] = (Pos[1] + Pos[4]) / 2
		if Range ~= 0 then Pos2[1] = Pos2[1] + GetRange() end
		Pos2[3] = (Pos[3] + Pos[5]) / 2
		if Range ~= 0 then Pos2[1] = Pos2[1] + GetRange() end

		Pos2[2] = GetHeight( Pos[1] , Pos[2] , Pos[3] )
		if CheckLine == 1 then
			if FA_CheckLineEX(0, 2, Pos2[1], Pos2[2],Pos2[3],ObjID1,FlagNum1,0)
			and FA_CheckLineEX(0, 2, Pos2[1], Pos2[2],Pos2[3],ObjID2,FlagNum2,0) == true then
				break
			end
		else
			break
		end
		if i == 11 then
			DebugMsg(0,0,"FA_GotMiddle ERROR: Cant find a point with CheckLine!")
			return false
		end
	end
	return Pos2[1],Pos2[2],Pos2[3]
end

--------------------------------- FA_BuffInfo ---------------------------------
--------------------------------- 泛用取得Buff各種資訊 ---------------------------------
-- ObjID =	檢查的物件編號
-- BuffID =	要檢查的Buff編號
-- Info =	你要什麼資訊，如果不寫或亂寫就預設為0
	-- 0 =	Buff 施展者
	-- 1 = 	魔法ID
	-- 2 = 	剩下時間(秒)
	-- 3 = 	威力( 魔法累積等級)
	-- 4 = 	點數( 魔法盾可擋點數or 次數)

function FA_BuffInfo(ObjID,BuffID,Info)
	local BuffInfoGot
	if type(Info) ~= "number" or Info > 4 or Info < 0 then Info = 0 end
	if CheckBuff(ObjID,BuffID) == true then
		for i = 0,BuffCount(ObjID) do
			if BuffInfo ( ObjID , i , 1 ) == BuffID then
				BuffInfoGot = BuffInfo ( ObjID , i , Info )
				return BuffInfoGot
			end
		end
	else
		return false
	end
end

-------------------------- FA_CalDir ---------------------------
------------------ 直接丟兩點座標幫你算方向---------------------
-- 1.	可以直接給兩個含座標的 table 在 PosA 跟 PosB 的地方
--	這樣不需要給 PosAz, PosBz
--	PosA[1] 跟 PosB[1] 會被識別為兩個點座標的 X
--	PosA[3] 跟 PosB[3] 會被識別為兩個點座標的 Z
--	如果第三個位置是空的，代表你可能直接給了 X 跟 Z 兩個點而已
--	此情況會改抓 PosA[3] 跟 PosB[3]
-- 2.	你也可以直接把兩個點的 X 跟 Z 直接個別傳入而不用 table
--	PosA 放 第一個點的 X
--	PosB 放 第二個點的 X
--	PosAz 放 第一個點的 Z
--	PosBz 放 第二個點的 Z
--	不過，這情況下 PosA 跟 PosB 依然可以給一套 table，他還是知道去抓第一個元素
--	等於你可以自行額外指定兩個點的 Z 的意思

function FA_CalDir ( PosA, PosB, PosAz, PosBz )
	local A,B = {},{}

	A[1] = PosA[1] or PosA
	A[2] = PosAz or PosA[3] or PosA[2]

	B[1] = PosB[1] or PosB
	B[2] = PosBz or PosB[3] or PosB[2]

	if not (A[1] and A[2] and B[1] and B[2]) then
		return false
	end

	return CalDir( A[1] - B[1], A[2] - B[2] )

end

--------------------------- FA_CalFaceDir ---------------------------
-------------------- 直接丟兩個物件幫你算算方向 ---------------------

function FA_CalFaceDir ( ObjA, ObjB )
	return FA_CalDir( FA_GetXZ_Table (ObjA), FA_GetXZ_Table (ObjB) )
end

--------------------------- FA_GetXZ ---------------------------
-------------------- 單拿物件的 X 與 Z 的資訊 ------------------

function FA_GetXZ ( Obj, FlagNum )
	Obj = Obj or OwnerID()
	local X, Z

	if type( Obj ) ~= "number" then
		return false
	end

	if type(FlagNum)=="number" then
		X = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_X )
		Z = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_Z )
		return X, Z
	else
		X = ReadRoleValue( Obj , EM_RoleValue_X )
		Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		return X, Z
	end
end

--------------------------- FA_GetXZ_Table -----------------------------
----------------- 單拿物件的 X 與 Z 的資訊，輸出Table ------------------

function FA_GetXZ_Table ( Obj, FlagNum )
	return { FA_GetXZ ( Obj, FlagNum ) }
end

--------------------------------- FA_CheckQuestOrFlag ---------------------------------
--------------------------------- 同時檢查完成任務與重要物品 ---------------------------------
-- 檢查解完Quest或者某個Flag(KeyItem)是否其中一者有
-- AndOr = 1 變成兩者皆要有。如果QuestNum跟FlagNum有缺寫的則永傳回false
function FA_CheckQuestOrFlag(Who,QuestNum, FlagNum,AndOr)
	QuestNum = QuestNum or -1
	FlagNum = FlagNum or -1
	if AndOr == 1 then
		return CheckCompleteQuest(Who,QuestNum) and CheckFlag(Who,FlagNum)
	else
		return CheckCompleteQuest(Who,QuestNum) or CheckFlag(Who,FlagNum)
	end
	return false
end

--------------------------------- FA_CheckLineEX ---------------------------------
--------------------------------- 泛用型超級CheckLine ---------------------------------
-- 檢查兩點之間是否暢通
-- 使用 117666 隱形物品實現各類型的checkline
-- P1 跟 P2 輸入第一個跟第二個點（無順序）的類型，使用代碼如下：
	-- 大小寫無所謂 --
	-- "xyz"或 "X" 或 "0"	參考點指定為座標
	-- "Obj" 或 "O" 或 "1"	參考點指定為物件
	-- "Flag" 或 "F" 或 "2"	參考點指定為旗標
-- 輸入物件分成兩組，P1 物件對應到 Va1 ~ Va3，P2 物件對應到 Vb1 ~ Vb3
	-- 你沒用到的參數就填0
-- GetHeight輸入1，則會先把輸入的XYZ都重取一次GetHeight（地表碰撞點高度）
	-- 所以這樣做的話 y 就可以隨便寫了。不過他只會抓到地表點，物品上的就沒辦法了。

function FA_CheckLineEX(P1, P2, Va1, Va2, Va3,Vb1,Vb2,Vb3,GetHeight)
	Local Pos
	local FlagXYZ
	local ObjCreated
	local ArgTable = {	["xyz"] = 0, ["x"] = 0, ["0"] = 0, [0] = 0,
				["obj"] = 1, ["o"] = 1, ["1"] = 1, [1] = 1,
				["flag"] = 2, ["f"] = 2, ["2"] = 2, [2] = 2	}

	P1, P2 = ArgTable[string.lower(P1)], ArgTable[string.lower(P2)]

	if P1 == nil or P2 == nil then
		DebugMsg(0,0,"FA_CheckLineEX ERROR: Give me a right point's type arg please!")
		return false
	end

	if GetHeight == 1 then
		if P1 == 0 then
			Va2 = GetHeight(Va1 , Va2 , Va3)
		end
		if P2 == 0 then
			Vb2 = GetHeight(Vb1 , Vb2 , Vb3)
		end
	end

	if P1 == 0 then

		if P2 == 0 then
			Pos = {CreateObj( 117666, Va1 , Va2 , Va3 ,0 , 1),Vb1,Vb2,Vb3}
			ObjCreated = true
		elseif P2 == 1 then
			Pos = {Vb1,Va1,Va2,Va3}
		elseif P2 == 2 then
			Pos = {CreateObjByFlag(117666,Vb1,Vb2,1),Va1,Va2,Va3}
			ObjCreated = true
		end

	elseif P1 == 1 then

		if P2 == 0 then
			Pos = {Va1,Vb1,Vb2,Vb3}
		elseif P2 == 1 then
			return CheckRelation( Va1 , Vb1 , EM_CheckRelationType_CheckLine ) 
		elseif P2 == 2 then
			FlagXYZ = DW_GetFlagXYZ(Vb1,Vb2)
			Pos = {Va1,FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
		end

	elseif P1 == 2 then

		if P2 == 0 then
			Pos = {CreateObjByFlag(117666,Va1,Va2,1),Vb1,Vb2,Vb3}
			ObjCreated = true
		elseif P2 == 1 then
			FlagXYZ = DW_GetFlagXYZ(Va1,Va2)
			Pos = {Vb1,FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
		elseif P2 == 2 then
			FlagXYZ = DW_GetFlagXYZ(Vb1,Vb2)
			Pos = {CreateObjByFlag(117666,Va1,Va2,1),FlagXYZ[1],FlagXYZ[2],FlagXYZ[3]}
			ObjCreated = true
		end

	end

	if ObjCreated == true then
		DelObj(Pos[1])
	end

	return CheckLine(Pos[1],Pos[2],Pos[3],Pos[4])

end

function FA_FindError()
	DebugMsg(0,0,"Error on me! My ID is "..OwnerID().."!!")
end

-- 搜尋特定條件的NPC，並且把他們的GUID傳回，如果只有一個則只會是ID編號，如果抓到複數個則會傳回一個table
-- Center 搜尋中心點的GUID
-- Range 範圍
-- OrgID 要搜尋對象的資料庫編號
-- PID 要搜尋對象的PID
-- IsBoth 如果這個地方寫1或true，那就是需要上面兩個條件都成立（and）
--	  否之則是有其一則成立（or）
function FA_SearchNPC( Center, Range, OrgID, PID, IsBoth )
	local SearchTable = {}
	local ReturnTable = {}

	Range = Range or 300
	Center = Center or OwnerID()

	SearchTable = SearchRangeNPC(Center,Range)

	for i = 1, table.getn(SearchTable)	do
		if IsBoth == true or IsBoth == 1 then
			if ReadRoleValue(SearchTable[i], EM_RoleValue_OrgID ) == OrgID
			and ReadRoleValue(SearchTable[i], EM_RoleValue_PID ) == PID then
				table.insert(ReturnTable,SearchTable[i])
			end
		else
			if ReadRoleValue(SearchTable[i], EM_RoleValue_OrgID ) == OrgID
			or ReadRoleValue(SearchTable[i], EM_RoleValue_PID ) == PID then
				table.insert(ReturnTable,SearchTable[i])
			end
		end
	end

	if table.getn(ReturnTable) == 1 then
		return ReturnTable[1]
	elseif ReturnTable == {} then
		return nil
	else
		return ReturnTable
	end

end
