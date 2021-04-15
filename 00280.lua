function LuaI_110749()
	SetPlot( OwnerID(), "touch", "LuaQ_110749", 25)
end
--------------------------------------------------------------------------------------------------------------
function LuaQ_110749()
	local result = ""

	if CountBodyItem ( OwnerID() , 200903 ) >= 1 then
		if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_06") , 120 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then-- 使用風音水晶
			ScriptMessage ( OwnerID() , OwnerID() , 1 , "[SAY_NPC_BUSY]" , 0 )
			return
		end
			while 1 do
				sleep( 2 );
				local CastBarStatus = CheckCastBar( OwnerID() );

				if ( CastBarStatus ~= 0 ) then 
					if ( CastBarStatus > 0 ) then -- 成功
						result = "OKOK"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					elseif ( CastBarStatus < 0 ) then -- 失敗
						result = "DAME"
						EndCastBar( OwnerID() , CastBarStatus )
						break;
					end
				end
			end

			if ( result == "OKOK" ) then
				DelBodyItem ( OwnerID() , 200903 , 1 );
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_1") , 0 )	-- 風音水晶裡突然產生了雜音而碎裂！
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_2") , 0 )	-- 地龍之子察覺到異樣破殼而出！
				SetFlag( OwnerID() , 540802, 1 )
				BeginPlot(TargetID() , "LuaS_110749_Fight" , 0 )
			end
	else
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110749_3") , 0 )	-- 你看見一顆地龍的龍卵。
	end

end
--------------------------------------------------------------------------------------------------------------
function LuaS_110749_Fight()
	local n =0
	local O = OwnerID() 
	local T = TargetID() 

	Hide( O )
	local Dragon = LuaFunc_CreateObjByObj ( 100266 , O )
	SetPlot( Dragon ,"Dead" , "LuaS_110749_Dead" , 40 )
	SetAttack( Dragon , TargetID() )
	sleep(60)
	while 1 do
		n = n + 1
		if n > 600 then -- 防無窮迴圈
			ScriptMessage( TargetID(), TargetID(), 0, "無窮迴圈", 0 )
			break
		else
			--ScriptMessage( TargetID(), TargetID(), 0, "合法迴圈", 0 )
		end
		if ReadRoleValue( Dragon , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID( Dragon ) == true then  --檢查是否離開戰鬥
			sleep(600)	-- 六十秒檢查一次	
		else
			if CheckID( Dragon ) == true then
				DelObj( Dragon )
			end 
			sleep( 60 )
			break
		end
	sleep(1)
	end

	sleep( 300 )
	Show( O , 0 )
end
--------------------------------------------------------------------------------------------------------------
function LuaS_110749_Dead()
	if CheckFlag( TargetID() , 540801 ) == false and CheckAcceptQuest(TargetID() , 420323 ) == true then
		SetFlag( TargetID() , 540801, 1 )
	end
end
--------------------------------------------------------------------------------------------------------------
--Owner為石座
--Function LuaI_110451()
--	SetPlot( OwnerID(), "touch", "LuaQ_110451_1", 40)	--設定破舊石座觸碰劇情
--End
--------------------------------------------------------------------------------------------------------------
--Owner為玩家
--Function LuaQ_110451_1()
--	if CheckAcceptQuest( OwnerID(), 420323) == true And CountBodyItem( OwnerID(),200903) >=1 then
--	DelBodyItem( OwnerID(), 200903, 1);
--	SetPlot( TargetID(), "touch", "LuaFunc_Obj_BUSY", 40);	
--	sleep(20);
--	--CastSpell( TargetID(), TargetID(), *法術編號);	--施放特效
--	sleep(30);
--	BeginPlot( TargetID() , "LuaQ_110451_2",30);
--	end
--End
--------------------------------------------------------------------------------------------------------------
--Owner為石座
--Function LuaQ_110451_2()

--	local Dragon = LuaFunc_SearchNPCbyOrgID( OwnerID() ,110160 ,300 );	--從石座的位置尋找龍
--	sleep(30);
--	Hide (Dragon);	--隱藏沉睡龍
--	sleep(30);
--	local Dragon_2 = LuaFunc_Createobjbyobj( 100266, Dragon, 1);	--從沉睡之龍的位置產生守護地龍
--	SetAttack( Dragon_2, TargetID() );
--	BeginPlot( Dragon_2, "LuaQ_110451_Suicide", 0); 

--	While 1 do
--		if CheckID(Dragon_2) == false then	--若是守護地龍已消失
--			break	--跳出迴圈
--		end
--		sleep( 20 );	--迴圈檢查間隔時間
--	end
	
--	sleep(120);	--兩分鐘
--	Show( Dragon, 0)	--顯示沉睡之龍
--	sleep(10);
--	SetPlot( OwnerID(), "touch", "LuaQ_110451_1", 40)
--End
-------------------------------------------------------------------------------------------------------------
--Owner為石座
--Function LuaQ_110451_Suicide()
--	LuaFunc_Obj_Suicide( 300 );	--偵測守護地龍是否存在伺服器
--End
