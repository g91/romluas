
-----在名單上簽署名字

function LuaI_203376_Quest()

	GiveBodyItem( OwnerID(), 203377, 1 )
	UseItemDestroy() 		--刪除使用中的物品
	
end

-----埋葬基特‧路德隊長的徽章

function LuaS_203504()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111680 , 44 )
	--local OBJ = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJ == 111680 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203504]" , 0 )	--  這附近沒有基特‧路德隊長的墳墓！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203504]" , C_SYSTEM )	
		return false
	end
end

function LuaS_203504_1()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111680 , 44 )
	local MonsterA = LuaFunc_CreateObjByObj ( 101434 , Tomb )
	AddToPartition( MonsterA ,    0 )
	SetAttack( MonsterA , OwnerID() )
	SetFlag(OwnerID() , 542252 , 1 )
	BeginPlot(MonsterA , "LuaS_203504_2" , 0 )
	UseItemDestroy() 
end

function LuaS_203504_2()
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




-----埋葬羅傑艾爾隊長的徽章

function LuaS_203505()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111689 , 44 )
	--local OBJB = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	--if OBJB == 111689 then
	--Say(OwnerID() , Tomb )
	if Tomb ~= -1 then
		return true
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203505]" , 0 )	--  這附近沒有羅傑艾爾隊長的墳墓！
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203505]" , C_SYSTEM )
		return false
	end
end

function LuaS_203505_1()
	local Tomb = LuaFunc_SearchNPCbyOrgID( OwnerID() , 111689 , 44 )
	local MonsterB = LuaFunc_CreateObjByObj ( 101435 , Tomb )
	AddToPartition( MonsterB ,    0 )
	SetAttack( MonsterB , OwnerID() )
	SetFlag(OwnerID() , 542253 , 1 )
	BeginPlot(MonsterB , "LuaS_203505_2" , 0 )	
	UseItemDestroy()
end

function LuaS_203505_2()
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

-----薩倫德的信

function LuaI_203387_Quest()

	local PLAYERLV = ReadRoleValue( OwnerID() , EM_RoleValue_Lv )
	if PLAYERLV < 18 then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_203387]" , 0 )	--未達該物品使用等級，需到達等級18才能開啟。	
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_203387]" , C_SYSTEM )	
	else
		ClearBorder( OwnerID());	--初始化石碑介面
		AddBorderPage( OwnerID(), GetQuestDetail( 421559, 1 ));
		ShowBorder( OwnerID(), 421559, "[203387]", "ScriptBorder_Texture_Paper" )	
	end
end



