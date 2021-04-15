function LuaSpeak_110346()

	-- 設定對話內容
		SetSpeakDetail( OwnerID(), "SD_110346_1"   );
	
	-- 加入對話選項
		-- 加入學習採礦
		local MaxMiningLV = ReadRoleValue( OwnerID(), EM_RoleValue_SkillMax_Mining );
		
		if( MaxMiningLV == 0 ) then
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_1" , "LuaSO_110346_1", 0 );
		else
			AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_4" , "LuaSO_110346_4", 0 );
		end

		AddSpeakOption( OwnerID(), TargetID( ), "SO_LEAVE" , "LuaSO_110346_LEAVE", 0 );

		-- 加入學習打鐵
		--AddSpeakOption( OwnerID(), TargetID( ), "SO_110346_2" , "LuaSO_110346_2", 0 );

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_1()

	-- 學習採礦

	SetSpeakDetail( OwnerID(), "SD_110036_2"   );
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110036_2", 	"LuaSO_110346_2", 	0 );	-- 是
	AddSpeakOption( OwnerID(), TargetID( ), "SO_110036_3", 	"LuaSO_110346_LEAVE", 	0 );	-- 否

end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_2()

	--WriteRoleValue( OwnerID(), EM_RoleValue_Skill_Mining, 1 );
	SetScriptFlag( OwnerID(), 540069, 1 );	-- 給予初級挖礦原資格
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_4()
	
	SetScriptFlag( OwnerID(), 540069, 0 );	-- 關掉初級挖礦原資格
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------
function LuaSO_110346_LEAVE()
	CloseSpeak( OwnerID() );
end
--------------------------------------------------------------------------------------------------------------------------