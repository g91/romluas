-------------------------------------------------------┣钵才ゅ

function LuaI_202683_0() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421339, 1  ) )
	ShowBorder( OwnerID(), 421339,str,"ScriptBorder_Texture_Paper" )	
end

----------------------------------------------------------皗獹才ゅ酬风疭
function luaI_star_111588_initial()                                           ----才ゅ框格
	SetPlot( OwnerID() , "touch" , "luaI_star_202686_Effect" , 40 )
end

function luaI_star_202686_Effect()
	if CheckFlag( OwnerID() , 541582 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_6") , 0 )   --/*竒阑毖风吹疭才ゅ框格秖ア
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_6") , 0 )
	else
		if CheckAcceptQuest( OwnerID() , 421343 ) == false or CheckCompleteQuest( OwnerID() , 421343 ) == true then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_3") , 0 )   --/*稰硂框格Τ秖牟篘ウ⊿Τぐ或ㄆ薄祇ネ
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_3") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_4") , 0 )   --/*稰硂框格Τ秖稱ㄏノ皗獹才ゅ玱祇瞷ぃō
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_4") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) == 1 then	
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_5") , 0 )   --/*稰皗獹才ゅ礛綺笆癬ㄓ籔框格玻ネ伙才ゅて笵ア
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_5") , 0 )
			DelBodyItem ( OwnerID() , 202686 , 1 )
			BeginPlot( TargetID() , "luaN_star_111588_act1" , 0 )
			local KingRest = lua_star_CreateNPC( OwnerID() , 0 , 100873 , 0 , 0 ) 
			BeginPlot( KingRest , "LuaS_100873_Living" , 0 )		-- 2009/11/19 チ穝糤风疭ネ丁
			SetAttack( KingRest , OwnerID() )      
			SetPlot( KingRest , "dead" , "luaN_star_100873_act" , 500 )	
		end	
	end
end	

function luaN_star_111588_act1()
	CastSpell( OwnerID() , OwnerID() , 491938 )    ----粿薄ノ蝗猠
end

function luaN_star_100873_act()
--	SetFlag( TargetID(), 541582 , 1 ) --Suez э奔эΘ家倒2009.01.12
	local HumanForm = lua_star_CreateNPC( OwnerID() , 0 , 101223 , 0 , 0 )
	BeginPlot(HumanForm , "luaN_star_100873_act1" , 0 )
end

function luaN_star_100873_act1()	
	Say( OwnerID() , GetString("SC_421343_0") )                           ----沧瞷秖ì阑毖ии单硂ぱ单 
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_1") )                           ----и㎝间产甊碝тΤ癸к縒泊エ玦┮綝笿硂ち常琌и弘み逼刚芬
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_2") )                           ----т间产甊穦禗钡ㄓ赣或暗ǎ淮
	sleep(50)
	Delobj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------祇
function lua_star_202684_check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421341 ) == false or CheckCompleteQuest( OwnerID() , 421341 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_0")  , 0 ) --/*ヴ叭ぃ才
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_0")  , 0 ) --/*ヴ叭ぃ才
		return false
	elseif CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_1") ,  0 ) --/*⊿Τヘ夹
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_1") ,  0 ) --/*⊿Τヘ夹
		return false 
	elseif Target ~= 100872  or TargetID() == OwnerID() then 	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_2") , 0 )   --/*癸忌瞨嚎ㄏノ
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_2") , 0 )   --/*
		return false	
    else
        return true
	end

end

function lua_star_202684_effect()
	local non_elite = lua_star_CreateNPC( TargetID() , 0 , 101055 , 0 , 0 )
	BeginPlot(TargetID() , "Lua_star_100872_Reset" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_3") , 0 )   --/*絙玻ネ狦忌瞨嚎癐畓
	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_3") , 0 )
	SetAttack( non_elite , OwnerID() )
end

function Lua_star_100872_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

-----------------------------------------------------------------------------------------间产甊粄岿
function lua_star_111299_act1()
	LoadQuestOption( OwnerID() ) 
	if CheckCompleteQuest( OwnerID() , 421343 ) == true and CheckFlag( OwnerID() , 541583 ) == False then		
		AddSpeakOption( OwnerID() , TargetID() , GetString("SC_421344_1"), "lua_star_111299_act2" , 0 )  ----粄猧蛤间产甊Τ闽秨砫┣
		--AddSpeakOption(  OwnerID() , TargetID( ) , GetString("SC_421344_2"), "lua_star_111299_act2" , 0 )  ----ぃ稱發╯ヴㄆ
	end
end

function lua_star_111299_act2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "lua_star_111299_act3" , 0 )
end

function lua_star_111299_act3()	
	local angelina = lua_star_CreateNPC( OwnerID() , 0 , 100874 , 0 , 0 )
	Hide( OwnerID() )
	Say( angelina , GetString("SC_421344_0") )	                           ----璶р猧耴㏒ии⊿Τ眏暗ヴㄆ琌稱Θ璣动	
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

---------------------------------------------------------------淮砰
function lua_star_11298_motion()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
end

function LuaS_100873_Living()
	local LifeTime = 3000	-- きだ牧

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