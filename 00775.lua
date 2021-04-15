------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------熟練I
function houselearn_33()
	BeginPlot(OwnerID() , "houselearn_33_1" , 0 )
end
function houselearn_33_1()
	local average = 3			--/*此處設定給予的經驗值
	local bookdbid = 202733		--/*此處設定書的物件編號
	local lva = 20			--/*此處設定使用最高等級
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502089
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Unarmed )
		if ZoneID == 400 then
--			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_33") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainWapenSkill(average*truecast/casttime,EM_SkillValueType_Unarmed)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------熟練II
function houselearn_34()
	BeginPlot(OwnerID() , "houselearn_34_1" , 0 )
end
function houselearn_34_1()
	local average = 3			--/*此處設定給予的經驗值
	local bookdbid = 202734		--/*此處設定書的物件編號
	local lva = 30			--/*此處設定使用最高等級
	local lvb = 20			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502089
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Blade )
		if ZoneID == 400 then
--			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_34") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainWapenSkill(average*truecast/casttime,EM_SkillValueType_Blade)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------熟練III
function houselearn_35()
	BeginPlot(OwnerID() , "houselearn_35_1" , 0 )
end
function houselearn_35_1()
	local average = 3			--/*此處設定給予的經驗值
	local bookdbid = 202735		--/*此處設定書的物件編號
	local lva = 40			--/*此處設定使用最高等級
	local lvb = 30			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502089
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Dagger )
		if ZoneID == 400 then
--			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_35") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
						while 1 do
							sleep( 2 );
							local CastBarStatus = CheckCastBar( OwnerID() );
							if ( CastBarStatus ~= 0 ) then 
								if ( CastBarStatus > 0) then -- 成功
									resultZ = "OKOK"
									EndCastBar( OwnerID() , CastBarStatus )
									break;
								elseif ( CastBarStatus < 0 ) then -- 失敗
									resultZ = "DAME"
									EndCastBar( OwnerID() , CastBarStatus )
									PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
									break;
								end
							end
						end
						if ( resultZ == "OKOK" ) then					--/*如果成功給予一次獎勵
							LuaFunc_HouseTrainWapenSkill(average*truecast/casttime,EM_SkillValueType_Dagger)
						end
						if ( resultZ == "DAME" ) then					--/*如果失敗結束劇情
							PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_READING_END )
							break;
						end
					else
						break
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOITEM") , 0 )	--/*你沒有書
					ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOITEM") , 0)	--/*你沒有書
					break;
				end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------