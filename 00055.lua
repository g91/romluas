function InitQuestNPC_420103()
	
	SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_420103" , 0 );

end

function QuestNPC_DeathPlot_420103()

	local 	RequestQuestID 	= 420103;	-- ���� NPC �һݭn�����ȥN�X
	local	CreateObjID	= 110089;	-- ���� NPC ���˪��N��
	local	LiveTime	= 590;		-- ���� NPC , �� NPC �ͦs�ɶ�
	local	CheckMode	= 0;		-- �]�w�ˬd��������. 0 = �ӤH�M�p��, 1 = �ӤH( �ݰ�:���঳���� ), 2 = �ζ� ( �ݰ� )

--	 if( CheckAcceptQuest( TargetID(), 420103 ) == true ) then

		local ObjID 	= CreateObjByObj( CreateObjID , OwnerID() , 1);
		local CreateObj	= Role:new( ObjID ) ;
		
		CreateObj:SetLiveTime( LiveTime );	-- �]�w NPC �� 600 ��	
--	end
	return true
end