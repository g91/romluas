function InitQuestNPC_XXXXXXX()
	
	SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_XXX" , 0 );

end

function QuestNPC_DeathPlot_XXXXXX()
	
	local 	RequestQuestID 	= 420025;	-- ���� NPC �һݭn�����ȥN�X
	local	CreateObjID	= 110000;	-- ���� NPC ���˪��N��
	local	LiveTime	= 10;		-- ���� NPC , �� NPC �ͦs�ɶ�
	local	CheckMode	= 0;		-- �]�w�ˬd��������. 0 = �ӤH�M�p��, 1 = �ӤH( �ݰ�:���঳���� ), 2 = �ζ� ( �ݰ� )

	if( CheckQuest( TargetID(), RequestQuestID, 0 ) == true ) then

		local ObjID 	= CreateObjByObj( CreateObjID, OwnerID() );
		local CreateObj	= Role:new( ObjID ) ;
		
		CreateObj:SetLiveTime( LiveTime );	-- �]�w NPC �u�ଡ 10 ��	
	end

end