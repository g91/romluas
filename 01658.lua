--敵人技能.玩家技能

--裝死技能用 --玩家
function Lua_mika_losttreasure_godie()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
end

function Lua_mika_losttreasure_goup()
	PlayMotion( OwnerID(), ruFUSION_MIME_IDLE_STAND )
end

---------------------------------------------------------------------------------------------
-- 2011.08.16  [4.0.3增加] 稱號培養系統 任務條件劇情
--法術集合-> 基本法術

-- 殺死-NPC  擊殺亡靈犬 106281
function lua_mika_losttreasure_skillplot01()
	local npcid = 106281
	local id = ReadRoleValue( TargetID(), EM_RoleValue_OrgID )
--	say(OwnerID(), id )
	if id == 101701 then
		DW_QietKillOne( OwnerID(), npcid )
	end
end

------------------------------------------------------------------------------------

--2013.09.27 新增怪物施法時檢查玩家是否在裝死的狀態，此修正可避免玩家無法解除死亡動態的問題

function Lua_na_355_check_die() --新增在法術 505961 的使用檢查欄位
	local Owner = OwnerID()
	local Target = TargetID()
	if CheckBuff( Target , 505297 ) == true then
		return FALSE
	end
end