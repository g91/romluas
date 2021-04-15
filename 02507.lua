function ic_22_npc_buff()								
	AddBuff(OwnerID(),507111,0 ,-1 )
end
function ic_22_npc()								
	local own = OwnerID()
	local tar = TargetID()
	LoadQuestOption(own)
		if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545753 ) ==false then
			AddSpeakOption(own,tar,"[SC_424516_00]","ic_22_npc_1",0)
		else
			LoadQuestOption(own)
		end
end
function ic_22_npc_1()	  							
	local own = OwnerID()
	local tar = TargetID()
	GiveBodyItem( OwnerID(), 545753, 1 )
	SetSpeakDetail( own, "[SC_424776_BOOK_6]" )
end
function ic_zone22_BOSS1KO_ok()---完成給旗標 正常任務用
GiveBodyItem( TargetID(), 545766, 1 )
end 
-----------------------------------魔法羽毛
function ic_zone22_uuu_1()--魔法羽毛
SetPlot(OwnerID(),"touch","ic_zone22_uuu_2",10)
end
function ic_zone22_uuu_2()---第1任務旗標  每日旗標 有沒有物品
local player = OwnerID() 	-- 玩家
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545764 ) ==false  then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 148, 150, 0, "ic_zone22_uuu_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end
end
function ic_zone22_uuu_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( OwnerID(), 240753, 1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_uuu()----使用物品取得任務用
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 424777 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424777, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_uuu_ok()---完成給旗標 正常任務用
GiveBodyItem( TargetID(), 545764, 1 )
end
-----------------------------------火焰花
function ic_zone22_flower_ok()---完成給旗標 正常任務用
GiveBodyItem( TargetID(), 545755, 1 )
end 
function ic_zone22_flower_xx()---完成刪除其標 正常任務用
SetScriptFlag( TargetID(), 545755, 0 )
end 
function ic_zone22_flower_ok_day()---完成給旗標 公眾任務用
GiveBodyItem( TargetID(), 545755, 1 )
Lua_ZonePE_3th_GetScore(100)
end 
function ic_zone22_flower_xx_day()---完成刪除其標 公眾任務用
SetScriptFlag( TargetID(), 545755, 0 )
Lua_ZonePE_3th_GetScore(250)
end
---CheckQuest(任務號碼)   =0(還沒接任務) =1(接了任務) =2(完成任務)

-----------------------------------永恆法陣
function ic_zone22_book()----使用物品取得任務用
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 424776 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424776, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_book_ok()---完成給旗標
GiveBodyItem( TargetID(), 545754, 1 )
end 
function ic_zone22_book_1_1()--反抗手冊
SetPlot(OwnerID(),"touch","ic_zone22_book_1_2",15)
end
function ic_zone22_book_1_2()---第1任務旗標  每日旗標 有沒有物品
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--初始化石碑介面
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_1]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end		
end	

function ic_zone22_book_2_1()--實驗紀錄
SetPlot(OwnerID(),"touch","ic_zone22_book_2_2",15)
end
function ic_zone22_book_2_2()---第1任務旗標  每日旗標 有沒有物品
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--初始化石碑介面
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_2]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

function ic_zone22_book_3_1()--謎樣書本
SetPlot(OwnerID(),"touch","ic_zone22_book_3_2",15)
end
function ic_zone22_book_3_2()---第1任務旗標  每日旗標 有沒有物品
local player = OwnerID() 	-- 玩家
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545754 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
		ClearBorder( OwnerID())			--初始化石碑介面
		AddBorderPage( OwnerID(), "[SC_424776_BOOK_3]" )
		ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end
	if CheckScriptFlag( OwnerID(), 545758 ) ==true and CheckScriptFlag( OwnerID(), 545754 ) ==false then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_USEOBJ_01]", 30, 131, 133, 0, "ic_zone22_book_3_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end
end
function ic_zone22_book_3_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( OwnerID(), 240652, 1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_book_4_1()--手札
SetPlot(OwnerID(),"touch","ic_zone22_book_4_2",15)
end
function ic_zone22_book_4_2()---第1任務旗標  每日旗標 有沒有物品
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--初始化石碑介面
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_4]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

function ic_zone22_book_5_1()--魔法獸記事本
SetPlot(OwnerID(),"touch","ic_zone22_book_5_2",15)
end
function ic_zone22_book_5_2()---第1任務旗標  每日旗標 有沒有物品
	if CheckScriptFlag( OwnerID(), 545758 ) ==true then
		local Str = "["..GetUseItemGUID(OwnerID()).."]"		
			ClearBorder( OwnerID())			--初始化石碑介面
			AddBorderPage( OwnerID(), "[SC_424776_BOOK_5]" )
			ShowBorder( OwnerID(),0, str,"ScriptBorder_Texture_Paper" )
	end	
end

-----------------------------------冰火結晶 545758=第1任務有接過  545757=第1次解完 545756=接到每日
function ic_zone22_ooo()----使用物品取得任務用
local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 424775 , 1 ) )
	if ReadRoleValue(OwnerID(),EM_ROLEVALUE_LV)>= 71 then
		ShowBorder( OwnerID(),424775, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(),OwnerID(),1,"[SC_LV_NOT_ENOUGH]",0)
	end
end
function ic_zone22_ooo_1()--火
SetPlot(OwnerID(),"touch","ic_zone22_ooo_1_1",10)
end
function ic_zone22_001_ok()---完成給旗標
GiveBodyItem( TargetID(), 545757, 1 )
end
function ic_zone22_ooo_1_1()---
local player = OwnerID() 	-- 玩家
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 545756 ) ==true or
	   CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 546251 ) ==true then			
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_1_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end
	if CheckScriptFlag( player, 545758 ) ==true and 
	   CheckScriptFlag( player, 545757 ) ==false then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_1_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end	
end	
function ic_zone22_ooo_1_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240335, 1 )
			AddBuff(player,621091,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end		
function ic_zone22_ooo_1_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240755, 1 )
			AddBuff(player,621091,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end		
function ic_zone22_ooo_2()--冰
SetPlot(OwnerID(),"touch","ic_zone22_ooo_2_1",10)
end
function ic_zone22_ooo_2_1()
local player = OwnerID() 	-- 玩家
local npc = TargetID()  	-- NPC
DW_CancelTypeBuff(68,player)
	if CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 545756 ) ==true or
	   CheckScriptFlag( player, 545758 ) ==true and 			
	   CheckScriptFlag( player, 545757 ) ==true and 			
	   CheckScriptFlag( player, 546251 ) ==true then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_2_3" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end
	if CheckScriptFlag( player, 545758 ) ==true and 
	   CheckScriptFlag( player, 545757 ) ==false  then
			WriteRoleValue(npc,EM_RoleValue_Register9,9)
		if 	BeginCastBarEvent( player, npc,"[SC_GERMANY2_CONCERTO_05]", 30, 131, 133, 0, "ic_zone22_ooo_2_2" ) ~= 1 then
				ScriptMessage( player, player, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( player, player, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	end	
end
function ic_zone22_ooo_2_2(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240336, 1 )
			AddBuff(player,621092,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	
function ic_zone22_ooo_2_3(ObjID, CheckStatus)
	local player = OwnerID() 	-- 玩家
	local NPC = TargetID()  	-- NPC
		Sleep(10)
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			GiveBodyItem( player, 240756, 1 )
			AddBuff(player,621092,0 ,-1 )
			WriteRoleValue(NPC,EM_RoleValue_Register9,0)
			EndCastBar( player, CheckStatus )
		else
			EndCastBar( player, CheckStatus )
		end

	end
end	