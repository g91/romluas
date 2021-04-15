--701314

function LuaDan_112698_0()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112698_1]" )                                   --活動管理員對話內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_2]", "Lua_Dan_112698_1", 0) --關於愛樂節背景
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_3]", "Lua_Dan_112698_2", 0) --關於音樂馬術競賽活動
--	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112698_4]", "Lua_Dan_112698_3", 0) --關於修道院魅影
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_2]", "Lua_Dan_112589_1", 0) --關於禮品兌換方式      
end
---------------------------------------------------------------------------------------------------
--關於愛樂節背景
function Lua_Dan_112698_1()  
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_5]") 				      --愛樂節背景內文
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_16]", "Lua_Dan_112698_1_0", 0) --更多愛樂節背景
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)             --回到上一頁
end

function Lua_Dan_112698_1_0()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_17]") 				   --愛樂節背景內文2
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)          --回到上一頁
end
---------------------------------------------------------------------------------------------------
--關於音樂馬術競賽活動
function Lua_Dan_112698_2()
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_6]")					    --音樂馬術競賽活動內文 (一年一度的音樂馬術競賽又要開始囉，跟著你的戰馬夥伴，考驗你的技術，向著終點前進吧！)
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_7]", "Lua_Dan_112698_4", 0)  --如何完成音樂馬術競賽活動
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_8]", "Lua_Dan_112698_5", 0)  --我要報名音樂馬術競賽活動 (隊長)
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_21]", "Lua_Dan_112698_8", 0) --我要報名協助將音樂盒送達終點 (隊員)
       	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)           --回到上一頁
end

--如何完成音樂馬術競賽活動
function Lua_Dan_112698_4() --規則1
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_12]")  	
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_34]", "Lua_Dan_112698_9", 0) --下一頁
end

function Lua_Dan_112698_9() --規則2
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_33]")  	
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)
end
---------------------------------------------------------------------------------------------------
--關於修道院魅影
function Lua_Dan_112698_3()
	local PFlag = CheckFlag(OwnerID()  , 542553)   --魅影每日flag
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_9]") 				    --修道院魅影活動內文
	AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_10]", "Lua_Dan_112698_6", 0) --如何完成修道院魅影活動
	if PFlag == false then --今天沒接過
		AddSpeakOption (OwnerID(), TargetID(), "[SC_DAN_112698_11]", "Lua_Dan_112698_7", 0) --我要報名修道院魅影活動
	end
       	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)           --回到上一頁
end

function Lua_Dan_112698_6() ---修道院魅影活動規則
	SetSpeakDetail (OwnerID(), "[SC_DAN_112698_14]") 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112698_3", 0)
end

function Lua_Dan_112698_7() --我要報名修道院魅影活動
	CloseSpeak(OwnerID())   --關閉對話視窗 
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_DAN_112698_15]", C_SYSTEM ) --帶著這個神奇的音樂盒，一定會在你前往修道院的旅途上，適時的助你一臂之力！			
	GiveBodyItem( OwnerID() , 204541, 3 ) 	  				   --給音樂盒 				
	SetFlag( OwnerID()  , 542553 , 1 )      
end
---------------------------------------------------------------------------------------------------
--關於禮品兌換方式 
function Lua_Dan_112589_1()
	SetSpeakDetail(OwnerID(), "[SC_DAN_112589_6]" )	 --禮品兌換規則
	AddSpeakOption(OwnerID(), TargetID(), "[SC_DAN_112589_3]", "Lua_Dan_112589_2", 0) --我要兌換茱莉雅禮盒 
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "LuaDan_112698_0", 0)         --回到上一頁
end
---------------------------------------------------------------------------------------------------
function Lua_Dan_112589_2() --茱莉雅禮盒內容物
	local PlayerID = OwnerID()
	local Score = CountBodyItem( OwnerID() , 204457) --樂譜
	local Note  = CountBodyItem( OwnerID() , 204428) --音符
	if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then
		   	if Score >= 15 and Note >= 15 then 
                       		  	SetSpeakDetail (OwnerID(), "[SC_111584_YU_27]" ) --謝謝你的幫忙！請收下這個禮物吧！
				AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112589_1", 0)--回到上一頁
				DelBodyItem( OwnerID() , 204457 , 15 ) --刪掉樂譜15個
				DelBodyItem( OwnerID() , 204428 , 15 ) --刪掉音符15個
       		               	GiveBodyItem( OwnerID() , 204427  , 1) --茱莉雅禮盒
				GiveBodyItem( OwnerID() , 241482  , 15) --15個山岩元素
				DesignLog( OwnerID() , 112698 , "exchage reward" ) -- 兌換獎勵
				----------------  額外有20% 機率給 公會資源 --------------
				local Random = rand(100)+1
				if Random > 80 then
					GiveBodyItem( PlayerID , 725449 , 1 )
				end
				-------------------------------------------------------------
		  	 else
				SetSpeakDetail (OwnerID(), "[K_08MID_DIALOG7]" ) --您所持有的數量不足，還不能兌換喔。			  	
				AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_112589_1", 0)--回到上一頁
		  	 end 
	else
       		 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_21]")  --您的背包空間不足，請清理一下再來吧。	
      		 AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , "Lua_Dan_112589_1", 0 ) --回到上一頁       
	end
end

------------------------------------------------------------------------------
--物品 收件者清單 204114
function LuaDan_112589_List()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_DAN_112698_30]" );
	ShowBorder( OwnerID(), 0, "[SC_DAN_112698_27]" , "ScriptBorder_Texture_Paper" )
end
------------------------------------------------------------------------------
function LuaDan_112589_spellusingcheck()  --檢查此物品是否在特定NPC身上
	
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local MonsterID1 = 101998 --任務npc
	--local MonsterID2 = 101999 --拉比兔 任務npc
	local MonsterID3 = 102000 --拉比兔 任務npc
	local MonsterID4 = 102001 --拉比兔 任務npc
	local MonsterID5 = 102002 --拉比兔 任務npc
	local MonsterID6 = 102003 --拉比兔 任務npc
	local MonsterID7 = 102004 --拉比兔 任務npc
	local MonsterID8 = 102005 --拉比兔 任務npc
	local MonsterID9 = 102006 --拉比兔 任務npc

	if ( CheckID( TargetID() ) == true ) and ( TargetID() ~= OwnerID() ) and ( (OrgID == MonsterID1) or (OrgID == MonsterID3) or (OrgID == MonsterID4) or (OrgID == MonsterID5) or (OrgID == MonsterID6) or (OrgID == MonsterID7) or (OrgID == MonsterID8) or (OrgID == MonsterID9) ) then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_112698_28]" , C_SYSTEM )	--此技能請使用於音樂馬術比賽出現的怪物身上！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_112698_28]" , C_SYSTEM )	--此技能請使用於音樂馬術比賽出現的怪物身上！。
		return false	
	end
end	