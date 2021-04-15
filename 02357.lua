function Lua_ying_music_118507talk() --NPC安亞 ‧ 路德對話

	local KeyA = CheckFlag( OwnerID() , 545145 ) --已接任務
	local KeyB = CheckFlag( OwnerID() , 545146 ) --已領獎勵
	local Lv = ReadRoleValue ( OwnerID() , EM_RoleValue_LV ) --檢查玩家等級
	local Count = CountBodyItem( OwnerID() , 209950 ) --完整的魔法樂章數量

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if Lv >= 48 then --等級48以上
		if KeyA == false and KeyB == false and Count == 0 then --未接任務、未領獎勵、身上無完整樂譜
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_01]" ) --你能幫我找回遺失的魔法音符，讓魔法樂章再次完整嗎？
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_02]" , "Lua_ying_music_118507talk2" , 0 ) --"沒問題！但是該怎麼做呢？"選項
		elseif KeyB == true then --已領獎勵
			SetSpeakDetail( OwnerID() , "[SC_THANKSGIVING_16]" ) --你今天已經完成了這個任務，請你明天再來吧。
		elseif Count >= 1 then --身上已有完整的魔法樂章
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_01]" ) --你能幫我找回遺失的魔法音符，讓魔法樂章再次完整嗎？
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_05]" , "Lua_ying_music_118507talk4" , 0 ) --"我已經將完整的魔法樂章帶回來了～"選項
		else --有keyA、但沒完整的魔法樂章
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_07]" ) --姬莉雅對於音符小精靈的習性似乎很瞭解，或許她有讓音符小精靈們開心的方法～
		end
	else --等級48以下
		SetSpeakDetail( OwnerID(), "[SC_VALENTINE_2011EV1_01]" ) -- "我很感謝你的好意，可惜你的能力似乎還沒有辦法幫上我的忙"
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk2() --"沒問題！但是該怎麼做呢？"選項

	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_03]" ) --不過，有個人你倒是可以去詢問看看，姬莉雅對於音符小精靈的習性似乎很瞭解，說不定她知道些什麼…
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_04]" , "Lua_ying_music_118507talk3" , 0 ) --"好的，我這就去，等待我的好消息吧～"選項
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk3() --"好的，我這就去，等待我的好消息吧～"選項

	SetFlag( OwnerID() , 545145 , 1 ) --給予已接任務Key
	
	local Rd = Rand(100)+1 --rand(0~99)+1 = 1~100

	if Rd >= 1 and Rd <= 20 then --1~20
		GiveBodyItem( OwnerID() , 209945 , 1 ) --給予缺少音符的魔法樂章1
	elseif Rd >20 and Rd <= 40 then --21~40
		GiveBodyItem( OwnerID() , 209946 , 1 ) --給予缺少音符的魔法樂章2
	elseif Rd >40 and Rd <= 60 then --41~60
		GiveBodyItem( OwnerID() , 209947 , 1 ) --給予缺少音符的魔法樂章3
	elseif Rd >60 and Rd <= 80 then --61~80
		GiveBodyItem( OwnerID() , 209948 , 1 ) --給予缺少音符的魔法樂章4
	else --81~100
		GiveBodyItem( OwnerID() , 209949 , 1 ) --給予缺少音符的魔法樂章5
	end
		CloseSpeak( OwnerID() )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Lost_Magic_Note(Count)	-- 2013.05.27 查詢玩家完成愛樂節活動「遺失的魔法音符」的次數

	local Player = OwnerID()
	local Complete = ReadRoleValue( Player , EM_LuaValueFlag_UseItem46 )	-- 讀取完成次數
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	
	if Count == nil then
		Count = Complete
	else
		WriteRoleValue( Player , EM_LuaValueFlag_UseItem46 , Count )
	end
	DebugMsg( Player , Room , "Completions = "..Count )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Hao_Check_Buff_Status(BuffID)	-- 2013.05.27 確認玩家是否持有指定Buff

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )

	if Count ~= nil then
		if CheckBuff( Player , BuffID ) == true then
			DebugMsg( Player , Room , "true" )
			return
		end
	end
	DebugMsg( Player , Room , "false" )
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118507talk4() --"我已經將完整的魔法樂章帶回來了～"選項

	-- 2013.05.27 修正玩家完成愛樂節活動「遺失的魔法音符」後，在符合稱號取得條件時，有機率無法取得稱號的問題。
	local Player = OwnerID()
	local Complete = ReadRoleValue( Player , EM_LuaValueFlag_UseItem46 )	-- 讀取完成次數
	WriteRoleValue( Player , EM_LuaValueFlag_UseItem46 , Complete+1 )
	--
	SetFlag( OwnerID() , 545145 , 0 ) --刪除已接任務key
	SetFlag( OwnerID() , 545146 , 1 ) --給予已領獎勵Key
	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_06]" ) --為了表示我的感謝，這些音符跟樂譜就送給你，祝福你有個愉快的愛樂節～
	GiveBodyItem( OwnerID() , 204428 , 4 ) --給予音符*4
	GiveBodyItem( OwnerID() , 204457 , 4 ) --給予樂譜*4
	DelBodyItem( OwnerID() , 209950 , 1 ) --刪除完整的魔法樂章

--	AddBuff( OwnerID() , 509892 , 0 , 604800 ) --給予7天, 任務完成次數BUFF
--	local BuffLV = FN_CountBuffLevel( OwnerID() , 509892 ) --檢查玩家身上BUFFLV
	local CHK1 = CountBodyItem( OwnerID() , 530731 ) --檢查是否有稱號
	local CHK2 = CountBodyItem( OwnerID() , 530732 ) --檢查是否有稱號
--	if BuffLV == 2 then --遊戲內BuffLV3
	DebugMsg( Player , 0 , "Completions = "..Complete+1 )
	if Complete+1 == 3 then
		if CHK1 < 1 then --無稱號
			GiveBodyItem( OwnerID() , 530731 , 1 ) --給予稱號"魔法音符搜捕手"
		end
--	elseif BuffLV == 6 then --遊戲內BuffLV7
	elseif Complete+1 == 7 then
		if CHK2 < 1 then --無稱號
			GiveBodyItem( OwnerID() , 530732 , 1 ) --給予稱號"我不是音痴！"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_delitem() --刪除樂章時觸發

	SetFlag( OwnerID() , 545145 , 0 ) --刪除已接任務key
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209945Use() --掛在209945物品上的script，石碑介面
	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_18]" ) --樂譜01內容
	ShowBorder( OwnerID() , 0 , "[209945]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209946Use() --掛在209946物品上的script，石碑介面
	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_19]" ) --樂譜02內容
	ShowBorder( OwnerID() , 0 , "[209946]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209947Use() --掛在209947物品上的script，石碑介面
	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_20]" ) --樂譜03內容
	ShowBorder( OwnerID() , 0 , "[209947]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209948Use() --掛在209948物品上的script，石碑介面
	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_21]" ) --樂譜04內容
	ShowBorder( OwnerID() , 0 , "[209948]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_209949Use() --掛在209949物品上的script，石碑介面
	ClearBorder( OwnerID() ) --初始化石碑介面，開頭一定要執行
	AddBorderPage( OwnerID(), "[SC_MUSIC_2011_22]" ) --樂譜05內容
	ShowBorder( OwnerID() , 0 , "[209949]", "ScriptBorder_Texture_Paper" ) --設定石碑介面
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk() --NPC姬莉雅．格林對話

	local Key = CheckFlag( OwnerID() , 545145 )

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) --NPC面向玩家
	if Key == true then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_08]" ) --每到愛樂節期間，總有很多人來向我詢問關於音符小精靈的事…XXX，你也是來問我關於音符小精靈的事情嗎？
		AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_09]" , "Lua_ying_music_118515talk00" , 0 ) --"是的。"選項
	else
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk00() --"是的。"選項

	SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_10]" ) --如果你能收集到5個稀有的羽毛，我就讓你挑選1個音符小精靈喜愛的物品。
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209953]]" , "Lua_ying_music_118515talk03" , 0 ) --"請給我潤喉糖"選項209953
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209951]]" , "Lua_ying_music_118515talk01" , 0 ) --"請給我夜明珍珠"選項209951
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209955]]" , "Lua_ying_music_118515talk05" , 0 ) --"請給我凝晶露水"選項209955
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209954]]" , "Lua_ying_music_118515talk04" , 0 ) --"請給我粉色康乃馨"選項209954
	AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_11][$SETVAR1=[209952]]" , "Lua_ying_music_118515talk02" , 0 ) --"請給我神秘海螺"選項209952
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk03() --"請給我潤喉糖"選項209953

	local Count = CountBodyItem( OwnerID() , 209956 ) --檢查玩家身上稀有的羽毛

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --你身上稀有的羽毛還不足以兌換小精靈喜愛的物品哦～趕緊去收集吧！
	else
		GiveBodyItem( OwnerID() , 209953 , 1 ) --給予潤喉糖1個
		DelBodyItem( OwnerID() , 209956 , 5 ) --扣除稀有的羽毛5個
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk01() --"請給我夜明珍珠"選項209951

	local Count = CountBodyItem( OwnerID() , 209956 ) --檢查玩家身上稀有的羽毛

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --你身上稀有的羽毛還不足以兌換小精靈喜愛的物品哦～趕緊去收集吧！
	else
		GiveBodyItem( OwnerID() , 209951 , 1 ) --給予夜明珍珠1個
		DelBodyItem( OwnerID() , 209956 , 5 ) --扣除稀有的羽毛5個
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk05() --"請給我凝晶露水"選項209955

	local Count = CountBodyItem( OwnerID() , 209956 ) --檢查玩家身上稀有的羽毛

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --你身上稀有的羽毛還不足以兌換小精靈喜愛的物品哦～趕緊去收集吧！
	else
		GiveBodyItem( OwnerID() , 209955 , 1 ) --給予凝晶露水1個
		DelBodyItem( OwnerID() , 209956 , 5 ) --扣除稀有的羽毛5個
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk04() --"請給我粉色康乃馨"選項209954

	local Count = CountBodyItem( OwnerID() , 209956 ) --檢查玩家身上稀有的羽毛

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --你身上稀有的羽毛還不足以兌換小精靈喜愛的物品哦～趕緊去收集吧！
	else
		GiveBodyItem( OwnerID() , 209954 , 1 ) --給予粉色康乃馨1個
		DelBodyItem( OwnerID() , 209956 , 5 ) --扣除稀有的羽毛5個
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118515talk02() --"請給我神秘海螺"選項209952

	local Count = CountBodyItem( OwnerID() , 209956 ) --檢查玩家身上稀有的羽毛

	if Count < 5 then
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_16]" ) --你身上稀有的羽毛還不足以兌換小精靈喜愛的物品哦～趕緊去收集吧！
	else
		GiveBodyItem( OwnerID() , 209952 , 1 ) --給予神秘海螺1個
		DelBodyItem( OwnerID() , 209956 , 5 ) --扣除稀有的羽毛5個
		CloseSpeak( OwnerID() ) --關閉對話視窗
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118510() --音符小精靈DO對話

	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key
	local Count = CountBodyItem( OwnerID() , 209951 ) --檢查完家身上夜明珍珠

	if Key == true then --有接任務
		if Count >= 1 then -- 夜明珠1個以上
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209951]]" ) --XXX，你手上的夜明珍珠我好喜歡，可以送給我嗎？我能替你做一件事，不管什麼事都行～
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118510talk" , 0 ) --"好啊～你能幫我將遺失的音符補上嗎？"選項
		else --沒有夜明珠
			LoadQuestOption( OwnerID() ) --讀取模板
		end
	else --沒接任務
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118510talk() --"好啊～你能幫我將遺失的音符補上嗎？"選項

	local Count1 = CountBodyItem( OwnerID() , 209951 ) --檢查完家身上夜明珍珠
	local Count = CountBodyItem( OwnerID() , 209945 ) --缺少音符的魔法樂章1
	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key

	if Count1 >= 1 then -- 夜明珍珠1個以上
		if Key == true then --身上有任務key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209951]]" ) --謝謝你給的夜明珍珠，我真的很喜歡～
				DelBodyItem( OwnerID() , 209945 , 1 ) --刪除缺少音符的魔法樂章1
				DelBodyItem( OwnerID() , 209951 , 1 ) --刪除夜明珍珠
				GiveBodyItem( OwnerID() , 209950 , 1 ) --給予完整的魔法樂章
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
			else --不是缺少音符的魔法樂章1
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --（小精靈試著寫上音符，但是怎麼樣就是寫不上…）
				DelBodyItem( OwnerID() , 209951 , 1 ) --刪除夜明珍珠
			end
		else --身上沒有任務key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --你身上的魔法樂章呢？怎麼不見了？！
		end
	else --沒有夜明珍珠
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209951]]" ) --咦～你不是說要把夜明珍珠給我嗎？怎麼不見了？！
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118511() --音符小精靈RE對話

	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key
	local Count = CountBodyItem( OwnerID() , 209952 ) --檢查完家身上神秘海螺

	if Key == true then --有接任務
		if Count >= 1 then -- 神祕海螺1個以上
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209952]]" ) --XXX，你手上的神祕海螺我好喜歡，可以送給我嗎？我能替你做一件事，不管什麼事都行～
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118511talk" , 0 ) --"好啊～你能幫我將遺失的音符補上嗎？"選項
		else --沒有神祕海螺
			LoadQuestOption( OwnerID() ) --讀取模板
		end
	else --沒接任務
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118511talk() --"好啊～你能幫我將遺失的音符補上嗎？"選項

	local Count = CountBodyItem( OwnerID() , 209946 ) --缺少音符的魔法樂章2
	local Count1 = CountBodyItem( OwnerID() , 209952 ) --檢查完家身上神祕海螺
	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key

	if Count1 >= 1 then -- 神祕海螺1個以上
		if Key == true then --身上有任務key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209952]]" ) --謝謝你給的神祕海螺，我真的很喜歡～
				DelBodyItem( OwnerID() , 209946 , 1 ) --刪除缺少音符的魔法樂章2
				DelBodyItem( OwnerID() , 209952 , 1 ) --刪除神祕海螺
				GiveBodyItem( OwnerID() , 209950 , 1 ) --給予完整的魔法樂章
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
			else --不是缺少音符的魔法樂章2
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --（小精靈試著寫上音符，但是怎麼樣就是寫不上…）
				DelBodyItem( OwnerID() , 209952 , 1 ) --刪除神祕海螺
			end
		else --身上沒有任務key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --你身上的魔法樂章呢？怎麼不見了？！
		end
	else --沒有神祕海螺
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209952]]" ) --咦～你不是說要把神祕海螺給我嗎？怎麼不見了？！
	end	
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118512() --音符小精靈MI對話

	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key
	local Count = CountBodyItem( OwnerID() , 209953 ) --檢查完家身上潤喉糖

	if Key == true then --有接任務
		if Count >= 1 then -- 潤喉糖1個以上
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209953]]" ) --XXX，你手上的潤喉糖我好喜歡，可以送給我嗎？我能替你做一件事，不管什麼事都行～
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118512talk" , 0 ) --"好啊～你能幫我將遺失的音符補上嗎？"選項
		else --沒有潤喉糖
			LoadQuestOption( OwnerID() ) --讀取模板
		end
	else --沒接任務
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118512talk() --"好啊～你能幫我將遺失的音符補上嗎？"選項

	local Count = CountBodyItem( OwnerID() , 209947 ) --缺少音符的魔法樂章3
	local Count1 = CountBodyItem( OwnerID() , 209953 ) --檢查完家身上潤喉糖
	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key

	if Count1 >= 1 then -- 潤喉糖1個以上
		if Key == true then --身上有任務key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209953]]" ) --謝謝你給的潤喉糖，我真的很喜歡～
				DelBodyItem( OwnerID() , 209947 , 1 ) --刪除缺少音符的魔法樂章3
				DelBodyItem( OwnerID() , 209953 , 1 ) --刪除潤喉糖
				GiveBodyItem( OwnerID() , 209950 , 1 ) --給予完整的魔法樂章
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
			else --不是缺少音符的魔法樂章3
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --（小精靈試著寫上音符，但是怎麼樣就是寫不上…）
				DelBodyItem( OwnerID() , 209953 , 1 ) --刪除潤喉糖
			end
		else --身上沒有任務key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --你身上的魔法樂章呢？怎麼不見了？！
		end
	else --沒有潤喉糖
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209953]]" ) --咦～你不是說要把潤喉糖給我嗎？怎麼不見了？！
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118513() --音符小精靈FA對話

	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key
	local Count = CountBodyItem( OwnerID() , 209954 ) --檢查完家身上粉色康乃馨

	if Key == true then --有接任務
		if Count >= 1 then -- 粉色康乃馨1個以上
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209954]]" ) --XXX，你手上的粉色康乃馨我好喜歡，可以送給我嗎？我能替你做一件事，不管什麼事都行～
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118513talk" , 0 ) --"好啊～你能幫我將遺失的音符補上嗎？"選項
		else --沒有粉色康乃馨
			LoadQuestOption( OwnerID() ) --讀取模板
		end
	else --沒接任務
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118513talk() --"好啊～你能幫我將遺失的音符補上嗎？"選項

	local Count = CountBodyItem( OwnerID() , 209948 ) --缺少音符的魔法樂章4
	local Count1 = CountBodyItem( OwnerID() , 209954 ) --檢查完家身上粉色康乃馨
	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key

	if Count1 >= 1 then -- 粉色康乃馨1個以上
		if Key == true then --身上有任務key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209954]]" ) --謝謝你給的粉色康乃馨，我真的很喜歡～
				DelBodyItem( OwnerID() , 209948 , 1 ) --刪除缺少音符的魔法樂章4
				DelBodyItem( OwnerID() , 209954 , 1 ) --刪除粉色康乃馨
				GiveBodyItem( OwnerID() , 209950 , 1 ) --給予完整的魔法樂章
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
			else --不是缺少音符的魔法樂章4
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --（小精靈試著寫上音符，但是怎麼樣就是寫不上…）
				DelBodyItem( OwnerID() , 209954 , 1 ) --刪除粉色康乃馨
			end
		else --身上沒有任務key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --你身上的魔法樂章呢？怎麼不見了？！
		end
	else --沒有粉色康乃馨
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209954]]" ) --咦～你不是說要把粉色康乃馨給我嗎？怎麼不見了？！
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118514() --音符小精靈SO對話

	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key
	local Count = CountBodyItem( OwnerID() , 209955 ) --檢查完家身上凝晶露水

	if Key == true then --有接任務
		if Count >= 1 then -- 凝晶露水1個以上
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_12][$SETVAR1=[209955]]" ) --XXX，你手上的凝晶露水我好喜歡，可以送給我嗎？我能替你做一件事，不管什麼事都行～
			AddSpeakOption( OwnerID() , TargetID() , "[SC_MUSIC_2011_13]" , "Lua_ying_music_118514talk" , 0 ) --"好啊～你能幫我將遺失的音符補上嗎？"選項
		else --沒有凝晶露水
			LoadQuestOption( OwnerID() ) --讀取模板
		end
	else --沒接任務
		LoadQuestOption( OwnerID() ) --讀取模板
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_118514talk() --"好啊～你能幫我將遺失的音符補上嗎？"選項

	local Count = CountBodyItem( OwnerID() , 209949 ) --缺少音符的魔法樂章5
	local Count1 = CountBodyItem( OwnerID() , 209955 ) --檢查完家身上凝晶露水
	local Key = CheckFlag( OwnerID() , 545145 ) --已接任務key

	if Count1 >= 1 then -- 凝晶露水1個以上
		if Key == true then --身上有任務key
			if Count == 1 then
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_14][$SETVAR1=[209955]]" ) --謝謝你給的凝晶露水，我真的很喜歡～
				DelBodyItem( OwnerID() , 209949 , 1 ) --刪除缺少音符的魔法樂章5
				DelBodyItem( OwnerID() , 209955 , 1 ) --刪除凝晶露水
				GiveBodyItem( OwnerID() , 209950 , 1 ) --給予完整的魔法樂章
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_MUSIC_2011_25]" , C_SYSTEM ) --"你已成功找回遺失的魔法音符，趕緊向[118507]回報吧！"
			else --不是缺少音符的魔法樂章5
				SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_15]" ) --（小精靈試著寫上音符，但是怎麼樣就是寫不上…）
				DelBodyItem( OwnerID() , 209955 , 1 ) --刪除凝晶露水
			end
		else --身上沒有任務key
			SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_24]" ) --你身上的魔法樂章呢？怎麼不見了？！
		end
	else --沒有凝晶露水
		SetSpeakDetail( OwnerID() , "[SC_MUSIC_2011_23][$SETVAR1=[209955]]" ) --咦～你不是說要把凝晶露水給我嗎？怎麼不見了？！
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_elf() --音符精靈_物件產生劇情

	AddBuff( OwnerID() , 509891 , 1 , -1 ) --精靈+特效
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound01() --播放音效DO

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect01" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect01() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\1.mp3", false ) --DO
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound02() --播放音效RE

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect02" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect02()

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\2.mp3", false ) --RE
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound03() --播放音效MI

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect03" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect03() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\3.mp3", false ) --MI
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound04() --播放音效FA

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect04" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect04() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\4.mp3", false ) --FA
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound05() --播放音效SO

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect05" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect05() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\5.mp3", false ) --SO
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound06() --播放音效LA

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect06" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect06() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\6.mp3", false ) --LA
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_sound07() --播放音效SI

	SetPlot( OwnerID() , "collision" , "Lua_ying_music_effect07" , 0 ) --碰撞劇情
end
----------------------------------------------------------------------------------------------------------------------------------------------------------------
function Lua_ying_music_effect07() 

	PlaySoundToPlayer( OwnerID() , "sound\\sound_new\\skill\\Music_Festival\\scale\\7.mp3", false ) --SI
end
-----------------------------------------------------------------------------------------------------------------------------------------------------------------