
--================================陣列===================================--

function KS_NewArrayCopy( Array )--新陣列複製舊陣列 記憶體各別存取
	local Obj = {}
		for i=1, table.getn(Array) do
			table.insert( obj, Array[i] )		
		end
	return Obj
end

function KS_ClearArray( Array )--釋放陣列
	for i=1, table.getn(Array) do
		if Array[i] ~= nil then
			table.remove( Array, i )
		end
	end
end

--================================亂數===================================--

function KS_RandArray( Num, Max, Min, Negative )--亂數表( Num = 數量; Max/Min = 亂數範圍; 允許負數(true/false) )
	local obj = {}
	if Min == nil then Min = 0 end
	math.randomseed(math.random(10000, 99999))
	local rnd

	for i=1, Num do
		if Min > 0 then
			rnd = math.random(Max-Min)+Min
		else
			rnd = math.random(Max)
		end
		if Negative == true or Negative == 1 then
			if Min > 0 then
				rnd = rnd - math.random(Max-Min)-Min
			else
				rnd = rnd - math.random(Max)
			end
		end
		debugmsg(0,0,"rnd = "..rnd)
		table.insert( obj, rnd )
	end
	return obj
end

function KS_RegroupArray( Array, num )--陣列重組/亂數取N個值(num = nil 則全取)
	local obj = {}
	local ArrayNum
	local site
	local NewArray = KS_NewArrayCopy( Array )
	math.randomseed(math.random(10000, 99999))
	if num == nil or num <= 0 then
		num = table.getn(NewArray)
	end
	for i=1, num do
		ArrayNum = table.getn(NewArray)
		if ArrayNum > 0 then 
			site = math.random(ArrayNum)
			table.insert( obj, NewArray[site] )
			table.remove( NewArray, site )
		end
	end
	return obj
end

-------------------------------------------------Buff--------------------------------------------

function KS_GetColdown( Obj, MagicID )--取得技能冷卻
	local Type  = GameObjInfo_Int( MagicID, "ColdownType" ) -- 抓這個法術的冷卻類別
	return ReadRoleValue( Obj, EM_RoleValue_Coldown_Job + Type  )	
end

function KS_ResetColdown( Obj, MagicID, Time )--清除指定法術 CD
	if MagicID == nil then
		WriteRoleValue( Obj, EM_RoleValue_Coldown_All , 0 )
	else
		local Type  = GameObjInfo_Int( MagicID, "ColdownType" ) -- 抓這個法術的冷卻類別
		if time <= 0 or time == nil then
			WriteRoleValue( Obj, EM_RoleValue_Coldown_Job + Type , 0 )
		else
			local Now = ReadRoleValue( Obj, EM_RoleValue_Coldown_Job + Type  )
			if Time > Now then
				WriteRoleValue( Obj, EM_RoleValue_Coldown_Job + Type , 0 )
			else
				WriteRoleValue( Obj, EM_RoleValue_Coldown_Job + Type , Now - Time )
			end
		end
	end
end

function KS_CheckBuffLV( Obj, BuffID )--取得指定物件身上BUFF等級
	if CheckBuff( Obj, BuffID ) == true then
		local pos = Lua_BuffPosSearch( Obj, BuffID )
		local lv = BuffInfo( Obj, pos, EM_BuffInfoType_Power )
		return lv+1
	else
		return 0
	end
end

function KS_ClearBuffLV( Obj, BuffID, Lv, Event )--清除物件(Obj)身上BuffID 層數(Lv) 觸發效果(Event) 
	if CheckBuff( Obj, BuffID ) == true then
		local pos = Lua_BuffPosSearch( Obj, BuffID )
		local level = BuffInfo( Obj, pos, EM_BuffInfoType_Power )
		local time = BuffInfo( Obj, pos, EM_BuffInfoType_Time )
		Event = Event or false
		if Event == true or Evemt == 1 then
			CancelBuff( Obj, BuffID )
		else
			CancelBuff_NoEvent( Obj , BuffID )
		end
		if Lv ~= nil and Lv <= level then
			AddBuff( obj, BuffID, level -Lv, time )
		end
	end
end

---------------------------------------物件移動--------------------------------------------------------

function ks_MoveToFlag( RoleID, FlagGroup, FlagID, RndRange ) --對象(RoleID)移動到指定旗標位置
	local rnd= 0
	if RndRange > 0 and RndRange ~=nil then
		rnd = rand( RndRange )
	end
	local RndMove = { 	[1] = 1+rnd,
			[2] = 1-rnd }

	local x = GetMoveFlagValue( FlagGroup, FlagID , EM_RoleValue_X )
	local y = GetMoveFlagValue( FlagGroup, FlagID , EM_RoleValue_Y )
	local z = GetMoveFlagValue( FlagGroup, FlagID , EM_RoleValue_Z )
	local time = MoveDirect( RoleID, x+RndMove[rand(2)+1] , y , z+RndMove[rand(2)+1] )
	return time
end

function ks_MoveToObj( RoleID, ObjID, RndRange ) --對象(RoleID)移動到指定對象(Obj)位置
	local rnd= 0
	if RndRange > 0 and RndRange ~= nil then
		rnd = rand( RndRange )
	end
	local RndMove = { 	[1] = 1+rnd,
			[2] = 1-rnd }

	local x = ReadRoleValue( ObjID, EM_RoleValue_X )
	local y = ReadRoleValue( ObjID, EM_RoleValue_Y )
	local z = ReadRoleValue( ObjID, EM_RoleValue_Z )
	local time = MoveDirect( RoleID, x+RndMove[rand(2)+1] , y , z+RndMove[rand(2)+1] )
	return time
end

function ks_Move( RoleID, Range, var1, var2, var3, CheckRange ) --對象(RoleID)移動到指定位置
	local x=0
	local y=0
	local z=0
	Range = Range or 0

	if var1 ~= nil and var2 ~= nil and var3 ~= nil then
		x = var1
		y = var2
		z = var3
	elseif var1 ~= nil and var2 ~=nil then
		x = GetMoveFlagValue( var1, var2, EM_RoleValue_X )
		y = GetMoveFlagValue( var1, var2, EM_RoleValue_Y )
		z = GetMoveFlagValue( var1, var2, EM_RoleValue_Z )
	elseif  var1 ~= nil then
		x = ReadRoleValue( var1, EM_RoleValue_X )
		y = ReadRoleValue( var1, EM_RoleValue_Y )
		z = ReadRoleValue( var1, EM_RoleValue_Z )
	else
		x = ReadRoleValue( RoleID, EM_RoleValue_X )
		y = ReadRoleValue( RoleID, EM_RoleValue_Y )
		z = ReadRoleValue( RoleID, EM_RoleValue_Z )
	end

	Y = GetHeight( X, Y, Z )
	local time = MoveDirect( RoleID, x+math.random(-Range,Range) , y , z+math.random(-Range,Range)  )
	
	if CheckRange == nil then
		return time
	else
		if CheckRange < Range then CheckRange = Range end
		
		while true do
			ObjX = ReadRoleValue( RoleID, EM_RoleValue_X )
			ObjZ = ReadRoleValue( RoleID, EM_RoleValue_Z )
			local DisX = ( x - X1 )^2
			local DisZ = ( z - Z1 )^2
			local Dis = math.floor( (DisX+DisZ)^0.5)
			if Dis <= CheckRange then	-- 走到定點設定下一點位置
				break
			end
			Sleep(10)
		end
	end
end

-----------------------------點擊物件取得物品----------------------------------------

function ks_SquatGetItem( target, item, num, time )	-- 要求目標(target玩家) 蹲下->撿取->獲得物品(item) 數量(num)
	local CastBarStatus
	local O_ID = OwnerID() -- 點擊物件
	if ReadRoleValue( O_ID, EM_RoleValue_Register3 ) == 1 then
		ScriptMessage( O_ID, target, 1, "[SYS_AUCTION_WAIT_NEXT]", 0 )	--忙碌中，請稍候再試。
	else 
		BeginCastBar( target, "[SC_RUNRUNPUMPKIN_05]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0 )--蹲下撿取
		WriteRoleValue( O_ID , EM_RoleValue_Register3, 1 )			
		while true do
			sleep( 2 )
			CastBarStatus = CheckCastBar( target )
			if ( CastBarStatus > 0) then --點擊成功
				GiveBodyItem( target, item, num )				
				if time > 0 then
					CallPlot( O_ID, "ks_resetObj", O_ID, time )
				elseif time == 0 or type == nil then
					BeginPlot( O_ID, "ks_CreateObj_reset", 0 )
				end
				EndCastBar( target, CastBarStatus )
				SetPlot( O_ID, "touch", "", 0 )
				WriteRoleValue( O_ID, EM_RoleValue_Register3, 0 )
				break
			elseif ( CastBarStatus < 0 ) then --點擊中斷
				WriteRoleValue( O_ID, EM_RoleValue_Register3, 0 )
				EndCastBar( target, CastBarStatus )
				break
			end			
		end		
	end	
end	

function ks_resetObj( Obj, time, BuffID )--重置物件
	if time ~= nil and time >= 0 then
		if ReadRoleValue( Obj, EM_RoleValue_CampID ) ~= 6 then
			local count = BuffCount(Obj )
			for i = 1 , count do
				CancelBuff( Obj  , BuffInfo( Obj , count-i, EM_BuffInfoType_BuffID) )
			end
			SetStopAttack( Obj );
			ClearHateList( Obj, -1 );
			WriteRoleValue( Obj, EM_RoleValue_HP, ReadRoleValue( Obj, EM_RoleValue_MaxHP ) );--滿血
		end
		DelFromPartition( Obj )
		Sleep( time*10 )
		ReSetNPCInfo( Obj ) 	-- 重設NPC資料
		local RoomID = ReadRoleValue( Obj, EM_RoleValue_RoomID )
		AddToPartition( Obj, RoomID ) 	-- 重新加入分割區
		if BuffID ~= nil then
			AddBuff( Obj, BuffID, 0, -1 )
		end
	else
		local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
		Hide(Obj)
		local NewObj = LuaFunc_CreateObjByObj( OrgID, Obj )
		DelObj(Obj)
		return NewObj
	end
end

----------------------------------------物件重置---------------------------------------------------------

function ks_CreateObj_reset( Delete, Obj )--Delete (是否刪除); Obj (對象)
	if Obj == nil then Obj = OwnerID() end
	local counter = ReadRoleValue( Obj, EM_RoleValue_Register1 )	
	local Flag = ReadRoleValue( Obj, EM_RoleValue_Register2 )
	local OrgID = ReadRoleValue( Obj, EM_RoleValue_OrgID )
	local count = ReadRoleValue( counter, EM_RoleValue_Register1 )
	WriteRoleValue( counter, EM_RoleValue_Register1, count-1 )
	WriteRoleValue( counter, EM_RoleValue_Register2, Flag )
	WriteRoleValue( counter, EM_RoleValue_Register3, OrgID )
	if Delete == nil or Delete == true then
		Sleep(10)
		DelObj( Obj )
	end
end

function ks_CreateObj_test()
	while true do
		local counter = ReadRoleValue( OwnerID(), EM_RoleValue_Register1 )	
		local Flag = ReadRoleValue( OwnerID(), EM_RoleValue_Register2 ) 
		local count = ReadRoleValue( counter, EM_RoleValue_Register1 )
		debugmsg( 0, 0, "OwnerID =  "..OwnerID() )
		debugmsg( 0, 0, "counter =  "..counter )
		debugmsg( 0, 0, "count =  "..count )
		debugmsg( 0, 0, "flag =  "..flag )
		Sleep(10)
	end
end

---------------------------------------------物件產生-------------------------------------------------------

function KS_CreateObjMode( ObjID, var1, var2,  Range, ObjNum, Add, min )
	-- ObjID(物件ID), var1+var2(旗標位置), only var1(參考物件位置) Range(產生範圍), 
	--ObjNum(產生數量), Add(1 or true 是否AddToPartition  ) min (最小產生距離)
	local x
	local y
	local z
	local dir
	local RoomID
	local obj = {}
	
	if var1 ~= nil and var2 ~= nil then	--旗標位置產生
		x = GetMoveFlagValue( var1, var2, EM_RoleValue_X )
		y = GetMoveFlagValue( var1, var2, EM_RoleValue_Y )
		z = GetMoveFlagValue( var1, var2, EM_RoleValue_Z ) 
		dir = GetMoveFlagValue( var1, var2, EM_RoleValue_Dir )
		RoomID = GetMoveFlagValue( var1, var2, EM_RoleValue_RoomID )
	elseif var1 ~= nil and CheckID(var1) == true then --物件位置產生
		x = ReadRoleValue( var1, EM_RoleValue_X )
		y = ReadRoleValue( var1, EM_RoleValue_Y )
		z = ReadRoleValue( var1, EM_RoleValue_Z )
		dir = ReadRoleValue( var1, EM_RoleValue_Dir )
		RoomID = ReadRoleValue( var1, EM_RoleValue_RoomID )
	end
	
	local rnd1 = rand( Range )
	local rnd2 = rand( Range )
	min = min or 1

	local RndSite = {}
	RndSite[1] = min+rnd1
	RndSite[2] = 1-rnd1-min
	RndSite[3] = min+rnd2
	RndSite[4] = 1-rnd2-min

	y = GetHeight(  x , y , z )
	for i = 1 , ObjNum do
		obj[i] = CreateObj ( ObjID, x+RndSite[rand(4)+1], y , z+RndSite[rand(4)+1] , dir , 1 )
		if Add == 1 or Add == true then
			AddToPartition( Obj[i] , RoomID )
		end
	end
	
	if ObjNum == 1 then
		return obj[1]
	elseif ObjNum > 1 then
		return obj
	end
end

function ks_BornByMultilateral( ObjID, var1, var2, Num , dis )	--在周圍用ObjID 圍成 Num 角形
	-- ObjID(物件ID), var1(旗標ID) , var2(旗標位置), Num(產生數量), dis(產生距離)
	-- ObjID(物件ID),  var1(指定物件位置), var2(nil), Num(產生數量), dis(產生距離)
	local MonsterGroup = {}
	local RoomID
	local X
	local Z

	if factor == nil or factor < 0 then factor = 1 end
	if var1 ~= nil and var2 ~= nil then	--旗標位置產生
		BaseX = GetMoveFlagValue( var1, var2, EM_RoleValue_X )
		BaseY = GetMoveFlagValue( var1, var2, EM_RoleValue_Y )
		BaseZ = GetMoveFlagValue( var1, var2, EM_RoleValue_Z )
		BaseDir = GetMoveFlagValue( var1, var2, EM_RoleValue_Dir )
		RoomID = GetMoveFlagValue( var1, var2, EM_RoleValue_RoomID )
	elseif var1 ~= nil and CheckID(var1) == true then --物件位置產生
		BaseX = ReadRoleValue( var1, EM_RoleValue_X )
		BaseY = ReadRoleValue( var1, EM_RoleValue_Y )
		BaseZ = ReadRoleValue( var1, EM_RoleValue_Z )
		BaseDir = ReadRoleValue( var1, EM_RoleValue_Dir )
		RoomID = ReadRoleValue( var1, EM_RoleValue_RoomID )
	end	
	
	for i = 1 , Num do
		x = BaseX-dis/2*math.cos(math.pi*2*(i/Num))
		z = BaseZ+dis/2*math.sin(math.pi*2*(i/Num))
		MonsterGroup[i] = CreateObj( ObjID, X, BaseY, Z, BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		AddToPartition( MonsterGroup[i], RoomID )
	end
	return MonsterGroup
end

function ks_RandBornByMultilateral( ObjID, var1, var2, Num , radius, height, min, time, LiveTime, Add, SetObj )--指定位置亂數產生
--ObjID = 物件ID; var1+var2 = 旗標位置; only var1=物件位置; Num = 產生數量; 
--radius = 半徑範圍; height = 產生高度; min=最小距離; time=產生間格; LiveTime = 存在時間; Add = false 為不產生

	local ObjGroup = {}
	local RndList ={ 4,7,9,2,7,5,3,1,8,6 }
	local Last = { 2,1,5,4,3,2,4,5,3,1 }
	local Obj
	local RoomID
	local site
	local X
	local Y	
	local Z
	local splite = Num%36
	local RndNum = 10
	local rate = 1

	if time == nil or time < 0 then time = 0 end
	if height == nil or height < 0 then 
		height = 0 
	end
	if splite == 0 then splite = 1 end
	if radius > 10 then
		rate = radius/10
	end
	local Rnd = RndList
	if var1 ~= nil and var2 ~= nil then	--旗標位置產生
		BaseX = GetMoveFlagValue( var1, var2, EM_RoleValue_X )
		BaseY = GetMoveFlagValue( var1, var2, EM_RoleValue_Y )
		BaseZ = GetMoveFlagValue( var1, var2, EM_RoleValue_Z )
		BaseDir = GetMoveFlagValue( var1, var2, EM_RoleValue_Dir )
		RoomID = GetMoveFlagValue( var1, var2, EM_RoleValue_RoomID )
	elseif var1 ~= nil and CheckID(var1) == true then --物件位置產生
		BaseX = ReadRoleValue( var1, EM_RoleValue_X )
		BaseY = ReadRoleValue( var1, EM_RoleValue_Y )
		BaseZ = ReadRoleValue( var1, EM_RoleValue_Z )
		BaseDir = ReadRoleValue( var1, EM_RoleValue_Dir )
		RoomID = ReadRoleValue( var1, EM_RoleValue_RoomID )
	end

	local itor = 360/splite
	local radiusNum = math.floor( Num/splite )
	if radiusNum > 10 then radiusNum = 10 end
	min = min or 0
	LiveTime = LiveTime or 0
	if min >= radius then min = rate end
	for theta=0, 359, itor do
		Rnd = KS_RegroupArray( RndList, radiusNum )--重組
		for i=1, radiusNum do
			site = Rnd[i]*rate-Last[i]+min
			X = BaseX + site*math.cos(math.pi*2*( (theta+site%20)/360) )
			Z = BaseZ + site*math.sin(math.pi*2*( (theta+site%20)/360) )
			if height > 0 then
				height = height + RndList[i]*2 - Last[i]*2
				Y = BaseY + height
			else
				Y = GetHeight( X, BaseY, Z )
			end		
	
			Obj = CreateObj( ObjID, X, Y, Z, BaseDir, 1 )
			if height > 0 then
				SetModeEx( Obj, EM_SetModeType_Gravity, false )
			end
			
			if SetObj then
				SetModeEx( Obj, EM_SetModeType_HideName , false )		-- 名稱
				SetModeEx( Obj, EM_SetModeType_Mark , false )		-- 標記
				SetModeEx( Obj, EM_SetModeType_NotShowHPMP , false )	-- 不顯示血條
			end

			if Add ~= false then
				AddToPartition( Obj, RoomID )
			end
			if LiveTime > 0 then
				WriteRoleValue( Obj, EM_RoleValue_LiveTime, LiveTime )
			end
			table.insert( ObjGroup, Obj )
			sleep(time)
		end
	end

	return ObjGroup
end


function ks_CreateObjSearch( obj, top, bot )
	local right
	local mid
	local left
	local result
	top = top + 1
	mid = math.floor( ( top + bot )/ 2 )
	if obj[mid] == nil or obj[mid] == 0 then 
		return mid
	end
	
	left = math.floor( ( mid + bot )/ 2 )
	if left > bot then	--左樹		
		if obj[left] == nil or obj[left] == 0 then 
			return left
		end			
	end
	
	right = math.floor( ( top + mid )/ 2 )
	if right > mid then --右樹
		if obj[right] == nil or obj[right] == 0 then 
			return right
		end
	end
	
	if left > bot then	--左樹	
		result = ks_CreateObjSearch( obj, mid, bot )--左樹
	end
	
	if result == nil and right > mid then
		result = ks_CreateObjSearch( obj, top, mid )--右樹
	end
	return result
end

function ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity, Move )
	--FlagObjID 旗幟物件編號
	--FlagNum 旗幟數量	
	--Obj 種植物件編號
	--ObjNum 種植物件數量
	--counterObj 中控物件編號	
	--resetTime 重製時間(秒)
	--Range 生怪範圍
	--Gravity 重力(true/false)
	local counter = OwnerID() --中控物件
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID ) --區域編號
	local create = {}
	local max = {}
	local min = 0
	local num
	local random
	local maxCount = 0
	local objID
	local ObjArray = {}
	local count = 0
	local rnd
	local x
	local y
	local z

	if ObjNum > FlagNum then
		ObjNum  = FlagNum 
	end
		
	--debugmsg( 0, 0, "counter = "..counter )
	for i=0, FlagNum do
		create[i] = 0 
	end
	
	if type(Obj) == "table" then
		num = table.getn(Obj)
		for i = 1, num do max[i] = 0 end
	end	
	
	while true do						
		count = ReadRoleValue( counter, EM_RoleValue_Register1 )	
		--debugmsg( 0,0, "count = " ..count )
		--debugmsg( 0,0, "ObjNum = " ..ObjNum )
		if count < ObjNum then
			for i=count, ObjNum-1 do
				Sleep(1)				
				--debugmsg( 0, 0, "random start" )
				random = rand(FlagNum)
				if  create[random ] > 1 then
					while true do
						sleep(1)
						random = ks_CreateObjSearch( create, FlagNum, 0 )
						if random ~= nil then break	 end
						random = rand(FlagNum)
						if  create[ random ] > 1 then break end
						--debugmsg( 0, 0, "try")
					end					
				end
				--debugmsg( 0, 0, "random end" )
				if random ~= nil then 
					x = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_X ) 
					y = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Y ) 
					z = GetMoveFlagValue( FlagObjID, random , EM_RoleValue_Z ) 	

					if type(Obj) == "number" then							
						create[random] = CreateObj( Obj, x+math.random(-Range,Range), y, z+math.random(-Range,Range), rand(360), 1 )
					else
						for j = 1, num do
							for k = j+1, num do	
								if max[j] < max[k] or max[j] == max[k] then										
									min = j
								elseif max[j] > max[k] and max[j] ~= max[k]then
									min = k										
								end	
							end
								
							if min == j then break end
						end
						max[min] = max[min] + 1	
						create[random] = CreateObj( Obj[min], x+math.random(-Range,Range), y, z+math.random(-Range,Range), rand(360), 1 )
						--debugmsg( 0, 0, "create" )
					end		
					WriteRoleValue( create[random], EM_RoleValue_Register1, counter )
					WriteRoleValue( create[random], EM_RoleValue_Register2, random )
					AddToPartition( create[random], RoomID )
					
					if Gravity == nil then Gravity = true end
					if Move == nil then Move = true end
					SetModeEx( create[random], EM_SetModeType_Gravity, Gravity )
					SetModeEx( create[random], EM_SetModeType_Move, Move )
					WriteRoleValue( counter, EM_RoleValue_Register1, count+1 )
					--debugmsg( 0, 0, "count =  "..count+1 )
					Sleep(1)					
				end
				count = ReadRoleValue( counter, EM_RoleValue_Register1 )	
			end
		end
			
		for i=1, resetTime*3 do
			local ResetFlag = ReadRoleValue( counter, EM_RoleValue_Register2 )
			if ResetFlag ~= 0 then
				create[ResetFlag] = 0
				WriteRoleValue( counter, EM_RoleValue_Register2, 0 )
				if type(Obj) == "table" then
					local OrgID = ReadRoleValue( counter, EM_RoleValue_Register3 )
					for i=1, table.getn(Obj) do
						if OrgID == Obj[i] then
							max[i] = max[i]-1
							break 
						end
					end
				end
				--debugmsg( 0, 0, "create " ..ResetFlag.." reset" )				
			end
			sleep(3)
		end		
		--debugmsg( 0, 0, "Reset  !!" )
	end
end

--========================================傳送用================================================--

function ks_RandRangeSetPos( Obj, var1, var2, RndRange )--傳送
	local x
	local y
	local z
	local dir
	RndRange = RndRange or 0

	if CheckID(var1) == true and var2 == nil then --對象(Obj)傳送
		x = ReadRoleValue( var1, EM_RoleValue_X )
		y = ReadRoleValue( var1, EM_RoleValue_Y )
		z = ReadRoleValue( var1, EM_RoleValue_Z )
		dir = ReadRoleValue( var1, EM_RoleValue_Dir )
	else --Flag傳送
		x = GetMoveFlagValue( var1, var2, EM_RoleValue_X )
		y = GetMoveFlagValue( var1, var2, EM_RoleValue_Y )
		z = GetMoveFlagValue( var1, var2, EM_RoleValue_Z )
		dir = GetMoveFlagValue( var1, var2, EM_RoleValue_Dir )
	end
	y = GetHeight(  x , y , z )

	SetPos( Obj, x+math.random(-RndRange, RndRange) , y, z+math.random(-RndRange, RndRange) , dir )	
end

function ks_DialogRePort_SetPos( Obj, var1, var2, str, RndRange, CloseRange, time  )--詢問玩家後傳送
--範例1 玩家(Obj) 旗標物件編號(var1) 旗標位置(var2) 訊息字串(str) 隨機距離(Rnd_Range) 視窗關閉(距離CloseRange/ 時間time )
--範例2 玩家(Obj) 物件GUID(var1) 空值(var2) 訊息字串(str) 隨機距離(Rnd_Range) 視窗關閉(距離CloseRange/ 時間time )
	if CheckBuff( Obj , 501570) == true then 
		ScriptMessage( Obj , Obj , 0, "[SC_WINDOW_OPENED]", 0 );--視窗已經打開了
		return
	end
	DialogCreate( Obj, EM_LuaDialogType_YesNo, str )
	AddBuff(Obj , 501570,0,-1);
	DialogSelectStr( Obj, "[SO_YES]" )
	DialogSelectStr( Obj, "[SO_NO]" )
	if	ks_DialogRePort_TwoChoose( Obj, CloseRange, time ) == "Yes" then
		AddBuff( Obj, 506098, 0, -1 )--畫面一黑
		sleep(3)
		ks_RandRangeSetPos( Obj, var1, var2, RndRange )--傳送至旗標位置
		CancelBuff( Obj, 506098 )
	end
end

--========================================================================================--

function KS_GetHateList( Obj, Type )--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4 過濾GM)
	local TypeList = {} 
	local Hate
	local HatePlayer = {}
	local Num = HateListCount( Obj )
	
	if Num > 0 then

		for i = 1 , Num do
			Hate = HateListInfo(Obj ,i-1 , EM_HateListInfoType_GItemID )
			if CheckID( Hate ) == true and ReadRoleValue( Hate, EM_RoleValue_IsDead ) == 0 then
				if Type == nil or Type == "hate" or Type == 1 then
					table.insert( HatePlayer, Hate )
					table.insert( TypeList, HateListInfo( Obj ,i-1 , EM_HateListInfoType_HatePoint ) )
				elseif Type == "range" or Type == 2 then
					table.insert( HatePlayer, Hate )
					table.insert( TypeList, GetDistance( Obj, Hate ) )
				elseif Type == "player" or Type == 3 or Type == 4 then			
					if ReadRoleValue( Hate, EM_RoleValue_IsPlayer ) == 1 then
						if Type == 3 or ( Type == 4 and ReadRoleValue( Hate, EM_RoleValue_Voc ) ~= 0 ) then
							table.insert( HatePlayer, Hate )
						end
					end
					if i == HateListCount( Obj ) then
						return HatePlayer
					end
				end
			end
		end
		
		if table.getn(HatePlayer) == 1 then
			return HatePlayer
		end
		
		local TypeListNum = table.getn(TypeList)
		for i =1, TypeListNum do
			for j=i+1, TypeListNum do
				if TypeList[i] < TypeList[j] then
					temp = TypeList[i]
					TypeList[i] = TypeList[j]
					TypeList[j] = temp
					
					temp = HatePlayer[i]
					HatePlayer[i] = HatePlayer[j]
					HatePlayer[j] = temp
				end
			end
		end
	end
	return HatePlayer
end

function KS_GetHateListRange( Obj )--取得距離表(越遠順位越前)
	local HateListRange = {} 
	local HateList = {}
	local Range
	local Hate
	if HateListCount( Obj ) > 1 then
		for i = 1 , HateListCount( Obj ) , 1 do						
			Hate = HateListInfo( Obj ,i-1 , EM_HateListInfoType_GItemID )
			Range = GetDistance( Obj, Hate )
			table.insert( HateList, Hate )
			table.insert( HateListRange, Range )
		end
		for i =1, table.getn(HateListRange) do
			for j=i+1, table.getn(HateListRange) do
				if HateListRange[i] < HateListRange[j] then
					temp = HateListRange[i]
					HateListRange[i] = HateListRange[j]
					HateListRange[j] = temp
					temp = HateList[i]
					HateList[i] = HateList[j]
					HateList[j] = temp
				end
			end
		end
	elseif HateListCount( Obj ) == 1 then	
		Hate = HateListInfo( Obj , 0 , EM_HateListInfoType_GItemID )
		table.insert( HateList, Hate )
	end
	return HateList
end

function KS_InCombat( Obj )--是否戰鬥中	
	if ReadRoleValue( Obj, EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Obj ) == 0 then
		return false
	else
		return true
	end
end

function KS_NoAttackPlayer( Obj )--不攻擊玩家
	if KS_InCombat( Obj ) == true then
		local AttackTID = ReadRoleValue( Obj, EM_RoleValue_AttackTargetID )
		if ReadRoleValue( AttackTID, EM_RoleValue_IsPlayer ) == 1 then
			SetStopAttack( Obj )				
		end
	end
end

function ks_ObjHateTarget( Obj, Target, NotPlayer )--Obj超級討厭Target
-- 指定Obj只攻擊Target
	while true do	
		if Target ~= nil and CheckID(Target) == true then
			ClearHateList( Obj , -1 )--清除仇恨
			--CastSpell( Obj, Obj, 495874 )--清除仇恨
			SysCastSpellLv( Target, Obj, 495767,0 )--最高級挑釁
		end
		sleep(10)
	end
end

function ks_SetController( obj )--設定隱形控制物件
	Hide( obj )
	SetModeEx( obj , EM_SetModeType_Show , false )				-- 顯示
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( obj, EM_SetModeType_Obstruct , false )			-- 阻擋
	SetModeEx( obj, EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( obj, EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( obj, EM_SetModeType_Move , false )				-- 移動
	SetModeEx( obj, EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( obj, EM_SetModeType_HideName , false )			-- 名稱
	SetModeEx( obj, EM_SetModeType_ShowRoleHead , false )		-- 頭像框
	SetModeEx( obj, EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	local RoomID = ReadRoleValue( obj, EM_RoleValue_RoomID )
	Show( obj, RoomID )
end

function ks_ActSetMode( obj, NotShow )--設定演戲用NPC
	NotShow = NotShow or false
	if not NotShow then
		Hide( obj )
	end
	MoveToFlagEnabled( obj, false )
	WriteRoleValue( obj, EM_RoleValue_IsWalk, 1 )
	SetModeEx( obj , EM_SetModeType_Strikback , false )	-- 反擊
	SetModeEx( obj , EM_SetModeType_Fight, false )		-- 可砍殺攻擊
	SetModeEx( obj , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( obj , EM_SetModeType_Mark , false )	-- 標記
	SetModeEx( obj , EM_SetModeType_HideName , false )	-- 名稱
	SetModeEx( obj , EM_SetModeType_ShowRoleHead , false )-- 頭像框
	SetModeEx( obj , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	if not NotShow then
		local RoomID = ReadRoleValue( obj, EM_RoleValue_RoomID )
		Show( obj, RoomID )
	end
end

function ks_TrapMode( Obj )----陷阱用
	Hide( obj )
	SetModeEx( obj , EM_SetModeType_Searchenemy , true )	-- 索敵
	SetModeEx( obj , EM_SetModeType_Fight, false )		-- 可砍殺攻擊
	SetModeEx( obj , EM_SetModeType_Mark , false )	-- 標記
	SetModeEx( obj , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	SetModeEx( obj , EM_SetModeType_HideName , true )	-- 名稱
	SetModeEx( obj, EM_SetModeType_Move , false )		-- 移動
	local RoomID = ReadRoleValue( obj, EM_RoleValue_RoomID )
	Show( obj, RoomID )
end

function ks_ActorMode( obj, HideName, IsWalk )--設定演戲用NPC
	Hide( obj )
	MoveToFlagEnabled( obj, false )
	IsWalk = IsWalk or 1
	HideName = HideName or false
	WriteRoleValue( obj, EM_RoleValue_IsWalk, IsWalk )
	SetModeEx( obj , EM_SetModeType_Strikback , false )	-- 反擊
	SetModeEx( obj , EM_SetModeType_Fight, false )		-- 可砍殺攻擊
	SetModeEx( obj , EM_SetModeType_Searchenemy , false )	-- 索敵
	SetModeEx( obj , EM_SetModeType_Mark , false )	-- 標記
	SetModeEx( obj , EM_SetModeType_HideName , HideName )-- 名稱
	SetModeEx( obj , EM_SetModeType_ShowRoleHead , false )-- 頭像框
	SetModeEx( obj , EM_SetModeType_NotShowHPMP , true )	-- 不顯示血條
	local RoomID = ReadRoleValue( obj, EM_RoleValue_RoomID )
	Show( obj, RoomID )
end

function ks_AttackMode( obj )--設定可攻擊NPC
	Hide( obj )
	MoveToFlagEnabled( obj, false )
	SetModeEx( obj , EM_SetModeType_Strikback , true )		-- 反擊
	SetModeEx( obj , EM_SetModeType_Fight, true )			-- 可砍殺攻擊
	SetModeEx( obj , EM_SetModeType_Searchenemy , true )	-- 索敵
	SetModeEx( obj , EM_SetModeType_Mark , true )			-- 標記
	SetModeEx( obj , EM_SetModeType_HideName , false )		-- 名稱
	SetModeEx( obj, EM_SetModeType_Move , true )		-- 移動
	SetModeEx( obj , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
	SetModeEx( obj , EM_SetModeType_NotShowHPMP , false )	-- 不顯示血條
	local RoomID = ReadRoleValue( obj, EM_RoleValue_RoomID )
	Show( obj, RoomID )
end


function ks_TransTo( var1, var2, var3, Rnd, min )--傳送到特定位置( Rnd = 隨機距離 min=最小距離 )
	local X
	local Y
	local Z
	if var1 ~= nil and var2 ~= nil and var3 ~= nil then
		X = var1
		Y = var2
		Z = var3
	elseif var1 ~= nil and var2 ~= nil then
		X = GetMoveFlagValue( var1 , var2 , EM_RoleValue_X )
		Y = GetMoveFlagValue( var1 , var2 , EM_RoleValue_Y )
		Z = GetMoveFlagValue( var1 , var2 , EM_RoleValue_Z )
	elseif var1 ~= nil and CheckID(var1) == true then
		X = ReadRoleValue( var1, EM_RoleValue_X )
		Y = ReadRoleValue( var1, EM_RoleValue_Y )
		Z = ReadRoleValue( var1, EM_RoleValue_Z )
	else
		DebugMsg(0,0,"No Truth Site")
		return
	end	

	Rnd = Rnd or 0
	min = min or 0
	local RndFix = { math.random(-Rnd,Rnd), math.random(-Rnd,Rnd) }
	for i=1, 2 do
		if RndFix[i] > 0 then
			RndFix[i] = RndFix[i]+min
		else
			RndFix[i] = RndFix[i] - min
		end
	end
	
	y = GetHeight( x+RndFix[1], y, z+RndFix[2] )
	SetPos( OwnerID(), x+RndFix[1], y, z+RndFix[2], ReadRoleValue( OwnerID(), EM_RoleValue_Dir ) )
end

--========================================================================================--

function ks_StopAttack( Obj )--停止戰鬥
	Obj = Obj or OwnerID();
	ClearHateList( Obj, -1 );
	SetStopAttack(Obj );
end

function ks_setAttack( Obj )
	SetAttack( Obj, OwnerID())
end

function ks_ResetRegValue()--暫存值重置
	local OID = OwnerID()
	for i=0, 9 do
		WriteRoleValue( OID, EM_RoleValue_Register+i, 0 )
	end
end

function ks_QuestKill( Killer, DeadID, Num )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, or自訂義 ), DeadID被殺對象, num擊殺數量 )
	if killer == 0 then killer = OwnerID()
	elseif killer == 1 then killer = TargetID() end
	if Num == 0 then return end
	
	local X = ReadRoleValue( killer, EM_RoleValue_X )
	local Y = ReadRoleValue( killer, EM_RoleValue_Y )
	local Z = ReadRoleValue( killer, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( killer, EM_RoleValue_RoomID )
	
	DebugMsg( 0,0,"QuestKill "..Killer.." Kill "..DeadID.."   "..Num .." times")
	for i=1, num do
		local obj = CreateObj( DeadID, x, y, z, 0, 1 )
		SetFlag( obj, 544801, 1 )--關閉帕奇鼠
		SetModeEx( obj, EM_SetModeType_Show, false )
		SetModeEx( obj, EM_SetModeType_Mark, false )
		SetModeEx( obj , EM_SetModeType_Strikback , true )	
		SetModeEx( obj , EM_SetModeType_Searchenemy , false )
		SetModeEx( obj, EM_SetModeType_Fight, false )
		WriteRoleValue( obj, EM_RoleValue_LiveTime, 1 )
		AddToPartition( obj, RoomID )
		KillID( Killer, obj )
	end	
end

function ks_CreateHideCtrl( Site )--產生隱形中控
	Site = Site or OwnerID()
	
	local X = ReadRoleValue( Site, EM_RoleValue_X )
	local Y = ReadRoleValue( Site, EM_RoleValue_Y )
	local Z = ReadRoleValue( Site, EM_RoleValue_Z )
	local RoomID = ReadRoleValue( Site, EM_RoleValue_RoomID )
	local obj = CreateObj( 115506, x, y, z, 0, 1 )
	
	SetModeEx( obj , EM_SetModeType_Show , false )				-- 顯示
	SetModeEx( obj , EM_SetModeType_SearchenemyIgnore , false )	-- 被搜尋
	SetModeEx( obj, EM_SetModeType_Gravity , false )			-- 重力
	SetModeEx( obj, EM_SetModeType_Mark , false )				-- 標記
	SetModeEx( obj, EM_SetModeType_Move , false )				-- 移動
	SetModeEx( obj, EM_SetModeType_Searchenemy , false )		-- 索敵
	SetModeEx( obj, EM_SetModeType_Fight , false )				-- 可砍殺攻擊
	AddToPartition( obj, RoomID )
	return obj
end

function ks_WaitToDie( Time )--Time時間  X秒後自己殺自己
	local Obj = OwnerID()
	Time = Time or 5
	sleep(Time*10)
	KillID(Obj,Obj)
end

function ks_Buff( BuffID )--給BUFF
	local OID = OwnerID()
	if BuffID ~= nil then
		if CheckBuff( OID, BuffID ) == false then
			AddBuff( OID, BuffID, 0, -1 )
		else
			CancelBuff( OID, BuffID )
		end
	end
end

function ks_SetHP( per )--設定目標血量
	local OID = OwnerID()
	local MaxHP = ReadRoleValue( OID, EM_RoleValue_MaxHP )
	per = per or 1
	local SetHP = MaxHP*(per/100)
	WriteRoleValue( OID, EM_RoleValue_HP,  SetHP )
	Say( OID, "MaxHP = "..MaxHP.."; SetHP = "..SetHP )
end

function ks_SetMP( per )--設定目標Mana
	local OID = OwnerID()
	local MaxMP = ReadRoleValue( OID, EM_RoleValue_MaxMP )
	per = per or 1
	local SetMP = MaxMP*(per/100)
	WriteRoleValue( OID, EM_RoleValue_MP,  SetMP )
	Say( OID, "MaxMP = "..MaxMP.."; SetMP = "..SetMP )
end

function ks_NoGM( TID )
	TID = TID or TargetID()
	if ReadRoleValue( TID, EM_RoleValue_IsPlayer ) == 1 and ReadRoleValue( TID, EM_RoleValue_VOC ) == 0 then
		return false
	end
	return true
end

function ks_NoPlayer()
	if ReadRoleValue(OwnerID(), EM_RoleValue_IsPlayer ) == 0 then
		return true
	end
	return false
end

function KS_lcm( Array )--取得最小公倍數, 最大公因數
	local s = 1;
            	local b = 1;
            	local lcm = 1;
            	local gcd = 1;
	local Num = table.getn(Array);
            	for i = 1, Num do
		local a = Array[i];
                	s = b * a;
                	if b < a then
                    		local tmp = b;
                    		b = a;
                    		a = tmp;
                	end
                
                	while a ~= 0 do
                    		local r = b % a;
                    		b = a;
                    		a = r;
                	end
                	gcd = b;
                	lcm = s/gcd;
                	b = lcm;
            	end
            	return lcm, gcd;
end

function KS_FrontOrBack( obj1, obj2 )--取得正面/背面
	if obj1== nil or obj2 == nil then
		DebugMsg(0,0, "KS_FrontOrBack Obj  = nil" )
		return 0;
	end
	local X2,Y2,Z2,_ = kg_GetPosRX( obj1, nil , 1 , 0, 90 );

	local X1 = ReadRoleValue( obj1, EM_RoleValue_X )
	local Y1 = ReadRoleValue( obj1, EM_RoleValue_Y )
	local Z1 = ReadRoleValue( obj1, EM_RoleValue_Z )
	
	local Vx = X1 -X2;
	local Vy = Y1-Y2;
	local Vz = Z1-Z2;

	local Ux = 0;
	local Uy = 1;
	local Uz = 0;

	local Nx = (Uy*Vz-Uz*Vy)
	local Ny = -(Uz*Vx -Ux*Vz)
	local Nz = (Ux*Vy-Uy*Vx)
	local Dis = ((Nx*Nx+Ny*Ny+Nz*Nz)^0.5)
	Nx = Nx / Dis
	Ny = Ny / Dis
	Nz = Nz / Dis
	
	local Px = ReadRoleValue( obj2, EM_RoleValue_X )
	local Py = ReadRoleValue( obj2, EM_RoleValue_Y )
	local Pz = ReadRoleValue( obj2, EM_RoleValue_Z )
	local D = -( Nx*X1+Ny*Y1+Nz*Z1 )
	local plane = Nx*Px+Ny*Py+Nz*Pz +D
	return plane
end

function KS_ScriptMessage( Message, Color, Show )
	Message = Message or "No Message"
	local OID = OwnerID();
	Color = Color or "0xffffff80"	-- 強制訊息為白色
	Show = Show or false
	ScriptMessage( OID, -1, 1 , Message, Color )
	if Show == true then
		ScriptMessage( OID, -1, 0 , Message, Color )
	end
end


function KS_KillObj( ObjID )--殺死全地圖 特定ID物件
	if ObjID == nil then
		DebugMsg(0,0,"No ObjID")
		return
	end
	local OID = OwnerID()
	local RoomID = ReadRoleValue( OID, EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC(RoomID); -- 搜索區域內的所有NPC ，回傳值為其數量
	local Obj
	local KillNum = 0
	
	if Count > 0 then
		if Type(ObjID) =="table" then
			KillNum = {}
			for i=1, table.getn(ObjID) do
				KillNum[i] = 0
			end

			for i = 1 , Count , 1 do
				Obj = GetSearchResult()
				for i=1, table.getn(ObjID) do
					if ReadRoleValue( Obj, EM_RoleValue_OrgID ) == ObjID[i] then
						KillID( OID, Obj )
						KillNum[i] = KillNum[i]+1
						break
					end
				end
			end
		else
			for i = 1 , Count , 1 do
				Obj = GetSearchResult()
				if ReadRoleValue( Obj, EM_RoleValue_OrgID ) == ObjID then
					KillID( OID, Obj )
					KillNum = KillNum+1
				end
			end
		end
	end
	
	if Type(ObjID) =="table" then
		for i=1, table.getn(ObjID) do
			DebugMsg(0,0,"ObjID["..i.."] = "..ObjID[i].."; KillNum["..i.."] = "..KillNum[i] )
		end
	else
		DebugMsg(0,0,"ObjID = "..ObjID.."; KillNum = "..KillNum )
	end
end

--========================================================================================--

function KS_SpellMagic( Caster, SkillID, SkillLV, SpellNum )--施法
	if SpellNum == nil then--對自身
		CastSpellLv( Caster,  Caster, SkillID, SkillLV )
	elseif SpellNum == 0 then--當前目標
		local ATID = ReadRoleValue( Caster, EM_RoleValue_AttackTargetID )
		CastSpellLv( Caster,  ATID, SkillID, SkillLV )
	else--抓仇恨表中的隨機人數
		local Hater = KS_GetHateList( Boss, 4 );--仇恨表( Type:1 依仇恨; 2 依距離; 3 玩家; 4過濾GM)
		for i=1, SpellNum do
			local Num = table.getn(Hater)
			if Num == 0 then
				break
			else
				local rnd = rand( Num )+1
				if i == 1 then
					CastSpellLv( Caster,  Hater[rnd], SkillID, SkillLV )
				else
					SysCastSpellLv( Caster,  Hater[rnd], SkillID, SkillLV )
				end
				table.remove(Hater, rnd )
			end
		end
	end
end


function KS_GetFlagDistance( Obj, FlagID, FlagSite )--物件, 旗標ID, 旗標位置
	local Fx = GetMoveFlagValue( FlagID, FlagSite , EM_RoleValue_X )
	local Fz = GetMoveFlagValue( FlagID, FlagSite , EM_RoleValue_Z )
	local ObjX = ReadRoleValue( Obj , EM_RoleValue_X )
	local ObjZ = ReadRoleValue( Obj , EM_RoleValue_Z )
	
	local DisX = ( Fx - ObjX )^2
	local DisZ = ( Fz - ObjZ )^2
	return math.floor( (DisX+DisZ)^0.5)
end

function Lua_CloseDoor( close, Boss )--開關門
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
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_END )		
		SetDefIdleMotion( door, ruFUSION_MIME_IDLE_STAND )
	else
		PlayMotion( door, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
		SetDefIdleMotion( door, ruFUSION_MIME_ACTIVATE_LOOP )
	end
end

function Ks_GetHateNum( HateList, Num )--仇恨表中取特定數量
	local T_Array = {}
	while table.getn(HateList) > 0 and table.getn(T_Array) < Num do
		local Rnd = rand(table.getn(HateList))+1
		table.insert( T_Array, HateList[Rnd])
		table.remove( HateList, Rnd );
	end
	return T_Array
end

function Ks_ObjSetLock( time, LockFight )--設定鎖定時間, 是否可砍殺  必須用callplot 執行
	local OID = OwnerID()
	StopMove( OID, false )
	Sleep(5)
	SetModeEx( OID, EM_SetModeType_Move, false )
	if LockFight then
		SetModeEx( OID, EM_SetModeType_Fight, false )
	end
	Sleep(time*10)
	SetModeEx( OID, EM_SetModeType_Move, true )
	SetModeEx( OID, EM_SetModeType_Fight, true )
end

function Ks_flaot( num, n )--取到小數點第N位
	return Math.floor(num*(10^n))/(10^n)
end

function Ks_ToString( num )--轉成字串
	return num..""
end

