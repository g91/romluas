---------------------------------------------------------------魔焰塔、電能塔共用---------------------------------------------------------------

function LuaYU_GDWAR_TOWER_01()--test

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951) then
	--	SetCursorType( TargetID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--公會城戰時
	end
end

---------------------------------------------------------------電能塔---------------------------------------------------------------

function LuaYU_GDWAR_TOWER_02_buff_01()--導電技能

	local Player = OwnerID()
	local Tower = TargetID()
	SysCastSpellLv( Tower , Tower , 494667 , 0 )
--	CastSpelllv( TargetID() , TargetID() , 494667 , 0 )

end

---------------------------------------------------------------聖光樹---------------------------------------------------------------

function LuaYU_WarTowerRange_01()--連續產生法術，掛在聖光樹※※※※※

	AddBuff( OwnerID() ,505257,0, -1); --聖光綻放施法

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--公會城戰時
	end

end

function LuaYU_GDWAR_TOWER_juget_01()--檢查非玩家則不補

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )

	if ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_02()--檢查玩家是戰影游則不補  <補MP的>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --判斷目標之職業

	if ( VOC == 1 ) or ( VOC == 2 ) or ( VOC == 3 ) then

		return false

	elseif ( IsPlayer ~= 1 ) then

		return false

	else
		return true
	end

end

function LuaYU_GDWAR_TOWER_juget_03()--檢查玩家非戰士則不補  <補SP1的>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --判斷目標之職業

	if ( VOC == 1 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_04()--檢查玩家非遊俠則不補  <補SP2的>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --判斷目標之職業

	if ( VOC == 2 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_juget_05()--檢查玩家非影行者則不補  <補SP3的>

	local IsPlayer = ReadRoleValue(TargetID() ,EM_RoleValue_IsPlayer  )
	local VOC = ReadRoleValue( TargetID() , EM_RoleValue_VOC) --判斷目標之職業

	if ( VOC == 3 ) and ( IsPlayer == 1 ) then

		return true
	else
		return false
	end

end

function LuaYU_GDWAR_TOWER_03_buff_01()--聖光祝福 + 範圍人MP、專注...etc之劇情

	AddBuff( OwnerID() ,505304,0, 2 ); --汲能塔施法

	AddBuff( OwnerID() ,505305,0, 2 ); --汲能塔施法

	AddBuff( OwnerID() ,505306,0, 2 ); --汲能塔施法

	AddBuff( OwnerID() ,505307,0, 2 ); --汲能塔施法

end

function LuaYU_GDWAR_TOWER_03_buff_02()--聖光樹 => 自我修復開關啟動

--	Say(OwnerID(),"Hello2")

end

---------------------------------------------------------------汲能塔---------------------------------------------------------------

function LuaYU_WarTowerRange_02()--連續產生法術，掛在汲能塔※※※※※
-- 2013.07.31 阿浩:遮蔽以下 505263 汲能塔定時施放劇情，改由 lua 直接執行
--	AddBuff( OwnerID() ,505263,0, -1); --汲能塔施法
--
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--公會城戰時
	end
end

function LuaYU_GDWAR_TOWER_04_buff()--test汲能塔
-- 2013.07.31 阿浩:遮蔽以下基本法術 - 505260 能源汲取劇情，改由 lua 直接執行
--	local OID = OwnerID()
--	AddGuildWarEnergy( OID , 10 )  --增減能量
end
-- 2013.07.31 阿浩:修正公會城戰(Zone 402)物品 - 召喚術：汲能塔(206664)，召喚出的汲能塔(102481)無法汲取能量的問題。
function Hao_GuildWar_Crystal_Extraction_Gem(Player)	-- 汲能塔

	local Tower = OwnerID()
	local Room = ReadRoleValue( Tower , EM_RoleValue_RoomID )
	
	while true do
		Sleep(100)
		local PlayerCamp = GetRoleCampID(Player)	-- 取得玩家陣營
		local TowerCamp = GetRoleCampID(Tower)	-- 取得塔陣營
		if PlayerCamp ~= TowerCamp then	-- 當列表中的玩家不存在時，重新抓取該Room中同一陣營的玩家，由新抓取到的玩家執行給予能量
			local CampList =  SetSearchAllPlayer(Room)
			local SearchPlayer
			for i =1 , CampList , 1 do
				SearchPlayer = GetSearchResult()
				if GetRoleCampID(SearchPlayer) == TowerCamp then	-- 當列表中的玩家等於
					Player = SearchPlayer	-- 重新定義Player
					PlayerCamp = GetRoleCampID(Player)	-- 重新定義玩家陣營
				--	Say( Tower , "Reset Default" )
					break
				end
			end
		end
		if PlayerCamp ~= -1 then
			AddGuildWarEnergy( Player , 10 )  --增加能量
		end
	--	Say( Tower , "Player = "..Player.." , PlayerCamp = "..PlayerCamp.." , Tower Camp = "..TowerCamp.." , Engrgy = "..GetGuildWarEnergy(Player) )
	end
end
---------------------------------------------------------------榮譽心---------------------------------------------------------------
function LuaYU_WarTowerRange_03()--連續產生法術，掛在榮譽心※※※※※

	AddBuff( OwnerID() ,505264,0, -1); --榮譽心施法

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--公會城戰時
	end

end

---------------------------------------------------------------視覺鏡---------------------------------------------------------------
function LuaYU_WarTowerRange_04()--連續產生法術，掛在視覺鏡※※※※※

	AddBuff( OwnerID() ,505262,0, -1); --聖光綻放施法

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 951)  then
	--	SetCursorType( OwnerID() , eCursor_Interact ); --游標變成 齒輪
		SetPlot( OwnerID() , "touch" , "Yuyu_GuildWarBuliding_3_02" , 50 )	--公會城戰時
	end

end

function LuaYU_GDWAR_TOWER_juget_T5_01()--檢查該目標處於戰鬥模式則不潛行

	-- 2013.07.19 阿浩：修正玩家於公會城戰場(Zone 402)城門旁使用物品 - 召喚術：視覺幻鏡(206665)時，每當視覺幻境效果發動時，城門上方會跳出字串 - 未擊中 的問題。
	local Target = TargetID()
	local Door = {
				111577 ,
				111601 ,
				111602 ,
				111603 ,
				112064 ,
				120878 ,
				120880 ,
				121241 ,
				121243 ,
				121246 ,
				121248 ,
				121251 ,
				121253 ,
				122263 ,
				122265 ,
				122268 ,
				122270 ,
				122273 ,
				122275
						}

	local IsAttack = ReadRoleValue( Target , EM_RoleValue_IsAttackMode  )	--該目標處於戰鬥模式
	local OrgID = ReadRoleValue( Target , EM_RoleValue_OrgID )	--目標ID

	for ID = 1 , #Door , 1 do
		if OrgID == Door[ID] then
			return false
		end
	end

	if ( IsAttack == 0 ) then
		return true
	else
		return false
	end
end

--====================================================================================================================
function Yuyu_GW_witchgood_Setbomb_00( Option ) --【炸彈--使用(檢查)】

--Say(OwnerID(),"OwnerID_1")
--Say(TargetID(),"TargetID_1")

	local Distance = GetDistance( OwnerID(), TargetID() )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local BuildingGuildID = GetRoleCampID( TargetID() )
	local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--玩家是否在載具上
	local TargetPlayer =  CheckFlag( TargetID()  , 543769 )--目標玩家是否在載具上

	if ( Option == "CHECK" ) then
		if (ZoneID == 402) or (ZoneID == 951)  then

			if CheckBuff( TargetID() , 505783 ) == true then

				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_18]", 0 ) -- 目標已被安置了
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_18]", 0 ) 
				return false
			elseif ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)~=1 then --目標非玩家
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_60]", 0 ) -- 只能對玩家使用
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_60]", 0 ) 
				return false

			elseif (PlayerIsSit == true) then --玩家在載具上
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- 載具上無法使用
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
				return false

			elseif (TargetPlayer == true) then --玩家在載具上
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204425_1]", 0 ) -- 目標不正確
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204425_1]", 0 ) 
				return false

			elseif Distance > 50  then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]", C_SYSTEM ) --目標過遠！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]", C_SYSTEM ) 
				return false	
			else

				if (OwnerID()) == (TargetID()) then
					BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_3" , 0 )  --裝在自己
					return false
				elseif PlayerGuildID == BuildingGuildID then
					BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_6" , 0 )  --裝在同陣營上
					return false
				else
					return true	
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
			return false
		end

	elseif ( Option == "USE" ) then

		BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 )

	end

end


function Yuyu_GW_witchgood_Setbomb_00_1( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_2" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_2( ) --炸彈安裝
	CastSpell( OwnerID() , TargetID() , 494823 )
end

function Yuyu_GW_witchgood_Setbomb_00_3( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_4" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_4( ) 
	--警告玩家是否要將炸彈裝身上	
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end
	
	local RunTime = 0
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_YU_GUILDWAR_BUILD_26]" )
	DialogSelectStr( OwnerID() , "[SC_OKAY]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 10 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 0 then
			BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 )  
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		elseif DialogStatus == 1 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		end
	end
end

function Yuyu_GW_witchgood_Setbomb_00_5( ) --警告附近玩家
--Say(OwnerID(),"OwnerID") -- 施法者
--Say(TargetID(),"TargetID") -- 中術者

	local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
	local str = "[SC_YU_GUILDWAR_BUILD_17][$SETVAR1="..TargetIDName.."]"--警告！XXX的身上被裝了炸彈

	ScriptMessage( TargetID() , 0 , 1 , str, 0 ) 
	ScriptMessage( TargetID() , 0 , 0 , str, 0 ) 
	DelBodyItem( OwnerID() , 206669 , 1 ) --扣除物品
end

function Yuyu_GW_witchgood_Setbomb_00_6( ) 
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_7" , 0 )  
end

function Yuyu_GW_witchgood_Setbomb_00_7( ) 
	--警告玩家是否要將炸彈裝身上
	if CheckBuff( OwnerID() , 501570) == true then  --增加檢查判斷
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	else	
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	end
		
	local RunTime = 0
	DialogCreate( OwnerID() , EM_LuaDialogType_YesNo , "[SC_YU_GUILDWAR_BUILD_58]" )
	DialogSelectStr( OwnerID() , "[SC_OKAY]" )
	DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
	if( DialogSendOpen( OwnerID() ) == false ) then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SYS_FIXEQ_DATA_ERROR]" , 0 )	--資料送出有問題
		return 0
	end
	while true do
		Sleep( 10 )
		RunTime = RunTime + 1
		if RunTime  > 600 then -- 防無窮迴圈，600 = 一分鐘
			ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_OVERTIME_MSG]", 0 )
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		end

		DialogStatus = DialogGetResult( OwnerID() )
		--Say( PlayerID , DialogStatus )

		if DialogStatus == -2 then
			-- DO nothing
		elseif DialogStatus == 0 then
			BeginPlot( TargetID()  , "Yuyu_GW_witchgood_Setbomb_00_1" , 0 ) 
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		elseif DialogStatus == 1 then
			CancelBuff( OwnerID(), 501570 );--最後清除BUFF
			DialogClose( OwnerID() )
			break
		end
	end
end

--====================================================================================================================

function Yuyu_GW_witchgood_bomb_01( Option ) --炸彈拆除

--Say(OwnerID(),"OwnerID")
--Say(TargetID(),"TargetID")

	local Distance = GetDistance( OwnerID(), TargetID() )
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if ( Option == "CHECK" ) then


		if (ZoneID == 402) or (ZoneID == 951)  then

			if CheckBuff( TargetID() , 505783 ) == false then

				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_15]", C_SYSTEM ) --目標對象並無需拆除之裝置！
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_15]", C_SYSTEM ) 
				return false
			else
				if Distance < 50  then
					return true
				else
					ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204637_2]", C_SYSTEM ) --目標過遠！
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204637_2]", C_SYSTEM ) 

					return false	
				end
			end

		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --你無法在此區域使用該物品！
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

	elseif ( Option == "USE" ) then
		BeginPlot( TargetID()  , "Yuyu_GW_witchgood_bomb_02" , 0 )  
	end

end

function Yuyu_GW_witchgood_bomb_02() -- 炸彈拆除
	BeginPlot( TargetID()  , "Yuyu_GW_witchgood_bomb_03" , 0 )  
end

function Yuyu_GW_witchgood_bomb_03() -- 炸彈拆除

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_14]", 15 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) == 1 then

			while true do
			sleep( 2 )
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
				elseif (CheckID( TargetID() ) == false) then
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end

			if ( result == "OKOK" ) then
				if CheckBuff( TargetID() , 505783 ) == true then
					local OwnerName = "|cffffff20"..GetName( OwnerID() ).."|r"
					local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_16][$SETVAR1="..OwnerName.."][$SETVAR2="..TargetIDName.."]"

					CancelBuff_NoEvent( TargetID(),505783 )--消除此BUFF且不觸發任何效果

					ScriptMessage( OwnerID() , 0 , 1 , str, C_SYSTEM ) --XXX成功的拆除了XXX身上的炸彈
					ScriptMessage( OwnerID() , 0 , 0 , str, C_SYSTEM ) 
					DelBodyItem( OwnerID() , 206680 , 1 ) --扣除物品
				end
			end
		end
end