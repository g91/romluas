--function testk_saynewplot()
	--	local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
	--	local GName=GetGuildName(GID)
	--	Say( OwnerID(),GName)
	--	local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	--	local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	--	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--		RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone
	--	end
	--	Say( OwnerID(),"[GUILD_BUILD_8]")
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold))
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) )		---9
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildMemberCount ) )	---1
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv ) )		---5
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) )		---1
		--Say( OwnerID(),GuildInfo( OwnerID() , EM_GuildInfoType_GuildState ) )		---2
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine ))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood))
		--Say( OwnerID(), GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb))
		--Say( OwnerID(),GetGuildName(OwnerID()))

--? runplot  testk_saynewplot
--end


function Lua_Dan_Guild_House_Build()
	if  GuildState( OwnerID() )>1 then
		if  GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) == 9  then
			if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse )==0 then
				if GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv )>=7 then  -----------------------------------real >=7
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_6]"))--�ӽЫإߤ��|����ݭn���|���360000�A�q��15000�B���15000�B�į�15000�A�T�w�n�ӽЫإ߶ܡH
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_BUILD_1]" , " Lua_Dan_Guild_House_Build_1", 0 ) --�ӽЫإߤ��|����
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --�^��W�@��
				else
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_2]"))--���|���Ť���
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --�^��W�@��
				end
			else
				SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_4]"))--�A�w�g�֦����|����
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), "[GUILD_BUILD_3]" )--�D�|���L�k�ӽФ��|����
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " Lua_Dan_Guild_House", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
	end
end

function Lua_Dan_Guild_House_Build_1()
			if GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold) >=360000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine )>=15000 and  GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood)>=15000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb)>=15000 then 
			Beginplot( OwnerID() , "Lua_Dan_Guild_House_Build_2" , 0 )
			else	
			SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_7]"))--���|�귽����
			end
end


function Lua_Dan_Guild_House_Build_2()
local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
local GName=GetGuildName(GID)
if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_NORMAL , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
			while 1 do
				if ( CheckCastBar( OwnerID()  ) > 0) then -- ���\
					result = true
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end

				if ( CheckCastBar( OwnerID()  )< 0 ) then -- ����
					result = false
					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
					break;
				end

			CloseSpeak( OwnerID() )
			sleep( 5 )
			end
		if result == true then 
		AddGuildResource	(OwnerID()  , -360000 , 0 ,-15000, -15000 ,-15000,0 ,0 ,"RetRunplot" )--------------�����ӷ|�귽
		BeginPlot( OwnerID() , "Sys_BuildGuildHouse" , 0 )	---�إߤ��|����
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
		if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
			RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone test ok
		end
		CloseSpeak( OwnerID() )		-- ������ܵ���
		
		end
end
end

function Lua_Dan_Guild_House()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	--AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_1]" , "Lua_Dan_Guild_House_Build" , 0 )	-- �ӽЫإߤ��|����
	AddSpeakOption( OwnerID() , TargetID(), "[SC_GUILDHOUSE_01]" , "Lua_Dan_Guild_House_Enter" , 0 )	-- �ﶵ�A�ڭn�i�J���|��
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_10]" , "Lua_Dan_Guild_BoardOpen" , 0 )	---- �d�\�Ҧ����|��T
end

function Lua_Dan_Guild_BoardOpen()
	BeginPlot( OwnerID() , "Sys_GuildHouseVisit_Open" , 0 )
	CloseSpeak( OwnerID() )
end

function Lua_Dan_Guild_House_EnterTouch()
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then
		BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
	else
	ScriptMessage( OwnerID(), -1 , 1 , "[GUILD_BUILD_5]" , C_SYSTEM )
	end
end



function Lua_Dan_Guild_House_Enter()
	local State = GuildState( OwnerID() )			-- 0 �S�����| 1 �s�p���| 2 �@�뤽�|(�٭n�P�_�O�_�����|���A�H�Τ��|����)
	if ( State >= 2 ) then

		if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse ) >= 1 then   ---���|��
			CloseSpeak( OwnerID() )		-- ������ܵ���
			BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
		else
			SetSpeakDetail( OwnerID(), "[GUILD_BUILD_5]" )
		end
			
	else
		SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )	
	end
end