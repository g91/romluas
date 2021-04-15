--AddRoleValue( OwnerID() , EM_RoleValue_MedalCount , 10000 )  技能點數

function Lua_na_me_ramadan_npc()
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離

	if CheckBuff ( OwnerID() , 509694 ) ==false then  --首次與NPC對話，清除紅棗的計數
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , 0 )
		AddBuff( OwnerID(), 509694 , 0, -1)
		local U =ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 )
	--	Say( OwnerID(), U )
	end

	SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_MAIN]")  --[SC_RAMADAN2011_MAIN]。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_01]", "Lua_na_ramadan2011_01",0 ) --我想用2點新手指導點數兌換
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_02]", "Lua_na_ramadan2011_02",0 ) --我想用[203650]兌換獎品[208801]
--	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_03]", "Lua_na_ramadan2011_03",0 ) --我想繳交身上累積的[203650]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_08]", "Lua_na_ramadan2011_04",0 ) --查詢已交出的[203650]總量

end


function Lua_na_ramadan2011_01() --用指導點數兌換種子
	local X = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount )  --撿查玩家身上的指導點數
	
	if X >= 2 then
		GiveBodyItem( OwnerID() , 209380 , 1 ) --給種子
		WriteRoleValue( OwnerID() , EM_RoleValue_MedalCount , X-2 )
		local Z = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount ) --再次宣告數值，確定寫入
	--	say( OwnerID() , "before is "..X.." , now is "..Z )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_04]" ) --你沒有足夠的指導點數可供兌換。
	end
end


function Lua_na_ramadan2011_02() --兌換獎勵，當玩家繳交時，累計月棗數量
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_REWARD]")  --你想要兌換什麼呢？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD1]", "Lua_na_me_ramadan_rw1",0 ) --用10顆[203650]兌換[209381]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD5]", "Lua_na_me_ramadan_rw2",0 ) --用20顆[203650]兌換50個[203038]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD2]", "Lua_na_me_ramadan_rw3",0 ) --用60顆[203650]兌換傳統服飾
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD3]", "Lua_na_me_ramadan_rw4",0 ) --用100顆[203650]兌換[208801]
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD4]", "Lua_na_me_ramadan_rw5",0 ) --用500顆[203650]兌換稱號[530650]
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_09]" )	--你的身上目前沒有任何新鮮的月棗
	end	
end


function Lua_na_me_ramadan_rw1() --10顆新鮮的月棗兌換fusion stone1
	local X= ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 10 then
		local random = rand (3)+1
		local stone = { 209381 , 209382 , 209383 }
		GiveBodyItem ( OwnerID(), stone[random] , 1 ) --隨機給予屬性熔解石
		DelBodyItem( OwnerID() , 203650 , 10 )
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+10 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --你沒有足夠的[203650] 新鮮的月棗
	end
end


function Lua_na_me_ramadan_rw2() --20顆新鮮的月棗兌換50個必爾汀代幣
	local X= ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 20 then
		local random = rand (3)+1
		GiveBodyItem ( OwnerID(), 203038 , 50 ) --隨機給予屬性熔解石
		DelBodyItem( OwnerID() , 203650 , 20 )
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+20 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --你沒有足夠的[203650] 新鮮的月棗
	end
end



function Lua_na_me_ramadan_rw3()
	SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_REWARD6]")  --你想要兌換什麼呢？
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD7]", "Lua_na_me_ramadan_rw31",0 ) --我想兌換傳統頭巾
	AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_REWARD8]", "Lua_na_me_ramadan_rw32",0 ) --我想兌換傳統服裝
	AddSpeakOption( OwnerID(), TargetID(), "[SO_BACK]", "Lua_na_ramadan2011_02",0 ) --回到上一頁		
end


function Lua_na_me_ramadan_rw31() --60顆新鮮的月棗兌換帽子
	local X= ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	local SEX =ReadRoleValue( OwnerID() , EM_RoleValue_SEX )

	if dates >= 60 then  --給帽子
		if SEX == 0 then
			GiveBodyItem( OwnerID(), 229701 , 1)

		else 
			GiveBodyItem( OwnerID(), 229705 , 1)		
		end
		DelBodyItem( OwnerID(), 203650 , 60)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！			
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+60 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --你沒有足夠的[203650] 新鮮的月棗
	end
end



function Lua_na_me_ramadan_rw32() --60顆新鮮的月棗兌換衣服
	local X= ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	local SEX =ReadRoleValue( OwnerID() , EM_RoleValue_SEX )

	if dates >= 60 then  --給帽子
		if SEX == 0 then
			GiveBodyItem( OwnerID(), 229702 , 1)

		else 
			GiveBodyItem( OwnerID(), 229706 , 1)		
		end
		DelBodyItem( OwnerID(), 203650 , 60)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！			
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+60 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --你沒有足夠的[203650] 新鮮的月棗
	end
end


function Lua_na_me_ramadan_rw4() --100顆新鮮的月棗兌換坐騎
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 100 then
		GiveBodyItem( OwnerID(), 208801 , 1 )  --給予15天駱駝坐騎 x 1
		DelBodyItem( OwnerID(), 203650 , 100)
		ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+100 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_05]" ) --你沒有足夠的[203650] 新鮮的月棗
	end
end



function Lua_na_me_ramadan_rw5() --500顆新鮮的月棗兌換稱號
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	if CountBodyItem ( OwnerID() ,  530650 ) < 1 then --若玩家尚未取得此稱號 
		local dates = CountBodyItem( OwnerID(), 203650)
		if dates >= 500 then
			GiveBodyItem( OwnerID(), 530650 , 1 ) --給予稱號
			DelBodyItem( OwnerID(), 203650 , 500)
			ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_12]", 0 ) --希望你會喜歡這個禮物！
			WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , X+500 )
			CloseSpeak(OwnerID())
		else
			ScriptMessage( OwnerID(), OwnerID() , 0 , "[SC_RAMADAN2011_05]", 0 ) --你沒有足夠的[203650] 新鮮的月棗
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_RAMADAN2011_05]", 0 ) --你沒有足夠的[203650]
			CloseSpeak(OwnerID())
		end
	else
		SetSpeakDetail( OwnerID(), "[SC_QTITLENPC_013]" ) --你已經兌換過此稱號囉。
		CloseSpeak(OwnerID())
	end
end


function Lua_na_ramadan2011_03()  --詢問是否確認要繳交月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	if dates >= 1 then
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_10][$SETVAR1="..dates.."]" ) --目前你身上擁有的月棗數量共[$VAR1]個 ，是否確定要全數繳交呢？
		AddSpeakOption( OwnerID(), TargetID(), "[SC_RAMADAN2011_11]", "Lua_na_ramadan2011_031",0 ) --我要繳交[203650]
	else
		SetSpeakDetail( OwnerID(), "[SC_RAMADAN2011_09]" )	--你的身上目前沒有任何新鮮的月棗	
	end
	AddSpeakOption( OwnerID(), TargetID(), "[SO_110150_2]" , "Lua_na_me_ramadan_npc", 0 ) --回到上一頁
end



function Lua_na_ramadan2011_031()  --繳交身上的所有月棗
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	local dates = CountBodyItem( OwnerID(), 203650)
	local Z = X+dates
	if dates >=1 then
		DelBodyItem( OwnerID(), 203650 , dates)
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem28 , Z )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_RAMADAN2011_06][$SETVAR1="..dates.."][$SETVAR2="..Z.."]" , C_SYSTEM )  --你已繳交[203650][$VAR1]個，目前你累積的總數為[$VAR2]
		CloseSpeak ( OwnerID())
	else
		ScriptMessage ( OwnerID() , OwnerID(), 1 , "[SC_RAMADAN2011_09]", 0) --你的身上目前沒有任何新鮮的月棗
		ScriptMessage ( OwnerID() , OwnerID(), 0 , "[SC_RAMADAN2011_09]", 0) --你的身上目前沒有任何新鮮的月棗
		CloseSpeak(OwnerID())		
	end
end



function Lua_na_ramadan2011_04()  --查詢已繳交的數量
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 ) --檢查玩家身上已經繳交的月棗
	CloseSpeak ( OwnerID())
	ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_RAMADAN2011_07][$SETVAR1=".. X .."]"  , C_SYSTEM)  --現在你累計的月棗數量共[$VAR1]個 
	ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_RAMADAN2011_07][$SETVAR1=".. X .."]"  , C_SYSTEM)
end



------------------------------------------------------------------------------------------------------------------------------------------------
--測試指令

function Lua_na_ramadan_check0() --檢查玩家身上的月棗數量
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "Before = "..X )
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28 , 0 )
	local Z = ReadRoleValue( OwnerID(),  EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "After = "..Z )
end


function Lua_na_ramadan_check1() --檢查玩家身上的月棗數量
	local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem28)
	Say( OwnerID(), "X= "..X )
end


function Lua_na_ramadan_addpoint() --給予10點指導點數
	local X = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount )  --撿查玩家身上的指導點數
	
	WriteRoleValue( OwnerID() , EM_RoleValue_MedalCount , X+10 )
	local Z = ReadRoleValue( OwnerID(),  EM_RoleValue_MedalCount ) --再次宣告數值，確定寫入
	say( OwnerID() , "before is "..X.." , now is "..Z )

end



---------------------------------------------------------------------------------------------------------
--新鮮的月棗果實
function LuaI_203650_check()
	if CheckBuff( OwnerID(), 509695 )== true or CheckBuff( OwnerID() , 509707 ) == true then
		ScriptMessage ( OwnerID() , OwnerID(), 0, "[SC_RAMADAN2011_ITEM]"  , C_SYSTEM)  --目前擁有此物品效果，無法再次使用。
		return FALSE
	else
		DelBodyItem( OwnerID(), 203650 , 1 )
		return true
	end
end


function LuaI_203650_use()
	CastSpell( OwnerID(), OwnerID(), 497141 )
end