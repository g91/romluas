-----------------------------------------------------426689破損的橋面
--對角色使用物品
--123043 碎裂的木塊
--243029 木工工具包
--243050腐朽的木板
function lua_Z28_123043_1()
	if CountBodyItem( OwnerID(),243029 ) > 0 then--木工工具包
		return true
	else
		--：糟糕！身上沒有修理用的工具......
		ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1]", 0 )
		return false
	end
end
function lua_Z28_123043_1_1()
		--機率表
		local num =Rand( 100 )
		--Say( OwnerID(),num)
		PlayMotion(OwnerID(),ruFUSION_ACTORSTATE_MINING_BEGIN)
		Sleep(20)
		if num>= 30 then
			--成功取下已經腐朽的木塊，並換上全新的木板
			--ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1_1]", 0 )
			Say( OwnerID(), "[SC_123043_1_1]" )
			GiveBodyItem( OwnerID(), 243050, 1 )
		----1/3失敗
		else
			--唉啊！腐朽的木塊被你一壓，完全卡住，取不出來了！
			--ScriptMessage( OwnerID(), OwnerID(), 2, "[SC_123043_1_2]", 0 )
			Say( OwnerID(), "[SC_123043_1_2]" )
		end
		return 1
end