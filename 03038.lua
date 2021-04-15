
-- 任務名稱 426509 更多奔岩蜥
-- 使用物品 狩獵粗繩 242966 劇情
function Z27_LuaI_242966_01()
	local TargetOrgID = ReadRoleValue(TargetID(), EM_RoleValue_OrgID)
	if TargetOrgID ~= 107933  then-- 非正確使用目標
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421249_4]" , 0 ) --目標錯誤
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421249_4]" , 0 )
		return false
	elseif ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --目標已經死了。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	else
		return true
	end
end

function Z27_LuaI_242966_02()
	local PlayerID = OwnerID()
	local orgid = 107933
	local Target = TargetID()

	ScriptMessage( PlayerID, PlayerID, 1, "[SC_Z27_426509_01][$SETVAR1=".."["..orgid.."]".."]", C_SYSTEM ); -------你抓到[$VAR1]了！
	CallPlot(Target,"LuaFunc_ResetObj",Target)
	GiveBodyItem(PlayerID, 242967, 1 )
end

function Z27_Lua_NPC_122863_talk()
	local PlayerID = OwnerID()
	local NPC = TargetID()
	LoadQuestOption(PlayerID)
	PlayMotion(NPC ,ruFUSION_ACTORSTATE_EMOTE_CRY)
end

function Hao_Zone27_HooLu_Ethnic()	-- 呼嚕族死亡劇情

	SetPlot( OwnerID() , "Dead" , "Hao_Zone27_HooLu_Ethnic_Dead" , 0 )
end

function Hao_Zone27_HooLu_Ethnic_Dead()	-- 呼嚕族死亡劇情
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- 殺死呼嚕族後，玩家得到的特效
	Effect["P_GetBuff"] = { 625199, 86400 }	-- 殺死呼嚕族後，玩家得到的堆疊Buff與持續時間
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- 殺死呼魯族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，會觸發詛咒的Buff與持續時間(譬如：緩速效果等)
	Effect["N_GetMagic"] = 491259 		-- 殺死呼嚕族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，呼嚕得到的特效(譬如：爆炸特效等)
	Effect["MonsterID"] = { 108449, 10 }	-- 殺死呼魯族後，當玩家引發詛咒Buff時，在怪物身上出現的怪物及存在時間
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone28_Ethnic_Dead()	-- 死亡劇情
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- 殺死呼嚕族後，玩家得到的特效
	Effect["P_GetBuff"] = { 625200, 86400 }	-- 殺死呼嚕族後，玩家得到的堆疊Buff與持續時間
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- 殺死呼魯族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，會觸發詛咒的Buff與持續時間(譬如：緩速效果等)
	Effect["N_GetMagic"] = 491259 		-- 殺死呼嚕族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，呼嚕得到的特效(譬如：爆炸特效等)
	Effect["MonsterID"] = { 108450, 10 }	-- 殺死呼魯族後，當玩家引發詛咒Buff時，在怪物身上出現的怪物及存在時間
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone29_Ethnic_Dead()	-- 死亡劇情
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- 殺死呼嚕族後，玩家得到的特效
	Effect["P_GetBuff"] = { 625201, 86400 }	-- 殺死呼嚕族後，玩家得到的堆疊Buff與持續時間
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- 殺死呼魯族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，會觸發詛咒的Buff與持續時間(譬如：緩速效果等)
	Effect["N_GetMagic"] = 491259 		-- 殺死呼嚕族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，呼嚕得到的特效(譬如：爆炸特效等)
	Effect["MonsterID"] = { 108451, 10 }	-- 殺死呼魯族後，當玩家引發詛咒Buff時，在怪物身上出現的怪物及存在時間
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end
function Hao_Zone30_Ethnic_Dead()	-- 死亡劇情
	local Effect = {}
	Effect["P_GetMagic"] =  497297		-- 殺死呼嚕族後，玩家得到的特效
	Effect["P_GetBuff"] = { 625202, 86400 }	-- 殺死呼嚕族後，玩家得到的堆疊Buff與持續時間
	Effect["P_CurseBuff"] = { 503464 , 5 }	-- 殺死呼魯族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，會觸發詛咒的Buff與持續時間(譬如：緩速效果等)
	Effect["N_GetMagic"] = 491259 		-- 殺死呼嚕族後，玩家身上的Effect["P_GetBuff"]疊至一定層數時，呼嚕得到的特效(譬如：爆炸特效等)
	Effect["MonsterID"] = { 108452, 10 }	-- 殺死呼魯族後，當玩家引發詛咒Buff時，在怪物身上出現的怪物及存在時間
	
	Hao_Zone_Bodo_Ethnic_Dead( Effect["P_GetMagic"] , Effect["N_GetMagic"] , Effect["P_GetBuff"] , Effect["P_CurseBuff"] , Effect["MonsterID"] )
end

function Hao_Zone_Bodo_Ethnic_Dead( P_GetMagic , N_GetMagic , P_GetBuff , P_CurseBuff , MonsterID )	-- 波多族死亡共用劇情

	local Npc = OwnerID()
	local Room = ReadRoleValue(Npc , EM_RoleValue_RoomID )
	local PlayerList = KS_GetHateList( Npc , 3 )	-- 仇恨表 , 3 = 玩家
	WriteRoleValue( Npc , EM_RoleValue_PID , 0 )	-- 將 PID 值重置，避免怪物重生後，PID值依然被覆寫為1的問題
	if #(PlayerList) ~= 0 then	-- 當仇恨表中有玩家存在時，則...
		for Num = 1 , #(PlayerList) , 1 do 
			if GetDistance( Npc , PlayerList[Num] ) <= 250 then	-- 當目標與Npc的距離 <= ...
				SysCastSpellLv( Npc , PlayerList[Num] , P_GetMagic , 0 )
				AddBuff( PlayerList[Num] , P_GetBuff[1] , 0 , P_GetBuff[2] )
				local BuffLv = Lua_Hao_Return_Buff_Lv( PlayerList[Num] , P_GetBuff[1] )	-- 查詢Buff堆疊的等級
				if BuffLv >= 4 then	-- 當詛咒Buff堆疊5層時
					SysCastSpellLv( Npc , Npc , N_GetMagic , 0 )
					--AddBuff( PlayerList[Num] , P_CurseBuff[1] , 0 , P_CurseBuff[2] )
					CancelBuff_NoEvent( PlayerList[Num] , P_GetBuff[1] )
					if ReadRoleValue( Npc , EM_RoleValue_PID ) == 0 then
						local Monster = CreateObjByObj( MonsterID[1] , Npc , 1 )
						SetModeEx( Monster , EM_SetModeType_Searchenemy , false )	-- 索敵v  
						SetModeEx( Monster , EM_SetModeType_Strikback , false )	-- 反擊
						SetModeEx( Monster , EM_SetModeType_Fight , false )		-- 砍殺
						SetModeEx( Monster , EM_SetModeType_ShowRoleHead , false )	-- 頭像框
						SetAttack( Monster , PlayerList[Num] )
						WriteRoleValue( Npc , EM_RoleValue_PID , 1 )
						CallPlot( Monster , "Hao_Zone_Bodo_Ethnic_DelObj" , MonsterID[2]*10 )
					end
				end
				DebugMsg( PlayerList[Num] , Room , "BuffLv = "..BuffLv.." , You've been cursed ...A_A" )
			end
		end
	end
end

function Hao_Zone_Bodo_Ethnic_DelObj(Time)

	Sleep(Time)
	DelObj(OwnerID())
end