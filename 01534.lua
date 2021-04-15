function LuaS_422726_0()-----掛在物品SERVER端劇情...米米過場任務
	if ReadRoleValue(TargetID(),EM_RoleValue_OrgID) ~= 102648	then -------
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_0]", 0 ); -----這個[205871]似乎只能對[113447]使用。
		return false
	end

	if GetDistance(TargetID(), OwnerID() ) > 120  then -------距離
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_4]", 0 ); -----距離太過遙遠，無法使用[205871]。
		return false
	end

	if	ReadRoleValue(TargetID(),EM_RoleValue_HP)/ReadRoleValue(TargetID(),EM_RoleValue_MaxHP)	>0.5	then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_1]", 0 ); ----[113447]極力掙扎中，你無法順利使用[205871]。
		return false
	end


	if	ReadRoleValue( TargetID(), EM_RoleValue_IsDead) == 1 then
			ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204638_6]" , 0 ) --牠已經死了。
			ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204638_6]" , 0 )
		return false
	end

--	if ReadRoleValue(TargetID(),EM_RoleValue_IsAttackMode) ~= 0 and then -------
	--	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_5]", 0 ); -----這個[205871]似乎只能對[113447]使用。
	--	return false
	--end
	return true
end

function LuaS_422726_1()
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422726_2]", 0 ); -------你抓到[113447]了！
	DelBodyItem(OwnerID(),205871,1)
	GiveBodyItem(OwnerID(),205872,1)
	CallPlot(TargetID(),"LuaFunc_ResetObj",TargetID())
	UseItemDestroy() 
end
-------------------------------------------------------------------------
function LuaS_422727_0()----尋找小花
	if (CheckCompleteQuest(OwnerID(),422742)==true ) then
		if 	(CheckAcceptQuest(OwnerID(),422877)==false )  then
			SetSpeakDetail( OwnerID(), "[SC_422727_777]"  ) 
		end
		if 	(CheckAcceptQuest(OwnerID(),422877)==true )  then
			SetSpeakDetail( OwnerID(), "[SC_422877_1]"  ) 
		end
	elseif (CheckAcceptQuest(OwnerID(),422877)==true )  and (CheckCompleteQuest(OwnerID(),422727)==true ) then
		SetSpeakDetail( OwnerID(), "[SC_422877_1]"  ) 
	else
  		LoadQuestOption( OwnerID())
	end

	if (CheckAcceptQuest(OwnerID(),422877)==true )and(CheckFlag(OwnerID(),543509)==false )  then
		if  (CheckFlag(OwnerID(),543515)==true )  then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_4]","LuaS_422877_4",0) 
		end
		if  CountBodyItem( OwnerID() , 206454 ) > 0 	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422877_2]","LuaS_422877_3",0)
		end
	end

	if (CheckAcceptQuest(OwnerID(),422727)==true )and (CheckFlag(OwnerID(),543295)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID )  == 0)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_1]","LuaS_422727_1",0) --那是當然的！我會讓[113447]帶著我去！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_2]","LuaS_422727_2",0) --什麼秘密基地啊 ？我不想去！
	end
	if (CheckAcceptQuest(OwnerID(),422727)==true ) and (CheckFlag(OwnerID(),543295)==false )and(ReadRoleValue( TargetID() , EM_RoleValue_PID ) >=1)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_1]","LuaS_422727_7",0) --那是當然的！我會讓[113447]帶著我去！
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_2]","LuaS_422727_2",0) --什麼秘密基地啊 ？我不想去！
	end
end



function LuaS_422727_1()---使用旗標  780432  重要物品 小花控制器
                CloseSpeak( OwnerID())
	BeginPlot( TargetID(), "LuaS_422727_3", 0)
                end
function LuaS_422727_3()
               	local MM = Lua_DW_CreateObj("flag",113447,780432, 0 )
               	WriteRoleValue(OwnerID(),EM_RoleValue_PID,1)
                Yell(OwnerID(),"[SC_422727_4]",0)-----好，[113447]要乖乖帶著[$PLAYERNAME]唷！
                Yell(MM,"[SC_422727_5]",1)--汪嗚～  
               	DW_MoveToFlag( MM , 780432 , 1, 0 ,1 )
	DW_MoveToFlag( MM , 780432 , 2, 0 ,1 )
	Yell(MM,"[SC_422727_6]",0)--汪嗚......汪嗚......
	DW_MoveToFlag( MM , 780432 , 7, 0 ,1 )
                Yell(MM,"[SC_422727_6]",0)--汪嗚......汪嗚......
          	DW_MoveToFlag( MM , 780432 , 8, 0 ,1 )
	sleep(20)
	DW_MoveToFlag( MM , 780432 , 9, 0 ,1 )
          	DW_MoveToFlag( MM , 780432 , 10, 0 ,1 )
                Yell(MM,"[SC_422727_6]",0)--汪嗚......汪嗚......
	sleep(20)
             	DW_MoveToFlag( MM , 780432 , 3 , 0  ,1 )
                Yell(MM,"[SC_422727_7]",3)--汪嗚～汪嗚～汪汪。
	sleep(20)
	ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422727_8]", 0 ); 
                sleep(20)             
              	local FF = Lua_DW_CreateObj("flag",113452 ,780432,4)
                DisableQuest(FF,true)
                DW_MoveToFlag( FF , 780432 , 5, 0 ,1 )
                Yell(FF,"[SC_422727_9]",2)----死狗，吵什麼吵？
	sleep(20)
	Yell(MM,"[SC_422727_7]",0)
	DW_MoveToFlag( MM , 780432 , 6 , 0 ,1 )
	sleep(20)                
	Yell(FF,"[SC_422727_10]",3)--- 喂，你是那隻死狗帶來這的嗎？
	sleep(20)
	if CheckID( TargetID() ) == true and CheckAcceptQuest(TargetID() , 422727) == true then
	                SetFlag(TargetID(),543294,1)   
	end
                sleep(25)
                DelObj(MM)
	WriteRoleValue(OwnerID(), EM_RoleValue_PID,0)
	sleep(25)
                DisableQuest(FF,false)
                DelObj(FF)
end

function LuaS_422727_7()
	SetSpeakDetail(OwnerID(),"[SC_422727_11]")---嗚～[113445]是笨蛋，趁著[113445]說話時偷溜走。
end		

function LuaS_422727_2()
	SetSpeakDetail(OwnerID(),"[SC_422727_3]")---你真的不想去秘密基地嗎？裡頭有好多好多和你一樣的人唷～
end	

function LuaS_422727_8()
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422727)==true )and ( CheckFlag(OwnerID(),543295)==false ) then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_12]","LuaS_422727_9",0)---是的，請問你是小花嗎？
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422727_15]","LuaS_422727_10",0)---請問這裡有個叫小花的人嗎？         

               end
end

function LuaS_422727_9()
             	SetSpeakDetail(OwnerID(),"[SC_422727_13]")---是誰？誰允許你叫我小花的？又是那個傻妞帶來的人？
	SetFlag(OwnerID(),543295,1)
end

function LuaS_422727_10()
             	SetSpeakDetail(OwnerID(),"[SC_422727_14]")---小花？這裡沒有這個人！
end

--------------------------------------------------------
---------------------------------------------------------------------------
function LuaS_422729()------受傷的士兵對話
             	LoadQuestOption( OwnerID() )
                if (CheckAcceptQuest(OwnerID(),422729)==true )and  (CheckFlag(OwnerID(),543297)==false )then
                    AddSpeakOption(OwnerID(),TargetID(),"[SC_422729_1]","LuaS_422729_1",0)---1.	怎麼了嗎？

               end
end

function LuaS_422729_1()
             	SetSpeakDetail(OwnerID(),"[SC_422729_2]")---2.	咳咳～沒什麼……
	SetFlag(OwnerID(),543297,1)
end

--------------------------------------------------------------

---------釋放炎魔  炎魔反應 有2個 ，1.順利取得東西，變成SNPC(30秒後刪掉) 2.沒有順利取下，直接攻擊玩家。

function LuaI_205878_Check()----物品檢查劇情
	if CheckAcceptQuest( OwnerID() , 422732 ) == false or CountBodyItem( OwnerID() , 205875 ) >= 5 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_0]" , 0 ) --目前不需要這個東西
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_0]" , 0 )
		return false
	end
	local OrgID = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if OrgID ~= 102512 or ReadRoleValue( TargetID() , EM_RoleValue_IsDead) == 1 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205878_3]" , 0 ) --無法對[102512]以外的生物使用。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205878_3]" , 0 )
		return false
	end
	if GetDistance( OwnerID() , TargetID() ) > 150 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_205878_4]" , 0 ) --距離[102512]過遠，[205878]無法發揮效能。
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_205878_4]" , 0 )
		return false
	end
	if ReadRoleValue( TargetID() , EM_RoleValue_IsAttackMode ) ~= 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_204592_3]" , 0 ) --目標正在戰鬥中
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_204592_3]" , 0 )
		return false
	end
	return true
end

function LuaI_205878_1()----使用物品後。
	if ReadRoleValue( TargetID() , EM_RoleValue_OrgID ) == 102512 then
		BeginPlot( TargetID() , "LuaI_205878_2" , 0 )
	end
end

function LuaI_205878_2()
	CastSpell( OwnerID() , OwnerID() , 491032)----施放法術在炎魔身上
	sleep(20)
	Hide( OwnerID() )
    	local KK = LuaFunc_CreateObjByObj( 102669 , OwnerID() )
    	local QQ = DW_Rand(100)
    		if QQ > 60   then
    		  SetRoleCamp(KK , "SNPC" )
		if CheckID( TargetID()  ) == true then
	    		  ScriptMessage(  TargetID()  , TargetID() , 1 , "[SC_205878_1]" , 0 )
    			  Givebodyitem(TargetID(),205875,1)
		end
    		  sleep(50)
    		  CallPlot(KK,"LuaFunc_Obj_Suicide",70)
    		else
		if CheckID( TargetID()  ) == true then
	    		  ScriptMessage( OwnerID() , TargetID() , 1 , "[SC_205878_2]" , 0 )----你沒有解開[102512]身上的鎖。
		end
    		  sleep(350)
		if CheckID( TargetID()  ) == true then
	    		  SetAttack(KK,TargetID())
		end
    		  CallPlot(KK,"LuaFunc_Obj_Suicide",70)
    		  end
      			Sleep(50)
                                                 LuaFunc_ResetObj( OwnerID() )
end

-----------------------------------------------------------------------------------------------------------------------------------------------------------
-----摧毀熔爐
--function LuaS_422734_0()----觸碰劇情
	--SetPlot( OwnerID() , "touch" , "LuaI_422734_01" , 40 )
--end

function LuaQ_422734_BeforClick()
	if CountBodyItem( OwnerID() ,205876) < 1 then
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422734_1]" , 0 ) --你沒有任何的
		ScriptMessage( OwnerID(), OwnerID(), 0, "[SC_422734_1]" , 0 ) --你已經有一個[205424]了
		return -1
	else
		return 1
	end
end

--function LuaS_422734_1()---刪掉物品205876，給重要旗標543328。
	--if (CheckAcceptQuest(OwnerID(),422734)==true )and(CheckFlag(OwnerID(),543328)==false )and(CountBodyItem (OwnerID() ,205876)>0) then
	--DelBodyItem ( OwnerID() , 205876 , 1 )
	--Setflag(OwnerID(),543328)
   	--else
	--ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_422734_1]", 0 )--沒有[205876]，無法暗中破壞[113451]。
--end
--end
--------------------------------------------------------
function Lua_205881_0()---掛在暗哨的
	if Lua_ExGetZone( OwnerID())  == 9 	then
		if	DW_CheckDis(OwnerID(),780434,0,75)  and ( Checkflag( OwnerID() , 543326 ) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_4]", 0)---強烈的訊號， 由附近傳遞出，回應[205881]的聲響非常刺耳，傳遞至你的接收器上。
			SetFlag(OwnerID() , 543308,1) 
			return
		end
		if	DW_CheckDis(OwnerID(),780434,0,150)  and ( Checkflag( OwnerID() , 543326) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_3]", 0) ---清晰的訊號，由附近傳遞出，回應[205881]的聲響十分急促，傳遞至你的接收器上。
                                                SetFlag(OwnerID() , 543308,1)    
			return                                           
		end
		if	DW_CheckDis(OwnerID(),780434,0,300) and ( Checkflag( OwnerID() ,  543326 ) ==true )	then
			Sleep(10)
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_2]", 0 )--漸強的訊號，由[ZONE_THE BOILING VALLEY]內傳遞出，回應[205881]的聲響逐漸急促，傳遞至你的接收器上。
			return
		end        
		if             DW_CheckDis(205881,780434,0,500)  and ( Checkflag( OwnerID() ,  543326) ==true )	then
			ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_1]", 0 )--微弱的訊號，由[ZONE_THE BOILING VALLEY]內傳遞出漸為清晰的聲響，回應至你的接收器上。
			Sleep(10)
			return
		end
		if             DW_CheckDis(OwnerID(),780434,0,800) and ( Checkflag( OwnerID() , 543326) ==true )	then
                                               Sleep(10)
                                               ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_0]", 0 )--訊號微弱，斷斷續續的由[ZONE_THE BOILING VALLEY]方向傳來，回應到你的接受器上。
			return
                                end
                	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false then
                		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_5]", 0 )    ---接收器無法接收這個區域的訊號。
			return
		end
	else
		ScriptMessage( OwnerID(), OwnerID(), 1, "[SC_205881_5]", 0 )    ---接收器無法接收這個區域的訊號。

end
end



function Lua_113448_0()---艾森   旗標：780434  [隱型物件2]---有旗標後的表演
 	SetPlot( OwnerID() , "Range" , "LuaI_113448_1" , 100 )
end
function LuaI_113448_1()
                if(CheckAcceptQuest( OwnerID() , 422731 ) == true ) and ( Checkflag( OwnerID() , 543308 ) ==false ) and ( CountBodyItem( OwnerID() , 205881 ) >=1 ) then
               		 SetFlag(OwnerID() , 543308,1)
                      return
                end 
	if(CheckAcceptQuest( OwnerID() , 422731 ) == true ) and ( Checkflag( OwnerID() , 543308 ) ==true ) and ( CountBodyItem( OwnerID() , 205881 ) >=1 ) and ReadRoleValue( TargetID() , EM_RoleValue_PID ) == 0 then 
		WriteRoleValue( TargetID() , EM_RoleValue_PID , 1 )
                	BeginPlot(TargetID() , "LuaI_113348_2" , 0 )

	end
end
function LuaI_113348_2()
	local CC = Lua_DW_CreateObj("flag" ,113437,780434,1 )                
	local KK = Lua_DW_CreateObj("flag" ,113438,780434,2 )                
	local FF  = Lua_DW_CreateObj("flag" ,113439,780434, 3)
                DisableQuest( KK , true )
	DisableQuest( CC , true )
	DisableQuest( FF , true )
                DW_MoveToFlag( KK , 780434 , 4 , 0  ,1 )
	if CheckID(TargetID()) then
		AdjustFaceDir( KK, TargetID() , 0 )
	end
	PlayMotion( KK, ruFUSION_ACTORSTATE_EMOTE_WAVE)
                SAY(KK, "[SC_113348_1]")----噓~壓低聲音，過來這邊！
                SLEEP(30)
	PlayMotion( CC, ruFUSION_ACTORSTATE_EMOTE_POINT)
	if CheckID(TargetID()) then
		AdjustFaceDir( CC, TargetID() , 0 )
	end
                SAY(CC,"[SC_113348_2]")---冒險者，使用[205881]的人就是你對吧？
	SLEEP(20)
	SAY(CC,"[SC_113348_3]")--告訴我，為什麼[113444]的東西會在你手上？
	if CheckID( TargetID() ) == true and CheckAcceptQuest(TargetID() , 422731) == true then
         	       Setflag(TargetID() , 543309,1)
	end
                DisableQuest( KK , false )
	DisableQuest( CC , false )
	DisableQuest( FF , false)
	SLEEP(30)
                DelObj(KK)
	DelObj(CC)    
	DelObj(FF)    
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
END

---------------------------------------------------------------------------------------------------------------------------------------------------

-----------------------------------------------------------
function LuaI_205883() --信件內容
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), "[SC_205883]");
	ShowBorder( OwnerID(), 0, "[205883]", "ScriptBorder_Texture_Paper" );
end


-----------------------------------------
function LuaI_422731_0()
	if (CheckAcceptQuest(OwnerID(),422731)==true ) and (CountItem(OwnerID() ,205882)<= 0) then
		GiveBodyItem(OwnerID(),205882,2)
		GiveBodyItem(OwnerID(),205881,1)
	else
		GiveBodyItem(OwnerID(),205881,1)
	end
end

function LuaM_422568_11() --放在基本法術 503966 炸翻巨猿王上的觸發劇情
	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_1]" , 0)-----炸彈引信掉落，使用無效。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_1]" , 0)-----炸彈引信掉落，使用無效。
		UseItemDestroy()
		return false
            	else
		return true
end
end

function LuaM_422568_0() --放在基本法術 503966 炸翻巨猿王上的觸發劇情
	if	Lua_ObjAreaCheck(OwnerID() , 718) ==false	then
		ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_1]" , 0)-----炸彈引信掉落，使用無效。
		ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_1]" , 0)-----炸彈引信掉落，使用無效。
		return
              else
		BeginPlot( TargetID() , "LuaM_422568_1" , 0 )
end
end
function LuaM_422568_1() ----如果重彈的不是102515 102516 10213--1/3     102518 ~20  1/2      102512 102517---1/15 血             
	local OrgID = ReadRoleValue( OwnerID() , EM_RoleValue_OrgID )
	local MaxHP = ReadRoleValue(OwnerID() , EM_RoleValue_MaxHP )
		if  OrgID == 102515 or OrgID == 102516 or   OrgID == 102513  then
			sleep(10)
			if 	ReadRoleValue(  OwnerID() , EM_RoleValue_HP ) <= MaxHP/10	then
				BeginPlot(OwnerID() , "LuaM_503966_2" , 0 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --炸彈失誤，被怪物輕易的躲開。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) <= MaxHP/3 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) > MaxHP/3 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/3 )	
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return		
			end 
		end
		if  OrgID == 102518  or  OrgID == 102519   or   OrgID == 102520     then
			sleep(10)
			if 	ReadRoleValue(  OwnerID()   , EM_RoleValue_HP ) < MaxHP/2	then
				BeginPlot( OwnerID() , "LuaM_503966_2" , 0 )
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --炸彈失誤，被怪物輕易躲開。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) == MaxHP/2 and ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) > MaxHP/100 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , MaxHP/100)
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP )> MaxHP/2 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/2 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end 

		end	
		if  OrgID == 102517  or   OrgID == 102512   then
			sleep(10)
			if 	ReadRoleValue(  OwnerID() , EM_RoleValue_HP ) <= MaxHP/40	then
				BeginPlot( OwnerID() , "LuaM_503966_2" , 0 )	
				ScriptMessage( OwnerID() , OwnerID() , 1 , "[SC_422568_2]" , 0 ) --炸彈失誤，被怪物輕易躲開。
				ScriptMessage( OwnerID() , OwnerID() , 0 , "[SC_422568_2]" , 0 )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) <= MaxHP/15 then
				WriteRoleValue( OwnerID() , EM_RoleValue_HP , 10 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end
			if 	ReadRoleValue(  OwnerID()  , EM_RoleValue_HP ) >MaxHP/15 then
				AddRoleValue(  OwnerID() , EM_RoleValue_HP , -MaxHP/15 )
				AddBuff( OwnerID() , 503605 , 1 , 5 )
				PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_HURT_NORMAL )
				SetAttack( OwnerID() , TargetID() )
				return
			end 
	end
end




