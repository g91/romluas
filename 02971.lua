--781321 旗標  Boss-1 door1-2 door2-3、4-18 裝置
--107836 依拿優茲
--122725 水結晶裝置
--107837 守護水元素
--107838 中控器
function un_zone27Boss5_ctrl()  --控制器
local ctrl = OwnerID()
local ZoneID = ReadRoleValue ( ctrl , EM_RoleValue_ZoneID )
local RoomID = ReadRoleValue( ctrl , EM_RoleValue_RoomID )
local BossNPC = {107836,108166,108169} --Boss1.2.3.Door
local ctrmonster = {122725,122725,122725} 				--水結晶裝置
local timer	= 0											--裝置消失後10秒重生的計時條
local door1 											--前門(戰鬥開關)
local door2 											--後門 (戰鬥結束開啟)
local zone 												--判斷該用哪個zone的table參數
local apparatus = {}									--裝置*2
local CombatBegin = 0 									--開戰旗標
local crazytime = 0 									--狂暴時間
local _goCrazyTime = 480;	--140114 K.J. Aris
if ZoneID == 157 then  zone =1;_goCrazyTime = 480; elseif ZoneID == 158 then zone =2;_goCrazyTime = 360; elseif ZoneID == 159 then zone =3;_goCrazyTime = 999999; end --判斷zone
local Boss = CreateObjByFlag(BossNPC[zone],781321,1,1)
SetModeEx(Boss,EM_SetModeType_Obstruct, false)
Setplot(Boss,"dead","YOYO_Zone27D_Boss3_Start",0)    --丟死亡劇情給BOSS
AddToPartition(Boss,RoomID)                          	--開曾創出Boss
local Sktalk = {"[SC_ZONE27BOSS5_01]","[SC_ZONE27BOSS5_02]","[SC_ZONE27BOSS5_03]","[SC_ZONE27BOSS5_05]"} --開戰、玩家滅團、Boss死亡對話
local x,y,z,dir=DW_Location(781321,3);--開層創出後門
door2=CreateObj(106251,x,y,z,dir,1);
un_zone27boss5_create(door2,3)
AddToPartition(door2,RoomID)
	while 1 do
		sleep(20)
		if hatelistcount(boss)~=0 then                              --開戰
			if CombatBegin==0 then
				CombatBegin=1										--開打了
				ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
				apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --產生裝置的function
				AddBuff(Boss,624573,0,-1)  --幫boss放減傷90%的BUFF
				Callplot(Boss , "un_zone27Boss5_fight" , 0)	
				x,y,z,dir=DW_Location(781321,2);--根據旗子位置
				door1=CreateObj(106251,x,y,z,dir,1);
				un_zone27boss5_create(door1,3)
				AddToPartition(door1,RoomID)
			end	
			if checkID(apparatus[1])== false and checkID(apparatus[2])== false then
				--say(ctrl,"timerrrr = "..timer)
				timer = timer+1
			end
			if timer>=10 then
				ScriptMessage( Boss, -1 , 2 , Sktalk[4] , 2 )
				apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --產生裝置的function
				AddBuff(Boss,624573,0,-1)  --幫boss放減傷90%的BUFF
				timer =0
			end
			if CombatBegin == 1 then
				crazytime = crazytime +1
				if crazytime >= _goCrazyTime then
					Addbuff(Boss,624632,0,-1)
					crazytime = 0
				end
			end
		end	

		if hatelistcount(Boss)==0 and CombatBegin==1 then			--開戰後仇恨表沒人重置戰鬥
			if ReadRoleValue( Boss , EM_RoleValue_IsDead)==0 then
				sleep(10)
				ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
				local mon1 = ReadRoleValue(apparatus[1],EM_RoleValue_register2)
				local mon2 = ReadRoleValue(apparatus[2],EM_RoleValue_register2)
				Delobj(mon1)
				Delobj(mon2)
				Delobj(Boss)  --刪除Boss
				Delobj(door1) --刪除前門
				Delobj(apparatus[1])
				Delobj(apparatus[2])
				sleep(20)
				Boss = CreateObjByFlag(BossNPC[zone],781321,1,1)
				--un_zone27boss5_create(Boss,2)
				--apparatus[1],apparatus[2] = un_zone27boss5_apparatus(ctrmonster[zone],RoomID,Boss)  --產生裝置的function
				Setplot(Boss,"dead","YOYO_Zone27D_Boss3_Start",0)    --丟死亡劇情給BOSS
				AddToPartition(Boss,RoomID) 
				CombatBegin=0										--重置戰鬥
				crazytime = 0
			elseif ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then --Boss死亡
				local mon1 = ReadRoleValue(apparatus[1],EM_RoleValue_register2)
				local mon2 = ReadRoleValue(apparatus[2],EM_RoleValue_register2)
				ScriptMessage( Boss, -1 , 2 , Sktalk[3] , 2 )
				Delobj(mon1)
				Delobj(mon2)
				--Delobj(Boss)  --刪除Boss
				Delobj(door1) --刪除前門
				Delobj(door2) --刪除前門
				Delobj(apparatus[1])
				Delobj(apparatus[2])
				sleep(50)
				break
			end
		end	
	end
end


function un_zone27Boss5_die() --Boss死亡AI
Callplot(OwnerID() , "YOYO_Zone27D_Boss3_Start" , 0)	--執行下一隻Boss
end

function un_zone27Boss5_fight() --Boss戰鬥AI
local Boss = OwnerID()
local timer = 0
local Targ     --boss當前目標
local Sktalk = {"[SC_ZONE27BOSS5_04]","[SC_ZONE27BOSS5_05]"}
	while 1 do
	sleep(10)
	timer = timer +1 
		if timer %13 == 0 then  --25大招
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
				sleep(2)
			end	
			ScriptMessage( Boss, -1 , 2 , Sktalk[1] , 2 )
			CastSpelllv( Boss, Boss,851033 ,0 ) --嗜血水壓	
			--say(Boss,"skill = "..2)
		end
		
		if timer %5 == 0 then  --5小招
			while ReadRoleValue(Boss,EM_RoleValue_SpellMagicID)~=0 do--檢查還有沒有在施法
				sleep(2)
			end	
			--ScriptMessage( Boss, -1 , 2 , Sktalk[2] , 2 )
			Targ=ReadRoleValue(OwnerID(),EM_RoleValue_AttackTargetID)--BOSS的當錢目標
			CastSpelllv( Boss, Targ,851028 ,0 ) --水嘯之息
			--say(Boss,"skill = "..1)
		end
	end
end

function un_zone27boss5_create(X,y) 		   --產生物件時帶入的參數，X是帶入的NPC，Y是想依照的類型
	SetModeEx(x,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
		if y == 3 then
			a = false
			SetModeEx(x,EM_SetModeType_Obstruct,true) ---阻擋
		else
			a = true
		end
	SetModeEx(x,EM_SetModeType_HideName,a)  ---物件頭上是否顯示名稱
	SetModeEx(x,EM_SetModeType_HideMinimap,a)  ---物件是否在小地圖上顯示
	SetModeEx(x,EM_SetModeType_Show,true)  ---顯示
	---------------------------------------------------------------------以上為共用
	local z --判斷參數是多少時為true or false
		if y == 1 then
			z = true
		elseif y == 2 then
			z = false
		end
	SetModeEx(x,EM_SetModeType_Mark,z) ----標記
	SetModeEx(x,EM_SetModeType_Strikback,z) ---反擊
	SetModeEx(x,EM_SetModeType_Move,z) ---移動	
	SetModeEx(x,EM_SetModeType_Fight,z) ---可砍殺
	SetModeEx(x,EM_SetModeType_Searchenemy,z)  ---鎖敵	
end
--================================================================================================================以下為裝置以及元素相關script
function un_zone27boss5_apparatus(ctrmonster,RoomID,Boss)   --守護裝置產生
	local table2 = {}
	table2 = Az_RND_Ary(4,18,2)	--取出兩個1-30不重複數字
	local apparatus_1 = CreateObjByFlag(ctrmonster,781321,table2[1],1) --在兩個不重複的旗標產生裝置
	local apparatus_2 = CreateObjByFlag(ctrmonster,781321,table2[2],1)
	
	un_zone27boss5_create(apparatus_1,2)
	un_zone27boss5_create(apparatus_2,2)
	AddToPartition(apparatus_1,RoomID)
	AddToPartition(apparatus_2,RoomID)
	WriteRoleValue(apparatus_1,EM_RoleValue_PID,Boss)  --將Boss寫入裝置的PID
	WriteRoleValue(apparatus_2,EM_RoleValue_PID,Boss)
	WriteRoleValue(apparatus_1,EM_RoleValue_register1,apparatus_2) --兩個裝置的reg1互相儲存
	WriteRoleValue(apparatus_2,EM_RoleValue_register1,apparatus_1)
	BeginPlot(apparatus_1 , "un_zone27boss5_apparatus_2" , 0)
	BeginPlot(apparatus_2 , "un_zone27boss5_apparatus_2" , 0)
	return apparatus_1,apparatus_2
end
function un_zone27boss5_apparatus_2()  --裝置產生水元素+判斷是否可點取
	local ctrl = OwnerID()
	SetPlot( ctrl,"touch","un_zone27boss5_apparatus_4",30 )
	local ZoneID = ReadRoleValue ( ctrl , EM_RoleValue_ZoneID )
	local RoomID = ReadRoleValue( ctrl , EM_RoleValue_RoomID )
	local ust --另一個裝置
	local zone 	--判斷該用哪個zone的table參數
	local NPC = {107837,108167,108168} --水元素
	if ZoneID == 157 then  zone =1 elseif ZoneID == 158 then zone =2 else zone =3 end --判斷zone
	local monster1 
	--monster1 = Lua_CreateObjToRandownPos(ctrl,NPC[zone],1,50,true) --產生元素
	local x,y,z,dir=DW_Location(ctrl)--根據物件位置
	monster1=CreateObj(NPC[zone],x,y,z,dir,1);
	AddToPartition(monster1,RoomID)
	un_zone27boss5_create(monster1,1)
	SetModeEx(monster1,EM_SetModeType_Obstruct,false)
	WriteRoleValue(ctrl,EM_RoleValue_register2,monster1) --reg2寫入元素怪
	local timer = 0 --判斷元素是否死亡的時間
	local monster2 --另一隻水元素
	while 1 do
		sleep(10)
		--**************元素有沒有死的判斷
		ust = ReadRoleValue(ctrl,EM_RoleValue_register1)
		monster2 = ReadRoleValue(ust,EM_RoleValue_register2) --另一隻水元素
		--say(monster2,"hihi")
		--say(ust,"hihihihi")
		if CheckID(monster1) == false or ReadRoleValue(monster1,EM_RoleValue_IsDead)==1 then
			if CheckID(monster2) == false or ReadRoleValue(monster2,EM_RoleValue_IsDead)==1 then
				
				SetModeEx(ctrl,EM_SetModeType_Mark,true) --水元素都死所以解開讓裝置可以被點擊
			else
				timer = timer +1
				--say(ctrl,"time = "..timer)
			end
		end
		if timer >=10 then  --5秒內沒打死兩隻水元素，所以重生
			timer =0
			x,y,z,dir=DW_Location(ctrl)--根據物件位置
			monster1=CreateObj(NPC[zone],x,y,z,dir,1);
			AddToPartition(monster1,RoomID)
			un_zone27boss5_create(monster1,1)
			WriteRoleValue(ctrl,EM_RoleValue_register2,monster1) --reg2寫入元素怪
		end
		--**************
	end
end

--==================================================================裝置點擊以後取消Boss的BUFF

function un_zone27boss5_apparatus_4() 
	BeginCastBarEvent( OwnerID(), TargetID(), "[SC_UNWARM_11]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "un_zone27boss5_apparatus_5" )
end
function un_zone27boss5_apparatus_5(Obj,CheckResult)  --點擊執行的事情
	local tar = TargetID()
	local Boss = ReadRoleValue(tar,EM_RoleValue_PID)  --Boss
	local apparatus = ReadRoleValue(tar,EM_RoleValue_register1) --另一個裝置
	if CheckID(Boss) == true and (CheckID(apparatus) == false or ReadRoleValue( apparatus , EM_RoleValue_IsDead)==1) then  --Boss活著或是另一個裝置死了或消失就執行
		CancelBuff(Boss, 624573 ) 
	end
	Delobj(tar)
	EndCastBar( OwnerID(), CheckResult ) 
end
--===================================================================

function un_851031() --凝聚之水
local own = OwnerID()
local tar = TargetID()
	if own == tar then
		return false
	else
		return true
	end
end