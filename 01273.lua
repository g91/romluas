function GuildBombForItem()	--�}�z�u
	--Say( OwnerID() , "1" ) 
	local Owner = Role:new( OwnerID() )
	local Target=Role:new(TargetID())
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
	local BaseDir =Owner:Dir();
	local Bomb = CreateObj( 112487,BaseX, BaseY, BaseZ, BaseDir , 1 )
	if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
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
			sleep( 5 )
			end
		if result == true then 
		sleep( 5 )
		AddToPartition(Bomb, 0 )
		SetPlot( Bomb, "Touch" , "GuildBombForBomb" , 20 )
		CastSpell( Bomb , Bomb ,492453 )
		CastSpell( Bomb , Bomb ,492696 )
		end
	sleep( 5 )
	end
end

function GuildBombForBomb()
	local Bomb=(TargetID())
	if BeginCastBar( OwnerID() , GetString("GUILD_BUILD_1") , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_NORMAL , 0 )==1 then
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
			sleep( 5 )
			end
			if result == true then 
			local tempa=rand(10)
				--Say( OwnerID() , "i finisfed..." ) 
				DelObj(Bomb)
		end
	end
end

function GuildBombForMagicEnd()
	local Bomb=(OwnerID())
	DelObj(Bomb)
end
function LuaDan_Guildmailbox()	-- ù����H�c
	local PlayerGuildID = ReadRoleValue( OwnerID() ,   EM_RoleValue_GuildID  ) 
	local BuildingGuildID = ReadRoleValue( TargetID() ,   EM_RoleValue_GuildID  ) 

	if PlayerGuildID ~= BuildingGuildID then
		SetSpeakDetail(OwnerID(), "[GUILD_REMINDER]" )
	else
		LoadQuestOption( OwnerID() )
  		AddSpeakOption( OwnerID(), TargetID( ), GetString("SO_OPENMAIL") , "LuaDan_Guildmailbox_02" , 0 )	-- �}�ҫH�c
	end
end
function LuaDan_Guildmailbox_02()
	CloseSpeak( OwnerID() )	-- ������ܵ���
	OpenMail()		-- �}�ҫH�c
end


function LuaDan_Guildmailbox_WarHide()--���|�ԮɡA���ëH�c

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

	end
end