------------------------------------------------------------------------
function Z22CavyOff_01() --使會相互攻擊的怪物不會產生帕奇鼠
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106463 or --劇毒蜘蛛蠍
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106464 then --兇猛的棕毛虎
	   SetFlag( OwnerID(), 544801, 1 )
	end
end
------------------------------------------------------------------------
function Z22CavyOff_02() --使會相互攻擊的怪物不會產生帕奇鼠
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106465 or --新生的火元素
	   ReadRoleValue( TargetID() , EM_RoleValue_OrgID)==106466 then --好戰的火元素
	   SetFlag( OwnerID(), 544801, 1 )
	end
end
------------------------------------------------------------------------
function Z22killedbuff_01() --獲得此狀態的小動物會被場景中的肉食怪秒殺
	AddBuff ( OwnerID(),621301,0,-1)
	ic_MOB_BUFF_22()
end
------------------------------------------------------------------------
function Z22SearchFireElemental_01() --使火元素相互攻擊(每3秒索敵1次)
	ic_MOB_BUFF_22()
	while 1 do
		if ReadRoleValue( OwnerID() ,EM_RoleValue_IsAttackMode ) ==0 then
			local FireElemental=SearchRangeNPC ( OwnerID(),120 )
			for i = 0 , table.getn(FireElemental), 1 do
				if FireElemental[i]~=OwnerID()   then
			   	SetAttack( OwnerID() , FireElemental[i] )
				end
			end
		end
	sleep(30)
	end
end
------------------------------------------------------------------------
function Z22ReSetFireElemental_01() --在自身產生50秒後若未進入戰鬥則重置自己
	ic_MOB_BUFF_22()
	Sleep(500)
	if ReadRoleValue( OwnerID() ,EM_RoleValue_IsAttackMode ) ==0 then
	   CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
	end
end
------------------------------------------------------------------------
Function Z22ForgingIron_01() --火靴工匠鍛造動作
	local ForgingFire=SearchRangeNPC ( OwnerID(),20 )
	local y=0
	for i = 0 , table.getn(ForgingFire), 1 do
		if ReadRoleValue( ForgingFire[i], EM_RoleValue_OrgID)==119867 then
			while 1 do
			y=rand(50)+10
			PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_2H, ruFUSION_ACTORSTATE_COMBAT_2H)
			Sleep(y)
			CastSpell( OwnerID(), ForgingFire[i], 498752 )
			Sleep(15)
			End
		End
	End
End
------------------------------------------------------------------------
function Z22ForgingFire_buff01() --獲得此Buff後會冒濃煙
	Sleep(15)
	AddBuff ( OwnerID(),621452,1,-1)
	--Sleep(15)
	--AddBuff ( OwnerID(),621493,1,-1)
end
------------------------------------------------------------------------
Function Z22phoenixFX_01() --重生的柯隆外觀特效
	SetModeEx( OwnerID(), EM_SetModeType_ShowRoleHead, true )--頭像框
	SetModeEx( OwnerID(), EM_SetModeType_HideName, true )--名稱
	AddBuff ( OwnerID() ,621554 , 1, -1)
	Sleep(10)
	AddBuff ( OwnerID() ,621555 , 1, -1)
	Sleep(10)
	AddBuff ( OwnerID() ,621625 , 1, -1)
End
------------------------------------------------------------------------
function Z22AddFire_buff01() --獲得此Buff後會冒火
	while 1 do
		local X=Rand(3)+1
		local Y=Rand(5)+10
		local Z=Rand(50)+100
		if X==1 or X==2 then
		AddBuff ( OwnerID(), 621639 , 1, Y )
		end
	Sleep(Z)
	end
end
------------------------------------------------------------------------
function Z22AddFire_buff02() --柯隆佈置用法陣
	Sleep(10)
	AddBuff ( OwnerID(),621648,1,-1)
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_Monster01() --戰鬥校場表演劇情
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )--鎖定自身血量
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )--不可點選
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )--不秀頭像
	SetModeEx( OwnerID()  ,EM_SetModeType_NotShowHPMP , false )--不顯示血條
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true )--此物件不會被搜尋到
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--可砍殺
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , true )--主動索敵
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , true )--會反擊

	local x=ReadRoleValue(OwnerID(),EM_RoleValue_X) --讀取自身X軸座標
	local y=ReadRoleValue(OwnerID(),EM_RoleValue_Y) --讀取自身Y軸座標
	local z=ReadRoleValue(OwnerID(),EM_RoleValue_Z) --讀取自身Z軸座標
	
	local xyz1={x-40,y,z}--宣告要產生聯盟戰士1的位置
	local xyz2={x,y, z-30}--宣告要產生聯盟戰士2的位置
	--local xyz3={x,y,z+30}--宣告要產生聯盟戰士3的位置

	local npc1=Lua_DW_CreateObj( "xyz" , 106573, xyz1, 1 , 180 , 1 )--依前項已宣告的位置產生聯盟戰士1
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,npc1)--將聯盟戰士1的GitemID在自身身上做紀錄
	WriteRoleValue(npc1,EM_RoleValue_Register1,OwnerID())--將自身的GitemID在聯盟戰士1身上做紀錄

	local npc2=Lua_DW_CreateObj( "xyz" , 106574, xyz2, 1 , 270 , 1 )--依前項已宣告的位置產生聯盟戰士2
	WriteRoleValue(OwnerID(),EM_RoleValue_Register2,npc2)--將聯盟戰士2的GitemID在自身身上做紀錄
	WriteRoleValue(npc2,EM_RoleValue_Register1,OwnerID())--將自身的GitemID在聯盟戰士2身上做紀錄

	--local npc3=Lua_DW_CreateObj( "xyz" , 106575, xyz3, 1 , 90 , 1 )--依前項已宣告的位置產生聯盟戰士3
	--WriteRoleValue(OwnerID(),EM_RoleValue_Register3,npc3)--將聯盟戰士3的GitemID在自身身上做紀錄
	--WriteRoleValue(npc3,EM_RoleValue_Register1,OwnerID())--將自身的GitemID在聯盟戰士3身上做紀錄

	--SetAttack( OwnerID() ,npc1 ) --對聯盟戰士進行攻擊
	SetPlot( OwnerID(),"dead","Z22TRAINING_GROUNDS_Monster02",0 ) 
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_Monster02() --戰鬥校場表演劇情
	local NPC1=ReadRoleValue(OwnerID(),EM_RoleValue_Register1) --提取紀錄在自身Register1位置的值並進行宣告
	local NPC2=ReadRoleValue(OwnerID(),EM_RoleValue_Register2) --提取紀錄在自身Register2位置的值並進行宣告
	--local NPC3=ReadRoleValue(OwnerID(),EM_RoleValue_Register3) --提取紀錄在自身Register3位置的值並進行宣告
	WriteRoleValue(NPC1,EM_RoleValue_LiveTime,4)--4秒後刪除NPC1
	WriteRoleValue(NPC2,EM_RoleValue_LiveTime,4)--4秒後刪除NPC2
	--WriteRoleValue(NPC3,EM_RoleValue_LiveTime,4)--4秒後刪除NPC3
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC01() --戰鬥校場表演劇情
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )--鎖定自身血量
	MoveToFlagEnabled( OwnerID() , false )--使自己暫時忽略預設的巡邏路徑
	SetModeEx( OwnerID()  ,EM_SetModeType_Mark , false )--不可點選
	SetModeEx( OwnerID()  ,EM_SetModeType_ShowRoleHead , false )--不秀頭像
	SetModeEx( OwnerID()  ,EM_SetModeType_NotShowHPMP , false )--不顯示血條
	SetModeEx( OwnerID()  ,EM_SetModeType_SearchenemyIgnore , true )--此物件不會被搜尋到
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--可砍殺
	SetModeEx( OwnerID()  ,EM_SetModeType_Searchenemy , true )--主動索敵
	SetModeEx( OwnerID()  ,EM_SetModeType_Strikback , true )--會反擊
	sleep(10)
	local Target=ReadRoleValue(OwnerID(),EM_RoleValue_Register1) --提取紀錄在自身Register1位置的值並進行宣告
	SetAttack( OwnerID() ,Target ) --對Target進行攻擊
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC02() --戰鬥校場表演劇情
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.99 , "Lua_424225_LockHP" )--鎖定自身血量
	SetModeEx( OwnerID()  ,EM_SetModeType_Fight , true )--可砍殺
	MoveToFlagEnabled( OwnerID() , false )--使自己暫時忽略預設的巡邏路徑
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC03() --戰鬥校場表演劇情
	while 1 do
		local x=Rand(9)+1
			if x==1 then PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H)
			elseif x==2 then CallPlot(OwnerID(),"Lua_PG_Point",OwnerID())		
			else CallPlot(OwnerID(),"Lua_DW_Idle",OwnerID())
			end
		sleep(100)
	end
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC04() --戰鬥校場表演劇情
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_COMBAT_1H, ruFUSION_ACTORSTATE_COMBAT_1H)
	while 1 do
		local Motion=Rand(4)+1
			if Motion==1 then CastSpell(OwnerID(),OwnerID(),498931)
			elseif Motion==2 then CastSpell(OwnerID(),OwnerID(),498930)
			else CastSpell(OwnerID(),OwnerID(),498929)
			end
	sleep(90)
	end
end
------------------------------------------------------------------------
function Z22TRAINING_GROUNDS_NPC05() --戰鬥校場表演劇情
	while 1 do
		local Speak= Rand(17)+1
		if Speak==1 then 	CastSpell(OwnerID(),OwnerID(),498932)
				Sleep(05)
				npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_01]")--每項動作都必須將速度與力量融入。
		elseif Speak==2 then	 CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_02]")--請大家仔細看他的出手動作 .....力量釋放的關鍵在於腰部力量的配合！		
		elseif Speak==3 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_03]")--另外~防禦也是不能忽略的，防禦動作必須確實...。		
		elseif Speak==4 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)	
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_04]")--示範當然不是看完就算了，每個人都必須要不斷地練習。
		elseif Speak==5 then CastSpell(OwnerID(),OwnerID(),498932)
				 Sleep(05)
				 npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_05]")--課後的練習時間，等同於你實際在戰場上的存活時間。		
		elseif Speak==6 then npcSay(OwnerID(),"[SC_Z22TRAINING_GROUNDS_06]")--有任何不清楚的地方可以隨時提問！
		end
	sleep(100)
	end
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_01()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(7)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_01]" ) return end--價格的部分難道就不能....
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_02]" ) return end--那是因為你們根本不瞭解前線的戰況！
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_03]" ) return end--....你說[ZONE_LOGISTICAL_WAREHOUSE]人手不足？現在哪個單位不是呢？
	if RandID==4 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_04]" ) return end--我覺得，我們的談話似乎沒什麼進展....
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_02()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(7)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_05]" ) return end--舊大陸嗎....？恐怕會來不急吶....
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_06]" ) return end--我們還需要火靴工匠來進行加工....
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_07]" ) return end--那就讓[ZONE_LOGISTICAL_WAREHOUSE]來協助運送吧！
	if RandID==4 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_08]" ) return end--剩下的....我們全都要了！
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_03()
	CallPlot( OwnerID() , "LuaP_Speak_A" , OwnerID() )
	sleep(10)
	local RandID = rand(5)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_09]" ) return end--確實....配送的速度也是問題！
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_10]" ) return end--"傳送"的成本可不便宜呀！
	if RandID==3 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_11]" ) return end--唉！也許我們應該考慮合作....。
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_04()
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	sleep(10)
	local RandID = rand(3)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_12]" ) return end--商品所剩不多....快來看看呦！
	if RandID==2 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_13]" ) return end--武器當然比什麼都重要....
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_05()
	CallPlot( OwnerID() , "Lua_DW_Craft" , OwnerID() )
	sleep(10)
	local RandID = rand(3)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_14]" ) return end --（這些人.....究竟是有沒有這麼忙呀....）
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_06()
	CallPlot( OwnerID() , "Lua_DW_Craft" , OwnerID() )
	sleep(30)
	local RandID = rand(2)
	if RandID==1 then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_15]" ) return end --呼....到底還差少呢！
end
------------------------------------------------------------------------
function Will_Z22WAREHOUSE_07()
	local RandID = rand(4)

	if RandID==1 
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_16]" ) --無限藥草給你無限希望喔....！
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	return end

	if RandID==2
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_17]" ) --來看看喔....新大陸，老價格呦！
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_WAVE" , OwnerID() )
	return end

	if RandID==3
	then npcSay( OwnerID(), "[SC_Z22WAREHOUSE_18]" ) --朋友吶....一分準備才有一分安全喔！
	sleep(10)
	CallPlot( OwnerID() , "LuaP_dr_STRETCH" , OwnerID() )
	return end
end
------------------------------------------------------------------------
