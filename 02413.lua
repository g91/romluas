function LuaQ_dr424300_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
		(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))>0.4  then
		ScriptMessage(O_ID,O_ID,1,"[SC_424317_02]",0)					--這隻生物，生命力還太過強盛無法捕捉！
		return false
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
			(ReadRoleValue(T_ID,EM_RoleValue_HP)/ReadRoleValue(T_ID,EM_RoleValue_MaxHP))<=0.4 then
			ScriptMessage(O_ID,O_ID,1,"[SC_424317_03]",0)				--這隻生物，經過幾番掙扎還是被你捕抓到了！
			return true
		elseif 	ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 and
			ReadRoleValue(T_ID,EM_RoleValue_IsDead)==true then
			return false
		else 
			ScriptMessage(O_ID,O_ID,1,"[SC_424300_01]",0)			 	--這只能對[105668]使用！
			return false
	end
end

function LuaQ_dr424300_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	if CheckAcceptQuest(O_ID,424300)==true and 
		ReadRoleValue(T_ID,EM_RoleValue_OrgID)==105668 then
		CallPlot( T_ID, "LuaFunc_ResetObj",T_ID )
		GiveBodyItem(O_ID,240209,1)
		
	end
end


function LuaS_dr424309_01()						--424309解結
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424309)==true then
	AddSpeakOption(O_ID,T_ID,"[SC_424309_01]","LuaS_dr424309_02",0)   	--<領主，人王希望您能中止戰爭，出使領主國會議>
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr424309_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424309_02]")				--雖然我中止了庫漢克．白角假冒我所發佈的軍事行動...
	AddSpeakOption(O_ID,T_ID,"[SC_424309_03]","LuaS_dr424309_03",0)	--<可是，領主！我無意冒犯，但在看過那些信箋後，應該有足夠的證據去證實，這事情背後肯定有問題！>
end

function LuaS_dr424309_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424309_04]")				--可眼下你要我憑這幾張摸不著頭緒的信件...
	GiveBodyItem(O_ID,545119,1)
end

function LuaS_dr424310_01()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckAcceptQuest(O_ID,424310)==true 
	and CountBodyItem(O_ID,240287)==0	then
	AddSpeakOption(O_ID,T_ID,"[SC_424310_01]","LuaS_dr424310_02",0)  	 --<請問能借我[240287]嗎?>
	else
	LoadQuestOption(O_ID)
	end
end

function LuaS_dr424310_02()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	SetSpeakDetail(O_ID,"[SC_424310_02]")				--我正好有多的，反正這個也快壞了乾脆就送你吧！
	GiveBodyItem(O_ID,240287,1)
end

function LuaQ_dr424311_01()										--拉納格424311用
	local own=OwnerID()
	local tar = TargetID()
	local Atable={}
	Atable=SearchRangeNPC(own,100)
	local ZNum=0
	for i = 0,table.getn(Atable),1 do
		local Z=ReadRoleValue(Atable[i],EM_RoleValue_OrgID)
		if Z==118309 then
			ZNum = ZNum+1
		end
	end
	if  ZNum~=0 then
		return true
	else
	ScriptMessage( own, own , 2 ,"[SC_424311_01]" , 0 )						--這法器還是看[118773]要怎麼用吧！	
		return false
	end
end

function LuaQ_dr424311_02()
	local own=OwnerID()
	ScriptMessage(own,own,1,"[SC_424311_11]",0)
	CastSpell(own,own,497927)
end

function LuaQ_dr424311_03()
	local O_ID=OwnerID()
	local T_ID=TargetID()
	LoadQuestOption(O_ID)
	if CheckBuff(O_ID,620174)==true and CheckAcceptQuest(O_ID,424311)==true then
		AddSpeakOption(O_ID,T_ID,"[SC_424311_02]","LuaQ_dr424311_04",0)   		--我已對領主使用了[620174]，你可以放心的說，我會協助你的！
		local Atable={}
        		 Atable=SearchRangePlayer(T_ID,80)
			for i=0,table.getn(Atable),1 do
				if CheckAcceptQuest(Atable[i],424311)==true then
			CloseSpeak(Atable[i])
			end
		end

	else
		LoadQuestOption(O_ID)
	end
end

function LuaQ_dr424311_04()
		local own=OwnerID()
		local tar=TargetID()
		DisableQuest( Tar, true ) 
		AddBuff(own,620113,0,26)
		CloseSpeak(own)
		callplot(Tar,"LuaQ_dr424311_07",Tar)
		BeginPlot(own,"LuaQ_dr424311_05",0)
		BeginPlot(own,"LuaQ_dr424311_06",0)
end

function LuaQ_dr424311_07(T_ID)
		local own=OwnerID()
		local tar=TargetID()
		sleep(250)
		DisableQuest( T_ID, false)
end

function LuaQ_dr424311_05()
	local  Aman =Lua_DW_CreateObj( "flag" ,118828,  780950  , 9 , 1 , 1 )		
	DW_MoveDirectToFlag( Aman ,  780950  , 10 , 1  )
	PlayMotion(Aman,112)
	sleep(70)
	say(Aman ,"[SC_424311_04]")						--[118827]！特使！這是怎麼回事！吾兒...！
	sleep(30)
	PlayMotion(Aman,101)	
	say(Aman ,"[SC_424311_06]")						--豈有此理，是不是那些惡毒[SC_ZONE20_01]！既然如此你就該讓為父王去為你討回公道阿！
	sleep(30)
	PlayMotion(Aman,112)
	say(Aman ,"[SC_424311_08]")						--那真的兇手到底是誰！
	Sleep(70)
	say(Aman ,"[SC_424311_10]")
	PlayMotion(Aman,105)						
	DW_MoveDirectToFlag( Aman ,  780950  , 12 , 1  )				
	Sleep(50)
	DelObj(Aman)
end

function LuaQ_dr424311_06()
		local own=ownerID()
		local tar=TargetID()
		local Aghost=Lua_DW_CreateObj( "flag" ,118827,  780950  , 7 , 1 , 1 )
		DW_MoveDirectToFlag( Aghost  , 780950 , 8 , 1  )
		sleep(40)
		npcsay(Aghost ,"[SC_424311_03]")						--父親，對不起，多虧特使，終於能跟你說話了！
		--npcsay(own,"[SC_424311_03]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_05]")						--父親！停止這場戰爭吧！我的死！確實是有人在背後操弄！
		--npcsay(own,"[SC_424311_05]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_07]")						--不！不是這樣的！當初殺害我的是被操控的SC_ZONE20_01]屍體！但絕對不是[SC_ZONE20_01]主使的！
		--npcsay(own,"[SC_424311_07]")
		sleep(40)
		npcsay(Aghost ,"[SC_424311_09]")						--這就要拜託特使大人去調查了！父親，我不願再見到你為我的事難過，所以請求你一定要協助特使！揪出幕後真兇！這樣我才能安心...
		--npcsay(own,"[SC_424311_09]")
		sleep(40)
		DW_MoveDirectToFlag( Aghost ,  780950  , 11 , 1  )
		Sleep(50)
		DelObj(Aghost)
		if CheckAcceptQuest(own,424311)==true then
		GiveBodyItem(own,545083,1)
		end
end

function LuaQ_DRBBQ_01()--觸碰劇情							--424299(飽餐一頓BBQ任務)
	SetCursorType( OwnerID() , 13)
	SetPlot( OwnerID(),"touch","LuaQ_DRBBQ_02",30 )

end

function LuaQ_DRBBQ_02()
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC

	DW_CancelTypeBuff(68,O_ID)
	
	--判斷有沒有任務
	--判斷有沒有物品
	--判斷有的沒的
	if 	checkAcceptQuest(O_ID,424299)==true and
		countbodyitem(O_ID,240298)>0 then
		WriteRoleValue(T_ID,EM_RoleValue_Register9,9)
		DelBodyItem( O_ID, 240298, 1 )						--使用後扣1
		ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_05]", 0 )
		CallPlot(T_ID,"LuaQ_DRBBQ_04",T_ID)
		if 	BeginCastBarEvent( O_ID, T_ID,"[SC_COOKING_01]", 80, 148, 150, 0, "LuaQ_DRBBQ_03" ) ~= 1 then
				ScriptMessage( O_ID, O_ID, 0,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
				ScriptMessage( O_ID, O_ID, 2,"[SAY_NPC_BUSY]", 0 );		--目標忙碌中
		end
	else 
		ScriptMessage( O_ID, O_ID, 0,"[SYS_GAMEMSGEVENT_422]", 0 )
		return
	end
end

function LuaQ_DRBBQ_03(ObjID, CheckStatus)
	local O_ID = OwnerID() 	-- 玩家
	local T_ID = TargetID()  	-- NPC
	EndCastBar( O_ID, CheckStatus )
	WriteRoleValue(T_ID,EM_RoleValue_Register9,0)
		Sleep(10)
	local num=ReadRoleValue(T_ID,EM_RoleValue_Register10)
		if( CheckStatus ~= 0 ) then
			if num <= 40 then
				ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_02]", 0 );
				GiveBodyItem(O_ID,240206,1)
			elseif num <=60 then
				ScriptMessage( O_ID, O_ID, 2,"[SC_COOKING_03]", 0 );
				GiveBodyItem(O_ID,240207,1)
			else
				ScriptMessage( O_ID, O_ID, 1,"[SC_COOKING_04]", 0 );
				GiveBodyItem(O_ID,240208,1)
			end
		else
			-- 失敗
			EndCastBar( O_ID, CheckStatus )
		end
	WriteRoleValue(T_ID,EM_RoleValue_Register10,0)
end

function LuaQ_DRBBQ_04(T_ID)
	for i=1,80,1 do
		local x=ReadRoleValue(T_ID,EM_RoleValue_Register9)
			if x==0 then
				return
			end
		Sleep(1)
		local y=i%10
			if y==0 then
				WriteRoleValue(T_ID,EM_RoleValue_Register10,i)
			end
		--Say(T_ID,y..","..i)
	end
	return			
end

function LuaQ_dr424300_05()							--克朵芬424300完成後表演
		local Agirl=Lua_DW_CreateObj( "flag" ,118834,  780950  , 13 , 1 , 1 )
		DW_MoveDirectToFlag( Agirl  , 780950 , 14 , 1  )
		AddBuff(ownerID(),620113,0,6)
		Say(Agirl,"[SC_423221_13]")
		sleep(40)
		DelObj(Agirl)
end