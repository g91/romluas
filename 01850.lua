function Lua_Hao_TestStudent_01()

	Lua_Hao_TestStudent_02( 10 , 10 , 10 , 10 , 11 )
end
function Lua_Hao_TestStudent_02( A , W , X , Y , Z , B , C )

	A = A + 1 	-- 11	加法
	W = W - 1	--9	減法
	X = X * 2	--20	乘法
	Y = Y / 2	--5	除法
	Z = Z % 2	--1	取餘數
	B = Math.floor( X / W )	-- 20 / 9 = 2 餘 2	取整除部分 2
	C = Math.floor( X / A )		-- 20 / 11 = 1 餘 9	取整除部分 1
	D = B^2	-- 2的2次方 2*2 = 4
	E = B^3	-- 2的3次方 2*3 = 8
	F = B^4	-- 2的4次方 2*4 = 16

	Say( OwnerID() , A )
	Say( OwnerID() , W )
	Say( OwnerID() , X )
	Say( OwnerID() , Y )
	Say( OwnerID() , Z )
	Say( OwnerID() , B )
	Say( OwnerID() , C )
	Say( OwnerID() , D )
	Say( OwnerID() , E )
	Say( OwnerID() , F )
end

function Lua_Hao_9x9Test()

	local x

	for i = 1 , 9 , 1 do

		for j = 1 , 9 , 1 do

			X = i * j
			Say( OwnerID() , i.."*"..j.."="..x )
			Sleep(3)

		end

	end
end

function Lua_Hao_9x9Test02()

	local i = 1
	local X

	while i <= 9 do

		local j = 1

		while j <= 9 do

			X = i * j
			Say( OwnerID() , i.."*"..j.."="..x )
			Sleep(3)
			j = j + 1


		end
	i = i + 1
--	Say( OwnerID() , i )
	end
end

function Lua_Hao_Test_Start()	-- 戰場用
	StartClientCountDown( OwnerID() , 10 , 0 , 0 )
end

function Lua_Hao_PVP_AllFull()	-- 確定職業，並恢復HP、MP、SP
	local Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )		-- 主職
	local SubJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )	-- 副職
	local HP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )		-- Max HP
	local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )		-- Max Mp

	WriteRoleValue( OwnerID() , EM_RoleValue_HP , HP )

	if Job ==2 or Job ==3 then	-- 當主職為遊俠、影行者時
		WriteRoleValue( OwnerID() , EM_RoleValue_SP , 100 )	-- 補滿SP
		if SubJob ==2 or SubJob ==3 then	-- 副職為遊俠、影行者時
			WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub , 100 ) -- 副職
		elseif SubJob == 4 or SubJob ==5 or SubJob ==6 or SubJob == 7 or SubJob == 8 then
		--	local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )	-- 讀取Max Mp
			WriteRoleValue( OwnerID() , EM_RoleValue_MP , MP )		-- 恢復MP
		end

	elseif Job == 4 or Job == 5 or Job == 6 or Job ==7 or Job == 8 then		-- 當主職為影行者、法師、祭司、騎士、森林牧者、自然神官時

	--	local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )

		WriteRoleValue( OwnerID() , EM_RoleValue_MP , MP )

		if SubJob ==2 or SubJob ==3 then	-- 副職為遊俠、影行者時
			WriteRoleValue( OwnerID() , EM_RoleValue_SP_Sub , 100 )
		end

	elseif Job == 0 or SubJob == 0 then	-- 當主職、副職為GM時
	--	local MP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxMP )
		WriteRoleValue( OwnerID() , EM_RoleValue_MP , MP)
	end 
end

function Lua_Hao_Test_Math()	-- 列出 1 ~ 100 的質數

	GiveItem_Pet( OwnerID() , 207583 , 1 , 0 , 0 , 103729 )

	for i = 0 , 99 , 1 do
		local K = 0
		i = i + 1
		local Math = { 2 , 3 , 5 , 7 , 11 }
		for j = 1 , table.getn(Math) , 1 do
			local X = i % Math[j]
			--	Say( OwnerID() , X.." =".. i .."%"..Math[j] )
			if X == 0 and i ~= Math[j] then
				K = K + 1
			end
		end
		if K == 0 then
			Say( OwnerID() , "i ="..i )
		end
	end
end

function Lua_Hao_Nine_x_Nine_Basic()

	for i = 1 , 9 , 1 do
		for j = 1 , 9 , 1 do
			Say( OwnerID() , i .. " x " .. j .. " = " .. i*j )
		end
	end
end

function Lua_Hao_Nine_x_Nine_Plus()

	for i = 1 , 9 , 3 do
		local Step = 0
		for j = 1 , 9 , 1 do
			local X = i+1
			local Y = i+2
			local AnsX = string.format("%02d", i*j )
			local AnsY = string.format("%02d", X*j )
			local AnsZ = string.format("%02d", Y*j )
			if i == 1 then
			--	Say( OwnerID() , "i".." * ".."j".." = ".. i*j.." , ".."X".." * ".."j".." = ".. X*j.." , ".."Y".." * ".."j".." = ".. Y*j )
				ScriptMessage( OwnerID() , OwnerID() , 0 , i.." * "..j.." = ".. AnsX.." , "..X.." * "..j.." = ".. AnsY.." , "..Y.." * "..j.." = ".. AnsZ , C_RED )
			elseif i == 4 then
				if Step == 0 then
					ScriptMessage( OwnerID() , OwnerID() , 0 , " " , C_SYSTEM )
					Step = 1
				end
			--	Say( OwnerID() , "i".." * ".."j".." = ".. i*j.." , ".."X".." * ".."j".." = ".. X*j.." , ".."Y".." * ".."j".." = ".. Y*j )
				ScriptMessage( OwnerID() , OwnerID() , 0 , i.." * "..j.." = ".. AnsX.." , "..X.." * "..j.." = ".. AnsY.." , "..Y.." * "..j.." = ".. AnsZ , C_SYSTEM )
			elseif i == 7 then
				if Step == 0 then
					ScriptMessage( OwnerID() , OwnerID() , 0 , " " , C_SYSTEM )
					Step = 1
				end
			--	Say( OwnerID() , "i".." * ".."j".." = ".. i*j.." , ".."X".." * ".."j".." = ".. X*j.." , ".."Y".." * ".."j".." = ".. Y*j )
				ScriptMessage( OwnerID() , OwnerID() , 0 , i.." * "..j.." = ".. AnsX.." , "..X.." * "..j.." = ".. AnsY.." , "..Y.." * "..j.." = ".. AnsZ , C_YELLOW )
			end
		end
	end
end

function Lua_Hao_Comparison_Begin()

--	Lua_Hao_Comparison_Count( 4096 , 2 , 16 , 3310 , 32 , 150 , 1024 , 2048 , 999 , 256 )
	Lua_Hao_Comparison_Count( 87 , 65 , 99 , 54 , 32 , 23 , 11 , 72 , 38 , 90 )
	Lua_Hao_Comparison_Count2( 87 , 65 , 99 , 54 , 32 , 23 , 11 , 72 , 38 , 90 )
end

function Lua_Hao_Comparison_Count( Num1 , Num2 , Num3 , Num4 , Num5 , Num6 , Num7 , Num8 , Num9 , Num10 )

--	local Before = { Num1 , Num2 , Num3 }
	local Count
	local Step = 0

--	local After = { }
--	local All = table.maxn(Before)
--	Say( OwnerID() , "ALL =".. ALL )

	while true do

		if Num1 < Num2 then
		--	Num1 = Num1
		--	Num2 = Num2
		elseif Num1 >= Num2 then
			Count = Num2
			Num2 = Num1
			Num1 = Count
		end
	
		if Num2 < Num3 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num2 >= Num3 then
			Count = Num3
			Num3 = Num2
			Num2 = Count
		end
	
		if Num3 < Num4 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num3 >= Num4 then
			Count = Num4
			Num4 = Num3
			Num3 = Count
		end
	
		if Num4 < Num5 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num4 >= Num5 then
			Count = Num5
			Num5 = Num4
			Num4 = Count
		end

		if Num5 < Num6 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num5 >= Num6 then
			Count = Num6
			Num6 = Num5
			Num5 = Count
		end

		if Num6 < Num7 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num6 >= Num7 then
			Count = Num7
			Num7 = Num6
			Num6 = Count
		end

		if Num7 < Num8 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num7 >= Num8 then
			Count = Num8
			Num8 = Num7
			Num7 = Count
		end

		if Num8 < Num9 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num8 >= Num9 then
			Count = Num9
			Num9 = Num8
			Num8 = Count
		end

		if Num9 < Num10 then
		--	Num2 = Num2
		--	Num3 = Num3
		elseif Num9 >= Num10 then
			Count = Num10
			Num10 = Num9
			Num9 = Count
		end

		if 	Num1 <= Num2 and Num2 <= Num3 and  Num3 <= Num4 and Num4 <= Num5 and 
			Num5 <= Num6 and Num6 <= Num7 and  Num7 <= Num8 and Num8 <= Num9 and Num9 <= Num10 then
			Step = 1
		end
		if Step == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , Num1.." , "..Num2.." , "..Num3.." , "..Num4.." , "..Num5..
					" , "..Num6.." , "..Num7.." , "..Num8.." , "..Num9.." , "..Num10 , C_SYSTEM )
			break
		end
	end
end

function Lua_Hao_Comparison_Count2( Num1 , Num2 , Num3 , Num4 , Num5 , Num6 , Num7 , Num8 , Num9 , Num10 )

--	local Before = { Num1 , Num2 , Num3 }
	local Count
	local Step = 0
	local Number = 0
--	local After = { }
--	local All = table.maxn(Before)
--	Say( OwnerID() , "ALL =".. ALL )

	while true do
	--	Number = Number +1
	--	Say( OwnerID() , "Number = ".. Number )
		if Num1 <= Num2 then	-- 1 , 30
			Count = Num2	-- Count 1 = 30
			Num2 = Num1	-- Num2 = 1
			Num1 = Count	-- Num1 = 30
		end
	
		if Num2 <= Num3 then
			Count = Num3
			Num3 = Num2
			Num2 = Count
		end
	
		if Num3 <= Num4 then
			Count = Num4
			Num4 = Num3
			Num3 = Count
		end
	
		if Num4 <= Num5 then
			Count = Num5
			Num5 = Num4
			Num4 = Count
		end

		if Num5 <= Num6 then
			Count = Num6
			Num6 = Num5
			Num5 = Count
		end

		if Num6 <= Num7 then
			Count = Num7
			Num7 = Num6
			Num6 = Count
		end

		if Num7 <= Num8 then
			Count = Num8
			Num8 = Num7
			Num7 = Count
		end

		if Num8 <= Num9 then
			Count = Num9
			Num9 = Num8
			Num8 = Count
		end

		if Num9 <= Num10 then
			Count = Num10
			Num10 = Num9
			Num9 = Count
		end

		if 	Num1 >= Num2 and Num2 >= Num3 and  Num3 >= Num4 and Num4 >= Num5 and 
			Num5 >= Num6 and Num6 >= Num7 and  Num7 >= Num8 and Num8 >= Num9 and Num9 >= Num10 then
			Step = 1
		end
		if Step == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , Num1.." , "..Num2.." , "..Num3.." , "..Num4.." , "..Num5..
					" , "..Num6.." , "..Num7.." , "..Num8.." , "..Num9.." , "..Num10 , C_SYSTEM )
			break
		end
	end
end

function Lua_Hao_9x9_While()

	local X = 1
	local Y = 1

	while true do
		while true do
			Say( OwnerID() , X.." x "..Y.." = ".. X*Y )
			Y = Y + 1
			Sleep(5)
			if Y > 9 then
				Y = 1
				break
			end
		end
		X = X + 1
		if X > 9 then
			break
		end
	end
end

function DavisTest_nmcast(X)	-- 輸入1000，變成壹仟零百零十零元
	local Chinese = { "I" , "II" , "III" , "IV" , "V", "VI" , "VII",  "VIII" , "IX" , "X"  }
	local Units = { "TG" , "HG" , "NG" , "G" , "TH" , "HE" , "NE" , "E" , "TW" , "HW" , "NW" , "W" , "T" , "H" , "N" , "D"  }
	local Unc = { 16,15,14,13,12,11,10,9,8,7,6,5,4,3,2,1 }
	local Z = string.len(X)--字串長度
	local Y = {}
	--用Z判斷位數并將位數
	local N = 0
	for i = 1 , table.getn(Unc) do
		if Unc[i] == Z then
			N = i
		end
	end
	--取出每一個字
	for i = 1 , Z do
		Y[i] = string.char(string.byte(X,i))
	--	Say( OwnerID() , Y[i] )
	end
	local Final = ""
	for i=1 , Z do
		Final = Final..Chinese[Y[i]+1].." "..Units[N+i-1].." "
--	Say(OwnerID() , Ych[i] )
--	Say(OwnerID() , Units[N+i-1] )
	end
	Say( OwnerID() , Final )
end
----------------------------------------------------------------------------------
function Lua_Hao_Test_Change_Buff_Loop()	-- 測試無限 Buff

	local Buff = { 509677 , 509678 , 509679 }
	local Random = Rand(100)+1

	if Random <= 33 then 				-- 1 ~ 33
		AddBuff( OwnerID() , Buff[1] , 0 , 5 )
	elseif Random > 33 and Random <= 66 then 	-- 34 ~ 66
		AddBuff( OwnerID() , Buff[2] , 0 , 5 )
	elseif Random > 66 and Random <= 100 then 	-- 67 ~ 100
		AddBuff( OwnerID() , Buff[3] , 0 , 5 )
	end
end
----------------------------------------------------------------------------------
function Lua_Hao_Test_Bag_Item_Value()

	local Count = ReadRoleValue( OwnerID() , EM_RoleValue_BodyCount )
	local ID = { }
	local Value = { }
 		Value[1] = EM_ItemValueType_Inherent1	-- 屬性1
 		Value[2] = EM_ItemValueType_Inherent2	-- 屬性2
 		Value[3] = EM_ItemValueType_Inherent3	-- 屬性3
 		Value[4] = EM_ItemValueType_Inherent4	-- 屬性4
 		Value[5] = EM_ItemValueType_Inherent5	-- 屬性5
 		Value[6] = EM_ItemValueType_Inherent6	-- 屬性6
	local Power = { }
	local Magic = { 513281 , 513282 , 513287 , 513288 , 513291 , 513292 }
	local Key = 0

--	Say( OwnerID() , "Key = "..Key )

	-- EM_ItemPacketType_Body 0 ~ 49 商城背包空間，50 ~ 59 魔幻寶盒空間，60 ~ 239 玩家背包空間
	for i = 60 , Count , 1 do
		ID[i] = GetItemInfo( OwnerID() , EM_ItemPacketType_Body , i , EM_ItemValueType_OrgObjID )
		if ID[i] == 202844 then
	--	Say( OwnerID() , "ID".." "..i.." ".." = "..ID[i] )
			for j = 1 , table.getn(Value) , 1 do
				Power[j] = GetItemInfo( OwnerID() , EM_ItemPacketType_Body , i , Value[j] )
			--	Say( OwnerID() , "Power".." "..J.." ".." = "..Power[j] )
				for k = 1 , table.getn(Magic) , 1 do
				--	Say( OwnerID() , "Power".." "..J.." ".." = "..Power[j] )
				--	Say( OwnerID() , "Magic".." "..k.." ".." = "..Magic[k] )
					if Power[J] == Magic[k] then
						Key = Key +1
						if Key == 6 then
							for w = i , i , 1 do
								Say( OwnerID() , "ID".." "..i.." ".." = "..ID[i] )								
							--	local ItemID = GetItemInfo( OwnerID() , EM_ItemPacketType_Body , i , EM_ItemValueType_OrgObjID )
							--	DelBodyItem( OwnerID() , ItemID , CountBodyItem( OwnerID() , ItemID ) )
								SetItemInfo( OwnerID() , EM_ItemPacketType_Body , i , EM_ItemValueType_OrgObjID , 0 )
							--	DelBodyItem( OwnerID() , ID[i] , CountBodyItem( OwnerID() , ID[i] ) )
								return false
							end
						end
					end
				end
			end
		end
	end
end

function Lua_Hao_Choise_NPC_Mode( Value )

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 119003 }
	local Number = 0

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--確認所有NPC的編號
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --若為陣列中的值
						WriteRoleValue( ID , EM_RoleValue_Register9 , Value )
						local Make_Value = ReadRoleValue( ID , EM_RoleValue_Register9 )
						Say( ID , "Mode = "..Make_Value )
						break
					end
				end
			end
		end
	end
end

function Lua_Hao_Test_Play_Sound_Loop()

	for i = 1 , 3 , 1 do
		PlaySoundToPlayer( OwnerID() , "sound\\interface\\QuestItemFinish.mp3", false )	-- false = 不重播
		Sleep(1)
	end
end

function Lua_Hao_Search_Player11111()

	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	DebugMsg( OwnerID() , RoomID , "Item = "..Item.." Item2 = "..Item2.." Item3 = "..Item3.." Item4 = "..Item4.." Item5 = "..Item5 )
end

function Lua_Hao_Change_Obj_ID(ID)	-- 變更外觀

	ChangeObjID( OwnerID() , ID )
end

function Lua_Hao_Test_EventBuff()
	
--	CancelBuff_NoEvent( Player , 621299 )  

	local Player = OwnerID()
	local BuffLV
	BuffLV = FN_CountBuffLevel( Player , 621299 )
--	BuffLv = Lua_Hao_Return_Buff_Lv( Player , 621299 )
	Say( Player , "Old Buff ="..BuffLV )
	if BuffLV > 0 then
		CancelBuff( Player , 621299 )
		AddBuff( Player , 621299 , BuffLV-1 , -1 )
		Say( Player , "New Buff ="..BuffLV-1 )
	else
		CancelBuff_NoEvent( Player , 621299 )  
	--	CancelBuff( Player , 621299 )
		BuffLV = FN_CountBuffLevel( Player , 621299 )
	--	BuffLv = Lua_Hao_Return_Buff_Lv( Player , 621299 )
		Say( Player , "New Buff ="..BuffLV )
		Say( Player , "Clear" )
	end
end

function Lua_Hao_Test_EventBuff_1()

	CancelBuff_NoEvent( OwnerID() , 621299 )  
end

function Lua_Hao_AttachCastMotion(Step) -- 測試置換武器

	local Player = OwnerID()

	if Step == 0 or Nil then	-- 空手
		AttachCastMotionTool( Player , 212076 ) -- 將武器置換成空手
	elseif Step == 1 then	-- 啤酒杯 + 喝酒動作
		AttachCastMotionTool( Player , 212075 ) --置換武器為啤酒杯
		CallPlot( Player , "PlayMotion" , Player , ruFUSION_ACTORSTATE_EMOTE_DRINK ) -- 喝酒
	elseif Step == 2 then	-- 弩 + BeginCastBarEvent
		if BeginCastBarEvent( Player , Player , "shot", 50 , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN , ruFUSION_ACTORSTATE_ATTACK_GUN_END , 0 , "" ) ~= 1 then
			ScriptMessage( Player , Player , 0 , "[SAY_NPC_BUSY]", 0 );--目標忙碌中
			return
		else
			AttachCastMotionTool( Player , 213666 ) --置換武器為弩
		end
	elseif Step == 3 then	-- 啤酒杯 + 開槍動作
		AttachCastMotionTool( Player , 212075 ) --置換武器為啤酒杯
		CallPlot( Player , "PlayMotion" , Player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN ) -- 開槍動作
	elseif Step == 4 then	-- 弩 + 喝酒
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩
		CallPlot( Player , "PlayMotion" , Player , ruFUSION_ACTORSTATE_EMOTE_DRINK ) -- 喝酒
	elseif Step == 5 then	-- 弩 + PlayMotionEX
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩	
		PlayMotionEX( Player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN ,ruFUSION_ACTORSTATE_ATTACK_GUN_LOOP )
	elseif Step == 6 then	-- 弩
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩	
	elseif Step == 7 then
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩	
		CallPlot( Player , "PlayMotionEX" , Player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN ,ruFUSION_ACTORSTATE_ATTACK_GUN_LOOP )		
	elseif Step == 8 then
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩			
		SetIdleMotion( Player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN )  		
	elseif Step == 9 then
		AttachCastMotionTool( Player , 213666 ) --置換武器為弩	
		SetDefIdleMotion( Player , ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN )
	end
end

function Lua_Hao_Test_QNPC_Detail()	-- 測試開啟兩個相通視窗時，是否能遮蔽另一個視窗。

	Setplot( OwnerID() , "touch" , "Lua_Hao_Test_QNPC_Detail_2" , 50 )
end

function Lua_Hao_Test_QNPC_Detail_2()

	local Player = OwnerID()
	local Npc = TargetID()
	
--	LoadQuestOption( TargetID() )

	local PID = ReadRoleValue( Npc , EM_RoleValue_PID )
	Say( Npc , PID )
	if PID == 1 then
		CloseSpeak( Player )
		return false
	end
	
	local Time = 0 
	local Step = 0
	local DialogStatus = 0

	DialogCreate( OwnerID(), EM_LuaDialogType_Select, "[SC_BUFFNPC_01]" )   --NPC類型選擇表單

 	DialogSelectStr( OwnerID(), "[SC_BUFFNPC_02]")  -- TP項目[0]
	DialogSelectStr( OwnerID(), "[SC_BUFFNPC_03]") --EXP項目[1]

	if ( DialogSendOpen(OwnerID() ) == false)  then  --表單使用錯誤，回傳錯誤訊息
		ScriptMessage ( OwnerID(), OwnerID(), 1, "[SYS_FIXEQ_DATA_ERROR]", 0) 
		return
	end

	while true do  	--選單開啟之後，執行迴圈
		sleep(10)
		Time = Time+1
	--	say( OwnerID() , Time)
	 	if Time > 30 then  -- 一分鐘無動作，關閉對話視窗
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_BUFFNPC_07]" , 0 )
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break
		end
		
		DialogStatus = DialogGetResult( OwnerID() )  --檢查使用者選取的項目
			if DialogStatus == -2  then -- 初始化
			
			elseif DialogStatus == -1  then--中斷
			DialogClose( OwnerID() )
			CancelBuff( OwnerID(), 501570 );--
			break

			elseif DialogStatus == 0 then  --TP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_TP" , 0 )
				DialogClose( OwnerID() )
				
			--	Say( OwnerID() , DialogStatus )			
				Step = 1			
			elseif DialogStatus == 1 then --EXP
				CancelBuff( OwnerID(), 501570 );--
				Beginplot( OwnerID(), "LuaS_buffnpc_na_EXP" , 0 )
				DialogClose( OwnerID() )
				Step = 1
			end
		if Step == 1 then
			break
		end
	end
end  	--第一張選單結束

function Lua_Hao_Test_QNPC_Detail_3()

	local Player = OwnerID()
	local Npc = TargetID()
	
	SetSpeakDetail( Player , "123" )
	AddSpeakOption( Player , Npc , "A" , "" , 0 )
end

function Lua_Hao_Chaos_Test_Fire()

	local FireTable= {}
	local Reg , Ans , Count = 0 , 0 , 0

	FireTable[1]=120135
	FireTable[2]=120136
	FireTable[3]=120137

	for time=1,3,1 do
		ChangeObjID( OwnerID() , FireTable[time] )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register1 , Reg )
		Reg = Reg + 1
		Ans = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
		DebugMsg( 0 , 0 , Ans )
		sleep (40)
	end
	DelObj( OwnerID() )
end

function Lua_Hao_Set_GuildWar_Npc_Lv(Lv)

	local Obj = OwnerID()
	local Room = ReadRoleValue( Obj , EM_RoleValue_RoomID )
	local X , Y , Z , Dir =	ReadRoleValue( Obj , EM_RoleValue_X ) ,
				ReadRoleValue( Obj , EM_RoleValue_Y ) ,
				ReadRoleValue( Obj , EM_RoleValue_Z ) ,
				ReadRoleValue( Obj , EM_RoleValue_Dir )
	local ObjID = 103021
	local Npc = CreateObj( ObjID , X , Y , Z , Dir , 1 )
	local NpcLv = ReadRoleValue( Npc , EM_RoleValue_LV )
	local Tower = CreateObj_ByObjPoint( Npc , 103316 , "P_Down")	--攻擊塔
	local TowerLv
--	DebugMsg( 0 , 0 , "NpcLv ="..NpcLv )
	WriteRoleValue( Tower , EM_RoleValue_LV , Lv )
	TowerLv = ReadRoleValue( Tower , EM_RoleValue_LV )
	DebugMsg( 0 , 0 , "TowerLv ="..TowerLv )
--	SetModeEx( Npc , EM_SetModeType_Mark, true )--標記
--	SetModeEx( Npc , EM_SetModeType_Gravity, true )--重力
--	SetModeEx( Npc , EM_SetModeType_ShowRoleHead, true )--頭像框
--	SetModeEx( Npc , EM_SetModeType_Show, true )--顯示
	AddToPartition( Npc , Room )
	AddToPartition( Tower , Room )
end

function Lua_Hao_Test_LV_DL()	-- LogView 網頁上的 DesignLog
	
	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )
	local Voc = ReadRoleValue( Player , EM_RoleValue_VOC )
	
	Designlog( Player , 999999 , "Player Lv = "..Lv.." Player Voc = "..Voc )
	DebugMsg( Player , 0 , "Player Lv = "..Lv.." Player Voc = "..Voc )
end

function Hao_Test_RandomSeed(Count)

	local Player = OwnerID()
	local Answer = {}
	local Maxmum = 4
--	math.randomseed(math.random(10000, 99999))
	for i = 1 , Count , 1 do
	--	math.randomseed(math.random(10000, 99999))	
		table.insert( Answer , math.random(Maxmum) )
	--	table.insert( Answer , Rand(Maxmum)+1 )
	--	table.insert( Answer , DW_Rand(Maxmum) )
	end
--	DebugMsg( Player , 0 , #Answer )
	for Num = 1 , Maxmum , 1 do
		local Total = 0
		for List = 1 , #Answer , 1 do
			if Answer[List] == Num then
				Total = Total + 1
			--	DebugMsg( Player , 0 , Num.." = "..Total )
			end
		end
		DebugMsg( Player , 0 , Num.." = "..Total )
	end
end