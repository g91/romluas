
--================================================================================
--���T�U�ťۦ^�ӡA�j�ơB�ĦX�B�s��
---================================================================================

--(1)����Ĳ�I�@��
function LuaZ13WS_BeginCastBar_423839()--Ĳ�I�@��115623
	SetPlot( OwnerID(),"touch","LuaZ13WS_BeginCastBar_423839_1",30 )
end


--(2)����BeginCastBar�P�_
function LuaZ13WS_BeginCastBar_423839_1() 
	local O_ID = OwnerID() 		-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelTypeBuff(68,O_ID)
	--DW_CancelTypeBuff(BuffTypeNum,ObjID)
	--BuffTypeNum ��J�Q�Ѱ���buff ����
	--68 �M��
	--58 �ܨ�
	--ObjID ��J�Q�Ѱ����ؼ�  �Y���� �w�]�� OwnerID()
	--��1 �h�w�]�� TargetID()
	if	CheckAcceptQuest(O_ID,423839)==true		and
		CheckCompleteQuest(O_ID,423839)==false		and
		CheckFlag(O_ID,544736)==false			and
		CountBodyItem(O_ID,209209)<3			then
		if	CountBodyItem(O_ID,209206)<1		or
			CountBodyItem(O_ID,209207)<1		or
			CountBodyItem(O_ID,209208)<1		then
			
				if 	BeginCastBarEvent( O_ID, T_ID,"[SC_423839_OPEN]", 50, ruFUSION_ACTORSTATE_CRAFTING_BEGIN, ruFUSION_ACTORSTATE_CRAFTING_END, 0, "LuaZ13WS_BeginCastBar_423839_2" ) ~= 1 then
					ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				end
			
			end	
		end
	end



--(3)����BeginCastBar�ᤧ���G
function LuaZ13WS_BeginCastBar_423839_2(ObjID, CheckStatus)   -- <---() �� �ѼƤ@�w�n��
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	
			if( CheckStatus ~= 0 ) then
					if( CheckStatus > 0 ) then
						-- ���\
						EndCastBar( O_ID, CheckStatus );	
						GiveBodyItem(O_ID,209209,1)	
						Beginplot(T_ID,"LuaZ13WS_BeginCastBar_423839_3",0)	
					else
						-- ����
						EndCastBar( O_ID, CheckStatus )
					end
			end
end	

function LuaZ13WS_BeginCastBar_423839_3()
	DisableQuest(OwnerID(), true )					
	Hide(OwnerID())
	sleep(60)
	Show(OwnerID(),0)
	DisableQuest(OwnerID(), false )	
end

function LuaZ13WS_423839_ItemUse()	
	--���b�@�Ϊ��~���Ҫ��U>���~�ϥ�>�ϥήĪG�����GServer�ݼ@��>�ϥήĪG
	Beginplot(TargetID(),"LuaZ13WS_423839_ItemUse_1",0)
end

function LuaZ13WS_423839_ItemUse_1()
	local N=RandRange(1,6)
	if	CountBodyItem(TargetID(),209209)>0	then
		if	N==1	then
			GiveBodyItem( TargetID() ,209153 , 1 )
		end 
		if	N==2	then
			GiveBodyItem( TargetID() ,209154 , 1 )
		end 
		if	N==3	then
			GiveBodyItem( TargetID() ,209205 , 1 )
		end 
		if	N==4	then
			GiveBodyItem( TargetID() ,209206 , 1 )
		end 
		if	N==5	then
			GiveBodyItem( TargetID() ,209207 , 1 )
		end 
		if	N==6	then
			GiveBodyItem( TargetID() ,209208 , 1 )
		end 
		UseItemDestroy()	
		--�Ҫ������n�Ŀ�_�i����_�A�����O�i�R���ϥΤ������~�A�̦n��b���F�s���~����A�o�ˤ~���|���ª��α��A�s���o���J�U���~�p�C
		DelBodyItem(TargetID(),209209,1)
	end
end
--===================
function LuaZ13WS_423839_117371_0()
--�����o
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423839)==true		and
		CheckCompleteQuest(OwnerID(),423839)==false	and	 
		CountBodyItem(OwnerID(),209209)<3		and
		CheckFlag(OwnerID(),544736)==false		and
		CheckFlag(OwnerID(),544776)==false		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_0]","LuaZ13WS_423839_117371_1",0)
		--XX���ڨӦV�A���T���Ť�^�h�C
	end
	if 	CheckFlag(OwnerID(),544776)==true			then
			if	CountBodyItem(OwnerID(),209206)<1	or
				CountBodyItem(OwnerID(),209207)<1	or
				CountBodyItem(OwnerID(),209208)<1	then	
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_1]","LuaZ13WS_423839_117371_2",0)
				--�ڮ����Ť�F�A�����ڴ��@�U�C
			end 
	end 
end

function LuaZ13WS_423839_117371_1()
	SetSpeakDetail(OwnerID(),"[SC_423839_2]")
	--��A�A�N�ۤv���a�A�ڷ|�q���g�l�����w�I���ڪ����̦��b�C
	SetFlag(OwnerID(),544776,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end 

function LuaZ13WS_423839_117371_2()
	SetSpeakDetail(OwnerID(),"[SC_423839_3]")
	--���A�@�˦ۤv�ӡA���۩I�A�աC

	local n=0
		if 	CountBodyItem(OwnerID(),209153)>0	then
			DelBodyItem(OwnerID(),209153,1)
			n=n+1
		end 
		if 	CountBodyItem(OwnerID(),209154)>0	then
			DelBodyItem(OwnerID(),209154,1)
			n=n+1
		end 
		if 	CountBodyItem(OwnerID(),209205)>0	then
			DelBodyItem(OwnerID(),209205,1)
			n=n+1
		end 
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,3-n )	
end 


--================

function LuaZ13WS_423839_117339_0()
--���F
	LoadQuestOption(OwnerID())
	local n=0
	if	CheckAcceptQuest(OwnerID(),423839)==true		and
		CheckCompleteQuest(OwnerID(),423839)==false		and
		CheckFlag(OwnerID(),544736)==false		then
			
			if 	CountBodyItem(OwnerID(),209206)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			if 	CountBodyItem(OwnerID(),209207)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			if 	CountBodyItem(OwnerID(),209208)>0	then
				n=n+1
--				Say(OwnerID(),n)
			end
			
			if	n==3	then
				if 	CountBodyItem(OwnerID(),209153)>0	or
					CountBodyItem(OwnerID(),209154)>0	or
					CountBodyItem(OwnerID(),209205)>0	then
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_4]","LuaZ13WS_423839_117339_3",0)
					--�ڧ�A�n���Ť�a�^�ӤF�C
				else
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_4]","LuaZ13WS_423839_117339_1",0)
					--�ڧ�A�n���Ť�a�^�ӤF�C
				end	
			else	
				AddSpeakOption(OwnerID(),TargetID(),"[SC_423839_5]","LuaZ13WS_423839_117339_2",0)
				--�ڡA�ڨS�����^�������Ť�A�ЦA���ڤ@�U�C
			end
	end
end

function	LuaZ13WS_423839_117339_1()
	SetSpeakDetail(OwnerID(),"[SC_423839_6]")
	--���A���ڬݤ@�U�A�����Ť�藍��......
	SetFlag(OwnerID(),544736,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end

function LuaZ13WS_423839_117339_2()
	SetSpeakDetail(OwnerID(),"[SC_423839_7]")
	--�֡B�֡A�ګ�ۥΪ����C
end

function LuaZ13WS_423839_117339_3()
	SetSpeakDetail(OwnerID(),"[SC_423839_8]")
	--�u���A���T���^�ӰڡA�A��򮳤F����T���A�˸��������A��F�A�ϥ��H��]�αo�W�C
	SetFlag(OwnerID(),544736,1)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+2 ,0 )
end




--================================================================================
--�O�Ю֤߭ײ�
--================================================================================
function LuaZ13WS_423810_0()
--�ؤ@�����βy�A�N���ǪF�軡��
	DisableQuest(OwnerID(), true )--���F
	AddBuff(TargetID(),509021,1,600)--���a
	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--�j�Mnpc���� 400�d�򤺪�NPC�A��J�}�C��
	local center
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_OrgID ) == 117567	 then
			center= NPC[i]
			break	
		end
	end
	local X=ReadRoleValue(center,EM_RoleValue_X)
	local Y=ReadRoleValue(center,EM_RoleValue_Y)
	local Z=ReadRoleValue(center,EM_RoleValue_Z)
	local thing=CreateObj( 117710 , X,Y,Z,1,1 )

	ks_ActSetMode(thing)
	Say(thing,"[SC_423810_0]")
	Sleep(30)
	Say(thing,"[SC_423810_1]")
	Sleep(30)
	Say(thing,"[SC_423810_2]")
	Sleep(30)
	Say(thing,"[SC_423810_3]")
	Sleep(30)
	Say(thing,"[SC_423810_4]")
	Sleep(30)
	Say(thing,"[SC_423810_5]")
	Sleep(30)
	Setflag(TargetID(),544737,1)
	Delobj(thing)
	CancelBuff(TargetID(),509021)
	DisableQuest(OwnerID(), false )
end


--================================================================================
--�O�Ю֤ߥR�q��
--================================================================================
function	LuaZ13WS_423841_0()
	AddBuff(TargetID(),509023,1,600)--���a
	DisableQuest(OwnerID(), true )--���F

	local NPC =SearchRangeNPC ( OwnerID() , 200 )				
			--�j�Mnpc���� 400�d�򤺪�NPC�A��J�}�C��
	local center
	local power	
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_PID ) == 117567	 then
			center= NPC[i]
			break	
		end
	end
	Hide(center)
	local X=ReadRoleValue(center,EM_RoleValue_X)
	local Y=ReadRoleValue(center,EM_RoleValue_Y)
	local Z=ReadRoleValue(center,EM_RoleValue_Z)
	local D=ReadRoleValue(center,EM_RoleValue_Dir)
	local mmm=CreateObj( 117343 , X,Y,Z,D,1 )
	Hide(mmm)
	for i=0,table.getn(NPC),1 do
		if 	ReadRoleValue(NPC[i], EM_RoleValue_Orgid ) == 117702	 then
			power= NPC[i]
			break	
		end
	end
	CastSpell(power,mmm,497201)
	AddBuff(power,507556,1,60)
	AddBuff(mmm,507556,1,60)
	PlayMotion( mmm, ruFUSION_ACTORSTATE_CAST_SP01)
	Show(mmm,0)
	AddBuff(mmm,507556,1,60)
	AdjustFaceDir( OwnerID(), mmm, 0 )
	Beginplot(OwnerID(),"LuaZ13WS_423841_1",0)
	PlayMotion(mmm,ruFUSION_ACTORSTATE_CAST_SP02)
	Sleep(50)
	AddBuff(mmm,507556,1,60)
	Sleep(50)
	CancelBuff(power,507556)
	CancelBuff(TargetID(),509023)

	Delobj(mmm)
	Show(center,0)
	DisableQuest(OwnerID(), false )
end 

function LuaZ13WS_423841_1()
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_VICTORY)
end

--================================================================================
--�P�O�Ю֤߹��
--================================================================================
function LuaZ13WS_423842_117566()
LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),423842)==true		and
		CheckCompleteQuest(OwnerID(),423842)==false		and
		CheckFlag(OwnerID(),544738)==false				then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_0]","LuaZ13WS_423842_117566_1",0)
		--�A�O����H
	end
end

function LuaZ13WS_423842_117566_1()
	SetSpeakDetail(OwnerID(),"[SC_423842_1]")
	--�O�u�@�̪��O�Ю֤ߡA�b�Y������A��������ӿW�ߦs�b�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_2]","LuaZ13WS_423842_117566_2",0)
	--�u�@�̬O����H
end

function LuaZ13WS_423842_117566_2()
	SetSpeakDetail(OwnerID(),"[SC_423842_3]")
	--�u�@�Ҧ��z�p���H�Υͪ��A�M���]�ڡA���^�κR���T�ҲŤ�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_4]","LuaZ13WS_423842_117566_3",0)
	--�]�ڬO����
end

function LuaZ13WS_423842_117566_3()
	SetSpeakDetail(OwnerID(),"[SC_423842_5]")
	--�]�ڧY�O�N�T�ҲŤ�?�J�餺�A��y�ۤv�H�l�D���ݩ�v�����j�j�O�q�A�R�����ߪ��M�I���l�A��������
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423842_6]","LuaZ13WS_423842_117566_4",0)
	--���ٯ��֤���O����H
end

function LuaZ13WS_423842_117566_4()
	SetSpeakDetail(OwnerID(),"[SC_423842_7]")
	--���ٯ��֤���A�֦��̱N�����^���A�μZ�����]�ڡC
	Setflag(OwnerID(),544738,1)

end