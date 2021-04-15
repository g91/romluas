--委託
---------------------------------------------------------------------------
--424280 紅木的寶庫
---------------------------------------------------------------------------
function LuaPG_424280_exchange()						----與奧林交換樹苗的對話
	if	CheckAcceptQuest(OwnerID(), 424280)==true	and	
		CountBodyItem(OwnerID(), 209638)>=10	then			----如果有足夠蟲殼
		SetSpeakDetail(OwnerID(),"[SC_424280_EXCHANGE]")
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424280_EXCHANGE_02]","LuaPG_424280_exchange_02",0)
	else
		LoadQuestOption(OwnerID())
	end
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_B1]"," William_424272_B2",0)
	end
end

function LuaPG_424280_exchange_02()
	CloseSpeak(OwnerID())
	DelBodyItem(OwnerID(), 209638, 10)
	GiveBodyItem(OwnerID(), 209641, 1)
end



---------------------------------------------------------------------------
--主線
---------------------------------------------------------------------------
--424251 不論何時都要保持中立
---------------------------------------------------------------------------
function LuaPG_424251_refuse()
	if	CheckAcceptQuest(OwnerID(), 424251)==true		and
		CheckCompleteQuest(OwnerID(), 424251)==false	and
		CheckFlag(OwnerID(),545072)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424251_REFUSE_01]")		----你不是來幫忙的嗎......
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424251_REFUSE_02]","LuaPG_424251_refuse_02",0)
										----很抱歉，我不能答應
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424251_refuse_02()	
	LoadQuestOption(OwnerID())							----關掉對話
	SetFlag(OwnerID(), 545072, 1)						----給flag
end


--完成任務後接劇情
---------------------------------------------------------------------------
function LuaPG_424251_argue()
	local Player = TargetID()
	local Topp = OwnerID()

	local New_Topp = DW_CreateObjEX("obj",118461,Topp)		----生成演戲托普
	AddBuff( Player,620700,1,12)
	
	local Num = ReadRoleValue(Topp,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(Topp , "LuaPG_424251_argue_02" , Topp ,Player,New_Topp)	
										----接演戲function
	else
		LoadQuestOption(Player)
		SetFlag(Player, 545076, 1)
	end
end

function LuaPG_424251_argue_02(Topp ,Player,New_Topp)
--	say(OwnerID(),"11")
	
	WriteRoleValue(Topp,EM_RoleValue_Register1,999) 			----開始演出的標記	
				
	ks_ActSetMode( New_Topp )

	AdjustFaceDir(New_Topp, Player, 0 )					----托普面對玩家
	PlayMotion(New_Topp,ruFUSION_ACTORSTATE_emote_point)		----托普動作：指著玩家
	Say(New_Topp,"[SC_424251_ARGUE_01]")				----托普：臭傢伙！你是幫哪邊的！
	Sleep(15)
	Say(New_Topp,"[SC_424251_ARGUE_02]")				----啊啊，我知道了！你是牛頭的間諜對吧！
	Sleep(15)
	PlayMotion(New_Topp,ruFUSION_ACTORSTATE_EMOTE_ANGRY)	----托普生氣動作
	Say(New_Topp,"[SC_424251_ARGUE_03]")				----原來如此，剛剛是和同伴在演戲嗎！
	Sleep(10)

	local Galloper = Lua_DW_CreateObj("flag",118463,780952,1)		----傳令官出現
	ks_ActSetMode( Galloper )
	Say(Galloper,"[SC_424251_ARGUE_04]")				----胡說八道，這可是達拉尼斯的特使大人阿！
	Sleep(15)
	WriteRoleValue(Galloper  ,EM_RoleValue_IsWalk , 1 ) 			----傳令官從780952的no1走到no2
	DW_MoveToFlag( Galloper , 780952,2,0 ,1) 				----這是迴圈  到了才跑下一行
	DelObj(New_Topp)								
	DelObj(Galloper)

	CancelBuff(Player,620700)
	SetFlag(Player, 545076, 1)						----控制cli
	WriteRoleValue(Topp,EM_RoleValue_Register1,0)			----寫回暫存值
end


---------------------------------------------------------------------------
--424252 晉見火靴領主
---------------------------------------------------------------------------
--function LuaPG_424252()
--	LoadQuestOption(OwnerID())
--	if	CheckAcceptQuest(OwnerID(),424252)==true	then
--		SetFlag(OwnerID(),545073,1)
--	end
--end

---------------------------------------------------------------------------
--424253 國家的聲音
---------------------------------------------------------------------------
function LuaPG_424253_Talk_With_01()
	if	CheckAcceptQuest(OwnerID(),424253)==true		and
		CheckCompleteQuest(OwnerID(), 424253)==false	and	
		CheckFlag(OwnerID(),545074)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_01]")		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_01]","LuaPG_424253_Talk_With_02",0)
										----關於將軍
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_02]","LuaPG_424253_Talk_With_03",0)
										----關於主戰派
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----我很瞭解你們的情形了
	elseif	CheckAcceptQuest(OwnerID(),424252)==true		and	
		CheckFlag(OwnerID(),545073)==false			then
		SetFlag(OwnerID(),545073,1)			
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424253_Talk_With_02()						----關於將軍
	SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_02]")		
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_02]","LuaPG_424253_Talk_With_03",0)
										----關於主戰派
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----我很瞭解你們的情形了										
end

function LuaPG_424253_Talk_With_03()						----關於主戰派
	SetSpeakDetail(OwnerID(),"[SC_424253_TALK_WITH_03]")			----你不是來幫忙的嗎......
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_01]","LuaPG_424253_Talk_With_02",0)
										----關於將軍
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424253_CHOICE_03]","LuaPG_424253_Talk_With_04",0)		
										----我很清楚你們的情形了
end

function LuaPG_424253_Talk_With_04()						----很瞭解了
	CloseSpeak(OwnerID())
	SetFlag(OwnerID(), 545074, 1)
end

--劇情結束後的表演
---------------------------------------------------------------------------
function LuaPG_424253_General_Come_In()
	local Player = TargetID()
	local King = OwnerID()

	local Num = ReadRoleValue(King,EM_RoleValue_Register1)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(King , "LuaPG_424253_General_Come_In_02" , King, Player)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424253_General_Come_In_02(King ,Player)
	WriteRoleValue(King,EM_RoleValue_Register1,999) 			----開始演出的標記
	local New_King = DW_CreateObjEX("obj",118335,King)			----生成隱形瑞佛爾
	SetModeEx(New_King ,EM_SetModeType_ShowRoleHead,false)       		 ----不顯示血條
	SetModeEx( New_King , EM_SetModeType_HideName, true)		----隱藏名稱
	Say(New_King,"[SC_424253_KING_YELL]")	
	Sleep(15)
	local General = Lua_DW_CreateObj("flag",118323,780952,3)		----生成將軍在780952的NO3
	ks_ActSetMode( General )
	DW_MoveToFlag( General , 780952,4,0 ,1)				----迴圈，到了才會有下一步

	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		----將軍擺出生氣動作
	Yell(General,"[SC_424253_GENERAL_YELL]",2)				----將軍：愚蠢！
	PlayMotion(General,ruFUSION_ACTORSTATE_emote_point)		----將軍指著領主
	Sleep(25)
	Yell(General,"[SC_424253_GENERAL_YELL_02]",2)			----將軍：你的膽小作法，讓祖先都因此蒙羞！
	Sleep(20)
	PlayMotion(General,ruFUSION_ACTORSTATE_EMOTE_ANGRY)		----將軍擺出生氣動作
	Yell(General,"[SC_424253_GENERAL_YELL_03]",2)			----將軍：我是不會停戰的！
	Sleep(25)
	DW_MoveToFlag( General , 780952,3,0 ,1)				----將軍離開
	DelObj(General)
	DelObj(New_King)
	WriteRoleValue(King,EM_RoleValue_Register1,0) 			
end


---------------------------------------------------------------------------
--424254 擅自行動
---------------------------------------------------------------------------
function LuaPG_424254_King_Leave()						----接任務後的表演
	local Player=TargetID()					
	local King=LuaFunc_SearchNPCbyOrgID( Player, 118322, 200, 0 )
--	Say(OwnerID(),"00")							----此處為瑞佛爾
	local Soldier=LuaFunc_SearchNPCbyOrgID( King, 118340, 200, 0 )
	local Num = ReadRoleValue(King,EM_RoleValue_Register2)
	
	if	Num == 0	then						----如果暫存值為0
		CallPlot(King , "LuaPG_424254_King_Leave_02" , King, Player,Soldier)	
										----接演戲function
	else
		LoadQuestOption(Player)
	end
end

function LuaPG_424254_King_Leave_02(King, Player,Soldier)
	WriteRoleValue(King,EM_RoleValue_Register2,999) 			----開始演出的標記
	local New_King = DW_CreateObjEX("obj",118462,King)			----生成演戲瑞佛爾
	ks_ActSetMode( New_King )

	local New_Soldier=DW_CreateObjEX("obj",118572,Soldier)
	ks_ActSetMode( New_Soldier )

	local Tenn = LuaFunc_SearchNPCbyOrgID( King, 118327, 200)
	
	DW_MoveToFlag( New_King , 780952,5,0 ,1)				----演戲瑞佛爾走向780952的NO5
	WriteRoleValue(New_Soldier  ,EM_RoleValue_IsWalk , 0 ) 
	DW_MoveToFlag( New_Soldier , 780952,9,0 ,1)				
	DelObj(New_King)
	DelObj(New_Soldier)
	Tell(Player ,Tenn ,"[SC_424254_TENN_TELL]")				----泰恩對玩家的悄悄話
--	Say(Player,"11")
	WriteRoleValue(King,EM_RoleValue_Register2,0) 			----開始演出的標記
end


function LuaPG_424254_01()							----和泰恩的對話
	if	CheckAcceptQuest(OwnerID(),424254)==true		and
		CheckCompleteQuest(OwnerID(), 424254)==false	and
		CheckFlag(OwnerID(),545075)==false			then
		SetSpeakDetail(OwnerID(),"[SC_424254_TENN_01]")		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424254_TENN_02]","LuaPG_424254_02",0)
										----關於將軍						
	else
		LoadQuestOption(OwnerID())
	end
end

function LuaPG_424254_02()
	LoadQuestOption(OwnerID())
	SetFlag(OwnerID(), 545075, 1)
end


---------------------------------------------------------------------------
--424257 擅自行動
---------------------------------------------------------------------------
--function LuaPG_424257_Howl_01()	
--	if	CheckAcceptQuest(OwnerID(),424257)==true		and
--		CountBodyItem(OwnerID(),240226)>0			and
--		CheckFlag(OwnerID(),545098)==false			then
--		SetSpeakDetail(OwnerID(),"[SC_424257_01]")		
--		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Howl_02",0)						
--	else
--		LoadQuestOption(OwnerID())
--	end
--end

function LuaPG_424257_Howl_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_02]")
	BeginPlot(OwnerID(),"LuaPG_424257_Howl_03",0)		
end

function LuaPG_424257_Howl_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545098,1)
	DW_QietKillOne(0,105759) 				----靜靜的殺死怪，前者殺死後者，0代表為玩家	
end

function LuaPG_424257_Stark_01()
	LoadQuestOption(OwnerID())	
	if	CheckAcceptQuest(OwnerID(),424257)==true		and
		CountBodyItem(OwnerID(),240226)>0			and
		CheckFlag(OwnerID(),545099)==false			then	
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Stark_02",0)						
	end
end

function LuaPG_424257_Stark_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_04]")
	BeginPlot(OwnerID(),"LuaPG_424257_Stark_03",0)		
end

function LuaPG_424257_Stark_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545099,1)
	DW_QietKillOne(0,105759) 				----靜靜的殺死怪，前者殺死後者，0代表為玩家	
end

function LuaPG_424257_Fortkin_01()
	LoadQuestOption(OwnerID())
	if	CheckAcceptQuest(OwnerID(),424257)==true		and
		CountBodyItem(OwnerID(),240226)>0			and
		CheckFlag(OwnerID(),545100)==false			then		
		AddSpeakOption(OwnerID(), TargetID(),"[SC_424257_GIVE]","LuaPG_424257_Fortkin_02",0)						
	end
	if	CheckAcceptQuest(OwnerID(),424272)==TRUE	then
			AddSpeakOption(OwnerID(),OwnerID(),"[SC_424272_A1]"," William_424272_A2",0)
	end
end

function LuaPG_424257_Fortkin_02()
	SetSpeakDetail(OwnerID(),"[SC_424257_06]")
	BeginPlot(OwnerID(),"LuaPG_424257_Fortkin_03",0)		
end

function LuaPG_424257_Fortkin_03()
	DelBodyItem(OwnerID(),240226,1)
	SetFlag(OwnerID(),545100,1)
	DW_QietKillOne(0,105759) 				----靜靜的殺死怪，前者殺死後者，0代表為玩家	
end


---------------------------------------------------------------------------
--424258 情報偽裝術
---------------------------------------------------------------------------
--偽裝術
---------------------------------------------------------------------------
function LuaPG_424258_Check()----偽裝成矮人，使用物品前的檢查
	if ReadRoleValue( OwnerID() , EM_RoleValue_IsAttackMode ) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_1]" , 0 ) 		----戰鬥中無法換裝。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_1]" , 0 )
		return false
	end
	if CheckBuff( OwnerID() , 506712 ) == true then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_424258_CHECK]" , 0 ) 		----你已經換上[240225]了
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_424258_CHECK]" , 0 )
		return false
	end
	local Count = BuffCount ( OwnerID())
	for i = 0 , Count do
		local BuffID = BuffInfo ( OwnerID() , i , EM_BuffInfoType_BuffID )
		BuffType = GameObjInfo_int ( BuffID , "AssistType" )
		if BuffType == 68 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_423191_D_3]" , 0 ) 	----你無法在騎乘時換裝
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_423191_D_3]" , 0 )
			return false
		end
	end
	return true
end

function LuaPG_424258_Use()									----偽裝成矮人，使用物品後
	AddBuff(OwnerID() ,509890,0,-1)
end

function LuaPG_424258_Complete()								----完成任務，消除矮人偽裝
	CancelBuff(TargetID() ,509890)
end


--和矮人兵說話
---------------------------------------------------------------------------
function LuaPG_424258_Talk_To_ASoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----對話
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545116)==false		then				----檢查任務
		if	CheckBuff(Player,509890)==true	then				----檢查有沒有buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_ASoldier_02",0)
												----將軍有沒有下什麼新的指令啊？
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_ASoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_04]")						----呵呵，你問將軍有沒有什麼新指令？
	SetFlag(OwnerID(), 545116, 1)
	DW_QietKillOne(0,105760) 								----靜靜的殺死怪，前者殺死後者，0代表為玩家
end

function LuaPG_424258_Talk_To_BSoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----對話
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545117)==false		then				----檢查任務
		if	CheckBuff(Player,509890)==true	then				----檢查有沒有buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_BSoldier_02",0)
												----將軍有沒有下什麼新的指令啊？
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_BSoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_05]")						----將軍是說......哼......等等，沒見過你
	AddSpeakOption(OwnerID(), TargetID(),"[SC_424258_06]","LuaPG_424258_Talk_To_BSoldier_03",0)
end

function LuaPG_424258_Talk_To_BSoldier_03()
	SetSpeakDetail(OwnerID(),"[SC_424258_07]")						----......搞不太懂你在說什麼，算了
	SetFlag(OwnerID(), 545117, 1)
	DW_QietKillOne(0,105760) 								----靜靜的殺死怪，前者殺死後者，0代表為玩家
end

function LuaPG_424258_Talk_To_CSoldier()
	local Player=OwnerID()
	LoadQuestOption(Player)								----對話
	if	CheckAcceptQuest(Player,424258)==true	and
		CheckFlag(OwnerID(),545118)==false		then				----檢查任務
		if	CheckBuff(Player,509890)==true	then				----檢查有沒有buff
			AddSpeakOption(Player, TargetID(),"[SC_424258_01]","LuaPG_424258_Talk_To_CSoldier_02",0)
												----將軍有沒有下什麼新的指令啊？
		else
			ScriptMessage( Player , Player , 1 , "[SC_424258_02]" , 0 ) 		
			ScriptMessage( Player , Player , 0 , "[SC_424258_02]" , 0 )	
		end
	end
end

function LuaPG_424258_Talk_To_CSoldier_02()
	SetSpeakDetail(OwnerID(),"[SC_424258_08]")						
	SetFlag(OwnerID(), 545118, 1)
	DW_QietKillOne(0,105760) 								----靜靜的殺死怪，前者殺死後者，0代表為玩家
end


--接任務後觸發的範圍劇情
---------------------------------------------------------------------------
function LuaPG_424258_Range()
--	Say(OwnerID(),"00")
	SetPlot( OwnerID(),"range","LuaPG_424258_Range_02",120 )  				----範圍劇情開始，掛在將軍身上
end

function LuaPG_424258_Range_02()
--	Say(OwnerID(),"77")
	local Player=OwnerID()
	local General=TargetID()			
	local Num = ReadRoleValue(General,EM_RoleValue_Register1)
	
--	Say(General,"11")

	if	CheckAcceptQuest( Player , 424258 ) == true	and
		CheckFlag(Player,545116)==false			and
		CheckFlag(Player,545117)==false			and
		CheckFlag(Player,545118)==false			and
		CheckFlag(Player,545121)==false			then
		if	Num == 0	then							----如果暫存值為0
			CallPlot(General , "LuaPG_424258_Range_03" , General,Player)		----接演戲function
--			Say(General,"22")	
							
		elseif	Num > 0	then							----如果暫存值大於0
--			Say(General,"33")
			SetFlag(Player,545120, 1)						----給flag（545120）可以看演戲
			Sleep(70)								----計算演戲時間
			SetFlag(Player,545120, 0)						----刪除flag
			SetFlag(Player,545121, 1)						----給flag(545121)
		end
--		Say(General,"44")
	end
end

function LuaPG_424258_Range_03(General,Player)
--	Say(General,"55")
	SetFlag(Player,545120, 1)								----給flag（545120）可以看演戲
	WriteRoleValue(General,EM_RoleValue_Register1,999) 					----開始演出的標記
	local New_General=DW_CreateObjEX("obj",118468,General)				----瓦博倫產生	
	ks_ActSetMode( New_General )

	DW_MoveToFlag( New_General , 780952,6,0 ,1)					----演戲瓦博倫走向走向780952的NO6，此程式為迴圈
	FA_FaceFlagEX(New_General, 780952 , 7)						----演戲瓦博倫面對軍隊
	PlayMotion(New_General,ruFUSION_ACTORSTATE_emote_point)
	Yell(New_General,"[SC_424258_03]",2)
	Sleep(20)
	DW_MoveToFlag( New_General , 780952,8,0 ,1)					----演戲瓦博倫退場
	DelObj(New_General)
	SetFlag(Player,545120, 0)
	SetFlag(Player,545121, 1)								----給flag(545121)
	WriteRoleValue(General,EM_RoleValue_Register1,0) 					----歸0	
end


---------------------------------------------------------------------------
--424259  站住！有話要說！
---------------------------------------------------------------------------
----將軍身上的範圍劇情
function LuaPG_424259_General_Forest() 
	SetPlot( OwnerID(),"range","LuaPG_424259_General_Forest_02",60 )  		----範圍劇情開始
end


function LuaPG_424259_General_Forest_02()
	if	CheckAcceptQuest(OwnerID(),424259)==true	and    CheckCompleteQuest(OwnerID(),424259)==false   then
		SetFlag(OwnerID(),545122,1)
	end
end



