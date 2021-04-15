function LuaQ_420320_Complet()

	sleep(5)
	Say( OwnerID() , GetString("ST_420320_3") )	-- 請稍待片刻。
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN );
	Say( OwnerID() , GetString("ST_420320_1") )	-- 我現在就將魔法注入空音水晶之中！
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- 解毒劑特效
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CAST_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420320_2") )	-- 完成了，這樣就可以了！
	sleep(10)

end

function LuaQ_420322_Complet()

	sleep(5)
	Say( OwnerID() , GetString("ST_420322_3") )	-- 請稍待一下。
	sleep(10)
	PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN );
	Say( OwnerID() , GetString("ST_420322_1") )	-- 我現在使用這些物品將吸音水晶施加保護！
	CastSpell( OwnerID() , OwnerID() , 490112 );	-- 解毒劑特效
	Sleep(20)
	--PlayMotion ( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END );
	sleep(10)
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Say( OwnerID() , GetString("ST_420322_2") )	-- 好了，這樣就行了！
	sleep(10)

end