function lua_27in_BOSS7_InCombat()--7王進入戰鬥
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	
	local x,y,z,dir=DW_Location(boss);
	local Ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(Ctrl,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(Ctrl,EM_SetModeType_Show,false);
	SetModeEx(Ctrl,EM_SetModeType_Mark,false);
	DW_UnFight(Ctrl,true);
	AddToPartition(Ctrl,room);
	BeginPlot(Ctrl,"lua_27in_BOSS7_Ctrl",0);
end
function lua_27in_BOSS7_Ctrl()--7王中控器
	local Ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	--阻擋門
	local Gate={};
	for pos=1, 1, 1 do
		local x,y,z,dir=DW_Location(781331,pos);
		local d=CreateObj(106249, x,y,z,dir,1);
		SetModeEx(d,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(d,EM_SetModeType_Mark,false);
		SetModeEx(d,EM_SetModeType_Obstruct,true);
		SetModeEx(d,EM_SetModeType_Show,true);
		SetModeEx(d,EM_SetModeType_Strikback,false);
		SetModeEx(d,EM_SetModeType_Move,false);
		SetModeEx(d,EM_SetModeType_Searchenemy,false);
		SetModeEx(d,EM_SetModeType_Fight,false);
		AddToPartition(d,room);
		CallPlot(d,"lua_27in_BOSS7_tokenRULE",boss);
		Gate[pos]=d;
	end
	
	--寶箱怪資料
	local box={};
	local usualbox={};
	local dyingbox={};
	--物件資料(光球)
	local ball={};
	
	--時間資料
	-----------------
	--累計值
	local time=0;
	--遞減值
	local countDOWN	={
				ranATK=9;	--隨機施放：靈魂爆彈or生靈怒吼
				weaked=21;	--怨靈咒術
				soulBOMB=0;	--靈魂爆彈爆炸
				fury=361;	--狂暴機制
							};
	if(zone==157)then countDOWN.fury=481;end
	--遞減值
	local GCD=0;
	local StringCD=2;--字串間隔

	--玩家資料
	local PlayerList={};
	local HateList={};
	local totalplayer=0;

	--字串資料
	local string_call=2;
	local fury_course=false;if(zone==159)then fury_course=true;end

	--副函式
	local function broad_cast(msg_type,msg,msg_color)--在玩家列表裡的人都會收到訊息
		if(msg_type==nil)or(msg==nil)then
			DebugMsg(0,room,"msg setting error");
			return false;
		end
		if(msg_type==2)then
			msg="[$MUTE]"..msg;
		end
		if(msg_color==nil)then
			msg_color=0;
		end
		for player,_table in pairs(PlayerList)do
			ScriptMessage(player,player,msg_type,msg,msg_color);
		end
	end
	local function room_broadcast(msg_type,msg,msg_color)--在同一層的人都會收到訊息
		if(msg_type==nil)or(msg==nil)then
			DebugMsg(0,room,"msg setting error");
			return false;
		end
		if(msg_type==2)then
			msg="[$MUTE]"..msg;
		end
		if(msg_color==nil)then
			msg_color=0;
		end
		local n=SetSearchAllNPC(room);
		for i=1,n,1 do
			local player=GetSearchResult();
			ScriptMessage(player,player,msg_type,msg,msg_color);
		end
	end
	local function boss_become_stronger(box_table,i)--強化boss
		CancelBuff_NoEvent(box_table[i].guid,624622);--取消原靈魂特效
		--boss stronger
		DW_AddHPpercent(boss,5);
		local BUFFid={624636,624637,624638};
		AddBuff(boss,BUFFid[box_table[i].BUFFtype],box_table[i].BUFFlv,-1);
		--effect	
		local x,y,z,dir=DW_Location(box_table[i].guid);
		local __=CreateObj(107873,x,y,z,dir,1);
		DW_UnFight(__,true);
		SetModeEx(__,EM_SetModeType_Mark,false);
		SetModeEx(__,EM_SetModeType_ShowRoleHead,false);
		SetModeEx(__,EM_SetModeType_HideName, true)
		WriteRoleValue(__,EM_RoleValue_LiveTime,2);
		AddToPartition(__,room);
		SysCastSpellLv(__,boss,851056,0);--靈魂發射特效
		--字串顯示
		if(StringCD==0)then
			StringCD=3;
			local r=DW_Rand(100);
			if(r>50)then
				broad_cast(2,"[SC_27IN_BOSS7_BAD1]",C_LightBlue);--基德的聲音：這樣是沒用的，你得讓那些靈魂自行潰散。
			else
				broad_cast(2,"[SC_27IN_BOSS7_BAD2]",C_LightBlue);--基德的聲音：若讓皮理寇薩特得到這些靈魂，它只會越來越強大
			end
		end
		
	end
	local function rand_pick(num)--隨機挑選num名玩家
		local playertable={};--index依序value玩家GUID
		local n=num;if(n<totalplayer)then n=totalplayer;end
		for id,__ in pairs(PlayerList)do
			table.insert(playertable,id);
		end
		if(n>num)then
			for round=1,n-3,1 do
				local r=DW_Rand(#playertable);
				table.remove(playertable,r);
			end
		end
		return playertable;
	end
	
	room_broadcast(2,"[SC_27IN_BOSS7_START1]",0);--當你接近這隻人造蜘蛛時，一個男性的聲音從它身上傳來......
	
	sleep( 30 );
	--戰鬥迴圈
	while true do
	--RESET
		HateList={};
		PlayerList={};

		_HateListGuidInOrder = {};
		
	--KEEP
		sleep(10);
		
		--時間資料
		time=time+1;
		
		if(GCD>0)then GCD=GCD-1;end
		if(StringCD>0)then StringCD=StringCD-1;end
		for __,cd in pairs(countDOWN)do
			if(cd>0)then
				countDOWN[__]=cd-1;
			end
		end
		
		--維持玩家資料
		local n=HateListCount(boss);
		totalplayer=0;
		for pos=0,n-1,1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
			--HateList(所有仇恨目標)
			HateList[id]={
					pos=pos;
					point=point;
							};
			
			table.insert( _HateListGuidInOrder , id );
			--PlayerList(僅限玩家)
			if ReadRoleValue(id,EM_RoleValue_IsPlayer)==1 then
				PlayerList[id]={
						pos=pos;
						point=point;
								};
				totalplayer=totalplayer+1;
			end
		end
		if(totalplayer<=0)then break;end
				
		--字串顯示
		if(StringCD==0)then
			if(string_call==2)then
				broad_cast(0,"[SC_27IN_BOSS7_START2]",C_LightBlue);--男性的聲音：咦？皮理寇薩特怎麼成了這個模樣？看來，已經過了很久的時間啊......
				StringCD=3;string_call=3;
			elseif(string_call==3)then
				broad_cast(0,"[SC_27IN_BOSS7_START3]",C_LightBlue);--男性的聲音：挑戰者們，很高興見到你們。我是試煉的設計者，煉獄號艦長基德。
				StringCD=3;string_call=4;
			elseif(string_call==4)then
				broad_cast(0,"[SC_27IN_BOSS7_START4]",C_LightBlue);--基德的聲音：別擔心，我早已死去，這聲音源自於存有我原本意識的符文
				StringCD=3;string_call=5;
			elseif(string_call==5)then
				broad_cast(0,"[SC_27IN_BOSS7_START5]",C_LightBlue);--基德的聲音：這項試煉最初並非如此，是這些失敗者的靈魂造成了改變？
				StringCD=4;string_call=6;
			elseif(string_call==6)then
				broad_cast(0,"[SC_27IN_BOSS7_START6]",C_LightBlue);--哈！那就將錯就錯也無妨，看看你是否有資格面對接下來的試煉？
				StringCD=4;string_call=7;
			elseif(string_call==7)then
				broad_cast(0,"[SC_27IN_BOSS7_START7]",C_LightBlue);--這只是第一部份。想要我的財寶嗎？那麼你得完成所有的試煉才行。
				StringCD=3;string_call=8;
			end
		end
		
		--召喚小怪(per 20 sec)
		if(time%20==0)and((#usualbox+#dyingbox)<1)then
			local pos=2;
			for i=1,2,1 do
				local x,y,z,dir=DW_Location(781331,pos+i);--從旗子進行召喚(從門外跑進來)
				local b=CreateObj(107872,x,y,z,dir,1);
				AddToPartition(b,room);
				CallPlot(b,"lua_27in_BOSS7_tokenRULE",Ctrl);
				--Data record
				local boxDATA={
						guid=b;
						BUFFtype=DW_Rand(3);
						BUFFlv=0;
						};
				box[b]=boxDATA;table.insert(usualbox,boxDATA);
				--set
				AddBuff(b,624622,0,-1);--普攻附傷害
				--boss, shield open
				if(CheckBuff(boss,624627)==false)then AddBuff(boss,624627,0,-1);end--反射盾
				for player,__ in pairs(PlayerList) do
					SysCastSpellLv(player,b,499110,0);
				end
			end
			--字串
			if(StringCD==0)then
				if(string_call==8)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL1]",C_LightBlue);--基德的聲音：這些小型機關沒這麼單純，靈魂的彼此呼應還能提供皮理寇薩特保護
					StringCD=3;string_call=9;
				elseif(string_call==9)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL2]",C_LightBlue);--基德的聲音：看來這些靈魂不只附在皮理寇薩特身上，我設計的機關似乎全都遭殃
					StringCD=3;string_call=10;
				elseif(string_call==10)then
					broad_cast(2,"[SC_27IN_BOSS7_CALL3]",C_LightBlue);--基德的聲音：又有被附身的機關來到附近，你自己留神吧！
					StringCD=3;string_call=11;
				else
					broad_cast(2,"[SC_27IN_BOSS7_CALL4]",C_LightBlue);--被怨靈附著的機關向你撲來
					StringCD=3;string_call=11;
				end
			end
		end
		--scan usualbox
		for i=#usualbox,1,-1 do
			local b=usualbox[i].guid;
			if(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				DW_AddHPpercent(boss,6); -- 寶箱死掉後 BOSS HP +6%
				boss_become_stronger(usualbox,i);
				table.remove(usualbox,i);
			elseif(DW_GetHPpercent(b)<10)then--箱子HP低於10%進行自爆任務
				if(StringCD==0)then
					broad_cast(2,"[SC_27IN_BOSS7_COUNTDOWN]",C_LightBlue);--基德的聲音：注意！有靈魂的狀態變得不穩定，別靠近它！
					StringCD=3;
				end
				AddBuff(b,624626,0,-1);--顯示即將爆炸的BUFF

				if not usualbox[i].has_attack_target then

					--lock random hate target;
					local _randTarget = DW_Rand( #_HateListGuidInOrder );
					_randTarget = _HateListGuidInOrder[ _randTarget ];
					SetFollow( b , _randTarget );
					usualbox[i].has_attack_target = true

				end

				local boxDATA={
						guid=b;
						time=11;--只有在dyingbox有用的屬性
						BUFFtype=usualbox[i].BUFFtype;
						BUFFlv=usualbox[i].BUFFlv;
						_lockOnTarget = _randTarget;
						has_attack_target = usualbox[i].has_attack_target
						}
				table.insert(dyingbox,boxDATA);table.remove(usualbox,i);
			end
		end
		--scan dyingbox
		for i=#dyingbox,1,-1 do
			local b=dyingbox[i].guid;
			if(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				DW_AddHPpercent(boss,6); -- 寶箱死掉後 BOSS HP +6%
				boss_become_stronger(dyingbox,i);
				table.remove(dyingbox,i);
			else
				--check buff remain time
				local t=dyingbox[i].time;
				if(t<=1)then
					DW_UnFight(b,true);
					SetModeEx(b,EM_SetModeType_Move,false);
					WriteRoleValue(b,EM_RoleValue_LiveTime,2);
					SysCastSpellLv(b,b,851055,0);--爆炸
					DW_AddHPpercent(boss,-3); -- 寶箱爆炸後BOSS HP -3%
					table.remove(dyingbox,i);
					SetStopAttack(b);
					PlayMotionEX(b,ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD);
					--字串
					if(StringCD==0)then
						StringCD=3;
						broad_cast(2,"[SC_27IN_BOSS7_GOOD]",C_LightBlue);--基德的聲音：很好！又有靈魂潰散了！
					end
				else
					if ( dyingbox[i]._lockOnTarget == nil ) then 
						local _randTarget = DW_Rand( #_HateListGuidInOrder );
						_randTarget = _HateListGuidInOrder[ _randTarget ];
						dyingbox[i]._lockOnTarget = _randTarget;
					end

					if not CheckID( dyingbox[i]._lockOnTarget ) then	--redirect to another target if the primary target is gone	131002 K.J. Aris
						local _randTarget = DW_Rand( #_HateListGuidInOrder );
						_randTarget = _HateListGuidInOrder[ _randTarget ];
						dyingbox[i]._lockOnTarget = _randTarget;
					end
					SetFollow( b , dyingbox[i]._lockOnTarget );
					dyingbox[i].time=t-1;
				end
			end
		end
		--scan box
		local timeTOaddbuff=false;
		if(time%3==0)then timeTOaddbuff=true; end
		for b,__ in pairs(box)do
			if(not CheckID(b))or(ReadRoleValue(b,EM_RoleValue_IsDead)==1)then
				box[b]=nil;
			else
				if(timeTOaddbuff)then--3秒1輪
					local BUFFid={624623,624624,624625};
					AddBuff(b,BUFFid[box[b].BUFFtype],0,-1);
					box[b].BUFFlv=box[b].BUFFlv+1;
				end
			end
		end
		if((#usualbox+#dyingbox)==0)then
			CancelBuff_NoEvent(boss,624627);--反射盾
		end
	--CAST
		--狂暴機制
		if(countDOWN.fury==0)and(fury_course==false)then
			AddBuff(boss,624632,0,-1);
			room_broadcast(2,"[SC_27IN_BOSS7_FURY]",C_LightBlue);--基德的聲音：你似乎把這些靈魂給徹底惹惱了......
		end
		--隨機判斷攻擊招式
		for i=1,1,1 do
			if(GCD~=0)then break;end
			if(countDOWN.ranATK~=0)then break;end
			local r=DW_Rand(100);
			if(r>50)then
				--生靈怒吼
				local e=DW_Rand(totalplayer);
				local s=0;
				for player,__ in pairs(PlayerList)do
					s=s+1;
					if(s==e)then
						CastSpellLv(boss,player,851059,0);--生靈怒吼
						GCD=1;countDOWN.ranATK=9;
						break;
					end
				end
			else
				--靈魂爆彈
				local TEMPplayer={};
				TEMPplayer=rand_pick(3);
				--剩下的TEMPplayer不論數量都是被選中的玩家
				for __,id in pairs(TEMPplayer)do
					local x,y,z,dir=DW_Location(id);
					local b=CreateObj(107876,x,y,z,dir,1);
					DW_UnFight(b,true);
					SetModeEx(b,EM_SetModeType_Mark,false);
					SetModeEx(b,EM_SetModeType_ShowRoleHead,false);
					WriteRoleValue(b,EM_RoleValue_LiveTime,5);
					AddToPartition(b,room);
					CallPlot(b,"lua_27in_BOSS7_tokenRULE",boss);
					table.insert(ball,b);
				end
				countDOWN.soulBOMB=3;
				GCD=1;countDOWN.ranATK=9;
			end
		end
		if(#ball~=0)and(countDOWN.soulBOMB==0)then
			--靈魂爆彈引爆
			for i,bomb in pairs(ball)do
				SysCastSpellLv(bomb,bomb,851057,1);
				WriteRoleValue(bomb,EM_RoleValue_LiveTime,2);
			end
			ball={};
		end
		--怨靈咒術
		for __=1,1,1 do
			if(GCD~=0)then break;end
			if(countDOWN.weaked~=0)then break;end
			GCD=1;countDOWN.weaked=21;
			local TEMPplayer={};
			TEMPplayer=rand_pick(4);
			for __,id in pairs(TEMPplayer)do
				SysCastSpellLv(boss,id,851058,1);
			end
		end
	end
	
	--解除阻擋門
	for pos=1,1,1 do
		DelObj(Gate[pos]);
	end

	--清除624642生靈怒吼BUFF
	local _RangePlayerTable = SearchRangePlayer( Ctrl , 2000 );
	for _key , _value in pairs( _RangePlayerTable ) do
		CancelBuff_NoEvent( _value , 624642 );--確保清除
	end

	--確認死亡或是離開戰鬥
	DW_UnFight(boss,true);
	SetStopAttack(boss);
	sleep(50);	
	if CheckID(boss)==false or ReadRoleValue(boss,EM_RoleValue_IsDead)==1 then
		--成功擊敗boss訊息
		room_broadcast(2,"[SC_27IN_BOSS7_END]",C_LightBlue);--基德的聲音：哈哈！很傑出的挑戰。但你能維持這股氣勢嗎？我的試煉可不只有這一關而已！
		DelObj(Ctrl);
		return;
	end
	
	DW_UnFight(boss,false);
	--滅團訊息
	room_broadcast(2,"[SC_27IN_BOSS7_FAIL]",C_LightBlue);--基德的聲音：又有人挑戰失敗。我設下的試煉真有這麼困難嗎？
	DelObj(Ctrl);
end
function lua_27in_BOSS7_tokenRULE(Ctrl)--衍生物規則，隨主動存活
	local token = OwnerID();
	if not Ctrl then
		return false;
	end
	while CheckID(Ctrl) and ReadRoleValue(Ctrl,EM_RoleValue_IsDead)==0 do	
		sleep(20);
	end
	DelObj(token);
end

--[[

進入戰鬥
產生中控
在中控上執行
離開戰鬥
清除物件


--initial
所有小怪資料
正常小怪資料
瀕死小怪資料
格式：index>>guid， table>>目標，仇恨列表類型

累計時間
招式cd>>表格
boss的gcd>>0


玩家資料
	--reset
	--keep
	維持玩家資料
	召喚小怪
		小怪數量加
		給予小怪普攻附帶效果的buff
		開反射盾
		三選一決定小怪效果
		記錄小怪資料
	掃瞄正常小怪
		小怪死亡
			^^^f1
			加boss的血
			轉移能力資料
			鬼魂特效
			f清空資料(小怪數量減
			^^^
		小怪血量太少
			給予倒數計時buff
			鎖定第一仇恨目標
			換到瀕死小怪

	掃瞄瀕死小怪
		檢查小怪存活
			檢查當前目標
			^^^f1
			加boss的血
			轉移能力資料
			鬼魂特效
			f2清空資料(小怪數量減
			^^^
		檢查倒數buff
			檢查buff剩下時間
				--自爆
				消除倒數buff
				sys爆炸
				扣Boss的血
				f2清空資料(小怪數量減
	掃瞄所有小怪
		增加小怪buff
	小怪數量>0
		關反射盾
	
	--cast
	ae傷害
	
	種出光球
	ae傷害
	
	加buff






--]]