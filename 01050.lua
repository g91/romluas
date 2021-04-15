function testk_saynewplot()
		local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
		local GName=GetGuildName(GID)
		Say( OwnerID(),GName)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
	--	if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
	--		RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone
	--	end
		Say( OwnerID(),"[GUILD_BUILD_8]")

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
end


function LuaS_Guild_House_Build()
	if  GuildState( OwnerID() )>1 then
		if  GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) == 9  then --判斷是否為公會會長
			if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse )==0 then --判斷有沒有公會城堡
				if GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv )>=5 then  -----------------------------------real >=5 判斷公會等級是否已經到達5級
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_6]"))--申請建立公會城鎮需要公會基金360000，礦物15000、木材15000、藥草15000，確定要申請建立嗎？
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_BUILD_1]" , " LuaS_Guild_House_Build_1", 0 ) --申請建立公會城鎮
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --回到上一頁
				else
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_2]"))--公會等級不足
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --回到上一頁
				end
			else
				SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_4]"))--你已經擁有公會城鎮
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --回到上一頁
			end
		else
		SetSpeakDetail( OwnerID(), "[GUILD_BUILD_3]" )--非會長無法申請公會城鎮
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --回到上一頁
		end
	else
	SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
	end
end

function LuaS_Guild_House_Build_1()
			if GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold) >=360000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine )>=15000 and  GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood)>=15000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb)>=15000 then 
			Beginplot( OwnerID() , "LuaS_Guild_House_Build_2" , 0 )
			else	
			SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_7]"))--公會資源不足
			end
end


function LuaS_Guild_House_Build_2()
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

function LuaS_Guild_House()
	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_1]" , "LuaS_Guild_House_Build" , 0 )	-- 申請建立公會城鎮
	AddSpeakOption( OwnerID() , TargetID(), "[SC_GUILDHOUSE_01]" , "LuaS_Guild_House_Enter" , 0 )	-- 選項，我要進入公會城
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_10]" , "LuaS_Guild_BoardOpen" , 0 )	---- 查閱所有公會資訊
end

function LuaS_Guild_BoardOpen()
	BeginPlot( OwnerID() , "Sys_GuildHouseVisit_Open" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_Guild_House_EnterTouch()
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then
		BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
	else
	ScriptMessage( OwnerID(), -1 , 1 , "[GUILD_BUILD_5]" , C_SYSTEM )
	end
end



function LuaS_Guild_House_Enter()
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

function LuaS_111765()
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
	else
		SetPlot( OwnerID()  , "collision" , "LuaS_111765_01", 100 )--碰撞劇情
	end
end

function LuaS_111765_01()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDHOUSE_02]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF
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
					local Ret = GoReturnPos( OwnerID() )
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break;
				elseif ( SelectID == 1 ) then
					DialogClose( OwnerID() )		
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					break
				end
			elseif i == 100 or i==-1 then
				DialogClose( OwnerID() )		
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end






function LuaI_111765()
	--SetPlot( OwnerID() , "Range" , "LuaI_111765_01" ,  65 )
end

function LuaI_111765_01()
	--Say( OwnerID() , "TEST" )
end

function LuaS_GuildGate_Main()
	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , TargetID(), "Hide Gate for 10 seconds" , "LuaS_GuildGate_Main_01" , 0 )	-- 選項，
end

function LuaS_GuildGate_Main_01()
	CloseSpeak( OwnerID() )		-- 關閉對話視窗
	BeginPlot( TargetID() , "LuaS_GuildGate_Main_02" , 0 )
end

function LuaS_GuildGate_Left()
	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE") , "LuaS_GuildGate_Main_01" , 0 )	-- 選項，
end

function LuaS_GuildGate_Right()
	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE") , "LuaS_GuildGate_Main_01" , 0 )	-- 選項，
end

function LuaS_GuildGate_Castle()
	LoadQuestOption( OwnerID() )	--載入任務模板
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE")  , "LuaS_GuildGate_Main_01" , 0 )	-- 選項，
end

function LuaS_GuildGate_Main_02()
	local Obj = Role:new( OwnerID() ) 

	--local BaseX = Obj :X()
 	--local BaseY = Obj :Y();
 	--local BaseZ = Obj :Z();
	--local BaseDir = Obj:Dir();
	local BaseRoom = Obj:RoomID()

	Hide( OwnerID() )
	Sleep( 100 )
	Show( OwnerID() , BaseRoom )
end

function Guild_produceNPC()
			local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
			local NPCID = 112588
			local NPC
			local Castle = Role:new(OwnerID()) --公會主堡
			local dis = 360
			local BaseX = Castle :X()
			local BaseY = Castle :Y()
			local BaseZ = Castle :Z()
			local BaseDir = Castle :Dir()
			--Say(OwnerID(),"BaseX="..BaseX.."BaseY="..BaseY)
			local Cal = (math.pi/180)*(BaseDir) 
			--local PID
			--local Register 
			--local Rnpc = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112588, 100 , 1)
			local Rnpcdead = "dead"
			local Obj
			local Count = SetSearchAllNPC(RoomID)
			
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsNPC() == true then
						if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112588 then
							Rnpcdead = "life"
 	 						--Say(OwnerID(),"life")
						end
					end
				end	
			end
			--Say(OwnerID(),"Rnpcdead="..Rnpcdead)

			if Rnpcdead == "dead" then 
 	 			Say(OwnerID(),"dead")
				if( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 401 ) then
					NPC = CreateObj( NPCID , BaseX-dis*math.cos(Cal)-40, BaseY+15 , BaseZ+dis*math.sin(Cal), BaseDir, 1 )
					SetModeEx( NPC, EM_SetModeType_Gravity, true )--重力
					SetModeEx( NPC   , EM_SetModeType_Strikback, false )--反擊
					SetModeEx( NPC   , EM_SetModeType_SearchenemyIgnore, true )--被搜尋
					SetModeEx( NPC   , EM_SetModeType_Obstruct, false )--阻擋
					SetModeEx( NPC   , EM_SetModeType_Mark, true )--標記
					SetModeEx( NPC   , EM_SetModeType_Move, false )--移動
					SetModeEx( NPC   , EM_SetModeType_Searchenemy, false )--索敵
					SetModeEx( NPC   , EM_SetModeType_HideName, false )--名稱
					SetModeEx( NPC   , EM_SetModeType_ShowRoleHead, true )--頭像框
					SetModeEx( NPC   , EM_SetModeType_Fight , false )--可砍殺攻擊
					SetModeEx( NPC   , EM_SetModeType_Show , true ) --不顯示
					AddToPartition(NPC,RoomID)
					Hide(NPC)
					Show(NPC, RoomID)
				end
			end				
end