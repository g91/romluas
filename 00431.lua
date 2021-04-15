function Hsiang_SaveHomePoint()
  SaveHomePoint( OwnerID() );
end

function Hsiang_GoHomePoint()
  GoHomePoint( OwnerID() );
end
function Hsiang_GoHomeCheck()
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local CS = {402,440,441,442,443,444,445,446,354}
	for i = 1, table.getn(CS) do
		if ZoneID == CS[i] then
			ScriptMessage(OwnerID(),OwnerID(),1, "[SC_YU_GUILDWAR_BUILD_63]" , 0 )
			return false
		end
	end
	return true
end