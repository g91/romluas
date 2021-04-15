--/gm ? zone 24 0 6370,988,-7486
function un_106905_134()    --宓倫多護衛隊長 奮力之擊
		local ZoneID = ReadRoleValue ( OwnerID() , EM_RoleValue_ZoneID )
		sleep(2)
		local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		--say(TargetID( ),"X"..x)
		local cab=Lua_DW_CreateObj("obj",107452,TargetID(),0)
		SetModeEx(cab,EM_SetModeType_Mark,false) ----標記
		SetModeEx(cab,EM_SetModeType_Strikback,false) ---反擊
		SetModeEx(cab,EM_SetModeType_Move,false) ---移動	
		SetModeEx(cab,EM_SetModeType_Fight,false) ---可砍殺
		SetModeEx(cab,EM_SetModeType_SearchenemyIgnore,false) ---物件不會被搜尋
		SetModeEx(cab,EM_SetModeType_HideName,false)  ---物件頭上是否顯示名稱
		SetModeEx(cab,EM_SetModeType_HideMinimap,false)  ---物件是否在小地圖上顯示
		SetModeEx(cab,EM_SetModeType_Searchenemy,false)  ---鎖敵
		SetModeEx(cab,EM_SetModeType_Show,false)
		AddToPartition(cab,RoomID )
		local PPL=SearchRangePlayer(TargetID(),90)	
		local x=table.getn(PPL)-----取出來的是數量
		WriteRoleValue(cab,EM_RoleValue_Livetime,3)
		if ZoneID == 149 then
			if x>=6 then 
				CastSpellLV(cab,cab,499757,23)
			elseif x==5 then 
				CastSpellLV(cab,cab,499757,29)
			elseif x==4 then 
				CastSpellLV(cab,cab,499757,39)
			elseif x==3 then
				CastSpellLV(cab,cab,499757,59)
			elseif x==2 then
				CastSpellLV(cab,cab,499757,119)
			elseif x==1 then	
				CastSpellLV(cab,cab,499757,239)
			end	
		else
			if x>=6 then 
				CastSpellLV(cab,cab,499757,13)
			elseif x==5 then 
				CastSpellLV(cab,cab,499757,19)
			elseif x==4 then 
				CastSpellLV(cab,cab,499757,25)
			elseif x==3 then
				CastSpellLV(cab,cab,499757,35)
			elseif x==2 then
				CastSpellLV(cab,cab,499757,55)
			elseif x==1 then	
				CastSpellLV(cab,cab,499757,105)
			end	
		end
end

function un_RangeSkill_499409() --靈刃風暴
	local OwnerID = OwnerID()
	--local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	local Obj_X = ReadRoleValue ( OwnerID, EM_RoleValue_X)
	local Obj_Y = ReadRoleValue ( OwnerID, EM_RoleValue_Y)
	local Obj_Z = ReadRoleValue ( OwnerID, EM_RoleValue_Z)
	addbuff(OwnerID,621499,0,-1)
	--local Master = ReadRoleValue ( OwnerID , EM_RoleValue_OwnerGUID )
	--local powerLV = ReadRoleValue( Master , EM_RoleValue_MagicPowerLv_SP+87 ) --+12是讀取主職專屬的職業列表
	for i= 1 , 6 do
		SysCastSpellLv_Pos( OwnerID , Obj_X , Obj_Y , Obj_Z , 499410 , 1 )
		sleep(10)
	end
end

function un_zone24_106901() --柯達多溫吞噬者 AI
	local own = OwnerID()
	local RoomID=ReadRoleValue(own,EM_RoleValue_RoomID)
	local ttime = 0  --戰鬥時間
	local CombatBegin = 0
	local door --時空裂隙
	SetPlot( own,"dead","un_zone24_106901_die",0 )
		while 0 do
			sleep(10)
			if hatelistcount(own)~=0 then
				if CombatBegin==0 then
					CombatBegin = 1
					CastSpelllv( own,  own, 499413,0 ) --招換時空裂隙
					door = LuaFunc_CreateObjByObj ( 106908 , own )
					SetModeEx(door,EM_SetModeType_Mark, false)
					SetModeEx(door,EM_SetModeType_NotShowHPMP, false)
					SetModeEx(door,EM_SetModeType_Strikback, false)
					SetModeEx(door,EM_SetModeType_Move, false)
					SetModeEx(door,EM_SetModeType_Fight, false)
					SetModeEx(door,EM_SetModeType_Searchenemy, false)
					SetModeEx(door,EM_SetModeType_Obstruct, true)
					WriteRoleValue(own,EM_RoleValue_register1,door)
					WriteRoleValue(door,EM_RoleValue_register1,own)
					AddToPartition( door, RoomID)
					BeginPlot(door , "un_zone24_106901_AI" , 0)
				end
			end
			if hatelistcount(OwnerID())==0 and CombatBegin==1 then
				CombatBegin = 0
				ttime = 0
				delobj(door)
			end
		end
end
function un_zone24_106901_die() --柯達多溫吞噬者 AI
	local monster = ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	delobj(monster)
end
function un_zone24_106901_AI() --時空裂隙 AI
	local own = OwnerID()
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	local master = ReadRoleValue(own,EM_RoleValue_register1)
	local mhate = {} --吞噬者的仇恨隨機一人
	sleep(20)
	
		while 0 do
			sleep(10)
			mhate={};
			local n=HateListCount(master);
			if(n==0)then break;end
			for pos=0,n-1,1 do
				local id=HateListInfo(master,pos,EM_HateListInfoType_GItemID);
				--if(ReadRoleValue(id,EM_RoleValue_IsPlayer)==1)then
					table.insert(mhate,id);
				--end
			end
			if(#mhate==0)then break;end

			if ZoneID == 149 then
				CastSpelllv( own,  mhate[DW_Rand(#mhate)], 499414,4 )
			else
				CastSpelllv( own,  mhate[DW_Rand(#mhate)], 499414,1 )
			end	
			--for i = 1 , 5 do
				CastSpelllv( master,  own, 499415,0 )
				sleep(50)
			--end
		end
end
function un_zone24_106902() --柯達多溫侵占者-意識侵占
local own = OwnerID()
local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
local lv
local player = {}

	if checkbuff(own,622904) == true then
		--say(own,"1")
		lv = KS_CheckBuffLV( own, 622905 )--取得指定物件身上BUFF等級
		player = SearchRangePlayer ( own , 30 ) --搜尋週為30的人
		if table.getn(player)>1 then
		--say(own,"2")
			cancelbuff(own,622905)
			cancelbuff(own,622904)
			
			if own == player[0] then
				sysCastSpellLv(own,player[1],499416,0)
				AddBuff(own,622907,0,20)
			else
				sysCastSpellLv(own,player[0],499416,0)
				AddBuff(own,622907,0,20)
			end
		else
		--say(own,"3")
			if lv < 5 then
			--say(own,"4")
				return true
			else
			--say(own,"5")
				if ZoneID == 149 then
					sysCastSpellLv(own,own,499452,10)
				else
					sysCastSpellLv(own,own,499452,4)
				end
			end
		end
	end
end
function un_zone24_106902_1() --意識侵占接收判斷
local own = OwnerID()
local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	if checkbuff(TargetID(),622907) == true then
		if ZoneID == 149 then
			sysCastSpellLv(own,own,499452,10)
		else
			sysCastSpellLv(own,own,499452,4)
		end
		cancelbuff(TargetID(),622907)
		--say(own,"6")
		return true
	else
	--say(own,"7")
		return true
	end
end
function un_zone24_106902_2() --柯達多溫侵占者死亡劇情
	local player = {}
	player =SearchRangePlayer ( OwnerID() , 500 )
	for i= 0 , table.getn(player) do
		if checkbuff(player[i],622904) then
			cancelbuff(player[i],622905)
			cancelbuff(player[i],622904)
		end
	end
end
 ----------------------------------------------------------------------------------------------------------------
                                                --1王前PAT
----------------------------------------------------------------------------------------------------------------
function Lua_zone24_149_PAT1() --4人小隊
	local own = OwnerID()
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	local monster = {}
	if zone ==149 then
		monster = {106903,106904,106907,106905}
	else
		monster = {107402,107403,107406,107404}
	end
	
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(monster[1],Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(monster[2],Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(monster[3],Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(monster[4],Matrix,3,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone24_149_PAT2" , 0 )
end
function Lua_zone24_149_PAT2()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone24_149_PAT1" , 0 )
end
function Lua_zone24_149_PAT3() --4人小隊
	local own = OwnerID()
	local ZoneID = ReadRoleValue ( own , EM_RoleValue_ZoneID )
	local dis = 15
	local count = 5 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 10 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = 600000  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
	local SkillRND =  Rand( 100 )+1	-- 產生亂數
	if SkillRND <= 100 and SkillRND > 80 then
		checktime =	checktime + 1
	elseif SkillRND <= 80 and SkillRND > 60 then
		checktime = checktime + 2		
	elseif SkillRND <= 60 and SkillRND > 40 then
		checktime = checktime + 3
	elseif SkillRND <= 40 and SkillRND > 20 then
		checktime = checktime + 4
	elseif SkillRND <= 20 and SkillRND > 0 then
		checktime = checktime + 5
	end	
	local ObjMatrix ={}
	local monster = {}
	if zone ==149 then
		monster = {106903,106904,106907,106905}
	else
		monster = {107402,107403,107406,107404}
	end
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(monster[1],Matrix,1,1)
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(monster[2],Matrix,1,-1)
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(monster[3],Matrix,3,-1)
	ObjMatrix[4] = LuaFunc_CreateNPCByMatrix(monster[4],Matrix,3,1)
	LuaFunc_NPCWalkByMatrix_2( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
	BeginPlot( OwnerID() , "Lua_zone24_149_PAT4" , 0 )
end
function Lua_zone24_149_PAT4()
	sleep( 10 )
	BeginPlot( OwnerID() , "Lua_zone24_149_PAT3" , 0 )
end

function lua_bico_622832_playerfalse()
	if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then
		return false
	else
		return true
	end
end