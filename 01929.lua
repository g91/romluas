function LuaS_423338_0()---115640(妮克絲)的對話劇情
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423338_1]","LuaS_423338_1",0)--- 這是什麼意思？
	end
end

function LuaS_423338_1()
	SetSpeakDetail(OwnerID(),"[SC_423338_2]")---
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false ) then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423338_3]","LuaS_423338_2",0)---什麼黑影？
	end
end
function LuaS_423338_2()
	if (CheckAcceptQuest(OwnerID(),423338)==true )and  (CheckFlag(OwnerID(),544247)==false ) then
		SetSpeakDetail(OwnerID(),"[SC_423338_4]")---
		SetFlag( OwnerID(), 544247, 1 )
	end
end
-----------------------------------------------------------------
---(1)先給與玩家訊息
---(2)利用CLIENT 讓玩家 看不看得到花、肥沃土壤
function LuaS_423339_0()--東方的範圍劇情
 	SetPlot( OwnerID() , "Range" , "LuaS_423339_1" , 150 )
end
function LuaS_423339_1()
	if	 CheckAcceptQuest( OwnerID() , 423339) == true  and CheckFlag( OwnerID(), 544248 )==false then
			ScriptMessage( OwnerID(),OwnerID(), 0, "[SC_423339_1]" , 0 )---這裡應該就是東邊的森林交界處。
			ScriptMessage( OwnerID(),OwnerID(), 1, "[SC_423339_1]" , 0 )---
	end
end

function LuaS_423339_EAST1()
	SetPlot( OwnerID() , "Touch" , "LuaS_423339_EAST2", 40)
end

function LuaS_423339_EAST2()
		if  CheckFlag( OwnerID(), 544248 )==true and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )<1 then
		 	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_3]", 0 )		--你已經在此種植過[207706]。
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_3]", 0 )		
		end
		if	 CheckFlag( OwnerID(), 544248 )==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )<1 then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_2]", 0 )		--沒有[207706]，無法種植。
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_2]", 0 )
		end
		if 	 CheckFlag( OwnerID(), 544248 )==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )>=1 then
				BeginPlot(  OwnerID(),  "LuaS_423339_EAST3" , 0 )
		end
		if	CheckAcceptQuest(OwnerID() , 423339 ) == false then 
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_6]", 0 )		--沒有[207706]，無法種植。
		 		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_6]", 0 )
		end
end
function LuaS_423339_EAST3()---東邊
	DelBodyItem(  OwnerID(),  207706 , 1 )
	sleep(10)
	ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_4]", 0 )--種子順利的生長出[115639]。
	ScriptMessage(   OwnerID(),   OwnerID(), 1, "[SC_423339_4]", 0 )--種子順利的生長出[115639]。
	SetFlag(  OwnerID(),  544248, 1 )
end
-------------------------------------------------------------------------------
function LuaS_423339_WEST1()
		SetPlot( OwnerID() , "Touch" , "LuaS_423339_WEST2", 40)
end
function LuaS_423339_WEST2()
		if  CheckFlag( OwnerID(), 544249 )==true and CheckAcceptQuest(OwnerID() , 423339 ) == true then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_3]", 0 )		--你已經在此種植過[207706]。
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_3]", 0 )
		end
		if	 CheckFlag( OwnerID(), 544249 )==false and CountBodyItem( OwnerID(), 207706 )<1 and CheckAcceptQuest(OwnerID() , 423339 ) == true then
			 ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_2]", 0 )		--沒有[207706]，無法種植。
		 	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_2]", 0 )
		end
		if CheckFlag( OwnerID(),544249)==false and CheckAcceptQuest(OwnerID() , 423339 ) == true and CountBodyItem( OwnerID(), 207706 )>=1 then
			BeginPlot( OwnerID() , "LuaS_423339_WEST3" , 0 )
		end
		if	CheckAcceptQuest(OwnerID() , 423339 ) == false then 
				ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_423339_6]", 0 )		--沒有[207706]，無法種植。
		 		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_423339_6]", 0 )
		end
end

function LuaS_423339_WEST3()--西邊 115642
			DelBodyItem(   OwnerID() , 207706 , 1 )
			ScriptMessage(  OwnerID() ,  OwnerID(), 0, "[SC_423339_5]", 0 )---種子發生了異變，長出了[115642]。
			ScriptMessage(  OwnerID() ,  OwnerID(), 1, "[SC_423339_5]", 0 )---種子發生了異變，長出了[115642]。
			SetFlag( OwnerID(), 544249, 1 )
end

function LuaS_423339_4()--西方的範圍劇情
 	SetPlot( OwnerID() , "Range" , "LuaS_423339_5" , 150 )
end
function LuaS_423339_5()
	if 	CheckAcceptQuest( OwnerID() , 423339) == true  and CheckFlag( OwnerID(), 544249 )==false then
		ScriptMessage( OwnerID(),OwnerID(), 0, "[SC_423339_7]" , 0 )---這裡應該就是西邊的森林交界處。
		ScriptMessage( OwnerID(),OwnerID(), 1, "[SC_423339_7]" , 0 )---
	end
end


function LuaS_423339_EAST_1()--特效---光亮的特效 (還未挑選適合ㄉ)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 495917)
	end
end


function LuaS_423339_WEST_1()--特效---黑暗的特效 (還未挑選適合ㄉ)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(), 495916)
	end
end
-----------------------------------------
function LuaS_423341_0()---
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423341)==true )and  (CheckFlag(OwnerID(),544250)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423279_20]","LuaS_423341_1",0)--- 為什麼？---偷用別人的字串。
	end
end

function LuaS_423341_1()
	if (CheckAcceptQuest(OwnerID(),423341)==true )and  (CheckFlag(OwnerID(),544250)==false )then
		SetSpeakDetail(OwnerID(),"[SC_423341_1]")---
		SetFlag( OwnerID(), 544250, 1 )
	end
end
---------------------
function LuaS_423342_USECHECK()
	if	CountBodyItem( OwnerID(), 207692 )>=5	then
		return -1
	else	
		return 1
	end
end
function LuaS_423342_After()
	WriteRoleValue ( TargetID() , EM_RoleValue_Register6 , OwnerID() )
	BeginPlot(TargetID(), "LuaS_423342_1" , 0 )
	return	true							
end

function LuaS_423342_1()
	local Player = ReadRoleValue(OwnerID(),EM_RoleValue_Register6 )
	local KK = LuaFunc_CreateObjByOBj( 104079, OwnerID() )
	SetAttack( KK , Player )
	AddToPartition( KK , 0 )
	BeginPlot(KK, "LuaQ_423342_sui" , 0 )						
end
function LuaQ_423342_sui() 
	LuaFunc_Obj_Suicide(6)
end

function LuaQ_423342_complete()
	DisableQuest(OwnerID() ,true)
	Say( OwnerID(), "[SC_423342_1]" );---精靈聖王，請庇佑你的子民。
	sleep(30)
	CastSpell( OwnerID(), OwnerID(), 495919 )----尚未尋找適合的
	sleep(20)
	Say( OwnerID(), "[SC_423342_2]" );--帶領我們遠離黑暗。
	DisableQuest(OwnerID() ,flase)
end
--------------------------------------------------------
-------------423343
function LuaI_207693_0()
	if	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1	then
		return false
	end
	if CheckAcceptQuest( OwnerID() , 423343) == false or CountBodyItem( OwnerID() , 207694 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 103993  or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 or ReadRoleValue( TargetID() , EM_RoleValue_Register) >0  or   CheckBuff(TargetID(),507173) ==true    then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_1]" , 0 ) --目標不正確
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_1]" , 0 )
		return false
	end
--檢查是否死亡
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 110 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_3]" , 0 )
		return false
	end
	return true
end

function LuaI_207693_1()
	UseItemDestroy()
	WriteRoleValue( TargetID() ,EM_RoleValue_Register , 1 )
	BeginPlot( TargetID() , "LuaI_207693_2" , 0 )
	GiveBodyItem( OwnerID() ,207694 , 1 )
end

function LuaI_207693_2()
	CastSpell( OwnerID() , OwnerID() , 491032)----尚未有法術
	sleep(10)
	Hide( OwnerID() )
    	local QQ = DW_Rand(100)
    		if QQ > 50   then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
	  		SetRoleCamp(KK , "Visitor" )
			Say( KK, "[SC_207693_1]" )---唔...好熟悉的聲音在迴響...是大地的哭泣...
	PlayMotion( KK ,     ruFUSION_ACTORSTATE_EMOTE_STRETCH )
			sleep(20)
			Say( KK, "[SC_207693_2]" )---但為了力量、為了繁星湧泉。
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			sleep(20)
			Say( KK, "[SC_207693_3]" )--這些都是可以被捨棄的...
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_BUFF_BEGIN )
			--- ruFUSION_MIME_BUFF_SP01
			sleep(20)
			Say( KK, "[SC_207693_4]" )--不該為此感到悲傷才對。
			local Dest = Role:new(OwnerID())
			local NewX = Dest :X()
			local NewY = Dest :Y()
			local NewZ = Dest :Z()
			MoveDirect( KK , NewX+50 , NewY , NewZ  )
			sleep(10)
			CallPlot(KK,"LuaFunc_Obj_Suicide",30)
		elseif QQ <= 50 and QQ > 20 then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
			SetRoleCamp(KK , "Visitor")
			Say( KK, "[SC_207693_5]" )----奇怪的聲音，在心中迴響著...
	PlayMotion( KK ,     ruFUSION_ACTORSTATE_EMOTE_STRETCH )
			sleep(20)
			Say( KK, "[SC_207693_6]" )--曾幾何時，沒有停下腳步，與風合吟，仰望星芒？
			sleep(20)
			Say( KK, "[SC_207693_7]" )--自然的詠嘆...早已被遺棄...
			sleep(20)
			Say( KK, "[SC_207693_8]" )--為了力量...黑暗就在我們面前。
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			sleep(20)
			SetRoleCamp(KK ,"Monster")
			CallPlot(KK,"LuaFunc_Obj_Suicide",60)
		elseif QQ > 50 and QQ  <= 75 then
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
			Say( KK, "[SC_207693_9]" )---頭好痛...奇怪的聲音湧入了腦海，你對我做了什麼？
			if CheckID( TargetID()  ) == true then
				SetAttack(KK,TargetID())
			end
    		  	CallPlot(KK,"LuaFunc_Obj_Suicide",60)
    		else
			local KK = LuaFunc_CreateObjByObj( 103993 , OwnerID() )
			AddBuff(KK,507173,1,60)
			if CheckID( TargetID()) == true then
	    			ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_207693_10]" , 0 )----[103993]似乎沒有受到太大的影響，隨即撲向你而來。
	    		  	SetAttack(KK,TargetID())
			end
    		  	CallPlot(KK,"LuaFunc_Obj_Suicide",60)
    		  end
     	Sleep(30)
	WriteRoleValue( OwnerID()  ,EM_RoleValue_Register , 0 )
     	Sleep(150)
        	LuaFunc_ResetObj( OwnerID() )
end
----------------------------------------------------------
---------(1)給予BUFF(507166)==>用來確認可不可以參與演戲(利用CASESPELL495913) 改為單人解(2)種出阿雷斯奔爾與樹人 (3)使用780565旗子。

function LuaS_423344_0()---115829(第二隻阿雷斯)的對話劇情
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423344)==true )and  (CheckFlag(OwnerID(),544251)==false )then
 		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 0 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423344_1]","LuaS_423344_2",0)--- 怎麼了嗎？
		end
		if	ReadRoleValue( TargetID() , EM_RoleValue_Register+1  ) == 1 then
			AddSpeakOption(OwnerID(),TargetID()," [SC_423344_1]","LuaS_423344_1",0)--- 怎麼了嗎？
		end
	end
end
function LuaS_423344_1()---有人在演戲時，所出現的對話。
	SetSpeakDetail(OwnerID(),"[SC_423344_2]")---
end

function LuaS_423344_2()---沒有人演戲，要開演。
	CloseSpeak( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423344)==true )and  (CheckFlag(OwnerID(),544251)==false )then
		WriteRoleValue( TargetID(), EM_RoleValue_Register+1 ,1) 
		BeginPlot( TargetID() , "LuaS_423344_3" , 0 )
	end
end
function LuaS_423344_3()---種出兩隻演戲。 設定MM是妮克絲  KK是阿雷斯
	AddBuff(TargetID(),507166,1,60)
	local KK = Lua_DW_CreateObj("flag" ,115831,780565,0,1 )---
	local MM = Lua_DW_CreateObj("flag" ,115830,780565,1,1 )---
	DisableQuest( KK ,true )
	DisableQuest( MM ,true )
	AdjustFaceDir( KK , MM, 0 )
	AdjustFaceDir(MM ,KK, 0 )
	SAY(KK,"[SC_423344_3]")---[115830]，這些年別來無恙？我可是從未忘卻妳讓族人陷入墮落這個事實。
	PlayMotion( KK ,  ruFUSION_ACTORSTATE_EMOTE_POINT)	
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_4]")---你可以責備我，但不能不對你的族人伸出援手。
	sleep(20)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_5]")--我早說過要妳停止吸取自然之力，妳與伊利雅爾忘卻了精靈聖王所教導的一切，汙衊、踐踏了精靈的榮耀。
	PlayMotion( KK ,    ruFUSION_ACTORSTATE_SHIELD_BASH  )
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_6]")--所以我說我錯了...
	sleep(20)
	SAY(KK,"[SC_423344_7]")---一句錯了，不能改變什麼。
	PlayMotion( KK ,  ruFUSION_ACTORSTATE_EMOTE_POINT)			
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(20)
	SAY(MM,"[SC_423344_8]")---所以我找你來，想要彌補我的過錯。
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and 	GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(30)
	SAY(KK,"[SC_423344_9]")---那些都不重要，我要知道妳又對我的族人做了什麼？讓他們如此耽溺在自然之力中。
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	sleep(30)
	SAY(MM,"[SC_423344_10]")--是黑影...在那之後，黑影數次的襲擊，讓精靈逐漸崩頹，也讓[115636]逐漸敏感。
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end
				
	SAY(MM,"[SC_423344_11]")--同時有股奇怪的力量在影響著他們，造成他們的渴望。
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and 	 (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_12]")---奇怪的力量...比起其他，我更懷疑妳！
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	local LL = Lua_DW_CreateObj("flag" ,115832,780565,2,1 )---艾洛
	DisableQuest(LL ,true )
	BeginPlot(LL, "LuaS_423344_4" , 0 )
	sleep(20)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if      CheckID( TargetID() )== true and 	 (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250	and  CheckID( KK )== true  then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			delobj(LL)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(MM,"[SC_423344_13]")---我可以以樹人之歌為誓...
	sleep(30)
		if 	CheckID( TargetID() )== false  or (CheckAcceptQuest(TargetID(),423344)==false) or GetDistance( TargetID() , OwnerID() ) >250 then
					if     	 CheckID( TargetID() )== true and  (CheckAcceptQuest(TargetID(),423344)==true) and  GetDistance( TargetID() , OwnerID() ) >250 and  CheckID( KK )== true 	 then
						ScriptMessage( TargetID() , TargetID() , 1 , "[SC_423349_11]" , 0 ) --超出距離，您沒有完成任務。
						ScriptMessage( TargetID()  , TargetID() , 0 , "[SC_423191_11]" , 0 ) --超出距離，您沒有完成任務。
					end		
			CancelBuff( TargetID() , 507166)
			delobj(KK)
			delobj(MM)
			delobj(LL)
			WriteRoleValue( OwnerID(), EM_RoleValue_Register+1 ,0)
		end

	SAY(KK,"[SC_423344_14]")---妳以為...
	PlayMotion( KK ,   ruFUSION_ACTORSTATE_EMOTE_SPEAK)	
	sleep(30)
	SAY(KK,"[SC_423344_15]")---這是...
	
	if 	CheckID( TargetID() )== true and (CheckAcceptQuest(TargetID(),423344)==true) and  	CheckBuff( TargetID() , 507166) ==true	  and GetDistance( TargetID() , OwnerID() ) <250 and  CheckID( KK )== true  then
		SetFlag( TargetID(), 544251, 1 )
	end
	sleep(10)
	CancelBuff( TargetID() , 507166)
	delobj(KK)
	delobj(MM)
	delobj(LL)
	WriteRoleValue(OwnerID(), EM_RoleValue_Register+1 ,0)
end

function LuaS_423344_4()---LL移動。---艾洛貝尼雅的位置  必須在上面種115834、115833
	SAY(OwnerID(),"[SC_423344_LL_1]")
	sleep(10)
	DW_MoveToFlag(OwnerID() ,780565,3, 0,1)-----定點---暈厥,倒地。
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)

end

function LuaS_423344_LL()--特效---暗色的特效 (還未挑選適合ㄉ)
	while true do
		sleep(20)
		CastSpell( OwnerID(), OwnerID(),  492667)
	end
end

-------------423345--------------
function LuaI_207695_0()---檢查用 
	local OrgID = 0
	if	ReadRoleValue(OwnerID(), EM_RoleValue_IsDead)==1	then
		return false
	end
	if CheckAcceptQuest( OwnerID() , 423345) == false or CountBodyItem( OwnerID() , 207696 ) >= 3 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --目前不需要使用這個物品
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	if CheckID( TargetID() ) == true then
		OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	end
	if  CheckBuff( TargetID() , 504004 ) == true  then
		return false
	end
	if OrgID ~= 104002   then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_207695_1]" , 0 ) ---[207696]似乎只能針對[104002]使用。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_207695_1]" , 0 )
			return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_IsDead)==1	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422565_2]", 0 ); 
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 130 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_2]" , 0 ) --目標距離過遠
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_2]" , 0 )
		return false
	end
	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207695_2]", 0 ); ----[104002]極力掙扎中，你無法順利使用[207696]。
			return false
	end
	return true
end
function LuaS_207695_1()
	if GiveBodyItem( OwnerID() ,  207696 , 1 )  then
		AddBuff( TargetID() , 504004 , 0 , 30 )
		UseItemDestroy( OwnerID() )---正在使用的物品
	end
	Hide(TargetID())
	BeginPlot( TargetID() , "LuaS_207695_2" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_207695_3]", 0 ); -------你抓到[104002]了！
end

function LuaS_207695_2()
	sleep(100)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_423345_complete()---利用這個旗子780545  最後給重要旗標 544252 KK是妮克絲 MM是艾洛
	local MM = Lua_DW_CreateObj("flag" ,115836,780565,3,0)--- 要讓他動作 
	AddBuff(TargetID(),507167,1,30)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local KK = Lua_DW_CreateObj("flag" ,115835,780565,1,1 )---
	SetDefIdleMotion(MM,ruFUSION_MIME_SLEEP_LOOP)
	AddToPartition( MM,0 )
	DisableQuest( KK ,true )
	DisableQuest( MM ,true )
	SAY(KK,"[SC_423345_0]")---去除腐敗，傷痕才能癒合...
	sleep(30)
	CastSpell( KK  , KK , 495235) ----尚未挑特效
	local MON = {}---怪物陣列
	for i=1,3,1 do
		MON[i]= Lua_DW_CreateObj("flag",115837,780545,3+i)
		BeginPlot(MON[i] , "LuaS_423345_MON" , 0 )
		DisableQuest( MON[i] ,true )
	end
	sleep(30)
	SAY(MM,"[SC_423345_1]")
	sleep(20)
	SAY(KK,"[SC_423345_2]")
	sleep(10)
	delobj(KK)
	delobj(MM)
	CancelBuff( TargetID() , 507167)
	DisableQuest( OwnerID() ,false )
	SetPlot( OwnerID() , "touch" , "" , 0 )
end
function LuaS_423345_MON()
	DW_MoveToFlag(OwnerID() ,780545,2, 0,1)--要在加動作
	local Player = SearchRangePlayer ( OwnerID() , 300 )
	for i=0,table.getn(Player)-1 do
		if (CheckCompleteQuest( player[i], 423345 )==true) and	(CheckAcceptQuest( player[i] , 423347 ) == false ) and CheckFlag( player[i],542415)==false and CheckBuff(player[i] , 507167 )== true  then
			SetFlag(player[i],542415,1)
		end
	end
	sleep(30)
	DW_MoveToFlag(OwnerID() ,780545,1, 0,1)
	delobj(OwnerID())
end
-------423346
function LuaS_423346_complete()
	AddBuff(TargetID(),507168,1,20)
	DisableQuest( OwnerID() ,true )
	SetPlot( OwnerID() , "touch" , "LuaFunc_Obj_BUSY" , 50 )
	local MM = LuaFunc_SearchNPCbyOrgID( OwnerID() , 115833 , 200 )
	local KK = Lua_DW_CreateObj("flag" ,115969,780565,0,1 )---
	DisableQuest( MM ,true )
	DisableQuest( KK ,true )
	SAY(KK,"[SC_423346_0]")---得喂她喝下[207697]...
	DW_MoveToFlag(KK ,780545,3, 0,1)
	PlayMotionEX( KK  , ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	sleep(20)
	SAY(MM,"[SC_423346_1]")--咳咳咳...
	sleep(10)
	AdjustFaceDir( MM , KK, 0 )
	PlayMotion( KK  , ruFUSION_ACTORSTATE_CROUCH_END)
	SAY(KK,"[SC_423346_2]")--接下來，就是等待了。
	DW_MoveToFlag(KK ,780565,0, 0,1)
	delobj(KK)
	if 	CheckID( TargetID() ) == true  then
		CancelBuff( TargetID() , 507168)
	end
	DisableQuest( OwnerID() ,flase )
	SetPlot( OwnerID() , "touch" , "" , 50 )
	DisableQuest( MM ,flase )
end
--------------------
function LuaS_423347_0()---115850(艾貝)的對話劇情
	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423180_1]","LuaS_423347_1",0)--- 
	end
end
function LuaS_423347_1()
	SetSpeakDetail(OwnerID(),"[SC_423347_1]")---
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423347_2]","LuaS_423347_2",0)---什麼黑影？
	end
end
function LuaS_423347_2()
	SetSpeakDetail(OwnerID(),"[SC_423347_3]")---
	if (CheckAcceptQuest(OwnerID(),423347)==true )and  (CheckFlag(OwnerID(),544252)==false )then
		AddSpeakOption(OwnerID(),TargetID()," [SC_423347_4]","LuaS_423347_3",0)---什麼黑影？
	end
end
function LuaS_423347_3()
	SetSpeakDetail(OwnerID(),"[SC_423347_5]")---
	SetFlag( OwnerID(), 544252, 1 )
end
----------
function LuaS_423347_4()---物品207698
	ClearBorder( OwnerID())
	AddBorderPage( OwnerID(), "[SC_423347_6]");
	AddBorderPage( OwnerID(), "[SC_423347_7]");
	AddBorderPage( OwnerID(), "[SC_423347_8]");
	AddBorderPage( OwnerID(), "[SC_423347_9]");
	ShowBorder( OwnerID(), 0, "[207698]", "ScriptBorder_Texture_Paper" )	
end