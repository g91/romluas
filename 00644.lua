function LuaS_110970()--第一階
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--說明劇情
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110970_0", 0 ) --玩家選項：讓我助你一臂之力
end

function LuaS_110971()--第二階
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--說明劇情
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110971_0", 0 ) --玩家選項：讓我助你一臂之力
end

function LuaS_110972()--第三階
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--說明劇情
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110972_0", 0 ) --玩家選項：讓我助你一臂之力
end

function LuaS_110973()--第四階
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--說明劇情
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110973_0", 0 ) --玩家選項：讓我助你一臂之力
end

function LuaS_110974()--第五階
	SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_00" )   )--說明劇情
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("EM_110970") , "LuaS_110974_0", 0 ) --玩家選項：讓我助你一臂之力
end

function LuaS_110970_0()--第一階
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--計算Queue有幾格
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--計算背包有幾個空位
	if sub then
		if (sub>14) and (lv>14) then
			if CountBodyItem( OwnerID(), 201893)==0 then
				if CountBodyItem( OwnerID(), 201894)==0 then
					if CountBodyItem( OwnerID(), 201895)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201893, 1 ) --給他起始允許
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--叫玩家清空背包
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_0" )   )--叫玩家具備第二項才能的時候來找他
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_0" )   )--叫玩家具備第二項才能的時候來找他
	end
end

function LuaS_110971_0()--第二階
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--計算Queue有幾格
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--計算背包有幾個空位
	if sub then
		if (sub>19) and (lv>19) then
			if CountBodyItem( OwnerID(), 201896)==0 then
				if CountBodyItem( OwnerID(), 201897)==0 then
					if CountBodyItem( OwnerID(), 201898)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201896, 1 ) --給他起始允許
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--叫玩家清空背包
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_1" )   )--叫玩家具備第二項才能的時候來找他
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_1" )   )--叫玩家具備第二項才能的時候來找他
	end
end


function LuaS_110972_0()--第三階
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--計算Queue有幾格
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--計算背包有幾個空位
	if sub then
		if (sub>24) and (lv>24) then
			if CountBodyItem( OwnerID(), 201899)==0 then
				if CountBodyItem( OwnerID(), 201900)==0 then
					if QueueOfBag == 0 and SpaceOfBag > 0 then
						GiveBodyItem( OwnerID(), 201899, 1 ) --給他起始允許
						LoadQuestOption(OwnerID())
					else
						SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--叫玩家清空背包
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_2" )   )--叫玩家具備第二項才能的時候來找他
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_2" )   )--叫玩家具備第二項才能的時候來找他
	end

end



function LuaS_110973_0()--第四階
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--計算Queue有幾格
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--計算背包有幾個空位
	if sub then
		if (sub>29) and (lv>29) then
			if CountBodyItem( OwnerID(), 201901)==0 then
				if CountBodyItem( OwnerID(), 201902)==0 then
					if CountBodyItem( OwnerID(), 201903)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201901, 1 ) --給他起始允許
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--叫玩家清空背包
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_3" )   )--叫玩家具備第二項才能的時候來找他
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_3" )   )--叫玩家具備第二項才能的時候來找他
	end
end



function LuaS_110974_0()--第五階
	local sub= voc_lv( ReadRoleValue(OwnerID() , EM_RoleValue_VOC_SUB ) , OwnerID() )
	local lv =ReadRoleValue(OwnerID(),EM_RoleValue_LV)
	local QueueOfBag = QueuePacketCount( OwnerID() )	--計算Queue有幾格
	local SpaceOfBag = EmptyPacketCount( OwnerID() )	--計算背包有幾個空位
	if sub then
		if (sub>34) and (lv>34) then
			if CountBodyItem( OwnerID(), 201904)==0 then
				if CountBodyItem( OwnerID(), 201905)==0 then
					if CountBodyItem( OwnerID(), 201906)==0 then
						if QueueOfBag == 0 and SpaceOfBag > 0 then
							GiveBodyItem( OwnerID(), 201904, 1 ) --給他起始允許
							LoadQuestOption(OwnerID())
						else
							SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_5" )   )--叫玩家清空背包
						end
					else
						LoadQuestOption(OwnerID())
					end
				else
					LoadQuestOption(OwnerID())
				end
			else
				LoadQuestOption(OwnerID())
			end
		else
			SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_4" )   )--叫玩家具備第二項才能的時候來找他
		end
	else
		SetSpeakDetail ( OwnerID(), GetString ( "EM_110970_4" )   )--叫玩家具備第二項才能的時候來找他
	end

end