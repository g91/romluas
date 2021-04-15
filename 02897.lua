function lua_26in_boss1_replace()--跳轉，將劇情移至 邦喀雷姆斯 身上執行
	CloseSpeak(OwnerID());
	--邦喀雷姆斯
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	BeginPlot(bancremz,"lua_26in_boss1_main",0);
	local room=ReadRoleValue(bancremz,EM_RoleValue_RoomID);
	Lua_BellatiaDuplication_change_status(room,"boss");
end
function lua_26in_boss1_main()--26副本一王
	local bancremz, morek, jill, comgas, kalaway, ironrose, dragon=lua_26in_npcGUID();
	local room=ReadRoleValue(bancremz,EM_RoleValue_RoomID);
	
	--戰鬥用物件
	local rofoonayva,saguwait,viki,runeball,invisibleball;
	
	--開啟阻擋門
	local FRONTdoor=Global_BellatiaDuplication[room].door_before_boss1.GUID;
	SetModeEx(FRONTdoor,EM_SetModeType_Show,false);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,false);
	
	--蘿芙娜伊娃
	--rofoonayva，不索敵不反擊，所以不可能攻擊玩家，只會攻擊setattack指定的目標
	local x,y,z,dir=DW_Location(781206,2);
	local org={hard=102989;normal=107979;easy=108042;};
	rofoonayva=CreateObj(org[Global_BellatiaDuplication.type],x,y,z,dir,1);
	SetModeEx(rofoonayva,EM_SetModeType_Mark,false);
	SetModeEx(rofoonayva,EM_SetModeType_Searchenemy,false);
	SetModeEx(rofoonayva,EM_SetModeType_Strikback,false);
	AddToPartition(rofoonayva,room);
	LockHP(rofoonayva,1,"");
	
	--薩格維特
	--saguwait，玩家要戰鬥的對象
	local x,y,z,dir=DW_Location(781206,3);
	local org={hard=102987;normal=107978;easy=108041;};
	saguwait=CreateObj(org[Global_BellatiaDuplication.type],x,y,z,dir,1);
	DW_UnFight(saguwait,true);
	AddToPartition(saguwait,room);
	
	--維琪
	--viki，施放熱能(必死招式)的物件，位於半空中，不該掉下來
	local x,y,z,dir=DW_Location(781206,5);
	local org={hard=107762;normal=107980;easy=108043;}
	viki=CreateObj(org[Global_BellatiaDuplication.type],x,y+220,z,dir, 1);
	SetModeEx(viki,EM_SetModeType_Gravity,false);
	SetModeEx(viki,EM_SetModeType_Mark,false);
	SetModeEx(viki,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(viki,EM_SetModeType_HideName,true);
	DW_UnFight(viki,true);--非戰鬥物件
	AddToPartition(viki,room);
	
	--符文球
	--runeball，定時和 invisibleball 產生能量連線(純特效)，會定時移動
	local x,y,z,dir=DW_Location(781206,6);
	runeball=CreateObj(107770,x,y,z,dir,1);
	SetModeEx(runeball,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(runeball,EM_SetModeType_HideName,true);
	SetModeEx(runeball,EM_SetModeType_Mark,false);
	DW_UnFight(runeball,true);--非戰鬥物件
	MoveToFlagEnabled(runeball,false);
	AddToPartition(runeball,room);
	SetDefIdleMotion(runeball,ruFUSION_MIME_NONE);
	SetDir(runeball,180);
	AddBuff(runeball,624278,0,-1);--特效 Buff
	
	--隱形目標
	--invisibleball，全域物件，在非常遠的位置，定時和 runeball產生能量連線(純特效)(原本的成像機制要使用，但是遇到困難，目前是採用最簡單的成像而沒有使用到這個物件)
	invisibleball=CreateObj(107771,x,y,z,dir,1);
	SetModeEx(invisibleball,EM_SetModeType_Mark,false);
	SetModeEx(invisibleball,EM_SetModeType_Gravity,false);
	SetModeEx(invisibleball,EM_SetModeType_ShowRoleHead,false);
	SetModeEx(invisibleball,EM_SetModeType_HideName,true);
	DW_UnFight(invisibleball,true);
	MoveToFlagEnabled(invisibleball,false);
	AddToPartition(invisibleball,room);
	
	--光龍OrgID
	local org={hard=102987;normal=107978;easy=108041;};
	local DragonOrgID=org[Global_BellatiaDuplication.type];
	
	local need_cleared_at_reset={rofoonayva,saguwait,viki,runeball,invisibleball};
	local need_cleared_at_final={viki,runeball,invisibleball};
	--測試設定(刪除中控器將刪除)
	for __,guid in pairs(need_cleared_at_reset)do
		CallPlot(guid,"lua_26in_boss1_tokenRULE",OwnerID());
	end
	
	--第一階段：表演(邦喀雷姆斯跑進一王房間)
	--設定邦喀雷姆斯
	DW_UnFight(bancremz,true);
	local passtime=0;
	local x,y,z,dir=DW_Location(781206,4);--邦喀雷姆斯指定進場地點
	--Phase
	Phase="ready";--ready,show,fight,reset,success
	while(Lua_BellatiaDuplication_check_status(room,"boss"))and(Phase=="ready")do
		sleep(10);
		passtime=passtime+1;
		--光龍台詞
		if(passtime==1)then Yell(bancremz,"[SC_26IN_BOSS1_LEADSHOW]",4);end
		if(passtime==5)then Yell(bancremz,"[SC_26IN_BOSS1_GOINROOM_1]",4);end
		if(passtime==8)then Yell(bancremz,"[SC_26IN_BOSS1_GOINROOM_2]",4);end
		Move(bancremz,x,y,z);
		if(DW_GetDistance(bancremz,x,y,z)<40)then
			Phase="show";
		end
	end
	--第二階段：表演(邦喀雷姆斯已經和蘿芙娜伊娃打起來，薩格維特在旁邊不斷唸台詞)
	--變身表演
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_A]");
	AddBuff(bancremz,624289,0,7);
	SysCastSpellLv(bancremz,bancremz,850810,0);
	sleep(30)
	SetModeEx(dragon,EM_SetModeType_Mark,false);
	SetModeEx(dragon,EM_SetModeType_Move,false);
	SetModeEx(dragon,EM_SetModeType_Searchenemy,false);
	SetModeEx(dragon,EM_SetModeType_Strikback,false);
	SetModeEx(dragon,EM_SetModeType_Fight,true);
	local x,y,z,dir=DW_Location(bancremz);
	SetPos(dragon,x,y,z,dir);
	SetPos(bancremz,0,0,0,0);
	StopMove(bancremz,true);
	
	--邦喀雷姆斯 和 蘿芙娜伊娃 互打
	
	SetAttack(dragon,rofoonayva);
	SetAttack(rofoonayva,dragon);
	SetModeEx(saguwait,EM_SetModeType_Strikback,true);
	SetModeEx(saguwait,EM_SetModeType_Fight,true);
	
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_B]");
	passtime=0;
	
	local idle={};
	idle.string={"[SC_26IN_BOSS1_LINES_1]", "[SC_26IN_BOSS1_LINES_2]", "[SC_26IN_BOSS1_LINES_3]", "[SC_26IN_BOSS1_LINES_4]"};
	idle.motion={ruFUSION_ACTORSTATE_BUFF_SP01, ruFUSION_ACTORSTATE_CAST_SP01, ruFUSION_ACTORSTATE_CAST_INSTANT, ruFUSION_ACTORSTATE_EMOTE_IDLE1};
	idle.delay={85, 80, 75, 80};
	idle.rand=1;--起始必為1;
	local list={2,3,4};
	local door_status="open";
	while(CheckID(saguwait)==true)and(HateListCount(saguwait)==0)and(Lua_BellatiaDuplication_check_status(room,"boss"))and(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==0)do
		passtime=passtime+1;
		if(passtime==2)then Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS1_C]");end
		--薩格維特碎念表演
		sleep(5);
		PlayMotion(saguwait,idle.motion[idle.rand]);
		sleep(5);
		Yell(saguwait,idle.string[idle.rand],3);
		for _sec=0,idle.delay[idle.rand]-5,10 do
			sleep(10);
			if((CheckID(saguwait)==false)or(HateListCount(saguwait)>0)or(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==1))and(door_status=="open")then
				door_status="close";
				--戰鬥開始 ，關門
				SetModeEx(FRONTdoor,EM_SetModeType_Show,true);
				SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,true);
				break;
			end
		end
		if(door_status=="close")then break;end
		--校正面向
		local x,y,z,dir=DW_Location(rofoonayva);
		local dir=DW_GetDir(x,y,z,saguwait);
		if(math.abs(dir-ReadRoleValue(saguwait,EM_RoleValue_Dir))>25)then
			SetDir(saguwait,dir);
		else	
			AdjustDir(saguwait, DW_Rand(140)-70 );
		end
		
		--隨機挑選，同循環內不重複
		idle.rand=table.remove(list,DW_Rand(#list));
		if(#list==0)then
			list={1,2,3,4};
		end
	end
	idle=nil;list=nil;--釋放
	
	--戰鬥開始 ，關門
	SetModeEx(FRONTdoor,EM_SetModeType_Show,true);
	SetModeEx(FRONTdoor,EM_SetModeType_Obstruct,true);
	
	
	--戰鬥開始
	Lua_BellatiaDuplication_update_players(room);
	for i=1,#Global_BellatiaDuplication[room].players,1 do
		local player=Global_BellatiaDuplication[room].players[i].guid;
		if(GetDistance(saguwait,FRONTdoor)>GetDistance(saguwait,player))then
			SysCastSpellLv(player,saguwait,499110,1);--製造仇恨5000
		end
	end
	
	--主戰鬥迴圈
	
	
	--資料設定
	
	--仇恨資料
	local HateList={};
	local HateList_PurePlayer={};
	
	--時間資料(此處數值為開始運作時間，冷卻時間是各別設定)
	local GCD=2;
	local cd_summon=1;
	local cd_nuclear=31;
	local cd_fury=360;if(Global_BellatiaDuplication.type=="hard")then cd_fury=480;end
	local cd_heal=30;
	local cd_randatk=5;
	local cd_bomb=7;
	local cd_ray=0;
	
	local function CD_descend(value)
		--非數值資料不處理
		if(type(value)~="number")then return value;end
		--遞減最低至零
		if(value>0)then
			return value-1;
		else	
			return 0;
		end
	end
	--召喚制裁者的設定
	local __={hard=107765;normal=107981;easy=108044;}
	--cd9 +表演6 = 15秒出一波
	local summon={cd=9;course=false;passtime=-1;num=3;max=3;id=__[Global_BellatiaDuplication.type];};
	if(Global_BellatiaDuplication.type=="hard")then summon.max=5;summon.num=5;end
	summon.string1="[SC_26IN_BOSS1_SUMMON]";
	summon.string2="[SC_26IN_BOSS1_GATE]";
	summon.string3="[SC_26IN_BOSS1_TRANSPORT]";
	local guardians={};--用來裝需要清場時的物件id記錄
	--熱能的設定
	local nuclear={cd=30;course=false;block=2;note=2}
	if(Global_BellatiaDuplication.type=="hard")then nuclear.block=4;nuclear.note=4;end
	nuclear.string1="[SC_26IN_BOSS1_CALL]"
	nuclear.string2="[SC_26IN_BOSS1_NUCLEAR_READY]"
	nuclear.string3="[SC_26IN_BOSS1_SHIELD_READY]"
	nuclear.string4="[SC_26IN_BOSS1_NUCLEAR_ATK]"
	nuclear.string5="[SC_26IN_BOSS1_SHIELD_FAIL]"
	--狂暴(副本頭目共同機制)
	local fury={id=624243;course=false;};
	fury.string1="[SC_26IN_BOSS1_FURY]";
	--幫監護者補血的機制
	local __={hard=10;normal=7;easy=3};
	local heal={cd=30;lv=__[Global_BellatiaDuplication.type];};
	heal.string1="[SC_26IN_BOSS1_HEAL_SAY]"
	heal.string2="[SC_26IN_BOSS1_HEAL_DONE]"
	--隨機選招：維特烈印&魁武橫掃
	local randatk={cd=5;};
	randatk.spell1=850791;randatk.spell1lv=0;
	randatk.spell2=850792;randatk.spell2lv=0;
	--爆彈投射
	local bomb={cd=7;number=2;spell=850794;lv=0;};
	if(Global_BellatiaDuplication.type=="hard")then bomb.number=4;end
	--能量光束(特殊)
	local ray={cd=1};
	local MoveDis={[0]=5;11;16;22;27;32;37;42;47;52;110;};
	local Radius={[0]=50;105;152;210;257;305;353;401;448;496;1050};
	local Track={};--將會從0開始，留意!
	local circle_phase="ready";
	local count_angle=0;
	local next_loc={};
	local PlayerStatus={};
	local FreezeTime={};
	local AreaRecord={};
	local function JudgePlayerArea(player,runeball,RayDir)
		local x,y,z,dir=DW_Location(player);
		local bearing=DW_GetDir(x,y,z,runeball);
		local angle;
		local angle=bearing-RayDir;
		if(angle<0)then
			angle=angle+360;
		end
		if(angle>360)then
			angle=angle-360;
		end
		--DebugMsg(0,room,"bearing="..bearing..", RayDir="..RayDir..", angle="..angle);
		if(angle<=90)and(angle>=0)then
			return 1;
		elseif(angle<=360)and(angle>=270)then
			return 2;
		else
			return 3;
		end
	end
	local function RayHitPlayer(player)
		--PlayerStatus: Hitted,Freeze
		if(not PlayerStatus[player])then
			PlayerStatus[player]="Hitted";
		end
		if(PlayerStatus[player]=="Hitted")then
			--玩家被命中
			if(CheckBuff(player,624253))then
				--有反射鏡的情況下
				local x,y,z,dir=DW_Location(player);
				local t=CreateObj(122714,x,y,z,dir,1);
				SetModeEx(t,EM_SetModeType_Mark,false);
				SetModeEx(t,EM_SetModeType_ShowRoleHead,false);
				WriteRoleValue(t,EM_RoleValue_LiveTime,1);
				AddToPartition(t,room);
				BeginPlot(t,"DelSelf",2);
				AttachObj(t, player, 1, "p_hit_point01", "p_hit_point01");
				SysCastSpellLv(t, rofoonayva, 850800, 0);
				CancelBuff_NoEvent(player,624253);
				AddBuff(player,624253,nuclear.note,4);
				AddBuff(rofoonayva,624254,0,-1);--白平衡
			else
				DebugMsg(player,room,"You're shoted, if don't get dmg, plz tell Ray Poleax. other data: atk relation>>"..tostring(CheckRelation(viki,player,EM_CheckRelationType_Attackable)));
				SysCastSpellLv(viki,player,850805,0);
			end
			PlayerStatus[player]="Freeze";
			FreezeTime[player]=4;
			AddBuff(player,624252,0,4);
		elseif(PlayerStatus[player]=="Freeze")then
			if(FreezeTime[player]==0)then
				PlayerStatus[player]=nil;
				FreezeTime[player]=nil;
			end
		end
	end
	
	passtime=0;
	while true do--失敗條件在Keep區檢查
		--此案例特殊，這段原本只是sleep(10), 為求判定精準，將此1秒拆成數等分判斷
		if(circle_phase=="work")then
			local StandardDir=ReadRoleValue(runeball,EM_RoleValue_Dir);
			local duration=5;
			for tenth=duration,10,duration do
				local bearing_now=(StandardDir+count_angle-6+(6*tenth/duration))%360;
				local bearing_bef=(StandardDir+count_angle-6+(6*(tenth-duration)/duration))%360;
				for i=1,#Global_BellatiaDuplication[room].players,1 do
					local player=Global_BellatiaDuplication[room].players[i].guid;
					local x,y,z,dir=DW_Location(player);
					local bearing=DW_GetDir(x,y,z,runeball);
					local Pass=false;
					if(bearing<=bearing_now)and(bearing>=bearing_bef)then
						RayHitPlayer(player);
						Pass=true
					end
					local last_area=AreaRecord[player];
					local this_area=JudgePlayerArea(player,runeball,bearing_bef);
					AreaRecord[player]=this_area;
					--Yell(player,"Area:"..AreaRecord[player],3);
					if((last_area==1)and(this_area==2))or((last_area==2)and(this_area==1))then
						if(not Pass)and(GetDistance(player,viki)<700)then
							DebugMsg(player,room,"you just cross ray-line");
							RayHitPlayer(player);
							Pass=true;
						end
					end
				end
				sleep(duration);
			end
		else
			sleep(10);
		end
	--reset
		--測試使用 強制中斷
		if(Lua_BellatiaDuplication_check_status(room,"boss")==false)then
			Phase="success";
			break;
		end
	--keep
		--時間維持
		
		GCD=		CD_descend(GCD);
		cd_fury=	CD_descend(cd_fury);
		cd_summon=	CD_descend(cd_summon);
		cd_nuclear=	CD_descend(cd_nuclear);
		--cd_heal=	CD_descend(cd_heal);
		cd_randatk=	CD_descend(cd_randatk);
		cd_bomb=	CD_descend(cd_bomb);
		cd_ray=	CD_descend(cd_ray);
		for player,time in pairs(FreezeTime)do
			if(time==0)then
				FreezeTime[player]=nil;
				PlayerStatus[player]=nil;
			else
				FreezeTime[player]=CD_descend(time);
			end
		end
		
		--更新資料
		passtime=passtime+1;
		--In Original version, update player data per sec.
		Lua_BellatiaDuplication_update_players(room);--重取一次玩家列表(from 26副本中控)
		
		
		--判斷結束條件
		--saguwait 狀況判斷=>死亡或消失
		if(CheckID(saguwait)==false)or(ReadRoleValue(saguwait,EM_RoleValue_IsDead)==1)then
			Phase="success";
			break;
		end
		-- 玩家數量 沒有玩家就離開
		if(#Global_BellatiaDuplication[room].players==0)then
			DebugMsg(0,room,"Global_Player=0");
			Phase="reset";
			break;
		end
		--仇恨表判斷
		local TarNum=HateListCount(saguwait);
		if(TarNum==0)then
			DebugMsg(0,room,"saguwait Hate List =0");
			Phase="reset";
			break;
		else
			--更新薩格維特的仇恨表資料
			HateList={};HateList_PurePlayer={};
			for pos=0,TarNum-1,1 do
				local e=HateListInfo(saguwait,pos,EM_HateListInfoType_GItemID);
				table.insert(HateList,e);
				if(ReadRoleValue(e,EM_RoleValue_IsPlayer)==1)then
					if(CheckRelation(saguwait,e,EM_CheckRelationType_Attackable))then
						table.insert(HateList_PurePlayer,e);
					end
				elseif(ReadRoleValue(e,EM_RoleValue_OrgID)==DragonOrgID)then
					--光龍不應該有仇恨
					SetHateListPoint(saguwait,pos,1);
				end
			end
			if(#HateList_PurePlayer==0)then
				DebugMsg(0,room,"No Player aggro Saguwait");
				Phase="reset";
				break;
			end
		end
		--測試使用(最後應該刪除)
		for i=1,#Global_BellatiaDuplication[room].players,1 do	
			local player=Global_BellatiaDuplication[room].players[i].guid;
			if(ReadRoleValue(player,EM_RoleValue_IsDead)==0)and(CheckBuff(player,624495)==false)then
				for J=1,#HateList_PurePlayer,1 do
					if player==HateList_PurePlayer[j] then
						break;
					end
					if(j==#HateList_PurePlayer)then
						DebugMsg(player,room,"Hey! you aren't in saguwait's Hate List.Bit him!");
						AddBuff(player,624495,0,10);
					end
				end	
			end
		end		
		--蘿芙娜伊娃的狀態(避免被嘲諷後，失去目標)
		if(ReadRoleValue(rofoonayva,EM_RoleValue_AttackTargetID)==0)then
			SetAttack(dragon,rofoonayva);
			SetAttack(rofoonayva,dragon);
		end
		--運作：Track 是11種速度不一樣的隱形物件，以相同速率(角度增加率)繞圓(以runeball為中心)。
		--invisibleball 則是特效的成像，會attach到Track裡的物件(預設是最遠的)(目前此成像機制遇到困難，因此還沒執行)
		if(circle_phase=="stop")then
			if(cd_ray==0)then
				circle_phase="ready";
				StopMove(runeball,true);
			else
				if(ReadRoleValue(runeball,EM_RoleValue_NpcOnMove)==0)then
					local x,y,z,dir=DW_Location(781206,6);
					x,y,z,dir=DW_NewLocation(DW_Rand(360),30,x,y,z,dir)
					Move(runeball,x,y,z);
				end
			end
		end
		if(circle_phase=="work")then
			if(count_angle==0)then
				--AttachObj(invisibleball,Track[1],1,"p_down","p_down");
			end
			if(count_angle==360)then
				--第三階段
				--特效結束
				DetachObj(invisibleball);
				DelFromPartition(invisibleball);
				
				--清除
				for i,guid in pairs(Track)do
					DelObj(Track[i]);
					Track[i]=nil;
				end
				count_angle=0;
				next_loc={};
				circle_phase="stop";
				cd_ray=ray.cd;
			else
				--第二階段
				local x,y,z,dir=DW_Location(runeball);
				--一秒運作一次: 設定
				for i=0,10,1 do
					SetPos(Track[i],next_loc[i][1],next_loc[i][2],next_loc[i][3],next_loc[i][4]);
					next_loc[i]={};
				end
				count_angle=count_angle+6;
				for i=0,10,1 do
					local x,y,z,dir=DW_PureNewLoc(count_angle,Radius[i],x,y,z,dir);
					next_loc[i]={x,y,z,dir};
					MoveDirect(Track[i],x,y,z);
				end
				AttachObj(invisibleball,Track[10],1,"p_down","p_down");
			end
		end
		if(circle_phase=="ready")then--第一階段
			local x,y,z,dir=DW_Location(runeball);
			for i=0,10,1 do
				x,y,z,dir=DW_PureNewLoc(0,Radius[i],x,y,z,dir);
				local t=CreateObj(108120+i,x,y,z,dir,1);
				DW_UnFight(t,true);
				SetModeEx(t,EM_SetModeType_Gravity,false);
				SetModeEx(t,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(t,EM_SetModeType_HideName,true);
				SetModeEx(t,EM_SetModeType_Mark,false);
				WriteRoleValue(t,EM_RoleValue_IsWalk,0);
				MoveToFlagEnabled(t,false);
				AddToPartition(t,room);
				ReCalculate(t);
				Track[i]=t;--從0開始
				next_loc[i]={};--初始化
			end
			for i=0,10,1 do
				local x,y,z,dir=DW_PureNewLoc(count_angle,Radius[i],x,y,z,dir);
				next_loc[i]={x,y,z,dir};
				MoveDirect(Track[i],x,y,z);
			end
			circle_phase="work";
			--特效
			AddToPartition(invisibleball,room);
			SysCastSpellLv(runeball,Track[10],850799,1);
			
			
			--玩家定位(校準)
			local StandardDir=ReadRoleValue(runeball,EM_RoleValue_Dir);
			for i=1,#Global_BellatiaDuplication[room].players,1 do
				local player=Global_BellatiaDuplication[room].players[i].guid;
				AreaRecord[player]=JudgePlayerArea(player,runeball,StandardDir);
				--Yell(player,"Area:"..AreaRecord[player],3);
			end
		end
		
	--cast
		--動作：不可連續觸發
		for __=1,1,1 do
			if(GCD>0)then break;end
			if(cd_summon==0)then
				--召喚流程
				cd_summon=summon.cd;
				summon.course=true;
				DebugMsg(0,room,"summon.course begin");
				summon.passtime=-1;
				break;
			end
			if(cd_nuclear==0)then
				--熱能(致命殺招，連續流程)
				cd_nuclear=nuclear.cd;
				nuclear.course=true;
				DebugMsg(0,room,"nuclear.course begin");
				nuclear.passtime=-1;
				break;
			end
			if(cd_heal==0)and(not fury.course)then
				--系統導正(補血)
				cd_heal=heal.cd;
				heal.course=true;
				heal.passtime=-1;
				break;
			end
			if(cd_randatk==0)then
				local tar=ReadRoleValue(saguwait,EM_RoleValue_AttackTargetID);
				if(GetDistance(saguwait,tar)>60)then break;end
				--選機選招
				local r=DW_Rand(2);
				if(r==1)then
					if(CastSpellLv(saguwait,tar,randatk.spell1,randatk.spell1lv)==true)then
						cd_randatk=randatk.cd;
					end
				else
					if(CastSpellLv(saguwait,tar,randatk.spell2,randatk.spell2lv)==true)then
						cd_randatk=randatk.cd;
					end
				end
				break;
			end
			if(cd_bomb==0)then
				--爆彈投射
				if(#HateList_PurePlayer==0)then break;end
				CastSpellLv(saguwait,saguwait,bomb.spell,bomb.lv);
				cd_bomb=bomb.cd;
				break;
			end
		end
		--效果：無時間差，力求即時反應
		--定時狂暴
		if(cd_fury<=0)and(Global_BellatiaDuplication.type~="easy")then
			if(not CheckBuff(saguwait,fury.id))then
				AddBuff(saguwait,fury.id,0,-1);
				Lua_BroadCast_RoomStingTypeColor(room,fury.string1,2,C_LightBlue);
				fury.course=true;--告知其他系統
			end
		end
		--傳送通道，召喚小怪
		if(summon.course)then
			--summon.course的keep phase
			--校正清單
			for i=#guardians,1,-1 do
				if(not CheckID(guardians[i]))or(ReadRoleValue(guardians[i],EM_RoleValue_IsDead)==1)then
					table.remove(guardians,i);
				end
			end
			--避免過度產生(待數量吻合繼續)
			if((#guardians+summon.num)<=summon.max)then
				summon.passtime=summon.passtime+1;
			else
				summon.course=false;
				cd_summon=2;--延遲;
			end
			if(summon.passtime==0)then Yell(saguwait,summon.string1,4);end
			if(summon.passtime==3)then
				Lua_BroadCast_RoomStingTypeColor(room,summon.string3);
				local r=DW_Rand(#HateList_PurePlayer);
				local player=HateList_PurePlayer[r];
				local x,y,z,dir=DW_Location(player);
				local gate=CreateObj(107766,x,y,z,dir,1);
				SetModeEx(gate,EM_SetModeType_Mark,false);
				SetModeEx(gate,EM_SetModeType_ShowRoleHead,false);
				SetModeEx(gate,EM_SetModeType_HideName,true);
				SetModeEx(gate,EM_SetModeType_Gravity,false);
				DW_UnFight(gate,true);
				AddToPartition(gate,room);
				CallPlot(gate,"lua_26in_boss1_tokenRULE",saguwait);
				summon.gate=gate;--暫存
			end
			if(summon.passtime==6)then
				local x,y,z,dir=DW_Location(summon.gate);
				for i=1,summon.num,1 do
					local x,y,z,dir=DW_NewLocation(53*i,30,x,y,z,dir);
					local g=CreateObj(summon.id,x,y,z,dir,1);
					SetModeEx(g,EM_SetModeType_Strikback,false);
					AddBuff(g,502707,0,-1);
					AddToPartition(g,room);
					table.insert(guardians,g);
					SetPlot(g,"dead","lua_26in_boss1_tokendead",0);
					if(#HateList_PurePlayer>0)then
						local r=DW_Rand(#HateList_PurePlayer);
						SetAttack(g,HateList_PurePlayer[r]);
					end
					CallPlot(g,"lua_26in_boss1_tokenRULE",saguwait);
				end
				DelObj(summon.gate);summon.gate=nil;
				cd_summon=summon.cd;
				summon.course=false;
				DebugMsg(0,room,"summon.course is finish");
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string3,2,C_YELLOW);
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string3,0,C_YELLOW);
			end
		end
		--施展熱能
		if(nuclear.course)then
			nuclear.passtime=nuclear.passtime+1;
			if(nuclear.passtime==0)then 
				Yell(saguwait,nuclear.string1,4);
				AddBuff(dragon,624495,0,6);--光龍原本的技能在此Buff作用中，都不會施放
			end
			if(nuclear.passtime==2)then Lua_BroadCast_RoomStingTypeColor(room,nuclear.string2);end
			if(nuclear.passtime>=0)and(nuclear.passtime<6)then
				--處理反射鏡的效果
				local buffpos=Lua_BuffPosSearch(rofoonayva,624254);
				local bufflv=BuffInfo(rofoonayva,buffpos,EM_BuffInfoType_Power);
				DebugMsg(0,room,"bufflv="..bufflv);
				if(bufflv>=nuclear.block)then
					DebugMsg(0,room,"success stun!");
					CancelBuff_NoEvent(rofoonayva,624254);
					AddBuff(rofoonayva,624283,0,5);
					CastSpell(rofoonayva,rofoonayva,850801);
					Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_STUNBOSS]");
				end
				--光龍施法
				if(not CheckBuff(dragon,624248))then
					if(CastSpell(dragon,dragon,850796)==true)then
						DebugMsg(0,room,"dragon cast");
					else
						if(ReadRoleValue(dragon,EM_RoleValue_SpellMagicID)~=850796)then
							Lua_BroadCast_RoomStingTypeColor(room,nuclear.string5);
						end
						DebugMsg(0,room,"dragon fail");
					end
					--CastSpell(rofoonayva,rofoonayva,850801);--測試用
				end
			end
			if(nuclear.passtime==7)then
				Lua_BroadCast_RoomStingTypeColor(room,nuclear.string4);
				local x,y,z,dir=DW_Location(781206,5);--viki的下方
				local ShieldUp=CheckBuff(dragon,624248);
				for i=1,#Global_BellatiaDuplication[room].players,1 do
					local player=Global_BellatiaDuplication[room].players[i].guid;
					if(DW_GetDistance(player,x,y,z)<700)then
						if(GetDistance(player,dragon)>=90)then
							SysCastSpellLv(viki,player,850803,200);
						elseif(not ShieldUp)then
							SysCastSpellLv(viki,player,850803,200);
						else
							DebugMsg(player,room,"you are in shield protect");
						end
					else
						DebugMsg(player,room,"you too far, nuclear can't hit you");
					end
				end
				nuclear.course=false;
				DebugMsg(0,room,"nuclear.course is finish");
			end
		end
		if(heal.course)and(not fury.course)then
			heal.passtime=heal.passtime+1;
			if(heal.passtime==0)then
				AddBuff(saguwait,624250,heal.lv,-1)
				CastSpell(saguwait,rofoonayva,850802);--自動接850797再自動接850798
				WriteRoleValue(saguwait,EM_RoleValue_AttackTargetID,rofoonayva);
				Yell(saguwait,heal.string1,4);
			end
			if(heal.passtime>1)then
				if(CheckBuff(saguwait,624250)==false)then
					DebugMsg(0,room,"success break heal casting");
					MagicInterrupt(saguwait);
					heal.course=false;
				elseif(ReadRoleValue(saguwait,EM_RoleValue_SpellMagicID)~=850797)then
					--盾在，施法結束=完成治療
					CancelBuff_NoEvent(saguwait,624250);
					Lua_BroadCast_RoomStingTypeColor(room,heal.string2);
					heal.course=false;
				end
			end
		end
	end
	--判斷
	if(Phase=="reset")then
		--滅團
		for i,guid in pairs(need_cleared_at_reset)do	
			DelObj(guid);
		end
		for i,guid in pairs(Track)do
			DelObj(guid);
		end
		for i,guid in pairs(guardians)do
			DelObj(guid);
		end
		Lua_BellatiaDuplication_fail();
		Lua_BellatiaDuplication_change_status(room,"standby");--是否需要保留？未知，待穩定後再說
		return;
	end
	--最後階段：表演(維琪炸門，光龍被附身影響)
	
	--處理邦喀雷姆斯
	LockHP(rofoonayva,-10,"");
	if(CheckID(rofoonayva))and(ReadRoleValue(rofoonayva,EM_RoleValue_IsDead)==0)then
		sleep(20);
		KillID(dragon,rofoonayva);
		Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_FINALSTRIKE]", 0, 0);
	end
	
	--清除應刪除物件
	for __,guid in pairs(need_cleared_at_final)do
		DelObj(guid);
	end
	for __,guid in pairs(Track)do
		DelObj(guid);
	end
	for i,guid in pairs(guardians)do
		DelObj(guid);
	end
	
	--邦喀雷姆斯變回人形
	SysCastSpellLv(dragon,dragon,850810,1);
	sleep(30);
	local x,y,z,dir=DW_Location(dragon);
	SetPos(bancremz,x,y,z,dir);
	SetPos(dragon,0,0,0,0);
	StopMove(dragon,false);

	--切換背景音樂
	Lua_BellatiaDuplication_change_music(room,Global_BellatiaDuplication.music.boss1_success);
	
	--維琪台詞：真可惜， 蘿芙娜伊娃被這樣毫無效率的浪費
	Lua_BroadCast_RoomStingTypeColor(room,"[SC_26IN_BOSS1_D]");
	
	--光龍往下一個儲存點前進
	local x,y,z,dir=DW_Location(781206,10);
	Move(bancremz,x,y,z);
	
	sleep(30);
	
	--維琪把門炸開
	local GateAfterBoss1=Global_BellatiaDuplication[room].door_after_boss1.GUID
	Lua_BroadCast_RoomStingTypeColor(room, "[SC_26IN_BOSS1_E]");
	local x,y,z,dir=DW_Location(781206, 11);
	local a=CreateObj(122713, x,y,z,dir, 1);
	WriteRoleValue(a,EM_RoleValue_LiveTime,4);
	SetModeEx(a, EM_SetModeType_Mark, false);
	SetModeEx(a, EM_SetModeType_ShowRoleHead, false);
	AddToPartition(a, room);
	sleep(10);
	PlayMotionEX(GateAfterBoss1, ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP);
	SetDefIdleMotion(GateAfterBoss1,ruFUSION_MIME_ACTIVATE_LOOP);
	SysCastSpellLv(a, a, 494640, 0);
	SysCastSpellLv(a, a, 850860, 0);
	SetModeEx(GateAfterBoss1, EM_SetModeType_Obstruct, false);
	--入口阻擋門也開啟
	SetModeEx(FRONTdoor, EM_SetModeType_Obstruct, false);
	SetModeEx(FRONTdoor, EM_SetModeType_Show, false);
	sleep(30);
	
	--光龍虛弱表演
	StopMove(bancremz,false);
	WriteRoleValue(bancremz, EM_RoleValue_IsWalk, 1);
	SysCastSpellLv(bancremz, bancremz, 493517,0);
	AddBuff(bancremz, 620841, 0, -1);
	sleep(20);
	Yell(bancremz, "[SC_BANCREMZ_AFTERBOSS1_1]", 4);
	local x,y,z,dir=DW_Location(781206,10);
	Move(bancremz,x,y,z);
	sleep(30);
	Yell(bancremz, "[SC_BANCREMZ_AFTERBOSS1_2]", 4);
	sleep(10);
	AddBuff(bancremz, 620801, 0, 6);	
	
	--結束設定
	WriteRoleValue(bancremz, EM_RoleValue_IsWalk, 0);
	DW_UnFight(bancremz,false);
	Lua_BellatiaDuplication_change_status(room,"success");
end
function lua_26in_boss1_tokenRULE(creater)--自動檢查，然後刪除的流程，最後將會移除
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	while(Lua_BellatiaDuplication_check_status(room,"boss"))do
		sleep(10);
	end
	DelObj(OwnerID());--死了script就會停，不用擔心
end
function lua_26in_boss1_tokendead()--小怪死亡劇情，產生反射盾
	local token=OwnerID();
	local room=ReadRoleValue(token,EM_RoleValue_RoomID);
	local x,y,z,dir=DW_Location(token);
	
	local shield=CreateObj(107786,x,y,z,dir,1);
	SetModeEx(shield,EM_SetModeType_ShowRoleHead, false);
	SetModeEx(shield,EM_SetModeType_HideName, true);
	SetModeEx(shield,EM_SetModeType_Fight, false);
	
	WriteRoleValue(shield,EM_RoleValue_LiveTime,12);
	local note=2;
	if(Global_BellatiaDuplication.type=="hard")then note=4;end
	AddBuff(shield,624253,note,-1);--特效(形的外形)
	
	AddToPartition(shield,room);
	SetPlot(shield,"touch","lua_26in_boss1_touch",55);
	SetCursorType(shield,eCursor_Pickup);
	
	SetModeEx(token,EM_SetModeType_Mark,false);
end
function lua_26in_boss1_touch()--反射盾觸碰劇情
	local player,shield=OwnerID(),TargetID();
	if(CheckBuff(player,624253))then
		ScriptMessage(player, player, 1, "[SC_26IN_BOSS1_PICKUP_REPEAT]", 0);
		return false;
	end
	
	SetPlot(shield,"touch","",0);
	BeginCastBarEvent(player,shield,"[SC_26IN_BOSS1_PICKUP]",10,ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END,0,"Lua_26in_boss1_castbarend");
end
function Lua_26in_boss1_castbarend(player,result)--成功拾取反射盾
	local shield=TargetID();
	if(result>0)then
		--成功
		ScriptMessage(player, player, 2, "[SC_26IN_BOSS1_PICKUP_DONE]", 0);
		local note=2;
		if(Global_BellatiaDuplication.type=="hard")then note=4;end
		AddBuff(player, 624253, note, -1);
		DelObj(shield);
	else
		--失敗
		SetPlot(shield,"touch","lua_26in_boss1_touch",55);
		SetCursorType(shield,eCursor_Pickup);
	end
	EndCastBar(player,result);
end
function lua_26in_boss1_bombpuss()--由劇情選取來施展
	local room=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID);
	local num=#Global_BellatiaDuplication[room].players;
	
	local rtable={};
	for i=1,num,1 do
		if(ReadRoleValue(Global_BellatiaDuplication[room].players[i].guid,EM_RoleValue_IsDead)==0)then
			table.insert(rtable,i);
		end
	end
	local bomb_num;
	if(Global_BellatiaDuplication.type=="hard")then
		bomb_num=4;
	else
		bomb_num=2;
	end
	for i=1,100,1 do
		bomb_num=bomb_num-1;
		local r=table.remove(rtable,DW_Rand(#rtable));
		local player=Global_BellatiaDuplication[room].players[r].guid;
		if(GetDistance(OwnerID(),player)<500)then
			PushMagicShootTarget(player);
		else
			bomb_num=bomb_num+1;
		end
		if(bomb_num==0)then return;end
		if(#rtable<=0)then return;end
	end
end