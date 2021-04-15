function InitQuestNPC_XXXXXXX()
	
	SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_XXX" , 0 );

end

function QuestNPC_DeathPlot_XXXXXX()
	
	local 	RequestQuestID 	= 420025;	-- 產生 NPC 所需要的任務代碼
	local	CreateObjID	= 110000;	-- 產生 NPC 的樣版代號
	local	LiveTime	= 10;		-- 產生 NPC , 該 NPC 生存時間
	local	CheckMode	= 0;		-- 設定檢查任務類型. 0 = 個人和小隊, 1 = 個人( 待做:不能有隊伍 ), 2 = 團隊 ( 待做 )

	if( CheckQuest( TargetID(), RequestQuestID, 0 ) == true ) then

		local ObjID 	= CreateObjByObj( CreateObjID, OwnerID() );
		local CreateObj	= Role:new( ObjID ) ;
		
		CreateObj:SetLiveTime( LiveTime );	-- 設定 NPC 只能活 10 秒	
	end

end