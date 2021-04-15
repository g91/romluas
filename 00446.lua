----------------------------------------------------------------�ҩ�-------------------------------------------------------------------
function LuaI_200680_Check() --�������@����
	local Point = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110676 , 500 )

	if CheckID(Point) == true then
		if ReadRoleValue( Point , EM_RoleValue_PID) ~= 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200680_0"), 0 ); --/*�]�ǥ���w�g�X�{�F�I
			return false
		end
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200680_2"), 0 ); --/*�S�������A�ݨӳo�̤��O�]�Ǥۼv������X�S���B�C	
		return false
	end
end 

function LuaI_200680_Use() --�������@����
	local Point = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110676 , 500 )
--		SAY( OwnerID() , Point )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_200680_1"), 0 ); --/*�A�|�P���Ů���G���ͤF�޲����i��......
	BeginPlot(Point,"LuaQ_200680_Sui",0)
end 

function LuaQ_200680_Sui() 
	local NightMare
	NightMare = LuaFunc_CreateObjByObj ( 100632 , TargetID() )
	SetAttack( Nightmare , TargetID() )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 2000 )
	Sleep(120)
	while 1 do
		sleep(1)
		if	CheckID(NightMare)==false	then
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			DelObj( Nightmare )
			break	
		end
		if ReadRoleValue( Nightmare, EM_RoleValue_AttackTargetID ) ~= 0 then 
			sleep(60)	-- �����ˬd�@��	
		else
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
			DelObj( Nightmare )
			break		
		end
		sleep(1)
	end
end
--------------------------------------------------------------------------------------------------------------------------------------- 
function LuaP_420576_0()
	local Check = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	local DCheck = LuaFunc_SearchNPCbyOrgID( OwnerID() , 100631, 500 ) 
	if Check >= 5 then
		if CheckID( DCheck ) == false then
		--	MoveToFlagEnabled( OwnerID() , False )
			local Monster = CreateObjByFlag (  100631, 780046, 0 ,1 )
			AddToPartition(Monster , 0)
			SetPlot( Monster ,"dead","LuaQ_420576_Dead",40 )
			BeginPlot( Monster , "LuaQ_420576_Attack" , 0 )
		end
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	else
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , Check +1 )
	end
end

function LuaQ_420576_Attack()
	local Ret = {}
	local Obj;
	local Count = SetSearchRangeInfo( OwnerID(),300 )

	for i = 1 , Count , 1 do
		local ID = GetSearchResult()
		Obj = Role:New( ID )
		if Obj:IsNPC() == True then
			if Obj:OrgID() == 110677 or Obj:OrgID() == 110678 or Obj:OrgID() == 110666 or Obj:OrgID() == 110667 or Obj:OrgID() == 110033 then 
				Say( ID , GetString("SAY_420576_0") ) --/*�]�ǥX�{�F�I�j�a�`�N�I
				BeginPlot( ID , "LuaQ_420576_Guard" , 0 )
			end

		end
	end
	LuaFunc_MoveToFlag( OwnerID(), 780046 , 1,0 )
--	SetAttack( OwnerID() , TargetID() )
	LuaFunc_Obj_Suicide(150)
end

function LuaQ_420576_Guard() --�������Ӫ��ʧ@�A����NPC�����ؼ�
--	MoveToFlagEnabled( OwnerID() , false )
	DisableQuest( OwnerID() , true )
	SetRoleCamp( OwnerID() , "SNPC" )
	SetFightMode ( OwnerID(),1, 1, 1,1 )
	local Nightmare = TargetID()
	local OrgID = ReadRoleValue( Nightmare , EM_RoleValue_OrgID )
	if SetAttack( OwnerID() , TargetID() ) then
--		Say( OwnerID() , "On Attack "..ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ))
		
	end
	while 1 do
		sleep(1)
		if ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) == Nightmare and ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == OrgID then 
			sleep(60)	-- �����ˬd�@��	
		else
--			Say( OwnerID() , "Safe")
			break		
		end
		sleep(1)
	end
	Lua_CancelAllBuff( OwnerID() ) 
	SetFightMode ( OwnerID(),0, 1, 0,0 )
	SetRoleCamp( OwnerID() , "Visitor" )
	DisableQuest( OwnerID() , false )
--	MoveToFlagEnabled( OwnerID() , true )
end

function LuaQ_420576_Dead()
	local PlayerTeam = HateListCount( OwnerID() )
	for i = 1 , PlayerTeam, 1 do
		local ID = HateListInfo(OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
		if ReadRoleValue(  ID , EM_RoleValue_IsPlayer ) == 1 then
			if CheckCompleteQuest(  ID , 420576 ) == false  and CountBodyItem( ID , 200751 ) == 0 then
				GiveBodyItem(  ID , 200751 , 1 )
			end
		end	
	end

	return true
end

function LuaI_420576_Guard()
	SetPlot( OwnerID() , "dead" ,"LuaQ_420576_Dead2" , 40 )
end

function LuaQ_420576_Dead2()
--	Say( OwnerID() , ReadRoleValue( OwnerID(), EM_RoleValue_AttackTargetID ) )
	local MaxHP = ReadRoleValue( OwnerID() , EM_RoleValue_MaxHP )
	WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP )
	SetAttack( OwnerID() , TargetID() )
	return false
end