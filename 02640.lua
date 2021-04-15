
--階段1進階段2時的表演

function lua_AC1L1conectL2()
	DebugMsg( 0,0,"AC1,P1_TO_P2,CONNECTSHOW1")
--	CallPlot(OwnerID(),"lua_AC1npcHide",OwnerID())	--隱藏第一階段npc
--	local TableNPC = SearchRangeNPC( Var_AC1_MainCtrl ,350 )
	local Phase= GetWorldVar( "Zone2_WorldPE_Phase");
	if Phase ==5 then
		lua_Zone2AC1_ShowNPC(Phase)
	end
	local Guide = 0
	local Crystal = 0
	local Witch = 0
	local NPCT={}
	local x1,y1,z1,dir1 =4023,47,-954,233
	local x2,y2,z2,dir2 =4114,47,-1084,231
		Guide = CreateObj( 120505, x1,y1,z1,dir1 , 1 )	--許願池的引導者
		SetModeEx( Guide ,  EM_SetModeType_Mark , false)
		AddToPartition( Guide,0 )
		Crystal = CreateObj( 120506 , x2,y2,z2,dir2, 1 )	--祈願之力
		SetModeEx( Crystal ,  EM_SetModeType_Mark , false)
		AddToPartition( Crystal,0 )
		MoveToFlagEnabled( Guide, false ); 
		LuaFunc_MoveToFlag( Guide , 780871 , 1 , 0 )		--旗1
		Sleep(50)
		AdjustFaceDir( Guide , Crystal , 0)
		Sleep(10)
		Say( Guide , "[SC_AC1L1SHOW_01]" )
		Sleep(30)
		Say( Guide , "[SC_AC1L1SHOW_02]" )
		Sleep(40)
		Say( Guide , "[SC_AC1L1SHOW_03]" )
		Sleep(30)
		Witch=CreateObjByFlag( 120507,780871 , 2 , 1 )	--旗2	--神祕的占卜師
		SetModeEx( Witch ,  EM_SetModeType_Mark , false)
		AddToPartition( Witch , 0 )
		MoveToFlagEnabled( Witch, false ); 
		LuaFunc_MoveToFlag( Witch , 780871 , 3 , 0 )		--旗3
		Sleep(20)
		Say( Witch , "[SC_AC1L1SHOW_04]" )
		Sleep(30)
		AdjustFaceDir( Guide ,Witch , 0 )
		Say( Guide , "[SC_AC1L1SHOW_05]" )
		Sleep(30)
		Say( Guide , "[SC_AC1L1SHOW_06]" )
		Sleep(30)
		Say( Witch , "[SC_AC1L1SHOW_07]" )
		Sleep(30)
		Say( Witch , "[SC_AC1L1SHOW_08]" )
		Sleep(30)
		Say( Guide , "[SC_AC1L1SHOW_09]" )
		Sleep(30)
			for i=1,4 do
				NPCT[i]=CreateObjByFlag( 120508,780871 , 3+i , 1 )   --旗4~7
				SetModeEx( NPCT[i] ,  EM_SetModeType_Mark , false)
				AddToPartition( NPCT[i] , 0 )
				AddBuff( NPCT[i] , 621998 , 0 , -1 )
				CastSpell( NPCT[i] , Crystal , 850001 )
			end
		CancelBuff( Crystal , 622001 )
		AddBuff( Crystal , 621999 , 0 ,-1 )
		Sleep(30)
		Say( Guide , "[SC_AC1L1SHOW_10]" )
		Sleep(30)
		--
		CastSpell( Witch , Guide , 496674  )
		Sleep(10)
		PlayMotion( Guide, 145 )
		Sleep(30)
		Say( Witch , "[SC_AC1L1SHOW_11]" )
		Sleep(40)
		Say( Witch , "[SC_AC1L1SHOW_12]" )
		Sleep(40)
		Say( Witch , "[SC_AC1L1SHOW_13]" )
		Sleep(40)
		Say( Witch , "[SC_AC1L1SHOW_14]" )
		Sleep(20)
		if lua_ACuseRealZoneID( OwnerID() ) then
			local ZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_ZoneID )
			local RealZoneID = ReadRoleValue( OwnerID() , EM_RoleValue_RealZoneID ) --會讀到真實的分流區域
			if ZoneID == RealZoneID then --增加避免多分流重覆廣播的判斷
				RunningMsgEx( OwnerId(), 2 , 3 , "[SC_AC1MSG_1]" )	--放訊息
			end
		end
		Sleep(30)
		Say( Witch , "[SC_AC1L1SHOW_15]" )
		Sleep(40)
		Say( Witch , "[SC_AC1L1SHOW_16]" )
		PlayMotion(Witch , 108 )
		Sleep(50)
		DelObj(Guide)
		DelObj(Crystal)
		DelObj(Witch)
			for i=1,4 do
				DelObj( NPCT[i] )
			end
		WriteRoleValue( OwnerID(),EM_RoleValue_PID,0 )
		if lua_ACuseRealZoneID( OwnerID() ) then
			lua_AC1_ChangePH(2)		--進第2階段
		end
end
--出現npc
function lua_Zone2AC1_ShowNPC( ph )
	if ph == 1 then
		CallPlot( OwnerID(),"lua_AC1npcShow",OwnerID())
		if Var_AC1_NpcGlobal_PH2[1] ~= nil then
			ACWB_L2_DELNpc2()		--刪除第二階段表演人員
		end
		if Var_AC1_NpcGlobal_PH3[1] ~= nil then
			for ObjNum , ObjID in pairs( Var_AC1_NpcGlobal_PH3 ) do
				delobj ( ObjID )
			end
		end
	elseif ph == 2 then
		CallPlot( OwnerID(),"lua_AC1npcHide",OwnerID())
		if Var_AC1_NpcGlobal_PH2[1] == nil then
			ACWB_L2_CreatNpc1()
		end
		if Var_AC1_NpcGlobal_PH3[1] ~= nil then
			for ObjNum , ObjID in pairs( Var_AC1_NpcGlobal_PH3 ) do
				delobj ( ObjID )
			end
		end
	elseif ph == 3 then
		CallPlot( OwnerID(),"lua_AC1npcHide",OwnerID())
		if Var_AC1_NpcGlobal_PH2[1] ~= nil then
			ACWB_L2_DELNpc2()		--刪除第二階段表演人員
		end
	elseif ph == 5 then
		CallPlot( OwnerID(),"lua_AC1npcHide",OwnerID())
		if Var_AC1_NpcGlobal_PH2[1] ~= nil then
			ACWB_L2_DELNpc2()		--刪除第二階段表演人員
		end
	else
		CallPlot( OwnerID(),"lua_AC1npcHide",OwnerID())
		if Var_AC1_NpcGlobal_PH2[1] ~= nil then
			ACWB_L2_DELNpc2()		--刪除第二階段表演人員
		end
		if Var_AC1_NpcGlobal_PH3[1] ~= nil then
			for ObjNum , ObjID in pairs( Var_AC1_NpcGlobal_PH3 ) do
				delobj ( ObjID )
			end
		end
	end
end
--製造賢者之眼表演者，停止功能
function ACWB_L2_ctrlNpc()
	return	
end
--建立第二階段表演人員
function ACWB_L2_CreatNpc1( )
	Var_AC1_NpcGlobal_PH2 = Var_AC1_NpcGlobal_PH2 or {}
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) ----紀錄讀取到的層數
		--產生門
		Var_AC1_NpcGlobal_PH2[1] = CreateObjByFlag( 120509 , 781060 , 10 , 1 ) 
		ACWB_L2_SetMode(Var_AC1_NpcGlobal_PH2[1] )
		AddToPartition( Var_AC1_NpcGlobal_PH2[1]  , RoomID )
		AddBuff( Var_AC1_NpcGlobal_PH2[1] , 622003 , 0 , -1 )
		--產生法師
		Var_AC1_NpcGlobal_PH2[2] = CreateObjByFlag( 117967 , 780871 , 4 , 1 ) 
		ACWB_L2_SetMode( Var_AC1_NpcGlobal_PH2[2] )
		AddToPartition( Var_AC1_NpcGlobal_PH2[2]  , RoomID )
		AddBuff( Var_AC1_NpcGlobal_PH2[2] , 622000 , 0 ,-1 )
		SetDefIdleMotion( Var_AC1_NpcGlobal_PH2[2] , 82 )
		AddBuff( Var_AC1_NpcGlobal_PH2[2] , 622002 , 0 ,-1 )
		Var_AC1_NpcGlobal_PH2[3] = CreateObjByFlag( 117985 , 780871 , 6 , 1 ) 
		ACWB_L2_SetMode( Var_AC1_NpcGlobal_PH2[3] )
		AddToPartition( Var_AC1_NpcGlobal_PH2[3]  , RoomID )
		AddBuff( Var_AC1_NpcGlobal_PH2[3] , 622000 , 0 ,-1 )
		SetDefIdleMotion( Var_AC1_NpcGlobal_PH2[3] , 82 )
		AddBuff( Var_AC1_NpcGlobal_PH2[3] , 622002 , 0 ,-1 )
		Var_AC1_NpcGlobal_PH2[4] = CreateObjByFlag( 120510 , 780871 , 8 , 1 ) 
		AddToPartition( Var_AC1_NpcGlobal_PH2[4]  , RoomID )
end
--刪除第二階段表演人員
function ACWB_L2_DELNpc2( )
	for i=4,1,-1 do
		DelObj(Var_AC1_NpcGlobal_PH2[i])
		Var_AC1_NpcGlobal_PH2[i] =nil
	end
end
--建立人員狀態
function ACWB_L2_SetMode( ObjID )
	SetModeEx ( ObjID , EM_SetModeType_Obstruct, false) 		---阻擋(是)
	SetModeEx( ObjID , EM_SetModeType_Strikback, false) ---反擊(否)
	SetModeEx( ObjID , EM_SetModeType_Move, false) ---移動	(否)
	SetModeEx( ObjID , EM_SetModeType_Searchenemy, false)--索敵(否)
	SetModeEx( ObjID , EM_SetModeType_Mark, false)			---可點選(是)
	SetModeEx( ObjID , EM_SetModeType_ShowRoleHead, false) 		---頭像框(是)
	SetModeEx( ObjID , EM_SetModeType_Fight, false) ---可砍殺(是)
	SetModeEx( ObjID , EM_SetModeType_NotShowHPMP , false) ----不顯示寫條
end
--AC物品，第一階段打開掉寶用
function lua_AJopenTheGift()
	local LV=ReadRoleValue( OwnerID() , EM_RoleValue_LV )
	local num=math.floor((LV-1)/10)-1
	if num==-1 then num=0 elseif num>=6 then num=5 end
	--	DebugMsg(0,0,726040+num)
		GiveBodyItem(OwnerID(),726040+num,1)
end
--120344與帕森的對話，對換武器用
function lua_120344_01()
	local own = OwnerID()
		--SetSpeakDetail( own , "[SC_ACL120344_01]" )
		LoadQuestOption(OwnerID())
		AddSpeakOption( own,TargetID( ),"[SC_ACL120344_02]","lua_120344_02", 0 )--我想兌換素材。
		AddSpeakOption( own,TargetID( ),"[SC_ACL120344_03]","lua_120344_03", 0 )--我想打造[SC_CHAOTIC ]系列武器。

end
--第一部份，對換素材
function lua_120344_02()
	local own = OwnerID()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	local MessageString="[SC_ACL120344_22]"
	local MessageString1=""
		if Phase==1 then
			SetSpeakDetail( own , "[SC_ACL120344_21][$SETVAR1="..MessageString.."][$SETVAR2="..MessageString1.."]" )
			AddSpeakOption( own,TargetID( ),"[SC_ACL120344_24]","lua_120344_21(1)", 0 )		
		else
			MessageString1="[SC_ACL120344_23]"
			SetSpeakDetail( own , "[SC_ACL120344_21][$SETVAR1="..MessageString.."][$SETVAR2="..MessageString1.."]" )
			AddSpeakOption( own,TargetID( ),"[SC_ACL120344_24]","lua_120344_21(1)", 0 )	--請幫我熔合1個[241143]。
			AddSpeakOption( own,TargetID( ),"[SC_ACL120344_25]","lua_120344_21(2)", 0 )	--我想要兌換1個[241124]。
		end

end
function lua_120344_21(k)
	CloseSpeak(OwnerID())
	if k==1 then
		if DelBodyItem( OwnerID(), 241142 , 30 ) then
			GiveBodyItem( OwnerID(), 241143, 1 ); 
		else
			Npcsay( TargetID() , "[SC_ACL120344_35]" )
		end
	elseif k==2 then
		--if CountBodyItem( OwnerID(), 206045 )>= 5 then
			if DelBodyItem( OwnerID(), 206045 , 5 ) then
			GiveBodyItem( OwnerID(), 241124, 1 ); 
		else
			Npcsay( TargetID() , "[SC_ACL120344_35]" )--你準備的的素材並不足夠，請重新確認。
		end
	end
end

--製作武器選項
function lua_120344_03()
	local own = OwnerID()
	local Phase = GetWorldVar( "Zone2_WorldPE_Phase");
	SetSpeakDetail( own , "[SC_ACL120344_31]" )
	local item=lua_120344_CheckItem()
	if item==0 then
		AddSpeakOption( own,TargetID( ),"[SC_ACL120344_32]","lua_120344_31(0)", 0 )	--素材已確認
	else
		AddSpeakOption( own,TargetID( ),"[SC_ACL120344_32]","lua_120344_31(1)", 0 )	--素材已確認
	end
end

function lua_120344_CheckItem()
	local j=0
	local itemid={ 201932,206042,206043,209509,209510,241133,241134,241135,241136,241137,241138,241139,241140}
	local haveitem={}
		for i=1,#itemid do
			if CountBodyItem(OwnerID(),itemid[i])>=1 then
				table.insert(haveitem,itemid[i])
				j=j+1
			end
		end
		if CountBodyItem(OwnerID(),241143)>=5 
		and CountBodyItem(OwnerID(),241124)>=10 
		and CountBodyItem(OwnerID(),201931)>=1 
		and j>=1 then
			return haveitem
		else
			return 0
		end
end
function lua_120344_31(k) 
	local itemid={ [201932]=213667,
		            [206042]=213668,
		            [206043]=213669,		
		            [209509]=213670,
		            [209510]=213671,
		            [241133]=213672,
		            [241134]=213673,
		            [241135]=213674,
		            [241136]=213675,
		            [241137]=213676,
		            [241138]=213677,
		            [241139]=213678,
		            [241140]=213679 }
	if k==0 then
		SetSpeakDetail( OwnerID() , "[SC_ACL120344_35]" )
	else
		SetSpeakDetail( OwnerID() , "[SC_ACL120344_33]" )
		local item=lua_120344_CheckItem()
		if item~=0 then
			for i=1, #item do	
			--DebugMsg(0,0,item[i])
			AddSpeakOption( OwnerID(),TargetID( ),"[SC_ACL120344_34][$SETVAR1=["..itemid[item[i]].."]]","lua_120344_32("..item[i]..")", 0 )	
			end
		end
	end
end
function lua_120344_32(item)
	CloseSpeak(OwnerID())
	local itemid={ [201932]=213667,
		            [206042]=213668,
		            [206043]=213669,		
		            [209509]=213670,
		            [209510]=213671,
		            [241133]=213672,
		            [241134]=213673,
		            [241135]=213674,
		            [241136]=213675,
		            [241137]=213676,
		            [241138]=213677,
		            [241139]=213678,
		            [241140]=213679 }
	local check=lua_120344_CheckItem()
		if check~=0 and ReadRoleValue(OwnerID(),EM_RoleValue_Money)>=50000 then
			DelBodyItem(OwnerID(),241143,5)
			DelBodyItem(OwnerID(),241124,10)
			DelBodyItem(OwnerID(),201931,1)
			DelBodyItem(OwnerID(),item,1)
			AddRoleValue ( OwnerID() , EM_RoleValue_Money , -50000 );
			GiveBodyItem( OwnerID(), itemid[item], 1 );
		else
			ScriptMessage(  TargetID(),OwnerID(),0,"[SC_AC1_L1_BLESS_M06]",0 );	
		end
end