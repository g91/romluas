--=========================================================
--				���ʤ@ - ��NPC116668����H������Buff�H�λ�����~
--=========================================================
function Lua_FN_KRNewSeason_NPC116668()
	local hour = GetSystime(1)

	SetSpeakDetail( OwnerID(), "[KRNEWSEASON_NPC116668_Speak01]"  ) --Main
	AddSpeakOption( OwnerID(), TargetID(), "[KRNEWSEASON_NPC116668_05]"  , "Lua_FN_KRNewSeason_NPC116668_Option3", 0 )--�����¾�~���y
	if hour>= 20 and hour <= 24 then
		if CheckFlag(OwnerID(), 544712 ) == FALSE then
			AddSpeakOption( OwnerID(), TargetID(), "[KRNEWSEASON_NPC116668_02]"  , "Lua_FN_KRNewSeason_NPC116668_Option1", 0 )--���Buff
		end
		if CheckFlag(OwnerID(),544714) == FALSE then
			AddSpeakOption( OwnerID(), TargetID(), "[KRNEWSEASON_NPC116668_04]"  , "Lua_FN_KRNewSeason_NPC116668_Option2", 0 )--������~
		end
	end
end

function Lua_FN_KRNewSeason_NPC116668_Option1()
	local TempX = DW_Rand(5)
	local BuffTable = {506943,506944,506945,506946,506947}

	ScriptMessage( OwnerID(), OwnerID(), 1,"[KRNEWSEASON_NPC116668_03][$SETVAR1=".."["..BuffTable[TempX].."]".."]", C_SYSTEM )
	AddBuff(OwnerID(),BuffTable[TempX],0,3600)
	--
	SetFlag(OwnerID(),544712,1)
	--
	CloseSpeak(OwnerID())
end

function Lua_FN_KRNewSeason_NPC116668_Option2()
	local hour = GetSystime(1)
	local BuffLV
	local GiftTable = {202902,202903,724419,201134,203525}
	local GiveTable = {2,2,1,1,1}
	--
	local BuffTimes = (48-hour)*60
	--
	if CheckBuff(OwnerID(),506948) == TRUE then
		BuffLV = FN_CountBuffLevel(OwnerID(),506948)
		CancelBuff(OwnerID(),506948)
		if BuffLV ==2 then
			AddBuff(OwnerID(),506948,2,BuffTimes)
		else
			AddBuff(OwnerID(),506948,BuffLV+1,BuffTimes)
		end
	else
		AddBuff(OwnerID(),506948,0,BuffTimes)
		BuffLV = 0
	end
	--
	BuffLV =  FN_CountBuffLevel(OwnerID(),506948)
	for i=1,BuffLV+1 do
		local X = DW_Rand(5)
		GiveBodyItem(OwnerID(),GiftTable[X],GiveTable[X])
	end
	--
	SetFlag(OwnerID(),544714,1)
	--
	CloseSpeak(OwnerID())
end

function Lua_FN_KRNewSeason_NPC116668_Option3()	--��¾�~���y
	SetSpeakDetail( OwnerID(), "[KRNEWSEASON_NPC116668_Speak02]"  )
	
	AddSpeakOption( OwnerID(), TargetID(), "[KRNEWSEASON_NPC116668_06]"  , "Lua_FN_KRNewSeason_NPC116668_Option3_1", 0 )--���Buff
end

function Lua_FN_KRNewSeason_NPC116668_Option3_1()
	local LV = ReadRoleValue(OwnerID(),EM_RoleValue_LV_SUB)
	local flagtable = {544715,544716,544717,544718,544719,544720}
	local LVtable = {1,10,20,30,40,50}
	local ItemTable = {[1]={201134,201617};
				[2]={201134,201617,201095};
				[3]={202264,202320,206907,205525};
				[4]={201448,201449,203041};
				[5]={206908,202670,203576};
				[6]={207147};
				}
	local Item = {[1]={2,2};
			[2]={2,2,2};
			[3]={1,1,1,1};
			[4]={2,4,2};
			[5]={1,1,2};
			[6]={1};
			}
	local givecheck = FALSE

	if LV >=1 then
		for i=1,6 do
			if LV >= LVtable[i] and CheckFlag(OwnerID(),flagtable[i]) == FALSE then
				for h=1,table.getn(ItemTable[i]) do
					GiveBodyItem(OwnerID(),ItemTable[i][h],Item[i][h])
				end
				--
				SetFlag(OwnerID(),flagtable[i],1)
				givecheck = TRUE
			end
		end
		if givecheck == FALSE then
			if LV >= 50 then
				ScriptMessage( OwnerID(), OwnerID(), 1,"[KRNEWSEASON_NPC116668_09]", C_SYSTEM )
			else
				ScriptMessage( OwnerID(), OwnerID(), 1,"[KRNEWSEASON_NPC116668_07]", C_SYSTEM )
			end
		end
	elseif LV == 0 then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[KRNEWSEASON_NPC116668_08]", C_SYSTEM )		
	end
	CloseSpeak(OwnerID())
end

--=========================================================
--				���ʤG - Lv40����§�]
--=========================================================
--�b ServerScript 701584 ���ꪺ�a�� (�j�M kr= ) �[�W�o��function
--�o��function���b702087���Y�@��

--function Lua_FN_KRNewSeason_Lv40Gift_Item208933(PlayerLV, Type)
--	if Type == 0 and  PlayerLV == 40 and CheckFlag( OwnerID(), 544713 ) == FALSE then
--			GiveBodyItem(OwnerID(),208933,1)
--			ScriptMessage( OwnerID(), OwnerID(), 1,"[KRNEWSEASON_LV40GIFT_01]", C_SYSTEM )
			--
--			SetFlag(OwnerID(),544713,1)
--		end
--end

--=========================================================
--				���ʥ| - Lv40����§�](�}��§�])
--=========================================================
function LuaI_208933(Option)
	local NeedSpace = 1
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem(OwnerID(),208934,3)
	end
end

--=========================================================
--				���ʤ� - �����L
--=========================================================
function Lua_FN_KRNewSeason_NPC116845()
	local ZoneID = ReadRoleValue(OwnerID(),EM_RoleValue_ZoneID)
	local ActionMonthTable = {1,1,1,1,1,1,1,2,2,2,2,2}
	local ActionDayTable1 = {12,15,18,21,24,27,30,1,5,8,11,14}
	local ActionDayTable2 = {14,17,20,23,26,29,31,4,7,10,13,16}
	local ZoneTable = {1,2,12,4,5,2,5,4,4,2,5,5}
	local GoblinCheckTable = {1,2,4,5,6,12}
	local GoblinTable = {105131,105132,105133,105134,105135,105131}
	local month = GetSystime(3)+1	-- ��
	local day = GetSystime(4)	-- ��
	local Check = FALSE
	local TempID
	local Goblin
	local GoblinCD = 0
	
	while TRUE do
		for i=1,table.getn(ActionMonthTable) do
			if month==ActionMonthTable[i] and day>=ActionDayTable1[i] and day<=ActionDayTable2[i] and ZoneID==ZoneTable[i] then
				for h=1,table.getn(GoblinCheckTable) do
					if ZoneID==GoblinCheckTable[h] then
						TempID=GoblinTable[h]
						Check=TRUE
					end
				end
			end
		end
		if Check == TRUE and GoblinCD == 0 then
			Goblin = Lua_DW_CreateObj( "obj" , TempID , OwnerID() , 1 , 1)
			GoblinCD = 8
			BeginPlot(Goblin,"Lua_FN_KRNewSeason_NPC116845_timer",0)
		end
		--
		Sleep(36000)
		if GoblinCD>0 then GoblinCD = GoblinCD-1 end
		month = GetSystime(3)+1
		day = GetSystime(4)
	end
end

function Lua_FN_KRNewSeason_NPC116845_timer()	--�����X�Ӫ������L�R���ۤv��timer
	local Timer = 3600
	while TRUE do
		if Timer == 0 then
			if KS_InCombat(OwnerID())  == TRUE then	--�p�G���a���b��(�����L�԰���)�A�N�h����5����
				Timer = 300
			else
				DelObj(OwnerID())
			end
		end
		--
		Sleep(10)
		Timer = Timer-1
	end
end

function LuaI_208946()
	local X = 100000
	local Y = Rand(900000)
	AddRoleValue( OwnerID() , EM_RoleValue_Money ,  X+Y )
end

function LuaI_208945(Option)
	local NeedSpace = 3
	local NeedSpaceStatus  = Check_Bag_Space( OwnerID() , NeedSpace  )

	if ( Option == "CHECK" ) then
		if ( NeedSpaceStatus  == false ) then
			return false
		end
	elseif ( Option == "USE" ) then
		local Table = {208947,208948,208949,208950,208951}
		local X = DW_Rand(5)
		for i=1,3 do
			GiveBodyItem(OwnerID(),Table[X],1)
		end
	end
end

--=========================================================
--				���ʤ� - ���Ǳ����r�d
--=========================================================

--=========================================================
--				���ʤC - �c��S�O���ѥ�
--=========================================================
function Lua_FN_KRNewSeason_NPC116843()
	AddBuff(  TargetID(),  503217, 1, -1) 
	SetShop(OwnerID() , 600268 , "Test_Shop_Close" )
end

--=========================================================
--				���ʤK - ���ҰePET
--=========================================================

--=========================================================
--				���ʤE - ���׭^���ٸ�
--=========================================================
function Lua_FN_KRNewSeason_NPC116844()
	SetSpeakDetail( OwnerID(), "[KRNEWSEASON_NPC116844_01]"  )	--Main
	LoadQuestOption(OwnerID())
end

function Lua_FN_KRNewSeason_NPC116844_Option1()
	local CardTable = {}
	local CardCheck = TRUE
	--
	for i=1,10 do
		if CountBodyItem( OwnerID(), CardTable[i] ) <= 0 then
			CardCheck = FALSE
			break
		end
	end
	--
	if CardCheck == TRUE then
		for j=1,10 do
			DelBodyItem( OwnerID(), CardTable[j], 1 )	--�R���ҫ�����10�i�d��
		end
		GiveBodyItem(OwnerID(),228050,1)	--����
		GiveBodyItem(OwnerID(),228051,1)	--����
		GiveBodyItem( OwnerID(),530632,1)	--�ٸ�
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[KRNEWSEASON_NPC116844_03]", 0 )
	end
	--
	CloseSpeak(OwnerID())
end
--=========================================================
--				���ʤQ - �شӬ��� - �s��ؤl
--=========================================================
function LuaI_206535()	-- �g�礧��
	AddEXP( OwnerID() , 5000 )
	return true
end

Function LuaI_203275(Option) --�ٸ� - �f�̯S������
	local TitleID = 530649
	if ( Option == "CHECK" ) then
		if ( CountBodyItem( OwnerID() , TitleID ) ) ==1 then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_0908SEANSON_34]", 0 ) -- �w�g�֦����ٸ�
			return false
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( OwnerID() , TitleID , 1 )
	end
end

function Lua_Hao_Plant_Loot_Tool( ObjID )	-- ���P������]���եΡ^

	for i = 1 , 10 , 1 do
		GiveBodyItem( OwnerID() , ObjID , 1 )
		sleep(10)
	end
end

-- �ؤl�ӤH
function Lua_Hao_Korea_plantshop() -- �����󲣥ͼ@�� --�ؤl
	AddBuff(  TargetID(),  503217, 1, -1) 
	SetShop( OwnerID() , 600259 , "Test_Shop_Close" )
end

function Lua_Hao_Korea_plantshop_1()	
	local Npc = { 116846 , 116847 , 116848 }	-- Zone 1 , 2 , 12
	local Motion = { "106" , "112" , "106" }	-- �I�Y�B��e�B�I�Y
	local converse = { "[SC_KR_NEWSEASON_1]" , "[SC_KR_NEWSEASON_2]" , "[SC_KR_NEWSEASON_3]" }
	local month = GetSystime(3)+1	-- ��
	local day = GetSystime(4)		-- ��
	local date = month*100 + day
	local VOC = ReadRoleValue( OwnerID() , EM_RoleValue_VOC )--¾�~
	-- �ڳo�̦��ǯ��_���ؤl�A�����D���S���ѳf���H�Q�R�O�H
	-- �Z��R�����u�O�@�y�����������A�ӳo�c��ؤl�@�w���Ȥj���A�A����a�H
	-- �Τ߷P���۵M�A�N����|�X�̬��R���ᦷ�C
	AdjustFaceDir( TargetID() , OwnerID() , 0 ) -- ���V
	for i = 1 , table.getn(NPC) , 1 do
		if ReadRoleValue ( TargetID() , EM_RoleValue_OrgID ) == Npc[i] then	-- Zone 1
			PlayMotion( TargetID() , Motion[i] )
		--	Say( TargetID() , "Motion ="..Motion[i] )
			SetSpeakDetail( OwnerID() , converse[i] )
			if ( date >= 112 and date <= 216 ) or ( VOC == 0 ) then
		--	if date >= 112 and date <= 216 then
				AddSpeakOption( OwnerID() , TargetID() , "[SC_PLANT_18]", "Lua_Hao_Korea_plantshop_2", 0 ) -- �ʶR�ؤl
				DebugMsg( 0 , 0 , "date ="..date )
			else
				DebugMsg( 0 , 0 , "date ="..date )
			end
		end
	end
end

function Lua_Hao_Korea_plantshop_2() --�ʶR�ؤl
	CloseSpeak( OwnerID() )  --������ܵ���
	OpenShop()
end