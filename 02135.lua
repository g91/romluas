function ic_pe3_open() 	--���--Ĳ�oPE3  
local pe3npc=TargetID( )
local time1=ReadRoleValue(pe3npc,EM_RoleValue_register5)
time1=ReadRoleValue(pe3npc,EM_RoleValue_register5)
	LoadQuestOption( OwnerID())----�q NPC��ܤ��e
	if time1==0 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_07]" , "ic_pe3_yes", 0 ) --�n���A�ڰ��W�h�C
		time1=1
	elseif	time1==1 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_116838_08]" , "ic_pe3_OK", 0 ) --�@�������Q�����F�C
	end
end
function ic_pe3_yes() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe3npc=TargetID( )
local opennpc= ReadRoleValue(TargetID( ),EM_RoleValue_register1)   								---�Ȧs�f�UPID  	open=isaac
WriteRoleValue(pe3npc,EM_RoleValue_register1,opennpc)
WriteRoleValue(pe3npc,EM_RoleValue_register5,1)
WriteRoleValue(pe3npc,EM_RoleValue_register7,1)											----Ĳ�oNPC
			CloseSpeak(OwnerID())														---��������
end
function ic_pe3_OK() 	--Ĳ�o--���		
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe3npc=TargetID( )
local opennpc= ReadRoleValue(pe3npc,EM_RoleValue_register1)
local PE3WIN1=ReadRoleValue(pe3npc,EM_RoleValue_register3)
local PE3WIN2=ReadRoleValue(pe3npc,EM_RoleValue_PID)
local PE3WIN3=ReadRoleValue(pe3npc,EM_RoleValue_register6)
local PE3WIN4=ReadRoleValue(pe3npc,EM_RoleValue_register8)
local skilllv=0 		
	mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)							
	WriteRoleValue(pe3npc,EM_RoleValue_register1,opennpc)
	PE3WIN1=ReadRoleValue(pe3npc,EM_RoleValue_register3)
	PE3WIN2=ReadRoleValue(pe3npc,EM_RoleValue_PID)
	PE3WIN3=ReadRoleValue(pe3npc,EM_RoleValue_register6)
	PE3WIN4=ReadRoleValue(pe3npc,EM_RoleValue_register8)
	skilllv=PE3WIN1+PE3WIN2+PE3WIN3+PE3WIN4
	--say(TargetID(),"mobxx="..mobxx)
	if PE3WIN1==1 and PE3WIN2==1 and PE3WIN3==1 and PE3WIN4==1 then
		--say(OwnerID(),"PE1WIN")
		WriteRoleValue(opennpc,EM_RoleValue_register4,4)
		WriteRoleValue(opennpc,EM_RoleValue_register3,1)		---��OPENNPC��Ĺ�F
		SetModeEx( pe3npc , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(pe3npc, "ic_PE3NPC9898" , 0)--�M�h��
		say(pe3npc,"[SC_116838_11]")--³���������Q�a�B�^�ӤF�A�u�O�D�`�P�¡I
	elseif mobxx==4  then
		say(pe3npc,"[SC_116838_14]")--�]�ڤӨ��t�F�I��M�L�̤w�g�ǳƫܤ[�K�֤F�o��³���A�h�L�̪���O�P�ԤO�N����v�T�K
		local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
		local ID=GetSearchResult()
		local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
			for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104918 or ID2==104959  or ID2==116907 or ID2==116908 or ID2==116909 or ID2==116910 or ID2==104814 then
					DelObj(ID)
					end
			end
		PE3NOXX=PE3WIN1+PE3WIN2+PE3WIN3+PE3WIN4
		WriteRoleValue(opennpc,EM_RoleValue_register4,PE3NOXX)
		WriteRoleValue(opennpc,EM_RoleValue_register9,33) 
		SetModeEx( pe3npc , EM_SetModeType_Move, true)---����	(�O)
		BeginPlot(pe3npc, "ic_PE3NPC9898" , 0)--�M�h��
	end
	if PE3WIN1==0 and mobxx<=3 or PE3WIN2==0 and mobxx<=3 or PE3WIN3==0 and mobxx<=3 or PE3WIN4==0 and mobxx<=3  then
		say(pe3npc,"[SC_116838_24]")---
	end
	CloseSpeak(OwnerID())														---��������
end
function ic_PE3NPC() --�M�h��PE3�O�@���l---6
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local pe3npc=OwnerID()
local opennpc=ReadRoleValue(pe3npc,EM_RoleValue_register1)
local mob123xx=ReadRoleValue(pe3npc,EM_RoleValue_register4)
local mob123open=ReadRoleValue(pe3npc,EM_RoleValue_register7)
local PE1WIN=ReadRoleValue(pe3npc,EM_RoleValue_register9)
local mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
local mob1=CreateObjByFlag(116907,780796,41,1)
local mob2=CreateObjByFlag(116908,780796,44,1)
local mob3=CreateObjByFlag(116909,780796,47,1)
local mob4=CreateObjByFlag(116910,780796,50,1)
local PE3WIN1=ReadRoleValue(pe3npc,EM_RoleValue_register3)
local PE3WIN2=ReadRoleValue(pe3npc,EM_RoleValue_PID)
local PE3WIN3=ReadRoleValue(pe3npc,EM_RoleValue_register6)
local PE3WIN4=ReadRoleValue(pe3npc,EM_RoleValue_register8)
local PE3NO=ReadRoleValue(pe3npc,EM_RoleValue_register2)
local PE3NOXX=0
local time1=0
local time2=0
local time3=0
local time4=0
WriteRoleValue(mob1,EM_RoleValue_register1,pe3npc)
WriteRoleValue(mob2,EM_RoleValue_register1,pe3npc)
WriteRoleValue(mob3,EM_RoleValue_register1,pe3npc)
WriteRoleValue(mob4,EM_RoleValue_register1,pe3npc)
AddToPartition(mob1,RoomID)
AddToPartition(mob2,RoomID)
AddToPartition(mob3,RoomID)
AddToPartition(mob4,RoomID)
SetModeEx( mob1 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob1 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob1 , EM_SetModeType_Mark, false)			---�i�I��(�_)
SetModeEx( mob2 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob2 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob2 , EM_SetModeType_Mark, false)			---�i�I��(�_)
SetModeEx( mob3 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob3 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob3 , EM_SetModeType_Mark, false)			---�i�I��(�_)
SetModeEx( mob4 , EM_SetModeType_Strikback, false) 		---����(�_)
SetModeEx( mob4 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob4 , EM_SetModeType_Mark, false)			---�i�I��(�_)
BeginPlot(mob1 , "ic_PE3MOB1" , 0)
BeginPlot(mob2 , "ic_PE3MOB2" , 0)
BeginPlot(mob3 , "ic_PE3MOB3" , 0)
BeginPlot(mob4 , "ic_PE3MOB4" , 0)
	while true do
	PE1WIN=ReadRoleValue(pe3npc,EM_RoleValue_register9)
	mob123xx=ReadRoleValue(pe3npc,EM_RoleValue_register4)
	mob123open=ReadRoleValue(pe3npc,EM_RoleValue_register7)
	PE3WIN1=ReadRoleValue(pe3npc,EM_RoleValue_register3)
	PE3WIN2=ReadRoleValue(pe3npc,EM_RoleValue_PID)
	PE3WIN3=ReadRoleValue(pe3npc,EM_RoleValue_register6)
	PE3WIN4=ReadRoleValue(pe3npc,EM_RoleValue_register8)
	PE3NO=ReadRoleValue(pe3npc,EM_RoleValue_register2)
	sleep(10) 
		if PE1WIN==1 and time4==0 then
			time4=1
			WriteRoleValue(mob1,EM_RoleValue_register8,1)
			WriteRoleValue(mob2,EM_RoleValue_register8,1)
			WriteRoleValue(mob3,EM_RoleValue_register8,1)
			WriteRoleValue(mob4,EM_RoleValue_register8,1)
		end
		if PE3WIN1==1 and PE3WIN2==1 and PE3WIN3==1 and PE3WIN4==1 and time2==0 then 
			time2=1
			SetModeEx( pe3npc , EM_SetModeType_Move, true)
		end
		if PE3NO==1 and time3==0 then 
			time3=1
			
			SetModeEx( pe3npc , EM_SetModeType_Move, true)
			PE3NOXX=PE3WIN1+PE3WIN2+PE3WIN3+PE3WIN4
			WriteRoleValue(opennpc,EM_RoleValue_register4,PE3NOXX)
			WriteRoleValue(mob1,EM_RoleValue_register7,1)
			WriteRoleValue(mob2,EM_RoleValue_register7,1)
			WriteRoleValue(mob3,EM_RoleValue_register7,1)
			WriteRoleValue(mob4,EM_RoleValue_register7,1)
			SetModeEx( pe3npc , EM_SetModeType_Move, true)
			local NPCXX = SetSearchAllNPC(RoomID )---���ϰ��NPC
			local ID=GetSearchResult()
			local ID2=ReadRoleValue(ID,EM_RoleValue_OrgID) 
			for i = 0 , NPCXX do
					ID=GetSearchResult()
					ID2=ReadRoleValue(ID,EM_RoleValue_OrgID)
					if ID2==104918 or ID2==104959  or ID2==116907 or ID2==116908 or ID2==116909 or ID2==116910 or ID2==104814  then
					DelObj(ID)
					end
			end
			say(pe3npc,"[SC_116838_14]")--�]�ڤӨ��t�F�I��M�L�̤w�g�ǳƫܤ[�K�֤F�o��³���A�h�L�̪���O�P�ԤO�N����v�T�K
			BeginPlot(pe3npc, "ic_PE3NPC9898" , 0)--�M�h��
			
		end
		if mob123open==1 and time1==0 then
		time1=1
			SetModeEx( mob1 , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( mob2 , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( mob3 , EM_SetModeType_Mark, true)			---�i�I��(�O)
			SetModeEx( mob4 , EM_SetModeType_Mark, true)			---�i�I��(�O)
		end
	end	
end
function ic_PE3NPC9898()--NPC�M�h��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,60,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,61,0)
Sleep(20)
	DelObj(OwnerID())
end

function ic_PE3MOB9898_1()--����M�h��1-2��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,62,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,63,0)
Sleep(20)
	DelObj(OwnerID())
end
function ic_PE3MOB9898_2()--����M�h��3-4��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
DW_MoveToFlag( OwnerID() , 780794 ,64,0)
	sleep(5)
DW_MoveToFlag( OwnerID() , 780794 ,65,0)
Sleep(20)
	DelObj(OwnerID())
end
function ic_PE3MOB1_9898()---1��������u
local mob11=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
local mob1
local mob2
local mob3
local mob4			
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if hatelistcount(OwnerID())~=0 	then
			WriteRoleValue(mob,EM_RoleValue_register5,1)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			WriteRoleValue(mob,EM_RoleValue_register5,0)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,70,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,71,0)
				mob1=CreateObjByFlag(105035,780805,78,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,78,1)	--3���p�ǤW
				mob3=CreateObjByFlag(105035,780805,78,1)	--3���p�ǤW
				mob4=CreateObjByFlag(105035,780805,78,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,72,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,73,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==4 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,74,0)
				mob1=CreateObjByFlag(105035,780805,111,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,111,1)	--3���p�ǤW
				--mob3=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				--mob4=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				--AddToPartition(mob3,RoomID)
				--AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==5 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,75,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==6 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,76,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==7 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,77,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				WriteRoleValue(mob,EM_RoleValue_register2,1)
				DelObj(OwnerID())
				end
			end
		end	
		sleep(10)
	end
end
function ic_PE3MOB2_9898()---2��������u
local mob11=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
local mob1
local mob2
local mob3
local mob4			
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if hatelistcount(OwnerID())~=0 	then
			WriteRoleValue(mob,EM_RoleValue_register5,1)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			WriteRoleValue(mob,EM_RoleValue_register5,0)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,80,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,81,0)
				mob1=CreateObjByFlag(105035,780805,88,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,88,1)	--3���p�ǤW
				mob3=CreateObjByFlag(105035,780805,88,1)	--3���p�ǤW
				mob4=CreateObjByFlag(105035,780805,88,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,82,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,83,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==4 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,84,0)
				mob1=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				--mob3=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				--mob4=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				--AddToPartition(mob3,RoomID)
				--AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==5 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,85,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==6 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,86,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==7 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,87,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				WriteRoleValue(mob,EM_RoleValue_register2,1)
				DelObj(OwnerID())
				end
			end
		end	
		sleep(10)
	end
end
function ic_PE3MOB3_9898()---3��������u
local mob11=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)	
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)	
local mob1
local mob2
local mob3
local mob4		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if hatelistcount(OwnerID())~=0 	then
			WriteRoleValue(mob,EM_RoleValue_register5,1)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			WriteRoleValue(mob,EM_RoleValue_register5,0)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,90,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,91,0)
				mob1=CreateObjByFlag(105035,780805,98,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,98,1)	--3���p�ǤW
				mob3=CreateObjByFlag(105035,780805,98,1)	--3���p�ǤW
				mob4=CreateObjByFlag(105035,780805,98,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,92,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,93,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==4 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,94,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==5 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,95,0)
				mob1=CreateObjByFlag(105035,780805,113,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,113,1)	--3���p�ǤW
				--mob3=CreateObjByFlag(105035,780805,113,1)	--3���p�ǤW
				--mob4=CreateObjByFlag(105035,780805,113,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				--AddToPartition(mob3,RoomID)
				--AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==6 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,96,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==7 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,97,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				WriteRoleValue(mob,EM_RoleValue_register2,1)
				DelObj(OwnerID())
				end
			end
		end	
		sleep(10)
	end
end
function ic_PE3MOB4_9898()---4��������u
local mob11=OwnerID()
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
local mob1
local mob2
local mob3
local mob4			
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
		mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register10)
		if hatelistcount(OwnerID())~=0 	then
			WriteRoleValue(mob,EM_RoleValue_register5,1)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			WriteRoleValue(mob,EM_RoleValue_register5,0)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,100,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,101,0)
				mob1=CreateObjByFlag(105035,780805,108,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,108,1)	--3���p�ǤW
				mob3=CreateObjByFlag(105035,780805,108,1)	--3���p�ǤW
				mob4=CreateObjByFlag(105035,780805,108,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				AddToPartition(mob3,RoomID)
				AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,102,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,103,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==4 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,104,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==5 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,105,0)
				mob1=CreateObjByFlag(105035,780805,110,1)	--3���p�ǤW
				mob2=CreateObjByFlag(105035,780805,110,1)	--3���p�ǤW
				--mob3=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				--mob4=CreateObjByFlag(105035,780805,112,1)	--3���p�ǤW
				WriteRoleValue(mob1,EM_RoleValue_PID,mob11)
				WriteRoleValue(mob2,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob3,EM_RoleValue_PID,mob11)
				--WriteRoleValue(mob4,EM_RoleValue_PID,mob11)
				AddToPartition(mob1,RoomID)
				AddToPartition(mob2,RoomID)
				--AddToPartition(mob3,RoomID)
				--AddToPartition(mob4,RoomID)
				BeginPlot(mob1, "ic_PE3MOB9844" , 0)
				BeginPlot(mob2, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob3, "ic_PE3MOB9844" , 0)
				--BeginPlot(mob4, "ic_PE3MOB9844" , 0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				BeginPlot(mob13, "ic_780796_9898_BUFF99" , 0)
				sleep(30)
				elseif mob9898==6 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,106,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				sleep(30)
				elseif mob9898==7 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,1)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,107,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register2,mob9898+1)
				WriteRoleValue(mob,EM_RoleValue_register2,1)
				DelObj(OwnerID())
				end
			end
		end	
		sleep(10)
	end
end
function ic_PE3MOB9844()--�����p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	mob11=ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
	SetAttack(OwnerID() , mob11)
	sleep(10)
	end
end
function ic_PE3MOB44()--���z��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
	 mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
	 mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register9)	
		WriteRoleValue(mob,EM_RoleValue_register4,1)
		DelObj(mob11)
end
function ic_PE3MOB1()--1������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local pe3npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local mob9898XX1= ReadRoleValue(OwnerID(),EM_RoleValue_register6)
local opennpc= ReadRoleValue(pe3npc,EM_RoleValue_register)	
local mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
local time1=0	
local time2=0		
local time3=0
local time4=0	
local time5=0	
local time6=0	
local mob11=CreateObjByFlag(104814,780796,42,1)
local mob13=CreateObjByFlag(104918,780830,61,1)
local mob12
WriteRoleValue(mob11,EM_RoleValue_register10,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
WriteRoleValue(mob11,EM_RoleValue_register3,pe3npc)
WriteRoleValue(OwnerID(),EM_RoleValue_register3,mob13)
--SetModeEx( mob11 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)	---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
--SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
AddToPartition(mob11,RoomID)
WriteRoleValue(mob13,EM_RoleValue_register9,mob11)
WriteRoleValue(mob13,EM_RoleValue_register1,mob)
WriteRoleValue(mob13,EM_RoleValue_register3,pe3npc)
--SetModeEx( mob13 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob13 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob13 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
SetModeEx( mob13 , EM_SetModeType_Mark, false)					---�i�I��(�_)
AddToPartition(mob13,RoomID)
AddBuff( mob11,508120,0 ,-1 )
AttachObj( mob13 , mob11,0 , "p_hit_point01" , "p_hit_point02" )
--BeginPlot(mob13 , "ic_pe3mob_9898_3" , 0)
	while true do
		mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
		mob9898XX1= ReadRoleValue(OwnerID(),EM_RoleValue_register6)
		mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	sleep(10)
		if mob9898XX==0 and PE1WIN==1 and mob9898==1 then
			WriteRoleValue(mob12,EM_RoleValue_register9,0)
		end
		if mob9898XX==1 and PE1WIN==0 and mob9898==1 then
			StopMove(OwnerID(),false)
		elseif	mob9898XX==1 and PE1WIN==1 then
			StopMove(OwnerID(),false)
			WriteRoleValue(mob12,EM_RoleValue_register9,1)
		end
		if mob444==1 and time6==0 and PE1WIN==0 then
			time6=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_36]")--�ѤѡK³���K�ϩR�ڡI
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
		elseif	mob444==1 and time6==0 and PE1WIN==1 then
			time6=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_36]")--�ѤѡK³���K�ϩR�ڡI
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_1" , 0)
		end
		if PE39898OK==1 and time5==0 and PE1WIN==0 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register3,1)
		say(mob,"[SC_116838_32]")--���§A�A�ݨӧڭ̤w�g�w���F�C
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob13)
		elseif  PE39898OK==1 and time5==0 and PE1WIN==1 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register3,1)
		say(mob,"[SC_116838_32]")--���§A�A�ݨӧڭ̤w�g�w���F�C
		say(mob12,"[SC_116838_30]")--���Ҧ�����ʳ������D�`�}�G�A�]�ڥi���O�^�F�Ӥj���C
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob12)
		DelObj(mob13)
		end
		if PE3NO==1 and PE1WIN==0 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_36]")--�ѤѡK³���K�ϩR�ڡI
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
		elseif	PE3NO==1 and PE1WIN==1 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_36]")--�ѤѡK³���K�ϩR�ڡI
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_1" , 0)
		end
		if PE1WIN==1 and time3==0 then
			time3=1
			mob12=CreateObjByFlag(104959,780796,43,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,mob)
			WriteRoleValue(mob12,EM_RoleValue_register2,mob13)
			AddToPartition(mob12,RoomID)
			AddBuff( mob12,508120,0 ,-1 )
		end	
		if mob9898==1 and time1==0 and PE1WIN==0 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB1_9898" , 0)
		elseif mob9898==1 and time1==0 and PE1WIN==1 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB1_9898" , 0)
		BeginPlot(mob12 , "ic_pe3mob_9898_2" , 0)
		end
	end
end

function ic_PE3MOB2()--2������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local pe3npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
local time1=0	
local time2=0	
local time3=0	
local time4=0	
local time5=0	
local time6=0		
local mob11=CreateObjByFlag(104814,780796,45,1)
local mob13=CreateObjByFlag(104918,780830,62,1)
local mob12
WriteRoleValue(mob11,EM_RoleValue_register10,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
WriteRoleValue(mob11,EM_RoleValue_register3,pe3npc)
WriteRoleValue(OwnerID(),EM_RoleValue_register3,mob13)
--SetModeEx( mob11 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)	---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
--SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
AddToPartition(mob11,RoomID)
WriteRoleValue(mob13,EM_RoleValue_register9,mob11)
WriteRoleValue(mob13,EM_RoleValue_register1,mob)
WriteRoleValue(mob13,EM_RoleValue_register3,pe3npc)
SetModeEx( mob13 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob13 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob13 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
SetModeEx( mob13 , EM_SetModeType_Mark, false)					---�i�I��(�_)
AddToPartition(mob13,RoomID)
AddBuff( mob11,508120,0 ,-1 )
AttachObj( mob13 , mob11,0 , "p_hit_point01" , "p_hit_point02" )
--BeginPlot(mob13 , "ic_pe3mob_9898_3" , 0)
	while true do
		mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
		mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	sleep(10)
		if mob9898XX==0 and PE1WIN==1 and mob9898==1 then
			WriteRoleValue(mob12,EM_RoleValue_register9,0)
		end
		if mob9898XX==1 and PE1WIN==0 and mob9898==1 then
			StopMove(OwnerID(),false)
		elseif	mob9898XX==1 and PE1WIN==1 then
			StopMove(OwnerID(),false)
			WriteRoleValue(mob12,EM_RoleValue_register9,1)
		end
		if mob444==1 and time6==0 and PE1WIN==0 then
			time6=1
			say(mob,"[SC_116838_37]")--�z�ڡI���n���ڡK
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
		elseif	mob444==1 and time6==0 and PE1WIN==1 then
			time6=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_37]")--�z�ڡI���n���ڡK
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_1" , 0)
		end
		if PE39898OK==1 and time5==0 and PE1WIN==0 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_PID,1)
		say(mob,"[SC_116838_33]")--�ڷQ�A��o�����ӴN�i�H�F�K
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob13)
		elseif  PE39898OK==1 and time5==0 and PE1WIN==1 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_PID,1)
		say(mob,"[SC_116838_33]")--�ڷQ�A��o�����ӴN�i�H�F�K
		say(mob12,"[SC_116838_30]")--���Ҧ�����ʳ������D�`�}�G�A�]�ڥi���O�^�F�Ӥj���C
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob12)
		DelObj(mob13)
		end
		if PE3NO==1 and PE1WIN==0 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_37]")--�z�ڡI���n���ڡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
		elseif	PE3NO==1 and PE1WIN==1 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_37]")--�z�ڡI���n���ڡK
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_1" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_1" , 0)
		end
		if PE1WIN==1 and time3==0 then
			time3=1
			mob12=CreateObjByFlag(104959,780796,46,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,mob)
			WriteRoleValue(mob12,EM_RoleValue_register2,mob13)
			AddToPartition(mob12,RoomID)
			AddBuff( mob12,508120,0 ,-1 )
		end	
		if mob9898==1 and time1==0 and PE1WIN==0 then
		time1=1
		BeginPlot(mob, "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB2_9898" , 0)
		elseif mob9898==1 and time1==0 and PE1WIN==1 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB2_9898" , 0)
		BeginPlot(mob12 , "ic_pe3mob_9898_2" , 0)
		end
	end
end

function ic_PE3MOB3()--3������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local pe3npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
local time1=0	
local time2=0	
local time3=0	
local time4=0	
local time5=0
local time6=0			
local mob11=CreateObjByFlag(104814,780796,48,1)
local mob13=CreateObjByFlag(104918,780830,63,1)
local mob12
WriteRoleValue(mob11,EM_RoleValue_register10,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
WriteRoleValue(mob11,EM_RoleValue_register3,pe3npc)
WriteRoleValue(OwnerID(),EM_RoleValue_register3,mob13)
--SetModeEx( mob11 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)	---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
--SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
AddToPartition(mob11,RoomID)
WriteRoleValue(mob13,EM_RoleValue_register9,mob11)
WriteRoleValue(mob13,EM_RoleValue_register1,mob)
WriteRoleValue(mob13,EM_RoleValue_register3,pe3npc)
SetModeEx( mob13 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob13 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob13 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
SetModeEx( mob13 , EM_SetModeType_Mark, false)					---�i�I��(�_)
AddToPartition(mob13,RoomID)
AddBuff( mob11,508120,0 ,-1 )
AttachObj( mob13 , mob11,0 , "p_hit_point01" , "p_hit_point02" )
--BeginPlot(mob13 , "ic_pe3mob_9898_3" , 0)
	while true do
		mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
		mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	sleep(10)
		if mob9898XX==0 and PE1WIN==1 and mob9898==1  then
			WriteRoleValue(mob12,EM_RoleValue_register9,0)
		end
		if mob9898XX==1 and PE1WIN==0 and mob9898==1 then
			StopMove(OwnerID(),false)
		elseif	mob9898XX==1 and PE1WIN==1 then
			StopMove(OwnerID(),false)
			WriteRoleValue(mob12,EM_RoleValue_register9,1)
		end
		if mob444==1 and time6==0 and PE1WIN==0 then
			time6=1
			say(mob,"[SC_116838_38]")--���K�ڪ�³���a�աI�A������ګ��I�H
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
		elseif	mob444==1 and time6==0 and PE1WIN==1 then
			time6=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_38]")--���K�ڪ�³���a�աI�A������ګ��I�H
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_2" , 0)
		end
		if PE39898OK==1 and time5==0 and PE1WIN==0 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register6,1)
		say(mob,"[SC_116838_34]")--�o�ڥ��N�O�b�k���K�~���ڤF�I
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob13)
		elseif  PE39898OK==1 and time5==0 and PE1WIN==1 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register6,1)
		say(mob,"[SC_116838_34]")--�o�ڥ��N�O�b�k���K�~���ڤF�I
		say(mob12,"[SC_116838_30]")--���Ҧ�����ʳ������D�`�}�G�A�]�ڥi���O�^�F�Ӥj���C
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob12)
		DelObj(mob13)
		end
		if PE3NO==1 and PE1WIN==0 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_38]")--���K�ڪ�³���a�աI�A������ګ��I�H
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
		elseif	PE3NO==1 and PE1WIN==1 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_38]")--���K�ڪ�³���a�աI�A������ګ��I�H
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_2" , 0)
		end
		if PE1WIN==1 and time3==0 then
			time3=1
			mob12=CreateObjByFlag(104959,780796,49,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,mob)
			WriteRoleValue(mob12,EM_RoleValue_register2,mob13)
			AddToPartition(mob12,RoomID)
			AddBuff( mob12,508120,0 ,-1 )
		end	
		if mob9898==1 and time1==0 and PE1WIN==0 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB3_9898" , 0)
		elseif mob9898==1 and time1==0 and PE1WIN==1 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB3_9898" , 0)
		BeginPlot(mob12 , "ic_pe3mob_9898_2" , 0)
		end
	end
end
function ic_PE3MOB4()--4������
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=OwnerID()
local pe3npc=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
local PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
local mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
local time1=0	
local time2=0	
local time3=0	
local time4=0	
local time5=0	
local time6=0		
local mob11=CreateObjByFlag(104814,780796,51,1)
local mob13=CreateObjByFlag(104918,780830,64,1)
local mob12
WriteRoleValue(mob11,EM_RoleValue_register10,mob13)
WriteRoleValue(mob11,EM_RoleValue_register1,mob)
WriteRoleValue(mob11,EM_RoleValue_register3,pe3npc)
WriteRoleValue(OwnerID(),EM_RoleValue_register3,mob13)
--SetModeEx( mob11 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Searchenemy, false)	---����(�_)
--SetModeEx( mob11 , EM_SetModeType_Fight, false) 				---�i���(�_)
--SetModeEx( mob11 , EM_SetModeType_Mark, false)					---�i�I��(�_)
SetModeEx( mob11 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
AddToPartition(mob11,RoomID)
WriteRoleValue(mob13,EM_RoleValue_register9,mob11)
WriteRoleValue(mob13,EM_RoleValue_register1,mob)
WriteRoleValue(mob13,EM_RoleValue_register3,pe3npc)
SetModeEx( mob13 , EM_SetModeType_Strikback, false) 		---����(�_)
--SetModeEx( mob13 , EM_SetModeType_Searchenemy, false)	---����(�_)
SetModeEx( mob13 , EM_SetModeType_DisableRotate, false)			---���|��V(�_)
SetModeEx( mob13 , EM_SetModeType_Mark, false)					---�i�I��(�_)
AddToPartition(mob13,RoomID)
AddBuff( mob11,508120,0 ,-1 )
AttachObj( mob13 , mob11,0 , "p_hit_point01" , "p_hit_point02" )
---BeginPlot(mob13 , "ic_pe3mob_9898_3" , 0)
	while true do
		mobxx=ReadRoleValue(pe3npc,EM_RoleValue_register10)
		mob444=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		PE39898OK=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
		mob9898= ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		PE1WIN= ReadRoleValue(OwnerID(),EM_RoleValue_register8)
		PE3NO= ReadRoleValue(OwnerID(),EM_RoleValue_register7)
		mob9898XX= ReadRoleValue(OwnerID(),EM_RoleValue_register5)
	sleep(10)
		if mob9898XX==0 and PE1WIN==1 and mob9898==1 then
			WriteRoleValue(mob12,EM_RoleValue_register9,0)
		end
		if mob9898XX==1 and PE1WIN==0 and mob9898==1 then
			StopMove(OwnerID(),false)
		elseif	mob9898XX==1 and PE1WIN==1 then
			StopMove(OwnerID(),false)
			WriteRoleValue(mob12,EM_RoleValue_register9,1)
		end
		if mob444==1 and time6==0 and PE1WIN==0 then
			time6=1
			say(mob,"[SC_116838_39]")--�ֶ]�ڡA�ֶ]�I
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
		elseif	mob444==1 and time6==0 and PE1WIN==1 then
			time6=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_39]")--�ֶ]�ڡA�ֶ]�I
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_2" , 0)
		end
		if PE39898OK==1 and time5==0 and PE1WIN==0 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register8,1)
		say(mob,"[SC_116838_35]")--�I�K�P�F�@�f��A���§A�ڡI
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob13)
		elseif  PE39898OK==1 and time5==0 and PE1WIN==1 then
		time5=1
		WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
		WriteRoleValue(pe3npc,EM_RoleValue_register8,1)
		say(mob,"[SC_116838_35]")--�I�K�P�F�@�f��A���§A�ڡI
		say(mob12,"[SC_116838_30]")--���Ҧ�����ʳ������D�`�}�G�A�]�ڥi���O�^�F�Ӥj���C
		sleep(20)
		DelObj(OwnerID())
		DelObj(mob12)
		DelObj(mob13)
		end
		if PE3NO==1 and PE1WIN==0 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_39]")--�ֶ]�ڡA�ֶ]�I
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
		elseif	PE3NO==1 and PE1WIN==1 and time4==0 then
			time4=1
			WriteRoleValue(pe3npc,EM_RoleValue_register10,mobxx+1)
			say(mob,"[SC_116838_39]")--�ֶ]�ڡA�ֶ]�I
			say(mob12,"[SC_116838_31]")--�ڭ̬��o�������ѷP���ѡK
			DelObj(mob13)
			BeginPlot(mob, "ic_PE3MOB9898_2" , 0)
			BeginPlot(mob12, "ic_PE3MOB9898_2" , 0)
		end
		if PE1WIN==1 and time3==0 then
			time3=1
			mob12=CreateObjByFlag(104959,780796,52,1)
			WriteRoleValue(mob12,EM_RoleValue_register1,mob)
			WriteRoleValue(mob12,EM_RoleValue_register2,mob13)
			AddToPartition(mob12,RoomID)
			AddBuff( mob12,508120,0 ,-1 )
		end	
		if mob9898==1 and time1==0 and PE1WIN==0 then
		time1=1
		BeginPlot(mob , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB4_9898" , 0)
		elseif mob9898==1 and time1==0 and PE1WIN==1 then
		time1=1
		BeginPlot(mob  , "ic_pe3mob_9898_1" , 0)
		BeginPlot(mob11 , "ic_PE3MOB4_9898" , 0)
		BeginPlot(mob12 , "ic_pe3mob_9898_2" , 0)
		end
	end
end