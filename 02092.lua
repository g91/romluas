function ic_104622_01()   ------主控器
	local Ctrl = OwnerID()					--控制器
	local open=0						    --開戰旗標				        
	--local killidtime=0
	local luck=0							---生水晶用
	local luck1=0							---生水晶用
	local luck2=0							---生水晶用
	local luck3=0							---生水晶用
	local time1=0							---放技能						
	local time4=0
	local mob1
	local mob2
	local mob3
	local RoomID=ReadRoleValue(Ctrl,EM_RoleValue_RoomID)
	local BOSS9898=0
	local timeXX=0
	local Boss1
	local Boss100
	Boss1=Lua_DW_CreateObj("flag",104693,780763,1,0)---放法術用
	SetModeEx( Boss1  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( Boss1  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( Boss1  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( Boss1  , EM_SetModeType_Mark, false )--標記
	SetModeEx( Boss1  , EM_SetModeType_Move, false )--移動
	SetModeEx( Boss1  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( Boss1  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( Boss1  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition(Boss1,RoomID)
	CastSpellLv( Boss1 , Boss1 , 496327 , 0 )
	sleep(30)
	DelObj(boss1)
	local Boss=CreateObjByFlag(104622,780763,1,1) 	-----BOSS創在  旗標1
	AddToPartition(Boss,RoomID)
	SetPlot( Boss,"dead","un_zone190_boss4",0 )
	WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
	while true do
		timeXX=ReadRoleValue(Ctrl,EM_RoleValue_register3)
		BOSS9898=ReadRoleValue(Ctrl,EM_RoleValue_register10)		
		sleep(10)
		--say(OwnerID(),"BOSS9898"..BOSS9898)
		if BOSS9898==1 then 
			local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621  or ID2==104693 then
					DelObj(ID)
					end
				end
				DelObj(boss)                                        --沒死自己殺死王
				sleep(30)                                           --5秒
				Boss=CreateObjByFlag(104622,780763,1,1)           --再創造1之				
				AddToPartition(Boss,RoomID)	                                ---創造王 必要		
				SetPlot( Boss,"dead","un_zone190_boss4",0 )	
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register10,0)
				open=0					--重置戰鬥
				time1=0
				time4=0
				killidtime=0
		end
		if timeXX==2 then	-----時間到刪除 BOSS用
			local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621 or ID2==104693 then
					DelObj(ID)
					end
				end
				DelObj(boss)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				break
		end
		if hatelistcount(boss)~=0 then    		---讀仇恨人數
			Boss100=Lua_DW_CreateObj("flag",104693,780763,1,0)--測試距離用
			SetModeEx( Boss100  , EM_SetModeType_HideName, false )--名稱
			SetModeEX( Boss100  , EM_SetModeType_Gravity , false )--重力
			SetModeEx( Boss100  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
			SetModeEx( Boss100  , EM_SetModeType_Mark, false )--標記
			SetModeEx( Boss100  , EM_SetModeType_Move, false )--移動
			SetModeEx( Boss100  , EM_SetModeType_Searchenemy, false )--索敵
			SetModeEx( Boss100  , EM_SetModeType_Fight , false )--可砍殺攻擊
			SetModeEx( Boss100  , EM_SetModeType_Strikback, false )--反擊	
			
			AddToPartition(Boss100,RoomID)
			WriteRoleValue(Boss100,EM_RoleValue_PID,Ctrl)
			WriteRoleValue(Boss100,EM_RoleValue_register1,Boss)
			BeginPlot(Boss100 , "ic_104622_100" , 0)---測試距離
			WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)   --暫存口袋 1 BOSS=ctrl
			WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
			--killidtime=killidtime+1
			time1=time1+1
			time4= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
			---say(OwnerID(),"killidtime"..killidtime)
			if time4>=1 then
				time4=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)---把口袋5歸0
				Luck=DW_Rand(7)
				Luck1=Luck+10												---從11開始
				Luck2=Luck1+1
				Luck3=Luck1+2
				sleep(50)
				---ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_01]" , 2 )
				mob1=CreateObjByFlag(104621,780763,Luck1,1)---水晶1
					SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx(mob1 , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
					SetModeEx( mob1 , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
					SetModeEx( mob1 , EM_SetModeType_Searchenemy, true)--索敵(是)
					SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob1 , EM_SetModeType_Move, false) ---移動
					SetModeEx( mob1 , EM_SetModeType_Mark, true)
					SetModeEx( mob1 , EM_SetModeType_Fight, true)
					SetModeEx( mob1 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob1 , EM_SetModeType_Strikback, true)	---索敵(否)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck1)
					AddToPartition(mob1,RoomID)
					SetPlot( mob1,"dead","ic_104622_07",0 )  
					WriteRoleValue(mob1,EM_RoleValue_PID,boss)
				BeginPlot(mob1 , "ic_104622_03" , 0)					---水晶AI
				mob2=CreateObjByFlag(104621,780763,Luck2,1)---水晶2
					SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx(mob2 , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
					SetModeEx( mob2 , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
					SetModeEx( mob2 , EM_SetModeType_Searchenemy, true)--索敵(是)
					SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob2 , EM_SetModeType_Move, false) ---移動
					SetModeEx( mob2 , EM_SetModeType_Mark, true)
					SetModeEx( mob2 , EM_SetModeType_Fight, true)
					SetModeEx( mob2 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob2 , EM_SetModeType_Strikback, true)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck2)
					AddToPartition(mob2,RoomID)
					SetPlot( mob2,"dead","ic_104622_07",0 ) 
					WriteRoleValue(mob2,EM_RoleValue_PID,boss)
				BeginPlot(mob2 , "ic_104622_03" , 0)					---水晶AI
				mob3=CreateObjByFlag(104621,780763,Luck3,1)---水晶3
					SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, true) ---物件不會被搜尋
					SetModeEx(mob3 , EM_SetModeType_HideName, true)  ---物件頭上是否顯示名稱
					SetModeEx( mob3 , EM_SetModeType_HideMinimap, true)  ---物件是否在小地圖上顯示
					SetModeEx( mob3 , EM_SetModeType_Searchenemy, true)--索敵(是)
					SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)
					SetModeEx( mob3 , EM_SetModeType_Move, false) ---移動
					SetModeEx( mob3 , EM_SetModeType_Mark, true)
					SetModeEx( mob3 , EM_SetModeType_Fight, true)
					SetModeEx( mob3 , EM_SetModeType_ShowRoleHead, true)
					SetModeEx( mob3 , EM_SetModeType_Strikback, true)
					WriteRoleValue(OwnerID(),EM_RoleValue_register4,Luck3)
					AddToPartition(mob3,RoomID)
					SetPlot( mob3,"dead","ic_104622_07",0 )  
					WriteRoleValue(mob3,EM_RoleValue_PID,boss)
				BeginPlot(mob3 , "ic_104622_03" , 0)					---水晶AI
				time4=0
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
			end
			if time1>=5 then
				WriteRoleValue(boss,EM_RoleValue_register9,1)---回傳1給BOSS
				time1=0
			end
			--if killidtime>=480 then
				--WriteRoleValue(boss,EM_RoleValue_register8,1)---回傳1給BOSS
				--killidtime=0
			--end
			if open==0 then
				open=1										--開打了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_01]" , 2 )	-------守衛~守衛~人呢? 看來需要我親自上場了~
				BeginPlot(boss , "ic_104622_02" , 0)				------命令角色做事情
			end
		end	
		if hatelistcount(boss)==0 and open==1 then			--開戰後仇恨表沒人
			if ReadRoleValue( boss , EM_RoleValue_IsDead)==0 then   --王沒死 玩家滅團
				--local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				--local ID=GetSearchResult()
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--for i = 0 , NPCXX do
				--	ID=GetSearchResult()
				--	ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--	if ID2==104621  or ID2==104693 then
				--	DelObj(ID)
				--	end
				--end
				sleep(150)
				DelObj(boss)                                        --沒死自己殺死王
				sleep(30)                                           --5秒
				Boss=CreateObjByFlag(104622,780763,1,1)           --再創造1之				
				AddToPartition(Boss,RoomID)	                                ---創造王 必要				
				WriteRoleValue(Ctrl,EM_RoleValue_PID,Boss)
				WriteRoleValue(Boss,EM_RoleValue_PID,Ctrl)
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				open=0					--重置戰鬥
				time1=0
				time4=0
				killidtime=0
			elseif	ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---王死了
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_02]" , 2 )----怎麼可能....我會被打敗...我會再回來的...--死亡
				--local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				--local ID=GetSearchResult()
				--local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				--for i = 0 , NPCXX do
				--	ID=GetSearchResult()
				--	ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
				--	if ID2==104621 or ID2==104693   then
				--	DelObj(ID)
				--	end
				--end
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---把口袋3歸1
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				open=0										--重置戰鬥
				time1=0
				time4=0
				killidtime=0
			end				
		end	
		if ReadRoleValue( boss , EM_RoleValue_IsDead)==1 then---無敵殺了王
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_02]" , 2 )----怎麼可能....我會被打敗...我會再回來的...---死亡
				local NPCXX = SetSearchAllNPC(RoomID )---掃區域找NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
				for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					--say(OwnerID(),"NPCXX"..NPCXX)
					if ID2==104621  or ID2==104693  then
					DelObj(ID)
					end
				end
				WriteRoleValue(OwnerID(),EM_RoleValue_register5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,1)---把口袋3歸1
				BeginPlot(OwnerID() , "ic_104622_04" , 0)
				open=0	
				time1=0
				time4=0		
				killidtime=0
				break	
		end	
	end		
end  
function ic_104622_02()    ------王AI
	local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Boss=OwnerID()
	local time2=0 	----計時器
	local play1x={} 
	local plays=0
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) 
	--local killidtime1 =0---狂暴用
	local time3 =0---技能用
	while 1 do
		Sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )   ------ 找尋目前的攻擊目標
		local BossTarget=AttackTarget
		--killidtime1= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		time3= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		--say(OwnerID(),"time3"..time3)
		if time3==1 then---5秒1次範圍技能
			CastSpellLV( OwnerID() , Boss , 496322,11)
			time3=0
		WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---把口袋9歸0
		end
		--if killidtime1>=1 then
			--AddBuff( OwnerID(),507663,0 ,-1 )
			--killidtime1=0
			--WriteRoleValue(OwnerID(),EM_RoleValue_register8,0)---把口袋8歸0
			--sleep(600)
		--end
		time2=time2+1
			---say(OwnerID(),"time"..time4)
		if time2==7 or time2==14 then ---單體技能
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				CastSpellLV( OwnerID() , BossTarget , 496323 , 160)
		elseif time2==20 then ---隨機3人毒BUFF
				while 	ReadRoleValue(OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
					sleep(10)
				end
				CastSpellLV( OwnerID(),Boss , 496324, 5 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_104622_03]" , 2 )---感受一下劇毒的力量
				WriteRoleValue(Ctrl,EM_RoleValue_register5,1)---回傳1給控制器
				time2=0	
		end
	end
end

function ic_104622_03()----水晶AI
local boss=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local time10=0
local X0=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
local Y0=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
local Z0=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
local mob11		
	while true do
	---say(OwnerID(),"1")
	X0=ReadRoleValue(OwnerID() ,EM_RoleValue_X)
	Y0=ReadRoleValue(OwnerID() ,EM_RoleValue_Y)
	Z0=ReadRoleValue(OwnerID() ,EM_RoleValue_Z)
		sleep(10)
		time10=time10+1
		if time10>=10 and time10<=12 then
		time10=30
		SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺(否)
		CastSpellLV( OwnerID() ,boss, 496325,0)
		mob11=CreateObj(104693,X0,Y0,Z0,0,1)-------生隱形球 
		SetModeEx( mob11  , EM_SetModeType_HideName, false )--名稱
		SetModeEX( mob11  , EM_SetModeType_Gravity , false )--重力
		SetModeEx( mob11  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
		SetModeEx( mob11  , EM_SetModeType_Mark, false )--標記
		SetModeEx( mob11  , EM_SetModeType_Move, false )--移動
		SetModeEx( mob11  , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( mob11  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( mob11  , EM_SetModeType_Strikback, false )--反擊	
		AddToPartition(mob11,RoomID)
		CastSpellLv( mob11 , mob11 , 496326 , 0 )
		sleep(40)
		DelObj(mob11)
		DelObj(OwnerID())
		end
	end	
end
function ic_104622_04()----刪除BUFF用
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----找區域所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--檢查玩家是不是還在；檢查是否死亡
				if CheckBuff( ThesePlayer[i] , 507816 ) == true then
					CancelBuff(ThesePlayer[i], 507816)
				end
				if CheckBuff( ThesePlayer[i] , 507819 ) == true then
					CancelBuff(ThesePlayer[i], 507819)
				end
		end					
	end
end
function ic_104622_07()
local Room = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )			----讀在哪一層
local mob10 = star_CreateObj_NoAdd( OwnerID() , 104693 , 0 , 0 , 0 , Room , 0 ) 			----小怪死掉生球
local poison = 496326					----水晶AE
	SetModeEx( mob10  , EM_SetModeType_HideName, false )--名稱
	SetModeEX( mob10  , EM_SetModeType_Gravity , false )--重力
	SetModeEx( mob10  , EM_SetModeType_ShowRoleHead, false )--不秀頭像框
	SetModeEx( mob10  , EM_SetModeType_Mark, false )--標記
	SetModeEx( mob10  , EM_SetModeType_Move, false )--移動
	SetModeEx( mob10  , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( mob10  , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( mob10  , EM_SetModeType_Strikback, false )--反擊	
	AddToPartition( mob10 , Room )
	WriteRoleValue( mob10, EM_RoleValue_Livetime, 5)				--存在秒數
	CastSpellLv( mob10 , mob10 , poison , 0 )
	sleep(50)
	DelObj(OwnerID())
end
function ic_104622_100()---測試用
local Ctrl=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local Boss=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local BOSS9898=GetDistance( OwnerID(), Boss)
	while true do
		BOSS9898=GetDistance( OwnerID(), Boss)
		sleep(10)
		--say(OwnerID(),"BOSS9898="..BOSS9898)
		if  BOSS9898>=580 then
			WriteRoleValue(Ctrl,EM_RoleValue_register10,1)
		end
	end
end
function ic_104622_100_1()	---坦克包
--GiveBodyItem( OwnerID(), 725596, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725596 , 1 } } ----725596掉落表號碼
return BaseTressureProc(   itemset , 1 ) -- 1  是需求背包空?
end
function ic_104622_100_2()	---鎖甲包
--GiveBodyItem( OwnerID(), 725602, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725602 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  是需求背包空?
end
function ic_104622_100_3()	---皮甲包
--GiveBodyItem( OwnerID(), 725603, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725603 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  是需求背包空?
end
function ic_104622_100_4()	---布衣包
--GiveBodyItem( OwnerID(), 725604, 1 )
local RoleName = GetName( OwnerID() ) 
local itemset = { 100 , "" , { 725604 , 1 } }
return BaseTressureProc(   itemset , 1 ) -- 1  是需求背包空?
end