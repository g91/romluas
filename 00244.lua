function LuaQ_420236_Complet()

	DisableQuest( OwnerID() , true )
	--把柯琳娜的ID找出來
	local Corinna = LuaFunc_SearchNPCbyOrgID( OwnerID() , 110043 , 150 )
	--結束
	AdjustFaceDir( OwnerID(), Corinna , 0 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_BEGIN )
	sleep( 30 )
	CastSpell( OwnerID(),OwnerID(),490098) --施法特效
	sleep( 10 )
	PlayMotion( OwnerID(),ruFUSION_ACTORSTATE_CRAFTING_END )
	sleep( 20 )
	Say( Corinna , GetString("SAY_110043_0") ) --/*咳咳……亞克你這個白痴……我口好渴……
	sleep( 20 )
	Say( OwnerID() , GetString("SAY_110042_0") ) --/*太好了！她有反應了！
	sleep( 20 )
	AdjustFaceDir( OwnerID(), TargetID(), 0 )
	Say( OwnerID() , GetString("SAY_110042_1") ) --/*接下來只要讓她好好休養就能恢復了吧這一切多虧你的幫助，謝謝。
	sleep( 10 )
	DisableQuest( OwnerID() , false )

end
-------------------------------------------------------------------------------------------
function LuaQ_420236_Item(Option) -- 使用物品後會執行的劇情
	local Things = CountBodyItem( OwnerID() , 200685 )
	if Option == "CHECK" then
		if Things >= 20 and CountBodyItem( OwnerID() , 200690 ) == 0 then
			return true
		elseif Things < 20 and  CountBodyItem( OwnerID() , 200690 ) == 0 then
			ScriptMessage( OwnerID(), OwnerID(), 0, GetString("EM_COM_LESS"), 0 ); --/*缺少物品。
			return false
		else
			return false
		end
	elseif Option == "USE" then
		DelBodyItem( OwnerID() , 200685 , Things )
--		DelBodyItem( OwnerID() , 200684 , 1 )		
		GiveBodyItem( OwnerID() , 200690 , 1 )
	end
	
end
	