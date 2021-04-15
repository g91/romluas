
--======================================================================================================
--423528
--======================================================================================================

function LuaS_423528_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423528)== true ) 			and
			Checkflag(OwnerID(),544370)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_0]","LuaS_423528_1",0)
			--�A���D���̥i�H���L�̶ܡH
		end
end

function LuaS_423528_1()
	SetSpeakDetail(OwnerID(),"[SC_423528_1]")
	--�Y�ڴx���������L�~�A���Q������X�S�������F�l�B�p��A�K���N�O�G�����H.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_2]","LuaS_423528_2",0)
	--���U�å��p���h�J�A�٬O�ԷV��Ƭ��y�C
end

function LuaS_423528_2()
	SetSpeakDetail(OwnerID(),"[SC_423528_3]")
	--�Y�ڴx���������L�~�A���Q������X�S�������F�l�B�p��A�K���N�O�G�����H.....
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423528_4]","LuaS_423528_3",0)
	--���U�å��p���h�J�A�٬O�ԷV��Ƭ��y�C
end
	
function LuaS_423528_3()	
	if (CheckAcceptQuest(OwnerID(),423528)== true ) 	then
		Setflag(OwnerID(),544370,1)
	end
	CloseSpeak(OwnerID())
end


--======================================================================================================
--423531
--======================================================================================================

function LuaS_423531_0()
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423531)== true ) 			and
			Checkflag(OwnerID(),544372)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_0]","LuaS_423531_CheckBusy0",0)
			--(�����F��)
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_3]","LuaS_423531_2",0)
			--(�L����L)
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423531_5]","LuaS_423531_4",0)
			--�ջ��b���̡H
		end
		
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544374)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_0",0)
			--�аݡA�A�{�ѭ�����h�����W��ۿߪ��ѱC�C�ܡH
		end
end


--����������������������������������(�����F��)����������������������������������������������--

function LuaS_423531_CheckBusy0()
	--�P�_���@���t�X��npc�O�_���L���A�p�G�����h�t�X�@���A���h�e�L�@�y�ܡA�ХL���ݡA���b�s���t�Xscript����q�禡
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"T..T1")

	if	ReadRoleValue( TargetID() ,EM_RoleValue_PID ) == 0	then
		
		BeginPlot( TargetID() , "LuaS_423531_1" , 0 )
		CloseSpeak( OwnerID() )
	else
		SetSpeakDetail(OwnerID(),"[GATHER_MSG_OBJBUSY]")			--�ؼХ��b���L���C	
	end
end

function LuaS_423531_1()
	DisableQuest( OwnerID() , true )
	--�@�w�n���W���@���t�X�����
	writerolevalue( OwnerID() , EM_RoleValue_PID , 1 )
		if  ReadRoleValue(TargetID(),EM_RoleValue_Money )>49	then
			Adjustfacedir(OwnerID(),TargetID(),0)
			Say(OwnerID(),"[SC_423531_1]")
			--��F���A�A�n�䪺�F��N�n��F�A�ݧڪ��I
			Sleep(30)
			CastSpell(OwnerID(),TargetID(),492669)
			Sleep(40)
			SetFlag(TargetID(),544372,1)
			AddRoleValue(TargetID(),EM_RoleValue_Money,-50)
			--�R�����a����50��
			


		else
			ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423531_7]", 0 )
			ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423531_7]", 0 )
		end	
	writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )	--�]���b�P�_�禡��LuaS_423377_CheckBusy�̳]��1
	DisableQuest( OwnerID() , false )
end


function LuaS_423531_2()
	Beginplot( TargetID() , "LuaS_423531_3" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423531_3()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423531_4]")
	--�A�N�L�h�a�I���L�A�n�䪺�F��A�i���|�o�򻴩��Q�A���C
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	DisableQuest( OwnerID() , false )
end
	
function LuaS_423531_4()
	Beginplot( TargetID() , "LuaS_423531_5" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423531_5()
	DisableQuest( OwnerID() , true )
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423531_6]")
	--�B�͡A�S���S���װڡC
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_SPEAK)
	Sleep(30)
	DisableQuest( OwnerID() , false )
end



--======================================================================================================
--423532
--======================================================================================================

function LuaI_s7_208137_0()	
	--�ջ��
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaI_s7_208137_1",0)
end


function LuaI_s7_208137_1()
	if	(CountBodyItem(TargetID(),208137))>0 	then
		GiveBodyItem( TargetID() , 208138 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208137_0]" , 0 )	
		--�A�p�ߪ��N�ջ���K�U�C
		UseItemDestroy()	
		--�Ҫ������n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),208137,1)
	end
end
	
	
function LuaI_s7_208139_0()
	--�ť��U 
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaI_s7_208139_1",0)
end


function LuaI_s7_208139_1()
	if	(CountBodyItem(TargetID(),208138))>9 	then
		GiveBodyItem( TargetID() , 208140 , 1 )
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208139_0]" , 0 )	
		--�A�N[207138]�ˤJ[207139]�C
		UseItemDestroy()	
		--�Ҫ������n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),208138,10)
		DelBodyItem(TargetID(),208139,1)
	else
		ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_208139_1]" , 0 )
		--�A�֦���[207138]�ƶq�����H�˺�[207139]�C
	end
end


--=====================================================================================================
--423533�I�a�ϤW3d����A�}�ҥ���(Burning Bag)
--=====================================================================================================

--(1)����Ĳ�I�@��
function Lua_BeginCastBar_423533()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","Lua_BeginCastBar_423533_1",30 )

end


--(2)����BeginCastBar�P�_
function Lua_BeginCastBar_423533_1() --
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckAcceptQuest(OwnerID(),423533)==true			and
		CheckFlag(O_ID,544384)==false				then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423533_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "Lua_BeginCastBar_423533_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��

		end
	end
end


--(3)����BeginCastBar�ᤧ���G

function Lua_BeginCastBar_423533_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );
						AddBuff(T_ID,505471,1,10)	
						SetFlag(O_ID,544384,1)
						AddBuff(O_ID,507542,1,60)
						--�P�_�إX���߫}�O�_�ݪ�����buff
						BeginPlot(T_ID,"Lua_BeginCastBar_423533_3",0)
					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
		

function Lua_BeginCastBar_423533_3()
	DisableQuest(OwnerID(), true )
		local Mio  = Lua_DW_CreateObj("flag" ,116308,780736,1)	
		DisableQuest(Mio, true )
		Hide(Mio)
		Show(Mio,0)
		DW_MoveToFlag(Mio,780736,2,0,1)
		Delobj(Mio)
		CancelBuff(TargetID(),507542)
	
	DisableQuest(OwnerID(), false )
end


function LuaWS_423533_E0()	--780739.1
	DisableQuest(OwnerID(), true )
		AddBuff(TargetID(),507546,1,200)	
		
		Local Box  = LuaFunc_CreateObjByObj( 116370 , OwnerID() )
		Hide(Box)
		DisableQuest(Box, true )
		Show(Box,0)
		WriteRoleValue(Box, EM_RoleValue_IsWalk, 0)
		Sleep(30)
		Yell(Box,"[SC_423533_0]",2)
		DW_MoveToFlag(Box,780739,1,0,1)
		Delobj(Box)
		CancelBuff( TargetID()  , 507546  ) 
	DisableQuest(OwnerID(), false )
end
	
	
	
	

--======================================================================================================
--423535
--======================================================================================================

function LuaS_423535_0()
	SetSpeakDetail(OwnerID(),"[SC_423535_0]")
	--�A�����ө�ۿߡA�ѬO���g�����n�ۤH�ݪ��ƦѱC�l�H
	SetFlag(OwnerID(),544374,1)
end

function LuaS_423535_1()
	--�T�W������
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544375)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_2",0)
			--�аݡA�A�{�ѭ�����h�����W��ۿߪ��ѱC�C�ܡH
		end
end

function LuaS_423535_2()
	SetSpeakDetail(OwnerID(),"[SC_423535_1]")
	--��A���Ӻƺ��������ѱC�C�ڡA�ڤ����D�o����̡A�ڤ��`�b�o�̨���o�C
	SetFlag(OwnerID(),544375,1)
end

function LuaS_423535_3()
	--�~�ߪ�����
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544376)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_4",0)
			--�аݡA�A�{�ѭ�����h�����W��ۿߪ��ѱC�C�ܡH
		end
end

function LuaS_423535_4()
	SetSpeakDetail(OwnerID(),"[SC_423535_2]")
	--���ӺƱC�l�A�W���w���ڰ��o���ߡA���b�ڮa���f�j���j�x
	SetFlag(OwnerID(),544376,1)
end

function LuaS_423535_5()
	--�Q�u
	LoadQuestOption(OwnerID())
		if 	(CheckAcceptQuest(OwnerID(),423535)== true ) 			and
			Checkflag(OwnerID(),544377)== false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423535_4]","LuaS_423535_6",0)
			--�аݡA�A�{�ѭ�����h�����W��ۿߪ��ѱC�C�ܡH
		end
		
		if 	CheckAcceptQuest(OwnerID(),423537)==true 			and
			CheckCompleteQuest(OwnerID(),423537)==false			and
			Checkflag(OwnerID(),544379)==false				then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_0]","LuaS_423537_0",0)
			--���ݩ�ڭ̪��]�_�A�ڭ̤��ব�C
		end
		if 	(CheckCompleteQuest(OwnerID(),423535)== true ) 		and
			Checkflag(OwnerID(),544385)== false				then
			SetFlag(OwnerID(),544385,1)
		end
end

function LuaS_423535_6()
	SetSpeakDetail(OwnerID(),"[SC_423535_3]")
	--�ڪ��D���ӦѱC�l�A�o�i�O���������o�F�A���L�O�A�o�����U���I���D.....
	SetFlag(OwnerID(),544377,1)
	SetFlag(OwnerID(),544385,1)
end

function LuaWS_423535_end()
	if	Checkflag(TargetID(),544385)== false	 then
		SetFlag(TargetID(),544385,1)
	end
end

--======================================================================================================
--423536
--======================================================================================================

function LuaS_423536_0()
	--����116226
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423536)== true ) 			and
		Checkflag(OwnerID(),544378)== false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_0]","LuaS_423536_1",0)
		--���U�A���䦳�@�W�ܼ}���Q�u���ڭ̳o�˪���ĳ......
	end
end

function LuaS_423536_1()
	SetSpeakDetail(OwnerID(),"[SC_423536_1]")
	--�����ĳ�H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_2]","LuaS_423536_2",0)
	--(�A�@���@�Q���X�A�~�Q�u�i�D�A����ĳ)
end
	
function LuaS_423536_2()
	SetSpeakDetail(OwnerID(),"[SC_423536_3]")
	--�M�h�A�Y�̱q�A���N�ӨM�w�A�A�|��ܦ�̡H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_4]","LuaS_423536_3",0)
	--(���U�]�_�A�A�����W�i�����u�H���])
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423536_5]","LuaS_423536_4",0)
	--(���A�g�S�]�����O�@�W���a���M�h�Ӱ�����)
end	
	
function LuaS_423536_3()
	SetSpeakDetail(OwnerID(),"[SC_423536_6]")
	--�M�h�A�D�ڤ����Z�໴�����U�H�A�Y�O�������W�Q�u�A
	SetFlag(OwnerID(),544378,1)
end
	
function LuaS_423536_4()	
	SetSpeakDetail(OwnerID(),"[SC_423536_7]")
	--�M�h�A�F�ԥ����H�A���^�i�P�L�p���ơI
	SetFlag(OwnerID(),544378,1)
end	
	
	
--======================================================================================================
--423537
--======================================================================================================
function LuaS_423537_0()
	SetSpeakDetail(OwnerID(),"[SC_423537_1]")
	--�u�n���ڤ@�ǿ��A�N����_�������w��......

		AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_2]","LuaS_423537_1",0)
		--(�ؤ��Q�u200����)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423537_4]","LuaS_423537_3",0)
		--(�����Q�u��)
	end

function LuaS_423537_1()
	BeginPlot( TargetID() , "LuaS_423537_2" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423537_2()
	if	Checkflag(TargetID(),544379)==false	then
		if  ReadRoleValue(TargetID(),EM_RoleValue_Money )>49	then
			Adjustfacedir(OwnerID(),TargetID(),0)
			Say(OwnerID(),"[SC_423537_3]")
			--�A�����]�_�A�o�٭n���ڿ��H�A�H�u�n�ڡI
			SetFlag(TargetID(),544380,1)
			SetFlag(TargetID(),544379,1)
			AddRoleValue(TargetID(),EM_RoleValue_Money,-200)
		else
			ScriptMessage( OwnerID(), TargetID(), 0,"[SC_423531_7]", 0 )
			ScriptMessage( OwnerID(), TargetID(), 1,"[SC_423531_7]", 0 )
			--�A���W�����������A�зǳƥR���A�L�ӡC
		end
	end
end


function LuaS_423537_3()	
	BeginPlot( TargetID() , "LuaS_423537_4" , 0 )
	CloseSpeak( OwnerID() )
end

function LuaS_423537_4()
	if	Checkflag(TargetID(),544379)==false	then
		Say(OwnerID(),"[SC_423537_5]")
		--�������N�Q���o�ڡH�n�å�A�A�N�H�ɤp�ߧA���I��a�I
		AddBuff( TargetID()  , 507549 , 1 , 600 ) 
		--�u�S�u���O��v�Q��ŧ���X��
		SetFlag(TargetID(),544379,1)
	end
end



function LuaWS_423537_C0()
	--�d��X�ǡB����
	Setplot(OwnerID(),"range","LuaWS_423537_C1",100)
end

function LuaWS_423537_C1()
	Setplot(OwnerID(),"range","LuaWS_423537_C1",0)
	if 	Checkbuff( OwnerID() , 507549)==true				and
		Checkbuff( OwnerID() ,507548)==false				and
		ReadRoleValue(OwnerID(),EM_RoleValue_PID )~=10		then
		Beginplot(TargetID(),"LuaWS_423537_C2",0)
	end
	Setplot(OwnerID(),"range","LuaWS_423537_C1",150)
end


function LuaWS_423537_C2()	--�p�ĩ�buff�w�t�B�j�H�X�ӥ��H
	Setplot(OwnerID(),"range","",0)
	DisableQuest(OwnerID(), true )
	writerolevalue( TargetID() , EM_RoleValue_PID , 10 )	
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
		--local Kid = Lua_DW_CreateObj("flag" ,116367,780738,1)
		local Kid = CreateObj ( 116367 , X+50 , Y , Z+20 , 0 , 1) 
		Hide(Kid)
		Show(Kid,0)
		WriteRoleValue(Kid, EM_RoleValue_IsWalk, 0)
		DisableQuest(Kid, true )

		AdjustFaceDir(Kid,TargetID(),0)
		--AddBuff( TargetID()  , 507549 , 1 , 300 )
		MoveToFlagEnabled(Kid, false )
		--�������޼@�����ʧ@�A�Ynpc��ť�ܡA�ۤv�ð��h�l���ʧ@�G�p�ۤv��V�A�ոլݳo�ӫ��O
		CastSpell(Kid,TargetID(),496118)	--494805
		Sleep(30)
		MoveToFlagEnabled(Kid, true )
		--�������޼@�����ʧ@�A�Ynpc��ť�ܡA�ۤv�ð��h�l���ʧ@�G�p�ۤv��V�A�ոլݳo�ӫ��O
		Yell(Kid,"[SC_423537_C0]",2)
		PlayMotion(Kid,ruFUSION_ACTORSTATE_EMOTE_LAUGH	)
		Sleep(30)
		Beginplot(Kid,"LuaWS_423537_C3",0)
		Sleep(50)
		
		--�^�챻���
	Delobj(Kid)
	writerolevalue( TargetID() , EM_RoleValue_PID , 0 )	
	DisableQuest(OwnerID(), false )
	Setplot(OwnerID(),"range","LuaWS_423537_C1",150)
end

function LuaWS_423537_C3()
	Local N=RandRange( 1 , 5)  
	DW_MoveToFlag(OwnerID(),780738,N,0,1)
end


--======================================================================================================
--423537	���a��J�A�Ǹ��X����
--======================================================================================================
function LuaS_423537_K0()	--�سz������115265�A���d��@��
	Setplot(OwnerID(),"range","LuaS_423537_K1",60)	--�]�wĲ�o�d��G�b�i�J��npc50���A����Lua
end	

function LuaS_423537_K1()	--OWNER�O���a
	Setplot(OwnerID(),"range","",0)

	if 	Checkbuff( OwnerID() ,507548)== true 	and
		ReadRoleValue(OwnerID(),EM_RoleValue_IsAttackMode)==0		then
		Beginplot(TargetID(),"LuaS_423537_K2",0)

	end
	Setplot(OwnerID(),"range","LuaS_423537_K1",50)
end

function LuaS_423537_K2()	--OwnerID�O103556

	Setplot(OwnerID(),"range","",0)

	local player="here"
	local So = LuaFunc_CreateObjByObj( 103556 , OwnerID() )	--�سz������B�����ͥX���H����
	--		DisableQuest( So , true )					--�������
	Yell(So,"[SC_423537_C2]",1)
	SetAttack(So , TargetID())
	
	while 1 do

		if 	GetDistance( TargetID(), OwnerID()) >300   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		if 	CheckID(So) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		Sleep(50)
		delobj(So)
	end
	Setplot(OwnerID(),"range","LuaS_423537_K1",50)
end






--======================================================================================================
--423538
--======================================================================================================

function LuaS_423538_0()
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423538)== true ) 	and
		Checkflag(OwnerID(),544381)== false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_0]","LuaS_423538_1",0)
		--���n�N��A�ЧA�C�|�U�����˪��~�C
		WriteRoleValue( OwnerID() , EM_RoleValue_PID ,0)
	end
end

function LuaS_423538_1()
	SetSpeakDetail(OwnerID(),"[SC_423538_1]")
	--�����A�o�O���Ӫ��A���ƥJ�Ӥ@�I�`�O���|�����C
	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_2]","LuaS_423538_2",0)
	--�л��a�C

end


function LuaS_423538_2()
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 0	then
			local N=RandRange(1,2)
			WriteRoleValue( OwnerID() , EM_RoleValue_PID , N )
				if 	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 1	then
					SetSpeakDetail(OwnerID(),"[SC_423538_3]")
					--�U�l�̦��@�`�^�����_�۪���H�p�M�A��������A���p�٫��A���������a�A���_�ۯª��y�a
				end
				
				if 	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 2	then
					SetSpeakDetail(OwnerID(),"[SC_423538_4]")
					--�U�l�̦��B�A�u�ޡB�y�������B�������B���p�Q�Y�B�ժ������B���Ŭï]�ݰw
				end
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423538_29]", 0 )	
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423538_29]", 0 )			
			--�A�٥��P��Z�g�T�{���D�����׬O�_���T
		end
end



function LuaS_423538_3()
	--���b��Z�g116227��ܤ��U
	LoadQuestOption(OwnerID())
	if 	(CheckAcceptQuest(OwnerID(),423538)== true ) 		and
		Checkflag(OwnerID(),544381)== false					then
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) ~= 0	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_5]","LuaS_423538_4",0)
			--�ڱa�ۥL�����צ^�ӤF�C
		else
			CloseSpeak(OwnerID())
			ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423538_30]", 0 )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_423538_30]", 0 )
			--�A�٥��P���D�T�{�L�����סC
		end
	end
end

function LuaS_423538_4()
	SetSpeakDetail(OwnerID(),"[SC_423538_6]")
	--�A���a�A�ڨӹ�ӳU���O�_�����������~�C
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_7]","LuaS_423538_5",0)
			--X���_�۩�H�p�M�B���p�٫�......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_8]","LuaS_423538_5",0)
			--X���_�۩�H�p�M�B���p�٫�......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_9]","LuaS_423538_5",0)
			--X���_�۩�H�p�M�B���p�٫�......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_10]","LuaS_423538_6",0)
			--�����_�۩�H�p�M�B���p�٫�......
		end
		if	ReadRoleValue( OwnerID() ,EM_RoleValue_PID ) == 2	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_19]","LuaS_423538_5",0)
			--X����Q�Y�B�B�A�u��......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_20]","LuaS_423538_5",0)
			--X�ժ��Q�Y�B�B�A�u��......
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_21]","LuaS_423538_8",0)
			--�ݶ��p�Q�Y�B�B�A�u��......*
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_22]","LuaS_423538_5",0)
			--X�ժ��Q�Y�B����u��......
		end
end		
	
function LuaS_423538_5()
	SetSpeakDetail(OwnerID(),"[SC_423538_18]")
	--���G���ӹ�A�A�A�h�T�{�@���C
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaS_423538_6()
	SetSpeakDetail(OwnerID(),"[SC_423538_11]")
	--��A�٦��O�H
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_12]","LuaS_423538_5",0)
			--X���_�ۯª��y�a�B��������B���������a�C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_13]","LuaS_423538_5",0)
			--X�ŦB���ª��y�a�B ��������B���������a�C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_14]","LuaS_423538_5",0)
			--X��B���ª��y�a�B��������B���������a�C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_15]","LuaS_423538_5",0)
			--X��B���ª��y�a�B��������B���������a�C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_16]","LuaS_423538_7",0)
			--�ݺ��_�ۯª��y�a �B��������B���������a�C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_17]","LuaS_423538_5",0)
			--X���_�ۯª��y�a�B��������B���������a�C
end

function LuaS_423538_8()
	SetSpeakDetail(OwnerID(),"[SC_423538_11]")
	--��A�٦��O�H
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_23]","LuaS_423538_5",0)
			--X�ժ������B�����ï]�ݰw�B�������B�y�������C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_24]","LuaS_423538_7",0)
			--�ݬy�������B���Ŭï]�ݰw�B�������B�ժ������C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_25]","LuaS_423538_5",0)
			--X�ժ������B�����ï]�S���B�B�A����B�y�������C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_26]","LuaS_423538_5",0)
			--X�y�������B�����ï]�S���B�B�A����B�ժ������C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_27]","LuaS_423538_5",0)
			--X�ժ������B���Ŭï]�ݰw�B�������B�y�������C
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423538_28]","LuaS_423538_5",0)
			--X�y�������B�����ï]�ݰw�B�������B�ժ������C
end


function LuaS_423538_7()
	SetSpeakDetail(OwnerID(),"[SC_423538_31]")
	--��A���T�L�~�A�ݨӥL���T�O���D�C
	SetFlag(OwnerID(),544381,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

--======================================================================================================
--423539���ȫ�@��
--======================================================================================================
function LuaS_423539_0()
	--Say(OwnerID(),"I'm O")
	--Say(TargetID(),"I'm T")
	DisableQuest(OwnerID(), true )
	AddBuff(TargetID(),507542,1,600)
		local Pu= LuaFunc_CreateObjByObj( 116363 , OwnerID() )	
		Hide(Pu)
		Show(Pu,0)
		WriteRoleValue(Pu, EM_RoleValue_IsWalk, 0)
		local Cu= Lua_DW_CreateObj("flag" ,116364,780737,1)
		Hide(Cu)
		local No= Lua_DW_CreateObj("flag" ,116365,780737,2)
		Hide(No)
		local Tu= Lua_DW_CreateObj("flag" ,116366,780737,3)
		Hide(Tu)
		DisableQuest(Pu, true )
		DisableQuest(Cu, true )
		DisableQuest(No, true )
		DisableQuest(Tu, true )
			ScriptMessage( TargetID(), TargetID(), 0,"[SC_423539_0]", 0 )
			ScriptMessage( TargetID(), TargetID(), 2,"[SC_423539_0]", 0 )
			--��M�A���B�Ǩӫ�P���s�|�n�I
			Beginplot(Cu,"LuaS_423539_1",0)
			Beginplot(No,"LuaS_423539_2",0)
			PlayMotion(Pu,ruFUSION_ACTORSTATE_EMOTE_AMAZED)
			WriteRoleValue(Pu, EM_RoleValue_IsWalk, 0)
			Sleep(20)
			DW_MoveToFlag(Pu,780737,6,0,1)
			Beginplot(Tu,"LuaS_423539_3",0)
			Delobj(Pu)
			Yell(Cu,"[SC_423539_2]",1)
			--�S����"�S������"���F�l�]�F�A�Ӧ����I
			Sleep(30)
			Yell(Tu,"[SC_423539_3]",1)
			--�J�ӹy�Ͷ�������ܡH�����S�S�J�ӹy�ͮ�F�ܡH]
			Sleep(30)
			PlayMotion(Tu,ruFUSION_ACTORSTATE_EMOTE_CRY)
			DW_MoveToFlag(Tu,780737,8,0,1)
				--SetFlag(TargetID(),544382,1)
				Delobj(Cu)
				Delobj(NO)
				Delobj(Tu)
			
	CancelBuff( TargetID()  , 507542 )	
	DisableQuest(OwnerID(), false )
end

function LuaS_423539_1()
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0)
	Yell(OwnerID(),"[SC_423539_1]",2)	
	--�Ӧ����F�l�B��~���p���A�A�O�]�I
	DW_MoveToFlag(OwnerID(),780737,4,0,1)
end

function LuaS_423539_2()
	Show(OwnerID(),0)
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0)
	DW_MoveToFlag(OwnerID(),780737,5,0,1)
end

function LuaS_423539_3()
	Show(OwnerID(),0)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_AMAZED)
	DW_MoveToFlag(OwnerID(),780737,7,0,1)

end


function LuaS_423540_0()
	SetPlot( OwnerID(),"range","LuaS_423540_1",200 )
end

function LuaS_423540_1()
	if 	(CheckCompleteQuest(OwnerID(),423539)== true ) 		and
		Checkflag(OwnerID(),544382)==false					then
			SetFlag(OwnerID(),544382,1)
	end
end


























