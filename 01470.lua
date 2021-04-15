------掛在技能上的Script
----P1  招小樹 ----102308--102309--102310--102335-四隻樹人的編號
-- 此招為樹王對當前目標施放此技能--一次出 6 隻，每隔 15 秒就出一波
function Lua_apon_attacktree()
	local random_tree = DW_Rand(10)
	local tree1 = Lua_DW_CreateObj( "flag" , 102308 , 780362 , random_tree )  --旗標 1    
	local tree2 = Lua_DW_CreateObj( "flag" , 102309 , 780363 , random_tree )   --旗標 2
	local tree3 = Lua_DW_CreateObj( "flag" , 102310 , 780376 , random_tree )    --旗標 3
	local tree4 = Lua_DW_CreateObj( "flag" , 102335 , 780377 , random_tree )  --旗標 4
	local tree5 = Lua_DW_CreateObj( "flag" , 102308 , 780378 , random_tree )   --旗標 5
	local tree6 = Lua_DW_CreateObj( "flag" , 102309 , 780379 , random_tree )    --旗標 6
	local tree7 = Lua_DW_CreateObj( "flag" , 102310, 780380 , random_tree )  --旗標 7    
	local tree8 = Lua_DW_CreateObj( "flag" , 102335 , 780381 , random_tree )   --旗標 8
	local tree9 = Lua_DW_CreateObj( "flag" , 102308 , 780384 , random_tree )    --旗標 9
	local tree10 = Lua_DW_CreateObj( "flag" ,102309 , 780383 , random_tree )  --旗標 10

	local TempPlayer = SetSearchAllPlayer(ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)) --取現在該區內的所有玩家
	local ThesePlayer = {}
	for i=1,TempPlayer do    --將全部玩家加入樹人的仇恨表中
		ThesePlayer[i] = GetSearchResult() -- 接暫存值
		SetAttack( tree1 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree2 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree3 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree4 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree5, ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree6 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree7 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree8 , ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree9, ThesePlayer[i] ) -- 全部送進仇恨
		SetAttack( tree10 , ThesePlayer[i] ) -- 全部送進仇恨

	end
	BeginPlot(tree1,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree2,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree3,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree4,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree5,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree6,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree7,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree8,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree9,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失
	BeginPlot(tree10,"LuaS_Discowood_CheckPeace",0)  --若是8.5秒內未進入戰鬥狀態就會消失

end


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---第一階段  樹長老-1--打小樹人用---
function Lua_apon_tree_idle_1()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---只被執行一次 
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---我...的...頭...啊～滾...開...滾...開...蟲...子
				--say ( OwnerID() , "Buff-1 on")
			end
			
			if counter2 == 30 then   ----每30秒樹長老會對自己上一次buff
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				--say ( OwnerID() , "Buff-2 on")
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---我...的...頭...啊～滾...開...滾...開...蟲...子
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--say ( OwnerID() , "goto P-2")
				--DelObj ( OwnerID()  )   ---將自己刪除
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_05]" )   ---我....我....怎...麼...了 ....
				sleep(10)
				Say( OwnerID() , "[SC_102307_OTHER_06]" )   ---給...我...安...靜...下...來...你...們...這...些...小...兔...崽...子 !!
				SetRoleCamp( OwnerID() , "SNPC" )   --將自己的陣營換成SNPC，如此就可以打小樹人
				CastSpellLV( OwnerID(), OwnerID(), 493591 , 10)----光明長老將所有的小樹人定身
				sleep(300)
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---我...的...頭...啊～滾...開...滾...開...蟲...子
				CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
				sleep(10)
				SetPosByFlag( OwnerID(), 780385 , 0 )   ---將樹長老傳送到該旗標
				AddBuff ( OwnerID() , 503936 , 0 , 90 )
				SetRoleCamp( OwnerID() , "Visitor" )  ---再將自己的陣營轉換回來
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_1()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102303 then
		
		if CheckBuff( TargetID() , 503936) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --老慢慢的舒醒了過來--未勾翻譯
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --樹長老已經清醒了，你已不需再使用任何聖物--未勾翻譯
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_03]" , 1 )  --聖樹種子只能對衝鋒樹長老使用--未勾翻譯
		return false
	end
end

function lua_apon_tree_cancel_end_1()   --喚醒樹長老物品 - 1
	CastSpell( OwnerID(), TargetID(), 493583 )
end


----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
---第一階段  樹長老-2--幫玩家上Buff---皮厚型樹長老

function Lua_apon_tree_idle_2()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---只被執行一次 
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---你...們...這...些...臭...蟲...子...滾...開 !!
			end
			
			if counter2 == 30 then   ----每30秒樹長老會對自己上一次buff
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---你...們...這...些...臭...蟲...子...滾...開 !!
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---將自己刪除
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_08]" )   ---人...類...你...們...怎...麼...會...在...這...裡 ？
				sleep(10)
				CastSpell( OwnerID(), OwnerID(), 493585 )  --樹長老對全體玩家施放『聖樹祈福術』 
				sleep(60)
				Say( OwnerID() , "[SC_102307_OTHER_09]" )   ---人...類...請...你...們...喚...醒...聖...樹...法...里...諾...吧...
				sleep(20)
				CancelBuff( OwnerID() , 503937) -- 將  消除昏迷的buff  去掉
				AddBuff ( OwnerID() , 503880 , 0 , 90 )
				sleep(10)
				--say ( OwnerID() , "Buff-3 on")
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_2()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102304 then
		
		if CheckBuff( TargetID() , 503880) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --樹長老慢慢的舒醒了過來--未勾翻譯
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --樹長老已經清醒了，你不需要使用種子--未勾翻譯
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_10]" , 1 )  --聖樹露水只能對衝鋒樹長老使用--未勾翻譯
		return false
	end
end

function lua_apon_tree_cancel_end_2()   --喚醒樹長老物品 - 2
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---第一階段  樹長老-3--幫玩家增加傷害輸出--強大傷害型的樹長老

function Lua_apon_tree_idle_3()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---只被執行一次 
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )  ---我...的...頭...啊～滾...開...滾...開...蟲...子
			end
			
			if counter2 == 30 then   ----每30秒樹長老會對自己上一次buff
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_04]" )   ---我...的...頭...啊～滾...開...滾...開...蟲...子
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---將自己刪除
				--break
			--end
							
			if  CheckBuff ( OwnerID() , 503937) == true and ( CheckID( OwnerID() ) ) == true then
				Say( OwnerID() , "[SC_102307_OTHER_08]" )   ---人...類...你...們...怎...麼...會...在...這...裡 ？
				sleep(10)
				CastSpell( OwnerID(), OwnerID(), 493586 )  --樹長老對全體玩家施放『聖樹巨大術』 
				sleep(60)
				Say( OwnerID() , "[SC_102307_OTHER_09]" )   ---人...類...請...你...們...喚...醒...聖...樹...法...里...諾...吧...
				sleep(20)
				CancelBuff( OwnerID() , 503937) -- 將  消除昏迷的buff  去掉
				AddBuff ( OwnerID() , 503881 , 0 , 90 )
				sleep(10)
				break
			end
		end
	end	
end

function lua_apon_tree_cancel_3()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102305 then
		
		if CheckBuff( TargetID() , 503881) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --樹長老慢慢的舒醒了過來--未勾翻譯
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --樹長老已經清醒了，你不需要使用種子--未勾翻譯
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_11]" , 1 )  --閃爍花蕊只能對力量樹長老使用
		return false
	end
end

function lua_apon_tree_cancel_end_3()   --喚醒樹長老物品 - 3
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

---第一階段  樹長老-4--醒來後，會跑去對Boss攻擊，讓Boss減少 5 ％  的血量----還沒測試----需要由樹王將這隻生出來，不可以直接種，所以此段script 要直接放在NPC的初始劇情中

function Lua_apon_tree_idle_4()
	while 1 do
		local counter1 = 0
		local counter2 = 0
		sleep(10)
		for i = 0 , 1000 , 1 do
			sleep(10)
			counter1 = counter1 + 1
			counter2 = counter2 + 1			
			if counter1 == 1 then ---只被執行一次 
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---你...們...這...些...臭...蟲...子...滾...開 !!
			end
			
			if counter2 == 30 then   ----每30秒樹長老會對自己上一次buff
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---你...們...這...些...臭...蟲...子...滾...開 !!
				sleep(10)
				counter2 = 0
			end
			
			--if CheckBuff ( OwnerID() , 503886) == true and ( CheckID( OwnerID() ) ) == true then
				--sleep(10)
				--DelObj ( OwnerID()  )   ---將自己刪除
				--break
			--end
			
			if  CheckBuff ( OwnerID() , 503937) == true  and ( CheckID( OwnerID() ) ) == true then
				local Boss = ReadRoleValue(OwnerID(),EM_RoleValue_PID)  --將樹王的ID從PID中讀出來，並且將Boss宣告成該ID
				Say( OwnerID() , "[SC_102307_OTHER_05]" )   ---我....我....怎...麼...了 ....
				sleep(20)
				Say( OwnerID() , "[SC_102307_OTHER_12]" )   ---聖...樹...法...里...諾...請...您...醒...醒...啊 ！！
				SetRoleCamp( OwnerID() , "SNPC" )   --嘗試先不轉換陣營，看可不可以一樣打的到樹王
				SetAttack( OwnerID() , Boss )    --將攻擊目標設定成樹王
				CastSpell( OwnerID(), Boss, 493587 )   ---對樹王連續施放五次法術，可以扣樹王 5％ 的 HP
				sleep(150)
				Say( OwnerID() , "[SC_102307_OTHER_07]" )   ---你...們...這...些...臭...蟲...子...滾...開 !!
				CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
				sleep(10)
				SetPosByFlag( OwnerID(), 780388 , 0 )   ---將樹長老傳送到該旗標
				AddBuff ( OwnerID() , 503882 , 0 , 90 )
				SetRoleCamp( OwnerID() , "Visitor" )  ---同上，先不考慮陣營的問題。
				break
			end
		end
	end	
end



function lua_apon_tree_cancel_4()

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 102306 then
		
		if CheckBuff( TargetID() , 503882) ==true then
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_01]" , 1 )    --樹長老慢慢的舒醒了過來--未勾翻譯
			return true
		else
			ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_02]" , 1 )     --樹長老已經清醒了，你不需要使用種子--未勾翻譯
			return false
		end
	else
		ScriptMessage( TargetID(), -1 , 1 , "[SC_102307_OTHER_13]" , 1 )  --聖地花粉只能對律法樹長老使用
		return false
	end
end

function lua_apon_tree_cancel_end_4()   --喚醒樹長老物品 - 4
	CastSpell( OwnerID(), TargetID(), 493583 )
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------第二和第三階段樹人使用
----黑暗樹長老一號
 
function Lua_apon_tree_black_1()    
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----喚醒黑暗長老的Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---撥傳送的特效。
			sleep(20)
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---當樹長老走到該旗標後，馬上再傳送一次，這樣怪才會真正在那一個點，時間的取捨以場地測試後決定
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --搜尋敵人
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----不可反擊
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_14]" )   ---蟲...子...你...們...的...命...運...就...只...有...死 !!
			sleep(10)
			
			CastSpellLV( OwnerID(), AttackTarget, 493869 , 1 )  --個人秀-1--清Buff
			sleep(15)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493869 , 1 )  --個人秀-1--清Buff
			sleep(15)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )  --個人秀-1--單體傷害
			sleep(25)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------黑暗長老個人秀結束後上一個Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----不可反擊
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780385 , 1 )   ---將樹長老傳送到該旗標
			
			
			
		elseif CheckBuff( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----如果此樹長老身上有這個Buff並且是活著的，在第三階段，則會做出以下的流程 
			sleep(10)
			SetPosByFlag( OwnerID(), 780385 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), AttackTarget, 493590 , 10 )
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 12 then
						CastSpellLV( OwnerID(), AttackTarget, 493869 , 1)
						counter2 = 0
						sleep(10)
					end
				else
					break ----將 Counter 歸零
				end
			end	
		end
	end
end

----黑暗樹長老二號
 
function Lua_apon_tree_black_2()    
	while 1 do
		sleep(10)
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----喚醒黑暗長老的Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---撥傳送的特效。
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---當樹長老走到該旗標後，馬上再傳送一次，這樣怪才會真正在那一個點，時間的取捨以場地測試後決定
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --搜尋敵人
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----不可反擊
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_15]" )   ---蟲...子...死...吧 !!
			sleep(10)
			
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --個人秀-1--目標降治療80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --個人秀-2--AE技會斷法
			sleep(50)
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --個人秀-1--目標降治療80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --個人秀-2--AE技會斷法
			sleep(50)
			CastSpellLV( OwnerID(), AttackTarget, 493682 , 1)  --個人秀-1--目標降治療80%
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493681 , 4)  --個人秀-2--AE技會斷法
			sleep(50)

			AddBuff (OwnerID() , 503888 , 0 , 600)   ------黑暗長老個人秀結束後上一個Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----不可反擊
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780386 , 1 )   ---將樹長老傳送到該旗標
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----如果此樹長老身上有這個Buff並且是活著的，在第三階段，則會做出以下的流程 
			sleep(10)
			SetPosByFlag( OwnerID(), 780386 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), AttackTarget , 493682 , 1)--目標降治療80%
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493681 , 0)--AE技會斷法
						counter2 = 0
						sleep(20)
					end
				else
					break ----將 Counter 歸零
				end
			end	
		end
	end
end



----黑暗樹長老三號
 
function Lua_apon_tree_black_3()    
	while 1 do
		sleep(10)
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff ( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----喚醒黑暗長老的Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---撥傳送的特效。
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---當樹長老走到該旗標後，馬上再傳送一次，這樣怪才會真正在那一個點，時間的取捨以場地測試後決定
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --搜尋敵人
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----不可反擊
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_15]" )   ---蟲...子...死...吧 !!
			sleep(10)
			
			CastSpellLV( OwnerID(), OwnerID(), 493679 , 10)  --個人秀-1--Buff維持時間到個人秀結束
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
			sleep(40)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------黑暗長老個人秀結束後上一個Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----不可反擊
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780387 , 1 )   ---將樹長老傳送到該旗標
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----如果此樹長老身上有這個Buff並且是活著的，在第三階段，則會做出以下的流程 
			sleep(10)
			SetPosByFlag( OwnerID(), 780387 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 10 then
						CastSpellLV( OwnerID(), OwnerID(), 493694 , 99)  --Buff維持時間為1000秒，所以這隻千萬不能進二階
						--counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493693 , 2)  --個人秀-2--AE技--扣30％
						counter2 = 0
						sleep(10)
					end
				else
					break ----將 Counter 歸零
				end
			end	
		end
	end
end


----黑暗樹長老四號
 
function Lua_apon_tree_black_4()    
	while 1 do
		sleep(10)	
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		if CheckBuff ( OwnerID() , 503887) == true and ( CheckID( OwnerID() ) ) == true then  ----喚醒黑暗長老的Buff
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )   ---撥傳送的特效。
			SetPosByFlag( OwnerID(), 780393 , 1 )   ---當樹長老走到該旗標後，馬上再傳送一次，這樣怪才會真正在那一個點，時間的取捨以場地測試後決定
			sleep(20)
			CancelBuff(OwnerID() , 503887)
			SetModeEx( OwnerID()   , EM_SetModeType_Move, true )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Searchenemy, true) --搜尋敵人
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , true )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, true )----不可反擊
			Hide(OwnerID() )
			Show(OwnerID(),roomid1 )
			Say( OwnerID() , "[SC_102307_OTHER_14]" )   ---蟲...子...你...們...的...命...運...就...只...有...死 !!
			sleep(10)
			
			CastSpellLV( OwnerID(), OwnerID(), 493678 , 3)  --個人秀-1--全場Dot，40秒
			sleep(30)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --個人秀-2--AE技--扣10％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --個人秀-2--AE技--扣10％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --個人秀-2--AE技--扣10％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --個人秀-2--AE技--扣10％
			sleep(40)
			CastSpellLV( OwnerID(), OwnerID(), 493693 , 0)  --個人秀-2--AE技--扣10％
			sleep(40)
			
			AddBuff (OwnerID() , 503888 , 0 , 600)   ------黑暗長老個人秀結束後上一個Buff
			SetModeEx( OwnerID()   , EM_SetModeType_Move, false )--移動
			SetModeEx( OwnerID()   , EM_SetModeType_Fight , false )--不可砍殺攻擊
			SetModeEx( OwnerID()   , EM_SetModeType_Strikback, false )----不可反擊
			CancelBuff ( OwnerID() , 503888 )
			sleep(10)
			CastSpell( OwnerID(), OwnerID(), 493584 )  --傳送術的特效
			
			sleep(35)
			SetPosByFlag( OwnerID(), 780388 , 1 )   ---將樹長老傳送到該旗標
			
		elseif CheckBuff ( OwnerID() , 503889) == true and ( CheckID( OwnerID() ) ) == true then  ----如果此樹長老身上有這個Buff並且是活著的，在第三階段，則會做出以下的流程 
			sleep(10)
			SetPosByFlag( OwnerID(), 780388 , 1 )
			SetFightMode ( OwnerID(),1, 1, 1,1 )
			sleep(10)
			local counter1 = 0
			local counter2 = 0
			--say(OwnerID() , "Tree_1_counter1 ="..counter1)
			--say(OwnerID() , "Tree_2_counter1 ="..counter2)
			while 1 do 
				sleep(10)
				local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
				if  ( AttackTarget ~= 0 ) and ( CheckID( OwnerID() ) ) == true then			
					counter1 = counter1 + 1
					counter2 = counter2 + 1
					sleep(10)
					if counter1 == 5 then
						CastSpellLV( OwnerID(), OwnerID(), 493678 , 2)  --個人秀-1--全場Dot，長駐
						counter1 = 0
						sleep(10)
					end
				
					if counter2 == 8 then
						CastSpellLV( OwnerID(), OwnerID(), 493693 , 1)  --個人秀-2--AE技--扣20％
						counter2 = 0
						sleep(10)
					end
				else
					break ----將 Counter 歸零
				end
			end	
		end
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------	