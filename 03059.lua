function ChristineRoleEvent_initialize()
	Christine.RoleEvent = Christine.Event:new()
	Christine.RoleEvent.class = "RoleEvent"

	Christine.RoleEvent.CREATE = "CREATE"
	Christine.RoleEvent.DELETE = "DELETE"
	Christine.RoleEvent.ADD_TO_PARTITION = "ADD_TO_PARTITION"
	Christine.RoleEvent.DELETE_FROM_PARTITION = "DELETE_FROM_PARTITION"
	Christine.RoleEvent.CHANGE_CAMP = "CHANGE_CAMP"
	Christine.RoleEvent.STOP_BGM = "STOP_BGM"
	Christine.RoleEvent.PLAY_BGM = "PLAY_BGM"
	Christine.RoleEvent.RESET = "RESET"

	DebugLog(2, "[Christine Class] RoleEvent initialized")
end