function LuaS_423491_0()----
	if	CheckAcceptQuest( OwnerID() , 423491) == true  and CountBodyItem( OwnerID() ,208100 )>=5 and  (CheckFlag(OwnerID(),544340)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423491_0]","LuaS_423491_1",0)---��[116183]�ܤU[208100]�C
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423491_0]","LuaS_423491_2",0)---��[116183]�ܤU[208100]�C
			end				
	elseif	CheckAcceptQuest( OwnerID() , 423491) == true  and CountBodyItem( OwnerID() ,208100 )<5   and  (CheckFlag(OwnerID(),544340)==false) then
		SetSpeakDetail(OwnerID(),"[SC_423491_3]")---(�γ\�A�ӥ����^5��[<S>208100]�A�A��e��[116183]�ܤU�C)
	else	LoadQuestOption( OwnerID() )
	end
	
end
function LuaS_423491_1()----
   SetSpeakDetail(OwnerID(),"[SC_423491_2]")---�o�O����H���ܡH���O���٤����A�ҥH�ڤ��Q�ܡA�A�n���n���ܩO�H
 end
function LuaS_423491_2()----	
	CloseSpeak( OwnerID() )
	if CountBodyItem( OwnerID() ,208100 )>=5 and ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		DelBodyItem( OwnerID() , 208100 , 5)
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423491_3" , 0)
	end
end
function LuaS_423491_3()----BUFF507503 AddBuff(OwnerID(),507503,1,50)  FLAG--780698
	local KK = Lua_DW_CreateObj("flag" ,116187,780804,1,0 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---�⪱�a�g����Y
	BeginPlot( KK , "LuaS_423491_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end

function LuaS_423491_4()---CK �O�d����116184 LB�O�ҫk116185 MORK �O����J116186  	AddToPartition( MT , 0 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	AddBuff(player,507503,1,60)
	local CK = Lua_DW_CreateObj("flag" ,116184,780804,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116185,780804,3 ,1)---
	local MORK= Lua_DW_CreateObj("flag" ,116186,780804,5 ,0)---
	SetModeEx(MORK,EM_SetModeType_Gravity,false) 
	WriteRoleValue(MORK,EM_RoleValue_Y,850)	
	MoveToFlagEnabled(MORK, false)
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DisableQuest( LB ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,LB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,MORK) 
	BeginPlot(  OwnerID(), "LuaS_423491_5" , 0 )
	Say(LB,"[SC_423491_1]")---�n�_�Ǫ��Pı...�߱�.....
PlayMotion(LB,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	Say(CK,"[SC_423491_4]")----�I���`�⥭�R�U�ӤF�A�S���A�o�X�_���W�v���n���C
	AddToPartition( MORK,0)   
	AddBuff(MORK,506984,1,60)
	AddBuff(MORK,506984,1,60)
	AddBuff(MORK,506984,1,60)
	sleep(20)
------����J���U���ʧ@ 
	SetDefIdleMotion(MORK, ruFUSION_MIME_RUN_FORWARD )
	MoveDirect( MORK, 5942 , 779.0 , 32656.3 )
	sleep(20)
	PlayMotion(MORK, ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(MORK, ruFUSION_MIME_IDLE_STAND     )---�`�ɶ����κA
	sleep(30)
----	DW_MoveToFlag(MORK ,780698,4, 0,1)
------�ҫk�ĦV�e���ʧ@
	Say(LB,"[SC_423491_5]")----�j�j...�j�j�A�٦n�ܡH
	PlayMotion(LB,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	Say(MORK,"[SC_423491_6]")-----���p�����[�A�ҥH�ڦ^�ӷQ�a�A�̤@�P�L�h�C�b�Q�Q�ݦ��S���v���o����k�H
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(40)
	PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_APPROVAL )
	Say(CK,"[SC_423491_7]")----------�γ\�ڿ�o��I�ڬ��F�o��[���ɶ��A���򭷮��S�ݹL�H���ֱa�ڭ̹L�h�a�I
	sleep(40)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423491 ) == true and	CheckBuff(player , 507503 )== true then
		SetFlag(player ,544340, 1 ) 
		CancelBuff( player , 507503)
	end
	delobj(CK)
	delobj(MORK)
	delobj(LB)
	delobj(OwnerID())
end
	
function LuaS_423491_5()--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local LB = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	for i=1, 60, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423491)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423491 ) == true	and CheckFlag( player, 544289) == false and GetDistance(  player , OwnerID() ) >250		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( player , player, 0 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			break
		end
		sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507503)
	end
	if 	CheckID( CK)== true then
			delobj(CK)
	end
	if 	CheckID( LB)== true then
					delobj(LB)
	end
	if 	CheckID( MORK)== true then
			delobj(MORK)
	end
	delobj(OwnerID())
end
--------------------------------------------------------------------------------------------------------------------------------
----------------
-----------------------------------------------------
function LuaS_423492_0()----544341
	LoadQuestOption( OwnerID() )				
	if	CheckAcceptQuest( OwnerID() ,423492 ) == true	then
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_422974_0]" , "LuaS_423492_1", 0 )----���ΧO�H���r��		
	end
end
function LuaS_423492_1()	
	CloseSpeak( OwnerID() )	
	if	ChangeZone( OwnerID() , 18 , 0 , 13343.3, -38.2 , 49953.9 , 11 )	then	
		SetFlag(OwnerID() , 544342 , 1 )---���ݤ��ݱo������J�����[�X��
	end
end
----��F�᪺�d��@��
function LuaS_423492_2()---115851--544253
 	SetPlot( OwnerID() , "Range" , "LuaS_423492_3" , 300 )
end
function LuaS_423492_3()
	if(CheckAcceptQuest( OwnerID() , 423492 ) == true ) and (CheckFlag(OwnerID(),544341)==false) and (CheckFlag(OwnerID(),544342)==true) then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423492_0]" , 0 )---
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423492_0]" , 0 )---�}�޶ǥX�F�_�Ǫ��n���A�ިӼ���J���`�ءC
		sleep(30)
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423492_1]" , 0 )---�~�����ڭ��G�γ\�ڭ̸ӽͽͳo���b�s�H���ơH
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423492_1]" , 0 )-- �~�����ڭ��G�γ\�ڭ̸ӽͽͳo���b�s�H���ơH
		sleep(30)
		SetFlag(OwnerID() ,544341, 1 )--
	end
end
---------------------------------------------------------------
---------------------------------------------------------------
function LuaS_423493_0()----
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423493) == true  and (CheckFlag(OwnerID(),544340)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423493_0]","LuaS_423493_1",0)---��...�ڪ��D�F�C
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423493_0]","LuaS_423493_2",0)---��...�ڪ��D�F�C
			end				
	end	
end
function LuaS_423493_1()----
 	SetSpeakDetail(OwnerID(),"[SC_423493_1]")---�����A�٬O�A���@�U�n�F�A���ڦb�T�{�@�U�}�ޤ������R�C
 end
function LuaS_423493_2()----	
	CloseSpeak( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423493) == true  and (CheckFlag(OwnerID(),544340)==false) and ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423493_3" , 0)
	end
end
function LuaS_423493_3()----BUFF507503 AddBuff(OwnerID(),507503,1,50)
	local KK = Lua_DW_CreateObj("flag" ,116187,780544,1,0 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---�⪱�a�g����Y
	BeginPlot( KK , "LuaS_423493_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423493_4()---CK �O�d����116192 LB�O�ҫk116193 MORK �O����J116194  	AddToPartition( MT , 0 )
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	AddBuff(player,507504,1,65)
	local COPYMORK = Lua_DW_CreateObj("flag" ,116195,780544,4,0)---
	local CK = Lua_DW_CreateObj("flag" ,116192,780544,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116193,780544,3 ,1)---
	local MORK= Lua_DW_CreateObj("flag" ,116194,780544,4 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DisableQuest( LB ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,LB) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,MORK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register6 ,COPYMORK) 
	BeginPlot(  OwnerID(), "LuaS_423493_5" , 0 )
---����J���ʧ@495918
---��Ҧ��H�WBUFF (��檺����BUFF)507505	
--	AddBuff( player ,502280,1 ,30)
--	AddBuff( LB ,502280,1 ,30)
--	AddBuff( CK ,502280,1 ,30)
	AddBuff( player ,507505,1 ,30)
	AddBuff( LB ,507505,1 ,30)
	AddBuff( CK ,507505,1 ,30)
	Say(MORK,"[SC_423493_2]")---����ڥ��i�h�������p...
	sleep(10)
--- ����J����
	WriteRoleValue(MORK,EM_RoleValue_IsWalk,0)---�ζ]��
	Hide(  MORK )
	Show(   MORK  , 0 )
	DW_MoveToFlag(MORK ,780544,6, 1,1)--
	delobj(MORK)
	Say(CK,"[SC_423493_3]")---��...�J�M�L�o�򻡡A�èS�����D§��ť�a�H
	sleep(30)
	Say(CK,"[SC_423493_4]")----��ڭ̤@�ӭӳ��w�b�o�H�]�o�g�L�ڪ��P�N���I
	sleep(30)
	Say(CK,"[SC_423493_5]")----��~~���ڭ̨�ťť�L�̦b�D������˪����K�H
----�d�������ʧ@��BUFF����
	CastSpell( CK,  player, 496144)
	if CheckID( player)== true and CheckBuff( player ,507505) then
		CancelBuff( player, 507505)
		CancelBuff( player, 502280)
	end
	CancelBuff( LB, 507505)
	CancelBuff( CK, 507505)
	CancelBuff( LB, 502280)
	CancelBuff( CK, 502280)
----	AdjustDir( CK , 60 )
	sleep(20)
	SetDir( CK , 8.8 )
	ScriptMessage( player, player, 0, "[SC_423493_6]" , "0xFFFFFF00" )---�~�����ڭ��G����J...�J�M�w�g��쨺��W�b�s�H�F...
	ScriptMessage( player, player, 1, "[SC_423493_6]" , "0xFFFFFF00"  )---�~�����ڭ��G����J...�J�M�w�g��쨺��W�b�s�H�F...
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_7]" , "0xFFFFFF00"  )---�~�����ڭ��G�����򤣪����L�̰e�ܥ��˪����e�O�H�A�����}�A�γ\�|�`�F�A...
	ScriptMessage( player, player, 1, "[SC_423493_7]" , "0xFFFFFF00" )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_8]" , "0xff008000")---����J�G�ڤ����էA���N��H
	ScriptMessage( player, player, 1, "[SC_423493_8]" ,"0xff008000")
	sleep(25)
	ScriptMessage( player, player, 0, "[SC_423493_9]" ,"0xFFFFFF00"  )---�~�����ڭ��G�����A�ڷQ�A�@�w�ܩ��դ����ķ溸���ԩҥN���N�q...ť���˻��_�A���O�@���]�H�������߮u�����s���W���ԧСH�ٰO�o��n�h�D�F�����H
	ScriptMessage( player, player, 1, "[SC_423493_9]" ,"0xFFFFFF00"  )
	sleep(45)	
	ScriptMessage( player, player, 0, "[SC_423493_10]" , "0xFFFFFF00"  )---�~�����ڭ��G�γ\�L�٦s�b�b�o�@�ɤW�A�L�Ҭ�o���޳N�K�@�@�X�{�b�o�ӥ@�ɤW�A�o�b�s�H���O�H���Q���V�ڱڪ��̨��Ҿ�...
	ScriptMessage( player, player, 1, "[SC_423493_10]" , "0xFFFFFF00"   )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_11]" , "0xFFFFFF00"   )----�~�����ڭ��G����J�A������A��e�\�L���~��s�b�o�@�ɤW�A�s�ڪ��L�Y�P�۶ơA�A�����U�F�ܡH
	ScriptMessage( player, player, 1, "[SC_423493_11]" , "0xFFFFFF00"   )
	sleep(30)	
	ScriptMessage( player, player, 0, "[SC_423493_12]" , "0xff008000" )----����J�G[115351]...�O�A�ѰO�F�Ҧ��ƪ��������ϭ��H�L�̤��L�O���߮a��U�����`��...
	ScriptMessage( player, player, 1, "[SC_423493_12]" , "0xff008000" )
	sleep(30)
	ScriptMessage( player, player, 0, "[SC_423493_13]" , "0xFFFFFF00"   )----�~�����ڭ��G���F�A�ڤ��Qť���A���o�ǸܡA����J�A�A�Q���s�Ǫ��Ұg�b�F�I�����M�ƹ�u�ۡK�A��ѤH�����g���A�Ƶ��ڱڪ��۴L�K�S�m���˩��a�K
	ScriptMessage( player, player, 1, "[SC_423493_13]" ,"0xFFFFFF00"  )	
	sleep(45)
	ScriptMessage( player, player, 0, "[SC_423493_14]" , "0xFFFFFF00"   )----�~�����ڭ��G���s�@�ڨä��n�ۻP�K�����K�A���Ӫ��D�Ʊ����Y���ʡH
	ScriptMessage( player, player, 1, "[SC_423493_14]" , "0xFFFFFF00"   )
	sleep(25)
	ScriptMessage( player, player, 0, "[SC_423493_15]" , 0 )----�Y�ª��ڭ��G�U�P���šA�ڳ����աA�A���^�h�a�I�ڷ|�D�ʦV�k���ӽͦ��ơK
	ScriptMessage( player, player, 1, "[SC_423493_15]" , 0 )
	Tell (player , COPYMORK ,  "[SC_423493_16]" )---�A�̥i�H�i�ӤF�K
	sleep(25)
	Say(CK,"[SC_423493_17]")---���a�K�ڭ̥i�n�j�n�j�\�����i�h�K��K
	BeginPlot(CK , "LuaS_423493_complete1" , 0 )
	BeginPlot(LB , "LuaS_423493_complete1" , 0 )	
	sleep(10)
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423493 ) == true and	CheckBuff(player , 507504 )== true then
		SetFlag(player ,544343, 1 ) 
		CancelBuff( player , 507504)
	end
	sleep(10)
	delobj(CK)
	delobj(LB)
	delobj(OwnerID())
end
function LuaS_423493_5()--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local LB = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local COPYMORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)--
	for i=1, 70, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423493)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423493 ) == true	and CheckFlag( player, 544289) == false and GetDistance(  player , OwnerID() ) >300		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( player , player, 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			break
		end
		sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507504)
			CancelBuff( player, 507505)
	end
	if 	CheckID( CK)== true then
			delobj(CK)
	end
	if 	CheckID( LB)== true then
					delobj(LB)
	end
	if 	CheckID( MORK)== true then
			delobj(MORK)
	end
	if 	CheckID(  COPYMORK )== true then
					delobj( COPYMORK )
	end
	delobj(OwnerID())
end

---������t���C�˱󤣥�
function LuaS_423493_complete()
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507503,1,30)---�Q�γo��BUFF  �إX
	SetFlag( TargetID(),544344, 1 ) ---�����a�A�]�ݤ���H�e���ҧB�B�d����
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MORK = Lua_DW_CreateObj("flag" ,116195,780544,4,0)---
	local CK = Lua_DW_CreateObj("flag" ,116184,780544,2,1)---
	local LB= Lua_DW_CreateObj("flag" ,116186,780544,3 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( LB ,true )
	Tell (TargetID() , MORK ,  "[SC_423493_16]" )---�A�̥i�H�i�ӤF�K
	sleep(30)
	Say(CK,"[SC_423493_17]")---���a�K�ڭ̥i�n�j�n�j�\�����i�h�K��K
	BeginPlot(CK , "LuaS_423493_complete1" , 0 )
	sleep(10)
	BeginPlot(LB , "LuaS_423493_complete1" , 0 )	
	sleep(40)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507503)
	end
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if CheckCompleteQuest( player[i] ,423493 )== true  and CheckAcceptQuest( player[i] , 423493 ) == false    then
			SetFlag( player[i] ,544344, 1 ) 
		end
	end
	sleep(10)
	DELOBJ(CK)
	DELOBJ(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end	
function LuaS_423493_complete1()
	WriteRoleValue(OwnerID() ,EM_RoleValue_IsWalk,0)---�ζ]��
	Hide(  OwnerID()  )
	Show(   OwnerID()  , 0 )
	DW_MoveToFlag(OwnerID() ,780544,6, 0,1)
	DELOBJ(OwnerID())
end
-----------------------------------------------------------
-------
------------------------
---�p�G���ɶ�����
function LuaS_423494()--���b����J���W����ܼ@��
	if	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )==0  then----
				LoadQuestOption( OwnerID() )
				AddSpeakOption(OwnerID(),TargetID()," [SC_423494_3]","LuaS_423494_2",0)---(��i[[116196]]�����k�C)
	elseif	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )<5  then----
			SetSpeakDetail(OwnerID(),"[SC_423494_4]")---
	elseif	CheckAcceptQuest( OwnerID() , 423494) == true  and CountBodyItem( OwnerID() ,208102 )>=5  then----
			LoadQuestOption( OwnerID() )
			AddSpeakOption(OwnerID(),TargetID()," [SC_423494_0]","LuaS_423494_1",0)---�ڤw�g������[<S>208102]�C
	else 	LoadQuestOption( OwnerID() )

	end
end
function LuaS_423494_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423494_2]")---�ꥩ�A�ڻP[116197]�]��n�q�~���������F��^�ӡA����N��ѧA���h��[116196]�C
	if 	 CountBodyItem( OwnerID() ,208103 )<5 then 
   		GiveBodyItem(OwnerID(),208103,5)
	end
	if 	CountBodyItem( OwnerID() ,208101 )<5  then
   		GiveBodyItem(OwnerID(),208101,5)
	end
 end
function LuaS_423494_2()----
	SetSpeakDetail(OwnerID(),"[SC_423494_4]")---
end
function LuaS_423494_complete()----780565
	local Kargath=OwnerID();
	local RoomID=ReadRoleValue(Kargath,EM_RoleValue_RoomID);
	DisableQuest( Kargath ,true )
	AddBuff(TargetID(),507506,1,30)
	local x,y,z,dir=ReadRoleValue(Kargath,EM_RoleValue_X),ReadRoleValue(Kargath,EM_RoleValue_Y),ReadRoleValue(Kargath,EM_RoleValue_Z),ReadRoleValue(Kargath,EM_RoleValue_Dir);
	local CK = CreateObj(116242,x,y,z,dir,1);
	MoveToFlagEnabled(CK,false);
	WriteRoleValue(CK,EM_RoleValue_IsWalk,1);
	AddtoPartition(CK,RoomID);
	local GILL= Lua_DW_CreateObj("flag" ,116243,780565,3 ,1)---
	DisableQuest( CK ,true )
	DisableQuest( GILL ,true )
	AddBuff(GILL,507515,1,30)
---�ʧ@
	Say(CK,"[SC_423494_5]")
	PlayMotion(CK , ruFUSION_ACTORSTATE_CROUCH_BEGIN);
	SetDefIdleMotion(CK,ruFUSION_MIME_CROUCH_LOOP);
	sleep(30)
	PlayMotion( CK  , ruFUSION_ACTORSTATE_CROUCH_END);
	SetDefIdleMotion(CK,ruFUSION_MIME_IDLE_STAND);
	sleep(20)
	CancelBuff( GILL, 507515)
	Say(GILL,"[SC_423494_6]")---��K�W�K�Y�n�k�K�n�k..
	sleep(30)
	Say(GILL,"[SC_423494_7]")--�ǴˡC
	sleep(20)
	delobj(GILL)
	delobj(CK)
	CancelBuff(TargetID(),507506)
	DisableQuest( OwnerID() ,false )
end	

function LuaS_423494_KK()--�S��---���r���S�� (�٥��D��A�X�x)-------493925   495916 496181
	Lua_ObjDontTouch( OwnerID())
	DisableQuest( OwnerID(),  true )
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  495916)
	end
end

function LuaS_423494_LL()--�S��---���r���S�� (�٥��D��A�X�x)------
	Lua_ObjDontTouch( OwnerID())
	DisableQuest( OwnerID(),  true )
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  492667)
	end
end
----------------------------------------------------
------------------------------------------------------------------------------------
---�ϥ�507507BUFF
function LuaS_423497()--���b�d����
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423497) == true  and   (CheckFlag(OwnerID(),544346)==false) then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422886_0]","LuaS_423497_1",0)---
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422886_0]","LuaS_423497_2",0)---
			end				
	end
end
function LuaS_423497_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423497_1]")---����...�ڷQ����z�@�U���e�A�ڭ̭n�Ӯ𪺥X���A���s�ڷ����­��A������z�n��A�A�X�o�C
 end
function LuaS_423497_2()----	
	CloseSpeak( OwnerID() )
	if  ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423497_3" , 0)
	end
end	
function LuaS_423497_3()----�d���������j�]��
	AddBuff(TargetID(),507508,1,70)
	local KK = Lua_DW_CreateObj("flag" ,116246,780547,1,1 )---�إX�@�Ӵx��������NPC���]���C
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---�⪱�a�g����Y
	BeginPlot( KK , "LuaS_423497_4" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423497_4()---780547
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local CS = Lua_DW_CreateObj("flag" ,116247,780547,2,1)---�d�ħƴ�
	local MORK = Lua_DW_CreateObj("flag" ,116248,780547,3 ,1)---
	DisableQuest( CS ,true )
	DisableQuest( MORK ,true )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CS) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,MORK) 
	BeginPlot(OwnerID() , "LuaS_423497_7" , 0)
	Say(OwnerID(),"[SC_423497_2]")--���򨫧a�K
CallPlot( MORK,"LuaS_423497_5",player)
CallPlot( CS,"LuaS_423497_6",player)
---	BeginPlot( CS , "LuaS_423497_6" , 0)
	sleep(30)
	DW_MoveToFlag(OwnerID() ,780547,4, 0,1)
	sleep(70)
	DW_MoveToFlag(OwnerID() ,780547,5, 0,1)
AdjustFaceDir( OwnerID()  , CS  ,  0 )
	Say(OwnerID(),"[SC_423497_3]")---��ӬO�o��@�^�ơK���K�˷R���s�ڡA�ڥi�H�i�D��n�h���w���_�b�F�K�ʦL���ԡA�L�N�w�Q�ʤJ�F��ɤ��K
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SALUTE2  )
	sleep(40)
AdjustFaceDir( CS ,OwnerID()  , 0 )
	Say(OwnerID(),"[SC_423497_4]")----�A�����ӫܰ����~��A�߸��j�w�S�ֱ��F�@�ӡA�ѫo���g�L���A�̩Ұ����K
PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_EMOTE_APPLAUSE)
	sleep(40)
	ScriptMessage( player, player, 1, "[SC_423497_5]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_5]" , "0xFFFFFF00"   )
	--------YELL(CS,"[SC_423497_5]",7)-----------�o�ëD�ڱک��@�K�u�O���@�@�ɦA�ץ��Ž}�F�K
PlayMotion(CS,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(40)
	Say(OwnerID(),"[SC_423497_6]")----�z�������ǡA��ť�����I�ڥu�Q���D�A�̷Q���B�m����ӥb�s�H�K
PlayMotion(OwnerID(),    ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
	sleep(40)
	Say(MORK,"[SC_423497_7]")------[116246],�o��ơA�ڷ|���A���СK
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	ScriptMessage( player, player, 1, "[SC_423497_8]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_8]" , "0xFFFFFF00"   )
	--------YELL(CS,"[SC_423497_8]",7)-------�����A���ݪk�A���b�S����h���̾ڥX�ӫe�A�ڵL�k���A���СK�u��ɧکү઺���@����J�ҫH�઺��H�K
	PlayMotion(CS,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(40)
	Say(MORK,"[SC_423497_9]")----���ˡK
	if 	CheckID( player)== true  and CheckAcceptQuest(  player,423497 ) == true and	CheckBuff(player , 507508 )== true then
		CancelBuff( player, 507508)
		SetFlag(player ,544346, 1 ) 
	end
	SLEEP(10)
	delobj(MORK)
	delobj(CS)
	if 	CheckID(OwnerID())==true then
		delobj(OwnerID())
	end
end
function LuaS_423497_5(player)---LB���t��	
	sleep(30)
------	YELL(OwnerID(),"[SC_423497_10]",7)----���ˡA�o��ƨ쩳�ӫ�򰵤~�n�H�ڤ��Q���k�������K���P�ɧڵL�k�묹�L�̡K.
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
ScriptMessage(player, player, 0, "[SC_423497_10]", "0xffffffff"   )----
	sleep(30)
-----	YELL(OwnerID(),"[SC_423497_11]",7)----�L�̤��L�O�Q�`�̡K�]���ڪ���G���ܦ��b�s�b�H�K�u�n��_�ӧڤ]���o�K
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_IDLE2     )
ScriptMessage(player, player, 0, "[SC_423497_11]", "0xffffffff"   )----
	sleep(80)
----	YELL(OwnerID(),"[SC_423497_12]",7)----���ˡK���D�A�]�{�i�U�P���[���ݪk�H
ScriptMessage(player, player, 0, "[SC_423497_12]", "0xffffffff"   )----
end
	
	
function LuaS_423497_6(player)----CS���t��
	sleep(100)
	ScriptMessage( player, player, 1, "[SC_423497_13]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_13]" , "0xFFFFFF00"   )
---	YELL(OwnerID(),"[SC_423497_13]",7)---�{�b�L�k�o����n�h�u�����U���K���L�Ҷi�檺����@�@�X�{�b�@�ɤW�A���ɭԪ��H�̡A�O�����Ϫ��a��ڱڡK
	PlayMotion(OwnerID(),  ruFUSION_ACTORSTATE_EMOTE_SPEAK   )
	sleep(30)
	ScriptMessage( player, player, 1, "[SC_423497_14]" , "0xFFFFFF00"   )
	ScriptMessage( player, player, 0, "[SC_423497_14]" , "0xFFFFFF00"   )
---	YELL(OwnerID(),"[SC_423497_14]",7)---�ƦܬO����ڱڡA����������n�h�K���������O�K�Q�L�k�F�K�o�˦M�I���s�b�K
	PlayMotion(OwnerID(),   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE )
end
	
function LuaS_423497_7()--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local CS = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	for i=1, 80, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423497)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423497 ) == true   and CheckFlag( player, 544346) == false and GetDistance(  player , OwnerID() ) >300		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( player , player, 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			break
		end
		if 	CheckID( MORK)== false then
			break
		end
	sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 507508)
	end
	if 	CheckID(MORK)== true then
			delobj(MORK)
	end

	if 	CheckID( CS)== true then
			delobj(CS)
	end
	if 	CheckID(OwnerID())==true then
		delobj(OwnerID())
	end
end	

