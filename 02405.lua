function FN_SkillCraft_RuneDice_Get()
	local X=Rand(8)
	if X==1 then
		GiveBodyItem(OwnerID(),209732,1)
	else
		GiveBodyItem(OwnerID(),209731,1)
	end
end

function FN_SkillCraft_RuneDice_Roll()
	BeginPlot(OwnerID(),"FN_SkillCraft_RuneDice_Effect",0)
end

function FN_SkillCraft_RuneDice_Effect()
	local DiceTable = {[1]="[SKILLCRAFT_DICEFACE_1]";
			[2]="[SKILLCRAFT_DICEFACE_2]";
			[3]="[SKILLCRAFT_DICEFACE_3]";
			[4]="[SKILLCRAFT_DICEFACE_4]";
			[5]="[SKILLCRAFT_DICEFACE_5]";
			[6]="[SKILLCRAFT_DICEFACE_6]";
				}
	local RollA=DW_Rand(6)
	local RollB=DW_Rand(6)
	local RollCheck = FALSE
	if RollA==RollB then RollCheck = TRUE end
	----
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL01][$SETVAR1="..GetName(OwnerID()).."]", 0 )	--player投擲了第一次的符文骰
	Sleep(8)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL03][$SETVAR1="..GetName(OwnerID()).."]"..DiceTable[RollA], 0 )	--player擲出了某圖案!
	Sleep(5)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL02][$SETVAR1="..GetName(OwnerID()).."]", 0 )	--player投擲了第二次的符文骰
	Sleep(8)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL03][$SETVAR1="..GetName(OwnerID()).."]"..DiceTable[RollB], 0 )	--player擲出了某圖案!
	Sleep(5)
	if RollCheck == TRUE then
		ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL04][$SETVAR1="..GetName(OwnerID()).."]", 0 )
		AddBuff(OwnerID(),508283,0,180)
	else
		ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL05][$SETVAR1="..GetName(OwnerID()).."]", 0 )
	end
end

function FN_SkillCraft_item209762_check()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	if ZoneID >= 100 and ZoneID <=255 then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SC_CANT_USE_IN_THIS_AREA]",0)
		return FALSE
	else
		return TRUE
	end
end

function FN_SkillCraft_item209762()
	if ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode) == 0 then
		 if Lua_UseItem_CastingBar( TargetID() ) == TRUE then
			return
		else
			PlayMotion( TargetID(), ruFUSION_ACTORSTATE_EMOTE_DANCE )
		end
	end
end

function FN_SkillCraft_item209763()
	local sex = ReadRoleValue(OwnerID(),EM_RoleValue_SEX)
	if sex == 0 then
		GiveBodyItem(OwnerID(),221903,1)
	else
		GiveBodyItem(OwnerID(),222994,1)
	end
end

--=======================================================
--				NPC
--=======================================================
function FN_SkillCraft_shop_Recipe()   -- 賣配方
	local player = OwnerID()
	local npc = TargetID()

	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopTable = {	[112944] = 600463;  --  那茲勒    配方_木工打鐵製甲
				[112945] = 600464;   --   崔歐娜   配方_裁縫煉金
				[118362] = 600463;   --  埃博爾   配方_木工打鐵製甲
				[118363] = 600464;}   --   雀兒    配方_裁縫煉金

	SetShop(npc , ShopTable[NPCorgID] , "Test_Shop_Close" ); 
	CloseSpeak( player );  --關閉對話視窗
	OpenShop()
end

function FN_SkillCraft_shop_Material()  -- 賣材料
	local player = OwnerID()
	local npc = TargetID()

	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopTable = {	[112944] = 600465;  --  那茲勒   材料_木工打鐵製甲
				[112945] = 600466;  --   崔歐娜   材料_裁縫煉金
				[118362] = 600465;  --  埃博爾   材料_木工打鐵製甲
				[118363] = 600466;}  --  雀兒     材料_裁縫煉金

	SetShop(npc , ShopTable[NPCorgID] , "Test_Shop_Close" ); 
	CloseSpeak( player );  --關閉對話視窗
	OpenShop()
end

function FN_SkillCraft_shopNPC() --木工、打鐵、製甲、裁縫、煉金 NPC
	local player = OwnerID()
	local npc = TargetID()
	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopString = {	[112944] = "[SKILLCRAFT_NPC_SPEAK_112944]";
				[112945] = "[SKILLCRAFT_NPC_SPEAK_112945]";
				[118362] = "[SKILLCRAFT_NPC_SPEAK_118362]";
				[118363] = "[SKILLCRAFT_NPC_SPEAK_118363]";}

	SetSpeakDetail(OwnerID(),ShopString[NPCorgID])

	AddSpeakOption( player, npc, "[SKILLCRAFT_SKILLPROVE]" , "FN_SkillCraft_SKILLPROVE", 0 ); --我想要進行專業的認證
	AddSpeakOption( player, npc, "[SKILLCRAFT_SHOP_01]" , "FN_SkillCraft_shop_Recipe", 0 ); --我想看看你販賣的配方
	AddSpeakOption( player, npc, "[SKILLCRAFT_SHOP_02]" , "FN_SkillCraft_shop_Material", 0 ); -- 我想看看你販賣的材料
end

function FN_SkillCraft_SKILLPROVE()
	local SkillLv = {0,20,40,60}
	local SkillLvString = { [1]="[SKILLCRAFT_SKILLPROVE_01]";	--學徒
				[2]="[SKILLCRAFT_SKILLPROVE_02]";	--工匠
				[3]="[SKILLCRAFT_SKILLPROVE_03]";	--專精
				[4]="[SKILLCRAFT_SKILLPROVE_04]";	--大師
				}
	local SkillKeyTable = { [1]={540268,540343,540352,540361};	--BlackSmith
				[2]={540334,540344,540353,540362};	--Carpenter
				[3]={540335,540345,540354,540363};	--MakeArmor
				[4]={540336,540346,540355,540364};	--Tailor
				[5]={540338,540348,540357,540366}; }--Alchemy
	--
	local SkillString={ [1]="[SYS_SKILLNAME_BLACKSMITH]";	--打鐵
			[2]="[SYS_SKILLNAME_CARPENTER]";	--木工
			[3]="[SYS_SKILLNAME_MAKEARMOR]";	--製甲
			[4]="[SYS_SKILLNAME_TAILOR]";		--裁縫
			[5]="[SYS_SKILLNAME_ALCHEMY]"; }	--煉金

	local Option = { [1]="FN_SkillCraft_SKILLPROVE_01";
			[2]="FN_SkillCraft_SKILLPROVE_02";
			[3]="FN_SkillCraft_SKILLPROVE_03";
			[4]="FN_SkillCraft_SKILLPROVE_04";
			[5]="FN_SkillCraft_SKILLPROVE_05" }
	--
	local BlackSmith = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_BlackSmith)	--打鐵
	local Carpenter = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Carpenter)	--木工
	local MakeArmor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_MakeArmor)	--製甲
	local Tailor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Tailor)		--裁縫
	local Alchemy = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Alchemy)		--煉金
	local SkillCraftTable = {BlackSmith,Carpenter,MakeArmor,Tailor,Alchemy}
	--
	local CanProve = FALSE
	--
	for i=1,5 do
		for z=1,4 do
			if SkillCraftTable[i] == SkillLv[z] then
				if CheckFlag(OwnerID(),SkillKeyTable[i][z]) == FALSE and FN_SkillCraft_Reachlimit(SkillLv[z],OwnerID()) == true then
					AddSpeakOption(OwnerID(),TargetID(), "[SKILLCRAFT_SKILLPROVE_00][$SETVAR1="..SkillString[i].."][$SETVAR2="..SkillLvString[z].."]" , Option[i], 0 )
					CanProve = TRUE
					break
				end
			end
		end
	end
	if FN_SkillCraft_Reachlimit(20,OwnerID()) == false and FN_SkillCraft_Reachlimit(40,OwnerID()) == false and FN_SkillCraft_Reachlimit(60,OwnerID()) == false then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_LIMIT]")	--你可以認證的技能資格已經到達上限。
	end
	if CanProve == FALSE then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_FINISH]")	--你已經沒有可以認證的專業了
	else
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_UCAN]")	--你目前可以認證的專業技能如下...
	end
end

function FN_SkillCraft_SKILLPROVE_01()	--BlackSmith
	local SkillLv = {0,20,40,60}
	local keyitemtable = {540268,540343,540352,540361}
	--
	for i=1,table.getn(SkillLv) do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Skill_BlackSmith) >= SkillLv[i] and CheckFlag(OwnerID(),keyitemtable[i]) == FALSE then
			SetFlag(OwnerID(),keyitemtable[i],1)
			break
		end
	end
	AddBuff(OwnerID(), 504118, 0, 2)
	SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_DONE][$SETVAR1=".."[SYS_SKILLNAME_BLACKSMITH]".."]")
end
function FN_SkillCraft_SKILLPROVE_02()	--Carpenter
	local SkillLv = {0,20,40,60}
	local keyitemtable = {540334,540344,540353,540362}
	--
	for i=1,table.getn(SkillLv) do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Carpenter) >= SkillLv[i] and CheckFlag(OwnerID(),keyitemtable[i]) == FALSE then
			SetFlag(OwnerID(),keyitemtable[i],1)
			break
		end
	end
	AddBuff(OwnerID(), 504118, 0, 2)
	SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_DONE][$SETVAR1=".."[SYS_SKILLNAME_CARPENTER]".."]")
end
function FN_SkillCraft_SKILLPROVE_03()	--MakeArmor
	local SkillLv = {0,20,40,60}
	local keyitemtable = {540335,540345,540354,540363}
	--
	for i=1,table.getn(SkillLv) do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Skill_MakeArmor) >= SkillLv[i] and CheckFlag(OwnerID(),keyitemtable[i]) == FALSE then
			SetFlag(OwnerID(),keyitemtable[i],1)
			break
		end
	end
	AddBuff(OwnerID(), 504118, 0, 2)
	SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_DONE][$SETVAR1=".."[SYS_SKILLNAME_MAKEARMOR]".."]")
end
function FN_SkillCraft_SKILLPROVE_04()	--Tailor
	local SkillLv = {0,20,40,60}
	local keyitemtable = {540336,540346,540355,540364}
	--
	for i=1,table.getn(SkillLv) do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Tailor) >= SkillLv[i] and CheckFlag(OwnerID(),keyitemtable[i]) == FALSE then
			SetFlag(OwnerID(),keyitemtable[i],1)
			break
		end
	end
	AddBuff(OwnerID(), 504118, 0, 2)
	SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_DONE][$SETVAR1=".."[SYS_SKILLNAME_TAILOR]".."]")
end
function FN_SkillCraft_SKILLPROVE_05()	--Alchemy
	local SkillLv = {0,20,40,60}
	local keyitemtable = {540338,540348,540357,540366}
	--
	for i=1,table.getn(SkillLv) do
		if ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Alchemy) >= SkillLv[i] and CheckFlag(OwnerID(),keyitemtable[i]) == FALSE then
			SetFlag(OwnerID(),keyitemtable[i],1)
			break
		end
	end
	AddBuff(OwnerID(), 504118, 0, 2)
	SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_DONE][$SETVAR1=".."[SYS_SKILLNAME_ALCHEMY]".."]")
end

							----

function FN_SkillCraft_improve()
	local npc = TargetID()
	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local BlackSmith = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_BlackSmith)	--打鐵
	local Carpenter = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Carpenter)	--木工
	local MakeArmor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_MakeArmor)	--製甲
	local Tailor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Tailor)		--裁縫
	local Alchemy = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Alchemy)		--煉金
	local SkillCraftTable = {BlackSmith,Carpenter,MakeArmor,Tailor,Alchemy}
	local StringTable = { [1]="[SKILLCRAFT_NPC112946_OPTION01]";	--我已經精通BLACKSMITH方面的技巧了
				[2]="[SKILLCRAFT_NPC112946_OPTION02]";	--我已經精通CARPENTER方面的技巧了
				[3]="[SKILLCRAFT_NPC112946_OPTION03]";	--我已經精通MAKEARMOR方面的技巧了
				[4]="[SKILLCRAFT_NPC112946_OPTION04]";	--我已經精通TAILOR方面的技巧了
				[5]="[SKILLCRAFT_NPC112946_OPTION05]"; }	--我已經精通ALCHEMY方面的技巧了
	local functTable = { [1]="FN_SkillCraft_112946_option1";
				[2]="FN_SkillCraft_112946_option2";	
				[3]="FN_SkillCraft_112946_option3";
				[4]="FN_SkillCraft_112946_option4";
				[5]="FN_SkillCraft_112946_option5"; }
	local SkillString={ [1]="[SYS_SKILLNAME_BLACKSMITH]";	--打鐵
			[2]="[SYS_SKILLNAME_CARPENTER]";	--木工
			[3]="[SYS_SKILLNAME_MAKEARMOR]";	--製甲
			[4]="[SYS_SKILLNAME_TAILOR]";		--裁縫
			[5]="[SYS_SKILLNAME_ALCHEMY]"; }	--煉金

	if NPCorgID == 112946 then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_NPC_SPEAK_112946]".."[SKILLCRAFT_NPC_SPEAK_2012]")	--如果你在各個專業方面的造詣已經精通，那我可以教導你一些普通人難以製作的配方。
	elseif NPCorgID == 118364 then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_NPC_SPEAK_118364]".."[SKILLCRAFT_NPC_SPEAK_2012]")
	end
	
	for i=1,5 do
		if SkillCraftTable[i] >= 60 then
			AddSpeakOption(OwnerID(), TargetID(), StringTable[i], functTable[i], 0)
		end
--		if SkillCraftTable[i] >= 80 then
--			AddSpeakOption(OwnerID(), TargetID(), "[SKILLCRAFT_NPC112946_OPTION2012][$SETVAR1="..SkillString[i].."]", functTable[i], 0)
--		end
	end
end

function FN_SkillCraft_112946_option1()
	if CountBodyItem(OwnerID(),551656) >=1 or CheckFlag(OwnerID(),545244) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)	--你已經領取過此專業的特殊配方了
	else
		GiveBodyItem(OwnerID(),551656,1)
	end
	CloseSpeak(OwnerID())
end

function FN_SkillCraft_112946_option2()
	if CountBodyItem(OwnerID(),551658) >=1 or CheckFlag(OwnerID(),545246) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)
	else
		GiveBodyItem(OwnerID(),551658,1)
	end
	CloseSpeak(OwnerID())
end

function FN_SkillCraft_112946_option3()
	if CountBodyItem(OwnerID(),551657) >=1 or CheckFlag(OwnerID(),545245) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)
	else
		GiveBodyItem(OwnerID(),551657,1)
	end
	CloseSpeak(OwnerID())
end

function FN_SkillCraft_112946_option4()
	if CountBodyItem(OwnerID(),551660) >=1 or CheckFlag(OwnerID(),545248) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)
	else
		GiveBodyItem(OwnerID(),551660,1)
	end
	CloseSpeak(OwnerID())
end

function FN_SkillCraft_112946_option5()
	if CountBodyItem(OwnerID(),551659) >=1 or CheckFlag(OwnerID(),545247) then
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)
	else
		GiveBodyItem(OwnerID(),551659,1)
	end
	CloseSpeak(OwnerID())
end

--檢查用函式--

function FN_SkillCraft_Reachlimit(lv,ID)
	local keyitemtable = {[1]={540340,540341,540342,540343,540344,540345,540346,540347,540348};	--工匠
				[2]={540349,540350,540351,540352,540353,540354,540355,540356,540357};	--專精
				[3]={540358,540359,540360,540361,540362,540363,540364,540365,540366}	--大師
				}
	local LimitTable = {6,3,1}
	local LvTable = {20,40,60}
	local count = 0

	if lv == 0 then
		return TRUE
	end
	for i=1,table.getn(LvTable) do
		if lv == LvTable[i] then
			for y=1,table.getn(keyitemtable[i]) do
				if CheckFlag(ID,keyitemtable[i][y]) == true then
					count = count +1
				end
			end
			--
			if count >= LimitTable[i] then
				return FALSE
			else
				return TRUE
			end
			break
		end
	end
end

--===========
--回收NPC 兼賣稀有品
--===========
function FN_SkillCraft_NPC_120886_shopset()
	SetShop(OwnerID() , 600276 , "Test_Shop_Close" );
end

-- 巧匠協會專員對話
function FN_SkillCraft_NPC_120886()
	local player = OwnerID()
	local npc = TargetID()

--	local hour =  GetSystime( 1 )

--	local ItemTable = {	[1]={241578,241579};
--				[2]={241582,241583};
--				[3]={241586,241587};
--				[4]={241594,241595};
--				[5]={241590,241591}	}	
--	local ItemType = (hour%5)+1

--	WriteRoleValue(npc, EM_RoleValue_Register1, ItemTable[ItemType][1])
--	WriteRoleValue(npc, EM_RoleValue_Register2, ItemTable[ItemType][2])

--	SetSpeakDetail(player,"[SKILLCRAFT_NPC_SPEAK_120886][$SETVAR1=".."["..ItemTable[ItemType][1].."]".."][$SETVAR2=".."["..ItemTable[ItemType][2].."]".."]")

--	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC120886_OPTION01]" , "FN_SkillCraft_NPC_120886_plot", 0 ); --我剛好有你要的東西

	SetSpeakDetail(player,"[SKILLCRAFT_NPC_SPEAK_120886_1]" )  -- 這邊有販售可以製作或兌換特殊物品的配方，需要為你服務嗎？
	AddSpeakOption( player, npc, "[SKILLCRAFT_SKILLPROVE_RAREITEM]" , "FN_SkillCraft_NPC_120886_ShopOpen", 0 ); --我想看看你販賣的稀有配方
	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC_SPEAK_120886_2]" , "FN_SkillCraft_NPC_120886_2013item", 0 ); --我想兌換你們最新發明的東西！
end


--你好，不知道你是否趁著這難得的節日，跟我們的成員學習了一些獨特的工藝技術呢？

--巧匠協會除了提供製作的教學之外，我們也會負責回收你們所製作出來的成品，以免這些好東西被浪費掉了，如果你有下面兩項東西，請交給我，我們會拿去給有需要的人。

--目前時段所收集的物品是：
--(1) <CN>15個[$VAR1]</CN>
--(2) <CN>15個[$VAR2]</CN>
--
--
--function FN_SkillCraft_NPC_120886_plot()
--	local player = OwnerID()
--	local npc = TargetID()
--
--	local ItemA = ReadRoleValue(npc, EM_RoleValue_Register1)
--	local ItemB = ReadRoleValue(npc, EM_RoleValue_Register2)
--
--	if CountItem(player, ItemA) < 15 and CountItem(player, ItemB) < 15 then
--		ScriptMessage( player, player, 1, "[SKILLCRAFT_SKILLPROVE_NOTHAVE]", 0 )
--		CloseSpeak(player)
--		return
--	end
--	if CountItem(player, ItemA) >= 15 then
--		DelBodyItem(player, ItemA, 15)
--		GiveBodyItem(player, 241362, 1)
--	end
--	if CountItem(player, ItemB) >= 15 then
--		DelBodyItem(player, ItemB, 15)
--		GiveBodyItem(player, 241362, 1)
--	end
--	SetFlag(player, 546707, 1)
--	SkillCraft_AllFinish(player)
--	CloseSpeak(player)
--end

function FN_SkillCraft_NPC_120886_ShopOpen()
	local player = OwnerID()
	local npc = TargetID()

	CloseSpeak( player );  --關閉對話視窗
	OpenShop()
end

--巧藝節 全勤獎--

function SkillCraft_AllFinish(player)
	local KeyTable = {546707,546708}

	for i=1,table.getn(KeyTable) do
		if CheckFlag(player,KeyTable[i]) == false then
			return
		end
	end
	if CheckFlag(player, 546706) == false then
		SetFlag(player, 546706, 1)
		lua_mika_festivalbuffgive(player,0)	
	end
end
--================================================
--				2013新增
--================================================
--================
--	尊爵體驗器
--================
function FN_SkillCraft2013_Item242535()
	BeginPlot( OwnerID(), "FN_Item242535_plot", 0 )
end

function FN_Item242535_plot()
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local x,y,z,dir=DW_Location(Player)
	local UnitTable = {}
	local StringTable = { "[SKILLCRAFT_2013_FN_01]", "[SKILLCRAFT_2013_FN_02]", "[SKILLCRAFT_2013_FN_03]" }

	for i = 1, 3 do
		local Angle = 100+40*i
		local Nx,Ny,Nz,Ndir = DW_NewLocation(Angle,50,x,y,z,Dir)

		UnitTable[i] = CreateObj( 115531, Nx, Ny, Nz, Ndir, 1 )
		SetModeEx( UnitTable[i], EM_SetModeType_Mark, false )	--標記

		AddToPartition( UnitTable[i], RoomID )
	end
	Sleep(15)

	for h = 1, 3 do
		FaceObj( UnitTable[h], Player )
		PlayMotion( UnitTable[h], ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
		Say( UnitTable[h], StringTable[h] )
	end

	SysCastSpellLv( Player, Player, 850787, 0 )
end

function FN_SkillCraft2013_NPC115531()
	Sleep(50)
	DelObj(OwnerID())
end
--================
--	超強韌反騎士套索
--================
function FN_SkillCraft2013_Item242537()
	local Player = TargetID()

	DW_CancelTypeBuff( 68 , Player )
end
--================
--	滑溜肥皂陷阱
--================
function FN_SkillCraft2013_Item242536()
	local Trap = OwnerID()
	local Master = ReadRoleValue ( OwnerID() , EM_RoleValue_OwnerGUID )
	local Player = TargetID()

	if Player == Master then 
		return false
	end
	return true
end
--================================
--		NPC兌換新獎勵對話
--================================
function FN_SkillCraft_NPC_120886_2013item()
	local player = OwnerID()
	local npc = TargetID()

	SetSpeakDetail( player, "[SKILLCRAFT_NPC_SPEAK_120886_3]" )  -- 我們無時無刻不在進行各種不同的點子發想，並致力於讓這些發想實作出來，成為真正可用的東西。
	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC120886_OPTION01]" , "FN_SkillCraft_NPC_120886_2013item2", 0 ); --我我剛好有你要的東西
end

function FN_SkillCraft_NPC_120886_2013item2()
	local player = OwnerID()
	local npc = TargetID()

	if CountBodyItem( player, 209758 ) >= 10 and CountBodyItem( player, 241350 ) >= 10 then
		DelBodyItem( player, 209758, 10 )
		DelBodyItem( player, 241350, 10 )
		
		GiveBodyItem( player, (242531+Rand(9)), 1 )
	else
		ScriptMessage( player, player, 1, "[SKILLCRAFT_SKILLPROVE_NOTHAVE]", 0 )
	end
	CloseSpeak( player )
end


--================================
--		測試用
--================================

function FN_SkillCraft_call(skill)
	local EM = {EM_RoleValue_Skill_BlackSmith,EM_RoleValue_Skill_Carpenter,EM_RoleValue_Skill_MakeArmor,EM_RoleValue_Skill_Tailor,EM_RoleValue_Skill_Cook,EM_RoleValue_Skill_Alchemy,EM_RoleValue_Skill_Mining,EM_RoleValue_Skill_Lumbering,EM_RoleValue_Skill_Herblism}
	local Num = math.floor(skill/100)	--第幾個專業
	local plus = skill%100
	--
	local X = ReadRoleValue(OwnerID(),EM[Num])
	WriteRoleValue(OwnerID(),EM[Num],plus)
end

function FN_SkillCraft_clean()
	local keyitemtableA = {540340,540341,540342,540343,540344,540345,540346,540347,540348}
	local keyitemtableB = {540349,540350,540351,540352,540353,540354,540355,540356,540357}
	local EM = {EM_RoleValue_Skill_BlackSmith,EM_RoleValue_Skill_Carpenter,EM_RoleValue_Skill_MakeArmor,EM_RoleValue_Skill_Tailor,EM_RoleValue_Skill_Cook,EM_RoleValue_Skill_Alchemy,EM_RoleValue_Skill_Mining,EM_RoleValue_Skill_Lumbering,EM_RoleValue_Skill_Herblism}

	for i=1,table.getn(keyitemtableA) do
		SetFlag(OwnerID(),keyitemtableA[i],0)
		SetFlag(OwnerID(),keyitemtableB[i],0)
		WriteRoleValue(OwnerID(),EM[i],20)
	end
end