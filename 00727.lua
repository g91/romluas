function LuaFunc_Matrix_Maker( dis , count) --建立矩陣的函式
--dis 為衍生物與基準物的間距
--Count 為將生成 Count X Count 的陣列（生成的陣列必為奇數，如果輸入偶數，則自動+1成為奇數行）
--例如輸入 4 ，則生成 5 X 4 的陣列
	local Matrix = {}
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID()  , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID()  , EM_RoleValue_Z )
	local Dir  = ReadRoleValue( OwnerID()  , EM_RoleValue_Dir )
	local Cal = dir*math.pi/180

	if Count == 0 then
		Count = 1
	else
		Count = math.abs(count)
	end

	for i = 1 ,count , 1 do
		local X2 = X - (i-1)*dis*math.cos(Cal)
		local Z2 = Z + (i-1)*dis*math.sin(Cal)
		Matrix[i] =LuaFunc_Count_LeftRight(X2,Y,Z2,Dir,dis,Count)
	end
	return Matrix
end

function LuaFunc_Count_LeftRight(X,Y,Z,Dir,dis,Count) --計算矩陣的橫向結構
--DIR為 0 -359
-- X , Y , Z , Dir 為中心參考座標的基準數值
--dis 為衍生物與基準物的間距
--Count 為一行有多少個（由於行數必須有中心點，因此必須為奇數；如果輸入偶數，則自動產生新的一行）
--將角度換算成徑度
	local Cal
	Cal = (math.pi/180)*(dir) 
--計算衍生物產生的位置並儲存於 TABLE 之中
	local Matrix = {}

	local Loc = math.floor(count/2)
	if Loc ~= 0 then
		for i = -Loc , Loc , 1 do
			Matrix[i] = {}
		end
	else
		Matrix[0] = {}
	end

	Matrix[0]["X"] = X
	Matrix[0]["Y"] = Y
	Matrix[0]["Z"] = Z
	Matrix[0]["Dir"] = Dir

	for i = 1 , Loc , 1 do
		Matrix[i]["X"] = X - i*Dis * math.sin( Cal )
		Matrix[-i]["X"] = X + i*Dis * math.sin( Cal )
		Matrix[i]["Y"] = Y
		Matrix[-i]["Y"] = Y
		Matrix[i]["Z"]  = Z - i*Dis * math.cos( Cal )
		Matrix[-i]["Z"] = Z + i*Dis * math.cos( Cal )
		Matrix[i]["Dir"] = Dir
		Matrix[-i]["Dir"] = Dir
	end

--回傳衍生物
	return Matrix
end

function LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) --在固定座標點產生物件的函式
	-- ObjID 要生成的物件ID
	-- Matrix 建立時依據的位置矩陣
	-- A 建立在第幾列
	-- B 建立在第幾行
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID)
	local Count = table.getn(Matrix)
	--確定 A、B 在範圍內，不在範圍內則不會產生
	if A < 0 or Type(A) ~= "number" or A > Count then
		return nil
	else
		A = math.floor(A)
	end

	if  Type(B) ~= "number" or B == nil then
		return nil
	elseif B > 0 then
		if B > count/2 then
			return nil
		else
			B = math.floor(B)
		end
	elseif B < 0 then
		if B < -count/2 then
			return nil
		else
			B = math.ceil(B)
		end
	end
	--開始設置位置
	local X = Matrix[A][B]["X"] 
	local Y = Matrix[A][B]["Y"] 
	local Z = Matrix[A][B]["Z"] 
	local Dir = Matrix[A][B]["Dir"] 
	local Obj = CreateObj (ObjID,X, Y, Z,Dir, 1)

	WriteRoleValue( Obj , EM_RoleValue_Register + 8  , A ) --紀錄A的位置，A必定大於0 ，用 EM_RoleValue_Register + 8 來記錄
	WriteRoleValue( Obj , EM_RoleValue_PID , B ) --紀錄 B 的位置，由於 B 有負數，所以 B 必須用 PID 來記錄

	AddToPartition( Obj ,RoomID)
	return Obj
end

function LuaFunc_ObjMatrix_Record(ObjMatrix)--紀錄原先NPC身上的資料，以供重生使用
	local ObjRecord = {}
	ObjRecord["OrgID"] = {}
	ObjRecord["A"] = {}
	ObjRecord["B"] = {}
	local OrgID = {} --把物件的 OrgID 存入，重生時可以用
	local OrgA = {} --把物件的 列數 存入，重生時可以用
	local OrgB = {} --把物件的 行數 存入，重生時可以用
	for pry , obj in pairs(ObjMatrix) do 
		if obj ~= nil and CheckID(obj) == true then

			ObjRecord["OrgID"][pry] = ReadRoleValue( obj , EM_RoleValue_OrgID )
			ObjRecord["A"][pry] = ReadRoleValue( obj , EM_RoleValue_Register + 8 )
			ObjRecord["B"][pry] = ReadRoleValue( obj , EM_RoleValue_PID )

		end

	end

	return ObjRecord
end

--將矩陣參考物件送回原點等待重生
function LuaFunc_ResetMatrix( ReviveTime , Matrix)
	local Time = ReviveTime 
	if ReviveTime < 0 or Type(Revivetime) ~= "number" then
		Time = ReSetNPCInfo( OwnerID() ) --輸入 0 以下或是非數字的重生時間，就參考NPC本身的重生時間進行重生
		Time = Time *10
	else
		Time = math.ceil( ReviveTime ) --無條件進位強制 ReviveTime 為整數
	end
 	MoveToFlagEnabled( OwnerID() , false )
	SetPos( OwnerID(), Matrix[1][0]["X"], Matrix[1][0]["Y"], Matrix[1][0]["Z"] , Matrix[1][0]["Dir"] )
	Sleep( Time +1 )
 	MoveToFlagEnabled( OwnerID() , true )
end

function  LuaFunc_MatrixCircleRecord()
	local RC = ReadRoleValue( OwnerID() , EM_RoleValue_Register + 9 )
	RC = RC + 1
	WriteRoleValue( OwnerID() , EM_RoleValue_Register +9 , RC )
end