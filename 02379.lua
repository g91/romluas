function William_SpeakOption424264_1()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424264_01"), "William_GiveFlag545067", 0 );
end
------------------------------------------------------------------------
function William_SpeakOption424264_2()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424264_01"), "William_GiveFlag545068", 0 );
end
------------------------------------------------------------------------
function William_SpeakOption424264_3()
	LoadQuestOption(OwnerID())
	AddSpeakOption( OwnerID(), OwnerID( ), GetString("SC_424264_01"), "William_GiveFlag545069", 0 );
end
------------------------------------------------------------------------
function William_GiveFlag545067()
	CloseSpeak(OwnerID())
	if	CheckScriptFlag (OwnerID(),545067) == 1 then
	else
		setflag(OwnerID(),545067,1)
	end	
end
------------------------------------------------------------------------
function William_GiveFlag545068()
	CloseSpeak(OwnerID())
	if	CheckScriptFlag (OwnerID(),545068) == 1 then
	else
		setflag(OwnerID(),545068,1)
	end	
end
------------------------------------------------------------------------
function William_GiveFlag545069()
	CloseSpeak(OwnerID())
	if	CheckScriptFlag (OwnerID(),545069) == 1 then
	else
		setflag(OwnerID(),545069,1)
	end	
end
------------------------------------------------------------------------
function William_424265()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424265)==TRUE	then
		SetFlag(OwnerID(),545070,1)
	elseif	CheckAcceptQuest(OwnerID(),424257)==true		and
		CountBodyItem(OwnerID(),240226)>0			and
		CheckFlag(OwnerID(),545098)==false			then	
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Howl_02",0)								
	end
end
------------------------------------------------------------------------
function William_509846_1()
	--NPCSay( OwnerID(), "0" )
	AddBuff ( OwnerID() , 509846 , 1 , -1 )
end
------------------------------------------------------------------------
function William_GiveFlag545149()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424270)==TRUE	and
		CountBodyItem(OwnerID(),209635)>=10	then
		DelBodyItem( OwnerID(), 209635, 10 )
		setflag(OwnerID(),545149,1)
	end	
end
------------------------------------------------------------------------
function William_BeginCastBar424267_0()
	--AddBuff ( OwnerID() , 620012 , 1 , -1 )
	SetPlot(OwnerID(),"touch","William_BeginCastBar424267_1",25)
end
------------------------------------------------------------------------
function William_BeginCastBar424267_1()
	if	CheckAcceptQuest(OwnerID(),424267)==TRUE then
		if	CountBodyItem(OwnerID(),209632)>0 then
			CallPlot( OwnerID(), "William_HideShow_01", targetID() )
			AttachCastMotionTool( OwnerID(), 213258 )
			AddBuff ( OwnerID() , 620012 , 1 , 12 )	
			sleep(10)		
			if	BeginCastBarEvent( OwnerID(), TargetID(),"[SC_424267_01]", 110, 134, 136 , 0, "William_BeginCastBar424267_2" ) ~= 1	then
				--ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 )
				--ScriptMessage( OwnerID(), OwnerID(), 2,"[SAY_NPC_BUSY]", 0 )
			end
		else ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424267_02]", c_yellow )
		end
	elseif	CheckAcceptQuest(OwnerID(),424282)==TRUE then
		if	CountBodyItem(OwnerID(),240286)>0 and
			CountBodyItem(OwnerID(),209629)>0 then
			CallPlot( OwnerID(), "William_HideShow_01", targetID() )
			AttachCastMotionTool( OwnerID(), 213258 )
			AddBuff ( OwnerID() , 620012 , 1 , 12 )	
			sleep(10)		
			if	BeginCastBarEvent( OwnerID(), TargetID(),"[SC_424267_01]", 100, 134, 136 , 0, "William_BeginCastBar424282_1" ) ~= 1	then
				--ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
				--ScriptMessage( OwnerID(), OwnerID(), 2,"[SAY_NPC_BUSY]", 0 );
			end
		else ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424282_01]", c_yellow )
		end
	end
end
------------------------------------------------------------------------
function William_BeginCastBar424267_2(ObjID, CheckStatus)
	local num=dw_rand( 10 )
		EndCastBar( ObjID, CheckStatus )
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				if num<=4 then 
					DelBodyItem( ObjID, 209632, 1 )
					GiveBodyItem( ObjID, 209636, 1 )
				elseif num==10 then 
					DelBodyItem( ObjID, 209632, 1 )
					GiveBodyItem( ObjID, 209634, 1 )
				else
					DelBodyItem( ObjID, 209632, 1 )
					GiveBodyItem( ObjID, 209635, 1 )
				end
			else
				DelBodyItem( ObjID, 209632, 1 )
				GiveBodyItem( ObjID, 209634, 1 )
			end
		end
end
------------------------------------------------------------------------
function William_BeginCastBar424282_1(ObjID, CheckStatus)
	local num=dw_rand( 10 )
		EndCastBar( ObjID, CheckStatus )
		if( CheckStatus ~= 0 ) then
			if( CheckStatus > 0 ) then
				if num<=5 then 
					DelBodyItem( ObjID, 209629, 1 )
					DelBodyItem( ObjID, 240286, 1 )
					GiveBodyItem( ObjID, 209636, 1 )
				else
					DelBodyItem( ObjID, 209629, 1 )
					DelBodyItem( ObjID, 240286, 1 )
					GiveBodyItem( ObjID, 209635, 1 )
				end
			else
				DelBodyItem( ObjID, 209629, 1 )
				DelBodyItem( ObjID, 240286, 1 )
				GiveBodyItem( ObjID, 209635, 1 )
			end
		end
end
------------------------------------------------------------------
function William_HideShow_01(target)
	SetModeEx( target, EM_SetModeType_Show, false )
	SetModeEx( target, EM_SetModeType_mark, false )
	sleep(120)
	SetModeEx( target, EM_SetModeType_Show, true )
	SetModeEx( target, EM_SetModeType_mark, true )
end
------------------------------------------------------------------------
function William_AttackPlayer424274_1()
	if	checkAcceptQuest(OwnerID(),424274)==TRUE	and
		CheckFlag( OwnerID(), 545148 )==false	then
		callplot(TargetID(),"William_AttackPlayer424274_2",OwnerID())
	end
	LoadQuestOption(OwnerID())	
end
------------------------------------------------------------------
function William_AttackPlayer424274_2(Player)
	CloseSpeak(Player)
	local x={}
	local y
	local z={}
	x=SearchRangeNPC ( OwnerID() , 200 ) 	
	y=table.getn(x)		
		for i=0,y,1 do
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==118534	then
				table.insert(z,x[i])
			end
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==118535	then
				table.insert(z,x[i])
			end
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==118536	then
				table.insert(z,x[i])
			end
		end
	SetRoleCamp( z[1],"Monster")
	SetRoleCamp( z[2],"Monster")
	SetRoleCamp( z[3],"Monster")
	NPCSay( z[1], "[SC_424274_01]" )
	NPCSay( z[3], "[SC_424274_02]" )
	SetAttack( z[1] , Player )
	SetAttack( z[2] , Player )
	SetAttack( z[3] , Player )
	callplot( OwnerID(),"William_AttackPlayer424274_3",z[1], z[2], z[3],Player)
end
------------------------------------------------------------------
function William_AttackPlayer424274_3( a , b , c, Player )
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--Say(OwnerID(),"1")
	local x
	local y
	local z
	local mon=CreateObj_ByObjPoint(OwnerID(),114357,"p_down") 
	AddToPartition( mon,RoomID )
	SetModeEx( mon  , EM_SetModeType_Mark, false )
		for i=0, 60 , 1 do
			if	CheckDistance(Player,mon,250)==false then
					CallPlot(OwnerID(),"William_AttackPlayer424274_4",a,b,c,mon)
			end
			x = ReadRoleValue ( a , EM_RoleValue_HP ) /ReadRoleValue ( a , EM_RoleValue_MaxHP) 
			y = ReadRoleValue ( b , EM_RoleValue_HP ) /ReadRoleValue ( b , EM_RoleValue_MaxHP) 
			z = ReadRoleValue ( c , EM_RoleValue_HP ) /ReadRoleValue ( c , EM_RoleValue_MaxHP) 
			Sleep(10)
			if x <= 0.35 then
				SetStopAttack(Player)
				ClearHateList( a , -1 ) 
				ClearHateList( b , -1 )
				ClearHateList( c , -1 )
				SetRoleCamp( a ,"SNPC")
				SetRoleCamp( b ,"SNPC")
				SetRoleCamp( c ,"SNPC")
				Say( b, "[SC_424274_03]" )
				Sleep( 10 ) 
				Say( c, "[SC_424274_04]" )
				Sleep( 10 )
				CallPlot(a,"LuaFunc_ResetObj",a)
				CallPlot(b,"LuaFunc_ResetObj",b)
				CallPlot(c,"LuaFunc_ResetObj",c)
				DelObj(mon)
					if	checkAcceptQuest(Player,424274)==TRUE	then
						Setflag( Player,545148,1 )
					end
				return		
			end
			if y <= 0.35 then
				SetStopAttack(Player)
				ClearHateList( b , -1 ) 
				ClearHateList( c , -1 )
				ClearHateList( a , -1 )
				SetRoleCamp( b ,"SNPC")
				SetRoleCamp( c ,"SNPC")
				SetRoleCamp( a ,"SNPC")
				Say( a, "[SC_424274_03]" )
				Sleep( 10 ) 
				Say( c, "[SC_424274_04]" )
				Sleep( 10 )
				CallPlot(b,"LuaFunc_ResetObj",b)
				CallPlot(c,"LuaFunc_ResetObj",c)
				CallPlot(a,"LuaFunc_ResetObj",a)
				DelObj(mon)
					if	checkAcceptQuest(Player,424274)==TRUE	then
						Setflag( Player,545148,1 )
					end
				return		
			end
			if z <= 0.35 then
				SetStopAttack(Player)
				ClearHateList( c , -1 ) 
				ClearHateList( a , -1 )
				ClearHateList( b , -1 )
				SetRoleCamp( c ,"SNPC")
				SetRoleCamp( a ,"SNPC")
				SetRoleCamp( b ,"SNPC")
				Say( a, "[SC_424274_03]" )
				Sleep( 10 ) 
				Say( b, "[SC_424274_04]" )
				Sleep( 10 )
				CallPlot(c,"LuaFunc_ResetObj",c)
				CallPlot(a,"LuaFunc_ResetObj",a)
				CallPlot(b,"LuaFunc_ResetObj",b)
				DelObj(mon)
					if	checkAcceptQuest(Player,424274)==TRUE	then
						Setflag( Player,545148,1 )
					end
				return		
			end
		end
		SetRoleCamp( a ,"SNPC")				
		SetRoleCamp( b ,"SNPC")				
		SetRoleCamp( c ,"SNPC")
		CallPlot(a,"LuaFunc_ResetObj",a)
		CallPlot(b,"LuaFunc_ResetObj",b)
		CallPlot(c,"LuaFunc_ResetObj",c)
		DelObj(mon)

end
------------------------------------------------------------------------
function William_AttackPlayer424274_4(a,b,c,mon)
		ClearHateList( a , -1 ) 
		ClearHateList( b , -1 )
		ClearHateList( c , -1 )
		SetRoleCamp( a ,"SNPC")
		SetRoleCamp( b ,"SNPC")
		SetRoleCamp( c ,"SNPC")
		CallPlot(a,"LuaFunc_ResetObj",a)
		CallPlot(b,"LuaFunc_ResetObj",b)
		CallPlot(c,"LuaFunc_ResetObj",c)
		DelObj(mon)
end
------------------------------------------------------------------------
function William_FX118459()
	AddBuff ( OwnerID() , 620028 , 1 , -1 )
	sleep(10)
	AddBuff ( OwnerID() , 620030 , 1 , -1 )
end
------------------------------------------------------------------------
function William_424272_A2()
	SetSpeakDetail(OwnerID(),"[SC_424272_A2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_A3]","William_424272_A3",0)
end
------------------------------------------------------------------------
function William_424272_A3()
	if	CountBodyItem(OwnerID(),240242)>=1	then		--已有空白的便箋
		if	CountBodyItem(OwnerID(),240273)==0	then	--未有Ａ內容便箋
				DelBodyItem( OwnerID(), 240242, 1 )		--刪除空白的便箋
				GiveBodyItem( OwnerID(), 240273, 1 )		--給予Ａ內容便箋
				CloseSpeak( OwnerID() )
		else	CloseSpeak( OwnerID() )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE02]", c_yellow )
		end
	else	CloseSpeak( OwnerID() )
		ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE01]", c_yellow )
	end
end
------------------------------------------------------------------------
function William_424272_B1()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_B1]"," William_424272_B2",0)
	end
end
------------------------------------------------------------------------
function William_424272_B2()
	SetSpeakDetail(OwnerID(),"[SC_424272_B2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_B3]","William_424272_B3",0)
end
------------------------------------------------------------------------
function William_424272_B3()
	if	CountBodyItem(OwnerID(),240242)>=1	then			--已有空白的便箋
		if	CountBodyItem(OwnerID(),240274)==0	then		--未有B內容便箋
				DelBodyItem( OwnerID(), 240242, 1 )		--刪除空白的便箋
				GiveBodyItem( OwnerID(), 240274, 1 )		--給予B內容便箋
				CloseSpeak( OwnerID() )
		else	CloseSpeak( OwnerID() )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE02]", c_yellow )
		end
	else	CloseSpeak( OwnerID() )
		ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE01]", c_yellow )
	end
end
------------------------------------------------------------------------
function William_424272_C1()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_C1]"," William_424272_C2",0)
	end
end
------------------------------------------------------------------------
function William_424272_C2()
	SetSpeakDetail(OwnerID(),"[SC_424272_C2]")
	AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_C3]","William_424272_C3",0)
end
------------------------------------------------------------------------
function William_424272_C3()
	if	CountBodyItem(OwnerID(),240242)>=1	then			--已有空白的便箋
		if	CountBodyItem(OwnerID(),240275)==0	then		--未有C內容便箋
				DelBodyItem( OwnerID(), 240242, 1 )		--刪除空白的便箋
				GiveBodyItem( OwnerID(), 240275, 1 )		--給予C內容便箋
				CloseSpeak( OwnerID() )
		else	CloseSpeak( OwnerID() )
			ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE02]", c_yellow )
		end
	else	CloseSpeak( OwnerID() )
		ScriptMessage( OwnerID(), OwnerID(), 2,"[SC_424272_FALSE01]", c_yellow )
	end
end
------------------------------------------------------------------------
function Will_openmemo_A()
		ClearBorder(OwnerID())		
		AddBorderPage(OwnerID(),"[SC_424272_A]")
		ShowBorder(OwnerID(),0,"[SC_424272_A0]","ScriptBorder_Texture_Paper")
end
------------------------------------------------------------------------
function Will_openmemo_B()
		ClearBorder(OwnerID())		
		AddBorderPage(OwnerID(),"[SC_424272_B]")
		ShowBorder(OwnerID(),0,"[SC_424272_B0]","ScriptBorder_Texture_Paper")
end
------------------------------------------------------------------------
function Will_openmemo_C()
		ClearBorder(OwnerID())		
		AddBorderPage(OwnerID(),"[SC_424272_C]")
		ShowBorder(OwnerID(),0,"[SC_424272_C0]","ScriptBorder_Texture_Paper")
end
------------------------------------------------------------------------
function William_GiveFlag545172()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424275)==TRUE
	and	CountBodyItem(OwnerID(),240246)>0	then	
		setflag(OwnerID(),545172,1)
	end
end
------------------------------------------------------------------------
function William_GiveFlag545173()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424276)==TRUE
	and	CountBodyItem(OwnerID(),240219)>0	then
		setflag(OwnerID(),545173,1)
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_GiveFlag544801()
		setflag(OwnerID(),544801,1)	--我不想生帕奇鼠
end
------------------------------------------------------------------------
function William_checktrees()
	local x={}
	x=SearchRangeNPC ( OwnerID() , 75 )
	local num=table.getn(x)				--取得陣列的大小
			for i = 0, num ,1 do
				--NPCSay( x[i] ,ReadRoleValue(x[i],EM_RoleValue_OrgID) )
				if	ReadRoleValue(x[i],EM_RoleValue_OrgID) ==118491	or
					ReadRoleValue(x[i],EM_RoleValue_OrgID) ==118592	then
						if	BuffInfo( x[i],1, EM_BuffInfoType_BuffID )==620131 then
							ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424277_02]", 0 )
							return false
						else	return true
						end
					
				end
				--if	--i==num	then
					--Say(OwnerID(),"Over")
				--end
			end
			ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424277_01]", 0 )
			return false
end

------------------------------------------------------------------------
function William_createsmoke()
	local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
	--local x =Lua_DW_CreateObj( "obj" , 105707 , OwnerID() )
	local x =CreateObj_ByObjPoint(OwnerID(),105707,"p_down") 
	SetModeEx(x,EM_SetModeType_Show,false) 
	--PJ_NOUseAdjModEx(x)
	AddToPartition( x,RoomID )
	--Sleep(15)
	DW_QietKillOne(0,105706)	
	return 1
end
------------------------------------------------------------------------
function William_killself105707()
	DW_UnFight(OwnerID(),true)
	Lua_ObjDontTouch( OwnerID() )
	SetModeEx(OwnerID(), EM_SetModeType_Show,false) 
	CastSpell( OwnerID(), OwnerID(), 497923 )
	sleep(20)
	DelObj ( OwnerID() )
end
------------------------------------------------------------------------
function Will_Z20_Formula424266_A()
	local Obj = OwnerID()
	local Target = TargetID()
	LoadQuestOption(Obj)
	AddSpeakOption( Obj, Target, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。
	if	CheckAcceptQuest(OwnerID(),424266)==TRUE
	and	CountBodyItem(OwnerID(),209631)==0	then
		AddSpeakOption( Obj, Target, "[SC_424266_01]" , "Will_Z20_Formula424266_B", 0 )--我想購買[209631]。（將花費你身上的金錢100）
	end
end
------------------------------------------------------------------------
function Will_Z20_Formula424266_B()
	if	ReadRoleValue( OwnerID() , EM_RoleValue_Money ) < 100	then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424266_02]", 0 )
	else	AddRoleValue( OwnerID() , EM_RoleValue_Money , -100 )
		GiveBodyItem( OwnerID(), 209631, 1 )
		CloseSpeak( OwnerID() )
	end
end
------------------------------------------------------------------------
function William_424271()
	if	CountBodyItem(OwnerID(),209633)==0	then
		ScriptMessage( OwnerID(), OwnerID(), 1,"[SC_424271_01]", 0 )
		return  false
	else	
		return true	
	end
end
------------------------------------------------------------------------
Function William_drunk()
	while 1 do
	AddBuff ( OwnerID() , 620132 , 1 , -1 )
	sleep(60)
	end
end
------------------------------------------------------------------------
function William_NPCTips424272_1()
	while 1 do 
	sleep(40)
	local x={}
	x=SearchRangePlayer ( OwnerID() , 150 ) 
		for i=0,table.getn(X),1 do
			if	checkAcceptQuest( x[i] ,424272)==TRUE	then
				callplot(OwnerID(),"William_NPCTips424272_2", OwnerID() )
			end
		end
	end
end
------------------------------------------------------------------------
function William_NPCTips424272_2(OwnerID,ObjID )
	local num=dw_rand( 9 )
		if num<=5 then
			Say( OwnerID, "[SC_424272_tip01]" ) 
		elseif num>=8 then 
			Say( OwnerID, "[SC_424272_tip02]"  ) 
		else
			Say(OwnerID, "[SC_424272_tip03]"  ) 
		end
end
------------------------------------------------------------------------
function William_424271Tips()
	AddBuff ( OwnerID() , 620133 , 1 , -1 )
end
------------------------------------------------------------------------
function William_FXsmoke()
	AddBuff ( OwnerID() , 620135 , 1 , -1 )
end
------------------------------------------------------------------------
function William_GMTEST()
	AddBuff ( OwnerID() , 620190 , 1 , -1 )
end
------------------------------------------------------------------------
Function WilliamNPC118534_motion()
	SetRoleCamp( OwnerID() ,"SNPC")
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )
	CallPlot(OwnerID(),"LuaP_Sleeping",OwnerID())
	while 1 do
		AddBuff ( OwnerID() , 620132 , 1 , -1 )
		sleep(60)
	end
end
------------------------------------------------------------------------
Function WilliamNPC118535_motion()
	SetRoleCamp( OwnerID() ,"SNPC")
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )
	CallPlot(OwnerID(),"LuaP_Sitting",OwnerID())
	while 1 do
		AddBuff ( OwnerID() , 620132 , 1 , -1 )
		sleep(60)
	end
end
------------------------------------------------------------------------
Function WilliamNPC118536_motion()
	SetRoleCamp( OwnerID() ,"SNPC")
	LockHP( OwnerID() , ReadRoleValue(OwnerID(),EM_RoleValue_MaxHP)*0.25 , "Lua_424225_LockHP" )
	--CallPlot(OwnerID(),"LuaP_Sleeping",OwnerID())
	while 1 do
		AddBuff ( OwnerID() , 620132 , 1 , -1 )
		sleep(60)
	end
end
------------------------------------------------------------------------