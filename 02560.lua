function Lua_skwerl_turkeyrandomizer()
	local O_ID = OwnerID()
	local R= rand(100)+1
	if R >=1 and R<=50 then   
		givebodyitem( O_ID , 206266, 1 ) --(給予目標, 編號, 數量)
	elseif R >=50 and R<=85 then  
		givebodyitem( O_ID , 206266, 2 ) --(給予目標, 編號, 數量)
	else
		givebodyitem( O_ID , 206266, 3 ) --(給予目標, 編號, 數量)
	end
end


function Lua_skwerl_thanks_begin()
	local O_ID = OwnerID()
		LoadQuestOption( O_ID)
		if checkflag(O_ID , 546069) == false then
		SetFlag( O_ID , 546093 , 1 )
	end
end



function Lua_skwerl_mission_end()
	local Player_GUID= TargetID()
	SetFlag( Player_GUID, 546093 , 0 )
	SetFlag( Player_GUID , 546069 , 1 )
end


function Lua_skwerl_enlarge()
	AddBuff( OwnerID() , 505451 , 0 , -1 )
end