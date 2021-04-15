--========================================================================
--					玩家活動技能特效
--========================================================================
function Lua_jiyi_2013Flower_buffid_goal()--掛在法術集合的使用檢查LUA，用以檢查技能目標是否為採花賊
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local FlowerThief = 121711 --採花賊ID
	if TOrgID == FlowerThief then --當目標物品ID=採花賊ID時	 
		return true
	else 
		ScriptMessage( own , own , 1 , "[SC_2013FLOWERS_NPC_121383_13]" , 0 )--系統告知"非有效目標"
		return false
	end
end

function Lua_jiyi_2013Flower_buffid_Kick() --玩家執行護花踢技能
	local Player = OwnerID() --玩家
	local FlowerThief = TargetID() --採花賊
	local Attack = ReadRoleValue( FlowerThief , EM_RoleValue_Register2 ) --用來記錄花賊被攻擊的次數
	local Buff = 623703  --得分BUFF

	if Attack ~= 0 then
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_14] " , 0 )--系統告知"妳擊中花賊了"
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --採花賊暈眩				
				AddBuff ( Player , Buff , 2 , -1 ) --得3分
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--系統告知"有人擊中花賊了"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --得1分
			end
		end
	elseif Attack == 0 then	
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_14]" , 0 )--系統告知"妳擊中花賊了"
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --採花賊暈眩			
				AddBuff ( Player , Buff , 2 , -1 ) --得3分
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--系統告知"有人擊中花賊了"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --得1分
			end
		end
		DelObj( FlowerThief ) --刪除花賊
	end					
end

Function Lua_jiyi_2013Flower_buffid_Kick2() --玩家執行一掌斃命技能
	local Player = OwnerID() --玩家
	local FlowerThief = TargetID() --採花賊
	local Attack = ReadRoleValue( FlowerThief , EM_RoleValue_Register2 ) --用來記錄花賊被攻擊的次數
	local Buff = 623703  --得分BUFF

	if Attack ~= 0 then
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_17] " , 0 )--你把[121711]擊飛，同時搶回6朵[121715]
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --採花賊暈眩				
				AddBuff ( Player , Buff , 4 , -1 ) --得5分
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--系統告知"有人擊中花賊了"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --得1分
			end
		end
	elseif Attack == 0 then	
		for i = 1 , table.getn(z2FlowerNpc121654) do
			if z2FlowerNpc121654[i] == Player then
				ScriptMessage( Player , Player , 1 , "[SC_2013FLOWERS_NPC_121383_17]" , 0 )--你把[121711]擊飛，同時搶回6朵[121715]
				NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121383_15]" )
				PlayMotion ( FlowerThief , 18 ) --採花賊暈眩			
				AddBuff ( Player , Buff , 4 , -1 ) --得5分
				AddRoleValue( FlowerThief , EM_RoleValue_Register2 , -1 )
			else
				ScriptMessage( Player , z2FlowerNpc121654[i] , 1 , "[SC_2013FLOWERS_NPC_121383_16]" , 0 )--系統告知"有人擊中花賊了"
				AddBuff ( z2FlowerNpc121654[i] , Buff , 0 , -1 ) --得1分
			end
		end
		DelObj( FlowerThief ) --刪除花賊
	end
	CancelBuff( Player , 623921 ) --刪除額外技能					
end
--===============================================================================
--					採花賊技能
--===============================================================================
function Lua_jiyi_2013Flower_buffid_goal2()--掛在法術集合的使用檢查LUA，用以檢查技能目標是否為花精靈
	local own = OwnerID()
	local tar = TargetID()
	local TOrgID = ReadRoleValue( tar , EM_RoleValue_OrgID ) --讀取目標物品ID
	local FlowerNpc = 121654 --花精靈ID
	if TOrgID == FlowerNpc then --當目標物品ID=採花賊ID時	 
		return true
	else 
		return false
	end
end

function Lua_jiyi_2013Flower_buffid_FlowerThief() --採花賊的調戲技能
	local FlowerThief = OwnerID() --採花賊
	local FlowerNpc = TargetID() --花精靈
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --紀錄花精靈身上花的數量剩多少
	local FlowerNpcAttacked=ReadRoleValue( FlowerNpc , EM_RoleValue_Register7 ) --紀錄花精靈被攻擊次數

	NPCSAY( FlowerNpc , "[SC_2013FLOWERS_NPC_121654_01]") --可惡的[121711]，趁機偷走我的花。
 	AddBuff( FlowerNpc , 623923 , 0 , -1 ) --花精靈的怒氣值+1
	AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -5 )
	AddRoleValue( FlowerNpc , EM_RoleValue_Register7 , -1 )
--	DebugMsg( 0 , 0 , "Reg6="..FlowerNum )
--	DebugMsg( 0 , 0 , "Reg7="..FlowerNpcAttacked )
	NPCSAY( FlowerThief , "[SC_2013FLOWERS_NPC_121711_01]")
end
--==================================================================================
--					花精靈反擊技能
--==================================================================================
function Lua_jiyi_2013Flower_buffid_FlowerNpc()--花精靈的粉沙暴反擊技能
	local FlowerNpc = OwnerID() --花精靈
	local NPC = SearchRangeNPC( FlowerNpc , 300 )
	local FlowerThief = 121711 --採花賊ID	
	local FlowerNum = ReadRoleValue( FlowerNpc , EM_RoleValue_Register6 ) --紀錄花精靈身上花的數量剩多少
	for i = 0 , table.getn(NPC) do
		if ReadRoleValue( NPC[i] , EM_RoleValue_OrgID ) == FlowerThief then
			NPCSAY( NPC[i] , "[SC_2013FLOWERS_NPC_121711_02]")
			Sleep(10)
			DelObj( NPC[i] )	
		end
	end
	AddRoleValue( FlowerNpc , EM_RoleValue_Register6 , -100 )
end
