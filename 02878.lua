-----------------------------------------------------------------------------
--Z25_動作集
-----------------------------------------------------------------------------
---熾熱的魔化氣體
function LuaM_107486_casting()---伸懶腰
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
end
-----------------------------------------------------------------------------
---熾熱的土元素
function LuaM_107487_attack()---示威
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(40)
end
-----------------------------------------------------------------------------
---憤怒的熔隙元魔
function LuaM_107488_cast01()---吼叫
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_BEGIN)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
--	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_INSTANT)    
--	Sleep(40)
	
end
-----------------------------------------------------------------------------
---火山亞基丁
function LuaM_107539_buff_sp()---翻滾
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(40)
	
end

function LuaM_107539_cast()---示威
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP02)
	Sleep(30)

end
-----------------------------------------------------------------------------
---重拳制裁者
function LuaM_107489_attack()---示威
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---組裝手制裁者
function LuaM_107490_attack()---轉轉
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---偵查用制裁者
function LuaM_107498_buff01()---飛高高
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
	Sleep(30)
	
end

function LuaM_107498_buff02()---我頂
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_INSTANT)
	Sleep(30)
	
end
-----------------------------------------------------------------------------
---掠林龍獸
function LuaM_107127_cast()---轉阿轉阿轉
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	
end
-----------------------------------------------------------------------------
---火翼石像鬼
function LuaM_107513_attack()---飛踢 31
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	
end

function LuaM_107513_buff()---
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)--後仰 20
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)--威嚇 161
	
end

function LuaM_107513_cast()-----飛踢 31 發射 164
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CAST_SP01)
	
end
-----------------------------------------------------------------------------
---聯盟戰士
---空手,西亞茲特村
function LuaM_107566_01()---砲台操作手
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)--操作 131
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)--停止操作 133
	
end

function LuaM_107566_02()---蹲下
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)--蹲下
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)--起身
	
end

function LuaM_107566_03()---砲台維修
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN)--操作 131
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)--停止操作 133
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)--蹲下
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)--起身
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_PARRY_1H)--抬手拉機關 51
	Sleep(20)
	
end
--騎馬
function LuaM_107566_04_1()
	SetModeEx( OwnerID(), EM_SetModeType_Show, TRUE )--出現
	CastSpell( OwnerID(),OwnerID(),496116)
	Sleep(35)

end

function LuaM_107566_04_2()
	LuaP_RidingBlackHouse(OwnerID)--上馬

end

function LuaM_107566_04_3()
	DW_CancelTypeBuff(68,OwnerID())--下馬
	Sleep(10)
	CastSpell( OwnerID(),OwnerID(),496116)
	Sleep(35)
	SetModeEx( OwnerID(), EM_SetModeType_Show, false )--消失

end
