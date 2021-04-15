--進入戰鬥觸發
function lua_29in_boss4_LuaEvent_BeginAttack()
	Cl_Resist_HackersFightBegin();
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(ctrl,EM_SetModeType_HideName,true);
	AddToPartition(ctrl,room);
	BeginPlot(ctrl,"lua_29in_boss4_main",0);
	CallPlot(ctrl,"DW_tokenrule",boss);
	
	--阻擋牆
	local x,y,z,dir=DW_Location(781367,3);
	local w=CreateObj(106234,x,y,z,dir,1);
	SetModeEx(w,EM_SetModeType_Obstruct,true);
	SetModeEx(w,EM_SetModeType_Mark,false);
	SetModeEx(w,EM_SetModeType_ShowRoleHead,false);
	DW_UnFight(w,true);
	AddToPartition(w,room);
	CallPlot(w,"DW_tokenrule",ctrl);
end
--主戰鬥迴圈
function lua_29in_boss4_main()
	local ctrl,boss=OwnerID(),TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	
	
	--全域宣告
	global_29in_boss4=global_29in_boss4 or {};
	global_29in_boss4[room]={};
	
	--物件資料
	local mist={};	--毒霧
	local mud={};	--小泥怪
	global_29in_boss4[room].subordinate={};	--分身
	global_29in_boss4[room].harvested={};	--可採收的泥堆
	global_29in_boss4[room].immature={number=15;radius=30;};	--生泥堆
	for pos=1,global_29in_boss4[room].immature.number,1 do
		local x,y,z,dir=DW_Location(781366,pos);
		local i=CreateObj(108338,x,y,z,dir,1);
		SetModeEx(i,EM_SetModeType_Mark,false);
		SetModeEx(i,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(i,EM_SetModeType_HideName,true);
		DW_UnFight(i,true);
		AddToPartition(i,room);
		CallPlot(i,"DW_tokenrule",ctrl);
		global_29in_boss4[room].immature[pos]={guid=i;};
	end
	
	--玩家資料
	local list={};
	global_29in_boss4[room].playerlist={};
	global_29in_boss4[room].tank={guid=0;};
	
	--時間資料
	local increase=0;
	local gcd=0;
	local countdown={	fatalbuff=19;
				gas=1;
				cure=13;
				randatk=7;
					};
					
	--技能資料
	--溢散毒氣
	local gas={countdown=2;};
	--毒蝕
	local fatalbuff={countdown=19;};
	--匯聚腐爛
	local cure={countdown=13;};
	--二選一
	local randatk={countdown=7;};
	
	
	
	--狀態資料
	local phase="unity";
	local cast_divide_effect=false;
	local reset=false;
	local last_pos={};
	
	--初始狀態
	AddBuff(boss,625039,0,-1);
	DW_roombroadcast(2,"[SC_29IN_BOSS4_START]",0);--這團惡臭的腐爛物開始劇烈活動起來，剎時間整個空間佈滿了毒氣！
	local fury_course = false;
	while true do
		local x,y,z,dir=DW_Location(boss);
		last_pos.x,last_pos.y,last_pos.z,last_pos.dir=x,y,z,dir;
		sleep(10);
	--reset
		--玩家資料重置
		list={};
		for i=#global_29in_boss4[room].playerlist,1,-1 do
			global_29in_boss4[room].playerlist[i].check=false;
		end
	--keep
		--時間資料處理
		increase=increase+1
		if(gcd>0)then
			gcd=gcd-1;
		end
		for cd_type,sec in pairs(countdown)do
			if(sec>0)then
				countdown[cd_type]=sec-1;
			end
		end
		-- 狀態
		if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
			break;
		end

		--狂暴機制	--K.J. Aris 131023
		if(zone~=165)and(fury_course==false)then
			if(zone==163)and(increase>=480) or (zone==164)and(increase>=360)then
				fury_course=true;
				AddBuff(boss,625099,0,-1);
			end
		end


		--仇恨資料
		local maxhate=0;
		for pos=0,HateListCount(boss)-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
			list[#list+1]={guid=id;};
			if(point>maxhate)then
				maxhate=point;
				global_29in_boss4[room].tank={guid=id;};
			end
			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				local in_list=false;
				for i=#global_29in_boss4[room].playerlist,1,-1 do
					if(global_29in_boss4[room].playerlist[i].guid==id)then
						--在既有名單上
						in_list=true;
						global_29in_boss4[room].playerlist[i].check=true;
						break;
					end
				end
				if(in_list==false)then
					--不在既有名單上
					global_29in_boss4[room].playerlist[#global_29in_boss4[room].playerlist+1]={guid=id;};
				end
			end
		end
		for i=#global_29in_boss4[room].playerlist,1,-1 do
			if(global_29in_boss4[room].playerlist[i].check==false)then
				--已不在仇恨列表上的玩家
				table.remove(global_29in_boss4[room].playerlist,i);
			end
		end
		if(#global_29in_boss4[room].playerlist==0)then
			reset=true;
			break;
		end
		--階段處理
		for movement=1,1,1 do
			if(phase=="unity")then
				--合體狀態
				if(CheckBuff(boss,625039)==false)then
					--護盾被打破
					local x,y,z,dir=DW_Location(781367,4);
					--local x,y,z,dir=DW_Location( boss );--140724 K.J. Aris
					for i=1,4,1 do
						x,y,z,dir=DW_Location( 781367,4 );--140724 K.J. Aris
						x,y,z,dir=DW_NewLocation(90*i,150,x,y,z,dir);
						
						--x = x + ( RandRange( 1 , 300 ) -150 );
						--z = z + ( RandRange( 1 , 300 ) -150 );
						local _CorpseID = 108339;
						if(zone==164)then
							_CorpseID=108412;
						elseif(zone==165)then
							_CorpseID=108418;
						end
						local s=CreateObj(_CorpseID,x,y,z,dir,1);--裂解腐體
						SetModeEx(s,EM_SetModeType_Show,false);
						SetModeEx(s,EM_SetModeType_Mark,false);
						SetModeEx(s,EM_SetModeType_ShowRoleHead,false);
						DW_UnFight(s,true);
						MoveToFlagEnabled(s,false);
						AddBuff( s , 620434 , 0 , -1 );--被攻擊會緩速
						AddToPartition(s,room);
						LockHP(s,DW_GetHPpercentVar(s,99),"");
						CallPlot(s,"DW_tokenrule",ctrl);
						global_29in_boss4[room].subordinate[i]={guid=s;};
					end
					cast_divide_effect=true;
					phase="fission";
					break;
				end
				--留下毒霧
				if(DW_GetDistance(boss,last_pos.x,last_pos.y,last_pos.z)>40)then
					--每隔一段距離
					local x,y,z=DW_Relative(boss,last_pos.x,last_pos.y,last_pos.z,30);
					local s=CreateObj(108340,x,y,z,DW_Rand(360),1);
					SetModeEx(s,EM_SetModeType_Mark,false);
					SetModeEx(s,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(s,EM_SetModeType_HideName,true);
					SetModeEx(s,EM_SetModeType_Move,false);
					DW_UnFight(s,true);
					AddToPartition(s,room);
					CallPlot(s,"DW_tokenrule",ctrl);
					mist[#mist+1]={guid=s;countdown=10;};
				end
			else
				--分裂狀態
				if(#global_29in_boss4[room].subordinate==0)then
					DW_roombroadcast(2,"[SC_29IN_BOSS4_UNITY]",0);--[108279]再次被腐爛的物質完整的包覆起來......
					--分身都已被吸收
					AddBuff(boss,625039,0,-1);--腐體外衣
					CancelBuff_NoEvent(boss,625042);
					phase="unity";
					break;
				end
			end
		end
		--毒氣判定
		for i=#mist,1,-1 do
			mist[i].countdown=mist[i].countdown-1;
			for j=#global_29in_boss4[room].playerlist,1,-1 do
				if(GetDistance(global_29in_boss4[room].playerlist[j].guid,mist[i].guid)<=35)then
					--玩家距離毒氣太近
					SysCastSpellLv(boss,global_29in_boss4[room].playerlist[j].guid,851321,0);
				end
			end
			if(mist[i].countdown==0)then
				--時限已到
				DelObj(mist[i].guid);
				table.remove(mist,i)
			end
		end
		--生泥堆判定
		for i=#global_29in_boss4[room].immature,1,-1 do
			if(GetDistance(global_29in_boss4[room].immature[i].guid,boss)<=20)then
				--當 卡托布萊帕斯 靠近生泥堆
				global_29in_boss4[room].harvested[#global_29in_boss4[room].harvested+1]={guid=global_29in_boss4[room].immature[i].guid;mushroom={};};
				local x,y,z,dir=DW_Location(global_29in_boss4[room].immature[i].guid);
				local a=DW_Ran(6);
				for j=1,3,1 do
					--輪流產生 菇類
					x,y,z,dir=DW_NewLocation(a()*60,25,x,y,z,dir);
					local m=CreateObj(108341,x,y,z,dir,1);
					SetModeEx(m,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(m,EM_SetModeType_HideName,true);
					SetModeEx(m,EM_SetModeType_Move,false);
					DW_UnFight(m,true);
					AddToPartition(m,room);
					SetPlot(m,"touch","lua_29in_boss4_touching",40);
					SetCursorType(m,eCursor_Herb);
					CallPlot(m,"DW_tokenrule",ctrl);
					global_29in_boss4[room].harvested[#global_29in_boss4[room].harvested].mushroom[j]={guid=m;}
					WriteRoleValue(m,EM_RoleValue_Register1,#global_29in_boss4[room].harvested);
					WriteRoleValue(m,EM_RoleValue_Register2,j);
				end
				
				for j=1,3,1 do
					--輪流產生 小泥怪
					x,y,z,dir=DW_NewLocation(a()*60,40,x,y,z,dir);
					local _MuddyID = 108342;
						if(zone==164)then
							_MuddyID=108413;
						elseif(zone==165)then
							_MuddyID=108419;
						end


					local m=CreateObj(_MuddyID,x,y,z,dir,1);
					AddToPartition(m,room);
					LockHP(m,1,"lua_29in_boss4_mud_death");
					CallPlot(m,"DW_tokenrule",ctrl);
					mud[#mud+1]={guid=m;countdown=DW_Rand(7);};
					local r=DW_Rand(#global_29in_boss4[room].playerlist);
					SetAttack(m,global_29in_boss4[room].playerlist[r].guid);
				end
				table.remove(global_29in_boss4[room].immature,i);
			end
		end
		--長菇的泥堆
		for i=#global_29in_boss4[room].harvested,1,-1 do
			for j=#global_29in_boss4[room].harvested[i].mushroom,1,-1 do
				if(CheckID(global_29in_boss4[room].harvested[i].mushroom[j].guid)==false)then
					--無效
					table.remove(global_29in_boss4[room].harvested[i].mushroom,j);
				end
			end
			if(#global_29in_boss4[room].harvested[i].mushroom==0)then
				DebugMsg(0,0,"菇類被採收完畢")
				--菇類被採收完畢
				global_29in_boss4[room].immature[#global_29in_boss4[room].immature+1]={guid=global_29in_boss4[room].harvested[i].guid;};
				table.remove(global_29in_boss4[room].harvested,i);
			end
		end
		--裂解腐體 判定
		local absorb=false;
		local x,y,z,dir=DW_Location(boss);
		for i=#global_29in_boss4[room].subordinate,1,-1 do
			if(CheckBuff(global_29in_boss4[room].subordinate[i].guid,625040)==true)then
				if(GetDistance(global_29in_boss4[room].subordinate[i].guid,boss)<=40)then
					--貼近 卡托布萊帕斯
					absorb=true;
					AddBuff(boss,625042,0,-1);
					DelObj(global_29in_boss4[room].subordinate[i].guid);
					table.remove(global_29in_boss4[room].subordinate,i);
					DW_roombroadcast(1,"[SC_29IN_BOSS4_ABSORB]",C_YELLOW);--[108279]吸收了部份落下的穢物！
				else
					Move(global_29in_boss4[room].subordinate[i].guid,x,y,z);
				end
			end
		end
		if(absorb==true)then
			for i=#global_29in_boss4[room].subordinate,1,-1 do
				--有分身被吸收，每個分身都
				CancelBuff_NoEvent(global_29in_boss4[room].subordinate[i].guid,625041);
			end
		end
		--小泥怪
		for i=#mud,1,-1 do
			if(CheckID(mud[i].guid)==false)or(ReadRoleValue(mud[i].guid,EM_RoleValue_IsDead)==1)then
				--無效
				table.remove(mud,i);
			else
				if(HateListCount(mud[i].guid)==0)then
					--閒置中
					local r=DW_Rand(#global_29in_boss4[room].playerlist);
					SetAttack(mud[i].guid,global_29in_boss4[room].playerlist[r].guid);
				end
				if(mud[i].countdown==0)then
					mud[i].countdown=7;
					--招式冷卻結束
					CastSpellLv(mud[i].guid,mud[i].guid,851322,0);
				else
					--倒數
					mud[i].countdown=mud[i].countdown-1;
				end
			end
		end
		--溢散毒氣
		if(countdown.gas==0)then
			--固定時間
			countdown.gas=rawget(gas,"countdown");
			for i=#global_29in_boss4[room].playerlist,1,-1 do
				--SysCastSpellLv(boss,global_29in_boss4[room].playerlist[i].guid,625052,0);
				SysCastSpellLv(boss,global_29in_boss4[room].playerlist[i].guid,851329,0);--140415
			end
		end
	--coldown
		for movement=1,1,1 do
			if(gcd~=0)then break;end
			--腐體裂解
			if(cast_divide_effect==true)then
				DebugMsg(0,0,"腐體裂解");
				cast_divide_effect=false;
				CastSpell(boss,boss,851323);
				DW_roombroadcast(2,"[SC_29IN_BOSS4_SPLIT]",0);--包覆[108279]的那層穢物散落在角落，然後爬了起來......
				gcd=2;
				break;
			end
			--毒蝕
			if(countdown.fatalbuff==0)then
				countdown.fatalbuff=rawget(fatalbuff,"countdown");
				CastSpellLv(boss,boss,851325,0);
				gcd=2;
			end
			--匯聚腐爛
			if(phase=="fission")and(countdown.cure==0)then
				countdown.cure=rawget(cure,"countdown");
				CastSpell(boss,boss,851326);
				gcd=3;
			end
			--二選一
			if(countdown.randatk==0)then
				countdown.randatk=rawget(randatk,"countdown");
				local r=DW_Rand(100);
				if(r>50)then
					CastSpellLv(boss,global_29in_boss4[room].tank.guid,851327,0);
					gcd=5;
				else
					CastSpellLv(boss,boss,851328,0);
					gcd=3;
				end
			end
		end
	end
	
	--清除物件
	for i=#mist,1,-1 do
		DelObj(mist[i].guid);
	end
	for i=#mud,1,-1 do
		DelObj(mud[i].guid);
	end
	for i=#global_29in_boss4[room].subordinate,1,-1 do
		DelObj(global_29in_boss4[room].subordinate[i].guid);
	end
	for i=#global_29in_boss4[room].harvested,1,-1 do
		for j=#global_29in_boss4[room].harvested[i].mushroom,1,-1 do
			DelObj(global_29in_boss4[room].harvested[i].mushroom[j].guid);
		end
		DelObj(global_29in_boss4[room].harvested[i].guid);
	end
	for i=#global_29in_boss4[room].immature,1,-1 do
		DelObj(global_29in_boss4[room].immature[i].guid);
	end


	
	if(reset==true)then
		DW_roombroadcast(2,"[SC_29IN_BOSS4_FAIL]",0);--[108279]似乎因為附近多了幾具爛屍而「欣喜」
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50);
		DW_UnFight(boss,false);
	else
		DW_roombroadcast(2,"[SC_29IN_BOSS4_END]",0);--[108279]掙扎的倒在地上，這下可真的成了名符其實的「爛泥」！
	end
	
	DelObj(ctrl);
end
--目標對準四個分身
function lua_29in_boss4_aim_fissioin()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	for i=#global_29in_boss4[room].subordinate,1,-1 do
		PushMagicShootTarget(global_29in_boss4[room].subordinate[i].guid);
	end
	return true;
end
--使分身現形 開始行動
function lua_29in_boss4_showfission()
	local boss,subordinate=OwnerID(),TargetID();
	SetModeEx(subordinate,EM_SetModeType_Show,true);
	SetModeEx(subordinate,EM_SetModeType_Mark,true);
	SetModeEx(subordinate,EM_SetModeType_ShowRoleHead,true);
	SetModeEx(subordinate,EM_SetModeType_Fight,true);
	AddBuff(subordinate,625040,0,-1);
end
--小泥怪 死亡事件
function lua_29in_boss4_mud_death()
	local mud=OwnerID();
	DebugMsg( 0 , 0 , "lua_29in_boss4_mud_death" );

	local _roomID = ReadRoleValue( mud , EM_RoleValue_RoomID );
	local _dummyGUID = ReadRoleValue( mud , EM_RoleValue_OrgID );
	local x,y,z,dir = DW_Location( mud );
	local _dummyID = CreateObj( _dummyGUID , x,y,z,dir , 1 );
	SetModeEx(_dummyID,EM_SetModeType_Show,false);
	SetModeEx(_dummyID,EM_SetModeType_Mark,false);
	SetModeEx(_dummyID,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(_dummyID,EM_SetModeType_Fight,false);
	WriteRoleValue( _dummyID , EM_RoleValue_LiveTime , 5 );
	AddToPartition( _dummyID , _roomID );

	--SysCastSpellLv(mud,mud,851324,0);
	CastSpell(_dummyID,_dummyID,851324);
	DebugMsg( 0 , 0 , "_dummyID cast : " );
	LockHP(mud,-100,"");
	KillID( mud , mud );
end
--菇類 觸碰劇情
function lua_29in_boss4_touching()
	local player,mushroom=OwnerID(),TargetID();
	SetPlot(mushroom,"touch","",0);
	if(CheckBuff(player,625048)==true)then
		CancelBuff_NoEvent(player,625048);
		ScriptMessage(player,player,1,"[SC_29IN_BOSS4_CANCELBUFF]",C_YELLOW);--你吞下這奇特的菇類後，一陣清涼解除了你的痛苦
	else
		ScriptMessage(player,player,1,"[SC_29IN_BOSS4_NONEED]",C_YELLOW);--這不起眼菇類嚐起來清涼無比，但你目前似乎不需要它
	end
	DelObj(mushroom);
end
--劇情選取 玩家中隨機挑選3位
function lua_29in_boss4_randpick3()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local rtable=global_29in_boss4[room].playerlist;
	for i=#rtable,1,-1 do
		if(CheckID(rtable[i].guid)==false)or(ReadRoleValue(rtable[i].guid,EM_RoleValue_IsDead)==1)then
			table.remove(rtable,i);
		end
	end
	local n=3;
	if(#rtable<n)then
		n=#rtable;
	end
	local r=DW_Ran(#rtable);
	for i=1,n,1 do
		PushMagicShootTarget(rtable[r()].guid);
	end
	return true;
end
--劇情選取 玩家中隨機挑選3位 可以的話排坦
function lua_29in_boss4_except_tank()
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local rtable=global_29in_boss4[room].playerlist;
	for i=#rtable,1,-1 do
		if(CheckID(rtable[i].guid)==false)or(ReadRoleValue(rtable[i].guid,EM_RoleValue_IsDead)==1)then
			table.remove(rtable,i);
		end
	end
	local n=3;
	if(#rtable<=n)then
		n=#rtable;
	else
		--人數足以進行調整
		for i=#rtable,1,-1 do
			if(rtable[i].guid==global_29in_boss4[room].tank.guid)then
				table.remove(rtable,i);
				break;
			end
		end
	end
	local r=DW_Ran(#rtable);
	for i=1,n,1 do
		PushMagicShootTarget(rtable[r()].guid);
	end
	return true;
end
--毒蝕 訊息
function lua_29in_boss4_FATALMSG()
	ScriptMessage(OwnerID(),TargetID(),1,"[SC_29IN_BOSS4_FATAL]",C_YELLOW);--你的喉嚨像刀割般的疼痛，你知道自己就快死了！
	return true;
end
--初始存在場上的阻擋門
function lua_29in_boss4_szLuaInitScript()
	Cl_Resist_HackersBossNum();
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local n=2;
	for i=1,n,1 do
		local x,y,z,dir=DW_Location(781367,i);
		local d=CreateObj(106234,x,y,z,dir,1);
		SetModeEx(d,EM_SetModeType_Mark,false);
		SetModeEx(d,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(d,EM_SetModeType_Obstruct,true);
		DW_UnFight(d,true);
		AddToPartition(d,room);
		CallPlot(d,"DW_tokenrule",boss);
	end
end




function lua_29in_boss4_test_noshield()--140722 K.J. Aris   --測試指令  直接消除 腐體外衣
	local _ownerID = OwnerID();
	local _targetID = TargetID();
	CancelBuff_NoEvent( _ownerID , 625039 );--腐體外衣
	CancelBuff_NoEvent( _targetID , 625039 );

end