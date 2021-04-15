------------------------------任務相關----------------------------

function kg_qk( QusestObjID )
	local Oid =OwnerID()
	ks_QuestKill( Oid, QusestObjID, 20 )--任務用隱藏殺人法( killer殺人者(0=OID,1=TID, other), DeadID被殺對象, num擊殺數量 )
	Say(Oid, "I got 20 QuestKey!" )
end
----------------------------系統相關-----------------------------------
function kg_ShowInfo()
	 local RoleData = { X=ReadRoleValue(OwnerID(),EM_RoleValue_X),
		Y=ReadRoleValue(OwnerID(),EM_RoleValue_Y),
		Say="" ; ["HP"]=ReadRoleValue(OwnerID(),EM_RoleValue_HP)}

	RoleData.Say  = "X= "..RoleData.X.." Y= "..RoleData.Y.."HP= "..RoleData["HP"]
	DebugMsg(0,0,RoleData.Say)
 	kg_ShowID()
end

function kg_ShowID()
	local O_id = OwnerID()
	local O_id_name = getName(O_id)
	local OrgID=ReadRoleValue(O_id,EM_RoleValue_OrgID)
	local PID=ReadRoleValue(O_id,EM_RoleValue_PID)
	local DBID=ReadRoleValue(O_id,EM_RoleValue_DBID)
	local GroupID =ReadRoleValue(O_id,EM_RoleValue_GroupID)
	local GuildID = ReadRoleValue(O_id,EM_RoleValue_GuildID)
	local HouseDBID =ReadRoleValue(O_id,EM_RoleValue_HouseDBID)
	local PetID = ReadRoleValue(O_id,EM_RoleValue_PetID)
	local CampID = ReadRoleValue(O_id,EM_RoleValue_CampID)
	local OwnerDBID = ReadRoleValue(O_id,EM_RoleValue_OwnerDBID)
	local OwnerGUID = ReadRoleValue(O_id,EM_RoleValue_OwnerGUID)
	local ZoneID = ReadRoleValue(O_id,EM_RoleValue_ZoneID)
	local RoomID = ReadRoleValue(O_id,EM_RoleValue_RoomID)
	local show = "OwnerID = "..O_id
	debugmsg(0,0,show)
	show = "OrgID= "..OrgID.." PID= "..PID.." DBID= "..DBID.." GroupID= "..GroupID
	debugmsg(0,0,show)
	show = "GuildID= "..GuildID.." HouseDBID= "..HouseDBID.." PetID= "..PetID.." CampID= "..CampID
	debugmsg(0,0,show)
	show = "OwnerDBID = "..OwnerDBID.." OwnerGUID = "..OwnerGUID.." ZoneID = "..ZoneID.." RoomID = "..RoomID
	debugmsg(0,0,show)
	
	local T_id_name = getName(TargetID())
end


function kg_ZoneMemory()
	local Memory = GetMemory()
	Memory = (Memory/1024)/1024
	DeBugMSG(0,0,"Now Memory = "..Memory.." mb")
end

function kg_CastBar()--Sleep有效
	local Oid = OwnerID()
	local Tid =TargetID()
	if BeginCastBarEvent( Oid, Tid , GameObjInfo_Str(497148,"Name") , 30 , ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0 , "kg_CastBarTriger")==1 then
		Say(Oid,"Start....")
		WriteRoleValue(Oid,EM_RoleValue_Register10,1)
	end
	local times = 3
	local timer =0
	while 1 do
		if ReadRoleValue(Oid,EM_RoleValue_Register10)==1 then
			Say(Oid,timer)
		else
			Say(Oid,"Break")
			break
		end
		if timer<times then
			Sleep(10)
			timer = timer+1
		elseif timer >= times then
			Sleep(1)
		end
	end
end

function kg_CastBarTriger( ObjID, CheckStatus )--Sleep無效
	local Oid = OwnerID()
	local Tid =TargetID()
	if CheckStatus >0  then
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
	else
		WriteRoleValue(Oid,EM_RoleValue_Register10,0)
		EndCastBar(Oid,CheckStatus)
	end
end


---------------------------------------物件處理相關----------------------------------
function kg_CreateArcByObj( Obj , ObjID, show , range  , amount , face ,angle1 , angle2 , PlotString ) --用物件排成圓弧XD
--kg_CreateArcByObj( 參考物件 , 物件ID,是否顯示 ,範圍 , 數量,  面向  , 起始角度 ,結束角度 )
	show = show or 1
	amount = amount or 1
	angle1 = angle1 or 0
	angle2 = angle2 or 359
	if angle2<angle1 then 
		local temp = angle1
		angle1 = angle2
		angle2 = temp
	end
	range = range or 30
	if range<=0 then range = 2 end
	face = face or -3
	local step = math.floor( (angle2-angle1)/amount )
	local ObjArray = {}
	local NewObj
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	for i=1 , amount do
		NewObj = kg_GetRangePos( Obj , ObjID , range , angle1 , face , nil ,PlotString )
		table.insert(ObjArray,NewObj)
		if show==TRUE or show==1 then  AddToPartition(NewObj,RoomID) end
		angle1 = angle1 + step
	end
	return ObjArray
end

function kg_CreateMultiObj( Obj , ObjID, show ,  amount , face , MinRange , MaxRange , MinAngle , MaxAngle , PlotString )
--kg_CreateObj( 參考物件 , 物件ID , 是否繪製 , 數量 , 面向  , 最小範圍 , 最大範圍 , 參考物件的相對角度最小值 , 參考物件的相對角度最大值 , 執行函式 )
--face為nil表示隨機
	show = show or 1
	amount = amount or 1
	MinRange = MinRange or 0
	MaxRange = MaxRange or 100
	if MinRange<=0 then MinRange = 0 end
	if MaxRange<MinRange then 
		local temp = MinRange
		MinRange = MaxRange
		MaxRange = temp
	end
	MinAngle = MinAngle or 0
	MaxAngle = MaxAngle or 359
	if MaxAngle<MinAngle then 
		local temp = MinAngle
		MinAngle = MaxAngle
		MaxAngle = temp
	end
	local ObjArray = {}
	local NewObj
	local RoomID = ReadRoleValue(Obj,EM_RoleValue_RoomID)
	local random = 0
	math.randomseed(math.random(10000, 99999))
	if face == nil then 
		random = 1
		face = 359 
	end
	local TempFace = face
	local TempRange = MinRange
	local angle=0
	for i=1 , amount do
		TempRange = math.random( MinRange , MaxRange )
		angle = math.random( MinAngle , MaxAngle )
		if random==1 then
			if face >0 then TempFace = math.random( 0 , face ) elseif face<0 then TempFace = math.random( face , 0 ) end
		end
		NewObj = kg_GetRangePos( Obj , ObjID , TempRange , angle , TempFace , nil ,PlotString )
		table.insert( ObjArray , NewObj )
		if show==TRUE or show==1 then  AddToPartition(NewObj,RoomID) end
	end
	return ObjArray
end

function kg_Teleport( Dis )
	local Oid = OwnerID()
	SysCastSpellLv( Oid,Oid,496177,0 )
	setpos( Oid , kg_GetPosRX( Oid , nil , Dis ,0) )
end

function kg_Dash( Dis )
	local Oid = OwnerID()
	local RoomID = ReadRoleValue(Oid,EM_RoleValue_RoomID)
	local Obj = kg_GetPosRX( Oid , 103447 , Dis , 50)
	WriteRoleValue(Obj,EM_RoleValue_LiveTime,3)
	AddToPartition(Obj,RoomID)
	CastSpellLv(Oid,Obj,496935,0)
end

function kg_GetPosRX(Obj  ,ObjID , Dis , AddY , angle , face, PlotString )--最終決定版
--Obj:原物件，亦可為由座標組成的陣列  ObjID:原始物件ID  Dis:距離  AddY:另外增加的高度，0則為直接getHeight ,假如為負值則會先getheight再加上AddY的絕對值
	if Obj==nil then
		DebugMsg(0,0,"Obj is nil  !!")
		return false
	end
	
	local OrgX,OrgY,OrgZ,OrgD
	if type(Obj)=="table" then
		if Obj[3]~=nil and Obj[4]~=nil then
			OrgX = Obj[1];	OrgY = Obj[2];	OrgZ = Obj[3];	OrgD = Obj[4];
		elseif Obj[3]==nil and Obj[4]==nil then
			OrgX = GetMoveFlagValue( Obj[1] , Obj[2] , EM_RoleValue_X )
			OrgY =GetMoveFlagValue( Obj[1] , Obj[2] , EM_RoleValue_Y )
			OrgZ =GetMoveFlagValue( Obj[1] , Obj[2] , EM_RoleValue_Z )
			OrgD =GetMoveFlagValue( Obj[1] , Obj[2] , EM_RoleValue_Dir )
		end
	else
		OrgX = ReadRoleValue( Obj , EM_RoleValue_X )
		OrgY = ReadRoleValue( Obj , EM_RoleValue_Y )
		OrgZ = ReadRoleValue( Obj , EM_RoleValue_Z )
		OrgD = ReadRoleValue( Obj , EM_RoleValue_Dir )
	end
	local X = OrgX;	local Y = OrgY;	local Z =OrgZ;	local D = OrgD;
	
	 if Dis~=nil then
		 if angle~=nil then
		 	D=OrgD+angle
		 	if D  > 360 then D  = D  - 360 elseif D  < 0 then D  = D  + 360 end
		 end
		 local radian = (math.pi/180)*D
		 X = OrgX +(Dis*math.cos(radian))
		 Z =OrgZ - (Dis*math.sin(radian))
		 if face~=nil then
		 	if face < 0 and face>-3 then
				if face == -1 then face = 0 elseif face == -2 then face = 180 end
				if Dis >= 0 then D = D +180-face else D = D + face  end
				if D  > 360 then D  = D  - 360 elseif D  < 0 then D  = D  + 360 end
			elseif face<=-3 then D  = OrgD
			elseif face >=0 then D  =face end
		 end
	end
	
	if AddY ~= nil then--加高度
		if AddY<=0 then
			if AddY~=0 then AddY = math.abs(AddY) end--負號轉正號
			Y = GetHeight( X , OrgY , Z )+Addy
		else
	 		Y= OrgY+Addy
	 	end
	 end
	
	if ObjID == nil then
		return X,Y,Z,D
	else
		local NewObj = CreateObj( ObjID , X,Y,Z,D , 1 )
		if PlotString~=nil then 
			if type(PlotString)== "string" then
				BeginPlot( NewObj , PlotString , 0 )
			end
		end
		return NewObj
	end
end


function kg_GetRangePos( Obj  ,ObjID , Dis , angle , face , FlagNum , PlotString )
--已Obj為圓心，該物件正前方為零度，Dis為半徑畫圓，取得角度為angle的圓上位置(往右angle為正，比如想要知道右前方的位置，anlgle填45)，並提供創物件功能
--參考物件，產生的物件id，距離 ，角度:參考物件前方為0度，方向 ： -1的話是面向參考物件，-2 的話是背向參考物件，-3是與參考物件相同，大於0則是依造輸入的指定角度
--FlagNum不為nil則代表以某指定旗標為參考，FlagNum則代表Obj旗標組的第FlagNum旗標
	if Obj==nil then
		DebugMsg(0,0,"Obj == nil  !!")
		return FALSE
	else
		Dis = Dis or 0
		angle = angle or 0
		face = face or -3
		FlagNum = FlagNum or -1
		local Pos = {}
		local Org,Dir
		if FlagNum>=0 then--為flagID
			Dir=GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_Dir )
		else
			Org = Role:new( Obj  )
			Dir = Org:Dir()
		end
		
		angle = Dir + angle
		if angle >360 then angle = angle -360
		elseif angle < 0 then angle = angle + 360 end
	
		local radian = (math.pi/180)*( angle )--徑度
		if FlagNum>=0 then
			Pos["X"] = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_X ) +(Dis*math.cos(radian))
			Pos["Z"] = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_Z ) - (Dis*math.sin(radian))
			Pos["Y"] = GetHeight( Pos["X"] , GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_Y ) , Pos["Z"] )
		else
			Pos["X"] = Org:X() +(Dis*math.cos(radian))
			Pos["Z"] = Org:Z() - (Dis*math.sin(radian))
			Pos["Y"] = GetHeight( Pos["X"] , Org:Y() , Pos["Z"] )
		end
	
		if face < 0 and face>-3 then
			if face == -1 then face = 0 elseif face == -2 then face = 180 end
			if Dis >= 0 then angle = angle +180-face else angle = angle + face  end
			if angle > 360 then angle = angle - 360 elseif angle < 0 then angle = angle + 360 end
		elseif face<=-3 then angle = Dir
		elseif face >=0 then angle =face end
		
		if ObjID ==nil then
			return Pos["X"],Pos["Y"],Pos["Z"],angle
		else
			local NewRole = CreateObj ( ObjID , Pos["X"]  , Pos["Y"] , Pos["Z"] , angle , 1)
			if PlotString~=nil then 
				if type(PlotString)== "string" then
					BeginPlot( NewRole , PlotString , 0 )
				end
			end
			return NewRole
		end
	end
end

function kg_GetPosTable( Obj , FlagNum )
	if type(FlagNum)=="number" then
		local X = GetMoveFlagValue( Obj , FlagNum , EM_RoleValue_X );
		local Y = GetMoveFlagValue( Obj , FlagNum ,  EM_RoleValue_Y );
		local Z = GetMoveFlagValue( Obj , FlagNum ,  EM_RoleValue_Z );
		local Dir = GetMoveFlagValue( Obj , FlagNum ,  EM_RoleValue_Dir );
		return { X,Y,Z,Dir }
	else
		Obj = Obj or OwnerID();
		local X = ReadRoleValue( Obj , EM_RoleValue_X );
		local Y = ReadRoleValue( Obj , EM_RoleValue_Y );
		local Z = ReadRoleValue( Obj , EM_RoleValue_Z );
		local Dir = ReadRoleValue( Obj , EM_RoleValue_Dir );
		return { X,Y,Z,Dir }
	end
end

function kg_GetPos( Obj , ObjID , AddY )--單純的回傳物件位置
	if Obj==nil then
		DebugMsg(0,0,"Obj == nil  !!")
		return FALSE
	else
		local X = ReadRoleValue( Obj , EM_RoleValue_X )
		local Y = ReadRoleValue( Obj , EM_RoleValue_Y )
		local Z = ReadRoleValue( Obj , EM_RoleValue_Z )
		local Dir = ReadRoleValue( Obj , EM_RoleValue_Dir )
		if AddY ~= nil then
		 		Y= Y+Addy
		 end
		if ObjID == nil then
			return X,Y,Z,Dir
		else
			local NewObj = CreateObj( ObjID , X , Y , Z , Dir , 1 )
			return NewObj
		end
	end
end

function kg_DelObjArray( ObjArray , time )
--kg_DelObjArray( 物件陣列 , 等待執行秒數 )
	time = time or 0
	if time>0 then sleep(time*10) end
	for i=1 , table.getn( ObjArray ) do
		DelObj( ObjArray[i] )
	end
end
-----------------------------------位置相關------------------------------

------------------------------------動作相關---------------------------------

--------------------------------資料處理相關---------------------------------------------------
function kg_GetDis( Obj , Var1 , Var2 , Var3 )
	if Obj==nil or Var1==nil then return false end
	local x,z,Dis,TX,TZ = 0,0,0,0,0;
	x = ReadRoleValue(Obj,EM_RoleValue_X)
	z = ReadRoleValue(Obj,EM_RoleValue_Z)
	if Var2~=nil and Var3==nil then--抓旗標
		TX = GetMoveFlagValue(Var1,Var2,EM_RoleValue_X)
		TZ = GetMoveFlagValue(Var1,Var2,EM_RoleValue_Z)
	elseif Var2~=nil and Var3~=nil then--抓位置
		TX = Var1
		TZ = Var3
	elseif Var2==nil and Var3==nil then --抓物件
		TX = ReadRoleValue( Var1 , EM_RoleValue_X )
		TZ = ReadRoleValue( Var1 , EM_RoleValue_Z )
	end
	x=(TX-x)^2
	z = (TZ-z)^2
	Dis = math.floor((x+z)^0.5)
	return Dis
end

function kg_GetHateList( Obj , mode )	--照仇恨或距離高低取得仇恨表，並排除死亡與GM
	local PlayersInHate =  KS_GetHateList( Obj , mode );
	local newPlayerInHate = {};
	for i in pairs(PlayersInHate) do
		if kg_CheckAtk( PlayersInHate[i] ) == true then
			table.insert( newPlayerInHate , PlayersInHate[i] );
		end
	end
	return newPlayerInHate
end

function kg_insertArray( O_Array,T_Array )--將T_Array 的所有資料插入到O_Array裡面
	for i in pairs(T_Array) do
		table.insert(O_Array,T_Array[i])
	end
end

function kg_ArraySearch( Obj , Array )--從array中找尋Obj並回傳位置
	for i in pairs( Array ) do
		if Obj==Array[i] then
			return i
		end
	end
	return -1
end

--------------------------------條件判定相關----------------------------------------------------
function kg_WaitSpell( Oid )--等待當前目標施法結束
	Oid = Oid or OwnerID();
	while 1 do
		if ReadRoleValue(Oid,EM_RoleValue_SpellMagicID)==0 then
			return true
		end
		Sleep(10);
	end
end

function kg_CheckTargetBack( Oid , Tid  , MinAngle , MaxAngle )
	Oid = Oid or OwnerID();
	Tid = Tid or TargetID();
	MinAngle = MinAngle or 90;
	MaxAngle = MaxAngle or 270;
	if MinAngle<0 then MinAngle = MinAngle+360; end
	if MaxAngle<0 then MaxAngle = MaxAngle+360; end
	if MinAngle==MaxAngle then DebugMsg(0,0,"error!! Min=Max!!"); return end
	if MinAngle>MaxAngle then
		local switch = MinAngle;
		MinAngle = MaxAngle;
		MaxAngle = switch;
	end
	local Tx = ReadRoleValue( Tid, EM_RoleValue_X );
	local Tz = ReadRoleValue( Tid, EM_RoleValue_Z );
	local Td = ReadRoleValue( Tid, EM_RoleValue_Dir );
	local Ox = ReadRoleValue( Oid, EM_RoleValue_X );
	local Oz = ReadRoleValue( Oid, EM_RoleValue_Z );
	local Dir =  CalDir( (Ox-Tx),(Oz-Tz) );
	local deltaDir = Dir-Td;
	if deltaDir<0 then deltaDir = 360+deltaDir end
	--DebugMsg(0,0,"deltaDir= "..deltaDir )
	if deltaDir<MinAngle or  deltaDir > MaxAngle then
		return 0
	else
		return 1
	end
end


function kg_CheckFlag( Obj , FlagID , bOpen )--bOpen不填則會設定flag
	if type(bOpen)=="number" then
		SetFlag( Obj , FlagID , bOpen )
	else
		return CheckFlag( Obj , FlagID )
	end
end

function kg_CheckMapID( MapID,Obj )
	Obj = Obj or OwnerID()
	local x=ReadRoleValue(Obj,EM_RoleValue_X)
	local y=ReadRoleValue(Obj,EM_RoleValue_Y)
	local z=ReadRoleValue(Obj,EM_RoleValue_Z)
	if CheckMapID(x,y,z,MapID)==true or CheckMapID(x,y,z,1)==true then
		return true
	end
	ScriptMessage( Obj, Obj, 1 , "[SC_421324_1]" , 0 )--不在目標區域內
	return false
end

function kg_InBattle( Obj )
	Obj = Obj or OwnerID()
	if ReadRoleValue(obj,EM_RoleValue_IsPlayer)==1 then
		if ReadRoleValue( Obj ,EM_RoleValue_IsAttackMode )==0 then
			return false
		end
	else
		if ReadRoleValue( Obj , EM_RoleValue_AttackTargetID ) == 0 and HateListCount( Obj ) == 0 then
			return false
		end
	end
	return true
end
 
function kg_CheckGM( Obj )--模板基本法術用，目標為GM則回傳false
	Obj = Obj or TargetID()
	if ReadRoleValue( Obj ,EM_RoleValue_IsPlayer )==1 and ReadRoleValue( Obj , EM_RoleValue_Voc ) == 0  then	--是玩家而且是GM
		return FALSE
	end
	return TRUE
end

function kg_CheckAtk( Player )--判定玩家是否死亡或是職業為GM，主要用來給NPC判定是否可以攻擊
	if
	( ReadRoleValue( Player,EM_RoleValue_IsPlayer )==1 and ReadRoleValue( Player , EM_RoleValue_Voc ) == 0 ) or	--玩家為GM
	ReadRoleValue( Player , EM_RoleValue_IsDead ) == 1 or	--已死亡
	CheckID( Player )~=TRUE or
	Player==nil						--目標不存在
	then
		return FALSE
	else
		return TRUE
	end
end

function kg_CheckLive( Obj )--判定物件是否死亡或不存在，True表示活著
	if ReadRoleValue( Obj , EM_RoleValue_IsDead ) == 1 or	--已死亡
	CheckID( Obj )~=TRUE or
	Obj==nil						--目標不存在
	then
		return FALSE
	else
		return TRUE
	end
end
--------------------------------法術相關--------------------------------------------------------
function kg_TeleportEx()--指定位置傳送(模板用)--OwnerID產生的物件,TargetID玩家
	SetPos( TargetID() , kg_GetPos(OwnerID()) )
end

function kg_SetHP(HPP)	--直接指定角色的血量%數，若為0則直接死亡，沒事不要對玩家使用.........
	HPP=HPP or 50
	local O_id = OwnerID()
	local T_id = TargetID()
	if HPP==0 then
		WriteRoleValue(O_id,EM_RoleValue_HP,0)
		NPCDead(O_id,T_id)
		Sleep(50)
		if ReadRoleValue( O_id , EM_RoleValue_IsPlayer )~=1 then
			DelObj(O_id)
		end
	else
		local MaxHP= ReadRoleValue(O_id,EM_RoleValue_MaxHP)
		local HP = MaxHP*HPP/100
		WriteRoleValue(O_id,EM_RoleValue_HP,HP)
	end
end

function Lua_kg_TidHitOid()
	local Tid = TargetID()
	local Oid = OwnerID()
	SysCastSpellLv( Tid,Oid,497083,0 )--強制仇恨1
end

function Lua_kg_EndCastBar()
	EndCastBar(TargetID(),0)
end

function Lua_kg_HateMutually()
	local Tid = TargetID()
	local Oid = OwnerID()
	SysCastSpellLv( Oid,Tid,497448,0 )--強制仇恨1
	SysCastSpellLv( Tid,Oid,497448,0 )--強制仇恨1
end

-----------------------------------------Buff-----------------------------------------------
function kg_AddBuff( BuffID )--Pcall用
	AddBuff(OwnerID(),BuffID,0,-1)
end


function kg_Buff( BuffID )--Pcall用
	local Oid = OwnerID()
	if CheckBuff(Oid,BuffID)==true then
		CancelBuff(Oid,BuffID)
	else
		AddBuff(Oid,BuffID,10,-1)
	end
end

function kg_CheckBuff( Obj, BuffID )--回傳1跟0
	if CheckBuff(Obj,BuffID)==TRUE then
		return 1
	else
		return 0
	end
end

function kg_ClearBuff( Obj , BuffArray )	--清除陣列所有Buff
	for i in pairs(BuffArray) do
		CancelBuff( Obj,BuffArray[i] )
	end
end

function kg_CheckBuffTime( Obj, BuffID )--取得指定物件身上BUFF剩餘時間
	if CheckBuff( Obj, BuffID ) == true then
		local pos = Lua_BuffPosSearch( Obj, BuffID )
		local time = BuffInfo( Obj, pos, EM_BuffInfoType_Time )
		return time
	else
		return 0
	end
end

----------------------------------------其他----------------------------------------------------
function kg_LeaveBattleGround( Obj )
	Obj = Obj or OwnerID()
	LeaveBattleGround( Obj )
	ScriptMessage(Obj,Obj,0,"[SC_WB01_LEAVE]", C_YELLOW )
end


function kg_Rand( Min,Max )
	math.randomseed(math.random(1, 99999))
	if Min~=nil and Max~=nil then
		return math.random(Min,Max)
	elseif Min~=nil and Max==nil then
		return math.random(Min)
	else
		return math.random(100)
	end
end

function kg_Reg( Obj , num , value )
	num = num-1
	if type(value)~="number" then
		return ReadRoleValue( Obj ,EM_RoleValue_Register1+num )
	else
		WriteRoleValue( Obj ,EM_RoleValue_Register1+num , value )
	end
end

function kg_ClearReg( Obj )
	Obj = Obj or OwnerID()
	for i=0,9 do
		WriteRoleValue(Obj,EM_RoleValue_Register1+i,0);
	end
end