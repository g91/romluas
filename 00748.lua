function LuaS_111284_0()  --聖火使者
	Discowood_FireHour = 0--宣告全域變數!!!!
	Discowood_FireMin = 0

	local FireCup = CreateObjByFlag( 111283, 780079 , 0 , 1 )
	AddToPartition( FireCup ,    0 )	--加進舞台
	BeginPlot ( FireCup , "LuaI_B2Door_Zone2A_6" , 0 )
end

function LuaS_111284_4()
	LoadQuestOption(OwnerID())
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_8") , "LuaS_111284_6", 0 ) --玩家選項:怎麼取得聖火徽章？
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_7") , "LuaS_PlotDelay", 0 ) --玩家選項 我想進
	AddSpeakOption ( OwnerID(), TargetID( ), GetString("SC_111284_13") , "LuaS_111284_7", 0 ) --玩家選項 什麼時候開放？
end
function LuaS_PlotDelay()
	CloseSpeak(OwnerID())
	BeginPlot(OwnerID() , "LuaS_111284_5" , 0 )
end

function LuaS_111284_5()
		hour = GetSystime(1)
		min = GetSystime(2)

		if 	Discowood_FireHour ~= nil and
			Discowood_FireMin ~= nil then
			if 	Discowood_FireHour == 0 and
				Discowood_FireMin == 0 then
			else
				hour = GetSystime(1) + Discowood_FireHour
				min = GetSystime(2) + Discowood_FireMin

				if hour >23 then
					hour = hour - 24
				end

				if min > 59 then
					min = min - 60
				end
			end
		end
---------------------
	if 	( hour > 11 and min < 40 ) or
		CountBodyItem(OwnerID() , 202799 ) > 0 then

		if CountBodyItem(OwnerID() , 200392) > 2 then
			local where = Rand(3) + 1
			if where == 1 then
				if 	CastSpell( OwnerID() , OwnerID() , 491284 ) then--施法
					sleep(10)--等待

					if	CastSpell( OwnerID() , OwnerID() , 491273 ) then--施法
						sleep(10)

						if 	ChangeZone( OwnerID(), 200 , 0, 522 , 455 , 1087 , 3) then--傳送
							local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
							local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
							DesignLog(OwnerID(),200,"..last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
							DelBodyItem( OwnerID() , 200392 , 3) --刪除物品
						else
							ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
						end
					end
				end
			elseif where == 2 then
				if 	CastSpell( OwnerID() , OwnerID() , 491284 ) then--施法
					sleep(10)--等待

					if	CastSpell( OwnerID() , OwnerID() , 491273 ) then--施法
						sleep(10)

						if 	ChangeZone( OwnerID(), 200 , 0, 1130.6 , 451 , 1122 , 3) then--傳送
							local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
							local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
							DesignLog(OwnerID(),200,"..last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
							DelBodyItem( OwnerID() , 200392 , 3) --刪除物品
						else
							ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
						end
					end
				end
			else
				if 	CastSpell( OwnerID() , OwnerID() , 491284 ) then--施法
					sleep(10)--等待

					if	CastSpell( OwnerID() , OwnerID() , 491273 ) then--施法
						sleep(10)

						if 	ChangeZone( OwnerID(), 200 , 0, 763.6 , 460 , 718.1 , 311) then--傳送
							local PlayerLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV )					--取得玩家等級
							local PlayerSUBLV = ReadRoleValue( OwnerID() , EM_RoleValue_LV_SUB )				--取得玩家副職等級
							DesignLog(OwnerID(),200,"..last enter Player Lv is "..PlayerLV.." and SubLv is "..PlayerSUBLV)	--紀錄進入人次
							DelBodyItem( OwnerID() , 200392 , 3) --刪除物品
						else
							ScriptMessage( OwnerID(), OwnerID(), 0, "[WARRING_ZONE_NOT_OPEN]", 0 );
						end
					end
				end
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111284_12"), 0 ) --聖火徽章數量不足
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_111284_11"), 0 ) --否定時間
	end
end

function LuaS_111284_6()
	SetSpeakDetail ( OwnerID(), GetString ( "SC_111284_9" )   )--如果你取得了火..........
end

function LuaS_111284_7()
	SetSpeakDetail ( OwnerID(), GetString ( "SC_111284_6" )   )--開放時間
end


function Refer_Discowood_FireTime()
	Say(OwnerID(), Discowood_FireHour )
	Say(OwnerID(), Discowood_FireMin )
end

function Reset_Discowood_FireTime()
	Discowood_FireHour = 0
	Discowood_FireMin = 0
end

function Set_Discowood_FireHour(hour)
	Discowood_FireHour = hour
end

function Set_Discowood_FireMin(min)
	Discowood_FireMin = min
end

