function Lua_mika_springfes_reset()
	local Owner = OwnerID()
	SetFlag(Owner , 542427, 0)  --被偷竊的彩蛋
	SetFlag(Owner , 542428, 0)  --花瓣集集樂1
	SetFlag(Owner , 542519, 0) --花瓣集集樂2
	SetFlag(Owner , 542433, 0) -- 帶兔子回家1
	SetFlag(Owner , 542491, 0) -- 帶兔子回家2
	SetFlag(Owner , 544861, 0) --跳躍吧~拉比兔
	SetFlag(Owner , 545001,0)--彩蛋快樂送
	SetFlag(Owner , 545002,0)
	SetFlag(Owner , 545003,0)
	SetFlag(Owner , 546228, 0 ) --守護彩蛋大作戰
	SetFlag(Owner , 546288, 0 ) --守護彩蛋共用獎勵
	ic_Easter_play(0)--畫彩蛋
	SetFlag(Owner,546257, 0 ) --拉比追緝令
	BeginPlot(Owner,"lua_kors_sprfes_rabbitTaxi_RE",0)
	BeginPlot(Owner,"lua_kors_SprinRain_2012_ReDo",0)
	ScriptMessage( Owner ,  Owner , 1, "[SC_SPRINGFES_NEW06]" , C_SYSTEM )  --你現在可以重新進行所有春雨節活動囉！
	ScriptMessage( Owner ,  Owner , 0, "[SC_SPRINGFES_NEW06]" , C_SYSTEM )  --你現在可以重新進行所有春雨節活動囉！
end