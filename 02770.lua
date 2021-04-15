
--====================================報名劇情===========================================================
function teacatodo_121473_speak() --對話劇情
	local Owner = OwnerID()
	local Target = TargetID()
	local brother=ReadRoleValue(Target , EM_RoleValue_Register2)----紀錄是否可以報名 0表示可以 1表示不行 
	local Player = SearchRangePlayer( Owner , 10)
	local secondseat = Lua_Mounts_Copilot( Owner )--有無騎乘雙人座騎
	for i = 0 , table.getn( Player) do
		DW_CancelTypeBuff(68,Player[i])--騎乘坐騎時，點擊下馬	
	end
	if CheckFlag(Owner,547132)==true and CheckBuff( Owner , 623637 )==true then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--活動結束
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --領取獎勵！
	elseif CheckFlag(Owner,547132)==true then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC10]")--檢查有無被淘汰
	else
		if CheckFlag(Owner,547131)==true then--檢查有無領取獎勵
			SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC06]")

		elseif CheckFlag(Owner,547130)==true then--先檢查玩家是否玩過
			SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--活動結束
			AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --領取獎勵！

		else 

			if brother == 1 then --表示不可報名
				SetSpeakDetail(Owner , "[SC_2012_TEACATODO_NPC09]") --我已經找了幾個勇者...
		
			else
				SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC01]") --真是的，養那一大堆莫名一奇妙的玩意...
				if CheckBuff(Owner,623627) ==true then
					SetSpeakDetail( Owner  ,"[SC_2012_TEACATODO_NPC11]"  )--玩家有變身BUFF下顯示
				elseif CheckFlag(Owner,547133)==true then--檢查有無離線過
					SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC05]")--活動結束
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT05]" ,  "teacatodo_121473_getgift",0 ) --領取獎勵！
					SetFlag(Owner,547130,1)
				else	
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT01]" ,  "teacatodo_121473_speak2",0 )--請問可以說得更詳細一點嗎？
					AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 ) --不好意思，我沒興趣
				end
			end
		end
	end
end


function teacatodo_121473_speak2() --延續對話
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue(Target , EM_RoleValue_Register2)
	if  brother==0 then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC02]")--我爹在城外有個農場留給我和我哥...
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT03]" ,  "teacatodo_121473_speak3",0 )--那我應該怎麼做？
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121473_start",0 )--我懂了，那就把我送過去吧
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 )--不好意思，我沒興趣
	end
end


function teacatodo_121473_speak3() --規則說明
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue( Target , EM_RoleValue_Register2)
	if  brother == 0 then
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC03]") --我會先把你送過去...
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121473_start",0 )--我懂了，那就把我送過去吧
		AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121473_speak4",0 )--不好意思，我沒興趣
	end
end

function teacatodo_121473_speak4() --不參加活動
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC04]") --哼，沒差...
end

--====================================活動部分劇情==========================================================

function teacatodo_121473_start() --活動開始，給予玩家2分鐘的活動BUFF
	local Owner = OwnerID()
	local Target = TargetID()
	local  brother = ReadRoleValue( Target , EM_RoleValue_Register2)
	local secondseat = Lua_Mounts_Copilot( Owner )--有無騎乘雙人座騎
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	DW_CancelTypeBuff(68, Owner)
	CloseSpeak( Owner)
	if  brother == 0 and checkbuff(Owner , 623700 )== false then
		if secondseat == false then --有在後座
			ScriptMessage( Owner , Owner , 1 , "[SC_2012_TEACATODO_WARNING6]" , 0 ) --"騎乘坐騎時無法進行此動作，請先解除騎乘狀態。"
		else
			SysCastSpellLv(Owner,Target,850434,0)
			setflag(Owner, 547133, 1)  
			SetPos(Owner, 203.7, 74.0, -230.1, 0 )
			AddBuff( Target , 623700 , 0 , 1 )	-- 施放一個1秒鐘的法術
		end
		DesignLog( Owner , 121473 , "Lv = "..Lv.." SubLv = "..SubLv )--回傳活動參與值
	else
		ScriptMessage( Owner , Owner , 1 , "[SC_Z21_Q424542_03]" , 0 ) --目標忙碌中
	end
end


function Teacat_egg_BuffValue()--活動結束，計算分數
	local Owner = OwnerID()
	local BuffID = 623635
	local BuffLv =  FN_CountBuffLevel(Owner,BuffID)
		WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	if BuffLv ==-1 then
		ScriptMessage(Owner,Owner,3,"[SC_2012_TEACATODO_BUFFSCORE]",0) 
		if checkbuff( Owner, 623627) == false then
			CancelBuff(Owner , 623635 )--健康的鶴鴕蛋
			CancelBuff(Owner , 623673 )--觀察中
			CancelBuff(Owner , 623676 )--驚慌失措
			CancelBuff(Owner , 623677 )--懷疑中
			CancelBuff(Owner , 623679 )--警戒心
			CancelBuff(Owner , 623688 )--警戒程度
		end
	else
		ScriptMessage(Owner,Owner,3,"[SC_2012_TEACATODO_BUFFSCORE]",0) 
		if checkbuff( Owner, 623627) == false then
			CancelBuff(Owner , 623635 )--健康的鶴鴕蛋
			CancelBuff(Owner , 623673 )--觀察中
			CancelBuff(Owner , 623676 )--驚慌失措
			CancelBuff(Owner , 623677 )--懷疑中
			CancelBuff(Owner , 623679 )--警戒心
			CancelBuff(Owner , 623688 )--警戒程度
		end

		addbuff(Owner,623637,BuffLv,180)
	end
		SetFlag(Owner,547130,1)
		setflag(Owner,547133,0)
end


function teacatodo_121473_getgift()--給予獎勵
	local Owner=OwnerID()
	local Target=TargetID()
	local BuffID = 623637
	local Bufflv =  FN_CountBuffLevel(Owner,BuffID)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , Bufflv) 
	local Lv = ReadRoleValue( Owner , EM_RoleValue_Lv )
	local Score = ReadRoleValue( Owner , EM_RoleValue_Register1)
	local SubLv = ReadRoleValue( Owner, EM_RoleValue_LV_SUB )
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC07]")
	if Score==-1 or checkflag(Owner,547133)==true then
		GiveBodyItem(  Owner, 724059 , 1 )	
		SetSpeakDetail( Owner , "[SC_2012_TEACATODO_NPC08]")--安慰獎
	elseif Score<=19 then
		GiveBodyItem(Owner,206266,1)--給獎勵1
	elseif Score<=39 then
		GiveBodyItem(Owner,206266,2)--給獎勵2
	else 
		GiveBodyItem(Owner,206266,3)--給獎勵4
	end

	setflag(Owner,547131,1)
	CancelBuff( Owner , 623635 )
	CancelBuff( Owner , 623637 )	
	Lua_Festival_11_All(Owner)
	DesignLog( Owner , 1214731 , "Lv = "..Lv.." SubLv = "..SubLv )--回傳活動參與值

end
--====================================技能劇情===========================================================

function Teacat_egg_Skill1()--技能1→鶴鴕叫
	local Player = OwnerID()
	local Npc = TargetID()
	local BuffID = 623677
	local BuffID2 = 623679
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
	local BuffLv2 =  FN_CountBuffLevel(Player,BuffID2)
	local R = Rand(9)
	if CheckBuff(player, 623677) == false and CheckBuff(player, 623679) == false then
		if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
	end

	if BuffLv >=1 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
			Cancelbuff( Player , BuffID)
			AddBuff(Player ,BuffID,BuffLv-1,-1)
		end

	elseif BuffLv == 0 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			Cancelbuff( Player , BuffID)
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end	
		end
	end


	if BuffLv2 >=1 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end
			Cancelbuff( Player , BuffID2)
			AddBuff(Player ,BuffID2,BuffLv2-1,-1)
		end

	elseif BuffLv2 == 0 then
		if CheckBuff(Player, 623673) == true then
			say(Player,"[SC_2012_TEACATODO_BDSAY04]")
		else
			Cancelbuff( Player , BuffID2)
			Cancelbuff_NoEvent( Player ,  623688)
			if R>=5 then
				say(Player,"[SC_2012_TEACATODO_BDSAY01]")
			else
				say(Player,"[SC_2012_TEACATODO_BDSAY02]")
			end	
		end
	end
end

function Teacat_egg_Skill2()--技能2→跳躍
	local Player = OwnerID()
	local Npc = TargetID()
	local BuffID = 623673
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
	
	if BuffLv >=1 then	
		Cancelbuff( Player , BuffID)
		AddBuff(Player ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Player , BuffID)	
	end
end

--====================================蛋的劇情===========================================================

function Teacat_egg_Hideitem()--場面上的稻草人(中控器)誕生後，場面會出現n顆初始鶴鴕蛋
	GlobalTempTable = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29}--全域變數(鶴鴕蛋的重生抽屜欄)
	local player = OwnerID()
	local egg
	for i=1,15 do
		local R = Rand(#GlobalTempTable)+1
		egg = CreateObjByFlag(121486 , 781202,GlobalTempTable[R] , 1 )  --產生蛋在R的位置
		WriteRoleValue(egg ,EM_RoleValue_PID,GlobalTempTable[R]);         --將蛋寫入table裡
		SetModeEx(egg    ,EM_SetModeType_Show , true )                                --顯示
		SetModeEx( egg    , EM_SetModeType_Strikback, false ) 	    --反擊
		SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false)  --被搜尋
		SetModeEx( egg    , EM_SetModeType_Obstruct, true )	 	    --阻擋
		SetModeEx( egg    , EM_SetModeType_Mark, true )		    --標記
		SetModeEx( egg   , EM_SetModeType_Move, false )		    --移動
		SetModeEx( egg  , EM_SetModeType_Searchenemy, false )	    --索敵
		SetModeEx( egg   , EM_SetModeType_HideName, false )	    --名稱
		SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )	    --頭像框
		SetModeEx( egg , EM_SetModeType_Fight , false )		    --可砍殺攻擊
		SetModeEx( egg   , EM_SetModeType_Gravity, true )		    --重力	
		AddToPartition(egg ,0)						    --將隱藏的蛋顯示出來
		SetPlot( egg ,"touch","Teacat_egg_click",20 )			    --碰觸劇情
		table.remove(GlobalTempTable,R);				    --將被碰觸的蛋從目前位置移除
	end
end

function Teacat_egg_click()--碰觸劇情，當蛋被點擊時...
	local player = OwnerID()
	local localegg = TargetID()
	Lua_Hao_Check_SetPlot_Touch( Player )


	if CheckBuff( player , 623627) == true then--當玩家有活動Buff...
		Lua_FE_Reset(player)
		if BeginCastBarEvent(player, localegg, "[SC_2012_TEACATODO_GET]", 10, ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_END, 0, "Teacat_egg_click2" )~=1 then
		end
	else
		ScriptMessage( player ,player,2,"[SC_2012_TEACATODO_EGG]",C_SYSTEM ) --字串--這是一顆新鮮的鶴鴕蛋
	end
end

function Teacat_egg_click2(ObjID, CheckStatus)--碰觸劇情，當蛋被點擊時...
	local player = OwnerID()
	local localegg = TargetID()
	local NM = ReadRoleValue(localegg ,EM_RoleValue_PID);
	local RR = Rand(#GlobalTempTable)+1
	if( CheckStatus > 0 ) then
		if Checkbuff(Player,  623627) == true then
			if checkbuff( Player, 623635) == false then
				ScriptMessage(Player,Player,3,"[SC_2012_TEACATODO_WARNING]",0) 
				DelObj(localegg)	                   --讓被點擊的蛋消失
				AddBuff ( player, 623633, 0, -1 )     --丟蛋的技能
				AddBuff ( player, 623635, 0, -1 )     --獲得鶴鴕蛋分數
				local egg = CreateObjByFlag(121486,781202,GlobalTempTable[RR] , 1 )    --產生物件在rr的位置
				WriteRoleValue(egg,EM_RoleValue_PID,GlobalTempTable[RR])		  --將蛋寫入table裡
				SetModeEx(egg    ,EM_SetModeType_Show , true ) 			  --顯示
				SetModeEx( egg    , EM_SetModeType_Strikback, false )			  --反擊
				SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false )	  --被搜尋
				SetModeEx( egg    , EM_SetModeType_Obstruct, true )			  --阻擋
				SetModeEx( egg    , EM_SetModeType_Mark, true )			  --標記
				SetModeEx( egg   , EM_SetModeType_Move, false )			  --移動
				SetModeEx( egg  , EM_SetModeType_Searchenemy, false )		  --索敵
				SetModeEx( egg   , EM_SetModeType_HideName, false )		  --名稱
				SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )		  --頭像框
				SetModeEx( egg , EM_SetModeType_Fight , false )			  --可砍殺攻擊
				SetModeEx( egg   , EM_SetModeType_Gravity, true )			  --重力
				AddToPartition(egg , 0 )						  --將隱藏的蛋顯示出來
				Hide( egg )
				CallPlot( egg , "Teacat_egg_click3" , egg , 100 )
				table.remove(GlobalTempTable,RR);					  --將被碰觸的蛋從目前位置移除
				table.insert(GlobalTempTable,NM);					  --將被碰觸的蛋移至新的table
				EndCastBar( player, CheckStatus );
			else
				DelObj(localegg)	                   --讓被點擊的蛋消失
				AddBuff ( player, 623633, 0, -1 )     --丟蛋的技能
				AddBuff ( player, 623635, 0, -1 )     --獲得鶴鴕蛋分數
				local egg = CreateObjByFlag(121486,781202,GlobalTempTable[RR] , 1 )    --產生物件在rr的位置
				WriteRoleValue(egg,EM_RoleValue_PID,GlobalTempTable[RR])		  --將蛋寫入table裡
				SetModeEx(egg    ,EM_SetModeType_Show , true ) 			  --顯示
				SetModeEx( egg    , EM_SetModeType_Strikback, false )			  --反擊
				SetModeEx( egg    , EM_SetModeType_SearchenemyIgnore, false )	  --被搜尋
				SetModeEx( egg    , EM_SetModeType_Obstruct, true )			  --阻擋
				SetModeEx( egg    , EM_SetModeType_Mark, true )			  --標記
				SetModeEx( egg   , EM_SetModeType_Move, false )			  --移動
				SetModeEx( egg  , EM_SetModeType_Searchenemy, false )		  --索敵
				SetModeEx( egg   , EM_SetModeType_HideName, false )		  --名稱
				SetModeEx( egg , EM_SetModeType_ShowRoleHead, false )		  --頭像框
				SetModeEx( egg , EM_SetModeType_Fight , false )			  --可砍殺攻擊
				SetModeEx( egg   , EM_SetModeType_Gravity, true )			  --重力
				AddToPartition(egg , 0 )						  --將隱藏的蛋顯示出來
				Hide( egg )
				CallPlot( egg , "Teacat_egg_click3" , egg , 100 )
				table.remove(GlobalTempTable,RR);					  --將被碰觸的蛋從目前位置移除
				table.insert(GlobalTempTable,NM);					  --將被碰觸的蛋移至新的table
				EndCastBar( player, CheckStatus );
			end
		else
			EndCastBar( player, CheckStatus );
		end
		
	else
		EndCastBar( player, CheckStatus );
--	--	say(Player,"get egg is error")	
	end
end	

function Teacat_egg_click3( egg , Sec )

	Sleep(Sec)
	Show (egg, 0)
	SetPlot( egg ,"touch","Teacat_egg_click", 20 )				  --反覆進入碰撞劇情
end

function Teacat_egg_rangeskill()--蛋會進行掃描的技能，掃到npc會把npc拉過去
	local Egg = OwnerID()
	local Player = TargetID()
	local BuffID = 623635
	local BuffLv =  FN_CountBuffLevel(Player,BuffID)
--	say(Player,"aa")
	--say(Npc,"11")
	if BuffLv >=1 then
		Cancelbuff( Player , BuffID)
		AddBuff(Player ,BuffID,BuffLv-1,-1)
	elseif BuffLv == 0 then
		Cancelbuff( Player , BuffID)
	end

	while true do
	Sleep(10)	
--	say(Egg,"1")
--	say(Npc,"a")
		CastSpell( Egg, Egg , 850441)
	end
end

function Teacat_egg_rangeskill2()--掃到npc會把npc拉過去
	local Egg = OwnerID()
	local Npc = TargetID()--判定為玩家
	local CheckNpc = { 121472, 121474 }
	
	local Num = ReadRoleValue( Npc , EM_RoleValue_OrgID )	-- 121472
	--say(Egg,"1")
--	say(Npc,"a")

	for i = 1 , #(CheckNpc) , 1 do	
		if Num == CheckNpc[i] then
			local Egg_X = ReadRoleValue( Egg , EM_RoleValue_X )
			local Egg_Y = ReadRoleValue( Egg , EM_RoleValue_Y )
			local Egg_Z = ReadRoleValue( Egg , EM_RoleValue_Z )
			local Range
			for i = 1 , 10 , 1 do
				Range = Math.random( Rand(-41)-10 , Rand(41)+10 )
				Egg_X = Egg_X+Range
				Egg_Z = Egg_Z+Range
				Egg_Y = GetHeight( Egg_X , Egg_Y , Egg_Z )
			--	if CheckLine( Npc , Egg_X , Egg_Y , Egg_Z ) == true then
					MoveDirect( Npc , Egg_X , Egg_Y , Egg_Z )
					WriteRoleValue( Npc ,EM_RoleValue_IsWalk , 0  )
					break
			--	end
			end
		end
	end
end






--====================================巡邏人的劇情=========================================================
function Teacat_egg_FramNPC()----農場主人會不斷掃描場上有活動Buff的玩家
	local Npc = OwnerID()
	local Player = TargetID()
	local BuffID1 = 623677
	local BuffLv1
	while true do
	Sleep(10)

		CastSpell( Npc, Npc , 850440)--執行掃描技能1劇情
	--	SysCastSpellLv( Npc, Npc , 850442, 0)--執行掃描技能2劇情
	--	SysCastSpellLv( Npc, Npc , 850453 , 0)--執行掃描技能3劇情
	end
end

function Teacat_egg_FramNPCskill()----農場主人的技能，只要玩家有活動buff被他看到會丟Debuff(懷疑中)
	local Npc = OwnerID()
	local Player = TargetID()
	local BuffID1 = 623677
	local BuffLv1
	if CheckBuff(player , 623635) == true then--如果有撿蛋...
		BuffLv1 = Lua_Hao_Return_Buff_Lv( Player  , BuffID1 )
		if checkbuff(player, 623679) ==false then
			if CheckBuff(player , BuffID1)== false then
				say(Npc, "[SC_2012_TEACATODO_FRAMNPC02]" )
		    		AddBuff ( player,623677, 0, -1 ) --會丟DeBuff給玩家
			--	addBuff ( Player, 623700, 0, 1 )
			else

				AddBuff ( player,623677, 0, -1 ) --會丟DeBuff給玩家
				if BuffLv1>4 then	
					if checkbuff(player, 623679) ==false then
						say(Npc,"[SC_2012_TEACATODO_FRAMNPC01]")
					end
						AddBuff ( player, 623679, 9, -1 )
						AddBuff ( player, 623688, 0, -1 )
						CancelBuff(player , 623676 )
						CancelBuff(player , 623677 )
						CancelBuff(player , 623700 )
				end
			--	addBuff ( Player, 623700, 0, 1 )
			end
		end
	end
end

--function Teacat_egg_FramNPCskill2()--農場主人的技能2，只要玩家有Debuff(懷疑中)5層，被他看到會丟Debuff(警戒心)
--	local Npc = OwnerID()
--	local Player = TargetID()
--	local BuffID1 = 623677
--	local BuffLv1
--	if CheckBuff(player , BuffID1)==true then
--		BuffLv1 = Lua_Hao_Return_Buff_Lv( Player  , BuffID1 )
--		if BuffLv1>4 then	
--			if checkbuff(player, 623679) ==false then
--				say(Npc,"[SC_2012_TEACATODO_FRAMNPC01]")
--				AddBuff ( player, 623679, 9, -1 )
--				AddBuff ( player, 623688, 0, -1 )
--				CancelBuff(player , 623676 )
--				CancelBuff(player , 623677 )
--				CancelBuff(player , 623700 )
--				
--			end
--		end
--	end
--end

function Teacat_egg_timesup()--警戒時間到
	local Player = OwnerID()
	CancelBuff(Player, 623679)
	CancelBuff(Player, 623673)
	CancelBuff(Player, 623676)
	if CheckBuff(Player, 623627)==true then
		CancelBuff(Player, 623627)
		ScriptMessage(Player,Player,1,"[SC_2012_TEACATODO_WARNING2]",0)
	end
	BeginPlot(Player,"Teacat_egg_BuffValue",0)
end	




---------------------------------------------------------------------------農場女主人的技能
function Teacat_egg_FramNPC2()----農場女主人會不斷掃描場上有活動Buff的玩家
	local Npc = OwnerID()
	while true do
	Sleep(15)
		local R = Rand(9)
		if R >= 2 then	
			CastSpell( Npc, Npc , 850443)--執行掃描技能劇情
			
		else
			CastSpell( Npc, Npc , 850448)--執行掃描技能劇情2
		end
		CastSpell( Npc, Npc , 850453)--執行掃描技能3劇情	
	end
end

function Teacat_egg_FramNPC2skill()----農場女主人的技能，只要玩家有活動buff被他看到會丟Debuff(觀察中)
	local Npc = OwnerID()
	local Player = TargetID()
	if CheckBuff(player , 623635) == true then--如果有撿蛋...
--		if CheckBuff(Player, 623679)==false then
			if CheckBuff(player , 623673)==false then
				say(Npc,"[SC_2012_TEACATODO_FRAMNPC03]")
	    			AddBuff ( player,623673, 0, -1 ) --會丟DeBuff給玩家
			--	addBuff ( Player, 623700, 0, 1 )
			else
				AddBuff ( player,623673, 0, -1 ) --會丟DeBuff給玩家
			--	addBuff ( Player, 623700, 0, 1 )	
			end	
	--	end
	end
end


function Teacat_egg_FramNPC2skill2()
	local Npc = OwnerID()
	local Player = TargetID()
	if CheckBuff(player , 623635) == true then--如果有撿蛋...
		if CheckBuff(Player, 623679) ==false then
			if CheckBuff(player , 623676)==false then
				say(Npc,"[SC_2012_TEACATODO_FRAMNPC04]")
				AddBuff ( player,623676, 0, 3 ) --會丟DeBuff給玩家
			else
	    			AddBuff ( player,623676, 0, 3 ) --會丟DeBuff給玩家
			end
		end
	end
end

----====================================活動範圍的劇情=======================================================
function teacatodo_121473_Range()--活動範圍
	local NPC = OwnerID()--npc
	local NW = SearchRangeNPC(Npc , 700)
	local Players = { }
	for i =0, table.getn(NW) do 
	local OrgID = ReadRoleValue(NW[i], EM_RoleValue_OrgID)
		if OrgID==121473 then 
			WriteRoleValue(Npc, EM_RoleValue_Register3, NW[i])
			WriteRoleValue(NW[i], EM_RoleValue_Register3, Npc)
			break
		end
	end

	while true do
		sleep(10)
		local GTplayer = SearchRangePlayer(Npc, 500)
		local brother = ReadRoleValue(Npc, EM_RoleValue_Register3)
		local tic=0 
		for n = 0, table.getn(GTplayer) do
			if CheckBuff(GTplayer[n], 623627)==true then--如果玩家有活動Buff,則把玩家放入玩家列表
				tic=tic+1--偵測場上玩家數量
				if CheckFlag(GTplayer[n],547139) ==false then--檢查是否有重要物品
					setflag(GTplayer[n],547139,1)--給重要物品
					table.insert(Players, GTplayer[n])--丟入新table
				end
			end
		end
		if table.getn(Players)>0 then
			local NewTable= {}
			for i= 1, table.getn(Players) do --掃描玩家與NPC之間的距離,超出範圍會警告
			local distance = GetDistance( NPC, Players[i] )
		--	say(Npc,"444")
				if CheckBuff( Players[i] , 623627) == true and CheckFlag( Players[i] , 547131 ) == false then
					if distance > 330  then
						ScriptMessage(Players[i],Players[i],1,"[SC_2012_TEACATODO_WARNING4]",0)
						CancelBuff( Players[i] , 623627 )--玩家被取消資格	
						CancelBuff( Players[i] , 623635 )--鶴鴕蛋被取消
						CancelBuff( Players[i] , 623673 )--觀察中
						CancelBuff( Players[i] , 623677 )--懷疑中
						CancelBuff( Players[i] , 623679 )--警戒心
						setflag(Players[i],547139,0)
						setflag(Players[i],547132,1)
					else
						table.insert(NewTable, Players[i])
						if distance >= 260 and distance < 330 then--玩家與NPC距離375碼,警告玩家
						ScriptMessage(Players[i],Players[i],1,"[SC_2012_TEACATODO_WARNING3]",0)--警告玩家趕快回去否則會取消資格	
						end
					end
				end
		
			end
			Players = NewTable
		end	
		if tic <=3 then
			WriteRoleValue(brother,EM_RoleValue_Register2, 0)
		else
			WriteRoleValue(brother,EM_RoleValue_Register2, 1)
		end
	end
end	

--====================================測試用指令=======================================================
function teacatodo_replay()--重玩一次
	local Owner=OwnerID()
	CancelBuff( Owner , 623627 )--喬裝
	CancelBuff( Owner , 623673 )--觀察中
	CancelBuff( Owner , 623677 )--懷疑中
	CancelBuff( Owner , 623678 )--窺視中
	CancelBuff( Owner , 623679 )--警戒心
	CancelBuff( Owner , 623635 )--健康的鶴鴕蛋(活動中)
	CancelBuff( Owner , 623637 )--健康的鶴鴕蛋(結算時)
	setflag(Owner,547130,0)--活動結束
	setflag(Owner,547131,0)--領取獎勵
	setflag(Owner,547132,0)--淘汰記號
	setflag(Owner,547133,0)--離線旗標
	setflag(Owner,547139,0)--資格證
end

function teacatodo_buff0()--沒分數
	local Owner = OwnerID()
	CancelBuff( Owner , 623484 )
	setflag(Owner,547130,1)
	setflag(Owner,547139,1)
end

function teacatodo_buff(LV)
	local Owner = OwnerID()
	setflag(Owner,547130,1)
	setflag(Owner,547139,1)
	addbuff(Owner,623637,LV,180)
end

--====================================小孩劇情====================================
function teacatodo_121536_speak()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC01]") --叔叔說會給我糖果吃的...，啊，不好意思
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT01]" ,  "teacatodo_121536_speak2",0 )--請問可以說得更詳細一點嗎？
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121536_speak3",0 ) --不好意思，我沒興趣
end

function teacatodo_121536_speak2()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC02]")--詳細的情形我也不是很清楚..
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT04]" ,  "teacatodo_121536_start",0 )--我懂了，那就把我送過去吧
	AddSpeakOption( Owner , Owner ,"[SC_2012_TEACATODO_OPT02]" ,  "teacatodo_121536_speak3",0 )--不好意思，我沒興趣
end

function teacatodo_121536_start()
	local Owner = OwnerID()
	local Target = TargetID()
	CloseSpeak( Owner)
	SetPos(Owner, -11.3, 67.1, -38.0, 0 )
end

function teacatodo_121536_speak3()
	local Owner = OwnerID()
	local Target = TargetID()
	SetSpeakDetail( Owner , "[SC_2012_TEACATODO_OPC03]")
end