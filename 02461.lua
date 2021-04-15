--
--------------------------------------------------
function William_NPC106000_01()
	CallPlot( OwnerID(), "LuaS_Discowood_NowToHide", OwnerID() )
	ic__MOB_BUFF_21()
end
--------------------------------------------------
function William_Quest424581_1()
	ic__MOB_BUFF_21()
	SetPlot( OwnerID(),"dead","William_Kill105999_1",0 ) 
end
--------------------------------------------------
function William_Kill105999_1()
	local Center=ReadRoleValue(OwnerID(),EM_RoleValue_Register4)
	if Center~=0 then
		local num=ReadRoleValue(center,EM_RoleValue_Register1)
		num=num-1
		WriteRoleValue(center,EM_RoleValue_Register1,num)
		if num==0 then
			CallPlot(Center,"Z21monsterdead_01",Center )
		end
	end
	if	CheckAcceptQuest(TargetID(),424610)==TRUE	then
		DW_QietKillOne(1,105999)
	end
	if	CheckAcceptQuest(TargetID(),424647)==TRUE	then
		DW_QietKillOne(1,105999)
	end
	if	CheckAcceptQuest(TargetID(),424611)==TRUE	and
		ReadRoleValue( Center, EM_RoleValue_OrgID)==119180 then
		DW_QietKillOne(1,106122)
	end
	if	CheckAcceptQuest(TargetID(),424648)==TRUE	and
		ReadRoleValue( Center, EM_RoleValue_OrgID)==119180 then
		DW_QietKillOne(1,106122)
	end
end
--------------------------------------------------
function William_Quest424582_1()
	local num=dw_rand( 100 )
	if CountBodyItem(OwnerID(),240571)<5 then
		if num<=50 then 
			GiveBodyItem( OwnerID(), 240571, 1 )
			return 1
		else ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_424582_01]", 0 )
		return 1
		end
	else ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_424582_02]", 0 )
	return 1
	end
end
--------------------------------------------------
function William_Quest424576_1()
	ic__MOB_BUFF_21()
	SetPlot( OwnerID(),"dead","William_Kill106001_1",0 ) 
end
--------------------------------------------------
function William_Quest424576_2()
	CallPlot( OwnerID(), "LuaS_Discowood_NowToHide", OwnerID() )
	ic__MOB_BUFF_21()
	SetPlot( OwnerID(),"dead","William_Kill106001_1",0 ) 
end
--------------------------------------------------
function William_Kill106001_1()
	if	CheckAcceptQuest(TargetID(),424576)==TRUE	or
		CheckAcceptQuest(TargetID(),424663)==TRUE	or
		CheckAcceptQuest(TargetID(),424623)==TRUE	then
		DW_QietKillOne(1,106001)
	end
	Lua_ZonePE_3th_GetScore(2)
end
------------------------------------------------------------------------
function William_424567_01()
	LoadQuestOption(OwnerID())
end
------------------------------------------------------------------------
function William_424568_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424568)==TRUE	and
		CountBodyItem(OwnerID(),240576)==1 then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424568_01]","William_424568_02",0)	
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424568_02()
	if	CheckAcceptQuest(OwnerID(),424568)==TRUE	then
		if	CountBodyItem(OwnerID(),240576)==1	then
				SetFlag( OwnerID(), 545489, 1 )
				SetFlag( OwnerID(), 545492, 1 )		
				CloseSpeak( OwnerID() )
		else	SetSpeakDetail(OwnerID(),"[SC_424568_02]")
		end
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424569_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424569)==TRUE	and
		CountBodyItem(OwnerID(),240576)==1 then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424569_01]","William_424569_02",0)	
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424569_02()
	if	CheckAcceptQuest(OwnerID(),424569)==TRUE	then
		if	CountBodyItem(OwnerID(),240576)==1	then
				SetFlag( OwnerID(), 545490, 1 )
				SetFlag( OwnerID(), 545493, 1 )		
				CloseSpeak( OwnerID() )
		else	SetSpeakDetail(OwnerID(),"[SC_424569_02]")
		end
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424570_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424570)==TRUE	and
		CountBodyItem(OwnerID(),240576)==1 then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424570_01]","William_424570_02",0)	
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424570_02()
	if	CheckAcceptQuest(OwnerID(),424570)==TRUE	then
		if	CountBodyItem(OwnerID(),240576)==1	then
				SetFlag( OwnerID(), 545491, 1 )
				SetFlag( OwnerID(), 545494, 1 )		
				CloseSpeak( OwnerID() )
		else	SetSpeakDetail(OwnerID(),"[SC_424570_02]")
		end
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424571_01()
	LoadQuestOption(OwnerID())
	if CheckFlag( OwnerID(),545576)==TRUE then
		if CountBodyItem(OwnerID(),240576)==0 then
			if CheckAcceptQuest(OwnerID(),424568)==TRUE or
			   CheckAcceptQuest(OwnerID(),424569)==TRUE or
		 	   CheckAcceptQuest(OwnerID(),424570)==TRUE then
			   AddSpeakOption(OwnerID(), TargetID(),"[SC_240576_01]","William_retake240576_01",0)
			end	
		end
	end
	if CheckFlag( OwnerID(),545577)==TRUE then
		if CountBodyItem(OwnerID(),240575)==0 then
			if CheckAcceptQuest(OwnerID(),424572)==TRUE or
			   CheckAcceptQuest(OwnerID(),424573)==TRUE then
				AddSpeakOption(OwnerID(), TargetID(),"[SC_240575_01]","William_retake240575_01",0)
			end	
		end
	end
	if	CheckAcceptQuest(OwnerID(),424571)==TRUE	and
		CheckFlag(OwnerID(),545552)==false	then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424571_01]","William_424571_02",0)
	end
end
------------------------------------------------------------------------
function William_424571_02()
	SetFlag( OwnerID(), 545552, 1 )
	CloseSpeak( OwnerID() )
end
------------------------------------------------------------------------
function William_retake240576_01()
	GiveBodyItem( OwnerID(), 240576, 1 )
	SetSpeakDetail(OwnerID(),"[SC_240576_02]")
end
------------------------------------------------------------------------
function William_retake240575_01()
	GiveBodyItem( OwnerID(), 240575, 1 )
	SetSpeakDetail(OwnerID(),"[SC_240576_02]")
end
------------------------------------------------------------------------
function William_424572_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424572)==TRUE	and
		CheckFlag(OwnerID(),545554) == false then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424572_01]","William_424572_02",0)
	end
end
------------------------------------------------------------------------
function William_424572_02()
	SetFlag(OwnerID(),545554 , 1 )
	CloseSpeak( OwnerID() )
end
------------------------------------------------------------------------
function William_424573_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424573)==TRUE and
		CheckFlag(OwnerID(),545495) == false then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424573_01]","William_424573_02",0)
	end
	if	CheckAcceptQuest(OwnerID(),424578)==True then
		if	CheckFlag( OwnerID(), 545497 ) ==False then
			AddSpeakOption(OwnerID(), TargetID(),"[SC_424578_01]","William_show424578_01",0)
		end
	end
end
------------------------------------------------------------------------
function William_424573_02()
	if	CheckAcceptQuest(OwnerID(),424573)==TRUE	then
		if	CountBodyItem(OwnerID(),240575)==1	then
				DelBodyItem( OwnerID(), 240575, 1 )
				SetFlag( OwnerID(), 545495, 1 )		
				CloseSpeak( OwnerID() )
		else	SetSpeakDetail(OwnerID(),"[SC_424573_02]")
		end
	else	LoadQuestOption(OwnerID())
	end
end
------------------------------------------------------------------------
function William_424579_01()
	LoadQuestOption(OwnerID())
		if 	CheckAcceptQuest(OwnerID(),424579)==TRUE and
		   	CountBodyItem(OwnerID(),240639)==0 then
			GiveBodyItem( OwnerID(),240639, 1 )
		end
end
------------------------------------------------------------------------
function William_424579_02()
	AddBuff ( OwnerID(), 620928, 1,-1 )
end
------------------------------------------------------------------------
function William_424580_01()
	LoadQuestOption(OwnerID())
	if CheckFlag(OwnerID(),545575) == false then
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424580_01]","William_424580_02",0)
	end
End
--------------------------------------------------
function William_424580_02()
	if CheckBuff( OwnerID() ,620928)==True then
	   SetFlag(OwnerID(),545575, 1 )
	   CloseSpeak( OwnerID() )
	else SetSpeakDetail(OwnerID(),"[SC_424580_02]")
	end
End
--------------------------------------------------
function William_424580_03()
	Lua_ZonePE_3th_GetScore(50)
	sleep(10)
	SetPosByFlag( TargetID(), 780871, 5 )
end
--------------------------------------------------
function William_106002_01()
	AddBuff(OwnerID() ,620725 ,0 ,-1)
	sleep(600)
	DelObj ( OwnerID() ) 
end
------------------------------------------------------------------------
function William_106002_02()
	if ReadRoleValue(TargetID(), EM_RoleValue_OrgID)==106010 then
		local x={}
		local y=0
		x=SearchRangePlayer ( OwnerID() , 200 )
		local num=table.getn(x)
			for i=0,num,1 do
				if CheckBuff( x[i] , 620730 )==TRUE then
					if CheckAcceptQuest(x[i],424599)==TRUE then
						SetFlag( x[i], 545496, 1 )
					end
				end
			end
	end
	DelObj ( OwnerID() )
end
------------------------------------------------------------------------
function William_106002_03()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ==106010 then
		CallPlot(TargetID(),"William_106002_06",TargetID())
	end
end
------------------------------------------------------------------------
function William_106002_04()
		local RoomID = ReadRoleValue( OwnerID() , EM_RoleValue_RoomID )
		local seeds=CreateObj_ByObjPoint(OwnerID(),106002,"p_down")
		AddToPartition( seeds ,RoomID )
		SetModeEx( seeds  ,EM_SetModeType_Save , true )
		SetModeEx( seeds  ,EM_SetModeType_Strikback , false )
		SetModeEx( seeds  ,EM_SetModeType_Fight , false )
		SetModeEx( seeds  ,EM_SetModeType_Move , false )
		SetModeEx( seeds  ,EM_SetModeType_Gravity , true )	
		SetModeEx( seeds  ,EM_SetModeType_ShowRoleHead , false )
end
------------------------------------------------------------------------
function William_106002_05()
	local x={}
	local y=0
        	x=SearchRangeNPC ( OwnerID() , 225 ) 
	local num=table.getn(x)		
		for i=0,num,1 do
			if ReadRoleValue(x[i],EM_RoleValue_OrgID) ==119061 then
				y=y+1
			end
		end
		if y==1	then
			return true
		else
			ScriptMessage(OwnerID(),OwnerID(),1,"[SC_424576_02]",0)
			return false
		end
end
------------------------------------------------------------------------
function William_106002_06()
		sleep(30)
		Say(OwnerID(), "[SC_424576_03]" )
		sleep(30)
		Say(OwnerID(), "[SC_424576_04]" )
		sleep(30)
		CallPlot(OwnerID(),"LuaFunc_ResetObj",OwnerID())
end
------------------------------------------------------------------------
function William_424610_01()
	DelBodyItem( TargetID(), 545539, 1 )
	SetFlag( TargetID(), 545540, 1 )
	Lua_ZonePE_3th_GetScore(280)
end
------------------------------------------------------------------------
function William_424611_01()
	DelBodyItem( TargetID(), 545540, 1 )
	SetFlag( TargetID(), 545541, 1 )
	Lua_ZonePE_3th_GetScore(330)
end
------------------------------------------------------------------------
function William_424612_01()
	DelBodyItem( TargetID(), 545541, 1 )
	SetFlag( TargetID(), 545539, 1 )
	Lua_ZonePE_3th_GetScore(175)
end
------------------------------------------------------------------------
function William_424616_01()
	DelBodyItem( TargetID(), 545545, 1 )
	SetScriptFlag( TargetID(), 545543, 1 )
	Lua_ZonePE_3th_GetScore(420)
end
------------------------------------------------------------------------
function William_424617_01()
	DelBodyItem( TargetID(), 545543, 1 )
	SetFlag( TargetID(), 545544, 1 )
	Lua_ZonePE_3th_GetScore(250)
end
------------------------------------------------------------------------
function William_424618_01()
	DelBodyItem( TargetID(), 545544, 1 )
	SetFlag( TargetID(), 545545, 1 )
	Lua_ZonePE_3th_GetScore(370)
end
------------------------------------------------------------------------
function William_424619_01()
	DelBodyItem( TargetID(), 545546, 1 )
	SetFlag( TargetID(), 545547, 1 )
	Lua_ZonePE_3th_GetScore(410)
end
------------------------------------------------------------------------
function William_424620_01()
	DelBodyItem( TargetID(), 545547, 1 )
	SetFlag( TargetID(), 545548, 1 )
	Lua_ZonePE_3th_GetScore(500)
end
------------------------------------------------------------------------
function William_424621_01()
	DelBodyItem( TargetID(), 545548, 1 )
	SetFlag( TargetID(), 545549, 1 )
	Lua_ZonePE_3th_GetScore(50)
end
------------------------------------------------------------------------
function William_424622_01()
	DelBodyItem( TargetID(), 545549, 1 )
	SetFlag( TargetID(), 545546, 1 )
	Lua_ZonePE_3th_GetScore(300)
end
------------------------------------------------------------------------
function William_424623_01()
	DelBodyItem( TargetID(), 545550, 1 )
	SetFlag( TargetID(), 545551, 1 )
	Lua_ZonePE_3th_GetScore(300)
end
------------------------------------------------------------------------
function William_424624_01()
	DelBodyItem( TargetID(), 545551, 1 )
	SetFlag( TargetID(), 545550, 1 )
	Lua_ZonePE_3th_GetScore(400)
end
------------------------------------------------------------------------
function William_119181_01()
	AddBuff ( OwnerID(), 620944, 1,-1 )
end
------------------------------------------------------------------------
function William_Quest424622_01()
	AddBuff ( OwnerID() ,502707 ,1 ,-1 )
	SetPlot( OwnerID(),"dead","William_Quest424622_02",0 ) 
end
--------------------------------------------------
function William_Quest424622_02()
	DW_QietKillOne(TargetID(),106158)
end
------------------------------------------------------------------------
function William_424649_01()
	SetFlag( TargetID(), 545539, 1 ) --維持商路的安全 545539
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------
function William_424653_01()
	SetFlag( TargetID(), 545580, 1 ) --反抗軍情報員的威脅 545580
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------
function William_424654_01()
	SetFlag( TargetID(), 545581, 1 ) --蓋爾立頓的妨礙 545581
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------
function William_424655_01()
	SetFlag( TargetID(), 545582, 1 ) --獻出友好的善意 545582
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------
function William_424658_01()
	SetFlag( TargetID(), 545543, 1 ) --守望隊的作戰訓練 545543
	Lua_ZonePE_3th_GetScore(200)
end
------------------------------------------------------------
function William_424662_01()
	SetFlag( TargetID(), 545546, 1 ) --奧特的秘密研究 545546
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------
function William_424664_01()
	SetFlag( TargetID(), 545550, 1 ) --持續掃蕩漁村的威脅 545550
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------------------
function Show119146_01()
	SetFlag( TargetID(), 545492, 0 )
	Lua_ZonePE_3th_GetScore(50)
end
------------------------------------------------------------------------
function Show119147_01()
	SetFlag( TargetID(), 545493, 0 )
	Lua_ZonePE_3th_GetScore(50)
end
------------------------------------------------------------------------
function Show119148_01()
	SetFlag( TargetID(), 545494, 0 )
	Lua_ZonePE_3th_GetScore(50)
end
------------------------------------------------------------------------
function retake240639_01()
	LoadQuestOption(OwnerID())
	if CheckAcceptQuest(OwnerID(),424580)==TRUE then
			if CountBodyItem(OwnerID(),240639)==0 then
				AddSpeakOption(OwnerID(), TargetID(),"[SC_RETAKE240639_01]","retake240639_02",0)
			end
	end
	if CheckCompleteQuest(OwnerID(),424580)==true and 
	   CheckCompleteQuest(OwnerID(),424524)==false then
			if CountBodyItem(OwnerID(),240639)==0 then
				AddSpeakOption(OwnerID(), TargetID(),"[SC_RETAKE240639_01]","retake240639_02",0)
			end
	end
End
--------------------------------------------------
function retake240639_02()
	GiveBodyItem( OwnerID(), 240639, 1 )
	SetSpeakDetail(OwnerID(),"[SC_RETAKE240639_02]")
End
------------------------------------------------------------------------
function William_424599_01()
	DelBodyItem( TargetID(), 545551, 1 )
	--SetFlag( TargetID(), 545550, 1 )
	Lua_ZonePE_3th_GetScore(150)
end
------------------------------------------------------------------------   