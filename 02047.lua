
--===========================================================================================================================
--423601
--===========================================================================================================================

function LuaWS_423601_116526_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544405)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_0]","LuaWS_423601_116526_1",0)
					--�B�͡A�o�̪����礧�G�ĬO�t�����ܡH
		end
end

function LuaWS_423601_116526_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_1]")
	--�������A�A�]�Ӥ@�M�a�I���M�I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_2]","LuaWS_423601_116526_2",0)
	--�A��W�����M�i�H���ڶܡH
end

function LuaWS_423601_116526_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_3]")
	--���ڡH���ڤ���H�ޥL���A�����A�@�|��h�@��G�Ħ^�a�ܡI
	SetFlag(OwnerID(),544405,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_4]","LuaWS_423601_close",0)
	--�]�A�̪��͸ܧ����S���涰�^
end

---=*=---

function LuaWS_423601_116527_0()
	LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544406)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_5]","LuaWS_423601_116527_1",0)
					--�A�O���L�p���H�H�٬O�q�������L�Ӫ��H
		end
end

function LuaWS_423601_116527_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_6]")
	--�A������H�������u�����礧�G�A�Ѥl��o�̬O�ɺ֨Ӫ��I���Ѥw�g�ܤF�Q���M���礧�G�ĤF�A���{�l�̪����ƤF�A�ڭn���۳ܡI
	SetFlag(OwnerID(),544406,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_7]","LuaWS_423601_close",0)
	--�]�L���G����ť�����A�o��²����D�^
end

---=*=---

function LuaWS_423601_116528_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544407)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_8]","LuaWS_423601_116528_1",0)
					--�o�̪����礧�G�ĥi�H���A�Q�ܴN�ܡH
		end
end

function LuaWS_423601_116528_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_9]")
	--��M�A�P�®�Ԥһ�D�A�絹�ڭ̳o�ǨɥΤ��ɪ����礧�G�ġA�ګ���......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_10]","LuaWS_423601_116528_2",0)
	--�Ԫk�J���|�L�ӿ�H�H
end

function LuaWS_423601_116528_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_11]")
	--�O�ڡA�Q��i���̥i�n�F�A���̦��\�ħ󯫩_�����礧�G��
	SetFlag(OwnerID(),544407,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_12]","LuaWS_423601_close",0)
	--......�]�L�q��~��{�b���{���H�H)
end

---=*=---116529�n���D�¦�

function LuaWS_423601_116529_0()
LoadQuestOption(OwnerID())
		if 		(CheckAcceptQuest(OwnerID(),423601)== true )			and
				(CheckCompleteQuest(OwnerID(),423601)== false ) 		and
				CheckFlag(OwnerID(),544572)==false						then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_13]","LuaWS_423601_116529_1",0)
					--�A�ݰ_�ӫܱä㪺�ˤl......
		end
		
		if 		(CheckAcceptQuest(OwnerID(),423607)== true )			and
				(CheckCompleteQuest(OwnerID(),423607)== false ) 		then
				if		(CountBodyItem(OwnerID(),208285))<1				then
							AddSpeakOption(OwnerID(),TargetID(),"[SC_423607_0]","LuaWS_423607_116529_0",0)
							--���F�հt���U�A�̪��ľ��A�е��ڤ@���Y�v�M��G�C
				else
							CloseSpeak( OwnerID() )
							
				end		
		end
				
end



function LuaWS_423601_116529_1()
	SetSpeakDetail(OwnerID(),"[SC_423601_14]")
	--�O�ڡA���`�O�Ԥ���Q�ܯ��礧�G�Ī�����......�A�B�A�O��
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_15]","LuaWS_423601_116529_2",0)
	--�A�b��ߧڡH
end

function LuaWS_423601_116529_2()
	SetSpeakDetail(OwnerID(),"[SC_423601_16]")
	--.....���A�گu���A�J�M�A����k�i�ӡA��M����������O
	SetFlag(OwnerID(),544572,1)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423601_17]","LuaWS_423601_close",0)
	--�n���A�����F�C(�L���O���z���A�ӥB��ı����)
end


function LuaWS_423601_close()
	CloseSpeak( OwnerID() )
end




--===========================================================================================================================
--423604
--===========================================================================================================================


--(1)����Ĳ�I�@��
function LuaWS_BeginCastBar_423604()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_423604_1",30 )
end


--(2)����BeginCastBar�P�_
function LuaWS_BeginCastBar_423604_1() --
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckAcceptQuest(OwnerID(),423604)==true			and
		CheckCompleteQuest(OwnerID(),423604)==false			and
		CheckFlag(O_ID,544389)==false						then	
		if		CountBodyItem( OwnerID(), 208284)>2				then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423604_0]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_423604_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			end
		else
				ScriptMessage( O_ID, O_ID, 0,"[SC_423604_3]", 0 )
				ScriptMessage( O_ID, O_ID, 2,"[SC_423604_3]", 0 )	
				--�A�ʤ�
		end
	end
end


--(3)����BeginCastBar�ᤧ���G

function LuaWS_BeginCastBar_423604_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );	
						DelBodyItem(O_ID,208284,3)
						SetFlag(O_ID,544389,1)
						Beginplot(T_ID,"LuaWS_423604_1",0)
						AddBuff(T_ID,504352,1,10)
						--��S��
					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	


function LuaWS_423604_1()
	DisableQuest(OwnerID(), true )
		Sleep(30)
		Local Cri=LuaFunc_CreateObjByObj( 116913 , OwnerID() )
		Adjustfacedir(Cri,TargetID(),0)
		PlayMotion(Cri,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Say(Cri,"[SC_423604_2]")
		--���§A�A�i�D�e�k��A�o���g���ڰ����@���A�ڥû��O�b�ߤ��C
		Sleep(20)
		AddBuff(OwnerID(),507554,1,10)
		Sleep(30)
		Delobj(Cri)
		ScriptMessage( TargetID(), TargetID(), 0,"[SC_423604_1]", 0 )
		--�o�ӥi�����H�w�g��o�w���C
	
	DisableQuest(OwnerID(), false )
end

	


--===========================================================================================================================
--423605	���ȵ�����p�@�� 
--===========================================================================================================================

function LuaWS_423605_END()
	DisableQuest(OwnerID(), true )
		MoveToFlagEnabled( OwnerID(), false )
		sleep(10)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		sleep( 30 )
		Say(OwnerID(),"[SC_423605_0]")
		--���B�ӯ��F�A�o���i��O�u���C
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep( 30 )
		Adjustfacedir(OwnerID(),TargetID(),0)
		Say(OwnerID(),"[SC_423605_1]")
		MoveToFlagEnabled( OwnerID(), true )
	DisableQuest(OwnerID(), false )
end



--===========================================================================================================================
--423607	��ܫᵹ�v�Φ�
--===========================================================================================================================

function LuaWS_423607_116529_0()
	SetSpeakDetail(OwnerID(),"[SC_423607_1]")
	--�A���@�N���U�ڭ̡H�Ӧn�F�A�еy���@�U�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423542_13]","LuaWS_423607_116529_1",0)
	--�n��
end

function LuaWS_423607_116529_1()
	Beginplot(TargetID(),"LuaWS_423607_116529_2",0)
	CloseSpeak( OwnerID() )
end

function LuaWS_423607_116529_2()
	DisableQuest(OwnerID(), true )
		MoveToFlagEnabled( OwnerID(), false )
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
		sleep( 20 )
		Adjustfacedir(OwnerID(),TargetID(),0)
		GiveBodyItem( TargetID() , 208285 , 1 )
		Say(OwnerID(),"[SC_423607_2]")
		--�o�O�A�n�����~�C
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep( 50 )
		MoveToFlagEnabled( OwnerID(), true )
	DisableQuest(OwnerID(), false )
end


--===========================================================================================================================
--423609	
--===========================================================================================================================

function LuaWS_208418_0()-----���b���~208418�ϥΤU��<�ˬdlua>���U�C103498
	local OrgID = 0
	if 	CheckAcceptQuest( OwnerID() , 423609 ) == false or CountBodyItem( OwnerID() ,208419) >= 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if 	CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if   OrgID ~= 104721 then								-------�ˬd�O�_�O�ؼЩǪ�
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_0]", 0 ); 
		-----�o��[208418]���G�u���[104721]�ϥΡC�C
		return false
	end

	if 	GetDistance(TargetID(), OwnerID() ) > 120  then 	-------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_1]", 0 ); 
		-----�Z���ӹL�����A�L�k�ϥ�[208418]�C
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_7]", 0 ); ----�ؼоĤO�ä㤤�A�A�L�k���Q����A���ؼСI
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 or  CheckBuff( TargetID() , 504004 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422565_2]" , 0 ) --�ؼФw�g���F�C
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422565_2]" , 0 )
		return false
	end
	return true
end

function LuaWS_208418_1()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	if 	GiveBodyItem( OwnerID() , 208419 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	end
	Hide(TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423609_2]", 0 ); 
	-------�A���[104721]�F�I
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())

end







--���ȧ�����
function LuaWS_423609()
	PlayMotionEX( OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP	 )
	Sleep(50)
	PlayMoteion (OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END	)
	Setflag(TargetID(),544399,1)
	--���X�СA�P�_�ݱo������116535
end

--===========================================================================================================================
--423510
--===========================================================================================================================

function LuaWS_423610_116537_0()
	LoadQuestOption( OwnerID() )

	if 	(CheckAcceptQuest(OwnerID(),423610)==true )and( CheckCompleteQuest( OwnerID(),423610)==false)	and
		CheckFlag(OwnerID(),544573)==false then

		if	CountBodyItem(OwnerID(),208286) >0 and CountBodyItem(OwnerID(),208287)<1		then

				if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)		then
					return true
				else
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SAY_NPC_BUSY]",0)			
					--�ؼХ��b���L��
					return false
				end
		else

				if	CountBodyItem(OwnerID(),208286) <1					then
					ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_0]",0)
					--�A�S������G��	
				end
				return false
		end
	end
end
	
function LuaWS_423610_116537_1()

	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 1 )
	
	GiveBodyItem( OwnerID() , 208287 , 1 )
	DelBodyItem(OwnerID(),208286,1)
	SetFlag(OwnerID(),544573,1)
	WriteRoleValue( TargetID() , EM_RoleValue_Register+1 , 0 )
	
end



--(1)����Ĳ�I�@��
function LuaWS_BeginCastBar_116537()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116537_1",30 )
end

--(2)����BeginCastBar�P�_
function LuaWS_BeginCastBar_116537_1() --
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckAcceptQuest(OwnerID(),423610)==true		and
		CheckCompleteQuest(OwnerID(),423610)==false		and
		CheckFlag(O_ID,544573)==false				then
		if	CountBodyItem(OwnerID(),208286) <1		then
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_0]",0)
			--�A�S������G��
		end
		
		if	CountBodyItem(OwnerID(),208286) >0 and CountBodyItem(OwnerID(),208287)<1	then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423610_208413]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116537_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			end
		end
	end
end

--(3)����BeginCastBar�ᤧ���G

function LuaWS_BeginCastBar_116537_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );
						SetFlag(O_ID,544573,1)
						GiveBodyItem( OwnerID() , 208287 , 1 )
						DelBodyItem(OwnerID(),208286,1)
					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
	

----OAo----

--(1)����Ĳ�I�@��
function LuaWS_BeginCastBar_116538()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116538_1",30 )
end

--(2)����BeginCastBar�P�_
function LuaWS_BeginCastBar_116538_1() --
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckAcceptQuest(OwnerID(),423610)==true		and
		CheckCompleteQuest(OwnerID(),423610)==false		and
		CheckFlag(O_ID,544574)==false				then
		if	CountBodyItem(OwnerID(),208413) <1		then
			ScriptMessage(OwnerID(),OwnerID(), 1, "[SC_423610_13]",0)
			--�A�S���[�u�G��
		end
		
		if	CountBodyItem(OwnerID(),208413) >0 and CountBodyItem(OwnerID(),208414)<1	then
			if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423610_208413]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116538_2" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
			end
		end
	end
end

--(3)����BeginCastBar�ᤧ���G

function LuaWS_BeginCastBar_116538_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );
						SetFlag(O_ID,544574,1)
						GiveBodyItem( OwnerID() , 208414 , 1 )
						DelBodyItem(OwnerID(),208413,1)
					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
		
----OAo----
		
function LuaWS_116423_0()
--�d�����D�h��w

	LoadQuestOption(OwnerID())		
		if 	(CheckAcceptQuest(OwnerID(),423610)== true )		and 
			(CheckCompleteQuest(OwnerID(),423610)==false)		then
					if  		Checkflag(OwnerID(),544573) ==false		and
							CountBodyItem(OwnerID(),208286)<1		and 
							CountBodyItem(OwnerID(),208287)<1		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_1]","LuaWS_116423_1",0)
								--�i�H�A���ڤ@�~[208286]�ܡH
					end
				
					if  		Checkflag(OwnerID(),544574) ==false		and
							CountBodyItem(OwnerID(),208413)<1		and 
							CountBodyItem(OwnerID(),208414)<1		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_2]","LuaWS_116423_1",0)
								--�i�H�A���ڤ@�~[208413]�ܡH
					end
					
					if 		Checkflag(OwnerID(),544573) ==true		and
							Checkflag(OwnerID(),544574) ==false		and
							CountBodyItem(OwnerID(),208413)>0		then
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_3]","LuaWS_116423_3",0)
								--�ڧѰO�{�b�n������F�H
					end
					
					if		Checkflag(OwnerID(),544573) ==true		and
							Checkflag(OwnerID(),544574) ==true		and
							CountBodyItem(OwnerID(),208415)<1		then
							if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0)	then
								
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_5]","LuaWS_116423_4",0)
								--�ڤw�g�ӧA�h�J������~�G�ġA���U�өO�H
							else
								AddSpeakOption(OwnerID(),TargetID(),"[SC_423610_10]","LuaWS_116423_4",0)
								--���W�S�g�ɤF�A�{�b����H
							end

					end
		end
end
		
		
function LuaWS_116423_1()
	Beginplot( TargetID() , "LuaWS_116423_2" , 0 )
	CloseSpeak(OwnerID())
end

function LuaWS_116423_2()
	Adjustfacedir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_423610_4]")	
	--�����F�H�٦n�ڥ��������O�d�F�ǡA�Z�Ƴ��o�]�Q�P��A�ڮe���ܧڡH���h�A�O�A�d��F�C
		if 		Checkflag(TargetID(),544573) ==false			and
				CountBodyItem(TargetID(),208286)<1			and 
				CountBodyItem(TargetID(),208287)<1			then
						GiveBodyItem( TargetID() , 208286 , 1 )
		end

		if  	Checkflag(OwnerID(),544574) ==false			and
				CountBodyItem(OwnerID(),208413)<1		and 
				CountBodyItem(OwnerID(),208414)<1		then
						GiveBodyItem( TargetID() , 208413 , 1 )
		end
end
		
function LuaWS_116423_3()		
	SetSpeakDetail(OwnerID(),"[SC_423610_6]")	
	--��[208413]���A���e�����p���W�ܰڡC
end
		
function LuaWS_116423_4()	
	if	(ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0)		then
		if		(ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0)		then
				SetSpeakDetail(OwnerID(),"[SC_423610_7]")
				--���F�p���W�A�{�b�y�I��e�餺����G�A���O�A���s�B�ͩһݭn���ľ��C

					AddSpeakOption(OwnerID(),TargetID(),"[SC_421544_5]","LuaWS_116423_5",0)
					--......�ک��դF
		else
				SetSpeakDetail(OwnerID(),"[SC_423610_11]")
				--�S���Y�A�o�u�O�u�Ȫ��A�ګO�Ҩe�ܧִN�A����_���R�A�A�N�i�H��ߥh����աI
					AddSpeakOption(OwnerID(),TargetID(),"[SC_421544_5]","LuaWS_116423_5",0)
					--......�ک��դF
		end
	else
			SetSpeakDetail(OwnerID(),"[SC_423610_8]", 0 );		
			--�O��A���ڦA�[��p���W�@�|��A���@�U�A�ݧڡC
	end
end		

function LuaWS_116423_5()	
	Beginplot(TargetID(),"LuaWS_116423_6",0)
	CloseSpeak(OwnerID())
end

function LuaWS_116423_6()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 1 )
	DisableQuest(OwnerID(), true )
	local Fox=Lua_DW_CreateObj("flag" ,104862,780741,1)
	AddBuff(TargetID(),507516,1,300)
	--�Wbuff�A�Ϩg�ɪ����ݤ��� 
	DW_MoveToFlag(Fox,780741 , 2 ,0 ,1)
	--BeginPlot(Fox,"LuaS_Discowood_CheckPeace",0) --8.5�����i�J�԰����A�N�|����
	
	local player="here"
	local Monster="NotDead"
	local quest="in"
	local wait="time"
	local G=0
	local AttackTarget = ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID )
	
		while 1 do
				G=G+1
				
				if (G==20	and  ReadRoleValue(TargetID() , EM_RoleValue_AttackTargetID ) == 0 )	or
					G==80	then
					wait="timeover"
					break
				end
				
				if 	CheckAcceptQuest(TargetID(),423610)== false				then
					quest="out"
					break
				end
				
				if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 		or
					CheckID(TargetID()) == false							or
					GetDistance( TargetID(), OwnerID()) >300 				then
					player="Nothere"
					break	
				end
				
				if 	(ReadRoleValue(Fox, EM_RoleValue_IsDead)==1 or  CheckID(Fox)== false)		then
					Monster="IsDead"
					break
				end
			Sleep(10)
		end
	
				if quest=="out" 	then		
						--Sleep(30)
						CancelBuff(TargetID(),507516)
						Delobj(Fox)
				end
					
				if player=="Nothere" or wait=="timeover"	then	
			
						
						ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
						ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
						ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423610_12]" , 0 )
						Sleep(30)
						ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
						ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
						ScriptMessage(  TargetID()   , TargetID()    , 0 , "[SC_423610_12]" , 0 )
						Sleep(30)
						CancelBuff(TargetID(),507516)
						Delobj(Fox)	
						Yell(OwnerID(),"[SC_423610_14]",1)
						--�A���ʧ@�ӺC�F
				end
				
				if  wait=="timeover"	then
						DisableQuest(OwnerID(), false )
						WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
						return false
				end
					
					
		if  	(CheckAcceptQuest(TargetID(),423610)== true ) 			and
				(CheckCompleteQuest(TargetID(),423610)==  false)  		and
				Checkflag(TargetID(),544573)== true						and
				Checkflag(TargetID(),544574)== true						and
				CountBodyItem(TargetID(),208415)<1						then
									if	Monster=="IsDead" or CheckID(Fox)== false			then
										Yell(OwnerID(),"[SC_423610_9]",1)
										--�ֱ������W����ڡI
										Sleep(30)		
									end
		end

	
						local Blood="NotGet"
						local h=0
						local PET="NotDead"
						local fin="time"
							
								while 1 do
								h=h+1
				
											if 	h==20	then
												fin="timeover"
												break
											end
				
											if 	CheckAcceptQuest(TargetID(),423610)== false				then
												quest="out"
												break
											end
											
											if	ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 		or
												CheckID(TargetID()) == false	or
												GetDistance( TargetID(), OwnerID()) >150 				then
												player="Nothere"
												break	
											end
											
											if 	(CountBodyItem(TargetID(),208415))>0					then
												Blood="Got"
												break
											end
											
											if 	CheckID(Fox)== false	then	
												PET="IsDead"	
												break
											end
											Sleep(10)
								end
							
							if 	quest=="out" 	or 	Blood=="Got"		then		
									--CancelBuff(TargetID(),507516)
									Delobj(FOX)
							end
								
							if player=="Nothere"  or fin=="timeover" then	
									ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
									ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
									Sleep(30)
									ScriptMessage(TargetID(), TargetID() , 1 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
									ScriptMessage(TargetID(), TargetID() , 0 , "[SC_423610_12]" , 0 )		--���ȥ��ѡA�Щ�󭫱�
									Sleep(30)
									CancelBuff(TargetID(),507516)
									Delobj(FOX)
									Yell(OwnerID(),"[SC_423610_14]",1)
							--�A���ʧ@�ӺC�F
							end
							
							if 	fin=="timeover" or PET=="IsDead"	then
								DisableQuest(OwnerID(), false )
								WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
							end
							
							if 	Blood=="NotGet" and 	(fin=="timeover" or PET=="IsDead"	or ReadRoleValue(FOX, EM_RoleValue_IsDead)==1)	then
								CancelBuff(TargetID(),507516)
								Delobj(FOX)
								Yell(OwnerID(),"[SC_423610_14]",1)
							end
							
							
							
say(FOX,"open")
	DisableQuest(OwnerID(), false )
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0 )
end	




-----***------

function LuaWS_CrazyFox()
	while true do
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_BUFF_SP01)
		sleep(20)	
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_ATTACK_2H)
		Sleep(20)
		PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_DODGE )
		Sleep(20)
	end
end

-----***------

	
function LuaWS_423610_end()
	DisableQuest(OwnerID(), true )
	CancelBuff(TargetID(),507516)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	AddBuff(TargetID(),507550,1,400)	

		local NPC =SearchRangeNPC ( OwnerID() , 400 )				
			--�j�M���a���� 200�d�򤺪�npc�A��Jnpc���}�C��
			local S1	
			for i=0,table.getn(NPC),1 do
				if ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 116422 then
					S1= NPC[i]	--��i
				end
			end
		Local Star  = LuaFunc_CreateObjByObj( 116915 , S1 )
		Hide(Star)
		DisableQuest(Star, true )
		Show(Star,0)

	PlayMotion(Star,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	Sleep(30)
	WriteRoleValue(Star, EM_RoleValue_IsWalk, 1)

	DW_MoveToFlag(Star,780739,10,0,1)
	Hide(Star)
	Sleep(20)
	Delobj(Star)	
	CancelBuff( TargetID()  , 507550  ) 
	DisableQuest(OwnerID(), false )
end
		

function LuaWS_423610_ACCEPT()
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+1 , 0)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 , 0 )
	CancelBuff(TargetID(),507516)
	if 	CountBodyItem(TargetID(),208415)>0	or
		CountBodyItem(TargetID(),208414)>0	or
		CountBodyItem(TargetID(),208287)>0	then
			if	CountBodyItem(TargetID(),208286)>0	and
				CountBodyItem(TargetID(),208413)>0	then
				DelBodyItem(TargetID(),208415,1)
				DelBodyItem(TargetID(),208414,1)
				DelBodyItem(TargetID(),208287,1)
			end
	end
end

				
	
		
		
		
		
		
		
		
		
		