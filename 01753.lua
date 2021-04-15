-------------------
-------------------


function LuaS_422050_114459()
--掛在老皮爾之下
	WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_LOOP)
	Sleep(100)
	while 1 do
		WriteRoleValue (OwnerID(), EM_RoleValue_IsWalk, 1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )--
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		Yell(OwnerID(),"[SC_422050_1]",3)		--夫人，請懲罰我吧～～
		Sleep(30)
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		--PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_LOOP)
		--Sleep(20)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SURRENDER)
		Sleep(20)
		DW_MoveToFlag(OwnerID(),780568,2,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		DW_MoveToFlag(OwnerID(),780568,3,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		DW_MoveToFlag(OwnerID(),780568,4,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		Say(OwnerID(),"[SC_422050_0]")	--小主人，老皮爾沒保護好你，老皮爾對不起你啊！
		Sleep(40)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		Sleep(30)
		DW_MoveToFlag(OwnerID(),780568,1,0,1)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )	--哭泣
		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_BEGIN)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CROUCH_LOOP)
		Sleep(3000)
	end
end

function LuaS_422050_114761()
--掛在老皮爾之下
	SetDefIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_CROUCH_LOOP)
end



-------------------
-------------------
function LuaS_422050_114458()
--掛在菲碧之下
	while 1 do
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CUTE2)
		Yell(OwnerID(),"[SC_422050_2]",3)	--
		Sleep(20)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY )
	
		Sleep(1800)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CRY   )
		Sleep(20)
		Say(OwnerID(),"[SC_422050_3]")
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_CUTE2 )
		Sleep(1800)
	end
end



-------------------
-------------------
function LuaS_422077_114422()
--掛在114422克麗蓓兒對話劇情之下	

	SetDefIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SLUMBER_LOOP)

end


function LuaS_422077_0()
--掛在解完任務422077之後，Owner是NPC


		DisableQuest( OwnerID() , true )					--鎖住npc
--		AddBuff( TargetID()  , 503977 , 1 , 300 ) 				--凍住玩家
		Sleep(30)
		local Jari = Lua_DW_CreateObj("flag" ,114689,780568,10) 	--種出傑若米
		
		
		Say(Jari ,"[SC_422077_0]")			
		--傑若米出現：媽媽，媽媽.......
		Sleep(20)
		AdjustFaceDir( OwnerID() , Jari ,0 )
		Say(Jari,"[SC_422077_1]")			
		--傑若米：媽媽，對不起，我沒有趕走那些盜匪，反而被他們──
		Sleep(30)
		
		Say(OwnerID(),"[SC_422077_2]")	
		--克麗蓓兒：傑若米，沒關係，只要你回來就好了！

		Sleep(30)

		PlayMotionEX( Jari ,ruFUSION_ACTORSTATE_CROUCH_BEGIN,ruFUSION_ACTORSTATE_CROUCH_LOOP)
		Say(Jari,"[SC_422077_3]")			
		--傑若米：能當你和父親的孩子，還有安娜貝這個可愛的妹妹，我很幸福。
	Sleep(30)
	PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_SLUMBER_END)

	Yell(OwnerID(),"[SC_422077_4]",3)	
	--克麗蓓兒：不！我怎麼摸不到你？
	Sleep(20)	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY)
	Sleep(40)

	
		Yell(Jari,"[SC_422077_5]",3)			
		--傑若米：媽媽，安娜貝怕寂寞，你和爸爸再幫我們添個弟弟或妹妹，替我陪伴她。	
		Sleep(20)
		Yell(Jari,"[SC_422077_6]",3)	
		--傑若米：我會永遠在你們身邊......
		PlayMotion( Jari ,ruFUSION_ACTORSTATE_CROUCH_END)
		Sleep(20)
		Yell(OwnerID(),"[SC_422077_7]",3)
		--克麗蓓兒：傑若米、傑若米......
		CastSpell(Jari,Jari,494840)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_SLUMBER_END)
		Sleep(20)
		CastSpell(Jari,Jari,490101)
		Hide(Jari)

		Sleep(30)
		PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY  )
		Sleep(30)
		PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_DAZED_BEGIN,ruFUSION_ACTORSTATE_DAZED_LOOP)

		
		Sleep(20)
	
		PlayMotionEX( OwnerID() ,ruFUSION_ACTORSTATE_SLUMBER_BEGIN,ruFUSION_ACTORSTATE_SLUMBER_LOOP)
--		CancelBuff( TargetID()  , 503977  ) 	--還玩家自由
		DisableQuest( OwnerID() ,false )
		SetFlag(TargetID(),543800,1)		--給旗標，隱去克麗蓓兒114422，現出114949
		Delobj(Jari)
		
end


---------------------------------------
---------------------------------------
function LuaS_422078_0() --掛在任務NPC西勒瑞的對話劇情
	LoadQuestOption(OwnerID())
	if	Checkflag(OwnerID(),543721)== true		then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422078_0]","LuaS_422078_1",0)		--「我依約來訪.......」
	end
end

function LuaS_422078_1()
	SetSpeakDetail(OwnerID(),"[SC_422078_1]")	--
	SetFlag(OwnerID(),543722,1)	--給旗標以完成任務
end



--------------------------------------------
--------------------------------------------
function LuaS_422078_114610()
--掛在正常的西勒瑞夫婦之下
	while 1 do
		Sleep(30)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(70)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(70)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_HEAD_NOD)
		Sleep(50)
		PlayMotion( OwnerID() ,  ruFUSION_ACTORSTATE_EMOTE_SPEAK	)
		Sleep(1800)
	end
end


--------------------------------------------
--------------------------------------------

--============================================================================================================	
--盜筆記
--============================================================================================================		
	
--老駝子114841

function LuaS_421598_0() --掛在任務NPC老駝子的對話劇情
	LoadQuestOption(OwnerID())
		if 	CheckAcceptQuest(OwnerID(),421598)==true 	and
			CountBodyItem( OwnerID() , 207030 )<1	then
			AddSpeakOption(OwnerID(),TargetID(),"[SC_421598_1]","LuaS_421598_1",0)	--你就是老駝子韓尼波？
		end
end

function LuaS_421598_1()
	SetSpeakDetail(OwnerID(),"[SC_421598_2]")	--你認識老駝子韓尼波？可是老駝子韓尼波不認識你這個醜到讓我想吐的小混蛋！
	AddSpeakOption(OwnerID(),TargetID(),"[SC_421598_3]","LuaS_421598_2",0)	--芮妮不會來了，她已經知道你做的事了。
end

function LuaS_421598_2()
	CloseSpeak(OwnerID())
	ScriptMessage(OwnerID(), OwnerID() , 1 , "[SC_421598_4]" , 0 )	
	ScriptMessage(OwnerID(), OwnerID() , 0 , "[SC_421598_4]" , 0 )	
	Beginplot(TargetID(),"LuaS_421598_3",0)
end

function LuaS_421598_3()
	DisableQuest( OwnerID() , true )
--	LockObj( OwnerID(), 1, TargetID() )	
	local ugly = Lua_DW_CreateObj("flag" ,103130,780571,1) 
	Hide(OwnerID())
    local player="here"
	local ugly1 = Lua_DW_CreateObj("flag" ,103311,780571,2) 
	local ugly2 =Lua_DW_CreateObj("flag" ,103311,780571,3) 
	SetAttack(ugly , TargetID())
	SetAttack(ugly1 , TargetID())
	SetAttack(ugly2, TargetID())
	Sleep(50)
	
	
	for i=1,60000,1 do
		if 	GetDistance( TargetID(), OwnerID()) >500   or
			ReadRoleValue(TargetID() , EM_RoleValue_IsDead)==1 	or
			CheckID(TargetID()) == false	then
			player="Nothere"
			break	
		end
		
		if 	CheckID(ugly) == false	then
			break
		end
		Sleep(10)
	end
	
	if player=="Nothere" then
		--Sleep(30)
		DW_MoveToFlag(ugly,780571,1,0,1)
		DW_MoveToFlag(OwnerID(),780571,1,0,1)
		Hide(ugly)
		DelObj(ugly)
--		LockObj( OwnerID(), 0, 0 )
		Show(OwnerID(),0)
		DisableQuest( OwnerID() , false )
--		LuaFunc_ResetObj( OwnerID())
		Sleep(30)
		Delobj(ugly1)
		Delobj(ugly2)
	end
	
	Sleep(30)
	
	if 	CheckID(ugly) == true 	then
		Yell(ugly,"[SC_421598_7]",3)
		SetStopAttack(ugly)
		SetStopAttack(ugly1)
		SetStopAttack(ugly2)
		DW_MoveToFlag(ugly,780571,1,0,1)
		DW_MoveToFlag(OwnerID(),780571,1,0,1)
		BeginPlot(ugly1,"LuaS_421598_4",1)
		BeginPlot(ugly2,"LuaS_421598_5",1)
		Hide(ugly)
		DelObj(ugly)
		Show(OwnerID(),0)
		Sleep(30)
		Delobj(ugly1)
		Delobj(ugly2)
		DisableQuest( OwnerID() , false )
	else
	
		Yell(ugly1, "[SC_421598_5]", 3 )
		Yell(ugly2, "[SC_421598_6]", 3 )
		SetStopAttack(ugly1)
		SetStopAttack(ugly2)
		BeginPlot(ugly1,"LuaS_421598_4",1)
		BeginPlot(ugly2,"LuaS_421598_5",1)

		Sleep(50)
		Show(OwnerID(),0)
		DisableQuest( OwnerID() , false )
--		LockObj( OwnerID(), 0, 0 )
--		 LuaFunc_ResetObj( OwnerID())
	end
			
end

	
function LuaS_421598_4()
	DW_MoveToFlag(OwnerID(),780571,4,0,1)
	Delobj(OwnerID())
end

function LuaS_421598_5()
	DW_MoveToFlag(OwnerID(),780571,5,0,1)
	Delobj(OwnerID())
end




-------------------------------
function Lua_421591_0()
	SetPlot(OwnerID(), "touch","Lua_421591_1", 20 )
end

Function Lua_421591_1()
	if	CheckAcceptQuest(OwnerID(),421594)==false then
		SetFlag(OwnerID(),543799,1)

		DW_Border(421594) 
	end
end




		