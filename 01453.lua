function LuaN_mika_smallmerry00()
	SetSpeakDetail(OwnerID(), "[SC_MERRYS00]" )--　npc初始對話
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MERRYS01]", " LuaN_mika_smallmerry_intro", 0) --什麼是魔法符文轉盤？
	AddSpeakOption(OwnerID(), TargetID(), "[SC_MERRYS02]", " LuaN_mika_smallmerry_start", 0) --我要試試看   --開啟小瑪莉
end

function LuaN_mika_smallmerry_intro()
	SetSpeakDetail(OwnerID(), "[SC_MERRYS03]" )--　說明內容
	AddSpeakOption(OwnerID(), TargetID(), "[SC_GUILDGIRL_BACK_01]" , "LuaN_mika_smallmerry00", 0 ) --回到上一層
end

function LuaN_mika_smallmerry_start() --條件符合時 執行小瑪莉介面
	CloseSpeak(OwnerID())
	Hsiang_OpenEqGamble()
end