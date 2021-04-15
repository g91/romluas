function Hao_Recall_Zone_Npc( Switch , Monsters )	-- 群體招怪

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X , Y , Z , Dir = Lua_Hao_Return_Coordinate(Player)	-- 取座標
	local Cal = (math.pi/180)*(Dir)
	local Npc = {}

	if Type(Monsters) ~= "table" then
		DebugMsg( Player , Room , "Not table" )
		return false
	end

	local Total = #Monsters
	DebugMsg( Player , Room , "Totally Monsters : "..Total )

	local Array = 1
	while true do
		local Matrix
		Matrix = Array^2
		if Matrix >= Total then
--			DebugMsg( Player , 0 , "Array = "..Array.." * "..Array )
			break
		end
		Array = Array + 1
	end

	if Switch == 0 then	-- 產生怪物
		local Distance = 150	-- 怪物間的間距
		for Count = 1 , #Monsters , 1 do
			local Point = 10	-- 單一個圓上有幾個怪物
			local Round = math.ceil( Count/Point )	-- 怪物共圍成幾個同心圓
			local Level = GameObjInfo_Int( Monsters[Count] , "Level" )	-- 讀取資料庫中設定的等級，不包含隨機區間部分
			Npc[Count] = CreateObj( Monsters[Count] , X-Distance*Round*math.cos(math.pi*2*(Count/Point)) , Y , Z+Distance*Round*math.sin(math.pi*2*(Count/Point)) , Dir , 1 )
			WriteRoleValue( Npc[Count] , EM_RoleValue_LV , Level )	-- 設定制式化的測試 Level
			SetModeEx( Npc[Count] , EM_SetModeType_Show , true )	-- 顯示
			SetModeEx( Npc[Count] , EM_SetModeType_Drag , true )		-- 水平
			SetModeEx( Npc[Count] , EM_SetModeType_Searchenemy , false )	-- 索敵
			SetModeEx( Npc[Count] , EM_SetModeType_Mark , true )		-- 標記
			SetModeEx( Npc[Count] , EM_SetModeType_Revive , false )	-- 重生
			SetModeEx( Npc[Count] , EM_SetModeType_Strikback , true )	-- 反擊
			SetModeEx( Npc[Count] , EM_SetModeType_Fight , true )		-- 砍殺
			SetModeEx( Npc[Count] , EM_SetModeType_Gravity , true )	-- 重力
			SetModeEx( Npc[Count] , EM_SetModeType_Move , true )	-- 移動
			SetModeEx( Npc[Count] , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
			CallPlot( Npc[Count] , "Hao_Recall_Zone_Npc_Counter" , Npc[Count] )	-- 計數器
			SetPlot( Npc[Count] , "dead" , "Hao_Recall_Zone_Npc_Dead" , 0 )			
			AddToPartition( Npc[Count] , Room )
		end
	elseif Switch == 1 then	-- 刪除怪物
		local SearchNpc = SetSearchAllNPC( Room )
		for i = 1 , SearchNpc , 1 do
			local Result = GetSearchResult()
			local OrgID = ReadRoleValue( Result , EM_RoleValue_OrgID )
			for j = 1 , #Monsters , 1 do
				if OrgID == Monsters[j] then
					DelObj(Result)
					break
				end
			end
		end
	elseif Switch == 2 then
		local Distance = 150	-- 怪物間的間距
		for Line = 0 , Array-1 , 1 do	-- 直排
			for Row = 0 , Array-1 , 1 do	-- 橫排
				if #Monsters > 0 then
					local CreateID = table.remove( Monsters , #Monsters )
				--	local NewX = X + ( Distance*Line*math.cos(Cal) )	-- 直排
					local NewX = X + Distance*Line	-- 直排
					local NewZ = Z - Distance*Row	-- 橫排
					local Level = GameObjInfo_Int( CreateID , "Level" )	-- 讀取資料庫中設定的等級，不包含隨機區間部分
					local Npc = CreateObj( CreateID , NewX , Y , NewZ , Dir , 1 )
					WriteRoleValue( Npc , EM_RoleValue_LV , Level )	-- 設定制式化的測試 Level
					SetModeEx( Npc , EM_SetModeType_Show , true )	-- 顯示
					SetModeEx( Npc , EM_SetModeType_Drag , true )		-- 水平
					SetModeEx( Npc , EM_SetModeType_Searchenemy , false )	-- 索敵
					SetModeEx( Npc , EM_SetModeType_Mark , true )		-- 標記
					SetModeEx( Npc , EM_SetModeType_Revive , false )	-- 重生
					SetModeEx( Npc , EM_SetModeType_Strikback , true )	-- 反擊
					SetModeEx( Npc , EM_SetModeType_Fight , true )		-- 砍殺
					SetModeEx( Npc , EM_SetModeType_Gravity , true )	-- 重力
					SetModeEx( Npc , EM_SetModeType_Move , true )	-- 移動
					SetModeEx( Npc , EM_SetModeType_ShowRoleHead , true )	-- 頭像框
					CallPlot( Npc , "Hao_Recall_Zone_Npc_Counter" , Npc )	-- 計數器
					SetPlot( Npc , "dead" , "Hao_Recall_Zone_Npc_Dead" , 0 )					
					AddToPartition( Npc , Room )
				else
					break
				end
			end
		end
	end
end

function Hao_Recall_Zone_Npc_Dead()

	local Monster = OwnerID()
	local Player = TargetID()
	local CountBuff = BuffCount( Monster )	-- 清除怪物身上的Dot，避免持續性的仇恨	
	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )	-- 資料庫ID
	local Time = ReadRoleValue( Monster , EM_RoleValue_PID )	-- 殺死怪物花費的時間
	local HP = ReadRoleValue( Player , EM_RoleValue_HP )	-- 當前HP
	local MaxHP = ReadRoleValue( Player , EM_RoleValue_MaxHP )	-- 最大HP
	local MaxMP = ReadRoleValue( Player , EM_RoleValue_MaxMP )	-- 最大MP
	local MaxSP = ReadRoleValue( Player , EM_RoleValue_MaxSP )	-- 最大SP
	ScriptMessage( Monster , 0 , 0 ,  "["..OrgID.."]".." , Your HP : "..HP.." , Killing time : "..String.format( "%.1f" , Time / 10 ) , C_SYSTEM )
	for Pos = CountBuff-1 , 0 , -1 do
		local BodyBuff = BuffInfo( Monster , Pos , EM_BuffInfoType_BuffID )	-- 讀取該Buff的ID
		CancelBuff_NoEvent( Monster , BodyBuff )
	end
	ClearHateList( Monster , -1 )	-- 清空仇恨列表	
	WriteRoleValue( Player , EM_RoleValue_HP , MaxHP )	-- 恢復玩家HP
	WriteRoleValue( Player , EM_RoleValue_MP , MaxMP )	-- 恢復玩家MP
	WriteRoleValue( Player , EM_RoleValue_SP , MaxSP )	-- 恢復玩家SP
	CallPlot( Monster , "Hao_Recall_Zone_Npc_Dead_2" , Monster )	-- 重置Npc資料
	return false
end

function Hao_Recall_Zone_Npc_Dead_2(ObjID)

	local MaxHP = ReadRoleValue( ObjID , EM_RoleValue_MaxHP )	-- 最大HP
	local Room = ReadRoleValue( ObjID , EM_RoleValue_RoomID )
	DelFromPartition(ObjID)
	Sleep(50)
	ReSetNPCInfo(ObjID)	-- 重設NPC資料
	ReCalculate(ObjID)	-- 重設NPC移動資訊
	SetStopAttack(ObjID)	-- 關閉攻擊	
	WriteRoleValue( ObjID , EM_RoleValue_HP , MaxHP )	-- 補滿ObjID的血量
	CallPlot( ObjID , "Hao_Recall_Zone_Npc_Counter" , ObjID )
	AddToPartition( ObjID , Room )	-- 重新加入分割區
end

function Hao_Recall_Zone_Npc_Counter(Monster)

	local OrgID = ReadRoleValue( Monster , EM_RoleValue_OrgID )	-- 資料庫ID
	local Time = 0
	local List

	while true do
	--	List = HateListCount(Monster)	-- 取得仇恨清單
		if ReadRoleValue( Monster , EM_RoleValue_IsAttackMode ) ~= 0 then
	--	if List ~= 0 then	-- 當Monster的仇恨列表內有名單時則
			Time = Time + 1
		else	-- Monster離開戰鬥後的重置
			Time = 0
		end
		WriteRoleValue( Monster , EM_RoleValue_PID , Time )
		sleep(1)
	end
end

function Hao_Recall_Zone_26_Npc( Switch )	-- 群體招怪

	local Monsters = {
				107692 , 107693 , 107694 , 107695 , 107739 , 107740 , 107741 , 107742 , 107744 , 107745 ,
				107748 , 107736 , 107751 , 107696 , 107697 , 107704 , 107705 , 107743 , 107750 , 107706 ,
				107707 , 107708 , 107700 , 107701 , 107702 , 107703 , 107769 , 107772 , 107773 , 107709 , 
				107710 , 107711 , 107712 , 107713 , 107714 , 107715 , 107716 , 107717 , 107718 , 107719 ,
				107733 , 107735 , 107720 , 107721 , 107722 , 107732 , 107794 , 107724 , 107725 , 107726 ,
				107727 , 107728 , 107729 , 107730 , 107731 , 107746 , 107747 , 107785 , 107749 , 107825
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end

function Hao_Recall_Zone_27_Npc( Switch )	-- 群體招怪

	local Monsters = {
				103377 , 107895 , 107896 , 107974 , 107975 , 107899 , 107900 , 107901 , 107902 , 107723 ,
				107904 , 107905 , 107976 , 108142 , 107917 , 107918 , 107919 , 108147 , 108171 , 108172 ,
				108173 , 108174 , 107891 , 107892 , 107894 , 107897 , 107907 , 107908 , 107909 , 107910 ,
				107973 , 107911 , 107912 , 107915 , 107916 , 107925 , 107926 , 107927 , 107893 , 107921 ,
				107922 , 107924 , 107923 , 107928 , 107929 , 107930 , 107931 , 107932 , 107933 , 108106 ,
				108107 , 108108 , 108109 , 108110 , 108111 , 108146 , 108135 , 108136
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end

function Hao_Recall_Zone_28_Npc( Switch )	-- 群體招怪

	local Monsters = {
				106877 ,
				106878 ,
				107182 ,
				107345 ,
				107408 ,
				107447 ,
				107906 ,
				107936 ,
				107937 ,
				107938 ,
				107939 ,
				107940 ,
				107941 ,
				107942 ,
				107943 ,
				107944 ,
				107945 ,
				107946 ,
				107947 ,
				107948 ,
				107949 ,
				107950 ,
				107951 ,
				107952 ,
				107953 ,
				107954 ,
				107955 ,
				107956 ,
				107969 ,
				107970 ,
				107971 ,
				107972 ,
				108118 ,
				108183 ,
				108184 ,
				108185 ,
				108186 ,
				108187 ,
				108188 ,
				108189 ,
				108190 ,
				108191 ,
				108194 ,
				108195 ,
				108196 ,
				108197 ,
				108199 ,
				108200 ,
				108201 ,
				108202 ,
				108204 ,
				108205 ,
				108206 ,
				108207 ,
				108229 ,
				108230 ,
			}
	Hao_Recall_Zone_Npc( Switch , Monsters )
end