--�]�k�аO����
function Lua_na_hidemarks()
	local hidemark = CreateObjByflag(117228 , 780853 , 0 , 1 ) --�b���w�s�����X�l�W���;Ԫ�P�H�x(NPC�s��,�X�l�s��,�X�l�s�X,�ƶq)
	SetModeEx( hidemark, EM_SetModeType_Strikback, false)--����
	SetModeEx( hidemark, EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
	SetModeEx( hidemark, EM_SetModeType_Obstruct, false )--����
	SetModeEx( hidemark, EM_SetModeType_Mark, false )--�аO
	SetModeEx( hidemark, EM_SetModeType_Move, false)--����
	SetModeEx( hidemark, EM_SetModeType_Searchenemy, false)--����
	SetModeEx( hidemark, EM_SetModeType_HideName, true )--�W��
	SetModeEx( hidemark, EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( hidemark, EM_SetModeType_Fight , false)--�i������� 
	SetModeEx( hidemark, EM_SetModeType_Drag , false )--���O
	SetModeEx( hidemark, EM_SetModeType_Show, true )--���
	AddToPartition( hidemark , 0 ) 
--	Say( OwnerID(), "hide born")
end


function Lua_na_marks_born()
	while true do
		sleep( 10)
		BeginPlot( OwnerID(), "Lua_na_marks_born2",0 )
		sleep(150)
	end
end

function Lua_na_marks_born2()
	local X = {1,2,3,4,5,6,7,8,9}  
	local Y = 0
	local Y1 = {}
	for i = 1 , 9 do   -- ����9��
		Y = Rand(table.getn(X))+1
		Y1[i] = X[Y]
		table.remove(X,Y)
		local Mark = {}
		local Crand = rand(3)	--�H���X��
		if Crand ==0 then
			Mark[i] = CreateObjByFlag(117225 , 780853, Y1[i] ,1) --�ϥκX�l���ͨ��m�X�� npc �X�l�s�� �ƶq 
		elseif  Crand ==1 then
			Mark[i] = CreateObjByFlag(117226 , 780853, Y1[i] ,1) --�ϥκX�l���ͧ����X�� npc �X�l�s�� �ƶq 
		else
			Mark[i] = CreateObjByFlag(117227 , 780853, Y1[i] ,1) --�ϥκX�l���ͽw�t�X��npc �X�l�s�� �ƶq 
		end
		SetModeEx( Mark[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx( Mark[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Mark[i] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Mark[i] , EM_SetModeType_Move, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Mark[i] , EM_SetModeType_HideName, false )--�W��
		SetModeEx( Mark[i] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Mark[i] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Mark[i], EM_SetModeType_Drag , false )--���O
		SetModeEx( Mark[i], EM_SetModeType_Show, true )--���
		AddToPartition( Mark[i]  , 0 )	--���ͺX��
	end			
	Sleep(100)
	BeginPlot( OwnerID(), "Lua_na_plants_Delhidemark",0 )
--	Say( OwnerID(), "Del")
end


function Lua_na_plants_Delhidemark()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117225, 117226, 117227}

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
					DelObj( ID )
					end
				end
			end
		end
	end
end



function Lua_na_plants_Delhidemark1()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Count = SetSearchAllNPC( RoomID )
	local Obj
	local NPC = { 117225, 117226, 117227, 117228}

	if  Count ~= 0 then
		for i=1 , Count , 1 do
			local ID = GetSearchResult()
			Obj=Role:New(ID)
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue( ID , EM_RoleValue_OrgID )--�T�{�Ҧ�NPC���s��
				for j = 1 , table.getn( NPC ) , 1 do
					if Name == NPC[j] then  --�Y���}�C������
					DelObj( ID )
					end
				end
			end
		end
	end
end



function Lua_na_plants_defencemark() --��ܶˮ`�аO
	SetPlot( OwnerID() , "Collision" , "Lua_na_plants_defence" , 10);	
end


function Lua_na_plants_defence()
	local A = CheckBuff( OwnerID(), 508274) --defence
	local B = CheckBuff( OwnerID(), 508275) 
	local C = CheckBuff( OwnerID(), 508276)

	if A == false and B == false and C == false then --�|�����o����BUFF
		AddBuff( OwnerID(), 508274, 0, 10)
--		say(OwnerID(), "1")
	elseif A == true then --�w�g���o�Ĥ@�Ө��mBUFF
		CancelBuff ( OwnerID(), 508274)
		AddBuff( OwnerID(), 508277, 0, 10) 
--		say(OwnerID(), "2")
	elseif B == true or C == true then--��ܿ��~
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "defence") 
	Hide( TargetID() )
end




function Lua_na_plants_attackmark() --�����аO
	SetPlot( OwnerID() , "Collision" , "Lua_na_plantsboss_attack" , 10)
end

function Lua_na_plantsboss_attack()
	local Flower = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	local A = CheckBuff( OwnerID(), 508274) 
	local B = CheckBuff( OwnerID(), 508275) --attack
	local C = CheckBuff( OwnerID(), 508276)

	if A == false and B == false and C == false then --�|�����o����BUFF
		AddBuff( OwnerID(), 508275, 0, 10)
	--	say(OwnerID(), "1")
	elseif B == true then --�w�g���o�Ĥ@�ӧ���BUFF
		CancelBuff ( OwnerID(), 508275)
		CastSpell( OwnerID(), Flower, 496847 )
		say(Flower, "2")
	elseif A == true or C == true then--��ܿ��~
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "attack") 
	Hide( TargetID() )
end




function Lua_na_plants_slowmark() --�w�t�аO
	SetPlot( OwnerID() , "Collision" , "Lua_na_plants_slow" , 10);
end


function Lua_na_plants_slow() --�w�t�аO
	local Flower = ReadRoleValue(OwnerID(),EM_RoleValue_Register10)
	local A = CheckBuff( OwnerID(), 508274) 
	local B = CheckBuff( OwnerID(), 508275) 
	local C = CheckBuff( OwnerID(), 508276) --slow

	if A == false and B == false and C == false then --�|�����o����BUFF
		AddBuff( OwnerID(), 508276, 0, 10)
	--	say(OwnerID(), "1")
	elseif C == true then --�w�g���o�Ĥ@�ӧ���BUFF
		CancelBuff ( OwnerID(), 508276)
		CastSpell( OwnerID(), Flower , 496848 )
	--	say(Flower, "3")
	elseif A == true or B == true then--��ܿ��~
		CancelBuff ( OwnerID(), 508274)
		CancelBuff ( OwnerID(), 508275)
		CancelBuff ( OwnerID(), 508276)
		Say(OwnerID(), "Wrong")
	end
	Say( OwnerID(), "slow") 
	Hide( TargetID() )
end





-------------------------------------------------------------------------------------
--�_�c���ͼ@��
-------------------------------------------------------------------------------------
function Lua_na_plants_treasureborn()  --����6�ӳQ�ʦL���_�c
	local X = {1,2,3,4,5,6}  
	local Y = 0
	local Z = {1,2,3,4,5,6}
	for i = 1 , 6 do   -- ����6��
		Y = Rand(table.getn(X))+1 
		Z[i] = X[Y]
		table.remove(X,Y)
		local Chest ={}
		Chest[i] = CreateObjByFlag(117412 , 780841 , Z[i] , 1) --�ϥκX�l���ͺX�� npc �X�l�s�� �ƶq 

		SetModeEx(Chest[i]  , EM_SetModeType_Strikback, false )--����
		SetModeEx(Chest[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx(Chest[i]  , EM_SetModeType_Obstruct, false )--����
		SetModeEx(Chest[i]  , EM_SetModeType_Mark, true )--�аO
		SetModeEx(Chest[i]  , EM_SetModeType_Move, false )--����
		SetModeEx(Chest[i]  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx(Chest[i]  , EM_SetModeType_HideName, true )--�W��
		SetModeEx(Chest[i]  , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx(Chest[i]  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx(Chest[i]  , EM_SetModeType_Drag , false )--���O
		SetModeEx(Chest[i] , EM_SetModeType_Show, true )--���
		WriteRoleValue( Chest[i] , EM_RoleValue_PID , Z[i] )
		AddToPartition( Chest[i] , 0 )	--���ͺX��
--		SetPlot( Chest[i] , "Touch" , "Lua_plants_chest2_na" , 150 )
		BeginPlot( Chest[i] , "Lua_na_plants_chestdel", 0 )
	end		
--	Say( OwnerID(), "Born OK!" )	
	Sleep(100)
end


function Lua_na_plants_chest2() --���a���W���j�N�Ԫ᪺�᯻�A�Ѱ��_�c�ʦL
	--OwnerID = ���a
	-- TargetID = �_�c
	Say( OwnerID(), "Owner")
	Say( TargetID(), "Target" )
	local P = CountBodyItem( OwnerID(), 208976)
	if P >=1 then
		ChangeObjID( TargetID(), 117411 ) 
	else
		return false
	end
end


function Lua_na_plants_chestdel()
	local Count = 1
	local ChestPID = ReadRoleValue( OwnerID(), EM_RoleValue_PID) 
	Sleep(3000) --5��������}�l�R���Ĥ@���_�c
	for i= 1 , 6 do
		if ChestPID == Count then
		--	Say( OwnerID(), ChestPID)
			DelObj( OwnerID())
		else
			sleep( 600) --�C�@�����R���@���_�c
			Count = Count +1
		end
	end
end
							





--�_�c��Ĳ�I�@��
function Lua_na_plants_box1() --���A�G���_�cĲ�I�@��
	SetPlot( OwnerID(), "touch" , "Lua_na_plants_box2" , 10)
end

function Lua_na_plants_box2() --
	--OwnerID = ���a
	-- TargetID = �_�c
	local P = CountBodyItem( OwnerID(), 208976)
	if P >=1 then
		ChangeObjID( TargetID(), 117411 ) 
		Say( OwnerID(), "Change!!" )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_CACTUS_BOX_01]" , C_SYSTEM ) --�o���_�c���]�k�ʦL�w�g�Ѱ��C
	else
		Say( OwnerID(), "OPEN ERROR!!" )
		ScriptMessage ( OwnerID() , OwnerID(), 1, "[SC_CACTUS_BOX_02]" , C_SYSTEM ) --�o���_�c�w�Q�]�k�ʦL�A�������Ѱ��ʦL�~�i�}�ҡC
	end
end



function Lua_na_plants_box3() -- �Ѱ��ʦL���_�c
	SetPlot( OwnerID() , "touch" , "Lua_plants_box4_na" , 10 );
end

function Lua_plants_box4_na()
	if CheckBuff(OwnerID(), 505297) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_LOSTTREASURE_MSG02]" , C_SYSTEM )	--�A�B��˦����A�L�k��ʡC
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_LOSTTREASURE_MSG02]"  , C_SYSTEM )
	else
		if BeginCastBar( OwnerID(), "[SO_110195_1]", 30 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) == 1 then	--/*�}�l�I�k�A�ϥΪ�,�ɶ����W����r,�i��ɶ�,�_�l�ʧ@,�����ʧ@,���_����(0�����ʤ��_)

			while true do
			sleep( 2 )
				local CastBarStatus = CheckCastBar( OwnerID() )
				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0) then -- ���\
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- ����
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then

				if CheckID( TargetID() ) == true then
					if EmptyPacketCount( OwnerID() ) >= 1  and QueuePacketCount( OwnerID() ) == 0 then --�ˬd�I�]���

						PlayMotionEX( TargetID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN,ruFUSION_ACTORSTATE_ACTIVATE_LOOP)  --�_�c���򼽩�145    146
						GiveBodyItem( OwnerID() , 725051 , 1 )
						SetPlot( TargetID(),"touch","",0 )
						sleep(10)
						BeginPlot( TargetID(), "Lua_na_box_del" , 0 ) 
					--	Delobj( TargetID() ) --15���R���_�c
					else
						ScriptMessage( TargetID() , OwnerID() , 1 , "[K_08MID_DIALOG8]" , 0 ) --�z���I�]�Ŷ������A�вM�z�@�U�A�ӧa�C
						SetPlot( TargetID(),"touch","Lua_na_plants_box4",10 )
					end	
				end
			elseif ( result == "DAME" ) then
				SetPlot( TargetID(),"touch","Lua_na_plants_box4",10 )
			end
		end
	end
end


function Lua_na_box_del()
	sleep( 150)
	DelObj( OwnerID() )
end
