function testk_saynewplot()
		local GID=ReadRoleValue(  OwnerID() , EM_RoleValue_GuildID) 
		local GName=GetGuildName(GID)
		Say( OwnerID(),GName)
		local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
		local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --�|Ū��u�ꪺ���y�ϰ�
	--	if ZoneID == RealZoneID then --�W�[�קK�h���y���мs�����P�_
	--		RunningMsg( OwnerID(),2,"|cffffffff"..GName.."|r".."[GUILD_BUILD_8]" ) ---0 1 2---zone
	--	end
		Say( OwnerID(),"[GUILD_BUILD_8]")

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
end


function LuaS_Guild_House_Build()
	if  GuildState( OwnerID() )>1 then
		if  GuildInfo( OwnerID() , EM_GuildInfoType_Rank ) == 9  then --�P�_�O�_�����|�|��
			if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse )==0 then --�P�_���S�����|����
				if GuildInfo( OwnerID() , EM_GuildInfoType_GuildLv )>=5 then  -----------------------------------real >=5 �P�_���|���ŬO�_�w�g��F5��
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_6]"))--�ӽЫإߤ��|����ݭn���|���360000�A�q��15000�B���15000�B�į�15000�A�T�w�n�ӽЫإ߶ܡH
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_BUILD_1]" , " LuaS_Guild_House_Build_1", 0 ) --�ӽЫإߤ��|����
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --�^��W�@��
				else
					SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_2]"))--���|���Ť���
					AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --�^��W�@��
				end
			else
				SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_4]"))--�A�w�g�֦����|����
				AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --�^��W�@��
			end
		else
		SetSpeakDetail( OwnerID(), "[GUILD_BUILD_3]" )--�D�|���L�k�ӽФ��|����
		AddSpeakOption( OwnerID(), TargetID( ), "[SO_BACK]" , " LuaS_Guild_House", 0 ) --�^��W�@��
		end
	else
	SetSpeakDetail( OwnerID(), "[MSG_GUILD_02]" )
	end
end

function LuaS_Guild_House_Build_1()
			if GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Gold) >=360000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Mine )>=15000 and  GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Wood)>=15000 and GuildInfo( OwnerID() , EM_GuildInfoType_Resource_Herb)>=15000 then 
			Beginplot( OwnerID() , "LuaS_Guild_House_Build_2" , 0 )
			else	
			SetSpeakDetail( OwnerID(), ("[GUILD_BUILD_7]"))--���|�귽����
			end
end


function LuaS_Guild_House_Build_2()
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

function LuaS_Guild_House()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_1]" , "LuaS_Guild_House_Build" , 0 )	-- �ӽЫإߤ��|����
	AddSpeakOption( OwnerID() , TargetID(), "[SC_GUILDHOUSE_01]" , "LuaS_Guild_House_Enter" , 0 )	-- �ﶵ�A�ڭn�i�J���|��
	AddSpeakOption( OwnerID() , TargetID(), "[GUILD_BUILD_10]" , "LuaS_Guild_BoardOpen" , 0 )	---- �d�\�Ҧ����|��T
end

function LuaS_Guild_BoardOpen()
	BeginPlot( OwnerID() , "Sys_GuildHouseVisit_Open" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_Guild_House_EnterTouch()
	if GuildInfo( OwnerID() , EM_GuildInfoType_GuildHouse) ==1 then
		BeginPlot( OwnerID() , "Sys_MyGuildHouse_Open" , 0 )
	else
	ScriptMessage( OwnerID(), -1 , 1 , "[GUILD_BUILD_5]" , C_SYSTEM )
	end
end



function LuaS_Guild_House_Enter()
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

function LuaS_111765()
	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, false )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Show, false )--���	
	else
		SetPlot( OwnerID()  , "collision" , "LuaS_111765_01", 100 )--�I���@��
	end
end

function LuaS_111765_01()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDHOUSE_02]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
			AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		if( DialogSendOpen( OwnerID() ) == false ) then 
			ScriptMessage( OwnerID(),OwnerID(),1,"[SYS_FIXEQ_DATA_ERROR]",0)	
			--��ưe�X�����D
			return
		end
		for i = 0 , 100 , 1 do
			Sleep( 1 );
			SelectID = DialogGetResult( OwnerID() );
			if ( SelectID ~= -2 ) and ( SelectID ~= -1 ) and i < 100 then
				if ( SelectID == 0 ) then
					local Ret = GoReturnPos( OwnerID() )
					DialogClose( OwnerID() )
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break;
				elseif ( SelectID == 1 ) then
					DialogClose( OwnerID() )		
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					break
				end
			elseif i == 100 or i==-1 then
				DialogClose( OwnerID() )		
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end






function LuaI_111765()
	--SetPlot( OwnerID() , "Range" , "LuaI_111765_01" ,  65 )
end

function LuaI_111765_01()
	--Say( OwnerID() , "TEST" )
end

function LuaS_GuildGate_Main()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID(), "Hide Gate for 10 seconds" , "LuaS_GuildGate_Main_01" , 0 )	-- �ﶵ�A
end

function LuaS_GuildGate_Main_01()
	CloseSpeak( OwnerID() )		-- ������ܵ���
	BeginPlot( TargetID() , "LuaS_GuildGate_Main_02" , 0 )
end

function LuaS_GuildGate_Left()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE") , "LuaS_GuildGate_Main_01" , 0 )	-- �ﶵ�A
end

function LuaS_GuildGate_Right()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE") , "LuaS_GuildGate_Main_01" , 0 )	-- �ﶵ�A
end

function LuaS_GuildGate_Castle()
	LoadQuestOption( OwnerID() )	--���J���ȼҪO
	AddSpeakOption( OwnerID() , TargetID(),GetString("BUILDING_GATE")  , "LuaS_GuildGate_Main_01" , 0 )	-- �ﶵ�A
end

function LuaS_GuildGate_Main_02()
	local Obj = Role:new( OwnerID() ) 

	--local BaseX = Obj :X()
 	--local BaseY = Obj :Y();
 	--local BaseZ = Obj :Z();
	--local BaseDir = Obj:Dir();
	local BaseRoom = Obj:RoomID()

	Hide( OwnerID() )
	Sleep( 100 )
	Show( OwnerID() , BaseRoom )
end

function Guild_produceNPC()
			local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
			local NPCID = 112588
			local NPC
			local Castle = Role:new(OwnerID()) --���|�D��
			local dis = 360
			local BaseX = Castle :X()
			local BaseY = Castle :Y()
			local BaseZ = Castle :Z()
			local BaseDir = Castle :Dir()
			--Say(OwnerID(),"BaseX="..BaseX.."BaseY="..BaseY)
			local Cal = (math.pi/180)*(BaseDir) 
			--local PID
			--local Register 
			--local Rnpc = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112588, 100 , 1)
			local Rnpcdead = "dead"
			local Obj
			local Count = SetSearchAllNPC(RoomID)
			
			if Count ~= 0 then
				for i = 1 , Count , 1 do
					local ID = GetSearchResult()
					Obj = Role:New( ID )
					if Obj:IsNPC() == true then
						if ReadRoleValue(ID ,EM_RoleValue_OrgID) == 112588 then
							Rnpcdead = "life"
 	 						--Say(OwnerID(),"life")
						end
					end
				end	
			end
			--Say(OwnerID(),"Rnpcdead="..Rnpcdead)

			if Rnpcdead == "dead" then 
 	 			Say(OwnerID(),"dead")
				if( ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID ) == 401 ) then
					NPC = CreateObj( NPCID , BaseX-dis*math.cos(Cal)-40, BaseY+15 , BaseZ+dis*math.sin(Cal), BaseDir, 1 )
					SetModeEx( NPC, EM_SetModeType_Gravity, true )--���O
					SetModeEx( NPC   , EM_SetModeType_Strikback, false )--����
					SetModeEx( NPC   , EM_SetModeType_SearchenemyIgnore, true )--�Q�j�M
					SetModeEx( NPC   , EM_SetModeType_Obstruct, false )--����
					SetModeEx( NPC   , EM_SetModeType_Mark, true )--�аO
					SetModeEx( NPC   , EM_SetModeType_Move, false )--����
					SetModeEx( NPC   , EM_SetModeType_Searchenemy, false )--����
					SetModeEx( NPC   , EM_SetModeType_HideName, false )--�W��
					SetModeEx( NPC   , EM_SetModeType_ShowRoleHead, true )--�Y����
					SetModeEx( NPC   , EM_SetModeType_Fight , false )--�i�������
					SetModeEx( NPC   , EM_SetModeType_Show , true ) --�����
					AddToPartition(NPC,RoomID)
					Hide(NPC)
					Show(NPC, RoomID)
				end
			end				
end