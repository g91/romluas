function kg_fsm104590_Skillinfo()
	local Skill={	{ 496931,0,"" },				--1. ��l���
			{ 496932,0,"" },				--2. ��l�}��
			{ 496933,0,"" },				--3. ��lAE
			{ 496934,3,"[SC_104590_04]" },		--4. ���q�ľW
			{ 496936,400,"[SC_104590_05]" },	--5. �@����l
			{ 496937,0,"[SC_104590_06]" },		--6. �����ʧ@
			{ 496245,8,"[SC_104590_07]" },		--7. �K����¶
			{ 496938,49,"[SC_104590_08]" },	--8. 4����
			{ 496940,3,"" },				--9. ��l��
			{ 497444,14,"[SC_104590_09]" }		--10. �g������
			}
	return Skill
end

function kg_fsm104590_Buffinfo()
	local Buff={	{508551,20},	--��l�[�t
			{508555,50}	--�V�~�v�g��
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

function kg_fsm104590_FSMinit( Gid )--�إ�FSM���O
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
	
	local ExitDoor = CreateObjByFlag( 103126, Ctrl.FlagID , 1 , 1 )--�X�f���ת�
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
	Lion.CrazyMode=0--�g�ɼҦ�
	
	Ctrl.Boss=Boss
	Ctrl.Lion = Lion
	Ctrl.AtkRange={}--�d�򤺪��a
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