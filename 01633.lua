function Lua_Dan_114076_Talking() --使用迴圈讓聖誕老公公動作和講話
	AddBuff(  OwnerID(),  503217, 1, -1) 
	local String = { "[Sys110241_szquestnpctext]", "[Sys422084_szquest_uncomplete_detail]",  "[Sys421300_szquest_uncomplete_detail]"}
	------------------------------------------------
	while true do
	----------------------------------------------時間處理
	Sleep(300)

		PlayMotion ( OwnerID() , 122 ); --困擾
		Sleep(20)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), String[1])
--移動
		sleep(10)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), String[2])
		sleep(10)
		PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN ) --蹲下
		NPCSay(OwnerID(), String[3])  --Random
		--Say(OwnerID(), "")
		sleep(10)
		PlayMotion ( OwnerID() , 75 ) --蹲下
		sleep(10)
		PlayMotion ( OwnerID() , 112 );
		NPCSay(OwnerID(), "[SC_2009_XAMS_SANTA_0]") --如果有人能幫忙修復雪橇，我就能繼續我的旅程及時將暖冬節禮物送給世界上每一位乖寶寶了呢... 
		--sleep(10)
	end


end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Main() --第一層
	
	SetSpeakDetail( OwnerID(), "[SC_2009_XAMS_SANTA_1]" )--噢噢噢...暖冬節快樂。你看看我，不小心出了一點小意外，不僅雪橇撞壞了，連糜鹿都走散了，你可以幫幫我修理雪橇和找回糜鹿嗎？孩子們還在等著我呢。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_2]", "Lua_Dan_114076_Quest_1", 0) --修理雪橇 - 找回 20 個[206399]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_3]", "Lua_Dan_114076_Quest_2", 0) --移動雪橇 - 找回10個[206324]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_4]", "Lua_Dan_114076_Quest_3", 0) --尋找馴鹿 - 帶回８個[114095]

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1() --20個雪橇零件報名及說明
	
	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_5]" )--[Sys110241_szquestnpctext]，你看看這個[114078]缺少好多部分，變成零零散散的樣子，據我所知，[206399]被許多怪物拿走了，請你們幫我收集回來，讓我可以修理這個[114089]。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_6]", "Lua_Dan_114076_Quest_1_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - 蒐集20個[206399]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_7]", "Lua_Dan_114076_Quest_1_ConvertReward", 0) --用20個[206399][SC_CLICKFUNGO24]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --回到上一頁

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1_SignUP()  --雪橇零件報名

	local Signed_Flag = CheckFlag(OwnerID()  , 543292) --確認今天是否報名雪橇零件任務
	if Signed_Flag == false then
			PlayMotion ( OwnerID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_8]") --[Sys113420_szquestnpctext]，[Sys420426_szquest_complete_detail]
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_8]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_8]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( OwnerID() , 103 );
			 SetFlag( OwnerID()  , 543292 , 1 ) --給予已兌換獎勵旗標，一天解一次
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --你已經報名過了
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁
	end

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_1_ConvertReward() --雪橇零件換獎勵

	local Signed_Flag = CheckFlag(OwnerID()  ,    543292)    --確認今天是否報名雪橇零件任務
	local Finished_Flag = CheckFlag(OwnerID()  , 543289) --確認今天是否解過雪橇零件任務

		if Finished_Flag == false then
		         if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --給糖果和憑証
				 if CountBodyItem( OwnerID() , 206399) >= 10 then  --計算身上有多少個碎片(20個以上)

					--尋找雪橇劇情，和雪橇動態
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( TargetID() , 500 )
						--local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i], EM_RoleValue_OrgID)
								if  ID == 114089 then
										--加入一個移動到該地方的旗標動作
										--Playmotion(TargetID(), 75) --聖誕老公公開始修理，use item				 	
									BeginPlot( Sledge[i] , "LuaDan_showingmotion" , 20 )										
									--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
									--sleep(20)							
									--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --雪橇回復結束
									--sleep(10)									
									BeginPlot( Sledge[i] , "LuaI_114076_Reset" , 50)

								end
							end	
					------------------------------------------------------------------------------------------------
					--聖誕老人表演劇情
					--給予糖果和憑証
					SetSpeakDetail( OwnerID(), "[SC_111584_YU_27]") --謝謝你的幫忙！請收下這個禮物吧！ 
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_111584_YU_27]" , C_SYSTEM )
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_111584_YU_27]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206399 , 10) --刪除背包中的數量
					SetFlag( OwnerID()  , 543289 , 1 ) --給予已兌換獎勵旗標，一天解一次
				                --GiveBodyItem( OwnerID() , 203524  , 1) --暖冬棒棒糖 * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494691 ); --暖冬老公公的祝福
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --我是乖寶寶憑証
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --您所持有的數量不足，還不能兌換喔。 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --你的背包空間不足
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --你還沒參加這個活動喔～！ 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --今天真是辛苦你了。有興趣的話，明天再繼續請你幫忙喔！ 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_1", 0)--回到上一頁
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_showingmotion()

	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	sleep(30)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END)
	sleep(30)
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2() --１０個浮石任務
	
	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_9]" )--太好了，修理好[114078]之後，我還需要一種具有飄浮能力的[206324]，讓我製作成[206398]，灑在[114078]上就會浮起來，才能帶我前往各地...請前往[ZONE_CAIRN HILL]尋找[206324]吧！
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_10]", "Lua_Dan_114076_Quest_2_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - 蒐集10個[206324]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_11]", "Lua_Dan_114076_Quest_2_Convertthereward", 0) --用10個[206324][SC_CLICKFUNGO24]
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --回到上一頁

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2_SignUP() --報名浮石任務

	local Signed_Flag = CheckFlag(OwnerID()  , 543532) --確認今天是否報名雪橇零件任務
	if Signed_Flag == false then
			PlayMotion ( OwnerID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_12]") --[SC_112311_9]，[SC_111584_YU_36]
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( OwnerID() , 103 );
			 SetFlag( OwnerID()  , 543532 , 1 ) --給予已兌換獎勵旗標，一天解一次
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --你已經報名過了
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁
	end


end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_2_Convertthereward() --浮石恢復雪橇

	local Signed_Flag = CheckFlag(OwnerID()  , 543532) --確認今天是否報名雪橇零件任務
	local Finished_Flag = CheckFlag(OwnerID()  , 543290) --確認今天是否解過雪橇零件任務

		if Finished_Flag == false then
		if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --給一個暖冬甜心糖和憑証
				 if CountBodyItem( OwnerID() , 206324) >= 5 then  --計算身上有多少個魔法粉未(20個以上)

					--尋找雪橇劇情，和雪橇動態
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( OwnerID() , 500 )
						local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i] , EM_RoleValue_OrgID)
								if  ID == 114089 then
										--加入一個移動到該地方的旗標動作
										--Playmotion(TargetID(), 75) --聖誕老公公開始修理，use item
									 	--Playmotion(Sledge[i], 119)	--雪橇開始回復																									
										--sleep(300) --重置時間
										--Playmotion(Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --雪橇回復結束
										--BeginPlot( Sledge[i] , "LuaDan_Sledge_Reset" , 0 )
										ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_24]" , C_SYSTEM )
										ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_24]" , C_SYSTEM )

										CastSpell( Sledge[i], Sledge[i], 494660 ); --施放粉未
										--sleep(10)
										BeginPlot( Sledge[i] , "LuaI_114076_Reset" , 50 ) --重置
										BeginPlot( Sledge[i] , "LuaDan_114076_Newsledge" , 40 ) --重置
										--local New_Sledge = LuaFunc_CreateObjByObj( 114078 , Sledge[i])
										PlayMotion(TargetID(), 128)
								end
							end	
					------------------------------------------------------------------------------------------------
					--聖誕老人表演劇情
					--給予糖果和憑証
					--ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_23]" , C_SYSTEM )
					--ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_23]" , C_SYSTEM )

					SetSpeakDetail( OwnerID(), "[Sys420355_szquest_complete_detail]") --太好了，這就是我要的...這就是我天天期盼得到的東西...我在這裡的日子總算沒有白費...
					ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys420355_szquest_complete_detail]" , C_SYSTEM )
					ScriptMessage( OwnerID() , TargetID() , 0 , "[Sys420355_szquest_complete_detail]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206324 , 5 ) --刪除背包中的數量
					SetFlag( OwnerID()  , 543290 , 1 ) --給予已兌換獎勵旗標，一天解一次
				                --GiveBodyItem( OwnerID() , 203521  , 1) --暖冬棒棒糖 * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494688 ); --暖冬老公公的祝福
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --我是乖寶寶憑証
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --您所持有的數量不足，還不能兌換喔。 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --你的背包空間不足
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --你已經報名過了
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --今天真是辛苦你了。有興趣的話，明天再繼續請你幫忙喔！ 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_2", 0)--回到上一頁
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_New_Sledge_Reset() --把新種出來的雪橇砍掉
	Sleep(100)
	Delobj(OwnerID())
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_114076_Newsledge()
	
	local New_Sledge = LuaFunc_CreateObjByObj( 114078 , OwnerID())
	Playmotion(New_Sledge, 119)
	BeginPlot( New_Sledge , "LuaDan_New_Sledge_Reset" , 10 ) --重置
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3() --10個糜鹿尋找任務

	SetSpeakDetail(OwnerID(), "[SC_2009_XAMS_SANTA_13]" )--[SC_110053_0]，我那些珍貴的夥伴，竟然和我走失了，請您幫幫我尋回 3 位[206441]、3 位[206442]和 2 位[206443]...請你前往[ZONE_HYBORA HIGHLANDS]的[ZONE_ASLAN]，我想應該會找到他們。
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_14]", "Lua_Dan_114076_Quest_3_SignUP", 0) --[SCRIPT_BORDER_ACCEPTQUEST] - 尋找[206441]
	AddSpeakOption(OwnerID(), TargetID(), "[SC_2009_XAMS_SANTA_15]", "Lua_Dan_114076_Quest_3_Convertthereward", 0) --[SC_CLICKFUNGO24] - 我已帶回[206441]。
	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Main", 0)         --回到上一頁

end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3_SignUP() --報名糜鹿任務
--
	local Signed_Flag = CheckFlag(OwnerID()  , 543531) --確認今天是否報名糜鹿任務
	if Signed_Flag == false then
			PlayMotion ( TargetID() , 112 );
			SetSpeakDetail (OwnerID(), "[SC_2009_XAMS_SANTA_12]") --太感謝你了，那就麻煩你了。
			ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_12]" , C_SYSTEM )
			Sleep(10)
			PlayMotion ( TargetID() , 121 );
			PlayMotion ( TargetID() , 103 );
			GiveBodyItem( OwnerID() , 206435  , 8) --給8個銀鈴
			GiveBodyItem( OwnerID() , 206485  , 1) --位置資訊
			 SetFlag( OwnerID()  , 543531, 1 ) --給予已兌換獎勵旗標，一天解一次
	else 
			SetSpeakDetail (OwnerID(), "[SC_MUSICFES_CODE16]") --你已經報名過了
		 	AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁
	end
end
---------------------------------------------------------------------------------------------------------------
function Lua_Dan_114076_Quest_3_Convertthereward() --糜鹿換獎勵 206443 * 2 ,206442 *3, 206441*3

	local Signed_Flag = CheckFlag(OwnerID()  ,    543531)    --確認今天是否報名糜鹿任務
	local Finished_Flag = CheckFlag(OwnerID()  , 543291) --確認今天是否解過糜鹿任務

		if Finished_Flag == false then
		         if Signed_Flag == True then
		     	 if EmptyPacketCount( OwnerID() ) >= 1 and QueuePacketCount( OwnerID() ) == 0 then --給一個暖冬高級軟糖和憑証
				 if CountBodyItem( OwnerID() , 206441) >= 3 and CountBodyItem( OwnerID() , 206442) >= 3 and CountBodyItem( OwnerID() , 206443) >= 2 then  --計算身上有多少個糜鹿(20個以上) 203523

					--尋找糜鹿劇情，和糜鹿動態 --用旗子生出來
					------------------------------------------------------------------------------------------------
						local Sledge = SearchRangeNPC ( TargetID() , 500 )
						--local PID
							for i=0 , table.getn(Sledge) do	
							local  ID = ReadRoleValue( Sledge[i], EM_RoleValue_OrgID)
								if  ID == 114089 then
										--加入一個移動到該地方的旗標動作
										--Playmotion( Sledge[i], ruFUSION_ACTORSTATE_ACTIVATE_END)        --雪橇回復結束										
										BeginPlot( Sledge[i] , "LuaDan_Reindeers_SqwanPoint" , 10 )
										--BeginPlot( Sledge[i] , "LuaDan_showingmotion" , 20 )
										CastSpell( Sledge[i], Sledge[i], 494660 ); --施放粉未
										BeginPlot( Sledge[i] , "LuaI_114076_Reset_2" , 50)
								end
							end	
					------------------------------------------------------------------------------------------------
					--聖誕老人表演劇情
					--給予糖果和憑証
					SetSpeakDetail( OwnerID(), "[SC_2009_XAMS_SANTA_16]") --[SC_422535_0]，[SC_0908SEANSON_12]
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_16]" , C_SYSTEM )
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_16]" , C_SYSTEM )					
					DelBodyItem( OwnerID() , 206441 , 3) --刪除背包中的數量
					DelBodyItem( OwnerID() , 206442 , 3) --刪除背包中的數量
					DelBodyItem( OwnerID() , 206443 , 2) --刪除背包中的數量
					DelBodyItem( OwnerID() , 206485 , 1) --刪除位置資訊
					SetFlag( OwnerID()  , 543291 , 1 ) --給予已兌換獎勵旗標，一天解一次
				               -- GiveBodyItem( OwnerID() , 203523  , 1) --暖冬棒棒糖 * 1
					if CheckBuff(OwnerID(), 505325)  == false and CheckBuff(OwnerID(), 505326)  == false  and CheckBuff(OwnerID(), 505328)  == false then
					CastSpell( TargetID(), OwnerID(), 494689 ); --暖冬老公公的祝福
					end
	        				GiveBodyItem( OwnerID() , 206437  , 1 ) --我是乖寶寶憑証
					AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁

				else
					
					 SetSpeakDetail( OwnerID(), "[K_08MID_DIALOG7]") --您所持有的數量不足，還不能兌換喔。 
		     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁

				end

			else
	         		      	 SetSpeakDetail( OwnerID(), "[SC_DAN_111700_22]") --你的背包空間不足
	     		                 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁
			end
		else

		SetSpeakDetail (OwnerID(), "[SC_112502_NOSTART]") --你還沒報名
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁

		end
	else
		SetSpeakDetail (OwnerID(), "[SC_112312_TODAY]") --今天真是辛苦你了。有興趣的話，明天再繼續請你幫忙喔！ 
	 	 AddSpeakOption (OwnerID(), TargetID(), "[SO_BACK]", "Lua_Dan_114076_Quest_3", 0)--回到上一頁
	end
end
---------------------------------------------------------------------------------------------------------------
function LuaI_114076_Reset_2()
	Hide(OwnerID() )
	local New_Sledge = CreateObjByFlag( 114078, 780324, 17 , 1)
	AddToPartition( New_Sledge , 0 )
--	Playmotion(New_Sledge, 119)
	BeginPlot( New_Sledge , "LuaDan_New_Sledge_Reset" , 60 ) --重置
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --不顯示
	sleep(150)
	LuaFunc_ResetObj( OwnerID() )	

										
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Reindeers_SqwanPoint() --生糜鹿劇情 + 雪橇移動
	
	local flag = 780324
	local Reindeer = {}

			for i = 0, 1 do 

				Reindeer[i] = CreateObjByFlag( 102933 , flag, i  , 1)		-- 皇家糜鹿
				Sleep(10)
				AddToPartition( Reindeer[i] , 0 ) --149
				PlayMotion ( Reindeer[i] , 149 );				
				BeginPlot( Reindeer[i] , "LuaDan_Reindeer_Del" , 50) --重置雪橇 --刪掉雪橇，用17支生出一個新的
			end

			for j = 2, 5 do 

				Reindeer[j] = CreateObjByFlag( 102931 , flag , j  , 1)		--暖冬糜鹿
					Sleep(10)
				AddToPartition( Reindeer[j] , 0 )
				PlayMotion ( Reindeer[j] , 149 );	
				BeginPlot( Reindeer[j] , "LuaDan_Reindeer_Del" ,50) --重置雪橇 --刪掉雪橇，用17支生出一個新的			
			end

			for k = 6, 7 do 

				Reindeer[k] = CreateObjByFlag( 102932 , flag , k , 1)		--糜鹿
					Sleep(10)
				AddToPartition( Reindeer[k] , 0 )
				PlayMotion ( Reindeer[k] , 149 );
				BeginPlot( Reindeer[k] , "LuaDan_Reindeer_Del" , 50) --重置雪橇 --刪掉雪橇，用17支生出一個新的
			end

			--for n = 0, 7 do 
			--	for l = 8, 15 do 
			--	WriteRoleValue( Reindeer[n] , EM_RoleValue_IsWalk, 0 ) 			--跑吧！糜鹿。
	                --		LuaFunc_MoveToFlag( Reindeer[n], flag, l, 0)        			--移動到下一支旗子位置
			--	Sleep(40)
			--	BeginPlot( Reindeer[n] , "LuaDan_Reindeer_Del" , 30) --刪掉
			--	end
			--end

	--WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk, 0 ) 			--跑吧！雪橇。
	--LuaFunc_MoveToFlag( OwnerID(), flag, 16, 0)        			--移動到下一支旗子位置
	ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_17]" , C_SYSTEM ) --[SC_422488_0]!
	ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_17]" , C_SYSTEM )
	--BeginPlot( OwnerID() , "LuaI_114076_Reset" , 10) --重置雪橇 --刪掉雪橇，用17支生出一個新的

end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Reindeer_Del()
	Sleep(50)
	DelObj(OwnerID())
end
---------------------------------------------------------------------------------------------------------------
function LuaDan_Sledge_Reset() --浮石用
	CastSpell( OwnerID(), OwnerID(), 494660 );
	sleep(10)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)	
	sleep(20)							
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_END)        --雪橇回復結束
	sleep(10)
	Playmotion( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN)
	BeginPlot( OwnerID() , "LuaI_114076_Reset" , 10)
	--Playmotion(OwnerID(), 119)	--雪橇恢復原狀	
end
 -- 道具聖誕老公公的鈴鐺           
------------------------------------------------------------------------------
--使用道具 成功後馴鹿會變成道具"馴鹿"  法術，清脆的銀鈴聲
------------------------------------------------------------------------------
function LuaI_114076_Check()  --檢查此物品是否在特定NPC身上
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local x = CountBodyItem( OwnerID(), 206441) -- * 3 馴鹿
	local y = CountBodyItem( OwnerID(), 206442) -- * 3 暖冬馴鹿
	local z = CountBodyItem( OwnerID(), 206443) -- * 2 皇家馴鹿
	local MonsterID = { 114095,  114096, 114094 }  --馴鹿、暖冬馴鹿、皇家馴鹿

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) or (( OrgID ~= MonsterID[1] ) and  ( OrgID ~= MonsterID[2] ) and  ( OrgID ~= MonsterID[3] )) then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , C_SYSTEM )	--這不是你要帶回去的對象 
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , C_SYSTEM )	--這不是你要帶回去的對象 
		return false	
	elseif OrgID == MonsterID[1] and x >=3 then	--馴鹿
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206441]]" , C_SYSTEM )	--你已經帶回足夠的皇家馴鹿了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206441]]" , C_SYSTEM )	--你已經帶回足夠的皇家馴鹿了
		return false
	elseif OrgID == MonsterID[2] and y >=3 then	--暖冬馴鹿
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206442]]" , C_SYSTEM )	--你已經帶回足夠的馴鹿了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206442]]" , C_SYSTEM )	--你已經帶回足夠的馴鹿了
		return false
	elseif OrgID == MonsterID[3] and z >=2 then	--皇家馴鹿
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_EXTRA][$SETVAR1=[206443]]" , C_SYSTEM )	--你已經帶回足夠的暖冬馴鹿了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_EXTRA][$SETVAR1=[206443]]" , C_SYSTEM )	--你已經帶回足夠的暖冬馴鹿了	
		return false	
	end
end
------------------------------------------------------------------------------
function LuaI_114076_Effect()   --機率判定 
--TargetID 鹿
--OwnerID players
	local Player = OwnerID()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local RANDOWN = rand(100)
	local Reindeer = TargetID()
	local MonsterID = { 114094,  --馴鹿
			      114095,
                                                      114096}      
	PlaySoundToPlayer( Player , "sound\\event\\BELL3.mp3", false )	-- false = 不重播
	if RANDOWN >65 then  -- 抓到兔子 機率為65%
		for i = 1, 3 do  --20隻馴鹿
			if OrgID == MonsterID[i] then  				
				return true				
			end
		end
	else --兔子閃躲  35%
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_2009_XAMS_SANTA_18]" , C_SYSTEM )	--哎呀，馴鹿似乎沒有聽見鈴鐺聲，要相信暖冬節的奇蹟，才能使用聖誕老人的銀鈴哦。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_18]" , C_SYSTEM )	--哎呀，馴鹿似乎沒有聽見鈴鐺聲，要相信暖冬節的奇蹟，才能使用聖誕老人的銀鈴哦。
		return false
	end

end
------------------------------------------------------------------------------
function LuaI_114076_Reset()
	Hide(OwnerID() )
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --不顯示
	sleep(300)
	LuaFunc_ResetObj( OwnerID() )	
end
------------------------------------------------------------------------------
function LuaI_114076_Delgoods()   --成功抓回 --判斷抓到的是哪一隻 

	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local Target = {         114094,  --皇家馴鹿
			      114095,   --馴鹿	
                                                      114096}   --暖冬馴鹿

	local Item = {206443, --皇家馴鹿
		         206441, --馴鹿
		          206442} --暖冬馴鹿

	ScriptMessage( OwnerID() , OwnerID() , 1 ,"[SC_2009_XAMS_SANTA_19]" , C_SYSTEM )	--[114095]似乎聽見[206435]的聲音，開始跟隨你，你成功帶回一隻[114095]！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_2009_XAMS_SANTA_19]" , C_SYSTEM )	--[114095]似乎聽見[206435]的聲音，開始跟隨你，你成功帶回一隻[114095]！
	for i = 1, 3 do  --20隻馴鹿
		if Target[i] == OrgID then
		GiveBodyItem(OwnerID() , Item[i], 1 )
		UseItemDestroy() 		--刪除使用中的物品
		end
	end
	BeginPlot( TargetID() , "LuaI_114076_Reset" , 0 )
end
--隱形任務NPC 馴鹿物件以NPC為中心產出  
-----------------------------------------------------------------------------------------------------
function LuaDan_114076_Parade() --馴鹿
	local Reindeers={}
	local MonsterID = { 114094,  --馴鹿
			      114095,
                                                      114096}      
	local Rand_time = rand(300)
	for i = 0,19 do  --20隻馴鹿
		local move_type = { 0, 1} --0跑 1 走
		local move_typeRand = rand(1)
		local  Rand_Range =  rand( 3 )
		Reindeers[i] = CreateObjByFlag( MonsterID[Rand_Range+1], 780326, i , 1) --使用旗子產生三種馴鹿 npc 旗子編號 數量
		SetModeEx( Reindeers[i]   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Reindeers[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Reindeers[i]   , EM_SetModeType_Obstruct, false )--阻擋
		SetModeEx( Reindeers[i]   , EM_SetModeType_Mark, true )--標記
		SetModeEx( Reindeers[i]   , EM_SetModeType_Move, true )--移動
		SetModeEx( Reindeers[i]   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Reindeers[i]   , EM_SetModeType_HideName, false )--名稱
		SetModeEx( Reindeers[i]   , EM_SetModeType_ShowRoleHead, true )--頭像框
		SetModeEx( Reindeers[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Reindeers[i]   , EM_SetModeType_Show , true ) --不顯示
 
		AddToPartition( Reindeers[i],0 )	--讓兔子產生
		SetRandMove(Reindeers[i], 300, 100, 50 )	--兔子亂數範圍內移動  (150=範圍, 100=10秒 , 20=每次移動距離)
		--SetFightMode( Reindeers[i] , 0, 1, 0, 0 )               --索敵、移動、逃跑、被攻擊 1 true.
		--WriteRoleValue( Reindeers[i], EM_RoleValue_IsWalk, move_type[move_typeRand]) 
	end

end
-----------------------------------------------------------------------------------------------------
function LuaDan_114076_ReindeerSay() --掛在NPC 產生劇情

	While true do 
		local Rand_time = rand(300)
		Sleep(Rand_time)
		PlayMotion( OwnerID(), 1)
		NPCSay(  OwnerID() , "[SC_2009_XAMS_SANTA_20]" )--[114076][Sys110064_szquestnpctext]	
	end	
end
-----------------------------------------------------------------------------------------------------
--浮石觸碰劇情，點擊後，有機率出現餅人攻擊玩家--掛在物品身上
------------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript()

	local Finished_Flag = CheckFlag(TargetID()  , 543290) --確認今天是否解過浮石任務

	if Finished_Flag == false then

		setplot( OwnerID()  , "touch" , "LuaDan_114091_TouchScript_1", 50 )
	end
end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_1()

	BeginPlot( TargetID() , "LuaDan_114091_TouchScript_2" , 0 )

end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_2()
--Say(OwnerID(),"1")
--Say(OwnerID(),"2")
	local result
	local Signed_Flag = CheckFlag(TargetID()  , 543532) --確認今天是否報名浮石任務
	if Signed_Flag == true then 
		--local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
--			if  ( CheckID( TargetID() ) == true ) or ( TargetID() ~= OwnerID() ) or (OrgID == 114091) then --
	if ReadRoleValue( OwnerID() , EM_RoleValue_PID) == 1 then

		ScriptMessage( TargetID(),TargetID(),1,"[SYS_AUCTION_WAIT_NEXT]",0)	--忙碌中，請稍候再試。
		return
	end
				if EmptyPacketCount( TargetID() ) >= 1 and QueuePacketCount( TargetID() ) == 0 then
					if BeginCastBar( TargetID(), "[SC_2009_XAMS_SANTA_21]", 50 , ruFUSION_ACTORSTATE_MINING_BEGIN , ruFUSION_ACTORSTATE_MINING_END, 0 ) == 1 then
						AttachCastMotionTool( TargetID(), 210508)
							WriteRoleValue( OwnerID() , EM_RoleValue_PID, 1 )	

							while true do
								sleep( 2 )
							
								if CheckID(TargetID() ) == false or ReadRoleValue(TargetID(), EM_RoleValue_IsDead) == 1 then
									WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 )
--Say(OwnerID(),result)
--Say(OwnerID(),result)
									result = "DAME"
									EndCastBar( TargetID() , CastBarStatus )
--Say(OwnerID(),result)
--Say(OwnerID(),result)
									break
								else

									local CastBarStatus = CheckCastBar( TargetID() )
										if ( CastBarStatus ~= 0 ) then 
											if ( CastBarStatus > 0) then
--Say(OwnerID(),"result is OKOK")

												result = "OKOK"

												EndCastBar( TargetID() , CastBarStatus )
												break
											elseif ( CastBarStatus < 0 ) then 
--Say(OwnerID(),"result is DAME")
												result = "DAME"
												EndCastBar( TargetID() , CastBarStatus )
												break
											end
										end
								end
	 						end
			  		  end
				end

				if ( result == "OKOK" ) then
					SetPlot( OwnerID(),"touch","",0 )
					local Random = Rand(100)  
			--		local probability = { 15, 15, 20, 25, 25}
			--		if Random > (100 - probability[1] )  then  -- > 85
					if Random >= 85  then  -- > 85
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_2009_XAMS_SANTA_22]" , C_SYSTEM ) --你得到了[206324]。
						GiveBodyItem( TargetID() , 206324, 1 )
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 )
			--		elseif Random > (100 - probability[1] - probability[2])  then  -- >70								
					elseif Random <85 and Random >= 70  then  -- > 70
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--別以為我會讓你好過關喔，好不容易有人過來，當然要你陪我多玩一下再走囉！						
						local Monster1 = LuaFunc_CreateObjByObj( 102956 , OwnerID())
						FaceObj( Monster1 , TargetID() );
						SetModeEx( Monster1   , EM_SetModeType_Searchenemy, false )--索敵
						--BeginPlot (Monster1 , "Lua_Dan_112563_Monster_Delete", 10)  						
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell( Monster1, TargetID() , 494692 ) --恐懼
						Sleep(40)
						DelObj(Monster1)
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3])  then  -->50
					elseif Random <70 and Random >= 50  then  -- > 50
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--別以為我會讓你好過關喔，好不容易有人過來，當然要你陪我多玩一下再走囉！						
						local Monster2 = LuaFunc_CreateObjByObj( 102957 , OwnerID())
						FaceObj( Monster2 , TargetID() );
						SetModeEx( Monster2   , EM_SetModeType_Searchenemy, false )--索敵
						--BeginPlot (Monster2 , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell(Monster2 , TargetID() , 494693 ) --弱化
						Sleep(40)
						DelObj(Monster2)
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3]- probability[4])  then  -->25
					elseif Random <50 and Random >= 25  then  -- > 85
						ScriptMessage( OwnerID() , TargetID() , 1 , "[Sys112465_szquestnpctext]" , C_SYSTEM )	--別以為我會讓你好過關喔，好不容易有人過來，當然要你陪我多玩一下再走囉！							
						local Monster3 = LuaFunc_CreateObjByObj( 102958 , OwnerID())
						FaceObj( Monster3 , TargetID() );
						SetModeEx( Monster3   , EM_SetModeType_Searchenemy, false )--索敵
						--BeginPlot (Monster3 , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 ) 
						Castspell( Monster3, TargetID() , 494694 ) --捕捉	
						Sleep(40)
						DelObj(Monster3)				
			--		elseif Random > (100 - probability[1] - probability[2]- probability[3]- probability[4]- probability[5])  then  --80%
					elseif Random <25  then  -- < 25
						ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_421343_0]" , C_SYSTEM )	--終於出現了力量足以擊敗我的人，我等這一天等了好久 ！							
						local Monster = LuaFunc_CreateObjByObj( 102937 , OwnerID())
						SetAttack( Monster , TargetID()  )
						BeginPlot (Monster , "Lua_Dan_112563_Monster_Delete", 10)   
						BeginPlot( OwnerID() , "LuaDan_114091_TouchScript_reset" , 0 )  	 
					end
				elseif ( result == "DAME" ) then
						WriteRoleValue( OwnerID() , EM_RoleValue_PID, 0 )
				end
				
		--	else
				
		--		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204119_01]" , C_SYSTEM )	--需更改字串。
		--		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204119_01]" , C_SYSTEM )	--只能使用於聖誕老公公的馴鹿。
		--	end
	else
		ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_112502_NOSTART]" , C_SYSTEM )
		ScriptMessage( OwnerID() , TargetID() , 0 , "[SC_112502_NOSTART]" , C_SYSTEM )	
	end
end
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_TouchScript_reset()
--Say(OwnerID(),"3")
--Say(OwnerID(),"4")
	Hide(TargetID() )
	--SetModeEx( OwnerID()   , EM_SetModeType_Show , false ) --不顯示
	sleep(1200)
	WriteRoleValue( TargetID() , EM_RoleValue_PID, 0 )
	LuaFunc_ResetObj( TargetID() )	
end
--隱形任務NPC 浮石物件以NPC為中心產出  
-----------------------------------------------------------------------------------------------------
function LuaDan_114091_Sqwan() --浮石
	local Stones={}
	local MonsterID = 114091
	--local Rand_time = rand(300)
	for i = 0, 14 do  --15顆浮石
		--local move_type = { 0, 1} --0跑 1 走
		--local move_typeRand = rand(1)
		--local  Rand_Range =  rand( 3 )
		Stones[i] = CreateObjByFlag( MonsterID, 780325, i , 1) --使用旗子產生三種馴鹿 npc 旗子編號 數量
		SetModeEx( Stones[i]   , EM_SetModeType_Strikback, false )--反擊
		SetModeEx( Stones[i]   , EM_SetModeType_SearchenemyIgnore, false )--被搜尋
		SetModeEx( Stones[i]   , EM_SetModeType_Obstruct, true )--阻擋
		SetModeEx( Stones[i]   , EM_SetModeType_Mark, true )--標記
		SetModeEx( Stones[i]   , EM_SetModeType_Move, false )--移動
		SetModeEx( Stones[i]   , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Stones[i]   , EM_SetModeType_HideName, true )--名稱
		SetModeEx( Stones[i]   , EM_SetModeType_ShowRoleHead, false )--頭像框
		SetModeEx( Stones[i]   , EM_SetModeType_Fight , false )--可砍殺攻擊
		SetModeEx( Stones[i]   , EM_SetModeType_Show , true ) --不顯示
 
		AddToPartition( Stones[i],0 )	--讓兔子產生
		--SetRandMove(Stones[i], 1000, 100, 20 )	--兔子亂數範圍內移動  (150=範圍, 100=10秒 , 20=每次移動距離)
		--SetFightMode( Reindeers[i] , 0, 1, 0, 0 )               --索敵、移動、逃跑、被攻擊 1 true.
		--WriteRoleValue( Reindeers[i], EM_RoleValue_IsWalk, move_type[move_typeRand]) 
	end

end
-----------------------------------------------------------------------------------------------------
function Lua_Dan_Instance_Cantuseitem()
	local Obj = Role:new(OwnerID())
	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
	local attack     = ReadRoleValue( TargetID(),  EM_RoleValue_IsAttackMode )  
	
	if attack ~= 1 then     --沒有戰鬥中
		local BuffType = 0
		local Count = BuffCount ( TargetID())
		for i = 0 , Count do
			local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
			if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
				BuffType = GameObjInfo_int ( BuffID , "AssistType" )
				break
			end
		end
		if BuffType == 68 then				       	    --/*有騎乘狀態
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
			return false
		elseif Checkbuff( TargetID() , 502398 ) == false and Checkbuff( TargetID() , 502401 ) == false then
			if OwnerID() ~= TargetID() then
				 		
						if ZoneID > 0 and  ZoneID < 100 and Obj:RoomID() == 0 then  
							return true
				
						elseif ZoneID > 100 or Obj:RoomID() ~= 0 then
							ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , C_SYSTEM )
							ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
							return false		
						else
							ScriptMessage( OwnerID(), OwnerID() ,  1 , "System Error" , C_SYSTEM )
							ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
							return false
						end
			else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_0908SEANSON_MAG01]" , 0 )	
				return false     
			end
		else
				ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_BEERDAY_MAGIC05]" , C_SYSTEM )
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_BEERDAY_MAGIC05]" , 0 )	
				return false     
		end
	else
		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_USECHECK_BATTLE_0]" , C_SYSTEM )
		return false --戰鬥中無法使用
	end
end
-----------------------------------------------------------------------------------------------------
function Lua_Dan_Instance_Cantuseitem_1()
	local Obj = Role:new(OwnerID())
	local ZoneID = Obj:ZoneID() - 1000*math.floor(Obj:ZoneID() / 1000 )
--	if OwnerID() ~= TargetID() then
		 		
				if ZoneID > 0 and  ZoneID < 100 and Obj:RoomID() == 0 then  
					return true
		
				elseif ZoneID > 100 or Obj:RoomID() ~= 0 then
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_DAN_111700_37]" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_DAN_111700_37]" , 0 )	
					return false		
				else
					ScriptMessage( OwnerID(), OwnerID() ,  1 , "System Error" , C_SYSTEM )
					ScriptMessage( OwnerID(), OwnerID(), 0, "System Error" , 0 )	
					return false
				end
--	else
--		ScriptMessage( OwnerID(), OwnerID() ,  1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )
--		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_0908SEANSON_MAG01]" , 0 )	
--		return false     
--	end
end

-----------------------------------------------------------------------------------------------------
function LuaDan_Xams2009_List()
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_2009_XAMS_SANTA_13]" );
	ShowBorder( OwnerID(), 0, "[SC_2009_XAMS_ANDREAS_5]" , "ScriptBorder_Texture_Paper" )
end