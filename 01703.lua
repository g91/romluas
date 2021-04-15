-----------start     

function Lua_bk_122_102691()---------------開始劇情
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------開始的房間
	local start=OwnerID()-------------------------------------------------開場紀錄
	local be=0
	local PPL=0
	local smaster = LuaFunc_CreateObjByObj(102691,OwnerID())------------------------------------紀錄點去產生物件
	AddToPartition( smaster , RoomID )
	WriteRoleValue( smaster, EM_RoleValue_PID,start)
	BeginPlot( smaster ,"Lua_bk_122_ma_102691",0)---------------------------------王劇情模式
	SetPlot( smaster , "dead" , "Lua_bk_122_smaster_102691" , 0 )-----------放入死亡劇情檢查是誰殺了他
	while 1 do 
		sleep(10)
		be=ReadRoleValue( OwnerID(),EM_RoleValue_Register1 ) 
		if be==1 then 
		---	say(OwnerID(),"xx")
			sleep(50)
			PPL=SetSearchAllNPC(RoomID)----------------尋找整間的
			for x=1,PPL do 		
				sleep(10)
				local ID = GetSearchResult()
				if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103090 then 
					DelObj(ID)
				end
			end
			local smaster = LuaFunc_CreateObjByObj(102691,OwnerID())------------------------------------紀錄點去產生物件
			AddToPartition( smaster , RoomID )
			WriteRoleValue( smaster, EM_RoleValue_PID,start)
			BeginPlot( smaster ,"Lua_bk_122_ma_102691",0)---------------------------------王劇情模式
			SetPlot( smaster , "dead" , "Lua_bk_122_smaster_102691" , 0 )-----------放入死亡劇情檢查是誰殺了他
			be=0
			WriteRoleValue(start, EM_RoleValue_Register1,0)
		end
		x=ReadRoleValue(start,EM_RoleValue_Register9)
	end
end
function Lua_bk_122_smaster_102691()
	local x=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1,1)-----紀錄
	WriteRoleValue(OwnerID(), EM_RoleValue_Register3,TargetID())-----紀錄
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	BeginPlot(OwnerID(),"Lua_bk_122_dead_102691",0)---------準備重生模式
	return false
end
function Lua_bk_122_smaster1_102691()
	local x=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1,1)-----紀錄
	WriteRoleValue(OwnerID(), EM_RoleValue_Register3,TargetID())-----紀錄
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---重力
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----會阻擋(阻擋其他的物件)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---反擊
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---移動	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---可砍殺
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	BeginPlot(OwnerID(),"Lua_bk_122_dead1_102691",0)---------準備重生模式
	return false
end
function Lua_bk_122_dead_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local x=0
	local kill=ReadRoleValue( OwnerID(),EM_RoleValue_Register3 ) 
	local x=ReadRoleValue( kill,EM_RoleValue_OrgID ) 
	---say(OwnerID(),"x"..x)
	local bk=ReadRoleValue(start,EM_RoleValue_Register9 ) ------------------紀錄他分裂次數
	if ReadRoleValue( kill,EM_RoleValue_OrgID ) == 102691 then -------------檢查殺死他的人是誰 
		if bk<=2 then 
			---say(OwnerID(),"bk"..bk)
			BeginPlot(smaster,"Lua_bk_122_live_102691",10)---------準備重生模式
			bk=bk+1
			WriteRoleValue(start, EM_RoleValue_Register9,bk)	
		elseif bk>=3 then 
			DelObj(OwnerID())
		end
	elseif ReadRoleValue( kill,EM_RoleValue_OrgID ) ~= 102691 then -------------檢查殺死他的人是誰 
	end
end

function Lua_bk_122_dead1_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local x=0
	local kill=ReadRoleValue( TargetID(),EM_RoleValue_Register3 ) 
	local x=ReadRoleValue( kill,EM_RoleValue_OrgID ) 
	local bk=ReadRoleValue(start,EM_RoleValue_Register9 ) ------------------紀錄他分裂次數
	if ReadRoleValue( kill,EM_RoleValue_OrgID ) == 103090 then -------------檢查殺死他的人是誰 
		------------------考慮回傳值給start 這樣方便計算
		if bk<=2 then 
		BeginPlot(smaster,"Lua_bk_122_live_102691",0)---------準備重生模式
		bk=bk+1
		WriteRoleValue(start, EM_RoleValue_Register9,bk)	
		elseif bk>=3 then 
			DelObj(OwnerID())
		end
	elseif ReadRoleValue( kill,EM_RoleValue_OrgID ) ~= 103090 then -------------檢查殺死他的人是誰 
		------------------被玩家殺死就可以不用動了 真正的死亡了但是要回傳值給開始的物件
	end
end
function Lua_bk_122_live_102691()-------------------------產生兩隻
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bk=0
	local newmaster=LuaFunc_CreateObjByObj(103090,OwnerID())
	BeginPlot( newmaster ,"Lua_bk_122_ma1_102691",50)---------戰鬥判斷模式
	WriteRoleValue( newmaster, EM_RoleValue_PID,start)---------------------紀錄
	SetPlot( newmaster , "dead" , "Lua_bk_122_smaster1_102691" , 0 )
	local newmaster1=LuaFunc_CreateObjByObj(103090,OwnerID())
	BeginPlot( newmaster1 ,"Lua_bk_122_ma1_102691",50)---------戰鬥判斷模式
	WriteRoleValue( newmaster1, EM_RoleValue_PID,start)---------------------紀錄
	SetPlot( newmaster1 , "dead" , "Lua_bk_122_smaster1_102691" , 0 )
	sleep(10)
	DelObj(OwnerID())
end
function Lua_bk_122_ma_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local CombatBegin=0
	local dead=0
	local live=0
	while 1 do 
	sleep(10)
		if HateListCount(smaster) ~= 0 then	---- 確定他現在有打人
			if CombatBegin == 0 then							---------------只有開場放一次
				CombatBegin = 1
			end
		elseif HateListCount( smaster ) == 0 then----------------離開戰鬥 所有值都該回歸
			if CombatBegin==1 then 
				---dead=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
				live=ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			---	say(OwnerID(),"live"..live)
				if live == 0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	---
					sleep(30)
					DelObj(smaster)
				elseif live==1 then 
					break
				end
			end
		end
	end
end
function Lua_bk_122_ma1_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local CombatBegin=0
	local dead=0
	local live=0
	while 1 do 
	sleep(10)
		if HateListCount(smaster) ~= 0 then	---- 確定他現在有打人
			
		elseif HateListCount( smaster ) == 0 then----------------離開戰鬥 所有值都該回歸
			----dead=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
			live=ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			if live == 0 then 
				WriteRoleValue(start, EM_RoleValue_Register1,1)	---
				sleep(30)
				DelObj(smaster)
			elseif live==1 then 
				break
			end
		end
	end
end
