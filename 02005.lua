
DW_Boss_State_A={}
--�j���s
function DW_Boss_State_A.update(ThisObj) 
	local stateA=FSM_GetState(ThisObj,"A")
	stateA.Time=stateA.Time +1 
	if	stateA.Time > 5	then
		return "B"
	end
	sleep(10)
end


function DW_Boss_State_A.enter(ThisObj) 
DeBugMSG(0,0,"Now I'm A")
     	local stateA=FSM_GetState(ThisObj,"A")
	stateA.Time=0;
end


DW_Boss_State_B={}
function DW_Boss_State_B.update(ThisObj)
	local stateB=FSM_GetState(ThisObj,"B")
	stateB.Time = stateB.Time + 1
	if	stateB.Time>5	then
		return "A"
	end
	sleep(10)
end

function DW_Boss_State_B.enter(ThisObj) 
DeBugMSG(0,0,"Now I'm B")
     	local stateB=FSM_GetState(ThisObj,"B")
	stateB.Time=0;
end


DW_Boss_AI_Executer={}


--------------------------------------------------------------
function Lua_DW_BossAILoop()
--�ŧi�N���������q�@������
	local State={}

	State["A"]=DW_Boss_State_A;
	State["B"]=DW_Boss_State_B;
--�O������̪�ID
	local OwnerID=OwnerID();

--��l�ƶǭȰʧ@
	local ThisObj=FSM_Initial(OwnerID,State);

--�O���M�ݪ�AI����
	DW_Boss_AI_Executer[OwnerID]=ThisObj

--AI�̪�l�N�q���@�Ӷ��q�}�l����
	FSM_DoTransion(ThisObj,"A")


--�j��ʧ@
	while	true	do 
		sleep(5)
		FSM_Update(ThisObj);
	end
end

