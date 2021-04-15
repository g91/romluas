--------------任務模式：不被玩家發現的狀況下快速殺死一隻怪物-------------
--Killer 填遊戲中id 若填0則視為OwnerID() 填1則視為TargetID()  
--DeaderID 填要殺死的資料庫編號 限填怪物npc
function DW_QietKillOne(Killer,DeaderID)
	if	Killer ==nil	then	return false	end
	if	DeaderID==nil	then	return false	end
	if	Killer == 0	then
		local Die = Lua_DW_CreateObj("obj",DeaderID,OwnerID(),0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
		KillID(OwnerID(),Die)
--		DelObj(Die)
		return
	end
	if	Killer == 1	then
		local Die = Lua_DW_CreateObj("obj",DeaderID,TargetID(),0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(TargetID(),EM_RoleValue_RoomID))
		KillID(TargetID(),Die)
--		DelObj(Die)
		return
	else
		if	CheckID(Killer)==false	then
			return false
		end
		local Die = Lua_DW_CreateObj("obj",DeaderID,Killer,0)
		SetFlag(Die,544801,1)
		SetModeEx(Die,EM_SetModeType_Show,false) 
		Lua_ObjDontTouch(Die)
		WriteRoleValue(Die ,EM_RoleValue_LiveTime,1)
		AddToPartition(Die,ReadRoleValue(Killer,EM_RoleValue_RoomID))
		KillID(Killer,Die)
--		DelObj(Die)
		return
	end
end
------------------------------------------------------------------------------------------------------------------------
-----------------開啟呼叫出來的物件的名稱以及頭像框、血條
function Lua_ShowQuestObjName(Obj)
	SetModeEX( Obj ,EM_SetModeType_HideName , false )
	SetModeEX( Obj ,EM_SetModeType_NotShowHPMP , false )
	SetModeEX( Obj , EM_SetModeType_ShowRoleHead , true )	
end
------------------------------------------------------------------------------------------------------------------------
-----------------檢查物件身上是否有騎乘buff
-----------------若有回傳true  若否則回傳false  沒有指定物件則檢查自己
function DW_CheckRide(ObjID)
	local Obj = ObjID
	local BuffID
	if	ObjID == nil	then
		Obj = OwnerID()
	else
		Obj = ObjID
	end
	local BuffAmount = BuffCount ( Obj)
	for i=0,BuffAmount,1 do
		BuffID = BuffInfo ( Obj , i , EM_BuffInfoType_BuffID )
		if	GameObjInfo_int ( BuffID , "AssistType" )==68	then
			return true
		end
	end
	return false
end
------------------------------------------------------------------------------------------------------------------------
----------------------解除指定類型的buff
--BuffTypeNum 輸入想解除的buff 類型
--68 騎乘
--58 變身
--ObjID 輸入想解除的目標  若不填 預設為 OwnerID()
--填1 則預設為 TargetID()
function DW_CancelTypeBuff(BuffTypeNum,ObjID)
	if	ObjID == nil	then
		IDNum = OwnerID()
	else
		if	ObjID ==1	then
			IDNum = TargetID()
		else
			IDNum = ObjID
		end
	end
	local Count = BuffCount ( IDNum)
	for i = 1 , Count do
		local BuffID = BuffInfo ( IDNum , Count-i , EM_BuffInfoType_BuffID )
		if GameObjInfo_int ( BuffID , "AssistType" ) == BuffTypeNum then
			CancelBuff( IDNum , BuffID ) 
		end
	end
end
------------------------------------------------------------------------------------------------------------------------
--解除座騎，同時也有解隱載具的作用，並且會回傳布林值，回傳true則是有座騎或載具狀態(已被取消)，回傳否則是步行狀態。
	
function DW_CancelMount(GUID)
	local Obj=GUID;
	Obj = Obj or OwnerID();
	local Count = BuffCount(Obj)
	for i = 1 , Count do
		local Buff = BuffInfo ( Obj , Count-i , EM_BuffInfoType_BuffID)
		if GameObjInfo_int ( Buff , "AssistType" ) == 68 then
			CancelBuff( Obj , Buff );
			return true;
		end
	end
--此人並非駕駛
	if ReadRoleValue(Obj,EM_RoleValue_AttachObjGUID)~=-1 then--是乘客
		DetachObj(Obj);
		return true;
	else--不具有騎乘狀態
		return false;
	end
end
------------------------------------------------------------------------------------------------------------------------
--超快速系統選擇框產生模版！！ 選擇是或否可各自執行一個函式
--警告！此function的ChooserID必須填玩家的ID
--MsgString 系統訊息框內容
--YesFunc 選擇「是」在OwnerID()上執行的
--YesFunc 選擇「否」在OwnerID()上執行的
--YesOption 是的選項字串，可不填 預設為「是」
--NoOption 否的選項字串，可不填  預設為「否」


function DW_ChooseOneFromTwo(ChooserID,MsgString,YesFunc,NoFunc,YesOption,NoOption)
--防呆檢查：填錯資料
	if CheckBuff( ChooserID , 501570) == true then 
		ScriptMessage( ChooserID , ChooserID , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return
	end
	if	type(MsgString)~="string"	then
DeBugMSG(0,0,"MsgString ~= string")
		return
	end
	DialogCreate( ChooserID,EM_LuaDialogType_YesNo,MsgString)
	AddBuff(ChooserID , 501570,0,-1);
--可省略
	if	YesOption == nil	then
		DialogSelectStr( ChooserID , "[SO_YES]" )
	else
		DialogSelectStr( ChooserID , YesOption );
	end
	if	NoOption == nil	then
		DialogSelectStr( ChooserID , "[SO_NO]" );
	else
		DialogSelectStr( ChooserID , NoOption );
	end
DeBugMSG(0,0,"DW_ChooseOneFromTwo is Done")
--等待倒數
	local result = LuaS_DialogRePort_TwoChoose(ChooserID)
	if	result == "Yes"	then
		CallPlot(OwnerID(),YesFunc,ChooserID)
	end
	if	result == "No"	then
		if	NoFunc == nil	then
DeBugMSG(0,0,"NoFunc == nil")
			return
		end
		CallPlot(OwnerID(),NoFunc,ChooserID)
	end
end
------------------------------------------------------------------------------------------------------------------------
--宏爺很偷懶 所以把幾個判斷合在一起
--1.判斷值是不是nil  2.判斷這個id還在不在 3.把這個id 刪掉
function DW_CheckThenDel(Obj)
	if	Obj == nil	then	return	end
	if	CheckID(Obj)	then	DelObj(Obj)	end
end
------------------------------------------------------------------------------------------------------------------------
--傳送到同一塊zone的旗子附近
--ObjID 想進行傳送的物件
--FlagGroup 旗子群組
--FlagID 旗子編號
--Rand 隨機
function DW_ChangeWithFlag(ObjID,FlagGroup,FlagID,Rand)
	if	ObjID == nil	or
		FlagGroup == nil	or
		FlagID == nil	then
		return
	end
	local Coordinate = {}
	Coordinate[1] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_X)
	Coordinate[2] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Y)
	Coordinate[3] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Z)
	Coordinate[4] = GetMoveFlagValue(FlagGroup,FlagID,EM_RoleValue_Dir)
	local NewCoordinate = {}
	if	Rand == nil	or
		Rand == 0	then
--沒有範圍要求就照辦
		ChangeZone(ObjID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),Coordinate[1],Coordinate[2],Coordinate[3],Coordinate[4])
	else
		NewCoordinate[1] = Coordinate[1]-DW_Rand(Rand)+DW_Rand(2*Rand)
		NewCoordinate[3] = Coordinate[3]-DW_Rand(Rand)+DW_Rand(2*Rand)
--調整到合適高度
		NewCoordinate[2] = GetHeight(NewCoordinate[1],Coordinate[2],NewCoordinate[3])
		NewCoordinate[4] = Coordinate[4]

		ChangeZone(ObjID,ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID),ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),NewCoordinate[1],NewCoordinate[2],NewCoordinate[3],NewCoordinate[4])
	end
end

------------------------------------------------------------------------------------------------------------------------
--無路徑移動至指定旗子
--ObjID 想進行移動的物件
--FlagGroup 旗子群組
--FlagID 旗子編號
--Enable 是否關閉 MoveToFlagEnabled 可不填，預設是關閉，填0則是不關閉
function DW_MoveDirectToFlag( ObjID , FlagObjID , FlagID , Enable  )
	if	Enable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	Enable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local Coordinate = {}
	Coordinate[1] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_X)
	Coordinate[2] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_Y)
	Coordinate[3] = GetMoveFlagValue(FlagObjID,FlagID,EM_RoleValue_Z)
	
	MoveDirect( ObjID, Coordinate[1] , Coordinate[2] , Coordinate[3] )
end
------------------------------------------------------------------------------------------------------------------------
--單次隨機移動(只會移動一次)
--ObjID 想進行移動的物件
--RandRange 想隨機移動的範圍(直徑)
-- IfEnable 是否要關閉MoveToFlagEnabled 預設是關，填1也是關，填其他的就不關
--V1 V2 V3 的填法影響使用何種隨機移動方式


function DW_MoveRand(ObjID,RandRange,IfEnable,V1,V2,V3)
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ
	if	V1 == nil	then
--以自己的座標範圍隨機移動
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX -(RandRange/2)+DW_Rand(RandRange)
			y = TempY 
			z = TempZ -(RandRange/2)+DW_Rand(RandRange)
			y = GetHeight(x,y,z)
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	elseif	V3~=nil	then
--以輸入的xyz座標移動
		for i=1,10,1 do
			x=V1-(RandRange/2)+DW_Rand(RandRange)
			y=V2
			z=V3-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
--以指定物件的位置隨機移動
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX-(RandRange/2)+DW_Rand(RandRange)
			y = TempY
			z = TempZ-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	else
--以輪入的旗標位置移動
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
		for i=1,10,1 do
			x=TempX -(RandRange/2)+DW_Rand(RandRange)
			y=TempY
			z=TempZ -(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	end
	MoveDirect( ObjID, x , y , z )
	return true
end

--輸入物件取得物件xyz座標==>回傳陣列
--Index 可不填
function DW_GetObjXYZ(Obj,Index)
	if	Index==nil	then
		return {
			ReadRoleValue(Obj,EM_RoleValue_X),
			ReadRoleValue(Obj,EM_RoleValue_Y),
			ReadRoleValue(Obj,EM_RoleValue_Z)
			}
	elseif	Index ==1	then
		return ReadRoleValue(Obj,EM_RoleValue_X)
	elseif	Index ==2	then
		return ReadRoleValue(Obj,EM_RoleValue_Y)
	elseif	Index ==3	then
		return ReadRoleValue(Obj,EM_RoleValue_Z)
	end
end
--輸入旗子編號取得旗子xyz座標&面向==>回傳陣列
--Index 可不填
function DW_GetFlagXYZ(FlagID,Num,Index)
	if	(FlagID==nil)or(Num==nil)then
		return 0
	end
	local Temp = {}
	if	Index==nil	then
		Temp = {
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_X),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Y),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Z),
				GetMoveFlagValue(FlagID,Num,EM_RoleValue_Dir),
				}
		return Temp
	elseif	Index==1	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_X)
	elseif	Index==2	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Y)
	elseif	Index==3	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Z)
	elseif	Index==4	then
		return GetMoveFlagValue(FlagID,Num,EM_RoleValue_Dir)
	else
		return 0
	end
end

--計算兩個座標的距離
--填入xyz
function DW_XYZCheckDis(X1,Y1,Z1,X2,Y2,Z2)
	if	Y1==nil	then
		return math.floor(((X1-X2)^2+(Z1+Z2)^2)^0.5)
	else
		local Total = math.floor((X1-X2)^2+(Y1-Y2)^2+(Z1-Z2)^2)
		local Final=math.floor(Total^0.5);
		return Final;
	end
end

--取得buff的累積等級
--Obj   想查的物件
--BuffID  想查的buff編號
function DW_GetBuffPowerLv(Obj,BuffID)
	if	BuffID == nil	or	Obj ==nil	then
		return false
	end
	if	CheckBuff(Obj,BuffID)==false	then
		return 0
	end
	local Pos = Lua_BuffPosSearch( Obj , BuffID )
	return	BuffInfo(Obj,Pos,EM_BuffInfoType_Power)
end



--確認是否有隊友跟Obj在同一塊zone  Obj可不填 那將直接使用OwnerID()
--未組隊回傳false
function DW_CheckPartyInSameZone(Obj)
	local Player
	if	Obj ==nil	then
		Player = OwnerID()
	else
		Player = Obj
	end
	local Result = false
	local PartyNum = GetPartyID( Player, -1 )
	local PartyID
	if	PartyNum ~= 0	then--有組隊狀態
		for i=0,PartyNum,1 do
			PartyID = GetPartyID( Player, i ) --逐一將隊員資料取出
			if	PartyID~=nil	and CheckID(PartyID)==true	and ReadRoleValue(PartyID,EM_RoleValue_IsPlayer)	and PartyID~=Player	then
			 --能找到隊友的ID 而且 屬於玩家
				Result = true
				break--跳出
			end
		end
	end
	return Result
end

--對所有仇恨列表中的玩家發送訊息並回傳仇恨列表(只包括玩家)
--mType為訊息類型：中央黃字(預設)、警告紅字、左下角訊息框
--String為訊息本文
--mColor為訊息顏色：填什麼就是什麼顏色，預設為原色碼
function DW_HateListMessage(Obj,mType,String,mColor)
	local AllObjCount = HateListCount(Obj)
	local AllObj = {}
	local Temp
	local Color = mColor
	local msg_Type = mType
	if	msg_Type==nil	then
		msg_Type=2--預設為中央黃字
	end
	if	Color==nil	then
		Color=0--預設為原色碼
	end
	for i=0,AllObjCount,1 do
		Temp = HateListInfo(Obj,i , EM_HateListInfoType_GItemID)
		if	Temp~=nil	then
			if	ReadRoleValue(Temp,EM_RoleValue_IsDead)==0	then
				if	ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==1	then
					ScriptMessage( Obj, Temp, msg_Type, String, Color )
					table.insert(AllObj,Temp)
				end
			end
		end
	end
	return AllObj
end


--關自己的對話框
--不用輸入的版本
function DW_CloseSpeak()
	local Obj = OwnerID()
	CloseSpeak(Obj)
end

--商店產生共用函式
function DW_InitialShopPlotSOP()
	--使用方式如下：
	--1.在NPC的PID填入商品編號+小地圖ICON(二位數)，若不顯示小地圖則填00
	--2.將此function 填在NPC的初始劇情
	local Obj = OwnerID()						--總宣告
	local PID = ReadRoleValue(Obj,EM_RoleValue_PID)			--取出PID
	if	PID ==0	then						--沒填就先跳過
		return false
	end
	local ShopNum,MapNum
	ShopNum = math.floor(PID/100)					--換算出商店編號
	SetShop(Obj,ShopNum,"")						--設定商店
	local IconList = 	{					--設定小圖示列表
				[0]=EM_MapIconType_Unknow        ,
				[1]=EM_MapIconType_NewQuest      ,	-- 新任務
				[2]=EM_MapIconType_UnfinishQuest ,	-- 未完成任務
				[3]=EM_MapIconType_FinishedQuest ,	-- 完成任務
				[4]=EM_MapIconType_TrustQuest    ,	-- 委託任務
				[5]=EM_MapIconType_Bank          ,	-- 銀行
				[6]=EM_MapIconType_MailBox       ,	-- 郵筒
				[7]=EM_MapIconType_FlightPoint   ,	-- 飛行點
				[8]=EM_MapIconType_AuctionHouse  ,	-- 拍賣所
				[9]=EM_MapIconType_Mine          ,	-- 採集點-礦
				[10]=EM_MapIconType_Wood          ,	-- 採集點-木
				[11]=EM_MapIconType_Herb          ,	-- 採集點-藥草
				[12]=EM_MapIconType_Inn           ,	-- 旅店
				[13]=EM_MapIconType_GuildMan      ,	-- 公會建立者
				[14]=EM_MapIconType_HouseMan      ,	-- 房屋管理者
				[15]=EM_MapIconType_Weapon        ,	-- 武器屋
				[16]=EM_MapIconType_Armor         ,	-- 防具屋
				[17]=EM_MapIconType_Potion        ,	-- 藥水店
				[18]=EM_MapIconType_Food          ,	-- 飲食店
				[19]=EM_MapIconType_Magic         ,	-- 魔法商店
				[20]=EM_MapIconType_Mat           ,	-- 材料行
				[21]=EM_MapIconType_Shop          ,	-- 雜貨店
				[22]=EM_MapIconType_Fish          ,	-- 漁具店
				[23]=EM_MapIconType_Recipe        ,	-- 配方
				[24]=EM_MapIconType_Warrior       ,	
				[25]=EM_MapIconType_Ranger        ,	
				[26]=EM_MapIconType_Rogue         ,	
				[27]=EM_MapIconType_Wizard        ,	
				[28]=EM_MapIconType_Priest        ,	
				[29]=EM_MapIconType_Knight        ,	
				[31]=EM_MapIconType_Flag          ,	
				[32]=EM_MapIconType_NPC           ,	
				[33]=EM_MapIconType_Player        ,	
				[34]=EM_MapIconType_TrackArrow    ,	
				[35]=EM_MapIconType_LotteryMan    ,	-- 彩券
				[36]=EM_MapIconType_VocationMan   	-- 職業管理員
				}
	if	PID%100~=0	then					--填00就不管
		MapNum = IconList[PID%100]
		SetMinimapIcon ( Obj, MapNum )				--填了就設對應的 請找上方的對照表
	end
end

--將一個物件送到另一個物件旁邊
function DW_ChangePosToObj(Obj,Target)
	if	Obj==nil	or
		Target==nil	then
		return false
	end
	local XYZ = DW_GetObjXYZ(Target)
	local ZoneID = LuaS_111256_ZoneID(ReadRoleValue(Target,EM_RoleValue_ZoneID))
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	ChangeZone(Obj,ZoneID,RoomID,XYZ[1],XYZ[2],XYZ[3],0)
end

--常用判斷;附近是否有接任務的玩家;回傳陣列
function DW_SearchPlayerHaveQuest(Obj,Range,QuestID)
	--以誰為中心搜尋
	--搜尋多大範圍
	--判斷的任務ID
	local TempPlayer = {}								--用暫存所有玩家列表
	TempPlayer = SearchRangePlayer ( Obj , Range )		--搜尋範圍內的所有玩家
	local ReturnPlayer = {}
	for index,value in pairs(TempPlayer) do				--逐一檢查
		if	CheckAcceptQuest(value,QuestID)==true	then		--若有接任務的玩家
			table.insert(ReturnPlayer,value)					--丟進將要回傳的table
		end
	end
	return ReturnPlayer
end

--以X.Y.Z.為基準點作Dis範圍內的隨機移動--執行一次走一次(無Sleep)
function lua_DavisRandMove(ItemID,X,Y,Z,Dis)
	if Dis <= 0 then Dis = 0 end
	if Dis >= 1000 then Dis = 1000 end 
	--ItemID 角色ID
	--Dis 亂走的範圍
	local X1,Y1,Z1
	if CheckID(ItemID) then
		local Cal =(math.pi/180)*(Rand(360) ) 
		X1 = X +(Dis*math.cos(Cal))
		Z1 = Z - (Dis*math.sin(Cal))
		Y1 = GetHeight( X1 , Y , Z1 );
		--Say(OwnerID(),"X = "..X1.."Z = "..Z1.."Y = "..Y1)
		for i = 1 , 9 , 1 do
			if CheckLine( OwnerID() , X1 , Y1 , Z1 ) == false then
				X1 = X +(Dis*math.cos(Cal))*(10-i)/10
				Z1 = Z -(Dis*math.sin(Cal))*(10-i)/10
				Y1 = GetHeight( X1 ,  Y , Z1 )
			else
				break
			end
		end
		--Say(OwnerID(),"X = "..X1.."Z = "..Z1.."Y = "..Y1)
		Move(  ItemID  , X1 , Y1  , Z1 )--用MOVE是因為位置附近的阻礙物不一定，避免因走不到位置而造成中斷
	else
		return Say(OwnerID(),"Error")
	end
end

--直接修改善惡值(1000~-1000之間
function Lua_Change_GoodEvil(Value)
	if Value > 1000 then
		Value = 1000
	elseif Value < -1000 then
		Value = -1000 
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_GoodEvil , Value )
end
function Lua_MovePosByXYZ( X,Y,Z, Dir, Dis,angle) --參考X,Y,Z,Dir，回傳距離Dis(正往前，負往後)的座標，面向角度(為回傳的面向偏離幾度，順時鐘)
	local Pos = {}
	local NewRole
	local Cal = (math.pi/180)*(Dir ) 
	Pos["X"] = X +(Dis*math.cos(Cal))
	Pos["Z"] = Z - (Dis*math.sin(Cal))
	Pos["Y"] = GetHeight( Pos["X"] , Y , Pos["Z"] );
	for i = 1 , 9 , 1 do
		if CheckLine( OwnerID() , Pos["X"] , Pos["Y"] , Pos["Z"] ) == false then
			Pos["X"] = X  +(Dis*math.cos(Cal))*(10-i)/10
			Pos["Z"] = Z -(Dis*math.sin(Cal))*(10-i)/10
			Pos["Y"] = GetHeight( Pos["X"] ,  Y , Pos["Z"] )
		else
			break
		end
	end
	Dir = Dir+angle
	if Dir >360 then
		Dir = Dir - 360
	end
	return Pos["X"]  , Pos["Y"] , Pos["Z"] , Dir
end

--調整setmodeex的狀態(欲調整的物件,布林值,想調整的項目...)
function DW_Modesetting(Obj,Boolin_In,...)
	for i=1,select("#",...)  do
		SetModeEx(Obj,select(i,...),Boolin_In);
	end
end


--新版的單純移動指令(迴圈)

function DW_Move(SType,Obj,Var1,Var2,Var3,Var4,Var5,Var6)
--回傳數字=成功到達,數字制同sleep(),
--"Stinking"是卡住
--"Fighting"是進入戰鬥
--"Dead"是死亡
--這是無窮迴圈function
--在玩家身上沒用的啦!
--除了必填資訊外的順序：Range==>IsSetMoveFlag==>IsLoadPath==>IsUpdateY
	if	SType==nil	then		return nil;	end
	if	Obj==nil	then		return nil;	end
	if	type(SType)~="string"	then	return nil;	end
	local FlagID,FlagSort,ReferObj,Range,IsSetMoveFlag,IsLoadPath,IsUpdateY
	local x,y,z
	if	SType=="xyz"	then
		if	type(Var1)~="table"	then
			return nil;
		end
		x=Var1[1];
		y=Var1[2];
		z=Var1[3];
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var2,Var3,Var4,Var5;
	elseif	SType=="obj"	then
		ReferObj = Var1;
		x=ReadRoleValue(ReferObj,EM_RoleValue_X);
		y=ReadRoleValue(ReferObj,EM_RoleValue_Y);
		z=ReadRoleValue(ReferObj,EM_RoleValue_Z);
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var2,Var3,Var4,Var5;
	elseif	SType=="flag"	then
		FlagID,FlagSort=Var1,Var2
		x=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_X);
		y=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_Y);
		z=GetMoveFlagValue(FlagID,FlagSort,EM_RoleValue_Z);
		Range,IsSetMoveFlag,IsLoadPath,IsUpdateY = Var3,Var4,Var5,Var6;
	else
		return nil;
	end
	if	Range~=nil and Range~=0	then
		x=x+DW_Rand(Range/2);
		z=z+DW_Rand(Range/2);
	end
	if	IsSetMoveFlag==true	then
		MoveToFlagEnabled(Obj, false);
	end

	local IsFighting,IsStink,IsArrived,IsDead = false,false,false,false;
	local TimeCount = 0
	local NX,NY,NZ,PX,PY,PZ=0,0,0,0,0,0;
	if	IsUpdateY==true	then
		y=GetHeight( x,y,z);
	end
	ReCalculate(Obj);
	if	IsLoadPath==true	then
		Move(Obj,x,y,z);
	else
		MoveDirect(Obj,x,y,z);
	end
	while	true	do
		NX = ReadRoleValue(Obj,EM_RoleValue_X);
		NY = ReadRoleValue(Obj,EM_RoleValue_Y);
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z);
		sleep(5);
		TimeCount = TimeCount+5;
		IsArrived = (((NX-x)^2+(NY-y)^2+(NZ-z)^2)<144);
		if	IsArrived==true	then
			return TimeCount;
		end
		IsStink = (((NX-PX)^2+(NY-PY)^2+(NZ-PZ)^2)==0);
		if	IsStink==true	then
			return "Stinking";
		end
		PX,PY,PZ = NX,NY,NZ;
		IsDead = (ReadRoleValue(Obj,EM_RoleValue_IsDead)==1);
		if	IsDead==true	then
			return "Dead";
		end
		IsFighting = (ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1) or (HateListCount(Obj)~=0);
		if	IsFighting==true	then
			return "Fighting";
		end
	end
end


-----------------------------移動至和目標的指定距離( Range) 後停下來(迴圈)------------------------
function DW_GetClose_EX(Obj,Target,Range)
--回傳數字=成功到達,數字為Obj和Target的距離
--"Stinking"是卡住
--"Fighting"是進入戰鬥
--"Dead"是死亡
--這是無窮迴圈function
--在玩家身上沒用的啦!
	if	Obj==nil	then		return nil;	end
	MoveToFlagEnabled(Obj, false);
	local x,y,z
	x=ReadRoleValue(Target,EM_RoleValue_X);
	y=ReadRoleValue(Target,EM_RoleValue_Y);
	z=ReadRoleValue(Target,EM_RoleValue_Z);

	local IsFighting,IsStink,IsArrived,IsDead = false,false,false,false;
	local NX,NY,NZ,PX,PY,PZ=0,0,0,0,0,0;
	Move(Obj,x,y,z);
	while	true	do
		NX = ReadRoleValue(Obj,EM_RoleValue_X);
		NY = ReadRoleValue(Obj,EM_RoleValue_Y);
		NZ = ReadRoleValue(Obj,EM_RoleValue_Z);
		sleep(5);
		IsArrived = (((NX-x)^2+(NY-y)^2+(NZ-z)^2)<Range^2);
		if	IsArrived==true	then
			return GetDistance(Obj,Target);
		end
		IsStink = (((NX-PX)^2+(NY-PY)^2+(NZ-PZ)^2)==0);
		if	IsStink==true	then
			return "Stinking";
		end
		PX,PY,PZ = NX,NY,NZ;
		IsDead = (ReadRoleValue(Obj,EM_RoleValue_IsDead)==1);
		if	IsDead==true	then
			return "Dead";
		end
		IsFighting = (ReadRoleValue(Obj,EM_RoleValue_IsAttackMode)==1) or (HateListCount(Obj)~=0);
		if	IsFighting==true	then
			return "Fighting";
		end
	end
end

--------------------------------Buff重設資訊--------------------------------------------------------
function DW_ResetBuff(Obj,Buff,Lv,Time,IsOccur)
--注意！這是用來更新buff資訊的
--Lv 要設定的Buff等級
--Time 要設定的剩餘時間
--IsOccur 是否要讓buff觸發結束時的事件(可不填)
	local IsOwnBuff = CheckBuff(Obj,Buff);
	if	IsOwnBuff==false	then
		return false;
	end
	if	IsOccur==nil or IsOccur==false	then
		CancelBuff_NoEvent(Obj,Buff);
	else
		CancelBuff(Obj,Buff);
	end
	Addbuff(Obj,Buff,Lv,Time);
	return true;
end



--------------------------------------------單次隨機移動(只會移動一次)-------------------------------------
--ObjID 想進行移動的物件
--RandRange 想隨機移動的範圍(直徑)
-- IfEnable 是否要關閉MoveToFlagEnabled 預設是關，填1也是關，填其他的就不關
--V1 V2 V3 的填法影響使用何種隨機移動方式


function DW_MoveRandPath(ObjID,RandRange,IfEnable,V1,V2,V3)
	if	IfEnable == nil	then
		MoveToFlagEnabled(ObjID, false)
	elseif	IfEnable == 1	then
		MoveToFlagEnabled(ObjID, false)
	end
	local x,y,z,TempX,TempY,TempZ
	if	V1 == nil	then
--以自己的座標範圍隨機移動
		TempX = ReadRoleValue(ObjID,EM_RoleValue_X)
		TempY = ReadRoleValue(ObjID,EM_RoleValue_Y)
		TempZ = ReadRoleValue(ObjID,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX -(RandRange/2)+DW_Rand(RandRange)
			y = TempY 
			z = TempZ -(RandRange/2)+DW_Rand(RandRange)
			y = GetHeight(x,y,z)
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	elseif	V3~=nil	then
--以輸入的xyz座標移動
		for i=1,10,1 do
			x=V1-(RandRange/2)+DW_Rand(RandRange)
			y=V2
			z=V3-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
--以指定物件的位置隨機移動
	elseif	V2 ==nil	then
		TempX = ReadRoleValue(V1,EM_RoleValue_X)
		TempY = ReadRoleValue(V1,EM_RoleValue_Y)
		TempZ = ReadRoleValue(V1,EM_RoleValue_Z)
		for i=1,10,1 do
			x = TempX-(RandRange/2)+DW_Rand(RandRange)
			y = TempY
			z = TempZ-(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	else
--以輪入的旗標位置移動
		TempX = GetMoveFlagValue(V1,V2,EM_RoleValue_X)
		TempY = GetMoveFlagValue(V1,V2,EM_RoleValue_Y)
		TempZ = GetMoveFlagValue(V1,V2,EM_RoleValue_Z)
		for i=1,10,1 do
			x=TempX -(RandRange/2)+DW_Rand(RandRange)
			y=TempY
			z=TempZ -(RandRange/2)+DW_Rand(RandRange)
			y=GetHeight( x , y , z )
			if i == 10	then
				return false
			end
			if	CheckLine( ObjID ,  x , y , z )==true	then
				break
			end
			if	math.abs(y-TempY)<45	then
				break
			end
		end
	end
	ReCalculate(ObjID);
	Move( ObjID, x , y , z )
	return true
end