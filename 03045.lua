function Lua703045_Z32D_BossKilled_Check( _bossID )
	local _ownerID = _bossID or OwnerID();
	
	local _killedBossGUID = ReadRoleValue( _ownerID , EM_RoleValue_OrgID ); 
	--�ˬd��
	local _requiredQuestGUID_KeyItem = { --����ID = SetFlag ID
				[427102] = { 549119 }, --�����ѫo�̥H�䩫
				[426074] = { 549115 }, --��϶������Ĩ�
				[427101] = { 549116 , 549117 , 549118 }, --�����w�f�ڤj���� --�����������s���� --�����೽�H���x
				[427103] = { 542680 }--�R�������
				};
	
	local _bossGUID_QuestGUID = {--BossID = {�����W������GUID , SetFlagID} --�YSetFlagID�ȨS����  �w�]��1
			[108602] = {427102} ,--�H�䩫
			
			[108684] = {426074} ,--���Ĩ�����
			[108880] = {426074} ,
			[108886] = {426074} ,

			[108598] = {427101 , 1} ,--�v����
			[108703] = {427101 , 1} ,
			[108704] = {427101 , 1} ,

			[108599] = {427101 , 2} ,--�ѳR�D�j�˭}
			[108685] = {427101 , 2} ,
			[108686] = {427101 , 2} ,

			[104530] = {427101 , 3} ,--�T����
			[108601] = {427101 , 3} ,

			[108600] = {427103} ,--�����
			[108687] = {427103} ,
			[108692] = {427103} 
			};

	if ( _bossGUID_QuestGUID[ _killedBossGUID ] ~= nil ) then--�d�ߪ�  ������ID�ɤ~���B�z  �p�G�S���h�N��]�w���S����BOSS
		local _rangePlayers = LUA_YOYO_RangePlayerNotGM( _ownerID , 8000 );
		local _requiredQuestGUID = 0;
		local _keyItem = 1;

		_requiredQuestGUID = _bossGUID_QuestGUID[ _killedBossGUID ][ 1 ];--�Ӥ�����������
		_keyItem = _bossGUID_QuestGUID[ _killedBossGUID ][ 2 ] or 1;--�Ӥ�������SetFlag ----�YSetFlagID�ȨS����  �w�]��1
		_keyItem = _requiredQuestGUID_KeyItem[ _requiredQuestGUID ][ _keyItem ];
		DebugMsg( 0 , 0 , "---_requiredQuestGUID : ".._requiredQuestGUID.."  --_keyItem : ".._keyItem );
		--[[
		for _index , _playerID in pairs( _rangePlayers ) do--�ˬd�Ҧ����a����
			if ( CheckAcceptQuest( _playerID , _requiredQuestGUID ) == true ) then
				SetFlag( _playerID , _keyItem );
			end
		end
		]]--

	end	

	return true;
end--function Z32D_BossKilled_Check