--------------------------------------------- 減去 N 層 Buff ( N = 0 是減掉 1 層，N = 1 是減掉 2 層，和 AddBuff 規則相同 ) ------------------------------
-- obj : 要減去 Buff 的物件
-- BuffID : 要減去的 Buff
-- Lv : 要減去的 Lv ( 0 是減去 1 , 1 是減去 2 ......以下類推，這是為了跟 AddBuff 的規則同步 )
-- Time : Buff 時間，填 0 或 -1 的話，會抓此 Buff 目前的剩餘時間
-- Event : 減到沒有Buff 的話要不要觸發Buff 消失的事件，0 是會，-1是不會，可不填

function  Lua_SubtractBuff( Obj , BuffID , Lv , Time , Event ) 
	if Event == nil or Type( Event ) ~= "number" or Event >= 0 then
		Event = 0
	end
	local BuffPos = Lua_BuffPosSearch(Obj , BuffID )
	if BuffPos >= 0 then
		local OrgLv = BuffInfo( Obj  , BuffPos , EM_BuffInfoType_Power ) +1
		Lv = Lv + 1
		if OrgLv - Lv <= 0 then
			if Event == 0 then
				if CancelBuff( Obj , BuffID ) then
					return true
				end
			else
				if CancelBuff_NoEvent( Obj , BuffID ) then
					return true
				end
			end
		else
			if Time <= 0 or Type(Time) ~= "number" then
				Time = BuffInfo( Obj  , BuffPos , EM_BuffInfoType_Time )
			end
			if AddBuff(Obj  , BuffID , -1-Lv , Time ) then
				return true
			end
		end
	end
	return false
end
------------------------------------------------
--dis ,disX 半徑
--type 0不交叉1交叉
function Lua_Davis_BornByMultilateral( MonsterID , X , dis ,ObjID)	--在ObjID周圍用MonsterID 圍成 X 角形
	if ObjID ==nil then
		ObjID = OwnerID();
	end
	local RoomID = ReadRoleValue(ObjID , EM_RoleValue_RoomID)
	local Obj = Role:new( ObjID )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	for i = 1 , X do
		MonsterGroup[ i ] =CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition(MonsterGroup[i],RoomID )
	end
	return MonsterGroup
end
function Lua_Davis_BornByMultilateral2( MonsterID ,MonsterID2, X , disX ,type ,ObjID)	--在ObjID周圍用MonsterID和MonsterID2 圍成 X 角形
	if ObjID ==nil then
		ObjID = OwnerID();
	end
	local RoomID = ReadRoleValue(ObjID , EM_RoleValue_RoomID)
	local Obj = Role:new( ObjID )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	local dis = disX
	local N
	if math.fmod (X , 2) == 1 then
		if type == 1 then
			dis = rand(disX/2)+(disX/2)
		end
		N = math.floor(X/2)+1
		MonsterGroup[ N ] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(N/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(N/X)),BaseDir, 1 )
	else
		N = math.floor(X/2)
	end
	for i = 1 , math.floor(X/2) do
		if type == 1 then
			dis = rand(disX/2)+(disX/2)
		end
		if math.fmod (i , 2) == 1 then
		MonsterGroup[ i ] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		MonsterGroup[ i+N ] = CreateObj( MonsterID2, BaseX-dis*math.cos(math.pi*2*((X-(i-1))/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*((X-(i-1))/X)),BaseDir, 1 )
		else
		MonsterGroup[ i +N] = CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*((X-(i-1))/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*((X-(i-1))/X)),BaseDir, 1 )
		MonsterGroup[ i ] = CreateObj( MonsterID2, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
		end
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition(MonsterGroup[i],RoomID )
		--Say(MonsterGroup[i],"i="..i)
	end
	return MonsterGroup
end
function Lua_Davis_BornByMultilateralGroup( BaseX,BaseY,BaseZ,BaseDir,MonsterGroupID, dis  )	--在X,Y,Z,Dir為圓心disX為半徑用MonsterGroupID()陣列 圍成 一個圓形 所有物件面向Dir(有AddToPartition)	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID);
	local RoomID = ReadRoleValue( OwnerID(),  EM_RoleValue_RoomID );
	local MonsterGroup = {};
	for i = 1 , table.getn(MonsterGroupID) do
		MonsterGroup[ i ] =CreateObj( MonsterGroupID[i], BaseX-dis*math.cos(math.pi*2*(i/table.getn(MonsterGroupID))),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/table.getn(MonsterGroupID))),BaseDir, 1 );
		AddToPartition(MonsterGroup[i],RoomID );
	end
	return MonsterGroup;
end
function Lua_ObjAreaCheck(ObjID , MapID ) --檢查物件是否在特定的地圖區域內
	local X = ReadRoleValue( ObjID , EM_RoleValue_X )
	local Y = ReadRoleValue( ObjID ,EM_RoleValue_Y )
	local Z = ReadRoleValue( ObjID , EM_RoleValue_Z )
	if CheckMapID(  X ,Y ,Z , MapID ) == true then
		return true
	else
		return false
	end
end


function Lua_DW_LeaderSet(Obj)
	SetModeEx(  Obj  , EM_SetModeType_Mark, false) 
	SetModeEx(  Obj  , EM_SetModeType_HideName, true) 
	SetModeEx(  Obj  , EM_SetModeType_ShowRoleHead, false) 
	SetModeEx(  Obj  , EM_SetModeType_Show, false) 
end

function Lua_ExGetZone( ObjID ) --獲得物件所在 ZoneID 並忽略分流
	local Zone = ReadRoleValue( ObjID , EM_RoleValue_ZoneID )
	Zone = Zone - math.floor( Zone/1000 ) * 1000
	return Zone
end







-----------------------------移動至和目標的指定距離後停下來------------------------
function DW_GetClose(Obj,Target,Range,Way)
------------------------------------------------------------------------------------
--Obj		想要控制移動的物件
--Target	作為目標的物件
--Range		希望ObJ停下時和Target的距離
--Way		不填和0 是採用路徑移動  1是採用直線移動
	local X,Y,Z,LX,LZ,NX,NZ,X1,Y1,Z1
--前三個參數不填會報導致報錯
--因此任一為nil就return false
	if	Obj == nil	or
		Target == nil	or
		Range == nil	then
		return false
	end
	LX = 0
	LZ = 0

	X1 = 0
	Y1 = 0
	Z1 = 0
	while	true	do
--如果物件與目標任一消失也return false
		if	CheckID(Obj)==false	or
			CheckID(Target)==false	then
			return false
		end

		X = ReadRoleValue(Target,EM_RoleValue_X)
		Y = ReadRoleValue(Target,EM_RoleValue_Y)
		Z = ReadRoleValue(Target,EM_RoleValue_Z)
		
		NX = ReadRoleValue(Obj,EM_RoleValue_X)
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z)
--距離小於預設才return true
		if	(X-NX)^2+(Z-NZ)^2>Range^2	then
--DeBugMSG(0,0,"[X-NX]="..((X-NX)^2).."[Z-NZ]="..((Z-NZ)^2).."[Range]="..(Range^2))
--還沒走到又待在原地發呆的時候
			if	(LX == NX	and	LZ == NZ)	or
				(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
				if	Way == nil	or
					Way == 0	then
					WriteRoleValue(Obj,EM_RoleValue_Register2,X)
					WriteRoleValue(Obj,EM_RoleValue_Register3,Y)
					WriteRoleValue(Obj,EM_RoleValue_Register4,Z)
					if	(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
						StopMove(Obj,true)
						Move(Obj,X,Y,Z)
						sleep(20)
					else
						Move(Obj,X,Y,Z)
					end
				else
					if	(X ~= X1	or	Y ~= Y1	or	Z ~= Z1)	then
						StopMove(Obj,true)
						MoveDirect(Obj,X,Y,Z)
						sleep(20)
					else
						MoveDirect(Obj,X,Y,Z)
					end
				end
			end
		else
--DeBugMSG(0,0,"NX="..NX.."##NZ="..NZ)
			StopMove(Obj,true)
			return true
		end
		LX = NX
		LZ = NZ
		X1 = X
		Y1 = Y
		Z1 = Z
		sleep(5)
	end
end






--------------------------發送訊息給指定區域的玩家------------------
--Sender 填發送訊息者
--Kind 訊息的種類：中央紅黃字或是訊息視窗的橘字
--color 字的顏字
--MapID可以不填
--若MapID不填以function執行者的所在MapID為準
function DW_AreaMessage(Sender,Kind,String,Color,MapID)
	if	Sender == nil	or
		Kind == nil	or
		String == nil	or
		Color == nil	then
		return false
	end
--搜尋所有的玩家
--比對玩家的mapid
	local HowManyPlayer = SetSearchAllPlayer(0)
	local Player = {}
	for i = 1,HowManyPlayer,1 do
		Player[i] = GetSearchResult()
		if	MapID == nil	then
			if CheckMapID( ReadRoleValue(Player[i],EM_RoleValue_X) ,ReadRoleValue(Player[i],EM_RoleValue_Y) ,ReadRoleValue(Player[i],EM_RoleValue_Z) , FindMapID( ReadRoleValue(OwnerID(),EM_RoleValue_X) , ReadRoleValue(OwnerID(),EM_RoleValue_Y) , ReadRoleValue(OwnerID(),EM_RoleValue_Z) ) )	then
				ScriptMessage( Sender, Player[i], Kind ,String,Color )
			end
		else
			if CheckMapID( ReadRoleValue(Player[i],EM_RoleValue_X) ,ReadRoleValue(Player[i],EM_RoleValue_Y) ,ReadRoleValue(Player[i],EM_RoleValue_Z) , MapID )	then
				ScriptMessage( Sender, Player[i], Kind ,String,Color )
			end
		end
	end
end




----------------------------------檢查背包剩除空位(暫存欄位也必須是淨空的)----------------------------------
--Role	被檢查的目標
--Num	檢查背包有空間是否有Num格
function DW_CheckBackpage(Role,Num)
	if	Role == nil	then
		return false
	end
	if	Num == nil	then
		Num = 1
	end
	if	type(Num)~="number"	then
		return false
	end
	if	EmptyPacketCount( Role ) >= Num		and
		QueuePacketCount( Role )==0		then
		return true
	else
		return false
	end
end
----------------------------------傳回guid與x.y.z的距離----------------------------------
function Lua_GetDisByXYZ(GUID,X,Y,Z)
	local OX=ReadRoleValue(GUID,EM_RoleValue_X)
	local OY=ReadRoleValue(GUID,EM_RoleValue_Y)
	local OZ=ReadRoleValue(GUID,EM_RoleValue_Z)
	local Dis = ((X-OX)^2+(Y-OY)^2+(Z-OZ)^2)^0.5
	return Dis
end
----------------------------------回傳ObjID的MagicID...冷卻值----------------------------------

function Davis_CheckUse(ObjID,MagicID)  -- 回傳ObjID的MagicID...Item冷卻值，如果MagicID沒有冷卻類別則回傳false，回傳0代表這個法術可以用了
	local Class = GameObjInfo_Int( MagicID,"ColdownClass") -- 抓這個法術的冷卻主類別
	local Type  = GameObjInfo_Int( MagicID,"ColdownType") -- 抓這個法術的冷卻次類別
	if	Class  == 0	then
		return false
	elseif Class  == 1 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Job + Type  ) 
	elseif Class  == 2 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_EQ + Type  ) 
	elseif Class  == 3 then
		return ReadRoleValue(ObjID , EM_RoleValue_Coldown_Item + Type  ) 
	end
end
----------對自己施放等級MagicLv的MagicID法術---------------
function Lua_CastSpellOO(MagicID,MagicLv)
	CastSpellLV( OwnerID() , OwnerID() , MagicID, MagicLv )
end
----------對目標施放等級MagicLv的MagicID法術---------------
function Lua_CastSpellOT(MagicID,MagicLv)
	CastSpellLV( OwnerID() , TargetID() , MagicID, MagicLv )
end
 --以當前目標為原點計算後方三角形陣列的位置Dis距離,X層數（三角形第一層1隻第二層2隻第三層3隻以此類推）-----
function LuaFun_TeamFollow(Dis,X)
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local CheckX = BaseX
	local CheckY = BaseY
	local CheckZ = BaseZ
	local NewX = BaseX
	local NewY = BaseY
	local NewZ = BaseZ
	local MoveDis = Dis
	local NewPos = {}
	local Cal = 0
	local Pos = {}
	local NM = 1
	if X < 1 then
		X = 1
	end
	for i = 1, X do
		if math.fmod(i,2) == 1 then	--單數
			Cal = (math.pi/180)*(BaseDir)
			MoveDis = (i-1)*Dis/2*(3^0.5)
			Pos["X"] = BaseX-(MoveDis*math.cos(Cal))
			Pos["Z"] = BaseZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , BaseY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			CheckX = Pos["X"]
			CheckY = Pos["Y"]
			CheckZ = Pos["Z"]
			if i/2>1 then
				for j=1 , (i-1)/2 do
					MoveDis = j*Dis
					Cal = (math.pi/180)*(BaseDir+90)	--左
					Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
					Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					Cal = (math.pi/180)*(BaseDir-90)	--右
					Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
					Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 	
				end		
			end
		elseif math.fmod(i,2) == 0 then	--雙數
			MoveDis = Dis
			Cal = (math.pi/180)*(BaseDir+30)
			Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			if i/2>1 then
				NewX = Pos["X"]
				NewY = Pos["Y"]
				NewZ = Pos["Z"]
				for j=1 , (i/2-1) do
					MoveDis = Dis
					Cal = (math.pi/180)*(BaseDir+90)	--左
					Pos["X"] = NewX-(MoveDis*math.cos(Cal))
					Pos["Z"] = NewZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , NewY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					NewX = Pos["X"]
					NewY = Pos["Y"]
					NewZ = Pos["Z"]
				end
			end
			Cal = (math.pi/180)*(BaseDir-30)
			Pos["X"] = CheckX-(MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
			NM = NM + 1 
			if i/2>1 then
				NewX = Pos["X"]
				NewY = Pos["Y"]
				NewZ = Pos["Z"]
				for j=1 , (i/2-1) do
					MoveDis = Dis
					Cal = (math.pi/180)*(BaseDir-90)	--右
					Pos["X"] = NewX-(MoveDis*math.cos(Cal))
					Pos["Z"] = NewZ+ (MoveDis*math.sin(Cal))
					Pos["Y"] = GetHeight( Pos["X"] , NewY , Pos["Z"] );
					NewPos[NM] = { Pos["X"]  , Pos["Y"] , Pos["Z"] , BaseDir }
					NM = NM + 1 
					NewX = Pos["X"]
					NewY = Pos["Y"]
					NewZ = Pos["Z"]
				end
			end
			------計算新的參考點
			Cal = (math.pi/180)*(BaseDir)	
			MoveDis = (i-1)*Dis/2*(3^0.5)
			Pos["X"] = CheckX- (MoveDis*math.cos(Cal))
			Pos["Z"] = CheckZ+ (MoveDis*math.sin(Cal))
			Pos["Y"] = GetHeight( Pos["X"] , CheckY , Pos["Z"] );
			CheckX = Pos["X"]
			CheckY = Pos["Y"]
			CheckZ = Pos["Z"]
		end
	end
	return NewPos
end
function Lua_CloseTranDoor( close, Boss )--開關透明門
	local door = OwnerID()
	if close == true then
		for i=1, 2 do
			Sleep(10)
			if Boss ~= nil and CheckID(Boss) == true and 
			KS_InCombat( Boss ) == not close then
				return
			end
		end
	else
		Sleep(20)
	end
	
	if close == true then		
		SetModeEx(  door  , EM_SetModeType_Show, true )
		SetModeEx(  door  , EM_SetModeType_Obstruct, true )
	else
		SetModeEx(  door  , EM_SetModeType_Show, false )
		SetModeEx(  door  , EM_SetModeType_Obstruct, false )
	end
end
--新增物件在隨機位置amount數量,Range半徑,Partitio是否Addto(true,false)
function Lua_CreateObjToRandownPos(GUID,OrgID,amount,Range,Partition)
	local OldX = ReadRoleValue(GUID,EM_RoleValue_X);
	local OldY= ReadRoleValue(GUID,EM_RoleValue_Y);
	local OldZ = ReadRoleValue(GUID,EM_RoleValue_Z);
	local RoomID = ReadRoleValue(GUID,EM_RoleValue_RoomID);
	local ObjTable = {};
	while #ObjTable < amount do
		--Say(GUID,"## = "..#ObjTable);
		local RanNum = math.random(360);
		--Say(GUID,"$$ = "..RanNum);
		local X = OldX -Rand(Range)*math.cos(math.pi/180*RanNum);
		local Z = OldZ +Rand(Range)*math.sin(math.pi/180*RanNum);
		local Y = GetHeight( X , OldY , Z );
		if CheckLine( GUID , X,Y,Z ) then
			--Say(GUID,"ADD"..#ObjTable+1);
			ObjTable[#ObjTable+1] = CreateObj(OrgID,X,Y,Z,0,1);
		--else
			--Say(GUID,"false");
		end
	end
	if Partition == true then
		for k,v in pairs(ObjTable) do
			AddToPartition(v,RoomID);
		end
	end
	return ObjTable;
end