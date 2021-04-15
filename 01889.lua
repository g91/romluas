function LuaI_423382_207452_Check()		--掛在物品使用下的<檢查lua>之下。
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423382 ) == false or CountBodyItem( OwnerID() , 207474 ) >= 3 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --你不需要使用此物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if OrgID == 0 or ( OrgID ~= 103987) or CheckBuff( TargetID() , 504004 ) == true then
		if OrgID == 103987 then
			if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_0]" , 0 ) --[103987]已經死亡了，無法餵食
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_0]" , 0 )
				return false
			else
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_1]" , 0 ) --你將[207452]餵食給[103987]
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_1]" , 0 )
				return false
			end
		end
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_2]" , 0 ) --只有[103987]會食用[207452]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_2]" , 0 )
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----距離太過遙遠，無法使用[205871]。
		return false
	end
	
	if 	ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423382_0]" , 0 ) --[103987]已經死亡了，無法餵食
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_0]" , 0 )
		return false
	end

	if 	ReadRoleValue( OwnerID() , EM_RoleValue_IsDead ) == 1 then
		return false
	end
	
	return true
end

function LuaI_207452_Use()	--掛在<使用效果類型:server端劇情>下的使用效果下
	if GiveBodyItem( OwnerID() , 207474 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 3 )
		--UseItemDestroy( OwnerID() )
	end
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_423382_3]" , 0 ) --[103987]吃下你餵的[207452]
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423382_3]" , 0 )
	
	SetStopAttack(TargetID())
	Beginplot(TargetID(),"LuaI_207452_Use1",0)
end

function LuaI_207452_Use1()
	Hide(OwnerID())
	local FA = LuaFunc_CreateObjByObj(103559 , OwnerID() )
	
	--SetRoleCamp(FA, "SNPC" )	--改陣營
	SetModeEx(FA, EM_SetModeType_Mark , false )	--關掉npc/monster的標記
	
	SetModeEx(OwnerID(), EM_SetModeType_Mark , false )	--關掉npc/monster的標記
	SetStopAttack(OwnerID())
	SetDefIdleMotion(FA,ruFUSION_MIME_CAST_LOOP	)
	
	Sleep(30)
--	SetRoleCamp(OwnerID(), "SNPC" )	--改陣營
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423382_4]" , 0 ) --[103987]痛苦的扭動。
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423382_4]" , 0 )
	Sleep(30)
	SetDefIdleMotion(FA,ruFUSION_MIME_BUFF_SP01)
	Sleep(30)
	PlayMotion(FA,	ruFUSION_ACTORSTATE_DYING)
	Sleep(30)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_423382_5]" , 0 ) --[103987]死亡了
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_423382_5]" , 0 )
	WriteRoleValue (FA ,EM_RoleValue_HP,1)
	NPCDead( FA, FA)
	WriteRoleValue (FA ,EM_RoleValue_IsDead,1)
	WriteRoleValue (OwnerID(),EM_RoleValue_IsDead,1)
	Delobj(FA)
--	SetRoleCamp(OwnerID(), "Monster" )	--改陣營
	SetModeEx(OwnerID(), EM_SetModeType_Mark , true )
	CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end

--完成任務後
function LuaS_423382_USECHECK()	--掛在任務完成
	if	 CountBodyItem( TargetID(), 207452)>0	 then 
		 DelBodyItem( TargetID(), 207452, 1 )
	end
	
end

--======================================================================================================
--423383
--======================================================================================================

function LuaS_423383_0()
LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423383)==true 	and
		CheckCompleteQuest(OwnerID(),423383)==false	and
		CountBodyItem( OwnerID(), 207453)<10		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_0]","LuaS_423383_1",0)
		--我要買草料。
	end
end

function LuaS_423383_1()
	SetSpeakDetail(OwnerID(),"[SC_423383_1]")
	--你好，今天要選購什麼樣的草料啊？ 
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_2]","LuaS_423383_2",0)
	--沒有毒的那種。
end

function LuaS_423383_2()
	SetSpeakDetail(OwnerID(),"[SC_423383_3]")
	--噓！客人真愛開玩笑，我們從來不賣有毒的草料，最近不曉得怎麼回事，草料生意一落千丈，那些老顧客不來光顧就算了，他們小小的眼睛看我的眼神，倒真像我賣的草料有毒似的。哎～是不是該結束這裡的買賣，到別的地方碰碰運氣
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423383_4]","LuaS_423383_3",0)
	
--給我十綑吧。
end

function LuaS_423383_3()
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID(), 207454)>0	then
		GiveBodyItem( OwnerID() , 207453 , 10 )
		DelBodyItem( OwnerID(), 207454, 1 )
	else
	ScriptMessage( OwnerID() , OwnerID() , 2 , "[207454]:[SC_110497_5]", 0 )
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[207454]:[SC_110497_5]", 0 )

	end
	
end
	
	
	
	

--(1)
function Lua_422907()	--掛在任務物品的初始劇情之下
	SetPlot( OwnerID(),"touch","Lua_422907_do",30 )--觸碰劇情
end

function Lua_422907_do()
	BeginPlot( TargetID(), "Lua_422907_Get", 0 )--執行檢取劇情
end


function Lua_422907_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	local QuestID = 422907 --所需的任務編號
	local item = 207445 --獲得物品
	local num = 1 --獲得數量
	local time = 0 --物件重生時間  一般種怪 需要填重生時間  script產怪填0
	if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- 目標(target玩家) 獲得物品(item) 數量(num) 時間(time)					
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end

--(2)
function Lua_422907_create()	----掛在隱形物件的初始劇情之下，for生物件 
	local FlagObjID = 780676  --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local Obj = 115608 --種植物件編號
	local ObjNum = math.floor( FlagNum /1)   --種植物件數量
	local resetTime = 180 --重製時間(秒) 
	local Range = 20	--物件產生在旗幟的範圍
	local Gravity = true --有無重力
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	



--蟲卵
--(1)
function Lua_422080()	--掛在任務物品的初始劇情之下
	SetPlot( OwnerID(),"touch","Lua_422080_do",30 )--觸碰劇情
end

function Lua_422080_do()
	BeginPlot( TargetID(), "Lua_422080_Get", 0 )--執行檢取劇情
end


function Lua_422080_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	local QuestID = 422080 			--##所需的任務編號
	local item = 207432 			--##獲得物品
	local num = 1 					--##獲得數量
	local time = 0 --物件重生時間  一般種怪 需要填重生時間  script產怪填0
	if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- 目標(target玩家) 獲得物品(item) 數量(num) 時間(time)					
	else
		ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	end
end

--(2)
function Lua_422080_create()	----掛在隱形物件的初始劇情之下，for生物件 
	local FlagObjID = 780683  --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local Obj = 115615 --種植物件編號
	local ObjNum = math.floor( FlagNum / 2 )   --種植物件數量
	local resetTime = 180 --重製時間(秒) 
	local Range = 20	--物件產生在旗幟的範圍
	local Gravity = true --有無重力
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	

