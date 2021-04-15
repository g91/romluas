--暖冬樹的產生劇情
function Lua_xmastree_na_begin()--物件產生劇情
		BeginPlot( OwnerID(), "Lua_xmastree_na_decrease", 0) --每1分鐘PID值遞減
end


function Lua_xmastree_na_decrease()	--暖冬樹裝飾物遞減
	while true do
		sleep(600)  --每一分鐘PID -1 
		BeginPlot( OwnerID(), "Lua_xmastree_na_decrease2", 0 )
	end
end


function Lua_xmastree_na_decrease2()	--暖冬樹裝飾物遞減
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
--	Say( OwnerID(), "A="..Y) - 原本的PID值
	if Y > 1500 then
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , 1500 )
	elseif Y<=1500 and Y> 0 then
		WriteRoleValue ( OwnerID(), EM_RoleValue_PID , Y-1 )
	elseif Y<=0 then
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , 0 )
	end
	local NEW= ReadRoleValue( OwnerID() , EM_RoleValue_PID )  --再次宣告pid值，確定寫入NPC
--	Say( OwnerID(), "NOW="..NEW) 遞減後的PID值
	BeginPlot(OwnerID(), "Lua_xmastree_na_motion", 0)
	sleep( 30 )
end


function Lua_xmastree_na_motion() --整點置換暖冬樹外型
	local Y = ReadRoleValue( OwnerID(), EM_RoleValue_PID ) 
--	say( OwnerID(), "before="..Y)
	if Y < 50 then
		ChangeObjID( OwnerID(), 116657  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --將原本樹體的PID值寫入新的暖冬樹上
	elseif Y >= 50 and Y <500  then
		ChangeObjID( OwnerID(), 116658  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --將原本樹體的PID值寫入新的暖冬樹上
	elseif Y >= 500 and Y < 1000 then
		ChangeObjID( OwnerID(), 117033  )	
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --將原本樹體的PID值寫入新的暖冬樹上
	elseif Y >=1000 then
		ChangeObjID( OwnerID(), 117034  )
		WriteRoleValue( OwnerID(), EM_RoleValue_PID , Y ) --將原本樹體的PID值寫入新的暖冬樹上
	end
	local NEW = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
--	say(OwnerID(), "after="..NEW)
end


--暖冬樹對話劇情
function LuaS_xmastree_na_menu()
	SetSpeakDetail( OwnerID(), "[SC_XMASTREE_MAIN]")   -- 裝飾暖冬樹說明文 （必爾汀商會特別設置的巨大暖冬樹，邀請所有人共同歡慶暖冬節。）
	AddSpeakOption( OwnerID(), TargetID(), "[SC_XMASTREE_04]"," Lua_xmastree_na_decorate",0 ) -- 我要裝飾暖冬樹
	AddSpeakOption( OwnerID(), TargetID(), "[SC_XMASTREE_05]", "Lua_xmastree_na_gift",0 ) --領取暖冬樹的禮物
end	


function Lua_xmastree_na_decorate()
	-- OwnerID = 玩家
	--TargetID = 暖冬樹
	CloseSpeak( OwnerID())
	local A = Countbodyitem( OwnerID(), 208471)
	local B = Countbodyitem( OwnerID(), 208574)
	local C = Countbodyitem( OwnerID(), 208575)
	if A>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208471, A )	--刪除玩家身上的物品
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 10*A+Y )	 --加上物品的數量
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 10*A+X) --玩家身上寫入USE ITEM值
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --再次宣告pid值，確定寫入NPC
--		Say( OwnerID(), "1="..NEW)
	end
	if B>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208574, B )	--刪除玩家身上的物品
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 30*B+Y )	 --加上物品的數量
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 30*B+X) --玩家身上寫入USE ITEM值
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --再次宣告pid值，確定寫入NPC
--		Say( OwnerID(), "2="..NEW)
	end
	if C>=1 then
		local Y = ReadRoleValue( TargetID() , EM_RoleValue_PID ) 
		local X = ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23)
		DelBodyItem( OwnerID(), 208575, C )	--刪除玩家身上的物品
		WriteRoleValue ( TargetID(), EM_RoleValue_PID , 50*C+Y )	 --加上物品的數量
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 50*C+X) --玩家身上寫入USE ITEM值
		local NEW= ReadRoleValue( TargetID() , EM_RoleValue_PID ) --再次宣告pid值，確定寫入NPC
--		Say( OwnerID(), "3="..NEW)
	end
	if A <1 and B<1 and C<1 then
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASTREE_02]" , C_SYSTEM )  --你身上沒有暖冬樹的裝飾品 
--		Say( OwnerID(), "NO!" )	
		return false
	else
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_XMASTREE_01]" , C_SYSTEM )  --你已經將裝飾品掛在樹上了。 
		BeginPlot( TargetID(), "Lua_buffreward_na",0)
		BeginPlot( OwnerID(), "Lua_checkbuff_na",0)
	end
	BeginPlot( OwnerID(),"Lua_xmastreetitle_na",0)
	BeginPlot( TargetID(), "Lua_xmastree_na_motion", 0 )
end


function Lua_xmastreetitle_na() --裝飾暖冬樹頭銜判斷
	local Y = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem23) 
	if Y >= 500 and Y < 1000 then
		GiveBodyItem( OwnerID(), 530661, 1 )
	elseif Y >= 1000 then
		GiveBodyItem( OwnerID(), 530662, 1 )
	end
end


function Lua_checkbuff_na() --作為活動結束後清除玩家USEITEM值用
	local S= CheckBuff( OwnerID(), 508271) 
	if S ~= TRUE then
	 AddBuff( OwnerID(), 508271, 1, 1209600) --為期2週 ,時間1為1秒
	end
end


function Lua_buffreward_na() --完成任務暖冬樹給玩家的BUFF
	CancelBuff(TargetID(), 508118)
	CancelBuff(TargetID(), 508119)
	CancelBuff(TargetID(), 508125)
	CancelBuff(TargetID(), 508126)
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_PID ) 
	if Y <50 then
		AddBuff (TargetID(), 508118, 1 , 1800)
	elseif Y>=50 and Y < 500 then
		AddBuff (TargetID(), 508119, 1 , 1800)
	elseif Y>=500 and Y < 1000 then
		AddBuff (TargetID(), 508125, 1 , 1800)
	elseif Y>=1000  then
		AddBuff (TargetID(), 508126, 1 , 1800)
	end
end


function Lua_xmastree_na_gift() --檢查玩家
	-- Owner = 玩家
	if CheckBuff ( OwnerID(),508271) ==true then
		if CheckFlag( OwnerID(), 544421) == true then
		SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") -- 你今天已經領取過了，明天再來吧。
		else
		local Y = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem23) 
			if Y < 100 then
				GiveBodyItem( OwnerID(), 720293, 1 ) 
			elseif Y >= 100 and Y < 300 then
				GiveBodyItem( OwnerID(), 720293, 1 )
				GiveBodyItem( OwnerID(), 725522, 1 )
			elseif Y >= 300 then
				GiveBodyItem( OwnerID(), 720293, 1 )
				GiveBodyItem( OwnerID(), 725520, 1 )
				GiveBodyItem( OwnerID(), 725522, 1 ) 
			end
			SetFlag( OwnerID(), 544421, 1) 
			SetSpeakDetail( OwnerID(),  "[SC_XMASTREE_03]")  --（從暖冬樹上取得一個禮物！）
		end
	else
			SetSpeakDetail( OwnerID(),  "[SC_XMASTREE_06]")  --（你必須要先參與過裝飾暖冬樹的活動，才能夠領取禮物！）
	end
end



--清除暖冬節樹USEITEM值
function Lua_Clear_XMAS_USEITEM_na()  --掛在暖冬樹活動隱藏BUFF，BUFF消失時清除USEITEM值
	WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23, 0)
end


--============測試指令================
--檢查暖冬樹目前的PID值
function Lua_CheckPID_na()
	local T1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116657, 500 , 0)       --暖冬樹1
	local T2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116658, 500 , 0)       --暖冬樹2
	local T3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117033, 500 , 0)       --暖冬樹3
	local T4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117034, 500 , 0)       --暖冬樹4
	local Y1 = ReadRoleValue( T1 , EM_RoleValue_PID ) 
	local Y2 = ReadRoleValue( T2 , EM_RoleValue_PID ) 
	local Y3 = ReadRoleValue( T3 , EM_RoleValue_PID ) 
	local Y4 = ReadRoleValue( T4 , EM_RoleValue_PID ) 
	Say( OwnerID(), "A="..Y1.." or B="..Y2.." or C="..Y3.." or D="..Y4)
end


function Lua_ClearPID_na()
	local T1 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116657, 500 , 0)       --暖冬樹1
	local T2 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 116658, 500 , 0)       --暖冬樹2
	local T3 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117033, 500 , 0)       --暖冬樹3
	local T4 = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117034, 500 , 0)       --暖冬樹4

	WriteRoleValue( T1, EM_RoleValue_PID, 0)
	WriteRoleValue( T2, EM_RoleValue_PID, 0)
	WriteRoleValue( T3, EM_RoleValue_PID, 0)
	WriteRoleValue( T4, EM_RoleValue_PID, 0)
	Say( OwnerID(), "Clear!")
end

function Lua_CheckUSE23_na()
	Say( OwnerID(), ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem23) )
end


function Lua_Delbuff_na() --刪除判斷裝飾物的BUFF
	local S= CheckBuff( OwnerID(), 508271) 
	if S == TRUE then
	 CancelBuff( OwnerID(), 508271) 
	end
end
