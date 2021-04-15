Function LuaS_422142()

	LoadQuestOption(OwnerID())
	If	(CheckAcceptQuest(OwnerID(),422142)==true)and( CheckCompleteQuest(OwnerID(),422142)==false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422142]","LuaS_422142_1",0)			--好，請說。
	end

	If	(CheckAcceptQuest(OwnerID(),422145)==true)and( CheckCompleteQuest(OwnerID(),422145)==false)and CountItem( OwnerID(), 204537 )>0	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422145]","LuaS_422145_1",0)
	End
	
	If	(CheckAcceptQuest(OwnerID(),422145)==true)and( CheckCompleteQuest(OwnerID(),422145)==false)and CountItem( OwnerID(), 204537 )==0 and CountItem( OwnerID(), 204538 )==0 and CheckFlag( OwnerID(), 542568 )==true	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422145_6]","LuaS_422145_5",0)
	end
end


Function LuaS_422142_1()
	SetSpeakDetail(OwnerID(),"[SC_422142_1]")							--曾有傳說提到...
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422142_2]","LuaS_422142_2",0)				--還只是傳說……  
end

Function LuaS_422142_2()
	SetSpeakDetail(OwnerID(),"[SC_422142_3]")							--沒錯...
	SetFlag(OwnerID(),542569,1)
End


Function LuaS_422145_1()
	DisableQuest(TargetID(),true)
	SetSpeakDetail(OwnerID(),"[SC_422145_1]")		
	BeginPlot( TargetID(), "LuaS_422145_2", 20 )	
end


Function LuaS_422145_2()
	CloseSpeak(TargetID())	--玩家
	Sleep(10)
	Say(OwnerID(),"[SC_422145_10]")
	sleep(20)
	Say(OwnerID(),"[SC_422145_2]")	
	GiveBodyItem( TargetID(), 204538, 1 )
	GiveBodyItem( TargetID(), 204653, 1 )
	DelBodyItem( TargetID(), 204537, 1 ) 
	SetFlag( TargetID(),542568, 1 )
	sleep(30)
	Say(OwnerID(),"[SC_422145_3]")
	CallPlot( OwnerID(), "LuaS_422145_3", TargetID() )
	DisableQuest(OwnerID(),false)
end

function LuaS_204653()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_422145_4]" )
	ShowBorder( OwnerID(), 0, "[204653]", "ScriptBorder_Texture_Paper" )	
end


Function LuaS_422145_3(Tar)
		Say(OwnerID(),"[SC_422145_5]")
	sleep(30)
	If	(CheckAcceptQuest(Tar,422148)==false)and(CheckCompleteQuest(Tar,422148)==false)then
		Say(OwnerID(),"[SC_422145_8]")
	End
	If	(CheckAcceptQuest(Tar,422148)==true)and(CheckCompleteQuest(Tar,422148)==false)then
		Say(OwnerID(),"[SC_422145_9]")
	end
	
end


Function LuaS_422145_5()
	SetSpeakDetail(OwnerID(),"[SC_422145_7]")
	GiveBodyItem( OwnerID(), 204538, 1 )		
end




Function LuaS_422149()
	LoadQuestOption(OwnerID())
	If 	(CheckAcceptQuest(OwnerID(),422149)==true)and( CheckCompleteQuest(OwnerID(),422149)==false)	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422149]", "LuaS_422149_1",0)	
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422149_1]", "LuaS_422149_2",0)	
	end
end

Function LuaS_422149_1()
	SetSpeakDetail(OwnerID(),"[SC_422149_2]")	
	SetFlag( OwnerID(),542628, 1 )
end

Function LuaS_422149_2()
	SetSpeakDetail(OwnerID(),"[SC_422149_3]")	
	SetSpeakDetail(OwnerID(),"[SC_422149_11]")
	SetFlag( OwnerID(),542628, 1 )
end



Function LuaS_422150_before()	--點擊物品前
	if	( CheckCompleteQuest(OwnerID(),422150)==false) and CountItem( OwnerID(), 204469 )==0	then
		return true
	end
	return false
end

Function LuaS_422150_after()	--點擊物品後
	if	( CheckCompleteQuest(OwnerID(),422150)==false) and CountItem( OwnerID(), 204469 )==0	then
		local SNOWFOX= Lua_DW_CreateObj("flag",102007 ,780293, 1 )
		SetAttack(SNOWFOX,OwnerID())
		BeginPlot(SNOWFOX,"LuaS_Discowood_CheckPeace",0)
		SetPlot(SNOWFOX,"dead","LuaS_422150_1",0 )
		return true
	end
	return false
end

function LuaS_422150_1() --怪的死亡劇情
	local Player 
	for i=0, HateListCount( OwnerID() )-1 do
		Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if	CheckAcceptQuest ( Player   , 422150)	then
			GiveBodyItem(TargetID(), 204469, 1 )
		end	
	end		
	return true
End


function LuaS_204538()
	ClearBorder( OwnerID())	--初始化石碑介面
	AddBorderPage( OwnerID(), "[SC_204538]" )
	ShowBorder( OwnerID(), 0, "[204538]", "ScriptBorder_Texture_Paper" )	
end



function LuaS_422148_0()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~=	101268	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422148_1]", 0 );
		return false
	end

	if	CheckBuff(OwnerID(),503332)	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422148_2]", 0 );
		return false
	end

	if	CountBodyItem(OwnerID(),204540) > 0	then
		return false
	else
		return true
	end
end


function LuaS_422148_1()
	AddBuff(OwnerID(),503332,1,10)
	local Camara = Lua_CreateObjByDir( OwnerID() , 112789 , 30 , 180)
	AddToPartition(Camara,ReadRoleValue(OwnerID(),EM_RoleValue_RoomID))
	BeginPlot(Camara,"LuaS_422148_2",0)
end

function LuaS_422148_2()
	local Master = TargetID()
	local Sec = 0
	while	CheckID(Master)		and
		ReadRoleValue(Master,EM_RoleValue_IsDead) == 0	and
		ReadRoleValue(Master,EM_RoleValue_ZoneID) == 114	do
		sleep(10)
		Sec = Sec + 1
		if	Sec > 10	then
			CancelBuff(Master,503332)
			DelBodyItem(Master,204539,1)
			GiveBodyItem(Master,204540,1)
			Say(Master,"[SC_422148]")
			DelObj(OwnerID())
		end
	end
	
	DelObj(OwnerID())
end