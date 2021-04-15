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
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL01][$SETVAR1="..GetName(OwnerID()).."]", 0 )	--player���Y�F�Ĥ@�����Ť��
	Sleep(8)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL03][$SETVAR1="..GetName(OwnerID()).."]"..DiceTable[RollA], 0 )	--player�Y�X�F�Y�Ϯ�!
	Sleep(5)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL02][$SETVAR1="..GetName(OwnerID()).."]", 0 )	--player���Y�F�ĤG�����Ť��
	Sleep(8)
	ScriptMessage( OwnerID(), 0, 0, "[SKILLCRAFT_RUNEDICEROLL03][$SETVAR1="..GetName(OwnerID()).."]"..DiceTable[RollB], 0 )	--player�Y�X�F�Y�Ϯ�!
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
function FN_SkillCraft_shop_Recipe()   -- ��t��
	local player = OwnerID()
	local npc = TargetID()

	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopTable = {	[112944] = 600463;  --  ������    �t��_��u���K�s��
				[112945] = 600464;   --   �Z�ڮR   �t��_���_�Ҫ�
				[118362] = 600463;   --  �J�պ�   �t��_��u���K�s��
				[118363] = 600464;}   --   ����    �t��_���_�Ҫ�

	SetShop(npc , ShopTable[NPCorgID] , "Test_Shop_Close" ); 
	CloseSpeak( player );  --������ܵ���
	OpenShop()
end

function FN_SkillCraft_shop_Material()  -- �����
	local player = OwnerID()
	local npc = TargetID()

	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopTable = {	[112944] = 600465;  --  ������   ����_��u���K�s��
				[112945] = 600466;  --   �Z�ڮR   ����_���_�Ҫ�
				[118362] = 600465;  --  �J�պ�   ����_��u���K�s��
				[118363] = 600466;}  --  ����     ����_���_�Ҫ�

	SetShop(npc , ShopTable[NPCorgID] , "Test_Shop_Close" ); 
	CloseSpeak( player );  --������ܵ���
	OpenShop()
end

function FN_SkillCraft_shopNPC() --��u�B���K�B�s�ҡB���_�B�Ҫ� NPC
	local player = OwnerID()
	local npc = TargetID()
	local NPCorgID = ReadRoleValue(npc, EM_RoleValue_OrgID)

	local ShopString = {	[112944] = "[SKILLCRAFT_NPC_SPEAK_112944]";
				[112945] = "[SKILLCRAFT_NPC_SPEAK_112945]";
				[118362] = "[SKILLCRAFT_NPC_SPEAK_118362]";
				[118363] = "[SKILLCRAFT_NPC_SPEAK_118363]";}

	SetSpeakDetail(OwnerID(),ShopString[NPCorgID])

	AddSpeakOption( player, npc, "[SKILLCRAFT_SKILLPROVE]" , "FN_SkillCraft_SKILLPROVE", 0 ); --�ڷQ�n�i��M�~���{��
	AddSpeakOption( player, npc, "[SKILLCRAFT_SHOP_01]" , "FN_SkillCraft_shop_Recipe", 0 ); --�ڷQ�ݬݧA�c�檺�t��
	AddSpeakOption( player, npc, "[SKILLCRAFT_SHOP_02]" , "FN_SkillCraft_shop_Material", 0 ); -- �ڷQ�ݬݧA�c�檺����
end

function FN_SkillCraft_SKILLPROVE()
	local SkillLv = {0,20,40,60}
	local SkillLvString = { [1]="[SKILLCRAFT_SKILLPROVE_01]";	--�Ǯ{
				[2]="[SKILLCRAFT_SKILLPROVE_02]";	--�u�K
				[3]="[SKILLCRAFT_SKILLPROVE_03]";	--�M��
				[4]="[SKILLCRAFT_SKILLPROVE_04]";	--�j�v
				}
	local SkillKeyTable = { [1]={540268,540343,540352,540361};	--BlackSmith
				[2]={540334,540344,540353,540362};	--Carpenter
				[3]={540335,540345,540354,540363};	--MakeArmor
				[4]={540336,540346,540355,540364};	--Tailor
				[5]={540338,540348,540357,540366}; }--Alchemy
	--
	local SkillString={ [1]="[SYS_SKILLNAME_BLACKSMITH]";	--���K
			[2]="[SYS_SKILLNAME_CARPENTER]";	--��u
			[3]="[SYS_SKILLNAME_MAKEARMOR]";	--�s��
			[4]="[SYS_SKILLNAME_TAILOR]";		--���_
			[5]="[SYS_SKILLNAME_ALCHEMY]"; }	--�Ҫ�

	local Option = { [1]="FN_SkillCraft_SKILLPROVE_01";
			[2]="FN_SkillCraft_SKILLPROVE_02";
			[3]="FN_SkillCraft_SKILLPROVE_03";
			[4]="FN_SkillCraft_SKILLPROVE_04";
			[5]="FN_SkillCraft_SKILLPROVE_05" }
	--
	local BlackSmith = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_BlackSmith)	--���K
	local Carpenter = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Carpenter)	--��u
	local MakeArmor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_MakeArmor)	--�s��
	local Tailor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Tailor)		--���_
	local Alchemy = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Alchemy)		--�Ҫ�
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
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_LIMIT]")	--�A�i�H�{�Ҫ��ޯ���w�g��F�W���C
	end
	if CanProve == FALSE then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_FINISH]")	--�A�w�g�S���i�H�{�Ҫ��M�~�F
	else
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_SKILLPROVE_UCAN]")	--�A�ثe�i�H�{�Ҫ��M�~�ޯ�p�U...
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

	local BlackSmith = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_BlackSmith)	--���K
	local Carpenter = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Carpenter)	--��u
	local MakeArmor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_MakeArmor)	--�s��
	local Tailor = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Tailor)		--���_
	local Alchemy = ReadRoleValue(OwnerID(),EM_RoleValue_Skill_Alchemy)		--�Ҫ�
	local SkillCraftTable = {BlackSmith,Carpenter,MakeArmor,Tailor,Alchemy}
	local StringTable = { [1]="[SKILLCRAFT_NPC112946_OPTION01]";	--�ڤw�g��qBLACKSMITH�譱���ޥ��F
				[2]="[SKILLCRAFT_NPC112946_OPTION02]";	--�ڤw�g��qCARPENTER�譱���ޥ��F
				[3]="[SKILLCRAFT_NPC112946_OPTION03]";	--�ڤw�g��qMAKEARMOR�譱���ޥ��F
				[4]="[SKILLCRAFT_NPC112946_OPTION04]";	--�ڤw�g��qTAILOR�譱���ޥ��F
				[5]="[SKILLCRAFT_NPC112946_OPTION05]"; }	--�ڤw�g��qALCHEMY�譱���ޥ��F
	local functTable = { [1]="FN_SkillCraft_112946_option1";
				[2]="FN_SkillCraft_112946_option2";	
				[3]="FN_SkillCraft_112946_option3";
				[4]="FN_SkillCraft_112946_option4";
				[5]="FN_SkillCraft_112946_option5"; }
	local SkillString={ [1]="[SYS_SKILLNAME_BLACKSMITH]";	--���K
			[2]="[SYS_SKILLNAME_CARPENTER]";	--��u
			[3]="[SYS_SKILLNAME_MAKEARMOR]";	--�s��
			[4]="[SYS_SKILLNAME_TAILOR]";		--���_
			[5]="[SYS_SKILLNAME_ALCHEMY]"; }	--�Ҫ�

	if NPCorgID == 112946 then
		SetSpeakDetail(OwnerID(),"[SKILLCRAFT_NPC_SPEAK_112946]".."[SKILLCRAFT_NPC_SPEAK_2012]")	--�p�G�A�b�U�ӱM�~�譱���y�ڤw�g��q�A���ڥi�H�оɧA�@�Ǵ��q�H���H�s�@���t��C
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
		ScriptMessage( OwnerID(),OwnerID(),1,"[SKILLCRAFT_ALREADYHAVE]",C_SYSTEM)	--�A�w�g����L���M�~���S��t��F
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

--�ˬd�Ψ禡--

function FN_SkillCraft_Reachlimit(lv,ID)
	local keyitemtable = {[1]={540340,540341,540342,540343,540344,540345,540346,540347,540348};	--�u�K
				[2]={540349,540350,540351,540352,540353,540354,540355,540356,540357};	--�M��
				[3]={540358,540359,540360,540361,540362,540363,540364,540365,540366}	--�j�v
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
--�^��NPC �ݽ�}���~
--===========
function FN_SkillCraft_NPC_120886_shopset()
	SetShop(OwnerID() , 600276 , "Test_Shop_Close" );
end

-- ���K��|�M�����
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

--	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC120886_OPTION01]" , "FN_SkillCraft_NPC_120886_plot", 0 ); --�ڭ�n���A�n���F��

	SetSpeakDetail(player,"[SKILLCRAFT_NPC_SPEAK_120886_1]" )  -- �o�䦳�c��i�H�s�@�ΧI���S���~���t��A�ݭn���A�A�ȶܡH
	AddSpeakOption( player, npc, "[SKILLCRAFT_SKILLPROVE_RAREITEM]" , "FN_SkillCraft_NPC_120886_ShopOpen", 0 ); --�ڷQ�ݬݧA�c�檺�}���t��
	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC_SPEAK_120886_2]" , "FN_SkillCraft_NPC_120886_2013item", 0 ); --�ڷQ�I���A�̷̳s�o�����F��I
end


--�A�n�A�����D�A�O�_�X�۳o���o���`��A��ڭ̪������ǲߤF�@�ǿW�S���u���޳N�O�H

--���K��|���F���ѻs�@���оǤ��~�A�ڭ̤]�|�t�d�^���A�̩һs�@�X�Ӫ����~�A�H�K�o�Ǧn�F��Q���O���F�A�p�G�A���U���ⶵ�F��A�Х浹�ڡA�ڭ̷|���h�����ݭn���H�C

--�ثe�ɬq�Ҧ��������~�O�G
--(1) <CN>15��[$VAR1]</CN>
--(2) <CN>15��[$VAR2]</CN>
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

	CloseSpeak( player );  --������ܵ���
	OpenShop()
end

--�����` ���Լ�--

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
--				2013�s�W
--================================================
--================
--	�L�����羹
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
		SetModeEx( UnitTable[i], EM_SetModeType_Mark, false )	--�аO

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
--	�W�j�����M�h�M��
--================
function FN_SkillCraft2013_Item242537()
	local Player = TargetID()

	DW_CancelTypeBuff( 68 , Player )
end
--================
--	�ƷȪΨm����
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
--		NPC�I���s���y���
--================================
function FN_SkillCraft_NPC_120886_2013item()
	local player = OwnerID()
	local npc = TargetID()

	SetSpeakDetail( player, "[SKILLCRAFT_NPC_SPEAK_120886_3]" )  -- �ڭ̵L�ɵL�褣�b�i��U�ؤ��P���I�l�o�Q�A�íP�O�����o�ǵo�Q��@�X�ӡA�����u���i�Ϊ��F��C
	AddSpeakOption( player, npc, "[SKILLCRAFT_NPC120886_OPTION01]" , "FN_SkillCraft_NPC_120886_2013item2", 0 ); --�ڧڭ�n���A�n���F��
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
--		���ե�
--================================

function FN_SkillCraft_call(skill)
	local EM = {EM_RoleValue_Skill_BlackSmith,EM_RoleValue_Skill_Carpenter,EM_RoleValue_Skill_MakeArmor,EM_RoleValue_Skill_Tailor,EM_RoleValue_Skill_Cook,EM_RoleValue_Skill_Alchemy,EM_RoleValue_Skill_Mining,EM_RoleValue_Skill_Lumbering,EM_RoleValue_Skill_Herblism}
	local Num = math.floor(skill/100)	--�ĴX�ӱM�~
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