
function LuaS_422872_0()
	SetDefIdleMotion( OwnerID(), ruFUSION_MIME_SLEEP_LOOP)
end

function LuaS_422872_1()
		LoadQuestOption(OwnerID())
	if 	CheckAcceptQuest( OwnerID() , 422872 ) == true	and	CheckFlag(OwnerID(),543501) == false	and	CheckFlag(OwnerID(),543526) == true	then
		SetFlag( OwnerID() , 543501 , 1 )	
	end	
end

function LuaS_422872_2()	--����Ǻ�
		LoadQuestOption(OwnerID())
	if 	CheckCompleteQuest( OwnerID() , 422896) == true		then
		SetFlag( OwnerID() , 543526 , 1 )	
	end	
end

function LuaS_114099()	--��Ǻ��R�����I�k
	--LuaP_DW_Dead()
	LuaP_Sitting()
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 492667 )
	end
end


----------------------------------------------------------------------------------------

function LuaS_422873_0()
	LoadQuestOption(OwnerID())	
	if	(CheckAcceptQuest(OwnerID(),422873)==true)and(CheckCompleteQuest(OwnerID(),422873)==false)	 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422873_0]","LuaS_422873_1",0)	--�ڭ̻ݭn�A�������I
	end
end

function LuaS_422873_1()
	SetSpeakDetail(OwnerID(),"[SC_422873_1]")				--(���h�����潴�W���ǹСA�ݰ_�ӹ��O��q�~�Y�^�ӡC)	
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422873_2]","LuaS_422873_2",0)	--�ڧ��Ǻ��q�ĤH��a�a�^�ӡA���L�������ˡA�ثe�b���Q���y���̡C
end

function LuaS_422873_2()
	SetSpeakDetail(OwnerID(),"[SC_422873_3]")				--��Ǻ�...�O���Q���y�f���@����۪��B�͡C
	SetFlag( OwnerID() , 543503  , 1 )
end

function LuaS_422873_99() --�������ȫ�
	Addbuff( TargetID() , 504004 , 0 , -1 )
 	local Anter   = Lua_DW_CreateObj("flag" ,114277,780455,2 ) 	--�إX�w�S�Jù�]�t���Ρ^
	DisableQuest( Anter , true )					--�������
	MoveToFlagEnabled(Anter , false )				--��������
	local Harry   = Lua_DW_CreateObj("flag" ,114021,780455,1 ) 	--�إX���Q���y�]�t���Ρ^
	DisableQuest( Anter , true )					--�������
	MoveToFlagEnabled(Anter , false )				--��������
	local TTRR= Lua_DW_CreateObj("flag" ,114023,780455,3 ) 
	Lua_ObjDontTouch( TTRR )
	say(Harry   ,"[SC_422873_4]")					--��Ǻ��K��Ǻ��I
--	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_CRY)
	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_ANGRY)
	sleep(20)
	say(Anter,"[SC_422873_12]")					--�Ĥl�A�A�ݭn�N�R�C
	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
--	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)
	FaceObj( Harry  , Anter  )
	say(Harry   ,"[SC_422873_5]")					--���h�I�ϥL�I�ϥL�n�ܡH���U�A�K
---	PlayMotion( Harry , ruFUSION_ACTORSTATE_EMOTE_BEG)
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	sleep(20)
	FaceObj( Anter  ,Harry   )
	say(Anter,"[SC_422873_6]")						--���ΤӹL��ߡA�L�٦��@���𮧡C
	PlayMotion( Anter , ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
--	PlayMotion( Anter  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	say(Harry   ,"[SC_422873_7]")					--�ҥH�L�ଡ�U�ӹ藍��H
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	FaceObj( Harry  , TTRR  )
	sleep(10)
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_CROUCH_BEGIN )
	say(Harry   ,"[SC_422873_8]")					--��Ǻ��A�A���ϤF�Iť��F�ܡHť��F�ܡH
	sleep(20)
--	PlayMotion( Harry ,ruFUSION_ACTORSTATE_CROUCH_END )	
	FaceObj( Harry  , Anter  )
	say(Harry   ,"[SC_422873_9]")					--�ڡK�٦��K���ɭԧڳ��ݨ�F�K���n���۵M���۳Q��Ǻ������A�藍�_�K
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	say(Harry   ,"[SC_422873_10]")					--���O�A��Ǻ������۵M���ۤw�g�Q�m���]�ڧƺ��������A�A���D�L�O�ֶܡH
	PlayMotion( Harry ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	say(Anter,"[SC_422873_11]")					--�]�ڡK
	sleep(20)
	DelObj(Anter)
	DelObj(Harry )
	DelObj(TTRR)
	CancelBuff_NoEvent( TargetID() , 504004 )
End
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422876 �k�٦۵M����

function LuaI_422876() --�����ȫ�WBUFF					--���b�������ȫ�
	
	AddBuff(TargetID() , 505441 , 0 , 600 )  --�����ˬdbuff
end

function LuaI_422876_1() --�����ȮɧR������			
	
	if (CheckAcceptQuest(OwnerID(),422876)==false)and(CheckCompleteQuest(OwnerID(),422876)==false) then
	
		SetFlag( OwnerID() , 543505, 0 )
		CancelBuff( OwnerID() , 505441 )
	end
end

function LuaI_422876_2() --BUFF�����ɡA���ȥ��ѳq��
	
	if CheckCompleteQuest(OwnerID(),422876)==false then
		
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_421696]" , C_SYSTEM )	
		SetFlag( OwnerID() , 543505, 0 )			--���ȱ���
		if	CountBodyItem( OwnerID(), 206389 )	then
			DelBodyItem( OwnerID(), 206389,1 )	
		end
	end
end

function LuaI_422876_3() --���ȧ�����A�R�����W���p��BUFF			--���b�٥���
	
	CancelBuff( TargetID() , 505441 )
end

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422897 ���̦A�{

--function LuaS_422897_0() 	--���b�a�ϤW���Ⱥ����C�w
--	LoadQuestOption(OwnerID())
--	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false)	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_0]","LuaS_422897_1",0)				--�ڧ�۵M���۱a�^�ӤF�A���h�M�̮R�������L�K
--	end
--end

function LuaS_422897_1() 
	SetSpeakDetail(OwnerID(),"[SC_422897_1]")							--��K�ڷQ���T�{�@��ơC
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_2]","LuaS_422897_2",0)				--���h�T��o�򻡹L�A���L�s���O�֡H������|�פ�A�̪��ϩR�H

end

function LuaS_422897_2() 
	SetSpeakDetail(OwnerID(),"[SC_422897_3]")							--���h�������K�L�O�L�Q�����@����̰ڡK
	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false) and
		ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) == 0 			  	       	 then	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_4]","LuaS_422897_3",0)				--�L�n���S���S�O���ΡK
	end
	if	(CheckAcceptQuest(OwnerID(),422897 )== true )and( CheckCompleteQuest( OwnerID(),422897)== false) and
		ReadRoleValue( TargetID() , EM_RoleValue_Register+8 ) ~= 0 				       	 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422897_4]","LuaS_422897_99",0)				--�L�n���S���S�O���ΡK
	end
end

function LuaS_422897_3()
	writerolevalue( TargetID() , EM_RoleValue_Register+8 , 1 )						--TargetID�O�Ⱥ�
	CloseSpeak(OwnerID())
	Beginplot(TargetID(),"LuaS_422897_4",0)
end

function LuaS_422897_99()
	CloseSpeak(OwnerID())
	ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422897_98]" , 0 )	 				--�Ⱥ����Ѥ�̴��۾|�����J���򪫡A�R�q���������O�b�q�h...
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422897_98]" , 0 )
end


function LuaS_422897_4()
	say(OwnerID() ,"[SC_422897_23]")					--�S������...
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(10)
	say(OwnerID() ,"[SC_422897_24]")					--�����A�o�Ѯ�...���D�O���@��H�ڭ̥��h�T�{�C
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	SetPosByFlag( TargetID(), 780456 , 4)					--�ǰe���a
	Addbuff( TargetID() , 504004 , 0 , -1 )					--owner�O�Ⱥ�
	sleep(10)
	local YA   = Lua_DW_CreateObj("flag" ,114279,780456,1 )		 	--�إX�Ⱥ�114279�]�t���Ρ^		--�쥻��client����
	DisableQuest( YA , true )						--�������
	MoveToFlagEnabled(YA , false )					--��������
	sleep(10)
	say(YA,"[SC_422897_25]")						--�N�O�o�̡C
	sleep(20)
	local MINA   = Lua_DW_CreateObj("flag" ,114268,780456,2 ) 	--�إX�̮R�����]�t���Ρ^	--�쥻��client����
	DisableQuest( MINA , true )					--�������
	MoveToFlagEnabled(MINA , false )				--��������			
	yell( MINA , "[SC_422897_5]",2 )				--��p�A�Ⱥ��A�ڹ�b�����νT�{��
---���J�ʧ@
	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
--	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)

	sleep(20)
	yell( MINA , "[SC_422897_6]",2 )				--�������h�u���O...�H
--���J�ʧ@
	PlayMotion( MINA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	yell( YA   , "[SC_422897_7]",2 )				--�O���C���ڭ̦u�@���T����p���K	
	PlayMotion( YA ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(20)

	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_8]" , 0 )	 --�@�}���X�ȭ����H����ƴ��y�M�Ӧܡ��
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_8]" , 0 )
	sleep(20)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_26]" , 0 )	 --���F�̳Qĭ�t���۵M���O�l�ޫe��
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_26]" , 0 )

	local People = {}
	local amount = 8
	For i=1, amount  do
		sleep(5)	
		local R = Rand( 3 ) 
		if	R ==0	then
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114284 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )	
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114284 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114284 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		elseif	R ==1	then	
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114285 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114285 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114285 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		else
			local P = Rand( 3 ) 
			if	P ==0	then
				People[i] = CreateObjByFlag( 114286 , 780521 , 9 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			elseif	P ==1	then
				People[i] = CreateObjByFlag( 114286 , 780521 , 10 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			else
				People[i] = CreateObjByFlag( 114286 , 780521 , 11 , 0 )  
				Lua_ObjDontTouch( People[i] )
				WriteRoleValue(People[i] , EM_RoleValue_IsWalk , 1 )
				AddToPartition( People[i] , 0 )
				Lua_ObjDontTouch( People[i]) 
				writerolevalue( People[i] , EM_RoleValue_PID , i )	
				BeginPlot(People[i],"LuaS_422897_PeopleGo",0)
			end	
		end
	End
	yell( MINA , "[SC_422897_27]",2 )				--�A�̤]�P����o���רK���۵M���O�F�H
	sleep(60)
	local Anter   = Lua_DW_CreateObj("flag" ,114290,780456,3 ) 	--�إX���h�]�t���Ρ^		--�쥻��client����
	DisableQuest( Anter , true )					--�������
	MoveToFlagEnabled(Anter , false )				--��������	�إX���h
	yell( Anter , "[SC_422897_9]",2 )				--�T����w���۵M���ۨ��H��ô�C
---���J�ʧ@
	PlayMotion( Anter,	ruFUSION_MIME_EMOTE_IDLE2)

	sleep(30)
	AdjustFaceDir( YA , Anter, 0 )
	yell( YA , "[SC_422871_13]",2 )				--���I
	PlayMotionEX( YA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)

---���J�ʧ@
	--PlayMotion( YA,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	if	CheckID( TargetID()) == false	then
		writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
		SetFlag(TargetID(),543526,0)
		DelObj(YA)
		DelObj(MINA)
		DelObj(Anter)
		For i=1, 8  do
			DelObj(People[i])
		end
	end

	if	(CheckAcceptQuest(TargetID(),422897)==true )	and	(CheckFlag( TargetID(), 543527 )==false)		then
		SetFlag( TargetID() , 543527  , 1 )
	end
	AdjustFaceDir( MINA , Anter, 0 )
	yell( MINA , "[SC_422897_10]",2 )				--�z�O�w�S�Jù�K���F���w�S�Jù�ܡH    --���Y�ð�

---���J�ʧ@
	PlayMotion( MINA,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(30)
	yell( Anter , "[SC_422897_11]",2 )

-----���J�ʧ@

	PlayMotion(Anter  , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)------
				--�O�C 					--���Y��ħڤ��I
	sleep(30)

	For i=1, 8  do
		AdjustFaceDir( People[i], Anter, 0 )
		local R = Rand( 3 ) 
		if	R ==0	then
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_DAZED_BEGIN )
		elseif	R ==1	then
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		else
			PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
		end	
	end
	sleep(20)	
	For i=1, 8  do
		PlayMotionEX( People[i] , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	end

	yell( MINA , "[SC_422897_12]",2 )				--�P�º��F�t����S�Q��ڷ|�b������z�A�M�Ӧ���Ƨڲ`�P��p....����t�C�����ȧJ�A�ڨ�����K�K

---���J�ʧ@
	PlayMotionEX( MINA , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)

---���J�ʧ@
	yell( Anter , "[SC_422897_13]",2 )				--�i�|���Ǥ��m�A���Φ۳d�C

--	PlayMotion( Anter ,ruFUSION_MIME_EMOTE_SPEAK )
	PlayMotion( Anter , ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_ATTACK_1H)

---���J���m
	sleep(15)
	PlayMotion( MINA, ruFUSION_ACTORSTATE_CROUCH_END)

	sleep(20)
	yell( Anter , "[SC_422897_14]",2 )				--���F�t�������٦����|�M�^�A������l�N�q�b���@�çڱڡA���ަb�Q�ް_�ɳy���T����ʦL�O�q��z

---���J�ʧ@
	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	if	CheckID( TargetID()) == false	then
		writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
		SetFlag(OwnerID(),543526,0)
		DelObj(YA)
		DelObj(MINA)
		DelObj(Anter)
		For i=1, 8  do
			DelObj(People[i])
		end
	end
	sleep(50)
	yell( YA , "[SC_422897_15]",2 )				--���A�z���N��O�K�ڭ̱q�{�b�}�l���A�u�@�T����H--���Y�X���M��~--

---���J�ʧ@
	--PlayMotion( YA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(20)
	yell( Anter , "[SC_422897_16]",2 )				--���v�N�b���i�J���A�w�g�����F�A�A�̰��o�ܦn�C
----���J�ʧ@

--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_POINT )

	sleep(20)
	yell( Anter , "[SC_422897_17]",2 )				--�{�b�A���ڭ̦^�k�B��ť�۵M�����ۡA�L�h���ϩR�ӵ����F�C
---���J�ʧ@ shield_bash
	PlayMotion(  Anter  ,ruFUSION_ACTORSTATE_SHIELD_BASH)
--	sleep(10)
--	PlayMotion(  Anter  ,ruFUSION_ACTORSTATE_SHIELD_BLOCK)	

	sleep(20)
	PlayMotion( YA, ruFUSION_ACTORSTATE_CROUCH_END)
	For i=1, 8  do
		PlayMotion( People[i] , ruFUSION_ACTORSTATE_CROUCH_END)
	end
	sleep(10)
	ScriptMessage( TargetID() , TargetID() , 2 , "[SC_422897_18]" , 0 )	 --�����F�E���a�ݵۦw�S�Jù�I
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422897_18]" , 0 )	

	For i=1, 8  do
		PlayMotion( People[i] ,ruFUSION_ACTORSTATE_EMOTE_VICTORY	)
	end

	sleep(20)
	yell( Anter , "[SC_422897_19]",2 )				--�q���ӫ�A�𶷦A���L�h��~�A�{�b�}�l�A�H�ڭ̺��F���ƻP�L�Y�g�U�ݩ�s�ɥN���g���A�l�y����ת����v�C

---���J�ʧ@  buff01
	PlayMotion( Anter , ruFUSION_ACTORSTATE_BUFF_BEGIN)
	sleep(10)
	PlayMotion(Anter ,ruFUSION_ACTORSTATE_BUFF_END )

	sleep(20)
	yell( MINA , "[SC_422897_20]",2 )				--�w�g�𶷦A���L�h��~�K

---���J�ʧ@
	PlayMotion(  MINA  ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )

	sleep(10)
	yell( YA , "[SC_422897_21]",2 )				--�O���I���H�����}�B�A�ڭ̱N�ڦV����ת����ӡC

--���J�ʧ@
--	PlayMotion(YA ,	ruFUSION_ACTORSTATE_EMOTE_APPLAUSE	 )
	PlayMotion(YA ,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )

	sleep(20)


	yell( Anter , "[SC_422897_22]",2 )				--���F�t�����N�ӥæs�A�ӧڤ]�|�P�A�̦P�b�C
---���J�ʧ@
--	PlayMotion( Anter ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	PlayMotion( Anter ,	ruFUSION_ACTORSTATE_EMOTE_POINT )


	sleep(20)
	DelObj(MINA)							--�٥��Ȫ�client��{
									--���h�b�����ᤣ�[<���q���ɶ�>����
	DelObj(YA)
	DelObj(Anter )
	For i=1, 8  do
		DelObj(People[i])
	end		
	CancelBuff_NoEvent( TargetID() , 504004 )				
	writerolevalue( OwnerID() , EM_RoleValue_Register+8 , 0 )
end

function LuaS_422897_PeopleGo()
	MoveToFlagEnabled(OwnerID(), false)
	LuaFunc_MoveToFlag(OwnerID() , 780521 , ReadRoleValue(OwnerID(),EM_RoleValue_PID),0  )
end

