---------------------------------------------------------------------------
--423911 spy series
-----------------------------------------------------------------------------
function LuaP_423911_01()
	SetPlot( OwnerID(),"range","LuaP_423911_05",60 )  ----�d��@���}�l
end
	
function LuaP_423911_05()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544791,1)
	end
end

function LuaP_423911_06()
	SetPlot( OwnerID(),"range","LuaP_423911_07",60 ) 
end

function LuaP_423911_07()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544792,1)
	end
end

function LuaP_423911_08()
		SetPlot( OwnerID(),"range","LuaP_423911_09",100 ) 
end

function LuaP_423911_09()
	if	CheckAcceptQuest(OwnerID(),423911)==true	and    CheckFlag(OwnerID(),544795)==true   then
		SetFlag(OwnerID(),544793,1)
	end
end
---------------------------------------------talking
function LuaP_423911_02()	
	if (CheckAcceptQuest(OwnerID(),423911)==true )and( CheckCompleteQuest( OwnerID() , 423911) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423911_01]")       ----�A�@�N�����ܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_02]","LuaP_423911_03",0)       ----���@�N����
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423911_03()
	SetSpeakDetail(OwnerID(),"[SC_423911_03]")       ----���ڥ����ۧڤ��СK�K
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_04]","LuaP_423911_04",0)       ----�A������
end
	
function LuaP_423911_04()   
	SetSpeakDetail(OwnerID(),"[SC_423911_05]")       ----�A�ݨ쭫�I�F
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423911_06]","LuaP_423911_10",0)       ----�A��
end

function LuaP_423911_10()   
	CloseSpeak(OwnerID())----�������ȵ���
	SetFlag(OwnerID(), 544795, 1 )

	BeginPlot(TargetID(), "LuaPG_423911_11",0)
end

function LuaPG_423911_11()
	SetFlag(TargetID(), 544917, 1 )  ----���o�Ӫ��ɭԬݤ���NO1�ܥ������A�O�o�̫�n����
	local L_acting=Lua_DW_CreateObj("flag",117557,780866,1)   ----�t���εܥ������A�ͩ��1�ڴѤl

--say(OwnerID(),"00")

	Say(L_acting,"[SC_423911_08]")
	Sleep(20)
	
	DW_MoveToFlag( L_acting ,780866,2,0,1)    ----�����2�ڴѤl
	DelObj(L_acting) ----�����t�����H

	SetFlag(TargetID(), 544918, 1 )  ----���o�Ӫ��ɭԬݨ�NO2�ܥ������A�O�o�����������a�����Ȯɭn����
end

function LuaPG_423911_COMPLETE()
	SetFlag(TargetID(), 544917, 1 )  ----���o�Ӫ��ɭԬݤ���NO1�ܥ������A�O�o�̫�n����
	SetFlag(TargetID(), 544918, 1 )  ----���o�Ӫ��ɭԬݨ�NO2�ܥ������A�O�o�����������a�����Ȯɭn����
end

---------------------------------------------------------------------------
--423912 spy series 2
-----------------------------------------------------------------------------
function LuaP_423912_01()	
	if (CheckAcceptQuest(OwnerID(),423912)==true )and( CheckCompleteQuest( OwnerID() , 423912) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423912_01]")       ----�L��
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_02]","LuaP_423912_02",0)       ----���A�A�n�O�����A�ڴN�����D�n���ϧA�F�C
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423912_02()
	SetSpeakDetail(OwnerID(),"[SC_423912_03]")       ----�]�ôb���ݵۧA�^
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_04]","LuaP_423912_03",0)       ----�p�G�A�S���γB�A���䨺�ӤH���⪽�����F�A�C
end

function LuaP_423912_03()
	SetSpeakDetail(OwnerID(),"[SC_423912_05]")       ----�]�����z�|�X���ߡ^
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423912_06]","LuaP_423912_04",0)       ----�i�O�p�G�A�������A�ڥi�H���A�V�p�����D���C
end

function LuaP_423912_04()   
	SetSpeakDetail(OwnerID(),"[SC_423912_07]")       ----�ڻ��A�ڻ��C
	SetFlag(OwnerID(), 544796, 1 )
end

---------------------------------------------------------------------------
--423913 spy series 3
-----------------------------------------------------------------------------
function LuaP_423913_01()	
	if (CheckAcceptQuest(OwnerID(),424199)==true )and( CheckCompleteQuest( OwnerID() , 424199) == false) then
		DW_QietKillOne(0,105268)   ----�R�R�������ǡA�e�̱�����̡A0�N�����a
		ScriptMessage( TargetID(), OwnerID(), 1, "[SC_423913_01]",  "0xffbf0b2b"  )
		ScriptMessage( TargetID(), OwnerID(), 0, "[SC_423913_01]",  "0xffbf0b2b"  )  
	end
	return 1  ----�קK�I�������O�����
end

----�������ȫ�A�֮欥�����A�ܥ������]�h��buff�^�A���ͺt���κ֮欥�M�t���εܥ��A��H���}
function LuaPG_423913_02()
	AddBuff(TargetID(),509385,1,20)

	local L_acting=Lua_DW_CreateObj("flag",117946,780866,3)   ----�ͦb��3�ڴѤl
	SetFlag(TargetID(), 544918, 0 )  
	local FU_acting=Lua_DW_CreateObj("flag",117947,780866,4)  ----�ͦb��4�ڴѤl
	
	WriteRoleValue(L_acting  ,EM_RoleValue_IsWalk , 1 )  ----WALKING
	Hide( L_acting)
	Show( L_acting , 0)
	
	DW_MoveDirectToFlag( L_acting , 780866,5,0 ,1) 
	DW_MoveToFlag( FU_acting , 780866,6,0 ,1)    ----�����6�ڴѤl

	DelObj(L_acting)
	DelObj(FU_acting)
	
	CancelBuff(TargetID(),509385)
end

---------------------------------------------------------------------------
--423914 spy series 4
-----------------------------------------------------------------------------
function LuaPG_423914_01() 
	local FOGRO = TargetID() --�ŧi��NPC��TargetID
	local O_ID = OwnerID() --���a

--SAY(TargetID() ,"00")	

	if CheckAcceptQuest( O_ID, 423914 ) == true and CheckFlag( O_ID , 544959) == false then
		--�_�h�i��ĤG�P�_  ������ �S���X��
		AddSpeakOption( O_ID, FOGRO , "[SC_423914_002]", "LuaPG_423914_02",0) --�ڷǳƦn�F�C
		SetSpeakDetail(OwnerID(),"[SC_423914_001]")
	else
		LoadQuestOption( O_ID )	--�p�G�����o�ӡA��NPC��L���ȱN���|�Q���a�ݨ�
	end
end

function LuaPG_423914_02()
	local FOGRO = TargetID() --FOGRO
	local O_ID = OwnerID() --���a
	if	ReadRoleValue( FOGRO, EM_RoleValue_Register1 ) > 0	then
		SetSpeakDetail( O_ID, "[SC_423914_003]" ) --�еy���ڤ@�U�C
	else
		CloseSpeak( OwnerID() )	--�����Ҧ���ܵ���
		WriteRoleValue( FOGRO, EM_RoleValue_Register1, 1 )	--��NPC�ܦ��L
		CallPlot( FOGRO, "LuaPG_423914_03", O_ID )	--�I�s�U�@�q�禡
	end
end

function LuaPG_423914_03(Player)	
	local Fogro = OwnerID()
	local Old_NALEN = LuaFunc_SearchNPCbyOrgID( Fogro, 117288, 120, 0 )
--say(Fogro,Old_NALEN)
	local NALEN = DW_CreateObjEX("obj",117953,Old_NALEN) --�إ߷s���������R
	SetModeEx(NALEN ,EM_SetModeType_ShowRoleHead,false)           ---����ܦ��
	SetModeEx( NALEN , EM_SetModeType_HideName, true)--�W��
	local Sheryl = LuaFunc_SearchNPCbyOrgID( Fogro, 117483, 120, 0 )
 		
		Adjustfacedir(NALEN,FOGRO,0)

		Say( FOGRO , "[SC_423914_01]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(35)

		Say( FOGRO , "[SC_423914_02]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Say( FOGRO , "[SC_423914_03]")
		PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Say( NALEN , "[SC_423914_04]")
		PlayMotion( NALEN  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(25)

		Adjustfacedir(Sheryl,NALEN,0)

		Say( Sheryl, "[SC_423914_05]")
		PlayMotion( Sheryl, ruFUSION_ACTORSTATE_emote_laugh)			
		Sleep(10)


	SetFlag(Player,544959,1) --�����a�X��

	DelObj(NALEN)
	WriteRoleValue( Fogro, EM_RoleValue_Register1, 0 )--���}��欥�����
end

function LuaPG_423914_break()					--�o�q�����_/�����ɭn�@���Ʊ�(�ݭn���禡���U�P�_)(423519�n�אּ�ۤv�����Ƚs��)
	local FOGRO = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117947, 150, 0 )--�j�M����ѥ[��NPC�t��
	local NALEN = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117953, 150, 0 )
	local Sheryl = LuaFunc_SearchNPCbyOrgID( OwnerID(), 117954, 150, 0 )
	
	if FOGRO ~= nil then delobj(FOGRO) end							--�p�G�s�b �h�R��
	if NALEN ~= nil then delobj(NALEN) end
	if Sheryl ~= nil then delobj(Sheryl) end
	ks_resetObj( OwnerID(), nil )									--�D�`���n �R�������t���@����NPC �@���m
end



--function LuaP_423914_01()  ----���b���ȵ�����A�ҥHowner��npc�Atarget�����a	
--	local FOGRO = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117452 , 300 ) --����npc
--	if	ReadRoleValue(FOGRO,EM_RoleValue_Register1)==0	then  --�ˬd EM_RoleValue_Register1
--		CallPlot( OwnerID(),"LuaPG_423914_02",FOGRO)
--	end
--end

--function LuaPG_423914_02(FOGRO)
--	local NALEN = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117288 , 300 )
--	local  Sheryl = LuaFunc_SearchNPCbyOrgID( OwnerID() , 117483 , 300 )

	--Say(OwnerID(),1)
	--Say(TargetID(),2)
	--Say(OwnerID(),Sheryl)

--	WriteRoleValue(FOGRO,EM_RoleValue_Register1,999)

--	DebugMsg(0,0,"1")

	--CloseSpeak(TargetID() )
	
--	Sleep(25)
--	Adjustfacedir(NALEN,FOGRO,0)

--	Say( FOGRO , "[SC_423914_01]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(35)

--	Say( FOGRO , "[SC_423914_02]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Say( FOGRO , "[SC_423914_03]")
--	PlayMotion( FOGRO , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Say( NALEN , "[SC_423914_04]")
--	PlayMotion( NALEN  , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
--	sleep(25)

--	Adjustfacedir(Sheryl,NALEN,0)

--	Say( Sheryl, "[SC_423914_05]")
--	PlayMotion( Sheryl, ruFUSION_ACTORSTATE_emote_laugh)
--	sleep(20)

--	WriteRoleValue(FOGRO,EM_RoleValue_Register1,0)
--end


---------------------------------------------------------------------------
--423915 spy series 5
-----------------------------------------------------------------------------
function LuaP_423915_01()	
	if (CheckAcceptQuest(OwnerID(),423915)==true )and( CheckCompleteQuest( OwnerID() , 423915) == false) then
		Adjustfacedir(TargetID(),OwnerID(),0)
		SetSpeakDetail(OwnerID(),"[SC_423915_01]")       ----�A���N�@�O
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423915_02]","LuaP_423915_02",0)       ----�����ڥ[�J
	else
		LoadQuestOption( OwnerID() )
	end
end

function LuaP_423915_02()   
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 544797, 1 )
end

---------------------------------------------------------------------------
--423916 spy series 6
-----------------------------------------------------------------------------
----�������ȫ�A�֮欥�����A���ͺt���κ֮欥�M�t���εܥ��A��H���}
function LuaPG_423916_01()
	local L_acting=Lua_DW_CreateObj("flag",117557,780866,7)   ----�ͦb��7�ڴѤl
	local FU_acting=Lua_DW_CreateObj("flag",117558,780866,8)  ----�ͦb��8�ڴѤl
	
	DW_MoveToFlag( L_acting , 780866,9,0 ,1)    ----�����9�ڴѤl
	DW_MoveToFlag( FU_acting , 780866,10,0 ,1)    ----�����10�ڴѤl

	DelObj(L_acting)    ----�����t�����H
	DelObj(FU_acting)
end