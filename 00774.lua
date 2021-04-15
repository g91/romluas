-------------------------------------------------------怪異符文

function LuaI_202683_0() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421339, 1  ) )
	ShowBorder( OwnerID(), 421339,str,"ScriptBorder_Texture_Paper" )	
end

----------------------------------------------------------閃亮符文召喚瑞司特
function luaI_star_111588_initial()                                           ----符文遺跡
	SetPlot( OwnerID() , "touch" , "luaI_star_202686_Effect" , 40 )
end

function luaI_star_202686_Effect()
	if CheckFlag( OwnerID() , 541582 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_6") , 0 )   --/*你已經擊敗了瑞斯特，符文遺跡的力量已消失！
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_6") , 0 )
	else
		if CheckAcceptQuest( OwnerID() , 421343 ) == false or CheckCompleteQuest( OwnerID() , 421343 ) == true then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_3") , 0 )   --/*你感到這個遺跡似乎有股力量，但觸摸它並沒有什麼事情發生！
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_3") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_4") , 0 )   --/*你感到這個遺跡似乎有股力量，想使用你的閃亮符文卻發現不在身上！
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_4") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) == 1 then	
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_5") , 0 )   --/*你感到閃亮符文突然震動了起來！似乎與遺跡產生了共鳴！符文化為一道光消失了！
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_5") , 0 )
			DelBodyItem ( OwnerID() , 202686 , 1 )
			BeginPlot( TargetID() , "luaN_star_111588_act1" , 0 )
			local KingRest = lua_star_CreateNPC( OwnerID() , 0 , 100873 , 0 , 0 ) 
			BeginPlot( KingRest , "LuaS_100873_Living" , 0 )		-- 2009/11/19 振民新增瑞司特的生存時間
			SetAttack( KingRest , OwnerID() )      
			SetPlot( KingRest , "dead" , "luaN_star_100873_act" , 500 )	
		end	
	end
end	

function luaN_star_111588_act1()
	CastSpell( OwnerID() , OwnerID() , 491938 )    ----劇情用銀河
end

function luaN_star_100873_act()
--	SetFlag( TargetID(), 541582 , 1 ) --Suez 改掉，改成模版給，2009.01.12
	local HumanForm = lua_star_CreateNPC( OwnerID() , 0 , 101223 , 0 , 0 )
	BeginPlot(HumanForm , "luaN_star_100873_act1" , 0 )
end

function luaN_star_100873_act1()	
	Say( OwnerID() , GetString("SC_421343_0") )                           ----終於出現了力量足以擊敗我的人，我等這一天等了好久 ！
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_1") )                           ----我和安潔莉娜一直在尋找有能力能對抗獨眼巨人的勇士。你所遭遇的這一切都是我們精心安排的『試煉』！
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_2") )                           ----回去找安潔莉娜吧，她會告訴你接下來該怎麼做，再見了，年輕人！
	sleep(50)
	Delobj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------先發制人
function lua_star_202684_check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421341 ) == false or CheckCompleteQuest( OwnerID() , 421341 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_0")  , 0 ) --/*任務不符合。
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_0")  , 0 ) --/*任務不符合。
		return false
	elseif CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_1") ,  0 ) --/*你沒有目標。
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_1") ,  0 ) --/*你沒有目標。
		return false 
	elseif Target ~= 100872  or TargetID() == OwnerID() then 	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_2") , 0 )   --/*只能對兇暴冰原猛瑪使用
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_2") , 0 )   --/*
		return false	
    else
        return true
	end

end

function lua_star_202684_effect()
	local non_elite = lua_star_CreateNPC( TargetID() , 0 , 101055 , 0 , 0 )
	BeginPlot(TargetID() , "Lua_star_100872_Reset" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_3") , 0 )   --/*吹箭產生了效果，兇暴冰原猛瑪衰弱了！
	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_3") , 0 )
	SetAttack( non_elite , OwnerID() )
end

function Lua_star_100872_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

-----------------------------------------------------------------------------------------安潔莉娜認錯
function lua_star_111299_act1()
	LoadQuestOption( OwnerID() ) 
	if CheckCompleteQuest( OwnerID() , 421343 ) == true and CheckFlag( OwnerID() , 541583 ) == False then		
		AddSpeakOption( OwnerID() , TargetID() , GetString("SC_421344_1"), "lua_star_111299_act2" , 0 )  ----你認為波力克的死跟安潔莉娜有關，開口責怪她！
		--AddSpeakOption(  OwnerID() , TargetID( ) , GetString("SC_421344_2"), "lua_star_111299_act2" , 0 )  ----不想追究任何事。
	end
end

function lua_star_111299_act2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "lua_star_111299_act3" , 0 )
end

function lua_star_111299_act3()	
	local angelina = lua_star_CreateNPC( OwnerID() , 0 , 100874 , 0 , 0 )
	Hide( OwnerID() )
	Say( angelina , GetString("SC_421344_0") )	                           ----為何要把波力克的死歸咎於我？我並沒有強迫他做任何事，是他自己想成為英雄的！	
	SetAttack( angelina , TargetID() )
	for i=1 , 1200 do		
		local AttackTarget = ReadRoleValue( angelina , EM_RoleValue_AttackTargetID )
		sleep(10)
		if AttackTarget ~= 0 and CheckID( angelina ) == true then
			if ReadRoleValue( angelina , EM_RoleValue_IsDead ) == 1 then
				SetFlag( TargetID() , 541583 , 1)
				sleep(20)
				Show( OwnerID() , 0 )
				break
			end
		else			
			Delobj( angelina )	
			Show( OwnerID() , 0 )
			break				
		end			
	end
end

---------------------------------------------------------------年輕人的屍體
function lua_star_11298_motion()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
end

function LuaS_100873_Living()
	local LifeTime = 3000	-- 五分鐘

	Sleep( LifeTime )
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			if CheckID( OwnerID() ) == true then
				DelObj( OwnerID() )
			end
			break;
		end
		Sleep( 5 )
	end
end