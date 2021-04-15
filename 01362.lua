--這下不妙了！
--任務編號 422294
--怪物 史波法師 編號 101933
--物品編號 史波法師的蘑菇粉 204625
--物品編號 挖掘工具 204624
function LuaI_204624_Check()
	if CheckAcceptQuest( OwnerID() , 422294 ) == false or CountBodyItem( OwnerID() , 204625 ) >= 6 then
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_0]" , 0 ) --你目前不需要採集204625
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_0]" , 0 )
			return false
	end
	local npc = ReadRoleValue(TargetID() , EM_RoleValue_OrgID)
	if npc == 101933 then
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			if CheckFlag( TargetID() , 542497 ) == true then
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_ALREADY_USED]" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_ALREADY_USED]" , 0 )
				return false
			end
			return true
		else
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_1]" , 0 ) --[101933]對你的行為十分生氣
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_1]" , 0 )	
			SetAttack( TargetID() , OwnerID() )
			return false
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204624_2]" , 0 ) --目標錯誤
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204624_2]" , 0 )	
		return false
	end
end
function LuaI_204624_USE()
	if CheckFlag( TargetID() , 542497 ) == false then
		GiveBodyItem( OwnerID(), 204625, 1 )
		SetFlag( TargetID() , 542497 , 1 )
	end
end


--恐怖的麻痺菇
--任務編號 422293
--香菇物件編號 112891
--旗標編號 780359
function LuaQ_Complete_422293()
	--標編號 780359，旗子編號要從0開始，中間不可以跳號
	DisableQuest( OwnerID() , true )
	sleep( 20 )
	Say( OwnerID() , "[SC_422293_0]" ) --「奇怪？我的身體還是動不了......」
	sleep( 30 )
	local Count = GetMoveFlagCount(780359)
	local obj = {}
	for i = 0 , Count-1 , 1 do
		sleep( Rand(5) + 1 )
		obj[i] = CreateObjByFlag( 112891 , 780359 , i , 1 )
		Lua_ObjDontTouch( Obj[i] ) 
		AddToPartition( Obj[i] , 0 )
		WriteRoleValue( Obj[i] , EM_RoleValue_LiveTime , 15 )
	end
	Say( OwnerID() , "[SC_422293_1]" ) --「這是什麼？噢～不～我的身體怎麼會長出蘑菇來！」
	DisableQuest( OwnerID() , false )
end