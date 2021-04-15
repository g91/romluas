function Lua_weaveitem_check1() --梭子
	local Owner = OwnerID()  --玩家
	local Target = TargetID() --織布機
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- 讀取織布機身上的玩家編號
 	local Count = BuffCount (Player) -- 讀取玩家身上的所有法術數量

	if Checkbuff (Player, 622971) == true  then  --如果玩家身上有織布機驅動者和協助織布機的計分BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--讀取玩家身上的法術ID
			if BuffID == 623052 then
				if Ans == 1 then --如果答案是彩線
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
				--	ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
					AddBuff( Target, 622965 ,  0, 60) --延長織布機的運作
					AddBuff( Player , 623052 , 0, -1 ) --增加分數
					AddBuff( Player , 622971 , 0 , 30 ) --織布機驅動者
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )					
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
				--	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					CancelBuff( Target , 622965) --織布機停止
					CancelBuff( Target , 622966)
					CancelBuff( Player , 622971) --玩家結算分數
				end
			end
		end
	end
end



function Lua_weaveitem_check2() --彩線
	local Owner = OwnerID()  --玩家
	local Target = TargetID() --織布機
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- 讀取織布機身上的玩家編號
 	local Count = BuffCount (Player) -- 讀取玩家身上的所有法術數量

	if Checkbuff (Player, 622971) == true and CheckBuff( Player , 623052) == true then  --如果玩家身上有織布機驅動者和協助織布機的計分BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--讀取玩家身上的法術ID
			if BuffID == 623052 then
				if Ans == 2 then --如果答案是彩線
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
			--		ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
					AddBuff( Target, 622965 , 0, 60) --延長織布機的運作
					AddBuff( Player , 623052 , 0, -1 ) --增加分數
					AddBuff( Player , 622971 , 0 , 30 ) --織布機驅動者
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
			--		ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					CancelBuff( Target , 622965) --織布機停止
					CancelBuff( Target , 622966)
					CancelBuff( Player , 622971) --玩家結算分數
				end
			end
		end
	end
end



function Lua_weaveitem_check3() --剪刀
	local Owner = OwnerID()  --玩家
	local Target = TargetID() --織布機
	local Ans = ReadRoleValue( Target , EM_RoleValue_Register2)  --檢查織布機身上的答案
	local Player = ReadRoleValue( Target , EM_RoleValue_Register8) -- 讀取織布機身上的玩家編號
 	local Count = BuffCount (Player) -- 讀取玩家身上的所有法術數量

	if Checkbuff (Player, 622971) == true and CheckBuff( Player , 623052) == true then  --如果玩家身上有織布機驅動者和協助織布機的計分BUFF
		for i = 0 , Count do
			local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )	--讀取玩家身上的法術ID
			if BuffID == 623052 then
				if Ans == 3 then --如果答案是彩線
					ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
			--		ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_ANS01]" ,  C_SYSTEM) --織布機順利運行，順利織出一排漂亮的布料。
					AddBuff( Target, 622965 , 0 , 30) --延長織布機的運作
					AddBuff( Player , 623052 , 0, -1 ) --增加分數
					AddBuff( Player , 622971 , 0 , 30 ) --織布機驅動者
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
					CancelBuff( Target , 622962)
					CancelBuff( Target , 622963)
					CancelBuff( Target , 622964)
				else
					WriteRoleValue( Target , EM_RoleValue_Register1 , 3 )
					WriteRoleValue( Target , EM_RoleValue_Register2 , 0 )
				--	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_ANS02]" , 0) --輔助物品給予錯誤，布料織壞了。
					CancelBuff( Target , 622965) --織布機停止
					CancelBuff(Target , 622966)
					CancelBuff( Player , 622971) --玩家結算分數
				end
			end
		end
	end
end




--織布機的運作BUFF，消失之後觸發法術
function Lua_na_loom_end()
	local Owner = OwnerID() --織布機
	local Player = ReadRoleValue( Owner , EM_RoleValue_Register8) -- 讀取織布機身上的玩家編號
	local Room = ReadRoleValue( Owner , EM_RoleValue_RoomID )
	local ColorBuff = { 622962 , 622963, 622964 }
	ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_END]" , 0) --織布機停止運作。
	ScriptMessage( Owner , Owner , 1 , "[SC_2012LOOM_END]" , 0) --織布機停止運作。
	for i = 1 , table.getn(ColorBuff) do
		CancelBuff( Owner , ColorBuff[i])
	end
	PlayMotion( Owner, 147 )
	Lua_na_loom_Delallmark()
	Beginplot( Player, "Lua_na_weave_Score", 0 )
	CancelBuff(Owner , 622966)
	sleep(30)
	WriteRoleValue( Owner , EM_RoleValue_Register1 , 0 )
end		



function Lua_na_weave_Score() -- 結算分數，掛在玩家身上的BUFF觸發
	local Owner = OwnerID() --玩家
 	local Count = BuffCount (Owner) -- 讀取玩家身上的所有法術數量
	for i = 0 , Count do
		local BuffID = BuffInfo ( Owner , i , EM_BuffInfoType_BuffID )	--讀取玩家身上的法術ID
		if BuffID == 623052 then
			local BuffLv = BuffInfo ( Owner, i , EM_BuffInfoType_Power )
			if BuffLv == 0 then
				SetFlag( Owner , 546685 , 1 )	
			elseif BuffLv <= 3 then
				SetFlag( Owner , 546867, 1 )
			elseif BuffLv <= 10 then
				SetFlag( Owner , 546868, 1 )
			elseif BuffLv <= 15  then
				SetFlag( Owner , 546869, 1 )
			elseif BuffLv <= 19 then
				SetFlag( Owner , 546870, 1 )
			elseif BuffLv  == 20 then
				SetFlag( Owner , 546729, 1 )
			end
			ScriptMessage( Owner , Owner , 0 , "[SC_2012LOOM_SPEAK10]" , 0) --快向潔米蕊兒[121044]回報協助的成果吧！
			ScriptMessage( Owner , Owner , 2 , "[SC_2012LOOM_SPEAK10]" , 0) --
			CancelBuff( Owner , 623052)
		end
	end		
end




function Lua_na_loom_Delallmark()  --活動結束刪除所有印記
	local Count = SearchRangeNPC ( OwnerID() , 300 )
	local Obj
	local NPC = {121041 , 121042 , 121043, 121051}
	for i=0 , table.getn(Count) do
		local OrgID = ReadRoleValue ( Count[i] , EM_RoleValue_OrgID)
		for j = 1 , table.getn( NPC ) , 1 do
			if OrgID == NPC[j] then  --若為陣列中的值
			DelObj( Count[i] )
			end
		end
	end
end