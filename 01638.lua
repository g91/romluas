function Yuyu_GWB_Callout01() --�]�V��س]
--	Say( OwnerID() ,"OwnerID" ) --�s����
--	Say( TargetID() ,"TargetID") --�s����

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 102485 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local ServerMaxLv = ReadRoleValue( OwnerID() , EM_RoleValue_MaxLv )	-- ���A���}�񪱮a���ŤW��
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--
	AddToPartition( StageNpc , RoomID ) 

	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 84, -1 )	--85%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout01_Buff() --�]�V��Buff����
	CancelBuff( OwnerID() , 505424  ) 
end

function Yuyu_GWB_Callout02() --�q���س]

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 102486 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 84, -1 )	--85%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout02_Buff() --�q���Buff����
	CancelBuff( OwnerID() , 505425  ) 
end

function Yuyu_GWB_Callout03() --�t����س]

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 102484 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  
	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout03_Buff() --�t����Buff����
	CancelBuff( OwnerID() , 505426  ) 
end

function Yuyu_GWB_Callout04() --�a�A���߫س]

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 102483 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout04_Buff() --�a�A����Buff����
	CancelBuff( OwnerID() , 505427  ) 
end

function Yuyu_GWB_Callout05() --�V���س]

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
--	Say(OwnerID(),"PlayerGuildID = "..PlayerGuildID)
	local StageNpc = CreateObj( 102481 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  
--	Say(OwnerID(),"OwnerID")
--	Say(TargetID(),"TargetID")
	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��
	local PlayerGuild
	local NearPlayer = SearchRangePlayer(StageNpc,200)	--�j�M�P�򪱮a
--	Say(OwnerID(),"NearPlayerCount = "..table.getn(NearPlayer))
	for i = 0 , table.getn(NearPlayer)-1 do
--		Say(NearPlayer[i],"NearPlayerCount = "..table.getn(NearPlayer))
		if PlayerGuildID == GetRoleCampID( NearPlayer[i] ) then
			PlayerGuild = ReadRoleValue(NearPlayer[i],EM_RoleValue_GuildID)
			break
		end
	end
--	DebugMsg( 0, RoomID ,"PlayerGuild = "..PlayerGuild.." StageNpcGuild = "..ReadRoleValue(StageNpc,EM_RoleValue_GuildID))
	if ReadRoleValue(StageNpc,EM_RoleValue_GuildID) == 0 then
		WriteRoleValue(StageNpc,EM_RoleValue_GuildID,PlayerGuild)
--		DebugMsg( 0, RoomID ,"StageNpcGuild = "..ReadRoleValue(StageNpc,EM_RoleValue_GuildID))
	end
	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout05_Buff() --�V���Buff����
	CancelBuff( OwnerID() , 505428  ) 
end

function Yuyu_GWB_Callout06() --��ı����س]

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 102482 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	
	local Player = ReadRoleValue( OwnerID() , EM_RoleValue_Register+7 )	-- ���s�����O�_�ϥΪ��a
	Hao_GuildWar_Set_Lv( Player , StageNpc )
	--	
	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetPlot( StageNpc  , "dead","Yuyu_GWB_Tower_dead",0 )                              --���`�@��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, true )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, true )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , true )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����

	AddBuff( StageNpc , 505921 , 79, -1 )	--80%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
	AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
	WriteRoleValue( StageNpc  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
---*---�H�U�P�_���a�O�_���ǲߨ��m�u�{�����
	local SetA = -1		
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID ) -- �򥻪k�NID
		if BuffID == 505314 then--���m�u�{
			local BuffLv = BuffInfo ( OwnerID() , i , EM_BuffInfoType_Power )--�ӫؿv�� j ��BUFF������
			SetA = BuffLv
		end
	end

	if SetA>-1 then
		AddBuff( StageNpc , 505511 , SetA , -1 )--���m�u�{
	end

end

function Yuyu_GWB_Callout06_Buff() --��ı����Buff����
	CancelBuff( OwnerID() , 505429  ) 
end


function Yuyu_GWB_Callout_skill_01() --�ؿv���k�N�G���z����

--Say(OwnerID(),"OwnerID")
--Say(TargetID(),"TargetID")

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����
	local RoomID = ReadRoleValue( TargetID(), EM_RoleValue_RoomID )
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local BuildingGuildID = GetRoleCampID( TargetID() )--�ؼа}��
	local judge = 0 --�P�_�O�_�OGM �� �P���| ...��
	local BuildingOrgID_1 = {102366,102367,102370,102481,102482,102483,102484,102485,102486} --�i���z���ϡj �Ҧ��ؿv��OrgID---------------------------------------------/*�ܼơ�
	local TargetOrgID = ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) --�ثe�ؿv����OrgID
	local judge_2 = 0 --�P�_�O�_�O���i�@�Τ��ؿv��	
	
--	if ( Option == "CHECK" ) then

--�P�_0�@�O�_���i�@�ΰϰ�
		if (ZoneID == 402) or (ZoneID == 31)  then

--�P�_1�@�O�_���P�}��
			if (PassCard > 0) then
				judge = 1

			elseif PlayerGuildID ~= BuildingGuildID then

				judge = 1

			else
				ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_19]", 0 ) --�L�k���ϦP�}�礧�ؿv��
				ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_19]", 0 ) 
				judge = 0
			end

--�P�_2�@�O�_���i���z���ؿv��
			for i= 1 , 9 do

--Say(OwnerID(),TargetOrgID)
--Say(TargetID(),BuildingOrgID_1[i])

				if TargetOrgID == BuildingOrgID_1[i] then
					judge_2 = 1
					break
				else
					judge_2 = 0 		
				end
			end

			if judge_2 == 0 then
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_20]", 0 ) --�L�k���z�ӥؼСI
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_20]", 0 )
			end

--�P�_3�@�O�_�����m���ؿv��
			if (judge == 1) and (judge_2 == 1) then

				if ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 555 then--���Q���z��
					ScriptMessage( TargetID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_21]", 0 ) --�ؼХ��Q���z���I
					ScriptMessage( TargetID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_21]", 0 )
					return false
				else
					WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  555  ) --���O���z��
					BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_02" , 0 )

					local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"
					local str = "[SC_YU_GUILDWAR_BUILD_25][$SETVAR1="..TargetIDName.."]"

					ScriptMessage( TargetID() , 0 , 1 , str, 0 ) --ĵ�i�IXXX���Q���Ϥ��I
					ScriptMessage( TargetID() , 0 , 0 , str, 0 ) 

					return true
				end
			end
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 
				return false
		end

---	elseif ( Option == "USE" ) then
--		BeginPlot( OwnerID()  , "Yuyu_GWB_Callout_skill_02" , 0 )  
--	end

end

function Yuyu_GWB_Callout_skill_02() -- �ؿv���k�N�G���z����

	BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_03" , 0 )  

end

function Yuyu_GWB_Callout_skill_03() -- �ؿv���k�N�G���z����
		local BookMagicID = 505308		--/*����motion
		local ChangeMagicID = 504340		--/*�ؼгQ���z��
		local Count =  ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) + 1
		local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

--Say(OwnerID(),"OwnerID=2")
--Say(TargetID(),"TargetID=2")

		if BeginCastBar( OwnerID(), "[SC_YU_GUILDWAR_BUILD_22]"..Count.."/5", 25 , ruFUSION_ACTORSTATE_EMOTE_PLAY_SAXOPHONE , ruFUSION_ACTORSTATE_EMOTE_VICTORY , 0 ) == 1 then
		
			AddBuff( OwnerID() , BookMagicID , 0 , -1 )		--�ϥή�
			AddBuff( TargetID() , ChangeMagicID , 0 , -1 )		--���Ӥ�


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
				elseif (CheckID( TargetID() ) == false) then
					result = "DAME"
					EndCastBar( OwnerID() , CastBarStatus )
					break;
				end
			end

			if ( result == "OKOK" ) then
				if CheckID( TargetID() ) == true then
					if ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) == 4 then--��ܤw��Ū4�M
						local TargetIDName = "|cffffff20"..GetName( TargetID() ).."|r"

						WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --�M����Ū����


						local str = "[SC_YU_GUILDWAR_BUILD_23][$SETVAR1="..TargetIDName.."]"

						ScriptMessage( OwnerID() , OwnerID() , 1 , str, 0 ) --���Ϧ��\�IXXX�w�k�Ƭ��ڤ�}��I
						ScriptMessage( OwnerID() , OwnerID() , 0 , str, 0 ) 
						SetRoleCampID( TargetID() , PlayerGuildID )--�g�J�}��

						local B_MID = 505789   --�Ŧ�}�� �лx
						local R_MID = 505790   --����}�� �лx
						if PlayerGuildID == 7 then
							CancelBuff( OwnerID() , R_MID )
							AddBuff( TargetID() , B_MID , 0 , -1 )		--�Ŧ�}��
						elseif PlayerGuildID == 8 then
							CancelBuff( OwnerID() , B_MID )
							AddBuff( TargetID() , R_MID , 0 , -1 )		--����}��
						end

						CancelBuff( OwnerID() , BookMagicID )
						CancelBuff( TargetID() , ChangeMagicID )
						WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  0  ) --���O�D�P�Ƥ�
						BeginPlot( OwnerID()  , "Yuyu_GW_witchgood_delitem_04" , 0 )  --�R�����~�G���Ϩ��y

					else
						AddRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  1  ) --�W�[��Ū����
						BeginPlot( TargetID()  , "Yuyu_GWB_Callout_skill_02" , 0 )  
					end
				end

			elseif ( result == "DAME" ) then	
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_24]", 0 ) --���Ϥu�@�w���_�I
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_24]", 0 ) 

				WriteRoleValue( OwnerID()  , EM_RoleValue_Register+3 ,  0  ) --�M����Ū����
				CancelBuff( OwnerID() , BookMagicID )
				CancelBuff( TargetID() , ChangeMagicID )
				WriteRoleValue( TargetID()  , EM_RoleValue_Register+2 ,  0  ) --���O�D�P�Ƥ�

	
			end
		end
end


function Yuyu_GWB_Tower_dead()  --�������`�@��

	-- 2013.08.14 ���E�G�ץ�Npc������������ɡA�|�]�����`�@���Q return false �����l�v�Z�����W�L��Ʈw���]�w�Ȫ����D�C
	DelObj( OwnerID() )
	--
--	SetStopAttack( OwnerID() )
--	SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--�аO
--	SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
--	SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--�Y����
--	SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
--	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--����
--	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
--	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
--	BeginPlot( OwnerID() , "Yuyu_GWB_Tower_dead01" , 0 )
--	return false
end

--function Yuyu_GWB_Tower_dead01()  --�������`�@��
--
--	AddBuff( OwnerID() , 503605 , 0 , -1 )		--�_���U�N
----	sleep(20)
--	AddBuff( OwnerID() , 506150 , 0 , -1 )		--�~��_��
----	sleep(5)
--	DelObj(OwnerID())
--end

function Hao_GuildWar_Set_Lv( Player , ObjID )	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	

	local ServerMaxLv = ReadRoleValue( Player , EM_RoleValue_MaxLv )	-- ���A���}�񪱮a���ŤW��
	WriteRoleValue( ObjID , EM_RoleValue_LV , ServerMaxLv )
	WriteRoleValue( ObjID , EM_RoleValue_Register+7 , 0 )	
end

function Hao_GuildWar_Tower()	-- 2013.01.11 �վ�l��a�A�ؿv�ɡA�ؿv���ŷ|�H���a���ⵥ�Ŷ}�񪺤W���Ӧ����C	

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+7 , TargetID() )	-- �N�ϥΪ��~�����a�g�J���s������ Reg+7 ��
	--�s�����w�ϥέ�
	--EM_RoleValue_Register
	--EM_RoleValue_PID
	--EM_RoleValue_Register+8
	--EM_RoleValue_Register+9
end