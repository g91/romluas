---------------------------------------------------------------------------
--423779�Ѭr������
---------------------------------------------------------------------------
function LuaP_423779_01()	
	if (CheckAcceptQuest(OwnerID(),423779)==true )and( CheckCompleteQuest( OwnerID() , 423779) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423779_01]")       ----���ƶܡH�ګܦ��A�S�ƪ��ܤ��n�n�ڡI
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423779_02]","LuaP_423779_02",0)       ----�ЧA���ڻs�@�Ѭr��
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423779_02()	
		SetSpeakDetail(OwnerID(),"[SC_423779_03]")       ----�n�N���֧���Ƶ��ڡA���n���O���_�Q���ɶ��I
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423779_04]","LuaP_423779_03",0)       ----���į󵹨f�S��
end

function LuaP_423779_03()	
	if CountBodyItem( OwnerID(), 208922 )>=5 then
			DelBodyitem( OwnerID(),208922, 5 )
			GiveBodyitem( OwnerID(), 208978, 1 )
	elseif CountBodyItem( OwnerID(), 208922 )<5 then
			ScriptMessage(TargetID(), OwnerID(), 1, "[SC_423779_05]",  "0xffbf0b2b")
			ScriptMessage(TargetID(), OwnerID(), 0, "[SC_423779_05]",  "0xffbf0b2b")
	end
	CloseSpeak( OwnerID())
end

---------------------------------------------------------------------------
Function LuaP_117311_0()
	LoadQuestOption(OwnerID())
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	PlayMotion( TargetID(),ruFUSION_ACTORSTATE_emote_head_nod)	
end
---------------------------------------------------------------------------
--423900 ARGUE OF TWO BROTHER
----------------------------------------------------------------------------
function LuaP_423900_01()	
	if (CheckAcceptQuest(OwnerID(),423900)==true )and( CheckCompleteQuest( OwnerID() , 423900) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423900_01]")       ----�A���O�d���w�s�A�Ӫ��H�Q�M�n�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_02]","LuaP_423900_02",0)      ----�A���~��O���^�ơH 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423900_02()	
		SetSpeakDetail(OwnerID(),"[SC_423900_03]")       ----���A�e�X�ѭ�Ө��ù���S�q�W��......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_04]","LuaP_423900_03",0)    ----�i�H��ڻ�����L��a�o�ͪ��ƶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_05]","LuaP_423900_04",0)    ----��ı�o�A�]�\�Ӥߥ���M��ť�A�̸̧���
end

function LuaP_423900_03()
		SetSpeakDetail(OwnerID(),"[SC_423900_06]")      ---- �����ⶤ���S��A���ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423900_05]","LuaP_423900_04",0)  	 ----��ı�o�A�]�\�Ӥߥ���M��ť�A�̸̧���
end

function LuaP_423900_04()
		SetSpeakDetail(OwnerID(),"[SC_423900_07]")      ---- �����H���z�ٯ঳��������H
		SetFlag(OwnerID() ,544729, 1 )
end

---------------------------------------------------------------------------
--423928 SPECIAL SEEDS
----------------------------------------------------------------------------
function LuaP_423928_01()	
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423928)==true )and( CheckCompleteQuest( OwnerID() , 423928) == false) then
		SetSpeakDetail(OwnerID(),"[SC_423928_01]")       ----��ڦ�����ƶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_02]","LuaP_423928_02",0)      ----�ڥi�H��p���ǴӪ��ؤl�ܡH 
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423928_02()	
		SetSpeakDetail(OwnerID(),"[SC_423928_03]")       ----�Ӫ��ؤl�K�K�A�n�ؤl������O�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_04]","LuaP_423928_03",0)    ----���O
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_05]","LuaP_423928_05",0)    ----�S���A�O�L���U�ڪ�
end

function LuaP_423928_03()
	SetSpeakDetail(OwnerID(),"[SC_423928_06]")      ---- ���K�K�o�˪��A��p�A�ڤ����h�çA�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_07]","LuaP_423928_04",0)  	 ----�O�A�ګD�`����
end

function LuaP_423928_04()
		SetSpeakDetail(OwnerID(),"[SC_423928_09]")      ---- �A����կu�O�Ӧn�F�C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_11]","LuaP_423928_07",0)  ----�]�A�N�ʥi�C�_�����ܰO�b�ߤ��^
end

function LuaP_423928_05()
		SetSpeakDetail(OwnerID(),"[SC_423928_08]")      ---- �G�M�O�o�ˡK�K�ڴN���D��O�J���H���S���o��e���N���C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423928_07]","LuaP_423928_04",0)  	 ----�O�A�ګD�`����
end

function LuaP_423928_06()
		AdjustFaceDir( OwnerID(),TargetID(), 0 )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_emote_point)
		say(OwnerID(), "[SC_423928_10]")
		GiveBodyitem( TargetID(), 209000, 1 )
end	

function LuaP_423928_07()
	 CloseSpeak( OwnerID())        -----�`�NTargetID�MOwnerID�U�O��
	 BeginPlot( TargetID(), "LuaP_423928_06",10)
end

---------------------------------------------------------------------------
--423922 HER PRESENT
-----------------------------------------------------------------------------
function LuaP_423922_01()	
	if (CheckAcceptQuest(OwnerID(),423922)==true )and( CheckCompleteQuest( OwnerID() , 423922) == false)
	and CountBodyItem( OwnerID(), 209012 )==5 and  CountBodyItem( OwnerID(), 209013 )==1 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423922_01]","LuaP_423922_02",0)       ----�ЧA���ڧ�o�ӲŤ�M����O�b�@�_
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423922_02()	
	DelBodyitem( OwnerID(),209013, 1 )
	DelBodyitem( OwnerID(), 209012, 5 )
	GiveBodyitem( OwnerID(), 209011, 1 )
	CloseSpeak( OwnerID())
end
---------------------------------------------------------------------------
function LuaP_423922_03()
	local Obj = OwnerID() --����npc
	local Target = TargetID() --���a
	if	ReadRoleValue(Obj,EM_RoleValue_Register1)==0	then  --�ˬd EM_RoleValue_Register1(�ˬdnpc���Ȧs��)
		CallPlot(Obj,"LuaP_423922_04",Target)
	end
end

function LuaP_423922_04(Target)
	local Obj = OwnerID() --����NPC��ID
	--Target =  --���aID
	WriteRoleValue(Obj,EM_RoleValue_Register1,999) --�}�l�t�X���аO
	CloseSpeak(Target) --���O����
--�֤k�X�{����_�I�̮�
	local Girl = Lua_DW_CreateObj("flag",117516,780863,0)  --�ϥ��㹳�Ѥl
	DW_MoveToFlag( Girl , 780863,1,0 ,1)  
--���
	AdjustFaceDir(Obj,Girl,0) --����
	Say(Obj,"[SC_423922_02]")
	PlayMotion(Obj, ruFUSION_ACTORSTATE_emote_wave)
	sleep(15) --��......

	Say(Girl,"[SC_423922_03]")
	PlayMotion(Girl, ruFUSION_ACTORSTATE_emote_point)
	sleep(25)

	Say(Obj,"[SC_423922_04]")
	PlayMotion(Obj,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	sleep(25)

	Say(Girl,"[SC_423922_05]")
	PlayMotion(Girl,ruFUSION_ACTORSTATE_emote_angry)
	sleep(20)

--�h��
	WriteRoleValue(Girl  ,EM_RoleValue_IsWalk , 0 ) --�b�]
	DW_MoveToFlag( Girl , 780863,0,0 ,1) --�o�O�j��  ��F�~�]�U�@��
	DelObj(Girl) --�R���֤k
	WriteRoleValue(Obj,EM_RoleValue_Register1,0) --�����t�X���аO
end

---------------------------------------------------------------------------
function LuaP_423923_01()	
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423923)==true )and( CheckCompleteQuest( OwnerID() , 423923) == false)  
		and CountBodyItem(OwnerID(),209011)== 1 then
		SetSpeakDetail(OwnerID(),"[SC_423923_01]")       ----�A�O��誺�H�A�O�X�J�s�A�Ӫ��ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423923_02]","LuaP_423923_02",0)      ----��������|�o��ͮ�H	
	else
		LoadQuestOption( OwnerID() )
	end	
end

function LuaP_423923_02()	
		SetSpeakDetail(OwnerID(),"[SC_423923_03]")       ----���ڤ]���Q��L�o�ʮ�......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423923_04]","LuaP_423923_03",0)    ----�ⶵ��浹�����_�{��
end

function LuaP_423923_03()
	DelBodyitem( OwnerID(),209011, 1)
	SetFlag(OwnerID() ,544789, 1 )
	CloseSpeak( OwnerID())
	LoadQuestOption( OwnerID() )
end

---------------------------------------------------------------------------
--423922 MISSING MEMBER'S SERIES
-----------------------------------------------------------------------------
function LuaP_423904_01()
		local Target = TargetID()
		AddEXP(Target,8500)	
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_crafting_loop)
		sleep(15)
		PlayMotion( OwnerID(), ruFUSION_ACTORSTATE_EMOTE_eat)
		sleep(15)
		say(OwnerID(), "[SC_423904_02]")
		ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423904_01]",  "0xffbf0b2b"  )
		ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423904_01]",  "0xffbf0b2b"  )  ----�k��i���y�W��W�X�{�j��������B�~
end

------------------------------------------------------------------------------------
function LuaP_423903_01()	----��o�M�k��i���ܪ�flag
		SetFlag(TargetID(),544788, 1 )
end
	
------------------------------------------------------------------------------------
function LuaP_423905_01()	
	if (CheckAcceptQuest(OwnerID(),423905)==true )and( CheckCompleteQuest( OwnerID() , 423905) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423905_01]")       ----�A�n�A�s�Ӫ��_�I�̶ܡH�ݬݧڳo�䪺�f���a......
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_02]","LuaP_423905_02",0)       ----�е��ڤ@�����o��
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423905_02()
	SetSpeakDetail(OwnerID(),"[SC_423905_03]")       ----�u���A�̪�ڭ�n���i�f......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_04]","LuaP_423905_03",0)       ----�n�����I�Q�A�����D�i���i�H��K�y�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_05]","LuaP_423905_04",0)       ----���h�A�o�O400��
end
	
function LuaP_423905_03()
	SetSpeakDetail(OwnerID(),"[SC_423905_06]")       ----�o�w�g�ܫK�y�F�A�A�K�y�ڰZ�������H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423905_05]","LuaP_423905_04",0)       ----���h�A�o�O400��
end

function LuaP_423905_04()
		if  ReadRoleValue(OwnerID(),EM_RoleValue_Money )>399	then
			AddRoleValue(OwnerID(),EM_RoleValue_Money, -400)
			GiveBodyitem( OwnerID(), 209040, 1 )
		else
			CallPlot(OwnerID(), "LuaS_423905_06", O_ID )
		end
	SetSpeakDetail(OwnerID(),"[SC_423905_07]")       ----���´f�U�A�������ݧA���U�����{�C
end

function LuaS_423905_05()
		SetFlag(TargetID(), 544787, 1 )
		AddRoleValue(TargetID(),EM_RoleValue_Money, 200)
end

function LuaS_423905_06()
		ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423905_08]",  "0xffbf0b2b"   )
		ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423905_08]",  "0xffbf0b2b"   )
end

---------------------------------------------------------------------------
--423907 catching  hermit crab
-----------------------------------------------------------------------------
function LuaP_423907_01()-----���b���~SERVER�ݼ@���A���H�~�ɼ@��
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 423907 ) == false or CountBodyItem( OwnerID() , 209051 ) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end

	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  OrgID ~= 105193 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_01]", 0 ); -----�o��[209052]�u���[105193]�ϥ�
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----�Z���ӹL�����A�L�k�ϥΡC
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_02]", 0 ); ----[105193]���O�ä㤤�A�A�L�k���Q�ϥ�[209052]�C
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end

function LuaP_423907_02()
	if GiveBodyItem( OwnerID() , 209051 , 1 ) then
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423907_03]", 0 ); -------�A����[105193]�F�F�I
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
end



function LuaPG_tip()   -------�����⵹���ѭ�����

	FA_Border( OwnerID(), "[SC_423908_01]" )

end


---------------------------------------------------------------------------
--423926 mifaso series
-----------------------------------------------------------------------------
function LuaP_423926_01()
	AdjustFaceDir( TargetID(),OwnerID(), 0 )
	if (CheckAcceptQuest(OwnerID(),423926)==true )and(CheckFlag( OwnerID(), 544790 ) == false) then			
		SetSpeakDetail(OwnerID(),"[SC_423926_11]")       ----�A�ǳƦn�F�S�H�ڥi�n���o�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422974_0]","LuaP_423926_06",0)        ----�ǳƦn�F
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_12]","LuaP_423926_02",0)      ----�ڤw�g�O�U�ӤF
	else	
		LoadQuestOption( OwnerID() )
	end
	if  (CheckAcceptQuest(OwnerID(),423927)==true )and( CheckCompleteQuest( OwnerID() , 423927) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423927_01]")       ----�A�Q���D��
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423927_02]","LuaP_423927_02",0)       ----�Чi�D��
	end	
end

function LuaP_423926_02()	
		SetSpeakDetail(OwnerID(),"[SC_423926_06]")       ----�A�O�U�ӤF�ܡH���Ӷ��ǧi�D�ڧa
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_07]","LuaP_423926_04",0)    ----���T
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_08]","LuaP_423926_05",0)    ----���~
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_09]","LuaP_423926_05",0)    ----���~
end

function LuaP_423926_06()
		BeginPlot( TargetID(), "LuaP_423926_03",0)
end

function LuaP_423926_03()
	CloseSpeak( TargetID())        

	say(OwnerID(), "[SC_423926_01]")
	sleep(15)
	say(OwnerID(), "[SC_423926_02]")
	sleep(15)
	say(OwnerID(), "[SC_423926_03]")
	sleep(15)
	say(OwnerID(), "[SC_423926_04]")
	sleep(15)
	say(OwnerID(), "[SC_423926_05]")
end

function LuaP_423926_04()
	 CloseSpeak( OwnerID())        -----�`�NTargetID�MOwnerID�U�O��
	 SetFlag(OwnerID() ,544790, 1 )
end

function LuaP_423926_05()
		SetSpeakDetail(OwnerID(),"[SC_423926_10]")       ----�`ı�o�ǩǪ��K�K
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_07]","LuaP_423926_04",0)    ----���T
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_08]","LuaP_423926_05",0)    ----���~
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423926_09]","LuaP_423926_05",0)    ----���~
end

------------------------------------------------------------------------------
function LuaP_423927_02()
		SetSpeakDetail(OwnerID(),"[SC_423927_03]")       ----�S�Q��A�]���D�����K�K
		SetFlag(OwnerID(), 544794, 1 )
end



---------------------------------------------------------------------------
--423920 big cats! 
-----------------------------------------------------------------------------
function LuaP_423920_01()
	local NPC=TargetID()
	local player = OwnerID() --���a

	if CheckAcceptQuest( player, 423920 ) == true and CheckCompleteQuest( player , 423920) == false
	and 	CheckFlag(player,544798)==false	then
		SetSpeakDetail( player, "[SC_423920_02]" )	
		AddSpeakOption(  player, NPC , "[SC_423920_03]", "LuaP_423920_03",0)
	else
		LoadQuestOption(player)
	end
end

function LuaP_423920_03()
	local NPC=TargetID()
	local player = OwnerID() --���a

--	say(NPC,"00")
	local num=ReadRoleValue( NPC, EM_RoleValue_Register1 ) 
	if	num> 0	then
		SetSpeakDetail( player, "[SC_423920_04]" ) 
	else
		CloseSpeak( player )	--�����Ҧ���ܵ���
		CallPlot( NPC, "LuaP_423920_04", player,NPC )	--�I�s�U�@�q�禡
	end
end

function LuaP_423920_04(player,NPC)
	DisableQuest(NPC,true)
	sleep(25)
	say (NPC, "[SC_423920_01]")
	sleep(15)	
	local TIGER1 = Lua_DW_CreateObj("flag",105271,780864,0) ----�ͥX�C����
	local TIGER2 = Lua_DW_CreateObj("flag",105271,780864,1) 
	local Killcats = {0, 0}
	SetAttack(TIGER1 , player )
	SetAttack(TIGER2 , player )
	WriteRoleValue(NPC,EM_RoleValue_Register1,999)	

--	DebugMsg(0,0,"1")
	while 1 DO
--	DebugMsg(0,0,"2")
		if 	CheckAcceptQuest( player, 423920 ) == false 		then
--			DebugMsg(0,0,"3")
			while 1 DO
--				DebugMsg(0,0,"4")
				if	(CHECKID(TIGER1) == false OR ReadRoleValue(TIGER1,EM_RoleValue_IsDead) == 1)	AND
					(CHECKID(TIGER2) == false OR ReadRoleValue(TIGER2,EM_RoleValue_IsDead) == 1)	THEN
--					DebugMsg(0,0,"12")				
					DisableQuest(NPC,false)
					break			
				end
--				DebugMsg(0,0,"5")
			end
			Sleep(10)
--			DebugMsg(0,0,"6")	
			break
		end

--		DebugMsg(0,0,"7")
--		DebugMsg(0,0,ReadRoleValue(TIGER1 , EM_RoleValue_IsDead).."__"..Killcats[1])
		sleep(20)

		if ReadRoleValue(TIGER1 , EM_RoleValue_IsDead) == 1 and Killcats[1] <1 then
--			DebugMsg(0,0,"8")
			TIGER1 = Lua_DW_CreateObj("flag",105271,780864,0)
			SetAttack(TIGER1 , player )
			Killcats[1] = Killcats[1] + 1
		end

--		DebugMsg(0,0,"9")
--		DebugMsg(0,0,ReadRoleValue(TIGER2 , EM_RoleValue_IsDead).."__"..Killcats[2])

		if ReadRoleValue(TIGER2 , EM_RoleValue_IsDead) == 1 and Killcats[2] <1 then
			TIGER2 = Lua_DW_CreateObj("flag",105271,780864,1)
			SetAttack(TIGER2 , player )
			Killcats[2] = Killcats[2] + 1
		end

		Sleep(20)

		IF	Killcats[1] == 1 and Killcats[2] == 1	AND
			(CHECKID(TIGER1) == false OR ReadRoleValue(TIGER1,EM_RoleValue_IsDead) == 1)	AND
			(CHECKID(TIGER2) == false OR ReadRoleValue(TIGER2,EM_RoleValue_IsDead) == 1)	THEN
--				DebugMsg(0,0,"10")
				SetFlag(player, 544798,1)
				DisableQuest(NPC,false)
				break
		end

--		DebugMsg(0,0,ReadRoleValue(TIGER1 , EM_RoleValue_IsDead).."__"..Killcats[1])
--		DebugMsg(0,0,"11")
	END

--	DebugMsg(0,0,NPC)
	WriteRoleValue(NPC,EM_RoleValue_Register1,0)
	--say(player,"22")
--	CallPlot(Owner, "LuaP_423920_03",player,TIGER1 ,TIGER2,Owner )

end

-----------------------------------------------------------------------------
function LuaQ_PG_delmonster()
	sleep(100)
 	while 1 do
		if 	HateListCount( OwnerID() )==0	then	----�ˬd���ܦC��A�S���H����
			DelObj(OwnerID())				----�R���ۤv
			return
		end
		sleep(15)
	end	
end
-----------------------------------------------------------------------------
function LuaP_423920_02()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	Sleep(15)	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_LOOP)		
	Sleep(35)		
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)		
end


---------------------------------------------------------------------------
--423918 NATURAL POWER
-----------------------------------------------------------------------------
function LuaP_423918_01()
	CastSpell( OwnerID(), OwnerID(), 490098 )
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_crafting_loop)
	sleep(20)
	ScriptMessage( OwnerID() , TargetID(), 1 , "[SC_423918_01]" , 0 ) 
	ScriptMessage( OwnerID() , TargetID(), 0 , "[SC_423918_01]" , 0 )
end


---------------------------------------------------------------------------
--423919 NATURAL POWER 2
-----------------------------------------------------------------------------
function LuaP_423919_01()-----���b���~SERVER�ݼ@��...
	local OrgID = 0
	
	if CheckAcceptQuest( OwnerID() , 423919 ) == false  then  
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  OrgID ~= 105272 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_01]", 0 ); -----�o��[209074]���G�u���[105272]�ϥΡC
		return false
	end
	
	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422810_1]", 0 ); -----�Z���ӹL�����A�L�k�ϥΡC
			return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_02]", 0 )  ----IT CAN'T NOT BE GUIET
			return false
	end
		
	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423048_6]" , 0 ) --�e�w�g���F�C
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423048_6]" , 0 )
			return false
	end
	return true
end


function LuaP_423919_02()
	--if GiveBodyItem( OwnerID() , 209074 , 1 ) then
	--	UseItemDestroy(OwnerID())---�R�����b�ϥΪ����~
	--end
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423919_03]", 0 )  -------[105272] HAVE BEEN QUIET�I
	DELOBJ(TargetID())
	DW_QietKillOne(0,105331)   ---�R�R��������
end

-----------------------------------------------------------------------------
function LuaP_423919_03()    ---���b���Ϊ���W�C	
		SetPlot( OwnerID(), "range","LuaPG_423919_04", 150 )	
		--SAY (OwnerID(),"A")
end

function LuaPG_423919_04() 
--	if CheckFlag(OwnerID(), 544811)  == true  then
		--SAY (OwnerID(),"B")
--		SetFlag(OwnerID() ,544811,0)
--		BeginPlot(OwnerID(),"LuaPG_423919_05",0)
--	end
	local AttackStatue = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode )			--�P�_�O�_�i�J�԰� 1= �O 0= �_

	if	CheckAcceptQuest(OwnerID(),423919)==true	then
		if	CheckBuff(OwnerID(),509813)==false	and	AttackStatue==0          	then 	--no buff is normal can to begin the show
			AddBuff(OwnerID(),509813,1,-1)
			BeginPlot(OwnerID(),"LuaPG_423919_05",0)
		elseif	AttackStatue==1	then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205535_0]" , 0 ) 			
		end
	end
end

function LuaPG_423919_05()
		ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423919_04]" , 0 )    --�A��ı���񪺴Ӫ��̰ʤF�_��
		sleep(20)
		--SAY (OwnerID(),"C")
		if	CheckAcceptQuest(TargetID(),423919)==false	then
			CancelBuff(OwnerID(),509813) --finish process by no quest , so del the buff
		end
		--SAY (OwnerID(),"C")
		local PLANT_MONSTER = {} --To save the ID of PLANT_MONSTER
		local IfFinishLoop = false
		for i=1,5,1 do
			 PLANT_MONSTER[i]= Lua_DW_CreateObj( "flag" , 105272 , 780865 , i ) ----�ͥX�� i ���Ӫ���
			SetAttack(PLANT_MONSTER[i] , OwnerID())	  ----�D�ʧ������a
			for CheckTimes=1,9,1 do
				sleep(5)
				if	CheckAcceptQuest(TargetID(),423919)==false	then
					IfFinishLoop = true -- Really want to finish loop , change the boolin value
					break
				end
			end
			if	IfFinishLoop==true	then
				break
			end
		end
		CancelBuff(OwnerID(),509813) --finish process normally, so del the buff
end

----���@��flag�A���b�������ȫ�
function LuaPG_423919_06()
	SetFlag(TargetID(),544811,1)
	--if CheckFlag(OwnerID(),544811) == true  then
	--	say(OwnerID(),"Got")
	--end
	--SetPlot( 117464, "range","LuaPG_423919_04", 150 )	
	--SAY (OwnerID(),"D")
end


----------------------------------------------------------------------------
function LuaPG_test_01()
	CastSpell( OwnerID(), TargetID(), 509030 )
	sleep(20)
end


function LuaQ_PG_423919_delmonster()
	LockHP( OwnerID() , 500 , "LuaQ_PG_423919_delmonster_02" )  
	sleep(100)
 	while 1 do
		if 	HateListCount( OwnerID() )==0	then	----�ˬd���ܦC��A�S���H����
			DelObj(OwnerID())				----�R���ۤv
			return
		end
		sleep(15)
	end	
end

function LuaQ_PG_423919_delmonster_02()
	SetAttack(OwnerID(),TargetID())
	return false
end



