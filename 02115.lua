--�Ǫ��κX�� 780794  NPC�κX�� 780795  �D�����κX�� 780796  �����ΥκX�� 780805 ��t�� 780830
--�ͤp�ǺX�� OK   
function ic_780796_01()  								---�D����
	local isaac = OwnerID()								---���					   						        
	local bossxx=0										---(EM_RoleValue_register9)	�����`�� 1����=1 2����=2 3����=3 4����=4 OPEN�QĲ�o=5 BOSSĹ=6
	local time1=0										---�}�ԥX�ǥ�
	local mob1=CreateObjByFlag(104814,780830,1,1)		---PE3��tNPC
	local mob2=CreateObjByFlag(104814,780830,3,1)		---PE3��tNPC
	local mob3=CreateObjByFlag(104814,780830,5,1)		---PE3��tNPC			
	local mob4=CreateObjByFlag(104814,780830,7,1)		---PE3��tNPC		
	local mob5=CreateObjByFlag(104814,780830,9,1)		---PE3��tNPC
	local mob6=CreateObjByFlag(104814,780830,11,1)		---PE3��tNPC			
	local time2=0										---�}�ԥX�ǥ�1����	
	local time3=0										---�}�ԥX�ǥ�2����
	local time4=0										---�}�ԥX�ǥ�3����
	local time5=0										---�ɶ���X����1��
	local time6=0										---�ɶ���X����2��
	local time7=0										---�ɶ���X����3��
	local time8=0										---�ɶ���X����4��
	local time9=0										---�ɶ���X����4��
	local playtime=0
	local bossopentime1=0								---�X����p�ƾ�(EM_RoleValue_register3)1-3��
	local bossopentime2=0								---�X����p�ƾ�(EM_RoleValue_register2)2-4��
	local RoomID=ReadRoleValue(isaac,EM_RoleValue_RoomID)
	local mob=CreateObjByFlag(104324,780795,2,1)		---(EM_RoleValue_register8)	�ͤp�ǥ�
	local opennpc=CreateObjByFlag(116838,780795,1,1) 	--(EM_RoleValue_PID)Ĳ�oNPC	
	local door	
	local door1
	AddToPartition(opennpc,RoomID)
	AddToPartition(mob,RoomID)
	AddToPartition(mob1,RoomID)
	AddToPartition(mob2,RoomID) 
	AddToPartition(mob3,RoomID) 
	AddToPartition(mob4,RoomID) 
	AddToPartition(mob5,RoomID) 
	AddToPartition(mob6,RoomID) 
	SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)			---����(�_)
	SetModeEx( mob1 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob1 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob1 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob1 , EM_SetModeType_HideName, true)
	SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)			---����(�_) 
	SetModeEx( mob2 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob2 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob2 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob2 , EM_SetModeType_HideName, true)
	SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)			---����(�_)
	SetModeEx( mob3 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob3 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob3 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob3 , EM_SetModeType_HideName, true)
	SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)			---����(�_)
	SetModeEx( mob4 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob4 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob4 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob4 , EM_SetModeType_HideName, true)
	SetModeEx( mob5 , EM_SetModeType_Searchenemy, false)			---����(�_)
	SetModeEx( mob5 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob5 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob5 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob5 , EM_SetModeType_HideName, true)
	SetModeEx( mob6 , EM_SetModeType_Searchenemy, false)			---����(�_)
	SetModeEx( mob6 , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob6 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob6 , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob6 , EM_SetModeType_HideName, true)	
	SetModeEx( mob , EM_SetModeType_Show, false)
	SetModeEx( mob , EM_SetModeType_Mark, false)					---�i�I��(�_)
	SetModeEx( mob , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
	SetModeEx( mob , EM_SetModeType_Obstruct, false) 				---����(�_)
	SetModeEx( mob , EM_SetModeType_Strikback, false) 			---����(�_)
	SetModeEx( mob , EM_SetModeType_Move, false) 					---����	(�_)
	SetModeEx( mob , EM_SetModeType_Fight, false) 				---�i���(�_)
	SetModeEx( mob , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
	SetModeEx( mob , EM_SetModeType_Searchenemy, false)			---����(�_)
	BeginPlot(mob , "ic_780796_mobboss_03" , 0)  
	BeginPlot(opennpc , "ic_780796_opennpc_02" , 0)				---�R�OĲ�oNPC���Ʊ�
	BeginPlot(mob1 , "ic_PE398NPC_1" , 0)
	BeginPlot(mob2 , "ic_PE398NPC_2" , 0)
	BeginPlot(mob3 , "ic_PE398NPC_3" , 0)
	BeginPlot(mob4 , "ic_PE398NPC_4" , 0)
	BeginPlot(mob5 , "ic_PE398NPC_5" , 0)
	BeginPlot(mob6 , "ic_PE398NPC_6" , 0)
	WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   		---�Ȧs�f�UPID  open=isaac
	WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
	WriteRoleValue(isaac,EM_RoleValue_register8,mob)   		---�Ȧs�f�U 8 	isaac=mob
	WriteRoleValue(mob,EM_RoleValue_register8,isaac)
	while true do
			sleep(10)
			bossxx= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
			bossopentime1=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
			bossopentime2=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
			playtime=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if 	playtime==1 then
			time9=time9+1
		end
		if bossxx==5 then												--�����}�l
			WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
			WriteRoleValue(OwnerID(),EM_RoleValue_register10,1)
			if bossopentime1==1 then
				time5=time5+1
				if time5>=300 then										---1���X��5�����j��i�J��2���q(NPC�M�h)
					WriteRoleValue(mob,EM_RoleValue_register4,1)
					sleep(5)	
					WriteRoleValue(opennpc,EM_RoleValue_register9,11)	---��npc��PE1~����
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,1)	---���� PE3�䴩NPC��4�����@��	---1=pE1����
					time5=0	
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,1)	---��f�U9�k1~�j��i�J��2���q
					WriteRoleValue(mob,EM_RoleValue_register9,0)
				end
			end	
			if time1==0 then											---1������}�l�X��
			WriteRoleValue(mob,EM_RoleValue_PID,1)						---�^��4���p�Ǳ��---�}�l�X�ǤF
			--WriteRoleValue(pe1,EM_RoleValue_register1,1)				---PE1�}�l
			WriteRoleValue(opennpc,EM_RoleValue_register8,1)			---�ǵ�NPC���}�ԤFPE1�}�l
			ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_40]" , 2 )	---�@�϶�������ʤw�}�l�i��I
			time1=10
			end
		elseif	bossxx==6 then											--�ɶ��D�S������~BOSSĹ�F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_03]" , 2 )---�o���ԧХ��ѤF�K����o�J�w���ƹ�A�ڭ̤]�u�������}�K
				star_WorldBattle_ScoreCal(0 , 3)		--IsWin  �^�ǳӭt����( 0��ܿ�A1���Ĺ )�AMapNumber �^�ǬO�X���Գ�
				sleep(50)
				local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
				local ID=GetSearchResult()
				local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
				for i = 0 , NPCXX do
					ID=GetSearchResult() 
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==105066 or ID2==105065 or ID2==105064 or ID2==105063 or ID2==104898 or ID2==104897 or ID2==105068 
					or ID2==105039 or ID2==104920 or ID2==104894 or ID2==104878 or ID2==104879 or ID2==104880 or ID2==104881 
					or ID2==104882 or ID2==104883 or ID2==104884 or ID2==104885 or ID2==104886 or ID2==104887 or ID2==104888 
					or ID2==104889 or ID2==104890 or ID2==104891 or ID2==104892 or ID2==104893 or ID2==116839 or ID2==116840 
					or ID2==116841 or ID2==104904 or ID2==104906 or ID2==104908 or ID2==104910 or ID2==104912 or ID2==104905 
					or ID2==104907 or ID2==104909 or ID2==104911 or ID2==104913 or ID2==104915 or ID2==104914 or ID2==104918 
					or ID2==116907 or ID2==116908 or ID2==116909 or ID2==116910 or ID2==116933 or ID2==116934 or ID2==116935 
					or ID2==116838 or ID2==104959 or ID2==105040 or ID2==104810 or ID2==104958 or ID2==104812 or ID2==104899 
					or ID2==104814 or ID2==105198 or ID2==105199 or ID2==105359 or ID2==105358 or ID2==105360 or ID2==105363
					or ID2==105362 then
					DelObj(ID)
					end
				end
				if time9< 1800 then
					BeginPlot(OwnerID() , "ic_PEnpc_04BUFFxx_2" , 0)
				elseif time9> 1800 then
					BeginPlot(OwnerID() , "ic_PEnpc_04BUFFxx_1" , 0)
				end
				sleep(600)	
				break	
		elseif	bossxx==4 then		--4�����F~���aĹ�F
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_04]" , 2 )--�ڭ̦��\�F�I�A�ݨ����]�ڭ̯T�V���ҼˡA�o���ӷP�¨��W�ľԪ��U��I
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					if CheckID( ThesePlayer[i] ) == true and ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						Lua_bk_warplayerpoint( ThesePlayer[i] , 1155 )    --play�N���a�C��id      playpoint  �N���a�o���o�쪺�ӤH�n��
					end
				end	
				star_WorldBattle_ScoreCal(1 , 3)		  --IsWin  �^�ǳӭt����( 0��ܿ�A1���Ĺ )�AMapNumber �^�ǬO�X���Գ�	
				sleep(20)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_ZONE190_WIN03]" , 2 )
				sleep(20)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_ZONE190_WIN06]" , 2 )
				door=CreateObjByFlag(105040,780794,200,1)
				door1=CreateObjByFlag(105040,780794,202,1)
				SetModeEx( door , EM_SetModeType_Mark, false)
				SetModeEx( door , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door , EM_SetModeType_Obstruct, true) 
				SetModeEx( door , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door , EM_SetModeType_Move, false) ---����	
				SetModeEx( door , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door , EM_SetModeType_Searchenemy, false)
				SetModeEx( door1 , EM_SetModeType_Mark, false)
				SetModeEx( door1 , EM_SetModeType_ShowRoleHead, false) 	
				SetModeEx( door1 , EM_SetModeType_Obstruct, true) 
				SetModeEx( door1 , EM_SetModeType_Strikback, false) ---����
				SetModeEx( door1 , EM_SetModeType_Move, false) ---����	
				SetModeEx( door1 , EM_SetModeType_Fight, false) ---�i���
				SetModeEx( door1 , EM_SetModeType_SearchenemyIgnore, false) 
				SetModeEx( door1 , EM_SetModeType_Searchenemy, false)
				AddToPartition(door,RoomID)
				AddToPartition(door1,RoomID)
				SetPlot( door,"collision","ic_780796_playfly_",30 ) 
				SetPlot( door1,"collision","ic_780796_playfly_",30 )
				sleep(2400)
				local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				local ThesePlayer = {}
				for i=1,TempPlayer do
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
					if  ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---���a���`
						AddBuff( ThesePlayer[i],508480,0 ,-1 )
						Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
						--ChangeZone( ThesePlayer[i], 6 , 0 , -23198 , -259 , 4435 , 320)
					elseif  ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then---���a�S��
						AddBuff( ThesePlayer[i],508480,0 ,-1 )
						ChangeZone( ThesePlayer[i], 6 , 0 , -23198 , -259 , 4435 , 320)	
					end
				end					
				break	
		elseif	bossxx==3 then											---3�����F  15������X4��
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,3)			---��PE3���M�h
				WriteRoleValue(opennpc,EM_RoleValue_register7,4)		---��opennpc��Ĺ�FPE3
				WriteRoleValue(opennpc,EM_RoleValue_register9,44)		---��npc��PE3~����
				time4=time4+1
			if bossopentime2==1 then	
				time8=time8+1
				if time8>=800 then											--4���X��6�������a����
				time8=0
				sleep(5)	
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,6)			---��f�U9�k6~�ɶ��D�S������~BOSSĹ�F
				WriteRoleValue(mob,EM_RoleValue_register9,0)	
				end
			end	
			if time4>=60 and time4<=65 then											---�M�h�ɶ�2��(�^�ǫ�1�����X��)
				time4=70
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_46]" , 2 )--�������ɨ��{�A�]�ڱN��Y�N�i��D�}��I
				WriteRoleValue(mob,EM_RoleValue_PID,4)					---�^��1���p�Ǳ��---�}�l�X�ǤF
			end	
		elseif	bossxx==2 then											--2�����F
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,2)			---��PE2���M�h
				WriteRoleValue(opennpc,EM_RoleValue_register7,3)		---��opennpc��Ĺ�FPE2
				time3=time3+1
			if bossopentime1==1 then	
				time7=time7+1
				if time7>=300 then											---3���X��5�����j��i�J��4���q
					WriteRoleValue(mob,EM_RoleValue_register4,3)
					sleep(5)	
					WriteRoleValue(opennpc,EM_RoleValue_register9,33)		---��npc��PE3~����
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,3)	---���� 4����ۨ����@��---3=PE3����		
					time7=0
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,3)		---��f�U9�k3~�j��i�h��4���q
					WriteRoleValue(mob,EM_RoleValue_register9,0)
				end
			end	
			if time3>=60 and time3<=65 then									--�M�h�ɶ�2��(�^�ǫ�1�����X��)
				time3=70
				WriteRoleValue(mob,EM_RoleValue_PID,3)					---�^��2���p�Ǳ��---�}�l�X�ǤF
				--WriteRoleValue(pe3,EM_RoleValue_register1,1)			---PE3�}�l
				WriteRoleValue(opennpc,EM_RoleValue_register8,3)		---�ǵ�NPC���}�ԤFPE3�}�l
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_42]" , 2 )--�B�e³��������̤w���ƷǳƧ������ݥX�o�I
				WriteRoleValue(mob1,EM_RoleValue_register9,1)
				WriteRoleValue(mob2,EM_RoleValue_register9,1)
				WriteRoleValue(mob3,EM_RoleValue_register9,1)
				WriteRoleValue(mob4,EM_RoleValue_register9,1)
				WriteRoleValue(mob5,EM_RoleValue_register9,1)
				WriteRoleValue(mob6,EM_RoleValue_register9,1)
			end	
		elseif	bossxx==1 then											---1�����F	 2������X�p�� (15������X2��NPC�M�h)
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)
				WriteRoleValue(opennpc,EM_RoleValue_register6,1)			---��PE1���M�h
				WriteRoleValue(opennpc,EM_RoleValue_register7,2)		---��opennpc��Ĺ�FPE1
				time2=time2+1
			if bossopentime2==1 then		
				time6=time6+1
				if time6>=300 then											---2���X��5�����j��i�J��3���q
					WriteRoleValue(mob,EM_RoleValue_register4,2)	
					sleep(5)
					WriteRoleValue(opennpc,EM_RoleValue_register9,22)		---��npc��PE2~����
					--WriteRoleValue(OwnerID(),EM_RoleValue_register1,1)	---���� 4����ۨ����@��---2=PE2����	
					time6=0
					WriteRoleValue(OwnerID(),EM_RoleValue_register9,2)		---��f�U9�k2~�j��i�h��3���q
					WriteRoleValue(mob,EM_RoleValue_register9,0)	
				end
			end	
			if time2>=60 and time2<=65 then											---�M�h�ɶ�2��(�^�ǫ�1�����X��)
				time2=70
				WriteRoleValue(mob,EM_RoleValue_PID,2)					---�^��3���p�Ǳ��---�}�l�X�ǤF
				--WriteRoleValue(pe2,EM_RoleValue_register1,1)			---PE2�}�l
				WriteRoleValue(opennpc,EM_RoleValue_register8,2)		---�ǵ�NPC���}�ԤFPE2�}�l
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_41]" , 2 )--�]�ڧY�N�[�ָ}�B�ӷm�ܧ𫰨��I
			end	
		end	
	end	
end
function ic_780796_opennpc_02() --NPC��----�f�U4��5�٨S��
local opennpc = OwnerID()
local RoomID=ReadRoleValue(opennpc,EM_RoleValue_RoomID)
local isaac= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local npc1		--PE1����	
local npc2		--PE2����	
local npc3		--PE3����
local time1=0	
local time2=0	
local time3=0	
local time4=0	
local PEopen=0	--PE�}�l�F
local PEXX=0	--PEXX�O�_���\~ 11=PE1���� 22=PE2���� 33=PE3����
local PE=0		--PE�O�_���\~ 2=PE1Ĺ�F 3=PE2Ĺ�F 4=PE3Ĺ�F
local PE9898=0	--PENPC�M�h��
local PE1WIN1=0
local PE1WIN2=0
local PE1WIN3=0
local PE3xxx=0  										---ReadRoleValue(opennpc,EM_RoleValue_register4)--��PE3�v��NPC�^�쥻�}
local PE2xxx=0  
local pe1npc=CreateObjByFlag(116839,780795,3,1) 		---PE1���	��1�|PE		
local pe2npc=CreateObjByFlag(116840,780795,4,1) 		---PE2���	��2�|PE
local pe3npc=CreateObjByFlag(116841,780795,5,1) 		---PE3���	��3��PE
local door3=CreateObjByFlag(104198,780794,25,1) 		---PE1���	��1�|PE	
local door4=CreateObjByFlag(104198,780794,26,1) 		---PE1���	��1�|PE	
--WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   		--�Ȧs�f�UPID  	open=isaac
WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
--WriteRoleValue(opennpc,EM_RoleValue_register1,pe1npc)   	---�Ȧs�f�U 1 	opennpc=pe1npc
WriteRoleValue(pe1npc,EM_RoleValue_register1,opennpc)
WriteRoleValue(pe1npc,EM_RoleValue_register9,pe3npc)
--WriteRoleValue(opennpc,EM_RoleValue_register2,pe2)   	---�Ȧs�f�U 2 	opennpc=pe2
WriteRoleValue(pe2npc,EM_RoleValue_register1,opennpc)
--WriteRoleValue(opennpc,EM_RoleValue_register3,pe3)   	---�Ȧs�f�U 3 	opennpc=pe3
WriteRoleValue(pe3npc,EM_RoleValue_register1,opennpc)
AddToPartition(pe1npc,RoomID)
AddToPartition(pe2npc,RoomID)
AddToPartition(pe3npc,RoomID)
AddToPartition(door3,RoomID)
AddToPartition(door4,RoomID)
SetModeEx( pe1npc , EM_SetModeType_Strikback, false) 	---����(�_)
SetModeEx( pe1npc , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( pe1npc , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( pe2npc , EM_SetModeType_Strikback, false) 	---����(�_)
SetModeEx( pe2npc , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( pe2npc , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( pe3npc , EM_SetModeType_Strikback, false) 	---����(�_)
SetModeEx( pe3npc , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( pe3npc , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( door3 , EM_SetModeType_Mark, false)
SetModeEx( door3 , EM_SetModeType_ShowRoleHead, false) 	
SetModeEx( door3 , EM_SetModeType_Obstruct, true) 
SetModeEx( door3 , EM_SetModeType_Strikback, false) ---����
SetModeEx( door3 , EM_SetModeType_Move, false) ---����	
SetModeEx( door3 , EM_SetModeType_Fight, false) ---�i���
SetModeEx( door3 , EM_SetModeType_SearchenemyIgnore, false) 
SetModeEx( door3 , EM_SetModeType_Searchenemy, false)
SetModeEx( door4 , EM_SetModeType_Mark, false)
SetModeEx( door4 , EM_SetModeType_ShowRoleHead, false) 	
SetModeEx( door4 , EM_SetModeType_Obstruct, true) 
SetModeEx( door4 , EM_SetModeType_Strikback, false) ---����
SetModeEx( door4 , EM_SetModeType_Move, false) ---����	
SetModeEx( door4 , EM_SetModeType_Fight, false) ---�i���
SetModeEx( door4 , EM_SetModeType_SearchenemyIgnore, false) 
SetModeEx( door4 , EM_SetModeType_Searchenemy, false)
BeginPlot(pe1npc , "ic_PE1NPC" , 0)					---�R�O���ⰵ�Ʊ�
BeginPlot(pe2npc , "ic_PE2NPC" , 0)					---�R�O���ⰵ�Ʊ�
BeginPlot(pe3npc , "ic_PE3NPC" , 0)					---�R�O���ⰵ�Ʊ�
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do 
		PE9898= ReadRoleValue(OwnerID(),EM_RoleValue_register6)
		PE= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		PEopen= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PEXX= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN1=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		PE1WIN2=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		PE1WIN3=ReadRoleValue(OwnerID(),EM_RoleValue_register3)
		PE2XXX=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		sleep(10)
		--say(OwnerID(),"PE3xxx="..PE3xxx)
		if PE2XXX==1 and time4==0 then
			WriteRoleValue(isaac,EM_RoleValue_register1,1)
			time4=1
		end
		if PE9898==1 then										---PE1NPC�M�h��
			WriteRoleValue(pe1npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---��f�U6�k0
		elseif PE9898==2 then								  	---PE2NPC�M�h��
			WriteRoleValue(pe2npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---��f�U6�k0
		elseif PE9898==3 then									--PE3NPC�M�h��
			WriteRoleValue(pe3npc,EM_RoleValue_register2,1)
			sleep(5)
			WriteRoleValue(OwnerID(),EM_RoleValue_register6,0)	---��f�U6�k0
		end
		if	PEopen==1 then
			SetModeEx( pe1npc , EM_SetModeType_Mark, true)					---�i�I��(�_)
			if PE==2 and PEXX==0 and time1==0 and PE1WIN1==1 or PE1WIN1==1 and time1==0 then
				time1=5
				sleep(40)
				npc1=CreateObjByFlag(116933,780795,6,1) 	-----NPC1�Цb 
				AddToPartition(npc1,RoomID)
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U7�k0
				SetModeEx( npc1 , EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( npc1 , EM_SetModeType_Fight, true) 				---�i���(�O)
				AddBuff( npc1,508120,0 ,-1 )
				SetPlot( npc1,"dead","ic_PEnpc_01BUFFxx",0 )  
				BeginPlot(npc1 , "ic_PEnpc_01" , 0)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_45]" , 2 )--���`�ۭn�몺�l�����֧A�̡A���ݭn�i�H�A�ӧ�ڡC
			elseif PE==2 and PEXX==11 and PE1WIN1==0 and time1==0  then
				time1=5
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
			end		
		end
		if	PEopen==2 then
			SetModeEx( pe2npc , EM_SetModeType_Mark, true)					---�i�I��(�_)
			if PE==3 and PEXX==0 and time2==0 and PE1WIN2==1 or PE1WIN2==1 and time2==0 then
				time2=5
				Sleep(40)
				npc2=CreateObjByFlag(116934,780795,7,1) 	-----NPC2�Цb 
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U7�k0
				SetModeEx( npc2, EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( npc2 , EM_SetModeType_Fight, true) 				---�i���(�O)
				AddToPartition(npc2,RoomID)
				AddBuff( npc2,508120,0 ,-1 )
				SetPlot( npc2,"dead","ic_PEnpc_02BUFFxx",0 ) 
				BeginPlot(npc2 , "ic_PEnpc_02" , 0)
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_44]" , 2 )--�Z��R�������O�q�æs�A���ݭn�i�H�A�ӧ�ڡC
			elseif PE==3 and PEXX==22 and PE1WIN2==0 and time2==0 then
				time2=5
				WriteRoleValue(isaac,EM_RoleValue_register1,1)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0	
			end		
		end
		if	PEopen==3 then
			SetModeEx( pe3npc , EM_SetModeType_Mark, true)					---�i�I��(�_)
			if  PE==4 and PEXX==0 and time3==0  or PE1WIN3==1 and time3==0   then
				time3=5
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				local ThesePlayer = {}
				sleep(40)
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3�Цb
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U7�k0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---�i���(�O)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--��̤�����q�P�A�̦P�b�A���ݭn�i�H�A�ӧ�ڡC
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1	
					ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
							AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end	
				end	
			elseif  PEXX==33 and time3==0 or PE==4 and PEXX==33 and time3==0  then
				time3=5
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				local ThesePlayer = {}
				sleep(40)
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3�Цb
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U7�k0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---�i���(�O)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--��̤�����q�P�A�̦P�b�A���ݭn�i�H�A�ӧ�ڡC
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
								AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end
				end	
			elseif	PEXX==44 and time3==0  then	
				time3=5
				sleep(40)
				local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
				local ThesePlayer = {}
				npc3=CreateObjByFlag(116935,780795,8,1) 	-----NPC3�Цb
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,0)---��f�U9�k0
				WriteRoleValue(OwnerID(),EM_RoleValue_register7,0)---��f�U7�k0	
				SetModeEx( npc3, EM_SetModeType_Strikback, false) ---����(�_)
				SetModeEx( npc3 , EM_SetModeType_Fight, true) 				---�i���(�O)
				WriteRoleValue(npc3,EM_RoleValue_register1,opennpc)
				AddToPartition(npc3,RoomID)
				AddBuff( npc3,508120,0 ,-1 )
				SetPlot( npc3,"dead","ic_PEnpc_03BUFFxx",0 )
				ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_43]" , 2 )--��̤�����q�P�A�̦P�b�A���ݭn�i�H�A�ӧ�ڡC
				sleep(50)
				PE3xxx=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
				if PE3xxx~=0 then
					for i=1,TempPlayer do
					PE3xxxx=PE3xxx-1
						ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
						if CheckID( ThesePlayer[i] ) == true and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
						ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
						--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
							if CheckBuff( ThesePlayer[i] , 508117 ) == false then
								AddBuff( ThesePlayer[i],508117,PE3xxxx ,-1 )
							end
						end					
					end
				end	
			end
		end		
	end
end 
function ic_PEnpc_01BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 508115 ) == true then
					CancelBuff(ThesePlayer[i], 508115)
				end
		end					
	end
end
function ic_PEnpc_02BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 508116 ) == true then
					CancelBuff(ThesePlayer[i], 508116)
				end
		end					
	end
end
function ic_PEnpc_03BUFFxx()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 508117 ) == true then
					CancelBuff(ThesePlayer[i], 508117)
				end
		end					
	end
end
function ic_PEnpc_04BUFFxx_1() --�R������BUFF
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---���a���`
			---say(ThesePlayer[i],"123")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 385 )    --play�N���a�C��id      playpoint  �N���a�o���o�쪺�ӤH�n��
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
			--ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		elseif ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--���a�S��
			---say(ThesePlayer[i],"456")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 385 )    --play�N���a�C��id      playpoint  �N���a�o���o�쪺�ӤH�n��
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		end	
	end					
end
function ic_PEnpc_04BUFFxx_2() --�R������BUFF
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
	local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 1 then	---���a���`
			---say(ThesePlayer[i],"123")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 35 )    --play�N���a�C��id      playpoint  �N���a�o���o�쪺�ӤH�n��
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			Revive( ThesePlayer[i], 6 , -23198, -259, 4435, 0 )
			--ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		elseif ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 then--���a�S��
			---say(ThesePlayer[i],"456")
			Lua_bk_warplayerpoint( ThesePlayer[i] , 35 )    --play�N���a�C��id      playpoint  �N���a�o���o�쪺�ӤH�n��
			AddBuff( ThesePlayer[i],508480,0 ,-1 )
			sleep(20)
			ChangeZone( ThesePlayer[i]  , 6 , 0 , -23198 , -259 , 4435 , 320 )
		end	
	end					
end

function ic_PEnpc_01()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 508115 ) == false then
					AddBuff( ThesePlayer[i],508115,0 ,-1 )
				end
		end					
	end
end
function ic_PEnpc_02()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local TempPlayer = SetSearchAllPlayer(RoomID)----��ϰ�Ҧ����a
local ThesePlayer = {}
	for i=1,TempPlayer do
		ThesePlayer[i] = GetSearchResult() -- ���Ȧs��
		if CheckID( ThesePlayer[i] ) == true and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsDead ) == 0 and 
			ReadRoleValue( ThesePlayer[i] , EM_RoleValue_IsPlayer ) == 1 then
				--�ˬd���a�O���O�٦b�F�ˬd�O�_���`
				if CheckBuff( ThesePlayer[i] , 508116 ) == false then
					AddBuff( ThesePlayer[i],508116,0 ,-1 )
				end
		end					
	end
end
function ic_PE1BUFF_1() 	--Ĳ�o--���~���`��i�H��NPC�WBUFF		
local penpc=TargetID( )
	LoadQuestOption( OwnerID() )----�q NPC��ܤ��e
	SetPlot(TargetID( ),"touch","ic_PE1BUFF_2",40)									----Ĳ�o�L��
end
function ic_PE1BUFF_2() 	--�I���L�᪺��ܵ���
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
	Search = SearchRangePlayer ( penpc , 100 )
	say(TargetID(),"[SC_116838_51]")	
	for i = 0 , table.getn(Search)	do
		if CheckBuff( Search[i] , 508115 ) == false then
			AddBuff( Search[i],508115,0 ,-1 )
		end
	end
end
function ic_PE2BUFF_1() 	--Ĳ�o--��ܦ��`��i�H��NPC�WBUFF			
local penpc=TargetID( )
	LoadQuestOption( OwnerID() )----�q NPC��ܤ��e
	SetPlot(TargetID( ),"touch","ic_PE2BUFF_2",40)									----Ĳ�o�L��
end
function ic_PE2BUFF_2() 	--�I���L�᪺��ܵ���
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
Search = SearchRangePlayer ( penpc , 100 )
		say(TargetID(),"[SC_116838_50]")
		for i = 0 , table.getn(Search)	do
			if CheckBuff( Search[i] , 508116 ) == false then
			AddBuff( Search[i],508116,0 ,-1 )
			end
		end
end
function ic_PE3BUFF_1() 	--Ĳ�o--��ܹ�ܦ��`��i�H��NPC�WBUFF			
local penpc=TargetID( )
local opennpc= ReadRoleValue(penpc,EM_RoleValue_register1)
	LoadQuestOption( OwnerID() )----�q NPC��ܤ��e
	SetPlot(TargetID( ),"touch","ic_PE3BUFF_2",40)									----Ĳ�o�L��
end
function ic_PE3BUFF_2() 	--�I���L�᪺��ܵ���
local penpc=TargetID( )
local Search = SearchRangePlayer ( penpc , 100 )
local opennpc= ReadRoleValue(penpc,EM_RoleValue_register1)
local PE3xxx=ReadRoleValue(opennpc,EM_RoleValue_register4)
Search = SearchRangePlayer ( penpc , 100 )
PE3xxx=ReadRoleValue(opennpc,EM_RoleValue_register4)
	say(TargetID(),"[SC_116838_49]")
	if 	PE3xxx~=0 then
		for i = 0 , table.getn(Search)	do
			if CheckBuff( Search[i] , 508117 ) == false then
			AddBuff(Search[i],508117,PE3xxx-1 ,-1 )
			end
		end
	end
end
function ic_PE398NPC_1()--1������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,2,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(300)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_2()--2������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,4,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(600)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_3()--3������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,6,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(900)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_3" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_4()--4������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,8,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(300)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_5()--5������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,10,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(600)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE398NPC_6()--6������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mob11=CreateObjByFlag(104918,780830,12,1)
local time1=0
WriteRoleValue(mob,EM_RoleValue_register4,mob11)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_ShowRoleHead, false) 			---�Y����(�_)
SetModeEx( mob11 , EM_SetModeType_Obstruct, false) 				---����(�_)
SetModeEx( mob11 , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
SetModeEx( mob11 , EM_SetModeType_SearchenemyIgnore, false) 	---�O�_�Q�j�M(�_)
SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)			---����(�_)
SetModeEx( mob11 , EM_SetModeType_HideName, true)	
AttachObj( mob11 , mob,0 , "p_hit_point01" , "p_hit_point02" )	
AddToPartition(mob11,RoomID)
	while true do
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob9898==1 and time1==0 then
			sleep(900)
			BeginPlot(OwnerID(), "ic_PE3NPCXX9898_2" , 0)
			--BeginPlot(mob11 , "ic_PE3NPCXX9898_1" , 0)
			time1=1
		end
	end
end
function ic_PE3NPCXX9898_1() 	--���NPC�򨮨�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	while true do
		SetFollow( OwnerID(), mob)
		sleep(10)
	end
end
function ic_PE3NPCXX9898_2()---4-6��������u
local mob=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)		
local mob1
local mob2
local mob3
local mob4		
	while true do
		sleep(10)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780830 ,40,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(10)
		elseif mob9898==1 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,41,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==2 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,42,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==3 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,43,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==4 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,44,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==5 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,45,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==6 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,46,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==7 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,47,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
					DelObj(OwnerID())
					DelObj(mob11)
		end
	end	
end
function ic_PE3NPCXX9898_3()---1-3��������u
local mob=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)		
local mob1
local mob2
local mob3
local mob4		
	while true do
		sleep(10)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780830 ,30,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(10)
		elseif mob9898==1 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,31,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==2 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,32,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==3 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,33,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==4 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,34,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==5 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,35,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==6 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,36,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
		elseif mob9898==7 then
					MoveToFlagEnabled(OwnerID(), false)
					WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
					Hide(OwnerID())
					Show(OwnerID(),RoomID)
					DW_MoveToFlag( OwnerID() , 780830 ,37,0)
					WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
					DelObj(OwnerID())
					DelObj(mob11)
		end
	end	
end
function ic_pe3mob_open() 	--���--Ĳ�o�p��
local pe3npc=TargetID( )
	LoadQuestOption( OwnerID())----�q NPC��ܤ��e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_06]" , "ic_pe3mob_yes", 0 ) --���@�N
end
function ic_pe3mob_yes() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=TargetID( )
WriteRoleValue(mob,EM_RoleValue_register9,1)											----Ĳ�oNPC
SetModeEx( mob , EM_SetModeType_Mark, false)			---�i�I��(�O)
			CloseSpeak(OwnerID())														---��������
end
function ic_780796_playfly_()  ---�ǰe����
AddBuff( OwnerID(),508480,0 ,-1 )
ChangeZone( OwnerID() , 6 , 0 , -23198 , -259 , 4435 , 320 )
end
function ic_npc_saysay_1()
npcsay(OwnerID(),"[SC_116838_47]")	--�����Գ��@���A�����H�ɫO��ĵ�١A�]�\�@�w���ĤH�N�b�A���e�C
end
function ic_npc_saysay_2()
npcsay(OwnerID(),"[SC_116838_48]")	--�O���P�ӤF�I�ĤH�H�ɳ����i���ŧ�i��C
end
function ic_npc_saysay_3()
npcsay(OwnerID(),"[SC_116838_54]")	--�O���P�ӤF�I�ĤH�H�ɳ����i���ŧ�i��C
end
function ic_npc_saybuff_3()
AddBuff( OwnerID(),508120,0 ,-1 )
end
function ic_boss1()---���ե�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,1)
		WriteRoleValue(mob,EM_RoleValue_PID,0)
end
function ic_boss2()---���ե�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,2)	
		WriteRoleValue(mob,EM_RoleValue_PID,0)	
end
function ic_boss3()---���ե�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,3)
		WriteRoleValue(mob,EM_RoleValue_PID,0)
end
function ic_boss4()---���ե�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		WriteRoleValue(mob,EM_RoleValue_register9,4)
end