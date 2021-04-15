-------------------------------------------------------------------------------------------------------

--馬廄

-------------------------------------------------------------------------------------------------------
function GuildRideBuffSkill()	-- 馬廄掛npc身上

	local ClickObj = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--轉向
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	
		AddBuff( OwnerID() , 505921 , 69, -1 )	--70%	--被玩家攻擊傷害折扣 法術等級 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--被NPC攻擊傷害增加 法術等級 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --非戰鬥中不回血的buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--紀錄為大型建築物---***
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --死亡劇情
	end

	local SkillLv = 0
	if ClickObj  == 112467 then
		SkillLv = 0
	elseif ClickObj  == 112468 then
		SkillLv = 1
	elseif ClickObj  == 112469 then
		SkillLv = 2
	elseif ClickObj  == 112470 then
		SkillLv = 3
	elseif ClickObj  == 112471 then
		SkillLv = 4
	elseif ClickObj  == 112472 then
		SkillLv = 5
	elseif ClickObj  == 112473 then
		SkillLv = 6
	elseif ClickObj  == 112474 then
		SkillLv = 7
	elseif ClickObj  == 112475 then
		SkillLv = 8
	elseif ClickObj  == 112476 then
		SkillLv = 9
	elseif ClickObj  == 112477 then
		SkillLv = 10
	end
	while 1 do
		local Obj
		local Count = SetSearchAllPlayer(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				if Obj:IsPlayer() == true and Obj:RoomID() == RoomID then

					local PlayerGuildID = ReadRoleValue(  ID ,   EM_RoleValue_GuildID  ) 
					local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 

					if PlayerGuildID == BuildingGuildID then
						AddBuff(ID,503496,SkillLv,12)
						--Say(ID,"SkillLv="..SkillLv)
					end
				end
			end	
		end
		Sleep(100)
	end
end


function GuildRideBuff01()	-- 馬廄掛npc身上

--	Say( TargetID() ,"TargetID"..2 )--馬廄
--	Say( OwnerID() ,"OwnerID"..2 )--玩家

	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業


	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (VOC == 0) then

		SetSpeakDetail( OwnerID(), "[SC_YU_GUILDWAR_W4_00]"   )--

		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_05]" , "GuildRideBuff02", 0 ) --兌換坐騎BUFF
		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_01]".."[505315]" , "GuildRideBuff00", 0 ) --研發輪軸技術


	elseif PlayerGuildID ~= BuildingGuildID then
		LoadQuestOption( OwnerID() )
		--SetSpeakDetail( TargetID(), "[GUILD_REMINDER]"   )
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --你不是公會成員
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 

	elseif (ZoneID == 402) or (ZoneID == 47) then

		SetSpeakDetail( OwnerID(), "[SC_YU_GUILDWAR_W4_00]"   )--


		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_01]".."[505315]" , "GuildRideBuff00", 0 ) --研發輪軸技術
		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_05]" , "GuildRideBuff02", 0 ) --兌換坐騎BUFF

	else

		LoadQuestOption( OwnerID() )

		if ClickObj  >= 112467 then
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE01]" , "CheckRiderBuff02", 0 ) -- 花費550取得增加騎乘速度的效果

			if ClickObj  >= 112468 then
			AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE02]" , "CheckRiderBuff03", 0 ) -- 花費750取得增加騎乘速度的效果

				if ClickObj  >= 112469 then
				AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE03]" , "CheckRiderBuff04", 0 ) -- 花費950取得增加騎乘速度的效果

					if ClickObj  >= 112470 then
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE04]" , "CheckRiderBuff05", 0 ) -- 花費1150取得增加騎乘速度的效果

						if ClickObj  >= 112471 then
						AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE05]" , "CheckRiderBuff06", 0 ) -- 花費1350取得增加騎乘速度的效果

							if ClickObj  >= 112472 then
							AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE06]" , "CheckRiderBuff07", 0 ) -- 花費1550取得增加騎乘速度的效果

								if ClickObj  >= 112473 then
								AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE07]" , "CheckRiderBuff08", 0 ) -- 花費1750取得增加騎乘速度的效果

									if ClickObj  >= 112474 then
									AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE08]" , "CheckRiderBuff09", 0 ) -- 花費1950取得增加騎乘速度的效果

										if ClickObj  >= 112475 then
										AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE09]" , "CheckRiderBuff10", 0 ) -- 花費2150取得增加騎乘速度的效果

											if ClickObj  >= 112476 then
											AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE10]" , "CheckRiderBuff11", 0 ) -- 花費2350取得增加騎乘速度的效果

											end	
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	--SetPlot( OwnerID() , "Touch" , "CheckRiderBuff02" , 150 )
	--Say( OwnerID() , "1" ) 
end


function GuildRideBuff00()

	CloseSpeak( OwnerID() )
--	Say( TargetID() ,"TargetID"..3 )
--	Say( OwnerID() ,"OwnerID"..3 )
	Beginplot( TargetID() ,"GuildRideBuff00_2", 0 )
end

function GuildRideBuff00_2()

--	Say( TargetID() ,"TargetID"..3 )
--	Say( OwnerID() ,"OwnerID"..3 )
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_02", 0 )
end


function GuildRideBuff02()	-- 戰時才有用  _  馬廄掛npc身上

	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local PlayerGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	 local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID  ) 

	LoadQuestOption( OwnerID() )

	if ClickObj  >= 112467 then
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE01]" , "CheckRiderBuff02", 0 ) -- 花費550取得增加騎乘速度的效果

			if ClickObj  >= 112468 then
			AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE02]" , "CheckRiderBuff03", 0 ) -- 花費750取得增加騎乘速度的效果

				if ClickObj  >= 112469 then
				AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE03]" , "CheckRiderBuff04", 0 ) -- 花費950取得增加騎乘速度的效果

					if ClickObj  >= 112470 then
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE04]" , "CheckRiderBuff05", 0 ) -- 花費1150取得增加騎乘速度的效果

						if ClickObj  >= 112471 then
						AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE05]" , "CheckRiderBuff06", 0 ) -- 花費1350取得增加騎乘速度的效果

							if ClickObj  >= 112472 then
							AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE06]" , "CheckRiderBuff07", 0 ) -- 花費1550取得增加騎乘速度的效果

								if ClickObj  >= 112473 then
								AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE07]" , "CheckRiderBuff08", 0 ) -- 花費1750取得增加騎乘速度的效果

									if ClickObj  >= 112474 then
									AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE08]" , "CheckRiderBuff09", 0 ) -- 花費1950取得增加騎乘速度的效果

										if ClickObj  >= 112475 then
										AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE09]" , "CheckRiderBuff10", 0 ) -- 花費2150取得增加騎乘速度的效果

											if ClickObj  >= 112476 then
											AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE10]" , "CheckRiderBuff11", 0 ) -- 花費2350取得增加騎乘速度的效果

											end	
										end
									end
								end
							end
						end
					end
				end
			end
	end

end
-------------------------------------------------------------------------------------------------------
	--function CheckRiderBuff02()	--給Target Plot
	--	if BeginCastBar( OwnerID() , "[GUILD_STABLE_1]" , 60 , ruFUSION_ACTORSTATE_NORMAL , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then --研究騎乘技術
	--			
	--			while 1 do
	--				if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
	--					result = true
	--					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
	--					break;
	--				end
 	--	
	--				if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
	--					result = false
	--					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
	--					break;
	--				end
 	--	
	--			CloseSpeak( OwnerID() )
	--			sleep( 5 )
	--			end
	--		if result == true then 
	--		ScriptMessage( OwnerID(), TargetID(), 1, "[GUILD_STABLE_2]", C_DEFAULT )	-- 經過認真地研發騎乘技術，你的坐騎移動速度上升了！
	--		BeginPlot( TargetID() , "CheckRiderBuff03" , 0 )	
	--		end
	--	end
	--end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff02()	--檢查給予對應buff
	--Say(OwnerID(),"02")
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 1
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff02_1",0)
	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 550 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -550 )
			CastSpell( OwnerID() , OwnerID() , 492703)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff02_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 550 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -550 )
						CastSpell( OwnerID() , OwnerID() , 492703)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff03()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 2
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end

	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff03_1",0)
	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 750 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -750 )
			CastSpell( OwnerID() , OwnerID() , 492704)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff03_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 750 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -750 )
						CastSpell( OwnerID() , OwnerID() , 492704)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end			
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff04()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 3
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff04_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 950 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -950 )
			CastSpell( OwnerID() , OwnerID() , 492705)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end

function CheckRiderBuff04_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 950 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -950 )
						CastSpell( OwnerID() , OwnerID() , 492705)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff05()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 4
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff05_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1150 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1150 )
			CastSpell( OwnerID() , OwnerID() , 492706)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff05_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1150 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1150 )
						CastSpell( OwnerID() , OwnerID() , 492706)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff06()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 5
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff06_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1350 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1350 )
			CastSpell( OwnerID() , OwnerID() , 492707)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff06_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1350 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1350 )
						CastSpell( OwnerID() , OwnerID() , 492707)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff07()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 6
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff07_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1550 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1550 )
			CastSpell( OwnerID() , OwnerID() , 492708)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff07_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1550 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1550 )
						CastSpell( OwnerID() , OwnerID() , 492708)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff08()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 7
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff08_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1750 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1750 )
			CastSpell( OwnerID() , OwnerID() , 492709)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff08_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1750 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1750 )
						CastSpell( OwnerID() , OwnerID() , 492709)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff09()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 8
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff09_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1950 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1950 )
			CastSpell( OwnerID() , OwnerID() , 492710)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end

function CheckRiderBuff09_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1950 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1950 )
						CastSpell( OwnerID() , OwnerID() , 492710)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff10()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 9
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff10_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2150 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -2150 )
			CastSpell( OwnerID() , OwnerID() , 492711)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff10_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
	
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2150 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -2150 )
						CastSpell( OwnerID() , OwnerID() , 492711)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff11()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 10
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff11_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2350 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -2350 )
			CastSpell( OwnerID() , OwnerID() , 492712)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		end
	end
end
function CheckRiderBuff11_1()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2350 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -2350 )
						CastSpell( OwnerID() , OwnerID() , 492712)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
					end
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end		
end
--------------------------------------------------------------------------------------------------------
	--function CheckRiderBuff03()	--檢查給予對應buff
	--
	--local ClickObj = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	--
	--		if CheckBuff( TargetID() , 502979 ) == true or  CheckBuff( TargetID() , 502980 ) == true or CheckBuff( TargetID() , 502981 ) == true or  CheckBuff( TargetID() , 502982 ) == true or  CheckBuff( TargetID() , 502983 ) == true or  CheckBuff( TargetID() , 502984 ) == true or  CheckBuff( TargetID() , 502985 ) == true or  CheckBuff( TargetID() , 502986 ) == true or  CheckBuff( TargetID() , 502987 ) == true or  CheckBuff( TargetID() , 502988 ) == true then
	--			ScriptMessage( OwnerID(), TargetID(), 1, "[MSG_EFFECT_HAVE]", C_DEFAULT )	-- 物品使用失敗，此效果已存在
	--		else	
	--			if ClickObj  == 112467 then
	--				CastSpell( TargetID() , OwnerID() , 492703 )
	--				sleep( 10 )
	--			elseif ClickObj == 112468 then
	--				CastSpell( TargetID() , OwnerID() , 492704 )
	--				sleep( 10 )
	--			elseif ClickObj == 112469 then
	--				CastSpell( TargetID() , OwnerID() , 492705 )
	--				sleep( 10 )
	--			elseif ClickObj == 112470 then
	--				CastSpell( TargetID() , OwnerID() , 492706 )
	--				sleep( 10 )
	--			elseif ClickObj == 112471 then
	--				CastSpell( TargetID() , OwnerID() , 492707 )
	--				sleep( 10 )
	--			elseif ClickObj == 112472 then
	--				CastSpell( TargetID() , OwnerID() , 492708 )
	--				sleep( 10 )
	--			elseif ClickObj == 112473 then
	--				CastSpell( TargetID() , OwnerID() , 492709 )
	--				sleep( 10 )
	--			elseif ClickObj == 112474 then
	--				CastSpell( TargetID() , OwnerID() , 492710 )
	--				sleep( 10 )
	--			elseif ClickObj == 112475 then
	--				CastSpell( TargetID() , OwnerID() , 492711 )
	--				sleep( 10 )
	--			elseif ClickObj == 112476 then
	--				CastSpell( TargetID() , OwnerID() , 492712 )
	--				sleep( 10 )
	--			else
	--				Say( OwnerID() , "Not Found!!" )
	--			end
	--		end
	--end
-------------------------------------------------------------------------------------------------------

--守衛塔

-------------------------------------------------------------------------------------------------------
function GuildGuideBuff01()	--守衛塔 掛npc身上
local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
local PlayerGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 

	if PlayerGuildID ~= BuildingGuildID then

	SetSpeakDetail( OwnerID(), "[GUILD_REMINDER]" )
	--ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
	--ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 

	else
	LoadQuestOption( OwnerID() )
	if ClickObj  >= 112477 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD01]" , "GuildGuideBuff02", 0 ) -- 花費500聘僱一位lv1傭兵1小時

	if ClickObj  >= 112478 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD02]" , "GuildGuideBuff03", 0 ) -- 花費1000聘僱一位lv2傭兵1小時

	if ClickObj  >= 112479 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD03]" , "GuildGuideBuff04", 0 ) -- 花費2000聘僱一位lv3傭兵1小時

	if ClickObj  >= 112480 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD04]" , "GuildGuideBuff05", 0 ) -- 花費4000聘僱一位lv4傭兵1小時

	if ClickObj  >= 112481 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD05]" , "GuildGuideBuff06", 0 ) -- 花費8000聘僱一位lv5傭兵1小時

	if ClickObj  >= 112482 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD06]" , "GuildGuideBuff07", 0 ) -- 花費16000聘僱一位lv6傭兵1小時

	if ClickObj  >= 112483 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD07]" , "GuildGuideBuff08", 0 ) -- 花費32000聘僱一位lv7傭兵1小時

	if ClickObj  >= 112484 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD08]" , "GuildGuideBuff09", 0 ) -- 花費64000聘僱一位lv8傭兵1小時

	if ClickObj  >= 112485 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD09]" , "GuildGuideBuff10", 0 ) -- 花費128000聘僱一位lv9傭兵1小時

	if ClickObj  >= 112486 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD010]" , "GuildGuideBuff11", 0 ) -- 花費256000聘僱一位lv10傭兵1小時

	end	
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	--Say( OwnerID() , "1end")
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff02()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 500 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -500 )
		CastSpell( OwnerID() , OwnerID() , 492683)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		 sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff03()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1000 )
		CastSpell( OwnerID() , OwnerID() , 492684)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------

function GuildGuideBuff04()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -2000 )
		CastSpell( OwnerID() , OwnerID() , 492685)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff05()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 4000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -4000 )
		CastSpell( OwnerID() , OwnerID() , 492686)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff06()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 8000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -8000 )
		CastSpell( OwnerID() , OwnerID() , 492687)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff07()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 16000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -16000 )
		CastSpell( OwnerID() , OwnerID() , 492688)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff08()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 32000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -32000 )
		CastSpell( OwnerID() , OwnerID() , 492689)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff09()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 64000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -64000 )
		CastSpell( OwnerID() , OwnerID() , 492690)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff10()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 128000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -128000 )
		CastSpell( OwnerID() , OwnerID() , 492691)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		 sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff11()	--檢查給予對應buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 256000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -256000 )
		CastSpell( OwnerID() , OwnerID() , 492692)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --您的金錢不足
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function mmmmmdfsdfsd()	-- 羅格鎮信箱
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]" , "LuaS_110771_OpenMail" , 0 )	-- 開啟信箱
end
-------------------------------------------------------------------------------------------------------
function mmmmmmmsdfsdf()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenMail()		-- 開啟信箱
end

--if CheckInMyGuildHouse(OwnerID()) ==True  then
-------------------------------------------------------------------------------------------------------
function GuildGuide_AttackSituation()
--Say(OwnerID(),"1")
--Say(TargetID(),"2")
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)
	local X = ReadRoleValue( OwnerID() ,EM_RoleValue_X)
	local Y = ReadRoleValue( OwnerID() ,EM_RoleValue_Y)
	local Z = ReadRoleValue( OwnerID() ,EM_RoleValue_Z)
	local DIR = ReadRoleValue( OwnerID() ,EM_RoleValue_Dir)
	local NPC = CreateObj( 102480 , X , Y+40.5 , Z , DIR , 1)
		--SetModeEx( NPC  , EM_SetModeType_DisableRotate , false ) --自動面向
		SetModeEx( NPC  , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( NPC  , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( NPC  , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( NPC  , EM_SetModeType_Mark, false )--標記
		SetModeEx( NPC  , EM_SetModeType_Move, true )--移動
		SetModeEx( NPC  , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( NPC  , EM_SetModeType_HideName, false )--名稱
		SetModeEx( NPC  , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( NPC  , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( NPC  , EM_SetModeType_Show , true ) --不顯示
		AddToPartition(NPC, RoomID)
		Hide(NPC)
		Show( NPC,RoomID)	
 
end