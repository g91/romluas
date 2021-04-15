
DW_Boss_State_A={}
--迴圈更新
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
--宣告將對應的階段共為哪些
	local State={}

	State["A"]=DW_Boss_State_A;
	State["B"]=DW_Boss_State_B;
--記錄執行者的ID
	local OwnerID=OwnerID();

--初始化傳值動作
	local ThisObj=FSM_Initial(OwnerID,State);

--記錄專屬的AI執行
	DW_Boss_AI_Executer[OwnerID]=ThisObj

--AI最初始將從哪一個階段開始執行
	FSM_DoTransion(ThisObj,"A")


--迴圈動作
	while	true	do 
		sleep(5)
		FSM_Update(ThisObj);
	end
end

