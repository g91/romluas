function ic_pe1_open() 	--���--Ĳ�oPE1
local pe1npc=TargetID( )
local time1=ReadRoleValue(pe1npc,EM_RoleValue_register5)
time1=ReadRoleValue(pe1npc,EM_RoleValue_register5)
	LoadQuestOption( OwnerID())----�q NPC��ܤ��e
	if time1==0 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_05]" , "ic_pe1_yes", 0 ) --��ߧa�I�浹�ڡC
		time1=1
	elseif	time1==1 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_08]" , "ic_pe1_OK", 0 ) --�@�������Q�����F�C
	end
end
function ic_pe1_yes() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe1npc=TargetID( )
local opennpc= ReadRoleValue(TargetID( ),EM_RoleValue_register1) 								---�Ȧs�f�UPID  	open=isaac
WriteRoleValue(pe1npc,EM_RoleValue_register1,opennpc)
WriteRoleValue(pe1npc,EM_RoleValue_register5,1)
WriteRoleValue(pe1npc,EM_RoleValue_register7,1)											---����BUFF��
			CloseSpeak(OwnerID())														---��������
end
function ic_pe1_OK() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe1npc=TargetID( )
local opennpc= ReadRoleValue(pe1npc,EM_RoleValue_register1)
local pe3npc= ReadRoleValue(pe1npc,EM_RoleValue_register9)
local PE1WIN=ReadRoleValue(pe1npc,EM_RoleValue_register4)
	WriteRoleValue(pe1npc,EM_RoleValue_register1,opennpc)
	PE1WIN=ReadRoleValue(pe1npc,EM_RoleValue_register4)
	if PE1WIN==5 then
		WriteRoleValue(opennpc,EM_RoleValue_register1,1)
		WriteRoleValue(pe3npc,EM_RoleValue_register9,1)
		say(pe1npc,"[SC_116838_09]")   --�P�§A�ϤF�ڭ̩Ҧ����x�������I
		BeginPlot(pe1npc, "ic_PE1NPC9898AI" , 0)--�M�h��
	end
	if PE1WIN~=5 then
		say(pe1npc,"[SC_116838_22]")
	end
	CloseSpeak(OwnerID())														---��������
end
function ic_PE1NPC() --�϶���PE1
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe1npc=OwnerID()
local PE1WIN=0
local PE1NO=0
local PE1WIN1=0
local time1=0
local time2=0
local time3=0
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob1=CreateObjByFlag(104904,780796,1,1)
local mob2=CreateObjByFlag(104906,780796,5,1)
local mob3=CreateObjByFlag(104908,780796,9,1)
local mob4=CreateObjByFlag(104910,780796,13,1)
local mob5=CreateObjByFlag(104912,780796,17,1)
WriteRoleValue(mob1,EM_RoleValue_register1,pe1npc)
WriteRoleValue(mob2,EM_RoleValue_register1,pe1npc)
WriteRoleValue(mob3,EM_RoleValue_register1,pe1npc)
WriteRoleValue(mob4,EM_RoleValue_register1,pe1npc)
WriteRoleValue(mob5,EM_RoleValue_register1,pe1npc)
AddToPartition(mob1,RoomID)
AddToPartition(mob2,RoomID)
AddToPartition(mob3,RoomID)
AddToPartition(mob4,RoomID)
AddToPartition(mob5,RoomID)
SetModeEx( mob1 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob1 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob1 , EM_SetModeType_Fight, false) 			---�i���(�_)
SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob2 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob2 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob2 , EM_SetModeType_Fight, false) 			---�i���(�_)
SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob3 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob3 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob3 , EM_SetModeType_Fight, false) 			---�i���(�_)
SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob4 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob4 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob4 , EM_SetModeType_Fight, false) 			---�i���(�O)
SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob5 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob5 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob5 , EM_SetModeType_Fight, false) 			---�i���(�_)
SetModeEx( mob5 , EM_SetModeType_Searchenemy, false)	---����(�_)
BeginPlot(mob1 , "ic_PE1MOB1" , 0)
BeginPlot(mob2 , "ic_PE1MOB2" , 0)
BeginPlot(mob3 , "ic_PE1MOB3" , 0)
BeginPlot(mob4 , "ic_PE1MOB4" , 0)
BeginPlot(mob5 , "ic_PE1MOB5" , 0)
	while true do 
	mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	PE1WIN=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
	PE1NO=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
	 sleep(10)
		if mob123open==1 and time2==0 then
		time2=1 
		WriteRoleValue(mob1,EM_RoleValue_register7,1)
		WriteRoleValue(mob2,EM_RoleValue_register7,1)
		WriteRoleValue(mob3,EM_RoleValue_register7,1)
		WriteRoleValue(mob4,EM_RoleValue_register7,1)
		WriteRoleValue(mob5,EM_RoleValue_register7,1)
		end
		if PE1WIN==5 and time1==0 then
			time1=1
		SetModeEx( pe1npc , EM_SetModeType_Move, true)
		end
		if 	PE1NO==1 and time3==0 then
		time3=1
		SetModeEx( mob1 , EM_SetModeType_Fight, true) 			---�i���(�O)
		SetModeEx( mob2 , EM_SetModeType_Fight, true) 			---�i���(�O)
		SetModeEx( mob3 , EM_SetModeType_Fight, true) 			---�i���(�O)
		SetModeEx( mob4 , EM_SetModeType_Fight, true) 			---�i���(�O)
		SetModeEx( mob5 , EM_SetModeType_Fight, true) 			---�i���(�_)
		SetModeEx( pe1npc , EM_SetModeType_Move, true)
		BeginPlot(pe1npc, "ic_PE1NPC9898AI" , 0)--�M�h��
		say(OwnerID(),"[SC_116838_12]")--�A�ӤF�I�i���o�̤w�g�L�������H�O�i�H�P�]�ڧܿšA�ڭ��٬O���M�h�a�I���ǳQ�٫��������]�u�௬�֥L�̤F�K
		end
	end
end
function ic_PE1NPC9898AI()---�M�h��--������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)		
	DW_MoveToFlag( OwnerID() , 780794 ,42,0)
	sleep(10)
	DW_MoveToFlag( OwnerID() , 780794 ,43,0)
	sleep(10)
	DelObj(OwnerID())
end
function ic_PE1MOB9898AI()---�M�h��--������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)		
	DW_MoveToFlag( OwnerID() , 780794 ,44,0)
	sleep(5)
	DW_MoveToFlag( OwnerID() , 780794 ,45,0)
	DelObj(OwnerID())
end
function ic_PE1MOB1()---1������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1=OwnerID()
local pe1npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)		
local mobxx=ReadRoleValue(pe1npc,EM_RoleValue_register4)
local mob123xx=ReadRoleValue(pe1npc,EM_RoleValue_register9)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob11=CreateObjByFlag(104905,780796,2,1)
local mob12=CreateObjByFlag(104905,780796,3,1)
local mob13=CreateObjByFlag(104905,780796,4,1)
local time1=0
local time2=0
WriteRoleValue(mob11,EM_RoleValue_register1,mob1)
WriteRoleValue(mob12,EM_RoleValue_register1,mob1)
WriteRoleValue(mob13,EM_RoleValue_register1,mob1)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
BeginPlot(mob11 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob12 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob13 , "ic_PE1MOB123AI" , 0)
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob123xx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob123open==1 and time2==0 then
			time2=1
			WriteRoleValue(mob11,EM_RoleValue_register7,1)
			WriteRoleValue(mob12,EM_RoleValue_register7,1)
			WriteRoleValue(mob13,EM_RoleValue_register7,1)
		end
		if mob123xx==3 and time1==0 then
		time1=1
		mobxx= ReadRoleValue(pe1npc,EM_RoleValue_register4)
		WriteRoleValue(pe1npc,EM_RoleValue_register4,mobxx+1)
		SetModeEx( mob1 , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(mob1, "ic_PE1MOB9898AI" , 0)--�M�h��
		say(mob1,"[SC_116838_15]")--�Ӧn�F�A�ש�o�ϤF�I
		end
	end
end
function ic_PE1MOB2()--2������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob2=OwnerID()
local pe1npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)		
local mobxx=ReadRoleValue(pe1npc,EM_RoleValue_register4)
local mob123xx=ReadRoleValue(pe1npc,EM_RoleValue_register9)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob11=CreateObjByFlag(104907,780796,6,1)
local mob12=CreateObjByFlag(104907,780796,7,1)
local mob13=CreateObjByFlag(104907,780796,8,1)
local time1=0
local time2=0 
WriteRoleValue(mob11,EM_RoleValue_register1,mob2)
WriteRoleValue(mob12,EM_RoleValue_register1,mob2)
WriteRoleValue(mob13,EM_RoleValue_register1,mob2)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
BeginPlot(mob11 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob12 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob13 , "ic_PE1MOB123AI" , 0)
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob123xx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob123open==1 and time2==0 then
			time2=1
			WriteRoleValue(mob11,EM_RoleValue_register7,1)
			WriteRoleValue(mob12,EM_RoleValue_register7,1)
			WriteRoleValue(mob13,EM_RoleValue_register7,1)
		end
		if mob123xx==3 and time1==0 then
		time1=1
		mobxx= ReadRoleValue(pe1npc,EM_RoleValue_register4)
		WriteRoleValue(pe1npc,EM_RoleValue_register4,mobxx+1)
		SetModeEx( mob2 , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(mob2, "ic_PE1MOB9898AI" , 0)--�M�h��
		say(mob2,"[SC_116838_16]")--�i�c���]�ڡA���ڦ^�ӦA�n�n���B�A�̡I
		end
	end
end
function ic_PE1MOB3()--3������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob3=OwnerID()
local pe1npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)		
local mobxx=ReadRoleValue(pe1npc,EM_RoleValue_register4)
local mob123xx=ReadRoleValue(pe1npc,EM_RoleValue_register9)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob11=CreateObjByFlag(104909,780796,10,1)
local mob12=CreateObjByFlag(104909,780796,11,1)
local mob13=CreateObjByFlag(104909,780796,12,1)
local time1=0
local time2=0
WriteRoleValue(mob11,EM_RoleValue_register1,mob3)
WriteRoleValue(mob12,EM_RoleValue_register1,mob3)
WriteRoleValue(mob13,EM_RoleValue_register1,mob3)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
BeginPlot(mob11 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob12 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob13 , "ic_PE1MOB123AI" , 0)
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob123xx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob123open==1 and time2==0 then
			time2=1
			WriteRoleValue(mob11,EM_RoleValue_register7,1)
			WriteRoleValue(mob12,EM_RoleValue_register7,1)
			WriteRoleValue(mob13,EM_RoleValue_register7,1)
		end
		if mob123xx==3 and time1==0 then
		time1=1
		mobxx= ReadRoleValue(pe1npc,EM_RoleValue_register4)
		WriteRoleValue(pe1npc,EM_RoleValue_register4,mobxx+1)
		SetModeEx( mob3 , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(mob3, "ic_PE1MOB9898AI" , 0)--�M�h��
		say(mob3,"[SC_116838_17]")---�K�K�L�̹�b�ӴݻŤF�I
		end
	end
end
function ic_PE1MOB4()--4������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob4=OwnerID()
local pe1npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)		
local mobxx=ReadRoleValue(pe1npc,EM_RoleValue_register4)
local mob123xx=ReadRoleValue(pe1npc,EM_RoleValue_register9)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob11=CreateObjByFlag(104911,780796,14,1)
local mob12=CreateObjByFlag(104911,780796,15,1)
local mob13=CreateObjByFlag(104911,780796,16,1)
local time1=0
local time2=0
WriteRoleValue(mob11,EM_RoleValue_register1,mob4)
WriteRoleValue(mob12,EM_RoleValue_register1,mob4)
WriteRoleValue(mob13,EM_RoleValue_register1,mob4)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
BeginPlot(mob11 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob12 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob13 , "ic_PE1MOB123AI" , 0)
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob123xx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob123open==1 and time2==0 then
			time2=1
			WriteRoleValue(mob11,EM_RoleValue_register7,1)
			WriteRoleValue(mob12,EM_RoleValue_register7,1)
			WriteRoleValue(mob13,EM_RoleValue_register7,1)
		end
		if mob123xx==3 and time1==0 then
		time1=1 
		mobxx= ReadRoleValue(pe1npc,EM_RoleValue_register4)
		WriteRoleValue(pe1npc,EM_RoleValue_register4,mobxx+1)
		SetModeEx( mob4 , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(mob4, "ic_PE1MOB9898AI" , 0)--�M�h��
		say(mob4,"[SC_116838_18]")--���¡K�ڷ|�ɧ֦^�����U�A���I
		end
	end
end
function ic_PE1MOB5()--5������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob5=OwnerID()
local pe1npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)		
local mobxx=ReadRoleValue(pe1npc,EM_RoleValue_register4)
local mob123xx=ReadRoleValue(pe1npc,EM_RoleValue_register9)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local mob11=CreateObjByFlag(104913,780796,18,1)
local mob12=CreateObjByFlag(104913,780796,19,1)
local mob13=CreateObjByFlag(104913,780796,20,1)
local time1=0
local time2=0
WriteRoleValue(mob11,EM_RoleValue_register1,mob5)
WriteRoleValue(mob12,EM_RoleValue_register1,mob5)
WriteRoleValue(mob13,EM_RoleValue_register1,mob5)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
BeginPlot(mob11 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob12 , "ic_PE1MOB123AI" , 0)
BeginPlot(mob13 , "ic_PE1MOB123AI" , 0)
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob123xx=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		sleep(10)
		if mob123open==1 and time2==0 then
			time2=1
			WriteRoleValue(mob11,EM_RoleValue_register7,1)
			WriteRoleValue(mob12,EM_RoleValue_register7,1)
			WriteRoleValue(mob13,EM_RoleValue_register7,1)
		end
		if mob123xx==3 and time1==0 then
		time1=1
		mobxx= ReadRoleValue(pe1npc,EM_RoleValue_register4)
		WriteRoleValue(pe1npc,EM_RoleValue_register4,mobxx+1)
		SetModeEx( mob5 , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(mob5, "ic_PE1MOB9898AI" , 0)--�M�h��
		say(mob5,"[SC_116838_19]")--�P�E���ɡI
		end
	end
end
function ic_PE1MOB123AI()--�p�ǹ�ۤv�WBUFF��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0 
	while true do
		mob123open=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		sleep(10)
		if time1==0 then
			time1=1 
			AddBuff( OwnerID(),508078,0 ,-1 )
		end
		if mob123open==1 and time1==1  then
			CancelBuff(OwnerID(), 508078) 	
			time1=2	
		end
	end
end
function ic_PE1MOB123 () --�p�Ǧ��`�p�ƾ�
local mob1= ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobxx= ReadRoleValue(mob1,EM_RoleValue_register9)
	  mobxx= ReadRoleValue(mob1,EM_RoleValue_register9)
	  WriteRoleValue(mob1,EM_RoleValue_register9,mobxx+1)
	  sleep(5)
	  DelObj(OwnerID())
end
---------------------------------------------------------------------�W��PE1
function ic_npc_open() 	--���--Ĳ�oNPC
	LoadQuestOption( OwnerID() )----�q NPC��ܤ��e
	AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_00]" , "ic_pe_yes", 0 ) --��M�S���D�I
end
function ic_pe_yes() 	--Ĳ�o--���		  
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local opennpc=TargetID( )
local isaac= ReadRoleValue(TargetID( ),EM_RoleValue_PID)
local time1=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local door=CreateObjByFlag(105040,780794,200,1)
local door1=CreateObjByFlag(105040,780794,202,1)
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
SetPlot( door,"collision","ic_780796_fly",30 ) 
SetPlot( door1,"collision","ic_780796_fly1",30 ) 
WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   								---�Ȧs�f�UPID  	open=isaac
WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
WriteRoleValue(isaac,EM_RoleValue_register9,5)								---�}�l�F
local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
local ID=GetSearchResult()
local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
	for i = 0 , NPCXX do
		ID=GetSearchResult()
		ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
		if ID2==104198 or ID2==116948 then
			DelObj(ID)
		end
	end
	CloseSpeak(OwnerID())														---��������
	SetPlot(TargetID( ),"touch","ic_pe_no",40)									----Ĳ�o�L��
end
function ic_pe_no() 	--�I���L�᪺��ܵ���
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local isaac= ReadRoleValue(TargetID( ),EM_RoleValue_PID)
local opennpc=TargetID( )
local time1=0
WriteRoleValue(isaac,EM_RoleValue_PID,opennpc)   	---�Ȧs�f�UPID  	open=isaac
WriteRoleValue(opennpc,EM_RoleValue_PID,isaac)
time1=ReadRoleValue(opennpc,EM_RoleValue_register8)
	if 	time1==0 or time1==1 then
		say(opennpc,"[SC_116838_02]")--�Хߨ�X�o�a�I�ɶ��O�����H���K
		ScriptMessage( OwnerID(), -1 , 2 , "[SC_116838_01]" , 2 )		----�ڤw�g���A�۳�e���e�u���q�D�X�ӤF�A�ХѨ���X�o�a�I
	elseif	time1>=2 then
		say(opennpc,"[SC_116838_02]")--�Хߨ�X�o�a�I�ɶ��O�����H���K
	end
end
function ic_780796_fly()  ---�ǰe����
SetPosByFlag( OwnerID() , 780794,201 ) 
end
function ic_780796_fly1()  ---�ǰe����
SetPosByFlag( OwnerID() , 780794,203 ) 
end
-------------------------------------------------------------------�W��Ĳ�o�԰�NPC
function ic_pe2_open() 	--���--Ĳ�oPE2
local pe2npc=TargetID( )
local time1=ReadRoleValue(pe2npc,EM_RoleValue_register5)
time1=ReadRoleValue(pe2npc,EM_RoleValue_register5)
	LoadQuestOption( OwnerID())----�q NPC��ܤ��e
	if time1==0 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_06]" , "ic_pe2_yes", 0 ) --�ڪ��D�F�I
		time1=1
	elseif	time1==1 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_08]" , "ic_pe2_OK", 0 ) --�@�������Q�����F�C
	end
end
function ic_pe2_yes() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe2npc=TargetID( )
local opennpc= ReadRoleValue(TargetID( ),EM_RoleValue_register1) 								---�Ȧs�f�UPID  	open=isaac
WriteRoleValue(pe2npc,EM_RoleValue_register1,opennpc)
WriteRoleValue(pe2npc,EM_RoleValue_register5,1)
WriteRoleValue(pe2npc,EM_RoleValue_register7,1)
			CloseSpeak(OwnerID())														---��������
end
function ic_pe2_OK() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe2npc=TargetID( )
local opennpc= ReadRoleValue(pe2npc,EM_RoleValue_register1)
local PE1WIN=ReadRoleValue(pe2npc,EM_RoleValue_register4)
	WriteRoleValue(pe2npc,EM_RoleValue_register1,opennpc)
	PE1WIN=ReadRoleValue(pe2npc,EM_RoleValue_register4)
	if PE1WIN==5 then
		--say(OwnerID(),"PE2WIN")
		WriteRoleValue(opennpc,EM_RoleValue_register2,1)		---��OPENNPC��Ĺ�F
		SetModeEx( pe2npc , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(pe2npc, "ic_PE2NPC9898" , 0)--�M�h��
		say(pe2npc,"[SC_116838_10]")--�������A�̪������C
	end
	if PE1WIN~=5 then
		say(pe2npc,"[SC_116838_23]")--
	end
	CloseSpeak(OwnerID())														---��������
end
function ic_PE2NPC() --���𫰨�PE2
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe2npc=OwnerID()
local opennpc=ReadRoleValue(pe2npc,EM_RoleValue_register1)
local mob123xx=ReadRoleValue(pe2npc,EM_RoleValue_register4)
local mob123open=ReadRoleValue(pe2npc,EM_RoleValue_register7)
local mob1=CreateObjByFlag(104915,780796,21,1)
local mob2=CreateObjByFlag(104915,780796,25,1)
local mob3=CreateObjByFlag(104915,780796,29,1)
local mob4=CreateObjByFlag(104915,780796,33,1)
local mob5=CreateObjByFlag(104915,780796,37,1)
local PE2WIN=ReadRoleValue(pe2npc,EM_RoleValue_register4)
local PE2NO=ReadRoleValue(pe2npc,EM_RoleValue_register2)
local time1=0
local time2=0
local time3=0
WriteRoleValue(mob1,EM_RoleValue_register1,pe2npc)
WriteRoleValue(mob2,EM_RoleValue_register1,pe2npc)
WriteRoleValue(mob3,EM_RoleValue_register1,pe2npc)
WriteRoleValue(mob4,EM_RoleValue_register1,pe2npc)
WriteRoleValue(mob5,EM_RoleValue_register1,pe2npc)
AddToPartition(mob1,RoomID)
AddToPartition(mob2,RoomID)
AddToPartition(mob3,RoomID)
AddToPartition(mob4,RoomID)
AddToPartition(mob5,RoomID)
SetModeEx( mob1 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob1 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob2 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob2 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob3 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob3 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob4 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob4 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob5 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob5 , EM_SetModeType_Move, false) 			---����	(�_)
SetModeEx( mob5 , EM_SetModeType_Searchenemy, false)	---����(�_)
BeginPlot(mob1 , "ic_PE2MOB1" , 0)
BeginPlot(mob2 , "ic_PE2MOB2" , 0)
BeginPlot(mob3 , "ic_PE2MOB3" , 0)
BeginPlot(mob4 , "ic_PE2MOB4" , 0)
BeginPlot(mob5 , "ic_PE2MOB5" , 0)
	while true do
	mob123xx=ReadRoleValue(pe2npc,EM_RoleValue_register4)
	mob123open=ReadRoleValue(pe2npc,EM_RoleValue_register7)
	PE2WIN=ReadRoleValue(pe2npc,EM_RoleValue_register4)
	PE2NO=ReadRoleValue(pe2npc,EM_RoleValue_register2)
	sleep(10) 
		if PE1WIN==4 and time2==0 then 
			time2=1
			SetModeEx( pe2npc , EM_SetModeType_Move, true)
		end
		if PE2NO==1 and time3==0 then 
			time3=1
			SetModeEx( mob1 , EM_SetModeType_Fight, false) 			---�i���(�O)
			SetModeEx( mob2 , EM_SetModeType_Fight, false) 			---�i���(�O)
			SetModeEx( mob3 , EM_SetModeType_Fight, false) 			---�i���(�O)
			SetModeEx( mob4 , EM_SetModeType_Fight, false) 			---�i���(�O)
			SetModeEx( mob5 , EM_SetModeType_Fight, false) 			---�i���(�O)
			SetModeEx( pe2npc , EM_SetModeType_Move, true)
			WriteRoleValue(mob1,EM_RoleValue_register8,1)
			WriteRoleValue(mob2,EM_RoleValue_register8,1)
			WriteRoleValue(mob3,EM_RoleValue_register8,1)
			WriteRoleValue(mob4,EM_RoleValue_register8,1)
			WriteRoleValue(mob5,EM_RoleValue_register8,1)
			WriteRoleValue(opennpc,EM_RoleValue_register10,1)
			BeginPlot(pe2npc, "ic_PE2NPC9898" , 0)--�M�h��
			say(pe2npc,"[SC_116838_13]")---���K���K���Ǩ��l�i�O�ڭ̪��ߦ�r�I���K�u�O�H�P�����L�K�ܤ֧ڭ̤w�g�ɤO�F�K���§A�A���A�٬O�����}�a�K
		end
		if mob123open==1 and time1==0 then
		time1=1
			WriteRoleValue(mob1,EM_RoleValue_register7,1)
			WriteRoleValue(mob2,EM_RoleValue_register7,1)
			WriteRoleValue(mob3,EM_RoleValue_register7,1)
			WriteRoleValue(mob4,EM_RoleValue_register7,1)
			WriteRoleValue(mob5,EM_RoleValue_register7,1)
		end
	end	
end
function ic_PE2MOB123 ()---���Q�����^�ǭȥ� 
local pe2npc= ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobxx= ReadRoleValue(pe2npc,EM_RoleValue_register4)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local mob12=ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register6)
		mobxx= ReadRoleValue(pe2npc,EM_RoleValue_register4)
		WriteRoleValue(mob11,EM_RoleValue_register9,1)
		WriteRoleValue(mob12,EM_RoleValue_register9,1)
		WriteRoleValue(mob13,EM_RoleValue_register9,1)
		WriteRoleValue(pe2npc,EM_RoleValue_register4,mobxx+1) 
	 DelObj(OwnerID())
end
function ic_PE2NPC9898()--NPC�M�h��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,50,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,51,0)
	DelObj(OwnerID())
end
function ic_PE2MOB9898()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,52,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,53,0)
DelObj(OwnerID())
end
function ic_PE2MOB9898_2()--�p�L���h��4-5����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,54,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,55,0)
DelObj(OwnerID())
end
function ic_PE2MOBAI()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobWIN9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local time1=0
local time2=0
	while true do
		mobWIN9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		sleep(10)
		if mobWIN9898==1 and time1==0 then
			time1=1
			BeginPlot(OwnerID(), "ic_PE2MOB9898" , 0)
			say(OwnerID(),"[SC_116838_20]")--�j�\�i���աI�ݨ����]���ٯ����I
		end
		if mobNO9898==1 and time2==0 then
			time2=1
			BeginPlot(OwnerID(), "ic_PE2MOB9898" , 0)
			say(OwnerID(),"[SC_116838_20]")--�j�\�i���աI�ݨ����]���ٯ����I
		end
	end	
end
function ic_PE2MOBAI_2()--�p�L���h��4-5����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobWIN9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local time1=0
local time2=0
	while true do
		mobWIN9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		sleep(10)
		if mobWIN9898==1 and time1==0 then
			time1=1
			BeginPlot(OwnerID(), "ic_PE2MOB9898_2" , 0)
			say(OwnerID(),"[SC_116838_21]")--�n�A�o�˧ڭ̴N���ξ���]�ڧ�ڭ̪��޳N�m���F�I
		end
		if mobNO9898==1 and time2==0 then
			time2=1
			BeginPlot(OwnerID(), "ic_PE2MOB9898_2" , 0)
			say(OwnerID(),"[SC_116838_21]")--�n�A�o�˧ڭ̴N���ξ���]�ڧ�ڭ̪��޳N�m���F�I
		end
	end	
end
function ic_PE2MOB9898_41()--���d�L1��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1								
local mob2								
local mob3								
local mob4
	while true do
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,52,0)
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,53,0)
		StopMove(OwnerID(),false)
		mob1=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob2=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob3=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob4=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		say(mob1,"[SC_116838_53]")
		say(mob2,"[SC_116838_53]")
		say(mob3,"[SC_116838_53]")
		say(mob4,"[SC_116838_53]")
		BeginPlot(mob1 , "ic_PE2MOB9898_411" , 0)
		BeginPlot(mob2 , "ic_PE2MOB9898_411" , 0)
		BeginPlot(mob3 , "ic_PE2MOB9898_411" , 0)
		BeginPlot(mob4 , "ic_PE2MOB9898_411" , 0)
		sleep(10)
		DelObj(OwnerID())
	end
end
function ic_PE2MOB9898_411()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),RoomID)
	DW_MoveToFlag( OwnerID() , 780796 ,23,0)
end
function ic_PE2MOB9898_42()--���d�L2��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1								
local mob2								
local mob3								
local mob4
	while true do
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,52,0)
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,53,0)
		StopMove(OwnerID(),false)
		mob1=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob2=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob3=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob4=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		say(mob1,"[SC_116838_53]")
		say(mob2,"[SC_116838_53]")
		say(mob3,"[SC_116838_53]")
		say(mob4,"[SC_116838_53]")
		BeginPlot(mob1 , "ic_PE2MOB9898_422" , 0)
		BeginPlot(mob2 , "ic_PE2MOB9898_422" , 0)
		BeginPlot(mob3 , "ic_PE2MOB9898_422" , 0)
		BeginPlot(mob4 , "ic_PE2MOB9898_422" , 0)
		sleep(10)
		DelObj(OwnerID())
	end
end
function ic_PE2MOB9898_422()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),RoomID)
	DW_MoveToFlag( OwnerID() , 780796 ,27,0)
end
function ic_PE2MOB9898_43()--���d�L3��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1								
local mob2								
local mob3								
local mob4
	while true do
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,52,0)
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,53,0)
		StopMove(OwnerID(),false)
		mob1=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob2=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob3=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		mob4=CreateObjByFlag(105199,780794,53,1)	--3���p�ǤW
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		say(mob1,"[SC_116838_53]")
		say(mob2,"[SC_116838_53]")
		say(mob3,"[SC_116838_53]")
		say(mob4,"[SC_116838_53]")
		BeginPlot(mob1 , "ic_PE2MOB9898_433" , 0)
		BeginPlot(mob2 , "ic_PE2MOB9898_433" , 0)
		BeginPlot(mob3 , "ic_PE2MOB9898_433" , 0)
		BeginPlot(mob4 , "ic_PE2MOB9898_433" , 0)
		sleep(10)
		DelObj(OwnerID())
	end
end
function ic_PE2MOB9898_433()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),RoomID)
	DW_MoveToFlag( OwnerID() , 780796 ,31,0)
end
function ic_PE2MOB9898_44()--���d�L4��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1								
local mob2								
local mob3								
local mob4
	while true do
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,54,0)
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,55,0)
		StopMove(OwnerID(),false)
		mob1=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob2=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob3=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob4=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		say(mob1,"[SC_116838_53]")
		say(mob2,"[SC_116838_53]")
		say(mob3,"[SC_116838_53]")
		say(mob4,"[SC_116838_53]")
		BeginPlot(mob1 , "ic_PE2MOB9898_444" , 0)
		BeginPlot(mob2 , "ic_PE2MOB9898_444" , 0)
		BeginPlot(mob3 , "ic_PE2MOB9898_444" , 0)
		BeginPlot(mob4 , "ic_PE2MOB9898_444" , 0)
		sleep(10)
		DelObj(OwnerID())
	end
end
function ic_PE2MOB9898_444()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),RoomID)
	DW_MoveToFlag( OwnerID() , 780796 ,35,0)
end
function ic_PE2MOB9898_45()--���d�L5��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1								
local mob2								
local mob3								
local mob4
	while true do
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,54,0)
		WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
		Hide(OwnerID())
		Show(OwnerID(),RoomID)
		DW_MoveToFlag( OwnerID() , 780794 ,55,0)
		StopMove(OwnerID(),false)
		mob1=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob2=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob3=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		mob4=CreateObjByFlag(105199,780794,55,1)	--3���p�ǤW
		AddToPartition(mob1,RoomID)
		AddToPartition(mob2,RoomID)
		AddToPartition(mob3,RoomID)
		AddToPartition(mob4,RoomID)
		say(mob1,"[SC_116838_53]")
		say(mob2,"[SC_116838_53]")
		say(mob3,"[SC_116838_53]")
		say(mob4,"[SC_116838_53]")
		BeginPlot(mob1 , "ic_PE2MOB9898_455" , 0)
		BeginPlot(mob2 , "ic_PE2MOB9898_455" , 0)
		BeginPlot(mob3 , "ic_PE2MOB9898_455" , 0)
		BeginPlot(mob4 , "ic_PE2MOB9898_455" , 0)
		sleep(10)
		DelObj(OwnerID())
	end
end
function ic_PE2MOB9898_455()--�p�L���h��1-3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
	Hide(OwnerID())
	Show(OwnerID(),RoomID)
	DW_MoveToFlag( OwnerID() , 780796 ,39,0)
end
function ic_PE2MOB1()--1����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob1=OwnerID()
local pe2npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0		
local time2=0	
local time3=0
local mob11=CreateObjByFlag(104914,780796,22,1)
local mob12=CreateObjByFlag(104914,780796,23,1)
local mob13=CreateObjByFlag(104914,780796,24,1)
local mob14
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
local HPPercent = NowHP / MaxHP	  
WriteRoleValue(mob1,EM_RoleValue_register4,mob11)
WriteRoleValue(mob1,EM_RoleValue_register5,mob12)
WriteRoleValue(mob1,EM_RoleValue_register6,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob1)
WriteRoleValue(mob12,EM_RoleValue_register1,mob1)
WriteRoleValue(mob13,EM_RoleValue_register1,mob1)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
SetAttack(mob11 , mob1)---���w����
SetAttack(mob12 , mob1)---���w����
SetAttack(mob13 , mob1)---���w����
BeginPlot(mob11, "ic_PE2MOBAI" , 0)
BeginPlot(mob12, "ic_PE2MOBAI" , 0)
BeginPlot(mob13, "ic_PE2MOBAI" , 0)
AddBuff( OwnerID(),508078,0 ,-1 )
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do
	mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
	HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		if HPPercent<=0.50 and time3==0 then
		 mob14=CreateObjByFlag(105198,780796,23,1)
		 SetModeEx( mob14 , EM_SetModeType_Strikback, false) 		---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_Searchenemy, false)	---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
		 AddToPartition(mob14,RoomID)
		 say(mob14,"[SC_116838_52]")
		 AddBuff( mob14,508120,0 ,-1 )
		 BeginPlot(mob14, "ic_PE2MOB9898_41" , 0)
		 time3=1
		end
		if bobbufxx==1 and time2==0 then
			time2=1
			CancelBuff(OwnerID(), 508078) 
		end
		if mobNO9898==1 and time1==0 then
			time1=1
			say(mob11,"[SC_116838_25]")--����F�A�٬O���a�K
			say(mob12,"[SC_116838_25]")--����F�A�٬O���a�K
			say(mob13,"[SC_116838_25]")--����F�A�٬O���a�K
			WriteRoleValue(mob11,EM_RoleValue_register8,1)
			WriteRoleValue(mob12,EM_RoleValue_register8,1)
			WriteRoleValue(mob13,EM_RoleValue_register8,1)
		end
	end
end
function ic_PE2MOB2()--2����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob2=OwnerID()
local pe2npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0	
local time2=0	
local time3=0		
local mob11=CreateObjByFlag(104914,780796,26,1)
local mob12=CreateObjByFlag(104914,780796,27,1)
local mob13=CreateObjByFlag(104914,780796,28,1)
local mob14
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
local HPPercent = NowHP / MaxHP	 
WriteRoleValue(mob2,EM_RoleValue_register4,mob11)
WriteRoleValue(mob2,EM_RoleValue_register5,mob12)
WriteRoleValue(mob2,EM_RoleValue_register6,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob2)
WriteRoleValue(mob12,EM_RoleValue_register1,mob2)
WriteRoleValue(mob13,EM_RoleValue_register1,mob2)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
SetAttack(mob11 , mob2)---���w����
SetAttack(mob12 , mob2)---���w����
SetAttack(mob13 , mob2)---���w����
BeginPlot(mob11, "ic_PE2MOBAI" , 0)
BeginPlot(mob12, "ic_PE2MOBAI" , 0)
BeginPlot(mob13, "ic_PE2MOBAI" , 0)
AddBuff( OwnerID(),508078,0 ,-1 )
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do
	mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
	HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		if HPPercent<=0.50 and time3==0 then
		 mob14=CreateObjByFlag(105198,780796,27,1)
		 SetModeEx( mob14 , EM_SetModeType_Strikback, false) 		---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_Searchenemy, false)	---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
		 AddToPartition(mob14,RoomID)
		  say(mob14,"[SC_116838_52]")
		   AddBuff( mob14,508120,0 ,-1 )
		  BeginPlot(mob14, "ic_PE2MOB9898_42" , 0)
		  time3=1
		end
		if bobbufxx==1 and time2==0 then
			time2=1
			CancelBuff(OwnerID(), 508078) 
		end
		if mobNO9898==1 and time1==0 then
			time1=1
			say(mob11,"[SC_116838_26]")--�@�K�گu���ɤO�F�K
			say(mob12,"[SC_116838_26]")--�@�K�گu���ɤO�F�K
			say(mob13,"[SC_116838_26]")--�@�K�گu���ɤO�F�K
			WriteRoleValue(mob11,EM_RoleValue_register8,1)
			WriteRoleValue(mob12,EM_RoleValue_register8,1)
			WriteRoleValue(mob13,EM_RoleValue_register8,1)
		end
	end
end
function ic_PE2MOB3()--3����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob3=OwnerID()
local pe2npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0		
local time2=0	
local time3=0	
local mob11=CreateObjByFlag(104914,780796,30,1)
local mob12=CreateObjByFlag(104914,780796,31,1)
local mob13=CreateObjByFlag(104914,780796,32,1)
local mob14
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
local HPPercent = NowHP / MaxHP	 
WriteRoleValue(mob3,EM_RoleValue_register4,mob11)
WriteRoleValue(mob3,EM_RoleValue_register5,mob12)
WriteRoleValue(mob3,EM_RoleValue_register6,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob3)
WriteRoleValue(mob12,EM_RoleValue_register1,mob3)
WriteRoleValue(mob13,EM_RoleValue_register1,mob3)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
SetAttack(mob11 , mob3)---���w����
SetAttack(mob12 , mob3)---���w����
SetAttack(mob13 , mob3)---���w����
BeginPlot(mob11, "ic_PE2MOBAI" , 0)
BeginPlot(mob12, "ic_PE2MOBAI" , 0)
BeginPlot(mob13, "ic_PE2MOBAI" , 0)
AddBuff( OwnerID(),508078,0 ,-1 )
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do
	mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
	HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		if HPPercent<=0.50 and time3==0 then
		 mob14=CreateObjByFlag(105198,780796,31,1)
		 SetModeEx( mob14 , EM_SetModeType_Strikback, false) 		---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_Searchenemy, false)	---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
		 AddToPartition(mob14,RoomID)
		  say(mob14,"[SC_116838_52]")
		   AddBuff( mob14,508120,0 ,-1 )
		  BeginPlot(mob14, "ic_PE2MOB9898_43" , 0)
		  time3=1
		end
		if bobbufxx==1 and time2==0 then
			time2=1
			CancelBuff(OwnerID(), 508078) 
		end
		if mobNO9898==1 and time1==0 then
			time1=1
			say(mob11,"[SC_116838_27]")--���ѤF�K�|�ܦ��ƻ�ˤl�O�K�H
			say(mob12,"[SC_116838_27]")--���ѤF�K�|�ܦ��ƻ�ˤl�O�K�H
			say(mob13,"[SC_116838_27]")--���ѤF�K�|�ܦ��ƻ�ˤl�O�K�H
			WriteRoleValue(mob11,EM_RoleValue_register8,1)
			WriteRoleValue(mob12,EM_RoleValue_register8,1)
			WriteRoleValue(mob13,EM_RoleValue_register8,1)
		end
	end
end
function ic_PE2MOB4()--4����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob4=OwnerID()
local pe2npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0	
local time2=0	
local time3=0		
local mob11=CreateObjByFlag(104914,780796,34,1)
local mob12=CreateObjByFlag(104914,780796,35,1)
local mob13=CreateObjByFlag(104914,780796,36,1)
local mob14
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
local HPPercent = NowHP / MaxHP	 
WriteRoleValue(mob4,EM_RoleValue_register4,mob11)
WriteRoleValue(mob4,EM_RoleValue_register5,mob12)
WriteRoleValue(mob4,EM_RoleValue_register6,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob4)
WriteRoleValue(mob12,EM_RoleValue_register1,mob4)
WriteRoleValue(mob13,EM_RoleValue_register1,mob4)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
SetAttack(mob11 , mob4)---���w����
SetAttack(mob12 , mob4)---���w����
SetAttack(mob13 , mob4)---���w����
BeginPlot(mob11, "ic_PE2MOBAI_2" , 0)
BeginPlot(mob12, "ic_PE2MOBAI_2" , 0)
BeginPlot(mob13, "ic_PE2MOBAI_2" , 0)
AddBuff( OwnerID(),508078,0 ,-1 )
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do
	mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
	HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		if HPPercent<=0.50 and time3==0 then
		 mob14=CreateObjByFlag(105198,780796,35,1)
		 SetModeEx( mob14 , EM_SetModeType_Strikback, false) 		---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_Searchenemy, false)	---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
		 AddToPartition(mob14,RoomID)
		  say(mob14,"[SC_116838_52]")
		   AddBuff( mob14,508120,0 ,-1 )
		  BeginPlot(mob14, "ic_PE2MOB9898_44" , 0)
		  time3=1
		end
		if bobbufxx==1 and time2==0 then
			time2=1
			CancelBuff(OwnerID(), 508078) 
		end
		if mobNO9898==1 and time1==0 then
			time1=1
			say(mob11,"[SC_116838_28]")--�ڡI�N�t����@�I�I�r�I
			say(mob12,"[SC_116838_28]")--�ڡI�N�t����@�I�I�r�I
			say(mob13,"[SC_116838_28]")--�ڡI�N�t����@�I�I�r�I
			WriteRoleValue(mob11,EM_RoleValue_register8,1)
			WriteRoleValue(mob12,EM_RoleValue_register8,1)
			WriteRoleValue(mob13,EM_RoleValue_register8,1)
		end
	end
end
function ic_PE2MOB5()--5����
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob5=OwnerID()
local pe2npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)	
local mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local time1=0	
local time2=0	
local time3=0
local mob11=CreateObjByFlag(104914,780796,38,1)
local mob12=CreateObjByFlag(104914,780796,39,1)
local mob13=CreateObjByFlag(104914,780796,40,1)
local mob14
local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
local NowHP = ReadRoleValue(  OwnerID() , EM_RoleValue_HP )     --Ū���ثe��q
local HPPercent = NowHP / MaxHP	 
WriteRoleValue(mob5,EM_RoleValue_register4,mob11)
WriteRoleValue(mob5,EM_RoleValue_register5,mob12)
WriteRoleValue(mob5,EM_RoleValue_register6,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob5)
WriteRoleValue(mob12,EM_RoleValue_register1,mob5)
WriteRoleValue(mob13,EM_RoleValue_register1,mob5)
AddToPartition(mob11,RoomID)
AddToPartition(mob12,RoomID)
AddToPartition(mob13,RoomID)
SetAttack(mob11 , mob5)---���w����
SetAttack(mob12 , mob5)---���w����
SetAttack(mob13 , mob5)---���w����
BeginPlot(mob11, "ic_PE2MOBAI_2" , 0)
BeginPlot(mob12, "ic_PE2MOBAI_2" , 0)
BeginPlot(mob13, "ic_PE2MOBAI_2" , 0)
AddBuff( OwnerID(),508078,0 ,-1 )
AddBuff( OwnerID(),508120,0 ,-1 )
	while true do
	mobNO9898= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
	bobbufxx=ReadRoleValue(OwnerID(),EM_RoleValue_register7)
	MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )	--Ū����q
	NowHP = ReadRoleValue( OwnerID() , EM_RoleValue_HP )--------Ū���ثe��q
	HPPercent = NowHP / MaxHP	--��q�ʤ���
		sleep(10)
		if HPPercent<=0.50 and time3==0 then
		 mob14=CreateObjByFlag(105198,780796,39,1)
		 SetModeEx( mob14 , EM_SetModeType_Strikback, false) 		---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_Searchenemy, false)	---����(�_)
		 SetModeEx( mob14 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
		 AddToPartition(mob14,RoomID)
		  say(mob14,"[SC_116838_52]")
		   AddBuff( mob14,508120,0 ,-1 )
		 BeginPlot(mob14, "ic_PE2MOB9898_45" , 0)
		 time3=1
		end
		if bobbufxx==1 and time2==0 then
			time2=1
			CancelBuff(OwnerID(), 508078) 
		end
		if mobNO9898==1 and time1==0 then
			time1=1
			say(mob11,"[SC_116838_29]")--�ڭ̪����O�Y�������I
			say(mob12,"[SC_116838_29]")--�ڭ̪����O�Y�������I
			say(mob13,"[SC_116838_29]")--�ڭ̪����O�Y�������I
			WriteRoleValue(mob11,EM_RoleValue_register8,1)
			WriteRoleValue(mob12,EM_RoleValue_register8,1)
			WriteRoleValue(mob13,EM_RoleValue_register8,1)
		end
	end
end
