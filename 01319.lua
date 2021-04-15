--公會城小管家系統
--修改日期: 2009/05/22
--建立者  : 活動企劃 潘晉佳
------------------------------------------------------------------------------
--任務NPC  公會城堡小管家  112588  
------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_cast() --小管家區域廣播  

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
	SetShop( OwnerID() , 600198 , "Test_Shop_Close" );


	if (ZoneID == 402) then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--標記
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--名稱
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--移動
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( OwnerID() , EM_SetModeType_Show, false )--顯示	

	else
		while true do				
			SetPlot( OwnerID(), "range", "LuaN_miyon_guildgirl_say", 100 )  

			sleep(6000) --10分鐘					

			local RANDOWN = rand(30)			
				if RANDOWN == 0 then  
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST01]" , C_SYSTEM )
				elseif RANDOWN == 1 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST02]" , C_SYSTEM )
				elseif RANDOWN == 2 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST04]" , C_SYSTEM ) --本來的[SC_GUILDGIRL_P1_CAST03]是錯誤的，所以用04補位
				elseif RANDOWN == 3 then 
					ScriptMessage( OwnerID(), -1 ,  0 , "[SC_GUILDGIRL_P1_CAST04]" , C_SYSTEM )
				elseif RANDOWN == 4 then
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST05]" , C_SYSTEM )
				elseif RANDOWN == 5 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST06]" , C_SYSTEM )
				elseif RANDOWN == 6 then 
					ScriptMessage( OwnerID(), -1,  0, "[SC_GUILDGIRL_P1_CAST07]" , C_SYSTEM )
				elseif RANDOWN == 7 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST08]" , C_SYSTEM )
				elseif RANDOWN == 8 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST09]" , C_SYSTEM )
				elseif RANDOWN == 9 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST10]" , C_SYSTEM )
				elseif RANDOWN == 10 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST11]" , C_SYSTEM )
				elseif RANDOWN == 11 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST12]" , C_SYSTEM )
				elseif RANDOWN == 12 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST13]" , C_SYSTEM )
				elseif RANDOWN == 13 then 
					ScriptMessage( OwnerID(), -1,  0 , "[SC_GUILDGIRL_P1_CAST14]" , C_SYSTEM )
				elseif RANDOWN == 14 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST15]" , C_SYSTEM )
				elseif RANDOWN == 15 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST16]" , C_SYSTEM )
				elseif RANDOWN == 16 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST17]" , C_SYSTEM )
				elseif RANDOWN == 17 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST18]" , C_SYSTEM )
				elseif RANDOWN == 18 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST19]" , C_SYSTEM )
				elseif RANDOWN == 19 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST20]" , C_SYSTEM )
				elseif RANDOWN == 20 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST21]" , C_SYSTEM )
				elseif RANDOWN == 21 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST22]" , C_SYSTEM )
				elseif RANDOWN == 22 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST23]" , C_SYSTEM )
				elseif RANDOWN == 23 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST24]" , C_SYSTEM )
				elseif RANDOWN == 24 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST25]" , C_SYSTEM )
				elseif RANDOWN == 25 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST26]" , C_SYSTEM )
				elseif RANDOWN == 26 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST27]" , C_SYSTEM )
				elseif RANDOWN == 27 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST28]" , C_SYSTEM )
				elseif RANDOWN == 28 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST29]" , C_SYSTEM )
				elseif RANDOWN == 29 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST30]" , C_SYSTEM )
				elseif RANDOWN == 30 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST31]" , C_SYSTEM )
				elseif RANDOWN == 31 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST32]" , C_SYSTEM )
				elseif RANDOWN == 32 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST33]" , C_SYSTEM )
				elseif RANDOWN == 33 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST34]" , C_SYSTEM )
				elseif RANDOWN == 34 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST35]" , C_SYSTEM )
				elseif RANDOWN == 35 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST36]" , C_SYSTEM )
				elseif RANDOWN == 36 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST37]" , C_SYSTEM )
				elseif RANDOWN == 37 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST38]" , C_SYSTEM )
				elseif RANDOWN == 38 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST39]" , C_SYSTEM )
				elseif RANDOWN == 39 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST40]" , C_SYSTEM )
				elseif RANDOWN == 40 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST41]" , C_SYSTEM )
				elseif RANDOWN == 41 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST42]" , C_SYSTEM )
				elseif RANDOWN == 42 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST43]" , C_SYSTEM )
				elseif RANDOWN == 43 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST44]" , C_SYSTEM )
				elseif RANDOWN == 44 then 
					ScriptMessage( OwnerID(), -1 , 0 , "[SC_GUILDGIRL_P1_CAST45]" , C_SYSTEM )
				end
		end
	end
end

------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_say() 
	Say( TargetID(),"[SC_GUILDGIRL_SAY]")
end
------------------------------------------------------------------------------
--任務NPC  公會城堡小管家  112588 初始對話
------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_0() --NPC 公會城堡小管家
	local Mission = CheckCompleteQuest( OwnerID(), 423103 ); -- 是否完成開啟榮譽商店之任務
	local Str = "[SC_YU_GUILDWAR_MG_00]"
	local StrX = "[SC_YU_GUILDWAR_BUILD_69]"
	LoadQuestOption( OwnerID() )
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_00]" ) --你好，我是公會城堡的小管家，需要我為你做什麼服務嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_01]", " LuaN_miyon_guildgirl_01", 0) -- 公會城堡功能介紹
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_02]" , "LuaN_miyon_guildgirl_02", 0 )    -- 查閱所有公會資訊 --轉自既有script
	AddSpeakOption(OwnerID(), TargetID(),Str, "LuaYU_GUILDWAR_MG_00", 0 )    -- 公會城戰簡介
	if Mission == true then
		AddSpeakOption(OwnerID(), TargetID(),StrX, " LuaYu_GuildWar_HonorShop", 0) -- 開啟榮譽商店
	end
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_03]", " LuaN_miyon_guildgirl_03", 0) -- 我想離開公會城堡

	if CheckBuff( OwnerID() , 505918 ) == true or CheckBuff( OwnerID() , 505919 ) == true or CheckBuff( OwnerID() , 505920 ) == true then --清除公會戰的debuff
		if GetSystime(1) ~= 20 then
			Say(TargetID(),"[SC_YU_GUILDWAR_MG_17]")
			CancelBuff_NoEvent( OwnerID() , 505918 )
			CancelBuff_NoEvent( OwnerID() , 505919 )
			CancelBuff_NoEvent( OwnerID() , 505920 )
		end
	end
end

function LuaYu_GuildWar_HonorShop() --NPC 公會城堡小管家
	CloseSpeak(OwnerID())           --關閉對話視窗
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--職業
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --是否具有通行證 = GM測試
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,  EM_RoleValue_GuildID ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,  EM_RoleValue_GuildID ) 

	OpenShop()

end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_01() -- 公會城堡功能介紹
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_10]" ) --有什麼需要我為你說明嗎？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_11]", " LuaN_miyon_guildgirl_11", 0) --公會城堡
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_12]", " LuaN_miyon_guildgirl_12", 0) --公會建築
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_13]", " LuaN_miyon_guildgirl_13", 0) --公會傢俱
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_14]", " LuaN_miyon_guildgirl_14", 0) --公會銀行
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_02() -- 查閱所有公會資訊     
	CloseSpeak(OwnerID())           --關閉對話視窗
	OpenClientMenu(OwnerID() , EM_ClientMenuType_GuildList )       --執行公會城列表劇情	
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_03() -- 我想離開公會城堡     
	CloseSpeak(OwnerID())  --關閉對話視窗
	BeginPlot( OwnerID() , "LuaS_111765_01" , 0 ) 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_11() --公會城堡
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_20]" ) --公會城堡是公會成員共有的領地(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_21]", " LuaN_miyon_guildgirl_21", 0) --公會資訊
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_22]", " LuaN_miyon_guildgirl_22", 0) --參觀公會城堡
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_81]", " LuaN_miyon_guildgirl_23", 0) --升級公會城堡
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_21() --公會資訊
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_23]" ) --公會會長可在功能列(略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_22() --參觀公會城堡
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_24]" ) --如果想參觀他人的公會城堡 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_23() --升級公會城堡
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_82]" ) --如果想參觀他人的公會城堡 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_11", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_12() --公會建築
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_30]" ) --基本說明內容(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_31]", " LuaN_miyon_guildgirl_31", 0) --如何建立建築物
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_32]", " LuaN_miyon_guildgirl_32", 0) --建築物種類介紹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_31() --如何建立建築物
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_90]" ) --
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_48]", " LuaN_miyon_guildgirl_48", 0) --建造建築物
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_46]", " LuaN_miyon_guildgirl_46", 0) --移除建築物
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_49]", " LuaN_miyon_guildgirl_49", 0) --升級科技樹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_12", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_48() --建造建築物
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_33]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_46() --移除建築物
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_47]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_49() --升級科技樹
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_91]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_31", 0 ) --回到上一層 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_32()--建築物種類說明
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_34]" ) --接下來，就為你介紹各種類型的建築物吧！ (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_35]" , "LuaN_miyon_guildgirl_35", 0 ) --一般建築
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_36]" , "LuaN_miyon_guildgirl_36", 0 ) --科技樹
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_12", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end 
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_35()-- 一般建築
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_38]" ) --一般建築 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_32", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_36() -- 科技樹
	SetSpeakDetail( OwnerID(), "[SC_GUILDGIRL_P1_39]" ) --科技樹 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_40]" , "LuaN_miyon_guildgirl_40", 0 ) --科技樹功能介紹 - 第一頁
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_43]" , "LuaN_miyon_guildgirl_43", 0 ) --科技樹功能介紹 - 第二頁
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_44]" , "LuaN_miyon_guildgirl_44", 0 ) --科技樹功能介紹 - 第三頁
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_32", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end

--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_40()--科技樹功能介紹 第一頁
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --你想了解哪種科技樹呢？ 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE01]" , "LuaN_miyon_guildgirl_tree01", 0 ) --學院
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE02]" , "LuaN_miyon_guildgirl_tree02", 0 ) --農田
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE03]" , "LuaN_miyon_guildgirl_tree03", 0 ) --冶煉廠
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE04]" , "LuaN_miyon_guildgirl_tree04", 0 ) --圖書館
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE05]" , "LuaN_miyon_guildgirl_tree05", 0 ) --馬廄
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE06]" , "LuaN_miyon_guildgirl_tree06", 0 ) --伐木廠
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_43()--科技樹功能介紹 第二頁
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --你想了解哪種科技樹呢？ 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE07]" , "LuaN_miyon_guildgirl_tree07", 0 ) --校場
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE08]" , "LuaN_miyon_guildgirl_tree08", 0 ) --守衛塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE09]" , "LuaN_miyon_guildgirl_tree09", 0 ) --兵工廠
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE10]" , "LuaN_miyon_guildgirl_tree10", 0 ) --農產中心
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE11]" , "LuaN_miyon_guildgirl_tree11", 0 ) --加工廠
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_44()--科技樹功能介紹 第三頁
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_41]" ) --你想了解哪種科技樹呢？ 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE12]" , "LuaN_miyon_guildgirl_tree12", 0 ) --無敵強攻塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE13]" , "LuaN_miyon_guildgirl_tree13", 0 ) --絕對防壁塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE14]" , "LuaN_miyon_guildgirl_tree14", 0 ) --魔幻護體塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE15]" , "LuaN_miyon_guildgirl_tree15", 0 ) --飛快成長塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE16]" , "LuaN_miyon_guildgirl_tree16", 0 ) --高速學習塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_P1_TREE17]" , "LuaN_miyon_guildgirl_tree17", 0 ) --神奇運勢塔
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_36", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree01() --學院
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE01W]" ) --學院介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree02() --農田
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE02W]" ) --農田介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree03() --冶煉廠
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE03W]" ) --冶煉廠介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree04() --圖書館
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE04W]" ) --圖書館介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree05() --馬廄
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE05W]" ) --馬廄介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_40", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end

--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree06() --伐木廠
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE06W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree07() --校場
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE07W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree08() --守衛塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE08W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree09() --兵工廠
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE09W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree10() --農產中心
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE10W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree11() --加工廠
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE11W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_43", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree12() --無敵強攻塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE12W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree13() --絕對防壁塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE13W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree14() --魔幻護體塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE14W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree15() --飛快成長塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE15W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree16() --高速學習塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE16W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_tree17() --神奇運勢塔
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_TREE17W]" ) --介紹內容 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_44", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_13() --公會傢俱
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_50]" ) --公會傢俱的操作方式和擺設在個人小屋相同(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_51]", " LuaN_miyon_guildgirl_51", 0) --確認權限
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 

end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_51() --確認權限
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_57]" ) --確認權限(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_52", 0) --下一步
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_52() --取得傢俱
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_58]" ) --取得傢俱(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_53", 0) --下一步
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_51", 0) --上一步
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_53() --放入傢俱列表
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_59]" ) --放入傢俱列表 (略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_54", 0) --下一步
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_52", 0) --上一步
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_54() --擺放傢俱
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_60]" ) --擺放傢俱(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_55", 0) --下一步
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_53", 0) --上一步
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_55() --編輯傢俱
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_61]" ) --編輯傢俱(略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_NEXT]", " LuaN_miyon_guildgirl_56", 0) --下一步
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_STEP_BACK]", " LuaN_miyon_guildgirl_54", 0) --上一步
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
function LuaN_miyon_guildgirl_56() --回收傢俱
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_62]" ) --回收傢俱(略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_13", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
---------------------------------------------------------------------------------
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_14() --公會銀行
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_70]" ) --公會銀行提供公會成員存放各種物品 (略)
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_71]", " LuaN_miyon_guildgirl_71", 0) --如何使用存取功能
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_72]", " LuaN_miyon_guildgirl_72", 0) --功能選項說明
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_01", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 	
function LuaN_miyon_guildgirl_71() --如何使用存取功能
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_73]" ) --如何使用存取功能 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_14", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_72() --功能選項說明
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_74]" ) --下方為公會銀行的選項說明，需要我為你說明哪一項呢？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_75]", " LuaN_miyon_guildgirl_75", 0) --存取紀錄 
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_76]", " LuaN_miyon_guildgirl_76", 0) --權限設定
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_P1_77]", " LuaN_miyon_guildgirl_77", 0) --購買新頁
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_14", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_75() --存取紀錄 
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_78]" ) --存取紀錄 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_76() --權限設定
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_79]" ) --權限設定 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 
function LuaN_miyon_guildgirl_77() --購買新頁
	SetSpeakDetail(OwnerID(), "[SC_GUILDGIRL_P1_80]" ) --購買新頁 (略)
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaN_miyon_guildgirl_72", 0 ) --回到上一層
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end
--------------------------------------------------------------------------------- 

function LuaU_GuildWar_Title_01() --刪除所有榮譽頭銜

	local Title = 0

	for i = 0 , 27 do
		Title = 530433 + i
		DelBodyItem(OwnerID(),Title,1) --扣除物品
	end

	SetFlag( OwnerID()  , 543768 , 0 )
end
--------------------------------------------------------------------------------- 
function LuaU_GuildWar_Title_02() --獲得所有榮譽頭銜

	local Title = 0

	for i = 0 , 27 do
		Title = 530433 + i
		GiveBodyItem( OwnerID() , Title , 1 ) --扣除物品
	end
end

---------------------------------------------------------------------------------
function LuaYU_GUILDWAR_MG_00() -- 公會城戰簡介
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_01]" ) --公會城戰乃冒險者協會籌劃，為了讓公會間可以互相交流，彼此砥礪、切磋而舉辦的盛大競賽。無論勝敗都將因為參與，獲得寶貴的實戰經驗與提升能力的榮譽頭銜。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_02]", "LuaYU_GUILDWAR_MG_01", 0) --參戰規則
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_03]", "LuaYU_GUILDWAR_MG_02", 0) --公會建設
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_W9_01]", "LuaYU_GUILDWAR_MG_03", 0) --攻城器具
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_04]", "LuaYU_GUILDWAR_MG_04", 0) --城戰獎勵
	AddSpeakOption(OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK]" , "LuaN_miyon_guildgirl_0", 0 ) --回到主選單 
end

function LuaYU_GUILDWAR_MG_01() -- 參戰規則
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_05]" ) --公會城戰時刻表
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_06]", " LuaYU_GUILDWAR_MG_01_1", 0) --資源說明
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_07]", " LuaYU_GUILDWAR_MG_01_2", 0) --競賽制度
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_08]", " LuaYU_GUILDWAR_MG_01_3", 0) --特殊能力
	AddSpeakOption(OwnerID(), TargetID(), "[SC_YU_GUILDWAR_MG_09]", " LuaYU_GUILDWAR_MG_01_4", 0) --死亡影響
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_02() -- 公會建設
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_14]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_03() -- 攻城器具
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_15]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_04() -- 城戰獎勵
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_16]" ) 
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_00", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_01_1() -- 資源說明
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_10]" ) --資源說明
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_01_2() -- 競賽制度
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_11]" ) --競賽制度
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_01_3() -- 特殊能力
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_12]" ) --特殊能力
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --回到上一層 
end

function LuaYU_GUILDWAR_MG_01_4() -- 死亡影響
	SetSpeakDetail(OwnerID(), "[SC_YU_GUILDWAR_MG_13]" ) --死亡影響
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_GUILDGIRL_BACK_01]" , "LuaYU_GUILDWAR_MG_01", 0 ) --回到上一層 
end