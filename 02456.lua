--支線=======================================
--424485  清理漁船這苦差事
---------------------------------------------------------------------------
--劇情怪：105971
function LuaPG_424485()
	local Player = OwnerID()

	if	CheckAcceptQuest(Player , 424485)==true	then
--		CheckCompleteQuest( Player , 424485) == false	then
		DW_QietKillOne(0,105971)			----靜靜的殺死怪，前者殺死後者，0代表為玩家
		ScriptMessage( Player, Player, 1, "[SC_424485_CLEAN]",  0  )
		ScriptMessage( Player, Player, 0, "[SC_424485_CLEAN]",  0  )  
	end
	return 1						----避免點擊物件後是紅色條
end




---------------------------------------------------------------------------
--424493  小釣手
---------------------------------------------------------------------------
--字串：SC_424493_00、SC_424493_01、SC_424493_02、SC_424493_03、SC_424493_04、SC_424493_05
--物品：240528
function LuaPG_424493()
	SetCursorType( OwnerID() , 23)				----改變點擊的圖示
	SetPlot( OwnerID(),"touch","LuaPG_424493_01",30 )
end

function LuaPG_424493_01()
	local Player = OwnerID()
	local NPC = TargetID()
	local Num01=ReadRoleValue(NPC,EM_RoleValue_Register1)

	DW_CancelTypeBuff(68,Player)				----取消騎乘狀態

	if 	CheckAcceptQuest(Player , 424493)==true		and
--		CheckCompleteQuest( Player , 424493) == false	and	
		CountBodyItem(Player,240528)<5		 	then
								----判斷任務
								----判斷物品
		if	Num01==0					then
								----判斷參數
			WriteRoleValue(NPC , EM_RoleValue_Register1 , 999)
								----將計數functuon鎖起來									
			ScriptMessage( Player , Player, 1,"[SC_424493_00]", 0 )
								----利用移動控制魚竿收回的時間
			CallPlot(NPC,"LuaPG_424493_03",NPC,Player)

			if 	BeginCastBarEvent( Player, NPC ,"[SC_424493_04]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424493_02" ) ~= 1 then
								----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
					ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )		
								----目標忙碌中
					ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----目標忙碌中		
			end
		end

	elseif 	CheckAcceptQuest(Player , 424487)==true		and
--		CheckCompleteQuest( Player , 424487) == false	and	
		CountBodyItem(Player,240542)<10		 	then
								----判斷任務
								----判斷物品
		if	Num01==0					then
								----判斷參數
			WriteRoleValue(NPC , EM_RoleValue_Register1 , 999)
								----將計數functuon鎖起來									
			ScriptMessage( Player , Player, 1,"[SC_424493_00]", 0 )
								----利用移動控制魚竿收回的時間
			CallPlot(NPC,"LuaPG_424487_03",NPC,Player)

			if 	BeginCastBarEvent( Player, NPC ,"[SC_424487_04]", 80, ruFUSION_ACTORSTATE_GATHER_BEGIN, ruFUSION_ACTORSTATE_GATHER_END, 0, "LuaPG_424487_02" ) ~= 1 then
								----判斷點擊的物品有沒有被鎖定，~=1表示物品被人鎖定
					ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )		
								----目標忙碌中
					ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----目標忙碌中		
			end

		else
			ScriptMessage( Player, Player, 1,"[SC_424493_05]", 0 )	
								----目標忙碌中
			ScriptMessage( Player, Player, 0,"[SC_424493_05]", 0 )		
								----目標忙碌中	
		end
	else
		ScriptMessage( player, player, 0,"[SYS_GAMEMSGEVENT_422]", 0 )			--使用條件不符
		return	
	end
end

function LuaPG_424493_02(Player, CheckStatus)
	local Player = OwnerID()
	local NPC = TargetID()
	EndCastBar( Player, CheckStatus )
	WriteRoleValue(NPC , EM_RoleValue_Register1 , 0)
	Sleep(10)

	local Num02=ReadRoleValue(NPC,EM_RoleValue_Register2)
		if( CheckStatus ~= 0 ) then
			if Num02 <= 40 then
				ScriptMessage( Player, Player, 1,"[SC_424493_01]", 0 )

			elseif Num02 <=60 then
				ScriptMessage( Player, Player, 1,"[SC_424493_02]", 0 )
				GiveBodyItem(Player,240528,1)
			else
				ScriptMessage( Player, Player, 1,"[SC_424493_03]", 0 )
			end
		else
			-- 失敗
			EndCastBar( Player, CheckStatus )
		end
	WriteRoleValue(NPC , EM_RoleValue_Register2,0)
end

function LuaPG_424493_03(NPC , Player)
	for i=1,80,1 do
		local Num01=ReadRoleValue(NPC,EM_RoleValue_Register1)
		if Num01==0 then
			return
		end
		Sleep(1)

		local y=i%10					----每10（1秒）一次判斷，共8次						
			if y==0 then
				WriteRoleValue(NPC,EM_RoleValue_Register2,i)
			end
		--Say(NPC,y..","..i)
	end
	return			
end




---------------------------------------------------------------------------
--424494  魚肚裡的小石頭
---------------------------------------------------------------------------
--FLAG：545480、545481
--物品：240531、240536
function LuaPG_424494()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	secret_people_start()

	if	CheckAcceptQuest(Player , 424494 )==true		and
		CheckCompleteQuest( Player , 424494) == false	and
		CountBodyItem(Player,240531)==1			and
		CheckFlag(Player,545480)==false			and
		CheckFlag(Player,545481)==false			then	
	
			AddSpeakOption(Player, NPC , "[SC_424494_01]","LuaPG_424494_01",0)		
	end

	if	CheckAcceptQuest(Player , 424495 )==true		and
		CheckCompleteQuest( Player , 424495) == false	and
		CheckFlag(Player,545483)==false			then

		if	CheckBuff(Player,620665)==true		then
			AddSpeakOption(Player, NPC , "[SC_424495_01]","LuaPG_424495_01",0)
		end		
	end
end

function LuaPG_424494_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	DelBodyItem(Player , 240531 , 1)
	SetSpeakDetail(Player,"[SC_424494_02]")
	SetFlag(Player,545480,1)
	Sleep(30)
	GiveBodyItem(Player , 240536 , 1)
end

function LuaPG_424494_02()	
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckAcceptQuest(Player,424494)==true	and
		CheckCompleteQuest( Player , 424494) == false	and
		CountBodyItem(Player,240536)==1			and
		CheckFlag(Player,545480)==true			and
		CheckFlag(Player,545481)==false			then

		DelBodyItem(Player , 240536 , 1)
		SetFlag(Player,545481,1)
	end	
end

---------------------------------------------------------------------------
--424494 任務結束後演戲
--演員：119097、
--走位：781001的no1～2
function LuaPG_424494_Complete()
	local Player = TargetID()
	local Mart = OwnerID()
	
	local Num = ReadRoleValue(Mart,EM_RoleValue_Register1)
	AddBuff(Player , 620732 , 1 , -1)
	
	if	Num == 0	then						----如果暫存值為0
		SetFlag(Player,545482,1)
		CallPlot(Mart , "LuaPG_424494_Complete_01" , Mart ,Player)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424494_Complete_01(Mart , Player)
	WriteRoleValue(Mart,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local Aruty = Lua_DW_CreateObj("flag",119097,781001,1)		----生成演戲119097
	ks_ActSetMode( Aruty )				

	DW_MoveToFlag( Aruty , 781001,2, 0 ,1)				----119097由781001的1走到2
				
	NPCSAY(Aruty,"[SC_424494_COMPLETE_01]")				----119097：我想你們被騙了
	Sleep(30)
	DelObj(Aruty)								----119097消失								
	SetFlag(Player,545482,0)

	CancelBuff(Player, 620732)			
	WriteRoleValue(Mart,EM_RoleValue_Register1,0)			----寫回Mart暫存值
end



---------------------------------------------------------------------------
--424495  自作自受
---------------------------------------------------------------------------
--偽裝術
---------------------------------------------------------------------------
function LuaPG_424495_Check()							----偽裝成商人，使用物品前的檢查
	local Player = OwnerID()
								
	if ReadRoleValue( Player , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( Player , Player , 1 , "[SC_423191_D_1]" , 0 ) 		----戰鬥中無法換裝。
		ScriptMessage( Player , Player , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( Player , 620665 ) == true then
		ScriptMessage( Player , Player , 1 , "[SC_424495_CHECK]" , 0 ) 		----你已經換上[240537]了
		ScriptMessage( Player , Player , 0 , "[SC_424495_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( Player)
	for i = 0 , Count do
		local BuffID = BuffInfo ( Player , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( Player , Player , 1 , "[SC_423191_D_3]" , 0 ) 	----你無法在騎乘時換裝
			ScriptMessage( Player , Player , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_424495_Use()
	local Player = OwnerID()							----偽裝成商人

	AddBuff(Player ,620665,0,-1)
	ScriptMessage( Player , Player , 1 , "[SC_424495_WEAR]" , 0 ) 		----換裝
	ScriptMessage( Player , Player , 0 , "[SC_424495_WEAR]" , 0 )
end

--function LuaPG_424495_Complete()								----完成任務，消除商人偽裝
--	CancelBuff(TargetID() ,620665)
--end


--騙回珍珠對話
---------------------------------------------------------------------------
--物品：錢袋240538
--flag：545483
--buff：620665
function LuaPG_424495_01()
	local Player = OwnerID()
	local NPC = TargetID()								
	SetSpeakDetail(Player,"[SC_424495_02]")

	if	CountBodyItem(Player,240538)==1		and
		CheckBuff(Player,620665)==true		then

		AddSpeakOption(Player, NPC , "[SC_424495_03]","LuaPG_424495_02",0)
	end		
end

function LuaPG_424495_02()
	local Player = OwnerID()
	local NPC = TargetID()	
							
	SetSpeakDetail(Player,"[SC_424495_04]")
	DelBodyItem(Player, 240538 , 1)
	SetFlag(Player , 545483 , 1)
end


---------------------------------------------------------------------------
--424495 任務結束後演戲
--演員：118799、
--走位：781001的no1～2
function LuaPG_424495_Complete()
	local Player = TargetID()
	local Mart = OwnerID()

	CancelBuff(Player ,620665)
	local Num = ReadRoleValue(Mart,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		SetFlag(Player,545482,1)
		CallPlot(Mart , "LuaPG_424495_Complete_01" , Mart ,Player)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424495_Complete_01(Mart , Player)
	WriteRoleValue(Mart,EM_RoleValue_Register1,999) 			----開始演出的標記	

	local Aruty = Lua_DW_CreateObj("flag",118799,781001,2)		----生成演戲119097
	ks_ActSetMode( Aruty )				

	NPCSAY(Aruty,"[SC_424495_COMPLETE_01]")				----119097：恭喜拿回自己的東西
	Sleep(30)
	DW_MoveToFlag( Aruty , 781001,1, 0 ,1)				----119097由781001的2走到1

	DelObj(Aruty)								----119097消失								
							
	WriteRoleValue(Mart,EM_RoleValue_Register1,0)			----寫回Mart暫存值
end





---------------------------------------------------------------------------
--424496  學習燈塔信號
---------------------------------------------------------------------------
--flag：545478
function LuaPG_424496()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424496 )==true		and
		CheckCompleteQuest( Player , 424496) == false	and
		CheckFlag(Player,545478)==false			then	
	
			SetSpeakDetail(Player,"[SC_424496_00]")
			AddSpeakOption(Player, NPC , "[SC_424496_01]","LuaPG_424496_01",0)
			AddSpeakOption(Player, NPC , "[SC_424496_02]","LuaPG_424496_02",0)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424496_01()					----燈塔自身辨識
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424496_03]")
	AddSpeakOption(Player, NPC , "[SC_424496_02]","LuaPG_424496_02",0)
	AddSpeakOption(Player, NPC , "[SC_424496_04]","LuaPG_424496_03",0)
end

function LuaPG_424496_02()					----通知改道
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_05]")
	AddSpeakOption(Player, NPC , "[SC_424496_01]","LuaPG_424496_01",0)
	AddSpeakOption(Player, NPC , "[SC_424496_04]","LuaPG_424496_03",0)
end

function LuaPG_424496_03()					----回答說懂了
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_06]")
	AddSpeakOption(Player, NPC , "[SC_424496_07]","LuaPG_424496_05",0)
	AddSpeakOption(Player, NPC , "[SC_424496_08]","LuaPG_424496_05",0)
	AddSpeakOption(Player, NPC , "[SC_424496_09]","LuaPG_424496_04",0)
end

function LuaPG_424496_04()					----回答正確
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_12]")
	SetFlag(Player , 545478 , 1)
end

function LuaPG_424496_05()					----回答錯誤
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424496_10]")
	AddSpeakOption(Player, NPC , "[SC_424496_11]","LuaPG_424496_03",0)
end



---------------------------------------------------------------------------
--424497  冰流村的故事
---------------------------------------------------------------------------
--flag：545479
function LuaPG_424497()
	local Player = OwnerID()
	local NPC = TargetID()								
	
	if	CheckAcceptQuest(Player , 424497 )==true		and
		CheckCompleteQuest( Player , 424497 ) == false	and
		CheckFlag(Player,545479)==false			then	
	
			SetSpeakDetail(Player,"[SC_424497_00]")
			AddSpeakOption(Player, NPC , "[SC_424497_01]","LuaPG_424497_01",0)
			AddSpeakOption(Player, NPC , "[SC_424497_02]","LuaPG_424497_02",0)
	else
			LoadQuestOption(Player)
	end
end

function LuaPG_424497_01()					----居民的版本
	local Player = OwnerID()
	local NPC = TargetID()								

	SetSpeakDetail(Player,"[SC_424497_03]")
	AddSpeakOption(Player, NPC , "[SC_424497_02]","LuaPG_424497_02",0)
	AddSpeakOption(Player, NPC , "[SC_424497_04]","LuaPG_424497_03",0)
end

function LuaPG_424497_02()					----蒐證的版本
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424497_05]")
	AddSpeakOption(Player, NPC , "[SC_424497_01]","LuaPG_424497_01",0)
	AddSpeakOption(Player, NPC , "[SC_424497_04]","LuaPG_424497_03",0)
end

function LuaPG_424497_03()					----回答說都聽過了
	local Player = OwnerID()
	local NPC = TargetID()

	SetSpeakDetail(Player,"[SC_424497_06]")
	SetFlag(Player , 545479 , 1)
end






--PE型任務=======================================
--424507  得情報者控制情勢
---------------------------------------------------------------------------
--字串：SC_SECRET_SIGN_01、SC_SECRET_SIGN_02、SC_424507_01
--Flag：545477
function LuaPG_424507()
	local Player = OwnerID()
	LoadQuestOption(Player)
	if	CheckCompleteQuest(Player,424515) == true then
			AddSpeakOption(Player, TargetID(),"[SC_SECRET_SIGN_01]","LuaPG_424507_01",0)
	end								----天氣這麼好，為什麼沒有海鷗
end

function LuaPG_424507_01()
	local Player = OwnerID()
	SetSpeakDetail(Player,"[SC_SECRET_SIGN_02]")		----因為暴風雨壟罩雷奇夫王國，所以海鷗躲在巢裡。								

	if	CheckAcceptQuest(Player , 424507 )==true		and
		CheckFlag(Player,545477)==false			and
		CountBodyItem(Player,240529)==1			then
		
		AddSpeakOption(Player, TargetID(),"[SC_424507_01]","LuaPG_424507_02",0)
								----把情報給娜芙蒂
	end
end

function LuaPG_424507_02()
	local Player = OwnerID()
	DelBodyItem(Player,240529, 1)
	CloseSpeak(Player)
	SetFlag(Player , 545477 , 1)
end