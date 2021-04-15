-------------------填少少的資訊回傳你要的座標-----------------
	
function DW_Location(GUID_or_FlagID,FlagNum)
	local x,y,z,dir
	if	FlagNum==nil	then
		--Obj
		local Obj = GUID_or_FlagID;
		x=ReadRoleValueFloat(Obj,EM_RoleValue_X);
		y=ReadRoleValueFloat(Obj,EM_RoleValue_Y);
		z=ReadRoleValueFloat(Obj,EM_RoleValue_Z);
		dir=ReadRoleValueFloat(Obj,EM_RoleValue_Dir);
	else
		--Flag
		local FlagID = GUID_or_FlagID
		x=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_X);
		y=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Y);
		z=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Z);
		dir=GetMoveFlagValue(FlagID,FlagNum,EM_RoleValue_Dir);
	end
	x	=x-x%0.01;
	y	=y-y%0.01;
	z	=z-z%0.01;
	return x,y,z,dir;
end
-------公用函式:判讀2進位式欄位資料(回傳true則有勾，false則為沒勾)-----------------
	
function DW_CheckGameInfoBitColumn(DBID,ColumnStr,SN)
	local Value = GameObjInfo_Int(DBID,ColumnStr);
	if	CheckBit(Value,SN)==true	then
		return true;
	else
		return false;
	end
end

----------------如果該基本法術有dot屬性則回傳false------------------------------
	
function DW_ExcludeDotBuff(BuffID)
--BuffID:	system return to this function
--"SettingFlag": Column Name of Objeditor v0.20
--3:		SN of Dot in "SettingFlag" Column

	if	DW_CheckGameInfoBitColumn(BuffID,"SettingFlag",3)==true	then
DeBugMSG(0,0,"Dot NO!")
		return false
	end
end
----------------排除Table，取隨機結果-------------------------------
	
--從Table1中，隨機選數量為Count的內容值，排除Table2中的內容值，不會和Table2的值重複
function Lua_TableRuleOut(Table1,Table2,Count)
	local OriTable=Table1;
	local RuleOut=Table2;
	local Final={};
	local Temp={};
	local Max=#RuleOut;
	if RuleOut==nil or RuleOut[1]==nil then
		for SN,Var in pairs(OriTable) do
			table.insert(Temp,Var);
		end
	else
		for SN,Var in pairs(OriTable) do
			for j=1,Max do
				if Var==RuleOut[j] then
					break;
				end
				if j==Max then
					table.insert(Temp,Var);
				end
			end
		end
	end
	for i=1,Count do
		if #Temp==0 then
			return Final;
		end
		local SN=DW_Rand(#Temp)
		table.insert(Final,Temp[SN]);
		table.remove(Temp,SN);
	end
	return Final;
end

----------------------若目標等同自己回傳false------------------------
	
function Lua_ExcludeSelf()
	if TargetID()==OwnerID() then
		return false;
	end
end
----------循環任務完成時使用的函式，可置於其他函式之內---------
	
function DW_CycleQuestEnd(OpenFlag,CloseFlag,PEScore)
	local NPC,Player = OwnerID(),TargetID();
	SetFlag(Player,OpenFlag,1);
	SetFlag(Player,CloseFlag,0);
	if PEScore~=nil then
		Lua_ZonePE_3th_GetScore( PEScore,  false);--公眾任務的積分(12.21修正)
		--CallPlot(Player,"Lua_ZonePE_3th_GetScore",PEScore);--公眾任務的積分(08.01新增)
	end
	DisableQuest(NPC,false);--解開NPC
end
---------支線完成開啟循環任務，可開啟任意數量的旗標，可置於其他函式之內----------------
	
function DW_BranchQuestEnd(...)
	local NPC,Player = OwnerID(),TargetID();
	for i=1,select("#",...) do
		local FlagID=select(i,...);
		SetFlag(Player,FlagID,1);
	end
	DisableQuest(NPC,false);--解開NPC
end
--判斷物件和座標間的距離
	
function DW_GetDistance(GUID,x,y,z)--物件到某個座標的距離
	local Owner=OwnerID() or 0;
	local RoomID=ReadRoleValue(Owner,EM_RoleValue_RoomID);
	if GUID==nil then
		DeBugMSG(0,RoomID,"GUID==nil Plz Check ur code")
		return 0;
	end
	local xx,yy,zz=DW_Location(GUID);
	local Dis=DW_XYZCheckDis(xx,yy,zz,x,y,z);
	return Dis;
end
function DW_GetDisToFlag(flag, num, x,y,z)--旗標到某個座標的距離
	if not flag then
		DebugMsg(0,0, "flag is nil");
		return false;
	end
	if not num then
		DebugMsg(0,0, "num is nil");
		return false;
	end
	local xx,yy,zz=DW_Location(flag, num);
	local Dis=DW_XYZCheckDis(xx,yy,zz,x,y,z);
	return Dis;
end
function DW_DisOfFlagAndObj(flagOrgID, FlagID, ObjGuid)--旗標到某個物件的距離
	local x,y,z,dir=DW_Location(flagOrgID, FlagID);
	return DW_GetDistance(ObjGuid, x,y,z);
end
--座標隨機法則

function Lua_RandLoc(RandRange)
	local x=RandRange
	return x-(DW_Rand(x*2));
end
--開關背景音樂
	
function Lua_PlayBGM(GUID)--恢復背景音樂的播放
	if GUID==nil then
		if OwnerID()==nil then
			DeBugMSG(0,0,"GUID is nil, function return");
		else
			DeBugMSG(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"GUID is nil, function return")
		end
		return false;
	end
	WriteRoleValue(GUID,EM_LuaValueFlag_IsStopBGM,0);	--記入永久欄位
	ClientEvent_Range(GUID,0,"playmusic");
end
function Lua_StopBGM(GUID)--暫停背景音樂的播放
	if GUID==nil then
		if OwnerID()==nil then
			DeBugMSG(0,0,"GUID is nil, function return");
		else
			DeBugMSG(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"GUID is nil, function return")
		end
		return false;
	end
	WriteRoleValue(GUID,EM_LuaValueFlag_IsStopBGM,1);	--記入永久欄位
	ClientEvent_Range(GUID,0,"stopmusic");
end
function Lua_CheckBMGState()--測試指令：檢查角色目前的背景音樂播放狀態
	local Player=OwnerID();
	local RoomID=ReadRoleValue(Player,EM_RoleValue_RoomID)
	if ReadRoleValue(Obj,EM_RoleValue_IsPlayer)==0 then
		return DeBugMSG(0,RoomID,"This one is NPC, not PLAYER !!");
	elseif ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==1 then
		return DeBugMSG(0,RoomID,"BGM STOP!!");
	elseif ReadRoleValue(Player,EM_LuaValueFlag_IsStopBGM)==0 then
		return DeBugMSG(0,RoomID,"BGM Playing...");
	end
end

--更新仇恨列表中資料，剔除不應存在仇恨中的目標，回傳實際有效的仇恨數量
	
function Lua_FlashHateList(Parameter)
	local GUID=Parameter;
	GUID=GUID or OwnerID();
	local Max=HateListCount(GUID);
	local z
	local OutNum=0;
	if Max==0 then
		return 0;
	else
		for Pos=0,Max-1,1 do
			z=HateListInfo(GUID,Pos , EM_HateListInfoType_GItemID);
			if CheckRelation(GUID , z , EM_CheckRelationType_Attackable)==false then--清除條件1：不可被攻擊
				ClearHateList(GUID,z);
				OutNum=OutNum+1
			end
		end
	end
	return Max-OutNum;
end

--將物件完全藏起來，參數可不填，那就是把自己藏起來

function Lua_Disappear(ID)
	local GUID=ID;
	GUID=GUID or OwnerID();
	if GUID==nil then
		return false;
	end
	SetModeEx(GUID,EM_SetModeType_HideName,true);
	SetModeEx(GUID,EM_SetModeType_Mark,false);
	SetModeEx(GUID,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(GUID,EM_SetModeType_Show,false);
	SetModeEx(GUID,EM_SetModeType_Fight,false);
	SetModeEx(GUID,EM_SetModeType_Strikback,false);
	SetModeEx(GUID,EM_SetModeType_Searchenemy,false);
	return true;
end

--取得物件與某個座標(xyz)之間的點=>3D Dis 是從xyz往物件的長
	
function DW_Relative(GUID,Tx,Ty,Tz,Dis)
	local x,y,z,dir=DW_Location(GUID)
	local RelativeX,Relativey,Relativez
	local DisX,DisY,DisZ
	DisX=Tx-x;
	DisY=Ty-y;
	DisZ=Tz-z;
	local Distance=(DisX^2+DisY^2+DisZ^2)^0.5;
	local RelativeDistance=Distance-Dis
	local Correction
	if RelativeDistance>0 then
		Correction=1;
	else
		Correction=-1;
	end
	local Rate=math.abs(RelativeDistance/Distance);
	RelativeX=x+((Rate*DisX)*Correction);
	Relativey=y+((Rate*DisY)*Correction);
	RelativeZ=z+((Rate*DisZ)*Correction);
	RelativeX=RelativeX-RelativeX%0.1;
	RelativeY=RelativeY-RelativeX%0.1;
	RelativeZ=RelativeZ-RelativeX%0.1;
	return RelativeX,RelativeY,RelativeZ
end
--取得相對某個座標的面向,面向xyz
	
function DW_GetDir(x,y,z,GUIDorFlagID,FlagSN)
	local Gx,Gy,Gz,dir
	if FlagSN==nil then
		Gx,Gy,Gz,dir=DW_Location(GUIDorFlagID);
	else
		Gx,Gy,Gz,dir=DW_Location(GUIDorFlagID,FlagSN);
	end
	local Dir=CalDir(x-Gx,z-Gz);
	--Dir=Dir-Dir%0.1--去到剩小數點一位
	return Dir;--回傳面向
end
--回傳p1相對p2的角度差，此值介於正180~ 負180之間，正值指p1 在p2 右邊，負值指p1 在p2左邊
	
function DW_GetDiffOfDirs(p1, p2)
	local dir1,dir2=p1,p2;
	if dir1<0 then
		dir1=360+dir1;
	end
	if dir2<0 then
		dir2=360+dir2;
	end
	if dir1-dir2 > 180 then
		return (360-(dir1-dir2))*-1;
	elseif dir1-dir2 < -180 then
		return 360+(dir1-dir2);
	else
		return dir1-dir2;
	end
end
--取得某座標點的相對角度座標(只有水平)
	
function DW_NewLocation(Angle,Dis,x,y,z,Dir)
	local Pos = {};
	local Pi_Value;
	Pi_Value = (math.pi/180)*(Dir+Angle)
	Pos.x = x +(Dis*math.cos(Pi_Value))
	Pos.z = z -(Dis*math.sin(Pi_Value))
	Pos.y = GetHeight(Pos.x, y, Pos.z);
	return Pos.x, Pos.y, Pos.z, Dir;
end

--取得某座標點的相對角度座標(只有水平 而且不會校正高度 可以與上一函式比較)

function DW_PureNewLoc(Angle,Dis,x,y,z,Dir)
	local Pos = {};
	local Pi_Value;
	Pi_Value = (math.pi/180)*(Dir+Angle)
	Pos.x = x +(Dis*math.cos(Pi_Value))
	Pos.z = z -(Dis*math.sin(Pi_Value))
	Pos.y = y;
	return Pos.x, Pos.y, Pos.z, Dir;
end
--額外執行緒，讓物件在固定時間後自行解除連結
function DW_DetachObj(GUID, time)
	sleep(time);
	DetachObj(GUID);
end
--在Target的仇恨列表中找尋GUID，如果仇恨列表中有這項資料，回傳pos,  若無則回傳false
	
function DW_HatePosInfo(Target, GUID)
	if not		Target	then	return false;	end
	if not		GUID	then	return false;	end
	local num= HateListCount(Target);
	if num==0 then
		return false;
	else
		for pos=0, num-1, 1 do
			if	HateListInfo(Target, pos, EM_HateListInfoType_GItemID)==GUID	then
				return pos;
			end
		end
		return false;
	end
end
--在Target的仇恨列表中找尋GUID，如果仇恨列表中有這項資料，加上等同Amount量的仇恨值
	
function DW_HateAdd(Target, GUID, Amount)
	local	pos	=DW_HatePosInfo(Target, GUID);
	if	not pos	then	return	false;	end
	local	point	=HateListInfo(Target, pos, EM_HateListInfoType_HatePoint);
	SetHateListPoint(Target, pos, point+Amount);
	return true;
end
--在Target的仇恨列表中找尋GUID，如果仇恨列表中有這項資料，將仇恨值設為Amount
	
function DW_HateSet(Target, GUID, Amount)
	local	pos	=DW_HatePosInfo(Target, GUID);
	if	not pos	then	return	false;	end
	SetHateListPoint(Target, pos, Amount);
	return true;
end
--回傳GUID 的最大生命值的百分之幾 實際血量是多少
	
function DW_GetHPpercentVar(GUID, percent)
	if not	GUID	then
		return false;
	end
	local MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);

	local HP		=MaxHP*(percent/100);
	HP			=math.floor(HP)
	return	HP;
end

--回傳GUID 的目前血量 是最大生命值的百分之幾
	
function DW_GetHPpercent(GUID)
	if not	GUID	then
		return false;
	end
	local HP 		=ReadRoleValue(GUID, EM_RoleValue_HP);
	if	HP<=0		then
		return 0;
	end
	local MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	if	HP>=MaxHP	then
		return 100;
	end
	local percent		=HP/MaxHP;
	percent			=percent-percent%0.001;--小數點3位
	percent			=percent*100;
	return	percent;
end
--增加GUID 的目前血量 最大生命值的百分之幾
	
function DW_AddHPpercent(GUID, percent)
	if not	GUID	then
		return false;
	end
	local	HP		=ReadRoleValue(GUID, EM_RoleValue_HP);
	local	MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	local	oneP		=math.floor(MaxHP/100);
	local	Amount		=math.floor(oneP*percent);
	if	Amount+HP >= MaxHP	then
		WriteRoleValue( GUID, EM_RoleValue_HP, MaxHP);
	else
		WriteRoleValue( GUID, EM_RoleValue_HP, Amount+HP);
	end
end

--設定GUID 的目前血量 為最大生命值的百分之幾
	
function DW_SetHPpercent(GUID, percent)
	if not	GUID	then
		return false;
	end
	local	HP		=ReadRoleValue(GUID, EM_RoleValue_HP);
	local	MaxHP		=ReadRoleValue(GUID, EM_RoleValue_MaxHP);
	local	oneP		=math.floor(MaxHP/100);
	local	Amount		=math.floor(oneP*percent);
	WriteRoleValue( GUID, EM_RoleValue_HP, Amount);
end
--刪除自己
	
function DelSelf()
	DelObj(OwnerID());
end

--刪除所有buff
	
function DW_clsBuff(ObjID)
	if not ObjID then return false; end
	if not CheckID(ObjID) then return false; end

	local n = BuffCount(ObjID);
	for pos=0, n, 1 do
		CancelBuff_NoEvent(ObjID, BuffInfo(ObjID, pos, EM_BuffInfoType_BuffID));
	end
	return true;
end

--1~num, 不會重複的Rand, 不同次的rand之間， 不能有sleep，頭接尾的部份也不會重複！要頭接尾可能重複的部份，請看下一個函式

function DW_Ran(num)
--[[原版的，使用Global來儲存
	local guid=OwnerID();
	if(num==nil)then
		DebugMsg(0,ReadRoleValue(guid,EM_RoleValue_RoomID),"DW_Ran : parameter is nil");
		return;
	end
	if(Global_dw_ran_id==nil)or(Global_dw_ran_id~=num)or(#Global_dw_ran_table==0)or(Global_dw_ran_owner~=guid)then
		--初始化: 1.首次建立 2.不同次使用 3.已經都取過一次 4.使用者不同
		Global_dw_ran_owner=guid;
		Global_dw_ran_id=num;
		Global_dw_ran_table={};
		for i=1,num,1 do
			Global_dw_ran_table[i]=i;
		end
	end
	return table.remove(Global_dw_ran_table,DW_Rand(#Global_dw_ran_table))
--]]
	local t={};
	local LastOne;
	return	function()
			if(#t==0)then
				for i=1,num,1 do
					t[i]=i;
				end
				if(LastOne~=nil)and(#t>1)then
					table.remove(t,LastOne);
				end
			end
			LastOne=table.remove(t,DW_Rand(#t))
			return LastOne;
		end

end
--1~num, 在一輪之內「不會重複」的Rand，上一輪的尾和下一輪的頭可能會重複，例如 15234 是第一輪  42315是第二輪  這當中就重複了兩次的 4
function DW_CircleRand(num)
	local t={};
	return	function()
			if(#t==0)then
				for i=1,num,1 do
					t[i]=i;
				end
			end
			return table.remove(t,DW_Rand(#t));
		end
end
--基本衍生物規則，當master找不到或死亡，將自己刪除，這是迴圈！
function DW_tokenrule(master)
	while true do
		sleep(10);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			DelObj(OwnerID());
			return;
		end
	end
end
--同room的玩家廣播
function DW_roombroadcast(msg_type,msg,msg_color)
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	if(msg_type==nil)or(msg==nil)then
		DebugMsg(0,room,"parameter is nil");
		return false;
	end
	if(msg_color==nil)then
		msg_color=0;
	end
	if(msg_type==2)then
		msg="[$MUTE]"..msg;
	end
	local num=SetSearchAllPlayer(room);
	for i=1,num,1 do
		local player=GetSearchResult();
		ScriptMessage(player,player,msg_type,msg,msg_color);
	end
end