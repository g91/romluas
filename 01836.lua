--範圍劇情 有接任務的人得到旗標

function LuaS_423263_0()---掛在隱形物件115327初始劇情
	
	local prisoner1 = CreateObjByFlag( 115328, 780617 , 1 , 1 )	 	
	AddToPartition(  prisoner1 , 0 )
	DisableQuest( prisoner1 , true )					--關閉對話
	MoveToFlagEnabled(prisoner1 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,prisoner1 )		--將prisoner1寫進隱形物件裡

	local prisoner2 = CreateObjByFlag( 115329,780617,2,1 )
	AddToPartition(  prisoner2 , 0 )
	DisableQuest( prisoner2 , true )					--關閉對話
	MoveToFlagEnabled(prisoner2 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,prisoner2)		--將prisoner2寫進隱形物件裡

	local prisoner3 = CreateObjByFlag( 115330,780617,3 ,1)
	AddToPartition(  prisoner3 , 0 )
	DisableQuest( prisoner3 , true )					--關閉對話
	MoveToFlagEnabled(prisoner3 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,prisoner3 )		--將prisoner3寫進隱形物件裡

	local prisoner4 =CreateObjByFlag( 115331,780617,4,1)	
	AddToPartition(  prisoner4 , 0 )
	DisableQuest( prisoner4, true )						--關閉對話
	MoveToFlagEnabled(prisoner4 , false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4,prisoner4)		--將prisoner4寫進隱形物件裡	

	SetPlot( OwnerID(), "range","LuaS_423263_1", 250 )
end


function LuaS_423263_1()
	if	CheckAcceptQuest( OwnerID() , 423263 ) == true		then
		if	CheckFlag( OwnerID() , 543991 ) == false	then
			SetFlag(OwnerID(), 543991, 1)
		end
		if	ReadRoleValue(TargetID(),EM_RoleValue_Register+9 ) < 1	then
			BeginPlot( TargetID() , "LuaS_423263_2" , 0 )
			WriteRoleValue ( TargetID() , EM_RoleValue_Register+9 , 1 )
		end
	end
end


function LuaS_423263_2()	
	local prisoner4=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) 
	Yell( prisoner4 , "[SC_423263_1]" , 3 )			--115331天啊…你們聽…被妖龍撕裂的
	sleep(20)
	local prisoner1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	Yell( prisoner1 , "[SC_423263_2]" , 3 )			--115328是怎麼啦？哪來這麼多不怕死
	sleep(20)
	local prisoner2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	Yell( prisoner2 , "[SC_423263_3]" , 3 )			--115329呵呵…幸會呀…各位加入「不
	sleep(20)
	local prisoner3=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	Yell( prisoner3 , "[SC_423263_4]" , 3 )			--115330如果他們能突破那些打不倒的
	sleep(20)
	Yell( prisoner1 , "[SC_423263_5]" , 3 )			--115328別做徒勞無功的掙扎…沒有用
	sleep(20)
	Yell( prisoner4 , "[SC_423263_6]" , 3 )			--115331不…不要說這種話…可以平安				
	sleep(20)
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )		
end

function LuaS_115333_0() 
	DisableQuest(OwnerID(), true )						--關閉對話
end



function LuaS_115381_0() --任務423264卡雅村民115381初始劇情，種出115378、115379、115380(client)
	local P1= CreateObjByFlag(115378, 780619, 1 , 1 )	 	
	AddToPartition(  P1, 0 )
	DisableQuest(P1, true )						--關閉對話
	MoveToFlagEnabled(P1, false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1, P1)	--將P1寫進卡雅村民裡



local P2 = CreateObjByFlag(115379, 780619, 2 , 1 )	 	
	AddToPartition(  P2, 0 )
	DisableQuest(P2, true )						--關閉對話
	MoveToFlagEnabled(P2, false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2, P2)	--將P2寫進卡雅村民裡

local P3 = CreateObjByFlag(115380, 780619, 3 , 1 )	 	
	AddToPartition(  P3, 0 )
	DisableQuest(P3, true )						--關閉對話
	MoveToFlagEnabled(P3, false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, P3)	--將P3寫進卡雅村民裡
end

--423264逃脫的希望--接受任務後
function LuaS_423264_0()
	local prisoner1=ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) 
		Yell( prisoner1 , "[SC_423264_1]" , 3 )			--該死的你，為什麼要提到艾娜莉亞！ 
		sleep(20)

	local prisoner3=ReadRoleValue( OwnerID(),  EM_RoleValue_Register+3 ) 
		Yell( prisoner3 , "[SC_423264_2]" , 3 )			--不！別再說了，她一定會聽到，別說
		sleep(20)

	local prisoner2=ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) 
		Yell( prisoner2 , "[SC_423264_3]" , 3 )			--哈哈～有差別嗎？…在這座煉獄裡都
		sleep(20)
		Yell( prisoner2 , "[SC_423264_4]" , 3 )			--哈哈～不管是那群搞不清楚狀況的擅		
	return true
	--	end
	--end
end

function LuaS_115377_0()	--村民115377種出湯尼、伊崔妮、雷安卡獸人(client)
	local Ta = CreateObjByFlag(115334, 780620 , 1 , 1 )	 	
	AddToPartition(  Ta, 0 )
	DisableQuest(Ta, true )							--關閉對話
	MoveToFlagEnabled(Ta, false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2, Ta)	--將Ta寫進湯尼裡

	local Itr = CreateObjByFlag(115335, 780620, 2 , 1 )	 	
	AddToPartition(  Itr, 0 )
	DisableQuest(Itr, true )							--關閉對話
	MoveToFlagEnabled(Itr, false )						--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, Itr)	--將Itr寫進湯尼裡
	
	local P1= CreateObjByFlag(115336, 780620, 3 , 1 )	 	
	AddToPartition(  P1, 0 )
	DisableQuest(P1, true )							--關閉對話
	MoveToFlagEnabled(P1, false )					--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1, P1)	--將P1寫進湯尼裡
end




--423265 艾娜莉亞之名	--旗子780618
function LuaS_423265()	
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() ,423265 ) == true	and	(CheckFlag( OwnerID(), 543993)==false)	then 
			AddSpeakOption( OwnerID(), TargetID( ), "[SC_423265_0]" , "LuaS_423265_1", 0 )	--艾娜
	end
end

function LuaS_423265_1()
	SetSpeakDetail(OwnerID(),"[SC_423265_1]")					
	if (ReadRoleValue( TargetID() , EM_RoleValue_Register+9 )  == 0)	 then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423265_2]","LuaS_423265_99",0) --你說艾娜莉
		else
			AddSpeakOption(OwnerID(),TargetID(),"[SC_423265_2]","LuaS_423265_2",0)	 --你說艾娜莉
	end	
end

function LuaS_423265_2()--不可演

	SetSpeakDetail(OwnerID(),"[SC_423265_3]")		--(被囚禁的卡雅村居民蒼白的臉龐充滿驚懼，害
end

function LuaS_423265_99()--可演
						--OwnerID--玩家--TargetID--村民
	WriteRoleValue( TargetID() , EM_RoleValue_Register+9 , 2 )
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423265_3" , 0 )
end

function LuaS_423265_3()
	--OwnerID村民--TargetID玩家
	local WAA = Lua_DW_CreateObj("flag",115382, 780618,1 )
	DisableQuest(WAA , true )						--關閉對話
	MoveToFlagEnabled(WAA , false )
	WriteRoleValue(WAA , EM_RoleValue_IsWalk, 1 )   

	local WA1 = Lua_DW_CreateObj("flag",115383, 780618,2 )
	DisableQuest(WA1 , true )						--關閉對話
	MoveToFlagEnabled(WA1 , false )
	WriteRoleValue(WA1 , EM_RoleValue_IsWalk, 1 ) 
  
	local WA2 = Lua_DW_CreateObj("flag",115383, 780618,3 )
	DisableQuest(WA2 , true )						--關閉對話
	MoveToFlagEnabled(WA2 , false )
	WriteRoleValue(WA2 , EM_RoleValue_IsWalk, 1 )   

	local prisoner1=ReadRoleValue( OwnerID(), EM_RoleValue_Register+1 ) 
	Yell( prisoner1, "[SC_423265_4]" , 3 )					--<白頻>有人來了～不妙！是精銳護
	sleep(20)
	Tell(TargetID(),OwnerID(),"[SC_423265_5]")				--<悄悄話>你們先躲好，快！無論
	Setposbyflag(TargetID() , 780618, 7 ) 					 --傳送玩家

	AddBuff( TargetID()  , 506744, 1 , 120 )				--給玩家BUFF(躲在牢籠後) 
	AddBuff( TargetID()  , 503977 , 1 , 60 )					--給玩家BUFF (乖乖看戲)
									--玩家看到牢籠後的湯尼、伊崔妮
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	

	BeginPlot(WA1   , "LuaS_423265_4" , 0 )					--走到旗子6
	BeginPlot(WA2   , "LuaS_423265_5" , 0 )					--走到旗子5
	LuaFunc_MoveToFlag( WAA, 780618,4,0)					--走向
	sleep(10)

	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	
	
	BeginPlot(WA1   , "LuaS_423265_6" , 0 )					--走到旗子10
	BeginPlot(WA2   , "LuaS_423265_7" , 0 )					--走到旗子9
	LuaFunc_MoveToFlag( WAA, 780618,8,0)					--隊長走到牢籠前
	sleep(10)

	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end	

	AdjustFaceDir(WA1   ,OwnerID(),0 )
	AdjustFaceDir(WA2   ,OwnerID(),0 )
	sleep(30)
	Yell(WAA, "[SC_423265_6]" , 3 )						--隊長<白頻>讓我看看，這次輪到哪個
	sleep(20)
	AdjustFaceDir(WAA ,OwnerID(),0 )
	PlayMotion(WAA , ruFUSION_ACTORSTATE_EMOTE_POINT)			--<指著被囚禁的卡雅村居民>
	Yell(WAA, "[SC_423265_7]" , 3 )						--隊長<白頻>之前慘叫的那個是你
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end

	sleep(10)
	local Ta =ReadRoleValue( OwnerID(), EM_RoleValue_Register+2 ) 
	Yell(Ta, "[SC_423265_8]" , 3 )						--<白頻>不！
	sleep(10)
	Yell(WAA, "[SC_423265_9]" , 3 )						--隊長<白頻>嗯？
	sleep(20)
	Tell(TargetID(),OwnerID(),"[SC_423265_10]")					--<悄悄話>別出聲，惹上他會引來執政官注
	
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	sleep(30)
	Yell(WAA, "[SC_423265_11]" , 3 )						--隊長<白頻>好了，快爬出來，算你運氣不
	sleep(20)
	Yell( prisoner1 , "[SC_423265_12]" , 3 )					--<白頻>是啊～全屍，然後屍體再被那個女
	sleep(30)

	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	ScriptMessage(  TargetID(), TargetID(), 2 , "[SC_423265_13]" , 0 ) 			--(護衛隊長緊張看了左右兩側，像在檢查
	ScriptMessage(  TargetID(), TargetID(), 0 , "[SC_423265_13]" , 0 ) 	
	Sleep(20)
	Yell(WAA, "[SC_423265_14]" , 3 )						--隊長<白頻>敢對艾娜莉亞大人有意見？
	Sleep(20)
	Yell(WAA, "[SC_423265_15]" , 3 )						--哼！不過是個小矮子，一起送去競技場！
	Sleep(20)

	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	BeginPlot(WA1   , "LuaS_423265_8" , 0 )					--走到旗子12
	BeginPlot(WA2   , "LuaS_423265_9" , 0 )					--走到旗子11
	Sleep(20)
	local prisonerQ1 = Lua_DW_CreateObj("flag",115385, 780618,11 )
	MoveToFlagEnabled(prisonerQ1, false )
	WriteRoleValue(prisonerQ1, EM_RoleValue_IsWalk, 1 )
	Local prisonerQ2= Lua_DW_CreateObj("flag",115386, 780618,12 )
	MoveToFlagEnabled(prisonerQ2, false )
	WriteRoleValue(prisonerQ2, EM_RoleValue_IsWalk, 1 )
	Sleep(30)

	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end
	SetFlag( TargetID() , 543992, 1 )						--給旗標，client 看不見牢籠內的囚犯1、4
	DelObj(prisonerQ1 )
	DelObj(prisonerQ2)
	Sleep(20)		
	Yell(WAA, "[SC_423265_16]" , 3 )						--今天的劇碼就叫做：愚蠢小螻蟻妄想挑戰大鬥士，哈哈哈～
	Sleep(20)		
	--插入檢查
	if	CheckID( TargetID() )== false	 or (CheckAcceptQuest(TargetID(),423265)==false) 	then	--TargetID() 是玩家
		DelObj(WAA )	--刪除演戲隊長
		DelObj(WA1 )	--刪除演戲護衛1
		DelObj(WA2)	--刪除演戲護衛2
		CancelBuff( TargetID()  , 506744) 
		CancelBuff( TargetID()  , 503977 ) 
		Setposbyflag(TargetID() , 780621, 11 ) 					 --送回玩家
		WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		return
	end						
	LuaFunc_MoveToFlag( WAA,780618,13,0)					--<隊長、護衛帶著囚犯1、4離去>
	BeginPlot(WA1   , "LuaS_423265_10" , 0 )					--走到旗子14
	BeginPlot(WA2   , "LuaS_423265_11" , 0 )					--走到旗子15
		if	(CheckFlag( TargetID(), 543993)==false)		then
			SetFlag( TargetID() , 543993, 1 )
		end	
	DelObj(WAA )
	Setposbyflag(TargetID() , 780621, 11 ) 					 --傳送玩家
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+9 , 0 )
		if	CheckBuff( TargetID() , 506744) == true 	then
			CancelBuff( TargetID() , 506744)
		end
		if	CheckBuff( TargetID() , 503977) == true 	then
			CancelBuff( TargetID() , 503977)
		end
End

function LuaS_423265_4()
		LuaFunc_MoveToFlag( OwnerID(),780618,6,0)
end

function LuaS_423265_5()
		LuaFunc_MoveToFlag( OwnerID(),780618,5,0)
end

function LuaS_423265_6()
		LuaFunc_MoveToFlag( OwnerID(),780618,10,0)
end

function LuaS_423265_7()
		LuaFunc_MoveToFlag( OwnerID(),780618,9,0)
end

function LuaS_423265_8()
		LuaFunc_MoveToFlag( OwnerID(),780618,12,0)
end

function LuaS_423265_9()
		LuaFunc_MoveToFlag( OwnerID(),780618,11,0)
end

function LuaS_423265_10()
		sleep(10)
		LuaFunc_MoveToFlag( OwnerID(),780618,14,0)
		DelObj( OwnerID())
end

function LuaS_423265_11()
		sleep(10)
		LuaFunc_MoveToFlag( OwnerID(),780618,15,0)
		DelObj( OwnerID())
end

--423266不可饒恕！
function LuaS_423266_99()	--接任務後演戲，佔用115411的Register+6、+7		
	AddBuff( TargetID()  , 506745, 1 , 50 )					--OwnerID湯尼
	if	ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) > 0 then	--設定成場上有NPC就不種
			return
		end	
	WriteRoleValue( OwnerID() , EM_RoleValue_Register+3, 1)	
	local TA = Lua_DW_CreateObj("flag",115156, 780621,11 )			--115156客串的
	DisableQuest(TA , true )						--關閉對話
	MoveToFlagEnabled(TA, false )
	WriteRoleValue(TA, EM_RoleValue_IsWalk, 0 )
	Hide( TA )
	Show( TA ,0 )
	local Itry = Lua_DW_CreateObj("flag",115520, 780621,12 )	
	DisableQuest(Itry , true )						--關閉對話
	WriteRoleValue(Itry, EM_RoleValue_IsWalk, 0 )
	MoveToFlagEnabled(Itry, false )
	Hide( Itry  )
	Show( Itry ,0 )
	Yell(Itry, "[SC_423266_0]" , 3 )						--陛下！
	LuaFunc_MoveToFlag(TA , 780621,1,0)
	BeginPlot( TA , "LuaS_423266_100" , 0 )
	Yell(Itry, "[SC_423266_1]" , 3 )						--追上去！快！
	LuaFunc_MoveToFlag(Itry, 780621,1,0)
	Sleep(10)
	DelObj(Itry )
	SetFlag(TargetID(), 544007, 1)
	If	CheckBuff(TargetID() , 506745) == true then
		CancelBuff_NoEvent(TargetID() , 506745)
	end
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3, 0)	
end


function LuaS_423266_100()
	LuaFunc_MoveToFlag(OwnerID(), 780621,2,0)
	DelObj(OwnerID())
end

--function LuaS_423266_99()
--	LuaFunc_MoveToFlag(OwnerID(), 780621,1,0)
--end
------玩家會在王座區門口看見湯尼、伊崔妮
--function LuaS_423266_0()	--點擊湯尼，佔用115411的Register+8
--	LoadQuestOption( OwnerID() )
--	if	CheckAcceptQuest(OwnerID(), 423266) == true and CheckFlag(OwnerID(),544008) ==false	then  
--		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_2]","LuaS_423266_1",0)	--陛下？	
--	end
--end

function LuaS_423266_1()
	SetSpeakDetail(OwnerID(),"[SC_423266_3]")				--來不及！那兩個人已經被當成鬥士送進去了…
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register+2 ) == 0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_4]","LuaS_423266_3",0)	 --好！
	else
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423266_4]","LuaS_423266_2",0)	--好！	
	end
end

function LuaS_423266_2()
	SetSpeakDetail(OwnerID(),"[SC_423266_18]")				--我欣賞你的乾脆俐落，
end

function LuaS_423266_3()
	WriteRoleValue( TargetID() , EM_RoleValue_Register+2 , 2 )		--TargetID是湯尼
	closespeak(OwnerID())
	BeginPlot(TargetID()  , "LuaS_423266_7" , 0 )

end

function LuaS_423266_7()
	local Player = SearchRangePlayer(TargetID(), 225)			--給BUFF
		for i=0,table.getn(Player)-1 do
--			say(Player[i],"88888")		
			if	CheckAcceptQuest( Player[i], 423266) == true 	then  
				AddBuff( Player[i], 506742, 1 , 90 )						--給玩家BUFF （可見演戲的、看不見原本的）
			end
		end
									--TargetID是玩家、OwnerID湯尼
	local TA = Lua_DW_CreateObj("flag",115417, 780621,13 )			
	DisableQuest(TA , true )						--關閉對話
	MoveToFlagEnabled(TA, false )
	WriteRoleValue(TA, EM_RoleValue_IsWalk, 1 )
	
	local Itry = Lua_DW_CreateObj("flag",115418, 780621,14 )	
	DisableQuest(Itry , true )						--關閉對話		
	MoveToFlagEnabled(Itry, false )
	WriteRoleValue(Itry, EM_RoleValue_IsWalk, 1 )

	local WAA = Lua_DW_CreateObj("flag",115419, 780621,15 )	
	DisableQuest(WAA , true )						--關閉對話
	MoveToFlagEnabled(WAA, false )
	WriteRoleValue(WAA, EM_RoleValue_IsWalk, 0 )
	Yell(TA, "[SC_423266_19]" , 3 )						--很好，不管如何
	BeginPlot(TA , "LuaS_423266_4", 0 )
	Sleep(20)
	Yell(Itry, "[SC_423266_5]" , 3 )						--陛下，屬下仍是覺得不妥。
	BeginPlot(Itry , "LuaS_423266_8", 0 )
	Sleep(10)
	Yell(TA, "[SC_423266_6]" , 3 )						--不會有問題，我們可以從他口中問出更多
	Sleep(80)
	AdjustFaceDir(TA, WAA ,0 )
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)			--<湯尼指著隊長>
	Sleep(10)
	Yell(TA, "[SC_423266_7]" , 3 )						--束手就擒，罔顧性命的狂徒！
	Sleep(15)
	AdjustFaceDir(WAA , TA,0 )
	Yell(WAA, "[SC_423266_8]" , 3 )						--擅闖者？哈～自不量力！
	sleep(10)
	LuaFunc_MoveToFlag(WAA, 780621,17,0)

	local Drek = Lua_DW_CreateObj("flag",115414, 780621,3 )				--<萊慕將軍出現>
	DisableQuest(Drek , true )	
	MoveToFlagEnabled(Drek, false )
	WriteRoleValue(Drek, EM_RoleValue_IsWalk, 1 )

	PlayMotion(WAA, ruFUSION_ACTORSTATE_ATTACK_1H)			--<隊長作勢攻擊湯尼>
	BeginPlot(Drek , "LuaS_423266_9", 0 )
	Sleep(30)

	AdjustFaceDir(Drek , TA,0 )
	Yell(Drek, "[SC_423266_9]" , 3 )						--我尊敬的陛下，您又把自己置於險地， 
	Sleep(10)
	AdjustFaceDir(WAA, Drek ,0 )
	Sleep(10)
	AdjustFaceDir(TA, Drek ,0 )
	Sleep(10)
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)			--<湯尼指著德銳克>
	Yell(TA, "[SC_423266_10]" , 3 )						--又是你！
	Sleep(20)
	Yell(Drek, "[SC_423266_11]" , 3 )						--您這條命可是我的，要好好珍惜所剩不多的
	Sleep(20)
	BeginPlot(WAA , "LuaS_423266_5", 0 )					--隊長準備逃跑
	Yell(TA, "[SC_423266_12]" , 3 )						--胡說！這次你逃不掉了！
	Sleep(20)
	AdjustFaceDir(TA, WAA ,0 )
	Yell(TA, "[SC_423266_20]" , 3 )						--狂徒！別想全身而退！
										--笑的動作
	Sleep(20)
	Yell(Drek, "[SC_423266_13]" , 3 )						--就憑您這點微弱力量？若沒有眾人保
	Sleep(20)
	local NIGHT = Lua_DW_CreateObj("flag",115415, 780621,6 )			--<夜梟出現>
	DisableQuest(NIGHT , true )		
	MoveToFlagEnabled(NIGHT, false )	
	WriteRoleValue(NIGHT, EM_RoleValue_IsWalk, 1 )

	local STAR = Lua_DW_CreateObj("flag",115416, 780621,7 )			--<晨星出現>
	DisableQuest(STAR , true )	
	MoveToFlagEnabled(STAR, false )
	WriteRoleValue(STAR, EM_RoleValue_IsWalk, 1)
			
	sleep(10)
	DelObj(NIGHT )										

	local ANT = Lua_DW_CreateObj("flag",115234, 780621,8 )				--<安特克羅出現>
	DisableQuest(ANT , true )
	MoveToFlagEnabled(ANT , false )
	WriteRoleValue(ANT , EM_RoleValue_IsWalk, 1)
	
	BeginPlot(Drek , "LuaS_423266_10", 0 )

	local NIGHT2 = Lua_DW_CreateObj("flag",115415, 780621,9 )			--<夜梟出現>	
	DisableQuest(NIGHT2 , true )		
	MoveToFlagEnabled(NIGHT2 , false )	
	WriteRoleValue(NIGHT2 , EM_RoleValue_IsWalk, 1 )
	AdjustFaceDir(NIGHT2 , Drek ,0 )

--	LuaFunc_MoveToFlag(NIGHT , 780621,9,0)					--<夜梟擋湯尼、萊慕之間，安特做防護罩給湯尼>

	Yell(STAR, "[SC_423266_14]" , 3 )						--呵～他這次沒說錯，你的確又把自
	Sleep(20)
	Yell(Drek, "[SC_423266_15]" , 3 )						--又是你們？嘖嘖，人王小鬼身處漂亮王
	Sleep(20)
	Yell(Drek, "[SC_423266_16]" , 3 )						--高貴的陛下，您這條小命我就先寄
	WriteRoleValue(Drek, EM_RoleValue_IsWalk, 0)
	Sleep(20)
	BeginPlot(Drek , "LuaS_423266_11", 0 )
	
	AdjustFaceDir(TA, Drek ,0 )
	PlayMotion(TA, ruFUSION_ACTORSTATE_EMOTE_POINT)
	Yell(TA, "[SC_423266_17]" , 3 )						--站住！不准跑！
	Sleep(10)
	Yell(ANT , "[SC_423266_21]" , 3 )						--你們留下，我去追蹤。
	BeginPlot(ANT , "LuaS_423266_6", 0 )
	DelObj(NIGHT2 )
	DelObj(STAR)
	DelObj(TA)
	DelObj(Itry)
	DelObj(Drek)
	local Player = SearchRangePlayer(TargetID(), 225)			--給旗標
	for i=0,table.getn(Player)-1 do
--		say(Player[i],"77777")
		if	CheckAcceptQuest( Player[i], 423266) == true and CheckFlag( Player[i], 544008 ) ==false	and	CheckBuff( Player[i], 506742) == true	then  
			SetFlag(Player[i], 544008 , 1)
		end
	sleep(10)
		If	CheckBuff( Player[i], 506742) == true	then
			CancelBuff_NoEvent( Player[i], 506742)
		end
	end
	WriteRoleValue(OwnerID() , EM_RoleValue_Register+2, 0 )
End

function LuaS_423266_4()
	LuaFunc_MoveToFlag(OwnerID(), 780621,4,0)					--<湯尼往護衛隊長方向走>
end

function LuaS_423266_5()
	LuaFunc_MoveToFlag(OwnerID(), 780621,5,0)					--<隊長趁機逃跑到地下室>
	DelObj(OwnerID())
end
	
function LuaS_423266_6()
	LuaFunc_MoveToFlag(OwnerID(), 780621,10,0)					--<安特離開>
	sleep(70)
	DelObj(OwnerID())
end

function LuaS_423266_8()
	LuaFunc_MoveToFlag(OwnerID(), 780621,16,0)
end

function LuaS_423266_9()
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_ATTACK_2H)
end

function LuaS_423266_10()
	sleep(10)
	PlayMotion(OwnerID(), ruFUSION_ACTORSTATE_ATTACK_1H)			--<萊慕作勢攻擊湯尼>
end

function LuaS_423266_11()
	LuaFunc_MoveToFlag(OwnerID(), 780621,10,0)
end




