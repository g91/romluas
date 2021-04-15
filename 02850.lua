------------
--帕奇出現
function lua_quest426029_0()
	if CountBodyItem( OwnerID(),242336 )>=1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426029_0]", 0 );
		--能量汲取系統正在持續運作著，一靠近就能感受到一股強烈的元素之力。
		return false
	end
end
function lua_quest426029_1()
	local pachi =121981
	local tmp = SearchRangeNPC( TargetID(),100 )	--搜尋範圍100內的npc編號，tmp是一個table
	--此處要進行 SearchRangeNPC
		for i=0,#tmp,1 do		
			if ReadRoleValue( tmp[i],EM_RoleValue_OrgID ) == pachi then	--orgid =在資料庫中的編號
				CastSpell( TargetID(),tmp[i],850690 )
				break
			end
		end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Q426029_1]", 0 );
	--奇怪的球體在填充完能量後突然發出光芒，從球體中央的機件開始向外一一展開，變形成一個小小的監護者樣貌。
		--此處帕奇要出現
		if DelBodyItem( OwnerID(), 242336, 1 ) then
			SetFlag( OwnerID(), 547694 ,1 )		--為球體填充能量
		end
		return 1	--讓他不秀"你沒有取得東西" 的訊息
end
-----------
--接還任務表演時，OwnerID是npc
function lua_quest426030_1()--帕奇離開消失
	--產生帕奇
	local newpachi = 122000
	local x,y,z,dir = DW_Location( OwnerID() )	--取得該角色座標
	local obj =CreateObj( newpachi,x,y,z,dir,1 )	--建立新角色
		--演戲角色不可被點擊，必須關閉選取欄位
		SetModeEx( obj  , EM_SetModeType_Mark, false )	 --設定角色的屬性：script產生的角色是無法用工具設定的
		--演戲角色要關閉巡徑，以免演戲過程中返回重生點
		MoveToFlagEnabled( obj ,false )	--關閉後移動方式會自動變成走路
		AddToPartition( obj,0 )			--將角色載入地圖
		Say( obj, "[SC_Q426030_1(1)]" )	--喀…喀…等我，馬上回來…
		--帕奇移動
		LuaFunc_moveToFlag( obj,781205,1,0 )	--角色 旗子 ID 範圍
		ScriptMessage( TargetID(), TargetID(), 2, "[SC_Q426030_1(2)]", 0 );--帕奇搖搖晃晃的往前衝刺，步伐相當吃力。
		--此處帕奇要消失
		--Sleep( 30 )
		DelObj( obj)
end

function lua_quest426030_2()
	if CheckFlag( OwnerID(),547696 )==true then	--如果已經找回[121986]
		DebugMsg( OwnerID() , 1, "接取後" )
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426030_2(2)]", 0 );--眼前的草叢似乎被狠狠踐踏過似的，破爛且凹陷進地面。
	else
		--當黃
		DebugMsg( OwnerID() , 1, "1" )
		--訊息發話,可指定發話者,0 左下訊息   1 中間-紅   2 中間-黃   3 同時秀2和0
		--任務接取/完成(黃色系統字)會與黃字相衝而無法顯示
		--相衝變通方式為：
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_Q426030_2(1)]", C_YELLOW );--糟糕！[121986]破碎的身體捲成一圈扭曲著躺在地上，看來是在衝出去找同伴時被正在巡邏的重拳制裁者一腳踩扁的！
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_Q426030_2(1)]", 0 );--左下框也顯示
		DebugMsg( OwnerID() , 1, "2" )
		GiveBodyItem( OwnerID(), 242230, 1 )
		DebugMsg( OwnerID() , 1, "拿到物品" )
	end
	return 1
end

-----------
-----------
function lua_quest426031_0()
	--設定該角色的範圍劇情(掛在物件產生劇情中)
	SetPlot( OwnerID() ,"Range" , "lua_quest426031_1" , 50 )
	DebugMsg( OwnerID() , 1, "靠近" )
	
	
End
function lua_quest426031_1()
	DebugMsg( OwnerID() , 1, "開始" )

	if CheckAcceptQuest( OwnerID(),426031 ) ==true then	--如果有任務
		--if CheckFlag( OwnerID(),547697 )==true then	--如果已有晶礦原料
		if CountBodyItem( OwnerID(),242335 )>=1 then
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426031_1(2)]", 0 );--在被晶礦採集者發現前趕緊離開吧。
			DebugMsg( OwnerID() , 1, "有晶礦原料" )
		else
			ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_Q426031_1(1)]", 0 );--負責採集礦原料的監護者正處在維修狀態，趁這個機會悄悄拿走它身上的資源。
			Sleep(20)
			DebugMsg( OwnerID() , 1, "無晶礦原料" )
			--SetFlag( OwnerID(), 547697 ,1 )	--取得晶礦原料
			GiveBodyItem( OwnerID(), 242335, 1 )
			DebugMsg( OwnerID() , 1, "給物品" )
		end
	--	LoadQuestOption(OwnerID())
	end
end
--接還任務表演時，OwnerID是npc
function lua_quest426031_2()--摩查爾．卡帕離開消失
	--產生摩查爾
	local newmo= 122001
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj =CreateObj( newmo,x,y,z,dir,1 )
		SetModeEx( obj  , EM_SetModeType_Mark, false )
		--演戲角色要關閉巡徑，以免演戲過程中返回重生點
		DebugMsg( OwnerID() , 1, "建立" )
		MoveToFlagEnabled( obj ,false )	--關閉後移動方式會自動變成走路
		AddToPartition( obj,0 )			--將角色載入地圖
		DebugMsg( OwnerID() , 1, "走路吧" )
		LuaFunc_moveToFlag( obj,781205,2,0 )	--角色 旗子 ID 範圍
		DebugMsg( OwnerID() , 1, "881" )
		DelObj( obj)
end

-----------
---對話劇情，對話都是掛在玩家身上
function lua_Z25Q121979_SZ()--將帕奇交給摩查爾．卡帕
	LoadQuestOption( OwnerID() )--載入任務面板
	if CheckAcceptQuest( OwnerID(),426030 )==true and CountBodyItem( OwnerID(),242230 )==1 then
		AddSpeakOption( OwnerID(),OwnerID(),"[SC_423034_5]","lua_Z25Q121979_1",0)	--對話選項：你有發現什麼線索嗎？
	end
end
function lua_Z25Q121979_1()
	CloseSpeak( OwnerID())--關閉面板
	DelBodyItem( OwnerID(),242230,1 )
	SetFlag( OwnerID(),547696,1)
	Tell( TargetID(),OwnerID(),"[SC_Z25Q121979_1]" )--悄悄話：[$playername]，讓我們看看你找到了什麼線索。
end 



function lua_Z25_man_test()

	--SetPlot( OwnerID() ,"touch" , "lua_Z25_man_test_touch" , 50 )
	SetPlot( OwnerID() ,"Range" , "lua_Z25_man_test_Range" , 50 )
	DebugMsg( OwnerID() , 1, "測試對話&動作用" )

	
end
function lua_Z25_man_test_touch_1()
--	local roomid =ReadRoleValue( OwnerID(), EM_RoleValue_RoomID)
--	Show( OwnerID(), roomid ) 
	SetModeEx( OwnerID(), EM_SetModeType_Show, TRUE )

end

function lua_Z25_man_test_touch_2()

	LuaP_RidingBlackHouse(OwnerID)

end

function lua_Z25_man_test_touch_3()

	DW_CancelTypeBuff(68,OwnerID())
	Sleep(20)
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )

end


function lua_Z25_man_test_Range()
	Tell( TargetID(),OwnerID(),"[SC_Z25Q121979_1]" )--悄悄話：[$playername]，讓我們看看你找到了什麼線索。	

end

