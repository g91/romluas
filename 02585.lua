function Lua_Mortania_Guard_Say()
	local NPC = OwnerID()	
	local NPCPID = ReadRoleValue(NPC,EM_RoleValue_PID)
	if NPCPID == nil or NPCPID == 1 then
	NPCSAY(NPC,"[SC_MORTANIA_GUARD_01]")
	elseif NPCPID == 2 then
	NPCSAY(NPC,"[SC_MORTANIA_GUARD_02]")
	elseif NPCPID == 3 then
	NPCSAY(NPC,"[SC_MORTANIA_GUARD_03]")
	elseif NPCPID == 4 then
	NPCSAY(NPC,"[SC_MORTANIA_GUARD_04]")
	end
end

function Lua_Mortania_Guard_Plot()
	SetPlot(OwnerID(),"range","Lua_Mortania_Guard_Plot_1",40)
end

function Lua_Mortania_Guard_Plot_1()
	local PLAYER = OwnerID()		
	local NPC = TargetID()	
	local NPCPID = ReadRoleValue(NPC,EM_RoleValue_PID)
	if NPCPID == nil or NPCPID == 1 then
	AdjustFaceDir(NPC,PLAYER,0)
	NPCSAY(NPC,"[SC_MORTANIA_GUARD_05]")
	MoveToFlagEnabled( NPC , true );
	end
end

function Lua_SOUTHTAFFROCK_NPC_Say()
	local Player= OwnerID()	
	local NPC = TargetID()	
	local NPCPID = ReadRoleValue(NPC,EM_RoleValue_PID)
	if NPCPID == nil or NPCPID == 1 then
	SetSpeakDetail(Player,"[SC_SOUTHTAFFROCK_NPC_0]")
	elseif NPCPID == 2 then
	SetSpeakDetail(Player,"[SC_SOUTHTAFFROCK_NPC_1]")
	elseif NPCPID == 3 then
	SetSpeakDetail(Player,"[SC_SOUTHTAFFROCK_NPC_2]")
	end
end


--function Lua_Mortania_FightShow_Plot()
--	SetPlot(OwnerID(),"range","Lua_Mortania_Guard_Plot_1",40)
--end

--function Lua_Mortania_FightShow_Plot_1()
--	local XYZ = {1710,1560.6,-803.2}
--	local ctrl = Lua_DW_CreateObj( "xyz" ,120202, XYZ , 1 , 180 , 1 )
--	CallPlot(ctrl,"Lua_Mortania_FightShow_Plot_2",ctrl)
--end

--function Lua_Mortania_FightShow_Plot_2(ctrl)
--	local XYZ = {}
--	XYZ[1]= 1800,1561.4,-776.2
--	XYZ[2]= 1710,1560.6,-763.3
--	XYZ[3]= 1710,1560.6,-803.2
--	local Actor = {}
--	Actor[1] =  Lua_DW_CreateObj( "xyz" , 106561 , XYZ[1] , 1 , 180 , 1 )		
--	Actor[2] =  Lua_DW_CreateObj( "xyz" , 106583 , XYZ[2] , 1 , 0 , 1 )
--	Actor[3] =  Lua_DW_CreateObj( "xyz" , 106583 , XYZ[3] , 1 , 0 , 1 )
--	NPCSAY(Actor[2],"[SC_MORTANIA_GUARD_06]")
--	for i = 1,3 do
--		CallPlot(Actor[i],"Lua_Mortania_FightShow_Plot_3",Actor[i],ctrl)
--	end
--end


--function Lua_Mortania_FightShow_Plot_3(Actor,ctrl)
--	local A = 0
--	while 1 do
--		Sleep(30)
--		if checkid(Actor)~=0 or checkid(Actor)~=nil then
--			if HateListCount( Actor) == 0   then
--				delobj(Actor)
--				DelObj(ctrl)
--			end
--		end	
--	end
--end
-------------------------------環境BUFF-----------------
function Lua_Z31_castAllPlayerBuff()
	local Room =ReadRoleValue( OwnerID() , EM_RoleValue_RoomID );
	local Temp={};
	while 1	do
		local PlayerCount = SetSearchAllPlayer(Room);
--		Say(OwnerID(),PlayerCount);
		if PlayerCount~=0 then
			for i=1,PlayerCount,1 do
				 Temp[i] = GetSearchResult()
					if DW_CheckMap(Temp[i],102) or DW_CheckMap(Temp[i],105) or DW_CheckMap(Temp[i],106) then
						AddBuff(Temp[i],621884,0,61)
						CancelBuff(Temp[i],621885)
						CancelBuff(Temp[i],621886)
					elseif DW_CheckMap(Temp[i],103) or DW_CheckMap(Temp[i],104) then
						AddBuff(Temp[i],621885,0,61)
						CancelBuff(Temp[i],621884)
						CancelBuff(Temp[i],621886)
					elseif DW_CheckMap(Temp[i],107) or DW_CheckMap(Temp[i],108) then
						AddBuff(Temp[i],621886,0,61)
						CancelBuff(Temp[i],621884)
						CancelBuff(Temp[i],621885)
					end
			end
		end
		Sleep(600);
	end
end
----------------------------Q425067接受任務後表演--------------------
function luaQ_425067_ACCEPT()	--_show(OID,TID)
	local OID,TID = OwnerID(),TargetID()
	local Atable = {}
	AddBuff(TID,621974,0,-1)

        		 Atable=SearchRangePlayer(OID,80)
		for i=0,table.getn(Atable),1 do
			CloseSpeak(Atable[i])
		end
		DisableQuest( OID, true ) 

	local moke = Lua_DW_CreateObj("flag",119939, 781077, 0)
	local black = Lua_DW_CreateObj("flag",119941, 781077, 2)
	DW_MoveToFlag( moke , 781077, 1, 0, 1)
	DelObj(moke)
	Sleep(5)
	NPCSAY(BLACK,"[SC_425067_NPC_01]")
	DW_MoveToFlag( black ,  781077, 3, 0, 1)
	CancelBuff(TID,621974)
	DelObj(black)

		DisableQuest( OID, false ) 
end
------------------------------------------------
function LuaQ_TAFFROCK_ENTER()		--塔伐洛克入口
	SetPlot(OwnerID(),"range","LuaQ_TAFFROCK_ENTER_PLACE",80)
end

function LuaQ_TAFFROCK_ENTER_PLACE()
	ChangeZone( OwnerID(), 212, -1, 2400,2980,-3927.6, 270 ) 
end


function LuaQ_TAFFROCK_EXIT()		--塔伐洛克出口
	SetPlot(OwnerID(),"range","LuaQ_TAFFROCK_EXIT_PLACE",100)
end

function LuaQ_TAFFROCK_EXIT_PLACE()
	ChangeZone( OwnerID(), 31, 0, 5970,1431,5777.9, 90 ) 
end

function LuaQ_TAFFROCK_DGNDOOR_1()	--塔伐洛克內部傳送門
	SetPlot(OwnerID(),"range","LuaQ_TAFFROCK_DGNDOOR_1_1",100)
end

function LuaQ_TAFFROCK_DGNDOOR_1_1()
	ScriptMessage(OwnerID(),OwnerID(),0,"[SC_Z31_TAFFROCK_DOOR_0]",0)
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_Z31_TAFFROCK_DOOR_0]",0)
	beginplot(OwnerID(),"LuaQ_TAFFROCK_DGNDOOR_1_2",10)
end

function LuaQ_TAFFROCK_DGNDOOR_1_2()
	ChangeZone( OwnerID(), 31, 0, 5970,1431,5777.9, 90 ) 
end

------------Q425072------------------------------------
function LuaQ_425072_HAMMER()
	SetPlot(OwnerID(),"touch","LuaQ_425072_HAMMER_TOUCH",20)
end
function LuaQ_425072_HAMMER_TOUCH()
	AddBuff(OwnerID(),621977,0,-1)
end

function LuaQ_425072_PLIERS()
	SetPlot(OwnerID(),"touch","LuaQ_425072_PLIERS_TOUCH",20)
end
function LuaQ_425072_PLIERS_TOUCH()
	AddBuff(OwnerID(),621978,0,-1)
end

function LuaQ_425072_HAMMER_BUFF()
	AddBuff(OwnerID(),621979,0,-1)
	LuaQ_425072_TOOL_0()
end
function LuaQ_425072_PLIERS_BUFF()
	AddBuff(OwnerID(),621980,0,-1)
	LuaQ_425072_TOOL_0()
end

-------------------------------------------------
function Lua_Z31_LIGHT_BUFF()	--副本內用的光罩
	AddBuff(OwnerID(),622195,0,-1)
end

function LuaQ_Z31_mortania_npc_1()	--老人說故事
	local NPCA = OwnerID()
	local NPCB = Lua_CreateObjByDir( NPCA , 120590 , 25 , 0);
	local NpcROOMID=ReadRoleValue(NpcA,EM_RoleValue_RoomID)
	AddToPartition(NpcB,NpcROOMID)
	while true do
		NpcSay(NPCB,"[SC_Z31_NPCSAY_01]")
		sleep(30)		
		NpcSay(NPCA,"[SC_Z31_NPCSAY_02]")
		sleep(30)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_03]")
		sleep(30)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_04]")
		sleep(50)
		NpcSay(NPCB,"[SC_Z31_NPCSAY_05]")
		sleep(10)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_06]")
		sleep(50)
		NpcSay(NPCB,"[SC_Z31_NPCSAY_07]")
		sleep(50)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_08]")
		sleep(40)
		NpcSay(NPCB,"[SC_Z31_NPCSAY_09]")
		sleep(10)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_10]")
		sleep(20)
		NpcSay(NPCB,"[SC_Z31_NPCSAY_11]") --等等！我換一本記錄本，我要將你們的歷史完全記錄下來...可以繼續了。
		sleep(10)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_12]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_13]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_14]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_15]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_16]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_17]")
		sleep(40)
		NpcSay(NPCB,"[SC_Z31_NPCSAY_18]")
		sleep(30)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_19]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_20]")
		sleep(40)
		NpcSay(NPCA,"[SC_Z31_NPCSAY_21]")
		sleep(300)
	end
end

function LuaQ_425082_END()
	local Npc = OwnerID()
	local player = TargetID()
	AddBuff(player,622261,0,-1)

	Sleep(10)
	local Actor=Lua_DW_CreateObj( "flag" , 120656 , 781077, 23 , 1 , 1 )
	DW_Move("flag",Actor,781077,24)
	YELL(Actor,"[SC_422666]",2)
	sleep(25)
	DelObj(Actor)
	sleep(5)
	CancelBuff(player,622261)
end

function LuaQ_425081_ACCEPT()
	local PLAYER = TargetID()
	local Npc = OwnerID()
	sleep(10)
	CastSpell(Npc,PLAYER,850034)
end

function LuaS_Z31_HammerSet()
	while true do
	AttachCastMotionTool( OwnerID(), 213258 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN)
	Sleep(80)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_END)
	sleep(20)
	end
end

function LuaS_Z31_PickaxeSet()
	while true do
	AttachCastMotionTool( OwnerID(), 210327 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN)
	Sleep(80)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_END)
	sleep(20)
	end
end

function LuaS_Z31_cast_show()
	CastSpell(OwnerID(),OwnerID(),850046)
end

function LuaQ_424189_ChangeZone()
	ChangeZone( OwnerID() , 2 , 0, 2298, 0, 1153, 39)
	SetFlag(OwnerID(),541314,1)
end

function LuaS_120696_Speaking()
	local player = OwnerID()
	local Npc = TargetID()
	local prace = ReadRoleValue(player,EM_RoleValue_RACE)
	if prace == 2 and CheckFlag(player,540195)==false then
		SetSpeakDetail(player,"[SC_120696_1]")
		AddSpeakOption(player,npc,"[SC_120696_3]","LuaS_Drawf_GoHomeSkill",0)	
	elseif prace == 2 and CheckFlag(player,540195)==true then
		SetSpeakDetail(player,"[SC_120696_2]")
	else
		SetSpeakDetail(player,"[SC_120696_0]")
	end

end

function LuaS_Drawf_GoHomeSkill()
	local player = OwnerID()
	CloseSpeak(player)
	CastSpell(player,player,491008)
	ScriptMessage(player,player,0,"[SC_120696_4][$SETVAR1=".."[".."540195".."]".."]",0)
	ScriptMessage(player,player,2,"[SC_120696_4][$SETVAR1=".."[".."540195".."]".."]",0)
	SetFlag(player,540195,1)
end

function LuaS_120697_Speaking()
	local player = OwnerID()
	local Npc = TargetID()
	local NOrgid = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	local prace = ReadRoleValue(player,EM_RoleValue_RACE)
	if prace == 2 and CheckFlag(player,540195)==false then
		SetSpeakDetail(player,"[SC_120696_5]")
		AddSpeakOption(player,npc,"[SO_110266_3]","LuaS_Drawf_GoHomeSkill",0)	
	elseif prace == 2 and CheckFlag(player,540195)==true then
		SetSpeakDetail(player,"[SC_120696_6]")
	else
		SetSpeakDetail(player,"[SC_120696_7][$SETVAR1=".."["..NOrgid.."]".."]")
	end

end