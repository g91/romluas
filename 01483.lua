--------------------------------------------------------------- 422590���p�ڭ̦P�@�� -----------------------------------------------------------------
function LuaS_113288_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422590 ) == true or ( CheckCompleteQuest( OwnerID() ,422590 ) == true and CheckAcceptQuest( OwnerID() , 422522 ) == false ) then
		if CountBodyItem( OwnerID() , 205426 ) < 1 then
			AddSpeakOption( OwnerID(), TargetID( ),"[SC_422590_0]" ,"LuaS_113288_1", 0 ) --�A���@��[205426]
		end
	end

	if (CheckAcceptQuest(OwnerID(),422588)==true )and( Checkflag( OwnerID() , 542938) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422588_0]","LuaS_422588_1",0) --
	end
	if	CheckAcceptQuest(OwnerID(),422722)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_2]","LuaS_422722_3", 0 )
	end
end

function LuaS_113288_1()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID() , 205426 , 1 )
end

-------------------------------------------------------------- 422591���ů�q ----------------------------------------------------------------------------
function LuaM_493686_0()
	if CheckAcceptQuest( OwnerID() , 422591 ) == false or CheckFlag( OwnerID() , 542919 ) == true then
--	if CheckFlag( OwnerID() , 542919 ) == true  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422591_0]" , 0 ) --�A�ثe���ݭn�ϥΦ����~
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422591_0]" , 0 ) 
		return false
	end
	local Obj =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113289 , 50 )
	if Obj< 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422591_1]" , 0 ) --��������{�{�ۥ��~����Ψϥ�
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422591_1]" , 0 ) 
		return false
	end
	return true
end

function LuaM_504031_0()
	if CheckAcceptQuest( OwnerID() , 422591 ) == true then
	ScriptMessage( OwnerID(), TargetID(), 0, "[SC_422591_2]", 0 )
		SetFlag( OwnerID() , 542919 , 1 )
	end
end

------------------------------------------------------------ 422592�����کԧJ ------------------------------------------------------------------------------

function LuaS_113290and113291_0()
	local Flag = {[113290] = 542920 , [113291] = 542921}
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422592 ) == true and CheckFlag( OwnerID() , Flag[OrgID] ) == false then
--	if CheckFlag( OwnerID() , Flag[OrgID] ) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422592_0]" ,"LuaS_113290and113291_1", 0 ) --�бa�ڥh�����کԧJ
	end	
end

function LuaS_113290and113291_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
		DisableQuest( TargetID() , true )
		BeginPlot( TargetID() , "LuaS_422592_Play" , 0 )
	else
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SAY_NPC_BUSY]", 0 );
	end
end

function LuaS_422592_Play()
	MoveToFlagEnabled( OwnerID() , false )
	WriteRoleValue( OwnerID() , EM_RoleValue_IsWalk , 1 )
	
	local X = ReadRoleValue( OwnerID() , EM_RoleValue_X )
	local Y = ReadRoleValue( OwnerID() , EM_RoleValue_Y )
	local Z = ReadRoleValue( OwnerID() , EM_RoleValue_Z )
	local Dir = ReadRoleValue( OwnerID() , EM_RoleValue_Dir )
	local Flag = {[113290] = 780405 , [113291] = 780406}
	local KeyItem = {[113290] = 542920 , [113291] = 542921}
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local Count = GetMoveFlagCount(Flag[OrgID])

	AdjustFaceDir( OwnerID(), TargetID() , 0 )
	sleep(5)
	Yell( OwnerID() , "[SC_422592_3]" , 3 ) --�کԧJ���w�i�h�R�q͢�I�کԧJ�]���w��L�H�R�q͢�I
	PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_BUFF_SP01)	
	sleep(30)
	Yell( OwnerID() , "[SC_422592_4]" , 3 ) --���I�ڭ̨��I�ڭ̥h�R�q�کԧJ�I
	for i = 1 , Count -1 , 1 do
		if GetMoveFlagValue( Flag[OrgID] , i , EM_RoleValue_Dir ) then
			DW_MoveToFlag( OwnerID() , Flag[OrgID]  , i , 0 )
		end
	end
	local Urn = Lua_CreateObjByDir( OwnerID() , 113294 , 20 , 0 )
	 sleep( 10 )
	PlayMotion(  OwnerID()  , ruFUSION_ACTORSTATE_EMOTE_IDLE0 )
	sleep(30)
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_EMOTE_IDLE1 )	
	sleep(30)
	AdjustFaceDir( OwnerID(), Urn , 0 )
	sleep(5)
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_CAST_BEGIN )
	sleep(50)
	PlayMotion(  OwnerID() , ruFUSION_ACTORSTATE_CAST_END )
	sleep( 5 )
	Yell( OwnerID() , "[SC_422592_1]" , 3 ) --�IĲ�کԧJ���|�I���کԧJ���D�O�֦b�R�q͢�I
	WriteRoleValue( Urn , EM_RoleValue_LiveTime , 60 )
	WriteRoleValue( Urn , EM_RoleValue_PID , KeyItem[OrgID] )
	Show( Urn , 0 )
	SetPlot( Urn , "touch" ,  "LuaS_422592_Urn" , 50 )
	while 1 do
		if CheckID( Urn ) == false or ReadRoleValue( Urn , EM_RoleValue_OrgID ) ~= 113294 then
			break
		end
		sleep(10)
	end
	Yell( OwnerID() , "[SC_422592_2]" , 3 ) --���������F�I
	DW_MoveToFlag( OwnerID() , Flag[OrgID]  , Count -2 , 0 )
	sleep(5)
	SetPos( OwnerID() , X ,Y ,Z, Dir )
	Hide( OwnerID() )
--	sleep( 50)
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	DisableQuest( OwnerID()  ,false)
	Show( OwnerID() , 0 )
end

function LuaS_422592_Urn()
	local Flag = ReadRoleValue( TargetID() , EM_RoleValue_PID )
	if CheckAcceptQuest( OwnerID() , 422592 ) == true and CheckFlag( OwnerID() , Flag ) == false then
--	if CheckFlag( OwnerID() , Flag ) == false then
		SetPlot( TargetID() , "touch" , "" , 0 )
		SetFlag( OwnerID() , Flag , 1 )
		BeginPlot( TargetID() , "LuaS_422592_Urn_2" , 0 )
	end
end

function LuaS_422592_Urn_2()
	CastSpell( TargetID() , TargetID() , 493688 )
	Sleep(30)
	DelObj( OwnerID() )
end

-------------------------------------------------------------- 422593 ��D��� ----------------------------------------
function LuaS_113295_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422593 ) == true and CheckFlag( OwnerID() , 542924) == false then
--	if CheckFlag( OwnerID() , 542924) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422593_0]" ,"LuaS_422593_1", 0 ) --�A���D�����D��ֳo�q���٪��N��ܡH
	end
	if CheckAcceptQuest( OwnerID() ,422594 ) == true and CheckFlag( OwnerID() , 542925) == false then
--	if CheckFlag( OwnerID() , 542925) == false then
		AddSpeakOption( OwnerID(), TargetID( ),"[SC_422594_0]" ,"LuaS_422594_1", 0 ) --�A���D�K�F��ë�o�q���٪��N��ܡH
	end
end

function LuaS_422593_1()
	SetSpeakDetail( OwnerID() , "[SC_422593_1]" ) --�ڡB�ڨӬݤ@�U......
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422593_2]" ,"LuaS_422593_2", 0 ) --�ڥh���u����v���٬O�ݤ���......
end

function LuaS_422593_2()
	SetSpeakDetail( OwnerID() , "[SC_422593_3]" ) --�S���D�A�ڡB�ڭ��S�{�u��Ū�L�@��......
end

function LuaI_205643_0()
	if CheckAcceptQuest( OwnerID() , 422593 ) == false or CheckFlag( OwnerID() , 542924) == true then
--	if CheckFlag( OwnerID() , 542924) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422593_4]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422593_4]" , 0 ) 
		return
	end

	local WaterTotem = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113296 , 30 ) 
	if WaterTotem < 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422593_5]" , 0 ) --�A��[113214]�٤�����
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422593_5]" , 0 ) 
		return
	else
		if ReadRoleValue( WaterTotem , EM_RoleValue_PID ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422593_6]" , 0 ) --[113214]�W���w�g���@��[205643]�F
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422593_6]" , 0 ) 
			return
		else
			UseItemDestroy()
			BeginPlot( WaterTotem , "LuaI_205643_1" , 0 )
		end
	end
end

function LuaI_205643_1()
	local Player = TargetID()
	local DBID = ReadRoleValue( Player , EM_RoleValue_DBID )
	local Obj = Role:new( OwnerID()  )
	local Urn = CreateObj( 113297 , Obj:X() , Obj:Y() , Obj:Z() ,Obj:Dir() , 1 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 1 )
	SetModeEX( Urn , EM_SetModeType_Gravity , false )
	AddToPartition( Urn , 0 )
	Sleep(30)
	local Ball = CreateObj( 112399 , Obj:X() , Obj:Y() , Obj:Z() ,Obj:Dir()  , 1)
	Lua_ObjDontTouch(Ball) 
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 10 )
	Show( Ball , 0 )
	CastSpell( Ball , Ball , 493668 )
	Delobj( Urn )
	if CheckAcceptQuest( Player , 422593 ) == true and ReadRoleValue( Player, EM_RoleValue_DBID) == DBID then
--	if ReadRoleValue( Player, EM_RoleValue_DBID) == DBID then
		SetFlag( player , 542924 , 1 )
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end
------------------------------------------------------ 422594�K�F��ë ------------------------------
function LuaS_422594_1()
	SetSpeakDetail( OwnerID() , "[SC_422594_1]" ) --�ڡB�ڨӬݤ@�U......
	AddSpeakOption( OwnerID(), TargetID( ),"[SC_422594_2]" ,"LuaS_422594_2", 0 ) --���g��B�~�l�B���Y�C
end

function LuaS_422594_2()
	SetSpeakDetail( OwnerID() , "[SC_422594_3]" ) --�g��......�@�w�{�ׯ�N���K����......
end
function LuaI_422594_Dead()
	if CheckAcceptQuest( TargetID() , 422594 ) == true then
		SetFlag( TargetID() , 542925 , 1 )
	end
	BeginPlot( OwnerID() , "LuaI_422594_Dead2" , 0 )
	return false
end

function LuaI_422594_Dead2()
	local Me = Role:new( OwnerID() )
	local Ball = CreateObj( 112399 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch(Ball) 
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 10 )
	AddToPartition( Ball , 0 )
	CastSpell( Ball , Ball , 493155 )
	LuaFunc_ResetObj( OwnerID() ) 
end

------------------------------------------------- 422596�������� -------------------
function LuaQ_422596_AfterClick()
	if CountBodyItem( OwnerID() , 205645 ) > 0 then
		DelBodyItem( OwnerID() , 205645 , 1 )
		BeginPlot( TargetID() , "Lua_422596_0" , 0 )
		return 1
	else
		return -1
	end
end

function Lua_422596_0()
	local Me = Role:new( OwnerID() )
	local Totem = CreateObj( 113299 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch(Totem) 
	WriteRoleValue( Totem, EM_RoleValue_LiveTime , 30 )
	AddToPartition( Totem , 0 )
end

------------------------------------- 422600�˴��˶� 422623��X���D --------------------
function LuaI_205648_0()
	if CheckAcceptQuest( OwnerID() , 422600 ) == true then
		if CheckFlag( OwnerID() , 542932 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_1]" , 0 ) --�A�w�g���D���p�F�A���ӻ��֦^�h��[113312]���i
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_1]" , 0 ) 
			return 
		end
		local Obj =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113213 , 50 )
		if Obj< 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_2]" , 0 ) --�A����������[113213]�A�ϥ�[205648]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_2]" , 0 ) 
			return 
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_3]" , 0 ) --�A�P����@�ѧ��a�۵h�W�H�μ��㪺�N��
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_3]" , 0 ) 
			BeginPlot( Obj , "LuaI_422600_0" , 0 )
			SetFlag( OwnerID() , 542932 , 1 )
			UseItemDestroy()
			return 
		end
	elseif CheckAcceptQuest( OwnerID() , 422623 ) == true then
		if CheckFlag( OwnerID() , 542933 ) == true then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_1]" , 0 ) --�A�w�g���D���p�F�A���ӻ��֦^�h��[113312]���i
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_1]" , 0 ) 
			return 
		end
		local Obj =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 113212 , 50 )
		if Obj< 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_4]" , 0 ) --�A����������[113212]�A�ϥ�[205648]
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_4]" , 0 ) 
			return 
		else
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_5]" , 0 ) --�A�P����@�ѧϩ��Q�ò椰��Ӥ��_�ä㪺�N��
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_5]" , 0 ) 
			BeginPlot( Obj , "LuaI_422623_0" , 0 )
			SetFlag( OwnerID() , 542933 , 1 )
			UseItemDestroy()
			return 
		end
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205648_0]" , 0 ) --�A�ثe���ݭn�ϥγo�ӪF��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205648_0]" , 0 ) 
	end
end

function LuaI_422600_0()
	local Me = Role:new( OwnerID() )
	local Ball = CreateObj( 112399 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch(Ball) 
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 10 )
	AddToPartition( Ball , 0 )
	CastSpell( Ball , Ball , 493695 )
	sleep( 30 )
end

function LuaI_422623_0()
	local Me = Role:new( OwnerID() )
	local Ball = CreateObj( 112399 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch(Ball) 
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 10 )
	AddToPartition( Ball , 0 )
	CastSpell( Ball , Ball , 493695 )
	sleep( 30 )
end

---------------------------------------------- 422624�����������d�H ---------------------
function LuaI_422624_0()
	AddBuff( OwnerID() , 501081 , 1 , -1 )
end

function LuaI_422624_Dead()
	local Count = HateListCount( OwnerID() )
	for i = 0 , Count-1 , 1 do
		local ppl = HateListInfo(OwnerID() , i  , EM_HateListInfoType_GItemID );
		if CheckAcceptQuest( ppl , 422624 ) == true and GetDistance( OwnerID() , ppl ) < 300 then
--		if GetDistance( OwnerID() , ppl ) < 300 then
			SetFlag( TargetID() , 542934 , 1 )
		end
	end
	BeginPlot( OwnerID() , "LuaI_422624_Dead2" , 0 )
	return false
end

function LuaI_422624_Dead2()
	Hide( OwnerID() )
	local Me = Role:new( OwnerID() )
	local Ball = CreateObj( 112399 , Me:X() , Me:Y() , Me:Z() , Me:Dir() , 1)
	Lua_ObjDontTouch(Ball) 
	WriteRoleValue( Ball , EM_RoleValue_LiveTime , 10 )
	AddToPartition( Ball , 0 )
	CastSpell( Ball , Ball , 491002 )
	LuaFunc_ResetObj( OwnerID() ) 
end

------------------------------------------ 422625���k��D --------------------------
function LuaI_205650_0()
	if CheckAcceptQuest( OwnerID() , 422625 ) == false or CheckFlag( OwnerID() , 542935) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422625_0]" , 0 ) --�A�ثe���ݭn�o��
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422625_0]" , 0 ) 
		return
	end

	local WindTotem = LuaFunc_SearchNPCbyOrgID( OwnerID() , 113212 , 50 ) 
	if WindTotem  < 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422625_1]" , 0 ) --�A��[113212]�٤�����
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422625_1]" , 0 ) 
		return
	else
		BeginPlot( OwnerID() , "LuaI_205650_1" , 0 )
	end
end
function LuaI_205650_1()
	local result = ""
	if BeginCastBar( OwnerID(), "[SC_422625_2]", 10 , ruFUSION_ACTORSTATE_CROUCH_BEGIN , ruFUSION_ACTORSTATE_CROUCH_END , 0 ) ~= 1 then --��m[205650]
		ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
		return
	end	
	while 1 do
		sleep( 2 );
		local CastBarStatus = CheckCastBar( OwnerID() );

		if ( CastBarStatus ~= 0 ) then 
			if ( CastBarStatus > 0) then -- ���\
				result = "OKOK"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			elseif ( CastBarStatus < 0 ) then -- ����
				result = "DAME"
				EndCastBar( OwnerID() , CastBarStatus )
				break;
			end
		end
	end
	if result == "OKOK" then
		if CountBodyItem( OwnerID() , 205650 ) > 0 then
			DelBodyItem( OwnerID() ,205650 , 1 )
			local Bag = Lua_CreateObjByDir( OwnerID()  , 113300, 5 , 0) 
			Lua_ObjDontTouch( Bag ) 
			WriteRoleValue( Bag , EM_RoleValue_LiveTime , 10 )
			AddToPartition( Bag , 0 )
			if CheckAcceptQuest( OwnerID() , 422625 ) == true then
				SetFlag( OwnerID() , 542935 , 1 )
			end
		end
	end
end
----------------------------------------
function LuaS_205427()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205427]" )
	ShowBorder( OwnerID(), 0, "[205427]", "ScriptBorder_Texture_Paper" )	
End

function LuaS_205640()
	ClearBorder( OwnerID())	--��l�ƥ۸O����
	AddBorderPage( OwnerID(), "[SC_205640]" )
	ShowBorder( OwnerID(), 0, "[205640]", "ScriptBorder_Texture_Paper" )	
End

----------------------------------------

function LuaS_422545()  --�n�u����]
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422545)==true )and( Checkflag( OwnerID() , 542937) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422545_0]","LuaS_422545_1",0) --����������o�W�����ܡH
	end
	if	CheckAcceptQuest(OwnerID(),422722)	then
		AddSpeakOption(OwnerID(),OwnerID(),"[SC_422722_0]","LuaS_422722_1", 0 )
	end
end

function LuaS_422545_1()  
	SetSpeakDetail(OwnerID(),"[SC_422545_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422545_2]","LuaS_422545_2",0)	--��Ӧp���C
end

function LuaS_422545_2()  
	SetFlag(OwnerID() ,542937, 1 )
	CloseSpeak( OwnerID())
End

------------------------------------------


function LuaS_422588_1() 	--���M����
	SetSpeakDetail(OwnerID(),"[SC_422588_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422588_2]","LuaS_422588_2",0)	--
end

function LuaS_422588_2()  
	SetSpeakDetail(OwnerID(),"[SC_422588_3]")
	SetFlag(OwnerID() ,542938, 1 )
end

-------------------------------------------

function LuaS_422599()  --�l���ڷ�
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422599)==true )and( Checkflag( OwnerID() , 542893) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422599_0]","LuaS_422599_1",0) --
	end
end

function LuaS_422599_1()  
	SetSpeakDetail(OwnerID(),"[SC_422599_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422599_2]","LuaS_422599_2",0)	--
end

function LuaS_422599_2()  
	SetSpeakDetail(OwnerID(),"[SC_422599_3]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422599_4]","LuaS_422599_3",0)
end

function LuaS_422599_3()  
	SetSpeakDetail(OwnerID(),"[SC_422599_5]")
	SetFlag(OwnerID() , 542893, 1 )
end

----------------------------------------

function LuaS_422604()	--�I��
	if (CheckAcceptQuest(OwnerID(),422604)==true)and(CountBodyItem( OwnerID(),205659) >0)and (CountBodyItem( OwnerID(), 205660 ) < 1)	then

		DelBodyItem( OwnerID(), 205659, 1 )
		GiveBodyItem( OwnerID(), 205660, 1 )
	return true
	End 
	return false
end

----------------------------------------

function LuaS_113312()	--�c�H����I�k
	LuaP_DW_Dead()
	while true do
		sleep(30)
		CastSpell( OwnerID(), OwnerID(), 492667 )
	end
end

----------------------------------------

function LuaS_422531_0()	--�������ȫ�(����)
	if (CheckCompleteQuest(TargetID(),422531)==true )and( Checkflag( TargetID() , 542970) == false)then
		SetFlag(TargetID() , 542970, 1 )
	end
end

function LuaS_422532_0()
	if (CheckCompleteQuest(TargetID(),422532)==true )and( Checkflag( TargetID() , 542971) == false)then
	SetFlag(TargetID() ,542971, 1 )
	end
end

function LuaS_422533_0()
	if (CheckCompleteQuest(TargetID(),422533)==true )and( Checkflag( TargetID() , 542972) == false)then
	SetFlag(TargetID() , 542972, 1 )
	end
end

