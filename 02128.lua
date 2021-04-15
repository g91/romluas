function Lua_Un_116886()	--掛在任務物品的初始劇情之下
	SetPlot( OwnerID(),"touch","Lua_116886_do",30 )--觸碰劇情
end

function Lua_116886_do()
	BeginPlot( TargetID(), "Lua_116886_Get", 0 )--執行檢取劇情
end


function Lua_116886_Get()	
	local O_ID = OwnerID()	--點擊物件
	local T_ID = TargetID()	--玩家
	--local QuestID = 422080 			--##所需的任務編號
	local item = 208309 			--##獲得物品
	local num = 1 					--##獲得數量
	local time = 0 --物件重生時間  一般種怪 需要填重生時間  script產怪填0
	--if CheckQuest( T_ID, QuestID , 0 ) == true then
		CallPlot( O_ID, "ks_SquatGetItem", T_ID, item, num, time ) -- 目標(target玩家) 獲得物品(item) 數量(num) 時間(time)					
	--else
		--ScriptMessage( O_ID, T_ID, 1, "[SC_Z16_REQUIRE]" , 0 ) --沒有符合的委託任務
	--end
end

--(2)
function Lua_116886_create()	----掛在隱形物件的初始劇情之下，for生物件 
	local FlagObjID = 780806  --旗幟物件編號 
	local FlagNum = GetMoveFlagCount( FlagObjID ) --旗幟數量
	local Obj = 116886 --種植物件編號
	local ObjNum = math.floor( FlagNum / 2 )   --種植物件數量
	local resetTime = 10 --重製時間(秒) 
	local Range = 20	--物件產生在旗幟的範圍
	local Gravity = true --有無重力
	
	ks_CreateObj( FlagObjID, FlagNum, Obj, ObjNum, resetTime, Range, Gravity )
end	