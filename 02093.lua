function Cl_Change_Light_Off(Light)   ------改變燈光顏色 Light 內是字串使用時要以字串形式帶入字串內容為16進位碼 (EX:"0x000064FF")
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	ResetRoomValue			( RoomID )
	SetRoomValue			( RoomID , 2 , Light )
end
function Cl_Change_Light_On()       -------變更為預先設定(為LD一開始設定的燈光顏色
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	ResetRoomValue			( RoomID )
	ClsRoomValue			( RoomID , 2 )
end
function Cl_AddBuff_OwnerID(BuffID)  ----給自己BUFF
	Addbuff (  OwnerID() , BuffID , 0 , 20 ) 
end
function Cl_CastSpellTargetID(Skill_Lv)
	local OwnerID = OwnerID()
	local Hate_X , Hate_Y , Hate_Z = Cl_Read_OwnerXYZ(OwnerID)
	SysCastSpellLv_Pos( OwnerID , Hate_X , Hate_Y , Hate_Z , 498319 , Skill_Lv )
end
function Cl_GetDiff(Var) --取得副本難度
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue( OwnerID , EM_RoleValue_ZoneID )
	DebugMsg( 0 , 0 , "Difficulty="..( ZoneID - Var ) + 1 )
	if ( ZoneID - Var ) + 1  >= 1 and ( ZoneID - Var ) + 1 <= 3 then
		return ( ZoneID - Var ) + 1
	end
	return 1
end
function Cl_Rand_HateList( Rang , Tank ) ---隨機選仇恨表內目標，第一個值填0回傳目標，填1回傳作標 ，第二個值為仇恨表順位排除
	local Hate_Table = DW_HateRemain( Tank )
	if type(Hate_Table) == "table" then
		local Hate_rand = table.getn(Hate_Table)
		local Hate_number = DW_Rand(Hate_rand)
		if Rang == 0 then
			return Hate_Table[Hate_number]
		elseif Rang == 1 then
			if  Hate_Table[Hate_number] ~= nil then
				local Hate_X = ReadRoleValue ( Hate_Table[Hate_number], EM_RoleValue_X)
				local Hate_Y = ReadRoleValue ( Hate_Table[Hate_number], EM_RoleValue_Y)
				local Hate_Z = ReadRoleValue ( Hate_Table[Hate_number], EM_RoleValue_Z)
				return Hate_X,Hate_Y,Hate_Z
			end
		end
	else
		return nil
	end
end
function Cl_RandTarget_HateList( ObjID ) 
	local Hate_Num = HateListCount( ObjID )
	local Hate_Table = {}
	local GUID = 0
	for i = 0 , Hate_Num-1 , 1 do
		GUID = HateListInfo( ObjID , i , EM_HateListInfoType_GItemID )
		table.insert( Hate_Table , GUID ) 
	end
	return Hate_Table
end
function Cl_CreateObj_ForFlag( ObjID , FlagID , FlagNum , RoomID ) ----產生透明球專用
	local NpcID = CreateObjByFlag( ObjID , FlagID, FlagNum , 1 )  ------------生出魔術帽
	SetModeEx( NpcID , EM_SetModeType_HideName, true) ---反擊(否)
	SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( NpcID , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( NpcID , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( NpcID , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	AddToPartition( NpcID , RoomID )
	return NpcID
end
function Cl_CreateObj_ForHideBall( ObjID , Npc_X , Npc_Y , Npc_Z , RoomID ) ----產生透明球專用
	local NpcID = CreateObj( ObjID , Npc_X, Npc_Y , Npc_Z , 0 , 1 )  ------------生出魔術帽	
	SetModeEx( NpcID , EM_SetModeType_HideName, true) ---反擊(否)
	SetModeEx( NpcID , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( NpcID , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( NpcID , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( NpcID , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( NpcID , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , false ) ----不顯示寫條  
	AddToPartition( NpcID , RoomID )
	return NpcID
end
function Cl_Read_OwnerXYZ(OrgID,Rang)
	local OwnerID = OwnerID()
	local Npc_X = ReadRoleValue ( OrgID , EM_RoleValue_X )
	local Npc_Y = ReadRoleValue ( OrgID , EM_RoleValue_Y )
	local Npc_Z = ReadRoleValue ( OrgID , EM_RoleValue_Z )
	if Rang ~= nil then
		local Rand_X = math.random( 0-Rang, Rang )
		local Rand_Z = math.random( 0-Rang, Rang )
		return Npc_X+Rand_X , Npc_Y , Npc_Z+Rand_Z
	else
		return Npc_X , Npc_Y , Npc_Z
	end
end
function cl_chack_CastSpell()  ---檢查是否正在施法
	while 	ReadRoleValue( OwnerID() , EM_RoleValue_SpellMagicID  ) ~= 0   do--------有沒有正在施放技能
		sleep(2)
	end
end
function Cl_ChackIsGM()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if ReadRoleValue ( Target , EM_RoleValue_VOC ) == 0 then
		return false
	else
		return true
	end
end
function Cl_ChackOwner()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if Target ~= OwnerID then
		return true
	elseif Target == OwnerID then
		return false
	end
end
function Cl_ChackIsPlayerReTrue()
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue( TargetID , EM_RoleValue_IsPlayer ) ==  1 then
		return true
	else
		return false
	end
end
function Cl_ChackTarget()
	local OwnerID = OwnerID()
	local Target = TargetID()
	if Target ~= OwnerID then
		return false
	elseif Target == OwnerID then	
		return true
	end
end
function Cl_WriteRoleNowHp(HP)
	local OwnerID = OwnerID()
	WriteRoleValue ( OwnerID , EM_RoleValue_HP, HP )  -----在王的PID身上寫入這個值,告訴王誰是控制器
end
function Cl_Read_BuffLv( ObjID , BuffID , Value ) --0=BUFF等級 , 1=BUFF施展者
	local BUFF = Lua_BuffPosSearch( ObjID , BuffID )
	local BUFFLV = BuffInfo( ObjID , BUFF , EM_BuffInfoType_Power )---讀取技能等級
	local Buff_OwnerID = BuffInfo( ObjID , BUFF , EM_BuffInfoType_OwnerID )---讀取技能等級
	if Value == 0 then
		return BUFFLV
	elseif Value == 1 then
		return Buff_OwnerID
	end
end
function Cl_For_ReSetmagic(BuffID)
	local OwnerID = OwnerID()
	local Buff_Num = BuffCount( OwnerID )  
	for i = 0 , Buff_Num-1 , 1 do
		if BuffInfo( OwnerID , i , EM_BuffInfoType_BuffID ) == BuffID then
			CancelBuff_NoEvent( OwnerID , BuffID )  
		end
	end
end
function Cl_ReadRoleNowHp(ObjID)
	local MaxHP = ReadRoleValue( ObjID , EM_RoleValue_MaxHP )
	local bosshp = ReadRoleValue( ObjID , EM_RoleValue_HP )	---紀錄舊的BOSS的當前血量
	local HPPercent = ( bosshp / MaxHP )*100
	return HPPercent
end
function CL_RandHata_TargetTable(Value_TanK,Play_Num) ---Value_TanK是否排坦0=不排 1=排    Play_Num最低需求玩家數量，不達此數量則直接丟出現有數量
	local New_Table = DW_HateRemain( 0 )
	local New_number = table.getn( New_Table )
	if New_number >= Play_Num then
		local Hate_Table = DW_HateRemain( Value_TanK )
		local Hate_number = table.getn( Hate_Table )
		local Play_Table = {}
		local PlayNum = 0
		local SkillTarget = {}
		if Hate_number ~= 0 then
			for i = 1 , Hate_number , 1 do
				if ReadRoleValue( Hate_Table[i] , EM_RoleValue_IsPlayer ) ==  1 then
					table.insert( Play_Table , Hate_Table[i] )  ----如果玩家身上沒有以上BUFF並且存活~就將他丟到另外一個TABLE
				end
			end
			PlayNum = table.getn( Play_Table )
			if PlayNum > Play_Num then
				SkillTarget = Lua_GetFormHate( Play_Table , Play_Num )
				return SkillTarget
			elseif PlayNum > 0 and PlayNum <= Play_Num then
				return Play_Table
			end
		elseif Hate_number == 0 or Hate_number == nil then
			return Play_Table
		end
	elseif New_number < Play_Num then
		return New_Table
	end
end
---------Cl_EM_SetModeType 1.物件ID  2.反擊 3.移動 4.索敵  5.標記  6.頭像 7.砍殺  8.血條   9.阻擋    10.重力
function Cl_EM_SetModeType( NpcID , back , Move , Search , Mark , Head , Fight , ShowHP , Obstruct , Gravity )
	SetModeEx( NpcID , EM_SetModeType_Strikback, back) ---反擊(否)2
	SetModeEx( NpcID , EM_SetModeType_Move, Move) ---移動	(否)3
	SetModeEx( NpcID , EM_SetModeType_Searchenemy, Search)--索敵(否)4
	SetModeEx( NpcID , EM_SetModeType_Mark, Mark)			---可點選(是)5
	SetModeEx( NpcID , EM_SetModeType_ShowRoleHead, Head) 		---頭像框(是)6
	SetModeEx( NpcID , EM_SetModeType_Fight, Fight) ---可砍殺(是)7
	SetModeEx( NpcID , EM_SetModeType_NotShowHPMP , ShowHP ) ----不顯示寫條 8 
	SetModeEx( NpcID , EM_SetModeType_Obstruct , Obstruct ) ----阻擋9
	SetModeEx( NpcID , EM_SetModeType_Gravity , Gravity ) ----重力10
end
function Cl_Addbuff_ForPlvUp( Buff_Target , BuffID , Buff_Num , flag ) ---Buff效果堆疊用 Buff_Target=要堆疊的目標,Buff_Num=一次疊加的層數,flag=0=BUFF遞增 1=
	local BUFFLV = Cl_Read_BuffLv( Buff_Target , BuffID , 0 )
	local BUFF_LV = 0
	if BUFFLV == 0 or BUFFLV == nil then
		Addbuff ( Buff_Target  , BuffID , 0 , -1 )
	else
		CancelBuff(	Buff_Target, BuffID )
		if flag == 0 then
			BUFF_LV = BUFFLV + Buff_Num
		elseif flag == 1 then
			BUFF_LV = BUFFLV - Buff_Num
		end
		if BUFF_LV >= 0 then
			Addbuff ( Buff_Target  , BuffID , BUFF_LV , -1 )
		end
	end
end
function Cl_Straight_Line_Move(TargetID,Dis)  ----直線座標追逐 TargetID=被追逐的目標  Dis = 追逐超過距離
	local Ball_Obj = OwnerID()
	local Tx = ReadRoleValue( Ball_Obj, EM_RoleValue_X );
	local Tz = ReadRoleValue( Ball_Obj, EM_RoleValue_Z );
	if TargetID ~= nil then
		local Od = ReadRoleValue( TargetID, EM_RoleValue_Dir );
		local Ox = ReadRoleValue( TargetID, EM_RoleValue_X );
		local Oz = ReadRoleValue( TargetID, EM_RoleValue_Z );
		local Dir =  CalDir( (Tx-Ox),(Tz-Oz) );  
		MoveToFlagEnabled(Ball_Obj, false) ---系統內建的路徑關掉
		WriteRoleValue( Ball_Obj ,EM_RoleValue_IsWalk , 0 )
		local deltaDir = (Dir-Od);
		local X , Y , Z = kg_GetPosRX( TargetID , nil , Dis , 0 , deltaDir )
		LuaFunc_WaitMoveTo( Ball_Obj , X , Y , Z )
	end
end
function Cl_CheckShield_EQ( GUID )--GUID==目標   Type=裝備位置 16=副手
	local DBID = GetItemInfo ( GUID , EM_ItemPacketType_EQ , Type , 0 )
	local DBTYPE = GameObjInfo_Int( DBID , "ArmorType" )
	if DBTYPE == 5 then
		return true
	else
		return false
	end
end
function Cl_RandMove( ObjID , SleepTime , ObjDis , WaitTime ) ---以一個物件為中心隨機移動
	local OwnerID = OwnerID()
	local OwnerID_X , OwnerID_Y , OwnerID_Z = Cl_Read_OwnerXYZ( ObjID )
	local Rand_X = math.random( 0-ObjDis , ObjDis )
	local Rand_Z = math.random( 0-ObjDis , ObjDis )
	if WaitTime == nil then
		MoveDirect( OwnerID , OwnerID_X+Rand_X , OwnerID_Y , OwnerID_Z+Rand_Z )
		sleep ( SleepTime )
	elseif WaitTime ~= nil then
		LuaFunc_WaitMoveTo( OwnerID , OwnerID_X+Rand_X , OwnerID_Y , OwnerID_Z+Rand_Z ) 
		sleep ( SleepTime )
	end
end

function Cl_SetPosFlag()
	SetPosByFlag( OwnerID() , 781112 , 2 )
end
function Cl_FOR_QA_Test(BuffID)  ---毀天滅地有這幾個BUFF-508071--507720--507719
	local OwnerID = OwnerID()
	CancelBuff_NoEvent( OwnerID , BuffID ) ---清除BUFF
end

function Cl_TestBossCastSpell(lv)
	local OwnerID = OwnerID()
	local AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
	CastSpelllv( OwnerID , AttackTarget , 498416 , lv )
end

function Cl_TextBosscastSpell()
	local OwnerID = OwnerID()
	local AttackTarget = 0
	local CombatBegin = 0
	local time = 0
	while true do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == 0 then
				CombatBegin = 1
			end
			if CombatBegin == 1 then
				time = time + 1
				if time%5 == 0 then
					CastSpelllv( OwnerID , AttackTarget , 851570 , 0 )
				end
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == 1 then
			end
		end
	end
end
function Cl_TargetCastSpell(OwnerID,TargetID,Skill,LV)
	say( OwnerID , "OwnerID" )
	say( TargetID , "TargetID" )
	say( TargetID , "["..tostring(Skill).."]Lv="..LV )
	--ScriptMessage( OwnerID , -1 , 2 , "["..tostring(108596).."]:"..GetName( TargetID )  .."[SC_108596_SKILL_851570]" , 2 )
	CastSpelllv( OwnerID , TargetID , Skill , LV )
end

function Cl_GiveAllTextItemBuff()
	local OwnerID = OwnerID()
	GiveBodyItem( OwnerID , 204511 , 99 )
	GiveBodyItem( OwnerID , 204234 , 99 )
	GiveBodyItem( OwnerID , 242891 , 30 )
	GiveBodyItem( OwnerID , 242892 , 30 )
	GiveBodyItem( OwnerID , 242893 , 30 )
	GiveBodyItem( OwnerID , 242894 , 30 )
	GiveBodyItem( OwnerID , 203496 , 99 )
	GiveBodyItem( OwnerID , 207641 , 30 )
	GiveBodyItem( OwnerID , 207650 , 30 )
	GiveBodyItem( OwnerID , 207610 , 30 )
	GiveBodyItem( OwnerID , 207659 , 30 )
	GiveBodyItem( OwnerID , 207601 , 30 )
	GiveBodyItem( OwnerID , 207668 , 30 )
	GiveBodyItem( OwnerID , 200173 , 30 )
	GiveBodyItem( OwnerID , 200192 , 30 )
	GiveBodyItem( OwnerID , 200427 , 30 )
	GiveBodyItem( OwnerID , 200199 , 30 )
	GiveBodyItem( OwnerID , 200277 , 30 )
	GiveBodyItem( OwnerID , 207675 , 30 )
	GiveBodyItem( OwnerID , 200131 , 30 )
	GiveBodyItem( OwnerID , 206874 , 30 )
	GiveBodyItem( OwnerID , 207208 , 30 )
	GiveBodyItem( OwnerID , 206875 , 30 )
	GiveBodyItem( OwnerID , 208478 , 99 )
	GiveBodyItem( OwnerID , 208485 , 99 )
	GiveBodyItem( OwnerID , 203576 , 99 )
end
function Cl_AddAllTextBuff(BuffID)
	local OwnerID = OwnerID()
	Addbuff ( OwnerID , 508329 , 5 , 999 )
end
--設定全身裝備為Z32困_法傷_防具
function Cl_SetEq_Z33_H_DD_Ar()
	YoYo_WriteBodyEQ( 0 , 233715 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 1 , 233277 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 2 , 233718 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 3 , 233716 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 4 , 233279 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 5 , 233914 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 6 , 233278 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 7 , 233717 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 8 , 233360 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 11 , 233801 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 12 , 233801 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 13 , 233802 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 14 , 233802 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	YoYo_WriteBodyEQ( 21 , 227537 , 510281 , 510283 , 510244 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
	

	YoYo_WriteBodyEQ( 15 , 210010 , 510281 , 0 , 0 , 0 , 0 , 0 , 521297 , 521177 , 520607 , 520707 , 20 , 13 )
	YoYo_WriteBodyEQ( 16 , 210010 , 510281 , 0 , 0 , 0 , 0 , 0 , 521297 , 521177 , 520607 , 520707 , 20 , 13 )
	YoYo_WriteBodyEQ( 10 , 210008 , 510281 , 510283 , 510089 , 514328 , 514330 , 510089 , 521357 , 521177 , 520607 , 520567 , 20 , 8 )
end
function Cl_SetEq_Z32_H_HOT_Ar()
	YoYo_WriteBodyEQ( 0 , 233723 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 1 , 233285 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 2 , 233726 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 3 , 233724 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 4 , 233287 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 5 , 225880 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 6 , 233286 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 7 , 233725 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 8 , 233375 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 11 , 233819 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 12 , 233819 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 13 , 233288 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 14 , 233288 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	YoYo_WriteBodyEQ( 21 , 227537 , 510291 , 510286 , 510232 , 514338 , 514333 , 510253 , 521357 , 521237 , 521097 , 521157 , 20 , 8 )
	

	YoYo_WriteBodyEQ( 15 , 210028 , 510291 , 0 , 0 , 0 , 0 , 0 , 521317 , 520707 , 521097 , 521157 , 20 , 13 )

end


function Cl_SetEq_Z32_H_DD1_W()
	YoYo_WriteBodyEQ( 15 , 210003 , 510281 , 0 , 0 , 0 , 0 , 0 , 520807 , 520707 , 521297 , 521177 , 20 , 13 )
	YoYo_WriteBodyEQ( 16 , 210003 , 510281 , 0 , 0 , 0 , 0 , 0 , 520807 , 520707 , 521297 , 521177 , 20 , 13 )
	
	

end

function CL_SetEq_Z32_H_DD1_Ar()
	YoYo_WriteBodyEQ( 0 , 233707 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 1 , 233269 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 2 , 233710 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 3 , 233708 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 4 , 233271 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 5 , 220984 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 6 , 233270 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 7 , 233709 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 8 , 233350 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 11 , 233789 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 12 , 233789 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 13 , 233272 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 14 , 233272 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 21 , 227537 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 521097 , 520567 , 521297 , 521177 , 20 , 8 )
	
	YoYo_WriteBodyEQ( 15 , 210001 , 510281 , 510282 , 510244 , 514328 , 514329 , 510228 , 520807 , 520707 , 521297 , 521177 , 20 , 13 )
end


function CL_SetEq_Z32_H_Magic_Ar()

	YoYo_WriteBodyEQ( 0 , 233719 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 1 , 233281 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 2 , 233722 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 3 , 233720 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 4 , 233283 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 5 , 225876 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 6 , 225852 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 7 , 233721 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 8 , 233365 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 11 , 233813 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 12 , 233813 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 13 , 233284 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 14 , 233284 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )
	YoYo_WriteBodyEQ( 21 , 227537 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 520587 , 520547 , 521357 , 521097 , 20 , 8 )

	YoYo_WriteBodyEQ( 15 , 210025 , 510287 , 510288 , 510254 , 514334 , 514335 , 510289 , 521317 , 520707 , 520827 , 521097 , 20 , 13 )
end


function CL_SetEq_Z32_H_Magic_Wp()
	YoYo_WriteBodyEQ( 15 , 210027 , 510287 , 0 , 0 , 0 , 0 , 0 , 521317 , 520707 , 520827 , 521097 , 20 , 13 )
	YoYo_WriteBodyEQ( 16 , 210010 , 510287 , 0 , 0 , 0 , 0 , 0 , 521317 , 520707 , 520827 , 521097 , 20 , 13 )
	
	
end

function Cl_SetEq_Z32_H_Tank_Ar()
	YoYo_WriteBodyEQ( 0 , 233703 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 1 , 233265 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 2 , 233706 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 3 , 233704 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 4 , 233267 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 5 , 220973 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 6 , 233266 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 7 , 233705 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 8 , 233345 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 11 , 233783 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 12 , 233783 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 13 , 233268 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 14 , 233268 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )
	YoYo_WriteBodyEQ( 21 , 227537 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 8 )

	YoYo_WriteBodyEQ( 15 , 210003 , 510286 , 0 , 0 , 0 , 0 , 0 , 520687 , 521297 , 521097 , 521177 , 20 , 13 )
	YoYo_WriteBodyEQ( 16 , 233727 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520627 , 520247 , 521097 , 521177 , 20 , 10 )
	YoYo_WriteBodyEQ( 10 , 210009 , 510286 , 510082 , 510281 , 510230 , 514328 , 514333 , 520687 , 520627 , 521097 , 521177 , 20 , 8 )
end
