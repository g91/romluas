--////////////////////////////////////////////////////////////
--此Boss有許多複雜交錯的判斷，因此大量應用全域變數，不幸接手維護者，務必先檢視所有的全域變數Global_27in_1stBoss
--技能多附有檢查的或觸發的script，檢視招式時務必要特別注意
--////////////////////////////////////////////////////////////
function lua_27in_boss1_tokenRULE(master)--master消失或死亡，自己也跟著消失
	local who=OwnerID();
	while true do
		sleep(20);
		if(CheckID(master)==false)or(ReadRoleValue(master,EM_RoleValue_IsDead)==1)then
			WriteRoleValue(who,EM_RoleValue_LiveTime,6);
			return;
		end
	end
end
function lua_27in_boss1_BeginAttack()--begin fight plot
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(boss);
	local ctrl=CreateObj(110987,x,y,z,dir,1);
	SetModeEx(ctrl,EM_SetModeType_Show,false);
	SetModeEx(ctrl,EM_SetModeType_Mark,false);
	SetModeEx(ctrl,EM_SetModeType_ShowRoleHead,false);
	AddToPartition(ctrl,room);
	CallPlot(ctrl,"lua_27in_boss1_tokenRULE",boss);
	BeginPlot(ctrl,"lua_27in_boss1_main",0);
end
function lua_27in_boss1_main()--main loop
	local ctrl=OwnerID();
	local boss=TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	--全域初始化
	Global_27in_1stBoss=Global_27in_1stBoss or {};
	Global_27in_1stBoss[room]={};
	--時間變數
	local GCD=0;
	local increase=0;
	local countDOWN={
				--summon_treasureBox = 35;--5 , 5 , 25
				summon_treasureBox = 0;--5 , 5 , 25
				summon_greed = 1000;
				summon_resentment=480;
				summon_hatred=12;
				choose_prisoner=20;
				ranATK=7;
				fury=481;
					};
	--技能設定清單
	local cage_num=1;
	if(zone==157)then cage_num=1;end
	
	--140110 K.J. Aris
	local _level = 1;
	if(zone==157)then _level=1; countDOWN.fury = 481; end
	if(zone==158)then _level=2; countDOWN.fury = 360; end
	if(zone==159)then _level=3; countDOWN.fury = 99999999; end

	local _cageGUIDs = { 108149 , 108345 , 108348 };--折磨牢籠
	local _greedyPhantomGUIDs = { 108151 , 108346 , 108349 };--貪婪幻影
	local _resentmentGUIDs = { 108152 , 108347 , 108350 };--怨念實體

	local _cageGUID = _cageGUIDs[ _level ];
	local _greedyPhantomGUID = _greedyPhantomGUIDs[ _level ];
	local _resentmentGUID = _resentmentGUIDs[ _level ];

	--物件清單(全域變數)
	Global_27in_1stBoss[room].boss={
					guid=boss;
					status="normal";
					buff=0;
					phase=1;
								};--initial global
	Global_27in_1stBoss[room].greed_ghost={};--initial global
	Global_27in_1stBoss[room].resentment={};--initial global
	Global_27in_1stBoss[room].PlayerInHateList={};--initial global
	--cage和prisoner是雙生table, index是互相關連
	Global_27in_1stBoss[room].cage={};--initial global
	Global_27in_1stBoss[room].prisoner={};--initial global
	

	--顯像旗子
	local emptyFLAG={};
	Global_27in_1stBoss[room].flag={}--initial global
	if(#emptyFLAG==0)then
		for flag_spot=1,GetMoveflagCount(781345)-1,1 do
			Global_27in_1stBoss[room].flag[flag_spot]={
									sn=flag_spot;
									status="empty";		};
			table.insert(emptyFLAG,flag_spot);
		end
	end
	
	--寶藏
	Global_27in_1stBoss[room].treasure={}--initial global
	for i=1,6,1 do
		Global_27in_1stBoss[room].treasure[i]={
							status="none";--none,box,buff,countdown,trap,del
							guid=0;--guid;
							changer=0;--record GUID of final mover
							note="none";
									};
		if(#emptyFLAG==0)then
			--重置旗子狀態
			for flag_spot=1,GetMoveflagCount(781345)-1,1 do
				Global_27in_1stBoss[room].flag[flag_spot]={
										sn=flag_spot;
										status="empty";		};
				table.insert(emptyFLAG,flag_spot);
			end
		end
		--寶藏初次建立
--		local r=DW_Rand(#emptyFLAG);
--		local sn=table.remove(emptyFLAG,r);
--		Global_27in_1stBoss[room].flag[sn].status="occupy";
--		local x,y,z,dir=DW_Location(781345,sn);
--		local b=CreateObj(108154,x,y,z,dir,1);
--		AddToPartition(b,room);
--		SetPlot(b,"touch","lua_27in_boss1_box_touchplot",40);
--		SetCursorType(b,eCursor_FurnitureRorare);
--		CallPlot(b,"lua_27in_boss1_tokenRULE",ctrl);
--		PlayMotionEX(b,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
--		SetDefIdleMotion(b,ruFUSION_MIME_ACTIVATE_LOOP);
--		
--		Global_27in_1stBoss[room].treasure[i].guid=b;
--		Global_27in_1stBoss[room].treasure[i].status="box";
--		Global_27in_1stBoss[room].treasure[i].changer=ctrl;
--		Global_27in_1stBoss[room].treasure[i].note="first create";
--		Global_27in_1stBoss[room].treasure[i].safe=true;
--		Global_27in_1stBoss[room].treasure[i].countdown=0;
--		DebugMsg(0,room,"No. "..i.." status -> box by create from ctrl");
--		WriteRoleValue(b,EM_RoleValue_PID,i);
--
--		countDOWN.summon_treasureBox = 35;--lock cycle
--		countDOWN.summon_greed = 5;--generate after 5 sec 
		--Global_27in_1stBoss[room].treasure[i].status = "countdown";

		--Global_27in_1stBoss[room].treasure[i].guid=b;
		Global_27in_1stBoss[room].treasure[i].status="countdown";
		Global_27in_1stBoss[room].treasure[i].changer=ctrl;
		Global_27in_1stBoss[room].treasure[i].note="first create";
		Global_27in_1stBoss[room].treasure[i].safe=true;
		Global_27in_1stBoss[room].treasure[i].countdown=0;
	end
	local effective_treasure_num=#Global_27in_1stBoss[room].treasure;
	--其他或特殊
	local cooperation_value=0;
	local function broadcast_room(msg_type,msg,msg_color)--告知所有在Player List中的玩家(囚犯不在內)
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
		for i=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
			ScriptMessage(ctrl,Global_27in_1stBoss[room].PlayerInHateList[i].guid,msg_type,msg,msg_color);
		end
	end
	--關門
	local x,y,z,dir=DW_Location(781346,4);
	local door=CreateObj(106249,x,y,z,dir,1);
	SetModeEx(door,EM_SetModeType_Obstruct,true);
	SetModeEx(door,EM_SetModeType_Show,true);
	SetModeEx(door,EM_SetModeType_Mark,false);
	SetModeEx(door,EM_SetModeType_ShowRoleHead,false);
	DW_UnFight(door,true);
	AddToPartition(door,room);
	CallPlot(door,"lua_27in_boss1_tokenRULE",ctrl);
	
	ScriptMessage(boss,0,2,"[$MUTE]".."[SC_27IN_BOSS1_START]",0);--這由無數海盜靈魂構成的不死怪物注意到你，「他們」的意念再次開始推動這悲慘的無限輪迴......
	
	local Sign_reset=false;
	while(true)do
		--等待判斷(先行運作)
		for i=1,cage_num,1 do
			if(Global_27in_1stBoss[room].prisoner[i]~=nil) then
				if (Global_27in_1stBoss[room].prisoner[i].release==true)then
					CancelBuff_NoEvent(Global_27in_1stBoss[room].prisoner[i].guid,624820);
					SysCastSpellLv(Global_27in_1stBoss[room].prisoner[i].guid,boss,499110,0);
				end
			end
		end
		sleep(10);
	--reset
		--玩家資料
		for i=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
			Global_27in_1stBoss[room].PlayerInHateList[i].legal=false;
		end
		--玩家有效數=仇恨中玩家人數-囚犯
		local effective_player=0;
		--寶藏有效數
		effective_treasure_num=0;
	--keep
		--時間變數
		increase=increase+1;
		if(GCD>0)then
			GCD=GCD-1;
		end
		for i,sec in pairs(countDOWN)do
			if(sec>0)then
				countDOWN[i]=sec-1;
			end
		end
		--Boss階段(血量於40% 切換)
		if(CheckID(boss)==false)or(ReadRoleValue(boss,EM_RoleValue_IsDead)==1)then
			--成功擊殺boss
			broadcast_room(2,"[SC_27IN_BOSS1_END]",C_LightBlue);--「我們」......終於獲得解脫，只是可惜了那些財寶啊！
			break;
		end
		if(Global_27in_1stBoss[room].boss.phase==1)and(DW_GetHPpercent(boss)<=40)then
			Global_27in_1stBoss[room].boss.phase=2;
			broadcast_room(0,"[SC_27IN_BOSS1_PHASE2]",C_RED);--你的攻擊把「他們」給惹火了......
		end
		if(countDOWN.fury==1)then
			AddBuff(boss,624632,0,-1);
		end
		--玩家資料
		local Hate1st_point=0;
		local Hate1st_pos=0;
		local Hate1st_ID=0;
		local Hate1st_sort=0;
		local n=HateListCount(boss);
		for pos=n-1,0,-1 do
			local id=HateListInfo(boss,pos,EM_HateListInfoType_GItemID);
			local hatepoint=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);

			if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
				effective_player=effective_player+1;
				local max=#Global_27in_1stBoss[room].PlayerInHateList;
				local _pass=false;
				for i=1,max,1 do
					if(Global_27in_1stBoss[room].PlayerInHateList[i].guid==id)then
						--通過認證
						Global_27in_1stBoss[room].PlayerInHateList[i].legal=true;
						Global_27in_1stBoss[room].PlayerInHateList[i].hate_point=hatepoint;
						_pass=i;
						break;
					end
				end
				if(_pass==false)then
					--仇恨目標不在table中，新增玩家資料
					_pass=max+1;
					Global_27in_1stBoss[room].PlayerInHateList[_pass]={guid=id;overload=0;legal=true;hate_point=hatepoint;buff=0};
					--DebugMsg(0,room,"player:"..id.." add to list.");
				end
				--囚牢仇恨傳遞
				local _isprisoner=false;
				for i=1,cage_num,1 do
					if(Global_27in_1stBoss[room].prisoner[i]~=nil)and(id==Global_27in_1stBoss[room].prisoner[i].guid)then
						if(Global_27in_1stBoss[room].prisoner[i].release==true)then
							--被釋放
							ScriptMessage(boss,id,0,"[SC_27IN_BOSS1_RELEASE]",C_YELLOW);--你成功從牢籠中逃了出來！
							CancelBuff_NoEvent(id,624820);
							SetHateListPoint(boss,pos,(Global_27in_1stBoss[room].prisoner[i].hate_point)+hatepoint)
							Global_27in_1stBoss[room].PlayerInHateList[_pass].hate_point=HateListInfo(boss,pos,EM_HateListInfoType_HatePoint);
							--囚犯資料清除
							Global_27in_1stBoss[room].prisoner[i]={};
							break;
						else
							--未釋放，不應在列表中
							_isprisoner=true;
							SetHateListPoint(boss,pos,0);
							effective_player=effective_player-1;--減去囚犯人數
							--DebugMsg(0,room,"player:"..Global_27in_1stBoss[room].PlayerInHateList[_pass].guid.." in prisoner.");
							table.remove(Global_27in_1stBoss[room].PlayerInHateList,_pass);
							break;
						end
						
					end
				end
				if(_isprisoner==false)then
					if(hatepoint>Hate1st_point)then
						Hate1st_point=hatepoint;
						Hate1st_pos=pos;
						Hate1st_ID=id;
						Hate1st_sort=_pass;
					end
				end
			end
		end
		if(true)then
			--剔除不合法的玩家資料
			for i=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
				if Global_27in_1stBoss[room].PlayerInHateList[i] ~= nil then
					if(Global_27in_1stBoss[room].PlayerInHateList[i].legal==false)or(CheckBuff(Global_27in_1stBoss[room].PlayerInHateList[i].guid,624820)==true)then
--						DebugMsg(0,room,"player:"..Global_27in_1stBoss[room].PlayerInHateList[i].guid.." is out.");
						table.remove(Global_27in_1stBoss[room].PlayerInHateList,i);
					end
				end
			end
		end
		--有效玩家數不足(滅團)
		if(effective_player==0)then
			DebugMsg(0,room,"effective player is not enough!");
			Sign_reset=true;
			break;
		end
		--喪心病狂
		if(Global_27in_1stBoss[room].boss.buff==3)and(increase%3)then
			if(CheckBuff(boss,624825)==true)then
				SysCastSpellLv(boss,boss,851177,0);
			else
				Global_27in_1stBoss[room].boss.buff=0;
			end
		end
		--折磨牢籠
		local _choose=false;
		if(countDOWN.choose_prisoner==0)then
			countDOWN.choose_prisoner=20;
			_choose=true;
			broadcast_room(2,"[SC_27IN_BOSS1_TORMENT]",C_LightBlue);--「我們」來折磨這些可憐的傢伙如何？
		end
		--複制排列順序
		local copy_player_sort={};
		for pos=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
			copy_player_sort[pos]=pos;
		end
		if(cage_num>#copy_player_sort)then
			--排坦機制
			table.remove(copy_player_sort,Hate1st_sort);
		end
		for i=1,cage_num,1 do
			for __=1,1,1 do
				--牢籠狀態
				local reborn=false;
				if(Global_27in_1stBoss[room].cage[i]==nil)then
					if(_choose==true)then reborn=true;else break;end
				elseif(CheckID(Global_27in_1stBoss[room].cage[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].cage[i].guid,EM_RoleValue_IsDead)==1)then
					--刪除牢籠
					--安全釋放(不能立即改變狀態)
					Global_27in_1stBoss[room].prisoner[i].release=true;
					DelObj(Global_27in_1stBoss[room].cage[i].guid);
					Global_27in_1stBoss[room].cage[i]=nil;
					
					if(_choose==true)then reborn=true;else break;end
				end
				if(reborn==true)then
					--產生牢籠
					local x,y,z,dir=DW_Location(781346,i);
					local _cage=CreateObj(_cageGUID,x,y+40,z,dir,1);
					SetModeEx(_cage,EM_SetModeType_Obstruct,true);
					SetModeEx(_cage,EM_SetModeType_Gravity,false);
					SetModeEx(_cage,EM_SetModeType_Strikback,false);
					SetModeEx(_cage,EM_SetModeType_Searchenemy,false);
					AddToPartition(_cage,room);
					CallPlot(_cage,"lua_27in_boss1_tokenRULE",boss);
					Global_27in_1stBoss[room].cage[i]={guid=_cage};
				end
				--囚犯狀態
				local who=Global_27in_1stBoss[room].cage[i].prisoner;
				if(who==nil)or(CheckID(who)==false)or(ReadRoleValue(who,EM_RoleValue_IsDead)==1)then
					--重選囚
						
					if ( #copy_player_sort >= i ) then--131122
						local r=DW_Rand(#copy_player_sort);r=table.remove(copy_player_sort,r);
						local _selectedPrisonerData = Global_27in_1stBoss[room].PlayerInHateList[r];

						local _prisoner=rawget( _selectedPrisonerData , "guid" );

						Global_27in_1stBoss[room].cage[i].prisoner=_prisoner;
						Global_27in_1stBoss[room].prisoner[i]={};
						Global_27in_1stBoss[room].prisoner[i].guid=_prisoner;
						Global_27in_1stBoss[room].prisoner[i].hate_point=rawget(Global_27in_1stBoss[room].PlayerInHateList[r],"hate_point");
						AddBuff(_prisoner,624820,0,-1);
						local x,y,z,dir=DW_Location(Global_27in_1stBoss[room].cage[i].guid);
						SetPos(_prisoner,x,y+4,z,dir);
						
						for time=1,Global_27in_1stBoss[room].PlayerInHateList[r].buff,1 do
							for _treasure=1,#Global_27in_1stBoss[room].treasure,1 do
								if(Global_27in_1stBoss[room].treasure[_treasure].guid==_prisoner)then
									Global_27in_1stBoss[room].treasure[_treasure].guid=0;
									Global_27in_1stBoss[room].treasure[_treasure].status="countdown";
									Global_27in_1stBoss[room].treasure[_treasure].changer=Global_27in_1stBoss[room].cage[i].guid;
									Global_27in_1stBoss[room].treasure[_treasure].note="become prisoner";
									Global_27in_1stBoss[room].treasure[_treasure].countdown=5;--5秒重生
									DebugMsg(_prisoner,room,"No. ".._treasure.." status -> countdown by become_prisoner from cage");
									break;
								end
							end
						end
						CancelBuff_NoEvent(_prisoner,624780);
						
						if(#copy_player_sort==0)then
							DebugMsg(0,room,"人數不足則視同滅團")
							Sign_reset=true;
							break;
						end
					end--131122
				end
				--傷害
				if( increase%3==0 and Global_27in_1stBoss[room].cage[i].prisoner ~= nil )then--131122
					SysCastSpellLv(Global_27in_1stBoss[room].cage[i].guid,Global_27in_1stBoss[room].cage[i].prisoner,851175,0);
				end
			end
			if(Sign_reset==true)then break;end
		end
		if(Sign_reset==true)then break;end
		--寶藏
		local useless=0;
		DebugMsg(0,room,"-----summon_treasureBox  P.A"..tostring( countDOWN.summon_treasureBox ) );
		if(countDOWN.summon_treasureBox == 0)then
			

			DebugMsg(0,room,"-----summon_treasureBox P.B");
			local _currentTargetPlayer = 0
			for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do--清除玩家"引念上身"BUFF計數(每次產生寶箱都重數)
				_currentTargetPlayer = Global_27in_1stBoss[room].PlayerInHateList[_player];
				local buff_lv = _currentTargetPlayer.buff;--.guid
				if ( buff_lv ~= 0 ) then
					CancelBuff_NoEvent( _currentTargetPlayer.guid , 624780 );--624780引念上身
				end
				--清除計次
				Global_27in_1stBoss[room].PlayerInHateList[_player].buff = 0;

			end
			DebugMsg( 0 , room , "-----Clear Player Buff Counter" );

			for i=1,#Global_27in_1stBoss[room].treasure,1 do
				DebugMsg(0,room,"treasureBox  "..i.."   "..Global_27in_1stBoss[room].treasure[i].status.." Timer : "..tostring( Global_27in_1stBoss[room].treasure[i].countdown ) );
				--if(Global_27in_1stBoss[room].treasure[i].status=="countdown")and(Global_27in_1stBoss[room].treasure[i].countdown==0)then
					DebugMsg(0,room,"Generating  treasureBox  "..i);
					if(#emptyFLAG==0)then
						--重置旗子狀態
						for flag_spot=1,GetMoveflagCount(781345)-1,1 do
							Global_27in_1stBoss[room].flag[flag_spot]={
													sn=flag_spot;
													status="empty";		};
							table.insert(emptyFLAG,flag_spot);
						end
					end
					--寶藏重生
					local r=DW_Rand(#emptyFLAG);
					local sn=table.remove(emptyFLAG,r);
					Global_27in_1stBoss[room].flag[sn].status="occupy";
					local x,y,z,dir=DW_Location(781345,sn);
					local b=CreateObj(108154,x,y,z,dir,1);
					AddToPartition(b,room);
					SetPlot(b,"touch","lua_27in_boss1_box_touchplot",40);
					SetCursorType(b,eCursor_FurnitureRorare);
					CallPlot(b,"lua_27in_boss1_tokenRULE",ctrl);
					PlayMotionEX(b,ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
					SetDefIdleMotion(b,ruFUSION_MIME_ACTIVATE_LOOP);
					
					Global_27in_1stBoss[room].treasure[i].guid=b;
					Global_27in_1stBoss[room].treasure[i].status="box";
					Global_27in_1stBoss[room].treasure[i].changer=ctrl;
					Global_27in_1stBoss[room].treasure[i].note="regrow";
					Global_27in_1stBoss[room].treasure[i].safe=true;
					Global_27in_1stBoss[room].treasure[i].countdown=0;
					DebugMsg(0,room,"No. "..i.." status -> box by reset from ctrl");
					WriteRoleValue(b,EM_RoleValue_PID,i);

					countDOWN.summon_treasureBox = 1000;--lock cycle
					countDOWN.summon_greed = 5;--generate after 5 sec 
				--elseif(Global_27in_1stBoss[room].treasure[i].status=="countdown")then
					--local _cd=Global_27in_1stBoss[room].treasure[i].countdown;
					--Global_27in_1stBoss[room].treasure[i].countdown=_cd-1;
				--end
				if(Global_27in_1stBoss[room].treasure[i].status=="buff")or(Global_27in_1stBoss[room].treasure[i].status=="box")then
					effective_treasure_num=effective_treasure_num+1;
				end
				if(Global_27in_1stBoss[room].treasure[i].status=="del")then
					useless=useless+1;
				end
			end
			
		end
		--寶藏重生機制
		if useless==6 then
			for i=1,6,1 do
				Global_27in_1stBoss[room].treasure[i].status="countdown";
				Global_27in_1stBoss[room].treasure[i].countdown=0;
			end
		end
		--貪婪幻影 (greed_ghost)
	--	local d=effective_treasure_num-#Global_27in_1stBoss[room].greed_ghost;
		local d = #Global_27in_1stBoss[room].treasure
		if(d>0)and(countDOWN.summon_greed==0)then
	--	if(countDOWN.summon_greed==0)then
			for i=1,d,1 do
				local x,y,z,dir=DW_Location(boss);
				local g=CreateObj(_greedyPhantomGUID,x,y,z,dir,1);
				SetModeEx( g , EM_SetModeType_Fight , false );
				WriteRoleValue( g , EM_RoleValue_LiveTime , 25 );
				AddToPartition(g,room);
				CallPlot(g,"lua_27in_boss1_tokenRULE",ctrl);
				Global_27in_1stBoss[room].greed_ghost[#Global_27in_1stBoss[room].greed_ghost+1]={guid=g};
			end
			countDOWN.summon_treasureBox = 25;--unlock another cycle
			countDOWN.summon_greed = 1000;
			
			broadcast_room(2,"[SC_27IN_BOSS1_GREED]",C_LightBlue);--我的財寶！我的！我的！......「我們」的財寶！
		end
		for i=#Global_27in_1stBoss[room].greed_ghost,1,-1 do
			for __=1,1,1 do--單趟判斷
			if(CheckID(Global_27in_1stBoss[room].greed_ghost[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].greed_ghost[i].guid,EM_RoleValue_IsDead)==1)then
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
				break;
			end
			if(Global_27in_1stBoss[room].greed_ghost[i].target~=nil)then
				local who=Global_27in_1stBoss[room].greed_ghost[i].target;
				if(CheckID(who)==true)and(ReadRoleValue(who,EM_RoleValue_IsDead)==0)and(CheckBuff(who,624820)==false)and(CheckBuff(who,624780)==true)then
					--目標仍在
					break;
				else
					local _n=Global_27in_1stBoss[room].greed_ghost[i].pegging;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=nil;
					Global_27in_1stBoss[room].treasure[_n].safe=true;
					Global_27in_1stBoss[room].greed_ghost[i].target=nil;

--					if ( CheckBuff(who,624780) == false ) then
--						DelObj(Global_27in_1stBoss[room].greed_ghost[i].guid); --131204 K.J. Aris
--					end

					
				end
			end
			--玩家優先(buff型態)
			for j=1,6,1 do
				if(Global_27in_1stBoss[room].treasure[j].status=="buff")and(Global_27in_1stBoss[room].treasure[j].safe==true)then
					SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].treasure[j].guid);
					rawset(Global_27in_1stBoss[room].greed_ghost[i],"target",Global_27in_1stBoss[room].treasure[j].guid);
					Global_27in_1stBoss[room].treasure[j].safe=false;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=j;
					break;
				end
			end
			if(Global_27in_1stBoss[room].greed_ghost[i].target~=nil)then break;end
			--攻擊寶箱
			for j=1,6,1 do
				if(Global_27in_1stBoss[room].treasure[j].status=="box")and(Global_27in_1stBoss[room].treasure[j].safe==true)then
					SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].treasure[j].guid);
					rawset(Global_27in_1stBoss[room].greed_ghost[i],"target",Global_27in_1stBoss[room].treasure[j].guid);
					Global_27in_1stBoss[room].treasure[j].safe=false;
					Global_27in_1stBoss[room].greed_ghost[i].pegging=j;
					break;
				end
			end
			
			if(Global_27in_1stBoss[room].greed_ghost[i].target==nil)then
				--沒有目標可攻擊
				DelObj(Global_27in_1stBoss[room].greed_ghost[i].guid);
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
			else
				--持續追擊
				SetAttack(Global_27in_1stBoss[room].greed_ghost[i].guid,Global_27in_1stBoss[room].greed_ghost[i].target);
			end
			end
		end
		--怨念實體(緩速小怪)
		if(#Global_27in_1stBoss[room].resentment<=6)and(countDOWN.summon_resentment==0)then
			broadcast_room(2,"[SC_27IN_BOSS1_RESENTMENT]",C_LightBlue);--抓住他！讓他加入「我們」......
			for resentment_num=1,12,1 do
				local x,y,z,dir=DW_Location(boss);
				local _resentment=CreateObj(_resentmentGUID,x,y,z,dir,1);
				--狀態設定
				AddToPartition(_resentment,room);
				CallPlot(_resentment,"lua_27in_boss1_tokenRULE",ctrl);
				LockHP(_resentment,1,"lua_27boss1_resentment_lockHP");
				Global_27in_1stBoss[room].resentment[#Global_27in_1stBoss[room].resentment+1]={guid=_resentment;target=0;};
			end
			countDOWN.summon_resentment=20;
		end
		local max_i=#Global_27in_1stBoss[room].resentment;
		for i=#Global_27in_1stBoss[room].resentment,1,-1 do
			for __=1,1,1 do
				if(CheckID(Global_27in_1stBoss[room].resentment[i].guid)==false)or(ReadRoleValue(Global_27in_1stBoss[room].resentment[i].guid,EM_RoleValue_IsDead)==1)then
					--怨念實體死亡
					table.remove(Global_27in_1stBoss[room].resentment,i);
					--DebugMsg(0,room,"resentment "..i.." is gone.")
					break;
				end
				local who=Global_27in_1stBoss[room].resentment[i].target;
				if(CheckID(who)==false)or(ReadRoleValue(who,EM_RoleValue_IsDead)==1)or(CheckBuff(who,624820)==true)then
					--目標消失
					Global_27in_1stBoss[room].resentment[i].target=nil;
					local _pass=false;
					for k=1,max_i,1 do
						for j=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
							if(Global_27in_1stBoss[room].PlayerInHateList[j].overload<=k)then
								local _k=Global_27in_1stBoss[room].PlayerInHateList[j].overload
								Global_27in_1stBoss[room].PlayerInHateList[j].overload=_k+1;
								Global_27in_1stBoss[room].resentment[i].target=rawget(Global_27in_1stBoss[room].PlayerInHateList[j],"guid");
								SetAttack(Global_27in_1stBoss[room].resentment[i].guid,Global_27in_1stBoss[room].resentment[i].target);
								_pass=true;
								break;
							end
						end
						if(_pass==true)then break;end
					end
				end
				if(Global_27in_1stBoss[room].resentment[i].target==nil)then
					DebugMsg(0,room,"resentment "..i.." can't get target.")
					--無法取得合法目標
					DelObj(Global_27in_1stBoss[room].resentment[i].guid);
					table.remove(Global_27in_1stBoss[room].resentment,i);
					break;
				else
					--持續追擊
					SetAttack(Global_27in_1stBoss[room].resentment[i].guid,Global_27in_1stBoss[room].resentment[i].target);
				end
			end
		end
	--cast
		for once=1,1,1 do
			if(GCD~=0)then break;end
			--取回財寶(衝鋒)
			local _charge=false;
			for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
				if(Global_27in_1stBoss[room].PlayerInHateList[_player].buff>=2)then
					ScriptMessage(boss,Global_27in_1stBoss[room].PlayerInHateList[_player].guid,2,"[$MUTE]".."[SC_27IN_BOSS1_CHARGE]",C_LightBlue);--交出來！
					CastSpell(boss,Global_27in_1stBoss[room].PlayerInHateList[_player].guid,851178);
					GCD=3;
					_charge=true;
					break;
				end
			end
			if(_charge==true)then break;end
			--群體恨意(hatred)
			if(Global_27in_1stBoss[room].boss.phase==2)and(countDOWN.summon_hatred==0)then
				countDOWN.summon_hatred=12;
				GCD=3;
				CastSpell(boss,boss,851189);
				broadcast_room(2,"[SC_27IN_BOSS1_HATRED]",C_LightBlue);--為什麼我...「我們」！為什麼「我們」要被困在這裡！
				break;
			end
			--隨機招式
			if(countDOWN.ranATK==0)then
				countDOWN.ranATK=7;
				local r=DW_Rand(1000)+cooperation_value;
				if(r>500)then
					cooperation_value=cooperation_value-150
					--用槍隨機打3~6個人，P2會附加恐懼4秒。
					CastSpellLv(boss,boss,851179,1);
					GCD=3;
				else
					cooperation_value=cooperation_value+150
					--用彎刀輾一圈，半徑75的圓，施法三秒，進戰需要閃躲，P2附加Dot8秒。
					CastSpellLv(boss,boss,851190,1);
					GCD=5;
				end
			end
		end
	end
	DelObj(door);
	DebugMsg(0,room,"迴圈結束");
	--是否戰敗重置
	if(Sign_reset==true)then
		DebugMsg(0,room,"重置");
		--寶藏
		for i=1,#Global_27in_1stBoss[room].treasure,1 do
			if(Global_27in_1stBoss[room].treasure[i].status=="box")then
				DelObj(Global_27in_1stBoss[room].treasure[i].guid);
			end
		end
		--貪婪幻影
		for i=1,#Global_27in_1stBoss[room].greed_ghost,1 do
			if(Global_27in_1stBoss[room].greed_ghost[i].guid~=nil)then
				DelObj(Global_27in_1stBoss[room].greed_ghost[i].guid);
			end
		end
		--怨念實體
		for i=1,#Global_27in_1stBoss[room].resentment,1 do
			if(Global_27in_1stBoss[room].resentment[i].guid~=nil)then
				DelObj(Global_27in_1stBoss[room].resentment[i].guid);
			end
		end
		--囚犯
		for i=1,cage_num,1 do
			if(Global_27in_1stBoss[room].cage[i]==nil)then
				break;
			elseif( Global_27in_1stBoss[room].prisoner[i] ~= nil and CheckID(Global_27in_1stBoss[room].prisoner[i].guid)==true)and(ReadRoleValue(Global_27in_1stBoss[room].prisoner[i].guid,EM_RoleValue_IsDead)==0)then
				--戰敗時在囚牢裡的一律殺死
				ScriptMessage(boss,Global_27in_1stBoss[room].prisoner[i].guid,1,"[SC_27IN_BOSS1_EXECUTE]",0);--「他們」失去了折磨你的興趣，於是死亡降臨到你的頭上...
				SysCastSpellLv(Global_27in_1stBoss[room].cage[i].guid,Global_27in_1stBoss[room].prisoner[i].guid,851176,0);
				WriteRoleValue(Global_27in_1stBoss[room].cage[i].guid,EM_RoleValue_LiveTime,1);
			end
		end
		--離開戰鬥
		DW_UnFight(boss,true);
		SetStopAttack(boss);
		sleep(50);
		DW_UnFight(boss,false);
	end
	--中控器消失此段結束
	DelObj(ctrl);
end
function lua_27in_boss1_greed_MRPlotName()--貪婪怨靈的普攻附加法術
	local greed,target=OwnerID(),TargetID();
	local room=ReadRoleValue(greed,EM_RoleValue_RoomID);
	
	if(ReadRoleValue(target,EM_RoleValue_IsPlayer)==1)then
		for i=1,#Global_27in_1stBoss[room].greed_ghost,1 do
			if(Global_27in_1stBoss[room].greed_ghost[i].guid==greed)then
				local _n=Global_27in_1stBoss[room].greed_ghost[i].pegging;
				
				Global_27in_1stBoss[room].treasure[_n].status="del";
				Global_27in_1stBoss[room].treasure[_n].guid=0;
				Global_27in_1stBoss[room].treasure[_n].changer=greed;
				Global_27in_1stBoss[room].treasure[_n].note="be stolen by greed";
				DebugMsg(target,room,"No. ".._n.." status -> del by stolen from you");
				--找到符合的玩家
				for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
					if(Global_27in_1stBoss[room].PlayerInHateList[_player].guid==target)then
						--減少效力
						local buff_lv=Global_27in_1stBoss[room].PlayerInHateList[_player].buff;
						if(buff_lv<=1)then
							Global_27in_1stBoss[room].PlayerInHateList[_player].buff=0;
							CancelBuff_NoEvent(target,624780);
							ScriptMessage(greed,target,1,"[SC_27IN_BOSS1_BUFFGONE]",0);--虛假的財寶從你身上被取走！
						else
							ScriptMessage(greed,target,1,"[SC_27IN_BOSS1_BUFFLESS]",0);--纏繞在你身上的意念變得微弱......
							Global_27in_1stBoss[room].PlayerInHateList[_player].buff=buff_lv-1;
						end
					end
				end
				
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
				DelObj(greed);return;
			end
		end
	end
	if(ReadRoleValue(target,EM_RoleValue_OrgID)==108154)then
		for i=1,#Global_27in_1stBoss[room].greed_ghost,1 do
			if(Global_27in_1stBoss[room].greed_ghost[i].guid==greed)then
				--找到符合的寶藏編號
				local _n=Global_27in_1stBoss[room].greed_ghost[i].pegging;
				DelObj(Global_27in_1stBoss[room].treasure[_n].guid);
				
				Global_27in_1stBoss[room].treasure[_n].status="del";
				Global_27in_1stBoss[room].treasure[_n].guid=0;
				Global_27in_1stBoss[room].treasure[_n].changer=greed;
				Global_27in_1stBoss[room].treasure[_n].note="be stolen by greed";
				DebugMsg(0,room,"No. ".._n.." status -> del by stolen from box");
				table.remove(Global_27in_1stBoss[room].greed_ghost,i);
				DelObj(greed);return;
			end
		end
	end
	DebugMsg(0,room,"greed attack wrong target");
	NPCSay(greed,"Hey! I'm attacking illegal target");
end
function lua_27in_boss1_resentment_MRPlotName()--怨念實體的普攻附加法術
	local resentment,target=OwnerID(),TargetID();
	local room=ReadRoleValue(resentment,EM_RoleValue_RoomID);
	
	for __=1,1,1 do
		if(CheckBuff(target,624785)==true)then return;end
		if(CheckBuff(target,624784)==false)then break;end
		local buff_pos=Lua_BuffPosSearch(target,624784);
		local buff_lv=BuffInfo(target,buff_pos,EM_BuffInfoType_Power);
		if(buff_lv<6)then
			break;--直上4層
		else
			CancelBuff_NoEvent(target,624784);
			AddBuff(target,624785,0,10);
			ScriptMessage(resentment,target,1,"[SC_27IN_BOSS1_STICK]",0);--過多的怨念纏繞著你，使你難以移動半步！
			return;
		end
	end
	AddBuff(target,624784,3,10);
end
function lua_27boss1_resentment_lockHP()--怨念實體的鎖血劇情
	local resentment=OwnerID();
	local room=ReadRoleValue(resentment,EM_RoleValue_RoomID);
	for i=1,#Global_27in_1stBoss[room].resentment,1 do
		if(Global_27in_1stBoss[room].resentment[i].guid==resentment)then
			local p=Global_27in_1stBoss[room].resentment[i].target;
			for j=#Global_27in_1stBoss[room].PlayerInHateList,1,-1 do
				if(Global_27in_1stBoss[room].PlayerInHateList[j].guid==p)then
					local _k=Global_27in_1stBoss[room].PlayerInHateList[j].overload;
					Global_27in_1stBoss[room].PlayerInHateList[j].overload=_k-1;
				end
			end
		end
	end
	LockHP(resentment,-100,"");
	KillID(resentment,resentment);
end
function lua_27in_boss1_hatred_MRPlotName()--召喚群體恨意
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	local num=0;
	if(zone==157)then num=12;else num=6;end
	
	local x,y,z,dir=DW_Location(boss);
	for i=1,num,1 do
		--召喚群體恨意
		local hatred=CreateObj(108153,x,y,z,dir,1);
		DW_UnFight(hatred,true);
		SetModeEx(hatred,EM_SetModeType_Gravity,false);
		WriteRoleValue(hatred,EM_RoleValue_IsWalk,1);
		MoveToFlagEnabled(hatred,false);
		AddToPartition(hatred,room);
		SetDefIdleMotion(hatred,ruFUSION_MIME_WALK_FORWARD);
		CallPlot(hatred,"lua_27in_boss1_tokenRULE",boss);
		
		AddBuff(hatred,624786,0,-1);--群體恨意出生帶BUFF(持續AE)
		local x,y,z,dir=DW_PureNewLoc(DW_Rand(360),700,x,y,z,dir);
		local sec=MoveDirect(hatred,x,y,z);
		WriteRoleValue(hatred,EM_RoleValue_LiveTime,sec/10);
	end
end
function lua_27in_boss1_hatred_EndUseLua()--基本法術:恨意爆發 的結果劇情
	local hatred,player=OwnerID(),TargetID();
	local room=ReadRoleValue(hatred,EM_RoleValue_RoomID);
	local boss=Global_27in_1stBoss[room].boss.guid
	ScriptMessage(hatred,player,1,"[SC_27IN_BOSS1_HIT]",0);--「他們」的恨意又更加高漲了.....
	AddBuff(boss,624830,0,-1);--仇恨之力疊加
	DelObj(hatred);
	return true;
end
function lua_27in_boss1_SK1_CheckUseScript()--玩家用來削弱Boss(檢查)
	local player,target=OwnerID(),TargetID();
	local _ORGid = ReadRoleValue(target,EM_RoleValue_OrgID);
	if( _ORGid == 108150 or _ORGid == 108175 or _ORGid == 108177  )then
		return true;
	end
	ScriptMessage(player,player,1,"[SC_424142_1]",0);--使用目標錯誤！
	return false;
end
function lua_27in_boss1_SK1_MRPlotName()--玩家用來削弱Boss(執行)
	local player,target=OwnerID(),TargetID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	
	--施放buff 疊加在boss身上
	if(CheckBuff(target,624823)==true)then
		if(Global_27in_1stBoss[room].boss.buff==2)then
			--狂暴
			ScriptMessage(player,player,1,"[SC_27IN_BOSS1_OVER]",0);--你對「他們」造成太多的刺激，產生反效果了......
			CancelBuff_NoEvent(target,624823);
			AddBuff(target,624825,0,40);
			AddBuff(target,624824,0,40);
			Global_27in_1stBoss[room].boss.buff=3;
		elseif(Global_27in_1stBoss[room].boss.buff==1)then
			ScriptMessage(player,player,1,"[SC_27IN_BOSS1_WEAK]",0);--這些貪財的靈魂沉浸在得到財寶的喜悅中而鬆懈了！
			AddBuff(target,624823,3,10);
			AddBuff(target,624824,0,40);
			Global_27in_1stBoss[room].boss.buff=2;
		end
	else
		if(CheckBuff(target,624824)==true)then
			--過度刺激
			ScriptMessage(player,player,1,"[SC_27IN_BOSS1_BADTIME]",0);--「他們」已經回過神來，現在正戒備著！
		else
			--第一層
			ScriptMessage(player,player,1,"[SC_27IN_BOSS1_WEAK]",0);--這些貪財的靈魂沉浸在得到財寶的喜悅中而鬆懈了！
			AddBuff(target,624823,2,10);
			AddBuff(target,624824,0,40);
			Global_27in_1stBoss[room].boss.buff=1;
		end
	end
	

end

function lua_27in_boss1_SK2_CheckUseScript()--玩家用來解除定身狀態(檢查)
	local player,target=OwnerID(),TargetID();
	if(ReadRoleValue(target,EM_RoleValue_IsPlayer)==0)then
		ScriptMessage(player,player,1,"[SC_424142_1]",0);--使用目標錯誤！
		return false;
	end
	if(CheckBuff(target,624784)==false)and((CheckBuff(target,624785)==false))then
		ScriptMessage(player,player,1,"[SC_424142_1]",0);--使用目標錯誤！
		return false;
	end
	return true;
end
function lua_27in_boss1_SK2_MRPlotName()--玩家用來解除定身狀態(執行)
	local player,target=OwnerID(),TargetID();

	--解除定身
	CancelBuff_NoEvent(target,624784);
	CancelBuff_NoEvent(target,624785);
	--找到符合的玩家
end

function lua_27in_boss1_box_touchplot()--觸碰劇情設定
	local player,box=OwnerID(),TargetID();
	local room=ReadRoleValue(player,EM_RoleValue_RoomID);
	SetModeEx(box,EM_SetModeType_Mark,false);
	SetPlot(box,"touch","",0);
	--檢查
	local activation=false;
	for i=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
		if(Global_27in_1stBoss[room].PlayerInHateList[i].guid==player)then
			activation=true;
		end
	end
	if(activation==false)then
		--玩家是非法目標
		SetPlot(box,"touch","lua_27in_boss1_box_touchplot",40);
		SetCursorType(box,eCursor_FurnitureRorare);
		SetModeEx(box,EM_SetModeType_Mark,true);
		ScriptMessage(player,player,1,"[SC_27IN_BOSS1_REJECT]",0);--你尚未加入戰鬥
		return false;
	end
	--執行
	for i=1,#Global_27in_1stBoss[room].treasure,1 do
		if(Global_27in_1stBoss[room].treasure[i].guid==box)then
			Global_27in_1stBoss[room].treasure[i].guid=player;
			Global_27in_1stBoss[room].treasure[i].status="buff";
			Global_27in_1stBoss[room].treasure[i].changer=player;
			Global_27in_1stBoss[room].treasure[i].note="picked up by player";
			DebugMsg(player,room,"No. "..i.." status -> buff by touch from box");
			WriteRoleValue(player,EM_RoleValue_Register2,i);
			
			--找到符合的玩家
			for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
				if(Global_27in_1stBoss[room].PlayerInHateList[_player].guid==player)then
					local buff_lv=Global_27in_1stBoss[room].PlayerInHateList[_player].buff;
					if(buff_lv==0)then
						AddBuff(player,624780,0,-1);
					end
					--增加計次
					Global_27in_1stBoss[room].PlayerInHateList[_player].buff=buff_lv+1;
				end
			end
			
			DelObj(box);
			return;
		end
	end
	DebugMsg(0,room,"lua_27in_boss1_box_touchplot 錯誤 箱子被拿走了 我的GUID是:"..player.." Box:"..box);
	local i=ReadRoleValue(box,EM_RoleValue_PID);
	DebugMsg(0,room,"No."..i..", status:"..Global_27in_1stBoss[room].treasure[i].status..", note:"..Global_27in_1stBoss[room].treasure[i].note);
	DelObj(Box);
end
function lua_27in_boss1_charge_CheckUseLua()--基本法術:嫉恨傷害檢查劇情=>用來偷走treasure
	local boss,player=OwnerID(),TargetID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local rob=false;
	
	for _player=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
		if(Global_27in_1stBoss[room].PlayerInHateList[_player].guid==player)then
			for _treasure=1,#Global_27in_1stBoss[room].treasure,1 do
				if(Global_27in_1stBoss[room].treasure[_treasure].guid==player)then
					--改變寶藏狀態
					Global_27in_1stBoss[room].treasure[_treasure].status="del";
					Global_27in_1stBoss[room].treasure[_treasure].guid=0;
					Global_27in_1stBoss[room].treasure[_treasure].changer=boss;
					Global_27in_1stBoss[room].treasure[_treasure].note="be stolen by boss charge";
					DebugMsg(player,room,"No. ".._treasure.." status -> del by charge from boss");
					rob=true;
				end
			end
			if(rob==false)then
				DebugMsg(0,room,"嫉恨傷害取消  目標已將寶藏脫手")
				return false
			else
				CancelBuff_NoEvent(player,624780);
				Global_27in_1stBoss[room].PlayerInHateList[_player].buff=0
				return true;
			end
		end
	end
	DebugMsg(0,room,"嫉恨傷害取消  目標已轉為不合法")
	return false;
end
function lua_27in_boss1_gun_ShootTargetScript()--法術集合:怨靈彈 的劇情選取
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local zone=ReadRoleValue(boss,EM_RoleValue_ZoneID);
	
	local num=0;
	if(zone==157)then
		num=6;--困難版
	else 
		num=3;
	end
	
	local rtable={};
	for i=1,#Global_27in_1stBoss[room].PlayerInHateList,1 do
		table.insert(rtable,Global_27in_1stBoss[room].PlayerInHateList[i].guid);
	end
	
	local _num=0
	for n=1,100,1 do
		local r=DW_Rand(#rtable);
		if(r==0)then return true;end		--人不夠
		if(_num>=num)then return true;end	--已經足數
		PushMagicShootTarget(table.remove(rtable,r));
		_num=_num+1;
	end
end
function lua_27in_boss1_bonus_CheckUseLua()--基本法術:怨靈恐懼和仇恨尖牙的檢查
	if(lua_27in_boss1_avoidbox()==false)then return false;end
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	if(Global_27in_1stBoss[room].boss.phase==1)then
		return false;
	end
end
function lua_27in_boss1_avoidbox()--避開寶箱
	local org=ReadRoleValue(TargetID(),EM_RoleValue_OrgID);
	if(org==108154)then
		return false;
	else
		return true;
	end
end
function lua_27in_boss1_szLuaInitScript()--出生劇情，產生離開的門
	local boss=OwnerID();
	local room=ReadRoleValue(boss,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(781346,5);
	local gate=CreateObj(106249,x,y,z,dir,1);
	SetModeEx(gate,EM_SetModeType_Mark,false);
	SetModeEx(gate,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(gate,EM_SetModeType_Obstruct,true);
	DW_UnFight(gate,true);
	AddToPartition(gate,room);
	CallPlot(gate,"lua_27in_boss1_tokenRULE",boss);
	Cl_Resist_HackersBossNum();
end


--108149
function Lua_Z27_Boss_1_Check()
	local _cage = OwnerID();
	local _room=ReadRoleValue( _cage , EM_RoleValue_RoomID );
	local _boss = Global_27in_1stBoss[_room].boss.guid;
	DebugMsg( 0 , 0 , "--Lua_Z27_Boss_1_Check--  ".._boss);

	local max=#Global_27in_1stBoss[_room].PlayerInHateList;
	local _pass=false;
	for i=1,max,1 do
		if(Global_27in_1stBoss[_room].PlayerInHateList[i].guid==id)then
			--通過認證
			Global_27in_1stBoss[_room].PlayerInHateList[i].legal=true;
			Global_27in_1stBoss[_room].PlayerInHateList[i].hate_point=hatepoint;
			_pass=i;
			break;
		end
	end
	if(_pass==false)then
		--仇恨目標不在table中，新增玩家資料
		_pass=max+1;
		Global_27in_1stBoss[_room].PlayerInHateList[_pass]={guid=id;overload=0;legal=true;hate_point=hatepoint;buff=0};
		--DebugMsg(0,room,"player:"..id.." add to list.");
	end

--	local _playerList = SearchRangePlayer ( _boss , 500 );
--	local _playerListLen = #_playerList - 1;
	local _current;
--	for i = 0 , _playerListLen , 1 do
	local _hateListCount=HateListCount( _boss );
	local _hatepoint;
	for i=_hateListCount-1 ,0 ,-1 do
		_current = HateListInfo( _boss , i ,EM_HateListInfoType_GItemID );
--		_current = _playerList[ i ];
		if CheckBuff( _current ,624820 ) == true then
			DebugMsg( 0 , 0 , "_current==".._current);
			_hatepoint = HateListInfo( _boss , i ,EM_HateListInfoType_HatePoint );
			ScriptMessage( _boss , _current , 0 ,"[SC_27IN_BOSS1_RELEASE]" , C_YELLOW );--你成功從牢籠中逃了出來！
			CancelBuff_NoEvent( _current , 624820 );
			SetHateListPoint( _boss , i , ( Global_27in_1stBoss[_room].prisoner[1].hate_point ) + _hatepoint );
			Global_27in_1stBoss[_room].PlayerInHateList[_pass].hate_point=HateListInfo( _boss , i ,EM_HateListInfoType_HatePoint );
			--囚犯資料清除
			Global_27in_1stBoss[_room].prisoner[i]={};
		end
	end
end