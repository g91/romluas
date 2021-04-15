function ChristineMusicPlayerEvent_initialize()
	Christine.MusicPlayerEvent = Christine.Event:new()
	Christine.MusicPlayerEvent.class = "MusicPlayerEvent"

	Christine.MusicPlayerEvent.PLAY_MUSIC = "PLAY_MUSIC"
	Christine.MusicPlayerEvent.STOP_MUSIC = "STOP_MUSIC"
	Christine.MusicPlayerEvent.MUSIC_END = "MUSIC_END"

	DebugLog(2, "[Christine Class] MusicPlayerEvent initialized")
end