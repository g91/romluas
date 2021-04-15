--登入角色，根據初始選擇的主職，給予指定旗標
function DW_SetOccupationFlag()
	local Obj = OwnerID();
	local Job = ReadRoleValue( Obj , EM_RoleValue_VOC );
	if	Job==0 or Job >8	then
		return;
	end
	for i=0,7,1 do
		if	CheckFlag(Obj,540811+i)==true	then
			return;
		end
		if	i==7	then
			SetFlag( Obj , 540811+Job-1 , 1 );
		end
	end
end

function SuitSkillEqEvent(SkillID,Type) ----套裝技能執行被動技用( SkillID: 法術ID . Type: 0設定, 1取消 )
--2014/12/10 YoYo：改為由程式端來執行套裝技能被動技的機制
--	if SuitSkillFunction[SkillID] ~= nil then
--		SuitSkillFunction[SkillID](Type)
--	end
end

function SuitSKillEqFunctionInit() ----套裝技能註冊編號處
	SuitSkillFunction = {}
	SuitSkillFunction[495476]  = SuitSkill495476 --戰士--武裝防備
	SuitSkillFunction[495560]  = SuitSkill495560 --遊俠套裝--迅敏意志
	SuitSkillFunction[496104]  = SuitSkill496104 --遊俠--獵者優勢
	SuitSkillFunction[497911]  = SuitSkill497911 --遊俠--專注擁護者
	SuitSkillFunction[497913]  = SuitSkill497913 --法師--智者
	SuitSkillFunction[495718]  = SuitSkill495718 --騎士--尊榮鬥士
	SuitSkillFunction[496091]  = SuitSkill496091 --騎士--暴君
	SuitSkillFunction[498343]  = SuitSkill498343 --騎士--無雙反噬
	SuitSkillFunction[495487]  = SuitSkill495487 --森林牧者--寵物大師
	SuitSkillFunction[498344]  = SuitSkill498344 --森林牧者--協定契約
	SuitSkillFunction[850876]  = SuitSkill850876 --符文工匠--動力升級
end

---------------戰士---------------
function SuitSkill495476( Type )---戰士--武裝防備
	if Type == 0 then
		AddBuff(OwnerID() , 506450 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506450) == true then 
			Cancelbuff(OwnerID(),506450)
		end
	end
end

---------------遊俠---------------
function SuitSkill495560( Type )---遊俠套裝--迅敏意志
	if Type == 0 then
		AddBuff(OwnerID() , 506523 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506523) == true then 
			Cancelbuff(OwnerID(),506523)
		end
	end
end
function SuitSkill496104( Type )---遊俠--獵者優勢
	if Type == 0 then
		AddBuff(OwnerID() , 508528 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 508528) == true then 
			Cancelbuff(OwnerID(), 508528)
		end
	end
end
function SuitSkill497911( Type )---遊俠--專注擁護者
	if Type == 0 then
		AddBuff(OwnerID() , 620115 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620115) == true then 
			Cancelbuff(OwnerID(), 620115)
		end
	end
end

---------------法師---------------
function SuitSkill497913( Type )---法師--智者
	if Type == 0 then
		AddBuff(OwnerID() , 620117 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620117) == true then 
			Cancelbuff(OwnerID(), 620117)
		end
	end
end

---------------騎士---------------
function SuitSkill495718( Type )---騎士--尊榮鬥士
	if Type == 0 then
		AddBuff(OwnerID() , 506871 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506871) == true then 
			Cancelbuff(OwnerID(), 506871)
		end
	end
end
function SuitSkill496091( Type )---騎士--暴君
	if Type == 0 then
		AddBuff(OwnerID() , 507488 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 507488) == true then 
			Cancelbuff(OwnerID(), 507488)
		end
	end
end
function SuitSkill498343( Type )---騎士--無雙反噬
	if Type == 0 then
		AddBuff(OwnerID() , 620950 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620950) == true then 
			Cancelbuff(OwnerID(), 620950)
		end
	end
end

---------------森林牧者---------------
function SuitSkill495487( Type )---森林牧者--寵物大師
	if Type == 0 then
		AddBuff(OwnerID() , 506461 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 506461) == true then 
			Cancelbuff(OwnerID(), 506461)
		end
	end
end
function SuitSkill498344( Type )---森林牧者--協定契約
	if Type == 0 then
		AddBuff(OwnerID() , 620951 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 620951) == true then 
			Cancelbuff(OwnerID(), 620951)
		end
	end
end

---------------符文工匠---------------
function SuitSkill850876( Type )---符文工匠--動力升級
	if Type == 0 then
		AddBuff(OwnerID() , 624365 , 0 , -1)
	elseif  Type == 1 then
		if CheckBuff( OwnerID() , 624365) == true then 
			Cancelbuff(OwnerID(), 624365)
		end
	end
end

--===================== 此為套裝技能判斷玩家等級來開放幾格的Script	========================

function Apon_Suitskill_size_1_levelup()	--註冊在玩家升級事件
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player, EM_RoleValue_LV ) 	--讀取玩家的主職等級
	local LVTable = { 50, 65, 80, 95 }					--玩家在升到哪個等級時會再開放下一格套裝技能
	local KeyItemTable = { 544009, 544970, 548000, 549125 }		--判斷是否有獲得過該等級的套裝技能格
	local StringTable = { "[SC_SUITSKILL_START]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]" }	--獲得套裝技能格時的訊息
	for i = 1, #LVTable do
		if PlayerLV >= LVTable[i] and CheckFlag( Player, KeyItemTable[i] ) == false then
			ScriptMessage( Player , Player , 3 , StringTable[i] , 1 )
			WriteRoleValue( Player, EM_RoleValue_SuitSkill_MaxEqSkillCount, (i+1) )
			SetFlag( Player, KeyItemTable[i], 1 )
		end
	end
end

function Apon_Suitskill_size_1_login()		--註冊在玩家登入事件
	local Player = OwnerID()
	local PlayerLV = ReadRoleValue( Player , EM_RoleValue_LV ) 		--讀取玩家的主職等級
	local PlayerLV_Sub = ReadRoleValue( Player , EM_RoleValue_LV_SUB ) 	--讀取玩家的副職等級
	local LVTable = { 50, 65, 80, 95 }						--玩家在升到哪個等級時會再開放下一格套裝技能
	local KeyItemTable = { 544009, 544970, 548000, 549125 }			--判斷是否有獲得過該等級的套裝技能格
	local StringTable = { "[SC_SUITSKILL_START]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]", "[SC_SUITSKILL_START_65]" }	--獲得套裝技能格時的訊息
	for i = 1, #LVTable do
		if PlayerLV >= LVTable[i] and CheckFlag( Player, KeyItemTable[i] ) == false then
			ScriptMessage( Player , Player , 3 , StringTable[i] , 1 )
			WriteRoleValue( Player, EM_RoleValue_SuitSkill_MaxEqSkillCount, (i+1) )
			SetFlag( Player, KeyItemTable[i], 1 )
		end
	end
end