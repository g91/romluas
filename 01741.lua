function LuaI_103487_AI_EASY()
	local Timer = 0
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local ChargeLV = 9    --¾UÅì¬ðÅ§ªº§Þ¯àµ¥¯Å
	while 1 do
		local Count = HateListCount( OwnerID() ) 
		if Count  > 0 then
			if Timer == 7 or Timer == 14 then
				sleep(10)
				local Num = DW_Rand(Count) - 1 
				local Target = -1
				for i = 1 , Count  do
					Target = HateListInfo(OwnerID() ,Num , EM_HateListInfoType_GItemID )
					if CheckBuff( Target , 503488 ) == true or Target == ReadRoleValue( OwnerID() , EM_RoleValue_attackTargetID) then
						Num = Num + 1
						if Num >= Count then
							Num = 0
						end
					else
						break
					end
				end
				if Target == -1 then
					Target = ReadRoleValue( OwnerID() , EM_RoleValue_attackTargetID) 
				end
				CastSpellLV( OwnerID() , Target , 493232 , ChargeLV )    --¾UÅì¬ðÅ§skill
				Timer = Timer + 1
			end
			if Timer == 18 then
				EnableNpcAI( OwnerID() , false )
				sleep(10)
				CastSpell( OwnerID() , OwnerID() , 493233 )    
				local PPL = SetSearchAllPlayer(RoomID )
				for i = 1 , PPL , 1 do 
					local ID = GetSearchResult()
					if CheckBuff( ID ,503433 ) == false and ReadRoleValue(ID, EM_RoleValue_IsDead) == 0 and ReadRoleValue(ID, EM_RoleValue_IsPlayer) == 1 then
--						if ReadRoleValue( ID , EM_RoleValue_VOC ) ~= 0 then
							AddBuff( ID , 506299 , 1 , 10 )
--						end
					end
				end
				sleep( 10 )
				Timer = Timer + 2
				EnableNpcAI( OwnerID() , true )
			end
			sleep( 10 )
			Timer = Timer + 1
			if Timer > 20 then
				Timer = Timer - 20
			end
		else
			if Timer ~= 0 then
				Timer = 0
			end
			sleep( 60 )
		end
	end
end