function Lua_na_11xmas_Trans()--�ǰe�P�_�����l�@��
	local Owner = OwnerID()
	local Muven = LuaFunc_SearchNPCbyOrgID( Owner , 120086  , 50 , 0 ) 	--�H���ê���114041�����ߡA�V�P��100�X�j�MNPC������� 120085 
									--(�̫᪺0��Type�AType 0 ���ܷ|�b�u���@�ӥؼЮɦ^�ǸӥؼСA�A�Ω�w���ƶq�ؼ�)
									--(1 ���ܫh�O�L�ק��X�ӡA���^�Ǿ�Ӹs�աA�A�Ω󥼪��ƶq�ؼ�)
	SetDefIdleMotion( Owner , 242 )  --���������A
 	WriteRoleValue ( Muven , EM_RoleValue_PID , 0 )
	local X = ReadRoleValue( Muven , EM_RoleValue_PID )
--	say( Muven ,"before start" ..  X)
end


function Lua_storm_path_start()
	local Owner = OwnerID()
	local RoomID = ReadRoleValue( Owner, EM_RoleValue_RoomID) --�T�{���A�������y
	local Count = SetSearchAllNPC( RoomID) --�M����y���Ҧ���NPC
	local Obj
	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
		RunningMsg( Owner , 1 , "[SC_2011XMAS_TRANS_MSG]" ) 	-- (0 �ۤv 1 �ϰ� 2 �������a )�C�B�᪺�𮧤w�g���h�A1��������N�Ҧ��_�I�̶ǰe�^���i�԰���I
	end
	if  Count ~= 0 then
		for i=1 , Count, 1 do  --�]�w�j�M�Ҧ�NPC���ƪ��j��
			local ID = GetSearchResult() --���o�j�MNPC�����G
			Obj=Role:New(ID)
			
			if Obj:IsNPC() == true then
			local Name = ReadRoleValue(  ID, EM_RoleValue_OrgID)--�T�{�Ҧ����a���s��
				if Name ==120090 then  --ZONE5 �ǰe�P�_
					 BeginPlot( ID , "Lua_na_11xmas_Trans2" , 0 )
				end
			end
		end
	end
end


function Lua_na_11xmas_Trans2() --�}��@�p�ɤ�������
	local Owner = OwnerID()
	local Muven = LuaFunc_SearchNPCbyOrgID( Owner , 120086  , 50 , 0 ) 	
	SetDefIdleMotion( Owner , 11 )	
	WriteRoleValue( Muven , EM_RoleValue_PID , 1 )
	sleep( 36000 ) -- 36000 1�p�ɫ�R��NPC
	WriteRoleValue ( Muven , EM_RoleValue_PID , 0 )
	BeginPlot( Owner , "Lua_na_11xmas_Trans" , 0 )
end


--���ի��O
--------------------------------------------------------------------------------------------------------------------

function Lua_na_11xmas_buffadd() --�|�[BUFF��19�h
	KORS_buffUpDown( OwnerID()  , 621897 , 0 , 19 )  -- KORS_buffUpDown( ObjID , BuffID , UpDown , Level ,time )  , UP == 0�ADOWN == 1 
end


function Lua_na_11xmas_test_start()
	BeginPlot( OwnerID(), "Lua_na_11xmas_start" , 0 )
	BeginPlot( OwnerID(), "Lua_na_11xmas_wood_born" , 0 )
end

function Lua_na_11xmas_test_transout() --�ǰe�X���ʰ�
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local Player = SetSearchAllPlayer( RoomID ) --�ˬd�ϰ줤�����a�`��
	local ID 
	for i=1, table.getn(PlayerList) , 1  do
		if CheckID( PlayerList[i] ) ==true then
			AddBuff( PlayerList[i] , 621720 , 2 , 1)--�M��BUFF�A���a�|�ǰe�X���ϰ�
		else
			DebugMsg( 0, 0 ,"ID = "..PlayerList[i])
		end					
	end
end


function Lua_na_xmas_test_1() --�N�ۤv�g�JPlayer
	local Owner = OwnerID()
	table.insert( PlayerList , Owner )
end


function Lua_na_xmas_test_2() --Ū���ثe��Reg��
	local Owner = OwnerID()
	local O_Reg2 = ReadRoleValue( Owner , EM_RoleValue_Register2 )
	say( Owner , " score = " .. O_Reg2 )
end


function Lua_na_11xmas_ClearBuff()
	local Xmas = { 621727 , 621729 , 621731 , 621897, 621715 }
	local Owner = OwnerID()
	for i = 1, table.getn(Xmas), 1 do
		CancelBuff(Owner , Xmas[i] )  --�M�����a���W�Ҧ����ʬ���BUFF
	end
	say( Owner , "CancelBuff")
end	