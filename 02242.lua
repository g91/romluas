

function LuaS_117032_0()
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local SkillArray={
				[15]=EM_RoleValue_SkillMax_BlackSmith,
				[16]=EM_RoleValue_Skill_Carpenter,
				[17]=EM_RoleValue_Skill_MakeArmor,
				[18]=EM_RoleValue_Skill_Tailor,
				[19]=EM_RoleValue_Skill_Cook,
				[20]=EM_RoleValue_Skill_Alchemy,
				[21]=EM_RoleValue_Skill_Mining,
				[22]=EM_RoleValue_Skill_Lumbering,
				[23]=EM_RoleValue_Skill_Herblism
				
				}
	local SkillType = math.floor(PID/100)
	LoadQuestOption(Obj)
	local Skill_Level=ReadRoleValue(Obj,SkillArray[SkillType]);
	if	Skill_Level==0	then
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_GETFIRST]","DW_LiveSkill_LvUP", 0 )--我想跟你學習這種生活技能。
	else
		if CheckFlag(Obj, LifeSkills_LevelLimit[SkillType*100+5])~=true then
			AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVUP]","DW_LiveSkill_WantLvUp", 0 )--我想請你提升我的生活技能資格。
		end
		if  CheckFlag(Obj, LifeSkills_LevelLimit[SkillType*100+2])==true then
			AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVDOWN]","DW_LiveSkill_WantLvDown", 0 )--我想放棄這種生活技能目前的資格
		end
	end
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。
end

function DW_LiveSkill_WantLvUp()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_LIVESKILL_UPREPEAT]"  );
	--/*你確定要提升這項技能嗎？
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_YES]", "DW_LiveSkill_LvUP", 0 ); --/*確定。
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_NO]", "DW_CloseSpeak", 0 ); --/*我再考慮看看。

end

function DW_LiveSkill_WantLvDown()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_LIVESKILL_DOWNREPEAT]"  );
	--/*我必須提醒你，一旦放棄目前的資格，你將失去該資格所獲得的等級，你確定要放棄嗎？
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_YES]", "DW_LiveSkill_LvDown", 0 ); --/*確定。
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_NO]", "DW_CloseSpeak", 0 ); --/*我再考慮看看。
end

function DW_LiveSkill_LvUP()
	local Obj = OwnerID()
	local Target = TargetID()
	local Result = Lua_LifeSkills_LevelLimit(Target,Obj,false)
	if	Result==1	then						--成功學習
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_00]", C_YELLOW )
		CastSpell( OwnerID() , OwnerID() , 491010 )	
	elseif	Result==2	then					--超過資格的數量限制
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_03]", C_YELLOW )
	elseif	Result==3	then					--技能等級不夠
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_04]", C_YELLOW )
	elseif	Result==0	then					--導師被允許教導的資格不夠高
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_05]", C_YELLOW )
	elseif	Result==nil	then					--空值
						Say(Obj,"nil")
	else										--更奇怪的狀況
						Say(Obj,"I don't know")
	end
	CloseSpeak(Obj)
	lua_skill_keyitem_organize();--排除資格和升階任務並存
end

function DW_LiveSkill_LvDown()
	local Obj = OwnerID()
	local Target = TargetID()
	ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_06]", C_YELLOW )
	Lua_LifeSkills_Demote( Target, Obj )
	CloseSpeak(Obj)
end

function DW_OpenRecipeList()
	local Obj = OwnerID()
	local Target = TargetID()
	CloseSpeak(Obj)				--關閉對話視窗
	GetRecipeList(Obj,Target)		--開啟配方販賣
end

function BasicRecipe_BlackSmith()
	Lua_110409_RecipeList_Init()
	Lua_110389_RecipeList_Init()
end

function BasicRecipe_MakeArmor()
	Lua_110390_RecipeList_Init()
	Lua_110407_RecipeList_Init()
end

function BasicRecipe_Cloth()
	Lua_110417_RecipeList_Init()
	Lua_110391_RecipeList_Init()
end

function BasicRecipe_Wood()
	Lua_110412_RecipeList_Init()
	Lua_110811_RecipeList_Init()
end

function BasicRecipe_Cook()
	Lua_110388_RecipeList_Init()
	Lua_110411_RecipeList_Init()
end

function BasicRecipe_Water()
	Lua_110386_RecipeList_Init()
	Lua_110406_RecipeList_Init()
end


function DW_LiveSkillSP_Talk()
--這裡放置只升不回的生活技能對話
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local SkillArray={
						
						
						
						[25]=EM_RoleValue_Skill_Plant				--種植
				}
	local SkillType = math.floor(PID/100)
	LoadQuestOption(Obj)
	if	ReadRoleValue(Obj,SkillArray[SkillType])~=0	then
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVUP]","DW_LiveSkillSP_LvUP", 0 )--我想請你提升我的生活技能資格。
	else
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_GETFIRST]","DW_LiveSkillSP_LvUP", 0 )--我想跟你學習這種生活技能。
	end
	if	SkillType ~=25	then
		AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。
	end
end

function DW_LiveSkillSP_LvUP()
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local TeachLv = PID%100
	local SkillType = math.floor(PID/100)

	CloseSpeak(Obj)													--結束對話
	local SkillArray={
						[21]=EM_RoleValue_Skill_Mining,
						[22]=EM_RoleValue_Skill_Lumbering,
						[23]=EM_RoleValue_Skill_Herblism,
						[25]=EM_RoleValue_Skill_Plant				--種植
						}
	local MySkillLv = ReadRoleValue(Obj,SkillArray[SkillType])	--現在的技能等級
	local SkillLvFlag={
						[21]={[1]=540269, [21]=540340, [41]=540349},
						[22]={[1]=540270, [21]=540341, [41]=540350},
						[23]={[1]=540333, [21]=540342, [41]=540351},
						[25]={[1]=542886, [21]=542887, [41]=542888, [61]=542889}
						}

	
	local Remind = {
						[21]={
								[1]="MSG_GET_MINE_1"	,
								[2]="MSG_GET_MINE_1_D"	,
								[3]=540376,
								[4]="MSG_GET_FORMULA_MINE_1"
									},
						[22]={
								[1]="MSG_GET_WOOD_1"	,
								[2]="MSG_GET_WOOD_1_D"	,
								[3]=540648,
								[4]="MSG_GET_FORMULA_WOOD_1"
									},
						[23]={
								[1]="MSG_GET_HERB_1"	,
								[2]="MSG_GET_HERB_1_D"	,
								[3]=540661,
								[4]="MSG_GET_FORMULA_HERB_1"
									},
						[25]={
								[1]="SC_PLANT_09"	,
								[2]="SC_PLANT_10"	
									}
										}
	

	local Result = nil
	for a,b in pairs(SkillLvFlag[SkillType])	do
		if	MySkillLv<a	then									--技能還有學習空間
			if	CheckFlag(Obj,b)==false	then
				if	MySkillLv==a-1	then						--如果已到升級門檻
					SetFlag(Obj,b,1)							--給予升級
					if	MySkillLv ==0	then
						ScriptMessage( Obj, Obj, 2, "["..Remind[SkillType][1].."]" , 0 )
						ScriptMessage( Obj, Obj, 0, "["..Remind[SkillType][2].."]" , 0 )
						if	Remind[SkillType][3]~=nil	then
							SetFlag(Obj,Remind[SkillType][3],1)
						end
						if	Remind[SkillType][4]~=nil	then
							ScriptMessage( Obj, Obj, 0, "["..Remind[SkillType][4].."]" , C_YELLOW )
						end
					end

					CastSpell( OwnerID() , OwnerID() , 491010 )	--升級特效
					if	SkillType==25	then					--種植需要特殊提升
						if	a==1	then						--學徒階級
							WriteRoleValue(Obj , EM_RoleValue_MaxPlantCount , 5 )		--提升到5盆
						elseif	a==21	then					--工匠階級
							WriteRoleValue(Obj , EM_RoleValue_MaxPlantCount , 10 )		--提升到10盆
						end
					end
					--ScriptMessage( Obj, Obj, 2, "[".."SC_LIVESKILL_"..a.."]", 0 )					--顯示取得資格
					return										--結束升級流程
				end
			end
		end
	end
	if	(MySkillLv<(20*TeachLv+1))	then
					ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_04]", C_YELLOW )		--拒絕教導(等級不足)
					return	
	end
	ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_05]", C_YELLOW )						--超過教導範圍
end