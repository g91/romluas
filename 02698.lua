

--z24q425519�G�ߤ�c
function Lua_Z24Q425518_Init()		--Z24�ߤ�c�A�������b����W
		SetPlot( OwnerID(),"touch","Lua_Z24Q425518_Touch",40 );
end
function Lua_Z24Q425518_Touch()
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	DW_CancelMount(O_ID)	--�s�U��
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_USEOBJ_02]", 20, 131, 133, 0, "Lua_TEST110_3" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--�ؼЦ��L��
		end
end
function Lua_TEST110_3(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- ���a
	local T_ID = TargetID()  	-- NPC
	if( CheckStatus ~= 0 ) then
		if( CheckStatus > 0 ) then
			EndCastBar( O_ID, CheckStatus )
			AddBuff(O_ID,622612,0,-1)
			GiveBodyItem(O_ID,241615,1)
			CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		else
			-- ����
			EndCastBar( O_ID, CheckStatus )
			--CallPlot( T_ID, "LuaFunc_ResetObj", T_ID )
		end
	end
end	
--z24q425519�G���b����W�A�ᱼ���~�F�����
function lua_z24Q425518_ThrowItem()
	CancelBuff(OwnerID(),622612)
	BeginPlot(OwnerID(),"lua_z24Q425518_ThrowItem1",1)
end
function lua_z24Q425518_ThrowItem1()
	local num=CountBodyItem(OwnerID(),241615)
	if num~=0 then
		AddBuff(OwnerID(),622612,num-1,-1)
	end
end

--z24q425519�G��ܺ���D�d���A�N���~�^��
function lua_z24NPC121377_S1()
	local O_ID=OwnerID()
	if CountBodyItem( O_ID,241615 )==0 then--or CheckFlag(O_ID,544840)==true then
		LoadQuestOption(O_ID);
	else
		SetSpeakDetail(O_ID,"[SC_Z24NPC121377_1]")
		AddSpeakOption( O_ID,TargetID(),"[SC_Z24NPC121377_2]","lua_z24NPC121377_S2(O_ID)",0 )
	end
end
function lua_z24NPC121377_S2(O_ID)
	--SetSpeakDetail(O_ID,"[SC_Z24NPC121377_1]")
	CallPlot(OwnerID(),"lua_z24NPC121377_Act1")
end
--z24q425519�G���Ĳ�o�Aú�檫�~��R�����a���W��buff�M���@����
function lua_z24NPC121377_Act1()
	local O_ID = OwnerID()
	CloseSpeak( O_ID );
	CancelBuff( O_ID,622612 );
	local ItemN=CountBodyItem( O_ID,241615 )
		DelBodyItem( O_ID,241615,ItemN );
		if ItemN>=1 then
			for i=1,ItemN do
				DW_QietKillOne( 0,107060)
				AddBuff( O_ID,622613,0,-1 )
			end
			local BuffPower=Lua_BuffPowerSearch( O_ID , 622613 )
			if BuffPower>=8 then 
				--SetFlag( OwnerID(),544840,1 ) 	
				CancelBuff( O_ID,622613 );
			end
		end
end
--z24q425519�G�j�M�ؼШ��W���Y��buff�A�æ^�ǥL���h��
function Lua_BuffPowerSearch( Obj , BuffID )
	local Power=0
	local Count = BuffCount( Obj );
		for i = 0 , Count-1 , 1 do
			if BuffInfo( Obj , i , EM_BuffInfoType_BuffID ) == BuffID then
				Power = BuffInfo( Obj , i , EM_BuffInfoType_Power )+1
				--DebugMsg( 0,0,"the BuffPower is "..Power )
				return Power
			end
		end
	return Power
end
--z24q425519�G�������Ȫ��ɭԧ�buff����
function lua_z24Q425518_INI()
	CancelBuff( OwnerID(),622613 );
	--SetFlag( OwnerID(),544840,0)
end

--�m�Ÿ˸m����l�S��
function lua_z24useInEngine()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP )
	AddBuff( OwnerID(),622614,1,-1 )
end

--�Z�����o�W�L1000,�^�Ǥ@�Ӱ}�C
function SearchRangeNPCOrgID( Dis )
	--
	if Dis>=1000 or Dis==nil then Dis=50 end
	--
  	local u = { }
	local t=SearchRangeNPC( OwnerID(),Dis )
		for i,v in pairs(t) do 
			u[ReadRoleValue(t[i],EM_RoleValue_OrgID)] = v
		 end
		return u
end

--������Ϥ��A���ɦ�X�w����ܡC�w�L�ΡC
function lua_Q425119_Speak()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),425119) then
		SetFlag(OwnerID(),546712,1)
	end
end
--����Ҧ��A�I���ᵹ��K
function lua_Q425120_BODY()
	AG_NoHPMP()
	AddBuff( OwnerID(),623133,0,-1 )
	SetPlot( OwnerID(),"touch","lua_Q425120_BODY_touch",20 )
end
function lua_Q425120_BODY_touch()
	local player =OwnerID()
	if CountBodyItem(player,241618)==0 then
		DialogClose( player )
		DialogCreate( player , EM_LuaDialogType_YesNo  , GetString("SC_Z24Q425120_2")); --/*���ɴİ��ݭn 9 �ȡA�T�w���ɶܡH
		DialogSelectStr( player , GetString("SO_YES") );
		DialogSelectStr( player , GetString("SO_NO") );

		if( DialogSendOpen( player ) == false ) then 
			ScriptMessage( player,player,1,GetString("SYS_FIXEQ_DATA_ERROR"),0);	
			--��ưe�X�����D
			return
		end

		local SelectID = Hsiang_GetDialogResoult( player );
		if SelectID == 0  then
			CallPlot( player,"lua_Q425120_BODY_AddBuff",player,TargetID())
			GiveBodyItem(player,241618,1 )
		else
	 		ScriptMessage( player,player,2,"[SC_Z24Q425120_3]",0)
		end
	else
	 	ScriptMessage( player,player,3,"[SC_Z24NPC120981_1]",0)
	end
end
function lua_Q425120_BODY_AddBuff(player,obj)
	Sleep(10)
	ScriptMessage( player,player,1,"[SC_Z24Q425120_1]",0 )
	SysCastSpellLv( obj,player,850384,1)
end
--���ȵ����ɡA�ǰe���a���}
function lua_Q425120_EndQueset()
	CallPlot( TargetID(),"lua_Q425120_EndQueset_1",TargetID())
end
function lua_Q425120_EndQueset_1(player)
	CancelBuff_NoEvent( player,623331 )
	AddBuff( player,620265,0,3 )
	PlayMotion( player,ruFUSION_ACTORSTATE_SLEEP_LOOP )
	Sleep(10)
	AddBuff( player,620001,0,2 )
	Sleep(10)
	SetPosByFlag( player,780867,2 )
end
--�q�@�ӫ��w�a�I���ͦh�������X��
function lua_AgCreateFlag_moreAngle()
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local flag=781182
	local dis=70
	local angle=6
	CreateFlag( flag , 0  , BaseX,BaseY,BaseZ,BaseDir  )
 	local Inc = 1;
	for j=1,4,1 do
		for i = 1 , angle , 1 do
			local tmpY = GetHeight(	BaseX+dis*math.cos(2*math.pi*(i/angle)),BaseY,BaseZ-dis*math.sin(2*math.pi*(i/angle)) )
			CreateFlag( flag , Inc  , BaseX+dis*math.cos(2*math.pi*(i/angle)),tmpY,BaseZ-dis*math.sin(2*math.pi*(i/angle)),BaseDir  )		
			Inc = Inc + 1	
			Sleep( 1 )
		end 
		dis=dis+70
		angle=angle+4
	end
end

--������
function lua_AirattackCamp_CastFire()
	local flagID=781182
	local tmp={}
	local tmpNothing={}
	local catchNum={}
	local attackTag={}
	local RoomID=ReadRoleValue( flagID , EM_RoleValue_RoomID )
		for i=1,31,1 do tmp[i]=i end	
		catchNum=Lua_TableRuleOut( tmp,tmpNothing,20 )	--��8�Ӧ�m
		
		for i=1,#catchNum,1 do
			attackTag[i]=CreateObjByFlag( 107069,flagID,catchNum[i],1 )

 		--	SetModeEx( attackTag[i]  , EM_SetModeType_Show , false )--�i�������
			SetModeEx( attackTag[i]  , EM_SetModeType_Strikback, false )--����
 			SetModeEx( attackTag[i]  , EM_SetModeType_SearchenemyIgnore, false )--�Q�j�M
 			SetModeEx( attackTag[i]  , EM_SetModeType_Obstruct, false )--����
 			SetModeEx( attackTag[i]  , EM_SetModeType_Mark, false )--�аO
 			SetModeEx( attackTag[i]  , EM_SetModeType_Move, false )--����
 			SetModeEx( attackTag[i]  , EM_SetModeType_Searchenemy, false )--����
			SetModeEx( attackTag[i]  , EM_SetModeType_HideName, true )--�W��
 			SetModeEx( attackTag[i]  , EM_SetModeType_ShowRoleHead, false )--�Y����
			SetModeEx( attackTag[i]  , EM_SetModeType_Fight , true )--�i�������
			AddToPartition( attackTag[i],RoomID )
			Sleep(1)
		end
		DebugMsg(0,0,"--CreateObjSuccess--")
		Sleep(50)
		for j=1,15 do
			for i=1,#catchNum,1 do
				--CastSpell( Var_AttackObj_1,attackTag[i],850320 )	--�ѭ����y
				--SysCastSpellLv( Var_AttackObj_1,attackTag[i],850320,4 )
				Sleep(5)
				PlayMotion(attackTag[i],ruFUSION_MIME_CAST_SP01)
				--Sleep(5)
			end
		end
		Sleep(30)
		for i=#catchNum,1,-1 do
			DelObj(attackTag[i])
		end
		DebugMsg(0,0,"--End--")
	CallPlot(OwnerID(),"lua_Z24AirattackCamp_Sleep",0)
end
--�����l
function lua_ObjAttacktheFirstCamp_init()
	Var_AttackObj_1=OwnerID()
end
--�����l
function lua_Z24AirattackCamp_Init()
	lua_AgCreateFlag_moreAngle()
	Sleep(9)
	lua_AirattackCamp_CastFire()
end
--
function lua_Z24AirattackCamp_Sleep()
	Sleep(150)
	CallPlot(OwnerID(),"lua_AirattackCamp_CastFire",0)
end
--
function lua_Z24SetDefIdleMotion_Bow()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_IDLE_COMBAT_BOW )
end

--�Ǫ����դj�����A����
function lua_AGtestUncleTalk2U()
	SetPlot(OwnerID(),"touch","lua_AGtestTalk2U",50)
	SetCursorType( OwnerID() , eCursor_Speak) 
end
function lua_AGtestTalk2U()
	NpcSay(TargetID(),"FUCKKKKKKKKKKKKKKKUUUUUUUUU")
end
--z24�ǰe���Ϊ�buff
function Lua_Z24Trans_AGBuff()
	--AddBuff(OwnerID(), 622311, 1, -1)
	CastSpell(OwnerID(), OwnerID(), 850390)	
end

--����425525�ǰe�����u�@��
function lua_AgCreateFlag_testCircle()
	SetDefIdleMotion( OwnerID(),ruFUSION_MIME_JUMP_LOOP )
	local Owner = Role:new( OwnerID() ) 
	local BaseX = Owner:X()
 	local BaseY = Owner:Y();
 	local BaseZ = Owner:Z();
 	local BaseDir = Owner:Dir();
	local tmpY = 0
	local dis = 60
		Var_Z24Q425525_Product = Var_Z24Q425525_Product or {}
		Var_Z24Q425525_Product[ OwnerID() ] = {}	
		Var_Z24Q425525_Product[ OwnerID() ][3]={ BaseX,BaseY,BaseZ,BaseDir }
		tmpY = GetHeight( BaseX-dis*math.cos((BaseDir+60)*math.pi/180),BaseY,BaseZ+dis*math.sin((BaseDir+60)*math.pi/180) )
		Var_Z24Q425525_Product[ OwnerID() ][1] = { BaseX-dis*math.cos((BaseDir+60)*math.pi/180),tmpY,BaseZ+dis*math.sin((BaseDir+60)*math.pi/180),(BaseDir+60)  }
		tmpY = GetHeight( BaseX-dis*math.cos((BaseDir-60)*math.pi/180),BaseY,BaseZ+dis*math.sin((BaseDir-60)*math.pi/180) )
		Var_Z24Q425525_Product[ OwnerID() ][2] = { BaseX-dis*math.cos((BaseDir-60)*math.pi/180),tmpY,BaseZ+dis*math.sin((BaseDir-60)*math.pi/180),(BaseDir-60)  }
		local Var_Z24location = Var_Z24Q425525_Product[ OwnerID() ]
		for i=1,2,1 do
			local Obj = CreateObj ( 106769 , Var_Z24location[i][1] , Var_Z24location[i][2]-20 , Var_Z24location[i][3] , Var_Z24location[i][4] , 1) 
			SetModeEx ( Obj,EM_SetModeType_Obstruct,true )
			SetModeEx ( Obj,EM_SetModeType_Gravity,false )
			SetModeEx ( Obj,EM_SetModeType_NotShowHPMP,false )
			AddToPartition( Obj,0 )
		end
	SetPlot( OwnerID(),"range","lua_Z24Q425525_CraMomster",100 )
end
function lua_Z24Q425525_CraMomster( )
	if ReadRoleValue(TargetID(),EM_RoleValue_Register1)~=0 then 
		return 
	else
		WriteRoleValue(TargetID(),EM_RoleValue_Register1,1)
		CallPlot( TargetID(),"lua_Z24Q425525_CraMomster1",0)
	end
end
function lua_Z24Q425525_CraMomster1( )
	local Var_Z24location = Var_Z24Q425525_Product[ OwnerID() ]
	local monster1 = {};
	local obj = 120979
	local x =10
	Sleep(20)
	while true do
		for i=1,2 do
			monster1[i] = CreateObj ( obj , Var_Z24location[i][1] , Var_Z24location[i][2]+10 , Var_Z24location[i][3] , Var_Z24location[3][4] , 1) 
			SetModeEx ( monster1[i],EM_SetModeType_Gravity,false )
			WriteRoleValue( monster1[i]  ,EM_RoleValue_IsWalk , 0  )
			--SetModeEx ( monster1[i],EM_SetModeType_Move,false )
			AddToPartition( monster1[i],0 )
			CallPlot( monster1[i] ,"lua_CraMomsterAg_Delobj",0)
			Move( monster1[i], Var_Z24location[3][1] , Var_Z24location[3][2] , Var_Z24location[3][3] )
		end
		Sleep(x)
		DebugMsg(0,0,x)
		if x== 3 then break end
		x=x-1
	end
	WriteRoleValue(OwnerID(),EM_RoleValue_Register1,0)
end
function lua_CraMomsterAg_Delobj()
	Sleep(20)
	CastSpell(OwnerID(),OwnerID(),850389)
	Sleep(3)
	DelObj(OwnerID())
end
--�s�D�J�f���ǰe����
function Lua_Z24Q120988_PortalInit()
	function Lua_UPYamaPortal()
		local Player = OwnerID();	
		if CheckAcceptQuest(OwnerID(),425697)==true or CheckCompleteQuest(OwnerID(),425697)==true then
			SetPosByFlag( OwnerID(),780871 , 1 );							--�e�W�s				
		end
	end
	function Lua_DownYamaPortal()
		local Player = OwnerID();	
--		if CheckAcceptQuest(OwnerID(),424529)==true or CheckCompleteQuest(OwnerID(),424529)==true then
			SetPosByFlag( OwnerID(),780871 , 0 );							--�e�U�s		
--		end
	end
	local Portal = OwnerID();
	local PID = ReadRoleValue( Portal , EM_RoleValue_PID )
	if PID == 1 then
		SetPlot( Portal , "Collision" , "Lua_UPYamaPortal" , 50 );
	else
		SetPlot( Portal , "Collision" , "Lua_DownYamaPortal" , 50 );
	end
end

--�G�m�ζǰe��
function lua_Z24LayMonsterUse_1()
	AddBuff( OwnerID(),621663,0,-1 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_SLEEP_LOOP )
end
--425520�G���y�P�M�w
function lua_z24121378_sz()
	local player = OwnerID()
	if CheckAcceptQuest( player,425520 )==true and
	CheckFlag( player,546725 )==false	then
		SetSpeakDetail( player,"[SC_Z24Q425520_1]")
		AddSpeakOption( player,player,"[SC_Z24Q425520_2]","lua_z24121378_A(2)",0 )
	else
		LoadQuestOption( player )
	end
end
function lua_z24121378_A(x)
	x=x+1
	local player = OwnerID()
	local y=x+1
	if x>=7 then
		SetSpeakDetail( player,"[SC_Z24Q425520_7]")
		SetFlag( OwnerID(),546725,1 )
	else
		SetSpeakDetail( player,"[SC_Z24Q425520_"..x.."]")
		AddSpeakOption( player,player,"[SC_Z24Q425520_"..y.."]","lua_z24121378_A("..y..")",0 )
	end
end

--���ȸѫʪ��L���A���}�_�c�e�ˬd�C
function lua_Q425698_OnClickObjBegin()
	local key = CountBodyItem( OwnerID(),241832)
	if key >= 1 then
		return true
	end
	ScriptMessage( OwnerID(),OwnerID(),3,"[SC_I425698_1]",0)
	return false
end
--�R�����R�_�c���_
function lua_Q425698_OnClickObjEnd()
	GiveBodyItem(OwnerID(),242035,1)
	DelBodyItem( OwnerID(),241832,1 )
	return 1
end

--���`�|�Q�H��A�����b�L�۰���107478 ���W
function Lua_Z23Q425532_Init()
	SetPlot( OwnerID(),"dead","Lua_Z23Q425532_GetM",0)
end
function Lua_Z23Q425532_GetM()
	local hateNum=HateListCount( OwnerID() )
	local tagObj=0
	for i=0,hateNum do
		tagObj = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID)
		if CheckAcceptQuest( tagObj,425532 ) and CountBodyItem( tagObj,242061 )==0 then
			GiveBodyItem( tagObj,242061,1 )
		end
	end
end