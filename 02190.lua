function bk_war1_door0()------�Ĥ@�Ӫ��}�Fnpc ���b���ͽĨ�
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local mob = ReadRoleValue(start,EM_RoleValue_register1)
	if mob > 2 then 
	elseif mob <= 2 then 
	WriteRoleValue(start,EM_RoleValue_register1,1)
	end
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx(monster,EM_SetModeType_Strikback, false)--����
	SetModeEx(monster,EM_SetModeType_Move, false)--����
	SetModeEx(monster,EM_SetModeType_Fight, false)--�i�������
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	WriteRoleValue(monster,EM_RoleValue_register9,targetID())
	AddToPartition( monster, RoomID)
end
function bk_war1_door13_enter()-----�@�����X�ǰe�� �ǰe�̼@��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ChangeZone( OwnerID() , 190 , RoomID, -6447.8 , 105 , -2941.7 , 360 )
end
function bk_war1_door13_out()-----�@�����X�ǰe�� �ǰe�̼@��
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	ChangeZone( OwnerID() , 190 , RoomID, 2113.7 , -5 , -2575.2 , 180 )
end
function bk_war1_door2()------���}2���X
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	WriteRoleValue(start,EM_RoleValue_register1,5)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx(monster,EM_SetModeType_Strikback, false)--����
	SetModeEx(monster,EM_SetModeType_Move, false)--����
	SetModeEx(monster,EM_SetModeType_Fight, false)--�i�������
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	WriteRoleValue(monster,EM_RoleValue_Register9,targetID())
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	AddToPartition( monster, RoomID)
end
function bk_war1_door3()------���}3���X
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local mob = ReadRoleValue(start,EM_RoleValue_register1)
	WriteRoleValue(start,EM_RoleValue_register1,7)
	local flag = ReadRolevalue(OwnerID(),EM_Rolevalue_PID)
	local monster
	monster = CreateObjByFlag( 104572 , flag , 5 , 1 )
	SetModeEx(monster,EM_SetModeType_Show, false)
	SetModeEx(monster,EM_SetModeType_Mark, false)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(monster,EM_SetModeType_HideName, false)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(monster,EM_SetModeType_NotShowHPMP, false)--����ܦ��
	SetModeEx(monster,EM_SetModeType_Strikback, false)--����
	SetModeEx(monster,EM_SetModeType_Move, false)--����
	SetModeEx(monster,EM_SetModeType_Fight, false)--�i�������
	SetModeEx(monster,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	BeginPlot( monster , "Lua_UN_190_PAT4" , 0 )
	AddToPartition( monster, RoomID)
end
function bk_war1_car0()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local open = ReadRoleValue(start,EM_RoleValue_register1)----Ū�����
	local cd1 = 0
	local cd2 = 0
	--local car1 = CreateObjByFlag( 104765 , 780812 , 10 , 1 )
	--SetModeEx(car1,EM_SetModeType_Show, true)
	--SetModeEx(car1,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
	--SetModeEx(car1,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
	--SetModeEx(car1,EM_SetModeType_NotShowHPMP, true)--����ܦ��
	--SetModeEx(car1,EM_SetModeType_Strikback, false)--����
	--SetModeEx(car1,EM_SetModeType_Move, true)--����
	--SetModeEx(car1,EM_SetModeType_Fight, true)--�i�������
	--SetModeEx(car1,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	--WriteRoleValue(car1,EM_RoleValue_PID,ownerid())
--	AddToPartition( car1, RoomID)
--	SetPlot( car1 , "dead" , "bk_war1_car1_dead" , 0 )
	--AddBuff( car1 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	--local car2 = CreateObjByFlag( 104765 , 780812 , 11 , 1 )
	--SetModeEx(car2,EM_SetModeType_Show, true)
	--SetModeEx(car2,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
	--SetModeEx(car2,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
	--SetModeEx(car2,EM_SetModeType_NotShowHPMP, true)--����ܦ��
	--SetModeEx(car2,EM_SetModeType_Strikback,false )--����
--	SetModeEx(car2,EM_SetModeType_Move, true)--����
	--SetModeEx(car2,EM_SetModeType_Fight, true)--�i�������
	--SetModeEx(car2,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	--WriteRoleValue(car2,EM_RoleValue_PID,ownerid())
	--AddToPartition( car2, RoomID)
--	SetPlot( car2 , "dead" , "bk_war1_car2_dead" , 0 )
--	AddBuff( car2 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	while 1 do 
		sleep(10)
		open = ReadRoleValue(start,EM_RoleValue_register1)----Ū�����
		cd1=ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
		cd2=ReadRoleValue(OwnerID(),EM_RoleValue_register3)----Ū�����
		if open == 0 then 
			--if cd1 == 1 then 
			--	car1 = CreateObjByFlag( 104765 , 780812 , 10 , 1 )
			--	SetModeEx(car1,EM_SetModeType_Show, true)
			--	SetModeEx(car1,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			--	SetModeEx(car1,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			--	SetModeEx(car1,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			---	SetModeEx(car1,EM_SetModeType_Strikback, false)--����
			---	SetModeEx(car1,EM_SetModeType_Move, true)--����
			--	SetModeEx(car1,EM_SetModeType_Fight, true)--�i�������
			--	SetModeEx(car1,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			---	AddToPartition( car1, RoomID)
			--	WriteRoleValue(car1,EM_RoleValue_PID,ownerid())
			--	SetPlot( car1 , "dead" , "bk_war1_car1_dead" , 0 )
			--	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0)
			--	AddBuff( car1 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			--end
		--	if cd2 == 1 then 
			--	car2 = CreateObjByFlag( 104765 , 780812 , 11 , 1 )
			--	SetModeEx(car2,EM_SetModeType_Show, true)
			---	SetModeEx(car2,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			---	SetModeEx(car2,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			--	SetModeEx(car2,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			---	SetModeEx(car2,EM_SetModeType_Strikback, false)--����
			--	SetModeEx(car2,EM_SetModeType_Move, true)--����
			--[[	SetModeEx(car2,EM_SetModeType_Fight, true)--�i�������
				SetModeEx(car2,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
				AddToPartition( car2, RoomID)
				WriteRoleValue(car2,EM_RoleValue_PID,ownerid())
				SetPlot( car2 , "dead" , "bk_war1_car2_dead" , 0 )
				WriteRoleValue(OwnerID(),EM_RoleValue_register3,0)]]--
			--	AddBuff( car2 ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			--end		
		elseif open == 1 then 		
		end	
	end
	
end
function bk_war1_car1_dead()
	local carcount = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	WriteRoleValue(carcount,EM_RoleValue_register2,1)
end
function bk_war1_car2_dead()
	local carcount = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	WriteRoleValue(carcount,EM_RoleValue_register3,1)
end
function bk_war1_d12_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local dd = ReadRoleValue(start,EM_RoleValue_register9)
	if dd == 0 then 
	dd = dd +1 
	WriteRoleValue(start,EM_RoleValue_register9,dd)
	elseif dd == 1 then 
		
	end
end
function bk_war1_d01_dead()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local dd = ReadRoleValue(start,EM_RoleValue_register9)
	if dd == 0 then 
	dd = dd +1 
	WriteRoleValue(start,EM_RoleValue_register9,dd)
	elseif dd == 1 then 
		
	end
end
function bk_WAR1_TIMEOVER()
	local ZoneID= ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)-----------------
	if ZoneID ~= 190 then 
		ClockClose( OwnerID() )
	end
end
function bk_war1_tg1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local player= ownerid()
end
function bk_war1_117111()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	---AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_01", 0 )
end
function bk_war1_117111_01()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_car_car",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_car_car()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObj( 104765 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , play , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_car_caheck()
local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
local PlayerIsSit =  CheckFlag( OwnerID()  , 543769 )--���a�O�_�b����W
local x=0
	x= LuaFunc_SearchNPCbyOrgID( OwnerID() , 105075, 100 , 0)
	----saY(ownerid(),"xxx="..x)	
	if ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) == 190 then 
		if x ~= -1 then 
			if (PlayerIsSit == true) then --���a�b����W
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) -- ����W�L�k�ϥ�
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_86]", 0 ) 
				return false
			else
				return true
			end
		elseif x == -1 then 
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SSC_WAR1_104765_1]", 0 ) --�����b�ǰe���~�i�H�}��
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_WAR1_104765_1]", 0 ) 
			return false
		end
	elseif ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID) ~= 190 then 
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM )
		return false
	end	
end
function bk_war1_car_use()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local car = CreateObj( 104765 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx(car,EM_SetModeType_Show, true)
	SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
	SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
	SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
	SetModeEx(car,EM_SetModeType_Strikback, false)--����
	SetModeEx(car,EM_SetModeType_Move, true)--����
	SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
	SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
	AddToPartition( car, RoomID)
	AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
end
function bk_war_boss1_open()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------  
	local d13 = CreateObjByFlag(102678,780812,7,1)----���~boss�}���N�X��
	SetModeEx( d13 , EM_SetModeType_Mark, false)
	SetModeEx( d13 , EM_SetModeType_HideName, false)
	SetModeEx( d13 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d13 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d13 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( d13 , EM_SetModeType_Move, false) ---����	
	SetModeEx( d13 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( d13 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d13 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d13 , EM_SetModeType_Show, false)
	AddToPartition( d13 , RoomID )
	SetPlot( d13 , "Collision" , "bk_war1_door13_out" , 0 )
	
	local d14 = CreateObjByFlag(102678,780812,8,1)----���~boss�}���N�X��
	SetModeEx( d14 , EM_SetModeType_Mark, false)
	SetModeEx( d14 , EM_SetModeType_HideName, false)
	SetModeEx( d14 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d14 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d14 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( d14 , EM_SetModeType_Move, false) ---����	
	SetModeEx( d14 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( d14 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d14 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d14 , EM_SetModeType_Show, false)
	AddToPartition( d14 , RoomID )
	SetPlot( d14 , "Collision" , "bk_war1_door13_enter" , 0 )
	
	local d15=CreateObj( 112224 ,-6510.8, 112 , -2967.6, 334 , 1)
---	d15 = CreateObjByFlag(112224,780812,7,1)----���~boss�}���N�X��
	SetModeEx( d15 , EM_SetModeType_Mark, false)
	SetModeEx( d15 , EM_SetModeType_HideName, true)
	SetModeEx( d15 , EM_SetModeType_Gravity, false)
	SetModeEx( d15 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d15 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d15 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( d15 , EM_SetModeType_Move, false) ---����	
	SetModeEx( d15 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( d15 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d15 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d15 , EM_SetModeType_Show, true)
	AddToPartition( d15 , RoomID )
	
	local d16=CreateObj( 112224 ,2169.3, 10 , -2595.8, 207 , 1)
---	d16 = CreateObjByFlag(112224,780812,8,1)----���~boss�}���N�X��
	SetModeEx( d16 , EM_SetModeType_Mark, false)
	SetModeEx( d16 , EM_SetModeType_HideName, true)
	SetModeEx( d16 , EM_SetModeType_Gravity, false)
	SetModeEx( d16 , EM_SetModeType_ShowRoleHead, false)
	SetModeEx( d16 , EM_SetModeType_NotShowHPMP, false)
	SetModeEx( d16 , EM_SetModeType_Strikback, false) ---����
	SetModeEx( d16 , EM_SetModeType_Move, false) ---����	
	SetModeEx( d16 , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( d16 , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( d16 , EM_SetModeType_Searchenemy, false)
	SetModeEx( d16 , EM_SetModeType_Show, true)
	AddToPartition( d16 , RoomID )
end
function bk_war1_car_dead1()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local dd = ReadRoleValue(start,EM_RoleValue_register8)
	---saY(ownerid(),"xxxxx="..dd)
	dd = dd -1 
	WriteRoleValue(start,EM_RoleValue_register8,dd)
end
function bk_war1_117111_m31()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m311", 0 )
end
function bk_war1_117111_m311()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo31",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo31()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,18,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
			---say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_117111_m32()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	----------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m321", 0 )
end
function bk_war1_117111_m321()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo32",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo32()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,19,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_117111_m41()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	----AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m411", 0 )
end
function bk_war1_117111_m411()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo41",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo41()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,20,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
			----say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_117111_m42()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	-----AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m421", 0 )
end
function bk_war1_117111_m421()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo42",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo42()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,21,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_117111_m51()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m511", 0 )
end
function bk_war1_117111_m511()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo51",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo51()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,22,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		---	say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end
function bk_war1_117111_m52()  ----------------------------------npc �ϥΪ�
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	LoadQuestOption( OwnerID() )  --------�o���͸ܤ��e
	-------------AddSpeakOption( OwnerID(), TargetID(), "[SC_WAR1_104765_2]", "bk_war1_117111_m521", 0 )
end
function bk_war1_117111_m521()
	local mob= ReadRoleValue(OwnerID(),EM_RoleValue_register2)----Ū�����
	if mob == 0 then 
		BeginPlot( TargetID() ,"bk_war1_mo52",0)
		WriteRoleValue(TargetID(),EM_RoleValue_register2,1) ------------�ɶ������i�D���ӵ����R���F
		WriteRoleValue(TargetID(),EM_RoleValue_register1,ownerid()) 
	elseif mob == 1 then 
		ScriptMessage( OwnerID() , -1 , 1 , "[SC_WAR1_104765_5]" , 1 )-------------------------------------�Z���L��
		CloseSpeak( OwnerID() )
	end	
end
function bk_war1_mo52()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local start=ReadRoleValue(OwnerID(),EM_RoleValue_PID)----Ū�����
	local play=ReadRoleValue(OwnerID(),EM_RoleValue_register1)----Ū�����
	local tx=0-------------�O���o�ӼȮɾ����ɶ�
	local qm=0 
	local carm= ReadRoleValue(start,EM_RoleValue_register8)-----------------Ū������!!!
	if carm < 20 then 
		qm = CountBodyItem(play,208677)  ---------�ˬd�o�ӪF�誺���~�ƶq
		if qm >= 2 then 
			DelBodyItem ( play, 208677, 2 )
			local OwnerX = ReadRoleValue( play , EM_RoleValue_X ) 
			local OwnerY = ReadRoleValue( play , EM_RoleValue_Y ) 
			local OwnerZ = ReadRoleValue( play , EM_RoleValue_Z ) 
			local OwnerDIR = ReadRoleValue( play , EM_RoleValue_Dir ) 
			local car = CreateObjByFlag(104765,780812,23,1)----
			SetModeEx(car,EM_SetModeType_Show, true)
			SetModeEx(car,EM_SetModeType_Mark, true)--�i�аO/�I��(�i�H�����a�I��)
			SetModeEx(car,EM_SetModeType_HideName, true)--NPC �Ϊ����Y�W���W�٬O�_���
			SetModeEx(car,EM_SetModeType_NotShowHPMP, true)--����ܦ��
			SetModeEx(car,EM_SetModeType_Strikback, false)--����
			SetModeEx(car,EM_SetModeType_Move, true)--����
			SetModeEx(car,EM_SetModeType_Fight, true)--�i�������
			SetModeEx(car,EM_SetModeType_Searchenemy, false)--�j�M�ĤH
			AddToPartition( car, RoomID)
			AddBuff( car ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
			WriteRoleValue(car,EM_RoleValue_PID,start) ------------�ɶ������i�D���ӵ����R���F	
			SetPlot( car , "dead" , "bk_war1_car_dead1" , 0 )	
			carm = carm+1	
		----say(play,"x="..carm)
			WriteRoleValue(start,EM_RoleValue_register8,carm) ------------�ɶ������i�D���ӵ����R���F
		---	GiveBodyItem ( ownerid(), 208687 , 1 )
			CloseSpeak( play )
		elseif qm < 2 then 
			ScriptMessage( play , play , 1 , "[SC_WAR1_104765_3]" , 1 )-------------------------------------�Z���L��
		end
	elseif carm >= 20 then 
		ScriptMessage( play , -1 , 1 , "[SC_WAR1_104765_4]" , 1 )-------------------------------------�Z���L��
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_register2,0) ------------�ɶ������i�D���ӵ����R���F
end

