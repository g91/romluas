---------------------------巨石魔法陣初始劇情
function LuaI_110091()	--巨石魔法陣初始劇情

	--CastSpell( OwnerID() , OwnerID() , 490101)	-- 出生後幫自己上特效魔法
	SetPlot( OwnerID() , "touch" , "LuaI_110091_A" , 40 );

end

function LuaI_110091_A()

	local result = "";
	local resultM = "";
	local resultX = "";

	if CheckFlag( OwnerID()  , 540778 ) == true then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_1") , 0 );	--你已經封印了魔法陣！
	else
		if CheckAcceptQuest( OwnerID() , 420481) == true then
			if CountBodyItem( OwnerID() , 201190 ) >= 1 then
				if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_01") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );	-- 畫下巨石上的符文標誌
					return
				end
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );

					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
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
					DelBodyItem ( OwnerID() , 201190 , 1 );
					GiveBodyItem ( OwnerID() , 201191 , 1 );
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_2") , 0 )		--你畫下了巨石上的符文標誌！
				end
			elseif CountBodyItem( OwnerID() , 201191 ) == 1 then
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_3") , 0 )		--你已經畫下巨石上的符文標誌了！
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_4") , 0 )		--你沒有空白的卷軸可以畫下符文標誌！
			end
		elseif CheckAcceptQuest( OwnerID() , 420479) == true then
			if CountBodyItem( OwnerID() , 201192 ) == 0 then		--/* 判斷是否有六顆狼心	--/* 判斷是否有魔物之血
				if CountBodyItem( OwnerID() , 201189 ) >= 10 then
					if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_02") , 30 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- 召喚魔物
						ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
						return
					end
					while 1 do
						sleep( 2 );
						local CastBarStatus = CheckCastBar( OwnerID() );

						if ( CastBarStatus ~= 0 ) then 
							if ( CastBarStatus > 0) then -- 成功
								resultM = "OKOK"
								EndCastBar( OwnerID() , CastBarStatus )
								break;
							elseif ( CastBarStatus < 0 ) then -- 失敗
								resultM = "DAME"
								EndCastBar( OwnerID() , CastBarStatus )
								break;
							end
						end
					end
					if ( resultM == "OKOK" ) then
						DelBodyItem ( OwnerID() , 201189 , 10 )		--/* 刪除貢品六顆狼心
						ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_5") , 0 )		--你開啟了魔法陣！魔物出現！！！

						local Obj = Role:new( OwnerID() ) 

						local BaseX = Obj :X()
						local BaseY = Obj :Y();
						local BaseZ = Obj :Z();
						local BaseDir = Obj:Dir();

						local Bear = CreateObj(100560, BaseX, BaseY, BaseZ, BaseDir+180, 1 )	
						AddToPartition( Bear , 0 )
						BeginPlot( Bear , "LuaS_100560_LivingTime" , 0 )
						SetAttack( Bear , OwnerID())
						sleep(60)
						--while 1 do
						--	if ReadRoleValue( Bear , EM_RoleValue_AttackTargetID ) ~= 0 and CheckID(Bear ) == true then  --檢查是否離開戰鬥
						--		sleep(60)	-- 六秒檢查一次
						--	else
						--		if CheckID( Bear ) == true and ReadRoleValue( Bear , EM_RoleValue_IsDead )  == 0 then
						--			DelObj( Bear )
						--		end 
						--	sleep( 300 )
						--	break
						--	end
						--sleep(1)
						--end
					end
				else
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_6") , 0 )	--無法開啟魔法陣，你沒有足夠的狼心！
				end
			end
		elseif CheckAcceptQuest( OwnerID() , 420480) == true then
			if  CountBodyItem( OwnerID() , 201193 ) == 1 then
				if BeginCastBar( OwnerID(), GetString("CASTBAR_NAME_03")  , 60 , ruFUSION_ACTORSTATE_CRAFTING_BEGIN , ruFUSION_ACTORSTATE_CRAFTING_END , 0 ) ~= 1 then	-- 封印魔法陣
					ScriptMessage( OwnerID(), OwnerID(), 0,"[SAY_NPC_BUSY]", 0 );
					return
				end
				while 1 do
					sleep( 2 );
					local CastBarStatus = CheckCastBar( OwnerID() );

					if ( CastBarStatus ~= 0 ) then 
						if ( CastBarStatus > 0) then -- 成功
							resultX = "OKOK"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						elseif ( CastBarStatus < 0 ) then -- 失敗
							resultX = "DAME"
							EndCastBar( OwnerID() , CastBarStatus )
							break;
						end
					end
				end

				if ( resultX == "OKOK" ) then
					SetFlag( OwnerID()  , 540778 , 1 );
					DelBodyItem ( OwnerID() , 201193, 1 )	;
					ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_7") , 0 )	--你使用魔物之血封印了魔法陣！
				end
			else
				ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_8") , 0 )	--你沒有魔物之血可以封印魔法陣！
			end
		else
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_110091_9") , 0 )	--沒有任何事發生！
		end
	end
end

function LuaS_110062()
	if CheckAcceptQuest( OwnerID(), 420480) == true and CheckFlag( OwnerID()  , 540778 ) == false then
		SetSpeakDetail( OwnerID(), GetString("ST_110091_10") )	--細節我已經聽卡翠娜說了，我想請你暫時按下其他任務，以封印尖石丘的召喚魔法陣這一件事為優先！
	else
		LoadQuestOption( OwnerID() );  --載入任務模板
	end
end

function LuaS_100560_LivingTime()
	while true do
		local AttackTarget = ReadRoleValue( OwnerID() , EM_RoleValue_AttackTargetID )
		if AttackTarget == 0 then
			DelObj( OwnerID() )
			break;
		end
		Sleep( 20 )
	end
end

