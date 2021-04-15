
--===========================================================================================================================
--����423636
--===========================================================================================================================
function LuaWS_423636_116916_R()
		Setplot(OwnerID(),"range","LuaWS_423636_116916_R_1",50)	
end

function LuaWS_423636_116916_R_1()
	Beginplot(TargetID(),"LuaWS_423636_116916_R_2",0)
end

function LuaWS_423636_116916_R_2()
	if 	(CheckAcceptQuest(TargetID(),423637)== false ) 		and
	 	(CheckCompleteQuest(TargetID(),423636)==  true)  	and
		CheckFlag(TargetID(),544577)==false					and
		CountBodyItem(TargetID(),208424)<1					then
			Tell(TargetID() ,OwnerID() ,"[SC_423636_3]")	
			--�հա�հա㦳�Hť��ڪ��q�n�ܡH���
		end
end

--**--

function LuaWS_423636_116916()
	LoadQuestOption(OwnerID())
		if 	CheckCompleteQuest(OwnerID(),423636)==true	and
			CheckAcceptQuest(OwnerID(),423637)==false	and
			CountBodyItem(OwnerID(),208424)<1			then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423636_1]","LuaWS_423636_116916_1",0)
		end
end

function LuaWS_423636_116916_1()
	SetSpeakDetail(OwnerID(),"[SC_423636_2]")
	GiveBodyItem( OwnerID() , 208424 , 1 )
end

----%%%----

function LuaWS_423636_end()
	GiveBodyItem( TargetID() , 208424 , 1 )
end




--===========================================================================================================================
--����423637
--===========================================================================================================================

function LuaWS_423637_116926()
		Setplot(OwnerID(),"range","LuaWS_423637_116926_1",175)	
end

function LuaWS_423637_116926_1()
	Beginplot(TargetID(),"LuaWS_423637_116926_2",0)
end

function LuaWS_423637_116926_2()
	if 	(CheckAcceptQuest(TargetID(),423637)== false ) 		and
		(CheckCompleteQuest(TargetID(),423637)==false)		and
	 	(CheckCompleteQuest(TargetID(),423636)==  true)  	and
		CountBodyItem(TargetID(),208424)>0					then
			Tell(TargetID() ,OwnerID() ,"[SC_423637_1]")	
			--�����ܡG�s�D�H�A�i�H�ЧA����Ȯɩ�쨺�䪺���Y�W�ܡH���Y����}���p��A���D�첢�����᭻�C
		end
end

----%%%----

--(1)����Ĳ�I�@��
function LuaWS_BeginCastBar_116927()
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116927_1",30 )
end


--(2)����BeginCastBar�P�_
function LuaWS_BeginCastBar_116927_1() --
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckCompleteQuest(OwnerID(),423636)==true 	and
		CheckAcceptQuest(OwnerID(),423637)==false	and
		CountBodyItem(OwnerID(),208424)>0			and
		CheckFlag(O_ID,544577)==false				then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423637_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116927_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��

		end
	end
end


--(3)����BeginCastBar�ᤧ���G

function LuaWS_BeginCastBar_116927_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );	
						SetFlag(O_ID,544577,1)
						DelBodyItem(OwnerID(),208424,1)

					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
	
	
--===========================================================================================================================
--����423638
--===========================================================================================================================

function LuaWS_423638_116928()
		Setplot(OwnerID(),"range","LuaWS_423638_116928_1",175)	
end

function LuaWS_423638_116928_1()
	Beginplot(TargetID(),"LuaWS_423638_116928_2",0)
end

function LuaWS_423638_116928_2()
	if 	(CheckAcceptQuest(TargetID(),423638)== false ) 		and
	 	(CheckCompleteQuest(TargetID(),423637)==  true)  	and
		CountBodyItem(TargetID(),208424)>0					then
			Tell(TargetID() ,OwnerID() ,"[SC_423637_2]")	
			--�����ܡG�s�D�H�A�i�H�ЧA����Ȯɩ�쨺�䪺�g�C�W�ܡH�o�̦��D�D�����A���Q�z�z��C
	end
end


----%%%----	
	

--(1)����Ĳ�I�@��
function LuaWS_BeginCastBar_116981()
	SetPlot( OwnerID(),"touch","LuaWS_BeginCastBar_116981_1",30 )
end


--(2)����BeginCastBar�P�_
function LuaWS_BeginCastBar_116981_1() --
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckCompleteQuest(OwnerID(),423637)==true 	and
		CheckAcceptQuest(OwnerID(),423638)==false	and
		CountBodyItem(OwnerID(),208424)>0			and
		CheckFlag(O_ID,544578)==false				then
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423637_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaWS_BeginCastBar_116981_2" ) ~= 1 then
			ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��

		end
	end
end


--(3)����BeginCastBar�ᤧ���G

function LuaWS_BeginCastBar_116981_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC

			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );	
						SetFlag(O_ID,544578,1)
						DelBodyItem(OwnerID(),208424,1)

					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	
	
	
	
----------------------------------------------------------------------------------------------

function LuaS_208424_0()	

	Beginplot(TargetID(),"LuaS_208424_1",0)
end

function LuaS_208424_1()	

	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423636_3]", 0 )
	ScriptMessage( TargetID(), TargetID(), 2, "[SC_423636_3]", 0 )
	AddBuff(OwnerID(),503012,1,10)
end

		