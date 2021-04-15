
function LuaS_421237_0()
	if CountBodyItem( OwnerID() , 202400) > 0 then
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421237_1") , 0 )	--你挖開土堆並點燃火種……
		return true
	else
		ScriptMessage( OwnerID() , OwnerID() , 1 , GetString("SC_421237_0") , 0 )	--你已經沒有火種了！
		return false
	end
end

function LuaS_421237_1()
	DelBodyItem(OwnerID(),202400,1)
	ScriptMessage( OwnerID() , OwnerID() , 2 , GetString("SC_421237_2") , 0 )	--你將點燃的火種放進挖開的土堆……
	local Target = LuaFunc_CreateObjByObj ( 111229 , TargetID() )
	AddToPartition( Target , 0 )
	BeginPlot(TargetID() , "LuaS_421237_3" , 0 )
	BeginPlot(Target , "LuaS_421237_2" , 0)--七秒後，此光碟將會自動銷毀。
	return 1
end

function LuaS_421237_2()
	sleep(70)
	DelObj(OwnerID())
end

function LuaS_421237_3()
	ReSetNPCInfo( OwnerID() )
end