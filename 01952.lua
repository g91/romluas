function LuaS_Tahadi_event_na()

	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- 面向
--	BeginPlot( TargetID() , "LuaS_NPC_Ranger_na" , 0 )  --檢查NPC與玩家的距離

	if CheckBuff ( OwnerID() , 509693 ) ==false then  --首次與NPC對話，清除紅棗的計數
		WriteRoleValue( OwnerID(), EM_LuaValueFlag_UseItem9 , 0 )
		AddBuff( OwnerID(), 509693 , 0, -1)
		local U =ReadRoleValue( OwnerID(), EM_LuaValueFlag_UseItem9 )
	--	Say( OwnerID(), U )
	end
	
	SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_MAIN]")  --為了協助等級未滿30級的年輕冒險者，我們烘培了一些美味的馬哈茂德...。
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_01]", "LuaS_RamadanDate_menu_na",0 )--關於紅棗的蒐集
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_02]", "LuaS_Tahadi_package_na",0 ) --關於快速升級禮包

end



function LuaS_RamadanDate_menu_na()

	SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_03]")   -- 紅棗活動說明文  [SC_Tahadi_event_03]
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_04]","LuaS_check_RamadanDate_na",0 ) --查詢已貢獻的紅棗數量 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_TAHADI_EVENT_05]", "LuaS_receive_RamadanDate_na",0 ) --繳交紅棗 
	AddSpeakOption( OwnerID(), TargetID(), "[SC_BUFFNPC_12]", "LuaS_Tahadi_event_na",0 ) --回到上一頁

	
end



function LuaS_check_RamadanDate_na()
	local dateamount = ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9 )
	--Say( OwnerID(), dateamount )
	CloseSpeak ( OwnerID())
	ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_06][$SETVAR1=".. dateamount.."]"  , C_SYSTEM)  --現在你累計的紅棗數量共[$VAR1]個  [SC_Tahadi_event_06]

end



function LuaS_receive_RamadanDate_na()
	local X =CountBodyItem( OwnerID(), 207945) --檢查玩家身上的紅棗數量

	--Say( OwnerID(), X )
	if X >= 1 then
		local Y =ReadRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9 )	
		local Z = X + Y
	--Say( OwnerID(), Y )
		WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9, Z )  
		DelBodyItem( OwnerID(), 207945, X )
	--Say( OwnerID(), Z )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_07][$SETVAR1="..X.."][$SETVAR2="..Z.."]" , C_SYSTEM )  --你已繳交紅棗[$VAR1]個，目前你累積的紅棗總數為[$VAR2]
		CloseSpeak ( OwnerID())
	elseif X ==0 then	
		SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_08]") --你的身上目前沒有任何紅棗	
	end

end



function LuaS_Tahadi_package_na()
	local LV = ReadRoleValue( OwnerID(), EM_RoleValue_LV )
	
	if LV <=30 then
		if CheckFlag( OwnerID() ,542189) == true then
			SetSpeakDetail( OwnerID(), "[SC_BUFFNPC_27]") -- 你今天已經領取過了，明天再來吧。
		else 
			GiveBodyItem( OwnerID(), 207947, 1 ) --給予禮包
			SetFlag( OwnerID(), 542189, 1) 
			SetSpeakDetail( OwnerID(),  "[SC_TAHADI_EVENT_09]")  --希望這份禮物能對你有所幫助。
		end

	else 
		SetSpeakDetail( OwnerID(), "[SC_TAHADI_EVENT_10]")  --你已經超過可領取禮包的等級	
	
	end
end		



Function LuaI_207947() --升級輔助包

	local RoleName = GetName( OwnerID() ) 
 
	local itemset = { 100 , ""	, { 207946,1 , 203489 ,5 }		 }

	return BaseTressureProc(   itemset , 2  )
end



function LuaS_Datetest_na()    --測試專用指令

	WriteRoleValue( OwnerID() , EM_LuaValueFlag_UseItem9, 0 )  
	Say( OwnerID(), "clear")

end



	
function LuaI_Tahadi_lvcheck()
	local LV = ReadRoleValue( OwnerID(), EM_RoleValue_LV )
	if LV <=30 then
		return TRUE		
	else 
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_TAHADI_EVENT_11]"  , C_SYSTEM)
		return false
	
	end
end		
	