function GuildBombForItem()	--開爆彈
	--Say( OwnerID() , "1" ) 
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Owner:Dir();
	local Bomb = CreateObj( 112487,BaseX, BaseY, BaseZ, BaseDir , 1 )
	if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
			while 1 do
				if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
					result = true
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end
				if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
					result = false
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end
			sleep( 5 )
			end
		if result == true then 
		sleep( 5 )
		AddToPartition(Bomb, 0 )
		SetPlot( Bomb, "Touch" , "GuildBombForBomb" , 20 )
		CastSpell( Bomb , Bomb ,492453 )
		CastSpell( Bomb , Bomb ,492696 )
		end
	sleep( 5 )
	end
end

function GuildBombForBomb()
	local Bomb=(TargetID())
	if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
			while 1 do
				if ( CheckCastBar( OwnerID()  ) > 0) then -- 成功
					result = true
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end
				if ( CheckCastBar( OwnerID()  )< 0 ) then -- 失敗
					result = false
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end
			sleep( 5 )
			end
			if result == true then 
			local tempa=rand(10)
				--Say( OwnerID() , "i finisfed..." ) 
				DelObj(Bomb)
		end
	end
end

function GuildBombForMagicEnd()
	local Bomb=(OwnerID())
	DelObj(Bomb)
end
function LuaDan_Guildmailbox()	-- 羅格鎮信箱
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 

	if PlayerGuildID ~= BuildingGuildID then
		SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
	else
		LoadQuestOption( OwnerID() )
  		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENMAIL") , "LuaDan_Guildmailbox_02" , 0 )	-- 開啟信箱
	end
end
function LuaDan_Guildmailbox_02()
	CloseSpeak( OwnerID() )	-- 關閉對話視窗
	OpenMail()		-- 開啟信箱
end


function LuaDan_Guildmailbox_WarHide()--公會戰時，隱藏信箱

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	if (ZoneID == 402) then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( OwnerID() , EM_SetModeType_Show, false )--顯示	

	end
end