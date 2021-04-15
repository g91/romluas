function LuaI_coboStr_00()                                                                                                 --庫柏馴獸師劇情

                SetPlot( OwnerID(),"range","LuaI_coboStr_01",200 )                                         --範圍內觸發

end

function LuaI_coboStr_01()

	SetPlot( TargetID(),"range","",0 )                                                                     --給一個空個function，取消再次觸發範圍劇情的可能。                                                                 
	BeginPlot( TargetID() , "LuaI_coboStr_02" , 0 )                                                   --命令指定角色呼叫 Script
end





function LuaI_coboStr_02()



	local CoStrID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100913, 200 , 1)       --判斷周圍的某隻怪物的矩陣位置 庫柏力士

	local CoDrID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100914, 200 , 1)       --判斷周圍的某隻怪物的矩陣位置 庫柏祕醫

	local CoMagicID = LuaFunc_SearchNPCbyOrgID(OwnerID(), 100636, 200 , 1)       --判斷周圍的某隻怪物的矩陣位置 庫柏法師

                SetAttack( CoStrID[0], TargetID() )
                SetAttack( CoStrID[1], TargetID() )
                SetAttack( CoMagicID[0], TargetID() )


	local HP1 = 0                                                                                                          --宣告 HP 這個數值
	local HP2 = 0                                                                                                          --宣告 HP 這個數值
	local strMaxHP = ReadRoleValue( CoStrID[0], EM_RoleValue_MaxHP )              --宣告怪物的最大HP
	local NowHP = strMaxHP * 0.7                                                                                 --宣告 helfHP 等於最大HP的一半

		HP1 = ReadRoleValue( CoStrID[0], EM_RoleValue_HP )                    -- 檢查角色目前HP的殘量
		HP2 = ReadRoleValue( CoStrID[1], EM_RoleValue_HP )                    -- 檢查角色目前HP的殘量


	while true do
		sleep(10)

		if HP1 < NowHP   or    HP2 < NowHP     then                                                                              -- 若HP低於多少血量

                               CastSpell( CoDrID[0]  , CoStrID[0] , 490654)                                                              --施放法術(施法者,對象id,法術id) 
                               CastSpell( CoDrID[2]  , CoStrID[1] , 490654)                                                              --施放法術(施法者,對象id,法術id) 


			break
		end	
	end
end