function WY_Z163_B6_KRYPSE()
	local time = 0
	local TheTwoWinds = {123195,123196}
	local winds = {}
	local chace = {1,-1}
	local r = 0
	local coin = 0
	local r_target = {}
	local boss_reset = false
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Rotate = 0
	local rage = false
	local x,y,z,direction = 0,0,0,0
	local door = 0
	local last_skill = 0
	r_target.id = 0
	r_target.x , r_target.y , r_target.z = 0, 0, 0
	--創造BOSS
	x,y,z,direction = DW_Location(OwnerID())
	local CreatedBoss = WY_Create_an_obj(108281,x,y,z,direction)
	--建立需要使用的BOSS資訊
	local boss = WY_get_objStatus(CreatedBoss)
	while boss.hp > 0 do
	--檢查當前施展的法術名稱
	local casting = ReadRoleValue(boss.id, EM_RoleValue_SpellMagicID)
	if casting ~= 0 and casting ~= last_skill then
		if casting == 851299 then --正在施展生命枯竭
			local temp_target = ReadRoleValue(boss.id, EM_RoleValue_AttackTargetID)
			scriptMessage(OwnerID(),temp_target,2,"[$MUTE]".."[WY_Z163_B6_LIFEDRAIN]",0)
		elseif casting == 497470 then --正在施展腐化吸收 
			scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIEHEAL]",0)
		end
	end
	--更新BOSS資訊
		boss = WY_get_objStatus(CreatedBoss)
	--判斷是否在戰鬥中
		if boss.hatecount ~= 0 then boss.combating = 1; boss_reset = true;  else boss.combating = 0 end
	--若戰鬥就執行AI並擋門
		if boss.combating ==1 then
			if door == 0 then
				x,y,z,direction = 5420, 795, 2761, 1
				door = WY_Create_an_obj(106247,x,y,z,direction)
				SetModeEx( door , EM_SetModeType_Mark , false );	--不可點選
				SetModeEx( door , EM_SetModeType_HideName , true );	--不顯示名稱
				SetModeEx( door , EM_SetModeType_NotShowHPMP , false );	--不顯示血條
				SetModeEx( door , EM_SetModeType_Strikback , false );	--不會反擊
				SetModeEx( door , EM_SetModeType_Move , false );	--不會移動
				SetModeEx( door , EM_SetModeType_Fight , false );	--不可攻擊
				SetModeEx( door , EM_SetModeType_Searchenemy , false );	--不會索敵
				SetModeEx( door , EM_SetModeType_Obstruct , true );	--有阻擋效果
				scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_START]",0);
			end
	--計時
			time = time +1
	--檢查是否狂暴
			if not rage then
				if time >= 360 and ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) ~= 163 then
					addBuff(boss.id, 625099,0,-1)
					rage = true
				elseif time >= 480 and ReadRoleValue(OwnerID(),EM_RoleValue_RoomID) == 163 then
					addBuff(boss.id, 625099,0,-1)
					rage = true	
				end
			end
	--每9秒檢查旋風數量，若有則更換目前旋風的位置，沒有就施放新的兩道旋風。
			if #winds == 0 then
				for n = 1,2 do
					r = RandRange(1,boss.hatecount)-1
					r_target.x = ReadRoleValue(OwnerID(), EM_RoleValue_X)
					r_target.y = ReadRoleValue(OwnerID(), EM_RoleValue_Y)
					r_target.z = ReadRoleValue(OwnerID(), EM_RoleValue_Z)
					r = WY_CoinStyle_Random(25, 55) --取得25~55間的隨機一個正數或負數
					local x = r_target.x + r
					r = WY_CoinStyle_Random(25, 55) --取得25~55間的隨機一個正數或負數
					local z = r_target.z + r
 					local obj = CreateObj(TheTwoWinds[n],x,r_target.y,z,0,1)
					winds[n] = obj
					addToPartition(obj,boss.room_id)
				end
			else
				Rotate = Rotate +18					
				x,y,z,direction = DW_Location(OwnerID())
				x,y,z,direction = DW_NewLocation(Rotate,125,x,y,z,direction)
				move(winds[1],x,y,z)
				x,y,z,direction = DW_Location(OwnerID())
				x,y,z,direction = DW_NewLocation(Rotate+180,125,x,y,z,direction)
				move(winds[2],x,y,z)
			end
		--施展範圍的殭屍化檢查
		SysCastSpellLv(OwnerID(),OwnerID(),851301,0)
		end
		--檢查是否脫離戰鬥
		if boss_reset  and boss.combating == 0 then
			sleep(20)
			for n=1,2 do
				delobj(winds[n])
			end
			winds = {}
			for i,v in pairs(boss.hatelist) do
				cancelBuff(v,624998)
				cancelBuff(v,623973)
				cancelBuff(v,624999)
			end
			delobj(door)
			door = 0
			boss_reset = false
			time = 0
			if boss.hp > 0 then
				delobj(boss.id)
				x,y,z,direction = DW_Location(OwnerID())
				CreatedBoss = WY_Create_an_obj(108281,x,y,z,direction)
				boss = WY_get_objStatus(CreatedBoss)
			else
				scriptMessage(OwnerID(),0,2,"[$MUTE]".."[WY_Z163_B6_END]",0)
			end
		end
		sleep(10)
	end
	--if boss.hp <= 0 and CheckID(door) then
	--if boss.hp <= 0 or CheckID( boss.id ) == false then
		for n=1,2 do
			if( winds[n] ~= nil )then delobj(winds[n]) end;
		end
		winds = {}
		for i,v in pairs(boss.hatelist) do
			cancelBuff(v,624998)
			cancelBuff(v,623973)
			cancelBuff(v,624999)
		end
		delobj(door)
		door = 0
		boss_reset = false
		time = 0

		Sleep( 50 );
		Lua_703019_Boss7_Init( MyRoom );
	--end
end

function WY_Z163_B6_ADJUST()
--	AdjustDir(OwnerID(),ReadRoleValue(OwnerID(),EM_RoleValue_Dir)+1)
	return true
end

function WY_Z163_B6_LeftAndRight()
	local x,y,z,direction = DW_Location(OwnerID());
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Obj = 0
--	CastSpellPos( OwnerID(),x, y, z, 496898, 0 )
	x,y,z,direction = DW_NewLocation(90, 50,x,y,z,direction)
	x,y,z,direction = DW_NewLocation(180, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(0, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(270, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_NewLocation(180, 100,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z, 0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,4)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
end

function WY_Z163_B6_FrontAndBack()
	local x,y,z,direction = DW_Location(OwnerID());
	local MyRoom = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Obj = 0
--	CastSpellPos( OwnerID(),x, y, z, 497454, 0 )
	x,y,z,direction = DW_NewLocation(0, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(90, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(180, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
	x,y,z,direction = DW_Location(OwnerID());
	x,y,z,direction = DW_NewLocation(270, 50,x,y,z,direction)
	Obj = CreateObj(108331,x,y,z,0,1)
	WriteRoleValue(Obj,EM_RoleValue_Register1,5)
	SetModeEx( Obj , EM_SetModeType_SearchenemyIgnore , true );---物件不會被搜尋
	SetModeEx( Obj , EM_SetModeType_HideName , true );  		---物件頭上是否顯示名稱
	SetModeEx( Obj , EM_SetModeType_HideMinimap , true );		---物件是否在小地圖上顯示
	SetModeEx( Obj , EM_SetModeType_Searchenemy , false );   	--索敵
	SetModeEx( Obj , EM_SetModeType_Mark , false );			--標記
	SetModeEx( Obj , EM_SetModeType_Fight , false ); 			--砍殺
	SetModeEx( Obj , EM_SetModeType_Move , false );			--移動
	SetModeEx( Obj , EM_SetModeType_ShowRoleHead , true );
	SetModeEx( Obj , EM_SetModeType_Strikback , false );		--反擊
	SetModeEx( Obj , EM_SetModeType_Show , true );
	addToPartition(Obj,MyRoom)
	sleep(1)
end

function WY_Z163_B6_SWEEP_OR_WING()
	local me =  OwnerID()
	if ReadRoleValue(me,EM_RoleValue_Register1) == 5 then
		SysCastSpellLv(me,me , 497454, 0 )
		sleep(10)
		DelObj(me)
	elseif ReadRoleValue(me,EM_RoleValue_Register1) == 4 then
		SysCastSpellLv(me,me , 496898, 0 )
		sleep(10)
		DelObj(me)
	end
end
--淨化之風每秒對周圍施展AE法術，清除殭屍化並緩速
function WY_Z163_B6_CleansingWind()
	while true do
		SysCastSpellLV(OwnerID(),OwnerID(),851343,6)--每等級緩速5%，強度可調
		sleep(10)
	end
end
--腐化之風每秒對周圍施展AE法術，疊加殭屍化並緩速
function WY_Z163_B6_CurruptingWind()
	while true do
		SysCastSpellLV(OwnerID(),OwnerID(),851342,0)--每等級緩速5%，強度可調
		sleep(10)
	end
end
--判斷目標的殭屍化程度，若大於等於3層就cancel掉殭屍化(為了某些治療效果)並回傳True反之則False
function WY_Z163_B6_zombie_check()
	local pos = 0
	local Target_id = TargetID()
	--[[
	for n = 1,BuffCount(Target_id) do
		pos = n-1
		if BuffInfo(Target_id,pos,EM_BuffInfoType_BuffID) == 623973 and BuffInfo(Target_id, pos,EM_BuffInfoType_Power) >= 2 then
			cancelBuff(Target_id, 624998)
			scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_PASS]",0)
			return true
		end
	end
	scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_FAIL]",0)
	return false
	]]--


	local _thisBuffGUID = 624998;--624998殭屍化
	local _dischargeBuffGUID = 625071;--625071生命枯竭
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( Target_id , _thisBuffGUID );
	local _showMsgOrNot = RandRange( 1 , 300 );
	--DebugMsg( 0 , 0 , "WY_Z163_B6_zombie_check : ".._currentBuffLv.."  Rand : ".._showMsgOrNot );
	
	if ( _currentBuffLv >= 2 ) then--大於三層解除
		--cancelBuff(Target_id, 624998)
		CancelBuff( Target_id , 620433 );--620433生命枯竭有效
		--AddBuff( Target_id , 624999 , 0 , -1 );
		if( _showMsgOrNot < 33 ) then
			scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_PASS]",0)
		end
		return false;--大於三層則無效
	end
	AddBuff( Target_id , 620433 , 0 , -1 );--620433生命枯竭有效
	--CancelBuff( Target_id , 624999 );
	if( _showMsgOrNot < 33 ) then
		scriptMessage(OwnerID(),Target_id,2,"[$MUTE]".."[WY_Z163_B6_ZOMBIE_FAIL]",0)
	end
	return true;

end
--使用過殭屍化程度判斷的法術在施放成功後執行，把殭屍化補齊到與顯示用BUFF一致的等級
function WY_Z163_B6_zombie_check_fin()
	local pos = 0
	local temp_pow = -1
	if CheckBuff(TargetID(),623973) then
		for n = 1, BuffCount(TargetID()) do
			pso = n-1
			if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
				temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
			end
		end
		if temp_pow ~= -1 then
			addBuff(TargetID(),624998,temp_pow,-1)
		end
	end
end
--當顯示用BUFF被消除的時候更新實際殭屍化的堆疊等級與顯示的同等
function WY_Z163_B6_ZOMBIE_CLEAR()
	local temp_pow = 0
	local pos = 0
	cancelBuff(TargetID(),624998)
	if CheckBuff(TargetID(),623973) then
		for n = 1, BuffCount(TargetID()) do
			pos = n-1
			if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
				temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
			end
		end
		if CheckBuff(TargetID(),623973) then
			addBuff(TargetID(),624998,temp_pow,-1)
		end
	end
end
--淨化之風消除殭屍化的法術SCRIPT
function WY_Z163_B6_CLEAR_ZOMBIE()
	--[[
	local temp_pow = -1
	local pos = 0
	for n = 1,BuffCount(TargetID()) do
		pos = n-1
		if BuffInfo(TargetID() ,pos ,EM_BuffInfoType_BuffID) == 623973 then
			temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)-1
		end
	end
	cancelBuff(TargetID(),623973)
	if temp_pow >= 0 then
		AddBuff(TargetID(),623973,temp_pow,-1)
		AddBuff(TargetID(),624998,temp_pow,-1)
	end	
	]]--
	local _targetID = TargetID();
	local _targetBuff = 624998;--624998殭屍化
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _targetID , _targetBuff );
	_currentBuffLv = _currentBuffLv - 1;
	CancelBuff_NoEvent( _targetID , _targetBuff );
	if( _currentBuffLv > -1 ) then AddBuff( _targetID , _targetBuff , _currentBuffLv , -1 ); end

end
--消除疫病傳染的法術效果SCRIPT
function WY_Z163_B6_CLEAR_PLAGUE()
	CancelBuff(TargetID(),624999)
end
--檢查是否完全無殭屍化
function WY_Z163_B6_HUMAN_CHECK()
	if CheckBuff(TargetID(),623973) then
		return false
	else
		return true
	end
end
--檢查身上顯示用BUFF的強度，並把實際殭屍化捕到一樣強度
function WY_Z163_B6_ZOMBILIZED()
	local temp_pow = 0
	addBuff(TargetID(),623973,0,-1)
	local pos = 0
	for n = 1, BuffCount(TargetID()) do
		pos = n-1
		if BuffInfo(TargetID(),pos,EM_BuffInfoType_BuffID) == 623973 then
			temp_pow = BuffInfo(TargetID(),pos,EM_BuffInfoType_Power)
		end
	end
	addBuff(TargetID(),624998,temp_pow,-1)
end
--被腐化吸收時，回傳一個瘴氣護盾給BOSS
function WY_Z163_B6_Absorb()
	--local boss = OwnerID()
	--addBuff(boss,624997,0,-1)--模板已經有了 於是就被拿掉了
end
--避免重複擊中的BUFF檢查
function WY_Z163_B6_DONT_HIT_TWICE()
	local player = TargetID()
	if CheckBuff(player, 625079) then
		return false
	else
		return true
	end
end

function WY_Z163_B7_Summon()
	DebugMsg(0,0,"WY_Z163_B7_Summon")
	local x,y,z,direction = DW_Location(781361,1)
	local me = OwnerID()
	local players = SearchRangePlayer(me, 600)
	if DW_GetDistance(playerID ,x,y,z) > 200 then
		scriptMessage(me, -1 , 2 ,"[WY_STRING_Z163_OOR_SUMMON]", 0)
	elseif DW_GetDistance(playerID ,x,y,z) < 200  then
		scriptMessage(me, -1 , 2 ,"[WY_STRING_Z163_IR_SUMMON]", 0)
	end
	--CreatedBoss = WY_Create_an_obj(108282,x,y,z,direction)
	DelBodyItem( OwnerID(), 243098, 1 );
end

function WY_Z163_Check_B7()
	local key = CountBodyItem( OwnerID(), 243098 )
	DebugMsg(0,0,"key = "..key)
	if key ~= 0 then 
		return true
	else
		return false
	end
end

function Lua_703093_Zombilize()
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998殭屍化
	local _dischargeBuffGUID = 625071;--625071生命枯竭
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg(0,ReadRoleValue( _ownerID , EM_RoleValue_RoomID ),"Lua_703093_Zombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 1 ) then--大於三層解除
		CancelBuff( _ownerID , _dischargeBuffGUID );
		CancelBuff( _ownerID , 625076 ); --解除生命枯竭詛咒
		AddBuff( _ownerID , 624999 , 0 , -1 );
--		return true;
	else
		CancelBuff( _ownerID , 624999 );
	end
	
	return true;
end

function Lua_703093_CheckZombilize()--625076生命枯竭詛咒 檢查
--	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--Lua_703093_CheckZombilize--");
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998殭屍化
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"Lua_703093_CheckZombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 2 ) then--大於三層解除
		AddBuff( _ownerID , 624999 , 0 , -1 );
		CancelBuff_NoEvent( _ownerID , 625076 );
		DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--false--");
--		return false;
	else
		CancelBuff_NoEvent( _ownerID , 624999 );
		AddBuff( _ownerID , 625076 , 0 , -1 );		
	end
--	CancelBuff_NoEvent( _ownerID , 624999 );
--	AddBuff( _ownerID , 625076 , 0 , -1 );
	DebugMsg(0,ReadRoleValue( TargetID() , EM_RoleValue_RoomID ),"--true--");
	return true;
end

function Lua_703093_CheckZombilize_Plage()--624999疫病傳染 檢查
	local _ownerID = TargetID();
	local _thisBuffGUID = 624998;--624998殭屍化
	local _currentBuffLv = Lua_703107_Return_Buff_Lv( _ownerID , _thisBuffGUID );
	--DebugMsg(0,0,"Lua_703093_CheckZombilize : ".._currentBuffLv );
	if ( _currentBuffLv >= 2 ) then--大於三層解除
		--AddBuff( _ownerID , 624999 , 0 , -1 );
		return true;
	end
	CancelBuff_NoEvent( _ownerID , 624999 );
	return false;

end
