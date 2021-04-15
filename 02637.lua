--��npc�ΡA��X�ͮɡA�N�Ǥ@�ӭȵ�Var_AC1_NpcGlobal_PH1
--AddToPartition
--DelFromPartition
function lua_AC1npcRecord()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase")
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	local x = 0 	--1�O�ݶ} 0�O�ݧR
	--���P�_���q
	if Phase==nil then
		DebugMsg(0,0,"can't find the phase")
		return
	end
	if Phase~=1 then
		--SetModeEx( OwnerID(), EM_SetModeType_SearchenemyIgnore , true )	--���Q�j�M
		DelFromPartition( OwnerID() )
		x = 1
	end
		while true do
			Phase = GetWorldVar( "Zone2_WorldPE_Phase")
			if Phase~=1 and x==0 then
				DelFromPartition( OwnerID() )
				x=1
			elseif Phase ==1 and x==1 then
				AddToPartition( OwnerID(),RoomID )
				x=0
			else
				--DebugMsg(0,0,"actest="..Phase)
			end
			Sleep(30)
		end
end
--�ɶ����call�o�ӧR��npc
function lua_AC1npcHide()

end
--�ɶ����call�o��show�X�Ҧ�npc
function lua_AC1npcShow()

end
--�]�wph1
function lua_AC1npcCleartable()
	Var_AC1_NpcGlobal_PH1={}
end
---------------------------------------------------------------------------------------------------------
			--��ܼ@��
---------------------------------------------------------------------------------------------------------
--���Э�npc�Ϊ����
function lua_AC1npcIntroduction_1()
	LoadQuestOption(OwnerID());
	AdjustFaceDir(OwnerID(),TargetID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_AC1L1NPC1_1") , "lua_AC1npcIntroduction_2",0 );
end
function lua_AC1npcIntroduction_2()
	SetSpeakDetail( OwnerID(), GetString("SC_AC1L1NPC1_2") ); 
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_AC1L1NPC1_3") , "lua_AC1npcIntroduction_3",0 );
end
function lua_AC1npcIntroduction_3()
	SetSpeakDetail( OwnerID(), GetString("SC_AC1L1NPC1_4") ); 
	AddSpeakOption( OwnerID(), TargetID(), GetString("SC_AC1L1NPC1_5") , "lua_AC1npcIntroduction_4",0 );
end
function lua_AC1npcIntroduction_4()
	SetSpeakDetail( OwnerID(), GetString("SC_AC1L1NPC1_6") ); 
end
------------------------------------------------------------------------------------------------------------------------
				--���ȹ��
------------------------------------------------------------------------------------------------------------------------
--����425167�A�j�k�v�⥾��s�A�V�����߰�����j�k�v�⥾�����O��

function lua_ac1L1425167_1()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(OwnerID(),TargetID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	if CheckAcceptQuest(OwnerID(),425167)==true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_01]", "lua_ac1L1425167_2", 0 );
	elseif  CheckCompleteQuest(OwnerID(),425167)==true then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_03]", "lua_ac1L1425167_3", 0 );	
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_05]", "lua_ac1L1425167_4", 0 );	
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_07]", "lua_ac1L1425167_5", 0 );
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_09]", "lua_ac1L1425167_6", 0 );
	end
end
function lua_ac1L1425167_2()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120336_02]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_03]", "lua_ac1L1425167_3", 0 );		--
end
function lua_ac1L1425167_3()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120336_04]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_05]", "lua_ac1L1425167_4", 0 );		--
end
function lua_ac1L1425167_4()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120336_06]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_07]", "lua_ac1L1425167_5", 0 );		--
end
function lua_ac1L1425167_5()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120336_08]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_09]", "lua_ac1L1425167_6", 0 );		--
end
function lua_ac1L1425167_6()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120336_10]" );
	SetFlag(OwnerID(),546168,1)
end

function lua_acpulirobossuse1()
	--20120112�s�W�A�ѨM�X�ͭ��V���D
	faceFlag ( OwnerID(), 780871 , 1 )
	AdjustDir( OwnerID(), 0 )
end
--�D���ȡA�K�K���
function lua_ac1L120342_1()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(OwnerID(),TargetID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL120342_01]", "lua_ac1L120342_2", 0 );		--
end
function lua_ac1L120342_2()
	SetSpeakDetail( OwnerID(), "[SC_ACL120342_02]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL120342_03]", "lua_ac1L120342_3", 0 );		--
end
function lua_ac1L120342_3()
	SetSpeakDetail( OwnerID(), "[SC_ACL120342_04]" );	
end




--AC�A���a�PNPC�f�ԧJ�I���Z���ɪ����
function AC_weaponCreator_1()
	local own = OwnerID()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	local npcText = {"[SC_ACWEAPON_1]","[SC_ACWEAPON_2]","[SC_ACWEAPON_3]","[SC_ACWEAPON_4]"}
		SetSpeakDetail( own , npcText[Phase] )
		AddSpeakOption( own,TargetID( ),"[SC_ACWEAPON_SHOW]","AC_weaponCreatorShow", 0 )--�ڷQ�n���ѹϼ�
		AddSpeakOption( own,TargetID( ),"[SC_ACMAGICNOTE2_1]","AC_weaponCreatorTalk_1", 0 )--����j�k�v�⥾���O��
end
--�ڷQ�n���ѹϼ�
function AC_weaponCreatorShow() --�[���
	SetShop( TargetID( ) , 600390 , "Test_Shop_Close" )
	CloseSpeak( OwnerID() );  --������ܵ���
	OpenShop()
end
--�ڷQ�n���D�һݪ��s�@������
function AC_weaponCreatorTalk_1() 
	SetSpeakDetail( OwnerID( ) , "[SC_ACMAGICNOTE2_2]" ) 
	AddSpeakOption( OwnerID( ),TargetID( ),"[SC_ACMATERIAL3_1]","AC_weaponCreatorTalk_2", 0 )--�ڷQ���D�p����o�o����
	AddSpeakOption( OwnerID( ),TargetID( ),"[SC_ACMATERIAL4_1]","AC_weaponCreatorTalk_3", 0 )--�p�󥴳y�ݩ�ڪ��Z��
--	AddSpeakOption( OwnerID( ) ,TargetID( ),"[SO_BACK]","AC_weaponCreator_1", 0 )--��^�W�@��
end
--�ڷQ���D�p����o�o����
function AC_weaponCreatorTalk_2() 
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_2]" ) 
	AddSpeakOption( OwnerID(),TargetID( ),"[SC_ACMATERIAL3_3]","AC_weaponCreatorTalk_21", 0 )
	AddSpeakOption( OwnerID(),TargetID( ),"[SC_ACMATERIAL3_4]","AC_weaponCreatorTalk_22", 0 )
	AddSpeakOption( OwnerID(),TargetID( ),"[SC_ACMATERIAL3_5]","AC_weaponCreatorTalk_23", 0 )
	AddSpeakOption( OwnerID(),TargetID( ),"[SC_ACMATERIAL3_6]","AC_weaponCreatorTalk_24", 0 )
	AddSpeakOption( OwnerID(),TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_1", 0 )--��^�W�@��
end
--
function AC_weaponCreatorTalk_21()
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_31]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_2", 0 )--��^�W�@��
end
--
function AC_weaponCreatorTalk_22()
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_41]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_2", 0 )--��^�W�@��
end
--
function AC_weaponCreatorTalk_23()
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_51]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_2", 0 )--��^�W�@��
end
--
function AC_weaponCreatorTalk_24()
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_61]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_2", 0 )--��^�W�@��
end
--�p�󥴳y�ݩ�ڪ��Z��
function AC_weaponCreatorTalk_25() 
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL3_7]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_2", 0 )--��^�W�@��
end

function AC_weaponCreatorTalk_3()
	SetSpeakDetail( OwnerID() , "[SC_ACMATERIAL4_2]" ) 
	AddSpeakOption( OwnerID() ,TargetID( ),"[SO_BACK]","AC_weaponCreatorTalk_1", 0 )--��^�W�@��
end

--120339�P�k���[�檺���
function lua_ac1L1120339_1()
	LoadQuestOption(OwnerID())
	AdjustFaceDir(OwnerID(),TargetID(),0);
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120339_01]", "lua_ac1L1120339_2", 0 );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120336_05]", "lua_ac1L1120339_4", 0 );
end
function lua_ac1L1120339_2()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120339_02]" );
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_ACL1120339_03]", "lua_ac1L1120339_3", 0 );
end
function lua_ac1L1120339_3()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120339_04]" );
end
function lua_ac1L1120339_4()
	SetSpeakDetail( OwnerID(), "[SC_ACL1120339_06]" );
end


--���q2�A�P�d���p�������
function lua_ACL120510_01()
	LoadQuestOption(OwnerID())
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ACL120510_01]","lua_ACL120510_02",0)
end
function lua_ACL120510_02()
	SetSpeakDetail(OwnerID(),"[SC_ACL120510_02]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_ACL120510_03]","lua_ACL120510_03",0)
end
function lua_ACL120510_03()
	CloseSpeak(OwnerID() )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	ChangeZone(OwnerID(), 2, 0, 2666.8 , 43.7 , 1090.1 , 0)
end