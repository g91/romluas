--Pet_NPC      542203

function LuaYU_PetSystemFarm_0()--掛在牛羊身上
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemNPC_01",30 )
end

function LuaYU_PetSystemNPC_01()

--	Say(OwnerID(), "OwnerID".."1"  )
--	Say(TargetID(), "TargetID".."1"  )

	local food =  CountBodyItem( OwnerID() , 204788 ) --新鮮的牧草
	local milkbox =  CountBodyItem( OwnerID() , 204786 ) --鮮乳收集桶

	local P = 100
	local XX = Rand( P )    
	WriteRoleValue(  OwnerID() , EM_RoleValue_Register+9 , TargetID()  )

	if CheckBuff( TargetID() , 503462 ) == true and milkbox > 0 then

			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_05" , 0 ) 
	--		BeginPlot( TargetID() , "LuaYU_PetSystemNPC_06" , 0 )--動物動作回饋 


	elseif milkbox == 0 then

			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_12]" , 0 )  --提醒你！沒有攜帶[204786]無法收集鮮乳喔！
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_12]" , 0 )  --提醒你！沒有攜帶[204786]無法收集鮮乳喔！

	elseif food >= 1 then

		if XX >50 and XX < 100 then --40%

			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_02" , 0 ) --玩家餵養
			BeginPlot( TargetID() , "LuaYU_PetSystemNPC_04" , 0 )--動物動作回饋 

		else -- 60%
			BeginPlot( OwnerID() , "LuaYU_PetSystemNPC_03" , 0 ) 
			BeginPlot( TargetID() , "LuaYU_PetSystemNPC_04" , 0 ) 

		end

	else
			ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_13]" , 0 )  --沒草不能餵
			ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_13]" , 0 )  --沒草不能餵
	end



		

end

function LuaYU_PetSystemNPC_02() --玩家餵食

	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()  --牛/羊
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_06]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYU_PetSystemNPC_02_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		 AttachCastMotionTool( O_ID, 211100 ); --置換武器為新鮮的牧草
	end
end
function LuaYU_PetSystemNPC_02_1(ObjID, CheckStatus)
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 牛/羊

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID, O_ID , 1 , "[SC_PETSYS_14]" , "0xffffff00" )  --你很順利的餵食完畢。
			ScriptMessage(O_ID, O_ID , 0 , "[SC_PETSYS_14]" , "0xffffff00" )  --你很順利的餵食完畢。
			AddBuff( T_ID ,503462 ,1 ,-1 )
			DelBodyItem( O_ID , 204788 , 1 )
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystemNPC_03() --玩家餵食

	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()  --牛/羊
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_06]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaYU_PetSystemNPC_03_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		 AttachCastMotionTool( O_ID, 211100 ); --置換武器為新鮮的牧草
	end
end

function LuaYU_PetSystemNPC_03_1(ObjID, CheckStatus)
	local O_ID = OwnerID() -- 玩家
	local T_ID = TargetID()  -- 玩家

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			ScriptMessage(O_ID,O_ID, 1 , "[SC_PETSYS_09]" , 0 )  --你手忙腳亂的餵食完畢。
			DelBodyItem( O_ID , 204788 , 1 )
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
		end
	end
end

function LuaYU_PetSystemNPC_04() -- 動物動作回饋
--OwnerID  牛/羊
--TargetID 玩家

	AdjustFaceDir( OwnerID(), TargetID() , 0 ) --面向
	PlayMotion( OwnerID(), 121) 	
	
	sleep(20)
	PlayMotion( OwnerID(), 121) 	

	sleep(20)
	PlayMotion( OwnerID(), 122) 	
end


function LuaYU_PetSystemNPC_05() --玩家擠奶
	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()  --玩家
	local Cow = ReadRoleValue( O_ID,  EM_RoleValue_Register+9  )
	BeginPlot( Cow , "LuaYU_PetSystemNPC_04" , 0 ) 
	if BeginCastBarEvent( O_ID, Cow,"[SC_PETSYS_15]", 50, ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END, 0, "LuaYU_PetSystemNPC_05_1" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--目標忙碌中
		return
	else
		local Milkbox = LuaFunc_CreateObjByObj ( 112960 , Cow )--鮮乳收集桶
		WriteRoleValue(  O_ID , EM_RoleValue_Register+2 , Milkbox  )
	end
end
function LuaYU_PetSystemNPC_05_1(ObjID, CheckStatus)

	local O_ID = OwnerID() --玩家
	local T_ID = TargetID()  --牛/羊

	local MilkBox = ReadRoleValue( O_ID,  EM_RoleValue_Register+2  )  -- 鮮乳收集桶

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- 成功
			EndCastBar( O_ID, CheckStatus );

			ChangeObjID( MilkBox, 114929 );	-- 置換物件的ID
			ScriptMessage(O_ID, O_ID , 1 , "[SC_PETSYS_16]" , "0xffffff00" )  --你順利的收集完鮮奶。
			GiveBodyItem( O_ID , 204787 , 1 ) --裝滿的桶
			DelBodyItem( O_ID , 204786 , 1 ) --沒裝滿的桶
			CancelBuff( T_ID ,503462 )
			BeginPlot( MilkBox , "LuaYU_PetSystemNPC_05_2" , 0 ) 
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus );
			Delobj( MilkBox )
		end
	end
end

function LuaYU_PetSystemNPC_05_2() 
	sleep(30)
	Delobj( OwnerID() )
end

function LuaI_PetFrameBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 204793		--牧場禮盒
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720436 , 1 )	

	end
end

function LuaI_PeteEventBOX( Option )
	local PlayerID = OwnerID()
	local PackageID = 205793		--寵物的收集品
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( PlayerID , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		elseif ( CountBodyItem( PlayerID , PackageID ) >= 1 ) then
			return true
		end
	elseif ( Option == "USE" ) then

		GiveBodyItem( PlayerID , 720628 , 1 )	

	end
end

--************************************************************以下為寵物教學-----------------------

function LuaYU_114932_raid()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID ~= 304) then
		AddBuff( OwnerID() ,506137 ,0 ,-1 ); --騎乘驢子  		
	end
end

function LuaYU_114932_PetsTeach_00()

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local play =  CheckFlag( OwnerID() , 542570 ) --是否參與過免費練習		--第一次練習完會有的KEY
	local play01 =  CheckFlag( OwnerID() , 542572 ) --金蛋交換之練習
	local play02 =  CheckFlag( OwnerID() , 542571 ) --練習結束			--第一次練習完會有的KEY
	local play03 =  CheckFlag( OwnerID() , 542573 ) --獲得了第一顆免費蛋		--第一次練習完會有的KEY
	local play04 =  CheckFlag( OwnerID() , 542574 ) --火雞肉擺放完成  		--第一次練習完會有的KEY
	local GoodJob =  CheckFlag( OwnerID() , 542575 ) --第一次練習完成，給予獎勵	--第一次練習完會有的KEY
	local meet =  CountBodyItem( OwnerID() , 204928 ) --香噴噴的火雞肉


	SetShop( TargetID() , 600183 , "Test_Shop_Close" );--販賣物品

	if ZoneID == 304 then
		if ( play01 == true ) and ( play02 == false ) then--非免費練習，已繳納金蛋，練習開始
			if (meet == 0) and ( play04 == false ) then
				GiveBodyItem( OwnerID() , 204928 , 1 ) --香噴噴的火雞肉	
			end
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , 109) --指揮向前
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_33]"    )---快去展開獵捕練習吧！先在你的背後，那顆被砍掉的[114933]上，把這個[204928]擺上去吧！
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --請帶我離開牧場

		elseif ( play == true ) and ( play01 == false ) and ( play02 == false ) and ( play03 == false ) and ( play04 == false ) then--此次為免費練習，練習開始
			if (meet == 0) and ( play04 == false ) then
				GiveBodyItem( OwnerID() , 204928 , 1 ) --香噴噴的火雞肉	
			end
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , 109) --指揮向前
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_33]"    )---快去展開獵捕練習吧！先在你的背後，那顆被砍掉的[114933]上，把這個[204928]擺上去吧！
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --請帶我離開牧場

		elseif ( play01 == false ) and ( play02 == false ) then--見面話
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , 112) --說話
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_17]"    )--這裡就是米拉牧場囉！[110789]是牧場的主人，協助牧場的工作就可以免費獲得養育寵物必要的食物喔！
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_18]" , "LuaYU_114932_PetsTeach_01", 0 ) --關於帕奇鼠
			if ( play == false ) and ( play01 == false ) then
				AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --進行獵寵練習
			elseif ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]的交易
			end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --請帶我離開牧場

		elseif ( GoodJob == false ) and ( play03 == true ) then--第一次練習完成，給予獎勵
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , 112) --說話
			GiveBodyItem( OwnerID() , 204513 , 1 ) --培育欄開通券
			SetFlag( OwnerID() , 542575 , 1 ) -- 領取記號
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_68]"    )--如何獵捕[103567]還算順利吧！？那麼送你一個 培育欄開通券，每天我都給你一次練習的機會吧！有馴寵上的問題都可以找我。
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --獵捕[103567]的訣竅
		--	if ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]的交易
		--	end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --請帶我離開牧場


		else						--練習結束
			AdjustFaceDir( TargetID(), OwnerID() , 0 ) --面向
			PlayMotion( TargetID() , 112) --說話
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_29]"    )--噢噢～我剛剛有看到你把那匹狼引出來了，獵捕[103567]還算順利吧！？那麼，每天我都給你一次練習的機會吧！有馴寵上的問題都可以找我。
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --獵捕[103567]的訣竅
			if ( play03 == true ) then
				AddSpeakOption( OwnerID(), TargetID(), "|offffff00" .."[SC_PETSYS_60]".. "|r" , "LuaYU_114932_PetsTeach_03_2", 0 ) --[204792]的交易
			end
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_19]" , "LuaYU_114932_PetsTeach_06", 0 ) --請帶我離開牧場
		end
	else
			SetSpeakDetail( OwnerID(), "[SC_PETSYS_38]"    )--噢噢~年輕的冒險者嗎？偉大的冒險旅程裡你需要更多忠誠的夥伴喔！養隻忠心的魔法寵物寶寶是你最好的選擇！
			AddSpeakOption( OwnerID(), TargetID(), "|cffff00ff" .."[SO_WANTBUY]".. "|r" , "LuaYU_114932_PetsTeach_00_store", 0 ) --我想看看你賣的貨物
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_39]" , "LuaYU_114932_OtherZone_01", 0 ) --關於魔法寵物寶寶
			AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --前往米拉牧場
	end
end

function LuaYU_114932_PetsTeach_00_store() --【加工廠、兵工廠】開啟商店
	CloseSpeak( OwnerID() )
	OpenShop()
end

--************以下為  玩家位於《其他大地區》時之對話************--
function LuaYU_114932_OtherZone_01()

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_40]"    )--魔法寵物寶寶是從寵物寶貝蛋裡面孵化出來可以經由人工馴養協助作戰的好夥伴喔！馴養工作做得越好，魔法寵物寶寶給予主人的增益效果、協助就會更好！
							--此外，魔法寵物寶寶還能協助你進行一些生產工作，如伐木、挖礦、採集，你只需要向我購買一些生產工具交給牠，牠便會忠心的為你工作喔！

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_48]" , "LuaYU_114932_OtherZone_02", 0 ) --如何獲得魔法寵物寶寶
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_49]" , "LuaYU_114932_OtherZone_05", 0 ) --如何獲得飼料
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_50]" , "LuaYU_114932_OtherZone_06", 0 ) --如何提升寵物的能力
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁
end

function LuaYU_114932_OtherZone_02()--如何獲得魔法寵物寶寶

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_51]"    )--魔法寵物寶寶是由一種叫做[103567]的魔物所製造的，所以只要逮住[103567]就能獲得魔法寵物寶寶。

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_18]" , "LuaYU_114932_PetsTeach_01", 0 ) --關於帕奇鼠
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --獵捕[103567]的訣竅
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --回上一頁
end

function LuaYU_114932_OtherZone_03()--進行獵寵練習

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_41]"    )--那好吧，你有飼養魔法寵物寶寶才會有需求和購買慾，我的業績也才會上升，哈哈雖然我不是個職業商人但這個算盤打得還不錯，就讓我的小毛驢載你一程吧！

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --前往米拉牧場
end

function LuaYU_114932_OtherZone_04() --前往米拉牧場
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_47]"    )--那麼準備好了嗎，我的小毛驢可是日行千里的喔！出發吧！向米拉牧場前進～！

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111584_YU_36]" , "LuaYU_114932_OtherZone_08", 0 ) --那就麻煩你囉！
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁

end


function LuaYU_114932_OtherZone_05()--如何獲得飼料
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_43]"    )--魔法寵物寶寶需要特製的飼料餵養牠們，向各城鎮的<CM>馴寵獵手</CM>是最快速的方式，不過如果你願意花點時間、勞力在米拉牧場幫幫忙的話，
                                                                                                   --牧場的主人也會給予你一些寵物飼料當作獎勵的喔！我正要去米拉牧場補貨，如果你有需要，倒是可以讓我的小毛驢載你一程。

	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_42]" , "LuaYU_114932_OtherZone_04", 0 ) --前往米拉牧場
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --回上一頁

end

function LuaYU_114932_OtherZone_06()--如何提升寵物的能力

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_44]"    )--當你飼養一個魔法寵物寶寶時，記得常常讓牠一起參與冒險，在冒險的途中你的寵物會有一些想法、經歷想和你交流，而你的回答也將間接讓寵物有新的體認，
							--進而提升能力；當然還有另一種方式，那就是讓魔法寵物們進行融合。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_45]" , "LuaYU_114932_OtherZone_07", 0 ) --如何進行寵物融合
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_01", 0 ) --回上一頁
end

function LuaYU_114932_OtherZone_07()--如何進行寵物融合

	SetSpeakDetail( OwnerID(), "[SC_PETSYS_46]"    )--融合的規則相當簡單，只要寵物的屬性相同，或者被融合的寵物屬於"無屬性"之寵物，即可進行融合。
							--另外兩個相融的寵物寶貝蛋之等級差不可高於5級，融合後，魔法寵物寶寶將吸收被融合的魔法寵物寶寶屬性上較高的部分屬性，且合而為一。

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_06", 0 ) --回上一頁
end

function LuaYU_114932_OtherZone_08() --前往米拉牧場劇情
	local Player = OwnerID()

	local Zone = ReadRoleValue(Player , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local RoomID = ReadRoleValue( Player ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( Player , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( Player , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( Player , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( Player , EM_RoleValue_Dir ) 

	SaveReturnPos( Player,ZoneID,OwnerX,OwnerY,OwnerZ,OwnerDIR)	--紀錄你進入副本時的當前位置。

	BeginPlot( Player , "LuaYU_114932_OtherZone_09" , 0 ) 
end

function LuaYU_114932_OtherZone_09() --前往米拉牧場劇情
	CloseSpeak( OwnerID() )


	if ChangeZone( OwnerID(), 304 , -1 , 4033.2, -0.0, 3450.8, 90) then   --ChangeZone( OwnerID(), ZoneID 區域ID , 第幾層 0 為第0層 -1代表只跑副本規則 , x, y, z, Dir)  
		local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
		local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
		DesignLog(OwnerID(),304," last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次

	end

end

--************以下為  玩家位於《米拉牧場》時之對話************--
function LuaYU_114932_PetsTeach_01()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	local play =  CheckFlag( OwnerID() , 542570 ) --是否參與過免費練習
	local play01 =  CheckFlag( OwnerID() , 542572 ) --金蛋交換之練習
	PlayMotion( TargetID() , 112) --說話
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_20]"    )--帕奇鼠喜歡收集動物、魔物的繁衍物質，並將之包覆於背上的魔法寶貝蛋上進行培養，最終轉化為帕奇鼠賴以為生的特殊能量。
                                                                                                  --帕奇鼠擁有類似寄生的魔法能力，只要宿主失去意識，帕奇鼠便會趁機竊取繁衍物質逃跑。
				   			 --利用這樣的生物特性，我們就可以趁機捕捉牠！但寶貝蛋是十分脆弱的物質，攻擊帕奇鼠是絕不可行的，因此我們必須練習利用工具-[103565]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_21]" , "LuaYU_114932_PetsTeach_02", 0 ) --如何使用[103565]
	if ( play == false ) and ( play01 == false ) and (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --進行獵寵練習

	end
	if (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁
	else
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_02", 0 ) --回上一頁	
	end
end

function LuaYU_114932_PetsTeach_02() --如何使用[103565]狩獵陷阱
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local play =  CheckFlag( OwnerID() , 542570 ) --是否參與過免費練習
	local play01 =  CheckFlag( OwnerID() , 542572 ) --金蛋交換之練習
	PlayMotion( TargetID() , 112) --說話
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_26]"    )--在各城鎮的馴寵商人處可購得工具-[103565]，右鍵使用便會在所在位置設置一個可維持一分鐘的陷阱，帕奇鼠碰到人會四處逃竄，妥善利用走位將帕奇鼠趕到陷阱設置的位置，
								 --即可成功捕捉帕奇鼠。而在取得寵物寶貝蛋後，就可以將帕奇鼠釋放。
	if ( play == false ) and ( play01 == false ) and (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_PetsTeach_03", 0 ) --進行獵寵練習
	elseif (ZoneID ~= 304) then
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_OtherZone_03", 0 ) --進行獵寵練習
	end

	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_01", 0 ) --回上一頁

end

function LuaYU_114932_PetsTeach_03() --進行獵寵練習

	local play =  CheckFlag( OwnerID() , 542570 ) --是否參與過免費練習
	local play01 =  CheckFlag( OwnerID() , 542572 ) --金蛋交換之練習
	local GoldenEgg =  CountBodyItem( OwnerID() , 204792 ) --金蛋

	if ( play == false ) then--未曾參與免費練習
		PlayMotion( TargetID() , 109) --指揮向前
		SetSpeakDetail( OwnerID(), "[SC_PETSYS_23]"    )--在你的背後，有一個被砍掉的樹木遺留的[114933]，把這個[204928]放置在那個平台上，會引來一隻被帕奇鼠所寄生的狼，打倒那隻狼，帕奇鼠就會出現，那麼接下來佈置好陷阱
									  --開始進行獵寵練習吧！我這邊剛好有一個[103565]，平常可以要花錢買的，這次就免費讓你當練習用吧！
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_30]" , "LuaYU_114932_PetsTeach_05", 0 ) --獵捕[103567]的訣竅
		AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_24]" , "LuaYU_114932_PetsTeach_04", 0 ) --開始獵寵練習
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁
	end
end

function LuaYU_114932_PetsTeach_03_2() --金雞蛋的交易

	local play =  CheckFlag( OwnerID() , 542570 ) --是否參與過免費練習
	local play01 =  CheckFlag( OwnerID() , 542572 ) --金蛋交換之練習
	local GoldenEgg =  CountBodyItem( OwnerID() , 204792 ) --金蛋
	PlayMotion( TargetID() , 112) --說話
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_52]"    )--噢噢～冒險者，獵寵練習上手了嗎？其實我有一個提議，米拉牧場的母雞其實是金母雞喔！偶爾會產下黃金外殼的金雞蛋！如果你能帶來給我，我可以給你幾個好處。
							--1.給我1個[204792]，我提供你免費的獵寵練習，而且保證獲得的寵物寶貝蛋不綁定。每日一次
							--2.給我2個[204792]，我用一瓶[204927]和你交換，這個魔藥可以讓寵物的300點[SC_PETS_EVENT_00_00_05]，轉化為1點的[SC_PETS_EVENT_00_00_03]成長喔。
							--3.給我3個[204792]，我用一瓶[204926]和你交換，這個魔藥可以讓寵物的300點[SC_PETS_EVENT_00_00_05]，轉化為1點的[SC_PETS_EVENT_00_00_02]成長喔。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_53]" , "LuaYU_114932_PetsTeach_09", 0 ) --交換獵寵練習機會
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_54]" , "LuaYU_114932_PetsTeach_10", 0 ) --交換[204927]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_PETSYS_55]" , "LuaYU_114932_PetsTeach_11", 0 ) --交換[204926]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁

end

function LuaYU_114932_PetsTeach_04() --開始獵寵練習
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() , 204928 , 1 ) --香噴噴的火雞肉	
	GiveBodyItem( OwnerID() , 206776 , 1 ) --狩獵陷阱
	SetFlag( OwnerID() , 542570 , 1 ) -- 開始實戰做記號
	PlayMotion( TargetID() , 109) --指揮前進
	Say(TargetID(),"|cffffff00" .."[SC_PETSYS_25]".. "|r") --努力練習！先把肉片放置在你背後的[114933]上吧！	
end

function LuaYU_114932_PetsTeach_05()--獵捕[103567]的訣竅
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	PlayMotion( TargetID() , 112) --說話
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_31]"    )--訣竅啊...這可是商業機密！...哈，我胡扯的！我是獵手可不是商人，我告訴你三個訣竅，第一.[103567]只在野外出現，而且通常是寄生在實力較差的魔物身上，也就是非精英級別的。
							--第二.越級挑戰高等的魔物時，當魔物被擊敗後[103567]出現的機率越高。 第三.[103567]會朝向追逐他的人前進的方向筆直逃逸，利用這個特性設陷阱捕捉吧！

	if (ZoneID == 304) then
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁
	else
		AddSpeakOption( OwnerID(), TargetID(), "|cffffff00" .."[SC_PETSYS_22]".. "|r" , "LuaYU_114932_OtherZone_03", 0 ) --進行獵寵練習
		AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_OtherZone_02", 0 ) --回上一頁	
	end
	
end

function LuaYU_114932_PetsTeach_06()--請帶我離開牧場
	SetSpeakDetail( OwnerID(), "[SC_PETSYS_37]" )--你想回去了呀？要搭便車嗎？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111584_YU_36]" , "LuaYU_114932_PetsTeach_07", 0 ) --那就麻煩你囉！
	AddSpeakOption( OwnerID(), TargetID(), "[SC_111352_2]" , "LuaYU_114932_PetsTeach_00", 0 ) --回上一頁
end

function LuaYU_114932_PetsTeach_07()--那就麻煩你囉！
	CloseSpeak( OwnerID() )
	Say(TargetID(), "[SC_422579_4]") --很好，那麼我們走吧
	PlayMotion( TargetID() , 116) --揮手
	BeginPlot( OwnerID() , "LuaYU_114932_PetsTeach_08" , 0 ) 
end

function LuaYU_114932_PetsTeach_08()--離開米拉牧場
	sleep(50)
	BeginPlot( OwnerID() , "LuaYU_114932_PetsTeach_08_01" , 0 ) 
end

function LuaYU_114932_PetsTeach_08_01()--離開米拉牧場
	GoReturnPos(OwnerID())--前往進入副本時的位置
end

function LuaYU_114932_PetsTeach_09()--交換獵寵練習機會

	local O_ID = OwnerID()
	local play02 =  CheckFlag( OwnerID() , 542571 ) --練習結束
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --金雞蛋

	if (play02 == true) then
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --搖頭
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_61]".. "|r") --呃...不好意思，你今天已經進行過獵寵練習了喔！
	elseif GoldenEgg >=1 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 1 )
		GiveBodyItem( O_ID , 204928 , 1 ) --香噴噴的火雞肉	
		GiveBodyItem( O_ID , 206776 , 1 ) --狩獵陷阱	
		SetFlag( O_ID , 542572 , 1 ) -- 開始實戰做記號
		PlayMotion( TargetID() , 109) --指揮前進
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_56]".. "|r") --噢噢～黃澄澄的[204792]！那麼收下這個[103565]和[204928]！先把肉片放置在你背後的[114933]上吧！	
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --搖頭
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --呃...不好意思，你帶來的[204792]數量似乎不夠喔！
	end
end

function LuaYU_114932_PetsTeach_10()--交換[204927] 惜福魔藥
	local O_ID = OwnerID()
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --金雞蛋

	if GoldenEgg >=2 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 2 )
		GiveBodyItem( O_ID , 204927 , 1 ) --惜福魔藥	
		PlayMotion( TargetID() , 112) --說話
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_58]".. "|r") --噢噢～黃澄澄的[204792]！這是約定好的[204927]請你收下。
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --搖頭
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --呃...不好意思，你帶來的[204792]數量似乎不夠喔！
	end	
end

function LuaYU_114932_PetsTeach_11()--交換[204926] 覺醒魔藥
	local O_ID = OwnerID()
	local GoldenEgg =  CountBodyItem( O_ID , 204792 ) --金雞蛋

	if GoldenEgg >=3 then
		CloseSpeak( O_ID )
		DelBodyItem( O_ID , 204792 , 3 )
		GiveBodyItem( O_ID , 204926 , 1 ) --覺醒魔藥	
		PlayMotion( TargetID() , 112) --說話
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_59]".. "|r") --噢噢～黃澄澄的[204792]！這是約定好的[204926]請你收下。
	else
		CloseSpeak( O_ID )
		PlayMotion( TargetID() , 107) --搖頭
		Say(TargetID(),"|cffffff00" .."[SC_PETSYS_57]".. "|r") --呃...不好意思，你帶來的[204792]數量似乎不夠喔！
	end	
end

--************以上為  玩家位於《米拉牧場》時之對話************--



--************以下為  玩家位於《進行捕寵獵寵練習的劇情》************--
function LuaYU_PetSystemWood_00()--乾枯的木台初始劇情
	SetPlot( OwnerID(),"touch","LuaYU_PetSystemWood_01",50 )
end

function LuaYU_PetSystemWood_01()
	local O_ID = OwnerID()	--玩家
	local T_ID = TargetID()	--乾枯的木台
	local play04 =  CheckFlag( O_ID , 542574 ) --火雞肉擺放完成


	if ReadRoleValue( T_ID , EM_RoleValue_Register+3) == 1 then
		return
	end

	local Player_Lv = ReadRoleValue( O_ID, EM_RoleValue_LV )--讀取玩家等級
	local meet =  CountBodyItem( O_ID , 204928 ) --香噴噴的火雞肉
	local RoomID = ReadRoleValue( O_ID ,EM_RoleValue_RoomID) 
	local play02 =  CheckFlag( OwnerID() , 542571 ) --本日練習結束

	if (meet > 0) and ( play02 == false ) and ( play04 == false ) then

		WriteRoleValue( T_ID , EM_RoleValue_Register+3, 1 ) --鎖定中
		ChangeObjID( T_ID, 114934 );	-- 置換物件的ID  香噴噴的火雞肉
		SetModeEx( T_ID  , EM_SetModeType_Show , true ) --顯示
		SetModeEx( T_ID  , EM_SetModeType_Move, false )--移動
		SetModeEx( T_ID , EM_SetModeType_DisableRotate, true )--不轉向
		SetModeEx( T_ID , EM_SetModeType_NotShowHPMP, true )--不顯示血條

		DelBodyItem( O_ID , 204928 , 1 )

		SetFlag( O_ID , 542574 , 1 ) -- 火雞肉擺放完成


		sleep(30)
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_PETSYS_27]" , 0)  --香噴噴的火雞肉引來了飢餓的野狼...
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_PETSYS_27]", 0) 
		--以下為狼出現
	 	local Warwick = CreateObjByFlag( 103568, 780307, 6 , 1 );  --全殺物件

		WriteRoleValue(  Warwick , EM_RoleValue_LV , Player_Lv  ) --野狼等級等於玩家等級
		AddToPartition( Warwick, RoomID) 

		WriteRoleValue( Warwick , EM_RoleValue_Register+1, T_ID ) --記住烤雞
		WriteRoleValue( Warwick , EM_RoleValue_Register+2, O_ID ) --記住玩家

		SetPlot( Warwick , "dead","LuaYU_114932_warwilddead_1",0 )           	
		SetModeEx( Warwick , EM_SetModeType_Fight , true )--可砍殺攻擊
		SetModeEx( Warwick  , EM_SetModeType_Strikback, true )--反擊
		SetModeEx( Warwick , EM_SetModeType_Searchenemy, false )--索敵
		SetModeEx( Warwick , EM_SetModeType_NotShowHPMP, true )--不顯示血條

		MoveToFlagEnabled(Warwick, false )
		LuaFunc_MoveToFlag( Warwick , 780307 , 7 , 0 )
		AddBuff( Warwick ,503141 ,1 ,20 )--驚訝
		sleep(10)
		SetModeEx( Warwick , EM_SetModeType_Searchenemy, true )--索敵
		SetModeEx( Warwick , EM_SetModeType_NotShowHPMP, false )--不顯示血條
		SetAttack( Warwick , O_ID ) --單純攻擊  
	end
end

function LuaYU_114932_warwilddead_1()--被寄生的狼死亡劇情

	local ID = OwnerID()
	local OrgID = ReadRoleValue( ID , EM_RoleValue_OrgID ) --該怪在資料庫的統一ID
	local Meet = ReadRoleValue( ID , EM_RoleValue_Register+1) --烤雞
	local Player = ReadRoleValue( ID , EM_RoleValue_Register+2) --玩家
	local GMtest =  CountBodyItem( Player , 203477 ) --特殊劇情觸發鑰匙


	local Str = "[SC_PETSYS_28][$SETVAR1=".."["..OrgID.."]".."]"
	--發現了一隻寄生在OrgID身上的帕奇鼠！[103567]
	ScriptMessage(Player, Player , 1 , Str , "0xff00ff00") 
	ScriptMessage(Player, Player , 0 , Str, "0xff00ff00") 

	ScriptMessage(Player, Player, 2 , "[SC_PETSYS_32]" , "0xff00ff00") --趕緊設置[103565]吧！
	ScriptMessage(Player, Player , 0 , "[SC_PETSYS_32]", "0xff00ff00") 
	local RoomID = ReadRoleValue( ID ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( ID , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( ID , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( ID , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( ID , EM_RoleValue_Dir ) 


	local StageNpc = CreateObj( 103566 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1) --帕奇鼠
	AddToPartition( StageNpc , RoomID )  

	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--可砍殺攻擊
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--反擊
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--索敵
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	Beginplot( StageNpc ,"event_module_NPC_dead_00", 0 )--5分鐘後，帕奇鼠消失



	SetModeEx( Meet  , EM_SetModeType_Show , false ) --顯示
	ChangeObjID( Meet, 114933 );	-- 置換物件的ID  乾枯的木台
	SetModeEx( Meet  , EM_SetModeType_Show , false ) --顯示

	AddBuff( StageNpc ,503589 ,1 ,-1 )--亮晶晶
	AddBuff( StageNpc ,502363 ,1 ,-1 )--亮晶晶
	SetFlag( Player , 542571 , 1 ) -- 結束實戰做記號


	if GMtest > 0 then
		WriteRoleValue( Meet , EM_RoleValue_Register+3, 0 ) --若是GM測試，解除鎖定
	end
end