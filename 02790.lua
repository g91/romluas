--===============================�������ʪ���§<��ܼ@��>===============================================
function TeaCat_Xmas2012_animalQ1()
	local Player = OwnerID()

--	if checkflag(Player, 547146)==true then--���L��������1�����X��
--		if CheckFlag(Player,547155)==true then--�ˬd���L����2���ʵ����X��
--			SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC09]")
--		else
--			if CheckFlag(Player, 547153)==true then--�ˬd���L������X��
--				SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC08]")
--				GiveBodyItem(Player,203734,6)
--				SetFlag(Player,547155,1)--����2���ʵ����X�ж}��
--				setflag(Player, 547148,0)--�N�ؼ��I�M�κX����
--				setflag(Player, 547149,0)
--				setflag(Player, 547150,0)
--				setflag(Player, 547151,0)
--				CancelBuff(Player, 623749)
--			else
--				if checkflag(player,547147)==false then
--					if CountBodyItem( Player, 242018 )>0  then
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC10]")--�A�n�ڡA�~���H�C
--					elseif CountBodyItem( Player, 242020 )>0  then---<�H�]���g>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC02]")--�����A�~���H...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--ť�W�h
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --�ѥ[
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --���ѥ[
--					elseif  CountBodyItem( Player, 242021 )>0  then---<������a�g>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC03]")--�����A�~���H...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--ť�W�h
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --�ѥ[
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --���ѥ[
--					elseif  CountBodyItem( Player, 242022 )>0  then---<���쨦�g>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC04]")--�����A�~���H...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--ť�W�h
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --�ѥ[
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --���ѥ[
--					elseif   CountBodyItem( Player, 242019 )>0 then --<���穥��g>
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC01]")--�����A�~���H...
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT03]" ,  "TeaCat_Xmas2012_animalQ2",0 )--ť�W�h
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --�ѥ[
--						AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --���ѥ[
--					elseif CountBodyItem( Player, 242018 )==0 and CountBodyItem( Player, 242020 )==0 or CountBodyItem( Player, 242021 )==0 or CountBodyItem( Player, 242022 )==0 or 		CountBodyItem( Player, 242019 )==0 then
--						SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC10]")--�A�n�ڡA�~���H�C
--					end
--				
--				else
--					SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC07]")--�ѫ~�ˤ���...
--				end
--			end	
--		end
--	else
		LoadQuestOption(Player)
--	end
end

function TeaCat_Xmas2012_animalQ2()--ť�W�h
	local player= OwnerID()
	SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC05]")
	AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT01]" ,  "TeaCat_Xmas2012_animalStart",0 ) --�ѥ[
	AddSpeakOption( Player , Player ,"[SC_2012_TCXMAS_OPT02]" ,  "TeaCat_Xmas2012_animalQ3",0 ) --���ѥ[
end

function TeaCat_Xmas2012_animalQ3()--���ѥ[
	local player= OwnerID()
	SetSpeakDetail( Player , "[SC_2012_TCXMAS_NPC06]")
end

function TeaCat_Xmas2012_animalStart()--�ѥ[
	local Player = OwnerID()
	local Npc = TargetID()
	CloseSpeak(player)
	SysCastSpellLv(player,NPC,  850469, 0)
	setflag(player,547147,1)--����2�X�l
	if CountBodyItem( Player, 242019 )>0  then
		setflag(player, 547148,1)--<���穥��M���蹳�X>
	elseif CountBodyItem( Player, 242020 )>0  then
		setflag(player, 547149,1)--<�H�]���M���蹳�X>
	elseif CountBodyItem( Player, 242021 )>0  then
		setflag(player, 547150,1)--<������a�M���蹳�X>
	elseif CountBodyItem( Player, 242022 )>0  then
		setflag(player, 547151,1)--<���쨦�M���蹳�X>
	end
		
end
--===============================================================================
function TeaCat_Xmas2012_FoodFindSnow(NPCID)--��m�ѫ~�e�ˬd
	local Player = OwnerID()
	local OrgID = SearchRangeNPC(Player, 25)
	--DebugMsg(Player,0,"running")
	for i = 1, #OrgID do
		local Shine = ReadRoleValue(OrgID[i], EM_RoleValue_OrgID)
		if Shine == NPCID then
	--	DebugMsg(Player,0,"got the snow")
			return true
		else
			ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING02]",0)
	--		say(Shine, "I'm here")
	--		say(NPCID, "Hello")
	--		DebugMsg(Player, 0, "no running")
			return false
		end	
	end
end
--==========================�ϥΨѫ~���@��============================================
function TeaCat_Xmas2012_SetFood()	--�ѫ~�ϥμ@��
	local Player = OwnerID()
	BeginCastBarEvent( Player, Player, "[SC_2012_TCXMAS_SETFOOD]", 10, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "TeaCat_Xmas2012_SetFood_Result" )
end

function TeaCat_Xmas2012_SetFood_Result(Obj,CheckResult)	--�ѫ~�ϥμ@��CastBar
	local Player = OwnerID()
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )

	if CheckResult > 0 then					--�j��0�O���\
		local Food = CreateObjByObj( 121566, Player )
		SetModeEx( Food, EM_SetModeType_Strikback, false )		--����
		SetModeEx( Food, EM_SetModeType_SearchenemyIgnore, false )	--�Q�j�M
		SetModeEx( Food, EM_SetModeType_Obstruct, false )		--����
		SetModeEx( Food, EM_SetModeType_Mark, false )			--�аO
		SetModeEx( Food, EM_SetModeType_Move, false )			--����
		SetModeEx( Food, EM_SetModeType_Searchenemy, false )		--����
		SetModeEx( Food, EM_SetModeType_HideName, false )		--�W��
		SetModeEx( Food, EM_SetModeType_ShowRoleHead, false )		--�Y����
		SetModeEx( Food, EM_SetModeType_Fight , false )			--�i�������
		SetModeEx( Food, EM_SetModeType_Drag , true )			--���O
		AddToPartition(Food , RoomID)
		CallPlot( Food, "TeaCat_Xmas2012_Food_Plot", food, 50 )
--	elseif CheckResult < 0 then 				--�p��0�O����
--		return
	end
	EndCastBar( Player, CheckResult )
	SetFlag(Player,547152,1)
	setFlag(Player,547153,1)
end

function TeaCat_Xmas2012_Food_Plot(food, time)
	sleep(time)
	delobj(food)
end

--=============================�������ʪ���§<���穥���]�~�g>===============================================
function TeaCat_Xmas2012_Animal1()
	local animal =OwnerID()
	local player = TargetID()
	DebugMsg(0, 0, "0")
	while true do
		sleep(50)--------------------------------------------�C5���ˬd�@��
	--	DebugMsg(0, 0, "1")
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781222, r , 0)--------animal�b�J�����X�ФW�H������
	--	DebugMsg(0, 0, "2")
		if  ReadRoleValue(animal,EM_RoleValue_Register1)==1 then------------------------�p�Ganimal���Q����...
			sleep(150)----------------------------------�h15������L�{��
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--�аO
			SetModeEx( animal  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--�Y����
	--		DebugMsg(0, 0, "3")
			LuaFunc_MoveToFlag(animal, 781222, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register1, 0 )
		else-------------------------------------------------�p�Ganimal�S���Q����...
			if checkbuff(animal,623748)==true then----�p�G�����a��animal buff
				sleep(200)---------------------------20���animal����
	--			DebugMsg(0, 0, "4")
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register1, 1 )
			else----------------------------------------�p�G�S�����a��animal buff
				sleep(100)-------------------------10���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
	--			DebugMsg(0, 0, "5")
				WriteRoleValue( animal, EM_RoleValue_Register1, 1 )
	--			DebugMsg(0, 0, "6")
			
			end

		end	
	end
end

--=============================�������ʪ���§<�H�]���]�~�g>===============================================
function TeaCat_Xmas2012_Animal2()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------�C5���ˬd�@��
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781223, r , 0)--------animal�b�J�����X�ФW�H������

		if  ReadRoleValue(animal,EM_RoleValue_Register2)==1 then------------------------�p�Ganimal���Q����...
			sleep(150)----------------------------------�h15������L�{��
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--�аO
			SetModeEx( animal  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--�Y����
			LuaFunc_MoveToFlag(animal, 781223, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register2, 0 )
		else-------------------------------------------------�p�Ganimal�S���Q����...
			if checkbuff(animal,623748)==true then----�p�G�����a��animal buff
				sleep(200)---------------------------20���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register2, 1 )
			else----------------------------------------�p�G�S�����a��animal buff
				sleep(100)-------------------------10���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register2, 1 )
			
			end

		end	
	end
end

--=============================�������ʪ���§<������a�]�~�g>===============================================
function TeaCat_Xmas2012_Animal3()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------�C5���ˬd�@��
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781224, r , 0)--------animal�b�J�����X�ФW�H������

		if  ReadRoleValue(animal,EM_RoleValue_Register3)==1 then------------------------�p�Ganimal���Q����...
			sleep(150)----------------------------------�h15������L�{��
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--�аO
			SetModeEx( animal  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--�Y����
			LuaFunc_MoveToFlag(animal, 781224, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register3, 0 )
		else-------------------------------------------------�p�Ganimal�S���Q����...
			if checkbuff(animal,623748)==true then----�p�G�����a��animal buff
				sleep(200)---------------------------20���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register3, 1 )
			else----------------------------------------�p�G�S�����a��animal buff
				sleep(100)-------------------------10���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register3, 1 )
			
			end

		end	
	end
end

--=============================�������ʪ���§<���쨦�]�~�g>===============================================
function TeaCat_Xmas2012_Animal4()
	local animal =OwnerID()
	local player = TargetID()

	while true do
		sleep(50)--------------------------------------------�C5���ˬd�@��
		local r= rand(6)
		LuaFunc_MoveToFlag(animal, 781225, r , 0)--------animal�b�J�����X�ФW�H������

		if  ReadRoleValue(animal,EM_RoleValue_Register4)==1 then------------------------�p�Ganimal���Q����...
			sleep(150)----------------------------------�h15������L�{��
			SetModeEx(animal  ,EM_SetModeType_Show , true ) 
			SetModeEx( animal   , EM_SetModeType_Mark, true )--�аO
			SetModeEx( animal  , EM_SetModeType_HideName, true )--�W��
			SetModeEx( animal , EM_SetModeType_ShowRoleHead, true )--�Y����
			LuaFunc_MoveToFlag(animal, 781225, r , 0)
			WriteRoleValue( animal, EM_RoleValue_Register4, 0 )
		else-------------------------------------------------�p�Ganimal�S���Q����...
			if checkbuff(animal,623748)==true then----�p�G�����a��animal buff
				sleep(200)---------------------------20���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register4, 1 )
			else----------------------------------------�p�G�S�����a��animal buff
				sleep(100)-------------------------10���animal����
				SetModeEx(animal  ,EM_SetModeType_Show , false ) 
				SetModeEx( animal   , EM_SetModeType_Mark, false )--�аO
				SetModeEx( animal  , EM_SetModeType_HideName, false )--�W��
				SetModeEx( animal , EM_SetModeType_ShowRoleHead, false )--�Y����
				WriteRoleValue( animal, EM_RoleValue_Register4, 1 )
			
			end

		end	
	end
end
--===============================<§�]�P�_>=========================================
function TeaCat_Xmas2012_FoodBag( Option )

	local Player= OwnerID()
--	local PackageID = 242018--�������p�c�l
	local FoodID = 726729 

	if ( Option == "CHECK" ) then
		if CountBodyItem( Player, 242019 )>0  or CountBodyItem( Player, 242020 )>0  or CountBodyItem( Player, 242021 )>0  or CountBodyItem( Player, 242022 )>0  then
			ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING03]",0)
			return false
		else
			return true
		end
	elseif ( Option == "USE" ) then
		GiveBodyItem( Player , FoodID  , 1 )
		ScriptMessage(Player,Player,3,"[SC_2012_TCXMAS_WARNING05]",0) 
	end
end

--=============================<�ޯ�>============================================
function TeaCat_Xmas2012_Skill()
	local Player = OwnerID()
	local Animal=TargetID()
	local CheckTable ={[121561]=1;[121562]=2;[121563]=3;[121564]=4;}
	local Num = ReadRoleValue( Animal, EM_RoleValue_OrgID )
	PlayMotion(Player,ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	AdjustFaceDir( Animal , Player , 0 )
--	FaceObj(Animal, Player)
	if checkflag(Player, 547152)==true then
		if CheckTable[Num] == 1 then
			if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY01]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 2 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY02]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 3 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY03]")
				addbuff(Player, 623747,0,600)
			end
		elseif CheckTable[Num] == 4 then
				if CheckBuff(Player, 623747) == true then
				ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING04]",0)
			else
				NPCSay(Animal,"[SC_2012_TCXMAS_MONSAY04]")
				addbuff(Player, 623747,0,600)
			end
		
		addbuff(Animal, 623748,0,3)
		end
	else
		ScriptMessage(Player,Player,1,"[SC_2012_TCXMAS_WARNING01]",0)
	end
end

--==========================���ի��O��==============================================
function TeaCat_Xmas2012_ReplayQ1()
	local owner= ownerID()
	setflag(owner, 547146, 0)--���Ȥ@����
	setflag(owner, 547147, 0)--���ȤG���ʶ}�l
	setflag(owner, 547148, 0)--���穥��M���蹳�X
	setflag(owner, 547149, 0)--�H�]���M���蹳�X
	setflag(owner, 547150, 0)--������a�M���蹳�X
	setflag(owner, 547151, 0)--���쨦�M���蹳�X
	setflag(owner, 547152, 0)--��U���~�X��
	setflag(owner, 547153, 0)--����X��
	setflag(owner, 547155, 0)--���ʵ����X��
	DelBodyItem(owner, 241995, 999)--���פ�
	DelBodyItem(owner, 242002, 1)--���״�
	DelBodyItem(owner, 242018, 1)--�������p�c�l
	DelBodyItem(owner, 242019, 1)--���˪��ѫ~
	DelBodyItem(owner, 242020, 1)--�{�����ѫ~
	DelBodyItem(owner, 242021, 1)--��{���ѫ~
	DelBodyItem(owner, 242022, 1)--���ߪ��ѫ~
	CancelBuff(owner, 623731)--�x�N
	CancelBuff(owner, 623747)--�]�~������
	CancelBuff(owner, 623749)--����2�}�l
	BeginPlot( owner, "Lua_DailyQuest_CLS",0 )
end

function TeaCat_Xmas2012_ReplayQ2()
	local owner = OwnerID()
	setflag(owner, 547147, 0)--���ȤG���ʶ}�l
	setflag(owner, 547148, 0)--���穥��M���蹳�X
	setflag(owner, 547149, 0)--�H�]���M���蹳�X
	setflag(owner, 547150, 0)--������a�M���蹳�X
	setflag(owner, 547151, 0)--���쨦�M���蹳�X
	setflag(owner, 547152, 0)--��U���~�X��
	setflag(owner, 547153, 0)--����X��
	setflag(owner, 547155, 0)--���ʵ����X��
	DelBodyItem(owner, 242019, 1)--���˪��ѫ~
	DelBodyItem(owner, 242020, 1)--�{�����ѫ~
	DelBodyItem(owner, 242021, 1)--��{���ѫ~
	DelBodyItem(owner, 242022, 1)--���ߪ��ѫ~
	CancelBuff(owner, 623731)--�x�N
	CancelBuff(owner, 623747)--�]�~������
	CancelBuff(owner, 623749)--����2�}�l
	GiveBodyItem(owner, 242018,1)
end		


--=================<�B�~�P�_>====================
function TeaCat_Xmas2012_FinishQ1()
	local Player = TargetID()	
	SetFlag(Player, 547146, 1)
	SetFlag(Player, 547168, 0)	--�C��X��
	SetFlag( Player, 547336, 1 )	--FN�K�[�����Լ��P�_�X��
	DesignLog( Player , 425721 , "425721 complete" )
end

--=================<�����ۥ����P�_>=======================
function TeaCat_Xmas2012_HitDeer(Player, Deer)
	SysCastSpellLv(Player, Deer, 850471,0)
end
--=================<���״��ϥΰϰ�P�_>====================
function TeaCat_Xmas2012_DeerSoup()
	local MyZoneID =  ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
	local MyZone = MyZoneID -1000*math.floor( MyZoneID / 1000 )
		
	if MyZoneID ~= 358 or MyZone ~= 358 then-----
	--	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_2012_TCXMAS_WARNING06]", 0 ) --(�o���~�u���b���i�԰���ϥ�)
		ScriptMessage( OwnerID(), OwnerID(), 3, "[SC_2012_TCXMAS_WARNING06]", 0 )
		return false
	end
	return true
end
--=================<HelpTeaCat>====================
function FN_Xmas2012_HelpTeaCat()	--��§�P�_�ؼ�OrgID
	local Monster = TargetID()
	local OrgID = ReadRoleValue( Monster, EM_RoleValue_OrgID )

	if OrgID ~= 121561 and OrgID ~= 121562 and OrgID ~= 121563 and OrgID ~= 121564 then
		return false
	end
	return true
end

function FN_Xmas2012_HelpTeaCat2()	--�����R�� �R����§buff
	local Player = OwnerID()
	CancelBuff( Player, 623749 )
end