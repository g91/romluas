function Lua_GetJobGetEQ()
	local Sub_Job = ReadRoleValue( OwnerID() , EM_RoleValue_VOC_SUB )
	local EQTable = {}
	local Obj = Role:new(OwnerID() )

	EQTable[0] = {EM_EQWearPos_BK_Shoes , EM_EQWearPos_BK_Clothes , EM_EQWearPos_BK_Pants, EM_EQWearPos_BK_MainHand, EM_EQWearPos_BK_SecondHand , EM_EQWearPos_BK_Bow , EM_EQWearPos_BK_Ammo}
	EQTable[1] = {221275 , 221273 , 221274 , 210163 , 0 , 0 , 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[2] = {221278 , 221276 , 221277 , 210110 , 0 , 210249 , 210031} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[3] = {220192 , 220097 , 220146 , 210110 , 0 , 0 , 210032} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[4] = {221264 , 221262 , 221263 , 210224 , 0 , 0 , 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[5] = {220467 , 220346 , 220408 , 210224 , 220769 , 0 , 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[6] = {221267 , 221265 , 221266 , 210081 , 220769 , 0 , 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[7] = {224850 , 224848 , 224849 , 212010 , 0 , 0, 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥
	EQTable[8] = {224847 , 224845 , 224846 , 210224 , 220769 , 0 , 0} --鞋子，上衣，褲子，主手，副手，遠程，彈藥

	if Sub_Job ~= 0 then
		for i = 1 , table.getn( EQTable[0] ) , 1 do
			if GetItemInfo( OwnerID() , EM_ItemPacketType_EQ ,EQTable[0][i] , EM_ItemValueType_OrgObjID ) == 0 or  GetItemInfo( OwnerID() , EM_ItemPacketType_EQ ,EQTable[0][i] , EM_ItemValueType_OrgObjID ) == nil then
				Obj:SetEQ( EQTable[0][i] , EQTable[Sub_Job][i] )
			else
				GiveBodyItem( OwnerID() , EQTable[Sub_Job][i] , 1 )
			end
		end
	else
		Tell( OwnerID() , OwnerID() ," Hey! I am a GM ! Okey ? " )
	end
end