function ic_780796_mob_981()---1���e�p�ǥ�1-6�p�ǥ�   ic_PE3MOB9898_1
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,1,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,2,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 3 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_981_1()---1���e�p�ǥ�7-12�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,4,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,5,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 6 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_982()---2���e�p�ǥ�1-6�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,7,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,8,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 9 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_982_1()---2���e�p�ǥ�7-12�p��
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,10,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,11,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 12)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_983()---3���e�p�ǥ�1-6�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,16,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,17,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 18)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_983_1()---3���e�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,13,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,14,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				SetPosByFlag( OwnerID() , 780805 , 15)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==3 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_984()---4���e�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,19,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,20,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_984_0()---4���e�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local npcboss=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local time1=0
SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)			---����(�_)
	while true do
		npcboss=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if time1==0 then
			AddBuff( OwnerID(),508151,0 ,-1 )
			time1=1
		end
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
			SetAttack(OwnerID() , npcboss)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,19,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,21,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				SetAttack(OwnerID() , npcboss)
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) 			---�����O)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, true)			---����(�O)
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) 					---����	(�_)
				BeginPlot(npcboss, "ic_780796_npcboss_BUFF99" , 0)
				SetAttack(OwnerID() , npcboss)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_984_1()---4���e�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
	while true do
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,22,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,23,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				elseif mob9898==2 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_mob_984_2()---4���e�p�ǥ�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
local npcboss=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
local time1=0
SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) 			---����(�_)
SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)			---����(�_)
	while true do  
		mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
		npcboss=ReadRoleValue(OwnerID(),EM_RoleValue_register4)
		if time1==0 then
			AddBuff( OwnerID(),508151,0 ,-1 )
			time1=1
		end
		if hatelistcount(OwnerID())~=0 	then
			StopMove(OwnerID(),false)
			SetAttack(OwnerID() , npcboss)
		elseif hatelistcount(OwnerID())==0 	then
			MoveToFlagEnabled(OwnerID(), false)
			if ReadRoleValue( OwnerID() , EM_RoleValue_IsDead)==0	then
				if mob9898==0 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,22,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				sleep(10)
				elseif mob9898==1 then
				MoveToFlagEnabled(OwnerID(), false)
				WriteRoleValue(  OwnerID(),EM_RoleValue_IsWalk,0)
				Hide(OwnerID())
				Show(OwnerID(),RoomID)
				DW_MoveToFlag( OwnerID() , 780805 ,24,0)
				WriteRoleValue(OwnerID(),EM_RoleValue_register9,mob9898+1)
				SetAttack(OwnerID() , npcboss)
				SetModeEx( OwnerID() , EM_SetModeType_Strikback, true) 			---�����O)
				SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, true)			---����(�O)
				SetModeEx( OwnerID() , EM_SetModeType_Move, false) 					---����	(�_)
				BeginPlot(npcboss, "ic_780796_npcboss_BUFF99" , 0)
				SetAttack(OwnerID() , npcboss)
				end
			end
		end	
		sleep(10)
	end
end
function ic_780796_npcboss_BUFF99()--- �J��
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Search = SearchRangeNPC ( OwnerID() , 500 )
	local time1=0
	if time1==0 then
		for i = 0 , table.getn(Search) do
			if Search[i] ~= OwnerID() then
				if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104892	or ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104893 then
				AddBuff( Search[i],508297,0 ,-1 )				
				end
			end		
		end
		time1=2
	end	
end
function ic_780796_9898_BUFF99()--- �ۻ�
	local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local Search = SearchRangeNPC ( OwnerID() , 200 )
	local time1=0
	if time1==0 then
		for i = 0 , table.getn(Search) do
			if Search[i] ~= OwnerID() then
				if	ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	104892	or ReadRoleValue(Search[i],EM_RoleValue_OrgID) == 	105035 then
				AddBuff( Search[i],508297,0 ,-1 )				
				end
			end		
		end
		time1=2
	end	
end
function ic_780796_npcboss_01()--- NPC�p�ƾ�
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register8)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
		WriteRoleValue(mob,EM_RoleValue_register9,5)
		sleep(10)
		DelObj(OwnerID())
end
function ic_780796_mob_01()---1-3�p�� �����p�ƾ�
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobxx= ReadRoleValue(mob,EM_RoleValue_register1)
		mobxx= ReadRoleValue(mob,EM_RoleValue_register1)
		--say(OwnerID(),"mobxx"..mobxx)
		WriteRoleValue(mob,EM_RoleValue_register1,mobxx+1)
		sleep(5)
		DelObj(OwnerID())
end
function ic_780796_mob_02()---2-4�p�� �����p�ƾ�
local mob= ReadRoleValue(OwnerID(),EM_RoleValue_PID)
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mobxx= ReadRoleValue(mob,EM_RoleValue_register2)
		mobxx= ReadRoleValue(mob,EM_RoleValue_register2)
		--say(OwnerID(),"mobxx"..mobxx)
		WriteRoleValue(mob,EM_RoleValue_register2,mobxx+1)
		sleep(5)
		DelObj(OwnerID())
end	
function ic_pe3mob_9898_1() 	--���NPC�򨮨�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register3)		
while true do
		SetFollow( OwnerID(), mob13)
		sleep(10)
	end
end
function ic_pe3mob_9898_3() 	--���NPC�򨮨�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob=ReadRoleValue(OwnerID(),EM_RoleValue_register1)
local mob11=ReadRoleValue(OwnerID(),EM_RoleValue_register9)		
while true do
		SetFollow( OwnerID(), mob11)
		sleep(10)
	end
end
function ic_pe3mob_9898_2() 	--���NPC�򨮨�
local RoomID=ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
local mob13=ReadRoleValue(OwnerID(),EM_RoleValue_register2)
local mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)
while true do
	mob9898=ReadRoleValue(OwnerID(),EM_RoleValue_register9)	
			if mob9898==0 then
				SetFollow( OwnerID(), mob13)
			elseif mob9898==1 then
				StopMove(OwnerID(),false)
			end
		sleep(10)
	end
end
