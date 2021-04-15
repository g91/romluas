------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------製造百科全書大全I
function houselearn_30()
	BeginPlot(OwnerID() , "houselearn_30_1" , 0 )
end
function houselearn_30_1()
	local average = 0.15			--/*此處設定給予的經驗值
	local bookdbid = 202729		--/*此處設定書的物件編號
	local lva = 60			--/*此處設定使用最高等級
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502088
	while 1 do
	local resultZ = "";
	local skill = ""
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_BlackSmith)
	local SkillLV1 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Carpenter)
	local SkillLV2 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_MakeArmor)
	local SkillLV3 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Tailor)
	local SkillLV4 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Cook)
	local SkillLV5 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Alchemy)
		if ZoneID == 400 then
			if ( SkillLV > lvb and SkillLV1 > lvb and SkillLV2 > lvb and SkillLV3 > lvb and SkillLV4 > lvb and SkillLV5 > lvb ) then--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_30") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
						local x = Rand( 6 ) + 1
							if x == 1 then
								skill = EM_SkillValueType_BlackSmith
							elseif x == 2 then
								skill = EM_SkillValueType_Carpenter
							elseif x == 3 then
								skill = EM_SkillValueType_MakeArmor
							elseif x == 4 then
								skill = EM_SkillValueType_Tailor
							elseif x == 5 then
								skill = EM_SkillValueType_Cook
							elseif x == 6 then
								skill = EM_SkillValueType_Alchemy
							end
							LuaFunc_HouseTrainLiveSkill(average*truecast/casttime,skill)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end