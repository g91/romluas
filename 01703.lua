-----------start     

function Lua_bk_122_102691()---------------�}�l�@��
	local RoomID =ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------�}�l���ж�
	local start=OwnerID()-------------------------------------------------�}������
	local be=0
	local PPL=0
	local smaster = LuaFunc_CreateObjByObj(102691,OwnerID())------------------------------------�����I�h���ͪ���
	AddToPartition( smaster , RoomID )
	WriteRoleValue( smaster, EM_RoleValue_PID,start)
	BeginPlot( smaster ,"Lua_bk_122_ma_102691",0)---------------------------------���@���Ҧ�
	SetPlot( smaster , "dead" , "Lua_bk_122_smaster_102691" , 0 )-----------��J���`�@���ˬd�O�ֱ��F�L
	while 1 do 
		sleep(10)
		be=ReadRoleValue( OwnerID(),EM_RoleValue_Register1 ) 
		if be==1 then 
		---	say(OwnerID(),"xx")
			sleep(50)
			PPL=SetSearchAllNPC(RoomID)----------------�M��㶡��
			for x=1,PPL do 		
				sleep(10)
				local ID = GetSearchResult()
				if ReadRoleValue( ID,EM_RoleValue_OrgID ) == 103090 then 
					DelObj(ID)
				end
			end
			local smaster = LuaFunc_CreateObjByObj(102691,OwnerID())------------------------------------�����I�h���ͪ���
			AddToPartition( smaster , RoomID )
			WriteRoleValue( smaster, EM_RoleValue_PID,start)
			BeginPlot( smaster ,"Lua_bk_122_ma_102691",0)---------------------------------���@���Ҧ�
			SetPlot( smaster , "dead" , "Lua_bk_122_smaster_102691" , 0 )-----------��J���`�@���ˬd�O�ֱ��F�L
			be=0
			WriteRoleValue(start, EM_RoleValue_Register1,0)
		end
		x=ReadRoleValue(start,EM_RoleValue_Register9)
	end
end
function Lua_bk_122_smaster_102691()
	local x=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1,1)-----����
	WriteRoleValue(OwnerID(), EM_RoleValue_Register3,TargetID())-----����
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	BeginPlot(OwnerID(),"Lua_bk_122_dead_102691",0)---------�ǳƭ��ͼҦ�
	return false
end
function Lua_bk_122_smaster1_102691()
	local x=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
	WriteRoleValue(OwnerID(), EM_RoleValue_Register1,1)-----����
	WriteRoleValue(OwnerID(), EM_RoleValue_Register3,TargetID())-----����
	PlayMotion ( OwnerID(), ruFUSION_ACTORSTATE_ACTIVATE_BEGIN )
	SetModeEx( OwnerID() , EM_SetModeType_Gravity, true) ---���O
	SetModeEx( OwnerID() , EM_SetModeType_Mark, true)
	SetModeEx( OwnerID() , EM_SetModeType_HideName, true)
	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true)
	SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true)
	SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false)   -----�|����(���ר�L������)
	SetModeEx( OwnerID() , EM_SetModeType_Strikback, false) ---����
	SetModeEx( OwnerID() , EM_SetModeType_Move, false) ---����	
	SetModeEx( OwnerID() , EM_SetModeType_Fight, false) ---�i���
	SetModeEx( OwnerID() , EM_SetModeType_SearchenemyIgnore, false) 
	SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false)
	SetModeEx( OwnerID() , EM_SetModeType_Show, true)
	BeginPlot(OwnerID(),"Lua_bk_122_dead1_102691",0)---------�ǳƭ��ͼҦ�
	return false
end
function Lua_bk_122_dead_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local x=0
	local kill=ReadRoleValue( OwnerID(),EM_RoleValue_Register3 ) 
	local x=ReadRoleValue( kill,EM_RoleValue_OrgID ) 
	---say(OwnerID(),"x"..x)
	local bk=ReadRoleValue(start,EM_RoleValue_Register9 ) ------------------�����L��������
	if ReadRoleValue( kill,EM_RoleValue_OrgID ) == 102691 then -------------�ˬd�����L���H�O�� 
		if bk<=2 then 
			---say(OwnerID(),"bk"..bk)
			BeginPlot(smaster,"Lua_bk_122_live_102691",10)---------�ǳƭ��ͼҦ�
			bk=bk+1
			WriteRoleValue(start, EM_RoleValue_Register9,bk)	
		elseif bk>=3 then 
			DelObj(OwnerID())
		end
	elseif ReadRoleValue( kill,EM_RoleValue_OrgID ) ~= 102691 then -------------�ˬd�����L���H�O�� 
	end
end

function Lua_bk_122_dead1_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local x=0
	local kill=ReadRoleValue( TargetID(),EM_RoleValue_Register3 ) 
	local x=ReadRoleValue( kill,EM_RoleValue_OrgID ) 
	local bk=ReadRoleValue(start,EM_RoleValue_Register9 ) ------------------�����L��������
	if ReadRoleValue( kill,EM_RoleValue_OrgID ) == 103090 then -------------�ˬd�����L���H�O�� 
		------------------�Ҽ{�^�ǭȵ�start �o�ˤ�K�p��
		if bk<=2 then 
		BeginPlot(smaster,"Lua_bk_122_live_102691",0)---------�ǳƭ��ͼҦ�
		bk=bk+1
		WriteRoleValue(start, EM_RoleValue_Register9,bk)	
		elseif bk>=3 then 
			DelObj(OwnerID())
		end
	elseif ReadRoleValue( kill,EM_RoleValue_OrgID ) ~= 103090 then -------------�ˬd�����L���H�O�� 
		------------------�Q���a�����N�i�H���ΰʤF �u�������`�F���O�n�^�ǭȵ��}�l������
	end
end
function Lua_bk_122_live_102691()-------------------------���ͨⰦ
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local bk=0
	local newmaster=LuaFunc_CreateObjByObj(103090,OwnerID())
	BeginPlot( newmaster ,"Lua_bk_122_ma1_102691",50)---------�԰��P�_�Ҧ�
	WriteRoleValue( newmaster, EM_RoleValue_PID,start)---------------------����
	SetPlot( newmaster , "dead" , "Lua_bk_122_smaster1_102691" , 0 )
	local newmaster1=LuaFunc_CreateObjByObj(103090,OwnerID())
	BeginPlot( newmaster1 ,"Lua_bk_122_ma1_102691",50)---------�԰��P�_�Ҧ�
	WriteRoleValue( newmaster1, EM_RoleValue_PID,start)---------------------����
	SetPlot( newmaster1 , "dead" , "Lua_bk_122_smaster1_102691" , 0 )
	sleep(10)
	DelObj(OwnerID())
end
function Lua_bk_122_ma_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local CombatBegin=0
	local dead=0
	local live=0
	while 1 do 
	sleep(10)
		if HateListCount(smaster) ~= 0 then	---- �T�w�L�{�b�����H
			if CombatBegin == 0 then							---------------�u���}����@��
				CombatBegin = 1
			end
		elseif HateListCount( smaster ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			if CombatBegin==1 then 
				---dead=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
				live=ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			---	say(OwnerID(),"live"..live)
				if live == 0 then 
					WriteRoleValue(start, EM_RoleValue_Register1,1)	---
					sleep(30)
					DelObj(smaster)
				elseif live==1 then 
					break
				end
			end
		end
	end
end
function Lua_bk_122_ma1_102691()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)
	local smaster= OwnerID()
	local start = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	local CombatBegin=0
	local dead=0
	local live=0
	while 1 do 
	sleep(10)
		if HateListCount(smaster) ~= 0 then	---- �T�w�L�{�b�����H
			
		elseif HateListCount( smaster ) == 0 then----------------���}�԰� �Ҧ��ȳ��Ӧ^�k
			----dead=ReadRoleValue( OwnerID() , EM_RoleValue_IsDead )
			live=ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
			if live == 0 then 
				WriteRoleValue(start, EM_RoleValue_Register1,1)	---
				sleep(30)
				DelObj(smaster)
			elseif live==1 then 
				break
			end
		end
	end
end
