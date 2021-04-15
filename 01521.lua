--function testk_saynewplot()
	--	local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
	--	local GName=GetGuildName(GID)
	--	Say( OwnerID(),GName)
	--	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	--	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--		RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone
	--	end
	--	Say( OwnerID(),"[GUILD_BUILD_8]")
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold))
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) )		---9
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildMemberCount ) )	---1
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv ) )		---5
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) )		---1
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildState ) )		---2
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine ))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb))
		--Say( OwnerID(),GetGuildName(OwnerID()))

--? runplot  testk_saynewplot
--end


function Lua_Dan_Guild_House_Build()
	if  GuildState( OwnerID() )>1 then
		if  GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) == 9  then
			if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse )==0 then
				if GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv )>=7 then  -----------------------------------real >=7
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_6]"))--申請建立公會城鎮需要公會基金360000，礦物15000、木材15000、藥草15000，確定要申請建立嗎？
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_BUILD_1]" , " Lua_Dan_Guild_House_Build_1", 0 ) --申請建立公會城鎮
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --回到上一頁
				else
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_2]"))--公會等級不足
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --回到上一頁
				end
			else
				SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_4]"))--你已經擁有公會城鎮
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), "[GUILD_BUILD_3]" )--非會長無法申請公會城鎮
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
	end
end

function Lua_Dan_Guild_House_Build_1()
			if GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold) >=360000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine )>=15000 and  GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood)>=15000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb)>=15000 then 
			Beginplot( OwnerID() , "Lua_Dan_Guild_House_Build_2" , 0 )
			else	
			SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_7]"))--公會資源不足
			end
end


function Lua_Dan_Guild_House_Build_2()
local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
local GName=GetGuildName(GID)
if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_NORMAL , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
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

			CloseSpeak( OwnerID() )
			sleep( 5 )
			end
		if result == true then 
		AddGuildResource	(OwnerID()  , -360000 , 0 ,-15000, -15000 ,-15000,0 ,0 ,"RetRunplot" )--------------扣除商會資源
		BeginPlot( OwnerID() , "Sys_BuildGuildHouse" , 0 )	---建立公會城鎮
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
		if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
			RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone test ok
		end
		CloseSpeak( OwnerID() )		-- 關閉對話視窗
		
		end
end
end

function Lua_Dan_Guild_House()
	LoadQuestOption( OwnerID() )	--載入任務模板
	--AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_1]" , "Lua_Dan_Guild_House_Build" , 0 )	-- 申請建立公會城鎮
	AddSpeakOption( OwnerID() , TargetID(), "[SC_GUILDHOUSE_01]" , "Lua_Dan_Guild_House_Enter" , 0 )	-- 選項，我要進入公會城
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_10]" , "Lua_Dan_Guild_BoardOpen" , 0 )	---- 查閱所有公會資訊
end

function Lua_Dan_Guild_BoardOpen()
	BeginPlot( OwnerID() , "Sys_GuildHouseVisit_Open" , 0 )
	CloseSpeak( OwnerID() )
end

function Lua_Dan_Guild_House_EnterTouch()
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then
		BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
	else
	ScriptMessage( OwnerID(), -1 , 1 , "[GUILD_BUILD_5]" , C_SYSTEM )
	end
end



function Lua_Dan_Guild_House_Enter()
	local State = GuildState( OwnerID() )			-- 0 沒有公會 1 連署公會 2 一般公會(還要判斷是否有公會城，以及公會等級)
	if ( State >= 2 ) then

		if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) >= 1 then   ---公會城
			CloseSpeak( OwnerID() )		-- 關閉對話視窗
			BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
		else
			SetSpeakDetail( OwnerID(), "[GUILD_BUILD_5]" )
		end
			
	else
		SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )	
	end
end