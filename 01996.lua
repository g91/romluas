----����[116252]����ܡC
function LuaS_423498()------
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)>=1   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_1",0) ----(�аݳ̪�o�o�ͤF����ƶܡH)
	else
		LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_1()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544347, 1 ) 	
		GiveBodyItem( OwnerID() ,208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544347, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544347, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_2]"  )---
end
----����[116253]����ܡC
function LuaS_423498_2()
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true )and    (CheckFlag(OwnerID(),544351)==false )   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_3",0) ----(�аݳ̪�o�o�ͤF����ƶܡH)
	else	LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_3()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544351, 1 ) 	
		GiveBodyItem( OwnerID() , 208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544351, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544351, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_3]"  )---
end
----����[116254]����ܡC
function LuaS_423498_4()
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true )and    (CheckFlag(OwnerID(),544352)==false )   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_5",0) ----(�аݳ̪�o�o�ͤF����ƶܡH)
	else	LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_5()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544352, 1 ) 	
		GiveBodyItem( OwnerID() , 208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544352, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544352, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_4]"  )---
end
------�P�d����(116251)����
function LuaS_423498_6()
	if CheckAcceptQuest(OwnerID(),423498)==true  and    CountBodyItem( OwnerID() , 208106)==0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_20]","LuaS_423498_KK",0) ----(�аݳ̪�o�o�ͤF����ƶܡH)
	end
	if (CheckAcceptQuest(OwnerID(),423498)==true )and CountBodyItem( OwnerID() , 208109)>=1 and CountBodyItem( OwnerID() ,208108 )>=1 and CountBodyItem( OwnerID() , 208107)>=1 and (CheckFlag(OwnerID(),544353)==false )  then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422498_5]","LuaS_423498_7",0)---(�o�ǬO�ڸ߰ݪ����G�C)
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422498_5]","LuaS_423498_8",0)---(�o�ǬO�ڸ߰ݪ����G�C)
			end	
	end
	LoadQuestOption( OwnerID() )
end
function LuaS_423498_KK()----
	SetSpeakDetail(OwnerID(),"[SC_423498_21]")---��K�ܦn�A�ڳ��ݹL�F�A�A�����ۡI�ڭ��ݨ�[116191]�����v�F�A���b�o�̵����I�ݷ|���ӴN�|�X�ӤF�I
	GiveBodyItem( OwnerID() , 208106 ,1)	
 end
function LuaS_423498_7()----
	SetSpeakDetail(OwnerID(),"[SC_423498_6]")---��K�ܦn�A�ڳ��ݹL�F�A�A�����ۡI�ڭ��ݨ�[116191]�����v�F�A���b�o�̵����I�ݷ|���ӴN�|�X�ӤF�I
 end
function LuaS_423498_8()----	
	CloseSpeak( OwnerID() )
	if  ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423498_9" , 0)
	end
end	
function LuaS_423498_9()----�إX�V�@�j���� 780545
	local KK = Lua_DW_CreateObj("flag" ,116187,780545,1,0)---�إX�@�Ӵx��������NPC���]���C
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
--	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---�⪱�a�g����Y
	BeginPlot( KK , "LuaS_423498_10" , 0 )
	local Player = SearchRangePlayer( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423498 ) == true ) and CheckFlag( player[i],544353)==false and CountBodyItem( Player[i] , 208109)>=1 and CountBodyItem(Player[i] ,208108 )>=1 and CountBodyItem( Player[i] , 208107)>=1 and CheckBuff( player[i]  ,507509)==false  then
			AddBuff(player[i] ,507509,1,70)
		end
	end	
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423498_10()----116257 ���ĵY 116256 ����J
	local CL= Lua_DW_CreateObj("flag" ,116257,780545,2,0 )
	local MORK = Lua_DW_CreateObj("flag" ,116256,780545,3,0 )
	local CK = Lua_DW_CreateObj("flag" ,116258,780545,4,1 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CL) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,MORK)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,CK) 	
	BeginPlot( OwnerID() , "LuaS_423498_11" , 0 )
	DisableQuest( CK ,true )
	DisableQuest( CL ,true )
	DisableQuest( MORK ,true )
	Say(CK,"[SC_423498_7]")--��A�o�Ǹ�Ƨڳ��ݹL�F�K�A�����ۡC
---bow_parry buff01
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
	Say(CK,"[SC_423498_8]")--[116191]�L�����ӭn�X�ӤF�C
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	AddToPartition( MORK , 0 )
	AddToPartition( CL , 0 )
	DW_MoveToFlag( MORK,780545,5, 0,1)
	DW_MoveToFlag( CL,780545,6, 0,1)
AdjustFaceDir( MORK ,CL  , 0 )
	YELL(MORK,"[SC_423498_9]",4)-----�p��ߦn�F�I�ڷ|���p��^�p�����H�K
PlayMotion(MORK ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	YELL(CL,"[SC_423498_10]",4)---��A���N�·ЧA�F�C
PlayMotion(CL ,  ruFUSION_ACTORSTATE_EMOTE_SALUTE2     )
	sleep(40)
	YELL(CL,"[SC_423498_11]",4)---��F�I�A���o�n���ڪ������K�Ʀܤ]�m��O�S�K���ڤ��T�Q�_�y�Ǧb�a�̪����Ӷǻ��K
PlayMotion(CL ,   ruFUSION_ACTORSTATE_EMOTE_POINT      )
	sleep(40)
	YELL(MORK,"[SC_423498_12]",4)---��˪��ǻ��H
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_13]",4)--- �L�h���k�����P��s���s�����ʪ��ǻ��K�ڸ̪��H�����o�ä��O���ܤF�A�ӬO�����F�s���K
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_14]",4)--�ҥH�C���ڸ̵o�ͤF����ơA���|��@������٭n�ۤߪ��^�D�s�������U�K���]�_�ǡA���G�Q���F��K
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(50)
	YELL(MORK,"[SC_423498_15]",4)---�O�ܡH���o��@�^�ơH
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_16]",4)----�ڡI�ѰڡI�ɶ���F�A���n�N��A�ڬ��F�H�A�ڱo�������@�U�A���|���K
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_WAVE)
	sleep(10)
	DW_MoveToFlag( CL,780545,7, 0,1)
	delobj(CL)
	sleep(20)
	YELL(MORK,"[SC_423498_17]",4)---��K
	local Player = SearchRangePlayer( OwnerID() , 450 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423498 ) == true ) and CheckFlag( player[i],544353)==false and CountBodyItem( Player[i] , 208109)>=1 and CountBodyItem(Player[i] ,208108 )>=1 and CountBodyItem( Player[i] , 208107)>=1 and CheckBuff( player[i]  ,507509)==true  then
		SetFlag( Player[i] ,544353, 1 ) 
		CancelBuff( player[i] , 507509)
		end
	end
	delobj(MORK)
	delobj(CK)
	delobj(OwnerID())
end
function LuaS_423498_11()
	local CL = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423498 ) == true	and
				CheckFlag( Group[K], 544353) == false and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423498 ) == true	and
				CheckFlag( Group[K], 544353) == false and GetDistance( Group[K] , OwnerID() ) >300		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
				CancelBuff( Group[K], 507509)		
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(CL)
	delobj(MORK)
	delobj(CK)
	delobj(OwnerID())
end
---�������Ȫ�
function LuaS_423498_12()
	local MORK = Lua_DW_CreateObj("flag" ,116195,780545,1,0 )
	DisableQuest( MORK ,true )
	Lua_ObjDontTouch(  MORK)
	Tell (TargetID() , MORK ,  "[SC_423498_18]" )---�A�̦b�o��n�A[116244]�L�̦��G�o�{�F����K�ڷQ�ЧA�P[116251]����P�L�̷|���n�ܡK
	sleep(20)
	delobj( MORK)
end


function LuaS_423498_13()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423498)==false ) and ( CountBodyItem( OwnerID() , 208109)>=1 or  CountBodyItem( OwnerID() ,208108 )>=1 or  CountBodyItem( OwnerID() , 208107)>=1 ) then
		 if  	CountBodyItem( OwnerID() , 208109)>=1 then
		  	 DelBodyItem( OwnerID() , 208109 , 1)
		end
		 if  	CountBodyItem( OwnerID() , 208108)==1 then
		  	 DelBodyItem( OwnerID() , 208108 , 1)
		end
		 if  	CountBodyItem( OwnerID() , 208107)==1 then
		  	 DelBodyItem( OwnerID() , 208107 , 1)
		end
	
	end
end
--------------------------------------------------------
----���b�d�������W
function LuaS_423500()------
	if (CheckAcceptQuest(OwnerID(),423500)==true )and CheckFlag(OwnerID() , 544355) == false  and CheckFlag(OwnerID() , 544354) == false then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423500_1]","LuaS_423500_1",0) ----(�а�...)
	elseif (CheckAcceptQuest(OwnerID(),423500)==true ) and CheckFlag(OwnerID() , 544354) == false and CheckFlag(OwnerID() , 544355) == true and CountBodyItem(OwnerID() , 208112)<5 then
		SetSpeakDetail( OwnerID(), "[SC_423500_2]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423500)==true ) and CheckFlag(OwnerID() , 544354) == false and CheckFlag(OwnerID() , 544355) == true and CountBodyItem(OwnerID() , 208112)>=5 then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423500_3]","LuaS_423500_2",0)---(���5��[<S>208112]��[116286]�C)
	else
		LoadQuestOption( OwnerID() )
	end
end
function LuaS_423500_1()------
	SetSpeakDetail( OwnerID(), "[SC_423500_2]"  )---
	SetFlag(OwnerID() ,544355, 1 ) 
end
function LuaS_423500_2()------
	SetSpeakDetail( OwnerID(), "[SC_423500_4]"  )---�άO���o
	SetFlag(OwnerID() ,544354, 1 ) 
end
function LuaS_423500_3()------780748
	AddBuff(TargetID(),507510,1,60)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local CK= Lua_DW_CreateObj("flag" ,116290,780748,1,1 )
	local STAR = Lua_DW_CreateObj("flag" ,116291,780748,2,0 )
	PlayMotionEX( STAR , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	DisableQuest( CK ,true )
	DisableQuest( STAR ,true )
	AddToPartition( STAR,0)   
	AddBuff(STAR,507513,1,30)	
	Say(CK,"[SC_423500_5]")---���ξ��...���ή`��...
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_KISS )
	sleep(30)
	DW_MoveToFlag( CK,780748,3, 0,1)
	PlayMotionEX( CK  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(CK,"[SC_423500_6]")---�ڥu�O�n��v�A���ˤf�C
	sleep(30)
	Say(STAR,"[SC_423500_7]")---�@�㨺��N���q���p�q�R�C
	sleep(30)	
	CancelBuff( STAR , 507513)
	PlayMotion( CK  , ruFUSION_ACTORSTATE_CROUCH_END)
	Say(STAR,"[SC_423500_8]")----����O�A�H[115391]�A�S�����F�I
	sleep(30)
	Say(CK,"[SC_423500_9]")---��ӧA�̻{�ѰڡH�����A�o�U�i������~�|�H�a�F�H
	sleep(10)
	DW_MoveToFlag( CK,780748,1, 0,1)
	sleep(10)
		if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507510)
	end
	delobj(CK)
	delobj(STAR)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
	
---------------------------------------------------------------------------------
function LuaS_423501()------
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423501_1]","0xff008000" )--[116289]����b�A��äW�ƹL...�A�Pı�B�D...
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423501_1]", "0xff008000"  )--
end
----------------------------------------------------------------
------------------
function LuaS_423504_1()-----
	AddBuff(TargetID(),507511,1,60)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local CK= Lua_DW_CreateObj("flag" ,116300,780749,1,1 )
	local STAR = Lua_DW_CreateObj("flag" ,116302,780749,2,1 )	
	local MORK = Lua_DW_CreateObj("flag" ,116301,780749,3,1 )
	DisableQuest(  STAR  ,true )	
	DisableQuest(  CK  ,true )	
	DisableQuest(   MORK   ,true )	
	Say(STAR,"[SC_423504_1]")---�P�~�v���o�X���⪺���~�I
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(STAR,"[SC_423504_2]")--�P�ڬ۳s���t�ԡA�@Ĳ�Y�o...
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Say(MORK,"[SC_423504_3]")---���g�Q[115375]���h�O�q��[103129],�]�\�|�O�u�z���⪺�ؼФ��@�C
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep(30)
	Say(MORK,"[SC_423504_4]")---�ڤ��৤�����ޡI�ר�O�o����S������I�I���h�L�X�S...
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_APPROVAL   )
	sleep(30)
	Say(MORK,"[SC_423504_5]")----�s���������ơA�s�ڥ����^���P���C
	sleep(30)
	Say(CK,"[SC_423504_6]")----���F�I�ڳ����D�F�A�o�ǫĤl�A�@�I�����L���~����L�̪��L�̡C
PlayMotion(CK,   ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	sleep(30)
	Say(CK,"[SC_423504_7]")---�@�y�@�y����ӨӡA�n�o�ڪ��Y���n�z���F�I
	sleep(30)
		if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507511)
	end
	sleep(10)
	delobj(CK)
	delobj(STAR)
	delobj(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
---------------------------------------------------------------------
---���O����
function LuaS_423505_USECHECK()------780750
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if	  CountBodyItem( OwnerID(), 208135 )<1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505]", 0 )--�ʥF[208135]�A�]�ۤ����S���_���󪺤����C
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505]", 0 )--�ʥF[208135]�A�]�ۤ����S���_���󪺤����C
			return -1
	end
	if	 ( OrgID == 116304 )    and (CheckAcceptQuest(OwnerID(),423505)==true ) and  CountBodyItem( OwnerID(),  208132)>=1 then  
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505_1]", 0 )--
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505_1]", 0 )--
			return -1
	end
	if	( OrgID == 116305)	    and	(CheckAcceptQuest(OwnerID(),423505)==true ) and  CountBodyItem( OwnerID(), 208133)>=1 then  
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505_2]", 0 )--�A�w��o�]�ۤ�
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505_2]", 0 )--�A�w��o�]�ۤ�
			return -1
		end
		return 1
end
function LuaS_423505_USEOK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		if ( OrgID == 116304 ) then
			if	(CheckAcceptQuest(OwnerID(),423505)==true ) then 
				BeginPlot( TargetID(),"LuaS_423505_1", 0)
				return 1
			end
			return -1
		end
		if ( OrgID == 116305) then
			if	(CheckAcceptQuest(OwnerID(),423505)==true ) then 
				BeginPlot( TargetID(),"LuaS_423505_2", 0)
				return 1
			end
			return -1
		end		
end
function LuaS_423505_1()
	DisableQuest(  OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,116187,780750,1,0 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	BeginPlot( KK , "LuaS_423505_4" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					DisableQuest(  OwnerID() ,false ) 
					SetPlot( OwnerID() , "touch" , "" , 50 )
			break
		end
	end
end

function LuaS_423505_4()----116321 �d���� 116199 ��n�h
	local CK= Lua_DW_CreateObj("flag" ,116321,780750,2,1 )
	local FSD = Lua_DW_CreateObj("flag" ,116199,780750,3,1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,FSD)
	DisableQuest( CK ,true )
	DisableQuest( FSD ,true )
	BeginPlot( OwnerID() , "LuaS_423505_5" , 0 )
	Say(CK,"[SC_423505_1_1]")--�o�N�O�ǻ����Q[115375]�ܨ��a���O���a�s�H
PlayMotion(CK,   ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Say(CK,"[SC_423505_1_2]")---�ݰ_�ӡA�S���Q�����������C 
PlayMotion(CK,    ruFUSION_ACTORSTATE_EMOTE_LAUGH  )
	sleep(30)
	Say(FSD,"[SC_423505_1_3]")--�O���H���ߡA�N�Ⱓ�h�F�a���O�A�e���O���a���Q���C  
PlayMotion(FSD,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(30)
	Say(FSD,"[SC_423505_1_4]")--���������z���H���e�s���A�γ\�ڭ̪��@�|�@�ʳ��w�g�`�`�L�J�e���������F�C
PlayMotion(FSD,     ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep(30)
	Say(FSD,"[SC_423505_1_5]")--���s�q�`���㦳�o�򰪪����z�A�e�@�w�O���F�ܤ[�A�u�Q�ݬݨe�쩳�g���L�F����C
PlayMotion(FSD,     ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	SLEEP(30)
	Say(CK,"[SC_423505_1_6]")---�ҥH�o�N�O�A�Q�ӳo��s���ت��H
PlayMotion(CK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(FSD,"[SC_423505_1_7]")--�e�֦��`�誺�O�q�A�H�ί��ٯ��֤���...�O���o�@������s��H�C
PlayMotion(FSD,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	Say(CK,"[SC_423505_1_8]")---�o�Ӧn�A������s��ơA�ǥѬ�s�A���@�w�ڭ��٥i�H�]�����t�@�����Z�L�_�����s�֦����z�C
PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_WAVE)
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423505 ) == true   and CountBodyItem( Player[i] , 208132)==0  and CountBodyItem(Player[i] ,208135 )>=1  then
			GiveBodyItem(  player[i]  , 208132 ,1)	
		end
	end
	delobj(FSD)
	delobj(CK)
	delobj(OwnerID())
end

function LuaS_423505_5()
	local CK= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local FSD = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)---
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
				CountBodyItem( Group[K] , 208132)==0  and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
-----			if	CheckAcceptQuest( Group[K], 423505 ) == true	and CountBodyItem( Group[K] , 208132)==0 and GetDistance( Group[K] , OwnerID() ) >300		then
----				ScriptMessage( Group[K], Group[K], 1 , "[SC_423191_A_7]" , 0 ) --�W�X�Z���A�z�ݭn�a��@�I,�[�ݼ@���C�C
----				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_A_7]" , 0 )--- -�W�X�Z���A�z�ݭn�a��@�I,�[�ݼ@���C	
---			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(FSD)
	delobj(CK)
	delobj(OwnerID())
end
----�ĤG��
function LuaS_423505_2()
	DisableQuest(  OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,116187,780750,7,0 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	BeginPlot( KK , "LuaS_423505_6" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				DisableQuest(  OwnerID() ,false )
				SetPlot( OwnerID() , "touch" , "" , 50 )
			break
		end
	end
end

function LuaS_423505_6()----�إX�z�����ү��箦116320�B�ɦ�X�w116319�B�d�����S116322
	local MSR= Lua_DW_CreateObj("flag" ,116320,780750,8,1)
	local SCM = Lua_DW_CreateObj("flag" ,116319,780750,9,1)
	local CA = Lua_DW_CreateObj("flag" ,116322,780750,10,1 )
	SetDefIdleMotion(SCM,  ruFUSION_ACTORSTATE_NORMAL )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,MSR) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,SCM)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,CA)
	BeginPlot( OwnerID() , "LuaS_423505_7" , 0 )
	DisableQuest( CA ,true )
	DisableQuest( SCM ,true )
	DisableQuest( MSR ,true )
	Say(MSR,"[SC_423505_2_1]")--���F�e...�o���@�c�h�ݪ��a�s�A�`���F�L�ƪ��H���C
CastSpell( MSR,MSR, 495919 )----
	sleep(30)
	Say(MSR,"[SC_423505_2_2]")--���褣���e�A�٭n�A���h�[�H
CastSpell( MSR,MSR, 495919 )----
	Sleep(30)
	Say(CA,"[SC_423505_2_3]")--���A�ڻP�s�ڬ��w�A�ä��O�o�˪�...
PlayMotion(CA,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	Say(CA,"[SC_423505_2_4]")--�ڥu�ǳƩ�����e���������O�C
	Sleep(30)
	Say(SCM,"[SC_423505_2_5]")--���O�n�F�I���W�A���a�I ruFUSION_ACTORSTATE_BUFF_SP01 
PlayMotion(SCM,    ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep(30)
	Say(SCM,"[SC_423505_2_6]")---���N�e���Ѫ��ܡA�A�n���l���e���������O�H
	Sleep(30)
	Say(MSR,"[SC_423505_2_7]")---�����ܻ��b�e�Y�A�ڥi���౱��ڪ��O�q�C
PlayMotion(MSR,   ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(30)
	Say(CA,"[SC_423505_2_8]")---�����e���������O��A�N��e�@���͸��a�I
PlayMotion(CA,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	Say(CA,"[SC_423505_2_9]")---�o�~�O�u�����Ť������O����k�C
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423505 ) == true   and CountBodyItem( Player[i] , 208133)==0  and CountBodyItem(Player[i] ,208135 )>=1  then
			GiveBodyItem(  player[i] , 208133 ,1)	
		end
	end
	BeginPlot( MSR , "LuaS_423505_8" , 0 )
	BeginPlot( SCM , "LuaS_423505_8" , 0 )
	BeginPlot( CM , "LuaS_423505_8" , 0 )
	sleep(60)
	delobj(SCM)
	delobj(MSR)
	delobj(CA)
	delobj(OwnerID())	
end
function LuaS_423505_8()
	DW_MoveToFlag(OwnerID() ,780750,11, 0,1)
end
function LuaS_423505_7()
	local MSR= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local SCM = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)---
	local CA = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)---
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
				CountBodyItem( Group[K] , 208133)==0  and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
----			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
----				CountBodyItem( Group[K] , 208133)==0 and GetDistance( Group[K] , OwnerID() ) >300		then
---				ScriptMessage( Group[K], Group[K], 1 , "[SC_423191_A_7]" , 0 ) --�W�X�Z���A�z�ݭn�a��@�I,�[�ݼ@���C�C
----				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_A_7]" , 0 )--- -�W�X�Z���A�z�ݭn�a��@�I,�[�ݼ@���C	
-----			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(SCM)
	delobj(MSR)
	delobj(CA)
	delobj(OwnerID())
end







