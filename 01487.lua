--�񳴨����_��	422517 ���Ƚs��
function LuaS_422517_0() --���~�ˬd
	local QIN = 6
	local MID = 617
DeBugMSG(0,0,GetDistance(OwnerID(),TargetID()))
	--�ˬd�O�_���|�٧�
--	if	not DW_CheckMap(OwnerID(),MID)	then
--		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_2]", 0 )
--		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_2]", 0 )
--		return false
--	end
	--�O�_�w�g����
	if	CountBodyItem(OwnerID(),205524) >= QIN	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_3]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_3]", 0 )
		return false
	end
	--�O�_�w�g�ιL�@���F�H
	if	CheckBuff(OwnerID(),503980)	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422517_4]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422517_4]", 0 )
		return false
	end
	--�O�_�b�԰���
	if	HateListCount(OwnerID()) > 0	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 )
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
		return false
	end
end

function LuaS_422517_1() --�ϥΪ��~
	--�إX���~
	local Trap = Lua_DW_CreateObj("obj",113211,OwnerID())
	--������A
	AddBuff(OwnerID(),503980,1,-1)
	--�O�����a��ID
	WriteRoleValue(Trap,EM_RoleValue_PID,OwnerID())
	--��loop�P�_�@��
	BeginPlot(Trap,"LuaS_422517_2",0)--�ͦs
	BeginPlot(Trap,"LuaS_422517_4",0)--�@����t
end

function LuaS_422517_2() --loop�P�_�O�_���Ӯ������@��
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	--����O�_���ؼЪ�


	while true do
		sleep(10)
	--�D�H�O�_���`�ΤU�u
		if	not CheckID(Master)	then
			DelObj(OwnerID())
		end
		if	ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	--�D�H�O�_�ӻ�
		if	not	CheckDistance( OwnerID(), Master , 300 )	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	end
end

function LuaS_422517_3()
--�קK����Ĳ�o
	SetPlot(TargetID(),"touch","",0)
--Ĳ�I�̬O�_�MPID�k�X
	if	OwnerID() ~= ReadRoleValue(TargetID(),EM_RoleValue_PID)	then
		SetPlot(TargetID(),"touch","LuaS_422517_3",50)--���X���ܭn���ɦ^Ĳ�I�@��
		return
	end
--���X���~
	GiveBodyItem(OwnerID(),205524,1)
--�R���ۤv
	DelObj(TargetID())
end

function LuaS_422517_4() -- �j�M�ީǪ�����
	local NPC,Tar
	local Monster = 102233
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(20)
--�j�M����NPC
		NPC = SearchRangeNPC (OwnerID(),150)
		for i=0,table.getn(NPC)	do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Monster	and
				ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode) == 0	then
--�o�{���ŦX���ǥB���b�԰������� �N���O�UID
				Tar = NPC[i]
--�R�O����
				BeginPlot( Tar,"LuaS_421097_2",0)
--�إ߷s������	&�}�Ҷ]�B
				local StandIn = Lua_DW_CreateObj("obj",Monster,Tar)
				WriteRoleValue(StandIn,EM_RoleValue_LiveTime,60)
				WriteRoleValue(StandIn,EM_RoleValue_IsWalk,0)
				Hide(StandIn)
				Show(StandIn,0)
				sleep(20)
				Say(StandIn,"[SC_422517_0]")
--�����԰�
				SetFightMode ( StandIn , 0, 1, 0, 0 )
--�s�����L��
				FaceObj( StandIn, OwnerID() )

--���쥦���i30�H��
				while	CheckDistance( OwnerID(), StandIn , 25 )==false	do
					sleep(10)
				end
--���x��
				WriteRoleValue(StandIn,EM_RoleValue_IsWalk,1)
				Hide(StandIn)
				Show(StandIn,0)
				sleep(20)
				PlayMotion ( StandIn, ruFUSION_ACTORSTATE_HURT_NORMAL ) --����~
				Say(StandIn,"[SC_422517_1]")
--�ܦ��i�H�ߪ����A
				SetPlot(OwnerID(),"touch","LuaS_422517_3",50)
--�\�����a������A
				CancelBuff(Master,503980)
--�s�L�k��
				BeginPlot( StandIn,"LuaS_422517_5",0)
				WriteRoleValue(StandIn,EM_RoleValue_LiveTime,3)
				sleep(20)
				DelObj(StandIn)
				return
			end
		end
	end
end

function LuaS_422517_5() 
	DW_MoveToFlag( OwnerID() , 780088 , 1 , 0 ,1)
	DelObj(OwnerID())
end


--�ߥۤީ��B��



function LuaS_422518_0()--�ϥ��ˬd
	local List = {102230,102231,102232,102233,102234}
	for i = 1,table.getn(List)	do
		if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == List[i]		then
			--�T�wOrgID�ŦX
			if	ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode) == 1	then --�ۤvmust�D�԰�
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
				return false
			end
			if	ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode) == 1	then --�ؼ�must�D�԰�
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204638_3]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204638_3]", 0 )
				return false
			end
			if	not	CheckDistance(TargetID(),OwnerID(),200)	then --must����
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204637_2]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204637_2]", 0 )
				return false
			end
			if	CheckBuff(TargetID(),503985)	then -- �A�i�Ӥ�
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422518_2]", 0 )
				ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422518_2]", 0 )
				return false
			end
			if	CountBodyItem(OwnerID(),205562) > 7	then --�Ф��ݱ�
				return false
			end
			return true
		end
	end
--OrgID�����T
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_204425_1]", 0 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_1]", 0 )
	return false
end

function LuaS_422518_1()--�ϥΪ��~
	--�����Y�ʧ@
	CastSpell(OwnerID(),TargetID(),493646)
	--�R�O�ؼкt��
	BeginPlot(TargetID(),"LuaS_422518_2",0)
end

function LuaS_422518_2() --�t������Y
	sleep(10)
	Say(OwnerID(),"[SC_422518_0]")
	sleep(10)
	CastSpell(OwnerID(),TargetID(),493647)
	AddBuff(OwnerID(),503985,1,-1)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_422518_1]", 0 )
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_422518_1]", 0 )
	GiveBodyItem(TargetID(),205562,1)
end
