
--============================================================================================================
--������a
--============================================================================================================

function LuaS_421032_114432()
--���bnpc114432�ä��U�AOWNER �ONPC
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP  )
	
	while 1 do
		Say(OwnerID(),"[SC_421032_0]")	--���o......�A�N�o�˥�U�ڤF�H
		Sleep(100)
		Say(OwnerID(),"[SC_421032_1]")	--���o......�A��򴱦b�B§���e��U�ڡH
		Sleep(100)
		Say(OwnerID(),"[SC_421032_2]")	--�i�D�A�A�ڷ|�n�n�����ۡA�񦳧A�b�ڨ��䬡����n
		Sleep(100)

	Sleep(3000)
	end
end

--------------------------------

function LuaS_421032_114431()
--���bnpc���ĤH�U
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_MINING_LOOP )			

end



--------------------------------


function LuaS_421032_114418() --���b����NPC���Ī���v114418����ܼ@��
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),421031)==true		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421031_13]","LuaS_421032_114418_1",0)		--�u�o�O���ƭq��A�бN�f�~�浹�ڡC�v
	end
end

function LuaS_421032_114418_1()
	SetSpeakDetail(OwnerID(),"[SC_421031_14]")	--
end


--============================================================================================================
--421031 �h�a�̪����ޥ���
--============================================================================================================
--Rand( Value )�b�@�w�d�򤺨��ü�
--204042�h�a�̪���


function LuaS_421031_0()	--���b����h�a�̪��ު��ϥΪ��~script���U�Aowner�O���a

--	Say(OwnerID(),"0..0")
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_EAT)
	Sleep(30)
	Beginplot(TargetID(),"LuaS_421031_1",0)
	UseItemDestroy()
end

function LuaS_421031_1()	--owner�O??

	local R=RandRange(1,82)

 	for i=1,84,1 do
		if R <10	then		--�Ӧn�Y�F�I�A�t�I�s�ۤv�����Y���]�U�h�F�C
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_1]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_1]", 0 )
			AddBuff(OwnerID(),506118,1,60)
			break	
		end
		
		if R==10 Or ( R>10 and R <20)	then	--�A�Y�@�f�A�S���ۤ@�f�A�C�@�f�����A�Q�n�Y��h�C
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_2]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_2]", 0 )			
			break
		end
		
		if R==20 Or (R>20 and R <30)	then	--�A�Ӳӫ~�|�A�@�����׭��b�A�f�Ĵ��o�}�ӡA�o�O���H�W�}���n�����C
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_3]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_3]", 0 )
			break
		end
		
		if R==30 Or (R>30 and R <40)	then	--�n�Y���F�I�A�ֳt���N�Q�����N�ަ׶�i�A���G�U�C
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_4]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_4]", 0 )			
			break
		end
		
		if R==40 Or (R>40 and R <50)	then	--�@�f��N���\�Y���A�A�N�S���ɪ��ݵ۪ŽL���F�@���T�G�����СC
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_5]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_5]", 0 )			
			break
		end
		
		if R==50 Or (R>50 and R <60)	then	--�o�O����H�A�����۫H�N�ަ׷|�o������C
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_6]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_6]", 0 )			
			break
		end
		
		if R==60 Or (R>60 and R <70)	then	--�z�I�֯ܦ׹�A�ץľ�y�A²��������S���Ѳz�I
			AddBuff(OwnerID(),506118,1,60)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_7]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_7]", 0 )
			break
		end
		
		if R==70 Or (R>70 and R <80)	then	--�Ӧ��I�A�Q��X�l���n��S�ˤF�A�o�٬O�Ԥ���j�֦��[�C
			AddBuff(OwnerID(),506117,1,100)
			ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_8]", 0 )
			ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_8]", 0 )
			
			break
		end
		
		if R==80 Or (R>80 and R <85)	then	--�A�D�ۭ���A�r�U�@�f�A�ߨ�Q����H����������A�ϩ����J�ڹҤ@��~~~
			AddBuff(OwnerID(),506116,1,300)
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_9]", 0 )
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_9]", 0 )

			AddBuff( OwnerID()  , 503977 , 1 , 300 ) 	--�Ϫ��a����

			Sleep(10)
			
			local Cook = Lua_CreateObjByDir( OwnerID()  , 114428, 20 , 0 )
			Hide(Cook)
			Beginplot(Cook,"LuaS_421031_2",0)
			Sleep(140)

			CancelBuff( OwnerID()  , 503977  )
		ScriptMessage( TargetID(), TargetID(), 1, "[SC_421031_11]", 0 )	--��M�A�A�����e�@�{�A�ñq�۶H���^�L���ӡC
		ScriptMessage( TargetID(), TargetID(), 0, "[SC_421031_11]", 0 )
	
		Delobj(Cook)
		break
		end
	end
end



function LuaS_421031_2()
	Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
	Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
	Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
	
	local DANCER1 = CreateObj(114427,  X-5, Y, Z+30, 0 ,1)
	local DANCER2 = CreateObj(114427,  X+30, Y, Z+5, 0 ,1)
	local DANCER3 = CreateObj(114427,  X+5, Y, Z-30, 0 ,1)
	local DANCER4 = CreateObj(114427,  X-30, Y, Z-5, 0 ,1)
	
	AdjustFaceDir( DANCER1 , TargetID() ,0 )
	AdjustFaceDir( DANCER2 , TargetID() ,0 )
	AdjustFaceDir( DANCER3 , TargetID() ,0 )
	AdjustFaceDir( DANCER4 , TargetID() ,0 )
	
	AddToPartition(DANCER1,0)
	AddToPartition(DANCER2,0)
	AddToPartition(DANCER3,0)
	AddToPartition(DANCER4,0)
	Sleep(10)
	Beginplot( DANCER1,"LuaS_421031_3",0)
	Beginplot( DANCER2,"LuaS_421031_4",0)
	Beginplot( DANCER3,"LuaS_421031_3",0)
	Beginplot( DANCER4,"LuaS_421031_4",0)
	Sleep(20)
	
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_ATTACK_1H)
	Sleep(20)
	Show(OwnerID(),0)
	Yell(OwnerID(),"[SC_421031_10]",3)
	--�o��n�Y���N�ަ�~~~~
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
	Sleep(20)
	Yell(OwnerID(),"[SC_421031_12]",3)	
	--�H��A�]�Y����n����H
	
	Sleep(10)
	PlayMotion(OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	CastSpell(OwnerID(),OwnerID(),491276)
	Sleep(30)
	Hide(OwnerID() )
	Sleep(10)
	Delobj(DANCER2)
	Delobj(DANCER3)
	Delobj(DANCER4)
	Delobj(DANCER1)

end
	


function LuaS_421031_3()
	AdjustFaceDir( OwnerID() , TargetID() ,0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE)
	Sleep(40)
	PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_UNHOLSTER)
	Sleep(20)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Sleep(10)	
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	Hide(OwnerID())

end

function LuaS_421031_4()	

	AdjustFaceDir( OwnerID() , TargetID() ,0 )
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_STRETCH)
	Sleep(20)
	PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(10)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_END)
	Sleep(10)	
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_PLAY_TAMBOURINE)
	Sleep(40)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_KISS)
	Sleep(20)
	Hide(OwnerID())
end


--============================================================================================================
--�O�s�̰s�a
--============================================================================================================

function LuaS_421033_114433()
	SetIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_SIT)
	while 1 do
		Say(OwnerID(),"[SC_421033_0]")	--"�A�Ӥ@�M......�ѡB�ѱ����I"	
		Sleep(200)
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_BEGIN  )
		PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP )
		Say(OwnerID(),"[SC_421033_1]")
		Sleep(3000)
	end
end


function LuaS_421033_114434()	--�ܰs������
	SetIdleMotion(OwnerID(),ruFUSION_MIME_EMOTE_DRINK)
	Sleep(50)
end

function LuaS_421033_114435()	--�w��W
	SetIdleMotion(OwnerID(),ruFUSION_MIME_SIT_CHAIR_LOOP)
	Sleep(50)
end


--============================================================================================================
--���r������
--============================================================================================================

function LuaS_422051_114463()
--���bnpc114463/npc114464���r���������U
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLEEP_LOOP )	--���۪��ʧ@emote_sleep_down
end


--============================================================================================================
--���o����
--============================================================================================================	
-------------------�ݽվ�(�����X�СB�����ʧ@)
--���b114425�p�i�Ū���l�@��
--�p��J���t�X,780569/  �ڲ�,780570
--�z����114357

function LuaS_422113_3()
--Owner�O114425
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_IDLE0	)

	while 1 do
		Local Ric=Lua_DW_CreateObj("flag" ,114465,780569,1)
		Sleep(30)
		DW_MoveToFlag(Ric,780569,2,0,1)
		AdjustDir( Ric , 180)
		Yell(Ric,"[SC_422113_0]",3)	
		--�ڲڡA�֨ӧ֨�!
		Local Bou=Lua_DW_CreateObj("flag" ,114466,780570,1)
		Sleep(10)
		DW_MoveToFlag(Bou,780570,2,0,1)
		
		Yell(Ric,"[SC_422113_1]",3)
		--�ڲڡA�A�M�ڡA�ڭ̭n�@�_�h���j�s�I
		PlayMotion(Ric,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		PlayMotion(Bou,ruFUSION_ACTORSTATE_DODGE)
		Sleep(30)
		
		BeginPlot(Ric,"LuaS_422113_4",0)	--780569.3
		Sleep(10)
		BeginPlot(Bou,"LuaS_422113_5",0)	--780570.3
		Sleep(50)
		
		PlayMotion(Ric,ruFUSION_ACTORSTATE_EMOTE_IDLE1)
		Yell(Ric,"[SC_422113_4]",3)
		--���ڪ��j�A�N���کM�A�ӫO�@�j�a�F�C
		PlayMotion(Bou,ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(40)
		
		Yell(Ric,"[SC_422113_5]",3)
		--�K�I��j�s�A���A�n�ݡI
		--CastSpell(Ric,OwnerID(),490591)
		Sleep(30)
		BeginPlot(Bou,"LuaS_422113_6",0)	--���ڲڶö]��--780570.4
		
		DW_MoveToFlag(Ric,780569,4,0,1)
		AdjustFaceDir(Ric,OwnerID(),0)
		Yell(Ric,"[SC_422113_6]",3)
		--�z�I
		
		DisableQuest(OwnerID(),true)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_DODGE)
		Sleep(30)
		AdjustFaceDir(OwnerID(),Ric,0)
		Yell(Ric,"[SC_422113_2]",3)
		--�p�i�šA�ʹʼL�A�Q�N�ڲڡA�ڰ������A�z�z���F���భ�I
		DW_MoveToFlag(Ric,780569,5,0,1)
		AdjustFaceDir(Ric,OwnerID(),0)
		AdjustFaceDir(OwnerID(),Ric,0)
		Sleep(30)
		Yell(OwnerID(),"[SC_422113_3]",3)
		--�H�a�̰Q����J�F�աI���J�A�p�𰭡I
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
		Sleep(30)
		Yell(Ric,"[SC_422113_2]",3)
		--�p�i�šA�ʹʼL�A�Q�N�ڲڡA�ڰ������A�z�z���F���భ�I
		DW_MoveToFlag(Ric,780569,6,0,1)
		DisableQuest(OwnerID(),false)
	
		Yell(Ric,"[SC_422113_0]",3)	
		--�ڲڡA�֨ӧ֨�!
		DW_MoveToFlag(Bou,780570,5,0,1)
		Sleep(50)
		Delobj(Ric)
		Delobj(Bou)
	
	Sleep(2000)
	end
end

	
Function LuaS_422113_4()
	DW_MoveToFlag(OwnerID(),780569,3,0,1)
	AdjustDir( OwnerID() , 180)
end

Function LuaS_422113_5()
	DW_MoveToFlag(OwnerID(),780570,3,0,1)
	SetRandMove(OwnerID(),500, 1500,20  )
end	
	
Function LuaS_422113_6()
	DW_MoveToFlag(OwnerID(),780570,4,0,1)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	SetRandMove(OwnerID(),5000, 10,20  )

end	


-------------------




--�����o���窺script+�񱼫o����

function LuaS_422113_0()-----���b���~204046�ϥΤU��<�ˬdlua>���U�C103498
	local OrgID = 0
	if CheckAcceptQuest( OwnerID() , 422113 ) == false or CountBodyItem( OwnerID() ,206407) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_206446_0]" , 0 ) --�A���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_206446_0]" , 0 )
		return false
	end
	
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	
	if   OrgID ~= 103498 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_1]", 0 ); -----�o��[205871]���G�u���[113447]�ϥΡC
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------�Z��
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_204425_5]", 0 ); -----�Z���ӹL�����A�L�k�ϥ�[205871]�C
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

function LuaS_422113_1()	--���b<�ϥήĪG����:server�ݼ@��>�U���ϥήĪG�U
	if GiveBodyItem( OwnerID() , 206407 , 1 ) then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---���b�ϥΪ����~
	end
	Hide(TargetID())
---	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422113_8]", 0 ); -------�A���[103301]�F�I
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())

end



--�������ȫ�
function LuaS_422113_2()	--���b����422113���������Ȥ��x
	if	 CountBodyItem( TargetID(), 204046)>0	 then 
		 DelBodyItem( TargetID(), 204046, 1 )
	end
	
end



--============================================================================================================	
--422857 �{�P�ۥ���
--============================================================================================================	
--Rand( Value )�b�@�w�d�򤺨��ü�
--�{�P��206408


function LuaS_422857_0()	--���b����{�P�۪��ϥΪ��~script���U�Aowner�O���a

--	Say(OwnerID(),"0..0")
	Beginplot(TargetID(),"LuaS_422857_1",0)
	UseItemDestroy()
	ScriptMessage( OwnerID()  , OwnerID()   , 1 , "[SC_422857_0]" , 0 )
	CastSpell( OwnerID() , OwnerID() , 491008 )
	
end

function LuaS_422857_1()

	local R=RandRange(1,20)
	local A={}
	A[1]=206831
	A[2]=206849
	A[3]=206850
	A[4]=206851
	A[5]=206852
	A[6]=206853
	A[7]=206854
	A[8]=206855
	A[9]=206856
	A[10]=206857
	A[11]=206858
	A[12]=206859
	A[13]=206860
	A[14]=206861
	A[15]=206862
	A[16]=206863
	A[17]=206864
	A[18]=206865
	A[19]=206866
	A[20]=206867
		
	local B=0
		for i=1,20,1 do	
			if R==i	then
				GiveBodyItem( TargetID() , A[i] , 1 )
				ClearBorder( TargetID() );		
				AddBorderPage( TargetID(), "[SC_422857_"..i.."]" )			
				ShowBorder( TargetID(), 0, "[206408]", "ScriptBorder_Texture_Paper" )
			end	
			
			if CountBodyitem(TargetID(),A[i])>0 then
				Setflag(TargetID(),543791,1)	--�{�b��}�F�@�ӴN���X�СA�H�P�_��ܼ@���}�ҧ_....
--				B=B+1(�쥻�O�]�}�F3�Ӥ~���X�Ф~�o�˼g_1)
			end
		end		

--	if B>2 then(�쥻�O�]�}�F3�Ӥ~���X�Ф~�o�˼g_2)
--		Setflag(TargetID(),543721,1)
--	end
end

-------------


	
function LuaS_422857_2()	--���b�H���w�����F�D�ŬP��ܤ��U 
	LoadQuestOption(OwnerID())
	if 	Checkflag(OwnerID(),543791)== true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422857_22]","LuaS_422857_3",0)		--�u�ڬݹL�{�P�ۤF�A�{�b�Q�N�o�ǥ��Y�ٵ��p�C�v

	else
		return false
	end
		
end

function LuaS_422857_3()



	local A={}
	A[1]=206831		--1�n������ä��b���Ҥ��ͪ��A���V�j�A�V�_���C
	A[2]=206849		--2�V��P�A�P�檺�H�C
	A[3]=206850		--3�p�H�����o��C
	A[4]=206851		--4�@���b�ѳ̦M�I�C
	A[5]=206852		--5�����}�����_�I�̱q����ܤ�V�A�ӬO�u���a�������L�������ܽСC
	A[6]=206853		--6�Z�O���߯���Q��B�۫H���A���O�i�H�F�쪺�C
	A[7]=206854		--7�q�̲L���L�y�A��V���e���ˬy�C
	A[8]=206855		--8�b�A�����F�`�B���\�h�H�Ϊ��O�q�A������B�������B�Υ��C
	A[9]=206856		--9�g�Y�����̮e���W�_�C
	A[10]=206857	--10���Ƥ��]���[�d�C
	A[11]=206858	--11�Y�϶·t�׷|�]���@���A�b�����e��n�ɤO��ܥ��I
	A[12]=206859	--12���t�h���F�C
	A[13]=206860	--13���ƪ�����|�A���ӳX�C
	A[14]=206861	--14��o�A�Q�n���A�ɨ��A��o���C
	A[15]=206862	--15�C�j�A�����A�R���`�y�C
	A[16]=206863	--16�ݬݼs�諸�ѪũM�{�{���P�P�A�A���߱N�|���R�U�ӡC
	A[17]=206864	--17�n�B���H�ۤ��Ѫ��A�C
	A[18]=206865	--18�o�O�@���ťժ��{�P�ۡA��ܧA���R�B���۵L�����i��C
	A[19]=206866	--19�P�~�޻�ۧA�A���A���g���b���ͪ��p�|�W�C
	A[20]=206867	--20���j���y�H�q�������y���A�o�N�O������q�����H���L����O���j���C
	
	for i=1,20,1 do

		if 	(CountBodyitem(OwnerID(),A[i]))== false then
			SetSpeakDetail(OwnerID(),"[SC_422857_23]")		--��A�A�ѤF�N�{�P�۱a�b���W�H
			return false
		else			
		
			DelBodyItem(OwnerID(),A[i],1)	
		end
		SetSpeakDetail(OwnerID(),"[SC_422857_24]")		--�бN�P�P�i�D�A���ܻy�O�b�ߤW�A�Y�N���檺�Ȧ�̡A�P���û��b�A�e�誺�ѪŰ{�{�C
	end
end


		
		
--============================================================================================================
--���޼@��421273
--============================================================================================================


function LuaS_421273_543687()	--���ޤ@��
---DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543687_1",50)
	local Mark1 = LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark1 ) 	
end

function LuaS_421273_543687_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543687 )==false	then
		SetFlag(OwnerID(),543687,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--�������v�X��	
		
	end
end

--------------

function LuaS_421273_543688()	--���ޤG��
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543688_1",50)	
	local Mark2 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )	
	Lua_ObjDontTouch( Mark2 ) 	
end

function LuaS_421273_543688_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543688 )==false	then
		SetFlag(OwnerID(),543688,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--�������v�X��	
	end
end

--------------

function LuaS_421273_543689()	--���ޤT��
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543689_1",50)	
	local Mark3 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark3 ) 	
end

function LuaS_421273_543689_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")

	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543689 )==false	then
		SetFlag(OwnerID(),543689,1)
		Beginplot(TargetID(),"LuaS_421273_2",0)	--�������v�X��	
	end
end

--------------

function LuaS_421273_543690()	--���ޥ|��
--DebugMSG(0,0,"!!!!")
	--Say(OwnerID(),"0..01")
	--Say(TargetID(),"TT1")
	Setplot(OwnerID(),"range","LuaS_421273_543690_1",50)
	local Mark4 =  LuaFunc_CreateObjByObj( 114895 , OwnerID() )
	Lua_ObjDontTouch( Mark4 ) 		--�o�ӫ��O�O�Ϫ��~���|�Q�I��(��ϧΨS���Ѧ��I�A�t�]�@���ιϤ��A�Ӧ��Ϥ����Q�Q�I��ɡA�Φ��禡)
end

function LuaS_421273_543690_1()	
	--Say(OwnerID(),"0..02")
	--Say(TargetID(),"T_T2")	
	if CheckAcceptQuest(OwnerID(),421273)== true and
		CheckFlag( OwnerID() , 543690 )==false	then
		SetFlag(OwnerID(),543690,1)
		--Beginplot(TargetID(),"LuaS_421273_2",0)	--�]���ئb�«��ϤJ�f�A�G�������v�X��	
	end
end


function LuaS_421273_2()	--
	--Say(OwnerID(),"0..03")
	--Say(TargetID(),"T_T3")
	local R=RandRange(1,5)
	local L=RandRange(1,6)
	local S=RandRange(1,7)
	local B=RandRange(1,4)
	
	local Looser1 = Lua_CreateObjByDir( OwnerID()  , 103526, 20 , 0 )
	Hide(Looser1)
	local Looser2 = Lua_CreateObjByDir( OwnerID()  ,103527, 30 , 0 )	
	Hide(Looser2)
	AdjustFaceDir( Looser1 , TargetID() ,3 )	
	AdjustFaceDir( Looser2 , TargetID() ,3 )	
		
	if R==1 then
		--Say(OwnerID(),"0..04")
		--Say(TargetID(),"T_T4")
		Sleep(10)
		AdjustFaceDir( Looser1 , TargetID() ,3 )	
		AdjustFaceDir( Looser2 , TargetID() ,3 )	
		Show(Looser1,0)
		Show(Looser2,0)
		Yell(Looser1,"[SC_421273_"..L.."]",1)		--�A�ݡA�s�Ӫ������M�h�A�@�L�����m�ˡC
		Sleep(30)
		Yell(Looser2,"[SC_421273_1"..S.."]",1)		--�泾�@�ӡA�˥L�I
		SetAttack(Looser1 , TargetID())
		SetAttack(Looser2 , TargetID())
		
	elseif R==2 then
		--Say(OwnerID(),"0..05")
		--Say(TargetID(),"T_T5")
		Local X = ReadRoleValue(TargetID(),EM_RoleValue_X)
		Local Y = ReadRoleValue(TargetID(),EM_RoleValue_Y)
		Local Z = ReadRoleValue(TargetID(),EM_RoleValue_Z)
		Sleep(10)
		SetStopAttack(Looser1)	
		Sleep(20)
		Show(Looser1,0)		
		Yell(Looser1,"[SC_421273_2"..B.."]",1)		--�ڡB�ڤ����a�Ƥ]�S�����A���n��ڡI
		Sleep(30)
		LuaFunc_WaitMoveTo( Looser1, X+100 , Y , Z-200)		
		Hide(Looser1)
	end



	for i=1,200,1 do
		if 	GetDistance( TargetID(), OwnerID()) >70   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
		--Say(OwnerID(),"0..06")
		--Say(TargetID(),"T_T6")
			break	
		end
		Sleep(30)
	end
		
	
	if 	CheckID(Looser1)== true then
		Sleep(50)
		Hide(Looser1)
		DelObj(Looser1)
	end
	
	if 	CheckID(Looser2)== true then
		Sleep(50)
		Hide(Looser2)
		DelObj(Looser2)
	end

end

--L=1 	�A�ݡA�O�s�Ӫ������M�h�A�@�L�����m�ˡC						s=	1	�泾�@�ӡA�d���L�I			
--	2	�ޡI���ު��H�L�ӤF�C											2	�p�l�A���ѴN�O�A�������A�ֱЧA�[�J����M�h�ΡI
--	3	�@�@���@���˳ơA�o�Ө����M�h�ܦ��o�����ˤl�C					3	�ڭ̨�ӡA�L�@�ӡA��]�򦺥L�I
--	4	�֨��a�A���䦳�H�L�Ө��ޤF�C									4	�N�@�ӵ泾�A�O���ڭ̰e��ӤF�A�W�I
--	5	�S�̡I�O���ު��H......�I���٦n�A���O[114368]���ӺƱC�Q�C		5	�O�o�ܡA�妺�L�I
--	6	�ݬݳo�ӹL�Ӫ��H�O�֡H��ӬO�s�W���������M�h�j�H�A�����I		6	���I�I�W�ڭ̨�ӡA�O�L�������}�l�C

--B=1	�ڡB�ڤ����a�Ƥ]�S�����A���n��ڡI
--	2	�ڦb�o�̤��O�n�����s�Ӫ������M�h......
--	3	�ݤ���ݡH�ڤ���g�L�o�̶ܡH
--	4	�A�S���ݨ�ڡB�A�S���ݨ��......
	

	
	
--============================================================================================================
--�T���s��114421(����421614
--============================================================================================================	
	
function LuaS_421614_0() --���b����NPC�t������ܼ@��
	LoadQuestOption(OwnerID())
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_0]","LuaS_421614_1",0)		--�u�ݬݧA�椰��......�v
		if CheckAcceptQuest(OwnerID(),421597)==true 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_2]","LuaS_421614_2",0)	--�A�{��[114841]�ܡH
		end
end

function LuaS_421614_1()
	SetSpeakDetail(OwnerID(),"[SC_421614_1]")	--
end	

--����������		�������G�n		
--�������GŽ		�������ͻH		
--����������		�j�諸�Q��		
--�j�諸���		�j�諸�Z
--�Ѩ_���l�� 		���窺�K��
--���ͯת�����	
--���몺�Y�v
--�e�Ǫ����
--......


function LuaS_421614_2()
	SetSpeakDetail(OwnerID(),"[SC_421614_3]")	--�ڬO�{�ѴX�Ӿm�I���ѩǪ��A[114841]�o�ӦW�r���I�ռ�
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_4]","LuaS_421614_3",0)
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421614_5]","LuaS_421614_4",0)
end

function LuaS_421614_3()
	SetSpeakDetail(OwnerID(),"[SC_421614_6]")
	SetFlag(OwnerID(),543760,1)	
end

function LuaS_421614_4()
	SetSpeakDetail(OwnerID(),"[SC_421614_7]")
	SetFlag(OwnerID(),543760,1)	
end

--============================================================================================================	

function LuaS_Deadmen()
--���b���H�U
	SetDefIdleMotion( OwnerID() ,ruFUSION_MIME_IDLE_DEAD)			

end