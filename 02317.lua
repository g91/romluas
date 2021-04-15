


function lua_suki_Germany2_en2_01()
	if CheckFlag(OwnerID(), 544940) == TRUE or CheckFlag (OwnerID(), 544942 ) == TRUE then--每日
		LoadQuestOption( OwnerID() )
	end
end

function lua_suki_Germany2_en2_01_0k()
--	SAY(OwnerID(), "01")
	SetFlag(TargetID(), 544942, 1 ) --餵食
end

function lua_suki_Germany2_en2_02_0k()
	SAY(OwnerID(), "02")
	SetFlag(TargetID(), 544944, 0) --餵食重複
end

-----------------------FISH hide---------------------------------------

function lua_suki_Germany2_en2_fishhide() --載浮載沉
	while TRUE do
		local r=Rand(5)+7
		local a=r*10
	--	Say(OwnerID(), "a="..a)
		Hide(OwnerID() )
		sleep(a)
		Show(OwnerID(),0)
		sleep(150)
	end
end

------------------------EAT-----------------------------

function lua_suki_Germany2_en2_02_eat() --青蛙加BUFF和亂跑
	while TRUE do --加入不定時buff lv變動
		SetRandMove(OwnerID(), 150, 50,90)
		local lv=Rand(50)+1
		local time=RandRange(70, 150)
		CancelBuff(OwnerID(), 507854)
		AddBuff(OwnerID(), 507854, lv, -1)--頑皮度
		sleep(time)
	end
end

function lua_suki_Germany2_en2_02_eat1() --提示玩家是否已餵完青蛙

	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_CONCERTO_02]" , C_SYSTEM)--已餵食?隻…

	ScriptMessage(OwnerID(), OwnerID(), 1, "[SC_GERMANY2_CONCERTO_01]" , C_SYSTEM)--已完成回去找…
end