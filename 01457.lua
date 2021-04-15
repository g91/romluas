--測試用指令

function LuaN_mika_09summerlove_test01() --清稱號
	Say(OwnerID(), " test message : delete title !" )
	DelBodyItem( OwnerID() , 530001 , 1 ) --刪稱號
	DelBodyItem( OwnerID() , 530002 , 1 ) --刪稱號
end

function LuaN_mika_09summerlove_test02() --清旗標
	Say(OwnerID(), " test message : delete flag !" )
	SetFlag( OwnerID()  , 542981 , 0 ) -- 刪 天使進行中(一般)
	SetFlag( OwnerID()  , 542982 , 0 ) -- 刪 惡魔進行中(一般)
	SetFlag( OwnerID()  , 542978 , 0 ) -- 刪 天使(完成)
	SetFlag( OwnerID()  , 542979 , 0 ) -- 刪 惡魔(完成)
	SetFlag( OwnerID()  , 542983 , 0 ) -- 刪 天使進行中(商城)
	SetFlag( OwnerID()  , 542984 , 0 ) -- 刪 惡魔進行中(商城)
	SetFlag( OwnerID()  , 542980 , 0 ) -- 刪 可兌換童話禮盒
	SetFlag( OwnerID()  , 542985 , 0 ) -- 刪 今天領過童話禮盒
	SetFlag( OwnerID()  , 542973 , 0 ) -- 刪 可兌換童話禮盒
	SetFlag( OwnerID()  , 542974 , 0 ) -- 刪 今天領過童話禮盒
	SetFlag( OwnerID()  , 542987 , 0 ) -- 刪 今天與小天使交易過
	SetFlag( OwnerID()  , 542989 , 0 ) -- 刪 今天與小惡魔交易過
	SetFlag( OwnerID()  , 542993 , 0 ) -- 刪 已換過熱戀之心
	SetFlag( OwnerID()  , 542994 , 0 ) -- 刪 已換過忌妒之心
	SetFlag( OwnerID()  , 542995 , 0 ) -- 刪 已換過小天使寵物
	SetFlag( OwnerID()  , 542996 , 0 ) -- 刪 已換過小惡魔寵物
end


function LuaN_mika_09summerlove_test03() --取消buff狀態
	Say(OwnerID(), " test message : All buff reset !" )
	CancelBuff( OwnerID(), 504156 ) -- 取消愛戀使者
	Sleep(10) 
	CancelBuff( OwnerID(), 504160 ) -- 取消惡作劇使者
	Sleep(10) 
	CancelBuff( OwnerID(), 504180 ) -- 取消愛戀使者(商城)
	Sleep(10) 
	CancelBuff( OwnerID(), 504181 ) -- 取消惡作劇使者(商城)
	Sleep(10) 
	CancelBuff( OwnerID(), 504161 ) -- 取消 心碎buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504162 ) -- 取消 紅心buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504223 ) -- 取消 心碎buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504335 ) -- 取消 紅心buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504157 ) -- 取消 青蛙buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504158 ) -- 取消 青蛙buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504222 ) -- 取消 心碎buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504337 ) -- 取消 紅心buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504338 ) -- 取消 心碎buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504339 ) -- 取消 紅心buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504220 ) -- 取消 青蛙buff
	Sleep(10) 
	CancelBuff( OwnerID(), 504221 ) -- 取消 青蛙buff
	Sleep(10) 
	Say(OwnerID(), " test message : All reset ok ! " )
end

function LuaN_mika_09summerlove_test04()  -- 給愛心buff 
	Say(OwnerID(), " test message : Give heart !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --玩家的性別
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --施法對象的性別
	if BorG_Target == 0 then --對象是男的
		AddBuff( TargetID(), 504335, 1, 900 ) -- 
	elseif BorG_Target == 1 then --對象是女的
		AddBuff( TargetID(), 504162, 1, 900 ) -- 
	end
end

function LuaN_mika_09summerlove_test05()  -- 給心碎buff
	Say(OwnerID(), " test message : To be heartbroken !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --玩家的性別
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --施法對象的性別
	if BorG_Target == 0 then --對象是男的
		AddBuff( TargetID(), 504223, 1, 900 ) -- 
	elseif BorG_Target == 1 then --對象是女的
		AddBuff( TargetID(), 504161, 1, 900 ) --
	end
end

function LuaN_mika_09summerlove_test06()  -- 給青蛙buff
	Say(OwnerID(), " test message : Be a frog !" )
	local BorG_Player = ReadRoleValue( OwnerID() , EM_RoleValue_SEX  )   --玩家的性別
	local BorG_Target = ReadRoleValue( TargetID() , EM_RoleValue_SEX  )  --施法對象的性別

	if BorG_Target == 0 then --對象是男的
		AddBuff( TargetID(), 504158, 1, 900 ) -- 給綠蛙buff
	elseif BorG_Target == 1 then --對象是女的
		AddBuff( TargetID(), 504157, 1, 900 ) -- 給紅蛙buff
	end
end

function lua_mika_summerlove_test07() 
	AddBuff( OwnerID(),  504156, 0, 30) -- 天使 一般
	SetFlag( OwnerID()  , 542981 , 1 ) -- 天使進行中(一般)
end

function lua_mika_summerlove_test08() 
	AddBuff( OwnerID(),  504160, 0, 30) -- 惡魔 一般
	SetFlag( OwnerID()  , 542982 , 1 ) --  惡魔進行中(一般)
end

function lua_mika_summerlove_test09() 
	AddBuff( OwnerID(),  504180, 0, 30) -- 天使 mall
	SetFlag( OwnerID()  , 542983 , 1 ) -- 天使進行中(商城)
end

function lua_mika_summerlove_test10() 
	AddBuff( OwnerID(),  504181, 0, 30) -- 惡魔 mall
	SetFlag( OwnerID()  , 542984 , 1 ) -- 惡魔進行中(商城)
end




