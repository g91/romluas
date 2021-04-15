--index：KORS玩具箱(功能請隨意用，看不懂再問我>_O+)
--KORS_DelItemAll(intItem)		 刪除玩家身上所有相同物件
--lua_kors_recoverflag		 團補旗
--KORS_buffUpDown 		指定一個BUFF+-任意層數
--KORS_ObjMove 			單次移動指令
--KORS_RandMoveEx 		加強版亂數移動，附帶變速效果
--KORS_FirstPersonSee 		第一人稱視角
--KORS_DelItemAllEx 		泛用多件物品清除
--KORS_CreateObjCycle 		圓形暨範圍內產生物件
--KORS_CreateObjPosition		朝特定方位產生物件



function lua_BOMINEPAI(inT)
local player = OwnerID()
if inT == "powerColor" then
	local minebai = Az_RND_Ary(1,38,6)
	local sphow = RandRange(1,8)
		for i =1,#minebai do
			Say(player,minebai[i])
		end
			Say(player,"sp = "..sphow)
elseif inT == "lottery" then
	local minebai = Az_RND_Ary(1,38,6)
	local sphow = RandRange(1,8)
		for i =1,#minebai do
			Say(player,minebai[i])
	end
end
end	



-------------------------------------------------------------
--KORS_DelItemAll(intItem)

-------------------------------------------------------------
function KORS_DelItemAll(intItem)
local player = OwnerID()
local count = CountBodyItem(player,intItem)
	if count ~= 0 then
		DelBodyItem(player,intItem,count)
	elseif count == 0 or count == nil then
		ScriptMessage(player,player,1,"No Item Del",C_SYSTEM)
	end
end

----KORS團補旗
----會創造一個物件對範圍250內的使用者以及隊友恢復生命。
----intF = 想要當中心點得物件，補完會刪除
----intHP = 想要補的%
----intT = 希望補幾次
----intSc =每次補之間的間隔
function lua_kors_recoverflag(intF,intHP,intT,intSc)
local OID = OwnerID()
local flag = intF
	if intF == nil then
		flag = 120064
	end
local HP = intHP
local time = intT
local timerange = intSc
local NPC 
local X = ReadRoleValue( OID, EM_RoleValue_X )
local Y = ReadRoleValue( OID , EM_RoleValue_Y )
local Z = ReadRoleValue( OID , EM_RoleValue_Z )
local Dir = ReadRoleValue( OID , EM_RoleValue_Dir )
		NPC = CreateObj ( flag , X , Y , Z , dir , 1 )
		MoveToFlagEnabled(NPC,FALSE)
		WriteRoleValue( NPC ,EM_RoleValue_PID , OID )
		WriteRoleValue ( NPC , EM_RoleValue_Register1 , HP )
		WriteRoleValue ( NPC , EM_RoleValue_Register2 , time )
		WriteRoleValue ( NPC , EM_RoleValue_Register3 , timerange )
		AddToPartition ( NPC ,0 )
		BeginPlot( NPC ,"lua_kors_recover_flaguse" , 0 )
end

function lua_kors_recover_flaguse()
local OID =  OwnerID()
local room = ReadRoleValue( OID ,EM_RoleValue_RoomID)
local player = ReadRoleValue(OID ,EM_RoleValue_PID)
local HP = ReadRoleValue( OID ,EM_RoleValue_Register1)
local timeS = ReadRoleValue( OID , EM_RoleValue_Register2)
local timeR = ReadRoleValue( OID , EM_RoleValue_Register3 )
local pcount = GetPartyID( player , -1 )
local time = 0
	if pcount ~= 0 then
		while time ~=  timeS  do
			for i = 1 , pcount , 1 do
				local party = GetPartyID(player , i )
				if party ~= 0 then
					if ReadRoleValue(party,EM_RoleValue_RoomID ) == room  then
					SysCastSpellLv(OID,party,498915,HP-1) 
					end
				end
			end
			time =time +1
		Sleep(timeR)
		end
		if time == timeS then
			DelObj( OID )
		end
	elseif pcount == 0 then
		while time ~= timeS  do
				if ReadRoleValue(player,EM_RoleValue_RoomID ) == room then
					SysCastSpellLv(OID,player,498915,HP-1) 
				end
			time = time+1
		Sleep(timeR)
		end
		if time == timeS then
		DelObj( OID )
		end
	end
end


---- KORSBUFF+-層數
-------------------------------------------------------------
----指定一個BUFF+N層或者-N層
----+層數為0，-層數為1
----等級不填時預設1，時間不填時預設-1
-------------------------------------------------------------
function KORS_buffUpDown( ObjID , BuffID , UpDown , Level ,time )
local effect = time
	if time == nil then
		effect = -1 
	end
	if Level == nil then
		Level = 1
	end
	if CheckBuff( ObjID , BuffID )  == TRUE then
	local pos = Lua_BuffPosSearch( ObjID, BuffID )
	local lv = BuffInfo( ObjID, pos , EM_BuffInfoType_Power )
--		Say(ObjID , lv )
--				Say(ObjID , lv+level )
		if UpDown == 0 then
			CancelBuff( ObjID , BuffID )
			AddBuff( ObjID , BuffID , lv+Level , effect )			
		elseif UpDown == 1 then
			CancelBuff(ObjID ,BuffID )
			if (lv - Level ) >=0 then
			AddBuff( ObjID , BuffID , lv-Level , effect )
			end
		end
	elseif CheckBuff( ObjID ,  BuffID) == FALSE then
		if UpDown == 0 then
		AddBuff(ObjID , BuffID , Level -1 , effect )
		end
	end
end

--------------------------------------------------------------------------------------------
---- KORS_ObjMove( ObjID , MoveWay , MoveDis )
---- 移動物件指令，可設定物件移動跟移動方式
---- MoveWay = 0時朝使用者面對方移動， =1 時隨機亂數方向移動 ，=2時朝物件原面向移動
---- MoveDis = 移動距離
--------------------------------------------------------------------------------------------
function KORS_ObjMove( ObjID , MoveWay , MoveDis )
local TID = ObjID
local OID = OwnerID()
local OrgX = ReadRoleValue( TID, EM_RoleValue_X )
local OrgY = ReadRoleValue( TID , EM_RoleValue_Y )
local OrgZ = ReadRoleValue( TID , EM_RoleValue_Z )
local OrgD = ReadRoleValue( TID ,EM_RoleValue_Dir)
	if MoveWay == 0 then
		OrgD = ReadRoleValue( OID ,EM_RoleValue_Dir)
	end
local distable= MoveDis
local flyDir = (math.pi/180)*(OrgD)				--讀取飛行面向
	if MoveWay == 1 then
		local pei = Rand(360)
		flyDir = (math.pi/pei)*(OrgD)
	elseif MoveWay == 2 then
		flyDir = OrgD
	end
	X = OrgX +(distable*math.cos(flyDir))		--計算X邊長
	Z =OrgZ - (distable*math.sin(flyDir))		--計算Z軸長
		Move(TID,X,OrgY,Z)			--移動物件
end


function KORS_MoveToTarget(intOid,intTarget)
local movX = ReadRoleValue(intTarget,EM_RoleValue_X)
local movY = ReadRoleValue(intTarget,EM_RoleValue_Y)
local movZ = ReadRoleValue(intTarget,EM_RoleValue_Z)
	Move(intOid,movX,movY,movZ)
end


--------------------------------------------------------------------------------------------
----KORS_RandMoveEx( ObjID , MoveDis , MoveTime , MoveSpeed , MSpeedEX )
----亂數移動加強版
----MoveDis = 移動的範圍
----MoveTime = 間隔的秒數
---- MoveSpeed = 移動的速度(%數計算)
----SpeedEX = 是否變速(預設不變，填1變速，"Walker"換走路)
--------------------------------------------------------------------------------------------
function KORS_RandMoveEx( ObjID , MoveDis , MoveTime , MoveSpeed , MSpeedEX )
local MoveD = Rand(MoveDis)+1
local time = (MoveTime*10)
local centerX = ReadRoleValue( ObjID , EM_RoleValue_X )
local centerY = ReadRoleValue( ObjID , EM_RoleValue_Y )
local centerZ = ReadRoleValue( ObjID , EM_RoleValue_Z )
local centerDir = ReadRoleValue( ObjID , EM_RoleValue_Dir )
local movX
local movY = centerY
local movZ
local movDir
local SpeedLv = math.abs(MoveSpeed)
local SpeedEX = MSpeedEX
	if MSpeedEX == nil then
		SpeedEX = 0
	elseif MSpeedEX == "Walker" then
		SetModeEx( ObjID , EM_RoleValue_IsWalk , 2 )
		SpeedEX = 0
	end
	while TRUE do
		if SpeedEX == 0 then
			if MoveSpeed > 0 then
				AddBuff( ObjID , 621805 , SpeedLv-1 , MoveTime)
			elseif MoveSpeed < 0 then	
				AddBuff( ObjID , 621806 , SpeedLv-1,MoveTime)
			end
		elseif  SpeedEX  == 1 then
			local lv = Rand(SpeedLv)
			if  MoveSpeed > 0 then
				AddBuff( ObjID , 621805 , lv , MoveTime)
			elseif MoveSpeed < 0 then
				AddBuff( ObjID , 621806 , lv , MoveTime ) 
			end
		end
		local distable = Rand(MoveDis)+1
		local pei = Rand(360)+1
		local flyDir = (math.pi/pei)*(centerDir)	
			movX = centerX +(distable*math.cos(flyDir))	
			movZ = centerZ + (distable*math.sin(flyDir))
		Move( ObjID , movX ,movY , movZ )
	Sleep(time)
	end
end			

-----------------------------------------------------------------------------------------------
----KORS_FirstPersonSee(intObj,switch)
----第一人稱視角
----算是暫時作出來，使用上會有很多限制。使用後禁止移動
---- intObj == 希望誰第一人稱視角、switch =="ON","Off"
-----------------------------------------------------------------------------------------------
function KORS_FirstPersonSee(intObj,switch)
local person = intObj
local HBOX = 120379
local FseeTop 
local OFFON
local Walk
	if switch == "ON" or switch == nil then
		OFFON = 1
	elseif  switch == "Off" then
		OFFON = 0
	end

	if OFFON == 1 then									--開
	 	FseeTop = CreateObj_ByObjPoint( person, HBOX ,"P_Top" )
			SetModeEx( FseeTop, EM_SetModeType_Show, FALSE )			--顯示
			SetModeEx( FseeTop, EM_SetModeType_ShowRoleHead, FALSE )		--頭像框
			SetModeEx( FseeTop, EM_SetModeType_SearchenemyIgnore, false )	--被搜尋
			SetModeEx( FseeTop, EM_SetModeType_Obstruct, TRUE )			--阻擋
			SetModeEx(FseeTop, EM_SetModeType_Mark,FALSE  )			--標記
			WriteRoleValue ( FseeTop, EM_RoleValue_PID , person ) 			--記住玩家
			WriteRoleValue(person,EM_RoleValue_Register10,FseeTop)			
			AddToPartition(FseeTop,0)
			BeginPlot(FseeTop,"KORS_FPS_CHECK",0)					--玩家離線檢查

		
		local TopX = ReadRoleValue(FseeTop,EM_RoleValue_X)
		local TopY = ReadRoleValue(FseeTop,EM_RoleValue_Y)
		local TopZ = ReadRoleValue(FseeTop,EM_RoleValue_Z)
		local personDir = ReadRoleValue(person,EM_RoleValue_Dir)
			Move(FseeTop,TopX,(TopY-2),TopZ)
		local playerX = ReadRoleValue(person,EM_RoleValue_X)
		local playerY = ReadRoleValue(person,EM_RoleValue_Y)
		local playerZ = ReadRoleValue(person,EM_RoleValue_Z)
	

		local mathDir = ( math.pi / 180 ) * personDir
		local Radius = 4
		local FPS ={}
			for i = 1, 3 do 
				local Angle = i * 90
				local Radian = ( math.pi / 180 ) * Angle
				local MathX = playerX + ( Radius * math.cos( Radian+mathDir) )
				local MathZ = playerZ - ( Radius * math.sin( Radian+mathDir) )
				FPS[i] =  CreateObj(HBOX,MathX,(playerY+14),MathZ, (personDir) ,1)
				MoveToFlagEnabled(FPS[i],FALSE)
				SetModeEx( FPS[i], EM_SetModeType_Show, FALSE )			--顯示
				SetModeEx( FPS[i], EM_SetModeType_ShowRoleHead, FALSE )		--頭像框
				SetModeEx( FPS[i], EM_SetModeType_SearchenemyIgnore, false )		--被搜尋
				SetModeEx( FPS[i], EM_SetModeType_Obstruct, TRUE )			--阻擋
				SetModeEx( FPS[i], EM_SetModeType_Mark,FALSE  )			--標記
				SetModeEx( FPS[i], EM_SetModeType_Gravity, FALSE )			--重力關掉
				WriteRoleValue(FseeTop,EM_RoleValue_Register+i,FPS[i])
				AddToPartition(FPS[i],0)
			end	
	elseif OFFON == 0 then										--關
		local FseeTop = ReadRoleValue(person,EM_RoleValue_Register10)
			for i = 1, 3 do
			local ObsObj = ReadRoleValue(FseeTop,EM_RoleValue_Register+i)
				DelObj(ObsObj)
			end
			
		DelObj(FseeTop)		
	end	
end

function KORS_FPS_CHECK()
local OID = OwnerID()
local person = ReadRoleValue(OID,EM_RoleValue_PID)
	while TRUE do
	if CheckID(person) == FALSE then
		for i = 1,3 do
		local ObsObj = ReadRoleValue(OID,EM_RoleValue_Register+i)
			DelObj(ObsObj)
		end
	DelObj(OID)
	end	
	Sleep(10)
	end
end

--------------------------------------------------------------
--KORS_DelItemAllEx(intTable)
--泛用型物品全清除
--需要INT清除名單TABLE
--------------------------------------------------------------
function KORS_DelItemAllEx(intTable)
local player = OwnerID()
local Del = intTable
	if intTable == nil then
		ScriptMessage(player,player,1,"table false",C_SYSTEM)
		return
	end

	for i = 1, #Del ,1 do
		if (Del[i]/1000) >= 200 and  (Del[i]/1000) < 250 then
		local count = CountBodyItem(player, Del[i])
			if count ~= 0 then
				DelBodyItem(player,Del[i],count)
			end
		elseif (Del[i]/1000) >=540 and (Del[i]/1000) < 550 then
			SetFlag(player,Del[i],0)
		elseif (Del[i]/1000) >=500 and  (Del[i]/1000) < 510  then
			CancelBuff_NoEvent(player,Del[i])
		elseif  (Del[i]/1000) >=620 and  (Del[i]/1000) < 629  then
			CancelBuff_NoEvent(player,Del[i])
		end
	end
end

--------------------------------------------------------------------------------------------------------------------------------
--KORS_CreateObjCycle
--圓形暨範圍內隨機產生物件，產生後回傳Table。須手動ADDTOPARTITION
--intCen = 中心點物件，intNum =產生數量，intRange = 半徑範圍。
--modeEX == "None" 時以半徑範為產生圓形環繞玩家
--	    == "Rand" 時在範圍內隨機位置產生。
-------------------------------------------------------------------------------------------------------------------------------	

function KORS_CreateObjCycle(intObj,intCen,intNum,intRange,modeEX)
local center = intCen
local temp ={}
local Num = intNum
local centerX = ReadRoleValue(center,EM_RoleValue_X)
local centerY = ReadRoleValue(center,EM_RoleValue_Y)
local centerZ = ReadRoleValue(center,EM_RoleValue_Z)
local centerDir = ReadRoleValue(center,EM_RoleValue_Dir)
	for i = 1, Num do
		if modeEX == "None" then
			local mathDir = (math.pi/180)*centerDir
			local mathCo = 360/Num

			local Angle = i * mathCo
			local Radian = ( math.pi / 180 ) * Angle
			local Radius = intRange
			
			local MathX = centerX + ( Radius * math.cos( Radian+mathDir) )
			local MathZ = centerZ - ( Radius * math.sin( Radian+mathDir) )

			temp[i]=CreateObj(intObj,MathX,centerY,MathZ,centerDir,1)
		elseif modeEX == "Rand" then
			local mathDir = (math.pi/180)*centerDir
			local mathCo = RandRange(1,360)

			local Radian = ( math.pi / 180 ) * mathCo
			local Radius = RandRange(1,intRange)
			
			local MathX = centerX + ( Radius * math.cos( Radian+mathDir) )
			local MathZ = centerZ - ( Radius * math.sin( Radian+mathDir) )

			temp[i] = CreateObj(intObj,MathX,centerY,MathZ,centerDir,1)

		end
	end

	return temp
end

--------------------------------------------------------------------------------------------------------------------------------
--KORS_CreateObjPosition(intObj,intCen,intDis,intPos)
--朝方位產生物件，內建前後左右。產生後回傳物件GUID。須手動ADDTOPARTITION。
-- intDis = 物件要離多遠
--intPos  = 方位，預設"front"、"back"、"Left"、"Right"。也可以自行填入角度
--------------------------------------------------------------------------------------------------------------------------------
function KORS_CreateObjPosition(intObj,intCen,intDis,intPos)
local center = intCen
	if intCen == nil then
		center = OwnerID()
	end
local pos = intPos
	if intPos == "front" then
		pos = 360
	elseif intPos == "back" then
		pos = 180
	elseif intPos == "Left" then
		pos = 270
	elseif intPos == "Right" then
		pos = 90
	end
local centerX = ReadRoleValue(center,EM_RoleValue_X)
local centerY = ReadRoleValue(center,EM_RoleValue_Y)
local centerZ = ReadRoleValue(center,EM_RoleValue_Z)
local centerDir = ReadRoleValue(center,EM_RoleValue_Dir)
local mathDir = ( math.pi / 180 ) * centerDir
local Radius = intDis
local Angle = pos
local Radian = ( math.pi / 180 ) * Angle
local MathX = centerX + ( Radius * math.cos( Radian+mathDir) )
local MathZ = centerZ - ( Radius * math.sin( Radian+mathDir) )
local born = CreateObj(intObj,MathX,centerY,MathZ, centerDir ,1)
	return born	
end	

------------------------------------------------------------------------------------------------
--KORS_MoveByObj(intObj,intTag)
--參考物件位置移動
------------------------------------------------------------------------------------------------

function KORS_MoveByObj(intObj,intTag)
local tagX = ReadRoleValue(intTag,EM_RoleValue_X)
local tagY = ReadRoleValue(intTag,EM_RoleValue_Y)
local tagZ = ReadRoleValue(intTag,EM_RoleValue_Z)
	Move(intObj ,tagX ,tagY ,tagZ)
end

----------------------------------------------------------------------------------------------
----KORS_SetSearch(intCen,intRange,Type)
----綜合範圍搜尋器
---intCen 作為中心的角色代號，intRange 搜索範圍，Type =="NPC" or "player" or "ALL"
----------------------------------------------------------------------------------------------
function KORS_SetSearch(intCen,intRange,Type)
local Ret = {}
local Obj;
local Count = SetSearchRangeInfo( intCen,intRange )
local SetType = 0
local IDcount = 1
	if Type == "NPC" then
		SetType = 0
	elseif Type == "player" then
		SetType = 1
	elseif Type == "ALL" or Type == nil then
		SetType = 2
	end

	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if SetType == 0 then
			if ReadRoleValue(ID,EM_RoleValue_IsPlayer) == 0 then
				Ret[IDcount] = ID
				IDcount = IDcount +1
			end
		elseif SetType == 1 then
			if ReadRoleValue(ID,EM_RoleValue_IsNPC) == 0 then
				Ret[IDcount] = ID
				IDcount = IDcount +1
			end
		elseif SetType == 2 then
			Ret[IDcount] = ID
			IDcount = IDcount +1
		end	
	end	
	return Ret;
end

function Lua_HIDE()
local obj = OwnerID()
	SetModeEx( obj, EM_SetModeType_Show, FALSE )			--顯示
	SetModeEx( obj, EM_SetModeType_ShowRoleHead, FALSE )		--頭像框
	SetModeEx( obj, EM_SetModeType_SearchenemyIgnore, false )		--被搜尋
	SetModeEx( obj, EM_SetModeType_Obstruct, false )			--阻擋
	SetModeEx(obj, EM_SetModeType_Mark,FALSE  )			--標記

end