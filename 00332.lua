function LuaS_200912_0() --試煉徽記

	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420331, 1  ) );

	ShowBorder( OwnerID(), 420331, "[420331]", "ScriptBorder_Texture_Paper" );	

end

function LuaQ_420331_Complete()
	PlayMotion( OwnerID() , ruFUSION_ACTORSTATE_EMOTE_SPEAK ) --文字流轉的特效
	sleep( 30 )
end

function LuaQ_420335_KEY()
	if CountBodyItem(OwnerID(),200913) > 0 and CountBodyItem(OwnerID(),200914) > 0 and CountBodyItem(OwnerID(),200915) > 0 then
		DelBodyItem( OwnerID() ,200913 , 1 )
		DelBodyItem( OwnerID() ,200914 , 1 )
		DelBodyItem( OwnerID() ,200915 , 1 )
		GiveBodyItem( OwnerID() ,200916 , 1 )
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420335_0"), 0 ); --/*你合成了試煉之鑰
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420335_1"), 0 ); --/*物品不足。
	end
end

function LuaS_110356_0()
	LoadQuestDetail( OwnerID() )
	if CheckCompleteQuest(OwnerID() , 420335 ) and CountBodyItem( OwnerID() , 200916 ) > 0 then
		AddSpeakOption( OwnerID() , TargetID() ,GetString("SO_110356_1") , "LuaS_110356_1" , 0 ) --/*將試煉之鑰掛在女神像上
	end
		AddSpeakOption( OwnerID() , TargetID() ,GetString("SO_110356_0") , "LuaS_110356_EXIT" , 0 ) 
end

function LuaS_110356_1()
	CloseSpeak( OwnerID() )
	DelBodyItem( OwnerID() , 200916 , 1 )
	BeginPlot( TargetID() , "LuaQ_420335_Complete" , 0 )
end

function LuaS_110356_EXIT()
	CloseSpeak( OwnerID() )	
end

function LuaQ_420335_Complete()
	local Door =  LuaFunc_SearchNPCbyOrgID( OwnerID() , 110355 , 100 )
	if ReadRoleValue( Door , EM_RoleValue_PID) == 0 then
		BeginPlot( Door , "LuaI_110355_OPEN",0)
	end
end

function LuaI_110355()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 0 )
end

function LuaI_110355_OPEN()
	WriteRoleValue( OwnerID() , EM_RoleValue_PID , 100 )
	--開門的動作
	SAY( OwnerID() ,"門開了" )
	sleep( 5 ) 
	BeginPlot( OwnerID() , "LuaI_110355_CLOSE" , 0 )
end

function LuaI_110355_CLOSE() --進入戰鬥後關門，並在戰鬥結束時開門

	local Maids = LuaFunc_SearchNPCbyOrgID( OwnerID() ,100122 , 500 )
	local Battle = 0

	while 1 do --檢查只要有進入戰鬥就關門
		for i = 0 , 2 , 1 do
			if ReadRoleValue( Maids[i] , EM_RoleValue_AttackTargetID ) ~= 0  then
				--關門的動作
				SAY( OwnerID() ,"門關了" )
				WriteRoleValue( OwnerID() , EM_RoleValue_PID, 150 )
				break
			end
		end
		if ReadRoleValue( OwnerID() , EM_RoleValue_PID ) == 150 then
			break
		end
		sleep( 10 )
	end

	while 1 do --檢查三個王是否都離開戰鬥
		for i = 0 , 2 , 1 do
			if ReadRoleValue( Maids[i] , EM_RoleValue_AttackTargetID ) then
				Battle = Battle + 1
			else
				if Battle > 0 then
					Battle = Battle - 1
				else
					Battle = 0
				end
			end
		end
		
		sleep( 60 )

		if Battle == 0 then
			break
		end
	end

	BeginPlot( OwnerID() , "LuaI_110355_OPEN" , 0 )	
end