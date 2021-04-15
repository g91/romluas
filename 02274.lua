--CheckAcceptQuest  是否有該任務

function lua_flowerv_suki_00()--謝賽琳開啟前置
	if CheckFlag(OwnerID(), 544815)==TRUE then
		LoadQuestOption( OwnerID() )	
	elseif CheckFlag(OwnerID(), 544816)==FALSE then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_FLOWERV_SUKI_24]" , "lua_flowerv_suki_01", 0 ) --幫忙
		LoadQuestOption( OwnerID() )	
	elseif CheckFlag(OwnerID(), 544816)==TRUE AND CountBodyItem(OwnerID(), 209133)<3 then
		LoadQuestOption( OwnerID() )	
	elseif CheckFlag(OwnerID(), 544816)==TRUE AND CountBodyItem(OwnerID(), 209133)==3 then 
		SetSpeakDetail( OwnerID(), "[SC_FLOWERV_SUKI_22]" ) 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_FLOWERV_SUKI_19]" , "lua_flowerv_suki_01_2", 0 ) --餡餅做好了…
	end
end

function lua_flowerv_suki_01() --謝賽琳
	SetFlag( OwnerID(), 544815, 1 )
	if CheckFlag(OwnerID(), 544812)==FALSE then
		LoadQuestOption( OwnerID() )	
	end
end 

function lua_flowerv_suki_01ok()
	SetFlag(TargetID(), 544816, 1)
	SetFlag(TargetID(), 544868, 1)
	SetFlag(TargetID(), 544812, 1)
--	Say(TargetID(),"ok")
end

function lua_flowerv_suki_01_2()
		SetSpeakDetail(OwnerID(), "[SC_FLOWERV_SUKI_18]")--分給大家
		DelBodyItem(OwnerID(), 209133, 3)
		GiveBodyItem(OwnerID(), 209135, 3)
		GiveBodyItem(OwnerID(), 209161, 1)
end

function lua_flowerv_suki_02() --麗妮 
	if CheckFlag(OwnerID(), 544813)==FALSE then
		LoadQuestOption( OwnerID() )	
	elseif CheckAcceptQuest(OwnerID(), 424032 )==TRUE  and CountBodyItem(OwnerID(), 202983) <5 then 
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_FLOWERV_SUKI_09]" , "lua_flowerv_suki_02_2", 0 ) --拿草
		LoadQuestOption( OwnerID() )	
	elseif  CountBodyItem(OwnerID(), 202983) >4 OR CheckAcceptQuest(OwnerID(), 424032 )==FALSE then
		LoadQuestOption( OwnerID() )	
	end
end

function lua_flowerv_suki_02_2()
	if CountBodyItem(OwnerID(), 209136) >0  then
		SetSpeakDetail(OwnerID(), "[SC_FLOWERV_SUKI_15]")--身上還有…
	else
		SetSpeakDetail(OwnerID(), "[SC_FLOWERV_SUKI_20]")--好好使用…
		GiveBodyItem(OwnerID(), 209136, 10)	
	end
end

function lua_flowerv_suki_02ok()
	SetFlag(TargetID(), 544868, 0)
	SetFlag(TargetID(), 544818, 1)
	SetFlag(TargetID(), 544813, 1)
--	Say(TargetID(),"ok")
end

function lua_flowerv_suki_03() --莎夏 
	if CheckFlag(OwnerID(), 544814)==FALSE then
		LoadQuestOption( OwnerID() )	
	end
end

function lua_flowerv_suki_03ok()
	SetFlag(TargetID(), 544818, 0)
	SetFlag(TargetID(), 544869, 1)
	SetFlag(TargetID(), 544814, 1)
--	Say(TargetID(),"ok")
end

function lua_flowerv_suki_04ok()
	SetFlag(TargetID(), 544869, 0)
	SetFlag(TargetID(), 544812, 1)
	SetFlag(TargetID(), 544813, 1)
	SetFlag(TargetID(), 544814, 1)
--	Say(TargetID(),"ok")
end

-----------------------雞----------------------------------
Function lua_flowerv_suki_chickenangry01() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "lua_flowerv_suki_chickenangry03" , 15 )	--後面數字是能點擊的範圍
end

function lua_flowerv_suki_chickenangry03()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff( 68,  OwnerID() )
	if CheckFlag(OwnerID(), 544812 )==TRUE and CountBodyItem(OwnerID(), 209130 ) <5 then
		if BeginCastBarEvent( O_ID, T_ID,"[SC_FLOWERV_SUKI_10]", 20, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_flowerv_suki_hanangry" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	elseif CheckFlag(OwnerID(), 544812 )==FALSE then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_04]" , C_SYSTEM ) --請先跟謝接任
	elseif CountBodyItem(OwnerID(), 209130 ) ==5 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_21]" , C_SYSTEM ) --物品已滿
	end
end

function lua_flowerv_suki_hanangry(O_ID, CheckStatus)
	--Say( OwnerID(), "69")--player
	local O_ID = OwnerID() 	 -- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
				local angry01=rand(100)+1
				if angry01>=31 then
					--Say(OwnerID(), angry01)
					GiveBodyItem( OwnerID() , 209130 , 1 ) --give egg
					BeginPlot(TargetID(), "lua_flowerv_suki_goodshide", 0)
				elseif angry01>=9 and angry01<= 30 then
					--Say(OwnerID(), angry01)
					SetRandMove(TargetID(), 150, 50,90)
					ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_02]" , C_SYSTEM ) --母雞生氣						
					AddBuff(OwnerID(), 509014, 1, 5) --恐懼
					--Say(TargetID(), angry01)
				elseif angry01<= 8 then
					--Say(OwnerID(), angry01)			
					local RoomID = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
					local cock= CreateObjByObj ( 105328 , TargetID(), 1 )
					AddToPartition ( cock , RoomID )
					BeginPlot( TargetID(), "lua_flowerv_suki_goodshide", 0) --母雞藏
					BeginPlot( cock, "lua_flowerv_suki_cockhide", 0) --公雞藏
					if CountBodyItem(OwnerID(), 209130 ) >0 then
						ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_03]" , C_SYSTEM ) --遇到公雞+破蛋	
						ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FLOWERV_SUKI_03]" , C_SYSTEM ) 
						DelBodyItem(OwnerID(), 209130, 1)
					else
						ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_23]" , C_SYSTEM ) 		
						ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FLOWERV_SUKI_23]" , C_SYSTEM ) 
					end
				end
			else
				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end
		else-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function lua_flowerv_suki_chickenmove() --亂跑
	SetRandMove(TargetID(), 150, 50,90)
end

function lua_flowerv_suki_chickenangry04()
	AddBuff(OwnerID(), 509017, 0, -1)
end

function lua_flowerv_suki_cockhide()

	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false ) --頭像框（可藏血條）
	AddBuff(TargetID(), 509015, 1, 10)
	--say(TargetID() ,"00")--player
	sleep(40)
	DelObj(OwnerID() )
end

------------------------蜜蜂-----------------------------
Function lua_flowerv_suki_bee01() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "lua_flowerv_suki_bee03" , 100 )
end

function lua_flowerv_suki_bee03()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff( 68,  OwnerID() )
	if CheckFlag(OwnerID(), 544821) == TRUE and CountBodyItem(OwnerID(), 209132)<5 then
		if BeginCastBarEvent( O_ID, T_ID,"[SC_FLOWERV_SUKI_11]", 30, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_flowerv_suki_bee02" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	elseif CheckFlag(OwnerID(), 544821 )==FALSE then 
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_04]" , C_SYSTEM ) --請先跟謝接任
	elseif CountBodyItem(OwnerID(), 209132 ) ==5 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_21]" , C_SYSTEM ) --物品已滿
	end
end

function lua_flowerv_suki_bee02(O_ID, CheckStatus)
	local O_ID = OwnerID() 	 -- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
				local bees=rand(100)+1
				if bees<=10 or bees>=30 then
					GiveBodyItem(OwnerID(), 209132, 1) --give 
					BeginPlot(TargetID(), "lua_flowerv_suki_goodshide", 0)
				else
					local beerand=ReadRoleValue(TargetID(), EM_RoleValue_PID)
					local bees01=CreateObjByFlag( 105128, 780846, beerand, 1) --欲產生物，旗編號，旗代號，數量
					ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_08]" , C_SYSTEM ) --bee出現
					AddToPartition( bees01 , 0 )
					BeginPlot(TargetID(), "lua_flowerv_suki_goodshide", 0)
					BeginPlot( bees01, "lua_flowerv_suki_beekill", 0)
				--	Say(OwnerID(), bees)
				end
			else
				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function lua_flowerv_suki_beekill()
	sleep(1800)
	DelObj(OwnerID() )
end

---------------------DOG-------------------------------
Function lua_flowerv_suki_bone02() --掛在物件產出SCRIPT
	SetPlot( OwnerID() , "touch" , "lua_flowerv_suki_bone03" , 15 )	--後面數字是能點擊的範圍
end

function lua_flowerv_suki_bone03()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff( 68,  OwnerID() )
	if CheckFlag(OwnerID(), 544821 )==TRUE and CountBodyItem(OwnerID(), 209131 ) <3 then
		if BeginCastBarEvent( O_ID, T_ID,"[SC_FLOWERV_SUKI_12]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "lua_flowerv_suki_bone" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 )--目標忙碌中
			return
		end
	elseif CheckFlag(OwnerID(), 544821 )==FALSE then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_04]" , C_SYSTEM ) --請先跟謝接任
	elseif CountBodyItem(OwnerID(), 209131 ) ==3 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_21]" , C_SYSTEM ) --物品已滿
	end
end

function  lua_flowerv_suki_bone(O_ID, CheckStatus)
	local O_ID = OwnerID() 	 -- 玩家
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );
			if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --檢查背包欄位
				GiveBodyItem(OwnerID(), 209131, 1)
				BeginPlot(TargetID(), "lua_flowerv_suki_goodshide", 0)
			else
				ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --您的背包空間不足，請清理一下再來吧。
			end	
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );

		end
	end
end

function lua_flowerv_suki_flowerdog01()	
--	Say(OwnerID(), "dog") --dog
--	Say(TargetID(), "player") --player
	if CheckFlag( TargetID(), 544821 )==TRUE then
		npcsay( OwnerID(), "[SC_FLOWERV_SUKI_01]" ) --嗚汪
		sleep(50)
		BeginPlot(TargetID(), "lua_flowerv_suki_flowerdog03", 0)
	end
end

function lua_flowerv_suki_flowerdog03() --fly to flag
--	Say(OwnerID(), 242) --player
--	Say(TargetID(), 243) --DOG
	local move=Rand(4)+1
	if CountBodyItem(OwnerID(), 209131 ) ==0 then
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_25]" , C_SYSTEM ) --被發現.......
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FLOWERV_SUKI_25]" , C_SYSTEM )
	else
		ScriptMessage( OwnerID() ,  OwnerID(), 1, "[SC_FLOWERV_SUKI_14]" , C_SYSTEM ) --被發現+掉骨頭.......
		ScriptMessage( OwnerID() ,  OwnerID(), 0, "[SC_FLOWERV_SUKI_14]" , C_SYSTEM )
		DelBodyItem( OwnerID(), 209131, 1)
	end
	SetPosByFlag( OwnerID(), 780846 , move )
end
------------------------hide-------------------------

function lua_flowerv_suki_goodshide()
	Hide(OwnerID() )
	sleep(150)
	Show(OwnerID(), 0 )
end

--------------------------獎勵---------------------------------------

function lua_flowerv_suki_flowerreward()
	local reward=rand(100)+1
	if reward<30 then
		AddBuff(OwnerID(), 509061, 1, -1) --苦哈哈
		--Say(OwnerID(), reward)
	else
		AddBuff(OwnerID(), 509018, 1, -1)--甜蜜蜜
		--Say(OwnerID(), reward)
	end
end