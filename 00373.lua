
function LuaFunc_Waork_ExamineA( itemA )

	local Count = CountBodyItem( OwnerID(), itemA );

	if( Count >= 1 ) then
		SendQuestClickObjResult( OwnerID(), -1, 0 , 0 );
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_WORK_EXAMINE_OVER"), 0 ); --/*你已經完成測驗。
		return -1;
	else
		SendQuestClickObjResult( OwnerID(), 1, 0, 0 );
		return 1;
	end
end

function LuaFunc_Waork_ExamineB( itemA , itemB , itemC )
	local R = Rand(99)
	local iItemID
	if R < 20 then
		iItemID = itemA
	elseif R < 60 then
		iItemID = itemB
	else
		iItemID = itemC
	end

	local Result = GiveBodyItem( OwnerID(), iItemID, 1 );
	if( Result ) then
  		return 1;
	end

	return -1;
end