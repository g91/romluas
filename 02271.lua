function FA_MotionTest()
	GID = 2949184
	say (GID, "1H")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_1H)
	sleep (20)
	say (GID, "1H_SP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	sleep (20)
	say (GID, "1H_PIERCE")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_1H_PIERCE)
	sleep (20)
	say (GID, "2H")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_2H)
	sleep (20)
	say (GID, "2H_SP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_2H_SP)
	sleep (20)
	say (GID, "POLEARM")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_POLEARM)
	sleep (20)
	say (GID, "POLEARM_SP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_POLEARM_SP)
	sleep (20)
	say (GID, "UNARMED")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_UNARMED)
	sleep (20)
	say (GID, "UNARMED_SP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_UNARMED_SP)
	sleep (20)
	say (GID, "BOW_BEGIN->LOOP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_BOW_BEGIN)
	sleep (30)
	say (GID, "BOW_END")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_BOW_END)
	sleep (20)
	say (GID, "GUN_BEGIN->LOOP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_GUN_BEGIN)
	sleep (30)
	say (GID, "GUN_END")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_GUN_END)
	sleep (20)
	say (GID, "OH")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_OH)
	sleep (20)
	say (GID, "OH_PIERCE")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_OH_PIERCE)
	sleep (20)
	say (GID, "BOW_SP_BEGIN->LOOP")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_BOW_SP_BEGIN)
	sleep (30)
	say (GID, "BOW_SP_END")
	CallPlot(OwnerID(), "PlayMotion", GID, ruFUSION_ACTORSTATE_ATTACK_BOW_SP_END)
	sleep (20)
end
