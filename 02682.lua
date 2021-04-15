--������u�@������
--02
function Dy_Z23_12CHECK () --�ˬd�h�L�٦b���b
	local Player,Soldier = OwnerID(),TargetID();
	if DW_CheckQuestAccept("or",Player,425294,425304,425299)==true then
		local OrgID=ReadRoleValue(Soldier,EM_RoleValue_OrgID);
		if OrgID>=106776 and OrgID<=106781 then
			if CheckBuff(Soldier,622209)==true or CheckBuff(Soldier,622210)==true or CheckBuff(Soldier,622211)==true then
				ScriptMessage(Player,Player,1,"[SC_Z23_Q425294_02]",C_YELLOW);--���H��U���h�L�I 
				return false;
			else
				return true;
			end
		else
			ScriptMessage(Player,Player,1,"[SC_Z22_Q424783_03]",C_YELLOW);--�ؼп��~�I
			return false;
		end
	else
		ScriptMessage( Player, Player , 1 , "[SC_Z22_Q424786_02]" , 0 )  --�S���������ȡI
		return false;
	end
end
function Dy_Z23_1201() --�ϥΪ��~��I�񪺪k�N
	CastSpell( OwnerID(), TargetID(), 850186 );
end
function Lua_425294_BuffCheck()--���b622209���R���e�ˬd
	local Player,Soldier = OwnerID(),TargetID();
	local MaxHP=ReadRoleValue(Soldier,EM_RoleValue_MaxHP);
	local HP=ReadRoleValue(Soldier,EM_RoleValue_HP);
	local Rate=HP/MaxHP;
	if Rate>0.5 then
		AddBuff(Soldier,622210,0,-1);--��buff���R���A��Wbuff2�A
		return false;
	else
		return true;--�Ӫk�N���X�Wbuff1, �ߨ�M�h
	end
end
function Lua_425294_ItemExecute()--�k�N���X850186�����򥻪k�N622585
	local Player,Soldier = OwnerID(),TargetID();
	BeginPlot(Soldier,"Lua_425294_JumpPlot",20);
end
function Lua_425294_JumpPlot()
	local Soldier,Player = OwnerID(),TargetID();
	local RetreatFlag=780091
	local RetreatBuff,PowerBuff,MarkBuff=622209,622210,622211
	for Pos=0,BuffCount(Soldier) do
		local BuffID=BuffInfo(Soldier,Pos,EM_BuffInfoType_BuffID)
		if BuffID==RetreatBuff then
			for SN=0,HateListCount(Soldier) do
				local Ant=HateListInfo(Soldier,SN , EM_HateListInfoType_GItemID);
				SysCastSpellLv(Player,Ant,496266,0);
			end
			Lua_425316_SoldierRetreat(Soldier,RetreatFlag,Player)--�Ԥh�M�h�Ascript 02650
			DW_QietKillOne(Player,106862);
			return;
		end
		if BuffID==PowerBuff then
			while HateListCount(Soldier)~=0 do
				if CheckID(Player)==true and CheckDistance(Soldier,Player,250)==true then
					if CheckBuff(Soldier,PowerBuff)==false then
						ScriptMessage( Player, Player, 3, "[SC_Z23_Q425294_03]", C_YELLOW )--�]�k���ĪG�����A�ɧֹ�[�p���Ԥh]�ϥ�[���@�ť�]�I
						return;
					end
				else
					CancelBuff_NoEvent(Soldier,PowerBuff);
					return
				end
				sleep(30)
			end
			AddBuff(Soldier,MarkBuff,0,-1);
			NPCSay(Soldier,"[SC_Z23_Q425294_04]");--���§A�A�o�̨S���D�F�A�A���h����L�H�a�I
			PlayMotion(Soldier,ruFUSION_ACTORSTATE_EMOTE_SALUTE);
			DW_QietKillOne(Player,106886);
			return;
		end
	end
end
function Dy_Z23_12_50up() --50%�H�W���@��(�S�Ψ�)
	local Player,Soldier = OwnerID(),TargetID();
	local Pos = Lua_BuffPosSearch( OwnerID() , 622210 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	local Mode = ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode) --�ˬd�ۤv���԰����A
	if Mode == 0 then --���b�԰����A
		DW_QietKillOne(BuffOwner, 106862  ) --��U�h�L�O�d�ԤO���\
		CancelBuff_NoEvent( OwnerID(), 622210 ) 
		CancelBuff_NoEvent( OwnerID(), 622211 ) 
	else 
	
	end
end
function Dy_Z23_12_50down() --50%�H�U���@��(�S�Ψ�)
	--local RoomID = ReadRoleValue(OwnerID(), EM_RoleValue_RoomID )
	local X = ReadRoleValue(OwnerID() , EM_RoleValue_X)
	local Y = ReadRoleValue(OwnerID() , EM_RoleValue_Y)
	local Z = ReadRoleValue(OwnerID() , EM_RoleValue_Z)
	local Dir = ReadRoleValue(OwnerID() , EM_RoleValue_Register1)
	local Pos = Lua_BuffPosSearch( OwnerID() , 622211 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	local ant = ReadRoleValue( OwnerID() , EM_RoleValue1 ) 
	--�����������ĻP��������
	SetModeEx( OwnerID() ,EM_SetModeType_Searchenemy , false ) --����*
	SetModeEx( OwnerID() ,EM_SetModeType_Strikback , false ) --����*
	LuaFunc_MoveAllFlag( OwnerID(), 781150 ) --���Ჾ�� 
	sleep (50)--5���	
	if CheckBuff( OwnerID() , 622209) == true then --�p�GBuff�٦b�N����
		CancelBuff_NoEvent( OwnerID(), 622209 ) 
		say (OwnerID() , "[SC_Z23_Q425294_01]") --���U�Ӫ����گ�ۤv���A���§A�A[$playername]...�C
		DW_QietKillOne(BuffOwner, 106886  ) --��U�h�L�M�h
		KillID( OwnerID()  , OwnerID() )
	end
end
function Dy_Z23_12_BuffEND() --Buff������ ���Ѫ���t(�S�Ψ�)
	--local ant = ReadRoleValue( OwnerID() , EM_RoleValue_Register1 )
	local Pos = Lua_BuffPosSearch( OwnerID() , 622211 )                      ---------------------��X���W���k�N�N��
	local BuffOwner = BuffInfo( OwnerID() , Pos , EM_BuffInfoType_OwnerID )  -------------------------��X���k�N�O�֩�
	if CheckBuff( OwnerID() , 622211) == true then --�p�GBuff�٦b�N����
		say (OwnerID(), "[SC_Z23_Q425294_00]") --�r�꼵���U�h�F...
		CancelBuff( OwnerID(), 622211 ) 
		KillID( OwnerID()  , OwnerID() )
	else
		
	end
end
--03
function Dy_Z23_13_TAKE() --�B�����e�ɰ����Ʊ� --�אּ����NPC
	local Player,Corpse = OwnerID(),TargetID();
	local IsSearched=622208
	if CheckBuff(Corpse,IsSearched)==false then
		AddBuff(Corpse,IsSearched,0,-1);
		GiveBodyItem(Player,241229,1);
		DisableQuest(Corpse,true);
		WriteRoleValue(Corpse,EM_RoleValue_Register+6,1);--�q������^�����骺�t��
	end
	CloseSpeak(Player);
end
--04
--�����w�ǩ_�ƪ��P�w��������
function Dy_Z23_14_KantDIE00()--��J���`�@��
	SetPlot( OwnerID() ,"dead","Dy_Z23_14_KantDIE01",10 )
end
function Dy_Z23_14_KantDIE01()--�w�ǩ_�ƪ��P�w����
	--say(OwnerID() , "111")
	--say(TargetID() , "123")
	LoadQuestOption(TargetID())  --�ˬd���S������
	if CheckAcceptQuest(TargetID(),425296) == true 
	or CheckAcceptQuest(TargetID(),425301) == true 
	or CheckAcceptQuest(TargetID(),425306) == true then 
		if CheckScriptFlag( TargetID() , 546276 ) == true then --�����n���~���ܵ���BUFF
			AddBuff( TargetID() , 622580 , 0 ,30) --�^�i����
			--say(TargetID() , "123")
		elseif CheckScriptFlag( TargetID() , 546276 ) == false then --�S�����n���~���ܵ������n���~
			GiveBodyItem( TargetID(), 546276, 1 )
			--say(TargetID() , "yai")
		end
	else
		--say(TargetID() , "none")
	end
end
function Dy_Z23_14_yunki()--�^�i�������P�_
	for i = 0 , 5 ,1 do
		if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == 106776+i then --�p�G�O�p���h�L���N���N���F���ȱ���P���h��BUFF
			DW_QietKillOne(OwnerID(), 106860  )
			AddBuff( TargetID() , 622582 , 0 , 5) 
			--say(TargetID() , "yai")
		else
			--say(TargetID() , "=w=")
		end
	end
end
--05
function Dy_Z23_15_check () --���~�ϥ��ˬd
	local badant = 106865
	if ReadRoleValue( TargetID() ,EM_RoleValue_OrgID ) == badant then
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_Z22_Q424783_03]" , 0 )  --�ؼп��~�I
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_Z22_Q424783_03]" , 0 )			
		return false
	end
end 
function Dy_Z23_15antshow() --�\���ƪ�t�@��
	if ReadRoleValue( TargetID(),EM_RoleValue_Register8)==3 then 	--�P�_�O�_���еo��
		local tmpt = SearchRangeNPC( TargetID(),100 )
			for i=0,#tmpt,1 do 
				if ReadRoleValue( tmpt[i] ,EM_RoleValue_OrgID ) == 106866 then 
					AddBuff( tmpt[i],622564,0,30 )
					DebugMsg( 0,0,"tesstAddBuff" )
				end
			end
			return
	end
	local Player = OwnerID()
	local Rnum = 3-ReadRoleValue( TargetID(),EM_RoleValue_Register8 )
	local badant = 106865 --�ʭx�ƪ��s��
	local RoomID = ReadRoleValue( Player, EM_RoleValue_RoomID )
	local x,y,z,dir = DW_Location( Player )
	local ant = ant or {}
 	local ant=Lua_CreateObjToRandownPos( Player,106866,Rnum,50,false )
		GiveBodyItem( Player, 546503, 1 )	--�����ȺX��
		SetAttack( TargetID(),Player )	--�j���
		--DebugMsg( 0,0,"test="..Rnum )
	for i = 1 , Rnum , 1 do
		AddToPartition( ant[i],RoomID)
		local Xnum = ReadRoleValue( TargetID(),EM_RoleValue_Register8 )+1
		--DebugMsg( 0,0,"test="..xnum )
		WriteRoleValue( TargetID(),EM_RoleValue_Register8,Xnum )
		SetModeEx( ant[i]  ,EM_SetModeType_Show, true )--���*
		SetModeEx( ant[i]  ,EM_SetModeType_Searchenemy , false ) --����*
		SetModeEx( ant[i]  ,EM_SetModeType_Save , false ) --�x�s*
		SetModeEx( ant[i]  ,EM_SetModeType_Revive , false ) --����*
		SetModeEx( ant[i]  ,EM_SetModeType_Obstruct , false )--����*
		SetModeEx( ant[i]  ,EM_SetModeType_Strikback , true ) --����*
		SetModeEx( ant[i]  ,EM_SetModeType_Fight , true ) --���*
		SetModeEx( ant[i]  ,EM_SetModeType_Gravity , false ) --���O*	
		SetModeEx( ant[i]  ,EM_SetModeType_Move , true ) --����*
		SetModeEx( ant[i]  ,EM_SetModeType_ShowRoleHead , true ) --�Y����*
		SetModeEx( ant[i]  ,EM_SetModeType_HideName , true) --�����Y�W���W�٬O�_���*
		SetModeEx( ant[i]  ,EM_SetModeType_SearchenemyIgnore , false ) --�����󤣷|�Q�j�M��*
		WriteRoleValue( ant[i] ,EM_RoleValue_Register8,TargetID() )
		AddToPartition( ant[i],RoomID)
		--DebugMsg(0,0,"testQuestCreatAnt="..ant[i])
		SetPlot( ant[i],"dead","Dy_Z23_15ANTDIE",0 )
		SetPlot( TargetID(),"dead","Dy_Z23_15DIE",0 )
		SysCastSpellLv( TargetID(),ant[i],499110,1 )

	end
	
end
function Dy_Z23_15DIE() --�ʭx�Ʀ��`�@��
	--say (OwnerID(), "123")
	--�����R���\���ơ���
	local ant = {} 
	WriteRoleValue( OwnerID(),EM_RoleValue_Register8,0 )
	ant = SearchRangeNPC ( OwnerID() , 100 ) 
	for i=0 ,table.getn(ant) ,1 do 
		if ReadRoleValue( ant[i] , EM_RoleValue_OrgID) == 106866 then
			DelObj ( ant[i] )
		else
		
		end
	end	
	Local num = HateListCount( OwnerID() )
	for i=0,num-1 do
		local ID = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID );
		local HatePoint = HateListInfo(OwnerID() ,i , EM_HateListInfoType_HatePoint );
		if ReadRoleValue( ID , EM_RoleValue_IsNPC ) ~= 1 and HatePoint>=500 then
			DW_QietKillOne( ID, 106861  )
		end
	end	
end
function Dy_Z23_15ANTDIE()
	local badant = ReadRoleValue( OwnerID() ,EM_RoleValue_Register8 )
	local num = ReadRoleValue( badant,EM_RoleValue_Register8 )-1
	WriteRoleValue( badant,EM_RoleValue_Register8,num )
end