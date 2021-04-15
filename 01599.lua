--==================================================--
--  原生之地公眾任務交換獎賞                        --
--==================================================--
-- 206219 獎勵溶解石
function LuaPE_ZONE8_ExChange_Set()
	local Guard = OwnerID()
	local GuardX = ReadRoleValue( Guard , EM_RoleValue_X )
	local GuardY = ReadRoleValue( Guard , EM_RoleValue_Y )
	local GuardZ = ReadRoleValue( Guard , EM_RoleValue_Z )
	local GuardDir = ReadRoleValue( Guard , EM_RoleValue_Dir )
	local Width = 30
	local Height = Width
	local BoxNum = 6
	local BoxID = 113716
	local Box = {}
	local RoomID = 0

	local BoxPosition = LuaPE_ZONE8_02SCA_FormationPosition( GuardX , GuardY , GuardZ , Width , Height , GuardDir )	-- 計算該走到的位置
	for i = 2 , BoxNum do
		Box[i] = CreateObj( BoxID , BoxPosition["X"][i], BoxPosition["Y"][i] , BoxPosition["Z"][i] , GuardDir , 1 )
		SetModeEx( Box[i] , EM_SetModeType_Obstruct , true )		-- 阻擋
		SetModeEx( Box[i] , EM_SetModeType_Gravity , false )		-- 重力
		AddToPartition( Box[i] , RoomID )
		SetPlot( Box[i] , "TOUCH" , "LuaPE_ZONE8_BowBox"..(i-1) , 15 )
	end

	--BeginPlot( Guard , "LuaPE_ZONE8_ExCha_BoxReborn" , 0 )
end

function LuaPE_ZONE8_ExCha_BoxReborn()
	local BoxID = 113716

--Say( OwnerID() , "run" )
	while true do
		local OpenBoxNum = 0
		Sleep( 600 )
		local SearchObj = SearchRangeNPC( OwnerID() , 500 )
		if SearchObj[0] == -1 then	-- 找不到人
		else
			for i = 0, table.getn(SearchObj)-1 do	-- 最後一個-1不要，所以要-1
				if SearchObj[i] == OwnerID() then	-- 自己不算
				else
					if ReadRoleValue( SearchObj[i] , EM_RoleValue_OrgID ) == BoxID then	-- 找到寶箱
						if ReadRoleValue( SearchObj[i] , EM_RoleValue_PID ) == 1 then
							OpenBoxNum = OpenBoxNum + 1
							--Say( SearchObj[i] , "Open" )
						else
							--Say( SearchObj[i] , "No Open" )
						end

					end
				end
			end
		end

		if OpenBoxNum >= 5 then
			local tmp = 0
			for j = 0, table.getn(SearchObj)-1 do
				if ReadRoleValue( SearchObj[j] , EM_RoleValue_OrgID ) == BoxID then	-- 找到寶箱
					tmp = tmp + 1
					SetPlot( SearchObj[j] , "TOUCH" , "LuaPE_ZONE8_BowBox"..tmp , 15 )
					WriteRoleValue( SearchObj[j] , EM_RoleValue_PID , 0 )
					PlayMotionEX( SearchObj[j] , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )
				end
			end
		end
	end
end

function LuaPE_ZONE8_ExChange()
	local ItemID = 205971	-- 蛇人徽記
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙

	--LoadQuestOption( OwnerID() )  --載入任務模板
	local Num = CountBodyItem( OwnerID() , ItemID )

	if Num <= 0 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_11]" )	-- 我們突擊隊目前正以全力應對蛇人補給線上的各種狀況，並竭盡所能截斷蛇人的聯絡與補給。英勇的冒險者啊！只要你能協助我們突擊隊解決蛇人的問題，並從他們身上取得[205971]，那麼你將可以用這些[205971]為證，交換我身後寶箱裡面的物品來將作你英勇行為的報酬！
	elseif Num > 0 and Num < 30 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_12]" )	-- 謝謝你對我們突擊隊的協助，不過你所取得的[205971]數量似乎還不夠多，你可能得試著取得 100 個以上的數量再來與我交換。
	elseif Num >= 30 and Num < 135 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_13]" )	-- 謝謝你對我們突擊隊的協助，你想使用[205971]來交換獎賞嗎？
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_14]" , "LuaPE_ZONE8_ExChange1" , 0 )	-- 以 30 個[205971] 交換 1 把獎賞寶箱的銀鑰匙
	elseif Num >= 135 then
		SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_13]" )	-- 謝謝你對我們突擊隊的協助，你想使用[205971]來交換獎賞嗎？
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_14]" , "LuaPE_ZONE8_ExChange1" , 0 )	-- 以 30 個[205971] 交換 1 把[206011]
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_PE_ZONE8_15]" , "LuaPE_ZONE8_ExChange2" , 0 )	-- 以 135 個[205971] 交換 5 把[206012]
	end
end

function LuaPE_ZONE8_ExChange1()
	local ItemID = 205971		-- 蛇人徽記
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙

	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( OwnerID() , NeedSpace )
	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
		return false
	else
		if CountBodyItem( OwnerID() , ItemID ) >= 30 then
			if DelBodyItem( OwnerID() , ItemID , 30 ) == true then
				SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_16]" )	-- 這是寶箱的鑰匙，請你選擇喜歡的寶箱打開，以取得你交換的獎賞物品吧！
				GiveBodyItem( OwnerID() , SilverKeyID , 1 )
			end
		end
	end
end

function LuaPE_ZONE8_ExChange2()
	local ItemID = 205971		-- 蛇人徽記
	--local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local GoldenKeyID = 206011	-- 突擊隊銀鑰匙

	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( OwnerID() , NeedSpace )
	if ( NeedSpaceStatus  == false ) then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
		return false
	else
		if CountBodyItem( OwnerID() , ItemID ) >= 135 then
			if DelBodyItem( OwnerID() , ItemID , 135 ) == true then
				SetSpeakDetail( OwnerID() , "[SC_PE_ZONE8_16]" )	-- 這是寶箱的鑰匙，請你選擇喜歡的寶箱打開，以取得你交換的獎賞物品吧！
				GiveBodyItem( OwnerID() , GoldenKeyID , 5 )
			end
		end
	end
end

function LuaPE_ZONE8_BowBox1()	-- 開寶箱動作
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local UseSilverKey = 0		-- 使用銀鑰匙
	local UseGoldenKey = 0		-- 使用金鑰匙

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- 需要鑰匙才能開啟
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox1" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox2()	-- 開寶箱動作
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local UseSilverKey = 0		-- 使用銀鑰匙
	local UseGoldenKey = 0		-- 使用金鑰匙

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- 需要鑰匙才能開啟
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox2" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox3()	-- 開寶箱動作
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local UseSilverKey = 0		-- 使用銀鑰匙
	local UseGoldenKey = 0		-- 使用金鑰匙

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- 需要鑰匙才能開啟
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox3" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox4()	-- 開寶箱動作
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local UseSilverKey = 0		-- 使用銀鑰匙
	local UseGoldenKey = 0		-- 使用金鑰匙

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- 需要鑰匙才能開啟
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox4" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end
function LuaPE_ZONE8_BowBox5()	-- 開寶箱動作
	local SilverKeyID = 206011	-- 突擊隊銀鑰匙
	local GoldenKeyID = 206012	-- 突擊隊金鑰匙
	local UseSilverKey = 0		-- 使用銀鑰匙
	local UseGoldenKey = 0		-- 使用金鑰匙

	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 1 then
		--ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )
	else
		if CountBodyItem( OwnerID() , SilverKeyID ) >= 1 then
			UseSilverKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		elseif CountBodyItem( OwnerID() , GoldenKeyID ) >= 1 then
			UseGoldenKey = 1
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, "[TREASURE_NEED_KEY]", C_DEFAULT )	-- 需要鑰匙才能開啟
		end
	end

	if UseSilverKey == 1 or UseGoldenKey == 1 then
		local NeedSpace = 6
		if EmptyPacketCount( OwnerID() ) < NeedSpace then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		elseif QueuePacketCount( OwnerID() ) > 0 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			return
		end

		if BeginCastBar( OwnerID() , "[TREASURE_OPEN]" , 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
		while true do
		Sleep( 2 )
			local CastBarStatus = CheckCastBar( OwnerID() )
			if ( CastBarStatus ~= 0 ) then 
				if ( CastBarStatus > 0) then -- 成功
					result = "OKOK"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				elseif ( CastBarStatus < 0 ) then -- 失敗
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end
		end

		if ( result == "OKOK" ) then
			if DelBodyItem( OwnerID() , SilverKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end
			elseif DelBodyItem( OwnerID() , GoldenKeyID , 1 ) == true then
				local BoxContentID , BoxContentNum = LuaPE_ZONE8_BoxContent()
				PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_BEGIN , ruFUSION_ACTORSTATE_ACTIVATE_LOOP )
				WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
				SetPlot( TargetID() , "TOUCH" , "" , 0 )
				for i = 1 , table.getn(BoxContentID) do
					GiveBodyItem( OwnerID() , BoxContentID[i] , BoxContentNum[i] )
					Sleep(5)
				end	
			end

			Sleep( 10 )
			SetPlot( TargetID() , "TOUCH" , "LuaPE_ZONE8_BowBox5" , 15 )
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
			PlayMotionEX( TargetID() , ruFUSION_ACTORSTATE_ACTIVATE_END , ruFUSION_ACTORSTATE_NORMAL )

		else
			WriteRoleValue( TargetID() , EM_RoleValue_PID , 0 )
		end
	end
end

function LuaPE_ZONE8_BoxContent()

	local BoxContentID = {}
	local BoxContentNum = {}

	BoxContentID[1] = 206249	-- 一袋溶解石
	BoxContentNum[1] = 2

	BoxContentID[2] = 206250	-- 一袋符文
	BoxContentNum[2] = 1

	local RNDType = Rand( 100 ) + 1	-- 產生 1~100 的亂數
	
	if RNDType > 1 and RNDType <= 33 then
		local MaterialID = {}	-- 材料LV53
		MaterialID[1] = 200242	-- 巫鐵礦
		MaterialID[2] = 200306	-- 紫杉木
		MaterialID[3] = 200345	-- 月石斛
		local MaterialNum = {}
		MaterialNum[1] = 20
		MaterialNum[2] = 20
		MaterialNum[3] = 20

		BoxContentID[3] = MaterialID[1]	-- 巫鐵礦
		BoxContentNum[3] = MaterialNum[1]
		BoxContentID[4] = MaterialID[2]	-- 紫杉木
		BoxContentNum[4] = MaterialNum[2]
		BoxContentID[5] = MaterialID[3]	-- 月石斛
		BoxContentNum[5] = MaterialNum[3]


		local MaterialRuneID = {}	-- 生產符文
		MaterialRuneID[1] = 200850	-- 連接
		MaterialRuneID[2] = 200851	-- 冷卻
		MaterialRuneID[3] = 200852	-- 活化
		MaterialRuneID[4] = 200853	-- 分解
		MaterialRuneID[5] = 200854	-- 純化
		MaterialRuneID[6] = 200855	-- 混合
		local MaterialRuneNum = {}
		MaterialRuneNum[1] = 10
		MaterialRuneNum[2] = 10
		MaterialRuneNum[3] = 10
		MaterialRuneNum[4] = 10
		MaterialRuneNum[5] = 10
		MaterialRuneNum[6] = 10

		local RND1 = Rand( 6 ) + 1	-- 產生 1~6 的亂數
		BoxContentID[6] = MaterialRuneID[RND1]	-- 生產符文
		BoxContentNum[6] = MaterialRuneNum[RND1]

	elseif RNDType > 33 and RNDType <= 66 then
		local PotionID = {}	--  必送藥水
		PotionID[1] = 204889	-- 神靈藥草
		PotionID[2] = 204890	-- 神靈元素石
		PotionID[3] = 200229	-- 強效療傷藥
		PotionID[4] = 200270	-- 強效靈感藥水
		local PotionNum = {}
		PotionNum[1] = 10
		PotionNum[2] = 10
		PotionNum[3] = 4
		PotionNum[4] = 4

		BoxContentID[3] = PotionID[1]	-- 神靈藥草
		BoxContentNum[3] = PotionNum[1]
		BoxContentID[4] = PotionID[2]	-- 神靈元素石
		BoxContentNum[4] = PotionNum[2]
		BoxContentID[5] = PotionID[3]	-- 強效療傷藥
		BoxContentNum[5] = PotionNum[3]
		BoxContentID[6] = PotionID[4]	-- 強效靈感藥水
		BoxContentNum[6] = PotionNum[4]

	elseif RNDType > 66 and RNDType <= 100 then
		local FixPotionID = {}	--  必送藥水
		FixPotionID[1] = 204889	-- 神靈藥草
		FixPotionID[2] = 204890	-- 神靈元素石
		local FixPotionNum = {}
		FixPotionNum[1] = 10
		FixPotionNum[2] = 10

		BoxContentID[3] = FixPotionID[1]	-- 神靈藥草
		BoxContentNum[3] = FixPotionNum[1]
		BoxContentID[4] = FixPotionID[2]	-- 神靈元素石
		BoxContentNum[4] = FixPotionNum[2]

		local RNDPotionID = {}	-- 隨機藥水
		--RNDPotionID[3] = 200271	-- 刺激香水	-- 這個不送
		RNDPotionID[1] = 200272	-- 聖力藥水
		RNDPotionID[2] = 200113	-- 將軍三色香腸
		RNDPotionID[3] = 200114	-- 奶焗魚肉餡餅
		local RNDPotionNum = {}
		RNDPotionNum[1] = 1
		RNDPotionNum[2] = 1
		RNDPotionNum[3] = 1

		local RND2 = Rand( 3 ) + 1	-- 產生 1~3 的亂數
		BoxContentID[5] = RNDPotionID[RND2]	-- 隨機藥水
		BoxContentNum[5] = RNDPotionNum[RND2]

		local RNDFoodID = {}	-- 隨機食物
		RNDFoodID[1] = 200143	-- 茶香鬆餅
		RNDFoodID[2] = 200144	-- 香草可可酥
		local RNDFoodNum = {}
		RNDFoodNum[1] = 3
		RNDFoodNum[2] = 3

		local RND3 = Rand( 2 ) + 1	-- 產生 1~2 的亂數
		BoxContentID[6] = RNDFoodID[RND3]	-- 隨機食物
		BoxContentNum[6] = RNDFoodNum[RND3]
	end

	return BoxContentID , BoxContentNum;

end

function LuaPE_StoneBag( Option )
	local PlayerID = OwnerID()
	local PackageID = 206249 -- 一袋溶解石
	local NeedSpace = 1

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( PlayerID ) < NeedSpace then
			ScriptMessage( PlayerID, PlayerID, 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( PlayerID ) > 0 then
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false;
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		local Stone3ID = 206219	 -- 3屬性獎勵溶解石
		local Stone2ID = 206220	 -- 2屬性獎勵溶解石
		local Stone1ID = 206227	 -- 1屬性獎勵溶解石

		local RND = Rand( 100 ) + 1	-- 產生 1~100 的亂數

		if RND > 0 and RND <= 50 then
			GiveBodyItem( PlayerID , Stone3ID , 1 )
		elseif RND > 50 and RND <= 85 then
			GiveBodyItem( PlayerID , Stone2ID , 1 )
		else
			GiveBodyItem( PlayerID , Stone1ID , 1 )
		end
		UseItemDestroy() 		--刪除使用中的物品
	end
end
function LuaPE_RuneBag( Option )
	local PlayerID = OwnerID()
	local PackageID = 206250 -- 一袋符文
	local NeedSpace = 1
	local NeedSpaceStatus = Check_Bag_Space( PlayerID , NeedSpace )

	local RuneID = 724938	-- 獎勵符文

	if ( Option == "CHECK" ) then
		if EmptyPacketCount( PlayerID ) < NeedSpace then
			ScriptMessage( PlayerID, PlayerID, 1, "[MSG_SONGSONGBAGWARN]", C_DEFAULT )	-- 背包空格欄位不足，無法繼續取得物品！
			return false;
		elseif QueuePacketCount( PlayerID ) > 0 then
			ScriptMessage( PlayerID, PlayerID, 1, "[SC_PE_ZONE8_17]", C_DEFAULT )	-- 請等待物品完全進入到背包之中！
			return false;
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true;
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( PlayerID , RuneID , 1 )
		UseItemDestroy() 		--刪除使用中的物品
	end
end