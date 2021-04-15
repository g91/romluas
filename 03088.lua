--進入戰鬥時觸發
function lua_29in_Boss2_LuaEvent_BeginAttack()
	Cl_Resist_HackersFightBegin();
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(ctrl,room);
	CallPlot(ctrl,"DW_tokenrule",boss);
	BeginPlot(ctrl,"lua_29in_Boss2_main",0);
	
	--阻擋牆
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	local w;
	if(zone==164) or (zone==165) then
		local x,y,z,dir= 1908 , 774.2 , 625.6 , 188;
		w=CreateObj(106234,x,y,z,dir,1);
	else
		local x,y,z,dir=DW_Location(781364,2);
		w=CreateObj(106234,x,y,z,dir,1);
	end
	SetModeEx(w,EM_SetModeType_Mark,false);
	SetModeEx(w,EM_SetModeType_Obstruct,true);
	SetModeEx(w,EM_SetModeType_ShowRoleHead,false);
	DW_UnFight(w,true);
	AddToPartition(w,room);
	CallPlot(w,"DW_tokenrule",ctrl);
end
--主戰鬥迴圈(中控器執行)
function lua_29in_Boss2_main()
	local boss,ctrl=TargetID(),OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	local phase=1;
	local increase=1;
	local gcd=0
	local countdown={	column=15;
				poke=7;
				blind=20;
				field=20;
				rift=10;
				fatal=5;	};
	
	--狂亂激長
	local column={countdown=15;vine={};org=108324;};
	if(zone==164)then
		column.org=108410;
	elseif(zone==165)then
		column.org=108416;
	end
	--穿刺連擊
	local poke={countdown=7;area={};};
	--時空扭曲
	local blind={countdown=20;player={};};
	--時空流逝領域
	local field={countdown=20;area={};};
	--分裂
	local fission={last=100;org=108323;};
	if(zone==164)then
		fission.org=108409;
	elseif(zone==165)then
		fission.org=108415;
	end
	--時空亂流
	local rift={countdown=10;angle=DW_Ran(6);dis=DW_Ran(6);vine={};};
	local fatal={countdown=5;};
	
	
	
	local data_panel={guid=0;check=true;on_column=false;poked=false;in_blind=false;}
	local list={};
	local playerlist={};
	
	--排除不合法的資料
	local function exclude_outlaw(_table)
		for i=#_table,1,-1 do
			if(_table.check==false)then
				table.remove(_table,i);
			end
		end
	end
	--建立初始資料
	local function initial_player_data(table)
		for i,v in pairs(data_panel)do
			table[i]=rawget(data_panel,i);
		end
	end
	
	
	DW_roombroadcast(2,"[SC_29IN_BOSS2_START]",0);--[108275]身上的葉片因為獵物出現而興奮的顫動！
	--DW_roombroadcast(2,"[SC_29IN_BOSS2_END]",0);--[108275]身上的葉片因為獵物出現而興奮的顫動！
	
	local reset=false;

	local fury_course = false;
	while true do
		sleep(10);
	--reset
		list={};
		for i=1,#playerlist,1 do
			playerlist[i].check=false;
		end
	--keep
		if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
			break;
		end
		--時間相關
		increase=increase+1;
		if(gcd>0)then
			gcd=gcd-1;
		end
		for cd_type,sec in pairs(countdown)do
			if(sec>0)then
				countdown[cd_type]=sec-1;
			end
		end

		--狂暴機制	--K.J. Aris 131023
		if(zone~=165)and(fury_course==false)then
			if(zone==163)and(increase>=480) or (zone==164)and(increase>=360)then
				fury_course=true;
				AddBuff(boss,625099,0,-1);
			end
		end


		--玩家列表
		local maxhate=0;
		local tank={};
		initial_player_data(tank);
		for pos=0,HateListCount(boss)-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				local onlist=false;
				for i=1,#playerlist,1 do
					if(playerlist[i].guid==id)then
						--已在舊名單上
						onlist=true;
						playerlist[i].check=true;
						if(maxhate<point)then
							tank=playerlist[i];
						end
						break;
					end
				end
				if(onlist==false)then
					--新進仇恨列表
					playerlist[#playerlist+1]={};
					initial_player_data(playerlist[#playerlist]);
					playerlist[#playerlist].guid=id;
					if(maxhate<point)then
						tank=playerlist[#playerlist];
					end
				end
			end
		end
		for i=#playerlist,1,-1 do
			if(playerlist[i].check==false)then
				--未通過更新確認的玩家
				table.remove(playerlist,i);
			end
		end
		exclude_outlaw(playerlist);
		if(playerlist==nil)or(#playerlist==0)then
			--沒有玩家在仇恨中
			DW_roombroadcast(2,"[SC_29IN_BOSS2_FAIL]",0);--[108275]飽足地回到它原本所處的時空之中......
			reset=true;
			break;
		end
		--分裂
		local percent=DW_GetHPpercent(boss);
		if(fission.last-percent>=10)then
			fission.last=percent;
			local x,y,z,dir=DW_Location(boss);
			local f=CreateObj(fission.org,x,y,z,dir,1);
			AddToPartition(f,room);
			CallPlot(f,"DW_tokenrule",ctrl);
			AddBuff(f,625026,0,-1);
			AddBuff(f,625027,0,-1);
			fission[#fission+1]={guid=f;};
			SetAttack(f,playerlist[DW_Rand(#playerlist)].guid);
			DW_roombroadcast(2,"[SC_29IN_BOSS2_FISSION]",0);--[108275]分裂出一個同樣嗜血的個體！
		end
		for i=#fission,1,-1 do
			if(CheckID(fission[i].guid)==false)or(ReadRoleValue(fission[i].guid,EM_RoleValue_IsDead)==1)then
				--衍體 已死
				local buff_lv=fission[i].stake;
				if(buff_lv~=nil)then
					--賦予boss能力
					AddBuff(boss,625028,buff_lv,-1);
				end
				DelObj(fission[i].guid);
				table.remove(fission,i);
			else
				--衍體 存活
				if(CheckBuff(fission[i].guid,625027)==true)then
					fission[i].stake=BuffInfo(fission[i].guid,Lua_BuffPosSearch(fission[i].guid,625027),EM_BuffInfoType_Power);
				else
					--未得過任何狀態
					fission[i].stake=nil;
				end
				if(HateListCount(fission[i].guid)==0)then
					--閒置狀態
					local buff_lv=fission[i].stake;
					if(buff_lv~=nil)then
						--賦予boss能力
						AddBuff(boss,625027,buff_lv,-1);
					end
					CancelBuff_NoEvent(boss,625027);
					SetAttack(fission[i].guid,playerlist[DW_Rand(#playerlist)].guid)
				end
			end
		end
		--階段轉換
		if(phase==1)and(percent<=30)then
			phase=2;
			DW_roombroadcast(2,"[SC_29IN_BOSS2_PHASE]",0);--[108275]對於獵物的強悍感到緊張，開始摧動禁忌符文的力量......
		end
		--穿刺連擊
		for i=#poke.area,1,-1 do
			if(poke.area[i].countdown==0)then
				--時間已到
				DelObj(poke.area[i].guid);
				table.remove(poke.area,i);
			else
				for j=1,#playerlist,1 do
					local x,y,z,dir=DW_Location(playerlist[j].guid);
					if(DW_GetDistance(poke.area[i].guid,x,GetHeight(x,y,z),z)<=50)then
						--範圍內的玩家
						AddBuff(playerlist[j].guid,625030,0,5);
					end
				end
				poke.area[i].countdown=poke.area[i].countdown-1;
			end
		end
		--時空扭曲
		for i=#blind.player,1,-1 do
			if(blind.player[i].countdown==0)then
				--效果結束
				CancelBuff_NoEvent(blind.player[i].guid,625031);
				CancelBuff_NoEvent(blind.player[i].guid,625032);
				table.remove(blind.player,i);
			else
				if(blind.player[i].procession==4)then
					--第五階段
					AddBuff(blind.player[i].guid,625031,0,-1);
				elseif(blind.player[i].procession==1)or(blind.player[i].procession==3)then
					--第二、四階段
					CancelBuff_NoEvent(blind.player[i].guid,625031);
				elseif(blind.player[i].procession==0)or(blind.player[i].procession==2)then
					--第一、三階段
					AddBuff(blind.player[i].guid,625031,0,1);
					AddBuff(blind.player[i].guid,625032,0,-1);
				end
				if(increase%2==0)then
					blind.player[i].procession=blind.player[i].procession+1;
				end
			end
		end
		--狂亂激長
		for i=#column.vine,1,-1 do
			if(CheckID(column.vine[i].guid)==false)or(ReadRoleValue(column.vine[i].guid,EM_RoleValue_IsDead)==1)then
				for j=1,#playerlist,1 do
					if(playerlist[j].guid==column.vine[i].lock_player)then
						--若束縳的對象比對相同
						playerlist[j].on_column=false;
						break;
					end
				end
				CancelBuff_NoEvent(column.vine[i].lock_player,625033);
				DelObj(column.vine[i].barrier);
				table.remove(column.vine,i);
			end
		end
		--時空流逝領域
		for i=#field.area,1,-1 do
			if(increase%2==0)then
				local x,y,z,dir=DW_Location(field.area[i].guid);
				local a=CreateObj(108325,x,y,z,dir,1);
				SetModeEx(a,EM_SetModeType_Show,false);
				SetModeEx(a,EM_SetModeType_Mark,false);
				SetModeEx(a,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(a,EM_SetModeType_HideName,true);
				DW_UnFight(a,true);
				WriteRoleValue(a,EM_RoleValue_LiveTime,1);
				AddToPartition(a,room);
				SysCastSpellLv(a,field.area[i].guid,851319,0);
				field.area[i].dis=math.floor(field.area[i].dis*1.1);
			end
			local special_delete=false;
			for j=1,#playerlist,1 do
				if(GetDistance(field.area[i].guid,playerlist[j].guid)<=field.area[i].dis)then
					--時空流逝領域 內的玩家
					SysCastSpellLv(boss,playerlist[j].guid,851316,0);
					if(CheckBuff(playerlist[j].guid,625032)==true)then
						--身上帶有 時空扭曲 的玩家
						CancelBuff_NoEvent(playerlist[j].guid,625031);
						CancelBuff_NoEvent(playerlist[j].guid,625032);
						special_delete=true;
					end
				end
			end
			field.area[i].countdown=field.area[i].countdown-2;
			if(field.area[i].countdown==0)or(special_delete==true)then
				--刪除 時空流逝領域
				WriteRoleValue(field.area[i].guid,EM_RoleValue_LiveTime,1);
				table.remove(field.area,i);
			end
		end
		--時空亂流
		for i=#rift,1,-1 do
			if(rift[i].countdown==0)then
				local occupy=false;
				for j=1,#playerlist,1 do
					if(GetDistance(rift[i].guid,playerlist[j].guid)<20)then
						--只要有玩家在
						occupy=true;
						break;
					end
				end
				if(occupy==false)then
					--沒有玩家在
					local x,y,z,dir=DW_Location(rift[i].guid);
					local c=CreateObj(108336,x,y,z,dir,1);
					SetModeEx(c,EM_SetModeType_Mark,false);
					SetModeEx(c,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(c,EM_SetModeType_HideName,true);
					DW_UnFight(c,true);
					AddToPartition(c,room);
					CallPlot(c,"DW_tokenrule",ctrl);
					fatal[#fatal+1]={guid=c;};
					DelObj(rift[i].guid);
					table.remove(rift,i);
				end
			else
				rift[i].countdown=rift[i].countdown-1;
			end
		end
	--coldown
		for oneshot=1,1,1 do
			if(gcd~=0)then
				break;
			end
			--穿刺連擊
			if(countdown.poke==0)then
				countdown.poke=rawget(poke,"countdown");
				DebugMsg(0,room,"時空熵")
				local rtable={};
				local back_up={};
				for i=1,#playerlist,1 do
					if(playerlist[i].on_column==false)then
						rtable[#rtable+1]=playerlist[i];
					else
						back_up[#back_up+1]=playerlist[i];
					end
				end
				local n=3;
				if(#rtable<=3)then
					for i=#back_up,1,-1 do
						rtable[#rtable+1]=table.remove(back_up,i);
					end
					if(#rtable<=3)then
						n=#rtable;
					end
				end
				local rand_pick=DW_Ran(#rtable);
				for i=1,n,1 do
					local index=rand_pick();
					playerlist[index].poked=true;
					local x,y,z,dir=DW_Location(playerlist[index].guid);
					local p=CreateObj(108337,x,GetHeight(x,y,z),z,dir,1);
					SetModeEx(p,EM_SetModeType_Mark,false);
					SetModeEx(p,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(p,EM_SetModeType_HideName,true);
					DW_UnFight(p,true);
					AddToPartition(p,room);
					CallPlot(p,"DW_tokenrule",ctrl);
					poke.area[#poke.area+1]={guid=p;countdown=5;};
				end
			end
			--時空扭曲
			if(countdown.blind==0)then
				countdown.blind=rawget(blind,"countdown");
				DebugMsg(0,room,"時空扭曲")
				local rtable={};
				local back_up={};
				for i=1,#playerlist,1 do
					if(playerlist[i].on_column==false)then
						rtable[#rtable+1]=playerlist[i];
					else
						back_up[#back_up+1]=playerlist[i];
					end
				end
				local n=3;
				if(#rtable<=3)then
					for i=#back_up,1,-1 do
						rtable[#rtable+1]=table.remove(back_up,i);
					end
					if(#rtable<=3)then
						n=#rtable;
					end
				end
				local rand_pick=DW_Ran(#rtable);
				for i=1,n,1 do
					local index=rand_pick();
					playerlist[index].in_blind=true;
					AddBuff(playerlist[index].guid,625032,0,-1);
					blind.player[#blind.player+1]={guid=rawget(playerlist[index],"guid");countdown=12;procession=0;};
				end
			end
			--狂亂激長
			if(countdown.column==0)then
				countdown.column=rawget(column,"countdown");
				DebugMsg(0,room,"狂亂激長")
				local rtable={};
				local back_up={};
				local tank_index=0;
				for i=1,#playerlist,1 do
					if(playerlist[i].on_column==false)and(playerlist[i].poked==false)and(playerlist[i].in_blind==false)then
						rtable[#rtable+1]=playerlist[i];
						if(playerlist[i].guid==tank.guid)then
							tank_index=#rtable;
						end
					elseif(playerlist[i].on_column==false)then
						back_up[#back_up+1]=playerlist[i];
					end
				end
				local n=3;
				if(#rtable>3)then
					table.remove(rtable,tank_index);
				else
					for i=#back_up,1,-1 do
						rtable[#rtable+1]=table.remove(back_up,i);
						if(rtable[#rtable].guid==tank.guid)then
							tank_index=#rtable;
						end
					end
					if(#rtable>3)then
						table.remove(rtable,tank_index);
					else
						n=#rtable;
					end
				end
				local rand_pick=DW_Ran(#rtable);
				for i=1,n,1 do
					local index=rand_pick();
					playerlist[index].on_column=true;
					local x,y,z,dir=DW_Location(playerlist[index].guid);
					local c=CreateObj(column.org,x,GetHeight(x,y,z),z,dir,1);
					SetModeEx(c,EM_SetModeType_Searchenemy,false);
					SetModeEx(c,EM_SetModeType_Strikback,false);
					AddToPartition(c,room);
					CallPlot(c,"DW_tokenrule",ctrl);
					column.vine[#column.vine+1]={guid=c;lock_player=playerlist[index].guid;};
					
					local b=CreateObj(108325,x,y+35,z,dir,1);
					SetModeEx(b,EM_SetModeType_Show,false);
					SetModeEx(b,EM_SetModeType_Obstruct,true);
					SetModeEx(b,EM_SetModeType_Mark,false);
					SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(b,EM_SetModeType_HideName,true);
					SetModeEx(b,EM_SetModeType_Gravity,false);
					SetModeEx(b,EM_SetModeType_Move,false);
					DW_UnFight(b,true);
					AddToPartition(b,room);
					CallPlot(b,"DW_tokenrule",ctrl);
					column.vine[#column.vine].barrier=b;
					
					SetPos(playerlist[index].guid,x,y+40,z,dir)
					AddBuff(playerlist[index].guid,625033,0,-1);
					ScriptMessage(playerlist[index].guid,playerlist[index].guid,1,"[SC_29IN_BOSS2_VINE]",C_YELLOW);--快速生長的藤蔓困住了你的行動！
				end
			end
			--時空流逝領域
			if(countdown.field==0)then
				countdown.field=rawget(field,"countdown");
				DebugMsg(0,room,"時空流逝領域")
				local pickthree=DW_Ran(6);
				local x,y,z,dir=DW_Location(781364,3);
				for i=1,3,1 do
					x,y,z,dir=DW_NewLocation(pickthree()*60,150,x,y,z,dir);
					local f=CreateObj(108326,x,y,z,dir,1);
					SetModeEx(f,EM_SetModeType_Mark,false);
					SetModeEx(f,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(f,EM_SetModeType_HideName,true);
					DW_UnFight(f,true);
					AddToPartition(f,room);
					CallPlot(f,"DW_tokenrule",ctrl);
					field.area[#field.area+1]={guid=f;dis=30;countdown=10;};
				end
			end
			--時空亂流
			if(phase==2)and(countdown.rift==0)then
				countdown.rift=rawget(rift,"countdown");
				DebugMsg(0,room,"時空亂流")
				local x,y,z,dir=DW_Location(781364,3);
				x,y,z,dir=DW_NewLocation(rift.angle()*60,rift.dis()*30,x,y,z,DW_Rand(30)*12);
				local r=CreateObj(108335,x,y,z,dir,1);
				SetModeEx(r,EM_SetModeType_Mark,false);
				SetModeEx(r,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(r,EM_SetModeType_HideName,true);
				DW_UnFight(r,true);
				AddToPartition(r,room)
				AddBuff( r , 625932 , 0 , -1 );--625932崩壞點特效
				CallPlot(r,"DW_tokenrule",ctrl);
				rift[#rift+1]={guid=r;countdown=5;};
			end
			if(phase==2)and(countdown.fatal==0)then
				countdown.fatal=rawget(fatal,"countdown");
				for i=1,#fatal,1 do
					SysCastSpellLv(boss,boss,851315,0);
				end
				if(#fatal>0)then
					SysCastSpellLv(boss,boss,851317,0);
				end
			end
		end
	end
	
	for i=#column.vine,1,-1 do
		CancelBuff_NoEvent(column.vine[i].lock_player,625033);
		DelObj(column.vine[i].guid);
		DelObj(column.vine[i].barrier);
	end
	for i=#poke.area,1,-1 do
		DelObj(poke.area[i].guid);
	end
	for i=#blind.player,1,-1 do
		CancelBuff_NoEvent(blind.player[i].guid,625031);
		CancelBuff_NoEvent(blind.player[i].guid,625032);
	end
	for i=#field.area,1,-1 do
		DelObj(field.area[i].guid);
	end
	for i=#fission,1,-1 do
		DelObj(fission[i].guid);
	end
	for i=#fatal,1,-1 do
		DelObj(fatal[i].guid);
	end
	
	if(reset==true)then
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50);
		DW_UnFight(boss,false);
		DelObj(ctrl);
		return
	end
	
	DebugMsg( 0 , 0 , "--Boos 2 Dead : " );
	DW_roombroadcast(2,"[SC_29IN_BOSS2_END]",0);--[108275]承受不了猛烈的攻擊，在莖幹斷裂的噪音中倒下了！
	--DW_roombroadcast(2,"[SC_29IN_BOSS2_START]",0);

	DelObj(ctrl);
	
end
--普攻觸發 效果
function lua_29in_Boss2_Additional()
	local who=OwnerID();
	if(CheckBuff(who,625028)==true)then
		local buff_pos=Lua_BuffPosSearch(who,625028);
		local buff_lv=BuffInfo(who,buff_pos,EM_BuffInfoType_Power);
		SysCastSpellLv(who,who,851314,buff_lv);
		return true;
	elseif(CheckBuff(who,625027)==true)then
		AddBuff(who,625027,0,-1);
		return true;
	end
	return false;
end
--出生時觸發
function lua_29in_Boss2_szLuaInitScript()
	Cl_Resist_HackersBossNum();
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local n=1;
	for i=1,n,1 do
		local x,y,z,dir=DW_Location(781364,i);
		local d=CreateObj(106234,x,y,z,dir,1);
		SetModeEx(d,EM_SetModeType_Mark,false);
		SetModeEx(d,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(d,EM_SetModeType_Obstruct,true);
		DW_UnFight(d,true);
		AddToPartition(d,room);
		CallPlot(d,"DW_tokenrule",boss);
	end
end

function lua_29in_Boss2_Dead()
	DebugMsg( 0 , 0 , "--lua_29in_Boss2_Dead " );
	Cl_Resist_HackersBossDead();
	DW_roombroadcast(2,"[SC_29IN_BOSS2_END]",0);--[108275]承受不了猛烈的攻擊，在莖幹斷裂的噪音中倒下了！
	--DW_roombroadcast(2,"[SC_29IN_BOSS2_START]",0);
end