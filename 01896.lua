
--======================================================================================================

function LuaI_s7_207449()	--�`�K�������l
	Beginplot(TargetID(),"LuaI_s7_207449_1",0)
end

function LuaI_s7_207449_1()
	if	(CountBodyItem(TargetID(),207448))>0 then
		GiveBodyItem( TargetID() , 207447 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_207447_0]" , 0 )		--�A��[207449]�N�o��[207448]���j�����R������C
		UseItemDestroy()			--�Ҫ����n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),207448,1)
	else
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_207447_1]" , 0 )		--�A�ݭn[207448]�C	
	end
end


--================================�I�a�ϤW3d����A�}�ҥ���======================================================================

--(1)����Ĳ�I�@��
function Lua_BeginCastBar_423377()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423377_1",30 )

end


--(2)����BeginCastBar�P�_
function Lua_BeginCastBar_423377_1() --
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
		--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()

	if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423377_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423377_2" ) ~= 1 then
		ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��

	end
end


--(3)����BeginCastBar�ᤧ���G

function Lua_BeginCastBar_423377_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC





	if	CheckAcceptQuest(OwnerID(),423377)==false then
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				-- ���\
				EndCastBar( O_ID, CheckStatus );
				DW_Border(423377)  	
			else
				-- ����
				EndCastBar( O_ID, CheckStatus );	
			end
		end
	end	
end			

--======================================================================================================

function LuaS_423376_END0()	--��b����423376���ȵ����� 
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423376_E0]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E0]" , 0 )
	--�n��I
	Sleep(20)
	ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423376_E1]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E1]" , 0 )
	--(�@�ӪŰs�~���i�ӡA�I���S�I���S�{��A)
	Sleep(30)
	ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423376_E2]" , 0 )
	ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423376_E2]" , 0 )
	--(�s�~���Y���G���F��A�A�����˵��@�U�o�Ӱs�~)
end

function LuaS_423376_1()
	SetSpeakDetail(OwnerID(),"[SC_423376_1]")
	--���A��꦳�@���ڧ󦳧Ʊ�ӥX�A�L���W�r�O�L�����A�u�O����L�b�Ĥ@�����ɤ����F���ˡA�w�g�L�k�~��ѥ[���v�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_2]","LuaS_423376_2",0)
	--�u�o��A�ӻ��O��n�ưڡC�v
end

function LuaS_423376_2()
	SetSpeakDetail(OwnerID(),"[SC_423376_3]")
	--�L�k�P�q������⥿����աA�ڤ����D�n�b���̡C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_4]","LuaS_423376_3",0)
	--�u���λ����o����էa�H���h�̤j�����A�ӧQ�w�b�A��C�v
end

function LuaS_423376_3()
	SetSpeakDetail(OwnerID(),"[SC_423376_5]")
	--��ť���X�ӧA����s�t������A�L�����b�o�Ӯɨ���ˡA���ݡA���O�ڪ����ó̤j�A���L�ڤ��|�h�X���v�A���u���o�v���@�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_6]","LuaS_423376_4",0)
	--�u�u���H�A�O���L���檺�T�Q�H�Ү`�A�A���D�O�֡H�v
end

function LuaS_423376_4()
	SetFlag(OwnerID(),544235,1)
	CloseSpeak( OwnerID() )
end



--(1)�o�O��ܭ����޵o���@����t
function Lua_423377_0()
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423376)==true 	and
		CheckCompleteQuest(OwnerID(),423376)==false	and
		Checkflag ( OwnerID(), 544235 )	==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423376_0]","LuaS_423376_1",0)
		--�uť���Q�ꦹ�����v�j�y��A�A���I�n�̰��C�v
	end
	
	if 	CheckAcceptQuest(OwnerID(),423377)==true 	and
		Checkflag ( OwnerID(), 544236 )	==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423377_5]","LuaS_423377_1",0)
	end

end

--(2)�b�̫�@�y��ܡA�Y�}�Ҽ@���t�X�e�A�I�s�ˬd���t�X��npc�O�_���L��function
function LuaS_423377_1()
	SetSpeakDetail(OwnerID(),"[SC_423377_0]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423377_1]","LuaS_423377_CheckBusy",0)
end

--(3)�ˬd���t�X��npc�O�_���L��function�A�Hpid���P�_�ȡA�I�s�@���t�Xfunction
function LuaS_423377_CheckBusy()	--�P�_���@���t�X��npc�O�_���L���A�p�G�����h�t�X�@���A���h�e�L�@�y�ܡA�ХL���ݡA���b�s���t�Xscript����q�禡
--Say(OwnerID(),"0..01")
--Say(TargetID(),"T..T1")

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		writerolevalue( TargetID() , EM_RoleValue_PID , 1 )
		BeginPlot( TargetID() , "LuaS_423377_2" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--�ؼХ��b���L���C
	end
end


--(4)�@���t�Xscript
function LuaS_423377_2()
	DisableQuest( OwnerID() , true )
	--�@�w�n���W���@���t�X�����
--Say(OwnerID(),"0..02")
--Say(TargetID(),"T..T2")

	WriteRoleValue ( OwnerID() , EM_RoleValue_Register4 , TargetID() )
	--�t�X(5)���P�_
	AddBuff( TargetID()  , 506979 , 1 , 300 )	--�����a�O�_�������P�_buff
	--�t�X(5)���P�_��buff
	Beginplot(OwnerID(),"LuaS_423377_PlayerCHECK",0)
	--�b�����W(5)�A�N�P�@���t�X�P�B����A�C2���ˬd�@��
	
		Local X = ReadRoleValue(OwnerID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(OwnerID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(OwnerID(),EM_RoleValue_Z)
	
	local bcat1 = Lua_DW_CreateObj("flag" ,115743,780660,1)
	local bcat2 = Lua_DW_CreateObj("flag" ,115743,780660,1)
	DisableQuest( bcat1 , true )	--�إX��npc�P�����W���
	DisableQuest( bcat2 , true )
	--SetDefIdleMotion(bcat1,ruFUSION_MIME_ATTACK_BOW_SP_LOOP)
	--SetDefIdleMotion(bcat2,ruFUSION_MIME_ATTACK_BOW_SP_LOOP)
	Hide(bcat1)
	Show(bcat1,0)
	Hide(bcat2)
	Show(bcat2,0)
	Sleep(20)
	WriteRoleValue(bcat1, EM_RoleValue_IsWalk, 1)
	WriteRoleValue(bcat2, EM_RoleValue_IsWalk, 1)
	Yell(OwnerID(),"[SC_423377_2]",1)
	Sleep(30)
	BeginPlot(bcat1,"LuaS_423377_3",0)
	DW_MoveToFlag(bcat2,780660,3,0,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Adjustfacedir(OwnerID(),bcat1,0)
	Adjustfacedir(bcat1,OwnerID(),0)
	Adjustfacedir(bcat2,OwnerID(),0)

	PlayMotion(bcat2,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(bcat2,"[SC_423377_3]",1)		--"�w�J�ġA�b�ǳƲĤG�����ɰڡH"
	Sleep(30)
	BeginPlot(bcat2,"LuaS_423377_6",0)
	PlayMotion(bcat1,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Yell(bcat1,"[SC_423377_4]",1)		--"�ڬݡA�A�٬O�O���F�A�h�X�j�y�⨤�v�ɧa�I"
	Sleep(30)
	PlayMotion(OwnerID(),ruFUSION_MIME_EMOTE_POINT)
	Yell(OwnerID(),"[SC_423377_6]",1)	--"�A�̳o�����H��ʪ��O�аV�I"
	BeginPlot(bcat1,"LuaS_423377_6",0)
	Sleep(30)
	DW_MoveToFlag(OwnerID(),780660,5,0,1)
	Adjustfacedir(OwnerID(),bcat1,0)
	Adjustfacedir(bcat1,OwnerID(),0)
	Adjustfacedir(bcat2,OwnerID(),0)
	if 	CheckAcceptQuest(TargetID(),423377)==true then		--�P�_���a�O�_���b���Ȥ��A�O�h�~�����@��
		--Say(OwnerID(),"0..03")
		--Say(TargetID(),"T..T3")
		CastSpell(OwnerID(),bcat1,495235)
		--PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_ANGRY)	--����
		
		Hide(bcat1)
		Show(bcat1,0)
		Hide(bcat2)
		Show(bcat2,0)
	
		Sleep(20)
		
		WriteRoleValue(bcat1, EM_RoleValue_IsWalk, 0)
		WriteRoleValue(bcat2, EM_RoleValue_IsWalk, 0)
		
		BeginPlot(bcat1,"LuaS_423377_4",0)
		Sleep(10)
		CastSpell(OwnerID(),bcat1,495235)		--�����A�b�Ҫ����A�ĪG�d��i�]�j�@�I�A�]���O�t���ΡA�G����������Ҧ��Ǫ�
		Sleep(30)
		
		PlayMotion(bcat2,ruFUSION_ACTORSTATE_EMOTE_AMAZED)		--�n��	
		Yell(bcat2,"[SC_423377_7]",1)	--�O���B�O���A�ڭ̳o�N���C
		Sleep(30)
		BeginPlot(bcat2,"LuaS_423377_5",0)
		
	else
		Move(OwnerID(),X,Y,Z)
		DW_MoveToFlag(OwnerID(),780660,6,0,1)
		Delobj(bcat1)
		Delobj(bcat2)
		writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	
		--�]���b�P�_�禡��LuaS_423377_CheckBusy�̳]��1
		DisableQuest( OwnerID() , false )
		
	end 
		
	if 	CheckAcceptQuest(TargetID(),423377)==true  then
		--Say(OwnerID(),"0..05")
		--Say(TargetID(),"T..T5")
		SetFlag( TargetID(), 544236, 1 )
	end
	Move(OwnerID(),X,Y,Z)
	DW_MoveToFlag(OwnerID(),780660,6,0,1)
	Sleep(50)
	Delobj(bcat1)
	Delobj(bcat2)
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--�]���b�P�_�禡��LuaS_423377_CheckBusy�̳]��1
	DisableQuest( OwnerID() , false )	
	
end

	
function LuaS_423377_3()
	DW_MoveToFlag(OwnerID(),780660,2,0,1)
end

function LuaS_423377_4()
	SetDefIdleMotion(OwnerID(),ruFUSION_MIME_DAZED	)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_FEAR)	--���hpose
	Sleep(30)

	DW_MoveToFlag(OwnerID(),780660,4,0,1)
	Hide(OwnerID())
end

function LuaS_423377_5()
	DW_MoveToFlag(OwnerID(),780660,4,0,1)
	Hide(OwnerID())
end
	
function LuaS_423377_6()	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_THINK)
end
	
	
--(5)�ˬd���a�O�_���b���Ȥ��A�Hbuff���P�_�зǡA�t�Xclient�A�p�G����buff�i�ݨ����t��npc/�L��buff�h���ê��o����npc
--		���������Ȫ��o����npc(�Yownerid)����client
function LuaS_423377_PlayerCHECK()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register4 )	
--Say(OwnerID(),"0..0check")
--Say(TargetID(),"T..Tcheck")
		for i = 0 , 100 , 1 do
			if	CheckAcceptQuest( Player, 423252 )==false		and	
				CheckBuff( Player , 506979) == true				then
				break
			end
			if	CheckBuff( Player , 506979) == false		then
				break
			end
			sleep( 20 )
		end
		CancelBuff( Player  , 506979  )	
end
	



--===============================�I�a�ϤW3d����A�}�ҥ���======================================================================

--(1)����Ĳ�I�@��
function Lua_BeginCastBar_423379()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423379_1",30 )

end


--(2)����BeginCastBar�P�_
function Lua_BeginCastBar_423379_1() --
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC
	if	CheckAcceptQuest(O_ID,423379)==true 	and
		Checkflag(O_ID,544237)== false 		then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423379_6]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423379_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��

		end
	end
end


--(3)����BeginCastBar�ᤧ���G
function Lua_BeginCastBar_423379_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				-- ���\
				EndCastBar( O_ID, CheckStatus );
				Beginplot(T_ID,"Lua_423379_0",0) 	
			else
				-- ����
				EndCastBar( O_ID, CheckStatus );	
			end
		end
	
end			

--(4)����I�s�Ǫ�script�AOwnerID�ONPC
function Lua_423379_0()
	local Boca  = Lua_DW_CreateObj("flag" ,103977,780674,1)	

	DisableQuest(OwnerID(), true )
	DisableQuest(Boca, true )
	Yell(Boca,"[SC_423379_7]",2)
	PlayMotion(Boca,ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	--�ޡI�A�}�a�F�ڪ������H�h���a�I
	Sleep(30)
	SetAttack(Boca  , TargetID())
	local player="here"
	local Monster="NotDead"
	local MonID="true"
	local quest="in"
	
		while 1 do
			if 	CheckAcceptQuest(TargetID(),423379)== false			then
				quest="out"
				break
			end
			
			if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
				CheckID(TargetID()) == false	or
				GetDistance( TargetID(), OwnerID()) >500 	then
				player="Nothere"
				break	
			end
			
			if 	(ReadRoleValue(Boca, EM_RoleValue_IsDead)==1 or  CheckID(Boca)== false)		then
				Monster="IsDead"
				break
			end
			Sleep(10)
		end
		
		if quest=="out" then
			SetStopAttack(Boca)
			Sleep(30)
			Delobj(Boca)
		end
		
		if player=="Nothere" then
			
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423379_8]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_8]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			Sleep(30)
			ScriptMessage(OwnerID(), TargetID() , 1 , "[SC_423379_8]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_8]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
			SetStopAttack(Boca)
			Sleep(30)
			Delobj(Boca)	
		end
		
		if  (CheckAcceptQuest(TargetID(),423379)== true ) 		and
			(CheckCompleteQuest(TargetID(),423379)==  false)  	and
			(CheckAcceptQuest(TargetID(),423380)== false)		and 
			Checkflag(OwnerID(),544237)== false 		then
			if	Monster=="IsDead" or MonID=="false" then
				SetFlag(TargetID(), 544237, 1 )			--�����ȧ����X�� 
				Yell(Boca,"[SC_112077_OD_3]",1)
				Sleep(30)
				Yell(Boca,"[SC_423379_0]",1)		
				--�n�h......[115627]�A����٬�...�ۡA�ڤ��O......���F�A�ܡH
				ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423379_1]" , 0 )
				ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_1]" , 0 )
				--�][115581]���B������ۧA�A���O�z�L�A�ݨ�P����[115627]......)
				Sleep(40)
				ScriptMessage(OwnerID(), TargetID() , 2 , "[SC_423379_2]" , 0 )
				ScriptMessage(OwnerID(), TargetID() , 0 , "[SC_423379_2]" , 0 )
				-- (�̫�A�L���Ѫ��b��ä��R�X�̫�@�f��C)
				Sleep(40)
				
				Sleep(40)

			end
		end
		DisableQuest( OwnerID() , false )
		--Delobj(Boca)	

end

function Lua_423379_1()	--���b������speak�U
	LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest(OwnerID(),423379)==true 		and
		CheckCompleteQuest(OwnerID(),423379)==false		and
		Checkflag(OwnerID(),544237)== false 		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_12]","Lua_423379_2",0)
		--�ڵ����A�C
	end
end

function Lua_423379_2()
	SetSpeakDetail(OwnerID(),"[SC_423379_3]")
	--���§A�C�ڭ�[115599]�{���A�ˤH���h���T�餺�A�Y��o�B�������b����A�L�ë����������N�|��o���ܪ����R�C���F[115627]�A�ڷ|�ݦb�o�̦u�ۥL�A���O�ڪ��ߤ������n�W�ۤ��몺�r�G�A�뤣�o���b���p�H�A�u�n�@�Q��L���ѻP�ĤG�����j�y�⨤�v�ɡA�ڴN�h�W�����A[$playername]�A�ЧA�h���F[115581]�A�N�N��L�����v��檺�@�Ů��^�ӡA�Ѱ��ڤ�

	AddSpeakOption(OwnerID(),TargetID(),"[SC_423379_4]","Lua_423379_3",0)
	--�ڭn�����L�H
end

function Lua_423379_3()
	SetSpeakDetail(OwnerID(),"[SC_423379_5]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423192_7]","Lua_423379_4",0)
end

function Lua_423379_4()
	CloseSpeak( OwnerID() )
end






	