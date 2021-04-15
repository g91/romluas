----村民[116252]的對話。
function LuaS_423498()------
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)>=1   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_1",0) ----(請問最近這發生了什麼事嗎？)
	else
		LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_1()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544347, 1 ) 	
		GiveBodyItem( OwnerID() ,208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544347, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544347, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_2]"  )---
end
----村民[116253]的對話。
function LuaS_423498_2()
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true )and    (CheckFlag(OwnerID(),544351)==false )   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_3",0) ----(請問最近這發生了什麼事嗎？)
	else	LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_3()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544351, 1 ) 	
		GiveBodyItem( OwnerID() , 208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544351, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544351, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_3]"  )---
end
----村民[116254]的對話。
function LuaS_423498_4()
	if (CheckAcceptQuest(OwnerID(),423498)==true ) and   (CheckFlag(OwnerID(),544347)==false )  and  CountBodyItem( OwnerID() , 208106)<1   then
		SetSpeakDetail( OwnerID(), "[SC_423498_19]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423498)==true )and    (CheckFlag(OwnerID(),544352)==false )   then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_1]","LuaS_423498_5",0) ----(請問最近這發生了什麼事嗎？)
	else	LoadQuestOption( OwnerID() )
	end
end
function LuaS_423498_5()
	if (CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false ) then
		SetFlag(OwnerID() ,544352, 1 ) 	
		GiveBodyItem( OwnerID() , 208107 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) then
			SetFlag(OwnerID() ,544352, 1 ) 
			GiveBodyItem( OwnerID() , 208108 ,1)	
	elseif ((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==false )) or((CheckFlag(OwnerID(),544347)==true ) and (CheckFlag(OwnerID(),544351)==false ) and (CheckFlag(OwnerID(),544352)==true )) or ((CheckFlag(OwnerID(),544347)==false ) and (CheckFlag(OwnerID(),544351)==true ) and (CheckFlag(OwnerID(),544352)==true )) then
		SetFlag(OwnerID() ,544352, 1 ) 
		GiveBodyItem( OwnerID() , 208109 ,1)		
	end		
	SetSpeakDetail( OwnerID(), "[SC_423498_4]"  )---
end
------與康葛斯(116251)說話
function LuaS_423498_6()
	if CheckAcceptQuest(OwnerID(),423498)==true  and    CountBodyItem( OwnerID() , 208106)==0 then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423498_20]","LuaS_423498_KK",0) ----(請問最近這發生了什麼事嗎？)
	end
	if (CheckAcceptQuest(OwnerID(),423498)==true )and CountBodyItem( OwnerID() , 208109)>=1 and CountBodyItem( OwnerID() ,208108 )>=1 and CountBodyItem( OwnerID() , 208107)>=1 and (CheckFlag(OwnerID(),544353)==false )  then
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) >0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422498_5]","LuaS_423498_7",0)---(這些是我詢問的結果。)
			end
			if	ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
				AddSpeakOption(OwnerID(),TargetID(),"[SC_422498_5]","LuaS_423498_8",0)---(這些是我詢問的結果。)
			end	
	end
	LoadQuestOption( OwnerID() )
end
function LuaS_423498_KK()----
	SetSpeakDetail(OwnerID(),"[SC_423498_21]")---嗯…很好，我都看過了，你先拿著！我剛剛看到[116191]的身影了，先在這裡等等！待會應該就會出來了！
	GiveBodyItem( OwnerID() , 208106 ,1)	
 end
function LuaS_423498_7()----
	SetSpeakDetail(OwnerID(),"[SC_423498_6]")---嗯…很好，我都看過了，你先拿著！我剛剛看到[116191]的身影了，先在這裡等等！待會應該就會出來了！
 end
function LuaS_423498_8()----	
	CloseSpeak( OwnerID() )
	if  ReadRoleValue( TargetID() , EM_RoleValue_Register1  ) == 0 then
		WriteRoleValue( TargetID(), EM_RoleValue_Register1 ,1) 
		BeginPlot( TargetID() , "LuaS_423498_9" , 0)
	end
end	
function LuaS_423498_9()----種出混世大摩王 780545
	local KK = Lua_DW_CreateObj("flag" ,116187,780545,1,0)---種出一個掌控全部的NPC的魔王。
	DisableQuest( KK ,true )
	Lua_ObjDontTouch( KK )
	AddToPartition(KK , 0 )
--	WriteRoleValue( KK, EM_RoleValue_Register2 ,TargetID())---把玩家寫到裡頭
	BeginPlot( KK , "LuaS_423498_10" , 0 )
	local Player = SearchRangePlayer( OwnerID() , 350 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423498 ) == true ) and CheckFlag( player[i],544353)==false and CountBodyItem( Player[i] , 208109)>=1 and CountBodyItem(Player[i] ,208108 )>=1 and CountBodyItem( Player[i] , 208107)>=1 and CheckBuff( player[i]  ,507509)==false  then
			AddBuff(player[i] ,507509,1,70)
		end
	end	
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					WriteRoleValue( OwnerID() , EM_RoleValue_Register1 ,0) 
			break
		end
	end
end
function LuaS_423498_10()----116257 凱薩琳 116256 摩瑞克
	local CL= Lua_DW_CreateObj("flag" ,116257,780545,2,0 )
	local MORK = Lua_DW_CreateObj("flag" ,116256,780545,3,0 )
	local CK = Lua_DW_CreateObj("flag" ,116258,780545,4,1 )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CL) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,MORK)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,CK) 	
	BeginPlot( OwnerID() , "LuaS_423498_11" , 0 )
	DisableQuest( CK ,true )
	DisableQuest( CL ,true )
	DisableQuest( MORK ,true )
	Say(CK,"[SC_423498_7]")--嗯，這些資料我都看過了…你先拿著。
---bow_parry buff01
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
	Say(CK,"[SC_423498_8]")--[116191]他們應該要出來了。
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	AddToPartition( MORK , 0 )
	AddToPartition( CL , 0 )
	DW_MoveToFlag( MORK,780545,5, 0,1)
	DW_MoveToFlag( CL,780545,6, 0,1)
AdjustFaceDir( MORK ,CL  , 0 )
	YELL(MORK,"[SC_423498_9]",4)-----妳放心好了！我會為妳找回妳的情人…
PlayMotion(MORK ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD  )
	sleep(30)
	YELL(CL,"[SC_423498_10]",4)---嗯，那就麻煩你了。
PlayMotion(CL ,  ruFUSION_ACTORSTATE_EMOTE_SALUTE2     )
	sleep(40)
	YELL(CL,"[SC_423498_11]",4)---對了！你長得好像我的祖先…甚至也姓渥淋特…讓我不禁想起流傳在家裡的那個傳說…
PlayMotion(CL ,   ruFUSION_ACTORSTATE_EMOTE_POINT      )
	sleep(40)
	YELL(MORK,"[SC_423498_12]",4)---怎樣的傳說？
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_13]",4)--- 過去的女祖先與後山的龍神相戀的傳說…族裡的人都說她並不是失蹤了，而是嫁給了龍神…
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_14]",4)--所以每次族裡發生了什麼事，都會比一般村民還要誠心的乞求龍神的幫助…說也奇怪，似乎十分靈驗…
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(50)
	YELL(MORK,"[SC_423498_15]",4)---是嗎？有這麼一回事？
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	YELL(CL,"[SC_423498_16]",4)----啊！天啊！時間到了，不好意思，我約了人，我得先失陪一下，等會見…
PlayMotion(CL,  ruFUSION_ACTORSTATE_EMOTE_WAVE)
	sleep(10)
	DW_MoveToFlag( CL,780545,7, 0,1)
	delobj(CL)
	sleep(20)
	YELL(MORK,"[SC_423498_17]",4)---嗯…
	local Player = SearchRangePlayer( OwnerID() , 450 )
	for i=0,table.getn(Player)-1 do
		if	(CheckAcceptQuest( player[i] , 423498 ) == true ) and CheckFlag( player[i],544353)==false and CountBodyItem( Player[i] , 208109)>=1 and CountBodyItem(Player[i] ,208108 )>=1 and CountBodyItem( Player[i] , 208107)>=1 and CheckBuff( player[i]  ,507509)==true  then
		SetFlag( Player[i] ,544353, 1 ) 
		CancelBuff( player[i] , 507509)
		end
	end
	delobj(MORK)
	delobj(CK)
	delobj(OwnerID())
end
function LuaS_423498_11()
	local CL = ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local MORK = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)--
	local CK = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)--
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423498 ) == true	and
				CheckFlag( Group[K], 544353) == false and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
			if	CheckAcceptQuest( Group[K], 423498 ) == true	and
				CheckFlag( Group[K], 544353) == false and GetDistance( Group[K] , OwnerID() ) >300		then
				ScriptMessage( Group[K], Group[K], 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
				CancelBuff( Group[K], 507509)		
			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(CL)
	delobj(MORK)
	delobj(CK)
	delobj(OwnerID())
end
---結束任務的
function LuaS_423498_12()
	local MORK = Lua_DW_CreateObj("flag" ,116195,780545,1,0 )
	DisableQuest( MORK ,true )
	Lua_ObjDontTouch(  MORK)
	Tell (TargetID() , MORK ,  "[SC_423498_18]" )---你們在這剛好，[116244]他們似乎發現了什麼…我想請你與[116251]先行與他們會面好嗎…
	sleep(20)
	delobj( MORK)
end


function LuaS_423498_13()
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423498)==false ) and ( CountBodyItem( OwnerID() , 208109)>=1 or  CountBodyItem( OwnerID() ,208108 )>=1 or  CountBodyItem( OwnerID() , 208107)>=1 ) then
		 if  	CountBodyItem( OwnerID() , 208109)>=1 then
		  	 DelBodyItem( OwnerID() , 208109 , 1)
		end
		 if  	CountBodyItem( OwnerID() , 208108)==1 then
		  	 DelBodyItem( OwnerID() , 208108 , 1)
		end
		 if  	CountBodyItem( OwnerID() , 208107)==1 then
		  	 DelBodyItem( OwnerID() , 208107 , 1)
		end
	
	end
end
--------------------------------------------------------
----掛在康葛斯身上
function LuaS_423500()------
	if (CheckAcceptQuest(OwnerID(),423500)==true )and CheckFlag(OwnerID() , 544355) == false  and CheckFlag(OwnerID() , 544354) == false then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423500_1]","LuaS_423500_1",0) ----(請問...)
	elseif (CheckAcceptQuest(OwnerID(),423500)==true ) and CheckFlag(OwnerID() , 544354) == false and CheckFlag(OwnerID() , 544355) == true and CountBodyItem(OwnerID() , 208112)<5 then
		SetSpeakDetail( OwnerID(), "[SC_423500_2]"  )---
	elseif (CheckAcceptQuest(OwnerID(),423500)==true ) and CheckFlag(OwnerID() , 544354) == false and CheckFlag(OwnerID() , 544355) == true and CountBodyItem(OwnerID() , 208112)>=5 then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423500_3]","LuaS_423500_2",0)---(轉交5份[<S>208112]給[116286]。)
	else
		LoadQuestOption( OwnerID() )
	end
end
function LuaS_423500_1()------
	SetSpeakDetail( OwnerID(), "[SC_423500_2]"  )---
	SetFlag(OwnerID() ,544355, 1 ) 
end
function LuaS_423500_2()------
	SetSpeakDetail( OwnerID(), "[SC_423500_4]"  )---或是取得
	SetFlag(OwnerID() ,544354, 1 ) 
end
function LuaS_423500_3()------780748
	AddBuff(TargetID(),507510,1,60)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local CK= Lua_DW_CreateObj("flag" ,116290,780748,1,1 )
	local STAR = Lua_DW_CreateObj("flag" ,116291,780748,2,0 )
	PlayMotionEX( STAR , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	DisableQuest( CK ,true )
	DisableQuest( STAR ,true )
	AddToPartition( STAR,0)   
	AddBuff(STAR,507513,1,30)	
	Say(CK,"[SC_423500_5]")---不用擔心...不用害怕...
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_KISS )
	sleep(30)
	DW_MoveToFlag( CK,780748,3, 0,1)
	PlayMotionEX( CK  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Say(CK,"[SC_423500_6]")---我只是要醫治你的傷口。
	sleep(30)
	Say(STAR,"[SC_423500_7]")---哦～那麼就恭敬不如從命。
	sleep(30)	
	CancelBuff( STAR , 507513)
	PlayMotion( CK  , ruFUSION_ACTORSTATE_CROUCH_END)
	Say(STAR,"[SC_423500_8]")----呵～是你？[115391]，又見面了！
	sleep(30)
	Say(CK,"[SC_423500_9]")---原來你們認識啊？悍妞，這下可能徹底誤會人家了？
	sleep(10)
	DW_MoveToFlag( CK,780748,1, 0,1)
	sleep(10)
		if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507510)
	end
	delobj(CK)
	delobj(STAR)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
	
---------------------------------------------------------------------------------
function LuaS_423501()------
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423501_1]","0xff008000" )--[116289]的手在你手腕上滑過...你感覺冰涼...
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423501_1]", "0xff008000"  )--
end
----------------------------------------------------------------
------------------
function LuaS_423504_1()-----
	AddBuff(TargetID(),507511,1,60)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local CK= Lua_DW_CreateObj("flag" ,116300,780749,1,1 )
	local STAR = Lua_DW_CreateObj("flag" ,116302,780749,2,1 )	
	local MORK = Lua_DW_CreateObj("flag" ,116301,780749,3,1 )
	DisableQuest(  STAR  ,true )	
	DisableQuest(  CK  ,true )	
	DisableQuest(   MORK   ,true )	
	Say(STAR,"[SC_423504_1]")---星芒逐漸發出異色的光芒！
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(STAR,"[SC_423504_2]")--與我相連的聖戰，一觸即發...
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Say(MORK,"[SC_423504_3]")---曾經被[115375]除去力量的[103129],也許會是真理之手的目標之一。
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep(30)
	Say(MORK,"[SC_423504_4]")---我不能坐視不管！尤其是這附近又有死氣沉沉的士兵出沒...
PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_APPROVAL   )
	sleep(30)
	Say(MORK,"[SC_423504_5]")----龍王的實驗資料，龍族必須回收銷毀。
	sleep(30)
	Say(CK,"[SC_423504_6]")----夠了！我都知道了，這些孩子，一點都不尊重年長於他們的尊者。
PlayMotion(CK,   ruFUSION_ACTORSTATE_EMOTE_STRETCH )
	sleep(30)
	Say(CK,"[SC_423504_7]")---一句一句接踵而來，吵得我的頭都要爆掉了！
	sleep(30)
		if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507511)
	end
	sleep(10)
	delobj(CK)
	delobj(STAR)
	delobj(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
---------------------------------------------------------------------
---摩板水晶
function LuaS_423505_USECHECK()------780750
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if	  CountBodyItem( OwnerID(), 208135 )<1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505]", 0 )--缺乏[208135]，魔幻水晶沒有起任何的反應。
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505]", 0 )--缺乏[208135]，魔幻水晶沒有起任何的反應。
			return -1
	end
	if	 ( OrgID == 116304 )    and (CheckAcceptQuest(OwnerID(),423505)==true ) and  CountBodyItem( OwnerID(),  208132)>=1 then  
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505_1]", 0 )--
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505_1]", 0 )--
			return -1
	end
	if	( OrgID == 116305)	    and	(CheckAcceptQuest(OwnerID(),423505)==true ) and  CountBodyItem( OwnerID(), 208133)>=1 then  
			ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423505_2]", 0 )--你已獲得魔幻水
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423505_2]", 0 )--你已獲得魔幻水
			return -1
		end
		return 1
end
function LuaS_423505_USEOK()
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		if ( OrgID == 116304 ) then
			if	(CheckAcceptQuest(OwnerID(),423505)==true ) then 
				BeginPlot( TargetID(),"LuaS_423505_1", 0)
				return 1
			end
			return -1
		end
		if ( OrgID == 116305) then
			if	(CheckAcceptQuest(OwnerID(),423505)==true ) then 
				BeginPlot( TargetID(),"LuaS_423505_2", 0)
				return 1
			end
			return -1
		end		
end
function LuaS_423505_1()
	DisableQuest(  OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,116187,780750,1,0 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	BeginPlot( KK , "LuaS_423505_4" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
					DisableQuest(  OwnerID() ,false ) 
					SetPlot( OwnerID() , "touch" , "" , 50 )
			break
		end
	end
end

function LuaS_423505_4()----116321 康葛斯 116199 佛南多
	local CK= Lua_DW_CreateObj("flag" ,116321,780750,2,1 )
	local FSD = Lua_DW_CreateObj("flag" ,116199,780750,3,1)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,CK) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,FSD)
	DisableQuest( CK ,true )
	DisableQuest( FSD ,true )
	BeginPlot( OwnerID() , "LuaS_423505_5" , 0 )
	Say(CK,"[SC_423505_1_1]")--這就是傳說中被[115375]奪走地之力的地龍？
PlayMotion(CK,   ruFUSION_ACTORSTATE_EMOTE_POINT )
	sleep(30)
	Say(CK,"[SC_423505_1_2]")---看起來，沒有想像中的凶悍。 
PlayMotion(CK,    ruFUSION_ACTORSTATE_EMOTE_LAUGH  )
	sleep(30)
	Say(FSD,"[SC_423505_1_3]")--別掉以輕心，就算除去了地之力，牠仍是此地的霸王。  
PlayMotion(FSD,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	sleep(30)
	Say(FSD,"[SC_423505_1_4]")--極高的智慧足以讓牠存活，或許我們的一舉一動都已經深深印入牠的腦海內了。
PlayMotion(FSD,     ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	sleep(30)
	Say(FSD,"[SC_423505_1_5]")--亞龍通常不具有這麼高的智慧，牠一定是活了很久，真想看看牠到底經歷過了什麼。
PlayMotion(FSD,     ruFUSION_ACTORSTATE_EMOTE_SPEAK  )
	SLEEP(30)
	Say(CK,"[SC_423505_1_6]")---所以這就是你想來這研究的目的？
PlayMotion(CK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(FSD,"[SC_423505_1_7]")--牠擁有深刻的力量，以及神諭祝福之血...是難得一見的研究對象。
PlayMotion(FSD,   ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
	sleep(30)
	Say(CK,"[SC_423505_1_8]")---這個好，做為研究資料，藉由研究，不一定我們還可以因此讓另一隻平凡無奇的亞龍擁有智慧。
PlayMotion(CK, ruFUSION_ACTORSTATE_EMOTE_WAVE)
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423505 ) == true   and CountBodyItem( Player[i] , 208132)==0  and CountBodyItem(Player[i] ,208135 )>=1  then
			GiveBodyItem(  player[i]  , 208132 ,1)	
		end
	end
	delobj(FSD)
	delobj(CK)
	delobj(OwnerID())
end

function LuaS_423505_5()
	local CK= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local FSD = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)---
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
				CountBodyItem( Group[K] , 208132)==0  and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
-----			if	CheckAcceptQuest( Group[K], 423505 ) == true	and CountBodyItem( Group[K] , 208132)==0 and GetDistance( Group[K] , OwnerID() ) >300		then
----				ScriptMessage( Group[K], Group[K], 1 , "[SC_423191_A_7]" , 0 ) --超出距離，您需要靠近一點,觀看劇情。。
----				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_A_7]" , 0 )--- -超出距離，您需要靠近一點,觀看劇情。	
---			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(FSD)
	delobj(CK)
	delobj(OwnerID())
end
----第二顆
function LuaS_423505_2()
	DisableQuest(  OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,116187,780750,7,0 )---種出一個掌控全部的NPC的魔王。
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	BeginPlot( KK , "LuaS_423505_6" , 0 )
	while true do
		sleep(10)
		if 	CheckID( KK)== false  then
				DisableQuest(  OwnerID() ,false )
				SetPlot( OwnerID() , "touch" , "" , 50 )
			break
		end
	end
end

function LuaS_423505_6()----種出透明版曼索瑞恩116320、賽西蒙德116319、卡貝斯特116322
	local MSR= Lua_DW_CreateObj("flag" ,116320,780750,8,1)
	local SCM = Lua_DW_CreateObj("flag" ,116319,780750,9,1)
	local CA = Lua_DW_CreateObj("flag" ,116322,780750,10,1 )
	SetDefIdleMotion(SCM,  ruFUSION_ACTORSTATE_NORMAL )
	WriteRoleValue(OwnerID() , EM_RoleValue_Register3 ,MSR) 
	WriteRoleValue(OwnerID() , EM_RoleValue_Register4 ,SCM)
	WriteRoleValue(OwnerID() , EM_RoleValue_Register5 ,CA)
	BeginPlot( OwnerID() , "LuaS_423505_7" , 0 )
	DisableQuest( CA ,true )
	DisableQuest( SCM ,true )
	DisableQuest( MSR ,true )
	Say(MSR,"[SC_423505_2_1]")--殺了牠...這隻作惡多端的地龍，害死了無數的人類。
CastSpell( MSR,MSR, 495919 )----
	sleep(30)
	Say(MSR,"[SC_423505_2_2]")--此刻不殺牠，還要再等多久？
CastSpell( MSR,MSR, 495919 )----
	Sleep(30)
	Say(CA,"[SC_423505_2_3]")--不，我與龍族約定，並不是這樣的...
PlayMotion(CA,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	Say(CA,"[SC_423505_2_4]")--我只準備抽取走牠的元素之力。
	Sleep(30)
	Say(SCM,"[SC_423505_2_5]")--都別吵了！先上再說吧！ ruFUSION_ACTORSTATE_BUFF_SP01 
PlayMotion(SCM,    ruFUSION_ACTORSTATE_BUFF_SP01 )
	Sleep(30)
	Say(SCM,"[SC_423505_2_6]")---不將牠打敗的話，你要怎麼吸取牠的元素之力？
	Sleep(30)
	Say(MSR,"[SC_423505_2_7]")---哼～醜話說在前頭，我可不能控制我的力量。
PlayMotion(MSR,   ruFUSION_ACTORSTATE_EMOTE_POINT )
	Sleep(30)
	Say(CA,"[SC_423505_2_8]")---取走牠的元素之力後，就放牠一條生路吧！
PlayMotion(CA,   ruFUSION_ACTORSTATE_EMOTE_HEAD_SHAKE)
	Sleep(30)
	Say(CA,"[SC_423505_2_9]")---這才是真正平衡元素之力的辦法。
	local Player = SearchRangePlayer( OwnerID() , 250 )
	for i=0,table.getn(Player)-1 do
		if	CheckAcceptQuest( player[i] , 423505 ) == true   and CountBodyItem( Player[i] , 208133)==0  and CountBodyItem(Player[i] ,208135 )>=1  then
			GiveBodyItem(  player[i] , 208133 ,1)	
		end
	end
	BeginPlot( MSR , "LuaS_423505_8" , 0 )
	BeginPlot( SCM , "LuaS_423505_8" , 0 )
	BeginPlot( CM , "LuaS_423505_8" , 0 )
	sleep(60)
	delobj(SCM)
	delobj(MSR)
	delobj(CA)
	delobj(OwnerID())	
end
function LuaS_423505_8()
	DW_MoveToFlag(OwnerID() ,780750,11, 0,1)
end
function LuaS_423505_7()
	local MSR= ReadRoleValue(OwnerID(),EM_RoleValue_Register3)--
	local SCM = ReadRoleValue(OwnerID(),EM_RoleValue_Register4)---
	local CA = ReadRoleValue(OwnerID(),EM_RoleValue_Register5)---
	local Group = {}
	local Num = 0
	Group = SearchRangePlayer(OwnerID(), 300)
	for i=1, 60, 1 do
		Num = 0
		for K=0,table.getn(Group)-1 do
			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
				CountBodyItem( Group[K] , 208133)==0  and GetDistance( Group[K] , OwnerID() ) < 300  	then
				Num = Num + 1
			end
----			if	CheckAcceptQuest( Group[K], 423505 ) == true	and
----				CountBodyItem( Group[K] , 208133)==0 and GetDistance( Group[K] , OwnerID() ) >300		then
---				ScriptMessage( Group[K], Group[K], 1 , "[SC_423191_A_7]" , 0 ) --超出距離，您需要靠近一點,觀看劇情。。
----				ScriptMessage( Group[K] , Group[K], 0 , "[SC_423191_A_7]" , 0 )--- -超出距離，您需要靠近一點,觀看劇情。	
-----			end
		end
		if	Num == 0  then
			break
		end
		sleep(10)
	end
	delobj(SCM)
	delobj(MSR)
	delobj(CA)
	delobj(OwnerID())
end







