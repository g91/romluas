function LuaS_kk_tt()------特效
	AddBuff(OwnerID(),507555,1,-1)
	AddBuff(OwnerID(),507556,1,-1)
	AddBuff(OwnerID(),507579,1,-1)
END
-----------------------------------------
function LuaS_423508_0()
	local KK = Lua_DW_CreateObj("flag" ,116195,780751,0,0 )---種出摩瑞克大魔王
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	Tell(TargetID(),KK , "[SC_423508_1]")----那麼就照他所說的做吧！你取得[<S>208147]就先將東西送至艾力克研究團營地的[116326]面前，待我取回沙紋陸龜體內的凝珠後，就會直接過去。
	sleep(10)
	delobj(KK)
end
----------------------------------------------------------
function LuaS_423509_0()----
	LoadQuestOption( OwnerID() )
	if	CheckAcceptQuest( OwnerID() , 423509) == true  and  (CheckFlag(OwnerID(),544358)==false) then
				AddSpeakOption(OwnerID(),TargetID()," [SC_423509_0]","LuaS_423509_1",0)--(你想起來了沒？)
	end
end
function LuaS_423509_1()----
   	SetSpeakDetail(OwnerID(),"[SC_423509_2]")---
	SetFlag(OwnerID() ,544358, 1 )
 end

function LuaS_423509_2()
	local KK = Lua_DW_CreateObj("flag" ,116346,780432,22,0)---種出摩瑞克大魔王
	Lua_ObjDontTouch( KK )
	DisableQuest( KK ,true )
	AddToPartition(KK , 0 )
	Tell(TargetID(),KK , "[SC_423509_3]")----那麼就照他所說的做吧！你取得[<S>208147]就先將東西送至艾力克研究團營地的[116326]面前，待我取回沙紋陸龜體內的凝珠後，就會直接過去。
	sleep(10)
	delobj(KK)
end

---------------------------------------------------
function LuaS_423510()----116186   116301摩瑞克  116184   116300康葛斯  BUFF 507503  780751(11)
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507503,1,30)---
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MORK = Lua_DW_CreateObj("flag" ,116345,780751,11,1)---
	local CK = Lua_DW_CreateObj("flag" ,116184,780751,12,1)---
	DisableQuest( CK ,true )
	DisableQuest( MORK ,true )
	DW_MoveToFlag( CK ,780751,13, 0,1)
	AdjustFaceDir( CK , MORK, 0 )
	Say(CK,"[SC_423510_1]")---[116328]...你在看些什麼？
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	AdjustFaceDir(  MORK,CK, 0 )
	Say(MORK,"[SC_423510_2]")-------夾在[208148]中，發現了一封署名為[104332]的信件。
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(MORK,"[SC_423510_3]")---但在信末，蓋了一個叫做『[116268]』古字的大印，你覺得這是什麼意思？
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	ScriptMessage( TargetID(), TargetID(), 0, "[SC_423510_4]", 0 )--[116186]與[116184]低聲交談著...你幾乎聽不見他們的聲音。
	ScriptMessage( TargetID(), TargetID(), 1, "[SC_423510_4]", 0 )
	sleep(30)
	Say(MORK,"[SC_423510_5]")---那就這樣吧...
	PlayMotion(MORK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
	Say(CK,"[SC_423510_6]")---好...
	PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	DW_MoveToFlag( CK ,780751,12, 0,1)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507503)
	end
	DELOBJ(CK)
	DELOBJ(MORK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end
-------------------------------------------------------
function LuaS_423513()------423551
	if (CheckAcceptQuest(OwnerID(),423513)==true )and (CheckFlag(OwnerID() , 544359) == false or CheckFlag(OwnerID() , 544395) == false ) then
		LoadQuestOption( OwnerID() )
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423513_1]","LuaS_423513_1",0) ----(請問...)
		AddSpeakOption(OwnerID(),TargetID(),"[SC_423513_2]","LuaS_423513_2",0)		
	elseif  CheckCompleteQuest(OwnerID(),423568)==true and    CheckCompleteQuest(OwnerID(),423513)==true  then
		if  CheckFlag(OwnerID() , 544397) == true  then  
			SetFlag(OwnerID() ,544397, 0 ) 
		end

	elseif (CheckAcceptQuest(OwnerID(), 423514 )==true ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_421955_1]","LuaS_423513_5",0) 

	else  LoadQuestOption( OwnerID() )
	
	end	 

end


function LuaS_423513_1()------
	SetSpeakDetail( OwnerID(), "[SC_423513_3]"  )---
	SetFlag(OwnerID() ,544359, 1 ) 
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423513",0) 
end
function LuaS_423513_2()------
	SetSpeakDetail( OwnerID(), "[SC_423513_4]"  )---
	SetFlag(OwnerID() ,544395, 1 ) 
	AddSpeakOption(OwnerID(),TargetID(),"[SO_BACK]","LuaS_423513",0) 
end
function LuaS_423513_4()------
	if CheckCompleteQuest(TargetID() ,423569)==false then
		SetFlag(TargetID()  ,544397, 1 ) 
	end
end

function LuaS_423513_5()------
	CastSpell( OwnerID() , OwnerID() , 491008 )
	sleep(20)
	ChangeZone( OwnerID() , 15 , 0 , -4063.7 , 154.6 , 8220.5 , 271.3 )
end

function LuaS_423513_6()
	SetPlot( OwnerID() , "Range" , "LuaS_423513_7" , 350 )
end
function LuaS_423513_7()
	if	CheckCompleteQuest(OwnerID(),423569)==true and    CheckCompleteQuest(OwnerID(),423513)==true  then
		if  CheckFlag(OwnerID() , 544397) == true  then  
			SetFlag(OwnerID() ,544397, 0 ) 
		end
	end	
end





------------------------------------------------------------------------------
---------------------------------780752
function LuaS_423515_0()----吉兒116341 晨星116343 康葛斯 116342 BUFF 507512
	DisableQuest( OwnerID() ,true )
	AddBuff(TargetID(),507512,1,35)---
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local GILL = Lua_DW_CreateObj("flag" ,116341,780752,1,1)---
	local STAR = Lua_DW_CreateObj("flag" ,116343,780752,2,1)---
	local CK = Lua_DW_CreateObj("flag" ,116342,780752,3,1)---
	DisableQuest( STAR ,true )
	DisableQuest( CK ,true )
	DisableQuest( GILL ,true )
	DW_MoveToFlag( GILL ,780752,4, 0,1)
	Say(GILL,"[SC_423515_1]")---如果你敢糟蹋這些材料的話，你會知道什麼叫做生不如死。
PlayMotion(GILL,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(30)
	Say(CK,"[SC_423515_2]")-------女孩子，怎麼可以動不動就說這種可怕的話？
	sleep(30)
	Say(CK,"[SC_423515_3]")---用不著擔心，妳等著看好了。
PlayMotion(CK,  ruFUSION_ACTORSTATE_EMOTE_SPEAK )
	sleep(20)
CastSpell( CK, CK, 495918 )
	sleep(30)
	Say(CK,"[SC_423515_4]")---這不就好了？
	sleep(20)
	DW_MoveToFlag( STAR ,780752,5, 0,1)
	Say(STAR,"[SC_423515_5]")---一切都準備好了嗎？那麼我待會兒就出發。
AdjustFaceDir( CK , STAR, 0 )
AdjustFaceDir( GILL , STAR, 0 )
---點頭動作
PlayMotion(STAR,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD )
	sleep(30)
---晨星向康葛斯敬禮
PlayMotion(STAR ,  ruFUSION_ACTORSTATE_EMOTE_SALUTE2     )
	Say(STAR,"[SC_423515_6]")--在星星的指引下，蛻變，會使星芒更加輝亮，
	sleep(30)	
	DW_MoveToFlag( STAR ,780752,6, 0,1)
	if 	CheckID( TargetID() ) == true  then
			CancelBuff( TargetID() , 507512)
	end
	DELOBJ(GILL)
	DELOBJ(STAR)
	DELOBJ(CK)
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( OwnerID() ,false )
end




