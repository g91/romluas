
---------------------跟樹人聊天
function LuaS_422128()  

	LoadQuestOption( OwnerID() )
	if (CheckAcceptQuest(OwnerID(),422128)==true )and( CheckCompleteQuest( OwnerID() , 422128) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422128]","LuaS_422128_1",0) --你為何會出現在這裡？
	end

	if (CheckAcceptQuest(OwnerID(),422130)==true )and( CheckCompleteQuest( OwnerID() , 422130) == false)then
		AddSpeakOption(OwnerID(),TargetID(),"[SC_422130_3]","LuaS_422130_1",0) --你想到什麼關於小樹人脾氣暴怒的原因？
	end
end

function LuaS_422128_1()  

	SetSpeakDetail(OwnerID(),"[SC_422128_1]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422128_2]","LuaS_422128_2",0) --抱歉打斷你，但是我還是不知道你為什麼會出現在這裡？
end

function LuaS_422128_2()  

	SetSpeakDetail(OwnerID(),"[SC_422128_3]")
	SetFlag(OwnerID() , 542440 , 1 )
end


function LuaS_422130_1()  ---------------------小樹人暴怒的原因

	SetSpeakDetail(OwnerID(),"[SC_422130]")
	AddSpeakOption(OwnerID(),TargetID(),"[SC_422130_1]","LuaS_422130_2",0) --嗯....是的...樹人的詩歌確實非常美妙動人...
end

function LuaS_422130_2()  

	SetSpeakDetail(OwnerID(),"[SC_422130_2]")
	SetFlag(OwnerID() , 542441 , 1 )
end

-------------------跟樹人玩遊戲

function LuaS_422129()  


	if (CheckAcceptQuest(OwnerID(),422129)==true )then
		if ( CheckFlag( OwnerID() , 542443 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_1]","LuaS_422129_1",0) --我覺得答案是：語風岩的鳥
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_2]","LuaS_422129_1",0) --我覺得答案是：蠑螈
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_3]","LuaS_422129_2",0) --我覺得答案是：獅魚人
		end

		if ( CheckFlag( OwnerID() , 542443 )==true)and(CheckFlag( OwnerID() , 542444 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129_8]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_9]","LuaS_422129_1",0) --我覺得答案是：山魔楊草
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_10]","LuaS_422129_5",0) --我覺得答案是：水骨葉
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_11]","LuaS_422129_1",0) --我覺得答案是：月石斛
		end

		if (CheckFlag( OwnerID() , 542444 )==true)and(CheckFlag( OwnerID() , 542470 )==false)then
			SetSpeakDetail(OwnerID(),"[SC_422129_12]")
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_13]","LuaS_422129_6",0) --小樹人你怎麼了？我們趕快來玩遊戲吧！
		end

		if (CheckFlag( OwnerID() , 542470 )==true)and(CountBodyItem( OwnerID(), 204132 )<3)then
			LoadQuestOption( OwnerID() )
			AddSpeakOption(OwnerID(),TargetID(),"[SC_422129_16]","LuaS_422129_10",0) --我把小樹人讚嘆弄丟了，可以再給我一個嗎？
		end
	else
		LoadQuestOption( OwnerID() )
	end
	
end

function LuaS_422129_1()  
	
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "LuaS_422129_3" , 0 )
end

function LuaS_422129_2()  

	CloseSpeak( OwnerID() )
	SetFlag(OwnerID() , 542443 , 1 )
	BeginPlot( TargetID() , "LuaS_422129_4" , 0 )
end

function LuaS_422129_3()  

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422129_4]" )---你答錯囉！
	sleep(20)
	Say( OwnerID() , "[SC_422129_5]" )---可見你平常都沒有用心領略自然的奧妙，觀察四周的變化.....
	sleep(20)
	Say( OwnerID() , "[SC_422129_6]" )---你答錯，要繼續當鬼，我要跑去躲起來了！等你想到答案之後，再來抓我吧～
	sleep(30)
	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(20)
	DisableQuest( OwnerID() , false )
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422129_4()  

	DisableQuest( OwnerID() , true )
	Say( OwnerID() , "[SC_422129_7]" )---恭喜你答對了！你真是個令樹人讚嘆的傢伙～再來陪我玩吧，我要繼續跑去躲起來囉！
	GiveBodyItem( TargetID(), 204132, 1 )
	sleep(30)
	CastSpell( OwnerID(),OwnerID(),491010)
	sleep(20)
	DisableQuest( OwnerID() , false )
	Hide( OwnerID() )
	sleep(400)
	LuaFunc_ResetObj( OwnerID() )
end

function LuaS_422129_5()  

	CloseSpeak( OwnerID() )
	SetFlag(OwnerID() , 542444 , 1 )
	BeginPlot( TargetID() , "LuaS_422129_4" , 0 )
end

function LuaS_422129_6()  

	CloseSpeak(OwnerID())
	BeginPlot(TargetID(),"LuaS_422129_7",0)
end

function LuaS_422129_7()  
						
	DisableQuest( OwnerID() , true )
	local ANPC = ReadRoleValue( TargetID(), EM_RoleValue_DBID ) 
	CastSpell( OwnerID(),OwnerID(),490098)
	sleep( 10 )
	SetFlag( TargetID() , 542469, 0 )
	local NPC = LuaFunc_CreateObjByObj ( 101750 , OwnerID() )
	MoveToFlagEnabled ( OwnerID() , false )
	Hide( OwnerID() )
	SetPlot(NPC,"dead" , "LuaS_422129_8",0)
	BeginPlot(NPC,"LuaS_422129_9",0)
	SetAttack( NPC , TargetID() )
	Say( NPC , "[SC_422129_14]" ) --你沒看見我正在認真思考事情嗎？竟然打斷我的思考，太可惡了！
	sleep( 10 )
	while true do
		if CheckID(NPC) == false then
			sleep( 10 )
			Show( OwnerID() , 0 )
			sleep( 10 )
			if  Luafunc_Player_Alive( TargetID(),ANPC,250 ) == true and ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 and CheckFlag( TargetID() , 542469 ) == true then 
				Say( OwnerID() , "[SC_422129_15]" ) --哇！你的力氣真大，打得我好疼喔～不過我到底是怎麼了？怎麼會突然這麼生氣？
				SetFlag(TargetID() , 542470 , 1 )
				GiveBodyItem( TargetID(), 204132, 1 )	
			end
			sleep( 50 )
			MoveToFlagEnabled ( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		sleep( 10 )
	end
end


function LuaS_422129_8()
	if  ReadRoleValue( TargetID(), EM_RoleValue_IsDead) ~= 1 then 
		SetFlag( TargetID() , 542469, 1 )
	end	
	Delobj( OwnerID() )
	return false
end

function LuaS_422129_9()
	LuaFunc_Obj_Suicide(50)
end

function LuaS_422129_10()

	SetSpeakDetail(OwnerID(),"[SC_422129_17]")
	GiveBodyItem( OwnerID(), 204132, 1 )	
end














