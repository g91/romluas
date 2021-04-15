Function Lua_Hao_GoblinOpenDoor()

	-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。
	local Open =  CheckFlag( OwnerID() , 542689 )--檢查挑戰資格
	--
	if Open == true then  --已確定挑戰
		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_12]"   ) -- 來過了
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_42]" , "Lua_Hao_GoblinOpenDoor_End01", 0 ) --我要離開
	else
		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_01]"   ) --噢！你是[112651]介紹來的呀！我知道了，只要給我30枚必爾汀代幣，我就幫你喬裝並偷渡進去！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "Lua_Hao_GoblinOpenDoor_01", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_23]" , "Lua_Hao_GoblinOpenDoor_End01", 0 ) --不，我正打算離開這裡。
	end

end

--離開至銀瀑村
Function Lua_Hao_GoblinOpenDoor_00()

		CloseSpeak( OwnerID() ) --關閉對話模版
--		LuaDan_HitShrew_CheckOK(3,3,0) --倒數3秒進行
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GOBLINARENA_11]" ,0 ) --傳送回銀瀑村
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_GOBLINARENA_11]" ,0 ) 
		sleep(10)
		ChangeZone( OwnerID(), 4, 0, -5852.6, 572.2, 3326.3, 149.5 ) --前往銀瀑村

end

Function Lua_Hao_GoblinOpenDoor_01()

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_22] "   ) -- 確定要挑戰了嗎？一但選擇挑戰,整體的遊戲時間將會開始倒數，若沒有在時限內完成挑戰，即為失敗。

		AddSpeakOption( OwnerID(), TargetID(), "[SC_111813_YU_02]" , "Lua_Hao_GoblinOpenDoor_02", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_34]" , "Lua_Hao_itemshop_Openthegate", 0 ) --接受挑戰
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_03]" , "Lua_Hao_GoblinOpenDoor_03", 0 ) --不，我不打算這麼做。

end

function Lua_Hao_itemshop_Openthegate() --加入已經賂賄旗標

	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --判斷OwnerID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。
	local Npc = TargetID()
	local RoomID = ReadRoleValue( Npc ,EM_RoleValue_RoomID) 
	CloseSpeak( OwnerID() )  
	for i = 1 , PlayerTeam[0] do
		-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。
		local Open =  CheckFlag( PlayerTeam[i] , 542689 )--檢查挑戰資格
		--
		local MoneyFlag =  CheckFlag( PlayerTeam[i] , 542905 )	-- 賄賂管理員
		if MoneyFlag == false then
			if Open == false then  --尚未挑戰過
				if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 and CountBodyItem( OwnerID()  , 202904 ) >= 1 then                            --必爾汀代幣
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 , "[SC_GOBLINARENA_02]" ,0 ) -- 噓，記得不要說話，打扮成這樣應該看不出是人類了吧？
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 , "[SC_GOBLINARENA_02]" ,0 ) 
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 2, "[SC_GOBLINARENA_35]" , C_SYSTEM )
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0, "[SC_GOBLINARENA_35]" , C_SYSTEM ) -- 只要殺死40隻以上的棉蟲，第二關卡的大門就會開啟，大步前進吧！
					-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。					
					SetFlag( PlayerTeam[i]  , 542689 , 1 )--給予挑戰資格
					SetFlag( PlayerTeam[i]  , 542743 , 1 )--給予寶箱開啟資格
					SetFlag( PlayerTeam[i]  , 542905 , 1 )--給予賄賂FLAG
		--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --變身
				--	ClockOpen( PlayerTeam[i]  ,EM_ClockCheckValue_5,1800,1800,0,"Lua_Clockending","Lua_Hao_GoblinOpenDoor_End03") --倒數計時器 (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
					SetPosByFlag( PlayerTeam[i] , 780235 , 0 )--傳送到 X 號旗子
		--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --變身
					-- 2013.03.21 修正玩家以2人以上人數進入哥布林競賽(Zone 352)時，當玩家還在讀取畫面時，就有其他玩家按下報名，導致該玩家在讀取畫面結束後，不會變身為哥布林的問題。
					SysCastSpellLv( PlayerTeam[i] , PlayerTeam[i] , 493476 , 1 )
					--
					DelBodyItem( PlayerTeam[i]  , 203038 , 30 )--扣代幣
					DelBodyItem( OwnerID()  , 202904 , 1 )--扣代幣
					DesignLog( PlayerTeam[i] , 1126511 , "Accept challenge" )	-- 進入副本後，選擇支付30枚必爾汀代幣與1個傳送門符文時，記錄下的玩家清單
					-- 2013.09.13 修正開啟最後關卡的大門條件與提示訊息不符合及礦坑內的怪物數量有機率大幅增加的問題。
--					if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
					if i == 1 and ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
						WriteRoleValue( Npc , EM_RoleValue_PID , 1 );
						Lua_Hao_GoblinACT_ALLBegin( Npc , PlayerTeam[i] );
					end
					--
				elseif CountBodyItem( PlayerTeam[i]  , 203038 ) < 30 or CountBodyItem( OwnerID()  , 202904 ) == 0 then                            --必爾汀代幣
				--	ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
				--	ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣				
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_112503_NO]" ,0  )--你沒有足夠的必爾汀代幣
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_112503_NO]" ,0  )--你沒有足夠的必爾汀代幣					
				end
			end
		else
			ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_GOBLINARENA_37]" ,0  )--你已經賄賂過NPC
			ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_GOBLINARENA_37]" ,0  )--你已經賄賂過NPC
		end		
	end
end

--開門
Function Lua_Hao_GoblinOpenDoor_02()

	-- 2012.12.27 新增 DesignLog
	
	local Player = OwnerID()
	local Npc = TargetID()
	--
	local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --判斷OwnerID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。
	local RoomID = ReadRoleValue( Npc ,EM_RoleValue_RoomID) 
	CloseSpeak( OwnerID() )  

	DebugMsg( 0 , RoomID , "--Lua_Hao_GoblinOpenDoor_02--  ");
	DebugMsg( 0 , RoomID , "roomid="..RoomID );

	for i = 1 , PlayerTeam[0] do
		-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。
		local Open =  CheckFlag( PlayerTeam[i] , 542689 )--檢查挑戰資格
		--
		if Open == false then  --尚未挑戰過
			if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 then                            --必爾汀代幣
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 , "[SC_GOBLINARENA_02]" ,0 ) -- 噓，記得不要說話，打扮成這樣應該看不出是人類了吧？
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 , "[SC_GOBLINARENA_02]" ,0 ) 
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 2, "[SC_GOBLINARENA_13]" , C_SYSTEM )
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0, "[SC_GOBLINARENA_13]" , C_SYSTEM ) -- 只要殺死40隻以上的棉蟲，第二關卡的大門就會開啟，大步前進吧！
				SetFlag( PlayerTeam[i]  , 542689 , 1 )--給予挑戰資格
				SetFlag( PlayerTeam[i]  , 542743 , 1 )--給予寶箱開啟資格
	--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --變身
			--	ClockOpen( PlayerTeam[i]  ,EM_ClockCheckValue_5,1800,1800,0,"Lua_Clockending","Lua_Hao_GoblinOpenDoor_End03") --倒數計時器 (後面的兩個呼叫函式： "換區消失"，"時間到時呼叫函式")
				SetPosByFlag( PlayerTeam[i] , 780235 , 0 )--傳送到 X 號旗子
	--			AddBuff( PlayerTeam[i]  ,503707 ,1 , -1 ); --變身
				-- 2013.03.21 修正玩家以2人以上人數進入哥布林競賽(Zone 352)時，當玩家還在讀取畫面時，就有其他玩家按下報名，導致該玩家在讀取畫面結束後，不會變身為哥布林的問題。
				SysCastSpellLv( PlayerTeam[i] , PlayerTeam[i] , 493476 , 1 )
				--
				DelBodyItem( PlayerTeam[i]  , 203038 , 30 )--扣代幣
				DesignLog( PlayerTeam[i] , 112651 , "Accept challenge" )	-- 進入副本後，選擇支付30枚必爾汀代幣時，記錄下的玩家清單
				-- 2013.09.13 修正開啟最後關卡的大門條件與提示訊息不符合及礦坑內的怪物數量有機率大幅增加的問題。
--				if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
				if i == 1 and ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
					WriteRoleValue( Npc , EM_RoleValue_PID , 1 )
					Lua_Hao_GoblinACT_ALLBegin( Npc , Player )
				end
				--
			elseif CountBodyItem( PlayerTeam[i]  , 203038 ) < 30 then                            --必爾汀代幣
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
				ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
			end
		end
	end

end

--遊戲持續時間
Function Lua_Hao_GoblinOpenDoor_03()

	CloseSpeak( OwnerID() )    
end

--確定放棄
Function Lua_Hao_GoblinOpenDoor_End01()

	SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_04]"   ) -- 你確定要放棄嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_202800_2]" , "Lua_Hao_GoblinOpenDoor_End02", 0 ) --確定


end

Function Lua_Hao_GoblinOpenDoor_End02()
	CloseSpeak( OwnerID() )  
	BeginPlot( OwnerID() , "Lua_Hao_GoblinOpenDoor_00" , 0 ) 

end

-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Function Lua_Hao_GoblinEnter_00()

		PlayMotion( TargetID(), 85) --Cast表演

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_05]"   ) -- 想參加哥布林競賽嗎？我有門路！只要你肯付30塊必爾汀代幣！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_30]" , "Lua_Hao_GoblinEnter_01", 0 ) --我要報名
		AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINARENA_09]" , "Lua_Hao_GoblinEnter_story", 0 ) --關於哥布林競賽
	--	AddSpeakOption( OwnerID(), TargetID(), "[SC_GOBLINTITLE08]" , "LuaN_mika_goblintitle00", 0 ) --兌換稱號
		AddSpeakOption( OwnerID(), TargetID(), "[SC_CLICKFUNGO24]" , "Lua_na_GoblinTitle0", 0 ) --兌換獎勵(2014.08.22 奈奈更新 6.1.1推出

end

Function Lua_Hao_GoblinEnter_story()

		PlayMotion( TargetID(), 85) --Cast表演

		SetSpeakDetail( OwnerID(), "[SC_GOBLINARENA_10]"   ) -- 哥布林競賽是哥布林各族間的傳統賽事....
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_111352_2]"  , "Lua_Hao_GoblinEnter_00", 0 )--回上一頁

end

function Lua_Hao_GoblinEnter_01()
	-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。
	local Open =  CheckFlag( OwnerID()  , 542689 )--檢查挑戰資格
	--
	if Open == true then  --已確定挑戰

		PlayMotion( TargetID() , 107 ) --搖頭
		SetSpeakDetail( OwnerID() , "[SC_GOBLINARENA_12]" ) -- 同一天內再次偷渡可不理智，被發現的風險太高了，請你明天再來吧。

	else

		CloseSpeak( OwnerID() )    

--		BeginPlot( TargetID() , "LuaYU_111813_5" , 0 )  
				

		local PlayerTeam = LuaFunc_PartyData( OwnerID() )           --判斷OwnerID() 的所有組隊成員的資料(排除不在同地區者但未排除死亡者)， PlayerTeam[0] 第一筆資料為成員人數、第二筆以後為成員資料。

		for i = 1 , PlayerTeam[0] do
			-- 2013.07.31 阿浩：修正玩家於哥布林礦坑中剛好碰上每日重置時間時，後續無法開啟寶箱與哥布林首領對話的問題。
			local OpenOK =  CheckFlag( PlayerTeam[i]  , 542689 )--檢查是否具有挑戰資格
			--
			if OpenOK == false then

				if CountBodyItem( PlayerTeam[i]  , 203038 ) >= 30 then                            --必爾汀代幣

					BeginPlot( PlayerTeam[i] , "Lua_Hao_GoblinEnter_02" , 0 )  

				else
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 1 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣  (  *  本來就有的字串   )
					ScriptMessage( PlayerTeam[i]  , PlayerTeam[i]  , 0 ,"[SC_111813_YU_36]" ,0  )--你沒有足夠的必爾汀代幣
				end

			end
		end
	end

end


function Lua_Hao_GoblinEnter_02()
	if CheckBuff( OwnerID() , 501570) == false then  --增加檢查判斷
		AddBuff(OwnerID() , 501570,0,-1);--然後給予BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GOBLINARENA_31]") --你的隊友邀請你進入副本
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--資料送出有問題
			return
		end
		for i = 0 , 1000 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 1000 then
				if ( SelectID == 0 ) then--確認
					Beginplot( OwnerID() ,"Lua_Hao_GoblinEnter_Go", 0 )
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF	
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--最後清除BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 1000 then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )		
				break

			elseif ( SelectID == -1 ) then
				CancelBuff( OwnerID(), 501570 );--最後清除BUFF
				DialogClose( OwnerID() )	
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end

function Lua_Hao_GoblinEnter_Go()

	ScriptMessage( OwnerID()  , OwnerID()  , 1 , "[SC_GOBLINARENA_08]" ,0 ) -- 夠爽快！跟我來吧～
	ScriptMessage( OwnerID()  , OwnerID()  , 0 , "[SC_GOBLINARENA_08]" ,0 ) -- 夠爽快！跟我來吧～
	sleep(10)
	BeginPlot( OwnerID() , "Lua_Hao_GoblinEnter_Go2" , 0 )  
end

function Lua_Hao_GoblinEnter_Go2()

	if ChangeZone( OwnerID(), 352 , -1 , 1904.7, 308.0 , 2230.2, 358.1) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),352," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
	end

end

function Lua_Hao_GoblinEnter_03()

	PlayMotion( TargetID(), 85) --Cast表演
	sleep(20)
	PlayMotion( TargetID(), 161) --Cast01表演
	sleep(15)
	PlayMotion( TargetID(), 165) --Cast02表演
end

function Lua_Hao_GoblinEnter_04()--確定挑戰後的哥不林表演

	SetPlot( OwnerID(),"range","Lua_Hao_GoblinEnter_03",50 )                                             

end