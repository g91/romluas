----EM_RoleValue_PID = Boss ����
----EM_RoleValue_Register1 = ��N�M_1
----EM_RoleValue_Register2 = ��N�M_2
----EM_RoleValue_Register3 = ��N�M_3
----EM_RoleValue_Register4 = ��N�M_4
----EM_RoleValue_Register5 = ��N�M_1 �ʧ@�P�_
----EM_RoleValue_Register6 = ��N�M_2 �ʧ@�P�_
----EM_RoleValue_Register7 = ��N�M_3 �ʧ@�P�_
----EM_RoleValue_Register8 = ��N�M_4 �ʧ@�P�_
----EM_RoleValue_Register9 = �p�ɾ�

function Lua_apon_Boss_102969_AI() --���鱱�
	
	while 1 do
		sleep(10)
		
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1,0) ---�ت��Ω󭫸m
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register5,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register6,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register7,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register8,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_Register9,0)
		WriteRoleValue( OwnerID(), EM_RoleValue_PID,0)
		
		local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local Flag_Boss = 780362 ---�ȨF
		local Flag_blade = 780385 ---��N�M
		local Flag_corpse = 780386 ---�|�Ӥk��
		local Flag_Boss_AI = 780387 ----Boss_AI
		local Flag_Boss_Time = 780388 ----�p�ɾ�
		local Flag_Door = 780389 ----��
		
		local Corpse_1 ---�ɦ�P�_��
		local Corpse_2 ---�ɦ�P�_��
		local Corpse_3 ---�ɦ�P�_��
		local Corpse_4 ---�ɦ�P�_��
		
		local Boss = CreateObjByFlag( 102969 , Flag_Boss , 1 , 1 ) ---�ȨF
		WriteRoleValue( Boss, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_PID, Boss)
		AddToPartition( Boss,roomid1 )
		Show(Boss,roomid1)
		BeginPlot( Boss, "Lua_apon_Boss_102969_fight", 10) ---Boss���԰�Function
		
		local Blade_1 = CreateObjByFlag( 114311 , Flag_blade , 1 , 1 ) ---�Ĥ@���N�M
		WriteRoleValue( Blade_1, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Blade_1)
		AddToPartition( Blade_1,roomid1 )
		Show(Blade_1,roomid1)
		BeginPlot( Blade_1, "Lua_apon_blade_start_1", 10)
		
		local Blade_2 = CreateObjByFlag( 114311 , Flag_blade , 2 , 1 ) ---�ĤG���N�M
		WriteRoleValue( Blade_2, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Blade_2)
		AddToPartition( Blade_2,roomid1 )
		Show(Blade_2,roomid1)
		BeginPlot( Blade_2, "Lua_apon_blade_start_2", 10)
		
		local Blade_3 = CreateObjByFlag( 114311 , Flag_blade , 3 , 1 ) ---�ĤT���N�M
		WriteRoleValue( Blade_3, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Blade_3)
		AddToPartition( Blade_3,roomid1 )
		Show(Blade_3,roomid1)
		BeginPlot( Blade_3, "Lua_apon_blade_start_3", 10)
		
		local Blade_4 = CreateObjByFlag( 114311 , Flag_blade , 4 , 1 ) ---�ĥ|���N�M
		WriteRoleValue( Blade_4, EM_RoleValue_PID, OwnerID())
		WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Blade_4)
		AddToPartition( Blade_4,roomid1 )
		Show(Blade_4,roomid1)
		BeginPlot( Blade_4, "Lua_apon_blade_start_4", 10)
		
		
		
		while 1 do 
			sleep(10)
			if Checkbuff(OwnerID(),505631) == true then -----���W�Ҧ���N�M�M�k�ͪ����m
				CancelBuff(OwnerID(),505631)
				BeginPlot( OwnerID(), "Lua_apon_corpse_Timer_1", 10)
			
			elseif Checkbuff(OwnerID(),505632) == true then -----Boss���㭫�m
				sleep(20) ---���m�ɶ�
				CancelBuff(OwnerID(),505632)
				
				local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---��N�M 1
				local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---��N�M 2
				local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---��N�M 3
				local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---��N�M 4
				sleep(10)
				local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --�k�ͫ��� 1
				local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --�k�ͫ��� 2
				local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --�k�ͫ��� 3
				local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --�k�ͫ��� 4
				sleep(10)
				Delobj(Corpse_mob_1)
				Delobj(Corpse_mob_2)
				Delobj(Corpse_mob_3)
				Delobj(Corpse_mob_4)
				Delobj(Corpse_1)
				Delobj(Corpse_2)
				Delobj(Corpse_3)
				Delobj(Corpse_4)
				--BeginPlot( OwnerID(), "Lua_apon_corpse_Timer_2", 0)
				break
			end
		end
	end
end

-----EM_RoleValue_PID = �������
-----EM_RoleValue_Register1 = ����
-----EM_RoleValue_Register2 = �P�_�}�l�Ұʤ�N�M��
-----EM_RoleValue_Register3 = �����N�M���@���ʧ@��


function Lua_apon_blade_start_1() ----�Ĥ@���N�M
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---�������
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss����
	local Flag_corpse = 780386 ---���b�ɤW���k��
	local Corpse_1 = CreateObjByFlag( 103035 , Flag_corpse , 1 , 1 )
	SetDefIdleMotion( Corpse_1,ruFUSION_MIME_SIT_DOWN)
	SetModeEx(Corpse_1 , EM_SetModeType_Strikback , false )--����
	SetModeEx(Corpse_1 , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Corpse_1 , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Corpse_1 , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Corpse_1 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Corpse_1 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Corpse_1 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Corpse_1 , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Corpse_1 , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Corpse_1 , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Corpse_1 , EM_SetModeType_Move, false) ----����
	AddToPartition( Corpse_1,roomid1 )
	Show(Corpse_1,roomid1)
	
	WriteRoleValue( Corpse_1, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_1, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_1)
	BeginPlot( Corpse_1, "Lua_apon_corpse_check", 5)
	
	local Check ---�P�_�}�l�Ұʤ�N�M��
	local Check_2
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		Check_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		if Check == 1 and Check_2 == 0 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_2() ----�ĤG���N�M
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---�������
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss����
	local Flag_corpse = 780386 ---���b�ɤW���k��
	local Corpse_2 = CreateObjByFlag( 103036 , Flag_corpse , 2 , 1 )
	SetDefIdleMotion( Corpse_2,ruFUSION_MIME_SIT_DOWN)
	SetModeEx(Corpse_2 , EM_SetModeType_Strikback , false )--����
	SetModeEx(Corpse_2 , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Corpse_2 , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Corpse_2 , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Corpse_2 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Corpse_2 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Corpse_2 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Corpse_2 , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Corpse_2 , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Corpse_2 , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Corpse_2 , EM_SetModeType_Move, false) ----����
	AddToPartition( Corpse_2,roomid1 )
	Show(Corpse_2,roomid1)
	
	WriteRoleValue( Corpse_2, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_2, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_2)
	BeginPlot( Corpse_2, "Lua_apon_corpse_check", 5)
	
	local Check ---�P�_�}�l�Ұʤ�N�M��
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_3() ----�ĤT���N�M
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---�������
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss����
	local Flag_corpse = 780386 ---���b�ɤW���k��
	local Corpse_3 = CreateObjByFlag( 103037 , Flag_corpse , 3 , 1 )
	SetDefIdleMotion( Corpse_3,ruFUSION_MIME_SIT_DOWN)
	SetModeEx( Corpse_3 , EM_SetModeType_Strikback , false )--����
	SetModeEx( Corpse_3 , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Corpse_3 , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Corpse_3 , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Corpse_3 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Corpse_3 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Corpse_3 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Corpse_3 , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Corpse_3 , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Corpse_3 , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Corpse_3 , EM_SetModeType_Move, false) ----����
	AddToPartition( Corpse_3,roomid1 )
	Show(Corpse_3,roomid1)
	
	WriteRoleValue( Corpse_3, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_3, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_3)
	BeginPlot( Corpse_3, "Lua_apon_corpse_check", 5)
	
	local Check ---�P�_�}�l�Ұʤ�N�M��
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

function Lua_apon_blade_start_4() ----�ĥ|���N�M
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---�������
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss����
	local Flag_corpse = 780386 ---���b�ɤW���k��
	local Corpse_4 = CreateObjByFlag( 103038 , Flag_corpse , 4 , 1 )
	SetDefIdleMotion( Corpse_4,ruFUSION_MIME_SIT_DOWN)
	SetModeEx( Corpse_4 , EM_SetModeType_Strikback , false )--����
	SetModeEx( Corpse_4 , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Corpse_4 , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Corpse_4 , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Corpse_4 , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Corpse_4 , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Corpse_4 , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Corpse_4 , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Corpse_4 , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Corpse_4 , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Corpse_4 , EM_SetModeType_Move, false) ----����
	AddToPartition( Corpse_4,roomid1 )
	Show(Corpse_4,roomid1)
	
	WriteRoleValue( Corpse_4, EM_RoleValue_Register4, Boss_AI)
	WriteRoleValue( Corpse_4, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Corpse_4)
	BeginPlot( Corpse_4, "Lua_apon_corpse_check", 5)
	
	local Check ---�P�_�}�l�Ұʤ�N�M��
	
	while 1 do 
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		if Check == 1 then
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 0)
			BeginPlot( OwnerID(), "Lua_apon_QN_114311_01", 5)
		end
	end
end

---------1. �ݭn�ɱj�������G�p�GBoss �ƤQ��A�ɶ���A�h�n���o�� function break �A�åB���㭫�m��� ��N�M �������C
-----------Counter ���A�������ۤv�A�b���ؼЪ��a�i�H���o�� �d����  Buff
-------------�d���ɶ����A���Ǧ^�@�ӭȵ� Boss_AI�A�b�R���ۤv�A�������m�Ҧ�����N�M�y�{ 
function Lua_apon_corpse_check() ----��b���騭�W���P�_��
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID) ---����骺��N�M�� GID Ū�X��
	local Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---�֭p�岽������
	local Check_pet = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---�P�_�O�_���� �d����
	local Check_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---�P�_�O�_�����Ǫ���
	local Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---�s���d���D�H��GID
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---- Boss_AI 
	sleep(10)
	local Boss = ReadRoleValue(Boss_AI,EM_RoleValue_PID) ---Boss ���� 
	local Check_A = 0 ----�קK���_Ĳ�o��
	local Check_B = 0
	local Check_C = 0
	while 1 do
		sleep(10)
		Check = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
		Check_pet = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
		Check_mob = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)
		--say(OwnerID(),"Corpse Check Counter ="..Check)
		if Check == 3 and Check_A == 0 then
			Check_A = 1
			WriteRoleValue( OwnerID(), EM_RoleValue_Register2, 1)
		end
		
------�k���ܦ����a���d��----------------------------------------------------------------------------------------		
		if Check_pet == 1 and Check_mob == 0 and Check_B == 0 then
			local PPL = SetSearchAllPlayer(roomid1 ) ---�N�Ҧ����a�i�H�I��N�M��Buff�����M��
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID,505591 )
			end
			
			Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Hide(Blade)
			local Blade_2 = star_CreateObj( Blade , 114311 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX��N�M�G�N
			
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then ----�|�ӫ���A�U�O�N��N�M�A�s�줣�P�� Register
				WriteRoleValue( Boss_AI, EM_RoleValue_Register1, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register2, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register3, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register4, Blade_2 )
			end
			
			WriteRoleValue( OwnerID(), EM_RoleValue_PID, Blade_2 )
			Delobj(Blade)
			
			Check_B = 1
			Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Hide(OwnerID())
			--say(OwnerID(),"Pet Start !!")
			sleep(10)
			if ReadRoleValue( Pet_owner , EM_RoleValue_IsDead ) ~= 1 and ReadRoleValue( Pet_owner, EM_RoleValue_VOC) ~= 0  
				and ReadRoleValue( Pet_owner , EM_RoleValue_RoomID  ) == roomid1 then
				if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494893, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36) ----addbuff  �쪱�a���W�A����Ϊ�
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494894, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494895, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
					SysCastSpellLV( Pet_owner, Pet_owner, 494896, 1)
					AddBuff (Pet_owner , 505633 , 0 , 36)
				end
			end
			
		elseif Check_mob == 1 and Check_pet == 0 and Check_C == 0 then
			local PPL = SetSearchAllPlayer(roomid1 ) ---�N�Ҧ����a�i�H�I��N�M��Buff�����M��
			for i = 1 , PPL , 1 do 
				local ID = GetSearchResult()
				CancelBuff(ID,505591 )
			end
			
			Blade = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
			Hide(Blade)
			local Blade_2 = star_CreateObj( Blade , 114311 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX��N�M�G�N
			
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then ----�|�ӫ���A�U�O�N��N�M�A�s�줣�P�� Register
				WriteRoleValue( Boss_AI, EM_RoleValue_Register1, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register2, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register3, Blade_2 )
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				WriteRoleValue( Boss_AI, EM_RoleValue_Register4, Blade_2 )
			end
			
			Delobj(Blade)
			
			Pet_owner = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
			Check_C = 1
			Hide(OwnerID())
			--say(OwnerID(),"Boss_Pet Start !!")
			if ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103035 then
				local Boss_pet = star_CreateObj( OwnerID() , 103035 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_1", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----�⥻��Boss �� GID �g�J Boss_Pet �� PID ��
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  ��Boss���W�A����Ϊ�
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103036 then
				local Boss_pet = star_CreateObj( OwnerID() , 103036 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_1", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----�⥻��Boss �� GID �g�J Boss_Pet �� PID ��
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  ��Boss���W�A����Ϊ�
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103037 then
				local Boss_pet = star_CreateObj( OwnerID() , 103037 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_2", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----�⥻��Boss �� GID �g�J Boss_Pet �� PID ��
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  ��Boss���W�A����Ϊ�
				SetAttack( Boss_pet , Pet_owner )
				
			elseif ReadRoleValue(OwnerID(),EM_RoleValue_OrgID) == 103038 then
				local Boss_pet = star_CreateObj( OwnerID() , 103038 , 0 , 0 , 0 , roomid1 , 0)
				BeginPlot( Boss_pet, "Lua_apon_Boss_Pet_2", 5)
				WriteRoleValue( Boss_pet, EM_RoleValue_PID, Boss ) ----�⥻��Boss �� GID �g�J Boss_Pet �� PID ��
				WriteRoleValue(Boss_pet, EM_RoleValue_Livetime,35)
				AddBuff (Boss , 505634 , 0 , 36)--addbuff  ��Boss���W�A����Ϊ�
				SetAttack( Boss_pet , Pet_owner )
			end
		end
	end
end



------�H�U����N�M�QĲ�o���y�{-----------------------------------------------------------------------------------------------
function Lua_apon_QN_114311_01()	--�o�� Ĳ�o
	SetPlot( OwnerID() , "touch" , "Lua_apon_QN_114311_02" , 20 )
end

function Lua_apon_QN_114311_02()
	SetPlot( TargetID(),"touch", "" ,0 )
	AddBuff (OwnerID() , 505591 , 0 , -1) ---�b�I��H���W�[�@��buff�A���F�����䥦�H�]�i�H�I���N�M
	local Boss_AI = ReadRoleValue(TargetID(),EM_RoleValue_PID)
	local Corpse = ReadRoleValue(TargetID(),EM_RoleValue_Register1)
	--say(TargetID(),"Corpse ="..Corpse)
	--say(TargetID(),"Corpse Counter ="..ReadRoleValue(Corpse,EM_RoleValue_Register1))
	WriteRoleValue( Corpse, EM_RoleValue_Register1, (ReadRoleValue(Corpse,EM_RoleValue_Register1)) + 1)
	WriteRoleValue( Corpse, EM_RoleValue_Register4, OwnerID()) --- �N�Ĥ@���I��N�M�����a�A�O�����d�����D�H
	
	--SetPlot( TargetID(),"touch", "" ,0 )
	--AddBuff (OwnerID() , 505591 , 0 , -1) ---�b�I��H���W�[�@��buff�A���F�����䥦�H�]�i�H�I���N�M
	local roomid1 = ReadRoleValue( TargetID() , EM_RoleValue_RoomID )
	WriteRoleValue(TargetID(), EM_RoleValue_Livetime,3)
	Hide(TargetID())
	local Ball = star_CreateObj( TargetID() , 103039 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX�@�����ΤH�A�O�o�������ΤH��ID:
	-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Ball , EM_SetModeType_Move, false) ----����
	Hide(Ball)
	Show(Ball,roomid1)
	WriteRoleValue(Ball, EM_RoleValue_Livetime,3)	
	CastSpellLV( Ball , OwnerID() , 494735 , 0 )--�岽
	sleep(15)
	Hide(Ball)
	local Ball_2 = star_CreateObj( Ball , 114312 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX��N�M�G�N
	WriteRoleValue( Ball_2, EM_RoleValue_Register1, Corpse ) ----����骺 GID �ǵ��s����N�M
	WriteRoleValue( Ball_2, EM_RoleValue_PID, Boss_AI ) ----Boss_AI ��GID �ǵ��s����N�M
	WriteRoleValue( Corpse, EM_RoleValue_PID, Ball_2 ) --- ���N�M�G�N�A�s����骺PID��
	BeginPlot(Ball_2,"Lua_apon_QN_114311_03",10)	
end

function Lua_apon_QN_114311_03()	--�o�� Ĳ�o
	SetPlot( OwnerID() , "touch" , "Lua_apon_QN_114311_04" , 20 )
end

function Lua_apon_QN_114311_04()
	if Checkbuff(OwnerID(),505591) == true then
		SetPlot( TargetID(),"touch", "" ,0 )
		BeginPlot( TargetID(), "Lua_apon_QN_114311_05", 10)
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_102969_10]" , 1 ) ---�A�L�k�ϥΦ�{�Q�b�ӧ����大��§�I
	end
end

function Lua_apon_QN_114311_05()
	local Boss_AI = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local Corpse = ReadRoleValue(OwnerID(),EM_RoleValue_Register1)
	--say(TargetID(),"Corpse ="..Corpse)
	--say(TargetID(),"Corpse Counter ="..ReadRoleValue(Corpse,EM_RoleValue_Register1))
	WriteRoleValue( Corpse, EM_RoleValue_Register1, ReadRoleValue(Corpse,EM_RoleValue_Register1) + 1)
	WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
	Hide(OwnerID())
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	
	local Ball = star_CreateObj( OwnerID() , 103039 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX�@�����ΤH�A�O�o�������ΤH��ID:
	-------------�S�Ĳy�M��-----------------------------------------------------------------------------------------------------------------
	SetModeEx(Ball , EM_SetModeType_Strikback , false )--����
	SetModeEx(Ball , EM_SetModeType_Searchenemy , false )--����
	SetModeEx( Ball , EM_SetModeType_Fight, false) ----�i�������
	SetModeEx( Ball , EM_SetModeType_Mark, false) ----�аO
	SetModeEx( Ball , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	SetModeEx( Ball , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	SetModeEx( Ball , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	SetModeEx( Ball , EM_SetModeType_Gravity, false) ----���O
	SetModeEx( Ball , EM_SetModeType_ShowRoleHead, false) ----������Y����
	SetModeEx( Ball , EM_SetModeType_AlignToSurface, false) ----�K����
	SetModeEx( Ball , EM_SetModeType_Move, false) ----����
	WriteRoleValue(Ball, EM_RoleValue_Livetime,5)
	Hide(Ball)
	Show(Ball,roomid1)
	CastSpellLV( Ball , TargetID() , 494735 , 0 )--�岽
	sleep(15)
	Hide(Ball)
	local Ball_2 = star_CreateObj( Ball , 114312 , 0 , 0 , 0 , roomid1 , 0) ---�ͥX��N�M�G�N
	WriteRoleValue(Ball_2,EM_RoleValue_Register1,Corpse) ----����骺 GID �ǵ��s����N�M
	WriteRoleValue(Ball_2,EM_RoleValue_PID,Boss_AI)----Boss_AI ��GID �ǵ��s����N�M
	WriteRoleValue( Corpse, EM_RoleValue_PID, Ball_2 ) --- ���N�M�G�N�A�s����骺PID��
	BeginPlot(Ball_2,"Lua_apon_QN_114311_03",10)
end


function Lua_apon_corpse_Timer_1()
	--say(OwnerID(),"Blade Return !!")
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_blade = 780385 ---��N�M
	local Flag_corpse = 780386 ---�|�Ӥk��
	
	local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---��N�M 1
	local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---��N�M 2
	local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---��N�M 3
	local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---��N�M 4
	sleep(10)
	local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --�k�ͫ��� 1
	local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --�k�ͫ��� 2
	local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --�k�ͫ��� 3
	local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --�k�ͫ��� 4
	sleep(10)
	Delobj(Corpse_mob_1)
	Delobj(Corpse_mob_2)
	Delobj(Corpse_mob_3)
	Delobj(Corpse_mob_4)
	Delobj(Corpse_1)
	Delobj(Corpse_2)
	Delobj(Corpse_3)
	Delobj(Corpse_4)
	
	local Blade_1 = CreateObjByFlag( 114311 , Flag_blade , 1 , 1 ) ---�Ĥ@���N�M
	WriteRoleValue( Blade_1, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register1, Blade_1)
	AddToPartition( Blade_1,roomid1 )
	Show(Blade_1,roomid1)
	BeginPlot( Blade_1, "Lua_apon_blade_start_1", 10)
	
	local Blade_2 = CreateObjByFlag( 114311 , Flag_blade , 2 , 1 ) ---�ĤG���N�M
	WriteRoleValue( Blade_2, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register2, Blade_2)
	AddToPartition( Blade_2,roomid1 )
	Show(Blade_2,roomid1)
	BeginPlot( Blade_2, "Lua_apon_blade_start_2", 10)
	
	local Blade_3 = CreateObjByFlag( 114311 , Flag_blade , 3 , 1 ) ---�ĤT���N�M
	WriteRoleValue( Blade_3, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register3, Blade_3)
	AddToPartition( Blade_3,roomid1 )
	Show(Blade_3,roomid1)
	BeginPlot( Blade_3, "Lua_apon_blade_start_3", 10)
	
	local Blade_4 = CreateObjByFlag( 114311 , Flag_blade , 4 , 1 ) ---�ĥ|���N�M
	WriteRoleValue( Blade_4, EM_RoleValue_PID, OwnerID())
	WriteRoleValue( OwnerID(), EM_RoleValue_Register4, Blade_4)
	AddToPartition( Blade_4,roomid1 )
	Show(Blade_4,roomid1)
	BeginPlot( Blade_4, "Lua_apon_blade_start_4", 10)

end

function Lua_apon_corpse_Timer_2()
	--say(OwnerID(),"Boss Return !!")
	local roomid1 = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Flag_blade = 780385 ---��N�M
	local Flag_corpse = 780386 ---�|�Ӥk��
	local Flag_Boss_AI = 780387 ----Boss_AI
	local Flag_Boss_Time = 780388 ----�p�ɾ�
	
	local Corpse_1 = ReadRoleValue(OwnerID(),EM_RoleValue_Register1) ---��N�M 1
	local Corpse_2 = ReadRoleValue(OwnerID(),EM_RoleValue_Register2) ---��N�M 2
	local Corpse_3 = ReadRoleValue(OwnerID(),EM_RoleValue_Register3) ---��N�M 3
	local Corpse_4 = ReadRoleValue(OwnerID(),EM_RoleValue_Register4) ---��N�M 4
	sleep(10)
	local Corpse_mob_1 = ReadRoleValue(Corpse_1,EM_RoleValue_Register1) --�k�ͫ��� 1
	local Corpse_mob_2 = ReadRoleValue(Corpse_2,EM_RoleValue_Register1) --�k�ͫ��� 2
	local Corpse_mob_3 = ReadRoleValue(Corpse_3,EM_RoleValue_Register1) --�k�ͫ��� 3
	local Corpse_mob_4 = ReadRoleValue(Corpse_4,EM_RoleValue_Register1) --�k�ͫ��� 4
	sleep(10)
	Delobj(Corpse_mob_1)
	Delobj(Corpse_mob_2)
	Delobj(Corpse_mob_3)
	Delobj(Corpse_mob_4)
	Delobj(Corpse_1)
	Delobj(Corpse_2)
	Delobj(Corpse_3)
	Delobj(Corpse_4)
	--sleep(10)
	--local Boss_AI = CreateObjByFlag( 103056 , Flag_Boss_AI , 1 , 1 ) ---�NBoss_AI ���s���X��
	--SetModeEx(Boss_AI , EM_SetModeType_Strikback , false )--����
	--SetModeEx(Boss_AI , EM_SetModeType_Searchenemy , false )--����
	--SetModeEx( Boss_AI , EM_SetModeType_Fight, false) ----�i�������
	--SetModeEx( Boss_AI , EM_SetModeType_Mark, false) ----�аO
	--SetModeEx( Boss_AI , EM_SetModeType_SearchenemyIgnore, false) ---���󤣷|�Q�j�M
	--SetModeEx( Boss_AI , EM_SetModeType_HideName, false)  ---�����Y�W�O�_��ܦW��
	--SetModeEx( Boss_AI , EM_SetModeType_HideMinimap, false)  ---����O�_�b�p�a�ϤW���
	--SetModeEx( Boss_AI , EM_SetModeType_ShowRoleHead, false) ----������Y����
	--SetModeEx( Boss_AI , EM_SetModeType_AlignToSurface, false) ----�K����
	--SetModeEx( Boss_AI , EM_SetModeType_Move, false) ----����
	--AddToPartition( Boss_AI,roomid1 )
	--Show(Boss_AI,roomid1)
	BeginPlot( OwnerID(), "Lua_apon_Boss_102969_AI", 10)
	--BeginPlot( Boss_AI, "Lua_apon_Boss_102969_AI", 10)
	--say(OwnerID(),"Boss_AI Begin !!")
	--sleep(10)
	--WriteRoleValue(OwnerID(), EM_RoleValue_Livetime,5)
	--Hide(OwnerID())
	--Delobj(OwnerID())
end




