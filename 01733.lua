----�s�O[114438]����ܡC
function LuaS_423026()------
             	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest(OwnerID(),423025)==true	then
		if	CountBodyItem(OwnerID(),203461)==0		or
			CountBodyItem(OwnerID(),203462)==0		then
--(�߰ݳo�̦��S�����o�M���ѹ�)
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_423025_0]","LuaS_423025_1", 0 )
		end
	end

	if (CheckAcceptQuest(OwnerID(),423026)==true )and  (CheckFlag(OwnerID(),543644)==false )then
		SetSpeakDetail( OwnerID(), "[SC_423026_0]"  );  ---�ͭ��աA�A�Q�ܨǤ���H
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_1]","LuaS_423026_1",0)    ---����
	end
end
function LuaS_423026_1()
	SetSpeakDetail( OwnerID(), "[SC_423026_2]"  )---���ڡH�o�i�O�D�`���Q���հs�A�A�T�w�A�I�o�_�o�s���H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_3]","LuaS_423026_2",0)  ----�O���A�ڽT�w�C
end
function LuaS_423026_2()
	SetSpeakDetail( OwnerID(), "[SC_423026_4]"  )---����ڷ|���A�N�o�M�s����m�b�̥k�����y��W�A���ݧA���n�B�C
	SetFlag( OwnerID() , 543644, 1 )
end

---�M�l����ܼ@���C
function LuaS_423026_3()
	if 	 CheckAcceptQuest(OwnerID(),423026)==true	and CheckFlag( OwnerID(), 543645)==false  then
			if 	CountBodyItem( OwnerID(), 206793 )==0 then
					SetSpeakDetail( OwnerID(), "[SC_423026_6]"  )--���ݰ_�ӥu�����q���հs�A�]�\�A�ӱN[206793]�\��b�����W�C
			end
			if 	CountBodyItem( OwnerID(), 206793 )>0 then
					LoadQuestOption( OwnerID())
					AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_5]","LuaS_423026_4",0) --- �b�s�M�W��m[206793]�C
			end
	else
		LoadQuestOption( OwnerID())
	end
	
	
---	and 	CountBodyItem( OwnerID(), 206793 )==0 then
--		SetSpeakDetail( OwnerID(), "[SC_423026_6]"  )--���ݰ_�ӥu�����q���հs�A�]�\�A�ӱN[206793]�\��b�����W�C
--	end
--	if	 CheckAcceptQuest(OwnerID(),423026)==true and CheckFlag( OwnerID(), 543645)==false and     CountBodyItem( OwnerID(), 206793 )>0 	then
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423026_5]","LuaS_423026_4",0) --- �b�s�M�W��m[206793]�C
--	end
--		LoadQuestOption( OwnerID() )
end
function LuaS_423026_4()
	CloseSpeak( OwnerID() )
	DelBodyItem( OwnerID(), 206793, 1 )
	BeginPlot( TargetID(), "LuaS_423026_5", 0)
end
function LuaS_423026_5()
---DN�O�����E�J����
---�ϥκX�l 780545
	DisableQuest( OwnerID() , true )
	SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_Obj_BUSY"  , 40  )
	DisableQuest( OwnerID() , true)
	if 	CheckID( TargetID() ) == true  then
		AddBuff( TargetID(), 505978 , 1 , 10 )---���o��BUFF���ɭ� �ݱo���t�����U��[114440]
	end
	local DN = Lua_DW_CreateObj("flag" ,114440,780545,0,1 )
	DW_MoveToFlag( DN,780545,1, 0,1)
	Yell( DN , "[SC_423026_7]" , 3 )--�ɡ�o�F��K�K
	sleep(20)
	DW_MoveToFlag( DN,780545,21, 0,1)
	DW_MoveToFlag( DN,780545,22, 0,1)
	DW_MoveToFlag( DN,780545,2, 0,1)
	AdjustFaceDir( DN , TargetID() , 0 )
	Yell( DN , "[SC_423026_8]" , 3 )--�p�l�A�A�Q�������H
	PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_POINT)
	sleep(20)
	if 	CheckID( TargetID() ) == true  then
		SetFlag(TargetID(), 543645, 1 )----���o�ӺX�� �ݱo���i�H�����Ȫ��U��[114439]
	end
	sleep(10)
	DelObj( DN)
	SetPlot(  OwnerID()  ,   "touch" ,  ""  , 0  )
	DisableQuest( OwnerID() , false)
end


-----423028---
--�M�b��Ĳ�I�@��
function LuaS_423028_0()----Ĳ�I�@��
		SetPlot( OwnerID() , "touch" , "LuaS_423028_1" , 10)----
	end
	
function LuaS_423028_1()
	if	CheckAcceptQuest( OwnerID(),423028)==true and  CheckFlag( OwnerID(), 543646)==false then
		BeginPlot( TargetID(), "LuaS_423028_3", 0 )----���W�C
	else
		ScriptMessage( OwnerID(), TargetID(), 0, "SC_423028_25", 0 )--�o��P���@�L�����C
	end	
end

function LuaFunc_423028_LOVE() -- ���T��
	ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_423028_28]", 0 );
	ScriptMessage( OwnerID(), OwnerID(), 0,"[SC_423028_28]", 0 );

end

function LuaS_423028_3()	
		SetPlot(  OwnerID()  ,   "touch" ,  "LuaFunc_423028_LOVE"  , 20  )
---		BeginPlot( OwnerID(), "LuaS_423028_2", 50 )----���W�C
----�]���OCA  114012
----�U��ODN
		if 	CheckID( TargetID() ) == true  then
			AddBuff( TargetID(), 505992 , 1 , 90)----�����a�WBUFF  �u���֦��o�� �~��ݨ�H�U���@�� CA DN
		end
		local KK = Lua_DW_CreateObj("flag" ,114484,780545,4,1 )---�دS�����βy
		SetModeEx(KK, EM_SetModeType_Mark,false)  
		local CA = Lua_DW_CreateObj("flag" ,114012,780545,0,1 )
		local DN = Lua_DW_CreateObj("flag" ,114442,780545,2,1 )
		WriteRoleValue( KK, EM_RoleValue_Register ,targetID() )---�b�������󨭤W�g�J���a��ID�C
		BeginPlot( KK, "LuaS_423028_2", 50 )----���W�C
		DW_MoveToFlag( CA,780545,1, 0,1)
		DW_MoveToFlag( CA,780545,3, 0,1)
		AdjustFaceDir( DN , CA, 0 )
		Yell( DN , "[SC_423028_1]" , 3 )--�D�H�C
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_SALUTE2	)
		sleep(20)
		AdjustFaceDir( CA , TargetID(), 0 )
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_2]", 0 )----�]�������Y�ª����q�ۧA�C
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_2]", 0  )
		end	
		sleep(20)	
		Yell( CA , "[SC_423028_3]" , 3 )----�N�O�L�H
		PlayMotion( CA, ruFUSION_ACTORSTATE_EMOTE_IDLE2	)
		sleep(20)
		Yell( DN , "[SC_423028_4]" , 3 )--�O���C
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD	)
		sleep(20)
		Yell( CA , "[SC_423028_5]" , 3 )---�F��b���H
		sleep(10)
		DW_MoveToFlag( DN ,780545,5, 0,1)
		AdjustFaceDir( DN , CA, 0 )
		sleep(10)
		PlayMotion( DN, ruFUSION_ACTORSTATE_CRAFTING_LOOP)
		sleep(20)
		PlayMotion( DN, ruFUSION_ACTORSTATE_CRAFTING_END)
		sleep(10)
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_6]", 0  )--�����E�J���ԱN�b�Y���]���A�]�����ۧ⪱�F�@�U�C
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_6]", 0 )
		end
		DW_MoveToFlag( DN ,780545,2, 0,1)
		sleep(10)
		AdjustFaceDir( DN , TargetID(), 0 )
		sleep(50)
		Yell( CA , "[SC_423028_7]" , 3 )---���a�ۿ����B�����e�{���ũ�g���A���U�Ӥ������Ӧ���r�C
		PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( CA , "[SC_423028_8]" , 3 )---�G�M�O�L���@�~�C
		sleep(30)
		Yell( CA , "[SC_423028_9]" , 3 )---�D�_���ٱa���I�J�����g���᭻�A���ӬO���Y�������]���e�t�o���@�ΡC
		PlayMotion( CA ,ruFUSION_ACTORSTATE_PARRY_BOW )
		sleep(30)
		Yell( CA , "[SC_423028_10]" , 3 )--�o�򻡨Ӧ�B�ԪG�M�O�Q���סE��w�ص��ۨ����C
		sleep(30)
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(OwnerID(),423028)==true then
			ScriptMessage( OwnerID(), TargetID(), 0, "[SC_423028_11]",0)--�]���ݦV�F�A
			ScriptMessage( OwnerID(), TargetID(), 1, "[SC_423028_11]", 0 )
			AdjustFaceDir( CA , TargetID(), 0 )
		end
		sleep(10)
		Yell( CA , "[SC_423028_12]" , 3 )---�O�ȯZ�ժ��S�س����A�ڸg�⪺�g����A��~�Ӥ]�u�����@��C
		---PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( CA , "[SC_423028_13]" , 3 )---���U�ӧA�����򰵡H 
		sleep(30)
		Yell( CA , "[SC_423028_14]" , 3 )---�p�G�A�P���M�A�ڥi�H�y�L�����U�A�C
		sleep(30)
		Yell( CA , "[SC_423028_15]" , 3 )---[114442]�A���ޥL�h���i�A�L�|�Ѷ}�Ҧ����ðݡC
		---PlayMotion( CA ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
		sleep(30)
		Yell( DN , "[SC_423028_16]" , 3 )---�O�C
		PlayMotion( DN, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
		sleep(30)	
		Yell( CA , "[SC_423028_17]" , 3 )---�ȯZ�կS�س����a�ϨS�ΡA����A�i��O�}�d���D�ԡC
		sleep(30)	
		AdjustFaceDir( CA , TargetID(), 0 )
		Yell( CA , "[SC_423028_18]" , 3 )---�b�U���������e�A�A�̦n�V�O���U�ӡC
		PlayMotion( CA, ruFUSION_ACTORSTATE_EMOTE_POINT)
		sleep(30)	
		Yell( CA , "[SC_423028_19]" , 3 )---�ѤU�N�浹�A�B�z�F�A[114442]�C
		DW_MoveToFlag( CA,780545,0, 0,1)
		sleep(20)
		DelObj( CA)
		DelObj( DN)
		DelObj( KK)
		sleep(10)
		SetPlot(  OwnerID()  ,   "touch" ,  "LuaS_423028_1"  , 40  )
		if 	CheckID( TargetID() ) == true  and CheckAcceptQuest(TargetID(),423028)==true then
			SetFlag( TargetID() , 543646, 1 )---
			CancelBuff( TargetID(), 505992  )
		end
end

function LuaS_423028_2()
	local MM = ReadRoleValue( OwnerID() , EM_RoleValue_Register )
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_20]",  "0xFFFFFF00")---���ةԡG�o�O���^�ơH
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_21]",   "0xFFFFFF00")--�ȧƧB�G��診�O����H
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_22]",  "0xFFFFFF00")--�ȧƧB�G�Ĥ@���ݨ�o��P���o���C
	sleep(30)
	ScriptMessage( OwnerID(),MM, 0, "[SC_423028_23]",  "0xFFFFFF00")--���ةԡG�O�ڡC���e�n���]�ݹL��L�H�L�ӡA���o�P���q�����{�b�o�˵o���C
	sleep(30)
	ScriptMessage( OwnerID(), MM, 0, "[SC_423028_24]",  "0xFFFFFF00" )--�ȧƧB�G�쩳�O�H
end
-------------------423029--
----�P�y���~����ܤ���--���b114443���W�C
---543648.543650 ���P�_ 114444���X��
function LuaS_423029_1()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543647)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_2",0)----(�N��m�b[206795]�����e�A���[��L�������C)
	end
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543647)==true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_3",0)----(�N��m�b[206795]�����e�A���[��L�������C)
	end
end
function LuaS_423029_2()	
	SetSpeakDetail( OwnerID(), "[SC_423029_2]"  )----�O���ڡA�O���ۨ��ӪF���ۧڡC
	SetFlag( OwnerID() , 543647, 1 )---
end

function LuaS_423029_3()	
	SetSpeakDetail( OwnerID(), "[SC_423029_3]"  )---�n�ߪ��H�A�I���I�������ڧa�C
	SetFlag( OwnerID() , 543648, 1 )---�ΨӧP�_�ण��ݨ�114444���X��
end
----�P�y���~����ܤ���--���b114457���W�C
function LuaS_423029_4()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543649)==false	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_5",0)----(�N��m�b[206795]�����e�A���[��L�������C)
	end
	if 	CheckAcceptQuest(OwnerID(),423029)==true   and CountBodyItem ( OwnerID(),  206795)>=1 and  CheckFlag( OwnerID(),  543649)==true 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_6",0)----(�N��m�b[206795]�����e�A���[��L�������C)
	end
end
function LuaS_423029_5()	
	SetSpeakDetail( OwnerID(), "[SC_423029_4]"  )----�o�O����A�p�l�H�O�H���A���F�M�A�ڴN�|�ȧA�I�p�G�A���Q���~���ܡA�N�O�צ�ڪ������C
	SetFlag( OwnerID() , 543649, 1 )---
end

---���W��ܡB�إX�i�H���H��NPC�B����W��NPC������  �쥻��NPC�~�|�X�{�C
function LuaS_423029_6()	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423029_7", 0)
end
function LuaS_423029_7()
	DisableQuest(OwnerID(),true)	
	Hide(OwnerID())
--�إ߾԰��δ��� &����԰���d�s�����D &���w�ؼ� &��������
	local NPC = Lua_DW_CreateObj("obj",103294,OwnerID())
	SetPlot(NPC,"dead","LuaS_423029_8",0)
	WriteRoleValue( NPC , EM_RoleValue_PID , OwnerID() )
	Say(NPC,"[SC_423029_5]")---�u�A�o�O�ڪ��F�C
	if 	CheckID( TargetID() ) == true  then
		DelBodyItem( TargetID(),206795, 1 )
	end
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	SetAttack(NPC,TargetID())
	Lua_Drama_Radar( NPC , 423029 )
--�ˬd��ɵ���
	while	CheckID(NPC) AND ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 0 and Lua_Check_Drama_Statu( NPC) ==true do
		sleep(10)
	end
--�{�X���L	&���Ҥ���
	if CheckID( NPC ) == true then
		Delobj( NPC )
	end
	Show(OwnerID(),0)
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
	--	say(OwnerID(),"[SC_423029_10]")---�ڻ{��I�O���F�I
	--�ڪA���ʧ@
		PlayMotion( OwnerID(), 	ruFUSION_ACTORSTATE_EMOTE_SURRENDER	)
		sleep(40)
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	DisableQuest(OwnerID(),false)
end

function LuaS_423029_8() --���`�@�� �������X��
	local Tar
	local NPC = ReadRoleValue( OwnerID() , EM_RoleValue_PID )
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423029)	and
			CheckFlag(Tar,543650)==false	then
			SetFlag(Tar,543650,1)
		end
		if  	CountBodyItem(Tar,206795)==0	then
			GiveBodyItem (Tar, 206795, 1 )
		end
	end
	WriteRoleValue( NPC , EM_RoleValue_Register , 1 )
	DelObj(OwnerID())
	return true
end
----��P�U�⪺��ܼ@��
function LuaS_423029_9()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423029)==true  and CheckFlag( OwnerID(),  543651)==false 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423029_1]","LuaS_423029_10",0)----(�N��m�b[206795]�����e�A���[��L�������C)
	end
	if	CheckAcceptQuest(OwnerID(),423030)==true and  ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 and CheckFlag( OwnerID(),  543652)==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423030_1]","LuaS_423030",0)---�ڭ̸ӥX�o�F�ܡH
	end	
	if	CheckAcceptQuest(OwnerID(),423030)==true and  ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 1 and CheckFlag( OwnerID(),  543652)==false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423030_1]","LuaS_423030_1",0)---�ڭ̸ӥX�o�F�ܡH
	end	
	if CheckCompleteQuest( OwnerID() , 423029 ) == true and CheckAcceptQuest( OwnerID() , 423030 ) == false and CheckCompleteQuest( OwnerID() , 423030 ) == false then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_DRAMA_REPLY]",  "LuaS_423029_11",  0 ); --�]�A���[�ݼ@���t�X�^		
	end
end
function LuaS_423029_10()	
	SetSpeakDetail( OwnerID(), "[SC_423029_6]"  )----�o�O�K�K�z�n�⥦�浹�ڡH���u�O�A�n���L�F�A�ݨӤ��ѤS����������ì�C
	SetFlag( OwnerID() , 543651, 1 )---
end
function LuaS_423029_11()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_423029_Complete" , 0 )
end

----�ϥ�780432�X�l
---����Jmak
function LuaS_423029_Complete()	
	if 	CheckID( TargetID() ) == true  then
		AddBuff( TargetID(), 505979 , 1 , 17)----�����a�WBUFF  �u���֦��o��505979 �~��ݨ�   
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) > 0 then
		return	
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0 then
		DisableQuest(OwnerID(),true)
		SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 7 )
		local MAK = Lua_DW_CreateObj("flag" ,114445,780432,0,1 )
		DW_MoveToFlag(MAK,780432,1, 0,1)	
		sleep(20)
		Yell( MAK , "[SC_423029_7]" , 3 )---�ש���A�F�C
		PlayMotion( MAK, 	ruFUSION_ACTORSTATE_EMOTE_SPEAK		)	
		sleep(30)
		Yell( OwnerID() , "[SC_423029_8]" , 3 )---�`��H������F�A���򱵤U�ӡA�ڱN�a��z�P�z���P��P�D�H�|�X�C
		PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
			if 	CheckID( TargetID() ) == true  then
				CancelBuff( TargetID(), 505979 )
			end
		delobj(MAK)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		DisableQuest(OwnerID(),false)
	else
		ScriptMessage( TargetID() , TargetID() , 1 , "[SAY_NPC_BUSY]" , 0 )
		ScriptMessage( TargetID() ,  TargetID() ,0 , "[SAY_NPC_BUSY]" , 0 )
	end
	
end	

------------------------------------------------------------------------------------
------423030����---
---��P��U�a�۪��a�B����J�h����P-----(1)��P�P�B�t��(���F���� ��oBUFF ����ݨ��o�q���C)
--�ϥκX��780543
---(1)��P��U�|���@�� ��������  �S���X�Ъ��HBUFF
---(2)���P��U�b�����a��A�h��  �e���P�w�g�b�t���F
---(2)��P�ۤv�t�� �t�_��

function LuaS_423030_1()
	SetSpeakDetail( OwnerID(), "[SC_423030_2]"  )---�n���A�еy���@�|��A��ڱN�F�覬�B�n�A�N�ߨ謰�z�a���C
end	
function LuaS_423030()
	CloseSpeak( OwnerID() )
	WriteRoleValue( TargetID()  ,  EM_RoleValue_Register + 1 , 1)
	BeginPlot( TargetID(), "LuaS_423030_2", 0)
end
function LuaS_423030_2()	
----LM=�y���~=114568  ����J=MAK=114448    AK=�y���~��i=114569
	local LM    = Lua_DW_CreateObj("flag" ,114568,780543,0,1 )
	local MAK = Lua_DW_CreateObj("flag" ,114448,780432,1,1 )
	local AK   = Lua_DW_CreateObj("flag" ,114569 ,780543,2,1)
	CastSpell(OwnerID() ,OwnerID() ,495227)---�����񦳱�423030���� �٨S��o543652�����a�����K�WBUFF(505980)�C---BUFF �ά�ƨӭp��C
	DW_MoveToFlag(LM ,780543,6, 0,1)

	Yell( LM , "[SC_423030_14]" , 3 )---�и�ۧڨ��I
	PlayMotion( LM , ruFUSION_ACTORSTATE_EMOTE_WAVE)
	sleep(10)
	BeginPlot( AK, "LuaS_423030_3", 0)	
	BeginPlot( MAK, "LuaS_423030_5", 0)---��MAK��ۨ�
--	DW_MoveToFlag( MAK,780543,6, 0,1)
	sleep(10)
	DW_MoveToFlag( LM,780543,7, 0,1)
	sleep(10)

--	DW_MoveToFlag( MAK,780543,7, 0,1)
	Yell(  LM , "[SC_423030_15]" , 3 )--�е����I
	sleep(90)
	PlayMotion( LM , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	DW_MoveToFlag( LM,780543,8, 0,1)
--	DW_MoveToFlag( MAK,780543,9, 0,1)
	sleep(10)
	AdjustFaceDir( LM , AK, 0 )
	sleep(10)
	Yell(  LM , "[SC_423030_16]" , 3 )---�D�H�A�o��ڨӻ��ä��O�ئ��쪺���k�C
	PlayMotion( LM ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(30)
	Yell(  LM , "[SC_423030_17]" , 3 )---�Q�Ȥw�g��F�F�A�o�O�]���j�H��浹�z���_���C
	PlayMotion( LM ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  LM , "[SC_423030_18]" , 3 )----����ڥ��i�h�F�C
	PlayMotion( LM, ruFUSION_ACTORSTATE_EMOTE_SALUTE2)
	sleep(20)

	while true do--�ˬd
		sleep( 10 )
		if	 CheckID(AK) == false   then  --���b���W�C
			break
		end
	end
	DW_MoveToFlag( LM,780543,5, 0,1)
	sleep(10)
	Delobj(LM)
	Delobj(MAK)
	writeRoleValue( OwnerID() ,  EM_RoleValue_Register + 1 ,0 )  
end

function LuaS_423030_5()
		WriteRoleValue(  OwnerID() , EM_RoleValue_IsWalk , 1 )--- ����J�Ψ����C
		DW_MoveToFlag( OwnerID() ,780543,6, 0,1)
		SLEEP(20)
		DW_MoveToFlag( OwnerID(),780543,7, 0,1)
		sleep(50)
		DW_MoveToFlag( OwnerID(),780543,9, 0,1)
end
function LuaS_423030_3()
--- �Q�ڤ֤kA=MM1=114570  �Q�ڤ֤kB=MM2=114571 
	local MM1= Lua_DW_CreateObj("flag" ,114570 ,780543,3,1)
	local MM2= Lua_DW_CreateObj("flag" ,114571 ,780543,4,1)
	BeginPlot( MM1, "LuaS_423030_6", 0)	
	BeginPlot( MM2, "LuaS_423030_6", 0)	
 	sleep(230)
	Yell( MM2 , "[SC_423030_3]" , 3 )---�گu���n�g����R����i�o�ڦn�h�W�K�K 
	PlayMotion( MM2 ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell( MM1 , "[SC_423030_4]" , 3 )---��i�A�u������ЧA���ڪ��f�f�u�w���v�ܡH
	PlayMotion( MM1 ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_5]" , 3 )--�u�r�A�ڥu�O�Ӭy���~�A�S���|���o���ǰ��W���w�����N�O�H
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  OwnerID() , "[SC_423030_6]" , 3 )--���p�G�z�u���o��g���A�ڤ]���@�ݳo���R���p�j���R�ҭW�C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(40)
	Yell(  OwnerID() , "[SC_423030_7]" , 3 )--�o�˧a�I�бz���h�ǳƥe�R�һݭn�����ơC
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_8]" , 3 )--���@�N���p�j�i��e�R�K�K
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	Yell(  OwnerID() , "[SC_423030_9]" , 3 )---����{�b�Ш����R���p�j���^�h�ǳƳo�i�ȤW�����Ƨa�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_10]" , 3 )---��i�A���B�ͨ�F�A����A�h���z�̤F���
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	BeginPlot( MM1, "LuaS_423030_4", 0)	
	BeginPlot( MM2, "LuaS_423030_4", 0)	
	sleep(30)
	Yell(  OwnerID() , "[SC_423030_11]" , 3 )---�i��A�A�ש��F�C���٥H���A�S�Q��L�ѹ��x��F�O�H
	PlayMotion( OwnerID() ,	ruFUSION_ACTORSTATE_EMOTE_IDLE2 )
	sleep(70)
	Yell(  OwnerID() , "[SC_423030_12]" , 3 )---��~�ܯº骺���~�A���|�����A�O�L�C
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423030)==true and CheckBuff(Player[i], 505980)==true	then
			SetFlag(Player[i],  543652,1)
		end
	end
	sleep(50)
	delobj(  OwnerID())
end

function LuaS_423030_4()---�֤k���}
	Yell( OwnerID()  , "[SC_423030_13]" , 3 )---�n�a......
	sleep(20)
	DW_MoveToFlag( OwnerID(),780543,5, 0,1)---�֤k�������a��
	sleep(10)
	delobj( OwnerID() )
end

function LuaS_423030_6()---�֤k���}
	
	for i = 1 , 120 , 1 do
		if CheckID( TargetID() ) == false then
			break
		end
		sleep( 10 )
	end
	
	DW_MoveToFlag( OwnerID(),780543,5, 0,1)---�֤k�������a��
	sleep(10)
	delobj( OwnerID() )
end

function LuaS_423030_KK()---
	If	CheckAcceptQuest( targetID(), 423030)==true	and  CheckFlag( targetID(),543652 )== false  then
		return true
	end
	return false
end
---------------------------------------------
---------423031---
----��P ��ܼ@��--�߰�3�ӱ��� ���n�ݹL �~�|��o�X��  �e�R����BUFF �n�ü�
function LuaS_423031()
             	LoadQuestOption( OwnerID() )
	if 	CheckAcceptQuest(OwnerID(),423031)==true and   CheckFlag( OwnerID(), 543653 )==false	then----543653 ����a�@���o��e�RBUFF
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_1]","LuaS_423031_1",0)---�ڷQ�߰ݦp����ȯZ�կS�س���
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_2]","LuaS_423031_2",0)----�ڷQ�߰ݨȯZ�ճo�Ӱ�a
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_3]","LuaS_423031_3",0)---�ڷQ�ЧA���ڥe�R�B�աC
	end
	if 	CheckAcceptQuest(OwnerID(),423031)==true and   CheckFlag( OwnerID(), 543653 )==true	then----543653 ����a�@���o��e�RBUFF
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_1]","LuaS_423031_1",0)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_2]","LuaS_423031_2",0)
	end
end
function LuaS_423031_1()
	SetSpeakDetail(OwnerID(),"[SC_423031_4]")---1.	�p��M���ȯZ�կS�س����H�o�O�Ӥ��������D�C�`���̪��ѹ��S�O�����A�e�`�R�b�C�Ӽ��x���ѹD�r�j����C���u�n�A�l�M�۬P�P�����ޡA�������̦ϻP�����N�|�b�A���ȳ~���X�{�ܸ�A�^���̦Ϫ����\�A�A�|��o�Ҧ��ѵ��C����@�ưg�b�����r�A�n�a��d�����Q�ȡA���ѵ��A�j�u�ݡA�ڦA�����A�ǽT�@�I�����ܡA�F�ԥ������~�B�����B�̦ϡA�N�o�ǡC
	SetFlag( OwnerID() , 543654, 1 )
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)---543654
end
 function LuaS_423031_2()
	SetSpeakDetail(OwnerID(),"[SC_423031_5]")--2.	�ȯZ�ճo�Ӱ�a�H����O�ӳQ���V�W����סA�̫Ḩ��F[103292]�o�c����W�A��M�]�u�����t�I�ѡA�A�S���`�{�䲱�L�A�L�k���ը��Ҥ��o�ͳ\�h�Q�ު��Ʊ��A��p����D�X�U���M�h�ηm�ܹҤ��}�����G�p�A���ɧڥi�O���F���֦�����[103292]����������O�C�i�����O~�b�j�N�x��������[103292]��A�߰���ƪ�[103292]�N�}�l�θ�A�i��L�@�����_���j�O�C���㱵�U�Ӫ��N�O���K�F�A���}�@���Ʊ��N���n���F�C�A�n�n�Q�Q�A�p�G�S���P�P���Ũ�X�©]�����R�A�Ӵc����p�O�C
	SetFlag( OwnerID() , 543655, 1 )	
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)---543655
end
function LuaS_423031_3()
	SetSpeakDetail(OwnerID(),"[SC_423031_6]")---����A���Ӥ@�}�l�N�o�򰵤F���㨺��ӭӲťۥe�R�n�F�A�N�T�����Y�Ӱ��A���B�եe�R�����Ʀn�F�C�n�A�{�b�b�A���e��ۤT�ӥ��Y�C�Чi�D�ڡA�A�ҿ�ܪ��O����B����B�k��H
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_7]","LuaS_423031_4",0)---��	����
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_8]","LuaS_423031_4",0)---��	�����G���n���a�A���Ӫ��ȵ{�N�p�P���J���Z���D���W�A�̦ϻP�����N�H�ۧA���B����~�X�{�A�ӻ��U�A���P�~�]�N�a�ۧA�A��}����P�����C���㤤�e���B��A�u�त�e���O���^���A�C���F���ȳ~��[����A���ڬ��A�[�I�B��a�C
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423031_9]","LuaS_423031_4",0)---�k��
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423031",0)
end

function LuaS_423031_4()
	local string={"[SC_423031_12]","[SC_423031_10]","[SC_423031_11]"}---���^���üơC
	local KK = math.floor(DW_Rand( 100 )/33 ) +1--math.floor�G�����
		SetSpeakDetail(OwnerID(),string[KK])
	if	CheckFlag( OwnerID(), 543653 )==false then
		local BUFF = {505981,505982,505983}
		local Num = math.floor(DW_Rand( 100 )/33 ) +1--math.floor�G�����
		AddBuff( OwnerID() , BUFF[Num] , 1, 1800 )
		SetFlag( OwnerID() , 543653, 1 )
	end
end
----------------------------------------------------------------------
-----423032���� 114449��
---�d��@�� ��������Ȫ��H �i�J�|Ĳ�o�Q�l�����@��

function LuaS_423032_0()---���Ϊ���C
	SetPlot( OwnerID(), "range","LuaS_423032_1", 150 )
end
function LuaS_423032_1()---103295
	if	CheckAcceptQuest(OwnerID(),423032)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423032_1_PLUS" , 0 )
	end
end
function LuaS_423032_1_PLUS()
		local Obj = Role:new( TargetID()  )
		local BaseX = Obj :X()		
		local BaseY = Obj :Y();		
		local BaseZ = Obj :Z();		
		local BaseDir = Obj:Dir();		
		local DD= CreateObj(103295, BaseX+80, BaseY, BaseZ+80, BaseDir, 1 )        
		local CC= CreateObj(103295, BaseX+50, BaseY, BaseZ+50, BaseDir, 1 )  
		local KK= CreateObj(103295, BaseX+75, BaseY, BaseZ+75, BaseDir, 1 )  		      
		AddToPartition( DD,0)    
		AddToPartition( CC,0)
		AddToPartition( KK,0)  
		SetAttack( DD , TargetID()  )     
		SetAttack( CC , TargetID()  ) 
		SetAttack( KK , TargetID()  )
		Yell(  DD , "[SC_423032_1]" , 3 )---���ê�ƪ̤F�I
		sleep(10)
   		Yell(  CC , "[SC_423032_2]" , 3 )---�F���L�̧a�I     
		BeginPlot(DD,"LuaQ_421177_Sui",0)
		BeginPlot(CC,"LuaQ_421177_Sui",0)
		BeginPlot(KK,"LuaQ_421177_Sui",0)
		WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
end
---�b���W���d��@��   ���d�P�D �o��X�� �~��ݨ�����J
function LuaS_423032_2()	
	SetPlot( OwnerID(), "range","LuaS_423032_3", 150 )
end
function LuaS_423032_3()---103295
	if	CheckAcceptQuest(OwnerID(),423032)==true  then
		ScriptMessage(OwnerID() ,  OwnerID(),  1 , "[SC_423032_3]" , 0 )---�e��ǨӤ@�}�}�k�Ī�����n�C
		ScriptMessage( OwnerID() ,   OwnerID(), 0 , "[SC_423032_3]" , 0 )---
		SetFlag( OwnerID() , 543656, 1 )	
	end
end


----423033---��N����J�����汴�d
function LuaS_423033()---
---�إX�������� ����J
	Local KK = Lua_DW_CreateObj("flag" ,114574,780547,0,1 )
	Tell(TargetID(), KK,"[SC_423033_1]")
	sleep(40)
	Delobj(KK)
end

---------------------------------------------------------------------------------------
-------------423034-------�X�l�G780544
---�����@��
function LuaS_423034_1()	
	CloseSpeak( TargetID() )
	DisableQuest( OwnerID() , true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
---�إX ���کԡE�w��=FF   ����J==KK
	Local FF = Lua_DW_CreateObj("flag" ,114573,780544,0,1 )---114573
	Local KK = Lua_DW_CreateObj("flag" ,103296,780544,1,1 )
	DisableQuest( FF , true )
	DW_MoveToFlag( FF,780544,2, 0,1)
	AdjustFaceDir( FF , OwnerID() , 0 )
	Yell(  FF , "[SC_423034]" , 3 )--���.......����......�ڭ̳Q�a�Jŧ���A[114451]�j�j���F�O�@��......
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell(   OwnerID(), "[SC_423034_1]" , 3 )---�O�ַF���H�O���ӵs��ηF���H�i�D�ڡC	
	sleep(30)			
	Yell(  FF , "[SC_423034_2]" , 3 )---�O�K�K�̪�Ө���̪����s�a�J�K�K
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)
	Yell(  FF , "[SC_423034_3]" , 3 )---���M�n�H��L�̳����]�F�A���O[114451]�j�j�w�g�^���ӤF�K�K
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(30)	
	BeginPlot( KK, "LuaS_423034_2", 0)
	Yell(  FF , "[SC_423034_4]" , 3 )--������K�K
	PlayMotion( FF ,ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep(40)
	DW_MoveToFlag( FF,780544,0, 0,1)
	DisableQuest( FF , false )
	sleep(10)
	delobj(FF)
	while true do--�ˬd
	sleep( 10 )
	if	 CheckID(KK) == false   then  --���b���W�C
		DisableQuest( OwnerID() , false )
		SetPlot( OwnerID() , "touch" , "" , 0 )
		break
		end
	end
end

function LuaS_423034_2()	
	local Player = SearchRangePlayer ( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	CheckCompleteQuest( Player[i],  423034)==true and CheckAcceptQuest( Player[i], 423035)==false then
			Tell(player[i], OwnerID(),"[SC_423034_5]")----�A���o�{����u���ܡH
			sleep(30)
			ScriptMessage( player[i],  player[i],0 , "[SC_423032_6]" , 0 )---(�A�N��~�����p�V[103296]��z�C)
			sleep(30)
			Tell(player[i], OwnerID(),"[SC_423034_7]")---��A�o�ӧ����G�M�P�ȯZ�զ����C
			sleep(20)
			Tell(player[i], OwnerID(),"[SC_423034_8]")---�̦Ϫ����\�P�ѵ��K�K
			sleep(30)
			Tell(player[i], OwnerID(),"[SC_423034_9]")--[$PLAYERNAME]�A���o�Ӯɾ��A�߰ݥX�����P�ȯZ�դ��������p�a�I�ڷ|�b�t����U�A���C
			delobj(OwnerID())
		end
	end
	sleep(80)
	if	 CheckID(OwnerID()) == true then 
		delobj(OwnerID())
	end
end




------------------------------------------------------------------
-----423035---��ť�������W�J
function LuaS_423035()------
             	LoadQuestOption( OwnerID() )
	if 	(CheckAcceptQuest(OwnerID(),423035)==true )and  (CheckFlag(OwnerID(),543658)==false )then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423035_1]","LuaS_423035_1",0)    ---�ڵ������U�A�̡A���A�������i�D�کҦ����Ա��C
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423035_2]","LuaS_423035_2",0)    ---�ڤ��P�N�A�̪��ݪk�A�٬O���V����M�h�Φ^���o�Ӫ��A�a�I
	end
end

function LuaS_423035_1()------
	SetSpeakDetail( OwnerID(), "[SC_423035_3]"  )-----�Ա��H�o�n�q�󻡰_�H�N�����k�S��A�̷���M�h�Ϊ������g�ߤW�H�٬O�n�Ǹo��s�b�o�@�W���s��ΡH�n���O����M�h�Ϊ������g�ߤ[�[�~�ӳo�̨����A�ڭ̧����γ\���|���o�p���U���A�@���S�@�����s��v�h�Bŧ���A�����ۧ��������ߡA�A�[�W�j�N�x�����P�ȯZ�ջ�D�����@�СA�����N�ڭ̥��J�F�a���C ���T�A�b�j�N�x�����N�ȯZ�ժ��M�h�������A�ڭ̹L�ۤ@�q�ٺ�w�h���ͬ��A�ڭ̱q�S�Q��ڭ̥������o�q�w�h�ͬ��A�I�X��h���N���A�ȯZ�ժ��h�L���g�ӨӡA�o���L�̤��O�m�ܡA�ӬO���_�����D�A�n�ڭ��m�W�Ҧ����������⭿�A�L�̦Y�w�F�ڭ̵L�k�ϧܡA���N�k���A���e�L�̦��G�٦��ǧҼ�����M�h�ΡA����ڭ̱N�����~�S�A���{�b�K�K���򪺦��������h�A�ڭ̤���A�Ԩ��U�h�K�K
	SetFlag( OwnerID() , 543658, 1 )
end

function LuaS_423035_2()------
	SetSpeakDetail( OwnerID(), "[SC_423035_4]"  )---�A���a�I���ڴN���D����M�h�άO�L�k�̿઺�A�^�����ɶ��n��h�[�H�̫�u�|�H�H�⤣���Ӽŭl�ڭ̡A�A�̮ڥ��S��ڭ̧������ʩR�ݦb���̡C
	BeginPlot(TargetID(), "LuaS_423035_3", 0)	
end

function LuaS_423035_3()------
	Local KK = Lua_DW_CreateObj("flag" ,114574,780544,0,1 )
	if	CheckAcceptQuest( TargetID(),  423035)==true and  CheckFlag(TargetID(),543658)==false  then
		Tell(TargetID(),KK,"[SC_423035_5]")----��U�L�̡A���X���s�h�L�A�~����o��L�T���C
		sleep(10)
		Tell(TargetID(),KK,"[SC_423035_6]")---�ڷ|�q�Ǩ�U�A
	end
	sleep(50)
	delobj(KK)
end
-------------------------------------------------------------------
-----423036---�������@���C---���P��BUFF ��֦��o��BUFF�ݱo���t��������J---�ק�A�u���@�H�ݨ켯��J�C	
--function LuaS_423036_1()
---�إX�t���Ϊ�����J	�Q�κX�l780544�G3
---	DisableQuest( OwnerID() , true )	
---	Local MAK = Lua_DW_CreateObj("flag" ,114445,780544,3,1 )
--	AddBuff( TargetID(), 505985 , 1 , 11)
---	CastSpell( OwnerID()  , OwnerID()  , 495235 )---�ˬd�O���O����423036 �O���O�|���� 423037   �Q��505985�Ӷi��P�_
--	DW_MoveToFlag( MAK,780544,4, 0,1)
--	Yell(  MAK, "[SC_423036_1]" , 3 )----����J�G�ڷPı�o�X���ѲV�ê������A�G��C
--	sleep(30)
--	Yell( OwnerID() , "[SC_423036_2]" , 3 )---��Q�G�A�O����H�H
--	sleep(30)
--	Yell(  MAK, "[SC_423036_3]" , 3 )---����J�G�کM[$PLAYERNAME]�A�O���A���O�Ө�U�A�̪��H�C
--	SLEEP(20)
--	Yell( OwnerID() , "[SC_423036_4]" , 3 )---��Q�G�ܦn�A���ڭ̾ĤO�@�ԧa�I
--	delobj(MAK)
--	DisableQuest( OwnerID() , false )
---end

---780544���ˬd
---function LuaS_423036_2()
--	if  CheckCompleteQuest( TargetID(), 423036) ==true and CheckAcceptQuest( TargetID(), 423037 )==false then
--		return true
--	end
--		return false
--end

------------------------------------------------------------------
----423038----
-----�üƹ�ܺt��
---�@�}�l����� �M��t�� �٭n�ˬdNPC�O�_�٦b�ʧ@

------�������
--function LuaI_114576()---��l�@��
--	local Num = DW_Rand(2)
--	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )

--end
function LuaS_114576_0()
	local String = {"[SC_114576_1]" , "[SC_114576_2]"  }---��ܫe������
	SetSpeakDetail( OwnerID(), String[DW_Rand(2)] )
		if CheckAcceptQuest( OwnerID() , 423038 ) == true then
			AddSpeakOption( OwnerID() , TargetID() , "[SC_114576_0]" , "LuaS_114576_1",0 ) --�аݧA���S���ݨ�ȯZ�ջ�D[103292]�H
		end
end

function LuaS_114576_1()
	local LUA = {"LuaS_114576_2" , "LuaS_114576_3"  }
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(),  LUA[PID], 0)
end
function LuaS_114576_2()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114576_4]",3)---�S���A���L�A��L������H
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	YELL( OwnerID() , "[SC_114576_5]",3 )---	���L���ؤH���Ӯ����F�A�̦n���F��F�I
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_BUFF_BEGIN)	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_6]",3 )----���L�������M�h�ηm�T�ۤv�H���]�t�٧@��D�C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL( OwnerID() , "[SC_114576_7]",3 )--�کA��²����j�s���٭n���p�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)		
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_8]",3 )---�A�̦n���O�L��U���H�A�_�h�ڤ��ѴN�N���o�䪺�~�����B�A�C
	sleep(30)	
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423038)==true and    CheckFlag( Player[i], 543660 )==false	then
			SetFlag(Player[i], 543660,1)
		end
	end
	DisableQuest( OwnerID() , false )
end
function LuaS_114576_3()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114576_9]",3)---����[103292]���өU���٨S���ܡH
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_CRITICAL )	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_10]",3)---�o�򻡨ӡA�ګe�}�l�٦��ݨ��L���Ʃx[103293]�b������̡C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE2 )	
	sleep(30)
	YELL( OwnerID() , "[SC_114576_11]",3)---�Ӧ��A���Ǫ��Q�i���@�Ӥ�@���٭n�V�b�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)
	sleep(30)
	YELL( OwnerID() , "[SC_114576_12]",3)--�ר�O[103293]�C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_13]",3)---�b�L����[103292]��A���ڭ̥ͬ�����[�}�x�B�h�W�C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_14]",3)---�i�c�A�ڨ��ѯu�ӽĤW�h�ŤF�L�C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_ATTACK_1H_SP)	
	sleep(30)	
	YELL( OwnerID() , "[SC_114576_15]",3)---�N���������ǥi�c���s��@�ˡC
	
	local Player = SearchRangePlayer ( OwnerID() , 150 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( Player[i],   423038)==true   and  CheckFlag( Player[i], 543661 )==false	then
			SetFlag(Player[i], 543661,1)
		end
	end
	sleep(30)	
	DisableQuest( OwnerID() , false )
end	
--------	
function LuaI_114611()---��l�@��
	local Num = DW_Rand(2)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , Num )
end
 function LuaS_114611_0()
	local String = {"SC_114611_1" , "SC_114611_2" , "SC_114611_3"  }---��ܫe������
	SetSpeakDetail( OwnerID(), "["..String[DW_Rand(3)].."]" )
	if CheckAcceptQuest( OwnerID() , 423038 ) == true then
		AddSpeakOption( OwnerID() , TargetID() , "[SC_114576_0]" , "LuaS_114611_2",0 ) --�аݧA���S���ݨ�ȯZ�ջ�D[103292]�H
	end
end

function LuaS_114611_2()
	CloseSpeak( OwnerID() )
	local LUA = {"LuaS_114611_3" , "LuaS_114611_4"  }
	local PID = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	BeginPlot( TargetID(),  LUA[PID], 0)
end

function LuaS_114611_3()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	yell( OwnerID() , "[SC_114611_4]",3)---�S���K�K�S���K�K
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	sleep(30)
	YELL( OwnerID() , "[SC_114611_5]",3)---�ڤ��򳣤����D�A���򳣨S�ݨ��C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	sleep(30)
	SetFlag( TargetID() , 543662, 1 )
	DisableQuest( OwnerID() , false )
end

function LuaS_114611_4()
	DisableQuest( OwnerID() , true )
	AdjustFaceDir( OwnerID()  , TargetID(), 0 )
	YELL( OwnerID() , "[SC_114611_6]",3)---�A.......�O����D[103292]�ܡH
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1)	
	sleep(30)
	YELL( OwnerID() , "[SC_114611_7]",3)---�S���K�K�S�ݨ��C
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)	
	SetFlag( TargetID() , 543662, 1 )
	sleep(30)
	DisableQuest( OwnerID() , false )
end
------------------------------
---------------------------------------------------------------------
------------423043
function LuaS_423043()
             	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423043)==true )and (CheckFlag(OwnerID(),543725)==false ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_1]","LuaS_423043_1",0)---[ZONE_YGGNO LAND]
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421962_2]","LuaS_423043_1",0)---[ZONE_YGGNO LAND]
	end
	if (CheckAcceptQuest(OwnerID(),423049)==true )and  (CheckFlag(OwnerID(),543726)==false ) and CheckBuff(OwnerID(),505987)==false then
		 AddSpeakOption(OwnerID(),TargetID(),"[SC_423049_1]","LuaS_423049_1",0)----�A���Q�줰��n��k�ܡH
	end

	if  (CheckAcceptQuest(OwnerID(),423045)==true )and CountBodyItem( OwnerID(), 206801)==0 then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_4]","LuaS_423043_2",0)
	end

	if  (CheckAcceptQuest(OwnerID(),423048)==true )and CountBodyItem( OwnerID(), 206806)<4  then
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423043_5]","LuaS_423043_3",0)
	end
end

function LuaS_423043_2()
	SetSpeakDetail(OwnerID(),"[SC_423043_3]")
	GiveBodyItem( OwnerID(), 206801, 1 )
end
function LuaS_423043_3()
	SetSpeakDetail(OwnerID(),"[SC_423043_6]")
	GiveBodyItem( OwnerID(),206805, 1 )
end
function LuaS_423043_1()
	SetSpeakDetail(OwnerID(),"[SC_423043_2]")
	SetFlag( OwnerID() , 543725, 1 )
end

----------------------------------------------------------------------------------------------
---------------423046
---��ܼ@��
function LuaS_423046()--
	if CheckCompleteQuest(OwnerID(),423046)==true then
			SetSpeakDetail(OwnerID(),"[SC_423046_8]")
	else
             	LoadQuestOption( OwnerID() )
    end
	if (CheckAcceptQuest(OwnerID(),423046)==true )and (CountBodyItem( OwnerID(), 206804)<1) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_1]","LuaS_423046_1",0)-----�ڬO�Ӭ�[114614]���^�L�����y[206804]�C
	end
end

function LuaS_423046_1()
	SetSpeakDetail(OwnerID(),"[SC_423046_2]")---��~[114614]���ӨS�Ϊ����f�A�ש��٬O�@����ʤl�F�H����[206804]�����N�O�ڳz�L���Y�n���e���~�VS.S.S.E�߰ݨ쪺�A�O�L�����D�Τ���˨�������q��S.S.S.E�~�Ѩç�ѽ浹�F�L�C�o�˧A�٭n���L�ܡH
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_3]","LuaS_423046_2",0)---�L�צp��m�H�F��N�O����I
	AddSpeakOption(OwnerID(),TargetID(),"[SC_423046_4]","LuaS_423046_3",0)---(�٬O�����n�S�L�n�F�C)
end
function LuaS_423046_2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID(), "LuaS_423046_4", 0)
end
function LuaS_423046_4()
	DisableQuest(OwnerID(),true)	
	Hide(OwnerID())
--�إ߾԰��δ��� &����԰���d�s�����D &���w�ؼ� &��������
	local NPC = Lua_DW_CreateObj("obj",103300,OwnerID())
	WriteRoleValue(NPC  ,  EM_RoleValue_PID , OwnerID())
	SetPlot(NPC,"dead","LuaS_423046_5",0)
	Say(NPC,"[SC_423046_5]")---�ݼˤl�Ať�����H�ܡA�u��ή��Y���Ať�ܤF�C
	BeginPlot(NPC,"LuaS_Discowood_CheckPeace",0)
	Lua_Drama_Radar( NPC , 423046 ) 
	SetAttack(NPC,TargetID())
--�ˬd��ɵ���
	while	CheckID(NPC)  and ReadRoleValue( NPC , EM_RoleValue_IsDead  )== 0	do
		sleep(10)
		if Lua_Check_Drama_Statu( NPC ) == false then
			DelObj( NPC )
			break
		end
	end
----�{�X���L	&���Ҥ���
	Show(OwnerID(),0)
	if  	CheckBuff(OwnerID(), 504004)==true then
		say(OwnerID(),"[SC_423046_6]")---���n���F~�w�g���F�I���n�A���F�I
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)		
		sleep(10)
		CancelBuff( OwnerID(), 504004 )
	end
	sleep(10)
	DisableQuest(OwnerID(),false)
end

function LuaS_423046_5() --���`�@�� �������X��
	local MM = ReadRoleValue( OwnerID() , EM_RoleValue_PID  )
	local Tar
	for i=0,HateListCount(OwnerID())-1,1	do
		Tar = HateListInfo(OwnerID() ,i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest(Tar,423046)== true	and	(CountBodyItem( Tar, 206804)<1) then
			GiveBodyItem( Tar, 206804, 1 )
		end
	end
	AddBuff( MM , 504004 , 0 , 10 )
	sleep(10)
	DelObj(OwnerID())
---	BeginPlot(OwnerID(),"LuaS_423046_6",0)
---	return  false
end
---function LuaS_423046_6() --
---	Hide(OwnerID())
--	Show(MM,0)
---	DisableQuest(MM,true)	
---	say(MM,"[SC_423046_6]")---���n���F~�w�g���F�I���n�A���F�I
---	PlayMotion( MM , ruFUSION_ACTORSTATE_EMOTE_BEG)		
---	sleep(10)
---	DisableQuest(MM,false)
		----SetRoleCamp( Rouge , "Visitor" )
---		PlayMotion( MM, 	ruFUSION_ACTORSTATE_EMOTE_SURRENDER	)
---		say(OwnerID(),"[SC_423046_6]")---���n���F~�w�g���F�I���n�A���F�I
---		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_BEG)		
---		sleep(20)
--		DelObj(OwnerID())
---end
function LuaS_423046_3()
	SetSpeakDetail(OwnerID(),"[SC_423046_7]")---���մN�n�A�b���٨S�o��e�A�A�̦n�u�o�����C
end
---------------------------------------------------------------------
-------423047
------�������ȫ�@��

function LuaS_423047_1()
	if CountBodyItem( OwnerID(), 206802)<1  then
		GiveBodyItem(  OwnerID(), 206802, 1 )
		return 1
	end
	if 	 CountBodyItem( OwnerID(), 206803)<1 then
		GiveBodyItem(  OwnerID(), 206803, 1 )
		return 1
	end
	if 	 CountBodyItem( OwnerID(), 206803)>=1 and CountBodyItem( OwnerID(), 206802)>=1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423047_5]", 0 )
		return 1
	end
end

function LuaS_423047()---�������Ȫ��t�� �Q�κX�l780544�G3
	DisableQuest( OwnerID() , true )
	Local KK = Lua_DW_CreateObj("flag" ,114626,780544,3,0 )
	SetModeEx(KK ,EM_SetModeType_ShowRoleHead ,true) -----------�q�X�Y����
	SetModeEx(KK ,EM_SetModeType_HideName ,false) -----------�q�X�W��
	AddToPartition(KK,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	DW_MoveToFlag( KK,780544,4, 0,1)
	Yell( KK, "[SC_423047]", 3 )--�������G[114614]�K�K�A������ŹT���A���D�����I�٦��ܡH
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(), "[SC_423047_1]", 3)---[114614]�G�S�F�A��観�ӶQ�ڷȹL�ӶR�ѮɡA���K�⥦�R���F�C
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(),  "[SC_423047_2]", 3 )---[114614]�G�X�G�ڷN�ƪ��ȿ��A���A�q�ڽ�F�h�ֿ��H
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( KK, "[SC_423047_3]", 3 )---�������G�h�ֿ��H
	PlayMotion( KK ,ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Yell( OwnerID(),  "[SC_423047_4]", 3 )---[114614]�G5�U���A���������A�������J�I
	PlayMotion( OwnerID() , ruFUSION_MIME_EMOTE_LAUGH)	
	sleep(30)
	delobj(KK)
	DisableQuest( OwnerID() , false )
end