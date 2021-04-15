function Lua_na_wedding_pet_love() --結婚系統寵物判斷
	local Owner = OwnerID() --愛情結晶
	local Pet_Owner = ReadRoleValue(Owner , EM_RoleValue_OwnerGUID) --讀取寵物的主人
		--測試用
		WriteRoleValue( Pet_Owner , EM_RoleValue_PID , Owner ) --讓主人記住寵物，測試指令用
--	local BuffID = {	501760, 501761, 501762, 501763, 501764, 501765, 501766, 501767, 501768, 501769,  --夫的BUFF
--			501830, 501831, 501832, 501833, 501834, 501835, 501836, 501837, 501838, 501839 } --妻的BUFF
	local BuffID = {	501764, 501765, 501766, 501767, 501768, 501769,  --夫的BUFF 5~10
			501834, 501835, 501836, 501837, 501838, 501839 } --妻的BUFF 5~10
	local Time = 0  --夫妻關係BUFF時間計算
	local Time2 = 0 --失去夫妻關係Buff時間計算(5分鐘)
	local Check = 0 --Time2檢查值
	local Pet = ReadRoleValue( Owner , EM_RoleValue_OrgID)
	Hao_Pet_SetModeEx()
	WriteRoleValue( Owner , EM_RoleValue_Register1, 0)  
	WriteRoleValue( Owner , EM_RoleValue_Register2, 0)  --測試指令用，清空倒數用
	while true do
		local PetCount = ReadRoleValue( Owner, EM_RoleValue_Register1)
		local CountClear = ReadRoleValue( Owner, EM_RoleValue_Register2) --測試指令用
		for i = 1 , #BuffID do--檢查主人身上是否有關係技能的BUFF
			if CheckBuff( Pet_Owner , BuffID[i] ) == true then
				Time = PetCount +1
			--	DebugMsg( 0,0, "time1 = "..Time)
				WriteRoleValue( Owner, EM_RoleValue_Register1 , Time )
				Check = 1
				Time2 = 0
				WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	--測試指令用			
				break
			else
				Check = 0
			end
		end
	--	DebugMsg( Pet_Owner , 0 , "Time = "..Time.." , Time2 = "..Time2 )
		if Check == 0 then
			if PetCount ~= 0 then
				Time2 = CountClear +1
				WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	
			--	DebugMsg( 0,0, "time2 = "..Time2)
			end	
		end
		if Time2 == 300 and PetCount ~= 0 then --夫妻分散過遠，五分鐘之後清空寵物的記值
		--	Say( Owner , PetCount)
		--	Say( Owner , Time2)
			WriteRoleValue( Owner, EM_RoleValue_Register1 , 0) 
			Time2 = 0
			WriteRoleValue( Owner, EM_RoleValue_Register2 , Time2 )	--測試指令用
			BeginPlot( Owner , "Lua_na_wdpet0_love" , 0 )-- 重置寵物的觸碰劇情
			Lua_na_lovepet_DelBuff()
			ScriptMessage( Owner , Pet_Owner , 1 , "[SC_LOVEPET_SPEAK6]"  ,0)
			ScriptMessage( Owner , Pet_Owner , 0 , "[SC_LOVEPET_SPEAK6]"  ,0)

		elseif Time2 == 0 and Time == 1800 then --夫妻關係技超過30分鐘
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK3]"  ,0)
			AddBuff( Owner , 623811 , 0 , -1 )
			BeginPlot( Owner , "Lua_na_wdpet1_love" , 0 )-- 寵物的觸碰劇情，給予獎勵

		elseif Time2 == 0 and Time == 3600 then --夫妻關係技超過60分鐘
			AddBuff( Owner , 623812 , 0 , -1 )
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK4]"  ,0)
			BeginPlot( Owner , "Lua_na_wdpet2_love" , 0 )-- 寵物的觸碰劇情，給予獎勵	

		elseif Time2 == 0 and Time == 7200 then --夫妻關係技超過120分鐘
			AddBuff( Owner , 623813 , 0 , -1 )
			ScriptMessage( Owner , Pet_Owner , 3,"["..Pet.."]".."[SC_LOVEPET_SPEAK5]"  ,0)
			BeginPlot( Owner , "Lua_na_wdpet3_love" , 0 )-- 寵物的觸碰劇情，給予獎勵		
		end

		sleep(10)
	end
end



function Lua_na_wdpet0_love() --重置觸碰劇情
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "", 40) 
end



function Lua_na_wdpet1_love() --累計30分鐘之後執行的觸碰劇情
	local Owner = OwnerID()
	DebugMsg( 0 , 0 , "SetPlot Begin" )
	SetPlot( Owner, "touch", "Lua_na_wdpet_love1", 40) 
end

function Lua_na_wdpet2_love() --累計60分鐘之後執行的觸碰劇情
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "Lua_na_wdpet_love2", 40) 
end


function Lua_na_wdpet3_love() --累計120分鐘之後執行的觸碰劇情
	local Owner = OwnerID()
	SetPlot( Owner, "touch", "Lua_na_wdpet_love3", 40) 
end


-------------------------------------------------------------------------------
--三階寵物給予的禮包，對話劇情
-------------------------------------------------------------------------------

--30分鐘
function Lua_na_wdpet_love1() 
	local Owner = OwnerID() --玩家
	local Target = TargetID() --寵物
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	DebugMsg( Owner , 0 , "Pet_Owner = "..Pet_Owner.." , Owner = "..Owner )
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love1_1", Owner , Target) 
	end
end

function Lua_na_wdpet_love1_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = { 241991 };
			[107480] = { 241988 }	}
	local R = DW_Rand(100) --獲得寵物升階物品

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --親愛的主人，目前您與伴侶共同冒險的累積時間為[$VAR1]，為了祈求主人的愛情至久不渝，特別為主人準備了禮物！請問主人是否準備要領取了呢？
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --我要領取

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --資料送出有問題
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--企劃包起來的等待回覆用function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 45 then
			GiveBodyItem( Owner , 241968 , 1 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end


--60分鐘

function Lua_na_wdpet_love2() 
	local Owner = OwnerID() --玩家
	local Target = TargetID() --寵物
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love2_1", Owner , Target) 
	end
end

function Lua_na_wdpet_love2_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = { 241992 };
			[107480] = { 241989}	}
	local R = DW_Rand(100) --獲得寵物升階物品

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --親愛的主人，目前您與伴侶共同冒險的累積時間為[$VAR1]，為了祈求主人的愛情至久不渝，特別為主人準備了禮物！請問主人是否準備要領取了呢？
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --我要領取

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --資料送出有問題
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--企劃包起來的等待回覆用function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 50 then
			GiveBodyItem( Owner , 241968 , 2 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end



 --120分鐘

function Lua_na_wdpet_love3()
	local Owner = OwnerID() --玩家
	local Target = TargetID() --寵物
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	local Pet_Owner = ReadRoleValue(Target , EM_RoleValue_OwnerGUID) 
	if Owner == Pet_Owner then
		CallPlot( Owner , "Lua_na_wdpet_love3_1", Owner , Target) 
	end
end


function Lua_na_wdpet_love3_1( Owner , Target)
	local Time = ReadRoleValue( Target, EM_RoleValue_Register1) --累計的時間
	local CountTime = math.floor( Time / 60 )
	local Pet = ReadRoleValue( Target , EM_RoleValue_OrgID)
	local Gift = {	[107479] = {241993 };
			[107480] = {241990 }	}
	local R = DW_Rand(100) --獲得寵物升階物品

	DialogCreate( Owner , EM_LuaDialogType_Select , "[SC_LOVEPET_SPEAK1][$SETVAR1="..CountTime.."]" ) --親愛的主人，目前您與伴侶共同冒險的累積時間為[$VAR1]，為了祈求主人的愛情至久不渝，特別為主人準備了禮物！請問主人是否準備要領取了呢？
	DialogSelectStr( Owner, "[SC_LOVEPET_SPEAK2]".."["..Gift[Pet][1].."]" ) --我要領取

	if( DialogSendOpen( Owner ) == false ) then
		ScriptMessage( Owner , Owner , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 ) --資料送出有問題
		return 0
	end
	local SelectID = Hsiang_GetDialogResoult( Owner );--企劃包起來的等待回覆用function
	if SelectID == 0 then
		GiveBodyItem( Owner , Gift[Pet][1] , 1 )
		if R <= 70 then
			GiveBodyItem( Owner , 241968 , 3 )
		end
		WriteRoleValue( Target, EM_RoleValue_Register1, 0)
		BeginPlot( Target, "Lua_na_lovepet_DelBuff" , 0 )
		SetPlot( Target, "touch", "", 40) 
	end
	DialogClose( Owner )
end


function Lua_na_lovepet_DelBuff()
	local Owner = OwnerID()
	local Buff = { 623811, 623812 , 623813 }
	for i = 1 , #Buff do
		CancelBuff( Owner , Buff[i])
	end
end


-------------------------------------------------------------------------------
--打開禮包
-------------------------------------------------------------------------------

function Lua_na_love_gift(BoxID, Gift1) --領取獎勵
	local Owner = OwnerID()
	GiveBodyItem( Owner , Gift1 , 1)
--	DelBodyItem( Owner , BoxID, 1 ) 
end


-------------------------------------------------------------------------
--測試指令
-------------------------------------------------------------------------
function Lua_na_wdpet_Count(Time)
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	WriteRoleValue( Pet , EM_RoleValue_Register1 , Time )
	local New = ReadRoleValue(Pet , EM_RoleValue_Register1)
	Say( Pet ,"Count = "..New)
end

function Lua_na_wdpet_CountClear(Time)
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	WriteRoleValue( Pet , EM_RoleValue_Register2 , Time )
	local New = ReadRoleValue( Pet , EM_RoleValue_Register2)
	Say( Pet ,"Clear Value = "..New)
end

function Lua_na_wdpet_CountCheck()
	local Owner = OwnerID()
	local Pet = ReadRoleValue( Owner , EM_RoleValue_PID )
	local Count = ReadRoleValue( Pet , EM_RoleValue_Register1)
	local CountTime1 = math.floor( Count / 60 )
	local CountClear = ReadRoleValue( Pet , EM_RoleValue_Register2)
	local CountTime2 = math.floor( CountClear / 60 )
	Say( Owner, "Love Value ="..CountTime1.."min")
	Say( Owner, "Cancel Love Value ="..CountTime2.."min")
end