
------溫普斯頓
function LuaS_113459()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() ,422700 ) == true and CheckFlag(OwnerID(),543299) == false then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_1]","LuaS_113459_1",0) --我們是來馴服一頭獅龍獸......
	end
	if CheckAcceptQuest( OwnerID() ,422701 ) == false and CheckAcceptQuest( OwnerID() ,422704 ) == false and  CheckFlag(OwnerID(),543327) == true and CheckFlag(OwnerID(),543302) == false  then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_9]","LuaS_113459_3",0) --我反悔了！想更換馴服獅龍獸的方式......
	end

end

function LuaS_113459_1()

	SetSpeakDetail(OwnerID(),"[SC_422700_2]") --馴服一頭獅龍獸！我有沒有聽錯？這可嚇了我好大一跳！......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_3]","LuaS_113459_2",0) --如果可以騎著牠越過蛇人的軍隊警戒就再好不過了!
end

function LuaS_113459_2()

	SetSpeakDetail(OwnerID(),"[SC_422700_4]") --這是為了剷平蛇人，所進行的計畫是吧？嗯......
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_5]","LuaS_113459_3",0) --我們該如何開始？
end

function LuaS_113459_3()

	SetSpeakDetail(OwnerID(),"[SC_422700_6]") --首先，我必須知道，你想選擇何種方式馴服這些獅龍獸？
	SetFlag(OwnerID() , 543301 , 0 )
	SetFlag(OwnerID() , 543300 , 0 )
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_7]","LuaS_113459_4",0) --我想和平地與獅龍獸建立伙伴關係
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422700_8]","LuaS_113459_5",0) --我想展現力量，讓獅龍獸臣服於我
end

function LuaS_113459_4()

	SetFlag(OwnerID() , 543327 , 1 )
	SetFlag(OwnerID() , 543299 , 1 )
	SetFlag(OwnerID() , 543301 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_113459_5()

	SetFlag(OwnerID() , 543327 , 1 )
	SetFlag(OwnerID() , 543299 , 1 )
	SetFlag(OwnerID() , 543300 , 1 )
	CloseSpeak( OwnerID() )
end

function LuaS_113459_Check()

	SetFlag(TargetID() , 543302 , 1 )
end



--------捕捉獅龍獸
function LuaM_422701_Check()
	if CheckAcceptQuest( OwnerID() , 422701 ) == false or CountBodyItem(OwnerID() , 205906) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_0]" , 0 ) --你目前不需要這麼做
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_0]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) ~= 102533 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422507_1]" , 0 ) --這不是你要帶回去的對象
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422507_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) == 1  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_1]" , 0 ) --[102533]已經死了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_1]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_AttackTargetID ) ~= OwnerID()  then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_2]" , 0 ) --你必須先讓[102533]注意到你！
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_2]" , 0 ) 
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_HP ) >  ReadRoleValue( TargetID() , EM_RoleValue_MaxHP )/2  then
		SetAttack( TargetID() , OwnerID() )
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422701_3]" , 0 ) --[102232]頑強的抵抗著
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422701_3]" , 0 ) 
		return false
	end
	return true
end

function LuaM_422701_Effect()
	BeginPlot( TargetID() , "LuaM_422701_Reset" , 0 )
	GiveBodyItem( OwnerID() , 205906 , 1 )
--	UseItemDestroy()
	BeginPlot( OwnerID() , "LuaM_422701_Del" , 0 )
end

function LuaM_422701_Reset()
	LuaFunc_ResetObj( OwnerID() ) 
end

function LuaM_422701_Del()
	sleep(10)
	DelBodyItem ( OwnerID(),205913 , 1 )
end

---旗子：780436
function LuaS_422701_Check() --幼獅龍任務完成表演劇情
	SetFlag(TargetID() , 543302 , 1 )

	local NPC = CreateObjByFlag( 113509 , 780436 , 1 , 0 )  --被捉的幼獅龍
	AddToPartition( NPC , 0 )

	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_4]" , 0 ) --[113509]發出了一聲尖銳的叫聲！
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_4]" , 0 ) 

	sleep(30)

	local NPC1 = CreateObjByFlag( 102534 , 780436 , 2 , 0 )  --雌獅龍
	AddToPartition( NPC1 , 0 )
	local NPC2 = CreateObjByFlag( 102534 , 780436 , 3 , 0 )  --雌獅龍
	AddToPartition( NPC2 , 0 )
	SetAttack( NPC1 , TargetID() )
	SetAttack( NPC2 , TargetID() )
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_5]" , 0 ) --雌獅龍聽到叫聲，被呼喚過來！
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_5]" , 0 ) 
	sleep(30)
	CastSpell( OwnerID() , NPC1 , 492224 )
	Say( OwnerID() , "[SC_422138_8]" ) --走開！快走開！
	sleep(30)
	CastSpell( OwnerID() , NPC2 , 492224 )	
	sleep(30)
	ScriptMessage( TargetID() , TargetID() , 1 , "[SC_422701_6]" , 0 ) --幼獅龍被救走了......
	ScriptMessage( TargetID() , TargetID() , 0 , "[SC_422701_6]" , 0 ) 
	Delobj( NPC )
	Delobj( NPC1)
	Delobj( NPC2)
	Say( OwnerID() , "[SC_422701_7]" )--呼～真是太可怕了！
end

------暴怒獅龍獸死亡劇情
function LuaS_422702() 
	local PlayerNum = HateListCount( OwnerID() ) -1
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CountBodyItem( PPL , 205925 ) == 0  and CheckAcceptQuest( PPL , 422702 ) == true and CheckFlag(OwnerID(),543327) == false and GetDistance( OwnerID() , PPL ) < 300 then
			ScriptMessage( PPL , PPL , 0 , "[SC_422702]" , 0 ) --你將一頭[205925]放進自己的背包裡！
			ScriptMessage( PPL , PPL, 1 , "[SC_422702]" , 0 ) --0是左下對話框，1會跟戰鬥訊息互卡，2會和任務完成訊息互卡
			GiveBodyItem( PPL , 205925  , 1 )
		end
	end 
	return true
end

-----精英獅龍獸的死亡劇情

function LuaS_102536() 
	local PlayerNum = HateListCount( OwnerID() ) -1
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	for i = 0 ,  PlayerNum , 1 do
		local PPL = HateListInfo(OwnerID() , i , EM_HateListInfoType_GItemID )
		if CheckAcceptQuest( PPL , 422703) == true and GetDistance( OwnerID() , PPL ) < 300 then
			ScriptMessage( PPL , PPL , 0 , "[SC_102536]" , 0 ) --獅龍獸因[102536]被擊敗而感到憤怒！
			ScriptMessage( PPL , PPL, 2 , "[SC_102536]" , 0 )
		end
	end
	
	--叫出獅龍獸
	for i =1, 3, 1 do
		local j = CreateObjByFlag( 102535 , 780438 , i , 0 )  
--		WriteRoleValue( j  , EM_RoleValue_LiveTime , 120 ) --時間以秒計
		CallPlot( j , "LuaFunc_Obj_Suicide" , 300 )
		AddToPartition( j , 0 )
	end
 
	return true
end




---放置屍體
function LuaS_422702_check() --物品檢查

	if	CheckBuff(OwnerID(),503980)	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422702_1]", 0 ) --你已放置了一頭[205925]！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422702_1]", 0 )
		return false
	end

	if	HateListCount(OwnerID()) > 0	then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_112093_0]", 0 ) --你不能在戰鬥中使用
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_112093_0]", 0 )
		return false
	end

	if	Lua_ObjAreaCheck(OwnerID() , 732 ) ==false then
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422702_3]", 0 ) --你只能放置在[ZONE_TOWER OF RAGE]！
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422702_3]", 0 )
		return false
	end
	return true
end

function LuaS_422702_1() --使用物品

	local obj = LuaFunc_CreateObjByObj ( 113485 , OwnerID() )
	SetDefIdleMotion(obj,ruFUSION_MIME_DEATH_LOOP)
	AddToPartition( obj , 0 )
	AddBuff(OwnerID(),503980,1,-1)
	WriteRoleValue(obj,EM_RoleValue_PID,OwnerID())
	BeginPlot(obj,"LuaS_422702_2",0)--生存
	BeginPlot(obj,"LuaS_422702_3",0)--劇情表演
end

function LuaS_422702_2() 
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(10)
		if	not CheckID(Master)	then
			DelObj(OwnerID())
		end
		if	ReadRoleValue(Master,EM_RoleValue_IsDead) == 1	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
		if	not	CheckDistance( OwnerID(), Master , 300 )	then
			CancelBuff(Master, 503980)
			DelObj(OwnerID())
		end
	end
end

function LuaS_422702_3() -- 搜尋引怪的部份
	local NPC,Tar
	local Monster = 102534
	local Master = ReadRoleValue(OwnerID(),EM_RoleValue_PID)
	while true do
		sleep(20)
		NPC = SearchRangeNPC (OwnerID(),150)
		for i=0,table.getn(NPC)	do
			if	ReadRoleValue(NPC[i],EM_RoleValue_OrgID)==Monster and ReadRoleValue(NPC[i],EM_RoleValue_IsAttackMode) == 0 and ReadRoleValue( NPC[i] , EM_RoleValue_IsDead ) == 0  then
				Tar = NPC[i]		
				AddBuff(Tar,504728,1,-1)
				ScriptMessage( Master, Master, 0, "[SC_422702_2]", 0 ) --雌獅龍因為你的舉動感到憤怒！
				ScriptMessage( Master, Master, 1, "[SC_422702_2]", 0 )
				SetAttack( Tar , Master )
				SetFlag(Master , 543304 , 1 )
				CancelBuff(Master,503980)
				BeginPlot(OWNERid(),"LuaS_422702_4",0)
				return
			end
		end
	end
end

function LuaS_422702_4() -- 搜尋引怪的部份
	sleep(5)
	DelObj(OwnerID())
end

----擊敗精英獅龍

function LuaS_422703() 
	SetFlag(TargetID() , 543303 , 1 )
end
















