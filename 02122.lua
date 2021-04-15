---------------------------------------------------------------------------------
-----------423624-------範圍劇情
---1.檢察附近玩家是否有接任務423624，有的話給BUFF，開演。
---2.當在演戲的階段，新增一個範圍劇情。請其他玩家在那個地方稍等一下。利用字串！780748
function LuaS_423624()
	SetPlot( OwnerID(),"range","LuaS_423624_1",200)
end

function LuaS_423624_1()
	if	CheckAcceptQuest(OwnerID(),423624)==true  and ReadRoleValue( TargetID() , EM_RoleValue_Register ) == 0 then
		WriteRoleValue( TargetID() , EM_RoleValue_Register , 777 )
		BeginPlot( TargetID() , "LuaS_423624_2" , 0 )
	end
end
---1.種出混世魔王檢察 複數解
---2.給予BUFF 要複數
--3.提醒 SCRIPT MESSAGE 要不要亂數？
----CLIENT 用BUFF 508042  旗標 544591
function LuaS_423624_2()
	SetPlot( OwnerID(),"range","",200)
	local KK = Lua_DW_CreateObj("flag" ,116187,780749,0,0 )---種出一個掌控全部的NPC的魔王。
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition(KK, 0 )
	BeginPlot( KK , "LuaS_423624_4" , 0 )
	local Player = SearchRangePlayer( OwnerID() , 200 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423624 ) == true  and CheckFlag( player[i],544591)==false and CheckBuff( player[i]  ,508042)==false  then
			AddBuff(player[i] ,508042,1,80)
			BeginPlot(  KK , "LuaS_423624_3" , 0 )
		end
	end	
	sleep(10)
---	if 	ReadRoleValue( TargetID() , EM_RoleValue_Register ) > 0 then
--		BeginPlot(  KK , "LuaS_423624_3" , 0 )
--		say(KK,"111111111111111")
--	end
	Callplot( OwnerID(), "LuaS_423624_1_sub",KK)
end
function LuaS_423624_1_sub(KK)
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register ,0) 
					SetPlot( OwnerID(),"range","LuaS_423624_1",200)
			break
		end
	end
end
-----給予沒有參加到的玩家訊息 BUFF約為20秒一次 加入亂數對話
function LuaS_423624_3()
	SetPlot( OwnerID(),"range","LuaS_423624_78",250)
end
function LuaS_423624_78()
	sleep(20)
	local Player = SearchRangePlayer( OwnerID() , 201 )
	for k=1,100,1 do
		sleep(10)
		for i=0,table.getn(Player)-1 do
			if	CheckAcceptQuest( player[i] , 423624 ) == true  and CheckFlag( player[i],544591)==false and  CheckBuff( player[i]  ,508042)==false and CheckBuff( player[i]  ,508043)==false  then
					AddBuff(player[i] ,508043,1,15)
					ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_0]" , 0) --附近傳來奇怪的聲響。		
					ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_0]" , 0) 
					sleep(20)
					local QQ = DW_Rand(100)
					if QQ < 25   then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_1]" , 0) --湯尼：騎士！先暫時在那待著！待會兒，我們就會過去了！		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_1]" , 0) 		
						elseif QQ>=25 and QQ<50 then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_2]" , 0) --康葛斯：唉呀呀～一個人都沒有？孩子，再等等吧！我先到附近繞繞！ 		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_2]" , 0) 
						elseif QQ>=50 and QQ<75 then
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_3]" , 0)--晨星：星光漸弱，我有股不好的預感，卡瑞蘭，請先在那裡等待！ 		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_3]" , 0) 
						else
							ScriptMessage( player[i] , player[i] , 1 , "[SC_423624_4]" , 0)---摩瑞克：先在這待著，與他們會合！這附近的元素有些不穩定，我先過去處理。		
							ScriptMessage( player[i] , player[i] , 0 , "[SC_423624_4]" , 0) 
					end	
			end
		end	
	end
end
------------------------------------------
--將所有玩家 傳送到固定棋子  780749   且幫玩家以及其它NPC 撥放被擊倒的動作  幫玩家扣血 上無敵 綁住玩家。
--當玩家血量低於30趴  扣血1滴   當玩家血量高於50趴 則扣血 10趴  有建議不要扣血  
--編號  艾可：116802 康：116803 湯：116804 摩：116805  吉：116566 勞：116567  拉法挨爾：116569    伊崔妮：116568

function LuaS_423624_4()
---勞勃 和吉兒先隱形
	local Group = {}
	Group = SearchRangePlayer(OwnerID(), 200)
	local STAR = Lua_DW_CreateObj("flag" ,116802,780749,1,1 )
	local CS   = Lua_DW_CreateObj("flag" ,116803,780749,2,1 )
	local TONY = Lua_DW_CreateObj("flag" ,116804,780749,3,1 )
	local MORK = Lua_DW_CreateObj("flag" ,116805,780749,4,1 )
	local GILL = Lua_DW_CreateObj("flag" ,116566,780749,5,0 )
	local LB   = Lua_DW_CreateObj("flag" ,116567,780749,6,0 )
	local LAF  = Lua_DW_CreateObj("flag" ,116569,780749,7,0 )	
	local ETN  = Lua_DW_CreateObj("flag" ,116568,780749,8,0 )
	MoveToFlagEnabled( ETN , false )
	DisableQuest(  STAR , true )
	DisableQuest(  CS , true )
	DisableQuest(  TONY , true )
	DisableQuest(  MORK , true )
	DisableQuest(  GILL , true )
	DisableQuest(  LB , true )
	DisableQuest(  LAF , true )
	DisableQuest(  ETN , true )
---	改變高度
	SetModeEx(GILL,EM_SetModeType_Gravity,false) 
	WriteRoleValue(GILL,EM_RoleValue_Y,850)	
	SetModeEx(LB,EM_SetModeType_Gravity,false) 
	WriteRoleValue(LB,EM_RoleValue_Y,850)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register ,  STAR) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register2 ,CS)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,TONY)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4,MORK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,GILL)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register6 ,LB)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register7 ,LAF) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register8 ,ETN) 
	WriteRoleValue(ETN ,EM_RoleValue_IsWalk , 0  )
	BeginPlot( OWNERID() , "LuaS_423624_5" , 0 )
	sleep(20)
	Yell(TONY,"[SC_423624_5]",3)--騎士，你終於到了？
	SLEEP(30)
	Yell(CS,"[SC_423624_6]",3)--你不覺得這裡平靜到有些詭異嗎？
	SLEEP(30)
	Yell(MORK,"[SC_423624_7]",3)--嗯....感覺...
	SLEEP(30)
---晨星前進  做出掩護的動作 DW_MoveToFlag( OwnerID(),780749,14, 0,1) ruFUSION_ACTORSTATE_ATTACK_1H
PlayMotion(STAR, ruFUSION_ACTORSTATE_ATTACK_1H)
 	Yell(STAR,"[SC_423624_8]",3)----危險！小心！	
---命令玩家自己施放 光亮的法術  或者種出一個隱形球施放法術  496477
BeginPlot( STAR , "LuaS_423624_CRY" , 0 )
BeginPlot( TONY , "LuaS_423624_CRY" , 0 )
BeginPlot( CS , "LuaS_423624_CRY" , 0 )
BeginPlot( MORK , "LuaS_423624_CRY" , 0 )
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(  Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			CastSpell( Group[i], Group[i],496477)---光亮
		end
	end	
---幫騎馬的玩家下馬 DW_CancelTypeBuff(68, player[i] )
	SLEEP(10)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(  Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			DW_CancelTypeBuff(68,  Group[i] )
	--------		CastSpell( Group[i], Group[i],491276)---光亮
		end
	end
---在刺眼的法術  施展時  讓 LAF 與ETN 一同產出   讓所有人包含玩家被擊倒	並且被束縛  上BUFF   508044
	AddToPartition( LAF , 0)
	AddToPartition( ETN , 0)
---幫玩家做跌倒動作  加鎖鍊
	SLEEP(10)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag( Group[i],544591)==false   and CheckBuff( Group[i]  ,508042)==true  then 
			PlayMotion( Group[i] , ruFUSION_ACTORSTATE_HURT_NORMAL )
			AddBuff(Group[i] ,508044,1,20)
		end
	end
	SLEEP(40)
	AddBuff(TONY ,508044,1,20)
	AddBuff(MORK ,508044,1,20)
	AddBuff(CS ,508044,1,20)
	AddBuff(STAR ,508044,1,20)
	Yell(LAF,"[SC_423624_9]",3)--小麻雀～這一路的旅途有趣嗎？
	sleep(35)
	Yell(LAF,"[SC_423624_10]",3)----哈～自投羅網的感覺不錯吧？
	sleep(30)
---拉走近 晨星
	BeginPlot( LAF , "LuaS_423624_LAF" , 0 )
	Yell(LAF,"[SC_423624_11]",3)---讓我把你的夥伴獻給主人吧！
	sleep(30)
	AdjustFaceDir( LAF , STAR, 0 )
	Yell(LAF,"[SC_423624_12]",3)---你痛苦的神情，是我最夢寐以求的渴望，
	sleep(30)
	Yell(LAF,"[SC_423624_13]",3)---哈～依崔尼！還不趕快來服侍，我們尊貴的人王？
------idle02 ruFUSION_ACTORSTATE_EMOTE_IDLE2
PlayMotion(LAF, ruFUSION_ACTORSTATE_EMOTE_IDLE2)	
	sleep(30)
	Yell(LAF,"[SC_423624_14]",4)--艾娜莉亞大人，可是準備了一連串的遊戲來招待我們這位尊貴的客人呢！
---伊崔妮 走接近人王。DW_MoveToFlag( MM,780749,9, 0,1)  496580
	SysCastSpellLv(ETN,TONY,496580,1)
	SLEEP(10)
	BeginPlot( ETN, "LuaS_423624_ETN" , 0 )
	AddToPartition( GILL , 0)
	AddToPartition( LB , 0)
	BeginPlot( LB , "LuaS_423624_LB" , 0 )
	BeginPlot( GILL , "LuaS_423624_GILL" , 0 )
	SLEEP(40)
	Yell(LB,"[SC_423624_15]",5)---離他們遠一點！壞人！
	sleep(10)
CastSpell( LAF , LAF ,496485)
----	AdjustFaceDir( ETN , TONY, 0 )
	sleep(20)
	Yell(LAF,"[SC_423624_16]",3)---唉呀～原來小麻雀還留有一手，遊戲自然要如此才能有趣！
	sleep(30)
	Yell(LAF,"[SC_423624_17]",3)---
	sleep(30)
	CastSpell( ETN , LAF ,496484)
	Yell(LAF,"[SC_423624_18]",3)---走吧，依催妮
	CastSpell( LAF , LAF ,491276)
	sleep(20)
	delobj(ETN)
	delobj(LAF)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag( Group[i],544591)==false and CheckBuff(Group[i] ,508042)==true  then 
			ScriptMessage(	Group[i] , Group[i] , 1 , "[SC_423624_19]" , 0)---呵～小麻雀，你可別讓我太失望。
			ScriptMessage( 	Group[i] , Group[i] , 0 , "[SC_423624_19]" , 0)
		end
	end
	sleep(30)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624 ) == true ) and CheckFlag(Group[i] ,544591)==false and CheckBuff(Group[i] ,508042)==true  then 
			ScriptMessage(	Group[i] , Group[i] , 1 , "[SC_423624_20]" , 0)---各位，主人已經設下晚宴，我會在格拉夫古堡等待你們的大臨。
			ScriptMessage( 	Group[i] , Group[i] , 0 , "[SC_423624_20]" , 0)
			CancelBuff( Group[i], 508044)
		end
	end
	sleep(30)
---康葛斯跺步
PlayMotion(CS, ruFUSION_ACTORSTATE_EMOTE_ANGRY)	
	Yell(CS,"[SC_423624_21]",4)--可惡！又被擺了一道。
	sleep(10)
	yell(Star,"[SC_423624_22]",4)---父親...
	BeginPlot( star , "LuaS_423624_star" , 0 )
	sleep(30)
	yell(TONY,"[SC_423624_23]",4)---等等！[116585]！	
	BeginPlot( CS , "LuaS_423624_ALL" , 0 )
	BeginPlot( GILL , "LuaS_423624_FLAY" , 0 )
	BeginPlot(MORK , "LuaS_423624_ALL" , 0 )
	BeginPlot( LB , "LuaS_423624_FLAY" , 0 )
	DW_MoveToFlag( TONY,780749,10, 0,1)
	sleep(20)
	for i=0,table.getn(Group)-1 do
		if(CheckAcceptQuest( Group[i] , 423624) == true ) and CheckFlag( Group[i],544591)==false and CheckBuff(  Group[i]  ,508042)==true  then 
			SetFlag( Group[i], 544591, 1 )
			CancelBuff( Group[i], 508042)
		end
	end
	delobj(STAR)
	delobj(CS)
	delobj(TONY)
	delobj(MORK)
	delobj(GILL)
	delobj(LB)
	delobj(LAF)
	delobj(ETN)
	delobj(ownerID())
end	
function LuaS_423624_ALL()
	sleep(10)	
	move(OwnerID(),-5336.4+rand(35) , 769.4 , 45335.6+rand(35)  )
end
function LuaS_423624_FLAY()
	sleep(10)	
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	move(OwnerID(),-5336.4+rand(50) , 769.4 , 45335.6+rand(50)  )
end

function LuaS_423624_star()	
	DW_MoveToFlag( OwnerID(),780749,12, 0,1)
end

function LuaS_423624_LAF()	
	DW_MoveToFlag( OwnerID(),780749,13, 0,1)
end

function LuaS_423624_ETN()	
	DW_MoveToFlag( OwnerID(),780749,14, 0,1)
end

function LuaS_423624_LB()	
	AdjustDir(OwnerID() ,280)
	MoveToFlagEnabled( OwnerID(), false )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	MoveDirect(OwnerID()  , -5366.3 , 769.7 , 45430.8)
	AdjustDir(OwnerID() ,360)
	SLEEP(100)
	PlayMotion(OwnerID() , ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_IDLE_STAND )
----	AdjustDir(OwnerID() ,180)
end
	
function LuaS_423624_GILL()	
	AdjustDir(OwnerID() ,280)
	MoveToFlagEnabled( OwnerID(), false )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_RUN_FORWARD )
	MoveDirect(OwnerID()  , -5411.3 , 769.4 , 45390.5)
	AdjustDir(OwnerID() ,360)
	SLEEP(100)
	PlayMotion(OwnerID() , ruFUSION_MIME_KNOCKDOWN_END  )
	SetDefIdleMotion(OwnerID() , ruFUSION_MIME_IDLE_STAND )
----	AdjustDir(OwnerID() ,180)
end
	
function LuaS_423624_CRY()
 	CastSpell( OwnerID(),  OwnerID(), 496477)
	SLEeP(10)
	PlayMotion(  OwnerID(),   ruFUSION_ACTORSTATE_HURT_NORMAL )
end
function LuaS_423624_5()
	local STAR = ReadRoleValue(OwnerID(),EM_RoleValue_Register)--
	local CS   = ReadRoleValue(OwnerID(),EM_RoleValue_Register2)--
	local TONY = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local GILL = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local LB   = ReadRoleValue(OwnerID(),EM_RoleValue_Register6)--
	local LAF  = ReadRoleValue(OwnerID(),EM_RoleValue_Register7)--
	local ETN  = ReadRoleValue(OwnerID(),EM_RoleValue_Register8)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 200)
	for i=1, 80, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423624 ) == true	and  CheckFlag( Group[K], 544591) == false     and   CheckBuff(  Group[K]  ,508042)==true   and GetDistance( Group[K] , OwnerID() ) < 200  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423624 ) == true	and
				CheckFlag( Group[K], 544591) == false and GetDistance( Group[K] , OwnerID() ) >200		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
				CancelBuff( Group[K], 508042)		
							if	CheckBuff(Group[K],  508042)==true  then
								CancelBuff(Group[K] , 508042)
							end
							if	CheckBuff( Group[K]  ,508044)==true  then
								CancelBuff( Group[K], 508044)

							end
			end
			if  	CheckAcceptQuest( Group[K], 423624 ) == false	and CheckFlag( Group[K], 544591) == false     then
					if  CheckBuff(Group[K],  508042)==true then
						CancelBuff( Group[K], 508042)
					end
					if  CheckBuff(Group[K],  508044)==true then
						CancelBuff( Group[K], 508044)
					end
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(STAR)
	delobj(CS)
	delobj(TONY)
	delobj(MORK)
	delobj(GILL)
	delobj(LB)
	delobj(LAF)
	delobj(ETN)
	delobj(ownerID())
end