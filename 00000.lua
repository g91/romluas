function LuaQuestBegin_420025()

	local VocLv = GetVocLV( 0 );

	if( CheckQuest( 420026 ) ~= 0 ) then
		return 0;
	else
		return 1;
	end
end