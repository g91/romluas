function LuaQ_dr424295_01()									--檢查有無鬼
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,100)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118490 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own, own , 2 ,"[SC_424295_01]" , 2 )						--此處沒有找尋到靈魂的波動	
		return false
	end
end





function LuaQ_dr424295_02()									--找鬼
	local own=OwnerID()
	local tar = TargetID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)			
	local ownX=ReadRoleValue(own,EM_RoleValue_X)
	local ownY=ReadRoleValue(own,EM_RoleValue_Y)
	local ownZ=ReadRoleValue(own,EM_RoleValue_Z)
	local ownDir=ReadRoleValue(own,EM_RoleValue_Dir)
	local Btable={}
	Btable=SearchRangeNPC(own,100)								--搜尋自身100範圍
	castspell(own,own,497927)
	if CheckAcceptQuest(own,424295)==true and							--有此任務
		CheckCompleteQuest(own,424295) ~=true then						--並且未完成
			for i = 0,table.getn(Btable),1 do
				local X=ReadRoleValue(Btable[i],EM_RoleValue_OrgID)
				if X==118490 then
					local ghost=CreateObj(105671,ownX+50,ownY-5,ownZ+0,ownDir+0,1)
					npcsay(ghost,"[SC_424295_02]")
					SetModeEx(ghost,EM_SetModeType_Mark,true)
					SetModeEx(ghost,EM_SetModeType_Strikback,true)      		--反擊
					SetModeEx(ghost,EM_SetModeType_HideName,true)     		--物件頭上是否顯示名稱
					SetModeEx(ghost,EM_SetModeType_Searchenemy,true)		--鎖敵
					SetModeEx(ghost,EM_SetModeType_Fight,true)			--會戰鬥
					AddToPartition(ghost,RoomID)                        			--顯現出ghost再這個zone，配合LuaFunc_CreateObjByObj用
					SetAttack(ghost,own)
					WriteRoleValue(ghost,EM_RoleValue_register1,own)
					CallPlot(ghost,"LuaQ_dr424295_03",ghost)
				end
			end
	end
end

function LuaQ_dr424295_03(ghost)	
	while true do
		sleep(50)
		if  CheckID(ghost)~=0 or CheckID(ghost)~=nil then
			if HateListCount( ghost) == 0   then
			DelObj(ghost)
			end
		end
	end
end
--====================================================================
function LuaQ_dr424296_01()									--檢查是否位於噬骨者出沒地
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,50)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118492 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own,  own , 2 ,"[SC_424296_02]" , 2 )						--這裡不是噬骨者常出沒的地方	
		return false
	end
end





function LuaQ_dr424296_02()									--給噬骨者死老鼠
	local own=OwnerID()
	local tar = TargetID()
	local Btable={}
	Btable=SearchRangeNPC(own,50)
	if CheckAcceptQuest(own,424296)==true and
		CheckCompleteQuest(own,424296) ~=true then
			for i = 0,table.getn(Btable),1 do
				local X=ReadRoleValue(Btable[i],EM_RoleValue_OrgID)
				if X==118492 then
				AddBuff(own,620317,0,30)
				BeginPlot(own,"LuaQ_dr424296_03",0)
				CallPlot(Btable[i],"LuaQ_dr424296_05",Btable[i])
				Hide(Btable[i])
				end
			end
	end
end

function LuaQ_dr424296_03()									--表演
	local tar=TargetID()
	local dog = Lua_DW_CreateObj( "flag" , 105756 , 780950 , 2 , 1 , 1 )
	SetModeEx(dog,EM_SetModeType_Mark,false)
	SetModeEx(dog,EM_SetModeType_Strikback,false)      						--反擊
	SetModeEx(dog,EM_SetModeType_HideName,false)        						--物件頭上是否顯示名稱
	SetModeEx(dog,EM_SetModeType_Searchenemy,false)    						--鎖敵
	SetModeEx(dog,EM_SetModeType_Fight,true)							--會戰鬥
	sleep(20)
	DW_MoveDirectToFlag( dog , 780950 , 3 , 1  )
	sleep(40)
	PlayMotion( dog, 164)
	sleep(20)
	DW_MoveDirectToFlag( dog , 780950 , 4 , 1  )
	local deadman = Lua_DW_CreateObj( "flag" , 105757 , 780950 , 5 , 1 , 1 )
	SetModeEx(deadman,EM_SetModeType_Mark,false)
	SetModeEx(deadman,EM_SetModeType_Strikback,false)      						--反擊
	SetModeEx(deadman,EM_SetModeType_HideName,false)        					--物件頭上是否顯示名稱
	SetModeEx(deadman,EM_SetModeType_Searchenemy,false)    					--鎖敵
	SetModeEx(deadman,EM_SetModeType_Fight,true)						--會戰鬥
	WriteRoleValue(deadman,EM_RoleValue_Register9,OwnerID())
	sleep(50)
	DW_MoveDirectToFlag( deadman , 780950 , 6 , 1  )
	PlayMotion( deadman, 37)
	CastSpell(deadman, dog, 497674 )
	PlayMotion( dog, 164)
	Sleep(30)
	Yell(deadman,"[SC_424296_01]",2)
	PlayMotion( deadman, 37)
	PlayMotion( dog, 145)
	DelObj(dog)
	CallPlot(deadman,"LuaQ_dr424296_04",deadman)
	sleep(30)
	DelObj(deadman)
end

function LuaQ_dr424296_04(deadman)
	local roomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local box=LuaFunc_CreateObjByObj (118891,deadman)
	local guest=ReadRoleValue(deadman,EM_RoleValue_Register9)
	CallPlot(box,"LuaQ_dr424296_06",box)
	WriteRoleValue(box,EM_RoleValue_Register9,guest)
	SetModeEx(box,EM_SetModeType_Show,false)
	SetModeEx(box,EM_SetModeType_Mark,false)
	SetModeEx(box,EM_SetModeType_Strikback,false)      						--反擊
	SetModeEx(box,EM_SetModeType_HideName,false)
	AddToPartition(box,roomID)
	sleep(20)
	DelObj(box)

end

function LuaQ_dr424296_05(obj)
	local tar=TargetID()
	sleep(300)
	Show(obj,0)
end


function LuaQ_dr424296_06(box)
	local guest=ReadRoleValue(box,EM_RoleValue_Register9)
		if CheckAcceptQuest(guest,424296)==true and
		   CheckBuff(guest,620317)==true then
			if	CheckDistance(box,guest,150)==true then
			  	 SetFlag(guest,545080,1)
			else
			  	ScriptMessage(guest,guest,1,"[SC_423177_10][SAY_420635_1]",0)
			end
		end
end
--====================================================================

function LuaQ_dr424315_0()										--白色的記念(判斷是否在河邊
	local own = OwnerID()
	local Atable=SearchRangeNPC(own,30)
	local B = 0
	for i = 0,table.getn(Atable),1 do
		local X=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if X==118530 then
			B=B+1
		end
		if B ~=0 then
			return true
		else
			ScriptMessage( own,own, 2 ,"[SC_424315_01]" , 2 )				--這裏還不夠靠近河邊
			return false
		end
	end
end



function LuaQ_dr424315_1()										--白色的記念(灑花)
	local own = OwnerID()
	local Atable=SearchRangeNPC(own,30)
	local B = 0
	for i = 0,table.getn(Atable),1 do
		local X=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if X==118530 then
		PlayMotion( own, 75)
		ScriptMessage( own, own , 2 ,"[SC_424315_02]" , 2 )
		BeginPlot(own,"LuaQ_dr424315_2",40)
		end
	end
end

function LuaQ_dr424315_2()										--give keyitem
	local own = OwnerID()
	GiveBodyItem(own,545134,1)
end

--============================================================

function LuaQ_dr424294_3()										--監獄守衛專用，銅牆鐵屁
	local own=OwnerID()
	SetPlot( own,"range","LuaQ_dr424294_3_1",65 )
end


function LuaQ_dr424294_3_1()
	local own=OwnerID()
	local obj = TargetID()
	local searchA=SearchRangePlayer(own,65)
	local Atime=0
		sleep(20)
		if CheckBuff(own,620027)==false then
		    SetPos( own, 473.9, -257, 348.9 , 1 ) 
			say(obj,"go back")
		end

end
--============================================================
function LuaQ_dr424308_4()--接任務後的表演，引導玩家方向，接任務順便清BUFF，避免放棄任務重接的玩家不會出怪
	local Npc = OwnerID()
	local Player = TargetID()
	local QMonster = nil
	if ReadRoleValue( Npc, EM_RoleValue_Register1 ) == 0 then
		WriteRoleValue( Npc, EM_RoleValue_Register1, 1 )
		QMonster = Lua_DW_CreateObj( "flag" ,118310,  780964 , 12 , 1 , 1 )
		DW_MoveDirectToFlag( QMonster, 780964 , 13, 1 )
		Yell( QMonster,"[SAY_110341_3]", 3 ) 
		Sleep( 40 )
		DelObj( QMonster )
		WriteRoleValue( Npc, EM_RoleValue_Register1, 0 )
	end
	return
end
function LuaQ_dr424308_0()--追擊任務生怪用第一波
	local Ctrl = OwnerID()--中控器
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 1 )--Ctrl編號#1
	local Abox = Lua_DW_CreateObj( "flag", 118614, 780964, 0, 1, 1 )--在旗標位置產生箱子A
	local Bbox = Lua_DW_CreateObj( "flag", 118614, 780964, 1, 1, 1 )--在旗標位置產生箱子B
	SetModeEx( Abox, EM_SetModeType_Mark, false )--關閉A箱標記
	SetModeEx( Bbox, EM_SetModeType_Mark, false )--關閉B箱標記
	SetPlot( Ctrl , "range","LuaQ_dr424308_1" , 70 )--產生範圍劇情
end
function LuaQ_dr424308_1()--判斷玩家是否符合資格
	local Player = OwnerID()
	local Ctrl = TargetID()
	SetPlot( Ctrl, "range", "", 0 )
	if ( CheckAcceptQuest( Player ,424308 ) == true and CheckCompleteQuest( Player ,424308 ) == false ) then
		CallPlot( Ctrl , "LuaQ_dr424308_1_Start", Player )--並讓中控器跑FUNCTION，避免有Sleep的劇情在玩家身上。
		return
	end
	SetPlot( Ctrl, "range", "LuaQ_dr424308_1", 70 )
end
function LuaQ_dr424308_1_Start( Player )--當符合條件才觸發
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID )
	local EMonster = nil--E怪大臣		
	local Monster = {}
	for i = 1, 2, 1 do
		Monster[ i ] = Lua_DW_CreateObj( "flag" , 105755, 780964 , i+1, 1, 1 )--怪物
		AddBuff( Monster[ i ], 620029, 0, 10 )--出場特效
		NpcSay( Monster[ i ], "[SC_424308_01]")
		SetAttack( Monster[ i ], Player )
		sysCastSpellLv ( Player, Monster[ i ], 496930, 1 )
		AddToPartition( Monster[ i ], RoomID) 
	end
	CallPlot( Ctrl, "LuaQ_dr424308_fight", Monster[ 1 ], Monster[ 2 ] )--判斷怪物有沒有在打人，沒有仇恨就砍掉
	EMonster = Lua_DW_CreateObj( "flag" ,118310, 780964, 8, 1, 1 )
	DW_MoveDirectToFlag( EMonster, 780964, 9, 1 )
	say( EMonster,"[SC_423032_2]")
	Sleep( 50 )
	DelObj( EMonster )
end
function LuaQ_dr424308_fight( Npc1, Npc2 )--怪物在3秒內沒有進入戰鬥就會消失
	local Ctrl = OwnerID()--中控器
	local CtrlID = ReadRoleValue( Ctrl, EM_RoleValue_Register1 )--Ctrl編號
	local MonsterStatus = 0
	local Monster = {}
	Monster[ 1 ] = Npc1
	Monster[ 2 ] = Npc2
	while true do
		Sleep( 20 )
		for i = 1, #Monster, 1 do
			if CheckID( Monster[ i ] ) == true then
				if ( ReadRoleValue( Monster[ i ], EM_RoleValue_AttackTargetID ) ~= 0 and
				CheckDistance( Ctrl, Monster[ i ], 300 ) == true ) then
					MonsterStatus = MonsterStatus + 1
				else
					StopMove( Monster[ i ], false )
					DelObj( Monster[ i ] )				
				end		
			end
		end
		if MonsterStatus == 0 then
			Sleep( 100 )--事件重置時間
			if CtrlID == 1 then
				SetPlot( Ctrl, "range", "LuaQ_dr424308_1", 70 )
			else
				SetPlot( Ctrl, "range", "LuaQ_dr424308_3", 70 )
			end
			return
		end
		MonsterStatus = 0
	end
end
-----------------------------------------------------------------------------------------------------------------------------
function LuaQ_dr424308_2()--追擊任務生怪用第二波
	local Ctrl = OwnerID()--中控器
	WriteRoleValue( Ctrl, EM_RoleValue_Register1, 2 )--Ctrl編號#2
	local Cbox = Lua_DW_CreateObj( "flag", 118614, 780964, 4, 1, 1 )--在旗標位置產生箱子A
	local Dbox = Lua_DW_CreateObj( "flag", 118614, 780964, 5, 1, 1 )--在旗標位置產生箱子B
	SetModeEx( Cbox, EM_SetModeType_Mark, false )--關閉A箱標記
	SetModeEx( Dbox, EM_SetModeType_Mark, false )--關閉B箱標記
	SetPlot( Ctrl, "range","LuaQ_dr424308_3" , 70 )--產生範圍劇情
end
function LuaQ_dr424308_3()
	local Player = OwnerID()
	local Ctrl = TargetID()
	SetPlot( Ctrl ,"range","", 0 )
	if ( CheckAcceptQuest( Player ,424308 ) == true and CheckCompleteQuest( Player ,424308 ) == false ) then
		CallPlot( Ctrl , "LuaQ_dr424308_3_Start", Player )--並讓中控器跑FUNCTION，避免有Sleep的劇情在玩家身上。
		return
	end
	SetPlot( Ctrl, "range", "LuaQ_dr424308_3", 70 )
end
function LuaQ_dr424308_3_Start( Player )
	local Ctrl = OwnerID()
	local RoomID = ReadRoleValue( Ctrl,EM_RoleValue_RoomID )
	local EMonster = nil--E怪大臣		
	local Monster = {}
	for i = 1, 2, 1 do
		Monster[ i ] = Lua_DW_CreateObj( "flag", 105755, 780964 , i+5, 1, 1 )--怪物
		AddBuff( Monster[ i ], 620029, 0, 10 )--出場特效
		NpcSay( Monster[ i ], "[SC_424308_01]")
		SetAttack( Monster[ i ], Player )
		sysCastSpellLv ( Player, Monster[ i ], 496930, 0 )  
		AddToPartition( Monster[ i ], RoomID )
	end
	CallPlot( Ctrl,"LuaQ_dr424308_fight", Monster[ 1 ], Monster[ 2 ] )--判斷怪物有沒有在打人，沒有仇恨就砍掉
	EMonster = Lua_DW_CreateObj( "flag" ,118310, 780964, 10, 1, 1 )
	DW_MoveDirectToFlag( EMonster, 780964, 11, 1 )
	say( EMonster,"[SC_423032_2]")
	Sleep( 50 )
	DelObj( EMonster )
end
----============================================================
--任務解除禁錮424305--禁錮者用
function LuaQ_dr424305_0()									--在禁錮者的四周產生4根結界火把
	local own=OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)			
	local ownX=ReadRoleValue(own,EM_RoleValue_X)
	local ownY=ReadRoleValue(own,EM_RoleValue_Y)
	local ownZ=ReadRoleValue(own,EM_RoleValue_Z)
	local ownDir=ReadRoleValue(own,EM_RoleValue_Dir)
	local Alight=CreateObj(118623,ownX+20,ownY-5,ownZ+20,ownDir+0,1)
	local Blight=CreateObj(118623,ownX+20,ownY-5,ownZ-20,ownDir+90,1)
	local Clight=CreateObj(118623,ownX-20,ownY-5,ownZ-20,ownDir+180,1)                     
	local Dlight=CreateObj(118623,ownX-20,ownY-5,ownZ+20,ownDir+270,1)
		SetModeEx(Alight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Blight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Clight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(Dlight,EM_SetModeType_ShowRoleHead,false) 
		SetModeEx(own,EM_SetModeType_Searchenemy,false)    				--不鎖敵，不會去追怪
		SetModeEx(own,EM_SetModeType_Fight,false)					--不可砍殺
		AddToPartition(Alight,RoomID)    
		WriteRoleValue(own,EM_RoleValue_Register1,Alight)				--將A燈值記錄在怪上，利用怪當控制器
		WriteRoleValue(own,EM_RoleValue_Register2,1)					--Register2，專給A燈判斷用
		WriteRoleValue(Alight,EM_RoleValue_Register1,own)				--將各燈的Register1記錄禁錮者
		AddToPartition(Blight,RoomID) 		    
		WriteRoleValue(own,EM_RoleValue_Register3,Blight)
		WriteRoleValue(own,EM_RoleValue_Register4,1)					--Register4，專給B燈判斷用
		WriteRoleValue(Blight,EM_RoleValue_Register1,own)
		AddToPartition(Clight,RoomID)   		
		WriteRoleValue(own,EM_RoleValue_Register5,Clight)
		WriteRoleValue(own,EM_RoleValue_Register6,1)					--Register6，專給C燈判斷用
		WriteRoleValue(Clight,EM_RoleValue_Register1,own)
		AddToPartition(Dlight,RoomID)		     
		WriteRoleValue(own,EM_RoleValue_Register7,Dlight)       		
		WriteRoleValue(own,EM_RoleValue_Register8,1)					--Register8，專給D燈判斷用
		WriteRoleValue(Dlight,EM_RoleValue_Register1,own)
	SetPlot( Alight,"touch","LuaQ_dr424305_2",30 )
	SetPlot( Blight,"touch","LuaQ_dr424305_3",30 )
	SetPlot( Clight,"touch","LuaQ_dr424305_4",30 )
	SetPlot( Dlight,"touch","LuaQ_dr424305_5",30 )
		while 1 do
			Sleep(20)
			if  ReadRoleValue(own,EM_RoleValue_Register2)==2 and			--當ABCD燈的判斷值均為2時怪可砍殺、會索敵
			    ReadRoleValue(own,EM_RoleValue_Register4)==2 and
			    ReadRoleValue(own,EM_RoleValue_Register6)==2 and
			    ReadRoleValue(own,EM_RoleValue_Register8)==2  then
				SetModeEx(own,EM_SetModeType_Searchenemy,true)    		--鎖敵，會去追怪
				SetModeEx(own,EM_SetModeType_Fight,true)			--可砍殺
				CallPlot(Alight,"LuaQ_dr424305_1",own,Blight,Clight,Dlight)	--當怪死後用來刪除火把
				return
			end
		end
end

function LuaQ_dr424305_1(own,Blight,Clight,Dlight)						--利用A燈來清除火把
	sleep(30)
	while 1 do
		Sleep(20)
			if    ReadRoleValue(own,EM_RoleValue_IsDead)==1 
			or	HateListCount( own )==0 then
				DelObj(Blight)
				DelObj(Clight)
				DelObj(Dlight)
				DelObj(OwnerID())
				return
			end
	end
	
end		



function LuaQ_dr424305_2()									--A燈觸碰劇情
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--讀出怪的資料
	local Clight =ReadRoleValue(monster,EM_RoleValue_Register5)				--讀出怪身上C燈的資料
	if	CheckAcceptQuest(own,424305)==true and					--確認任務狀態
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register2)==1 then				--利用Register進行判斷 1=燈正常  2=燈熄滅
		WriteRoleValue(monster,EM_RoleValue_Register6,2)
		PlayMotion(Clight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register2)==2  then				--當燈是熄滅狀態，點燈就會亮起來	
		WriteRoleValue(monster,EM_RoleValue_Register2,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_3()									--B燈觸碰劇情
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)
	local Alight =ReadRoleValue(monster,EM_RoleValue_Register1)
	if	CheckAcceptQuest(own,424305)==true and
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register4)==1 then
		WriteRoleValue(monster,EM_RoleValue_Register2,2)
		PlayMotion(Alight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register4)==2  then
		WriteRoleValue(monster,EM_RoleValue_Register4,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_4()									--C燈觸碰劇情
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--讀出怪的資料
	local Blight =ReadRoleValue(monster,EM_RoleValue_Register3)				--讀出怪身上B燈的資料
	local Dlight =ReadRoleValue(monster,EM_RoleValue_Register7)				--讀出怪身上D燈的資料
	if	CheckAcceptQuest(own,424305)==true and					--確認任務狀態
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register6)==1 then				--利用Register進行判斷 1=燈正常  2=燈熄滅
		WriteRoleValue(monster,EM_RoleValue_Register4,2)
		WriteRoleValue(monster,EM_RoleValue_Register8,2)
		PlayMotion(Blight,146)
		PlayMotion(Dlight,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register6)==2  then				--當燈是熄滅狀態，點燈就會亮起來
		WriteRoleValue(monster,EM_RoleValue_Register6,1)
		PlayMotion(obj,0)
	end			
end

function LuaQ_dr424305_5()									--D燈觸碰劇情
	local own=OwnerID()
	local obj=TargetID()
	local monster=ReadRoleValue(obj,EM_RoleValue_Register1)				--讀出怪的資料
	local Alight =ReadRoleValue(monster,EM_RoleValue_Register1)				--讀出怪身上A燈的資料
	if	CheckAcceptQuest(own,424305)==true and					--確認任務狀態
		CheckCompleteQuest(own,424305)==false and
		ReadRoleValue(monster,EM_RoleValue_Register8)==1 then				--利用Register進行判斷 1=燈正常  2=燈熄滅
		WriteRoleValue(monster,EM_RoleValue_Register2,2)
		WriteRoleValue(monster,EM_RoleValue_Register8,2)
		PlayMotion(Alight,146)
		PlayMotion(obj,146)
	elseif	ReadRoleValue(monster,EM_RoleValue_Register8)==2  then				--當燈是熄滅狀態，點燈就會亮起來
		WriteRoleValue(monster,EM_RoleValue_Register8,1)
		PlayMotion(obj,0)
	end			
end

----============================================================
function LuaQ_dr424294_4()					--喀洛恩特製服飾
	local own=OwnerID()
	if CheckBuff(own,620129)==false then
		castspell(own,own,497968)
	BeginPlot(own,"LuaQ_dr424294_5",0)
	else
	ScriptMessage(own,own,2,"[SC_424294_3]",0)
		return
	end
end

function LuaQ_dr424294_5()	
	local own=OwnerID()
	local RoomID=ReadRoleValue(Own,EM_RoleValue_RoomID)
	local Akalorn = LuaFunc_CreateObjByObj (118823 , own) 
	SetModeEx(Akalorn,EM_SetModeType_Mark,false)
	SetModeEx(Akalorn,EM_SetModeType_ShowRoleHead,false)
	SetModeEx(Akalorn,EM_SetModeType_HideName,true)
	AddToPartition(Akalorn,RoomID)
	sleep(10)
	DelObj(Akalorn)
end
-------------------------------------------------------------------------------------------------------------------------------

function LuaQ_dr424303_0()					--領主下落，放侍從身上
	local own=OwnerID()
	local obj=TargetID()
	LoadQuestOption(own)
		if 	CheckAcceptQuest( Own,424303 )==true  and  CheckCompleteQuest(own,424303)== false  then
			AddSpeakOption(own,obj,"[SC_424303_0_1]","LuaQ_dr424303_1",0)
		else
	LoadQuestOption(own)
		end
end

function LuaQ_dr424303_1()
	local own=OwnerID()
	SetSpeakDetail(own,"[SC_424303_0_2]")
	GiveBodyItem(own,545081,1)
end

-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_drBOX01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local Atable={}
	local X=0
	Atable=SearchRangeNPC(O_ID,30)
	for i=0,table.getn(Atable)  do
		if ReadRoleValue(Atable[i],EM_RoleValue_OrgID)==118820 then
			X = X+1
		end
	end
	if X ~=0 then
		return true
	else
		ScriptMessage(O_ID,0,1 ,"[SC_DRBOX01_01]" , 0)	  --不能隨地亂擺放箱子，造成別人的麻煩！
		return false
	end	
end

function LuaQ_drBOX02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	local RoomID=ReadRoleValue(O_ID,EM_RoleValue_RoomID)
	local Abox = LuaFunc_CreateObjByObj (110987 , O_ID) 
	SetModeEx(Abox,EM_SetModeType_Mark,false)
	SetModeEx(Abox,EM_SetModeType_Obstruct,true)
	AddToPartition(Abox,RoomID)
	callplot(Abox,"LuaQ_drBOX03",Abox)
end

function LuaQ_drBOX03(Abox)
	local O_ID=OwnerID()
	sleep(200)
	ScriptMessage(O_ID, 0 , 1 ,"[SC_DRBOX01_02]" ,0)			--箱子發出喀拉的聲響後，應聲碎成一片粉塵...
	DelObj(Abox)
end
-------------------------------------------------------------------------------------------------------------------------------
function LuaQ_dr424317_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if 	(ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764) and
		(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))>0.4  then
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_02]",0)				--這隻生物，生命力還太過強盛無法捕捉！
		return false
		elseif	(ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764) and
			(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))<=0.4 and
			ReadRoleValue(T_ID,EM_RoleValue_HP)~=0 then
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_03]",0)				--這隻生物，經過幾番掙扎還是被你捕抓到了！
			return true
		else 
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_01]",0)			 	--這只能對噬骨者使用！
			return false
	end
end

function LuaQ_dr424317_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckAcceptQuest(O_ID,424317)==true and 
		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105667 or
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105763 or 
	   	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105764 then
		CallPlot( T_ID, "LuaFunc_ResetObj",T_ID )
		GiveBodyItem(O_ID,240292,1)
		
	end
end
