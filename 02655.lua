--ĵ�è��޼@��
function LuaAG_Patrol_leader()

	local dis = 10
	local count = 3 --�}�C���j�p�A��J3 �|�O 3*3 ���}�C�F���L�]����ƥ������_�ơA�ҥH��J 4 �|�O 5*4 ���}�C�C
	local checktime = 10 --�P�_���ɶ����Z�A�ƭȷU�C�A�P�_���W�v�U���A�U�۵M�A���Ӫ��귽�]�U�h
	local ReviveTime = 100  --��}�C����������������ɡA�i��}�C���m���ʧ@�A�p�G�� -1 �A�N�|���� OwnerID() �]�w�����ͮɶ����m
	local circle = 6000  --�h�ֶg�����㭫�ͤ@���A�p�G�� 0 �A�h�u����Ҧ���������~�i�歫��
--�إ߳o�Ӱ}�C
	local Matrix = LuaFunc_Matrix_Maker( dis , count ) 
--�إߤ@�� table�A�b�Q���ͪ��󪺦�m�� LuaFunc_CreateNPCByMatrix(ObjID,Matrix,A,B ) ���ͪ���C �䤤�|�ӼƭȨ̧ǥN�� 1.�n�ͦ�������ID 2.�@����Ǫ��}�C 3.�C��m 4.���m
	local ObjMatrix ={}
	ObjMatrix[1] = LuaFunc_CreateNPCByMatrix(106792,Matrix,3,-1 )
	
	ObjMatrix[2] = LuaFunc_CreateNPCByMatrix(106792,Matrix,2,0 )

	--ObjMatrix[3] = LuaFunc_CreateNPCByMatrix(106792,Matrix,2,0 )

--�Ѱj��禡Ū�J��ơA�ӱ���Ҧ��}�C�������󲾰�
	LuaFunc_NPCWalkByMatrix( ObjMatrix , Matrix , dis , count , checktime , circle ) 

--�N�ѦҪ���]�w�^��Ӫ��X���I
	LuaFunc_ResetMatrix( ReviveTime , Matrix)
--�n�D���s�����l�@��
	BeginPlot( OwnerID() , "LuaAG_Patrol_Relife" , 0 );

end

function LuaAG_Patrol_Relife()
	BeginPlot( OwnerID() , "LuaAG_Patrol_leader" , 2 );
end


--test��
function luaAG_SoulSmoke()
	local obj=0
	while true do
		obj=CreateObjByFlag( 120485, 780871 , 0 , 1 );
		SetModeEx( obj , EM_SetModeType_Mark , false ) 
		AddToPartition(obj,0)
		CallPlot(obj,"luaAG_SoulSmoke1",obj)
		Sleep(30)
	end
end
function luaAG_SoulSmoke1()

	LuaFunc_MoveToFlag( OwnerID(), 780871 , 1 ,0 )
	Sleep(30)
	--DebugMsg(0,0,"2")
	DelObj(OwnerID())
end


function lua_dragonpo_test()
	local Target=SearchRangeNPC(OwnerID(),1000)
	local rTarget={}
	local nRand=0
		for i=0,#Target do
			if  ReadRoleValue( Target[i] , EM_RoleValue_OrgID ) == 117560 then
				table.insert(rTarget ,Target[i])
			end
		end
		while 1 do
			nRand=Rand(3)+1
				CastSpell(OwnerID(),rTarget[nRand], 498754)
			Sleep(20)
		end
		--for i=0,#Target do
		--	if  ReadRoleValue( Target[i] , EM_RoleValue_OrgID ) == 117560 then
		--		table.insert(rTarget ,Target[i])
		--	end
		--end
		--while 1 do
		--	local nRand={1,2,3,4,5}
		--	for j=1,2 do
		--		local NN = Rand(table.getn(nRand))+1
		--		DebugMsg(0,0,NN)
		--		--SysCastSpellLv(OwnerID(),rTarget[nRand[NN]], 498754,1)
		--		CastSpell(OwnerID(),rTarget[nRand[NN]], 498754)
		--		table.remove(nRand,NN)
		--	end
		--	Sleep(20)
		--end
end


--2012/02/29 ���Ӫ�����
function Lua_120482_touche()
		SetPlot( OwnerID(),"touch","Lua_120482_1",40 );
end
function Lua_120482_1()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	CallPlot(O_ID,"Lua_120482_2",O_ID,T_ID);
end

function Lua_120482_2(O_ID,T_ID)
	DW_CancelTypeBuff(68,O_ID)	--�U��
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_421029_2]", 20, 131, 133, 0, "Lua_120482_3" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
end
function Lua_120482_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			DebugMsg(0,0,"past 1")
			EndCastBar( O_ID, CheckStatus )
			local ObjID = Lua_DW_CreateObj( "obj" , 120488 , T_ID )
			DebugMsg(0,0,ObjID )
			Hide(T_ID)
			CallPlot(ObjID,"Lua_120482_4",ObjID,T_ID)
			DebugMsg(0,0,"past 2")
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
function Lua_120482_4(O_ID,T_ID)
	DebugMsg(0,0,"past 3")
	Sleep(100);
	DebugMsg(0,0,"past 4")
	DebugMsg(0,0,OwnerID())
	DebugMsg(0,0,TargetID())
	Show(T_ID,0);
	DelObj(O_ID);
end



function lua_test_Tank02( p_top , UpDown )	--�𫰨��D�nscript
	local SkillID = { 497219 , 497220 }			--���Ĭ��B�H������
	local SkillLv = { 0 , 0 }
	local Pos									--Ū�����aBUFF��m
	local Time									--�ݾl���ĳѤU���ɶ�
	if UpDown == 1 then							--�W��
		--Say( OwnerID() , "In" )
		SetFlag( OwnerID() , 545041 , 1 )		--�����n���~�X��
		AddBuff( OwnerID() , 509876 , 0 , -1 )	--�W��BOSS����
		Pos = Lua_BuffPosSearch( OwnerID() , 509271 )
		Time = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_Time )
		AddBuff( TargetID() , 509271 , 0 , Time )
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , OwnerID() )
		SetExSkill( OwnerID() , TargetID() , SkillID[2] , SkillLV[2] )
		SetExSkill( OwnerID() , TargetID() , SkillID[1] , SkillLV[1] )
	elseif UpDown == 0 then						--�U��
		--Say( OwnerID() , "Out" )
		SetFlag( OwnerID() , 545041 , 0 )		--�������n���~�X��
		CancelBuff( OwnerID() , 509876 )		--�����W��BOSS����
		WriteRoleValue( TargetID() , EM_RoleValue_register1 , 0 )
		DelExSkill( OwnerID() , TargetID() , SkillID[1] )
		DelExSkill( OwnerID() , TargetID() , SkillID[2] )
	end
end

function lua_test_use11()
	Say(OwnerID(),"1")
	LuaFunc_MoveToFlag(OwnerID(),780871,2,0)
end


function luaT120710_01()	--������s�H�Ϲ�ܼ@��01
	--local Cd={};
	--local Cd[1] = CheckCompletequest(OwnerID(), )	--�O�_�����D�u����
	--local Cd[2] = CheckCompletequest(OwnerID(), )	--�O�_������u����
	--	if Cd[1] then
			SetSpeakDetail( OwnerID(), "[SC_120710_S01]" ); 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C01"), "luaT120710_02", 0 );
	--	elseif Cd[2] then
	--		SetSpeakDetail( OwnerID(), "[SD_110000_1]" ); 
	--	else
	--		SetSpeakDetail( OwnerID(), "[SD_110000_1]" ); 
	--	end
end

function luaT120710_02()	--������s�H�Ϲ�ܼ@��02
	SetSpeakDetail( OwnerID(), "[SC_120710_S02]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C02"), "luaT120710_03", 0 );
end

function luaT120710_03()	--������s�H�Ϲ�ܼ@��03
	SetSpeakDetail( OwnerID(), "[SC_120710_S03]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_120710_C03"), "luaT120710_04", 0 );
end

function luaT120710_04()	--������s�H�Ϲ�ܼ@��04
	LoadQuestOption(OwnerID())
end

--
function luaTZ23120715_01()	--������s�o�J���ܼ@��01
	AdjustFaceDir(TargetID(),OwnerID(),0)
	local Cd={}
	Cd[1] = CheckAcceptQuest( OwnerID(),425427 )	--�O�_������u����
	if Cd[1] then
		SetSpeakDetail( OwnerID(), "[SC_Z23120715_C01]" ); 
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S01"), "luaTZ23120715_02", 0 );
	else
		LoadQuestOption(OwnerID())		
	end
end
function luaTZ23120715_02()	--������s�o�J���ܼ@��02
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C02]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S02"), "luaTZ23120715_03", 0 );
end
function luaTZ23120715_03()	--������s�o�J���ܼ@��03
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C03]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120715_S03"), "luaTZ23120715_04", 0 );
end
function luaTZ23120715_04()	--������s�o�J���ܼ@��04
	SetSpeakDetail( OwnerID(), "[SC_Z23120715_C04]" ); 
end
--

function luaT425427_01()	--�P�d���K���D�U�J���01
	AdjustFaceDir(TargetID(),OwnerID(),0)
	local Cd={};
	 Cd[1] = CheckCompletequest( OwnerID(),425427 )	--�O�_�����D�u����
		if Cd[1] then
			SetSpeakDetail( OwnerID(), "[SC_Z23425427_01]" ); 
			AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23425427_02"), "luaT425427_02", 0 );
		else
			LoadQuestOption(OwnerID())		
		end
end
function luaT425427_02()	--�P�d���K���D�U�J���02
	SetSpeakDetail( OwnerID(), "[SC_Z23425427_03]" ); 
end


--������s���\����ܼ@��01
function lua_z23q425427_talk()
	if CheckAcceptQuest(OwnerID(),425427) and
		CheckFlag( OwnerID(),546494 )==false then
		SetSpeakDetail( OwnerID(),"[SC_Z23120716_C01]" )
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120716_S01"), "lua_z23q425427_t01", 0 )
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23q425427_t01()
	SetSpeakDetail( OwnerID(),"[SC_Z23120716_C02]" )
	SetFlag(OwnerID(),546494,1)
end

--Ū�Ѱʧ@�C
function Lua_AG_Read()
	AddBuff( OwnerID(), 501609 , 0 ,-1)
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_READING_BEGIN,ruFUSION_ACTORSTATE_READING_LOOP)
	sleep(30)
end
--z23,�t�Ҧu�áA���b�԰��}�l�ɡA�I�s�P�����
function lua_z23uesCallMeFrieds()	--use������ues �i�o��F
	local friends=SearchRangeNPC(OwnerID(),150)
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==106793 then
			SetAttack(friends[i],TargetID())
		end
	end
end
--z23,�g�L�t�Үɪ��P�w����A�p�G�S�ѥD�u���ܡA�|�Q��
function lua_z23youCannotPassLa1()
	SetPlot( OwnerID(),"range","lua_z23youCannotPassLa2",100 ) 
end
function lua_z23youCannotPassLa2()
	local PlayerJob = ReadRoleValue( OwnerID() , EM_RoleValue_VOC)
	if PlayerJob==0		then			--�ư�GM
		return
	end
	if CheckCompleteQuest( OwnerID(),425478 ) then
		--Say(OwnerID(),"1")
		return
	end
	local friends=SearchRangeNPC(TargetID(),150)
		--Say(TargetID(),"2")
	for i=0,#friends do
		if ReadRoleValue(friends[i],EM_RoleValue_OrgID)==106793 then
			SetAttack(friends[i],OwnerID())
		end
	end
end

function lua_z23i241300_usebeful()	--���~241300�����ľ��ϥΧP�w
	local tID=TargetID()
	local oID=OwnerID()
	local Dead=ReadRoleValue( TargetID(), EM_RoleValue_IsDead) 
	PlayMotion(tID,19)
	if tID==oID then
		CallPlot(tID,"lua_z23i241300_use01",1,oID)
	elseif ReadRoleValue(tID,EM_RoleValue_OrgID)==106795 or
	ReadRoleValue(tID,EM_RoleValue_OrgID)==101230 then
		if Dead==1 then
			ScriptMessage(tID,oID,1,GetString("EM_200928_1"),0)
		else
			CallPlot(tID,"lua_z23i241300_use01",2,oID)
		end
	end
end

function lua_z23i241300_use01(x,tID)
	local oID=OwnerID()
		Sleep(20)
	if x==1 then
		ScriptMessage(oID,tID,1,GetString("SC_Z23I241300_01"),0)
		AddBuff(tID,622609,0,10)
		return
	elseif x==2 then



		SetModeEx( oID  , EM_SetModeType_Mark, false )--�аO
		SetModeEx( oID  , EM_SetModeType_Searchenemy, false )--����
		SetModeEx( oID  , EM_SetModeType_Fight , false )--�i�������
		SetModeEx( oID  , EM_SetModeType_Strikback, false )--����
		SetStopAttack(oID)
		PlayMotion(oID,181)
		Sleep(5)
		PlayMotion(oID,182)
		Sleep(5)
		PlayMotion(oID,183)
		Sleep(10)
		PlayMotion(oID,164)
		Sleep(10)
		local Penpen = DW_CreateObjEX("obj",120789,oID);
		ScriptMessage(oID,tID,1,GetString("SC_Z23I241300_02"),0)
		 lua_AGMoveToFlag( oID,780871,9,0)
		Sleep(20)
		DebugMsg(0,0,"1")
		CallPlot( oID, "LuaFunc_ResetObj", oID )
		return
	end
end

function Lua_z23npc120789_touche()	--���ȫK�KĲ�I�@��
		SetPlot( OwnerID(),"touch","Lua_z23npc120789_1",25 );
end
function Lua_z23npc120789_1()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelMount(O_ID)
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_USEOBJ_02]", 50, 131, 133, 0, "Lua_z23npc120789_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
end
function Lua_z23npc120789_2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			DelBodyItem(O_ID,240957,1)
			GiveBodyItem( O_ID,241293,1 )
			DelObj( T_ID )
		else
			EndCastBar( O_ID, CheckStatus )
		end
	end
end	

function lua_testdd()
	SetDefIdleMotion(OwnerID(),101)
end

function lua_testdd_ini()
	SetDefIdleMotion(OwnerID(),11)
end

--����425434�A�����d�������
function  lua_z23q425434_01()
	--call ���y��
	if CheckAcceptQuest(OwnerID(),425434)==false and
	CheckCompleteQuest(OwnerID(),425434)==false then
	
		local npc=SearchRangeNPC(TargetID(),50)
		local act=0
			for i=0,#npc do
				if ReadRoleValue(npc[i],EM_RoleValue_OrgID)==120473 then
					act=npc[i]
				end
			end
		AdjustFaceDir(act,OwnerID(),0)
		Tell(OwnerID(),act,"[SC_Z23Q425434_01]")
	end
	if CheckAcceptQuest(OwnerID(),425434)==false then
		SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_02]")
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_03"), "lua_z23q425434_02", 0 );
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23q425434_02()
	LoadQuestOption(OwnerID())
end

function lua_z23q425434_w1()	--����425434�P�Ÿ������
	LoadQuestOption(OwnerID())
	AdjustFaceDir(TargetID(),OwnerID(),0)
	PlayMotion( TargetID(), 112) 
	if CheckAcceptQuest(OwnerID(),425434) and CheckFlag( OwnerID(),546490 )==false  and CountBodyItem(OwnerID(),241303)==0 then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_04"), "lua_z23q425434_w2", 0 );
	end
	if CheckAcceptQuest(OwnerID(),425437) and CheckFlag( OwnerID(),546493 )==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425437_01"), "lua_z23q425437_s1", 0 );
	end
end
function lua_z23q425434_w2()
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_05]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23Q425434_06"), "lua_z23q425434_w3", 0 );
end
function lua_z23q425434_w3()
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425434_07]")
	GiveBodyItem(OwnerID(),241303,1)
end

--��d������XŢ�l�@���C
function Lua_120838_touche()
		SetPlot( OwnerID(),"touch","Lua_120838_1",40 );
end
function Lua_120838_1()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)	--�U��
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_Z23120838_1]", 20, 131, 133, 0, "Lua_120838_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
end
function Lua_120838_2(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			if DelBodyItem(O_ID,241303,1) then
				DebugMsg(0,0,"past 1")
				EndCastBar( O_ID, CheckStatus )
				SetFlag(O_ID,546490,1)
				CallPlot(T_ID,"lua_FinishQ425434_Show",O_ID) --�I�s��Ӫ�t�A�@�ӬO�H����t�A�@�ӬO�}Ţ���
			else
				EndCastBar( O_ID, CheckStatus )
				DebugMsg(0,0,"past 2")
			end
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
--����d������t
function lua_FinishQ425434_Show(tar)
	local RoomID=ReadRoleValue( OwnerID(),EM_RoleValue_RoomID )
	local Act=CreateObjByFlag( 120841, 780871 , 10 , 1 )
	SetModeEx( Act,EM_SetModeType_Mark,false )
	AddToPartition( Act,RoomID )
	AdjustFaceDir(Act,tar,0)
	Sleep(10)
	NpcSay( Act,"[SC_Z23Q425434_08]" )
	Sleep(30)
	DelObj(Act)
end
--���ئr��
--SC_120838_1 ���}�cŢ�C
--SC_120838_2 �����K�Pı�ܤ[�S�Q�H��_�����F�A�Pı���s�A���C
--SC_120838_3 ���L���Ӥp���A���٬O�n�h�аV�аV�L�C
--SC_120838_4 �A���W�èS���_��

--�s���P�s���G��
function lua_z23q425437_s1()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_02]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s2", 0 );
end
function lua_z23q425437_s2()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_03]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s3", 0 );
end
function lua_z23q425437_s3()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_04]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s4", 0 );
end
function lua_z23q425437_s4()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_05]")
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_205764_2"), "lua_z23q425437_s5", 0 );
end
function lua_z23q425437_s5()
	PlayMotion( TargetID(), 112) 
	SetSpeakDetail(OwnerID(),"[SC_Z23Q425437_06]")
	SetFlag( OwnerID(),546493,1 )
end
--�ϥζ���÷���ˬd
function lua_QuestItem241289()
	local tmpTable={ 101230,101232,106795 }
	for i=1,3 do
		if ReadRoleValue( TargetID(),EM_RoleValue_OrgID)==tmpTable[i] then
			return true
		end
	end
	ScriptMessage(OwnerID(),OwnerID(),1,"[SC_I241289_TIP]",0)
	return false
end