--Q1.利用for in pairs與table的結構計算學生的分數平均
--table中必須出現名稱與分數 比如 Score["Tom"] = 70
--學生共有4名 且分數如下
--Tom 70分
--Ken 65分
--Bill 15分
--Hank  33分

function Lua_Hao_20110825_HomeWork_1()

	local Player = OwnerID()
	local Avg = 0
	local Score = {}
	Score["Tom"] = 70
	Score["Ken"] = 65
	Score["Bill"] = 15
	Score["Hank"] = 33

	for Name , List in pairs(Score) do
		Avg = Avg + List
	end
	Say( OwnerID() , "Avg = "..Avg/4 )
end

--Q2.在一個死亡劇情中，利用table判斷不同怪物給予擊殺者不同的獎勵。
--幼狼(100054 ) 給予 魔法硬麵包(207635)
--狼(100055) 給予 手工黑麵包(207636)
--小熊(100056) 給予 鬆軟白麵包(207637)
--熊(100063) 給予 香酥現烤麵包(207638)

function Lua_Hao_20110825_HomeWork_2_1()

	SetPlot( OwnerID() , "dead" , "Lua_Hao_20110825_HomeWork_2_2" , 0 )
end

function Lua_Hao_20110825_HomeWork_2_2()

	local Obj = OwnerID()--怪物
	local Killer = TargetID()--擊殺者
	local OrgID = ReadRoleValue( Obj , EM_RoleValue_OrgID )--物件的資料庫編號
	--以下為作業範圍

	local Monster = {}
	Monster[100054] = 207635
	Monster[100055] = 207636
	Monster[100056] = 207637
	Monster[100063] = 207638

	Givebodyitem( Killer , Monster[OrgID] , 1 )
end

--Q3.從1~10中取得3個隨機不重複的數字(可使用table.insert或table.remove實作)

function Lua_Hao_20110825_HomeWork_3_1()	--  X 中取 Y 個隨機不重複數，X需 >= Y

	Lua_Hao_20110825_HomeWork_3_2( 10 , 3 )
end

function Lua_Hao_20110825_HomeWork_3_2( Count , Probability )

	local Player = OwnerID()
	local List , Answer = {} , {}

	for i = 1 , Count , 1 do
		table.insert( List , i )
	end

	for i = 1 , Probability , 1 do
		Answer[i] = table.remove( List , math.random(table.getn(List)) )
		Say( Player , "Answer"..i.." = "..Answer[i] )
	end
end

--Q4.用table寫一個依照等級給予物品的禮包。(不得使用if與迴圈)
--1 ~ 20級 給予207635 魔法硬麵包
--21~ 40級 給予200123 酸酪果
--41~ 60級 給予200151 基礎療傷藥
--61~ 80級 給予201710 黃銅砂
--81~ 100級 給予201749 輕木材
--使用此指令givebodyitem( Player, ItemID, 1 )

function Lua_Hao_20110825_HomeWork_4()

	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )

	local Select = {}
	Select[1] = 207635
	Select[2] = 200123
	Select[3] = 200151
	Select[4] = 201710
	Select[5] = 201749

	Givebodyitem( Player , Select[math.ceil(Lv/20)] , 1 )
end

--1.請建出火堆10個(100292)，始終在你周圍圍成一個半徑50的圓，當你在行走時，該火堆必須跟著你移動，並保持圓形。
--步驟1 在中心點(玩家/NPC) 周圍產生火堆
--步驟2 當中心點移動時 火堆保持相對陣型移動

function Lua_Hao_Home_Work_Q5( ObjCount )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Player , EM_RoleValue_X )
	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Range = 50
	local ObjX , ObjZ = {} , {}
	local ObjID = 100292
	local Npc = {}

	for i = 1 , ObjCount , 1 do
		ObjX[i] = X - Range * math.cos(math.pi*2*(i/ObjCount))
		ObjZ[i] = Z + Range * math.sin(math.pi*2*(i/ObjCount))
		Npc[i] = CreateObj( ObjID , ObjX[i] , Y , ObjZ[i] , 0 , 1 )
		MoveToFlagEnabled( Npc[i] , false )
		AddToPartition( Npc[i] , Room )
		WriteRoleValue( Npc[i] , EM_RoleValue_IsWalk , 0 )
		CallPlot( Npc[i] , "Lua_Hao_Home_Work_Q5_1" , Player , Range , X , Y , Z , i , ObjCount )
	end
end
  
function Lua_Hao_Home_Work_Q5_1( Player , Range , X , Y , Z , i , ObjCount )

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjX , ObjZ
	local Npc = OwnerID()

	while true do
		Sleep(1)
		local NewX = ReadRoleValue( Player , EM_RoleValue_X )
		local NewZ = ReadRoleValue( Player , EM_RoleValue_Z )
		if NewX ~= X or NewZ ~= Z then
			ObjX = NewX - Range * math.cos(math.pi*2*(i/ObjCount))
		  	ObjZ = NewZ + Range * math.sin(math.pi*2*(i/ObjCount))
			MoveDirect( Npc , ObjX , Y , ObjZ )
			X = NewX
			Z = NewZ
		end
	end
end

--2.承上題，加入此功能，火堆創建時，火堆沿著你半徑50作順時針旋轉換位子的動作，
--當你移動時，火堆不旋轉，移動結束停止時，旋轉的動作改為逆時針，以此類推.....
--步驟1 承上題 當中心點沒有移動時  火堆會以中心點為中心旋轉
--步驟2 當中心點移動後 改變旋轉的方向

function Lua_Hao_Home_Work_Q6( ObjCount )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Player , EM_RoleValue_X )
	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Range = 50
	local ObjX , ObjZ , Space = {} , {} , {}
	local ObjID = 100292
	local Npc = {}

	for i = 1 , ObjCount , 1 do
		ObjX[i] = X - Range * math.cos(math.pi*2*(i/ObjCount))
		ObjZ[i] = Z + Range * math.sin(math.pi*2*(i/ObjCount))
		Space[i] = { ObjX[i] , Y , ObjZ[i] }
	end

	for i = 1 , ObjCount , 1 do
		Npc[i] = CreateObj( ObjID , Space[i][1] , Y , Space[i][3] , 0 , 1 )
		MoveToFlagEnabled( Npc[i] , false )
		AddToPartition( Npc[i] , Room )
		WriteRoleValue( Npc[i] , EM_RoleValue_IsWalk , 0 )
		CallPlot( Npc[i] , "Lua_Hao_Home_Work_Q6_2" , Player , Range , Space , X , Y , Z , i , ObjCount )
	end
end
  
function Lua_Hao_Home_Work_Q6_2( Player , Range , Space , X , Y , Z , i , ObjCount )
--	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjX , ObjZ
	local Npc = OwnerID()
	local Step = i
--	local Select = 0
--	Say( Npc , "i = "..i )

	while true do
		local NewX = ReadRoleValue( Player , EM_RoleValue_X )
		local NewZ = ReadRoleValue( Player , EM_RoleValue_Z )
		if NewX == X and NewZ == Z then
		--	for j = 1 , #Space , 1 do
				Step = Step + 1
				if Step > ObjCount then
					Step = 1
				end
				MoveDirect( Npc , Space[Step][1] , Y , Space[Step][3] )
				if i == 1 then
				--	DebugMsg( 0 , 0 , "X = "..Space[Step][1].." Y = "..Y..", Z  ="..Space[Step][3] )
				--	DebugMsg( 0 , 0 , "Step = "..Step )
				--	Select = Select + 1
				--	DebugMsg( 0 , 0 , "Select = "..Select )
					Say( Npc , Step )
				end

		--	end
		else
			Lua_Hao_Home_Work_Q5_1( Player , Range , X , Y , Z , i , ObjCount )
		--	Lua_Hao_HW_Q6_Clear()
		--	DebugMsg( 0 , 0 , "Break" )
			break
		end
		Sleep(30)
	end
end

function Lua_Hao_HW_Q6_Clear()

	Lua_Hao_NPCofAll_Clear(100292 , 500 )
end

----------------------------------------------------------------------------------------------------------------------------------------
function lua_nehelia_flower_S_1()	-- 判斷敵後方

	SetPlot( OwnerID() ,"touch" , "lua_nehelia_flower_S_2" , 50 )
end


function lua_nehelia_flower_S_2()

	local Player = OwnerID()
	local Npc = TargetID()
	local PDir = ReadRoleValue( Player , EM_RoleValue_Dir )
	local PZ =  ReadRoleValue( Player , EM_RoleValue_Z )
	local NDir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local NZ =  ReadRoleValue( Npc , EM_RoleValue_Z )
	local Angle = 30
	local Dir = PDir - NDir
	local Dis = NZ - PZ
	DebugMsg( 0 , 0 , "PDir = "..PDir.." NDir = "..NDir.." Angle = "..Dir.." PZ = "..PZ.." NZ = "..NZ.." Dis = "..Dis )
	local Step = 0

	if NZ < 0 and PDir - NDir <= Angle and PDir - NDir >= -Angle and NZ - PZ < 0 then	-- 判斷視角
		Step = 1
	elseif NZ > 0 and PDir - NDir <= Angle and PDir - NDir >= -Angle and NZ - PZ > 0 then	-- 判斷視角
		Step = 1
	else
		ScriptMessage( Player , Player , 1 ,"Angle error" , 0 )
		ScriptMessage( Player , Player , 0 ,"Angle error" , 0 )
	end
	
	if Step == 1 then
		if BeginCastBarEvent( Player , NPC ,"Catch it if you can ", 50 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "lua_nehelia_flower_S_3" ) ~= 1 then
			ScriptMessage( Player , Player , 1 ,"[SC_424493_05]" , 0 )
			ScriptMessage( Player , Player , 0 ,"[SC_424493_05]" , 0 )
			-- 目標忙碌中
		end
	end
end

function lua_nehelia_flower_S_3( Player, CheckStatus )

	local Player = OwnerID()
	local NPC = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --成功
			ScriptMessage( Player , Player , 0 ,"You Got it" , 0 )
			EndCastBar( Player , CheckStatus ) --清除施法條
		else --失敗
			ScriptMessage( Player , Player , 0 ,"Mission error" , 0 )		
			EndCastBar( Player , CheckStatus ) --清除施法條
		end
	end
end
	
function Lua_Hao_Reset_Magic_Wardrobe()	-- 清除魔法衣櫥所有裝備
	
	local Player = OwnerID()
--	local Position = ReadRoleValue( OwnerID() , EM_RoleValue_SuitWardrobe+Space )
	for i = 0 , 499 , 1 do
		WriteRoleValue( Player , EM_RoleValue_SuitWardrobe+i , 0 )
	end
end

function Hao_GuildWar_Test_Buff(Lv)	-- 調整身上Buff的等級

	local Player = OwnerID()
	local BodyBuff
	local CountBuff = BuffCount( Player )	-- 讀取身上的Buff數量
	for i = 0 , CountBuff , 1 do
		BodyBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )	-- 讀取該Buff的ID
		CancelBuff_NoEvent( Player , BodyBuff )
		AddBuff( Player , BodyBuff , Lv , -1 )
		DebugMsg( Player , 0 , BodyBuff )
	end
end

function Hao_Test_20151001()
	local Owner = OwnerID();
	local Flag = {};
	Flag[1] = EM_AccountFlag_CE_Date1_12;	--	=Value; Value = Value + 12	--晶鑽兌換金幣 招喚NPC用(最大2048) 2^12 -2048 ~ 2047
	Flag[2] = EM_AccountFlag_CE_Count1_8;	--	=Value; Value = Value + 8	--晶鑽兌換金幣 招喚NPC用(最大128)   2^8    -128 ~ 127
	Flag[3] = EM_AccountFlag_CE_Date2_12;	--	=Value; Value = Value + 12	--金幣兌換晶鑽 招喚NPC用(最大2048) 2^12
	Flag[4] = EM_AccountFlag_CE_Count2_8;	--	=Value; Value = Value + 8	--金幣兌換晶鑽 招喚NPC用(最大128)   2^8
	Flag[5] = EM_AccountFlag_CE_Date3_12;	--	=Value; Value = Value + 12	--晶鑽兌換金幣 Zone2 NPC用(最大2048) 2^12
	Flag[6] = EM_AccountFlag_CE_Count3_8;	--	=Value; Value = Value + 8	--晶鑽兌換金幣 Zone2 NPC用(最大128)   2^8
	Flag[7] = EM_AccountFlag_CE_Date4_12;	--	=Value; Value = Value + 12	--金幣兌換晶鑽 Zone2 NPC用(最大2048) 2^12
	Flag[8] = EM_AccountFlag_CE_Count4_8;	--	=Value; Value = Value + 8	--金幣兌換晶鑽 Zone2 NPC用(最大128)   2^8
	Flag[9] = EM_AccountFlag_CE_Date5_12;	--	=Value; Value = Value + 12	--以A換B 方案1 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[10] = EM_AccountFlag_CE_Count5_8;	--	=Value; Value = Value + 8	--以A換B 方案1 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[11] = EM_AccountFlag_TJ_Check_1;	--		=Value; Value = Value + 1	--擁有第三職業旗標(最大1)   2^1    0 ~ 1
	Flag[12] = EM_AccountFlag_CE_Date6_12;	--	=Value; Value = Value + 12	--以A換B 方案2 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[13] = EM_AccountFlag_CE_Count6_8;	--	=Value; Value = Value + 8	--以A換B 方案2 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[14] = EM_AccountFlag_CE_Date7_12;	--	=Value; Value = Value + 12	--以A換B、C、D 方案3 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[15] = EM_AccountFlag_CE_Count7_8;	--	=Value; Value = Value + 8	--以A換B、C、D 方案3 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[16] = EM_AccountFlag_CE_Date8_12;	--	=Value; Value = Value + 12	--以A換B、C、D 招喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[17] = EM_AccountFlag_CE_Count8_8;	--	=Value; Value = Value + 8	--以A換B、C、D 招喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[18] = EM_AccountFlag_CE_Date9_12;	--	=Value; Value = Value + 12	--彈性設定以物換物 方案1 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[19] = EM_AccountFlag_CE_Count9_8;	--	=Value; Value = Value + 8	--彈性設定以物換物 方案1 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[20] = EM_AccountFlag_CE_Date10_12;	--	=Value; Value = Value + 12	--彈性設定以物換物 方案2 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[21] = EM_AccountFlag_CE_Count10_8;	--	=Value; Value = Value + 8	--彈性設定以物換物 方案2 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[22] = EM_AccountFlag_CE_Date11_12;	--	=Value; Value = Value + 12	--彈性設定以物換物 方案3 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[23] = EM_AccountFlag_CE_Count11_8;	--	=Value; Value = Value + 8	--彈性設定以物換物 方案3 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[24] = EM_AccountFlag_CE_Date12_12;	--	=Value; Value = Value + 12	--彈性設定以物換物 方案4 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[25] = EM_AccountFlag_CE_Count12_8;	--	=Value; Value = Value + 8	--彈性設定以物換物 方案4 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[26] = EM_AccountFlag_CE_Date13_12;	--	=Value; Value = Value + 12	--彈性設定以物換物 方案5 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[27] = EM_AccountFlag_CE_Count13_8;	--	=Value; Value = Value + 8	--彈性設定以物換物 方案5 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[28] = EM_AccountFlag_CE_Date14_12;	--	=Value; Value = Value + 12	--彈性設定以幣換幣 方案1 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[29] = EM_AccountFlag_CE_Count14_8;	--	=Value; Value = Value + 8	--彈性設定以幣換幣 方案1 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[30] = EM_AccountFlag_CE_Date15_12;	--	=Value; Value = Value + 12	--彈性設定以幣換幣 方案2 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[31] = EM_AccountFlag_CE_Count15_8;	--	=Value; Value = Value + 8	--彈性設定以幣換幣 方案2 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[32] = EM_AccountFlag_CE_Date16_12;	--	=Value; Value = Value + 12	--彈性設定以幣換幣 方案3 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[33] = EM_AccountFlag_CE_Count16_8;	--	=Value; Value = Value + 8	--彈性設定以幣換幣 方案3 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[34] = EM_AccountFlag_CE_Date17_12;	--	=Value; Value = Value + 12	--彈性設定以幣換幣 方案4 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[35] = EM_AccountFlag_CE_Count17_8;	--	=Value; Value = Value + 8	--彈性設定以幣換幣 方案4 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[36] = EM_AccountFlag_CE_Date18_12;	--	=Value; Value = Value + 12	--彈性設定以幣換幣 方案5 召喚NPC用(最大2048) 2^12 -2048 ~ 2047	記錄日期用
	Flag[37] = EM_AccountFlag_CE_Count18_8;	--	=Value; Value = Value + 8	--彈性設定以幣換幣 方案5 召喚NPC用(最大128)   2^8    -128 ~ 127	記錄次數用
	Flag[38] = EM_AccountFlag_MW_Space_Switch_1;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面1(最大1)   2^1    0 ~ 1 Magic Wardrobe = MW
	Flag[39] = EM_AccountFlag_MW_Space_Switch_2;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面2(最大1)   2^1    0 ~ 1
	Flag[40] = EM_AccountFlag_MW_Space_Switch_3;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面3(最大1)   2^1    0 ~ 1
	Flag[41] = EM_AccountFlag_MW_Space_Switch_4;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面4(最大1)   2^1    0 ~ 1
	Flag[42] = EM_AccountFlag_MW_Space_Switch_5;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面5(最大1)   2^1    0 ~ 1
	Flag[43] = EM_AccountFlag_MW_Space_Switch_6;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面6(最大1)   2^1    0 ~ 1
	Flag[44] = EM_AccountFlag_MW_Space_Switch_7;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面7(最大1)   2^1    0 ~ 1
	Flag[45] = EM_AccountFlag_MW_Space_Switch_8;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣櫥頁面8(最大1)   2^1    0 ~ 1
	Flag[46] = EM_AccountFlag_MW_Set_Switch_1;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定6(最大1)   2^1    0 ~ 1
	Flag[47] = EM_AccountFlag_MW_Set_Switch_2;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定7(最大1)   2^1    0 ~ 1
	Flag[48] = EM_AccountFlag_MW_Set_Switch_3;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定8(最大1)   2^1    0 ~ 1
	Flag[49] = EM_AccountFlag_MW_Set_Switch_4;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定9(最大1)   2^1    0 ~ 1
	Flag[50] = EM_AccountFlag_MW_Set_Switch_5;	--	=Value; Value = Value + 1	--魔法衣櫥擴充用的衣組設定10(最大1)   2^1    0 ~ 1
	
	for i = 1, #Flag do
		DebugMsg( Owner, 0, "Old"..i.." = "..Flag[i] );
	end

end