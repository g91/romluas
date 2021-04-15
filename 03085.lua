function lua_28in_Boss5_tokenrule(master)
--衍生物規則
	while true do
		sleep(10);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			DelObj(OwnerID());
			return;
		end
	end
end
function lua_28in_Boss5_broadcast(msg_type,msg,msg_color)
--廣播至同一層的
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
function lua_28in_Boss5_LuaEvent_BeginAttack()
--進入戰鬥觸發
	local boss=OwnerID();
	local room=ReadRoleValue(boss, EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	AddToPartition(ctrl,room);
	CallPlot(ctrl,"lua_28in_Boss5_tokenrule",boss);
	BeginPlot(ctrl,"lua_28in_Boss5_main",0);
	Cl_Resist_HackersFightBegin()	--防駭客機制_戰鬥開始_BICO
end
function lua_28in_Boss5_main()
--中控主迴圈
	local ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	--開門
	local x,y,z,dir=DW_Location(781359,1)
	local gate=CreateObj(106249,x,y,z,dir,1);
	SetModeEx(gate,EM_SetModeType_ShowRoleHead,false);
	SetModeEx( gate , EM_SetModeType_Mark , false );	--不可點選
	SetModeEx( gate , EM_SetModeType_HideName , true );	--不顯示名稱
	SetModeEx( gate , EM_SetModeType_NotShowHPMP , true );	--不顯示血條
	SetModeEx( gate , EM_SetModeType_Strikback , false );	--不會反擊
	SetModeEx( gate , EM_SetModeType_Move , false );	--不會移動
	SetModeEx( gate , EM_SetModeType_Fight , false );	--不可攻擊
	SetModeEx( gate , EM_SetModeType_Searchenemy , false );	--不會索敵
	SetModeEx( gate , EM_SetModeType_Obstruct , true );	--有阻擋效果
	AddToPartition(gate,room);
	CallPlot(gate,"lua_28in_Boss5_tokenrule",ctrl);
	--資料設定
	local cycle_num=2;
	local bell={num=5;countdown=15;recover=20;};
	local randAtk={countdown=7;};
	local terminate={countdown=39;duration=10;}
	local TrippleBuff={624832;624833;624834;};
	local fury={trigger=360};
	if(zone==160)then fury.trigger=480; end
	--全域變數
	Global_28in_Boss5=Global_28in_Boss5 or {};
	Global_28in_Boss5[room]={bell={};triple_trigger=false;soul_back=false;boss=boss;};
	--產生5個鐘
	local _dummyBellGUID = 107071;--通用透明球 --140211 K.J. Aris
	local _dummyID = 0;
	Global_28in_Boss5[room]._dummyBell = {};--140211 K.J. Aris
	for i=1,bell.num,1 do
		local x,y,z,dir=DW_Location(781358,i);
		local b=CreateObj(103382,x,y,z,dir,1);
		SetModeEx(b,EM_SetModeType_Strikback,false);
		SetModeEx(b,EM_SetModeType_Searchenemy,false);
		AddToPartition(b,room);
		CallPlot(b,"lua_28in_Boss5_tokenrule",ctrl);
		LockHP(b,ReadRoleValue(b,EM_RoleValue_MaxHP),"lua_28in_Boss5_BellTrigger");
		Global_28in_Boss5[room].bell[i]={guid=b};

		--140211 K.J. Aris  added
		_dummyID = CreateObj(_dummyBellGUID,x,y,z,dir,1);
		CallPlot(_dummyID,"lua_28in_Boss5_tokenrule",b);
		SetModeEx(_dummyID,EM_SetModeType_Strikback,false);
		SetModeEx(_dummyID,EM_SetModeType_Searchenemy,false);
		SetModeEx(_dummyID,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(_dummyID,EM_SetModeType_Show,true);
		SetModeEx(_dummyID,EM_SetModeType_Mark,false);
		AddToPartition(_dummyID,room);
		Global_28in_Boss5[room]._dummyBell[i]={guid=_dummyID};
		DebugMsg( 0 , 0 , "---DummyBell : ".._dummyID );
		--140211 K.J. Aris
	end
	--狀態
	local condition_reset=false;
	local condition_terminate=false;
	local condition_triple=0;
	local condition_aeAtk=false;
	--循環
	local cycle={};
	for i=1,cycle_num,1 do
		cycle[i]={phase="none";time=18;}
	end
	--時間變數
	local time=0
	local GCD=0;
	local countdown={	randAtk=7;
				aeAtk=0;
				bell=0;
				terminate=39;
				stopdamage=40;
				};
	--GUID資料
	local HateList={};
	local PlayerList={};
	local bosstarget=0;
	local Soul={};
	local resonance=DW_Rand(bell.num);
	local image=0;
	--副函式
	local function rand_pick_player(num,scribe)
		local rtable={};
		local result={};
		for i=1,#PlayerList,1 do
			if(scribe=="noTANK")and(#PlayerList>num)then
				if(PlayerList[i].guid~=bosstarget)then
					table.insert(rtable,PlayerList[i].guid);
				end
			else
				table.insert(rtable,PlayerList[i].guid);
			end
		end
		for i=1,num,1 do
			if(#rtable==0)then
				break;
			end
			local r=DW_Rand(#rtable);
			table.insert(result,table.remove(rtable,r));
		end
		return result;
	end
	lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_START]",0);--[107968]鐮爪一揮，附近出現了數個特異的音器！不知這些異族的器具有什麼用途......
	while true do
		sleep(10);
	--reset
		HateList={};
		PlayerList={};
	--keep
		--時間處理
		time=time+1;
		for i=1,cycle_num,1 do
			cycle[i].time=cycle[i].time+1;
		end
		if(GCD>0)then GCD=GCD-1;end
		for cd_type,sec in pairs(countdown)do
			if(sec>0)then
				countdown[cd_type]=sec-1;
			end
		end
		--名單整理(每秒更新)
		for pos=0,HateListCount(boss)-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				PlayerList[#PlayerList+1]={guid=id;};
			end
		end
		if(#PlayerList==0)then
			--滅團
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FAIL]",0);--[107968]對於成功守衛巢穴並沒有特別的反應，彷彿從未有人來打擾過......
			condition_reset=true;
			break;
		end
		bosstarget=ReadRoleValue(boss,EM_RoleValue_AttackTargetID);
	--cast
		--即刻作用效果
		if(time==fury.trigger)and(zone~=162)then
			--狂暴時間到達
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FURY]",0);--[107968]感受到巢穴的低鳴，開始陷入某種瘋狂狀態！
			AddBuff(boss,624344,0,-1);
		end
		if(countdown.terminate==0)then
			--開啟大絕效果
			countdown.terminate=terminate.countdown;
			countdown.stopdamage=terminate.duration;
			condition_terminate=true;
			AddBuff(boss,624975,0,-1);
			lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FATALSTART]",0);--[107968]身上的音洞劇烈振動著，致命的音波不斷向你襲來！
		end
		if(countdown.stopdamage==0)then
			--停止大絕效果
			countdown.stopdamage=100;
			condition_terminate=false;
			CancelBuff_NoEvent(boss,624975);
		end
		if(countdown.bell==0)then
			--改變共嗚的鐘
			countdown.bell=bell.countdown;
			local rtable={1,2,3,4,5};
			table.remove(rtable,resonance);
			CancelBuff_NoEvent(Global_28in_Boss5[room].bell[resonance].guid,624644);
			CancelBuff_NoEvent(Global_28in_Boss5[room]._dummyBell[resonance].guid,624644);--140211 K.J. Aris
			resonance=rtable[DW_Rand(4)];
			AddBuff(Global_28in_Boss5[room].bell[resonance].guid,624644,0,-1);
			AddBuff(Global_28in_Boss5[room]._dummyBell[resonance].guid,624644,0,-1);--140211 K.J. Aris
			DebugMsg( 0 , 0 , " Effect Target : "..Global_28in_Boss5[room]._dummyBell[resonance].guid );
		end
		if(condition_aeAtk==true)and(countdown.aeAtk==0)then
			--AE
			SysCastSpellLv(boss,image,851269,0);
			WriteRoleValue(image,EM_RoleValue_LiveTime,2);
			condition_aeAtk=false;
		end
		--循環1
		for onetrip=1,1,1 do
			if(cycle[1].time==0)then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_BELLPROMPT]",0);--[107968]喚出的音器響起令你暈眩的節奏......
				break;
			end
			if(cycle[1].time==3)then
				--選兩名玩家種出他們的靈魂，不包括坦克，除非只剩一人
				local rtable = nil;
				if ( #PlayerList >= 3 ) then--大於等於3人則排坦
					rtable = rand_pick_player(2,"noTANK");
				else--2人以下不排坦
					rtable = rand_pick_player(2,"casual");
				end

				for i=1,#rtable,1 do
					local x,y,z,dir=DW_Location(rtable[i]);
					local s=CreateObj(103381,x,y,z,dir,1);
					DW_UnFight(s,true);
					SetModeEx(s,EM_SetModeType_Mark,false);
					SetModeEx(s,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(s,EM_SetModeType_HideName,true);
					MoveToFlagEnabled(s,false);
					AddBuff(s,624976,0,-1);
					if(CheckBuff(rtable[i],624972)==true)then AddBuff(s,624973,0,-1);end;
					AddToPartition(s,room);
					CallPlot(s,"lua_28in_Boss5_tokenrule",ctrl);
					SetFollow(s,boss);
					Soul[i]={guid=s;owner=rtable[i]};
					AddBuff(rtable[i],624977,0,-1);
					ScriptMessage(rtable[i],rtable[i],2,"[SC_28IN_BOSS5_SOULOUT]",0);--你覺得頭痛欲裂，一部份的「你」被[107968]吸引過去！
					DebugMsg( 0 , 0 , "Soul : "..#Soul );
				end
				Global_28in_Boss5[room].soul_back=false;
				break;
			end
			if(cycle[1].time<8)and(cycle[1].time>3)then
				for i=#Soul,1,-1 do
					if(Global_28in_Boss5[room].soul_back==true)then
						--鐘被敲響
						StopMove(Soul[i].guid,true);
						CastSpell(Soul[i].guid,Soul[i].owner,851279);
						table.remove(Soul,i);
					elseif(GetDistance(Soul[i].guid,boss)<30)then
						--若靈魂碰到Boss
						DW_AddHPpercent(boss,bell.recover);--回血
						DelObj(Soul[i].guid);
						CancelBuff_NoEvent(Soul[i].owner,624977);
						--KillID( boss , Soul[i].owner );--140210 K.J.Aris --殺死目標
						table.remove(Soul,i);
						lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS5_SOULABSORB]",C_Red);--[107968]吸收了靈魂的能量！
						
					end
				end
				break;
			end
			if(cycle[1].time==8)and(#Soul>0)then
				--時間到，引爆靈魂
				DebugMsg( 0 , 0 , "----時間到，引爆靈魂 : "..#Soul );
				for i=#Soul,1,-1 do
					SysCastSpellLv(Soul[i].guid,Soul[i].owner,851273,1);
					CastSpell(Soul[i].guid,Soul[i].guid,851274);
					StopMove(Soul[i].guid,true);
					--WriteRoleValue(Soul[i].guid,EM_RoleValue_LiveTime,2);
					SetStopAttack(Soul[i].guid);
					WriteRoleValue(Soul[i].guid,EM_RoleValue_LiveTime , 10 );
					--DelObj(Soul[i].guid);--140210 K.J. Aris
					KillID( boss , Soul[i].guid );
				end
				lua_28in_Boss5_broadcast(0,"[SC_28IN_BOSS5_SOULBOMB]",C_Red);--離體的靈魂因為不穩定而發生能量爆炸！
				Soul={};
				break;
			elseif(cycle[1].time==8)and(Soul~=nil)and(#Soul<=0)then
				Soul={};
				DebugMsg( 0 , 0 , "--沒有東西可以抱--140214--" );
				break;
			end
			if(cycle[1].time==11)then
				lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_FREEZEPROMPT]",0);--[107968]喚出的音器響起一種詭異的節奏......
				break;
			end
			if(cycle[1].time==14)then
				--所有人上Buff
				condition_triple=DW_Rand(#TrippleBuff);
				Global_28in_Boss5[room].ban_buff=TrippleBuff[condition_triple]
				for i=1,#PlayerList,1 do
					AddBuff(PlayerList[i].guid,TrippleBuff[condition_triple],0,-1);
				end
				Global_28in_Boss5[room].triple_trigger=false;
				break;
			end
			if(cycle[1].time>=14)and(cycle[1].time<=17)then
				--有人觸犯就發動
				if(Global_28in_Boss5[room].triple_trigger==true)then
					lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_PUNISH]",0);--[107968]收到音波的感應，發出強大音波！
					Global_28in_Boss5[room].triple_trigger=false;
					if(condition_triple==0)then
						DebugMsg(0,room,"condition_triple==0 !!")
					elseif(condition_triple==1)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851275,0);
						end
					elseif(condition_triple==2)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851276,0);
						end
					elseif(condition_triple==3)then
						for i=1,#PlayerList,1 do
							SysCastSpellLv(boss,PlayerList[i].guid,851277,0);
						end
					end
				end
				break;
			end
			if(cycle[1].time>17)and(cycle[1].time<=19)then
				for i=1,#PlayerList,1 do
					for j=1,#TrippleBuff,1 do
						CancelBuff_NoEvent(PlayerList[i].guid,TrippleBuff[j]);
					end
				end
				break;
			end
			if(cycle[1].time>=19)then
				cycle[1].time=0;
				break;
			end
		end
		--循環2
		for onetrip=1,1,1 do
			if(GCD~=0)then
				break;
			end
			--隨機三招
			if(countdown.randAtk==0)then
				if(cycle[1].time>11)and(cycle[1].time<=17)then
					--二選一
					local r=DW_Rand(100);
					if(r>50)then
						--自己變強
						CastSpell(boss,boss,851270);
						countdown.randAtk=randAtk.countdown;
					else
						--大傷害
						if(GetDistance(boss,bosstarget)<70)then
							CastSpellLv(boss,bosstarget,851271,0);
							countdown.randAtk=randAtk.countdown;
						end
					end
				else
					--隨機轟炸
					countdown.aeAtk=3;
					local r=rand_pick_player(1);
					if(#r==0)then DebugMsg(0,room,"player list is zero");break;end
					local x,y,z,dir=DW_Location(r[1]);
					image=CreateObj(103383,x,y,z,dir,1);
					SetModeEx(image,EM_SetModeType_Mark,false);
					SetModeEx(image,EM_SetModeType_Move,false);
					SetModeEx(image,EM_SetModeType_ShowRoleHead,false);
					SetModeEx(image,EM_SetModeType_HideName,true);
					WriteRoleValue(image,EM_RoleValue_LiveTime,4);
					AddBuff(image,624343,0,-1);
					AddToPartition(image,room);
					countdown.randAtk=randAtk.countdown;
					condition_aeAtk=true;
				end
				break;
			end
		end
		if(condition_terminate==true)then
			--大絕效果:直接傷害，放在最後，才不會殺死玩家後影響其他判斷
			for i=#PlayerList,1,-1 do
				SysCastSpellLv(boss,PlayerList[i].guid,851272,0);
			end
		end
	end
	if(condition_reset==true)then
		for i=1,#Soul,1 do
			DelObj(Soul[i].guid);
		end
		for i=1,bell.num,1 do
			DelObj(Global_28in_Boss5[room].bell[i].guid);
			DelObj(Global_28in_Boss5[room]._dummyBell[i].guid);
		end
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50)
		DW_UnFight(boss,false);

	else
		lua_28in_Boss5_broadcast(2,"[SC_28IN_BOSS5_END]",0);--[107968]終於被擊倒在地，四周頓時變得十分寧靜。
	end
	
	Global_28in_Boss5[room]=nil;
	DelObj(ctrl);
end
function lua_28in_Boss5_BellTrigger()
--bell鎖血觸發劇情
	local bell=OwnerID();
	local Is_Resonance=CheckBuff(bell,624644);
	local room=ReadRoleValue(bell,EM_RoleValue_RoomID);
	if(Is_Resonance==false)then
		--非催動中的鐘會起共鳴
		local boss=Global_28in_Boss5[room].boss;
		SysCastSpellLv(boss,boss,851280,0);
		AddBuff(boss,624645,0,10);
		ScriptMessage(bell,TargetID(),0,"[SC_28IN_BOSS5_BELLRING]",C_Red);--幽羅音器吸收你的攻擊，傳出能量音波！
	else
		Global_28in_Boss5[room].soul_back=true;
	end
end
function lua_28in_Boss5_bufftrigger()
--buff消失觸發劇情
	local player=OwnerID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	if(Global_28in_Boss5[room]==nil)or(ReadRoleValue(player,EM_RoleValue_IsAttackMode)==0)then return;end
	Global_28in_Boss5[room].triple_trigger=true;
	AddBuff(player,Global_28in_Boss5[room].ban_buff,0,3);
end
function lua_28in_Boss5_getback()
--靈魂歸位表演
	local Soul,player=OwnerID(),TargetID();
	CancelBuff_NoEvent(player,624977);
	ScriptMessage(Soul,player,0,"[SC_28IN_BOSS5_SOULBACK]",C_YELLOW);--你再次感到自己是「完整」的！
	DelObj(Soul);
end