----------------------------製甲I
function houselearn_18()
	BeginPlot(OwnerID() , "houselearn_18_1" , 0 )
end
function houselearn_18_1()
	local average = 0.015			--/*此處設定給予的經驗值
	local bookdbid = 202726		--/*此處設定書的物件編號
	local lva = 20			--/*此處設定使用最高等級
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor )
		if ZoneID == 400 then
			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_18") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,EM_SkillValueType_MakeArmor)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
----------------------------製甲II
function houselearn_19()
	BeginPlot(OwnerID() , "houselearn_19_1" , 0 )
end
function houselearn_19_1()
	local average = 0.015			--/*此處設定給予的經驗值
	local bookdbid = 202727		--/*此處設定書的物件編號
	local lva = 40			--/*此處設定使用最高等級
	local lvb = 20			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor )
		if ZoneID == 400 then
			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_19") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,EM_SkillValueType_MakeArmor)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
----------------------------製甲III
function houselearn_20()
	BeginPlot(OwnerID() , "houselearn_20_1" , 0 )
end
function houselearn_20_1()
	local average = 0.015			--/*此處設定給予的經驗值
	local bookdbid = 202728		--/*此處設定書的物件編號
	local lva = 60			--/*此處設定使用最高等級
	local lvb = 40			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor )
		if ZoneID == 400 then
			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_20") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,EM_SkillValueType_MakeArmor)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
----製甲 4
function houselearn_58()
	BeginPlot(OwnerID() , "houselearn_58_1" , 0 )
end
function houselearn_58_1()
	local average = 0.030			--/*此處設定給予的經驗值
	local bookdbid = 240482		--/*此處設定書的物件編號
	local lva = 80			--/*此處設定使用最高等級
	local lvb = 60			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor )
		if ZoneID == 400 then
			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_58") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,EM_SkillValueType_MakeArmor)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------
----製甲 5
function houselearn_59()
	BeginPlot(OwnerID() , "houselearn_59_1" , 0 )
end
function houselearn_59_1()
	local average = 0.030			--/*此處設定給予的經驗值
	local bookdbid = 240483		--/*此處設定書的物件編號
	local lva = 100				--/*此處設定使用最高等級
	local lvb = 80				--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor )
		if ZoneID == 400 then
			if ( SkillLV <= lva and SkillLV > lvb ) then					--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_59") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,EM_SkillValueType_MakeArmor)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTSKILLLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end
--------------------------------------------------------------------------------------------------------------------------------------------