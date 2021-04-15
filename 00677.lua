function LuaI_Monster_Alert(range) --會召喚範圍內與自己同編號的怪物共同攻擊
	--range 會影響求救的範圍
	local List = SearchRangeNPC( OwnerID() , range );
	local Owner = Role:new( OwnerID() );
	local Obj
	for i = 0 , 100 , 1 do
		if List[i] == -1 then 
			break;
		end		
		Obj = Role:New( List [i] )
		if Obj:OrgID() == Owner:OrgID() and Obj:IsDead() ~= 1 then
			if Obj:IsAttack( ) == false then
				Obj:SetAttack( Owner:AttackTargetID() )
			end
		end
	end
end

function LuaFunc_MonsterAlert_Script( Monster , range , String) --SCRIPT用呼叫劇情
	-- Monster 被呼叫的怪物，可以是陣列，但必須由 1 開始
	-- range 呼叫的範圍
	-- String 呼叫時的訊息
	local List = SearchRangeNPC( OwnerID() , range );
	local Owner = Role:new( OwnerID() );
	local CHECKID = {}
	local Obj

	if Type(Monster) == "table" then
		CHECKID = Monster
	elseif Type(Monster) == "number" then
		CHECKID[1] = Monster
	else
		return
	end

	for i = 0 , 100 , 1 do
		if List[i] == -1 then 
			break;
		end		
		Obj = Role:New( List [i] )
		for j = 1 , table.getn( CHECKID ) , 1 do  
			if Obj:OrgID() == CHECKID[j]  and Obj:IsDead() ~= 1 and Obj:RoomID() == Owner:RoomID() then
				if Obj:IsAttack( ) == false then
					Obj:SetAttack( Owner:AttackTargetID() )
					if Obj:AttackTargetID() > 0 and String ~= nil then
						Say( List[i] , GetString(String) )
					end
				end
			end
		end
	end
end