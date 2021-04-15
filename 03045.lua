function Lua703045_Z32D_BossKilled_Check( _bossID )
	local _ownerID = _bossID or OwnerID();
	
	local _killedBossGUID = ReadRoleValue( _ownerID , EM_RoleValue_OrgID ); 
	--檢查表
	local _requiredQuestGUID_KeyItem = { --任務ID = SetFlag ID
				[427102] = { 549119 }, --消滅忘卻者以思帖
				[426074] = { 549115 }, --營救隊長馬薩里
				[427101] = { 549116 , 549117 , 549118 }, --消滅庫柏族大酋長 --消滅裂水海盜首領 --消滅獅魚人督軍
				[427103] = { 542680 }--摧毀眾魂棺
				};
	
	local _bossGUID_QuestGUID = {--BossID = {對應上表的任務GUID , SetFlagID} --若SetFlagID值沒有給  預設為1
			[108602] = {427102} ,--以思帖
			
			[108684] = {426074} ,--馬薩里隊長
			[108880] = {426074} ,
			[108886] = {426074} ,

			[108598] = {427101 , 1} ,--史洛戈
			[108703] = {427101 , 1} ,
			[108704] = {427101 , 1} ,

			[108599] = {427101 , 2} ,--老袒．古瓦迪
			[108685] = {427101 , 2} ,
			[108686] = {427101 , 2} ,

			[104530] = {427101 , 3} ,--鯊邦度
			[108601] = {427101 , 3} ,

			[108600] = {427103} ,--眾魂棺
			[108687] = {427103} ,
			[108692] = {427103} 
			};

	if ( _bossGUID_QuestGUID[ _killedBossGUID ] ~= nil ) then--查詢表中  當有對應ID時才做處理  如果沒有則代表設定表中沒有該BOSS
		local _rangePlayers = LUA_YOYO_RangePlayerNotGM( _ownerID , 8000 );
		local _requiredQuestGUID = 0;
		local _keyItem = 1;

		_requiredQuestGUID = _bossGUID_QuestGUID[ _killedBossGUID ][ 1 ];--該王對應的任務
		_keyItem = _bossGUID_QuestGUID[ _killedBossGUID ][ 2 ] or 1;--該王對應的SetFlag ----若SetFlagID值沒有給  預設為1
		_keyItem = _requiredQuestGUID_KeyItem[ _requiredQuestGUID ][ _keyItem ];
		DebugMsg( 0 , 0 , "---_requiredQuestGUID : ".._requiredQuestGUID.."  --_keyItem : ".._keyItem );
		--[[
		for _index , _playerID in pairs( _rangePlayers ) do--檢查所有玩家條件
			if ( CheckAcceptQuest( _playerID , _requiredQuestGUID ) == true ) then
				SetFlag( _playerID , _keyItem );
			end
		end
		]]--

	end	

	return true;
end--function Z32D_BossKilled_Check