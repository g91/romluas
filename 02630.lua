function AN_SPELL(MAGIC)
	if magic==nil or magic<490000 or (magic>499999 and  magic<850001) or magic>859999  then
		magic = 850198
	end
	local obj = OwnerID()
	castspell(obj,obj,magic)
end

function An_show(Num)
	local obj = OwnerID()
	if Num ==  1 then
		addbuff(obj,622850,0,-1)
	elseif Num == 2 then
		addbuff(obj,622859,0,-1)
	elseif Num == 3 then
		addbuff(obj,622852,0,-1)
	end
end

function Gem_MagicTools_Max()		--法寶耐久全滿 最大上限
	local PlayerID = OwnerID()
	local Durable = {}
	local MaxDurable ={}
	local NewDurable = {}
	local MagicTools = {}
	for i=0,2,1 do	
		MagicTools[i] = GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,i+18,EM_ItemValueType_OrgObjID)
		if MagicTools[i] ~=nil then
			Durable[i] = GetItemInfo(PlayerID,EM_ItemPacketType_EQ ,i+18,EM_ItemValueType_Durable)
			MaxDurable[i] = GetItemInfo( PlayerID,EM_ItemPacketType_EQ, i+18, EM_ItemValueType_MaxDurable )
			NewDurable[i] = SetItemInfo( PlayerID,EM_ItemPacketType_EQ, i+18, EM_ItemValueType_Durable, MaxDurable[i] )	
		end
	end
	return NewDurable[0],NewDurable[1],NewDurable[2]
end