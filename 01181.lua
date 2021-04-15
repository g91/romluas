function LuaS_421725_CHECK()
	if CountBodyItem( OwnerID() , 203634 ) >= 1 then
		local OBJ = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
		if OBJ == 112143 or OBJ == 112144 or OBJ == 112147 then
			--Say( OwnerID() , GetName( TargetID() ) )
			return true
		--elseif OBJ == 112148 then
			--Say( OwnerID() , "This is Broken!!" )
			--return false
		else
			return false
		end
	else
		return false
	end

end

function LuaS_421725_DO()
	if CountBodyItem( OwnerID() , 203634 ) >= 1 then
		DelBodyItem( OwnerID() , 203634 , 1 )
		return true
	else
		return false
	end
end

function LuaS_421725_COMPLETE()
	DelBodyItem( TargetID() , 203634 , CountBodyItem( TargetID() , 203634 ) )	-- 刪除多餘的香精
	return true
end

function LuaS_421728_COMPLETE()
	BeginPlot( OwnerID() , "LuaS_421728_COMPLETE_DO" , 0 )
	return true
end

function LuaS_421728_COMPLETE_DO()
	local GoodMachine  =  CreateObjByObj( 112147, OwnerID() , 1  )	--產生好的裝置
	Hide( OwnerID() )
	Sleep( 100 )
	if  GoodMachine ~= nil and CheckID( GoodMachine ) == true then	DelObj( GoodMachine )	end

	Show( OwnerID() , 0 )
	local Player = SearchRangePlayer ( OwnerID() , 300 )	-- 搜尋附近的玩家
	for i = 0 , table.getn( Player ) do
		if Player[i] ~= -1 then
			ScriptMessage( OwnerID(), Player[i] , 2 , "[SC_421728_1]"  , C_SYSTEM )	-- 發散裝置星光一號在海風吹拂之下，似乎又故障了！
		end
	end
end

function LuaS_112148()
	LoadQuestOption( OwnerID() )
	if CheckAcceptQuest( OwnerID() , 421725 ) == true then
		SetFlag( OwnerID() , 542304 , 1 )	-- 接下添加香精任務
	end
end

function LuaS_421731()	-- 遺失的附錄
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421731 , 1 ) )
	ShowBorder( OwnerID() , 421731 , GetObjNameByGUID( 421731 ) , "ScriptBorder_Texture_Paper" )
end

function LuaS_421739()	-- 懷錶的主人
	ClearBorder( OwnerID() )
	AddBorderPage( OwnerID() , GetQuestDetail( 421739 , 1 ) )
	ShowBorder( OwnerID() , 421739 , GetObjNameByGUID( 421739 ) , "ScriptBorder_Texture_Paper" )
end

function LuaS_112194()	-- 酒鬼的蹤跡
	LoadQuestOption( OwnerID() )	-- 載入任務模板

	if CheckAcceptQuest( OwnerID() , 421733 ) == true and CheckFlag( OwnerID() , 542305 ) == false then
		AddSpeakOption( OwnerID() , OwnerID() , "[SC_112194_01]" , "LuaS_112194_Fight" , 0 )	-- 快把[112138]的項鍊還來！！
	end
end

function LuaS_112194_Fight()
	CloseSpeak( OwnerID() )  --關閉對話視窗
	BeginPlot( TargetID() , "LuaS_112194_FightStart" , 0 )
end

function LuaS_112194_FightStart()

	DisableQuest( OwnerID() , true )
	--MoveToFlagEnabled( OwnerID() , false )

	local PlayerDBID = ReadRoleValue( TargetID() , EM_RoleValue_DBID ) 
	Say( OwnerID() , "[SC_112194_02]" )		-- 哈哈！你說還我就還，那我算什麼！？
	Sleep( 15 )
	Say( OwnerID() , "[SC_112194_03]" )		-- 有本事就憑自己的實力來拿回去！！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_PROVOKE )
	Sleep( 25 )
	local Space = CreateObjByObj( 101274 , OwnerID() , 1 )
	Hide( OwnerID() )

	BeginPlot( Space ,"LuaS_112194_LiveTime" , 0 )		-- 設定生存時間
	SetPlot( Space , "Dead" , "LuaS_112194_Dead" , 0 )	-- 設定死亡劇情

	SetAttack( Space , TargetID() )

	Sleep( 5 )
	while true do
		if CheckID( Space ) ~= true or ReadRoleValue( Space , EM_RoleValue_IsNPC ) ~= 1 then
			Sleep( 5 )
			Show( OwnerID() , 0 )
			--SetPos( OwnerID() , X , Y , Z , Dir )
			--Sleep( 5 )
			if  Luafunc_Player_Alive( TargetID() , PlayerDBID , 250 ) == true and ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 and CheckFlag( TargetID() , 542305 ) == true then 

			end
			--MoveToFlagEnabled( OwnerID() , true )
			DisableQuest( OwnerID() , false )
			break
		end
		Sleep( 10 )
	end

end

-----------------------------------------------------------------------------------------------
function LuaS_112194_LiveTime()
	LuaFunc_Obj_Suicide( 300 )
end
-----------------------------------------------------------------------------------------------	
function LuaS_112194_Dead()
	if  ReadRoleValue( TargetID() , EM_RoleValue_IsDead ) ~= 1 and CheckAcceptQuest( TargetID() , 421733 ) == true then 
		SetFlag( TargetID() , 542305 , 1 )
	end
	SetStopAttack( OwnerID() )
	SetFightMode( OwnerID() , 0 , 0 , 0 , 0 )
	BeginPlot( OwnerID() , "LuaS_112194_Dead_Show" , 0 )
	return false
end

function LuaS_112194_Dead_Show()
	Say( OwnerID() , "[SC_112194_04]" )		-- 住手！我知道了！我說！
	PlayMotion( OwnerID() ,ruFUSION_ACTORSTATE_EMOTE_SURRENDER )
	Sleep( 45 )
	DelObj( OwnerID() )
end

function LuaS_421742_CHECK()	-- 川普的要求之一
	local Object = ReadRoleValue( TargetID() , EM_RoleValue_OrgID )
	if Object == 112220 then	-- 汲水水桶
		if CountBodyItem( OwnerID() , 203696 ) < 1 then
			if CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == true then
				return false
			end
			return true
		else
			ScriptMessage( OwnerID(), OwnerID() , 1 , "[SC_421742_01]"  , C_DEFAULT )		-- 你應該先將身上這一桶[203696]裝到[ZONE_CALAMUS POINT]的[112221]裡！
			return false
		end

	elseif Object == 112221 then	-- 儲放水槽
		if CountBodyItem( OwnerID() , 203696 ) >= 1 then
			if CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == true then
				return false
			end
			return true
		else
			return false
		end
	end
end

function LuaS_421742_DO()
	if DelBodyItem( OwnerID() , 203696 , 1 ) then
		if CheckFlag( OwnerID() , 542347 ) == false and CheckFlag( OwnerID() , 542348 ) == false and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542347 , 1)	-- 幫錢尼．川普挑回 1 桶清水
		elseif CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == false and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542348 , 1)	-- 幫錢尼．川普挑回 2 桶清水
		elseif CheckFlag( OwnerID() , 542347 ) == true and CheckFlag( OwnerID() , 542348 ) == true and CheckFlag( OwnerID() , 542349 ) == false then
			SetFlag( OwnerID() , 542349 , 1)	-- 幫錢尼．川普挑回 3 桶清水
		end
	end
	return true
end

function LuaS_112242()	-- 母親的願望
		SetPlot( OwnerID() , "Touch" , "LuaS_112242_01" , 30 )
end

function LuaS_112242_01()
	BeginPlot( TargetID() , "LuaS_112242_02" , 0 )
end

function LuaS_112242_02()
	local Nawusika =  CreateObjByObj( 112208 , OwnerID() , 1  )	--產生愛莉．娜烏希卡
	Hide( OwnerID() )
	Sleep( 300 )
	if  Nawusika ~= nil and CheckID( Nawusika ) == true then	DelObj( Nawusika )	end
	Show( OwnerID() , 0 )
end




-------小洛的---------

function LuaS_421843_0()
	if	CountBodyItem( OwnerID() , 203812 )>0	then
		return true
	else
		return false
	end
end
