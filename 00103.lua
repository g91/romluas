function LuaSpeak_110346()

	-- �]�w��ܤ��e
		SetSpeakDetail( OwnerID(), "SD_110346_1"   );
	
	-- �[�J��ܿﶵ
		-- �[�J�ǲ߱��q
		local MaxMiningLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_Mining );
		
		if( MaxMiningLV == 0 ) then
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_1" , "LuaSO_110346_1", 0 );
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_4" , "LuaSO_110346_4", 0 );
		end

		AddSpeakOption( OwnerID(), TargetID( ), "SO_LEAVE" , "LuaSO_110346_LEAVE", 0 );

		-- �[�J�ǲߥ��K
		--AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_2" , "LuaSO_110346_2", 0 );

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_1()

	-- �ǲ߱��q

	SetSpeakDetail( OwnerID(), "SD_110036_2"   );
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110036_2", 	"LuaSO_110346_2", 	0 );	-- �O
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110036_3", 	"LuaSO_110346_LEAVE", 	0 );	-- �_

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_2()

	--WriteRoleValue( OwnerID(), EM_RoleValue_Skill_Mining, 1 );
	SetScriptFlag( OwnerID(), 540069, 1 );	-- ������ū��q����
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_4()
	
	SetScriptFlag( OwnerID(), 540069, 0 );	-- ������ū��q����
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------