
function LuaS_Anter99999999_0()
	AddBuff( OwnerID(),  505463 , 0 , -1 )
	AddBuff( OwnerID(),  505453 , 0 , -1 )		--特效放大3
end

function LuaS_Anter99999999_1()
	AddBuff( OwnerID() ,  505462, 0 , -1 )
	AddBuff( OwnerID() ,  505453 , 0 , -1 )		--特效放大3
end


function LuaS_Anter99999999_2()
	AddBuff( OwnerID() , 505471  , 0 , -1 )
	AddBuff( OwnerID() , 505454  , 0 , -1 )		--特效放大3
end

function LuaS_Anter99999999_3()
	AddBuff( OwnerID() ,  505464  , 0 , -1 )
	AddBuff( OwnerID() ,  505454  , 0 , -1 )	--特效放大3
end


--所需編號：
function LuaS_422867_0()  --檢查點物品				
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  ~= 0	then		--target 焰靈紋刻
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422867_5]" , 0 )	 --目標正在忙碌中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422867_5]" , 0 ) 
		return true 
	end
	
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0	and
		(CheckAcceptQuest(OwnerID(),422867)== true ) and 	
		(CheckFlag( OwnerID(), 543478 )==true)			then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422867_4]" , 0 )	--過去的歡樂記憶彷彿還殘存眼前～
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422867_4]" , 0 ) 
		return true 
	end
	if	ReadRoleValue( TargetID() , EM_RoleValue_Register )  == 0	and		----TargetID是紋刻
		(CheckAcceptQuest(OwnerID(),422867)== true ) 		 	and
		(CheckFlag( OwnerID(), 543478 )==false)			then	
		beginplot( TargetID() , "LuaS_422867_1" , 0 )
		return true 
	end
end

function LuaS_422867_1()  --成功點擊後
										--TargetID是玩家						
	writerolevalue( OwnerID() , EM_RoleValue_Register , 1 )				--紋刻寫入Register，阻止別人再叫	--TargetID是玩家
	--local Player = {}
	local BodoA = {}
	local BodoB = {}
	for i=1,3,1 do
		BodoA[i] = CreateObjByFlag( 114068 , 780451 , i , 0 ) 			--3隻征戰者
		AddToPartition( BodoA[i] , 0 )
		MoveToFlagEnabled( BodoA[i] , false )
		WriteRoleValue( BodoA[i] , EM_RoleValue_Register+1 , i+3 )
	end
	for j=1,3,1 do
		BodoB[j] = CreateObjByFlag( 114067 , 780452 , j , 0 ) 			--3隻平民
		AddToPartition( BodoB[j] , 0 )
		MoveToFlagEnabled( BodoB[j] , false )
		WriteRoleValue( BodoB[j] , EM_RoleValue_Register+1 , j+3 )
	end
	
	local Sa = CreateObjByFlag( 114069 , 780480 , 1 , 0 )  				--薩滿 <不動、當基準>
	AddToPartition( Sa , 0 )
	DisableQuest( Sa , true )		--關閉對話
	MoveToFlagEnabled(Sa , false )	--關閉巡邏
	
	local Wood = CreateObjByFlag( 114066 , 780480 , 3 , 0 )  				--木材堆 
	Lua_ObjDontTouch( Wood ) 
	AddToPartition( Wood , 0 )

	local Ball	  = CreateObjByFlag( 114073 , 780480 , 3 , 0 )  				--隱形球	
	Lua_ObjDontTouch( Ball ) 		
	AddToPartition( Ball , 0 )

	sleep(20)
	local An = CreateObjByFlag( 113731, 780480 , 2 , 0 )  				--安特克羅
	AddToPartition( An , 0 )
	DisableQuest( An , true )		--關閉對話
	MoveToFlagEnabled(An , false )	--關閉巡邏

	sleep(10)
	yell( BodoA[1] , "[SC_422867_0]",2 ) 						 --  好精靈！
	PlayMotion( BodoA[1] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoA[2] , "[SC_422867_0]",2 )    
	PlayMotion( BodoA[2] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoA[3] , "[SC_422867_0]",2 )    
	PlayMotion( BodoA[3] , ruFUSION_ACTORSTATE_CAST_BEGIN)	     	   	
	sleep(10)
	yell( BodoB[1] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[1] , ruFUSION_ACTORSTATE_CAST_SP01)	
	yell( BodoB[2] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[2] , ruFUSION_ACTORSTATE_CAST_SP01)	
	yell( BodoB[3] , "[SC_422867_1]",2 )     					 --  好精靈～
	PlayMotion( BodoB[3] , ruFUSION_ACTORSTATE_CAST_SP01)   	       	
	sleep(10)
	PlayMotion( BodoB[1] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoB[2] , "[SC_422867_1]",2 )   
	PlayMotion( BodoB[2] , ruFUSION_ACTORSTATE_CAST_BEGIN)	
	yell( BodoB[3] , "[SC_422867_1]",2 )     
	PlayMotion( BodoB[3] , ruFUSION_ACTORSTATE_CAST_BEGIN)

	for i = 1, 3 , 1 do
		WriteRoleValue( BodoA[i] , EM_RoleValue_Register , 0 )
		beginplot( BodoA[i] , "LuaS_422867_2" , 0 )
	end

	for j = 1, 3 , 1 do
		WriteRoleValue( BodoB[j] , EM_RoleValue_Register , 0 )
		beginplot( BodoB[j] , "LuaS_422867_3" , 0 )
	end

	LuaFunc_MoveToFlag( An , 780480 , 4 ,  0 )						--安走進
	
	if	CheckID( TargetID() )== false		then					--確認TargetID() 是不是玩家
		DelObj( BodoA[1] )
		DelObj( BodoA[2] )
		DelObj( BodoA[3] )
		DelObj( BodoB[1] )
		DelObj( BodoB[2] )
		DelObj( BodoB[3] )
		DelObj( Sa )
		DelObj( An )
		DelObj( Wood )
		DelObj( Ball )
		writerolevalue( OwnerID() , EM_RoleValue_PID , 0 )
	end
	PlayMotionEX(An   ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	--安動作

	AddBuff( Wood ,  505471 , 0 , -1 )--BUFF 木材堆燃火
	AddBuff( Ball ,  505488 , 0 , -1 )--
	AddBuff( Ball ,  505454 , 0 , -1 )--放大4倍

	sleep(10)
	yell( BodoA[1] , "[SC_422867_2]",2 )  					--哇！
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_CAST_SP01)			
	yell( BodoA[2] , "[SC_422867_2]",2 )   	
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_CAST_SP01)
	yell( BodoA[3] , "[SC_422867_2]",2 )   	
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_CAST_SP01)
	
	sleep(15)	
	yell( BodoB[1] , "[SC_422867_3]",2 )   				--哇！	
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	yell( BodoB[2] , "[SC_422867_3]",2 )   	
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)			
	yell( BodoB[3] , "[SC_422867_3]",2 )   --好精靈～好精靈～
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE1)
	sleep(25)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
--	PlayMotion( An , ruFUSION_ACTORSTATE_EMOTE_LAUGH)
	--波多A、B做出跳舞動作
	PlayMotion(An,ruFUSION_ACTORSTATE_CAST_END)	
	sleep(30)
	PlayMotion( BodoA[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoA[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[3]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[2]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion( BodoB[1]  , ruFUSION_ACTORSTATE_EMOTE_IDLE2)
	PlayMotion(  An   ,  ruFUSION_ACTORSTATE_EMOTE_APPLAUSE )

	for i = 1, 3 , 1 do
		WriteRoleValue(BodoA[i] , EM_RoleValue_Register , 1 )
		beginplot(BodoA[i]  , "LuaS_422867_2" , 0 )
	end
	for j = 1, 3 , 1 do
		WriteRoleValue( BodoB[j]  , EM_RoleValue_Register , 1 )
		beginplot( BodoB[j]  , "LuaS_422867_3" , 0 )
	end
	
	DelObj( Sa )
	DelObj( An )
	DelObj( Wood )
	DelObj( Ball )

	--檢查條件給完成任務旗標
	if	CheckAcceptQuest(TargetID(), 422867 ) == true	and	CheckFlag( TargetID() , 543478 ) == false	then   
		SetFlag(TargetID(), 543478 , 1)
	end

	writerolevalue( OwnerID() , EM_RoleValue_Register , 0 )				--把紋刻的值寫回去
end

function LuaS_422867_2()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0	then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		LuaFunc_MoveToFlag(OwnerID(), 780451 , Flag,  0 )
	end
	
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0	then
		DelObj( OwnerID() )
	end
end

function LuaS_422867_3()
	local Flag
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) == 0	then
		Flag = ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 )
		LuaFunc_MoveToFlag(OwnerID(), 780452 , Flag,  0 )
	end
	if ReadRoleValue( OwnerID() , EM_RoleValue_Register ) ~= 0 	then
		DelObj( OwnerID() )
	end
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--422869 彙整意見<對話>

function LuaS_422869_10()  --呃杜征戰者
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_11",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_11()  
	SetSpeakDetail(OwnerID(),"[SC_422869_0]")					--你！就是你拿走[113301]害湖主變成這樣！把[113301]還回來～
	SetFlag( OwnerID() , 543483 , 1 )						--給旗標
end

function LuaS_422869_20()  --銳法狩獵者
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_21",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_21()  
	SetSpeakDetail(OwnerID(),"[SC_422869_1]")					--趁波多還沒攻擊你之前快走吧～
	SetFlag( OwnerID() , 543484 , 1 )						--給旗標
end
	
function LuaS_422869_30()  --嘩追淨化者
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_31",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_31()  
	SetSpeakDetail(OwnerID(),"[SC_422869_2]")					--如果酋長現在回來，他就能帶給我們解決辦法了～「帶來奇蹟的波多」，他從沒讓我們失望過！
	SetFlag( OwnerID() , 543485 , 1 )						--給旗標
end

function LuaS_422869_40()  --嘩追薩滿
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_41",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_41()  
	SetSpeakDetail(OwnerID(),"[SC_422869_3]")					--[113288]薩滿很辛苦，酋長不在都是他照顧大家～連這次的災難都要他費心，我能幫上什麼忙？
	SetFlag( OwnerID() , 543479 , 1 )						--給旗標
end

function LuaS_422869_50()  --銳法薩滿
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_51",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_51()  
	SetSpeakDetail(OwnerID(),"[SC_422869_4]")					--是蒙面人吧？他們看見我們一步一步消除災難，於是又再一次下手…
	SetFlag( OwnerID() , 543480 , 1 )						--給旗標
end

function LuaS_422869_60()  --嚕贊征戰者
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_61",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_61()  
	SetSpeakDetail(OwnerID(),"[SC_422869_5]")					--神靈生氣了！所以神靈不說話了！！
	SetFlag( OwnerID() , 543486 , 1 )						--給旗標
end


function LuaS_422869_70()  --呃杜薩滿
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_71",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_71()  
	SetSpeakDetail(OwnerID(),"[SC_422869_6]")					--強行打開[ZONE_THE GREAT BARRIER]…根本就是個錯誤。
	SetFlag( OwnerID() , 543481 , 1 )						--給旗標
end

function LuaS_422869_80()  --嚕贊薩滿
	LoadQuestOption(OwnerID())
	if (CheckAcceptQuest(OwnerID(),422869)== true )and( CheckCompleteQuest( OwnerID(),422869)== false) 	then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422869_8]","LuaS_422869_81",0) 	--你對這次神靈混亂有什麼意見？
	end
end

function LuaS_422869_81()  
	SetSpeakDetail(OwnerID(),"[SC_422869_7]")					--聽說以前是靠很多材料把[ZONE_THE GREAT BARRIER]封起來
	
	SetFlag( OwnerID() , 543482 , 1 )						--給旗標
end

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--關鍵

function LuaS_114070_0()	--出生劇情--提帕布斯被種到遊戲上時，先種出5隻波多--用CLIENT擋住

	local Bodo1 = CreateObjByFlag( 114179 , 780453 , 1 , 1 )	 	
	AddToPartition(  Bodo1 , 0 )
	DisableQuest( Bodo1 , true )					--關閉對話
	MoveToFlagEnabled(Bodo1 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+1,Bodo1 )	--將波多1號寫進提帕布斯裡

	local Bodo2 = CreateObjByFlag( 114180,780453,2,1 )
	AddToPartition(  Bodo2 , 0 )
	DisableQuest( Bodo2 , true )					--關閉對話
	MoveToFlagEnabled(Bodo2 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+2,Bodo2 )	--將波多2號寫進提帕布斯裡

	local Bodo3 = CreateObjByFlag( 114270,780453,3 ,1)
	AddToPartition(  Bodo3 , 0 )
	DisableQuest( Bodo3 , true )					--關閉對話
	MoveToFlagEnabled(Bodo3 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+3,Bodo3 )	--將波多3號寫進提帕布斯裡

	local Bodo4 =CreateObjByFlag( 114271,780453,4,1)	
	AddToPartition(  Bodo4 , 0 )
	DisableQuest( Bodo4 , true )					--關閉對話
	MoveToFlagEnabled(Bodo4 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+4,Bodo4 )	--將波多4號寫進提帕布斯裡

	local Bodo5 =CreateObjByFlag( 114178,780453,5,1 )	
	AddToPartition(  Bodo5 , 0 )
	DisableQuest( Bodo5 , true )					--關閉對話
	MoveToFlagEnabled(Bodo5 , false )				--關閉巡邏
	WriteRoleValue ( OwnerID() , EM_RoleValue_Register+5,Bodo5 )	--將波多5號寫進提帕布斯裡
end


function LuaS_422870_0()  --之後掛到提帕布斯身上
	LoadQuestOption( OwnerID() )
	if	(CheckAcceptQuest(OwnerID(),422870)== true )and( CheckCompleteQuest( OwnerID(),422870)== false) and 
		ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) == 0 					and
		(CheckFlag( OwnerID(), 543498 )==false)								then
		SetFlag( OwnerID() , 543500  , 0 )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422870_0]","LuaS_422870_98",0) 		--我可以幫忙什麼？
	end
	if	(CheckAcceptQuest(OwnerID(),422870)== true )and( CheckCompleteQuest( OwnerID(),422870)== false)	and
		 ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) ~= 0					and
		(CheckFlag( OwnerID(), 543498 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422870_0]","LuaS_422870_99",0) 	--我可以幫忙什麼？
	end
	
end

function LuaS_422870_99()
	SetSpeakDetail(OwnerID(),"[SC_422869_99]")						--(提帕布斯薩滿似乎在思考從何處開始。)
end

function LuaS_422870_98()
	CloseSpeak( OwnerID() )	
	BeginPlot(TargetID(),"LuaS_422870_1",0)	
end

function LuaS_422870_1()
										--target是玩家
	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 1 )
	say(OwnerID(),"[SC_422870_1]")					--待會你只要…
	local Bodo = CreateObjByFlag( 114020 , 780453 , 10 , 0 )	 		--遠處的波多
	AddToPartition(  Bodo , 0 )
	DisableQuest( Bodo , true )						--關閉對話
	MoveToFlagEnabled(Bodo , false )					--關閉巡邏.
	PlayMotion(  Bodo   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	yell( Bodo , "[SC_422870_2]",2 )   					--是酋長！酋長回來了！
	sleep(20)
	PlayMotion(  Bodo   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	local Bodo1=ReadRoleValue( OwnerID() , EM_RoleValue_Register+1 ) 
	WriteRoleValue(Bodo1, EM_RoleValue_IsWalk, 0 )
	yell( Bodo1 , "[SC_422870_3]",3 ) 					--快…快！快逃…躲好。
	sleep(10)
	local Bodo2=ReadRoleValue( OwnerID() , EM_RoleValue_Register+2 ) 
	WriteRoleValue(Bodo2, EM_RoleValue_IsWalk, 0 )
	yell( Bodo2 , "[SC_422870_4]",2 ) 					--酋長…是、是酋長…
	sleep(20)

	local Bodo3=ReadRoleValue( OwnerID() , EM_RoleValue_Register+3 ) 
	WriteRoleValue(Bodo3, EM_RoleValue_IsWalk, 0 )
	yell( Bodo3 , "[SC_422870_5]",2 )					--別跟酋長視線對上！
	sleep(10)
	local Bodo4=ReadRoleValue( OwnerID() , EM_RoleValue_Register+4 ) 
	WriteRoleValue(Bodo4, EM_RoleValue_IsWalk, 0 )	
	yell( Bodo4 , "[SC_422870_6]",2 )					--對，不要再被他倒吊樹上說是貼近湖主思想了！
	sleep(10)
	local Bodo5=ReadRoleValue( OwnerID() , EM_RoleValue_Register+5 ) 
	WriteRoleValue(Bodo5, EM_RoleValue_IsWalk, 0 )
	yell( Bodo5 , "[SC_422870_7]",2 )					--是酋長！「帶來奇蹟的波多」啊！有希望了！
	sleep(20)

		BeginPlot(Bodo1,"LuaS_422870_2",0)				--轉移4之波多
		BeginPlot(Bodo2,"LuaS_422870_3",0)	
		BeginPlot(Bodo3,"LuaS_422870_4",0)	
		BeginPlot(Bodo4,"LuaS_422870_5",0)	
	
		SetFlag( TargetID() , 543500  , 1 )				--塞旗標543500給玩家，看見另外CLIENT躲好的波多，原本場上4隻隱藏
	
	local HWALIYA = CreateObjByFlag( 114276 , 780453 , 11 , 0 )		--酋長--演戲嘩里雅
	AddToPartition(  HWALIYA , 0 )
	WriteRoleValue(HWALIYA , EM_RoleValue_IsWalk, 1 )
	DisableQuest( HWALIYA , true )					--關閉對話
	MoveToFlagEnabled( HWALIYA, false)
	sleep(30)
	BeginPlot(HWALIYA ,"LuaS_422870_6",0)	
	sleep(30)
	yell( HWALIYA , "[SC_422870_8]",2 )					--提帕布斯。
	sleep(20)
	--提帕布斯動作
	yell( OwnerID() , "[SC_422870_9]",2 )					--感謝湖主讓您還記得回村的路。
	sleep(20)
	yell( HWALIYA , "[SC_422870_10]",2 )				--一陣子不見，你學到人類拐彎的說話方式了，單純的你被藏起來了？
	sleep(20)
	yell( OwnerID() , "[SC_422870_11]",2 )				--只要村裡的波多能保有原始單純就好。
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_PARRY_UNARMED )
	yell( HWALIYA , "[SC_422870_12]",2 )				--晤…好精靈說的沒錯，我的行蹤不定讓所有重責都落到你身上…
	sleep(20)
	yell( OwnerID() , "[SC_422870_13]",2 )				--…酋長？您剛剛說？
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_HURT_CRITICAL )
	yell( HWALIYA , "[SC_422870_14]",2 )				--不，沒什麼～（酋長搖了搖頭）
	sleep(20)
	PlayMotion(  HWALIYA   ,  ruFUSION_ACTORSTATE_BUFF_SP01 )
	yell( HWALIYA , "[SC_422870_15]",2 )				--嘿～大家都愁眉苦臉的做什麼～神靈們剛好能趁機會好好休息不也很好？
	sleep(20)
		if	CheckID( TargetID() )== true	and	(CheckFlag( TargetID(), 543498 )==false)		then
		SetFlag( TargetID() , 543498  , 1 )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	end
	DelObj(Bodo)
	DelObj(HWALIYA)

	while true do
		sleep(10)
		if CheckID(TargetID())==false then			
			writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
			break
		end
	end
end

function LuaS_422870_2()
	LuaFunc_MoveToFlag( OwnerID(),780453,6,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 1)	
end

function LuaS_422870_3()
	LuaFunc_MoveToFlag( OwnerID(),780453,7,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 2)	
end

function LuaS_422870_4()
	LuaFunc_MoveToFlag( OwnerID(),780453,8,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 3 )	
end

function LuaS_422870_5()
	LuaFunc_MoveToFlag( OwnerID(),780453,9,0)
	sleep(10)
	SetPosByFlag( OwnerID()  , 780453 , 4)	
end

function LuaS_422870_6()
	LuaFunc_MoveToFlag( OwnerID(),780453,12,0)
end

-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
--422871 在那遙遠從前～<大型演戲>	旗子：(780454 1-)

function LuaS_422871_0()
	LoadQuestOption( OwnerID() )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	if	(CheckAcceptQuest(OwnerID(),422871)== true )and( CheckCompleteQuest( OwnerID(),422871)== false) and 
		ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) == 0 					and
		(CheckFlag( OwnerID(), 543499 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_0]","LuaS_422871_1",0) 		--有個東西要讓我看？
	end
	if	(CheckAcceptQuest(OwnerID(),422871)== true )and( CheckCompleteQuest( OwnerID(),422871)== false)	and
		 ReadRoleValue( TargetID() , EM_RoleValue_Register+1 ) ~= 0					and
		(CheckFlag( OwnerID(), 543499 )==false)								then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422871_0]","LuaS_422871_99",0) 		--有個東西要讓我看？
	end
end

function LuaS_422871_99()
	SetSpeakDetail(OwnerID(),"[SC_422871_99]")							--對，但我要在提帕布斯行動前先跟他說明一下～
end

function LuaS_422871_1()
												--OwnerID是玩家
	--SetSpeakDetail(OwnerID(),"[SC_422871_1]")							--對，千年前封印之戰的其中一幕，也隱含著後續的關鍵。
	--sleep(30)
 	writerolevalue( TargetID() , EM_RoleValue_Register+1 , 1 )
	BeginPlot( TargetID() , "LuaS_422871_2" , 0 )	
end

function LuaS_422871_2()
	CloseSpeak( TargetID() )									--OwnerID是嘩里雅	
	Addbuff( TargetID() , 505465 , 0 , 90 )		
	local HWA= Lua_DW_CreateObj("flag" ,114171,780454,1 ) 					--種出演戲用嘩里雅，原本的client隱藏
	DisableQuest( HWA , true )									--關閉對話
	MoveToFlagEnabled(HWA , false )								--關閉巡邏

	say(HWA,"[SC_422871_2]")									--跟我來～
	LuaFunc_MoveToFlag( HWA,780454,4,0)							--移動
	say(HWA,"[SC_422871_3]")									--這是戰爭末段封印禁制之壁的時刻～
	LuaFunc_MoveToFlag( HWA,780454,2,0)


 	local Anter = Lua_DW_CreateObj("flag" ,114176,780454,3 ) 			--種出安特克羅
	DisableQuest( Anter , true )		--關閉對話
	MoveToFlagEnabled(Anter , false )	--關閉巡邏

	local Bodo  = Lua_DW_CreateObj("flag" ,114172,780454,5 ) 			--種出波多酋長
	DisableQuest( Bodo , true )		--關閉對話
	MoveToFlagEnabled(Bodo , false )	--關閉巡邏

	local Human  = Lua_DW_CreateObj("flag" ,114175,780454,6 ) 			--種出古人類
	DisableQuest( Human , true )		--關閉對話
	MoveToFlagEnabled(Human , false )	--關閉巡邏

	local ancient1 = Lua_DW_CreateObj("flag" ,114173,780454,7 ) 			--種出古精靈1號
	DisableQuest( ancient1 , true )		--關閉對話
	MoveToFlagEnabled(ancient1 , false )	--關閉巡邏

	local ancient2 = Lua_DW_CreateObj("flag" ,114174,780454,8 ) 			--種出古精靈2號
	DisableQuest( ancient2 , true )		--關閉對話
	MoveToFlagEnabled(ancient2 , false )	--關閉巡邏
	sleep(20)
	PlayMotionEX(Anter,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	PlayMotionEX(ancient1,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	PlayMotionEX(ancient2,ruFUSION_ACTORSTATE_CHANNEL_BEGIN , ruFUSION_ACTORSTATE_CHANNEL_LOOP)
	sleep( 10 )
--插入檢查
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		AddBuff( Anter , 504936 , 0 , 5 )
		AddBuff( Anter , 505179 , 0 , 10 )
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	sleep(10)
	local TTRR= Lua_DW_CreateObj("flag" ,114073,780454,14 ) 			--種出施法用隱形球
	Lua_ObjDontTouch( TTRR )
	
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		CastSpell( ancient1 , TTRR, 494801)
		CastSpell( ancient2 , TTRR, 494801)
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(TTRR)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end
	
	sleep(10)
	local BALL= Lua_DW_CreateObj("flag" ,114073,780454,13 ) 			--種出施法用隱形球
	Lua_ObjDontTouch( BALL)
	DisableQuest( ancient1 , true )		--關閉對話
	MoveToFlagEnabled(ancient1 , false )	--關閉巡邏

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		CastSpell( TTRR, TTRR, 494800)
			
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(TTRR)	--刪除隱形球
		DelObj(BALL)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

						
	sleep(30)
	PlayMotion(ancient1,ruFUSION_ACTORSTATE_CHANNEL_END)
	PlayMotion(ancient2,ruFUSION_ACTORSTATE_CHANNEL_END)
	yell( Bodo ,"[SC_422871_4]",2 )						--波多酋長：時間到了...達馬蓋沒有遵照一開始說的去做…
	PlayMotion(Anter,ruFUSION_ACTORSTATE_CHANNEL_END)			--安放下手
	sleep(20)	
	PlayMotion(Human ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)		--<搖頭>
	yell( Human ,"[SC_422871_5]",2 )						--古人類：看樣子，裡面的戰況是預期中最艱困的情形。
	sleep(20)
	yell( ancient1 , "[SC_422871_7]",2 )
	sleep(20)
	yell( Anter ,"[SC_422871_6]",2 )						--安特克羅：讓我來吧，只要我把畢生的力量都加諸在禁制之壁上。
	sleep(20)

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		AdjustFaceDir( ancient1 , Anter, 0 )
           	    	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_EMOTE_SPEAK)
		yell( ancient1 , "[SC_422871_8]",2 )						--古精靈：精靈王！這樣您會…耗盡自然之力的精靈沒有存活下來的		
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(TTRR)	--刪除隱形球
		DelObj(BALL)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end	      
	AdjustFaceDir( ancient2 , Anter, 0 )
               	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(20)
	PlayMotion(  Anter, ruFUSION_ACTORSTATE_EMOTE_APPROVAL)
	yell( Anter ,  "[SC_422871_9]",2 )						--安特克羅：此時此刻，這是唯一且最快的方式，用我的力量取代自然之石，贏得戰事勝利才能真正獲得平穩。
	sleep(30)
	AdjustFaceDir( Bodo  , Anter, 0 )
	yell( Bodo  ,  "[SC_422871_10]",2 )						--波多酋長：精靈王…
	sleep(20)
	yell( Anter ,"[SC_422871_16]",2 )						--安特克羅：剩下的事交給你們完成了。
	sleep(20)
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	yell( ancient1 ,  "[SC_422871_17]",2 )						--謹遵我王旨意！
	yell( ancient2 ,  "[SC_422871_17]",2 )						--謹遵我王旨意！
	sleep(20)
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CROUCH_END)
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CROUCH_END)
	AdjustFaceDir( ancient1 , TTRR, 0 )
	AdjustFaceDir( ancient2 , TTRR, 0 )
	PlayMotionEX(Anter,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)		--安施法動作

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		AddBuff( Anter , 504936 , 0 , 5 )
		AddBuff( Anter , 505179 , 0 , 5 )
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(TTRR)	--刪除隱形球
		DelObj(BALL)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	PlayMotionEX(ancient1 ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
	PlayMotionEX(ancient2 ,ruFUSION_ACTORSTATE_CAST_BEGIN, ruFUSION_ACTORSTATE_CAST_LOOP)	
	sleep(10)
	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		CastSpell( Anter, BALL, 494799)
		CastSpell( ancient1 , BALL, 494803)
		CastSpell( ancient2 , BALL, 494803)
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(TTRR)	--刪除隱形球
		DelObj(BALL)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end

	sleep(20)
	local EE= Lua_DW_CreateObj("flag" ,114283,780454,13 ) 							--種出結界
	sleep(20)
	PlayMotion(Anter,ruFUSION_ACTORSTATE_CAST_END)							--結束施法
	PlayMotion(ancient1 ,ruFUSION_ACTORSTATE_CAST_END)		
	PlayMotion(ancient2 ,ruFUSION_ACTORSTATE_CAST_END)

	if	CheckID( TargetID() )== true	 and (CheckAcceptQuest(TargetID(),422871)==true) and CheckBuff( TargetID() , 505465 ) == true	then--TargetID() 是玩家
		AddBuff( Anter , 505486, 0 , 5 )
	else
		DelObj(HWA)	--刪除演戲嘩里雅
		DelObj(EE)	--結界
		DelObj(TTRR)	--刪除隱形球
		DelObj(BALL)	--刪除隱形球
		DelObj(Anter)	--刪除安特克羅
		DelObj(Bodo)	--刪除波多酋長
		DelObj(Human)	--刪除古人類
		DelObj(ancient1)	--刪除古精靈1號
		DelObj(ancient2)	--刪除古精靈2號
	  	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
		return
	end
			
	sleep(10)
	SetDefIdleMotion( Anter, ruFUSION_MIME_DEATH_DOWN)						--安倒下
	WriteRoleValue(Bodo, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(Human, EM_RoleValue_IsWalk, 0 )
	WriteRoleValue(ancient1 , EM_RoleValue_IsWalk, 0 )
	sleep(10)
	yell( ancient1 ,  "[SC_422871_13]",2 )									--古精靈：王！ 
	BeginPlot(ancient2,"LuaS_422871_3",0)
	sleep(5)
	LuaFunc_MoveToFlag(  ancient1,780454,10,0)								--精靈1號趨前
	BeginPlot(Bodo,"LuaS_422871_4",0)
	BeginPlot(Human,"LuaS_422871_5",0)
	PlayMotion(ancient1,ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	sleep(20)
	
	if	(CheckAcceptQuest(TargetID(),422871)==true )	and	(CheckFlag( TargetID(), 543499 )==false)	and
		CheckBuff( TargetID() , 505465 ) == true							then
		SetFlag( TargetID() , 543499  , 1 )
		writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	end
	sleep(10)
	DelObj(TTRR)						--刪除隱形球
	DelObj(BALL)						--刪除隱形球
	DelObj(EE)						--刪除結界
	DelObj(Anter)						--刪除安特克羅
	DelObj(Bodo)						--刪除波多酋長
	DelObj(Human)						--刪除古人類
	DelObj(ancient1)						--刪除古精靈1號
	DelObj(ancient2)						--刪除古精靈2號
	writerolevalue( OwnerID() , EM_RoleValue_Register+1 , 0 )
	yell( HWA ,"[SC_422871_15]",2 )	
	LuaFunc_MoveToFlag( HWA ,780454,11,0)
	DelObj(HWA)						--刪除演戲嘩里雅
	CancelBuff_NoEvent( TargetID() , 505465 )		
end

function LuaS_422871_3()
	WriteRoleValue(OwnerID(), EM_RoleValue_IsWalk, 0 )
	LuaFunc_MoveToFlag( OwnerID() ,780454,12,0)
	PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_CROUCH_BEGIN)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--古精靈2號：精靈王！
end

function LuaS_422871_4()
	LuaFunc_MoveToFlag( OwnerID() ,780454,16,0)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--古精靈2號：精靈王！
end

function LuaS_422871_5()
	LuaFunc_MoveToFlag( OwnerID() ,780454,15,0)
	yell( OwnerID() ,  "[SC_422871_14]",2 )	--古精靈2號：精靈王！
end

function LuaI_422871_6() --放棄任務時刪除BUFF			
	
	if (CheckAcceptQuest(OwnerID(),422871)==false)and(CheckCompleteQuest(OwnerID(),422871)==false) then
	
		SetFlag( OwnerID() , 543499  , 0 )
		CancelBuff( OwnerID() , 505465 )
	end
end
