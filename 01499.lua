--npc法術



function LuaN_mika_09summerlove_joingood() --給玩家愛戀之吻
	CloseSpeak(OwnerID())  --關閉對話視窗
	if CheckFlag(OwnerID() , 542979) == true or CheckBuff(OwnerID() , 504181 ) == true or CheckFlag(OwnerID() , 542982 ) == true or CheckFlag(OwnerID() , 542982 ) == true then  --有青蛙之吻
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG13]" , C_SYSTEM )	--你持有青蛙之吻技能，無法同時持有此技能。
	elseif CheckBuff(OwnerID() , 504156 ) == true or CheckBuff(OwnerID() , 504180 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG16]" , C_SYSTEM )	--你已持有此技能，無法同時持有相同技能。
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_19]" , C_SYSTEM )	--你收到了小天使給予的法術！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_19]" , C_SYSTEM )	--你收到了小天使給予的法術！
		SetFlag( OwnerID()  , 542981 , 1 ) -- 給 天使進行中(一般)
		AddBuff( OwnerID(),  504156, 1, 21600) --6hr  童話節法術技能 
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
	end

end


function LuaN_mika_09summerlove_joinbad() --給玩家青蛙之吻
	CloseSpeak(OwnerID())  --關閉對話視窗
	if CheckBuff(OwnerID(), 504156) == true or CheckBuff(OwnerID(), 504180) == true or CheckFlag(OwnerID(), 542978 ) == true or CheckFlag(OwnerID(), 542983 ) == true then  --有愛戀之吻 或當天已過完
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG12]" , C_SYSTEM )	--你持有愛戀之吻技能，無法同時持有此技能。
	elseif CheckBuff(OwnerID() , 504160 ) == true or CheckBuff(OwnerID() , 504181 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG16]" , C_SYSTEM )	--你已持有此技能，無法同時持有相同技能。
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_20]" , C_SYSTEM )	--你收到了小惡魔給予的法術！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_20]" , C_SYSTEM )	--你收到了小惡魔給予的法術！
		SetFlag( OwnerID()  , 542982 , 1 ) -- 給 惡魔進行中(一般)
		AddBuff( OwnerID(),  504160, 1, 21600) --6hr  童話節法術技能 
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
	end
end



function LuaM_mika_09summerlove_magic()  --基本法術執行劇情

	local go_angel = CheckFlag(OwnerID()  , 542981 ) -- 進行天使中(一般)
	local go_devil = CheckFlag(OwnerID()  , 542982 ) -- 進行惡魔中(一般)
	local goon_angel = CheckFlag(OwnerID()  , 542983 ) -- 進行天使中(商城)
	local goon_devil = CheckFlag(OwnerID()  , 542984 ) -- 進行惡魔中(商城)
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --施法對象的性別
	local usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數


	if go_angel == true then --有小天使進行旗標
		if  CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --有心碎buff
			if BorG_Target == 0 then --對象是男的
				CancelBuff( TargetID(), 504223 ) -- 取消對象的 黑心buff  
				Sleep(10)
				CancelBuff( TargetID(), 504338 ) -- 取消對象的 黑心buff  
				Sleep(10)
			elseif BorG_Target == 1 then --對象是女的
				CancelBuff( TargetID(), 504161 ) -- 取消對象的 黑心buff  
				Sleep(10)
				CancelBuff( TargetID(), 504222 ) -- 取消對象的 黑心buff  
				Sleep(10)
			end
			GiveBodyItem( OwnerID(), 205725 , 1) -- 給小天使徽章X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數：[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數：[$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				CancelBuff( OwnerID(), 504156 ) -- 取消自己身上的 天使技能  
				SetFlag( OwnerID()  , 542981 , 0 ) -- 刪 天使進行中(一般)
				SetFlag( OwnerID()  , 542980 , 1 ) -- 給 取得兌換童話禮盒資格
				SetFlag( OwnerID()  , 542978 , 1 ) -- 給 當天已完成過天使
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
			if BorG_Target == 0 then --對象是男的
				CancelBuff( TargetID(), 504158 ) -- 取消對象的 青蛙buff(男)
				Sleep(10)
				CancelBuff( TargetID(), 504221 ) -- 取消對象的 青蛙buff(男)
				Sleep(10)
				AddBuff( TargetID(), 504335, 1, 900 ) -- 給墜入愛河的王子
			elseif BorG_Target == 1 then --對象是女的
				CancelBuff( TargetID(), 504157 ) -- 取消對象的 青蛙buff (女)
				Sleep(10)
				CancelBuff( TargetID(), 504220 ) -- 取消對象的 青蛙buff (女)
				Sleep(10)
				AddBuff( TargetID(), 504162, 1, 900 ) -- 給墜入愛河的公主
			end
			GiveBodyItem( OwnerID(), 205725 , 1) -- 給小天使徽章X1 
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數：[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數：[$VAR1] / 5
			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				CancelBuff( OwnerID(), 504156 ) -- 取消自己身上的 天使技能  
				SetFlag( OwnerID(), 542981 , 0 ) -- 刪 天使進行中(一般)
				SetFlag( OwnerID(), 542980 , 1 ) -- 給 取得兌換童話禮盒資格
				SetFlag( OwnerID(), 542978 , 1 ) -- 給 當天已完成過天使
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
		else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--使用對象沒有需要解除的效果。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--使用對象沒有需要解除的效果。
		end
	elseif go_devil == true then --有小惡魔進行旗標
		if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
			if BorG_Target == 0 then --對象是男的
				CancelBuff(TargetID(), 504335 ) -- 刪紅心buff  
				Sleep(10)
				CancelBuff(TargetID(), 504339 ) -- 刪紅心buff  
				Sleep(10)
				AddBuff( TargetID(), 504223, 1, 900 ) -- 給心碎悲傷的王子
			elseif BorG_Target == 1 then --對象是女的
				CancelBuff(TargetID(), 504162 ) -- 刪紅心buff  
				Sleep(10)
				CancelBuff(TargetID(), 504337 ) -- 刪紅心buff  
				Sleep(10)
				AddBuff( TargetID(), 504161, 1, 900 ) -- 給心碎悲傷的公主
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- 給小惡魔徽章X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				CancelBuff( OwnerID(), 504160 ) -- 取消自己身上的 青蛙技能  
				SetFlag( OwnerID()  , 542982 , 0 ) -- 刪 惡魔進行中(一般)
				SetFlag( OwnerID()  , 542973 , 1 ) -- 給 取得兌換童話禮盒資格
				SetFlag( OwnerID()  , 542979 , 1 ) -- 給 當天已完成過惡魔
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --有心碎buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
		else
			local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  ) 
			if BorG_Target == 0 then --對象是男的
				AddBuff( TargetID(), 504158, 1, 900 ) -- 給綠蛙buff
			elseif BorG_Target == 1 then --對象是女的
				AddBuff( TargetID(), 504157, 1, 900 ) -- 給紅蛙buff
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- 給小惡魔徽章X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG04]" , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG04]"  , C_SYSTEM )	--你持有的施法次數已用完，可進行回報領取獎勵。
				CancelBuff( OwnerID(), 504160 ) -- 取消自己身上的 青蛙技能  
				SetFlag( OwnerID()  , 542982 , 0 ) -- 刪 惡魔進行中(一般)
				SetFlag( OwnerID()  , 542973 , 1 ) -- 給 取得兌換童話禮盒資格
				SetFlag( OwnerID()  , 542979 , 1 ) -- 給 當天已完成過惡魔
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end						 							
		end
	end
end


--buff時間到時 執行刪除進行中key

function Lua_mika_summerlove_Keyitem1() --天使(一般)
	SetFlag( OwnerID()  , 542981 , 0 ) -- 刪 天使進行中(一般)
--	Say(OwnerID(), "del key - angel normal.")
end

function Lua_mika_summerlove_Keyitem2() --惡魔(一般)
	SetFlag( OwnerID()  , 542982 , 0 ) -- 刪 惡魔進行中(一般)
--	Say(OwnerID(), "del key - devil normal.")
end

function Lua_mika_summerlove_Keyitem3() --天使(商城)
	SetFlag( OwnerID()  , 542983 , 0 ) -- 刪 天使進行中(商城)
--	Say(OwnerID(), "del key - angel mall.")
end

function Lua_mika_summerlove_Keyitem4() --惡魔(商城)
	SetFlag( OwnerID()  , 542984 , 0 ) -- 刪 惡魔進行中(商城)
--	Say(OwnerID(), "del key - devil mall.")
end