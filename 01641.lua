function Yuyu_GWar_Leader_00()  --�x�Ϊ�

	local O_ID = OwnerID()
	local PlayerGuildID = GetRoleCampID( O_ID )--���a���}��
	local B_MID = 502971   --�Ŧ�}�� �лx
	local R_MID = 502970   --����}�� �лx

	if PlayerGuildID == 7 then
		AddBuff( O_ID , B_MID , 0 , -1 )		--�Ŧ�}��
	elseif PlayerGuildID == 8 then
		AddBuff( O_ID , R_MID , 0 , -1 )		--����}��
	end
end

function Yuyu_GWar_Leader_01()-- �i���i�����x�Ϊ�������
	-- �����w�x�s��
	-- PID(�}��)�BReg+4(���o���ԥ��W���a��DBID)�BReg+5(�O�_�w���1000�I����q)�BReg+6(���a��GUID)�BReg+7(�O�_�w���o���ԥ��W)�BReg+8(�}��?)
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	SetPlot( OwnerID(),"range", "Yuyu_GWar_Leader_02" , 100 )                                      --�]�w�@��
                while 1 do
		Debuglog(2 , "%%%%CheckING....")
		local GuildID = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID)
		local CampID = GetRoleCampID( OwnerID() )
		Debuglog(2 , "%%%%CheckING....GuildID = "..GuildID.." CampID = "..CampID)
		if GuildID ~= 0 then
			if CampID == 7 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][2] )
				Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			elseif  CampID == 8 then
				AddGuildWarEnergy( OwnerID() , GuildWarSetting[RoomID]["energy"][1] )
				Debuglog(2 , "%%%%GETENERY....GuildID = "..GuildID.." CampID = "..CampID)
			end
		end
--2011.04.19 �ק喙�ԥ��W������D ---------------------------------------------------------------------------------------------
		local Reg
	--	local DBID = ReadRoleValue( TargetID() , EM_RoleValue_DBID )	--2011.06.23 ���t�ӻݨD�A�ק喙�ԥ��W�������
		local PID = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
		--	Say( OwnerID() , "PID ="..PID )
		--	Say( OwnerID() , "DBID ="..DBID )
		for i = 1 , 9 , 1 do
			Reg =  ReadRoleValue( OwnerID() , EM_RoleValue_Register+i )
		--	Say( OwnerID() , "Reg".."+"..i.." = "..Reg )
		end
		Sleep(100)
	end
end

function Yuyu_GWar_Leader_test()

	local GNAME = ReadRoleValue( OwnerID() , EM_RoleValue_GuildID)
	Say(OwnerID() , GNAME)
	local GPlayername = "|cff00ffff"..GetName(GNAME).."|r"

	Say(OwnerID() , GPlayername)

end

function Yuyu_GWar_Leader_02()
--Say(OwnerID(),"OwnerID") --���a
--Say(TargetID(),"TargetID") --����

	local XX = ReadRoleValue( TargetID() , EM_RoleValue_Register+7 )
	local PayKey = ReadRoleValue( TargetID() , EM_RoleValue_Register+5 )	-- 2011.04.19 �ק喙�ԥ��W������D 
	local TellHer =  CheckFlag( OwnerID()  , 543561 )--�O�_�w�i�D���a �����x�Ϊ�����T
	local PlayerGuildID = GetRoleCampID( OwnerID() )
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID  )			--�N�����s���O���bpid
--2011.06.23 ���t�ӻݨD�A�ק喙�ԥ��W������� -------------------------------------------------------------------------------
	local DBID = ReadRoleValue( OwnerID() , EM_RoleValue_DBID )
	local SaveDBID = ReadRoleValue( TargetID() , EM_RoleValue_Register+4 )	-- �O�����o���ԥ��W���a��DBID
----------------------------------------------------------------------------------------------------------------------------------
	local BuildingGuildID = PID+6
	local Now_R =  CountBodyItem( OwnerID() , 206685 ) --�ثe���Z
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local  GuildName = 0
	local PlayerGuild = ReadRoleValue(OwnerID(),EM_RoleValue_GuildID )
	local str
	if ReadRoleValue(TargetID(),EM_RoleValue_GuildID) == 0 then
		WriteRoleValue(TargetID(),EM_RoleValue_GuildID,PlayerGuild)
		Debuglog(2 , "%%%%WriteGUID...."..PlayerGuild)
	end
	if (XX ~= 666) then --�٨S���x�Ϊ�
		if PlayerGuildID == BuildingGuildID then
			if ( Now_R >= 1000 and SaveDBID == 0 ) or ( DBID == SaveDBID ) then	--2011.06.23 ���t�ӻݨD�A�ק喙�ԥ��W�������
				WriteRoleValue( TargetID() , EM_RoleValue_Register+7 , 666 )
--2011.06.23 ���t�ӻݨD�A�ק喙�ԥ��W������� -------------------------------------------------------------------------------
				if SaveDBID == 0 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+4 , DBID )
				end
----------------------------------------------------------------------------------------------------------------------------------
				if PlayerGuildID == 7 then --�Ŧ�}��
					local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
					GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , 0).."|r"
					if PayKey ~= 1 then
						str = "[SC_YU_GUILDWAR_BUILD_54][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					else
						str = "[SC_YU_GUILDWAR_BUILD_89][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					end
					local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
					if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
						RunningMsg( OwnerID() , 3 ,  Str )
					end
				elseif PlayerGuildID == 8 then --����}��
					local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
					GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , 1).."|r"
					if PayKey ~= 1 then
						str = "[SC_YU_GUILDWAR_BUILD_54][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					else
						str = "[SC_YU_GUILDWAR_BUILD_89][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"
					end
					local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
					local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
					if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
						RunningMsg( OwnerID() , 3 ,  Str )
					end
				end
--2011.04.19 �ק喙�ԥ��W������D ---------------------------------------------------------------------------------------------
				if PayKey ~= 1 then
					WriteRoleValue( TargetID() , EM_RoleValue_Register+5 , 1 )
					AddGuildWarEnergy( OwnerID() , 1000 )  --�W���q
				end
				WriteRoleValue( TargetID() , EM_RoleValue_Register+6 , OwnerID() ) -- �N�����a�g�J������ Reg+9 ��
				local NPC = CreateObjByObj( 113105 , TargetID() ) --�b�ؼЮy�� X.Y.Z.Dir ���W�ǳƳХߪ���
				SetModeEx( NPC , EM_SetModeType_Strikback , false )--����
				SetModeEx( NPC , EM_SetModeType_SearchenemyIgnore , false )--�Q�j�M
				SetModeEx( NPC , EM_SetModeType_Obstruct , false )--����
				SetModeEx( NPC , EM_SetModeType_Mark , false )--�аO
				SetModeEx( NPC , EM_SetModeType_Move , false )--����
				SetModeEx( NPC , EM_SetModeType_Searchenemy , false )--����
				SetModeEx( NPC , EM_SetModeType_HideName , false )--�W��
				SetModeEx( NPC , EM_SetModeType_ShowRoleHead , false )--�Y����
				SetModeEx( NPC , EM_SetModeType_Fight , false )--�i�������
				SetModeEx( NPC , EM_SetModeType_Drag , false )--���O
				SetModeEx( NPC , EM_SetModeType_Show , false )--���
				AddToPartition( NPC , RoomID ) -- �إߪ���
				WriteRoleValue( NPC , EM_RoleValue_Register+1 , TargetID() ) -- �N�����g�J���ê��� Reg+1 ��
				BeginPlot( NPC , "Lua_Hao_GWar_ReCall_ID" , 0 )
------------------------------------------------------------------------------------------------------------------------------------
				BeginPlot( OwnerID() , "Yuyu_GWar_Leader_00" , 0 )         --�����x�Ϊ�
			else
				if (TellHer == FALSE) then --�|���i�����a
					ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_YU_GUILDWAR_BUILD_53]", 1 ) 
					ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_53]", 1 ) 
					
					SetFlag( OwnerID()  , 543561 , 1 )
				end
			end
		end
	else
		SetPlot( OwnerID(),"range", "" , 0 )                                      --�]�w�@��
	end

--	BeginPlot( TargetID() , "LuaI_101022_2" , 0 )                                                   --�R�O���w����I�s Script
end

function Yuyu_GWar_Leader_skill_00()  --�K��Ի�
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local buffside = 0 --�j���ۺ���

	if PlayerGuildID == 7 then --�Ŧ�}��
		buffside = 505931

	elseif PlayerGuildID == 8 then --����}��
		buffside = 505929

	end

	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 15)

end

function Yuyu_GWar_Leader_skill_01()  --�L�ȵL��
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local buffside = 0
	local playbuff = 0 --��t�ʽ誺buff

	if PlayerGuildID == 7 then --�Ŧ�}��
		buffside = 505932
		playbuff = 502972
	elseif PlayerGuildID == 8 then --����}��
		buffside = 505925
		playbuff = 502973
	end

	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_KAMEHAMEHA )
	AddBuff( OwnerID() ,playbuff,0, 3); --��tbuff
--	sleep(30)	
	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 15)

end

function Yuyu_GWar_Leader_skill_02()  --�O���g�i
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local buffside = 0

	if PlayerGuildID == 7 then --�Ŧ�}��
		buffside = 505927
	elseif PlayerGuildID == 8 then --����}��
		buffside = 505933
	end

	CallPlot( OwnerID() , "Lua_GUILDWAR_ShareBuff" , buffside , 5)

end

function Yuyu_GWar_Leader_skill_03()  --���Ī��~§  �ˬd
	local OID = OwnerID()
	local TID = TargetID()	
	local OwnerLV = ReadRoleValue( OwnerID() ,EM_RoleValue_LV) 
	local TargetLV = ReadRoleValue( TargetID() ,EM_RoleValue_LV) 

	if ( OwnerLV > TargetLV ) then

		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_30]" , C_SYSTEM )  --�����~�u��ﵥ�Ű���ۤv����H�ϥΡI
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_30]" , C_SYSTEM )  --�����~�u��ﵥ�Ű���ۤv����H�ϥΡI

		return false

	elseif ReadRoleValue(TargetID(),EM_RoleValue_IsPlayer)~=1 then --�ؼЫD���a
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_72]", 0 ) -- �u��缾�a�ϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_72]", 0 ) 
		return false

	else
		return true
	end
end

function Yuyu_GWar_Leader_skill_03_1()  --���Ī��~§

	WriteRoleValue( OwnerID() , EM_RoleValue_Register+4, TargetID() )

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 113105 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	SetModeEx( StageNpc, EM_SetModeType_Show, false )--���
	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
	SetModeEx( StageNpc  , EM_SetModeType_Strikback, false )--����

	AddToPartition( StageNpc , RoomID )  

	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��
	WriteRoleValue( StageNpc , EM_RoleValue_PID, OwnerID() )
	BeginPlot( StageNpc , "Yuyu_GWar_Leader_skill_03_2" , 0 )  
		
end

function Yuyu_GWar_Leader_skill_03_2()  --���Ī��~§
	sleep(5)
--	Say(OwnerID(),"123")
	local O_ID = ReadRoleValue( OwnerID() ,EM_RoleValue_PID) --�I�k��
	local T_ID = ReadRoleValue( O_ID ,EM_RoleValue_Register+4) --�Q�I�k��

	local OwnerLV = ReadRoleValue( O_ID ,EM_RoleValue_LV) 
	local TargetLV = ReadRoleValue( T_ID,EM_RoleValue_LV) 

	local SkillLV = 0

	SkillLV = (TargetLV - OwnerLV)-1

--	AddBuff( TargetID() ,505776,SkillLV, 5); 

	CastSpelllv( O_ID , T_ID , 495101 , SkillLV )
	sleep(5)
	Delobj(OwnerID())
end


function Yuyu_GWar_Leader_skill_04()  --�a�A���x
	local OID = OwnerID()
	local TID = TargetID()	

	local R_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114335, 150 , 1)--���� ��q����
	local B_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114336, 150 , 1)--�Ŧ� ��q����
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��
	local GuildName = 0
	-- 2013.08.09 ���ԥ��W�I��a�A���x�l�ꪺ�u���|�a�A�u�@�̡v���šA�{�b�N�P���a���⪺���ŤW���P�B�C
	local ServerMaxLv = GetIniValueSetting("MaxRoleLevel")	-- Ū�����A���]�w�����ŤW��
	--
	if ( CheckID(R_BASE[0]) == true ) or ( CheckID(B_BASE[0]) == true ) or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then
		local StageNpc = 0

		if PlayerGuildID == 7 or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then--�Ŧ�}��
		--	StageNpc = CreateObj( 103142 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )		
			-- 2013.08.09 ���ԥ��W�I��a�A���x�l�ꪺ�u���|�a�A�u�@�̡v���šA�{�b�N�P���a���⪺���ŤW���P�B�C
			-- 2013.08.09 �ק�u���|�a�A�u�@�̡v���l�v�Z���A�� 600 �Y�u�ܡA�קK�u���|�a�A�u�@�̡v����������������Ϋ������ؿv�����D�C
			local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- Ū����Ʈw�����w����]�w���l�v�Z��
		--	Say( OwnerID() , "FollowRange = "..FollowRange )
		--	if FollowRange ~= 250 then
		--		WriteGameObjInfo_Double( 103142 , "FollowRange" , 250 )
		--		local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- Ū����Ʈw�����w����]�w���l�v�Z��
			--	Say( OwnerID() , "SetFollowRange : "..FollowRange )
		--	end
			StageNpc = CreateObj( 103142 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		--	CallPlot( StageNpc , "Hao_GuildWar_Calculating_Distance" , StageNpc , OwnerX , OwnerY , OwnerZ , OwnerDIR )			
			--
			AddToPartition( StageNpc , RoomID )  
			SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

			local Playername = "|cff00ffff"..GetName( OwnerID() ).."|r"
			GuildName =  "|cff00ffff"..GetGuildName_ByID( RoomID , 0).."|r"
			local str = "[SC_YU_GUILDWAR_BUILD_71][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"--���\�l��F�a�A�u�@��
			ScriptMessage(OwnerID(), OwnerID() , 1 , Str , C_SYSTEM )  
			ScriptMessage(OwnerID(), OwnerID() , 0 , Str , C_SYSTEM )  

			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
			local sloco = "[SC_YU_GUILDWAR_BUILD_74][$SETVAR1="..GuildName.."]" --�@�_�ľԧa
			Say(StageNpc,sloco)
			sleep(5)
			PlayMotion( StageNpc , 101) 
			sleep(10)
			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, true )--����
		elseif PlayerGuildID == 8 or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then--����}��
		--	StageNpc = CreateObj( 103141 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )
			-- 2013.08.09 ���ԥ��W�I��a�A���x�l�ꪺ�u���|�a�A�u�@�̡v���šA�{�b�N�P���a���⪺���ŤW���P�B�C
			-- 2013.08.09 �ק�u���|�a�A�u�@�̡v���l�v�Z���A�� 600 �Y�u�� �A�קK�u���|�a�A�u�@�̡v����������������Ϋ������ؿv�����D�C
		--	local FollowRange = GameObjInfo_Int( 103141 ,"FollowRange" ) -- Ū����Ʈw�����w����]�w���l�v�Z��
		--	Say( OwnerID() , "FollowRange = "..FollowRange )
		--	if FollowRange ~= 250 then
		--		WriteGameObjInfo_Double( 103142 , "FollowRange" , 250 )
		--		local FollowRange = GameObjInfo_Int( 103142 ,"FollowRange" ) -- Ū����Ʈw�����w����]�w���l�v�Z��
			--	Say( OwnerID() , "SetFollowRange : "..FollowRange )
		--	end
			StageNpc = CreateObj( 103141 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1 )			
			WriteRoleValue( StageNpc , EM_RoleValue_LV , ServerMaxLv )--���ŷ|�H���A�����Ŷ}�񪺤W���Ӧ���
		--	CallPlot( StageNpc , "Hao_GuildWar_Calculating_Distance" , StageNpc , OwnerX , OwnerY , OwnerZ , OwnerDIR )
			--
			AddToPartition( StageNpc , RoomID ) 
 			SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

			local Playername = "|cffff3232"..GetName( OwnerID() ).."|r"
			GuildName =  "|cffff3232"..GetGuildName_ByID( RoomID , 1).."|r"
			local str = "[SC_YU_GUILDWAR_BUILD_71][$SETVAR1="..GuildName.."][$SETVAR2="..Playername.."]"--���\�l��F�a�A�u�@��
			ScriptMessage(OwnerID(), OwnerID() , 1 , Str , C_SYSTEM )  
			ScriptMessage(OwnerID(), OwnerID() , 0 , Str , C_SYSTEM )  

			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, false )--����
			local sloco = "[SC_YU_GUILDWAR_BUILD_74][$SETVAR1="..GuildName.."]" --�@�_�ľԧa
			Say(StageNpc,sloco)
			sleep(5)
			PlayMotion( StageNpc , 101) 
			sleep(10)
			SetModeEx( StageNpc  , EM_SetModeType_Searchenemy, true )--����
		end

		AddBuff( StageNpc , 505921 , 29, -1 )	--30%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( StageNpc , 505923 , 989, -1 )	--990%	--����NPC�ˮ`�W�[ �k�N���� 0 = 1%	
		AddBuff( StageNpc , 505517 , 98, -1 )	--99%	--�QNPC�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( StageNpc ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		BeginPlot( StageNpc , "Yuyu_GWar_Leader_skill_04_01" , 0 )  

	else
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  --�����b��q��������~��i��l��
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  

	end


end
-- 2013.08.09 �ק�u���|�a�A�u�@�̡v���l�v�Z���A�� 600 �Y�u�� 350�A�קK�u���|�a�A�u�@�̡v����������������Ϋ������ؿv�����D�C
function Hao_GuildWar_Calculating_Distance(Obj,X,Y,Z,Dir)	-- ���I�D�Z��

	local Pos = {}
	local Distance
	
	while true do
		Pos["X"] , Pos["Y"] , Pos["Z"] , Pos["Dir"]  = Lua_Hao_Return_Coordinate(Obj) -- ���oObj�Ҧb�y��
		Distance = DW_XYZCheckDis(X,Y,Z,Pos["X"],Pos["Y"],Pos["Z"])	-- ���I�D�Z��
		if Distance > 450 then
			SetStopAttack( Obj )
			SetPos( Obj , X , Y , Z , Dir )
		end
		Sleep(10)
	end
end
--
function Yuyu_GWar_Leader_skill_04_01()  --�a�A���x
	sleep(6000)
	SetStopAttack( OwnerID() )

	SetModeEx( OwnerID()  , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( OwnerID() , EM_SetModeType_Move, false )--����
	PlayMotion( OwnerID(), 101) 
	sleep(30)
	Say(OwnerID(),"[SC_YU_GUILDWAR_BUILD_75]")--�گ൹�����䴩�N��o��...�٦�̡A�@�a�A�P�A�̦P�b�C
	PlayMotion( OwnerID(), 125) 
	sleep(50)
	Delobj(OwnerID())
end

function Yuyu_GWar_Leader_skill_04_02()  --�a�A���x  �ˬd
	local OID = OwnerID()
	local TID = TargetID()	
	local R_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114335, 150 , 1)--���� ��q����
	local B_BASE = LuaFunc_SearchNPCbyOrgID( OID , 114336, 150 , 1)--�Ŧ� ��q����

	if ( CheckID(R_BASE[0]) == true ) or ( CheckID(B_BASE[0]) == true ) or ReadRoleValue( OID , EM_RoleValue_VOC ) == 0 then
		return true
	else
		ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  --�����b��q��������~��i��l��
		ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_YU_GUILDWAR_BUILD_73]" , 0 )  
		return false
	end
end

--====================================================================================================================

function Yuyu_GW_BigSkill_0_000( ) --�i�j���ۡj�c�V���b�B����

	local OID = OwnerID()
	local TID = TargetID()	

	SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TargetID() )--���a���}��

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--���a¾�~
	local P_Str = ReadRoleValue( TID , EM_RoleValue_FinStr ) 
	local P_Int = ReadRoleValue( TID , EM_RoleValue_FinInt ) 
	local P_Agi = ReadRoleValue( TID , EM_RoleValue_FinAgi ) --���a��e�ӱ�

--Say(OwnerID(),"OwnerID")--��������
--Say(TargetID(),"TargetID")--���a

	local StageNpc = CreateObj( 103136 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	AddToPartition( StageNpc , RoomID )  

	local N_Agi = ReadRoleValue( StageNpc , EM_RoleValue_FinAgi ) --�Ƿ�e�ӱ�

	if VOC == 2 then --�C�L
		P_Agi = (P_Agi*1)+N_Agi
	elseif VOC == 3 then --�v���
		P_Agi = (P_Agi*0.7)+N_Agi
	else
		P_Agi = (P_Agi*0.3)+N_Agi
	end

	WriteRoleValue( StageNpc , EM_RoleValue_AGI , P_Agi ) --�g�J�W��
--Say(StageNpc , "StageNpc")--�s����
	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
	SetModeEx( StageNpc , EM_SetModeType_Searchenemy, false )--����
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��

	CastSpelllv( StageNpc , StageNpc , 492695 , 0 )
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_00" , 0 )  
	BeginPlot( StageNpc , "Yuyu_GW_BigSkill_0_03" , 0 )  
end

function Yuyu_GW_BigSkill_0_00( ) --�i�j���ۡj�c�V���b�B ���[�\�� �c���v�h

--Say(OwnerID(),"OwnerID")--�s����
--Say(TargetID(),"TargetID")--�s����
	sleep(10)
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

--	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)
	local Npc_1 = Lua_Davis_BornByMultilateral( 103136 , 3 , 20 ) --(����ID,�ͥX�X��,�b�|)

	for j=1 , table.getn(Npc_1) do	

		SetModeEx( Npc_1[j] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Npc_1[j] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Npc_1[j] , EM_SetModeType_Move, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Npc_1[j] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Npc_1[j] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Npc_1[j] , EM_SetModeType_DisableRotate, false )--��V
		SetModeEx( Npc_1[j]  , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		SetRoleCampID( Npc_1[j], PlayerGuildID )--�g�J�}��
		CastSpelllv( Npc_1[j] , Npc_1[j] , 492694 , 0 )
		BeginPlot( Npc_1[j] , "Yuyu_GW_BigSkill_0_01" , 0 )  
		AddBuff( Npc_1[j] , 506161 , 0 , -1 )	--�����S��

	end
	sleep(50)

	local Npc_2 = Lua_Davis_BornByMultilateral( 103136 , 9 , 60 ) --(����ID,�ͥX�X��,�b�|)

	for j=1 , table.getn(Npc_2) do	

		SetModeEx( Npc_2[j] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Npc_2[j] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Npc_2[j] , EM_SetModeType_Move, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Npc_2[j] , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Npc_2[j] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Npc_2[j] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Npc_2[j] , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( Npc_2[j]  , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		SetRoleCampID( Npc_2[j], PlayerGuildID )--�g�J�}��
		CastSpelllv( Npc_2[j] , Npc_2[j] , 492694 , 0 )
		BeginPlot( Npc_2[j] , "Yuyu_GW_BigSkill_0_01_2" , 0 )  
		AddBuff( Npc_2[j] , 506161 , 0 , -1 )	--�����S��
	end

end

function Yuyu_GW_BigSkill_0_01( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�
	sleep(200)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_BigSkill_0_01_2( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�
	sleep(150)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

function Yuyu_GW_BigSkill_0_02( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�

	DelObj( OwnerID() )
end

function Yuyu_GW_BigSkill_0_03( ) --�i�j���ۡj�c���v�h �ͦs�ɶ�
	sleep(300)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_0_02" , 0 )  
end

--====================================================================================================================

function Yuyu_GW_BigSkill_1_00( ) --�i�j���ۡj�k�۬y�P�B

	local OID = OwnerID()
	local TID = TargetID()	

	SetModeEx( OID , EM_SetModeType_Show , false )--���
	SetModeEx( OID , EM_SetModeType_Fight , false )--�i�������

	local RoomID = ReadRoleValue( OID ,EM_RoleValue_RoomID) 
	local OwnerX = ReadRoleValue( OID , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OID , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OID , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OID , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( TID )--���a���}��

	local VOC = ReadRoleValue( TID , EM_RoleValue_VOC )--���a¾�~
	local O_Int = ReadRoleValue( OID , EM_RoleValue_FinStr ) --�����̷�e���O
	local P_Int = ReadRoleValue( TID , EM_RoleValue_FinInt ) --���a��e�����O

	local N_Int = 0

	if VOC == 4 then --�k�v
		P_Int = (P_Int*1)+O_Int
	elseif (VOC == 5) or (VOC == 8) then --���q or �۵M���x
		P_Int = (P_Int*0.7)+O_Int
	else
		P_Int = (P_Int*0.3)+O_Int
	end
	WriteRoleValue( OID , EM_RoleValue_INT, P_Int ) --�g�J�W��
	CastSpelllv( OID , OID , 492693 , 0 )	
--	WriteRoleValue( O_Int, EM_RoleValue_INT, P_Int ) --�g�J�W��
--	CastSpelllv( O_Int , O_Int , 492693 , 0 )
	sleep(25)

--Say(OwnerID(),"OwnerID")--��������
--Say(TargetID(),"TargetID")--���a
--Say(StageNpc , "StageNpc")--�s����
	local Npc_1 = Lua_Davis_BornByMultilateral( 103135 , 3 , 50 ) --(����ID,�ͥX�X��,�b�|)

	for j=1 , table.getn(Npc_1) do
		SetModeEx( Npc_1[j]  , EM_SetModeType_NotShowHPMP, true )--����ܦ��
		SetModeEx( Npc_1[j] , EM_SetModeType_Strikback, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( Npc_1[j] , EM_SetModeType_Obstruct, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_Mark, false )--�аO
		SetModeEx( Npc_1[j] , EM_SetModeType_Move, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( Npc_1[j] , EM_SetModeType_HideName, true )--�W��
		SetModeEx( Npc_1[j] , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( Npc_1[j] , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( Npc_1[j] , EM_SetModeType_DisableRotate, true )--��V
		SetRoleCampID( Npc_1[j], PlayerGuildID )--�g�J�}��

		N_Int = ReadRoleValue( Npc_1[j]  , EM_RoleValue_FinInt ) --�Ƿ�e���O

		if VOC == 4 then --�k�v
			P_Int = (P_Int*1)+N_Int
		elseif (VOC == 5) or (VOC == 8) then --���q or �۵M���x
			P_Int = (P_Int*0.7)+N_Int
		else
			P_Int = (P_Int*0.3)+N_Int
		end	
		WriteRoleValue( Npc_1[j] , EM_RoleValue_INT, P_Int ) --�g�J�W��
	end

	for j=1 , table.getn(Npc_1) do
		CastSpelllv( Npc_1[j] , Npc_1[j] , 492693 , 0 )
		sleep(25)
		BeginPlot( Npc_1[j] , "Yuyu_GW_BigSkill_1_03" , 0 )  --�i�j���ۡj�k�۬y�P�B �ͦs�ɶ�
	end

end

function Yuyu_GW_BigSkill_1_01( ) --�i�j���ۡj�k�۬y�P�B 

	local P = 10
	local PP = Rand( P )      

	local OID = OwnerID()
	while true do
--		AddBuff( OID , 502585 , 0 , -1 )
		CastSpelllv( OID , OID , 492693 , 0 )
		sleep(60)
	end

end

function Yuyu_GW_BigSkill_1_02( ) --�i�j���ۡj�k�۬y�P�B �ͦs�ɶ�
	sleep(200)
	BeginPlot( OwnerID() , "Yuyu_GW_BigSkill_1_03" , 0 )  
end

function Yuyu_GW_BigSkill_1_03( ) --�i�j���ۡj�k�۬y�P�B �ͦs�ɶ�

	DelObj( OwnerID() )
end


--====================================================================================================================


function Yuyu_GWB_Skill_tro_01() --�s����

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	local PassCard =  CountBodyItem( OwnerID() , 206769 ) --�O�_�㦳�q���� = GM����

	if (ZoneID == 402) or (ZoneID == 31) or (PassCard > 0) then

		BeginPlot( OwnerID()  , "Yuyu_GWB_Skill_tro_02_0" , 0 )  

	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_DAN_111700_37]", C_SYSTEM ) --�A�L�k�b���ϰ�ϥθӪ��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_DAN_111700_37]", C_SYSTEM ) 

	end



end

function Yuyu_GWB_Skill_tro_02_0() --�i�����k�N�j�s����

		BeginPlot( OwnerID()  , "Yuyu_GWB_Skill_tro_02_1" , 0 )  

end

function Yuyu_GWB_Skill_tro_02_1() --�i�����k�N�j�s����

		if BeginCastBar( OwnerID(), "[502978]", 20 , ruFUSION_ACTORSTATE_EMOTE_HANDSTAND , ruFUSION_ACTORSTATE_REVIVING , 0 ) == 1 then

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
				BeginPlot( OwnerID() , "Yuyu_GWB_Skill_tro_02_2" , 0 )  				
			end
		end
end

function Yuyu_GWB_Skill_tro_02_2() --�i�����k�N�j�s����
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OwnerX = ReadRoleValue( OwnerID() , EM_RoleValue_X ) 
	local OwnerY = ReadRoleValue( OwnerID() , EM_RoleValue_Y ) 
	local OwnerZ = ReadRoleValue( OwnerID() , EM_RoleValue_Z ) 
	local OwnerDIR = ReadRoleValue( OwnerID() , EM_RoleValue_Dir ) 
	local PlayerGuildID = GetRoleCampID( OwnerID() )--���a���}��

	local StageNpc = CreateObj( 113693 , OwnerX , OwnerY , OwnerZ , OwnerDIR , 1)

	SetModeEx( StageNpc, EM_SetModeType_Show, false )--���

	AddToPartition( StageNpc , RoomID )  
	MoveToflagEnabled( StageNpc , false )
	SetRoleCampID( StageNpc, PlayerGuildID )--�g�J�}��

	SetModeEx( StageNpc   , EM_SetModeType_Mark, false )--�аO
	SetModeEx( StageNpc  , EM_SetModeType_HideName, true )--�W��
	SetModeEx( StageNpc , EM_SetModeType_ShowRoleHead, false )--�Y����
	SetModeEx( StageNpc , EM_SetModeType_Fight , false )--�i�������
	SetModeEx( StageNpc  , EM_SetModeType_Move, true )--����
	SetModeEx( StageNpc , EM_SetModeType_Obstruct, false )--����
	SetModeEx( StageNpc , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	SetModeEx( StageNpc, EM_SetModeType_Show, true )--���	


	BeginPlot( StageNpc , "Yuyu_GWB_Skill_tro_03" , 0 )  
end

function Yuyu_GWB_Skill_tro_03() 

	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID) 

	local OID = OwnerID()
	local stime = 10

--	sleep(20)
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_06" , 0 ) 
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_04" , 0 ) 
	sleep(250)
	BeginPlot( OID , "Yuyu_GWB_Skill_tro_05" , 0 )  --�R������ 

end


function Yuyu_GWB_Skill_tro_04()  --�I���s���� 

	local P = 10
	local PP = Rand( P )      

	local OID = OwnerID()
	while true do
--		AddBuff( OID , 502585 , 0 , -1 )
		CastSpelllv( OID , OID , 494828 , 0 )
		sleep(1)
	end

end

function Yuyu_GWB_Skill_tro_05()  --�R������ 
	DelObj(OwnerID())
end

function Yuyu_GWB_Skill_tro_06()  --���ʸ��u
	local ID = OwnerID()
	local stime = 10

	local OldX = ReadRoleValue(  ID , EM_RoleValue_X )
	local OldY = ReadRoleValue(  ID , EM_RoleValue_Y )
	local OldZ = ReadRoleValue(  ID , EM_RoleValue_Z )
	local OldDir = ReadRoleValue(  ID , EM_RoleValue_Dir )
	local RoomID = ReadRoleValue( ID , EM_RoleValue_RoomID)
	local Cal = (math.pi/180)*(OldDir) 
	--Say(OwnerID(),"OldDir="..OldDir.." cal="..Cal.." cos="..math.cos(Cal).." sin="..math.sin(Cal))
	local dis = 300
	MoveDirect( ID, OldX+ dis*math.cos(Cal),OldY+5 ,OldZ -dis*math.sin(Cal) )

--	local Dis = 250	
--	Lua_MoveLine( ID , Dis ) --�ѦҪ���A�V�e���ʨ�Dis�Z������m (Dis �� �t�� �� �V�Ჾ��)

end


function Yuyu_GW_witchgood_delitem_05()  --�ϥΫ�R�����~ 
	DelBodyItem( OwnerID() , 206685 , 1 )
end
--2011.04.19 �ק喙�ԥ��W������D ---------------------------------------------------------------------------------------------
function Lua_Hao_GWar_ReCall_ID()

	local Crystal = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )	-- Ū������

	while true do
		local Leader = ReadRoleValue( Crystal , EM_RoleValue_Register+6 )	-- Ū�����a
	--	Say( OwnerID() , "Leader = "..Leader )
		if CheckID( Leader ) == false then
		--	DebugMsg( 0 , 0 , "Miss Zone Leader" )
		--	Say( OwnerID() , "Miss Zone Leader" )
			WriteRoleValue( Crystal , EM_RoleValue_Register+6 , 0 )
			WriteRoleValue( Crystal , EM_RoleValue_Register+7 , 0 )
			Delobj( OwnerID() )
			break
		else
		--	DebugMsg( 0 , 0 , "Get Zone Leader" )
		--	Say( OwnerID() , "Get Zone Leader" )
		end
		Sleep(10)
	end
end
------------------------------------------------------------------------------------------------------------------------------------
--2013.06.11 �s���l��N�G�c�K���b�B���P�_ --------------------------------------------------------------------------------
function YOYO_GWar_Volley()
	local Target = TargetID()
	if ReadRoleValue( Target , EM_RoleValue_IsPlayer ) == 1 then
		return true
	else
		return false	
	end
end
------------------------------------------------------------------------------------------------------------------------------------