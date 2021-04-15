--EM_RoleValue_Register  buff順序、題目
--EM_RoleValue_Register+1~7  題目拆解順序
--EM_RoleValue_Register+8  NPCID



function lua_suki_Germany_2year_en1_01()
	--Owner是玩家
	--Target是npc
	AdjustFaceDir( TargetID(), OwnerID() , 0 ) -- 面向
	if CheckBuff(OwnerID(), 507851) == FALSE then  --非變身青蛙的狀態
		if CheckFlag(OwnerID(), 544937) ==true and CheckFlag(OwnerID(), 544938) ==false then  --檢查當日是否已經完成過活動
			SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS04") ) --明天再來
		else
			SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS01") ) 
		end

		if CheckFlag(OwnerID(), 544938) == TRUE then --領獎券
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS05]", "lua_suki_Germany_2year_en1_good", 0)--領獎

		elseif CheckFlag(OwnerID(), 544937) == FALSE then 
			AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS02]", "lua_suki_Germany_2year_en1_rule", 0)--有什麼新發現嗎?
		end
	else
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS17") ) --時間有限
	end
end 


function lua_suki_Germany_2year_en1_rule() --規則說明
--	if CheckFlag(OwnerID(), 544937) == FALSE then -- 每日參加旗標
		SetSpeakDetail(OwnerID(), "[SC_GERMANY2_VARIATIONS07]") --你可曾透過不同生物的視角看世界呢？...
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS03]", "lua_suki_Germany_2year_en1_give", 0)--路線
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]", "lua_suki_Germany_2year_en1_01", 0)--返回上一頁
--	elseif CheckFlag(OwnerID(), 544938) == TRUE then --領獎券
--		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS05]", "lua_suki_Germany_2year_en1_good", 0)--領獎
--	end
end

function lua_suki_Germany_2year_en1_good() --檢查身上BUFF數量
	local Count = FN_CountBuffLevel (OwnerID(), 507852)
--	SAY(OwnerID(), "Count="..Count)
	if Count == 8 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS13") ) --完美
		GiveBodyItem( OwnerID(), 724059 , 1) --變身藥水*3
		GiveBodyItem( OwnerID(), 724059 , 1)
		GiveBodyItem( OwnerID(), 724059 , 1)
		GiveBodyItem( OwnerID(), 209561 , 1) --歡慶青蛙憑證
	elseif Count >=5 and Count <=7 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS15") ) --不習慣
		GiveBodyItem( OwnerID(), 724059 , 1)		
		GiveBodyItem( OwnerID(), 209561 , 1) --歡慶青蛙憑證
	elseif Count <=4 and Count>=2 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS14") ) --差一步
		GiveBodyItem( OwnerID(), 209561, 1) --歡慶青蛙憑證
	elseif Count ==1 then
		SetSpeakDetail( OwnerID(), GetString("SC_GERMANY2_VARIATIONS12") ) --再接再勵
	end
	CancelBuff(OwnerID(), 507852 ) --記次
	SetFlag(OwnerID(), 544938, 0) --領獎旗標
	CancelBuff(OwnerID(), 507846) --紅
	CancelBuff(OwnerID(), 507847) --黃
	CancelBuff(OwnerID(), 507848) --綠
	CancelBuff(OwnerID(), 507849) --藍
	CancelBuff(OwnerID(), 507850) --紫
end


------------------------------出題------------------------------------

function lua_suki_Germany_2year_en1_give()  --以buff的方式出題
	CancelBuff(OwnerID(), 507852 )
	SetFlag(OwnerID(), 544939, 0) --出題前先重置先前可能未清除的出題
	SetFlag(OwnerID(), 544938, 0) --出題前先重置先前可能未領取的獎勵
	CancelBuff(OwnerID(), 507846)  --紅
	CancelBuff(OwnerID(), 507847)  --黃
	CancelBuff(OwnerID(), 507848)  --綠
	CancelBuff(OwnerID(), 507849)  --藍
	CancelBuff(OwnerID(), 507850)	--紫 
	for i=1, 7 do  --隨機出七個題目
		WriteRoleValue(OwnerID(), EM_RoleValue_Register, 0)
		WriteRoleValue(OwnerID(), EM_RoleValue_Register+i, 0) --記錄在
	end

	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 } --r,y,g,b,p
	local Random = Rand(5)+1--
	local Count = 10
	local Answer = Random--挑選buff
	local Reg4

	for i = 1 , 7 , 1 do
		AddBuff( OwnerID() , Buff[Answer] , 0 , -1 )--5
--		Say( OwnerID() , "Random = " .. Random )
		Random = ( Rand(5)+1 )*Count + Random--記錄順序
		Answer = math.floor( Random / Count )--挑選buff
		Count = Count*10--次數
		if i == 7 then
			Reg4 = WriteRoleValue( OwnerID() , EM_RoleValue_Register , Random ) 
		end
	end

		local NPC={116850, 116851, 116852, 116853, 116854}--r,y,g,b,p（第一個是紫色~） 
		local NPC2={}
		local Count2 =10
		local Answer2 = ReadRoleValue (OwnerID(), EM_RoleValue_Register )--23154215
		local Answer3 
		for i=1, 7, 1 do
			Answer3 =  Answer2 % Count2 --2315421...5
			Answer2 = math.floor( Answer2/Count2)
			WriteRoleValue ( OwnerID(), EM_RoleValue_Register+i, Answer3 )
			NPC2[i] = NPC[Answer3]

		--	say ( OwnerID(), "A="..NPC2[i] )
		end
		SetSpeakDetail(OwnerID(), "[SC_GERMANY2_VARIATIONS06][$SETVAR1=".."["..NPC2[1].."]".."][$SETVAR2=".."["..NPC2[2].."]".."][$SETVAR3=".."["..NPC2[3].."]".."][$SETVAR4=".."["..NPC2[4].."]".."][$SETVAR5=".."["..NPC2[5].."]".."][$SETVAR6=".."["..NPC2[6].."]".."][$SETVAR7=".."["..NPC2[7].."]".."]")--題目
		AddSpeakOption(OwnerID(), TargetID(), "[SC_GERMANY2_VARIATIONS10]", "lua_suki_Germany2_en1_start", 0)--我想體驗青蛙的生活
		AddSpeakOption(OwnerID(), TargetID(), "[SO_BACK]", "lua_suki_Germany_2year_en1_01", 0)--back

end

function lua_suki_Germany2_en1_start() --將玩家變身成青蛙
--	say( TargetID(), "1")
--	say( OwnerID(), "2")
	local R = Lua_Mounts_Copilot( OwnerID() )
	if R == false then --如果玩家在後座
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_GE2_2011EV1_16]" , 0)
	else
		DW_CancelTypeBuff( 68,  OwnerID() )
		SetFlag(OwnerID(), 544937, 1)  --本日已參加活動
		AddBuff(OwnerID(), 507851, 1, -1)
		AddBuff(OwnerID(), 507852, 1, -1)
	end	
	CloseSpeak( OwnerID() )
end

---------------------------------------------------------------------------
function lua_suki_Germany2_en1_color()  --妖精的範圍劇情
	SetPlot( OwnerID() , "range" , "lua_suki_Germany2_en1_color03" , 25 )
end

function lua_suki_Germany2_en1_color03()
	--say (TargetID(), "Org="..2)--npc
	WriteRoleValue ( OwnerID(), EM_RoleValue_Register+8, TargetID() )
	if CheckBuff ( OwnerID(), 507851) == TRUE then  --是否為變身青蛙的狀態
		BeginPlot(OwnerID(), "lua_suki_Germany2_en1_color02", 0)
--	elseif CheckBuff ( OwnerID(), 507851) == FALSE then
--		ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS18]" , C_SYSTEM)--青蛙研究者 斯德烈．盧亞似乎知道這是怎麼一回事
	end
end


function lua_suki_Germany2_en1_color02()  --檢查玩家身上
	local npc8=ReadRoleValue( OwnerID(), EM_RoleValue_Register+8)
	local orgID=ReadRoleValue ( npc8, EM_RoleValue_OrgID )
	local NPC={116850, 116851, 116852, 116853, 116854}
	local Buff = { 507846 , 507847 , 507848 , 507849 , 507850 } --r,y,g,b,p
	local BuffLV=FN_CountBuffLevel ( OwnerID(), 507852) --計次BUFF
	local n=ReadRoleValue (OwnerID(), EM_RoleValue_Register+bufflv) --
	local Random = rand(20)+1

--	Say(OwnerID(), "bufflv="..bufflv)
--	Say(OwnerID(), "npc="..NPC[n])
--	say (TargetID(), "Org="..orgID)


	if bufflv ~=8 then
		if orgID == NPC[n] then--玩家通過正確的妖精
			local x=FN_CountBuffLevel(OwnerID(), buff[n] )
	--		say (OwnerID(), "x="..x)
			if x == 0 then --不要再出現了
			--	say (OwnerID(), "x="..x)
				AddBuff(OwnerID(), Buff[n], x ,-1 )
				sleep(30)
				CancelBuff(OwnerID(), Buff[n] )
			else
				x = x-1
			--	say (OwnerID(), "x="..x)
				CancelBuff(OwnerID(), Buff[n] )
				CastSpell( OwnerID(), OwnerID(), 497453)
				AddBuff(OwnerID(), Buff[n], x ,-1 ) --更換bufflv	
			end
			if BuffLV == 8 then
				ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS11]" , C_SYSTEM)--完成
				SetFlag(OwnerID(), 544938, 1) --領獎不重複
			end
			bufflv = bufflv+1
			CancelBuff(OwnerID(), 507852)		
			AddBuff (OwnerID(), 507852, bufflv, -1) --+1次		
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS20]" , C_SYSTEM) --妖精確實感應到你了。

		else	--玩家回答錯誤
			if Random <= 10 then
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS09]" , 0) --你接觸的妖精是錯誤的！
			else 
			ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS19]" , 0)--不是這隻妖精喔！
		--	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS09][$SETVAR1=".."["..NPC[n].."]".."]" , C_SYSTEM)--應該是??才對
			end
		end
	end
end
		
------------------------------
function lua_suki_Germany2_en1_timeover()
	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_VARIATIONS16]" , C_SYSTEM) --變身時效已過！去找斯德烈．盧亞報告體驗結果。
	ScriptMessage(OwnerID(), OwnerID(), 0, "[SC_GERMANY2_VARIATIONS16]" , C_SYSTEM)
	SetFlag(OwnerID(), 544938, 1) --領獎不重複
	SetFlag(OwnerID(), 544939, 1) --妖精無法再作用
end




function lua_suki_Germany2_en1_delbuff()--整個沒問題後，可以不用留，只是供測試刪BUFF用
	SetFlag(OwnerID(), 544938, 0) --領獎
	SetFlag(OwnerID(), 544939, 0) --妖精
	SetFlag(OwnerID(), 544937, 0) --刪除每日旗標
	--妖精的順序--
	CancelBuff(OwnerID(), 507846) 
	CancelBuff(OwnerID(), 507847)
	CancelBuff(OwnerID(), 507848)
	CancelBuff(OwnerID(), 507849)
	CancelBuff(OwnerID(), 507850)	
	CancelBuff(OwnerID(), 507851)	
	CancelBuff(OwnerID(), 507852)	
end