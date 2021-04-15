
------礦坑裡的秘密


function LuaI_111749_1()	
	BeginPlot( OwnerID() , "LuaI_111749_2" , 0 )
	BeginPlot( OwnerID() , "LuaI_111749_4" , 0 )
	return true
end

function LuaI_111749_2()
	local MonA = LuaFunc_CreateObjByObj ( 101368 , TargetID() )
	AddToPartition( MonA ,    0 )
	SetAttack( MonA , OwnerID() )
	Say( MonA , "[SC_111749]" )	--文獻資料不能被奪走！	
	BeginPlot(MonA , "LuaI_111749_3" , 0 )	
end

function LuaI_111749_4()
	local MonB = LuaFunc_CreateObjByObj ( 101369 , TargetID() )
	AddToPartition( MonB ,    0 )
	SetAttack( MonB , OwnerID() )
	BeginPlot(MonB , "LuaI_111749_3" , 0 )	
end

function LuaI_111749_3()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

------------------以諾的考驗(擁有諾芙的飾品)

function LuaI_421570()
	if(CountItem ( OwnerID(), 222958 ) == 1 ) or (CountBodyItem( OwnerID(), 222958 ) == 1)  then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_421570]" , 0 )	--  你因為擁有「諾芙的飾品」，以諾在你身上感受的神力。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570]" , C_SYSTEM )
		SetFlag(OwnerID() , 542208 , 1 )
	end
end

function LuaS_203407_CHECK()
	if CheckFlag( OwnerID() , 542208 ) == true then
	 	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421570_3]" , 0 )	--  你已經獲得神的認同！！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570_3]" , C_SYSTEM )
	elseif CheckFlag( OwnerID() , 542208 ) == false then
		if CountBodyItem( OwnerID(), 203407 ) >= 1 then	-- 流水之石
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_421570_2]" , 0 )	--  你沒有可以召喚水神使者的物品！！
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421570_2]" , C_DEFAULT )
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "Something Error" , C_DEFAULT )
	end
	return false
end

function LuaS_203407_USE()


	local Monster = CreateMonsterByBOSSBatch( 101370 , TargetID() , -5 , 5 )	-- 水神使者
	SetPlot( Monster , "Dead" , "LuaS_203407_Dead" , 10 )
	SetAttack( Monster , OwnerID() )
	Say( TargetID() , "[SC_111751_1]" )				--想要得到神的認同，就打敗我來證明你的實力。
	BeginPlot( Monster , "LuaS_203407_Monster" , 0 )
	return true
end

function LuaS_203407_Monster()
	local Monster = OwnerID()
	while true do
		if ReadRoleValue( Monster , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Monster ) == true then  --檢查是否離開戰鬥
			Sleep( 10 )	-- 一秒檢查一次	
		else
			if CheckID( Monster ) == true then	DelObj( Monster )	end 
			break
		end
	end
end

function LuaS_203407_Dead()
	SetFlag( TargetID() , 542208 , 1 )
end


----------------------------判斷是否達到28級

function LuaI_110037_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 27 )and(CheckFlag( OwnerID() , 542285 )==false)then
		SetFlag(OwnerID() , 542285 , 1 )
	end
end

-----羅盤的指引

function LuaI_203431_Quest()

	GiveBodyItem( OwnerID(), 203432, 1 )
	UseItemDestroy() 		--刪除使用中的物品
	
end

----------------------------判斷是否達到38級

function LuaI_110896_Quest()
	LoadQuestOption( OwnerID() )
	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if (PLAYERLV > 37 )and(CheckFlag( OwnerID() , 542293 )==false)then
		SetFlag(OwnerID() , 542293 , 1 )
	end
end

