-----通用野外怪物隨機強化效果通用函式------------
function Cl_ZoneMonster_RandBuff() ---將此函示掛載物件產生劇情上
	local OwnerID = OwnerID()
	local Buff_Table = { 620148 , 620149 , 620150 , 620151 } ---從四種不同的BUFF效果隨機選取，這裡是一個TABLE
	local RandBuff = DW_Rand ( 100 )
	if RandBuff <= 5 then--1.2.3.4.5
		AddBuff( OwnerID , Buff_Table[1] , 0 , -1 )	
	elseif RandBuff > 35 and RandBuff <= 40 then--36.37.38.39.40
		AddBuff( OwnerID , Buff_Table[2] , 0 , -1 )	
	elseif RandBuff > 60 and RandBuff <= 65 then--61.62.63.64.65
		AddBuff( OwnerID , Buff_Table[3] , 0 , -1 )	
	elseif RandBuff > 95 and RandBuff <= 100 then--96.97.98.99.100
		AddBuff( OwnerID , Buff_Table[4] , 0 , -1 )	
	end
	for i = 1 , table.getn( Buff_Table ) , 1 do --檢查TABLE內的所有編號，是否身上有存在任何一個
		if CheckBuff ( OwnerID , Buff_Table[i] ) == true then
			SetPlot( OwnerID , "dead" , "Cl_ZoneMonster_dead" , 0 ) ---當身上有TABLE內任一個BUFF時，給予怪物死亡劇情
			break
		end
	end
end
function Cl_RandBuff_For_ObjID(ZoneID) ---存放區域所需要產生的神祕袋子，每個袋子各有不同掉寶表，當開啟新的任務區域，則在底下新增區域編號
	local Obj_Table = {} --這裡為陣列
	Obj_Table[937] = 107217 ---937=測試區
	Obj_Table[23] = 107217 ---Z23 奇斯特拉艾恩那
	return Obj_Table[ZoneID]
end
function Cl_ZoneMonster_dead()---怪物死亡劇情掉落物件袋子
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID ) --記錄起怪物所處在的區域ZoneID
	local RoomID = ReadRoleValue ( OwnerID , EM_RoleValue_RoomID )
	local hate_Num = HateListCount( OwnerID ) --取出怪物仇恨列表數量
	local Obj_Table = Cl_RandBuff_For_ObjID(ZoneID) ---取出怪物所在區域，專屬的神祕袋子ID
	local hateID = 0
	local Luck = 0
	for i = 0 , hate_Num-1 , 1 do
		hateID = HateListInfo( OwnerID , i , EM_HateListInfoType_GItemID ) --依照順序取出仇恨列表物件ID
		if ReadRoleValue( hateID , EM_RoleValue_IsPlayer ) == 1 then ---檢查物件順利是否為玩家，避免掉NPC所殺死的怪物也會掉落袋子
			Luck = DW_Rand(100)
			if Luck >= 75 and Luck <= 80 then ---當達成機率到達，則產生神秘袋子
				local Npc_X , Npc_Y , Npc_Z = Cl_Read_OwnerXYZ( OwnerID )
				local mob = CreateObj( Obj_Table , Npc_X, Npc_Y , Npc_Z , 0 , 1 )
				SetModeEx( mob , EM_SetModeType_Mark, true)			---可點選(否)
				SetModeEx( mob , EM_SetModeType_Obstruct, true) 			--阻擋(是)
				SetModeEx( mob , EM_SetModeType_Strikback, false) ---反擊
				SetModeEx( mob , EM_SetModeType_Move, false) ---移動	
				SetModeEx( mob , EM_SetModeType_Fight, false) ---可砍殺
				SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false)---是否被搜尋(否)
				SetModeEx( mob , EM_SetModeType_Searchenemy, false)			--索敵(否)	
				SetModeEx( mob , EM_SetModeType_NotShowHPMP, true) --
				WriteRoleValue ( mob , EM_RoleValue_LiveTime , 60 ) ---避免場上袋子數量太多，設定生存時間
				WriteRoleValue ( mob , EM_RoleValue_Register1 , hateID ) ---在物件內紀錄開怪者
				AddToPartition( mob , RoomID )
				break ---只需要執行一次，所以離開整個迴圈
			end	
		end
	end
end
function Cl_ZoneMonster_TreasureBox()  --神秘袋子產生劇情
	local OwnerID = OwnerID()
	local Right_Time = 0
	SetPlot( OwnerID ,"touch", "Cl_ZoneMonster_TreasureBox_true" ,40 )  --給予神秘袋子觸碰劇情，讓玩家撿取內容物
	SetCursorType( OwnerID , eCursor_Pickup )
	while ReadRoleValue ( OwnerID , EM_RoleValue_PID ) ~= 1 do ---當PID內等地值不等於1才執行迴圈
		sleep ( 10 )
		Right_Time = Right_Time + 1 ---這個時間內每秒+1，目的是當開怪者遲遲不撿取時，可讓給其他玩家撿取
		if Right_Time >= 40 then
			WriteRoleValue ( OwnerID , EM_RoleValue_PID , 1 )
		end
	end
end
function Cl_ZoneMonster_TreasureBox_true() ---玩家的撿取劇情
	local OwnerID = OwnerID()
	local TargetID = TargetID()
	if ReadRoleValue ( TargetID , EM_RoleValue_PID ) ~= 1 then ---先檢查撿取權
		if ReadRoleValue ( TargetID , EM_RoleValue_Register1 ) == OwnerID then ---若綁定檢取權時間內，檢查撿取玩家是否為開怪者
			KillID( OwnerID , TargetID )
		else
			ScriptMessage ( OwnerID , OwnerID , 1 , "[SC_THIS_NOT_YOU_ITEM]" , 0 ) ---若綁定檢取權時間內，則給予玩家訊息
		end
	else ----撿取權時間過後，開放給所有玩家撿取
		KillID( OwnerID , TargetID )
	end
end