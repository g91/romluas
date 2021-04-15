-------------------------------------------------------�ǲ��Ť�

function LuaI_202683_0() 
	local str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID(), GetQuestDetail( 421339, 1  ) )
	ShowBorder( OwnerID(), 421339,str,"ScriptBorder_Texture_Paper" )	
end

----------------------------------------------------------�{�G�Ť�l���q�S
function luaI_star_111588_initial()                                           ----�Ť���
	SetPlot( OwnerID() , "touch" , "luaI_star_202686_Effect" , 40 )
end

function luaI_star_202686_Effect()
	if CheckFlag( OwnerID() , 541582 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_6") , 0 )   --/*�A�w�g���ѤF�紵�S�A�Ť��񪺤O�q�w�����I
		ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_6") , 0 )
	else
		if CheckAcceptQuest( OwnerID() , 421343 ) == false or CheckCompleteQuest( OwnerID() , 421343 ) == true then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_3") , 0 )   --/*�A�P��o�ӿ����G���ѤO�q�A��Ĳ�N���èS������Ʊ��o�͡I
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_3") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) < 1 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_4") , 0 )   --/*�A�P��o�ӿ����G���ѤO�q�A�Q�ϥΧA���{�G�Ť�o�o�{���b���W�I
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_4") , 0 )
		elseif CheckAcceptQuest( OwnerID() , 421343 ) == true and CountBodyItem( OwnerID(), 202686 ) == 1 then	
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421343_5") , 0 )   --/*�A�P��{�G�Ť��M�_�ʤF�_�ӡI���G�P��񲣥ͤF�@��I�Ť�Ƭ��@�D�������F�I
			ScriptMessage( OwnerID(), OwnerID(), 2, GetString("SC_421343_5") , 0 )
			DelBodyItem ( OwnerID() , 202686 , 1 )
			BeginPlot( TargetID() , "luaN_star_111588_act1" , 0 )
			local KingRest = lua_star_CreateNPC( OwnerID() , 0 , 100873 , 0 , 0 ) 
			BeginPlot( KingRest , "LuaS_100873_Living" , 0 )		-- 2009/11/19 �����s�W��q�S���ͦs�ɶ�
			SetAttack( KingRest , OwnerID() )      
			SetPlot( KingRest , "dead" , "luaN_star_100873_act" , 500 )	
		end	
	end
end	

function luaN_star_111588_act1()
	CastSpell( OwnerID() , OwnerID() , 491938 )    ----�@���λȪe
end

function luaN_star_100873_act()
--	SetFlag( TargetID(), 541582 , 1 ) --Suez �ﱼ�A�令�Ҫ����A2009.01.12
	local HumanForm = lua_star_CreateNPC( OwnerID() , 0 , 101223 , 0 , 0 )
	BeginPlot(HumanForm , "luaN_star_100873_act1" , 0 )
end

function luaN_star_100873_act1()	
	Say( OwnerID() , GetString("SC_421343_0") )                           ----�ש�X�{�F�O�q���H���ѧڪ��H�A�ڵ��o�@�ѵ��F�n�[ �I
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_1") )                           ----�کM�w����R�@���b�M�䦳��O���ܿW�����H���i�h�C�A�ҾD�J���o�@�����O�ڭ̺�ߦw�ƪ��y�շҡz�I
	sleep(50)
	Say( OwnerID() , GetString("SC_421343_2") )                           ----�^�h��w����R�a�A�o�|�i�D�A���U�Ӹӫ�򰵡A�A���F�A�~���H�I
	sleep(50)
	Delobj( OwnerID() )
end
-----------------------------------------------------------------------------------------------------���o��H
function lua_star_202684_check()
	local Target = ReadRoleValue( TargetID() , EM_RoleValue_OrgID)
	if CheckAcceptQuest( OwnerID() , 421341 ) == false or CheckCompleteQuest( OwnerID() , 421341 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_0")  , 0 ) --/*���Ȥ��ŦX�C
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_0")  , 0 ) --/*���Ȥ��ŦX�C
		return false
	elseif CheckID( TargetID() ) == false then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_1") ,  0 ) --/*�A�S���ؼСC
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_1") ,  0 ) --/*�A�S���ؼСC
		return false 
	elseif Target ~= 100872  or TargetID() == OwnerID() then 	
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_2") , 0 )   --/*�u�����ɦB��r���ϥ�
		ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_2") , 0 )   --/*
		return false	
    else
        return true
	end

end

function lua_star_202684_effect()
	local non_elite = lua_star_CreateNPC( TargetID() , 0 , 101055 , 0 , 0 )
	BeginPlot(TargetID() , "Lua_star_100872_Reset" , 0 )
	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("SC_421341_3") , 0 )   --/*�j�b���ͤF�ĪG�A���ɦB��r���I�z�F�I
	ScriptMessage( OwnerID(), OwnerID(), 1, GetString("SC_421341_3") , 0 )
	SetAttack( non_elite , OwnerID() )
end

function Lua_star_100872_Reset()
	LuaFunc_ResetObj( OwnerID() )
end

-----------------------------------------------------------------------------------------�w����R�{��
function lua_star_111299_act1()
	LoadQuestOption( OwnerID() ) 
	if CheckCompleteQuest( OwnerID() , 421343 ) == true and CheckFlag( OwnerID() , 541583 ) == False then		
		AddSpeakOption( OwnerID() , TargetID() , GetString("SC_421344_1"), "lua_star_111299_act2" , 0 )  ----�A�{���i�O�J������w����R�����A�}�f�d�Ǧo�I
		--AddSpeakOption(  OwnerID() , TargetID( ) , GetString("SC_421344_2"), "lua_star_111299_act2" , 0 )  ----���Q�l�s����ơC
	end
end

function lua_star_111299_act2()
	CloseSpeak( OwnerID() )
	BeginPlot( TargetID() , "lua_star_111299_act3" , 0 )
end

function lua_star_111299_act3()	
	local angelina = lua_star_CreateNPC( OwnerID() , 0 , 100874 , 0 , 0 )
	Hide( OwnerID() )
	Say( angelina , GetString("SC_421344_0") )	                           ----����n��i�O�J�����k�S��ڡH�ڨèS���j���L������ơA�O�L�ۤv�Q�����^�����I	
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

---------------------------------------------------------------�~���H������
function lua_star_11298_motion()
	PlayMotionEX( OwnerID(), ruFUSION_ACTORSTATE_DYING,ruFUSION_ACTORSTATE_DEAD)
	sleep(30)
end

function LuaS_100873_Living()
	local LifeTime = 3000	-- ������

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