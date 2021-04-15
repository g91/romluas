--==========ET的script==============
--暴食蝸牛的幼蟲 任務編號 422302
--痛苦的樹人 物件編號 102019
--暴食蝸牛的幼蟲 物件標號 102018
--藥劑 物品編號 204581
function LuaI_204581_Check()
	if CheckAcceptQuest( OwnerID() , 422302 ) == false then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204581_0]" , 0 ) --你不知道這個藥劑要用在哪裡
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204581_0]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102019 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204581_1]" , 0 ) --需要[102019]
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204581_1]" , 0 )
		return false
	else
		if ReadRoleValue( TargetID() , EM_RoleValue_PID ) > 0 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204581_2]" , 0 ) --他看起來已經好很多了
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204581_2]" , 0 )
			return false
		end
		if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204581_3]" , 0 ) --他已經從痛苦中解脫了......永遠地......
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204581_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaI_204581_Use()
	WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
	BeginPlot( TargetID() , "LuaI_422302_Do" , 0 )
end

function LuaI_422302_Do()
	SetStopAttack( OwnerID() )
	Lua_CancelAllBuff( OwnerID() ) 
	SetRoleCamp( OwnerID() , "Visitor" )
	Hide( OwnerID() )
	Show( OwnerID() , 0 )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_204581_4]" , 0 ) --[102019]身上的[102018]被驅趕了出來
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_204581_4]" , 0 )

	local Me = Role:new( OwnerID() )
	local Enermy = {}
	for i = 1 , 3 , 1 do
		Enermy[i] = CreateObj ( 102018 , Me:X() + Rand(20)*(-1)^Rand(2)  , Me:Y() , Me:Z() + Rand(20)*(-1)^Rand(2) , Me:Dir() , 1)
		AddToPartition( Enermy[i] , 0 )
		BeginPlot( Enermy[i] , "LuaI_422302_Dead" , 0 )
		SetAttack( Enermy[i] , TargetID() )
	end

	sleep( 50 )
	Hide( OwnerID() )
	sleep( 50 )
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
	SetRoleCamp( OwnerID() , "Monster" )
	LuaFunc_ResetObj( OwnerID() )
end

function LuaI_422302_Dead()
	LuaFunc_Obj_Suicide(30)
end

function LuaS_112841_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422342 ) == true and CheckFlag( OwnerID() , 542650 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112841_0]","LuaS_112841_1",0) --我要進行占卜
	end
end

function LuaS_112841_1()
	SetSpeakDetail( OwnerID(), "[SC_112841_1]"  ) --選擇一個吧！以此來獲得屬於你的占卜。
	AddSpeakOption(OwnerID(),TargetID(),"[SC_112841_2]","LuaS_112841_2",0) --你選擇左方的儀器
	AddSpeakOption(OwnerID(),TargetID(),"[SC_112841_3]","LuaS_112841_3",0) --你選擇中間的儀器
	AddSpeakOption(OwnerID(),TargetID(),"[SC_112841_4]","LuaS_112841_4",0) --你選擇右方的儀器
end

function LuaS_112841_2()
	SetSpeakDetail( OwnerID(), "[SC_112841_5]"  ) --身為威武的精靈戰士，你必須懷抱著希望以及熱忱，他們將成為你冒險中舵與帆，你將尋回我族遺失的戰士技能，並成為我族的榮耀！
	if CheckAcceptQuest( OwnerID() , 422342 ) == true and CheckFlag( OwnerID() , 542650 ) == false then
		SetFlag( OwnerID() , 542650 , 1 )
		AddBuff(OwnerID(),503377,1,3600)
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_112841_0",0) 
end

function LuaS_112841_3()
	SetSpeakDetail( OwnerID(), "[SC_112841_6]"  ) --身為聰穎的精靈戰士，你將以你的智慧度過許多的危機，並尋回我族引遺失的戰士技能，你將成為我族的榮耀！
	if CheckAcceptQuest( OwnerID() , 422342 ) == true and CheckFlag( OwnerID() , 542650 ) == false then
		SetFlag( OwnerID() , 542650 , 1 )
		AddBuff(OwnerID(),503377,1,3600)
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_112841_0",0) 
end

function LuaS_112841_4()
	SetSpeakDetail( OwnerID(), "[SC_112841_7]"  ) --身為高貴的精靈戰士，你必須時時謹記我族的榮耀並發揚光大，切莫讓外界的紛擾迷惑了心智，你將尋回我族遺失的戰士技能，並成為我族的榮耀！
	if CheckAcceptQuest( OwnerID() , 422342 ) == true and CheckFlag( OwnerID() , 542650 ) == false then
		SetFlag( OwnerID() , 542650 , 1 )
		AddBuff(OwnerID(),503377,1,3600)
	end
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_112841_0",0) 
end

--------------------------------------------------------------------------------------------------------
function LuaI_204592_0()
	if CheckAcceptQuest( OwnerID() , 422315 ) == false or CountBodyItem( OwnerID() , 204651 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 101937 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_Register) >0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]" , 0 )
		return false
	end
--檢查是否死亡
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 50 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_3]" , 0 )
		return false
	end
	return true
end

function LuaI_204592_1()
	UseItemDestroy()
	WriteRoleValue( TargetID() ,EM_RoleValue_Register , 1 )
	BeginPlot( TargetID() , "LuaI_204592_2" , 0 )
	GiveBodyItem( OwnerID() , 204651 , 1 )
end

function LuaI_204592_2()
	CastSpell( OwnerID() , OwnerID() , 491032 )
	Hide( OwnerID() )
	local Obj = LuaFunc_CreateObjByObj( 112822 , OwnerID() )
	WriteRoleValue( Obj , EM_RoleValue_LiveTime , 10 )
	sleep( 30 )
	local Num = DW_Rand(100)
	if Num > 50 then
		Yell( Obj ,  "[SC_204592_4]" , 3 ) --舒服多了......
	elseif Num <= 50 and Num > 20 then
		Yell( Obj ,  "[SC_204592_5]" , 3 ) --我......感覺到精神慢慢的在恢復......
	else
		Yell( Obj ,  "[SC_204592_6]" , 3 )--還是好不舒服啊......
	end
	sleep( 70 )
	WriteRoleValue( OwnerID()  ,EM_RoleValue_Register , 0 )
	LuaFunc_ResetObj( OwnerID() )
end
---------------------------------------------------------------------------------------------------------
function LuaS_112827_0()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 422306 ) == true and CheckFlag( OwnerID() , 542654 ) == false and CheckBuff( OwnerID() , 503373 ) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112827_0]","LuaS_112827_1",0) --嗯！我準備好了
		AddSpeakOption(OwnerID(),TargetID(),"[SC_112827_1]","LuaS_112827_2",0) --不......我還沒準備好
	end
	if	CheckAcceptQuest(OwnerID(),422335)		and
		not	CheckFlag(OwnerID(),542659)	then
		AddSpeakOption(  OwnerID(), TargetID( ), "[SC_422335_1]",  "LuaS_422335_6",  0 );
	end
end

function LuaS_112827_1()
	CloseSpeak( OwnerID() )
	if ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		SetPlot( TargetID() , "touch" ,"LuaFunc_Obj_BUSY" , 40 )
		BeginPlot( TargetID() , "LuaS_112827_3" , 0 )
	end
end

function LuaS_112827_2()
	CloseSpeak( OwnerID() )
end

function LuaS_112827_3()
	DisableQuest( OwnerID() , true )
	local Party = LuaFunc_PartyData(TargetID())  
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 1 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Yell( OwnerID() , "[SC_112827_2]" , 3 ) --好......那麼就開始模擬訓練吧。
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	Yell( OwnerID() , "[SC_112827_3]" , 3 ) --這場危機就以隱匿在野外的危機做為試驗。
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_POINT )
	Yell( OwnerID() , "[SC_112827_4]" , 3 ) --你們必須好好注意週遭的狀況！
	sleep( 30 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	Yell( OwnerID() , "[SC_112827_6]" , 3 ) --那麼，接下來請提高警覺，危機隨時會到來。
	for i = 1 , Party[0] , 1 do
		if  CheckAcceptQuest( Party[i] , 422306 ) == true and CheckFlag( OwnerID() , 542654 ) == false and CheckFlag( OwnerID() , 542649 ) == false and 
			CheckBuff(Party[i] ,  503373 ) == false and GetDistance( OwnerID() ,  Party[i] ) <= 100 and ReadRoleValue( Party[i] ,  EM_RoleValue_IsDead) == 0 then
			AddBuff( Party[i] ,  503373 , 1 , -1  )
		end
	end
	WriteRoleValue( OwnerID() , EM_RoleValue_Register , 0 )
	SetPlot( OwnerID() , "touch" ,"" , 0 )
	DisableQuest( OwnerID() , false )
end

function LuaS_112827_4()
	local Count = 0
	while 1 do
		local Obj;
		local Count = SetSearchRangeInfo(OwnerID() , 100 )
		local NPCCount = 0
		for i = 1 , Count , 1 do
			local ID = GetSearchResult()
			Obj = Role:New( ID )
			if Obj:IsNPC() == false and Obj:RoomID() == ReadRoleValue( OwnerID() , EM_RoleValue_RoomID ) then
				if  CheckAcceptQuest( ID , 422306 ) == true and CheckFlag(ID , 542654 ) == false and CheckBuff(ID ,  503373 ) == true 
					and GetDistance( OwnerID() ,  ID ) <= 100 and ReadRoleValue(ID ,  EM_RoleValue_IsDead) == 0 then
					if ReadRoleValue( ID , EM_RoleValue_IsAttackMode ) == 0 then
						if DW_Rand(100) > 70  or Count == 30 then 
							BeginPlot( ID , "LuaS_112827_4A" , 0)
							if Count == 10 then
--								Say( ID , "Time Do" )
								Count = 0
							end	
						else
							ScriptMessage(ID , ID, 2 , "[SC_112827_5]" , 0 ) --你聽見了腳步聲！
							ScriptMessage(ID , ID , 0 , "[SC_112827_5]" , 0 )
						end
					end
				end
			end
		end
		sleep( 30 )
		Count = Count + 1
	end	
end

function LuaS_112827_4A()

	ScriptMessage( OwnerID() , OwnerID() , 2 , "[SC_112827_8]" , 0 ) --[102022]突然出現！
	ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_112827_8]" , 0 )
	local Mob = {}
	Mob[1] =  Lua_CreateObjByDir( OwnerID(), 102022 , 100 , 0) 
	Mob[2] =  Lua_CreateObjByDir( OwnerID(), 102022 , -100 , 0) 
	BeginPlot( Mob[1] , "LuaS_112827_5" , 0 )
	BeginPlot( Mob[2] , "LuaS_112827_5" , 0 )

end

function LuaS_112827_5()
	local Player = TargetID()
	SetPlot( OwnerID() , "dead" , "LuaS_112827_6" , 0 )
	AddToPartition( OwnerID() , ReadRoleValue(Player,EM_RoleValue_RoomID ) )
	SetAttack( OwnerID() , Player )
	while 1 do
		sleep( 10 )
		if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 0 and ReadRoleValue( OwnerID() , EM_RoleValue_IsDead) == 0 then
			DelObj( OwnerID() )
		end
	end
end

function LuaS_112827_6()
	local Count = HateListCount( OwnerID() )
	for i = 0 , Count-1 , 1 do
		local Player = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID );
		if CheckAcceptQuest( Player  , 422306 ) == true and CheckFlag( Player  , 542654 ) == false then
			if CheckFlag(Player  ,542649) == false then
				SetFlag( Player  ,542649,1 )
			else
				SetFlag( Player  ,542649, 0  )
				SetFlag( Player  , 542654  , 1 )
				CancelBuff( Player , 503373 )
				ScriptMessage( Player, Player, 2 , "[SC_112827_9]" , 0 ) --你成功面對了突發的危機
				ScriptMessage( Player , Player , 0 , "[SC_112827_9]" , 0 )
			end
		end
	end
	SetStopAttack(OwnerID() )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_DYING)
	BeginPlot( OwnerID() , "LuaFunc_DeadPlay_Sub" , 0 )
	return false
end

function LuaS_112827_7()
	if CheckAcceptQuest(OwnerID()  , 422306 ) == false or CheckFlag( OwnerID() ,542654 ) == true  then
		CancelBuff( OwnerID() , 503373 )
	else
		local NPC = LuaFunc_SearchNPCbyOrgID( OwnerID() , 112827 , 100 , 0 )
		if NPC == -1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_112827_7]" , 0 ) --你離開了[112837]視野範圍，訓練中止了
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_112827_7]" , 0 )
			CancelBuff( OwnerID() , 503373 )
		end

	end
	return true
end


-----變青蛙


function LuaS_422309_0()
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 112829	then --目標錯誤
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422202_5]", 0 ); 
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_PID) == 1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422309_0]", 0 );  -- 你現在不能使用
		return false
	end
	return true
end

function LuaS_422309_1()
	WriteRoleValue(TargetID(),EM_RoleValue_PID,1)
	BeginPlot(TargetID(),"LuaS_422309_3",0)
	AddBuff(TargetID(),503375,1,10)
	SetFlag(OwnerID(),542651,1)
end

function LuaS_422309_3()
	for i = 1,10 do
		sleep(10)
		if	ReadRoleValue(OwnerID(),EM_RoleValue_PID) == 2	then
			return
		end
	end
	CancelBuff(OwnerID(),503375)
	SetFlag(TargetID(),542651,0)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
end


function LuaS_422309_2()
	DelBodyItem(TargetID(),204587,1)
	DisableQuest( OwnerID() , true ) --鎖起來
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,2)
	DelBodyItem(OwnerID(),204587,1)
	Say(OwnerID(),"[SC_422309_1]")
	sleep(20)
	Say(OwnerID(),"[SC_422309_2]")
	sleep(10)
	CancelBuff(OwnerID(),503375)
	WriteRoleValue(OwnerID(),EM_RoleValue_PID,0)
	sleep(20)
	Say(OwnerID(),"[SC_422309_3]")
	sleep(20)
	Say(OwnerID(),"[SC_422309_4]")
	DisableQuest( OwnerID() , false ) 
end
---------------------------------------------------蜜拉--------------------------------
function LuaS_422312_0()
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102020	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422312_0]", 0 ); 
		return false
	end
--檢查是否死亡
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422312_1]", 0 ); 
		return false
	end

	return true
end


function LuaS_422312_1()
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422312_2]", 0 ); 
	DelBodyItem(OwnerID(),204591,1)
	GiveBodyItem(OwnerID(),204654,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end



------------------------

function LuaS_422320_0()  --只能放在偵察裝置的初始劇情
	SetPlot(OwnerID(),"range","LuaS_422320_1",80)
end

function LuaS_422320_1()
	if	CountBodyItem(OwnerID(),204595) < 1	then
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112837	and
		CheckFlag(OwnerID(),542652)==false	then
		SetFlag(OwnerID(),542652,1)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422320_2]", "0xff008080" ); 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422320_2]", C_YELLOW ); 
		return
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_OrgID) == 112838	and
		CheckFlag(OwnerID(),542653)==false	then
		SetFlag(OwnerID(),542653,1)
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422320_1]", "0xff008080" ); 
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422320_1]", C_YELLOW ); 
		return
	end
end


function LuaS_422322_2()
	DisableQuest( OwnerID() , true ) --鎖起來
	Say(OwnerID(),"[SC_ 422322]")
	sleep(20)
	Say(OwnerID(),"[SC_ 422322_1]")
	local Ball = Lua_DW_CreateObj("flag",112399,780094,2,0)
	Lua_ObjDontTouch(Ball)
	AddToPartition( Ball,0 )
	sleep(20)
	CastSpell(OwnerID(),Ball,492670) -- 光鍊
	sleep(30)
	AddBuff(OwnerID(),502383,1,1)--斷法
	DelObj(Ball)
	DisableQuest( OwnerID() , false ) --解開
end