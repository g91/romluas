

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
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_GETFIRST]","DW_LiveSkill_LvUP", 0 )--�ڷQ��A�ǲ߳o�إͬ��ޯ�C
	else
		if CheckFlag(Obj, LifeSkills_LevelLimit[SkillType*100+5])~=true then
			AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVUP]","DW_LiveSkill_WantLvUp", 0 )--�ڷQ�ЧA���ɧڪ��ͬ��ޯ���C
		end
		if  CheckFlag(Obj, LifeSkills_LevelLimit[SkillType*100+2])==true then
			AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVDOWN]","DW_LiveSkill_WantLvDown", 0 )--�ڷQ���o�إͬ��ޯ�ثe�����
		end
	end
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--�ڷQ�ݬݧA�檺�t��C
end

function DW_LiveSkill_WantLvUp()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_LIVESKILL_UPREPEAT]"  );
	--/*�A�T�w�n���ɳo���ޯ�ܡH
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_YES]", "DW_LiveSkill_LvUP", 0 ); --/*�T�w�C
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_NO]", "DW_CloseSpeak", 0 ); --/*�ڦA�Ҽ{�ݬݡC

end

function DW_LiveSkill_WantLvDown()
	local Obj = OwnerID()
	SetSpeakDetail( Obj,"[SC_LIVESKILL_DOWNREPEAT]"  );
	--/*�ڥ��������A�A�@�����ثe�����A�A�N���h�Ӹ�����o�����šA�A�T�w�n���ܡH
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_YES]", "DW_LiveSkill_LvDown", 0 ); --/*�T�w�C
	AddSpeakOption( Obj, TargetID( ), "[SO_GETVOC_NO]", "DW_CloseSpeak", 0 ); --/*�ڦA�Ҽ{�ݬݡC
end

function DW_LiveSkill_LvUP()
	local Obj = OwnerID()
	local Target = TargetID()
	local Result = Lua_LifeSkills_LevelLimit(Target,Obj,false)
	if	Result==1	then						--���\�ǲ�
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_00]", C_YELLOW )
		CastSpell( OwnerID() , OwnerID() , 491010 )	
	elseif	Result==2	then					--�W�L��檺�ƶq����
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_03]", C_YELLOW )
	elseif	Result==3	then					--�ޯ൥�Ť���
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_04]", C_YELLOW )
	elseif	Result==0	then					--�ɮv�Q���\�оɪ���椣����
		ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_05]", C_YELLOW )
	elseif	Result==nil	then					--�ŭ�
						Say(Obj,"nil")
	else										--��_�Ǫ����p
						Say(Obj,"I don't know")
	end
	CloseSpeak(Obj)
	lua_skill_keyitem_organize();--�ư����M�ɶ����Ȩæs
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
	CloseSpeak(Obj)				--������ܵ���
	GetRecipeList(Obj,Target)		--�}�Ұt��c��
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
--�o�̩�m�u�ɤ��^���ͬ��ޯ���
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local SkillArray={
						
						
						
						[25]=EM_RoleValue_Skill_Plant				--�ش�
				}
	local SkillType = math.floor(PID/100)
	LoadQuestOption(Obj)
	if	ReadRoleValue(Obj,SkillArray[SkillType])~=0	then
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_WANTLVUP]","DW_LiveSkillSP_LvUP", 0 )--�ڷQ�ЧA���ɧڪ��ͬ��ޯ���C
	else
		AddSpeakOption(Obj,Target,"[SC_LIVESKILL_GETFIRST]","DW_LiveSkillSP_LvUP", 0 )--�ڷQ��A�ǲ߳o�إͬ��ޯ�C
	end
	if	SkillType ~=25	then
		AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--�ڷQ�ݬݧA�檺�t��C
	end
end

function DW_LiveSkillSP_LvUP()
	local Obj = OwnerID()
	local Target = TargetID()
	local PID = ReadRoleValue(Target,EM_RoleValue_PID)
	local TeachLv = PID%100
	local SkillType = math.floor(PID/100)

	CloseSpeak(Obj)													--�������
	local SkillArray={
						[21]=EM_RoleValue_Skill_Mining,
						[22]=EM_RoleValue_Skill_Lumbering,
						[23]=EM_RoleValue_Skill_Herblism,
						[25]=EM_RoleValue_Skill_Plant				--�ش�
						}
	local MySkillLv = ReadRoleValue(Obj,SkillArray[SkillType])	--�{�b���ޯ൥��
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
		if	MySkillLv<a	then									--�ޯ��٦��ǲߪŶ�
			if	CheckFlag(Obj,b)==false	then
				if	MySkillLv==a-1	then						--�p�G�w��ɯŪ��e
					SetFlag(Obj,b,1)							--�����ɯ�
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

					CastSpell( OwnerID() , OwnerID() , 491010 )	--�ɯůS��
					if	SkillType==25	then					--�شӻݭn�S����
						if	a==1	then						--�Ǯ{����
							WriteRoleValue(Obj , EM_RoleValue_MaxPlantCount , 5 )		--���ɨ�5��
						elseif	a==21	then					--�u�K����
							WriteRoleValue(Obj , EM_RoleValue_MaxPlantCount , 10 )		--���ɨ�10��
						end
					end
					--ScriptMessage( Obj, Obj, 2, "[".."SC_LIVESKILL_"..a.."]", 0 )					--��ܨ��o���
					return										--�����ɯŬy�{
				end
			end
		end
	end
	if	(MySkillLv<(20*TeachLv+1))	then
					ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_04]", C_YELLOW )		--�ڵ��о�(���Ť���)
					return	
	end
	ScriptMessage( Obj, Obj, 2, "[SC_LIVESKILL_05]", C_YELLOW )						--�W�L�оɽd��
end