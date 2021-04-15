
function Lua_703019_Boss7_Init( _roomID , _virgin )--7王布置 --140722 added
	DebugMsg( 0 , 0 , "Lua_703019_Boss7_Init" );
	local _roomID = _roomID or ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local _zoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID );
	_virgin = _virgin or true;

	if ( _zoneID ~= 163 ) then--不是困難模式的話  不出尾王
		return;
	end

	if ( _virgin ) then WY_Z163_B7_Summon(); end--產出表演

	--全域變數
	global_29in_boss7=global_29in_boss7 or {};
	global_29in_boss7[_roomID]={};
	
	
	--先蓋門
	local _doorGUID = 106247;

	local _flagGUID = 781361;
	local _frontDoorFlagPos = 2;
	local _backDoorFlagPos = 3;

--	local _backDoorID = Lua_703182_AddDoor( _doorGUID , _flagGUID , _backDoorFlagPos , _roomID );--後門

	global_29in_boss7[_roomID]._backDoorID = _backDoorID;
	global_29in_boss7[_roomID]._flagGUID = _flagGUID;
	global_29in_boss7[_roomID]._frontDoorFlagPos = _frontDoorFlagPos;
	global_29in_boss7[_roomID]._doorGUID = _doorGUID;

	--再蓋BOSS
	local _bossGUID = 108282;
	local _bossFlagPos = 1;

	Lua_DavisDelObj( _bossGUID );--防止BOSS重複
	
	local _bossID = CreateObjByFlag( _bossGUID , _flagGUID , _bossFlagPos , 1 );
	AddToPartition( _bossID , _roomID );

--	WriteRoleValue( _bossID , EM_RoleValue_Register10 , _backDoorID );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門

	--DW_roombroadcast(2,"[SC_29IN_BOSS7_BORN]",C_LightBlue);--大膽狂徒！想要繼續往前得先過老夫這一關才行！
	
end


--進入戰鬥時啟動
function lua_29in_boss7_LuaEvent_BeginAttack()
	DebugMsg( 0 , 0 , "lua_29in_boss7_LuaEvent_BeginAttack" );
	Cl_Resist_HackersFightBegin();
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_mark,false);
	SetModeEx(ctrl,EM_SetModeType_show,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx( ctrl , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( ctrl , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( ctrl , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( ctrl , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( ctrl , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( ctrl , EM_SetModeType_Move , false );			--移動
	SetModeEx( ctrl , EM_SetModeType_Strikback , false );		--反擊

	AddToPartition(ctrl,room);

	local _gConsts = global_29in_boss7[room];
	if ( _gConsts == nil ) then Lua_703019_Boss7_Init( room , false ); return; end

	local _frontDoorID = Lua_703182_AddDoor( 106246 , _gConsts._flagGUID , _gConsts._frontDoorFlagPos , room );--前門
	WriteRoleValue( boss , EM_RoleValue_Register9 , _frontDoorID );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門

	local _backDoorID = Lua_703182_AddDoor( 106247 , 781361 , 3 , room );--後門
	WriteRoleValue( boss , EM_RoleValue_Register10 , _backDoorID );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門

	CallPlot(ctrl,"DW_tokenrule",boss);--focus on testing
	BeginPlot(ctrl,"lua_29in_boss7_main",0);
end
--克洛普斯戰鬥AI
function lua_29in_boss7_main()
	DebugMsg( 0 , 0 , "lua_29in_boss7_main" );
	local boss=TargetID();
	local ctrl=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	--全域變數
	--global_29in_boss7=global_29in_boss7 or {};
	--global_29in_boss7[room] = global_29in_boss7[room] or {};

	if ( global_29in_boss7[room] == nil ) then Lua_703019_Boss7_Init( room , false ); return; end

	global_29in_boss7[room].floating={};--浮石
	global_29in_boss7[room].runegear={};--符文機關
	
	local max,min,stride=898,810,22
	--浮石創造
	--for i=1,GetMoveflagCount(781362)-1,1 do
	for i = 1 , 6 , 1 do
		local x,y,z,dir=DW_Location(781362,i);
		local s=CreateObj(108316,x,y,z,dir,1);
		SetModeEx(s,EM_SetModeType_Searchenemy,false);
		SetModeEx(s,EM_SetModeType_Strikback,false);
		SetModeEx(s,EM_SetModeType_Gravity,false);
		SetModeEx(s,EM_SetModeType_Obstruct,true);
		SetModeEx(s,EM_SetModeType_ShowRoleHead,true);
		SetModeEx(s,EM_SetModeType_Mark,true);
		WriteRoleValue(s,EM_RoleValue_Y,min);
		AddToPartition(s,room);
		LockHP(s,ReadRoleValue(s,EM_RoleValue_MaxHP),"");
		CallPlot(s,"DW_tokenrule",ctrl);
		AddBuff(s,625019,0,-1);
		--global_29in_boss7[room].floating[i]={guid=s;intend="none";height=min;contain=0};
		global_29in_boss7[room].floating[i]={guid=s;intend="down";height=min;contain=0};
	end
	--符文機關創造
	local gearorg={108317,108318,108319,108320};
	if(zone==164)then gearorg[3]=108319;elseif(zone==165)then gearorg[3]=108319;end
	for i=1,4,1 do
		local x,y,z,dir=DW_Location(781363,i);
		local g=CreateObj(gearorg[i],x,max,z,dir,1);
		SetModeEx(g,EM_SetModeType_Mark,true);
		SetModeEx(g,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(g,EM_SetModeType_Gravity,false);
		DW_UnFight(g,true);
		AddToPartition(g,room);
		WriteRoleValue(g,EM_RoleValue_Register1,i);
		CallPlot(g,"DW_tokenrule",ctrl);
		global_29in_boss7[room].runegear[i]={guid=g;status="off";org=rawget(gearorg,i)};
	end
	--雷殛之地創造
	local x,y,z,dir=DW_Location(boss);
	local thunder_floor=CreateObj(108321,x,y,z,dir,1);
	SetModeEx(thunder_floor,EM_SetModeType_Show,false);
	SetModeEx(thunder_floor,EM_SetModeType_Mark,false);
	SetModeEx(thunder_floor,EM_SetModeType_ShowRoleHead,false);
	DW_UnFight(thunder_floor,true);
	AddToPartition(thunder_floor,room);
	CallPlot(thunder_floor,"DW_tokenrule",ctrl);
	
	local phase=1;
	
	local increase=0;
	local gcd=0;
	local countdown={	floating_move=2;
				runegear_open=20;
				addition=20;
				fire=3;
				charge=2;
				flame=5;
				explode=9;
				amplify=13;
				gearstyle1=5;
				gearstyle2=9;
				gearstyle3=13;
				gearstyle4=2;
				};
	
	--浮石移動
	local floating_move={countdown=2;};
	--符文機關開啟
	local runegear_open={countdown=20;addition=20;}; --20
	--高熱火焰(第一階段)
	local fire={countdown=3;switch=false;}
	--浮石充能
	local charge={countdown=2;};
	--火球
	local fireball={};
	--魔焰爆發
	
	--不穩定火焰
	local flame={countdown=5;};
	--火焰噴發
	local explode={countdown=9;};
	--火星濺射
	local amplify={countdown=13};
	--符文機關固定招式
	local gearstyle={};
	--符文機關固定招式:高熱火焰
	gearstyle[1]={countdown=5;};
	--符文機關固定招式:魔焰擴散
	gearstyle[2]={countdown=9;last=0;player=0;};
	--符文機關固定招式:火焰噴射
	gearstyle[3]={countdown=13;};
	--符文機關固定招式:熔岩標記
	gearstyle[4]={countdown=2;};
	
	local firelist={};
	
	
	local list={};
	global_29in_boss7[room].playerlist={};
	local staple_target=0;
	
	--隨機啟動四個符文機關中的一個
	local function active_runegear()
		local offfloating={};
		for i=1,#global_29in_boss7[room].runegear,1 do
			if(global_29in_boss7[room].runegear[i].status=="off")then
				table.insert(offfloating,i);
			end
		end
		if(#offfloating==0)then
			return;
		end
		local r=offfloating[DW_Rand(#offfloating)];
		global_29in_boss7[room].runegear[r].status="on";
		SysCastSpellLv(global_29in_boss7[room].runegear[r].guid,global_29in_boss7[room].runegear[r].guid,851313,0);
		local warning_msg="[SC_29IN_BOSS7_GEARON][$SETVAR1="..GetName(global_29in_boss7[room].runegear[r].guid).."]";
		DW_roombroadcast(1,warning_msg,C_YELLOW)--克洛普斯啟動了XXXX!
		SetPlot(global_29in_boss7[room].runegear[r].guid,"touch","lua_29in_boss7_runegear_touch",100);
	end
	local function active_runegear_2() --第2階段
		DebugMSG(0,room,"---active_runegear_2---");
		for i=1,4,1 do
			if(global_29in_boss7[room].runegear[i].status=="off")then
				global_29in_boss7[room].runegear[i].status="on";
				SysCastSpellLv(global_29in_boss7[room].runegear[i].guid,global_29in_boss7[room].runegear[i].guid,851313,0);
				local warning_msg="[SC_29IN_BOSS7_GEARON][$SETVAR1="..GetName(global_29in_boss7[room].runegear[i].guid).."]";
				DW_roombroadcast(1,warning_msg,C_YELLOW)--克洛普斯啟動了XXXX!
				SetPlot(global_29in_boss7[room].runegear[i].guid,"touch","lua_29in_boss7_runegear_touch",100);
			end
		end
	end
	--高熱火焰產生火焰的劇情
	local function fire_create(guid)
		local x,y,z,dir=DW_Location(guid);
		local f=CreateObj(108322,x,y,z,dir,1);
		SetModeEx(f,EM_SetModeType_Mark,false);
		SetModeEx(f,EM_SetModeType_ShowRoleHead,false);
		DW_UnFight(f,true);
		AddToPartition(f,room);
		CallPlot(f,"DW_tokenrule",ctrl);
		return f;
	end
	
	DW_roombroadcast(2,"[SC_29IN_BOSS7_START]",C_LightBlue);--大膽狂徒！想要繼續往前得先過老夫這一關才行！
	local reset=false;
	local fury_course = false;
	while true do
		sleep(10);
	--reset
		list={};
		global_29in_boss7[room].playerlist={};
	--keep
		--克洛普斯
		if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
			DebugMsg(0,room,"boss dead")
			break;
		elseif(phase==1)and(DW_GetHPpercent(boss)<=60)then  --階段判斷
			phase=2;
			DW_roombroadcast(2,"[SC_29IN_BOSS7_PHASE]",C_LightBlue);--有兩下子，但老夫的全力可不只如此！
		end

		--狂暴機制	--K.J. Aris 131023
		if(zone~=165)and(fury_course==false)then
			if(zone==163)and(increase>=480) or (zone==164)and(increase>=360)then
				fury_course=true;
				AddBuff(boss,625099,0,-1);
			end
		end


		--玩家資料
		local highest_point=0;
		local near_player=0;
		for pos=0,HateListCount(boss)-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			table.insert(list,id);
			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				table.insert(global_29in_boss7[room].playerlist,id);
				--記錄坦克目標
				local hate_point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
				if(hate_point>highest_point)then
					staple_target=id;
					highest_point=hate_point;
				end
				--浮石禁制攻擊
				local Near_floating=false;
				local locY=ReadRoleValue(id,EM_RoleValue_Y);
				for i=1,#global_29in_boss7[room].floating,1 do
					if(GetDistance(global_29in_boss7[room].floating[i].guid,id)<8)and(global_29in_boss7[room].floating[i].height-locY<10)then
						--在浮石的範圍內
						global_29in_boss7[room].floating[i].contain=global_29in_boss7[room].floating[i].contain+1;
						Near_floating=true;
						if(CheckBuff(id,625008)==false)and(phase==1)then
							AddBuff(id,625008,0,-1);
						end
						break;
					end
				end
				if(CheckBuff(id,625008)==true)then
					if(phase==1)and(Near_floating==false)then
						CancelBuff_NoEvent(id,625008);
						DW_roombroadcast(1,"[SC_29IN_BOSS7_FREE]",C_YELLOW);--你從浮石上跳下，那麻痺的感覺立刻消失無蹤！
					elseif(phase==2)then
						CancelBuff_NoEvent(id,625008);
					end
				end
				--和BOSS的距離
				if(GetDistance(boss,id)<=50)then
					near_player=near_player+1;
				end
			end
		end
		if(#global_29in_boss7[room].playerlist==0)then
			--沒有玩家
			reset=true;DebugMsg(0,room,"no player in hatelist");
			break;
		end
		--附近有無玩家
		if(near_player==0)then
			AddBuff(boss,625053,0,-1);
		else
			CancelBuff_NoEvent(boss,625053);
		end
		--符石能量衰減
		if phase == 2 then -- Brook 140826
			for i=1,#global_29in_boss7[room].floating,1 do
				local s=global_29in_boss7[room].floating[i].guid;
				local buff_pos=Lua_BuffPosSearch(s,625009);
				local buff_lv=BuffInfo(s,buff_pos,EM_BuffInfoType_Power);
				if(global_29in_boss7[room].floating[i].contain>0)then
					buff_lv=buff_lv-global_29in_boss7[room].floating[i].contain;
					CancelBuff_NoEvent(s,625009);
					if(buff_lv>-1)then
						--未完全抵消
						AddBuff(s,625009,buff_lv,-1);
					end
				end
				global_29in_boss7[room].floating[i].contain=0;
				if(buff_lv>=49)then
					--能量到達100  -- 140814 改能量到達50 Brook
					for j=1,#global_29in_boss7[room].playerlist,1 do
						SysCastSpellLv(boss,global_29in_boss7[room].playerlist[j],851302,0);
						ScriptMessage(global_29in_boss7[room].playerlist[j],global_29in_boss7[room].playerlist[j],1,"[SC_29IN_BOSS7_FATAL]",C_YELLOW);--強烈的電擊貫穿你的身體，失去意識前你只感到心臟像被重錘擊中。
					end
				end
			end
		end
		--時間資料
		increase=increase+1;
		if(gcd>0)then
			gcd=gcd-1;
		end
		for i,sec in pairs(countdown)do
			if(sec>0)then
				countdown[i]=sec-1;
			end
		end
	--cast
		for one_stride=1,1,1 do
			--克洛普斯的自身招式
			local fatal=false;
			if(gcd~=0)then break;end
			--火靈狀態
			if(fire.switch==true)then
				fire.switch=false;
				--fatal=true;
				--DW_roombroadcast(2,"[SC_29IN_BOSS7_ABSORB]",C_LightBlue)--太愚蠢了！火焰可是老夫的魔法專長！
			elseif(CheckBuff(boss,625011)==true)and(BuffInfo(boss,Lua_BuffPosSearch(boss,625011),EM_BuffInfoType_Power)>=19)then
				CancelBuff_NoEvent(boss,625011);
				fatal=true;
			end
			if(fatal==true)then
				gcd=6;
				DebugMsg( 0 , 0 , "--魔焰爆發" );
				DW_roombroadcast(2,"[SC_29IN_BOSS7_ABSORB]",C_LightBlue)--太愚蠢了！火焰可是老夫的魔法專長！
				CastSpellLv(boss,boss,851303,0);
				fatal = false;
				break;
			end
			if(phase==1)then
				if(CheckBuff(boss,625053)==true)then
					CastSpellLv(boss,boss,851304,0);
				end
				break;
			end
			--第二階段
			if(countdown.flam==0)then
				gcd=2;
				countdown.flame=rawget(flame,"countdown");
				CastSpellLv(boss,global_29in_boss7[room].playerlist[DW_Rand(#global_29in_boss7[room].playerlist)],851305,1);
				break;
			end
			if(countdown.explode==0)then
				gcd=2;
				countdown.explode=rawget(explode,"countdown");
				CastSpellLv(boss,boss,851306,1);
				break;
			end
			if(countdown.amplify==0)then
				gcd=2;
				countdown.amplify=rawget(amplify,"countdown");
				CastSpellLv(boss,boss,851307,1);
				break;
			end
			--一定會放火球
			if(CheckBuff(boss,625053)==true)then
				CastSpellLv(boss,boss,851304,0);
			end
		end
		--浮石的移動控制
		if(countdown.floating_move==0)then
			countdown.floating_move=rawget(floating_move,"countdown");
			
			for i=1,#global_29in_boss7[room].floating,1 do
				local s=global_29in_boss7[room].floating[i].guid;
				if(CheckBuff(s,625019)==false)then
					global_29in_boss7[room].floating[i].intend="up";
				else
					global_29in_boss7[room].floating[i].intend="down";
				end
				AddBuff(s,625019,0,-1);
				local x,y,z,dir=DW_Location(s);
				if(global_29in_boss7[room].floating[i].intend=="down")and(global_29in_boss7[room].floating[i].height>min)then
					if(ReadRoleValue(s,EM_RoleValue_Y)-stride<=min)then
						SetModeEx(s,EM_SetModeType_Gravity,true);
						global_29in_boss7[room].floating[i].height=min;
						MoveDirect(s,x,global_29in_boss7[room].floating[i].height+5,z);
					else
						global_29in_boss7[room].floating[i].height=ReadRoleValue(s,EM_RoleValue_Y)-stride;
						MoveDirect(s,x,global_29in_boss7[room].floating[i].height,z);
					end
				elseif(global_29in_boss7[room].floating[i].intend=="up")and(global_29in_boss7[room].floating[i].height<max)then
					if(ReadRoleValue(s,EM_RoleValue_Y)+stride>=max)then
						global_29in_boss7[room].floating[i].height=max
						MoveDirect(s,x,global_29in_boss7[room].floating[i].height,z);
					else
						SetModeEx(s,EM_SetModeType_Gravity,false);
						global_29in_boss7[room].floating[i].height=ReadRoleValue(s,EM_RoleValue_Y)+stride;
						MoveDirect(s,x,global_29in_boss7[room].floating[i].height,z);
					end
				else
					global_29in_boss7[room].floating[i].intend="none";
				end
			end
		end
		--浮石能量控制
--		DebugMsg(0,room,"--浮石能量控制="..countdown.charge);
		if(countdown.charge==0) and phase == 2 then -- Brook 140826
			countdown.charge=rawget(charge,"countdown");
			--能量增加
			for i=1,#global_29in_boss7[room].floating,1 do
--				DebugMsg(0,room,"--能量增加="..i);
				AddBuff(global_29in_boss7[room].floating[i].guid,625009,1,-1);--+2
			end
		end
		--符文機關啟動
		if(countdown.runegear_open==0)then
			countdown.runegear_open=rawget(runegear_open,"countdown");
			active_runegear();
		end
		--第二階段加速啟動
		if(phase==2)and(countdown.addition==0)then
			countdown.addition=rawget(runegear_open,"addition");
--			active_runegear();
			active_runegear_2();
		end
		--符文機關相關判定
		for i=1,#firelist,1 do
			if(GetDistance(firelist[i].guid,boss)<=75)then
				--克洛普斯 太近疊魔焰貯存
				AddBuff(boss,625011,0,-1);
			end
		--	for j=1,#global_29in_boss7[room].playerlist,1 do
		--		if(GetDistance(global_29in_boss7[room].playerlist[j],firelist[i].guid)<=75)then
					--玩家太近：灼傷
		--			SysCastSpellLv(firelist[i].guid,global_29in_boss7[room].playerlist[j],851309,0);
		--		end
		--	end
			if(phase==1)then
				for j=1,(#firelist/2)+1,1 do
					if(i~=j)and(GetDistance(firelist[i].guid,firelist[j].guid)<75)then
						--距離其他火焰太近
						fire.switch=true;
						firelist[i].livetime=1;
						firelist[j].livetime=1;
					end
				end
			end
		end
		for i=#firelist,1,-1 do
			if(firelist[i].livetime<=1)then
				--時間到
				DelObj(firelist[i].guid);
				table.remove(firelist,i);
			else
				firelist[i].livetime=firelist[i].livetime-1;
			end
		end
		if(countdown.fire==0)then
			countdown.fire=rawget(fire,"countdown");
			local picknewplayer=DW_Ran(#global_29in_boss7[room].playerlist);
			for i=1,#global_29in_boss7[room].runegear,1 do
				if(global_29in_boss7[room].runegear[i].status=="on")then
					--所有開啟狀態的符文機關都送一發高熱火焰
					local f=fire_create(global_29in_boss7[room].playerlist[picknewplayer()]);
					firelist[#firelist+1]={guid=f;livetime=10;};
				end
			end
		end
		if(phase==2)then
			for i=1,#global_29in_boss7[room].runegear,1 do
				if(i==1)and(global_29in_boss7[room].runegear[i].status=="on")and(countdown.gearstyle1==0)then
					countdown.gearstyle1=rawget(gearstyle[1],"countdown");
					local f=fire_create(global_29in_boss7[room].floating[DW_Rand(#global_29in_boss7[room].floating)].guid);
					firelist[#firelist+1]={guid=f;livetime=5;};
				end
				if(i==2)and(global_29in_boss7[room].runegear[i].status=="on")and(countdown.gearstyle2==0)then
					countdown.gearstyle2=rawget(gearstyle[2],"countdown");
					gearstyle[2].player=global_29in_boss7[room].playerlist[DW_Rand(#global_29in_boss7[room].playerlist)];
				end
				if(i==3)and(global_29in_boss7[room].runegear[i].status=="on")and(countdown.gearstyle3==0)then
					countdown.gearstyle3=rawget(gearstyle[3],"countdown");
					DebugMsg( 0 , 0 , "火焰噴射");
					if CastSpellLv(global_29in_boss7[room].runegear[i].guid,global_29in_boss7[room].runegear[i].guid,851308,0) then --火焰噴射
						DebugMsg( 0 , 0 , "火焰噴射--true");
					end
				end
				if(i==4)and(global_29in_boss7[room].runegear[i].status=="on")and(countdown.gearstyle4==0)then
					countdown.gearstyle4=rawget(gearstyle[4],"countdown");
					local active={};
					for j=1,#global_29in_boss7[room].runegear,1 do
						if(global_29in_boss7[room].runegear[j].status=="on")then
							table.insert(active,j);
						end
					end
					local r=DW_Rand(#active);
					for j=1,#global_29in_boss7[room].playerlist,1 do
						if(GetDistance(global_29in_boss7[room].runegear[r].guid,global_29in_boss7[room].playerlist[j])<50)then
							DebugMsg( 0 , 0 , "熔岩標記");
							SysCastSpellLv(global_29in_boss7[room].runegear[4].guid,global_29in_boss7[room].playerlist[j],851312,0); --熔岩標記
						end
					end
				end
			end
			--魔焰擴散
			for i=1,1,1 do
				if(gearstyle[2].player==0)then
					break;
				end
				if(CheckID(gearstyle[2].player)==false)or(ReadRoleValue(gearstyle[2].player,EM_RoleValue_IsDead)==1)then
					gearstyle[2].player=0;
					gearstyle[2].last=0;
					break;
				end
				if(gearstyle[2].last==0)then
					--警告
					DebugMsg( 0 , 0 , "魔焰寄生 : "..tostring( gearstyle[2].player ) );
					AddBuff(gearstyle[2].player,625022,0,5);
					local msg="[SC_29IN_BOSS7_AEROLITE_WARNING][$SETVAR1="..GetName(gearstyle[2].player).."]";--[$VAR1]被克洛普斯植入了魔焰！
					DW_roombroadcast(1,msg,C_YELLOW);
					DW_roombroadcast(0,msg,C_YELLOW);
					gearstyle[2].last=gearstyle[2].last+1;
					break;
				end
				if(gearstyle[2].last>=5)and(CheckID(gearstyle[2].player)==true)and(ReadRoleValue(gearstyle[2].player,EM_RoleValue_IsPlayer)==0)then
					CancelBuff_NoEvent(gearstyle[2].player,625022);
					local x,y,z,dir=DW_Location(gearstyle[2].player);
					CastSpellPos(global_29in_boss7[room].runegear[2].guid,x,y,z,851310,0);
					gearstyle[2].player=0;
					gearstyle[2].last=0;
				end
				if(gearstyle[2].last>0)then
					gearstyle[2].last=gearstyle[2].last+1;
					break;
				end
			end
		end
		if(phase==2)then
			for i=1,#global_29in_boss7[room].playerlist,1 do
				if(ReadRoleValue(global_29in_boss7[room].playerlist[i],EM_RoleValue_Y)<=min)then
					SysCastSpellLv(thunder_floor,global_29in_boss7[room].playerlist[i],851311,0);
				end
			end
		end
	end
	DebugMsg(0,room,"combat loop end")
	--重置一切
	for i=1,#global_29in_boss7[room].floating,1 do
		local s=global_29in_boss7[room].floating[i].guid;
		DelObj(s);
	end
	for i=1,#global_29in_boss7[room].runegear,1 do
		local g=global_29in_boss7[room].runegear[i].guid;
		DelObj(g);
	end
	DelObj(thunder_floor);
	for i=1,#firelist,1 do
		DelObj(firelist[i].guid);
	end

	local _frontDoorID = ReadRoleValue( boss , EM_RoleValue_Register9 );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門
	DelObj(_frontDoorID);	
	local _backDoorID = ReadRoleValue( boss , EM_RoleValue_Register10 );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門
	DelObj(_backDoorID);

	if(reset==false)then
		--克洛普斯被擊敗
		DebugMsg(0,room,"Boss Defeated")
		DW_roombroadcast(2,"[SC_29IN_BOSS7_END]",C_LightBlue);--基德船長，這......就是你所說的結局吧？我終於完成了......
		DelObj(ctrl);
		global_29in_boss7[room]=nil;
		return;
	end

	DW_roombroadcast(2,"[SC_29IN_BOSS7_FAIL]",C_LightBlue);--沒有人可以接近煉獄號！這裡就由我來守護！
	DW_UnFight(boss,true);
	SetStopAttack(boss);
	
	sleep(50);
	DW_UnFight(boss,false);
	DelObj(ctrl);
	
end

function Lua_703019_Boss7_Dead( _ownerID )
	_ownerID = _ownerID or OwnerID();
	local _roomID = ReadRoleValue( _ownerID , EM_RoleValue_RoomID );
	--local _gConsts = global_29in_boss7[ _roomID ];
	local _backDoorID = ReadRoleValue( _ownerID , EM_RoleValue_Register10 );-- EM_RoleValue_Register9 = 前門  ,  EM_RoleValue_Register10 = 後門
	DelObj( _backDoorID );
	sasa_ZoneDungeon_title_01(530949);
	--global_29in_boss7[_roomID]=nil;
end

--符文機關觸碰劇情
function lua_29in_boss7_runegear_touch()
	DebugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"--lua_29in_boss7_runegear_touch--");
	local player,g=OwnerID(),TargetID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	local peg=ReadRoleValue(g,EM_RoleValue_Register1);
	DebugMsg(0,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID),"peg="..peg);
	SetPlot(g,"touch","",0);
	global_29in_boss7[room].runegear[peg].status="off";
end
--火球術選取命中對象
function lua_29in_boss7_fireball()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local rtable=global_29in_boss7[room].playerlist;
	local r=DW_Ran(#global_29in_boss7[room].playerlist);
	local n=2;
	if(#global_29in_boss7[room].playerlist<=n)then
		n=#global_29in_boss7[room].playerlist;
	end
	for i=1,n,1 do
		PushMagicShootTarget(global_29in_boss7[room].playerlist[r()]);
	end
	return true;
end
--火星濺射選取命中對象
function lua_29in_boss7_firestar()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local rtable=global_29in_boss7[room].playerlist;
	local r=DW_Ran(#global_29in_boss7[room].playerlist);
	local n=5;
	if(#global_29in_boss7[room].playerlist<=n)then
		n=#global_29in_boss7[room].playerlist;
	end
	for i=1,n,1 do
		PushMagicShootTarget(global_29in_boss7[room].playerlist[r()]);
	end
	return true;
end