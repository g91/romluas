----------423616 �����@��------------------------
--------------------------------------------------------------------------
function LuaS_423616()----�ϥκX��780565 BUFF 
	AddBuff(TargetID(),508041,1,60)
	local MM = Lua_DW_CreateObj("flag" ,116795,780565,1,1 )---�إX�`�F
	DisableQuest( OwnerID() ,true )
	DisableQuest( MM ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	Lua_ObjDontTouch(MM)
	yell(MM,"[SC_423616_1]",4)---���U�H�O���U�H
	DW_MoveToFlag( MM,780565,2, 0,1)
	Say(MM,"[SC_423616_2]")---���Pı�S���Ǥ��@�ˡH������O�H
	sleep(30)
	Say(MM,"[SC_423616_3]")---��F...�ڤw�g���F�ܦh�~...
	sleep(30)	
	if 	CheckID( TargetID() ) == true  then
		AdjustFaceDir( MM , TargetID(), 0 )
	end
	Say(MM,"[SC_423616_4]")---�A....�ݱo���ڡH
	sleep(10)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() ,508041)
	end
	delobj(MM)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end------------------------------------------------------------------------------
----------423617  ��ܼ@�� ---------------------------------------------------------
function LuaS_423617()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423617) == true  and  CheckFlag(OwnerID(),544587)==false then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423617_0]","LuaS_423617_1",0)--(�յۥΤ�h�W�L�A���L�^�L���C)  
				AddSpeakOption(OwnerID(),TargetID()," [SC_423617_1]","LuaS_423617_2",0)--(�Q���n���A���L�^�L���C)
	end
end

function LuaS_423617_1()
	SetFlag(OwnerID() ,544588, 1 )
   	SetSpeakDetail(OwnerID(),"[SC_423617_3]")---544588
	if	CheckFlag(OwnerID(),544588)==true  then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423617_5]","LuaS_423617_3",0)-----�ޡA�A�S�Ƨa�H
	end
 end

function LuaS_423617_3()
   	SetSpeakDetail(OwnerID(),"[SC_423617_7]")---544588
	SetFlag(OwnerID() ,544587, 1 )
 end
 --------------------------------
function LuaS_423617_2()
	SetFlag(OwnerID() ,544589, 1 )
   	SetSpeakDetail(OwnerID(),"[SC_423617_2]")---544588
	if	CheckFlag(OwnerID(),544589)==true  then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423617_4]","LuaS_423617_4",0)-----�ޡA�A�S�Ƨa�H
	end
 end

function LuaS_423617_4()
   	SetSpeakDetail(OwnerID(),"[SC_423617_6]")---544588
	SetFlag(OwnerID() ,544587, 1 )
 end

 
 --------------------------------------------------------------------------------------------------------
 --------------423618----�Ǫ����`�@��--------------------------------------------
 
 -------------------------------------------------------------------------------------
 
----------------------------423619     ����208438  ����Ȫ���ϥ�-----------------------------------------
---�C�� ��l�@��
function LuaI_116796_0()
	SetModeEx(OWNERID() ,EM_SetModeType_ShowRoleHead ,true) -----------�q�X�Y����
	SetModeEx(OWNERID() ,EM_SetModeType_HideName ,false) 
	SetModeEx( OWNERID() , EM_SetModeType_NotShowHPMP, true )--����ܦ��
	while true do
		sleep(40)
		SysCastSpellLv(OwnerID(), OwnerID(), 496482,1)
-------		CastSpell( OwnerID(), OwnerID(), 496482)
	end
end

function LuaI_208438_0()
	if CheckAcceptQuest( OwnerID() , 423619) == false or CheckFlag(OwnerID(),544590)==true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --�ثe���ݭn�ϥγo�Ӫ��~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 116796 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , 0 ) --�ؼФ����T
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 110 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --�ؼжZ���L��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	return true
end
function LuaI_208438_1()
	AddBuff(OwnerID() ,504004,1,20)
	UseItemDestroy()
	CastSpell( OwnerID() , targetID() ,496677)
	BeginPlot( OwnerID() , "LuaI_208438_2" , 0 )

end
function LuaI_208438_2()
	sleep(30)
	SetFlag(OwnerID() ,544590, 1 )
end
-----------------------------------------------------------------
function LuaS_423625()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423625) == true  and  (CheckFlag(OwnerID(),544592)==false) and	CountBodyItem( OwnerID() ,208442)>=1  and CountBodyItem( OwnerID() ,208441)>=1   then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423625_0]","LuaS_423625_1",0)--�o�O���U�礩�ڿ����ȫ���D�������P���b�A�Ц��U�C
	end
end
function LuaS_423625_1()
	DelBodyItem( OwnerID(), 208441 , 1 )
	DelBodyItem( OwnerID(), 208442 , 1 )
   	SetSpeakDetail(OwnerID(),"[SC_423625_1]")---
	SetFlag(OwnerID() ,544592, 1 )
 end
----------------------------------------------------------------------------------

function LuaS_423627()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423627) == true  and  (CheckFlag(OwnerID(),544593)==false)  then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423052_1]","LuaS_423627_1",0)--�ڤw�g�ǳƦn�F�I
	end
end
function LuaS_423627_1()
	Setposbyflag(OwnerID(),780750,1) 
	SetFlag(OwnerID() ,544593, 1 )
 end

---------------------------------------------------------------------------

 function LuaS_423629()
	if	CheckAcceptQuest( OwnerID() , 423629) == true  and CountBodyItem( OwnerID() ,208445)>=5 and (CheckFlag(OwnerID(),544594)==false)  then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
			     	 LoadQuestOption( OwnerID() )
				  AddSpeakOption(OwnerID(),TargetID()," [SC_423629_1]","LuaS_423629_1",0)--�]�ⸯ�ۥ浹�d�����C�^
			 end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) ==0 then
			     	 LoadQuestOption( OwnerID() )
				  AddSpeakOption(OwnerID(),TargetID()," [SC_423629_1]","LuaS_423629_2",0)--�]�ⸯ�ۥ浹�d�����C�^
			 end
	elseif 	CheckAcceptQuest( OwnerID() , 423629) == true  and CountBodyItem( OwnerID() ,208445 )<5 and (CheckFlag(OwnerID(),544594)==false) then
			SetSpeakDetail(OwnerID(),"[SC_423629_2]")---�Ĥl�A���۴N�b����A���D�A�s�o�I�p���������ڡH
	else	LoadQuestOption( OwnerID() )
	end
end
function LuaS_423629_1()
	SetSpeakDetail(OwnerID(),"[SC_423629_3]")--��A�A�����ۡA���|��A�A�����ڡI
 end
 function LuaS_423629_2()----	
	CloseSpeak( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 423629) == true  and  CountBodyItem( OwnerID() ,208445 )>=5  and ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		DelBodyItem( TargetID(),208445 , 5)
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423629_4" , 0)
	end
end

function LuaS_423629_4()----BUFF507503 AddBuff(OwnerID(),507503,1,50)  FLAG--780698
	local KK = Lua_DW_CreateObj("flag" ,116904,780750,2,0 )---�إX�@�Ӵx��������NPC���]���C
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
	DisableQuest( KK ,true )
	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---�⪱�a�g����Y
	BeginPlot( KK , "LuaS_423629_3" , 0 )
	while true do
		sleep(10)
			if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end


function LuaS_423629_3()----
	local TargetID = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)
	local HH = Lua_DW_CreateObj("flag" ,117044,780750,5,0)
	local CS = Lua_DW_CreateObj("flag" ,116581,780750,2,1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,HH) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,CS) 
	BeginPlot(  OwnerID(), "LuaS_423629_5" , 0 )
	AddBuff(TargetID,508045,1,50)
	DisableQuest( CS ,true )
	Yell(CS,"[SC_423629_6]",4)
	DW_MoveToFlag(CS,780750,4, 0,1)
	Yell(CS,"[SC_423629_4]",4)--��K���ӴN�b�o�Ӧa��H
	sleep(30)

----���ǰʧ@ �H�Ϊk�N   ������X�{�@���]�k�}�C
	AdjustDir(CS ,100)
	CastSpellPos(CS,-9692.6,1110.0,47368.4,496486,1)
-------	CastSpell( CS, HH, 496486 )
	sleep(10)
	SetModeEx(HH ,EM_SetModeType_HideName ,true) -----------
	SetModeEx(HH, EM_SetModeType_ShowRoleHead ,false) -----------�q�X�Y����
	SetModeEx( HH,  EM_SetModeType_Mark, false )
	AddToPartition( HH, 0)
---�إX���~ 780750 3
 	local DD = Lua_DW_CreateObj("flag" ,116582,780750,3,1)
	Yell(CS,"[SC_423629_5]",4)--��K���ӴN�b�o�Ӧa��H
	sleep(30)
	DW_MoveToFlag(CS,780750,3, 0,1)
	PlayMotionEX( CS , ruFUSION_ACTORSTATE_CROUCH_BEGIN, ruFUSION_ACTORSTATE_CROUCH_END  )
	delobj(DD)
	sleep(10)
	delobj(HH)
----	Yell(CS,"[SC_423629_5]",4)
	DW_MoveToFlag(CS,780750,4, 0,1)
	DW_MoveToFlag(CS,780750,2, 0,1)

	if 	CheckID( TargetID )== true and   (CheckAcceptQuest(TargetID,423629)==true) and CheckBuff(  TargetID  ,508045)==true       then
		SetFlag( TargetID ,544594, 1 )
		CancelBuff( TargetID ,508045)
	end
	delobj(CS)		
	delobj(OwnerID())
end
 
function LuaS_423629_5()--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local HH = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local player = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	for i=1, 70, 1 do
		if 	CheckID( player)== false or (CheckAcceptQuest(player,423629)==false) then
			break
		end
		if	CheckID( player)== true  and CheckAcceptQuest( player , 423629 ) == true	and CheckFlag( player, 544594) == false and GetDistance(  player , OwnerID() ) >300		then
			ScriptMessage( player, player, 1 , "[SC_423349_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			ScriptMessage( player , player, 0 , "[SC_423191_11]" , 0 ) --�W�X�Z���A�z�S���������ȡC
			break
		end
		sleep(10)
	end
	if CheckID( player)== true then
			CancelBuff( player, 508045)
	end
	if 	CheckID( CK)== true then
			delobj(CK)
	end
	if 	CheckID( HH)== true then
					delobj(HH)
	end
	delobj(OwnerID())
end

---------------------------------------------------------------------------------------------------------------------------------544594
 function LuaS_423630()
 	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
 	AddBuff(TargetID(), 508046,1,50)
	local CS   = Lua_DW_CreateObj("flag" ,116584,780751,2,1 )
	local GILL = Lua_DW_CreateObj("flag" ,116583,780751,3,0 )
	local TONY = Lua_DW_CreateObj("flag" ,117117,780751,10,1)
	DisableQuest( CS ,true )
	DisableQuest( GILL ,true )
	DisableQuest( TONY ,true )
 	SetModeEx(GILL,EM_SetModeType_Gravity,false) 
	WriteRoleValue(GILL,EM_RoleValue_Y,1200)	
	MoveToFlagEnabled( GILL, false )
 	SetDefIdleMotion(GILL , ruFUSION_MIME_RUN_FORWARD )
	AddToPartition( GILL, 0)
	MoveDirect( GILL   , -9605.2 , 1111.4 , 47251.1)
	sleep(80)
	PlayMotion( GILL  , ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion( GILL  , ruFUSION_MIME_IDLE_STAND )
	Yell(GILL,"[SC_423631_1]",4)
	sleep(30)
	Yell(GILL,"[SC_423631_2]",4)
	sleep(30)
	Yell(CS,"[SC_423631_3]",4)
	sleep(30)
	Yell(GILL,"[SC_423631_4]",4)
	sleep(30)
	if 	CheckID( TargetID() )== true then
		CancelBuff( TargetID() ,508046)
	end	
	delobj(CS)
	delobj(GILL)
	delobj(TONY)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end

-------------------------------------------------------------
----423631  �ϥκX�� 780750 11
function LuaS_423631()
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423631) == true  and  (CheckFlag(OwnerID(),544595)==false)  then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423052_1]","LuaS_423631_1",0)--�ڤw�g�ǳƦn�F�I
	end
end
function LuaS_423631_1()
	Setposbyflag(OwnerID(),780750,11) 
	SetFlag(OwnerID() ,544595, 1 )
 end
 
---------------------------------------------------------------
function LuaS_116905()
	while true do
		sleep(40)
		CastSpell( OwnerID(), OwnerID(), 496483)
	end
end
-----------------------------------
------BOOK


function LuaS_208444_book_0()	--208157  �ĺ����u�@��x
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), "[SC_208444_1]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208444_2]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208444_3]" )	--�U�@���A�r�ꬰ�ѭ�����
	AddBorderPage( OwnerID(), "[SC_208444_4]" )	--�U�@���A�r�ꬰ�ѭ�����
	ShowBorder( OwnerID(), 0, "[SC_208444_0]" , "ScriptBorder_Texture_Paper" )	--QuestID �ҭn����������ID(��0�h��������)�A�r�ꬰ���ѭ����D
end


---------------------
-----���m�S�v 495980
function LuaS_117027()
	while true do
		sleep(30)
		CastSpell( OwnerID(), OwnerID(),495980)
	end
end



-------------------423634 ���{�{�������
function LuaS_423634_KK()
	SetFlag(TargetID(), 544601, 1 )
	SetFlag(TargetID(), 544602, 1 )
	SetFlag(TargetID(), 544603, 1 )
end

