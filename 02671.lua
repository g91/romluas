function lua_z23t120711_01()	--����425474�ĨĤ��o�F
	LoadQuestOption(OwnerID())
	
end

function lua_z23t120511_01()	--����425474�ĨĤ��o�F �Pnpc����J�����
	if CheckAcceptQuest(OwnerID(),425474) then
		SetSpeakDetail( OwnerID(), "[SC_Z23120511_S1]" ); 	--�O�A���K���٬O�Ӥ��Ϊ���o�C
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120511_C1"), "lua_z23t120511_02",0)
	else
		LoadQuestOption(OwnerID())
	end
end
function lua_z23t120511_02()
	SetSpeakDetail( OwnerID(), "[SC_Z23120511_S2]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_Z23120511_C2"), "lua_z23t120511_03",0)
end
function lua_z23t120511_03()	--����425474�ĨĤ��o�F �Pnpc����J�����
	SetFlag(OwnerID(),546486,1)
	LoadQuestOption(OwnerID())
end

--425476 z23���ȵ��N�����F
function Lua_z23q425476_talkwithJILL()	--���
	LoadQuestOption(OwnerID());
	if CheckAcceptQuest(OwnerID(),425476)==true and CheckFlag(OwnerID(),546487)==false then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_425476_S01]","LuaP_425476_1",0);
	end
end
function LuaP_425476_1()	--�I�s��t
	CloseSpeak( OwnerID() )
	local tmpNPC = SearchRangeNPC( TargetID(), 50 )	--search NPC�P��䤤��(106794)
	local objnum =0					--�O������ƶq
	local obj = 0						--�^�Ǫ�������ID
		for i = 0,#tmpNPC-1 do
			if ReadRoleValue( tmpNPC[i], EM_RoleValue_OrgID ) == 106794 then
				objnum = objnum +1
			end
		end
		if objnum >0 then
			ScriptMessage(OwnerID(),OwnerID(),0,"[SC_424528_3]",C_SYSTEM);
			CloseSpeak(OwnerID());
		else
			local tx,ty,tz,tdir 
				tx=ReadRoleValue( TargetID(),EM_RoleValue_X);
				ty=ReadRoleValue( TargetID(),EM_RoleValue_Y);
				tz=ReadRoleValue( TargetID(),EM_RoleValue_Z);
				tdir=ReadRoleValue(TargetID(),EM_RoleValue_Dir);
			obj = CreateObj( 106794, tx, ty, tz, tdir,1 )
			SetFightMode ( obj, 0, 0, 0,0 ) 
			SetModeEx( obj, EM_SetModeType_Show, false )
			SetModeEx( obj, EM_SetModeType_Mark, false )
			AddToPartition( obj, 0 )
			CallPlot( obj, "LuaP_425476_2",obj )
		end
end
function LuaP_425476_2( O_ID )
	local QuestID = 425476				--���Ƚs��
	local FinishFlagID = 546487			--����������o���X��
	local CheckBuffID = 507178			--�ˬd�O�_���b�t����BUFF
	local CheckRange = 150				--�t�����ˬd�d��
	local ActorArray = {}				--(�s���ק�)�t���}�C��
	local RoomID= ReadRoleValue(O_ID,EM_RoleValue_RoomID)
		ActorArray[1] =CreateObj_ByObjPoint( O_ID, 120513, "p_down" )	--��t�ΦN��
		ActorArray[2] =CreateObjByFlag( 120474,780871,8,1 )		--��t�αd�����D�h��w
			SetModeEx(  ActorArray[1]  , EM_SetModeType_ShowRoleHead, true )	
			SetModeEx(  ActorArray[2]  , EM_SetModeType_ShowRoleHead, true )
			AddToPartition(ActorArray[1],RoomID)
			AddToPartition(ActorArray[2],RoomID)
	CallPlot( O_ID,"Ag_QuestS1",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )	--��t�}�l
	--�d������Ϊ��ˬd�禡
		SetDefIdleMotion( ActorArray[1],ruFUSION_MIME_EMOTE_TIRED )
			Sleep(20)
		Say(ActorArray[1],"[SC_425476_S02]" )
		SetDefIdleMotion( ActorArray[1],ruFUSION_MIME_CROUCH_BEGIN )
			Sleep(40)
		Say(ActorArray[1],"[SC_425476_S03]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S04]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S05]" )
			Sleep(40)
		Say(ActorArray[2],"[SC_425476_S06]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S07]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S08]" )
			Sleep(40)
		Say(ActorArray[1],"[SC_425476_S09]" )
			Sleep(10)
		Say(ActorArray[2],"[SC_425476_S10]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S11]" )
			Sleep(40)
		Say(ActorArray[2],"[SC_425476_S12]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S13]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S14]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S15]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S16]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S17]" )
			Sleep(30)
		PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[2],"[SC_425476_S18]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S19]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S20]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S22]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S23]" )
			Sleep(30)
		Say(ActorArray[2],"[SC_425476_S24]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S21]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S25]" )
			Sleep(30)
		Say(ActorArray[1],"[SC_425476_S26]" )
			Sleep(30)
		Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end
--�P�_�O�_�����ٸ�
function lua_Z23Q425476_1()
	Setflag(OwnerID(),546484,1)
end
--����425477�A����J��ܼ@��
function lua_z23q425477_Morrok()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425477)==true and CheckFlag(OwnerID(),546488)==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S1"), "lua_z23q425477_Morrok1" ,0)
	end
	if ReadRoleValue(TargetID(),EM_RoleValue_Register1)==0 then
		CallPlot(TargetID(),"lua_z23CheckObjIRU_A",0)
	end
end 
function lua_z23CheckObjIRU_A()
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1 )
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = CreateObj(106794,x,y,z,dir,1)
			SetModeEx( obj  , EM_SetModeType_Show, false )
			SetModeEx( obj  , EM_SetModeType_Strikback, false )--����
			SetModeEx( obj  , EM_SetModeType_Move, false )--����
			SetModeEx( obj  , EM_SetModeType_Fight , false )--�i�������
			SetModeEx( obj  , EM_SetModeType_Searchenemy, false )--����
		AddToPartition( obj,0 )
		CallPlot( obj,"lua_z23CheckObjIRU_B",0)
end
function lua_z23CheckObjIRU_B()
	local time =0 
	local num =0
	while true do
		local NPC = SearchRangeNPC( OwnerID(),50 )
		for i=0,#NPC-1 do
			if ReadRoleValue( NPC[i],EM_RoleValue_OrgID )==120514 then
				num=num+1
			end
		end
		if num==0 then
			time=time+1
		else
			time=0
		end
		if time ==6 then
			local obj =CreateObj(120514,-7723,720,-16395,220,1)
			AddToPartition(obj,0)
			time=0
		end
		num = 0
		Sleep(50)
	end
end
function lua_z23q425477_Morrok1()
	SetSpeakDetail( OwnerID(), "[SC_425477_C1]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S2"), "lua_z23q425477_Morrok2" ,0)
end
function lua_z23q425477_Morrok2()
	SetFlag(OwnerID(),546488,1)
	SetSpeakDetail( OwnerID(), "[SC_425477_C2]" ); 
end

--����425477�A�H����ܼ@��
function lua_z23q425477_Kingdom()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425477)==true and CheckFlag(OwnerID(),546489)==false then
		AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S1"), "lua_z23q425477_Kingdom1" ,0)
	end
end 
function lua_z23q425477_Kingdom1()
	SetSpeakDetail( OwnerID(), "[SC_425477_C3]" ); 
	AddSpeakOption( OwnerID(), TargetID( ), GetString("SC_425477_S2"), "lua_z23q425477_Kingdom2" ,0)
end
function lua_z23q425477_Kingdom2()
	SetFlag(OwnerID(),546489,1)
	SetSpeakDetail( OwnerID(), "[SC_425477_C4]" ); 
end

--����425478 �~�����u�s�Ϫ�
--�����ȫ�Ĳ�o�s���U���@��
function lua_z23q425478_onaccept()
	--������Ĳ�o
	--R1��=1 =>�s���U���@���A���a�|�i�����ȡC
	--R1��=2 =>�@�����b��t���A���a�����ȷ|�Q���ܡC
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )==1 then
		return
	elseif ReadRoleValue( OwnerID(),EM_RoleValue_Register1 )==2 then
		ScriptMessage(OwnerID(),OwnerID(),0,"[SC_Z23Q425478_00]",C_SYSTEM); 
	else
		WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1 );
		BeginPlot( OwnerID() , "lua_z23q120758_start" , 0 );
	end
end

function lua_z23q120758_start()	--�s���U���@��
	local FlagID=780871
	local Actor=CreateObjByFlag( 120758, FlagID, 2, 1 )
	local Actor2=CreateObjByFlag( 120794, FlagID, 3, 1 )
		WriteRoleValue( Actor2, EM_RoleValue_IsWalk,1 )
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_CROUCH)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_MIME_SPIRAL_LOOP )
		AddToPartition(Actor,0)
		MoveToFlagEnabled( Actor2, false )
		LuaFunc_MoveToFlag( Actor,FlagID,3,1)
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(20)
		AddBuff(Actor,622610,0,30)
		PlayMotion(Actor,215)
		AddToPartition(Actor2,0)
		DelObj(Actor)
		Sleep(10)
		Show(Actor2,0)
		Sleep(10)
		PlayMotion(Actor2,150)
		SetModeEx( Actor2,EM_SetModeType_Mark,false )
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_STAND)
		Sleep(10)
		LuaFunc_MoveToFlag( Actor2,FlagID,4,1)
		MoveToFlagEnabled( Actor2, false )
		Sleep(30)
		CallPlot(OwnerID(),"LuaS_z23q425478_2",Actor2)
end

function LuaS_z23q425478_2(Actor2)
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,2)
	local O_ID = OwnerID()				--���bNPC���W���t���@��
	local QuestID = 425478				--���Ƚs��
	local FinishFlagID = 546492				--����������o���X��
	local CheckBuffID = 507178				--�ˬd�O�_���b�t����BUFF
	local CheckRange = 150				--�t�����ˬd�d��
	local ActorArray = {}					--(�s���ק�)�t���}�C��
--	local PlayMusicID="music/dungeon/Pesche/ethno_10_TSI_wide_sands.mp3"
		ActorArray[1] =CreateObj_ByObjPoint(O_ID,120710,"p_down" )	--��t�Υd�Ժ�
		ActorArray[4] =Actor2							--��t�οo�J��
	local AcArray=SearchRangeNPC(O_ID,100);	
		for i=0,table.getn(AcArray),1 do
			if ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==120759 then		--��t�μ���J
				ActorArray[2] =CreateObj_ByObjPoint(AcArray[i],120712,"p_down" )
			elseif ReadRoleValue( AcArray[i],EM_RoleValue_OrgID)==120760 then		--��t�Φѥd��
				ActorArray[3] =CreateObj_ByObjPoint(AcArray[i],120718,"p_down" )
			end
		end
		SetModeEx( ActorArray[1],EM_SetModeType_Mark,false )
		SetModeEx( ActorArray[2],EM_SetModeType_Mark,false )
		SetModeEx( ActorArray[3],EM_SetModeType_Mark,false )
		AddToPartition(ActorArray[1],0)
		AddToPartition(ActorArray[2],0)
		AddToPartition(ActorArray[3],0)
	--�d������Ϊ��ˬd�禡
	CallPlot( O_ID,"Ag_QuestS",QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )
		Sleep(20)
		Say(ActorArray[3],"[SC_Z23Q425478_01]" )--Tista-aq e`erra Jena , Kistaerra Garfe rotei va-arna(�u��)�C
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_02]" )--���§A�A�H�����k�v�C
		Sleep(10)
		Say(Actor2,"[SC_Z23Q425478_03]" )--���M�ڨä����N�C
		Sleep(10)
		Say(Actor2,"[SC_Z23Q425478_04]" )--���s�ڨ��ä����w�P�D�s�ڨϥίu����y�C
		Sleep(30)
		Say(ActorArray[3],"[SC_Z23Q425478_05]" )--��Ӧp���A�ݨӬO�ڤӦۤj�F�ǡC
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_06]" )--�ڭ̮ڪ�����������D�a�C
		Sleep(10)
		PlayMotion(Actor2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(Actor2,"[SC_Z23Q425478_07]" )--�ڬO[120715]�C
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_08]" )--�ګe�ӳo�̡A�O���������Ϩ��J�p�i�������O�ӨӡC
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_09]" )--�ܬ��p���H���B�s�ڨϪ̻P�����H�����d�����D�h��w���ͻP�|�C
		Sleep(40)
		Say(Actor2,"[SC_Z23Q425478_10]" )--��ɭԲ��s��S���|�ѻP�o�ӷ|ĳ�C
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_11]" )--�нѦ짴���ǳƫ�A�e�����Ÿt�Ҫ���V�C
		Sleep(30)
		Say(ActorArray[2],"[SC_Z23Q425478_12]" )--�P�§A�A�ڭ̤w�g�������s�ڪ��ܽСC
		Sleep(30)
		PlayMotion(ActorArray[2],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[2],"[SC_Z23Q425478_13]" )--���ڭ̰ѻP�|ĳ���H���i�঳�ܡC
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_14]" )--�ܰʡH��z�Ѭ���H
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_15]" )--�ڷQ��F�s���t�ҡC
		Sleep(20)
		PlayMotion(Actor2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(Actor2,"[SC_Z23Q425478_16]" )--�èS���W���H���O�@�����n�C
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_18]" )--�o�O�s���ܬ����|ĳ
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_19]" )--�u�O�Ʊ��p����]�P�˭����A
		Sleep(20)
		Say(Actor2,"[SC_Z23Q425478_20]" )--�ѻP�|ĳ���Ʊ�O���H�v�T�o�ӾԲ����H���C
		Sleep(30)
		PlayMotion(ActorArray[1],ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		Say(ActorArray[1],"[SC_Z23Q425478_21]" )--�O�A�ڭ̤F�ѤF�C
		Sleep(30)
		Say(Actor2,"[SC_Z23Q425478_22]" )--�ܰʪ��Ƨڷ|�a����F�A��ɭԧڷ|�b�t�ҫe���ﱵ�U��C
		Sleep(10)
		local Actor=CreateObjByFlag( 120758, 780871, 5, 1 )	--�s��
		LuaFunc_MoveToFlag( Actor2,780871,5,1)
		SetDefIdleMotion( Actor2,ruFUSION_MIME_IDLE_CROUCH)
		Hide(Actor2)
		AddToPartition(Actor,0)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(20)
		DelObj(Actor)
		
		Ag_QuestEnd( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, O_ID )
end
function lua_z23q120758_end()	--�s���h
	local FlagID=780871
	local Actor=CreateObjByFlag( 120758, FlagID, 5, 1 )	--�s��
		LuaFunc_MoveToFlag( OwnerID(),FlagID,5,1)
		SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_CROUCH)
		Hide(OwnerID())
		AddToPartition(Actor,0)
		SetModeEx( Actor , EM_SetModeType_Gravity , false )
		SetDefIdleMotion( Actor,ruFUSION_ACTORSTATE_CAST_SP02 )
		Sleep(30)
		DelObj(Actor)
		DelObj(OwnerID())
		DebugMsg(0,0,"del")
end

function lua_z23_mounstplaymotion1()
	local num=rand(3)
		if num==0 then
			PlayMotion(OwnerID(),20)
		elseif num==1 then
			PlayMotion(OwnerID(),84)
		else
			PlayMotion(OwnerID(),164)
		end
end

--���ӥΡA���m�����A�åB�NR1�g�^0
--20130329�קאּ��t���_�N�R���ۤv
function Ag_QuestS1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray )--�d�򪱮a���ȼ@���}�l����
	local player = {}
	local Ctrl = OwnerID()
	local allplayer = SearchRangePlayer( Ctrl, CheckRange )	

	for i=0, table.getn(allplayer)-1 do--�ŦX���� �����t����Buff
		if	CheckID(allplayer[i]) == true and  
			CheckAcceptQuest( allplayer[i], QuestID ) == true and 
			CheckBuff( allplayer[i], CheckBuffID ) ~= true and 
			CheckFlag( allplayer[i], FinishFlagID ) ~= true then 
			
			AddBuff( allplayer[i], CheckBuffID, 0, -1 )--�����ˬd			
			table.insert( player, allplayer[i] )
		end
	end
	DebugMsg(0,0, "Count = "..table.getn(player))
	while true do
		for i= 1, table.getn(player) do
			if player[i] ~= nil and CheckID(player[i]) == true and  
				( CheckAcceptQuest( player[i], QuestID ) ~= true or --�ˬd���L����
				CheckBuff( player[i], CheckBuffID ) ~= true or --�ˬd���LBUFF
				CheckFlag( player[i], FinishFlagID ) == true or --�ˬd���L���n���~
				CheckDistance( player[i], Ctrl, CheckRange ) ~= true ) then --�ˬd�O�_�W�L�ˬd�d��
				
				CancelBuff( player[i], CheckBuffID )
				table.remove(player, i)							
			end
		end
		--DebugMsg(0,0, "Count = "..table.getn(player))
		if table.getn(player) == 0 then
			--DebugMsg(0,0,"Del")
			for i=1, table.getn(ActorArray ) do--�R���t��
				if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
			end
			DelObj( Ctrl )
			break
		end
		sleep(20)
	end	
end

function Ag_QuestEnd1( QuestID, FinishFlagID, CheckBuffID, CheckRange, ActorArray, Ctrl )--�d�򪱮a���ȼ@�������������n�X��
	Ctrl = Ctrl or OwnerID()
	local player = SearchRangePlayer ( Ctrl, CheckRange ) 	

		for i=0, table.getn(player )-1 do--�M���t��Buff
			if	CheckID(player[i]) == true and  
				CheckAcceptQuest( player[i], QuestID ) == true and 
				CheckBuff( player[i] , CheckBuffID ) == true and 
				CheckFlag( player[i], FinishFlagID ) ~= true then
			
				if FinishFlagID ~= nil then SetFlag( player[i], FinishFlagID, 1 ) end
				CancelBuff( player[i], CheckBuffID )
			end
		end

		for i=1, table.getn(ActorArray ) do--�R���t��
			if CheckID(ActorArray[i]) == true then DelObj(ActorArray[i]) end
		end
		DelObj( Ctrl ) --�R������
end
--����425479
function luaZ23Q425479_1()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425479)==true and CountBodyItem(OwnerID(),241302)>=1 then
		AddSpeakOption( OwnerID(), TargetID( ), "[SC_Z23Q425479_1]", "luaZ23Q425479_2", 0 );
	end
end
function luaZ23Q425479_2()
	SetSpeakDetail( OwnerID(),"[SC_Z23Q425479_2]" )
	DelBodyItem( OwnerID(),241302,1 )
	SetFlag( OwnerID(),546485,1 )
end
--���ٸ��A��O�A���ȵ��N�����F�A��t��Ĳ�o
function lua_Z23Q425476_GiveTittle()
	if CheckFlag( TargetID(),546484 ) then
		GiveBodyItem ( TargetID(),530031,1 )
		SetFlag(TargetID(),546484,0)
	else
		GiveBodyItem ( TargetID(),530030,1 )
	end
end