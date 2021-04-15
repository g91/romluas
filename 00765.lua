------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------採集大全
function houselearn_10()
	BeginPlot(OwnerID() , "houselearn_10_1" , 0 )
end
function houselearn_10_1()
	local average = 0.25			--/*此處設定給予的經驗值
	local bookdbid = 202705		--/*此處設定書的物件編號
	local lva = 60			--/*此處設定使用最高等級
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502086
	while 1 do
	local resultZ = "";
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local SkillLV = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Herblism )
	local SkillLV1 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Lumbering )
	local SkillLV2 = ReadRoleValue(OwnerID(), EM_RoleValue_Skill_Mining )
		if ZoneID == 400 then
			if ( SkillLV > lvb or SkillLV1 > lvb or SkillLV2 > lvb) then				--/*判斷等級
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_10") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
							LuaFunc_HouseTrainRandMLH(average*truecast/casttime)
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
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_3") , 0 )	--/*你必須學會三種採集技能才能閱讀此書
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_3") , 0 )	--/*你必須學會三種採集技能才能閱讀此書
				break;
			end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------武器應用大全
function houselearn_11()
	BeginPlot(OwnerID() , "houselearn_11_1" , 0 )
end
function houselearn_11_1()
	local average = 3			--/*此處設定給予的經驗值
	local bookdbid = 202732		--/*此處設定書的物件編號
	local lva = 60			--/*此處設定使用最高等級     由於是武器熟練度的物品 不適用於等級限制 請忽略此行 
	local lvb = 0			--/*此處設定使用不可低於等級
	local casttime = 600			--/*此處設定對照施法時間
	local truecast = 60			--/*此處設定真實施法時間
	local BookMagicID = 502089
	while 1 do
	local resultZ = "";
	local skill = ""
	local Obj = Role:new( OwnerID() );
	local ZoneID = Obj:ZoneID() -1000*math.floor(Obj:ZoneID() / 1000 )
	local PlayerLV = ReadRoleValue(OwnerID(), EM_RoleValue_LV  )  --主職等級
		if ZoneID == 400 then
	--		if  ( PlayerLV <= lva and PlayerLV >= lvb ) then	--/*在可以的等級區間內
				if CountBodyItem( OwnerID() , bookdbid ) >= 1 then			--/* 判斷是否有書
					AddBuff( OwnerID() , BookMagicID , 1 , -1 )		--使用書
					if BeginCastBar( OwnerID(), GetString("SC_BOOKCAST_11") , truecast , ruFUSION_ACTORSTATE_READING_LOOP , ruFUSION_ACTORSTATE_READING_LOOP , 0 ) == 1 then	--/*開始施法
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
						local x = Rand( 13 ) + 1					--/*暫時關閉長柄武器與槍的rand打開時需要把rand改為15
							if x == 1 then
								skill = EM_SkillValueType_Unarmed
							elseif x == 2 then
								skill = EM_SkillValueType_Blade
							elseif x == 3 then
								skill = EM_SkillValueType_Dagger
							elseif x == 4 then
								skill = EM_SkillValueType_Wand
							elseif x == 5 then
								skill = EM_SkillValueType_Axe
							elseif x == 6 then
								skill = EM_SkillValueType_Bludgeon
							elseif x == 7 then
								skill = EM_SkillValueType_Claymore
							elseif x == 8 then
								skill = EM_SkillValueType_Staff
							elseif x == 9 then
								skill = EM_SkillValueType_2H_Axe
							elseif x == 10 then
								skill = EM_SkillValueType_2H_Hammer
							elseif x == 11 then
								skill = EM_SkillValueType_Bow
							elseif x == 12 then
								skill = EM_SkillValueType_CossBow
							elseif x == 13 then
								skill = EM_SkillValueType_Define
	--						elseif x == 14 then
	--							skill = EM_SkillValueType_Gun
	--						elseif x == 15 then
	--							skill = EM_SkillValueType_Polearm
							end
							LuaFunc_HouseTrainWapenSkill(average*truecast/casttime,skill)
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
	--		else
	--			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
	--			ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTRIGHTLV_1") , 0 )	--/*你的等級似乎不能閱讀此書
	--			break;
	--		end
		else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_NOTINHOUSE") , 0 )	--/*你不在房屋內
				break;
		end
	end
end