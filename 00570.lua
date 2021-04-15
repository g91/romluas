--Q1.�Q��for in pairs�Ptable�����c�p��ǥͪ����ƥ���
--table�������X�{�W�ٻP���� ��p Score["Tom"] = 70
--�ǥͦ@��4�W �B���Ʀp�U
--Tom 70��
--Ken 65��
--Bill 15��
--Hank  33��

function Lua_Hao_20110825_HomeWork_1()

	local Player = OwnerID()
	local Avg = 0
	local Score = {}
	Score["Tom"] = 70
	Score["Ken"] = 65
	Score["Bill"] = 15
	Score["Hank"] = 33

	for Name , List in pairs(Score) do
		Avg = Avg + List
	end
	Say( OwnerID() , "Avg = "..Avg/4 )
end

--Q2.�b�@�Ӧ��`�@�����A�Q��table�P�_���P�Ǫ����������̤��P�����y�C
--���T(100054 ) ���� �]�k�w�ѥ](207635)
--�T(100055) ���� ��u���ѥ](207636)
--�p��(100056) ���� �P�n���ѥ](207637)
--��(100063) ���� ���p�{�N�ѥ](207638)

function Lua_Hao_20110825_HomeWork_2_1()

	SetPlot( OwnerID() , "dead" , "Lua_Hao_20110825_HomeWork_2_2" , 0 )
end

function Lua_Hao_20110825_HomeWork_2_2()

	local Obj = OwnerID()--�Ǫ�
	local Killer = TargetID()--������
	local OrgID = ReadRoleValue( Obj , EM_RoleValue_OrgID )--���󪺸�Ʈw�s��
	--�H�U���@�~�d��

	local Monster = {}
	Monster[100054] = 207635
	Monster[100055] = 207636
	Monster[100056] = 207637
	Monster[100063] = 207638

	Givebodyitem( Killer , Monster[OrgID] , 1 )
end

--Q3.�q1~10�����o3���H�������ƪ��Ʀr(�i�ϥ�table.insert��table.remove��@)

function Lua_Hao_20110825_HomeWork_3_1()	--  X ���� Y ���H�������ƼơAX�� >= Y

	Lua_Hao_20110825_HomeWork_3_2( 10 , 3 )
end

function Lua_Hao_20110825_HomeWork_3_2( Count , Probability )

	local Player = OwnerID()
	local List , Answer = {} , {}

	for i = 1 , Count , 1 do
		table.insert( List , i )
	end

	for i = 1 , Probability , 1 do
		Answer[i] = table.remove( List , math.random(table.getn(List)) )
		Say( Player , "Answer"..i.." = "..Answer[i] )
	end
end

--Q4.��table�g�@�Ө̷ӵ��ŵ������~��§�]�C(���o�ϥ�if�P�j��)
--1 ~ 20�� ����207635 �]�k�w�ѥ]
--21~ 40�� ����200123 �ĹT�G
--41~ 60�� ����200151 ��¦������
--61~ 80�� ����201710 ���ɬ�
--81~ 100�� ����201749 �����
--�ϥΦ����Ogivebodyitem( Player, ItemID, 1 )

function Lua_Hao_20110825_HomeWork_4()

	local Player = OwnerID()
	local Lv = ReadRoleValue( Player , EM_RoleValue_LV )

	local Select = {}
	Select[1] = 207635
	Select[2] = 200123
	Select[3] = 200151
	Select[4] = 201710
	Select[5] = 201749

	Givebodyitem( Player , Select[math.ceil(Lv/20)] , 1 )
end

--1.�ЫإX����10��(100292)�A�l�צb�A�P��򦨤@�ӥb�|50����A��A�b�樫�ɡA�Ӥ��沈����ۧA���ʡA�ëO����ΡC
--�B�J1 �b�����I(���a/NPC) �P�򲣥ͤ���
--�B�J2 �����I���ʮ� ����O���۹�}������

function Lua_Hao_Home_Work_Q5( ObjCount )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Player , EM_RoleValue_X )
	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Range = 50
	local ObjX , ObjZ = {} , {}
	local ObjID = 100292
	local Npc = {}

	for i = 1 , ObjCount , 1 do
		ObjX[i] = X - Range * math.cos(math.pi*2*(i/ObjCount))
		ObjZ[i] = Z + Range * math.sin(math.pi*2*(i/ObjCount))
		Npc[i] = CreateObj( ObjID , ObjX[i] , Y , ObjZ[i] , 0 , 1 )
		MoveToFlagEnabled( Npc[i] , false )
		AddToPartition( Npc[i] , Room )
		WriteRoleValue( Npc[i] , EM_RoleValue_IsWalk , 0 )
		CallPlot( Npc[i] , "Lua_Hao_Home_Work_Q5_1" , Player , Range , X , Y , Z , i , ObjCount )
	end
end
  
function Lua_Hao_Home_Work_Q5_1( Player , Range , X , Y , Z , i , ObjCount )

	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjX , ObjZ
	local Npc = OwnerID()

	while true do
		Sleep(1)
		local NewX = ReadRoleValue( Player , EM_RoleValue_X )
		local NewZ = ReadRoleValue( Player , EM_RoleValue_Z )
		if NewX ~= X or NewZ ~= Z then
			ObjX = NewX - Range * math.cos(math.pi*2*(i/ObjCount))
		  	ObjZ = NewZ + Range * math.sin(math.pi*2*(i/ObjCount))
			MoveDirect( Npc , ObjX , Y , ObjZ )
			X = NewX
			Z = NewZ
		end
	end
end

--2.�ӤW�D�A�[�J���\��A����ЫخɡA����u�ۧA�b�|50�@���ɰw���ഫ��l���ʧ@�A
--��A���ʮɡA���藍����A���ʵ�������ɡA���઺�ʧ@�אּ�f�ɰw�A�H������.....
--�B�J1 �ӤW�D �����I�S�����ʮ�  ����|�H�����I�����߱���
--�B�J2 �����I���ʫ� ���ܱ��઺��V

function Lua_Hao_Home_Work_Q6( ObjCount )

	local Player = OwnerID()
	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local X = ReadRoleValue( Player , EM_RoleValue_X )
	local Y = ReadRoleValue( Player , EM_RoleValue_Y )
	local Z = ReadRoleValue( Player , EM_RoleValue_Z )
	local Range = 50
	local ObjX , ObjZ , Space = {} , {} , {}
	local ObjID = 100292
	local Npc = {}

	for i = 1 , ObjCount , 1 do
		ObjX[i] = X - Range * math.cos(math.pi*2*(i/ObjCount))
		ObjZ[i] = Z + Range * math.sin(math.pi*2*(i/ObjCount))
		Space[i] = { ObjX[i] , Y , ObjZ[i] }
	end

	for i = 1 , ObjCount , 1 do
		Npc[i] = CreateObj( ObjID , Space[i][1] , Y , Space[i][3] , 0 , 1 )
		MoveToFlagEnabled( Npc[i] , false )
		AddToPartition( Npc[i] , Room )
		WriteRoleValue( Npc[i] , EM_RoleValue_IsWalk , 0 )
		CallPlot( Npc[i] , "Lua_Hao_Home_Work_Q6_2" , Player , Range , Space , X , Y , Z , i , ObjCount )
	end
end
  
function Lua_Hao_Home_Work_Q6_2( Player , Range , Space , X , Y , Z , i , ObjCount )
--	local Room = ReadRoleValue( Player , EM_RoleValue_RoomID )
	local ObjX , ObjZ
	local Npc = OwnerID()
	local Step = i
--	local Select = 0
--	Say( Npc , "i = "..i )

	while true do
		local NewX = ReadRoleValue( Player , EM_RoleValue_X )
		local NewZ = ReadRoleValue( Player , EM_RoleValue_Z )
		if NewX == X and NewZ == Z then
		--	for j = 1 , #Space , 1 do
				Step = Step + 1
				if Step > ObjCount then
					Step = 1
				end
				MoveDirect( Npc , Space[Step][1] , Y , Space[Step][3] )
				if i == 1 then
				--	DebugMsg( 0 , 0 , "X = "..Space[Step][1].." Y = "..Y..", Z  ="..Space[Step][3] )
				--	DebugMsg( 0 , 0 , "Step = "..Step )
				--	Select = Select + 1
				--	DebugMsg( 0 , 0 , "Select = "..Select )
					Say( Npc , Step )
				end

		--	end
		else
			Lua_Hao_Home_Work_Q5_1( Player , Range , X , Y , Z , i , ObjCount )
		--	Lua_Hao_HW_Q6_Clear()
		--	DebugMsg( 0 , 0 , "Break" )
			break
		end
		Sleep(30)
	end
end

function Lua_Hao_HW_Q6_Clear()

	Lua_Hao_NPCofAll_Clear(100292 , 500 )
end

----------------------------------------------------------------------------------------------------------------------------------------
function lua_nehelia_flower_S_1()	-- �P�_�ī��

	SetPlot( OwnerID() ,"touch" , "lua_nehelia_flower_S_2" , 50 )
end


function lua_nehelia_flower_S_2()

	local Player = OwnerID()
	local Npc = TargetID()
	local PDir = ReadRoleValue( Player , EM_RoleValue_Dir )
	local PZ =  ReadRoleValue( Player , EM_RoleValue_Z )
	local NDir = ReadRoleValue( Npc , EM_RoleValue_Dir )
	local NZ =  ReadRoleValue( Npc , EM_RoleValue_Z )
	local Angle = 30
	local Dir = PDir - NDir
	local Dis = NZ - PZ
	DebugMsg( 0 , 0 , "PDir = "..PDir.." NDir = "..NDir.." Angle = "..Dir.." PZ = "..PZ.." NZ = "..NZ.." Dis = "..Dis )
	local Step = 0

	if NZ < 0 and PDir - NDir <= Angle and PDir - NDir >= -Angle and NZ - PZ < 0 then	-- �P�_����
		Step = 1
	elseif NZ > 0 and PDir - NDir <= Angle and PDir - NDir >= -Angle and NZ - PZ > 0 then	-- �P�_����
		Step = 1
	else
		ScriptMessage( Player , Player , 1 ,"Angle error" , 0 )
		ScriptMessage( Player , Player , 0 ,"Angle error" , 0 )
	end
	
	if Step == 1 then
		if BeginCastBarEvent( Player , NPC ,"Catch it if you can ", 50 , ruFUSION_ACTORSTATE_GATHER_BEGIN , ruFUSION_ACTORSTATE_GATHER_END , 0 , "lua_nehelia_flower_S_3" ) ~= 1 then
			ScriptMessage( Player , Player , 1 ,"[SC_424493_05]" , 0 )
			ScriptMessage( Player , Player , 0 ,"[SC_424493_05]" , 0 )
			-- �ؼЦ��L��
		end
	end
end

function lua_nehelia_flower_S_3( Player, CheckStatus )

	local Player = OwnerID()
	local NPC = TargetID()
	if CheckStatus ~= 0 then
		if CheckStatus > 0 then --���\
			ScriptMessage( Player , Player , 0 ,"You Got it" , 0 )
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		else --����
			ScriptMessage( Player , Player , 0 ,"Mission error" , 0 )		
			EndCastBar( Player , CheckStatus ) --�M���I�k��
		end
	end
end
	
function Lua_Hao_Reset_Magic_Wardrobe()	-- �M���]�k���o�Ҧ��˳�
	
	local Player = OwnerID()
--	local Position = ReadRoleValue( OwnerID() , EM_RoleValue_SuitWardrobe+Space )
	for i = 0 , 499 , 1 do
		WriteRoleValue( Player , EM_RoleValue_SuitWardrobe+i , 0 )
	end
end

function Hao_GuildWar_Test_Buff(Lv)	-- �վ㨭�WBuff������

	local Player = OwnerID()
	local BodyBuff
	local CountBuff = BuffCount( Player )	-- Ū�����W��Buff�ƶq
	for i = 0 , CountBuff , 1 do
		BodyBuff = BuffInfo( Player , i , EM_BuffInfoType_BuffID )	-- Ū����Buff��ID
		CancelBuff_NoEvent( Player , BodyBuff )
		AddBuff( Player , BodyBuff , Lv , -1 )
		DebugMsg( Player , 0 , BodyBuff )
	end
end

function Hao_Test_20151001()
	local Owner = OwnerID();
	local Flag = {};
	Flag[1] = EM_AccountFlag_CE_Date1_12;	--	=Value; Value = Value + 12	--���p�I������ �۳�NPC��(�̤j2048) 2^12 -2048 ~ 2047
	Flag[2] = EM_AccountFlag_CE_Count1_8;	--	=Value; Value = Value + 8	--���p�I������ �۳�NPC��(�̤j128)   2^8    -128 ~ 127
	Flag[3] = EM_AccountFlag_CE_Date2_12;	--	=Value; Value = Value + 12	--�����I�����p �۳�NPC��(�̤j2048) 2^12
	Flag[4] = EM_AccountFlag_CE_Count2_8;	--	=Value; Value = Value + 8	--�����I�����p �۳�NPC��(�̤j128)   2^8
	Flag[5] = EM_AccountFlag_CE_Date3_12;	--	=Value; Value = Value + 12	--���p�I������ Zone2 NPC��(�̤j2048) 2^12
	Flag[6] = EM_AccountFlag_CE_Count3_8;	--	=Value; Value = Value + 8	--���p�I������ Zone2 NPC��(�̤j128)   2^8
	Flag[7] = EM_AccountFlag_CE_Date4_12;	--	=Value; Value = Value + 12	--�����I�����p Zone2 NPC��(�̤j2048) 2^12
	Flag[8] = EM_AccountFlag_CE_Count4_8;	--	=Value; Value = Value + 8	--�����I�����p Zone2 NPC��(�̤j128)   2^8
	Flag[9] = EM_AccountFlag_CE_Date5_12;	--	=Value; Value = Value + 12	--�HA��B ���1 �۳�NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[10] = EM_AccountFlag_CE_Count5_8;	--	=Value; Value = Value + 8	--�HA��B ���1 �۳�NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[11] = EM_AccountFlag_TJ_Check_1;	--		=Value; Value = Value + 1	--�֦��ĤT¾�~�X��(�̤j1)   2^1    0 ~ 1
	Flag[12] = EM_AccountFlag_CE_Date6_12;	--	=Value; Value = Value + 12	--�HA��B ���2 �۳�NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[13] = EM_AccountFlag_CE_Count6_8;	--	=Value; Value = Value + 8	--�HA��B ���2 �۳�NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[14] = EM_AccountFlag_CE_Date7_12;	--	=Value; Value = Value + 12	--�HA��B�BC�BD ���3 �۳�NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[15] = EM_AccountFlag_CE_Count7_8;	--	=Value; Value = Value + 8	--�HA��B�BC�BD ���3 �۳�NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[16] = EM_AccountFlag_CE_Date8_12;	--	=Value; Value = Value + 12	--�HA��B�BC�BD �۳�NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[17] = EM_AccountFlag_CE_Count8_8;	--	=Value; Value = Value + 8	--�HA��B�BC�BD �۳�NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[18] = EM_AccountFlag_CE_Date9_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���1 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[19] = EM_AccountFlag_CE_Count9_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���1 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[20] = EM_AccountFlag_CE_Date10_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���2 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[21] = EM_AccountFlag_CE_Count10_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���2 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[22] = EM_AccountFlag_CE_Date11_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���3 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[23] = EM_AccountFlag_CE_Count11_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���3 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[24] = EM_AccountFlag_CE_Date12_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���4 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[25] = EM_AccountFlag_CE_Count12_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���4 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[26] = EM_AccountFlag_CE_Date13_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���5 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[27] = EM_AccountFlag_CE_Count13_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���5 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[28] = EM_AccountFlag_CE_Date14_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���1 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[29] = EM_AccountFlag_CE_Count14_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���1 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[30] = EM_AccountFlag_CE_Date15_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���2 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[31] = EM_AccountFlag_CE_Count15_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���2 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[32] = EM_AccountFlag_CE_Date16_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���3 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[33] = EM_AccountFlag_CE_Count16_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���3 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[34] = EM_AccountFlag_CE_Date17_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���4 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[35] = EM_AccountFlag_CE_Count17_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���4 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[36] = EM_AccountFlag_CE_Date18_12;	--	=Value; Value = Value + 12	--�u�ʳ]�w�H������ ���5 �l��NPC��(�̤j2048) 2^12 -2048 ~ 2047	�O�������
	Flag[37] = EM_AccountFlag_CE_Count18_8;	--	=Value; Value = Value + 8	--�u�ʳ]�w�H������ ���5 �l��NPC��(�̤j128)   2^8    -128 ~ 127	�O�����ƥ�
	Flag[38] = EM_AccountFlag_MW_Space_Switch_1;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����1(�̤j1)   2^1    0 ~ 1 Magic Wardrobe = MW
	Flag[39] = EM_AccountFlag_MW_Space_Switch_2;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����2(�̤j1)   2^1    0 ~ 1
	Flag[40] = EM_AccountFlag_MW_Space_Switch_3;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����3(�̤j1)   2^1    0 ~ 1
	Flag[41] = EM_AccountFlag_MW_Space_Switch_4;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����4(�̤j1)   2^1    0 ~ 1
	Flag[42] = EM_AccountFlag_MW_Space_Switch_5;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����5(�̤j1)   2^1    0 ~ 1
	Flag[43] = EM_AccountFlag_MW_Space_Switch_6;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����6(�̤j1)   2^1    0 ~ 1
	Flag[44] = EM_AccountFlag_MW_Space_Switch_7;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����7(�̤j1)   2^1    0 ~ 1
	Flag[45] = EM_AccountFlag_MW_Space_Switch_8;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ����o����8(�̤j1)   2^1    0 ~ 1
	Flag[46] = EM_AccountFlag_MW_Set_Switch_1;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ���ճ]�w6(�̤j1)   2^1    0 ~ 1
	Flag[47] = EM_AccountFlag_MW_Set_Switch_2;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ���ճ]�w7(�̤j1)   2^1    0 ~ 1
	Flag[48] = EM_AccountFlag_MW_Set_Switch_3;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ���ճ]�w8(�̤j1)   2^1    0 ~ 1
	Flag[49] = EM_AccountFlag_MW_Set_Switch_4;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ���ճ]�w9(�̤j1)   2^1    0 ~ 1
	Flag[50] = EM_AccountFlag_MW_Set_Switch_5;	--	=Value; Value = Value + 1	--�]�k���o�X�R�Ϊ���ճ]�w10(�̤j1)   2^1    0 ~ 1
	
	for i = 1, #Flag do
		DebugMsg( Owner, 0, "Old"..i.." = "..Flag[i] );
	end

end