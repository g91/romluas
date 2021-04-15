--藍色冰結花
function LuaQ_420283_Complete()
	SetPlot( OwnerID() , "Touch" , "LuaFunc_Obj_Nothing" , 40 )	
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_CRY )
	sleep( 30 )
	SetPlot( OwnerID() , "Touch" , "" , 0 )
end
--------------------------------------------------------------------------------------------------------
--鬧鬼
function LuaI_110263()
	SetPlot( OwnerID() ,"touch" , "LuaI_110263_Open",40)
end
function LuaI_110263_Open()
	if CountBodyItem( OwnerID() , 200909 ) > 0 then
		SetPlot( TargetID() ,"touch" , "LuaFunc_Obj_Nothing",40)
		--這裡接開門的函式
		Say(OwnerID(),"這扇門打開了")
		DelBodyItem( OwnerID() , 200909 , 1 )
		BeginPlot(TargetID() , "LuaI_110263_Close" , 0 )
	else
		Say(OwnerID(),"這扇門鎖住了")
	end
end
function LuaI_110263_Close()
	sleep( 100 )
	--這裡接關門的函式
	SetPlot( OwnerID() ,"touch" , "LuaI_110263_Open",40)
	Say(TargetID(),"這扇門關上了")		
end
-----------------------------------------------------------------------------------------------------------
--絲蘋的袋子
function LuaQ_420297_Accept()
	Hide( OwnerID() )
	sleep( 300 )
	Show( OwnerID() , 0 )
end
-----------------------------------------------------------------------------------------------------------
--寶箱鑰匙
--這裡放寶箱鑰匙開啟任務的劇情
--------------------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------------------
--沃夫摸索大喊
function LuaQ_420590_Complete()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 50 )
	say(OwnerID(), GetString("SAY_420590_0"))
end
------------------------------------------------------------------------------------------------------
function LuaQ_420593_Complete()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 100 )
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_CRAFTING_END)
	sleep( 50 )
	say(OwnerID(), GetString("SAY_420593_0"))
end
-----------------------------------------------------------------------------------------------------



