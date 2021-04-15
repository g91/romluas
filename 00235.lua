function LuaI_420226_0()

	while 1 do
		local Step = Rand(11)	-- 產生0-11的數字
		local StepPrint = 0
		if ( Step >= 0 and Step < 4  ) then
			StepPrint = 1
		elseif ( Step >= 4 and Step < 8  ) then
			StepPrint = 2
		elseif ( Step >= 8 and Step < 12  ) then
			StepPrint = 3
		end
		local Trace = CreateObjByFlag( 110663 , 780023 , StepPrint  , 1 )		-- (產生物件ID , 產生旗子ID , 旗子位置ID , 產生數量)
		AddToPartition( Trace , 0 )
		ScriptMessage( Trace , 0 , 0 , GetString("ST_420226_1") , 0 )	-- 你赫然發現地上有個奇怪的足跡，似乎有什麼怪物剛剛走過這裡。
		sleep(600)
		ScriptMessage( Trace , 0 , 0 ,  GetString("ST_420226_2") , 0 )	-- 這個足跡已經十分模糊，看來留下足跡的生物已經遠離了。
		Delobj(Trace)
		sleep(5)
	end

end
-------------------------------------------------------------------------------
function LuaQ_420226_CatchPowder()

	if CheckAcceptQuest( OwnerID() ,420226 ) == true then
		if CountBodyItem( OwnerID(), 200676 ) >= 1 then
			DelBodyItem ( OwnerID() , 200676 , 1 )
			ScriptMessage( TargetID() , OwnerID() , 0 , GetString("ST_420226_3") , 0 )	-- 你灑下粉末之後，似乎聽見有什麼東西在移動的聲音。
			Sleep( 5 )
			local Goblin = Createobjbyobj( 100098 , TargetID() , 1  )
			--Func_rand_walker(Goblin,300, 10 ) --讓怪物不會出現在腳印上
			SetPlot(Goblin,"Dead","LuaI_100098_Dead" , 0 )
			BeginPlot( Goblin , "LuaQ_420226_Sui" , 0)
			SetAttack( Goblin , OwnerID() )
			return true
		else
		--	ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_420226_4") , 0 );	-- 你沒有可以撒在足跡上的物品！
			return false
		end
	end

end

function LuaQ_420226_CatchPowderBefore()
	if CountBodyItem( OwnerID(), 200676 ) < 1 then
		ScriptMessage( OwnerID(), OwnerID(), 0, GetString("ST_420226_4") , 0 );	-- 你沒有可以撒在足跡上的物品！
		return false
	else
		return true
	end
end
-------------------------------------------------------------------------------
function LuaQ_420226_Item() --使用道具
	local List = SearchRangeNPC( OwnerID() , 40 );
	local Owner = Role:new( OwnerID() );
	local Obj
	local Check
	for i = 0 , 100 , 1 do
		if List[i] == -1 then
			Check = 0 
			break;
		end		
		Obj = List[i]
		if ReadRoleValue( Obj , EM_RoleValue_OrgID) == 100098 then
			Check = 1
			break;
		end
		if ReadRoleValue( Obj , EM_RoleValue_OrgID) == 100098 then
			Check = 2
			break;
		end
	end
	if CheckCompleteQuest( OwnerID() ,420226 ) then
		DelBodyItem( OwnerID() , 200676 , 1 )
		Say ( OwnerID() , GetString("EM_420226_3") )	-- 這些誘捕粉看來是用不到了。

	else
		if Check == 2 and CountBodyItem( OwnerID() , 200677 ) == 0 then
			local Step = ReadRoleValue ( Obj , EM_RoleValue_PID)
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_420226_4") , 0 )	-- 你灑下粉末之後，似乎聽見有什麼東西在移動的聲音。

			sleep ( 30 )
			local Goblin = CreateObjByFlag( 100098 , 780023 , Step ,1 ) --代100098
			Func_rand_walker(Goblin,300, 10 ) --讓怪物不會出現在腳印上
			sleep(30)
			AddToPartition( Goblin , 0 )
			BeginPlot( Goblin , "LuaQ_420226_Sui" , 0)
			SetAttack( Goblin , OwnerID() )
			DelBodyItem( OwnerID() , 200676 , 1 )
		elseif Check == 1 then
			Say ( OwnerID() , GetString("EM_420226_6") )	-- 看來就是這隻怪物了！
		else
			Say ( OwnerID() , GetString("EM_420226_5") )	-- 這裡沒有獵人所敘述的足跡。
		end		
	end
end
------------------------------------------------------------------------------------
function LuaQ_420226_Sui()
	LuaFunc_Obj_Suicide(300)
end
------------------------------------------------------------------------------------
function LuaS_200677_0() --奇異的藥劑
	local Str = "["..GetUseItemGUID(OwnerID()).."]"
	ClearBorder( OwnerID() );
	AddBorderPage( OwnerID(), GetQuestDetail( 420223, 1  ) );

	ShowBorder( OwnerID(), 420223,Str , "ScriptBorder_Texture_Paper" );	

end
-----------------------------------------------------------------------------
function LuaI_100098_Dead()
	local Player = LuaFunc_PartyData(TargetID())
	for i = 1 , Player[0] , 1 do
		if CheckAcceptQuest( Player[i] , 420223) == false and CountBodyItem( Player[i] , 200677) == 0 then
			GiveBodyItem( Player[i] , 200677, 1 )
		end
	end
	return true
end