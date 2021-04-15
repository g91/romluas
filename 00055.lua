function InitQuestNPC_420103()
	
	SetPlot( OwnerID() , "dead" , "QuestNPC_DeathPlot_420103" , 0 );

end

function QuestNPC_DeathPlot_420103()

	local 	RequestQuestID 	= 420103;	-- 產生 NPC 所需要的任務代碼
	local	CreateObjID	= 110089;	-- 產生 NPC 的樣版代號
	local	LiveTime	= 590;		-- 產生 NPC , 該 NPC 生存時間
	local	CheckMode	= 0;		-- 設定檢查任務類型. 0 = 個人和小隊, 1 = 個人( 待做:不能有隊伍 ), 2 = 團隊 ( 待做 )

--	 if( CheckAcceptQuest( TargetID(), 420103 ) == true ) then

		local ObjID 	= CreateObjByObj( CreateObjID , OwnerID() , 1);
		local CreateObj	= Role:new( ObjID ) ;
		
		CreateObj:SetLiveTime( LiveTime );	-- 設定 NPC 活 600 秒	
--	end
	return true
end