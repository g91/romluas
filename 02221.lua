function Germany2_FN_116862()
	if CheckFlag(OwnerID(),545027) == FALSE then
		LoadQuestOption(OwnerID())
	else
		SetSpeakDetail(OwnerID(),"[GERMANY2_FN_01]")
	end
end

function Germany2_FN_Q424206_finish()
	SetFlag(TargetID(),545027,1)
end

function Germany2_FN_105583()
	SetPlot(OwnerID(),"dead","Germany2_FN_105583_dead",0)
end

function Germany2_FN_105583_dead()
--	Say(OwnerID(),"OwnerID")
--	Say(TargetID(),"TargetID")
	local AwardTable = {530708,530709,530710,530711,530712,530713}
	local AwardLv = {10,20,40,60,80,100}
	local CountLv = FN_CountBuffLevel(TargetID(),507857)
	if CountLv == -1 then
		AddBuff(TargetID(),507857,0,15)
	else
		CancelBuff(TargetID(),507857)
		AddBuff(TargetID(),507857,CountLv+1,15)
	end
	--檢查需不需要給予稱號
	local CountLv = FN_CountBuffLevel(TargetID(),507857) + 1
	for i=1,table.getn(AwardTable) do
		if CountLv == AwardLv[i] then
			if CountBodyItem(TargetID(),AwardTable[i]) == 0 then
				GiveBodyItem( TargetID() , AwardTable[i] , 1 )
			end
		end
	end
end
