--////////////////////////////////////////////
--(已棄用)
--舊的函式會回傳目前技能已達上限的值
--這個函式和不等式配合，可以判斷玩家是否還可以獲得新技能上限資格(請往下找新版的生活技能等級配置)
--////////////////////////////////////////////
function LuaFunction_CheckLimitJob(limitLV)
--此函式需要輸入一個值 limitLV，此 limitLV 只能為 40 , 60 , 80,100 ，在此不主動判定，而由其他函式決定

	local limit_num = 0; --要傳回的數量值
	local n = 1; -- 計數器的值
	local all_job = {}; --放置所有技能上限的集合

	--此段是把玩家的技能上限放入集合之中

	all_job[1] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_BlackSmith )
	all_job[2] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Carpenter )
	all_job[3] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_MakeArmor ) 
	all_job[4] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Tailor )
	all_job[5] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Cook )
	all_job[6] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Alchemy )
	all_job[7] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Mining )
	all_job[8] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Lumbering )
	all_job[9] = ReadRoleValue ( OwnerID(), EM_RoleValue_SkillMax_Herblism )



	--END

	for n = 1, 9 do  -- 限制只跑 9 次

			if all_job[n] >= limitLV then

				 limit_num = limit_num + 1 --每獲得一個符合的等級，傳回值便增加 1
			end;

	end;
	return limit_num; -- 傳回所得到的值
end;

function LuaFunction_CheckWorkQuest( Rank )
--檢查已接或已完成的工作技能任務數量
-- Rank = 1 工匠任務檢查
-- Rank = 2 專精任務檢查
-- Rank = 3 大師任務檢查
-- Rank = 4 傳奇任務檢查
	local Count = 0
	local Quest = {}
	if Rank == 1 then
		Quest[0] = 6 
		Quest[1] = 420385 
		Quest[2] = 420386
		Quest[3] = 420387
		Quest[4] = 420388
		Quest[5] = 420389
		Quest[6] = 420390
		Quest[7] = 420391
		Quest[8] = 420392
		Quest[9] = 420392
	elseif Rank == 2 then
		Quest[0] = 3
		Quest[1] = 420394 
		Quest[2] = 420395
		Quest[3] = 420396
		Quest[4] = 420397
		Quest[5] = 420398
		Quest[6] = 420399
		Quest[7] = 420400
		Quest[8] = 420401
		Quest[9] = 420402
	elseif Rank == 3 then
		Quest[0] = 1
		Quest[1] = 420403 
		Quest[2] = 420404
		Quest[3] = 420405
		Quest[4] = 420406
		Quest[5] = 420407
		Quest[6] = 420408
		Quest[7] = 420409
		Quest[8] = 420410
		Quest[9] = 420412
--傳奇任務使用，請將任務代號置換下列數字，順序與類型無關
	elseif Rank == 4 then
		Quest[0] = 1	--傳奇：6.0.1準新增
		Quest[1] = 426158 
		Quest[2] = 426159
		Quest[3] = 426160
		Quest[4] = 426161
		Quest[5] = 426162
		Quest[6] = 426163
		Quest[7] = 426164
		Quest[8] = 426165
		Quest[9] = 426166
	else
		return false 
	end
	for i = 1 , 9 do
--		if CheckAcceptQuest( OwnerID() , Quest[i] ) == true or CheckCompleteQuest( OwnerID() , Quest[i] ) == true then
		if CheckAcceptQuest( OwnerID() , Quest[i] ) == true then

			Count = Count + 1
		end
	end
	if Count <= Quest[0] then
		return true
	else
		return false
	end

end
--////////////////////////////////
--(新的)
--代入參數：生產技能級別(Rank)，生產類或採集類(Type)
--回傳布林值，用來判斷是否還能額外學習生活技能
--因為項目很少，所以就直接分兩個區段來寫，讓更多人可以直接理解
--////////////////////////////////
function LuaFunction_IsRestrction(Rank, Type)
	local player=OwnerID();
	
	local limit_num = 0;
	local collectlimit=0;
	local makelimit=0;
	--商城道具的介入
	local mall={
		[2] = {548066, 548067, 548068};
		[3] = {548069, 548070, 548071, 548072, 548073, 548074};
		[4] = {548075, 548076, 548077, 548078, 548079, 548080, 548081};
		[5] = {548082, 548083, 548084, 548085, 548086, 548087, 548088};
	}
	--統一判斷
	local SkillNum={
		[1]	= 9,--學徒
		[2]	= 6,--工匠
		[3]	= 3,--專精
		[4]	= 2,--大師
		[5]	= 2--傳奇
	}
	for __, flag in pairs(mall[Rank]) do
		if CheckFlag(player, flag)==true then
			SkillNum[Rank] = SkillNum[Rank] + 1;
		end
	end	
	--採集系
	for t=21,23,1 do
		local index = t*100 + Rank;
		if CheckFlag(player, LifeSkills_LevelLimit[index])==true then
			limit_num = limit_num + 1;
			collectlimit = collectlimit + 1;
		end
	end
	local collectSkillNum={
		[1]	= 3,--學徒
		[2]	= 2,--工匠
		[3]	= 1,--專精
		[4]	= 1,--大師
		[5]	= 1--傳奇
	}
	for __, flag in pairs(mall[Rank]) do
		if CheckFlag(player, flag)==true then
			collectSkillNum[Rank] = collectSkillNum[Rank] + 1;
		end
	end
	if Type == "collect" then
		if collectlimit >= collectSkillNum[Rank] then
			return false;
		end
	end
	
	--生產系
	for t=15,20,1 do
		if CheckFlag(player, LifeSkills_LevelLimit[t*100 + Rank])==true then
			limit_num = limit_num + 1;
			makelimit = makelimit + 1;
		end
	end

	local makeSkillNum={
		[1]	= 6,--學徒
		[2]	= 4,--工匠
		[3]	= 2,--專精
		[4]	= 1,--大師
		[5]	= 1--傳奇
	}
	for __, flag in pairs(mall[Rank]) do
		if CheckFlag(player, flag)==true then
			makeSkillNum[Rank] = makeSkillNum[Rank] + 1;
		end
	end
	if Type == "make" then
		if makelimit >= makeSkillNum[Rank] then
			return false;
		end
	end
	--統一判斷(最後一次檢查)
	if SkillNum[Rank] <=limit_num then
		return false;
	end
	return true;
end
--//////////////////////////////////////////////
--每個npc對應的任務不同，如果逐一比對太過耗時
--這個函式可以查詢npc編號(代入參數)所擁有的任務，將任務編號回傳
--//////////////////////////////////////////////
function LuaFunction_identifyquest(orgid)--查詢對應任務
	local identify_table = {};
	--index 是npc編號,  value 是任務編號
	identify_table[110017]=420393;
	identify_table[110163]=420392;
	identify_table[110164]=420391;
	identify_table[110386]=420385;
	identify_table[110387]=420398;
	identify_table[110388]=420390;
	identify_table[110389]=420397;
	identify_table[110390]=420386;
	identify_table[110391]=420399;
	identify_table[110406]=420394;
	identify_table[110407]=420396;
	identify_table[110409]=420387;
	identify_table[110411]=420395;
	identify_table[110412]=420388;
	identify_table[110414]=420400;
	identify_table[110415]=420401;
	identify_table[110416]=420402;
	identify_table[110417]=420389;
	identify_table[110815]=420645;
	identify_table[110814]=420646;
	identify_table[110816]=420644;
	identify_table[110809]=420638;
	identify_table[110812]=420643;
	identify_table[110810]=420639;
	identify_table[110808]=420640;
	identify_table[110811]=420641;
	identify_table[110813]=420642;
	identify_table[111618]=nil;
	identify_table[111619]=nil;
	identify_table[111620]=nil;
	identify_table[115954]=420410;
	identify_table[115955]=420403;
	identify_table[115956]=420408;
	identify_table[115957]=420405;
	identify_table[115958]=420406;
	identify_table[115959]=420404;
	identify_table[115960]=420412;
	identify_table[115961]=420407;
	identify_table[115962]=420409;
	identify_table[122403]=426158;	--傳奇：6.0.1準新增
	identify_table[122404]=426159;
	identify_table[122405]=426160;
	identify_table[122406]=426161;
	identify_table[122407]=426162;
	identify_table[122408]=426163;
	identify_table[122409]=426164;
	identify_table[122410]=426165;
	identify_table[122411]=426166;
					
	--回傳任務編號
	return identify_table[orgid];
end
--//////////////////////////////////////////////
--決定佔用記憶體，去換取容易閱讀的格式
--這個「全域」Table可以取得和重要物品相關的任務
--//////////////////////////////////////////////
Global_LiveSkill_KeyQuest_pegging={
	[15]={
		[1]={keyitem=540268;quest=nil;};
		[2]={keyitem=540343;quest={420387;420640;};};
		[3]={keyitem=540352;quest={420397;};};
		[4]={keyitem=540361;quest={420410;};};
		[5]={keyitem=540369;quest={426161;};};
	};
	[16]={
		[1]={keyitem=540334;quest=nil;};
		[2]={keyitem=540344;quest={420388;420641;};};
		[3]={keyitem=540353;quest={420398;};};
		[4]={keyitem=540362;quest={420405;};};
		[5]={keyitem=540368;quest={420160;};};
	};
	[17]={
		[1]={keyitem=540335;quest=nil;};
		[2]={keyitem=540345;quest={420386;420639;};};
		[3]={keyitem=540354;quest={420396;};};
		[4]={keyitem=540363;quest={420408;};};
		[5]={keyitem=544329;quest={426163;};};
	};
	[18]={
		[1]={keyitem=540336;quest=nil;};
		[2]={keyitem=540346;quest={420389;420642;};};
		[3]={keyitem=540355;quest={420399;};};
		[4]={keyitem=540364;quest={420404;};};
		[5]={keyitem=540374;quest={426162;};};
	};
	[19]={
		[1]={keyitem=540337;quest=nil;};
		[2]={keyitem=540347;quest={420390;420643;};};
		[3]={keyitem=540356;quest={420395;};};
		[4]={keyitem=540365;quest={420406;};};
		[5]={keyitem=540373;quest={426159;};};
	};
	[20]={
		[1]={keyitem=540338;quest=nil;};
		[2]={keyitem=540348;quest={420385;420638;};};
		[3]={keyitem=540357;quest={420394;};};
		[4]={keyitem=540366;quest={420403;};};
		[5]={keyitem=540375;quest={426158;};};
	};
	[21]={
		[1]={keyitem=540269;quest=nil;};
		[2]={keyitem=540340;quest={420393;420646;};};
		[3]={keyitem=540349;quest={420402;};};
		[4]={keyitem=540358;quest={420412;};};
		[5]={keyitem=540371;quest={426166;};};
	};
	[22]={
		[1]={keyitem=540270;quest=nil;};
		[2]={keyitem=540341;quest={420392;420645;};};
		[3]={keyitem=540350;quest={420401;};};
		[4]={keyitem=540359;quest={420407;};};
		[5]={keyitem=540370;quest={426165;};};
	};
	[23]={
		[1]={keyitem=540333;quest=nil;};
		[2]={keyitem=540342;quest={420391;420644;};};
		[3]={keyitem=540351;quest={420400;};};
		[4]={keyitem=540360;quest={420409;};};
		[5]={keyitem=540372;quest={426164;};};
	};
};
--//////////////////////////////////////////////
--因為有13、14的存在，玩家可以越過任務NPC取得資格，造成任務、重要物品並存
--這個函式可以過濾所有生產升階資格相關重要物品，去除不應並存的情況
--//////////////////////////////////////////////
function lua_skill_keyitem_organize()
	local player=OwnerID();
	for skill_type=15,23,1 do
		for skill_scale=2,5,1 do
			if(CheckFlag(player,Global_LiveSkill_KeyQuest_pegging[skill_type][skill_scale].keyitem)==true)then
				--已取得資格
				for i=1,#Global_LiveSkill_KeyQuest_pegging[skill_type][skill_scale].quest,1 do
					--刪除所有任務
					if(CheckAcceptQuest(player,Global_LiveSkill_KeyQuest_pegging[skill_type][skill_scale].quest[i])==true)then
						DeleteQuest(player,Global_LiveSkill_KeyQuest_pegging[skill_type][skill_scale].quest[i]);
					end
				end
			else
				break;
			end
		end
	end
end