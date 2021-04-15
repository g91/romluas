
--======================================================================================================
--�������u�@��
--======================================================================================================
function LuaZ14WS_424151_accept()
	writerolevalue( TargetID() , EM_RoleValue_PID , 0 )
end
	

function LuaZ14WS_118046_0()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424151)==true			then
		if	CountBodyItem(OwnerID(),209425)>0				then
				if		CountBodyItem(OwnerID(),209455)<5		then
						AddSpeakOption(OwnerID(),TargetID(),"[SC_424151_0]","LuaZ14WS_118046_1",0)
						--�A�n�A���W���ҥj�u�@�̡C
				else
						ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424151_1]", 0 )	
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424151_1]", 0 )
						--�A�w���������ȡC
				end
		else
				ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424151_2]", 0 )	
				ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424151_2]", 0 )
				--�A���W�����Ȫ��~�ƶq�����C
		end
	end
end 


function LuaZ14WS_118046_1()
--�b�̫�@�y��ܡA�Y�}�Ҽ@���t�X�e�A�I�s�ˬd���t�X��npc�O�_���L��function
	SetSpeakDetail(OwnerID(),"[SC_423279_8]")
	--�A�O�֡H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_424151_3]","LuaZ14WS_118046_CheckBusy",0)
	--�ڬO�_�I�̡A�����o�̥D�ƪ̪��e�U�A�N�����o�񵹧A�̡C
end


function LuaZ14WS_118046_CheckBusy()	
--�ˬd���t�X��npc�O�_���L��function�A�Hpid���P�_�ȡA�I�s�@���t�Xfunction
--�P�_���@���t�X��npc�O�_���L���A�p�G�����h�t�X�@���A���h�e�L�@�y�ܡA�ХL���ݡA���b�s���t�Xscript����q�禡
--Say(OwnerID(),"0..01")
--Say(TargetID(),"T..T1")
	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaZ14WS_118046_2" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--�ؼХ��b���L���C
	end
end


function LuaZ14WS_118046_2()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	NPCSay(OwnerID(),"[SC_424151_4]")	
	--��A���§A�C
	GiveBodyItem(TargetID(),209455,1)
	DelBodyItem(TargetID(),209425,1)
	Sleep(50)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	LuaFunc_ResetObj( OwnerID())
	DisableQuest( OwnerID() , false )
	
end

 
--======================================================================================================
--424152�����ݨD
--======================================================================================================
 
function LuaZ14WS_424152()
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",30 )
end


--(2)����BeginCastBar�P�_

function LuaZ14WS_424152_1() --���a
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if	CheckAcceptQuest(OwnerID(),424152)==true		then
		if	CountBodyItem(OwnerID(),209456) <5		then
			if	CountBodyItem(OwnerID(),209426) >0		then
				if 	BeginCastBarEvent( O_ID, T_ID,"[SC_424152_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ14WS_424152_2" ) ~= 1 then
				--��[209426]......
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
					return
					
				end
			else
				ScriptMessage( O_ID, O_ID, 2,"[SC_424151_2]", 0 )
				ScriptMessage( O_ID, O_ID, 0,"[SC_424151_2]", 0 )
			end
		end
	else
		ScriptMessage( O_ID, O_ID,1,"[SC_Z16_REQUIRE]",0)--�S���ŦX���e�U����
		ScriptMessage( O_ID, O_ID,0,"[SC_Z16_REQUIRE]",0)--�S���ŦX���e�U����

	end	
end


--(3)����BeginCastBar�ᤧ���G


function LuaZ14WS_424152_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			GiveBodyItem( OwnerID() , 209456 , 1 )
			DelBodyItem(OwnerID(),209426,1)
			Beginplot(T_ID,"LuaZ14WS_424152_3",0)

		else
			-- ����
			EndCastBar( O_ID, CheckStatus );
		end
	end
end
 
function LuaZ14WS_424152_3()
	DisableQuest(OwnerID(), true )
	--LuaFunc_ResetObj( OwnerID())
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",0 )
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_4",30 )
	SLEEP(100)
	SetPlot( OwnerID(),"touch","LuaZ14WS_424152_1",30 )
	DisableQuest(OwnerID(), false )

end

function LuaZ14WS_424152_4()
	ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424152_1]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_424152_1]", 0 );
	--�෽�R���A���ݧ󴫯ഹ�C
	SetPlot( TargetID(),"touch","LuaZ14WS_424152_4",0 )
end


--======================================================================================================
--424176���F�����ä�q
--======================================================================================================
 
function LuaZ14WS_424176()
	SetPlot( OwnerID(),"touch","LuaZ14WS_424176_1",50 )
end

--(2)����BeginCastBar�P�_

function LuaZ14WS_424176_1() --���a
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	if	CheckAcceptQuest(OwnerID(),424176)==true		then
		if	CountBodyItem(OwnerID(),209459) <5				then
			if	CountBodyItem(OwnerID(),209449) >0			then
				if BeginCastBarEvent( O_ID, T_ID,"[SC_424176_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ14WS_424176_2" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );--�ؼЦ��L��
					return	
				end
			else
				ScriptMessage( O_ID, O_ID, 1,"[SC_424151_2]", 0 )
				ScriptMessage( O_ID, O_ID, 0,"[SC_424151_2]", 0 )
			end
		end
	else
	ScriptMessage( O_ID, O_ID,1,"[SC_Z16_REQUIRE]",0)--�S���ŦX���e�U����
	ScriptMessage( O_ID, O_ID,0,"[SC_Z16_REQUIRE]",0)--�S���ŦX���e�U����
	end	
end

--(3)����BeginCastBar�ᤧ���G


function LuaZ14WS_424176_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			-- ���\
			EndCastBar( O_ID, CheckStatus );
			GiveBodyItem( OwnerID() , 209459 , 1 )
			DelBodyItem(OwnerID(),209449,1)
			Beginplot(T_ID,"LuaZ14WS_424176_3",0)
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
		end
	end
end

function LuaZ14WS_424176_3()
	DisableQuest(OwnerID(), true )
	LuaFunc_ResetObj( OwnerID())
	DisableQuest(OwnerID(), false )

end
 
 
--======================================================================================================
--118064
--======================================================================================================

function LuaZ14WS_118064_BORN()
	while 1 do
	PlayMotionEX(OwnerID(),ruFUSION_ACTORSTATE_DAZED_BEGIN,ruFUSION_ACTORSTATE_DAZED_LOOP)	
	NPCsay(OwnerID(),"[SC_118064_0]")
	--[118063]���Ӷ̥ʡA�N�o�����}�ڭ̤F�C
	sleep(60)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DAZED_END)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	NPCsay(OWnerID(),"[SC_118064_1]")
	--�p�G�L�S�ӳo�̾�����ﵷ���u�@�A�]�\�٬���......
	NPCsay(OWnerID(),"[SC_118064_2]")
	sleep(50)
	--�u�A�Ӥu�@�F�C
	sleep(60)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_WAVE)
	NPCsay(OWnerID(),"[SC_118064_3]")
	--���ʵﵷ�B���ʵﵷ�ڡI
	sleep(600)
	end
end

function LuaZ14WS_118064_speak()
	LoadQuestOption(OwnerID())
		AddSpeakOption(OwnerID(),TargetID(),"[SC_118064_4]","LuaZ14WS_118064_speak_1",0)
		--(�ݰݥL�A[118063]������A�A�n�浹[118063]����H)
end

function LuaZ14WS_118064_speak_1()
		SetSpeakDetail(OwnerID(),"[SC_118064_5]")
		--[118063]�A�]���|�^�ӤF�A���h�۫së���߱��A���L�浹�A�����ȧa�C
		--�H�᦬�ʵﵷ�ѧڭt�d�A�A�i�H�����ڪ��e�U�A�N[209441]��I���ڡC
end		























 
