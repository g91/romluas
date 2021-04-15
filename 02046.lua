function LuaWS_Frog01_0()

	SetIdleMotion( OwnerID() ,ruFUSION_ACTORSTATE_SIT_LOOP  )
	
	while 1 do
		Say(OwnerID(),"[SC_Frog01_0]")	--各位先生、各位小姐，歡迎來到格拉夫馬戲團，這裡有最偉大的魔法師，和最意想不到的驚異魔術！
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_1]")	--沒有一個地方，能看到比格拉夫馬戲團更棒的馬戲表演！
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_2]")	--這裡有各種珍稀的生物，你不用去當地，就能看見長腳奔跑的魚、兇猛的原人、吵鬧的波多，當然，還有會說話的青蛙。
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_3]")	--
		Sleep(100)
		Say(OwnerID(),"[SC_Frog01_4]")	--
		Sleep(100)

	Sleep(3000)
	end
end

function LuaWS_Magic_0()
	while 1 do
		local R=RandRange(1,2)		
				Beginplot (OwnerID(),"LuaWS_Magic_R",0)
	Sleep(600)
	end
end

function LuaWS_Magic_1()

	local Ball=Lua_DW_CreateObj("flag" ,116486,780740,1)
	local Rab=Lua_DW_CreateObj("flag" ,116487,780740,2)
	Hide(Rab)
	local Roo=Lua_DW_CreateObj("flag" ,116488,780740,3)
	Hide(Roo)
	local Lion=Lua_DW_CreateObj("flag",116491,780740,4)
	Hide(Lion)
	local Box=Lua_DW_CreateObj("flag",116492,780740,1)
	local g1=Lua_DW_CreateObj("flag",116489,780740,5)
	local g2=Lua_DW_CreateObj("flag",116490,780740,6)
	
end

----------

function LuaWS_Magicer_0()
	SetModeEx(OWNERID() ,EM_SetModeType_ShowRoleHead ,true) -----------秀出頭像框
	SetModeEx(OWNERID() ,EM_SetModeType_HideName ,false) 
	SetModeEx( OWNERID() , EM_SetModeType_NotShowHPMP, true )--不顯示血條
	while true do
		sleep(30)
		SysCastSpellLv(OwnerID(), OwnerID(), 495220,1)
	end
end

function LuaWS_Magicer_1()
	
	while true do
		sleep(30)
		CastSpellPos(OwnerID(),-7175,450,47680,496589 ,3)

		--CastSpell( OwnerID(), Ball, 496589 )  
		--SysCastSpellLv(OwnerID(), OwnerID(), 496589,1)
	end
end




----------
function LuaWS_monster1()
		LuaFunc_MoveAllFlag( OwnerID(), 780745 )  
		Sleep(10)
		ReSetNPCInfo( OwnerID() )  
end


	