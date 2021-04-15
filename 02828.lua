function lua_NPC121692_sz()	--昏昏欲睡的隊員
	local player =OwnerID();
	LoadQuestOption( player );
	if CheckAcceptQuest( player, 420411 ) then
		SetFlag( player,546727,1)
	end
end
--支線：獵手的請託
function lua_P121825_sz()
	local player=OwnerID()
	LoadQuestOption( player )
		if CheckAcceptQuest( player,425965) and CheckFlag( player,547504)==false then
			SetFlag( player,547504,1 )
			Tell( TargetID(),player,"[SC_Q425965_1]")
		end
		if CheckAcceptQuest( player,425966 ) and CheckFlag( player,547505 )==false then
			AddSpeakOption( player, TargetID(),"[SC_Q425965_2]","lua_425966_CP",0 )
		end
		if CheckAcceptQuest( player,425967 ) and CheckFlag( player,547506 )==false then
			AddSpeakOption( player, TargetID(),"[SC_Q425967_1]","lua_425967_CP(1)",0 )
		end
		if CheckAcceptQuest( OwnerID(),425969) and CountBodyItem( OwnerID(),242141)>=1 then
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425969_1]","lua_425969_CP(1)",0 )
		end
end
--支線：挑戰教官
function lua_425966_CP()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID(),EM_RoleValue_Register1 ) ==0 then
		WriteRoleValue( TargetID(),EM_RoleValue_Register1,1 )
		CallPlot(TargetID(),"lua_425966_1",OwnerID())
	end
end
--對話後攻擊
function lua_425966_1( player )
	local x,y,z,dir = DW_Location( OwnerID() )
	local Obj = CreateObj( 107572,x,y,z,dir,1 )
		SetRoleCampID( Obj,3 )
		WriteRoleValue( Obj,EM_RoleValue_PID,OwnerID())
		SetPlot( Obj,"dead","lua_425966_DD",0 )
		hide( OwnerID())
		AddToPartition( Obj,0)
		SetAttack( Obj,player )
end
--死亡觸發
function lua_425966_DD()
	local PlayerTeam = HateListCount( OwnerID() )
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
	local tmpID={}
		for i = 1 , PlayerTeam, 1 do
			local ID = HateListInfo( OwnerID() ,i-1 , EM_HateListInfoType_GItemID );
			table.insert(tmpID,ID)
		end 
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==1 then
		SetFightMode( OwnerID(),0,0,0,0 )
		CallPlot( OwnerID(),"lua_425966_2",tmpID)
	end
	return false
end
--結束表演
function lua_425966_2(tmpID)
	local Obj = ReadRoleValue( OwnerID(),EM_RoleValue_PID)
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,2)
	DebugMsg(0,0,"end="..Obj)
	CastSpell( OwnerID(),OwnerID(),850642)
	Sleep(30)
	NpcSay( OwnerID() ,"[SC_Q425965_3]")	--我是不可能會輸的……
	Sleep(20)
	NpcSay( OwnerID() ,"[SC_Q425965_4]")	--就算會死，我也要贏…
	Sleep(20)
		for i=1,#tmpID do
			if CheckAcceptQuest(tmpID[i],425966) and CheckFlag( tmpID[i], 547505 )==false then
				ScriptMessage(tmpID[i],tmpID[i],3,"[SC_Q425965_5]",0 )	--傳來[121785]生氣的聲音：「你這笨小子，還不快住手！」
				Sleep(10)
				SetFlag( tmpID[i],547505,1 )
			end
		end
	Sleep(20)
	WriteRoleValue( Obj,EM_RoleValue_Register1,0 )
	Show ( Obj,0)
	Sleep(5)
	DelObj( OwnerID() )
end
--離開戰鬥
function lua_425966_3( )
	if ReadRoleValue( OwnerID(),EM_RoleValue_Register1)==0 then
		local Obj = ReadRoleValue( OwnerID(),EM_RoleValue_PID)
		local x,y,z,dir = DW_Location( Obj )
		local time = Move( Obj,x,y,z )
			Sleep( time*10 )
			WriteRoleValue( Obj,EM_RoleValue_Register1,0 )
			Show ( Obj,0)
			DelObj( OwnerID() )
	end
end

--想被認同的孩子
function lua_425967_CP(k)
		k=k+1
		SetSpeakDetail(OwnerID(),"[SC_Q425967_"..k.."]")
		if k>=6 then 
			SetFlag( OwnerID(),547506,1)
		else
			k=k+1
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425967_"..k.."]","lua_425967_CP("..k..")",0 )
		end
end
function lua_425967_Qend()
	ScriptMessage( TargetID(),TargetID(),2,"[SC_Q425967_7]",0)
end
--馭流之路
function lua_425969_CP(k)
		k=k+1
		SetSpeakDetail(OwnerID(),"[SC_Q425969_"..k.."]")
		if k>=8 then 
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425969_9]","lua_425969_Qend",0 )
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425969_10]","lua_425969_Qend",0 )
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425969_11]","lua_425969_Qend",0 )
		else
			k=k+1
			AddSpeakOption( OwnerID(), TargetID(),"[SC_Q425969_"..k.."]","lua_425969_CP("..k..")",0 )
		end
end
function lua_425969_Qend()
	CloseSpeak( OwnerID() )
	AdjustFaceDir(OwnerID(),TargetID(), 0 )
	SetFlag( OwnerID(),547507,1)
	Say( TargetID(),"[SC_Q425969_12]")
	DelBodyItem( OwnerID(),242141,1)
end
--任務：誠摯邀請
function lua_Q425978_1()
	local player =OwnerID()
	LoadQuestOption(player)
	if CheckAcceptQuest( player,425978 ) and CheckFlag( player,547558 )==false then
		AddSpeakOption( player,player,"[SC_Q425978_1]","lua_Q425978_2",0)
	end
	if CheckAcceptQuest( player,425980 ) and CheckFlag( player,547560 )==false then
		AddSpeakOption( player,player,"[SC_Q425978_1]","lua_Q425980_2(1)",0)
	end
end
function lua_Q425978_2()
	SetFlag( OwnerID(),547558,1 )
	SetSpeakDetail( OwnerID(),"[SC_Q425978_2]" )
end
function lua_Q425980_2(k)
	k=k+1
	SetSpeakDetail( OwnerID(),"[SC_Q425980_"..k.."]" )
	if k==6 then
		SetFlag( OwnerID(),547560,1 )
		return
	end
	k=k+1
	AddSpeakOption( OwnerID(),OwnerID(),"[SC_Q425980_"..k.."]","lua_Q425980_2("..k..")",0)
end
--任務：上位馭流者實力
function lua_Q425979_1()
	local player =OwnerID()
	if CheckAcceptQuest( player,425979 ) then
		if CheckFlag( player,547559 )==false then
			SetSpeakDetail( player,"[SC_Q425979_1]")
			AddSpeakOption( player,player,"[SC_WEAVE_TAILOR_12]","lua_Q425979_2",0)
		else
			SetSpeakDetail( player,"[SC_Q425979_4]")
		end	
	else
		LoadQuestOption( player )
	end
end
--對話開任務
function lua_Q425979_2()
	CloseSpeak(OwnerID())
	NpcSay( TargetID(),"[SC_Q425979_2]")
	if ReadRoleValue( TargetID(),EM_RoleValue_Register1)==0 then
		CallPlot( TargetID(),"lua_Q425979_3",0 )
	end
end
--把杖的點擊打開
function lua_Q425979_3()
	WriteRoleValue( OwnerID(),EM_RoleValue_Register1,1)
	local NPC=SearchRangeNPC( OwnerID(),100 )
	for i= 0, #NPC ,1 do
		if ReadRoleValue( NPC[i],EM_RoleValue_OrgID ) == 121864 then
			SetPlot( NPC[i],"touch","lua_Q425979_touch",20 )
			WriteRoleValue( NPC[i],EM_RoleValue_PID,OwnerID() )
		end
	end
end

--把杖的點擊關閉
function lua_Q425979_touch()
	SetPlot( TargetID(),"touch","",0 )
	CallPlot(TargetID(),"lua_Q425979_touch_1",OwnerID(),TargetID())
end
function lua_Q425979_touch_1( player,obj )
	local npc = ReadRoleValue( obj,EM_RoleValue_PID )
	local x,y,z,dir = DW_Location( obj )
		CastSpell( obj,obj,850641 )
	local mons = CreateObj( 107627,x,y,z,dir,1 )
		SetFightMode ( mons,0, 0, 0,0 ) 
		AddToPartition( mons,0 )
			Sleep(20)
		Say( npc,"[SC_Q425979_3]")	--這可不是普通小怪阿！
			Sleep(20)
		SetFightMode ( mons,1, 1, 1,1 ) 
		ScriptMessage( mons,0,1,"[SC_Q425979_5]",0 ) --[107627]朝向天空發出了一聲怒吼！
		SetAttack( mons,player )
		CallPlot( obj,"lua_Q425979_touch_2",mons,obj,npc,player )
end
--計時器
function lua_Q425979_touch_2( mons,obj,npc,player )
	local num = 0
	local HP = 0
	local TempPlayer = 0
	Sleep(20)
	while true do
		num = HateListCount( mons )
		HP = ReadRoleValue( mons,EM_RoleValue_HP )/ReadRoleValue( mons,EM_RoleValue_MaxHP )
		--成功條件
		if HP<=0.1 and HP>0 then
			ScriptMessage( mons,0,1,"[SC_Q425979_6]",0 )

			for i=0,HateListCount(mons)-1,1 do
				TempPlayer = HateListInfo( mons,i,EM_HateListInfoType_GItemID )
				if CheckAcceptQuest( TempPlayer,425979 ) and --判斷是否有任務
					CheckFlag( TempPlayer,547559 )==false	then
						SetFlag( TempPlayer,547559,1 )
				end
			end
			SetFightMode ( mons,0, 0, 0,0 ) 
			Say( npc,"[SC_Q425979_4]" )
			WriteRoleValue( npc,EM_RoleValue_Register1,0 )
			DelObj( mons )
			return
		elseif ReadRoleValue( mons,EM_RoleValue_IsDead )==1 then
			if CheckAcceptQuest( player,425979 ) and --判斷是否有任務
			CheckFlag( player,547559 )==false	then
				SetFlag( player,547559,1 )
			end
			Say( npc,"[SC_Q425979_4]" )
			WriteRoleValue( npc,EM_RoleValue_Register1,0 )
			DelObj( mons )
			return
		end
		--失敗條件
		if num==0 then
			DelObj( mons )
			WriteRoleValue( npc,EM_RoleValue_Register1,0 )
			return 
		end
		if ReadRoleValue(mons, EM_RoleValue_IsDead ) == 1 then
			DelObj( mons )
			WriteRoleValue( npc,EM_RoleValue_Register1,0 )
			return 
		end
		Sleep(10)
	end
end
--buff：624033 變身庫奧庫
--吐毛球的對話
function lua_n121880_sz()
	local player = OwnerID()
	if CheckBuff( player,624033 ) and CheckFlag( player,547562 )==false then
		SetSpeakDetail( player,"[SC_Q425981_B1]")
		AddSpeakOption( player,player,"[SC_Q425981_B2]","lua_n121880_1",0 )
	else
		LoadQuestOption(player)
	end
end
function lua_n121880_1()
		CloseSpeak(OwnerID())
		CastSpell( TargetID(),OwnerID(),495778 )
		CancelBuff( OwnerID(),624033 )
		AdjustFaceDir( TargetID(),OwnerID(),0 )
		Say( TargetID(),"[SC_Q425981_B3]")
		SetFlag( OwnerID(),547562,1 )
end
--折耳貓的對話
function lua_n121881_sz()
	local player = OwnerID()
	if CheckBuff( player,624033 ) and CheckFlag( player,547561 )==false then
		SetSpeakDetail( player,"[SC_Q425981_A1]")
		AddSpeakOption( player,player,"[SC_Q425981_A2]","lua_n121881_1",0 )
	else
		LoadQuestOption(player)
	end
end
function lua_n121881_1()
	CloseSpeak( OwnerID() )
	AdjustFaceDir( TargetID(),OwnerID(),0 )
	Say( TargetID(),"[SC_Q425981_A3]")
	GiveBodyItem( OwnerID(),242158,1)
	SetFlag( OwnerID(),547561,1 )
end
function lua_Q425981_OnComplete()
	if CheckBuff( TargetID(),624033 ) then
		CancelBuff( TargetID(),624033 )
	end
end
--任務425872，點擊前判段。
function lua_Q425872_OnClickObjBegin()
	if CountBodyItem( OwnerID(),242175 )>=1 then
		return true
	else
		ScriptMessage( OwnerID(),OwnerID(),2,"[SC_Q425872_BC]",0 )	--你身上沒有足夠的[242175]
		return false
	end
end
--任務425872，點擊物件後產生劇情。
function lua_Q425872_touch()
	local x,y,z,dir = DW_Location( OwnerID() )
	local obj = 0
	
	if DelBodyItem( OwnerID(),242175,1 ) then
		obj =CreateObj( 107634,x,y,z,dir,1 )
		SetModeEx( obj,EM_SetModeType_Mark,false )
		SetFightMode ( obj,0, 0, 0,0 ) 
		AddToPartition( obj,0 )
	else
		ScriptMessage( OwnerID(),OwnerID(),0,"[SC_SPQUESTSET_NOITEM]",0)
	end
	CallPlot( obj,"lua_Q425872_1",obj,TargetID() )
	return 1
end
function lua_Q425872_1( obj,Car )
	local player = SearchRangePlayer( obj,150 )
	local x,y,z,dir = DW_Location( Car )
	local BrockCar = CreateObj( 114031,x,y,z,dir,1)
		SetModeEx( BrockCar,EM_SetModeType_Mark,false )
		SetFightMode ( BrockCar,0, 0, 0,0 ) 
	Sleep(12)
	ScriptMessage( obj,0,2,"...3",0)
	Sleep(12)
	ScriptMessage( obj,0,2,"...2",0)
	Sleep(12)
	ScriptMessage( obj,0,2,"...1",0)
	CastSpell( obj,obj,492453 )	--497117 492453
	Sleep(5)
--	ScriptMessage( obj,0,2,"BooooOOOOOOOMMM!!",0)
	for i=0,#player do
		if CheckAcceptQuest( player[i],425872 ) then
			DW_QietKillOne( player[i],107632 )
		end
	end
	AddToPartition( BrockCar,0 )
	CallPlot( BrockCar,"lua_114031CreatNewCar",BrockCar )
	DelObj( Car )
	DelObj(obj)
end
function lua_114031CreatNewCar( BrockCar )
	local x,y,z,dir = DW_Location( BrockCar )
	local Car = CreateObj( 121887,x,y,z,dir,1 )
	Sleep( 300)
		SetFightMode ( Car,0, 0, 0,0 ) 
		SetModeEx( Car , EM_SetModeType_Obstruct , false )
		AddToPartition( Car,0 )
		DelObj( BrockCar )
end
function lua_425873_OnComplete()
	AdjustFaceDir( OwnerID(),TargetID(),0)
	Say( OwnerID(),"[SC_Q425873_1]")
end
--425982 考驗
function lua_425982_OnComplete()
	AdjustFaceDir(OwnerID(),TargetID(),0)
	Say(OwnerID(),"[SC_425982_CB]")	--我並不擔心，就讓我們靜待地流的指引吧。
end

--任務 守衛陣地 點擊物品 前
function lua_Q426012_ClickObjBegin()
	if CountBodyItem( OwnerID(),242234 ) >= 1 then
		return true
	end
	return false
end
--任務 守衛陣地 點擊物品 後
function lua_Q426012_ClickObjEnd()
	 if DelBodyItem( OwnerID(), 242234, 1 ) then
		DW_QietKillOne( OwnerID(),107639 )
		return true
	end
	return false
end
--副本任務用對話
function lua_n120126_sz()
	local player = OwnerID()
	LoadQuestOption( player )
	if CheckAcceptQuest( player,425832 ) and CountBodyItem( player,242350 ) == 0 then
		AddSpeakOption( player,player,"[SC_USEOBJ_02]","lua_n120126_1",0 )	--拾取
	end
end
function lua_n120126_1()
	GiveBodyItem( OwnerID(),242350,1 )
end
--主線任務：426083，夢的化身-給即效百花精油。
function lua_Z25Q426083_1()
	CloseSpeak( OwnerID() )
	GiveBodyItem( OwnerID(), 242357,1 )
end

function lua_Z25firetool_Bombing()--指定砲擊目標後劇情
	local firetool = OwnerID()
	local tmp_m = {}
	local monster = 0
	while true do
		--找編號107513
		tmp_m = SearchRangeNPC ( firetool, 300 )
		for i=0,#tmp_m do
			if ReadRoleValue( tmp_m[i] ,EM_RoleValue_OrgID ) == 107513 then
				monster = tmp_m[i]
				break
			end
		end
		if  monster == 0 then
			Sleep( 600)
		else
			AdjustFaceDir( firetool, monster , 0 ) --面向
			sleep(10)
			sleep(5)
			PlaySound( Firetool, "sound\\fx\\skill\\holy\\act_judge_shield_t_hit_point.mp3", false )
			PlayMotion( Firetool, 161)  --Buff0
		
			sleep(15)
		
			CastSpelllv( firetool , monster , 850757 , 1 )
			Sleep( 600)
		end
	end
end