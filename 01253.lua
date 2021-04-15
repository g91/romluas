-------------------------------------------------------------------------------------------------------

--���\

-------------------------------------------------------------------------------------------------------
function GuildRideBuffSkill()	-- ���\��npc���W

	local ClickObj = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local RoomID = ReadRoleValue( OwnerID(), EM_RoleValue_RoomID );

	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )

	if (ZoneID == 402) or (ZoneID == 47)  then

		SetModeEx( OwnerID()   , EM_SetModeType_Mark, true )--�аO
		SetModeEx( OwnerID()  , EM_SetModeType_HideName, true )--�W��
		SetModeEx( OwnerID() , EM_SetModeType_ShowRoleHead, true )--�Y����
		SetModeEx( OwnerID() , EM_SetModeType_Fight , true )--�i�������
		SetModeEx( OwnerID()  , EM_SetModeType_Move, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_Obstruct, true )--����
		SetModeEx( OwnerID()  , EM_SetModeType_Strikback, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_DisableRotate, true )--��V
		SetModeEx( OwnerID() , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( OwnerID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	
		AddBuff( OwnerID() , 505921 , 69, -1 )	--70%	--�Q���a�����ˮ`�馩 �k�N���� 0 = 1%	
		AddBuff( OwnerID() , 505516 , 99, -1 )	--100%	--�QNPC�����ˮ`�W�[ �k�N���� 0 = 1%	
		AddBuff( OwnerID() ,502707 ,1 ,-1 ); --�D�԰������^�媺buff (ownerID,buff,LV,Time)
		WriteRoleValue( OwnerID()  , EM_RoleValue_Register+1 ,  38  )--�������j���ؿv��---***
		SetPlot(  OwnerID(), "dead","Lua_GUILDWAR_BuildDScript_0",0 )     --���`�@��
	end

	local SkillLv = 0
	if ClickObj  == 112467 then
		SkillLv = 0
	elseif ClickObj  == 112468 then
		SkillLv = 1
	elseif ClickObj  == 112469 then
		SkillLv = 2
	elseif ClickObj  == 112470 then
		SkillLv = 3
	elseif ClickObj  == 112471 then
		SkillLv = 4
	elseif ClickObj  == 112472 then
		SkillLv = 5
	elseif ClickObj  == 112473 then
		SkillLv = 6
	elseif ClickObj  == 112474 then
		SkillLv = 7
	elseif ClickObj  == 112475 then
		SkillLv = 8
	elseif ClickObj  == 112476 then
		SkillLv = 9
	elseif ClickObj  == 112477 then
		SkillLv = 10
	end
	while 1 do
		local Obj
		local Count = SetSearchAllPlayer(RoomID)
		if Count ~= 0 then
			for i = 1 , Count , 1 do
				local ID = GetSearchResult()
				Obj = Role:New( ID )
				if Obj:IsPlayer() == true and Obj:RoomID() == RoomID then

					local PlayerGuildID = ReadRoleValue(  ID ,   EM_RoleValue_GuildID  ) 
					local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 

					if PlayerGuildID == BuildingGuildID then
						AddBuff(ID,503496,SkillLv,12)
						--Say(ID,"SkillLv="..SkillLv)
					end
				end
			end	
		end
		Sleep(100)
	end
end


function GuildRideBuff01()	-- ���\��npc���W

--	Say( TargetID() ,"TargetID"..2 )--���\
--	Say( OwnerID() ,"OwnerID"..2 )--���a

	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~


	local Zone = ReadRoleValue(OwnerID() , EM_RoleValue_ZoneID) 
	local ZoneID = Zone-1000*math.floor( Zone/1000 )


	if (VOC == 0) then

		SetSpeakDetail( OwnerID(), "[SC_YU_GUILDWAR_W4_00]"   )--

		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_05]" , "GuildRideBuff02", 0 ) --�I�����MBUFF
		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_01]".."[505315]" , "GuildRideBuff00", 0 ) --��o���b�޳N


	elseif PlayerGuildID ~= BuildingGuildID then
		LoadQuestOption( OwnerID() )
		--SetSpeakDetail( TargetID(), "[GUILD_REMINDER]"   )
		ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) --�A���O���|����
		ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 

	elseif (ZoneID == 402) or (ZoneID == 47) then

		SetSpeakDetail( OwnerID(), "[SC_YU_GUILDWAR_W4_00]"   )--


		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_01]".."[505315]" , "GuildRideBuff00", 0 ) --��o���b�޳N
		AddSpeakOption( OwnerID(), TargetID(), "[SC_YU_GUILDWAR_BUILD_05]" , "GuildRideBuff02", 0 ) --�I�����MBUFF

	else

		LoadQuestOption( OwnerID() )

		if ClickObj  >= 112467 then
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE01]" , "CheckRiderBuff02", 0 ) -- ��O550���o�W�[�M���t�ת��ĪG

			if ClickObj  >= 112468 then
			AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE02]" , "CheckRiderBuff03", 0 ) -- ��O750���o�W�[�M���t�ת��ĪG

				if ClickObj  >= 112469 then
				AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE03]" , "CheckRiderBuff04", 0 ) -- ��O950���o�W�[�M���t�ת��ĪG

					if ClickObj  >= 112470 then
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE04]" , "CheckRiderBuff05", 0 ) -- ��O1150���o�W�[�M���t�ת��ĪG

						if ClickObj  >= 112471 then
						AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE05]" , "CheckRiderBuff06", 0 ) -- ��O1350���o�W�[�M���t�ת��ĪG

							if ClickObj  >= 112472 then
							AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE06]" , "CheckRiderBuff07", 0 ) -- ��O1550���o�W�[�M���t�ת��ĪG

								if ClickObj  >= 112473 then
								AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE07]" , "CheckRiderBuff08", 0 ) -- ��O1750���o�W�[�M���t�ת��ĪG

									if ClickObj  >= 112474 then
									AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE08]" , "CheckRiderBuff09", 0 ) -- ��O1950���o�W�[�M���t�ת��ĪG

										if ClickObj  >= 112475 then
										AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE09]" , "CheckRiderBuff10", 0 ) -- ��O2150���o�W�[�M���t�ת��ĪG

											if ClickObj  >= 112476 then
											AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE10]" , "CheckRiderBuff11", 0 ) -- ��O2350���o�W�[�M���t�ת��ĪG

											end	
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end
	--SetPlot( OwnerID() , "Touch" , "CheckRiderBuff02" , 150 )
	--Say( OwnerID() , "1" ) 
end


function GuildRideBuff00()

	CloseSpeak( OwnerID() )
--	Say( TargetID() ,"TargetID"..3 )
--	Say( OwnerID() ,"OwnerID"..3 )
	Beginplot( TargetID() ,"GuildRideBuff00_2", 0 )
end

function GuildRideBuff00_2()

--	Say( TargetID() ,"TargetID"..3 )
--	Say( OwnerID() ,"OwnerID"..3 )
	Beginplot( TargetID() ,"Yuyu_GuildWarBuliding_1_02", 0 )
end


function GuildRideBuff02()	-- �Ԯɤ~����  _  ���\��npc���W

	local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	local PlayerGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	 local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID  ) 

	LoadQuestOption( OwnerID() )

	if ClickObj  >= 112467 then
		AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE01]" , "CheckRiderBuff02", 0 ) -- ��O550���o�W�[�M���t�ת��ĪG

			if ClickObj  >= 112468 then
			AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE02]" , "CheckRiderBuff03", 0 ) -- ��O750���o�W�[�M���t�ת��ĪG

				if ClickObj  >= 112469 then
				AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE03]" , "CheckRiderBuff04", 0 ) -- ��O950���o�W�[�M���t�ת��ĪG

					if ClickObj  >= 112470 then
					AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE04]" , "CheckRiderBuff05", 0 ) -- ��O1150���o�W�[�M���t�ת��ĪG

						if ClickObj  >= 112471 then
						AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE05]" , "CheckRiderBuff06", 0 ) -- ��O1350���o�W�[�M���t�ת��ĪG

							if ClickObj  >= 112472 then
							AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE06]" , "CheckRiderBuff07", 0 ) -- ��O1550���o�W�[�M���t�ת��ĪG

								if ClickObj  >= 112473 then
								AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE07]" , "CheckRiderBuff08", 0 ) -- ��O1750���o�W�[�M���t�ת��ĪG

									if ClickObj  >= 112474 then
									AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE08]" , "CheckRiderBuff09", 0 ) -- ��O1950���o�W�[�M���t�ת��ĪG

										if ClickObj  >= 112475 then
										AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE09]" , "CheckRiderBuff10", 0 ) -- ��O2150���o�W�[�M���t�ת��ĪG

											if ClickObj  >= 112476 then
											AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_RIDE10]" , "CheckRiderBuff11", 0 ) -- ��O2350���o�W�[�M���t�ת��ĪG

											end	
										end
									end
								end
							end
						end
					end
				end
			end
	end

end
-------------------------------------------------------------------------------------------------------
	--function CheckRiderBuff02()	--��Target Plot
	--	if BeginCastBar( OwnerID() , "[GUILD_STABLE_1]" , 60 , ruFUSION_ACTORSTATE_NORMAL , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then --��s�M���޳N
	--			
	--			while 1 do
	--				if ( CheckCastBar( OwnerID()  ) > 0) then -- ���\
	--					result = true
	--					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
	--					break;
	--				end
 	--	
	--				if ( CheckCastBar( OwnerID()  )< 0 ) then -- ����
	--					result = false
	--					EndCastBar( OwnerID()  , CheckCastBar( OwnerID()  ) )
	--					break;
	--				end
 	--	
	--			CloseSpeak( OwnerID() )
	--			sleep( 5 )
	--			end
	--		if result == true then 
	--		ScriptMessage( OwnerID(), TargetID(), 1, "[GUILD_STABLE_2]", C_DEFAULT )	-- �g�L�{�u�a��o�M���޳N�A�A�����M���ʳt�פW�ɤF�I
	--		BeginPlot( TargetID() , "CheckRiderBuff03" , 0 )	
	--		end
	--	end
	--end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff02()	--�ˬd��������buff
	--Say(OwnerID(),"02")
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 1
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff02_1",0)
	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 550 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -550 )
			CastSpell( OwnerID() , OwnerID() , 492703)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff02_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 550 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -550 )
						CastSpell( OwnerID() , OwnerID() , 492703)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff03()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 2
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end

	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff03_1",0)
	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 750 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -750 )
			CastSpell( OwnerID() , OwnerID() , 492704)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff03_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 750 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -750 )
						CastSpell( OwnerID() , OwnerID() , 492704)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end			
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff04()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 3
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff04_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 950 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -950 )
			CastSpell( OwnerID() , OwnerID() , 492705)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end

function CheckRiderBuff04_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 950 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -950 )
						CastSpell( OwnerID() , OwnerID() , 492705)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff05()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 4
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff05_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1150 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1150 )
			CastSpell( OwnerID() , OwnerID() , 492706)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff05_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1150 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1150 )
						CastSpell( OwnerID() , OwnerID() , 492706)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff06()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 5
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff06_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1350 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1350 )
			CastSpell( OwnerID() , OwnerID() , 492707)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff06_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1350 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1350 )
						CastSpell( OwnerID() , OwnerID() , 492707)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff07()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 6
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff07_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1550 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1550 )
			CastSpell( OwnerID() , OwnerID() , 492708)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff07_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1550 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1550 )
						CastSpell( OwnerID() , OwnerID() , 492708)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff08()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 7
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff08_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1750 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1750 )
			CastSpell( OwnerID() , OwnerID() , 492709)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff08_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1750 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1750 )
						CastSpell( OwnerID() , OwnerID() , 492709)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff09()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 8
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff09_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1950 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -1950 )
			CastSpell( OwnerID() , OwnerID() , 492710)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end

function CheckRiderBuff09_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
		
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1950 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -1950 )
						CastSpell( OwnerID() , OwnerID() , 492710)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff10()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 9
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff10_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2150 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -2150 )
			CastSpell( OwnerID() , OwnerID() , 492711)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff10_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF
	
		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2150 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -2150 )
						CastSpell( OwnerID() , OwnerID() , 492711)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end
end
-------------------------------------------------------------------------------------------------------
function CheckRiderBuff11()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	local BuffType = 0
	local Count = BuffCount ( OwnerID())
	local BuffList = { 502979, 502980, 502981, 502982, 502983, 502984, 502985,502986, 502987, 502988 }
	local ThisBuffLv = 10
	local Pass = 0
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		for j=1 , table.getn(BuffList) do 
			if BuffID == BuffList[j] then
				local EffectLV = GameObjInfo_int ( BuffID , "EffectLV" )
				if EffectLV > ThisBuffLv then
					ScriptMessage( OwnerID(),OwnerID(),1,"[SC_BUFFTOWER_07]",0)	
					return
				else
					Pass = 1
					break
				end
			end
		end
		if Pass > 0 then
			break
		end
	end
	if CheckBuff( OwnerID() , 502979 ) == true or  CheckBuff( OwnerID() , 502980 ) == true or CheckBuff( OwnerID() , 502981 ) == true or  CheckBuff( OwnerID() , 502982 ) == true or  CheckBuff( OwnerID() , 502983 ) == true or  CheckBuff( OwnerID() , 502984 ) == true or  CheckBuff( OwnerID() , 502985 ) == true or  CheckBuff( OwnerID() , 502986 ) == true or  CheckBuff( OwnerID() , 502987 ) == true or  CheckBuff( OwnerID() , 502988 ) == true then
		BeginPlot(OwnerID(),"CheckRiderBuff11_1",0)

	else
		if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2350 then
			AddRoleValue( OwnerID() , EM_RoleValue_Money , -2350 )
			CastSpell( OwnerID() , OwnerID() , 492712)
		else
			 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		end
	end
end
function CheckRiderBuff11_1()
	if CheckBuff( OwnerID() , 501570) == false then  --�W�[�ˬd�P�_
		AddBuff(OwnerID() , 501570,0,-1);--�M�ᵹ��BUFF

		DialogCreate( OwnerID() , EM_LuaDialogType_YesNo ,"[SC_GUILDRIDEAL]")
		DialogSelectStr( OwnerID() , "[SC_GETTITLE_1]" );
		DialogSelectStr( OwnerID() , "[SC_CANCEL]" );
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
					if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2350 then
						AddRoleValue( OwnerID() , EM_RoleValue_Money , -2350 )
						CastSpell( OwnerID() , OwnerID() , 492712)
					else
						 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
					end
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )
					break;
				elseif ( SelectID == 1 ) then
					CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
					DialogClose( OwnerID() )		
					break
				end
			elseif i == 100 then
				CancelBuff( OwnerID(), 501570 );--�̫�M��BUFF
				DialogClose( OwnerID() )		
				break
			end
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0, "[SC_WINDOW_OPENED]", 0 );
	end		
end
--------------------------------------------------------------------------------------------------------
	--function CheckRiderBuff03()	--�ˬd��������buff
	--
	--local ClickObj = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	--
	--		if CheckBuff( TargetID() , 502979 ) == true or  CheckBuff( TargetID() , 502980 ) == true or CheckBuff( TargetID() , 502981 ) == true or  CheckBuff( TargetID() , 502982 ) == true or  CheckBuff( TargetID() , 502983 ) == true or  CheckBuff( TargetID() , 502984 ) == true or  CheckBuff( TargetID() , 502985 ) == true or  CheckBuff( TargetID() , 502986 ) == true or  CheckBuff( TargetID() , 502987 ) == true or  CheckBuff( TargetID() , 502988 ) == true then
	--			ScriptMessage( OwnerID(), TargetID(), 1, "[MSG_EFFECT_HAVE]", C_DEFAULT )	-- ���~�ϥΥ��ѡA���ĪG�w�s�b
	--		else	
	--			if ClickObj  == 112467 then
	--				CastSpell( TargetID() , OwnerID() , 492703 )
	--				sleep( 10 )
	--			elseif ClickObj == 112468 then
	--				CastSpell( TargetID() , OwnerID() , 492704 )
	--				sleep( 10 )
	--			elseif ClickObj == 112469 then
	--				CastSpell( TargetID() , OwnerID() , 492705 )
	--				sleep( 10 )
	--			elseif ClickObj == 112470 then
	--				CastSpell( TargetID() , OwnerID() , 492706 )
	--				sleep( 10 )
	--			elseif ClickObj == 112471 then
	--				CastSpell( TargetID() , OwnerID() , 492707 )
	--				sleep( 10 )
	--			elseif ClickObj == 112472 then
	--				CastSpell( TargetID() , OwnerID() , 492708 )
	--				sleep( 10 )
	--			elseif ClickObj == 112473 then
	--				CastSpell( TargetID() , OwnerID() , 492709 )
	--				sleep( 10 )
	--			elseif ClickObj == 112474 then
	--				CastSpell( TargetID() , OwnerID() , 492710 )
	--				sleep( 10 )
	--			elseif ClickObj == 112475 then
	--				CastSpell( TargetID() , OwnerID() , 492711 )
	--				sleep( 10 )
	--			elseif ClickObj == 112476 then
	--				CastSpell( TargetID() , OwnerID() , 492712 )
	--				sleep( 10 )
	--			else
	--				Say( OwnerID() , "Not Found!!" )
	--			end
	--		end
	--end
-------------------------------------------------------------------------------------------------------

--�u�ö�

-------------------------------------------------------------------------------------------------------
function GuildGuideBuff01()	--�u�ö� ��npc���W
local ClickObj = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
local PlayerGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 
local BuildingGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 

	if PlayerGuildID ~= BuildingGuildID then

	SetSpeakDetail( OwnerID(), "[GUILD_REMINDER]" )
	--ScriptMessage( TargetID() , OwnerID() , 1 , "[GUILD_REMINDER]", C_SYSTEM ) 
	--ScriptMessage( TargetID() , OwnerID() , 0 , "[GUILD_REMINDER]", C_SYSTEM ) 

	else
	LoadQuestOption( OwnerID() )
	if ClickObj  >= 112477 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD01]" , "GuildGuideBuff02", 0 ) -- ��O500�u���@��lv1�ħL1�p��

	if ClickObj  >= 112478 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD02]" , "GuildGuideBuff03", 0 ) -- ��O1000�u���@��lv2�ħL1�p��

	if ClickObj  >= 112479 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD03]" , "GuildGuideBuff04", 0 ) -- ��O2000�u���@��lv3�ħL1�p��

	if ClickObj  >= 112480 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD04]" , "GuildGuideBuff05", 0 ) -- ��O4000�u���@��lv4�ħL1�p��

	if ClickObj  >= 112481 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD05]" , "GuildGuideBuff06", 0 ) -- ��O8000�u���@��lv5�ħL1�p��

	if ClickObj  >= 112482 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD06]" , "GuildGuideBuff07", 0 ) -- ��O16000�u���@��lv6�ħL1�p��

	if ClickObj  >= 112483 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD07]" , "GuildGuideBuff08", 0 ) -- ��O32000�u���@��lv7�ħL1�p��

	if ClickObj  >= 112484 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD08]" , "GuildGuideBuff09", 0 ) -- ��O64000�u���@��lv8�ħL1�p��

	if ClickObj  >= 112485 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD09]" , "GuildGuideBuff10", 0 ) -- ��O128000�u���@��lv9�ħL1�p��

	if ClickObj  >= 112486 then
	AddSpeakOption( OwnerID(), TargetID( ), "[GUILD_GUARD010]" , "GuildGuideBuff11", 0 ) -- ��O256000�u���@��lv10�ħL1�p��

	end	
	end
	end
	end
	end
	end
	end
	end
	end
	end
	end
	--Say( OwnerID() , "1end")
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff02()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 500 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -500 )
		CastSpell( OwnerID() , OwnerID() , 492683)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		 sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff03()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 1000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -1000 )
		CastSpell( OwnerID() , OwnerID() , 492684)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------

function GuildGuideBuff04()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 2000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -2000 )
		CastSpell( OwnerID() , OwnerID() , 492685)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff05()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 4000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -4000 )
		CastSpell( OwnerID() , OwnerID() , 492686)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff06()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 8000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -8000 )
		CastSpell( OwnerID() , OwnerID() , 492687)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff07()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 16000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -16000 )
		CastSpell( OwnerID() , OwnerID() , 492688)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff08()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 32000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -32000 )
		CastSpell( OwnerID() , OwnerID() , 492689)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff09()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 64000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -64000 )
		CastSpell( OwnerID() , OwnerID() , 492690)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff10()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 128000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -128000 )
		CastSpell( OwnerID() , OwnerID() , 492691)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		 sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function GuildGuideBuff11()	--�ˬd��������buff
	CloseSpeak( OwnerID() )
	if ReadRoleValue( OwnerID() , EM_RoleValue_Money ) >= 256000 then
		AddRoleValue( OwnerID() , EM_RoleValue_Money , -256000 )
		CastSpell( OwnerID() , OwnerID() , 492692)
		sleep( 10 )
	else
		 SetSpeakDetail( OwnerID(), "[ST_110989_3_2]"   ) --�z����������
		sleep( 10 )
	end
end
-------------------------------------------------------------------------------------------------------
function mmmmmdfsdfsd()	-- ù����H�c
	LoadQuestOption( OwnerID() )
  	AddSpeakOption( OwnerID(), TargetID( ), "[SO_OPENMAIL]" , "LuaS_110771_OpenMail" , 0 )	-- �}�ҫH�c
end
-------------------------------------------------------------------------------------------------------
function mmmmmmmsdfsdf()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenMail()		-- �}�ҫH�c
end

--if CheckInMyGuildHouse(OwnerID()) ==True  then
-------------------------------------------------------------------------------------------------------
function GuildGuide_AttackSituation()
--Say(OwnerID(),"1")
--Say(TargetID(),"2")
	local RoomID = ReadRoleValue( OwnerID() ,EM_RoleValue_RoomID)
	local X = ReadRoleValue( OwnerID() ,EM_RoleValue_X)
	local Y = ReadRoleValue( OwnerID() ,EM_RoleValue_Y)
	local Z = ReadRoleValue( OwnerID() ,EM_RoleValue_Z)
	local DIR = ReadRoleValue( OwnerID() ,EM_RoleValue_Dir)
	local NPC = CreateObj( 102480 , X , Y+40.5 , Z , DIR , 1)
		--SetModeEx( NPC  , EM_SetModeType_DisableRotate , false ) --�۰ʭ��V
		SetModeEx( NPC  , EM_SetModeType_Strikback, true )--����
		SetModeEx( NPC  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
		SetModeEx( NPC  , EM_SetModeType_Obstruct, true )--����
		SetModeEx( NPC  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( NPC  , EM_SetModeType_Move, true )--����
		SetModeEx( NPC  , EM_SetModeType_Searchenemy, true )--����
		SetModeEx( NPC  , EM_SetModeType_HideName, false )--�W��
		SetModeEx( NPC  , EM_SetModeType_ShowRoleHead, false )--�Y����
		SetModeEx( NPC  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( NPC  , EM_SetModeType_Show , true ) --�����
		AddToPartition(NPC, RoomID)
		Hide(NPC)
		Show( NPC,RoomID)	
 
end