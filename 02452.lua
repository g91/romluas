--=======================================
--424468  中途停下的調查
---------------------------------------------------------------------------
--FLAG:545476
function LuaPG_424468()							----告訴吉兒要照顧勞勃
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player,424468)==true	and
		CheckFlag(Player,545476)==false		then
		SetFlag(Player,545476,1)
	end
end

--完成任務後接劇情
---------------------------------------------------------------------------
--演員：摩瑞克119050、吉兒119051、變身後摩瑞克119046、隱形球勞勃119047
--走位旗子：780990	no.1～3
--摩瑞克變身法術：620635
function LuaPG_424468_Complete()	
	local Player = TargetID()
	local Gill = OwnerID()

	local New_Gill = DW_CreateObjEX("obj",119051,Gill)			----生成演戲吉兒
	local Robert = LuaFunc_SearchNPCbyOrgID( Gill, 118913, 200, 0 )	----搜尋到勞勃

	local Num = ReadRoleValue(Gill,EM_RoleValue_Register1)
	AddBuff( Player,620924,1,-1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Gill , "LuaPG_424468_Complete_01" , New_Gill , Gill, Player, Robert)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424468_Complete_01(New_Gill , Gill, Player, Robert)
	WriteRoleValue(Gill,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local New_Robert = DW_CreateObjEX("obj",119047, Robert)		----生成演戲勞勃				
	local NeedChange = {New_Robert,New_Gill}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )
	end
	SetModeEx( New_Robert , EM_SetModeType_HideName, true)		----關掉名稱
				
	NPCSAY(New_Gill,"[SC_424468_FLYAWAY_01]")				----吉兒：乖乖在這裡等姊姊，姊姊馬上就回來
	Sleep(25)
	NPCSAY(New_Robert,"[SC_424468_FLYAWAY_02]")				----勞勃：喔......我知道了......
	Sleep(20)


	local Merick = Lua_DW_CreateObj("flag",119050,780990,1)		----生成演戲摩瑞克在780990的1
	ks_ActSetMode( Merick )
	NPCSAY(Merick,"[SC_424468_FLYAWAY_03]")				----摩瑞克：準備好了就走吧。
	DW_MoveToFlag( Merick , 780990,2, 0 ,1)				----摩瑞克由780990的1走到2
	DW_MoveToFlag( New_Gill , 780990,3, 0 ,1)				----吉兒由走到780990的3


	AddBuff(Merick,620635,1,-1)						----摩瑞克變身
	Sleep(10)
	FA_FaceFlagEX(Merick, 780990 , 1)					----摩瑞克轉身
	DW_MoveToFlag( Merick , 780990,1,0 ,1)				----摩瑞克飛走由780990的2飛到1，此為迴圈
	DelObj(Merick)								----摩瑞克消失

	DW_MoveToFlag( New_Gill , 780990,1,0 ,1)				----吉兒由780990的3飛到1，此為迴圈
	for index,value in pairs(NeedChange) do				----刪除吉兒、勞勃隱形球
		DelObj( value )	
	end								
							
	CancelBuff(Player,620924)
	WriteRoleValue(Gill,EM_RoleValue_Register1,0)				----寫回吉兒暫存值
end



---------------------------------------------------------------------------
--424471  前往冰流村
---------------------------------------------------------------------------
----冰流村的摩瑞克身上的範圍劇情
function LuaPG_424471() 
	SetPlot( OwnerID(),"range","LuaPG_424471_01",60 )
end


function LuaPG_424471_01()
	if	CheckAcceptQuest(OwnerID(),424471)==true	and    CheckCompleteQuest(OwnerID(),424471)==false   then
		SetFlag(OwnerID(),545484,1)
	end
end


--任務接下後接劇情
---------------------------------------------------------------------------
--演員：摩瑞克119102、吉兒119103、勞勃119104
--走位旗子：780990	no.1～4
function LuaPG_424471_Accept()
	local Player = TargetID()
	local Merick = OwnerID()

	local New_Merick = DW_CreateObjEX("obj",119102,Merick)
	local Robert = LuaFunc_SearchNPCbyOrgID( Merick, 118913, 200, 0 )	----搜尋到勞勃	
	local Gill = LuaFunc_SearchNPCbyOrgID( Merick, 119101, 200, 0 )	----搜尋到吉兒	
	local New_Gill = DW_CreateObjEX("obj",119103,Gill)			----生成演戲吉兒
	local New_Robert =DW_CreateObjEX("obj",119104,Robert)		----生成演戲勞勃						

	local NeedChange = {New_Robert,New_Gill,New_Merick}
	for index,value in pairs(NeedChange) do
		ks_ActSetMode( value )	
	end

	AddBuff(Player,620943,1,-1)

	local Num = ReadRoleValue(Merick,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Merick , "LuaPG_424471_Accept_01" , New_Gill , Player, Merick , New_Robert,New_Merick)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424471_Accept_01(New_Gill , Player, Merick , New_Robert,New_Merick)
	WriteRoleValue(Merick,EM_RoleValue_Register1,999) 			----開始演出的標記	


	DW_MoveToFlag( New_Merick , 780990,1, 0 ,1)				----摩瑞克由780990的2走到1
	DelObj(New_Merick)	
	DW_MoveDirectToFlag( New_Gill , 780990,1,0 ,1) 				----吉兒由780990的3走到1
	DW_MoveToFlag( New_Robert , 780990,4, 0 ,1)				----勞勃由原位走到780990的4，此為迴圈

	local NeedDelete = {New_Robert,New_Gill}
	for index,value in pairs(NeedDelete) do					----刪除吉兒、勞勃
		DelObj( value )	
	end								
							
	CancelBuff(Player,620943)
	WriteRoleValue(Merick,EM_RoleValue_Register1,0)			----寫回摩瑞克暫存值
end





---------------------------------------------------------------------------
--424472  白水晶商隊訂的貨
---------------------------------------------------------------------------
--FLAG：545485
--物品：240539
function LuaPG_424472()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	LoadQuestOption(Player)

	if	CheckCompleteQuest(Player,424515) == true 		then
		AddSpeakOption(Player,NPC,"[SC_SECRET_SIGN_01]","secret_people_say",0)
	end

	if	CheckAcceptQuest(Player , 424472 )==true		and
		CheckCompleteQuest( Player , 424472) == false	and
		CountBodyItem(Player,240539)==1			then			
	
			AddSpeakOption(Player, NPC , "[SC_424472_01]","LuaPG_424472_01",0)		
	elseif	CheckAcceptQuest(Player , 424473 )==true		and
		CheckCompleteQuest( Player , 424473 ) == false	and
		CheckFlag(Player,545486)==false			then	
	
			SetSpeakDetail(Player,"[SC_424473_00]")
			AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
			AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
	end
end

function LuaPG_424472_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	CloseSpeak(Player)
	DelBodyItem(Player , 240539 , 1)
	SetFlag(Player,545485,1)
end



function LuaPG_424472_re()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424472 )==true		and
		CheckCompleteQuest( Player , 424472) == false		and
		CountBodyItem(Player,240539)==0			and
		CheckFlag(Player,545485)==false			then
		SetSpeakDetail(Player,"[SC_424472_02]")
		AddSpeakOption(Player,NPC,"[SC_424472_03]","LuaPG_424472_re_01",0)
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424472_re_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	CloseSpeak(Player)
	GiveBodyItem(Player , 240539 , 1)
end

---------------------------------------------------------------------------
--424473  可疑的反應
---------------------------------------------------------------------------
--flag：詢問威爾的消息545486
--function LuaPG_424473()
--	local Player = OwnerID()
--	local NPC = TargetID()								
--	
--	if	CheckAcceptQuest(Player , 424473 )==true		and
--		CheckCompleteQuest( Player , 424473 ) == false	and
--		CheckFlag(Player,545486)==false			then	
--	
--			SetSpeakDetail(Player,"[SC_424473_00]")
--			AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
--			AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
--	else
--			LoadQuestOption(Player)
--	end
--end

function LuaPG_424473_01()							----問商隊要停多久
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_03]")
	AddSpeakOption(Player, NPC , "[SC_424473_02]","LuaPG_424473_02",0)
	AddSpeakOption(Player, NPC , "[SC_424473_04]","LuaPG_424473_03",0)
end

function LuaPG_424473_02()							----閒聊說有新產品
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_05]")
	AddSpeakOption(Player, NPC , "[SC_424473_01]","LuaPG_424473_01",0)
	AddSpeakOption(Player, NPC , "[SC_424473_04]","LuaPG_424473_03",0)
end

function LuaPG_424473_03()							----問威爾
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424473_06]")
	SetFlag(Player, 545486 , 1)
end


--任務結束，接劇情
---------------------------------------------------------------------------
--演員：艾依伯格119117
--走位旗子：780990	no.5
function LuaPG_424473_Complete()
	Lua_ZonePE_3th_GetScore(100)
	
	local Player = TargetID()
	local Vet = OwnerID()

	local New_Vet = DW_CreateObjEX("obj",119117,Vet)			----生成演戲艾依伯格
	ks_ActSetMode( New_Vet )	

	local Num = ReadRoleValue(Vet,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Vet , "LuaPG_424473_Complete_01" , New_Vet , Player, Vet)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424473_Complete_01( New_Vet , Player, Vet)
	WriteRoleValue(Vet,EM_RoleValue_Register1,999) 			----開始演出的標記	

	PlayMotion(New_Vet,ruFUSION_ACTORSTATE_emote_head_shake)		----艾依伯格搖頭動作
	Sleep(10)	
	NPCSAY(New_Vet,"[SC_424473_COMPLETE_01]") 				----艾依伯格：你不用問了......我、我什麼都不能說。
	Sleep(25)
	NPCSAY(New_Vet,"[SC_424473_COMPLETE_02]")				----艾依伯格：我該走了......白水晶的人應該都在等我。
	Sleep(20)
	DW_MoveToFlag( New_Vet , 780990,5, 0 ,1)				----艾依伯格由原地走到780990的no5
	DelObj( New_Vet )														

	WriteRoleValue(Vet,EM_RoleValue_Register1,0)				----寫回艾依伯格暫存值
end





---------------------------------------------------------------------------
--424475  交換條件
---------------------------------------------------------------------------
--物品：240541
function LuaPG_424475()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	LoadQuestOption(Player)
	AddSpeakOption( Player, NPC, "[SO_FORMULA_STORE]" , "DW_OpenRecipeList", 0 )--我想看看你賣的配方。

	if	CheckAcceptQuest(Player , 424475 )==true		and
		CheckCompleteQuest( Player , 424475) == false		and
		CountBodyItem(Player , 240540) >= 5			and
		CountBodyItem(Player , 240541) == 0			then

			AddSpeakOption(Player, NPC , "[SC_424475_01]","LuaPG_424475_01",0)		
	end
end

function LuaPG_424475_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	DelBodyItem(Player , 240540 , 5)
	SetSpeakDetail(Player,"[SC_424475_02]")
	GiveBodyItem(Player , 240541 , 1)
--	AddSpeakOption(Player, NPC , "[SC_424475_03]","LuaPG_424475_02",0)
end

--function LuaPG_424475_02()
--	local Player = OwnerID()
--	local NPC = TargetID()								

--	CloseSpeak(Player)	
--	GiveBodyItem(Player , 240541 , 1)
--end




---------------------------------------------------------------------------
--424476  情報入手
---------------------------------------------------------------------------
--flag：確認威爾的消息545488
function LuaPG_424476()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	secret_people_start_beach()
	

	if	CheckAcceptQuest(Player , 424476 )==true		and
		CheckCompleteQuest( Player , 424476) == false		and	
		CheckFlag(Player,545488)==false			then
			AddSpeakOption(Player, NPC , "[SC_424476_00]","LuaPG_424476_01",0)
	end
end



function LuaPG_424476_01()
	local Player = OwnerID()
	local NPC = TargetID()
							
	SetSpeakDetail(Player,"[SC_424476_01]")
	AddSpeakOption(Player, NPC , "[SC_424476_02]","LuaPG_424476_02",0)
end

function LuaPG_424476_02()
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424476_03]")
	SetFlag(Player , 545488 , 1)
end


--424476任務結束，接劇情
---------------------------------------------------------------------------
--演員：王國軍a119124、b119151、葛麗119152、骯髒賴利119123
--走位旗子：780990	no.6～no.12
--演戲buff：620689
function LuaPG_424476_Complete()
	local Player = TargetID()
	local Larry = OwnerID()

	local New_Larry = DW_CreateObjEX("obj",119123,Larry)
	ks_ActSetMode( New_Larry )
	
	AddBuff( Player,620689,1,-1)
	local Num = ReadRoleValue(Larry,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Larry , "LuaPG_424476_Complete_01" , Larry , Player,New_Larry)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
	Lua_ZonePE_3th_GetScore(100)
end

function LuaPG_424476_Complete_01( Larry , Player,New_Larry)
	WriteRoleValue(Larry,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local SoldierA = Lua_DW_CreateObj("flag",119124,780990,6)
	local SoldierB = Lua_DW_CreateObj("flag",119151,780990,8)

	local NeedChange = {SoldierA,SoldierB}
		for index,value in pairs(NeedChange) do
			ks_ActSetMode( value )	
		end


	DW_MoveDirectToFlag( SoldierA , 780990,7,0 ,1)				----王國軍a由780990的6走到7
	WriteRoleValue(SoldierB  ,EM_RoleValue_IsWalk , 0 )
	DW_MoveToFlag( SoldierB , 780990, 9 ,0 ,1)				----王國軍b由780990的8走到9

		for index,value in pairs(NeedChange) do
			AdjustFaceDir( value, Player, 0 )	
		end

	Sleep(10)	

	NPCSAY(SoldierA,"[SC_PLAY_424476_01]")					----王國軍a：你好像在打探些奇怪的事
	Sleep(25)
	PlayMotion(SoldierB,ruFUSION_ACTORSTATE_emote_point)		----王國軍b手指玩家動作
	NPCSAY(SoldierB,"[SC_PLAY_424476_02]")					----王國軍b：基於安全問題，請跟我們來一趟
	Sleep(25)
									
	DW_MoveDirectToFlag( New_Larry , 780990,10,0 ,1) 			----骯髒賴利偷溜掉，走到780990的10

	local Gry = Lua_DW_CreateObj("flag",119152,780990,11)
	
	DW_MoveToFlag( Gry , 780990,12,0 ,1)					----葛麗從780990的11走到12
	ks_ActSetMode( Gry )

	DelObj(New_Larry)

	NPCSAY(Gry,"[SC_PLAY_424476_03]") 						----葛麗：不好了強盜又出現了
	Sleep(10)
	FA_FaceFlagEX(Gry, 780990 ,11)
	PlayMotion(Gry,ruFUSION_ACTORSTATE_emote_point)
	Sleep(10)

	FA_FaceFlagEX(SoldierA, 780990 , 9)					----王國軍兩人互看
	FA_FaceFlagEX(SoldierB, 780990 , 7)

	Sleep(10)	

	AdjustFaceDir( SoldierA, Gry, 0 )
	AdjustFaceDir( SoldierB, Gry, 0 )

	NPCSAY(SoldierA,"[SC_PLAY_424476_04]")					----王國軍a：我們馬上去處理
	DW_MoveDirectToFlag( SoldierA , 780990,15,0 ,1) 			----王國軍a由780990的7走到6
	DW_MoveToFlag( SoldierB , 780990,16,0 ,1)				----王國軍b由780990的9走到8
	Sleep(20)

	local NeedDelNPC={SoldierA,SoldierB,Gry}
	for index,value in pairs(NeedDelNPC) do					----刪除演員
		DelObj(value)
	end									

	CancelBuff(Player,620689)
	WriteRoleValue(Larry,EM_RoleValue_Register1,0)			----寫回Larry暫存值
end
