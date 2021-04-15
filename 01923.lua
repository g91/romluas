function Lua_bk_BornByMultilateral( MonsterID , X , dis )	--在周圍用MonsterID 圍成 X 角形
	local RoomID = ReadRoleValue(OwnerID() , EM_RoleValue_RoomID)
	local Obj = Role:new( OwnerID() )
	local BaseX = Obj :X()
	local BaseY = Obj :Y()
	local BaseZ = Obj :Z()
	local BaseDir = Obj :Dir()
	local MonsterGroup = {}
	for i = 1 , X do
		MonsterGroup[ i ] =CreateObj( MonsterID, BaseX-dis*math.cos(math.pi*2*(i/X)),BaseY,BaseZ+dis*math.sin(math.pi*2*(i/X)),BaseDir, 1 )
	end
	for i = 1, table.getn(MonsterGroup) do
		---AddtoPartition(MonsterGroup[i],RoomID )
	end
	return MonsterGroup
end
function Lua_bk_warplayerpoint( player , playpoint )	--設定一個戰場積分
	local newplaypoint = ReadRoleValue(player,EM_RoleValue_IncursivePoint)----------------讀取玩家現有的個人積分分數
	local pointup = SysKeyValue( "IncursivePoint" )
	local upplaypoint = pointup - playpoint
	local addplaypoint
	if newplaypoint >= pointup then 
	
	elseif newplaypoint< pointup then 
		if newplaypoint > upplaypoint then 
			addplaypoint=pointup - newplaypoint
			AddRoleValue(player,EM_RoleValue_IncursivePoint,addplaypoint)
		elseif newplaypoint <= upplaypoint then 
			AddRoleValue(player,EM_RoleValue_IncursivePoint,playpoint)
		end
	end
end
function bk_warplayerpoint_reset()
	WriteRoleValue(ownerid(),EM_RoleValue_IncursivePoint,0) -----------刪除身上的個人積分
end
function bk_war1_text_gg()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local npcm=SetSearchAllNPC(RoomID)
	local dbid=0
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
		local npcde = GetSearchResult()									  -------------逐一取每個npc編號	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcid讀取物件的資料庫ID
		if dbid == 105030 then 
			local optime = ReadRoleValue(npcde,register2)-----------------
			say(ownerid(),"ggtime")
			WriteRoleValue(npcde,EM_RoleValue_register2,1) ------------寫進去		
		end
	end
end
function bk_war1_text_win()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local npcm=SetSearchAllNPC(RoomID)
	local dbid=0
	for i=1 , npcm, 1 do 											  -------------有多少物件就做多少次
		local npcde = GetSearchResult()									  -------------逐一取每個npc編號	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcid讀取物件的資料庫ID
		if dbid == 105030 then 
			local optime = ReadRoleValue(npcde,register2)-----------------
			say(ownerid(),"ggtime")
			WriteRoleValue(npcde,EM_RoleValue_register2,2) ------------寫進去		
		end
	end
end
function bk_text_text()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local playcount = SetSearchAllPlayer(RoomID)
	for i=1 , playcount do
		local NpcGID = GetSearchResult()
		Lua_bk_warplayerpoint( NpcGID , 10000 )
		local xxxxxx=ReadRoleValue(NpcGID,EM_RoleValue_IncursivePoint)----讀取控制器
		say(NpcGID,"x="..xxxxxx)
	end 
end