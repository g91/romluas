
function LuaS_103120_PE_DW_00()
--�ŧi  PE���ޭ�
	local PE_Index = 1
--���q���ޭȫŧi
	local Phase = {100,200,300,400,500}
	Phase[0] = 0
	local PH_Fixed = 50
--�ŧi  �ϰ�a�ϸ��X
	local MapID = 1


--�ŧi�r��}�C��
	local PEString = {}
	PEString[1000] = {"SC_103120_1000_NAME","SC_103120_1000_DESCRI"}--PE�W��

	PEString[0] = {"SC_103120_0_NAME","SC_103120_0_DESCRI"}
	PEString[1] = {"SC_103120_1_NAME","SC_103120_1_DESCRI"}

	PEString[50] = {"SC_103120_50_NAME","SC_103120_50_DESCRI"}
	PEString[51] = {"SC_103120_51_NAME","SC_103120_51_DESCRI"}

	PEString[100] = {"SC_103120_100_NAME","SC_103120_100_DESCRI"}
	PEString[101] = {"SC_103120_101_NAME","SC_103120_101_DESCRI"}
	PEString[102] = {"SC_103120_102_NAME","SC_103120_102_DESCRI"}
	PEString[103] = {"SC_103120_103_NAME","SC_103120_103_DESCRI"}
	PEString[104] = {"",""}
	PEString[105] = {"",""}

	PEString[200] = {"SC_103120_200_NAME","SC_103120_200_DESCRI"}
	PEString[201] = {"SC_103120_201_NAME","SC_103120_201_DESCRI"}
	PEString[202] = {"SC_103120_202_NAME","SC_103120_202_DESCRI"}
	PEString[203] = {"SC_103120_203_NAME","SC_103120_203_DESCRI"}
	PEString[204] = {"",""}
	PEString[205] = {"",""}

	PEString[300] = {"SC_103120_300_NAME","SC_103120_300_DESCRI"}
	PEString[301] = {"SC_103120_301_NAME","SC_103120_301_DESCRI"}
	PEString[302] = {"SC_103120_302_NAME","SC_103120_302_DESCRI"}
	PEString[303] = {"SC_103120_303_NAME","SC_103120_303_DESCRI"}
	PEString[304] = {"",""}
	PEString[305] = {"",""}

	PEString[400] = {"SC_103120_400_NAME","SC_103120_400_DESCRI"}
	PEString[401] = {"SC_103120_401_NAME","SC_103120_401_DESCRI"}
	PEString[402] = {"SC_103120_402_NAME","SC_103120_402_DESCRI"}
	PEString[403] = {"SC_103120_403_NAME","SC_103120_403_DESCRI"}
	PEString[404] = {"",""}
	PEString[405] = {"",""}

	PEString[500] = {"SC_103120_500_NAME","SC_103120_500_DESCRI"}
	
--PE�򥻬[�c
	PE_AddPE(PEString[1000][1],PEString[1000][2],PE_Index,0)--�إ�
	PE_AddRegion(PE_Index,MapID)--���U�a�Ͻs��

--���q�[�c��
	PE_AddPhase(PE_Index,Phase[0],PEString[Phase[0]][1],PEString[Phase[0]][2],0,1,1,0)
	PE_AddPhase(PE_Index,PH_Fixed,PEString[PH_Fixed][1],PEString[PH_Fixed][2],0,1,1,0)

	for i=1,5,1 do
		PE_AddPhase(PE_Index,Phase[i],PEString[Phase[i]][1],PEString[Phase[i]][2],0,1,1,0)
	end

--����ŧi��
	local Condition = {}
	Condition[Phase[0]] = {1200}--���m�ɶ�(��)
	Condition[PH_Fixed] = {20}
	Condition[Phase[1]] = {240,800,240,10,75}
	Condition[Phase[2]] = {240,800,240,10,75}
	Condition[Phase[3]] = {240,400,240,10,75}
	Condition[Phase[4]] = {240,400,800,10,75}
	Condition[Phase[5]] = {240,400,800,240}

--�ؼЬ[�c��
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[0],Phase[0]+1,PEString[Phase[0]+1][1],PEString[Phase[0]+1][2],"ReSetTime",Condition[Phase[0]][1]*1000,0,0)--���m���q
	PE_PH_AddObjective_Greater(PE_Index, PH_Fixed,PH_Fixed+1 ,PEString[PH_Fixed+1][1] , PEString[PH_Fixed+1][2], "EricTouchAmount", 0, Condition[PH_Fixed][1], true) --��O�JĲ�o�S�w���� �h�i�J�U�@���q
--Phase[1]
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[1],Phase[1]+1,PEString[Phase[1]+1][1],PEString[Phase[1]+1][2],"TakeSource",Condition[Phase[1]][1]*1000,0,0)--�g�L�ɶ�(�|�Y�u)
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[1],Phase[1]+2,PEString[Phase[1]+2][1],PEString[Phase[1]+2][2],"GetSource",0,Condition[Phase[1]][2],0)--���a�Ķ��귽�F���q
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[1],Phase[1]+3,PEString[Phase[1]+3][1],PEString[Phase[1]+3][2],"KillSanction",0,Condition[Phase[1]][3],0)--��������̹F���q
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+4,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",100,Condition[Phase[1]][4],0)--�NBoss����q������10%�H�U
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+5][1],PEString[Phase[1]+5][2],"ResidualHP",100,Condition[Phase[1]][5],0)
--Phase[2]
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[2],Phase[2]+1,PEString[Phase[2]+1][1],PEString[Phase[2]+1][2],"PastTime",Condition[Phase[2]][1]*1000,0,0)--�g�L�ɶ�
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[2],Phase[2]+2,PEString[Phase[2]+2][1],PEString[Phase[2]+2][2],"GetSource",0,Condition[Phase[2]][2],0)--���a�Ķ��귽�F���q
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[2],Phase[2]+3,PEString[Phase[2]+3][1],PEString[Phase[2]+3][2],"KillSanction",0,Condition[Phase[2]][3],0)--��������̹F���q
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+4,PEString[Phase[2]+4][1],PEString[Phase[2]+4][2],"ResidualHP",100,Condition[Phase[2]][4],0)--�NBoss����q������10%�H�U
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+5][1],PEString[Phase[1]+5][2],"ResidualHP",100,Condition[Phase[2]][5],0)
--Phase[3]
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[3],Phase[3]+1,PEString[Phase[3]+1][1],PEString[Phase[3]+1][2],"PastTime",Condition[Phase[3]][1]*1000,0,0)--�g�L�ɶ�
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[3],Phase[3]+2,PEString[Phase[3]+2][1],PEString[Phase[3]+2][2],"TakeSource",Condition[Phase[3]][2]*1000,0,0)--�g�L�ɶ�(�|�Y�u)
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[3],Phase[3]+3,PEString[Phase[3]+3][1],PEString[Phase[3]+3][2],"KillSanction",0,Condition[Phase[3]][3],0)--��������̹F���q
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",100,Condition[Phase[3]][4],0)--�NBoss����q������10%�H�U
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+5][1],PEString[Phase[1]+5][2],"ResidualHP",100,Condition[Phase[3]][5],0)
--Phase[4]
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[4],Phase[4]+1,PEString[Phase[4]+1][1],PEString[Phase[4]+1][2],"PastTime",Condition[Phase[4]][1]*1000,0,0)--�g�L�ɶ�
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[4],Phase[4]+2,PEString[Phase[4]+2][1],PEString[Phase[4]+2][2],"TakeSource",Condition[Phase[4]][2]*1000,0,0)--�g�L�ɶ�(�|�Y�u)
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[4],Phase[4]+3,PEString[Phase[4]+3][1],PEString[Phase[4]+3][2],"GetSource",0,Condition[Phase[4]][3],0)--���a�Ķ��귽�F���q
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",100,Condition[Phase[4]][4],0)--�NBoss����q������10%�H�U
	PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+5][1],PEString[Phase[1]+5][2],"ResidualHP",100,Condition[Phase[4]][5],0)
--Phase[5]
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[5],Phase[5]+1,PEString[Phase[3]+1][1],PEString[Phase[3]+1][2],"PastTime",Condition[Phase[5]][1]*1000,0,0)--�g�L�ɶ�
	PE_PH_AddObjective_TimeLimit(PE_Index,Phase[5],Phase[5]+2,PEString[Phase[3]+2][1],PEString[Phase[3]+2][2],"TakeSource",Condition[Phase[5]][2]*1000,0,0)--�g�L�ɶ�(�|�Y�u)
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[5],Phase[5]+3,PEString[Phase[2]+2][1],PEString[Phase[2]+3][2],"GetSource",0,Condition[Phase[5]][3],0)--���a�Ķ��귽�F���q
	PE_PH_AddObjective_EqualAndGreater(PE_Index,Phase[5],Phase[5]+4,PEString[Phase[2]+3][1],PEString[Phase[2]+4][2],"KillSanction",0,Condition[Phase[5]][4],0)--��������̹F���q
--�S����O��
	for i=1,4,1 do
		PE_OB_SetVisible(PE_Index, Phase[i], Phase[i]+4, false)--���åؼ�
		PE_OB_SetVisible(PE_Index, Phase[i], Phase[i]+5, false)--���åؼ�
	end
	PE_OB_SetCallBackOnAchieve(PE_Index, "LuaS_103120_PE_DW_01")--�ؼгQ�����n���檺lua
	PE_Start(PE_Index,Phase[0])--�Ұ�PE
end

------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function LuaS_103120_PE_DW_01(PEIndex , PHIndex , OBIndex )
	Boss_103120_BonusCheck = 1
--�ŧi  PE���ޭ�
	local PE_Index = 1
--���q���ޭȫŧi
	local Phase = {100,200,300,400,500}
	Phase[0] = 0
	local PH_Fixed = 50

--�ŧi�r��}�C��
	local PEString = {}
	PEString[1000] = {"SC_103120_1000_NAME","SC_103120_1000_DESCRI"}

	PEString[0] = {"SC_103120_0_NAME","SC_103120_0_DESCRI"}
	PEString[1] = {"SC_103120_1_NAME","SC_103120_1_DESCRI"}

	PEString[50] = {"SC_103120_50_NAME","SC_103120_50_DESCRI"}
	PEString[51] = {"SC_103120_51_NAME","SC_103120_51_DESCRI"}

	PEString[100] = {"SC_103120_100_NAME","SC_103120_100_DESCRI"}
	PEString[101] = {"SC_103120_101_NAME","SC_103120_101_DESCRI"}
	PEString[102] = {"SC_103120_102_NAME","SC_103120_102_DESCRI"}
	PEString[103] = {"SC_103120_103_NAME","SC_103120_103_DESCRI"}
	PEString[104] = {"",""}

	PEString[200] = {"SC_103120_200_NAME","SC_103120_200_DESCRI"}
	PEString[201] = {"SC_103120_201_NAME","SC_103120_201_DESCRI"}
	PEString[202] = {"SC_103120_202_NAME","SC_103120_202_DESCRI"}
	PEString[203] = {"SC_103120_203_NAME","SC_103120_203_DESCRI"}
	PEString[204] = {"",""}

	PEString[300] = {"SC_103120_300_NAME","SC_103120_300_DESCRI"}
	PEString[301] = {"SC_103120_301_NAME","SC_103120_301_DESCRI"}
	PEString[302] = {"SC_103120_302_NAME","SC_103120_302_DESCRI"}
	PEString[303] = {"SC_103120_303_NAME","SC_103120_303_DESCRI"}
	PEString[304] = {"",""}

	PEString[400] = {"SC_103120_400_NAME","SC_103120_400_DESCRI"}
	PEString[401] = {"SC_103120_401_NAME","SC_103120_401_DESCRI"}
	PEString[402] = {"SC_103120_402_NAME","SC_103120_402_DESCRI"}
	PEString[403] = {"SC_103120_403_NAME","SC_103120_403_DESCRI"}
	PEString[404] = {"",""}

--����ŧi��
	local Condition = {}
	Condition[Phase[0]] = {1200}--���m�ɶ�(��)
	Condition[PH_Fixed] = {20}
	Condition[Phase[1]] = {240,800,240,10,75}
	Condition[Phase[2]] = {240,800,240,10,75}
	Condition[Phase[3]] = {240,400,240,10,75}
	Condition[Phase[4]] = {240,400,800,10,75}
	Condition[Phase[5]] = {240,400,800,240}
	local ExecuteFunc = {}
--���m�ɶ�����
	ExecuteFunc[Phase[0]+1] =	function()
						PE_JumpToPhase(PE_Index,PH_Fixed)
					end

	ExecuteFunc[PH_Fixed+1]=	function()
						local R = DW_Rand(999)%2
						PE_JumpToPhase(PE_Index, (R+1)*100)
					end


--Phase[1]
	ExecuteFunc[Phase[1]+1] =	function()
						PE_JumpToPhase(PE_Index,Phase[2])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+4,PEString[Phase[2]+4][1],PEString[Phase[2]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[2]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[1]+2] =	function()
						PE_JumpToPhase(PE_Index,Phase[3])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[3]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[1]+3] =	function()
						PE_JumpToPhase(PE_Index,Phase[4])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[1]+4] =	function()
						PE_JumpToPhase(PE_Index,Phase[0])
					end

	ExecuteFunc[Phase[1]+5] =	function()
						PE_JumpToPhase(PE_Index,Phase[5])
					end


--Phase[2]
	ExecuteFunc[Phase[2]+1] =	function()
						PE_JumpToPhase(PE_Index,Phase[1])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+4,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[1]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[2]+2] =	function()
						PE_JumpToPhase(PE_Index,Phase[3])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[3]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[2]+3] =	function()
						PE_JumpToPhase(PE_Index,Phase[4])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[2]+4] =	function()
						PE_JumpToPhase(PE_Index,Phase[0])
					end

	ExecuteFunc[Phase[2]+5] =	function()
						PE_JumpToPhase(PE_Index,Phase[5])
					end


--Phase[3]
	ExecuteFunc[Phase[3]+1] =	function()
						PE_JumpToPhase(PE_Index,Phase[1])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+4,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[1]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[3]+2] =	function()
						PE_JumpToPhase(PE_Index,Phase[2])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[3]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[3]+3] =	function()
						PE_JumpToPhase(PE_Index,Phase[4])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[3]+4] =	function()
						PE_JumpToPhase(PE_Index,Phase[0])
					end

	ExecuteFunc[Phase[3]+5] =	function()
						PE_JumpToPhase(PE_Index,Phase[5])
					end


--Phase[4]
	ExecuteFunc[Phase[4]+1] =	function()
						PE_JumpToPhase(PE_Index,Phase[1])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+4,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[1]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[4]+2] =	function()
						PE_JumpToPhase(PE_Index,Phase[2])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[4]+3] =	function()
						PE_JumpToPhase(PE_Index,Phase[3])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[3]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[4]+4] =	function()
						PE_JumpToPhase(PE_Index,Phase[0])
					end

	ExecuteFunc[Phase[4]+5] =	function()
						PE_JumpToPhase(PE_Index,Phase[5])
					end


--Phase[5]
	ExecuteFunc[Phase[5]+1] =	function()
						PE_JumpToPhase(PE_Index,Phase[1])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+4,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[1]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[1],Phase[1]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[1], Phase[1]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[5]+2] =	function()
						PE_JumpToPhase(PE_Index,Phase[2])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[2],Phase[2]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[2], Phase[2]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[5]+3] =	function()
						PE_JumpToPhase(PE_Index,Phase[3])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+4,PEString[Phase[3]+4][1],PEString[Phase[3]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[3]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[3],Phase[3]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[3], Phase[3]+4, false)--���åؼ�
					end

	ExecuteFunc[Phase[5]+4] =	function()
						PE_JumpToPhase(PE_Index,Phase[4])
						PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+4,PEString[Phase[4]+4][1],PEString[Phase[4]+4][2],"ResidualHP",HPpercent_103120,Condition[Phase[4]][4],0)
						if	HPpercent_103120>40	then
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,(HPpercent_103120-25),0)
						else
							PE_PH_AddObjective_EqualAndSmaller(PE_Index,Phase[4],Phase[4]+5,PEString[Phase[1]+4][1],PEString[Phase[1]+4][2],"ResidualHP",HPpercent_103120,-25,0)
						end
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+5, false)--���åؼ�
						PE_OB_SetVisible(PE_Index, Phase[4], Phase[4]+4, false)--���åؼ�
					end
	if	OBIndex~=nil	then
		ExecuteFunc[OBIndex]()
	end
--���a�H�Ʋέp��
	local PArray = {}
	local PNum = PE_GetActivePlayerGUIDCount(PEIndex)
	local IfGiveCoin = false
	for i=1,PNum,1 do
		PArray[i] = PE_GetActivePlayerGUID(1)--�O��id
	end
--�n���ذe��
	if	PHIndex ~= 0	and	PHIndex~= 50	then
		local GiveBounsPhase = {102,103,202,203,303,403,503,504}


		for i=1,table.getn(GiveBounsPhase),1 do
			if	OBIndex==GiveBounsPhase[i]	then
				IfGiveCoin = true
				local CPhase = math.floor(OBIndex/100)
				local PHCon = Condition[Phase[CPhase]][OBIndex%100]
				

				local PHCheck = false
				local BonusStandard = 1
				local PTemp
				local WasteTime

				for k=1,PNum,1 do
					PTemp = PArray[k]
					if	CPhase==1	then --�����Ĥ@���q���ؼ�
						PHCheck = true --�ĥΤ��P���P�_�з�
						WasteTime = Condition[Phase[CPhase]][1]-(PE_GetVar("TakeSource")/1000)
					else
						WasteTime = Condition[Phase[CPhase]][1]-(PE_GetVar("PastTime")/1000)
					end
					local PEBuffCheck
					if	PHCon ==240	then--�w�������q�ؼЧP�_
						PEBuffCheck = 508074 --�M�w�ˬdBuff
					else
						PEBuffCheck = 508075--�M�w�ˬdBuff
					end
					local TimeBonus =120/math.floor(WasteTime/60) --�C�֤@�����N�h40��
					if	BonusStandard>DW_GetBuffPowerLv(PTemp,508080)	then --������
						if	DW_GetBuffPowerLv(PTemp,PEBuffCheck)>10	then--�b��ԤW���L�^�m
							if	DW_CheckPartyInSameZone(PTemp)==true	then--�u�����ն�
								PE_GivePlayerScore(1, PTemp, 90)--�ն����y90��
							end
							--PE_GivePlayerScore(1,PTemp,TimeBonus) --�ɶ����y 40 ������
							if	PHCon==240	and DW_GetBuffPowerLv(PTemp,PEBuffCheck) >120	then --�W��1/2�����ļ�
								CallPlot(PTemp, "YOYO_GetTokenValue", 2, 1);--�j�N��"
							elseif	PHCon==800	and DW_GetBuffPowerLv(PTemp,PEBuffCheck) >40	then --�W��1/2���Ķ��q
								CallPlot(PTemp, "YOYO_GetTokenValue", 2, 1);--�j�N��"
							end
						end
					end
				end
				break
			end
		end
	end

--���m�]�w��
	local BonusTemp,PTemp
	for i=1,table.getn(PArray),1 do
		PTemp = PArray[i] --���aid���Ȧs
		if	PE_GetPlayerScore(1, PTemp) >300	then
			BonusTemp = 1--�̦h��1�T
		else
			BonusTemp =0
		end
DeBugMSG(PTemp,0,"Your Score is "..math.floor(PE_GetPlayerScore(1, PTemp)))
		PE_GivePlayerScore(1, PTemp, -1*math.floor(PE_GetPlayerScore(1, PTemp)))--�M���n��
--Say(PTemp,"Is Me")
--DeBugMSG(0,0,"My 508080 Buff Lv is  "..DW_GetBuffPowerLv(PTemp,508080))
		if	DW_GetBuffPowerLv(PTemp,508080)==0	then--������
--DeBugMSG(0,0,"BonusTemp  = "..BonusTemp)
			if	IfGiveCoin == true	and BonusTemp>0	then --���n�� ���A�ŦX�~��
				CallPlot(PTemp, "YOYO_GetTokenValue", 2, BonusTemp);--�j�N��"
			end
		end
		CancelBuff(PTemp,508074)--�M���Ҧ����p��buff
		CancelBuff(PTemp,508075)
		CancelBuff(PTemp,508080)
	end
	Boss_103120_BonusCheck = 0
end
------------------------------------------------------------------�T�w�ɶ��o�e���իH��
function LuaS_103120_PE_DW_02(PlayerID)
	if	CheckBuff(PlayerID,508079)==false	then
		AddBuff(PlayerID,508079,1,-1)--�o���հT��1
	end
	BeginPlot(PlayerID,"LuaS_103120_PE_DW_03",270)--27����禬
end
------------------------------------------------------------------�Y���a�ݾ����h�O��
function LuaS_103120_PE_DW_03()
	local PlayerID = OwnerID()
	if	CheckBuff(PlayerID,508079)	then--���a�ݾ���
		AddBuff(PlayerID,508080,0,-1)--�O��
	end
end
------------------------------------------------------------------�C6��o�e���ժ��j��
function LuaS_103120_PE_DW_04()
	local PArray = {}
	local PNum
	local PIDTemp
	while	true	do
		PArray= {} --���m
		PNum = PE_GetActivePlayerGUIDCount(1) --���o�`�H��
--���a�H�Ʋέp��
		for i=1,PNum,1 do
			PIDTemp = PE_GetActivePlayerGUID(1)--���o�U�OID
			CallPlot(PIDTemp,"LuaS_103120_PE_DW_02",PIDTemp) --�o�e�ݾ�����
		end
		sleep(300)--�C�����@�����s�o�e
	end
end
------------------------------------------------------------------
--PE ���հ�

function LuaS_103120_PastTime(Value)
	PE_AddVar("PastTime",Value)
end

function LuaS_103120_GetSource(Value)
	PE_AddVar("GetSource",Value)
end

function LuaS_103120_KillSanction(Value)
	PE_AddVar("KillSanction",Value)
end

function LuaS_103120_TakeSource(Value)
	PE_AddVar("TakeSource",Value)
end