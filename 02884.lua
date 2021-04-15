function LuaS_PID_SPEAK()
	local Player = OwnerID()
	local Npc = TargetID()
	local NPID = ReadRoleValue(Npc,EM_RoleValue_PID)
	local NOrgid = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	SetSpeakDetail(Player ,"[".."SC_Z26_GEM_NPC_"..NPID.."]")
end

function LuaM_Z26_undeadPatrol_matrix()

--		<<座標 Matrix 資料代表位置的示意圖>>
-- [1]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [2]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
-- [3]		[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
--               		                :
-- [Count]	[-Count/2... -2 , -1 , 0 , 1 , 2 ... Count/2]
	local dis = 15
	local count = 3 --陣列的大小，輸入3 會是 3*3 的陣列；不過因為行數必須為奇數，所以輸入 4 會是 5*4 的陣列。
	local checktime = 5 --判斷的時間間距，數值愈低，判斷的頻率愈高，愈自然，但耗的資源也愈多
	local ReviveTime = -1  --當陣列中的物件全部消失時，進行陣列重置的動作，如果填 -1 ，就會按照 OwnerID() 設定的重生時間重置
	local circle = 6000  --多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	local CtrlPid =  ReadRoleValue(OwnerID(),EM_RoleValue_PID)
--建立這個陣列
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 

--建立一個 table，在想產生物件的位置用 LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) 產生物件。 其中四個數值依序代表 1.要生成的物件ID 2.作為基準的陣列 3.列位置 4.行位置
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(107746,Matrix,1, 0 )
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(107747,Matrix,2, 1 )
	ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(107747,Matrix,2, -1 )
	for i=0,2 do
		CastSpell( ObjMatrix[i+1], ObjMatrix[i+1], 494474)
	end
--	if CtrlPid == 0 then 
--		CallPlot(OwnerID(),"Z25_Patrol_Group_1",ObjMatrix)
--	elseif CtrlPid == 1 then 
--		CallPlot(OwnerID(),"Z25_Patrol_Group_2",ObjMatrix)
--	end
--物件的 PID 以及 MONEY 將作為一開始儲存資料所用，如果要變更內部的值，請至少 sleep( checktime )

--由迴圈函式讀入資料，來控制所有陣列中的物件移動
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 
	--五個數值順序為 1.建立的物件所在TABLE 2.建立的陣列 3.間距 4.陣列的大小 5.判斷的時間 6.多少週期完整重生一次，如果填 0 ，則只有當所有物件消失才進行重生
	--PS.如果設定物件 NPC 身上有掛 SCRIPT，則週期不為 0 時 ，NPC 重生後將不會自動掛 SCRIPT
--將參考物件設定回原來的出生點
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--要求重新執行初始劇情
	BeginPlot( OwnerID() , "LuaM_Z26_undeadPatrol_matrix" , 0 )

end

function LuaM_Z26_undeadPatrol_Reset()
	sleep( 10 )
	BeginPlot( OwnerID() , "LuaM_Z26_undeadPatrol_matrix" , 0 )
end

function Z26_Patrol_mount()
	local pat = OwnerID() 
	AddBuff( pat , 505113, 0 , -1 )	
end

function LuaS_Youngwolf_calling()					--產生怪物，小狼叫媽媽
	local ctrl = OwnerID()
	local player = TargetID()
	local RoomID = ReadRoleValue(ctrl,EM_RoleValue_RoomID)
	local wolf = Lua_CreateObjByDir( ctrl , 107744 , 80 , 0)
	AddToPartition(wolf,RoomID)
	--SetAttack( wolf , player ) 
	CallPlot(wolf,"LuaS_wolfmama_die",wolf)
end

function LuaS_wolfmama_die(wolf)					--No target then delobj
	local mahate = 0
	while true do
		Sleep(30)
		mahate = HateListCount(wolf)
		if mahate == 0 then
			DelObj(wolf)
		end
	end
end

function Lua_Z26_lock_Dragon()
	local Center = OwnerID()
	PlayMotionEX( Center , ruFUSION_ACTORSTATE_SLEEP_BEGIN,ruFUSION_ACTORSTATE_SLEEP_LOOP)
	local X = ReadRoleValue(Center,EM_RoleValue_X)
	local Y = ReadRoleValue(Center,EM_RoleValue_Y)
	local Z = ReadRoleValue(Center,EM_RoleValue_Z)
	local T1_XYZ = { X+80 , Y , Z+80 }
	local T2_XYZ = { X+80 , Y , Z-80 }
	local T3_XYZ = { X-80 , Y , Z-80 }
	local T1 = Lua_DW_CreateObj( "xyz" , 107704 , T1_XYZ , 1 , 180 , 1 )
	local T2 = Lua_DW_CreateObj( "xyz" , 107704 , T2_XYZ , 1 , 180 , 1 )
	local T3 = Lua_DW_CreateObj( "xyz" , 107704 , T3_XYZ , 1 , 180 , 1 )
	AdjustFaceDir(T1,Center,330)
	AdjustFaceDir(T2,Center,240)
	AdjustFaceDir(T3,Center,120)
	AddBuff(Center,624150,0,-1) 
--	while CheckID(Center)~=0 do
		SysCastSpellLv(T1,Center,850741,0) 
		SysCastSpellLv(T2,Center,850741,0) 
		SysCastSpellLv(T3,Center,850741,0)
--		Sleep(100)
--	end
end

function Lua_Z26_firebox()
	CastSpell(OwnerID(),OwnerID(),850812)
	return true
end

function LuaQ_426174_letter()
	local Str = "["..GetUseItemGUID(OwnerID()).."]"		
	ClearBorder( OwnerID());			--初始化石碑介面
	AddBorderPage( OwnerID(), GetQuestDetail( 426174, 1 ) )
	if CheckCompleteQuest(OwnerID(),426173)==true or CheckAcceptQuest(OwnerID(),426173)==true  then
		ShowBorder( OwnerID(),426174, str,"ScriptBorder_Texture_Paper" )
	else
		ScriptMessage(OwnerID(), OwnerID(), 0,"[SYS_GAMEMSGEVENT_422]", 0 )	
	end
end

function LuaQ_426176_UseCheck()   --驅邪晶石判斷
	local player = OwnerID()
	local Npc = TargetID()
	local TOrg = ReadRoleValue(Npc ,EM_RoleValue_OrgID)
	local THP = ReadRoleValue(Npc ,EM_RoleValue_HP)
	local TMaxHP = ReadRoleValue(Npc ,EM_RoleValue_MaxHP)
	local TDeath = ReadRoleValue(Npc ,EM_RoleValue_IsDead)
	local TargetCheck = 0
	local hpcount = 0
	local TargetMonster = {}
		TargetMonster[107742]=242062;

		if CheckAcceptQuest(player ,426176)== true and TOrg==107742  then
			TargetCheck = TargetCheck +1
		end
		if TDeath == 1 then
			ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif   (THP/TMaxHP) <= 0.3   then
			hpcount  = hpcount +1 
		end
		if TargetCheck==1 and hpcount==1 then
			return true
		elseif TargetCheck~=1 then
	 		   ScriptMessage( player, player, 2,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		elseif hpcount~=1 then
		 	   ScriptMessage( player, player, 2,"[SYS_GAMEMSGEVENT_422]", 0 )
			return false
		end
end

function LuaQ_426176_Used()		--使用驅邪晶石後
	local player = OwnerID()
	local Npc = TargetID()
	local questitem = 107737
	local TOrg = ReadRoleValue(Npc,EM_RoleValue_OrgID)
	if TOrg == 107742  then
		CallPlot( player,"DW_QietKillOne",player,questitem)
		CallPlot( Npc,"LuaQ_426176_Show_1",Npc)
		CallPlot( Npc, "LuaFunc_ResetObj",Npc )
	end
end

function LuaQ_426176_Show_1(Npc)	--產生古林守護者
	local RoomID = ReadRoleValue(Npc,EM_RoleValue_RoomID)
	local Bman = CreateObj_ByObjPoint(Npc,107741,"p_down") 
	SetModeEx(Bman,EM_SetModeType_Gravity,true)
	SetModeEx(Bman,EM_SetModeType_fight,false)
	AddToPartition(Bman,RoomID)
	CallPlot( Bman,"LuaQ_426176_Show_2",Bman)
end

function LuaQ_426176_Show_2(Bman)	--守護者說話，消失
	Sleep(10)
	npcsay(Bman,"[SC_422474_1]")
	Sleep(10)
	DelObj(Bman)
end

function lua_Z26firetool_Bombing()--指定砲擊目標後劇情
	local firetool = OwnerID()
	local tmp_m = {}
	local monster = 0
	while true do
		--找編號107513
		tmp_m = SearchRangeNPC ( firetool, 300 )
		for i=0,#tmp_m do
			if ReadRoleValue( tmp_m[i] ,EM_RoleValue_OrgID ) == 106547 then
				monster = tmp_m[i]
				break
			end
		end
		if  monster == 0 then
			Sleep( 180)
		else
			AdjustFaceDir( firetool, monster , 0 ) --面向
			sleep(10)
			sleep(5)
		--	PlaySound( Firetool, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
			PlayMotion( Firetool, 161)  --Buff0
		
			sleep(15)
		
			CastSpelllv( firetool , monster , 850757 , 1 )
			Sleep(180)
		end
	end
end

function LuaQ_426177_speak()	--薩菲琳占卜
	local player = OwnerID()
	local Npc = TargetID()
	if CheckAcceptQuest(player,426177)==true and CountBodyItem(player,242584)>=10 and checkFlag(player,548062)==false then
		AddSpeakOption(player,npc,"[SC_426177_00]","LuaQ_426177_say",0)
	end
	LoadQuestOption(player)
end

function LuaQ_426177_say()
	local player = OwnerID()
	local Npc = TargetID()
	SetSpeakDetail(player,"[SC_426177_01]")
	SetFlag(player,548062,1)
end

function LuaQ_426178_accept()	--接受任務菲薩琳飛走
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Bman = CreateObj_ByObjPoint(OwnerID(),122208,"p_down") 
	AddToPartition(Bman,RoomID)
	Sleep(10)
	DW_Move("flag",Bman,781000,0)
	Sleep(10)
	DelObj(Bman)
end

function LuaQ_122251_place()
	local Npc = OwnerID()
	AddBuff(Npc,621268,0,-1)
end

function LuaQ_426178_msg()
	local player = OwnerID()
	ScriptMessage(player,player,0,"[SC_426178_0]",1)
	return true
end

function LuaGem_Talk_Art()				--雅提斯特朵
	local Player = OwnerID()
	local NPC = TargetID()

--	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player, 426220 )==true			and
		CountBodyItem(Player, 242670)<1				then
			AddSpeakOption(Player, NPC , "[SC_MOREITEM][$SETVAR1=".."[".."242670".."]".."]","LuaGem_reTake_Art", 0)
	end		
	LoadQuestOption(Player)
end

function LuaGem_reTake_Art()
	local Player = OwnerID()
	local NPC = TargetID()

	CloseSpeak(Player)
	GiveBodyitem( Player, 242670, 1 )

end

function Lua_426220_finish()
	local ShowFlag = 780950
	local player = TargetID()
	local Npc = OwnerID()
	local doctor = Lua_DW_CreateObj( "obj",122397,Npc ,1 , 1)
	say(doctor,"[SC_426220_0]")
	sleep(10)
	DW_Move("flag",doctor ,ShowFlag,0)
	sleep(10)
	DelObj(doctor)
end

--z26,平衡瞰台守衛，掛在戰鬥開始時，呼叫同伴攻擊
function lua_z26useCallMeFrieds()	
	local friends=SearchRangeNPC(OwnerID(),150)
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==107749 then
			SetAttack(friends[i],TargetID())
		end
	end
end
--z26,經過平衡瞰台時的判定條件，如果沒解主線的話，會被殺
function lua_z26youCannotPassLa1()
	SetPlot( OwnerID(),"range","lua_z26youCannotPassLa2",100 ) 
end


--z26,經過平衡瞰台時的判定條件，如果沒解主線的話，會被殺，放大妖精身上，有BUFF還是會被發現
function lua_z26youCannotPassLa0()
	SetPlot( OwnerID(),"range","lua_z26youCannotPassLa3",80 ) 
end

function lua_z26youCannotPassLa2()
	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)
	if PlayerJob==0		then			--排除GM
		return
	end
	if CheckCompleteQuest( OwnerID(),426218 ) or CheckBuff(OwnerID(),624401) then
		return
	end
	local friends=SearchRangeNPC(TargetID(),150)

	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==107749 then
			SetAttack(friends[i],OwnerID())
		end
	end
end

function lua_z26youCannotPassLa3()
	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)
	if PlayerJob==0		then			--排除GM
		return
	end
	if CheckCompleteQuest( OwnerID(),426218 )==true then
		--Say(OwnerID(),"1")
		return
	end
	Yell(TargetID(),"[SC_102969_13]",2)
	local friends=SearchRangeNPC(TargetID(),150)
		--Say(TargetID(),"2")
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==107749 then
			SetAttack(friends[i],OwnerID())
		end
	end
end

function Lua_426216_finish()
	AddBuff(TargetID(),624401,0,-1)
end

function LuaGem_Talk_InK()				--穎克兒放護盾
	local Player = OwnerID()
	local NPC = TargetID()

--	LoadQuestOption(Player)
	if	CheckCompleteQuest( OwnerID(),426216 )==true		and
		CheckCompleteQuest( OwnerID(),426218 )==false              and
		CheckBuff(Player, 624401)==false			then
			AddSpeakOption(Player, NPC , "[SC_426216_RETAKE]","LuaGem_reTake_Ink", 0)
	end		
	LoadQuestOption(Player)
end

function LuaGem_reTake_Ink()
	local Player = OwnerID()
	local NPC = TargetID()
	--CastSpell(Player,Player,492507)
	AddBuff(Player,624401,0,3600)
	CloseSpeak(Player)
end

function LuaGem_Ink_CancelBuff()
	local Player = OwnerID()
	if CheckAcceptQuest(Player, 426217)==true or CheckAcceptQuest(Player, 426218)==true then
		return	
	else
 		CancelBuff(Player,624401)
	end
end


function Lua_426218_finish()
	local Player = TargetID()
	CancelBuff(player,624401)	
end

function Lua_107789_set()
	AddBuff(OwnerID(),624150,0,-1) 
end