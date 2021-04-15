function LuaS_TurnFace_DW_00(QuestID,KeyitemID,InitalScript,EndScript)
--注意!!!!!!!!!!!!!!!!
--此function會使用到npc的PID&Register
--QuestID  是哪個任務要用的
--KeyitemID  打敗npc要給哪個重要物品
--InitalScript  開打前可以做個動作演個戲
--EndScript	打輸了也可以演個戲 說句話

--關閉npc的任務
	DisableQuest(OwnerID(),true)
--開打前的動作
	if	InitalScript ~= nil	then
		BeginPlot(OwnerID(),InitalScript,0)
	end
--更改陣營
	DelFromPartition(OwnerID())
	SetRoleCamp(OwnerID(),"Monster")
	AddToPartition(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_RoomID))

	WriteRoleValue(OwnerID(),EM_RoleValue_PID,QuestID)
	if	KeyitemID == nil	then
		WriteRoleValue(OwnerID(),EM_RoleValue_Register,123456)
	else
		WriteRoleValue(OwnerID(),EM_RoleValue_Register,KeyitemID)
	end
	SetPlot(OwnerID(),"dead","LuaS_TurnFace_DW_01",0)
	BeginPlot(OwnerID(),"LuaS_TurnFace_DW_02",0)
--展開戰鬥
	SetAttack(OwnerID(),TargetID())
--改變遊標
	SetCursorType(OwnerID(),12)
	if	EndScript~=nil	then
		while ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	do
			sleep(2)
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)==1	then
				return
			end
		end
		BeginPlot(OwnerID(),EndScript,0)
	end
end


function LuaS_TurnFace_DW_01()
--讓有接任務的玩家完成任務
--沒有填的就不給( 123456 )
	if	ReadRoleValue(OwnerID(),EM_RoleValue_Register)~=123456	then
		local Player
		for i=0,HateListCount( OwnerID())-1,1 do
			Player = HateListInfo(OwnerID(),i , EM_HateListInfoType_GItemID)
			if	ReadRoleValue(Player,EM_RoleValue_IsPlayer)==1	then
				if	CheckAcceptQuest(Player,ReadRoleValue(OwnerID(),EM_RoleValue_PID) )	then
					SetFlag(TargetID(),ReadRoleValue(OwnerID(),EM_RoleValue_Register),1)
				end
			end
		end
	end
--讓生命全滿
	WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
--改回陣營
	SetRoleCamp(OwnerID(),"Visitor")
--將pid 及 register 重置  同時做為信號
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register,0)
--開啟任務
	DisableQuest(OwnerID(),false)
--改變遊標
	SetCursorType(OwnerID(),15)
	BeginPlot(TargetID(),"LuaS_TurnFace_DW_03",0)
	return false
end

function LuaS_TurnFace_DW_02()
	sleep(20)
	local xyz = {}
	while true do
		sleep(10)
		if	HateListCount( OwnerID())==0	then
			if	ReadRoleValue(OwnerID(),EM_RoleValue_PID)~=0	then
				DelFromPartition(OwnerID())
--改回陣營
				SetRoleCamp(OwnerID(),"Visitor")
				AddToPartition(OwnerID(),ReadRoleValue(TargetID(),EM_RoleValue_RoomID))

--將pid 及 register 重置  同時做為信號
				WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_Register,1)
--開啟任務
				DisableQuest(OwnerID(),false)
--讓生命全滿
				WriteRoleValue(OwnerID(),EM_RoleValue_HP,ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP))
--改變遊標
				SetCursorType(OwnerID(),15)
				xyz = {ReadRoleValue(OwnerID(),EM_RoleValue_X),ReadRoleValue(OwnerID(),EM_RoleValue_Y)+2000,ReadRoleValue(OwnerID(),EM_RoleValue_Z)}
				BeginPlot(Lua_DW_CreateObj("xyz",114040,xyz,005),"LuaS_TurnFace_DW_03",0)
				return
			end
		end
	end
end


function LuaS_TurnFace_DW_03()
	DelFromPartition(TargetID())
	ReSetNPCInfo( TargetID() )
	AddToPartition(TargetID(),0)
	if	ReadRoleValue(OwnerID(),EM_RoleValue_IsPlayer)==0	then
		DelObj(OwnerID())
	end
end