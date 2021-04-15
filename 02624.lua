function Lua_Hao_WorldBoss_EasyMode(SN)	-- 編號
	local BonusFlag = 546926
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_04]", C_YELLOW );--恭喜完成簡單模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_04]", C_YELLOW );--恭喜完成簡單模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--等級
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "EasyMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_NormalMode(SN)	-- 編號
	local BonusFlag = 546927
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_03]", C_YELLOW );--恭喜完成正常模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_03]", C_YELLOW );--恭喜完成正常模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--等級
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "NormalMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_HardMode(SN)	-- 編號
	local BonusFlag = 546928
	local BossList = {}
		BossList[1] = Global_WorldBoss_SN1
		BossList[2] = Global_WorldBoss_SN2
	if BossList[SN]==nil then
		return false;
	end
	if CheckFlag( BossList[SN] , BonusFlag ) == true then
		ScriptMessage( BossList[SN], 0, 1, "[SC_WORLDBOSS_02]", C_YELLOW );--恭喜完成困難模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_02]", C_YELLOW );--恭喜完成困難模式
		ScriptMessage( BossList[SN], 0, 0, "[SC_WORLDBOSS_05][$SETVAR1="..Global_WorldBoss_HateListData[BossList[SN]].."]", C_YELLOW );--等級
		DesignLog( BossList[SN] , ReadRoleValue(BossList[SN],EM_RoleValue_OrgID) , "HardMode" );
		SetFlag( BossList[SN] , BonusFlag , 0 )
		return true
	end
	return false
end

function Lua_Hao_WorldBoss_Store()

	local Owner = OwnerID()	-- Player
	local Target = TargetID()	-- Npc

--	LoadQuestOption( Owner )
	AdjustFaceDir( Target , Owner , 0 ) --面向
	CloseShop( Target )
	CloseSpeak( Owner )
	SetSpeakDetail( Owner , "[SC_WORLDBOSS_01]"   )	-- 你好，冒險者，我正在找尋一種名為[241706]的稀有物品。
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_00]" , "Lua_Hao_WorldBoss_Store_01", 5 )	-- 鎧甲商店選項
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_01]" , "Lua_Hao_WorldBoss_Store_02", 5 )	-- 鎖甲商店選項
	AddSpeakOption( Owner , Target , "[SYS_ARMORTYPE_02]" , "Lua_Hao_WorldBoss_Store_03", 5 )	-- 皮甲商店選項
	AddSpeakOption( Owner , Target , "[ARMOR_CLOTHTYPE_01][SYS_ARMORTYPE_03]" , "Lua_Hao_WorldBoss_Store_04", 5 )	-- 魔法類布衣商店選項
	AddSpeakOption( Owner , Target , "[ARMOR_CLOTHTYPE_02][SYS_ARMORTYPE_03]" , "Lua_Hao_WorldBoss_Store_05", 5 )	-- 治療類布衣商店選項
	AddSpeakOption( Owner , Target , "[EQUIP_NECK][AND][EQUIP_BACK]" , "Lua_Hao_WorldBoss_Store_06", 5 )	-- 項鍊與披風商店選項
	AddSpeakOption( Owner , Target , "[EQUIP_RING][AND][EQUIP_EARRING]" , "Lua_Hao_WorldBoss_Store_07", 5 )	-- 戒指與耳環商店選項
end

function Lua_Hao_WorldBoss_Store_01()	-- 鎧甲商店選項
	SetShop( TargetID() , 600399 , "" )	-- 傳奇之證商店 - 鎧甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_02()	-- 鎖甲商店選項
	SetShop( TargetID() , 600400 , "" )	-- 傳奇之證商店 - 鎖甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_03()	-- 皮甲商店選項
	SetShop( TargetID() , 600401 , "" )	-- 傳奇之證商店 - 皮甲
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_04()	-- 魔法類布衣商店選項
	SetShop( TargetID() , 600402, "" )	-- 傳奇之證商店 - 布衣法傷
	CloseSpeak( OwnerID() )
	OpenShop()
end


function Lua_Hao_WorldBoss_Store_05()	-- 治療類布衣商店選項
	SetShop( TargetID() , 600403 , "" )	-- 傳奇之證商店 - 布衣治療
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_06()	-- 項鍊與披風商店選項
	SetShop( TargetID() , 600404 , "" )	-- 傳奇之證商店 - 項鍊、披風
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Store_07()	-- 戒指與耳環商店選項
	SetShop( TargetID() , 600405 , "" )	-- 傳奇之證商店 - 戒指、耳環
	CloseSpeak( OwnerID() )
	OpenShop()
end

function Lua_Hao_WorldBoss_Create(Bonus)

	local Boss = math.floor( Bonus / 10 )
	local LV = Bonus % 10

	local Player = OwnerID()
	local BonusLV = { 546926 , 546927 , 546928 }	-- 低 中 高
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjID
	local X , Y , Z , Dir  =	ReadRoleValue( Player , EM_RoleValue_X ) ,
				ReadRoleValue( Player , EM_RoleValue_Y ) ,
				ReadRoleValue( Player , EM_RoleValue_Z ) ,
				ReadRoleValue( Player , EM_RoleValue_DIR )

	if Global_WorldBoss_SN1 == nil then  
		Global_WorldBoss_SN1 = 0
	end
	if Global_WorldBoss_SN2 == nil then
		Global_WorldBoss_SN2 = 0
	end

	if Boss == 0 then
		ObjID = CreateObj( 106954 , X , Y , Z , Dir , 1 )
		Global_WorldBoss_SN1 = ObjID
	elseif Boss == 1 then
		ObjID = CreateObj( 106955 , X , Y , Z , Dir , 1 )
		Global_WorldBoss_SN2 = ObjID
	end

	SetFlag( ObjID , BonusLV[LV] , 1 )
	SetModeEx( ObjID , EM_SetModeType_Mark , true )			--標記
	SetModeEx( ObjID , EM_SetModeType_Gravity , true )			--重力
	SetModeEx( ObjID , EM_SetModeType_DisableRotate , false )		--關閉自動面向
	SetModeEx( ObjID , EM_SetModeType_Show , true )			--顯示
	SetModeEx( ObjID , EM_SetModeType_Move , true )			--移動
	SetModeEx( ObjID , EM_SetModeType_Drag , true )			--水平
	SetModeEx( ObjID , EM_SetModeType_Searchenemy , false )		--索敵
	SetModeEx( ObjID , EM_SetModeType_Fight , true )			--砍殺
	MoveToFlagEnabled( ObjID , false )					--關閉巡邏劇情
	AddToPartition( ObjID , Room )
end

function Lua_DW_WBLvCheck_Table(HateList,Boss)--檢查仇恨表內的玩家等級程度，並設立旗標以供掉落表判斷
	if type(HateList)~="table" then
		return
	end

	if Boss == nil then	-- 2015.05.05 新增此參數，修正以中控器執行此函式時，擊殺Boss後，無法取得傳奇之證的問題。(阿浩)
		Boss = OwnerID();
	end

--	local Boss=OwnerID();
	local Highest=Global_WorldBoss_HateListData[Boss] or 0;
	local Lv
	for SN,Player in pairs(HateList) do
		Lv=ReadRoleValue(Player,EM_RoleValue_Lv);
		if Lv>Highest then
			Highest=Lv;
		end
	end
	local BossLv=ReadRoleValue(Boss,EM_RoleValue_Lv)
	local CheckVar=2
	if BossLv-Highest>CheckVar then
		SetFlag(Boss,546928,1);
		SetFlag(Boss,546927,0);
		SetFlag(Boss,546926,0);
	elseif BossLv-Highest>=-1*CheckVar then
		SetFlag(Boss,546928,0);
		SetFlag(Boss,546927,1);
		SetFlag(Boss,546926,0);
	else
		SetFlag(Boss,546928,0);
		SetFlag(Boss,546927,0);
		SetFlag(Boss,546926,1);
	end
	Global_WorldBoss_HateListData[Boss]=Highest;
end
function Lua_DW_WBGUIDRecord(SN)--記錄世界王的GUID, 並重設其旗標
	Global_WorldBoss_HateListData=Global_WorldBoss_HateListData or {}
	for GUID,Lv in pairs(Global_WorldBoss_HateListData) do
		if CheckID(GUID)==false then
			Global_WorldBoss_HateListData[GUID]=nil;
		end
	end
	local BossGUID=OwnerID();
	Global_WorldBoss_HateListData[BossGUID]=0
	SetFlag(BossGUID,546926,0);
	SetFlag(BossGUID,546927,0);
	SetFlag(BossGUID,546928,0);
	local RecordFunction={};
	RecordFunction[1]=	function()
					Global_WorldBoss_SN1=BossGUID;
				end
	RecordFunction[2]=	function()
					Global_WorldBoss_SN2=BossGUID;
				end
--設定全域變數
	RecordFunction[SN]();
	return;
end
function Lua_DW_WBGUIDSwitch(SN,Corpse)--有時候，撿寶的並非實體，而是另外的掉落物，透過它來將旗標記錄轉換，注意，一切在Boss身上應有記錄都要照常進行
	local Boss;
	if SN==1 then
		Boss=Global_WorldBoss_SN1;
		Global_WorldBoss_SN1=Corpse;
	elseif SN==2 then
		Boss=Global_WorldBoss_SN2;
		Global_WorldBoss_SN2=Corpse;
	end

	local Highest=Global_WorldBoss_HateListData[Boss];
	Global_WorldBoss_HateListData[Boss]=nil;
	Global_WorldBoss_HateListData[Corpse]=Highest;
	local FlagBaseNumber=546926;
	for PlusNum=0,2,1 do
		if CheckFlag(Boss,FlagBaseNumber+PlusNum)==true then
			SetFlag(Corpse,FlagBaseNumber+PlusNum,1);
		end
	end
end