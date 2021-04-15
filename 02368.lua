function kg_fsm104590_Skillinfo()
	local Skill={	{ 496931,0,"" },				--1. 獅子放血
			{ 496932,0,"" },				--2. 獅子破假
			{ 496933,0,"" },				--3. 獅子AE
			{ 496934,3,"[SC_104590_04]" },		--4. 普通衝鋒
			{ 496936,400,"[SC_104590_05]" },	--5. 鞭打獅子
			{ 496937,0,"[SC_104590_06]" },		--6. 重擊動作
			{ 496245,8,"[SC_104590_07]" },		--7. 鐵鍊纏繞
			{ 496938,49,"[SC_104590_08]" },	--8. 4秒扇形
			{ 496940,3,"" },				--9. 獅子纏身
			{ 497444,14,"[SC_104590_09]" }		--10. 狂野怒擊
			}
	return Skill
end

function kg_fsm104590_Buffinfo()
	local Buff={	{508551,20},	--獅子加速
			{508555,50}	--訓獸師狂暴
			}
	return Buff
end

function kg_fsm104590_CtrlInit()
	local Oid=OwnerID()
	local Ctrl = kg_Role:new( Oid, kg_fsm104590_FSMinit(Oid) )
	kg_BossGV[ "Zone136_Boss2_"..Ctrl:RoomID() ]=kg_fsm104590_CreateBoss(Ctrl)
	Ctrl.bUpdate=true
	Ctrl:Say("My Gid="..Ctrl.Gid)
	Ctrl.Boss:Say("BossGid="..Ctrl.Boss.Gid )
	Ctrl.Lion:Say("LionGid="..Ctrl.Lion.Gid )
	FSM_DoTransion(Ctrl,"idle")
	while Ctrl.bUpdate do
		FSM_Update(Ctrl)
		Sleep(10)
	end
end

function kg_fsm104590_FSMinit( Gid )--建立FSM類別
	local state={}
	state["idle"]=kg_fsm104590_IdelAIinit()
	state["battle"]=kg_fsm104590_BattleAIinit()
	local Obj = FSM_Initial(Gid,state)
	return Obj
end

function kg_fsm104590_CreateBoss(Ctrl)
	Ctrl.FlagID = 780862
	Ctrl.Skill = kg_fsm104590_Skillinfo()
	Ctrl.Buff = kg_fsm104590_Buffinfo()
	DebugMsg(0,0,"Skill OK")
	
	local ExitDoor = CreateObjByFlag( 103126, Ctrl.FlagID , 1 , 1 )--出口阻擋門
	kg_DoorInit( ExitDoor  )
	WriteRoleValue(ExitDoor,EM_RoleValue_LiveTime,10)
	AddToPartition(ExitDoor,Ctrl:RoomID() )
	Ctrl.ExitDoor = ExitDoor
	DebugMsg(0,0,"Door OK")
	
	local Boss = kg_role:new( kg_GetPosRX( {Ctrl.FlagID,2} , 104590,20,0,90,-3 ) )
	Boss:ModeEx(EM_SetModeType_Revive,false)
	--Boss:SetLiveTime(60)
	Boss:Reg( 1,Ctrl.Gid )
	Boss:AddToPartition(Ctrl:RoomID())
	Boss:SetDeadPlot("")
	Ctrl:Say("CtrlGid="..Ctrl.Gid)
	Boss:Say("BossGid="..Boss.Gid)
	local Lion = kg_Role:new( kg_GetPosRX({Ctrl.FlagID,2},104591,20,0,-90,-3 ) )
	Lion:ModeEx(EM_SetModeType_Revive,false)
	--Lion:SetLiveTime(60)
	Lion:Reg( 1,Ctrl.Gid )
	Lion:AddToPartition(Ctrl:RoomID())
	Lion:SetDeadPlot("")
	Lion.CrazyMode=0--狂暴模式
	
	Ctrl.Boss=Boss
	Ctrl.Lion = Lion
	Ctrl.AtkRange={}--範圍內玩家
	return Ctrl
end

function kg_fsm104590_IdelAIinit()
	local IdelAI={}
	function IdelAI.enter(this)
		local tempString = "EnterIdle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
	end
	function IdelAI.leave(this)
		local tempString = "LeaveIdle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
	end
	function IdelAI.update(this)
		local tempString = "UpdateIdle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
		if this.Boss:InBattle()==true then
			return "battle"
		end
	end
	return IdelAI
end

function kg_fsm104590_BattleAIinit()
	local BattleAI={}
	function BattleAI.enter(this)
		local tempString = "EnterBattle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
	end
	function BattleAI.leave(this)
		local tempString = "LeaveBattle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
	end
	function BattleAI.update(this)
		local tempString = "UpdateBattle"
		this.Boss:Say(tempString)
		this.Lion:Say(tempString)
		DebugMsg(0,0,tempString)
		if this.Boss:InBattle()~=true then
			return "idle"
		end
	end
	return BattleAI
end