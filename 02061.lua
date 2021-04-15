local ObjList = {} --設定難度使用物件編號
ObjList.Boss = {109281,109281,109281}

local Skill = {} --設定難度使用技能與技能等級
Skill.Boss = {
				{ ID = 494014 , LV=0 , CD=30 },
				{ ID = 111111 , LV=10 , CD=9 },
			}

Skill.Buff = {}
Skill.Buff[494333] = {10,0,0}
Skill.Buff[494347] = {10,0,0}
				
local Buff = {}
Buff.VooDoo = {494211,494060}

local FlagID = 781403

function Cl_Z33_1_Boss1_ResetVar(RoomID) --全域變數宣告
	Cl_Z33_1_Boss1_GlobalVar = Cl_Z33_1_Boss1_GlobalVar or {}
	Cl_Z33_1_Boss1_GlobalVar[RoomID] = Cl_Z33_1_Boss1_GlobalVar[RoomID] or {}
	Cl_Z33_1_Boss1_GlobalVar[RoomID].stage = "Standby"
	Cl_Z33_1_Boss1_GlobalVar[RoomID].CtarlAI = OwnerID()
	Cl_Z33_1_Boss1_GlobalVar[RoomID].BossID = 0
end

function Cl_Z33_1_Boss1_CreateBoss(RoomID)
	local x , y , z , dir = DW_Location( FlagID , 0 )--根據旗子位置
	local Boss = CreateObj( ObjList.Boss[Cl_GetDiff(172)] , x , y , z , dir , 1 )
	Cl_Z33_1_Boss1_GlobalVar[RoomID].BossID = Boss
	AddToPartition( Boss , RoomID )
	CallPlot( Boss , "Cl_Z33_1_Boss1_BossAI" , 0 )
	return Boss
end
function Cl_Z33_1_Boss1_CreateDoor(RoomID,Nun) --入口1 出口2
	local x , y , z , dir = DW_Location( FlagID , Nun )--根據旗子位置
	local Door = CreateObj( 107856 , x , y , z , dir , 1 )
	SetModeEx( Door , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( Door , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( Door , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( Door , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( Door , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( Door , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( Door , EM_SetModeType_NotShowHPMP , true ) ----不顯示寫條  
	SetModeEx( Door , EM_SetModeType_Obstruct , true ) ----不顯示寫條  
	AddToPartition( Door , RoomID )
	return Door
end
function Cl_Z33_1_Boss1_CtarlAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	--物件初始化--宣告全域變數
	Cl_Z33_1_Boss1_ResetVar(RoomID)
	--lua產生物件
	local Boss = Cl_Z33_1_Boss1_CreateBoss(RoomID)
	local EntDoor = 0
	local ExitDoor = Cl_Z33_1_Boss1_CreateDoor(RoomID,2)
	--宣告相關變數
	local CombatBegin = false
	while Cl_Z33_1_Boss1_GlobalVar[RoomID].stage ~= "Over" do
		sleep( 10 )
		if Cl_Z33_1_Boss1_GlobalVar[RoomID].stage == "fight" then --戰鬥中
			if CombatBegin == false then
				CombatBegin = true
				--進入戰鬥需產生物件
				ScriptMessage( Boss , 0 , 2 , "[LUA_703138_AI_ONFIGHT]" , 0 )
				EntDoor = Cl_Z33_1_Boss1_CreateDoor(RoomID,1)
			end
		elseif Cl_Z33_1_Boss1_GlobalVar[RoomID].stage == "Dead" then --死亡
			--需刪除物件
			Delobj( EntDoor )
			Delobj( ExitDoor )
			Cl_Z33_1_Boss1_GlobalVar[RoomID].stage = "Over"
		elseif Cl_Z33_1_Boss1_GlobalVar[RoomID].stage == "Reset" then --重置
			if CombatBegin == true then
				CombatBegin = false
				--需刪除物件
				Delobj( Boss )
				Delobj( EntDoor )
			end
			sleep( 30 )
			--重新產生物件
			Boss = Cl_Z33_1_Boss1_CreateBoss(RoomID)
			Cl_Z33_1_Boss1_GlobalVar[RoomID].stage = "Standby"
		end
	end
	--delobj( OwnerID )
end
function Cl_Z33_1_Boss1_BossAI()
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	local AttackTarget = 0
	local CombatBegin = false
	local time = 0
	while Cl_Z33_1_Boss1_GlobalVar[RoomID].stage ~= "Over" do
		sleep( 10 )
		AttackTarget = ReadRoleValue( OwnerID , EM_RoleValue_AttackTargetID )
		if HateListCount( OwnerID ) ~= 0 then
			if CombatBegin == false then
				Cl_Z33_1_Boss1_GlobalVar[RoomID].stage = "fight"
				CombatBegin = true
			end
			if CombatBegin == true and ReadRoleValue( OwnerID , EM_RoleValue_SpellMagicID  ) == 0 then
				time = time + 1
				
			end
		elseif HateListCount( OwnerID ) == 0 then
			if CombatBegin == true then
				Cl_Z33_1_Boss1_GlobalVar[RoomID].stage = "Reset"
				CombatBegin = false
			end
		end
	end
end
function Cl_Z33_1_Boss1_VooDooCall()
	local OwnerID = OwnerID()
	local Count = HateListCount( OwnerID )
	local HateTable = {}
	for i = 0 , (Count-1) , 1 do
		HateTable[i+1] = { 
							GUID = HateListInfo( OwnerID , i , EM_HateListInfoType_GItemID ) ,
							Hate = HateListInfo( OwnerID , i , EM_HateListInfoType_HatePoint )
						  }
	end
	function Cl_Z33_1_Boss1_compare(a,b) --依仇恨值排序，由大到小
		return a.Hate>b.Hate
	end
	table.sort(HateTable,Cl_Z33_1_Boss1_compare)
	for i = 1 , #HateTable , 1 do
		SysCastSpellLv( OwnerID , HateTable[i].GUID , Buff.VooDoo[(i%2)+1] , 0 ) 
	end
end
function Cl_Z33_1_Boss1_BuffCast(SkillID)
	local OwnerID = OwnerID()
	local RoomID = ReadRoleValue( OwnerID , EM_RoleValue_RoomID )
	--Cl_Z33_1_GetDiff()
	SysCastSpellLv( OwnerID , OwnerID , SkillID , Skill.Buff[SkillID][Cl_GetDiff(172)] ) 
end
function Cl_Z33_1_Boss1_CheckOwner()
	if TargetID() == OwnerID() then
		return false
	end
	return true
end
function Cl_Z33_1_Boss1_CheckVooDoo()
	if CheckBuff( TargetID() , 500360 ) == true then
		CancelBuff_NoEvent( TargetID() , 500360 )
	end
end
