
--======================================================================================================
--423548
--======================================================================================================
function LuaS_423548_0()
	Sleep(30)
	ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423548_0]", 0 )
	ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423548_0]", 0 )
	AddBuff(TargetID(),503977,1,100)
	PlayMotion(TargetID(),ruFUSION_ACTORSTATE_DYING)
	Sleep(30)

	AddBuff(TargetID(),506098,1,100)
	ChangeZone( TargetID() , 18 , 0 , 7949.2  , -153.5  , 50030.9   , 9.2 )
	Sleep(40)
	
	CancelBuff( TargetID()  , 506098 )	
	
		local NPC =SearchRangeNPC ( TargetID() , 200 )				
		--�j�M���a���� 200�d�򤺪�npc�A��Jnpc���}�C��
		local S1	
		for i=0,table.getn(NPC),1 do
			if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116235 then
				S1= NPC[i]	--��Z�g
			end
		end
		
		Yell(S1,"[SC_423548_1]",1)
		Sleep(30)
		CastSpell(S1 , TargetID(),494518)
		Sleep(20)
		PlayMotion(TargetID(),ruFUSION_ACTORSTATE_REVIVING)
	CancelBuff( TargetID()  , 503977 )
end

--======================================================================================================
--423517
--======================================================================================================
	
function LuaWS_423541_E0()	--780739.2
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507547,1,400)	
		Local Ton  = LuaFunc_CreateObjByObj( 116372 , OwnerID() )
		Hide(Ton)
		local NPC =SearchRangeNPC ( OwnerID() , 50 )				
			--�j�M���a���� 200�d�򤺪�npc�A��Jnpc���}�C��
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116235 then
					S1= NPC[i]	--��Z�g
				end
			end
		Local Rose  = LuaFunc_CreateObjByObj( 116371 , S1 )
	
	Hide(Rose)
	DisableQuest(Ton, true )
	DisableQuest(Rose, true )
	Show(Ton,0)
	Show(Rose,0)

	Adjustfacedir(Ton,Rose,0)
	Adjustfacedir(Rose,Ton,0)
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Ton, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Rose, EM_RoleValue_IsWalk, 1)
	Adjustfacedir(Ton,TargetID(),0)
	Adjustfacedir(Rose,TargetID(),0)
	Beginplot(Rose,"LuaWS_423541_E1",0)
	Yell(Ton,"[SC_423541_0]",1)
	--�ڭ̥���@�B�C
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	DW_MoveToFlag(Ton,780739,2,0,1)
	Delobj(Ton)
	
	CancelBuff( TargetID()  , 507547  ) 
	DisableQuest(OwnerID(), false )
end	

function LuaWS_423541_E1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(50)
	DW_MoveToFlag(OwnerID(),780739,2,0,1)
	Delobj(OwnerID())
end
	
--======================================================================================================
--423542	544380 200��	544372 50��
--======================================================================================================
function LuaS_423542_0()
	LoadQuestOption(OwnerID())
	--�A�٦�����Q�F�Ѫ��ܡH
		if 	(CheckAcceptQuest(OwnerID(),423542)== true )	then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
				--���§A�A�ڨS����L�Q���D���Ʊ��F�C  
		end
		if 	(CheckAcceptQuest(OwnerID(),423542)== true )	or
			(CheckCompleteQuest(OwnerID(),423542)== true ) 	then

				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_1]","LuaS_423542_2",0)
				--�Чi�D�ڨF�d�ڷ�~���p���C
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_3]","LuaS_423542_3",0)
				--�w�U�J�D����u�����F�ܡH
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_7]","LuaS_423542_4",0)
				--�G�����ڴ��Q�M�ϡA�A�O�p��k�L���@�T���H
		end
		if 	(CheckAcceptQuest(OwnerID(),423543)==true)		and
			(CheckCompleteQuest(OwnerID(),423543)== false )	and
			CountBodyItem( OwnerID(), 208141)<1				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423543_0]","LuaS_423543",0)
		end
end

function LuaS_423542_1()
	SetSpeakDetail(OwnerID(),"[SC_423542_12]")
	--���§A����ť�A�L�צ�ɡA�u�n�A�Q���D�ڱڷ�~���D�J�A�ڳ��|�b�o�̬��A�^���C
	SetFlag(OwnerID(),544383,1)

end

function LuaS_423542_2()
	--�Чi�D�ڨF�d�ڷ�~���p���C
	SetSpeakDetail(OwnerID(),"[SC_423542_2]")
	--�Q���B�Q���~�e�A�ڪ��αڦѭ̥�ť�ڪ��U�i......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_5]","LuaS_423542_5",0)
	--�����򤣴��o�F�d�ڡH
end

function LuaS_423542_3()
	--�w�U�J�D����u�����F�ܡH
	SetSpeakDetail(OwnerID(),"[SC_423542_4]")
	--�o�ӧڤ����֩w�A�u�O�A��ť���ѻP������ʪ��ڤH���L�A
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--�i�H�A�h�i�D�ڤ@�ǶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--���§A�A�ڨS����L�Q���D���Ʊ��F�C 
end

function LuaS_423542_4()
	--�G�����ڴ��Q�M�ϡA�A�O�p��k�L���@�T���H
	SetSpeakDetail(OwnerID(),"[SC_423542_8]")
	--�ڨS���ѻP�����p�e�A�ӥB�����}�ܼ}�����~�쩥�Q���A
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_9]","LuaS_423542_6",0)
		--�{�b�G�������٦��h�֤H�A���b�o�̶ܡH
end	
	

function LuaS_423542_5()
	SetSpeakDetail(OwnerID(),"[SC_423542_6]")
	--�ڱڳQ�M�Ϸ�ɡA�ڽİʪ��ߨ褽�G�F�d�ڻP�ڱک��Ӫ��ѫH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--�i�H�A�h�i�D�ڤ@�ǶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--���§A�A�ڨS����L�Q���D���Ʊ��F�C 
end

function LuaS_423542_6()
	SetSpeakDetail(OwnerID(),"[SC_423542_10]")
	--�ֳ\�q�O���̬��U�Ӫ��ڤH�A�@�@�Ө�ڳo�̽ШD���@
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_14]","LuaS_423542_0",0)
		--�i�H�A�h�i�D�ڤ@�ǶܡH
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_0]","LuaS_423542_1",0)
		--���§A�A�ڨS����L�Q���D���Ʊ��F�C 
end
	
		
function LuaS_423542_x()

		if 	Checkflag(TargetID(),544372)== true	and
			Checkflag(TargetID(),544380)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--�o�O���ݩ�A�������A�ЧA���U�C
			AddRoleValue(TargetID(),EM_RoleValue_Money,250)
			SetFlag(TargetID(),544372,0)
			SetFlag(TargetID(),544380,0)
			ScriptMessage( OwnerID()   , TargetID()   , 0 , "[SC_423542_X1]" , 0 )	
			ScriptMessage( OwnerID()   , TargetID()   , 2 , "[SC_423542_X1]" , 0 )	
			--�A���^250�����C
		end
		
		if	Checkflag(TargetID(),544372)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--�o�O���ݩ�A�������A�ЧA���U�C
			AddRoleValue(TargetID(),EM_RoleValue_Money,50)
			SetFlag(TargetID(),544372,0)
			ScriptMessage(  OwnerID()   , TargetID()    , 0 , "[SC_423542_X2]" , 0 )
			ScriptMessage(  OwnerID()   , TargetID()    , 2 , "[SC_423542_X2]" , 0 )			
			--�A���^50�����C
			
		end
		
		if	Checkflag(TargetID(),544380)== true	then
			Say(OwnerID(),"[SC_423542_11]")	
			--�o�O���ݩ�A�������A�ЧA���U�C
			AddRoleValue(TargetID(),EM_RoleValue_Money,200)
			SetFlag(TargetID(),544380,0)
			ScriptMessage(  OwnerID()   , TargetID()    , 0 , "[SC_423542_X3]" , 0 )
			ScriptMessage(  OwnerID()   , TargetID()    , 2 , "[SC_423542_X3]" , 0 )			
			--�A���^200�����C
		end
end


--======================================================================================================
--423543
--======================================================================================================
function LuaS_423543()
	SetSpeakDetail(OwnerID(),"[SC_423543_1]")
		if	CountBodyItem( OwnerID(), 208141)<1		then
			GiveBodyItem( OwnerID() , 208141 , 1 )
		end
end
	

--======================================================================================================
--423549	���a�ᱼ�ǰe��
--======================================================================================================
function LuaS_423549_0()
	LoadQuestOption(OwnerID())
		if 	(CheckCompleteQuest(OwnerID(),423549)== true ) 			and (CountBodyItem( OwnerID(), 208142)<1	)			then
			if	((CheckAcceptQuest(OwnerID(),423543)== true )		and	(CheckCompleteQuest(OwnerID(),423543)== false ))	or
				((CheckCompleteQuest(OwnerID(),423543)== true )		and	(CheckCompleteQuest(OwnerID(),423544)== false ))	then
					if		CountBodyItem( OwnerID(), 208174)<1			then
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423549_0]","LuaS_423549_1",0)
							--�ڧ˥�e���F�ԥ������ǰe���ۤF�C
							--Say(OwnerID(),CountBodyItem( OwnerID(), 208196))
					end
					if		CountBodyItem( OwnerID(), 208196)<1			then
							
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423549_1]","LuaS_423549_2",0)
							--�ڧ˥�^�쩥�Q�����ǰe���ۤF�C
							--Say(OwnerID(),"Rock2")
					end
			end
		end
		
end
			
function LuaS_423549_1()
	SetSpeakDetail(OwnerID(),"[SC_423549_2]")
	--�o�F��ܬöQ���A�p�ߦ��ۡA�O�A���F�C
		if	CountBodyItem( OwnerID(), 208174)<1		then
			GiveBodyItem( OwnerID() , 208174 , 1 )
		end
end

function LuaS_423549_2()
	SetSpeakDetail(OwnerID(),"[SC_423549_2]")
	--�o�F��ܬöQ���A�p�ߦ��ۡA�O�A���F�C
		if	CountBodyItem( OwnerID(), 208196)<1		then
			GiveBodyItem( OwnerID() , 208196 , 1)
		end
end

-----------------------------------

function LuaI_s7_208174_0()	
	--�ǦܹF�ԥ���������
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaI_s7_208174_1",0)
end


function LuaI_s7_208174_1()
	if	(CountBodyItem(TargetID(),208174))>0 then
		if 	ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)==18	then
			CastSpell( TargetID() , TargetID() , 496116 )
			Sleep(30)
			ChangeZone( TargetID() , 15 , 0 , -3516.2  , -107.2  , 8103.4   , 342.6 )
			DelBodyItem(TargetID(),208174,1)
		else
			ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208174_0]" , 0 )
		end
	end
end

function LuaI_s7_208196_0()	
	--�ǦܹF�ԥ���������
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaI_s7_208196_1",0)
end


function LuaI_s7_208196_1()
	if	(CountBodyItem(TargetID(),208196))>0 then
		if 	ReadRoleValue(TargetID() , EM_RoleValue_ZoneID)==15	then
			CastSpell( TargetID() , TargetID() , 496116 )
			Sleep(30)
			ChangeZone( TargetID() , 18 , 0 , 7949.2  , -153.5  , 50030.9   , 9.2 )
			DelBodyItem(TargetID(),208196,1)
		else
			ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208196_0]" , 0 )	
		end
	end
end




--======================================================================================================
--423546
--======================================================================================================
function LuaWS_423546_0()
	LoadQuestOption(OwnerID())
		if	(CheckAcceptQuest(OwnerID(),423546)== true )		and
			(CheckCompleteQuest(OwnerID(),423546)== false )		and
			Checkflag(OwnerID(),544387)== false	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_0]","LuaWS_423546_1",0)
			--�¬��d�A�o�̦��ǪF��A�A���ӷ|�P����C
		end
end

function LuaWS_423546_1()
	SetSpeakDetail(OwnerID(),"[SC_423546_1]")
	--�o�O......�o�ǬO�F�d�ڷ�~�P�G�����K�ѫH��I�A�B�A��򮳨쪺�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_2]","LuaWS_423546_2",0)
		--�G���w�V���U��ۡA�o�O�L�̦��@��X�Ӫ��C
end

function LuaWS_423546_2()
	SetSpeakDetail(OwnerID(),"[SC_423546_3]")
	--��I�G���N�O�G���A�N���H�e�@�ˡA�̷|�ͪ����աA�M�h�A�A�o�i�D���U�p�ߴ������Ǥp�H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423546_4]","LuaWS_423546_3",0)
		--�۫H���U�ۦ��P�_�A���L�A���§A�������A�ڷ|�a�����U�C
end

function LuaWS_423546_3()
	SetSpeakDetail(OwnerID(),"[SC_423546_5]")
	--�O���A���U�֦~�����A�O�ڦh�{�F......
	SetFlag(OwnerID(),544387,1)
end


--======================================================================================================
--423547
--======================================================================================================

function LuaWS_423547_E0()	--780739.3

	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507550,1,400)	

		Local Ton  = LuaFunc_CreateObjByObj( 116419 , OwnerID() )
		Hide(Ton)
		local NPC =SearchRangeNPC ( OwnerID() , 50 )				
			--�j�M���a���� 200�d�򤺪�npc�A��Jnpc���}�C��
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116240 then
					S1= NPC[i]	--��Z�g
				end
			end
		Local Rose  = LuaFunc_CreateObjByObj( 116418 , S1 )
	
		Hide(Rose)
		DisableQuest(Ton, true )
		DisableQuest(Rose, true )
		Show(Ton,0)
		Show(Rose,0)

	Adjustfacedir(Ton,Rose,0)
	Adjustfacedir(Rose,Ton,0)
	PlayMotion(Rose,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Ton, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(Rose, EM_RoleValue_IsWalk, 1)
	Adjustfacedir(Ton,TargetID(),0)
	Adjustfacedir(Rose,TargetID(),0)
	Beginplot(Rose,"LuaWS_423547_E1",0)
	Yell(Ton,"[SC_423547_0]",1)
	--�ڭ̥���@�B�C
	PlayMotion(Ton,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(20)
	DW_MoveToFlag(Ton,780739,3,0,1)
	Delobj(Ton)
	
	CancelBuff( TargetID()  , 507550  ) 
	DisableQuest(OwnerID(), false )
	
end	

function LuaWS_423547_E1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(50)
	DW_MoveToFlag(OwnerID(),780739,3,0,1)
	Delobj(OwnerID())
end
	

