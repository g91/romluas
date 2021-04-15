function Lua_bk_BornByMultilateral( MonsterID , X , dis )	--�b�P���MonsterID �� X ����
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
function Lua_bk_warplayerpoint( player , playpoint )	--�]�w�@�ӾԳ��n��
	local newplaypoint = ReadRoleValue(player,EM_RoleValue_IncursivePoint)----------------Ū�����a�{�����ӤH�n������
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
	WriteRoleValue(ownerid(),EM_RoleValue_IncursivePoint,0) -----------�R�����W���ӤH�n��
end
function bk_war1_text_gg()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local npcm=SetSearchAllNPC(RoomID)
	local dbid=0
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
		local npcde = GetSearchResult()									  -------------�v�@���C��npc�s��	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcidŪ�����󪺸�ƮwID
		if dbid == 105030 then 
			local optime = ReadRoleValue(npcde,register2)-----------------
			say(ownerid(),"ggtime")
			WriteRoleValue(npcde,EM_RoleValue_register2,1) ------------�g�i�h		
		end
	end
end
function bk_war1_text_win()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local npcm=SetSearchAllNPC(RoomID)
	local dbid=0
	for i=1 , npcm, 1 do 											  -------------���h�֪���N���h�֦�
		local npcde = GetSearchResult()									  -------------�v�@���C��npc�s��	
		dbid=ReadRoleValue( npcde,EM_RoleValue_OrgID )                    -------------dcidŪ�����󪺸�ƮwID
		if dbid == 105030 then 
			local optime = ReadRoleValue(npcde,register2)-----------------
			say(ownerid(),"ggtime")
			WriteRoleValue(npcde,EM_RoleValue_register2,2) ------------�g�i�h		
		end
	end
end
function bk_text_text()
	local RoomID = ReadRoleValue(OwnerID(),EM_RoleValue_RoomID)-----------------
	local playcount = SetSearchAllPlayer(RoomID)
	for i=1 , playcount do
		local NpcGID = GetSearchResult()
		Lua_bk_warplayerpoint( NpcGID , 10000 )
		local xxxxxx=ReadRoleValue(NpcGID,EM_RoleValue_IncursivePoint)----Ū�����
		say(NpcGID,"x="..xxxxxx)
	end 
end