--商城用法術
function LuaI_205732book( Option ) --取得愛戀之吻法術  掛在物品使用上

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() ~= OwnerID() )   then   --若對象是別人
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--此物品只能對自己使用。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--此物品只能對自己使用。
				return false
			elseif CheckBuff( TargetID() , 504156) == true or CheckBuff( TargetID() , 504180) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG10]" , C_SYSTEM )	--你已持有道具效果，無法重複使用。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG10]"  , C_SYSTEM )	--你已持有道具效果，無法重複使用。
				return false
			elseif CheckBuff( TargetID() , 504160) == true or CheckBuff( TargetID() , 504181) == true then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG13]" , C_SYSTEM )	--你持有青蛙之吻技能，無法同時持有此技能。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG13]"  , C_SYSTEM )	--你持有青蛙之吻技能，無法同時持有此技能。
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--此物品只能對自己使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--此物品只能對自己使用。
			return false
		end
	elseif ( Option == "USE" ) then	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MALL01]" , C_SYSTEM )	--你取得了技能「愛戀之吻」。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MALL01]" , C_SYSTEM )	--你取得了技能「愛戀之吻」。
		AddBuff( OwnerID(),  504180, 1, 21600) --2hr  愛戀之吻 
		SetFlag( OwnerID(), 542983 , 1 ) -- 給 天使進行中(商城)
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
	end
end

function LuaI_205733book( Option )  --取得青蛙之吻法術  掛在物品使用上

	if ( Option == "CHECK" ) then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			if ( TargetID() ~= OwnerID() )   then   --若對象是別人
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--此物品只能對自己使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--此物品只能對自己使用。
				return false
			elseif CheckBuff( TargetID() , 504160) == true or CheckBuff( TargetID() , 504181) == true then 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG10]" , C_SYSTEM )	--你已持有道具效果，無法重複使用。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG10]"  , C_SYSTEM )	--你已持有道具效果，無法重複使用。 
				return false
			elseif CheckBuff( TargetID() , 504156) == true or CheckBuff( TargetID() , 504180) == true then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG12]" , C_SYSTEM )	--你持有愛戀之吻技能，無法同時持有此技能。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG12]"  , C_SYSTEM )	--你持有愛戀之吻技能，無法同時持有此技能。
				return false
			else
				return true
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG00]" , C_SYSTEM )	--此物品只能對自己使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG00]"  , C_SYSTEM )	--此物品只能對自己使用。
			return false
		end

	elseif ( Option == "USE" ) then	
		ScriptMessage(  OwnerID() ,  OwnerID() , 1 , "[SC_0908SEANSON_MALL02]" , C_SYSTEM )	--你取得了技能「青蛙之吻」。
		ScriptMessage(  OwnerID() ,  OwnerID() , 0 , "[SC_0908SEANSON_MALL02]" , C_SYSTEM )	--你取得了技能「青蛙之吻」。
		AddBuff(  OwnerID(),  504181, 1, 21600) --2hr  青蛙之吻 
		SetFlag(  OwnerID(), 542984 , 1 ) -- 給 惡魔進行中(商城)
		WriteRoleValue(  OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
	end
end


function LuaM_mika_09summerlove_checkm() --施法檢查-愛戀.青蛙之吻
	local go_angel = CheckFlag(OwnerID()  , 542981 ) -- 進行天使中(一般)
	local go_devil = CheckFlag(OwnerID()  , 542982 ) -- 進行惡魔中(一般)

	local goon_angel = CheckFlag(OwnerID()  , 542983 ) -- 進行天使中(商城)
	local goon_devil = CheckFlag(OwnerID()  , 542984 ) -- 進行惡魔中(商城)

	if ( CheckID( TargetID() ) == false ) or ( TargetID() == OwnerID() ) then   --若沒有對象或對象是自己
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG01]" , C_SYSTEM )	--施法對象不正確，請對其他玩家使用。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG01]"  , C_SYSTEM )	--施法對象不正確，請對其他玩家使用。
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_IsPlayer ) == 1 then --施法對象是玩家
			local BuffType = 0
			local Count = BuffCount ( TargetID())
			for i = 0 , Count do
				local BuffID = BuffInfo ( TargetID() , i , EM_BuffInfoType_BuffID )
				if GameObjInfo_int ( BuffID , "AssistType" ) == 68 then
					BuffType = GameObjInfo_int ( BuffID , "AssistType" )
					break
				end
			end
			if BuffType == 68 then				       	    --/*有騎乘狀態
				ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_0908SEANSON_MAG15]" , 0 )  --使用對象有騎乘效果，無法使用。
				return false
			else
				if goon_angel == true or go_angel == true then
					if CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --有心碎buff
						return true
					elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
						return true
					elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						return false
					else
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--使用對象沒有需要解除的效果。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--使用對象沒有需要解除的效果。
						return false
					end
				elseif  goon_devil == true or go_devil == true then
					if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
						return true
					elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --有心碎buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						return false
					elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
						ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
						return false
					else
						return true
					end
				end
			end

		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG08]" , C_SYSTEM )	--施法對象不正確，請對玩家使用。
			return false
		end
	end
end


function LuaM_mika_09summerlove_mallmagic()  --基本法術執行劇情 (商城)

	local goon_angel = CheckFlag(OwnerID() , 542983 ) -- 進行天使中(商城)
	local goon_devil = CheckFlag(OwnerID() , 542984 ) -- 進行惡魔中(商城)
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --施法對象的性別
	local usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數

	if goon_angel == true then --有小天使進行旗標
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
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--你持有的施法次數已用完。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--你持有的施法次數已用完。
				CancelBuff( OwnerID(), 504180 ) -- 取消自己身上的 天使技能  
				SetFlag( OwnerID()  , 542983 , 0 ) -- 刪 天使進行中(一般)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
			if BorG_Target == 0 then --對象是男的
				CancelBuff( TargetID(), 504158 ) -- 取消對象的 青蛙buff(男)
				Sleep(10)
				CancelBuff( TargetID(), 504221 ) -- 取消對象的 青蛙buff(男)
				Sleep(10)				
				AddBuff( TargetID(), 504339, 1, 900 ) -- 給墜入愛河的王子
			elseif BorG_Target == 1 then --對象是女的
				CancelBuff( TargetID(), 504157 ) -- 取消對象的 青蛙buff (女)
				Sleep(10)
				CancelBuff( TargetID(), 504220 ) -- 取消對象的 青蛙buff (女)
				Sleep(10)
				AddBuff( TargetID(), 504337, 1, 900 ) -- 給墜入愛河的公主
			end
			Sleep(10)  
			GiveBodyItem( OwnerID(), 205725 , 1) -- 給小天使徽章X1 
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數：[$VAR1] / 5
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數：[$VAR1] / 5
			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--你持有的施法次數已用完。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--你持有的施法次數已用完。
				CancelBuff( OwnerID(), 504180 ) -- 取消自己身上的 天使技能  
				SetFlag( OwnerID(), 542983 , 0 ) -- 刪 天使進行中(一般)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--你持有的施法次數已用完。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--你持有的施法次數已用完。
		else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG11]" , C_SYSTEM )	--使用對象沒有需要解除的效果。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG11]"  , C_SYSTEM )	--使用對象沒有需要解除的效果。
		end
	elseif goon_devil == true then --有小惡魔進行旗標
		if CheckBuff( TargetID() , 504162) == true or CheckBuff( TargetID() , 504335) == true or CheckBuff( TargetID() , 504337) == true or CheckBuff( TargetID() , 504339) == true then--有愛心buff 
			if BorG_Target == 0 then --對象是男的
				CancelBuff(TargetID(), 504335 ) -- 刪紅心buff  
				Sleep(10)
				CancelBuff(TargetID(), 504339 ) -- 刪紅心buff  
				Sleep(10)
				AddBuff( TargetID(), 504338, 1, 900 ) -- 給心碎悲傷的王子
			elseif BorG_Target == 1 then --對象是女的
				CancelBuff(TargetID(), 504162 ) -- 刪紅心buff  
				Sleep(10)
				CancelBuff(TargetID(), 504337 ) -- 刪紅心buff 
				Sleep(10)
				AddBuff( TargetID(), 504222, 1, 900 ) -- 給心碎悲傷的公主
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- 給小惡魔徽章X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM ) --已使用次數:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--你持有的施法次數已用完。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--你持有的施法次數已用完。
				CancelBuff( OwnerID(), 504181 ) -- 取消自己身上的 青蛙技能  
				SetFlag( OwnerID()  , 542984 , 0 ) -- 刪 惡魔進行中(一般)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end
		elseif CheckBuff( TargetID() , 504161) == true or CheckBuff( TargetID() , 504223) == true or CheckBuff( TargetID() , 504222) == true or CheckBuff( TargetID() , 504338) == true then --有心碎buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
		elseif CheckBuff( TargetID() , 504157) == true or CheckBuff( TargetID() , 504158) == true or CheckBuff( TargetID() , 504220) == true or CheckBuff( TargetID() , 504221) == true  then--有青蛙buff
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG05]" , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG05]"  , C_SYSTEM )	--使用對象已經持有效果，無法施放法術。
		else
			if BorG_Target == 0 then --對象是男的
				AddBuff( TargetID(), 504221, 1, 900 ) -- 給綠蛙buff
			elseif BorG_Target == 1 then --對象是女的
				AddBuff( TargetID(), 504220, 1, 900 ) -- 給紅蛙buff
			end
			GiveBodyItem( OwnerID(), 205724 , 1) -- 給小惡魔徽章X1  
			AddRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 1 )  --次數+1
			usechance = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 )  --使用次數
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]" , C_SYSTEM )	--已使用次數:  [$VAR1] / 5 
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG03][$SETVAR1="..usechance.."]"  , C_SYSTEM )--已使用次數:  [$VAR1] / 5

			if usechance >= 5 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_0908SEANSON_MAG07]" , C_SYSTEM )	--你持有的施法次數已用完。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_0908SEANSON_MAG07]"  , C_SYSTEM )	--你持有的施法次數已用完。
				CancelBuff( OwnerID(), 504181 ) -- 取消自己身上的 青蛙技能  
				SetFlag( OwnerID()  , 542984 , 0 ) -- 刪 惡魔進行中(一般)
				WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem25 , 0 )  --清空次數
			end						 							
		end
	end
end