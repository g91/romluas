function Cl_Black_Itemshop_Table(StringID,ZoneID) ------------溶解石
	local Shop_Table = {}
	Shop_Table[940] = {} ---測試區
	Shop_Table[940]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }	---溶解石
	Shop_Table[940]["medicinal"] = 600460							---材料藥水
	Shop_Table[940]["Weapon"] = 600461							---武器商人
	Shop_Table[940]["EquipAndArmor"] = 600462						---裝備商人
	--[[Shop_Table[940]["Formula"] = 600453						---配方商人
	Shop_Table[940]["Dungeon_Weapon"] = 600454					---副本武器商人
	Shop_Table[940]["Formula2"] = 600455							---配方商人2號(配方塞不下多一隻)]]--
	
	Shop_Table[23] = {} ---ZONE 23
	Shop_Table[23]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石
	Shop_Table[23]["medicinal"] = 600406							---材料藥水
	Shop_Table[23]["Weapon"] = 600407							---武器商人
	Shop_Table[23]["EquipAndArmor"] = 600408						---裝備商人
	Shop_Table[23]["Formula"] = 600409							---配方商人
	Shop_Table[23]["Dungeon_Weapon"] = 600410						---副本武器商人
	
	Shop_Table[24] = {} ---ZONE 24
	Shop_Table[24]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石
	Shop_Table[24]["medicinal"] = 600428							---材料藥水
	Shop_Table[24]["Weapon"] = 600429							---武器商人
	Shop_Table[24]["EquipAndArmor"] = 600430						---裝備商人
	
	Shop_Table[25] = {} ---ZONE 25
	Shop_Table[25]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[25]["medicinal"] = 600450							---材料藥水商人
	Shop_Table[25]["Weapon"] = 600451							---武器飾品商人
	Shop_Table[25]["EquipAndArmor"] = 600452						---防具商人
	Shop_Table[25]["Formula"] = 600453							---配方商人
	Shop_Table[25]["Dungeon_Weapon"] = 600454						---副本武器商人
	Shop_Table[25]["Formula2"] = 600455							---配方商人2號(配方塞不下多一隻)
	
	Shop_Table[26] = {} ---ZONE 26
	Shop_Table[26]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石
	Shop_Table[26]["medicinal"] = 600460							---材料藥水
	Shop_Table[26]["Weapon"] = 600461							---武器商人
	Shop_Table[26]["EquipAndArmor"] = 600462						---裝備商人
	Shop_Table[26]["Formula"] = 600245							---配方商人
	Shop_Table[26]["Formula2"] = 600248							---配方商人2號(配方塞不下多一隻)
	

	Shop_Table[27] = {} ---ZONE 27 先放在測試區948測試
	Shop_Table[27]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[27]["medicinal"] = 600483							---材料藥水商人
	Shop_Table[27]["Weapon"] = 600484							---武器飾品商人
	Shop_Table[27]["EquipAndArmor"] = 600485						---防具商人
	Shop_Table[27]["Formula"] = 600486							---配方商人
	Shop_Table[27]["Dungeon_Weapon"] = 600487						---副本武器商人
	Shop_Table[27]["Formula2"] = 600488							---配方商人2號


	Shop_Table[28] = {} ---ZONE 28 
	Shop_Table[28]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[28]["medicinal"] = 600507							---材料藥水商人                     
	Shop_Table[28]["Weapon"] = 600508							---武器飾品商人             
	Shop_Table[28]["EquipAndArmor"] = 600509						---防具商人
	Shop_Table[28]["Formula"] = 600510							---配方商人                 
	Shop_Table[28]["Dungeon_Weapon"] = 600511						---副本武器商人
	Shop_Table[28]["Formula2"] = 600512							---配方商人2號

	Shop_Table[29] = {} ---ZONE 29 
	Shop_Table[29]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[29]["medicinal"] = 600520							---材料藥水商人
	Shop_Table[29]["Weapon"] = 600521							---武器飾品商人           
	Shop_Table[29]["EquipAndArmor"] = 600522						---防具商人
	Shop_Table[29]["Formula"] = 600523							---配方商人                 
	Shop_Table[29]["Dungeon_Weapon"] = 600524						---副本武器商人
	Shop_Table[29]["Formula2"] = 600525							---配方商人2號

	Shop_Table[30] = {} ---ZONE 30
	Shop_Table[30]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[30]["medicinal"] = 600526							---材料藥水商人
	Shop_Table[30]["Weapon"] = 600527							---武器飾品商人                     
	Shop_Table[30]["EquipAndArmor"] = 600528						---防具商人
	Shop_Table[30]["Formula"] = 600529							---配方商人                     
	Shop_Table[30]["Dungeon_Weapon"] = 600530						---副本武器商人
	Shop_Table[30]["Formula2"] = 600531

	Shop_Table[32] = {} ---ZONE 32
	Shop_Table[32]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[32]["medicinal"] = 600560							---材料藥水商人
	Shop_Table[32]["Weapon"] = 600561							---武器飾品商人                     
	Shop_Table[32]["EquipAndArmor"] = 600562						---防具商人
	Shop_Table[32]["Formula"] = 600563							---配方商人                    
	Shop_Table[32]["Dungeon_Weapon"] = 600564						---副本武器商人
	Shop_Table[32]["Formula2"] = 600565

	Shop_Table[33] = {} ---ZONE 33
	Shop_Table[33]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[33]["medicinal"] = 600566							---材料藥水商人
	Shop_Table[33]["Weapon"] = 600567							---武器飾品商人                     
	Shop_Table[33]["EquipAndArmor"] = 600568						---防具商人
	Shop_Table[33]["Formula"] = 600569							---配方商人                    
	Shop_Table[33]["Dungeon_Weapon"] = 600570						---副本武器商人
	Shop_Table[33]["Formula2"] = 600571

	Shop_Table[34] = {} ---ZONE 34
	Shop_Table[34]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[34]["medicinal"] = 600572							---材料藥水商人
	Shop_Table[34]["Weapon"] = 600573							---武器飾品商人                     
	Shop_Table[34]["EquipAndArmor"] = 600574						---防具商人
	Shop_Table[34]["Formula"] = 600575							---配方商人                   
	Shop_Table[34]["Dungeon_Weapon"] = 600576						---副本武器商人
	Shop_Table[34]["Formula2"] = 600577

	Shop_Table[35] = {} ---ZONE 35
	Shop_Table[35]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[35]["medicinal"] = 600572							---材料藥水商人
	Shop_Table[35]["Weapon"] = 600573							---武器飾品商人                     
	Shop_Table[35]["EquipAndArmor"] = 600574						---防具商人
	Shop_Table[35]["Formula"] = 600575							---配方商人                   
	Shop_Table[35]["Dungeon_Weapon"] = 600576						---副本武器商人
	Shop_Table[35]["Formula2"] = 600577

	Shop_Table[36] = {} ---ZONE 36
	Shop_Table[36]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[36]["medicinal"] = 600572							---材料藥水商人
	Shop_Table[36]["Weapon"] = 600573							---武器飾品商人                     
	Shop_Table[36]["EquipAndArmor"] = 600574						---防具商人
	Shop_Table[36]["Formula"] = 600575							---配方商人                   
	Shop_Table[36]["Dungeon_Weapon"] = 600576						---副本武器商人
	Shop_Table[36]["Formula2"] = 600577

	Shop_Table[37] = {} ---ZONE 37
	Shop_Table[37]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[37]["medicinal"] = 600572							---材料藥水商人
	Shop_Table[37]["Weapon"] = 600573							---武器飾品商人                     
	Shop_Table[37]["EquipAndArmor"] = 600574						---防具商人
	Shop_Table[37]["Formula"] = 600575							---配方商人                   
	Shop_Table[37]["Dungeon_Weapon"] = 600576						---副本武器商人
	Shop_Table[37]["Formula2"] = 600577

	Shop_Table[38] = {} ---ZONE 38
	Shop_Table[38]["ExchangeStone"] = { 207004 , 14 , 22400 , 180 }		---溶解石商人
	Shop_Table[38]["medicinal"] = 600572							---材料藥水商人
	Shop_Table[38]["Weapon"] = 600573							---武器飾品商人                     
	Shop_Table[38]["EquipAndArmor"] = 600574						---防具商人
	Shop_Table[38]["Formula"] = 600575							---配方商人                   
	Shop_Table[38]["Dungeon_Weapon"] = 600576						---副本武器商人
	Shop_Table[38]["Formula2"] = 600577

	return Shop_Table[ZoneID][StringID]
end
--------------------以下為溶解石商人-------------------------------
function cl_Set_ExchangeStone_shop()
	LoadQuestOption( OwnerID() )
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]", "cl_ExchangeStone_open", 0 )
end
function cl_ExchangeStone_open()
	CloseSpeak( OwnerID() )
	BeginPlot( OwnerID() ,"cl_Hsiang_ExchangeStone",0)
end
function cl_Hsiang_ExchangeStone()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "ExchangeStone" , ZoneID )
	OpenMagicStoneShop( Shop_Table[1] , Shop_Table[2] , Shop_Table[3] , Shop_Table[4] )
end
------------藥水材料配方商人-----------------
function cl_medicinal_Beginshop() 
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_medicinal_SetShop()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "medicinal" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end
--------武器商人-----------------
function cl_Weapon_Beginshop() 
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_Weapon_SetShop()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "Weapon" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end
-----裝備商人---------------
function cl_EquipAndArmor_Beginshop()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_EquipAndArmor_SetShop()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "EquipAndArmor" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end
------配方商人------------
function cl_Formula_Beginshop()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_Formula_SetShop()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "Formula" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end
------配方商人2------------
function cl_Formula_Beginshop2()
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID( ), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_Formula_SetShop2()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "Formula2" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end
---副本武器商人------------
function cl_Dungeon_Weapon_Beginshop() 
	LoadQuestOption( OwnerID() );
	AddSpeakOption( OwnerID(), TargetID(), "[SO_WANTBUY]" , "LuaS_ComShop_1", 0 )
end
function cl_Dungeon_Weapon_SetShop()
	local OwnerID = OwnerID()
	local ZoneID = ReadRoleValue ( OwnerID , EM_RoleValue_ZoneID )
	local Shop_Table = Cl_Black_Itemshop_Table( "Dungeon_Weapon" , ZoneID )
	SetMinimapIcon ( OwnerID, EM_MapIconType_Weapon )
	SetShop( OwnerID , Shop_Table , "Test_Shop_Close" )
end