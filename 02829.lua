--�@�N���ǰe�N�A�g�k�P�޿�²����A�A���n�W����������C
--�G�N���ǰe�N�A���F��Ҧ��F�賣�]�i�h�A�g�F�@������@�Ψ禡�A����A�C���n�ǰe�N�n�]�@�j��function�C
--�@�N�ǰe�N�ϥΪ��r�ꬰ�����A�G�N���ǰe�N�ϥΪ��O�a�W�C
--�s�g�@���F��Ȱ��y�{�W���ק�A�õL��ʥ���F��C


--�s�W�ϰ��޿�I�G�ݷs�W�X�СC
--�s�W�ϰ��޿�II�G�ݷs�W�i�ǰe�a�ϡC
function lua_WorldI_TelFlagSet( loc )
	loc = loc or 1	--�N���a���]�|�H���Où����
	--�s�W�ϰ�[ZoneID]=�i����Zone���X�ЧP�w�C
	local Flag = { 	[1] = 541313 ,
			[2] = 541314 ,
			[3] = 542297 ,
			[4] = 541315 ,
			[5] = 541316 ,
			[6] = 541317 ,
			[7] = 542498 ,
			[8] = 542744 ,
			[9] = 542997 ,
			[10] = 541318 ,
			[11] = 541319 ,
			[12] = 542557 ,
			[13] = 540193 ,
			[15] = 543704 ,
			[22] = 546189 ,
			[31] = 546255 
					}
		return Flag[ loc ]
end

function lua_WorldI_TelPointSet( loc )
	loc = loc or 1	--�N���a���]�|�H���Où����
	--�޿�ex�G[zone 5] ={�i�H�Ǧ�zone 4�Bzone 6�Bzone 11}
	local Telpoint = {
			[1] = {2} ,
			[2] = {6,22,1,12,31,13,3,4,5,7,8,9,10,11},	--���F�\�h�ҥ~�W�h�A�D�����ƦC���ǭn�S�O�`�N�A�D���U�Ӥ~�O�s���
			[3] = {2,7} ,
			[4] = {2,5} ,
			[5] = {4,6,11} ,
			[6] = {2,15,12,31,10,13,5,11,1,3,4,7,8,9} ,
			[7] = {3,8} ,
			[8] = {7,9},
			[9] = {8} ,
			[10] = {6,11} ,
			[11] = {5,10} ,
			[12] = {2} ,
			[31] = {2} 	}
		return	Telpoint[ loc ]
end

--�p����l�ȡA�b�p�a�ϤW�]�w����Ϧ�
function DownloadSet()
	SetMinimapIcon ( OwnerID(), EM_MapIconType_FlightPoint );
end
--����function���e�@�ˡA������n�S�N�Ϥ��D���P�@��O�H�D�n�O�]�����Ӧh�ҥ~�W�h�A���Q�b���a�I���ɻs�y�h�l���P�_���C
--World I �ϰ�ιx�T�y����ܤ��e
function lua_TeltestPort_Slaver()
	local Player = OwnerID()
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Flag = lua_WorldI_TelFlagSet( ZoneID )		--�^�ǰϰ�����X�� �C
	local TelRule = lua_WorldI_TelPointSet( ZoneID )	--�^�Ǥ@�Ӱ}�C�A�����Ӱϰ�i�ǰe���a�I�C
		SetSpeakDetail( Player , GetString("SC_111256_0") )--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --�ǰe�O����H
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S("..ZoneID..")", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
			--�}�Ҷǰe�N
			if CheckFlag( Player,540001 ) == false then
				SetFlag( Player,540001,1 )
			end
			--�}�Ҧ��a�ǰe��
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );
			end
			-- 501638=�M�{�T��
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#TelRule do
					local loc = TelRule[i]
					local tmpFlag = lua_WorldI_TelFlagSet( loc )
						--�C�X�ǰe�ﶵ
						if CheckFlag( Player , tmpFlag ) then
							AddSpeakOption( Player,TargetID(), GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
						end
				end
			end
			--Zone10���ҥ~�����A�S�O�е��C
			if ZoneID==10 and CheckFlag( Player , 540191 ) then
				AddSpeakOption( Player, Player,  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); 		--�ǰe��祱�S��a
			end
end
--World I �D���ιx�T�y����ܤ��e
function lua_TeltestPort_Main()
	local Player = OwnerID()
	local item = 0						--�ΨӰO���C�X�����ضq
	local ZoneID = ReadRoleValue( Player , EM_RoleValue_ZoneID )
	local Flag = lua_WorldI_TelFlagSet( ZoneID )		--�^�ǰϰ�����X�� �C
	local TelRule = lua_WorldI_TelPointSet( ZoneID )	--�^�Ǥ@�Ӱ}�C�A�����Ӱϰ�i�ǰe���a�I�C
		SetSpeakDetail( Player , GetString("SC_111256_0") )--�I��p�l�A�A�Q������ֻ��F�ڡA�i�O�ܨS�@�ߪ��C
		AddSpeakOption( Player, Player, GetString ( "SC_111256_Q") , "LuaS_111256_Q", 0 ); --�ǰe�O����H
		AddSpeakOption( Player, Player, GetString ( "SC_111256_S") , "LuaS_111256_S("..ZoneID..")", 0 ); --�ڭn�N�^�{�N�a�I�n�O��
			--�}�Ҷǰe�N
			if CheckFlag( Player,540001 ) == false then
				SetFlag( Player,540001,1 )
			end
			--�}�Ҧ��a�ǰe��
			if CheckFlag( Player , Flag ) == false then
				SetFlag( Player , Flag , 1)
				ScriptMessage( Player, Player, 1, GetString("SC_111256_OT"), C_SYSTEM );
			end
			-- 501638=�M�{�T��
			if CheckBuff( Player , 501638 ) == false then
				for i=1,#TelRule do
					local loc = TelRule[i]
					local tmpFlag = lua_WorldI_TelFlagSet( loc )
						--�C�X�ǰe�ﶵ
						if CheckFlag( Player , tmpFlag )  then
							AddSpeakOption( Player,TargetID(), GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
							item = item + 1
						end
						--�W�L5���N���U�@��
						if item>=5 then
							break	
						end
				end
				--Zone10���ҥ~�����A�S�O�е��C
				if CheckFlag( Player , 540191 )  then
					AddSpeakOption( Player, Player,  "[SC_111256_10_1]"  , "LuaS_111256_10_1", 0 ); 		--�ǰe��祱�S��a
				end
				if item==5 then
					AddSpeakOption( Player,TargetID(), GetString( "SC_205764_2") ,"lua_TeltestPort_Next("..ZoneID..")",0 ); 	--�ﶵ�G�U�@��
				end
			end
end
--�B�~�ﶵ�A�D���~�αo��
function lua_TeltestPort_Next(ZoneID)
	local Player = OwnerID()
	local TelRule = lua_WorldI_TelPointSet( ZoneID )
		for i=6,#TelRule do
			local loc = TelRule[i]
			local tmpFlag = lua_WorldI_TelFlagSet( loc )
				if CheckFlag( Player , tmpFlag ) == true then
					AddSpeakOption( Player,Player, GetString( "SC_111256_"..loc) ,"LuaS_111256_"..loc,0 ); 
				end
		end
end
