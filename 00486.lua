function LuaQ_420367_Complet()

	Say( OwnerID() , GetString("ST_420322_3") )	-- 請稍待一下。
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420368_1") )	-- 我現在將這些物品混合出測試用的蟻族毒劑。
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- 解毒劑特效
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	Say( OwnerID() , GetString("ST_420367_1") )	-- 看起來顏色似乎不太理想啊…
	sleep(10)

end

function LuaQ_420368_Complet()

	Say( OwnerID() , GetString("ST_420322_3") )	-- 請稍待一下。
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420368_1") )	-- 我現在將這些物品混合出測試用的蟻族毒劑。
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- 解毒劑特效
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420322_2") )	-- 好了，這樣就行了！
	sleep(10)

end

function LuaS_200952_KillAnt()
	local Dis =  GetDistance( OwnerID() , TargetID() )
	if ( Dis < 100 ) then
		local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		--Say(OwnerID(), "Target = "..OrgID )
		if ( OrgID == 100434 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_6") , 0 )	-- 你使用 |cffffffff[蟻族毒劑]|r
			BeginPlot( OwnerID() , "LuaS_KillAntPotion" , 0 )
			CastSpell( OwnerID() , TargetID() , 491191 )	-- 蟻族毒劑特效
			if ( CheckFlag( OwnerID() , 540827 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay1" , 0 )
			elseif ( CheckFlag( OwnerID() , 540828 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay2" , 0 )
			elseif ( CheckFlag( OwnerID() , 540829 ) == false ) then
				BeginPlot( TargetID() , "LuaS_KillAntPlay3" , 0 )
			end
		elseif ( OrgID == 1001 ) then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SYS_TOUCH_NOTARGET") , 0 )	-- 沒有目標
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_2") , 0 )	-- 目標並非卡托拉克王蟻，不應該把毒劑用在對方的身上！
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_200952_1") , 0 )	-- 與目標距離太遠，你覺得把毒劑丟過去並不能準確的丟到對方身上！
	end

end

function LuaS_KillAntPotion()
	DelBodyItem ( OwnerID() , 200952, 1 )		-- 蟻族毒劑
end

function LuaS_KillAntPlay1()
	SetFlag( TargetID() , 540827 , 1 )	-- 用殺蟻劑無效果
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_4") , 0 )	-- 毒劑對卡托拉克王蟻似乎沒有任何的影響…
end
function LuaS_KillAntPlay2()
	SetFlag( TargetID() , 540828 , 1 )	-- 用殺蟻劑複製王蟻
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_5") , 0 )	-- 毒劑對卡托拉克王蟻發生了效用，卡托拉克王蟻變成了兩隻！
	local KingAnt = LuaFunc_CreateObjByObj ( 100434 , OwnerID() )
	BeginPlot( KingAnt  , "LuaS_KillAntPlay2b" , 0 )
end
function LuaS_KillAntPlay2b()
	MonsterLivingTime( 6000 )
end
function LuaS_KillAntPlay3()
	SetFlag( TargetID() , 540829 , 1 )	-- 用殺蟻劑殺死王蟻
	Sleep( 20 )
	ScriptMessage( TargetID(), TargetID(), 0, GetString("ST_200952_3") , 0 )	-- 毒劑對卡托拉克王蟻發生了效用，卡托拉克王蟻死亡了！
	SetStopAttack( OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING )
	Sleep( 30 )
	DelFromPartition( OwnerID() )
	Sleep( 6000 )
	AddToPartition( OwnerID() , 0 )
end